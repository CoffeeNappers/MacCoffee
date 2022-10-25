.class public Lcom/vk/attachpicker/stickers/StickersTabStrip;
.super Landroid/widget/HorizontalScrollView;
.source "StickersTabStrip.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/attachpicker/stickers/StickersTabStrip$ScrollSlidingTabStripDelegate;
    }
.end annotation


# instance fields
.field private currentPosition:I

.field private delegate:Lcom/vk/attachpicker/stickers/StickersTabStrip$ScrollSlidingTabStripDelegate;

.field private indicatorColor:I

.field private lastScrollX:I

.field private rectPaint:Landroid/graphics/Paint;

.field private scrollOffset:I

.field private selectionRadius:I

.field private tabCount:I

.field private tabsContainer:Landroid/widget/LinearLayout;

.field private underlineColor:I

.field private underlineHeight:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v3, 0x1

    const/4 v2, -0x1

    const/4 v1, 0x0

    .line 50
    invoke-direct {p0, p1}, Landroid/widget/HorizontalScrollView;-><init>(Landroid/content/Context;)V

    .line 36
    iput v1, p0, Lcom/vk/attachpicker/stickers/StickersTabStrip;->currentPosition:I

    .line 40
    const v0, -0x191715

    iput v0, p0, Lcom/vk/attachpicker/stickers/StickersTabStrip;->indicatorColor:I

    .line 41
    iput v1, p0, Lcom/vk/attachpicker/stickers/StickersTabStrip;->underlineColor:I

    .line 42
    const/16 v0, 0x14

    invoke-static {v0}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v0

    iput v0, p0, Lcom/vk/attachpicker/stickers/StickersTabStrip;->selectionRadius:I

    .line 44
    const/16 v0, 0x34

    invoke-static {v0}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v0

    iput v0, p0, Lcom/vk/attachpicker/stickers/StickersTabStrip;->scrollOffset:I

    .line 45
    const/4 v0, 0x2

    invoke-static {v0}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v0

    iput v0, p0, Lcom/vk/attachpicker/stickers/StickersTabStrip;->underlineHeight:I

    .line 47
    iput v1, p0, Lcom/vk/attachpicker/stickers/StickersTabStrip;->lastScrollX:I

    .line 52
    invoke-virtual {p0, v3}, Lcom/vk/attachpicker/stickers/StickersTabStrip;->setFillViewport(Z)V

    .line 53
    invoke-virtual {p0, v1}, Lcom/vk/attachpicker/stickers/StickersTabStrip;->setWillNotDraw(Z)V

    .line 55
    invoke-virtual {p0, v1}, Lcom/vk/attachpicker/stickers/StickersTabStrip;->setHorizontalScrollBarEnabled(Z)V

    .line 56
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/vk/attachpicker/stickers/StickersTabStrip;->tabsContainer:Landroid/widget/LinearLayout;

    .line 57
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/StickersTabStrip;->tabsContainer:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 58
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/StickersTabStrip;->tabsContainer:Landroid/widget/LinearLayout;

    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v1, v2, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 59
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/StickersTabStrip;->tabsContainer:Landroid/widget/LinearLayout;

    invoke-virtual {p0, v0}, Lcom/vk/attachpicker/stickers/StickersTabStrip;->addView(Landroid/view/View;)V

    .line 61
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/vk/attachpicker/stickers/StickersTabStrip;->rectPaint:Landroid/graphics/Paint;

    .line 62
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/StickersTabStrip;->rectPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 63
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/StickersTabStrip;->rectPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 64
    return-void
.end method

.method static synthetic access$000(Lcom/vk/attachpicker/stickers/StickersTabStrip;)Lcom/vk/attachpicker/stickers/StickersTabStrip$ScrollSlidingTabStripDelegate;
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/stickers/StickersTabStrip;

    .prologue
    .line 25
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/StickersTabStrip;->delegate:Lcom/vk/attachpicker/stickers/StickersTabStrip$ScrollSlidingTabStripDelegate;

    return-object v0
