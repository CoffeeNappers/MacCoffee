.class public Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;
.super Lcom/vkontakte/android/fragments/base/SegmenterFragment;
.source "ExtendedSearchFragment.java"

# interfaces
.implements Lcom/vkontakte/android/fragments/BackListener;
.implements Lcom/vkontakte/android/functions/VoidF1;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$Callbacks;,
        Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$Holder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/fragments/base/SegmenterFragment",
        "<",
        "Lcom/vkontakte/android/api/users/UsersSearch$SearchProfile;",
        ">;",
        "Lcom/vkontakte/android/fragments/BackListener;",
        "Lcom/vkontakte/android/functions/VoidF1",
        "<",
        "Lcom/vkontakte/android/UserProfile;",
        ">;"
    }
.end annotation


# static fields
.field static final AGE_DIFF:I = 0xd

.field static final MAX_AGE:I = 0x50

.field static final MIN_AGE:I = 0xe

.field static final PAGE_SIZE:I = 0x32


# instance fields
.field mAgeFrom:I

.field mAgeFromSpinner:Landroid/widget/Spinner;

.field mAgeTo:I

.field mAgeToSpinner:Landroid/widget/Spinner;

.field final mCallbacks:Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$Callbacks;

.field mChanged:Z

.field mCityButton:Landroid/widget/TextView;

.field mCityId:I

.field mClear:Landroid/widget/ImageView;

.field mCountryId:I

.field mExpandView:Lcom/vkontakte/android/ui/layout/ExpandableBarLayout;

.field mPresetQuery:Ljava/lang/String;

.field mQueryField:Landroid/widget/TextView;

.field final mRecommendations:Lcom/vkontakte/android/ui/util/SearchSegmenter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/ui/util/SearchSegmenter",
            "<",
            "Lcom/vkontakte/android/api/users/UsersSearch$SearchProfile;",
            ">;"
        }
    .end annotation
.end field

.field mRelation:I

.field mSearchIcon:Landroid/view/View;

.field mSearchMode:Z

.field final mSearchSegmenter:Lcom/vkontakte/android/ui/util/SearchSegmenter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/ui/util/SearchSegmenter",
            "<",
            "Lcom/vkontakte/android/api/users/UsersSearch$SearchProfile;",
            ">;"
        }
    .end annotation
.end field

.field mSex:I


# direct methods
.method public constructor <init>()V
    .locals 4

    .prologue
    const/16 v3, 0x32

    .line 86
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/base/SegmenterFragment;-><init>()V

    .line 65
    new-instance v0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$Callbacks;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$Callbacks;-><init>(Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$1;)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mCallbacks:Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$Callbacks;

    .line 66
    new-instance v0, Lcom/vkontakte/android/ui/util/SearchSegmenter;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mCallbacks:Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$Callbacks;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mCallbacks:Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$Callbacks;

    invoke-direct {v0, v1, v2, v3}, Lcom/vkontakte/android/ui/util/SearchSegmenter;-><init>(Lcom/vkontakte/android/fragments/friends/SearchIndexer$Provider;Lcom/vkontakte/android/ui/util/SearchSegmenter$Generator;I)V

    sget-object v1, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const v2, 0x7f0805e5

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/util/SearchSegmenter;->setGlobalTitle(Ljava/lang/CharSequence;)Lcom/vkontakte/android/ui/util/SearchSegmenter;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mSearchSegmenter:Lcom/vkontakte/android/ui/util/SearchSegmenter;

    .line 67
    new-instance v0, Lcom/vkontakte/android/ui/util/SearchSegmenter;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mCallbacks:Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$Callbacks;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mCallbacks:Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$Callbacks;

    invoke-direct {v0, v1, v2, v3}, Lcom/vkontakte/android/ui/util/SearchSegmenter;-><init>(Lcom/vkontakte/android/fragments/friends/SearchIndexer$Provider;Lcom/vkontakte/android/ui/util/SearchSegmenter$Generator;I)V

    iget-object v1, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mCallbacks:Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$Callbacks;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/util/SearchSegmenter;->setLoadingListener(Lcom/vkontakte/android/ui/util/SearchSegmenter$LoadingListener;)Lcom/vkontakte/android/ui/util/SearchSegmenter;

    move-result-object v0

    sget-object v1, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const v2, 0x7f080592

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/util/SearchSegmenter;->setGlobalTitle(Ljava/lang/CharSequence;)Lcom/vkontakte/android/ui/util/SearchSegmenter;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mRecommendations:Lcom/vkontakte/android/ui/util/SearchSegmenter;

    .line 87
    const v0, 0x7f030066

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->setLayout(I)V

    .line 88
    return-void
