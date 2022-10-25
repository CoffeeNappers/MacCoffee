.class interface abstract Lcom/vkontakte/android/audio/contentprovider/AudioContentProviderConstants;
.super Ljava/lang/Object;
.source "AudioContentProviderConstants.java"


# static fields
.field public static final AUTHORITY:Ljava/lang/String; = "com.vkontakte.android.providers.audio"

.field public static final CACHE_CONTENT_URI:Landroid/net/Uri;

.field public static final CACHE_PATH:Ljava/lang/String; = "cache"

.field public static final MUSIC_TRACK_COLUMN_AID:Ljava/lang/String; = "aid"

.field public static final MUSIC_TRACK_COLUMN_ARTIST:Ljava/lang/String; = "artist"

.field public static final MUSIC_TRACK_COLUMN_DURATION:Ljava/lang/String; = "duration"

.field public static final MUSIC_TRACK_COLUMN_LYRICS_ID:Ljava/lang/String; = "lyrics_id"

.field public static final MUSIC_TRACK_COLUMN_LYRICS_TEXT:Ljava/lang/String; = "lyrics_text"

.field public static final MUSIC_TRACK_COLUMN_OID:Ljava/lang/String; = "oid"

.field public static final MUSIC_TRACK_COLUMN_PLAY_LIST_ID:Ljava/lang/String; = "playlist_id"

.field public static final MUSIC_TRACK_COLUMN_RESTRICTION:Ljava/lang/String; = "restriction"

.field public static final MUSIC_TRACK_COLUMN_TITLE:Ljava/lang/String; = "title"

.field public static final MUSIC_TRACK_DEFAULT_PROJECTION:[Ljava/lang/String;

.field public static final VALID_APP_FINGERPRINTS:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 8
    new-array v0, v3, [Ljava/lang/String;

    const-string/jumbo v1, "D83D03D675DBB36717D7F43CC05932BFDDCD1EDB"

    aput-object v1, v0, v2

    sput-object v0, Lcom/vkontakte/android/audio/contentprovider/AudioContentProviderConstants;->VALID_APP_FINGERPRINTS:[Ljava/lang/String;

    .line 13
    const-string/jumbo v0, "content://com.vkontakte.android.providers.audio/cache"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/vkontakte/android/audio/contentprovider/AudioContentProviderConstants;->CACHE_CONTENT_URI:Landroid/net/Uri;

    .line 25
    const/16 v0, 0xa

    new-array v0, v0, [Ljava/lang/String;

    const-string/jumbo v1, "_id"

    aput-object v1, v0, v2

    const-string/jumbo v1, "aid"

    aput-object v1, v0, v3

    const/4 v1, 0x2

    const-string/jumbo v2, "oid"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string/jumbo v2, "duration"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string/jumbo v2, "title"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string/jumbo v2, "artist"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string/jumbo v2, "lyrics_id"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string/jumbo v2, "lyrics_text"

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string/jumbo v2, "playlist_id"

    aput-object v2, v0, v1

    const/16 v1, 0x9

    const-string/jumbo v2, "restriction"

    aput-object v2, v0, v1

    sput-object v0, Lcom/vkontakte/android/audio/contentprovider/AudioContentProviderConstants;->MUSIC_TRACK_DEFAULT_PROJECTION:[Ljava/lang/String;

    return-void
.end method
