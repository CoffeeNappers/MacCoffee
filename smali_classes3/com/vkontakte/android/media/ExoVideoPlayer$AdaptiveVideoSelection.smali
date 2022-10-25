.class Lcom/vkontakte/android/media/ExoVideoPlayer$AdaptiveVideoSelection;
.super Lcom/google/android/exoplayer2/trackselection/AdaptiveVideoTrackSelection;
.source "ExoVideoPlayer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/media/ExoVideoPlayer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "AdaptiveVideoSelection"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/media/ExoVideoPlayer$AdaptiveVideoSelection$Factory;
    }
.end annotation


# static fields
.field private static final DEFAULT_INDEX:I = -0x1


# instance fields
.field private hasIncorrectResolution:Z

.field private isResolutionChecked:Z

.field private maxResolution:I

.field private final player:Lcom/vkontakte/android/media/ExoVideoPlayer;

.field private selectedIndexAdaptive:I


# direct methods
.method public constructor <init>(Lcom/google/android/exoplayer2/source/TrackGroup;[ILcom/vkontakte/android/media/ExoVideoPlayer;Lcom/google/android/exoplayer2/upstream/BandwidthMeter;)V
    .locals 15
    .param p1, "group"    # Lcom/google/android/exoplayer2/source/TrackGroup;
    .param p2, "tracks"    # [I
    .param p3, "player"    # Lcom/vkontakte/android/media/ExoVideoPlayer;
    .param p4, "bandwidthMeter"    # Lcom/google/android/exoplayer2/upstream/BandwidthMeter;

    .prologue
    .line 728
    const v7, 0xc3500

    const-wide/16 v8, 0x2710

    const-wide/16 v10, 0x61a8

    const-wide/16 v12, 0x61a8

    const/high16 v14, 0x3f400000    # 0.75f

    move-object v3, p0

    move-object/from16 v4, p1

    move-object/from16 v5, p2

    move-object/from16 v6, p4

    invoke-direct/range {v3 .. v14}, Lcom/google/android/exoplayer2/trackselection/AdaptiveVideoTrackSelection;-><init>(Lcom/google/android/exoplayer2/source/TrackGroup;[ILcom/google/android/exoplayer2/upstream/BandwidthMeter;IJJJF)V

    .line 689
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/vkontakte/android/media/ExoVideoPlayer$AdaptiveVideoSelection;->isResolutionChecked:Z

    .line 690
    const/4 v2, -0x1

    iput v2, p0, Lcom/vkontakte/android/media/ExoVideoPlayer$AdaptiveVideoSelection;->selectedIndexAdaptive:I

    .line 691
    const/4 v2, 0x0

    iput v2, p0, Lcom/vkontakte/android/media/ExoVideoPlayer$AdaptiveVideoSelection;->maxResolution:I

    .line 692
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/vkontakte/android/media/ExoVideoPlayer$AdaptiveVideoSelection;->hasIncorrectResolution:Z

    .line 734
    move-object/from16 v0, p3

    iput-object v0, p0, Lcom/vkontakte/android/media/ExoVideoPlayer$AdaptiveVideoSelection;->player:Lcom/vkontakte/android/media/ExoVideoPlayer;

    .line 735
    return-void
.end method

.method private filterFormatByOrientation()V
    .locals 11

    .prologue
    .line 815
    iget-object v9, p0, Lcom/vkontakte/android/media/ExoVideoPlayer$AdaptiveVideoSelection;->player:Lcom/vkontakte/android/media/ExoVideoPlayer;

    iget-object v9, v9, Lcom/vkontakte/android/media/ExoVideoPlayer;->context:Landroid/content/Context;

    invoke-static {v9}, Lcom/google/android/exoplayer2/util/Util;->getPhysicalDisplaySize(Landroid/content/Context;)Landroid/graphics/Point;

    move-result-object v3

    .line 816
    .local v3, "maxViewportSize":Landroid/graphics/Point;
    const/4 v2, -0x1

    .line 817
    .local v2, "index":I
    iget v9, v3, Landroid/graphics/Point;->x:I

    iget v10, v3, Landroid/graphics/Point;->y:I

    if-ge v9, v10, :cond_1

    .line 820
    invoke-super {p0}, Lcom/google/android/exoplayer2/trackselection/AdaptiveVideoTrackSelection;->getSelectedIndex()I

    move-result v8

    .line 821
    .local v8, "selectedIndex":I
    invoke-virtual {p0, v8}, Lcom/vkontakte/android/media/ExoVideoPlayer$AdaptiveVideoSelection;->getFormat(I)Lcom/google/android/exoplayer2/Format;

    move-result-object v5

    .line 822
    .local v5, "selected":Lcom/google/android/exoplayer2/Format;
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v6

    .line 824
    .local v6, "nowMs":J
    const/4 v1, 0x1

    .local v1, "i":I
    :goto_0
    invoke-virtual {p0}, Lcom/vkontakte/android/media/ExoVideoPlayer$AdaptiveVideoSelection;->length()I

    move-result v9

    if-ge v1, v9, :cond_0

    .line 825
    invoke-virtual {p0, v1}, Lcom/vkontakte/android/media/ExoVideoPlayer$AdaptiveVideoSelection;->getFormat(I)Lcom/google/android/exoplayer2/Format;

    move-result-object v0

    .line 826
    .local v0, "format":Lcom/google/android/exoplayer2/Format;
    iget v9, v5, Lcom/google/android/exoplayer2/Format;->bitrate:I

    iget v10, v0, Lcom/google/android/exoplayer2/Format;->bitrate:I

    if-le v9, v10, :cond_2

    iget v9, v0, Lcom/google/android/exoplayer2/Format;->width:I

    iget v10, v3, Landroid/graphics/Point;->x:I

    if-ge v9, v10, :cond_2

    .line 827
    invoke-virtual {p0, v1, v6, v7}, Lcom/vkontakte/android/media/ExoVideoPlayer$AdaptiveVideoSelection;->isBlacklisted(IJ)Z

    move-result v9

    if-nez v9, :cond_2

    .line 828
    add-int/lit8 v4, v1, -0x1

    .line 829
    .local v4, "newIndex":I
    if-eq v4, v8, :cond_0

    .line 830
    move v2, v4

    .line 836
    .end local v0    # "format":Lcom/google/android/exoplayer2/Format;
    .end local v4    # "newIndex":I
    :cond_0
    iput v2, p0, Lcom/vkontakte/android/media/ExoVideoPlayer$AdaptiveVideoSelection;->selectedIndexAdaptive:I

    .line 838
    .end local v1    # "i":I
    .end local v5    # "selected":Lcom/google/android/exoplayer2/Format;
    .end local v6    # "nowMs":J
    .end local v8    # "selectedIndex":I
    :cond_1
    return-void

    .line 824
    .restart local v0    # "format":Lcom/google/android/exoplayer2/Format;
    .restart local v1    # "i":I
    .restart local v5    # "selected":Lcom/google/android/exoplayer2/Format;
    .restart local v6    # "nowMs":J
    .restart local v8    # "selectedIndex":I
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method private filterFormats()V
    .locals 12

    .prologue
    const/4 v9, 0x0

    const/4 v8, 0x1

    .line 793
    iget-object v7, p0, Lcom/vkontakte/android/media/ExoVideoPlayer$AdaptiveVideoSelection;->player:Lcom/vkontakte/android/media/ExoVideoPlayer;

    iget-object v7, v7, Lcom/vkontakte/android/media/ExoVideoPlayer;->context:Landroid/content/Context;

    invoke-static {v7}, Lcom/google/android/exoplayer2/util/Util;->getPhysicalDisplaySize(Landroid/content/Context;)Landroid/graphics/Point;

    move-result-object v5

    .line 794
    .local v5, "maxViewportSize":Landroid/graphics/Point;
    iget v7, v5, Landroid/graphics/Point;->x:I

    iget v10, v5, Landroid/graphics/Point;->y:I

    mul-int/2addr v7, v10

    iput v7, p0, Lcom/vkontakte/android/media/ExoVideoPlayer$AdaptiveVideoSelection;->maxResolution:I

    .line 795
    invoke-virtual {p0}, Lcom/vkontakte/android/media/ExoVideoPlayer$AdaptiveVideoSelection;->length()I

    move-result v4

    .line 796
    .local v4, "length":I
    const/4 v0, 0x0

    .line 797
    .local v0, "blacklisted":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    if-ge v3, v4, :cond_0

    iget v7, p0, Lcom/vkontakte/android/media/ExoVideoPlayer$AdaptiveVideoSelection;->maxResolution:I

    if-lez v7, :cond_0

    .line 798
    invoke-virtual {p0, v3}, Lcom/vkontakte/android/media/ExoVideoPlayer$AdaptiveVideoSelection;->getFormat(I)Lcom/google/android/exoplayer2/Format;

    move-result-object v2

    .line 799
    .local v2, "format":Lcom/google/android/exoplayer2/Format;
    iget v7, v2, Lcom/google/android/exoplayer2/Format;->width:I

    iget v10, v2, Lcom/google/android/exoplayer2/Format;->height:I

    mul-int v6, v7, v10

    .line 800
    .local v6, "resolution":I
    iget v7, p0, Lcom/vkontakte/android/media/ExoVideoPlayer$AdaptiveVideoSelection;->maxResolution:I

    if-le v6, v7, :cond_1

    move v1, v8

    .line 801
    .local v1, "disable":Z
    :goto_1
    if-eqz v1, :cond_2

    .line 802
    const-wide/32 v10, 0x7fffffff

    invoke-virtual {p0, v3, v10, v11}, Lcom/vkontakte/android/media/ExoVideoPlayer$AdaptiveVideoSelection;->blacklist(IJ)Z

    .line 803
    add-int/lit8 v0, v0, 0x1

    .line 805
    sub-int v7, v4, v0

    if-ne v7, v8, :cond_2

    .line 812
    .end local v1    # "disable":Z
    .end local v2    # "format":Lcom/google/android/exoplayer2/Format;
    .end local v6    # "resolution":I
    :cond_0
    return-void

    .restart local v2    # "format":Lcom/google/android/exoplayer2/Format;
    .restart local v6    # "resolution":I
    :cond_1
    move v1, v9

    .line 800
    goto :goto_1

    .line 809
    .restart local v1    # "disable":Z
    :cond_2
    const/4 v7, 0x2

    new-array v10, v7, [Ljava/lang/Object;

    invoke-static {}, Lcom/vkontakte/android/media/ExoVideoPlayer;->access$700()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v10, v9

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    if-eqz v1, :cond_3

    const-string/jumbo v7, "disable"

    :goto_2
    invoke-virtual {v11, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v11, " format "

    invoke-virtual {v7, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    .line 810
    invoke-virtual {v2}, Lcom/google/android/exoplayer2/Format;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v7, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v11, " max "

    invoke-virtual {v7, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget v11, v5, Landroid/graphics/Point;->x:I

    invoke-virtual {v7, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v11, "x"

    invoke-virtual {v7, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget v11, v5, Landroid/graphics/Point;->y:I

    invoke-virtual {v7, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v10, v8

    .line 809
    invoke-static {v10}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    .line 797
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 809
    :cond_3
    const-string/jumbo v7, "enable"

    goto :goto_2
.end method

.method private findResolution(II)Z
    .locals 4
    .param p1, "width"    # I
    .param p2, "height"    # I

    .prologue
    .line 780
    invoke-virtual {p0}, Lcom/vkontakte/android/media/ExoVideoPlayer$AdaptiveVideoSelection;->getTrackGroup()Lcom/google/android/exoplayer2/source/TrackGroup;

    move-result-object v2

    .line 781
    .local v2, "videoFormats":Lcom/google/android/exoplayer2/source/TrackGroup;
    if-eqz v2, :cond_1

    .line 782
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget v3, v2, Lcom/google/android/exoplayer2/source/TrackGroup;->length:I

    if-ge v1, v3, :cond_1

    .line 783
    invoke-virtual {v2, v1}, Lcom/google/android/exoplayer2/source/TrackGroup;->getFormat(I)Lcom/google/android/exoplayer2/Format;

    move-result-object v0

    .line 784
    .local v0, "f":Lcom/google/android/exoplayer2/Format;
    iget v3, v0, Lcom/google/android/exoplayer2/Format;->height:I

    if-ne v3, p2, :cond_0

    iget v3, v0, Lcom/google/android/exoplayer2/Format;->width:I

    if-ne v3, p1, :cond_0

    .line 785
    const/4 v3, 0x1

    .line 789
    .end local v0    # "f":Lcom/google/android/exoplayer2/Format;
    .end local v1    # "i":I
    :goto_1
    return v3

    .line 782
    .restart local v0    # "f":Lcom/google/android/exoplayer2/Format;
    .restart local v1    # "i":I
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 789
    .end local v0    # "f":Lcom/google/android/exoplayer2/Format;
    .end local v1    # "i":I
    :cond_1
    const/4 v3, 0x0

    goto :goto_1
.end method


# virtual methods
.method public checkVideoFormat(Lcom/google/android/exoplayer2/Format;)V
    .locals 10
    .param p1, "format"    # Lcom/google/android/exoplayer2/Format;

    .prologue
    const-wide/32 v8, 0x7fffffff

    const/4 v7, 0x1

    .line 738
    if-eqz p1, :cond_0

    iget-boolean v5, p0, Lcom/vkontakte/android/media/ExoVideoPlayer$AdaptiveVideoSelection;->hasIncorrectResolution:Z

    if-nez v5, :cond_0

    iget v5, p0, Lcom/vkontakte/android/media/ExoVideoPlayer$AdaptiveVideoSelection;->maxResolution:I

    if-eqz v5, :cond_0

    invoke-virtual {p0}, Lcom/vkontakte/android/media/ExoVideoPlayer$AdaptiveVideoSelection;->length()I

    move-result v5

    if-ne v5, v7, :cond_1

    .line 762
    :cond_0
    :goto_0
    return-void

    .line 742
    :cond_1
    iget v4, p1, Lcom/google/android/exoplayer2/Format;->width:I

    .line 743
    .local v4, "width":I
    iget v1, p1, Lcom/google/android/exoplayer2/Format;->height:I

    .line 745
    .local v1, "height":I
    invoke-virtual {p0}, Lcom/vkontakte/android/media/ExoVideoPlayer$AdaptiveVideoSelection;->getSelectedIndex()I

    move-result v2

    .line 746
    .local v2, "index":I
    invoke-virtual {p0, v2}, Lcom/vkontakte/android/media/ExoVideoPlayer$AdaptiveVideoSelection;->getFormat(I)Lcom/google/android/exoplayer2/Format;

    move-result-object v3

    .line 747
    .local v3, "selected":Lcom/google/android/exoplayer2/Format;
    iget v5, v3, Lcom/google/android/exoplayer2/Format;->width:I

    if-eq v5, v4, :cond_0

    iget v5, v3, Lcom/google/android/exoplayer2/Format;->height:I

    if-eq v5, v1, :cond_0

    .line 748
    invoke-direct {p0, v4, v1}, Lcom/vkontakte/android/media/ExoVideoPlayer$AdaptiveVideoSelection;->findResolution(II)Z

    move-result v5

    if-nez v5, :cond_0

    .line 749
    iput-boolean v7, p0, Lcom/vkontakte/android/media/ExoVideoPlayer$AdaptiveVideoSelection;->hasIncorrectResolution:Z

    .line 750
    const/4 v5, 0x0

    invoke-virtual {p0, v5, v8, v9}, Lcom/vkontakte/android/media/ExoVideoPlayer$AdaptiveVideoSelection;->blacklist(IJ)Z

    .line 751
    invoke-virtual {p0}, Lcom/vkontakte/android/media/ExoVideoPlayer$AdaptiveVideoSelection;->length()I

    move-result v5

    const/4 v6, 0x2

    if-le v5, v6, :cond_2

    .line 752
    invoke-virtual {p0, v7, v8, v9}, Lcom/vkontakte/android/media/ExoVideoPlayer$AdaptiveVideoSelection;->blacklist(IJ)Z

    .line 755
    :cond_2
    invoke-static {}, Lcom/vk/analytics/Analytics;->isEnabled()Z

    move-result v5

    if-eqz v5, :cond_0

    iget-object v5, p0, Lcom/vkontakte/android/media/ExoVideoPlayer$AdaptiveVideoSelection;->player:Lcom/vkontakte/android/media/ExoVideoPlayer;

    if-eqz v5, :cond_0

    .line 756
    new-instance v0, Lcom/vk/analytics/AnalyticsEvent$MediaVideoStreamEvent;

    iget-object v5, p0, Lcom/vkontakte/android/media/ExoVideoPlayer$AdaptiveVideoSelection;->player:Lcom/vkontakte/android/media/ExoVideoPlayer;

    iget-object v5, v5, Lcom/vkontakte/android/media/ExoVideoPlayer;->mFile:Lcom/vkontakte/android/api/VideoFile;

    iget v5, v5, Lcom/vkontakte/android/api/VideoFile;->oid:I

    iget-object v6, p0, Lcom/vkontakte/android/media/ExoVideoPlayer$AdaptiveVideoSelection;->player:Lcom/vkontakte/android/media/ExoVideoPlayer;

    iget-object v6, v6, Lcom/vkontakte/android/media/ExoVideoPlayer;->mFile:Lcom/vkontakte/android/api/VideoFile;

    iget v6, v6, Lcom/vkontakte/android/api/VideoFile;->vid:I

    invoke-direct {v0, v5, v6}, Lcom/vk/analytics/AnalyticsEvent$MediaVideoStreamEvent;-><init>(II)V

    .line 758
    .local v0, "event":Lcom/vk/analytics/AnalyticsEvent$MediaVideoStreamEvent;
    invoke-static {v0}, Lcom/vk/analytics/Analytics;->log(Lcom/vk/analytics/AnalyticsEvent;)V

    goto :goto_0
.end method

.method public getSelectedIndex()I
    .locals 2

    .prologue
    .line 766
    iget v0, p0, Lcom/vkontakte/android/media/ExoVideoPlayer$AdaptiveVideoSelection;->selectedIndexAdaptive:I

    const/4 v1, -0x1

    if-le v0, v1, :cond_0

    iget v0, p0, Lcom/vkontakte/android/media/ExoVideoPlayer$AdaptiveVideoSelection;->selectedIndexAdaptive:I

    :goto_0
    return v0

    :cond_0
    invoke-super {p0}, Lcom/google/android/exoplayer2/trackselection/AdaptiveVideoTrackSelection;->getSelectedIndex()I

    move-result v0

    goto :goto_0
.end method

.method public updateSelectedTrack(J)V
    .locals 1
    .param p1, "bufferedDurationUs"    # J

    .prologue
    .line 771
    iget-boolean v0, p0, Lcom/vkontakte/android/media/ExoVideoPlayer$AdaptiveVideoSelection;->isResolutionChecked:Z

    if-nez v0, :cond_0

    .line 772
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/media/ExoVideoPlayer$AdaptiveVideoSelection;->isResolutionChecked:Z

    .line 773
    invoke-direct {p0}, Lcom/vkontakte/android/media/ExoVideoPlayer$AdaptiveVideoSelection;->filterFormats()V

    .line 775
    :cond_0
    invoke-super {p0, p1, p2}, Lcom/google/android/exoplayer2/trackselection/AdaptiveVideoTrackSelection;->updateSelectedTrack(J)V

    .line 776
    invoke-direct {p0}, Lcom/vkontakte/android/media/ExoVideoPlayer$AdaptiveVideoSelection;->filterFormatByOrientation()V

    .line 777
    return-void
.end method
