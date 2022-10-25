.class public final Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;
.super Ljava/lang/Object;
.source "FragmentedMp4Extractor.java"

# interfaces
.implements Lcom/google/android/exoplayer2/extractor/Extractor;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;,
        Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$MetadataSampleInfo;,
        Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$Flags;
    }
.end annotation


# static fields
.field public static final FACTORY:Lcom/google/android/exoplayer2/extractor/ExtractorsFactory;

.field public static final FLAG_ENABLE_CEA608_TRACK:I = 0x8

.field public static final FLAG_ENABLE_EMSG_TRACK:I = 0x4

.field private static final FLAG_SIDELOADED:I = 0x10

.field public static final FLAG_WORKAROUND_EVERY_VIDEO_FRAME_IS_SYNC_FRAME:I = 0x1

.field public static final FLAG_WORKAROUND_IGNORE_TFDT_BOX:I = 0x2

.field private static final NAL_UNIT_TYPE_SEI:I = 0x6

.field private static final PIFF_SAMPLE_ENCRYPTION_BOX_EXTENDED_TYPE:[B

.field private static final SAMPLE_GROUP_TYPE_seig:I

.field private static final STATE_READING_ATOM_HEADER:I = 0x0

.field private static final STATE_READING_ATOM_PAYLOAD:I = 0x1

.field private static final STATE_READING_ENCRYPTION_DATA:I = 0x2

.field private static final STATE_READING_SAMPLE_CONTINUE:I = 0x4

.field private static final STATE_READING_SAMPLE_START:I = 0x3

.field private static final TAG:Ljava/lang/String; = "FragmentedMp4Extractor"


# instance fields
.field private atomData:Lcom/google/android/exoplayer2/util/ParsableByteArray;

.field private final atomHeader:Lcom/google/android/exoplayer2/util/ParsableByteArray;

.field private atomHeaderBytesRead:I

.field private atomSize:J

.field private atomType:I

.field private cea608TrackOutput:Lcom/google/android/exoplayer2/extractor/TrackOutput;

.field private final containerAtoms:Ljava/util/Stack;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Stack",
            "<",
            "Lcom/google/android/exoplayer2/extractor/mp4/Atom$ContainerAtom;",
            ">;"
        }
    .end annotation
.end field

.field private currentTrackBundle:Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;

.field private durationUs:J

.field private final encryptionSignalByte:Lcom/google/android/exoplayer2/util/ParsableByteArray;

.field private endOfMdatPosition:J

.field private eventMessageTrackOutput:Lcom/google/android/exoplayer2/extractor/TrackOutput;

.field private final extendedTypeScratch:[B

.field private extractorOutput:Lcom/google/android/exoplayer2/extractor/ExtractorOutput;

.field private final flags:I

.field private haveOutputSeekMap:Z

.field private final nalLength:Lcom/google/android/exoplayer2/util/ParsableByteArray;

.field private final nalPayload:Lcom/google/android/exoplayer2/util/ParsableByteArray;

.field private final nalStartCode:Lcom/google/android/exoplayer2/util/ParsableByteArray;

.field private parserState:I

.field private pendingMetadataSampleBytes:I

.field private final pendingMetadataSampleInfos:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<",
            "Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$MetadataSampleInfo;",
            ">;"
        }
    .end annotation
.end field

.field private sampleBytesWritten:I

.field private sampleCurrentNalBytesRemaining:I

.field private sampleSize:I

.field private segmentIndexEarliestPresentationTimeUs:J

.field private final sideloadedTrack:Lcom/google/android/exoplayer2/extractor/mp4/Track;

.field private final timestampAdjuster:Lcom/google/android/exoplayer2/util/TimestampAdjuster;

