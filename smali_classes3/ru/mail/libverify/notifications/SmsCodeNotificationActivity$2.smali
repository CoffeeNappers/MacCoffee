.class final Lru/mail/libverify/notifications/SmsCodeNotificationActivity$2;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lru/mail/libverify/notifications/SmsCodeNotificationActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lru/mail/libverify/notifications/SmsCodeNotificationActivity;


# direct methods
.method constructor <init>(Lru/mail/libverify/notifications/SmsCodeNotificationActivity;)V
    .locals 0

    iput-object p1, p0, Lru/mail/libverify/notifications/SmsCodeNotificationActivity$2;->a:Lru/mail/libverify/notifications/SmsCodeNotificationActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .locals 4

    :try_start_0
    iget-object v0, p0, Lru/mail/libverify/notifications/SmsCodeNotificationActivity$2;->a:Lru/mail/libverify/notifications/SmsCodeNotificationActivity;

    iget-object v1, p0, Lru/mail/libverify/notifications/SmsCodeNotificationActivity$2;->a:Lru/mail/libverify/notifications/SmsCodeNotificationActivity;

    invoke-static {v1}, Lru/mail/libverify/notifications/SmsCodeNotificationActivity;->a(Lru/mail/libverify/notifications/SmsCodeNotificationActivity;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lru/mail/libverify/notifications/e$b;

    const-string/jumbo v3, "action_cancel"

    invoke-direct {v2, v0, v3}, Lru/mail/libverify/notifications/e$b;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    const-string/jumbo v0, "notification_id"

    invoke-virtual {v2, v0, v1}, Lru/mail/libverify/notifications/e$b;->a(Ljava/lang/String;Ljava/lang/String;)Lru/mail/libverify/notifications/e$a;

    move-result-object v0

    invoke-virtual {v0}, Lru/mail/libverify/notifications/e$a;->a()Landroid/app/PendingIntent;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/PendingIntent;->send()V
    :try_end_0
    .catch Landroid/app/PendingIntent$CanceledException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    iget-object v0, p0, Lru/mail/libverify/notifications/SmsCodeNotificationActivity$2;->a:Lru/mail/libverify/notifications/SmsCodeNotificationActivity;

    invoke-virtual {v0}, Lru/mail/libverify/notifications/SmsCodeNotificationActivity;->finish()V

    return-void

    :catch_0
    move-exception v0

    const-string/jumbo v1, "SmsCodeActivity"

    const-string/jumbo v2, "failed to confirm notification"

    invoke-static {v1, v2, v0}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method
