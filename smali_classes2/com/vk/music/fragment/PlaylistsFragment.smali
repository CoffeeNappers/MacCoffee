.class public final Lcom/vk/music/fragment/PlaylistsFragment;
.super Lcom/vk/music/fragment/DelegatingFragment;
.source "PlaylistsFragment.java"

# interfaces
.implements Lcom/vk/music/model/PlaylistsModelImpl$RequestCreator;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/music/fragment/PlaylistsFragment$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vk/music/fragment/DelegatingFragment;",
        "Lcom/vk/music/model/PlaylistsModelImpl$RequestCreator",
        "<",
        "Lcom/vkontakte/android/data/VKList",
        "<",
        "Lcom/vk/music/dto/Playlist;",
        ">;>;"
    }
.end annotation


# static fields
.field private static final ARG_CATALOG_BLOCK_ID:Ljava/lang/String; = "catalogBlockId"

.field private static final ARG_OWNER_ID:Ljava/lang/String; = "ownerId"

.field private static final ARG_SELECT:Ljava/lang/String; = "select"

.field private static final ARG_SELECT_MY:Ljava/lang/String; = "selectMy"

.field private static final ARG_TITLE:Ljava/lang/String; = "title"


# instance fields
.field private smallPlayerHelper:Lcom/vk/music/utils/SmallPlayerHelper;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 26
    invoke-direct {p0}, Lcom/vk/music/fragment/DelegatingFragment;-><init>()V

    .line 34
    new-instance v0, Lcom/vk/music/utils/SmallPlayerHelper;

    invoke-direct {v0}, Lcom/vk/music/utils/SmallPlayerHelper;-><init>()V

    iput-object v0, p0, Lcom/vk/music/fragment/PlaylistsFragment;->smallPlayerHelper:Lcom/vk/music/utils/SmallPlayerHelper;

    return-void
.end method


