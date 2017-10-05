#include "tracker.h"
#include "network.h"
#include "helpers.h"
#include <QDebug>

Tracker::Tracker()
    : user_geo(-5.7793, -35.201, 0.014)
    , tle1("")
    , tle2("")
    , tle3("")
{
}

Tracker::Tracker(std::vector<std::string> tle_list)
    : user_geo(-5.7793, -35.201, 0.014)
    , tle1(QString::fromStdString(tle_list[0]))
    , tle2(QString::fromStdString(tle_list[1]))
    , tle3(QString::fromStdString(tle_list[2]))
{
}

Tracker::Tracker(QList<QString> tle_list)
    : user_geo(-5.7793, -35.201, 0.014)
    , tle1(tle_list[0])
    , tle2(tle_list[1])
    , tle3(tle_list[2])
{
}

Tracker::Tracker(std::string tle1, std::string tle2, std::string tle3)
    : user_geo(-5.7793, -35.201, 0.014)
    , tle1(QString::fromStdString(tle1))
    , tle2(QString::fromStdString(tle2))
    , tle3(QString::fromStdString(tle3))
{
}

void Tracker::UpdateTLE() {
}

void Tracker::setTle(QList<QString> tle) {
    tle1 = tle[0];
    qDebug() << tle[0];
    tle2 = tle[1];
    tle3 = tle[2];
    qDebug() << tle1;
}

QString Tracker::getSatInfo(int info) const {
    const double PI = 3.141592653589793238463;
    SGP4 sgp4(Tle(tle1.toStdString(), tle2.toStdString(), tle3.toStdString()));
    Eci eci = sgp4.FindPosition(DateTime::Now());
    Observer obs(user_geo);
    switch(info) {
        case Satellite::Elevation:
            return QString::number(obs.GetLookAngle(eci).elevation * 180 / PI);
        case Satellite::Azimuth:
            return QString::number(obs.GetLookAngle(eci).azimuth * 180 / PI);
        case Satellite::Range:
            return QString::number(obs.GetLookAngle(eci).range);
    }
    return QString("");
}

double Tracker::FindMaxElevation(
        const DateTime& aos,
        const DateTime& los) const
{
    Observer obs(user_geo);
    SGP4 sgp4(Tle(tle1.toStdString(), tle2.toStdString(), tle3.toStdString()));

    bool running;

    double time_step = (los - aos).TotalSeconds() / 9.0;
    DateTime current_time(aos); //! current time
    DateTime time1(aos); //! start time of search period
    DateTime time2(los); //! end time of search period
    double max_elevation; //! max elevation

    running = true;

    do {
        running = true;
        max_elevation = -99999999999999.0;
        while (running && current_time < time2)
        {
            /*
             * find position
             */
            Eci eci = sgp4.FindPosition(current_time);
            CoordTopocentric topo = obs.GetLookAngle(eci);

            if (topo.elevation > max_elevation)
            {
                /*
                 * still going up
                 */
                max_elevation = topo.elevation;
                /*
                 * move time along
                 */
                current_time = current_time.AddSeconds(time_step);
                if (current_time > time2)
                {
                    /*
                     * dont go past end time
                     */
                    current_time = time2;
                }
            }
            else
            {
                /*
                 * stop
                 */
                running = false;
            }
        }

        /*
         * make start time to 2 time steps back
         */
        time1 = current_time.AddSeconds(-2.0 * time_step);
        /*
         * make end time to current time
         */
        time2 = current_time;
        /*
         * current time to start time
         */
        current_time = time1;
        /*
         * recalculate time step
         */
        time_step = (time2 - time1).TotalSeconds() / 9.0;
    } while (time_step > 1.0);

    return max_elevation;
}

