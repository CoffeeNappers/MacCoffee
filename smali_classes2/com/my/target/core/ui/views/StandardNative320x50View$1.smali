.class final Lcom/my/target/core/ui/views/StandardNative320x50View$1;
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
    .line 58
    iput-object p1, p0, Lcom/my/target/core/ui/views/StandardNative320x50View$1;->a:Lcom/my/target/core/ui/views/StandardNative320x50View;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .prologue
    const/16 v3, 0xa

    .line 63
    iget-object v0, p0, Lcom/my/target/core/ui/views/StandardNative320x50View$1;->a:Lcom/my/target/core/ui/views/StandardNative320x50View;

    invoke-static {v0}, Lcom/my/target/core/ui/views/StandardNative320x50View;->a(Lcom/my/target/core/ui/views/StandardNative320x50View;)Landroid/widget/ViewFlipper;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/ViewFlipper;->getWidth()I

    move-result v0

    .line 65
    if-gtz v0, :cond_0

    .line 71
    :goto_0
    return-void

    .line 67
    :cond_0
    iget-object v1, p0, Lcom/my/target/core/ui/views/StandardNative320x50View$1;->a:Lcom/my/target/core/ui/views/StandardNative320x50View;

    invoke-static {v1}, Lcom/my/target/core/ui/views/StandardNative320x50View;->b(Lcom/my/target/core/ui/views/StandardNative320x50View;)Lcom/my/target/core/ui/views/BorderedTextView;

    move-result-object v1

    invoke-virtual {v1}, Lcom/my/target/core/ui/views/BorderedTextView;->getText()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-interface {v1}, Ljava/lang/CharSequence;->length()I

    move-result v1

    iget-object v2, p0, Lcom/my/target/core/ui/views/StandardNative320x50View$1;->a:Lcom/my/target/core/ui/views/StandardNative320x50View;

    .line 68
    invoke-static {v2}, Lcom/my/target/core/ui/views/StandardNative320x50View;->c(Lcom/my/target/core/ui/views/StandardNative320x50View;)Lcom/my/target/core/utils/l;

    move-result-object v2

    invoke-virtual {v2, v3}, Lcom/my/target/core/utils/l;->a(I)I

    move-result v2

    mul-int/2addr v1, v2

    sub-int/2addr v0, v1

    iget-object v1, p0, Lcom/my/target/core/ui/views/StandardNative320x50View$1;->a:Lcom/my/target/core/ui/views/StandardNative320x50View;

    invoke-static {v1}, Lcom/my/target/core/ui/views/StandardNative320x50View;->c(Lcom/my/target/core/ui/views/StandardNative320x50View;)Lcom/my/target/core/utils/l;

    move-result-object v1

    invoke-virtual {v1, v3}, Lcom/my/target/core/utils/l;->a(I)I

    move-result v1

    sub-int/2addr v0, v1

    .line 70
    iget-object v1, p0, Lcom/my/target/core/ui/views/StandardNative320x50View$1;->a:Lcom/my/target/core/ui/views/StandardNative320x50View;

    invoke-static {v1}, Lcom/my/target/core/ui/views/StandardNative320x50View;->d(Lcom/my/target/core/ui/views/StandardNative320x50View;)Landroid/widget/TextView;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setMaxWidth(I)V

    goto :goto_0
.end method
