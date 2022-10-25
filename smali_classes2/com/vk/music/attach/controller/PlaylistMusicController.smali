.class public final Lcom/vk/music/attach/controller/PlaylistMusicController;
.super Lcom/vk/music/attach/controller/Controller;
.source "PlaylistMusicController.java"

# interfaces
.implements Lcom/vk/music/attach/loader/PlaylistMusicLoader$Callback;


# static fields
.field public static final ARG_PLAYLIST:Ljava/lang/String; = "PlaylistMusicController.arg.playlist"

.field private static final VIEW_TYPE_FOOTER1:I = 0x2

.field private static final VIEW_TYPE_FOOTER2:I = 0x3

.field private static final VIEW_TYPE_MUSIC_TRACK:I = 0x1


# instance fields
.field contentAdapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

.field emptyAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

.field errorAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

.field loaderAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

.field loadingFooterAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

.field musicTrackAdapter:Lcom/vk/music/view/adapter/ItemAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vk/music/view/adapter/ItemAdapter",
            "<",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;"
        }
    .end annotation
.end field

.field playlist:Lcom/vk/music/dto/Playlist;

.field retryFooterAdapter:Lcom/vk/music/view/adapter/ViewAdapter;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 26
    invoke-direct {p0}, Lcom/vk/music/attach/controller/Controller;-><init>()V

    return-void
.end method

.method static synthetic access$lambda$0(Lcom/vk/music/attach/controller/PlaylistMusicController;)V
    .locals 0

    invoke-direct {p0}, Lcom/vk/music/attach/controller/PlaylistMusicController;->onRetryButtonClick()V

    return-void
.end method

.method private bind(Lcom/vk/music/attach/loader/PlaylistMusicLoader;)V
    .locals 3
    .param p1, "loader"    # Lcom/vk/music/attach/loader/PlaylistMusicLoader;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 126
    invoke-virtual {p1}, Lcom/vk/music/attach/loader/PlaylistMusicLoader;->getMusicTracks()Ljava/util/List;

    move-result-object v0

    .line 127
    .local v0, "musicTracks":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/audio/MusicTrack;>;"
    if-nez v0, :cond_2

    .line 128
    invoke-virtual {p1}, Lcom/vk/music/attach/loader/PlaylistMusicLoader;->getReason()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_1

    .line 129
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/PlaylistMusicController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v1

    invoke-interface {v1}, Lcom/vk/music/attach/controller/Controller$HostController;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v1

    iget-object v2, p0, Lcom/vk/music/attach/controller/PlaylistMusicController;->loaderAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    if-eq v1, v2, :cond_0

    .line 130
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/PlaylistMusicController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v1

    iget-object v2, p0, Lcom/vk/music/attach/controller/PlaylistMusicController;->loaderAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    invoke-interface {v1, v2}, Lcom/vk/music/attach/controller/Controller$HostController;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 151
    :cond_0
    :goto_0
    return-void

    .line 133
    :cond_1
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/PlaylistMusicController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v1

    invoke-interface {v1}, Lcom/vk/music/attach/controller/Controller$HostController;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v1

    iget-object v2, p0, Lcom/vk/music/attach/controller/PlaylistMusicController;->errorAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    if-eq v1, v2, :cond_0

    .line 134
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/PlaylistMusicController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v1

    iget-object v2, p0, Lcom/vk/music/attach/controller/PlaylistMusicController;->errorAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    invoke-interface {v1, v2}, Lcom/vk/music/attach/controller/Controller$HostController;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    goto :goto_0

    .line 138
    :cond_2
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/PlaylistMusicController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v1

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Lcom/vk/music/attach/controller/Controller$HostController;->setRefreshing(Z)V

    .line 139
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 140
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/PlaylistMusicController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v1

    invoke-interface {v1}, Lcom/vk/music/attach/controller/Controller$HostController;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v1

    iget-object v2, p0, Lcom/vk/music/attach/controller/PlaylistMusicController;->emptyAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    if-eq v1, v2, :cond_0

    .line 141
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/PlaylistMusicController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v1

    iget-object v2, p0, Lcom/vk/music/attach/controller/PlaylistMusicController;->emptyAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    invoke-interface {v1, v2}, Lcom/vk/music/attach/controller/Controller$HostController;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    goto :goto_0

    .line 144
    :cond_3
    iget-object v1, p0, Lcom/vk/music/attach/controller/PlaylistMusicController;->loadingFooterAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    invoke-virtual {p1}, Lcom/vk/music/attach/loader/PlaylistMusicLoader;->canLoadMore()Z

    move-result v2

    invoke-virtual {v1, v2}, Lcom/vk/music/view/adapter/ViewAdapter;->setEnabled(Z)V

    .line 145
    iget-object v1, p0, Lcom/vk/music/attach/controller/PlaylistMusicController;->musicTrackAdapter:Lcom/vk/music/view/adapter/ItemAdapter;

    invoke-virtual {v1, v0}, Lcom/vk/music/view/adapter/ItemAdapter;->setItems(Ljava/util/Collection;)V

    .line 146
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/PlaylistMusicController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v1

    invoke-interface {v1}, Lcom/vk/music/attach/controller/Controller$HostController;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v1

    iget-object v2, p0, Lcom/vk/music/attach/controller/PlaylistMusicController;->contentAdapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    if-eq v1, v2, :cond_0

    .line 147
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/PlaylistMusicController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v1

    iget-object v2, p0, Lcom/vk/music/attach/controller/PlaylistMusicController;->contentAdapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    invoke-interface {v1, v2}, Lcom/vk/music/attach/controller/Controller$HostController;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    goto :goto_0
