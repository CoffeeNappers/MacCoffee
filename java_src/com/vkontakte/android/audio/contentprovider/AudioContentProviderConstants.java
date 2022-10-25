package com.vkontakte.android.audio.contentprovider;

import android.net.Uri;
/* loaded from: classes2.dex */
interface AudioContentProviderConstants {
    public static final String AUTHORITY = "com.vkontakte.android.providers.audio";
    public static final String CACHE_PATH = "cache";
    public static final String MUSIC_TRACK_COLUMN_ARTIST = "artist";
    public static final String MUSIC_TRACK_COLUMN_DURATION = "duration";
    public static final String MUSIC_TRACK_COLUMN_RESTRICTION = "restriction";
    public static final String MUSIC_TRACK_COLUMN_TITLE = "title";
    public static final String[] VALID_APP_FINGERPRINTS = {"D83D03D675DBB36717D7F43CC05932BFDDCD1EDB"};
    public static final Uri CACHE_CONTENT_URI = Uri.parse("content://com.vkontakte.android.providers.audio/cache");
    public static final String MUSIC_TRACK_COLUMN_AID = "aid";
    public static final String MUSIC_TRACK_COLUMN_OID = "oid";
    public static final String MUSIC_TRACK_COLUMN_LYRICS_ID = "lyrics_id";
    public static final String MUSIC_TRACK_COLUMN_LYRICS_TEXT = "lyrics_text";
    public static final String MUSIC_TRACK_COLUMN_PLAY_LIST_ID = "playlist_id";
    public static final String[] MUSIC_TRACK_DEFAULT_PROJECTION = {"_id", MUSIC_TRACK_COLUMN_AID, MUSIC_TRACK_COLUMN_OID, "duration", "title", "artist", MUSIC_TRACK_COLUMN_LYRICS_ID, MUSIC_TRACK_COLUMN_LYRICS_TEXT, MUSIC_TRACK_COLUMN_PLAY_LIST_ID, "restriction"};
}
