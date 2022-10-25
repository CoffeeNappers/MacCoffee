.class public Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;
.super Lcom/google/android/exoplayer2/mediacodec/MediaCodecRenderer;
.source "MediaCodecVideoRenderer.java"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x10
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer$OnFrameRenderedListenerV23;,
        Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer$CodecMaxValues;
    }
.end annotation


# static fields
.field private static final KEY_CROP_BOTTOM:Ljava/lang/String; = "crop-bottom"

.field private static final KEY_CROP_LEFT:Ljava/lang/String; = "crop-left"

.field private static final KEY_CROP_RIGHT:Ljava/lang/String; = "crop-right"

.field private static final KEY_CROP_TOP:Ljava/lang/String; = "crop-top"

.field private static final STANDARD_LONG_EDGE_VIDEO_PX:[I

.field private static final TAG:Ljava/lang/String; = "MediaCodecVideoRenderer"


# instance fields
.field private final allowedJoiningTimeMs:J

.field private codecMaxValues:Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer$CodecMaxValues;

.field private consecutiveDroppedFrameCount:I

.field private currentHeight:I

.field private currentPixelWidthHeightRatio:F

.field private currentUnappliedRotationDegrees:I

.field private currentWidth:I

.field private final deviceNeedsAutoFrcWorkaround:Z

.field private droppedFrameAccumulationStartTimeMs:J

.field private droppedFrames:I

.field private final eventDispatcher:Lcom/google/android/exoplayer2/video/VideoRendererEventListener$EventDispatcher;

.field private final frameReleaseTimeHelper:Lcom/google/android/exoplayer2/video/VideoFrameReleaseTimeHelper;

.field private joiningDeadlineMs:J

.field private lastReportedHeight:I

.field private lastReportedPixelWidthHeightRatio:F

.field private lastReportedUnappliedRotationDegrees:I

.field private lastReportedWidth:I

.field private final maxDroppedFramesToNotify:I

.field private pendingPixelWidthHeightRatio:F

.field private pendingRotationDegrees:I

.field private renderedFirstFrame:Z

.field private scalingMode:I

.field private streamFormats:[Lcom/google/android/exoplayer2/Format;

.field private surface:Landroid/view/Surface;

.field private tunneling:Z

.field private tunnelingAudioSessionId:I

.field tunnelingOnFrameRenderedListener:Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer$OnFrameRenderedListenerV23;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 61
    const/16 v0, 0x9

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->STANDARD_LONG_EDGE_VIDEO_PX:[I

    return-void

    :array_0
    .array-data 4
        0x780
        0x640
        0x5a0
        0x500
        0x3c0
        0x356
        0x280
        0x21c
        0x1e0
    .end array-data
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/google/android/exoplayer2/mediacodec/MediaCodecSelector;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "mediaCodecSelector"    # Lcom/google/android/exoplayer2/mediacodec/MediaCodecSelector;

    .prologue
    .line 102
    const-wide/16 v0, 0x0

    invoke-direct {p0, p1, p2, v0, v1}, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;-><init>(Landroid/content/Context;Lcom/google/android/exoplayer2/mediacodec/MediaCodecSelector;J)V

    .line 103
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/google/android/exoplayer2/mediacodec/MediaCodecSelector;J)V
    .locals 9
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "mediaCodecSelector"    # Lcom/google/android/exoplayer2/mediacodec/MediaCodecSelector;
    .param p3, "allowedJoiningTimeMs"    # J

    .prologue
    const/4 v6, 0x0

    .line 113
    const/4 v8, -0x1

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-wide v4, p3

    move-object v7, v6

    invoke-direct/range {v1 .. v8}, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;-><init>(Landroid/content/Context;Lcom/google/android/exoplayer2/mediacodec/MediaCodecSelector;JLandroid/os/Handler;Lcom/google/android/exoplayer2/video/VideoRendererEventListener;I)V

    .line 114
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/google/android/exoplayer2/mediacodec/MediaCodecSelector;JLandroid/os/Handler;Lcom/google/android/exoplayer2/video/VideoRendererEventListener;I)V
    .locals 11
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "mediaCodecSelector"    # Lcom/google/android/exoplayer2/mediacodec/MediaCodecSelector;
    .param p3, "allowedJoiningTimeMs"    # J
    .param p5, "eventHandler"    # Landroid/os/Handler;
    .param p6, "eventListener"    # Lcom/google/android/exoplayer2/video/VideoRendererEventListener;
    .param p7, "maxDroppedFrameCountToNotify"    # I

    .prologue
    .line 130
    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-wide v4, p3

    move-object/from16 v8, p5

    move-object/from16 v9, p6

    move/from16 v10, p7

    invoke-direct/range {v1 .. v10}, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;-><init>(Landroid/content/Context;Lcom/google/android/exoplayer2/mediacodec/MediaCodecSelector;JLcom/google/android/exoplayer2/drm/DrmSessionManager;ZLandroid/os/Handler;Lcom/google/android/exoplayer2/video/VideoRendererEventListener;I)V

    .line 132
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/google/android/exoplayer2/mediacodec/MediaCodecSelector;JLcom/google/android/exoplayer2/drm/DrmSessionManager;ZLandroid/os/Handler;Lcom/google/android/exoplayer2/video/VideoRendererEventListener;I)V
    .locals 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "mediaCodecSelector"    # Lcom/google/android/exoplayer2/mediacodec/MediaCodecSelector;
    .param p3, "allowedJoiningTimeMs"    # J
    .param p6, "playClearSamplesWithoutKeys"    # Z
    .param p7, "eventHandler"    # Landroid/os/Handler;
    .param p8, "eventListener"    # Lcom/google/android/exoplayer2/video/VideoRendererEventListener;
    .param p9, "maxDroppedFramesToNotify"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/google/android/exoplayer2/mediacodec/MediaCodecSelector;",
            "J",
            "Lcom/google/android/exoplayer2/drm/DrmSessionManager",
            "<",
            "Lcom/google/android/exoplayer2/drm/FrameworkMediaCrypto;",
            ">;Z",
            "Landroid/os/Handler;",
            "Lcom/google/android/exoplayer2/video/VideoRendererEventListener;",
            "I)V"
        }
    .end annotation

    .prologue
    .local p5, "drmSessionManager":Lcom/google/android/exoplayer2/drm/DrmSessionManager;, "Lcom/google/android/exoplayer2/drm/DrmSessionManager<Lcom/google/android/exoplayer2/drm/FrameworkMediaCrypto;>;"
    const/4 v3, -0x1

    const/high16 v2, -0x40800000    # -1.0f

    .line 156
    const/4 v0, 0x2

    invoke-direct {p0, v0, p2, p5, p6}, Lcom/google/android/exoplayer2/mediacodec/MediaCodecRenderer;-><init>(ILcom/google/android/exoplayer2/mediacodec/MediaCodecSelector;Lcom/google/android/exoplayer2/drm/DrmSessionManager;Z)V

    .line 157
    iput-wide p3, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->allowedJoiningTimeMs:J

    .line 158
    iput p9, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->maxDroppedFramesToNotify:I

    .line 159
    new-instance v0, Lcom/google/android/exoplayer2/video/VideoFrameReleaseTimeHelper;

    invoke-direct {v0, p1}, Lcom/google/android/exoplayer2/video/VideoFrameReleaseTimeHelper;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->frameReleaseTimeHelper:Lcom/google/android/exoplayer2/video/VideoFrameReleaseTimeHelper;

    .line 160
    new-instance v0, Lcom/google/android/exoplayer2/video/VideoRendererEventListener$EventDispatcher;

    invoke-direct {v0, p7, p8}, Lcom/google/android/exoplayer2/video/VideoRendererEventListener$EventDispatcher;-><init>(Landroid/os/Handler;Lcom/google/android/exoplayer2/video/VideoRendererEventListener;)V

    iput-object v0, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->eventDispatcher:Lcom/google/android/exoplayer2/video/VideoRendererEventListener$EventDispatcher;

    .line 161
    invoke-static {}, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->deviceNeedsAutoFrcWorkaround()Z

    move-result v0

    iput-boolean v0, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->deviceNeedsAutoFrcWorkaround:Z

    .line 162
    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    iput-wide v0, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->joiningDeadlineMs:J

    .line 163
    iput v3, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->currentWidth:I

    .line 164
    iput v3, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->currentHeight:I

    .line 165
    iput v2, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->currentPixelWidthHeightRatio:F

    .line 166
    iput v2, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->pendingPixelWidthHeightRatio:F

    .line 167
    const/4 v0, 0x1

    iput v0, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->scalingMode:I

    .line 168
    invoke-direct {p0}, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->clearLastReportedVideoSize()V

    .line 169
    return-void
.end method

.method private static areAdaptationCompatible(Lcom/google/android/exoplayer2/Format;Lcom/google/android/exoplayer2/Format;)Z
    .locals 2
    .param p0, "first"    # Lcom/google/android/exoplayer2/Format;
    .param p1, "second"    # Lcom/google/android/exoplayer2/Format;

    .prologue
    .line 782
    iget-object v0, p0, Lcom/google/android/exoplayer2/Format;->sampleMimeType:Ljava/lang/String;

    iget-object v1, p1, Lcom/google/android/exoplayer2/Format;->sampleMimeType:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 783
    invoke-static {p0}, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->getRotationDegrees(Lcom/google/android/exoplayer2/Format;)I

    move-result v0

    invoke-static {p1}, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->getRotationDegrees(Lcom/google/android/exoplayer2/Format;)I

    move-result v1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private clearLastReportedVideoSize()V
    .locals 2

    .prologue
    const/4 v1, -0x1

    .line 541
    iput v1, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->lastReportedWidth:I

    .line 542
    iput v1, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->lastReportedHeight:I

    .line 543
    const/high16 v0, -0x40800000    # -1.0f

    iput v0, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->lastReportedPixelWidthHeightRatio:F

    .line 544
    iput v1, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->lastReportedUnappliedRotationDegrees:I

    .line 545
    return-void
