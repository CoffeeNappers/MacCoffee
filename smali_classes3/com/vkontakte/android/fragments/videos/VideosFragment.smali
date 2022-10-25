.class public Lcom/vkontakte/android/fragments/videos/VideosFragment;
.super Lcom/vkontakte/android/fragments/VkTabbedLoaderFragment;
.source "VideosFragment.java"

# interfaces
.implements Lcom/vkontakte/android/fragments/BackListener;
.implements Lcom/vk/attachpicker/SupportExternalToolbarContainer;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/fragments/videos/VideosFragment$AddVideoByLinkTask;
    }
.end annotation


# static fields
.field static final CREATE_RESULT:I = 0x68

.field static final VIDEO_EXISTING_RESULT:I = 0xeb

.field static final VIDEO_NEW_RESULT:I = 0xea


# instance fields
.field private mAddedVideosFragment:Lcom/vkontakte/android/fragments/videos/AddedVideosFragment;

.field mAdmin:Z

.field mCanUploadVideo:Z

.field mOwnerId:I

.field mSearchView:Lcom/vkontakte/android/ui/SearchViewWrapper;

.field mSelectMode:Z

.field private mTaggedVideosFragment:Lcom/vkontakte/android/fragments/videos/TaggedVideosFragment;

.field final mTimerHandler:Landroid/os/Handler;

.field mTitle:Ljava/lang/String;

.field private mUploadedVideosFragment:Lcom/vkontakte/android/fragments/videos/UploadedVideosFragment;

.field private mVideoAlbumsFragment:Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 76
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/VkTabbedLoaderFragment;-><init>()V

    .line 62
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment;->mTimerHandler:Landroid/os/Handler;

    .line 64
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment;->mOwnerId:I

    .line 77
    const v0, 0x7f030211

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/videos/VideosFragment;->setTabsLayout(I)V

    .line 78
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/videos/VideosFragment;->setTabsAutoLoad(Z)V

    .line 79
    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/fragments/videos/VideosFragment;)Lcom/vkontakte/android/fragments/videos/UploadedVideosFragment;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/videos/VideosFragment;

    .prologue
    .line 56
    iget-object v0, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment;->mUploadedVideosFragment:Lcom/vkontakte/android/fragments/videos/UploadedVideosFragment;

    return-object v0
.end method

.method static synthetic access$002(Lcom/vkontakte/android/fragments/videos/VideosFragment;Lcom/vkontakte/android/fragments/videos/UploadedVideosFragment;)Lcom/vkontakte/android/fragments/videos/UploadedVideosFragment;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/videos/VideosFragment;
    .param p1, "x1"    # Lcom/vkontakte/android/fragments/videos/UploadedVideosFragment;

    .prologue
    .line 56
    iput-object p1, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment;->mUploadedVideosFragment:Lcom/vkontakte/android/fragments/videos/UploadedVideosFragment;

    return-object p1
.end method

.method static synthetic access$100(Lcom/vkontakte/android/fragments/videos/VideosFragment;)Lcom/vkontakte/android/fragments/videos/TaggedVideosFragment;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/videos/VideosFragment;

    .prologue
    .line 56
    iget-object v0, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment;->mTaggedVideosFragment:Lcom/vkontakte/android/fragments/videos/TaggedVideosFragment;

    return-object v0
.end method

.method static synthetic access$102(Lcom/vkontakte/android/fragments/videos/VideosFragment;Lcom/vkontakte/android/fragments/videos/TaggedVideosFragment;)Lcom/vkontakte/android/fragments/videos/TaggedVideosFragment;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/videos/VideosFragment;
    .param p1, "x1"    # Lcom/vkontakte/android/fragments/videos/TaggedVideosFragment;

    .prologue
    .line 56
    iput-object p1, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment;->mTaggedVideosFragment:Lcom/vkontakte/android/fragments/videos/TaggedVideosFragment;

    return-object p1
.end method

.method static synthetic access$200(Lcom/vkontakte/android/fragments/videos/VideosFragment;)Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/videos/VideosFragment;

    .prologue
    .line 56
    iget-object v0, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment;->mVideoAlbumsFragment:Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment;

    return-object v0
