.class public Lcom/vk/stories/view/BrushSelectorView;
.super Landroid/view/View;
.source "BrushSelectorView.java"


# static fields
.field private static final COLOR_NONE:I = -0x535252

.field private static final backgroundCirclePaint:Landroid/graphics/Paint;

.field private static final backgroundCircleRadius:I


# instance fields
.field private backgroundCircleColor:I

.field private bottomDrawable:Landroid/graphics/drawable/Drawable;

.field private topDrawable:Landroid/graphics/drawable/Drawable;

.field private topWhiteDrawable:Landroid/graphics/drawable/Drawable;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 22
    const/16 v0, 0x14

    invoke-static {v0}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v0

    sput v0, Lcom/vk/stories/view/BrushSelectorView;->backgroundCircleRadius:I

    .line 23
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    sput-object v0, Lcom/vk/stories/view/BrushSelectorView;->backgroundCirclePaint:Landroid/graphics/Paint;

    .line 25
    sget-object v0, Lcom/vk/stories/view/BrushSelectorView;->backgroundCirclePaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 26
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 34
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/vk/stories/view/BrushSelectorView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 35
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 38
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/vk/stories/view/BrushSelectorView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 39
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    const/4 v5, 0x0

    .line 42
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 44
    sget-object v4, Lcom/vkontakte/android/R$styleable;->BrushSelectorView:[I

    invoke-virtual {p1, p2, v4, v5, v5}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 45
    .local v0, "a":Landroid/content/res/TypedArray;
    const v4, 0x7f020332

    invoke-virtual {v0, v5, v4}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v2

    .line 46
    .local v2, "topDrawableResId":I
    const/4 v4, 0x1

    const v5, 0x7f020333

    invoke-virtual {v0, v4, v5}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v3

    .line 47
    .local v3, "topWhiteDrawableResId":I
    const/4 v4, 0x2

    const v5, 0x7f020331

    invoke-virtual {v0, v4, v5}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v1

    .line 48
    .local v1, "bottomDrawableResId":I
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 50
    const v4, 0x7f020383

    invoke-virtual {p0, v4}, Lcom/vk/stories/view/BrushSelectorView;->setBackgroundResource(I)V

    .line 51
    invoke-virtual {p0, v2}, Lcom/vk/stories/view/BrushSelectorView;->setTopDrawableResId(I)V

    .line 52
    invoke-virtual {p0, v3}, Lcom/vk/stories/view/BrushSelectorView;->setTopWhiteDrawableResId(I)V

    .line 53
    invoke-virtual {p0, v1}, Lcom/vk/stories/view/BrushSelectorView;->setBottomDrawableResId(I)V

    .line 54
    return-void
.end method


# virtual methods
.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 7
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const/16 v6, 0xff

    .line 58
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 60
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    move-result v2

    div-int/lit8 v0, v2, 0x2

    .line 61
    .local v0, "cx":I
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getHeight()I

    move-result v2

    div-int/lit8 v1, v2, 0x2

    .line 63
    .local v1, "cy":I
    iget v2, p0, Lcom/vk/stories/view/BrushSelectorView;->backgroundCircleColor:I

    if-eqz v2, :cond_0

    .line 64
    iget v2, p0, Lcom/vk/stories/view/BrushSelectorView;->backgroundCircleColor:I

    invoke-static {v2}, Landroid/graphics/Color;->red(I)I

    move-result v2

    if-ne v2, v6, :cond_1

    iget v2, p0, Lcom/vk/stories/view/BrushSelectorView;->backgroundCircleColor:I

    invoke-static {v2}, Landroid/graphics/Color;->green(I)I

    move-result v2

    if-ne v2, v6, :cond_1

    iget v2, p0, Lcom/vk/stories/view/BrushSelectorView;->backgroundCircleColor:I

    invoke-static {v2}, Landroid/graphics/Color;->blue(I)I

    move-result v2

    if-ne v2, v6, :cond_1

    .line 65
    sget-object v2, Lcom/vk/stories/view/BrushSelectorView;->backgroundCirclePaint:Landroid/graphics/Paint;

    const/high16 v3, -0x1000000

    const/16 v4, 0x33

    invoke-static {v3, v4}, Landroid/support/v4/graphics/ColorUtils;->setAlphaComponent(II)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 69
    :goto_0
    int-to-float v2, v0

    int-to-float v3, v1

    sget v4, Lcom/vk/stories/view/BrushSelectorView;->backgroundCircleRadius:I

    int-to-float v4, v4

    sget-object v5, Lcom/vk/stories/view/BrushSelectorView;->backgroundCirclePaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v2, v3, v4, v5}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 72
    :cond_0
    iget v2, p0, Lcom/vk/stories/view/BrushSelectorView;->backgroundCircleColor:I

    invoke-static {v2}, Landroid/graphics/Color;->red(I)I

    move-result v2

    if-ne v2, v6, :cond_2

    iget v2, p0, Lcom/vk/stories/view/BrushSelectorView;->backgroundCircleColor:I

    invoke-static {v2}, Landroid/graphics/Color;->green(I)I

    move-result v2

    if-ne v2, v6, :cond_2

    iget v2, p0, Lcom/vk/stories/view/BrushSelectorView;->backgroundCircleColor:I

    invoke-static {v2}, Landroid/graphics/Color;->blue(I)I

    move-result v2

    if-ne v2, v6, :cond_2

    .line 73
    iget-object v2, p0, Lcom/vk/stories/view/BrushSelectorView;->topWhiteDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v2, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 77
    :goto_1
    iget-object v2, p0, Lcom/vk/stories/view/BrushSelectorView;->bottomDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v2, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 78
    return-void

    .line 67
    :cond_1
    sget-object v2, Lcom/vk/stories/view/BrushSelectorView;->backgroundCirclePaint:Landroid/graphics/Paint;

    iget v3, p0, Lcom/vk/stories/view/BrushSelectorView;->backgroundCircleColor:I

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    goto :goto_0

    .line 75
    :cond_2
    iget-object v2, p0, Lcom/vk/stories/view/BrushSelectorView;->topDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v2, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    goto :goto_1
