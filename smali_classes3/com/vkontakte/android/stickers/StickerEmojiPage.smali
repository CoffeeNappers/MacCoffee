.class Lcom/vkontakte/android/stickers/StickerEmojiPage;
.super Lcom/vkontakte/android/stickers/StickersViewPage;
.source "StickerEmojiPage.java"


# instance fields
.field bottomTabsVisible:Z

.field currentTabsAnimation:Landroid/animation/ObjectAnimator;

.field final mListener:Lcom/vk/emoji/EmojiKeyboardListener;

.field mScrollListener:Landroid/support/v7/widget/RecyclerView$OnScrollListener;

.field final mTitleDrawable:Landroid/graphics/drawable/Drawable;

.field mView:Lcom/vk/emoji/EmojiKeyboardView;


# direct methods
.method constructor <init>(Landroid/content/Context;Lcom/vk/emoji/EmojiKeyboardListener;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "listener"    # Lcom/vk/emoji/EmojiKeyboardListener;

    .prologue
    .line 35
    invoke-direct {p0}, Lcom/vkontakte/android/stickers/StickersViewPage;-><init>()V

    .line 36
    iput-object p2, p0, Lcom/vkontakte/android/stickers/StickerEmojiPage;->mListener:Lcom/vk/emoji/EmojiKeyboardListener;

    .line 37
    new-instance v0, Lcom/vkontakte/android/ui/drawable/RecoloredDrawable;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f020291

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    const v2, -0x726c67

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/ui/drawable/RecoloredDrawable;-><init>(Landroid/graphics/drawable/Drawable;I)V

    iput-object v0, p0, Lcom/vkontakte/android/stickers/StickerEmojiPage;->mTitleDrawable:Landroid/graphics/drawable/Drawable;

    .line 38
    iget-object v0, p0, Lcom/vkontakte/android/stickers/StickerEmojiPage;->mTitleDrawable:Landroid/graphics/drawable/Drawable;

    const/16 v1, 0xbf

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 39
    return-void
.end method


# virtual methods
.method public attachToScroll(Landroid/support/v7/widget/RecyclerView$OnScrollListener;)Lcom/vkontakte/android/stickers/StickerEmojiPage;
    .locals 0
    .param p1, "l"    # Landroid/support/v7/widget/RecyclerView$OnScrollListener;

    .prologue
    .line 42
    iput-object p1, p0, Lcom/vkontakte/android/stickers/StickerEmojiPage;->mScrollListener:Landroid/support/v7/widget/RecyclerView$OnScrollListener;

    .line 43
    return-object p0
.end method

.method getIconURL()Ljava/lang/String;
    .locals 1

    .prologue
    .line 64
    const/4 v0, 0x0

    return-object v0
.end method

.method getId()I
    .locals 1

    .prologue
    .line 96
    const/4 v0, -0x1

    return v0
.end method

.method getServerBackgroundURL()Ljava/lang/String;
    .locals 1

    .prologue
    .line 74
    const/4 v0, 0x0

    return-object v0
.end method

.method getTitleDrawable()Landroid/graphics/drawable/Drawable;
    .locals 1

    .prologue
    .line 69
    iget-object v0, p0, Lcom/vkontakte/android/stickers/StickerEmojiPage;->mTitleDrawable:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method getView(Landroid/content/Context;)Landroid/view/View;
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v2, 0x0

    .line 48
    iget-object v1, p0, Lcom/vkontakte/android/stickers/StickerEmojiPage;->mView:Lcom/vk/emoji/EmojiKeyboardView;

    if-nez v1, :cond_0

    .line 49
    new-instance v0, Lcom/vk/emoji/EmojiKeyboardView;

    invoke-direct {v0, p1}, Lcom/vk/emoji/EmojiKeyboardView;-><init>(Landroid/content/Context;)V

    .line 50
    .local v0, "view":Lcom/vk/emoji/EmojiKeyboardView;
    invoke-static {}, Lcom/vk/attachpicker/util/Fonts;->getRobotoMedium()Landroid/graphics/Typeface;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/emoji/EmojiKeyboardView;->setHeadersTypeface(Landroid/graphics/Typeface;)V

    .line 51
    iget-object v1, p0, Lcom/vkontakte/android/stickers/StickerEmojiPage;->mListener:Lcom/vk/emoji/EmojiKeyboardListener;

    invoke-virtual {v0, v1}, Lcom/vk/emoji/EmojiKeyboardView;->setEmojiKeyboardListener(Lcom/vk/emoji/EmojiKeyboardListener;)V

    .line 52
    iget-object v1, p0, Lcom/vkontakte/android/stickers/StickerEmojiPage;->mScrollListener:Landroid/support/v7/widget/RecyclerView$OnScrollListener;

    invoke-virtual {v0, v1}, Lcom/vk/emoji/EmojiKeyboardView;->setOnScrollListener(Landroid/support/v7/widget/RecyclerView$OnScrollListener;)V

    .line 53
    const v1, -0x3b3734

    invoke-virtual {v0, v1}, Lcom/vk/emoji/EmojiKeyboardView;->setFastScrollBarColor(I)V

    .line 54
    const v1, 0x7f0f0018

    invoke-static {p1, v1}, Landroid/support/v4/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/vk/emoji/EmojiKeyboardView;->setFastScrollHandleColor(I)V

    .line 55
    iget-boolean v1, p0, Lcom/vkontakte/android/stickers/StickerEmojiPage;->bottomTabsVisible:Z

    if-eqz v1, :cond_1

    sget v1, Lcom/vkontakte/android/stickers/StickersView;->TABS_HEIGHT:I

    :goto_0
    invoke-virtual {v0, v2, v1}, Lcom/vk/emoji/EmojiKeyboardView;->setFastScrollPaddingTopAndBottom(II)V

    .line 56
    iput-object v0, p0, Lcom/vkontakte/android/stickers/StickerEmojiPage;->mView:Lcom/vk/emoji/EmojiKeyboardView;

    .line 58
    .end local v0    # "view":Lcom/vk/emoji/EmojiKeyboardView;
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/stickers/StickerEmojiPage;->mView:Lcom/vk/emoji/EmojiKeyboardView;

    invoke-virtual {v1}, Lcom/vk/emoji/EmojiKeyboardView;->updateRecents()V

    .line 59
    iget-object v1, p0, Lcom/vkontakte/android/stickers/StickerEmojiPage;->mView:Lcom/vk/emoji/EmojiKeyboardView;

    return-object v1

    .restart local v0    # "view":Lcom/vk/emoji/EmojiKeyboardView;
    :cond_1
    move v1, v2

    .line 55
    goto :goto_0
.end method

.method onBottomTabsVisibilityChanged(Z)V
    .locals 5
    .param p1, "visible"    # Z

    .prologue
    const/4 v1, 0x0

    .line 106
    iput-boolean p1, p0, Lcom/vkontakte/android/stickers/StickerEmojiPage;->bottomTabsVisible:Z

    .line 107
    iget-object v0, p0, Lcom/vkontakte/android/stickers/StickerEmojiPage;->mView:Lcom/vk/emoji/EmojiKeyboardView;

    if-eqz v0, :cond_1

    .line 108
    iget-object v0, p0, Lcom/vkontakte/android/stickers/StickerEmojiPage;->currentTabsAnimation:Landroid/animation/ObjectAnimator;

    if-eqz v0, :cond_0

    .line 109
    iget-object v0, p0, Lcom/vkontakte/android/stickers/StickerEmojiPage;->currentTabsAnimation:Landroid/animation/ObjectAnimator;

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->cancel()V

    .line 111
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/stickers/StickerEmojiPage;->mView:Lcom/vk/emoji/EmojiKeyboardView;

    invoke-virtual {v0}, Lcom/vk/emoji/EmojiKeyboardView;->getFastScroller()Lcom/vk/emoji/FastScroller;

    move-result-object v2

    sget-object v3, Lcom/vk/emoji/FastScroller;->PADDING_BOTTOM:Landroid/util/Property;

    const/4 v0, 0x1

    new-array v4, v0, [I

    iget-boolean v0, p0, Lcom/vkontakte/android/stickers/StickerEmojiPage;->bottomTabsVisible:Z

    if-eqz v0, :cond_2

    sget v0, Lcom/vkontakte/android/stickers/StickersView;->TABS_HEIGHT:I

    :goto_0
    aput v0, v4, v1

    invoke-static {v2, v3, v4}, Landroid/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Landroid/util/Property;[I)Landroid/animation/ObjectAnimator;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/stickers/StickerEmojiPage;->currentTabsAnimation:Landroid/animation/ObjectAnimator;

    .line 112
    iget-object v0, p0, Lcom/vkontakte/android/stickers/StickerEmojiPage;->currentTabsAnimation:Landroid/animation/ObjectAnimator;

    sget-object v1, Lcom/vkontakte/android/stickers/StickersView;->mInterpolator:Landroid/view/animation/Interpolator;

    invoke-virtual {v0, v1}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 113
    iget-object v0, p0, Lcom/vkontakte/android/stickers/StickerEmojiPage;->currentTabsAnimation:Landroid/animation/ObjectAnimator;

    const-wide/16 v2, 0xc8

    invoke-virtual {v0, v2, v3}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 114
    iget-object v0, p0, Lcom/vkontakte/android/stickers/StickerEmojiPage;->currentTabsAnimation:Landroid/animation/ObjectAnimator;

    new-instance v1, Lcom/vkontakte/android/stickers/StickerEmojiPage$1;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/stickers/StickerEmojiPage$1;-><init>(Lcom/vkontakte/android/stickers/StickerEmojiPage;)V

    invoke-virtual {v0, v1}, Landroid/animation/ObjectAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 120
    iget-object v0, p0, Lcom/vkontakte/android/stickers/StickerEmojiPage;->currentTabsAnimation:Landroid/animation/ObjectAnimator;

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    .line 122
    :cond_1
    return-void

    :cond_2
    move v0, v1

    .line 111
    goto :goto_0
.end method

.method onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 1
    .param p1, "newConfig"    # Landroid/content/res/Configuration;

    .prologue
    .line 84
    iget-object v0, p0, Lcom/vkontakte/android/stickers/StickerEmojiPage;->mView:Lcom/vk/emoji/EmojiKeyboardView;

    if-eqz v0, :cond_0

    .line 85
    iget-object v0, p0, Lcom/vkontakte/android/stickers/StickerEmojiPage;->mView:Lcom/vk/emoji/EmojiKeyboardView;

    invoke-virtual {v0, p1}, Lcom/vk/emoji/EmojiKeyboardView;->dispatchConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 87
    :cond_0
    return-void
.end method

.method releaseView()V
    .locals 0

    .prologue
    .line 80
    return-void
.end method

.method reload()V
    .locals 0

    .prologue
    .line 102
    return-void
.end method

.method reload(Lcom/vkontakte/android/data/orm/StickerStockItem;)V
    .locals 0
    .param p1, "item"    # Lcom/vkontakte/android/data/orm/StickerStockItem;

    .prologue
    .line 92
    return-void
.end method