bool Tracker::IsPassReverse(PassDetails pd) const
{
    Observer obs(user_geo);
    SGP4 sgp4(Tle(tle1.toStdString(), tle2.toStdString(), tle3.toStdString()));

    double time_step = 60; // in seconds
    DateTime current_time(pd.aos);
    double prevAz = -1;

    while(current_time < pd.los) {
        Eci eci = sgp4.FindPosition(current_time);
        CoordTopocentric topo = obs.GetLookAngle(eci);

        if(prevAz != -1) {
            if(fabs(Helpers::radToDeg(topo.azimuth) - prevAz) > 180) {
                return true;
            }
        }

        prevAz = Helpers::radToDeg(topo.azimuth);
        current_time = current_time.AddSeconds(time_step);
    }

    return false;
}

DateTime Tracker::FindCrossingPoint(
        const DateTime& initial_time1,
        const DateTime& initial_time2,
        bool finding_aos) const
{
    Observer obs(user_geo);
    SGP4 sgp4(Tle(tle1.toStdString(), tle2.toStdString(), tle3.toStdString()));

    bool running;
    int cnt;

    DateTime time1(initial_time1);
    DateTime time2(initial_time2);
    DateTime middle_time;

    running = true;
    cnt = 0;
    while (running && cnt++ < 16)
    {
        middle_time = time1.AddSeconds((time2 - time1).TotalSeconds() / 2.0);
        /*
         * calculate satellite position
         */
        Eci eci = sgp4.FindPosition(middle_time);
        CoordTopocentric topo = obs.GetLookAngle(eci);

        if (topo.elevation > 0.0) {
            /*
             * satellite above horizon
             */
            if (finding_aos) {
                time2 = middle_time;
            } else {
                time1 = middle_time;
            }
        } else {
            if (finding_aos) {
                time1 = middle_time;
            } else {
                time2 = middle_time;
            }
        }

        if ((time2 - time1).TotalSeconds() < 1.0) {
            /*
             * two times are within a second, stop
             */
            running = false;
            /*
             * remove microseconds
             */
            int us = middle_time.Microsecond();
            middle_time = middle_time.AddMicroseconds(-us);
            /*
             * step back into the pass by 1 second
             */
            middle_time = middle_time.AddSeconds(finding_aos ? 1 : -1);
        }
    }

    /*
     * go back/forward 1second until below the horizon
     */
    running = true;
    cnt = 0;
    while (running && cnt++ < 6) {
        Eci eci = sgp4.FindPosition(middle_time);
        CoordTopocentric topo = obs.GetLookAngle(eci);
        if (topo.elevation > 0) {
            middle_time = middle_time.AddSeconds(finding_aos ? -1 : 1);
        } else {
            running = false;
        }
    }

    return middle_time;
}

