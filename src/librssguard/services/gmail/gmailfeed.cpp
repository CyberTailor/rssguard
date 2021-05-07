// For license of this file, see <project-root-folder>/LICENSE.md.

#include "services/gmail/gmailfeed.h"

#include "miscellaneous/application.h"
#include "miscellaneous/iconfactory.h"
#include "services/gmail/definitions.h"
#include "services/gmail/gmailnetworkfactory.h"
#include "services/gmail/gmailserviceroot.h"

GmailFeed::GmailFeed(RootItem* parent) : Feed(parent) {}

GmailFeed::GmailFeed(const QString& title, const QString& custom_id, const QIcon& icon, RootItem* parent) : GmailFeed(parent) {
  setTitle(title);
  setCustomId(custom_id);
  setIcon(icon);
}

GmailServiceRoot* GmailFeed::serviceRoot() const {
  return qobject_cast<GmailServiceRoot*>(getParentServiceRoot());
}

QList<Message> GmailFeed::obtainNewMessages(bool* error_during_obtaining) {
  Feed::Status error = Feed::Status::Normal;
  QList<Message> messages = serviceRoot()->network()->messages(customId(), error, getParentServiceRoot()->networkProxy());

  setStatus(error);

  if (error == Feed::Status::NetworkError || error == Feed::Status::AuthError || error == Feed::Status::ParsingError) {
    *error_during_obtaining = true;
  }

  return messages;
}
