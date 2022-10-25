.class final Lcom/vkontakte/android/audio/AudioFacade$4;
.super Lcom/vkontakte/android/audio/player/PlayerConnectionListener$PlayerConnectionListenerAdapter;
.source "AudioFacade.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/audio/AudioFacade;->playTracks(Ljava/util/Collection;ILcom/vkontakte/android/audio/player/PlayerRefer;ZZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$index:I

.field final synthetic val$musicTracks:Ljava/util/Collection;

.field final synthetic val$refer:Lcom/vkontakte/android/audio/player/PlayerRefer;

.field final synthetic val$reference:[Lcom/vkontakte/android/audio/player/PlayerConnection;

.field final synthetic val$shuffle:Z


# direct methods
.method constructor <init>([Lcom/vkontakte/android/audio/player/PlayerConnection;ZLjava/util/Collection;Lcom/vkontakte/android/audio/player/PlayerRefer;I)V
    .locals 0

    .prologue
    .line 352
    iput-object p1, p0, Lcom/vkontakte/android/audio/AudioFacade$4;->val$reference:[Lcom/vkontakte/android/audio/player/PlayerConnection;

    iput-boolean p2, p0, Lcom/vkontakte/android/audio/AudioFacade$4;->val$shuffle:Z

    iput-object p3, p0, Lcom/vkontakte/android/audio/AudioFacade$4;->val$musicTracks:Ljava/util/Collection;

    iput-object p4, p0, Lcom/vkontakte/android/audio/AudioFacade$4;->val$refer:Lcom/vkontakte/android/audio/player/PlayerRefer;

    iput p5, p0, Lcom/vkontakte/android/audio/AudioFacade$4;->val$index:I

    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/PlayerConnectionListener$PlayerConnectionListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onConnected()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 355
    iget-object v1, p0, Lcom/vkontakte/android/audio/AudioFacade$4;->val$reference:[Lcom/vkontakte/android/audio/player/PlayerConnection;

    aget-object v1, v1, v4

    invoke-virtual {v1}, Lcom/vkontakte/android/audio/player/PlayerConnection;->getPlayer()Lcom/vkontakte/android/audio/player/Player;

    move-result-object v0

    .line 356
    .local v0, "player":Lcom/vkontakte/android/audio/player/Player;
    if-eqz v0, :cond_0

    .line 357
    iget-boolean v1, p0, Lcom/vkontakte/android/audio/AudioFacade$4;->val$shuffle:Z

    if-eqz v1, :cond_1

    .line 358
    iget-object v1, p0, Lcom/vkontakte/android/audio/AudioFacade$4;->val$musicTracks:Ljava/util/Collection;

    iget-object v2, p0, Lcom/vkontakte/android/audio/AudioFacade$4;->val$refer:Lcom/vkontakte/android/audio/player/PlayerRefer;

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/audio/player/Player;->setTracksAndPlayShuffle(Ljava/util/Collection;Lcom/vkontakte/android/audio/player/PlayerRefer;)V

    .line 363
    :cond_0
    :goto_0
    iget-object v1, p0, Lcom/vkontakte/android/audio/AudioFacade$4;->val$reference:[Lcom/vkontakte/android/audio/player/PlayerConnection;

    aget-object v1, v1, v4

    invoke-virtual {v1}, Lcom/vkontakte/android/audio/player/PlayerConnection;->disconnect()V

    .line 364
    return-void

    .line 360
    :cond_1
    iget-object v1, p0, Lcom/vkontakte/android/audio/AudioFacade$4;->val$musicTracks:Ljava/util/Collection;

    iget v2, p0, Lcom/vkontakte/android/audio/AudioFacade$4;->val$index:I

    iget-object v3, p0, Lcom/vkontakte/android/audio/AudioFacade$4;->val$refer:Lcom/vkontakte/android/audio/player/PlayerRefer;

    invoke-virtual {v0, v1, v2, v3}, Lcom/vkontakte/android/audio/player/Player;->setTracksAndPlay(Ljava/util/Collection;ILcom/vkontakte/android/audio/player/PlayerRefer;)V

    goto :goto_0
.end method
