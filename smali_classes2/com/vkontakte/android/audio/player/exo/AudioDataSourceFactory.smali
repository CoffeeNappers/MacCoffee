.class public final Lcom/vkontakte/android/audio/player/exo/AudioDataSourceFactory;
.super Ljava/lang/Object;
.source "AudioDataSourceFactory.java"

# interfaces
.implements Lcom/google/android/exoplayer2/upstream/DataSource$Factory;


# instance fields
.field private final baseDataSourceFactory:Lcom/google/android/exoplayer2/upstream/DataSource$Factory;

.field private final context:Landroid/content/Context;

.field private final listener:Lcom/google/android/exoplayer2/upstream/TransferListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/exoplayer2/upstream/TransferListener",
            "<-",
            "Lcom/google/android/exoplayer2/upstream/DataSource;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/google/android/exoplayer2/upstream/TransferListener;Lcom/google/android/exoplayer2/upstream/DataSource$Factory;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p3, "baseDataSourceFactory"    # Lcom/google/android/exoplayer2/upstream/DataSource$Factory;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/google/android/exoplayer2/upstream/TransferListener",
            "<-",
            "Lcom/google/android/exoplayer2/upstream/DataSource;",
            ">;",
            "Lcom/google/android/exoplayer2/upstream/DataSource$Factory;",
            ")V"
        }
    .end annotation

    .prologue
    .line 16
    .local p2, "listener":Lcom/google/android/exoplayer2/upstream/TransferListener;, "Lcom/google/android/exoplayer2/upstream/TransferListener<-Lcom/google/android/exoplayer2/upstream/DataSource;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/audio/player/exo/AudioDataSourceFactory;->context:Landroid/content/Context;

    .line 18
    iput-object p2, p0, Lcom/vkontakte/android/audio/player/exo/AudioDataSourceFactory;->listener:Lcom/google/android/exoplayer2/upstream/TransferListener;

    .line 19
    iput-object p3, p0, Lcom/vkontakte/android/audio/player/exo/AudioDataSourceFactory;->baseDataSourceFactory:Lcom/google/android/exoplayer2/upstream/DataSource$Factory;

    .line 20
    return-void
.end method


# virtual methods
.method public bridge synthetic createDataSource()Lcom/google/android/exoplayer2/upstream/DataSource;
    .locals 1

    .prologue
    .line 9
    invoke-virtual {p0}, Lcom/vkontakte/android/audio/player/exo/AudioDataSourceFactory;->createDataSource()Lcom/vkontakte/android/audio/player/exo/AudioDataSource;

    move-result-object v0

    return-object v0
.end method

.method public createDataSource()Lcom/vkontakte/android/audio/player/exo/AudioDataSource;
    .locals 4

    .prologue
    .line 24
    new-instance v0, Lcom/vkontakte/android/audio/player/exo/AudioDataSource;

    iget-object v1, p0, Lcom/vkontakte/android/audio/player/exo/AudioDataSourceFactory;->context:Landroid/content/Context;

    iget-object v2, p0, Lcom/vkontakte/android/audio/player/exo/AudioDataSourceFactory;->listener:Lcom/google/android/exoplayer2/upstream/TransferListener;

    iget-object v3, p0, Lcom/vkontakte/android/audio/player/exo/AudioDataSourceFactory;->baseDataSourceFactory:Lcom/google/android/exoplayer2/upstream/DataSource$Factory;

    invoke-interface {v3}, Lcom/google/android/exoplayer2/upstream/DataSource$Factory;->createDataSource()Lcom/google/android/exoplayer2/upstream/DataSource;

    move-result-object v3

    invoke-direct {v0, v1, v2, v3}, Lcom/vkontakte/android/audio/player/exo/AudioDataSource;-><init>(Landroid/content/Context;Lcom/google/android/exoplayer2/upstream/TransferListener;Lcom/google/android/exoplayer2/upstream/DataSource;)V

    return-object v0
.end method
