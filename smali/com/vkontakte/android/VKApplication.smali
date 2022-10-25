.class public Lcom/vkontakte/android/VKApplication;
.super Landroid/app/Application;
.source "VKApplication.java"


# static fields
.field public static context:Landroid/content/Context;

.field public static deviceID:J

.field private static deviceYear:I

.field public static final hasLollipop:Z

.field public static refWatcher:Lcom/squareup/leakcanary/RefWatcher;

.field public static sharedApp:Landroid/app/Application;

.field public static vigo:Lcom/vkontakte/android/media/Vigo;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 57
    const-wide/16 v0, 0x0

    sput-wide v0, Lcom/vkontakte/android/VKApplication;->deviceID:J

    .line 58
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lcom/vkontakte/android/VKApplication;->hasLollipop:Z

    .line 59
    const/16 v0, 0x7e0

    sput v0, Lcom/vkontakte/android/VKApplication;->deviceYear:I

    return-void

    .line 58
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 54
    invoke-direct {p0}, Landroid/app/Application;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/VKApplication;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/VKApplication;

    .prologue
    .line 54
    invoke-direct {p0}, Lcom/vkontakte/android/VKApplication;->isDebugApplication()Z

    move-result v0

    return v0
.end method

.method public static deviceYear()I
    .locals 1

    .prologue
    .line 70
    sget v0, Lcom/vkontakte/android/VKApplication;->deviceYear:I

    return v0
.end method

