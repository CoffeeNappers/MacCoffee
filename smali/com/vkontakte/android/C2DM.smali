.class public Lcom/vkontakte/android/C2DM;
.super Ljava/lang/Object;
.source "C2DM.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/C2DM$UnregisterRunnable;,
        Lcom/vkontakte/android/C2DM$RegisterRunnable;,
        Lcom/vkontakte/android/C2DM$ThrowableRunnable;
    }
.end annotation


# static fields
.field private static final GCM_ID:Ljava/lang/String; = "841415684880"

.field private static final KEY_CURRENT_USER:Ljava/lang/String; = "current_user"

.field private static final KEY_LAST_VERSION_CODE:Ljava/lang/String; = "version"

.field private static final KEY_REGISTER_TOKEN:Ljava/lang/String; = "reg"

.field private static final PREFS_NAME:Ljava/lang/String; = "gcm"

.field private static final countInQueue:Ljava/util/concurrent/atomic/AtomicInteger;

.field private static final countOfRegister:Ljava/util/concurrent/atomic/AtomicInteger;

.field private static final countOfUnregister:Ljava/util/concurrent/atomic/AtomicInteger;

.field private static volatile handler:Landroid/os/Handler;

.field private static final stopHandlerRunnable:Ljava/lang/Runnable;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 39
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    sput-object v0, Lcom/vkontakte/android/C2DM;->countInQueue:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 40
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    sput-object v0, Lcom/vkontakte/android/C2DM;->countOfRegister:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 41
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    sput-object v0, Lcom/vkontakte/android/C2DM;->countOfUnregister:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 42
    const/4 v0, 0x0

    sput-object v0, Lcom/vkontakte/android/C2DM;->handler:Landroid/os/Handler;

    .line 43
    invoke-static {}, Lcom/vkontakte/android/C2DM$$Lambda$2;->lambdaFactory$()Ljava/lang/Runnable;

    move-result-object v0

    sput-object v0, Lcom/vkontakte/android/C2DM;->stopHandlerRunnable:Ljava/lang/Runnable;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Landroid/content/SharedPreferences;)V
    .locals 0
    .param p0, "x0"    # Landroid/content/SharedPreferences;

    .prologue
    .line 25
    invoke-static {p0}, Lcom/vkontakte/android/C2DM;->clearData(Landroid/content/SharedPreferences;)V

    return-void
.end method

.method static synthetic access$100()Ljava/util/concurrent/atomic/AtomicInteger;
    .locals 1

    .prologue
    .line 25
    sget-object v0, Lcom/vkontakte/android/C2DM;->countOfRegister:Ljava/util/concurrent/atomic/AtomicInteger;

    return-object v0
.end method

.method static synthetic access$200()Ljava/util/concurrent/atomic/AtomicInteger;
    .locals 1

    .prologue
    .line 25
    sget-object v0, Lcom/vkontakte/android/C2DM;->countOfUnregister:Ljava/util/concurrent/atomic/AtomicInteger;

    return-object v0
.end method

.method public static checkForUpdate()V
    .locals 1

    .prologue
    .line 219
    const/4 v0, 0x0

    invoke-static {v0}, Lcom/vkontakte/android/C2DM;->startInner(Z)V

    .line 220
    return-void
.end method

.method private static clearData(Landroid/content/SharedPreferences;)V
    .locals 2
    .param p0, "prefsGcm"    # Landroid/content/SharedPreferences;

    .prologue
    .line 211
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string/jumbo v1, "current_user"

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string/jumbo v1, "reg"

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 212
    return-void
.end method

