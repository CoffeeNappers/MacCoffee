.class public Lcom/vkontakte/android/cache/Gifs;
.super Lcom/vkontakte/android/cache/FileLruCache;
.source "Gifs.java"


# static fields
.field static volatile sInstance:Lcom/vkontakte/android/cache/Gifs;


# direct methods
.method constructor <init>(Ljava/io/File;J)V
    .locals 0
    .param p1, "path"    # Ljava/io/File;
    .param p2, "maxSize"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 41
    invoke-direct {p0, p1, p2, p3}, Lcom/vkontakte/android/cache/FileLruCache;-><init>(Ljava/io/File;J)V

    .line 42
    return-void
.end method

.method public static allowAutoPlay()Z
    .locals 5

    .prologue
    const/4 v2, 0x0

    .line 54
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v3

    invoke-virtual {v3}, Lcom/vkontakte/android/auth/VKAccount;->isGifAutoPlayAvailable()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 55
    sget-object v3, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-static {v3}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 56
    .local v0, "preferences":Landroid/content/SharedPreferences;
    const-string/jumbo v3, "gif_autoplay"

    const-string/jumbo v4, "always"

    invoke-interface {v0, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 57
    .local v1, "value":Ljava/lang/String;
    const-string/jumbo v3, "always"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    const-string/jumbo v3, "wifi"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-static {}, Lcom/vkontakte/android/utils/Utils;->isWifi()Z

    move-result v3

    if-eqz v3, :cond_1

    :cond_0
    const/4 v2, 0x1

    .line 59
    :cond_1
    return v2
.end method

.method public static get()Lcom/vkontakte/android/cache/Gifs;
    .locals 8

    .prologue
    .line 24
    sget-object v1, Lcom/vkontakte/android/cache/Gifs;->sInstance:Lcom/vkontakte/android/cache/Gifs;

    .line 25
    .local v1, "localInstance":Lcom/vkontakte/android/cache/Gifs;
    if-nez v1, :cond_1

    .line 26
    const-class v4, Lcom/vkontakte/android/cache/Gifs;

    monitor-enter v4

    .line 27
    :try_start_0
    sget-object v1, Lcom/vkontakte/android/cache/Gifs;->sInstance:Lcom/vkontakte/android/cache/Gifs;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 28
    if-nez v1, :cond_0

    .line 30
    :try_start_1
    new-instance v2, Lcom/vkontakte/android/cache/Gifs;

    new-instance v3, Ljava/io/File;

    sget-object v5, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v5

    const-string/jumbo v6, "gifs"

    invoke-direct {v3, v5, v6}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    const-wide/32 v6, 0x3200000

    invoke-direct {v2, v3, v6, v7}, Lcom/vkontakte/android/cache/Gifs;-><init>(Ljava/io/File;J)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .end local v1    # "localInstance":Lcom/vkontakte/android/cache/Gifs;
    .local v2, "localInstance":Lcom/vkontakte/android/cache/Gifs;
    :try_start_2
    sput-object v2, Lcom/vkontakte/android/cache/Gifs;->sInstance:Lcom/vkontakte/android/cache/Gifs;
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    move-object v1, v2

    .line 35
    .end local v2    # "localInstance":Lcom/vkontakte/android/cache/Gifs;
    .restart local v1    # "localInstance":Lcom/vkontakte/android/cache/Gifs;
    :cond_0
    :try_start_3
    monitor-exit v4

    .line 37
    :cond_1
    return-object v1

    .line 31
    :catch_0
    move-exception v0

    .line 32
    .local v0, "e":Ljava/io/IOException;
    :goto_0
    new-instance v3, Ljava/lang/RuntimeException;

    invoke-direct {v3, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v3

    .line 35
    .end local v0    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v3

    :goto_1
    monitor-exit v4
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v3

    .end local v1    # "localInstance":Lcom/vkontakte/android/cache/Gifs;
    .restart local v2    # "localInstance":Lcom/vkontakte/android/cache/Gifs;
    :catchall_1
    move-exception v3

    move-object v1, v2

    .end local v2    # "localInstance":Lcom/vkontakte/android/cache/Gifs;
    .restart local v1    # "localInstance":Lcom/vkontakte/android/cache/Gifs;
    goto :goto_1

    .line 31
    .end local v1    # "localInstance":Lcom/vkontakte/android/cache/Gifs;
    .restart local v2    # "localInstance":Lcom/vkontakte/android/cache/Gifs;
    :catch_1
    move-exception v0

    move-object v1, v2

    .end local v2    # "localInstance":Lcom/vkontakte/android/cache/Gifs;
    .restart local v1    # "localInstance":Lcom/vkontakte/android/cache/Gifs;
    goto :goto_0
.end method

.method public static getAutoPlayState()Ljava/lang/String;
    .locals 3

    .prologue
    .line 45
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vkontakte/android/auth/VKAccount;->isGifAutoPlayAvailable()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 46
    sget-object v1, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-static {v1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 47
    .local v0, "preferences":Landroid/content/SharedPreferences;
    const-string/jumbo v1, "gif_autoplay"

    const-string/jumbo v2, "always"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 49
    .end local v0    # "preferences":Landroid/content/SharedPreferences;
    :goto_0
    return-object v1

    :cond_0
    const-string/jumbo v1, "unavailable"

    goto :goto_0
.end method


# virtual methods
.method public convertKey(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "input"    # Ljava/lang/String;

    .prologue
    .line 65
    invoke-static {p1}, Lcom/vkontakte/android/api/VKAPIRequest;->md5(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public trackPlayEvent(IZ)V
    .locals 3
    .param p1, "gif_id"    # I
    .param p2, "autoplay"    # Z

    .prologue
    .line 69
    const-string/jumbo v0, "gif_play"

    invoke-static {v0}, Lcom/vkontakte/android/data/Analytics;->track(Ljava/lang/String;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v0

    const-string/jumbo v1, "gif_id"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->addParam(Ljava/lang/String;Ljava/lang/Object;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v1

    const-string/jumbo v2, "start_type"

    if-eqz p2, :cond_0

    const-string/jumbo v0, "autoplay"

    :goto_0
    invoke-virtual {v1, v2, v0}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->addParam(Ljava/lang/String;Ljava/lang/Object;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->commit()Lcom/vkontakte/android/data/Analytics$EventBuilder;

    .line 70
    return-void

    .line 69
    :cond_0
    const-string/jumbo v0, "manual"

    goto :goto_0
.end method
