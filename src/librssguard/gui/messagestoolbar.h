// For license of this file, see <project-root-folder>/LICENSE.md.

#ifndef NEWSTOOLBAR_H
#define NEWSTOOLBAR_H

#include "gui/basetoolbar.h"

#include "core/messagesmodel.h"

class BaseLineEdit;
class QWidgetAction;
class QToolButton;
class QMenu;

class MessagesToolBar : public BaseToolBar {
  Q_OBJECT

  public:
    explicit MessagesToolBar(const QString& title, QWidget* parent = nullptr);

    BaseLineEdit* searchLineEdit();

    virtual QList<QAction*> availableActions() const;
    virtual QList<QAction*> activatedActions() const;
    virtual void saveAndSetActions(const QStringList& actions);
    virtual void loadSpecificActions(const QList<QAction*>& actions, bool initial_load = false);
    virtual QList<QAction*> convertActions(const QStringList& actions);
    virtual QStringList defaultActions() const;
    virtual QStringList savedActions() const;

  signals:
    void messageSearchPatternChanged(const QString& pattern);
    void messageFilterChanged(MessagesModel::MessageHighlighter filter);

  private slots:
    void handleMessageHighlighterChange(QAction* action);

  private:
    void initializeSearchBox();
    void initializeHighlighter();

  private:
    QWidgetAction* m_actionMessageHighlighter;
    QToolButton* m_btnMessageHighlighter;
    QMenu* m_menuMessageHighlighter;
    QWidgetAction* m_actionSearchMessages;
    BaseLineEdit* m_txtSearchMessages;
};

inline BaseLineEdit* MessagesToolBar::searchLineEdit() {
  return m_txtSearchMessages;
}

#endif // NEWSTOOLBAR_H
