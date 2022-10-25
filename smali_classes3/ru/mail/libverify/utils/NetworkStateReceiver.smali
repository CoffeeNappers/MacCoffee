.class public Lru/mail/libverify/utils/NetworkStateReceiver;
.super Landroid/content/BroadcastReceiver;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 3

    if-eqz p1, :cond_0

    if-eqz p2, :cond_0

    :try_start_0
    const-string/jumbo v0, "OldNetworkStateReceiver"

    const-string/jumbo v1, "pass an intent to a new receiver"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v0, Lru/mail/libverify/utils/network/NetworkStateReceiver;

    invoke-direct {v0}, Lru/mail/libverify/utils/network/NetworkStateReceiver;-><init>()V

    invoke-virtual {v0, p1, p2}, Lru/mail/libverify/utils/network/NetworkStateReceiver;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    :goto_0
    return-void

    :catch_0
    move-exception v0

    const-string/jumbo v1, "OldNetworkStateReceiver"

    const-string/jumbo v2, "an error raised during an old request processing"

    invoke-static {v1, v2, v0}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method
