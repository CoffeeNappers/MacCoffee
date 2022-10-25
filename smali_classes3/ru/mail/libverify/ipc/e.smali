.class final Lru/mail/libverify/ipc/e;
.super Lru/mail/libverify/ipc/a;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lru/mail/libverify/ipc/e$a;,
        Lru/mail/libverify/ipc/e$b;
    }
.end annotation


# instance fields
.field private final e:I

.field private final f:Ljava/lang/String;


# direct methods
.method private constructor <init>(Lru/mail/libverify/api/l;ILjava/lang/String;)V
    .locals 0
    .param p1    # Lru/mail/libverify/api/l;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-direct {p0, p1}, Lru/mail/libverify/ipc/a;-><init>(Lru/mail/libverify/api/l;)V

    iput p2, p0, Lru/mail/libverify/ipc/e;->e:I

    iput-object p3, p0, Lru/mail/libverify/ipc/e;->f:Ljava/lang/String;

    return-void
.end method

.method synthetic constructor <init>(Lru/mail/libverify/api/l;ILjava/lang/String;B)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lru/mail/libverify/ipc/e;-><init>(Lru/mail/libverify/api/l;ILjava/lang/String;)V

    return-void
.end method


# virtual methods
.method protected final b()V
    .locals 5

    :try_start_0
    iget-object v1, p0, Lru/mail/libverify/ipc/e;->c:Landroid/os/Messenger;

    iget v0, p0, Lru/mail/libverify/ipc/e;->e:I

    sget-object v2, Lru/mail/libverify/ipc/e$1;->a:[I

    add-int/lit8 v0, v0, -0x1

    aget v0, v2, v0

    packed-switch v0, :pswitch_data_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "unknown fetcher state"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception v0

    const-string/jumbo v1, "FetcherState"

    const-string/jumbo v2, "postDataToService"

    invoke-static {v1, v2, v0}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    return-void

    :pswitch_0
    const/4 v0, 0x6

    :try_start_1
    invoke-static {p0, v0}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object v0

    :goto_1
    invoke-virtual {p0}, Lru/mail/libverify/ipc/e;->a()Landroid/os/Messenger;

    move-result-object v2

    iput-object v2, v0, Landroid/os/Message;->replyTo:Landroid/os/Messenger;

    new-instance v2, Landroid/os/Bundle;

    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    const-string/jumbo v3, "data"

    iget-object v4, p0, Lru/mail/libverify/ipc/e;->f:Ljava/lang/String;

    invoke-virtual {v2, v3, v4}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v2}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    invoke-virtual {v1, v0}, Landroid/os/Messenger;->send(Landroid/os/Message;)V

    iget-object v0, p0, Lru/mail/libverify/ipc/e;->b:Lru/mail/libverify/ipc/a$a;

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Lru/mail/libverify/ipc/a$a;->a(Z)V

    goto :goto_0

    :pswitch_1
    const/4 v0, 0x7

    invoke-static {p0, v0}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v0

    goto :goto_1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
