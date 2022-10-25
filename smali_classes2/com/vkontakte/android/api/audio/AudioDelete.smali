.class public Lcom/vkontakte/android/api/audio/AudioDelete;
.super Lcom/vkontakte/android/api/ResultlessAPIRequest;
.source "AudioDelete.java"


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/audio/MusicTrack;)V
    .locals 2
    .param p1, "musicTrack"    # Lcom/vkontakte/android/audio/MusicTrack;

    .prologue
    .line 9
    const-string/jumbo v0, "audio.delete"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/api/ResultlessAPIRequest;-><init>(Ljava/lang/String;)V

    .line 10
    const-string/jumbo v0, "owner_id"

    iget v1, p1, Lcom/vkontakte/android/audio/MusicTrack;->oid:I

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/audio/AudioDelete;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 11
    const-string/jumbo v0, "audio_id"

    iget v1, p1, Lcom/vkontakte/android/audio/MusicTrack;->aid:I

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/audio/AudioDelete;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 12
    return-void
.end method
