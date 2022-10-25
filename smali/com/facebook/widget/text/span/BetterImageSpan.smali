.class public Lcom/facebook/widget/text/span/BetterImageSpan;
.super Landroid/text/style/ReplacementSpan;
.source "BetterImageSpan.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/widget/text/span/BetterImageSpan$BetterImageSpanAlignment;
    }
.end annotation


# static fields
.field public static final ALIGN_BASELINE:I = 0x1

.field public static final ALIGN_BOTTOM:I = 0x0

.field public static final ALIGN_CENTER:I = 0x2


# instance fields
.field private final mAlignment:I

.field private mBounds:Landroid/graphics/Rect;

.field private final mDrawable:Landroid/graphics/drawable/Drawable;

.field private final mFontMetricsInt:Landroid/graphics/Paint$FontMetricsInt;

.field private mHeight:I

.field private mWidth:I


# direct methods
.method public constructor <init>(Landroid/graphics/drawable/Drawable;)V
    .locals 1
    .param p1, "drawable"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 65
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lcom/facebook/widget/text/span/BetterImageSpan;-><init>(Landroid/graphics/drawable/Drawable;I)V

    .line 66
    return-void
.end method

.method public constructor <init>(Landroid/graphics/drawable/Drawable;I)V
    .locals 1
    .param p1, "drawable"    # Landroid/graphics/drawable/Drawable;
    .param p2, "verticalAlignment"    # I
        .annotation build Lcom/facebook/widget/text/span/BetterImageSpan$BetterImageSpanAlignment;
        .end annotation
    .end param

    .prologue
    .line 68
    invoke-direct {p0}, Landroid/text/style/ReplacementSpan;-><init>()V

    .line 61
    new-instance v0, Landroid/graphics/Paint$FontMetricsInt;

    invoke-direct {v0}, Landroid/graphics/Paint$FontMetricsInt;-><init>()V

    iput-object v0, p0, Lcom/facebook/widget/text/span/BetterImageSpan;->mFontMetricsInt:Landroid/graphics/Paint$FontMetricsInt;

    .line 69
    iput-object p1, p0, Lcom/facebook/widget/text/span/BetterImageSpan;->mDrawable:Landroid/graphics/drawable/Drawable;

    .line 70
    iput p2, p0, Lcom/facebook/widget/text/span/BetterImageSpan;->mAlignment:I

    .line 71
    invoke-virtual {p0}, Lcom/facebook/widget/text/span/BetterImageSpan;->updateBounds()V

    .line 72
    return-void
.end method

.method private getOffsetAboveBaseline(Landroid/graphics/Paint$FontMetricsInt;)I
    .locals 4
    .param p1, "fm"    # Landroid/graphics/Paint$FontMetricsInt;

    .prologue
    .line 140
    iget v2, p0, Lcom/facebook/widget/text/span/BetterImageSpan;->mAlignment:I

    packed-switch v2, :pswitch_data_0

    .line 149
    :pswitch_0
    iget v2, p0, Lcom/facebook/widget/text/span/BetterImageSpan;->mHeight:I

    neg-int v2, v2

    :goto_0
    return v2

    .line 142
    :pswitch_1
    iget v2, p1, Landroid/graphics/Paint$FontMetricsInt;->descent:I

    iget v3, p0, Lcom/facebook/widget/text/span/BetterImageSpan;->mHeight:I

    sub-int/2addr v2, v3

    goto :goto_0

    .line 144
    :pswitch_2
    iget v2, p1, Landroid/graphics/Paint$FontMetricsInt;->descent:I

    iget v3, p1, Landroid/graphics/Paint$FontMetricsInt;->ascent:I

    sub-int v1, v2, v3

    .line 145
    .local v1, "textHeight":I
    iget v2, p0, Lcom/facebook/widget/text/span/BetterImageSpan;->mHeight:I

    sub-int v2, v1, v2

    div-int/lit8 v0, v2, 0x2

    .line 146
    .local v0, "offset":I
    iget v2, p1, Landroid/graphics/Paint$FontMetricsInt;->ascent:I

    add-int/2addr v2, v0

    goto :goto_0

    .line 140
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method public static final normalizeAlignment(I)I
    .locals 1
    .param p0, "alignment"    # I
    .annotation build Lcom/facebook/widget/text/span/BetterImageSpan$BetterImageSpanAlignment;
    .end annotation

    .prologue
    .line 46
    packed-switch p0, :pswitch_data_0

    .line 53
    :pswitch_0
    const/4 v0, 0x1

    :goto_0
    return v0

    .line 48
    :pswitch_1
    const/4 v0, 0x0

    goto :goto_0

    .line 50
    :pswitch_2
    const/4 v0, 0x2

    goto :goto_0

    .line 46
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;Ljava/lang/CharSequence;IIFIIILandroid/graphics/Paint;)V
    .locals 3
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "text"    # Ljava/lang/CharSequence;
    .param p3, "start"    # I
    .param p4, "end"    # I
    .param p5, "x"    # F
    .param p6, "top"    # I
    .param p7, "y"    # I
    .param p8, "bottom"    # I
    .param p9, "paint"    # Landroid/graphics/Paint;

    .prologue
    .line 125
    iget-object v1, p0, Lcom/facebook/widget/text/span/BetterImageSpan;->mFontMetricsInt:Landroid/graphics/Paint$FontMetricsInt;

    invoke-virtual {p9, v1}, Landroid/graphics/Paint;->getFontMetricsInt(Landroid/graphics/Paint$FontMetricsInt;)I

    .line 126
    iget-object v1, p0, Lcom/facebook/widget/text/span/BetterImageSpan;->mFontMetricsInt:Landroid/graphics/Paint$FontMetricsInt;

    invoke-direct {p0, v1}, Lcom/facebook/widget/text/span/BetterImageSpan;->getOffsetAboveBaseline(Landroid/graphics/Paint$FontMetricsInt;)I

    move-result v1

    add-int v0, p7, v1

    .line 127
    .local v0, "iconTop":I
    int-to-float v1, v0

    invoke-virtual {p1, p5, v1}, Landroid/graphics/Canvas;->translate(FF)V

    .line 128
    iget-object v1, p0, Lcom/facebook/widget/text/span/BetterImageSpan;->mDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 129
    neg-float v1, p5

    neg-int v2, v0

    int-to-float v2, v2

    invoke-virtual {p1, v1, v2}, Landroid/graphics/Canvas;->translate(FF)V

    .line 130
    return-void
