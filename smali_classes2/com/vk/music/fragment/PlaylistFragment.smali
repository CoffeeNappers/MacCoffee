.class public final Lcom/vk/music/fragment/PlaylistFragment;
.super Lcom/vk/music/fragment/DelegatingFragment;
.source "PlaylistFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/music/fragment/PlaylistFragment$Builder;
    }
.end annotation


# static fields
.field private static final ARG_OWNER_ID:Ljava/lang/String; = "ownerId"

.field private static final ARG_PLAYLIST:Ljava/lang/String; = "playlist"

.field private static final ARG_PLAYLIST_ACCESS_KEY:Ljava/lang/String; = "accessKey"

.field private static final ARG_PLAYLIST_ID:Ljava/lang/String; = "playlistId"

.field private static final ARG_PLAYLIST_TYPE:Ljava/lang/String; = "playlistType"


# instance fields
.field private smallPlayerHelper:Lcom/vk/music/utils/SmallPlayerHelper;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 23
    invoke-direct {p0}, Lcom/vk/music/fragment/DelegatingFragment;-><init>()V

    .line 32
    new-instance v0, Lcom/vk/music/utils/SmallPlayerHelper;

    invoke-direct {v0}, Lcom/vk/music/utils/SmallPlayerHelper;-><init>()V

    iput-object v0, p0, Lcom/vk/music/fragment/PlaylistFragment;->smallPlayerHelper:Lcom/vk/music/utils/SmallPlayerHelper;

    return-void
.end method


# virtual methods
.method protected createDelegate()Lcom/vk/music/fragment/FragmentDelegate;
    .locals 7
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 77
    invoke-virtual {p0}, Lcom/vk/music/fragment/PlaylistFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v6

    .line 78
    .local v6, "args":Landroid/os/Bundle;
    const-string/jumbo v1, "playlistType"

    invoke-virtual {v6, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v3

    .line 82
    .local v3, "playlistType":I
    new-instance v0, Lcom/vk/music/model/PlaylistModelImpl;

    const-string/jumbo v1, "ownerId"

    .line 83
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v2

    invoke-virtual {v6, v1, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v1

    const-string/jumbo v2, "playlistId"

    .line 84
    invoke-virtual {v6, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v2

    const-string/jumbo v4, "playlist"

    .line 86
    invoke-virtual {v6, v4}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v4

    check-cast v4, Lcom/vk/music/dto/Playlist;

    const-string/jumbo v5, "accessKey"

    .line 87
    invoke-virtual {v6, v5}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-direct/range {v0 .. v5}, Lcom/vk/music/model/PlaylistModelImpl;-><init>(IIILcom/vk/music/dto/Playlist;Ljava/lang/String;)V

    .line 88
    .local v0, "model":Lcom/vk/music/model/PlaylistModel;
    new-instance v1, Lcom/vk/music/fragment/FragmentDelegateActiveModel;

    invoke-static {p0}, Lcom/vk/music/fragment/PlaylistFragment$$Lambda$1;->lambdaFactory$(Lcom/vk/music/fragment/PlaylistFragment;)Lcom/vk/music/fragment/FragmentDelegateActiveModel$ViewCreator;

    move-result-object v2

    const/4 v4, 0x1

    new-array v4, v4, [Lcom/vk/music/model/ActiveModel;

    const/4 v5, 0x0

    aput-object v0, v4, v5

    invoke-direct {v1, v2, v4}, Lcom/vk/music/fragment/FragmentDelegateActiveModel;-><init>(Lcom/vk/music/fragment/FragmentDelegateActiveModel$ViewCreator;[Lcom/vk/music/model/ActiveModel;)V

    return-object v1
.end method

.method synthetic lambda$createDelegate$0(Lcom/vk/music/fragment/FragmentDelegateActiveModel;)Landroid/view/View;
    .locals 3
    .param p1, "fd"    # Lcom/vk/music/fragment/FragmentDelegateActiveModel;

    .prologue
    .line 88
    new-instance v1, Lcom/vk/music/view/PlaylistContainer;

    invoke-virtual {p0}, Lcom/vk/music/fragment/PlaylistFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/vk/music/fragment/FragmentDelegateActiveModel;->model(I)Lcom/vk/music/model/ActiveModel;

    move-result-object v0

    check-cast v0, Lcom/vk/music/model/PlaylistModel;

    invoke-direct {v1, v2, v0}, Lcom/vk/music/view/PlaylistContainer;-><init>(Landroid/content/Context;Lcom/vk/music/model/PlaylistModel;)V

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
    .line 65
    iget-object v0, p0, Lcom/vk/music/fragment/PlaylistFragment;->smallPlayerHelper:Lcom/vk/music/utils/SmallPlayerHelper;

    invoke-super {p0, p1, p2, p3}, Lcom/vk/music/fragment/DelegatingFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/music/utils/SmallPlayerHelper;->onCreateView(Landroid/view/View;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public onDestroyView()V
    .locals 1

    .prologue
    .line 70
    iget-object v0, p0, Lcom/vk/music/fragment/PlaylistFragment;->smallPlayerHelper:Lcom/vk/music/utils/SmallPlayerHelper;

    invoke-virtual {v0}, Lcom/vk/music/utils/SmallPlayerHelper;->onDestroyView()V

    .line 71
    invoke-super {p0}, Lcom/vk/music/fragment/DelegatingFragment;->onDestroyView()V

    .line 72
    return-void
.end method
