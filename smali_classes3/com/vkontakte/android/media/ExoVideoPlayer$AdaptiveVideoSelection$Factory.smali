.class public final Lcom/vkontakte/android/media/ExoVideoPlayer$AdaptiveVideoSelection$Factory;
.super Ljava/lang/Object;
.source "ExoVideoPlayer.java"

# interfaces
.implements Lcom/google/android/exoplayer2/trackselection/TrackSelection$Factory;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/media/ExoVideoPlayer$AdaptiveVideoSelection;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Factory"
.end annotation


# instance fields
.field private final bandwidthMeter:Lcom/google/android/exoplayer2/upstream/DefaultBandwidthMeter;

.field private final player:Lcom/vkontakte/android/media/ExoVideoPlayer;

.field private selection:Lcom/vkontakte/android/media/ExoVideoPlayer$AdaptiveVideoSelection;


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/media/ExoVideoPlayer;Lcom/google/android/exoplayer2/upstream/DefaultBandwidthMeter;)V
    .locals 0
    .param p1, "player"    # Lcom/vkontakte/android/media/ExoVideoPlayer;
    .param p2, "bandwidthMeter"    # Lcom/google/android/exoplayer2/upstream/DefaultBandwidthMeter;

    .prologue
    .line 699
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 700
    iput-object p1, p0, Lcom/vkontakte/android/media/ExoVideoPlayer$AdaptiveVideoSelection$Factory;->player:Lcom/vkontakte/android/media/ExoVideoPlayer;

    .line 701
    iput-object p2, p0, Lcom/vkontakte/android/media/ExoVideoPlayer$AdaptiveVideoSelection$Factory;->bandwidthMeter:Lcom/google/android/exoplayer2/upstream/DefaultBandwidthMeter;

    .line 702
    return-void
.end method


# virtual methods
.method public checkVideoFormat(Lcom/google/android/exoplayer2/Format;)Z
    .locals 6
    .param p1, "format"    # Lcom/google/android/exoplayer2/Format;

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 711
    iget-object v3, p0, Lcom/vkontakte/android/media/ExoVideoPlayer$AdaptiveVideoSelection$Factory;->selection:Lcom/vkontakte/android/media/ExoVideoPlayer$AdaptiveVideoSelection;

    if-nez v3, :cond_0

    .line 712
    iget-object v3, p0, Lcom/vkontakte/android/media/ExoVideoPlayer$AdaptiveVideoSelection$Factory;->player:Lcom/vkontakte/android/media/ExoVideoPlayer;

    iget-object v3, v3, Lcom/vkontakte/android/media/ExoVideoPlayer;->context:Landroid/content/Context;

    invoke-static {v3}, Lcom/google/android/exoplayer2/util/Util;->getPhysicalDisplaySize(Landroid/content/Context;)Landroid/graphics/Point;

    move-result-object v0

    .line 713
    .local v0, "maxViewportSize":Landroid/graphics/Point;
    if-eqz p1, :cond_0

    iget v3, p1, Lcom/google/android/exoplayer2/Format;->height:I

    iget v4, p1, Lcom/google/android/exoplayer2/Format;->width:I

    mul-int/2addr v3, v4

    iget v4, v0, Landroid/graphics/Point;->x:I

    iget v5, v0, Landroid/graphics/Point;->y:I

    mul-int/2addr v4, v5

    if-le v3, v4, :cond_0

    .line 714
    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {}, Lcom/vkontakte/android/media/ExoVideoPlayer;->access$700()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v1

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "incorrect format "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p1}, Lcom/google/android/exoplayer2/Format;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, " max "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, v0, Landroid/graphics/Point;->y:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "x"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, v0, Landroid/graphics/Point;->x:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v2

    invoke-static {v3}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    .line 718
    .end local v0    # "maxViewportSize":Landroid/graphics/Point;
    :goto_0
    return v1

    :cond_0
    move v1, v2

    goto :goto_0
.end method

.method public varargs createTrackSelection(Lcom/google/android/exoplayer2/source/TrackGroup;[I)Lcom/google/android/exoplayer2/trackselection/TrackSelection;
    .locals 3
    .param p1, "group"    # Lcom/google/android/exoplayer2/source/TrackGroup;
    .param p2, "tracks"    # [I

    .prologue
    .line 706
    new-instance v0, Lcom/vkontakte/android/media/ExoVideoPlayer$AdaptiveVideoSelection;

    iget-object v1, p0, Lcom/vkontakte/android/media/ExoVideoPlayer$AdaptiveVideoSelection$Factory;->player:Lcom/vkontakte/android/media/ExoVideoPlayer;

    iget-object v2, p0, Lcom/vkontakte/android/media/ExoVideoPlayer$AdaptiveVideoSelection$Factory;->bandwidthMeter:Lcom/google/android/exoplayer2/upstream/DefaultBandwidthMeter;

    invoke-direct {v0, p1, p2, v1, v2}, Lcom/vkontakte/android/media/ExoVideoPlayer$AdaptiveVideoSelection;-><init>(Lcom/google/android/exoplayer2/source/TrackGroup;[ILcom/vkontakte/android/media/ExoVideoPlayer;Lcom/google/android/exoplayer2/upstream/BandwidthMeter;)V

    iput-object v0, p0, Lcom/vkontakte/android/media/ExoVideoPlayer$AdaptiveVideoSelection$Factory;->selection:Lcom/vkontakte/android/media/ExoVideoPlayer$AdaptiveVideoSelection;

    .line 707
    iget-object v0, p0, Lcom/vkontakte/android/media/ExoVideoPlayer$AdaptiveVideoSelection$Factory;->selection:Lcom/vkontakte/android/media/ExoVideoPlayer$AdaptiveVideoSelection;

    return-object v0
.end method

.method public getSelection()Lcom/vkontakte/android/media/ExoVideoPlayer$AdaptiveVideoSelection;
    .locals 1

    .prologue
    .line 722
    iget-object v0, p0, Lcom/vkontakte/android/media/ExoVideoPlayer$AdaptiveVideoSelection$Factory;->selection:Lcom/vkontakte/android/media/ExoVideoPlayer$AdaptiveVideoSelection;

    return-object v0
.end method
