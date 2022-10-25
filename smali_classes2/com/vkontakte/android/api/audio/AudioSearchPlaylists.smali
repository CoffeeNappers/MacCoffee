.class public Lcom/vkontakte/android/api/audio/AudioSearchPlaylists;
.super Lcom/vkontakte/android/api/ListAPIRequest;
.source "AudioSearchPlaylists.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/api/audio/AudioSearchPlaylists$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/ListAPIRequest",
        "<",
        "Lcom/vk/music/dto/Playlist;",
        ">;"
    }
.end annotation


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/api/audio/AudioSearchPlaylists$Builder;)V
    .locals 2
    .param p1, "builder"    # Lcom/vkontakte/android/api/audio/AudioSearchPlaylists$Builder;

    .prologue
    .line 13
    const-string/jumbo v0, "audio.searchPlaylists"

    const-class v1, Lcom/vk/music/dto/Playlist;

    invoke-direct {p0, v0, v1}, Lcom/vkontakte/android/api/ListAPIRequest;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    .line 14
    const-string/jumbo v0, "q"

    iget-object v1, p1, Lcom/vkontakte/android/api/audio/AudioSearchPlaylists$Builder;->query:Ljava/lang/String;

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/audio/AudioSearchPlaylists;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 15
    const-string/jumbo v0, "owner_id"

    iget v1, p1, Lcom/vkontakte/android/api/audio/AudioSearchPlaylists$Builder;->ownerId:I

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/audio/AudioSearchPlaylists;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 16
    const-string/jumbo v0, "offset"

    iget v1, p1, Lcom/vkontakte/android/api/audio/AudioSearchPlaylists$Builder;->offset:I

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/audio/AudioSearchPlaylists;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 17
    const-string/jumbo v0, "count"

    iget v1, p1, Lcom/vkontakte/android/api/audio/AudioSearchPlaylists$Builder;->count:I

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/audio/AudioSearchPlaylists;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 18
    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/api/audio/AudioSearchPlaylists$Builder;Lcom/vkontakte/android/api/audio/AudioSearchPlaylists$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/api/audio/AudioSearchPlaylists$Builder;
    .param p2, "x1"    # Lcom/vkontakte/android/api/audio/AudioSearchPlaylists$1;

    .prologue
    .line 10
    invoke-direct {p0, p1}, Lcom/vkontakte/android/api/audio/AudioSearchPlaylists;-><init>(Lcom/vkontakte/android/api/audio/AudioSearchPlaylists$Builder;)V

    return-void
.end method