.end method

.method private clearRenderedFirstFrame()V
    .locals 3

    .prologue
    .line 519
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->renderedFirstFrame:Z

    .line 524
    sget v1, Lcom/google/android/exoplayer2/util/Util;->SDK_INT:I

    const/16 v2, 0x17

    if-lt v1, v2, :cond_0

    iget-boolean v1, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->tunneling:Z

    if-eqz v1, :cond_0

    .line 525
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->getCodec()Landroid/media/MediaCodec;

    move-result-object v0

    .line 527
    .local v0, "codec":Landroid/media/MediaCodec;
    if-eqz v0, :cond_0

    .line 528
    new-instance v1, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer$OnFrameRenderedListenerV23;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v0, v2}, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer$OnFrameRenderedListenerV23;-><init>(Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;Landroid/media/MediaCodec;Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer$1;)V

    iput-object v1, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->tunnelingOnFrameRenderedListener:Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer$OnFrameRenderedListenerV23;

    .line 531
    .end local v0    # "codec":Landroid/media/MediaCodec;
    :cond_0
    return-void
.end method

.method private static configureTunnelingV21(Landroid/media/MediaFormat;I)V
    .locals 2
    .param p0, "mediaFormat"    # Landroid/media/MediaFormat;
    .param p1, "tunnelingAudioSessionId"    # I
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .prologue
    .line 594
    const-string/jumbo v0, "tunneled-playback"

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Landroid/media/MediaFormat;->setFeatureEnabled(Ljava/lang/String;Z)V

    .line 595
    const-string/jumbo v0, "audio-session-id"

    invoke-virtual {p0, v0, p1}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 596
    return-void
.end method

.method private static deviceNeedsAutoFrcWorkaround()Z
    .locals 2

    .prologue
    .line 769
    sget v0, Lcom/google/android/exoplayer2/util/Util;->SDK_INT:I

    const/16 v1, 0x16

    if-gt v0, v1, :cond_0

    const-string/jumbo v0, "foster"

    sget-object v1, Lcom/google/android/exoplayer2/util/Util;->DEVICE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string/jumbo v0, "NVIDIA"

    sget-object v1, Lcom/google/android/exoplayer2/util/Util;->MANUFACTURER:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private dropOutputBuffer(Landroid/media/MediaCodec;I)V
    .locals 3
    .param p1, "codec"    # Landroid/media/MediaCodec;
    .param p2, "bufferIndex"    # I

    .prologue
    .line 484
    const-string/jumbo v0, "dropVideoBuffer"

    invoke-static {v0}, Lcom/google/android/exoplayer2/util/TraceUtil;->beginSection(Ljava/lang/String;)V

    .line 485
    const/4 v0, 0x0

    invoke-virtual {p1, p2, v0}, Landroid/media/MediaCodec;->releaseOutputBuffer(IZ)V

    .line 486
    invoke-static {}, Lcom/google/android/exoplayer2/util/TraceUtil;->endSection()V

    .line 487
    iget-object v0, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->decoderCounters:Lcom/google/android/exoplayer2/decoder/DecoderCounters;

    iget v1, v0, Lcom/google/android/exoplayer2/decoder/DecoderCounters;->droppedOutputBufferCount:I

    add-int/lit8 v1, v1, 0x1

    iput v1, v0, Lcom/google/android/exoplayer2/decoder/DecoderCounters;->droppedOutputBufferCount:I

    .line 488
    iget v0, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->droppedFrames:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->droppedFrames:I

    .line 489
    iget v0, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->consecutiveDroppedFrameCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->consecutiveDroppedFrameCount:I

    .line 490
    iget-object v0, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->decoderCounters:Lcom/google/android/exoplayer2/decoder/DecoderCounters;

    iget v1, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->consecutiveDroppedFrameCount:I

    iget-object v2, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->decoderCounters:Lcom/google/android/exoplayer2/decoder/DecoderCounters;

    iget v2, v2, Lcom/google/android/exoplayer2/decoder/DecoderCounters;->maxConsecutiveDroppedOutputBufferCount:I

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v1

    iput v1, v0, Lcom/google/android/exoplayer2/decoder/DecoderCounters;->maxConsecutiveDroppedOutputBufferCount:I

    .line 492
    iget v0, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->droppedFrames:I

    iget v1, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->maxDroppedFramesToNotify:I

    if-ne v0, v1, :cond_0

    .line 493
    invoke-direct {p0}, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->maybeNotifyDroppedFrames()V

    .line 495
    :cond_0
    return-void
.end method

