.class public final Lru/mail/libverify/accounts/f;
.super Ljava/lang/Object;


# direct methods
.method private static a(Landroid/telephony/TelephonyManager;)I
    .locals 1
    .param p0    # Landroid/telephony/TelephonyManager;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    :try_start_0
    const-string/jumbo v0, "getSimState"

    invoke-static {p0, v0}, Lru/mail/libverify/accounts/f;->a(Landroid/telephony/TelephonyManager;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    :goto_0
    return v0

    :catch_0
    move-exception v0

    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static a(Landroid/telephony/TelephonyManager;Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p0    # Landroid/telephony/TelephonyManager;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const/4 v0, 0x0

    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Class;

    const/4 v3, 0x0

    sget-object v4, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v4, v2, v3

    invoke-virtual {v1, p1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    const/4 v4, 0x1

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-virtual {v1, p0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    :cond_0
    :goto_0
    return-object v0

    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method public static a(Landroid/content/Context;)Lru/mail/libverify/accounts/d;
    .locals 8
    .param p0    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "HardwareIds"
        }
    .end annotation

    const/4 v3, 0x0

    const/4 v2, 0x1

    new-instance v1, Lru/mail/libverify/accounts/d;

    invoke-direct {v1}, Lru/mail/libverify/accounts/d;-><init>()V

    const-string/jumbo v0, "android.permission.READ_PHONE_STATE"

    invoke-static {p0, v0}, Lru/mail/libverify/utils/m;->b(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string/jumbo v0, "SimCardReader"

    const-string/jumbo v4, "can\'t read sim data without %s"

    new-array v5, v2, [Ljava/lang/Object;

    const-string/jumbo v6, "android.permission.READ_PHONE_STATE"

    aput-object v6, v5, v3

    invoke-static {v0, v4, v5}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    move v0, v3

    :goto_0
    if-nez v0, :cond_1

    const-string/jumbo v0, "no_permission"

    iput-object v0, v1, Lru/mail/libverify/accounts/d;->a:Ljava/lang/String;

    move-object v0, v1

    :goto_1
    return-object v0

    :cond_0
    move v0, v2

    goto :goto_0

    :cond_1
    const-string/jumbo v0, "SimCardReader"

    const-string/jumbo v4, "readData started"

    invoke-static {v0, v4}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;)V

    :try_start_0
    const-string/jumbo v0, "phone"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/telephony/TelephonyManager;

    if-eqz v0, :cond_6

    new-instance v4, Lru/mail/libverify/accounts/e;

    invoke-direct {v4}, Lru/mail/libverify/accounts/e;-><init>()V

    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getSimState()I

    move-result v5

    invoke-static {v5}, Lru/mail/libverify/accounts/f;->a(I)Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getLine1Number()Ljava/lang/String;

    move-result-object v6

    iput-object v6, v4, Lru/mail/libverify/accounts/e;->e:Ljava/lang/String;

    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getDeviceId()Ljava/lang/String;

    move-result-object v6

    iput-object v6, v4, Lru/mail/libverify/accounts/e;->c:Ljava/lang/String;

    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getSimSerialNumber()Ljava/lang/String;

    move-result-object v6

    iput-object v6, v4, Lru/mail/libverify/accounts/e;->b:Ljava/lang/String;

    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getSubscriberId()Ljava/lang/String;

    move-result-object v6

    iput-object v6, v4, Lru/mail/libverify/accounts/e;->a:Ljava/lang/String;

    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getSimCountryIso()Ljava/lang/String;

    move-result-object v6

    iput-object v6, v4, Lru/mail/libverify/accounts/e;->d:Ljava/lang/String;

    iget-object v6, v4, Lru/mail/libverify/accounts/e;->d:Ljava/lang/String;

    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_2

    iget-object v6, v4, Lru/mail/libverify/accounts/e;->d:Ljava/lang/String;

    sget-object v7, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v6, v7}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v4, Lru/mail/libverify/accounts/e;->d:Ljava/lang/String;

    :cond_2
    invoke-static {v5}, Lru/mail/libverify/accounts/f;->b(I)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v4, Lru/mail/libverify/accounts/e;->f:Ljava/lang/String;

    invoke-static {v5}, Lru/mail/libverify/accounts/f;->a(I)Z

    move-result v5

    iput-boolean v5, v4, Lru/mail/libverify/accounts/e;->g:Z

    iget-boolean v5, v4, Lru/mail/libverify/accounts/e;->g:Z

    if-eqz v5, :cond_3

    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getSimOperator()Ljava/lang/String;

    move-result-object v5

    iput-object v5, v4, Lru/mail/libverify/accounts/e;->j:Ljava/lang/String;

    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getSimOperatorName()Ljava/lang/String;

    move-result-object v5

    iput-object v5, v4, Lru/mail/libverify/accounts/e;->i:Ljava/lang/String;

    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getNetworkOperator()Ljava/lang/String;

    move-result-object v5

    iput-object v5, v4, Lru/mail/libverify/accounts/e;->l:Ljava/lang/String;

    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getNetworkOperatorName()Ljava/lang/String;

    move-result-object v5

    iput-object v5, v4, Lru/mail/libverify/accounts/e;->k:Ljava/lang/String;

    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getNetworkCountryIso()Ljava/lang/String;

    move-result-object v5

    iput-object v5, v4, Lru/mail/libverify/accounts/e;->m:Ljava/lang/String;

    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->isNetworkRoaming()Z

    move-result v5

    iput-boolean v5, v4, Lru/mail/libverify/accounts/e;->h:Z

    :cond_3
    invoke-virtual {v1, v4}, Lru/mail/libverify/accounts/d;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    :try_start_1
    invoke-static {v0}, Lru/mail/libverify/accounts/f;->a(Landroid/telephony/TelephonyManager;)I

    move-result v5

    if-nez v5, :cond_7

    move v4, v2

    :goto_2
    if-nez v4, :cond_6

    if-ne v5, v2, :cond_8

    :goto_3
    if-nez v2, :cond_6

    new-instance v2, Lru/mail/libverify/accounts/e;

    invoke-direct {v2}, Lru/mail/libverify/accounts/e;-><init>()V

    invoke-static {v5}, Lru/mail/libverify/accounts/f;->a(I)Z

    move-result v3

    if-eqz v3, :cond_4

    const-string/jumbo v3, "getLine1NumberForSubscriber"

    invoke-static {v0, v3}, Lru/mail/libverify/accounts/f;->a(Landroid/telephony/TelephonyManager;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lru/mail/libverify/accounts/e;->e:Ljava/lang/String;

    const-string/jumbo v3, "getDeviceId"

    invoke-static {v0, v3}, Lru/mail/libverify/accounts/f;->a(Landroid/telephony/TelephonyManager;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lru/mail/libverify/accounts/e;->c:Ljava/lang/String;

    const-string/jumbo v3, "getSimSerialNumber"

    invoke-static {v0, v3}, Lru/mail/libverify/accounts/f;->a(Landroid/telephony/TelephonyManager;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lru/mail/libverify/accounts/e;->b:Ljava/lang/String;

    const-string/jumbo v3, "getSubscriberId"

    invoke-static {v0, v3}, Lru/mail/libverify/accounts/f;->a(Landroid/telephony/TelephonyManager;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lru/mail/libverify/accounts/e;->a:Ljava/lang/String;

    const-string/jumbo v3, "getSimCountryIso"

    invoke-static {v0, v3}, Lru/mail/libverify/accounts/f;->a(Landroid/telephony/TelephonyManager;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lru/mail/libverify/accounts/e;->d:Ljava/lang/String;

    iget-object v3, v2, Lru/mail/libverify/accounts/e;->d:Ljava/lang/String;

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_4

    iget-object v3, v2, Lru/mail/libverify/accounts/e;->d:Ljava/lang/String;

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v3, v4}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lru/mail/libverify/accounts/e;->d:Ljava/lang/String;

    :cond_4
    invoke-static {v5}, Lru/mail/libverify/accounts/f;->b(I)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lru/mail/libverify/accounts/e;->f:Ljava/lang/String;

    invoke-static {v5}, Lru/mail/libverify/accounts/f;->a(I)Z

    move-result v3

    iput-boolean v3, v2, Lru/mail/libverify/accounts/e;->g:Z

    iget-boolean v3, v2, Lru/mail/libverify/accounts/e;->g:Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    if-eqz v3, :cond_5

    :try_start_2
    const-string/jumbo v3, "getSimOperator"

    invoke-static {v0, v3}, Lru/mail/libverify/accounts/f;->a(Landroid/telephony/TelephonyManager;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lru/mail/libverify/accounts/e;->j:Ljava/lang/String;

    const-string/jumbo v3, "getSimOperatorNameForPhone"

    invoke-static {v0, v3}, Lru/mail/libverify/accounts/f;->a(Landroid/telephony/TelephonyManager;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lru/mail/libverify/accounts/e;->i:Ljava/lang/String;

    const-string/jumbo v3, "getNetworkOperator"

    invoke-static {v0, v3}, Lru/mail/libverify/accounts/f;->a(Landroid/telephony/TelephonyManager;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lru/mail/libverify/accounts/e;->l:Ljava/lang/String;

    const-string/jumbo v3, "getNetworkOperatorName"

    invoke-static {v0, v3}, Lru/mail/libverify/accounts/f;->a(Landroid/telephony/TelephonyManager;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lru/mail/libverify/accounts/e;->k:Ljava/lang/String;

    const-string/jumbo v3, "getNetworkCountryIsoForPhone"

    invoke-static {v0, v3}, Lru/mail/libverify/accounts/f;->a(Landroid/telephony/TelephonyManager;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lru/mail/libverify/accounts/e;->m:Ljava/lang/String;

    const-string/jumbo v3, "isNetworkRoaming"

    invoke-static {v0, v3}, Lru/mail/libverify/accounts/f;->a(Landroid/telephony/TelephonyManager;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, v2, Lru/mail/libverify/accounts/e;->h:Z
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    :cond_5
    :goto_4
    :try_start_3
    invoke-virtual {v1, v2}, Lru/mail/libverify/accounts/d;->add(Ljava/lang/Object;)Z
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    :cond_6
    :goto_5
    :try_start_4
    const-string/jumbo v0, "SimCardReader"

    const-string/jumbo v2, "readData completed %s"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-virtual {v1}, Lru/mail/libverify/accounts/d;->toString()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v0, v2, v3}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2

    :goto_6
    move-object v0, v1

    goto/16 :goto_1

    :cond_7
    move v4, v3

    goto/16 :goto_2

    :cond_8
    move v2, v3

    goto/16 :goto_3

    :catch_0
    move-exception v0

    :try_start_5
    const-string/jumbo v0, "SimCardReader"

    const-string/jumbo v3, "failed to read sim operator"

    invoke-static {v0, v3}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_1

    goto :goto_4

    :catch_1
    move-exception v0

    :try_start_6
    const-string/jumbo v2, "SimCardReader"

    const-string/jumbo v3, "readData about the second sim card failed"

    invoke-static {v2, v3, v0}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_2

    goto :goto_5

    :catch_2
    move-exception v0

    const-string/jumbo v2, "SimCardReader"

    const-string/jumbo v3, "readData failed to read sim card data items"

    invoke-static {v2, v3, v0}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_6
.end method

.method private static a(I)Z
    .locals 1

    const/4 v0, 0x5

    if-ne p0, v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static b(I)Ljava/lang/String;
    .locals 1

    packed-switch p0, :pswitch_data_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :pswitch_0
    const-string/jumbo v0, "unknown"

    goto :goto_0

    :pswitch_1
    const-string/jumbo v0, "absent"

    goto :goto_0

    :pswitch_2
    const-string/jumbo v0, "pin_required"

    goto :goto_0

    :pswitch_3
    const-string/jumbo v0, "puk_required"

    goto :goto_0

    :pswitch_4
    const-string/jumbo v0, "network_locked"

    goto :goto_0

    :pswitch_5
    const-string/jumbo v0, "ready"

    goto :goto_0

    :pswitch_6
    const-string/jumbo v0, "not_ready"

    goto :goto_0

    :pswitch_7
    const-string/jumbo v0, "perm_disabled"

    goto :goto_0

    :pswitch_8
    const-string/jumbo v0, "card_io_error"

    goto :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_8
    .end packed-switch
.end method
