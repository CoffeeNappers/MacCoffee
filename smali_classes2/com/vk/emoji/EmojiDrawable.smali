.class abstract Lcom/vk/emoji/EmojiDrawable;
.super Landroid/graphics/drawable/Drawable;
.source "EmojiDrawable.java"


# instance fields
.field private final drawingBounds:Landroid/graphics/Rect;


# direct methods
.method public constructor <init>(III)V
    .locals 8
    .param p1, "size"    # I
    .param p2, "paddingHorizontal"    # I
    .param p3, "paddingVertical"    # I

    .prologue
    const/4 v5, 0x0

    .line 13
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 11
    new-instance v3, Landroid/graphics/Rect;

    invoke-direct {v3}, Landroid/graphics/Rect;-><init>()V

    iput-object v3, p0, Lcom/vk/emoji/EmojiDrawable;->drawingBounds:Landroid/graphics/Rect;

    .line 14
    mul-int/lit8 v3, p2, 0x2

    add-int/2addr v3, p1

    mul-int/lit8 v4, p3, 0x2

    add-int/2addr v4, p1

    invoke-virtual {p0, v5, v5, v3, v4}, Lcom/vk/emoji/EmojiDrawable;->setBounds(IIII)V

    .line 16
    invoke-virtual {p0}, Lcom/vk/emoji/EmojiDrawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v3

    invoke-virtual {v3}, Landroid/graphics/Rect;->centerX()I

    move-result v0

    .line 17
    .local v0, "cx":I
    invoke-virtual {p0}, Lcom/vk/emoji/EmojiDrawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v3

    invoke-virtual {v3}, Landroid/graphics/Rect;->centerY()I

    move-result v1

    .line 18
    .local v1, "cy":I
    div-int/lit8 v2, p1, 0x2

    .line 19
    .local v2, "s2":I
    iget-object v3, p0, Lcom/vk/emoji/EmojiDrawable;->drawingBounds:Landroid/graphics/Rect;

    sub-int v4, v0, v2

    sub-int v5, v1, v2

    add-int v6, v0, v2

    add-int v7, v1, v2

    invoke-virtual {v3, v4, v5, v6, v7}, Landroid/graphics/Rect;->set(IIII)V

    .line 20
    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .locals 1
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 24
    iget-object v0, p0, Lcom/vk/emoji/EmojiDrawable;->drawingBounds:Landroid/graphics/Rect;

    invoke-virtual {p0, p1, v0}, Lcom/vk/emoji/EmojiDrawable;->drawInBounds(Landroid/graphics/Canvas;Landroid/graphics/Rect;)V

    .line 25
    return-void
.end method

.method protected abstract drawInBounds(Landroid/graphics/Canvas;Landroid/graphics/Rect;)V
.end method

.method public getIntrinsicHeight()I
    .locals 1

    .prologue
    .line 47
    invoke-virtual {p0}, Lcom/vk/emoji/EmojiDrawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v0

    return v0
.end method

.method public getIntrinsicWidth()I
    .locals 1

    .prologue
    .line 42
    invoke-virtual {p0}, Lcom/vk/emoji/EmojiDrawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v0

    return v0
.end method

.method public getMinimumHeight()I
    .locals 1

    .prologue
    .line 57
    invoke-virtual {p0}, Lcom/vk/emoji/EmojiDrawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v0

    return v0
.end method

.method public getMinimumWidth()I
    .locals 1

    .prologue
    .line 52
    invoke-virtual {p0}, Lcom/vk/emoji/EmojiDrawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v0

    return v0
.end method

.method public getOpacity()I
    .locals 1

    .prologue
    .line 37
    const/4 v0, -0x2

    return v0
.end method

.method public setAlpha(I)V
    .locals 0
    .param p1, "alpha"    # I

    .prologue
    .line 29
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 0
    .param p1, "colorFilter"    # Landroid/graphics/ColorFilter;

    .prologue
    .line 33
    return-void
.end method