.field private final trackBundles:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 62
    new-instance v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$1;

    invoke-direct {v0}, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$1;-><init>()V

    sput-object v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->FACTORY:Lcom/google/android/exoplayer2/extractor/ExtractorsFactory;

    .line 108
    const-string/jumbo v0, "seig"

    invoke-static {v0}, Lcom/google/android/exoplayer2/util/Util;->getIntegerCodeForString(Ljava/lang/String;)I

    move-result v0

    sput v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->SAMPLE_GROUP_TYPE_seig:I

    .line 110
    const/16 v0, 0x10

    new-array v0, v0, [B

    fill-array-data v0, :array_0

    sput-object v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->PIFF_SAMPLE_ENCRYPTION_BOX_EXTENDED_TYPE:[B

    return-void

    :array_0
    .array-data 1
        -0x5et
        0x39t
        0x4ft
        0x52t
        0x5at
        -0x65t
        0x4ft
        0x14t
        -0x5et
        0x44t
        0x6ct
        0x42t
        0x7ct
        0x64t
        -0x73t
        -0xct
    .end array-data
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    .line 167
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;-><init>(ILcom/google/android/exoplayer2/util/TimestampAdjuster;)V

    .line 168
    return-void
.end method

.method public constructor <init>(ILcom/google/android/exoplayer2/extractor/mp4/Track;Lcom/google/android/exoplayer2/util/TimestampAdjuster;)V
    .locals 6
    .param p1, "flags"    # I
    .param p2, "sideloadedTrack"    # Lcom/google/android/exoplayer2/extractor/mp4/Track;
    .param p3, "timestampAdjuster"    # Lcom/google/android/exoplayer2/util/TimestampAdjuster;

    .prologue
    const-wide v4, -0x7fffffffffffffffL    # -4.9E-324

    const/4 v3, 0x1

    const/16 v1, 0x10

    .line 185
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 186
    iput-object p2, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->sideloadedTrack:Lcom/google/android/exoplayer2/extractor/mp4/Track;

    .line 187
    if-eqz p2, :cond_0

    move v0, v1

    :goto_0
    or-int/2addr v0, p1

    iput v0, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->flags:I

    .line 188
    iput-object p3, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->timestampAdjuster:Lcom/google/android/exoplayer2/util/TimestampAdjuster;

    .line 189
    new-instance v0, Lcom/google/android/exoplayer2/util/ParsableByteArray;

    invoke-direct {v0, v1}, Lcom/google/android/exoplayer2/util/ParsableByteArray;-><init>(I)V

    iput-object v0, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->atomHeader:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    .line 190
    new-instance v0, Lcom/google/android/exoplayer2/util/ParsableByteArray;

    sget-object v2, Lcom/google/android/exoplayer2/util/NalUnitUtil;->NAL_START_CODE:[B

    invoke-direct {v0, v2}, Lcom/google/android/exoplayer2/util/ParsableByteArray;-><init>([B)V

    iput-object v0, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->nalStartCode:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    .line 191
    new-instance v0, Lcom/google/android/exoplayer2/util/ParsableByteArray;

    const/4 v2, 0x4

    invoke-direct {v0, v2}, Lcom/google/android/exoplayer2/util/ParsableByteArray;-><init>(I)V

    iput-object v0, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->nalLength:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    .line 192
    new-instance v0, Lcom/google/android/exoplayer2/util/ParsableByteArray;

    invoke-direct {v0, v3}, Lcom/google/android/exoplayer2/util/ParsableByteArray;-><init>(I)V

    iput-object v0, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->nalPayload:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    .line 193
    new-instance v0, Lcom/google/android/exoplayer2/util/ParsableByteArray;

    invoke-direct {v0, v3}, Lcom/google/android/exoplayer2/util/ParsableByteArray;-><init>(I)V

    iput-object v0, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->encryptionSignalByte:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    .line 194
    new-array v0, v1, [B

    iput-object v0, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->extendedTypeScratch:[B

    .line 195
    new-instance v0, Ljava/util/Stack;

    invoke-direct {v0}, Ljava/util/Stack;-><init>()V

    iput-object v0, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->containerAtoms:Ljava/util/Stack;

    .line 196
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->pendingMetadataSampleInfos:Ljava/util/LinkedList;

    .line 197
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->trackBundles:Landroid/util/SparseArray;

    .line 198
    iput-wide v4, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->durationUs:J

    .line 199
    iput-wide v4, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->segmentIndexEarliestPresentationTimeUs:J

    .line 200
    invoke-direct {p0}, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->enterReadingAtomHeaderState()V

    .line 201
    return-void

    .line 187
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public constructor <init>(ILcom/google/android/exoplayer2/util/TimestampAdjuster;)V
    .locals 1
    .param p1, "flags"    # I
    .param p2, "timestampAdjuster"    # Lcom/google/android/exoplayer2/util/TimestampAdjuster;

    .prologue
    .line 175
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, p2}, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;-><init>(ILcom/google/android/exoplayer2/extractor/mp4/Track;Lcom/google/android/exoplayer2/util/TimestampAdjuster;)V

    .line 176
    return-void
.end method

.method private appendSampleEncryptionData(Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;)I
    .locals 12
    .param p1, "trackBundle"    # Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;

    .prologue
    const/4 v10, 0x0

    .line 1184
    iget-object v7, p1, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;->fragment:Lcom/google/android/exoplayer2/extractor/mp4/TrackFragment;

    .line 1185
    .local v7, "trackFragment":Lcom/google/android/exoplayer2/extractor/mp4/TrackFragment;
    iget-object v3, v7, Lcom/google/android/exoplayer2/extractor/mp4/TrackFragment;->sampleEncryptionData:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    .line 1186
    .local v3, "sampleEncryptionData":Lcom/google/android/exoplayer2/util/ParsableByteArray;
    iget-object v9, v7, Lcom/google/android/exoplayer2/extractor/mp4/TrackFragment;->header:Lcom/google/android/exoplayer2/extractor/mp4/DefaultSampleValues;

    iget v2, v9, Lcom/google/android/exoplayer2/extractor/mp4/DefaultSampleValues;->sampleDescriptionIndex:I

    .line 1187
    .local v2, "sampleDescriptionIndex":I
    iget-object v9, v7, Lcom/google/android/exoplayer2/extractor/mp4/TrackFragment;->trackEncryptionBox:Lcom/google/android/exoplayer2/extractor/mp4/TrackEncryptionBox;

    if-eqz v9, :cond_0

    iget-object v0, v7, Lcom/google/android/exoplayer2/extractor/mp4/TrackFragment;->trackEncryptionBox:Lcom/google/android/exoplayer2/extractor/mp4/TrackEncryptionBox;

    .line 1190
    .local v0, "encryptionBox":Lcom/google/android/exoplayer2/extractor/mp4/TrackEncryptionBox;
    :goto_0
    iget v8, v0, Lcom/google/android/exoplayer2/extractor/mp4/TrackEncryptionBox;->initializationVectorSize:I

    .line 1191
    .local v8, "vectorSize":I
    iget-object v9, v7, Lcom/google/android/exoplayer2/extractor/mp4/TrackFragment;->sampleHasSubsampleEncryptionTable:[Z

    iget v11, p1, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;->currentSampleIndex:I

    aget-boolean v6, v9, v11

    .line 1195
    .local v6, "subsampleEncryption":Z
    iget-object v9, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->encryptionSignalByte:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    iget-object v11, v9, Lcom/google/android/exoplayer2/util/ParsableByteArray;->data:[B

    if-eqz v6, :cond_1

    const/16 v9, 0x80

    :goto_1
    or-int/2addr v9, v8

    int-to-byte v9, v9

    aput-byte v9, v11, v10

    .line 1196
    iget-object v9, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->encryptionSignalByte:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    invoke-virtual {v9, v10}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->setPosition(I)V

    .line 1197
    iget-object v1, p1, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;->output:Lcom/google/android/exoplayer2/extractor/TrackOutput;

    .line 1198
    .local v1, "output":Lcom/google/android/exoplayer2/extractor/TrackOutput;
    iget-object v9, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->encryptionSignalByte:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    const/4 v10, 0x1

    invoke-interface {v1, v9, v10}, Lcom/google/android/exoplayer2/extractor/TrackOutput;->sampleData(Lcom/google/android/exoplayer2/util/ParsableByteArray;I)V

    .line 1200
    invoke-interface {v1, v3, v8}, Lcom/google/android/exoplayer2/extractor/TrackOutput;->sampleData(Lcom/google/android/exoplayer2/util/ParsableByteArray;I)V

    .line 1202
    if-nez v6, :cond_2

    .line 1203
    add-int/lit8 v9, v8, 0x1

    .line 1210
    :goto_2
    return v9

    .line 1187
    .end local v0    # "encryptionBox":Lcom/google/android/exoplayer2/extractor/mp4/TrackEncryptionBox;
    .end local v1    # "output":Lcom/google/android/exoplayer2/extractor/TrackOutput;
    .end local v6    # "subsampleEncryption":Z
    .end local v8    # "vectorSize":I
    :cond_0
    iget-object v9, p1, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;->track:Lcom/google/android/exoplayer2/extractor/mp4/Track;

    iget-object v9, v9, Lcom/google/android/exoplayer2/extractor/mp4/Track;->sampleDescriptionEncryptionBoxes:[Lcom/google/android/exoplayer2/extractor/mp4/TrackEncryptionBox;

    aget-object v0, v9, v2

    goto :goto_0

    .restart local v0    # "encryptionBox":Lcom/google/android/exoplayer2/extractor/mp4/TrackEncryptionBox;
    .restart local v6    # "subsampleEncryption":Z
    .restart local v8    # "vectorSize":I
    :cond_1
    move v9, v10

    .line 1195
    goto :goto_1

    .line 1206
    .restart local v1    # "output":Lcom/google/android/exoplayer2/extractor/TrackOutput;
    :cond_2
    invoke-virtual {v3}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readUnsignedShort()I

    move-result v4

    .line 1207
    .local v4, "subsampleCount":I
    const/4 v9, -0x2

    invoke-virtual {v3, v9}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->skipBytes(I)V

    .line 1208
    mul-int/lit8 v9, v4, 0x6

    add-int/lit8 v5, v9, 0x2

    .line 1209
    .local v5, "subsampleDataLength":I
    invoke-interface {v1, v3, v5}, Lcom/google/android/exoplayer2/extractor/TrackOutput;->sampleData(Lcom/google/android/exoplayer2/util/ParsableByteArray;I)V

    .line 1210
    add-int/lit8 v9, v8, 0x1

    add-int/2addr v9, v5

    goto :goto_2
.end method

.method private enterReadingAtomHeaderState()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 262
    iput v0, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->parserState:I

    .line 263
    iput v0, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->atomHeaderBytesRead:I

    .line 264
    return-void
.end method

.method private static getDrmInitDataFromAtoms(Ljava/util/List;)Lcom/google/android/exoplayer2/drm/DrmInitData;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/exoplayer2/extractor/mp4/Atom$LeafAtom;",
            ">;)",
            "Lcom/google/android/exoplayer2/drm/DrmInitData;"
        }
    .end annotation

    .prologue
    .line 1216
    .local p0, "leafChildren":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/exoplayer2/extractor/mp4/Atom$LeafAtom;>;"
    const/4 v4, 0x0

    .line 1217
    .local v4, "schemeDatas":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/google/android/exoplayer2/drm/DrmInitData$SchemeData;>;"
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v2

    .line 1218
    .local v2, "leafChildrenSize":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v2, :cond_3

    .line 1219
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/exoplayer2/extractor/mp4/Atom$LeafAtom;

    .line 1220
    .local v0, "child":Lcom/google/android/exoplayer2/extractor/mp4/Atom$LeafAtom;
    iget v6, v0, Lcom/google/android/exoplayer2/extractor/mp4/Atom$LeafAtom;->type:I

    sget v7, Lcom/google/android/exoplayer2/extractor/mp4/Atom;->TYPE_pssh:I

    if-ne v6, v7, :cond_1

    .line 1221
    if-nez v4, :cond_0

    .line 1222
    new-instance v4, Ljava/util/ArrayList;

    .end local v4    # "schemeDatas":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/google/android/exoplayer2/drm/DrmInitData$SchemeData;>;"
    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 1224
    .restart local v4    # "schemeDatas":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/google/android/exoplayer2/drm/DrmInitData$SchemeData;>;"
    :cond_0
    iget-object v6, v0, Lcom/google/android/exoplayer2/extractor/mp4/Atom$LeafAtom;->data:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    iget-object v3, v6, Lcom/google/android/exoplayer2/util/ParsableByteArray;->data:[B

    .line 1225
    .local v3, "psshData":[B
    invoke-static {v3}, Lcom/google/android/exoplayer2/extractor/mp4/PsshAtomUtil;->parseUuid([B)Ljava/util/UUID;

    move-result-object v5

    .line 1226
    .local v5, "uuid":Ljava/util/UUID;
    if-nez v5, :cond_2

    .line 1227
    const-string/jumbo v6, "FragmentedMp4Extractor"

    const-string/jumbo v7, "Skipped pssh atom (failed to extract uuid)"

    invoke-static {v6, v7}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1218
    .end local v3    # "psshData":[B
    .end local v5    # "uuid":Ljava/util/UUID;
    :cond_1
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1229
    .restart local v3    # "psshData":[B
    .restart local v5    # "uuid":Ljava/util/UUID;
    :cond_2
    new-instance v6, Lcom/google/android/exoplayer2/drm/DrmInitData$SchemeData;

    const-string/jumbo v7, "video/mp4"

    invoke-direct {v6, v5, v7, v3}, Lcom/google/android/exoplayer2/drm/DrmInitData$SchemeData;-><init>(Ljava/util/UUID;Ljava/lang/String;[B)V

    invoke-virtual {v4, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 1233
    .end local v0    # "child":Lcom/google/android/exoplayer2/extractor/mp4/Atom$LeafAtom;
    .end local v3    # "psshData":[B
    .end local v5    # "uuid":Ljava/util/UUID;
    :cond_3
    if-nez v4, :cond_4

    const/4 v6, 0x0

    :goto_2
    return-object v6

    :cond_4
    new-instance v6, Lcom/google/android/exoplayer2/drm/DrmInitData;

    invoke-direct {v6, v4}, Lcom/google/android/exoplayer2/drm/DrmInitData;-><init>(Ljava/util/List;)V

    goto :goto_2
.end method

.method private static getNextFragmentRun(Landroid/util/SparseArray;)Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/SparseArray",
            "<",
            "Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;",
            ">;)",
            "Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;"
        }
    .end annotation

    .prologue
    .line 1156
    .local p0, "trackBundles":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;>;"
    const/4 v1, 0x0

    .line 1157
    .local v1, "nextTrackBundle":Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;
    const-wide v2, 0x7fffffffffffffffL

    .line 1159
    .local v2, "nextTrackRunOffset":J
    invoke-virtual {p0}, Landroid/util/SparseArray;->size()I

    move-result v5

    .line 1160
    .local v5, "trackBundlesSize":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, v5, :cond_2

    .line 1161
    invoke-virtual {p0, v0}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;

    .line 1162
    .local v4, "trackBundle":Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;
    iget v8, v4, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;->currentTrackRunIndex:I

    iget-object v9, v4, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;->fragment:Lcom/google/android/exoplayer2/extractor/mp4/TrackFragment;

    iget v9, v9, Lcom/google/android/exoplayer2/extractor/mp4/TrackFragment;->trunCount:I

    if-ne v8, v9, :cond_1

    .line 1160
    :cond_0
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1165
    :cond_1
    iget-object v8, v4, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;->fragment:Lcom/google/android/exoplayer2/extractor/mp4/TrackFragment;

    iget-object v8, v8, Lcom/google/android/exoplayer2/extractor/mp4/TrackFragment;->trunDataPosition:[J

    iget v9, v4, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;->currentTrackRunIndex:I

    aget-wide v6, v8, v9

    .line 1166
    .local v6, "trunOffset":J
    cmp-long v8, v6, v2

    if-gez v8, :cond_0

    .line 1167
    move-object v1, v4

    .line 1168
    move-wide v2, v6

    goto :goto_1

    .line 1172
    .end local v4    # "trackBundle":Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;
    .end local v6    # "trunOffset":J
    :cond_2
    return-object v1
.end method

.method private maybeInitExtraTracks()V
    .locals 8

    .prologue
    const/4 v0, 0x0

    .line 451
    iget v1, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->flags:I

    and-int/lit8 v1, v1, 0x4

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->eventMessageTrackOutput:Lcom/google/android/exoplayer2/extractor/TrackOutput;

    if-nez v1, :cond_0

    .line 452
    iget-object v1, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->extractorOutput:Lcom/google/android/exoplayer2/extractor/ExtractorOutput;

    iget-object v2, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->trackBundles:Landroid/util/SparseArray;

    invoke-virtual {v2}, Landroid/util/SparseArray;->size()I

    move-result v2

    invoke-interface {v1, v2}, Lcom/google/android/exoplayer2/extractor/ExtractorOutput;->track(I)Lcom/google/android/exoplayer2/extractor/TrackOutput;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->eventMessageTrackOutput:Lcom/google/android/exoplayer2/extractor/TrackOutput;

    .line 453
    iget-object v1, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->eventMessageTrackOutput:Lcom/google/android/exoplayer2/extractor/TrackOutput;

    const-string/jumbo v2, "application/x-emsg"

    const-wide v4, 0x7fffffffffffffffL

    invoke-static {v0, v2, v4, v5}, Lcom/google/android/exoplayer2/Format;->createSampleFormat(Ljava/lang/String;Ljava/lang/String;J)Lcom/google/android/exoplayer2/Format;

    move-result-object v2

    invoke-interface {v1, v2}, Lcom/google/android/exoplayer2/extractor/TrackOutput;->format(Lcom/google/android/exoplayer2/Format;)V

    .line 456
    :cond_0
    iget v1, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->flags:I

    and-int/lit8 v1, v1, 0x8

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->cea608TrackOutput:Lcom/google/android/exoplayer2/extractor/TrackOutput;

    if-nez v1, :cond_1

    .line 457
    iget-object v1, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->extractorOutput:Lcom/google/android/exoplayer2/extractor/ExtractorOutput;

    iget-object v2, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->trackBundles:Landroid/util/SparseArray;

    invoke-virtual {v2}, Landroid/util/SparseArray;->size()I

    move-result v2

    add-int/lit8 v2, v2, 0x1

    invoke-interface {v1, v2}, Lcom/google/android/exoplayer2/extractor/ExtractorOutput;->track(I)Lcom/google/android/exoplayer2/extractor/TrackOutput;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->cea608TrackOutput:Lcom/google/android/exoplayer2/extractor/TrackOutput;

    .line 458
    iget-object v7, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->cea608TrackOutput:Lcom/google/android/exoplayer2/extractor/TrackOutput;

    const-string/jumbo v1, "application/cea-608"

    const/4 v3, -0x1

    const/4 v4, 0x0

    move-object v2, v0

    move-object v5, v0

    move-object v6, v0

    invoke-static/range {v0 .. v6}, Lcom/google/android/exoplayer2/Format;->createTextSampleFormat(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IILjava/lang/String;Lcom/google/android/exoplayer2/drm/DrmInitData;)Lcom/google/android/exoplayer2/Format;

    move-result-object v0

    invoke-interface {v7, v0}, Lcom/google/android/exoplayer2/extractor/TrackOutput;->format(Lcom/google/android/exoplayer2/Format;)V

    .line 461
    :cond_1
    return-void
.end method

.method private onContainerAtomRead(Lcom/google/android/exoplayer2/extractor/mp4/Atom$ContainerAtom;)V
    .locals 2
    .param p1, "container"    # Lcom/google/android/exoplayer2/extractor/mp4/Atom$ContainerAtom;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ParserException;
        }
    .end annotation

    .prologue
    .line 375
    iget v0, p1, Lcom/google/android/exoplayer2/extractor/mp4/Atom$ContainerAtom;->type:I

    sget v1, Lcom/google/android/exoplayer2/extractor/mp4/Atom;->TYPE_moov:I

    if-ne v0, v1, :cond_1

    .line 376
    invoke-direct {p0, p1}, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->onMoovContainerAtomRead(Lcom/google/android/exoplayer2/extractor/mp4/Atom$ContainerAtom;)V

    .line 382
    :cond_0
    :goto_0
    return-void

    .line 377
    :cond_1
    iget v0, p1, Lcom/google/android/exoplayer2/extractor/mp4/Atom$ContainerAtom;->type:I

    sget v1, Lcom/google/android/exoplayer2/extractor/mp4/Atom;->TYPE_moof:I

    if-ne v0, v1, :cond_2

    .line 378
    invoke-direct {p0, p1}, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->onMoofContainerAtomRead(Lcom/google/android/exoplayer2/extractor/mp4/Atom$ContainerAtom;)V

    goto :goto_0

    .line 379
    :cond_2
    iget-object v0, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->containerAtoms:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 380
    iget-object v0, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->containerAtoms:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->peek()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/exoplayer2/extractor/mp4/Atom$ContainerAtom;

    invoke-virtual {v0, p1}, Lcom/google/android/exoplayer2/extractor/mp4/Atom$ContainerAtom;->add(Lcom/google/android/exoplayer2/extractor/mp4/Atom$ContainerAtom;)V

    goto :goto_0
.end method

.method private onEmsgLeafAtomRead(Lcom/google/android/exoplayer2/util/ParsableByteArray;)V
    .locals 18
    .param p1, "atom"    # Lcom/google/android/exoplayer2/util/ParsableByteArray;

    .prologue
    .line 467
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->eventMessageTrackOutput:Lcom/google/android/exoplayer2/extractor/TrackOutput;

    if-nez v2, :cond_0

    .line 493
    :goto_0
    return-void

    .line 471
    :cond_0
    const/16 v2, 0xc

    move-object/from16 v0, p1

    invoke-virtual {v0, v2}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->setPosition(I)V

    .line 472
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readNullTerminatedString()Ljava/lang/String;

    .line 473
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readNullTerminatedString()Ljava/lang/String;

    .line 474
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readUnsignedInt()J

    move-result-wide v6

    .line 476
    .local v6, "timescale":J
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readUnsignedInt()J

    move-result-wide v2

    const-wide/32 v4, 0xf4240

    invoke-static/range {v2 .. v7}, Lcom/google/android/exoplayer2/util/Util;->scaleLargeTimestamp(JJJ)J

    move-result-wide v16

    .line 478
    .local v16, "presentationTimeDeltaUs":J
    const/16 v2, 0xc

    move-object/from16 v0, p1

    invoke-virtual {v0, v2}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->setPosition(I)V

    .line 479
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->bytesLeft()I

    move-result v13

    .line 480
    .local v13, "sampleSize":I
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->eventMessageTrackOutput:Lcom/google/android/exoplayer2/extractor/TrackOutput;

    move-object/from16 v0, p1

    invoke-interface {v2, v0, v13}, Lcom/google/android/exoplayer2/extractor/TrackOutput;->sampleData(Lcom/google/android/exoplayer2/util/ParsableByteArray;I)V

    .line 482
    move-object/from16 v0, p0

    iget-wide v2, v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->segmentIndexEarliestPresentationTimeUs:J

    const-wide v4, -0x7fffffffffffffffL    # -4.9E-324

    cmp-long v2, v2, v4

    if-eqz v2, :cond_1

    .line 484
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->eventMessageTrackOutput:Lcom/google/android/exoplayer2/extractor/TrackOutput;

    move-object/from16 v0, p0

    iget-wide v2, v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->segmentIndexEarliestPresentationTimeUs:J

    add-long v10, v2, v16

    const/4 v12, 0x1

    const/4 v14, 0x0

    const/4 v15, 0x0

    invoke-interface/range {v9 .. v15}, Lcom/google/android/exoplayer2/extractor/TrackOutput;->sampleMetadata(JIII[B)V

    goto :goto_0

    .line 489
    :cond_1
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->pendingMetadataSampleInfos:Ljava/util/LinkedList;

    new-instance v3, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$MetadataSampleInfo;

    move-wide/from16 v0, v16

    invoke-direct {v3, v0, v1, v13}, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$MetadataSampleInfo;-><init>(JI)V

    invoke-virtual {v2, v3}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 491
    move-object/from16 v0, p0

    iget v2, v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->pendingMetadataSampleBytes:I

    add-int/2addr v2, v13

    move-object/from16 v0, p0

    iput v2, v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->pendingMetadataSampleBytes:I

    goto :goto_0
.end method

.method private onLeafAtomRead(Lcom/google/android/exoplayer2/extractor/mp4/Atom$LeafAtom;J)V
    .locals 4
    .param p1, "leaf"    # Lcom/google/android/exoplayer2/extractor/mp4/Atom$LeafAtom;
    .param p2, "inputPosition"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ParserException;
        }
    .end annotation

    .prologue
    .line 362
    iget-object v1, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->containerAtoms:Ljava/util/Stack;

    invoke-virtual {v1}, Ljava/util/Stack;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1

    .line 363
    iget-object v1, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->containerAtoms:Ljava/util/Stack;

    invoke-virtual {v1}, Ljava/util/Stack;->peek()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/exoplayer2/extractor/mp4/Atom$ContainerAtom;

    invoke-virtual {v1, p1}, Lcom/google/android/exoplayer2/extractor/mp4/Atom$ContainerAtom;->add(Lcom/google/android/exoplayer2/extractor/mp4/Atom$LeafAtom;)V

    .line 372
    :cond_0
    :goto_0
    return-void

    .line 364
    :cond_1
    iget v1, p1, Lcom/google/android/exoplayer2/extractor/mp4/Atom$LeafAtom;->type:I

    sget v2, Lcom/google/android/exoplayer2/extractor/mp4/Atom;->TYPE_sidx:I

    if-ne v1, v2, :cond_2

    .line 365
    iget-object v1, p1, Lcom/google/android/exoplayer2/extractor/mp4/Atom$LeafAtom;->data:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    invoke-static {v1, p2, p3}, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->parseSidx(Lcom/google/android/exoplayer2/util/ParsableByteArray;J)Landroid/util/Pair;

    move-result-object v0

    .line 366
    .local v0, "result":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/Long;Lcom/google/android/exoplayer2/extractor/ChunkIndex;>;"
    iget-object v1, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Long;

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->segmentIndexEarliestPresentationTimeUs:J

    .line 367
    iget-object v2, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->extractorOutput:Lcom/google/android/exoplayer2/extractor/ExtractorOutput;

    iget-object v1, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v1, Lcom/google/android/exoplayer2/extractor/SeekMap;

    invoke-interface {v2, v1}, Lcom/google/android/exoplayer2/extractor/ExtractorOutput;->seekMap(Lcom/google/android/exoplayer2/extractor/SeekMap;)V

    .line 368
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->haveOutputSeekMap:Z

    goto :goto_0

    .line 369
    .end local v0    # "result":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/Long;Lcom/google/android/exoplayer2/extractor/ChunkIndex;>;"
    :cond_2
    iget v1, p1, Lcom/google/android/exoplayer2/extractor/mp4/Atom$LeafAtom;->type:I

    sget v2, Lcom/google/android/exoplayer2/extractor/mp4/Atom;->TYPE_emsg:I

    if-ne v1, v2, :cond_0

    .line 370
    iget-object v1, p1, Lcom/google/android/exoplayer2/extractor/mp4/Atom$LeafAtom;->data:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    invoke-direct {p0, v1}, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->onEmsgLeafAtomRead(Lcom/google/android/exoplayer2/util/ParsableByteArray;)V

    goto :goto_0
.end method

.method private onMoofContainerAtomRead(Lcom/google/android/exoplayer2/extractor/mp4/Atom$ContainerAtom;)V
    .locals 6
    .param p1, "moof"    # Lcom/google/android/exoplayer2/extractor/mp4/Atom$ContainerAtom;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ParserException;
        }
    .end annotation

    .prologue
    .line 440
    iget-object v3, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->trackBundles:Landroid/util/SparseArray;

    iget v4, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->flags:I

    iget-object v5, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->extendedTypeScratch:[B

    invoke-static {p1, v3, v4, v5}, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->parseMoof(Lcom/google/android/exoplayer2/extractor/mp4/Atom$ContainerAtom;Landroid/util/SparseArray;I[B)V

    .line 441
    iget-object v3, p1, Lcom/google/android/exoplayer2/extractor/mp4/Atom$ContainerAtom;->leafChildren:Ljava/util/List;

    invoke-static {v3}, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->getDrmInitDataFromAtoms(Ljava/util/List;)Lcom/google/android/exoplayer2/drm/DrmInitData;

    move-result-object v0

    .line 442
    .local v0, "drmInitData":Lcom/google/android/exoplayer2/drm/DrmInitData;
    if-eqz v0, :cond_0

    .line 443
    iget-object v3, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->trackBundles:Landroid/util/SparseArray;

    invoke-virtual {v3}, Landroid/util/SparseArray;->size()I

    move-result v2

    .line 444
    .local v2, "trackCount":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v2, :cond_0

    .line 445
    iget-object v3, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->trackBundles:Landroid/util/SparseArray;

    invoke-virtual {v3, v1}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;

    invoke-virtual {v3, v0}, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;->updateDrmInitData(Lcom/google/android/exoplayer2/drm/DrmInitData;)V

    .line 444
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 448
    .end local v1    # "i":I
    .end local v2    # "trackCount":I
    :cond_0
    return-void
.end method

.method private onMoovContainerAtomRead(Lcom/google/android/exoplayer2/extractor/mp4/Atom$ContainerAtom;)V
    .locals 24
    .param p1, "moov"    # Lcom/google/android/exoplayer2/extractor/mp4/Atom$ContainerAtom;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ParserException;
        }
    .end annotation

    .prologue
    .line 385
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->sideloadedTrack:Lcom/google/android/exoplayer2/extractor/mp4/Track;

    if-nez v5, :cond_1

    const/4 v5, 0x1

    :goto_0
    const-string/jumbo v9, "Unexpected moov box."

    invoke-static {v5, v9}, Lcom/google/android/exoplayer2/util/Assertions;->checkState(ZLjava/lang/Object;)V

    .line 387
    move-object/from16 v0, p1

    iget-object v5, v0, Lcom/google/android/exoplayer2/extractor/mp4/Atom$ContainerAtom;->leafChildren:Ljava/util/List;

    invoke-static {v5}, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->getDrmInitDataFromAtoms(Ljava/util/List;)Lcom/google/android/exoplayer2/drm/DrmInitData;

    move-result-object v8

    .line 390
    .local v8, "drmInitData":Lcom/google/android/exoplayer2/drm/DrmInitData;
    sget v5, Lcom/google/android/exoplayer2/extractor/mp4/Atom;->TYPE_mvex:I

    move-object/from16 v0, p1

    invoke-virtual {v0, v5}, Lcom/google/android/exoplayer2/extractor/mp4/Atom$ContainerAtom;->getContainerAtomOfType(I)Lcom/google/android/exoplayer2/extractor/mp4/Atom$ContainerAtom;

    move-result-object v13

    .line 391
    .local v13, "mvex":Lcom/google/android/exoplayer2/extractor/mp4/Atom$ContainerAtom;
    new-instance v10, Landroid/util/SparseArray;

    invoke-direct {v10}, Landroid/util/SparseArray;-><init>()V

    .line 392
    .local v10, "defaultSampleValuesArray":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Lcom/google/android/exoplayer2/extractor/mp4/DefaultSampleValues;>;"
    const-wide v6, -0x7fffffffffffffffL    # -4.9E-324

    .line 393
    .local v6, "duration":J
    iget-object v5, v13, Lcom/google/android/exoplayer2/extractor/mp4/Atom$ContainerAtom;->leafChildren:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v14

    .line 394
    .local v14, "mvexChildrenSize":I
    const/4 v11, 0x0

    .local v11, "i":I
    :goto_1
    if-ge v11, v14, :cond_3

    .line 395
    iget-object v5, v13, Lcom/google/android/exoplayer2/extractor/mp4/Atom$ContainerAtom;->leafChildren:Ljava/util/List;

    invoke-interface {v5, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/google/android/exoplayer2/extractor/mp4/Atom$LeafAtom;

    .line 396
    .local v4, "atom":Lcom/google/android/exoplayer2/extractor/mp4/Atom$LeafAtom;
    iget v5, v4, Lcom/google/android/exoplayer2/extractor/mp4/Atom$LeafAtom;->type:I

    sget v9, Lcom/google/android/exoplayer2/extractor/mp4/Atom;->TYPE_trex:I

    if-ne v5, v9, :cond_2

    .line 397
    iget-object v5, v4, Lcom/google/android/exoplayer2/extractor/mp4/Atom$LeafAtom;->data:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    invoke-static {v5}, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->parseTrex(Lcom/google/android/exoplayer2/util/ParsableByteArray;)Landroid/util/Pair;

    move-result-object v19

    .line 398
    .local v19, "trexData":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/Integer;Lcom/google/android/exoplayer2/extractor/mp4/DefaultSampleValues;>;"
    move-object/from16 v0, v19

    iget-object v5, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    move-object/from16 v0, v19

    iget-object v9, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    invoke-virtual {v10, v5, v9}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 394
    .end local v19    # "trexData":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/Integer;Lcom/google/android/exoplayer2/extractor/mp4/DefaultSampleValues;>;"
    :cond_0
    :goto_2
    add-int/lit8 v11, v11, 0x1

    goto :goto_1

    .line 385
    .end local v4    # "atom":Lcom/google/android/exoplayer2/extractor/mp4/Atom$LeafAtom;
    .end local v6    # "duration":J
    .end local v8    # "drmInitData":Lcom/google/android/exoplayer2/drm/DrmInitData;
    .end local v10    # "defaultSampleValuesArray":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Lcom/google/android/exoplayer2/extractor/mp4/DefaultSampleValues;>;"
    .end local v11    # "i":I
    .end local v13    # "mvex":Lcom/google/android/exoplayer2/extractor/mp4/Atom$ContainerAtom;
    .end local v14    # "mvexChildrenSize":I
    :cond_1
    const/4 v5, 0x0

    goto :goto_0

    .line 399
    .restart local v4    # "atom":Lcom/google/android/exoplayer2/extractor/mp4/Atom$LeafAtom;
    .restart local v6    # "duration":J
    .restart local v8    # "drmInitData":Lcom/google/android/exoplayer2/drm/DrmInitData;
    .restart local v10    # "defaultSampleValuesArray":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Lcom/google/android/exoplayer2/extractor/mp4/DefaultSampleValues;>;"
    .restart local v11    # "i":I
    .restart local v13    # "mvex":Lcom/google/android/exoplayer2/extractor/mp4/Atom$ContainerAtom;
    .restart local v14    # "mvexChildrenSize":I
    :cond_2
    iget v5, v4, Lcom/google/android/exoplayer2/extractor/mp4/Atom$LeafAtom;->type:I

    sget v9, Lcom/google/android/exoplayer2/extractor/mp4/Atom;->TYPE_mehd:I

    if-ne v5, v9, :cond_0

    .line 400
    iget-object v5, v4, Lcom/google/android/exoplayer2/extractor/mp4/Atom$LeafAtom;->data:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    invoke-static {v5}, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->parseMehd(Lcom/google/android/exoplayer2/util/ParsableByteArray;)J

    move-result-wide v6

    goto :goto_2

    .line 405
    .end local v4    # "atom":Lcom/google/android/exoplayer2/extractor/mp4/Atom$LeafAtom;
    :cond_3
    new-instance v18, Landroid/util/SparseArray;

    invoke-direct/range {v18 .. v18}, Landroid/util/SparseArray;-><init>()V

    .line 406
    .local v18, "tracks":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Lcom/google/android/exoplayer2/extractor/mp4/Track;>;"
    move-object/from16 v0, p1

    iget-object v5, v0, Lcom/google/android/exoplayer2/extractor/mp4/Atom$ContainerAtom;->containerChildren:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v12

    .line 407
    .local v12, "moovContainerChildrenSize":I
    const/4 v11, 0x0

    :goto_3
    if-ge v11, v12, :cond_5

    .line 408
    move-object/from16 v0, p1

    iget-object v5, v0, Lcom/google/android/exoplayer2/extractor/mp4/Atom$ContainerAtom;->containerChildren:Ljava/util/List;

    invoke-interface {v5, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/google/android/exoplayer2/extractor/mp4/Atom$ContainerAtom;

    .line 409
    .local v4, "atom":Lcom/google/android/exoplayer2/extractor/mp4/Atom$ContainerAtom;
    iget v5, v4, Lcom/google/android/exoplayer2/extractor/mp4/Atom$ContainerAtom;->type:I

    sget v9, Lcom/google/android/exoplayer2/extractor/mp4/Atom;->TYPE_trak:I

    if-ne v5, v9, :cond_4

    .line 410
    sget v5, Lcom/google/android/exoplayer2/extractor/mp4/Atom;->TYPE_mvhd:I

    move-object/from16 v0, p1

    invoke-virtual {v0, v5}, Lcom/google/android/exoplayer2/extractor/mp4/Atom$ContainerAtom;->getLeafAtomOfType(I)Lcom/google/android/exoplayer2/extractor/mp4/Atom$LeafAtom;

    move-result-object v5

    const/4 v9, 0x0

    invoke-static/range {v4 .. v9}, Lcom/google/android/exoplayer2/extractor/mp4/AtomParsers;->parseTrak(Lcom/google/android/exoplayer2/extractor/mp4/Atom$ContainerAtom;Lcom/google/android/exoplayer2/extractor/mp4/Atom$LeafAtom;JLcom/google/android/exoplayer2/drm/DrmInitData;Z)Lcom/google/android/exoplayer2/extractor/mp4/Track;

    move-result-object v15

    .line 412
    .local v15, "track":Lcom/google/android/exoplayer2/extractor/mp4/Track;
    if-eqz v15, :cond_4

    .line 413
    iget v5, v15, Lcom/google/android/exoplayer2/extractor/mp4/Track;->id:I

    move-object/from16 v0, v18

    invoke-virtual {v0, v5, v15}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 407
    .end local v15    # "track":Lcom/google/android/exoplayer2/extractor/mp4/Track;
    :cond_4
    add-int/lit8 v11, v11, 0x1

    goto :goto_3

    .line 418
    .end local v4    # "atom":Lcom/google/android/exoplayer2/extractor/mp4/Atom$ContainerAtom;
    :cond_5
    invoke-virtual/range {v18 .. v18}, Landroid/util/SparseArray;->size()I

    move-result v17

    .line 419
    .local v17, "trackCount":I
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->trackBundles:Landroid/util/SparseArray;

    invoke-virtual {v5}, Landroid/util/SparseArray;->size()I

    move-result v5

    if-nez v5, :cond_8

    .line 421
    const/4 v11, 0x0

    :goto_4
    move/from16 v0, v17

    if-ge v11, v0, :cond_6

    .line 422
    move-object/from16 v0, v18

    invoke-virtual {v0, v11}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lcom/google/android/exoplayer2/extractor/mp4/Track;

    .line 423
    .restart local v15    # "track":Lcom/google/android/exoplayer2/extractor/mp4/Track;
    new-instance v16, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->extractorOutput:Lcom/google/android/exoplayer2/extractor/ExtractorOutput;

    invoke-interface {v5, v11}, Lcom/google/android/exoplayer2/extractor/ExtractorOutput;->track(I)Lcom/google/android/exoplayer2/extractor/TrackOutput;

    move-result-object v5

    move-object/from16 v0, v16

    invoke-direct {v0, v5}, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;-><init>(Lcom/google/android/exoplayer2/extractor/TrackOutput;)V

    .line 424
    .local v16, "trackBundle":Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;
    iget v5, v15, Lcom/google/android/exoplayer2/extractor/mp4/Track;->id:I

    invoke-virtual {v10, v5}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/google/android/exoplayer2/extractor/mp4/DefaultSampleValues;

    move-object/from16 v0, v16

    invoke-virtual {v0, v15, v5}, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;->init(Lcom/google/android/exoplayer2/extractor/mp4/Track;Lcom/google/android/exoplayer2/extractor/mp4/DefaultSampleValues;)V

    .line 425
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->trackBundles:Landroid/util/SparseArray;

    iget v9, v15, Lcom/google/android/exoplayer2/extractor/mp4/Track;->id:I

    move-object/from16 v0, v16

    invoke-virtual {v5, v9, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 426
    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->durationUs:J

    move-wide/from16 v20, v0

    iget-wide v0, v15, Lcom/google/android/exoplayer2/extractor/mp4/Track;->durationUs:J

    move-wide/from16 v22, v0

    invoke-static/range {v20 .. v23}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v20

    move-wide/from16 v0, v20

    move-object/from16 v2, p0

    iput-wide v0, v2, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->durationUs:J

    .line 421
    add-int/lit8 v11, v11, 0x1

    goto :goto_4

    .line 428
    .end local v15    # "track":Lcom/google/android/exoplayer2/extractor/mp4/Track;
    .end local v16    # "trackBundle":Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;
    :cond_6
    invoke-direct/range {p0 .. p0}, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->maybeInitExtraTracks()V

    .line 429
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->extractorOutput:Lcom/google/android/exoplayer2/extractor/ExtractorOutput;

    invoke-interface {v5}, Lcom/google/android/exoplayer2/extractor/ExtractorOutput;->endTracks()V

    .line 437
    :cond_7
    return-void

    .line 431
    :cond_8
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->trackBundles:Landroid/util/SparseArray;

    invoke-virtual {v5}, Landroid/util/SparseArray;->size()I

    move-result v5

    move/from16 v0, v17

    if-ne v5, v0, :cond_9

    const/4 v5, 0x1

    :goto_5
    invoke-static {v5}, Lcom/google/android/exoplayer2/util/Assertions;->checkState(Z)V

    .line 432
    const/4 v11, 0x0

    :goto_6
    move/from16 v0, v17

    if-ge v11, v0, :cond_7

    .line 433
    move-object/from16 v0, v18

    invoke-virtual {v0, v11}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lcom/google/android/exoplayer2/extractor/mp4/Track;

    .line 434
    .restart local v15    # "track":Lcom/google/android/exoplayer2/extractor/mp4/Track;
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->trackBundles:Landroid/util/SparseArray;

    iget v9, v15, Lcom/google/android/exoplayer2/extractor/mp4/Track;->id:I

    invoke-virtual {v5, v9}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;

    iget v9, v15, Lcom/google/android/exoplayer2/extractor/mp4/Track;->id:I

    invoke-virtual {v10, v9}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/google/android/exoplayer2/extractor/mp4/DefaultSampleValues;

    invoke-virtual {v5, v15, v9}, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;->init(Lcom/google/android/exoplayer2/extractor/mp4/Track;Lcom/google/android/exoplayer2/extractor/mp4/DefaultSampleValues;)V

    .line 432
    add-int/lit8 v11, v11, 0x1

    goto :goto_6

    .line 431
    .end local v15    # "track":Lcom/google/android/exoplayer2/extractor/mp4/Track;
    :cond_9
    const/4 v5, 0x0

    goto :goto_5
.end method

.method private static parseMehd(Lcom/google/android/exoplayer2/util/ParsableByteArray;)J
    .locals 4
    .param p0, "mehd"    # Lcom/google/android/exoplayer2/util/ParsableByteArray;

    .prologue
    .line 514
    const/16 v2, 0x8

    invoke-virtual {p0, v2}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->setPosition(I)V

    .line 515
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readInt()I

    move-result v0

    .line 516
    .local v0, "fullAtom":I
    invoke-static {v0}, Lcom/google/android/exoplayer2/extractor/mp4/Atom;->parseFullAtomVersion(I)I

    move-result v1

    .line 517
    .local v1, "version":I
    if-nez v1, :cond_0

    invoke-virtual {p0}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readUnsignedInt()J

    move-result-wide v2

    :goto_0
    return-wide v2

    :cond_0
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readUnsignedLongToLong()J

    move-result-wide v2

    goto :goto_0
.end method

.method private static parseMoof(Lcom/google/android/exoplayer2/extractor/mp4/Atom$ContainerAtom;Landroid/util/SparseArray;I[B)V
    .locals 5
    .param p0, "moof"    # Lcom/google/android/exoplayer2/extractor/mp4/Atom$ContainerAtom;
    .param p2, "flags"    # I
    .param p3, "extendedTypeScratch"    # [B
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/exoplayer2/extractor/mp4/Atom$ContainerAtom;",
            "Landroid/util/SparseArray",
            "<",
            "Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;",
            ">;I[B)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ParserException;
        }
    .end annotation

    .prologue
    .line 522
    .local p1, "trackBundleArray":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;>;"
    iget-object v3, p0, Lcom/google/android/exoplayer2/extractor/mp4/Atom$ContainerAtom;->containerChildren:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v2

    .line 523
    .local v2, "moofContainerChildrenSize":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v2, :cond_1

    .line 524
    iget-object v3, p0, Lcom/google/android/exoplayer2/extractor/mp4/Atom$ContainerAtom;->containerChildren:Ljava/util/List;

    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/exoplayer2/extractor/mp4/Atom$ContainerAtom;

    .line 526
    .local v0, "child":Lcom/google/android/exoplayer2/extractor/mp4/Atom$ContainerAtom;
    iget v3, v0, Lcom/google/android/exoplayer2/extractor/mp4/Atom$ContainerAtom;->type:I

    sget v4, Lcom/google/android/exoplayer2/extractor/mp4/Atom;->TYPE_traf:I

    if-ne v3, v4, :cond_0

    .line 527
    invoke-static {v0, p1, p2, p3}, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->parseTraf(Lcom/google/android/exoplayer2/extractor/mp4/Atom$ContainerAtom;Landroid/util/SparseArray;I[B)V

    .line 523
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 530
    .end local v0    # "child":Lcom/google/android/exoplayer2/extractor/mp4/Atom$ContainerAtom;
    :cond_1
    return-void
.end method

.method private static parseSaio(Lcom/google/android/exoplayer2/util/ParsableByteArray;Lcom/google/android/exoplayer2/extractor/mp4/TrackFragment;)V
    .locals 8
    .param p0, "saio"    # Lcom/google/android/exoplayer2/util/ParsableByteArray;
    .param p1, "out"    # Lcom/google/android/exoplayer2/extractor/mp4/TrackFragment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ParserException;
        }
    .end annotation

    .prologue
    const/16 v6, 0x8

    const/4 v5, 0x1

    .line 659
    invoke-virtual {p0, v6}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->setPosition(I)V

    .line 660
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readInt()I

    move-result v2

    .line 661
    .local v2, "fullAtom":I
    invoke-static {v2}, Lcom/google/android/exoplayer2/extractor/mp4/Atom;->parseFullAtomFlags(I)I

    move-result v1

    .line 662
    .local v1, "flags":I
    and-int/lit8 v4, v1, 0x1

    if-ne v4, v5, :cond_0

    .line 663
    invoke-virtual {p0, v6}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->skipBytes(I)V

    .line 666
    :cond_0
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v0

    .line 667
    .local v0, "entryCount":I
    if-eq v0, v5, :cond_1

    .line 669
    new-instance v4, Lcom/google/android/exoplayer2/ParserException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "Unexpected saio entry count: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lcom/google/android/exoplayer2/ParserException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 672
    :cond_1
    invoke-static {v2}, Lcom/google/android/exoplayer2/extractor/mp4/Atom;->parseFullAtomVersion(I)I

    move-result v3

    .line 673
    .local v3, "version":I
    iget-wide v6, p1, Lcom/google/android/exoplayer2/extractor/mp4/TrackFragment;->auxiliaryDataPosition:J

    if-nez v3, :cond_2

    .line 674
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readUnsignedInt()J

    move-result-wide v4

    :goto_0
    add-long/2addr v4, v6

    iput-wide v4, p1, Lcom/google/android/exoplayer2/extractor/mp4/TrackFragment;->auxiliaryDataPosition:J

    .line 675
    return-void

    .line 674
    :cond_2
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readUnsignedLongToLong()J

    move-result-wide v4

    goto :goto_0
.end method

.method private static parseSaiz(Lcom/google/android/exoplayer2/extractor/mp4/TrackEncryptionBox;Lcom/google/android/exoplayer2/util/ParsableByteArray;Lcom/google/android/exoplayer2/extractor/mp4/TrackFragment;)V
    .locals 13
    .param p0, "encryptionBox"    # Lcom/google/android/exoplayer2/extractor/mp4/TrackEncryptionBox;
    .param p1, "saiz"    # Lcom/google/android/exoplayer2/util/ParsableByteArray;
    .param p2, "out"    # Lcom/google/android/exoplayer2/extractor/mp4/TrackFragment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ParserException;
        }
    .end annotation

    .prologue
    .line 622
    iget v9, p0, Lcom/google/android/exoplayer2/extractor/mp4/TrackEncryptionBox;->initializationVectorSize:I

    .line 623
    .local v9, "vectorSize":I
    const/16 v10, 0x8

    invoke-virtual {p1, v10}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->setPosition(I)V

    .line 624
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readInt()I

    move-result v2

    .line 625
    .local v2, "fullAtom":I
    invoke-static {v2}, Lcom/google/android/exoplayer2/extractor/mp4/Atom;->parseFullAtomFlags(I)I

    move-result v1

    .line 626
    .local v1, "flags":I
    and-int/lit8 v10, v1, 0x1

    const/4 v11, 0x1

    if-ne v10, v11, :cond_0

    .line 627
    const/16 v10, 0x8

    invoke-virtual {p1, v10}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->skipBytes(I)V

    .line 629
    :cond_0
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readUnsignedByte()I

    move-result v0

    .line 631
    .local v0, "defaultSampleInfoSize":I
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v4

    .line 632
    .local v4, "sampleCount":I
    iget v10, p2, Lcom/google/android/exoplayer2/extractor/mp4/TrackFragment;->sampleCount:I

    if-eq v4, v10, :cond_1

    .line 633
    new-instance v10, Lcom/google/android/exoplayer2/ParserException;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v12, "Length mismatch: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string/jumbo v12, ", "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    iget v12, p2, Lcom/google/android/exoplayer2/extractor/mp4/TrackFragment;->sampleCount:I

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11}, Lcom/google/android/exoplayer2/ParserException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 636
    :cond_1
    const/4 v8, 0x0

    .line 637
    .local v8, "totalSize":I
    if-nez v0, :cond_3

    .line 638
    iget-object v5, p2, Lcom/google/android/exoplayer2/extractor/mp4/TrackFragment;->sampleHasSubsampleEncryptionTable:[Z

    .line 639
    .local v5, "sampleHasSubsampleEncryptionTable":[Z
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    if-ge v3, v4, :cond_4

    .line 640
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readUnsignedByte()I

    move-result v6

    .line 641
    .local v6, "sampleInfoSize":I
    add-int/2addr v8, v6

    .line 642
    if-le v6, v9, :cond_2

    const/4 v10, 0x1

    :goto_1
    aput-boolean v10, v5, v3

    .line 639
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 642
    :cond_2
    const/4 v10, 0x0

    goto :goto_1

    .line 645
    .end local v3    # "i":I
    .end local v5    # "sampleHasSubsampleEncryptionTable":[Z
    .end local v6    # "sampleInfoSize":I
    :cond_3
    if-le v0, v9, :cond_5

    const/4 v7, 0x1

    .line 646
    .local v7, "subsampleEncryption":Z
    :goto_2
    mul-int v10, v0, v4

    add-int/2addr v8, v10

    .line 647
    iget-object v10, p2, Lcom/google/android/exoplayer2/extractor/mp4/TrackFragment;->sampleHasSubsampleEncryptionTable:[Z

    const/4 v11, 0x0

    invoke-static {v10, v11, v4, v7}, Ljava/util/Arrays;->fill([ZIIZ)V

    .line 649
    .end local v7    # "subsampleEncryption":Z
    :cond_4
    invoke-virtual {p2, v8}, Lcom/google/android/exoplayer2/extractor/mp4/TrackFragment;->initEncryptionData(I)V

    .line 650
    return-void

    .line 645
    :cond_5
    const/4 v7, 0x0

    goto :goto_2
.end method

.method private static parseSenc(Lcom/google/android/exoplayer2/util/ParsableByteArray;ILcom/google/android/exoplayer2/extractor/mp4/TrackFragment;)V
    .locals 7
    .param p0, "senc"    # Lcom/google/android/exoplayer2/util/ParsableByteArray;
    .param p1, "offset"    # I
    .param p2, "out"    # Lcom/google/android/exoplayer2/extractor/mp4/TrackFragment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ParserException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 843
    add-int/lit8 v5, p1, 0x8

    invoke-virtual {p0, v5}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->setPosition(I)V

    .line 844
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readInt()I

    move-result v1

    .line 845
    .local v1, "fullAtom":I
    invoke-static {v1}, Lcom/google/android/exoplayer2/extractor/mp4/Atom;->parseFullAtomFlags(I)I

    move-result v0

    .line 847
    .local v0, "flags":I
    and-int/lit8 v5, v0, 0x1

    if-eqz v5, :cond_0

    .line 849
    new-instance v4, Lcom/google/android/exoplayer2/ParserException;

    const-string/jumbo v5, "Overriding TrackEncryptionBox parameters is unsupported."

    invoke-direct {v4, v5}, Lcom/google/android/exoplayer2/ParserException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 852
    :cond_0
    and-int/lit8 v5, v0, 0x2

    if-eqz v5, :cond_1

    const/4 v3, 0x1

    .line 853
    .local v3, "subsampleEncryption":Z
    :goto_0
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v2

    .line 854
    .local v2, "sampleCount":I
    iget v5, p2, Lcom/google/android/exoplayer2/extractor/mp4/TrackFragment;->sampleCount:I

    if-eq v2, v5, :cond_2

    .line 855
    new-instance v4, Lcom/google/android/exoplayer2/ParserException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "Length mismatch: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, ", "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v6, p2, Lcom/google/android/exoplayer2/extractor/mp4/TrackFragment;->sampleCount:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lcom/google/android/exoplayer2/ParserException;-><init>(Ljava/lang/String;)V

    throw v4

    .end local v2    # "sampleCount":I
    .end local v3    # "subsampleEncryption":Z
    :cond_1
    move v3, v4

    .line 852
    goto :goto_0

    .line 858
    .restart local v2    # "sampleCount":I
    .restart local v3    # "subsampleEncryption":Z
    :cond_2
    iget-object v5, p2, Lcom/google/android/exoplayer2/extractor/mp4/TrackFragment;->sampleHasSubsampleEncryptionTable:[Z

    invoke-static {v5, v4, v2, v3}, Ljava/util/Arrays;->fill([ZIIZ)V

    .line 859
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->bytesLeft()I

    move-result v4

    invoke-virtual {p2, v4}, Lcom/google/android/exoplayer2/extractor/mp4/TrackFragment;->initEncryptionData(I)V

    .line 860
    invoke-virtual {p2, p0}, Lcom/google/android/exoplayer2/extractor/mp4/TrackFragment;->fillEncryptionData(Lcom/google/android/exoplayer2/util/ParsableByteArray;)V

    .line 861
    return-void
.end method

.method private static parseSenc(Lcom/google/android/exoplayer2/util/ParsableByteArray;Lcom/google/android/exoplayer2/extractor/mp4/TrackFragment;)V
    .locals 1
    .param p0, "senc"    # Lcom/google/android/exoplayer2/util/ParsableByteArray;
    .param p1, "out"    # Lcom/google/android/exoplayer2/extractor/mp4/TrackFragment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ParserException;
        }
    .end annotation

    .prologue
    .line 838
    const/4 v0, 0x0

    invoke-static {p0, v0, p1}, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->parseSenc(Lcom/google/android/exoplayer2/util/ParsableByteArray;ILcom/google/android/exoplayer2/extractor/mp4/TrackFragment;)V

    .line 839
    return-void
.end method

.method private static parseSgpd(Lcom/google/android/exoplayer2/util/ParsableByteArray;Lcom/google/android/exoplayer2/util/ParsableByteArray;Lcom/google/android/exoplayer2/extractor/mp4/TrackFragment;)V
    .locals 13
    .param p0, "sbgp"    # Lcom/google/android/exoplayer2/util/ParsableByteArray;
    .param p1, "sgpd"    # Lcom/google/android/exoplayer2/util/ParsableByteArray;
    .param p2, "out"    # Lcom/google/android/exoplayer2/extractor/mp4/TrackFragment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ParserException;
        }
    .end annotation

    .prologue
    const/16 v11, 0x8

    const/4 v10, 0x4

    const/4 v12, 0x2

    const/4 v7, 0x0

    const/4 v6, 0x1

    .line 865
    invoke-virtual {p0, v11}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->setPosition(I)V

    .line 866
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readInt()I

    move-result v3

    .line 867
    .local v3, "sbgpFullAtom":I
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readInt()I

    move-result v8

    sget v9, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->SAMPLE_GROUP_TYPE_seig:I

    if-eq v8, v9, :cond_1

    .line 906
    :cond_0
    :goto_0
    return-void

    .line 871
    :cond_1
    invoke-static {v3}, Lcom/google/android/exoplayer2/extractor/mp4/Atom;->parseFullAtomVersion(I)I

    move-result v8

    if-ne v8, v6, :cond_2

    .line 872
    invoke-virtual {p0, v10}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->skipBytes(I)V

    .line 874
    :cond_2
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readInt()I

    move-result v8

    if-eq v8, v6, :cond_3

    .line 875
    new-instance v6, Lcom/google/android/exoplayer2/ParserException;

    const-string/jumbo v7, "Entry count in sbgp != 1 (unsupported)."

    invoke-direct {v6, v7}, Lcom/google/android/exoplayer2/ParserException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 878
    :cond_3
    invoke-virtual {p1, v11}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->setPosition(I)V

    .line 879
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readInt()I

    move-result v4

    .line 880
    .local v4, "sgpdFullAtom":I
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readInt()I

    move-result v8

    sget v9, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->SAMPLE_GROUP_TYPE_seig:I

    if-ne v8, v9, :cond_0

    .line 884
    invoke-static {v4}, Lcom/google/android/exoplayer2/extractor/mp4/Atom;->parseFullAtomVersion(I)I

    move-result v5

    .line 885
    .local v5, "sgpdVersion":I
    if-ne v5, v6, :cond_4

    .line 886
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readUnsignedInt()J

    move-result-wide v8

    const-wide/16 v10, 0x0

    cmp-long v8, v8, v10

    if-nez v8, :cond_5

    .line 887
    new-instance v6, Lcom/google/android/exoplayer2/ParserException;

    const-string/jumbo v7, "Variable length decription in sgpd found (unsupported)"

    invoke-direct {v6, v7}, Lcom/google/android/exoplayer2/ParserException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 889
    :cond_4
    if-lt v5, v12, :cond_5

    .line 890
    invoke-virtual {p1, v10}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->skipBytes(I)V

    .line 892
    :cond_5
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readUnsignedInt()J

    move-result-wide v8

    const-wide/16 v10, 0x1

    cmp-long v8, v8, v10

    if-eqz v8, :cond_6

    .line 893
    new-instance v6, Lcom/google/android/exoplayer2/ParserException;

    const-string/jumbo v7, "Entry count in sgpd != 1 (unsupported)."

    invoke-direct {v6, v7}, Lcom/google/android/exoplayer2/ParserException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 896
    :cond_6
    invoke-virtual {p1, v12}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->skipBytes(I)V

    .line 897
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readUnsignedByte()I

    move-result v8

    if-ne v8, v6, :cond_7

    move v1, v6

    .line 898
    .local v1, "isProtected":Z
    :goto_1
    if-eqz v1, :cond_0

    .line 901
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readUnsignedByte()I

    move-result v0

    .line 902
    .local v0, "initVectorSize":I
    const/16 v8, 0x10

    new-array v2, v8, [B

    .line 903
    .local v2, "keyId":[B
    array-length v8, v2

    invoke-virtual {p1, v2, v7, v8}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readBytes([BII)V

    .line 904
    iput-boolean v6, p2, Lcom/google/android/exoplayer2/extractor/mp4/TrackFragment;->definesEncryptionData:Z

    .line 905
    new-instance v6, Lcom/google/android/exoplayer2/extractor/mp4/TrackEncryptionBox;

    invoke-direct {v6, v1, v0, v2}, Lcom/google/android/exoplayer2/extractor/mp4/TrackEncryptionBox;-><init>(ZI[B)V

    iput-object v6, p2, Lcom/google/android/exoplayer2/extractor/mp4/TrackFragment;->trackEncryptionBox:Lcom/google/android/exoplayer2/extractor/mp4/TrackEncryptionBox;

    goto :goto_0

    .end local v0    # "initVectorSize":I
    .end local v1    # "isProtected":Z
    .end local v2    # "keyId":[B
    :cond_7
    move v1, v7

    .line 897
    goto :goto_1
.end method

.method private static parseSidx(Lcom/google/android/exoplayer2/util/ParsableByteArray;J)Landroid/util/Pair;
    .locals 35
    .param p0, "atom"    # Lcom/google/android/exoplayer2/util/ParsableByteArray;
    .param p1, "inputPosition"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/exoplayer2/util/ParsableByteArray;",
            "J)",
            "Landroid/util/Pair",
            "<",
            "Ljava/lang/Long;",
            "Lcom/google/android/exoplayer2/extractor/ChunkIndex;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ParserException;
        }
    .end annotation

    .prologue
    .line 918
    const/16 v6, 0x8

    move-object/from16 v0, p0

    invoke-virtual {v0, v6}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->setPosition(I)V

    .line 919
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readInt()I

    move-result v20

    .line 920
    .local v20, "fullAtom":I
    invoke-static/range {v20 .. v20}, Lcom/google/android/exoplayer2/extractor/mp4/Atom;->parseFullAtomVersion(I)I

    move-result v33

    .line 922
    .local v33, "version":I
    const/4 v6, 0x4

    move-object/from16 v0, p0

    invoke-virtual {v0, v6}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->skipBytes(I)V

    .line 923
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readUnsignedInt()J

    move-result-wide v8

    .line 925
    .local v8, "timescale":J
    move-wide/from16 v22, p1

    .line 926
    .local v22, "offset":J
    if-nez v33, :cond_0

    .line 927
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readUnsignedInt()J

    move-result-wide v4

    .line 928
    .local v4, "earliestPresentationTime":J
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readUnsignedInt()J

    move-result-wide v6

    add-long v22, v22, v6

    .line 933
    :goto_0
    const-wide/32 v6, 0xf4240

    invoke-static/range {v4 .. v9}, Lcom/google/android/exoplayer2/util/Util;->scaleLargeTimestamp(JJJ)J

    move-result-wide v18

    .line 936
    .local v18, "earliestPresentationTimeUs":J
    const/4 v6, 0x2

    move-object/from16 v0, p0

    invoke-virtual {v0, v6}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->skipBytes(I)V

    .line 938
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readUnsignedShort()I

    move-result v25

    .line 939
    .local v25, "referenceCount":I
    move/from16 v0, v25

    new-array v0, v0, [I

    move-object/from16 v28, v0

    .line 940
    .local v28, "sizes":[I
    move/from16 v0, v25

    new-array v0, v0, [J

    move-object/from16 v24, v0

    .line 941
    .local v24, "offsets":[J
    move/from16 v0, v25

    new-array v0, v0, [J

    move-object/from16 v16, v0

    .line 942
    .local v16, "durationsUs":[J
    move/from16 v0, v25

    new-array v0, v0, [J

    move-object/from16 v29, v0

    .line 944
    .local v29, "timesUs":[J
    move-wide v10, v4

    .line 945
    .local v10, "time":J
    move-wide/from16 v30, v18

    .line 946
    .local v30, "timeUs":J
    const/16 v21, 0x0

    .local v21, "i":I
    :goto_1
    move/from16 v0, v21

    move/from16 v1, v25

    if-ge v0, v1, :cond_2

    .line 947
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readInt()I

    move-result v17

    .line 949
    .local v17, "firstInt":I
    const/high16 v6, -0x80000000

    and-int v32, v6, v17

    .line 950
    .local v32, "type":I
    if-eqz v32, :cond_1

    .line 951
    new-instance v6, Lcom/google/android/exoplayer2/ParserException;

    const-string/jumbo v7, "Unhandled indirect reference"

    invoke-direct {v6, v7}, Lcom/google/android/exoplayer2/ParserException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 930
    .end local v4    # "earliestPresentationTime":J
    .end local v10    # "time":J
    .end local v16    # "durationsUs":[J
    .end local v17    # "firstInt":I
    .end local v18    # "earliestPresentationTimeUs":J
    .end local v21    # "i":I
    .end local v24    # "offsets":[J
    .end local v25    # "referenceCount":I
    .end local v28    # "sizes":[I
    .end local v29    # "timesUs":[J
    .end local v30    # "timeUs":J
    .end local v32    # "type":I
    :cond_0
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readUnsignedLongToLong()J

    move-result-wide v4

    .line 931
    .restart local v4    # "earliestPresentationTime":J
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readUnsignedLongToLong()J

    move-result-wide v6

    add-long v22, v22, v6

    goto :goto_0

    .line 953
    .restart local v10    # "time":J
    .restart local v16    # "durationsUs":[J
    .restart local v17    # "firstInt":I
    .restart local v18    # "earliestPresentationTimeUs":J
    .restart local v21    # "i":I
    .restart local v24    # "offsets":[J
    .restart local v25    # "referenceCount":I
    .restart local v28    # "sizes":[I
    .restart local v29    # "timesUs":[J
    .restart local v30    # "timeUs":J
    .restart local v32    # "type":I
    :cond_1
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readUnsignedInt()J

    move-result-wide v26

    .line 955
    .local v26, "referenceDuration":J
    const v6, 0x7fffffff

    and-int v6, v6, v17

    aput v6, v28, v21

    .line 956
    aput-wide v22, v24, v21

    .line 960
    aput-wide v30, v29, v21

    .line 961
    add-long v10, v10, v26

    .line 962
    const-wide/32 v12, 0xf4240

    move-wide v14, v8

    invoke-static/range {v10 .. v15}, Lcom/google/android/exoplayer2/util/Util;->scaleLargeTimestamp(JJJ)J

    move-result-wide v30

    .line 963
    aget-wide v6, v29, v21

    sub-long v6, v30, v6

    aput-wide v6, v16, v21

    .line 965
    const/4 v6, 0x4

    move-object/from16 v0, p0

    invoke-virtual {v0, v6}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->skipBytes(I)V

    .line 966
    aget v6, v28, v21

    int-to-long v6, v6

    add-long v22, v22, v6

    .line 946
    add-int/lit8 v21, v21, 0x1

    goto :goto_1

    .line 969
    .end local v17    # "firstInt":I
    .end local v26    # "referenceDuration":J
    .end local v32    # "type":I
    :cond_2
    invoke-static/range {v18 .. v19}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    new-instance v7, Lcom/google/android/exoplayer2/extractor/ChunkIndex;

    move-object/from16 v0, v28

    move-object/from16 v1, v24

    move-object/from16 v2, v16

    move-object/from16 v3, v29

    invoke-direct {v7, v0, v1, v2, v3}, Lcom/google/android/exoplayer2/extractor/ChunkIndex;-><init>([I[J[J[J)V

    invoke-static {v6, v7}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    move-result-object v6

    return-object v6
.end method

.method private static parseTfdt(Lcom/google/android/exoplayer2/util/ParsableByteArray;)J
    .locals 4
    .param p0, "tfdt"    # Lcom/google/android/exoplayer2/util/ParsableByteArray;

    .prologue
    .line 725
    const/16 v2, 0x8

    invoke-virtual {p0, v2}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->setPosition(I)V

    .line 726
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readInt()I

    move-result v0

    .line 727
    .local v0, "fullAtom":I
    invoke-static {v0}, Lcom/google/android/exoplayer2/extractor/mp4/Atom;->parseFullAtomVersion(I)I

    move-result v1

    .line 728
    .local v1, "version":I
    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    invoke-virtual {p0}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readUnsignedLongToLong()J

    move-result-wide v2

    :goto_0
    return-wide v2

    :cond_0
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readUnsignedInt()J

    move-result-wide v2

    goto :goto_0
.end method

.method private static parseTfhd(Lcom/google/android/exoplayer2/util/ParsableByteArray;Landroid/util/SparseArray;I)Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;
    .locals 13
    .param p0, "tfhd"    # Lcom/google/android/exoplayer2/util/ParsableByteArray;
    .param p2, "flags"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/exoplayer2/util/ParsableByteArray;",
            "Landroid/util/SparseArray",
            "<",
            "Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;",
            ">;I)",
            "Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;"
        }
    .end annotation

    .prologue
    .line 689
    .local p1, "trackBundles":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;>;"
    const/16 v11, 0x8

    invoke-virtual {p0, v11}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->setPosition(I)V

    .line 690
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readInt()I

    move-result v8

    .line 691
    .local v8, "fullAtom":I
    invoke-static {v8}, Lcom/google/android/exoplayer2/extractor/mp4/Atom;->parseFullAtomFlags(I)I

    move-result v0

    .line 692
    .local v0, "atomFlags":I
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readInt()I

    move-result v10

    .line 693
    .local v10, "trackId":I
    and-int/lit8 v11, p2, 0x10

    if-nez v11, :cond_0

    .end local v10    # "trackId":I
    :goto_0
    invoke-virtual {p1, v10}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;

    .line 694
    .local v9, "trackBundle":Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;
    if-nez v9, :cond_1

    .line 695
    const/4 v9, 0x0

    .line 715
    .end local v9    # "trackBundle":Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;
    :goto_1
    return-object v9

    .line 693
    .restart local v10    # "trackId":I
    :cond_0
    const/4 v10, 0x0

    goto :goto_0

    .line 697
    .end local v10    # "trackId":I
    .restart local v9    # "trackBundle":Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;
    :cond_1
    and-int/lit8 v11, v0, 0x1

    if-eqz v11, :cond_2

    .line 698
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readUnsignedLongToLong()J

    move-result-wide v2

    .line 699
    .local v2, "baseDataPosition":J
    iget-object v11, v9, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;->fragment:Lcom/google/android/exoplayer2/extractor/mp4/TrackFragment;

    iput-wide v2, v11, Lcom/google/android/exoplayer2/extractor/mp4/TrackFragment;->dataPosition:J

    .line 700
    iget-object v11, v9, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;->fragment:Lcom/google/android/exoplayer2/extractor/mp4/TrackFragment;

    iput-wide v2, v11, Lcom/google/android/exoplayer2/extractor/mp4/TrackFragment;->auxiliaryDataPosition:J

    .line 703
    .end local v2    # "baseDataPosition":J
    :cond_2
    iget-object v7, v9, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;->defaultSampleValues:Lcom/google/android/exoplayer2/extractor/mp4/DefaultSampleValues;

    .line 704
    .local v7, "defaultSampleValues":Lcom/google/android/exoplayer2/extractor/mp4/DefaultSampleValues;
    and-int/lit8 v11, v0, 0x2

    if-eqz v11, :cond_3

    .line 706
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v11

    add-int/lit8 v1, v11, -0x1

    .line 707
    .local v1, "defaultSampleDescriptionIndex":I
    :goto_2
    and-int/lit8 v11, v0, 0x8

    if-eqz v11, :cond_4

    .line 708
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v4

    .line 709
    .local v4, "defaultSampleDuration":I
    :goto_3
    and-int/lit8 v11, v0, 0x10

    if-eqz v11, :cond_5

    .line 710
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v6

    .line 711
    .local v6, "defaultSampleSize":I
    :goto_4
    and-int/lit8 v11, v0, 0x20

    if-eqz v11, :cond_6

    .line 712
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v5

    .line 713
    .local v5, "defaultSampleFlags":I
    :goto_5
    iget-object v11, v9, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;->fragment:Lcom/google/android/exoplayer2/extractor/mp4/TrackFragment;

    new-instance v12, Lcom/google/android/exoplayer2/extractor/mp4/DefaultSampleValues;

    invoke-direct {v12, v1, v4, v6, v5}, Lcom/google/android/exoplayer2/extractor/mp4/DefaultSampleValues;-><init>(IIII)V

    iput-object v12, v11, Lcom/google/android/exoplayer2/extractor/mp4/TrackFragment;->header:Lcom/google/android/exoplayer2/extractor/mp4/DefaultSampleValues;

    goto :goto_1

    .line 706
    .end local v1    # "defaultSampleDescriptionIndex":I
    .end local v4    # "defaultSampleDuration":I
    .end local v5    # "defaultSampleFlags":I
    .end local v6    # "defaultSampleSize":I
    :cond_3
    iget v1, v7, Lcom/google/android/exoplayer2/extractor/mp4/DefaultSampleValues;->sampleDescriptionIndex:I

    goto :goto_2

    .line 708
    .restart local v1    # "defaultSampleDescriptionIndex":I
    :cond_4
    iget v4, v7, Lcom/google/android/exoplayer2/extractor/mp4/DefaultSampleValues;->duration:I

    goto :goto_3

    .line 710
    .restart local v4    # "defaultSampleDuration":I
    :cond_5
    iget v6, v7, Lcom/google/android/exoplayer2/extractor/mp4/DefaultSampleValues;->size:I

    goto :goto_4

    .line 712
    .restart local v6    # "defaultSampleSize":I
    :cond_6
    iget v5, v7, Lcom/google/android/exoplayer2/extractor/mp4/DefaultSampleValues;->flags:I

    goto :goto_5
.end method

.method private static parseTraf(Lcom/google/android/exoplayer2/extractor/mp4/Atom$ContainerAtom;Landroid/util/SparseArray;I[B)V
    .locals 21
    .param p0, "traf"    # Lcom/google/android/exoplayer2/extractor/mp4/Atom$ContainerAtom;
    .param p2, "flags"    # I
    .param p3, "extendedTypeScratch"    # [B
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/exoplayer2/extractor/mp4/Atom$ContainerAtom;",
            "Landroid/util/SparseArray",
            "<",
            "Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;",
            ">;I[B)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ParserException;
        }
    .end annotation

    .prologue
    .line 537
    .local p1, "trackBundleArray":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;>;"
    sget v19, Lcom/google/android/exoplayer2/extractor/mp4/Atom;->TYPE_tfhd:I

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/extractor/mp4/Atom$ContainerAtom;->getLeafAtomOfType(I)Lcom/google/android/exoplayer2/extractor/mp4/Atom$LeafAtom;

    move-result-object v16

    .line 538
    .local v16, "tfhd":Lcom/google/android/exoplayer2/extractor/mp4/Atom$LeafAtom;
    move-object/from16 v0, v16

    iget-object v0, v0, Lcom/google/android/exoplayer2/extractor/mp4/Atom$LeafAtom;->data:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    move-object/from16 v1, p1

    move/from16 v2, p2

    invoke-static {v0, v1, v2}, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->parseTfhd(Lcom/google/android/exoplayer2/util/ParsableByteArray;Landroid/util/SparseArray;I)Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;

    move-result-object v17

    .line 539
    .local v17, "trackBundle":Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;
    if-nez v17, :cond_1

    .line 584
    :cond_0
    return-void

    .line 543
    :cond_1
    move-object/from16 v0, v17

    iget-object v5, v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;->fragment:Lcom/google/android/exoplayer2/extractor/mp4/TrackFragment;

    .line 544
    .local v5, "fragment":Lcom/google/android/exoplayer2/extractor/mp4/TrackFragment;
    iget-wide v6, v5, Lcom/google/android/exoplayer2/extractor/mp4/TrackFragment;->nextFragmentDecodeTime:J

    .line 545
    .local v6, "decodeTime":J
    invoke-virtual/range {v17 .. v17}, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;->reset()V

    .line 547
    sget v19, Lcom/google/android/exoplayer2/extractor/mp4/Atom;->TYPE_tfdt:I

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/extractor/mp4/Atom$ContainerAtom;->getLeafAtomOfType(I)Lcom/google/android/exoplayer2/extractor/mp4/Atom$LeafAtom;

    move-result-object v15

    .line 548
    .local v15, "tfdtAtom":Lcom/google/android/exoplayer2/extractor/mp4/Atom$LeafAtom;
    if-eqz v15, :cond_2

    and-int/lit8 v19, p2, 0x2

    if-nez v19, :cond_2

    .line 549
    sget v19, Lcom/google/android/exoplayer2/extractor/mp4/Atom;->TYPE_tfdt:I

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/extractor/mp4/Atom$ContainerAtom;->getLeafAtomOfType(I)Lcom/google/android/exoplayer2/extractor/mp4/Atom$LeafAtom;

    move-result-object v19

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/google/android/exoplayer2/extractor/mp4/Atom$LeafAtom;->data:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    move-object/from16 v19, v0

    invoke-static/range {v19 .. v19}, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->parseTfdt(Lcom/google/android/exoplayer2/util/ParsableByteArray;)J

    move-result-wide v6

    .line 552
    :cond_2
    move-object/from16 v0, p0

    move-object/from16 v1, v17

    move/from16 v2, p2

    invoke-static {v0, v1, v6, v7, v2}, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->parseTruns(Lcom/google/android/exoplayer2/extractor/mp4/Atom$ContainerAtom;Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;JI)V

    .line 554
    sget v19, Lcom/google/android/exoplayer2/extractor/mp4/Atom;->TYPE_saiz:I

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/extractor/mp4/Atom$ContainerAtom;->getLeafAtomOfType(I)Lcom/google/android/exoplayer2/extractor/mp4/Atom$LeafAtom;

    move-result-object v11

    .line 555
    .local v11, "saiz":Lcom/google/android/exoplayer2/extractor/mp4/Atom$LeafAtom;
    if-eqz v11, :cond_3

    .line 556
    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;->track:Lcom/google/android/exoplayer2/extractor/mp4/Track;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/google/android/exoplayer2/extractor/mp4/Track;->sampleDescriptionEncryptionBoxes:[Lcom/google/android/exoplayer2/extractor/mp4/TrackEncryptionBox;

    move-object/from16 v19, v0

    iget-object v0, v5, Lcom/google/android/exoplayer2/extractor/mp4/TrackFragment;->header:Lcom/google/android/exoplayer2/extractor/mp4/DefaultSampleValues;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    iget v0, v0, Lcom/google/android/exoplayer2/extractor/mp4/DefaultSampleValues;->sampleDescriptionIndex:I

    move/from16 v20, v0

    aget-object v18, v19, v20

    .line 558
    .local v18, "trackEncryptionBox":Lcom/google/android/exoplayer2/extractor/mp4/TrackEncryptionBox;
    iget-object v0, v11, Lcom/google/android/exoplayer2/extractor/mp4/Atom$LeafAtom;->data:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    move-object/from16 v19, v0

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-static {v0, v1, v5}, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->parseSaiz(Lcom/google/android/exoplayer2/extractor/mp4/TrackEncryptionBox;Lcom/google/android/exoplayer2/util/ParsableByteArray;Lcom/google/android/exoplayer2/extractor/mp4/TrackFragment;)V

    .line 561
    .end local v18    # "trackEncryptionBox":Lcom/google/android/exoplayer2/extractor/mp4/TrackEncryptionBox;
    :cond_3
    sget v19, Lcom/google/android/exoplayer2/extractor/mp4/Atom;->TYPE_saio:I

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/extractor/mp4/Atom$ContainerAtom;->getLeafAtomOfType(I)Lcom/google/android/exoplayer2/extractor/mp4/Atom$LeafAtom;

    move-result-object v10

    .line 562
    .local v10, "saio":Lcom/google/android/exoplayer2/extractor/mp4/Atom$LeafAtom;
    if-eqz v10, :cond_4

    .line 563
    iget-object v0, v10, Lcom/google/android/exoplayer2/extractor/mp4/Atom$LeafAtom;->data:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-static {v0, v5}, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->parseSaio(Lcom/google/android/exoplayer2/util/ParsableByteArray;Lcom/google/android/exoplayer2/extractor/mp4/TrackFragment;)V

    .line 566
    :cond_4
    sget v19, Lcom/google/android/exoplayer2/extractor/mp4/Atom;->TYPE_senc:I

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/extractor/mp4/Atom$ContainerAtom;->getLeafAtomOfType(I)Lcom/google/android/exoplayer2/extractor/mp4/Atom$LeafAtom;

    move-result-object v13

    .line 567
    .local v13, "senc":Lcom/google/android/exoplayer2/extractor/mp4/Atom$LeafAtom;
    if-eqz v13, :cond_5

    .line 568
    iget-object v0, v13, Lcom/google/android/exoplayer2/extractor/mp4/Atom$LeafAtom;->data:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-static {v0, v5}, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->parseSenc(Lcom/google/android/exoplayer2/util/ParsableByteArray;Lcom/google/android/exoplayer2/extractor/mp4/TrackFragment;)V

    .line 571
    :cond_5
    sget v19, Lcom/google/android/exoplayer2/extractor/mp4/Atom;->TYPE_sbgp:I

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/extractor/mp4/Atom$ContainerAtom;->getLeafAtomOfType(I)Lcom/google/android/exoplayer2/extractor/mp4/Atom$LeafAtom;

    move-result-object v12

    .line 572
    .local v12, "sbgp":Lcom/google/android/exoplayer2/extractor/mp4/Atom$LeafAtom;
    sget v19, Lcom/google/android/exoplayer2/extractor/mp4/Atom;->TYPE_sgpd:I

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/extractor/mp4/Atom$ContainerAtom;->getLeafAtomOfType(I)Lcom/google/android/exoplayer2/extractor/mp4/Atom$LeafAtom;

    move-result-object v14

    .line 573
    .local v14, "sgpd":Lcom/google/android/exoplayer2/extractor/mp4/Atom$LeafAtom;
    if-eqz v12, :cond_6

    if-eqz v14, :cond_6

    .line 574
    iget-object v0, v12, Lcom/google/android/exoplayer2/extractor/mp4/Atom$LeafAtom;->data:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    move-object/from16 v19, v0

    iget-object v0, v14, Lcom/google/android/exoplayer2/extractor/mp4/Atom$LeafAtom;->data:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    move-object/from16 v20, v0

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-static {v0, v1, v5}, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->parseSgpd(Lcom/google/android/exoplayer2/util/ParsableByteArray;Lcom/google/android/exoplayer2/util/ParsableByteArray;Lcom/google/android/exoplayer2/extractor/mp4/TrackFragment;)V

    .line 577
    :cond_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer2/extractor/mp4/Atom$ContainerAtom;->leafChildren:Ljava/util/List;

    move-object/from16 v19, v0

    invoke-interface/range {v19 .. v19}, Ljava/util/List;->size()I

    move-result v9

    .line 578
    .local v9, "leafChildrenSize":I
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_0
    if-ge v8, v9, :cond_0

    .line 579
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer2/extractor/mp4/Atom$ContainerAtom;->leafChildren:Ljava/util/List;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-interface {v0, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/google/android/exoplayer2/extractor/mp4/Atom$LeafAtom;

    .line 580
    .local v4, "atom":Lcom/google/android/exoplayer2/extractor/mp4/Atom$LeafAtom;
    iget v0, v4, Lcom/google/android/exoplayer2/extractor/mp4/Atom$LeafAtom;->type:I

    move/from16 v19, v0

    sget v20, Lcom/google/android/exoplayer2/extractor/mp4/Atom;->TYPE_uuid:I

    move/from16 v0, v19

    move/from16 v1, v20

    if-ne v0, v1, :cond_7

    .line 581
    iget-object v0, v4, Lcom/google/android/exoplayer2/extractor/mp4/Atom$LeafAtom;->data:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    move-object/from16 v1, p3

    invoke-static {v0, v5, v1}, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->parseUuid(Lcom/google/android/exoplayer2/util/ParsableByteArray;Lcom/google/android/exoplayer2/extractor/mp4/TrackFragment;[B)V

    .line 578
    :cond_7
    add-int/lit8 v8, v8, 0x1

    goto :goto_0
.end method

.method private static parseTrex(Lcom/google/android/exoplayer2/util/ParsableByteArray;)Landroid/util/Pair;
    .locals 7
    .param p0, "trex"    # Lcom/google/android/exoplayer2/util/ParsableByteArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/exoplayer2/util/ParsableByteArray;",
            ")",
            "Landroid/util/Pair",
            "<",
            "Ljava/lang/Integer;",
            "Lcom/google/android/exoplayer2/extractor/mp4/DefaultSampleValues;",
            ">;"
        }
    .end annotation

    .prologue
    .line 499
    const/16 v5, 0xc

    invoke-virtual {p0, v5}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->setPosition(I)V

    .line 500
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readInt()I

    move-result v4

    .line 501
    .local v4, "trackId":I
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v5

    add-int/lit8 v0, v5, -0x1

    .line 502
    .local v0, "defaultSampleDescriptionIndex":I
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v1

    .line 503
    .local v1, "defaultSampleDuration":I
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v3

    .line 504
    .local v3, "defaultSampleSize":I
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readInt()I

    move-result v2

    .line 506
    .local v2, "defaultSampleFlags":I
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    new-instance v6, Lcom/google/android/exoplayer2/extractor/mp4/DefaultSampleValues;

    invoke-direct {v6, v0, v1, v3, v2}, Lcom/google/android/exoplayer2/extractor/mp4/DefaultSampleValues;-><init>(IIII)V

    invoke-static {v5, v6}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    move-result-object v5

    return-object v5
.end method

.method private static parseTrun(Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;IJILcom/google/android/exoplayer2/util/ParsableByteArray;I)I
    .locals 36
    .param p0, "trackBundle"    # Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;
    .param p1, "index"    # I
    .param p2, "decodeTime"    # J
    .param p4, "flags"    # I
    .param p5, "trun"    # Lcom/google/android/exoplayer2/util/ParsableByteArray;
    .param p6, "trackRunStart"    # I

    .prologue
    .line 744
    const/16 v4, 0x8

    move-object/from16 v0, p5

    invoke-virtual {v0, v4}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->setPosition(I)V

    .line 745
    invoke-virtual/range {p5 .. p5}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readInt()I

    move-result v15

    .line 746
    .local v15, "fullAtom":I
    invoke-static {v15}, Lcom/google/android/exoplayer2/extractor/mp4/Atom;->parseFullAtomFlags(I)I

    move-result v8

    .line 748
    .local v8, "atomFlags":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;->track:Lcom/google/android/exoplayer2/extractor/mp4/Track;

    move-object/from16 v29, v0

    .line 749
    .local v29, "track":Lcom/google/android/exoplayer2/extractor/mp4/Track;
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;->fragment:Lcom/google/android/exoplayer2/extractor/mp4/TrackFragment;

    .line 750
    .local v14, "fragment":Lcom/google/android/exoplayer2/extractor/mp4/TrackFragment;
    iget-object v9, v14, Lcom/google/android/exoplayer2/extractor/mp4/TrackFragment;->header:Lcom/google/android/exoplayer2/extractor/mp4/DefaultSampleValues;

    .line 752
    .local v9, "defaultSampleValues":Lcom/google/android/exoplayer2/extractor/mp4/DefaultSampleValues;
    iget-object v4, v14, Lcom/google/android/exoplayer2/extractor/mp4/TrackFragment;->trunLength:[I

    invoke-virtual/range {p5 .. p5}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v5

    aput v5, v4, p1

    .line 753
    iget-object v4, v14, Lcom/google/android/exoplayer2/extractor/mp4/TrackFragment;->trunDataPosition:[J

    iget-wide v0, v14, Lcom/google/android/exoplayer2/extractor/mp4/TrackFragment;->dataPosition:J

    move-wide/from16 v32, v0

    aput-wide v32, v4, p1

    .line 754
    and-int/lit8 v4, v8, 0x1

    if-eqz v4, :cond_0

    .line 755
    iget-object v4, v14, Lcom/google/android/exoplayer2/extractor/mp4/TrackFragment;->trunDataPosition:[J

    aget-wide v32, v4, p1

    invoke-virtual/range {p5 .. p5}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readInt()I

    move-result v5

    int-to-long v0, v5

    move-wide/from16 v34, v0

    add-long v32, v32, v34

    aput-wide v32, v4, p1

    .line 758
    :cond_0
    and-int/lit8 v4, v8, 0x4

    if-eqz v4, :cond_4

    const/4 v13, 0x1

    .line 759
    .local v13, "firstSampleFlagsPresent":Z
    :goto_0
    iget v12, v9, Lcom/google/android/exoplayer2/extractor/mp4/DefaultSampleValues;->flags:I

    .line 760
    .local v12, "firstSampleFlags":I
    if-eqz v13, :cond_1

    .line 761
    invoke-virtual/range {p5 .. p5}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v12

    .line 764
    :cond_1
    and-int/lit16 v4, v8, 0x100

    if-eqz v4, :cond_5

    const/16 v21, 0x1

    .line 765
    .local v21, "sampleDurationsPresent":Z
    :goto_1
    and-int/lit16 v4, v8, 0x200

    if-eqz v4, :cond_6

    const/16 v28, 0x1

    .line 766
    .local v28, "sampleSizesPresent":Z
    :goto_2
    and-int/lit16 v4, v8, 0x400

    if-eqz v4, :cond_7

    const/16 v23, 0x1

    .line 767
    .local v23, "sampleFlagsPresent":Z
    :goto_3
    and-int/lit16 v4, v8, 0x800

    if-eqz v4, :cond_8

    const/16 v18, 0x1

    .line 772
    .local v18, "sampleCompositionTimeOffsetsPresent":Z
    :goto_4
    const-wide/16 v10, 0x0

    .line 776
    .local v10, "edtsOffset":J
    move-object/from16 v0, v29

    iget-object v4, v0, Lcom/google/android/exoplayer2/extractor/mp4/Track;->editListDurations:[J

    if-eqz v4, :cond_2

    move-object/from16 v0, v29

    iget-object v4, v0, Lcom/google/android/exoplayer2/extractor/mp4/Track;->editListDurations:[J

    array-length v4, v4

    const/4 v5, 0x1

    if-ne v4, v5, :cond_2

    move-object/from16 v0, v29

    iget-object v4, v0, Lcom/google/android/exoplayer2/extractor/mp4/Track;->editListDurations:[J

    const/4 v5, 0x0

    aget-wide v4, v4, v5

    const-wide/16 v32, 0x0

    cmp-long v4, v4, v32

    if-nez v4, :cond_2

    .line 778
    move-object/from16 v0, v29

    iget-object v4, v0, Lcom/google/android/exoplayer2/extractor/mp4/Track;->editListMediaTimes:[J

    const/4 v5, 0x0

    aget-wide v2, v4, v5

    const-wide/16 v4, 0x3e8

    move-object/from16 v0, v29

    iget-wide v6, v0, Lcom/google/android/exoplayer2/extractor/mp4/Track;->timescale:J

    invoke-static/range {v2 .. v7}, Lcom/google/android/exoplayer2/util/Util;->scaleLargeTimestamp(JJJ)J

    move-result-wide v10

    .line 781
    :cond_2
    iget-object v0, v14, Lcom/google/android/exoplayer2/extractor/mp4/TrackFragment;->sampleSizeTable:[I

    move-object/from16 v27, v0

    .line 782
    .local v27, "sampleSizeTable":[I
    iget-object v0, v14, Lcom/google/android/exoplayer2/extractor/mp4/TrackFragment;->sampleCompositionTimeOffsetTable:[I

    move-object/from16 v17, v0

    .line 783
    .local v17, "sampleCompositionTimeOffsetTable":[I
    iget-object v0, v14, Lcom/google/android/exoplayer2/extractor/mp4/TrackFragment;->sampleDecodingTimeTable:[J

    move-object/from16 v19, v0

    .line 784
    .local v19, "sampleDecodingTimeTable":[J
    iget-object v0, v14, Lcom/google/android/exoplayer2/extractor/mp4/TrackFragment;->sampleIsSyncFrameTable:[Z

    move-object/from16 v24, v0

    .line 786
    .local v24, "sampleIsSyncFrameTable":[Z
    move-object/from16 v0, v29

    iget v4, v0, Lcom/google/android/exoplayer2/extractor/mp4/Track;->type:I

    const/4 v5, 0x2

    if-ne v4, v5, :cond_9

    and-int/lit8 v4, p4, 0x1

    if-eqz v4, :cond_9

    const/16 v31, 0x1

    .line 789
    .local v31, "workaroundEveryVideoFrameIsSyncFrame":Z
    :goto_5
    iget-object v4, v14, Lcom/google/android/exoplayer2/extractor/mp4/TrackFragment;->trunLength:[I

    aget v4, v4, p1

    add-int v30, p6, v4

    .line 790
    .local v30, "trackRunEnd":I
    move-object/from16 v0, v29

    iget-wide v6, v0, Lcom/google/android/exoplayer2/extractor/mp4/Track;->timescale:J

    .line 791
    .local v6, "timescale":J
    if-lez p1, :cond_a

    iget-wide v2, v14, Lcom/google/android/exoplayer2/extractor/mp4/TrackFragment;->nextFragmentDecodeTime:J

    .line 792
    .local v2, "cumulativeTime":J
    :goto_6
    move/from16 v16, p6

    .local v16, "i":I
    :goto_7
    move/from16 v0, v16

    move/from16 v1, v30

    if-ge v0, v1, :cond_11

    .line 794
    if-eqz v21, :cond_b

    invoke-virtual/range {p5 .. p5}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v20

    .line 796
    .local v20, "sampleDuration":I
    :goto_8
    if-eqz v28, :cond_c

    invoke-virtual/range {p5 .. p5}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v26

    .line 797
    .local v26, "sampleSize":I
    :goto_9
    if-nez v16, :cond_d

    if-eqz v13, :cond_d

    move/from16 v22, v12

    .line 799
    .local v22, "sampleFlags":I
    :goto_a
    if-eqz v18, :cond_f

    .line 805
    invoke-virtual/range {p5 .. p5}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readInt()I

    move-result v25

    .line 806
    .local v25, "sampleOffset":I
    move/from16 v0, v25

    mul-int/lit16 v4, v0, 0x3e8

    int-to-long v4, v4

    div-long/2addr v4, v6

    long-to-int v4, v4

    aput v4, v17, v16

    .line 810
    .end local v25    # "sampleOffset":I
    :goto_b
    const-wide/16 v4, 0x3e8

    .line 811
    invoke-static/range {v2 .. v7}, Lcom/google/android/exoplayer2/util/Util;->scaleLargeTimestamp(JJJ)J

    move-result-wide v4

    sub-long/2addr v4, v10

    aput-wide v4, v19, v16

    .line 812
    aput v26, v27, v16

    .line 813
    shr-int/lit8 v4, v22, 0x10

    and-int/lit8 v4, v4, 0x1

    if-nez v4, :cond_10

    if-eqz v31, :cond_3

    if-nez v16, :cond_10

    :cond_3
    const/4 v4, 0x1

    :goto_c
    aput-boolean v4, v24, v16

    .line 815
    move/from16 v0, v20

    int-to-long v4, v0

    add-long/2addr v2, v4

    .line 792
    add-int/lit8 v16, v16, 0x1

    goto :goto_7

    .line 758
    .end local v2    # "cumulativeTime":J
    .end local v6    # "timescale":J
    .end local v10    # "edtsOffset":J
    .end local v12    # "firstSampleFlags":I
    .end local v13    # "firstSampleFlagsPresent":Z
    .end local v16    # "i":I
    .end local v17    # "sampleCompositionTimeOffsetTable":[I
    .end local v18    # "sampleCompositionTimeOffsetsPresent":Z
    .end local v19    # "sampleDecodingTimeTable":[J
    .end local v20    # "sampleDuration":I
    .end local v21    # "sampleDurationsPresent":Z
    .end local v22    # "sampleFlags":I
    .end local v23    # "sampleFlagsPresent":Z
    .end local v24    # "sampleIsSyncFrameTable":[Z
    .end local v26    # "sampleSize":I
    .end local v27    # "sampleSizeTable":[I
    .end local v28    # "sampleSizesPresent":Z
    .end local v30    # "trackRunEnd":I
    .end local v31    # "workaroundEveryVideoFrameIsSyncFrame":Z
    :cond_4
    const/4 v13, 0x0

    goto/16 :goto_0

    .line 764
    .restart local v12    # "firstSampleFlags":I
    .restart local v13    # "firstSampleFlagsPresent":Z
    :cond_5
    const/16 v21, 0x0

    goto/16 :goto_1

    .line 765
    .restart local v21    # "sampleDurationsPresent":Z
    :cond_6
    const/16 v28, 0x0

    goto/16 :goto_2

    .line 766
    .restart local v28    # "sampleSizesPresent":Z
    :cond_7
    const/16 v23, 0x0

    goto/16 :goto_3

    .line 767
    .restart local v23    # "sampleFlagsPresent":Z
    :cond_8
    const/16 v18, 0x0

    goto/16 :goto_4

    .line 786
    .restart local v10    # "edtsOffset":J
    .restart local v17    # "sampleCompositionTimeOffsetTable":[I
    .restart local v18    # "sampleCompositionTimeOffsetsPresent":Z
    .restart local v19    # "sampleDecodingTimeTable":[J
    .restart local v24    # "sampleIsSyncFrameTable":[Z
    .restart local v27    # "sampleSizeTable":[I
    :cond_9
    const/16 v31, 0x0

    goto :goto_5

    .restart local v6    # "timescale":J
    .restart local v30    # "trackRunEnd":I
    .restart local v31    # "workaroundEveryVideoFrameIsSyncFrame":Z
    :cond_a
    move-wide/from16 v2, p2

    .line 791
    goto :goto_6

    .line 794
    .restart local v2    # "cumulativeTime":J
    .restart local v16    # "i":I
    :cond_b
    iget v0, v9, Lcom/google/android/exoplayer2/extractor/mp4/DefaultSampleValues;->duration:I

    move/from16 v20, v0

    goto :goto_8

    .line 796
    .restart local v20    # "sampleDuration":I
    :cond_c
    iget v0, v9, Lcom/google/android/exoplayer2/extractor/mp4/DefaultSampleValues;->size:I

    move/from16 v26, v0

    goto :goto_9

    .line 797
    .restart local v26    # "sampleSize":I
    :cond_d
    if-eqz v23, :cond_e

    .line 798
    invoke-virtual/range {p5 .. p5}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readInt()I

    move-result v22

    goto :goto_a

    :cond_e
    iget v0, v9, Lcom/google/android/exoplayer2/extractor/mp4/DefaultSampleValues;->flags:I

    move/from16 v22, v0

    goto :goto_a

    .line 808
    .restart local v22    # "sampleFlags":I
    :cond_f
    const/4 v4, 0x0

    aput v4, v17, v16

    goto :goto_b

    .line 813
    :cond_10
    const/4 v4, 0x0

    goto :goto_c

    .line 817
    .end local v20    # "sampleDuration":I
    .end local v22    # "sampleFlags":I
    .end local v26    # "sampleSize":I
    :cond_11
    iput-wide v2, v14, Lcom/google/android/exoplayer2/extractor/mp4/TrackFragment;->nextFragmentDecodeTime:J

    .line 818
    return v30
.end method

.method private static parseTruns(Lcom/google/android/exoplayer2/extractor/mp4/Atom$ContainerAtom;Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;JI)V
    .locals 20
    .param p0, "traf"    # Lcom/google/android/exoplayer2/extractor/mp4/Atom$ContainerAtom;
    .param p1, "trackBundle"    # Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;
    .param p2, "decodeTime"    # J
    .param p4, "flags"    # I

    .prologue
    .line 588
    const/4 v15, 0x0

    .line 589
    .local v15, "trunCount":I
    const/4 v13, 0x0

    .line 590
    .local v13, "totalSampleCount":I
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/google/android/exoplayer2/extractor/mp4/Atom$ContainerAtom;->leafChildren:Ljava/util/List;

    .line 591
    .local v11, "leafChildren":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/exoplayer2/extractor/mp4/Atom$LeafAtom;>;"
    invoke-interface {v11}, Ljava/util/List;->size()I

    move-result v12

    .line 592
    .local v12, "leafChildrenSize":I
    const/4 v10, 0x0

    .local v10, "i":I
    :goto_0
    if-ge v10, v12, :cond_1

    .line 593
    invoke-interface {v11, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/google/android/exoplayer2/extractor/mp4/Atom$LeafAtom;

    .line 594
    .local v9, "atom":Lcom/google/android/exoplayer2/extractor/mp4/Atom$LeafAtom;
    iget v2, v9, Lcom/google/android/exoplayer2/extractor/mp4/Atom$LeafAtom;->type:I

    sget v4, Lcom/google/android/exoplayer2/extractor/mp4/Atom;->TYPE_trun:I

    if-ne v2, v4, :cond_0

    .line 595
    iget-object v0, v9, Lcom/google/android/exoplayer2/extractor/mp4/Atom$LeafAtom;->data:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    move-object/from16 v16, v0

    .line 596
    .local v16, "trunData":Lcom/google/android/exoplayer2/util/ParsableByteArray;
    const/16 v2, 0xc

    move-object/from16 v0, v16

    invoke-virtual {v0, v2}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->setPosition(I)V

    .line 597
    invoke-virtual/range {v16 .. v16}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v18

    .line 598
    .local v18, "trunSampleCount":I
    if-lez v18, :cond_0

    .line 599
    add-int v13, v13, v18

    .line 600
    add-int/lit8 v15, v15, 0x1

    .line 592
    .end local v16    # "trunData":Lcom/google/android/exoplayer2/util/ParsableByteArray;
    .end local v18    # "trunSampleCount":I
    :cond_0
    add-int/lit8 v10, v10, 0x1

    goto :goto_0

    .line 604
    .end local v9    # "atom":Lcom/google/android/exoplayer2/extractor/mp4/Atom$LeafAtom;
    :cond_1
    const/4 v2, 0x0

    move-object/from16 v0, p1

    iput v2, v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;->currentTrackRunIndex:I

    .line 605
    const/4 v2, 0x0

    move-object/from16 v0, p1

    iput v2, v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;->currentSampleInTrackRun:I

    .line 606
    const/4 v2, 0x0

    move-object/from16 v0, p1

    iput v2, v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;->currentSampleIndex:I

    .line 607
    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;->fragment:Lcom/google/android/exoplayer2/extractor/mp4/TrackFragment;

    invoke-virtual {v2, v15, v13}, Lcom/google/android/exoplayer2/extractor/mp4/TrackFragment;->initTables(II)V

    .line 609
    const/4 v3, 0x0

    .line 610
    .local v3, "trunIndex":I
    const/4 v8, 0x0

    .line 611
    .local v8, "trunStartPosition":I
    const/4 v10, 0x0

    :goto_1
    if-ge v10, v12, :cond_3

    .line 612
    invoke-interface {v11, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lcom/google/android/exoplayer2/extractor/mp4/Atom$LeafAtom;

    .line 613
    .local v14, "trun":Lcom/google/android/exoplayer2/extractor/mp4/Atom$LeafAtom;
    iget v2, v14, Lcom/google/android/exoplayer2/extractor/mp4/Atom$LeafAtom;->type:I

    sget v4, Lcom/google/android/exoplayer2/extractor/mp4/Atom;->TYPE_trun:I

    if-ne v2, v4, :cond_2

    .line 614
    add-int/lit8 v17, v3, 0x1

    .end local v3    # "trunIndex":I
    .local v17, "trunIndex":I
    iget-object v7, v14, Lcom/google/android/exoplayer2/extractor/mp4/Atom$LeafAtom;->data:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    move-object/from16 v2, p1

    move-wide/from16 v4, p2

    move/from16 v6, p4

    invoke-static/range {v2 .. v8}, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->parseTrun(Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;IJILcom/google/android/exoplayer2/util/ParsableByteArray;I)I

    move-result v8

    move/from16 v3, v17

    .line 611
    .end local v17    # "trunIndex":I
    .restart local v3    # "trunIndex":I
    :cond_2
    add-int/lit8 v10, v10, 0x1

    goto :goto_1

    .line 618
    .end local v14    # "trun":Lcom/google/android/exoplayer2/extractor/mp4/Atom$LeafAtom;
    :cond_3
    return-void
.end method

.method private static parseUuid(Lcom/google/android/exoplayer2/util/ParsableByteArray;Lcom/google/android/exoplayer2/extractor/mp4/TrackFragment;[B)V
    .locals 2
    .param p0, "uuid"    # Lcom/google/android/exoplayer2/util/ParsableByteArray;
    .param p1, "out"    # Lcom/google/android/exoplayer2/extractor/mp4/TrackFragment;
    .param p2, "extendedTypeScratch"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ParserException;
        }
    .end annotation

    .prologue
    const/16 v1, 0x10

    .line 823
    const/16 v0, 0x8

    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->setPosition(I)V

    .line 824
    const/4 v0, 0x0

    invoke-virtual {p0, p2, v0, v1}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readBytes([BII)V

    .line 827
    sget-object v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->PIFF_SAMPLE_ENCRYPTION_BOX_EXTENDED_TYPE:[B

    invoke-static {p2, v0}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v0

    if-nez v0, :cond_0

    .line 835
    :goto_0
    return-void

    .line 834
    :cond_0
    invoke-static {p0, v1, p1}, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->parseSenc(Lcom/google/android/exoplayer2/util/ParsableByteArray;ILcom/google/android/exoplayer2/extractor/mp4/TrackFragment;)V

    goto :goto_0
.end method

.method private processAtomEnded(J)V
    .locals 3
    .param p1, "atomEndPosition"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ParserException;
        }
    .end annotation

    .prologue
    .line 355
    :goto_0
    iget-object v0, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->containerAtoms:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->containerAtoms:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->peek()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/exoplayer2/extractor/mp4/Atom$ContainerAtom;

    iget-wide v0, v0, Lcom/google/android/exoplayer2/extractor/mp4/Atom$ContainerAtom;->endPosition:J

    cmp-long v0, v0, p1

    if-nez v0, :cond_0

    .line 356
    iget-object v0, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->containerAtoms:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/exoplayer2/extractor/mp4/Atom$ContainerAtom;

    invoke-direct {p0, v0}, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->onContainerAtomRead(Lcom/google/android/exoplayer2/extractor/mp4/Atom$ContainerAtom;)V

    goto :goto_0

    .line 358
    :cond_0
    invoke-direct {p0}, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->enterReadingAtomHeaderState()V

    .line 359
    return-void
.end method

.method private readAtomHeader(Lcom/google/android/exoplayer2/extractor/ExtractorInput;)Z
    .locals 13
    .param p1, "input"    # Lcom/google/android/exoplayer2/extractor/ExtractorInput;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 267
    iget v8, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->atomHeaderBytesRead:I

    if-nez v8, :cond_1

    .line 269
    iget-object v8, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->atomHeader:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    iget-object v8, v8, Lcom/google/android/exoplayer2/util/ParsableByteArray;->data:[B

    const/4 v9, 0x0

    const/16 v10, 0x8

    const/4 v11, 0x1

    invoke-interface {p1, v8, v9, v10, v11}, Lcom/google/android/exoplayer2/extractor/ExtractorInput;->readFully([BIIZ)Z

    move-result v8

    if-nez v8, :cond_0

    .line 270
    const/4 v8, 0x0

    .line 340
    :goto_0
    return v8

    .line 272
    :cond_0
    const/16 v8, 0x8

    iput v8, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->atomHeaderBytesRead:I

    .line 273
    iget-object v8, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->atomHeader:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    const/4 v9, 0x0

    invoke-virtual {v8, v9}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->setPosition(I)V

    .line 274
    iget-object v8, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->atomHeader:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    invoke-virtual {v8}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readUnsignedInt()J

    move-result-wide v8

    iput-wide v8, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->atomSize:J

    .line 275
    iget-object v8, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->atomHeader:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    invoke-virtual {v8}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readInt()I

    move-result v8

    iput v8, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->atomType:I

    .line 278
    :cond_1
    iget-wide v8, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->atomSize:J

    const-wide/16 v10, 0x1

    cmp-long v8, v8, v10

    if-nez v8, :cond_2

    .line 280
    const/16 v5, 0x8

    .line 281
    .local v5, "headerBytesRemaining":I
    iget-object v8, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->atomHeader:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    iget-object v8, v8, Lcom/google/android/exoplayer2/util/ParsableByteArray;->data:[B

    const/16 v9, 0x8

    invoke-interface {p1, v8, v9, v5}, Lcom/google/android/exoplayer2/extractor/ExtractorInput;->readFully([BII)V

    .line 282
    iget v8, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->atomHeaderBytesRead:I

    add-int/2addr v8, v5

    iput v8, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->atomHeaderBytesRead:I

    .line 283
    iget-object v8, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->atomHeader:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    invoke-virtual {v8}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readUnsignedLongToLong()J

    move-result-wide v8

    iput-wide v8, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->atomSize:J

    .line 286
    .end local v5    # "headerBytesRemaining":I
    :cond_2
    iget-wide v8, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->atomSize:J

    iget v10, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->atomHeaderBytesRead:I

    int-to-long v10, v10

    cmp-long v8, v8, v10

    if-gez v8, :cond_3

    .line 287
    new-instance v8, Lcom/google/android/exoplayer2/ParserException;

    const-string/jumbo v9, "Atom size less than header length (unsupported)."

    invoke-direct {v8, v9}, Lcom/google/android/exoplayer2/ParserException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 290
    :cond_3
    invoke-interface {p1}, Lcom/google/android/exoplayer2/extractor/ExtractorInput;->getPosition()J

    move-result-wide v8

    iget v10, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->atomHeaderBytesRead:I

    int-to-long v10, v10

    sub-long v0, v8, v10

    .line 291
    .local v0, "atomPosition":J
    iget v8, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->atomType:I

    sget v9, Lcom/google/android/exoplayer2/extractor/mp4/Atom;->TYPE_moof:I

    if-ne v8, v9, :cond_4

    .line 293
    iget-object v8, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->trackBundles:Landroid/util/SparseArray;

    invoke-virtual {v8}, Landroid/util/SparseArray;->size()I

    move-result v7

    .line 294
    .local v7, "trackCount":I
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_1
    if-ge v6, v7, :cond_4

    .line 295
    iget-object v8, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->trackBundles:Landroid/util/SparseArray;

    invoke-virtual {v8, v6}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;

    iget-object v4, v8, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;->fragment:Lcom/google/android/exoplayer2/extractor/mp4/TrackFragment;

    .line 296
    .local v4, "fragment":Lcom/google/android/exoplayer2/extractor/mp4/TrackFragment;
    iput-wide v0, v4, Lcom/google/android/exoplayer2/extractor/mp4/TrackFragment;->atomPosition:J

    .line 297
    iput-wide v0, v4, Lcom/google/android/exoplayer2/extractor/mp4/TrackFragment;->auxiliaryDataPosition:J

    .line 298
    iput-wide v0, v4, Lcom/google/android/exoplayer2/extractor/mp4/TrackFragment;->dataPosition:J

    .line 294
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    .line 302
    .end local v4    # "fragment":Lcom/google/android/exoplayer2/extractor/mp4/TrackFragment;
    .end local v6    # "i":I
    .end local v7    # "trackCount":I
    :cond_4
    iget v8, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->atomType:I

    sget v9, Lcom/google/android/exoplayer2/extractor/mp4/Atom;->TYPE_mdat:I

    if-ne v8, v9, :cond_6

    .line 303
    const/4 v8, 0x0

    iput-object v8, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->currentTrackBundle:Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;

    .line 304
    iget-wide v8, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->atomSize:J

    add-long/2addr v8, v0

    iput-wide v8, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->endOfMdatPosition:J

    .line 305
    iget-boolean v8, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->haveOutputSeekMap:Z

    if-nez v8, :cond_5

    .line 306
    iget-object v8, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->extractorOutput:Lcom/google/android/exoplayer2/extractor/ExtractorOutput;

    new-instance v9, Lcom/google/android/exoplayer2/extractor/SeekMap$Unseekable;

    iget-wide v10, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->durationUs:J

    invoke-direct {v9, v10, v11}, Lcom/google/android/exoplayer2/extractor/SeekMap$Unseekable;-><init>(J)V

    invoke-interface {v8, v9}, Lcom/google/android/exoplayer2/extractor/ExtractorOutput;->seekMap(Lcom/google/android/exoplayer2/extractor/SeekMap;)V

    .line 307
    const/4 v8, 0x1

    iput-boolean v8, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->haveOutputSeekMap:Z

    .line 309
    :cond_5
    const/4 v8, 0x2

    iput v8, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->parserState:I

    .line 310
    const/4 v8, 0x1

    goto/16 :goto_0

    .line 313
    :cond_6
    iget v8, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->atomType:I

    invoke-static {v8}, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->shouldParseContainerAtom(I)Z

    move-result v8

    if-eqz v8, :cond_8

    .line 314
    invoke-interface {p1}, Lcom/google/android/exoplayer2/extractor/ExtractorInput;->getPosition()J

    move-result-wide v8

    iget-wide v10, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->atomSize:J

    add-long/2addr v8, v10

    const-wide/16 v10, 0x8

    sub-long v2, v8, v10

    .line 315
    .local v2, "endPosition":J
    iget-object v8, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->containerAtoms:Ljava/util/Stack;

    new-instance v9, Lcom/google/android/exoplayer2/extractor/mp4/Atom$ContainerAtom;

    iget v10, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->atomType:I

    invoke-direct {v9, v10, v2, v3}, Lcom/google/android/exoplayer2/extractor/mp4/Atom$ContainerAtom;-><init>(IJ)V

    invoke-virtual {v8, v9}, Ljava/util/Stack;->add(Ljava/lang/Object;)Z

    .line 316
    iget-wide v8, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->atomSize:J

    iget v10, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->atomHeaderBytesRead:I

    int-to-long v10, v10

    cmp-long v8, v8, v10

    if-nez v8, :cond_7

    .line 317
    invoke-direct {p0, v2, v3}, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->processAtomEnded(J)V

    .line 340
    .end local v2    # "endPosition":J
    :goto_2
    const/4 v8, 0x1

    goto/16 :goto_0

    .line 320
    .restart local v2    # "endPosition":J
    :cond_7
    invoke-direct {p0}, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->enterReadingAtomHeaderState()V

    goto :goto_2

    .line 322
    .end local v2    # "endPosition":J
    :cond_8
    iget v8, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->atomType:I

    invoke-static {v8}, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->shouldParseLeafAtom(I)Z

    move-result v8

    if-eqz v8, :cond_b

    .line 323
    iget v8, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->atomHeaderBytesRead:I

    const/16 v9, 0x8

    if-eq v8, v9, :cond_9

    .line 324
    new-instance v8, Lcom/google/android/exoplayer2/ParserException;

    const-string/jumbo v9, "Leaf atom defines extended atom size (unsupported)."

    invoke-direct {v8, v9}, Lcom/google/android/exoplayer2/ParserException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 326
    :cond_9
    iget-wide v8, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->atomSize:J

    const-wide/32 v10, 0x7fffffff

    cmp-long v8, v8, v10

    if-lez v8, :cond_a

    .line 327
    new-instance v8, Lcom/google/android/exoplayer2/ParserException;

    const-string/jumbo v9, "Leaf atom with length > 2147483647 (unsupported)."

    invoke-direct {v8, v9}, Lcom/google/android/exoplayer2/ParserException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 329
    :cond_a
    new-instance v8, Lcom/google/android/exoplayer2/util/ParsableByteArray;

    iget-wide v10, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->atomSize:J

    long-to-int v9, v10

    invoke-direct {v8, v9}, Lcom/google/android/exoplayer2/util/ParsableByteArray;-><init>(I)V

    iput-object v8, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->atomData:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    .line 330
    iget-object v8, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->atomHeader:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    iget-object v8, v8, Lcom/google/android/exoplayer2/util/ParsableByteArray;->data:[B

    const/4 v9, 0x0

    iget-object v10, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->atomData:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    iget-object v10, v10, Lcom/google/android/exoplayer2/util/ParsableByteArray;->data:[B

    const/4 v11, 0x0

    const/16 v12, 0x8

    invoke-static {v8, v9, v10, v11, v12}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 331
    const/4 v8, 0x1

    iput v8, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->parserState:I

    goto :goto_2

    .line 333
    :cond_b
    iget-wide v8, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->atomSize:J

    const-wide/32 v10, 0x7fffffff

    cmp-long v8, v8, v10

    if-lez v8, :cond_c

    .line 334
    new-instance v8, Lcom/google/android/exoplayer2/ParserException;

    const-string/jumbo v9, "Skipping atom with length > 2147483647 (unsupported)."

    invoke-direct {v8, v9}, Lcom/google/android/exoplayer2/ParserException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 336
    :cond_c
    const/4 v8, 0x0

    iput-object v8, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->atomData:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    .line 337
    const/4 v8, 0x1

    iput v8, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->parserState:I

    goto :goto_2
.end method

.method private readAtomPayload(Lcom/google/android/exoplayer2/extractor/ExtractorInput;)V
    .locals 4
    .param p1, "input"    # Lcom/google/android/exoplayer2/extractor/ExtractorInput;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 344
    iget-wide v2, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->atomSize:J

    long-to-int v1, v2

    iget v2, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->atomHeaderBytesRead:I

    sub-int v0, v1, v2

    .line 345
    .local v0, "atomPayloadSize":I
    iget-object v1, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->atomData:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    if-eqz v1, :cond_0

    .line 346
    iget-object v1, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->atomData:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    iget-object v1, v1, Lcom/google/android/exoplayer2/util/ParsableByteArray;->data:[B

    const/16 v2, 0x8

    invoke-interface {p1, v1, v2, v0}, Lcom/google/android/exoplayer2/extractor/ExtractorInput;->readFully([BII)V

    .line 347
    new-instance v1, Lcom/google/android/exoplayer2/extractor/mp4/Atom$LeafAtom;

    iget v2, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->atomType:I

    iget-object v3, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->atomData:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    invoke-direct {v1, v2, v3}, Lcom/google/android/exoplayer2/extractor/mp4/Atom$LeafAtom;-><init>(ILcom/google/android/exoplayer2/util/ParsableByteArray;)V

    invoke-interface {p1}, Lcom/google/android/exoplayer2/extractor/ExtractorInput;->getPosition()J

    move-result-wide v2

    invoke-direct {p0, v1, v2, v3}, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->onLeafAtomRead(Lcom/google/android/exoplayer2/extractor/mp4/Atom$LeafAtom;J)V

    .line 351
    :goto_0
    invoke-interface {p1}, Lcom/google/android/exoplayer2/extractor/ExtractorInput;->getPosition()J

    move-result-wide v2

    invoke-direct {p0, v2, v3}, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->processAtomEnded(J)V

    .line 352
    return-void

    .line 349
    :cond_0
    invoke-interface {p1, v0}, Lcom/google/android/exoplayer2/extractor/ExtractorInput;->skipFully(I)V

    goto :goto_0
.end method

.method private readEncryptionData(Lcom/google/android/exoplayer2/extractor/ExtractorInput;)V
    .locals 10
    .param p1, "input"    # Lcom/google/android/exoplayer2/extractor/ExtractorInput;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 974
    const/4 v4, 0x0

    .line 975
    .local v4, "nextTrackBundle":Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;
    const-wide v2, 0x7fffffffffffffffL

    .line 976
    .local v2, "nextDataOffset":J
    iget-object v7, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->trackBundles:Landroid/util/SparseArray;

    invoke-virtual {v7}, Landroid/util/SparseArray;->size()I

    move-result v5

    .line 977
    .local v5, "trackBundlesSize":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v5, :cond_1

    .line 978
    iget-object v7, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->trackBundles:Landroid/util/SparseArray;

    invoke-virtual {v7, v1}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;

    iget-object v6, v7, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;->fragment:Lcom/google/android/exoplayer2/extractor/mp4/TrackFragment;

    .line 979
    .local v6, "trackFragment":Lcom/google/android/exoplayer2/extractor/mp4/TrackFragment;
    iget-boolean v7, v6, Lcom/google/android/exoplayer2/extractor/mp4/TrackFragment;->sampleEncryptionDataNeedsFill:Z

    if-eqz v7, :cond_0

    iget-wide v8, v6, Lcom/google/android/exoplayer2/extractor/mp4/TrackFragment;->auxiliaryDataPosition:J

    cmp-long v7, v8, v2

    if-gez v7, :cond_0

    .line 981
    iget-wide v2, v6, Lcom/google/android/exoplayer2/extractor/mp4/TrackFragment;->auxiliaryDataPosition:J

    .line 982
    iget-object v7, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->trackBundles:Landroid/util/SparseArray;

    invoke-virtual {v7, v1}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v4

    .end local v4    # "nextTrackBundle":Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;
    check-cast v4, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;

    .line 977
    .restart local v4    # "nextTrackBundle":Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 985
    .end local v6    # "trackFragment":Lcom/google/android/exoplayer2/extractor/mp4/TrackFragment;
    :cond_1
    if-nez v4, :cond_2

    .line 986
    const/4 v7, 0x3

    iput v7, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->parserState:I

    .line 995
    :goto_1
    return-void

    .line 989
    :cond_2
    invoke-interface {p1}, Lcom/google/android/exoplayer2/extractor/ExtractorInput;->getPosition()J

    move-result-wide v8

    sub-long v8, v2, v8

    long-to-int v0, v8

    .line 990
    .local v0, "bytesToSkip":I
    if-gez v0, :cond_3

    .line 991
    new-instance v7, Lcom/google/android/exoplayer2/ParserException;

    const-string/jumbo v8, "Offset to encryption data was negative."

    invoke-direct {v7, v8}, Lcom/google/android/exoplayer2/ParserException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 993
    :cond_3
    invoke-interface {p1, v0}, Lcom/google/android/exoplayer2/extractor/ExtractorInput;->skipFully(I)V

    .line 994
    iget-object v7, v4, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;->fragment:Lcom/google/android/exoplayer2/extractor/mp4/TrackFragment;

    invoke-virtual {v7, p1}, Lcom/google/android/exoplayer2/extractor/mp4/TrackFragment;->fillEncryptionData(Lcom/google/android/exoplayer2/extractor/ExtractorInput;)V

    goto :goto_1
.end method

.method private readSample(Lcom/google/android/exoplayer2/extractor/ExtractorInput;)Z
    .locals 33
    .param p1, "input"    # Lcom/google/android/exoplayer2/extractor/ExtractorInput;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 1012
    move-object/from16 v0, p0

    iget v9, v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->parserState:I

    const/4 v10, 0x3

    if-ne v9, v10, :cond_5

    .line 1013
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->currentTrackBundle:Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;

    if-nez v9, :cond_3

    .line 1014
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->trackBundles:Landroid/util/SparseArray;

    invoke-static {v9}, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->getNextFragmentRun(Landroid/util/SparseArray;)Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;

    move-result-object v12

    .line 1015
    .local v12, "currentTrackBundle":Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;
    if-nez v12, :cond_1

    .line 1018
    move-object/from16 v0, p0

    iget-wide v14, v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->endOfMdatPosition:J

    invoke-interface/range {p1 .. p1}, Lcom/google/android/exoplayer2/extractor/ExtractorInput;->getPosition()J

    move-result-wide v16

    sub-long v14, v14, v16

    long-to-int v4, v14

    .line 1019
    .local v4, "bytesToSkip":I
    if-gez v4, :cond_0

    .line 1020
    new-instance v9, Lcom/google/android/exoplayer2/ParserException;

    const-string/jumbo v10, "Offset to end of mdat was negative."

    invoke-direct {v9, v10}, Lcom/google/android/exoplayer2/ParserException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 1022
    :cond_0
    move-object/from16 v0, p1

    invoke-interface {v0, v4}, Lcom/google/android/exoplayer2/extractor/ExtractorInput;->skipFully(I)V

    .line 1023
    invoke-direct/range {p0 .. p0}, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->enterReadingAtomHeaderState()V

    .line 1024
    const/4 v9, 0x0

    .line 1148
    .end local v4    # "bytesToSkip":I
    .end local v12    # "currentTrackBundle":Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;
    :goto_0
    return v9

    .line 1027
    .restart local v12    # "currentTrackBundle":Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;
    :cond_1
    iget-object v9, v12, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;->fragment:Lcom/google/android/exoplayer2/extractor/mp4/TrackFragment;

    iget-object v9, v9, Lcom/google/android/exoplayer2/extractor/mp4/TrackFragment;->trunDataPosition:[J

    iget v10, v12, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;->currentTrackRunIndex:I

    aget-wide v26, v9, v10

    .line 1030
    .local v26, "nextDataPosition":J
    invoke-interface/range {p1 .. p1}, Lcom/google/android/exoplayer2/extractor/ExtractorInput;->getPosition()J

    move-result-wide v14

    sub-long v14, v26, v14

    long-to-int v4, v14

    .line 1031
    .restart local v4    # "bytesToSkip":I
    if-gez v4, :cond_2

    .line 1033
    const-string/jumbo v9, "FragmentedMp4Extractor"

    const-string/jumbo v10, "Ignoring negative offset to sample data."

    invoke-static {v9, v10}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1034
    const/4 v4, 0x0

    .line 1036
    :cond_2
    move-object/from16 v0, p1

    invoke-interface {v0, v4}, Lcom/google/android/exoplayer2/extractor/ExtractorInput;->skipFully(I)V

    .line 1037
    move-object/from16 v0, p0

    iput-object v12, v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->currentTrackBundle:Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;

    .line 1039
    .end local v4    # "bytesToSkip":I
    .end local v12    # "currentTrackBundle":Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;
    .end local v26    # "nextDataPosition":J
    :cond_3
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->currentTrackBundle:Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;

    iget-object v9, v9, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;->fragment:Lcom/google/android/exoplayer2/extractor/mp4/TrackFragment;

    iget-object v9, v9, Lcom/google/android/exoplayer2/extractor/mp4/TrackFragment;->sampleSizeTable:[I

    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->currentTrackBundle:Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;

    iget v10, v10, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;->currentSampleIndex:I

    aget v9, v9, v10

    move-object/from16 v0, p0

    iput v9, v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->sampleSize:I

    .line 1041
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->currentTrackBundle:Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;

    iget-object v9, v9, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;->fragment:Lcom/google/android/exoplayer2/extractor/mp4/TrackFragment;

    iget-boolean v9, v9, Lcom/google/android/exoplayer2/extractor/mp4/TrackFragment;->definesEncryptionData:Z

    if-eqz v9, :cond_7

    .line 1042
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->currentTrackBundle:Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;

    move-object/from16 v0, p0

    invoke-direct {v0, v9}, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->appendSampleEncryptionData(Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;)I

    move-result v9

    move-object/from16 v0, p0

    iput v9, v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->sampleBytesWritten:I

    .line 1043
    move-object/from16 v0, p0

    iget v9, v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->sampleSize:I

    move-object/from16 v0, p0

    iget v10, v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->sampleBytesWritten:I

    add-int/2addr v9, v10

    move-object/from16 v0, p0

    iput v9, v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->sampleSize:I

    .line 1047
    :goto_1
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->currentTrackBundle:Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;

    iget-object v9, v9, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;->track:Lcom/google/android/exoplayer2/extractor/mp4/Track;

    iget v9, v9, Lcom/google/android/exoplayer2/extractor/mp4/Track;->sampleTransformation:I

    const/4 v10, 0x1

    if-ne v9, v10, :cond_4

    .line 1048
    move-object/from16 v0, p0

    iget v9, v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->sampleSize:I

    add-int/lit8 v9, v9, -0x8

    move-object/from16 v0, p0

    iput v9, v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->sampleSize:I

    .line 1049
    const/16 v9, 0x8

    move-object/from16 v0, p1

    invoke-interface {v0, v9}, Lcom/google/android/exoplayer2/extractor/ExtractorInput;->skipFully(I)V

    .line 1051
    :cond_4
    const/4 v9, 0x4

    move-object/from16 v0, p0

    iput v9, v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->parserState:I

    .line 1052
    const/4 v9, 0x0

    move-object/from16 v0, p0

    iput v9, v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->sampleCurrentNalBytesRemaining:I

    .line 1055
    :cond_5
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->currentTrackBundle:Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;

    iget-object v0, v9, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;->fragment:Lcom/google/android/exoplayer2/extractor/mp4/TrackFragment;

    move-object/from16 v20, v0

    .line 1056
    .local v20, "fragment":Lcom/google/android/exoplayer2/extractor/mp4/TrackFragment;
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->currentTrackBundle:Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;

    iget-object v0, v9, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;->track:Lcom/google/android/exoplayer2/extractor/mp4/Track;

    move-object/from16 v30, v0

    .line 1057
    .local v30, "track":Lcom/google/android/exoplayer2/extractor/mp4/Track;
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->currentTrackBundle:Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;

    iget-object v5, v9, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;->output:Lcom/google/android/exoplayer2/extractor/TrackOutput;

    .line 1058
    .local v5, "output":Lcom/google/android/exoplayer2/extractor/TrackOutput;
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->currentTrackBundle:Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;

    iget v0, v9, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;->currentSampleIndex:I

    move/from16 v28, v0

    .line 1059
    .local v28, "sampleIndex":I
    move-object/from16 v0, v30

    iget v9, v0, Lcom/google/android/exoplayer2/extractor/mp4/Track;->nalUnitLengthFieldLength:I

    if-eqz v9, :cond_9

    .line 1062
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->nalLength:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    iget-object v0, v9, Lcom/google/android/exoplayer2/util/ParsableByteArray;->data:[B

    move-object/from16 v21, v0

    .line 1063
    .local v21, "nalLengthData":[B
    const/4 v9, 0x0

    const/4 v10, 0x0

    aput-byte v10, v21, v9

    .line 1064
    const/4 v9, 0x1

    const/4 v10, 0x0

    aput-byte v10, v21, v9

    .line 1065
    const/4 v9, 0x2

    const/4 v10, 0x0

    aput-byte v10, v21, v9

    .line 1066
    move-object/from16 v0, v30

    iget v0, v0, Lcom/google/android/exoplayer2/extractor/mp4/Track;->nalUnitLengthFieldLength:I

    move/from16 v23, v0

    .line 1067
    .local v23, "nalUnitLengthFieldLength":I
    move-object/from16 v0, v30

    iget v9, v0, Lcom/google/android/exoplayer2/extractor/mp4/Track;->nalUnitLengthFieldLength:I

    rsub-int/lit8 v24, v9, 0x4

    .line 1071
    .local v24, "nalUnitLengthFieldLengthDiff":I
    :cond_6
    :goto_2
    move-object/from16 v0, p0

    iget v9, v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->sampleBytesWritten:I

    move-object/from16 v0, p0

    iget v10, v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->sampleSize:I

    if-ge v9, v10, :cond_a

    .line 1072
    move-object/from16 v0, p0

    iget v9, v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->sampleCurrentNalBytesRemaining:I

    if-nez v9, :cond_8

    .line 1074
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->nalLength:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    iget-object v9, v9, Lcom/google/android/exoplayer2/util/ParsableByteArray;->data:[B

    move-object/from16 v0, p1

    move/from16 v1, v24

    move/from16 v2, v23

    invoke-interface {v0, v9, v1, v2}, Lcom/google/android/exoplayer2/extractor/ExtractorInput;->readFully([BII)V

    .line 1075
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->nalLength:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    const/4 v10, 0x0

    invoke-virtual {v9, v10}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->setPosition(I)V

    .line 1076
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->nalLength:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    invoke-virtual {v9}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v9

    move-object/from16 v0, p0

    iput v9, v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->sampleCurrentNalBytesRemaining:I

    .line 1078
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->nalStartCode:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    const/4 v10, 0x0

    invoke-virtual {v9, v10}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->setPosition(I)V

    .line 1079
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->nalStartCode:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    const/4 v10, 0x4

    invoke-interface {v5, v9, v10}, Lcom/google/android/exoplayer2/extractor/TrackOutput;->sampleData(Lcom/google/android/exoplayer2/util/ParsableByteArray;I)V

    .line 1080
    move-object/from16 v0, p0

    iget v9, v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->sampleBytesWritten:I

    add-int/lit8 v9, v9, 0x4

    move-object/from16 v0, p0

    iput v9, v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->sampleBytesWritten:I

    .line 1081
    move-object/from16 v0, p0

    iget v9, v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->sampleSize:I

    add-int v9, v9, v24

    move-object/from16 v0, p0

    iput v9, v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->sampleSize:I

    .line 1082
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->cea608TrackOutput:Lcom/google/android/exoplayer2/extractor/TrackOutput;

    if-eqz v9, :cond_6

    .line 1083
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->nalPayload:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    iget-object v0, v9, Lcom/google/android/exoplayer2/util/ParsableByteArray;->data:[B

    move-object/from16 v22, v0

    .line 1085
    .local v22, "nalPayloadData":[B
    const/4 v9, 0x0

    const/4 v10, 0x1

    move-object/from16 v0, p1

    move-object/from16 v1, v22

    invoke-interface {v0, v1, v9, v10}, Lcom/google/android/exoplayer2/extractor/ExtractorInput;->peekFully([BII)V

    .line 1086
    const/4 v9, 0x0

    aget-byte v9, v22, v9

    and-int/lit8 v9, v9, 0x1f

    const/4 v10, 0x6

    if-ne v9, v10, :cond_6

    .line 1088
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->nalPayload:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    move-object/from16 v0, p0

    iget v10, v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->sampleCurrentNalBytesRemaining:I

    invoke-virtual {v9, v10}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->reset(I)V

    .line 1089
    const/4 v9, 0x0

    move-object/from16 v0, p0

    iget v10, v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->sampleCurrentNalBytesRemaining:I

    move-object/from16 v0, p1

    move-object/from16 v1, v22

    invoke-interface {v0, v1, v9, v10}, Lcom/google/android/exoplayer2/extractor/ExtractorInput;->readFully([BII)V

    .line 1091
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->nalPayload:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    move-object/from16 v0, p0

    iget v10, v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->sampleCurrentNalBytesRemaining:I

    invoke-interface {v5, v9, v10}, Lcom/google/android/exoplayer2/extractor/TrackOutput;->sampleData(Lcom/google/android/exoplayer2/util/ParsableByteArray;I)V

    .line 1092
    move-object/from16 v0, p0

    iget v9, v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->sampleBytesWritten:I

    move-object/from16 v0, p0

    iget v10, v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->sampleCurrentNalBytesRemaining:I

    add-int/2addr v9, v10

    move-object/from16 v0, p0

    iput v9, v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->sampleBytesWritten:I

    .line 1093
    const/4 v9, 0x0

    move-object/from16 v0, p0

    iput v9, v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->sampleCurrentNalBytesRemaining:I

    .line 1095
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->nalPayload:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    invoke-virtual {v9}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->limit()I

    move-result v9

    move-object/from16 v0, v22

    invoke-static {v0, v9}, Lcom/google/android/exoplayer2/util/NalUnitUtil;->unescapeStream([BI)I

    move-result v31

    .line 1096
    .local v31, "unescapedLength":I
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->nalPayload:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    const/4 v10, 0x1

    invoke-virtual {v9, v10}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->setPosition(I)V

    .line 1097
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->nalPayload:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    move/from16 v0, v31

    invoke-virtual {v9, v0}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->setLimit(I)V

    .line 1098
    move-object/from16 v0, v20

    move/from16 v1, v28

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/extractor/mp4/TrackFragment;->getSamplePresentationTime(I)J

    move-result-wide v14

    const-wide/16 v16, 0x3e8

    mul-long v14, v14, v16

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->nalPayload:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->cea608TrackOutput:Lcom/google/android/exoplayer2/extractor/TrackOutput;

    invoke-static {v14, v15, v9, v10}, Lcom/google/android/exoplayer2/text/cea/CeaUtil;->consume(JLcom/google/android/exoplayer2/util/ParsableByteArray;Lcom/google/android/exoplayer2/extractor/TrackOutput;)V

    goto/16 :goto_2

    .line 1045
    .end local v5    # "output":Lcom/google/android/exoplayer2/extractor/TrackOutput;
    .end local v20    # "fragment":Lcom/google/android/exoplayer2/extractor/mp4/TrackFragment;
    .end local v21    # "nalLengthData":[B
    .end local v22    # "nalPayloadData":[B
    .end local v23    # "nalUnitLengthFieldLength":I
    .end local v24    # "nalUnitLengthFieldLengthDiff":I
    .end local v28    # "sampleIndex":I
    .end local v30    # "track":Lcom/google/android/exoplayer2/extractor/mp4/Track;
    .end local v31    # "unescapedLength":I
    :cond_7
    const/4 v9, 0x0

    move-object/from16 v0, p0

    iput v9, v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->sampleBytesWritten:I

    goto/16 :goto_1

    .line 1104
    .restart local v5    # "output":Lcom/google/android/exoplayer2/extractor/TrackOutput;
    .restart local v20    # "fragment":Lcom/google/android/exoplayer2/extractor/mp4/TrackFragment;
    .restart local v21    # "nalLengthData":[B
    .restart local v23    # "nalUnitLengthFieldLength":I
    .restart local v24    # "nalUnitLengthFieldLengthDiff":I
    .restart local v28    # "sampleIndex":I
    .restart local v30    # "track":Lcom/google/android/exoplayer2/extractor/mp4/Track;
    :cond_8
    move-object/from16 v0, p0

    iget v9, v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->sampleCurrentNalBytesRemaining:I

    const/4 v10, 0x0

    move-object/from16 v0, p1

    invoke-interface {v5, v0, v9, v10}, Lcom/google/android/exoplayer2/extractor/TrackOutput;->sampleData(Lcom/google/android/exoplayer2/extractor/ExtractorInput;IZ)I

    move-result v32

    .line 1105
    .local v32, "writtenBytes":I
    move-object/from16 v0, p0

    iget v9, v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->sampleBytesWritten:I

    add-int v9, v9, v32

    move-object/from16 v0, p0

    iput v9, v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->sampleBytesWritten:I

    .line 1106
    move-object/from16 v0, p0

    iget v9, v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->sampleCurrentNalBytesRemaining:I

    sub-int v9, v9, v32

    move-object/from16 v0, p0

    iput v9, v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->sampleCurrentNalBytesRemaining:I

    goto/16 :goto_2

    .line 1110
    .end local v21    # "nalLengthData":[B
    .end local v23    # "nalUnitLengthFieldLength":I
    .end local v24    # "nalUnitLengthFieldLengthDiff":I
    .end local v32    # "writtenBytes":I
    :cond_9
    :goto_3
    move-object/from16 v0, p0

    iget v9, v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->sampleBytesWritten:I

    move-object/from16 v0, p0

    iget v10, v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->sampleSize:I

    if-ge v9, v10, :cond_a

    .line 1111
    move-object/from16 v0, p0

    iget v9, v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->sampleSize:I

    move-object/from16 v0, p0

    iget v10, v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->sampleBytesWritten:I

    sub-int/2addr v9, v10

    const/4 v10, 0x0

    move-object/from16 v0, p1

    invoke-interface {v5, v0, v9, v10}, Lcom/google/android/exoplayer2/extractor/TrackOutput;->sampleData(Lcom/google/android/exoplayer2/extractor/ExtractorInput;IZ)I

    move-result v32

    .line 1112
    .restart local v32    # "writtenBytes":I
    move-object/from16 v0, p0

    iget v9, v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->sampleBytesWritten:I

    add-int v9, v9, v32

    move-object/from16 v0, p0

    iput v9, v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->sampleBytesWritten:I

    goto :goto_3

    .line 1116
    .end local v32    # "writtenBytes":I
    :cond_a
    move-object/from16 v0, v20

    move/from16 v1, v28

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/extractor/mp4/TrackFragment;->getSamplePresentationTime(I)J

    move-result-wide v14

    const-wide/16 v16, 0x3e8

    mul-long v6, v14, v16

    .line 1117
    .local v6, "sampleTimeUs":J
    move-object/from16 v0, v20

    iget-boolean v9, v0, Lcom/google/android/exoplayer2/extractor/mp4/TrackFragment;->definesEncryptionData:Z

    if-eqz v9, :cond_d

    const/high16 v9, 0x40000000    # 2.0f

    :goto_4
    move-object/from16 v0, v20

    iget-object v10, v0, Lcom/google/android/exoplayer2/extractor/mp4/TrackFragment;->sampleIsSyncFrameTable:[Z

    aget-boolean v10, v10, v28

    if-eqz v10, :cond_e

    const/4 v10, 0x1

    :goto_5
    or-int v8, v9, v10

    .line 1119
    .local v8, "sampleFlags":I
    move-object/from16 v0, v20

    iget-object v9, v0, Lcom/google/android/exoplayer2/extractor/mp4/TrackFragment;->header:Lcom/google/android/exoplayer2/extractor/mp4/DefaultSampleValues;

    iget v0, v9, Lcom/google/android/exoplayer2/extractor/mp4/DefaultSampleValues;->sampleDescriptionIndex:I

    move/from16 v25, v0

    .line 1120
    .local v25, "sampleDescriptionIndex":I
    const/4 v11, 0x0

    .line 1121
    .local v11, "encryptionKey":[B
    move-object/from16 v0, v20

    iget-boolean v9, v0, Lcom/google/android/exoplayer2/extractor/mp4/TrackFragment;->definesEncryptionData:Z

    if-eqz v9, :cond_b

    .line 1122
    move-object/from16 v0, v20

    iget-object v9, v0, Lcom/google/android/exoplayer2/extractor/mp4/TrackFragment;->trackEncryptionBox:Lcom/google/android/exoplayer2/extractor/mp4/TrackEncryptionBox;

    if-eqz v9, :cond_f

    move-object/from16 v0, v20

    iget-object v9, v0, Lcom/google/android/exoplayer2/extractor/mp4/TrackFragment;->trackEncryptionBox:Lcom/google/android/exoplayer2/extractor/mp4/TrackEncryptionBox;

    iget-object v11, v9, Lcom/google/android/exoplayer2/extractor/mp4/TrackEncryptionBox;->keyId:[B

    .line 1126
    :cond_b
    :goto_6
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->timestampAdjuster:Lcom/google/android/exoplayer2/util/TimestampAdjuster;

    if-eqz v9, :cond_c

    .line 1127
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->timestampAdjuster:Lcom/google/android/exoplayer2/util/TimestampAdjuster;

    invoke-virtual {v9, v6, v7}, Lcom/google/android/exoplayer2/util/TimestampAdjuster;->adjustSampleTimestamp(J)J

    move-result-wide v6

    .line 1129
    :cond_c
    move-object/from16 v0, p0

    iget v9, v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->sampleSize:I

    const/4 v10, 0x0

    invoke-interface/range {v5 .. v11}, Lcom/google/android/exoplayer2/extractor/TrackOutput;->sampleMetadata(JIII[B)V

    .line 1131
    :goto_7
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->pendingMetadataSampleInfos:Ljava/util/LinkedList;

    invoke-virtual {v9}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v9

    if-nez v9, :cond_10

    .line 1132
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->pendingMetadataSampleInfos:Ljava/util/LinkedList;

    invoke-virtual {v9}, Ljava/util/LinkedList;->removeFirst()Ljava/lang/Object;

    move-result-object v29

    check-cast v29, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$MetadataSampleInfo;

    .line 1133
    .local v29, "sampleInfo":Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$MetadataSampleInfo;
    move-object/from16 v0, p0

    iget v9, v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->pendingMetadataSampleBytes:I

    move-object/from16 v0, v29

    iget v10, v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$MetadataSampleInfo;->size:I

    sub-int/2addr v9, v10

    move-object/from16 v0, p0

    iput v9, v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->pendingMetadataSampleBytes:I

    .line 1134
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->eventMessageTrackOutput:Lcom/google/android/exoplayer2/extractor/TrackOutput;

    move-object/from16 v0, v29

    iget-wide v14, v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$MetadataSampleInfo;->presentationTimeDeltaUs:J

    add-long/2addr v14, v6

    const/16 v16, 0x1

    move-object/from16 v0, v29

    iget v0, v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$MetadataSampleInfo;->size:I

    move/from16 v17, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->pendingMetadataSampleBytes:I

    move/from16 v18, v0

    const/16 v19, 0x0

    invoke-interface/range {v13 .. v19}, Lcom/google/android/exoplayer2/extractor/TrackOutput;->sampleMetadata(JIII[B)V

    goto :goto_7

    .line 1117
    .end local v8    # "sampleFlags":I
    .end local v11    # "encryptionKey":[B
    .end local v25    # "sampleDescriptionIndex":I
    .end local v29    # "sampleInfo":Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$MetadataSampleInfo;
    :cond_d
    const/4 v9, 0x0

    goto :goto_4

    :cond_e
    const/4 v10, 0x0

    goto :goto_5

    .line 1122
    .restart local v8    # "sampleFlags":I
    .restart local v11    # "encryptionKey":[B
    .restart local v25    # "sampleDescriptionIndex":I
    :cond_f
    move-object/from16 v0, v30

    iget-object v9, v0, Lcom/google/android/exoplayer2/extractor/mp4/Track;->sampleDescriptionEncryptionBoxes:[Lcom/google/android/exoplayer2/extractor/mp4/TrackEncryptionBox;

    aget-object v9, v9, v25

    iget-object v11, v9, Lcom/google/android/exoplayer2/extractor/mp4/TrackEncryptionBox;->keyId:[B

    goto :goto_6

    .line 1139
    :cond_10
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->currentTrackBundle:Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;

    iget v10, v9, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;->currentSampleIndex:I

    add-int/lit8 v10, v10, 0x1

    iput v10, v9, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;->currentSampleIndex:I

    .line 1140
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->currentTrackBundle:Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;

    iget v10, v9, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;->currentSampleInTrackRun:I

    add-int/lit8 v10, v10, 0x1

    iput v10, v9, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;->currentSampleInTrackRun:I

    .line 1141
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->currentTrackBundle:Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;

    iget v9, v9, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;->currentSampleInTrackRun:I

    move-object/from16 v0, v20

    iget-object v10, v0, Lcom/google/android/exoplayer2/extractor/mp4/TrackFragment;->trunLength:[I

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->currentTrackBundle:Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;

    iget v13, v13, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;->currentTrackRunIndex:I

    aget v10, v10, v13

    if-ne v9, v10, :cond_11

    .line 1143
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->currentTrackBundle:Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;

    iget v10, v9, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;->currentTrackRunIndex:I

    add-int/lit8 v10, v10, 0x1

    iput v10, v9, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;->currentTrackRunIndex:I

    .line 1144
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->currentTrackBundle:Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;

    const/4 v10, 0x0

    iput v10, v9, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;->currentSampleInTrackRun:I

    .line 1145
    const/4 v9, 0x0

    move-object/from16 v0, p0

    iput-object v9, v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->currentTrackBundle:Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;

    .line 1147
    :cond_11
    const/4 v9, 0x3

    move-object/from16 v0, p0

    iput v9, v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->parserState:I

    .line 1148
    const/4 v9, 0x1

    goto/16 :goto_0
.end method

.method private static shouldParseContainerAtom(I)Z
    .locals 1
    .param p0, "atom"    # I

    .prologue
    .line 1249
    sget v0, Lcom/google/android/exoplayer2/extractor/mp4/Atom;->TYPE_moov:I

    if-eq p0, v0, :cond_0

    sget v0, Lcom/google/android/exoplayer2/extractor/mp4/Atom;->TYPE_trak:I

    if-eq p0, v0, :cond_0

    sget v0, Lcom/google/android/exoplayer2/extractor/mp4/Atom;->TYPE_mdia:I

    if-eq p0, v0, :cond_0

    sget v0, Lcom/google/android/exoplayer2/extractor/mp4/Atom;->TYPE_minf:I

    if-eq p0, v0, :cond_0

    sget v0, Lcom/google/android/exoplayer2/extractor/mp4/Atom;->TYPE_stbl:I

    if-eq p0, v0, :cond_0

    sget v0, Lcom/google/android/exoplayer2/extractor/mp4/Atom;->TYPE_moof:I

    if-eq p0, v0, :cond_0

    sget v0, Lcom/google/android/exoplayer2/extractor/mp4/Atom;->TYPE_traf:I

    if-eq p0, v0, :cond_0

    sget v0, Lcom/google/android/exoplayer2/extractor/mp4/Atom;->TYPE_mvex:I

    if-eq p0, v0, :cond_0

    sget v0, Lcom/google/android/exoplayer2/extractor/mp4/Atom;->TYPE_edts:I

    if-ne p0, v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static shouldParseLeafAtom(I)Z
    .locals 1
    .param p0, "atom"    # I

    .prologue
    .line 1238
    sget v0, Lcom/google/android/exoplayer2/extractor/mp4/Atom;->TYPE_hdlr:I

    if-eq p0, v0, :cond_0

    sget v0, Lcom/google/android/exoplayer2/extractor/mp4/Atom;->TYPE_mdhd:I

    if-eq p0, v0, :cond_0

    sget v0, Lcom/google/android/exoplayer2/extractor/mp4/Atom;->TYPE_mvhd:I

    if-eq p0, v0, :cond_0

    sget v0, Lcom/google/android/exoplayer2/extractor/mp4/Atom;->TYPE_sidx:I

    if-eq p0, v0, :cond_0

    sget v0, Lcom/google/android/exoplayer2/extractor/mp4/Atom;->TYPE_stsd:I

    if-eq p0, v0, :cond_0

    sget v0, Lcom/google/android/exoplayer2/extractor/mp4/Atom;->TYPE_tfdt:I

    if-eq p0, v0, :cond_0

    sget v0, Lcom/google/android/exoplayer2/extractor/mp4/Atom;->TYPE_tfhd:I

    if-eq p0, v0, :cond_0

    sget v0, Lcom/google/android/exoplayer2/extractor/mp4/Atom;->TYPE_tkhd:I

    if-eq p0, v0, :cond_0

    sget v0, Lcom/google/android/exoplayer2/extractor/mp4/Atom;->TYPE_trex:I

    if-eq p0, v0, :cond_0

    sget v0, Lcom/google/android/exoplayer2/extractor/mp4/Atom;->TYPE_trun:I

    if-eq p0, v0, :cond_0

    sget v0, Lcom/google/android/exoplayer2/extractor/mp4/Atom;->TYPE_pssh:I

    if-eq p0, v0, :cond_0

    sget v0, Lcom/google/android/exoplayer2/extractor/mp4/Atom;->TYPE_saiz:I

    if-eq p0, v0, :cond_0

    sget v0, Lcom/google/android/exoplayer2/extractor/mp4/Atom;->TYPE_saio:I

    if-eq p0, v0, :cond_0

    sget v0, Lcom/google/android/exoplayer2/extractor/mp4/Atom;->TYPE_senc:I

    if-eq p0, v0, :cond_0

    sget v0, Lcom/google/android/exoplayer2/extractor/mp4/Atom;->TYPE_uuid:I

    if-eq p0, v0, :cond_0

    sget v0, Lcom/google/android/exoplayer2/extractor/mp4/Atom;->TYPE_sbgp:I

    if-eq p0, v0, :cond_0

    sget v0, Lcom/google/android/exoplayer2/extractor/mp4/Atom;->TYPE_sgpd:I

    if-eq p0, v0, :cond_0

    sget v0, Lcom/google/android/exoplayer2/extractor/mp4/Atom;->TYPE_elst:I

    if-eq p0, v0, :cond_0

    sget v0, Lcom/google/android/exoplayer2/extractor/mp4/Atom;->TYPE_mehd:I

    if-eq p0, v0, :cond_0

    sget v0, Lcom/google/android/exoplayer2/extractor/mp4/Atom;->TYPE_emsg:I

    if-ne p0, v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public init(Lcom/google/android/exoplayer2/extractor/ExtractorOutput;)V
    .locals 4
    .param p1, "output"    # Lcom/google/android/exoplayer2/extractor/ExtractorOutput;

    .prologue
    const/4 v3, 0x0

    .line 210
    iput-object p1, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->extractorOutput:Lcom/google/android/exoplayer2/extractor/ExtractorOutput;

    .line 211
    iget-object v1, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->sideloadedTrack:Lcom/google/android/exoplayer2/extractor/mp4/Track;

    if-eqz v1, :cond_0

    .line 212
    new-instance v0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;

    invoke-interface {p1, v3}, Lcom/google/android/exoplayer2/extractor/ExtractorOutput;->track(I)Lcom/google/android/exoplayer2/extractor/TrackOutput;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;-><init>(Lcom/google/android/exoplayer2/extractor/TrackOutput;)V

    .line 213
    .local v0, "bundle":Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;
    iget-object v1, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->sideloadedTrack:Lcom/google/android/exoplayer2/extractor/mp4/Track;

    new-instance v2, Lcom/google/android/exoplayer2/extractor/mp4/DefaultSampleValues;

    invoke-direct {v2, v3, v3, v3, v3}, Lcom/google/android/exoplayer2/extractor/mp4/DefaultSampleValues;-><init>(IIII)V

    invoke-virtual {v0, v1, v2}, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;->init(Lcom/google/android/exoplayer2/extractor/mp4/Track;Lcom/google/android/exoplayer2/extractor/mp4/DefaultSampleValues;)V

    .line 214
    iget-object v1, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->trackBundles:Landroid/util/SparseArray;

    invoke-virtual {v1, v3, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 215
    invoke-direct {p0}, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->maybeInitExtraTracks()V

    .line 216
    iget-object v1, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->extractorOutput:Lcom/google/android/exoplayer2/extractor/ExtractorOutput;

    invoke-interface {v1}, Lcom/google/android/exoplayer2/extractor/ExtractorOutput;->endTracks()V

    .line 218
    .end local v0    # "bundle":Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;
    :cond_0
    return-void
.end method

.method public read(Lcom/google/android/exoplayer2/extractor/ExtractorInput;Lcom/google/android/exoplayer2/extractor/PositionHolder;)I
    .locals 1
    .param p1, "input"    # Lcom/google/android/exoplayer2/extractor/ExtractorInput;
    .param p2, "seekPosition"    # Lcom/google/android/exoplayer2/extractor/PositionHolder;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 241
    :cond_0
    :goto_0
    iget v0, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->parserState:I

    packed-switch v0, :pswitch_data_0

    .line 254
    invoke-direct {p0, p1}, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->readSample(Lcom/google/android/exoplayer2/extractor/ExtractorInput;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 255
    const/4 v0, 0x0

    :goto_1
    return v0

    .line 243
    :pswitch_0
    invoke-direct {p0, p1}, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->readAtomHeader(Lcom/google/android/exoplayer2/extractor/ExtractorInput;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 244
    const/4 v0, -0x1

    goto :goto_1

    .line 248
    :pswitch_1
    invoke-direct {p0, p1}, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->readAtomPayload(Lcom/google/android/exoplayer2/extractor/ExtractorInput;)V

    goto :goto_0

    .line 251
    :pswitch_2
    invoke-direct {p0, p1}, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->readEncryptionData(Lcom/google/android/exoplayer2/extractor/ExtractorInput;)V

    goto :goto_0

    .line 241
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public release()V
    .locals 0

    .prologue
    .line 235
    return-void
.end method

.method public seek(JJ)V
    .locals 3
    .param p1, "position"    # J
    .param p3, "timeUs"    # J

    .prologue
    .line 222
    iget-object v2, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->trackBundles:Landroid/util/SparseArray;

    invoke-virtual {v2}, Landroid/util/SparseArray;->size()I

    move-result v1

    .line 223
    .local v1, "trackCount":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, v1, :cond_0

    .line 224
    iget-object v2, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->trackBundles:Landroid/util/SparseArray;

    invoke-virtual {v2, v0}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;

    invoke-virtual {v2}, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor$TrackBundle;->reset()V

    .line 223
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 226
    :cond_0
    iget-object v2, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->pendingMetadataSampleInfos:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->clear()V

    .line 227
    const/4 v2, 0x0

    iput v2, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->pendingMetadataSampleBytes:I

    .line 228
    iget-object v2, p0, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->containerAtoms:Ljava/util/Stack;

    invoke-virtual {v2}, Ljava/util/Stack;->clear()V

    .line 229
    invoke-direct {p0}, Lcom/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor;->enterReadingAtomHeaderState()V

    .line 230
    return-void
.end method

.method public sniff(Lcom/google/android/exoplayer2/extractor/ExtractorInput;)Z
    .locals 1
    .param p1, "input"    # Lcom/google/android/exoplayer2/extractor/ExtractorInput;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 205
    invoke-static {p1}, Lcom/google/android/exoplayer2/extractor/mp4/Sniffer;->sniffFragmented(Lcom/google/android/exoplayer2/extractor/ExtractorInput;)Z

    move-result v0

    return v0
.end method
