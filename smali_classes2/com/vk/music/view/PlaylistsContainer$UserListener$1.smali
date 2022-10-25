.class Lcom/vk/music/view/PlaylistsContainer$UserListener$1;
.super Ljava/lang/Object;
.source "PlaylistsContainer.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/music/view/PlaylistsContainer$UserListener;->onActionClick(Lcom/vk/music/dto/Playlist;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vkontakte/android/api/Callback",
        "<",
        "Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Result;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/vk/music/view/PlaylistsContainer$UserListener;


# direct methods
.method constructor <init>(Lcom/vk/music/view/PlaylistsContainer$UserListener;)V
    .locals 0
    .param p1, "this$1"    # Lcom/vk/music/view/PlaylistsContainer$UserListener;

    .prologue
    .line 113
    iput-object p1, p0, Lcom/vk/music/view/PlaylistsContainer$UserListener$1;->this$1:Lcom/vk/music/view/PlaylistsContainer$UserListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 0
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 123
    return-void
.end method

.method public success(Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Result;)V
    .locals 2
    .param p1, "result"    # Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Result;

    .prologue
    .line 116
    if-eqz p1, :cond_0

    iget-object v0, p1, Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Result;->musicTracks:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    iget-object v0, p1, Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Result;->musicTracks:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_0

    .line 117
    iget-object v0, p0, Lcom/vk/music/view/PlaylistsContainer$UserListener$1;->this$1:Lcom/vk/music/view/PlaylistsContainer$UserListener;

    iget-object v0, v0, Lcom/vk/music/view/PlaylistsContainer$UserListener;->this$0:Lcom/vk/music/view/PlaylistsContainer;

    invoke-virtual {v0}, Lcom/vk/music/view/PlaylistsContainer;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p1, Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Result;->musicTracks:Ljava/util/ArrayList;

    invoke-static {v0, v1}, Lcom/vkontakte/android/audio/AudioFacade;->addToPlayNext(Landroid/content/Context;Ljava/util/Collection;)V

    .line 119
    :cond_0
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 113
    check-cast p1, Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Result;

    invoke-virtual {p0, p1}, Lcom/vk/music/view/PlaylistsContainer$UserListener$1;->success(Lcom/vkontakte/android/api/audio/AudioGetPlaylist$Result;)V

    return-void
.end method