.method private static getCodecMaxSize(Lcom/google/android/exoplayer2/mediacodec/MediaCodecInfo;Lcom/google/android/exoplayer2/Format;)Landroid/graphics/Point;
    .locals 20
    .param p0, "codecInfo"    # Lcom/google/android/exoplayer2/mediacodec/MediaCodecInfo;
    .param p1, "format"    # Lcom/google/android/exoplayer2/Format;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/mediacodec/MediaCodecUtil$DecoderQueryException;
        }
    .end annotation

    .prologue
    .line 654
    move-object/from16 v0, p1

    iget v12, v0, Lcom/google/android/exoplayer2/Format;->height:I

    move-object/from16 v0, p1

    iget v13, v0, Lcom/google/android/exoplayer2/Format;->width:I

    if-le v12, v13, :cond_2

    const/4 v9, 0x1

    .line 655
    .local v9, "isVerticalVideo":Z
    :goto_0
    if-eqz v9, :cond_3

    move-object/from16 v0, p1

    iget v6, v0, Lcom/google/android/exoplayer2/Format;->height:I

    .line 656
    .local v6, "formatLongEdgePx":I
    :goto_1
    if-eqz v9, :cond_4

    move-object/from16 v0, p1

    iget v7, v0, Lcom/google/android/exoplayer2/Format;->width:I

    .line 657
    .local v7, "formatShortEdgePx":I
    :goto_2
    int-to-float v12, v7

    int-to-float v13, v6

    div-float v5, v12, v13

    .line 658
    .local v5, "aspectRatio":F
    sget-object v15, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->STANDARD_LONG_EDGE_VIDEO_PX:[I

    array-length v0, v15

    move/from16 v16, v0

    const/4 v12, 0x0

    move v14, v12

    :goto_3
    move/from16 v0, v16

    if-ge v14, v0, :cond_c

    aget v10, v15, v14

    .line 659
    .local v10, "longEdgePx":I
    int-to-float v12, v10

    mul-float/2addr v12, v5

    float-to-int v11, v12

    .line 660
    .local v11, "shortEdgePx":I
    if-le v10, v6, :cond_0

    if-gt v11, v7, :cond_5

    .line 662
    :cond_0
    const/4 v4, 0x0

    .line 680
    .end local v10    # "longEdgePx":I
    .end local v11    # "shortEdgePx":I
    :cond_1
    :goto_4
    return-object v4

    .line 654
    .end local v5    # "aspectRatio":F
    .end local v6    # "formatLongEdgePx":I
    .end local v7    # "formatShortEdgePx":I
    .end local v9    # "isVerticalVideo":Z
    :cond_2
    const/4 v9, 0x0

    goto :goto_0

    .line 655
    .restart local v9    # "isVerticalVideo":Z
    :cond_3
    move-object/from16 v0, p1

    iget v6, v0, Lcom/google/android/exoplayer2/Format;->width:I

    goto :goto_1

    .line 656
    .restart local v6    # "formatLongEdgePx":I
    :cond_4
    move-object/from16 v0, p1

    iget v7, v0, Lcom/google/android/exoplayer2/Format;->height:I

    goto :goto_2

    .line 663
    .restart local v5    # "aspectRatio":F
    .restart local v7    # "formatShortEdgePx":I
    .restart local v10    # "longEdgePx":I
    .restart local v11    # "shortEdgePx":I
    :cond_5
    sget v12, Lcom/google/android/exoplayer2/util/Util;->SDK_INT:I

    const/16 v13, 0x15

    if-lt v12, v13, :cond_9

    .line 664
    if-eqz v9, :cond_7

    move v13, v11

    :goto_5
    if-eqz v9, :cond_8

    move v12, v10

    :goto_6
    move-object/from16 v0, p0

    invoke-virtual {v0, v13, v12}, Lcom/google/android/exoplayer2/mediacodec/MediaCodecInfo;->alignVideoSizeV21(II)Landroid/graphics/Point;

    move-result-object v4

    .line 666
    .local v4, "alignedSize":Landroid/graphics/Point;
    move-object/from16 v0, p1

    iget v8, v0, Lcom/google/android/exoplayer2/Format;->frameRate:F

    .line 667
    .local v8, "frameRate":F
    iget v12, v4, Landroid/graphics/Point;->x:I

    iget v13, v4, Landroid/graphics/Point;->y:I

    float-to-double v0, v8

    move-wide/from16 v18, v0

    move-object/from16 v0, p0

    move-wide/from16 v1, v18

    invoke-virtual {v0, v12, v13, v1, v2}, Lcom/google/android/exoplayer2/mediacodec/MediaCodecInfo;->isVideoSizeAndRateSupportedV21(IID)Z

    move-result v12

    if-nez v12, :cond_1

    .line 658
    .end local v4    # "alignedSize":Landroid/graphics/Point;
    .end local v8    # "frameRate":F
    :cond_6
    add-int/lit8 v12, v14, 0x1

    move v14, v12

    goto :goto_3

    :cond_7
    move v13, v10

    .line 664
    goto :goto_5

    :cond_8
    move v12, v11

    goto :goto_6

    .line 672
    :cond_9
    const/16 v12, 0x10

    invoke-static {v10, v12}, Lcom/google/android/exoplayer2/util/Util;->ceilDivide(II)I

    move-result v12

    mul-int/lit8 v10, v12, 0x10

    .line 673
    const/16 v12, 0x10

    invoke-static {v11, v12}, Lcom/google/android/exoplayer2/util/Util;->ceilDivide(II)I

    move-result v12

    mul-int/lit8 v11, v12, 0x10

    .line 674
    mul-int v12, v10, v11

    invoke-static {}, Lcom/google/android/exoplayer2/mediacodec/MediaCodecUtil;->maxH264DecodableFrameSize()I

    move-result v13

    if-gt v12, v13, :cond_6

    .line 675
    new-instance v4, Landroid/graphics/Point;

    if-eqz v9, :cond_a

    move v12, v11

    :goto_7
    if-eqz v9, :cond_b

    .end local v10    # "longEdgePx":I
    :goto_8
    invoke-direct {v4, v12, v10}, Landroid/graphics/Point;-><init>(II)V

    goto :goto_4

    .restart local v10    # "longEdgePx":I
    :cond_a
    move v12, v10

    goto :goto_7

    :cond_b
    move v10, v11

    goto :goto_8

    .line 680
    .end local v10    # "longEdgePx":I
    .end local v11    # "shortEdgePx":I
    :cond_c
    const/4 v4, 0x0

    goto :goto_4
.end method

.method private static getCodecMaxValues(Lcom/google/android/exoplayer2/mediacodec/MediaCodecInfo;Lcom/google/android/exoplayer2/Format;[Lcom/google/android/exoplayer2/Format;)Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer$CodecMaxValues;
    .locals 12
    .param p0, "codecInfo"    # Lcom/google/android/exoplayer2/mediacodec/MediaCodecInfo;
    .param p1, "format"    # Lcom/google/android/exoplayer2/Format;
    .param p2, "streamFormats"    # [Lcom/google/android/exoplayer2/Format;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/mediacodec/MediaCodecUtil$DecoderQueryException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x1

    const/4 v7, 0x0

    const/4 v11, -0x1

    .line 610
    iget v4, p1, Lcom/google/android/exoplayer2/Format;->width:I

    .line 611
    .local v4, "maxWidth":I
    iget v2, p1, Lcom/google/android/exoplayer2/Format;->height:I

    .line 612
    .local v2, "maxHeight":I
    invoke-static {p1}, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->getMaxInputSize(Lcom/google/android/exoplayer2/Format;)I

    move-result v3

    .line 613
    .local v3, "maxInputSize":I
    array-length v6, p2

    if-ne v6, v8, :cond_0

    .line 616
    new-instance v6, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer$CodecMaxValues;

    invoke-direct {v6, v4, v2, v3}, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer$CodecMaxValues;-><init>(III)V

    .line 639
    :goto_0
    return-object v6

    .line 618
    :cond_0
    const/4 v1, 0x0

    .line 619
    .local v1, "haveUnknownDimensions":Z
    array-length v10, p2

    move v9, v7

    :goto_1
    if-ge v9, v10, :cond_4

    aget-object v5, p2, v9

    .line 620
    .local v5, "streamFormat":Lcom/google/android/exoplayer2/Format;
    invoke-static {p1, v5}, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->areAdaptationCompatible(Lcom/google/android/exoplayer2/Format;Lcom/google/android/exoplayer2/Format;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 621
    iget v6, v5, Lcom/google/android/exoplayer2/Format;->width:I

    if-eq v6, v11, :cond_1

    iget v6, v5, Lcom/google/android/exoplayer2/Format;->height:I

    if-ne v6, v11, :cond_3

    :cond_1
    move v6, v8

    :goto_2
    or-int/2addr v1, v6

    .line 623
    iget v6, v5, Lcom/google/android/exoplayer2/Format;->width:I

    invoke-static {v4, v6}, Ljava/lang/Math;->max(II)I

    move-result v4

    .line 624
    iget v6, v5, Lcom/google/android/exoplayer2/Format;->height:I

    invoke-static {v2, v6}, Ljava/lang/Math;->max(II)I

    move-result v2

    .line 625
    invoke-static {v5}, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->getMaxInputSize(Lcom/google/android/exoplayer2/Format;)I

    move-result v6

    invoke-static {v3, v6}, Ljava/lang/Math;->max(II)I

    move-result v3

    .line 619
    :cond_2
    add-int/lit8 v6, v9, 0x1

    move v9, v6

    goto :goto_1

    :cond_3
    move v6, v7

    .line 621
    goto :goto_2

    .line 628
    .end local v5    # "streamFormat":Lcom/google/android/exoplayer2/Format;
    :cond_4
    if-eqz v1, :cond_5

    .line 629
    const-string/jumbo v6, "MediaCodecVideoRenderer"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "Resolutions unknown. Codec max resolution: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v8, "x"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 630
    invoke-static {p0, p1}, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->getCodecMaxSize(Lcom/google/android/exoplayer2/mediacodec/MediaCodecInfo;Lcom/google/android/exoplayer2/Format;)Landroid/graphics/Point;

    move-result-object v0

    .line 631
    .local v0, "codecMaxSize":Landroid/graphics/Point;
    if-eqz v0, :cond_5

    .line 632
    iget v6, v0, Landroid/graphics/Point;->x:I

    invoke-static {v4, v6}, Ljava/lang/Math;->max(II)I

    move-result v4

    .line 633
    iget v6, v0, Landroid/graphics/Point;->y:I

    invoke-static {v2, v6}, Ljava/lang/Math;->max(II)I

    move-result v2

    .line 634
    iget-object v6, p1, Lcom/google/android/exoplayer2/Format;->sampleMimeType:Ljava/lang/String;

    .line 635
    invoke-static {v6, v4, v2}, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->getMaxInputSize(Ljava/lang/String;II)I

    move-result v6

    .line 634
    invoke-static {v3, v6}, Ljava/lang/Math;->max(II)I

    move-result v3

    .line 636
    const-string/jumbo v6, "MediaCodecVideoRenderer"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "Codec max resolution adjusted to: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v8, "x"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 639
    .end local v0    # "codecMaxSize":Landroid/graphics/Point;
    :cond_5
    new-instance v6, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer$CodecMaxValues;

    invoke-direct {v6, v4, v2, v3}, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer$CodecMaxValues;-><init>(III)V

    goto/16 :goto_0
.end method

.method private static getMaxInputSize(Lcom/google/android/exoplayer2/Format;)I
    .locals 3
    .param p0, "format"    # Lcom/google/android/exoplayer2/Format;

    .prologue
    .line 691
    iget v0, p0, Lcom/google/android/exoplayer2/Format;->maxInputSize:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    .line 693
    iget v0, p0, Lcom/google/android/exoplayer2/Format;->maxInputSize:I

    .line 695
    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/google/android/exoplayer2/Format;->sampleMimeType:Ljava/lang/String;

    iget v1, p0, Lcom/google/android/exoplayer2/Format;->width:I

    iget v2, p0, Lcom/google/android/exoplayer2/Format;->height:I

    invoke-static {v0, v1, v2}, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->getMaxInputSize(Ljava/lang/String;II)I

    move-result v0

    goto :goto_0
.end method

.method private static getMaxInputSize(Ljava/lang/String;II)I
    .locals 6
    .param p0, "sampleMimeType"    # Ljava/lang/String;
    .param p1, "width"    # I
    .param p2, "height"    # I

    .prologue
    const/16 v5, 0x10

    const/4 v2, -0x1

    .line 708
    if-eq p1, v2, :cond_0

    if-ne p2, v2, :cond_1

    .line 747
    :cond_0
    :goto_0
    return v2

    .line 716
    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result v3

    sparse-switch v3, :sswitch_data_0

    :cond_2
    move v3, v2

    :goto_1
    packed-switch v3, :pswitch_data_0

    goto :goto_0

    .line 719
    :pswitch_0
    mul-int v0, p1, p2

    .line 720
    .local v0, "maxPixels":I
    const/4 v1, 0x2

    .line 747
    .local v1, "minCompressionRatio":I
    :goto_2
    mul-int/lit8 v2, v0, 0x3

    mul-int/lit8 v3, v1, 0x2

    div-int/2addr v2, v3

    goto :goto_0

    .line 716
    .end local v0    # "maxPixels":I
    .end local v1    # "minCompressionRatio":I
    :sswitch_0
    const-string/jumbo v3, "video/3gpp"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    const/4 v3, 0x0

    goto :goto_1

    :sswitch_1
    const-string/jumbo v3, "video/mp4v-es"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    const/4 v3, 0x1

    goto :goto_1

    :sswitch_2
    const-string/jumbo v3, "video/avc"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    const/4 v3, 0x2

    goto :goto_1

    :sswitch_3
    const-string/jumbo v3, "video/x-vnd.on2.vp8"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    const/4 v3, 0x3

    goto :goto_1

    :sswitch_4
    const-string/jumbo v3, "video/hevc"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    const/4 v3, 0x4

    goto :goto_1

    :sswitch_5
    const-string/jumbo v3, "video/x-vnd.on2.vp9"

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    const/4 v3, 0x5

    goto :goto_1

    .line 723
    :pswitch_1
    const-string/jumbo v3, "BRAVIA 4K 2015"

    sget-object v4, Lcom/google/android/exoplayer2/util/Util;->MODEL:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 729
    invoke-static {p1, v5}, Lcom/google/android/exoplayer2/util/Util;->ceilDivide(II)I

    move-result v2

    invoke-static {p2, v5}, Lcom/google/android/exoplayer2/util/Util;->ceilDivide(II)I

    move-result v3

    mul-int/2addr v2, v3

    mul-int/lit8 v2, v2, 0x10

    mul-int/lit8 v0, v2, 0x10

    .line 730
    .restart local v0    # "maxPixels":I
    const/4 v1, 0x2

    .line 731
    .restart local v1    # "minCompressionRatio":I
    goto :goto_2

    .line 734
    .end local v0    # "maxPixels":I
    .end local v1    # "minCompressionRatio":I
    :pswitch_2
    mul-int v0, p1, p2

    .line 735
    .restart local v0    # "maxPixels":I
    const/4 v1, 0x2

    .line 736
    .restart local v1    # "minCompressionRatio":I
    goto :goto_2

    .line 739
    .end local v0    # "maxPixels":I
    .end local v1    # "minCompressionRatio":I
    :pswitch_3
    mul-int v0, p1, p2

    .line 740
    .restart local v0    # "maxPixels":I
    const/4 v1, 0x4

    .line 741
    .restart local v1    # "minCompressionRatio":I
    goto :goto_2

    .line 716
    nop

    :sswitch_data_0
    .sparse-switch
        -0x63306f58 -> :sswitch_0
        -0x63185e82 -> :sswitch_4
        0x46cdc642 -> :sswitch_1
        0x4f62373a -> :sswitch_2
        0x5f50bed8 -> :sswitch_3
        0x5f50bed9 -> :sswitch_5
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_3
    .end packed-switch
.end method

.method private static getMediaFormat(Lcom/google/android/exoplayer2/Format;Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer$CodecMaxValues;ZI)Landroid/media/MediaFormat;
    .locals 3
    .param p0, "format"    # Lcom/google/android/exoplayer2/Format;
    .param p1, "codecMaxValues"    # Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer$CodecMaxValues;
    .param p2, "deviceNeedsAutoFrcWorkaround"    # Z
    .param p3, "tunnelingAudioSessionId"    # I
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "InlinedApi"
        }
    .end annotation

    .prologue
    .line 573
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/Format;->getFrameworkMediaFormatV16()Landroid/media/MediaFormat;

    move-result-object v0

    .line 575
    .local v0, "frameworkMediaFormat":Landroid/media/MediaFormat;
    const-string/jumbo v1, "max-width"

    iget v2, p1, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer$CodecMaxValues;->width:I

    invoke-virtual {v0, v1, v2}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 576
    const-string/jumbo v1, "max-height"

    iget v2, p1, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer$CodecMaxValues;->height:I

    invoke-virtual {v0, v1, v2}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 578
    iget v1, p1, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer$CodecMaxValues;->inputSize:I

    const/4 v2, -0x1

    if-eq v1, v2, :cond_0

    .line 579
    const-string/jumbo v1, "max-input-size"

    iget v2, p1, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer$CodecMaxValues;->inputSize:I

    invoke-virtual {v0, v1, v2}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 582
    :cond_0
    if-eqz p2, :cond_1

    .line 583
    const-string/jumbo v1, "auto-frc"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 586
    :cond_1
    if-eqz p3, :cond_2

    .line 587
    invoke-static {v0, p3}, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->configureTunnelingV21(Landroid/media/MediaFormat;I)V

    .line 589
    :cond_2
    return-object v0
.end method

.method private static getPixelWidthHeightRatio(Lcom/google/android/exoplayer2/Format;)F
    .locals 2
    .param p0, "format"    # Lcom/google/android/exoplayer2/Format;

    .prologue
    .line 787
    iget v0, p0, Lcom/google/android/exoplayer2/Format;->pixelWidthHeightRatio:F

    const/high16 v1, -0x40800000    # -1.0f

    cmpl-float v0, v0, v1

    if-nez v0, :cond_0

    const/high16 v0, 0x3f800000    # 1.0f

    :goto_0
    return v0

    :cond_0
    iget v0, p0, Lcom/google/android/exoplayer2/Format;->pixelWidthHeightRatio:F

    goto :goto_0
.end method

.method private static getRotationDegrees(Lcom/google/android/exoplayer2/Format;)I
    .locals 2
    .param p0, "format"    # Lcom/google/android/exoplayer2/Format;

    .prologue
    .line 791
    iget v0, p0, Lcom/google/android/exoplayer2/Format;->rotationDegrees:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    iget v0, p0, Lcom/google/android/exoplayer2/Format;->rotationDegrees:I

    goto :goto_0
.end method

.method private maybeNotifyDroppedFrames()V
    .locals 6

    .prologue
    .line 561
    iget v4, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->droppedFrames:I

    if-lez v4, :cond_0

    .line 562
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    .line 563
    .local v2, "now":J
    iget-wide v4, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->droppedFrameAccumulationStartTimeMs:J

    sub-long v0, v2, v4

    .line 564
    .local v0, "elapsedMs":J
    iget-object v4, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->eventDispatcher:Lcom/google/android/exoplayer2/video/VideoRendererEventListener$EventDispatcher;

    iget v5, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->droppedFrames:I

    invoke-virtual {v4, v5, v0, v1}, Lcom/google/android/exoplayer2/video/VideoRendererEventListener$EventDispatcher;->droppedFrames(IJ)V

    .line 565
    const/4 v4, 0x0

    iput v4, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->droppedFrames:I

    .line 566
    iput-wide v2, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->droppedFrameAccumulationStartTimeMs:J

    .line 568
    .end local v0    # "elapsedMs":J
    .end local v2    # "now":J
    :cond_0
    return-void
.end method

.method private maybeNotifyVideoSizeChanged()V
    .locals 5

    .prologue
    .line 548
    iget v0, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->lastReportedWidth:I

    iget v1, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->currentWidth:I

    if-ne v0, v1, :cond_0

    iget v0, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->lastReportedHeight:I

    iget v1, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->currentHeight:I

    if-ne v0, v1, :cond_0

    iget v0, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->lastReportedUnappliedRotationDegrees:I

    iget v1, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->currentUnappliedRotationDegrees:I

    if-ne v0, v1, :cond_0

    iget v0, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->lastReportedPixelWidthHeightRatio:F

    iget v1, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->currentPixelWidthHeightRatio:F

    cmpl-float v0, v0, v1

    if-eqz v0, :cond_1

    .line 551
    :cond_0
    iget-object v0, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->eventDispatcher:Lcom/google/android/exoplayer2/video/VideoRendererEventListener$EventDispatcher;

    iget v1, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->currentWidth:I

    iget v2, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->currentHeight:I

    iget v3, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->currentUnappliedRotationDegrees:I

    iget v4, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->currentPixelWidthHeightRatio:F

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/google/android/exoplayer2/video/VideoRendererEventListener$EventDispatcher;->videoSizeChanged(IIIF)V

    .line 553
    iget v0, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->currentWidth:I

    iput v0, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->lastReportedWidth:I

    .line 554
    iget v0, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->currentHeight:I

    iput v0, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->lastReportedHeight:I

    .line 555
    iget v0, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->currentUnappliedRotationDegrees:I

    iput v0, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->lastReportedUnappliedRotationDegrees:I

    .line 556
    iget v0, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->currentPixelWidthHeightRatio:F

    iput v0, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->lastReportedPixelWidthHeightRatio:F

    .line 558
    :cond_1
    return-void
.end method

.method private renderOutputBuffer(Landroid/media/MediaCodec;I)V
    .locals 2
    .param p1, "codec"    # Landroid/media/MediaCodec;
    .param p2, "bufferIndex"    # I

    .prologue
    .line 498
    invoke-direct {p0}, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->maybeNotifyVideoSizeChanged()V

    .line 499
    const-string/jumbo v0, "releaseOutputBuffer"

    invoke-static {v0}, Lcom/google/android/exoplayer2/util/TraceUtil;->beginSection(Ljava/lang/String;)V

    .line 500
    const/4 v0, 0x1

    invoke-virtual {p1, p2, v0}, Landroid/media/MediaCodec;->releaseOutputBuffer(IZ)V

    .line 501
    invoke-static {}, Lcom/google/android/exoplayer2/util/TraceUtil;->endSection()V

    .line 502
    iget-object v0, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->decoderCounters:Lcom/google/android/exoplayer2/decoder/DecoderCounters;

    iget v1, v0, Lcom/google/android/exoplayer2/decoder/DecoderCounters;->renderedOutputBufferCount:I

    add-int/lit8 v1, v1, 0x1

    iput v1, v0, Lcom/google/android/exoplayer2/decoder/DecoderCounters;->renderedOutputBufferCount:I

    .line 503
    const/4 v0, 0x0

    iput v0, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->consecutiveDroppedFrameCount:I

    .line 504
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->maybeNotifyRenderedFirstFrame()V

    .line 505
    return-void
.end method

.method private renderOutputBufferV21(Landroid/media/MediaCodec;IJ)V
    .locals 3
    .param p1, "codec"    # Landroid/media/MediaCodec;
    .param p2, "bufferIndex"    # I
    .param p3, "releaseTimeNs"    # J
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .prologue
    .line 509
    invoke-direct {p0}, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->maybeNotifyVideoSizeChanged()V

    .line 510
    const-string/jumbo v0, "releaseOutputBuffer"

    invoke-static {v0}, Lcom/google/android/exoplayer2/util/TraceUtil;->beginSection(Ljava/lang/String;)V

    .line 511
    invoke-virtual {p1, p2, p3, p4}, Landroid/media/MediaCodec;->releaseOutputBuffer(IJ)V

    .line 512
    invoke-static {}, Lcom/google/android/exoplayer2/util/TraceUtil;->endSection()V

    .line 513
    iget-object v0, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->decoderCounters:Lcom/google/android/exoplayer2/decoder/DecoderCounters;

    iget v1, v0, Lcom/google/android/exoplayer2/decoder/DecoderCounters;->renderedOutputBufferCount:I

    add-int/lit8 v1, v1, 0x1

    iput v1, v0, Lcom/google/android/exoplayer2/decoder/DecoderCounters;->renderedOutputBufferCount:I

    .line 514
    const/4 v0, 0x0

    iput v0, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->consecutiveDroppedFrameCount:I

    .line 515
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->maybeNotifyRenderedFirstFrame()V

    .line 516
    return-void
.end method

.method private setSurface(Landroid/view/Surface;)V
    .locals 2
    .param p1, "surface"    # Landroid/view/Surface;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ExoPlaybackException;
        }
    .end annotation

    .prologue
    .line 302
    iget-object v1, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->surface:Landroid/view/Surface;

    if-eq v1, p1, :cond_1

    .line 303
    iput-object p1, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->surface:Landroid/view/Surface;

    .line 304
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->getState()I

    move-result v0

    .line 305
    .local v0, "state":I
    const/4 v1, 0x1

    if-eq v0, v1, :cond_0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_1

    .line 306
    :cond_0
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->releaseCodec()V

    .line 307
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->maybeInitCodec()V

    .line 312
    .end local v0    # "state":I
    :cond_1
    invoke-direct {p0}, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->clearRenderedFirstFrame()V

    .line 313
    invoke-direct {p0}, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->clearLastReportedVideoSize()V

    .line 314
    return-void
.end method

.method private static setVideoScalingMode(Landroid/media/MediaCodec;I)V
    .locals 0
    .param p0, "codec"    # Landroid/media/MediaCodec;
    .param p1, "scalingMode"    # I

    .prologue
    .line 751
    invoke-virtual {p0, p1}, Landroid/media/MediaCodec;->setVideoScalingMode(I)V

    .line 752
    return-void
.end method

.method private skipOutputBuffer(Landroid/media/MediaCodec;I)V
    .locals 2
    .param p1, "codec"    # Landroid/media/MediaCodec;
    .param p2, "bufferIndex"    # I

    .prologue
    .line 477
    const-string/jumbo v0, "skipVideoBuffer"

    invoke-static {v0}, Lcom/google/android/exoplayer2/util/TraceUtil;->beginSection(Ljava/lang/String;)V

    .line 478
    const/4 v0, 0x0

    invoke-virtual {p1, p2, v0}, Landroid/media/MediaCodec;->releaseOutputBuffer(IZ)V

    .line 479
    invoke-static {}, Lcom/google/android/exoplayer2/util/TraceUtil;->endSection()V

    .line 480
    iget-object v0, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->decoderCounters:Lcom/google/android/exoplayer2/decoder/DecoderCounters;

    iget v1, v0, Lcom/google/android/exoplayer2/decoder/DecoderCounters;->skippedOutputBufferCount:I

    add-int/lit8 v1, v1, 0x1

    iput v1, v0, Lcom/google/android/exoplayer2/decoder/DecoderCounters;->skippedOutputBufferCount:I

    .line 481
    return-void
.end method


# virtual methods
.method protected canReconfigureCodec(Landroid/media/MediaCodec;ZLcom/google/android/exoplayer2/Format;Lcom/google/android/exoplayer2/Format;)Z
    .locals 2
    .param p1, "codec"    # Landroid/media/MediaCodec;
    .param p2, "codecIsAdaptive"    # Z
    .param p3, "oldFormat"    # Lcom/google/android/exoplayer2/Format;
    .param p4, "newFormat"    # Lcom/google/android/exoplayer2/Format;

    .prologue
    .line 387
    invoke-static {p3, p4}, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->areAdaptationCompatible(Lcom/google/android/exoplayer2/Format;Lcom/google/android/exoplayer2/Format;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget v0, p4, Lcom/google/android/exoplayer2/Format;->width:I

    iget-object v1, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->codecMaxValues:Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer$CodecMaxValues;

    iget v1, v1, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer$CodecMaxValues;->width:I

    if-gt v0, v1, :cond_1

    iget v0, p4, Lcom/google/android/exoplayer2/Format;->height:I

    iget-object v1, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->codecMaxValues:Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer$CodecMaxValues;

    iget v1, v1, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer$CodecMaxValues;->height:I

    if-gt v0, v1, :cond_1

    iget v0, p4, Lcom/google/android/exoplayer2/Format;->maxInputSize:I

    iget-object v1, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->codecMaxValues:Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer$CodecMaxValues;

    iget v1, v1, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer$CodecMaxValues;->inputSize:I

    if-gt v0, v1, :cond_1

    if-nez p2, :cond_0

    iget v0, p3, Lcom/google/android/exoplayer2/Format;->width:I

    iget v1, p4, Lcom/google/android/exoplayer2/Format;->width:I

    if-ne v0, v1, :cond_1

    iget v0, p3, Lcom/google/android/exoplayer2/Format;->height:I

    iget v1, p4, Lcom/google/android/exoplayer2/Format;->height:I

    if-ne v0, v1, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected configureCodec(Lcom/google/android/exoplayer2/mediacodec/MediaCodecInfo;Landroid/media/MediaCodec;Lcom/google/android/exoplayer2/Format;Landroid/media/MediaCrypto;)V
    .locals 4
    .param p1, "codecInfo"    # Lcom/google/android/exoplayer2/mediacodec/MediaCodecInfo;
    .param p2, "codec"    # Landroid/media/MediaCodec;
    .param p3, "format"    # Lcom/google/android/exoplayer2/Format;
    .param p4, "crypto"    # Landroid/media/MediaCrypto;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/mediacodec/MediaCodecUtil$DecoderQueryException;
        }
    .end annotation

    .prologue
    .line 324
    iget-object v1, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->streamFormats:[Lcom/google/android/exoplayer2/Format;

    invoke-static {p1, p3, v1}, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->getCodecMaxValues(Lcom/google/android/exoplayer2/mediacodec/MediaCodecInfo;Lcom/google/android/exoplayer2/Format;[Lcom/google/android/exoplayer2/Format;)Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer$CodecMaxValues;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->codecMaxValues:Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer$CodecMaxValues;

    .line 325
    iget-object v1, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->codecMaxValues:Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer$CodecMaxValues;

    iget-boolean v2, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->deviceNeedsAutoFrcWorkaround:Z

    iget v3, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->tunnelingAudioSessionId:I

    invoke-static {p3, v1, v2, v3}, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->getMediaFormat(Lcom/google/android/exoplayer2/Format;Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer$CodecMaxValues;ZI)Landroid/media/MediaFormat;

    move-result-object v0

    .line 327
    .local v0, "mediaFormat":Landroid/media/MediaFormat;
    iget-object v1, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->surface:Landroid/view/Surface;

    const/4 v2, 0x0

    invoke-virtual {p2, v0, v1, p4, v2}, Landroid/media/MediaCodec;->configure(Landroid/media/MediaFormat;Landroid/view/Surface;Landroid/media/MediaCrypto;I)V

    .line 328
    sget v1, Lcom/google/android/exoplayer2/util/Util;->SDK_INT:I

    const/16 v2, 0x17

    if-lt v1, v2, :cond_0

    iget-boolean v1, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->tunneling:Z

    if-eqz v1, :cond_0

    .line 329
    new-instance v1, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer$OnFrameRenderedListenerV23;

    const/4 v2, 0x0

    invoke-direct {v1, p0, p2, v2}, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer$OnFrameRenderedListenerV23;-><init>(Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;Landroid/media/MediaCodec;Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer$1;)V

    iput-object v1, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->tunnelingOnFrameRenderedListener:Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer$OnFrameRenderedListenerV23;

    .line 331
    :cond_0
    return-void
.end method

.method public handleMessage(ILjava/lang/Object;)V
    .locals 2
    .param p1, "messageType"    # I
    .param p2, "message"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ExoPlaybackException;
        }
    .end annotation

    .prologue
    .line 287
    const/4 v1, 0x1

    if-ne p1, v1, :cond_1

    .line 288
    check-cast p2, Landroid/view/Surface;

    .end local p2    # "message":Ljava/lang/Object;
    invoke-direct {p0, p2}, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->setSurface(Landroid/view/Surface;)V

    .line 298
    :cond_0
    :goto_0
    return-void

    .line 289
    .restart local p2    # "message":Ljava/lang/Object;
    :cond_1
    const/4 v1, 0x5

    if-ne p1, v1, :cond_2

    .line 290
    check-cast p2, Ljava/lang/Integer;

    .end local p2    # "message":Ljava/lang/Object;
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result v1

    iput v1, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->scalingMode:I

    .line 291
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->getCodec()Landroid/media/MediaCodec;

    move-result-object v0

    .line 292
    .local v0, "codec":Landroid/media/MediaCodec;
    if-eqz v0, :cond_0

    .line 293
    iget v1, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->scalingMode:I

    invoke-static {v0, v1}, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->setVideoScalingMode(Landroid/media/MediaCodec;I)V

    goto :goto_0

    .line 296
    .end local v0    # "codec":Landroid/media/MediaCodec;
    .restart local p2    # "message":Ljava/lang/Object;
    :cond_2
    invoke-super {p0, p1, p2}, Lcom/google/android/exoplayer2/mediacodec/MediaCodecRenderer;->handleMessage(ILjava/lang/Object;)V

    goto :goto_0
.end method

.method public isReady()Z
    .locals 8

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    const-wide v6, -0x7fffffffffffffffL    # -4.9E-324

    .line 237
    iget-boolean v2, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->renderedFirstFrame:Z

    if-nez v2, :cond_0

    invoke-super {p0}, Lcom/google/android/exoplayer2/mediacodec/MediaCodecRenderer;->shouldInitCodec()Z

    move-result v2

    if-eqz v2, :cond_2

    :cond_0
    invoke-super {p0}, Lcom/google/android/exoplayer2/mediacodec/MediaCodecRenderer;->isReady()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 239
    iput-wide v6, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->joiningDeadlineMs:J

    .line 250
    :cond_1
    :goto_0
    return v0

    .line 241
    :cond_2
    iget-wide v2, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->joiningDeadlineMs:J

    cmp-long v2, v2, v6

    if-nez v2, :cond_3

    move v0, v1

    .line 243
    goto :goto_0

    .line 244
    :cond_3
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    iget-wide v4, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->joiningDeadlineMs:J

    cmp-long v2, v2, v4

    if-ltz v2, :cond_1

    .line 249
    iput-wide v6, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->joiningDeadlineMs:J

    move v0, v1

    .line 250
    goto :goto_0
.end method

.method maybeNotifyRenderedFirstFrame()V
    .locals 2

    .prologue
    .line 534
    iget-boolean v0, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->renderedFirstFrame:Z

    if-nez v0, :cond_0

    .line 535
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->renderedFirstFrame:Z

    .line 536
    iget-object v0, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->eventDispatcher:Lcom/google/android/exoplayer2/video/VideoRendererEventListener$EventDispatcher;

    iget-object v1, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->surface:Landroid/view/Surface;

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/video/VideoRendererEventListener$EventDispatcher;->renderedFirstFrame(Landroid/view/Surface;)V

    .line 538
    :cond_0
    return-void
.end method

.method protected onCodecInitialized(Ljava/lang/String;JJ)V
    .locals 6
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "initializedTimestampMs"    # J
    .param p4, "initializationDurationMs"    # J

    .prologue
    .line 336
    iget-object v0, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->eventDispatcher:Lcom/google/android/exoplayer2/video/VideoRendererEventListener$EventDispatcher;

    move-object v1, p1

    move-wide v2, p2

    move-wide v4, p4

    invoke-virtual/range {v0 .. v5}, Lcom/google/android/exoplayer2/video/VideoRendererEventListener$EventDispatcher;->decoderInitialized(Ljava/lang/String;JJ)V

    .line 337
    return-void
.end method

.method protected onDisabled()V
    .locals 3

    .prologue
    const/4 v1, -0x1

    const/high16 v0, -0x40800000    # -1.0f

    .line 270
    iput v1, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->currentWidth:I

    .line 271
    iput v1, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->currentHeight:I

    .line 272
    iput v0, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->currentPixelWidthHeightRatio:F

    .line 273
    iput v0, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->pendingPixelWidthHeightRatio:F

    .line 274
    invoke-direct {p0}, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->clearLastReportedVideoSize()V

    .line 275
    iget-object v0, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->frameReleaseTimeHelper:Lcom/google/android/exoplayer2/video/VideoFrameReleaseTimeHelper;

    invoke-virtual {v0}, Lcom/google/android/exoplayer2/video/VideoFrameReleaseTimeHelper;->disable()V

    .line 276
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->tunnelingOnFrameRenderedListener:Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer$OnFrameRenderedListenerV23;

    .line 278
    :try_start_0
    invoke-super {p0}, Lcom/google/android/exoplayer2/mediacodec/MediaCodecRenderer;->onDisabled()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 280
    iget-object v0, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->decoderCounters:Lcom/google/android/exoplayer2/decoder/DecoderCounters;

    invoke-virtual {v0}, Lcom/google/android/exoplayer2/decoder/DecoderCounters;->ensureUpdated()V

    .line 281
    iget-object v0, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->eventDispatcher:Lcom/google/android/exoplayer2/video/VideoRendererEventListener$EventDispatcher;

    iget-object v1, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->decoderCounters:Lcom/google/android/exoplayer2/decoder/DecoderCounters;

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/video/VideoRendererEventListener$EventDispatcher;->disabled(Lcom/google/android/exoplayer2/decoder/DecoderCounters;)V

    .line 283
    return-void

    .line 280
    :catchall_0
    move-exception v0

    iget-object v1, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->decoderCounters:Lcom/google/android/exoplayer2/decoder/DecoderCounters;

    invoke-virtual {v1}, Lcom/google/android/exoplayer2/decoder/DecoderCounters;->ensureUpdated()V

    .line 281
    iget-object v1, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->eventDispatcher:Lcom/google/android/exoplayer2/video/VideoRendererEventListener$EventDispatcher;

    iget-object v2, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->decoderCounters:Lcom/google/android/exoplayer2/decoder/DecoderCounters;

    invoke-virtual {v1, v2}, Lcom/google/android/exoplayer2/video/VideoRendererEventListener$EventDispatcher;->disabled(Lcom/google/android/exoplayer2/decoder/DecoderCounters;)V

    throw v0
.end method

.method protected onEnabled(Z)V
    .locals 2
    .param p1, "joining"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ExoPlaybackException;
        }
    .end annotation

    .prologue
    .line 213
    invoke-super {p0, p1}, Lcom/google/android/exoplayer2/mediacodec/MediaCodecRenderer;->onEnabled(Z)V

    .line 214
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->getConfiguration()Lcom/google/android/exoplayer2/RendererConfiguration;

    move-result-object v0

    iget v0, v0, Lcom/google/android/exoplayer2/RendererConfiguration;->tunnelingAudioSessionId:I

    iput v0, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->tunnelingAudioSessionId:I

    .line 215
    iget v0, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->tunnelingAudioSessionId:I

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    iput-boolean v0, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->tunneling:Z

    .line 216
    iget-object v0, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->eventDispatcher:Lcom/google/android/exoplayer2/video/VideoRendererEventListener$EventDispatcher;

    iget-object v1, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->decoderCounters:Lcom/google/android/exoplayer2/decoder/DecoderCounters;

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/video/VideoRendererEventListener$EventDispatcher;->enabled(Lcom/google/android/exoplayer2/decoder/DecoderCounters;)V

    .line 217
    iget-object v0, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->frameReleaseTimeHelper:Lcom/google/android/exoplayer2/video/VideoFrameReleaseTimeHelper;

    invoke-virtual {v0}, Lcom/google/android/exoplayer2/video/VideoFrameReleaseTimeHelper;->enable()V

    .line 218
    return-void

    .line 215
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected onInputFormatChanged(Lcom/google/android/exoplayer2/Format;)V
    .locals 1
    .param p1, "newFormat"    # Lcom/google/android/exoplayer2/Format;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ExoPlaybackException;
        }
    .end annotation

    .prologue
    .line 341
    invoke-super {p0, p1}, Lcom/google/android/exoplayer2/mediacodec/MediaCodecRenderer;->onInputFormatChanged(Lcom/google/android/exoplayer2/Format;)V

    .line 342
    iget-object v0, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->eventDispatcher:Lcom/google/android/exoplayer2/video/VideoRendererEventListener$EventDispatcher;

    invoke-virtual {v0, p1}, Lcom/google/android/exoplayer2/video/VideoRendererEventListener$EventDispatcher;->inputFormatChanged(Lcom/google/android/exoplayer2/Format;)V

    .line 343
    invoke-static {p1}, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->getPixelWidthHeightRatio(Lcom/google/android/exoplayer2/Format;)F

    move-result v0

    iput v0, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->pendingPixelWidthHeightRatio:F

    .line 344
    invoke-static {p1}, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->getRotationDegrees(Lcom/google/android/exoplayer2/Format;)I

    move-result v0

    iput v0, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->pendingRotationDegrees:I

    .line 345
    return-void