.end method

.method protected onSizeChanged(IIII)V
    .locals 2
    .param p1, "w"    # I
    .param p2, "h"    # I
    .param p3, "oldw"    # I
    .param p4, "oldh"    # I

    .prologue
    const/4 v1, 0x0

    .line 82
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/View;->onSizeChanged(IIII)V

    .line 83
    iget-object v0, p0, Lcom/vk/stories/view/BrushSelectorView;->topDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, v1, v1, p1, p2}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 84
    iget-object v0, p0, Lcom/vk/stories/view/BrushSelectorView;->topWhiteDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, v1, v1, p1, p2}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 85
    iget-object v0, p0, Lcom/vk/stories/view/BrushSelectorView;->bottomDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, v1, v1, p1, p2}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 86
    return-void
.end method

.method public setBottomDrawableResId(I)V
    .locals 1
    .param p1, "resId"    # I

    .prologue
    .line 99
    invoke-virtual {p0}, Lcom/vk/stories/view/BrushSelectorView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Landroid/support/v4/content/ContextCompat;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/stories/view/BrushSelectorView;->bottomDrawable:Landroid/graphics/drawable/Drawable;

    .line 100
    invoke-virtual {p0}, Lcom/vk/stories/view/BrushSelectorView;->invalidate()V

    .line 101
    return-void
.end method

.method public setColor(I)V
    .locals 2
    .param p1, "color"    # I

    .prologue
    .line 111
    iget-object v0, p0, Lcom/vk/stories/view/BrushSelectorView;->topDrawable:Landroid/graphics/drawable/Drawable;

    sget-object v1, Landroid/graphics/PorterDuff$Mode;->MULTIPLY:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v0, p1, v1}, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    .line 112
    iget-object v0, p0, Lcom/vk/stories/view/BrushSelectorView;->topWhiteDrawable:Landroid/graphics/drawable/Drawable;

    sget-object v1, Landroid/graphics/PorterDuff$Mode;->MULTIPLY:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v0, p1, v1}, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    .line 113
    const/16 v0, 0x33

    invoke-static {p1, v0}, Landroid/support/v4/graphics/ColorUtils;->setAlphaComponent(II)I

    move-result v0

    iput v0, p0, Lcom/vk/stories/view/BrushSelectorView;->backgroundCircleColor:I

    .line 114
    invoke-virtual {p0}, Lcom/vk/stories/view/BrushSelectorView;->invalidate()V

    .line 115
    return-void
.end method

.method public setColorNone()V
    .locals 3

    .prologue
    const v2, -0x535252

    .line 104
    iget-object v0, p0, Lcom/vk/stories/view/BrushSelectorView;->topDrawable:Landroid/graphics/drawable/Drawable;

    sget-object v1, Landroid/graphics/PorterDuff$Mode;->MULTIPLY:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v0, v2, v1}, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    .line 105
    iget-object v0, p0, Lcom/vk/stories/view/BrushSelectorView;->topWhiteDrawable:Landroid/graphics/drawable/Drawable;

    sget-object v1, Landroid/graphics/PorterDuff$Mode;->MULTIPLY:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v0, v2, v1}, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    .line 106
    const/4 v0, 0x0

    iput v0, p0, Lcom/vk/stories/view/BrushSelectorView;->backgroundCircleColor:I

    .line 107
    invoke-virtual {p0}, Lcom/vk/stories/view/BrushSelectorView;->invalidate()V

    .line 108
    return-void
.end method

.method public setTopDrawableResId(I)V
    .locals 1
    .param p1, "resId"    # I

    .prologue
    .line 89
    invoke-virtual {p0}, Lcom/vk/stories/view/BrushSelectorView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Landroid/support/v4/content/ContextCompat;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/stories/view/BrushSelectorView;->topDrawable:Landroid/graphics/drawable/Drawable;

    .line 90
    invoke-virtual {p0}, Lcom/vk/stories/view/BrushSelectorView;->invalidate()V

    .line 91
    return-void
.end method

.method public setTopWhiteDrawableResId(I)V
    .locals 1
    .param p1, "resId"    # I

    .prologue
    .line 94
    invoke-virtual {p0}, Lcom/vk/stories/view/BrushSelectorView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Landroid/support/v4/content/ContextCompat;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/stories/view/BrushSelectorView;->topWhiteDrawable:Landroid/graphics/drawable/Drawable;

    .line 95
    invoke-virtual {p0}, Lcom/vk/stories/view/BrushSelectorView;->invalidate()V

    .line 96
    return-void
.end method
