.class public final Lcom/vk/music/view/TabbedMusicContainer;
.super Landroid/support/design/widget/CoordinatorLayout;
.source "TabbedMusicContainer.java"

# interfaces
.implements Lcom/vk/music/model/TabbedMusicModel$View;


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "ViewConstructor"
    }
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/music/view/TabbedMusicContainer$UserListener;,
        Lcom/vk/music/view/TabbedMusicContainer$MusicPagerAdapter;
    }
.end annotation


# static fields
.field private static final REQUEST_CODE_GET_PLAYLIST_MUSIC:I = 0xa

.field private static final REQUEST_CODE_GET_PLAYLIST_RECOMMENDATION:I = 0x10432


# instance fields
.field final activity:Landroid/app/Activity;

.field appBarView:Landroid/support/design/widget/AppBarLayout;

.field final inflater:Landroid/view/LayoutInflater;

.field leftButton:Landroid/widget/ImageView;

.field final lifecycleHandler:Lcom/vk/core/widget/LifecycleHandler;

.field final model:Lcom/vk/music/model/TabbedMusicModel;

.field musicContainer:Lcom/vk/music/view/MusicContainer;

.field pager:Landroid/support/v4/view/ViewPager;

.field recommendedContainer:Lcom/vk/music/view/RecommendedContainer;

.field searchButton:Landroid/widget/TextView;

.field tabs:Landroid/support/design/widget/TabLayout;