.end method

.method static synthetic access$100(Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;

    .prologue
    .line 58
    iget-object v0, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$200(Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;)Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;

    .prologue
    .line 58
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->getAdapter()Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$300(Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;

    .prologue
    .line 58
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->showContent()V

    return-void
.end method


# virtual methods
.method addFriend(Lcom/vkontakte/android/api/users/UsersSearch$SearchProfile;I)V
    .locals 2
    .param p1, "user"    # Lcom/vkontakte/android/api/users/UsersSearch$SearchProfile;
    .param p2, "position"    # I

    .prologue
    .line 318
    iget v0, p1, Lcom/vkontakte/android/api/users/UsersSearch$SearchProfile;->uid:I

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vkontakte/android/api/friends/FriendsAdd;->createFriendsAddAndSendAllStats(ILjava/lang/String;)Lcom/vkontakte/android/api/friends/FriendsAdd;

    move-result-object v0

    .line 319
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/friends/FriendsAdd;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    new-instance v1, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$4;

    invoke-direct {v1, p0, p0, p1, p2}, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$4;-><init>(Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;Landroid/app/Fragment;Lcom/vkontakte/android/api/users/UsersSearch$SearchProfile;I)V

    .line 320
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 329
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 330
    return-void
.end method

.method protected createAdapter()Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vkontakte/android/fragments/base/SegmenterFragment",
            "<",
            "Lcom/vkontakte/android/api/users/UsersSearch$SearchProfile;",
            ">.GridAdapter<",
            "Lcom/vkontakte/android/api/users/UsersSearch$SearchProfile;",
            "Lcom/vkontakte/android/ui/holder/UserHolder",
            "<",
            "Lcom/vkontakte/android/api/users/UsersSearch$SearchProfile;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 137
    new-instance v0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$1;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$1;-><init>(Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;)V

    return-object v0
.end method

.method protected doLoadData(II)V
    .locals 2
    .param p1, "offset"    # I
    .param p2, "count"    # I

    .prologue
    .line 171
    iget-object v0, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mRecommendations:Lcom/vkontakte/android/ui/util/SearchSegmenter;

    const-string/jumbo v1, ""

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/util/SearchSegmenter;->search(Ljava/lang/String;)V

    .line 172
    return-void
.end method

.method public f(Lcom/vkontakte/android/UserProfile;)V
    .locals 2
    .param p1, "profile"    # Lcom/vkontakte/android/UserProfile;

    .prologue
    .line 176
    new-instance v0, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;

    iget v1, p1, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-direct {v0, v1}, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;-><init>(I)V

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;->go(Landroid/content/Context;)Z

    .line 177
    return-void
.end method

.method public bridge synthetic f(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 58
    check-cast p1, Lcom/vkontakte/android/UserProfile;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->f(Lcom/vkontakte/android/UserProfile;)V

    return-void
.end method

.method protected getColumnsCount()I
    .locals 1

    .prologue
    .line 157
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->isTablet:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x2

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method protected getSegmenter()Lcom/vkontakte/android/ui/util/Segmenter;
    .locals 1

    .prologue
    .line 132
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mSearchMode:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mSearchSegmenter:Lcom/vkontakte/android/ui/util/SearchSegmenter;

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mRecommendations:Lcom/vkontakte/android/ui/util/SearchSegmenter;

    goto :goto_0
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 92
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/base/SegmenterFragment;->onActivityCreated(Landroid/os/Bundle;)V

    .line 93
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->loaded:Z

    if-nez v0, :cond_0

    .line 94
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->loadData()V

    .line 96
    :cond_0
    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 2
    .param p1, "reqCode"    # I
    .param p2, "resCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 124
    invoke-static {p1, p2, p3}, Lcom/vkontakte/android/utils/VoiceUtils;->getVoiceResult(IILandroid/content/Intent;)Ljava/lang/String;

    move-result-object v0

    .line 125
    .local v0, "voiceResult":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 126
    iget-object v1, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mQueryField:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 128
    :cond_0
    return-void
.end method

.method public onBackPressed()Z
    .locals 1

    .prologue
    .line 162
    iget-object v0, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mExpandView:Lcom/vkontakte/android/ui/layout/ExpandableBarLayout;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/layout/ExpandableBarLayout;->isOpened()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 163
    iget-object v0, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mExpandView:Lcom/vkontakte/android/ui/layout/ExpandableBarLayout;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/layout/ExpandableBarLayout;->closePanel()V

    .line 164
    const/4 v0, 0x1

    .line 166
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 100
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/base/SegmenterFragment;->onCreate(Landroid/os/Bundle;)V

    .line 101
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->setRefreshEnabled(Z)V

    .line 102
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "q"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 103
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "q"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mPresetQuery:Ljava/lang/String;

    .line 105
    :cond_0
    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 109
    invoke-super {p0, p1, p2}, Lcom/vkontakte/android/fragments/base/SegmenterFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 110
    iget-object v0, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mRecommendations:Lcom/vkontakte/android/ui/util/SearchSegmenter;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/util/SearchSegmenter;->attach(Landroid/support/v7/widget/RecyclerView;)V

    .line 111
    iget-object v0, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mSearchSegmenter:Lcom/vkontakte/android/ui/util/SearchSegmenter;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/util/SearchSegmenter;->attach(Landroid/support/v7/widget/RecyclerView;)V

    .line 113
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->setupSearchBar()V

    .line 114
    const v0, 0x7f10051d

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->setupExtendedParams(Landroid/view/View;)V

    .line 116
    const v0, 0x7f100255

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mSearchIcon:Landroid/view/View;

    .line 117
    const v0, 0x7f100254

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/ui/layout/ExpandableBarLayout;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mExpandView:Lcom/vkontakte/android/ui/layout/ExpandableBarLayout;

    .line 118
    iget-object v0, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mExpandView:Lcom/vkontakte/android/ui/layout/ExpandableBarLayout;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mCallbacks:Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$Callbacks;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/layout/ExpandableBarLayout;->setProgressListener(Lcom/vkontakte/android/functions/VoidFloat;)V

    .line 119
    iget-object v0, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mExpandView:Lcom/vkontakte/android/ui/layout/ExpandableBarLayout;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mCallbacks:Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$Callbacks;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/layout/ExpandableBarLayout;->setOpenListener(Lcom/vkontakte/android/functions/VoidFBool;)V

    .line 120
    return-void
.end method

.method selectCity()V
    .locals 4

    .prologue
    .line 307
    new-instance v1, Lcom/vkontakte/android/fragments/CitySelectFragment;

    invoke-direct {v1}, Lcom/vkontakte/android/fragments/CitySelectFragment;-><init>()V

    .line 308
    .local v1, "fragment":Lcom/vkontakte/android/fragments/CitySelectFragment;
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 309
    .local v0, "args":Landroid/os/Bundle;
    const-string/jumbo v2, "hint"

    const v3, 0x7f0801cd

    invoke-virtual {p0, v3}, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 310
    const-string/jumbo v2, "country"

    iget v3, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mCountryId:I

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 311
    const-string/jumbo v3, "show_none"

    iget v2, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mCityId:I

    if-lez v2, :cond_0

    const/4 v2, 0x1

    :goto_0
    invoke-virtual {v0, v3, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 312
    invoke-virtual {v1, v0}, Lcom/vkontakte/android/fragments/CitySelectFragment;->setArguments(Landroid/os/Bundle;)V

    .line 313
    iget-object v2, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mCallbacks:Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$Callbacks;

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/fragments/CitySelectFragment;->setCallback(Lcom/vkontakte/android/fragments/DatabaseSearchFragment$Callback;)V

    .line 314
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v2

    const-string/jumbo v3, "city"

    invoke-virtual {v1, v2, v3}, Lcom/vkontakte/android/fragments/CitySelectFragment;->show(Landroid/app/FragmentManager;Ljava/lang/String;)V

    .line 315
    return-void

    .line 311
    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method setupAgeParams(Landroid/view/View;)V
    .locals 9
    .param p1, "root"    # Landroid/view/View;

    .prologue
    const v8, 0x1090009

    const v5, 0x1090008

    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 259
    new-instance v0, Landroid/widget/ArrayAdapter;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-direct {v0, v3, v5}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I)V

    .line 260
    .local v0, "ageAdapterFrom":Landroid/widget/ArrayAdapter;, "Landroid/widget/ArrayAdapter<Ljava/lang/String;>;"
    invoke-virtual {v0, v8}, Landroid/widget/ArrayAdapter;->setDropDownViewResource(I)V

    .line 261
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f08024b

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/widget/ArrayAdapter;->add(Ljava/lang/Object;)V

    .line 262
    new-instance v1, Landroid/widget/ArrayAdapter;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-direct {v1, v3, v5}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I)V

    .line 263
    .local v1, "ageAdapterTo":Landroid/widget/ArrayAdapter;, "Landroid/widget/ArrayAdapter<Ljava/lang/String;>;"
    invoke-virtual {v1, v8}, Landroid/widget/ArrayAdapter;->setDropDownViewResource(I)V

    .line 264
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f080708

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/widget/ArrayAdapter;->add(Ljava/lang/Object;)V

    .line 265
    const/16 v2, 0xe

    .local v2, "i":I
    :goto_0
    const/16 v3, 0x50

    if-gt v2, v3, :cond_0

    .line 266
    const v3, 0x7f0800c3

    new-array v4, v7, [Ljava/lang/Object;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v6

    invoke-virtual {p0, v3, v4}, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/widget/ArrayAdapter;->add(Ljava/lang/Object;)V

    .line 267
    const v3, 0x7f0800c4

    new-array v4, v7, [Ljava/lang/Object;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v6

    invoke-virtual {p0, v3, v4}, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/widget/ArrayAdapter;->add(Ljava/lang/Object;)V

    .line 265
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 269
    :cond_0
    const v3, 0x7f100523

    invoke-virtual {p1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/Spinner;

    iput-object v3, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mAgeFromSpinner:Landroid/widget/Spinner;

    .line 270
    const v3, 0x7f100524

    invoke-virtual {p1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/Spinner;

    iput-object v3, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mAgeToSpinner:Landroid/widget/Spinner;

    .line 271
    iget-object v3, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mAgeFromSpinner:Landroid/widget/Spinner;

    invoke-virtual {v3, v0}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 272
    iget-object v3, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mAgeToSpinner:Landroid/widget/Spinner;

    invoke-virtual {v3, v1}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 273
    iget-object v3, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mAgeFromSpinner:Landroid/widget/Spinner;

    iget-object v4, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mCallbacks:Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$Callbacks;

    invoke-virtual {v3, v4}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 274
    iget-object v3, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mAgeToSpinner:Landroid/widget/Spinner;

    iget-object v4, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mCallbacks:Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$Callbacks;

    invoke-virtual {v3, v4}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 275
    return-void
.end method

.method setupExtendedParams(Landroid/view/View;)V
    .locals 0
    .param p1, "root"    # Landroid/view/View;

    .prologue
    .line 244
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->setupRegionParams(Landroid/view/View;)V

    .line 245
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->setupGenderParams(Landroid/view/View;)V

    .line 246
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->setupAgeParams(Landroid/view/View;)V

    .line 247
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->setupRelationParams(Landroid/view/View;)V

    .line 248
    return-void
.end method

.method setupGenderParams(Landroid/view/View;)V
    .locals 2
    .param p1, "root"    # Landroid/view/View;

    .prologue
    .line 278
    const v0, 0x7f100520

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CompoundButton;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mCallbacks:Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$Callbacks;

    invoke-virtual {v0, v1}, Landroid/widget/CompoundButton;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 279
    const v0, 0x7f100521

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CompoundButton;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mCallbacks:Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$Callbacks;

    invoke-virtual {v0, v1}, Landroid/widget/CompoundButton;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 280
    const v0, 0x7f100522

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CompoundButton;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mCallbacks:Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$Callbacks;

    invoke-virtual {v0, v1}, Landroid/widget/CompoundButton;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 281
    return-void
.end method

.method setupRegionParams(Landroid/view/View;)V
    .locals 6
    .param p1, "root"    # Landroid/view/View;

    .prologue
    const/4 v5, 0x1

    .line 284
    const v2, 0x7f10051e

    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Spinner;

    .line 285
    .local v1, "countrySpinner":Landroid/widget/Spinner;
    const v2, 0x7f10051f

    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mCityButton:Landroid/widget/TextView;

    .line 286
    iget-object v2, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mCityButton:Landroid/widget/TextView;

    iget-object v3, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mCallbacks:Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$Callbacks;

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 288
    new-instance v0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$3;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    const v3, 0x1090008

    const v4, 0x7f0801ce

    invoke-virtual {p0, v4}, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v5, v5, v4}, Lcom/vkontakte/android/data/database/Country;->getCountries(ZZLjava/lang/String;)Ljava/util/ArrayList;

    move-result-object v4

    invoke-direct {v0, p0, v2, v3, v4}, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$3;-><init>(Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;Landroid/content/Context;ILjava/util/List;)V

    .line 301
    .local v0, "countryAdapter":Landroid/widget/ArrayAdapter;, "Landroid/widget/ArrayAdapter<Lcom/vkontakte/android/data/database/Country;>;"
    const v2, 0x1090009

    invoke-virtual {v0, v2}, Landroid/widget/ArrayAdapter;->setDropDownViewResource(I)V

    .line 302
    invoke-virtual {v1, v0}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 303
    iget-object v2, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mCallbacks:Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$Callbacks;

    invoke-virtual {v1, v2}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 304
    return-void
.end method

.method setupRelationParams(Landroid/view/View;)V
    .locals 6
    .param p1, "root"    # Landroid/view/View;

    .prologue
    .line 251
    new-instance v0, Lcom/vkontakte/android/ui/adapters/RelationAdapter;

    const/4 v2, 0x1

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    const v4, 0x1090008

    invoke-static {}, Lcom/vkontakte/android/Relation;->values()[Lcom/vkontakte/android/Relation;

    move-result-object v5

    invoke-direct {v0, v2, v3, v4, v5}, Lcom/vkontakte/android/ui/adapters/RelationAdapter;-><init>(ZLandroid/content/Context;I[Lcom/vkontakte/android/Relation;)V

    .line 252
    .local v0, "relationAdapter":Lcom/vkontakte/android/ui/adapters/RelationAdapter;
    const v2, 0x1090009

    invoke-virtual {v0, v2}, Lcom/vkontakte/android/ui/adapters/RelationAdapter;->setDropDownViewResource(I)V

    .line 253
    const v2, 0x7f100525

    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Spinner;

    .line 254
    .local v1, "relationSpinner":Landroid/widget/Spinner;
    invoke-virtual {v1, v0}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 255
    iget-object v2, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mCallbacks:Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$Callbacks;

    invoke-virtual {v1, v2}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 256
    return-void
.end method

.method setupSearchBar()V
    .locals 6

    .prologue
    .line 180
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v2

    const v3, 0x7f03009c

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->getToolbar()Landroid/support/v7/widget/Toolbar;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v2, v3, v4, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 181
    .local v0, "searchView":Landroid/view/View;
    const v2, 0x7f100296

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    .line 182
    .local v1, "voice":Landroid/widget/ImageView;
    const v2, 0x7f100295

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    iput-object v2, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mClear:Landroid/widget/ImageView;

    .line 183
    const v2, 0x7f100294

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mQueryField:Landroid/widget/TextView;

    .line 185
    iget-object v2, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mClear:Landroid/widget/ImageView;

    iget-object v3, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mCallbacks:Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$Callbacks;

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 186
    iget-object v2, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mCallbacks:Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$Callbacks;

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 187
    iget-object v2, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mQueryField:Landroid/widget/TextView;

    iget-object v3, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mCallbacks:Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$Callbacks;

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 189
    iget-object v2, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mQueryField:Landroid/widget/TextView;

    iget-object v3, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mCallbacks:Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$Callbacks;

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    .line 190
    iget-object v2, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mQueryField:Landroid/widget/TextView;

    iget-object v3, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mPresetQuery:Ljava/lang/String;

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 191
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x17

    if-ge v2, v3, :cond_0

    .line 192
    iget-object v2, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mQueryField:Landroid/widget/TextView;

    new-instance v3, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$2;

    invoke-direct {v3, p0}, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$2;-><init>(Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;)V

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setCustomSelectionActionModeCallback(Landroid/view/ActionMode$Callback;)V

    .line 215
    :cond_0
    invoke-static {}, Lcom/vkontakte/android/utils/VoiceUtils;->voiceSearchAvailable()Z

    move-result v2

    if-nez v2, :cond_1

    .line 216
    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 218
    :cond_1
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->getToolbar()Landroid/support/v7/widget/Toolbar;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/support/v7/widget/Toolbar;->addView(Landroid/view/View;)V

    .line 219
    return-void
.end method

.method updateFilter()V
    .locals 1

    .prologue
    .line 222
    iget-object v0, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mQueryField:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->updateFilter(Ljava/lang/String;)V

    .line 223
    return-void
.end method

.method updateFilter(Ljava/lang/String;)V
    .locals 1
    .param p1, "query"    # Ljava/lang/String;

    .prologue
    .line 226
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mCountryId:I

    if-nez v0, :cond_0

    iget v0, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mCityId:I

    if-nez v0, :cond_0

    iget v0, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mSex:I

    if-nez v0, :cond_0

    iget v0, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mAgeFrom:I

    if-nez v0, :cond_0

    iget v0, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mAgeTo:I

    if-nez v0, :cond_0

    iget v0, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mRelation:I

    if-eqz v0, :cond_3

    .line 227
    :cond_0
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mSearchMode:Z

    if-nez v0, :cond_1

    .line 228
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mSearchMode:Z

    .line 229
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->updateDecorator()V

    .line 230
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->updateList()V

    .line 232
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mSearchSegmenter:Lcom/vkontakte/android/ui/util/SearchSegmenter;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/util/SearchSegmenter;->clear()V

    .line 233
    iget-object v0, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mSearchSegmenter:Lcom/vkontakte/android/ui/util/SearchSegmenter;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/ui/util/SearchSegmenter;->search(Ljava/lang/String;)V

    .line 241
    :cond_2
    :goto_0
    return-void

    .line 235
    :cond_3
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mSearchMode:Z

    if-eqz v0, :cond_2

    .line 236
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mSearchMode:Z

    .line 237
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->updateDecorator()V

    .line 238
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->updateList()V

    goto :goto_0
.end method
