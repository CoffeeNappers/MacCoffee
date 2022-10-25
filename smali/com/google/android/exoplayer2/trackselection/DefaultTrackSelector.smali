.class public Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector;
.super Lcom/google/android/exoplayer2/trackselection/MappingTrackSelector;
.source "DefaultTrackSelector.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector$Parameters;
    }
.end annotation


# static fields
.field private static final FRACTION_TO_CONSIDER_FULLSCREEN:F = 0.98f

.field private static final NO_TRACKS:[I

.field private static final WITHIN_RENDERER_CAPABILITIES_BONUS:I = 0x3e8


# instance fields
.field private final adaptiveVideoTrackSelectionFactory:Lcom/google/android/exoplayer2/trackselection/TrackSelection$Factory;

.field private final paramsReference:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector$Parameters;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 350
    const/4 v0, 0x0

    new-array v0, v0, [I

    sput-object v0, Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector;->NO_TRACKS:[I

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 360
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector;-><init>(Lcom/google/android/exoplayer2/trackselection/TrackSelection$Factory;)V

    .line 361
    return-void
.end method

.method public constructor <init>(Lcom/google/android/exoplayer2/trackselection/TrackSelection$Factory;)V
    .locals 2
    .param p1, "adaptiveVideoTrackSelectionFactory"    # Lcom/google/android/exoplayer2/trackselection/TrackSelection$Factory;

    .prologue
    .line 369
    invoke-direct {p0}, Lcom/google/android/exoplayer2/trackselection/MappingTrackSelector;-><init>()V

    .line 370
    iput-object p1, p0, Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector;->adaptiveVideoTrackSelectionFactory:Lcom/google/android/exoplayer2/trackselection/TrackSelection$Factory;

    .line 371
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    new-instance v1, Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector$Parameters;

    invoke-direct {v1}, Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector$Parameters;-><init>()V

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector;->paramsReference:Ljava/util/concurrent/atomic/AtomicReference;

    .line 372
    return-void
.end method

.method private static compareFormatValues(II)I
    .locals 1
    .param p0, "first"    # I
    .param p1, "second"    # I

    .prologue
    const/4 v0, -0x1

    .line 623
    if-ne p0, v0, :cond_1

    if-ne p1, v0, :cond_0

    const/4 v0, 0x0

    :cond_0
    :goto_0
    return v0

    :cond_1
    if-ne p1, v0, :cond_2

    const/4 v0, 0x1

    goto :goto_0

    :cond_2
    sub-int v0, p0, p1

    goto :goto_0
.end method

.method private static filterAdaptiveTrackCountForMimeType(Lcom/google/android/exoplayer2/source/TrackGroup;[IILjava/lang/String;IILjava/util/List;)V
    .locals 8
    .param p0, "group"    # Lcom/google/android/exoplayer2/source/TrackGroup;
    .param p1, "formatSupport"    # [I
    .param p2, "requiredAdaptiveSupport"    # I
    .param p3, "mimeType"    # Ljava/lang/String;
    .param p4, "maxVideoWidth"    # I
    .param p5, "maxVideoHeight"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/exoplayer2/source/TrackGroup;",
            "[II",
            "Ljava/lang/String;",
            "II",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 539
    .local p6, "selectedTrackIndices":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    invoke-interface {p6}, Ljava/util/List;->size()I

    move-result v0

    add-int/lit8 v6, v0, -0x1

    .local v6, "i":I
    :goto_0
    if-ltz v6, :cond_1

    .line 540
    invoke-interface {p6, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v7

    .line 541
    .local v7, "trackIndex":I
    invoke-virtual {p0, v7}, Lcom/google/android/exoplayer2/source/TrackGroup;->getFormat(I)Lcom/google/android/exoplayer2/Format;

    move-result-object v0

    aget v2, p1, v7

    move-object v1, p3

    move v3, p2

    move v4, p4

    move v5, p5

    invoke-static/range {v0 .. v5}, Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector;->isSupportedAdaptiveVideoTrack(Lcom/google/android/exoplayer2/Format;Ljava/lang/String;IIII)Z

    move-result v0

    if-nez v0, :cond_0

    .line 543
    invoke-interface {p6, v6}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 539
    :cond_0
    add-int/lit8 v6, v6, -0x1

    goto :goto_0

    .line 546
    .end local v7    # "trackIndex":I
    :cond_1
    return-void
.end method

.method protected static formatHasLanguage(Lcom/google/android/exoplayer2/Format;Ljava/lang/String;)Z
    .locals 1
    .param p0, "format"    # Lcom/google/android/exoplayer2/Format;
    .param p1, "language"    # Ljava/lang/String;

    .prologue
    .line 760
    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/google/android/exoplayer2/Format;->language:Ljava/lang/String;

    invoke-static {v0}, Lcom/google/android/exoplayer2/util/Util;->normalizeLanguageCode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static getAdaptiveTrackCountForMimeType(Lcom/google/android/exoplayer2/source/TrackGroup;[IILjava/lang/String;IILjava/util/List;)I
    .locals 9
    .param p0, "group"    # Lcom/google/android/exoplayer2/source/TrackGroup;
    .param p1, "formatSupport"    # [I
    .param p2, "requiredAdaptiveSupport"    # I
    .param p3, "mimeType"    # Ljava/lang/String;
    .param p4, "maxVideoWidth"    # I
    .param p5, "maxVideoHeight"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/exoplayer2/source/TrackGroup;",
            "[II",
            "Ljava/lang/String;",
            "II",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;)I"
        }
    .end annotation

    .prologue
    .line 525
    .local p6, "selectedTrackIndices":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    const/4 v6, 0x0

    .line 526
    .local v6, "adaptiveTrackCount":I
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_0
    invoke-interface {p6}, Ljava/util/List;->size()I

    move-result v0

    if-ge v7, v0, :cond_1

    .line 527
    invoke-interface {p6, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v8

    .line 528
    .local v8, "trackIndex":I
    invoke-virtual {p0, v8}, Lcom/google/android/exoplayer2/source/TrackGroup;->getFormat(I)Lcom/google/android/exoplayer2/Format;

    move-result-object v0

    aget v2, p1, v8

    move-object v1, p3

    move v3, p2

    move v4, p4

    move v5, p5

    invoke-static/range {v0 .. v5}, Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector;->isSupportedAdaptiveVideoTrack(Lcom/google/android/exoplayer2/Format;Ljava/lang/String;IIII)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 530
    add-int/lit8 v6, v6, 0x1

    .line 526
    :cond_0
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 533
    .end local v8    # "trackIndex":I
    :cond_1
    return v6
.end method

.method private static getAdaptiveTracksForGroup(Lcom/google/android/exoplayer2/source/TrackGroup;[IZIIIIIZ)[I
    .locals 23
    .param p0, "group"    # Lcom/google/android/exoplayer2/source/TrackGroup;
    .param p1, "formatSupport"    # [I
    .param p2, "allowMixedMimeTypes"    # Z
    .param p3, "requiredAdaptiveSupport"    # I
    .param p4, "maxVideoWidth"    # I
    .param p5, "maxVideoHeight"    # I
    .param p6, "viewportWidth"    # I
    .param p7, "viewportHeight"    # I
    .param p8, "orientationMayChange"    # Z

    .prologue
    .line 484
    move-object/from16 v0, p0

    iget v4, v0, Lcom/google/android/exoplayer2/source/TrackGroup;->length:I

    const/4 v5, 0x2

    if-ge v4, v5, :cond_0

    .line 485
    sget-object v4, Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector;->NO_TRACKS:[I

    .line 519
    :goto_0
    return-object v4

    .line 488
    :cond_0
    move-object/from16 v0, p0

    move/from16 v1, p6

    move/from16 v2, p7

    move/from16 v3, p8

    invoke-static {v0, v1, v2, v3}, Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector;->getViewportFilteredTrackIndices(Lcom/google/android/exoplayer2/source/TrackGroup;IIZ)Ljava/util/List;

    move-result-object v10

    .line 490
    .local v10, "selectedTrackIndices":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    invoke-interface {v10}, Ljava/util/List;->size()I

    move-result v4

    const/4 v5, 0x2

    if-ge v4, v5, :cond_1

    .line 491
    sget-object v4, Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector;->NO_TRACKS:[I

    goto :goto_0

    .line 494
    :cond_1
    const/4 v14, 0x0

    .line 495
    .local v14, "selectedMimeType":Ljava/lang/String;
    if-nez p2, :cond_3

    .line 497
    new-instance v20, Ljava/util/HashSet;

    invoke-direct/range {v20 .. v20}, Ljava/util/HashSet;-><init>()V

    .line 498
    .local v20, "seenMimeTypes":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    const/16 v21, 0x0

    .line 499
    .local v21, "selectedMimeTypeTrackCount":I
    const/16 v19, 0x0

    .local v19, "i":I
    :goto_1
    invoke-interface {v10}, Ljava/util/List;->size()I

    move-result v4

    move/from16 v0, v19

    if-ge v0, v4, :cond_3

    .line 500
    move/from16 v0, v19

    invoke-interface {v10, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v22

    .line 501
    .local v22, "trackIndex":I
    move-object/from16 v0, p0

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/source/TrackGroup;->getFormat(I)Lcom/google/android/exoplayer2/Format;

    move-result-object v4

    iget-object v7, v4, Lcom/google/android/exoplayer2/Format;->sampleMimeType:Ljava/lang/String;

    .line 502
    .local v7, "sampleMimeType":Ljava/lang/String;
    move-object/from16 v0, v20

    invoke-virtual {v0, v7}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_2

    .line 503
    move-object/from16 v0, v20

    invoke-virtual {v0, v7}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    move-object/from16 v4, p0

    move-object/from16 v5, p1

    move/from16 v6, p3

    move/from16 v8, p4

    move/from16 v9, p5

    .line 504
    invoke-static/range {v4 .. v10}, Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector;->getAdaptiveTrackCountForMimeType(Lcom/google/android/exoplayer2/source/TrackGroup;[IILjava/lang/String;IILjava/util/List;)I

    move-result v18

    .line 507
    .local v18, "countForMimeType":I
    move/from16 v0, v18

    move/from16 v1, v21

    if-le v0, v1, :cond_2

    .line 508
    move-object v14, v7

    .line 509
    move/from16 v21, v18

    .line 499
    .end local v18    # "countForMimeType":I
    :cond_2
    add-int/lit8 v19, v19, 0x1

    goto :goto_1

    .end local v7    # "sampleMimeType":Ljava/lang/String;
    .end local v19    # "i":I
    .end local v20    # "seenMimeTypes":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    .end local v21    # "selectedMimeTypeTrackCount":I
    .end local v22    # "trackIndex":I
    :cond_3
    move-object/from16 v11, p0

    move-object/from16 v12, p1

    move/from16 v13, p3

    move/from16 v15, p4

    move/from16 v16, p5

    move-object/from16 v17, v10

    .line 516
    invoke-static/range {v11 .. v17}, Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector;->filterAdaptiveTrackCountForMimeType(Lcom/google/android/exoplayer2/source/TrackGroup;[IILjava/lang/String;IILjava/util/List;)V

    .line 519
    invoke-interface {v10}, Ljava/util/List;->size()I

    move-result v4

    const/4 v5, 0x2

    if-ge v4, v5, :cond_4

    sget-object v4, Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector;->NO_TRACKS:[I

    goto :goto_0

    :cond_4
    invoke-static {v10}, Lcom/google/android/exoplayer2/util/Util;->toArray(Ljava/util/List;)[I

    move-result-object v4

    goto/16 :goto_0
.end method

.method private static getMaxVideoSizeInViewport(ZIIII)Landroid/graphics/Point;
    .locals 4
    .param p0, "orientationMayChange"    # Z
    .param p1, "viewportWidth"    # I
    .param p2, "viewportHeight"    # I
    .param p3, "videoWidth"    # I
    .param p4, "videoHeight"    # I

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 818
    if-eqz p0, :cond_0

    if-le p3, p4, :cond_1

    move v3, v1

    :goto_0
    if-le p1, p2, :cond_2

    :goto_1
    if-eq v3, v1, :cond_0

    .line 820
    move v0, p1

    .line 821
    .local v0, "tempViewportWidth":I
    move p1, p2

    .line 822
    move p2, v0

    .line 825
    .end local v0    # "tempViewportWidth":I
    :cond_0
    mul-int v1, p3, p2

    mul-int v2, p4, p1

    if-lt v1, v2, :cond_3

    .line 827
    new-instance v1, Landroid/graphics/Point;

    mul-int v2, p1, p4

    invoke-static {v2, p3}, Lcom/google/android/exoplayer2/util/Util;->ceilDivide(II)I

    move-result v2

    invoke-direct {v1, p1, v2}, Landroid/graphics/Point;-><init>(II)V

    .line 830
    :goto_2
    return-object v1

    :cond_1
    move v3, v2

    .line 818
    goto :goto_0

    :cond_2
    move v1, v2

    goto :goto_1

    .line 830
    :cond_3
    new-instance v1, Landroid/graphics/Point;

    mul-int v2, p2, p3

    invoke-static {v2, p4}, Lcom/google/android/exoplayer2/util/Util;->ceilDivide(II)I

    move-result v2

    invoke-direct {v1, v2, p2}, Landroid/graphics/Point;-><init>(II)V

    goto :goto_2
.end method

.method private static getViewportFilteredTrackIndices(Lcom/google/android/exoplayer2/source/TrackGroup;IIZ)Ljava/util/List;
    .locals 11
    .param p0, "group"    # Lcom/google/android/exoplayer2/source/TrackGroup;
    .param p1, "viewportWidth"    # I
    .param p2, "viewportHeight"    # I
    .param p3, "orientationMayChange"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/exoplayer2/source/TrackGroup;",
            "IIZ)",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    const v10, 0x3f7ae148    # 0.98f

    const v9, 0x7fffffff

    .line 768
    new-instance v5, Ljava/util/ArrayList;

    iget v7, p0, Lcom/google/android/exoplayer2/source/TrackGroup;->length:I

    invoke-direct {v5, v7}, Ljava/util/ArrayList;-><init>(I)V

    .line 769
    .local v5, "selectedTrackIndices":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget v7, p0, Lcom/google/android/exoplayer2/source/TrackGroup;->length:I

    if-ge v1, v7, :cond_0

    .line 770
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v5, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 769
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 773
    :cond_0
    if-eq p1, v9, :cond_1

    if-ne p2, v9, :cond_2

    .line 809
    :cond_1
    return-object v5

    .line 778
    :cond_2
    const v2, 0x7fffffff

    .line 779
    .local v2, "maxVideoPixelsToRetain":I
    const/4 v1, 0x0

    :goto_1
    iget v7, p0, Lcom/google/android/exoplayer2/source/TrackGroup;->length:I

    if-ge v1, v7, :cond_4

    .line 780
    invoke-virtual {p0, v1}, Lcom/google/android/exoplayer2/source/TrackGroup;->getFormat(I)Lcom/google/android/exoplayer2/Format;

    move-result-object v0

    .line 784
    .local v0, "format":Lcom/google/android/exoplayer2/Format;
    iget v7, v0, Lcom/google/android/exoplayer2/Format;->width:I

    if-lez v7, :cond_3

    iget v7, v0, Lcom/google/android/exoplayer2/Format;->height:I

    if-lez v7, :cond_3

    .line 785
    iget v7, v0, Lcom/google/android/exoplayer2/Format;->width:I

    iget v8, v0, Lcom/google/android/exoplayer2/Format;->height:I

    invoke-static {p3, p1, p2, v7, v8}, Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector;->getMaxVideoSizeInViewport(ZIIII)Landroid/graphics/Point;

    move-result-object v3

    .line 787
    .local v3, "maxVideoSizeInViewport":Landroid/graphics/Point;
    iget v7, v0, Lcom/google/android/exoplayer2/Format;->width:I

    iget v8, v0, Lcom/google/android/exoplayer2/Format;->height:I

    mul-int v6, v7, v8

    .line 788
    .local v6, "videoPixels":I
    iget v7, v0, Lcom/google/android/exoplayer2/Format;->width:I

    iget v8, v3, Landroid/graphics/Point;->x:I

    int-to-float v8, v8

    mul-float/2addr v8, v10

    float-to-int v8, v8

    if-lt v7, v8, :cond_3

    iget v7, v0, Lcom/google/android/exoplayer2/Format;->height:I

    iget v8, v3, Landroid/graphics/Point;->y:I

    int-to-float v8, v8

    mul-float/2addr v8, v10

    float-to-int v8, v8

    if-lt v7, v8, :cond_3

    if-ge v6, v2, :cond_3

    .line 791
    move v2, v6

    .line 779
    .end local v3    # "maxVideoSizeInViewport":Landroid/graphics/Point;
    .end local v6    # "videoPixels":I
    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 799
    .end local v0    # "format":Lcom/google/android/exoplayer2/Format;
    :cond_4
    if-eq v2, v9, :cond_1

    .line 800
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v7

    add-int/lit8 v1, v7, -0x1

    :goto_2
    if-ltz v1, :cond_1

    .line 801
    invoke-virtual {v5, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Integer;

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    invoke-virtual {p0, v7}, Lcom/google/android/exoplayer2/source/TrackGroup;->getFormat(I)Lcom/google/android/exoplayer2/Format;

    move-result-object v0

    .line 802
    .restart local v0    # "format":Lcom/google/android/exoplayer2/Format;
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/Format;->getPixelCount()I

    move-result v4

    .line 803
    .local v4, "pixelCount":I
    const/4 v7, -0x1

    if-eq v4, v7, :cond_5

    if-le v4, v2, :cond_6

    .line 804
    :cond_5
    invoke-virtual {v5, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 800
    :cond_6
    add-int/lit8 v1, v1, -0x1

    goto :goto_2
.end method

.method protected static isSupported(IZ)Z
    .locals 2
    .param p0, "formatSupport"    # I
    .param p1, "allowExceedsCapabilities"    # Z

    .prologue
    .line 754
    and-int/lit8 v0, p0, 0x3

    .line 755
    .local v0, "maskedSupport":I
    const/4 v1, 0x3

    if-eq v0, v1, :cond_0

    if-eqz p1, :cond_1

    const/4 v1, 0x2

    if-ne v0, v1, :cond_1

    :cond_0
    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private static isSupportedAdaptiveVideoTrack(Lcom/google/android/exoplayer2/Format;Ljava/lang/String;IIII)Z
    .locals 3
    .param p0, "format"    # Lcom/google/android/exoplayer2/Format;
    .param p1, "mimeType"    # Ljava/lang/String;
    .param p2, "formatSupport"    # I
    .param p3, "requiredAdaptiveSupport"    # I
    .param p4, "maxVideoWidth"    # I
    .param p5, "maxVideoHeight"    # I

    .prologue
    const/4 v0, 0x0

    const/4 v2, -0x1

    .line 550
    invoke-static {p2, v0}, Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector;->isSupported(IZ)Z

    move-result v1

    if-eqz v1, :cond_3

    and-int v1, p2, p3

    if-eqz v1, :cond_3

    if-eqz p1, :cond_0

    iget-object v1, p0, Lcom/google/android/exoplayer2/Format;->sampleMimeType:Ljava/lang/String;

    .line 551
    invoke-static {v1, p1}, Lcom/google/android/exoplayer2/util/Util;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    :cond_0
    iget v1, p0, Lcom/google/android/exoplayer2/Format;->width:I

    if-eq v1, v2, :cond_1

    iget v1, p0, Lcom/google/android/exoplayer2/Format;->width:I

    if-gt v1, p4, :cond_3

    :cond_1
    iget v1, p0, Lcom/google/android/exoplayer2/Format;->height:I

    if-eq v1, v2, :cond_2

    iget v1, p0, Lcom/google/android/exoplayer2/Format;->height:I

    if-gt v1, p5, :cond_3

    :cond_2
    const/4 v0, 0x1

    :cond_3
    return v0
.end method

.method private static selectAdaptiveVideoTrack(Lcom/google/android/exoplayer2/RendererCapabilities;Lcom/google/android/exoplayer2/source/TrackGroupArray;[[IIIZZIIZLcom/google/android/exoplayer2/trackselection/TrackSelection$Factory;)Lcom/google/android/exoplayer2/trackselection/TrackSelection;
    .locals 12
    .param p0, "rendererCapabilities"    # Lcom/google/android/exoplayer2/RendererCapabilities;
    .param p1, "groups"    # Lcom/google/android/exoplayer2/source/TrackGroupArray;
    .param p2, "formatSupport"    # [[I
    .param p3, "maxVideoWidth"    # I
    .param p4, "maxVideoHeight"    # I
    .param p5, "allowNonSeamlessAdaptiveness"    # Z
    .param p6, "allowMixedMimeAdaptiveness"    # Z
    .param p7, "viewportWidth"    # I
    .param p8, "viewportHeight"    # I
    .param p9, "orientationMayChange"    # Z
    .param p10, "adaptiveVideoTrackSelectionFactory"    # Lcom/google/android/exoplayer2/trackselection/TrackSelection$Factory;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ExoPlaybackException;
        }
    .end annotation

    .prologue
    .line 464
    if-eqz p5, :cond_0

    const/16 v4, 0xc

    .line 467
    .local v4, "requiredAdaptiveSupport":I
    :goto_0
    if-eqz p6, :cond_1

    .line 468
    invoke-interface {p0}, Lcom/google/android/exoplayer2/RendererCapabilities;->supportsMixedMimeTypeAdaptation()I

    move-result v2

    and-int/2addr v2, v4

    if-eqz v2, :cond_1

    const/4 v3, 0x1

    .line 469
    .local v3, "allowMixedMimeTypes":Z
    :goto_1
    const/4 v11, 0x0

    .local v11, "i":I
    :goto_2
    iget v2, p1, Lcom/google/android/exoplayer2/source/TrackGroupArray;->length:I

    if-ge v11, v2, :cond_3

    .line 470
    invoke-virtual {p1, v11}, Lcom/google/android/exoplayer2/source/TrackGroupArray;->get(I)Lcom/google/android/exoplayer2/source/TrackGroup;

    move-result-object v1

    .line 471
    .local v1, "group":Lcom/google/android/exoplayer2/source/TrackGroup;
    aget-object v2, p2, v11

    move v5, p3

    move/from16 v6, p4

    move/from16 v7, p7

    move/from16 v8, p8

    move/from16 v9, p9

    invoke-static/range {v1 .. v9}, Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector;->getAdaptiveTracksForGroup(Lcom/google/android/exoplayer2/source/TrackGroup;[IZIIIIIZ)[I

    move-result-object v10

    .line 474
    .local v10, "adaptiveTracks":[I
    array-length v2, v10

    if-lez v2, :cond_2

    .line 475
    move-object/from16 v0, p10

    invoke-interface {v0, v1, v10}, Lcom/google/android/exoplayer2/trackselection/TrackSelection$Factory;->createTrackSelection(Lcom/google/android/exoplayer2/source/TrackGroup;[I)Lcom/google/android/exoplayer2/trackselection/TrackSelection;

    move-result-object v2

    .line 478
    .end local v1    # "group":Lcom/google/android/exoplayer2/source/TrackGroup;
    .end local v10    # "adaptiveTracks":[I
    :goto_3
    return-object v2

    .line 464
    .end local v3    # "allowMixedMimeTypes":Z
    .end local v4    # "requiredAdaptiveSupport":I
    .end local v11    # "i":I
    :cond_0
    const/16 v4, 0x8

    goto :goto_0

    .line 468
    .restart local v4    # "requiredAdaptiveSupport":I
    :cond_1
    const/4 v3, 0x0

    goto :goto_1

    .line 469
    .restart local v1    # "group":Lcom/google/android/exoplayer2/source/TrackGroup;
    .restart local v3    # "allowMixedMimeTypes":Z
    .restart local v10    # "adaptiveTracks":[I
    .restart local v11    # "i":I
    :cond_2
    add-int/lit8 v11, v11, 0x1

    goto :goto_2

    .line 478
    .end local v1    # "group":Lcom/google/android/exoplayer2/source/TrackGroup;
    .end local v10    # "adaptiveTracks":[I
    :cond_3
    const/4 v2, 0x0

    goto :goto_3
.end method

.method private static selectFixedVideoTrack(Lcom/google/android/exoplayer2/source/TrackGroupArray;[[IIIIIZZZ)Lcom/google/android/exoplayer2/trackselection/TrackSelection;
    .locals 22
    .param p0, "groups"    # Lcom/google/android/exoplayer2/source/TrackGroupArray;
    .param p1, "formatSupport"    # [[I
    .param p2, "maxVideoWidth"    # I
    .param p3, "maxVideoHeight"    # I
    .param p4, "viewportWidth"    # I
    .param p5, "viewportHeight"    # I
    .param p6, "orientationMayChange"    # Z
    .param p7, "exceedConstraintsIfNecessary"    # Z
    .param p8, "exceedRendererCapabilitiesIfNecessary"    # Z

    .prologue
    .line 560
    const/4 v11, 0x0

    .line 561
    .local v11, "selectedGroup":Lcom/google/android/exoplayer2/source/TrackGroup;
    const/4 v13, 0x0

    .line 562
    .local v13, "selectedTrackIndex":I
    const/4 v15, 0x0

    .line 563
    .local v15, "selectedTrackScore":I
    const/4 v10, -0x1

    .line 564
    .local v10, "selectedBitrate":I
    const/4 v12, -0x1

    .line 565
    .local v12, "selectedPixelCount":I
    const/4 v7, 0x0

    .local v7, "groupIndex":I
    :goto_0
    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/exoplayer2/source/TrackGroupArray;->length:I

    move/from16 v20, v0

    move/from16 v0, v20

    if-ge v7, v0, :cond_e

    .line 566
    move-object/from16 v0, p0

    invoke-virtual {v0, v7}, Lcom/google/android/exoplayer2/source/TrackGroupArray;->get(I)Lcom/google/android/exoplayer2/source/TrackGroup;

    move-result-object v17

    .line 567
    .local v17, "trackGroup":Lcom/google/android/exoplayer2/source/TrackGroup;
    move-object/from16 v0, v17

    move/from16 v1, p4

    move/from16 v2, p5

    move/from16 v3, p6

    invoke-static {v0, v1, v2, v3}, Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector;->getViewportFilteredTrackIndices(Lcom/google/android/exoplayer2/source/TrackGroup;IIZ)Ljava/util/List;

    move-result-object v14

    .line 569
    .local v14, "selectedTrackIndices":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    aget-object v16, p1, v7

    .line 570
    .local v16, "trackFormatSupport":[I
    const/16 v18, 0x0

    .local v18, "trackIndex":I
    :goto_1
    move-object/from16 v0, v17

    iget v0, v0, Lcom/google/android/exoplayer2/source/TrackGroup;->length:I

    move/from16 v20, v0

    move/from16 v0, v18

    move/from16 v1, v20

    if-ge v0, v1, :cond_d

    .line 571
    aget v20, v16, v18

    move/from16 v0, v20

    move/from16 v1, p8

    invoke-static {v0, v1}, Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector;->isSupported(IZ)Z

    move-result v20

    if-eqz v20, :cond_2

    .line 572
    invoke-virtual/range {v17 .. v18}, Lcom/google/android/exoplayer2/source/TrackGroup;->getFormat(I)Lcom/google/android/exoplayer2/Format;

    move-result-object v5

    .line 573
    .local v5, "format":Lcom/google/android/exoplayer2/Format;
    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-interface {v14, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v20

    if-eqz v20, :cond_3

    iget v0, v5, Lcom/google/android/exoplayer2/Format;->width:I

    move/from16 v20, v0

    const/16 v21, -0x1

    move/from16 v0, v20

    move/from16 v1, v21

    if-eq v0, v1, :cond_0

    iget v0, v5, Lcom/google/android/exoplayer2/Format;->width:I

    move/from16 v20, v0

    move/from16 v0, v20

    move/from16 v1, p2

    if-gt v0, v1, :cond_3

    :cond_0
    iget v0, v5, Lcom/google/android/exoplayer2/Format;->height:I

    move/from16 v20, v0

    const/16 v21, -0x1

    move/from16 v0, v20

    move/from16 v1, v21

    if-eq v0, v1, :cond_1

    iget v0, v5, Lcom/google/android/exoplayer2/Format;->height:I

    move/from16 v20, v0

    move/from16 v0, v20

    move/from16 v1, p3

    if-gt v0, v1, :cond_3

    :cond_1
    const/4 v8, 0x1

    .line 576
    .local v8, "isWithinConstraints":Z
    :goto_2
    if-nez v8, :cond_4

    if-nez p7, :cond_4

    .line 570
    .end local v5    # "format":Lcom/google/android/exoplayer2/Format;
    .end local v8    # "isWithinConstraints":Z
    :cond_2
    :goto_3
    add-int/lit8 v18, v18, 0x1

    goto :goto_1

    .line 573
    .restart local v5    # "format":Lcom/google/android/exoplayer2/Format;
    :cond_3
    const/4 v8, 0x0

    goto :goto_2

    .line 580
    .restart local v8    # "isWithinConstraints":Z
    :cond_4
    if-eqz v8, :cond_7

    const/16 v19, 0x2

    .line 581
    .local v19, "trackScore":I
    :goto_4
    aget v20, v16, v18

    const/16 v21, 0x0

    invoke-static/range {v20 .. v21}, Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector;->isSupported(IZ)Z

    move-result v20

    if-eqz v20, :cond_5

    .line 582
    move/from16 v0, v19

    add-int/lit16 v0, v0, 0x3e8

    move/from16 v19, v0

    .line 584
    :cond_5
    move/from16 v0, v19

    if-le v0, v15, :cond_8

    const/4 v9, 0x1

    .line 585
    .local v9, "selectTrack":Z
    :goto_5
    move/from16 v0, v19

    if-ne v0, v15, :cond_6

    .line 591
    invoke-virtual {v5}, Lcom/google/android/exoplayer2/Format;->getPixelCount()I

    move-result v6

    .line 592
    .local v6, "formatPixelCount":I
    if-eq v6, v12, :cond_9

    .line 593
    invoke-virtual {v5}, Lcom/google/android/exoplayer2/Format;->getPixelCount()I

    move-result v20

    move/from16 v0, v20

    invoke-static {v0, v12}, Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector;->compareFormatValues(II)I

    move-result v4

    .line 597
    .local v4, "comparisonResult":I
    :goto_6
    if-eqz v8, :cond_b

    if-lez v4, :cond_a

    const/4 v9, 0x1

    .line 599
    .end local v4    # "comparisonResult":I
    .end local v6    # "formatPixelCount":I
    :cond_6
    :goto_7
    if-eqz v9, :cond_2

    .line 600
    move-object/from16 v11, v17

    .line 601
    move/from16 v13, v18

    .line 602
    move/from16 v15, v19

    .line 603
    iget v10, v5, Lcom/google/android/exoplayer2/Format;->bitrate:I

    .line 604
    invoke-virtual {v5}, Lcom/google/android/exoplayer2/Format;->getPixelCount()I

    move-result v12

    goto :goto_3

    .line 580
    .end local v9    # "selectTrack":Z
    .end local v19    # "trackScore":I
    :cond_7
    const/16 v19, 0x1

    goto :goto_4

    .line 584
    .restart local v19    # "trackScore":I
    :cond_8
    const/4 v9, 0x0

    goto :goto_5

    .line 595
    .restart local v6    # "formatPixelCount":I
    .restart local v9    # "selectTrack":Z
    :cond_9
    iget v0, v5, Lcom/google/android/exoplayer2/Format;->bitrate:I

    move/from16 v20, v0

    move/from16 v0, v20

    invoke-static {v0, v10}, Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector;->compareFormatValues(II)I

    move-result v4

    .restart local v4    # "comparisonResult":I
    goto :goto_6

    .line 597
    :cond_a
    const/4 v9, 0x0

    goto :goto_7

    :cond_b
    if-gez v4, :cond_c

    const/4 v9, 0x1

    goto :goto_7

    :cond_c
    const/4 v9, 0x0

    goto :goto_7

    .line 565
    .end local v4    # "comparisonResult":I
    .end local v5    # "format":Lcom/google/android/exoplayer2/Format;
    .end local v6    # "formatPixelCount":I
    .end local v8    # "isWithinConstraints":Z
    .end local v9    # "selectTrack":Z
    .end local v19    # "trackScore":I
    :cond_d
    add-int/lit8 v7, v7, 0x1

    goto/16 :goto_0

    .line 609
    .end local v14    # "selectedTrackIndices":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    .end local v16    # "trackFormatSupport":[I
    .end local v17    # "trackGroup":Lcom/google/android/exoplayer2/source/TrackGroup;
    .end local v18    # "trackIndex":I
    :cond_e
    if-nez v11, :cond_f

    const/16 v20, 0x0

    :goto_8
    return-object v20

    :cond_f
    new-instance v20, Lcom/google/android/exoplayer2/trackselection/FixedTrackSelection;

    move-object/from16 v0, v20

    invoke-direct {v0, v11, v13}, Lcom/google/android/exoplayer2/trackselection/FixedTrackSelection;-><init>(Lcom/google/android/exoplayer2/source/TrackGroup;I)V

    goto :goto_8
.end method


# virtual methods
.method public getParameters()Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector$Parameters;
    .locals 1

    .prologue
    .line 392
    iget-object v0, p0, Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector;->paramsReference:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector$Parameters;

    return-object v0
.end method

.method protected selectAudioTrack(Lcom/google/android/exoplayer2/source/TrackGroupArray;[[ILjava/lang/String;Z)Lcom/google/android/exoplayer2/trackselection/TrackSelection;
    .locals 13
    .param p1, "groups"    # Lcom/google/android/exoplayer2/source/TrackGroupArray;
    .param p2, "formatSupport"    # [[I
    .param p3, "preferredAudioLanguage"    # Ljava/lang/String;
    .param p4, "exceedRendererCapabilitiesIfNecessary"    # Z

    .prologue
    .line 631
    const/4 v4, 0x0

    .line 632
    .local v4, "selectedGroup":Lcom/google/android/exoplayer2/source/TrackGroup;
    const/4 v5, 0x0

    .line 633
    .local v5, "selectedTrackIndex":I
    const/4 v6, 0x0

    .line 634
    .local v6, "selectedTrackScore":I
    const/4 v2, 0x0

    .local v2, "groupIndex":I
    :goto_0
    iget v11, p1, Lcom/google/android/exoplayer2/source/TrackGroupArray;->length:I

    if-ge v2, v11, :cond_7

    .line 635
    invoke-virtual {p1, v2}, Lcom/google/android/exoplayer2/source/TrackGroupArray;->get(I)Lcom/google/android/exoplayer2/source/TrackGroup;

    move-result-object v8

    .line 636
    .local v8, "trackGroup":Lcom/google/android/exoplayer2/source/TrackGroup;
    aget-object v7, p2, v2

    .line 637
    .local v7, "trackFormatSupport":[I
    const/4 v9, 0x0

    .local v9, "trackIndex":I
    :goto_1
    iget v11, v8, Lcom/google/android/exoplayer2/source/TrackGroup;->length:I

    if-ge v9, v11, :cond_6

    .line 638
    aget v11, v7, v9

    move/from16 v0, p4

    invoke-static {v11, v0}, Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector;->isSupported(IZ)Z

    move-result v11

    if-eqz v11, :cond_1

    .line 639
    invoke-virtual {v8, v9}, Lcom/google/android/exoplayer2/source/TrackGroup;->getFormat(I)Lcom/google/android/exoplayer2/Format;

    move-result-object v1

    .line 640
    .local v1, "format":Lcom/google/android/exoplayer2/Format;
    iget v11, v1, Lcom/google/android/exoplayer2/Format;->selectionFlags:I

    and-int/lit8 v11, v11, 0x1

    if-eqz v11, :cond_2

    const/4 v3, 0x1

    .line 642
    .local v3, "isDefault":Z
    :goto_2
    move-object/from16 v0, p3

    invoke-static {v1, v0}, Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector;->formatHasLanguage(Lcom/google/android/exoplayer2/Format;Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_4

    .line 643
    if-eqz v3, :cond_3

    .line 644
    const/4 v10, 0x4

    .line 653
    .local v10, "trackScore":I
    :goto_3
    aget v11, v7, v9

    const/4 v12, 0x0

    invoke-static {v11, v12}, Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector;->isSupported(IZ)Z

    move-result v11

    if-eqz v11, :cond_0

    .line 654
    add-int/lit16 v10, v10, 0x3e8

    .line 656
    :cond_0
    if-le v10, v6, :cond_1

    .line 657
    move-object v4, v8

    .line 658
    move v5, v9

    .line 659
    move v6, v10

    .line 637
    .end local v1    # "format":Lcom/google/android/exoplayer2/Format;
    .end local v3    # "isDefault":Z
    .end local v10    # "trackScore":I
    :cond_1
    add-int/lit8 v9, v9, 0x1

    goto :goto_1

    .line 640
    .restart local v1    # "format":Lcom/google/android/exoplayer2/Format;
    :cond_2
    const/4 v3, 0x0

    goto :goto_2

    .line 646
    .restart local v3    # "isDefault":Z
    :cond_3
    const/4 v10, 0x3

    .restart local v10    # "trackScore":I
    goto :goto_3

    .line 648
    .end local v10    # "trackScore":I
    :cond_4
    if-eqz v3, :cond_5

    .line 649
    const/4 v10, 0x2

    .restart local v10    # "trackScore":I
    goto :goto_3

    .line 651
    .end local v10    # "trackScore":I
    :cond_5
    const/4 v10, 0x1

    .restart local v10    # "trackScore":I
    goto :goto_3

    .line 634
    .end local v1    # "format":Lcom/google/android/exoplayer2/Format;
    .end local v3    # "isDefault":Z
    .end local v10    # "trackScore":I
    :cond_6
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 664
    .end local v7    # "trackFormatSupport":[I
    .end local v8    # "trackGroup":Lcom/google/android/exoplayer2/source/TrackGroup;
    .end local v9    # "trackIndex":I
    :cond_7
    if-nez v4, :cond_8

    const/4 v11, 0x0

    :goto_4
    return-object v11

    :cond_8
    new-instance v11, Lcom/google/android/exoplayer2/trackselection/FixedTrackSelection;

    invoke-direct {v11, v4, v5}, Lcom/google/android/exoplayer2/trackselection/FixedTrackSelection;-><init>(Lcom/google/android/exoplayer2/source/TrackGroup;I)V

    goto :goto_4
.end method

.method protected selectOtherTrack(ILcom/google/android/exoplayer2/source/TrackGroupArray;[[IZ)Lcom/google/android/exoplayer2/trackselection/TrackSelection;
    .locals 13
    .param p1, "trackType"    # I
    .param p2, "groups"    # Lcom/google/android/exoplayer2/source/TrackGroupArray;
    .param p3, "formatSupport"    # [[I
    .param p4, "exceedRendererCapabilitiesIfNecessary"    # Z

    .prologue
    .line 727
    const/4 v4, 0x0

    .line 728
    .local v4, "selectedGroup":Lcom/google/android/exoplayer2/source/TrackGroup;
    const/4 v5, 0x0

    .line 729
    .local v5, "selectedTrackIndex":I
    const/4 v6, 0x0

    .line 730
    .local v6, "selectedTrackScore":I
    const/4 v2, 0x0

    .local v2, "groupIndex":I
    :goto_0
    iget v11, p2, Lcom/google/android/exoplayer2/source/TrackGroupArray;->length:I

    if-ge v2, v11, :cond_5

    .line 731
    invoke-virtual {p2, v2}, Lcom/google/android/exoplayer2/source/TrackGroupArray;->get(I)Lcom/google/android/exoplayer2/source/TrackGroup;

    move-result-object v8

    .line 732
    .local v8, "trackGroup":Lcom/google/android/exoplayer2/source/TrackGroup;
    aget-object v7, p3, v2

    .line 733
    .local v7, "trackFormatSupport":[I
    const/4 v9, 0x0

    .local v9, "trackIndex":I
    :goto_1
    iget v11, v8, Lcom/google/android/exoplayer2/source/TrackGroup;->length:I

    if-ge v9, v11, :cond_4

    .line 734
    aget v11, v7, v9

    move/from16 v0, p4

    invoke-static {v11, v0}, Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector;->isSupported(IZ)Z

    move-result v11

    if-eqz v11, :cond_1

    .line 735
    invoke-virtual {v8, v9}, Lcom/google/android/exoplayer2/source/TrackGroup;->getFormat(I)Lcom/google/android/exoplayer2/Format;

    move-result-object v1

    .line 736
    .local v1, "format":Lcom/google/android/exoplayer2/Format;
    iget v11, v1, Lcom/google/android/exoplayer2/Format;->selectionFlags:I

    and-int/lit8 v11, v11, 0x1

    if-eqz v11, :cond_2

    const/4 v3, 0x1

    .line 737
    .local v3, "isDefault":Z
    :goto_2
    if-eqz v3, :cond_3

    const/4 v10, 0x2

    .line 738
    .local v10, "trackScore":I
    :goto_3
    aget v11, v7, v9

    const/4 v12, 0x0

    invoke-static {v11, v12}, Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector;->isSupported(IZ)Z

    move-result v11

    if-eqz v11, :cond_0

    .line 739
    add-int/lit16 v10, v10, 0x3e8

    .line 741
    :cond_0
    if-le v10, v6, :cond_1

    .line 742
    move-object v4, v8

    .line 743
    move v5, v9

    .line 744
    move v6, v10

    .line 733
    .end local v1    # "format":Lcom/google/android/exoplayer2/Format;
    .end local v3    # "isDefault":Z
    .end local v10    # "trackScore":I
    :cond_1
    add-int/lit8 v9, v9, 0x1

    goto :goto_1

    .line 736
    .restart local v1    # "format":Lcom/google/android/exoplayer2/Format;
    :cond_2
    const/4 v3, 0x0

    goto :goto_2

    .line 737
    .restart local v3    # "isDefault":Z
    :cond_3
    const/4 v10, 0x1

    goto :goto_3

    .line 730
    .end local v1    # "format":Lcom/google/android/exoplayer2/Format;
    .end local v3    # "isDefault":Z
    :cond_4
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 749
    .end local v7    # "trackFormatSupport":[I
    .end local v8    # "trackGroup":Lcom/google/android/exoplayer2/source/TrackGroup;
    .end local v9    # "trackIndex":I
    :cond_5
    if-nez v4, :cond_6

    const/4 v11, 0x0

    :goto_4
    return-object v11

    :cond_6
    new-instance v11, Lcom/google/android/exoplayer2/trackselection/FixedTrackSelection;

    invoke-direct {v11, v4, v5}, Lcom/google/android/exoplayer2/trackselection/FixedTrackSelection;-><init>(Lcom/google/android/exoplayer2/source/TrackGroup;I)V

    goto :goto_4
.end method

.method protected selectTextTrack(Lcom/google/android/exoplayer2/source/TrackGroupArray;[[ILjava/lang/String;Ljava/lang/String;Z)Lcom/google/android/exoplayer2/trackselection/TrackSelection;
    .locals 15
    .param p1, "groups"    # Lcom/google/android/exoplayer2/source/TrackGroupArray;
    .param p2, "formatSupport"    # [[I
    .param p3, "preferredTextLanguage"    # Ljava/lang/String;
    .param p4, "preferredAudioLanguage"    # Ljava/lang/String;
    .param p5, "exceedRendererCapabilitiesIfNecessary"    # Z

    .prologue
    .line 673
    const/4 v5, 0x0

    .line 674
    .local v5, "selectedGroup":Lcom/google/android/exoplayer2/source/TrackGroup;
    const/4 v6, 0x0

    .line 675
    .local v6, "selectedTrackIndex":I
    const/4 v7, 0x0

    .line 676
    .local v7, "selectedTrackScore":I
    const/4 v2, 0x0

    .local v2, "groupIndex":I
    :goto_0
    move-object/from16 v0, p1

    iget v13, v0, Lcom/google/android/exoplayer2/source/TrackGroupArray;->length:I

    if-ge v2, v13, :cond_9

    .line 677
    move-object/from16 v0, p1

    invoke-virtual {v0, v2}, Lcom/google/android/exoplayer2/source/TrackGroupArray;->get(I)Lcom/google/android/exoplayer2/source/TrackGroup;

    move-result-object v10

    .line 678
    .local v10, "trackGroup":Lcom/google/android/exoplayer2/source/TrackGroup;
    aget-object v9, p2, v2

    .line 679
    .local v9, "trackFormatSupport":[I
    const/4 v11, 0x0

    .local v11, "trackIndex":I
    :goto_1
    iget v13, v10, Lcom/google/android/exoplayer2/source/TrackGroup;->length:I

    if-ge v11, v13, :cond_8

    .line 680
    aget v13, v9, v11

    move/from16 v0, p5

    invoke-static {v13, v0}, Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector;->isSupported(IZ)Z

    move-result v13

    if-eqz v13, :cond_0

    .line 681
    invoke-virtual {v10, v11}, Lcom/google/android/exoplayer2/source/TrackGroup;->getFormat(I)Lcom/google/android/exoplayer2/Format;

    move-result-object v1

    .line 682
    .local v1, "format":Lcom/google/android/exoplayer2/Format;
    iget v13, v1, Lcom/google/android/exoplayer2/Format;->selectionFlags:I

    and-int/lit8 v13, v13, 0x1

    if-eqz v13, :cond_1

    const/4 v3, 0x1

    .line 683
    .local v3, "isDefault":Z
    :goto_2
    iget v13, v1, Lcom/google/android/exoplayer2/Format;->selectionFlags:I

    and-int/lit8 v13, v13, 0x2

    if-eqz v13, :cond_2

    const/4 v4, 0x1

    .line 685
    .local v4, "isForced":Z
    :goto_3
    move-object/from16 v0, p3

    invoke-static {v1, v0}, Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector;->formatHasLanguage(Lcom/google/android/exoplayer2/Format;Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_5

    .line 686
    if-eqz v3, :cond_3

    .line 687
    const/4 v12, 0x6

    .line 708
    :goto_4
    aget v13, v9, v11

    const/4 v14, 0x0

    invoke-static {v13, v14}, Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector;->isSupported(IZ)Z

    move-result v13

    if-eqz v13, :cond_b

    .line 709
    add-int/lit16 v8, v12, 0x3e8

    .line 711
    :goto_5
    if-le v8, v7, :cond_0

    .line 712
    move-object v5, v10

    .line 713
    move v6, v11

    .end local v7    # "selectedTrackScore":I
    .local v8, "selectedTrackScore":I
    move v7, v8

    .line 679
    .end local v1    # "format":Lcom/google/android/exoplayer2/Format;
    .end local v3    # "isDefault":Z
    .end local v4    # "isForced":Z
    .end local v8    # "selectedTrackScore":I
    .restart local v7    # "selectedTrackScore":I
    :cond_0
    add-int/lit8 v11, v11, 0x1

    goto :goto_1

    .line 682
    .restart local v1    # "format":Lcom/google/android/exoplayer2/Format;
    :cond_1
    const/4 v3, 0x0

    goto :goto_2

    .line 683
    .restart local v3    # "isDefault":Z
    :cond_2
    const/4 v4, 0x0

    goto :goto_3

    .line 688
    .restart local v4    # "isForced":Z
    :cond_3
    if-nez v4, :cond_4

    .line 692
    const/4 v12, 0x5

    .local v12, "trackScore":I
    goto :goto_4

    .line 694
    .end local v12    # "trackScore":I
    :cond_4
    const/4 v12, 0x4

    .restart local v12    # "trackScore":I
    goto :goto_4

    .line 696
    .end local v12    # "trackScore":I
    :cond_5
    if-eqz v3, :cond_6

    .line 697
    const/4 v12, 0x3

    .restart local v12    # "trackScore":I
    goto :goto_4

    .line 698
    .end local v12    # "trackScore":I
    :cond_6
    if-eqz v4, :cond_0

    .line 699
    move-object/from16 v0, p4

    invoke-static {v1, v0}, Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector;->formatHasLanguage(Lcom/google/android/exoplayer2/Format;Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_7

    .line 700
    const/4 v12, 0x2

    .restart local v12    # "trackScore":I
    goto :goto_4

    .line 702
    .end local v12    # "trackScore":I
    :cond_7
    const/4 v12, 0x1

    goto :goto_4

    .line 676
    .end local v1    # "format":Lcom/google/android/exoplayer2/Format;
    .end local v3    # "isDefault":Z
    .end local v4    # "isForced":Z
    :cond_8
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 719
    .end local v9    # "trackFormatSupport":[I
    .end local v10    # "trackGroup":Lcom/google/android/exoplayer2/source/TrackGroup;
    .end local v11    # "trackIndex":I
    :cond_9
    if-nez v5, :cond_a

    const/4 v13, 0x0

    :goto_6
    return-object v13

    :cond_a
    new-instance v13, Lcom/google/android/exoplayer2/trackselection/FixedTrackSelection;

    invoke-direct {v13, v5, v6}, Lcom/google/android/exoplayer2/trackselection/FixedTrackSelection;-><init>(Lcom/google/android/exoplayer2/source/TrackGroup;I)V

    goto :goto_6

    .restart local v1    # "format":Lcom/google/android/exoplayer2/Format;
    .restart local v3    # "isDefault":Z
    .restart local v4    # "isForced":Z
    .restart local v9    # "trackFormatSupport":[I
    .restart local v10    # "trackGroup":Lcom/google/android/exoplayer2/source/TrackGroup;
    .restart local v11    # "trackIndex":I
    :cond_b
    move v8, v12

    goto :goto_5
.end method

.method protected selectTracks([Lcom/google/android/exoplayer2/RendererCapabilities;[Lcom/google/android/exoplayer2/source/TrackGroupArray;[[[I)[Lcom/google/android/exoplayer2/trackselection/TrackSelection;
    .locals 18
    .param p1, "rendererCapabilities"    # [Lcom/google/android/exoplayer2/RendererCapabilities;
    .param p2, "rendererTrackGroupArrays"    # [Lcom/google/android/exoplayer2/source/TrackGroupArray;
    .param p3, "rendererFormatSupports"    # [[[I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ExoPlaybackException;
        }
    .end annotation

    .prologue
    .line 402
    move-object/from16 v0, p1

    array-length v1, v0

    new-array v0, v1, [Lcom/google/android/exoplayer2/trackselection/TrackSelection;

    move-object/from16 v17, v0

    .line 403
    .local v17, "rendererTrackSelections":[Lcom/google/android/exoplayer2/trackselection/TrackSelection;
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector;->paramsReference:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector$Parameters;

    .line 404
    .local v16, "params":Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector$Parameters;
    const/4 v15, 0x0

    .local v15, "i":I
    :goto_0
    move-object/from16 v0, p1

    array-length v1, v0

    if-ge v15, v1, :cond_0

    .line 405
    aget-object v1, p1, v15

    invoke-interface {v1}, Lcom/google/android/exoplayer2/RendererCapabilities;->getTrackType()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    .line 426
    aget-object v1, p1, v15

    invoke-interface {v1}, Lcom/google/android/exoplayer2/RendererCapabilities;->getTrackType()I

    move-result v1

    aget-object v2, p2, v15

    aget-object v3, p3, v15

    move-object/from16 v0, v16

    iget-boolean v4, v0, Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector$Parameters;->exceedRendererCapabilitiesIfNecessary:Z

    move-object/from16 v0, p0

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector;->selectOtherTrack(ILcom/google/android/exoplayer2/source/TrackGroupArray;[[IZ)Lcom/google/android/exoplayer2/trackselection/TrackSelection;

    move-result-object v1

    aput-object v1, v17, v15

    .line 404
    :goto_1
    add-int/lit8 v15, v15, 0x1

    goto :goto_0

    .line 407
    :pswitch_0
    aget-object v2, p1, v15

    aget-object v3, p2, v15

    aget-object v4, p3, v15

    move-object/from16 v0, v16

    iget v5, v0, Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector$Parameters;->maxVideoWidth:I

    move-object/from16 v0, v16

    iget v6, v0, Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector$Parameters;->maxVideoHeight:I

    move-object/from16 v0, v16

    iget-boolean v7, v0, Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector$Parameters;->allowNonSeamlessAdaptiveness:Z

    move-object/from16 v0, v16

    iget-boolean v8, v0, Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector$Parameters;->allowMixedMimeAdaptiveness:Z

    move-object/from16 v0, v16

    iget v9, v0, Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector$Parameters;->viewportWidth:I

    move-object/from16 v0, v16

    iget v10, v0, Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector$Parameters;->viewportHeight:I

    move-object/from16 v0, v16

    iget-boolean v11, v0, Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector$Parameters;->orientationMayChange:Z

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector;->adaptiveVideoTrackSelectionFactory:Lcom/google/android/exoplayer2/trackselection/TrackSelection$Factory;

    move-object/from16 v0, v16

    iget-boolean v13, v0, Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector$Parameters;->exceedVideoConstraintsIfNecessary:Z

    move-object/from16 v0, v16

    iget-boolean v14, v0, Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector$Parameters;->exceedRendererCapabilitiesIfNecessary:Z

    move-object/from16 v1, p0

    invoke-virtual/range {v1 .. v14}, Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector;->selectVideoTrack(Lcom/google/android/exoplayer2/RendererCapabilities;Lcom/google/android/exoplayer2/source/TrackGroupArray;[[IIIZZIIZLcom/google/android/exoplayer2/trackselection/TrackSelection$Factory;ZZ)Lcom/google/android/exoplayer2/trackselection/TrackSelection;

    move-result-object v1

    aput-object v1, v17, v15

    goto :goto_1

    .line 416
    :pswitch_1
    aget-object v1, p2, v15

    aget-object v2, p3, v15

    move-object/from16 v0, v16

    iget-object v3, v0, Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector$Parameters;->preferredAudioLanguage:Ljava/lang/String;

    move-object/from16 v0, v16

    iget-boolean v4, v0, Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector$Parameters;->exceedRendererCapabilitiesIfNecessary:Z

    move-object/from16 v0, p0

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector;->selectAudioTrack(Lcom/google/android/exoplayer2/source/TrackGroupArray;[[ILjava/lang/String;Z)Lcom/google/android/exoplayer2/trackselection/TrackSelection;

    move-result-object v1

    aput-object v1, v17, v15

    goto :goto_1

    .line 421
    :pswitch_2
    aget-object v2, p2, v15

    aget-object v3, p3, v15

    move-object/from16 v0, v16

    iget-object v4, v0, Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector$Parameters;->preferredTextLanguage:Ljava/lang/String;

    move-object/from16 v0, v16

    iget-object v5, v0, Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector$Parameters;->preferredAudioLanguage:Ljava/lang/String;

    move-object/from16 v0, v16

    iget-boolean v6, v0, Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector$Parameters;->exceedRendererCapabilitiesIfNecessary:Z

    move-object/from16 v1, p0

    invoke-virtual/range {v1 .. v6}, Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector;->selectTextTrack(Lcom/google/android/exoplayer2/source/TrackGroupArray;[[ILjava/lang/String;Ljava/lang/String;Z)Lcom/google/android/exoplayer2/trackselection/TrackSelection;

    move-result-object v1

    aput-object v1, v17, v15

    goto :goto_1

    .line 432
    :cond_0
    return-object v17

    .line 405
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method protected selectVideoTrack(Lcom/google/android/exoplayer2/RendererCapabilities;Lcom/google/android/exoplayer2/source/TrackGroupArray;[[IIIZZIIZLcom/google/android/exoplayer2/trackselection/TrackSelection$Factory;ZZ)Lcom/google/android/exoplayer2/trackselection/TrackSelection;
    .locals 10
    .param p1, "rendererCapabilities"    # Lcom/google/android/exoplayer2/RendererCapabilities;
    .param p2, "groups"    # Lcom/google/android/exoplayer2/source/TrackGroupArray;
    .param p3, "formatSupport"    # [[I
    .param p4, "maxVideoWidth"    # I
    .param p5, "maxVideoHeight"    # I
    .param p6, "allowNonSeamlessAdaptiveness"    # Z
    .param p7, "allowMixedMimeAdaptiveness"    # Z
    .param p8, "viewportWidth"    # I
    .param p9, "viewportHeight"    # I
    .param p10, "orientationMayChange"    # Z
    .param p11, "adaptiveVideoTrackSelectionFactory"    # Lcom/google/android/exoplayer2/trackselection/TrackSelection$Factory;
    .param p12, "exceedConstraintsIfNecessary"    # Z
    .param p13, "exceedRendererCapabilitiesIfNecessary"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ExoPlaybackException;
        }
    .end annotation

    .prologue
    .line 444
    const/4 v9, 0x0

    .line 445
    .local v9, "selection":Lcom/google/android/exoplayer2/trackselection/TrackSelection;
    if-eqz p11, :cond_0

    .line 446
    invoke-static/range {p1 .. p11}, Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector;->selectAdaptiveVideoTrack(Lcom/google/android/exoplayer2/RendererCapabilities;Lcom/google/android/exoplayer2/source/TrackGroupArray;[[IIIZZIIZLcom/google/android/exoplayer2/trackselection/TrackSelection$Factory;)Lcom/google/android/exoplayer2/trackselection/TrackSelection;

    move-result-object v9

    .line 451
    :cond_0
    if-nez v9, :cond_1

    move-object v0, p2

    move-object v1, p3

    move v2, p4

    move v3, p5

    move/from16 v4, p8

    move/from16 v5, p9

    move/from16 v6, p10

    move/from16 v7, p12

    move/from16 v8, p13

    .line 452
    invoke-static/range {v0 .. v8}, Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector;->selectFixedVideoTrack(Lcom/google/android/exoplayer2/source/TrackGroupArray;[[IIIIIZZZ)Lcom/google/android/exoplayer2/trackselection/TrackSelection;

    move-result-object v9

    .line 456
    :cond_1
    return-object v9
.end method

.method public setParameters(Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector$Parameters;)V
    .locals 1
    .param p1, "params"    # Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector$Parameters;

    .prologue
    .line 380
    invoke-static {p1}, Lcom/google/android/exoplayer2/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 381
    iget-object v0, p0, Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector;->paramsReference:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector$Parameters;

    invoke-virtual {v0, p1}, Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector$Parameters;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 382
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector;->invalidate()V

    .line 384
    :cond_0
    return-void
.end method