QList<PassDetails> Tracker::GeneratePassList(
        const DateTime& start_time,
        const DateTime& end_time,
        const int time_step) const
{
    QList<PassDetails> pass_list;

    Observer obs(user_geo);
    SGP4 sgp4(Tle(tle1.toStdString(), tle2.toStdString(), tle3.toStdString()));

    DateTime aos_time;
    DateTime los_time;

    bool found_aos = false;

    DateTime previous_time(start_time);
    DateTime current_time(start_time);

    while (current_time < end_time) {
        bool end_of_pass = false;

        /*
         * calculate satellite position
         */
        Eci eci = sgp4.FindPosition(current_time);
        CoordTopocentric topo = obs.GetLookAngle(eci);

        if (!found_aos && topo.elevation > 0.0) {
            /*
             * aos hasnt occured yet, but the satellite is now above horizon
             * this must have occured within the last time_step
             */

            if (start_time == current_time) {
                /*
                 * satellite was already above the horizon at the start,
                 * so use the start time
                 */

                DateTime real_start = start_time.AddMicroseconds(-start_time.Microsecond());

                float elevation = topo.elevation;
                while(elevation > 0) {
                    real_start = real_start.AddSeconds(-1);
                    Eci eci2 = sgp4.FindPosition(real_start);
                    CoordTopocentric topo2 = obs.GetLookAngle(eci2);
                    elevation = topo2.elevation;
                }
                aos_time = real_start;
            } else {
                /*
                 * find the point at which the satellite crossed the horizon
                 */
                aos_time = FindCrossingPoint(
                        previous_time,
                        current_time,
                        true);
            }
            found_aos = true;
        } else if (found_aos && topo.elevation < 0.0) {
            found_aos = false;
            /*
             * end of pass, so move along more than time_step
             */
            end_of_pass = true;
            /*
             * already have the aos, but now the satellite is below the horizon,
             * so find the los
             */
            los_time = FindCrossingPoint(
                    previous_time,
                    current_time,
                    false);
            //qDebug() << QString::fromStdString(los_time.ToString());

            if(los_time.Microsecond() != 0) {
                qDebug() << QString::fromStdString(los_time.ToString());
            }

            if((los_time - aos_time).Microseconds() != 0) {
                qDebug() << "Q";
            }
            DateTime real_los = los_time.AddMicroseconds(-los_time.Microsecond());
            //qDebug() << QString::fromStdString(real_los.ToString());
            //while(true) {
            //    Eci eci2 = sgp4.FindPosition(real_los);
            //    CoordTopocentric topo2 = obs.GetLookAngle(eci2);
            //    float elevation = topo2.elevation;
            //    if(elevation > 0) {
            //        real_los = real_los.AddSeconds(1);
            //    } else {
            //        break;
            //    }
            //}
            los_time = real_los;

            PassDetails pd;
            pd.aos = aos_time;
            pd.los = los_time;
            pd.max_elevation = FindMaxElevation(
                    aos_time,
                    los_time);
            pd.reverse = IsPassReverse(pd);

            pass_list.push_back(pd);
        }

        /*
         * save current time
         */
        previous_time = current_time;

        if (end_of_pass) {
            /*
             * at the end of the pass move the time along by 30mins
             */
            current_time = current_time + TimeSpan(0, 30, 0);
        } else {
            /*
             * move the time along by the time step value
             */
            current_time = current_time + TimeSpan(0, 0, time_step);
        }

        if (current_time > end_time) {
            /*
             * dont go past end time
             */
            current_time = end_time;
        }
    };

    if (found_aos) {
        /*
         * satellite still above horizon at end of search period, so use end
         * time as los
         */
        PassDetails pd;
        pd.aos = aos_time;
        pd.los = end_time;
        pd.max_elevation = FindMaxElevation(aos_time, end_time);

        pass_list.push_back(pd);
    }

    return pass_list;
}

double Tracker::getAzimuthForObserver() {
    Observer obs(user_geo);
    SGP4 sgp4(Tle(tle1.toStdString(), tle2.toStdString(), tle3.toStdString()));
    Eci eci = sgp4.FindPosition(DateTime::Now().AddSeconds(1));
    CoordTopocentric topo = obs.GetLookAngle(eci);
    return Helpers::radToDeg(topo.azimuth);
}

double Tracker::getElevationForObserver() {
    Observer obs(user_geo);
    SGP4 sgp4(Tle(tle1.toStdString(), tle2.toStdString(), tle3.toStdString()));
    Eci eci = sgp4.FindPosition(DateTime::Now().AddSeconds(1));
    CoordTopocentric topo = obs.GetLookAngle(eci);
    return Helpers::radToDeg(topo.elevation);
}

QString Tracker::nextPass() const {
    if(getSatInfo(Elevation).toDouble() < 0) {
        return QString::fromStdString((GeneratePassList()[0].aos - DateTime::Now()).ToString());
    } else {
        return QString("Passando");
    }
}

QString Tracker::getFullTLE() const {
    QStringList tle;
    tle << tle1 << tle2 << tle3;
    return tle.join("\n");
}

QString Tracker::getTitle() const {
    return tle1.trimmed();
}

QDataStream &operator <<(QDataStream &stream, const Tracker &val) {
    //CoordGeodetic user_geo;
    stream << val.tle1;
    stream << val.tle2;
    stream << val.tle3;
    return stream;
}

QDataStream &operator >>(QDataStream &stream, Tracker &val) {
    stream >> val.tle1;
    stream >> val.tle2;
    stream >> val.tle3;
    return stream;
}