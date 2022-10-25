.class public Lcom/vkontakte/android/audio/player/Prefs;
.super Ljava/lang/Object;
.source "Prefs.java"

# interfaces
.implements Lcom/vk/core/util/Preference;


# static fields
.field private static volatile sInstance:Lcom/vkontakte/android/audio/player/Prefs;


# instance fields
.field public loopMode:Lcom/vk/core/util/Preference$PreferenceEnum;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vk/core/util/Preference$PreferenceEnum",
            "<",
            "Lcom/vkontakte/android/audio/player/LoopMode;",
            ">;"
        }
    .end annotation
.end field

.field public pausedBySystem:Lcom/vk/core/util/Preference$PreferenceBoolean;

.field public playedLastDate:Lcom/vk/core/util/Preference$PreferenceLong;

.field public playedTime:Lcom/vk/core/util/Preference$PreferenceLong;

.field public showedPausedInfo:Lcom/vk/core/util/Preference$PreferenceLongArray;

.field public shuffle:Lcom/vk/core/util/Preference$PreferenceBoolean;

.field public shuffleGlobal:Lcom/vk/core/util/Preference$PreferenceBoolean;

.field public stoppedTrackInfo:Lcom/vk/core/util/Preference$PreferenceString;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 10
    const/4 v0, 0x0

    sput-object v0, Lcom/vkontakte/android/audio/player/Prefs;->sInstance:Lcom/vkontakte/android/audio/player/Prefs;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 8
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const-wide/16 v6, 0x0

    const/4 v5, 0x0

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    const-string/jumbo v1, "PlayerService"

    invoke-virtual {p1, v1, v5}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 36
    .local v0, "preferences":Landroid/content/SharedPreferences;
    new-instance v1, Lcom/vk/core/util/Preference$PreferenceEnum;

    const-string/jumbo v2, "loop_mode"

    sget-object v3, Lcom/vkontakte/android/audio/player/LoopMode;->LIST:Lcom/vkontakte/android/audio/player/LoopMode;

    const-class v4, Lcom/vkontakte/android/audio/player/LoopMode;

    invoke-direct {v1, v0, v2, v3, v4}, Lcom/vk/core/util/Preference$PreferenceEnum;-><init>(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/Enum;Ljava/lang/Class;)V

    iput-object v1, p0, Lcom/vkontakte/android/audio/player/Prefs;->loopMode:Lcom/vk/core/util/Preference$PreferenceEnum;

    .line 37
    new-instance v1, Lcom/vk/core/util/Preference$PreferenceBoolean;

    const-string/jumbo v2, "shuffle"

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-direct {v1, v0, v2, v3}, Lcom/vk/core/util/Preference$PreferenceBoolean;-><init>(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/Boolean;)V

    iput-object v1, p0, Lcom/vkontakte/android/audio/player/Prefs;->shuffle:Lcom/vk/core/util/Preference$PreferenceBoolean;

    .line 38
    new-instance v1, Lcom/vk/core/util/Preference$PreferenceBoolean;

    const-string/jumbo v2, "shuffleGlobal"

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-direct {v1, v0, v2, v3}, Lcom/vk/core/util/Preference$PreferenceBoolean;-><init>(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/Boolean;)V

    iput-object v1, p0, Lcom/vkontakte/android/audio/player/Prefs;->shuffleGlobal:Lcom/vk/core/util/Preference$PreferenceBoolean;

    .line 39
    new-instance v1, Lcom/vk/core/util/Preference$PreferenceString;

    const-string/jumbo v2, "stopped_track_info"

    const/4 v3, 0x0

    invoke-direct {v1, v0, v2, v3}, Lcom/vk/core/util/Preference$PreferenceString;-><init>(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/String;)V

    iput-object v1, p0, Lcom/vkontakte/android/audio/player/Prefs;->stoppedTrackInfo:Lcom/vk/core/util/Preference$PreferenceString;

    .line 40
    new-instance v1, Lcom/vk/core/util/Preference$PreferenceBoolean;

    const-string/jumbo v2, "paused_by_system"

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-direct {v1, v0, v2, v3}, Lcom/vk/core/util/Preference$PreferenceBoolean;-><init>(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/Boolean;)V

    iput-object v1, p0, Lcom/vkontakte/android/audio/player/Prefs;->pausedBySystem:Lcom/vk/core/util/Preference$PreferenceBoolean;

    .line 42
    new-instance v1, Lcom/vk/core/util/Preference$PreferenceLong;

    const-string/jumbo v2, "played_time"

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-direct {v1, v0, v2, v3}, Lcom/vk/core/util/Preference$PreferenceLong;-><init>(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/Long;)V

    iput-object v1, p0, Lcom/vkontakte/android/audio/player/Prefs;->playedTime:Lcom/vk/core/util/Preference$PreferenceLong;

    .line 43
    new-instance v1, Lcom/vk/core/util/Preference$PreferenceLong;

    const-string/jumbo v2, "played_last_date"

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-direct {v1, v0, v2, v3}, Lcom/vk/core/util/Preference$PreferenceLong;-><init>(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/Long;)V

    iput-object v1, p0, Lcom/vkontakte/android/audio/player/Prefs;->playedLastDate:Lcom/vk/core/util/Preference$PreferenceLong;

    .line 45
    new-instance v1, Lcom/vk/core/util/Preference$PreferenceLongArray;

    const-string/jumbo v2, "showed_paused_info"

    new-array v3, v5, [Ljava/lang/Long;

    invoke-direct {v1, v0, v2, v3}, Lcom/vk/core/util/Preference$PreferenceLongArray;-><init>(Landroid/content/SharedPreferences;Ljava/lang/String;[Ljava/lang/Long;)V

    iput-object v1, p0, Lcom/vkontakte/android/audio/player/Prefs;->showedPausedInfo:Lcom/vk/core/util/Preference$PreferenceLongArray;

    .line 46
    return-void
.end method

.method public static getInstance(Landroid/content/Context;)Lcom/vkontakte/android/audio/player/Prefs;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 13
    sget-object v0, Lcom/vkontakte/android/audio/player/Prefs;->sInstance:Lcom/vkontakte/android/audio/player/Prefs;

    if-nez v0, :cond_1

    .line 14
    const-class v1, Lcom/vkontakte/android/audio/player/Prefs;

    monitor-enter v1

    .line 15
    :try_start_0
    sget-object v0, Lcom/vkontakte/android/audio/player/Prefs;->sInstance:Lcom/vkontakte/android/audio/player/Prefs;

    if-nez v0, :cond_0

    .line 16
    new-instance v0, Lcom/vkontakte/android/audio/player/Prefs;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/audio/player/Prefs;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/vkontakte/android/audio/player/Prefs;->sInstance:Lcom/vkontakte/android/audio/player/Prefs;

    .line 18
    :cond_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 20
    :cond_1
    sget-object v0, Lcom/vkontakte/android/audio/player/Prefs;->sInstance:Lcom/vkontakte/android/audio/player/Prefs;

    return-object v0

    .line 18
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method


# virtual methods
.method public clear()V
    .locals 1

    .prologue
    .line 49
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Prefs;->loopMode:Lcom/vk/core/util/Preference$PreferenceEnum;

    invoke-virtual {v0}, Lcom/vk/core/util/Preference$PreferenceEnum;->remove()V

    .line 50
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Prefs;->shuffle:Lcom/vk/core/util/Preference$PreferenceBoolean;

    invoke-virtual {v0}, Lcom/vk/core/util/Preference$PreferenceBoolean;->remove()V

    .line 51
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Prefs;->shuffleGlobal:Lcom/vk/core/util/Preference$PreferenceBoolean;

    invoke-virtual {v0}, Lcom/vk/core/util/Preference$PreferenceBoolean;->remove()V

    .line 52
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Prefs;->stoppedTrackInfo:Lcom/vk/core/util/Preference$PreferenceString;

    invoke-virtual {v0}, Lcom/vk/core/util/Preference$PreferenceString;->remove()V

    .line 53
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Prefs;->pausedBySystem:Lcom/vk/core/util/Preference$PreferenceBoolean;

    invoke-virtual {v0}, Lcom/vk/core/util/Preference$PreferenceBoolean;->remove()V

    .line 55
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Prefs;->playedTime:Lcom/vk/core/util/Preference$PreferenceLong;

    invoke-virtual {v0}, Lcom/vk/core/util/Preference$PreferenceLong;->remove()V

    .line 56
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Prefs;->playedLastDate:Lcom/vk/core/util/Preference$PreferenceLong;

    invoke-virtual {v0}, Lcom/vk/core/util/Preference$PreferenceLong;->remove()V

    .line 58
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/Prefs;->showedPausedInfo:Lcom/vk/core/util/Preference$PreferenceLongArray;

    invoke-virtual {v0}, Lcom/vk/core/util/Preference$PreferenceLongArray;->remove()V

    .line 59
    return-void
.end method
