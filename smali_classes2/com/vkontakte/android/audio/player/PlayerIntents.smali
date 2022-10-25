.class public Lcom/vkontakte/android/audio/player/PlayerIntents;
.super Ljava/lang/Object;
.source "PlayerIntents.java"


# static fields
.field static final ACTION_CANCEL_DOWNLOAD:Ljava/lang/String;

.field static final ACTION_CANCEL_DOWNLOADS:Ljava/lang/String;

.field static final ACTION_LOGOUT:Ljava/lang/String;

.field static final ACTION_NEXT:Ljava/lang/String;

.field static final ACTION_PAUSE:Ljava/lang/String;

.field static final ACTION_PAUSE_DOWNLOAD:Ljava/lang/String;

.field static final ACTION_PLAY_UUID:Ljava/lang/String;

.field static final ACTION_PREV:Ljava/lang/String;

.field static final ACTION_REMOVE_ALL_SAVED_TRACK:Ljava/lang/String;

.field static final ACTION_REMOVE_SAVED_TRACK:Ljava/lang/String;

.field static final ACTION_RESUME:Ljava/lang/String;

.field static final ACTION_RESUME_DOWNLOAD:Ljava/lang/String;

.field static final ACTION_REWIND:Ljava/lang/String;

.field static final ACTION_SET_REPEAT_MODE:Ljava/lang/String;

.field static final ACTION_SET_SHUFFLE:Ljava/lang/String;

.field static final ACTION_START_DOWNLOAD_TRACKS:Ljava/lang/String;

.field static final ACTION_STOP:Ljava/lang/String;

.field static final ACTION_TOGGLE_REPEAT:Ljava/lang/String;

.field static final ACTION_TOGGLE_REPEAT_NONE_OR_TRACK:Ljava/lang/String;

.field static final ACTION_TOGGLE_RESUME_PAUSE:Ljava/lang/String;

.field static final ACTION_TOGGLE_SHUFFLE:Ljava/lang/String;

.field static final EXTRA_MID:Ljava/lang/String;

.field static final EXTRA_REPEAT_MODE:Ljava/lang/String;

.field static final EXTRA_SHOW_NOTIFICATION:Ljava/lang/String;

.field static final EXTRA_SHUFFLE:Ljava/lang/String;

.field static final EXTRA_TRACKS:Ljava/lang/String;

