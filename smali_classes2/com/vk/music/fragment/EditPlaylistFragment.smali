.class public final Lcom/vk/music/fragment/EditPlaylistFragment;
.super Lcom/vk/music/fragment/DelegatingFragment;
.source "EditPlaylistFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/music/fragment/EditPlaylistFragment$Builder;
    }
.end annotation


# static fields
.field private static final ARG_MUSIC_TRACKS:Ljava/lang/String; = "EditPlaylistFragment.arg.musicTracks"

.field private static final ARG_OFFSET:Ljava/lang/String; = "EditPlaylistFragment.arg.offset"

.field private static final ARG_PLAYLIST:Ljava/lang/String; = "EditPlaylistFragment.arg.playlist"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 28
    invoke-direct {p0}, Lcom/vk/music/fragment/DelegatingFragment;-><init>()V

    return-void
.end method


# virtual methods
.method protected createDelegate()Lcom/vk/music/fragment/FragmentDelegate;
    .locals 9
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 55
    new-instance v1, Lcom/vk/music/fragment/FragmentDelegateActiveModel;

    invoke-static {p0}, Lcom/vk/music/fragment/EditPlaylistFragment$$Lambda$1;->lambdaFactory$(Lcom/vk/music/fragment/EditPlaylistFragment;)Lcom/vk/music/fragment/FragmentDelegateActiveModel$ViewCreator;

    move-result-object v2

    const/4 v0, 0x1

    new-array v3, v0, [Lcom/vk/music/model/ActiveModel;

    const/4 v4, 0x0

    new-instance v5, Lcom/vk/music/fragment/EditPlaylistModelImpl;

    .line 58
    invoke-virtual {p0}, Lcom/vk/music/fragment/EditPlaylistFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v6, "EditPlaylistFragment.arg.playlist"

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/vk/music/dto/Playlist;

    .line 59
    invoke-virtual {p0}, Lcom/vk/music/fragment/EditPlaylistFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v6

    const-string/jumbo v7, "EditPlaylistFragment.arg.offset"

    invoke-virtual {v6, v7}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v6

    .line 60
    invoke-virtual {p0}, Lcom/vk/music/fragment/EditPlaylistFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v7

    const-string/jumbo v8, "EditPlaylistFragment.arg.musicTracks"

    invoke-virtual {v7, v8}, Landroid/os/Bundle;->getParcelableArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v7

    invoke-direct {v5, v0, v6, v7}, Lcom/vk/music/fragment/EditPlaylistModelImpl;-><init>(Lcom/vk/music/dto/Playlist;ILjava/util/ArrayList;)V

    aput-object v5, v3, v4

    invoke-direct {v1, v2, v3}, Lcom/vk/music/fragment/FragmentDelegateActiveModel;-><init>(Lcom/vk/music/fragment/FragmentDelegateActiveModel$ViewCreator;[Lcom/vk/music/model/ActiveModel;)V

    return-object v1
.end method

.method synthetic lambda$createDelegate$0(Lcom/vk/music/fragment/FragmentDelegateActiveModel;)Landroid/view/View;
    .locals 3
    .param p1, "fd"    # Lcom/vk/music/fragment/FragmentDelegateActiveModel;

    .prologue
    .line 56
    new-instance v1, Lcom/vk/music/view/EditPlaylistContainer;

    invoke-virtual {p0}, Lcom/vk/music/fragment/EditPlaylistFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/vk/music/fragment/FragmentDelegateActiveModel;->model(I)Lcom/vk/music/model/ActiveModel;

    move-result-object v0

    check-cast v0, Lcom/vk/music/model/EditPlaylistModel;

    invoke-direct {v1, v2, v0}, Lcom/vk/music/view/EditPlaylistContainer;-><init>(Landroid/content/Context;Lcom/vk/music/model/EditPlaylistModel;)V

    return-object v1
.end method
