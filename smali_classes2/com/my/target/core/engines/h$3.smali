.class final Lcom/my/target/core/engines/h$3;
.super Ljava/lang/Object;
.source "Native320x50Engine.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/my/target/core/engines/h;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/my/target/core/engines/h;


# direct methods
.method constructor <init>(Lcom/my/target/core/engines/h;)V
    .locals 0

    .prologue
    .line 112
    iput-object p1, p0, Lcom/my/target/core/engines/h$3;->a:Lcom/my/target/core/engines/h;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .prologue
    .line 116
    iget-object v0, p0, Lcom/my/target/core/engines/h$3;->a:Lcom/my/target/core/engines/h;

    invoke-static {v0}, Lcom/my/target/core/engines/h;->d(Lcom/my/target/core/engines/h;)Ljava/util/ArrayList;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/my/target/core/engines/h$3;->a:Lcom/my/target/core/engines/h;

    invoke-static {v0}, Lcom/my/target/core/engines/h;->d(Lcom/my/target/core/engines/h;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/my/target/core/engines/h$3;->a:Lcom/my/target/core/engines/h;

    invoke-static {v0}, Lcom/my/target/core/engines/h;->f(Lcom/my/target/core/engines/h;)Lcom/my/target/core/models/banners/j;

    move-result-object v0

    if-nez v0, :cond_1

    .line 125
    :cond_0
    :goto_0
    return-void

    .line 118
    :cond_1
    const-string/jumbo v0, "banner"

    iget-object v1, p0, Lcom/my/target/core/engines/h$3;->a:Lcom/my/target/core/engines/h;

    invoke-static {v1}, Lcom/my/target/core/engines/h;->f(Lcom/my/target/core/engines/h;)Lcom/my/target/core/models/banners/j;

    move-result-object v1

    invoke-virtual {v1}, Lcom/my/target/core/models/banners/j;->getType()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 120
    iget-object v0, p0, Lcom/my/target/core/engines/h$3;->a:Lcom/my/target/core/engines/h;

    invoke-static {v0}, Lcom/my/target/core/engines/h;->k(Lcom/my/target/core/engines/h;)V

    goto :goto_0

    .line 123
    :cond_2
    iget-object v0, p0, Lcom/my/target/core/engines/h$3;->a:Lcom/my/target/core/engines/h;

    invoke-static {v0}, Lcom/my/target/core/engines/h;->l(Lcom/my/target/core/engines/h;)Z

    goto :goto_0
.end method
