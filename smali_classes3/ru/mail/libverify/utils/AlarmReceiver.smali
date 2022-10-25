.class public Lru/mail/libverify/utils/AlarmReceiver;
.super Landroid/content/BroadcastReceiver;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method private static a(Landroid/content/Context;Ljava/lang/String;)Landroid/app/PendingIntent;
    .locals 3
    .param p0    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    new-instance v0, Landroid/content/Intent;

    const-class v1, Lru/mail/libverify/utils/AlarmReceiver;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string/jumbo v1, "package_changed"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    const-string/jumbo v1, "package_change_type"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const/4 v1, 0x0

    const/high16 v2, 0x8000000

    invoke-static {p0, v1, v0, v2}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v0

    return-object v0
.end method

.method public static a(Landroid/content/Context;)V
    .locals 3
    .param p0    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const/4 v2, 0x1

    invoke-static {p0}, Lru/mail/libverify/utils/AlarmReceiver;->g(Landroid/content/Context;)Landroid/app/PendingIntent;

    move-result-object v0

    const v1, 0xa4cb800

    invoke-static {p0, v0, v1, v2, v2}, Lru/mail/libverify/utils/AlarmReceiver;->a(Landroid/content/Context;Landroid/app/PendingIntent;IZZ)V

    return-void
.end method

.method public static a(Landroid/content/Context;I)V
    .locals 2
    .param p0    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const/4 v1, 0x1

    invoke-static {p0}, Lru/mail/libverify/utils/AlarmReceiver;->h(Landroid/content/Context;)Landroid/app/PendingIntent;

    move-result-object v0

    invoke-static {p0, v0, p1, v1, v1}, Lru/mail/libverify/utils/AlarmReceiver;->a(Landroid/content/Context;Landroid/app/PendingIntent;IZZ)V

    return-void
.end method

