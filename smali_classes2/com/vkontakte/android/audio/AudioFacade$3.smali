.class final Lcom/vkontakte/android/audio/AudioFacade$3;
.super Lcom/vkontakte/android/audio/player/PlayerConnectionListener$PlayerConnectionListenerAdapter;
.source "AudioFacade.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/audio/AudioFacade;->getSavedTracks()Ljava/util/List;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$reference:[Lcom/vkontakte/android/audio/player/PlayerConnection;

.field final synthetic val$retListRef:[Ljava/util/List;


# direct methods
.method constructor <init>([Lcom/vkontakte/android/audio/player/PlayerConnection;[Ljava/util/List;)V
    .locals 0

    .prologue
    .line 173
    iput-object p1, p0, Lcom/vkontakte/android/audio/AudioFacade$3;->val$reference:[Lcom/vkontakte/android/audio/player/PlayerConnection;

    iput-object p2, p0, Lcom/vkontakte/android/audio/AudioFacade$3;->val$retListRef:[Ljava/util/List;

    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/PlayerConnectionListener$PlayerConnectionListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onConnected()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 176
    iget-object v1, p0, Lcom/vkontakte/android/audio/AudioFacade$3;->val$reference:[Lcom/vkontakte/android/audio/player/PlayerConnection;

    aget-object v1, v1, v3

    invoke-virtual {v1}, Lcom/vkontakte/android/audio/player/PlayerConnection;->getSavedTracks()Lcom/vkontakte/android/audio/player/SavedTracks;

    move-result-object v0

    .line 177
    .local v0, "savedTracks":Lcom/vkontakte/android/audio/player/SavedTracks;
    iget-object v2, p0, Lcom/vkontakte/android/audio/AudioFacade$3;->val$retListRef:[Ljava/util/List;

    if-nez v0, :cond_0

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v1

    :goto_0
    aput-object v1, v2, v3

    .line 178
    iget-object v1, p0, Lcom/vkontakte/android/audio/AudioFacade$3;->val$reference:[Lcom/vkontakte/android/audio/player/PlayerConnection;

    aget-object v1, v1, v3

    invoke-virtual {v1}, Lcom/vkontakte/android/audio/player/PlayerConnection;->disconnect()V

    .line 179
    return-void

    .line 177
    :cond_0
    invoke-virtual {v0}, Lcom/vkontakte/android/audio/player/SavedTracks;->getTracks()Ljava/util/List;

    move-result-object v1

    goto :goto_0
.end method
