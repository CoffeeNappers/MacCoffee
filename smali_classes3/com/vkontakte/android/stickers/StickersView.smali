.class public Lcom/vkontakte/android/stickers/StickersView;
.super Landroid/widget/RelativeLayout;
.source "StickersView.java"

# interfaces
.implements Lcom/vkontakte/android/ui/ActivityResulter;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/stickers/StickersView$Listener;,
        Lcom/vkontakte/android/stickers/StickersView$TabsShower;,
        Lcom/vkontakte/android/stickers/StickersView$StickersPagerAdapter;,
        Lcom/vkontakte/android/stickers/StickersView$BackspaceTouchListener;
    }
.end annotation


# static fields
.field public static final BACKSPACE_WIDTH:I = 0x38

.field static final TABS_HEIGHT:I

.field static final TABS_WIDTH:I

.field public static final TRANSLATE_DURATION_MILLIS:I = 0xc8

.field public static final mInterpolator:Landroid/view/animation/Interpolator;

.field private static final stickers:Lcom/vkontakte/android/stickers/Stickers;


# instance fields
.field private adapter:Lcom/vkontakte/android/stickers/StickersView$StickersPagerAdapter;

.field private counterTextView:Landroid/widget/TextView;

.field private mBackground:Lcom/vkontakte/android/stickers/StickersBackgroundView;

.field private final mBackspace:Landroid/view/View;

.field private final mData:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/stickers/StickersViewPage;",
            ">;"
        }
    .end annotation
.end field

.field private mInit:Z

.field private final mListener:Lcom/vkontakte/android/stickers/StickersView$Listener;

.field private final mManager:Lcom/vkontakte/android/data/PurchasesManager;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/data/PurchasesManager",
            "<",
            "Lcom/vkontakte/android/data/orm/StickerStockItem;",
            ">;"
        }
    .end annotation
.end field

.field private mPackToOpen:I

.field private final mReceiver:Landroid/content/BroadcastReceiver;

.field private mShower:Lcom/vkontakte/android/stickers/StickersView$TabsShower;

.field private mTabsVisible:Z

.field private final pager:Landroid/support/v4/view/ViewPager;

.field private final tabbar:Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;

