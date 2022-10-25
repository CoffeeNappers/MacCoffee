.class public Lcom/vkontakte/android/ui/drawables/TextDrawable;
.super Landroid/graphics/drawable/Drawable;
.source "TextDrawable.java"


# static fields
.field private static final DEFAULT_COLOR:I = -0x1

.field private static final DEFAULT_TEXT_SIZE:I = 0xc


# instance fields
.field private final mIntrinsicHeight:I

.field private final mIntrinsicWidth:I

.field private final mPaint:Landroid/graphics/Paint;

.field private final mText:Ljava/lang/CharSequence;


# direct methods
.method public constructor <init>(Landroid/content/res/Resources;Ljava/lang/CharSequence;I)V
    .locals 6
    .param p1, "res"    # Landroid/content/res/Resources;
    .param p2, "text"    # Ljava/lang/CharSequence;
    .param p3, "padding"    # I

    .prologue
    const/4 v3, 0x1

    .line 23
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 24
    iput-object p2, p0, Lcom/vkontakte/android/ui/drawables/TextDrawable;->mText:Ljava/lang/CharSequence;

    .line 25
    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1, v3}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v1, p0, Lcom/vkontakte/android/ui/drawables/TextDrawable;->mPaint:Landroid/graphics/Paint;

    .line 26
    iget-object v1, p0, Lcom/vkontakte/android/ui/drawables/TextDrawable;->mPaint:Landroid/graphics/Paint;

    const/4 v2, -0x1

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 27
    iget-object v1, p0, Lcom/vkontakte/android/ui/drawables/TextDrawable;->mPaint:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 28
    iget-object v1, p0, Lcom/vkontakte/android/ui/drawables/TextDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 29
    const/4 v1, 0x2

    const/high16 v2, 0x41400000    # 12.0f

    .line 30
    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    .line 29
    invoke-static {v1, v2, v3}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v0

    .line 31
    .local v0, "textSize":F
    iget-object v1, p0, Lcom/vkontakte/android/ui/drawables/TextDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 32
    iget-object v1, p0, Lcom/vkontakte/android/ui/drawables/TextDrawable;->mPaint:Landroid/graphics/Paint;

    iget-object v2, p0, Lcom/vkontakte/android/ui/drawables/TextDrawable;->mText:Ljava/lang/CharSequence;

    const/4 v3, 0x0

    iget-object v4, p0, Lcom/vkontakte/android/ui/drawables/TextDrawable;->mText:Ljava/lang/CharSequence;

    invoke-interface {v4}, Ljava/lang/CharSequence;->length()I

    move-result v4

    invoke-virtual {v1, v2, v3, v4}, Landroid/graphics/Paint;->measureText(Ljava/lang/CharSequence;II)F

    move-result v1

    float-to-double v2, v1

    const-wide/high16 v4, 0x3fe0000000000000L    # 0.5

    add-double/2addr v2, v4

    double-to-int v1, v2

    mul-int/lit8 v2, p3, 0x2

    add-int/2addr v1, v2

    iput v1, p0, Lcom/vkontakte/android/ui/drawables/TextDrawable;->mIntrinsicWidth:I

    .line 33
    iget-object v1, p0, Lcom/vkontakte/android/ui/drawables/TextDrawable;->mPaint:Landroid/graphics/Paint;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->getFontMetricsInt(Landroid/graphics/Paint$FontMetricsInt;)I

    move-result v1

    add-int/2addr v1, p3

    iput v1, p0, Lcom/vkontakte/android/ui/drawables/TextDrawable;->mIntrinsicHeight:I

    .line 34
    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .locals 6
    .param p1, "canvas"    # Landroid/graphics/Canvas;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 38
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/drawables/TextDrawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    .line 39
    .local v0, "bounds":Landroid/graphics/Rect;
    iget-object v1, p0, Lcom/vkontakte/android/ui/drawables/TextDrawable;->mText:Ljava/lang/CharSequence;

    .line 40
    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    .line 41
    invoke-virtual {v0}, Landroid/graphics/Rect;->centerX()I

    move-result v2

    int-to-float v2, v2

    .line 42
    invoke-virtual {v0}, Landroid/graphics/Rect;->centerY()I

    move-result v3

    int-to-float v3, v3

    iget-object v4, p0, Lcom/vkontakte/android/ui/drawables/TextDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v4}, Landroid/graphics/Paint;->descent()F

    move-result v4

    iget-object v5, p0, Lcom/vkontakte/android/ui/drawables/TextDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v5}, Landroid/graphics/Paint;->ascent()F

    move-result v5

    add-float/2addr v4, v5

    const/high16 v5, 0x40000000    # 2.0f

    div-float/2addr v4, v5

    sub-float/2addr v3, v4

    float-to-int v3, v3

    int-to-float v3, v3

    iget-object v4, p0, Lcom/vkontakte/android/ui/drawables/TextDrawable;->mPaint:Landroid/graphics/Paint;

    .line 39
    invoke-virtual {p1, v1, v2, v3, v4}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 45
    return-void
.end method

.method public getIntrinsicHeight()I
    .locals 1

    .prologue
    .line 59
    iget v0, p0, Lcom/vkontakte/android/ui/drawables/TextDrawable;->mIntrinsicHeight:I

    return v0
.end method

.method public getIntrinsicWidth()I
    .locals 1

    .prologue
    .line 54
    iget v0, p0, Lcom/vkontakte/android/ui/drawables/TextDrawable;->mIntrinsicWidth:I

    return v0
.end method

.method public getOpacity()I
    .locals 1

    .prologue
    .line 49
    iget-object v0, p0, Lcom/vkontakte/android/ui/drawables/TextDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0}, Landroid/graphics/Paint;->getAlpha()I

    move-result v0

    return v0
.end method

.method public setAlpha(I)V
    .locals 1
    .param p1, "alpha"    # I

    .prologue
    .line 64
    iget-object v0, p0, Lcom/vkontakte/android/ui/drawables/TextDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 65
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 1
    .param p1, "filter"    # Landroid/graphics/ColorFilter;

    .prologue
    .line 69
    iget-object v0, p0, Lcom/vkontakte/android/ui/drawables/TextDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 70
    return-void
.end method
