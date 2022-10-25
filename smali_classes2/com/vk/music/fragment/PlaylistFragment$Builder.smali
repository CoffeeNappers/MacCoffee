.class public final Lcom/vk/music/fragment/PlaylistFragment$Builder;
.super Lcom/vkontakte/android/navigation/Navigator;
.source "PlaylistFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/music/fragment/PlaylistFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# direct methods
.method public constructor <init>(II)V
    .locals 2
    .param p1, "ownerId"    # I
    .param p2, "playlistId"    # I

    .prologue
    .line 37
    const-class v0, Lcom/vk/music/fragment/PlaylistFragment;

    invoke-direct {p0, v0}, Lcom/vkontakte/android/navigation/Navigator;-><init>(Ljava/lang/Class;)V

    .line 38
    iget-object v0, p0, Lcom/vk/music/fragment/PlaylistFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "ownerId"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 39
    iget-object v0, p0, Lcom/vk/music/fragment/PlaylistFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "playlistId"

    invoke-virtual {v0, v1, p2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 40
    return-void
.end method

.method public constructor <init>(Lcom/vk/music/dto/AlbumLink;)V
    .locals 2
    .param p1, "link"    # Lcom/vk/music/dto/AlbumLink;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 52
    iget v0, p1, Lcom/vk/music/dto/AlbumLink;->ownerId:I

    iget v1, p1, Lcom/vk/music/dto/AlbumLink;->id:I

    invoke-direct {p0, v0, v1}, Lcom/vk/music/fragment/PlaylistFragment$Builder;-><init>(II)V

    .line 53
    iget-object v0, p1, Lcom/vk/music/dto/AlbumLink;->accessKey:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/vk/music/fragment/PlaylistFragment$Builder;->accessKey(Ljava/lang/String;)Lcom/vk/music/fragment/PlaylistFragment$Builder;

    .line 54
    return-void
.end method

.method public constructor <init>(Lcom/vk/music/dto/Playlist;)V
    .locals 3
    .param p1, "playlist"    # Lcom/vk/music/dto/Playlist;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 43
    const-class v0, Lcom/vk/music/fragment/PlaylistFragment;

    invoke-direct {p0, v0}, Lcom/vkontakte/android/navigation/Navigator;-><init>(Ljava/lang/Class;)V

    .line 44
    invoke-virtual {p1}, Lcom/vk/music/dto/Playlist;->getOriginalPlaylist()Lcom/vk/music/dto/Playlist;

    move-result-object p1

    .line 45
    iget-object v0, p0, Lcom/vk/music/fragment/PlaylistFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "ownerId"

    iget v2, p1, Lcom/vk/music/dto/Playlist;->ownerId:I

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 46
    iget-object v0, p0, Lcom/vk/music/fragment/PlaylistFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "playlistId"

    iget v2, p1, Lcom/vk/music/dto/Playlist;->id:I

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 47
    iget-object v0, p0, Lcom/vk/music/fragment/PlaylistFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "playlistType"

    iget v2, p1, Lcom/vk/music/dto/Playlist;->type:I

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 48
    iget-object v0, p1, Lcom/vk/music/dto/Playlist;->accessKey:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/vk/music/fragment/PlaylistFragment$Builder;->accessKey(Ljava/lang/String;)Lcom/vk/music/fragment/PlaylistFragment$Builder;

    .line 49
    return-void
.end method


# virtual methods
.method public accessKey(Ljava/lang/String;)Lcom/vk/music/fragment/PlaylistFragment$Builder;
    .locals 2
    .param p1, "accessKey"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 57
    iget-object v0, p0, Lcom/vk/music/fragment/PlaylistFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "accessKey"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 58
    return-object p0
.end method
