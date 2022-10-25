.class final Lcom/my/target/core/engines/i$2;
.super Ljava/lang/Object;
.source "StandardAdEngine.java"

# interfaces
.implements Lcom/my/target/core/communication/js/b;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/my/target/core/engines/i;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/my/target/core/engines/i;


# direct methods
.method constructor <init>(Lcom/my/target/core/engines/i;)V
    .locals 0

    .prologue
    .line 479
    iput-object p1, p0, Lcom/my/target/core/engines/i$2;->a:Lcom/my/target/core/engines/i;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Lcom/my/target/core/communication/js/events/f;)V
    .locals 2

    .prologue
    .line 483
    iget-object v0, p0, Lcom/my/target/core/engines/i$2;->a:Lcom/my/target/core/engines/i;

    invoke-static {v0}, Lcom/my/target/core/engines/i;->e(Lcom/my/target/core/engines/i;)Lcom/my/target/core/facades/h;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/my/target/core/engines/i$2;->a:Lcom/my/target/core/engines/i;

    invoke-static {v0}, Lcom/my/target/core/engines/i;->e(Lcom/my/target/core/engines/i;)Lcom/my/target/core/facades/h;

    move-result-object v0

    invoke-virtual {v0}, Lcom/my/target/core/facades/h;->b()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/my/target/core/engines/i$2;->a:Lcom/my/target/core/engines/i;

    invoke-static {v0}, Lcom/my/target/core/engines/i;->h(Lcom/my/target/core/engines/i;)Lcom/my/target/core/facades/h;

    move-result-object v0

    if-nez v0, :cond_0

    .line 485
    iget-object v0, p0, Lcom/my/target/core/engines/i$2;->a:Lcom/my/target/core/engines/i;

    iget-object v1, p0, Lcom/my/target/core/engines/i$2;->a:Lcom/my/target/core/engines/i;

    invoke-static {v1}, Lcom/my/target/core/engines/i;->e(Lcom/my/target/core/engines/i;)Lcom/my/target/core/facades/h;

    move-result-object v1

    invoke-virtual {v1}, Lcom/my/target/core/facades/h;->i()Lcom/my/target/core/facades/h;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/my/target/core/engines/i;->a(Lcom/my/target/core/engines/i;Lcom/my/target/core/facades/h;)Lcom/my/target/core/facades/h;

    .line 486
    iget-object v0, p0, Lcom/my/target/core/engines/i$2;->a:Lcom/my/target/core/engines/i;

    invoke-static {v0}, Lcom/my/target/core/engines/i;->h(Lcom/my/target/core/engines/i;)Lcom/my/target/core/facades/h;

    move-result-object v0

    iget-object v1, p0, Lcom/my/target/core/engines/i$2;->a:Lcom/my/target/core/engines/i;

    invoke-static {v1}, Lcom/my/target/core/engines/i;->i(Lcom/my/target/core/engines/i;)Lcom/my/target/core/facades/h$a;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/my/target/core/facades/h;->a(Lcom/my/target/core/facades/h$a;)V

    .line 487
    iget-object v0, p0, Lcom/my/target/core/engines/i$2;->a:Lcom/my/target/core/engines/i;

    invoke-static {v0}, Lcom/my/target/core/engines/i;->h(Lcom/my/target/core/engines/i;)Lcom/my/target/core/facades/h;

    move-result-object v0

    invoke-virtual {v0}, Lcom/my/target/core/facades/h;->load()V

    .line 489
    :cond_0
    return-void
.end method
