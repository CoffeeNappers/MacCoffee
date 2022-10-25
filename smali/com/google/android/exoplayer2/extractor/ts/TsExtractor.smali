.class public final Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;
.super Ljava/lang/Object;
.source "TsExtractor.java"

# interfaces
.implements Lcom/google/android/exoplayer2/extractor/Extractor;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/exoplayer2/extractor/ts/TsExtractor$PmtReader;,
        Lcom/google/android/exoplayer2/extractor/ts/TsExtractor$PatReader;
    }
.end annotation


# static fields
.field private static final AC3_FORMAT_IDENTIFIER:J

.field private static final BUFFER_PACKET_COUNT:I = 0x5

.field private static final BUFFER_SIZE:I = 0x3ac

.field private static final E_AC3_FORMAT_IDENTIFIER:J

.field public static final FACTORY:Lcom/google/android/exoplayer2/extractor/ExtractorsFactory;

.field private static final HEVC_FORMAT_IDENTIFIER:J

.field private static final MAX_PID_PLUS_ONE:I = 0x2000

.field private static final TS_PACKET_SIZE:I = 0xbc

.field private static final TS_PAT_PID:I = 0x0

.field public static final TS_STREAM_TYPE_AAC:I = 0xf

.field public static final TS_STREAM_TYPE_AC3:I = 0x81

.field public static final TS_STREAM_TYPE_DTS:I = 0x8a

.field public static final TS_STREAM_TYPE_E_AC3:I = 0x87

.field public static final TS_STREAM_TYPE_H262:I = 0x2

.field public static final TS_STREAM_TYPE_H264:I = 0x1b

.field public static final TS_STREAM_TYPE_H265:I = 0x24

.field public static final TS_STREAM_TYPE_HDMV_DTS:I = 0x82

.field public static final TS_STREAM_TYPE_ID3:I = 0x15

.field public static final TS_STREAM_TYPE_MPA:I = 0x3

.field public static final TS_STREAM_TYPE_MPA_LSF:I = 0x4

.field public static final TS_STREAM_TYPE_SPLICE_INFO:I = 0x86

.field private static final TS_SYNC_BYTE:I = 0x47


# instance fields
.field private final continuityCounters:Landroid/util/SparseIntArray;

.field private final hlsMode:Z

.field private id3Reader:Lcom/google/android/exoplayer2/extractor/ts/TsPayloadReader;

.field private output:Lcom/google/android/exoplayer2/extractor/ExtractorOutput;

.field private final payloadReaderFactory:Lcom/google/android/exoplayer2/extractor/ts/TsPayloadReader$Factory;

.field private final timestampAdjuster:Lcom/google/android/exoplayer2/util/TimestampAdjuster;

.field private final trackIds:Landroid/util/SparseBooleanArray;

.field private tracksEnded:Z

.field private final tsPacketBuffer:Lcom/google/android/exoplayer2/util/ParsableByteArray;

.field private final tsPayloadReaders:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Lcom/google/android/exoplayer2/extractor/ts/TsPayloadReader;",
            ">;"
        }
    .end annotation
.end field

.field private final tsScratch:Lcom/google/android/exoplayer2/util/ParsableBitArray;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 47
    new-instance v0, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor$1;

    invoke-direct {v0}, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor$1;-><init>()V

    sput-object v0, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;->FACTORY:Lcom/google/android/exoplayer2/extractor/ExtractorsFactory;

    .line 74
    const-string/jumbo v0, "AC-3"

    invoke-static {v0}, Lcom/google/android/exoplayer2/util/Util;->getIntegerCodeForString(Ljava/lang/String;)I

    move-result v0

    int-to-long v0, v0

    sput-wide v0, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;->AC3_FORMAT_IDENTIFIER:J

    .line 75
    const-string/jumbo v0, "EAC3"

    invoke-static {v0}, Lcom/google/android/exoplayer2/util/Util;->getIntegerCodeForString(Ljava/lang/String;)I

    move-result v0

    int-to-long v0, v0

    sput-wide v0, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;->E_AC3_FORMAT_IDENTIFIER:J

    .line 76
    const-string/jumbo v0, "HEVC"

    invoke-static {v0}, Lcom/google/android/exoplayer2/util/Util;->getIntegerCodeForString(Ljava/lang/String;)I

    move-result v0

    int-to-long v0, v0

    sput-wide v0, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;->HEVC_FORMAT_IDENTIFIER:J

    return-void
