.class public final Lcom/vk/music/event/PlaylistRemoved;
.super Lcom/vk/music/event/PlaylistEvent;
.source "PlaylistRemoved.java"


# direct methods
.method public constructor <init>(Lcom/vk/music/dto/Playlist;)V
    .locals 0
    .param p1, "playlist"    # Lcom/vk/music/dto/Playlist;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 14
    invoke-direct {p0, p1}, Lcom/vk/music/event/PlaylistEvent;-><init>(Lcom/vk/music/dto/Playlist;)V

    .line 15
    return-void
.end method
