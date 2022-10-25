.class public Lcom/vkontakte/android/utils/Utils;
.super Ljava/lang/Object;
.source "Utils.java"


# static fields
.field private static final DEFAULT_OBJ:Ljava/lang/Object;

.field public static final EMPTY_STRING:Ljava/lang/String; = ""


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 36
    const-class v0, Lcom/vkontakte/android/utils/Utils;

    sput-object v0, Lcom/vkontakte/android/utils/Utils;->DEFAULT_OBJ:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static addAndInitIfNeed(Ljava/util/ArrayList;Ljava/lang/Object;)Ljava/util/ArrayList;
    .locals 0
    .param p0    # Ljava/util/ArrayList;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/ArrayList",
            "<TT;>;TT;)",
            "Ljava/util/ArrayList",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 62
    .local p0, "array":Ljava/util/ArrayList;, "Ljava/util/ArrayList<TT;>;"
    .local p1, "object":Ljava/lang/Object;, "TT;"
    if-nez p0, :cond_0

    .line 63
    new-instance p0, Ljava/util/ArrayList;

    .end local p0    # "array":Ljava/util/ArrayList;, "Ljava/util/ArrayList<TT;>;"
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 65
    .restart local p0    # "array":Ljava/util/ArrayList;, "Ljava/util/ArrayList<TT;>;"
    :cond_0
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 66
    return-object p0
.end method

.method private static appendParamToBuilder(Ljava/lang/StringBuilder;Ljava/lang/String;)V
    .locals 1
    .param p0, "builder"    # Ljava/lang/StringBuilder;
    .param p1, "param"    # Ljava/lang/String;

    .prologue
    .line 266
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    if-eqz v0, :cond_0

    .line 267
    const/16 v0, 0x2c

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 269
    :cond_0
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 270
    return-void
.end method

.method public static arrayListToArray(Ljava/util/ArrayList;Landroid/os/Parcelable$Creator;)[Ljava/lang/Object;
    .locals 1
    .param p0    # Ljava/util/ArrayList;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/ArrayList",
            "<TT;>;",
            "Landroid/os/Parcelable$Creator",
            "<TT;>;)[TT;"
        }
    .end annotation

    .prologue
    .line 71
    .local p0, "array":Ljava/util/ArrayList;, "Ljava/util/ArrayList<TT;>;"
    .local p1, "creator":Landroid/os/Parcelable$Creator;, "Landroid/os/Parcelable$Creator<TT;>;"
    if-nez p0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    invoke-interface {p1, v0}, Landroid/os/Parcelable$Creator;->newArray(I)[Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    goto :goto_0
.end method

.method public static asList(Landroid/util/SparseArray;)Ljava/util/ArrayList;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<C:",
            "Ljava/lang/Object;",
            ">(",
            "Landroid/util/SparseArray",
            "<TC;>;)",
            "Ljava/util/ArrayList",
            "<TC;>;"
        }
    .end annotation

    .prologue
    .line 75
    .local p0, "sparseArray":Landroid/util/SparseArray;, "Landroid/util/SparseArray<TC;>;"
    if-nez p0, :cond_1

    const/4 v0, 0x0

    .line 79
    :cond_0
    return-object v0

    .line 76
    :cond_1
    new-instance v0, Ljava/util/ArrayList;

    invoke-virtual {p0}, Landroid/util/SparseArray;->size()I

    move-result v2

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 77
    .local v0, "arrayList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<TC;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {p0}, Landroid/util/SparseArray;->size()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 78
    invoke-virtual {p0, v1}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 77
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method public static castToActivity(Landroid/content/Context;)Landroid/app/Activity;
    .locals 1
    .param p0, "ctx"    # Landroid/content/Context;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 41
    instance-of v0, p0, Landroid/app/Activity;

    if-eqz v0, :cond_0

    check-cast p0, Landroid/app/Activity;

    .line 46
    .end local p0    # "ctx":Landroid/content/Context;
    :goto_0
    return-object p0

    .line 42
    .restart local p0    # "ctx":Landroid/content/Context;
    :cond_0
    :goto_1
    instance-of v0, p0, Landroid/app/Activity;

    if-nez v0, :cond_1

    instance-of v0, p0, Landroid/content/ContextWrapper;

    if-eqz v0, :cond_1

    .line 43
    check-cast p0, Landroid/content/ContextWrapper;

    .end local p0    # "ctx":Landroid/content/Context;
    invoke-virtual {p0}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    move-result-object p0

    .restart local p0    # "ctx":Landroid/content/Context;
    goto :goto_1

    .line 45
    :cond_1
    instance-of v0, p0, Landroid/app/Activity;

    if-eqz v0, :cond_2

    check-cast p0, Landroid/app/Activity;

    goto :goto_0

    .line 46
    :cond_2
    const/4 p0, 0x0

    goto :goto_0