.field private final tabsWrap:Landroid/view/ViewGroup;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 62
    invoke-static {}, Lcom/vkontakte/android/stickers/Stickers;->get()Lcom/vkontakte/android/stickers/Stickers;

    move-result-object v0

    sput-object v0, Lcom/vkontakte/android/stickers/StickersView;->stickers:Lcom/vkontakte/android/stickers/Stickers;

    .line 63
    new-instance v0, Landroid/view/animation/AccelerateDecelerateInterpolator;

    invoke-direct {v0}, Landroid/view/animation/AccelerateDecelerateInterpolator;-><init>()V

    sput-object v0, Lcom/vkontakte/android/stickers/StickersView;->mInterpolator:Landroid/view/animation/Interpolator;

    .line 66
    const/high16 v0, 0x42340000    # 45.0f

    invoke-static {v0}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v0

    sput v0, Lcom/vkontakte/android/stickers/StickersView;->TABS_HEIGHT:I

    .line 67
    const/high16 v0, 0x42600000    # 56.0f

    invoke-static {v0}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v0

    sput v0, Lcom/vkontakte/android/stickers/StickersView;->TABS_WIDTH:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/vkontakte/android/stickers/StickersView$Listener;)V
    .locals 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "listener"    # Lcom/vkontakte/android/stickers/StickersView$Listener;

    .prologue
    const/4 v6, -0x1

    .line 130
    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 75
    new-instance v2, Lcom/vkontakte/android/stickers/StickersView$TabsShower;

    invoke-direct {v2, p0}, Lcom/vkontakte/android/stickers/StickersView$TabsShower;-><init>(Lcom/vkontakte/android/stickers/StickersView;)V

    iput-object v2, p0, Lcom/vkontakte/android/stickers/StickersView;->mShower:Lcom/vkontakte/android/stickers/StickersView$TabsShower;

    .line 77
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lcom/vkontakte/android/stickers/StickersView;->mData:Ljava/util/List;

    .line 78
    new-instance v2, Lcom/vkontakte/android/stickers/StickersView$1;

    invoke-direct {v2, p0}, Lcom/vkontakte/android/stickers/StickersView$1;-><init>(Lcom/vkontakte/android/stickers/StickersView;)V

    iput-object v2, p0, Lcom/vkontakte/android/stickers/StickersView;->mReceiver:Landroid/content/BroadcastReceiver;

    .line 122
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/vkontakte/android/stickers/StickersView;->mTabsVisible:Z

    .line 125
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/vkontakte/android/stickers/StickersView;->mInit:Z

    .line 126
    iput v6, p0, Lcom/vkontakte/android/stickers/StickersView;->mPackToOpen:I

    .line 131
    new-instance v2, Lcom/vkontakte/android/data/PurchasesManager;

    invoke-static {p1}, Lcom/vkontakte/android/utils/Utils;->castToActivity(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/vkontakte/android/data/PurchasesManager;-><init>(Landroid/app/Activity;)V

    iput-object v2, p0, Lcom/vkontakte/android/stickers/StickersView;->mManager:Lcom/vkontakte/android/data/PurchasesManager;

    .line 132
    iput-object p2, p0, Lcom/vkontakte/android/stickers/StickersView;->mListener:Lcom/vkontakte/android/stickers/StickersView$Listener;

    .line 133
    iget-object v2, p0, Lcom/vkontakte/android/stickers/StickersView;->mData:Ljava/util/List;

    new-instance v3, Lcom/vkontakte/android/stickers/StickerEmojiPage;

    invoke-virtual {p0}, Lcom/vkontakte/android/stickers/StickersView;->getContext()Landroid/content/Context;

    move-result-object v4

    iget-object v5, p0, Lcom/vkontakte/android/stickers/StickersView;->mListener:Lcom/vkontakte/android/stickers/StickersView$Listener;

    invoke-direct {v3, v4, v5}, Lcom/vkontakte/android/stickers/StickerEmojiPage;-><init>(Landroid/content/Context;Lcom/vk/emoji/EmojiKeyboardListener;)V

    iget-object v4, p0, Lcom/vkontakte/android/stickers/StickersView;->mShower:Lcom/vkontakte/android/stickers/StickersView$TabsShower;

    invoke-virtual {v3, v4}, Lcom/vkontakte/android/stickers/StickerEmojiPage;->attachToScroll(Landroid/support/v7/widget/RecyclerView$OnScrollListener;)Lcom/vkontakte/android/stickers/StickerEmojiPage;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 134
    iget-object v2, p0, Lcom/vkontakte/android/stickers/StickersView;->mData:Ljava/util/List;

    new-instance v3, Lcom/vkontakte/android/stickers/StickerRecentsPage;

    invoke-virtual {p0}, Lcom/vkontakte/android/stickers/StickersView;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/vkontakte/android/stickers/StickerRecentsPage;-><init>(Landroid/content/Context;)V

    iget-object v4, p0, Lcom/vkontakte/android/stickers/StickersView;->mShower:Lcom/vkontakte/android/stickers/StickersView$TabsShower;

    invoke-virtual {v3, v4}, Lcom/vkontakte/android/stickers/StickerRecentsPage;->attachToScroll(Landroid/support/v7/widget/RecyclerView$OnScrollListener;)Lcom/vkontakte/android/stickers/StickerRecentsPage;

    move-result-object v3

    iget-object v4, p0, Lcom/vkontakte/android/stickers/StickersView;->mListener:Lcom/vkontakte/android/stickers/StickersView$Listener;

    invoke-virtual {v3, v4}, Lcom/vkontakte/android/stickers/StickerRecentsPage;->listener(Lcom/vkontakte/android/stickers/StickersView$Listener;)Lcom/vkontakte/android/stickers/StickerRecentsPage;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 136
    invoke-direct {p0}, Lcom/vkontakte/android/stickers/StickersView;->createTabs()Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;

    move-result-object v2

    iput-object v2, p0, Lcom/vkontakte/android/stickers/StickersView;->tabbar:Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;

    .line 137
    iget-object v2, p0, Lcom/vkontakte/android/stickers/StickersView;->tabbar:Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;

    invoke-direct {p0}, Lcom/vkontakte/android/stickers/StickersView;->createStoreTabView()Landroid/view/View;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->addHeaderView(Landroid/view/View;)V

    .line 138
    iget-object v2, p0, Lcom/vkontakte/android/stickers/StickersView;->tabbar:Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;

    invoke-direct {p0}, Lcom/vkontakte/android/stickers/StickersView;->createSettingsTabView()Landroid/view/View;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->addFooterView(Landroid/view/View;)V

    .line 140
    invoke-direct {p0}, Lcom/vkontakte/android/stickers/StickersView;->createViewPager()Landroid/support/v4/view/ViewPager;

    move-result-object v2

    iput-object v2, p0, Lcom/vkontakte/android/stickers/StickersView;->pager:Landroid/support/v4/view/ViewPager;

    .line 141
    iget-object v2, p0, Lcom/vkontakte/android/stickers/StickersView;->tabbar:Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;

    iget-object v3, p0, Lcom/vkontakte/android/stickers/StickersView;->pager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v2, v3}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->setViewPager(Landroid/support/v4/view/ViewPager;)V

    .line 142
    iget-object v2, p0, Lcom/vkontakte/android/stickers/StickersView;->tabbar:Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;

    iget-object v3, p0, Lcom/vkontakte/android/stickers/StickersView;->mShower:Lcom/vkontakte/android/stickers/StickersView$TabsShower;

    invoke-virtual {v2, v3}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->addOnPageChangeListener(Landroid/support/v4/view/ViewPager$OnPageChangeListener;)V

    .line 143
    iget-object v2, p0, Lcom/vkontakte/android/stickers/StickersView;->tabbar:Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;

    const v3, 0x7f100081

    invoke-virtual {v2, v3}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->setId(I)V

    .line 144
    const v2, -0x14110e

    invoke-virtual {p0, v2}, Lcom/vkontakte/android/stickers/StickersView;->setBackgroundColor(I)V

    .line 146
    invoke-virtual {p0}, Lcom/vkontakte/android/stickers/StickersView;->createTabsWrap()Landroid/widget/RelativeLayout;

    move-result-object v2

    iput-object v2, p0, Lcom/vkontakte/android/stickers/StickersView;->tabsWrap:Landroid/view/ViewGroup;

    .line 147
    invoke-virtual {p0}, Lcom/vkontakte/android/stickers/StickersView;->createBackspaceButton()Landroid/widget/ImageView;

    move-result-object v2

    iput-object v2, p0, Lcom/vkontakte/android/stickers/StickersView;->mBackspace:Landroid/view/View;

    .line 149
    iget-object v2, p0, Lcom/vkontakte/android/stickers/StickersView;->tabsWrap:Landroid/view/ViewGroup;

    iget-object v3, p0, Lcom/vkontakte/android/stickers/StickersView;->tabbar:Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;

    new-instance v4, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v4, v6, v6}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v2, v3, v4}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 151
    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    const/high16 v2, 0x42600000    # 56.0f

    invoke-static {v2}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v2

    invoke-direct {v0, v2, v6}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 152
    .local v0, "backspaceParams":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v2, 0xb

    invoke-virtual {v0, v2}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 153
    iget-object v2, p0, Lcom/vkontakte/android/stickers/StickersView;->tabsWrap:Landroid/view/ViewGroup;

    iget-object v3, p0, Lcom/vkontakte/android/stickers/StickersView;->mBackspace:Landroid/view/View;

    invoke-virtual {v2, v3, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 156
    iget-object v2, p0, Lcom/vkontakte/android/stickers/StickersView;->mBackground:Lcom/vkontakte/android/stickers/StickersBackgroundView;

    new-instance v3, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v3, v6, v6}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p0, v2, v3}, Lcom/vkontakte/android/stickers/StickersView;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 157
    iget-object v2, p0, Lcom/vkontakte/android/stickers/StickersView;->pager:Landroid/support/v4/view/ViewPager;

    new-instance v3, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v3, v6, v6}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p0, v2, v3}, Lcom/vkontakte/android/stickers/StickersView;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 159
    new-instance v1, Landroid/widget/RelativeLayout$LayoutParams;

    sget v2, Lcom/vkontakte/android/stickers/StickersView;->TABS_HEIGHT:I

    const/high16 v3, 0x40400000    # 3.0f

    invoke-static {v3}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v3

    add-int/2addr v2, v3

    invoke-direct {v1, v6, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 160
    .local v1, "tabsParams":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v2, 0xc

    invoke-virtual {v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 161
    iget-object v2, p0, Lcom/vkontakte/android/stickers/StickersView;->tabsWrap:Landroid/view/ViewGroup;

    invoke-virtual {p0, v2, v1}, Lcom/vkontakte/android/stickers/StickersView;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 162
    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/stickers/StickersView;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/stickers/StickersView;

    .prologue
    .line 59
    invoke-direct {p0}, Lcom/vkontakte/android/stickers/StickersView;->updateData()V

    return-void
.end method

.method static synthetic access$100(Lcom/vkontakte/android/stickers/StickersView;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/stickers/StickersView;

    .prologue
    .line 59
    iget-object v0, p0, Lcom/vkontakte/android/stickers/StickersView;->mData:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$200()Lcom/vkontakte/android/stickers/Stickers;
    .locals 1

    .prologue
    .line 59
    sget-object v0, Lcom/vkontakte/android/stickers/StickersView;->stickers:Lcom/vkontakte/android/stickers/Stickers;

    return-object v0
.end method

.method static synthetic access$300(Lcom/vkontakte/android/stickers/StickersView;I)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/stickers/StickersView;
    .param p1, "x1"    # I

    .prologue
    .line 59
    invoke-direct {p0, p1}, Lcom/vkontakte/android/stickers/StickersView;->setNumberNew(I)V

    return-void
.end method

.method static synthetic access$700(Lcom/vkontakte/android/stickers/StickersView;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/stickers/StickersView;

    .prologue
    .line 59
    iget-boolean v0, p0, Lcom/vkontakte/android/stickers/StickersView;->mTabsVisible:Z

    return v0
.end method

.method static synthetic access$702(Lcom/vkontakte/android/stickers/StickersView;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/stickers/StickersView;
    .param p1, "x1"    # Z

    .prologue
    .line 59
    iput-boolean p1, p0, Lcom/vkontakte/android/stickers/StickersView;->mTabsVisible:Z

    return p1
.end method

.method static synthetic access$800(Lcom/vkontakte/android/stickers/StickersView;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/stickers/StickersView;

    .prologue
    .line 59
    iget-object v0, p0, Lcom/vkontakte/android/stickers/StickersView;->mBackspace:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$900(Lcom/vkontakte/android/stickers/StickersView;)Landroid/view/ViewGroup;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/stickers/StickersView;

    .prologue
    .line 59
    iget-object v0, p0, Lcom/vkontakte/android/stickers/StickersView;->tabsWrap:Landroid/view/ViewGroup;

    return-object v0
.end method

.method private createSettingsTabView()Landroid/view/View;
    .locals 2

    .prologue
    .line 299
    new-instance v0, Landroid/widget/ImageView;

    invoke-virtual {p0}, Lcom/vkontakte/android/stickers/StickersView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 300
    .local v0, "result":Landroid/widget/ImageView;
    invoke-static {p0}, Lcom/vkontakte/android/stickers/StickersView$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/stickers/StickersView;)Landroid/view/View$OnClickListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 301
    sget-object v1, Landroid/widget/ImageView$ScaleType;->CENTER:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 302
    const v1, 0x7f0201f8

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 303
    const v1, -0x55514e

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setColorFilter(I)V

    .line 304
    return-object v0
.end method

.method private createStoreTabView()Landroid/view/View;
    .locals 12

    .prologue
    const/4 v11, 0x0

    const/high16 v10, 0x41100000    # 9.0f

    const/high16 v7, 0x40f00000    # 7.5f

    const/16 v9, 0x11

    const/4 v8, -0x2

    .line 269
    new-instance v3, Landroid/widget/FrameLayout;

    invoke-virtual {p0}, Lcom/vkontakte/android/stickers/StickersView;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v3, v4}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 270
    .local v3, "result":Landroid/widget/FrameLayout;
    new-instance v1, Landroid/widget/ImageView;

    invoke-virtual {p0}, Lcom/vkontakte/android/stickers/StickersView;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v1, v4}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 271
    .local v1, "imageView":Landroid/widget/ImageView;
    sget-object v4, Landroid/widget/ImageView$ScaleType;->CENTER:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v1, v4}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 272
    new-instance v0, Lcom/vkontakte/android/ui/drawable/RecoloredDrawable;

    invoke-virtual {p0}, Lcom/vkontakte/android/stickers/StickersView;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f0202ac

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    const v5, -0x726c67

    invoke-direct {v0, v4, v5}, Lcom/vkontakte/android/ui/drawable/RecoloredDrawable;-><init>(Landroid/graphics/drawable/Drawable;I)V

    .line 273
    .local v0, "icon":Landroid/graphics/drawable/Drawable;
    const/16 v4, 0xbf

    invoke-virtual {v0, v4}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 274
    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 276
    new-instance v4, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v4, v8, v8, v9}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {v3, v1, v4}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 277
    new-instance v4, Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/vkontakte/android/stickers/StickersView;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-direct {v4, v5}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v4, p0, Lcom/vkontakte/android/stickers/StickersView;->counterTextView:Landroid/widget/TextView;

    .line 278
    iget-object v4, p0, Lcom/vkontakte/android/stickers/StickersView;->counterTextView:Landroid/widget/TextView;

    const/high16 v5, 0x41400000    # 12.0f

    invoke-static {v5}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v5

    int-to-float v5, v5

    invoke-virtual {v4, v11, v5}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 279
    iget-object v4, p0, Lcom/vkontakte/android/stickers/StickersView;->counterTextView:Landroid/widget/TextView;

    sget-object v5, Lcom/vkontakte/android/ui/Font;->Medium:Lcom/vkontakte/android/ui/Font;

    iget-object v5, v5, Lcom/vkontakte/android/ui/Font;->typeface:Landroid/graphics/Typeface;

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 280
    iget-object v4, p0, Lcom/vkontakte/android/stickers/StickersView;->counterTextView:Landroid/widget/TextView;

    invoke-virtual {v4, v9}, Landroid/widget/TextView;->setGravity(I)V

    .line 281
    iget-object v4, p0, Lcom/vkontakte/android/stickers/StickersView;->counterTextView:Landroid/widget/TextView;

    const/4 v5, -0x1

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setTextColor(I)V

    .line 282
    iget-object v4, p0, Lcom/vkontakte/android/stickers/StickersView;->counterTextView:Landroid/widget/TextView;

    const v5, 0x7f0203c8

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setBackgroundResource(I)V

    .line 283
    iget-object v4, p0, Lcom/vkontakte/android/stickers/StickersView;->counterTextView:Landroid/widget/TextView;

    invoke-static {v7}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v5

    const/high16 v6, -0x40800000    # -1.0f

    invoke-static {v6}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v6

    invoke-static {v7}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v7

    invoke-virtual {v4, v5, v6, v7, v11}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 284
    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    const/high16 v4, 0x41b00000    # 22.0f

    invoke-static {v4}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v4

    invoke-direct {v2, v8, v4, v9}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    .line 285
    .local v2, "lp":Landroid/widget/FrameLayout$LayoutParams;
    invoke-static {v10}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v4

    iput v4, v2, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 286
    invoke-static {v10}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v4

    iput v4, v2, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 287
    iget-object v4, p0, Lcom/vkontakte/android/stickers/StickersView;->counterTextView:Landroid/widget/TextView;

    invoke-virtual {v3, v4, v2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 288
    new-instance v4, Lcom/vkontakte/android/stickers/StickersView$2;

    invoke-direct {v4, p0}, Lcom/vkontakte/android/stickers/StickersView$2;-><init>(Lcom/vkontakte/android/stickers/StickersView;)V

    invoke-virtual {v3, v4}, Landroid/widget/FrameLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 295
    return-object v3
.end method

.method private createTabs()Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;
    .locals 5

    .prologue
    const/4 v2, 0x0

    .line 245
    new-instance v0, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;

    invoke-virtual {p0}, Lcom/vkontakte/android/stickers/StickersView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;-><init>(Landroid/content/Context;)V

    .line 247
    .local v0, "tabs":Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->setFillViewport(Z)V

    .line 248
    invoke-virtual {v0, v2}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->setHorizontalScrollBarEnabled(Z)V

    .line 249
    invoke-virtual {v0, v2}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->setShouldExpand(Z)V

    .line 250
    invoke-virtual {v0, v2}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->setAutoExpand(Z)V

    .line 251
    invoke-virtual {v0, v2}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->setIndicatorColor(I)V

    .line 252
    invoke-virtual {v0, v2}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->setUnderlineColor(I)V

    .line 253
    invoke-virtual {v0, v2}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->setIndicatorHeight(I)V

    .line 254
    invoke-virtual {v0, v2}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->setUnderlineHeight(I)V

    .line 255
    invoke-virtual {v0, v2}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->setDividerColor(I)V

    .line 256
    const v1, 0x7f0203c9

    invoke-virtual {v0, v1}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->setTabBackground(I)V

    .line 257
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    sget v2, Lcom/vkontakte/android/stickers/StickersView;->TABS_WIDTH:I

    sget v3, Lcom/vkontakte/android/stickers/StickersView;->TABS_HEIGHT:I

    const/4 v4, 0x0

    invoke-direct {v1, v2, v3, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v0, v1}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->setDefaultTabLayoutParams(Landroid/widget/LinearLayout$LayoutParams;)V

    .line 258
    const/high16 v1, 0x41800000    # 16.0f

    invoke-static {v1}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->setTabPaddingLeftRight(I)V

    .line 259
    return-object v0
.end method

.method private createViewPager()Landroid/support/v4/view/ViewPager;
    .locals 4

    .prologue
    .line 235
    new-instance v0, Landroid/support/v4/view/ViewPager;

    invoke-virtual {p0}, Lcom/vkontakte/android/stickers/StickersView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/support/v4/view/ViewPager;-><init>(Landroid/content/Context;)V

    .line 236
    .local v0, "pager":Landroid/support/v4/view/ViewPager;
    new-instance v1, Lcom/vkontakte/android/stickers/StickersView$StickersPagerAdapter;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcom/vkontakte/android/stickers/StickersView$StickersPagerAdapter;-><init>(Lcom/vkontakte/android/stickers/StickersView;Lcom/vkontakte/android/stickers/StickersView$1;)V

    iput-object v1, p0, Lcom/vkontakte/android/stickers/StickersView;->adapter:Lcom/vkontakte/android/stickers/StickersView$StickersPagerAdapter;

    .line 237
    iget-object v1, p0, Lcom/vkontakte/android/stickers/StickersView;->adapter:Lcom/vkontakte/android/stickers/StickersView$StickersPagerAdapter;

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPager;->setAdapter(Landroid/support/v4/view/PagerAdapter;)V

    .line 238
    new-instance v1, Lcom/vkontakte/android/stickers/StickersBackgroundView;

    invoke-virtual {p0}, Lcom/vkontakte/android/stickers/StickersView;->getContext()Landroid/content/Context;

    move-result-object v2

    iget-object v3, p0, Lcom/vkontakte/android/stickers/StickersView;->mData:Ljava/util/List;

    invoke-direct {v1, v2, v3}, Lcom/vkontakte/android/stickers/StickersBackgroundView;-><init>(Landroid/content/Context;Ljava/util/List;)V

    iput-object v1, p0, Lcom/vkontakte/android/stickers/StickersView;->mBackground:Lcom/vkontakte/android/stickers/StickersBackgroundView;

    .line 239
    const/4 v1, 0x0

    iget-object v2, p0, Lcom/vkontakte/android/stickers/StickersView;->mBackground:Lcom/vkontakte/android/stickers/StickersBackgroundView;

    invoke-virtual {v0, v1, v2}, Landroid/support/v4/view/ViewPager;->setPageTransformer(ZLandroid/support/v4/view/ViewPager$PageTransformer;)V

    .line 240
    iget-object v1, p0, Lcom/vkontakte/android/stickers/StickersView;->mBackground:Lcom/vkontakte/android/stickers/StickersBackgroundView;

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPager;->addOnPageChangeListener(Landroid/support/v4/view/ViewPager$OnPageChangeListener;)V

    .line 241
    return-object v0
.end method

.method private openLoadedPack(I)V
    .locals 3
    .param p1, "packId"    # I

    .prologue
    .line 173
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lcom/vkontakte/android/stickers/StickersView;->mData:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 174
    iget-object v1, p0, Lcom/vkontakte/android/stickers/StickersView;->mData:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/stickers/StickersViewPage;

    invoke-virtual {v1}, Lcom/vkontakte/android/stickers/StickersViewPage;->getId()I

    move-result v1

    if-ne p1, v1, :cond_1

    .line 175
    iget-object v1, p0, Lcom/vkontakte/android/stickers/StickersView;->pager:Landroid/support/v4/view/ViewPager;

    const/4 v2, 0x1

    invoke-virtual {v1, v0, v2}, Landroid/support/v4/view/ViewPager;->setCurrentItem(IZ)V

    .line 179
    :cond_0
    return-void

    .line 173
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method private setNumberNew(I)V
    .locals 3
    .param p1, "numberNew"    # I

    .prologue
    .line 317
    iget-object v0, p0, Lcom/vkontakte/android/stickers/StickersView;->counterTextView:Landroid/widget/TextView;

    if-eqz v0, :cond_0

    .line 318
    iget-object v1, p0, Lcom/vkontakte/android/stickers/StickersView;->counterTextView:Landroid/widget/TextView;

    const/16 v0, 0xa

    if-ge p1, v0, :cond_1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v2, ""

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_0
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 319
    iget-object v1, p0, Lcom/vkontakte/android/stickers/StickersView;->counterTextView:Landroid/widget/TextView;

    if-lez p1, :cond_2

    const/4 v0, 0x0

    :goto_1
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    .line 321
    :cond_0
    return-void

    .line 318
    :cond_1
    const-string/jumbo v0, "+"

    goto :goto_0

    .line 319
    :cond_2
    const/16 v0, 0x8

    goto :goto_1
.end method

.method private updateData()V
    .locals 9

    .prologue
    .line 324
    iget-object v6, p0, Lcom/vkontakte/android/stickers/StickersView;->pager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v6}, Landroid/support/v4/view/ViewPager;->getCurrentItem()I

    move-result v3

    .line 325
    .local v3, "position":I
    iget-object v6, p0, Lcom/vkontakte/android/stickers/StickersView;->mData:Ljava/util/List;

    invoke-interface {v6, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/vkontakte/android/stickers/StickersViewPage;

    invoke-virtual {v6}, Lcom/vkontakte/android/stickers/StickersViewPage;->getId()I

    move-result v1

    .line 327
    .local v1, "id":I
    iget-object v6, p0, Lcom/vkontakte/android/stickers/StickersView;->mData:Ljava/util/List;

    const/4 v7, 0x1

    invoke-interface {v6, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/vkontakte/android/stickers/StickersViewPage;

    const/4 v7, 0x0

    invoke-virtual {v6, v7}, Lcom/vkontakte/android/stickers/StickersViewPage;->reload(Lcom/vkontakte/android/data/orm/StickerStockItem;)V

    .line 328
    iget-object v6, p0, Lcom/vkontakte/android/stickers/StickersView;->mData:Ljava/util/List;

    const/4 v7, 0x2

    iget-object v8, p0, Lcom/vkontakte/android/stickers/StickersView;->mData:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v8

    invoke-interface {v6, v7, v8}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/List;->clear()V

    .line 330
    invoke-static {}, Lcom/vkontakte/android/stickers/Stickers;->get()Lcom/vkontakte/android/stickers/Stickers;

    move-result-object v6

    invoke-virtual {v6}, Lcom/vkontakte/android/stickers/Stickers;->getActivatedStickers()Ljava/util/List;

    move-result-object v0

    .line 331
    .local v0, "activatedStickers":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/data/orm/StickerStockItem;>;"
    invoke-static {}, Lcom/vkontakte/android/stickers/Stickers;->get()Lcom/vkontakte/android/stickers/Stickers;

    move-result-object v6

    invoke-virtual {v6}, Lcom/vkontakte/android/stickers/Stickers;->getPromotedStickers()Ljava/util/List;

    move-result-object v4

    .line 332
    .local v4, "promotedStickers":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/data/orm/StickerStockItem;>;"
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_1

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/vkontakte/android/data/orm/StickerStockItem;

    .line 333
    .local v5, "sticker":Lcom/vkontakte/android/data/orm/StickerStockItem;
    new-instance v7, Lcom/vkontakte/android/stickers/StickerPage;

    iget-object v8, p0, Lcom/vkontakte/android/stickers/StickersView;->mManager:Lcom/vkontakte/android/data/PurchasesManager;

    invoke-direct {v7, v5, v8}, Lcom/vkontakte/android/stickers/StickerPage;-><init>(Lcom/vkontakte/android/data/orm/StickerStockItem;Lcom/vkontakte/android/data/PurchasesManager;)V

    iget-object v8, p0, Lcom/vkontakte/android/stickers/StickersView;->mShower:Lcom/vkontakte/android/stickers/StickersView$TabsShower;

    invoke-virtual {v7, v8}, Lcom/vkontakte/android/stickers/StickerPage;->attachToScroll(Landroid/support/v7/widget/RecyclerView$OnScrollListener;)Lcom/vkontakte/android/stickers/StickerPage;

    move-result-object v7

    iget-object v8, p0, Lcom/vkontakte/android/stickers/StickersView;->mListener:Lcom/vkontakte/android/stickers/StickersView$Listener;

    invoke-virtual {v7, v8}, Lcom/vkontakte/android/stickers/StickerPage;->listener(Lcom/vkontakte/android/stickers/StickersView$Listener;)Lcom/vkontakte/android/stickers/StickerPage;

    move-result-object v2

    .line 334
    .local v2, "page":Lcom/vkontakte/android/stickers/StickerPage;
    invoke-virtual {v2}, Lcom/vkontakte/android/stickers/StickerPage;->getId()I

    move-result v7

    if-ne v7, v1, :cond_0

    .line 335
    iget-object v7, p0, Lcom/vkontakte/android/stickers/StickersView;->mData:Ljava/util/List;

    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v3

    .line 337
    :cond_0
    iget-object v7, p0, Lcom/vkontakte/android/stickers/StickersView;->mData:Ljava/util/List;

    invoke-interface {v7, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 339
    .end local v2    # "page":Lcom/vkontakte/android/stickers/StickerPage;
    .end local v5    # "sticker":Lcom/vkontakte/android/data/orm/StickerStockItem;
    :cond_1
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_2
    :goto_1
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_4

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/vkontakte/android/data/orm/StickerStockItem;

    .line 340
    .restart local v5    # "sticker":Lcom/vkontakte/android/data/orm/StickerStockItem;
    invoke-interface {v0, v5}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v7

    if-gez v7, :cond_2

    .line 341
    new-instance v7, Lcom/vkontakte/android/stickers/StickerPage;

    iget-object v8, p0, Lcom/vkontakte/android/stickers/StickersView;->mManager:Lcom/vkontakte/android/data/PurchasesManager;

    invoke-direct {v7, v5, v8}, Lcom/vkontakte/android/stickers/StickerPage;-><init>(Lcom/vkontakte/android/data/orm/StickerStockItem;Lcom/vkontakte/android/data/PurchasesManager;)V

    iget-object v8, p0, Lcom/vkontakte/android/stickers/StickersView;->mShower:Lcom/vkontakte/android/stickers/StickersView$TabsShower;

    invoke-virtual {v7, v8}, Lcom/vkontakte/android/stickers/StickerPage;->attachToScroll(Landroid/support/v7/widget/RecyclerView$OnScrollListener;)Lcom/vkontakte/android/stickers/StickerPage;

    move-result-object v7

    iget-object v8, p0, Lcom/vkontakte/android/stickers/StickersView;->mListener:Lcom/vkontakte/android/stickers/StickersView$Listener;

    invoke-virtual {v7, v8}, Lcom/vkontakte/android/stickers/StickerPage;->listener(Lcom/vkontakte/android/stickers/StickersView$Listener;)Lcom/vkontakte/android/stickers/StickerPage;

    move-result-object v2

    .line 342
    .restart local v2    # "page":Lcom/vkontakte/android/stickers/StickerPage;
    invoke-virtual {v2}, Lcom/vkontakte/android/stickers/StickerPage;->getId()I

    move-result v7

    if-ne v7, v1, :cond_3

    .line 343
    iget-object v7, p0, Lcom/vkontakte/android/stickers/StickersView;->mData:Ljava/util/List;

    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v3

    .line 345
    :cond_3
    iget-object v7, p0, Lcom/vkontakte/android/stickers/StickersView;->mData:Ljava/util/List;

    invoke-interface {v7, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 349
    .end local v2    # "page":Lcom/vkontakte/android/stickers/StickerPage;
    .end local v5    # "sticker":Lcom/vkontakte/android/data/orm/StickerStockItem;
    :cond_4
    iget-object v6, p0, Lcom/vkontakte/android/stickers/StickersView;->pager:Landroid/support/v4/view/ViewPager;

    iget-object v7, p0, Lcom/vkontakte/android/stickers/StickersView;->adapter:Lcom/vkontakte/android/stickers/StickersView$StickersPagerAdapter;

    invoke-virtual {v6, v7}, Landroid/support/v4/view/ViewPager;->setAdapter(Landroid/support/v4/view/PagerAdapter;)V

    .line 350
    iget-object v6, p0, Lcom/vkontakte/android/stickers/StickersView;->tabbar:Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;

    invoke-virtual {v6}, Lcom/astuetz/viewpager/extensions/PagerSlidingTabStrip;->notifyDataSetChanged()V

    .line 351
    iget-object v6, p0, Lcom/vkontakte/android/stickers/StickersView;->pager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v6, v3}, Landroid/support/v4/view/ViewPager;->setCurrentItem(I)V

    .line 352
    iget-object v6, p0, Lcom/vkontakte/android/stickers/StickersView;->mBackground:Lcom/vkontakte/android/stickers/StickersBackgroundView;

    iget-object v7, p0, Lcom/vkontakte/android/stickers/StickersView;->mData:Ljava/util/List;

    invoke-virtual {v6, v7, v3}, Lcom/vkontakte/android/stickers/StickersBackgroundView;->setPages(Ljava/util/List;I)V

    .line 354
    sget-object v6, Lcom/vkontakte/android/stickers/StickersView;->stickers:Lcom/vkontakte/android/stickers/Stickers;

    invoke-virtual {v6}, Lcom/vkontakte/android/stickers/Stickers;->getNewItems()I

    move-result v6

    invoke-direct {p0, v6}, Lcom/vkontakte/android/stickers/StickersView;->setNumberNew(I)V

    .line 355
    iget v6, p0, Lcom/vkontakte/android/stickers/StickersView;->mPackToOpen:I

    if-ltz v6, :cond_5

    .line 356
    iget v6, p0, Lcom/vkontakte/android/stickers/StickersView;->mPackToOpen:I

    invoke-direct {p0, v6}, Lcom/vkontakte/android/stickers/StickersView;->openLoadedPack(I)V

    .line 357
    const/4 v6, -0x1

    iput v6, p0, Lcom/vkontakte/android/stickers/StickersView;->mPackToOpen:I

    .line 359
    :cond_5
    return-void
.end method


# virtual methods
.method public createBackspaceButton()Landroid/widget/ImageView;
    .locals 4

    .prologue
    .line 308
    new-instance v0, Landroid/widget/ImageView;

    invoke-virtual {p0}, Lcom/vkontakte/android/stickers/StickersView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 309
    .local v0, "backspace":Landroid/widget/ImageView;
    new-instance v1, Lcom/vkontakte/android/ui/drawable/RecoloredDrawable;

    invoke-virtual {p0}, Lcom/vkontakte/android/stickers/StickersView;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0201a4

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    const v3, -0x40726c67

    invoke-direct {v1, v2, v3}, Lcom/vkontakte/android/ui/drawable/RecoloredDrawable;-><init>(Landroid/graphics/drawable/Drawable;I)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 310
    const v1, -0x1b1816

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setBackgroundColor(I)V

    .line 311
    sget-object v1, Landroid/widget/ImageView$ScaleType;->CENTER:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 312
    new-instance v1, Lcom/vkontakte/android/stickers/StickersView$BackspaceTouchListener;

    iget-object v2, p0, Lcom/vkontakte/android/stickers/StickersView;->mListener:Lcom/vkontakte/android/stickers/StickersView$Listener;

    invoke-direct {v1, v2}, Lcom/vkontakte/android/stickers/StickersView$BackspaceTouchListener;-><init>(Lcom/vkontakte/android/stickers/StickersView$Listener;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 313
    return-object v0
.end method

.method public createTabsWrap()Landroid/widget/RelativeLayout;
    .locals 2

    .prologue
    .line 263
    new-instance v0, Landroid/widget/RelativeLayout;

    invoke-virtual {p0}, Lcom/vkontakte/android/stickers/StickersView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 264
    .local v0, "emojiTabsWrap":Landroid/widget/RelativeLayout;
    const v1, 0x7f0200bb

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->setBackgroundResource(I)V

    .line 265
    return-object v0
.end method

.method public dispatchConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 4
    .param p1, "newConfig"    # Landroid/content/res/Configuration;

    .prologue
    .line 217
    invoke-super {p0, p1}, Landroid/widget/RelativeLayout;->dispatchConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 218
    iget-object v2, p0, Lcom/vkontakte/android/stickers/StickersView;->pager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v2}, Landroid/support/v4/view/ViewPager;->getCurrentItem()I

    move-result v0

    .line 219
    .local v0, "position":I
    iget-object v2, p0, Lcom/vkontakte/android/stickers/StickersView;->mData:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/stickers/StickersViewPage;

    .line 220
    .local v1, "stickersViewPage":Lcom/vkontakte/android/stickers/StickersViewPage;
    invoke-virtual {v1, p1}, Lcom/vkontakte/android/stickers/StickersViewPage;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    goto :goto_0

    .line 222
    .end local v1    # "stickersViewPage":Lcom/vkontakte/android/stickers/StickersViewPage;
    :cond_0
    iget-object v2, p0, Lcom/vkontakte/android/stickers/StickersView;->pager:Landroid/support/v4/view/ViewPager;

    iget-object v3, p0, Lcom/vkontakte/android/stickers/StickersView;->pager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v3}, Landroid/support/v4/view/ViewPager;->getAdapter()Landroid/support/v4/view/PagerAdapter;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/support/v4/view/ViewPager;->setAdapter(Landroid/support/v4/view/PagerAdapter;)V

    .line 223
    iget-object v2, p0, Lcom/vkontakte/android/stickers/StickersView;->pager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v2, v0}, Landroid/support/v4/view/ViewPager;->setCurrentItem(I)V

    .line 225
    return-void
.end method

.method synthetic lambda$createSettingsTabView$0(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 300
    invoke-virtual {p0}, Lcom/vkontakte/android/stickers/StickersView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/vkontakte/android/utils/Utils;->castToActivity(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;->start(Landroid/app/Activity;)V

    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 1
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 229
    iget-object v0, p0, Lcom/vkontakte/android/stickers/StickersView;->mManager:Lcom/vkontakte/android/data/PurchasesManager;

    if-eqz v0, :cond_0

    .line 230
    iget-object v0, p0, Lcom/vkontakte/android/stickers/StickersView;->mManager:Lcom/vkontakte/android/data/PurchasesManager;

    invoke-virtual {v0, p1, p2, p3}, Lcom/vkontakte/android/data/PurchasesManager;->onActivityResult(IILandroid/content/Intent;)V

    .line 232
    :cond_0
    return-void
.end method

.method protected onAttachedToWindow()V
    .locals 5

    .prologue
    .line 183
    invoke-super {p0}, Landroid/widget/RelativeLayout;->onAttachedToWindow()V

    .line 184
    iget-boolean v1, p0, Lcom/vkontakte/android/stickers/StickersView;->mInit:Z

    if-nez v1, :cond_0

    .line 185
    invoke-direct {p0}, Lcom/vkontakte/android/stickers/StickersView;->updateData()V

    .line 186
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/vkontakte/android/stickers/StickersView;->mInit:Z

    .line 188
    :cond_0
    sget-object v1, Lcom/vkontakte/android/stickers/StickersView;->stickers:Lcom/vkontakte/android/stickers/Stickers;

    invoke-virtual {v1}, Lcom/vkontakte/android/stickers/Stickers;->getNewItems()I

    move-result v1

    invoke-direct {p0, v1}, Lcom/vkontakte/android/stickers/StickersView;->setNumberNew(I)V

    .line 189
    invoke-virtual {p0}, Lcom/vkontakte/android/stickers/StickersView;->getContext()Landroid/content/Context;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/ui/ResulterProvider;

    invoke-interface {v1, p0}, Lcom/vkontakte/android/ui/ResulterProvider;->registerActivityResult(Lcom/vkontakte/android/ui/ActivityResulter;)V

    .line 190
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 191
    .local v0, "filter":Landroid/content/IntentFilter;
    const-string/jumbo v1, "com.vkontakte.android.STICKERS_UPDATED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 192
    const-string/jumbo v1, "com.vkontakte.android.STICKERS_RELOADED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 193
    const-string/jumbo v1, "com.vkontakte.android.STICKERS_DOWNLOAD_PROGRESS"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 194
    const-string/jumbo v1, "com.vkontakte.android.STICKERS_UPDATED_RECENTS"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 195
    const-string/jumbo v1, "com.vkontakte.android.STICKERS_NUM_NEW_ITEMS"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 196
    invoke-virtual {p0}, Lcom/vkontakte/android/stickers/StickersView;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/stickers/StickersView;->mReceiver:Landroid/content/BroadcastReceiver;

    const-string/jumbo v3, "com.vkontakte.android.permission.ACCESS_DATA"

    const/4 v4, 0x0

    invoke-virtual {v1, v2, v0, v3, v4}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;)Landroid/content/Intent;

    .line 197
    sget-object v1, Lcom/vkontakte/android/stickers/StickersView;->stickers:Lcom/vkontakte/android/stickers/Stickers;

    invoke-virtual {v1}, Lcom/vkontakte/android/stickers/Stickers;->markGlobalPromotionsAsViewed()V

    .line 198
    return-void
.end method

.method protected onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 3
    .param p1, "newConfig"    # Landroid/content/res/Configuration;

    .prologue
    .line 209
    invoke-super {p0, p1}, Landroid/widget/RelativeLayout;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 210
    iget-object v1, p0, Lcom/vkontakte/android/stickers/StickersView;->mData:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/stickers/StickersViewPage;

    .line 211
    .local v0, "stickersViewPage":Lcom/vkontakte/android/stickers/StickersViewPage;
    invoke-virtual {v0, p1}, Lcom/vkontakte/android/stickers/StickersViewPage;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    goto :goto_0

    .line 213
    .end local v0    # "stickersViewPage":Lcom/vkontakte/android/stickers/StickersViewPage;
    :cond_0
    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 2

    .prologue
    .line 202
    invoke-super {p0}, Landroid/widget/RelativeLayout;->onDetachedFromWindow()V

    .line 203
    invoke-virtual {p0}, Lcom/vkontakte/android/stickers/StickersView;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/ui/ResulterProvider;

    invoke-interface {v0, p0}, Lcom/vkontakte/android/ui/ResulterProvider;->unregisterActivityResult(Lcom/vkontakte/android/ui/ActivityResulter;)V

    .line 204
    invoke-virtual {p0}, Lcom/vkontakte/android/stickers/StickersView;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/stickers/StickersView;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 205
    return-void
.end method

.method public openPack(I)V
    .locals 1
    .param p1, "packId"    # I

    .prologue
    .line 165
    iget-boolean v0, p0, Lcom/vkontakte/android/stickers/StickersView;->mInit:Z

    if-eqz v0, :cond_0

    .line 166
    invoke-direct {p0, p1}, Lcom/vkontakte/android/stickers/StickersView;->openLoadedPack(I)V

    .line 170
    :goto_0
    return-void

    .line 168
    :cond_0
    iput p1, p0, Lcom/vkontakte/android/stickers/StickersView;->mPackToOpen:I

    goto :goto_0
.end method