.end method

.method private scrollToChild(I)V
    .locals 6
    .param p1, "position"    # I

    .prologue
    const/4 v5, 0x0

    .line 133
    iget v2, p0, Lcom/vk/attachpicker/stickers/StickersTabStrip;->tabCount:I

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/vk/attachpicker/stickers/StickersTabStrip;->tabsContainer:Landroid/widget/LinearLayout;

    invoke-virtual {v2, p1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    if-nez v2, :cond_1

    .line 150
    :cond_0
    :goto_0
    return-void

    .line 136
    :cond_1
    iget-object v2, p0, Lcom/vk/attachpicker/stickers/StickersTabStrip;->tabsContainer:Landroid/widget/LinearLayout;

    invoke-virtual {v2, p1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getLeft()I

    move-result v1

    .line 137
    .local v1, "newScrollX":I
    if-lez p1, :cond_2

    .line 138
    iget v2, p0, Lcom/vk/attachpicker/stickers/StickersTabStrip;->scrollOffset:I

    sub-int/2addr v1, v2

    .line 140
    :cond_2
    invoke-virtual {p0}, Lcom/vk/attachpicker/stickers/StickersTabStrip;->getScrollX()I

    move-result v0

    .line 141
    .local v0, "currentScrollX":I
    iget v2, p0, Lcom/vk/attachpicker/stickers/StickersTabStrip;->lastScrollX:I

    if-eq v1, v2, :cond_0

    .line 142
    if-ge v1, v0, :cond_3

    .line 143
    iput v1, p0, Lcom/vk/attachpicker/stickers/StickersTabStrip;->lastScrollX:I

    .line 144
    iget v2, p0, Lcom/vk/attachpicker/stickers/StickersTabStrip;->lastScrollX:I

    invoke-virtual {p0, v2, v5}, Lcom/vk/attachpicker/stickers/StickersTabStrip;->smoothScrollTo(II)V

    goto :goto_0

    .line 145
    :cond_3
    iget v2, p0, Lcom/vk/attachpicker/stickers/StickersTabStrip;->scrollOffset:I

    add-int/2addr v2, v1

    invoke-virtual {p0}, Lcom/vk/attachpicker/stickers/StickersTabStrip;->getWidth()I

    move-result v3

    add-int/2addr v3, v0

    iget v4, p0, Lcom/vk/attachpicker/stickers/StickersTabStrip;->scrollOffset:I

    mul-int/lit8 v4, v4, 0x2

    sub-int/2addr v3, v4

    if-le v2, v3, :cond_0

    .line 146
    invoke-virtual {p0}, Lcom/vk/attachpicker/stickers/StickersTabStrip;->getWidth()I

    move-result v2

    sub-int v2, v1, v2

    iget v3, p0, Lcom/vk/attachpicker/stickers/StickersTabStrip;->scrollOffset:I

    mul-int/lit8 v3, v3, 0x3

    add-int/2addr v2, v3

    iput v2, p0, Lcom/vk/attachpicker/stickers/StickersTabStrip;->lastScrollX:I

    .line 147
    iget v2, p0, Lcom/vk/attachpicker/stickers/StickersTabStrip;->lastScrollX:I

    invoke-virtual {p0, v2, v5}, Lcom/vk/attachpicker/stickers/StickersTabStrip;->smoothScrollTo(II)V

    goto :goto_0
.end method


# virtual methods
.method public addIconTab(I)V
    .locals 7
    .param p1, "resId"    # I

    .prologue
    const/16 v5, 0x30

    .line 84
    iget v1, p0, Lcom/vk/attachpicker/stickers/StickersTabStrip;->tabCount:I

    add-int/lit8 v3, v1, 0x1

    iput v3, p0, Lcom/vk/attachpicker/stickers/StickersTabStrip;->tabCount:I

    .line 85
    .local v1, "position":I
    new-instance v2, Landroid/widget/FrameLayout;

    invoke-virtual {p0}, Lcom/vk/attachpicker/stickers/StickersTabStrip;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 86
    .local v2, "tab":Landroid/widget/FrameLayout;
    invoke-static {}, Lcom/vkontakte/android/utils/OsUtil;->isAtLeastKLP()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 87
    invoke-virtual {p0}, Lcom/vk/attachpicker/stickers/StickersTabStrip;->getContext()Landroid/content/Context;

    move-result-object v3

    const v4, 0x7f020380

    invoke-static {v3, v4}, Landroid/support/v4/content/ContextCompat;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/FrameLayout;->setForeground(Landroid/graphics/drawable/Drawable;)V

    .line 89
    :cond_0
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/widget/FrameLayout;->setFocusable(Z)V

    .line 90
    new-instance v3, Lcom/vk/attachpicker/stickers/StickersTabStrip$1;

    invoke-direct {v3, p0, v1}, Lcom/vk/attachpicker/stickers/StickersTabStrip$1;-><init>(Lcom/vk/attachpicker/stickers/StickersTabStrip;I)V

    invoke-virtual {v2, v3}, Landroid/widget/FrameLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 99
    new-instance v0, Landroid/widget/ImageView;

    invoke-virtual {p0}, Lcom/vk/attachpicker/stickers/StickersTabStrip;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v0, v3}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 100
    .local v0, "imageView":Landroid/widget/ImageView;
    const v3, 0x7f0f00ba

    invoke-static {v3}, Lcom/vk/attachpicker/Picker;->color(I)I

    move-result v3

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setColorFilter(I)V

    .line 101
    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 102
    sget-object v3, Landroid/widget/ImageView$ScaleType;->CENTER_INSIDE:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 103
    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;

    invoke-static {v5}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v4

    invoke-static {v5}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v5

    const/16 v6, 0x11

    invoke-direct {v3, v4, v5, v6}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {v2, v0, v3}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 105
    iget-object v3, p0, Lcom/vk/attachpicker/stickers/StickersTabStrip;->tabsContainer:Landroid/widget/LinearLayout;

    invoke-virtual {v3, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 106
    return-void
.end method

.method public addStickerTab(Lcom/vkontakte/android/data/orm/StickerStockItem;)V
    .locals 7
    .param p1, "sticker"    # Lcom/vkontakte/android/data/orm/StickerStockItem;

    .prologue
    const/16 v6, 0x30

    const/4 v3, 0x1

    .line 109
    iget v1, p0, Lcom/vk/attachpicker/stickers/StickersTabStrip;->tabCount:I

    add-int/lit8 v4, v1, 0x1

    iput v4, p0, Lcom/vk/attachpicker/stickers/StickersTabStrip;->tabCount:I

    .line 110
    .local v1, "position":I
    new-instance v2, Landroid/widget/FrameLayout;

    invoke-virtual {p0}, Lcom/vk/attachpicker/stickers/StickersTabStrip;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v2, v4}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 111
    .local v2, "tab":Landroid/widget/FrameLayout;
    invoke-static {}, Lcom/vkontakte/android/utils/OsUtil;->isAtLeastKLP()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 112
    invoke-virtual {p0}, Lcom/vk/attachpicker/stickers/StickersTabStrip;->getContext()Landroid/content/Context;

    move-result-object v4

    const v5, 0x7f020380

    invoke-static {v4, v5}, Landroid/support/v4/content/ContextCompat;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/widget/FrameLayout;->setForeground(Landroid/graphics/drawable/Drawable;)V

    .line 114
    :cond_0
    invoke-virtual {v2, v3}, Landroid/widget/FrameLayout;->setFocusable(Z)V

    .line 115
    new-instance v4, Lcom/vk/attachpicker/stickers/StickersTabStrip$2;

    invoke-direct {v4, p0, v1}, Lcom/vk/attachpicker/stickers/StickersTabStrip$2;-><init>(Lcom/vk/attachpicker/stickers/StickersTabStrip;I)V

    invoke-virtual {v2, v4}, Landroid/widget/FrameLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 122
    iget-object v4, p0, Lcom/vk/attachpicker/stickers/StickersTabStrip;->tabsContainer:Landroid/widget/LinearLayout;

    invoke-virtual {v4, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 123
    iget v4, p0, Lcom/vk/attachpicker/stickers/StickersTabStrip;->currentPosition:I

    if-ne v1, v4, :cond_1

    :goto_0
    invoke-virtual {v2, v3}, Landroid/widget/FrameLayout;->setSelected(Z)V

    .line 124
    new-instance v0, Lcom/vk/imageloader/view/VKImageView;

    invoke-virtual {p0}, Lcom/vk/attachpicker/stickers/StickersTabStrip;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v0, v3}, Lcom/vk/imageloader/view/VKImageView;-><init>(Landroid/content/Context;)V

    .line 125
    .local v0, "imageView":Lcom/vk/imageloader/view/VKImageView;
    invoke-virtual {v0}, Lcom/vk/imageloader/view/VKImageView;->getHierarchy()Lcom/facebook/drawee/interfaces/DraweeHierarchy;

    move-result-object v3

    check-cast v3, Lcom/facebook/drawee/generic/GenericDraweeHierarchy;

    sget-object v4, Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;->CENTER_INSIDE:Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;

    invoke-virtual {v3, v4}, Lcom/facebook/drawee/generic/GenericDraweeHierarchy;->setActualImageScaleType(Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;)V

    .line 126
    invoke-virtual {p1}, Lcom/vkontakte/android/data/orm/StickerStockItem;->getServerIconURL()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    .line 128
    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;

    invoke-static {v6}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v4

    invoke-static {v6}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v5

    const/16 v6, 0x11

    invoke-direct {v3, v4, v5, v6}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {v2, v0, v3}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 129
    return-void

    .line 123
    .end local v0    # "imageView":Lcom/vk/imageloader/view/VKImageView;
    :cond_1
    const/4 v3, 0x0

    goto :goto_0
.end method

.method public getCurrentPosition()I
    .locals 1

    .prologue
    .line 184
    iget v0, p0, Lcom/vk/attachpicker/stickers/StickersTabStrip;->currentPosition:I

    return v0
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 10
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 159
    invoke-super {p0, p1}, Landroid/widget/HorizontalScrollView;->onDraw(Landroid/graphics/Canvas;)V

    .line 161
    invoke-virtual {p0}, Lcom/vk/attachpicker/stickers/StickersTabStrip;->isInEditMode()Z

    move-result v0

    if-nez v0, :cond_0

    iget v0, p0, Lcom/vk/attachpicker/stickers/StickersTabStrip;->tabCount:I

    if-nez v0, :cond_1

    .line 181
    :cond_0
    :goto_0
    return-void

    .line 165
    :cond_1
    invoke-virtual {p0}, Lcom/vk/attachpicker/stickers/StickersTabStrip;->getHeight()I

    move-result v7

    .line 167
    .local v7, "height":I
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/StickersTabStrip;->rectPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/vk/attachpicker/stickers/StickersTabStrip;->underlineColor:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 168
    const/4 v1, 0x0

    iget v0, p0, Lcom/vk/attachpicker/stickers/StickersTabStrip;->underlineHeight:I

    sub-int v0, v7, v0

    int-to-float v2, v0

    iget-object v0, p0, Lcom/vk/attachpicker/stickers/StickersTabStrip;->tabsContainer:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getWidth()I

    move-result v0

    int-to-float v3, v0

    int-to-float v4, v7

    iget-object v5, p0, Lcom/vk/attachpicker/stickers/StickersTabStrip;->rectPaint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 170
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/StickersTabStrip;->tabsContainer:Landroid/widget/LinearLayout;

    iget v1, p0, Lcom/vk/attachpicker/stickers/StickersTabStrip;->currentPosition:I

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    .line 171
    .local v6, "currentTab":Landroid/view/View;
    const/4 v8, 0x0

    .line 172
    .local v8, "lineLeft":F
    const/4 v9, 0x0

    .line 173
    .local v9, "lineRight":F
    if-eqz v6, :cond_2

    .line 174
    invoke-virtual {v6}, Landroid/view/View;->getLeft()I

    move-result v0

    int-to-float v8, v0

    .line 175
    invoke-virtual {v6}, Landroid/view/View;->getRight()I

    move-result v0

    int-to-float v9, v0

    .line 178
    :cond_2
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/StickersTabStrip;->rectPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/vk/attachpicker/stickers/StickersTabStrip;->indicatorColor:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 179
    sub-float v0, v9, v8

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr v0, v1

    add-float/2addr v0, v8

    invoke-virtual {p0}, Lcom/vk/attachpicker/stickers/StickersTabStrip;->getMeasuredHeight()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    invoke-virtual {p0}, Lcom/vk/attachpicker/stickers/StickersTabStrip;->getPaddingTop()I

    move-result v2

    sub-int/2addr v1, v2

    int-to-float v1, v1

    iget v2, p0, Lcom/vk/attachpicker/stickers/StickersTabStrip;->selectionRadius:I

    int-to-float v2, v2

    iget-object v3, p0, Lcom/vk/attachpicker/stickers/StickersTabStrip;->rectPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    goto :goto_0
.end method

.method public onPageScrolled(II)V
    .locals 7
    .param p1, "position"    # I
    .param p2, "first"    # I

    .prologue
    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 188
    iget v3, p0, Lcom/vk/attachpicker/stickers/StickersTabStrip;->currentPosition:I

    if-ne v3, p1, :cond_1

    .line 209
    :cond_0
    :goto_0
    return-void

    .line 191
    :cond_1
    iput p1, p0, Lcom/vk/attachpicker/stickers/StickersTabStrip;->currentPosition:I

    .line 192
    iget-object v3, p0, Lcom/vk/attachpicker/stickers/StickersTabStrip;->tabsContainer:Landroid/widget/LinearLayout;

    invoke-virtual {v3}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v3

    if-ge p1, v3, :cond_0

    .line 195
    const/4 v0, 0x0

    .local v0, "a":I
    :goto_1
    iget-object v3, p0, Lcom/vk/attachpicker/stickers/StickersTabStrip;->tabsContainer:Landroid/widget/LinearLayout;

    invoke-virtual {v3}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v3

    if-ge v0, v3, :cond_5

    .line 196
    iget-object v3, p0, Lcom/vk/attachpicker/stickers/StickersTabStrip;->tabsContainer:Landroid/widget/LinearLayout;

    invoke-virtual {v3, v0}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/FrameLayout;

    .line 197
    .local v1, "fl":Landroid/widget/FrameLayout;
    if-ne v0, p1, :cond_3

    move v3, v4

    :goto_2
    invoke-virtual {v1, v3}, Landroid/widget/FrameLayout;->setSelected(Z)V

    .line 198
    invoke-virtual {v1, v5}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 199
    .local v2, "v":Landroid/view/View;
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    const-class v6, Landroid/widget/ImageView;

    if-ne v3, v6, :cond_2

    .line 200
    check-cast v2, Landroid/widget/ImageView;

    .end local v2    # "v":Landroid/view/View;
    if-ne v0, p1, :cond_4

    const v3, -0xae7434

    :goto_3
    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setColorFilter(I)V

    .line 195
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_3
    move v3, v5

    .line 197
    goto :goto_2

    .line 200
    :cond_4
    const v3, -0x6f6b67

    goto :goto_3

    .line 203
    .end local v1    # "fl":Landroid/widget/FrameLayout;
    :cond_5
    if-ne p2, p1, :cond_6

    if-le p1, v4, :cond_6

    .line 204
    add-int/lit8 v3, p1, -0x1

    invoke-direct {p0, v3}, Lcom/vk/attachpicker/stickers/StickersTabStrip;->scrollToChild(I)V

    .line 208
    :goto_4
    invoke-virtual {p0}, Lcom/vk/attachpicker/stickers/StickersTabStrip;->invalidate()V

    goto :goto_0

    .line 206
    :cond_6
    invoke-direct {p0, p1}, Lcom/vk/attachpicker/stickers/StickersTabStrip;->scrollToChild(I)V

    goto :goto_4
.end method

.method protected onScrollChanged(IIII)V
    .locals 0
    .param p1, "l"    # I
    .param p2, "t"    # I
    .param p3, "oldl"    # I
    .param p4, "oldt"    # I

    .prologue
    .line 154
    invoke-super {p0, p1, p2, p3, p4}, Landroid/widget/HorizontalScrollView;->onScrollChanged(IIII)V

    .line 155
    return-void
.end method

.method public removeTabs()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 71
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/StickersTabStrip;->tabsContainer:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 72
    iput v1, p0, Lcom/vk/attachpicker/stickers/StickersTabStrip;->tabCount:I

    .line 73
    iput v1, p0, Lcom/vk/attachpicker/stickers/StickersTabStrip;->currentPosition:I

    .line 74
    return-void
.end method

.method public selectTab(I)V
    .locals 1
    .param p1, "num"    # I

    .prologue
    .line 77
    if-ltz p1, :cond_0

    iget v0, p0, Lcom/vk/attachpicker/stickers/StickersTabStrip;->tabCount:I

    add-int/lit8 v0, v0, -0x1

    if-lt p1, v0, :cond_1

    .line 81
    :cond_0
    :goto_0
    return-void

    .line 80
    :cond_1
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/vk/attachpicker/stickers/StickersTabStrip;->onPageScrolled(II)V

    goto :goto_0
.end method

.method public setDelegate(Lcom/vk/attachpicker/stickers/StickersTabStrip$ScrollSlidingTabStripDelegate;)V
    .locals 0
    .param p1, "scrollSlidingTabStripDelegate"    # Lcom/vk/attachpicker/stickers/StickersTabStrip$ScrollSlidingTabStripDelegate;

    .prologue
    .line 67
    iput-object p1, p0, Lcom/vk/attachpicker/stickers/StickersTabStrip;->delegate:Lcom/vk/attachpicker/stickers/StickersTabStrip$ScrollSlidingTabStripDelegate;

    .line 68
    return-void
.end method

.method public setIndicatorColor(I)V
    .locals 0
    .param p1, "indicatorColor"    # I

    .prologue
    .line 212
    iput p1, p0, Lcom/vk/attachpicker/stickers/StickersTabStrip;->indicatorColor:I

    .line 213
    invoke-virtual {p0}, Lcom/vk/attachpicker/stickers/StickersTabStrip;->invalidate()V

    .line 214
    return-void
.end method

.method public setUnderlineColor(I)V
    .locals 0
    .param p1, "underlineColor"    # I

    .prologue
    .line 217
    iput p1, p0, Lcom/vk/attachpicker/stickers/StickersTabStrip;->underlineColor:I

    .line 218
    invoke-virtual {p0}, Lcom/vk/attachpicker/stickers/StickersTabStrip;->invalidate()V

    .line 219
    return-void
.end method

.method public setUnderlineColorResource(I)V
    .locals 1
    .param p1, "resId"    # I

    .prologue
    .line 222
    invoke-virtual {p0}, Lcom/vk/attachpicker/stickers/StickersTabStrip;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    iput v0, p0, Lcom/vk/attachpicker/stickers/StickersTabStrip;->underlineColor:I

    .line 223
    invoke-virtual {p0}, Lcom/vk/attachpicker/stickers/StickersTabStrip;->invalidate()V

    .line 224
    return-void
.end method

.method public setUnderlineHeight(I)V
    .locals 0
    .param p1, "underlineHeightPx"    # I

    .prologue
    .line 227
    iput p1, p0, Lcom/vk/attachpicker/stickers/StickersTabStrip;->underlineHeight:I

    .line 228
    invoke-virtual {p0}, Lcom/vk/attachpicker/stickers/StickersTabStrip;->invalidate()V

    .line 229
    return-void
.end method