.method private static a(Landroid/content/Context;Landroid/app/PendingIntent;IZZ)V
    .locals 7
    .param p0    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Landroid/app/PendingIntent;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    :try_start_0
    const-string/jumbo v0, "AlarmReceiver"

    const-string/jumbo v1, "set up alarm %s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    invoke-static {v0, v1, v2}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    const-string/jumbo v0, "alarm"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AlarmManager;

    invoke-virtual {v0, p1}, Landroid/app/AlarmManager;->cancel(Landroid/app/PendingIntent;)V

    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v2

    const/16 v3, 0xe

    if-eqz p3, :cond_0

    new-instance v1, Ljava/util/Random;

    invoke-direct {v1}, Ljava/util/Random;-><init>()V

    div-int/lit8 v4, p2, 0x2

    invoke-virtual {v1, v4}, Ljava/util/Random;->nextInt(I)I

    move-result v1

    div-int/lit8 v4, p2, 0x2

    add-int/2addr v1, v4

    :goto_0
    invoke-virtual {v2, v3, v1}, Ljava/util/Calendar;->add(II)V

    if-eqz p4, :cond_1

    const/4 v1, 0x1

    invoke-virtual {v2}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v2

    int-to-long v4, p2

    move-object v6, p1

    invoke-virtual/range {v0 .. v6}, Landroid/app/AlarmManager;->setInexactRepeating(IJJLandroid/app/PendingIntent;)V

    :goto_1
    return-void

    :cond_0
    move v1, p2

    goto :goto_0

    :cond_1
    const/4 v1, 0x1

    invoke-virtual {v2}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v2

    invoke-virtual {v0, v1, v2, v3, p1}, Landroid/app/AlarmManager;->set(IJLandroid/app/PendingIntent;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    const-string/jumbo v1, "AlarmReceiver"

    const-string/jumbo v2, "error in setup an alarm logic"

    invoke-static {v1, v2, v0}, Lru/mail/libverify/utils/c;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1
.end method

.method public static a(Landroid/content/Context;Ljava/lang/String;I)V
    .locals 3
    .param p0    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const/4 v2, 0x0

    new-instance v0, Landroid/content/Intent;

    const-class v1, Lru/mail/libverify/utils/AlarmReceiver;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string/jumbo v1, "unblock_notification"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    const-string/jumbo v1, "notification_id"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    invoke-static {p0, v2, v0, v2}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v0

    invoke-static {p0, v0, p2, v2, v2}, Lru/mail/libverify/utils/AlarmReceiver;->a(Landroid/content/Context;Landroid/app/PendingIntent;IZZ)V

    return-void
.end method

.method public static b(Landroid/content/Context;)V
    .locals 4
    .param p0    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const/4 v3, 0x0

    new-instance v0, Landroid/content/Intent;

    const-class v1, Lru/mail/libverify/utils/AlarmReceiver;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string/jumbo v1, "refresh_push_token_once"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    invoke-static {p0, v3, v0, v3}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v0

    const/16 v1, 0x7530

    const/4 v2, 0x1

    invoke-static {p0, v0, v1, v2, v3}, Lru/mail/libverify/utils/AlarmReceiver;->a(Landroid/content/Context;Landroid/app/PendingIntent;IZZ)V

    return-void
.end method

.method public static c(Landroid/content/Context;)V
    .locals 4
    .param p0    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const/4 v3, 0x0

    new-instance v0, Landroid/content/Intent;

    const-class v1, Lru/mail/libverify/utils/AlarmReceiver;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string/jumbo v1, "app_started"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    invoke-static {p0, v3, v0, v3}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v0

    const v1, 0x927c0

    const/4 v2, 0x1

    invoke-static {p0, v0, v1, v2, v3}, Lru/mail/libverify/utils/AlarmReceiver;->a(Landroid/content/Context;Landroid/app/PendingIntent;IZZ)V

    return-void
.end method

.method public static d(Landroid/content/Context;)V
    .locals 3
    .param p0    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const/4 v2, 0x0

    const-string/jumbo v0, "package_change_removed"

    invoke-static {p0, v0}, Lru/mail/libverify/utils/AlarmReceiver;->a(Landroid/content/Context;Ljava/lang/String;)Landroid/app/PendingIntent;

    move-result-object v0

    const v1, 0x36ee80

    invoke-static {p0, v0, v1, v2, v2}, Lru/mail/libverify/utils/AlarmReceiver;->a(Landroid/content/Context;Landroid/app/PendingIntent;IZZ)V

    return-void
.end method

.method public static e(Landroid/content/Context;)V
    .locals 4
    .param p0    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const/4 v3, 0x0

    new-instance v0, Landroid/content/Intent;

    const-class v1, Lru/mail/libverify/utils/AlarmReceiver;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string/jumbo v1, "check_sms_templates"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    invoke-static {p0, v3, v0, v3}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v0

    const v1, 0x493e0

    const/4 v2, 0x1

    invoke-static {p0, v0, v1, v2, v3}, Lru/mail/libverify/utils/AlarmReceiver;->a(Landroid/content/Context;Landroid/app/PendingIntent;IZZ)V

    return-void
.end method

.method public static f(Landroid/content/Context;)V
    .locals 3
    .param p0    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const/4 v2, 0x0

    const-string/jumbo v0, "package_change_updated"

    invoke-static {p0, v0}, Lru/mail/libverify/utils/AlarmReceiver;->a(Landroid/content/Context;Ljava/lang/String;)Landroid/app/PendingIntent;

    move-result-object v0

    const v1, 0x36ee80

    invoke-static {p0, v0, v1, v2, v2}, Lru/mail/libverify/utils/AlarmReceiver;->a(Landroid/content/Context;Landroid/app/PendingIntent;IZZ)V

    return-void
.end method

.method private static g(Landroid/content/Context;)Landroid/app/PendingIntent;
    .locals 3
    .param p0    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const/4 v2, 0x0

    new-instance v0, Landroid/content/Intent;

    const-class v1, Lru/mail/libverify/utils/AlarmReceiver;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string/jumbo v1, "refresh_push_token"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    invoke-static {p0, v2, v0, v2}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v0

    return-object v0
.end method

.method private static h(Landroid/content/Context;)Landroid/app/PendingIntent;
    .locals 3
    .param p0    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const/4 v2, 0x0

    new-instance v0, Landroid/content/Intent;

    const-class v1, Lru/mail/libverify/utils/AlarmReceiver;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string/jumbo v1, "check_settings"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    invoke-static {p0, v2, v0, v2}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 5

    const/4 v2, 0x1

    const/4 v0, 0x0

    const/4 v1, -0x1

    if-nez p2, :cond_0

    :goto_0
    return-void

    :cond_0
    invoke-static {p1}, Lru/mail/libverify/api/VerificationFactory;->hasInstallation(Landroid/content/Context;)Z

    move-result v3

    if-nez v3, :cond_1

    const-string/jumbo v0, "alarm"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AlarmManager;

    invoke-static {p1}, Lru/mail/libverify/utils/AlarmReceiver;->g(Landroid/content/Context;)Landroid/app/PendingIntent;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlarmManager;->cancel(Landroid/app/PendingIntent;)V

    const-string/jumbo v0, "alarm"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AlarmManager;

    invoke-static {p1}, Lru/mail/libverify/utils/AlarmReceiver;->h(Landroid/content/Context;)Landroid/app/PendingIntent;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlarmManager;->cancel(Landroid/app/PendingIntent;)V

    goto :goto_0

    :cond_1
    new-instance v3, Ljava/lang/StringBuilder;

    const-string/jumbo v4, "received action "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v4

    sparse-switch v4, :sswitch_data_0

    :cond_2
    move v3, v1

    :goto_1
    packed-switch v3, :pswitch_data_0

    const-string/jumbo v0, "AlarmReceiver"

    const-string/jumbo v1, "failed to process broadcast"

    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v3, "unknown action"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    invoke-static {v0, v1, v2}, Lru/mail/libverify/utils/c;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    :sswitch_0
    const-string/jumbo v4, "refresh_push_token_once"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    move v3, v0

    goto :goto_1

    :sswitch_1
    const-string/jumbo v4, "refresh_push_token"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    move v3, v2

    goto :goto_1

    :sswitch_2
    const-string/jumbo v4, "check_settings"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    const/4 v3, 0x2

    goto :goto_1

    :sswitch_3
    const-string/jumbo v4, "check_sms_templates"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    const/4 v3, 0x3

    goto :goto_1

    :sswitch_4
    const-string/jumbo v4, "package_changed"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    const/4 v3, 0x4

    goto :goto_1

    :sswitch_5
    const-string/jumbo v4, "unblock_notification"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    const/4 v3, 0x5

    goto :goto_1

    :sswitch_6
    const-string/jumbo v4, "app_started"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    const/4 v3, 0x6

    goto :goto_1

    :pswitch_0
    invoke-static {p1}, Lru/mail/libverify/gcm/GcmRegisterService;->a(Landroid/content/Context;)V

    goto/16 :goto_0

    :pswitch_1
    invoke-static {p1}, Lru/mail/libverify/utils/SettingsCheckService;->c(Landroid/content/Context;)V

    goto/16 :goto_0

    :pswitch_2
    invoke-static {p1}, Lru/mail/libverify/utils/SettingsCheckService;->e(Landroid/content/Context;)V

    goto/16 :goto_0

    :pswitch_3
    const-string/jumbo v3, "package_change_type"

    invoke-virtual {p2, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v4

    sparse-switch v4, :sswitch_data_1

    :cond_3
    move v0, v1

    :goto_2
    packed-switch v0, :pswitch_data_1

    const-string/jumbo v0, "AlarmReceiver"

    const-string/jumbo v1, "failed to process broadcast"

    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v3, "unknown change type"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    invoke-static {v0, v1, v2}, Lru/mail/libverify/utils/c;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_0

    :sswitch_7
    const-string/jumbo v2, "package_change_removed"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    goto :goto_2

    :sswitch_8
    const-string/jumbo v0, "package_change_updated"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    move v0, v2

    goto :goto_2

    :pswitch_4
    invoke-static {p1}, Lru/mail/libverify/utils/SettingsCheckService;->b(Landroid/content/Context;)V

    goto/16 :goto_0

    :pswitch_5
    invoke-static {p1}, Lru/mail/libverify/utils/SettingsCheckService;->a(Landroid/content/Context;)V

    goto/16 :goto_0

    :pswitch_6
    const-string/jumbo v0, "notification_id"

    invoke-virtual {p2, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lru/mail/libverify/utils/SettingsCheckService;->a(Landroid/content/Context;Ljava/lang/String;)V

    goto/16 :goto_0

    :pswitch_7
    invoke-static {p1}, Lru/mail/libverify/utils/SettingsCheckService;->f(Landroid/content/Context;)V

    goto/16 :goto_0

    :sswitch_data_0
    .sparse-switch
        0x1f95b5b6 -> :sswitch_5
        0x3e33a8dc -> :sswitch_3
        0x4434b063 -> :sswitch_6
        0x44c297bb -> :sswitch_4
        0x4a0c55e8 -> :sswitch_0
        0x5121317a -> :sswitch_2
        0x55ff8c78 -> :sswitch_1
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_6
        :pswitch_7
    .end packed-switch

    :sswitch_data_1
    .sparse-switch
        -0x256dafbb -> :sswitch_8
        0x299f87ea -> :sswitch_7
    .end sparse-switch

    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_4
        :pswitch_5
    .end packed-switch
.end method
