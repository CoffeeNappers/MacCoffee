.class public Lcom/vk/attachpicker/stickers/TextSticker;
.super Lcom/vk/attachpicker/stickers/Sticker;
.source "TextSticker.java"


# instance fields
.field private final backgroundPaint:Landroid/graphics/Paint;

.field private final backgroundRect:Landroid/graphics/RectF;

.field private lastCanvasHeight:I

.field private lastCanvasWidth:I

.field private final maxWidth:I

.field private staticLayout:Landroid/text/StaticLayout;

.field private stickerStyle:Lcom/vk/attachpicker/stickers/StickerStyle;

.field private text:Ljava/lang/String;

.field private final textPaint:Landroid/text/TextPaint;


# direct methods
.method public constructor <init>(ILjava/lang/String;ILcom/vk/attachpicker/stickers/StickerStyle;)V
    .locals 2
    .param p1, "maxWidth"    # I
    .param p2, "text"    # Ljava/lang/String;
    .param p3, "color"    # I
    .param p4, "typeface"    # Lcom/vk/attachpicker/stickers/StickerStyle;

    .prologue
    .line 47
    invoke-direct {p0}, Lcom/vk/attachpicker/stickers/Sticker;-><init>()V

    .line 28
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/vk/attachpicker/stickers/TextSticker;->backgroundPaint:Landroid/graphics/Paint;

    .line 29
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/vk/attachpicker/stickers/TextSticker;->backgroundRect:Landroid/graphics/RectF;

    .line 48
    iput p1, p0, Lcom/vk/attachpicker/stickers/TextSticker;->maxWidth:I

    .line 49
    iput-object p4, p0, Lcom/vk/attachpicker/stickers/TextSticker;->stickerStyle:Lcom/vk/attachpicker/stickers/StickerStyle;

    .line 50
    iget-object v0, p4, Lcom/vk/attachpicker/stickers/StickerStyle;->typeface:Landroid/graphics/Typeface;

    iget v1, p4, Lcom/vk/attachpicker/stickers/StickerStyle;->fontSize:I

    invoke-static {v0, p3, v1}, Lcom/vk/attachpicker/stickers/TextSticker;->createPaint(Landroid/graphics/Typeface;II)Landroid/text/TextPaint;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/attachpicker/stickers/TextSticker;->textPaint:Landroid/text/TextPaint;

    .line 51
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/TextSticker;->backgroundPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 52
    invoke-virtual {p0, p2}, Lcom/vk/attachpicker/stickers/TextSticker;->setText(Ljava/lang/String;)V

    .line 53
    return-void
.end method

.method public constructor <init>(Lcom/vk/attachpicker/stickers/TextSticker;)V
    .locals 2
    .param p1, "sticker"    # Lcom/vk/attachpicker/stickers/TextSticker;

    .prologue
    .line 39
    invoke-direct {p0}, Lcom/vk/attachpicker/stickers/Sticker;-><init>()V

    .line 28
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/vk/attachpicker/stickers/TextSticker;->backgroundPaint:Landroid/graphics/Paint;

    .line 29
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/vk/attachpicker/stickers/TextSticker;->backgroundRect:Landroid/graphics/RectF;

    .line 40
    iget v0, p1, Lcom/vk/attachpicker/stickers/TextSticker;->maxWidth:I

    iput v0, p0, Lcom/vk/attachpicker/stickers/TextSticker;->maxWidth:I

    .line 41
    iget-object v0, p1, Lcom/vk/attachpicker/stickers/TextSticker;->stickerStyle:Lcom/vk/attachpicker/stickers/StickerStyle;

    iput-object v0, p0, Lcom/vk/attachpicker/stickers/TextSticker;->stickerStyle:Lcom/vk/attachpicker/stickers/StickerStyle;

    .line 42
    new-instance v0, Landroid/text/TextPaint;

    iget-object v1, p1, Lcom/vk/attachpicker/stickers/TextSticker;->textPaint:Landroid/text/TextPaint;

    invoke-direct {v0, v1}, Landroid/text/TextPaint;-><init>(Landroid/graphics/Paint;)V

    iput-object v0, p0, Lcom/vk/attachpicker/stickers/TextSticker;->textPaint:Landroid/text/TextPaint;

    .line 43
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/TextSticker;->backgroundPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 44
    iget-object v0, p1, Lcom/vk/attachpicker/stickers/TextSticker;->text:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/vk/attachpicker/stickers/TextSticker;->setText(Ljava/lang/String;)V

    .line 45
    return-void
