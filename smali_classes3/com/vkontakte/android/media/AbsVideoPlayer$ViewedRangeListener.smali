.class Lcom/vkontakte/android/media/AbsVideoPlayer$ViewedRangeListener;
.super Ljava/lang/Object;
.source "AbsVideoPlayer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/media/AbsVideoPlayer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "ViewedRangeListener"
.end annotation


# instance fields
.field private isSeeking:Z


# direct methods
.method constructor <init>(IILjava/lang/String;)V
    .locals 1
    .param p1, "videoId"    # I
    .param p2, "ownerId"    # I
    .param p3, "referrer"    # Ljava/lang/String;

    .prologue
    .line 153
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 154
    sget-object v0, Lcom/vkontakte/android/data/Analytics;->videoViewedSegments:Lcom/vkontakte/android/media/ViewedSegments;

    invoke-virtual {v0, p1, p2, p3}, Lcom/vkontakte/android/media/ViewedSegments;->setCurrentVideo(IILjava/lang/String;)V

    .line 155
    return-void
.end method


# virtual methods
.method closeCurrentRange()V
    .locals 1

    .prologue
    .line 168
    sget-object v0, Lcom/vkontakte/android/data/Analytics;->videoViewedSegments:Lcom/vkontakte/android/media/ViewedSegments;

    invoke-virtual {v0}, Lcom/vkontakte/android/media/ViewedSegments;->closeCurrentRange()V

    .line 169
    return-void
.end method

.method sendViewedRanges()V
    .locals 1

    .prologue
    .line 172
    sget-object v0, Lcom/vkontakte/android/data/Analytics;->videoViewedSegments:Lcom/vkontakte/android/media/ViewedSegments;

    invoke-virtual {v0}, Lcom/vkontakte/android/media/ViewedSegments;->sendViewedRanges()V

    .line 173
    return-void
.end method

.method public setSeeking(Z)V
    .locals 0
    .param p1, "seeking"    # Z

    .prologue
    .line 158
    iput-boolean p1, p0, Lcom/vkontakte/android/media/AbsVideoPlayer$ViewedRangeListener;->isSeeking:Z

    .line 159
    return-void
.end method

.method updateCurrentRange(I)V
    .locals 2
    .param p1, "msec"    # I

    .prologue
    .line 162
    iget-boolean v0, p0, Lcom/vkontakte/android/media/AbsVideoPlayer$ViewedRangeListener;->isSeeking:Z

    if-nez v0, :cond_0

    .line 163
    sget-object v0, Lcom/vkontakte/android/data/Analytics;->videoViewedSegments:Lcom/vkontakte/android/media/ViewedSegments;

    div-int/lit16 v1, p1, 0x3e8

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/media/ViewedSegments;->updateCurrentRange(I)V

    .line 165
    :cond_0
    return-void
.end method
