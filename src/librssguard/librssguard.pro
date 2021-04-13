TEMPLATE = lib

unix|mac|os2 {
  TARGET = rssguard
}
else {
  TARGET = librssguard
}

MSG_PREFIX  = "librssguard"
APP_TYPE    = "core library"

include(../../pri/vars.pri)
include(../../pri/defs.pri)

message($$MSG_PREFIX: Shadow copy build directory \"$$OUT_PWD\".)
message($$MSG_PREFIX: $$APP_NAME version is: \"$$APP_VERSION\".)
message($$MSG_PREFIX: Detected Qt version: \"$$QT_VERSION\".)
message($$MSG_PREFIX: Build destination directory: \"$$DESTDIR\".)
message($$MSG_PREFIX: Build revision: \"$$APP_REVISION\".)
message($$MSG_PREFIX: lrelease executable name: \"$$LRELEASE\".)

include(../../pri/build_opts.pri)

DEFINES *= RSSGUARD_DLLSPEC=Q_DECL_EXPORT
CONFIG += unversioned_libname unversioned_soname skip_target_version_ext

RESOURCES += ../../resources/sql.qrc \
             ../../resources/rssguard.qrc

mac|os2|win32 {
  RESOURCES += ../../resources/icons.qrc
}

HEADERS += core/feeddownloader.h \
           core/feedsmodel.h \
           core/feedsproxymodel.h \
           core/filterutils.h \
           core/message.h \
           core/messagefilter.h \
           core/messageobject.h \
           core/messagesforfiltersmodel.h \
           core/messagesmodel.h \
           core/messagesmodelcache.h \
           core/messagesmodelsqllayer.h \
           core/messagesproxymodel.h \
           database/databasecleaner.h \
           database/databasedriver.h \
           database/databasefactory.h \
           database/databasequeries.h \
           database/mariadbdriver.h \
           database/sqlitedriver.h \
           definitions/definitions.h \
           definitions/typedefs.h \
           dynamic-shortcuts/dynamicshortcuts.h \
           dynamic-shortcuts/dynamicshortcutswidget.h \
           dynamic-shortcuts/shortcutcatcher.h \
           exceptions/applicationexception.h \
           exceptions/filteringexception.h \
           exceptions/ioexception.h \
           exceptions/networkexception.h \
           exceptions/scriptexception.h \
           gui/baselineedit.h \
           gui/basetoolbar.h \
           gui/colortoolbutton.h \
           gui/comboboxwithstatus.h \
           gui/dialogs/formabout.h \
           gui/dialogs/formaddaccount.h \
           gui/dialogs/formaddeditlabel.h \
           gui/dialogs/formbackupdatabasesettings.h \
           gui/dialogs/formdatabasecleanup.h \
           gui/dialogs/formmain.h \
           gui/dialogs/formmessagefiltersmanager.h \
           gui/dialogs/formrestoredatabasesettings.h \
           gui/dialogs/formsettings.h \
           gui/dialogs/formupdate.h \
           gui/edittableview.h \
           gui/feedmessageviewer.h \
           gui/feedstoolbar.h \
           gui/feedsview.h \
           gui/guiutilities.h \
           gui/labelsmenu.h \
           gui/labelwithstatus.h \
           gui/lineeditwithstatus.h \
           gui/messagebox.h \
           gui/messagecountspinbox.h \
           gui/messagepreviewer.h \
           gui/messagestoolbar.h \
           gui/messagesview.h \
           gui/networkproxydetails.h \
           gui/newspaperpreviewer.h \
           gui/nonclosablemenu.h \
           gui/plaintoolbutton.h \
           gui/searchtextwidget.h \
           gui/settings/settingsbrowsermail.h \
           gui/settings/settingsdatabase.h \
           gui/settings/settingsdownloads.h \
           gui/settings/settingsfeedsmessages.h \
           gui/settings/settingsgeneral.h \
           gui/settings/settingsgui.h \
           gui/settings/settingslocalization.h \
           gui/settings/settingspanel.h \
           gui/settings/settingsshortcuts.h \
           gui/squeezelabel.h \
           gui/statusbar.h \
           gui/styleditemdelegatewithoutfocus.h \
           gui/systemtrayicon.h \
           gui/tabbar.h \
           gui/tabcontent.h \
           gui/tabwidget.h \
           gui/timespinbox.h \
           gui/toolbareditor.h \
           gui/treeviewcolumnsmenu.h \
           gui/widgetwithstatus.h \
           miscellaneous/application.h \
           miscellaneous/autosaver.h \
           miscellaneous/externaltool.h \
           miscellaneous/feedreader.h \
           miscellaneous/iconfactory.h \
           miscellaneous/iofactory.h \
           miscellaneous/localization.h \
           miscellaneous/mutex.h \
           miscellaneous/regexfactory.h \
           miscellaneous/settings.h \
           miscellaneous/settingsproperties.h \
           miscellaneous/skinfactory.h \
           miscellaneous/systemfactory.h \
           miscellaneous/templates.h \
           miscellaneous/textfactory.h \
           network-web/basenetworkaccessmanager.h \
           network-web/cookiejar.h \
           network-web/downloader.h \
           network-web/downloadmanager.h \
           network-web/httpresponse.h \
           network-web/networkfactory.h \
           network-web/oauth2service.h \
           network-web/oauthhttphandler.h \
           network-web/silentnetworkaccessmanager.h \
           network-web/webfactory.h \
           services/abstract/accountcheckmodel.h \
           services/abstract/cacheforserviceroot.h \
           services/abstract/category.h \
           services/abstract/feed.h \
           services/abstract/gui/authenticationdetails.h \
           services/abstract/gui/formaccountdetails.h \
           services/abstract/gui/formcategorydetails.h \
           services/abstract/gui/formfeeddetails.h \
           services/abstract/importantnode.h \
           services/abstract/label.h \
           services/abstract/labelsnode.h \
           services/abstract/recyclebin.h \
           services/abstract/rootitem.h \
           services/abstract/serviceentrypoint.h \
           services/abstract/serviceroot.h \
           services/abstract/unreadnode.h \
           services/feedly/definitions.h \
           services/feedly/feedlyentrypoint.h \
           services/feedly/feedlynetwork.h \
           services/feedly/feedlyserviceroot.h \
           services/feedly/gui/feedlyaccountdetails.h \
           services/feedly/gui/formeditfeedlyaccount.h \
           services/gmail/definitions.h \
           services/gmail/gmailentrypoint.h \
           services/gmail/gmailnetworkfactory.h \
           services/gmail/gmailserviceroot.h \
           services/gmail/gui/emailrecipientcontrol.h \
           services/gmail/gui/formaddeditemail.h \
           services/gmail/gui/formdownloadattachment.h \
           services/gmail/gui/formeditgmailaccount.h \
           services/gmail/gui/gmailaccountdetails.h \
           services/greader/definitions.h \
           services/greader/greaderentrypoint.h \
           services/greader/greadernetwork.h \
           services/greader/greaderserviceroot.h \
           services/greader/gui/formeditgreaderaccount.h \
           services/greader/gui/greaderaccountdetails.h \
           services/inoreader/definitions.h \
           services/inoreader/gui/formeditinoreaderaccount.h \
           services/inoreader/gui/inoreaderaccountdetails.h \
           services/inoreader/inoreaderentrypoint.h \
           services/inoreader/inoreadernetworkfactory.h \
           services/inoreader/inoreaderserviceroot.h \
           services/owncloud/definitions.h \
           services/owncloud/gui/formeditowncloudaccount.h \
           services/owncloud/gui/owncloudaccountdetails.h \
           services/owncloud/owncloudfeed.h \
           services/owncloud/owncloudnetworkfactory.h \
           services/owncloud/owncloudserviceentrypoint.h \
           services/owncloud/owncloudserviceroot.h \
           services/standard/atomparser.h \
           services/standard/definitions.h \
           services/standard/feedparser.h \
           services/standard/gui/formeditstandardaccount.h \
           services/standard/gui/formstandardfeeddetails.h \
           services/standard/gui/formstandardimportexport.h \
           services/standard/gui/standardfeeddetails.h \
           services/standard/jsonparser.h \
           services/standard/rdfparser.h \
           services/standard/rssparser.h \
           services/standard/standardcategory.h \
           services/standard/standardfeed.h \
           services/standard/standardfeedsimportexportmodel.h \
           services/standard/standardserviceentrypoint.h \
           services/standard/standardserviceroot.h \
           services/tt-rss/definitions.h \
           services/tt-rss/gui/formeditttrssaccount.h \
           services/tt-rss/gui/formttrssfeeddetails.h \
           services/tt-rss/gui/ttrssaccountdetails.h \
           services/tt-rss/gui/ttrssfeeddetails.h \
           services/tt-rss/ttrssfeed.h \
           services/tt-rss/ttrssnetworkfactory.h \
           services/tt-rss/ttrssserviceentrypoint.h \
           services/tt-rss/ttrssserviceroot.h

SOURCES += core/feeddownloader.cpp \
           core/feedsmodel.cpp \
           core/feedsproxymodel.cpp \
           core/filterutils.cpp \
           core/message.cpp \
           core/messagefilter.cpp \
           core/messageobject.cpp \
           core/messagesforfiltersmodel.cpp \
           core/messagesmodel.cpp \
           core/messagesmodelcache.cpp \
           core/messagesmodelsqllayer.cpp \
           core/messagesproxymodel.cpp \
           database/databasecleaner.cpp \
           database/databasedriver.cpp \
           database/databasefactory.cpp \
           database/databasequeries.cpp \
           database/mariadbdriver.cpp \
           database/sqlitedriver.cpp \
           dynamic-shortcuts/dynamicshortcuts.cpp \
           dynamic-shortcuts/dynamicshortcutswidget.cpp \
           dynamic-shortcuts/shortcutcatcher.cpp \
           exceptions/applicationexception.cpp \
           exceptions/filteringexception.cpp \
           exceptions/ioexception.cpp \
           exceptions/networkexception.cpp \
           exceptions/scriptexception.cpp \
           gui/baselineedit.cpp \
           gui/basetoolbar.cpp \
           gui/colortoolbutton.cpp \
           gui/comboboxwithstatus.cpp \
           gui/dialogs/formabout.cpp \
           gui/dialogs/formaddaccount.cpp \
           gui/dialogs/formaddeditlabel.cpp \
           gui/dialogs/formbackupdatabasesettings.cpp \
           gui/dialogs/formdatabasecleanup.cpp \
           gui/dialogs/formmain.cpp \
           gui/dialogs/formmessagefiltersmanager.cpp \
           gui/dialogs/formrestoredatabasesettings.cpp \
           gui/dialogs/formsettings.cpp \
           gui/dialogs/formupdate.cpp \
           gui/edittableview.cpp \
           gui/feedmessageviewer.cpp \
           gui/feedstoolbar.cpp \
           gui/feedsview.cpp \
           gui/guiutilities.cpp \
           gui/labelsmenu.cpp \
           gui/labelwithstatus.cpp \
           gui/lineeditwithstatus.cpp \
           gui/messagebox.cpp \
           gui/messagecountspinbox.cpp \
           gui/messagepreviewer.cpp \
           gui/messagestoolbar.cpp \
           gui/messagesview.cpp \
           gui/networkproxydetails.cpp \
           gui/newspaperpreviewer.cpp \
           gui/nonclosablemenu.cpp \
           gui/plaintoolbutton.cpp \
           gui/searchtextwidget.cpp \
           gui/settings/settingsbrowsermail.cpp \
           gui/settings/settingsdatabase.cpp \
           gui/settings/settingsdownloads.cpp \
           gui/settings/settingsfeedsmessages.cpp \
           gui/settings/settingsgeneral.cpp \
           gui/settings/settingsgui.cpp \
           gui/settings/settingslocalization.cpp \
           gui/settings/settingspanel.cpp \
           gui/settings/settingsshortcuts.cpp \
           gui/squeezelabel.cpp \
           gui/statusbar.cpp \
           gui/styleditemdelegatewithoutfocus.cpp \
           gui/systemtrayicon.cpp \
           gui/tabbar.cpp \
           gui/tabcontent.cpp \
           gui/tabwidget.cpp \
           gui/timespinbox.cpp \
           gui/toolbareditor.cpp \
           gui/treeviewcolumnsmenu.cpp \
           gui/widgetwithstatus.cpp \
           miscellaneous/application.cpp \
           miscellaneous/autosaver.cpp \
           miscellaneous/externaltool.cpp \
           miscellaneous/feedreader.cpp \
           miscellaneous/iconfactory.cpp \
           miscellaneous/iofactory.cpp \
           miscellaneous/localization.cpp \
           miscellaneous/mutex.cpp \
           miscellaneous/regexfactory.cpp \
           miscellaneous/settings.cpp \
           miscellaneous/skinfactory.cpp \
           miscellaneous/systemfactory.cpp \
           miscellaneous/textfactory.cpp \
           network-web/basenetworkaccessmanager.cpp \
           network-web/cookiejar.cpp \
           network-web/downloader.cpp \
           network-web/downloadmanager.cpp \
           network-web/httpresponse.cpp \
           network-web/networkfactory.cpp \
           network-web/oauth2service.cpp \
           network-web/oauthhttphandler.cpp \
           network-web/silentnetworkaccessmanager.cpp \
           network-web/webfactory.cpp \
           services/abstract/accountcheckmodel.cpp \
           services/abstract/cacheforserviceroot.cpp \
           services/abstract/category.cpp \
           services/abstract/feed.cpp \
           services/abstract/gui/authenticationdetails.cpp \
           services/abstract/gui/formaccountdetails.cpp \
           services/abstract/gui/formcategorydetails.cpp \
           services/abstract/gui/formfeeddetails.cpp \
           services/abstract/importantnode.cpp \
           services/abstract/label.cpp \
           services/abstract/labelsnode.cpp \
           services/abstract/recyclebin.cpp \
           services/abstract/rootitem.cpp \
           services/abstract/serviceroot.cpp \
           services/abstract/unreadnode.cpp \
           services/feedly/feedlyentrypoint.cpp \
           services/feedly/feedlynetwork.cpp \
           services/feedly/feedlyserviceroot.cpp \
           services/feedly/gui/feedlyaccountdetails.cpp \
           services/feedly/gui/formeditfeedlyaccount.cpp \
           services/gmail/gmailentrypoint.cpp \
           services/gmail/gmailnetworkfactory.cpp \
           services/gmail/gmailserviceroot.cpp \
           services/gmail/gui/emailrecipientcontrol.cpp \
           services/gmail/gui/formaddeditemail.cpp \
           services/gmail/gui/formdownloadattachment.cpp \
           services/gmail/gui/formeditgmailaccount.cpp \
           services/gmail/gui/gmailaccountdetails.cpp \
           services/greader/greaderentrypoint.cpp \
           services/greader/greadernetwork.cpp \
           services/greader/greaderserviceroot.cpp \
           services/greader/gui/formeditgreaderaccount.cpp \
           services/greader/gui/greaderaccountdetails.cpp \
           services/inoreader/gui/formeditinoreaderaccount.cpp \
           services/inoreader/gui/inoreaderaccountdetails.cpp \
           services/inoreader/inoreaderentrypoint.cpp \
           services/inoreader/inoreadernetworkfactory.cpp \
           services/inoreader/inoreaderserviceroot.cpp \
           services/owncloud/gui/formeditowncloudaccount.cpp \
           services/owncloud/gui/owncloudaccountdetails.cpp \
           services/owncloud/owncloudfeed.cpp \
           services/owncloud/owncloudnetworkfactory.cpp \
           services/owncloud/owncloudserviceentrypoint.cpp \
           services/owncloud/owncloudserviceroot.cpp \
           services/standard/atomparser.cpp \
           services/standard/feedparser.cpp \
           services/standard/gui/formeditstandardaccount.cpp \
           services/standard/gui/formstandardfeeddetails.cpp \
           services/standard/gui/formstandardimportexport.cpp \
           services/standard/gui/standardfeeddetails.cpp \
           services/standard/jsonparser.cpp \
           services/standard/rdfparser.cpp \
           services/standard/rssparser.cpp \
           services/standard/standardcategory.cpp \
           services/standard/standardfeed.cpp \
           services/standard/standardfeedsimportexportmodel.cpp \
           services/standard/standardserviceentrypoint.cpp \
           services/standard/standardserviceroot.cpp \
           services/tt-rss/gui/formeditttrssaccount.cpp \
           services/tt-rss/gui/formttrssfeeddetails.cpp \
           services/tt-rss/gui/ttrssaccountdetails.cpp \
           services/tt-rss/gui/ttrssfeeddetails.cpp \
           services/tt-rss/ttrssfeed.cpp \
           services/tt-rss/ttrssnetworkfactory.cpp \
           services/tt-rss/ttrssserviceentrypoint.cpp \
           services/tt-rss/ttrssserviceroot.cpp

mac {
  OBJECTIVE_SOURCES += miscellaneous/disablewindowtabbing.mm
}

FORMS += gui/dialogs/formabout.ui \
         gui/dialogs/formaddaccount.ui \
         gui/dialogs/formaddeditlabel.ui \
         gui/dialogs/formbackupdatabasesettings.ui \
         gui/dialogs/formdatabasecleanup.ui \
         gui/dialogs/formmain.ui \
         gui/dialogs/formmessagefiltersmanager.ui \
         gui/dialogs/formrestoredatabasesettings.ui \
         gui/dialogs/formsettings.ui \
         gui/dialogs/formupdate.ui \
         gui/networkproxydetails.ui \
         gui/newspaperpreviewer.ui \
         gui/searchtextwidget.ui \
         gui/settings/settingsbrowsermail.ui \
         gui/settings/settingsdatabase.ui \
         gui/settings/settingsdownloads.ui \
         gui/settings/settingsfeedsmessages.ui \
         gui/settings/settingsgeneral.ui \
         gui/settings/settingsgui.ui \
         gui/settings/settingslocalization.ui \
         gui/settings/settingsshortcuts.ui \
         gui/toolbareditor.ui \
         network-web/downloaditem.ui \
         network-web/downloadmanager.ui \
         services/abstract/gui/authenticationdetails.ui \
         services/abstract/gui/formaccountdetails.ui \
         services/abstract/gui/formcategorydetails.ui \
         services/abstract/gui/formfeeddetails.ui \
         services/feedly/gui/feedlyaccountdetails.ui \
         services/gmail/gui/formaddeditemail.ui \
         services/gmail/gui/formdownloadattachment.ui \
         services/gmail/gui/gmailaccountdetails.ui \
         services/greader/gui/greaderaccountdetails.ui \
         services/inoreader/gui/inoreaderaccountdetails.ui \
         services/owncloud/gui/owncloudaccountdetails.ui \
         services/standard/gui/formstandardimportexport.ui \
         services/standard/gui/standardfeeddetails.ui \
         services/tt-rss/gui/ttrssaccountdetails.ui \
         services/tt-rss/gui/ttrssfeeddetails.ui


equals(USE_WEBENGINE, true) {
  HEADERS += gui/locationlineedit.h \
             gui/webviewer.h \
             gui/webbrowser.h \
             gui/discoverfeedsbutton.h \
             network-web/googlesuggest.h \
             network-web/webpage.h

  SOURCES += gui/locationlineedit.cpp \
             gui/webviewer.cpp \
             gui/webbrowser.cpp \
             gui/discoverfeedsbutton.cpp \
             network-web/googlesuggest.cpp \
             network-web/webpage.cpp

  # Add AdBlock sources.
  HEADERS += network-web/adblock/adblockaddsubscriptiondialog.h \
             network-web/adblock/adblockdialog.h \
             network-web/adblock/adblockicon.h \
             network-web/adblock/adblockmanager.h \
             network-web/adblock/adblockmatcher.h \
             network-web/adblock/adblockrule.h \
             network-web/adblock/adblocksearchtree.h \
             network-web/adblock/adblocksubscription.h \
             network-web/adblock/adblocktreewidget.h \
             network-web/adblock/adblockurlinterceptor.h \
             network-web/adblock/adblockrequestinfo.h \
             network-web/urlinterceptor.h \
             network-web/networkurlinterceptor.h \
             gui/treewidget.h

  SOURCES += network-web/adblock/adblockaddsubscriptiondialog.cpp \
             network-web/adblock/adblockdialog.cpp \
             network-web/adblock/adblockicon.cpp \
             network-web/adblock/adblockmanager.cpp \
             network-web/adblock/adblockmatcher.cpp \
             network-web/adblock/adblockrule.cpp \
             network-web/adblock/adblocksearchtree.cpp \
             network-web/adblock/adblocksubscription.cpp \
             network-web/adblock/adblocktreewidget.cpp \
             network-web/adblock/adblockurlinterceptor.cpp \
             network-web/adblock/adblockrequestinfo.cpp \
             network-web/networkurlinterceptor.cpp \
             gui/treewidget.cpp

  FORMS += network-web/adblock/adblockaddsubscriptiondialog.ui \
           network-web/adblock/adblockdialog.ui
}
else {
  HEADERS += gui/messagetextbrowser.h \
             gui/messagebrowser.h
  SOURCES += gui/messagetextbrowser.cpp \
             gui/messagebrowser.cpp
}

# Add mimesis.
SOURCES += $$files(3rd-party/mimesis/*.cpp, false)
HEADERS  += $$files(3rd-party/mimesis/*.hpp, false)

# Add boolinq.
HEADERS  += $$files(3rd-party/boolinq/*.h, false)

# Add QtSingleApplication.
SOURCES +=  3rd-party/qts/qtlocalpeer.cpp \
            3rd-party/qts/qtlockedfile.cpp \
            3rd-party/qts/qtsingleapplication.cpp \
            3rd-party/qts/qtsinglecoreapplication.cpp
HEADERS  += $$files(3rd-party/qts/*.h   , false)

# Add SimpleCrypt.
SOURCES += $$files(3rd-party/sc/*.cpp, false)
HEADERS  += $$files(3rd-party/sc/*.h, false)


INCLUDEPATH +=  $$PWD/. \
                $$PWD/gui \
                $$PWD/gui/dialogs \
                $$PWD/dynamic-shortcuts

TRANSLATIONS += $$files($$PWD/../../localization/rssguard_*.ts, false) \
                $$files($$PWD/../../localization/qtbase_*.ts, false)

load(uic)
uic.commands -= -no-stringliteral

TR_EXCLUDE += $(QTDIR)

# Create new "make lupdate" target.
lupdate.target = lupdate
lupdate.commands = lupdate -no-obsolete -pro $$shell_quote($$shell_path($$PWD/librssguard.pro)) -ts $$shell_quote($$shell_path($$PWD/../../localization/rssguard_en.ts))

QMAKE_EXTRA_TARGETS += lupdate

# Make sure QM translations are nerated.
qtPrepareTool(LRELEASE, lrelease) {
  message($$MSG_PREFIX: Running: \"$$LRELEASE\" -compress $$TRANSLATIONS)
  system($$LRELEASE -compress $$TRANSLATIONS)
}

mac {
  IDENTIFIER = $$APP_REVERSE_NAME
  CONFIG -= app_bundle
  QMAKE_MACOSX_DEPLOYMENT_TARGET = 10.8
  LIBS += -framework AppKit
}