.field static final EXTRA_UUID:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 18
    const-class v0, Lcom/vkontakte/android/audio/player/PlayerService;

    const-string/jumbo v1, "STOP"

    invoke-static {v0, v1}, Lcom/vkontakte/android/audio/utils/Utils;->formatAction(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/vkontakte/android/audio/player/PlayerIntents;->ACTION_STOP:Ljava/lang/String;

    .line 19
    const-class v0, Lcom/vkontakte/android/audio/player/PlayerService;

    const-string/jumbo v1, "LOGOUT"

    invoke-static {v0, v1}, Lcom/vkontakte/android/audio/utils/Utils;->formatAction(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/vkontakte/android/audio/player/PlayerIntents;->ACTION_LOGOUT:Ljava/lang/String;

    .line 20
    const-class v0, Lcom/vkontakte/android/audio/player/PlayerService;

    const-string/jumbo v1, "PAUSE"

    invoke-static {v0, v1}, Lcom/vkontakte/android/audio/utils/Utils;->formatAction(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/vkontakte/android/audio/player/PlayerIntents;->ACTION_PAUSE:Ljava/lang/String;

    .line 21
    const-class v0, Lcom/vkontakte/android/audio/player/PlayerService;

    const-string/jumbo v1, "REWIND"

    invoke-static {v0, v1}, Lcom/vkontakte/android/audio/utils/Utils;->formatAction(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/vkontakte/android/audio/player/PlayerIntents;->ACTION_REWIND:Ljava/lang/String;

    .line 22
    const-class v0, Lcom/vkontakte/android/audio/player/PlayerService;

    const-string/jumbo v1, "RESUME"

    invoke-static {v0, v1}, Lcom/vkontakte/android/audio/utils/Utils;->formatAction(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/vkontakte/android/audio/player/PlayerIntents;->ACTION_RESUME:Ljava/lang/String;

    .line 23
    const-class v0, Lcom/vkontakte/android/audio/player/PlayerService;

    const-string/jumbo v1, "TOGGLE_RESUME_PAUSE"

    invoke-static {v0, v1}, Lcom/vkontakte/android/audio/utils/Utils;->formatAction(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/vkontakte/android/audio/player/PlayerIntents;->ACTION_TOGGLE_RESUME_PAUSE:Ljava/lang/String;

    .line 24
    const-class v0, Lcom/vkontakte/android/audio/player/PlayerService;

    const-string/jumbo v1, "NEXT"

    invoke-static {v0, v1}, Lcom/vkontakte/android/audio/utils/Utils;->formatAction(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/vkontakte/android/audio/player/PlayerIntents;->ACTION_NEXT:Ljava/lang/String;

    .line 25
    const-class v0, Lcom/vkontakte/android/audio/player/PlayerService;

    const-string/jumbo v1, "PREV"

    invoke-static {v0, v1}, Lcom/vkontakte/android/audio/utils/Utils;->formatAction(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/vkontakte/android/audio/player/PlayerIntents;->ACTION_PREV:Ljava/lang/String;

    .line 26
    const-class v0, Lcom/vkontakte/android/audio/player/PlayerService;

    const-string/jumbo v1, "TOGGLE_SHUFFLE"

    invoke-static {v0, v1}, Lcom/vkontakte/android/audio/utils/Utils;->formatAction(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/vkontakte/android/audio/player/PlayerIntents;->ACTION_TOGGLE_SHUFFLE:Ljava/lang/String;

    .line 27
    const-class v0, Lcom/vkontakte/android/audio/player/PlayerService;

    const-string/jumbo v1, "SET_SHUFFLE"

    invoke-static {v0, v1}, Lcom/vkontakte/android/audio/utils/Utils;->formatAction(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/vkontakte/android/audio/player/PlayerIntents;->ACTION_SET_SHUFFLE:Ljava/lang/String;

    .line 28
    const-class v0, Lcom/vkontakte/android/audio/player/PlayerService;

    const-string/jumbo v1, "TOGGLE_REPEAT"

    invoke-static {v0, v1}, Lcom/vkontakte/android/audio/utils/Utils;->formatAction(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/vkontakte/android/audio/player/PlayerIntents;->ACTION_TOGGLE_REPEAT:Ljava/lang/String;

    .line 29
    const-class v0, Lcom/vkontakte/android/audio/player/PlayerService;

    const-string/jumbo v1, "TOGGLE_REPEAT_NONE_OR_TRACK"

    invoke-static {v0, v1}, Lcom/vkontakte/android/audio/utils/Utils;->formatAction(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/vkontakte/android/audio/player/PlayerIntents;->ACTION_TOGGLE_REPEAT_NONE_OR_TRACK:Ljava/lang/String;

    .line 30
    const-class v0, Lcom/vkontakte/android/audio/player/PlayerService;

    const-string/jumbo v1, "SET_REPEAT_MODE"

    invoke-static {v0, v1}, Lcom/vkontakte/android/audio/utils/Utils;->formatAction(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/vkontakte/android/audio/player/PlayerIntents;->ACTION_SET_REPEAT_MODE:Ljava/lang/String;

    .line 31
    const-class v0, Lcom/vkontakte/android/audio/player/PlayerService;

    const-string/jumbo v1, "PLAY_UUID"

    invoke-static {v0, v1}, Lcom/vkontakte/android/audio/utils/Utils;->formatAction(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/vkontakte/android/audio/player/PlayerIntents;->ACTION_PLAY_UUID:Ljava/lang/String;

    .line 33
    const-class v0, Lcom/vkontakte/android/audio/player/PlayerService;

    const-string/jumbo v1, "START_DOWNLOAD_TRACKS"

    invoke-static {v0, v1}, Lcom/vkontakte/android/audio/utils/Utils;->formatAction(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/vkontakte/android/audio/player/PlayerIntents;->ACTION_START_DOWNLOAD_TRACKS:Ljava/lang/String;

    .line 34
    const-class v0, Lcom/vkontakte/android/audio/player/PlayerService;

    const-string/jumbo v1, "PAUSE_DOWNLOAD"

    invoke-static {v0, v1}, Lcom/vkontakte/android/audio/utils/Utils;->formatAction(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/vkontakte/android/audio/player/PlayerIntents;->ACTION_PAUSE_DOWNLOAD:Ljava/lang/String;

    .line 35
    const-class v0, Lcom/vkontakte/android/audio/player/PlayerService;

    const-string/jumbo v1, "RESUME_DOWNLOAD"

    invoke-static {v0, v1}, Lcom/vkontakte/android/audio/utils/Utils;->formatAction(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/vkontakte/android/audio/player/PlayerIntents;->ACTION_RESUME_DOWNLOAD:Ljava/lang/String;

    .line 36
    const-class v0, Lcom/vkontakte/android/audio/player/PlayerService;

    const-string/jumbo v1, "CANCEL_DOWNLOAD"

    invoke-static {v0, v1}, Lcom/vkontakte/android/audio/utils/Utils;->formatAction(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/vkontakte/android/audio/player/PlayerIntents;->ACTION_CANCEL_DOWNLOAD:Ljava/lang/String;

    .line 37
    const-class v0, Lcom/vkontakte/android/audio/player/PlayerService;

    const-string/jumbo v1, "CANCEL_DOWNLOADS"

    invoke-static {v0, v1}, Lcom/vkontakte/android/audio/utils/Utils;->formatAction(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/vkontakte/android/audio/player/PlayerIntents;->ACTION_CANCEL_DOWNLOADS:Ljava/lang/String;

    .line 38
    const-class v0, Lcom/vkontakte/android/audio/player/PlayerService;

    const-string/jumbo v1, "REMOVE_SAVED_TRACKS"

    invoke-static {v0, v1}, Lcom/vkontakte/android/audio/utils/Utils;->formatAction(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/vkontakte/android/audio/player/PlayerIntents;->ACTION_REMOVE_SAVED_TRACK:Ljava/lang/String;

    .line 39
    const-class v0, Lcom/vkontakte/android/audio/player/PlayerService;

    const-string/jumbo v1, "REMOVE_ALL_SAVED_TRACKS"

    invoke-static {v0, v1}, Lcom/vkontakte/android/audio/utils/Utils;->formatAction(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/vkontakte/android/audio/player/PlayerIntents;->ACTION_REMOVE_ALL_SAVED_TRACK:Ljava/lang/String;

    .line 41
    const-class v0, Lcom/vkontakte/android/audio/player/PlayerService;

    const-string/jumbo v1, "TRACKS"

    invoke-static {v0, v1}, Lcom/vkontakte/android/audio/utils/Utils;->formatExtra(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/vkontakte/android/audio/player/PlayerIntents;->EXTRA_TRACKS:Ljava/lang/String;

    .line 42
    const-class v0, Lcom/vkontakte/android/audio/player/PlayerService;

    const-string/jumbo v1, "MID"

    invoke-static {v0, v1}, Lcom/vkontakte/android/audio/utils/Utils;->formatExtra(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/vkontakte/android/audio/player/PlayerIntents;->EXTRA_MID:Ljava/lang/String;

    .line 43
    const-class v0, Lcom/vkontakte/android/audio/player/PlayerService;

    const-string/jumbo v1, "REPEAT_MODE"

    invoke-static {v0, v1}, Lcom/vkontakte/android/audio/utils/Utils;->formatExtra(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/vkontakte/android/audio/player/PlayerIntents;->EXTRA_REPEAT_MODE:Ljava/lang/String;

    .line 44
    const-class v0, Lcom/vkontakte/android/audio/player/PlayerService;

    const-string/jumbo v1, "UUID"

    invoke-static {v0, v1}, Lcom/vkontakte/android/audio/utils/Utils;->formatExtra(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/vkontakte/android/audio/player/PlayerIntents;->EXTRA_UUID:Ljava/lang/String;

    .line 45
    const-class v0, Lcom/vkontakte/android/audio/player/PlayerService;

    const-string/jumbo v1, "SHUFFLE"

    invoke-static {v0, v1}, Lcom/vkontakte/android/audio/utils/Utils;->formatExtra(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/vkontakte/android/audio/player/PlayerIntents;->EXTRA_SHUFFLE:Ljava/lang/String;

    .line 46
    const-class v0, Lcom/vkontakte/android/audio/player/PlayerService;

    const-string/jumbo v1, "EXTRA_SHOW_NOTIFICATION"

    invoke-static {v0, v1}, Lcom/vkontakte/android/audio/utils/Utils;->formatExtra(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/vkontakte/android/audio/player/PlayerIntents;->EXTRA_SHOW_NOTIFICATION:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static cancelDownload(Ljava/lang/String;)V
    .locals 2
    .param p0, "uuid"    # Ljava/lang/String;

    .prologue
    .line 260
    invoke-static {}, Lcom/vkontakte/android/audio/MusicApp;->getInstance()Landroid/content/Context;

    move-result-object v0

    .line 261
    .local v0, "context":Landroid/content/Context;
    invoke-static {v0, p0}, Lcom/vkontakte/android/audio/player/PlayerIntents;->getCancelDownloadIntent(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 262
    return-void
.end method

.method public static cancelDownloads()V
    .locals 2

    .prologue
    .line 269
    invoke-static {}, Lcom/vkontakte/android/audio/MusicApp;->getInstance()Landroid/content/Context;

    move-result-object v0

    .line 270
    .local v0, "context":Landroid/content/Context;
    invoke-static {v0}, Lcom/vkontakte/android/audio/player/PlayerIntents;->getCancelDownloadsIntent(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 271
    return-void
.end method

.method protected static createIntent(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "action"    # Ljava/lang/String;

    .prologue
    .line 49
    new-instance v0, Landroid/content/Intent;

    const/4 v1, 0x0

    const-class v2, Lcom/vkontakte/android/audio/player/PlayerService;

    invoke-direct {v0, p1, v1, p0, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;Landroid/content/Context;Ljava/lang/Class;)V

    return-object v0
.end method

.method private static createPendingIntent(Landroid/content/Context;Landroid/content/Intent;I)Landroid/app/PendingIntent;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "flags"    # I

    .prologue
    .line 53
    const/4 v0, 0x0

    invoke-static {p0, v0, p1, p2}, Landroid/app/PendingIntent;->getService(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v0

    return-object v0
.end method

.method static getCancelDownloadIntent(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "uuid"    # Ljava/lang/String;

    .prologue
    .line 253
    sget-object v1, Lcom/vkontakte/android/audio/player/PlayerIntents;->ACTION_CANCEL_DOWNLOAD:Ljava/lang/String;

    invoke-static {p0, v1}, Lcom/vkontakte/android/audio/player/PlayerIntents;->createIntent(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    .line 254
    .local v0, "intent":Landroid/content/Intent;
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 256
    return-object v0
.end method

.method static getCancelDownloadsIntent(Landroid/content/Context;)Landroid/content/Intent;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 265
    sget-object v0, Lcom/vkontakte/android/audio/player/PlayerIntents;->ACTION_CANCEL_DOWNLOADS:Ljava/lang/String;

    invoke-static {p0, v0}, Lcom/vkontakte/android/audio/player/PlayerIntents;->createIntent(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    return-object v0
.end method

.method public static getLogoutIntent(Landroid/content/Context;)Landroid/content/Intent;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 206
    sget-object v0, Lcom/vkontakte/android/audio/player/PlayerIntents;->ACTION_LOGOUT:Ljava/lang/String;

    invoke-static {p0, v0}, Lcom/vkontakte/android/audio/player/PlayerIntents;->createIntent(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    return-object v0
.end method

.method public static getNextIntent(Landroid/content/Context;)Landroid/content/Intent;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 103
    sget-object v0, Lcom/vkontakte/android/audio/player/PlayerIntents;->ACTION_NEXT:Ljava/lang/String;

    invoke-static {p0, v0}, Lcom/vkontakte/android/audio/player/PlayerIntents;->createIntent(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    return-object v0
.end method

.method static getPauseDownloadIntent(Landroid/content/Context;)Landroid/content/Intent;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 245
    sget-object v0, Lcom/vkontakte/android/audio/player/PlayerIntents;->ACTION_PAUSE_DOWNLOAD:Ljava/lang/String;

    invoke-static {p0, v0}, Lcom/vkontakte/android/audio/player/PlayerIntents;->createIntent(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    return-object v0
.end method

.method public static getPauseIntent(Landroid/content/Context;)Landroid/content/Intent;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 70
    sget-object v0, Lcom/vkontakte/android/audio/player/PlayerIntents;->ACTION_PAUSE:Ljava/lang/String;

    invoke-static {p0, v0}, Lcom/vkontakte/android/audio/player/PlayerIntents;->createIntent(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    return-object v0
.end method

.method public static getPlayTrackUuidIntent(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "uuid"    # Ljava/lang/String;

    .prologue
    .line 193
    sget-object v1, Lcom/vkontakte/android/audio/player/PlayerIntents;->ACTION_PLAY_UUID:Ljava/lang/String;

    invoke-static {p0, v1}, Lcom/vkontakte/android/audio/player/PlayerIntents;->createIntent(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    .line 194
    .local v0, "intent":Landroid/content/Intent;
    sget-object v1, Lcom/vkontakte/android/audio/player/PlayerIntents;->EXTRA_UUID:Ljava/lang/String;

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 195
    return-object v0
.end method

.method public static getPrevIntent(Landroid/content/Context;)Landroid/content/Intent;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 114
    sget-object v0, Lcom/vkontakte/android/audio/player/PlayerIntents;->ACTION_PREV:Ljava/lang/String;

    invoke-static {p0, v0}, Lcom/vkontakte/android/audio/player/PlayerIntents;->createIntent(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    return-object v0
.end method

.method public static varargs getRemoveSavedTrackIntent(Landroid/content/Context;[Ljava/lang/String;)Landroid/content/Intent;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "mid"    # [Ljava/lang/String;

    .prologue
    .line 275
    array-length v1, p1

    if-nez v1, :cond_0

    .line 276
    sget-object v1, Lcom/vkontakte/android/audio/player/PlayerIntents;->ACTION_REMOVE_ALL_SAVED_TRACK:Ljava/lang/String;

    invoke-static {p0, v1}, Lcom/vkontakte/android/audio/player/PlayerIntents;->createIntent(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    .line 280
    .local v0, "intent":Landroid/content/Intent;
    :goto_0
    sget-object v1, Lcom/vkontakte/android/audio/player/PlayerIntents;->EXTRA_MID:Ljava/lang/String;

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[Ljava/lang/String;)Landroid/content/Intent;

    .line 281
    return-object v0

    .line 278
    .end local v0    # "intent":Landroid/content/Intent;
    :cond_0
    sget-object v1, Lcom/vkontakte/android/audio/player/PlayerIntents;->ACTION_REMOVE_SAVED_TRACK:Ljava/lang/String;

    invoke-static {p0, v1}, Lcom/vkontakte/android/audio/player/PlayerIntents;->createIntent(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    .restart local v0    # "intent":Landroid/content/Intent;
    goto :goto_0
.end method

.method static getResumeDownloadIntent(Landroid/content/Context;)Landroid/content/Intent;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 249
    sget-object v0, Lcom/vkontakte/android/audio/player/PlayerIntents;->ACTION_RESUME_DOWNLOAD:Ljava/lang/String;

    invoke-static {p0, v0}, Lcom/vkontakte/android/audio/player/PlayerIntents;->createIntent(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    return-object v0
.end method

.method public static getResumeIntent(Landroid/content/Context;)Landroid/content/Intent;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 59
    sget-object v0, Lcom/vkontakte/android/audio/player/PlayerIntents;->ACTION_RESUME:Ljava/lang/String;

    invoke-static {p0, v0}, Lcom/vkontakte/android/audio/player/PlayerIntents;->createIntent(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    return-object v0
.end method

.method public static getRewindIntent(Landroid/content/Context;)Landroid/content/Intent;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 92
    sget-object v0, Lcom/vkontakte/android/audio/player/PlayerIntents;->ACTION_REWIND:Ljava/lang/String;

    invoke-static {p0, v0}, Lcom/vkontakte/android/audio/player/PlayerIntents;->createIntent(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    return-object v0
.end method

.method public static getSetRepeatModeIntent(Landroid/content/Context;Lcom/vkontakte/android/audio/player/LoopMode;)Landroid/content/Intent;
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "loopMode"    # Lcom/vkontakte/android/audio/player/LoopMode;

    .prologue
    .line 180
    sget-object v1, Lcom/vkontakte/android/audio/player/PlayerIntents;->ACTION_SET_REPEAT_MODE:Ljava/lang/String;

    invoke-static {p0, v1}, Lcom/vkontakte/android/audio/player/PlayerIntents;->createIntent(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    .line 181
    .local v0, "intent":Landroid/content/Intent;
    sget-object v1, Lcom/vkontakte/android/audio/player/PlayerIntents;->EXTRA_REPEAT_MODE:Ljava/lang/String;

    invoke-virtual {p1}, Lcom/vkontakte/android/audio/player/LoopMode;->ordinal()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 182
    return-object v0
.end method

.method public static getSetShuffleIntent(Landroid/content/Context;Z)Landroid/content/Intent;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "isShuffle"    # Z

    .prologue
    .line 147
    sget-object v1, Lcom/vkontakte/android/audio/player/PlayerIntents;->ACTION_SET_SHUFFLE:Ljava/lang/String;

    invoke-static {p0, v1}, Lcom/vkontakte/android/audio/player/PlayerIntents;->createIntent(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    .line 148
    .local v0, "intent":Landroid/content/Intent;
    sget-object v1, Lcom/vkontakte/android/audio/player/PlayerIntents;->EXTRA_SHUFFLE:Ljava/lang/String;

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 149
    return-object v0
.end method

.method public static getStartDownloadTracksIntent(Landroid/content/Context;Lcom/vkontakte/android/audio/MusicTrack;Z)Landroid/content/Intent;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "track"    # Lcom/vkontakte/android/audio/MusicTrack;
    .param p2, "showNotification"    # Z

    .prologue
    .line 229
    invoke-static {p1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-static {p0, v0, p2}, Lcom/vkontakte/android/audio/player/PlayerIntents;->getStartDownloadTracksIntent(Landroid/content/Context;Ljava/util/Collection;Z)Landroid/content/Intent;

    move-result-object v0

    return-object v0
.end method

.method public static getStartDownloadTracksIntent(Landroid/content/Context;Ljava/util/Collection;Z)Landroid/content/Intent;
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p2, "showNotification"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/Collection",
            "<+",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;Z)",
            "Landroid/content/Intent;"
        }
    .end annotation

    .prologue
    .line 218
    .local p1, "tracks":Ljava/util/Collection;, "Ljava/util/Collection<+Lcom/vkontakte/android/audio/MusicTrack;>;"
    sget-object v1, Lcom/vkontakte/android/audio/player/PlayerIntents;->ACTION_START_DOWNLOAD_TRACKS:Ljava/lang/String;

    invoke-static {p0, v1}, Lcom/vkontakte/android/audio/player/PlayerIntents;->createIntent(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    .line 219
    .local v0, "intent":Landroid/content/Intent;
    sget-object v1, Lcom/vkontakte/android/audio/player/PlayerIntents;->EXTRA_SHOW_NOTIFICATION:Ljava/lang/String;

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 220
    instance-of v1, p1, Ljava/util/ArrayList;

    if-eqz v1, :cond_0

    .line 221
    sget-object v2, Lcom/vkontakte/android/audio/player/PlayerIntents;->EXTRA_TRACKS:Ljava/lang/String;

    invoke-static {p1}, Lcom/vkontakte/android/audio/utils/Utils;->checkedCast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/ArrayList;

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putParcelableArrayListExtra(Ljava/lang/String;Ljava/util/ArrayList;)Landroid/content/Intent;

    .line 225
    :goto_0
    return-object v0

    .line 223
    :cond_0
    sget-object v1, Lcom/vkontakte/android/audio/player/PlayerIntents;->EXTRA_TRACKS:Ljava/lang/String;

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putParcelableArrayListExtra(Ljava/lang/String;Ljava/util/ArrayList;)Landroid/content/Intent;

    goto :goto_0
.end method

.method public static getStopIntent(Landroid/content/Context;)Landroid/content/Intent;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 125
    sget-object v0, Lcom/vkontakte/android/audio/player/PlayerIntents;->ACTION_STOP:Ljava/lang/String;

    invoke-static {p0, v0}, Lcom/vkontakte/android/audio/player/PlayerIntents;->createIntent(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    return-object v0
.end method

.method public static getToggleRepeatIntent(Landroid/content/Context;)Landroid/content/Intent;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 160
    sget-object v0, Lcom/vkontakte/android/audio/player/PlayerIntents;->ACTION_TOGGLE_REPEAT:Ljava/lang/String;

    invoke-static {p0, v0}, Lcom/vkontakte/android/audio/player/PlayerIntents;->createIntent(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    return-object v0
.end method

.method public static getToggleRepeatNoneOrTrackIntent(Landroid/content/Context;)Landroid/content/Intent;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 169
    sget-object v0, Lcom/vkontakte/android/audio/player/PlayerIntents;->ACTION_TOGGLE_REPEAT_NONE_OR_TRACK:Ljava/lang/String;

    invoke-static {p0, v0}, Lcom/vkontakte/android/audio/player/PlayerIntents;->createIntent(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    return-object v0
.end method

.method public static getToggleResumePauseIntent(Landroid/content/Context;)Landroid/content/Intent;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 81
    sget-object v0, Lcom/vkontakte/android/audio/player/PlayerIntents;->ACTION_TOGGLE_RESUME_PAUSE:Ljava/lang/String;

    invoke-static {p0, v0}, Lcom/vkontakte/android/audio/player/PlayerIntents;->createIntent(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    return-object v0
.end method

.method public static getToggleShuffleIntent(Landroid/content/Context;)Landroid/content/Intent;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 136
    sget-object v0, Lcom/vkontakte/android/audio/player/PlayerIntents;->ACTION_TOGGLE_SHUFFLE:Ljava/lang/String;

    invoke-static {p0, v0}, Lcom/vkontakte/android/audio/player/PlayerIntents;->createIntent(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    return-object v0
.end method

.method public static logout()V
    .locals 2

    .prologue
    .line 210
    invoke-static {}, Lcom/vkontakte/android/audio/MusicApp;->getInstance()Landroid/content/Context;

    move-result-object v0

    .line 211
    .local v0, "context":Landroid/content/Context;
    invoke-static {v0}, Lcom/vkontakte/android/audio/player/PlayerIntents;->getLogoutIntent(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 212
    return-void
.end method

.method public static next()V
    .locals 2

    .prologue
    .line 107
    invoke-static {}, Lcom/vkontakte/android/audio/MusicApp;->getInstance()Landroid/content/Context;

    move-result-object v0

    .line 108
    .local v0, "context":Landroid/content/Context;
    invoke-static {v0}, Lcom/vkontakte/android/audio/player/PlayerIntents;->getNextIntent(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 109
    return-void
.end method

.method public static pause()V
    .locals 2

    .prologue
    .line 74
    invoke-static {}, Lcom/vkontakte/android/audio/MusicApp;->getInstance()Landroid/content/Context;

    move-result-object v0

    .line 75
    .local v0, "context":Landroid/content/Context;
    invoke-static {v0}, Lcom/vkontakte/android/audio/player/PlayerIntents;->getPauseIntent(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 76
    return-void
.end method

.method public static playTrack(Ljava/lang/String;)V
    .locals 2
    .param p0, "uuid"    # Ljava/lang/String;

    .prologue
    .line 199
    invoke-static {}, Lcom/vkontakte/android/audio/MusicApp;->getInstance()Landroid/content/Context;

    move-result-object v0

    .line 200
    .local v0, "context":Landroid/content/Context;
    invoke-static {v0, p0}, Lcom/vkontakte/android/audio/player/PlayerIntents;->getPlayTrackUuidIntent(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 201
    return-void
.end method

.method public static prev()V
    .locals 2

    .prologue
    .line 118
    invoke-static {}, Lcom/vkontakte/android/audio/MusicApp;->getInstance()Landroid/content/Context;

    move-result-object v0

    .line 119
    .local v0, "context":Landroid/content/Context;
    invoke-static {v0}, Lcom/vkontakte/android/audio/player/PlayerIntents;->getPrevIntent(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 120
    return-void
.end method

.method public static varargs removeSavedTrack([Ljava/lang/String;)V
    .locals 2
    .param p0, "mid"    # [Ljava/lang/String;

    .prologue
    .line 285
    invoke-static {}, Lcom/vkontakte/android/audio/MusicApp;->getInstance()Landroid/content/Context;

    move-result-object v0

    .line 286
    .local v0, "context":Landroid/content/Context;
    invoke-static {v0, p0}, Lcom/vkontakte/android/audio/player/PlayerIntents;->getRemoveSavedTrackIntent(Landroid/content/Context;[Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 287
    return-void
.end method

.method public static resume()V
    .locals 2

    .prologue
    .line 63
    invoke-static {}, Lcom/vkontakte/android/audio/MusicApp;->getInstance()Landroid/content/Context;

    move-result-object v0

    .line 64
    .local v0, "context":Landroid/content/Context;
    invoke-static {v0}, Lcom/vkontakte/android/audio/player/PlayerIntents;->getResumeIntent(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 65
    return-void
.end method

.method public static rewind()V
    .locals 2

    .prologue
    .line 96
    invoke-static {}, Lcom/vkontakte/android/audio/MusicApp;->getInstance()Landroid/content/Context;

    move-result-object v0

    .line 97
    .local v0, "context":Landroid/content/Context;
    invoke-static {v0}, Lcom/vkontakte/android/audio/player/PlayerIntents;->getRewindIntent(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 98
    return-void
.end method

.method public static setRepeatMode(Lcom/vkontakte/android/audio/player/LoopMode;)V
    .locals 2
    .param p0, "loopMode"    # Lcom/vkontakte/android/audio/player/LoopMode;

    .prologue
    .line 186
    invoke-static {}, Lcom/vkontakte/android/audio/MusicApp;->getInstance()Landroid/content/Context;

    move-result-object v0

    .line 187
    .local v0, "context":Landroid/content/Context;
    invoke-static {v0, p0}, Lcom/vkontakte/android/audio/player/PlayerIntents;->getSetRepeatModeIntent(Landroid/content/Context;Lcom/vkontakte/android/audio/player/LoopMode;)Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 188
    return-void
.end method

.method public static setShuffle(Z)V
    .locals 2
    .param p0, "isShuffle"    # Z

    .prologue
    .line 153
    invoke-static {}, Lcom/vkontakte/android/audio/MusicApp;->getInstance()Landroid/content/Context;

    move-result-object v0

    .line 154
    .local v0, "context":Landroid/content/Context;
    invoke-static {v0, p0}, Lcom/vkontakte/android/audio/player/PlayerIntents;->getSetShuffleIntent(Landroid/content/Context;Z)Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 155
    return-void
.end method

.method public static startDownloadTracks(Lcom/vkontakte/android/audio/MusicTrack;Z)V
    .locals 2
    .param p0, "track"    # Lcom/vkontakte/android/audio/MusicTrack;
    .param p1, "showNotification"    # Z

    .prologue
    .line 238
    invoke-static {}, Lcom/vkontakte/android/audio/MusicApp;->getInstance()Landroid/content/Context;

    move-result-object v0

    .line 239
    .local v0, "context":Landroid/content/Context;
    invoke-static {v0, p0, p1}, Lcom/vkontakte/android/audio/player/PlayerIntents;->getStartDownloadTracksIntent(Landroid/content/Context;Lcom/vkontakte/android/audio/MusicTrack;Z)Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 240
    return-void
.end method

.method public static startDownloadTracks(Ljava/util/Collection;Z)V
    .locals 2
    .param p1, "showNotification"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;Z)V"
        }
    .end annotation

    .prologue
    .line 233
    .local p0, "tracks":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/vkontakte/android/audio/MusicTrack;>;"
    invoke-static {}, Lcom/vkontakte/android/audio/MusicApp;->getInstance()Landroid/content/Context;

    move-result-object v0

    .line 234
    .local v0, "context":Landroid/content/Context;
    invoke-static {v0, p0, p1}, Lcom/vkontakte/android/audio/player/PlayerIntents;->getStartDownloadTracksIntent(Landroid/content/Context;Ljava/util/Collection;Z)Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 235
    return-void
.end method

.method public static stop()V
    .locals 2

    .prologue
    .line 129
    invoke-static {}, Lcom/vkontakte/android/audio/MusicApp;->getInstance()Landroid/content/Context;

    move-result-object v0

    .line 130
    .local v0, "context":Landroid/content/Context;
    invoke-static {v0}, Lcom/vkontakte/android/audio/player/PlayerIntents;->getStopIntent(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 131
    return-void
.end method

.method public static toggleRepeat()V
    .locals 2

    .prologue
    .line 164
    invoke-static {}, Lcom/vkontakte/android/audio/MusicApp;->getInstance()Landroid/content/Context;

    move-result-object v0

    .line 165
    .local v0, "context":Landroid/content/Context;
    invoke-static {v0}, Lcom/vkontakte/android/audio/player/PlayerIntents;->getToggleRepeatIntent(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 166
    return-void
.end method

.method public static toggleRepeatNoneOrTrack()V
    .locals 2

    .prologue
    .line 173
    invoke-static {}, Lcom/vkontakte/android/audio/MusicApp;->getInstance()Landroid/content/Context;

    move-result-object v0

    .line 174
    .local v0, "context":Landroid/content/Context;
    invoke-static {v0}, Lcom/vkontakte/android/audio/player/PlayerIntents;->getToggleRepeatNoneOrTrackIntent(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 175
    return-void
.end method

.method public static toggleResumePause()V
    .locals 2

    .prologue
    .line 85
    invoke-static {}, Lcom/vkontakte/android/audio/MusicApp;->getInstance()Landroid/content/Context;

    move-result-object v0

    .line 86
    .local v0, "context":Landroid/content/Context;
    invoke-static {v0}, Lcom/vkontakte/android/audio/player/PlayerIntents;->getToggleResumePauseIntent(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 87
    return-void
.end method

.method public static toggleShuffle()V
    .locals 2

    .prologue
    .line 140
    invoke-static {}, Lcom/vkontakte/android/audio/MusicApp;->getInstance()Landroid/content/Context;

    move-result-object v0

    .line 141
    .local v0, "context":Landroid/content/Context;
    invoke-static {v0}, Lcom/vkontakte/android/audio/player/PlayerIntents;->getToggleShuffleIntent(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 142
    return-void
.end method