.end method

.method protected onOutputFormatChanged(Landroid/media/MediaCodec;Landroid/media/MediaFormat;)V
    .locals 4
    .param p1, "codec"    # Landroid/media/MediaCodec;
    .param p2, "outputFormat"    # Landroid/media/MediaFormat;

    .prologue
    .line 356
    const-string/jumbo v2, "crop-right"

    invoke-virtual {p2, v2}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    const-string/jumbo v2, "crop-left"

    .line 357
    invoke-virtual {p2, v2}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    const-string/jumbo v2, "crop-bottom"

    invoke-virtual {p2, v2}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    const-string/jumbo v2, "crop-top"

    .line 358
    invoke-virtual {p2, v2}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    const/4 v0, 0x1

    .line 359
    .local v0, "hasCrop":Z
    :goto_0
    if-eqz v0, :cond_3

    const-string/jumbo v2, "crop-right"

    .line 360
    invoke-virtual {p2, v2}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    move-result v2

    const-string/jumbo v3, "crop-left"

    invoke-virtual {p2, v3}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    move-result v3

    sub-int/2addr v2, v3

    add-int/lit8 v2, v2, 0x1

    .line 361
    :goto_1
    iput v2, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->currentWidth:I

    .line 362
    if-eqz v0, :cond_4

    const-string/jumbo v2, "crop-bottom"

    .line 363
    invoke-virtual {p2, v2}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    move-result v2

    const-string/jumbo v3, "crop-top"

    invoke-virtual {p2, v3}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    move-result v3

    sub-int/2addr v2, v3

    add-int/lit8 v2, v2, 0x1

    .line 364
    :goto_2
    iput v2, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->currentHeight:I

    .line 365
    iget v2, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->pendingPixelWidthHeightRatio:F

    iput v2, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->currentPixelWidthHeightRatio:F

    .line 366
    sget v2, Lcom/google/android/exoplayer2/util/Util;->SDK_INT:I

    const/16 v3, 0x15

    if-lt v2, v3, :cond_5

    .line 370
    iget v2, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->pendingRotationDegrees:I

    const/16 v3, 0x5a

    if-eq v2, v3, :cond_0

    iget v2, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->pendingRotationDegrees:I

    const/16 v3, 0x10e

    if-ne v2, v3, :cond_1

    .line 371
    :cond_0
    iget v1, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->currentWidth:I

    .line 372
    .local v1, "rotatedHeight":I
    iget v2, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->currentHeight:I

    iput v2, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->currentWidth:I

    .line 373
    iput v1, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->currentHeight:I

    .line 374
    const/high16 v2, 0x3f800000    # 1.0f

    iget v3, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->currentPixelWidthHeightRatio:F

    div-float/2addr v2, v3

    iput v2, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->currentPixelWidthHeightRatio:F

    .line 381
    .end local v1    # "rotatedHeight":I
    :cond_1
    :goto_3
    iget v2, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->scalingMode:I

    invoke-static {p1, v2}, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->setVideoScalingMode(Landroid/media/MediaCodec;I)V

    .line 382
    return-void

    .line 358
    .end local v0    # "hasCrop":Z
    :cond_2
    const/4 v0, 0x0

    goto :goto_0

    .line 360
    .restart local v0    # "hasCrop":Z
    :cond_3
    const-string/jumbo v2, "width"

    .line 361
    invoke-virtual {p2, v2}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    move-result v2

    goto :goto_1

    .line 363
    :cond_4
    const-string/jumbo v2, "height"

    .line 364
    invoke-virtual {p2, v2}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    move-result v2

    goto :goto_2

    .line 378
    :cond_5
    iget v2, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->pendingRotationDegrees:I

    iput v2, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->currentUnappliedRotationDegrees:I

    goto :goto_3
