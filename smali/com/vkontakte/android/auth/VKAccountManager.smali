.class public Lcom/vkontakte/android/auth/VKAccountManager;
.super Ljava/lang/Object;
.source "VKAccountManager.java"


# static fields
.field private static volatile appContext:Landroid/content/Context;

.field private static volatile current:Lcom/vkontakte/android/auth/VKAccount;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 18
    const/4 v0, 0x0

    sput-object v0, Lcom/vkontakte/android/auth/VKAccountManager;->current:Lcom/vkontakte/android/auth/VKAccount;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static applyAccountToOld(Landroid/content/Context;Lcom/vkontakte/android/auth/VKAccount;)Lcom/vkontakte/android/auth/VKAccount;
    .locals 5
    .param p0, "ctx"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "account"    # Lcom/vkontakte/android/auth/VKAccount;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 137
    invoke-static {p1}, Lcom/vkontakte/android/auth/VKAccountManager;->fillAccountDataForAnalytics(Lcom/vkontakte/android/auth/VKAccount;)V

    .line 139
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 140
    .local v1, "prefs":Landroid/content/SharedPreferences;
    sget-object v2, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-static {v2}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 142
    .local v0, "generalPress":Landroid/content/SharedPreferences;
    const-string/jumbo v2, "gif_autoplay_available"

    invoke-static {v1, v0, v2}, Lcom/vkontakte/android/auth/VKAccountManager;->copyBooleanValue(Landroid/content/SharedPreferences;Landroid/content/SharedPreferences;Ljava/lang/String;)V

    .line 144
    if-nez p1, :cond_0

    .line 145
    invoke-static {v1}, Lcom/vkontakte/android/auth/VKAuthUtils;->clearAccountFromSharedPreferences(Landroid/content/SharedPreferences;)V

    .line 149
    :goto_0
    return-object p1

    .line 147
    :cond_0
    invoke-static {v1, p1}, Lcom/vkontakte/android/auth/VKAuthUtils;->saveAccountToSharedPreferences(Landroid/content/SharedPreferences;Lcom/vkontakte/android/auth/VKAccount;)V

    goto :goto_0
.end method

