.class public Lio/sentry/android/event/helper/AndroidEventBuilderHelper;
.super Ljava/lang/Object;
.source "AndroidEventBuilderHelper.java"

# interfaces
.implements Lio/sentry/event/helper/EventBuilderHelper;


# static fields
.field private static final IS_EMULATOR:Ljava/lang/Boolean;

.field private static final KERNEL_VERSION:Ljava/lang/String;

.field public static final TAG:Ljava/lang/String;


# instance fields
.field private ctx:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 42
    const-class v0, Lio/sentry/android/event/helper/AndroidEventBuilderHelper;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lio/sentry/android/event/helper/AndroidEventBuilderHelper;->TAG:Ljava/lang/String;

    .line 44
    invoke-static {}, Lio/sentry/android/event/helper/AndroidEventBuilderHelper;->isEmulator()Ljava/lang/Boolean;

    move-result-object v0

    sput-object v0, Lio/sentry/android/event/helper/AndroidEventBuilderHelper;->IS_EMULATOR:Ljava/lang/Boolean;

    .line 45
    invoke-static {}, Lio/sentry/android/event/helper/AndroidEventBuilderHelper;->getKernelVersion()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lio/sentry/android/event/helper/AndroidEventBuilderHelper;->KERNEL_VERSION:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    iput-object p1, p0, Lio/sentry/android/event/helper/AndroidEventBuilderHelper;->ctx:Landroid/content/Context;

    .line 56
    return-void
.end method