.end method

.method protected onPositionReset(JZ)V
    .locals 5
    .param p1, "positionUs"    # J
    .param p3, "joining"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ExoPlaybackException;
        }
    .end annotation

    .prologue
    .line 228
    invoke-super {p0, p1, p2, p3}, Lcom/google/android/exoplayer2/mediacodec/MediaCodecRenderer;->onPositionReset(JZ)V

    .line 229
    invoke-direct {p0}, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->clearRenderedFirstFrame()V

    .line 230
    const/4 v0, 0x0

    iput v0, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->consecutiveDroppedFrameCount:I

    .line 231
    if-eqz p3, :cond_0

    iget-wide v0, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->allowedJoiningTimeMs:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    .line 232
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->allowedJoiningTimeMs:J

    add-long/2addr v0, v2

    :goto_0
    iput-wide v0, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->joiningDeadlineMs:J

    .line 233
    return-void

    .line 232
    :cond_0
    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    goto :goto_0
.end method

.method protected onQueueInputBuffer(Lcom/google/android/exoplayer2/decoder/DecoderInputBuffer;)V
    .locals 2
    .param p1, "buffer"    # Lcom/google/android/exoplayer2/decoder/DecoderInputBuffer;

    .prologue
    .line 349
    sget v0, Lcom/google/android/exoplayer2/util/Util;->SDK_INT:I

    const/16 v1, 0x17

    if-ge v0, v1, :cond_0

    iget-boolean v0, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->tunneling:Z

    if-eqz v0, :cond_0

    .line 350
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->maybeNotifyRenderedFirstFrame()V

    .line 352
    :cond_0
    return-void
