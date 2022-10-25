.class public Lcom/vkontakte/android/api/audio/AudioGet;
.super Lcom/vkontakte/android/api/ListAPIRequest;
.source "AudioGet.java"


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
.method public constructor <init>(I)V
    .locals 2
    .param p1, "owner_id"    # I

    .prologue
    .line 11
    const-string/jumbo v0, "audio.get"

    const-class v1, Lcom/vkontakte/android/audio/MusicTrack;

    invoke-direct {p0, v0, v1}, Lcom/vkontakte/android/api/ListAPIRequest;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    .line 12
    const-string/jumbo v0, "owner_id"

    invoke-virtual {p0, v0, p1}, Lcom/vkontakte/android/api/audio/AudioGet;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 13
    return-void
.end method


# virtual methods
.method public accessKey(Ljava/lang/String;)Lcom/vkontakte/android/api/audio/AudioGet;
    .locals 1
    .param p1, "accessKey"    # Ljava/lang/String;

    .prologue
    .line 38
    const-string/jumbo v0, "access_key"

    invoke-virtual {p0, v0, p1}, Lcom/vkontakte/android/api/audio/AudioGet;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 39
    return-object p0
.end method

.method public count(I)Lcom/vkontakte/android/api/audio/AudioGet;
    .locals 1
    .param p1, "count"    # I

    .prologue
    .line 16
    const-string/jumbo v0, "count"

    invoke-virtual {p0, v0, p1}, Lcom/vkontakte/android/api/audio/AudioGet;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 17
    return-object p0
.end method

.method public extended()Lcom/vkontakte/android/api/audio/AudioGet;
    .locals 2

    .prologue
    .line 43
    const-string/jumbo v0, "extended"

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/audio/AudioGet;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 44
    return-object p0
.end method

.method public offset(I)Lcom/vkontakte/android/api/audio/AudioGet;
    .locals 1
    .param p1, "offset"    # I

    .prologue
    .line 21
    const-string/jumbo v0, "offset"

    invoke-virtual {p0, v0, p1}, Lcom/vkontakte/android/api/audio/AudioGet;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 22
    return-object p0
.end method

.method public playlistId(I)Lcom/vkontakte/android/api/audio/AudioGet;
    .locals 1
    .param p1, "playlistId"    # I

    .prologue
    .line 26
    const-string/jumbo v0, "playlist_id"

    invoke-virtual {p0, v0, p1}, Lcom/vkontakte/android/api/audio/AudioGet;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 27
    return-object p0
.end method

.method public shuffle()Lcom/vkontakte/android/api/audio/AudioGet;
    .locals 3

    .prologue
    const/4 v1, 0x1

    .line 31
    const-string/jumbo v2, "shuffle"

    invoke-virtual {p0, v2, v1}, Lcom/vkontakte/android/api/audio/AudioGet;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 32
    new-instance v2, Ljava/util/Random;

    invoke-direct {v2}, Ljava/util/Random;-><init>()V

    invoke-virtual {v2}, Ljava/util/Random;->nextInt()I

    move-result v0

    .line 33
    .local v0, "shuffleSeed":I
    const-string/jumbo v2, "shuffle_seed"

    if-nez v0, :cond_0

    move v0, v1

    .end local v0    # "shuffleSeed":I
    :cond_0
    invoke-virtual {p0, v2, v0}, Lcom/vkontakte/android/api/audio/AudioGet;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 34
    return-object p0
.end method
