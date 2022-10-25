.class public Lru/mail/libverify/gcm/GcmMessageHandlerService;
.super Lcom/google/android/gms/gcm/GcmListenerService;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/gcm/GcmListenerService;-><init>()V

    return-void
.end method

.method static a(Landroid/content/Context;Ljava/lang/String;Landroid/os/Bundle;)V
    .locals 7
    .param p0    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    if-nez p2, :cond_1

    :cond_0
    const-string/jumbo v0, "GcmHandlerService"

    const-string/jumbo v1, "wrong message received (either \'from\' or \'data\' is empty)"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void

    :cond_1
    const-string/jumbo v0, "297109036349"

    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    const-string/jumbo v0, "GcmHandlerService"

    const-string/jumbo v1, "wrong message received (sender id %s is not equal to required sender id %s)"

    new-array v2, v6, [Ljava/lang/Object;

    aput-object p1, v2, v4

    const-string/jumbo v3, "297109036349"

    aput-object v3, v2, v5

    invoke-static {v0, v1, v2}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_0

    :cond_2
    const-string/jumbo v0, "server_info"

    invoke-virtual {p2, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_3

    :try_start_0
    invoke-static {p0}, Lru/mail/libverify/api/k;->a(Landroid/content/Context;)Lru/mail/libverify/api/j;

    move-result-object v1

    invoke-interface {v1, v0}, Lru/mail/libverify/api/j;->b(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :cond_3
    :goto_1
    const-string/jumbo v0, "fetcher_info"

    invoke-virtual {p2, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_4

    :try_start_1
    invoke-static {p0}, Lru/mail/libverify/api/k;->a(Landroid/content/Context;)Lru/mail/libverify/api/j;

    move-result-object v1

    invoke-interface {v1, v0}, Lru/mail/libverify/api/j;->c(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    :cond_4
    :goto_2
    const-string/jumbo v0, "data"

    invoke-virtual {p2, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_5

    const-string/jumbo v0, "GcmHandlerService"

    const-string/jumbo v1, "wrong message received (message data is empty)"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :catch_0
    move-exception v0

    const-string/jumbo v1, "GcmHandlerService"

    const-string/jumbo v2, "handle server info error"

    new-array v3, v4, [Ljava/lang/Object;

    invoke-static {v1, v0, v2, v3}, Lru/mail/libverify/utils/c;->a(Ljava/lang/String;Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_1

    :catch_1
    move-exception v0

    const-string/jumbo v1, "GcmHandlerService"

    const-string/jumbo v2, "handle fetcher info error"

    new-array v3, v4, [Ljava/lang/Object;

    invoke-static {v1, v0, v2, v3}, Lru/mail/libverify/utils/c;->a(Ljava/lang/String;Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_2

    :cond_5
    const-string/jumbo v1, "GcmHandlerService"

    const-string/jumbo v2, "message received from %s with text %s"

    new-array v3, v6, [Ljava/lang/Object;

    aput-object p1, v3, v4

    aput-object v0, v3, v5

    invoke-static {v1, v2, v3}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    :try_start_2
    invoke-static {p0}, Lru/mail/libverify/api/k;->a(Landroid/content/Context;)Lru/mail/libverify/api/j;

    move-result-object v1

    invoke-interface {v1, v0}, Lru/mail/libverify/api/j;->a(Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_2

    goto/16 :goto_0

    :catch_2
    move-exception v0

    const-string/jumbo v1, "GcmHandlerService"

    const-string/jumbo v2, "handle message error"

    new-array v3, v4, [Ljava/lang/Object;

    invoke-static {v1, v0, v2, v3}, Lru/mail/libverify/utils/c;->a(Ljava/lang/String;Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    goto/16 :goto_0
.end method


# virtual methods
.method public onDeletedMessages()V
    .locals 2

    invoke-super {p0}, Lcom/google/android/gms/gcm/GcmListenerService;->onDeletedMessages()V

    const-string/jumbo v0, "GcmHandlerService"

    const-string/jumbo v1, "messages deleted"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public onDestroy()V
    .locals 2

    invoke-super {p0}, Lcom/google/android/gms/gcm/GcmListenerService;->onDestroy()V

    const-string/jumbo v0, "GcmHandlerService"

    const-string/jumbo v1, "service destroyed"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public onMessageReceived(Ljava/lang/String;Landroid/os/Bundle;)V
    .locals 0

    invoke-super {p0, p1, p2}, Lcom/google/android/gms/gcm/GcmListenerService;->onMessageReceived(Ljava/lang/String;Landroid/os/Bundle;)V

    invoke-static {p0, p1, p2}, Lru/mail/libverify/gcm/GcmMessageHandlerService;->a(Landroid/content/Context;Ljava/lang/String;Landroid/os/Bundle;)V

    return-void
.end method

.method public onMessageSent(Ljava/lang/String;)V
    .locals 4

    invoke-super {p0, p1}, Lcom/google/android/gms/gcm/GcmListenerService;->onMessageSent(Ljava/lang/String;)V

    const-string/jumbo v0, "GcmHandlerService"

    const-string/jumbo v1, "message sent msgid %s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    invoke-static {v0, v1, v2}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method

.method public onSendError(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4

    invoke-super {p0, p1, p2}, Lcom/google/android/gms/gcm/GcmListenerService;->onSendError(Ljava/lang/String;Ljava/lang/String;)V

    const-string/jumbo v0, "GcmHandlerService"

    const-string/jumbo v1, "send error msgid %s : %s"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    const/4 v3, 0x1

    aput-object p2, v2, v3

    invoke-static {v0, v1, v2}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method
