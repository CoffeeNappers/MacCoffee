.class abstract Lru/mail/libverify/ipc/a;
.super Landroid/os/Handler;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lru/mail/libverify/ipc/a$a;
    }
.end annotation


# instance fields
.field protected final a:Lru/mail/libverify/api/l;

.field protected b:Lru/mail/libverify/ipc/a$a;

.field protected c:Landroid/os/Messenger;

.field volatile d:Z

.field private e:Landroid/os/Messenger;


# direct methods
.method constructor <init>(Lru/mail/libverify/api/l;)V
    .locals 1
    .param p1    # Lru/mail/libverify/api/l;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lru/mail/libverify/ipc/a;->d:Z

    iput-object p1, p0, Lru/mail/libverify/ipc/a;->a:Lru/mail/libverify/api/l;

    return-void
.end method


# virtual methods
.method final a()Landroid/os/Messenger;
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/ipc/a;->e:Landroid/os/Messenger;

    if-nez v0, :cond_0

    new-instance v0, Landroid/os/Messenger;

    invoke-direct {v0, p0}, Landroid/os/Messenger;-><init>(Landroid/os/Handler;)V

    iput-object v0, p0, Lru/mail/libverify/ipc/a;->e:Landroid/os/Messenger;

    :cond_0
    iget-object v0, p0, Lru/mail/libverify/ipc/a;->e:Landroid/os/Messenger;

    return-object v0
.end method

.method final declared-synchronized a(Landroid/os/Messenger;Lru/mail/libverify/ipc/a$a;)V
    .locals 2
    .param p1    # Landroid/os/Messenger;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lru/mail/libverify/ipc/a$a;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lru/mail/libverify/ipc/a;->c:Landroid/os/Messenger;

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "can\'t call postDataToService twice"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    :cond_0
    :try_start_1
    iput-object p1, p0, Lru/mail/libverify/ipc/a;->c:Landroid/os/Messenger;

    iput-object p2, p0, Lru/mail/libverify/ipc/a;->b:Lru/mail/libverify/ipc/a$a;

    invoke-virtual {p0}, Lru/mail/libverify/ipc/a;->b()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-void
.end method

.method protected abstract b()V
.end method