.end method

.method private onRetryButtonClick()V
    .locals 2

    .prologue
    .line 121
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/PlaylistMusicController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v0

    iget-object v1, p0, Lcom/vk/music/attach/controller/PlaylistMusicController;->loaderAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    invoke-interface {v0, v1}, Lcom/vk/music/attach/controller/Controller$HostController;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 122
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/PlaylistMusicController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v0

    invoke-interface {v0}, Lcom/vk/music/attach/controller/Controller$HostController;->getPlaylistMusicLoader()Lcom/vk/music/attach/loader/PlaylistMusicLoader;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/music/attach/loader/PlaylistMusicLoader;->load()V

    .line 123
    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 46
    invoke-super {p0, p1}, Lcom/vk/music/attach/controller/Controller;->onCreate(Landroid/os/Bundle;)V

    .line 47
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/PlaylistMusicController;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "PlaylistMusicController.arg.playlist"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/vk/music/dto/Playlist;

    iput-object v0, p0, Lcom/vk/music/attach/controller/PlaylistMusicController;->playlist:Lcom/vk/music/dto/Playlist;

    .line 48
    iget-object v0, p0, Lcom/vk/music/attach/controller/PlaylistMusicController;->playlist:Lcom/vk/music/dto/Playlist;

    if-eqz v0, :cond_0

    .line 49
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/PlaylistMusicController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v0

    invoke-interface {v0}, Lcom/vk/music/attach/controller/Controller$HostController;->getPlaylistMusicLoader()Lcom/vk/music/attach/loader/PlaylistMusicLoader;

    move-result-object v0

    iget-object v1, p0, Lcom/vk/music/attach/controller/PlaylistMusicController;->playlist:Lcom/vk/music/dto/Playlist;

    invoke-virtual {v0, v1}, Lcom/vk/music/attach/loader/PlaylistMusicLoader;->setPlaylist(Lcom/vk/music/dto/Playlist;)V

    .line 53
    :goto_0
    return-void

    .line 51
    :cond_0
    const-string/jumbo v0, "vk"

    const-string/jumbo v1, "PlaylistMusicController: Playlist must be passed as an argument"

    invoke-static {v0, v1}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method protected onEndOfListReached()V
    .locals 1

    .prologue
    .line 114
    invoke-super {p0}, Lcom/vk/music/attach/controller/Controller;->onEndOfListReached()V

    .line 115
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/PlaylistMusicController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v0

    invoke-interface {v0}, Lcom/vk/music/attach/controller/Controller$HostController;->getPlaylistMusicLoader()Lcom/vk/music/attach/loader/PlaylistMusicLoader;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/music/attach/loader/PlaylistMusicLoader;->canLoadMore()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 116
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/PlaylistMusicController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v0

    invoke-interface {v0}, Lcom/vk/music/attach/controller/Controller$HostController;->getPlaylistMusicLoader()Lcom/vk/music/attach/loader/PlaylistMusicLoader;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/music/attach/loader/PlaylistMusicLoader;->loadMore()V

    .line 118
    :cond_0
    return-void