.end method

.method public constructor <init>()V
    .locals 4

    .prologue
    .line 96
    new-instance v0, Lcom/google/android/exoplayer2/util/TimestampAdjuster;

    const-wide/16 v2, 0x0

    invoke-direct {v0, v2, v3}, Lcom/google/android/exoplayer2/util/TimestampAdjuster;-><init>(J)V

    invoke-direct {p0, v0}, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;-><init>(Lcom/google/android/exoplayer2/util/TimestampAdjuster;)V

    .line 97
    return-void
.end method

.method public constructor <init>(Lcom/google/android/exoplayer2/util/TimestampAdjuster;)V
    .locals 2
    .param p1, "timestampAdjuster"    # Lcom/google/android/exoplayer2/util/TimestampAdjuster;

    .prologue
    .line 103
    new-instance v0, Lcom/google/android/exoplayer2/extractor/ts/DefaultTsPayloadReaderFactory;

    invoke-direct {v0}, Lcom/google/android/exoplayer2/extractor/ts/DefaultTsPayloadReaderFactory;-><init>()V

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;-><init>(Lcom/google/android/exoplayer2/util/TimestampAdjuster;Lcom/google/android/exoplayer2/extractor/ts/TsPayloadReader$Factory;Z)V

    .line 104
    return-void
.end method

