.class Lcom/wmspanel/libstream/d$1;
.super Ljava/lang/Thread;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/wmspanel/libstream/d;->r()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic N:Lcom/wmspanel/libstream/d;


# direct methods
.method constructor <init>(Lcom/wmspanel/libstream/d;)V
    .locals 0

    .prologue
    .line 59
    iput-object p1, p0, Lcom/wmspanel/libstream/d$1;->N:Lcom/wmspanel/libstream/d;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 64
    iget-object v0, p0, Lcom/wmspanel/libstream/d$1;->N:Lcom/wmspanel/libstream/d;

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v2

    invoke-static {v0, v2, v3}, Lcom/wmspanel/libstream/d;->a(Lcom/wmspanel/libstream/d;J)J

    .line 68
    :goto_0
    :try_start_0
    invoke-virtual {p0}, Lcom/wmspanel/libstream/d$1;->isInterrupted()Z

    move-result v0

    if-nez v0, :cond_2

    .line 70
    iget-object v0, p0, Lcom/wmspanel/libstream/d$1;->N:Lcom/wmspanel/libstream/d;

    invoke-static {v0}, Lcom/wmspanel/libstream/d;->a(Lcom/wmspanel/libstream/d;)Ljava/nio/channels/Selector;

    move-result-object v0

    const-wide/16 v2, 0xfa

    invoke-virtual {v0, v2, v3}, Ljava/nio/channels/Selector;->select(J)I

    .line 73
    iget-object v0, p0, Lcom/wmspanel/libstream/d$1;->N:Lcom/wmspanel/libstream/d;

    invoke-static {v0}, Lcom/wmspanel/libstream/d;->a(Lcom/wmspanel/libstream/d;)Ljava/nio/channels/Selector;

    move-result-object v0

    invoke-virtual {v0}, Ljava/nio/channels/Selector;->selectedKeys()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/nio/channels/SelectionKey;

    .line 75
    invoke-virtual {v0}, Ljava/nio/channels/SelectionKey;->isValid()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 79
    invoke-virtual {v0}, Ljava/nio/channels/SelectionKey;->readyOps()I

    .line 82
    invoke-virtual {v0}, Ljava/nio/channels/SelectionKey;->attachment()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/wmspanel/libstream/a;

    .line 83
    if-nez v1, :cond_3

    .line 84
    const-string/jumbo v0, "ConnectionManager"

    const-string/jumbo v1, "connection is null"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 90
    :cond_1
    iget-object v0, p0, Lcom/wmspanel/libstream/d$1;->N:Lcom/wmspanel/libstream/d;

    invoke-static {v0}, Lcom/wmspanel/libstream/d;->a(Lcom/wmspanel/libstream/d;)Ljava/nio/channels/Selector;

    move-result-object v0

    invoke-virtual {v0}, Ljava/nio/channels/Selector;->selectedKeys()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->clear()V

    .line 92
    iget-object v0, p0, Lcom/wmspanel/libstream/d$1;->N:Lcom/wmspanel/libstream/d;

    invoke-static {v0}, Lcom/wmspanel/libstream/d;->b(Lcom/wmspanel/libstream/d;)V

    .line 94
    iget-object v0, p0, Lcom/wmspanel/libstream/d$1;->N:Lcom/wmspanel/libstream/d;

    invoke-static {v0}, Lcom/wmspanel/libstream/d;->c(Lcom/wmspanel/libstream/d;)V

    .line 96
    iget-object v0, p0, Lcom/wmspanel/libstream/d$1;->N:Lcom/wmspanel/libstream/d;

    invoke-static {v0}, Lcom/wmspanel/libstream/d;->d(Lcom/wmspanel/libstream/d;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 99
    :catch_0
    move-exception v0

    .line 100
    const-string/jumbo v1, "ConnectionManager"

    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 103
    :cond_2
    return-void

    .line 88
    :cond_3
    :try_start_1
    invoke-virtual {v1, v0}, Lcom/wmspanel/libstream/a;->a(Ljava/nio/channels/SelectionKey;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1
.end method
