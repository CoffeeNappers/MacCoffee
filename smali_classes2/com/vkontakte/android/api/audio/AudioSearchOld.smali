.class public Lcom/vkontakte/android/api/audio/AudioSearchOld;
.super Lcom/vkontakte/android/api/ListAPIRequest;
.source "AudioSearchOld.java"


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
.method public constructor <init>(Ljava/lang/String;)V
    .locals 2
    .param p1, "q"    # Ljava/lang/String;

    .prologue
    .line 9
    const-string/jumbo v0, "audio.search"

    const-class v1, Lcom/vkontakte/android/audio/MusicTrack;

    invoke-direct {p0, v0, v1}, Lcom/vkontakte/android/api/ListAPIRequest;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    .line 10
    const-string/jumbo v0, "q"

    invoke-virtual {p0, v0, p1}, Lcom/vkontakte/android/api/audio/AudioSearchOld;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 11
    const-string/jumbo v0, "count"

    const/16 v1, 0xc8

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/audio/AudioSearchOld;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 12
    return-void
.end method
