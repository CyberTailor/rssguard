#ifndef GREADER_DEFINITIONS_H
#define GREADER_DEFINITIONS_H

#define GREADER_DEFAULT_BATCH_SIZE         100

// URLs.
#define GREADER_URL_REEDAH  "https://www.reedah.com"
#define GREADER_URL_TOR     "https://theoldreader.com"
#define GREADER_URL_BAZQUX  "https://bazqux.com"

// States.
#define GREADER_API_STATE_READING_LIST    "state/com.google/reading-list"

// Means "read" message. If both "reading-list" and "read" are specified, message is READ. If this state
// is not present, message is UNREAD.
#define GREADER_API_STATE_READ            "state/com.google/read"
#define GREADER_API_STATE_IMPORTANT       "state/com.google/starred"

#define GREADER_API_FULL_STATE_READING_LIST    "user/-/state/com.google/reading-list"
#define GREADER_API_FULL_STATE_READ            "user/-/state/com.google/read"
#define GREADER_API_FULL_STATE_IMPORTANT       "user/-/state/com.google/starred"

// API.
#define GREADER_API_CLIENT_LOGIN        "accounts/ClientLogin"
#define GREADER_API_TAG_LIST            "reader/api/0/tag/list?output=json"
#define GREADER_API_SUBSCRIPTION_LIST   "reader/api/0/subscription/list?output=json"
#define GREADER_API_STREAM_CONTENTS     "reader/api/0/stream/contents/%1?output=json&n=%2"
#define GREADER_API_EDIT_TAG            "reader/api/0/edit-tag"
#define GREADER_API_ITEM_IDS            "reader/api/0/stream/items/ids?output=json&n=200000&s=%1"
#define GREADER_API_ITEM_CONTENTS       "reader/api/0/stream/items/contents?output=json&n=200000"
#define GREADER_API_TOKEN               "reader/api/0/token"
#define GREADER_API_USER_INFO           "reader/api/0/user-info?output=json"

// Misc.
#define GREADER_API_EDIT_TAG_BATCH      200
#define GREADER_API_ITEM_CONTENTS_BATCH 999
#define GREADER_GLOBAL_UPDATE_THRES     0.5

// The Old Reader.
#define TOR_SPONSORED_STREAM_ID   "tor/sponsored"

// FreshRSS.
#define FRESHRSS_BASE_URL_PATH    "api/greader.php/"

#endif // GREADER_DEFINITIONS_H