.end method

.method protected onLeftButtonClicked()V
    .locals 0

    .prologue
    .line 102
    invoke-super {p0}, Lcom/vk/music/attach/controller/Controller;->onLeftButtonClicked()V

    .line 103
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/PlaylistMusicController;->moveBack()V

    .line 104
    return-void
.end method

.method public onMusicLoadingDone(Lcom/vk/music/attach/loader/PlaylistMusicLoader;)V
    .locals 0
    .param p1, "loader"    # Lcom/vk/music/attach/loader/PlaylistMusicLoader;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 155
    invoke-direct {p0, p1}, Lcom/vk/music/attach/controller/PlaylistMusicController;->bind(Lcom/vk/music/attach/loader/PlaylistMusicLoader;)V

    .line 156
    return-void
.end method

.method public onMusicLoadingError(Lcom/vk/music/attach/loader/PlaylistMusicLoader;Ljava/lang/String;)V
    .locals 0
    .param p1, "loader"    # Lcom/vk/music/attach/loader/PlaylistMusicLoader;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "reason"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 160
    invoke-direct {p0, p1}, Lcom/vk/music/attach/controller/PlaylistMusicController;->bind(Lcom/vk/music/attach/loader/PlaylistMusicLoader;)V

    .line 161
    return-void
.end method

.method public onMusicLoadingMoreDone(Lcom/vk/music/attach/loader/PlaylistMusicLoader;Ljava/util/List;)V
    .locals 2
    .param p1, "loader"    # Lcom/vk/music/attach/loader/PlaylistMusicLoader;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/util/List;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vk/music/attach/loader/PlaylistMusicLoader;",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 165
    .local p2, "musicTracks":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/audio/MusicTrack;>;"
    iget-object v0, p0, Lcom/vk/music/attach/controller/PlaylistMusicController;->musicTrackAdapter:Lcom/vk/music/view/adapter/ItemAdapter;

    invoke-virtual {v0, p2}, Lcom/vk/music/view/adapter/ItemAdapter;->addItems(Ljava/util/Collection;)V

    .line 166
    iget-object v0, p0, Lcom/vk/music/attach/controller/PlaylistMusicController;->loadingFooterAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    invoke-virtual {p1}, Lcom/vk/music/attach/loader/PlaylistMusicLoader;->canLoadMore()Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/vk/music/view/adapter/ViewAdapter;->setEnabled(Z)V

    .line 167
    return-void
.end method

.method public onMusicLoadingMoreError(Lcom/vk/music/attach/loader/PlaylistMusicLoader;Ljava/lang/String;)V
    .locals 0
    .param p1, "loader"    # Lcom/vk/music/attach/loader/PlaylistMusicLoader;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "reason"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 172
    return-void
.end method

.method protected onRefreshRequested()V
    .locals 1

    .prologue
    .line 108
    invoke-super {p0}, Lcom/vk/music/attach/controller/Controller;->onRefreshRequested()V

    .line 109
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/PlaylistMusicController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v0

    invoke-interface {v0}, Lcom/vk/music/attach/controller/Controller$HostController;->getPlaylistMusicLoader()Lcom/vk/music/attach/loader/PlaylistMusicLoader;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/music/attach/loader/PlaylistMusicLoader;->load()V

    .line 110
    return-void
.end method

