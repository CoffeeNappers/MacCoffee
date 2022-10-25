.class final Lcom/my/target/core/ui/views/StandardNative320x50View$2;
.super Ljava/lang/Object;
.source "StandardNative320x50View.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/my/target/core/ui/views/StandardNative320x50View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/my/target/core/ui/views/StandardNative320x50View;


# direct methods
.method constructor <init>(Lcom/my/target/core/ui/views/StandardNative320x50View;)V
    .locals 0

    .prologue
    .line 74
    iput-object p1, p0, Lcom/my/target/core/ui/views/StandardNative320x50View$2;->a:Lcom/my/target/core/ui/views/StandardNative320x50View;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .prologue
    .line 78
    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View$2;->a:Lcom/my/target/core/ui/views/StandardNative320x50View;

    invoke-static {v0}, Lcom/my/target/core/ui/views/StandardNative320x50View;->e(Lcom/my/target/core/ui/views/StandardNative320x50View;)Lcom/my/target/core/ui/views/StandardNative320x50View$a;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View$2;->a:Lcom/my/target/core/ui/views/StandardNative320x50View;

    .line 79
    invoke-static {v0}, Lcom/my/target/core/ui/views/StandardNative320x50View;->a(Lcom/my/target/core/ui/views/StandardNative320x50View;)Landroid/widget/ViewFlipper;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/ViewFlipper;->getDisplayedChild()I

    move-result v0

    iget-object v1, p0, Lcom/my/target/core/ui/views/StandardNative320x50View$2;->a:Lcom/my/target/core/ui/views/StandardNative320x50View;

    invoke-static {v1}, Lcom/my/target/core/ui/views/StandardNative320x50View;->a(Lcom/my/target/core/ui/views/StandardNative320x50View;)Landroid/widget/ViewFlipper;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/ViewFlipper;->getChildCount()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    if-ne v0, v1, :cond_0

    .line 81
    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View$2;->a:Lcom/my/target/core/ui/views/StandardNative320x50View;

    invoke-static {v0}, Lcom/my/target/core/ui/views/StandardNative320x50View;->e(Lcom/my/target/core/ui/views/StandardNative320x50View;)Lcom/my/target/core/ui/views/StandardNative320x50View$a;

    move-result-object v0

    invoke-interface {v0}, Lcom/my/target/core/ui/views/StandardNative320x50View$a;->h()V

    .line 84
    :cond_0
    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View$2;->a:Lcom/my/target/core/ui/views/StandardNative320x50View;

    invoke-static {v0}, Lcom/my/target/core/ui/views/StandardNative320x50View;->a(Lcom/my/target/core/ui/views/StandardNative320x50View;)Landroid/widget/ViewFlipper;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/ViewFlipper;->getChildCount()I

    move-result v0

    const/4 v1, 0x1

    if-le v0, v1, :cond_1

    .line 86
    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View$2;->a:Lcom/my/target/core/ui/views/StandardNative320x50View;

    invoke-static {v0}, Lcom/my/target/core/ui/views/StandardNative320x50View;->a(Lcom/my/target/core/ui/views/StandardNative320x50View;)Landroid/widget/ViewFlipper;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/ViewFlipper;->showNext()V

    .line 87
    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View$2;->a:Lcom/my/target/core/ui/views/StandardNative320x50View;

    iget-object v1, p0, Lcom/my/target/core/ui/views/StandardNative320x50View$2;->a:Lcom/my/target/core/ui/views/StandardNative320x50View;

    invoke-static {v1}, Lcom/my/target/core/ui/views/StandardNative320x50View;->f(Lcom/my/target/core/ui/views/StandardNative320x50View;)Ljava/lang/Runnable;

    move-result-object v1

    const-wide/16 v2, 0xfa0

    invoke-virtual {v0, v1, v2, v3}, Lcom/my/target/core/ui/views/StandardNative320x50View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 89
    :cond_1
    return-void
.end method