.end method

.method public static createPaint(Landroid/graphics/Typeface;II)Landroid/text/TextPaint;
    .locals 4
    .param p0, "typeface"    # Landroid/graphics/Typeface;
    .param p1, "color"    # I
    .param p2, "fontColor"    # I

    .prologue
    const/high16 v3, 0x40000000    # 2.0f

    .line 17
    new-instance v0, Landroid/text/TextPaint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/text/TextPaint;-><init>(I)V

    .line 18
    .local v0, "tp":Landroid/text/TextPaint;
    invoke-virtual {v0, p0}, Landroid/text/TextPaint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 19
    invoke-virtual {v0, p1}, Landroid/text/TextPaint;->setColor(I)V

    .line 20
    int-to-float v1, p2

    invoke-virtual {v0, v1}, Landroid/text/TextPaint;->setTextSize(F)V

    .line 21
    sget-object v1, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    invoke-virtual {v0, v1}, Landroid/text/TextPaint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 22
    const/4 v1, 0x0

    const/high16 v2, 0x28000000

    invoke-virtual {v0, v3, v1, v3, v2}, Landroid/text/TextPaint;->setShadowLayer(FFFI)V

    .line 23
    return-object v0
.end method


# virtual methods
.method public canRotate()Z
    .locals 1

    .prologue
    .line 57
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/TextSticker;->stickerStyle:Lcom/vk/attachpicker/stickers/StickerStyle;

    iget-boolean v0, v0, Lcom/vk/attachpicker/stickers/StickerStyle;->canRotate:Z

    return v0
.end method

.method public canScale()Z
    .locals 1

    .prologue
    .line 62
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/TextSticker;->stickerStyle:Lcom/vk/attachpicker/stickers/StickerStyle;

    iget-boolean v0, v0, Lcom/vk/attachpicker/stickers/StickerStyle;->canScale:Z

    return v0
.end method

.method public canTranslateX()Z
    .locals 1

    .prologue
    .line 67
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/TextSticker;->stickerStyle:Lcom/vk/attachpicker/stickers/StickerStyle;

    iget-boolean v0, v0, Lcom/vk/attachpicker/stickers/StickerStyle;->canTranslateX:Z

    return v0
.end method

.method public canTranslateY()Z
    .locals 1

    .prologue
    .line 72
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/TextSticker;->stickerStyle:Lcom/vk/attachpicker/stickers/StickerStyle;

    iget-boolean v0, v0, Lcom/vk/attachpicker/stickers/StickerStyle;->canTranslateY:Z

    return v0
.end method

