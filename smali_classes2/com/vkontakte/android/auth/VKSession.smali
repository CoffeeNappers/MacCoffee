.class public Lcom/vkontakte/android/auth/VKSession;
.super Ljava/lang/Object;
.source "VKSession.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static cleanSession(Ljava/lang/String;Ljava/lang/String;)V
    .locals 7
    .param p0, "accessToken"    # Ljava/lang/String;
    .param p1, "secret"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 60
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    .line 62
    .local v0, "ctx":Landroid/content/Context;
    new-array v3, v5, [Ljava/lang/Object;

    const-string/jumbo v4, "logout"

    aput-object v4, v3, v6

    invoke-static {v3}, Lcom/vkontakte/android/utils/L;->i([Ljava/lang/Object;)V

    .line 64
    invoke-static {}, Lcom/vkontakte/android/LongPollService;->logout()V

    .line 66
    invoke-static {}, Lcom/vkontakte/android/fragments/NewsFragment;->onLogout()V

    .line 70
    :try_start_0
    sget-object v3, Lcom/vkontakte/android/data/Messages;->updateLock:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v3}, Ljava/util/concurrent/Semaphore;->acquire()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 74
    :goto_0
    sget-object v3, Lcom/vkontakte/android/data/Messages;->updateLock:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v3}, Ljava/util/concurrent/Semaphore;->release()V

    .line 77
    invoke-static {}, Lcom/vk/stories/StoriesController;->clear()V

    .line 80
    invoke-static {}, Lcom/vk/masks/MasksController;->getInstance()Lcom/vk/masks/MasksController;

    move-result-object v3

    invoke-virtual {v3}, Lcom/vk/masks/MasksController;->clear()V

    .line 81
    invoke-static {}, Lcom/vk/masks/MasksPrefs;->instance()Lcom/vk/masks/MasksPrefs;

    move-result-object v3

    invoke-virtual {v3}, Lcom/vk/masks/MasksPrefs;->clear()V

    .line 82
    invoke-static {}, Lcom/vk/camera/CameraPrefs;->instance()Lcom/vk/camera/CameraPrefs;

    move-result-object v3

    invoke-virtual {v3}, Lcom/vk/camera/CameraPrefs;->clear()V

    .line 85
    invoke-static {}, Lcom/vk/attachpicker/util/Prefs;->storiesPrefs()Lcom/vk/attachpicker/util/Prefs;

    move-result-object v3

    invoke-virtual {v3}, Lcom/vk/attachpicker/util/Prefs;->clear()V

    .line 86
    invoke-static {}, Lcom/vk/attachpicker/util/Prefs;->pickerPrefs()Lcom/vk/attachpicker/util/Prefs;

    move-result-object v3

    invoke-virtual {v3}, Lcom/vk/attachpicker/util/Prefs;->clear()V

    .line 89
    invoke-static {}, Lcom/vkontakte/android/cache/Cache;->clear()V

    .line 92
    invoke-static {p0, p1}, Lcom/vkontakte/android/C2DM;->stop(Ljava/lang/String;Ljava/lang/String;)Z

    .line 95
    invoke-static {}, Lcom/vkontakte/android/audio/AudioFacade;->logout()V

    .line 98
    const-string/jumbo v3, "notification"

    invoke-virtual {v0, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/app/NotificationManager;

    invoke-virtual {v3}, Landroid/app/NotificationManager;->cancelAll()V

    .line 101
    const/4 v3, 0x0

    invoke-virtual {v0, v3, v6}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v3

    invoke-interface {v3}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    invoke-interface {v3}, Landroid/content/SharedPreferences$Editor;->clear()Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    invoke-interface {v3}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 102
    const-string/jumbo v3, "drafts"

    invoke-virtual {v0, v3, v6}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v3

    invoke-interface {v3}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    invoke-interface {v3}, Landroid/content/SharedPreferences$Editor;->clear()Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    invoke-interface {v3}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 103
    const-string/jumbo v3, "news"

    invoke-virtual {v0, v3, v6}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v3

    invoke-interface {v3}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    invoke-interface {v3}, Landroid/content/SharedPreferences$Editor;->clear()Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    invoke-interface {v3}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 104
    const-string/jumbo v3, "longpoll"

    invoke-virtual {v0, v3, v6}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v3

    invoke-interface {v3}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    invoke-interface {v3}, Landroid/content/SharedPreferences$Editor;->clear()Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    invoke-interface {v3}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 105
    const-string/jumbo v3, "stickers"

    invoke-virtual {v0, v3, v6}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v3

    invoke-interface {v3}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    invoke-interface {v3}, Landroid/content/SharedPreferences$Editor;->clear()Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    invoke-interface {v3}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 106
    const-string/jumbo v3, "pending_installs"

    invoke-virtual {v0, v3, v6}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v3

    invoke-interface {v3}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    invoke-interface {v3}, Landroid/content/SharedPreferences$Editor;->clear()Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    invoke-interface {v3}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 107
    const-string/jumbo v3, "cookieStore"

    invoke-virtual {v0, v3, v6}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v3

    invoke-interface {v3}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    invoke-interface {v3}, Landroid/content/SharedPreferences$Editor;->clear()Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    invoke-interface {v3}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 108
    const-string/jumbo v3, "AudioMessagePlayerService"

    invoke-virtual {v0, v3, v6}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v3

    invoke-interface {v3}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    invoke-interface {v3}, Landroid/content/SharedPreferences$Editor;->clear()Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    invoke-interface {v3}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 109
    const-string/jumbo v3, "video_stats"

    invoke-virtual {v0, v3, v6}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v3

    invoke-interface {v3}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    invoke-interface {v3}, Landroid/content/SharedPreferences$Editor;->clear()Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    invoke-interface {v3}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 110
    const-string/jumbo v3, "music_search"

    invoke-virtual {v0, v3, v6}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v3

    invoke-interface {v3}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    invoke-interface {v3}, Landroid/content/SharedPreferences$Editor;->clear()Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    invoke-interface {v3}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 112
    invoke-static {v0}, Lcom/vkontakte/android/audio/player/Prefs;->getInstance(Landroid/content/Context;)Lcom/vkontakte/android/audio/player/Prefs;

    move-result-object v3

    invoke-virtual {v3}, Lcom/vkontakte/android/audio/player/Prefs;->clear()V

    .line 115
    invoke-static {}, Lcom/vkontakte/android/cache/NewsfeedCache;->clear()V

    .line 116
    const-string/jumbo v3, "posts.db"

    invoke-virtual {v0, v3}, Landroid/content/Context;->deleteDatabase(Ljava/lang/String;)Z

    .line 117
    const-string/jumbo v3, "friends.db"

    invoke-virtual {v0, v3}, Landroid/content/Context;->deleteDatabase(Ljava/lang/String;)Z

    .line 118
    const-string/jumbo v3, "dialogs.db"

    invoke-virtual {v0, v3}, Landroid/content/Context;->deleteDatabase(Ljava/lang/String;)Z

    .line 119
    const-string/jumbo v3, "chats.db"

    invoke-virtual {v0, v3}, Landroid/content/Context;->deleteDatabase(Ljava/lang/String;)Z

    .line 120
    const-string/jumbo v3, "groups.db"

    invoke-virtual {v0, v3}, Landroid/content/Context;->deleteDatabase(Ljava/lang/String;)Z

    .line 121
    invoke-static {}, Lcom/vkontakte/android/data/Friends;->reset()V

    .line 122
    invoke-static {}, Lcom/vkontakte/android/data/Messages;->reset()V

    .line 123
    invoke-static {}, Lcom/vkontakte/android/data/Groups;->reset()V

    .line 124
    invoke-static {v5}, Lcom/vkontakte/android/data/Analytics;->clear(Z)V

    .line 125
    sput-boolean v6, Lcom/vkontakte/android/Global;->inited:Z

    .line 126
    sget-object v3, Lcom/vkontakte/android/data/Posts;->feed:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->clear()V

    .line 127
    const-string/jumbo v3, "0"

    sput-object v3, Lcom/vkontakte/android/data/Posts;->feedFrom:Ljava/lang/String;

    .line 128
    sput v6, Lcom/vkontakte/android/data/Posts;->feedItem:I

    .line 129
    sput v6, Lcom/vkontakte/android/data/Posts;->feedOffset:I

    .line 130
    sput v6, Lcom/vkontakte/android/data/Posts;->feedItemOffset:I

    .line 131
    sget-object v3, Lcom/vkontakte/android/data/Posts;->preloadedFeed:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->clear()V

    .line 132
    invoke-static {}, Lcom/vkontakte/android/stickers/Stickers;->get()Lcom/vkontakte/android/stickers/Stickers;

    move-result-object v3

    invoke-virtual {v3}, Lcom/vkontakte/android/stickers/Stickers;->clearAll()V

    .line 133
    invoke-static {}, Lcom/vkontakte/android/AudioMessagePlayerService;->cleanCache()V

    .line 134
    invoke-static {}, Lcom/vkontakte/android/utils/L;->getInstance()Lcom/vkontakte/android/utils/L;

    move-result-object v3

    invoke-virtual {v3}, Lcom/vkontakte/android/utils/L;->clear()V

    .line 136
    new-instance v3, Ljava/io/File;

    invoke-virtual {v0}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v4

    const-string/jumbo v5, "replies"

    invoke-direct {v3, v4, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    .line 137
    new-instance v3, Ljava/io/File;

    invoke-virtual {v0}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v4

    const-string/jumbo v5, "friends_requests_in"

    invoke-direct {v3, v4, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    .line 138
    new-instance v3, Ljava/io/File;

    invoke-virtual {v0}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v4

    const-string/jumbo v5, "friends_requests_suggest"

    invoke-direct {v3, v4, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    .line 142
    :try_start_1
    sget-object v3, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    .line 143
    invoke-static {v3}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v3

    const-string/jumbo v4, "mytrackerLocationCrapEnabled"

    const/4 v5, 0x1

    .line 144
    invoke-interface {v3, v4, v5}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    .line 142
    invoke-static {v0, v3}, Lru/mail/libverify/api/VerificationFactory;->setLocationUsage(Landroid/content/Context;Z)V

    .line 145
    invoke-static {v0}, Lru/mail/libverify/api/VerificationFactory;->softSignOut(Landroid/content/Context;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 149
    :goto_1
    return-void

    .line 71
    :catch_0
    move-exception v2

    .line 72
    .local v2, "x":Ljava/lang/Exception;
    new-array v3, v6, [Ljava/lang/Object;

    invoke-static {v2, v3}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto/16 :goto_0

    .line 146
    .end local v2    # "x":Ljava/lang/Exception;
    :catch_1
    move-exception v1

    .line 147
    .local v1, "e":Ljava/lang/Exception;
    new-array v3, v6, [Ljava/lang/Object;

    invoke-static {v1, v3}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto :goto_1
.end method

.method static updateSession(Lcom/vkontakte/android/api/execute/GetWallInfo$Result;Z)V
    .locals 2
    .param p0, "result"    # Lcom/vkontakte/android/api/execute/GetWallInfo$Result;
    .param p1, "newAccount"    # Z

    .prologue
    .line 40
    if-eqz p1, :cond_2

    .line 41
    invoke-static {}, Lcom/vkontakte/android/C2DM;->start()V

    .line 46
    :goto_0
    invoke-static {}, Lcom/vkontakte/android/stickers/Stickers;->get()Lcom/vkontakte/android/stickers/Stickers;

    move-result-object v0

    .line 47
    .local v0, "stickers":Lcom/vkontakte/android/stickers/Stickers;
    iget-object v1, p0, Lcom/vkontakte/android/api/execute/GetWallInfo$Result;->hasNewItemsResponse:Lcom/vkontakte/android/api/store/StoreHasNewItems$Response;

    if-eqz v1, :cond_0

    .line 48
    iget-object v1, p0, Lcom/vkontakte/android/api/execute/GetWallInfo$Result;->hasNewItemsResponse:Lcom/vkontakte/android/api/store/StoreHasNewItems$Response;

    iget v1, v1, Lcom/vkontakte/android/api/store/StoreHasNewItems$Response;->storeNewItems:I

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/stickers/Stickers;->setNewItems(I)V

    .line 49
    iget-object v1, p0, Lcom/vkontakte/android/api/execute/GetWallInfo$Result;->hasNewItemsResponse:Lcom/vkontakte/android/api/store/StoreHasNewItems$Response;

    iget v1, v1, Lcom/vkontakte/android/api/store/StoreHasNewItems$Response;->globalPromotion:I

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/stickers/Stickers;->setGlobalPromotions(I)V

    .line 50
    iget-object v1, p0, Lcom/vkontakte/android/api/execute/GetWallInfo$Result;->hasNewItemsResponse:Lcom/vkontakte/android/api/store/StoreHasNewItems$Response;

    iget-object v1, v1, Lcom/vkontakte/android/api/store/StoreHasNewItems$Response;->stickersVersionHash:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/stickers/Stickers;->setStickersHash(Ljava/lang/String;)V

    .line 54
    :cond_0
    iget-boolean v1, p0, Lcom/vkontakte/android/api/execute/GetWallInfo$Result;->needUpdateGoogleNow:Z

    if-eqz v1, :cond_1

    .line 55
    invoke-static {}, Lcom/vkontakte/android/GoogleNow;->updateTokenAsync()V

    .line 57
    :cond_1
    return-void

    .line 43
    .end local v0    # "stickers":Lcom/vkontakte/android/stickers/Stickers;
    :cond_2
    invoke-static {}, Lcom/vkontakte/android/C2DM;->checkForUpdate()V

    goto :goto_0
.end method
