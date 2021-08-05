// For license of this file, see <project-root-folder>/LICENSE.md.

#ifndef GREADERACCOUNTDETAILS_H
#define GREADERACCOUNTDETAILS_H

#include <QWidget>

#include "ui_greaderaccountdetails.h"

#include "services/greader/greaderserviceroot.h"

#include <QNetworkProxy>

class OAuth2Service;

class GreaderAccountDetails : public QWidget {
  Q_OBJECT

  friend class FormEditGreaderAccount;

  public:
    explicit GreaderAccountDetails(QWidget* parent = nullptr);

    GreaderServiceRoot::Service service() const;
    void setService(GreaderServiceRoot::Service service);

  private slots:
    void displayPassword(bool display);
    void performTest(const QNetworkProxy& custom_proxy);
    void onUsernameChanged();
    void onPasswordChanged();
    void onUrlChanged();
    void fillPredefinedUrl();
    void checkOAuthValue(const QString& value);
    void registerApi();
    void onAuthFailed();
    void onAuthError(const QString& error, const QString& detailed_description);
    void onAuthGranted();

  private:
    void hookNetwork();

  private:
    Ui::GreaderAccountDetails m_ui;

    // Testing OAuth service. This object is not ever copied
    // to new living account instance, instead only its properties
    // like tokens are copied.
    // If editing existing account, then the pointer points
    // directly to existing OAuth from the account.
    OAuth2Service* m_oauth;
    QNetworkProxy m_lastProxy;
};

#endif // GREADERACCOUNTDETAILS_H
