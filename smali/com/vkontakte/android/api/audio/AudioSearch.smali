.class public Lcom/vkontakte/android/api/audio/AudioSearch;
.super Lcom/vkontakte/android/api/ListAPIRequest;
.source "AudioSearch.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/ListAPIRequest",
        "<",
        "Lcom/vkontakte/android/audio/MusicTrack;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ljava/lang/String;ZII)V
    .locals 2
    .param p1, "q"    # Ljava/lang/String;
    .param p2, "byArtist"    # Z
    .param p3, "offset"    # I
    .param p4, "count"    # I

    .prologue
    .line 9
    const-string/jumbo v0, "audio.search"

    const-class v1, Lcom/vkontakte/android/audio/MusicTrack;

    invoke-direct {p0, v0, v1}, Lcom/vkontakte/android/api/ListAPIRequest;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    .line 10
    const-string/jumbo v0, "q"

    invoke-virtual {p0, v0, p1}, Lcom/vkontakte/android/api/audio/AudioSearch;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 12
    const-string/jumbo v0, "search_own"

    const-string/jumbo v1, "1"

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/audio/AudioSearch;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 13
    const-string/jumbo v1, "performer_only"

    if-eqz p2, :cond_0

    const-string/jumbo v0, "1"

    :goto_0
    invoke-virtual {p0, v1, v0}, Lcom/vkontakte/android/api/audio/AudioSearch;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 14
    const-string/jumbo v0, "offset"

    invoke-virtual {p0, v0, p3}, Lcom/vkontakte/android/api/audio/AudioSearch;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 15
    const-string/jumbo v0, "count"

    invoke-virtual {p0, v0, p4}, Lcom/vkontakte/android/api/audio/AudioSearch;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 16
    return-void

    .line 13
    :cond_0
    const-string/jumbo v0, "0"

    goto :goto_0
.end method
