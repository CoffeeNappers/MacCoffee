.class public Lcom/vk/attachpicker/videotrim/VideoTrimmer;
.super Ljava/lang/Object;
.source "VideoTrimmer.java"


# static fields
.field private static final DEFAULT_BUFFER_SIZE:I = 0x100000

.field public static final HAS_MEDIA_MUXER:Z

.field public static final LOGTAG:Ljava/lang/String; = "VideoTrimmer"


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 36
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x12

    if-lt v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lcom/vk/attachpicker/videotrim/VideoTrimmer;->HAS_MEDIA_MUXER:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static correctTimeToSyncSample(Lcom/googlecode/mp4parser/authoring/Track;DZ)D
    .locals 17
    .param p0, "track"    # Lcom/googlecode/mp4parser/authoring/Track;
    .param p1, "cutHere"    # D
    .param p3, "next"    # Z

    .prologue
    .line 132
    invoke-interface/range {p0 .. p0}, Lcom/googlecode/mp4parser/authoring/Track;->getSyncSamples()[J

    move-result-object v12

    array-length v12, v12

    new-array v7, v12, [D

    .line 133
    .local v7, "timeOfSyncSamples":[D
    const-wide/16 v0, 0x0

    .line 134
    .local v0, "currentSample":J
    const-wide/16 v2, 0x0

    .line 135
    .local v2, "currentTime":D
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_0
    invoke-interface/range {p0 .. p0}, Lcom/googlecode/mp4parser/authoring/Track;->getSampleDurations()[J

    move-result-object v12

    array-length v12, v12

    if-ge v6, v12, :cond_1

    .line 136
    invoke-interface/range {p0 .. p0}, Lcom/googlecode/mp4parser/authoring/Track;->getSampleDurations()[J

    move-result-object v12

    aget-wide v4, v12, v6

    .line 138
    .local v4, "delta":J
    invoke-interface/range {p0 .. p0}, Lcom/googlecode/mp4parser/authoring/Track;->getSyncSamples()[J

    move-result-object v12

    const-wide/16 v14, 0x1

    add-long/2addr v14, v0

    invoke-static {v12, v14, v15}, Ljava/util/Arrays;->binarySearch([JJ)I

    move-result v12

    if-ltz v12, :cond_0

    .line 140
    invoke-interface/range {p0 .. p0}, Lcom/googlecode/mp4parser/authoring/Track;->getSyncSamples()[J

    move-result-object v12

    const-wide/16 v14, 0x1

    add-long/2addr v14, v0

    invoke-static {v12, v14, v15}, Ljava/util/Arrays;->binarySearch([JJ)I

    move-result v12

    aput-wide v2, v7, v12

    .line 142
    :cond_0
    long-to-double v12, v4

    invoke-interface/range {p0 .. p0}, Lcom/googlecode/mp4parser/authoring/Track;->getTrackMetaData()Lcom/googlecode/mp4parser/authoring/TrackMetaData;

    move-result-object v14

    invoke-virtual {v14}, Lcom/googlecode/mp4parser/authoring/TrackMetaData;->getTimescale()J

    move-result-wide v14

    long-to-double v14, v14

    div-double/2addr v12, v14

    add-double/2addr v2, v12

    .line 143
    const-wide/16 v12, 0x1

    add-long/2addr v0, v12

    .line 135
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 146
    .end local v4    # "delta":J
    :cond_1
    const-wide/16 v8, 0x0

    .line 147
    .local v8, "previous":D
    array-length v13, v7

    const/4 v12, 0x0

    :goto_1
    if-ge v12, v13, :cond_4

    aget-wide v10, v7, v12

    .line 148
    .local v10, "timeOfSyncSample":D
    cmpl-double v14, v10, p1

    if-lez v14, :cond_3

    .line 149
    if-eqz p3, :cond_2

    .line 157
    .end local v10    # "timeOfSyncSample":D
    :goto_2
    return-wide v10

    .restart local v10    # "timeOfSyncSample":D
    :cond_2
    move-wide v10, v8

    .line 152
    goto :goto_2

    .line 155
    :cond_3
    move-wide v8, v10

    .line 147
    add-int/lit8 v12, v12, 0x1

    goto :goto_1

    .line 157
    .end local v10    # "timeOfSyncSample":D
    :cond_4
    array-length v12, v7

    add-int/lit8 v12, v12, -0x1

    aget-wide v10, v7, v12

    goto :goto_2
.end method

.method private static genVideoUsingMp4Parser(Ljava/io/File;Ljava/io/File;JJ)Ljava/io/File;
    .locals 34
    .param p0, "src"    # Ljava/io/File;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "dst"    # Ljava/io/File;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "startMs"    # J
    .param p4, "endMs"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 57
    new-instance v4, Lcom/googlecode/mp4parser/FileDataSourceViaHeapImpl;

    invoke-virtual/range {p0 .. p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v29

    move-object/from16 v0, v29

    invoke-direct {v4, v0}, Lcom/googlecode/mp4parser/FileDataSourceViaHeapImpl;-><init>(Ljava/lang/String;)V

    invoke-static {v4}, Lcom/googlecode/mp4parser/authoring/container/mp4/MovieCreator;->build(Lcom/googlecode/mp4parser/DataSource;)Lcom/googlecode/mp4parser/authoring/Movie;

    move-result-object v21

    .line 59
    .local v21, "movie":Lcom/googlecode/mp4parser/authoring/Movie;
    invoke-virtual/range {v21 .. v21}, Lcom/googlecode/mp4parser/authoring/Movie;->getTracks()Ljava/util/List;

    move-result-object v28

    .line 60
    .local v28, "tracks":Ljava/util/List;, "Ljava/util/List<Lcom/googlecode/mp4parser/authoring/Track;>;"
    new-instance v4, Ljava/util/LinkedList;

    invoke-direct {v4}, Ljava/util/LinkedList;-><init>()V

    move-object/from16 v0, v21

    invoke-virtual {v0, v4}, Lcom/googlecode/mp4parser/authoring/Movie;->setTracks(Ljava/util/List;)V

    .line 63
    const-wide/16 v30, 0x3e8

    div-long v30, p2, v30

    move-wide/from16 v0, v30

    long-to-double v0, v0

    move-wide/from16 v26, v0

    .line 64
    .local v26, "startTime1":D
    const-wide/16 v30, 0x3e8

    div-long v30, p4, v30

    move-wide/from16 v0, v30

    long-to-double v0, v0

    move-wide/from16 v16, v0

    .line 66
    .local v16, "endTime1":D
    const/16 v25, 0x0

    .line 71
    .local v25, "timeCorrected":Z
    invoke-interface/range {v28 .. v28}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_0
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v29

    if-eqz v29, :cond_2

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/googlecode/mp4parser/authoring/Track;

    .line 72
    .local v5, "track":Lcom/googlecode/mp4parser/authoring/Track;
    invoke-interface {v5}, Lcom/googlecode/mp4parser/authoring/Track;->getSyncSamples()[J

    move-result-object v29

    if-eqz v29, :cond_0

    invoke-interface {v5}, Lcom/googlecode/mp4parser/authoring/Track;->getSyncSamples()[J

    move-result-object v29

    move-object/from16 v0, v29

    array-length v0, v0

    move/from16 v29, v0

    if-lez v29, :cond_0

    .line 73
    if-eqz v25, :cond_1

    .line 78
    new-instance v4, Ljava/lang/RuntimeException;

    const-string/jumbo v29, "The startTime has already been corrected by another track with SyncSample. Not Supported."

    move-object/from16 v0, v29

    invoke-direct {v4, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 80
    :cond_1
    const/16 v29, 0x0

    move-wide/from16 v0, v26

    move/from16 v2, v29

    invoke-static {v5, v0, v1, v2}, Lcom/vk/attachpicker/videotrim/VideoTrimmer;->correctTimeToSyncSample(Lcom/googlecode/mp4parser/authoring/Track;DZ)D

    move-result-wide v26

    .line 81
    const/16 v29, 0x1

    move-wide/from16 v0, v16

    move/from16 v2, v29

    invoke-static {v5, v0, v1, v2}, Lcom/vk/attachpicker/videotrim/VideoTrimmer;->correctTimeToSyncSample(Lcom/googlecode/mp4parser/authoring/Track;DZ)D

    move-result-wide v16

    .line 82
    const/16 v25, 0x1

    goto :goto_0

    .line 86
    .end local v5    # "track":Lcom/googlecode/mp4parser/authoring/Track;
    :cond_2
    invoke-interface/range {v28 .. v28}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v29

    :goto_1
    invoke-interface/range {v29 .. v29}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_6

    invoke-interface/range {v29 .. v29}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/googlecode/mp4parser/authoring/Track;

    .line 87
    .restart local v5    # "track":Lcom/googlecode/mp4parser/authoring/Track;
    const-wide/16 v10, 0x0

    .line 88
    .local v10, "currentSample":J
    const-wide/16 v12, 0x0

    .line 89
    .local v12, "currentTime":D
    const-wide/high16 v22, -0x4010000000000000L    # -1.0

    .line 90
    .local v22, "lastTime":D
    const-wide/16 v6, -0x1

    .line 91
    .local v6, "startSample1":J
    const-wide/16 v8, -0x1

    .line 93
    .local v8, "endSample1":J
    const/16 v20, 0x0

    .local v20, "i":I
    :goto_2
    invoke-interface {v5}, Lcom/googlecode/mp4parser/authoring/Track;->getSampleDurations()[J

    move-result-object v4

    array-length v4, v4

    move/from16 v0, v20

    if-ge v0, v4, :cond_5

    .line 94
    invoke-interface {v5}, Lcom/googlecode/mp4parser/authoring/Track;->getSampleDurations()[J

    move-result-object v4

    aget-wide v14, v4, v20

    .line 97
    .local v14, "delta":J
    cmpl-double v4, v12, v22

    if-lez v4, :cond_3

    cmpg-double v4, v12, v26

    if-gtz v4, :cond_3

    .line 99
    move-wide v6, v10

    .line 101
    :cond_3
    cmpl-double v4, v12, v22

    if-lez v4, :cond_4

    cmpg-double v4, v12, v16

    if-gtz v4, :cond_4

    .line 103
    move-wide v8, v10

    .line 105
    :cond_4
    move-wide/from16 v22, v12

    .line 106
    long-to-double v0, v14

    move-wide/from16 v30, v0

    invoke-interface {v5}, Lcom/googlecode/mp4parser/authoring/Track;->getTrackMetaData()Lcom/googlecode/mp4parser/authoring/TrackMetaData;

    move-result-object v4

    invoke-virtual {v4}, Lcom/googlecode/mp4parser/authoring/TrackMetaData;->getTimescale()J

    move-result-wide v32

    move-wide/from16 v0, v32

    long-to-double v0, v0

    move-wide/from16 v32, v0

    div-double v30, v30, v32

    add-double v12, v12, v30

    .line 107
    const-wide/16 v30, 0x1

    add-long v10, v10, v30

    .line 93
    add-int/lit8 v20, v20, 0x1

    goto :goto_2

    .line 109
    .end local v14    # "delta":J
    :cond_5
    new-instance v30, Lcom/googlecode/mp4parser/authoring/tracks/AppendTrack;

    const/4 v4, 0x1

    new-array v0, v4, [Lcom/googlecode/mp4parser/authoring/Track;

    move-object/from16 v31, v0

    const/16 v32, 0x0

    new-instance v4, Lcom/googlecode/mp4parser/authoring/tracks/CroppedTrack;

    invoke-direct/range {v4 .. v9}, Lcom/googlecode/mp4parser/authoring/tracks/CroppedTrack;-><init>(Lcom/googlecode/mp4parser/authoring/Track;JJ)V

    aput-object v4, v31, v32

    invoke-direct/range {v30 .. v31}, Lcom/googlecode/mp4parser/authoring/tracks/AppendTrack;-><init>([Lcom/googlecode/mp4parser/authoring/Track;)V

    move-object/from16 v0, v21

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lcom/googlecode/mp4parser/authoring/Movie;->addTrack(Lcom/googlecode/mp4parser/authoring/Track;)V

    goto :goto_1

    .line 112
    .end local v5    # "track":Lcom/googlecode/mp4parser/authoring/Track;
    .end local v6    # "startSample1":J
    .end local v8    # "endSample1":J
    .end local v10    # "currentSample":J
    .end local v12    # "currentTime":D
    .end local v20    # "i":I
    .end local v22    # "lastTime":D
    :cond_6
    invoke-virtual/range {p1 .. p1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v4

    invoke-virtual {v4}, Ljava/io/File;->mkdirs()Z

    .line 114
    invoke-virtual/range {p1 .. p1}, Ljava/io/File;->exists()Z

    move-result v4

    if-nez v4, :cond_7

    .line 115
    invoke-virtual/range {p1 .. p1}, Ljava/io/File;->createNewFile()Z

    .line 118
    :cond_7
    new-instance v4, Lcom/googlecode/mp4parser/authoring/builder/DefaultMp4Builder;

    invoke-direct {v4}, Lcom/googlecode/mp4parser/authoring/builder/DefaultMp4Builder;-><init>()V

    move-object/from16 v0, v21

    invoke-virtual {v4, v0}, Lcom/googlecode/mp4parser/authoring/builder/DefaultMp4Builder;->build(Lcom/googlecode/mp4parser/authoring/Movie;)Lcom/coremedia/iso/boxes/Container;

    move-result-object v24

    .line 120
    .local v24, "out":Lcom/coremedia/iso/boxes/Container;
    new-instance v19, Ljava/io/FileOutputStream;

    move-object/from16 v0, v19

    move-object/from16 v1, p1

    invoke-direct {v0, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 121
    .local v19, "fos":Ljava/io/FileOutputStream;
    invoke-virtual/range {v19 .. v19}, Ljava/io/FileOutputStream;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v18

    .line 122
    .local v18, "fc":Ljava/nio/channels/FileChannel;
    move-object/from16 v0, v24

    move-object/from16 v1, v18

    invoke-interface {v0, v1}, Lcom/coremedia/iso/boxes/Container;->writeContainer(Ljava/nio/channels/WritableByteChannel;)V

    .line 124
    invoke-virtual/range {v18 .. v18}, Ljava/nio/channels/FileChannel;->close()V

    .line 125
    invoke-virtual/range {v19 .. v19}, Ljava/io/FileOutputStream;->close()V

    .line 128
    return-object p1
.end method

.method private static genVideoUsingMuxer(Ljava/lang/String;Ljava/lang/String;IIZZ)V
    .locals 28
    .param p0, "srcPath"    # Ljava/lang/String;
    .param p1, "dstPath"    # Ljava/lang/String;
    .param p2, "startMs"    # I
    .param p3, "endMs"    # I
    .param p4, "useAudio"    # Z
    .param p5, "useVideo"    # Z
    .annotation build Landroid/annotation/TargetApi;
        value = 0x12
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 178
    new-instance v11, Landroid/media/MediaExtractor;

    invoke-direct {v11}, Landroid/media/MediaExtractor;-><init>()V

    .line 179
    .local v11, "extractor":Landroid/media/MediaExtractor;
    move-object/from16 v0, p0

    invoke-virtual {v11, v0}, Landroid/media/MediaExtractor;->setDataSource(Ljava/lang/String;)V

    .line 180
    invoke-virtual {v11}, Landroid/media/MediaExtractor;->getTrackCount()I

    move-result v21

    .line 183
    .local v21, "trackCount":I
    new-instance v16, Landroid/media/MediaMuxer;

    const/16 v23, 0x0

    move-object/from16 v0, v16

    move-object/from16 v1, p1

    move/from16 v2, v23

    invoke-direct {v0, v1, v2}, Landroid/media/MediaMuxer;-><init>(Ljava/lang/String;I)V

    .line 186
    .local v16, "muxer":Landroid/media/MediaMuxer;
    new-instance v14, Ljava/util/HashMap;

    move/from16 v0, v21

    invoke-direct {v14, v0}, Ljava/util/HashMap;-><init>(I)V

    .line 187
    .local v14, "indexMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/Integer;Ljava/lang/Integer;>;"
    const/4 v5, -0x1

    .line 188
    .local v5, "bufferSize":I
    const/4 v13, 0x0

    .local v13, "i":I
    :goto_0
    move/from16 v0, v21

    if-ge v13, v0, :cond_3

    .line 189
    invoke-virtual {v11, v13}, Landroid/media/MediaExtractor;->getTrackFormat(I)Landroid/media/MediaFormat;

    move-result-object v12

    .line 190
    .local v12, "format":Landroid/media/MediaFormat;
    const-string/jumbo v23, "mime"

    move-object/from16 v0, v23

    invoke-virtual {v12, v0}, Landroid/media/MediaFormat;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    .line 191
    .local v15, "mime":Ljava/lang/String;
    const/16 v20, 0x0

    .line 192
    .local v20, "selectCurrentTrack":Z
    const-string/jumbo v23, "audio/"

    move-object/from16 v0, v23

    invoke-virtual {v15, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v23

    if-eqz v23, :cond_2

    if-eqz p4, :cond_2

    .line 193
    const/16 v20, 0x1

    .line 197
    :cond_0
    :goto_1
    if-eqz v20, :cond_1

    .line 198
    invoke-virtual {v11, v13}, Landroid/media/MediaExtractor;->selectTrack(I)V

    .line 199
    move-object/from16 v0, v16

    invoke-virtual {v0, v12}, Landroid/media/MediaMuxer;->addTrack(Landroid/media/MediaFormat;)I

    move-result v9

    .line 200
    .local v9, "dstIndex":I
    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v23

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v24

    move-object/from16 v0, v23

    move-object/from16 v1, v24

    invoke-virtual {v14, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 201
    const-string/jumbo v23, "max-input-size"

    move-object/from16 v0, v23

    invoke-virtual {v12, v0}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    move-result v23

    if-eqz v23, :cond_1

    .line 202
    const-string/jumbo v23, "max-input-size"

    move-object/from16 v0, v23

    invoke-virtual {v12, v0}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    move-result v17

    .line 203
    .local v17, "newSize":I
    move/from16 v0, v17

    if-le v0, v5, :cond_1

    move/from16 v5, v17

    .line 188
    .end local v9    # "dstIndex":I
    .end local v17    # "newSize":I
    :cond_1
    add-int/lit8 v13, v13, 0x1

    goto :goto_0

    .line 194
    :cond_2
    const-string/jumbo v23, "video/"

    move-object/from16 v0, v23

    invoke-virtual {v15, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v23

    if-eqz v23, :cond_0

    if-eqz p5, :cond_0

    .line 195
    const/16 v20, 0x1

    goto :goto_1

    .line 207
    .end local v12    # "format":Landroid/media/MediaFormat;
    .end local v15    # "mime":Ljava/lang/String;
    .end local v20    # "selectCurrentTrack":Z
    :cond_3
    if-gez v5, :cond_4

    .line 208
    const/high16 v5, 0x100000

    .line 211
    :cond_4
    new-instance v19, Landroid/media/MediaMetadataRetriever;

    invoke-direct/range {v19 .. v19}, Landroid/media/MediaMetadataRetriever;-><init>()V

    .line 212
    .local v19, "retrieverSrc":Landroid/media/MediaMetadataRetriever;
    move-object/from16 v0, v19

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Landroid/media/MediaMetadataRetriever;->setDataSource(Ljava/lang/String;)V

    .line 213
    const/16 v23, 0x18

    move-object/from16 v0, v19

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;

    move-result-object v7

    .line 215
    .local v7, "degreesString":Ljava/lang/String;
    if-eqz v7, :cond_5

    .line 216
    invoke-static {v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    .line 217
    .local v6, "degrees":I
    if-ltz v6, :cond_5

    .line 218
    move-object/from16 v0, v16

    invoke-virtual {v0, v6}, Landroid/media/MediaMuxer;->setOrientationHint(I)V

    .line 221
    .end local v6    # "degrees":I
    :cond_5
    if-lez p2, :cond_6

    .line 222
    move/from16 v0, p2

    mul-int/lit16 v0, v0, 0x3e8

    move/from16 v23, v0

    move/from16 v0, v23

    int-to-long v0, v0

    move-wide/from16 v24, v0

    const/16 v23, 0x2

    move-wide/from16 v0, v24

    move/from16 v2, v23

    invoke-virtual {v11, v0, v1, v2}, Landroid/media/MediaExtractor;->seekTo(JI)V

    .line 227
    :cond_6
    const/16 v18, 0x0

    .line 228
    .local v18, "offset":I
    const/16 v22, -0x1

    .line 229
    .local v22, "trackIndex":I
    invoke-static {v5}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v8

    .line 230
    .local v8, "dstBuf":Ljava/nio/ByteBuffer;
    new-instance v4, Landroid/media/MediaCodec$BufferInfo;

    invoke-direct {v4}, Landroid/media/MediaCodec$BufferInfo;-><init>()V

    .line 232
    .local v4, "bufferInfo":Landroid/media/MediaCodec$BufferInfo;
    :try_start_0
    invoke-virtual/range {v16 .. v16}, Landroid/media/MediaMuxer;->start()V

    .line 234
    :goto_2
    move/from16 v0, v18

    iput v0, v4, Landroid/media/MediaCodec$BufferInfo;->offset:I

    .line 235
    move/from16 v0, v18

    invoke-virtual {v11, v8, v0}, Landroid/media/MediaExtractor;->readSampleData(Ljava/nio/ByteBuffer;I)I

    move-result v23

    move/from16 v0, v23

    iput v0, v4, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 236
    iget v0, v4, Landroid/media/MediaCodec$BufferInfo;->size:I

    move/from16 v23, v0

    if-gez v23, :cond_7

    .line 237
    const-string/jumbo v23, "VideoTrimmer"

    const-string/jumbo v24, "Saw input EOS."

    invoke-static/range {v23 .. v24}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 238
    const/16 v23, 0x0

    move/from16 v0, v23

    iput v0, v4, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 254
    :goto_3
    invoke-virtual/range {v16 .. v16}, Landroid/media/MediaMuxer;->stop()V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 259
    invoke-virtual/range {v16 .. v16}, Landroid/media/MediaMuxer;->release()V

    .line 261
    :goto_4
    return-void

    .line 241
    :cond_7
    :try_start_1
    invoke-virtual {v11}, Landroid/media/MediaExtractor;->getSampleTime()J

    move-result-wide v24

    move-wide/from16 v0, v24

    iput-wide v0, v4, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 242
    if-lez p3, :cond_8

    iget-wide v0, v4, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    move-wide/from16 v24, v0

    move/from16 v0, p3

    mul-int/lit16 v0, v0, 0x3e8

    move/from16 v23, v0

    move/from16 v0, v23

    int-to-long v0, v0

    move-wide/from16 v26, v0

    cmp-long v23, v24, v26

    if-lez v23, :cond_8

    .line 243
    const-string/jumbo v23, "VideoTrimmer"

    const-string/jumbo v24, "The current sample is over the trim end time."

    invoke-static/range {v23 .. v24}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/IllegalStateException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_3

    .line 255
    :catch_0
    move-exception v10

    .line 257
    .local v10, "e":Ljava/lang/IllegalStateException;
    :try_start_2
    const-string/jumbo v23, "VideoTrimmer"

    const-string/jumbo v24, "The source video file is malformed"

    invoke-static/range {v23 .. v24}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 259
    invoke-virtual/range {v16 .. v16}, Landroid/media/MediaMuxer;->release()V

    goto :goto_4

    .line 246
    .end local v10    # "e":Ljava/lang/IllegalStateException;
    :cond_8
    :try_start_3
    invoke-virtual {v11}, Landroid/media/MediaExtractor;->getSampleFlags()I

    move-result v23

    move/from16 v0, v23

    iput v0, v4, Landroid/media/MediaCodec$BufferInfo;->flags:I

    .line 247
    invoke-virtual {v11}, Landroid/media/MediaExtractor;->getSampleTrackIndex()I

    move-result v22

    .line 248
    invoke-static/range {v22 .. v22}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v23

    move-object/from16 v0, v23

    invoke-virtual {v14, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v23

    check-cast v23, Ljava/lang/Integer;

    invoke-virtual/range {v23 .. v23}, Ljava/lang/Integer;->intValue()I

    move-result v23

    move-object/from16 v0, v16

    move/from16 v1, v23

    invoke-virtual {v0, v1, v8, v4}, Landroid/media/MediaMuxer;->writeSampleData(ILjava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)V

    .line 250
    invoke-virtual {v11}, Landroid/media/MediaExtractor;->advance()Z
    :try_end_3
    .catch Ljava/lang/IllegalStateException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto/16 :goto_2

    .line 259
    :catchall_0
    move-exception v23

    invoke-virtual/range {v16 .. v16}, Landroid/media/MediaMuxer;->release()V

    throw v23
.end method

.method public static trimVideo(Ljava/io/File;Ljava/io/File;JJ)V
    .locals 8
    .param p0, "src"    # Ljava/io/File;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "dst"    # Ljava/io/File;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "startMs"    # J
    .param p4, "endMs"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 41
    sget-boolean v0, Lcom/vk/attachpicker/videotrim/VideoTrimmer;->HAS_MEDIA_MUXER:Z

    if-eqz v0, :cond_0

    .line 43
    :try_start_0
    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    long-to-int v2, p2

    long-to-int v3, p4

    const/4 v4, 0x1

    const/4 v5, 0x1

    invoke-static/range {v0 .. v5}, Lcom/vk/attachpicker/videotrim/VideoTrimmer;->genVideoUsingMuxer(Ljava/lang/String;Ljava/lang/String;IIZZ)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 52
    :goto_0
    return-void

    .line 44
    :catch_0
    move-exception v6

    .line 45
    .local v6, "t":Ljava/lang/Throwable;
    invoke-static {p1}, Lcom/vk/core/util/FileUtils;->deleteFile(Ljava/io/File;)Z

    .line 46
    invoke-static/range {p0 .. p5}, Lcom/vk/attachpicker/videotrim/VideoTrimmer;->genVideoUsingMp4Parser(Ljava/io/File;Ljava/io/File;JJ)Ljava/io/File;

    goto :goto_0

    .line 49
    .end local v6    # "t":Ljava/lang/Throwable;
    :cond_0
    invoke-static/range {p0 .. p5}, Lcom/vk/attachpicker/videotrim/VideoTrimmer;->genVideoUsingMp4Parser(Ljava/io/File;Ljava/io/File;JJ)Ljava/io/File;

    goto :goto_0
.end method