.method static declared-synchronized clearCurrent()Z
    .locals 3

    .prologue
    .line 57
    const-class v1, Lcom/vkontakte/android/auth/VKAccountManager;

    monitor-enter v1

    :try_start_0
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/auth/VKAccount;->isReal()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 58
    invoke-static {}, Lcom/vkontakte/android/auth/VKAuthUtils;->removeSystemAccountIfExist()V

    .line 59
    sget-object v0, Lcom/vkontakte/android/auth/VKAccountManager;->appContext:Landroid/content/Context;

    const/4 v2, 0x0

    invoke-static {v0, v2}, Lcom/vkontakte/android/auth/VKAccountManager;->applyAccountToOld(Landroid/content/Context;Lcom/vkontakte/android/auth/VKAccount;)Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v0

    sput-object v0, Lcom/vkontakte/android/auth/VKAccountManager;->current:Lcom/vkontakte/android/auth/VKAccount;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 60
    const/4 v0, 0x1

    .line 62
    :goto_0
    monitor-exit v1

    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    .line 57
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method private static copyBooleanValue(Landroid/content/SharedPreferences;Landroid/content/SharedPreferences;Ljava/lang/String;)V
    .locals 2
    .param p0, "newPrefs"    # Landroid/content/SharedPreferences;
    .param p1, "oldPrefs"    # Landroid/content/SharedPreferences;
    .param p2, "key"    # Ljava/lang/String;

    .prologue
    .line 153
    invoke-interface {p1, p2}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 154
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const/4 v1, 0x0

    invoke-interface {p1, p2, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    invoke-interface {v0, p2, v1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 156
    :cond_0
    return-void
.end method

.method public static editCurrent()Lcom/vkontakte/android/auth/VKAccountEditor;
    .locals 2
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 44
    new-instance v0, Lcom/vkontakte/android/auth/VKAccountEditor;

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vkontakte/android/auth/VKAccountEditor;-><init>(Lcom/vkontakte/android/auth/VKAccount;)V

    return-object v0
.end method

.method public static fillAccountDataForAnalytics(Lcom/vkontakte/android/auth/VKAccount;)V
    .locals 5
    .param p0, "account"    # Lcom/vkontakte/android/auth/VKAccount;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    const/4 v4, 0x0

    .line 124
    if-nez p0, :cond_0

    .line 125
    :try_start_0
    invoke-static {}, Lcom/vk/analytics/Analytics;->getInstance()Lcom/vk/analytics/Analytics;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    const-string/jumbo v3, "DELETED"

    invoke-virtual {v1, v2, v3}, Lcom/vk/analytics/Analytics;->setUserData(Ljava/lang/String;Ljava/lang/String;)V

    .line 133
    :goto_0
    return-void

    .line 128
    :cond_0
    invoke-static {}, Lcom/vk/analytics/Analytics;->getInstance()Lcom/vk/analytics/Analytics;

    move-result-object v1

    iget v2, p0, Lcom/vkontakte/android/auth/VKAccount;->uid:I

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0}, Lcom/vkontakte/android/auth/VKAccount;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/vk/analytics/Analytics;->setUserData(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 130
    :catch_0
    move-exception v0

    .line 131
    .local v0, "e":Ljava/lang/Exception;
    new-array v1, v4, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public static getCurrent()Lcom/vkontakte/android/auth/VKAccount;
    .locals 2
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 31
    sget-object v0, Lcom/vkontakte/android/auth/VKAccountManager;->current:Lcom/vkontakte/android/auth/VKAccount;

    if-nez v0, :cond_1

    .line 32
    const-class v1, Lcom/vkontakte/android/auth/VKAccountManager;

    monitor-enter v1

    .line 33
    :try_start_0
    sget-object v0, Lcom/vkontakte/android/auth/VKAccountManager;->current:Lcom/vkontakte/android/auth/VKAccount;

    if-nez v0, :cond_0

    .line 34
    sget-object v0, Lcom/vkontakte/android/auth/VKAccountManager;->appContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/vkontakte/android/auth/VKAccountManager;->loadAccountFromOld(Landroid/content/Context;)Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v0

    sput-object v0, Lcom/vkontakte/android/auth/VKAccountManager;->current:Lcom/vkontakte/android/auth/VKAccount;

    .line 35
    sget-object v0, Lcom/vkontakte/android/auth/VKAccountManager;->current:Lcom/vkontakte/android/auth/VKAccount;

    if-nez v0, :cond_2

    new-instance v0, Lcom/vkontakte/android/auth/VKAccount;

    invoke-direct {v0}, Lcom/vkontakte/android/auth/VKAccount;-><init>()V

    :goto_0
    sput-object v0, Lcom/vkontakte/android/auth/VKAccountManager;->current:Lcom/vkontakte/android/auth/VKAccount;

    .line 37
    :cond_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 39
    :cond_1
    sget-object v0, Lcom/vkontakte/android/auth/VKAccountManager;->current:Lcom/vkontakte/android/auth/VKAccount;

    return-object v0

    .line 35
    :cond_2
    :try_start_1
    sget-object v0, Lcom/vkontakte/android/auth/VKAccountManager;->current:Lcom/vkontakte/android/auth/VKAccount;

    goto :goto_0

    .line 37
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public static init(Landroid/content/Context;)V
    .locals 0
    .param p0, "ctx"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 22
    sput-object p0, Lcom/vkontakte/android/auth/VKAccountManager;->appContext:Landroid/content/Context;

    .line 23
    return-void
.end method

.method public static isCurrentUser(I)Z
    .locals 1
    .param p0, "uid"    # I

    .prologue
    .line 26
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v0

    iget v0, v0, Lcom/vkontakte/android/auth/VKAccount;->uid:I

    if-ne v0, p0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static loadAccountFromOld(Landroid/content/Context;)Lcom/vkontakte/android/auth/VKAccount;
    .locals 5
    .param p0, "ctx"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 160
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v3, v2, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 161
    .local v1, "prefs":Landroid/content/SharedPreferences;
    sget-object v3, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-static {v3}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 163
    .local v0, "generalPress":Landroid/content/SharedPreferences;
    const-string/jumbo v3, "gif_autoplay_available"

    invoke-static {v1, v0, v3}, Lcom/vkontakte/android/auth/VKAccountManager;->copyBooleanValue(Landroid/content/SharedPreferences;Landroid/content/SharedPreferences;Ljava/lang/String;)V

    .line 165
    const-string/jumbo v3, "sid"

    invoke-interface {v1, v3}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    new-instance v2, Lcom/vkontakte/android/auth/VKAccount;

    invoke-direct {v2}, Lcom/vkontakte/android/auth/VKAccount;-><init>()V

    invoke-static {v1, v2}, Lcom/vkontakte/android/auth/VKAuthUtils;->loadAccountFromSharedPreferences(Landroid/content/SharedPreferences;Lcom/vkontakte/android/auth/VKAccount;)Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v2

    :cond_0
    return-object v2
.end method

.method static declared-synchronized storeNewAccount(Lcom/vkontakte/android/auth/VKAccount;Lcom/vkontakte/android/api/execute/GetWallInfo$Result;)V
    .locals 5
    .param p0, "account"    # Lcom/vkontakte/android/auth/VKAccount;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "result"    # Lcom/vkontakte/android/api/execute/GetWallInfo$Result;

    .prologue
    .line 67
    const-class v2, Lcom/vkontakte/android/auth/VKAccountManager;

    monitor-enter v2

    :try_start_0
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vkontakte/android/auth/VKAccount;->isReal()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 68
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v0

    .line 69
    .local v0, "vkAccount":Lcom/vkontakte/android/auth/VKAccount;
    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v3, 0x0

    const-string/jumbo v4, "logout"

    aput-object v4, v1, v3

    const/4 v3, 0x1

    aput-object v0, v1, v3

    invoke-static {v1}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    .line 70
    iget-object v1, v0, Lcom/vkontakte/android/auth/VKAccount;->accessToken:Ljava/lang/String;

    iget-object v3, v0, Lcom/vkontakte/android/auth/VKAccount;->secret:Ljava/lang/String;

    invoke-static {v1, v3}, Lcom/vkontakte/android/auth/VKSession;->cleanSession(Ljava/lang/String;Ljava/lang/String;)V

    .line 74
    .end local v0    # "vkAccount":Lcom/vkontakte/android/auth/VKAccount;
    :cond_0
    invoke-static {p0, p1}, Lcom/vkontakte/android/auth/VKAuthUtils;->updateAccount(Lcom/vkontakte/android/auth/VKAccount;Lcom/vkontakte/android/api/execute/GetWallInfo$Result;)V

    .line 77
    sget-object v1, Lcom/vkontakte/android/auth/VKAccountManager;->appContext:Landroid/content/Context;

    invoke-static {v1, p0}, Lcom/vkontakte/android/auth/VKAccountManager;->applyAccountToOld(Landroid/content/Context;Lcom/vkontakte/android/auth/VKAccount;)Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v1

    sput-object v1, Lcom/vkontakte/android/auth/VKAccountManager;->current:Lcom/vkontakte/android/auth/VKAccount;

    .line 80
    invoke-static {}, Lcom/vkontakte/android/auth/VKAuthUtils;->removeSystemAccountIfExist()V

    .line 81
    iget-object v1, p0, Lcom/vkontakte/android/auth/VKAccount;->name:Ljava/lang/String;

    invoke-static {v1}, Lcom/vkontakte/android/auth/VKAuthUtils;->addSystemAccount(Ljava/lang/String;)Z

    .line 84
    const/4 v1, 0x1

    invoke-static {p1, v1}, Lcom/vkontakte/android/auth/VKSession;->updateSession(Lcom/vkontakte/android/api/execute/GetWallInfo$Result;Z)V

    .line 87
    invoke-static {}, Lcom/vkontakte/android/data/BenchmarkTracker;->getInstance()Lcom/vkontakte/android/data/BenchmarkTracker;

    move-result-object v1

    invoke-virtual {v1, p0}, Lcom/vkontakte/android/data/BenchmarkTracker;->updateProfileConfig(Lcom/vkontakte/android/auth/VKAccount;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 88
    monitor-exit v2

    return-void

    .line 67
    :catchall_0
    move-exception v1

    monitor-exit v2

    throw v1
.end method

.method public static updateCurrent(Lcom/vkontakte/android/api/execute/GetWallInfo$Result;)V
    .locals 4
    .param p0, "result"    # Lcom/vkontakte/android/api/execute/GetWallInfo$Result;

    .prologue
    .line 103
    new-instance v0, Lcom/vkontakte/android/auth/VKAccount;

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v3

    invoke-direct {v0, v3}, Lcom/vkontakte/android/auth/VKAccount;-><init>(Lcom/vkontakte/android/auth/VKAccount;)V

    .line 104
    .local v0, "account":Lcom/vkontakte/android/auth/VKAccount;
    iget-object v2, v0, Lcom/vkontakte/android/auth/VKAccount;->name:Ljava/lang/String;

    .line 105
    .local v2, "lastName":Ljava/lang/String;
    invoke-static {v0, p0}, Lcom/vkontakte/android/auth/VKAuthUtils;->updateAccount(Lcom/vkontakte/android/auth/VKAccount;Lcom/vkontakte/android/api/execute/GetWallInfo$Result;)V

    .line 108
    invoke-static {v0}, Lcom/vkontakte/android/auth/VKAccountManager;->updateCurrent(Lcom/vkontakte/android/auth/VKAccount;)Z

    move-result v1

    .line 110
    .local v1, "accountWasUpdated":Z
    if-eqz v1, :cond_1

    .line 111
    iget-object v3, p0, Lcom/vkontakte/android/api/execute/GetWallInfo$Result;->vkAccount:Lcom/vkontakte/android/auth/VKAccount;

    iget-object v3, v3, Lcom/vkontakte/android/auth/VKAccount;->name:Ljava/lang/String;

    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 113
    invoke-static {}, Lcom/vkontakte/android/auth/VKAuthUtils;->removeSystemAccountIfExist()V

    .line 114
    iget-object v3, v0, Lcom/vkontakte/android/auth/VKAccount;->name:Ljava/lang/String;

    invoke-static {v3}, Lcom/vkontakte/android/auth/VKAuthUtils;->addSystemAccount(Ljava/lang/String;)Z

    .line 118
    :cond_0
    const/4 v3, 0x0

    invoke-static {p0, v3}, Lcom/vkontakte/android/auth/VKSession;->updateSession(Lcom/vkontakte/android/api/execute/GetWallInfo$Result;Z)V

    .line 120
    :cond_1
    return-void
.end method

.method static updateCurrent(Lcom/vkontakte/android/auth/VKAccount;)Z
    .locals 2
    .param p0, "account"    # Lcom/vkontakte/android/auth/VKAccount;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 48
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v0

    invoke-virtual {p0}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v1

    if-ne v0, v1, :cond_0

    .line 49
    sget-object v0, Lcom/vkontakte/android/auth/VKAccountManager;->appContext:Landroid/content/Context;

    invoke-static {v0, p0}, Lcom/vkontakte/android/auth/VKAccountManager;->applyAccountToOld(Landroid/content/Context;Lcom/vkontakte/android/auth/VKAccount;)Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v0

    sput-object v0, Lcom/vkontakte/android/auth/VKAccountManager;->current:Lcom/vkontakte/android/auth/VKAccount;

    .line 50
    const/4 v0, 0x1

    .line 52
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static updateCurrentAccessData(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 2
    .param p0, "accessToken"    # Ljava/lang/String;
    .param p1, "secret"    # Ljava/lang/String;

    .prologue
    .line 91
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v0

    .line 92
    .local v0, "account":Lcom/vkontakte/android/auth/VKAccount;
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 93
    invoke-static {v0, p0}, Lcom/vkontakte/android/auth/VKAuthUtils;->updateAccessToken(Lcom/vkontakte/android/auth/VKAccount;Ljava/lang/String;)V

    .line 95
    :cond_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 96
    invoke-static {v0, p1}, Lcom/vkontakte/android/auth/VKAuthUtils;->updateSecret(Lcom/vkontakte/android/auth/VKAccount;Ljava/lang/String;)V

    .line 98
    :cond_1
    invoke-static {v0}, Lcom/vkontakte/android/auth/VKAccountManager;->updateCurrent(Lcom/vkontakte/android/auth/VKAccount;)Z

    move-result v1

    return v1
.end method
