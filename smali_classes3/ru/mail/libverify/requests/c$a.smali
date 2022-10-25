.class final Lru/mail/libverify/requests/c$a;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lru/mail/libverify/requests/c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "a"
.end annotation


# instance fields
.field final a:Lru/mail/libverify/requests/ActionDescriptor;

.field final b:Lru/mail/libverify/requests/e;

.field final c:Ljava/lang/String;

.field d:Ljava/util/concurrent/Future;


# direct methods
.method public constructor <init>(Lru/mail/libverify/requests/a;Lru/mail/libverify/requests/ActionDescriptor;)V
    .locals 3
    .param p1    # Lru/mail/libverify/requests/a;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lru/mail/libverify/requests/ActionDescriptor;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lru/mail/libverify/requests/c$a;->a:Lru/mail/libverify/requests/ActionDescriptor;

    iget-object v0, p2, Lru/mail/libverify/requests/ActionDescriptor;->type:Lru/mail/libverify/requests/ActionDescriptor$a;

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    :cond_0
    sget-object v0, Lru/mail/libverify/requests/c$4;->a:[I

    iget-object v1, p2, Lru/mail/libverify/requests/ActionDescriptor;->type:Lru/mail/libverify/requests/ActionDescriptor$a;

    invoke-virtual {v1}, Lru/mail/libverify/requests/ActionDescriptor$a;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Provided request type is not supported by the ActionExecutor"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :pswitch_0
    new-instance v0, Lru/mail/libverify/requests/o;

    invoke-interface {p1}, Lru/mail/libverify/requests/a;->a()Lru/mail/libverify/storage/k;

    move-result-object v1

    invoke-virtual {p2}, Lru/mail/libverify/requests/ActionDescriptor;->a()Lru/mail/libverify/requests/m;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lru/mail/libverify/requests/o;-><init>(Lru/mail/libverify/storage/k;Lru/mail/libverify/requests/m;)V

    :goto_0
    iput-object v0, p0, Lru/mail/libverify/requests/c$a;->b:Lru/mail/libverify/requests/e;

    iget-object v0, p0, Lru/mail/libverify/requests/c$a;->b:Lru/mail/libverify/requests/e;

    invoke-virtual {v0}, Lru/mail/libverify/requests/e;->j()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lru/mail/libverify/requests/c$a;->c:Ljava/lang/String;

    return-void

    :pswitch_1
    new-instance v0, Lru/mail/libverify/requests/k;

    invoke-interface {p1}, Lru/mail/libverify/requests/a;->a()Lru/mail/libverify/storage/k;

    move-result-object v1

    invoke-virtual {p2}, Lru/mail/libverify/requests/ActionDescriptor;->a()Lru/mail/libverify/requests/m;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lru/mail/libverify/requests/k;-><init>(Lru/mail/libverify/storage/k;Lru/mail/libverify/requests/m;)V

    goto :goto_0

    :pswitch_2
    new-instance v0, Lru/mail/libverify/requests/d;

    invoke-interface {p1}, Lru/mail/libverify/requests/a;->a()Lru/mail/libverify/storage/k;

    move-result-object v1

    invoke-virtual {p2}, Lru/mail/libverify/requests/ActionDescriptor;->a()Lru/mail/libverify/requests/m;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lru/mail/libverify/requests/d;-><init>(Lru/mail/libverify/storage/k;Lru/mail/libverify/requests/m;)V

    goto :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public constructor <init>(Lru/mail/libverify/requests/e;)V
    .locals 3
    .param p1    # Lru/mail/libverify/requests/e;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    instance-of v0, p1, Lru/mail/libverify/requests/o;

    if-eqz v0, :cond_0

    new-instance v0, Lru/mail/libverify/requests/ActionDescriptor;

    sget-object v1, Lru/mail/libverify/requests/ActionDescriptor$a;->UPDATE_SETTINGS:Lru/mail/libverify/requests/ActionDescriptor$a;

    invoke-virtual {p1}, Lru/mail/libverify/requests/e;->c()Lru/mail/libverify/requests/m;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lru/mail/libverify/requests/ActionDescriptor;-><init>(Lru/mail/libverify/requests/ActionDescriptor$a;Lru/mail/libverify/requests/m;)V

    :goto_0
    iput-object v0, p0, Lru/mail/libverify/requests/c$a;->a:Lru/mail/libverify/requests/ActionDescriptor;

    iput-object p1, p0, Lru/mail/libverify/requests/c$a;->b:Lru/mail/libverify/requests/e;

    iget-object v0, p0, Lru/mail/libverify/requests/c$a;->b:Lru/mail/libverify/requests/e;

    invoke-virtual {v0}, Lru/mail/libverify/requests/e;->j()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lru/mail/libverify/requests/c$a;->c:Ljava/lang/String;

    return-void

    :cond_0
    instance-of v0, p1, Lru/mail/libverify/requests/k;

    if-eqz v0, :cond_1

    new-instance v0, Lru/mail/libverify/requests/ActionDescriptor;

    sget-object v1, Lru/mail/libverify/requests/ActionDescriptor$a;->PUSH_STATUS:Lru/mail/libverify/requests/ActionDescriptor$a;

    invoke-virtual {p1}, Lru/mail/libverify/requests/e;->c()Lru/mail/libverify/requests/m;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lru/mail/libverify/requests/ActionDescriptor;-><init>(Lru/mail/libverify/requests/ActionDescriptor$a;Lru/mail/libverify/requests/m;)V

    goto :goto_0

    :cond_1
    instance-of v0, p1, Lru/mail/libverify/requests/d;

    if-eqz v0, :cond_2

    new-instance v0, Lru/mail/libverify/requests/ActionDescriptor;

    sget-object v1, Lru/mail/libverify/requests/ActionDescriptor$a;->ATTEMPT:Lru/mail/libverify/requests/ActionDescriptor$a;

    invoke-virtual {p1}, Lru/mail/libverify/requests/e;->c()Lru/mail/libverify/requests/m;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lru/mail/libverify/requests/ActionDescriptor;-><init>(Lru/mail/libverify/requests/ActionDescriptor$a;Lru/mail/libverify/requests/m;)V

    goto :goto_0

    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Provided request is not supported by the ActionExecutor"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
