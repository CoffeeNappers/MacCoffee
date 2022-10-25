.class Lcom/vk/emoji/BetterImageSpan;
.super Landroid/text/style/ReplacementSpan;
.source "BetterImageSpan.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/emoji/BetterImageSpan$BetterImageSpanAlignment;
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
    .line 64
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lcom/vk/emoji/BetterImageSpan;-><init>(Landroid/graphics/drawable/Drawable;I)V

    .line 65
    return-void
.end method

.method public constructor <init>(Landroid/graphics/drawable/Drawable;I)V
    .locals 1
    .param p1, "drawable"    # Landroid/graphics/drawable/Drawable;
    .param p2, "verticalAlignment"    # I

    .prologue
    .line 67
    invoke-direct {p0}, Landroid/text/style/ReplacementSpan;-><init>()V

    .line 60
    new-instance v0, Landroid/graphics/Paint$FontMetricsInt;

    invoke-direct {v0}, Landroid/graphics/Paint$FontMetricsInt;-><init>()V

    iput-object v0, p0, Lcom/vk/emoji/BetterImageSpan;->mFontMetricsInt:Landroid/graphics/Paint$FontMetricsInt;

    .line 68
    iput-object p1, p0, Lcom/vk/emoji/BetterImageSpan;->mDrawable:Landroid/graphics/drawable/Drawable;

    .line 69
    iput p2, p0, Lcom/vk/emoji/BetterImageSpan;->mAlignment:I

    .line 70
    invoke-virtual {p0}, Lcom/vk/emoji/BetterImageSpan;->updateBounds()V

    .line 71
    return-void
.end method

.method private static getOffsetAboveBaseline(Landroid/graphics/Paint$FontMetricsInt;II)I
    .locals 4
    .param p0, "fm"    # Landroid/graphics/Paint$FontMetricsInt;
    .param p1, "alignment"    # I
    .param p2, "height"    # I

    .prologue
    .line 154
    packed-switch p1, :pswitch_data_0

    .line 163
    :pswitch_0
    neg-int v2, p2

    :goto_0
    return v2

    .line 156
    :pswitch_1
    iget v2, p0, Landroid/graphics/Paint$FontMetricsInt;->descent:I

    sub-int/2addr v2, p2

    goto :goto_0

    .line 158
    :pswitch_2
    iget v2, p0, Landroid/graphics/Paint$FontMetricsInt;->descent:I

    iget v3, p0, Landroid/graphics/Paint$FontMetricsInt;->ascent:I

    sub-int v1, v2, v3

    .line 159
    .local v1, "textHeight":I
    sub-int v2, v1, p2

    div-int/lit8 v0, v2, 0x2

    .line 160
    .local v0, "offset":I
    iget v2, p0, Landroid/graphics/Paint$FontMetricsInt;->ascent:I

    add-int/2addr v2, v0

    goto :goto_0

    .line 154
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method private static isZeroFontMetrics(Landroid/graphics/Paint$FontMetricsInt;)Z
    .locals 1
    .param p0, "fm"    # Landroid/graphics/Paint$FontMetricsInt;

    .prologue
    .line 168
    iget v0, p0, Landroid/graphics/Paint$FontMetricsInt;->descent:I

    if-nez v0, :cond_0

    iget v0, p0, Landroid/graphics/Paint$FontMetricsInt;->top:I

    if-nez v0, :cond_0

    iget v0, p0, Landroid/graphics/Paint$FontMetricsInt;->ascent:I

    if-nez v0, :cond_0

    iget v0, p0, Landroid/graphics/Paint$FontMetricsInt;->bottom:I

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static final normalizeAlignment(I)I
    .locals 1
    .param p0, "alignment"    # I

    .prologue
    .line 45
    packed-switch p0, :pswitch_data_0

    .line 52
    :pswitch_0
    const/4 v0, 0x1

    :goto_0
    return v0

    .line 47
    :pswitch_1
    const/4 v0, 0x0

    goto :goto_0

    .line 49
    :pswitch_2
    const/4 v0, 0x2

    goto :goto_0

    .line 45
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method public static updateFontMetrics(Landroid/graphics/Paint$FontMetricsInt;II)V
    .locals 6
    .param p0, "fontMetrics"    # Landroid/graphics/Paint$FontMetricsInt;
    .param p1, "alignment"    # I
    .param p2, "height"    # I

    .prologue
    .line 125
    invoke-static {p0}, Lcom/vk/emoji/BetterImageSpan;->isZeroFontMetrics(Landroid/graphics/Paint$FontMetricsInt;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 126
    const/high16 v4, -0x40c00000    # -0.75f

    int-to-float v5, p2

    mul-float/2addr v4, v5

    float-to-int v3, v4

    .line 127
    .local v3, "top":I
    add-int v0, v3, p2

    .line 128
    .local v0, "bottom":I
    iput v3, p0, Landroid/graphics/Paint$FontMetricsInt;->ascent:I

    .line 129
    iput v3, p0, Landroid/graphics/Paint$FontMetricsInt;->top:I

    .line 130
    iput v0, p0, Landroid/graphics/Paint$FontMetricsInt;->descent:I

    .line 131
    iput v0, p0, Landroid/graphics/Paint$FontMetricsInt;->bottom:I

    .line 151
    .end local v0    # "bottom":I
    .end local v3    # "top":I
    :cond_0
    :goto_0
    return-void

    .line 133
    :cond_1
    invoke-static {p0, p1, p2}, Lcom/vk/emoji/BetterImageSpan;->getOffsetAboveBaseline(Landroid/graphics/Paint$FontMetricsInt;II)I

    move-result v1

    .line 134
    .local v1, "offsetAbove":I
    add-int v2, p2, v1

    .line 135
    .local v2, "offsetBelow":I
    iget v4, p0, Landroid/graphics/Paint$FontMetricsInt;->ascent:I

    if-ge v1, v4, :cond_2

    .line 136
    iput v1, p0, Landroid/graphics/Paint$FontMetricsInt;->ascent:I

    .line 139
    :cond_2
    iget v4, p0, Landroid/graphics/Paint$FontMetricsInt;->top:I

    if-ge v1, v4, :cond_3

    .line 140
    iput v1, p0, Landroid/graphics/Paint$FontMetricsInt;->top:I

    .line 143
    :cond_3
    iget v4, p0, Landroid/graphics/Paint$FontMetricsInt;->descent:I

    if-le v2, v4, :cond_4

    .line 144
    iput v2, p0, Landroid/graphics/Paint$FontMetricsInt;->descent:I

    .line 147
    :cond_4
    iget v4, p0, Landroid/graphics/Paint$FontMetricsInt;->bottom:I

    if-le v2, v4, :cond_0

    .line 148
    iput v2, p0, Landroid/graphics/Paint$FontMetricsInt;->bottom:I

    goto :goto_0
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;Ljava/lang/CharSequence;IIFIIILandroid/graphics/Paint;)V
    .locals 4
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
    .line 110
    iget-object v1, p0, Lcom/vk/emoji/BetterImageSpan;->mFontMetricsInt:Landroid/graphics/Paint$FontMetricsInt;

    invoke-virtual {p9, v1}, Landroid/graphics/Paint;->getFontMetricsInt(Landroid/graphics/Paint$FontMetricsInt;)I

    .line 111
    iget-object v1, p0, Lcom/vk/emoji/BetterImageSpan;->mFontMetricsInt:Landroid/graphics/Paint$FontMetricsInt;

    iget v2, p0, Lcom/vk/emoji/BetterImageSpan;->mAlignment:I

    iget v3, p0, Lcom/vk/emoji/BetterImageSpan;->mHeight:I

    invoke-static {v1, v2, v3}, Lcom/vk/emoji/BetterImageSpan;->getOffsetAboveBaseline(Landroid/graphics/Paint$FontMetricsInt;II)I

    move-result v1

    add-int v0, p7, v1

    .line 112
    .local v0, "iconTop":I
    int-to-float v1, v0

    invoke-virtual {p1, p5, v1}, Landroid/graphics/Canvas;->translate(FF)V

    .line 113
    iget-object v1, p0, Lcom/vk/emoji/BetterImageSpan;->mDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 114
    neg-float v1, p5

    neg-int v2, v0

    int-to-float v2, v2

    invoke-virtual {p1, v1, v2}, Landroid/graphics/Canvas;->translate(FF)V

    .line 115
    return-void
