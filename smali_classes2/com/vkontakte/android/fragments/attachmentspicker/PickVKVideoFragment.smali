.class public Lcom/vkontakte/android/fragments/attachmentspicker/PickVKVideoFragment;
.super Lme/grishka/appkit/fragments/LoaderFragment;
.source "PickVKVideoFragment.java"

# interfaces
.implements Lcom/vk/attachpicker/SupportExternalToolbarContainer;
.implements Lcom/vkontakte/android/fragments/BackListener;


# static fields
.field private static final INNER_FRAGMENT_TAG:Ljava/lang/String; = "INNER_VIDEO_FRAGMENT"


# instance fields
.field private mAddedVideosFragment:Lcom/vkontakte/android/fragments/videos/AddedVideosFragment;

.field private mCurrentPos:I

.field mSearchView:Lcom/vkontakte/android/ui/SearchViewWrapper;

.field mTabs:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Landroid/app/Fragment;",
            ">;"
        }
    .end annotation
.end field

.field private mTaggedVideosFragment:Lcom/vkontakte/android/fragments/videos/TaggedVideosFragment;

.field mTitles:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mUploadedVideosFragment:Lcom/vkontakte/android/fragments/videos/UploadedVideosFragment;

.field private mVideoAlbumsFragment:Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment;

.field private needRecreateInnerFragment:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 57
    const v0, 0x7f0300fb

    invoke-direct {p0, v0}, Lme/grishka/appkit/fragments/LoaderFragment;-><init>(I)V

    .line 51
    const/4 v0, -0x1

    iput v0, p0, Lcom/vkontakte/android/fragments/attachmentspicker/PickVKVideoFragment;->mCurrentPos:I

    .line 52
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/attachmentspicker/PickVKVideoFragment;->needRecreateInnerFragment:Z

    .line 58
    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/fragments/attachmentspicker/PickVKVideoFragment;)Lcom/vkontakte/android/fragments/videos/AddedVideosFragment;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/attachmentspicker/PickVKVideoFragment;

    .prologue
    .line 40
    iget-object v0, p0, Lcom/vkontakte/android/fragments/attachmentspicker/PickVKVideoFragment;->mAddedVideosFragment:Lcom/vkontakte/android/fragments/videos/AddedVideosFragment;

    return-object v0
.end method

.method static synthetic access$002(Lcom/vkontakte/android/fragments/attachmentspicker/PickVKVideoFragment;Lcom/vkontakte/android/fragments/videos/AddedVideosFragment;)Lcom/vkontakte/android/fragments/videos/AddedVideosFragment;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/attachmentspicker/PickVKVideoFragment;
    .param p1, "x1"    # Lcom/vkontakte/android/fragments/videos/AddedVideosFragment;

    .prologue
    .line 40
    iput-object p1, p0, Lcom/vkontakte/android/fragments/attachmentspicker/PickVKVideoFragment;->mAddedVideosFragment:Lcom/vkontakte/android/fragments/videos/AddedVideosFragment;

    return-object p1
.end method

