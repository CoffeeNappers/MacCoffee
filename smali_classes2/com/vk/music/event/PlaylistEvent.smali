.class public Lcom/vk/music/event/PlaylistEvent;
.super Ljava/lang/Object;
.source "PlaylistEvent.java"

# interfaces
.implements Lcom/vk/music/event/Event;


# instance fields
.field public final playlist:Lcom/vk/music/dto/Playlist;


# direct methods
.method public constructor <init>(Lcom/vk/music/dto/Playlist;)V
    .locals 0
    .param p1, "playlist"    # Lcom/vk/music/dto/Playlist;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    iput-object p1, p0, Lcom/vk/music/event/PlaylistEvent;->playlist:Lcom/vk/music/dto/Playlist;

    .line 17
    return-void
.end method
