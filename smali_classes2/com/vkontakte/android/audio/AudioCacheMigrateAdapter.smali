.class public Lcom/vkontakte/android/audio/AudioCacheMigrateAdapter;
.super Ljava/lang/Object;
.source "AudioCacheMigrateAdapter.java"


# static fields
.field private static volatile instance:Lcom/vkontakte/android/audio/AudioCacheMigrateAdapter;


# instance fields
.field private cacheWasImported:Lcom/vk/core/util/Preference$PreferenceBoolean;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 19
    const/4 v0, 0x0

    sput-object v0, Lcom/vkontakte/android/audio/AudioCacheMigrateAdapter;->instance:Lcom/vkontakte/android/audio/AudioCacheMigrateAdapter;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 4
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    const/4 v3, 0x0

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    const-string/jumbo v1, "PlayerService"

    invoke-virtual {p1, v1, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 23
    .local v0, "preferences":Landroid/content/SharedPreferences;
    new-instance v1, Lcom/vk/core/util/Preference$PreferenceBoolean;

    const-string/jumbo v2, "audioCacheWasImported"

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-direct {v1, v0, v2, v3}, Lcom/vk/core/util/Preference$PreferenceBoolean;-><init>(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/Boolean;)V

    iput-object v1, p0, Lcom/vkontakte/android/audio/AudioCacheMigrateAdapter;->cacheWasImported:Lcom/vk/core/util/Preference$PreferenceBoolean;

    .line 24
    return-void
.end method

.method public static declared-synchronized getInstance(Landroid/content/Context;)Lcom/vkontakte/android/audio/AudioCacheMigrateAdapter;
    .locals 2
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 27
    const-class v1, Lcom/vkontakte/android/audio/AudioCacheMigrateAdapter;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/vkontakte/android/audio/AudioCacheMigrateAdapter;->instance:Lcom/vkontakte/android/audio/AudioCacheMigrateAdapter;

    if-nez v0, :cond_0

    new-instance v0, Lcom/vkontakte/android/audio/AudioCacheMigrateAdapter;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/audio/AudioCacheMigrateAdapter;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/vkontakte/android/audio/AudioCacheMigrateAdapter;->instance:Lcom/vkontakte/android/audio/AudioCacheMigrateAdapter;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :goto_0
    monitor-exit v1

    return-object v0

    :cond_0
    :try_start_1
    sget-object v0, Lcom/vkontakte/android/audio/AudioCacheMigrateAdapter;->instance:Lcom/vkontakte/android/audio/AudioCacheMigrateAdapter;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method


# virtual methods
.method public importOldFiles()V
    .locals 9

    .prologue
    .line 31
    sget-object v7, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    iget-object v8, p0, Lcom/vkontakte/android/audio/AudioCacheMigrateAdapter;->cacheWasImported:Lcom/vk/core/util/Preference$PreferenceBoolean;

    invoke-virtual {v8}, Lcom/vk/core/util/Preference$PreferenceBoolean;->get()Ljava/lang/Boolean;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 57
    :goto_0
    return-void

    .line 35
    :cond_0
    :try_start_0
    sget-object v7, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-static {v7}, Lcom/vkontakte/android/cache/AudioCache;->getCachedList(Landroid/content/Context;)Ljava/util/ArrayList;

    move-result-object v4

    .line 36
    .local v4, "musicTracks":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/audio/MusicTrack;>;"
    if-eqz v4, :cond_3

    .line 37
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 39
    .local v6, "tracksForDownloading":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/audio/MusicTrack;>;"
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v7

    add-int/lit8 v2, v7, -0x1

    .local v2, "i":I
    :goto_1
    if-ltz v2, :cond_2

    .line 40
    invoke-interface {v4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/vkontakte/android/audio/MusicTrack;

    .line 41
    .local v3, "musicTrack":Lcom/vkontakte/android/audio/MusicTrack;
    invoke-static {v3}, Lcom/vkontakte/android/cache/AudioCache;->getFileForMusic(Lcom/vkontakte/android/audio/MusicTrack;)Ljava/io/File;

    move-result-object v1

    .line 42
    .local v1, "file":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v7

    if-eqz v7, :cond_1

    .line 43
    invoke-virtual {v3}, Lcom/vkontakte/android/audio/MusicTrack;->getMid()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/vkontakte/android/audio/AudioFacade;->getTrackDownloadFile(Ljava/lang/String;)Ljava/io/File;

    move-result-object v5

    .line 44
    .local v5, "newFile":Ljava/io/File;
    invoke-virtual {v5}, Ljava/io/File;->exists()Z

    move-result v7

    if-nez v7, :cond_1

    .line 45
    invoke-interface {v6, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 39
    .end local v5    # "newFile":Ljava/io/File;
    :cond_1
    add-int/lit8 v2, v2, -0x1

    goto :goto_1

    .line 50
    .end local v1    # "file":Ljava/io/File;
    .end local v3    # "musicTrack":Lcom/vkontakte/android/audio/MusicTrack;
    :cond_2
    const/4 v7, 0x1

    invoke-static {v6, v7}, Lcom/vkontakte/android/audio/AudioFacade;->startDownloadTracks(Ljava/util/Collection;Z)V

    .line 52
    .end local v2    # "i":I
    .end local v6    # "tracksForDownloading":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/audio/MusicTrack;>;"
    :cond_3
    invoke-static {}, Lcom/vkontakte/android/cache/AudioCache;->clear()V

    .line 53
    iget-object v7, p0, Lcom/vkontakte/android/audio/AudioCacheMigrateAdapter;->cacheWasImported:Lcom/vk/core/util/Preference$PreferenceBoolean;

    const/4 v8, 0x1

    invoke-static {v8}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v8

    invoke-virtual {v7, v8}, Lcom/vk/core/util/Preference$PreferenceBoolean;->set(Ljava/lang/Boolean;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 54
    .end local v4    # "musicTracks":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/audio/MusicTrack;>;"
    :catch_0
    move-exception v0

    .line 55
    .local v0, "e":Ljava/lang/Exception;
    invoke-static {v0}, Lcom/vk/analytics/Analytics;->logException(Ljava/lang/Throwable;)V

    goto :goto_0
.end method
