.class final Lru/mail/libverify/storage/g;
.super Ljava/lang/Object;


# direct methods
.method static a(Lru/mail/libverify/storage/k;)Ljava/lang/String;
    .locals 5
    .param p0    # Lru/mail/libverify/storage/k;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    invoke-interface {p0}, Lru/mail/libverify/storage/k;->d()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lru/mail/libverify/utils/m;->f(Landroid/content/Context;)Ljava/lang/Integer;

    move-result-object v0

    if-eqz v0, :cond_0

    const-string/jumbo v2, "batteryLevel"

    invoke-virtual {v1, v2, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_0
    const-string/jumbo v0, "defaultLocale"

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v2

    invoke-static {v2}, Lru/mail/libverify/utils/m;->a(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    const-string/jumbo v2, "manufacturer"

    sget-object v3, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string/jumbo v2, "model"

    sget-object v3, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string/jumbo v2, "device"

    invoke-virtual {v1, v2, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string/jumbo v0, "deviceId"

    invoke-interface {p0}, Lru/mail/libverify/storage/k;->h()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lru/mail/libverify/utils/m;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    invoke-interface {p0}, Lru/mail/libverify/storage/k;->d()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lru/mail/libverify/utils/m;->d(Landroid/content/Context;)Ljava/lang/Boolean;

    move-result-object v2

    if-eqz v2, :cond_1

    const-string/jumbo v3, "isVoiceCapable"

    invoke-virtual {v0, v3, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_1
    invoke-interface {p0}, Lru/mail/libverify/storage/k;->d()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lru/mail/libverify/utils/m;->e(Landroid/content/Context;)Ljava/lang/Boolean;

    move-result-object v2

    if-eqz v2, :cond_2

    const-string/jumbo v3, "roaming"

    invoke-virtual {v0, v3, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_2
    const-string/jumbo v2, "cellular"

    invoke-interface {p0}, Lru/mail/libverify/storage/k;->d()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lru/mail/libverify/storage/g;->b(Landroid/content/Context;)Lorg/json/JSONObject;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string/jumbo v2, "data"

    invoke-interface {p0}, Lru/mail/libverify/storage/k;->d()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lru/mail/libverify/storage/g;->a(Landroid/content/Context;)Lorg/json/JSONObject;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string/jumbo v2, "networkInfo"

    invoke-virtual {v1, v2, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string/jumbo v0, "os"

    sget-object v2, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    invoke-virtual {v1, v0, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    const-string/jumbo v0, "ACCESS_NETWORK_STATE"

    invoke-interface {p0}, Lru/mail/libverify/storage/k;->d()Landroid/content/Context;

    move-result-object v3

    const-string/jumbo v4, "android.permission.ACCESS_NETWORK_STATE"

    invoke-static {v3, v4}, Lru/mail/libverify/utils/m;->b(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v3

    invoke-virtual {v2, v0, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    const-string/jumbo v0, "CALL_PHONE"

    invoke-interface {p0}, Lru/mail/libverify/storage/k;->d()Landroid/content/Context;

    move-result-object v3

    const-string/jumbo v4, "android.permission.CALL_PHONE"

    invoke-static {v3, v4}, Lru/mail/libverify/utils/m;->b(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v3

    invoke-virtual {v2, v0, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x10

    if-lt v0, v3, :cond_3

    const-string/jumbo v0, "READ_CALL_LOG"

    invoke-interface {p0}, Lru/mail/libverify/storage/k;->d()Landroid/content/Context;

    move-result-object v3

    const-string/jumbo v4, "android.permission.READ_CALL_LOG"

    invoke-static {v3, v4}, Lru/mail/libverify/utils/m;->b(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v3

    invoke-virtual {v2, v0, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    :cond_3
    const-string/jumbo v0, "READ_PHONE_STATE"

    invoke-interface {p0}, Lru/mail/libverify/storage/k;->d()Landroid/content/Context;

    move-result-object v3

    const-string/jumbo v4, "android.permission.READ_PHONE_STATE"

    invoke-static {v3, v4}, Lru/mail/libverify/utils/m;->b(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v3

    invoke-virtual {v2, v0, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    const-string/jumbo v0, "READ_SMS"

    invoke-interface {p0}, Lru/mail/libverify/storage/k;->d()Landroid/content/Context;

    move-result-object v3

    const-string/jumbo v4, "android.permission.READ_SMS"

    invoke-static {v3, v4}, Lru/mail/libverify/utils/m;->b(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v3

    invoke-virtual {v2, v0, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    const-string/jumbo v0, "RECEIVE_SMS"

    invoke-interface {p0}, Lru/mail/libverify/storage/k;->d()Landroid/content/Context;

    move-result-object v3

    const-string/jumbo v4, "android.permission.RECEIVE_SMS"

    invoke-static {v3, v4}, Lru/mail/libverify/utils/m;->b(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v3

    invoke-virtual {v2, v0, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    const-string/jumbo v3, "getCellularSignalLevel"

    invoke-interface {p0}, Lru/mail/libverify/storage/k;->d()Landroid/content/Context;

    move-result-object v0

    const-string/jumbo v4, "android.permission.ACCESS_COARSE_LOCATION"

    invoke-static {v0, v4}, Lru/mail/libverify/utils/m;->b(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_4

    invoke-interface {p0}, Lru/mail/libverify/storage/k;->d()Landroid/content/Context;

    move-result-object v0

    const-string/jumbo v4, "android.permission.ACCESS_FINE_LOCATION"

    invoke-static {v0, v4}, Lru/mail/libverify/utils/m;->b(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_5

    :cond_4
    const/4 v0, 0x1

    :goto_0
    invoke-virtual {v2, v3, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    const-string/jumbo v0, "permissions"

    invoke-virtual {v1, v0, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    invoke-interface {p0}, Lru/mail/libverify/storage/k;->p()Lru/mail/libverify/accounts/d;

    move-result-object v0

    const-string/jumbo v2, "simCardsCount"

    invoke-virtual {v0}, Lru/mail/libverify/accounts/d;->size()I

    move-result v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    const-string/jumbo v2, "simCardsInfo"

    invoke-interface {p0}, Lru/mail/libverify/storage/k;->d()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3, v0}, Lru/mail/libverify/storage/g;->a(Landroid/content/Context;Lru/mail/libverify/accounts/d;)Lorg/json/JSONObject;

    move-result-object v0

    invoke-virtual {v1, v2, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string/jumbo v0, "platform"

    const-string/jumbo v2, "Android"

    invoke-virtual {v1, v0, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    :goto_1
    return-object v0

    :cond_5
    const/4 v0, 0x0

    goto :goto_0

    :catch_0
    move-exception v0

    :try_start_1
    const-string/jumbo v1, "ExtendedPhoneInfo"

    const-string/jumbo v2, "failed to build extended info"

    invoke-static {v1, v2, v0}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    const/4 v0, 0x0

    goto :goto_1

    :catchall_0
    move-exception v0

    throw v0
.end method

.method private static a(Landroid/content/Context;)Lorg/json/JSONObject;
    .locals 7
    .param p0    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    :try_start_0
    const-string/jumbo v0, "android.permission.ACCESS_NETWORK_STATE"

    invoke-static {p0, v0}, Lru/mail/libverify/utils/m;->b(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    move-object v0, v1

    :goto_0
    return-object v0

    :cond_0
    const-string/jumbo v2, "Not connected"

    const-string/jumbo v0, "connectivity"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v3

    if-eqz v3, :cond_1

    invoke-virtual {v3}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-virtual {v3}, Landroid/net/NetworkInfo;->getTypeName()Ljava/lang/String;

    move-result-object v0

    :goto_1
    const-string/jumbo v2, "type"

    invoke-virtual {v1, v2, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :goto_2
    move-object v0, v1

    goto :goto_0

    :cond_1
    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getAllNetworkInfo()[Landroid/net/NetworkInfo;

    move-result-object v3

    array-length v4, v3

    const/4 v0, 0x0

    :goto_3
    if-ge v0, v4, :cond_3

    aget-object v5, v3, v0

    invoke-virtual {v5}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-virtual {v5}, Landroid/net/NetworkInfo;->getTypeName()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    goto :goto_1

    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    :catch_0
    move-exception v0

    const-string/jumbo v2, "ExtendedPhoneInfo"

    const-string/jumbo v3, "failed to get data info"

    invoke-static {v2, v3, v0}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_2

    :cond_3
    move-object v0, v2

    goto :goto_1
.end method

.method private static a(Landroid/content/Context;Lru/mail/libverify/accounts/d;)Lorg/json/JSONObject;
    .locals 9
    .param p0    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Lru/mail/libverify/accounts/d;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    :try_start_0
    const-string/jumbo v0, "android.permission.READ_PHONE_STATE"

    invoke-static {p0, v0}, Lru/mail/libverify/utils/m;->b(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    move-object v0, v1

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x1

    invoke-virtual {p1}, Lru/mail/libverify/accounts/d;->iterator()Ljava/util/Iterator;

    move-result-object v3

    move v2, v0

    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lru/mail/libverify/accounts/e;

    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    new-instance v5, Lorg/json/JSONObject;

    invoke-direct {v5}, Lorg/json/JSONObject;-><init>()V

    const-string/jumbo v6, "countryId"

    iget-object v7, v0, Lru/mail/libverify/accounts/e;->m:Ljava/lang/String;

    invoke-virtual {v5, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string/jumbo v6, "mcc"

    iget-object v7, v0, Lru/mail/libverify/accounts/e;->l:Ljava/lang/String;

    invoke-static {v7}, Lru/mail/libverify/accounts/e;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string/jumbo v6, "mnc"

    iget-object v7, v0, Lru/mail/libverify/accounts/e;->l:Ljava/lang/String;

    invoke-static {v7}, Lru/mail/libverify/accounts/e;->b(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string/jumbo v6, "name"

    iget-object v7, v0, Lru/mail/libverify/accounts/e;->k:Ljava/lang/String;

    invoke-virtual {v5, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string/jumbo v6, "roaming"

    iget-boolean v7, v0, Lru/mail/libverify/accounts/e;->h:Z

    invoke-virtual {v5, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    new-instance v6, Lorg/json/JSONObject;

    invoke-direct {v6}, Lorg/json/JSONObject;-><init>()V

    const-string/jumbo v7, "countryId"

    iget-object v8, v0, Lru/mail/libverify/accounts/e;->d:Ljava/lang/String;

    invoke-virtual {v6, v7, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string/jumbo v7, "mcc"

    iget-object v8, v0, Lru/mail/libverify/accounts/e;->j:Ljava/lang/String;

    invoke-static {v8}, Lru/mail/libverify/accounts/e;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string/jumbo v7, "mnc"

    iget-object v8, v0, Lru/mail/libverify/accounts/e;->j:Ljava/lang/String;

    invoke-static {v8}, Lru/mail/libverify/accounts/e;->b(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string/jumbo v7, "name"

    iget-object v0, v0, Lru/mail/libverify/accounts/e;->i:Ljava/lang/String;

    invoke-virtual {v6, v7, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string/jumbo v0, "operator"

    invoke-virtual {v4, v0, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string/jumbo v0, "sim"

    invoke-virtual {v4, v0, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    add-int/lit8 v0, v2, 0x1

    move v2, v0

    goto/16 :goto_1

    :catch_0
    move-exception v0

    const-string/jumbo v2, "ExtendedPhoneInfo"

    const-string/jumbo v3, "failed to get sim card info"

    invoke-static {v2, v3, v0}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_1
    move-object v0, v1

    goto/16 :goto_0
.end method

.method private static b(Landroid/content/Context;)Lorg/json/JSONObject;
    .locals 8
    .param p0    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    :try_start_0
    const-string/jumbo v0, "android.permission.ACCESS_COARSE_LOCATION"

    invoke-static {p0, v0}, Lru/mail/libverify/utils/m;->b(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string/jumbo v0, "android.permission.ACCESS_FINE_LOCATION"

    invoke-static {p0, v0}, Lru/mail/libverify/utils/m;->b(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    move-object v0, v2

    :goto_0
    return-object v0

    :cond_0
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x11

    if-lt v0, v1, :cond_5

    const-string/jumbo v0, "phone"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/telephony/TelephonyManager;

    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getAllCellInfo()Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_5

    const/4 v1, 0x1

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/telephony/CellInfo;

    invoke-virtual {v0}, Landroid/telephony/CellInfo;->isRegistered()Z

    move-result v3

    if-eqz v3, :cond_8

    const/4 v4, 0x0

    const-string/jumbo v3, "Unknown"

    new-instance v6, Lorg/json/JSONObject;

    invoke-direct {v6}, Lorg/json/JSONObject;-><init>()V

    instance-of v7, v0, Landroid/telephony/CellInfoGsm;

    if-eqz v7, :cond_1

    check-cast v0, Landroid/telephony/CellInfoGsm;

    invoke-virtual {v0}, Landroid/telephony/CellInfoGsm;->getCellSignalStrength()Landroid/telephony/CellSignalStrengthGsm;

    move-result-object v3

    const-string/jumbo v0, "Gsm"

    :goto_2
    const-string/jumbo v4, "type"

    invoke-virtual {v6, v4, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string/jumbo v4, "signalLevel"

    if-nez v3, :cond_4

    const/4 v0, -0x1

    :goto_3
    invoke-virtual {v6, v4, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    add-int/lit8 v0, v1, 0x1

    :goto_4
    move v1, v0

    goto :goto_1

    :cond_1
    instance-of v7, v0, Landroid/telephony/CellInfoCdma;

    if-eqz v7, :cond_2

    check-cast v0, Landroid/telephony/CellInfoCdma;

    invoke-virtual {v0}, Landroid/telephony/CellInfoCdma;->getCellSignalStrength()Landroid/telephony/CellSignalStrengthCdma;

    move-result-object v3

    const-string/jumbo v0, "Cdma"

    goto :goto_2

    :cond_2
    instance-of v7, v0, Landroid/telephony/CellInfoLte;

    if-eqz v7, :cond_3

    check-cast v0, Landroid/telephony/CellInfoLte;

    invoke-virtual {v0}, Landroid/telephony/CellInfoLte;->getCellSignalStrength()Landroid/telephony/CellSignalStrengthLte;

    move-result-object v3

    const-string/jumbo v0, "Lte"

    goto :goto_2

    :cond_3
    instance-of v7, v0, Landroid/telephony/CellInfoWcdma;

    if-eqz v7, :cond_7

    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v7, 0x12

    if-lt v3, v7, :cond_6

    check-cast v0, Landroid/telephony/CellInfoWcdma;

    invoke-virtual {v0}, Landroid/telephony/CellInfoWcdma;->getCellSignalStrength()Landroid/telephony/CellSignalStrengthWcdma;

    move-result-object v3

    :goto_5
    const-string/jumbo v0, "Wcdma"

    goto :goto_2

    :cond_4
    invoke-virtual {v3}, Landroid/telephony/CellSignalStrength;->getLevel()I
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    goto :goto_3

    :catch_0
    move-exception v0

    const-string/jumbo v1, "ExtendedPhoneInfo"

    const-string/jumbo v3, "failed to get cell info"

    invoke-static {v1, v3, v0}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_5
    move-object v0, v2

    goto/16 :goto_0

    :cond_6
    move-object v3, v4

    goto :goto_5

    :cond_7
    move-object v0, v3

    move-object v3, v4

    goto :goto_2

    :cond_8
    move v0, v1

    goto :goto_4
.end method
