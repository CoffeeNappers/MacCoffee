.class public Lcom/vk/music/view/SearchContainer;
.super Landroid/support/design/widget/CoordinatorLayout;
.source "SearchContainer.java"

# interfaces
.implements Lcom/vk/music/model/SearchModel$View;


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "ViewConstructor"
    }
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/music/view/SearchContainer$UserListener;,
        Lcom/vk/music/view/SearchContainer$SearchResultsPagerAdapter;
    }
.end annotation


# static fields
.field private static final REQUEST_CODE_GET_PLAYLIST1:I = 0xb

.field private static final REQUEST_CODE_GET_PLAYLIST2:I = 0xc

.field private static final REQUEST_CODE_VOICE_RECOGNITION:I = 0xa

.field private static final SEARCH_BAR_BOTTOM_PADDING:I


# instance fields
.field final activity:Landroid/app/Activity;

.field appBarView:Landroid/support/design/widget/AppBarLayout;

.field focusEaterView:Landroid/view/View;

.field final inflater:Landroid/view/LayoutInflater;

.field final lifecycleHandler:Lcom/vk/core/widget/LifecycleHandler;

.field final model:Lcom/vk/music/model/SearchModel;

.field pager:Landroid/support/v4/view/ViewPager;

.field rightButton:Landroid/widget/ImageView;

.field searchBarView:Landroid/view/ViewGroup;

.field searchByArtistContainer:Lcom/vk/music/view/SearchResultContainer;

.field searchByTitleContainer:Lcom/vk/music/view/SearchResultContainer;

.field searchInputView:Landroid/widget/EditText;

.field searchSuggestionContainer:Lcom/vk/music/view/SearchSuggestionContainer;

.field tabs:Landroid/support/design/widget/TabLayout;