.method private static getHandler()Landroid/os/Handler;
    .locals 4

    .prologue
    .line 57
    sget-object v2, Lcom/vkontakte/android/C2DM;->countInQueue:Ljava/util/concurrent/atomic/AtomicInteger;

    monitor-enter v2

    .line 58
    :try_start_0
    sget-object v1, Lcom/vkontakte/android/C2DM;->handler:Landroid/os/Handler;

    if-nez v1, :cond_0

    .line 59
    new-instance v0, Landroid/os/HandlerThread;

    const-string/jumbo v1, "C2DM Thread"

    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 60
    .local v0, "handlerThread":Landroid/os/HandlerThread;
    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    .line 61
    new-instance v1, Landroid/os/Handler;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v3

    invoke-direct {v1, v3}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v1, Lcom/vkontakte/android/C2DM;->handler:Landroid/os/Handler;

    .line 63
    :cond_0
    sget-object v1, Lcom/vkontakte/android/C2DM;->handler:Landroid/os/Handler;

    monitor-exit v2

    return-object v1

    .line 64
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public static getToken(Landroid/content/Context;)Ljava/lang/String;
    .locals 3
    .param p0, "ctx"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 84
    invoke-static {p0}, Lcom/google/android/gms/iid/InstanceID;->getInstance(Landroid/content/Context;)Lcom/google/android/gms/iid/InstanceID;

    move-result-object v0

    const-string/jumbo v1, "841415684880"

    const-string/jumbo v2, "GCM"

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/iid/InstanceID;->getToken(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic lambda$post$1(Lcom/vkontakte/android/C2DM$ThrowableRunnable;)V
    .locals 6
    .param p0, "run"    # Lcom/vkontakte/android/C2DM$ThrowableRunnable;

    .prologue
    const-wide/16 v4, 0x1388

    .line 71
    :try_start_0
    invoke-interface {p0}, Lcom/vkontakte/android/C2DM$ThrowableRunnable;->run()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 75
    sget-object v1, Lcom/vkontakte/android/C2DM;->countInQueue:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 76
    sget-object v1, Lcom/vkontakte/android/C2DM;->countInQueue:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v1

    if-nez v1, :cond_0

    .line 77
    new-instance v1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sget-object v2, Lcom/vkontakte/android/C2DM;->stopHandlerRunnable:Ljava/lang/Runnable;

    invoke-virtual {v1, v2, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 80
    :cond_0
    :goto_0
    return-void

    .line 72
    :catch_0
    move-exception v0

    .line 73
    .local v0, "e":Ljava/lang/Exception;
    const/4 v1, 0x0

    :try_start_1
    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 75
    sget-object v1, Lcom/vkontakte/android/C2DM;->countInQueue:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 76
    sget-object v1, Lcom/vkontakte/android/C2DM;->countInQueue:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v1

    if-nez v1, :cond_0

    .line 77
    new-instance v1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sget-object v2, Lcom/vkontakte/android/C2DM;->stopHandlerRunnable:Ljava/lang/Runnable;

    invoke-virtual {v1, v2, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_0

    .line 75
    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v1

    sget-object v2, Lcom/vkontakte/android/C2DM;->countInQueue:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 76
    sget-object v2, Lcom/vkontakte/android/C2DM;->countInQueue:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v2

    if-nez v2, :cond_1

    .line 77
    new-instance v2, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sget-object v3, Lcom/vkontakte/android/C2DM;->stopHandlerRunnable:Ljava/lang/Runnable;

    invoke-virtual {v2, v3, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_1
    throw v1
.end method

.method static synthetic lambda$static$0()V
    .locals 3

    .prologue
    .line 44
    sget-object v2, Lcom/vkontakte/android/C2DM;->countInQueue:Ljava/util/concurrent/atomic/AtomicInteger;

    monitor-enter v2

    .line 45
    :try_start_0
    sget-object v1, Lcom/vkontakte/android/C2DM;->countInQueue:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v1

    if-nez v1, :cond_0

    sget-object v1, Lcom/vkontakte/android/C2DM;->handler:Landroid/os/Handler;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v1, :cond_0

    .line 47
    :try_start_1
    sget-object v1, Lcom/vkontakte/android/C2DM;->handler:Landroid/os/Handler;

    invoke-virtual {v1}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-virtual {v1}, Landroid/os/Looper;->quit()V

    .line 48
    const/4 v1, 0x0

    sput-object v1, Lcom/vkontakte/android/C2DM;->handler:Landroid/os/Handler;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 53
    .local v0, "e":Ljava/lang/Exception;
    :cond_0
    :goto_0
    :try_start_2
    monitor-exit v2

    .line 54
    return-void

    .line 49
    .end local v0    # "e":Ljava/lang/Exception;
    :catch_0
    move-exception v0

    .line 50
    .restart local v0    # "e":Ljava/lang/Exception;
    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto :goto_0

    .line 53
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1
.end method

.method private static post(Lcom/vkontakte/android/C2DM$ThrowableRunnable;)V
    .locals 2
    .param p0, "run"    # Lcom/vkontakte/android/C2DM$ThrowableRunnable;

    .prologue
    .line 68
    sget-object v0, Lcom/vkontakte/android/C2DM;->countInQueue:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    .line 69
    invoke-static {}, Lcom/vkontakte/android/C2DM;->getHandler()Landroid/os/Handler;

    move-result-object v0

    invoke-static {p0}, Lcom/vkontakte/android/C2DM$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/C2DM$ThrowableRunnable;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 81
    return-void
.end method

.method public static start()V
    .locals 1

    .prologue
    .line 215
    const/4 v0, 0x0

    invoke-static {v0}, Lcom/vkontakte/android/C2DM;->startInner(Z)V

    .line 216
    return-void
.end method

.method private static startInner(Z)V
    .locals 11
    .param p0, "force"    # Z

    .prologue
    const/4 v10, 0x0

    .line 224
    const/4 v7, 0x2

    :try_start_0
    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v9

    aput-object v9, v7, v8

    const/4 v8, 0x1

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v9

    invoke-virtual {v9}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v9

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v7, v8

    invoke-static {v7}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    .line 226
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    .line 227
    .local v0, "ctx":Landroid/content/Context;
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v6

    .line 229
    .local v6, "vkAccount":Lcom/vkontakte/android/auth/VKAccount;
    const-string/jumbo v7, "gcm"

    const/4 v8, 0x0

    invoke-virtual {v0, v7, v8}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v5

    .line 230
    .local v5, "prefsGcm":Landroid/content/SharedPreferences;
    const-string/jumbo v7, "version"

    const/4 v8, 0x0

    invoke-interface {v5, v7, v8}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v4

    .line 231
    .local v4, "lastVersion":I
    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v7

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x0

    invoke-virtual {v7, v8, v9}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v7

    iget v1, v7, Landroid/content/pm/PackageInfo;->versionCode:I

    .line 233
    .local v1, "currentVersion":I
    const-string/jumbo v7, "current_user"

    const/4 v8, 0x0

    invoke-interface {v5, v7, v8}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v3

    .line 235
    .local v3, "lastUserId":I
    invoke-virtual {v6}, Lcom/vkontakte/android/auth/VKAccount;->isReal()Z

    move-result v7

    if-eqz v7, :cond_2

    if-ne v4, v1, :cond_0

    .line 236
    invoke-virtual {v6}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v7

    if-ne v3, v7, :cond_0

    if-eqz p0, :cond_2

    .line 237
    :cond_0
    sget-object v8, Lcom/vkontakte/android/C2DM;->countOfRegister:Ljava/util/concurrent/atomic/AtomicInteger;

    monitor-enter v8
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 238
    :try_start_1
    sget-object v7, Lcom/vkontakte/android/C2DM;->countOfRegister:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v7}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v7

    if-nez v7, :cond_1

    .line 239
    sget-object v7, Lcom/vkontakte/android/C2DM;->countOfRegister:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v7}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    .line 240
    new-instance v7, Lcom/vkontakte/android/C2DM$RegisterRunnable;

    invoke-direct {v7, v0, v6, v1, v5}, Lcom/vkontakte/android/C2DM$RegisterRunnable;-><init>(Landroid/content/Context;Lcom/vkontakte/android/auth/VKAccount;ILandroid/content/SharedPreferences;)V

    invoke-static {v7}, Lcom/vkontakte/android/C2DM;->post(Lcom/vkontakte/android/C2DM$ThrowableRunnable;)V

    .line 242
    :cond_1
    monitor-exit v8

    .line 247
    .end local v0    # "ctx":Landroid/content/Context;
    .end local v1    # "currentVersion":I
    .end local v3    # "lastUserId":I
    .end local v4    # "lastVersion":I
    .end local v5    # "prefsGcm":Landroid/content/SharedPreferences;
    .end local v6    # "vkAccount":Lcom/vkontakte/android/auth/VKAccount;
    :cond_2
    :goto_0
    return-void

    .line 242
    .restart local v0    # "ctx":Landroid/content/Context;
    .restart local v1    # "currentVersion":I
    .restart local v3    # "lastUserId":I
    .restart local v4    # "lastVersion":I
    .restart local v5    # "prefsGcm":Landroid/content/SharedPreferences;
    .restart local v6    # "vkAccount":Lcom/vkontakte/android/auth/VKAccount;
    :catchall_0
    move-exception v7

    monitor-exit v8
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    throw v7
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 244
    .end local v0    # "ctx":Landroid/content/Context;
    .end local v1    # "currentVersion":I
    .end local v3    # "lastUserId":I
    .end local v4    # "lastVersion":I
    .end local v5    # "prefsGcm":Landroid/content/SharedPreferences;
    .end local v6    # "vkAccount":Lcom/vkontakte/android/auth/VKAccount;
    :catch_0
    move-exception v2

    .line 245
    .local v2, "e":Ljava/lang/Exception;
    new-array v7, v10, [Ljava/lang/Object;

    invoke-static {v2, v7}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public static stop()Z
    .locals 3

    .prologue
    .line 259
    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v1}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    .line 260
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v0

    .line 261
    .local v0, "vkAccount":Lcom/vkontakte/android/auth/VKAccount;
    invoke-virtual {v0}, Lcom/vkontakte/android/auth/VKAccount;->getAccessToken()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0}, Lcom/vkontakte/android/auth/VKAccount;->getSecret()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/vkontakte/android/C2DM;->stop(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    return v1
.end method

.method public static stop(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 6
    .param p0, "accessToken"    # Ljava/lang/String;
    .param p1, "secret"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 266
    const/4 v4, 0x0

    :try_start_0
    new-array v4, v4, [Ljava/lang/Object;

    invoke-static {v4}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    .line 267
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    .line 268
    .local v0, "ctx":Landroid/content/Context;
    const-string/jumbo v4, "gcm"

    const/4 v5, 0x0

    invoke-virtual {v0, v4, v5}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 270
    .local v1, "prefsGcm":Landroid/content/SharedPreferences;
    sget-object v5, Lcom/vkontakte/android/C2DM;->countOfUnregister:Ljava/util/concurrent/atomic/AtomicInteger;

    monitor-enter v5
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 271
    :try_start_1
    sget-object v4, Lcom/vkontakte/android/C2DM;->countOfUnregister:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v4

    if-nez v4, :cond_0

    .line 272
    sget-object v4, Lcom/vkontakte/android/C2DM;->countOfUnregister:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    .line 273
    new-instance v4, Lcom/vkontakte/android/C2DM$UnregisterRunnable;

    invoke-direct {v4, v0, p0, p1, v1}, Lcom/vkontakte/android/C2DM$UnregisterRunnable;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Landroid/content/SharedPreferences;)V

    invoke-static {v4}, Lcom/vkontakte/android/C2DM;->post(Lcom/vkontakte/android/C2DM$ThrowableRunnable;)V

    .line 275
    :cond_0
    monitor-exit v5

    .line 276
    const/4 v3, 0x1

    .line 280
    .end local v0    # "ctx":Landroid/content/Context;
    .end local v1    # "prefsGcm":Landroid/content/SharedPreferences;
    :goto_0
    return v3

    .line 275
    .restart local v0    # "ctx":Landroid/content/Context;
    .restart local v1    # "prefsGcm":Landroid/content/SharedPreferences;
    :catchall_0
    move-exception v4

    monitor-exit v5
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    throw v4
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 277
    .end local v0    # "ctx":Landroid/content/Context;
    .end local v1    # "prefsGcm":Landroid/content/SharedPreferences;
    :catch_0
    move-exception v2

    .line 278
    .local v2, "x":Ljava/lang/Exception;
    new-array v4, v3, [Ljava/lang/Object;

    invoke-static {v2, v4}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public static stopIfNeed(Landroid/content/Context;)V
    .locals 5
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    const/4 v4, 0x0

    .line 250
    const-string/jumbo v2, "gcm"

    invoke-virtual {p0, v2, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 251
    .local v1, "prefsGcm":Landroid/content/SharedPreferences;
    const-string/jumbo v2, "current_user"

    invoke-interface {v1, v2, v4}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    .line 252
    .local v0, "lastUserId":I
    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v4

    invoke-static {v2}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    .line 253
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vkontakte/android/auth/VKAccount;->isReal()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-static {v0}, Lcom/vkontakte/android/auth/VKAccountManager;->isCurrentUser(I)Z

    move-result v2

    if-nez v2, :cond_1

    .line 254
    :cond_0
    invoke-static {}, Lcom/vkontakte/android/C2DM;->stop()Z

    .line 256
    :cond_1
    return-void
.end method
