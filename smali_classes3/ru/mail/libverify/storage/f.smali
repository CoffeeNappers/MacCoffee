.class final Lru/mail/libverify/storage/f;
.super Lru/mail/libverify/storage/c;


# instance fields
.field private final a:Ljava/lang/String;

.field private final b:Ljava/lang/String;

.field private volatile c:Z


# direct methods
.method constructor <init>(Lru/mail/libverify/storage/c$a;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1    # Lru/mail/libverify/storage/c$a;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-direct {p0, p1}, Lru/mail/libverify/storage/c;-><init>(Lru/mail/libverify/storage/c$a;)V

    iput-object p2, p0, Lru/mail/libverify/storage/f;->a:Ljava/lang/String;

    iput-object p3, p0, Lru/mail/libverify/storage/f;->b:Ljava/lang/String;

    return-void
.end method

.method private d()V
    .locals 5

    iget-boolean v0, p0, Lru/mail/libverify/storage/f;->c:Z

    if-nez v0, :cond_1

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lru/mail/libverify/storage/f;->c:Z

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lru/mail/libverify/storage/f;->c()Lru/mail/libverify/storage/o;

    move-result-object v0

    const-string/jumbo v1, "instance_app_name"

    iget-object v2, p0, Lru/mail/libverify/storage/f;->a:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Lru/mail/libverify/storage/o;->a(Ljava/lang/String;Ljava/lang/String;)Lru/mail/libverify/storage/o;

    move-result-object v0

    const-string/jumbo v1, "instance_app_key"

    iget-object v2, p0, Lru/mail/libverify/storage/f;->b:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Lru/mail/libverify/storage/o;->a(Ljava/lang/String;Ljava/lang/String;)Lru/mail/libverify/storage/o;

    move-result-object v0

    invoke-interface {v0}, Lru/mail/libverify/storage/o;->a()V

    const-string/jumbo v0, "AppParams"

    const-string/jumbo v1, "saved params %s %s"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-object v4, p0, Lru/mail/libverify/storage/f;->a:Ljava/lang/String;

    aput-object v4, v2, v3

    const/4 v3, 0x1

    iget-object v4, p0, Lru/mail/libverify/storage/f;->b:Ljava/lang/String;

    aput-object v4, v2, v3

    invoke-static {v0, v1, v2}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lru/mail/libverify/storage/f;->c:Z

    :cond_0
    monitor-exit p0

    :cond_1
    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method


# virtual methods
.method public final a()Ljava/lang/String;
    .locals 1

    invoke-direct {p0}, Lru/mail/libverify/storage/f;->d()V

    iget-object v0, p0, Lru/mail/libverify/storage/f;->a:Ljava/lang/String;

    return-object v0
.end method

.method public final b()Ljava/lang/String;
    .locals 1

    invoke-direct {p0}, Lru/mail/libverify/storage/f;->d()V

    iget-object v0, p0, Lru/mail/libverify/storage/f;->b:Ljava/lang/String;

    return-object v0
.end method
