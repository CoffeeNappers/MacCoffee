.class public Lcom/vkontakte/android/NetworkStateReceiver;
.super Landroid/content/BroadcastReceiver;
.source "NetworkStateReceiver.java"


# static fields
.field public static final ACTION_GROUPS_UPDATED:Ljava/lang/String; = "com.vkontakte.android.GROUPS_UPDATED"

.field private static final FORCED_SYSTEM_APPS:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final LAST_GET_NOTIFY:Ljava/lang/String; = "last_get_notify"

.field private static final LAST_GET_NOTIFY_APP:Ljava/lang/String; = "last_get_notify_app"

.field public static final TIME_DELAY:I = 0x1c20

.field private static final cm:Landroid/net/ConnectivityManager;

.field private static currentNetworkType:Ljava/lang/String;

.field private static final highSpeedTypes:[Ljava/lang/String;

.field public static isConnected:Z

.field private static final sl:[I

.field private static tries:I

.field public static userInfoUpdated:Z


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .prologue
    const/4 v6, 0x4

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 51
    sput-boolean v2, Lcom/vkontakte/android/NetworkStateReceiver;->isConnected:Z

    .line 52
    sput-boolean v2, Lcom/vkontakte/android/NetworkStateReceiver;->userInfoUpdated:Z

    .line 53
    const/4 v0, 0x5

    sput v0, Lcom/vkontakte/android/NetworkStateReceiver;->tries:I

    .line 54
    const/4 v0, 0x5

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/vkontakte/android/NetworkStateReceiver;->sl:[I

    .line 58
    const/4 v0, 0x0

    sput-object v0, Lcom/vkontakte/android/NetworkStateReceiver;->currentNetworkType:Ljava/lang/String;

    .line 59
    new-array v0, v6, [Ljava/lang/String;

    const-string/jumbo v1, "3g"

    aput-object v1, v0, v2

    const-string/jumbo v1, "lte"

    aput-object v1, v0, v3

    const-string/jumbo v1, "wifi"

    aput-object v1, v0, v4

    const-string/jumbo v1, "ethernet"

    aput-object v1, v0, v5

    sput-object v0, Lcom/vkontakte/android/NetworkStateReceiver;->highSpeedTypes:[Ljava/lang/String;

    .line 60
    new-array v0, v6, [Ljava/lang/String;

    const-string/jumbo v1, "com.vkontakte.android"

    aput-object v1, v0, v2

    const-string/jumbo v1, "com.instagram.android"

    aput-object v1, v0, v3

    const-string/jumbo v1, "com.facebook.katana"

    aput-object v1, v0, v4

    const-string/jumbo v1, "com.facebook.orca"

    aput-object v1, v0, v5

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lcom/vkontakte/android/NetworkStateReceiver;->FORCED_SYSTEM_APPS:Ljava/util/List;

    .line 61
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const-string/jumbo v1, "connectivity"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    sput-object v0, Lcom/vkontakte/android/NetworkStateReceiver;->cm:Landroid/net/ConnectivityManager;

    return-void

    .line 54
    nop

    :array_0
    .array-data 4
        0x5dc
        0xbb8
        0x1770
        0x2ee0
        0x5dc0
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 44
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method static synthetic access$000(Landroid/content/Context;)V
    .locals 0
    .param p0, "x0"    # Landroid/content/Context;

    .prologue
    .line 44
    invoke-static {p0}, Lcom/vkontakte/android/NetworkStateReceiver;->updateFriendlist(Landroid/content/Context;)V

    return-void
.end method

.method static synthetic access$100()[I
    .locals 1

    .prologue
    .line 44
    sget-object v0, Lcom/vkontakte/android/NetworkStateReceiver;->sl:[I

    return-object v0
.end method

.method static synthetic access$200()I
    .locals 1

    .prologue
    .line 44
    sget v0, Lcom/vkontakte/android/NetworkStateReceiver;->tries:I

    return v0
.end method

.method static synthetic access$202(I)I
    .locals 0
    .param p0, "x0"    # I

    .prologue
    .line 44
    sput p0, Lcom/vkontakte/android/NetworkStateReceiver;->tries:I

    return p0
.end method

.method static synthetic access$210()I
    .locals 2

    .prologue
    .line 44
    sget v0, Lcom/vkontakte/android/NetworkStateReceiver;->tries:I

    add-int/lit8 v1, v0, -0x1

    sput v1, Lcom/vkontakte/android/NetworkStateReceiver;->tries:I

    return v0
.end method

.method static synthetic access$300(Landroid/content/Context;)V
    .locals 0
    .param p0, "x0"    # Landroid/content/Context;

    .prologue
    .line 44
    invoke-static {p0}, Lcom/vkontakte/android/NetworkStateReceiver;->updateUserInfo(Landroid/content/Context;)V

    return-void
.end method

.method public static getAppNotifications(Landroid/content/Context;)V
    .locals 10
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    const/4 v0, 0x1

    const/4 v4, 0x0

    .line 294
    const/4 v3, 0x0

    invoke-virtual {p0, v3, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v3

    const-string/jumbo v5, "last_get_notify_app"

    invoke-interface {v3, v5, v4}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v1

    .line 295
    .local v1, "last":I
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    const-wide/16 v8, 0x3e8

    div-long/2addr v6, v8

    int-to-long v8, v1

    sub-long/2addr v6, v8

    const-wide/16 v8, 0x1c20

    cmp-long v3, v6, v8

    if-gez v3, :cond_1

    .line 352
    :cond_0
    :goto_0
    return-void

    .line 298
    :cond_1
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v3

    invoke-virtual {v3}, Lcom/vkontakte/android/auth/VKAccount;->isReal()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 302
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v3

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    invoke-virtual {v3, v5, v6}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v3

    iget-object v3, v3, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget v3, v3, Landroid/content/pm/ApplicationInfo;->flags:I

    and-int/lit8 v3, v3, 0x1

    if-ne v3, v0, :cond_2

    .line 303
    .local v0, "isSystemApp":Z
    :goto_1
    new-instance v3, Lcom/vkontakte/android/api/VKAPIRequest;

    const-string/jumbo v5, "internal.getUserNotifications"

    invoke-direct {v3, v5}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    const-string/jumbo v5, "device"

    sget-object v6, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 304
    invoke-virtual {v3, v5, v6}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v3

    const-string/jumbo v5, "vendor"

    sget-object v6, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    .line 305
    invoke-virtual {v3, v5, v6}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v5

    const-string/jumbo v6, "system"

    if-eqz v0, :cond_3

    const-string/jumbo v3, "1"

    .line 306
    :goto_2
    invoke-virtual {v5, v6, v3}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v3

    const-string/jumbo v5, "os"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    sget v7, Landroid/os/Build$VERSION;->SDK_INT:I

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, ","

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    sget-object v7, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 307
    invoke-virtual {v3, v5, v6}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v3

    const-string/jumbo v5, "app_version"

    .line 308
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v6

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v7

    const/4 v8, 0x0

    invoke-virtual {v6, v7, v8}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v6

    iget v6, v6, Landroid/content/pm/PackageInfo;->versionCode:I

    invoke-virtual {v3, v5, v6}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v3

    const-string/jumbo v5, "locale"

    const-string/jumbo v6, "user.language"

    .line 309
    invoke-static {v6}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v5, v6}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v3

    const-string/jumbo v5, "ads_device_id"

    .line 310
    invoke-static {}, Lcom/vkontakte/android/data/Analytics;->getDeviceID()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v5, v6}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v3

    const-string/jumbo v5, "fields"

    const-string/jumbo v6, "photo_100,photo_50"

    .line 311
    invoke-virtual {v3, v5, v6}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v3

    const-string/jumbo v5, "extended"

    const/4 v6, 0x1

    .line 312
    invoke-virtual {v3, v5, v6}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v3

    const-string/jumbo v5, "photo_sizes"

    const/4 v6, 0x1

    .line 313
    invoke-virtual {v3, v5, v6}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v3

    const-string/jumbo v5, "connection_type"

    .line 314
    invoke-static {}, Lcom/vkontakte/android/utils/Utils;->getConnectionType()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v5, v6}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v3

    const-string/jumbo v5, "connection_subtype"

    .line 315
    invoke-static {}, Lcom/vkontakte/android/utils/Utils;->getConnectionSubtype()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v5, v6}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v3

    const-string/jumbo v5, "user_options"

    .line 316
    invoke-static {}, Lcom/vkontakte/android/utils/Utils;->getUserOptions()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v5, v6}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v3

    new-instance v5, Lcom/vkontakte/android/NetworkStateReceiver$4;

    invoke-direct {v5, p0}, Lcom/vkontakte/android/NetworkStateReceiver$4;-><init>(Landroid/content/Context;)V

    .line 317
    invoke-virtual {v3, v5}, Lcom/vkontakte/android/api/VKAPIRequest;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v3

    .line 348
    invoke-virtual {v3}, Lcom/vkontakte/android/api/VKAPIRequest;->exec()Lcom/vkontakte/android/api/VKAPIRequest;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    .line 349
    .end local v0    # "isSystemApp":Z
    :catch_0
    move-exception v2

    .line 350
    .local v2, "x":Ljava/lang/Exception;
    new-array v3, v4, [Ljava/lang/Object;

    invoke-static {v2, v3}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto/16 :goto_0

    .end local v2    # "x":Ljava/lang/Exception;
    :cond_2
    move v0, v4

    .line 302
    goto/16 :goto_1

    .line 305
    .restart local v0    # "isSystemApp":Z
    :cond_3
    :try_start_1
    const-string/jumbo v3, "0"
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_2
.end method

.method public static getNotifications(Landroid/content/Context;)V
    .locals 10
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    const/4 v0, 0x1

    const/4 v4, 0x0

    .line 244
    const/4 v3, 0x0

    invoke-virtual {p0, v3, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v3

    const-string/jumbo v5, "last_get_notify"

    invoke-interface {v3, v5, v4}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v1

    .line 245
    .local v1, "last":I
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    const-wide/16 v8, 0x3e8

    div-long/2addr v6, v8

    int-to-long v8, v1

    sub-long/2addr v6, v8

    const-wide/16 v8, 0xe10

    cmp-long v3, v6, v8

    if-gez v3, :cond_1

    .line 291
    :cond_0
    :goto_0
    return-void

    .line 248
    :cond_1
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v3

    invoke-virtual {v3}, Lcom/vkontakte/android/auth/VKAccount;->isReal()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 252
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v3

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    invoke-virtual {v3, v5, v6}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v3

    iget-object v3, v3, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget v3, v3, Landroid/content/pm/ApplicationInfo;->flags:I

    and-int/lit8 v3, v3, 0x1

    if-ne v3, v0, :cond_2

    .line 253
    .local v0, "isSystemApp":Z
    :goto_1
    new-instance v3, Lcom/vkontakte/android/api/VKAPIRequest;

    const-string/jumbo v5, "internal.getNotifications"

    invoke-direct {v3, v5}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    const-string/jumbo v5, "device"

    sget-object v6, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 254
    invoke-virtual {v3, v5, v6}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v3

    const-string/jumbo v5, "vendor"

    sget-object v6, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    .line 255
    invoke-virtual {v3, v5, v6}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v5

    const-string/jumbo v6, "system"

    if-eqz v0, :cond_3

    const-string/jumbo v3, "1"

    .line 256
    :goto_2
    invoke-virtual {v5, v6, v3}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v3

    const-string/jumbo v5, "os"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    sget v7, Landroid/os/Build$VERSION;->SDK_INT:I

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, ","

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    sget-object v7, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 257
    invoke-virtual {v3, v5, v6}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v3

    const-string/jumbo v5, "app_version"

    .line 258
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v6

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v7

    const/4 v8, 0x0

    invoke-virtual {v6, v7, v8}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v6

    iget v6, v6, Landroid/content/pm/PackageInfo;->versionCode:I

    invoke-virtual {v3, v5, v6}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v3

    const-string/jumbo v5, "locale"

    const-string/jumbo v6, "user.language"

    .line 259
    invoke-static {v6}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v5, v6}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v3

    const-string/jumbo v5, "ads_device_id"

    .line 260
    invoke-static {}, Lcom/vkontakte/android/data/Analytics;->getDeviceID()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v5, v6}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v3

    new-instance v5, Lcom/vkontakte/android/NetworkStateReceiver$3;

    invoke-direct {v5, p0}, Lcom/vkontakte/android/NetworkStateReceiver$3;-><init>(Landroid/content/Context;)V

    .line 261
    invoke-virtual {v3, v5}, Lcom/vkontakte/android/api/VKAPIRequest;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v3

    .line 287
    invoke-virtual {v3}, Lcom/vkontakte/android/api/VKAPIRequest;->exec()Lcom/vkontakte/android/api/VKAPIRequest;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    .line 288
    .end local v0    # "isSystemApp":Z
    :catch_0
    move-exception v2

    .line 289
    .local v2, "x":Ljava/lang/Exception;
    new-array v3, v4, [Ljava/lang/Object;

    invoke-static {v2, v3}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto/16 :goto_0

    .end local v2    # "x":Ljava/lang/Exception;
    :cond_2
    move v0, v4

    .line 252
    goto/16 :goto_1

    .line 255
    .restart local v0    # "isSystemApp":Z
    :cond_3
    :try_start_1
    const-string/jumbo v3, "0"
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_2
.end method

.method public static isConnected()Z
    .locals 2

    .prologue
    .line 362
    sget-object v1, Lcom/vkontakte/android/NetworkStateReceiver;->cm:Landroid/net/ConnectivityManager;

    invoke-virtual {v1}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v0

    .line 363
    .local v0, "info":Landroid/net/NetworkInfo;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static isHighSpeed()Z
    .locals 6

    .prologue
    const/4 v1, 0x0

    .line 370
    sget-object v2, Lcom/vkontakte/android/NetworkStateReceiver;->currentNetworkType:Ljava/lang/String;

    if-nez v2, :cond_0

    .line 371
    invoke-static {}, Lcom/vkontakte/android/utils/Utils;->getNetworkType()Ljava/lang/String;

    move-result-object v2

    sput-object v2, Lcom/vkontakte/android/NetworkStateReceiver;->currentNetworkType:Ljava/lang/String;

    .line 373
    :cond_0
    sget-object v3, Lcom/vkontakte/android/NetworkStateReceiver;->highSpeedTypes:[Ljava/lang/String;

    array-length v4, v3

    move v2, v1

    .local v0, "s":Ljava/lang/String;
    :goto_0
    if-ge v2, v4, :cond_1

    aget-object v0, v3, v2

    .line 374
    sget-object v5, Lcom/vkontakte/android/NetworkStateReceiver;->currentNetworkType:Ljava/lang/String;

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 375
    const/4 v1, 0x1

    .line 378
    :cond_1
    return v1

    .line 373
    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method private static updateFriendlist(Landroid/content/Context;)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    const/4 v1, 0x1

    .line 355
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/auth/VKAccount;->isReal()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 356
    invoke-static {v1}, Lcom/vkontakte/android/data/Friends;->reload(Z)V

    .line 357
    invoke-static {v1}, Lcom/vkontakte/android/data/Groups;->reload(Z)V

    .line 359
    :cond_0
    return-void
.end method

.method public static updateInfo(Landroid/content/Context;)V
    .locals 3
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 175
    sget-boolean v1, Lcom/vkontakte/android/NetworkStateReceiver;->userInfoUpdated:Z

    if-nez v1, :cond_0

    .line 176
    const-string/jumbo v1, "vk"

    const-string/jumbo v2, "about to update user info..."

    invoke-static {v1, v2}, Lcom/vkontakte/android/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 177
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vkontakte/android/auth/VKAccount;->isReal()Z

    move-result v1

    if-nez v1, :cond_1

    .line 178
    const-string/jumbo v1, "vk"

    const-string/jumbo v2, "not logged in."

    invoke-static {v1, v2}, Lcom/vkontakte/android/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 190
    :cond_0
    :goto_0
    return-void

    .line 181
    :cond_1
    sget-boolean v1, Lcom/vkontakte/android/Global;->inited:Z

    if-nez v1, :cond_2

    .line 182
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    .line 183
    .local v0, "metrics":Landroid/util/DisplayMetrics;
    iget v1, v0, Landroid/util/DisplayMetrics;->density:F

    sput v1, Lcom/vkontakte/android/Global;->displayDensity:F

    .line 184
    const/4 v1, 0x1

    sput-boolean v1, Lcom/vkontakte/android/Global;->inited:Z

    .line 186
    .end local v0    # "metrics":Landroid/util/DisplayMetrics;
    :cond_2
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vkontakte/android/auth/VKAccount;->isReal()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 187
    invoke-static {p0}, Lcom/vkontakte/android/NetworkStateReceiver;->updateUserInfo(Landroid/content/Context;)V

    goto :goto_0
.end method

.method private static updateUserInfo(Landroid/content/Context;)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 193
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/auth/VKAccount;->isReal()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 194
    new-instance v0, Lcom/vkontakte/android/api/execute/GetWallInfo;

    invoke-direct {v0}, Lcom/vkontakte/android/api/execute/GetWallInfo;-><init>()V

    new-instance v1, Lcom/vkontakte/android/NetworkStateReceiver$2;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/NetworkStateReceiver$2;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/execute/GetWallInfo;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 239
    invoke-virtual {v0}, Lcom/vkontakte/android/api/VKAPIRequest;->exec()Lcom/vkontakte/android/api/VKAPIRequest;

    .line 241
    :cond_0
    return-void
.end method


# virtual methods
.method synthetic lambda$onReceive$0()V
    .locals 8

    .prologue
    .line 117
    :goto_0
    :try_start_0
    invoke-static {}, Lcom/vkontakte/android/cache/Cache;->getApiRequest()Lcom/vkontakte/android/data/PersistentAPIRequest;

    move-result-object v2

    .line 118
    .local v2, "preq":Lcom/vkontakte/android/data/PersistentAPIRequest;
    const-string/jumbo v5, "vk"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "Got api req: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/vkontakte/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 119
    if-nez v2, :cond_0

    .line 166
    .end local v2    # "preq":Lcom/vkontakte/android/data/PersistentAPIRequest;
    :goto_1
    return-void

    .line 122
    .restart local v2    # "preq":Lcom/vkontakte/android/data/PersistentAPIRequest;
    :cond_0
    new-instance v3, Lcom/vkontakte/android/api/VKAPIRequest;

    iget-object v5, v2, Lcom/vkontakte/android/data/PersistentAPIRequest;->method:Ljava/lang/String;

    invoke-direct {v3, v5}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    .line 123
    .local v3, "req":Lcom/vkontakte/android/api/VKAPIRequest;, "Lcom/vkontakte/android/api/VKAPIRequest<Lorg/json/JSONObject;>;"
    iget-object v5, v2, Lcom/vkontakte/android/data/PersistentAPIRequest;->args:Lorg/json/JSONObject;

    if-eqz v5, :cond_1

    .line 124
    iget-object v5, v2, Lcom/vkontakte/android/data/PersistentAPIRequest;->args:Lorg/json/JSONObject;

    invoke-virtual {v5}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v1

    .line 125
    .local v1, "ks":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 126
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 127
    .local v0, "k":Ljava/lang/String;
    iget-object v5, v3, Lcom/vkontakte/android/api/VKAPIRequest;->params:Ljava/util/LinkedHashMap;

    iget-object v6, v2, Lcom/vkontakte/android/data/PersistentAPIRequest;->args:Lorg/json/JSONObject;

    invoke-virtual {v6, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v0, v6}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    .line 163
    .end local v0    # "k":Ljava/lang/String;
    .end local v1    # "ks":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    .end local v2    # "preq":Lcom/vkontakte/android/data/PersistentAPIRequest;
    .end local v3    # "req":Lcom/vkontakte/android/api/VKAPIRequest;, "Lcom/vkontakte/android/api/VKAPIRequest<Lorg/json/JSONObject;>;"
    :catch_0
    move-exception v4

    .line 164
    .local v4, "x":Ljava/lang/Exception;
    const-string/jumbo v5, "vk"

    invoke-static {v5, v4}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1

    .line 130
    .end local v4    # "x":Ljava/lang/Exception;
    .restart local v2    # "preq":Lcom/vkontakte/android/data/PersistentAPIRequest;
    .restart local v3    # "req":Lcom/vkontakte/android/api/VKAPIRequest;, "Lcom/vkontakte/android/api/VKAPIRequest<Lorg/json/JSONObject;>;"
    :cond_1
    :try_start_1
    new-instance v5, Lcom/vkontakte/android/NetworkStateReceiver$1;

    invoke-direct {v5, p0, v3, v2}, Lcom/vkontakte/android/NetworkStateReceiver$1;-><init>(Lcom/vkontakte/android/NetworkStateReceiver;Lcom/vkontakte/android/api/VKAPIRequest;Lcom/vkontakte/android/data/PersistentAPIRequest;)V

    invoke-virtual {v3, v5}, Lcom/vkontakte/android/api/VKAPIRequest;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 161
    invoke-virtual {v3}, Lcom/vkontakte/android/api/VKAPIRequest;->execSync()Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0
.end method

.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 11
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v10, 0x0

    const/4 v6, 0x0

    .line 65
    const-string/jumbo v7, "android.intent.action.TIME_SET"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 66
    invoke-static {p1}, Lcom/vkontakte/android/NetworkStateReceiver;->updateUserInfo(Landroid/content/Context;)V

    .line 172
    :cond_0
    :goto_0
    return-void

    .line 70
    :cond_1
    const-string/jumbo v7, "android.net.conn.CONNECTIVITY_CHANGE"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_8

    .line 71
    const-string/jumbo v7, "noConnectivity"

    invoke-virtual {p2, v7, v6}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v7

    if-nez v7, :cond_5

    invoke-static {}, Lcom/vkontakte/android/NetworkStateReceiver;->isConnected()Z

    move-result v7

    if-eqz v7, :cond_5

    const/4 v0, 0x1

    .line 72
    .local v0, "_isConnected":Z
    :goto_1
    if-eqz v0, :cond_2

    .line 74
    invoke-static {}, Lcom/vk/imageloader/ImageNetworkFailHandler;->onNetworkConnected()V

    .line 76
    :cond_2
    invoke-static {}, Lcom/vkontakte/android/utils/Utils;->getNetworkType()Ljava/lang/String;

    move-result-object v7

    sput-object v7, Lcom/vkontakte/android/NetworkStateReceiver;->currentNetworkType:Ljava/lang/String;

    .line 77
    sget-boolean v7, Lcom/vkontakte/android/api/APIController;->API_DEBUG:Z

    if-eqz v7, :cond_3

    .line 78
    const-string/jumbo v7, "vk"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "!!!!!!!!!! NETWORK CHANGED to "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    sget-object v9, Lcom/vkontakte/android/NetworkStateReceiver;->currentNetworkType:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 80
    :cond_3
    invoke-static {}, Lcom/vkontakte/android/LongPollService;->doBroadcastStateChanged()V

    .line 81
    sget-boolean v7, Lcom/vkontakte/android/NetworkStateReceiver;->isConnected:Z

    if-eq v7, v0, :cond_0

    .line 84
    sput-boolean v0, Lcom/vkontakte/android/NetworkStateReceiver;->isConnected:Z

    .line 85
    sget-boolean v7, Lcom/vkontakte/android/NetworkStateReceiver;->isConnected:Z

    if-eqz v7, :cond_0

    .line 86
    sget-object v7, Lcom/vkontakte/android/Global;->longPoll:Lcom/vkontakte/android/LongPollService;

    if-nez v7, :cond_4

    invoke-static {}, Lcom/vkontakte/android/AppStateTracker;->getCurrentActivity()Landroid/app/Activity;

    move-result-object v7

    if-eqz v7, :cond_4

    .line 87
    new-instance v2, Landroid/content/Intent;

    sget-object v7, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const-class v8, Lcom/vkontakte/android/LongPollService;

    invoke-direct {v2, v7, v8}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 88
    .local v2, "lintent":Landroid/content/Intent;
    sget-object v7, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-virtual {v7, v2}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 90
    .end local v2    # "lintent":Landroid/content/Intent;
    :cond_4
    const-string/jumbo v7, "vk"

    const-string/jumbo v8, "Before update info"

    invoke-static {v7, v8}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 91
    invoke-static {p1}, Lcom/vkontakte/android/NetworkStateReceiver;->updateInfo(Landroid/content/Context;)V

    .line 92
    invoke-static {}, Lcom/vkontakte/android/cache/Cache;->getResendableMessages()Ljava/util/ArrayList;

    move-result-object v5

    .line 94
    .local v5, "resend":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/Message;>;"
    const-string/jumbo v7, "vk"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "Before resend "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 95
    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_2
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_6

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/vkontakte/android/Message;

    .line 98
    .local v3, "m":Lcom/vkontakte/android/Message;
    invoke-static {v3}, Lcom/vkontakte/android/data/Messages;->send(Lcom/vkontakte/android/Message;)Lcom/vkontakte/android/Message;

    move-result-object v4

    .line 99
    .local v4, "msg":Lcom/vkontakte/android/Message;
    invoke-static {v4, v10, v10}, Lcom/vkontakte/android/data/Messages;->add(Lcom/vkontakte/android/Message;Lcom/vkontakte/android/UserProfile;Ljava/lang/String;)V

    .line 101
    new-instance v1, Landroid/content/Intent;

    const-string/jumbo v8, "com.vkontakte.android.MESSAGE_DELETED"

    invoke-direct {v1, v8}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 102
    .local v1, "b":Landroid/content/Intent;
    const-string/jumbo v8, "msg_id"

    iget v9, v3, Lcom/vkontakte/android/Message;->id:I

    invoke-virtual {v1, v8, v9}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 103
    const-string/jumbo v8, "com.vkontakte.android.permission.ACCESS_DATA"

    invoke-virtual {p1, v1, v8}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 104
    new-instance v1, Landroid/content/Intent;

    .end local v1    # "b":Landroid/content/Intent;
    const-string/jumbo v8, "com.vkontakte.android.NEW_MESSAGE"

    invoke-direct {v1, v8}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 105
    .restart local v1    # "b":Landroid/content/Intent;
    const-string/jumbo v8, "peer_id"

    iget v9, v4, Lcom/vkontakte/android/Message;->peer:I

    invoke-virtual {v1, v8, v9}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 106
    const-string/jumbo v8, "message"

    invoke-virtual {v1, v8, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 107
    const-string/jumbo v8, "com.vkontakte.android.permission.ACCESS_DATA"

    invoke-virtual {p1, v1, v8}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    goto :goto_2

    .end local v0    # "_isConnected":Z
    .end local v1    # "b":Landroid/content/Intent;
    .end local v3    # "m":Lcom/vkontakte/android/Message;
    .end local v4    # "msg":Lcom/vkontakte/android/Message;
    .end local v5    # "resend":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/Message;>;"
    :cond_5
    move v0, v6

    .line 71
    goto/16 :goto_1

    .line 110
    .restart local v0    # "_isConnected":Z
    .restart local v5    # "resend":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/Message;>;"
    :cond_6
    invoke-virtual {p1, v10, v6}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v7

    const-string/jumbo v8, "pending_msg_notification"

    invoke-interface {v7, v8}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_7

    .line 111
    invoke-virtual {p1, v10, v6}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v7

    const-string/jumbo v8, "pending_msg_notification"

    invoke-interface {v7, v8, v6}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v6

    invoke-static {v6}, Lcom/vkontakte/android/GCMBroadcastReceiver;->updateStateAndShowNotification(I)V

    .line 114
    :cond_7
    new-instance v6, Ljava/lang/Thread;

    invoke-static {p0}, Lcom/vkontakte/android/NetworkStateReceiver$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/NetworkStateReceiver;)Ljava/lang/Runnable;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 166
    invoke-virtual {v6}, Ljava/lang/Thread;->start()V

    goto/16 :goto_0

    .line 168
    .end local v0    # "_isConnected":Z
    .end local v5    # "resend":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/Message;>;"
    :cond_8
    const-string/jumbo v6, "android.intent.action.TIME_SET"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_9

    const-string/jumbo v6, "android.intent.action.TIMEZONE_CHANGED"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 169
    :cond_9
    invoke-static {}, Lcom/vkontakte/android/TimeUtils;->resyncOffset()V

    goto/16 :goto_0
.end method
