.class public final Lcom/vkontakte/android/api/audio/AudioDeletePlaylist;
.super Lcom/vkontakte/android/api/ResultlessAPIRequest;
.source "AudioDeletePlaylist.java"


# direct methods
.method public constructor <init>(II)V
    .locals 1
    .param p1, "playlistId"    # I
    .param p2, "ownerId"    # I

    .prologue
    .line 12
    const-string/jumbo v0, "audio.deletePlaylist"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/api/ResultlessAPIRequest;-><init>(Ljava/lang/String;)V

    .line 13
    const-string/jumbo v0, "playlist_id"

    invoke-virtual {p0, v0, p1}, Lcom/vkontakte/android/api/audio/AudioDeletePlaylist;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 14
    const-string/jumbo v0, "owner_id"

    invoke-virtual {p0, v0, p2}, Lcom/vkontakte/android/api/audio/AudioDeletePlaylist;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 15
    return-void
.end method