.end method

.method public static closeSilently(Ljava/io/Closeable;)V
    .locals 1
    .param p0, "closeable"    # Ljava/io/Closeable;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 83
    if-eqz p0, :cond_0

    .line 85
    :try_start_0
    invoke-interface {p0}, Ljava/io/Closeable;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 90
    :cond_0
    :goto_0
    return-void

    .line 86
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public static containsKey(Landroid/util/SparseArray;I)Z
    .locals 2
    .param p0, "array"    # Landroid/util/SparseArray;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p1, "key"    # I

    .prologue
    .line 54
    if-eqz p0, :cond_0

    sget-object v0, Lcom/vkontakte/android/utils/Utils;->DEFAULT_OBJ:Ljava/lang/Object;

    invoke-virtual {p0, p1, v0}, Landroid/util/SparseArray;->get(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lcom/vkontakte/android/utils/Utils;->DEFAULT_OBJ:Ljava/lang/Object;

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static copyInputStreamToFile(Ljava/io/InputStream;Ljava/io/File;Lcom/vkontakte/android/functions/VoidF1;)V
    .locals 2
    .param p0, "input"    # Ljava/io/InputStream;
    .param p1, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/InputStream;",
            "Ljava/io/File;",
            "Lcom/vkontakte/android/functions/VoidF1",
            "<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 310
    .local p2, "funcAfterCopied":Lcom/vkontakte/android/functions/VoidF1;, "Lcom/vkontakte/android/functions/VoidF1<Ljava/lang/Boolean;>;"
    new-instance v0, Ljava/lang/Thread;

    invoke-static {p1, p0, p2}, Lcom/vkontakte/android/utils/Utils$$Lambda$1;->lambdaFactory$(Ljava/io/File;Ljava/io/InputStream;Lcom/vkontakte/android/functions/VoidF1;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 333
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 334
    return-void
.end method

.method public static equals(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 1
    .param p0    # Ljava/lang/Object;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p1    # Ljava/lang/Object;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<O:",
            "Ljava/lang/Object;",
            "T:",
            "Ljava/lang/Object;",
            ">(TO;TT;)Z"
        }
    .end annotation

    .prologue
    .line 50
    .local p0, "o1":Ljava/lang/Object;, "TO;"
    .local p1, "o2":Ljava/lang/Object;, "TT;"
    if-eq p0, p1, :cond_0

    if-eqz p0, :cond_1

    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static getCommaSeparated(Ljava/util/ArrayList;)Ljava/lang/String;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 93
    .local p0, "arrayList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    if-nez p0, :cond_1

    .line 94
    const-string/jumbo v1, ""

    .line 105
    :cond_0
    :goto_0
    return-object v1

    .line 96
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 97
    .local v0, "builder":Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 98
    .local v2, "string":Ljava/lang/String;
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 99
    const-string/jumbo v4, ","

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 101
    .end local v2    # "string":Ljava/lang/String;
    :cond_2
    const-string/jumbo v1, ""

    .line 102
    .local v1, "commaSeparated":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    if-lez v3, :cond_0

    .line 103
    const/4 v3, 0x0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    invoke-virtual {v0, v3, v4}, Ljava/lang/StringBuilder;->substring(II)Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method public static getConnectionSubtype()Ljava/lang/String;
    .locals 2

    .prologue
    .line 201
    invoke-static {}, Lcom/vkontakte/android/utils/Utils;->getConnectivityManager()Landroid/net/ConnectivityManager;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v0

    .line 202
    .local v0, "info":Landroid/net/NetworkInfo;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/net/NetworkInfo;->getSubtypeName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    :cond_0
    const-string/jumbo v1, "unknown"

    :goto_0
    return-object v1

    :cond_1
    invoke-virtual {v0}, Landroid/net/NetworkInfo;->getSubtypeName()Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method public static getConnectionType()Ljava/lang/String;
    .locals 2

    .prologue
    .line 185
    invoke-static {}, Lcom/vkontakte/android/utils/Utils;->getConnectivityManager()Landroid/net/ConnectivityManager;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v0

    .line 186
    .local v0, "info":Landroid/net/NetworkInfo;
    if-nez v0, :cond_0

    const/4 v1, -0x1

    :goto_0
    sparse-switch v1, :sswitch_data_0

    .line 196
    const-string/jumbo v1, "other"

    :goto_1
    return-object v1

    .line 186
    :cond_0
    invoke-virtual {v0}, Landroid/net/NetworkInfo;->getType()I

    move-result v1

    goto :goto_0

    .line 188
    :sswitch_0
    const-string/jumbo v1, "unknown"

    goto :goto_1

    .line 190
    :sswitch_1
    const-string/jumbo v1, "mobile"

    goto :goto_1

    .line 192
    :sswitch_2
    const-string/jumbo v1, "ethernet"

    goto :goto_1

    .line 194
    :sswitch_3
    const-string/jumbo v1, "wifi"

    goto :goto_1

    .line 186
    nop

    :sswitch_data_0
    .sparse-switch
        -0x1 -> :sswitch_0
        0x0 -> :sswitch_1
        0x1 -> :sswitch_3
        0x9 -> :sswitch_2
    .end sparse-switch
.end method

.method private static getConnectivityManager()Landroid/net/ConnectivityManager;
    .locals 2

    .prologue
    .line 148
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const-string/jumbo v1, "connectivity"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    return-object v0
.end method

.method public static getDeviceInfo()Ljava/lang/String;
    .locals 9

    .prologue
    const/4 v8, 0x0

    .line 273
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 275
    .local v2, "devInfo":Lorg/json/JSONObject;
    :try_start_0
    sget-object v4, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v4

    sget-object v5, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    invoke-virtual {v4, v5, v6}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v4

    iget-object v1, v4, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    .line 276
    .local v1, "appVersion":Ljava/lang/String;
    const-string/jumbo v4, "app_version"

    invoke-virtual {v2, v4, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 277
    const-string/jumbo v4, "system_name"

    const-string/jumbo v5, "Android"

    invoke-virtual {v2, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 278
    const-string/jumbo v4, "system_version"

    sget-object v5, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    invoke-virtual {v2, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 279
    const-string/jumbo v4, "manufacturer"

    sget-object v5, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    invoke-virtual {v2, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 280
    const-string/jumbo v4, "device_model"

    sget-object v5, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual {v2, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 281
    invoke-static {}, Lcom/vkontakte/android/data/Analytics;->getDeviceID()Ljava/lang/String;

    move-result-object v0

    .line 282
    .local v0, "adId":Ljava/lang/String;
    const-string/jumbo v4, "-3"

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 283
    const-string/jumbo v4, "ads_tracking_disabled"

    const/4 v5, 0x1

    invoke-virtual {v2, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 290
    :cond_0
    :goto_0
    sget-wide v4, Lcom/vkontakte/android/VKApplication;->deviceID:J

    const-wide/16 v6, 0x0

    cmp-long v4, v4, v6

    if-eqz v4, :cond_1

    .line 291
    const-string/jumbo v4, "ads_android_id"

    sget-wide v6, Lcom/vkontakte/android/VKApplication;->deviceID:J

    invoke-static {v6, v7}, Ljava/lang/Long;->toHexString(J)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 296
    .end local v0    # "adId":Ljava/lang/String;
    .end local v1    # "appVersion":Ljava/lang/String;
    :cond_1
    :goto_1
    invoke-virtual {v2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4

    .line 284
    .restart local v0    # "adId":Ljava/lang/String;
    .restart local v1    # "appVersion":Ljava/lang/String;
    :cond_2
    :try_start_1
    const-string/jumbo v4, "-1"

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    const-string/jumbo v4, "-2"

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 285
    const-string/jumbo v4, "ads_device_id"

    invoke-virtual {v2, v4, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 286
    invoke-static {}, Lcom/vkontakte/android/data/Analytics;->isLimitAdTrackingEnabled()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 287
    const-string/jumbo v4, "ads_tracking_disabled"

    const/4 v5, 0x1

    invoke-virtual {v2, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 293
    .end local v0    # "adId":Ljava/lang/String;
    .end local v1    # "appVersion":Ljava/lang/String;
    :catch_0
    move-exception v3

    .line 294
    .local v3, "e":Ljava/lang/Exception;
    new-array v4, v8, [Ljava/lang/Object;

    invoke-static {v3, v4}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto :goto_1
.end method

.method public static getNetworkType()Ljava/lang/String;
    .locals 3

    .prologue
    .line 162
    invoke-static {}, Lcom/vkontakte/android/utils/Utils;->getConnectivityManager()Landroid/net/ConnectivityManager;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v0

    .line 163
    .local v0, "info":Landroid/net/NetworkInfo;
    if-nez v0, :cond_0

    .line 164
    const-string/jumbo v1, "none"

    .line 181
    :goto_0
    return-object v1

    .line 166
    :cond_0
    invoke-virtual {v0}, Landroid/net/NetworkInfo;->getType()I

    move-result v1

    if-nez v1, :cond_4

    .line 167
    const-string/jumbo v1, "GPRS"

    invoke-virtual {v0}, Landroid/net/NetworkInfo;->getSubtypeName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string/jumbo v1, "EDGE"

    invoke-virtual {v0}, Landroid/net/NetworkInfo;->getSubtypeName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 168
    :cond_1
    const-string/jumbo v1, "edge"

    goto :goto_0

    .line 170
    :cond_2
    const-string/jumbo v1, "LTE"

    invoke-virtual {v0}, Landroid/net/NetworkInfo;->getSubtypeName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 171
    const-string/jumbo v1, "lte"

    goto :goto_0

    .line 173
    :cond_3
    const-string/jumbo v1, "3g"

    goto :goto_0

    .line 175
    :cond_4
    invoke-virtual {v0}, Landroid/net/NetworkInfo;->getType()I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_5

    .line 176
    const-string/jumbo v1, "wifi"

    goto :goto_0

    .line 178
    :cond_5
    invoke-virtual {v0}, Landroid/net/NetworkInfo;->getType()I

    move-result v1

    const/16 v2, 0x9

    if-ne v1, v2, :cond_6

    .line 179
    const-string/jumbo v1, "ethernet"

    goto :goto_0

    .line 181
    :cond_6
    const-string/jumbo v1, "other"

    goto :goto_0
.end method

.method public static varargs getNewsFilterParams([Ljava/lang/String;)Ljava/lang/String;
    .locals 12
    .param p0, "adsParams"    # [Ljava/lang/String;

    .prologue
    const/4 v8, 0x0

    .line 223
    sget-object v7, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-static {v7}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v5

    .line 224
    .local v5, "prefs":Landroid/content/SharedPreferences;
    const-string/jumbo v7, "__dbg_no_slider_ads"

    invoke-interface {v5, v7, v8}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v4

    .line 225
    .local v4, "dbgNoSliderAds":Z
    const-string/jumbo v7, "__dbg_demo_ads"

    invoke-interface {v5, v7, v8}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    .line 226
    .local v1, "dbgDemoAds":Z
    const-string/jumbo v7, "__dbg_no_ads"

    invoke-interface {v5, v7, v8}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    .line 227
    .local v3, "dbgNoAds":Z
    const-string/jumbo v7, "__dbg_demo_pretty_cards"

    invoke-interface {v5, v7, v8}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    .line 229
    .local v2, "dbgDemoPrettyCards":Z
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 231
    .local v0, "builder":Ljava/lang/StringBuilder;
    if-eqz v2, :cond_0

    .line 232
    const-string/jumbo v7, "ads_post"

    invoke-static {v0, v7}, Lcom/vkontakte/android/utils/Utils;->appendParamToBuilder(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    .line 233
    const-string/jumbo v7, "ads_post_pretty_cards"

    invoke-static {v0, v7}, Lcom/vkontakte/android/utils/Utils;->appendParamToBuilder(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    .line 234
    const-string/jumbo v7, "ads_demo"

    invoke-static {v0, v7}, Lcom/vkontakte/android/utils/Utils;->appendParamToBuilder(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    .line 235
    const-string/jumbo v7, "ads_demo_pretty_cards"

    invoke-static {v0, v7}, Lcom/vkontakte/android/utils/Utils;->appendParamToBuilder(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    .line 236
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 262
    :goto_0
    return-object v7

    .line 239
    :cond_0
    if-eqz v1, :cond_1

    .line 240
    const-string/jumbo v7, "ads_demo"

    invoke-static {v0, v7}, Lcom/vkontakte/android/utils/Utils;->appendParamToBuilder(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    .line 242
    :cond_1
    array-length v10, p0

    move v9, v8

    :goto_1
    if-ge v9, v10, :cond_4

    aget-object v6, p0, v9

    .line 243
    .local v6, "s":Ljava/lang/String;
    const/4 v7, -0x1

    invoke-virtual {v6}, Ljava/lang/String;->hashCode()I

    move-result v11

    sparse-switch v11, :sswitch_data_0

    :cond_2
    :goto_2
    packed-switch v7, :pswitch_data_0

    .line 259
    invoke-static {v0, v6}, Lcom/vkontakte/android/utils/Utils;->appendParamToBuilder(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    .line 242
    :cond_3
    :goto_3
    add-int/lit8 v7, v9, 0x1

    move v9, v7

    goto :goto_1

    .line 243
    :sswitch_0
    const-string/jumbo v11, "ads_app"

    invoke-virtual {v6, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_2

    move v7, v8

    goto :goto_2

    :sswitch_1
    const-string/jumbo v11, "ads_site"

    invoke-virtual {v6, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_2

    const/4 v7, 0x1

    goto :goto_2

    :sswitch_2
    const-string/jumbo v11, "ads_post"

    invoke-virtual {v6, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_2

    const/4 v7, 0x2

    goto :goto_2

    :sswitch_3
    const-string/jumbo v11, "ads_app_video"

    invoke-virtual {v6, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_2

    const/4 v7, 0x3

    goto :goto_2

    :sswitch_4
    const-string/jumbo v11, "ads_app_slider"

    invoke-virtual {v6, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_2

    const/4 v7, 0x4

    goto :goto_2

    :sswitch_5
    const-string/jumbo v11, "ads_post_pretty_cards"

    invoke-virtual {v6, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_2

    const/4 v7, 0x5

    goto :goto_2

    .line 247
    :pswitch_0
    if-nez v3, :cond_3

    .line 248
    invoke-static {v0, v6}, Lcom/vkontakte/android/utils/Utils;->appendParamToBuilder(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    goto :goto_3

    .line 254
    :pswitch_1
    if-nez v3, :cond_3

    if-nez v4, :cond_3

    .line 255
    invoke-static {v0, v6}, Lcom/vkontakte/android/utils/Utils;->appendParamToBuilder(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    goto :goto_3

    .line 262
    .end local v6    # "s":Ljava/lang/String;
    :cond_4
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    goto :goto_0

    .line 243
    :sswitch_data_0
    .sparse-switch
        -0x439db5ee -> :sswitch_0
        -0x3e03ec52 -> :sswitch_4
        -0x30123931 -> :sswitch_2
        -0x3010f28a -> :sswitch_1
        -0x21c31236 -> :sswitch_5
        0x58ff6c0e -> :sswitch_3
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_1
        :pswitch_1
    .end packed-switch
.end method

.method public static getUserOptions()Ljava/lang/String;
    .locals 6

    .prologue
    .line 206
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    .line 208
    .local v3, "root":Lorg/json/JSONObject;
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 209
    .local v1, "autoplay_video":Lorg/json/JSONObject;
    const-string/jumbo v4, "value"

    invoke-static {}, Lcom/vkontakte/android/cache/Videos;->getAutoPlayState()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/vkontakte/android/utils/Utils;->normalizeAutoPlayState(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 210
    const-string/jumbo v4, "autoplay_video"

    invoke-virtual {v3, v4, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 212
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 213
    .local v0, "autoplay_gif":Lorg/json/JSONObject;
    const-string/jumbo v4, "value"

    invoke-static {}, Lcom/vkontakte/android/cache/Gifs;->getAutoPlayState()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/vkontakte/android/utils/Utils;->normalizeAutoPlayState(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 214
    const-string/jumbo v4, "autoplay_gif"

    invoke-virtual {v3, v4, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 219
    .end local v0    # "autoplay_gif":Lorg/json/JSONObject;
    .end local v1    # "autoplay_video":Lorg/json/JSONObject;
    :goto_0
    invoke-virtual {v3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4

    .line 216
    :catch_0
    move-exception v2

    .line 217
    .local v2, "e":Lorg/json/JSONException;
    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Object;

    invoke-static {v2, v4}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public static isBlank(Ljava/lang/String;)Z
    .locals 1
    .param p0, "string"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 142
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isEmptyArray([Ljava/lang/Object;)Z
    .locals 1
    .param p0    # [Ljava/lang/Object;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([TT;)Z"
        }
    .end annotation

    .prologue
    .line 58
    .local p0, "array":[Ljava/lang/Object;, "[TT;"
    if-eqz p0, :cond_0

    array-length v0, p0

    if-nez v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isMobile()Z
    .locals 2

    .prologue
    .line 152
    invoke-static {}, Lcom/vkontakte/android/utils/Utils;->getConnectivityManager()Landroid/net/ConnectivityManager;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v0

    .line 153
    .local v0, "info":Landroid/net/NetworkInfo;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/net/NetworkInfo;->getType()I

    move-result v1

    if-nez v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static isWifi()Z
    .locals 3

    .prologue
    const/4 v1, 0x1

    .line 157
    invoke-static {}, Lcom/vkontakte/android/utils/Utils;->getConnectivityManager()Landroid/net/ConnectivityManager;

    move-result-object v2

    invoke-virtual {v2}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v0

    .line 158
    .local v0, "info":Landroid/net/NetworkInfo;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/net/NetworkInfo;->getType()I

    move-result v2

    if-ne v2, v1, :cond_0

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method static synthetic lambda$copyInputStreamToFile$0(Ljava/io/File;Ljava/io/InputStream;Lcom/vkontakte/android/functions/VoidF1;)V
    .locals 6
    .param p0, "file"    # Ljava/io/File;
    .param p1, "input"    # Ljava/io/InputStream;
    .param p2, "funcAfterCopied"    # Lcom/vkontakte/android/functions/VoidF1;

    .prologue
    .line 311
    const/4 v4, 0x0

    .line 313
    .local v4, "result":Z
    :try_start_0
    new-instance v2, Ljava/io/FileOutputStream;

    invoke-direct {v2, p0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 315
    .local v2, "output":Ljava/io/OutputStream;
    const v5, 0x8000

    :try_start_1
    new-array v0, v5, [B

    .line 318
    .local v0, "buffer":[B
    :goto_0
    invoke-virtual {p1, v0}, Ljava/io/InputStream;->read([B)I

    move-result v3

    .local v3, "read":I
    const/4 v5, -0x1

    if-eq v3, v5, :cond_0

    .line 319
    const/4 v5, 0x0

    invoke-virtual {v2, v0, v5, v3}, Ljava/io/OutputStream;->write([BII)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 323
    .end local v0    # "buffer":[B
    .end local v3    # "read":I
    :catchall_0
    move-exception v5

    :try_start_2
    invoke-static {v2}, Lcom/vkontakte/android/utils/Utils;->closeSilently(Ljava/io/Closeable;)V

    throw v5
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 326
    .end local v2    # "output":Ljava/io/OutputStream;
    :catch_0
    move-exception v1

    .line 327
    .local v1, "e":Ljava/lang/Exception;
    const/4 v5, 0x0

    :try_start_3
    new-array v5, v5, [Ljava/lang/Object;

    invoke-static {v1, v5}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 328
    const/4 v4, 0x0

    .line 330
    invoke-static {p1}, Lcom/vkontakte/android/utils/Utils;->closeSilently(Ljava/io/Closeable;)V

    .line 332
    .end local v1    # "e":Ljava/lang/Exception;
    :goto_1
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    invoke-interface {p2, v5}, Lcom/vkontakte/android/functions/VoidF1;->f(Ljava/lang/Object;)V

    .line 333
    return-void

    .line 321
    .restart local v0    # "buffer":[B
    .restart local v2    # "output":Ljava/io/OutputStream;
    .restart local v3    # "read":I
    :cond_0
    :try_start_4
    invoke-virtual {v2}, Ljava/io/OutputStream;->flush()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 323
    :try_start_5
    invoke-static {v2}, Lcom/vkontakte/android/utils/Utils;->closeSilently(Ljava/io/Closeable;)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 325
    const/4 v4, 0x1

    .line 330
    invoke-static {p1}, Lcom/vkontakte/android/utils/Utils;->closeSilently(Ljava/io/Closeable;)V

    goto :goto_1

    .end local v0    # "buffer":[B
    .end local v2    # "output":Ljava/io/OutputStream;
    .end local v3    # "read":I
    :catchall_1
    move-exception v5

    invoke-static {p1}, Lcom/vkontakte/android/utils/Utils;->closeSilently(Ljava/io/Closeable;)V

    throw v5
.end method

.method private static normalizeAutoPlayState(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "input"    # Ljava/lang/String;

    .prologue
    .line 300
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    const/4 v0, -0x1

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v2

    sparse-switch v2, :sswitch_data_0

    :cond_0
    :goto_0
    packed-switch v0, :pswitch_data_0

    .line 305
    const-string/jumbo p0, "none"

    .end local p0    # "input":Ljava/lang/String;
    :pswitch_0
    return-object p0

    .line 300
    .restart local p0    # "input":Ljava/lang/String;
    :sswitch_0
    const-string/jumbo v2, "wifi"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :sswitch_1
    const-string/jumbo v2, "always"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    nop

    :sswitch_data_0
    .sparse-switch
        -0x54506df1 -> :sswitch_1
        0x37af15 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public static objectToString(Ljava/lang/Object;)Ljava/lang/String;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 126
    .local p0, "o":Ljava/lang/Object;, "TT;"
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v5, " {"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 127
    .local v0, "builder":Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object v2

    .line 128
    .local v2, "fields":[Ljava/lang/reflect/Field;
    array-length v5, v2

    const/4 v4, 0x0

    :goto_0
    if-ge v4, v5, :cond_0

    aget-object v1, v2, v4

    .line 130
    .local v1, "field":Ljava/lang/reflect/Field;
    const/4 v6, 0x1

    :try_start_0
    invoke-virtual {v1, v6}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 131
    invoke-virtual {v1, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .line 132
    .local v3, "value":Ljava/lang/Object;
    invoke-virtual {v1}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, "=\'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, "\',"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0

    .line 128
    .end local v3    # "value":Ljava/lang/Object;
    :goto_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 137
    .end local v1    # "field":Ljava/lang/reflect/Field;
    :cond_0
    const-string/jumbo v4, "}"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 138
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4

    .line 133
    .restart local v1    # "field":Ljava/lang/reflect/Field;
    :catch_0
    move-exception v6

    goto :goto_1
.end method

.method public static optString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "jsonObject"    # Lorg/json/JSONObject;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p1, "key"    # Ljava/lang/String;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 110
    if-eqz p0, :cond_0

    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_1
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public static readString(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "b"    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p1, "key"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "def"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 115
    if-nez p0, :cond_0

    .end local p2    # "def":Ljava/lang/String;
    :goto_0
    return-object p2

    .restart local p2    # "def":Ljava/lang/String;
    :cond_0
    invoke-virtual {p0, p1, p2}, Landroid/os/Bundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    goto :goto_0
.end method

.method public static writeString(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/String;)Landroid/os/Bundle;
    .locals 0
    .param p0, "b"    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 119
    if-eqz p0, :cond_0

    .line 120
    invoke-virtual {p0, p1, p2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 122
    :cond_0
    return-object p0
.end method
