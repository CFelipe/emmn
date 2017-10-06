#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QItemSelection>
#include <QStringListModel>
#include <QStandardItemModel>
#include "trackerlistmodel.h"
#include "addtrackerdialog.h"
#include "settingsdialog.h"
#include "manualcontroldialog.h"
#include "tracker.h"
#include "helpers.h"
#include "network.h"
#include "control.h"

namespace Ui {
class MainWindow;
}

//! Janela principal
class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    explicit MainWindow(QWidget *parent = 0);

    /*! \brief Habilita botões de manipulação de satélite (prioridade, edição, remoção)
     */
    void enableSatelliteButtons(bool enable = true);

    ~MainWindow();

private:
    Ui::MainWindow* ui; //! Ponteiro para elementos de interface gráfica do arquivo .ui
    TrackerListModel* model; //! Lista de todos os satélites rastreados
    QTimer satInfoTimer; //! Timer para recarregar informações do satélite todo segundo
    QStandardItemModel* tableModel; //! Elementos de tabela de passagens
    //Network network; //! Conexão com a Internet
    Control* control; //! Controle da antena

    void setPortFromSettings();
    void loadTrackersFromSettings();
    QString betterDate(DateTime datetime);

public slots:
    /*! \brief Slot chamado automaticamente ao selecionar-se um satélite
     *
     * Atualiza tabela baseado no satélite selecionado na lista de satélites
     */
   void rowChangedSlot(QItemSelection selected, QItemSelection);

    /*! \brief Slot chamado ao clicar no botão de adicionar satélite
     */
   void addTrackerDialogSlot();

    /*! \brief Slot chamado ao clicar em Arquivo > Configurações
     */
   void settingsDialogSlot(bool);

    /*! \brief Slot chamado ao clicar em Arquivo > Controle manual
     */
   void manualControlDialogSlot(bool);

    /*! \brief Slot chamado ao clicar em Arquivo > Debug
     *
     * Para testes em geral.
     */
   void debugarSlot(bool);

    /*! \brief Slot chamado ao selecionar um satélite e clicar em Editar
     */
   void editSelectedTrackerSlot();

    /*! \brief Slot chamado ao selecionar um satélite e clicar em Remover
     */
   void removeSelectedTrackerSlot();

    /*! \brief Slot chamado periodicamente para atualizar informações do satélite selecionado
     */
   void satInfoUpdateSlot();

    /*! \brief Slot chamado ao clicar em Mostrar todas as passagens
     */
   void clearSelectedTrackerSlot();

    /*! \brief Slot chamado ao clicar no botão de aumentar prioridade
     */
   void moveTrackerUpSlot();

    /*! \brief Slot chamado ao clicar no botão de baixar prioridade
     */
   void moveTrackerDownSlot();
};

#endif // MAINWINDOW_H