.end method

.method public getDrawable()Landroid/graphics/drawable/Drawable;
    .locals 1

    .prologue
    .line 74
    iget-object v0, p0, Lcom/vk/emoji/BetterImageSpan;->mDrawable:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method public getSize(Landroid/graphics/Paint;Ljava/lang/CharSequence;IILandroid/graphics/Paint$FontMetricsInt;)I
    .locals 2
    .param p1, "paint"    # Landroid/graphics/Paint;
    .param p2, "text"    # Ljava/lang/CharSequence;
    .param p3, "start"    # I
    .param p4, "end"    # I
    .param p5, "fontMetrics"    # Landroid/graphics/Paint$FontMetricsInt;

    .prologue
    .line 88
    invoke-virtual {p0}, Lcom/vk/emoji/BetterImageSpan;->updateBounds()V

    .line 90
    if-nez p5, :cond_0

    .line 91
    iget v0, p0, Lcom/vk/emoji/BetterImageSpan;->mWidth:I

    .line 96
    :goto_0
    return v0

    .line 94
    :cond_0
    iget v0, p0, Lcom/vk/emoji/BetterImageSpan;->mAlignment:I

    iget v1, p0, Lcom/vk/emoji/BetterImageSpan;->mHeight:I

    invoke-static {p5, v0, v1}, Lcom/vk/emoji/BetterImageSpan;->updateFontMetrics(Landroid/graphics/Paint$FontMetricsInt;II)V

    .line 96
    iget v0, p0, Lcom/vk/emoji/BetterImageSpan;->mWidth:I

    goto :goto_0
.end method

.method public updateBounds()V
    .locals 1

    .prologue
    .line 118
    iget-object v0, p0, Lcom/vk/emoji/BetterImageSpan;->mDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/emoji/BetterImageSpan;->mBounds:Landroid/graphics/Rect;

    .line 120
    iget-object v0, p0, Lcom/vk/emoji/BetterImageSpan;->mBounds:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v0

    iput v0, p0, Lcom/vk/emoji/BetterImageSpan;->mWidth:I

    .line 121
    iget-object v0, p0, Lcom/vk/emoji/BetterImageSpan;->mBounds:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v0

    iput v0, p0, Lcom/vk/emoji/BetterImageSpan;->mHeight:I

    .line 122
    return-void
.end method
