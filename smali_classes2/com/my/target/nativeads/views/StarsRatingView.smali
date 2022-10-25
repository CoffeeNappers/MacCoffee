.class public Lcom/my/target/nativeads/views/StarsRatingView;
.super Landroid/view/View;
.source "StarsRatingView.java"


# instance fields
.field private drawable:Lcom/my/target/core/ui/drawables/a;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .prologue
    .line 17
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 18
    new-instance v0, Lcom/my/target/core/ui/drawables/a;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v1, v1, Landroid/util/DisplayMetrics;->density:F

    invoke-direct {v0, v1}, Lcom/my/target/core/ui/drawables/a;-><init>(F)V

    iput-object v0, p0, Lcom/my/target/nativeads/views/StarsRatingView;->drawable:Lcom/my/target/core/ui/drawables/a;

    .line 19
    return-void
.end method


# virtual methods
.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 1

    .prologue
    .line 49
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 50
    iget-object v0, p0, Lcom/my/target/nativeads/views/StarsRatingView;->drawable:Lcom/my/target/core/ui/drawables/a;

    invoke-virtual {v0, p1}, Lcom/my/target/core/ui/drawables/a;->draw(Landroid/graphics/Canvas;)V

    .line 51
    return-void
.end method

.method protected onMeasure(II)V
    .locals 3

    .prologue
    .line 41
    invoke-super {p0, p1, p2}, Landroid/view/View;->onMeasure(II)V

    .line 42
    iget-object v0, p0, Lcom/my/target/nativeads/views/StarsRatingView;->drawable:Lcom/my/target/core/ui/drawables/a;

    invoke-virtual {p0}, Lcom/my/target/nativeads/views/StarsRatingView;->getMeasuredHeight()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/my/target/core/ui/drawables/a;->a(I)V

    .line 43
    invoke-virtual {p0}, Lcom/my/target/nativeads/views/StarsRatingView;->getPaddingLeft()I

    move-result v0

    invoke-virtual {p0}, Lcom/my/target/nativeads/views/StarsRatingView;->getMeasuredWidth()I

    move-result v1

    add-int/2addr v0, v1

    invoke-virtual {p0}, Lcom/my/target/nativeads/views/StarsRatingView;->getPaddingRight()I

    move-result v1

    add-int/2addr v0, v1

    invoke-virtual {p0}, Lcom/my/target/nativeads/views/StarsRatingView;->getPaddingTop()I

    move-result v1

    invoke-virtual {p0}, Lcom/my/target/nativeads/views/StarsRatingView;->getMeasuredHeight()I

    move-result v2

    add-int/2addr v1, v2

    invoke-virtual {p0}, Lcom/my/target/nativeads/views/StarsRatingView;->getPaddingBottom()I

    move-result v2

    add-int/2addr v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/my/target/nativeads/views/StarsRatingView;->setMeasuredDimension(II)V

    .line 44
    return-void
.end method

.method public setRating(D)V
    .locals 1

    .prologue
    .line 29
    double-to-float v0, p1

    invoke-virtual {p0, v0}, Lcom/my/target/nativeads/views/StarsRatingView;->setRating(F)V

    .line 30
    return-void
.end method

.method public setRating(F)V
    .locals 1

    .prologue
    .line 23
    iget-object v0, p0, Lcom/my/target/nativeads/views/StarsRatingView;->drawable:Lcom/my/target/core/ui/drawables/a;

    invoke-virtual {v0, p1}, Lcom/my/target/core/ui/drawables/a;->a(F)V

    .line 24
    invoke-virtual {p0}, Lcom/my/target/nativeads/views/StarsRatingView;->invalidate()V

    .line 25
    return-void
.end method

.method public setStarsPadding(F)V
    .locals 1

    .prologue
    .line 34
    iget-object v0, p0, Lcom/my/target/nativeads/views/StarsRatingView;->drawable:Lcom/my/target/core/ui/drawables/a;

    invoke-virtual {v0, p1}, Lcom/my/target/core/ui/drawables/a;->b(F)V

    .line 35
    invoke-virtual {p0}, Lcom/my/target/nativeads/views/StarsRatingView;->invalidate()V

    .line 36
    return-void
.end method