.method public constructor <init>(Lcom/google/android/exoplayer2/util/TimestampAdjuster;Lcom/google/android/exoplayer2/extractor/ts/TsPayloadReader$Factory;Z)V
    .locals 2
    .param p1, "timestampAdjuster"    # Lcom/google/android/exoplayer2/util/TimestampAdjuster;
    .param p2, "payloadReaderFactory"    # Lcom/google/android/exoplayer2/extractor/ts/TsPayloadReader$Factory;
    .param p3, "hlsMode"    # Z

    .prologue
    .line 113
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 114
    iput-object p1, p0, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;->timestampAdjuster:Lcom/google/android/exoplayer2/util/TimestampAdjuster;

    .line 115
    invoke-static {p2}, Lcom/google/android/exoplayer2/util/Assertions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/exoplayer2/extractor/ts/TsPayloadReader$Factory;

    iput-object v0, p0, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;->payloadReaderFactory:Lcom/google/android/exoplayer2/extractor/ts/TsPayloadReader$Factory;

    .line 116
    iput-boolean p3, p0, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;->hlsMode:Z

    .line 117
    new-instance v0, Lcom/google/android/exoplayer2/util/ParsableByteArray;

    const/16 v1, 0x3ac

    invoke-direct {v0, v1}, Lcom/google/android/exoplayer2/util/ParsableByteArray;-><init>(I)V

    iput-object v0, p0, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;->tsPacketBuffer:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    .line 118
    new-instance v0, Lcom/google/android/exoplayer2/util/ParsableBitArray;

    const/4 v1, 0x3

    new-array v1, v1, [B

    invoke-direct {v0, v1}, Lcom/google/android/exoplayer2/util/ParsableBitArray;-><init>([B)V

    iput-object v0, p0, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;->tsScratch:Lcom/google/android/exoplayer2/util/ParsableBitArray;

    .line 119
    new-instance v0, Landroid/util/SparseBooleanArray;

    invoke-direct {v0}, Landroid/util/SparseBooleanArray;-><init>()V

    iput-object v0, p0, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;->trackIds:Landroid/util/SparseBooleanArray;

    .line 120
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;->tsPayloadReaders:Landroid/util/SparseArray;

    .line 121
    new-instance v0, Landroid/util/SparseIntArray;

    invoke-direct {v0}, Landroid/util/SparseIntArray;-><init>()V

    iput-object v0, p0, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;->continuityCounters:Landroid/util/SparseIntArray;

    .line 122
    invoke-direct {p0}, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;->resetPayloadReaders()V

    .line 123
    return-void
.end method

.method static synthetic access$000(Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;)Landroid/util/SparseArray;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;

    .prologue
    .line 42
    iget-object v0, p0, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;->tsPayloadReaders:Landroid/util/SparseArray;

    return-object v0
.end method

.method static synthetic access$100(Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;)Z
    .locals 1
    .param p0, "x0"    # Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;

    .prologue
    .line 42
    iget-boolean v0, p0, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;->hlsMode:Z

    return v0
.end method

.method static synthetic access$1000()J
    .locals 2

    .prologue
    .line 42
    sget-wide v0, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;->HEVC_FORMAT_IDENTIFIER:J

    return-wide v0
.end method

.method static synthetic access$200(Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;)Lcom/google/android/exoplayer2/extractor/ts/TsPayloadReader;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;

    .prologue
    .line 42
    iget-object v0, p0, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;->id3Reader:Lcom/google/android/exoplayer2/extractor/ts/TsPayloadReader;

    return-object v0
.end method

.method static synthetic access$202(Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;Lcom/google/android/exoplayer2/extractor/ts/TsPayloadReader;)Lcom/google/android/exoplayer2/extractor/ts/TsPayloadReader;
    .locals 0
    .param p0, "x0"    # Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;
    .param p1, "x1"    # Lcom/google/android/exoplayer2/extractor/ts/TsPayloadReader;

    .prologue
    .line 42
    iput-object p1, p0, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;->id3Reader:Lcom/google/android/exoplayer2/extractor/ts/TsPayloadReader;

    return-object p1
.end method

.method static synthetic access$300(Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;)Lcom/google/android/exoplayer2/extractor/ts/TsPayloadReader$Factory;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;

    .prologue
    .line 42
    iget-object v0, p0, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;->payloadReaderFactory:Lcom/google/android/exoplayer2/extractor/ts/TsPayloadReader$Factory;

    return-object v0
.end method

.method static synthetic access$400(Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;)Lcom/google/android/exoplayer2/util/TimestampAdjuster;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;

    .prologue
    .line 42
    iget-object v0, p0, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;->timestampAdjuster:Lcom/google/android/exoplayer2/util/TimestampAdjuster;

    return-object v0
.end method

.method static synthetic access$500(Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;)Lcom/google/android/exoplayer2/extractor/ExtractorOutput;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;

    .prologue
    .line 42
    iget-object v0, p0, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;->output:Lcom/google/android/exoplayer2/extractor/ExtractorOutput;

    return-object v0
.end method

.method static synthetic access$600(Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;)Landroid/util/SparseBooleanArray;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;

    .prologue
    .line 42
    iget-object v0, p0, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;->trackIds:Landroid/util/SparseBooleanArray;

    return-object v0
.end method

.method static synthetic access$700(Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;)Z
    .locals 1
    .param p0, "x0"    # Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;

    .prologue
    .line 42
    iget-boolean v0, p0, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;->tracksEnded:Z

    return v0
.end method

.method static synthetic access$702(Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;
    .param p1, "x1"    # Z

    .prologue
    .line 42
    iput-boolean p1, p0, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;->tracksEnded:Z

    return p1
.end method

.method static synthetic access$800()J
    .locals 2

    .prologue
    .line 42
    sget-wide v0, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;->AC3_FORMAT_IDENTIFIER:J

    return-wide v0
.end method

.method static synthetic access$900()J
    .locals 2

    .prologue
    .line 42
    sget-wide v0, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;->E_AC3_FORMAT_IDENTIFIER:J

    return-wide v0
.end method

.method private resetPayloadReaders()V
    .locals 7

    .prologue
    .line 259
    iget-object v3, p0, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;->trackIds:Landroid/util/SparseBooleanArray;

    invoke-virtual {v3}, Landroid/util/SparseBooleanArray;->clear()V

    .line 260
    iget-object v3, p0, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;->tsPayloadReaders:Landroid/util/SparseArray;

    invoke-virtual {v3}, Landroid/util/SparseArray;->clear()V

    .line 261
    iget-object v3, p0, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;->payloadReaderFactory:Lcom/google/android/exoplayer2/extractor/ts/TsPayloadReader$Factory;

    .line 262
    invoke-interface {v3}, Lcom/google/android/exoplayer2/extractor/ts/TsPayloadReader$Factory;->createInitialPayloadReaders()Landroid/util/SparseArray;

    move-result-object v1

    .line 263
    .local v1, "initialPayloadReaders":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Lcom/google/android/exoplayer2/extractor/ts/TsPayloadReader;>;"
    invoke-virtual {v1}, Landroid/util/SparseArray;->size()I

    move-result v2

    .line 264
    .local v2, "initialPayloadReadersSize":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, v2, :cond_0

    .line 265
    iget-object v3, p0, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;->tsPayloadReaders:Landroid/util/SparseArray;

    invoke-virtual {v1, v0}, Landroid/util/SparseArray;->keyAt(I)I

    move-result v4

    invoke-virtual {v1, v0}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 264
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 267
    :cond_0
    iget-object v3, p0, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;->tsPayloadReaders:Landroid/util/SparseArray;

    const/4 v4, 0x0

    new-instance v5, Lcom/google/android/exoplayer2/extractor/ts/SectionReader;

    new-instance v6, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor$PatReader;

    invoke-direct {v6, p0}, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor$PatReader;-><init>(Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;)V

    invoke-direct {v5, v6}, Lcom/google/android/exoplayer2/extractor/ts/SectionReader;-><init>(Lcom/google/android/exoplayer2/extractor/ts/SectionPayloadReader;)V

    invoke-virtual {v3, v4, v5}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 268
    const/4 v3, 0x0

    iput-object v3, p0, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;->id3Reader:Lcom/google/android/exoplayer2/extractor/ts/TsPayloadReader;

    .line 269
    return-void
.end method


# virtual methods
.method public init(Lcom/google/android/exoplayer2/extractor/ExtractorOutput;)V
    .locals 4
    .param p1, "output"    # Lcom/google/android/exoplayer2/extractor/ExtractorOutput;

    .prologue
    .line 147
    iput-object p1, p0, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;->output:Lcom/google/android/exoplayer2/extractor/ExtractorOutput;

    .line 148
    new-instance v0, Lcom/google/android/exoplayer2/extractor/SeekMap$Unseekable;

    const-wide v2, -0x7fffffffffffffffL    # -4.9E-324

    invoke-direct {v0, v2, v3}, Lcom/google/android/exoplayer2/extractor/SeekMap$Unseekable;-><init>(J)V

    invoke-interface {p1, v0}, Lcom/google/android/exoplayer2/extractor/ExtractorOutput;->seekMap(Lcom/google/android/exoplayer2/extractor/SeekMap;)V

    .line 149
    return-void
.end method

.method public read(Lcom/google/android/exoplayer2/extractor/ExtractorInput;Lcom/google/android/exoplayer2/extractor/PositionHolder;)I
    .locals 20
    .param p1, "input"    # Lcom/google/android/exoplayer2/extractor/ExtractorInput;
    .param p2, "seekPosition"    # Lcom/google/android/exoplayer2/extractor/PositionHolder;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 168
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;->tsPacketBuffer:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v6, v0, Lcom/google/android/exoplayer2/util/ParsableByteArray;->data:[B

    .line 170
    .local v6, "data":[B
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;->tsPacketBuffer:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->getPosition()I

    move-result v17

    move/from16 v0, v17

    rsub-int v0, v0, 0x3ac

    move/from16 v17, v0

    const/16 v18, 0xbc

    move/from16 v0, v17

    move/from16 v1, v18

    if-ge v0, v1, :cond_1

    .line 171
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;->tsPacketBuffer:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->bytesLeft()I

    move-result v4

    .line 172
    .local v4, "bytesLeft":I
    if-lez v4, :cond_0

    .line 173
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;->tsPacketBuffer:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->getPosition()I

    move-result v17

    const/16 v18, 0x0

    move/from16 v0, v17

    move/from16 v1, v18

    invoke-static {v6, v0, v6, v1, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 175
    :cond_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;->tsPacketBuffer:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v0, v6, v4}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->reset([BI)V

    .line 178
    .end local v4    # "bytesLeft":I
    :cond_1
    :goto_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;->tsPacketBuffer:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->bytesLeft()I

    move-result v17

    const/16 v18, 0xbc

    move/from16 v0, v17

    move/from16 v1, v18

    if-ge v0, v1, :cond_3

    .line 179
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;->tsPacketBuffer:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->limit()I

    move-result v9

    .line 180
    .local v9, "limit":I
    rsub-int v0, v9, 0x3ac

    move/from16 v17, v0

    move-object/from16 v0, p1

    move/from16 v1, v17

    invoke-interface {v0, v6, v9, v1}, Lcom/google/android/exoplayer2/extractor/ExtractorInput;->read([BII)I

    move-result v16

    .line 181
    .local v16, "read":I
    const/16 v17, -0x1

    move/from16 v0, v16

    move/from16 v1, v17

    if-ne v0, v1, :cond_2

    .line 182
    const/16 v17, -0x1

    .line 253
    .end local v16    # "read":I
    :goto_1
    return v17

    .line 184
    .restart local v16    # "read":I
    :cond_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;->tsPacketBuffer:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    move-object/from16 v17, v0

    add-int v18, v9, v16

    invoke-virtual/range {v17 .. v18}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->setLimit(I)V

    goto :goto_0

    .line 189
    .end local v9    # "limit":I
    .end local v16    # "read":I
    :cond_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;->tsPacketBuffer:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->limit()I

    move-result v9

    .line 190
    .restart local v9    # "limit":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;->tsPacketBuffer:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->getPosition()I

    move-result v14

    .line 191
    .local v14, "position":I
    :goto_2
    if-ge v14, v9, :cond_4

    aget-byte v17, v6, v14

    const/16 v18, 0x47

    move/from16 v0, v17

    move/from16 v1, v18

    if-eq v0, v1, :cond_4

    .line 192
    add-int/lit8 v14, v14, 0x1

    goto :goto_2

    .line 194
    :cond_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;->tsPacketBuffer:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v0, v14}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->setPosition(I)V

    .line 196
    add-int/lit16 v8, v14, 0xbc

    .line 197
    .local v8, "endOfPacket":I
    if-le v8, v9, :cond_5

    .line 198
    const/16 v17, 0x0

    goto :goto_1

    .line 201
    :cond_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;->tsPacketBuffer:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    move-object/from16 v17, v0

    const/16 v18, 0x1

    invoke-virtual/range {v17 .. v18}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->skipBytes(I)V

    .line 202
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;->tsPacketBuffer:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;->tsScratch:Lcom/google/android/exoplayer2/util/ParsableBitArray;

    move-object/from16 v18, v0

    const/16 v19, 0x3

    invoke-virtual/range {v17 .. v19}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readBytes(Lcom/google/android/exoplayer2/util/ParsableBitArray;I)V

    .line 203
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;->tsScratch:Lcom/google/android/exoplayer2/util/ParsableBitArray;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lcom/google/android/exoplayer2/util/ParsableBitArray;->readBit()Z

    move-result v17

    if-eqz v17, :cond_6

    .line 205
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;->tsPacketBuffer:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v0, v8}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->setPosition(I)V

    .line 206
    const/16 v17, 0x0

    goto :goto_1

    .line 208
    :cond_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;->tsScratch:Lcom/google/android/exoplayer2/util/ParsableBitArray;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lcom/google/android/exoplayer2/util/ParsableBitArray;->readBit()Z

    move-result v12

    .line 209
    .local v12, "payloadUnitStartIndicator":Z
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;->tsScratch:Lcom/google/android/exoplayer2/util/ParsableBitArray;

    move-object/from16 v17, v0

    const/16 v18, 0x1

    invoke-virtual/range {v17 .. v18}, Lcom/google/android/exoplayer2/util/ParsableBitArray;->skipBits(I)V

    .line 210
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;->tsScratch:Lcom/google/android/exoplayer2/util/ParsableBitArray;

    move-object/from16 v17, v0

    const/16 v18, 0xd

    invoke-virtual/range {v17 .. v18}, Lcom/google/android/exoplayer2/util/ParsableBitArray;->readBits(I)I

    move-result v13

    .line 211
    .local v13, "pid":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;->tsScratch:Lcom/google/android/exoplayer2/util/ParsableBitArray;

    move-object/from16 v17, v0

    const/16 v18, 0x2

    invoke-virtual/range {v17 .. v18}, Lcom/google/android/exoplayer2/util/ParsableBitArray;->skipBits(I)V

    .line 212
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;->tsScratch:Lcom/google/android/exoplayer2/util/ParsableBitArray;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lcom/google/android/exoplayer2/util/ParsableBitArray;->readBit()Z

    move-result v2

    .line 213
    .local v2, "adaptationFieldExists":Z
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;->tsScratch:Lcom/google/android/exoplayer2/util/ParsableBitArray;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lcom/google/android/exoplayer2/util/ParsableBitArray;->readBit()Z

    move-result v10

    .line 216
    .local v10, "payloadExists":Z
    const/4 v7, 0x0

    .line 217
    .local v7, "discontinuityFound":Z
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;->tsScratch:Lcom/google/android/exoplayer2/util/ParsableBitArray;

    move-object/from16 v17, v0

    const/16 v18, 0x4

    invoke-virtual/range {v17 .. v18}, Lcom/google/android/exoplayer2/util/ParsableBitArray;->readBits(I)I

    move-result v5

    .line 218
    .local v5, "continuityCounter":I
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;->hlsMode:Z

    move/from16 v17, v0

    if-nez v17, :cond_8

    .line 219
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;->continuityCounters:Landroid/util/SparseIntArray;

    move-object/from16 v17, v0

    add-int/lit8 v18, v5, -0x1

    move-object/from16 v0, v17

    move/from16 v1, v18

    invoke-virtual {v0, v13, v1}, Landroid/util/SparseIntArray;->get(II)I

    move-result v15

    .line 220
    .local v15, "previousCounter":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;->continuityCounters:Landroid/util/SparseIntArray;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v0, v13, v5}, Landroid/util/SparseIntArray;->put(II)V

    .line 221
    if-ne v15, v5, :cond_7

    .line 222
    if-eqz v10, :cond_8

    .line 224
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;->tsPacketBuffer:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v0, v8}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->setPosition(I)V

    .line 225
    const/16 v17, 0x0

    goto/16 :goto_1

    .line 227
    :cond_7
    add-int/lit8 v17, v15, 0x1

    rem-int/lit8 v17, v17, 0x10

    move/from16 v0, v17

    if-eq v5, v0, :cond_8

    .line 228
    const/4 v7, 0x1

    .line 233
    .end local v15    # "previousCounter":I
    :cond_8
    if-eqz v2, :cond_9

    .line 234
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;->tsPacketBuffer:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->readUnsignedByte()I

    move-result v3

    .line 235
    .local v3, "adaptationFieldLength":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;->tsPacketBuffer:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v0, v3}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->skipBytes(I)V

    .line 239
    .end local v3    # "adaptationFieldLength":I
    :cond_9
    if-eqz v10, :cond_b

    .line 240
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;->tsPayloadReaders:Landroid/util/SparseArray;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v0, v13}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/google/android/exoplayer2/extractor/ts/TsPayloadReader;

    .line 241
    .local v11, "payloadReader":Lcom/google/android/exoplayer2/extractor/ts/TsPayloadReader;
    if-eqz v11, :cond_b

    .line 242
    if-eqz v7, :cond_a

    .line 243
    invoke-interface {v11}, Lcom/google/android/exoplayer2/extractor/ts/TsPayloadReader;->seek()V

    .line 245
    :cond_a
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;->tsPacketBuffer:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v0, v8}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->setLimit(I)V

    .line 246
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;->tsPacketBuffer:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-interface {v11, v0, v12}, Lcom/google/android/exoplayer2/extractor/ts/TsPayloadReader;->consume(Lcom/google/android/exoplayer2/util/ParsableByteArray;Z)V

    .line 247
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;->tsPacketBuffer:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->getPosition()I

    move-result v17

    move/from16 v0, v17

    if-gt v0, v8, :cond_c

    const/16 v17, 0x1

    :goto_3
    invoke-static/range {v17 .. v17}, Lcom/google/android/exoplayer2/util/Assertions;->checkState(Z)V

    .line 248
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;->tsPacketBuffer:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v0, v9}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->setLimit(I)V

    .line 252
    .end local v11    # "payloadReader":Lcom/google/android/exoplayer2/extractor/ts/TsPayloadReader;
    :cond_b
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;->tsPacketBuffer:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v0, v8}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->setPosition(I)V

    .line 253
    const/16 v17, 0x0

    goto/16 :goto_1

    .line 247
    .restart local v11    # "payloadReader":Lcom/google/android/exoplayer2/extractor/ts/TsPayloadReader;
    :cond_c
    const/16 v17, 0x0

    goto :goto_3