.method public doDraw(Landroid/graphics/Canvas;)V
    .locals 10
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const/4 v9, 0x0

    .line 116
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    move-result v4

    iput v4, p0, Lcom/vk/attachpicker/stickers/TextSticker;->lastCanvasWidth:I

    .line 117
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getHeight()I

    move-result v4

    iput v4, p0, Lcom/vk/attachpicker/stickers/TextSticker;->lastCanvasHeight:I

    .line 119
    iget-object v4, p0, Lcom/vk/attachpicker/stickers/TextSticker;->staticLayout:Landroid/text/StaticLayout;

    if-eqz v4, :cond_1

    .line 120
    invoke-virtual {p0}, Lcom/vk/attachpicker/stickers/TextSticker;->getScale()F

    move-result v0

    .line 121
    .local v0, "currentScale":F
    iget-object v4, p0, Lcom/vk/attachpicker/stickers/TextSticker;->stickerStyle:Lcom/vk/attachpicker/stickers/StickerStyle;

    iget-boolean v4, v4, Lcom/vk/attachpicker/stickers/StickerStyle;->fullWidth:Z

    if-eqz v4, :cond_2

    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    move-result v4

    int-to-float v4, v4

    div-float/2addr v4, v0

    float-to-int v3, v4

    .line 123
    .local v3, "width":I
    :goto_0
    iget-object v4, p0, Lcom/vk/attachpicker/stickers/TextSticker;->stickerStyle:Lcom/vk/attachpicker/stickers/StickerStyle;

    iget v4, v4, Lcom/vk/attachpicker/stickers/StickerStyle;->background:I

    if-eqz v4, :cond_0

    .line 124
    iget-object v4, p0, Lcom/vk/attachpicker/stickers/TextSticker;->backgroundRect:Landroid/graphics/RectF;

    const/4 v5, 0x3

    invoke-static {v5}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v5

    neg-int v5, v5

    int-to-float v5, v5

    int-to-float v6, v3

    invoke-virtual {p0}, Lcom/vk/attachpicker/stickers/TextSticker;->getOriginalHeight()F

    move-result v7

    const/4 v8, 0x6

    invoke-static {v8}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v8

    int-to-float v8, v8

    add-float/2addr v7, v8

    invoke-virtual {v4, v9, v5, v6, v7}, Landroid/graphics/RectF;->set(FFFF)V

    .line 126
    invoke-virtual {p0}, Lcom/vk/attachpicker/stickers/TextSticker;->getAlpha()I

    move-result v4

    int-to-float v4, v4

    const/high16 v5, 0x437f0000    # 255.0f

    div-float v1, v4, v5

    .line 127
    .local v1, "fAlpha":F
    iget-object v4, p0, Lcom/vk/attachpicker/stickers/TextSticker;->backgroundPaint:Landroid/graphics/Paint;

    iget-object v5, p0, Lcom/vk/attachpicker/stickers/TextSticker;->stickerStyle:Lcom/vk/attachpicker/stickers/StickerStyle;

    iget v5, v5, Lcom/vk/attachpicker/stickers/StickerStyle;->background:I

    iget-object v6, p0, Lcom/vk/attachpicker/stickers/TextSticker;->stickerStyle:Lcom/vk/attachpicker/stickers/StickerStyle;

    iget v6, v6, Lcom/vk/attachpicker/stickers/StickerStyle;->background:I

    .line 128
    invoke-static {v6}, Landroid/graphics/Color;->alpha(I)I

    move-result v6

    int-to-float v6, v6

    mul-float/2addr v6, v1

    float-to-int v6, v6

    .line 127
    invoke-static {v5, v6}, Landroid/support/v4/graphics/ColorUtils;->setAlphaComponent(II)I

    move-result v5

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setColor(I)V

    .line 129
    iget-object v4, p0, Lcom/vk/attachpicker/stickers/TextSticker;->backgroundRect:Landroid/graphics/RectF;

    iget-object v5, p0, Lcom/vk/attachpicker/stickers/TextSticker;->backgroundPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v4, v5}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 132
    .end local v1    # "fAlpha":F
    :cond_0
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    move-result v2

    .line 133
    .local v2, "saveCount":I
    div-int/lit8 v4, v3, 0x2

    int-to-float v4, v4

    invoke-virtual {p1, v4, v9}, Landroid/graphics/Canvas;->translate(FF)V

    .line 134
    iget-object v4, p0, Lcom/vk/attachpicker/stickers/TextSticker;->staticLayout:Landroid/text/StaticLayout;

    invoke-virtual {v4}, Landroid/text/StaticLayout;->getPaint()Landroid/text/TextPaint;

    move-result-object v4

    invoke-virtual {p0}, Lcom/vk/attachpicker/stickers/TextSticker;->getAlpha()I

    move-result v5

    invoke-virtual {v4, v5}, Landroid/text/TextPaint;->setAlpha(I)V

    .line 135
    iget-object v4, p0, Lcom/vk/attachpicker/stickers/TextSticker;->staticLayout:Landroid/text/StaticLayout;

    invoke-virtual {v4, p1}, Landroid/text/StaticLayout;->draw(Landroid/graphics/Canvas;)V

    .line 136
    invoke-virtual {p1, v2}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 138
    .end local v0    # "currentScale":F
    .end local v2    # "saveCount":I
    .end local v3    # "width":I
    :cond_1
    return-void

    .line 121
    .restart local v0    # "currentScale":F
    :cond_2
    invoke-virtual {p0}, Lcom/vk/attachpicker/stickers/TextSticker;->getOriginalWidth()F

    move-result v4

    float-to-int v3, v4

    goto :goto_0