.field final userListener:Lcom/vk/music/view/TabbedMusicContainer$UserListener;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/vk/music/model/TabbedMusicModel;)V
    .locals 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "model"    # Lcom/vk/music/model/TabbedMusicModel;

    .prologue
    .line 139
    invoke-direct {p0, p1}, Landroid/support/design/widget/CoordinatorLayout;-><init>(Landroid/content/Context;)V

    .line 140
    invoke-static {p1}, Lcom/vkontakte/android/utils/Utils;->castToActivity(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object v5

    iput-object v5, p0, Lcom/vk/music/view/TabbedMusicContainer;->activity:Landroid/app/Activity;

    .line 141
    iput-object p2, p0, Lcom/vk/music/view/TabbedMusicContainer;->model:Lcom/vk/music/model/TabbedMusicModel;

    .line 142
    iget-object v5, p0, Lcom/vk/music/view/TabbedMusicContainer;->activity:Landroid/app/Activity;

    invoke-static {v5}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v5

    iput-object v5, p0, Lcom/vk/music/view/TabbedMusicContainer;->inflater:Landroid/view/LayoutInflater;

    .line 143
    new-instance v5, Lcom/vk/music/view/TabbedMusicContainer$UserListener;

    invoke-direct {v5, p0}, Lcom/vk/music/view/TabbedMusicContainer$UserListener;-><init>(Lcom/vk/music/view/TabbedMusicContainer;)V

    iput-object v5, p0, Lcom/vk/music/view/TabbedMusicContainer;->userListener:Lcom/vk/music/view/TabbedMusicContainer$UserListener;

    .line 145
    iget-object v5, p0, Lcom/vk/music/view/TabbedMusicContainer;->activity:Landroid/app/Activity;

    invoke-static {v5}, Lcom/vk/core/widget/LifecycleHandler;->install(Landroid/app/Activity;)Lcom/vk/core/widget/LifecycleHandler;

    move-result-object v5

    iput-object v5, p0, Lcom/vk/music/view/TabbedMusicContainer;->lifecycleHandler:Lcom/vk/core/widget/LifecycleHandler;

    .line 146
    iget-object v5, p0, Lcom/vk/music/view/TabbedMusicContainer;->lifecycleHandler:Lcom/vk/core/widget/LifecycleHandler;

    iget-object v6, p0, Lcom/vk/music/view/TabbedMusicContainer;->userListener:Lcom/vk/music/view/TabbedMusicContainer$UserListener;

    invoke-virtual {v5, v6}, Lcom/vk/core/widget/LifecycleHandler;->setLifecycleListener(Lcom/vk/core/widget/LifecycleListener;)V

    .line 148
    iget-object v5, p0, Lcom/vk/music/view/TabbedMusicContainer;->inflater:Landroid/view/LayoutInflater;

    const v6, 0x7f030156

    invoke-virtual {v5, v6, p0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 149
    const v5, 0x7f1001ac

    invoke-virtual {p0, v5}, Lcom/vk/music/view/TabbedMusicContainer;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/support/design/widget/AppBarLayout;

    iput-object v5, p0, Lcom/vk/music/view/TabbedMusicContainer;->appBarView:Landroid/support/design/widget/AppBarLayout;

    .line 150
    const v5, 0x7f1003e4

    invoke-virtual {p0, v5}, Lcom/vk/music/view/TabbedMusicContainer;->findViewById(I)Landroid/view/View;

    move-result-object v2

    .line 151
    .local v2, "searchBarView":Landroid/view/View;
    const v5, 0x7f090116

    invoke-static {v5}, Lcom/vk/core/util/ResUtils;->dim(I)I

    move-result v5

    int-to-float v5, v5

    invoke-static {v2, v5}, Landroid/support/v4/view/ViewCompat;->setElevation(Landroid/view/View;F)V

    .line 152
    const v5, 0x7f1003e5

    invoke-virtual {v2, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    iput-object v5, p0, Lcom/vk/music/view/TabbedMusicContainer;->searchButton:Landroid/widget/TextView;

    .line 153
    iget-object v5, p0, Lcom/vk/music/view/TabbedMusicContainer;->searchButton:Landroid/widget/TextView;

    invoke-static {p0}, Lcom/vk/music/view/TabbedMusicContainer$$Lambda$1;->lambdaFactory$(Lcom/vk/music/view/TabbedMusicContainer;)Landroid/view/View$OnClickListener;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 155
    const v5, 0x7f1003f8

    invoke-virtual {v2, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/ImageView;

    iput-object v5, p0, Lcom/vk/music/view/TabbedMusicContainer;->leftButton:Landroid/widget/ImageView;

    .line 156
    invoke-virtual {p0}, Lcom/vk/music/view/TabbedMusicContainer;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-static {v5}, Lcom/vk/core/util/Screen;->isTablet(Landroid/content/Context;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 157
    iget-object v5, p0, Lcom/vk/music/view/TabbedMusicContainer;->leftButton:Landroid/widget/ImageView;

    const/16 v6, 0x8

    invoke-virtual {v5, v6}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 170
    :goto_0
    const v5, 0x7f1001ad

    invoke-virtual {p0, v5}, Lcom/vk/music/view/TabbedMusicContainer;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/support/design/widget/TabLayout;

    iput-object v5, p0, Lcom/vk/music/view/TabbedMusicContainer;->tabs:Landroid/support/design/widget/TabLayout;

    .line 171
    iget-object v5, p0, Lcom/vk/music/view/TabbedMusicContainer;->tabs:Landroid/support/design/widget/TabLayout;

    const v6, 0x7f0803b3

    invoke-direct {p0, v6}, Lcom/vk/music/view/TabbedMusicContainer;->createTab(I)Landroid/support/design/widget/TabLayout$Tab;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/support/design/widget/TabLayout;->addTab(Landroid/support/design/widget/TabLayout$Tab;)V

    .line 172
    iget-object v5, p0, Lcom/vk/music/view/TabbedMusicContainer;->tabs:Landroid/support/design/widget/TabLayout;

    const v6, 0x7f0803b4

    invoke-direct {p0, v6}, Lcom/vk/music/view/TabbedMusicContainer;->createTab(I)Landroid/support/design/widget/TabLayout$Tab;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/support/design/widget/TabLayout;->addTab(Landroid/support/design/widget/TabLayout$Tab;)V

    .line 174
    const v5, 0x7f10018c

    invoke-virtual {p0, v5}, Lcom/vk/music/view/TabbedMusicContainer;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/support/v4/view/ViewPager;

    iput-object v5, p0, Lcom/vk/music/view/TabbedMusicContainer;->pager:Landroid/support/v4/view/ViewPager;

    .line 176
    iget-object v5, p0, Lcom/vk/music/view/TabbedMusicContainer;->pager:Landroid/support/v4/view/ViewPager;

    new-instance v6, Landroid/support/design/widget/TabLayout$TabLayoutOnPageChangeListener;

    iget-object v7, p0, Lcom/vk/music/view/TabbedMusicContainer;->tabs:Landroid/support/design/widget/TabLayout;

    invoke-direct {v6, v7}, Landroid/support/design/widget/TabLayout$TabLayoutOnPageChangeListener;-><init>(Landroid/support/design/widget/TabLayout;)V

    invoke-virtual {v5, v6}, Landroid/support/v4/view/ViewPager;->addOnPageChangeListener(Landroid/support/v4/view/ViewPager$OnPageChangeListener;)V

    .line 177
    iget-object v5, p0, Lcom/vk/music/view/TabbedMusicContainer;->tabs:Landroid/support/design/widget/TabLayout;

    new-instance v6, Lcom/vk/music/view/TabbedMusicContainer$1;

    iget-object v7, p0, Lcom/vk/music/view/TabbedMusicContainer;->pager:Landroid/support/v4/view/ViewPager;

    invoke-direct {v6, p0, v7, p2}, Lcom/vk/music/view/TabbedMusicContainer$1;-><init>(Lcom/vk/music/view/TabbedMusicContainer;Landroid/support/v4/view/ViewPager;Lcom/vk/music/model/TabbedMusicModel;)V

    invoke-virtual {v5, v6}, Landroid/support/design/widget/TabLayout;->addOnTabSelectedListener(Landroid/support/design/widget/TabLayout$OnTabSelectedListener;)V

    .line 186
    iget-object v5, p0, Lcom/vk/music/view/TabbedMusicContainer;->inflater:Landroid/view/LayoutInflater;

    const v6, 0x7f030131

    const/4 v7, 0x0

    invoke-virtual {v5, v6, v7}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 187
    .local v0, "emptyView":Landroid/view/View;
    const v5, 0x7f1003ce

    invoke-virtual {v0, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    .line 188
    .local v4, "tvEmpty":Landroid/widget/TextView;
    invoke-static {p0}, Lcom/vk/music/view/TabbedMusicContainer$$Lambda$4;->lambdaFactory$(Lcom/vk/music/view/TabbedMusicContainer;)Landroid/view/View$OnClickListener;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 190
    new-instance v5, Lcom/vk/music/view/MusicContainer;

    invoke-virtual {p2}, Lcom/vk/music/model/TabbedMusicModel;->getMusicModel()Lcom/vk/music/model/MusicModel;

    move-result-object v6

    invoke-direct {v5, p1, v6, v0}, Lcom/vk/music/view/MusicContainer;-><init>(Landroid/content/Context;Lcom/vk/music/model/MusicModel;Landroid/view/View;)V

    iput-object v5, p0, Lcom/vk/music/view/TabbedMusicContainer;->musicContainer:Lcom/vk/music/view/MusicContainer;

    .line 192
    iget-object v5, p0, Lcom/vk/music/view/TabbedMusicContainer;->musicContainer:Lcom/vk/music/view/MusicContainer;

    invoke-static {p0}, Lcom/vk/music/view/TabbedMusicContainer$$Lambda$5;->lambdaFactory$(Lcom/vk/music/view/TabbedMusicContainer;)Lcom/vk/music/view/MusicContainer$Host;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/vk/music/view/MusicContainer;->setHost(Lcom/vk/music/view/MusicContainer$Host;)V

    .line 198
    new-instance v5, Lcom/vk/music/view/RecommendedContainer;

    invoke-virtual {p2}, Lcom/vk/music/model/TabbedMusicModel;->getRecommendedModel()Lcom/vk/music/model/RecommendedModel;

    move-result-object v6

    invoke-direct {v5, p1, v6}, Lcom/vk/music/view/RecommendedContainer;-><init>(Landroid/content/Context;Lcom/vk/music/model/RecommendedModel;)V

    iput-object v5, p0, Lcom/vk/music/view/TabbedMusicContainer;->recommendedContainer:Lcom/vk/music/view/RecommendedContainer;

    .line 199
    iget-object v5, p0, Lcom/vk/music/view/TabbedMusicContainer;->recommendedContainer:Lcom/vk/music/view/RecommendedContainer;

    invoke-static {p0}, Lcom/vk/music/view/TabbedMusicContainer$$Lambda$6;->lambdaFactory$(Lcom/vk/music/view/TabbedMusicContainer;)Lcom/vk/music/view/RecommendedContainer$Host;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/vk/music/view/RecommendedContainer;->setHost(Lcom/vk/music/view/RecommendedContainer$Host;)V

    .line 205
    iget-object v5, p0, Lcom/vk/music/view/TabbedMusicContainer;->pager:Landroid/support/v4/view/ViewPager;

    new-instance v6, Lcom/vk/music/view/TabbedMusicContainer$MusicPagerAdapter;

    invoke-direct {v6, p0}, Lcom/vk/music/view/TabbedMusicContainer$MusicPagerAdapter;-><init>(Lcom/vk/music/view/TabbedMusicContainer;)V

    invoke-virtual {v5, v6}, Landroid/support/v4/view/ViewPager;->setAdapter(Landroid/support/v4/view/PagerAdapter;)V

    .line 207
    invoke-virtual {p2}, Lcom/vk/music/model/TabbedMusicModel;->getPage()I

    move-result v5

    invoke-static {v5}, Lcom/vk/music/view/TabbedMusicContainer;->pageToPosition(I)I

    move-result v1

    .line 208
    .local v1, "position":I
    iget-object v5, p0, Lcom/vk/music/view/TabbedMusicContainer;->tabs:Landroid/support/design/widget/TabLayout;

    invoke-virtual {v5, v1}, Landroid/support/design/widget/TabLayout;->getTabAt(I)Landroid/support/design/widget/TabLayout$Tab;

    move-result-object v3

    .line 209
    .local v3, "tab":Landroid/support/design/widget/TabLayout$Tab;
    if-eqz v3, :cond_0

    .line 210
    invoke-virtual {v3}, Landroid/support/design/widget/TabLayout$Tab;->select()V

    .line 212
    :cond_0
    iget-object v5, p0, Lcom/vk/music/view/TabbedMusicContainer;->pager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v5, v1}, Landroid/support/v4/view/ViewPager;->setCurrentItem(I)V

    .line 213
    return-void

    .line 158
    .end local v0    # "emptyView":Landroid/view/View;
    .end local v1    # "position":I
    .end local v3    # "tab":Landroid/support/design/widget/TabLayout$Tab;
    .end local v4    # "tvEmpty":Landroid/widget/TextView;
    :cond_1
    iget-object v5, p0, Lcom/vk/music/view/TabbedMusicContainer;->activity:Landroid/app/Activity;

    invoke-virtual {v5}, Landroid/app/Activity;->isTaskRoot()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 159
    iget-object v5, p0, Lcom/vk/music/view/TabbedMusicContainer;->leftButton:Landroid/widget/ImageView;

    const v6, 0x7f020156

    invoke-virtual {v5, v6}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 160
    iget-object v5, p0, Lcom/vk/music/view/TabbedMusicContainer;->leftButton:Landroid/widget/ImageView;

    invoke-static {p0}, Lcom/vk/music/view/TabbedMusicContainer$$Lambda$2;->lambdaFactory$(Lcom/vk/music/view/TabbedMusicContainer;)Landroid/view/View$OnClickListener;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto/16 :goto_0

    .line 166
    :cond_2
    iget-object v5, p0, Lcom/vk/music/view/TabbedMusicContainer;->leftButton:Landroid/widget/ImageView;

    const v6, 0x7f02014f

    invoke-virtual {v5, v6}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 167
    iget-object v5, p0, Lcom/vk/music/view/TabbedMusicContainer;->leftButton:Landroid/widget/ImageView;

    invoke-static {p0}, Lcom/vk/music/view/TabbedMusicContainer$$Lambda$3;->lambdaFactory$(Lcom/vk/music/view/TabbedMusicContainer;)Landroid/view/View$OnClickListener;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto/16 :goto_0
.end method

.method static synthetic access$000(I)I
    .locals 1
    .param p0, "x0"    # I

    .prologue
    .line 42
    invoke-static {p0}, Lcom/vk/music/view/TabbedMusicContainer;->positionToPage(I)I

    move-result v0

    return v0
.end method

.method private createTab(I)Landroid/support/design/widget/TabLayout$Tab;
    .locals 4
    .param p1, "textRes"    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 220
    new-instance v0, Lcom/vk/attachpicker/widget/RobotoMediumTextView;

    invoke-virtual {p0}, Lcom/vk/music/view/TabbedMusicContainer;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vk/attachpicker/widget/RobotoMediumTextView;-><init>(Landroid/content/Context;)V

    .line 221
    .local v0, "v":Landroid/widget/TextView;
    const v1, 0x7f0f0122

    invoke-static {v1}, Lcom/vk/core/util/ResUtils;->colorList(I)Landroid/content/res/ColorStateList;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 222
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setIncludeFontPadding(Z)V

    .line 223
    const/16 v1, 0x11

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setGravity(I)V

    .line 224
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setAllCaps(Z)V

    .line 225
    invoke-virtual {p0}, Lcom/vk/music/view/TabbedMusicContainer;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v1, v1, Landroid/util/DisplayMetrics;->densityDpi:I

    sparse-switch v1, :sswitch_data_0

    .line 232
    const/high16 v1, 0x41a00000    # 20.0f

    invoke-virtual {v0, v3, v1}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 235
    :goto_0
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 236
    iget-object v1, p0, Lcom/vk/music/view/TabbedMusicContainer;->tabs:Landroid/support/design/widget/TabLayout;

    invoke-virtual {v1}, Landroid/support/design/widget/TabLayout;->newTab()Landroid/support/design/widget/TabLayout$Tab;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/support/design/widget/TabLayout$Tab;->setCustomView(Landroid/view/View;)Landroid/support/design/widget/TabLayout$Tab;

    move-result-object v1

    return-object v1

    .line 229
    :sswitch_0
    const/high16 v1, 0x41900000    # 18.0f

    invoke-virtual {v0, v3, v1}, Landroid/widget/TextView;->setTextSize(IF)V

    goto :goto_0

    .line 225
    :sswitch_data_0
    .sparse-switch
        0x78 -> :sswitch_0
        0xa0 -> :sswitch_0
        0xf0 -> :sswitch_0
    .end sparse-switch
.end method

.method private static pageToPosition(I)I
    .locals 1
    .param p0, "page"    # I

    .prologue
    .line 58
    packed-switch p0, :pswitch_data_0

    .line 63
    const/4 v0, 0x0

    :goto_0
    return v0

    .line 60
    :pswitch_0
    const/4 v0, 0x1

    goto :goto_0

    .line 58
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method

.method private static positionToPage(I)I
    .locals 1
    .param p0, "position"    # I

    .prologue
    .line 49
    packed-switch p0, :pswitch_data_0

    .line 53
    const/4 v0, 0x0

    :goto_0
    return v0

    .line 51
    :pswitch_0
    const/4 v0, 0x1

    goto :goto_0

    .line 49
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method

.method private showRecommendationsPage()V
    .locals 2

    .prologue
    .line 216
    iget-object v0, p0, Lcom/vk/music/view/TabbedMusicContainer;->pager:Landroid/support/v4/view/ViewPager;

    const/4 v1, 0x1

    invoke-static {v1}, Lcom/vk/music/view/TabbedMusicContainer;->pageToPosition(I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPager;->setCurrentItem(I)V

    .line 217
    return-void
.end method


# virtual methods
.method synthetic lambda$new$0(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 153
    new-instance v0, Lcom/vk/music/fragment/SearchFragment$Builder;

    invoke-direct {v0}, Lcom/vk/music/fragment/SearchFragment$Builder;-><init>()V

    iget-object v1, p0, Lcom/vk/music/view/TabbedMusicContainer;->activity:Landroid/app/Activity;

    invoke-virtual {v0, v1}, Lcom/vk/music/fragment/SearchFragment$Builder;->go(Landroid/content/Context;)Z

    return-void
.end method

.method synthetic lambda$new$1(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 161
    iget-object v0, p0, Lcom/vk/music/view/TabbedMusicContainer;->activity:Landroid/app/Activity;

    instance-of v0, v0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateProvider;

    if-eqz v0, :cond_0

    .line 162
    iget-object v0, p0, Lcom/vk/music/view/TabbedMusicContainer;->activity:Landroid/app/Activity;

    check-cast v0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateProvider;

    invoke-interface {v0}, Lcom/vkontakte/android/ui/navigation/NavigationDelegateProvider;->getNavigationDelegate()Lcom/vkontakte/android/ui/navigation/NavigationDelegate;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/navigation/NavigationDelegate;->onNavigateUp()Z

    .line 164
    :cond_0
    return-void
.end method

.method synthetic lambda$new$2(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 167
    iget-object v0, p0, Lcom/vk/music/view/TabbedMusicContainer;->activity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    return-void
.end method

.method synthetic lambda$new$3(Landroid/view/View;)V
    .locals 0
    .param p1, "o"    # Landroid/view/View;

    .prologue
    .line 188
    invoke-direct {p0}, Lcom/vk/music/view/TabbedMusicContainer;->showRecommendationsPage()V

    return-void
.end method

.method synthetic lambda$new$4()V
    .locals 4

    .prologue
    .line 192
    iget-object v0, p0, Lcom/vk/music/view/TabbedMusicContainer;->lifecycleHandler:Lcom/vk/core/widget/LifecycleHandler;

    iget-object v1, p0, Lcom/vk/music/view/TabbedMusicContainer;->userListener:Lcom/vk/music/view/TabbedMusicContainer$UserListener;

    .line 193
    invoke-virtual {v1}, Lcom/vk/music/view/TabbedMusicContainer$UserListener;->getUniqueId()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lcom/vk/music/fragment/PlaylistsFragment$Builder;

    invoke-direct {v2}, Lcom/vk/music/fragment/PlaylistsFragment$Builder;-><init>()V

    const/4 v3, 0x1

    .line 194
    invoke-virtual {v2, v3}, Lcom/vk/music/fragment/PlaylistsFragment$Builder;->selectMy(Z)Lcom/vk/music/fragment/PlaylistsFragment$Builder;

    move-result-object v2

    iget-object v3, p0, Lcom/vk/music/view/TabbedMusicContainer;->activity:Landroid/app/Activity;

    invoke-virtual {v2, v3}, Lcom/vk/music/fragment/PlaylistsFragment$Builder;->intent(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v2

    const/16 v3, 0xa

    .line 192
    invoke-virtual {v0, v1, v2, v3}, Lcom/vk/core/widget/LifecycleHandler;->startActivityForResult(Ljava/lang/String;Landroid/content/Intent;I)V

    return-void
.end method

.method synthetic lambda$new$5()V
    .locals 4

    .prologue
    .line 199
    iget-object v0, p0, Lcom/vk/music/view/TabbedMusicContainer;->lifecycleHandler:Lcom/vk/core/widget/LifecycleHandler;

    iget-object v1, p0, Lcom/vk/music/view/TabbedMusicContainer;->userListener:Lcom/vk/music/view/TabbedMusicContainer$UserListener;

    .line 200
    invoke-virtual {v1}, Lcom/vk/music/view/TabbedMusicContainer$UserListener;->getUniqueId()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lcom/vk/music/fragment/PlaylistsFragment$Builder;

    invoke-direct {v2}, Lcom/vk/music/fragment/PlaylistsFragment$Builder;-><init>()V

    const/4 v3, 0x1

    .line 201
    invoke-virtual {v2, v3}, Lcom/vk/music/fragment/PlaylistsFragment$Builder;->selectMy(Z)Lcom/vk/music/fragment/PlaylistsFragment$Builder;

    move-result-object v2

    iget-object v3, p0, Lcom/vk/music/view/TabbedMusicContainer;->activity:Landroid/app/Activity;

    invoke-virtual {v2, v3}, Lcom/vk/music/fragment/PlaylistsFragment$Builder;->intent(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v2

    const v3, 0x10432

    .line 199
    invoke-virtual {v0, v1, v2, v3}, Lcom/vk/core/widget/LifecycleHandler;->startActivityForResult(Ljava/lang/String;Landroid/content/Intent;I)V

    return-void
.end method
