.class public Lru/mail/libverify/gcm/GcmInstanceIDListenerService;
.super Lcom/google/android/gms/iid/InstanceIDListenerService;


# instance fields
.field private final a:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/google/android/gms/iid/InstanceIDListenerService;-><init>()V

    const-string/jumbo v0, "GcmIDService"

    iput-object v0, p0, Lru/mail/libverify/gcm/GcmInstanceIDListenerService;->a:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public onDestroy()V
    .locals 2

    invoke-super {p0}, Lcom/google/android/gms/iid/InstanceIDListenerService;->onDestroy()V

    const-string/jumbo v0, "GcmIDService"

    const-string/jumbo v1, "service destroyed"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .locals 2

    const-string/jumbo v0, "GcmIDService"

    const-string/jumbo v1, "onStartCommand"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;)V

    invoke-super {p0, p1, p2, p3}, Lcom/google/android/gms/iid/InstanceIDListenerService;->onStartCommand(Landroid/content/Intent;II)I

    move-result v0

    return v0
.end method

.method public onTokenRefresh()V
    .locals 2

    invoke-super {p0}, Lcom/google/android/gms/iid/InstanceIDListenerService;->onTokenRefresh()V

    invoke-static {p0}, Lru/mail/libverify/api/VerificationFactory;->hasInstallation(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string/jumbo v0, "GcmIDService"

    const-string/jumbo v1, "token refreshed, but no libverify installation found"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->b(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void

    :cond_0
    const-string/jumbo v0, "GcmIDService"

    const-string/jumbo v1, "token refresh"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {p0}, Lru/mail/libverify/gcm/GcmRegisterService;->a(Landroid/content/Context;)V

    goto :goto_0
.end method