.end method

.method public release()V
    .locals 0

    .prologue
    .line 163
    return-void
.end method

.method public seek(JJ)V
    .locals 1
    .param p1, "position"    # J
    .param p3, "timeUs"    # J

    .prologue
    .line 153
    iget-object v0, p0, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;->timestampAdjuster:Lcom/google/android/exoplayer2/util/TimestampAdjuster;

    invoke-virtual {v0}, Lcom/google/android/exoplayer2/util/TimestampAdjuster;->reset()V

    .line 154
    iget-object v0, p0, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;->tsPacketBuffer:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    invoke-virtual {v0}, Lcom/google/android/exoplayer2/util/ParsableByteArray;->reset()V

    .line 155
    iget-object v0, p0, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;->continuityCounters:Landroid/util/SparseIntArray;

    invoke-virtual {v0}, Landroid/util/SparseIntArray;->clear()V

    .line 157
    invoke-direct {p0}, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;->resetPayloadReaders()V

    .line 158
    return-void
.end method

.method public sniff(Lcom/google/android/exoplayer2/extractor/ExtractorInput;)Z
    .locals 6
    .param p1, "input"    # Lcom/google/android/exoplayer2/extractor/ExtractorInput;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 129
    iget-object v4, p0, Lcom/google/android/exoplayer2/extractor/ts/TsExtractor;->tsPacketBuffer:Lcom/google/android/exoplayer2/util/ParsableByteArray;

    iget-object v0, v4, Lcom/google/android/exoplayer2/util/ParsableByteArray;->data:[B

    .line 130
    .local v0, "buffer":[B
    const/16 v4, 0x3ac

    invoke-interface {p1, v0, v3, v4}, Lcom/google/android/exoplayer2/extractor/ExtractorInput;->peekFully([BII)V

    .line 131
    const/4 v2, 0x0

    .local v2, "j":I
    :goto_0
    const/16 v4, 0xbc

    if-ge v2, v4, :cond_0

    .line 132
    const/4 v1, 0x0

    .line 133
    .local v1, "i":I
    :goto_1
    const/4 v4, 0x5

    if-ne v1, v4, :cond_1

    .line 134
    invoke-interface {p1, v2}, Lcom/google/android/exoplayer2/extractor/ExtractorInput;->skipFully(I)V

    .line 135
    const/4 v3, 0x1

    .line 142
    .end local v1    # "i":I
    :cond_0
    return v3

    .line 137
    .restart local v1    # "i":I
    :cond_1
    mul-int/lit16 v4, v1, 0xbc

    add-int/2addr v4, v2

    aget-byte v4, v0, v4

    const/16 v5, 0x47

    if-eq v4, v5, :cond_2

    .line 131
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 132
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1
.end method
