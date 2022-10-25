.class final Lcom/vkontakte/android/audio/AudioFacade$2;
.super Lcom/vkontakte/android/audio/player/PlayerConnectionListener$PlayerConnectionListenerAdapter;
.source "AudioFacade.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/audio/AudioFacade;->startDownloadTracks(Ljava/util/Collection;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$reference:[Lcom/vkontakte/android/audio/player/PlayerConnection;

.field final synthetic val$showNotification:Z

.field final synthetic val$tracks:Ljava/util/Collection;


# direct methods
.method constructor <init>([Lcom/vkontakte/android/audio/player/PlayerConnection;Ljava/util/Collection;Z)V
    .locals 0

    .prologue
    .line 115
    iput-object p1, p0, Lcom/vkontakte/android/audio/AudioFacade$2;->val$reference:[Lcom/vkontakte/android/audio/player/PlayerConnection;

    iput-object p2, p0, Lcom/vkontakte/android/audio/AudioFacade$2;->val$tracks:Ljava/util/Collection;

    iput-boolean p3, p0, Lcom/vkontakte/android/audio/AudioFacade$2;->val$showNotification:Z

    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/PlayerConnectionListener$PlayerConnectionListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onConnected()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 118
    iget-object v1, p0, Lcom/vkontakte/android/audio/AudioFacade$2;->val$reference:[Lcom/vkontakte/android/audio/player/PlayerConnection;

    aget-object v1, v1, v3

    invoke-virtual {v1}, Lcom/vkontakte/android/audio/player/PlayerConnection;->getSavedTracks()Lcom/vkontakte/android/audio/player/SavedTracks;

    move-result-object v0

    .line 119
    .local v0, "savedTracks":Lcom/vkontakte/android/audio/player/SavedTracks;
    if-eqz v0, :cond_0

    .line 120
    iget-object v1, p0, Lcom/vkontakte/android/audio/AudioFacade$2;->val$tracks:Ljava/util/Collection;

    iget-boolean v2, p0, Lcom/vkontakte/android/audio/AudioFacade$2;->val$showNotification:Z

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/audio/player/SavedTracks;->downloadTracks(Ljava/util/Collection;Z)V

    .line 122
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/audio/AudioFacade$2;->val$reference:[Lcom/vkontakte/android/audio/player/PlayerConnection;

    aget-object v1, v1, v3

    invoke-virtual {v1}, Lcom/vkontakte/android/audio/player/PlayerConnection;->disconnect()V

    .line 123
    return-void
.end method
