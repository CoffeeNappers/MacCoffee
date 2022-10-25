.class public Lcom/vkontakte/android/api/audio/AudioGetRecommendations;
.super Lcom/vkontakte/android/api/ListAPIRequest;
.source "AudioGetRecommendations.java"


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
    .param p1, "uid"    # I

    .prologue
    .line 9
    const-string/jumbo v0, "audio.getRecommendations"

    const-class v1, Lcom/vkontakte/android/audio/MusicTrack;

    invoke-direct {p0, v0, v1}, Lcom/vkontakte/android/api/ListAPIRequest;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    .line 10
    const-string/jumbo v0, "user_id"

    invoke-virtual {p0, v0, p1}, Lcom/vkontakte/android/api/audio/AudioGetRecommendations;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 11
    const-string/jumbo v0, "count"

    const/16 v1, 0xc8

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/audio/AudioGetRecommendations;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 12
    return-void
.end method

.method public constructor <init>(ILjava/lang/String;)V
    .locals 2
    .param p1, "count"    # I
    .param p2, "targetMid"    # Ljava/lang/String;

    .prologue
    .line 15
    const-string/jumbo v0, "audio.getRecommendations"

    const-class v1, Lcom/vkontakte/android/audio/MusicTrack;

    invoke-direct {p0, v0, v1}, Lcom/vkontakte/android/api/ListAPIRequest;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    .line 16
    const-string/jumbo v0, "count"

    invoke-virtual {p0, v0, p1}, Lcom/vkontakte/android/api/audio/AudioGetRecommendations;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 17
    const-string/jumbo v0, "target_audio"

    invoke-virtual {p0, v0, p2}, Lcom/vkontakte/android/api/audio/AudioGetRecommendations;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 18
    return-void
.end method
