.class public Lru/mail/libverify/utils/SettingsCheckService;
.super Landroid/app/IntentService;


# direct methods
.method public constructor <init>()V
    .locals 1

    const-string/jumbo v0, "SettingsCheckService"

    invoke-direct {p0, v0}, Landroid/app/IntentService;-><init>(Ljava/lang/String;)V

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lru/mail/libverify/utils/SettingsCheckService;->setIntentRedelivery(Z)V

    return-void
.end method

.method static a(Landroid/content/Context;)V
    .locals 2
    .param p0    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const/4 v1, 0x0

    const-string/jumbo v0, "package_updated"

    invoke-static {p0, v0, v1, v1}, Lru/mail/libverify/utils/SettingsCheckService;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static a(Landroid/content/Context;Ljava/lang/String;)V
    .locals 2
    .param p0    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const-string/jumbo v0, "unblock_notification"

    const-string/jumbo v1, "notification_id"

    invoke-static {p0, v0, v1, p1}, Lru/mail/libverify/utils/SettingsCheckService;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private static a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p0    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    const-string/jumbo v0, "SettingsCheckService"

    const-string/jumbo v1, "start settings checking action %s (param : %s, value : %s)"

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    const/4 v3, 0x1

    aput-object p2, v2, v3

    const/4 v3, 0x2

    aput-object p3, v2, v3

    invoke-static {v0, v1, v2}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    new-instance v0, Landroid/content/Intent;

    const-class v1, Lru/mail/libverify/utils/SettingsCheckService;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v0, p1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    invoke-virtual {v0, p2, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    :cond_0
    :try_start_0
    invoke-virtual {p0, v0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    const-string/jumbo v1, "SettingsCheckService"

    const-string/jumbo v2, "failed to start settings service"

    invoke-static {v1, v2, v0}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method static a(Landroid/content/Context;Z)V
    .locals 3
    .param p0    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const-string/jumbo v0, "battery_check"

    const-string/jumbo v1, "battery_level"

    invoke-static {p1}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v2

    invoke-static {p0, v0, v1, v2}, Lru/mail/libverify/utils/SettingsCheckService;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static b(Landroid/content/Context;)V
    .locals 2
    .param p0    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const/4 v1, 0x0

    const-string/jumbo v0, "package_removed"

    invoke-static {p0, v0, v1, v1}, Lru/mail/libverify/utils/SettingsCheckService;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static c(Landroid/content/Context;)V
    .locals 2
    .param p0    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const/4 v1, 0x0

    const-string/jumbo v0, "timer_check"

    invoke-static {p0, v0, v1, v1}, Lru/mail/libverify/utils/SettingsCheckService;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static d(Landroid/content/Context;)V
    .locals 2
    .param p0    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const/4 v1, 0x0

    const-string/jumbo v0, "restart_check"

    invoke-static {p0, v0, v1, v1}, Lru/mail/libverify/utils/SettingsCheckService;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static e(Landroid/content/Context;)V
    .locals 2
    .param p0    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const/4 v1, 0x0

    const-string/jumbo v0, "sms_templates_check"

    invoke-static {p0, v0, v1, v1}, Lru/mail/libverify/utils/SettingsCheckService;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static f(Landroid/content/Context;)V
    .locals 2
    .param p0    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const/4 v1, 0x0

    const-string/jumbo v0, "app_started"

    invoke-static {p0, v0, v1, v1}, Lru/mail/libverify/utils/SettingsCheckService;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public onDestroy()V
    .locals 2

    const-string/jumbo v0, "SettingsCheckService"

    const-string/jumbo v1, "service destroyed"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;)V

    invoke-super {p0}, Landroid/app/IntentService;->onDestroy()V

    return-void
.end method

.method protected onHandleIntent(Landroid/content/Intent;)V
    .locals 6

    const/4 v2, 0x1

    const/4 v0, 0x0

    const/4 v1, -0x1

    invoke-static {p0}, Lru/mail/libverify/api/VerificationFactory;->hasInstallation(Landroid/content/Context;)Z

    move-result v3

    if-eqz v3, :cond_0

    if-nez p1, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    :try_start_0
    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v4

    sparse-switch v4, :sswitch_data_0

    :cond_2
    move v3, v1

    :goto_1
    packed-switch v3, :pswitch_data_0

    invoke-static {p0}, Lru/mail/libverify/api/k;->d(Landroid/content/Context;)Lru/mail/libverify/api/aa;

    move-result-object v3

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->hashCode()I

    move-result v5

    sparse-switch v5, :sswitch_data_1

    :cond_3
    move v0, v1

    :goto_2
    packed-switch v0, :pswitch_data_1

    const-string/jumbo v0, "SettingsCheckService"

    const-string/jumbo v1, "failed to process action"

    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v4, "unknown intent action"

    invoke-direct {v2, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    invoke-static {v0, v1, v2}, Lru/mail/libverify/utils/c;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    sget-object v0, Lru/mail/libverify/api/aa$a;->UNKNOWN:Lru/mail/libverify/api/aa$a;

    :goto_3
    invoke-interface {v3, v0}, Lru/mail/libverify/api/aa;->a(Lru/mail/libverify/api/aa$a;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string/jumbo v1, "SettingsCheckService"

    const-string/jumbo v2, "failed to process intent"

    invoke-static {v1, v2, v0}, Lru/mail/libverify/utils/c;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    :sswitch_0
    :try_start_1
    const-string/jumbo v4, "battery_check"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    move v3, v0

    goto :goto_1

    :sswitch_1
    const-string/jumbo v4, "unblock_notification"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    move v3, v2

    goto :goto_1

    :pswitch_0
    invoke-static {p0}, Lru/mail/libverify/api/k;->d(Landroid/content/Context;)Lru/mail/libverify/api/aa;

    move-result-object v0

    const-string/jumbo v1, "battery_level"

    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v1

    invoke-interface {v0, v1}, Lru/mail/libverify/api/aa;->b(Z)V

    goto :goto_0

    :pswitch_1
    invoke-static {p0}, Lru/mail/libverify/api/k;->d(Landroid/content/Context;)Lru/mail/libverify/api/aa;

    move-result-object v0

    const-string/jumbo v1, "notification_id"

    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lru/mail/libverify/api/aa;->h(Ljava/lang/String;)V

    goto :goto_0

    :sswitch_2
    const-string/jumbo v2, "package_updated"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    goto :goto_2

    :sswitch_3
    const-string/jumbo v0, "package_removed"

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    move v0, v2

    goto :goto_2

    :sswitch_4
    const-string/jumbo v0, "timer_check"

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    const/4 v0, 0x2

    goto :goto_2

    :sswitch_5
    const-string/jumbo v0, "app_started"

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    const/4 v0, 0x3

    goto/16 :goto_2

    :sswitch_6
    const-string/jumbo v0, "restart_check"

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    const/4 v0, 0x4

    goto/16 :goto_2

    :sswitch_7
    const-string/jumbo v0, "sms_templates_check"

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    const/4 v0, 0x5

    goto/16 :goto_2

    :pswitch_2
    sget-object v0, Lru/mail/libverify/api/aa$a;->PACKAGE_UPDATED:Lru/mail/libverify/api/aa$a;

    goto/16 :goto_3

    :pswitch_3
    sget-object v0, Lru/mail/libverify/api/aa$a;->PACKAGE_REMOVED:Lru/mail/libverify/api/aa$a;

    goto/16 :goto_3

    :pswitch_4
    sget-object v0, Lru/mail/libverify/api/aa$a;->TIMER:Lru/mail/libverify/api/aa$a;

    goto/16 :goto_3

    :pswitch_5
    sget-object v0, Lru/mail/libverify/api/aa$a;->RESTART:Lru/mail/libverify/api/aa$a;

    goto/16 :goto_3

    :pswitch_6
    sget-object v0, Lru/mail/libverify/api/aa$a;->SMS_TEMPLATES_CHECK:Lru/mail/libverify/api/aa$a;
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_3

    :sswitch_data_0
    .sparse-switch
        -0x34c787aa -> :sswitch_0
        0x1f95b5b6 -> :sswitch_1
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch

    :sswitch_data_1
    .sparse-switch
        -0x4324c264 -> :sswitch_7
        -0x1c462128 -> :sswitch_6
        -0x2fef872 -> :sswitch_4
        0xabe15c2 -> :sswitch_2
        0x4434b063 -> :sswitch_5
        0x59cb4d67 -> :sswitch_3
    .end sparse-switch

    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_5
        :pswitch_6
    .end packed-switch
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .locals 2

    const-string/jumbo v0, "SettingsCheckService"

    const-string/jumbo v1, "onStartCommand"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;)V

    invoke-super {p0, p1, p2, p3}, Landroid/app/IntentService;->onStartCommand(Landroid/content/Intent;II)I

    move-result v0

    return v0
.end method