.method public onStart()V
    .locals 1

    .prologue
    .line 95
    invoke-super {p0}, Lcom/vk/music/attach/controller/Controller;->onStart()V

    .line 97
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/PlaylistMusicController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v0

    invoke-interface {v0}, Lcom/vk/music/attach/controller/Controller$HostController;->getPlaylistMusicLoader()Lcom/vk/music/attach/loader/PlaylistMusicLoader;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/music/attach/loader/PlaylistMusicLoader;->load()V

    .line 98
    return-void
.end method

.method protected onViewAttached(Landroid/os/Bundle;)V
    .locals 4
    .param p1, "savedState"    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    const/16 v3, 0x8

    const/4 v2, 0x1

    .line 57
    invoke-super {p0, p1}, Lcom/vk/music/attach/controller/Controller;->onViewAttached(Landroid/os/Bundle;)V

    .line 59
    iget-object v1, p0, Lcom/vk/music/attach/controller/PlaylistMusicController;->contentAdapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    if-nez v1, :cond_0

    .line 60
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/PlaylistMusicController;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    .line 61
    .local v0, "inflater":Landroid/view/LayoutInflater;
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/PlaylistMusicController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v1

    invoke-static {v0, v1, v2}, Lcom/vk/music/attach/controller/AdapterHelper;->createMusicAdapter(Landroid/view/LayoutInflater;Lcom/vk/music/attach/controller/Controller$HostController;I)Lcom/vk/music/view/adapter/ItemAdapter;

    move-result-object v1

    iput-object v1, p0, Lcom/vk/music/attach/controller/PlaylistMusicController;->musicTrackAdapter:Lcom/vk/music/view/adapter/ItemAdapter;

    .line 62
    const/4 v1, 0x2

    invoke-static {v0, v1}, Lcom/vk/music/attach/controller/AdapterHelper;->createLoadingFooterAdapter(Landroid/view/LayoutInflater;I)Lcom/vk/music/view/adapter/ViewAdapter;

    move-result-object v1

    iput-object v1, p0, Lcom/vk/music/attach/controller/PlaylistMusicController;->loadingFooterAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    .line 63
    invoke-static {p0}, Lcom/vk/music/attach/controller/PlaylistMusicController$$Lambda$1;->lambdaFactory$(Lcom/vk/music/attach/controller/PlaylistMusicController;)Lcom/vkontakte/android/functions/VoidF;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vk/music/attach/controller/AdapterHelper;->createErrorAdapter(Landroid/view/LayoutInflater;Lcom/vkontakte/android/functions/VoidF;)Lcom/vk/music/view/adapter/ViewAdapter;

    move-result-object v1

    iput-object v1, p0, Lcom/vk/music/attach/controller/PlaylistMusicController;->errorAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    .line 64
    invoke-static {v0}, Lcom/vk/music/attach/controller/AdapterHelper;->createEmptyAdapter(Landroid/view/LayoutInflater;)Lcom/vk/music/view/adapter/ViewAdapter;

    move-result-object v1

    iput-object v1, p0, Lcom/vk/music/attach/controller/PlaylistMusicController;->emptyAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    .line 65
    invoke-static {v0}, Lcom/vk/music/attach/controller/AdapterHelper;->createLoaderAdapter(Landroid/view/LayoutInflater;)Lcom/vk/music/view/adapter/ViewAdapter;

    move-result-object v1

    iput-object v1, p0, Lcom/vk/music/attach/controller/PlaylistMusicController;->loaderAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    .line 67
    new-instance v1, Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    invoke-direct {v1}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;-><init>()V

    iput-object v1, p0, Lcom/vk/music/attach/controller/PlaylistMusicController;->contentAdapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    .line 68
    iget-object v1, p0, Lcom/vk/music/attach/controller/PlaylistMusicController;->contentAdapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    invoke-virtual {v1, v2}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->setHasStableIds(Z)V

    .line 69
    iget-object v1, p0, Lcom/vk/music/attach/controller/PlaylistMusicController;->contentAdapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    iget-object v2, p0, Lcom/vk/music/attach/controller/PlaylistMusicController;->musicTrackAdapter:Lcom/vk/music/view/adapter/ItemAdapter;

    invoke-virtual {v1, v2}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->addAdapter(Lme/grishka/appkit/views/UsableRecyclerView$Adapter;)V

    .line 70
    iget-object v1, p0, Lcom/vk/music/attach/controller/PlaylistMusicController;->contentAdapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    iget-object v2, p0, Lcom/vk/music/attach/controller/PlaylistMusicController;->loadingFooterAdapter:Lcom/vk/music/view/adapter/ViewAdapter;

    invoke-virtual {v1, v2}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->addAdapter(Lme/grishka/appkit/views/UsableRecyclerView$Adapter;)V

    .line 73
    .end local v0    # "inflater":Landroid/view/LayoutInflater;
    :cond_0
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/PlaylistMusicController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v1

    invoke-interface {v1}, Lcom/vk/music/attach/controller/Controller$HostController;->getLeftButton()Landroid/widget/ImageView;

    move-result-object v1

    const v2, 0x7f02014f

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 74
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/PlaylistMusicController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v1

    invoke-interface {v1}, Lcom/vk/music/attach/controller/Controller$HostController;->getRightButton()Landroid/widget/ImageView;

    move-result-object v1

    invoke-virtual {v1, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 75
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/PlaylistMusicController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v1

    invoke-interface {v1}, Lcom/vk/music/attach/controller/Controller$HostController;->getSearchView()Landroid/widget/EditText;

    move-result-object v1

    invoke-virtual {v1, v3}, Landroid/widget/EditText;->setVisibility(I)V

    .line 76
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/PlaylistMusicController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v1

    invoke-interface {v1}, Lcom/vk/music/attach/controller/Controller$HostController;->getTitleView()Landroid/widget/TextView;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 77
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/PlaylistMusicController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v1

    invoke-interface {v1}, Lcom/vk/music/attach/controller/Controller$HostController;->getTitleView()Landroid/widget/TextView;

    move-result-object v2

    iget-object v1, p0, Lcom/vk/music/attach/controller/PlaylistMusicController;->playlist:Lcom/vk/music/dto/Playlist;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/vk/music/attach/controller/PlaylistMusicController;->playlist:Lcom/vk/music/dto/Playlist;

    iget-object v1, v1, Lcom/vk/music/dto/Playlist;->title:Ljava/lang/String;

    :goto_0
    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 79
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/PlaylistMusicController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v1

    invoke-interface {v1}, Lcom/vk/music/attach/controller/Controller$HostController;->getPlaylistMusicLoader()Lcom/vk/music/attach/loader/PlaylistMusicLoader;

    move-result-object v1

    invoke-virtual {v1, p0}, Lcom/vk/music/attach/loader/PlaylistMusicLoader;->subscribe(Lcom/vk/music/attach/loader/PlaylistMusicLoader$Callback;)V

    .line 81
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/PlaylistMusicController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v1

    invoke-interface {v1}, Lcom/vk/music/attach/controller/Controller$HostController;->getPlaylistMusicLoader()Lcom/vk/music/attach/loader/PlaylistMusicLoader;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/vk/music/attach/controller/PlaylistMusicController;->bind(Lcom/vk/music/attach/loader/PlaylistMusicLoader;)V

    .line 83
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/PlaylistMusicController;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/vk/core/util/KeyboardUtils;->hideKeyboard(Landroid/content/Context;)V

    .line 84
    return-void

    .line 77
    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method protected onViewDetached()V
    .locals 1

    .prologue
    .line 88
    invoke-super {p0}, Lcom/vk/music/attach/controller/Controller;->onViewDetached()V

    .line 90
    invoke-virtual {p0}, Lcom/vk/music/attach/controller/PlaylistMusicController;->getHostController()Lcom/vk/music/attach/controller/Controller$HostController;

    move-result-object v0

    invoke-interface {v0}, Lcom/vk/music/attach/controller/Controller$HostController;->getPlaylistMusicLoader()Lcom/vk/music/attach/loader/PlaylistMusicLoader;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/vk/music/attach/loader/PlaylistMusicLoader;->unsubscribe(Lcom/vk/music/attach/loader/PlaylistMusicLoader$Callback;)V

    .line 91
    return-void
.end method