.method private static getApplicationName(Landroid/content/Context;)Ljava/lang/String;
    .locals 5
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 478
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v0

    .line 479
    .local v0, "applicationInfo":Landroid/content/pm/ApplicationInfo;
    iget v2, v0, Landroid/content/pm/ApplicationInfo;->labelRes:I

    .line 480
    .local v2, "stringId":I
    if-nez v2, :cond_0

    .line 481
    iget-object v3, v0, Landroid/content/pm/ApplicationInfo;->nonLocalizedLabel:Ljava/lang/CharSequence;

    if-eqz v3, :cond_1

    .line 482
    iget-object v3, v0, Landroid/content/pm/ApplicationInfo;->nonLocalizedLabel:Ljava/lang/CharSequence;

    invoke-interface {v3}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v3

    .line 491
    .end local v0    # "applicationInfo":Landroid/content/pm/ApplicationInfo;
    .end local v2    # "stringId":I
    :goto_0
    return-object v3

    .line 485
    .restart local v0    # "applicationInfo":Landroid/content/pm/ApplicationInfo;
    .restart local v2    # "stringId":I
    :cond_0
    invoke-virtual {p0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    goto :goto_0

    .line 487
    .end local v0    # "applicationInfo":Landroid/content/pm/ApplicationInfo;
    .end local v2    # "stringId":I
    :catch_0
    move-exception v1

    .line 488
    .local v1, "e":Ljava/lang/Exception;
    sget-object v3, Lio/sentry/android/event/helper/AndroidEventBuilderHelper;->TAG:Ljava/lang/String;

    const-string/jumbo v4, "Error getting application name."

    invoke-static {v3, v4, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 491
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_1
    const/4 v3, 0x0

    goto :goto_0
.end method

.method private static getBatteryLevel(Landroid/content/Context;)Ljava/lang/Float;
    .locals 10
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    const/4 v5, 0x0

    const/4 v9, -0x1

    .line 245
    const/4 v6, 0x0

    :try_start_0
    new-instance v7, Landroid/content/IntentFilter;

    const-string/jumbo v8, "android.intent.action.BATTERY_CHANGED"

    invoke-direct {v7, v8}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v6, v7}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    move-result-object v1

    .line 246
    .local v1, "intent":Landroid/content/Intent;
    if-nez v1, :cond_1

    .line 264
    .end local v1    # "intent":Landroid/content/Intent;
    :cond_0
    :goto_0
    return-object v5

    .line 250
    .restart local v1    # "intent":Landroid/content/Intent;
    :cond_1
    const-string/jumbo v6, "level"

    const/4 v7, -0x1

    invoke-virtual {v1, v6, v7}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    .line 251
    .local v2, "level":I
    const-string/jumbo v6, "scale"

    const/4 v7, -0x1

    invoke-virtual {v1, v6, v7}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v4

    .line 253
    .local v4, "scale":I
    if-eq v2, v9, :cond_0

    if-eq v4, v9, :cond_0

    .line 258
    const/high16 v3, 0x42c80000    # 100.0f

    .line 261
    .local v3, "percentMultiplier":F
    int-to-float v6, v2

    int-to-float v7, v4

    div-float/2addr v6, v7

    mul-float/2addr v6, v3

    invoke-static {v6}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v5

    goto :goto_0

    .line 262
    .end local v1    # "intent":Landroid/content/Intent;
    .end local v2    # "level":I
    .end local v3    # "percentMultiplier":F
    .end local v4    # "scale":I
    :catch_0
    move-exception v0

    .line 263
    .local v0, "e":Ljava/lang/Exception;
    sget-object v6, Lio/sentry/android/event/helper/AndroidEventBuilderHelper;->TAG:Ljava/lang/String;

    const-string/jumbo v7, "Error getting device battery level."

    invoke-static {v6, v7, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method private getContexts()Ljava/util/Map;
    .locals 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 78
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 79
    .local v1, "contexts":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;>;"
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 80
    .local v2, "deviceMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    .line 81
    .local v6, "osMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 82
    .local v0, "appMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string/jumbo v10, "os"

    invoke-interface {v1, v10, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 83
    const-string/jumbo v10, "device"

    invoke-interface {v1, v10, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 84
    const-string/jumbo v10, "app"

    invoke-interface {v1, v10, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 87
    const-string/jumbo v10, "manufacturer"

    sget-object v11, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    invoke-interface {v2, v10, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 88
    const-string/jumbo v10, "brand"

    sget-object v11, Landroid/os/Build;->BRAND:Ljava/lang/String;

    invoke-interface {v2, v10, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 89
    const-string/jumbo v10, "model"

    sget-object v11, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-interface {v2, v10, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 90
    const-string/jumbo v10, "family"

    invoke-static {}, Lio/sentry/android/event/helper/AndroidEventBuilderHelper;->getFamily()Ljava/lang/String;

    move-result-object v11

    invoke-interface {v2, v10, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 91
    const-string/jumbo v10, "model_id"

    sget-object v11, Landroid/os/Build;->ID:Ljava/lang/String;

    invoke-interface {v2, v10, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 92
    const-string/jumbo v10, "battery_level"

    iget-object v11, p0, Lio/sentry/android/event/helper/AndroidEventBuilderHelper;->ctx:Landroid/content/Context;

    invoke-static {v11}, Lio/sentry/android/event/helper/AndroidEventBuilderHelper;->getBatteryLevel(Landroid/content/Context;)Ljava/lang/Float;

    move-result-object v11

    invoke-interface {v2, v10, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 93
    const-string/jumbo v10, "orientation"

    iget-object v11, p0, Lio/sentry/android/event/helper/AndroidEventBuilderHelper;->ctx:Landroid/content/Context;

    invoke-static {v11}, Lio/sentry/android/event/helper/AndroidEventBuilderHelper;->getOrientation(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v11

    invoke-interface {v2, v10, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 94
    const-string/jumbo v10, "simulator"

    sget-object v11, Lio/sentry/android/event/helper/AndroidEventBuilderHelper;->IS_EMULATOR:Ljava/lang/Boolean;

    invoke-interface {v2, v10, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 95
    const-string/jumbo v10, "arch"

    sget-object v11, Landroid/os/Build;->CPU_ABI:Ljava/lang/String;

    invoke-interface {v2, v10, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 96
    const-string/jumbo v10, "storage_size"

    invoke-static {}, Lio/sentry/android/event/helper/AndroidEventBuilderHelper;->getTotalInternalStorage()Ljava/lang/Long;

    move-result-object v11

    invoke-interface {v2, v10, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 97
    const-string/jumbo v10, "free_storage"

    invoke-static {}, Lio/sentry/android/event/helper/AndroidEventBuilderHelper;->getUnusedInternalStorage()Ljava/lang/Long;

    move-result-object v11

    invoke-interface {v2, v10, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 98
    const-string/jumbo v10, "external_storage_size"

    invoke-static {}, Lio/sentry/android/event/helper/AndroidEventBuilderHelper;->getTotalExternalStorage()Ljava/lang/Long;

    move-result-object v11

    invoke-interface {v2, v10, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 99
    const-string/jumbo v10, "external_free_storage"

    invoke-static {}, Lio/sentry/android/event/helper/AndroidEventBuilderHelper;->getUnusedExternalStorage()Ljava/lang/Long;

    move-result-object v11

    invoke-interface {v2, v10, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 100
    const-string/jumbo v10, "charging"

    iget-object v11, p0, Lio/sentry/android/event/helper/AndroidEventBuilderHelper;->ctx:Landroid/content/Context;

    invoke-static {v11}, Lio/sentry/android/event/helper/AndroidEventBuilderHelper;->isCharging(Landroid/content/Context;)Ljava/lang/Boolean;

    move-result-object v11

    invoke-interface {v2, v10, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 101
    const-string/jumbo v10, "online"

    iget-object v11, p0, Lio/sentry/android/event/helper/AndroidEventBuilderHelper;->ctx:Landroid/content/Context;

    invoke-static {v11}, Lio/sentry/android/event/helper/AndroidEventBuilderHelper;->isConnected(Landroid/content/Context;)Z

    move-result v11

    invoke-static {v11}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v11

    invoke-interface {v2, v10, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 103
    iget-object v10, p0, Lio/sentry/android/event/helper/AndroidEventBuilderHelper;->ctx:Landroid/content/Context;

    invoke-static {v10}, Lio/sentry/android/event/helper/AndroidEventBuilderHelper;->getDisplayMetrics(Landroid/content/Context;)Landroid/util/DisplayMetrics;

    move-result-object v3

    .line 104
    .local v3, "displayMetrics":Landroid/util/DisplayMetrics;
    if-eqz v3, :cond_0

    .line 105
    iget v10, v3, Landroid/util/DisplayMetrics;->widthPixels:I

    iget v11, v3, Landroid/util/DisplayMetrics;->heightPixels:I

    invoke-static {v10, v11}, Ljava/lang/Math;->max(II)I

    move-result v4

    .line 106
    .local v4, "largestSide":I
    iget v10, v3, Landroid/util/DisplayMetrics;->widthPixels:I

    iget v11, v3, Landroid/util/DisplayMetrics;->heightPixels:I

    invoke-static {v10, v11}, Ljava/lang/Math;->min(II)I

    move-result v9

    .line 107
    .local v9, "smallestSide":I
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {v4}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string/jumbo v11, "x"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-static {v9}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 108
    .local v8, "resolution":Ljava/lang/String;
    const-string/jumbo v10, "screen_resolution"

    invoke-interface {v2, v10, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 109
    const-string/jumbo v10, "screen_density"

    iget v11, v3, Landroid/util/DisplayMetrics;->density:F

    invoke-static {v11}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v11

    invoke-interface {v2, v10, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 110
    const-string/jumbo v10, "screen_dpi"

    iget v11, v3, Landroid/util/DisplayMetrics;->densityDpi:I

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-interface {v2, v10, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 113
    .end local v4    # "largestSide":I
    .end local v8    # "resolution":Ljava/lang/String;
    .end local v9    # "smallestSide":I
    :cond_0
    iget-object v10, p0, Lio/sentry/android/event/helper/AndroidEventBuilderHelper;->ctx:Landroid/content/Context;

    invoke-static {v10}, Lio/sentry/android/event/helper/AndroidEventBuilderHelper;->getMemInfo(Landroid/content/Context;)Landroid/app/ActivityManager$MemoryInfo;

    move-result-object v5

    .line 114
    .local v5, "memInfo":Landroid/app/ActivityManager$MemoryInfo;
    if-eqz v5, :cond_1

    .line 115
    const-string/jumbo v10, "free_memory"

    iget-wide v12, v5, Landroid/app/ActivityManager$MemoryInfo;->availMem:J

    invoke-static {v12, v13}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v11

    invoke-interface {v2, v10, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 116
    const-string/jumbo v10, "memory_size"

    iget-wide v12, v5, Landroid/app/ActivityManager$MemoryInfo;->totalMem:J

    invoke-static {v12, v13}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v11

    invoke-interface {v2, v10, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 117
    const-string/jumbo v10, "low_memory"

    iget-boolean v11, v5, Landroid/app/ActivityManager$MemoryInfo;->lowMemory:Z

    invoke-static {v11}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v11

    invoke-interface {v2, v10, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 121
    :cond_1
    const-string/jumbo v10, "name"

    const-string/jumbo v11, "Android"

    invoke-interface {v6, v10, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 122
    const-string/jumbo v10, "version"

    sget-object v11, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    invoke-interface {v6, v10, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 123
    const-string/jumbo v10, "build"

    sget-object v11, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    invoke-interface {v6, v10, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 124
    const-string/jumbo v10, "kernel_version"

    sget-object v11, Lio/sentry/android/event/helper/AndroidEventBuilderHelper;->KERNEL_VERSION:Ljava/lang/String;

    invoke-interface {v6, v10, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 125
    const-string/jumbo v10, "rooted"

    invoke-static {}, Lio/sentry/android/event/helper/AndroidEventBuilderHelper;->isRooted()Ljava/lang/Boolean;

    move-result-object v11

    invoke-interface {v6, v10, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 128
    iget-object v10, p0, Lio/sentry/android/event/helper/AndroidEventBuilderHelper;->ctx:Landroid/content/Context;

    invoke-static {v10}, Lio/sentry/android/event/helper/AndroidEventBuilderHelper;->getPackageInfo(Landroid/content/Context;)Landroid/content/pm/PackageInfo;

    move-result-object v7

    .line 129
    .local v7, "packageInfo":Landroid/content/pm/PackageInfo;
    if-eqz v7, :cond_2

    .line 130
    const-string/jumbo v10, "app_version"

    iget-object v11, v7, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    invoke-interface {v0, v10, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 131
    const-string/jumbo v10, "app_build"

    iget v11, v7, Landroid/content/pm/PackageInfo;->versionCode:I

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-interface {v0, v10, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 132
    const-string/jumbo v10, "app_identifier"

    iget-object v11, v7, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-interface {v0, v10, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 135
    :cond_2
    const-string/jumbo v10, "app_name"

    iget-object v11, p0, Lio/sentry/android/event/helper/AndroidEventBuilderHelper;->ctx:Landroid/content/Context;

    invoke-static {v11}, Lio/sentry/android/event/helper/AndroidEventBuilderHelper;->getApplicationName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v11

    invoke-interface {v0, v10, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 136
    const-string/jumbo v10, "app_start_time"

    new-instance v11, Ljava/util/Date;

    invoke-direct {v11}, Ljava/util/Date;-><init>()V

    invoke-static {v11}, Lio/sentry/android/event/helper/AndroidEventBuilderHelper;->stringifyDate(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v11

    invoke-interface {v0, v10, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 138
    return-object v1
.end method

.method private static getDisplayMetrics(Landroid/content/Context;)Landroid/util/DisplayMetrics;
    .locals 3
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 452
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 455
    :goto_0
    return-object v1

    .line 453
    :catch_0
    move-exception v0

    .line 454
    .local v0, "e":Ljava/lang/Exception;
    sget-object v1, Lio/sentry/android/event/helper/AndroidEventBuilderHelper;->TAG:Ljava/lang/String;

    const-string/jumbo v2, "Error getting DisplayMetrics."

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 455
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private static getFamily()Ljava/lang/String;
    .locals 3

    .prologue
    .line 164
    :try_start_0
    sget-object v1, Landroid/os/Build;->MODEL:Ljava/lang/String;

    const-string/jumbo v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    aget-object v1, v1, v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 167
    .local v0, "e":Ljava/lang/Exception;
    :goto_0
    return-object v1

    .line 165
    .end local v0    # "e":Ljava/lang/Exception;
    :catch_0
    move-exception v0

    .line 166
    .restart local v0    # "e":Ljava/lang/Exception;
    sget-object v1, Lio/sentry/android/event/helper/AndroidEventBuilderHelper;->TAG:Ljava/lang/String;

    const-string/jumbo v2, "Error getting device family."

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 167
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private static getKernelVersion()Ljava/lang/String;
    .locals 7

    .prologue
    .line 295
    const-string/jumbo v3, "Exception while attempting to read kernel information"

    .line 296
    .local v3, "errorMsg":Ljava/lang/String;
    const/4 v0, 0x0

    .line 298
    .local v0, "br":Ljava/io/BufferedReader;
    :try_start_0
    new-instance v1, Ljava/io/BufferedReader;

    new-instance v5, Ljava/io/FileReader;

    const-string/jumbo v6, "/proc/version"

    invoke-direct {v5, v6}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V

    invoke-direct {v1, v5}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 299
    .end local v0    # "br":Ljava/io/BufferedReader;
    .local v1, "br":Ljava/io/BufferedReader;
    :try_start_1
    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_4
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-result-object v5

    .line 303
    if-eqz v1, :cond_0

    .line 305
    :try_start_2
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    :cond_0
    :goto_0
    move-object v0, v1

    .line 312
    .end local v1    # "br":Ljava/io/BufferedReader;
    .restart local v0    # "br":Ljava/io/BufferedReader;
    :goto_1
    return-object v5

    .line 306
    .end local v0    # "br":Ljava/io/BufferedReader;
    .restart local v1    # "br":Ljava/io/BufferedReader;
    :catch_0
    move-exception v4

    .line 307
    .local v4, "ioe":Ljava/io/IOException;
    sget-object v6, Lio/sentry/android/event/helper/AndroidEventBuilderHelper;->TAG:Ljava/lang/String;

    invoke-static {v6, v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 300
    .end local v1    # "br":Ljava/io/BufferedReader;
    .end local v4    # "ioe":Ljava/io/IOException;
    .restart local v0    # "br":Ljava/io/BufferedReader;
    :catch_1
    move-exception v2

    .line 301
    .local v2, "e":Ljava/lang/Exception;
    :goto_2
    :try_start_3
    sget-object v5, Lio/sentry/android/event/helper/AndroidEventBuilderHelper;->TAG:Ljava/lang/String;

    invoke-static {v5, v3, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 303
    if-eqz v0, :cond_1

    .line 305
    :try_start_4
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2

    .line 312
    :cond_1
    :goto_3
    const/4 v5, 0x0

    goto :goto_1

    .line 306
    :catch_2
    move-exception v4

    .line 307
    .restart local v4    # "ioe":Ljava/io/IOException;
    sget-object v5, Lio/sentry/android/event/helper/AndroidEventBuilderHelper;->TAG:Ljava/lang/String;

    invoke-static {v5, v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_3

    .line 303
    .end local v2    # "e":Ljava/lang/Exception;
    .end local v4    # "ioe":Ljava/io/IOException;
    :catchall_0
    move-exception v5

    :goto_4
    if-eqz v0, :cond_2

    .line 305
    :try_start_5
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_3

    .line 308
    :cond_2
    :goto_5
    throw v5

    .line 306
    :catch_3
    move-exception v4

    .line 307
    .restart local v4    # "ioe":Ljava/io/IOException;
    sget-object v6, Lio/sentry/android/event/helper/AndroidEventBuilderHelper;->TAG:Ljava/lang/String;

    invoke-static {v6, v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_5

    .line 303
    .end local v0    # "br":Ljava/io/BufferedReader;
    .end local v4    # "ioe":Ljava/io/IOException;
    .restart local v1    # "br":Ljava/io/BufferedReader;
    :catchall_1
    move-exception v5

    move-object v0, v1

    .end local v1    # "br":Ljava/io/BufferedReader;
    .restart local v0    # "br":Ljava/io/BufferedReader;
    goto :goto_4

    .line 300
    .end local v0    # "br":Ljava/io/BufferedReader;
    .restart local v1    # "br":Ljava/io/BufferedReader;
    :catch_4
    move-exception v2

    move-object v0, v1

    .end local v1    # "br":Ljava/io/BufferedReader;
    .restart local v0    # "br":Ljava/io/BufferedReader;
    goto :goto_2
.end method

.method private static getMemInfo(Landroid/content/Context;)Landroid/app/ActivityManager$MemoryInfo;
    .locals 5
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 200
    :try_start_0
    const-string/jumbo v3, "activity"

    invoke-virtual {p0, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/ActivityManager;

    .line 201
    .local v0, "actManager":Landroid/app/ActivityManager;
    new-instance v2, Landroid/app/ActivityManager$MemoryInfo;

    invoke-direct {v2}, Landroid/app/ActivityManager$MemoryInfo;-><init>()V

    .line 202
    .local v2, "memInfo":Landroid/app/ActivityManager$MemoryInfo;
    invoke-virtual {v0, v2}, Landroid/app/ActivityManager;->getMemoryInfo(Landroid/app/ActivityManager$MemoryInfo;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 206
    .end local v0    # "actManager":Landroid/app/ActivityManager;
    .end local v2    # "memInfo":Landroid/app/ActivityManager$MemoryInfo;
    :goto_0
    return-object v2

    .line 204
    :catch_0
    move-exception v1

    .line 205
    .local v1, "e":Ljava/lang/Exception;
    sget-object v3, Lio/sentry/android/event/helper/AndroidEventBuilderHelper;->TAG:Ljava/lang/String;

    const-string/jumbo v4, "Error getting MemoryInfo."

    invoke-static {v3, v4, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 206
    const/4 v2, 0x0

    goto :goto_0
.end method

.method private static getOrientation(Landroid/content/Context;)Ljava/lang/String;
    .locals 4
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 219
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v2

    iget v2, v2, Landroid/content/res/Configuration;->orientation:I

    packed-switch v2, :pswitch_data_0

    .line 227
    const/4 v1, 0x0

    .line 233
    :goto_0
    return-object v1

    .line 221
    :pswitch_0
    const-string/jumbo v1, "landscape"

    .line 222
    .local v1, "o":Ljava/lang/String;
    goto :goto_0

    .line 224
    .end local v1    # "o":Ljava/lang/String;
    :pswitch_1
    const-string/jumbo v1, "portrait"
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 225
    .restart local v1    # "o":Ljava/lang/String;
    goto :goto_0

    .line 231
    .end local v1    # "o":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 232
    .local v0, "e":Ljava/lang/Exception;
    sget-object v2, Lio/sentry/android/event/helper/AndroidEventBuilderHelper;->TAG:Ljava/lang/String;

    const-string/jumbo v3, "Error getting device orientation."

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 233
    const/4 v1, 0x0

    goto :goto_0

    .line 219
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static getPackageInfo(Landroid/content/Context;)Landroid/content/pm/PackageInfo;
    .locals 4
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 149
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 152
    :goto_0
    return-object v1

    .line 150
    :catch_0
    move-exception v0

    .line 151
    .local v0, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    sget-object v1, Lio/sentry/android/event/helper/AndroidEventBuilderHelper;->TAG:Ljava/lang/String;

    const-string/jumbo v2, "Error getting package info."

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 152
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private static getTotalExternalStorage()Ljava/lang/Long;
    .locals 10

    .prologue
    .line 430
    :try_start_0
    invoke-static {}, Lio/sentry/android/event/helper/AndroidEventBuilderHelper;->isExternalStorageMounted()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 431
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v3

    .line 432
    .local v3, "path":Ljava/io/File;
    new-instance v4, Landroid/os/StatFs;

    invoke-virtual {v3}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Landroid/os/StatFs;-><init>(Ljava/lang/String;)V

    .line 433
    .local v4, "stat":Landroid/os/StatFs;
    invoke-virtual {v4}, Landroid/os/StatFs;->getBlockSize()I

    move-result v5

    int-to-long v0, v5

    .line 434
    .local v0, "blockSize":J
    invoke-virtual {v4}, Landroid/os/StatFs;->getBlockCount()I

    move-result v5

    int-to-long v6, v5

    .line 435
    .local v6, "totalBlocks":J
    mul-long v8, v6, v0

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v5

    .line 441
    .end local v0    # "blockSize":J
    .end local v4    # "stat":Landroid/os/StatFs;
    .end local v6    # "totalBlocks":J
    :goto_0
    return-object v5

    .line 437
    :catch_0
    move-exception v2

    .line 438
    .local v2, "e":Ljava/lang/Exception;
    sget-object v5, Lio/sentry/android/event/helper/AndroidEventBuilderHelper;->TAG:Ljava/lang/String;

    const-string/jumbo v8, "Error getting total external storage amount."

    invoke-static {v5, v8, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 441
    :cond_0
    const/4 v5, 0x0

    goto :goto_0
.end method

.method private static getTotalInternalStorage()Ljava/lang/Long;
    .locals 10

    .prologue
    .line 387
    :try_start_0
    invoke-static {}, Landroid/os/Environment;->getDataDirectory()Ljava/io/File;

    move-result-object v3

    .line 388
    .local v3, "path":Ljava/io/File;
    new-instance v4, Landroid/os/StatFs;

    invoke-virtual {v3}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Landroid/os/StatFs;-><init>(Ljava/lang/String;)V

    .line 389
    .local v4, "stat":Landroid/os/StatFs;
    invoke-virtual {v4}, Landroid/os/StatFs;->getBlockSize()I

    move-result v5

    int-to-long v0, v5

    .line 390
    .local v0, "blockSize":J
    invoke-virtual {v4}, Landroid/os/StatFs;->getBlockCount()I

    move-result v5

    int-to-long v6, v5

    .line 391
    .local v6, "totalBlocks":J
    mul-long v8, v6, v0

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v5

    .line 394
    .end local v0    # "blockSize":J
    .end local v4    # "stat":Landroid/os/StatFs;
    .end local v6    # "totalBlocks":J
    :goto_0
    return-object v5

    .line 392
    :catch_0
    move-exception v2

    .line 393
    .local v2, "e":Ljava/lang/Exception;
    sget-object v5, Lio/sentry/android/event/helper/AndroidEventBuilderHelper;->TAG:Ljava/lang/String;

    const-string/jumbo v8, "Error getting total internal storage amount."

    invoke-static {v5, v8, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 394
    const/4 v5, 0x0

    goto :goto_0
.end method

.method private static getUnusedExternalStorage()Ljava/lang/Long;
    .locals 10

    .prologue
    .line 407
    :try_start_0
    invoke-static {}, Lio/sentry/android/event/helper/AndroidEventBuilderHelper;->isExternalStorageMounted()Z

    move-result v7

    if-eqz v7, :cond_0

    .line 408
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v5

    .line 409
    .local v5, "path":Ljava/io/File;
    new-instance v6, Landroid/os/StatFs;

    invoke-virtual {v5}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Landroid/os/StatFs;-><init>(Ljava/lang/String;)V

    .line 410
    .local v6, "stat":Landroid/os/StatFs;
    invoke-virtual {v6}, Landroid/os/StatFs;->getBlockSize()I

    move-result v7

    int-to-long v2, v7

    .line 411
    .local v2, "blockSize":J
    invoke-virtual {v6}, Landroid/os/StatFs;->getAvailableBlocks()I

    move-result v7

    int-to-long v0, v7

    .line 412
    .local v0, "availableBlocks":J
    mul-long v8, v0, v2

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v7

    .line 418
    .end local v0    # "availableBlocks":J
    .end local v2    # "blockSize":J
    .end local v6    # "stat":Landroid/os/StatFs;
    :goto_0
    return-object v7

    .line 414
    :catch_0
    move-exception v4

    .line 415
    .local v4, "e":Ljava/lang/Exception;
    sget-object v7, Lio/sentry/android/event/helper/AndroidEventBuilderHelper;->TAG:Ljava/lang/String;

    const-string/jumbo v8, "Error getting unused external storage amount."

    invoke-static {v7, v8, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 418
    :cond_0
    const/4 v7, 0x0

    goto :goto_0
.end method

.method private static getUnusedInternalStorage()Ljava/lang/Long;
    .locals 10

    .prologue
    .line 369
    :try_start_0
    invoke-static {}, Landroid/os/Environment;->getDataDirectory()Ljava/io/File;

    move-result-object v5

    .line 370
    .local v5, "path":Ljava/io/File;
    new-instance v6, Landroid/os/StatFs;

    invoke-virtual {v5}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Landroid/os/StatFs;-><init>(Ljava/lang/String;)V

    .line 371
    .local v6, "stat":Landroid/os/StatFs;
    invoke-virtual {v6}, Landroid/os/StatFs;->getBlockSize()I

    move-result v7

    int-to-long v2, v7

    .line 372
    .local v2, "blockSize":J
    invoke-virtual {v6}, Landroid/os/StatFs;->getAvailableBlocks()I

    move-result v7

    int-to-long v0, v7

    .line 373
    .local v0, "availableBlocks":J
    mul-long v8, v0, v2

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v7

    .line 376
    .end local v0    # "availableBlocks":J
    .end local v2    # "blockSize":J
    .end local v6    # "stat":Landroid/os/StatFs;
    :goto_0
    return-object v7

    .line 374
    :catch_0
    move-exception v4

    .line 375
    .local v4, "e":Ljava/lang/Exception;
    sget-object v7, Lio/sentry/android/event/helper/AndroidEventBuilderHelper;->TAG:Ljava/lang/String;

    const-string/jumbo v8, "Error getting unused internal storage amount."

    invoke-static {v7, v8, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 376
    const/4 v7, 0x0

    goto :goto_0
.end method

.method private static isCharging(Landroid/content/Context;)Ljava/lang/Boolean;
    .locals 8
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 276
    const/4 v5, 0x0

    :try_start_0
    new-instance v6, Landroid/content/IntentFilter;

    const-string/jumbo v7, "android.intent.action.BATTERY_CHANGED"

    invoke-direct {v6, v7}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v5, v6}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    move-result-object v1

    .line 277
    .local v1, "intent":Landroid/content/Intent;
    if-nez v1, :cond_0

    .line 285
    .end local v1    # "intent":Landroid/content/Intent;
    :goto_0
    return-object v3

    .line 281
    .restart local v1    # "intent":Landroid/content/Intent;
    :cond_0
    const-string/jumbo v5, "plugged"

    const/4 v6, -0x1

    invoke-virtual {v1, v5, v6}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    .line 282
    .local v2, "plugged":I
    if-eq v2, v4, :cond_1

    const/4 v5, 0x2

    if-ne v2, v5, :cond_2

    :cond_1
    :goto_1
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    goto :goto_0

    :cond_2
    const/4 v4, 0x0

    goto :goto_1

    .line 283
    .end local v1    # "intent":Landroid/content/Intent;
    .end local v2    # "plugged":I
    :catch_0
    move-exception v0

    .line 284
    .local v0, "e":Ljava/lang/Exception;
    sget-object v4, Lio/sentry/android/event/helper/AndroidEventBuilderHelper;->TAG:Ljava/lang/String;

    const-string/jumbo v5, "Error getting device charging state."

    invoke-static {v4, v5, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method private static isConnected(Landroid/content/Context;)Z
    .locals 3
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 501
    const-string/jumbo v2, "connectivity"

    invoke-virtual {p0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/net/ConnectivityManager;

    .line 503
    .local v1, "connectivityManager":Landroid/net/ConnectivityManager;
    invoke-virtual {v1}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v0

    .line 504
    .local v0, "activeNetworkInfo":Landroid/net/NetworkInfo;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v2, 0x1

    :goto_0
    return v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method private static isEmulator()Ljava/lang/Boolean;
    .locals 3

    .prologue
    .line 178
    :try_start_0
    sget-object v1, Landroid/os/Build;->FINGERPRINT:Ljava/lang/String;

    const-string/jumbo v2, "generic"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    sget-object v1, Landroid/os/Build;->FINGERPRINT:Ljava/lang/String;

    const-string/jumbo v2, "unknown"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    sget-object v1, Landroid/os/Build;->MODEL:Ljava/lang/String;

    const-string/jumbo v2, "google_sdk"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    sget-object v1, Landroid/os/Build;->MODEL:Ljava/lang/String;

    const-string/jumbo v2, "Emulator"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    sget-object v1, Landroid/os/Build;->MODEL:Ljava/lang/String;

    const-string/jumbo v2, "Android SDK built for x86"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    sget-object v1, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    const-string/jumbo v2, "Genymotion"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    sget-object v1, Landroid/os/Build;->BRAND:Ljava/lang/String;

    const-string/jumbo v2, "generic"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    sget-object v1, Landroid/os/Build;->DEVICE:Ljava/lang/String;

    const-string/jumbo v2, "generic"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    :cond_0
    const-string/jumbo v1, "google_sdk"

    sget-object v2, Landroid/os/Build;->PRODUCT:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    :cond_1
    const/4 v1, 0x1

    :goto_0
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 188
    .local v0, "e":Ljava/lang/Exception;
    :goto_1
    return-object v1

    .line 178
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_2
    const/4 v1, 0x0

    goto :goto_0

    .line 186
    :catch_0
    move-exception v0

    .line 187
    .restart local v0    # "e":Ljava/lang/Exception;
    sget-object v1, Lio/sentry/android/event/helper/AndroidEventBuilderHelper;->TAG:Ljava/lang/String;

    const-string/jumbo v2, "Error checking whether application is running in an emulator."

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 188
    const/4 v1, 0x0

    goto :goto_1
.end method

.method private static isExternalStorageMounted()Z
    .locals 2

    .prologue
    .line 358
    invoke-static {}, Landroid/os/Environment;->getExternalStorageState()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "mounted"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Landroid/os/Environment;->isExternalStorageEmulated()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static isRooted()Ljava/lang/Boolean;
    .locals 10

    .prologue
    const/4 v9, 0x0

    const/4 v8, 0x1

    .line 322
    sget-object v6, Landroid/os/Build;->TAGS:Ljava/lang/String;

    if-eqz v6, :cond_0

    sget-object v6, Landroid/os/Build;->TAGS:Ljava/lang/String;

    const-string/jumbo v7, "test-keys"

    invoke-virtual {v6, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 323
    invoke-static {v8}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    .line 354
    .local v0, "arr$":[Ljava/lang/String;
    .local v2, "i$":I
    .local v3, "len$":I
    .local v5, "probableRootPaths":[Ljava/lang/String;
    :goto_0
    return-object v6

    .line 326
    .end local v0    # "arr$":[Ljava/lang/String;
    .end local v2    # "i$":I
    .end local v3    # "len$":I
    .end local v5    # "probableRootPaths":[Ljava/lang/String;
    :cond_0
    const/16 v6, 0xf

    new-array v5, v6, [Ljava/lang/String;

    const-string/jumbo v6, "/data/local/bin/su"

    aput-object v6, v5, v9

    const-string/jumbo v6, "/data/local/su"

    aput-object v6, v5, v8

    const/4 v6, 0x2

    const-string/jumbo v7, "/data/local/xbin/su"

    aput-object v7, v5, v6

    const/4 v6, 0x3

    const-string/jumbo v7, "/sbin/su"

    aput-object v7, v5, v6

    const/4 v6, 0x4

    const-string/jumbo v7, "/su/bin"

    aput-object v7, v5, v6

    const/4 v6, 0x5

    const-string/jumbo v7, "/su/bin/su"

    aput-object v7, v5, v6

    const/4 v6, 0x6

    const-string/jumbo v7, "/system/app/SuperSU"

    aput-object v7, v5, v6

    const/4 v6, 0x7

    const-string/jumbo v7, "/system/app/SuperSU.apk"

    aput-object v7, v5, v6

    const/16 v6, 0x8

    const-string/jumbo v7, "/system/app/Superuser"

    aput-object v7, v5, v6

    const/16 v6, 0x9

    const-string/jumbo v7, "/system/app/Superuser.apk"

    aput-object v7, v5, v6

    const/16 v6, 0xa

    const-string/jumbo v7, "/system/bin/failsafe/su"

    aput-object v7, v5, v6

    const/16 v6, 0xb

    const-string/jumbo v7, "/system/bin/su"

    aput-object v7, v5, v6

    const/16 v6, 0xc

    const-string/jumbo v7, "/system/sd/xbin/su"

    aput-object v7, v5, v6

    const/16 v6, 0xd

    const-string/jumbo v7, "/system/xbin/daemonsu"

    aput-object v7, v5, v6

    const/16 v6, 0xe

    const-string/jumbo v7, "/system/xbin/su"

    aput-object v7, v5, v6

    .line 344
    .restart local v5    # "probableRootPaths":[Ljava/lang/String;
    move-object v0, v5

    .restart local v0    # "arr$":[Ljava/lang/String;
    array-length v3, v0

    .restart local v3    # "len$":I
    const/4 v2, 0x0

    .restart local v2    # "i$":I
    :goto_1
    if-ge v2, v3, :cond_2

    aget-object v4, v0, v2

    .line 346
    .local v4, "probableRootPath":Ljava/lang/String;
    :try_start_0
    new-instance v6, Ljava/io/File;

    invoke-direct {v6, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6}, Ljava/io/File;->exists()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 347
    const/4 v6, 0x1

    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v6

    goto :goto_0

    .line 349
    :catch_0
    move-exception v1

    .line 350
    .local v1, "e":Ljava/lang/Exception;
    sget-object v6, Lio/sentry/android/event/helper/AndroidEventBuilderHelper;->TAG:Ljava/lang/String;

    const-string/jumbo v7, "Exception while attempting to detect whether the device is rooted"

    invoke-static {v6, v7, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 344
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 354
    .end local v4    # "probableRootPath":Ljava/lang/String;
    :cond_2
    invoke-static {v9}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    goto/16 :goto_0
.end method

.method private static stringifyDate(Ljava/util/Date;)Ljava/lang/String;
    .locals 2
    .param p0, "date"    # Ljava/util/Date;

    .prologue
    .line 467
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string/jumbo v1, "yyyy-MM-dd\'T\'HH:mm:ss\'Z\'"

    invoke-direct {v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public helpBuildingEvent(Lio/sentry/event/EventBuilder;)V
    .locals 6
    .param p1, "eventBuilder"    # Lio/sentry/event/EventBuilder;

    .prologue
    const/4 v5, 0x0

    .line 60
    const-string/jumbo v3, "android"

    invoke-virtual {p1, v3}, Lio/sentry/event/EventBuilder;->withSdkIntegration(Ljava/lang/String;)Lio/sentry/event/EventBuilder;

    .line 61
    iget-object v3, p0, Lio/sentry/android/event/helper/AndroidEventBuilderHelper;->ctx:Landroid/content/Context;

    invoke-static {v3}, Lio/sentry/android/event/helper/AndroidEventBuilderHelper;->getPackageInfo(Landroid/content/Context;)Landroid/content/pm/PackageInfo;

    move-result-object v1

    .line 62
    .local v1, "packageInfo":Landroid/content/pm/PackageInfo;
    if-eqz v1, :cond_0

    .line 63
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, v1, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "-"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, v1, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Lio/sentry/event/EventBuilder;->withRelease(Ljava/lang/String;)Lio/sentry/event/EventBuilder;

    .line 64
    iget v3, v1, Landroid/content/pm/PackageInfo;->versionCode:I

    invoke-static {v3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Lio/sentry/event/EventBuilder;->withDist(Ljava/lang/String;)Lio/sentry/event/EventBuilder;

    .line 67
    :cond_0
    iget-object v3, p0, Lio/sentry/android/event/helper/AndroidEventBuilderHelper;->ctx:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    const-string/jumbo v4, "android_id"

    invoke-static {v3, v4}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 68
    .local v0, "androidId":Ljava/lang/String;
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, ""

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 69
    new-instance v2, Lio/sentry/event/interfaces/UserInterface;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "android:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v5, v5, v5}, Lio/sentry/event/interfaces/UserInterface;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 71
    .local v2, "userInterface":Lio/sentry/event/interfaces/UserInterface;
    const/4 v3, 0x0

    invoke-virtual {p1, v2, v3}, Lio/sentry/event/EventBuilder;->withSentryInterface(Lio/sentry/event/interfaces/SentryInterface;Z)Lio/sentry/event/EventBuilder;

    .line 74
    .end local v2    # "userInterface":Lio/sentry/event/interfaces/UserInterface;
    :cond_1
    invoke-direct {p0}, Lio/sentry/android/event/helper/AndroidEventBuilderHelper;->getContexts()Ljava/util/Map;

    move-result-object v3

    invoke-virtual {p1, v3}, Lio/sentry/event/EventBuilder;->withContexts(Ljava/util/Map;)Lio/sentry/event/EventBuilder;

    .line 75
    return-void
.end method
