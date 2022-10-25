.class final Lcom/my/target/core/engines/h$2;
.super Ljava/lang/Object;
.source "Native320x50Engine.java"

# interfaces
.implements Landroid/view/animation/Animation$AnimationListener;


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
    .line 73
    iput-object p1, p0, Lcom/my/target/core/engines/h$2;->a:Lcom/my/target/core/engines/h;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onAnimationEnd(Landroid/view/animation/Animation;)V
    .locals 4

    .prologue
    .line 82
    iget-object v0, p0, Lcom/my/target/core/engines/h$2;->a:Lcom/my/target/core/engines/h;

    invoke-static {v0}, Lcom/my/target/core/engines/h;->c(Lcom/my/target/core/engines/h;)Z

    .line 83
    iget-object v0, p0, Lcom/my/target/core/engines/h$2;->a:Lcom/my/target/core/engines/h;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-static {v0, v2, v3}, Lcom/my/target/core/engines/h;->a(Lcom/my/target/core/engines/h;J)J

    .line 85
    iget-object v0, p0, Lcom/my/target/core/engines/h$2;->a:Lcom/my/target/core/engines/h;

    invoke-static {v0}, Lcom/my/target/core/engines/h;->d(Lcom/my/target/core/engines/h;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    iget-object v1, p0, Lcom/my/target/core/engines/h$2;->a:Lcom/my/target/core/engines/h;

    invoke-static {v1}, Lcom/my/target/core/engines/h;->e(Lcom/my/target/core/engines/h;)Landroid/widget/ViewFlipper;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/ViewFlipper;->getDisplayedChild()I

    move-result v1

    if-le v0, v1, :cond_2

    .line 86
    iget-object v1, p0, Lcom/my/target/core/engines/h$2;->a:Lcom/my/target/core/engines/h;

    iget-object v0, p0, Lcom/my/target/core/engines/h$2;->a:Lcom/my/target/core/engines/h;

    invoke-static {v0}, Lcom/my/target/core/engines/h;->d(Lcom/my/target/core/engines/h;)Ljava/util/ArrayList;

    move-result-object v0

    iget-object v2, p0, Lcom/my/target/core/engines/h$2;->a:Lcom/my/target/core/engines/h;

    invoke-static {v2}, Lcom/my/target/core/engines/h;->e(Lcom/my/target/core/engines/h;)Landroid/widget/ViewFlipper;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/ViewFlipper;->getDisplayedChild()I

    move-result v2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/my/target/core/models/banners/j;

    invoke-static {v1, v0}, Lcom/my/target/core/engines/h;->a(Lcom/my/target/core/engines/h;Lcom/my/target/core/models/banners/j;)Lcom/my/target/core/models/banners/j;

    .line 93
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/my/target/core/engines/h$2;->a:Lcom/my/target/core/engines/h;

    invoke-static {v0}, Lcom/my/target/core/engines/h;->h(Lcom/my/target/core/engines/h;)Lcom/my/target/core/facades/h;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 95
    iget-object v0, p0, Lcom/my/target/core/engines/h$2;->a:Lcom/my/target/core/engines/h;

    iget-object v1, p0, Lcom/my/target/core/engines/h$2;->a:Lcom/my/target/core/engines/h;

    invoke-static {v1}, Lcom/my/target/core/engines/h;->h(Lcom/my/target/core/engines/h;)Lcom/my/target/core/facades/h;

    move-result-object v1

    invoke-virtual {v1}, Lcom/my/target/core/facades/h;->e()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/my/target/core/engines/h;->a(Lcom/my/target/core/engines/h;Ljava/lang/String;)V

    .line 96
    iget-object v0, p0, Lcom/my/target/core/engines/h$2;->a:Lcom/my/target/core/engines/h;

    invoke-static {v0}, Lcom/my/target/core/engines/h;->h(Lcom/my/target/core/engines/h;)Lcom/my/target/core/facades/h;

    move-result-object v0

    iget-object v1, p0, Lcom/my/target/core/engines/h$2;->a:Lcom/my/target/core/engines/h;

    invoke-static {v1}, Lcom/my/target/core/engines/h;->f(Lcom/my/target/core/engines/h;)Lcom/my/target/core/models/banners/j;

    move-result-object v1

    invoke-virtual {v1}, Lcom/my/target/core/models/banners/j;->getId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/my/target/core/facades/h;->b(Ljava/lang/String;)V

    .line 98
    iget-object v0, p0, Lcom/my/target/core/engines/h$2;->a:Lcom/my/target/core/engines/h;

    iget-object v1, p0, Lcom/my/target/core/engines/h$2;->a:Lcom/my/target/core/engines/h;

    invoke-static {v1}, Lcom/my/target/core/engines/h;->f(Lcom/my/target/core/engines/h;)Lcom/my/target/core/models/banners/j;

    move-result-object v1

    invoke-virtual {v1}, Lcom/my/target/core/models/banners/j;->getTimeout()I

    move-result v1

    mul-int/lit16 v1, v1, 0x3e8

    int-to-long v2, v1

    invoke-static {v0, v2, v3}, Lcom/my/target/core/engines/h;->b(Lcom/my/target/core/engines/h;J)J

    .line 100
    iget-object v0, p0, Lcom/my/target/core/engines/h$2;->a:Lcom/my/target/core/engines/h;

    invoke-static {v0}, Lcom/my/target/core/engines/h;->i(Lcom/my/target/core/engines/h;)V

    .line 101
    iget-object v0, p0, Lcom/my/target/core/engines/h$2;->a:Lcom/my/target/core/engines/h;

    invoke-static {v0}, Lcom/my/target/core/engines/h;->j(Lcom/my/target/core/engines/h;)V

    .line 103
    :cond_1
    return-void

    .line 87
    :cond_2
    iget-object v0, p0, Lcom/my/target/core/engines/h$2;->a:Lcom/my/target/core/engines/h;

    invoke-static {v0}, Lcom/my/target/core/engines/h;->f(Lcom/my/target/core/engines/h;)Lcom/my/target/core/models/banners/j;

    move-result-object v0

    if-nez v0, :cond_0

    .line 89
    const-string/jumbo v0, "list of banners count doesn\'t match views count, restarting"

    invoke-static {v0}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    .line 90
    iget-object v0, p0, Lcom/my/target/core/engines/h$2;->a:Lcom/my/target/core/engines/h;

    invoke-static {v0}, Lcom/my/target/core/engines/h;->g(Lcom/my/target/core/engines/h;)V

    goto :goto_0
.end method

.method public final onAnimationRepeat(Landroid/view/animation/Animation;)V
    .locals 0

    .prologue
    .line 109
    return-void
.end method

.method public final onAnimationStart(Landroid/view/animation/Animation;)V
    .locals 0

    .prologue
    .line 77
    return-void
.end method