.end method

.method public getDrawable()Landroid/graphics/drawable/Drawable;
    .locals 1

    .prologue
    .line 75
    iget-object v0, p0, Lcom/facebook/widget/text/span/BetterImageSpan;->mDrawable:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method public getSize(Landroid/graphics/Paint;Ljava/lang/CharSequence;IILandroid/graphics/Paint$FontMetricsInt;)I
    .locals 3
    .param p1, "paint"    # Landroid/graphics/Paint;
    .param p2, "text"    # Ljava/lang/CharSequence;
    .param p3, "start"    # I
    .param p4, "end"    # I
    .param p5, "fontMetrics"    # Landroid/graphics/Paint$FontMetricsInt;

    .prologue
    .line 88
    invoke-virtual {p0}, Lcom/facebook/widget/text/span/BetterImageSpan;->updateBounds()V

    .line 89
    if-nez p5, :cond_0

    .line 90
    iget v2, p0, Lcom/facebook/widget/text/span/BetterImageSpan;->mWidth:I

    .line 111
    :goto_0
    return v2

    .line 93
    :cond_0
    invoke-direct {p0, p5}, Lcom/facebook/widget/text/span/BetterImageSpan;->getOffsetAboveBaseline(Landroid/graphics/Paint$FontMetricsInt;)I

    move-result v0

    .line 94
    .local v0, "offsetAbove":I
    iget v2, p0, Lcom/facebook/widget/text/span/BetterImageSpan;->mHeight:I

    add-int v1, v2, v0

    .line 95
    .local v1, "offsetBelow":I
    iget v2, p5, Landroid/graphics/Paint$FontMetricsInt;->ascent:I

    if-ge v0, v2, :cond_1

    .line 96
    iput v0, p5, Landroid/graphics/Paint$FontMetricsInt;->ascent:I

    .line 99
    :cond_1
    iget v2, p5, Landroid/graphics/Paint$FontMetricsInt;->top:I

    if-ge v0, v2, :cond_2

    .line 100
    iput v0, p5, Landroid/graphics/Paint$FontMetricsInt;->top:I

    .line 103
    :cond_2
    iget v2, p5, Landroid/graphics/Paint$FontMetricsInt;->descent:I

    if-le v1, v2, :cond_3

    .line 104
    iput v1, p5, Landroid/graphics/Paint$FontMetricsInt;->descent:I

    .line 107
    :cond_3
    iget v2, p5, Landroid/graphics/Paint$FontMetricsInt;->bottom:I

    if-le v1, v2, :cond_4

    .line 108
    iput v1, p5, Landroid/graphics/Paint$FontMetricsInt;->descent:I

    .line 111
    :cond_4
    iget v2, p0, Lcom/facebook/widget/text/span/BetterImageSpan;->mWidth:I

    goto :goto_0
.end method

.method public updateBounds()V
    .locals 1

    .prologue
    .line 133
    iget-object v0, p0, Lcom/facebook/widget/text/span/BetterImageSpan;->mDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    iput-object v0, p0, Lcom/facebook/widget/text/span/BetterImageSpan;->mBounds:Landroid/graphics/Rect;

    .line 135
    iget-object v0, p0, Lcom/facebook/widget/text/span/BetterImageSpan;->mBounds:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v0

    iput v0, p0, Lcom/facebook/widget/text/span/BetterImageSpan;->mWidth:I

    .line 136
    iget-object v0, p0, Lcom/facebook/widget/text/span/BetterImageSpan;->mBounds:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v0

    iput v0, p0, Lcom/facebook/widget/text/span/BetterImageSpan;->mHeight:I

    .line 137
    return-void
.end method
