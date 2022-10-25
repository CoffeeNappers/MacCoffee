.class public Lru/mail/libverify/ipc/IpcMessageService;
.super Landroid/app/Service;


# instance fields
.field private a:Lru/mail/libverify/ipc/i;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    return-void
.end method


# virtual methods
.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 5

    const-string/jumbo v0, "IpcMessageService"

    const-string/jumbo v1, "onBind from initiator %s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    const-string/jumbo v4, "bind_initiator"

    invoke-virtual {p1, v4}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v0, v1, v2}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-static {p0}, Lru/mail/libverify/api/VerificationFactory;->hasInstallation(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string/jumbo v0, "IpcMessageService"

    const-string/jumbo v1, "libverify isn\'t initialized for this application"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lru/mail/libverify/ipc/IpcMessageService;->a:Lru/mail/libverify/ipc/i;

    if-nez v0, :cond_1

    new-instance v0, Lru/mail/libverify/ipc/i;

    invoke-static {p0}, Lru/mail/libverify/api/k;->b(Landroid/content/Context;)Lru/mail/libverify/api/l;

    move-result-object v1

    invoke-direct {v0, v1}, Lru/mail/libverify/ipc/i;-><init>(Lru/mail/libverify/api/l;)V

    iput-object v0, p0, Lru/mail/libverify/ipc/IpcMessageService;->a:Lru/mail/libverify/ipc/i;

    :cond_1
    iget-object v0, p0, Lru/mail/libverify/ipc/IpcMessageService;->a:Lru/mail/libverify/ipc/i;

    invoke-virtual {v0}, Lru/mail/libverify/ipc/i;->a()Landroid/os/Messenger;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/Messenger;->getBinder()Landroid/os/IBinder;

    move-result-object v0

    goto :goto_0
.end method

.method public onDestroy()V
    .locals 2

    const-string/jumbo v0, "IpcMessageService"

    const-string/jumbo v1, "onDestroy"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;)V

    invoke-super {p0}, Landroid/app/Service;->onDestroy()V

    return-void
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .locals 2

    const-string/jumbo v0, "IpcMessageService"

    const-string/jumbo v1, "onStartCommand"

    invoke-static {v0, v1}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;)V

    invoke-super {p0, p1, p2, p3}, Landroid/app/Service;->onStartCommand(Landroid/content/Intent;II)I

    move-result v0

    return v0
.end method