.method private getPackageSignature()Ljava/lang/String;
    .locals 14

    .prologue
    const/4 v7, 0x0

    .line 234
    :try_start_0
    invoke-virtual {p0}, Lcom/vkontakte/android/VKApplication;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v8

    invoke-virtual {p0}, Lcom/vkontakte/android/VKApplication;->getPackageName()Ljava/lang/String;

    move-result-object v9

    const/16 v10, 0x40

    invoke-virtual {v8, v9, v10}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v1

    .line 235
    .local v1, "info":Landroid/content/pm/PackageInfo;
    iget-object v8, v1, Landroid/content/pm/PackageInfo;->signatures:[Landroid/content/pm/Signature;

    const/4 v9, 0x0

    aget-object v5, v8, v9

    .line 236
    .local v5, "sig":Landroid/content/pm/Signature;
    const-string/jumbo v8, "SHA1"

    invoke-static {v8}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v2

    .line 237
    .local v2, "md":Ljava/security/MessageDigest;
    invoke-virtual {v5}, Landroid/content/pm/Signature;->toByteArray()[B

    move-result-object v8

    invoke-virtual {v2, v8}, Ljava/security/MessageDigest;->update([B)V

    .line 238
    invoke-virtual {v2}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v4

    .line 239
    .local v4, "sha":[B
    const-string/jumbo v0, ""

    .line 240
    .local v0, "certFp":Ljava/lang/String;
    array-length v8, v4

    :goto_0
    if-ge v7, v8, :cond_0

    aget-byte v3, v4, v7

    .line 241
    .local v3, "sb":B
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string/jumbo v10, "%02X"

    const/4 v11, 0x1

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    invoke-static {v3}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v13

    aput-object v13, v11, v12

    invoke-static {v10, v11}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 240
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 244
    .end local v0    # "certFp":Ljava/lang/String;
    .end local v1    # "info":Landroid/content/pm/PackageInfo;
    .end local v2    # "md":Ljava/security/MessageDigest;
    .end local v3    # "sb":B
    .end local v4    # "sha":[B
    .end local v5    # "sig":Landroid/content/pm/Signature;
    :catch_0
    move-exception v6

    .line 245
    .local v6, "x":Ljava/lang/Exception;
    const-string/jumbo v7, "vk"

    invoke-static {v7, v6}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 247
    const-string/jumbo v0, ""

    .end local v6    # "x":Ljava/lang/Exception;
    :cond_0
    return-object v0
.end method

.method public static declared-synchronized getVigo(Landroid/content/Context;)Lcom/vkontakte/android/media/Vigo;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 66
    const-class v0, Lcom/vkontakte/android/VKApplication;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/vkontakte/android/VKApplication;->vigo:Lcom/vkontakte/android/media/Vigo;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method private initDeviceYear(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 201
    invoke-static {p1}, Lcom/facebook/device/yearclass/YearClass;->get(Landroid/content/Context;)I

    move-result v0

    .line 202
    .local v0, "dy":I
    const/16 v1, 0x7d8

    if-lt v0, v1, :cond_0

    const/16 v1, 0x7e4

    if-gt v0, v1, :cond_0

    .line 203
    sput v0, Lcom/vkontakte/android/VKApplication;->deviceYear:I

    .line 205
    :cond_0
    return-void
.end method

.method private initEmoji(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 208
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    .line 209
    .local v0, "executor":Ljava/util/concurrent/ExecutorService;
    new-instance v1, Lcom/vkontakte/android/VKApplication$1;

    invoke-direct {v1, p0, p1}, Lcom/vkontakte/android/VKApplication$1;-><init>(Lcom/vkontakte/android/VKApplication;Landroid/content/Context;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 230
    return-void
.end method

.method private initLog()V
    .locals 2

    .prologue
    .line 278
    invoke-static {}, Lcom/vkontakte/android/utils/L;->getInstance()Lcom/vkontakte/android/utils/L;

    move-result-object v0

    new-instance v1, Lcom/vkontakte/android/VKApplication$2;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/VKApplication$2;-><init>(Lcom/vkontakte/android/VKApplication;)V

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/utils/L;->init(Lcom/vkontakte/android/utils/L$Callback;)V

    .line 292
    return-void
.end method

.method private isDebugApplication()Z
    .locals 1

    .prologue
    .line 274
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v0

    iget-boolean v0, v0, Lcom/vkontakte/android/auth/VKAccount;->debugAvailable:Z

    return v0
.end method

.method public static isDeployApplication()Z
    .locals 1

    .prologue
    .line 74
    const/4 v0, 0x0

    return v0
.end method

.method static synthetic lambda$onCreate$0(Ljava/lang/Thread$UncaughtExceptionHandler;Ljava/lang/Thread;Ljava/lang/Throwable;)V
    .locals 2
    .param p0, "xHandler"    # Ljava/lang/Thread$UncaughtExceptionHandler;
    .param p1, "thread"    # Ljava/lang/Thread;
    .param p2, "throwable"    # Ljava/lang/Throwable;

    .prologue
    .line 102
    invoke-virtual {p2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "during runtime shutdown"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 106
    :goto_0
    return-void

    .line 105
    :cond_0
    invoke-interface {p0, p1, p2}, Ljava/lang/Thread$UncaughtExceptionHandler;->uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method private overrideLangIfNeeded(Landroid/content/res/Configuration;)Z
    .locals 8
    .param p1, "conf"    # Landroid/content/res/Configuration;

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x1

    .line 251
    invoke-virtual {p0}, Lcom/vkontakte/android/VKApplication;->getApplicationContext()Landroid/content/Context;

    move-result-object v6

    invoke-static {v6}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v3

    .line 252
    .local v3, "prefs":Landroid/content/SharedPreferences;
    const-string/jumbo v6, "__dbg_lang_override"

    invoke-interface {v3, v6}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_1

    const-string/jumbo v6, "__dbg_lang_override"

    const-string/jumbo v7, ""

    invoke-interface {v3, v6, v7}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_1

    .line 253
    const-string/jumbo v6, "__dbg_lang_override"

    const-string/jumbo v7, ""

    invoke-interface {v3, v6, v7}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 255
    .local v0, "lang":Ljava/lang/String;
    const-string/jumbo v6, "_"

    invoke-virtual {v0, v6}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 256
    .local v1, "langParts":[Ljava/lang/String;
    array-length v6, v1

    if-ne v6, v4, :cond_0

    .line 257
    new-instance v2, Ljava/util/Locale;

    invoke-direct {v2, v0}, Ljava/util/Locale;-><init>(Ljava/lang/String;)V

    .line 261
    .local v2, "locale":Ljava/util/Locale;
    :goto_0
    invoke-static {v2}, Ljava/util/Locale;->setDefault(Ljava/util/Locale;)V

    .line 262
    iput-object v2, p1, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    .line 263
    invoke-virtual {p0}, Lcom/vkontakte/android/VKApplication;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {p0}, Lcom/vkontakte/android/VKApplication;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    invoke-virtual {v6}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v6

    invoke-virtual {v5, p1, v6}, Landroid/content/res/Resources;->updateConfiguration(Landroid/content/res/Configuration;Landroid/util/DisplayMetrics;)V

    .line 266
    .end local v0    # "lang":Ljava/lang/String;
    .end local v1    # "langParts":[Ljava/lang/String;
    .end local v2    # "locale":Ljava/util/Locale;
    :goto_1
    return v4

    .line 259
    .restart local v0    # "lang":Ljava/lang/String;
    .restart local v1    # "langParts":[Ljava/lang/String;
    :cond_0
    new-instance v2, Ljava/util/Locale;

    aget-object v5, v1, v5

    aget-object v6, v1, v4

    invoke-direct {v2, v5, v6}, Ljava/util/Locale;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .restart local v2    # "locale":Ljava/util/Locale;
    goto :goto_0

    .end local v0    # "lang":Ljava/lang/String;
    .end local v1    # "langParts":[Ljava/lang/String;
    .end local v2    # "locale":Ljava/util/Locale;
    :cond_1
    move v4, v5

    .line 266
    goto :goto_1
.end method

.method public static setMyTrackLocationEnable(Z)V
    .locals 1
    .param p0, "enable"    # Z

    .prologue
    .line 78
    invoke-static {}, Lcom/my/tracker/MyTracker;->getTrackerParams()Lcom/my/tracker/MyTrackerParams;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/my/tracker/MyTrackerParams;->setTrackingLocationEnabled(Z)V

    .line 79
    invoke-static {}, Lcom/my/tracker/MyTracker;->getTrackerParams()Lcom/my/tracker/MyTrackerParams;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/my/tracker/MyTrackerParams;->setTrackingEnvironmentEnabled(Z)V

    .line 80
    return-void
.end method


# virtual methods
.method protected attachBaseContext(Landroid/content/Context;)V
    .locals 0
    .param p1, "base"    # Landroid/content/Context;

    .prologue
    .line 196
    invoke-super {p0, p1}, Landroid/app/Application;->attachBaseContext(Landroid/content/Context;)V

    .line 197
    invoke-static {p0}, Landroid/support/multidex/MultiDex;->install(Landroid/content/Context;)V

    .line 198
    return-void
.end method

.method public onCreate()V
    .locals 14

    .prologue
    .line 84
    sput-object p0, Lcom/vkontakte/android/VKApplication;->sharedApp:Landroid/app/Application;

    .line 85
    invoke-static {p0}, Lcom/vkontakte/android/auth/VKAccountManager;->init(Landroid/content/Context;)V

    .line 86
    invoke-static {}, Lcom/vk/analytics/Analytics;->getInstance()Lcom/vk/analytics/Analytics;

    move-result-object v11

    new-instance v12, Lcom/vkontakte/android/NetworkProxyPreferences;

    invoke-direct {v12}, Lcom/vkontakte/android/NetworkProxyPreferences;-><init>()V

    invoke-virtual {v11, p0, v12}, Lcom/vk/analytics/Analytics;->init(Landroid/content/Context;Ljava/lang/Runnable;)Lcom/vk/analytics/Analytics;

    .line 87
    invoke-static {}, Lcom/vk/core/network/Network;->getInstance()Lcom/vk/core/network/Network;

    move-result-object v11

    invoke-static {}, Lcom/vkontakte/android/VKApplication;->isDeployApplication()Z

    move-result v12

    invoke-virtual {v11, p0, v12}, Lcom/vk/core/network/Network;->init(Landroid/content/Context;Z)V

    .line 89
    invoke-static {p0}, Lcom/vk/imageloader/VKImageLoader;->init(Landroid/content/Context;)V

    .line 90
    invoke-static {p0}, Lcom/vk/attachpicker/Picker;->init(Landroid/content/Context;)V

    .line 91
    invoke-direct {p0, p0}, Lcom/vkontakte/android/VKApplication;->initDeviceYear(Landroid/content/Context;)V

    .line 92
    invoke-direct {p0, p0}, Lcom/vkontakte/android/VKApplication;->initEmoji(Landroid/content/Context;)V

    .line 94
    new-instance v11, Lcom/vkontakte/android/utils/VersionCodeCrushHandler;

    invoke-direct {v11, p0}, Lcom/vkontakte/android/utils/VersionCodeCrushHandler;-><init>(Landroid/content/Context;)V

    invoke-static {v11}, Ljava/lang/Thread;->setDefaultUncaughtExceptionHandler(Ljava/lang/Thread$UncaughtExceptionHandler;)V

    .line 96
    invoke-virtual {p0}, Lcom/vkontakte/android/VKApplication;->getApplicationContext()Landroid/content/Context;

    move-result-object v11

    invoke-static {v11}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v6

    .line 97
    .local v6, "prefs":Landroid/content/SharedPreferences;
    invoke-virtual {p0}, Lcom/vkontakte/android/VKApplication;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    invoke-virtual {v11}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v11

    invoke-direct {p0, v11}, Lcom/vkontakte/android/VKApplication;->overrideLangIfNeeded(Landroid/content/res/Configuration;)Z

    .line 99
    invoke-virtual {p0}, Lcom/vkontakte/android/VKApplication;->getApplicationContext()Landroid/content/Context;

    move-result-object v11

    invoke-static {v11}, Lme/grishka/appkit/utils/V;->setApplicationContext(Landroid/content/Context;)V

    .line 100
    invoke-static {}, Ljava/lang/Thread;->getDefaultUncaughtExceptionHandler()Ljava/lang/Thread$UncaughtExceptionHandler;

    move-result-object v10

    .line 101
    .local v10, "xHandler":Ljava/lang/Thread$UncaughtExceptionHandler;
    invoke-static {v10}, Lcom/vkontakte/android/VKApplication$$Lambda$1;->lambdaFactory$(Ljava/lang/Thread$UncaughtExceptionHandler;)Ljava/lang/Thread$UncaughtExceptionHandler;

    move-result-object v11

    invoke-static {v11}, Ljava/lang/Thread;->setDefaultUncaughtExceptionHandler(Ljava/lang/Thread$UncaughtExceptionHandler;)V

    .line 108
    const-string/jumbo v11, "39905392329609327611"

    invoke-static {v11, p0}, Lcom/my/tracker/MyTracker;->createTracker(Ljava/lang/String;Landroid/content/Context;)V

    .line 109
    const-string/jumbo v11, "mytrackerLocationCrapEnabled"

    const/4 v12, 0x1

    invoke-interface {v6, v11, v12}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v11

    invoke-static {v11}, Lcom/vkontakte/android/VKApplication;->setMyTrackLocationEnable(Z)V

    .line 110
    invoke-static {}, Lcom/my/tracker/MyTracker;->getTrackerParams()Lcom/my/tracker/MyTrackerParams;

    move-result-object v11

    const/4 v12, 0x0

    invoke-virtual {v11, v12}, Lcom/my/tracker/MyTrackerParams;->setTrackingAppsEnabled(Z)V

    .line 111
    invoke-static {}, Lcom/my/tracker/MyTracker;->getTrackerParams()Lcom/my/tracker/MyTrackerParams;

    move-result-object v11

    invoke-virtual {v11}, Lcom/my/tracker/MyTrackerParams;->setDefaultVendorAppPackage()V

    .line 112
    invoke-static {}, Lcom/my/tracker/MyTracker;->initTracker()V

    .line 115
    :try_start_0
    invoke-static {p0}, Lru/mail/libverify/api/VerificationFactory;->onAppCreated(Landroid/content/Context;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 120
    :goto_0
    const/4 v11, 0x0

    const/4 v12, 0x0

    invoke-virtual {p0, v11, v12}, Lcom/vkontakte/android/VKApplication;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v11

    const-string/jumbo v12, "ncode"

    invoke-interface {v11, v12}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v11

    if-nez v11, :cond_0

    .line 121
    const/4 v11, 0x0

    const/4 v12, 0x0

    invoke-virtual {p0, v11, v12}, Lcom/vkontakte/android/VKApplication;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v11

    invoke-interface {v11}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v11

    const-string/jumbo v12, "ncode"

    new-instance v13, Ljava/util/Random;

    invoke-direct {v13}, Ljava/util/Random;-><init>()V

    invoke-virtual {v13}, Ljava/util/Random;->nextInt()I

    move-result v13

    invoke-interface {v11, v12, v13}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v11

    invoke-interface {v11}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 124
    :cond_0
    const-string/jumbo v11, "notifyTypes"

    invoke-interface {v6, v11}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_1

    .line 125
    const-string/jumbo v11, "notifyTypes"

    const-string/jumbo v12, ""

    invoke-interface {v6, v11, v12}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    const-string/jumbo v12, ";"

    invoke-virtual {v11, v12}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v5

    .line 126
    .local v5, "ntypes":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v6}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v11

    const-string/jumbo v12, "notificationsPrivateMessages"

    const-string/jumbo v13, "messages"

    .line 127
    invoke-interface {v5, v13}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v13

    invoke-interface {v11, v12, v13}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v11

    const-string/jumbo v12, "notificationsChatMessages"

    const-string/jumbo v13, "messages"

    .line 128
    invoke-interface {v5, v13}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v13

    invoke-interface {v11, v12, v13}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v11

    const-string/jumbo v12, "notificationsFriendRequests"

    const-string/jumbo v13, "friends"

    .line 129
    invoke-interface {v5, v13}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v13

    invoke-interface {v11, v12, v13}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v11

    const-string/jumbo v12, "notificationsReplies"

    const-string/jumbo v13, "replies"

    .line 130
    invoke-interface {v5, v13}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v13

    invoke-interface {v11, v12, v13}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v11

    const-string/jumbo v12, "notificationsMentions"

    const-string/jumbo v13, "mentions"

    .line 131
    invoke-interface {v5, v13}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v13

    invoke-interface {v11, v12, v13}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v11

    const-string/jumbo v12, "notificationsGames"

    const-string/jumbo v13, "games"

    .line 132
    invoke-interface {v5, v13}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v13

    invoke-interface {v11, v12, v13}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v11

    const-string/jumbo v12, "notifyTypes"

    .line 133
    invoke-interface {v11, v12}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v11

    .line 134
    invoke-interface {v11}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 138
    .end local v5    # "ntypes":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_1
    :try_start_1
    invoke-virtual {p0}, Lcom/vkontakte/android/VKApplication;->getApplicationContext()Landroid/content/Context;

    move-result-object v11

    invoke-virtual {v11}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v11

    const-string/jumbo v12, "android_id"

    invoke-static {v11, v12}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 139
    .local v0, "aid":Ljava/lang/String;
    const/16 v11, 0x10

    invoke-static {v0, v11}, Ljava/lang/Long;->parseLong(Ljava/lang/String;I)J

    move-result-wide v12

    sput-wide v12, Lcom/vkontakte/android/VKApplication;->deviceID:J
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_3

    .line 143
    .end local v0    # "aid":Ljava/lang/String;
    :goto_1
    sget v11, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v12, 0x13

    if-lt v11, v12, :cond_2

    .line 145
    :try_start_2
    invoke-virtual {p0}, Lcom/vkontakte/android/VKApplication;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v11

    iget v12, v11, Landroid/content/pm/ApplicationInfo;->flags:I

    and-int/lit8 v12, v12, 0x2

    iput v12, v11, Landroid/content/pm/ApplicationInfo;->flags:I

    if-eqz v12, :cond_2

    .line 146
    const/4 v11, 0x1

    invoke-static {v11}, Landroid/webkit/WebView;->setWebContentsDebuggingEnabled(Z)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 152
    :cond_2
    :goto_2
    new-instance v8, Ljava/io/File;

    invoke-virtual {p0}, Lcom/vkontakte/android/VKApplication;->getApplicationContext()Landroid/content/Context;

    move-result-object v11

    invoke-virtual {v11}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v11

    const-string/jumbo v12, "thumbs"

    invoke-direct {v8, v11, v12}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 153
    .local v8, "thumbsDir":Ljava/io/File;
    invoke-virtual {v8}, Ljava/io/File;->exists()Z

    move-result v11

    if-nez v11, :cond_3

    .line 154
    invoke-virtual {v8}, Ljava/io/File;->mkdirs()Z

    .line 156
    :cond_3
    invoke-virtual {v8}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v7

    .line 157
    .local v7, "thumbs":[Ljava/io/File;
    array-length v12, v7

    const/4 v11, 0x0

    :goto_3
    if-ge v11, v12, :cond_4

    aget-object v3, v7, v11

    .line 158
    .local v3, "file":Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    .line 157
    add-int/lit8 v11, v11, 0x1

    goto :goto_3

    .line 116
    .end local v3    # "file":Ljava/io/File;
    .end local v7    # "thumbs":[Ljava/io/File;
    .end local v8    # "thumbsDir":Ljava/io/File;
    :catch_0
    move-exception v1

    .line 117
    .local v1, "e":Ljava/lang/Exception;
    const/4 v11, 0x0

    new-array v11, v11, [Ljava/lang/Object;

    invoke-static {v1, v11}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto/16 :goto_0

    .line 161
    .end local v1    # "e":Ljava/lang/Exception;
    .restart local v7    # "thumbs":[Ljava/io/File;
    .restart local v8    # "thumbsDir":Ljava/io/File;
    :cond_4
    sget-object v11, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    if-nez v11, :cond_5

    .line 162
    invoke-virtual {p0}, Lcom/vkontakte/android/VKApplication;->getApplicationContext()Landroid/content/Context;

    move-result-object v11

    sput-object v11, Lcom/vk/core/util/AppContextHolder;->context:Landroid/content/Context;

    .line 163
    invoke-virtual {p0}, Lcom/vkontakte/android/VKApplication;->getApplicationContext()Landroid/content/Context;

    move-result-object v11

    sput-object v11, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    .line 164
    sget-object v11, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-static {v11}, Lcom/vkontakte/android/Global;->init(Landroid/content/Context;)V

    .line 165
    invoke-virtual {p0}, Lcom/vkontakte/android/VKApplication;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    invoke-virtual {v11}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v11

    iget v11, v11, Landroid/util/DisplayMetrics;->density:F

    sput v11, Lcom/vkontakte/android/Global;->displayDensity:F

    .line 168
    :cond_5
    invoke-direct {p0}, Lcom/vkontakte/android/VKApplication;->initLog()V

    .line 171
    :try_start_3
    new-instance v9, Ljava/io/File;

    invoke-virtual {p0}, Lcom/vkontakte/android/VKApplication;->getExternalCacheDir()Ljava/io/File;

    move-result-object v11

    const-string/jumbo v12, "upload"

    invoke-direct {v9, v11, v12}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 172
    .local v9, "tmpUploadDir":Ljava/io/File;
    invoke-virtual {v9}, Ljava/io/File;->exists()Z

    move-result v11

    if-eqz v11, :cond_6

    .line 173
    invoke-virtual {v9}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v4

    .line 174
    .local v4, "files":[Ljava/io/File;
    array-length v12, v4

    const/4 v11, 0x0

    :goto_4
    if-ge v11, v12, :cond_6

    aget-object v2, v4, v11

    .line 175
    .local v2, "f":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->delete()Z
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    .line 174
    add-int/lit8 v11, v11, 0x1

    goto :goto_4

    .line 178
    .end local v2    # "f":Ljava/io/File;
    .end local v4    # "files":[Ljava/io/File;
    .end local v9    # "tmpUploadDir":Ljava/io/File;
    :catch_1
    move-exception v11

    .line 182
    :cond_6
    invoke-static {p0}, Lcom/vkontakte/android/data/PurchasesManager;->init(Landroid/content/Context;)V

    .line 183
    invoke-super {p0}, Landroid/app/Application;->onCreate()V

    .line 184
    sget-object v11, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-static {v11}, Lcom/vk/medianative/MediaNative;->init(Landroid/content/Context;)V

    .line 185
    invoke-static {}, Lcom/vk/analytics/Analytics;->getInstance()Lcom/vk/analytics/Analytics;

    move-result-object v11

    invoke-virtual {v11}, Lcom/vk/analytics/Analytics;->initCrashHandler()V

    .line 187
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v11

    invoke-static {v11}, Lcom/vkontakte/android/auth/VKAccountManager;->fillAccountDataForAnalytics(Lcom/vkontakte/android/auth/VKAccount;)V

    .line 189
    invoke-static {p0}, Lcom/squareup/leakcanary/LeakCanary;->install(Landroid/app/Application;)Lcom/squareup/leakcanary/RefWatcher;

    move-result-object v11

    sput-object v11, Lcom/vkontakte/android/VKApplication;->refWatcher:Lcom/squareup/leakcanary/RefWatcher;

    .line 190
    new-instance v11, Lcom/vkontakte/android/media/Vigo;

    invoke-direct {v11, p0}, Lcom/vkontakte/android/media/Vigo;-><init>(Landroid/content/Context;)V

    sput-object v11, Lcom/vkontakte/android/VKApplication;->vigo:Lcom/vkontakte/android/media/Vigo;

    .line 191
    invoke-static {p0}, Lcom/vkontakte/android/C2DM;->stopIfNeed(Landroid/content/Context;)V

    .line 192
    return-void

    .line 148
    .end local v7    # "thumbs":[Ljava/io/File;
    .end local v8    # "thumbsDir":Ljava/io/File;
    :catch_2
    move-exception v11

    goto/16 :goto_2

    .line 140
    :catch_3
    move-exception v11

    goto/16 :goto_1
.end method

.method public onEmojiLoaded(Ljava/lang/Integer;)V
    .locals 1
    .param p1, "emojiLoadFlag"    # Ljava/lang/Integer;

    .prologue
    .line 270
    invoke-static {}, Lcom/vkontakte/android/AppStateTracker;->getCurrentActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Lcom/vk/emoji/Emoji;->invalidateAll(Landroid/app/Activity;)V

    .line 271
    return-void
.end method
