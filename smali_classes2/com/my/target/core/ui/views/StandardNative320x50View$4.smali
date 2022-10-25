.class final Lcom/my/target/core/ui/views/StandardNative320x50View$4;
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
    .line 103
    iput-object p1, p0, Lcom/my/target/core/ui/views/StandardNative320x50View$4;->a:Lcom/my/target/core/ui/views/StandardNative320x50View;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .prologue
    .line 107
    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View$4;->a:Lcom/my/target/core/ui/views/StandardNative320x50View;

    invoke-static {v0}, Lcom/my/target/core/ui/views/StandardNative320x50View;->a(Lcom/my/target/core/ui/views/StandardNative320x50View;)Landroid/widget/ViewFlipper;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/ViewFlipper;->getWidth()I

    move-result v0

    iget-object v1, p0, Lcom/my/target/core/ui/views/StandardNative320x50View$4;->a:Lcom/my/target/core/ui/views/StandardNative320x50View;

    invoke-static {v1}, Lcom/my/target/core/ui/views/StandardNative320x50View;->a(Lcom/my/target/core/ui/views/StandardNative320x50View;)Landroid/widget/ViewFlipper;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/ViewFlipper;->getPaddingLeft()I

    move-result v1

    sub-int/2addr v0, v1

    iget-object v1, p0, Lcom/my/target/core/ui/views/StandardNative320x50View$4;->a:Lcom/my/target/core/ui/views/StandardNative320x50View;

    .line 108
    invoke-static {v1}, Lcom/my/target/core/ui/views/StandardNative320x50View;->a(Lcom/my/target/core/ui/views/StandardNative320x50View;)Landroid/widget/ViewFlipper;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/ViewFlipper;->getPaddingRight()I

    move-result v1

    sub-int/2addr v0, v1

    .line 110
    iget-object v1, p0, Lcom/my/target/core/ui/views/StandardNative320x50View$4;->a:Lcom/my/target/core/ui/views/StandardNative320x50View;

    invoke-static {v1}, Lcom/my/target/core/ui/views/StandardNative320x50View;->e(Lcom/my/target/core/ui/views/StandardNative320x50View;)Lcom/my/target/core/ui/views/StandardNative320x50View$a;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 112
    iget-object v1, p0, Lcom/my/target/core/ui/views/StandardNative320x50View$4;->a:Lcom/my/target/core/ui/views/StandardNative320x50View;

    invoke-static {v1}, Lcom/my/target/core/ui/views/StandardNative320x50View;->e(Lcom/my/target/core/ui/views/StandardNative320x50View;)Lcom/my/target/core/ui/views/StandardNative320x50View$a;

    move-result-object v1

    invoke-interface {v1, v0}, Lcom/my/target/core/ui/views/StandardNative320x50View$a;->a(I)V

    .line 115
    :cond_0
    iget-object v1, p0, Lcom/my/target/core/ui/views/StandardNative320x50View$4;->a:Lcom/my/target/core/ui/views/StandardNative320x50View;

    invoke-static {v1, v0}, Lcom/my/target/core/ui/views/StandardNative320x50View;->a(Lcom/my/target/core/ui/views/StandardNative320x50View;I)V

    .line 116
    return-void
.end method