# virtual methods
.method protected createDelegate()Lcom/vk/music/fragment/FragmentDelegate;
    .locals 10
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 84
    invoke-virtual {p0}, Lcom/vk/music/fragment/PlaylistsFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    .line 85
    .local v0, "args":Landroid/os/Bundle;
    const-string/jumbo v4, "ownerId"

    .line 86
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v7

    invoke-virtual {v7}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v7

    .line 85
    invoke-virtual {v0, v4, v7}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v4

    invoke-static {v4}, Lcom/vkontakte/android/auth/VKAccountManager;->isCurrentUser(I)Z

    move-result v3

    .line 87
    .local v3, "isCurrentUser":Z
    const-string/jumbo v4, "catalogBlockId"

    invoke-virtual {v0, v4}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v2

    .line 88
    .local v2, "containsBlockId":Z
    new-instance v4, Lcom/vk/music/model/PlaylistsModelImpl$Builder;

    invoke-direct {v4, p0}, Lcom/vk/music/model/PlaylistsModelImpl$Builder;-><init>(Lcom/vk/music/model/PlaylistsModelImpl$RequestCreator;)V

    .line 89
    invoke-virtual {v4, v3}, Lcom/vk/music/model/PlaylistsModelImpl$Builder;->currentUser(Z)Lcom/vk/music/model/PlaylistsModelImpl$Builder;

    move-result-object v7

    if-eqz v3, :cond_0

    if-nez v2, :cond_0

    move v4, v5

    .line 90
    :goto_0
    invoke-virtual {v7, v4}, Lcom/vk/music/model/PlaylistsModelImpl$Builder;->canAddPlaylist(Z)Lcom/vk/music/model/PlaylistsModelImpl$Builder;

    move-result-object v4

    const-string/jumbo v7, "select"

    .line 91
    invoke-virtual {v0, v7}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v7

    invoke-virtual {v4, v7}, Lcom/vk/music/model/PlaylistsModelImpl$Builder;->selectMode(Z)Lcom/vk/music/model/PlaylistsModelImpl$Builder;

    move-result-object v4

    const-string/jumbo v7, "title"

    .line 92
    invoke-virtual {p0}, Lcom/vk/music/fragment/PlaylistsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v8

    invoke-static {v8}, Lcom/vk/core/util/Resourcer;->of(Landroid/content/Context;)Lcom/vk/core/util/Resourcer;

    move-result-object v8

    const v9, 0x7f0803ce

    invoke-virtual {v8, v9}, Lcom/vk/core/util/Resourcer;->str(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0, v7, v8}, Landroid/os/Bundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Lcom/vk/music/model/PlaylistsModelImpl$Builder;->title(Ljava/lang/String;)Lcom/vk/music/model/PlaylistsModelImpl$Builder;

    move-result-object v1

    .line 93
    .local v1, "builder":Lcom/vk/music/model/PlaylistsModelImpl$Builder;
    new-instance v4, Lcom/vk/music/fragment/FragmentDelegateActiveModel;

    invoke-static {p0}, Lcom/vk/music/fragment/PlaylistsFragment$$Lambda$1;->lambdaFactory$(Lcom/vk/music/fragment/PlaylistsFragment;)Lcom/vk/music/fragment/FragmentDelegateActiveModel$ViewCreator;

    move-result-object v7

    new-array v5, v5, [Lcom/vk/music/model/ActiveModel;

    invoke-virtual {v1}, Lcom/vk/music/model/PlaylistsModelImpl$Builder;->build()Lcom/vk/music/model/PlaylistsModelImpl;

    move-result-object v8

    aput-object v8, v5, v6

    invoke-direct {v4, v7, v5}, Lcom/vk/music/fragment/FragmentDelegateActiveModel;-><init>(Lcom/vk/music/fragment/FragmentDelegateActiveModel$ViewCreator;[Lcom/vk/music/model/ActiveModel;)V

    return-object v4

    .end local v1    # "builder":Lcom/vk/music/model/PlaylistsModelImpl$Builder;
    :cond_0
    move v4, v6

    .line 89
    goto :goto_0
.end method

.method public createLoadRequest(Lcom/vk/music/model/PlaylistsModelImpl;II)Lcom/vkontakte/android/api/VKAPIRequest;
    .locals 5
    .param p1, "model"    # Lcom/vk/music/model/PlaylistsModelImpl;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "offset"    # I
    .param p3, "count"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vk/music/model/PlaylistsModelImpl;",
            "II)",
            "Lcom/vkontakte/android/api/VKAPIRequest",
            "<",
            "Lcom/vkontakte/android/data/VKList",
            "<",
            "Lcom/vk/music/dto/Playlist;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 98
    invoke-virtual {p0}, Lcom/vk/music/fragment/PlaylistsFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    .line 99
    .local v0, "args":Landroid/os/Bundle;
    const-string/jumbo v3, "catalogBlockId"

    invoke-virtual {v0, v3}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 100
    new-instance v3, Lcom/vkontakte/android/api/audio/AudioGetCatalogBlockById$Builder;

    const-string/jumbo v4, "catalogBlockId"

    invoke-virtual {v0, v4}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v4

    invoke-direct {v3, v4, p2, p3}, Lcom/vkontakte/android/api/audio/AudioGetCatalogBlockById$Builder;-><init>(III)V

    invoke-virtual {v3}, Lcom/vkontakte/android/api/audio/AudioGetCatalogBlockById$Builder;->buildPlaylists()Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v3

    .line 109
    :goto_0
    return-object v3

    .line 102
    :cond_0
    const-string/jumbo v3, "ownerId"

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v4

    invoke-virtual {v4}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v4

    invoke-virtual {v0, v3, v4}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v2

    .line 103
    .local v2, "ownerId":I
    new-instance v1, Lcom/vkontakte/android/api/audio/AudioGetPlaylists$Builder;

    invoke-direct {v1, v2}, Lcom/vkontakte/android/api/audio/AudioGetPlaylists$Builder;-><init>(I)V

    .line 104
    .local v1, "builder":Lcom/vkontakte/android/api/audio/AudioGetPlaylists$Builder;
    const-string/jumbo v3, "selectMy"

    invoke-virtual {v0, v3}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 105
    sget-object v3, Lcom/vkontakte/android/api/audio/AudioGetPlaylists$Filter;->owned:Lcom/vkontakte/android/api/audio/AudioGetPlaylists$Filter;

    invoke-virtual {v1, v3}, Lcom/vkontakte/android/api/audio/AudioGetPlaylists$Builder;->filter(Lcom/vkontakte/android/api/audio/AudioGetPlaylists$Filter;)Lcom/vkontakte/android/api/audio/AudioGetPlaylists$Builder;

    .line 109
    :goto_1
    invoke-virtual {v1, p2}, Lcom/vkontakte/android/api/audio/AudioGetPlaylists$Builder;->offset(I)Lcom/vkontakte/android/api/audio/AudioGetPlaylists$Builder;

    move-result-object v3

    invoke-virtual {v3, p3}, Lcom/vkontakte/android/api/audio/AudioGetPlaylists$Builder;->count(I)Lcom/vkontakte/android/api/audio/AudioGetPlaylists$Builder;

    move-result-object v3

    invoke-virtual {v3}, Lcom/vkontakte/android/api/audio/AudioGetPlaylists$Builder;->build()Lcom/vkontakte/android/api/audio/AudioGetPlaylists;

    move-result-object v3

    goto :goto_0

    .line 107
    :cond_1
    sget-object v3, Lcom/vkontakte/android/api/audio/AudioGetPlaylists$Filter;->all:Lcom/vkontakte/android/api/audio/AudioGetPlaylists$Filter;

    invoke-virtual {v1, v3}, Lcom/vkontakte/android/api/audio/AudioGetPlaylists$Builder;->filter(Lcom/vkontakte/android/api/audio/AudioGetPlaylists$Filter;)Lcom/vkontakte/android/api/audio/AudioGetPlaylists$Builder;

    goto :goto_1
.end method

.method synthetic lambda$createDelegate$0(Lcom/vk/music/fragment/FragmentDelegateActiveModel;)Landroid/view/View;
    .locals 3
    .param p1, "fd"    # Lcom/vk/music/fragment/FragmentDelegateActiveModel;

    .prologue
    .line 93
    new-instance v1, Lcom/vk/music/view/PlaylistsContainer;

    invoke-virtual {p0}, Lcom/vk/music/fragment/PlaylistsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/vk/music/fragment/FragmentDelegateActiveModel;->model(I)Lcom/vk/music/model/ActiveModel;

    move-result-object v0

    check-cast v0, Lcom/vk/music/model/PlaylistsModel;

    invoke-direct {v1, v2, v0}, Lcom/vk/music/view/PlaylistsContainer;-><init>(Landroid/content/Context;Lcom/vk/music/model/PlaylistsModel;)V

    return-object v1
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 2
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 72
    iget-object v0, p0, Lcom/vk/music/fragment/PlaylistsFragment;->smallPlayerHelper:Lcom/vk/music/utils/SmallPlayerHelper;

    invoke-super {p0, p1, p2, p3}, Lcom/vk/music/fragment/DelegatingFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/music/utils/SmallPlayerHelper;->onCreateView(Landroid/view/View;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public onDestroyView()V
    .locals 1

    .prologue
    .line 77
    iget-object v0, p0, Lcom/vk/music/fragment/PlaylistsFragment;->smallPlayerHelper:Lcom/vk/music/utils/SmallPlayerHelper;

    invoke-virtual {v0}, Lcom/vk/music/utils/SmallPlayerHelper;->onDestroyView()V

    .line 78
    invoke-super {p0}, Lcom/vk/music/fragment/DelegatingFragment;->onDestroyView()V

    .line 79
    return-void
.end method
