.class public Lcom/vkontakte/android/audio/utils/BoundServiceConnectionSyncUtil$Listener;
.super Ljava/lang/Object;
.source "BoundServiceConnectionSyncUtil.java"

# interfaces
.implements Lcom/vkontakte/android/audio/player/PlayerConnectionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/audio/utils/BoundServiceConnectionSyncUtil;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Listener"
.end annotation


# instance fields
.field private volatile isFinish:Z

.field private listener:Lcom/vkontakte/android/audio/player/PlayerConnectionListener;

.field private final syncObj:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/audio/player/PlayerConnectionListener;)V
    .locals 1
    .param p1, "listener"    # Lcom/vkontakte/android/audio/player/PlayerConnectionListener;

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/audio/utils/BoundServiceConnectionSyncUtil$Listener;->syncObj:Ljava/lang/Object;

    .line 22
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/audio/utils/BoundServiceConnectionSyncUtil$Listener;->isFinish:Z

    .line 25
    iput-object p1, p0, Lcom/vkontakte/android/audio/utils/BoundServiceConnectionSyncUtil$Listener;->listener:Lcom/vkontakte/android/audio/player/PlayerConnectionListener;

    .line 26
    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/audio/utils/BoundServiceConnectionSyncUtil$Listener;)Ljava/lang/Object;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/audio/utils/BoundServiceConnectionSyncUtil$Listener;

    .prologue
    .line 18
    iget-object v0, p0, Lcom/vkontakte/android/audio/utils/BoundServiceConnectionSyncUtil$Listener;->syncObj:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic access$100(Lcom/vkontakte/android/audio/utils/BoundServiceConnectionSyncUtil$Listener;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/audio/utils/BoundServiceConnectionSyncUtil$Listener;

    .prologue
    .line 18
    iget-boolean v0, p0, Lcom/vkontakte/android/audio/utils/BoundServiceConnectionSyncUtil$Listener;->isFinish:Z

    return v0
.end method


# virtual methods
.method public onBufferingProgress(Lcom/vkontakte/android/audio/player/TrackInfo;)V
    .locals 2
    .param p1, "trackInfo"    # Lcom/vkontakte/android/audio/player/TrackInfo;

    .prologue
    .line 69
    iget-object v1, p0, Lcom/vkontakte/android/audio/utils/BoundServiceConnectionSyncUtil$Listener;->syncObj:Ljava/lang/Object;

    monitor-enter v1

    .line 71
    :try_start_0
    iget-object v0, p0, Lcom/vkontakte/android/audio/utils/BoundServiceConnectionSyncUtil$Listener;->listener:Lcom/vkontakte/android/audio/player/PlayerConnectionListener;

    invoke-interface {v0, p1}, Lcom/vkontakte/android/audio/player/PlayerConnectionListener;->onBufferingProgress(Lcom/vkontakte/android/audio/player/TrackInfo;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 75
    :goto_0
    const/4 v0, 0x1

    :try_start_1
    iput-boolean v0, p0, Lcom/vkontakte/android/audio/utils/BoundServiceConnectionSyncUtil$Listener;->isFinish:Z

    .line 76
    iget-object v0, p0, Lcom/vkontakte/android/audio/utils/BoundServiceConnectionSyncUtil$Listener;->syncObj:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 77
    monitor-exit v1

    .line 78
    return-void

    .line 77
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    .line 72
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public onConnected()V
    .locals 2

    .prologue
    .line 95
    iget-object v1, p0, Lcom/vkontakte/android/audio/utils/BoundServiceConnectionSyncUtil$Listener;->syncObj:Ljava/lang/Object;

    monitor-enter v1

    .line 97
    :try_start_0
    iget-object v0, p0, Lcom/vkontakte/android/audio/utils/BoundServiceConnectionSyncUtil$Listener;->listener:Lcom/vkontakte/android/audio/player/PlayerConnectionListener;

    invoke-interface {v0}, Lcom/vkontakte/android/audio/player/PlayerConnectionListener;->onConnected()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 101
    :goto_0
    const/4 v0, 0x1

    :try_start_1
    iput-boolean v0, p0, Lcom/vkontakte/android/audio/utils/BoundServiceConnectionSyncUtil$Listener;->isFinish:Z

    .line 102
    iget-object v0, p0, Lcom/vkontakte/android/audio/utils/BoundServiceConnectionSyncUtil$Listener;->syncObj:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 103
    monitor-exit v1

    .line 104
    return-void

    .line 103
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    .line 98
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public onParametersChanged(Lcom/vkontakte/android/audio/player/Player;)V
    .locals 2
    .param p1, "player"    # Lcom/vkontakte/android/audio/player/Player;

    .prologue
    .line 82
    iget-object v1, p0, Lcom/vkontakte/android/audio/utils/BoundServiceConnectionSyncUtil$Listener;->syncObj:Ljava/lang/Object;

    monitor-enter v1

    .line 84
    :try_start_0
    iget-object v0, p0, Lcom/vkontakte/android/audio/utils/BoundServiceConnectionSyncUtil$Listener;->listener:Lcom/vkontakte/android/audio/player/PlayerConnectionListener;

    invoke-interface {v0, p1}, Lcom/vkontakte/android/audio/player/PlayerConnectionListener;->onParametersChanged(Lcom/vkontakte/android/audio/player/Player;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 88
    :goto_0
    const/4 v0, 0x1

    :try_start_1
    iput-boolean v0, p0, Lcom/vkontakte/android/audio/utils/BoundServiceConnectionSyncUtil$Listener;->isFinish:Z

    .line 89
    iget-object v0, p0, Lcom/vkontakte/android/audio/utils/BoundServiceConnectionSyncUtil$Listener;->syncObj:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 90
    monitor-exit v1

    .line 91
    return-void

    .line 90
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    .line 85
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public onProgress(Lcom/vkontakte/android/audio/player/TrackInfo;)V
    .locals 2
    .param p1, "trackInfo"    # Lcom/vkontakte/android/audio/player/TrackInfo;

    .prologue
    .line 56
    iget-object v1, p0, Lcom/vkontakte/android/audio/utils/BoundServiceConnectionSyncUtil$Listener;->syncObj:Ljava/lang/Object;

    monitor-enter v1

    .line 58
    :try_start_0
    iget-object v0, p0, Lcom/vkontakte/android/audio/utils/BoundServiceConnectionSyncUtil$Listener;->listener:Lcom/vkontakte/android/audio/player/PlayerConnectionListener;

    invoke-interface {v0, p1}, Lcom/vkontakte/android/audio/player/PlayerConnectionListener;->onProgress(Lcom/vkontakte/android/audio/player/TrackInfo;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 62
    :goto_0
    const/4 v0, 0x1

    :try_start_1
    iput-boolean v0, p0, Lcom/vkontakte/android/audio/utils/BoundServiceConnectionSyncUtil$Listener;->isFinish:Z

    .line 63
    iget-object v0, p0, Lcom/vkontakte/android/audio/utils/BoundServiceConnectionSyncUtil$Listener;->syncObj:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 64
    monitor-exit v1

    .line 65
    return-void

    .line 64
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    .line 59
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public onStateChanged(Lcom/vkontakte/android/audio/player/PlayerState;Lcom/vkontakte/android/audio/player/TrackInfo;)V
    .locals 2
    .param p1, "state"    # Lcom/vkontakte/android/audio/player/PlayerState;
    .param p2, "trackInfo"    # Lcom/vkontakte/android/audio/player/TrackInfo;

    .prologue
    .line 30
    iget-object v1, p0, Lcom/vkontakte/android/audio/utils/BoundServiceConnectionSyncUtil$Listener;->syncObj:Ljava/lang/Object;

    monitor-enter v1

    .line 32
    :try_start_0
    iget-object v0, p0, Lcom/vkontakte/android/audio/utils/BoundServiceConnectionSyncUtil$Listener;->listener:Lcom/vkontakte/android/audio/player/PlayerConnectionListener;

    invoke-interface {v0, p1, p2}, Lcom/vkontakte/android/audio/player/PlayerConnectionListener;->onStateChanged(Lcom/vkontakte/android/audio/player/PlayerState;Lcom/vkontakte/android/audio/player/TrackInfo;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 36
    :goto_0
    const/4 v0, 0x1

    :try_start_1
    iput-boolean v0, p0, Lcom/vkontakte/android/audio/utils/BoundServiceConnectionSyncUtil$Listener;->isFinish:Z

    .line 37
    iget-object v0, p0, Lcom/vkontakte/android/audio/utils/BoundServiceConnectionSyncUtil$Listener;->syncObj:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 38
    monitor-exit v1

    .line 39
    return-void

    .line 38
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    .line 33
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public onTrackListChanged(Ljava/util/List;)V
    .locals 2
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
    .line 43
    .local p1, "list":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/audio/player/PlayerTrack;>;"
    iget-object v1, p0, Lcom/vkontakte/android/audio/utils/BoundServiceConnectionSyncUtil$Listener;->syncObj:Ljava/lang/Object;

    monitor-enter v1

    .line 45
    :try_start_0
    iget-object v0, p0, Lcom/vkontakte/android/audio/utils/BoundServiceConnectionSyncUtil$Listener;->listener:Lcom/vkontakte/android/audio/player/PlayerConnectionListener;

    invoke-interface {v0, p1}, Lcom/vkontakte/android/audio/player/PlayerConnectionListener;->onTrackListChanged(Ljava/util/List;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 49
    :goto_0
    const/4 v0, 0x1

    :try_start_1
    iput-boolean v0, p0, Lcom/vkontakte/android/audio/utils/BoundServiceConnectionSyncUtil$Listener;->isFinish:Z

    .line 50
    iget-object v0, p0, Lcom/vkontakte/android/audio/utils/BoundServiceConnectionSyncUtil$Listener;->syncObj:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 51
    monitor-exit v1

    .line 52
    return-void

    .line 51
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    .line 46
    :catch_0
    move-exception v0

    goto :goto_0
.end method
