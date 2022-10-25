.class public Lcom/vkontakte/android/audio/player/PlayerListener$PlayerListenerAdapter;
.super Ljava/lang/Object;
.source "PlayerListener.java"

# interfaces
.implements Lcom/vkontakte/android/audio/player/PlayerListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/audio/player/PlayerListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "PlayerListenerAdapter"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onBufferingProgress(Lcom/vkontakte/android/audio/player/TrackInfo;)V
    .locals 0
    .param p1, "trackInfo"    # Lcom/vkontakte/android/audio/player/TrackInfo;

    .prologue
    .line 56
    return-void
.end method

.method public onParametersChanged(Lcom/vkontakte/android/audio/player/Player;)V
    .locals 0
    .param p1, "player"    # Lcom/vkontakte/android/audio/player/Player;

    .prologue
    .line 60
    return-void
.end method

.method public onProgress(Lcom/vkontakte/android/audio/player/TrackInfo;)V
    .locals 0
    .param p1, "trackInfo"    # Lcom/vkontakte/android/audio/player/TrackInfo;

    .prologue
    .line 52
    return-void
.end method

.method public onStateChanged(Lcom/vkontakte/android/audio/player/PlayerState;Lcom/vkontakte/android/audio/player/TrackInfo;)V
    .locals 0
    .param p1, "state"    # Lcom/vkontakte/android/audio/player/PlayerState;
    .param p2, "trackInfo"    # Lcom/vkontakte/android/audio/player/TrackInfo;

    .prologue
    .line 44
    return-void
.end method

.method public onTrackListChanged(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/audio/player/PlayerTrack;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 48
    .local p1, "list":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/audio/player/PlayerTrack;>;"
    return-void
.end method