.field final userListener:Lcom/vk/music/view/SearchContainer$UserListener;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 54
    const/16 v0, 0x8

    invoke-static {v0}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v0

    sput v0, Lcom/vk/music/view/SearchContainer;->SEARCH_BAR_BOTTOM_PADDING:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/vk/music/model/SearchModel;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "model"    # Lcom/vk/music/model/SearchModel;

    .prologue
    .line 176
    invoke-direct {p0, p1}, Landroid/support/design/widget/CoordinatorLayout;-><init>(Landroid/content/Context;)V

    .line 178
    invoke-static {p1}, Lcom/vkontakte/android/utils/Utils;->castToActivity(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object v1

    iput-object v1, p0, Lcom/vk/music/view/SearchContainer;->activity:Landroid/app/Activity;

    .line 179
    iput-object p2, p0, Lcom/vk/music/view/SearchContainer;->model:Lcom/vk/music/model/SearchModel;

    .line 180
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    iput-object v1, p0, Lcom/vk/music/view/SearchContainer;->inflater:Landroid/view/LayoutInflater;

    .line 181
    new-instance v1, Lcom/vk/music/view/SearchContainer$UserListener;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcom/vk/music/view/SearchContainer$UserListener;-><init>(Lcom/vk/music/view/SearchContainer;Lcom/vk/music/view/SearchContainer$1;)V

    iput-object v1, p0, Lcom/vk/music/view/SearchContainer;->userListener:Lcom/vk/music/view/SearchContainer$UserListener;

    .line 183
    iget-object v1, p0, Lcom/vk/music/view/SearchContainer;->activity:Landroid/app/Activity;

    invoke-static {v1}, Lcom/vk/core/widget/LifecycleHandler;->install(Landroid/app/Activity;)Lcom/vk/core/widget/LifecycleHandler;

    move-result-object v1

    iput-object v1, p0, Lcom/vk/music/view/SearchContainer;->lifecycleHandler:Lcom/vk/core/widget/LifecycleHandler;

    .line 184
    iget-object v1, p0, Lcom/vk/music/view/SearchContainer;->lifecycleHandler:Lcom/vk/core/widget/LifecycleHandler;

    iget-object v2, p0, Lcom/vk/music/view/SearchContainer;->userListener:Lcom/vk/music/view/SearchContainer$UserListener;

    invoke-virtual {v1, v2}, Lcom/vk/core/widget/LifecycleHandler;->setLifecycleListener(Lcom/vk/core/widget/LifecycleListener;)V

    .line 186
    iget-object v1, p0, Lcom/vk/music/view/SearchContainer;->inflater:Landroid/view/LayoutInflater;

    const v2, 0x7f030148

    invoke-virtual {v1, v2, p0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 188
    invoke-static {}, Lcom/vkontakte/android/utils/VoiceUtils;->voiceSearchAvailable()Z

    move-result v0

    .line 190
    .local v0, "voiceSearchAvailable":Z
    const v1, 0x7f1001ac

    invoke-virtual {p0, v1}, Lcom/vk/music/view/SearchContainer;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/support/design/widget/AppBarLayout;

    iput-object v1, p0, Lcom/vk/music/view/SearchContainer;->appBarView:Landroid/support/design/widget/AppBarLayout;

    .line 191
    const v1, 0x7f1003e4

    invoke-virtual {p0, v1}, Lcom/vk/music/view/SearchContainer;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    iput-object v1, p0, Lcom/vk/music/view/SearchContainer;->searchBarView:Landroid/view/ViewGroup;

    .line 192
    iget-object v1, p0, Lcom/vk/music/view/SearchContainer;->searchBarView:Landroid/view/ViewGroup;

    const v2, 0x7f090116

    invoke-static {v2}, Lcom/vk/core/util/ResUtils;->dim(I)I

    move-result v2

    int-to-float v2, v2

    invoke-static {v1, v2}, Landroid/support/v4/view/ViewCompat;->setElevation(Landroid/view/View;F)V

    .line 193
    iget-object v1, p0, Lcom/vk/music/view/SearchContainer;->searchBarView:Landroid/view/ViewGroup;

    const v2, 0x7f1003e6

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    iput-object v1, p0, Lcom/vk/music/view/SearchContainer;->rightButton:Landroid/widget/ImageView;

    .line 194
    iget-object v2, p0, Lcom/vk/music/view/SearchContainer;->rightButton:Landroid/widget/ImageView;

    if-eqz v0, :cond_0

    const/4 v1, 0x0

    :goto_0
    invoke-virtual {v2, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 195
    iget-object v1, p0, Lcom/vk/music/view/SearchContainer;->rightButton:Landroid/widget/ImageView;

    invoke-static {p0, p2}, Lcom/vk/music/view/SearchContainer$$Lambda$1;->lambdaFactory$(Lcom/vk/music/view/SearchContainer;Lcom/vk/music/model/SearchModel;)Landroid/view/View$OnClickListener;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 210
    iget-object v1, p0, Lcom/vk/music/view/SearchContainer;->searchBarView:Landroid/view/ViewGroup;

    const v2, 0x7f1003e5

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/EditText;

    iput-object v1, p0, Lcom/vk/music/view/SearchContainer;->searchInputView:Landroid/widget/EditText;

    .line 211
    iget-object v1, p0, Lcom/vk/music/view/SearchContainer;->searchInputView:Landroid/widget/EditText;

    new-instance v2, Lcom/vk/music/view/SearchContainer$1;

    invoke-direct {v2, p0, v0}, Lcom/vk/music/view/SearchContainer$1;-><init>(Lcom/vk/music/view/SearchContainer;Z)V

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 222
    iget-object v1, p0, Lcom/vk/music/view/SearchContainer;->searchInputView:Landroid/widget/EditText;

    invoke-static {p0, p2}, Lcom/vk/music/view/SearchContainer$$Lambda$2;->lambdaFactory$(Lcom/vk/music/view/SearchContainer;Lcom/vk/music/model/SearchModel;)Landroid/view/View$OnFocusChangeListener;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 229
    iget-object v1, p0, Lcom/vk/music/view/SearchContainer;->searchInputView:Landroid/widget/EditText;

    invoke-static {p0}, Lcom/vk/music/view/SearchContainer$$Lambda$3;->lambdaFactory$(Lcom/vk/music/view/SearchContainer;)Landroid/widget/TextView$OnEditorActionListener;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    .line 236
    iget-object v1, p0, Lcom/vk/music/view/SearchContainer;->searchInputView:Landroid/widget/EditText;

    invoke-virtual {p2}, Lcom/vk/music/model/SearchModel;->getQuery()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 238
    iget-object v1, p0, Lcom/vk/music/view/SearchContainer;->searchBarView:Landroid/view/ViewGroup;

    const v2, 0x7f1003d8

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-static {p0}, Lcom/vk/music/view/SearchContainer$$Lambda$4;->lambdaFactory$(Lcom/vk/music/view/SearchContainer;)Landroid/view/View$OnClickListener;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 240
    const v1, 0x7f1001ad

    invoke-virtual {p0, v1}, Lcom/vk/music/view/SearchContainer;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/support/design/widget/TabLayout;

    iput-object v1, p0, Lcom/vk/music/view/SearchContainer;->tabs:Landroid/support/design/widget/TabLayout;

    .line 241
    iget-object v1, p0, Lcom/vk/music/view/SearchContainer;->tabs:Landroid/support/design/widget/TabLayout;

    const v2, 0x7f0803e8

    invoke-direct {p0, v2}, Lcom/vk/music/view/SearchContainer;->createTab(I)Landroid/support/design/widget/TabLayout$Tab;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/support/design/widget/TabLayout;->addTab(Landroid/support/design/widget/TabLayout$Tab;)V

    .line 242
    iget-object v1, p0, Lcom/vk/music/view/SearchContainer;->tabs:Landroid/support/design/widget/TabLayout;

    const v2, 0x7f0803e9

    invoke-direct {p0, v2}, Lcom/vk/music/view/SearchContainer;->createTab(I)Landroid/support/design/widget/TabLayout$Tab;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/support/design/widget/TabLayout;->addTab(Landroid/support/design/widget/TabLayout$Tab;)V

    .line 244
    const v1, 0x7f10018c

    invoke-virtual {p0, v1}, Lcom/vk/music/view/SearchContainer;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/support/v4/view/ViewPager;

    iput-object v1, p0, Lcom/vk/music/view/SearchContainer;->pager:Landroid/support/v4/view/ViewPager;

    .line 247
    iget-object v1, p0, Lcom/vk/music/view/SearchContainer;->pager:Landroid/support/v4/view/ViewPager;

    new-instance v2, Landroid/support/design/widget/TabLayout$TabLayoutOnPageChangeListener;

    iget-object v3, p0, Lcom/vk/music/view/SearchContainer;->tabs:Landroid/support/design/widget/TabLayout;

    invoke-direct {v2, v3}, Landroid/support/design/widget/TabLayout$TabLayoutOnPageChangeListener;-><init>(Landroid/support/design/widget/TabLayout;)V

    invoke-virtual {v1, v2}, Landroid/support/v4/view/ViewPager;->addOnPageChangeListener(Landroid/support/v4/view/ViewPager$OnPageChangeListener;)V

    .line 248
    iget-object v1, p0, Lcom/vk/music/view/SearchContainer;->tabs:Landroid/support/design/widget/TabLayout;

    new-instance v2, Lcom/vk/music/view/SearchContainer$2;

    iget-object v3, p0, Lcom/vk/music/view/SearchContainer;->pager:Landroid/support/v4/view/ViewPager;

    invoke-direct {v2, p0, v3, p2}, Lcom/vk/music/view/SearchContainer$2;-><init>(Lcom/vk/music/view/SearchContainer;Landroid/support/v4/view/ViewPager;Lcom/vk/music/model/SearchModel;)V

    invoke-virtual {v1, v2}, Landroid/support/design/widget/TabLayout;->addOnTabSelectedListener(Landroid/support/design/widget/TabLayout$OnTabSelectedListener;)V

    .line 256
    const v1, 0x7f1003e3

    invoke-virtual {p0, v1}, Lcom/vk/music/view/SearchContainer;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/vk/music/view/SearchContainer;->focusEaterView:Landroid/view/View;

    .line 258
    invoke-direct {p0}, Lcom/vk/music/view/SearchContainer;->ensureSearchResultByTitleContainer()V

    .line 259
    invoke-direct {p0}, Lcom/vk/music/view/SearchContainer;->ensureSearchResultByArtistContainer()V

    .line 260
    invoke-virtual {p2}, Lcom/vk/music/model/SearchModel;->getState()I

    move-result v1

    if-nez v1, :cond_1

    .line 261
    invoke-direct {p0}, Lcom/vk/music/view/SearchContainer;->switchToSearching()V

    .line 265
    :goto_1
    return-void

    .line 194
    :cond_0
    const/16 v1, 0x8

    goto/16 :goto_0

    .line 263
    :cond_1
    invoke-direct {p0}, Lcom/vk/music/view/SearchContainer;->switchToResults()V

    goto :goto_1
.end method

.method static synthetic access$000(Lcom/vk/music/view/SearchContainer;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/music/view/SearchContainer;

    .prologue
    .line 48
    invoke-direct {p0}, Lcom/vk/music/view/SearchContainer;->ensureSearchResultByTitleContainer()V

    return-void
.end method

.method static synthetic access$100(Lcom/vk/music/view/SearchContainer;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/music/view/SearchContainer;

    .prologue
    .line 48
    invoke-direct {p0}, Lcom/vk/music/view/SearchContainer;->ensureSearchResultByArtistContainer()V

    return-void
.end method

.method static synthetic access$300(I)I
    .locals 1
    .param p0, "x0"    # I

    .prologue
    .line 48
    invoke-static {p0}, Lcom/vk/music/view/SearchContainer;->positionToPage(I)I

    move-result v0

    return v0
.end method

.method static synthetic access$lambda$0(Lcom/vk/music/view/SearchContainer;)V
    .locals 0

    invoke-direct {p0}, Lcom/vk/music/view/SearchContainer;->switchToResults()V

    return-void
.end method

.method private createTab(I)Landroid/support/design/widget/TabLayout$Tab;
    .locals 3
    .param p1, "textRes"    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    const/4 v2, 0x1

    .line 330
    new-instance v0, Lcom/vk/attachpicker/widget/RobotoMediumTextView;

    invoke-virtual {p0}, Lcom/vk/music/view/SearchContainer;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vk/attachpicker/widget/RobotoMediumTextView;-><init>(Landroid/content/Context;)V

    .line 331
    .local v0, "v":Landroid/widget/TextView;
    const v1, 0x7f0f0122

    invoke-static {v1}, Lcom/vk/core/util/ResUtils;->colorList(I)Landroid/content/res/ColorStateList;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 332
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setIncludeFontPadding(Z)V

    .line 333
    const/16 v1, 0x11

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setGravity(I)V

    .line 334
    const/high16 v1, 0x41600000    # 14.0f

    invoke-virtual {v0, v2, v1}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 335
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 336
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setAllCaps(Z)V

    .line 337
    iget-object v1, p0, Lcom/vk/music/view/SearchContainer;->tabs:Landroid/support/design/widget/TabLayout;

    invoke-virtual {v1}, Landroid/support/design/widget/TabLayout;->newTab()Landroid/support/design/widget/TabLayout$Tab;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/support/design/widget/TabLayout$Tab;->setCustomView(Landroid/view/View;)Landroid/support/design/widget/TabLayout$Tab;

    move-result-object v1

    return-object v1
.end method

.method private ensureSearchResultByArtistContainer()V
    .locals 3

    .prologue
    .line 352
    iget-object v0, p0, Lcom/vk/music/view/SearchContainer;->searchByArtistContainer:Lcom/vk/music/view/SearchResultContainer;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/vk/music/view/SearchContainer;->model:Lcom/vk/music/model/SearchModel;

    invoke-virtual {v0}, Lcom/vk/music/model/SearchModel;->getSearchResultByArtistModel()Lcom/vk/music/model/SearchResultModel;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 353
    new-instance v0, Lcom/vk/music/view/SearchResultContainer;

    invoke-virtual {p0}, Lcom/vk/music/view/SearchContainer;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/vk/music/view/SearchContainer;->model:Lcom/vk/music/model/SearchModel;

    invoke-virtual {v2}, Lcom/vk/music/model/SearchModel;->getSearchResultByArtistModel()Lcom/vk/music/model/SearchResultModel;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/vk/music/view/SearchResultContainer;-><init>(Landroid/content/Context;Lcom/vk/music/model/SearchResultModel;)V

    iput-object v0, p0, Lcom/vk/music/view/SearchContainer;->searchByArtistContainer:Lcom/vk/music/view/SearchResultContainer;

    .line 354
    iget-object v0, p0, Lcom/vk/music/view/SearchContainer;->searchByArtistContainer:Lcom/vk/music/view/SearchResultContainer;

    invoke-static {p0}, Lcom/vk/music/view/SearchContainer$$Lambda$7;->lambdaFactory$(Lcom/vk/music/view/SearchContainer;)Lcom/vk/music/view/SearchResultContainer$Host;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/music/view/SearchResultContainer;->setHost(Lcom/vk/music/view/SearchResultContainer$Host;)V

    .line 360
    :cond_0
    return-void
.end method

.method private ensureSearchResultByTitleContainer()V
    .locals 3

    .prologue
    .line 341
    iget-object v0, p0, Lcom/vk/music/view/SearchContainer;->searchByTitleContainer:Lcom/vk/music/view/SearchResultContainer;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/vk/music/view/SearchContainer;->model:Lcom/vk/music/model/SearchModel;

    invoke-virtual {v0}, Lcom/vk/music/model/SearchModel;->getSearchResultByTitleModel()Lcom/vk/music/model/SearchResultModel;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 342
    new-instance v0, Lcom/vk/music/view/SearchResultContainer;

    invoke-virtual {p0}, Lcom/vk/music/view/SearchContainer;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/vk/music/view/SearchContainer;->model:Lcom/vk/music/model/SearchModel;

    invoke-virtual {v2}, Lcom/vk/music/model/SearchModel;->getSearchResultByTitleModel()Lcom/vk/music/model/SearchResultModel;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/vk/music/view/SearchResultContainer;-><init>(Landroid/content/Context;Lcom/vk/music/model/SearchResultModel;)V

    iput-object v0, p0, Lcom/vk/music/view/SearchContainer;->searchByTitleContainer:Lcom/vk/music/view/SearchResultContainer;

    .line 343
    iget-object v0, p0, Lcom/vk/music/view/SearchContainer;->searchByTitleContainer:Lcom/vk/music/view/SearchResultContainer;

    invoke-static {p0}, Lcom/vk/music/view/SearchContainer$$Lambda$6;->lambdaFactory$(Lcom/vk/music/view/SearchContainer;)Lcom/vk/music/view/SearchResultContainer$Host;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/music/view/SearchResultContainer;->setHost(Lcom/vk/music/view/SearchResultContainer$Host;)V

    .line 349
    :cond_0
    return-void
.end method

.method private static pageToPosition(I)I
    .locals 1
    .param p0, "page"    # I
        .annotation build Lcom/vk/music/model/SearchModel$View$Page;
        .end annotation
    .end param

    .prologue
    .line 67
    packed-switch p0, :pswitch_data_0

    .line 72
    const/4 v0, 0x0

    :goto_0
    return v0

    .line 69
    :pswitch_0
    const/4 v0, 0x1

    goto :goto_0

    .line 67
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method

.method private static positionToPage(I)I
    .locals 1
    .param p0, "position"    # I
    .annotation build Lcom/vk/music/model/SearchModel$View$Page;
    .end annotation

    .prologue
    .line 58
    packed-switch p0, :pswitch_data_0

    .line 62
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

.method private switchToResults()V
    .locals 7

    .prologue
    const/4 v6, 0x0

    .line 297
    iget-object v3, p0, Lcom/vk/music/view/SearchContainer;->model:Lcom/vk/music/model/SearchModel;

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Lcom/vk/music/model/SearchModel;->setState(I)V

    .line 299
    iget-object v3, p0, Lcom/vk/music/view/SearchContainer;->searchSuggestionContainer:Lcom/vk/music/view/SearchSuggestionContainer;

    if-eqz v3, :cond_0

    .line 300
    iget-object v3, p0, Lcom/vk/music/view/SearchContainer;->searchSuggestionContainer:Lcom/vk/music/view/SearchSuggestionContainer;

    const/16 v4, 0x8

    invoke-virtual {v3, v4}, Lcom/vk/music/view/SearchSuggestionContainer;->setVisibility(I)V

    .line 301
    iget-object v3, p0, Lcom/vk/music/view/SearchContainer;->searchSuggestionContainer:Lcom/vk/music/view/SearchSuggestionContainer;

    invoke-virtual {v3}, Lcom/vk/music/view/SearchSuggestionContainer;->detach()V

    .line 304
    :cond_0
    iget-object v3, p0, Lcom/vk/music/view/SearchContainer;->searchBarView:Landroid/view/ViewGroup;

    invoke-virtual {v3}, Landroid/view/ViewGroup;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/support/design/widget/AppBarLayout$LayoutParams;

    .line 305
    .local v0, "params":Landroid/support/design/widget/AppBarLayout$LayoutParams;
    invoke-virtual {v0}, Landroid/support/design/widget/AppBarLayout$LayoutParams;->getScrollFlags()I

    move-result v3

    or-int/lit8 v3, v3, 0x1

    invoke-virtual {v0, v3}, Landroid/support/design/widget/AppBarLayout$LayoutParams;->setScrollFlags(I)V

    .line 306
    iget-object v3, p0, Lcom/vk/music/view/SearchContainer;->searchBarView:Landroid/view/ViewGroup;

    invoke-virtual {v3}, Landroid/view/ViewGroup;->requestLayout()V

    .line 308
    iget-object v3, p0, Lcom/vk/music/view/SearchContainer;->model:Lcom/vk/music/model/SearchModel;

    iget-object v4, p0, Lcom/vk/music/view/SearchContainer;->searchInputView:Landroid/widget/EditText;

    invoke-virtual {v4}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/vk/music/model/SearchModel;->setQuery(Ljava/lang/String;)V

    .line 309
    iget-object v3, p0, Lcom/vk/music/view/SearchContainer;->tabs:Landroid/support/design/widget/TabLayout;

    invoke-virtual {v3, v6}, Landroid/support/design/widget/TabLayout;->setVisibility(I)V

    .line 310
    iget-object v3, p0, Lcom/vk/music/view/SearchContainer;->pager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v3, v6}, Landroid/support/v4/view/ViewPager;->setVisibility(I)V

    .line 311
    iget-object v3, p0, Lcom/vk/music/view/SearchContainer;->pager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v3}, Landroid/support/v4/view/ViewPager;->getAdapter()Landroid/support/v4/view/PagerAdapter;

    move-result-object v3

    if-nez v3, :cond_1

    .line 312
    iget-object v3, p0, Lcom/vk/music/view/SearchContainer;->pager:Landroid/support/v4/view/ViewPager;

    new-instance v4, Lcom/vk/music/view/SearchContainer$SearchResultsPagerAdapter;

    const/4 v5, 0x0

    invoke-direct {v4, p0, v5}, Lcom/vk/music/view/SearchContainer$SearchResultsPagerAdapter;-><init>(Lcom/vk/music/view/SearchContainer;Lcom/vk/music/view/SearchContainer$1;)V

    invoke-virtual {v3, v4}, Landroid/support/v4/view/ViewPager;->setAdapter(Landroid/support/v4/view/PagerAdapter;)V

    .line 315
    :cond_1
    iget-object v3, p0, Lcom/vk/music/view/SearchContainer;->model:Lcom/vk/music/model/SearchModel;

    invoke-virtual {v3}, Lcom/vk/music/model/SearchModel;->getPage()I

    move-result v3

    invoke-static {v3}, Lcom/vk/music/view/SearchContainer;->pageToPosition(I)I

    move-result v1

    .line 316
    .local v1, "position":I
    iget-object v3, p0, Lcom/vk/music/view/SearchContainer;->tabs:Landroid/support/design/widget/TabLayout;

    invoke-virtual {v3, v1}, Landroid/support/design/widget/TabLayout;->getTabAt(I)Landroid/support/design/widget/TabLayout$Tab;

    move-result-object v2

    .line 317
    .local v2, "tab":Landroid/support/design/widget/TabLayout$Tab;
    if-eqz v2, :cond_2

    .line 318
    invoke-virtual {v2}, Landroid/support/design/widget/TabLayout$Tab;->select()V

    .line 320
    :cond_2
    iget-object v3, p0, Lcom/vk/music/view/SearchContainer;->pager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v3, v1}, Landroid/support/v4/view/ViewPager;->setCurrentItem(I)V

    .line 322
    iget-object v3, p0, Lcom/vk/music/view/SearchContainer;->searchBarView:Landroid/view/ViewGroup;

    invoke-static {v3, v6}, Lcom/vkontakte/android/ViewUtils;->setBottomPadding(Landroid/view/View;I)V

    .line 324
    iget-object v3, p0, Lcom/vk/music/view/SearchContainer;->focusEaterView:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->requestFocus()Z

    .line 325
    iget-object v3, p0, Lcom/vk/music/view/SearchContainer;->activity:Landroid/app/Activity;

    invoke-static {v3}, Lcom/vk/core/util/KeyboardUtils;->hideKeyboard(Landroid/content/Context;)V

    .line 326
    return-void
.end method

.method private switchToSearching()V
    .locals 7

    .prologue
    const/16 v6, 0x8

    const/4 v3, 0x0

    const/4 v5, -0x1

    .line 268
    iget-object v2, p0, Lcom/vk/music/view/SearchContainer;->model:Lcom/vk/music/model/SearchModel;

    invoke-virtual {v2, v3}, Lcom/vk/music/model/SearchModel;->setState(I)V

    .line 270
    iget-object v2, p0, Lcom/vk/music/view/SearchContainer;->searchSuggestionContainer:Lcom/vk/music/view/SearchSuggestionContainer;

    if-nez v2, :cond_0

    .line 271
    new-instance v2, Lcom/vk/music/view/SearchSuggestionContainer;

    iget-object v3, p0, Lcom/vk/music/view/SearchContainer;->activity:Landroid/app/Activity;

    iget-object v4, p0, Lcom/vk/music/view/SearchContainer;->model:Lcom/vk/music/model/SearchModel;

    invoke-virtual {v4}, Lcom/vk/music/model/SearchModel;->getSearchSuggestionModel()Lcom/vk/music/model/SearchSuggestionModel;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lcom/vk/music/view/SearchSuggestionContainer;-><init>(Landroid/content/Context;Lcom/vk/music/model/SearchSuggestionModel;)V

    iput-object v2, p0, Lcom/vk/music/view/SearchContainer;->searchSuggestionContainer:Lcom/vk/music/view/SearchSuggestionContainer;

    .line 272
    iget-object v2, p0, Lcom/vk/music/view/SearchContainer;->searchSuggestionContainer:Lcom/vk/music/view/SearchSuggestionContainer;

    invoke-static {p0}, Lcom/vk/music/view/SearchContainer$$Lambda$5;->lambdaFactory$(Lcom/vk/music/view/SearchContainer;)Lcom/vk/music/view/SearchSuggestionContainer$Listener;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/vk/music/view/SearchSuggestionContainer;->setListener(Lcom/vk/music/view/SearchSuggestionContainer$Listener;)V

    .line 273
    invoke-virtual {p0}, Lcom/vk/music/view/SearchContainer;->generateDefaultLayoutParams()Landroid/support/design/widget/CoordinatorLayout$LayoutParams;

    move-result-object v0

    .line 274
    .local v0, "layoutParams":Landroid/support/design/widget/CoordinatorLayout$LayoutParams;
    new-instance v2, Landroid/support/design/widget/AppBarLayout$ScrollingViewBehavior;

    invoke-direct {v2}, Landroid/support/design/widget/AppBarLayout$ScrollingViewBehavior;-><init>()V

    invoke-virtual {v0, v2}, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->setBehavior(Landroid/support/design/widget/CoordinatorLayout$Behavior;)V

    .line 275
    iput v5, v0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->width:I

    .line 276
    iput v5, v0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->height:I

    .line 277
    iget-object v2, p0, Lcom/vk/music/view/SearchContainer;->searchSuggestionContainer:Lcom/vk/music/view/SearchSuggestionContainer;

    invoke-virtual {p0, v2, v0}, Lcom/vk/music/view/SearchContainer;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 281
    .end local v0    # "layoutParams":Landroid/support/design/widget/CoordinatorLayout$LayoutParams;
    :goto_0
    iget-object v2, p0, Lcom/vk/music/view/SearchContainer;->searchSuggestionContainer:Lcom/vk/music/view/SearchSuggestionContainer;

    iget-object v3, p0, Lcom/vk/music/view/SearchContainer;->searchInputView:Landroid/widget/EditText;

    invoke-virtual {v2, v3}, Lcom/vk/music/view/SearchSuggestionContainer;->attach(Landroid/widget/EditText;)V

    .line 283
    iget-object v2, p0, Lcom/vk/music/view/SearchContainer;->searchBarView:Landroid/view/ViewGroup;

    invoke-virtual {v2}, Landroid/view/ViewGroup;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Landroid/support/design/widget/AppBarLayout$LayoutParams;

    .line 284
    .local v1, "params":Landroid/support/design/widget/AppBarLayout$LayoutParams;
    invoke-virtual {v1}, Landroid/support/design/widget/AppBarLayout$LayoutParams;->getScrollFlags()I

    move-result v2

    and-int/lit8 v2, v2, -0x2

    invoke-virtual {v1, v2}, Landroid/support/design/widget/AppBarLayout$LayoutParams;->setScrollFlags(I)V

    .line 285
    iget-object v2, p0, Lcom/vk/music/view/SearchContainer;->searchBarView:Landroid/view/ViewGroup;

    invoke-virtual {v2}, Landroid/view/ViewGroup;->requestLayout()V

    .line 287
    iget-object v2, p0, Lcom/vk/music/view/SearchContainer;->searchBarView:Landroid/view/ViewGroup;

    sget v3, Lcom/vk/music/view/SearchContainer;->SEARCH_BAR_BOTTOM_PADDING:I

    invoke-static {v2, v3}, Lcom/vkontakte/android/ViewUtils;->setBottomPadding(Landroid/view/View;I)V

    .line 289
    iget-object v2, p0, Lcom/vk/music/view/SearchContainer;->tabs:Landroid/support/design/widget/TabLayout;

    invoke-virtual {v2, v6}, Landroid/support/design/widget/TabLayout;->setVisibility(I)V

    .line 290
    iget-object v2, p0, Lcom/vk/music/view/SearchContainer;->pager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v2, v6}, Landroid/support/v4/view/ViewPager;->setVisibility(I)V

    .line 292
    iget-object v2, p0, Lcom/vk/music/view/SearchContainer;->searchInputView:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->requestFocus()Z

    .line 293
    iget-object v2, p0, Lcom/vk/music/view/SearchContainer;->searchInputView:Landroid/widget/EditText;

    invoke-static {v2}, Lcom/vk/core/util/KeyboardUtils;->showKeyboard(Landroid/view/View;)V

    .line 294
    return-void

    .line 279
    .end local v1    # "params":Landroid/support/design/widget/AppBarLayout$LayoutParams;
    :cond_0
    iget-object v2, p0, Lcom/vk/music/view/SearchContainer;->searchSuggestionContainer:Lcom/vk/music/view/SearchSuggestionContainer;

    invoke-virtual {v2, v3}, Lcom/vk/music/view/SearchSuggestionContainer;->setVisibility(I)V

    goto :goto_0
.end method


# virtual methods
.method synthetic lambda$ensureSearchResultByArtistContainer$5()V
    .locals 4

    .prologue
    .line 354
    iget-object v0, p0, Lcom/vk/music/view/SearchContainer;->lifecycleHandler:Lcom/vk/core/widget/LifecycleHandler;

    iget-object v1, p0, Lcom/vk/music/view/SearchContainer;->userListener:Lcom/vk/music/view/SearchContainer$UserListener;

    .line 355
    invoke-virtual {v1}, Lcom/vk/music/view/SearchContainer$UserListener;->getUniqueId()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lcom/vk/music/fragment/PlaylistsFragment$Builder;

    invoke-direct {v2}, Lcom/vk/music/fragment/PlaylistsFragment$Builder;-><init>()V

    const/4 v3, 0x1

    .line 356
    invoke-virtual {v2, v3}, Lcom/vk/music/fragment/PlaylistsFragment$Builder;->selectMy(Z)Lcom/vk/music/fragment/PlaylistsFragment$Builder;

    move-result-object v2

    iget-object v3, p0, Lcom/vk/music/view/SearchContainer;->activity:Landroid/app/Activity;

    invoke-virtual {v2, v3}, Lcom/vk/music/fragment/PlaylistsFragment$Builder;->intent(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v2

    const/16 v3, 0xc

    .line 354
    invoke-virtual {v0, v1, v2, v3}, Lcom/vk/core/widget/LifecycleHandler;->startActivityForResult(Ljava/lang/String;Landroid/content/Intent;I)V

    return-void
.end method

.method synthetic lambda$ensureSearchResultByTitleContainer$4()V
    .locals 4

    .prologue
    .line 343
    iget-object v0, p0, Lcom/vk/music/view/SearchContainer;->lifecycleHandler:Lcom/vk/core/widget/LifecycleHandler;

    iget-object v1, p0, Lcom/vk/music/view/SearchContainer;->userListener:Lcom/vk/music/view/SearchContainer$UserListener;

    .line 344
    invoke-virtual {v1}, Lcom/vk/music/view/SearchContainer$UserListener;->getUniqueId()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lcom/vk/music/fragment/PlaylistsFragment$Builder;

    invoke-direct {v2}, Lcom/vk/music/fragment/PlaylistsFragment$Builder;-><init>()V

    const/4 v3, 0x1

    .line 345
    invoke-virtual {v2, v3}, Lcom/vk/music/fragment/PlaylistsFragment$Builder;->selectMy(Z)Lcom/vk/music/fragment/PlaylistsFragment$Builder;

    move-result-object v2

    iget-object v3, p0, Lcom/vk/music/view/SearchContainer;->activity:Landroid/app/Activity;

    invoke-virtual {v2, v3}, Lcom/vk/music/fragment/PlaylistsFragment$Builder;->intent(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v2

    const/16 v3, 0xb

    .line 343
    invoke-virtual {v0, v1, v2, v3}, Lcom/vk/core/widget/LifecycleHandler;->startActivityForResult(Ljava/lang/String;Landroid/content/Intent;I)V

    return-void
.end method

.method synthetic lambda$new$0(Lcom/vk/music/model/SearchModel;Landroid/view/View;)V
    .locals 5
    .param p1, "model"    # Lcom/vk/music/model/SearchModel;
    .param p2, "v"    # Landroid/view/View;

    .prologue
    const/4 v3, 0x0

    const/16 v4, 0xa

    .line 196
    invoke-virtual {p1}, Lcom/vk/music/model/SearchModel;->getState()I

    move-result v1

    if-nez v1, :cond_2

    .line 197
    iget-object v1, p0, Lcom/vk/music/view/SearchContainer;->searchInputView:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isGraphic(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 198
    iget-object v1, p0, Lcom/vk/music/view/SearchContainer;->searchInputView:Landroid/widget/EditText;

    invoke-virtual {v1, v3}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 209
    :cond_0
    :goto_0
    return-void

    .line 200
    :cond_1
    new-instance v1, Landroid/content/Intent;

    const-string/jumbo v2, "android.speech.action.RECOGNIZE_SPEECH"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string/jumbo v2, "android.speech.extra.LANGUAGE_MODEL"

    const-string/jumbo v3, "free_form"

    .line 201
    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v1

    const-string/jumbo v2, "android.speech.extra.MAX_RESULTS"

    .line 202
    invoke-virtual {v1, v2, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    move-result-object v0

    .line 203
    .local v0, "intent":Landroid/content/Intent;
    iget-object v1, p0, Lcom/vk/music/view/SearchContainer;->lifecycleHandler:Lcom/vk/core/widget/LifecycleHandler;

    iget-object v2, p0, Lcom/vk/music/view/SearchContainer;->userListener:Lcom/vk/music/view/SearchContainer$UserListener;

    invoke-virtual {v2}, Lcom/vk/music/view/SearchContainer$UserListener;->getUniqueId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2, v0, v4}, Lcom/vk/core/widget/LifecycleHandler;->startActivityForResult(Ljava/lang/String;Landroid/content/Intent;I)V

    goto :goto_0

    .line 205
    .end local v0    # "intent":Landroid/content/Intent;
    :cond_2
    invoke-virtual {p1}, Lcom/vk/music/model/SearchModel;->getState()I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    .line 206
    iget-object v1, p0, Lcom/vk/music/view/SearchContainer;->searchInputView:Landroid/widget/EditText;

    invoke-virtual {v1, v3}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 207
    invoke-direct {p0}, Lcom/vk/music/view/SearchContainer;->switchToSearching()V

    goto :goto_0
.end method

.method synthetic lambda$new$1(Lcom/vk/music/model/SearchModel;Landroid/view/View;Z)V
    .locals 1
    .param p1, "model"    # Lcom/vk/music/model/SearchModel;
    .param p2, "v"    # Landroid/view/View;
    .param p3, "hasFocus"    # Z

    .prologue
    .line 223
    if-eqz p3, :cond_0

    .line 224
    invoke-virtual {p1}, Lcom/vk/music/model/SearchModel;->getState()I

    move-result v0

    if-eqz v0, :cond_0

    .line 225
    invoke-direct {p0}, Lcom/vk/music/view/SearchContainer;->switchToSearching()V

    .line 228
    :cond_0
    return-void
.end method

.method synthetic lambda$new$2(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .locals 1
    .param p1, "v"    # Landroid/widget/TextView;
    .param p2, "actionId"    # I
    .param p3, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 230
    const/4 v0, 0x3

    if-ne p2, v0, :cond_0

    .line 231
    invoke-direct {p0}, Lcom/vk/music/view/SearchContainer;->switchToResults()V

    .line 232
    const/4 v0, 0x1

    .line 234
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method synthetic lambda$new$3(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 238
    iget-object v0, p0, Lcom/vk/music/view/SearchContainer;->activity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    return-void
.end method
