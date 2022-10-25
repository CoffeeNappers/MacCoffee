.class public Lcom/vk/music/fragment/EditPlaylistFragment$Builder;
.super Lcom/vkontakte/android/navigation/Navigator;
.source "EditPlaylistFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/music/fragment/EditPlaylistFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 37
    const-class v0, Lcom/vk/music/fragment/EditPlaylistFragment;

    invoke-direct {p0, v0}, Lcom/vkontakte/android/navigation/Navigator;-><init>(Ljava/lang/Class;)V

    .line 38
    return-void
.end method


# virtual methods
.method public musicTracks(ILjava/util/Collection;)Lcom/vk/music/fragment/EditPlaylistFragment$Builder;
    .locals 3
    .param p1, "offset"    # I
    .param p2    # Ljava/util/Collection;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/Collection",
            "<",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;)",
            "Lcom/vk/music/fragment/EditPlaylistFragment$Builder;"
        }
    .end annotation

    .prologue
    .line 46
    .local p2, "musicTracks":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/vkontakte/android/audio/MusicTrack;>;"
    iget-object v0, p0, Lcom/vk/music/fragment/EditPlaylistFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "EditPlaylistFragment.arg.offset"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 47
    iget-object v1, p0, Lcom/vk/music/fragment/EditPlaylistFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v2, "EditPlaylistFragment.arg.musicTracks"

    if-eqz p2, :cond_0

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    :goto_0
    invoke-virtual {v1, v2, v0}, Landroid/os/Bundle;->putParcelableArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 48
    return-object p0

    .line 47
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public playlist(Lcom/vk/music/dto/Playlist;)Lcom/vk/music/fragment/EditPlaylistFragment$Builder;
    .locals 2
    .param p1, "playlist"    # Lcom/vk/music/dto/Playlist;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 41
    iget-object v0, p0, Lcom/vk/music/fragment/EditPlaylistFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "EditPlaylistFragment.arg.playlist"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 42
    return-object p0
.end method
