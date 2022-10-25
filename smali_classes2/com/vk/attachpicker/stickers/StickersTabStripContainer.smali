.class public Lcom/vk/attachpicker/stickers/StickersTabStripContainer;
.super Landroid/widget/FrameLayout;
.source "StickersTabStripContainer.java"


# instance fields
.field private final clipRadius:I

.field private final clippingPath:Landroid/graphics/Path;

.field private final clippingRect:Landroid/graphics/RectF;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 21
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 16
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Lcom/vk/attachpicker/stickers/StickersTabStripContainer;->clippingPath:Landroid/graphics/Path;

    .line 17
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/vk/attachpicker/stickers/StickersTabStripContainer;->clippingRect:Landroid/graphics/RectF;

    .line 18
    const/16 v0, 0x30

    invoke-static {v0}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    iput v0, p0, Lcom/vk/attachpicker/stickers/StickersTabStripContainer;->clipRadius:I

    .line 22
    invoke-direct {p0}, Lcom/vk/attachpicker/stickers/StickersTabStripContainer;->init()V

    .line 23
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 26
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 16
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Lcom/vk/attachpicker/stickers/StickersTabStripContainer;->clippingPath:Landroid/graphics/Path;

    .line 17
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/vk/attachpicker/stickers/StickersTabStripContainer;->clippingRect:Landroid/graphics/RectF;

    .line 18
    const/16 v0, 0x30

    invoke-static {v0}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    iput v0, p0, Lcom/vk/attachpicker/stickers/StickersTabStripContainer;->clipRadius:I

    .line 27
    invoke-direct {p0}, Lcom/vk/attachpicker/stickers/StickersTabStripContainer;->init()V

    .line 28
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    .line 31
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 16
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Lcom/vk/attachpicker/stickers/StickersTabStripContainer;->clippingPath:Landroid/graphics/Path;

    .line 17
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/vk/attachpicker/stickers/StickersTabStripContainer;->clippingRect:Landroid/graphics/RectF;

    .line 18
    const/16 v0, 0x30

    invoke-static {v0}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    iput v0, p0, Lcom/vk/attachpicker/stickers/StickersTabStripContainer;->clipRadius:I

    .line 32
    invoke-direct {p0}, Lcom/vk/attachpicker/stickers/StickersTabStripContainer;->init()V

    .line 33
    return-void
.end method

.method private init()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x4

    .line 36
    invoke-virtual {p0, v3}, Lcom/vk/attachpicker/stickers/StickersTabStripContainer;->setWillNotDraw(Z)V

    .line 37
    invoke-static {v2}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v0

    invoke-static {v2}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v1

    invoke-static {v2}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v2

    invoke-virtual {p0, v0, v1, v2, v3}, Lcom/vk/attachpicker/stickers/StickersTabStripContainer;->setPadding(IIII)V

    .line 38
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x12

    if-ge v0, v1, :cond_0

    .line 39
    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/vk/attachpicker/stickers/StickersTabStripContainer;->setLayerType(ILandroid/graphics/Paint;)V

    .line 41
    :cond_0
    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .locals 1
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 53
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/StickersTabStripContainer;->clippingPath:Landroid/graphics/Path;

    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->clipPath(Landroid/graphics/Path;)Z

    .line 54
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->draw(Landroid/graphics/Canvas;)V

    .line 55
    return-void
.end method

.method protected onSizeChanged(IIII)V
    .locals 6
    .param p1, "w"    # I
    .param p2, "h"    # I
    .param p3, "oldw"    # I
    .param p4, "oldh"    # I

    .prologue
    .line 45
    invoke-super {p0, p1, p2, p3, p4}, Landroid/widget/FrameLayout;->onSizeChanged(IIII)V

    .line 46
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/StickersTabStripContainer;->clippingPath:Landroid/graphics/Path;

    invoke-virtual {v0}, Landroid/graphics/Path;->rewind()V

    .line 47
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/StickersTabStripContainer;->clippingRect:Landroid/graphics/RectF;

    invoke-virtual {p0}, Lcom/vk/attachpicker/stickers/StickersTabStripContainer;->getPaddingLeft()I

    move-result v1

    int-to-float v1, v1

    div-int/lit8 v2, p2, 0x2

    iget v3, p0, Lcom/vk/attachpicker/stickers/StickersTabStripContainer;->clipRadius:I

    sub-int/2addr v2, v3

    int-to-float v2, v2

    invoke-virtual {p0}, Lcom/vk/attachpicker/stickers/StickersTabStripContainer;->getPaddingRight()I

    move-result v3

    sub-int v3, p1, v3

    int-to-float v3, v3

    div-int/lit8 v4, p2, 0x2

    iget v5, p0, Lcom/vk/attachpicker/stickers/StickersTabStripContainer;->clipRadius:I

    add-int/2addr v4, v5

    int-to-float v4, v4

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/RectF;->set(FFFF)V

    .line 48
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/StickersTabStripContainer;->clippingPath:Landroid/graphics/Path;

    iget-object v1, p0, Lcom/vk/attachpicker/stickers/StickersTabStripContainer;->clippingRect:Landroid/graphics/RectF;

    iget v2, p0, Lcom/vk/attachpicker/stickers/StickersTabStripContainer;->clipRadius:I

    int-to-float v2, v2

    iget v3, p0, Lcom/vk/attachpicker/stickers/StickersTabStripContainer;->clipRadius:I

    int-to-float v3, v3

    sget-object v4, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/Path;->addRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Path$Direction;)V

    .line 49
    return-void
.end method