.method static synthetic access$100(Lcom/vkontakte/android/fragments/attachmentspicker/PickVKVideoFragment;Landroid/app/Fragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/attachmentspicker/PickVKVideoFragment;
    .param p1, "x1"    # Landroid/app/Fragment;

    .prologue
    .line 40
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/attachmentspicker/PickVKVideoFragment;->ensureFragmentProvidesNoToolbar(Landroid/app/Fragment;)V

    return-void
.end method

.method static synthetic access$200(Lcom/vkontakte/android/fragments/attachmentspicker/PickVKVideoFragment;)Lcom/vkontakte/android/fragments/videos/UploadedVideosFragment;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/attachmentspicker/PickVKVideoFragment;

    .prologue
    .line 40
    iget-object v0, p0, Lcom/vkontakte/android/fragments/attachmentspicker/PickVKVideoFragment;->mUploadedVideosFragment:Lcom/vkontakte/android/fragments/videos/UploadedVideosFragment;

    return-object v0
.end method

.method static synthetic access$202(Lcom/vkontakte/android/fragments/attachmentspicker/PickVKVideoFragment;Lcom/vkontakte/android/fragments/videos/UploadedVideosFragment;)Lcom/vkontakte/android/fragments/videos/UploadedVideosFragment;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/attachmentspicker/PickVKVideoFragment;
    .param p1, "x1"    # Lcom/vkontakte/android/fragments/videos/UploadedVideosFragment;

    .prologue
    .line 40
    iput-object p1, p0, Lcom/vkontakte/android/fragments/attachmentspicker/PickVKVideoFragment;->mUploadedVideosFragment:Lcom/vkontakte/android/fragments/videos/UploadedVideosFragment;

    return-object p1
.end method

.method static synthetic access$300(Lcom/vkontakte/android/fragments/attachmentspicker/PickVKVideoFragment;)Lcom/vkontakte/android/fragments/videos/TaggedVideosFragment;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/attachmentspicker/PickVKVideoFragment;

    .prologue
    .line 40
    iget-object v0, p0, Lcom/vkontakte/android/fragments/attachmentspicker/PickVKVideoFragment;->mTaggedVideosFragment:Lcom/vkontakte/android/fragments/videos/TaggedVideosFragment;

    return-object v0
.end method

.method static synthetic access$302(Lcom/vkontakte/android/fragments/attachmentspicker/PickVKVideoFragment;Lcom/vkontakte/android/fragments/videos/TaggedVideosFragment;)Lcom/vkontakte/android/fragments/videos/TaggedVideosFragment;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/attachmentspicker/PickVKVideoFragment;
    .param p1, "x1"    # Lcom/vkontakte/android/fragments/videos/TaggedVideosFragment;

    .prologue
    .line 40
    iput-object p1, p0, Lcom/vkontakte/android/fragments/attachmentspicker/PickVKVideoFragment;->mTaggedVideosFragment:Lcom/vkontakte/android/fragments/videos/TaggedVideosFragment;

    return-object p1
.end method

.method static synthetic access$400(Lcom/vkontakte/android/fragments/attachmentspicker/PickVKVideoFragment;)Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/attachmentspicker/PickVKVideoFragment;

    .prologue
    .line 40
    iget-object v0, p0, Lcom/vkontakte/android/fragments/attachmentspicker/PickVKVideoFragment;->mVideoAlbumsFragment:Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment;

    return-object v0
.end method

.method static synthetic access$402(Lcom/vkontakte/android/fragments/attachmentspicker/PickVKVideoFragment;Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment;)Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/attachmentspicker/PickVKVideoFragment;
    .param p1, "x1"    # Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment;

    .prologue
    .line 40
    iput-object p1, p0, Lcom/vkontakte/android/fragments/attachmentspicker/PickVKVideoFragment;->mVideoAlbumsFragment:Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment;

    return-object p1
.end method

.method static synthetic access$500(Lcom/vkontakte/android/fragments/attachmentspicker/PickVKVideoFragment;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/attachmentspicker/PickVKVideoFragment;

    .prologue
    .line 40
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/attachmentspicker/PickVKVideoFragment;->updateSpinnerItems()Z

    move-result v0

    return v0
.end method

.method private ensureFragmentProvidesNoToolbar(Landroid/app/Fragment;)V
    .locals 3
    .param p1, "f"    # Landroid/app/Fragment;

    .prologue
    .line 276
    invoke-virtual {p1}, Landroid/app/Fragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    .line 277
    .local v0, "args":Landroid/os/Bundle;
    if-nez v0, :cond_0

    .line 278
    new-instance v0, Landroid/os/Bundle;

    .end local v0    # "args":Landroid/os/Bundle;
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 280
    .restart local v0    # "args":Landroid/os/Bundle;
    :cond_0
    const-string/jumbo v1, "__is_tab"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 281
    invoke-virtual {p1, v0}, Landroid/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    .line 282
    return-void
.end method

.method static synthetic lambda$onViewCreated$0(Landroid/view/View;Landroid/view/View;Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;Z)V
    .locals 3
    .param p0, "searchWrap"    # Landroid/view/View;
    .param p1, "contentWrap"    # Landroid/view/View;
    .param p2, "searchFragment"    # Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;
    .param p3, "expanded"    # Z

    .prologue
    const/16 v2, 0x8

    const/4 v1, 0x0

    .line 142
    if-eqz p3, :cond_1

    move v0, v1

    :goto_0
    invoke-static {p0, v0}, Lcom/vkontakte/android/ViewUtils;->setVisibilityAnimated(Landroid/view/View;I)V

    .line 143
    if-eqz p3, :cond_2

    :goto_1
    invoke-static {p1, v2}, Lcom/vkontakte/android/ViewUtils;->setVisibilityAnimated(Landroid/view/View;I)V

    .line 144
    if-nez p3, :cond_0

    .line 145
    invoke-virtual {p2}, Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;->reset()V

    .line 147
    :cond_0
    return-void

    :cond_1
    move v0, v2

    .line 142
    goto :goto_0

    :cond_2
    move v2, v1

    .line 143
    goto :goto_1
.end method

.method private updateSpinnerItems()Z
    .locals 1

    .prologue
    .line 263
    iget-object v0, p0, Lcom/vkontakte/android/fragments/attachmentspicker/PickVKVideoFragment;->mTitles:Ljava/util/List;

    if-eqz v0, :cond_1

    .line 264
    iget-object v0, p0, Lcom/vkontakte/android/fragments/attachmentspicker/PickVKVideoFragment;->mTitles:Ljava/util/List;

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/attachmentspicker/PickVKVideoFragment;->setSpinnerItems(Ljava/util/List;)V

    .line 265
    iget v0, p0, Lcom/vkontakte/android/fragments/attachmentspicker/PickVKVideoFragment;->mCurrentPos:I

    if-ltz v0, :cond_0

    .line 266
    iget v0, p0, Lcom/vkontakte/android/fragments/attachmentspicker/PickVKVideoFragment;->mCurrentPos:I

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/attachmentspicker/PickVKVideoFragment;->setSelectedNavigationItem(I)V

    .line 269
    :cond_0
    const/4 v0, 0x1

    .line 271
    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method protected canGoBack()Z
    .locals 1

    .prologue
    .line 62
    const/4 v0, 0x0

    return v0
.end method

.method protected doLoadData()V
    .locals 2

    .prologue
    .line 217
    new-instance v0, Lcom/vkontakte/android/api/video/VideoGetTabs;

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v1

    invoke-direct {v0, v1}, Lcom/vkontakte/android/api/video/VideoGetTabs;-><init>(I)V

    new-instance v1, Lcom/vkontakte/android/fragments/attachmentspicker/PickVKVideoFragment$2;

    invoke-direct {v1, p0, p0}, Lcom/vkontakte/android/fragments/attachmentspicker/PickVKVideoFragment$2;-><init>(Lcom/vkontakte/android/fragments/attachmentspicker/PickVKVideoFragment;Landroid/app/Fragment;)V

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/video/VideoGetTabs;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 258
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/attachmentspicker/PickVKVideoFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 259
    return-void
.end method

.method public hasNavigationDrawer()Z
    .locals 1

    .prologue
    .line 67
    const/4 v0, 0x0

    return v0
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "state"    # Landroid/os/Bundle;

    .prologue
    .line 72
    invoke-super {p0, p1}, Lme/grishka/appkit/fragments/LoaderFragment;->onActivityCreated(Landroid/os/Bundle;)V

    .line 73
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/attachmentspicker/PickVKVideoFragment;->loaded:Z

    if-nez v0, :cond_0

    .line 74
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/attachmentspicker/PickVKVideoFragment;->loadData()V

    .line 76
    :cond_0
    return-void
.end method

.method public onAttach(Landroid/app/Activity;)V
    .locals 1
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 80
    invoke-super {p0, p1}, Lme/grishka/appkit/fragments/LoaderFragment;->onAttach(Landroid/app/Activity;)V

    .line 81
    const v0, 0x7f0301ff

    iput v0, p0, Lcom/vkontakte/android/fragments/attachmentspicker/PickVKVideoFragment;->spinnerViewResourceId:I

    .line 82
    return-void
.end method

.method public onBackPressed()Z
    .locals 4

    .prologue
    .line 160
    const/4 v1, 0x0

    .line 161
    .local v1, "result":Z
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/attachmentspicker/PickVKVideoFragment;->getInnerFragmentManager()Landroid/app/FragmentManager;

    move-result-object v2

    const v3, 0x7f100386

    invoke-virtual {v2, v3}, Landroid/app/FragmentManager;->findFragmentById(I)Landroid/app/Fragment;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;

    .line 162
    .local v0, "fragment":Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;
    if-eqz v0, :cond_0

    .line 163
    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;->onBackPressed()Z

    move-result v1

    .line 165
    :cond_0
    iget-object v2, p0, Lcom/vkontakte/android/fragments/attachmentspicker/PickVKVideoFragment;->mSearchView:Lcom/vkontakte/android/ui/SearchViewWrapper;

    invoke-virtual {v2}, Lcom/vkontakte/android/ui/SearchViewWrapper;->isExpanded()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 166
    iget-object v2, p0, Lcom/vkontakte/android/fragments/attachmentspicker/PickVKVideoFragment;->mSearchView:Lcom/vkontakte/android/ui/SearchViewWrapper;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/ui/SearchViewWrapper;->setExpanded(Z)V

    .line 167
    const/4 v1, 0x1

    .line 169
    :cond_1
    return v1
.end method

.method public onCreateContentView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 2
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 175
    const v0, 0x7f0300a6

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V
    .locals 1
    .param p1, "menu"    # Landroid/view/Menu;
    .param p2, "inflater"    # Landroid/view/MenuInflater;

    .prologue
    .line 86
    iget-object v0, p0, Lcom/vkontakte/android/fragments/attachmentspicker/PickVKVideoFragment;->mSearchView:Lcom/vkontakte/android/ui/SearchViewWrapper;

    if-eqz v0, :cond_0

    .line 87
    iget-object v0, p0, Lcom/vkontakte/android/fragments/attachmentspicker/PickVKVideoFragment;->mSearchView:Lcom/vkontakte/android/ui/SearchViewWrapper;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/ui/SearchViewWrapper;->onCreateOptionsMenu(Landroid/view/Menu;)V

    .line 89
    :cond_0
    invoke-super {p0, p1, p2}, Lme/grishka/appkit/fragments/LoaderFragment;->onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V

    .line 90
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 2
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 94
    invoke-super {p0, p1, p2, p3}, Lme/grishka/appkit/fragments/LoaderFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    move-result-object v0

    .line 95
    .local v0, "view":Landroid/view/View;
    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 96
    return-object v0
.end method

.method public onDestroyView()V
    .locals 3

    .prologue
    .line 201
    invoke-super {p0}, Lme/grishka/appkit/fragments/LoaderFragment;->onDestroyView()V

    .line 206
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/attachmentspicker/PickVKVideoFragment;->getInnerFragmentManager()Landroid/app/FragmentManager;

    move-result-object v1

    const-string/jumbo v2, "INNER_VIDEO_FRAGMENT"

    invoke-virtual {v1, v2}, Landroid/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/app/Fragment;

    move-result-object v0

    .line 208
    .local v0, "f":Landroid/app/Fragment;
    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/attachmentspicker/PickVKVideoFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->isFinishing()Z

    move-result v1

    if-nez v1, :cond_0

    .line 209
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/attachmentspicker/PickVKVideoFragment;->getInnerFragmentManager()Landroid/app/FragmentManager;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/app/FragmentTransaction;->remove(Landroid/app/Fragment;)Landroid/app/FragmentTransaction;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/FragmentTransaction;->commitAllowingStateLoss()I

    .line 212
    :cond_0
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/vkontakte/android/fragments/attachmentspicker/PickVKVideoFragment;->needRecreateInnerFragment:Z

    .line 213
    return-void
.end method

.method public onRefresh()V
    .locals 0

    .prologue
    .line 293
    return-void
.end method

.method protected onSpinnerItemSelected(I)Z
    .locals 6
    .param p1, "position"    # I

    .prologue
    const/4 v5, 0x1

    .line 180
    iget v3, p0, Lcom/vkontakte/android/fragments/attachmentspicker/PickVKVideoFragment;->mCurrentPos:I

    if-ne p1, v3, :cond_0

    iget-boolean v3, p0, Lcom/vkontakte/android/fragments/attachmentspicker/PickVKVideoFragment;->needRecreateInnerFragment:Z

    if-nez v3, :cond_0

    .line 196
    :goto_0
    return v5

    .line 183
    :cond_0
    iget-object v3, p0, Lcom/vkontakte/android/fragments/attachmentspicker/PickVKVideoFragment;->mTabs:Ljava/util/List;

    invoke-interface {v3, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/app/Fragment;

    .line 185
    .local v2, "selectedFragment":Landroid/app/Fragment;
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/attachmentspicker/PickVKVideoFragment;->getInnerFragmentManager()Landroid/app/FragmentManager;

    move-result-object v0

    .line 186
    .local v0, "fm":Landroid/app/FragmentManager;
    invoke-virtual {v0}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object v1

    .line 188
    .local v1, "fragmentTransaction":Landroid/app/FragmentTransaction;
    const v3, 0x7f1002ae

    const-string/jumbo v4, "INNER_VIDEO_FRAGMENT"

    invoke-virtual {v1, v3, v2, v4}, Landroid/app/FragmentTransaction;->replace(ILandroid/app/Fragment;Ljava/lang/String;)Landroid/app/FragmentTransaction;

    .line 190
    invoke-virtual {v1}, Landroid/app/FragmentTransaction;->commit()I

    .line 192
    iput p1, p0, Lcom/vkontakte/android/fragments/attachmentspicker/PickVKVideoFragment;->mCurrentPos:I

    .line 194
    const/4 v3, 0x0

    iput-boolean v3, p0, Lcom/vkontakte/android/fragments/attachmentspicker/PickVKVideoFragment;->needRecreateInnerFragment:Z

    goto :goto_0
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 12
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const v11, 0x7f100386

    const/4 v6, 0x1

    .line 101
    invoke-super {p0, p1, p2}, Lme/grishka/appkit/fragments/LoaderFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 103
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/attachmentspicker/PickVKVideoFragment;->getToolbar()Landroid/support/v7/widget/Toolbar;

    move-result-object v7

    const/16 v8, 0x8

    invoke-virtual {v7, v8}, Landroid/support/v7/widget/Toolbar;->setVisibility(I)V

    .line 105
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/attachmentspicker/PickVKVideoFragment;->updateSpinnerItems()Z

    move-result v1

    .line 108
    .local v1, "haveSpinnerItems":Z
    const v7, 0x7f1001a9

    invoke-virtual {p1, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 109
    .local v0, "contentWrap":Landroid/view/View;
    invoke-virtual {p1, v11}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    .line 111
    .local v3, "searchWrap":Landroid/view/View;
    if-nez v1, :cond_0

    .line 112
    const v7, 0x7f08076e

    invoke-virtual {p0, v7}, Lcom/vkontakte/android/fragments/attachmentspicker/PickVKVideoFragment;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0, v7}, Lcom/vkontakte/android/fragments/attachmentspicker/PickVKVideoFragment;->setTitle(Ljava/lang/CharSequence;)V

    .line 115
    :cond_0
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/attachmentspicker/PickVKVideoFragment;->getInnerFragmentManager()Landroid/app/FragmentManager;

    move-result-object v7

    const-string/jumbo v8, "searchFragment"

    invoke-virtual {v7, v8}, Landroid/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/app/Fragment;

    move-result-object v5

    check-cast v5, Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;

    .line 116
    .local v5, "tempF":Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;
    if-nez v5, :cond_2

    invoke-static {v6}, Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;->newInstance(Z)Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;

    move-result-object v2

    .line 118
    .local v2, "searchFragment":Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;
    :goto_0
    if-nez v5, :cond_3

    move v4, v6

    .line 120
    .local v4, "shouldAdd":Z
    :goto_1
    new-instance v7, Lcom/vkontakte/android/ui/SearchViewWrapper;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/attachmentspicker/PickVKVideoFragment;->getActivity()Landroid/app/Activity;

    move-result-object v8

    new-instance v9, Lcom/vkontakte/android/fragments/attachmentspicker/PickVKVideoFragment$1;

    invoke-direct {v9, p0, v2}, Lcom/vkontakte/android/fragments/attachmentspicker/PickVKVideoFragment$1;-><init>(Lcom/vkontakte/android/fragments/attachmentspicker/PickVKVideoFragment;Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;)V

    const/16 v10, 0x190

    invoke-direct {v7, v8, v9, v10}, Lcom/vkontakte/android/ui/SearchViewWrapper;-><init>(Landroid/app/Activity;Lcom/vkontakte/android/ui/SearchViewWrapper$SearchListener;I)V

    iput-object v7, p0, Lcom/vkontakte/android/fragments/attachmentspicker/PickVKVideoFragment;->mSearchView:Lcom/vkontakte/android/ui/SearchViewWrapper;

    .line 141
    iget-object v7, p0, Lcom/vkontakte/android/fragments/attachmentspicker/PickVKVideoFragment;->mSearchView:Lcom/vkontakte/android/ui/SearchViewWrapper;

    invoke-static {v3, v0, v2}, Lcom/vkontakte/android/fragments/attachmentspicker/PickVKVideoFragment$$Lambda$1;->lambdaFactory$(Landroid/view/View;Landroid/view/View;Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;)Lcom/vkontakte/android/ui/SearchViewWrapper$ViewStateListener;

    move-result-object v8

    invoke-virtual {v7, v8}, Lcom/vkontakte/android/ui/SearchViewWrapper;->setStateListener(Lcom/vkontakte/android/ui/SearchViewWrapper$ViewStateListener;)V

    .line 149
    iget-object v7, p0, Lcom/vkontakte/android/fragments/attachmentspicker/PickVKVideoFragment;->mSearchView:Lcom/vkontakte/android/ui/SearchViewWrapper;

    invoke-virtual {v2, v7}, Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;->setSearchView(Lcom/vkontakte/android/ui/SearchViewWrapper;)V

    .line 152
    if-eqz v4, :cond_1

    .line 153
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/attachmentspicker/PickVKVideoFragment;->getInnerFragmentManager()Landroid/app/FragmentManager;

    move-result-object v7

    invoke-virtual {v7}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object v7

    const-string/jumbo v8, "searchFragment"

    invoke-virtual {v7, v11, v2, v8}, Landroid/app/FragmentTransaction;->add(ILandroid/app/Fragment;Ljava/lang/String;)Landroid/app/FragmentTransaction;

    move-result-object v7

    invoke-virtual {v7}, Landroid/app/FragmentTransaction;->commit()I

    .line 155
    :cond_1
    invoke-virtual {p0, v6}, Lcom/vkontakte/android/fragments/attachmentspicker/PickVKVideoFragment;->setHasOptionsMenu(Z)V

    .line 156
    return-void

    .end local v2    # "searchFragment":Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;
    .end local v4    # "shouldAdd":Z
    :cond_2
    move-object v2, v5

    .line 116
    goto :goto_0

    .line 118
    .restart local v2    # "searchFragment":Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;
    :cond_3
    const/4 v4, 0x0

    goto :goto_1
.end method

.method public provideToolbar(Landroid/content/Context;)Landroid/view/ViewGroup;
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 287
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/attachmentspicker/PickVKVideoFragment;->getToolbar()Landroid/support/v7/widget/Toolbar;

    move-result-object v0

    return-object v0
.end method