.end method

.method protected onStarted()V
    .locals 2

    .prologue
    .line 256
    invoke-super {p0}, Lcom/google/android/exoplayer2/mediacodec/MediaCodecRenderer;->onStarted()V

    .line 257
    const/4 v0, 0x0

    iput v0, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->droppedFrames:I

    .line 258
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->droppedFrameAccumulationStartTimeMs:J

    .line 259
    return-void
.end method

.method protected onStopped()V
    .locals 2

    .prologue
    .line 263
    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    iput-wide v0, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->joiningDeadlineMs:J

    .line 264
    invoke-direct {p0}, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->maybeNotifyDroppedFrames()V

    .line 265
    invoke-super {p0}, Lcom/google/android/exoplayer2/mediacodec/MediaCodecRenderer;->onStopped()V

    .line 266
    return-void
.end method

.method protected onStreamChanged([Lcom/google/android/exoplayer2/Format;)V
    .locals 0
    .param p1, "formats"    # [Lcom/google/android/exoplayer2/Format;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ExoPlaybackException;
        }
    .end annotation

    .prologue
    .line 222
    iput-object p1, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->streamFormats:[Lcom/google/android/exoplayer2/Format;

    .line 223
    invoke-super {p0, p1}, Lcom/google/android/exoplayer2/mediacodec/MediaCodecRenderer;->onStreamChanged([Lcom/google/android/exoplayer2/Format;)V

    .line 224
    return-void
.end method

.method protected processOutputBuffer(JJLandroid/media/MediaCodec;Ljava/nio/ByteBuffer;IIJZ)Z
    .locals 23
    .param p1, "positionUs"    # J
    .param p3, "elapsedRealtimeUs"    # J
    .param p5, "codec"    # Landroid/media/MediaCodec;
    .param p6, "buffer"    # Ljava/nio/ByteBuffer;
    .param p7, "bufferIndex"    # I
    .param p8, "bufferFlags"    # I
    .param p9, "bufferPresentationTimeUs"    # J
    .param p11, "shouldSkip"    # Z

    .prologue
    .line 398
    if-eqz p11, :cond_0

    .line 399
    move-object/from16 v0, p0

    move-object/from16 v1, p5

    move/from16 v2, p7

    invoke-direct {v0, v1, v2}, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->skipOutputBuffer(Landroid/media/MediaCodec;I)V

    .line 400
    const/4 v9, 0x1

    .line 460
    :goto_0
    return v9

    .line 403
    :cond_0
    move-object/from16 v0, p0

    iget-boolean v9, v0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->renderedFirstFrame:Z

    if-nez v9, :cond_2

    .line 404
    sget v9, Lcom/google/android/exoplayer2/util/Util;->SDK_INT:I

    const/16 v18, 0x15

    move/from16 v0, v18

    if-lt v9, v0, :cond_1

    .line 405
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v18

    move-object/from16 v0, p0

    move-object/from16 v1, p5

    move/from16 v2, p7

    move-wide/from16 v3, v18

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->renderOutputBufferV21(Landroid/media/MediaCodec;IJ)V

    .line 409
    :goto_1
    const/4 v9, 0x1

    goto :goto_0

    .line 407
    :cond_1
    move-object/from16 v0, p0

    move-object/from16 v1, p5

    move/from16 v2, p7

    invoke-direct {v0, v1, v2}, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->renderOutputBuffer(Landroid/media/MediaCodec;I)V

    goto :goto_1

    .line 412
    :cond_2
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->getState()I

    move-result v9

    const/16 v18, 0x2

    move/from16 v0, v18

    if-eq v9, v0, :cond_3

    .line 413
    const/4 v9, 0x0

    goto :goto_0

    .line 417
    :cond_3
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v18

    const-wide/16 v20, 0x3e8

    mul-long v18, v18, v20

    sub-long v12, v18, p3

    .line 418
    .local v12, "elapsedSinceStartOfLoopUs":J
    sub-long v18, p9, p1

    sub-long v10, v18, v12

    .line 421
    .local v10, "earlyUs":J
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v14

    .line 422
    .local v14, "systemTimeNs":J
    const-wide/16 v18, 0x3e8

    mul-long v18, v18, v10

    add-long v16, v14, v18

    .line 425
    .local v16, "unadjustedFrameReleaseTimeNs":J
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->frameReleaseTimeHelper:Lcom/google/android/exoplayer2/video/VideoFrameReleaseTimeHelper;

    move-wide/from16 v0, p9

    move-wide/from16 v2, v16

    invoke-virtual {v9, v0, v1, v2, v3}, Lcom/google/android/exoplayer2/video/VideoFrameReleaseTimeHelper;->adjustReleaseTime(JJ)J

    move-result-wide v6

    .line 427
    .local v6, "adjustedReleaseTimeNs":J
    sub-long v18, v6, v14

    const-wide/16 v20, 0x3e8

    div-long v10, v18, v20

    .line 429
    move-object/from16 v0, p0

    move-wide/from16 v1, p3

    invoke-virtual {v0, v10, v11, v1, v2}, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->shouldDropOutputBuffer(JJ)Z

    move-result v9

    if-eqz v9, :cond_4

    .line 431
    move-object/from16 v0, p0

    move-object/from16 v1, p5

    move/from16 v2, p7

    invoke-direct {v0, v1, v2}, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->dropOutputBuffer(Landroid/media/MediaCodec;I)V

    .line 432
    const/4 v9, 0x1

    goto :goto_0

    .line 435
    :cond_4
    sget v9, Lcom/google/android/exoplayer2/util/Util;->SDK_INT:I

    const/16 v18, 0x15

    move/from16 v0, v18

    if-lt v9, v0, :cond_5

    .line 437
    const-wide/32 v18, 0xc350

    cmp-long v9, v10, v18

    if-gez v9, :cond_7

    .line 438
    move-object/from16 v0, p0

    move-object/from16 v1, p5

    move/from16 v2, p7

    invoke-direct {v0, v1, v2, v6, v7}, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->renderOutputBufferV21(Landroid/media/MediaCodec;IJ)V

    .line 439
    const/4 v9, 0x1

    goto/16 :goto_0

    .line 443
    :cond_5
    const-wide/16 v18, 0x7530

    cmp-long v9, v10, v18

    if-gez v9, :cond_7

    .line 444
    const-wide/16 v18, 0x2af8

    cmp-long v9, v10, v18

    if-lez v9, :cond_6

    .line 449
    const-wide/16 v18, 0x2710

    sub-long v18, v10, v18

    const-wide/16 v20, 0x3e8

    :try_start_0
    div-long v18, v18, v20

    invoke-static/range {v18 .. v19}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 454
    :cond_6
    :goto_2
    move-object/from16 v0, p0

    move-object/from16 v1, p5

    move/from16 v2, p7

    invoke-direct {v0, v1, v2}, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->renderOutputBuffer(Landroid/media/MediaCodec;I)V

    .line 455
    const/4 v9, 0x1

    goto/16 :goto_0

    .line 450
    :catch_0
    move-exception v8

    .line 451
    .local v8, "e":Ljava/lang/InterruptedException;
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Thread;->interrupt()V

    goto :goto_2

    .line 460
    .end local v8    # "e":Ljava/lang/InterruptedException;
    :cond_7
    const/4 v9, 0x0

    goto/16 :goto_0
.end method

.method protected shouldDropOutputBuffer(JJ)Z
    .locals 3
    .param p1, "earlyUs"    # J
    .param p3, "elapsedRealtimeUs"    # J

    .prologue
    .line 473
    const-wide/16 v0, -0x7530

    cmp-long v0, p1, v0

    if-gez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected shouldInitCodec()Z
    .locals 1

    .prologue
    .line 318
    invoke-super {p0}, Lcom/google/android/exoplayer2/mediacodec/MediaCodecRenderer;->shouldInitCodec()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->surface:Landroid/view/Surface;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/exoplayer2/video/MediaCodecVideoRenderer;->surface:Landroid/view/Surface;

    invoke-virtual {v0}, Landroid/view/Surface;->isValid()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected supportsFormat(Lcom/google/android/exoplayer2/mediacodec/MediaCodecSelector;Lcom/google/android/exoplayer2/Format;)I
    .locals 16
    .param p1, "mediaCodecSelector"    # Lcom/google/android/exoplayer2/mediacodec/MediaCodecSelector;
    .param p2, "format"    # Lcom/google/android/exoplayer2/Format;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/mediacodec/MediaCodecUtil$DecoderQueryException;
        }
    .end annotation

    .prologue
    .line 174
    move-object/from16 v0, p2

    iget-object v8, v0, Lcom/google/android/exoplayer2/Format;->sampleMimeType:Ljava/lang/String;

    .line 175
    .local v8, "mimeType":Ljava/lang/String;
    invoke-static {v8}, Lcom/google/android/exoplayer2/util/MimeTypes;->isVideo(Ljava/lang/String;)Z

    move-result v11

    if-nez v11, :cond_0

    .line 176
    const/4 v11, 0x0

    .line 208
    :goto_0
    return v11

    .line 178
    :cond_0
    const/4 v9, 0x0

    .line 179
    .local v9, "requiresSecureDecryption":Z
    move-object/from16 v0, p2

    iget-object v5, v0, Lcom/google/android/exoplayer2/Format;->drmInitData:Lcom/google/android/exoplayer2/drm/DrmInitData;

    .line 180
    .local v5, "drmInitData":Lcom/google/android/exoplayer2/drm/DrmInitData;
    if-eqz v5, :cond_1

    .line 181
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_1
    iget v11, v5, Lcom/google/android/exoplayer2/drm/DrmInitData;->schemeDataCount:I

    if-ge v7, v11, :cond_1

    .line 182
    invoke-virtual {v5, v7}, Lcom/google/android/exoplayer2/drm/DrmInitData;->get(I)Lcom/google/android/exoplayer2/drm/DrmInitData$SchemeData;

    move-result-object v11

    iget-boolean v11, v11, Lcom/google/android/exoplayer2/drm/DrmInitData$SchemeData;->requiresSecureDecryption:Z

    or-int/2addr v9, v11

    .line 181
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    .line 185
    .end local v7    # "i":I
    :cond_1
    move-object/from16 v0, p1

    invoke-interface {v0, v8, v9}, Lcom/google/android/exoplayer2/mediacodec/MediaCodecSelector;->getDecoderInfo(Ljava/lang/String;Z)Lcom/google/android/exoplayer2/mediacodec/MediaCodecInfo;

    move-result-object v4

    .line 187
    .local v4, "decoderInfo":Lcom/google/android/exoplayer2/mediacodec/MediaCodecInfo;
    if-nez v4, :cond_2

    .line 188
    const/4 v11, 0x1

    goto :goto_0

    .line 191
    :cond_2
    move-object/from16 v0, p2

    iget-object v11, v0, Lcom/google/android/exoplayer2/Format;->codecs:Ljava/lang/String;

    invoke-virtual {v4, v11}, Lcom/google/android/exoplayer2/mediacodec/MediaCodecInfo;->isCodecSupported(Ljava/lang/String;)Z

    move-result v3

    .line 192
    .local v3, "decoderCapable":Z
    if-eqz v3, :cond_3

    move-object/from16 v0, p2

    iget v11, v0, Lcom/google/android/exoplayer2/Format;->width:I

    if-lez v11, :cond_3

    move-object/from16 v0, p2

    iget v11, v0, Lcom/google/android/exoplayer2/Format;->height:I

    if-lez v11, :cond_3

    .line 193
    sget v11, Lcom/google/android/exoplayer2/util/Util;->SDK_INT:I

    const/16 v12, 0x15

    if-lt v11, v12, :cond_4

    .line 194
    move-object/from16 v0, p2

    iget v11, v0, Lcom/google/android/exoplayer2/Format;->width:I

    move-object/from16 v0, p2

    iget v12, v0, Lcom/google/android/exoplayer2/Format;->height:I

    move-object/from16 v0, p2

    iget v13, v0, Lcom/google/android/exoplayer2/Format;->frameRate:F

    float-to-double v14, v13

    invoke-virtual {v4, v11, v12, v14, v15}, Lcom/google/android/exoplayer2/mediacodec/MediaCodecInfo;->isVideoSizeAndRateSupportedV21(IID)Z

    move-result v3

    .line 205
    :cond_3
    :goto_2
    iget-boolean v11, v4, Lcom/google/android/exoplayer2/mediacodec/MediaCodecInfo;->adaptive:Z

    if-eqz v11, :cond_6

    const/16 v2, 0x8

    .line 206
    .local v2, "adaptiveSupport":I
    :goto_3
    iget-boolean v11, v4, Lcom/google/android/exoplayer2/mediacodec/MediaCodecInfo;->tunneling:Z

    if-eqz v11, :cond_7

    const/16 v10, 0x10

    .line 207
    .local v10, "tunnelingSupport":I
    :goto_4
    if-eqz v3, :cond_8

    const/4 v6, 0x3

    .line 208
    .local v6, "formatSupport":I
    :goto_5
    or-int v11, v2, v10

    or-int/2addr v11, v6

    goto :goto_0

    .line 197
    .end local v2    # "adaptiveSupport":I
    .end local v6    # "formatSupport":I
    .end local v10    # "tunnelingSupport":I
    :cond_4
    move-object/from16 v0, p2

    iget v11, v0, Lcom/google/android/exoplayer2/Format;->width:I

    move-object/from16 v0, p2

    iget v12, v0, Lcom/google/android/exoplayer2/Format;->height:I

    mul-int/2addr v11, v12

    invoke-static {}, Lcom/google/android/exoplayer2/mediacodec/MediaCodecUtil;->maxH264DecodableFrameSize()I

    move-result v12

    if-gt v11, v12, :cond_5

    const/4 v3, 0x1

    .line 198
    :goto_6
    if-nez v3, :cond_3

    .line 199
    const-string/jumbo v11, "MediaCodecVideoRenderer"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v13, "FalseCheck [legacyFrameSize, "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    move-object/from16 v0, p2

    iget v13, v0, Lcom/google/android/exoplayer2/Format;->width:I

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string/jumbo v13, "x"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    move-object/from16 v0, p2

    iget v13, v0, Lcom/google/android/exoplayer2/Format;->height:I

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string/jumbo v13, "] ["

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    sget-object v13, Lcom/google/android/exoplayer2/util/Util;->DEVICE_DEBUG_INFO:Ljava/lang/String;

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string/jumbo v13, "]"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2

    .line 197
    :cond_5
    const/4 v3, 0x0

    goto :goto_6

    .line 205
    :cond_6
    const/4 v2, 0x4

    goto :goto_3

    .line 206
    .restart local v2    # "adaptiveSupport":I
    :cond_7
    const/4 v10, 0x0

    goto :goto_4

    .line 207
    .restart local v10    # "tunnelingSupport":I
    :cond_8
    const/4 v6, 0x2

    goto :goto_5
.end method
