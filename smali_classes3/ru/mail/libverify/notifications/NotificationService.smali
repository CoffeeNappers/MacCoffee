.class public Lru/mail/libverify/notifications/NotificationService;
.super Landroid/app/IntentService;


# direct methods
.method public constructor <init>()V
    .locals 1

    const-string/jumbo v0, "NotificationService"

    invoke-direct {p0, v0}, Landroid/app/IntentService;-><init>(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public onDestroy()V
    .locals 2

    invoke-super {p0}, Landroid/app/IntentService;->onDestroy()V

    const-string/jumbo v0, "NotificationService"

    const-string/jumbo v1, "service destroyed"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method protected onHandleIntent(Landroid/content/Intent;)V
    .locals 8

    const/4 v3, 0x2

    const/4 v2, 0x1

    const/4 v1, 0x0

    if-nez p1, :cond_0

    :goto_0
    return-void

    :cond_0
    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string/jumbo v0, "NotificationService"

    const-string/jumbo v1, "Wrong action type detected"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    const-string/jumbo v0, "notification_id"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string/jumbo v0, "NotificationService"

    const-string/jumbo v6, "received extra %s from notification %s"

    new-array v7, v3, [Ljava/lang/Object;

    aput-object v4, v7, v1

    aput-object v5, v7, v2

    invoke-static {v0, v6, v7}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    const/4 v0, -0x1

    invoke-virtual {v4}, Ljava/lang/String;->hashCode()I

    move-result v6

    sparse-switch v6, :sswitch_data_0

    :cond_2
    :goto_1
    packed-switch v0, :pswitch_data_0

    const-string/jumbo v0, "NotificationService"

    const-string/jumbo v3, "wrong action type"

    new-instance v5, Ljava/lang/IllegalArgumentException;

    sget-object v6, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string/jumbo v7, "Wrong action type %s for NotificationService detected"

    new-array v2, v2, [Ljava/lang/Object;

    aput-object v4, v2, v1

    invoke-static {v6, v7, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v5, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    invoke-static {v0, v3, v5}, Lru/mail/libverify/utils/c;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    :sswitch_0
    const-string/jumbo v3, "action_delete"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    move v0, v1

    goto :goto_1

    :sswitch_1
    const-string/jumbo v3, "action_cancel"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    move v0, v2

    goto :goto_1

    :sswitch_2
    const-string/jumbo v6, "action_confirm"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    move v0, v3

    goto :goto_1

    :pswitch_0
    invoke-static {p0}, Lru/mail/libverify/api/k;->f(Landroid/content/Context;)Lru/mail/libverify/api/o;

    move-result-object v0

    invoke-interface {v0, v5}, Lru/mail/libverify/api/o;->g(Ljava/lang/String;)V

    goto :goto_0

    :pswitch_1
    invoke-static {p0}, Lru/mail/libverify/api/k;->f(Landroid/content/Context;)Lru/mail/libverify/api/o;

    move-result-object v0

    invoke-interface {v0, v5}, Lru/mail/libverify/api/o;->f(Ljava/lang/String;)V

    goto/16 :goto_0

    nop

    :sswitch_data_0
    .sparse-switch
        -0x397e8a49 -> :sswitch_2
        0x3f7064a3 -> :sswitch_1
        0x415cbbd4 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