.end method

.method public getColor()I
    .locals 1

    .prologue
    .line 80
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/TextSticker;->textPaint:Landroid/text/TextPaint;

    invoke-virtual {v0}, Landroid/text/TextPaint;->getColor()I

    move-result v0

    return v0
.end method

.method public getOriginalHeight()F
    .locals 1

    .prologue
    .line 161
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/TextSticker;->staticLayout:Landroid/text/StaticLayout;

    if-nez v0, :cond_0

    .line 162
    const/4 v0, 0x0

    .line 164
    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/TextSticker;->staticLayout:Landroid/text/StaticLayout;

    invoke-virtual {v0}, Landroid/text/StaticLayout;->getHeight()I

    move-result v0

    int-to-float v0, v0

    goto :goto_0
.end method

.method public getOriginalWidth()F
    .locals 3

    .prologue
    const/4 v0, 0x0

    .line 142
    iget-object v1, p0, Lcom/vk/attachpicker/stickers/TextSticker;->stickerStyle:Lcom/vk/attachpicker/stickers/StickerStyle;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/vk/attachpicker/stickers/TextSticker;->stickerStyle:Lcom/vk/attachpicker/stickers/StickerStyle;

    iget-boolean v1, v1, Lcom/vk/attachpicker/stickers/StickerStyle;->fullWidth:Z

    if-eqz v1, :cond_1

    .line 143
    iget v0, p0, Lcom/vk/attachpicker/stickers/TextSticker;->lastCanvasWidth:I

    int-to-float v0, v0

    .line 153
    :cond_0
    :goto_0
    return v0

    .line 145
    :cond_1
    iget-object v1, p0, Lcom/vk/attachpicker/stickers/TextSticker;->staticLayout:Landroid/text/StaticLayout;

    if-eqz v1, :cond_0

    .line 148
    iget-object v1, p0, Lcom/vk/attachpicker/stickers/TextSticker;->staticLayout:Landroid/text/StaticLayout;

    invoke-virtual {v1}, Landroid/text/StaticLayout;->getLineCount()I

    move-result v1

    const/4 v2, 0x1

    if-le v1, v2, :cond_2

    .line 149
    iget v0, p0, Lcom/vk/attachpicker/stickers/TextSticker;->maxWidth:I

    int-to-float v0, v0

    goto :goto_0

    .line 150
    :cond_2
    iget-object v1, p0, Lcom/vk/attachpicker/stickers/TextSticker;->staticLayout:Landroid/text/StaticLayout;

    invoke-virtual {v1}, Landroid/text/StaticLayout;->getLineCount()I

    move-result v1

    if-lez v1, :cond_0

    .line 151
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/TextSticker;->staticLayout:Landroid/text/StaticLayout;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/text/StaticLayout;->getLineWidth(I)F

    move-result v0

    goto :goto_0
.end method

.method public getStickerStyle()Lcom/vk/attachpicker/stickers/StickerStyle;
    .locals 1

    .prologue
    .line 84
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/TextSticker;->stickerStyle:Lcom/vk/attachpicker/stickers/StickerStyle;

    return-object v0
.end method

.method public getText()Ljava/lang/String;
    .locals 1

    .prologue
    .line 76
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/TextSticker;->text:Ljava/lang/String;

    return-object v0
.end method

.method public setColor(I)V
    .locals 1
    .param p1, "color"    # I

    .prologue
    .line 96
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/TextSticker;->textPaint:Landroid/text/TextPaint;

    invoke-virtual {v0, p1}, Landroid/text/TextPaint;->setColor(I)V

    .line 97
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/TextSticker;->text:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/vk/attachpicker/stickers/TextSticker;->setText(Ljava/lang/String;)V

    .line 98
    return-void
.end method

