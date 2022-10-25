.class Lcom/google/android/exoplayer2/source/hls/HlsChunkSource;
.super Ljava/lang/Object;
.source "HlsChunkSource.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/exoplayer2/source/hls/HlsChunkSource$EncryptionKeyChunk;,
        Lcom/google/android/exoplayer2/source/hls/HlsChunkSource$InitializationTrackSelection;,
        Lcom/google/android/exoplayer2/source/hls/HlsChunkSource$HlsChunkHolder;
    }
.end annotation


# instance fields
.field private final dataSource:Lcom/google/android/exoplayer2/upstream/DataSource;

.field private encryptionIv:[B

.field private encryptionIvString:Ljava/lang/String;

.field private encryptionKey:[B

.field private encryptionKeyUri:Landroid/net/Uri;

.field private fatalError:Ljava/io/IOException;

.field private isTimestampMaster:Z

.field private final playlistTracker:Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker;

.field private scratchSpace:[B

.field private final timestampAdjusterProvider:Lcom/google/android/exoplayer2/source/hls/TimestampAdjusterProvider;

.field private final trackGroup:Lcom/google/android/exoplayer2/source/TrackGroup;

.field private trackSelection:Lcom/google/android/exoplayer2/trackselection/TrackSelection;

.field private final variants:[Lcom/google/android/exoplayer2/source/hls/playlist/HlsMasterPlaylist$HlsUrl;


# direct methods
.method public constructor <init>(Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker;[Lcom/google/android/exoplayer2/source/hls/playlist/HlsMasterPlaylist$HlsUrl;Lcom/google/android/exoplayer2/upstream/DataSource;Lcom/google/android/exoplayer2/source/hls/TimestampAdjusterProvider;)V
    .locals 5
    .param p1, "playlistTracker"    # Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker;
    .param p2, "variants"    # [Lcom/google/android/exoplayer2/source/hls/playlist/HlsMasterPlaylist$HlsUrl;
    .param p3, "dataSource"    # Lcom/google/android/exoplayer2/upstream/DataSource;
    .param p4, "timestampAdjusterProvider"    # Lcom/google/android/exoplayer2/source/hls/TimestampAdjusterProvider;

    .prologue
    .line 112
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 113
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/hls/HlsChunkSource;->playlistTracker:Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker;

    .line 114
    iput-object p2, p0, Lcom/google/android/exoplayer2/source/hls/HlsChunkSource;->variants:[Lcom/google/android/exoplayer2/source/hls/playlist/HlsMasterPlaylist$HlsUrl;

    .line 115
    iput-object p3, p0, Lcom/google/android/exoplayer2/source/hls/HlsChunkSource;->dataSource:Lcom/google/android/exoplayer2/upstream/DataSource;

    .line 116
    iput-object p4, p0, Lcom/google/android/exoplayer2/source/hls/HlsChunkSource;->timestampAdjusterProvider:Lcom/google/android/exoplayer2/source/hls/TimestampAdjusterProvider;

    .line 118
    array-length v3, p2

    new-array v2, v3, [Lcom/google/android/exoplayer2/Format;

    .line 119
    .local v2, "variantFormats":[Lcom/google/android/exoplayer2/Format;
    array-length v3, p2

    new-array v1, v3, [I

    .line 120
    .local v1, "initialTrackSelection":[I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v3, p2

    if-ge v0, v3, :cond_0

    .line 121
    aget-object v3, p2, v0

    iget-object v3, v3, Lcom/google/android/exoplayer2/source/hls/playlist/HlsMasterPlaylist$HlsUrl;->format:Lcom/google/android/exoplayer2/Format;

    aput-object v3, v2, v0

    .line 122
    aput v0, v1, v0

    .line 120
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 124
    :cond_0
    new-instance v3, Lcom/google/android/exoplayer2/source/TrackGroup;

    invoke-direct {v3, v2}, Lcom/google/android/exoplayer2/source/TrackGroup;-><init>([Lcom/google/android/exoplayer2/Format;)V

    iput-object v3, p0, Lcom/google/android/exoplayer2/source/hls/HlsChunkSource;->trackGroup:Lcom/google/android/exoplayer2/source/TrackGroup;

    .line 125
    new-instance v3, Lcom/google/android/exoplayer2/source/hls/HlsChunkSource$InitializationTrackSelection;

    iget-object v4, p0, Lcom/google/android/exoplayer2/source/hls/HlsChunkSource;->trackGroup:Lcom/google/android/exoplayer2/source/TrackGroup;

    invoke-direct {v3, v4, v1}, Lcom/google/android/exoplayer2/source/hls/HlsChunkSource$InitializationTrackSelection;-><init>(Lcom/google/android/exoplayer2/source/TrackGroup;[I)V

    iput-object v3, p0, Lcom/google/android/exoplayer2/source/hls/HlsChunkSource;->trackSelection:Lcom/google/android/exoplayer2/trackselection/TrackSelection;

    .line 126
    return-void
.end method

.method private clearEncryptionData()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 365
    iput-object v0, p0, Lcom/google/android/exoplayer2/source/hls/HlsChunkSource;->encryptionKeyUri:Landroid/net/Uri;

    .line 366
    iput-object v0, p0, Lcom/google/android/exoplayer2/source/hls/HlsChunkSource;->encryptionKey:[B

    .line 367
    iput-object v0, p0, Lcom/google/android/exoplayer2/source/hls/HlsChunkSource;->encryptionIvString:Ljava/lang/String;

    .line 368
    iput-object v0, p0, Lcom/google/android/exoplayer2/source/hls/HlsChunkSource;->encryptionIv:[B

    .line 369
    return-void
.end method

.method private newEncryptionKeyChunk(Landroid/net/Uri;Ljava/lang/String;IILjava/lang/Object;)Lcom/google/android/exoplayer2/source/hls/HlsChunkSource$EncryptionKeyChunk;
    .locals 9
    .param p1, "keyUri"    # Landroid/net/Uri;
    .param p2, "iv"    # Ljava/lang/String;
    .param p3, "variantIndex"    # I
    .param p4, "trackSelectionReason"    # I
    .param p5, "trackSelectionData"    # Ljava/lang/Object;

    .prologue
    .line 339
    new-instance v0, Lcom/google/android/exoplayer2/upstream/DataSpec;

    const-wide/16 v2, 0x0

    const-wide/16 v4, -0x1

    const/4 v6, 0x0

    const/4 v7, 0x1

    move-object v1, p1

    invoke-direct/range {v0 .. v7}, Lcom/google/android/exoplayer2/upstream/DataSpec;-><init>(Landroid/net/Uri;JJLjava/lang/String;I)V

    .line 340
    .local v0, "dataSpec":Lcom/google/android/exoplayer2/upstream/DataSpec;
    new-instance v1, Lcom/google/android/exoplayer2/source/hls/HlsChunkSource$EncryptionKeyChunk;

    iget-object v2, p0, Lcom/google/android/exoplayer2/source/hls/HlsChunkSource;->dataSource:Lcom/google/android/exoplayer2/upstream/DataSource;

    iget-object v3, p0, Lcom/google/android/exoplayer2/source/hls/HlsChunkSource;->variants:[Lcom/google/android/exoplayer2/source/hls/playlist/HlsMasterPlaylist$HlsUrl;

    aget-object v3, v3, p3

    iget-object v4, v3, Lcom/google/android/exoplayer2/source/hls/playlist/HlsMasterPlaylist$HlsUrl;->format:Lcom/google/android/exoplayer2/Format;

    iget-object v7, p0, Lcom/google/android/exoplayer2/source/hls/HlsChunkSource;->scratchSpace:[B

    move-object v3, v0

    move v5, p4

    move-object v6, p5

    move-object v8, p2

    invoke-direct/range {v1 .. v8}, Lcom/google/android/exoplayer2/source/hls/HlsChunkSource$EncryptionKeyChunk;-><init>(Lcom/google/android/exoplayer2/upstream/DataSource;Lcom/google/android/exoplayer2/upstream/DataSpec;Lcom/google/android/exoplayer2/Format;ILjava/lang/Object;[BLjava/lang/String;)V

    return-object v1
.end method

.method private setEncryptionData(Landroid/net/Uri;Ljava/lang/String;[B)V
    .locals 7
    .param p1, "keyUri"    # Landroid/net/Uri;
    .param p2, "iv"    # Ljava/lang/String;
    .param p3, "secretKey"    # [B

    .prologue
    const/16 v6, 0x10

    .line 346
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v4

    invoke-virtual {p2, v4}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v4

    const-string/jumbo v5, "0x"

    invoke-virtual {v4, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 347
    const/4 v4, 0x2

    invoke-virtual {p2, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    .line 352
    .local v3, "trimmedIv":Ljava/lang/String;
    :goto_0
    new-instance v4, Ljava/math/BigInteger;

    invoke-direct {v4, v3, v6}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;I)V

    invoke-virtual {v4}, Ljava/math/BigInteger;->toByteArray()[B

    move-result-object v0

    .line 353
    .local v0, "ivData":[B
    new-array v1, v6, [B

    .line 354
    .local v1, "ivDataWithPadding":[B
    array-length v4, v0

    if-le v4, v6, :cond_1

    array-length v4, v0

    add-int/lit8 v2, v4, -0x10

    .line 355
    .local v2, "offset":I
    :goto_1
    array-length v4, v1

    array-length v5, v0

    sub-int/2addr v4, v5

    add-int/2addr v4, v2

    array-length v5, v0

    sub-int/2addr v5, v2

    invoke-static {v0, v2, v1, v4, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 358
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/hls/HlsChunkSource;->encryptionKeyUri:Landroid/net/Uri;

    .line 359
    iput-object p3, p0, Lcom/google/android/exoplayer2/source/hls/HlsChunkSource;->encryptionKey:[B

    .line 360
    iput-object p2, p0, Lcom/google/android/exoplayer2/source/hls/HlsChunkSource;->encryptionIvString:Ljava/lang/String;

    .line 361
    iput-object v1, p0, Lcom/google/android/exoplayer2/source/hls/HlsChunkSource;->encryptionIv:[B

    .line 362
    return-void

    .line 349
    .end local v0    # "ivData":[B
    .end local v1    # "ivDataWithPadding":[B
    .end local v2    # "offset":I
    .end local v3    # "trimmedIv":Ljava/lang/String;
    :cond_0
    move-object v3, p2

    .restart local v3    # "trimmedIv":Ljava/lang/String;
    goto :goto_0

    .line 354
    .restart local v0    # "ivData":[B
    .restart local v1    # "ivDataWithPadding":[B
    :cond_1
    const/4 v2, 0x0

    goto :goto_1
.end method


# virtual methods
.method public getNextChunk(Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;JLcom/google/android/exoplayer2/source/hls/HlsChunkSource$HlsChunkHolder;)V
    .locals 42
    .param p1, "previous"    # Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;
    .param p2, "playbackPositionUs"    # J
    .param p4, "out"    # Lcom/google/android/exoplayer2/source/hls/HlsChunkSource$HlsChunkHolder;

    .prologue
    .line 188
    if-nez p1, :cond_0

    const/16 v36, -0x1

    .line 192
    .local v36, "oldVariantIndex":I
    :goto_0
    if-nez p1, :cond_1

    const-wide/16 v32, 0x0

    .line 196
    .local v32, "bufferedDurationUs":J
    :goto_1
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/android/exoplayer2/source/hls/HlsChunkSource;->trackSelection:Lcom/google/android/exoplayer2/trackselection/TrackSelection;

    move-wide/from16 v0, v32

    invoke-interface {v4, v0, v1}, Lcom/google/android/exoplayer2/trackselection/TrackSelection;->updateSelectedTrack(J)V

    .line 197
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/android/exoplayer2/source/hls/HlsChunkSource;->trackSelection:Lcom/google/android/exoplayer2/trackselection/TrackSelection;

    invoke-interface {v4}, Lcom/google/android/exoplayer2/trackselection/TrackSelection;->getSelectedIndexInTrackGroup()I

    move-result v7

    .line 199
    .local v7, "selectedVariantIndex":I
    move/from16 v0, v36

    if-eq v0, v7, :cond_2

    const/16 v38, 0x1

    .line 200
    .local v38, "switchingVariant":Z
    :goto_2
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/android/exoplayer2/source/hls/HlsChunkSource;->variants:[Lcom/google/android/exoplayer2/source/hls/playlist/HlsMasterPlaylist$HlsUrl;

    aget-object v17, v4, v7

    .line 201
    .local v17, "selectedUrl":Lcom/google/android/exoplayer2/source/hls/playlist/HlsMasterPlaylist$HlsUrl;
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/android/exoplayer2/source/hls/HlsChunkSource;->playlistTracker:Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker;

    move-object/from16 v0, v17

    invoke-virtual {v4, v0}, Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker;->isSnapshotValid(Lcom/google/android/exoplayer2/source/hls/playlist/HlsMasterPlaylist$HlsUrl;)Z

    move-result v4

    if-nez v4, :cond_3

    .line 202
    move-object/from16 v0, v17

    move-object/from16 v1, p4

    iput-object v0, v1, Lcom/google/android/exoplayer2/source/hls/HlsChunkSource$HlsChunkHolder;->playlist:Lcom/google/android/exoplayer2/source/hls/playlist/HlsMasterPlaylist$HlsUrl;

    .line 288
    :goto_3
    return-void

    .line 188
    .end local v7    # "selectedVariantIndex":I
    .end local v17    # "selectedUrl":Lcom/google/android/exoplayer2/source/hls/playlist/HlsMasterPlaylist$HlsUrl;
    .end local v32    # "bufferedDurationUs":J
    .end local v36    # "oldVariantIndex":I
    .end local v38    # "switchingVariant":Z
    :cond_0
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/android/exoplayer2/source/hls/HlsChunkSource;->trackGroup:Lcom/google/android/exoplayer2/source/TrackGroup;

    move-object/from16 v0, p1

    iget-object v6, v0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->trackFormat:Lcom/google/android/exoplayer2/Format;

    .line 189
    invoke-virtual {v4, v6}, Lcom/google/android/exoplayer2/source/TrackGroup;->indexOf(Lcom/google/android/exoplayer2/Format;)I

    move-result v36

    goto :goto_0

    .line 192
    .restart local v36    # "oldVariantIndex":I
    :cond_1
    const-wide/16 v12, 0x0

    move-object/from16 v0, p1

    iget-wide v14, v0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->startTimeUs:J

    sub-long v14, v14, p2

    .line 193
    invoke-static {v12, v13, v14, v15}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v32

    goto :goto_1

    .line 199
    .restart local v7    # "selectedVariantIndex":I
    .restart local v32    # "bufferedDurationUs":J
    :cond_2
    const/16 v38, 0x0

    goto :goto_2

    .line 206
    .restart local v17    # "selectedUrl":Lcom/google/android/exoplayer2/source/hls/playlist/HlsMasterPlaylist$HlsUrl;
    .restart local v38    # "switchingVariant":Z
    :cond_3
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/android/exoplayer2/source/hls/HlsChunkSource;->playlistTracker:Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker;

    move-object/from16 v0, v17

    invoke-virtual {v4, v0}, Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker;->getPlaylistSnapshot(Lcom/google/android/exoplayer2/source/hls/playlist/HlsMasterPlaylist$HlsUrl;)Lcom/google/android/exoplayer2/source/hls/playlist/HlsMediaPlaylist;

    move-result-object v35

    .line 210
    .local v35, "mediaPlaylist":Lcom/google/android/exoplayer2/source/hls/playlist/HlsMediaPlaylist;
    if-eqz p1, :cond_4

    if-eqz v38, :cond_a

    .line 211
    :cond_4
    if-nez p1, :cond_6

    move-wide/from16 v40, p2

    .line 212
    .local v40, "targetPositionUs":J
    :goto_4
    move-object/from16 v0, v35

    iget-boolean v4, v0, Lcom/google/android/exoplayer2/source/hls/playlist/HlsMediaPlaylist;->hasEndTag:Z

    if-nez v4, :cond_7

    invoke-virtual/range {v35 .. v35}, Lcom/google/android/exoplayer2/source/hls/playlist/HlsMediaPlaylist;->getEndTimeUs()J

    move-result-wide v12

    cmp-long v4, v40, v12

    if-lez v4, :cond_7

    .line 214
    move-object/from16 v0, v35

    iget v4, v0, Lcom/google/android/exoplayer2/source/hls/playlist/HlsMediaPlaylist;->mediaSequence:I

    move-object/from16 v0, v35

    iget-object v6, v0, Lcom/google/android/exoplayer2/source/hls/playlist/HlsMediaPlaylist;->segments:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v6

    add-int v24, v4, v6

    .line 231
    .end local v40    # "targetPositionUs":J
    .local v24, "chunkMediaSequence":I
    :cond_5
    :goto_5
    move-object/from16 v0, v35

    iget v4, v0, Lcom/google/android/exoplayer2/source/hls/playlist/HlsMediaPlaylist;->mediaSequence:I

    move/from16 v0, v24

    if-ge v0, v4, :cond_b

    .line 232
    new-instance v4, Lcom/google/android/exoplayer2/source/BehindLiveWindowException;

    invoke-direct {v4}, Lcom/google/android/exoplayer2/source/BehindLiveWindowException;-><init>()V

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/google/android/exoplayer2/source/hls/HlsChunkSource;->fatalError:Ljava/io/IOException;

    goto :goto_3

    .line 211
    .end local v24    # "chunkMediaSequence":I
    :cond_6
    move-object/from16 v0, p1

    iget-wide v0, v0, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->startTimeUs:J

    move-wide/from16 v40, v0

    goto :goto_4

    .line 216
    .restart local v40    # "targetPositionUs":J
    :cond_7
    move-object/from16 v0, v35

    iget-object v6, v0, Lcom/google/android/exoplayer2/source/hls/playlist/HlsMediaPlaylist;->segments:Ljava/util/List;

    move-object/from16 v0, v35

    iget-wide v12, v0, Lcom/google/android/exoplayer2/source/hls/playlist/HlsMediaPlaylist;->startTimeUs:J

    sub-long v12, v40, v12

    .line 217
    invoke-static {v12, v13}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v12

    const/4 v13, 0x1

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/android/exoplayer2/source/hls/HlsChunkSource;->playlistTracker:Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker;

    .line 218
    invoke-virtual {v4}, Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker;->isLive()Z

    move-result v4

    if-eqz v4, :cond_8

    if-nez p1, :cond_9

    :cond_8
    const/4 v4, 0x1

    .line 216
    :goto_6
    invoke-static {v6, v12, v13, v4}, Lcom/google/android/exoplayer2/util/Util;->binarySearchFloor(Ljava/util/List;Ljava/lang/Object;ZZ)I

    move-result v4

    move-object/from16 v0, v35

    iget v6, v0, Lcom/google/android/exoplayer2/source/hls/playlist/HlsMediaPlaylist;->mediaSequence:I

    add-int v24, v4, v6

    .line 219
    .restart local v24    # "chunkMediaSequence":I
    move-object/from16 v0, v35

    iget v4, v0, Lcom/google/android/exoplayer2/source/hls/playlist/HlsMediaPlaylist;->mediaSequence:I

    move/from16 v0, v24

    if-ge v0, v4, :cond_5

    if-eqz p1, :cond_5

    .line 222
    move/from16 v7, v36

    .line 223
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/android/exoplayer2/source/hls/HlsChunkSource;->variants:[Lcom/google/android/exoplayer2/source/hls/playlist/HlsMasterPlaylist$HlsUrl;

    aget-object v17, v4, v7

    .line 224
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/android/exoplayer2/source/hls/HlsChunkSource;->playlistTracker:Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker;

    move-object/from16 v0, v17

    invoke-virtual {v4, v0}, Lcom/google/android/exoplayer2/source/hls/playlist/HlsPlaylistTracker;->getPlaylistSnapshot(Lcom/google/android/exoplayer2/source/hls/playlist/HlsMasterPlaylist$HlsUrl;)Lcom/google/android/exoplayer2/source/hls/playlist/HlsMediaPlaylist;

    move-result-object v35

    .line 225
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->getNextChunkIndex()I

    move-result v24

    goto :goto_5

    .line 218
    .end local v24    # "chunkMediaSequence":I
    :cond_9
    const/4 v4, 0x0

    goto :goto_6

    .line 229
    .end local v40    # "targetPositionUs":J
    :cond_a
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;->getNextChunkIndex()I

    move-result v24

    .restart local v24    # "chunkMediaSequence":I
    goto :goto_5

    .line 236
    :cond_b
    move-object/from16 v0, v35

    iget v4, v0, Lcom/google/android/exoplayer2/source/hls/playlist/HlsMediaPlaylist;->mediaSequence:I

    sub-int v31, v24, v4

    .line 237
    .local v31, "chunkIndex":I
    move-object/from16 v0, v35

    iget-object v4, v0, Lcom/google/android/exoplayer2/source/hls/playlist/HlsMediaPlaylist;->segments:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    move/from16 v0, v31

    if-lt v0, v4, :cond_d

    .line 238
    move-object/from16 v0, v35

    iget-boolean v4, v0, Lcom/google/android/exoplayer2/source/hls/playlist/HlsMediaPlaylist;->hasEndTag:Z

    if-eqz v4, :cond_c

    .line 239
    const/4 v4, 0x1

    move-object/from16 v0, p4

    iput-boolean v4, v0, Lcom/google/android/exoplayer2/source/hls/HlsChunkSource$HlsChunkHolder;->endOfStream:Z

    goto/16 :goto_3

    .line 241
    :cond_c
    move-object/from16 v0, v17

    move-object/from16 v1, p4

    iput-object v0, v1, Lcom/google/android/exoplayer2/source/hls/HlsChunkSource$HlsChunkHolder;->playlist:Lcom/google/android/exoplayer2/source/hls/playlist/HlsMasterPlaylist$HlsUrl;

    goto/16 :goto_3

    .line 247
    :cond_d
    move-object/from16 v0, v35

    iget-object v4, v0, Lcom/google/android/exoplayer2/source/hls/playlist/HlsMediaPlaylist;->segments:Ljava/util/List;

    move/from16 v0, v31

    invoke-interface {v4, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v37

    check-cast v37, Lcom/google/android/exoplayer2/source/hls/playlist/HlsMediaPlaylist$Segment;

    .line 250
    .local v37, "segment":Lcom/google/android/exoplayer2/source/hls/playlist/HlsMediaPlaylist$Segment;
    move-object/from16 v0, v37

    iget-boolean v4, v0, Lcom/google/android/exoplayer2/source/hls/playlist/HlsMediaPlaylist$Segment;->isEncrypted:Z

    if-eqz v4, :cond_11

    .line 251
    move-object/from16 v0, v35

    iget-object v4, v0, Lcom/google/android/exoplayer2/source/hls/playlist/HlsMediaPlaylist;->baseUri:Ljava/lang/String;

    move-object/from16 v0, v37

    iget-object v6, v0, Lcom/google/android/exoplayer2/source/hls/playlist/HlsMediaPlaylist$Segment;->encryptionKeyUri:Ljava/lang/String;

    invoke-static {v4, v6}, Lcom/google/android/exoplayer2/util/UriUtil;->resolveToUri(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v5

    .line 252
    .local v5, "keyUri":Landroid/net/Uri;
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/android/exoplayer2/source/hls/HlsChunkSource;->encryptionKeyUri:Landroid/net/Uri;

    invoke-virtual {v5, v4}, Landroid/net/Uri;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_e

    .line 254
    move-object/from16 v0, v37

    iget-object v6, v0, Lcom/google/android/exoplayer2/source/hls/playlist/HlsMediaPlaylist$Segment;->encryptionIV:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/android/exoplayer2/source/hls/HlsChunkSource;->trackSelection:Lcom/google/android/exoplayer2/trackselection/TrackSelection;

    .line 255
    invoke-interface {v4}, Lcom/google/android/exoplayer2/trackselection/TrackSelection;->getSelectionReason()I

    move-result v8

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/android/exoplayer2/source/hls/HlsChunkSource;->trackSelection:Lcom/google/android/exoplayer2/trackselection/TrackSelection;

    invoke-interface {v4}, Lcom/google/android/exoplayer2/trackselection/TrackSelection;->getSelectionData()Ljava/lang/Object;

    move-result-object v9

    move-object/from16 v4, p0

    .line 254
    invoke-direct/range {v4 .. v9}, Lcom/google/android/exoplayer2/source/hls/HlsChunkSource;->newEncryptionKeyChunk(Landroid/net/Uri;Ljava/lang/String;IILjava/lang/Object;)Lcom/google/android/exoplayer2/source/hls/HlsChunkSource$EncryptionKeyChunk;

    move-result-object v4

    move-object/from16 v0, p4

    iput-object v4, v0, Lcom/google/android/exoplayer2/source/hls/HlsChunkSource$HlsChunkHolder;->chunk:Lcom/google/android/exoplayer2/source/chunk/Chunk;

    goto/16 :goto_3

    .line 258
    :cond_e
    move-object/from16 v0, v37

    iget-object v4, v0, Lcom/google/android/exoplayer2/source/hls/playlist/HlsMediaPlaylist$Segment;->encryptionIV:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/google/android/exoplayer2/source/hls/HlsChunkSource;->encryptionIvString:Ljava/lang/String;

    invoke-static {v4, v6}, Lcom/google/android/exoplayer2/util/Util;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_f

    .line 259
    move-object/from16 v0, v37

    iget-object v4, v0, Lcom/google/android/exoplayer2/source/hls/playlist/HlsMediaPlaylist$Segment;->encryptionIV:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/google/android/exoplayer2/source/hls/HlsChunkSource;->encryptionKey:[B

    move-object/from16 v0, p0

    invoke-direct {v0, v5, v4, v6}, Lcom/google/android/exoplayer2/source/hls/HlsChunkSource;->setEncryptionData(Landroid/net/Uri;Ljava/lang/String;[B)V

    .line 265
    .end local v5    # "keyUri":Landroid/net/Uri;
    :cond_f
    :goto_7
    const/4 v8, 0x0

    .line 266
    .local v8, "initDataSpec":Lcom/google/android/exoplayer2/upstream/DataSpec;
    move-object/from16 v0, v35

    iget-object v0, v0, Lcom/google/android/exoplayer2/source/hls/playlist/HlsMediaPlaylist;->initializationSegment:Lcom/google/android/exoplayer2/source/hls/playlist/HlsMediaPlaylist$Segment;

    move-object/from16 v34, v0

    .line 267
    .local v34, "initSegment":Lcom/google/android/exoplayer2/source/hls/playlist/HlsMediaPlaylist$Segment;
    if-eqz v34, :cond_10

    .line 268
    move-object/from16 v0, v35

    iget-object v4, v0, Lcom/google/android/exoplayer2/source/hls/playlist/HlsMediaPlaylist;->baseUri:Ljava/lang/String;

    move-object/from16 v0, v34

    iget-object v6, v0, Lcom/google/android/exoplayer2/source/hls/playlist/HlsMediaPlaylist$Segment;->url:Ljava/lang/String;

    invoke-static {v4, v6}, Lcom/google/android/exoplayer2/util/UriUtil;->resolveToUri(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v9

    .line 269
    .local v9, "initSegmentUri":Landroid/net/Uri;
    new-instance v8, Lcom/google/android/exoplayer2/upstream/DataSpec;

    .end local v8    # "initDataSpec":Lcom/google/android/exoplayer2/upstream/DataSpec;
    move-object/from16 v0, v34

    iget-wide v10, v0, Lcom/google/android/exoplayer2/source/hls/playlist/HlsMediaPlaylist$Segment;->byterangeOffset:J

    move-object/from16 v0, v34

    iget-wide v12, v0, Lcom/google/android/exoplayer2/source/hls/playlist/HlsMediaPlaylist$Segment;->byterangeLength:J

    const/4 v14, 0x0

    invoke-direct/range {v8 .. v14}, Lcom/google/android/exoplayer2/upstream/DataSpec;-><init>(Landroid/net/Uri;JJLjava/lang/String;)V

    .line 274
    .end local v9    # "initSegmentUri":Landroid/net/Uri;
    .restart local v8    # "initDataSpec":Lcom/google/android/exoplayer2/upstream/DataSpec;
    :cond_10
    move-object/from16 v0, v35

    iget-wide v12, v0, Lcom/google/android/exoplayer2/source/hls/playlist/HlsMediaPlaylist;->startTimeUs:J

    move-object/from16 v0, v37

    iget-wide v14, v0, Lcom/google/android/exoplayer2/source/hls/playlist/HlsMediaPlaylist$Segment;->relativeStartTimeUs:J

    add-long v20, v12, v14

    .line 275
    .local v20, "startTimeUs":J
    move-object/from16 v0, v35

    iget v4, v0, Lcom/google/android/exoplayer2/source/hls/playlist/HlsMediaPlaylist;->discontinuitySequence:I

    move-object/from16 v0, v37

    iget v6, v0, Lcom/google/android/exoplayer2/source/hls/playlist/HlsMediaPlaylist$Segment;->relativeDiscontinuitySequence:I

    add-int v25, v4, v6

    .line 277
    .local v25, "discontinuitySequence":I
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/android/exoplayer2/source/hls/HlsChunkSource;->timestampAdjusterProvider:Lcom/google/android/exoplayer2/source/hls/TimestampAdjusterProvider;

    move/from16 v0, v25

    move-wide/from16 v1, v20

    invoke-virtual {v4, v0, v1, v2}, Lcom/google/android/exoplayer2/source/hls/TimestampAdjusterProvider;->getAdjuster(IJ)Lcom/google/android/exoplayer2/util/TimestampAdjuster;

    move-result-object v27

    .line 281
    .local v27, "timestampAdjuster":Lcom/google/android/exoplayer2/util/TimestampAdjuster;
    move-object/from16 v0, v35

    iget-object v4, v0, Lcom/google/android/exoplayer2/source/hls/playlist/HlsMediaPlaylist;->baseUri:Ljava/lang/String;

    move-object/from16 v0, v37

    iget-object v6, v0, Lcom/google/android/exoplayer2/source/hls/playlist/HlsMediaPlaylist$Segment;->url:Ljava/lang/String;

    invoke-static {v4, v6}, Lcom/google/android/exoplayer2/util/UriUtil;->resolveToUri(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v11

    .line 282
    .local v11, "chunkUri":Landroid/net/Uri;
    new-instance v10, Lcom/google/android/exoplayer2/upstream/DataSpec;

    move-object/from16 v0, v37

    iget-wide v12, v0, Lcom/google/android/exoplayer2/source/hls/playlist/HlsMediaPlaylist$Segment;->byterangeOffset:J

    move-object/from16 v0, v37

    iget-wide v14, v0, Lcom/google/android/exoplayer2/source/hls/playlist/HlsMediaPlaylist$Segment;->byterangeLength:J

    const/16 v16, 0x0

    invoke-direct/range {v10 .. v16}, Lcom/google/android/exoplayer2/upstream/DataSpec;-><init>(Landroid/net/Uri;JJLjava/lang/String;)V

    .line 284
    .local v10, "dataSpec":Lcom/google/android/exoplayer2/upstream/DataSpec;
    new-instance v13, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/google/android/exoplayer2/source/hls/HlsChunkSource;->dataSource:Lcom/google/android/exoplayer2/upstream/DataSource;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/android/exoplayer2/source/hls/HlsChunkSource;->trackSelection:Lcom/google/android/exoplayer2/trackselection/TrackSelection;

    .line 285
    invoke-interface {v4}, Lcom/google/android/exoplayer2/trackselection/TrackSelection;->getSelectionReason()I

    move-result v18

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/google/android/exoplayer2/source/hls/HlsChunkSource;->trackSelection:Lcom/google/android/exoplayer2/trackselection/TrackSelection;

    invoke-interface {v4}, Lcom/google/android/exoplayer2/trackselection/TrackSelection;->getSelectionData()Ljava/lang/Object;

    move-result-object v19

    move-object/from16 v0, v37

    iget-wide v0, v0, Lcom/google/android/exoplayer2/source/hls/playlist/HlsMediaPlaylist$Segment;->durationUs:J

    move-wide/from16 v22, v0

    add-long v22, v22, v20

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/google/android/exoplayer2/source/hls/HlsChunkSource;->isTimestampMaster:Z

    move/from16 v26, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer2/source/hls/HlsChunkSource;->encryptionKey:[B

    move-object/from16 v29, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer2/source/hls/HlsChunkSource;->encryptionIv:[B

    move-object/from16 v30, v0

    move-object v15, v10

    move-object/from16 v16, v8

    move-object/from16 v28, p1

    invoke-direct/range {v13 .. v30}, Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;-><init>(Lcom/google/android/exoplayer2/upstream/DataSource;Lcom/google/android/exoplayer2/upstream/DataSpec;Lcom/google/android/exoplayer2/upstream/DataSpec;Lcom/google/android/exoplayer2/source/hls/playlist/HlsMasterPlaylist$HlsUrl;ILjava/lang/Object;JJIIZLcom/google/android/exoplayer2/util/TimestampAdjuster;Lcom/google/android/exoplayer2/source/hls/HlsMediaChunk;[B[B)V

    move-object/from16 v0, p4

    iput-object v13, v0, Lcom/google/android/exoplayer2/source/hls/HlsChunkSource$HlsChunkHolder;->chunk:Lcom/google/android/exoplayer2/source/chunk/Chunk;

    goto/16 :goto_3

    .line 262
    .end local v8    # "initDataSpec":Lcom/google/android/exoplayer2/upstream/DataSpec;
    .end local v10    # "dataSpec":Lcom/google/android/exoplayer2/upstream/DataSpec;
    .end local v11    # "chunkUri":Landroid/net/Uri;
    .end local v20    # "startTimeUs":J
    .end local v25    # "discontinuitySequence":I
    .end local v27    # "timestampAdjuster":Lcom/google/android/exoplayer2/util/TimestampAdjuster;
    .end local v34    # "initSegment":Lcom/google/android/exoplayer2/source/hls/playlist/HlsMediaPlaylist$Segment;
    :cond_11
    invoke-direct/range {p0 .. p0}, Lcom/google/android/exoplayer2/source/hls/HlsChunkSource;->clearEncryptionData()V

    goto/16 :goto_7
.end method

.method public getTrackGroup()Lcom/google/android/exoplayer2/source/TrackGroup;
    .locals 1

    .prologue
    .line 144
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/hls/HlsChunkSource;->trackGroup:Lcom/google/android/exoplayer2/source/TrackGroup;

    return-object v0
.end method

.method public maybeThrowError()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 135
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/hls/HlsChunkSource;->fatalError:Ljava/io/IOException;

    if-eqz v0, :cond_0

    .line 136
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/hls/HlsChunkSource;->fatalError:Ljava/io/IOException;

    throw v0

    .line 138
    :cond_0
    return-void
.end method

.method public onChunkLoadCompleted(Lcom/google/android/exoplayer2/source/chunk/Chunk;)V
    .locals 4
    .param p1, "chunk"    # Lcom/google/android/exoplayer2/source/chunk/Chunk;

    .prologue
    .line 297
    instance-of v1, p1, Lcom/google/android/exoplayer2/source/hls/HlsChunkSource$EncryptionKeyChunk;

    if-eqz v1, :cond_0

    move-object v0, p1

    .line 298
    check-cast v0, Lcom/google/android/exoplayer2/source/hls/HlsChunkSource$EncryptionKeyChunk;

    .line 299
    .local v0, "encryptionKeyChunk":Lcom/google/android/exoplayer2/source/hls/HlsChunkSource$EncryptionKeyChunk;
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/source/hls/HlsChunkSource$EncryptionKeyChunk;->getDataHolder()[B

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/exoplayer2/source/hls/HlsChunkSource;->scratchSpace:[B

    .line 300
    iget-object v1, v0, Lcom/google/android/exoplayer2/source/hls/HlsChunkSource$EncryptionKeyChunk;->dataSpec:Lcom/google/android/exoplayer2/upstream/DataSpec;

    iget-object v1, v1, Lcom/google/android/exoplayer2/upstream/DataSpec;->uri:Landroid/net/Uri;

    iget-object v2, v0, Lcom/google/android/exoplayer2/source/hls/HlsChunkSource$EncryptionKeyChunk;->iv:Ljava/lang/String;

    .line 301
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/source/hls/HlsChunkSource$EncryptionKeyChunk;->getResult()[B

    move-result-object v3

    .line 300
    invoke-direct {p0, v1, v2, v3}, Lcom/google/android/exoplayer2/source/hls/HlsChunkSource;->setEncryptionData(Landroid/net/Uri;Ljava/lang/String;[B)V

    .line 303
    .end local v0    # "encryptionKeyChunk":Lcom/google/android/exoplayer2/source/hls/HlsChunkSource$EncryptionKeyChunk;
    :cond_0
    return-void
.end method

.method public onChunkLoadError(Lcom/google/android/exoplayer2/source/chunk/Chunk;ZLjava/io/IOException;)Z
    .locals 4
    .param p1, "chunk"    # Lcom/google/android/exoplayer2/source/chunk/Chunk;
    .param p2, "cancelable"    # Z
    .param p3, "error"    # Ljava/io/IOException;

    .prologue
    .line 315
    if-eqz p2, :cond_0

    iget-object v0, p0, Lcom/google/android/exoplayer2/source/hls/HlsChunkSource;->trackSelection:Lcom/google/android/exoplayer2/trackselection/TrackSelection;

    iget-object v1, p0, Lcom/google/android/exoplayer2/source/hls/HlsChunkSource;->trackSelection:Lcom/google/android/exoplayer2/trackselection/TrackSelection;

    iget-object v2, p0, Lcom/google/android/exoplayer2/source/hls/HlsChunkSource;->trackGroup:Lcom/google/android/exoplayer2/source/TrackGroup;

    iget-object v3, p1, Lcom/google/android/exoplayer2/source/chunk/Chunk;->trackFormat:Lcom/google/android/exoplayer2/Format;

    .line 316
    invoke-virtual {v2, v3}, Lcom/google/android/exoplayer2/source/TrackGroup;->indexOf(Lcom/google/android/exoplayer2/Format;)I

    move-result v2

    invoke-interface {v1, v2}, Lcom/google/android/exoplayer2/trackselection/TrackSelection;->indexOf(I)I

    move-result v1

    .line 315
    invoke-static {v0, v1, p3}, Lcom/google/android/exoplayer2/source/chunk/ChunkedTrackBlacklistUtil;->maybeBlacklistTrack(Lcom/google/android/exoplayer2/trackselection/TrackSelection;ILjava/lang/Exception;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onPlaylistBlacklisted(Lcom/google/android/exoplayer2/source/hls/playlist/HlsMasterPlaylist$HlsUrl;J)V
    .locals 6
    .param p1, "url"    # Lcom/google/android/exoplayer2/source/hls/playlist/HlsMasterPlaylist$HlsUrl;
    .param p2, "blacklistMs"    # J

    .prologue
    const/4 v4, -0x1

    .line 326
    iget-object v2, p0, Lcom/google/android/exoplayer2/source/hls/HlsChunkSource;->trackGroup:Lcom/google/android/exoplayer2/source/TrackGroup;

    iget-object v3, p1, Lcom/google/android/exoplayer2/source/hls/playlist/HlsMasterPlaylist$HlsUrl;->format:Lcom/google/android/exoplayer2/Format;

    invoke-virtual {v2, v3}, Lcom/google/android/exoplayer2/source/TrackGroup;->indexOf(Lcom/google/android/exoplayer2/Format;)I

    move-result v0

    .line 327
    .local v0, "trackGroupIndex":I
    if-eq v0, v4, :cond_0

    .line 328
    iget-object v2, p0, Lcom/google/android/exoplayer2/source/hls/HlsChunkSource;->trackSelection:Lcom/google/android/exoplayer2/trackselection/TrackSelection;

    invoke-interface {v2, v0}, Lcom/google/android/exoplayer2/trackselection/TrackSelection;->indexOf(I)I

    move-result v1

    .line 329
    .local v1, "trackSelectionIndex":I
    if-eq v1, v4, :cond_0

    .line 330
    iget-object v2, p0, Lcom/google/android/exoplayer2/source/hls/HlsChunkSource;->trackSelection:Lcom/google/android/exoplayer2/trackselection/TrackSelection;

    invoke-interface {v2, v1, p2, p3}, Lcom/google/android/exoplayer2/trackselection/TrackSelection;->blacklist(IJ)Z

    .line 333
    .end local v1    # "trackSelectionIndex":I
    :cond_0
    return-void
.end method

.method public reset()V
    .locals 1

    .prologue
    .line 160
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/exoplayer2/source/hls/HlsChunkSource;->fatalError:Ljava/io/IOException;

    .line 161
    return-void
.end method

.method public selectTracks(Lcom/google/android/exoplayer2/trackselection/TrackSelection;)V
    .locals 0
    .param p1, "trackSelection"    # Lcom/google/android/exoplayer2/trackselection/TrackSelection;

    .prologue
    .line 153
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/hls/HlsChunkSource;->trackSelection:Lcom/google/android/exoplayer2/trackselection/TrackSelection;

    .line 154
    return-void
.end method

.method public setIsTimestampMaster(Z)V
    .locals 0
    .param p1, "isTimestampMaster"    # Z

    .prologue
    .line 170
    iput-boolean p1, p0, Lcom/google/android/exoplayer2/source/hls/HlsChunkSource;->isTimestampMaster:Z

    .line 171
    return-void
.end method
