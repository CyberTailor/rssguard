#include <QSqlRecord>
#include <QSqlError>
#include <QSqlQuery>

#include "qtsingleapplication/qtsingleapplication.h"

#include "core/defs.h"
#include "core/messagesmodel.h"
#include "core/databasefactory.h"
#include "gui/iconthemefactory.h"


MessagesModel::MessagesModel(QObject *parent)
  : QAbstractItemModel(parent) {
  setObjectName("MessagesModel");

  QSqlDatabase d = DatabaseFactory::getInstance()->addConnection("MessagesModel2");
  QSqlQuery prikaz = d.exec("SELECT id, read, deleted, important, "
                            "title, url, author, date_created, "
                            "date_updated, contents FROM Messages;");

  m_columnMappings.insert(MSG_MODEL_READ_INDEX, MSG_DB_READ_INDEX);
  m_columnMappings.insert(MSG_MODEL_IMPORTANT_INDEX, MSG_DB_IMPORTANT_INDEX);
  m_columnMappings.insert(MSG_MODEL_TITLE_INDEX, MSG_DB_TITLE_INDEX);
  m_columnMappings.insert(MSG_MODEL_AUTHOR_INDEX, MSG_DB_AUTHOR_INDEX);
  m_columnMappings.insert(MSG_MODEL_DCREATED_INDEX, MSG_DB_DCREATED_INDEX);
  m_columnMappings.insert(MSG_MODEL_DUPDATED_INDEX, MSG_DB_DUPDATED_INDEX);


  QList<Message> list;
  while (prikaz.next()) {
    Message mess;
    mess.m_data.append(prikaz.value(MSG_DB_ID_INDEX).toInt());
    mess.m_data.append(prikaz.value(MSG_DB_READ_INDEX).toInt());
    mess.m_data.append(prikaz.value(MSG_DB_DELETED_INDEX).toInt());
    mess.m_data.append(prikaz.value(MSG_DB_IMPORTANT_INDEX).toInt());
    mess.m_data.append(prikaz.value(MSG_DB_TITLE_INDEX).toString());
    mess.m_data.append(prikaz.value(MSG_DB_URL_INDEX).toString());
    mess.m_data.append(prikaz.value(MSG_DB_AUTHOR_INDEX).toString());
    mess.m_data.append(prikaz.value(MSG_DB_DCREATED_INDEX).toString());
    mess.m_data.append(prikaz.value(MSG_DB_DUPDATED_INDEX).toString());
    mess.m_data.append(prikaz.value(MSG_DB_CONTENTS_INDEX).toString());

    list.append(mess);
  }
  m_messages = list;

  setupFonts();
  setupHeaderData();
}

MessagesModel::~MessagesModel() {
  qDebug("Destroying MessagesModel instance.");
}

void MessagesModel::setupFonts() {
  m_normalFont = QtSingleApplication::font("MessagesView");
  m_boldFont = m_normalFont;
  m_boldFont.setBold(true);
}

void MessagesModel::setupHeaderData() {
  m_headerData << tr("Read") << tr("Important") <<
                  tr("Title") << tr("Author") <<
                  tr("Created on") << tr("Updated on");
}

Qt::ItemFlags MessagesModel::flags(const QModelIndex &index) const {
  Q_UNUSED(index);

  // Each item can be selected and is enabled.
  return Qt::ItemIsSelectable | Qt::ItemIsEnabled;
}

int MessagesModel::rowCount(const QModelIndex &parent) const {
  Q_UNUSED(parent);

  return m_messages.count();
}

int MessagesModel::columnCount(const QModelIndex &parent) const {
  Q_UNUSED(parent);

  return m_headerData.count();
}

QModelIndex MessagesModel::parent(const QModelIndex &child) const {
  Q_UNUSED(child);

  return QModelIndex();
}

QModelIndex MessagesModel::index(int row, int column,
                                 const QModelIndex &parent) const {
  Q_UNUSED(parent);

  return createIndex(row, column);
}

QVariant MessagesModel::headerData(int section,
                                   Qt::Orientation orientation,
                                   int role) const {
  Q_UNUSED(orientation);

  // TODO: Ehance this with graphics and other roles.

  switch (role) {
    case Qt::DisplayRole:
    case Qt::ToolTipRole:
    case Qt::EditRole:
      return m_headerData.at(section);

    default:
      return QVariant();
  }
}

QVariant MessagesModel::data(const QModelIndex &index, int role) const {
  // TODO: Return ISO date on EditRole and human readable date on
  // DisplayRole. EditRole is used for sorting (and ISO date can be
  // sorted as a string.

  switch (role) {
    case Qt::EditRole:
      // Just return RAW data.
      return m_messages.at(index.row()).m_data.at(m_columnMappings[index.column()]);

    case Qt::DisplayRole: {
      int real_column = m_columnMappings[index.column()];

      if (real_column != MSG_DB_IMPORTANT_INDEX) {
        return m_messages.at(index.row()).m_data.at(real_column);
      }
      else {
        return QVariant();
      }
    }


    case Qt::FontRole:
      return m_messages.at(index.row()).m_data.at(m_columnMappings[MSG_MODEL_READ_INDEX]).toInt() == 1 ?
            m_normalFont :
            m_boldFont;

    case Qt::DecorationRole:/*
      if (index.column() == 0 && m_messages[index.row()].m_important == 1) {
        return IconThemeFactory::getInstance()->fromTheme("zoom-fit-best");
      }
      else {
        return QVariant();
      }*/

    default:
      return QVariant();
  }
}

bool MessagesModel::setData(const QModelIndex &index, const QVariant &value,
                            int role) {
  Q_UNUSED(role);

  m_messages[index.row()].m_data[m_columnMappings[index.column()]] = value;

  QModelIndex left = this->index(index.row(), 0);
  QModelIndex right = this->index(index.row(), columnCount() - 1);

  emit dataChanged(left, right);
  return true;
}

bool MessagesModel::setData(int row, int column, const QVariant &value) {
  return setData(index(row, column), value);
}

void MessagesModel::setMessageRead(int row_index, int read) {
  //int read_column = fieldIndex("read");
  //blockSignals(true);


  if (m_messages.at(row_index).m_data.at(MSG_DB_READ_INDEX).toInt() != read) {
    // Old "read" status of this message differs from
    // the new status, update it.
    setData(row_index, MSG_MODEL_READ_INDEX, read);
  }


  //blockSignals(false);
  //submitAll();
  //emit dataChanged(index(message_row_index, 0), index(message_row_index, columnCount()));
}