.end method

.method static synthetic access$202(Lcom/vkontakte/android/fragments/videos/VideosFragment;Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment;)Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/videos/VideosFragment;
    .param p1, "x1"    # Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment;

    .prologue
    .line 56
    iput-object p1, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment;->mVideoAlbumsFragment:Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment;

    return-object p1
.end method

.method static synthetic access$300(Lcom/vkontakte/android/fragments/videos/VideosFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/videos/VideosFragment;

    .prologue
    .line 56
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/videos/VideosFragment;->disableRefreshIfNeeded()V

    return-void
.end method

.method private disableRefreshIfNeeded()V
    .locals 1

    .prologue
    .line 292
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/videos/VideosFragment;->isInContextOfAttachActivity()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 293
    iget-object v0, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment;->mAddedVideosFragment:Lcom/vkontakte/android/fragments/videos/AddedVideosFragment;

    if-eqz v0, :cond_0

    .line 294
    iget-object v0, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment;->mAddedVideosFragment:Lcom/vkontakte/android/fragments/videos/AddedVideosFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/videos/AddedVideosFragment;->disableRefresh()V

    .line 296
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment;->mUploadedVideosFragment:Lcom/vkontakte/android/fragments/videos/UploadedVideosFragment;

    if-eqz v0, :cond_1

    .line 297
    iget-object v0, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment;->mUploadedVideosFragment:Lcom/vkontakte/android/fragments/videos/UploadedVideosFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/videos/UploadedVideosFragment;->disableRefresh()V

    .line 299
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment;->mVideoAlbumsFragment:Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment;

    if-eqz v0, :cond_2

    .line 300
    iget-object v0, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment;->mVideoAlbumsFragment:Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment;->disableRefresh()V

    .line 302
    :cond_2
    iget-object v0, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment;->mTaggedVideosFragment:Lcom/vkontakte/android/fragments/videos/TaggedVideosFragment;

    if-eqz v0, :cond_3

    .line 303
    iget-object v0, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment;->mTaggedVideosFragment:Lcom/vkontakte/android/fragments/videos/TaggedVideosFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/videos/TaggedVideosFragment;->disableRefresh()V

    .line 306
    :cond_3
    return-void
.end method

.method private isInContextOfAttachActivity()Z
    .locals 1

    .prologue
    .line 220
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/videos/VideosFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    instance-of v0, v0, Lcom/vk/attachpicker/AttachActivity;

    return v0
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

    .line 279
    if-eqz p3, :cond_1

    move v0, v1

    :goto_0
    invoke-static {p0, v0}, Lcom/vkontakte/android/ViewUtils;->setVisibilityAnimated(Landroid/view/View;I)V

    .line 280
    if-eqz p3, :cond_2

    :goto_1
    invoke-static {p1, v2}, Lcom/vkontakte/android/ViewUtils;->setVisibilityAnimated(Landroid/view/View;I)V

    .line 281
    if-nez p3, :cond_0

    .line 282
    invoke-virtual {p2}, Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;->reset()V

    .line 284
    :cond_0
    return-void

    :cond_1
    move v0, v2

    .line 279
    goto :goto_0

    :cond_2
    move v2, v1

    .line 280
    goto :goto_1
.end method


# virtual methods
.method addVideoByLink(Ljava/lang/String;)V
    .locals 2
    .param p1, "link"    # Ljava/lang/String;

    .prologue
    .line 330
    new-instance v0, Lcom/vkontakte/android/fragments/videos/VideosFragment$AddVideoByLinkTask;

    invoke-direct {v0, p0, p1}, Lcom/vkontakte/android/fragments/videos/VideosFragment$AddVideoByLinkTask;-><init>(Lcom/vkontakte/android/fragments/videos/VideosFragment;Ljava/lang/String;)V

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/videos/VideosFragment$AddVideoByLinkTask;->execPool([Ljava/lang/Object;)Lcom/vkontakte/android/background/AsyncTask;

    .line 331
    return-void
.end method

.method protected canGoBack()Z
    .locals 1

    .prologue
    .line 225
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/videos/VideosFragment;->isInContextOfAttachActivity()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-super {p0}, Lcom/vkontakte/android/fragments/VkTabbedLoaderFragment;->canGoBack()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method createAlbum()V
    .locals 2

    .prologue
    .line 334
    iget v0, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment;->mOwnerId:I

    invoke-static {v0}, Lcom/vkontakte/android/fragments/videos/AlbumEditorFragment;->create(I)Lcom/vkontakte/android/fragments/videos/AlbumEditorFragment$Builder;

    move-result-object v0

    const/16 v1, 0x68

    invoke-virtual {v0, p0, v1}, Lcom/vkontakte/android/fragments/videos/AlbumEditorFragment$Builder;->forResult(Landroid/app/Fragment;I)Z

    .line 335
    return-void
.end method

.method protected doLoadData()V
    .locals 2

    .prologue
    .line 83
    new-instance v0, Lcom/vkontakte/android/api/video/VideoGetTabs;

    iget v1, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment;->mOwnerId:I

    invoke-direct {v0, v1}, Lcom/vkontakte/android/api/video/VideoGetTabs;-><init>(I)V

    new-instance v1, Lcom/vkontakte/android/fragments/videos/VideosFragment$1;

    invoke-direct {v1, p0, p0}, Lcom/vkontakte/android/fragments/videos/VideosFragment$1;-><init>(Lcom/vkontakte/android/fragments/videos/VideosFragment;Landroid/app/Fragment;)V

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/video/VideoGetTabs;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 118
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/videos/VideosFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 119
    return-void
.end method

.method public hasNavigationDrawer()Z
    .locals 1

    .prologue
    .line 230
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/videos/VideosFragment;->isInContextOfAttachActivity()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-super {p0}, Lcom/vkontakte/android/fragments/VkTabbedLoaderFragment;->hasNavigationDrawer()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method synthetic lambda$showAddLinkDialog$1(Ljava/lang/CharSequence;)V
    .locals 1
    .param p1, "result"    # Ljava/lang/CharSequence;

    .prologue
    .line 326
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/videos/VideosFragment;->addVideoByLink(Ljava/lang/String;)V

    return-void
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "state"    # Landroid/os/Bundle;

    .prologue
    .line 156
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/VkTabbedLoaderFragment;->onActivityCreated(Landroid/os/Bundle;)V

    .line 157
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment;->loaded:Z

    if-nez v0, :cond_0

    .line 158
    iget-object v0, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment;->progress:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 159
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment;->dataLoading:Z

    .line 160
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/videos/VideosFragment;->doLoadData()V

    .line 162
    :cond_0
    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 6
    .param p1, "reqCode"    # I
    .param p2, "resCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 194
    invoke-super {p0, p1, p2, p3}, Lcom/vkontakte/android/fragments/VkTabbedLoaderFragment;->onActivityResult(IILandroid/content/Intent;)V

    .line 195
    const/4 v3, -0x1

    if-ne p2, v3, :cond_0

    .line 196
    sparse-switch p1, :sswitch_data_0

    .line 217
    :cond_0
    :goto_0
    return-void

    .line 199
    :sswitch_0
    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v2

    .line 200
    .local v2, "uri":Landroid/net/Uri;
    invoke-virtual {v2}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "content"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 201
    invoke-static {v2}, Lcom/vkontakte/android/upload/UploadUtils;->resolvePath(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v1

    .line 202
    .local v1, "path":Ljava/lang/String;
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 203
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/videos/VideosFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    const v4, 0x7f0801f9

    const/4 v5, 0x0

    invoke-static {v3, v4, v5}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 206
    :cond_1
    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    .line 208
    .end local v1    # "path":Ljava/lang/String;
    :cond_2
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/videos/VideosFragment;->getContext()Landroid/content/Context;

    move-result-object v3

    iget v4, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment;->mOwnerId:I

    invoke-static {v3, v4, v2}, Lcom/vkontakte/android/VideoUploadDialog;->show(Landroid/content/Context;ILandroid/net/Uri;)V

    goto :goto_0

    .line 211
    .end local v2    # "uri":Landroid/net/Uri;
    :sswitch_1
    const-string/jumbo v3, "album"

    invoke-virtual {p3, v3}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/api/VideoAlbum;

    .line 212
    .local v0, "album":Lcom/vkontakte/android/api/VideoAlbum;
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/videos/VideosFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-static {v3, v0}, Lcom/vkontakte/android/fragments/videos/Videos;->notifyAlbumCreated(Landroid/content/Context;Lcom/vkontakte/android/api/VideoAlbum;)V

    goto :goto_0

    .line 196
    :sswitch_data_0
    .sparse-switch
        0x68 -> :sswitch_1
        0xea -> :sswitch_0
        0xeb -> :sswitch_0
    .end sparse-switch
.end method

.method public onBackPressed()Z
    .locals 4

    .prologue
    .line 310
    const/4 v1, 0x0

    .line 311
    .local v1, "result":Z
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/videos/VideosFragment;->getInnerFragmentManager()Landroid/app/FragmentManager;

    move-result-object v2

    const v3, 0x7f100386

    invoke-virtual {v2, v3}, Landroid/app/FragmentManager;->findFragmentById(I)Landroid/app/Fragment;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;

    .line 312
    .local v0, "fragment":Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;
    if-eqz v0, :cond_0

    .line 313
    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;->onBackPressed()Z

    move-result v1

    .line 315
    :cond_0
    iget-object v2, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment;->mSearchView:Lcom/vkontakte/android/ui/SearchViewWrapper;

    invoke-virtual {v2}, Lcom/vkontakte/android/ui/SearchViewWrapper;->isExpanded()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 316
    iget-object v2, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment;->mSearchView:Lcom/vkontakte/android/ui/SearchViewWrapper;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/ui/SearchViewWrapper;->setExpanded(Z)V

    .line 317
    const/4 v1, 0x1

    .line 319
    :cond_1
    return v1
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 3
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 123
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/VkTabbedLoaderFragment;->onCreate(Landroid/os/Bundle;)V

    .line 124
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/videos/VideosFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "uid"

    iget v2, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment;->mOwnerId:I

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment;->mOwnerId:I

    .line 125
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/videos/VideosFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "can_upload_video"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment;->mCanUploadVideo:Z

    .line 126
    iget v0, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment;->mOwnerId:I

    invoke-static {v0}, Lcom/vkontakte/android/auth/VKAccountManager;->isCurrentUser(I)Z

    move-result v0

    if-nez v0, :cond_0

    iget v0, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment;->mOwnerId:I

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment;->mOwnerId:I

    if-gez v0, :cond_1

    iget v0, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment;->mOwnerId:I

    neg-int v0, v0

    invoke-static {v0}, Lcom/vkontakte/android/data/Groups;->isGroupAdmin(I)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment;->mAdmin:Z

    .line 127
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/videos/VideosFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "title"

    const v2, 0x7f08076e

    invoke-virtual {p0, v2}, Lcom/vkontakte/android/fragments/videos/VideosFragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment;->mTitle:Ljava/lang/String;

    .line 128
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/videos/VideosFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "select"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment;->mSelectMode:Z

    .line 129
    return-void

    .line 126
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V
    .locals 5
    .param p1, "menu"    # Landroid/view/Menu;
    .param p2, "inflater"    # Landroid/view/MenuInflater;

    .prologue
    const/4 v2, 0x1

    .line 139
    iget-object v3, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment;->mSearchView:Lcom/vkontakte/android/ui/SearchViewWrapper;

    if-eqz v3, :cond_0

    .line 140
    iget-object v3, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment;->mSearchView:Lcom/vkontakte/android/ui/SearchViewWrapper;

    invoke-virtual {v3, p1}, Lcom/vkontakte/android/ui/SearchViewWrapper;->onCreateOptionsMenu(Landroid/view/Menu;)V

    .line 142
    :cond_0
    iget-boolean v3, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment;->mAdmin:Z

    if-nez v3, :cond_1

    iget-boolean v3, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment;->mCanUploadVideo:Z

    if-eqz v3, :cond_3

    :cond_1
    iget-boolean v3, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment;->mSelectMode:Z

    if-nez v3, :cond_3

    .line 143
    const v3, 0x7f110015

    invoke-virtual {p2, v3, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 144
    const v3, 0x7f1000b0

    invoke-interface {p1, v3}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    .line 145
    .local v0, "add":Landroid/view/MenuItem;
    if-eqz v0, :cond_3

    .line 146
    invoke-interface {v0}, Landroid/view/MenuItem;->getSubMenu()Landroid/view/SubMenu;

    move-result-object v1

    .line 147
    .local v1, "subMenu":Landroid/view/SubMenu;
    const v3, -0x54504d

    invoke-static {v1, v3}, Lcom/vkontakte/android/ViewUtils;->colorizeSubmenu(Landroid/view/SubMenu;I)V

    .line 148
    const v3, 0x7f100603

    invoke-interface {v1, v3}, Landroid/view/SubMenu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v3

    iget v4, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment;->mOwnerId:I

    invoke-static {v4}, Lcom/vkontakte/android/auth/VKAccountManager;->isCurrentUser(I)Z

    move-result v4

    if-nez v4, :cond_2

    iget v4, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment;->mOwnerId:I

    if-gez v4, :cond_4

    iget v4, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment;->mOwnerId:I

    neg-int v4, v4

    invoke-static {v4}, Lcom/vkontakte/android/data/Groups;->getAdminLevel(I)I

    move-result v4

    if-lt v4, v2, :cond_4

    :cond_2
    :goto_0
    invoke-interface {v3, v2}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 151
    .end local v0    # "add":Landroid/view/MenuItem;
    .end local v1    # "subMenu":Landroid/view/SubMenu;
    :cond_3
    invoke-super {p0, p1, p2}, Lcom/vkontakte/android/fragments/VkTabbedLoaderFragment;->onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V

    .line 152
    return-void

    .line 148
    .restart local v0    # "add":Landroid/view/MenuItem;
    .restart local v1    # "subMenu":Landroid/view/SubMenu;
    :cond_4
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public onDestroy()V
    .locals 2

    .prologue
    .line 133
    invoke-super {p0}, Lcom/vkontakte/android/fragments/VkTabbedLoaderFragment;->onDestroy()V

    .line 134
    iget-object v0, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment;->mTimerHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 135
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 5
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    const/4 v4, 0x1

    .line 166
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    .line 189
    :goto_0
    return v4

    .line 168
    :pswitch_0
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v1, "android.media.action.VIDEO_CAPTURE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 169
    .local v0, "intent":Landroid/content/Intent;
    const-string/jumbo v1, "android.intent.extra.sizeLimit"

    const-wide v2, 0x80000000L

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 170
    const/16 v1, 0xea

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/fragments/videos/VideosFragment;->startActivityForResult(Landroid/content/Intent;I)V

    goto :goto_0

    .line 174
    .end local v0    # "intent":Landroid/content/Intent;
    :pswitch_1
    new-instance v0, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/videos/VideosFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const-class v2, Lcom/vk/attachpicker/PhotoVideoAttachActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 175
    .restart local v0    # "intent":Landroid/content/Intent;
    const-string/jumbo v1, "media_type"

    const/16 v2, 0x14d

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 176
    const-string/jumbo v1, "single_mode"

    invoke-virtual {v0, v1, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 177
    const/16 v1, 0xeb

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/fragments/videos/VideosFragment;->startActivityForResult(Landroid/content/Intent;I)V

    goto :goto_0

    .line 181
    .end local v0    # "intent":Landroid/content/Intent;
    :pswitch_2
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/videos/VideosFragment;->showAddLinkDialog()V

    goto :goto_0

    .line 185
    :pswitch_3
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/videos/VideosFragment;->createAlbum()V

    goto :goto_0

    .line 166
    nop

    :pswitch_data_0
    .packed-switch 0x7f100600
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method public onRefresh()V
    .locals 0

    .prologue
    .line 340
    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 9
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const v8, 0x7f100386

    const v7, 0x7f0f0018

    const/4 v6, -0x1

    .line 235
    invoke-super {p0, p1, p2}, Lcom/vkontakte/android/fragments/VkTabbedLoaderFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 236
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/videos/VideosFragment;->getToolbar()Landroid/support/v7/widget/Toolbar;

    move-result-object v4

    iget-object v5, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment;->mTitle:Ljava/lang/String;

    invoke-virtual {v4, v5}, Landroid/support/v7/widget/Toolbar;->setTitle(Ljava/lang/CharSequence;)V

    .line 237
    const v4, 0x7f100549

    invoke-virtual {p1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 238
    .local v0, "contentWrap":Landroid/view/View;
    invoke-virtual {p1, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    .line 240
    .local v2, "searchWrap":Landroid/view/View;
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/videos/VideosFragment;->isInContextOfAttachActivity()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 241
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/videos/VideosFragment;->getToolbar()Landroid/support/v7/widget/Toolbar;

    move-result-object v4

    const/16 v5, 0x8

    invoke-virtual {v4, v5}, Landroid/support/v7/widget/Toolbar;->setVisibility(I)V

    .line 242
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/videos/VideosFragment;->getView()Landroid/view/View;

    move-result-object v4

    invoke-virtual {v4, v6}, Landroid/view/View;->setBackgroundColor(I)V

    .line 245
    const v4, 0x7f1001ad

    invoke-virtual {p1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/support/design/widget/TabLayout;

    .line 246
    .local v3, "tabLayout":Landroid/support/design/widget/TabLayout;
    invoke-virtual {v3, v6}, Landroid/support/design/widget/TabLayout;->setBackgroundColor(I)V

    .line 247
    const-string/jumbo v4, "#B9CDE3"

    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v4

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/videos/VideosFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5, v7}, Landroid/content/res/Resources;->getColor(I)I

    move-result v5

    invoke-virtual {v3, v4, v5}, Landroid/support/design/widget/TabLayout;->setTabTextColors(II)V

    .line 248
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/videos/VideosFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4, v7}, Landroid/content/res/Resources;->getColor(I)I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/support/design/widget/TabLayout;->setSelectedTabIndicatorColor(I)V

    .line 249
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/videos/VideosFragment;->disableRefreshIfNeeded()V

    .line 252
    .end local v3    # "tabLayout":Landroid/support/design/widget/TabLayout;
    :cond_0
    iget v4, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment;->mOwnerId:I

    iget-boolean v5, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment;->mSelectMode:Z

    invoke-static {v4, v5}, Lcom/vkontakte/android/fragments/videos/AddedVideosFragment;->newInstance(IZ)Lcom/vkontakte/android/fragments/videos/AddedVideosFragment;

    move-result-object v4

    iput-object v4, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment;->mAddedVideosFragment:Lcom/vkontakte/android/fragments/videos/AddedVideosFragment;

    .line 253
    const/4 v4, 0x0

    iget-object v5, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment;->mAddedVideosFragment:Lcom/vkontakte/android/fragments/videos/AddedVideosFragment;

    const v6, 0x7f080750

    invoke-virtual {p0, v6}, Lcom/vkontakte/android/fragments/videos/VideosFragment;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v4, v5, v6}, Lcom/vkontakte/android/fragments/videos/VideosFragment;->addTab(ILandroid/app/Fragment;Ljava/lang/CharSequence;)V

    .line 255
    iget-boolean v4, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment;->mSelectMode:Z

    invoke-static {v4}, Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;->newInstance(Z)Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;

    move-result-object v1

    .line 257
    .local v1, "searchFragment":Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;
    new-instance v4, Lcom/vkontakte/android/ui/SearchViewWrapper;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/videos/VideosFragment;->getActivity()Landroid/app/Activity;

    move-result-object v5

    new-instance v6, Lcom/vkontakte/android/fragments/videos/VideosFragment$2;

    invoke-direct {v6, p0, v1}, Lcom/vkontakte/android/fragments/videos/VideosFragment$2;-><init>(Lcom/vkontakte/android/fragments/videos/VideosFragment;Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;)V

    const/16 v7, 0x190

    invoke-direct {v4, v5, v6, v7}, Lcom/vkontakte/android/ui/SearchViewWrapper;-><init>(Landroid/app/Activity;Lcom/vkontakte/android/ui/SearchViewWrapper$SearchListener;I)V

    iput-object v4, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment;->mSearchView:Lcom/vkontakte/android/ui/SearchViewWrapper;

    .line 278
    iget-object v4, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment;->mSearchView:Lcom/vkontakte/android/ui/SearchViewWrapper;

    invoke-static {v2, v0, v1}, Lcom/vkontakte/android/fragments/videos/VideosFragment$$Lambda$1;->lambdaFactory$(Landroid/view/View;Landroid/view/View;Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;)Lcom/vkontakte/android/ui/SearchViewWrapper$ViewStateListener;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/vkontakte/android/ui/SearchViewWrapper;->setStateListener(Lcom/vkontakte/android/ui/SearchViewWrapper$ViewStateListener;)V

    .line 286
    iget-object v4, p0, Lcom/vkontakte/android/fragments/videos/VideosFragment;->mSearchView:Lcom/vkontakte/android/ui/SearchViewWrapper;

    iput-object v4, v1, Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;->searchView:Lcom/vkontakte/android/ui/SearchViewWrapper;

    .line 287
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/videos/VideosFragment;->getInnerFragmentManager()Landroid/app/FragmentManager;

    move-result-object v4

    invoke-virtual {v4}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object v4

    invoke-virtual {v4, v8, v1}, Landroid/app/FragmentTransaction;->add(ILandroid/app/Fragment;)Landroid/app/FragmentTransaction;

    move-result-object v4

    invoke-virtual {v4}, Landroid/app/FragmentTransaction;->commit()I

    .line 288
    const/4 v4, 0x1

    invoke-virtual {p0, v4}, Lcom/vkontakte/android/fragments/videos/VideosFragment;->setHasOptionsMenu(Z)V

    .line 289
    return-void
.end method

.method public provideToolbar(Landroid/content/Context;)Landroid/view/ViewGroup;
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 344
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/videos/VideosFragment;->getToolbar()Landroid/support/v7/widget/Toolbar;

    move-result-object v0

    return-object v0
.end method

.method showAddLinkDialog()V
    .locals 2

    .prologue
    .line 323
    new-instance v0, Lcom/vkontakte/android/dialogs/PromptDialog;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/videos/VideosFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vkontakte/android/dialogs/PromptDialog;-><init>(Landroid/app/Activity;)V

    const v1, 0x7f0800bc

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/dialogs/PromptDialog;->setTitle(I)Lcom/vkontakte/android/dialogs/PromptDialog;

    move-result-object v0

    const v1, 0x7f0800d7

    .line 324
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/dialogs/PromptDialog;->setHint(I)Lcom/vkontakte/android/dialogs/PromptDialog;

    move-result-object v0

    .line 325
    invoke-virtual {v0}, Lcom/vkontakte/android/dialogs/PromptDialog;->requireText()Lcom/vkontakte/android/dialogs/PromptDialog;

    move-result-object v0

    invoke-static {p0}, Lcom/vkontakte/android/fragments/videos/VideosFragment$$Lambda$2;->lambdaFactory$(Lcom/vkontakte/android/fragments/videos/VideosFragment;)Lcom/vkontakte/android/dialogs/PromptDialog$Listener;

    move-result-object v1

    .line 326
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/dialogs/PromptDialog;->setInputListener(Lcom/vkontakte/android/dialogs/PromptDialog$Listener;)Lcom/vkontakte/android/dialogs/PromptDialog;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/dialogs/PromptDialog;->show()V

    .line 327
    return-void
.end method
