.class public abstract Lcom/my/target/core/ui/views/fspromo/FSPromoView;
.super Landroid/widget/RelativeLayout;
.source "FSPromoView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/my/target/core/ui/views/fspromo/FSPromoView$a;
    }
.end annotation


# static fields
.field static final a:I


# instance fields
.field b:F

.field private c:I

.field private final d:Landroid/graphics/Bitmap;

.field private final e:Landroid/graphics/Bitmap;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 18
    invoke-static {}, Lcom/my/target/core/utils/l;->a()I

    move-result v0

    sput v0, Lcom/my/target/core/ui/views/fspromo/FSPromoView;->a:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 3

    .prologue
    const/16 v2, 0x1c

    .line 50
    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 51
    new-instance v0, Lcom/my/target/core/utils/l;

    invoke-direct {v0, p1}, Lcom/my/target/core/utils/l;-><init>(Landroid/content/Context;)V

    .line 53
    invoke-virtual {v0, v2}, Lcom/my/target/core/utils/l;->a(I)I

    move-result v1

    invoke-static {v1}, Lcom/my/target/core/resources/a;->e(I)Landroid/graphics/Bitmap;

    move-result-object v1

    iput-object v1, p0, Lcom/my/target/core/ui/views/fspromo/FSPromoView;->d:Landroid/graphics/Bitmap;

    .line 55
    invoke-virtual {v0, v2}, Lcom/my/target/core/utils/l;->a(I)I

    move-result v0

    invoke-static {v0}, Lcom/my/target/core/resources/a;->c(I)Landroid/graphics/Bitmap;

    move-result-object v0

    iput-object v0, p0, Lcom/my/target/core/ui/views/fspromo/FSPromoView;->e:Landroid/graphics/Bitmap;

    .line 56
    return-void
.end method


# virtual methods
.method public abstract a(I)V
.end method

.method public abstract a(Z)V
.end method

.method public abstract a()Z
.end method

.method public abstract b()Lcom/my/target/core/ui/views/controls/IconButton;
.end method

.method protected b(I)V
    .locals 0

    .prologue
    .line 109
    iput p1, p0, Lcom/my/target/core/ui/views/fspromo/FSPromoView;->c:I

    .line 110
    return-void
.end method

.method public final b(Z)V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 114
    if-eqz p1, :cond_0

    .line 115
    invoke-virtual {p0}, Lcom/my/target/core/ui/views/fspromo/FSPromoView;->b()Lcom/my/target/core/ui/views/controls/IconButton;

    move-result-object v0

    iget-object v1, p0, Lcom/my/target/core/ui/views/fspromo/FSPromoView;->e:Landroid/graphics/Bitmap;

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/my/target/core/ui/views/controls/IconButton;->setBitmap(Landroid/graphics/Bitmap;Ljava/lang/Boolean;)V

    .line 118
    :goto_0
    return-void

    .line 117
    :cond_0
    invoke-virtual {p0}, Lcom/my/target/core/ui/views/fspromo/FSPromoView;->b()Lcom/my/target/core/ui/views/controls/IconButton;

    move-result-object v0

    iget-object v1, p0, Lcom/my/target/core/ui/views/fspromo/FSPromoView;->d:Landroid/graphics/Bitmap;

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/my/target/core/ui/views/controls/IconButton;->setBitmap(Landroid/graphics/Bitmap;Ljava/lang/Boolean;)V

    goto :goto_0
.end method

.method public abstract c()V
.end method

.method public abstract d()V
.end method

.method public abstract e()V
.end method

.method public abstract f()V
.end method

.method public abstract g()Z
.end method

.method public abstract h()V
.end method

.method protected onMeasure(II)V
    .locals 2

    .prologue
    .line 102
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v0

    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v1

    .line 1078
    int-to-float v0, v0

    int-to-float v1, v1

    div-float/2addr v0, v1

    .line 1081
    const/high16 v1, 0x3f800000    # 1.0f

    cmpl-float v0, v0, v1

    if-lez v0, :cond_1

    .line 1083
    const/4 v0, 0x2

    .line 1089
    :goto_0
    iget v1, p0, Lcom/my/target/core/ui/views/fspromo/FSPromoView;->c:I

    if-eq v0, v1, :cond_0

    .line 1091
    invoke-virtual {p0, v0}, Lcom/my/target/core/ui/views/fspromo/FSPromoView;->b(I)V

    .line 104
    :cond_0
    invoke-super {p0, p1, p2}, Landroid/widget/RelativeLayout;->onMeasure(II)V

    .line 105
    return-void

    .line 1086
    :cond_1
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public setBanner(Lcom/my/target/core/models/banners/g;)V
    .locals 3

    .prologue
    .line 30
    invoke-virtual {p1}, Lcom/my/target/core/models/banners/g;->a()Lcom/my/target/core/models/banners/m;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 32
    invoke-virtual {p1}, Lcom/my/target/core/models/banners/g;->a()Lcom/my/target/core/models/banners/m;

    move-result-object v0

    invoke-virtual {v0}, Lcom/my/target/core/models/banners/m;->f()F

    move-result v0

    iput v0, p0, Lcom/my/target/core/ui/views/fspromo/FSPromoView;->b:F

    .line 34
    :cond_0
    invoke-virtual {p0}, Lcom/my/target/core/ui/views/fspromo/FSPromoView;->b()Lcom/my/target/core/ui/views/controls/IconButton;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 36
    invoke-virtual {p0}, Lcom/my/target/core/ui/views/fspromo/FSPromoView;->b()Lcom/my/target/core/ui/views/controls/IconButton;

    move-result-object v0

    iget-object v1, p0, Lcom/my/target/core/ui/views/fspromo/FSPromoView;->d:Landroid/graphics/Bitmap;

    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/my/target/core/ui/views/controls/IconButton;->setBitmap(Landroid/graphics/Bitmap;Ljava/lang/Boolean;)V

    .line 38
    :cond_1
    return-void
.end method

.method public abstract setCloseListener(Landroid/view/View$OnClickListener;)V
.end method

.method public abstract setOnCTAClickListener(Landroid/view/View$OnClickListener;)V
.end method

.method public abstract setOnVideoClickListener(Lcom/my/target/core/ui/views/fspromo/FSPromoView$a;)V
.end method

.method public abstract setTimeChanged(F)V
.end method

.method public abstract setVideoListener(Lcom/my/target/core/ui/views/video/VideoTextureView$a;)V
.end method