.method public setText(Ljava/lang/String;)V
    .locals 8
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 88
    if-nez p1, :cond_0

    .line 89
    const-string/jumbo p1, "..."

    .line 91
    :cond_0
    iput-object p1, p0, Lcom/vk/attachpicker/stickers/TextSticker;->text:Ljava/lang/String;

    .line 92
    new-instance v0, Landroid/text/StaticLayout;

    iget-object v2, p0, Lcom/vk/attachpicker/stickers/TextSticker;->textPaint:Landroid/text/TextPaint;

    iget v3, p0, Lcom/vk/attachpicker/stickers/TextSticker;->maxWidth:I

    sget-object v4, Landroid/text/Layout$Alignment;->ALIGN_NORMAL:Landroid/text/Layout$Alignment;

    const/high16 v5, 0x3f800000    # 1.0f

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v1, p1

    invoke-direct/range {v0 .. v7}, Landroid/text/StaticLayout;-><init>(Ljava/lang/CharSequence;Landroid/text/TextPaint;ILandroid/text/Layout$Alignment;FFZ)V

    iput-object v0, p0, Lcom/vk/attachpicker/stickers/TextSticker;->staticLayout:Landroid/text/StaticLayout;

    .line 93
    return-void
.end method

.method public setTypeface(Lcom/vk/attachpicker/stickers/StickerStyle;)V
    .locals 3
    .param p1, "typeface"    # Lcom/vk/attachpicker/stickers/StickerStyle;

    .prologue
    .line 101
    if-nez p1, :cond_1

    .line 112
    :cond_0
    :goto_0
    return-void

    .line 104
    :cond_1
    iget-object v1, p0, Lcom/vk/attachpicker/stickers/TextSticker;->stickerStyle:Lcom/vk/attachpicker/stickers/StickerStyle;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/vk/attachpicker/stickers/TextSticker;->stickerStyle:Lcom/vk/attachpicker/stickers/StickerStyle;

    invoke-virtual {v1}, Lcom/vk/attachpicker/stickers/StickerStyle;->fixedStyle()Z

    move-result v0

    .line 105
    .local v0, "wasFixedStyle":Z
    :goto_1
    iput-object p1, p0, Lcom/vk/attachpicker/stickers/TextSticker;->stickerStyle:Lcom/vk/attachpicker/stickers/StickerStyle;

    .line 106
    iget-object v1, p0, Lcom/vk/attachpicker/stickers/TextSticker;->textPaint:Landroid/text/TextPaint;

    iget v2, p1, Lcom/vk/attachpicker/stickers/StickerStyle;->fontSize:I

    int-to-float v2, v2

    invoke-virtual {v1, v2}, Landroid/text/TextPaint;->setTextSize(F)V

    .line 107
    iget-object v1, p0, Lcom/vk/attachpicker/stickers/TextSticker;->textPaint:Landroid/text/TextPaint;

    iget-object v2, p1, Lcom/vk/attachpicker/stickers/StickerStyle;->typeface:Landroid/graphics/Typeface;

    invoke-virtual {v1, v2}, Landroid/text/TextPaint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 108
    iget-object v1, p0, Lcom/vk/attachpicker/stickers/TextSticker;->text:Ljava/lang/String;

    invoke-virtual {p0, v1}, Lcom/vk/attachpicker/stickers/TextSticker;->setText(Ljava/lang/String;)V

    .line 109
    invoke-virtual {p1}, Lcom/vk/attachpicker/stickers/StickerStyle;->fixedStyle()Z

    move-result v1

    if-eq v0, v1, :cond_0

    .line 110
    iget v1, p0, Lcom/vk/attachpicker/stickers/TextSticker;->lastCanvasWidth:I

    int-to-float v1, v1

    iget v2, p0, Lcom/vk/attachpicker/stickers/TextSticker;->lastCanvasHeight:I

    int-to-float v2, v2

    invoke-virtual {p0, v1, v2}, Lcom/vk/attachpicker/stickers/TextSticker;->reset(FF)V

    goto :goto_0

    .line 104
    .end local v0    # "wasFixedStyle":Z
    :cond_2
    const/4 v0, 0x0

    goto :goto_1
.end method
