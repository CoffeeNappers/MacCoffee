.class public final Lcom/google/android/exoplayer2/extractor/ts/DefaultTsPayloadReaderFactory;
.super Ljava/lang/Object;
.source "DefaultTsPayloadReaderFactory.java"

# interfaces
.implements Lcom/google/android/exoplayer2/extractor/ts/TsPayloadReader$Factory;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/exoplayer2/extractor/ts/DefaultTsPayloadReaderFactory$Flags;
    }
.end annotation


# static fields
.field public static final FLAG_ALLOW_NON_IDR_KEYFRAMES:I = 0x1

.field public static final FLAG_DETECT_ACCESS_UNITS:I = 0x8

.field public static final FLAG_IGNORE_AAC_STREAM:I = 0x2

.field public static final FLAG_IGNORE_H264_STREAM:I = 0x4

.field public static final FLAG_IGNORE_SPLICE_INFO_STREAM:I = 0x10


# instance fields
.field private final flags:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 47
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/google/android/exoplayer2/extractor/ts/DefaultTsPayloadReaderFactory;-><init>(I)V

    .line 48
    return-void
.end method

.method public constructor <init>(I)V
    .locals 0
    .param p1, "flags"    # I

    .prologue
    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    iput p1, p0, Lcom/google/android/exoplayer2/extractor/ts/DefaultTsPayloadReaderFactory;->flags:I

    .line 52
    return-void
.end method

.method private isSet(I)Z
    .locals 1
    .param p1, "flag"    # I

    .prologue
    .line 92
    iget v0, p0, Lcom/google/android/exoplayer2/extractor/ts/DefaultTsPayloadReaderFactory;->flags:I

    and-int/2addr v0, p1

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public createInitialPayloadReaders()Landroid/util/SparseArray;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/util/SparseArray",
            "<",
            "Lcom/google/android/exoplayer2/extractor/ts/TsPayloadReader;",
            ">;"
        }
    .end annotation

    .prologue
    .line 56
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    return-object v0
.end method

.method public createPayloadReader(ILcom/google/android/exoplayer2/extractor/ts/TsPayloadReader$EsInfo;)Lcom/google/android/exoplayer2/extractor/ts/TsPayloadReader;
    .locals 4
    .param p1, "streamType"    # I
    .param p2, "esInfo"    # Lcom/google/android/exoplayer2/extractor/ts/TsPayloadReader$EsInfo;

    .prologue
    const/4 v0, 0x0

    .line 61
    sparse-switch p1, :sswitch_data_0

    .line 87
    :cond_0
    :goto_0
    return-object v0

    .line 64
    :sswitch_0
    new-instance v0, Lcom/google/android/exoplayer2/extractor/ts/PesReader;

    new-instance v1, Lcom/google/android/exoplayer2/extractor/ts/MpegAudioReader;

    iget-object v2, p2, Lcom/google/android/exoplayer2/extractor/ts/TsPayloadReader$EsInfo;->language:Ljava/lang/String;

    invoke-direct {v1, v2}, Lcom/google/android/exoplayer2/extractor/ts/MpegAudioReader;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v1}, Lcom/google/android/exoplayer2/extractor/ts/PesReader;-><init>(Lcom/google/android/exoplayer2/extractor/ts/ElementaryStreamReader;)V

    goto :goto_0

    .line 66
    :sswitch_1
    const/4 v1, 0x2

    invoke-direct {p0, v1}, Lcom/google/android/exoplayer2/extractor/ts/DefaultTsPayloadReaderFactory;->isSet(I)Z

    move-result v1

    if-nez v1, :cond_0

    new-instance v0, Lcom/google/android/exoplayer2/extractor/ts/PesReader;

    new-instance v1, Lcom/google/android/exoplayer2/extractor/ts/AdtsReader;

    const/4 v2, 0x0

    iget-object v3, p2, Lcom/google/android/exoplayer2/extractor/ts/TsPayloadReader$EsInfo;->language:Ljava/lang/String;

    invoke-direct {v1, v2, v3}, Lcom/google/android/exoplayer2/extractor/ts/AdtsReader;-><init>(ZLjava/lang/String;)V

    invoke-direct {v0, v1}, Lcom/google/android/exoplayer2/extractor/ts/PesReader;-><init>(Lcom/google/android/exoplayer2/extractor/ts/ElementaryStreamReader;)V

    goto :goto_0

    .line 70
    :sswitch_2
    new-instance v0, Lcom/google/android/exoplayer2/extractor/ts/PesReader;

    new-instance v1, Lcom/google/android/exoplayer2/extractor/ts/Ac3Reader;

    iget-object v2, p2, Lcom/google/android/exoplayer2/extractor/ts/TsPayloadReader$EsInfo;->language:Ljava/lang/String;

    invoke-direct {v1, v2}, Lcom/google/android/exoplayer2/extractor/ts/Ac3Reader;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v1}, Lcom/google/android/exoplayer2/extractor/ts/PesReader;-><init>(Lcom/google/android/exoplayer2/extractor/ts/ElementaryStreamReader;)V

    goto :goto_0

    .line 73
    :sswitch_3
    new-instance v0, Lcom/google/android/exoplayer2/extractor/ts/PesReader;

    new-instance v1, Lcom/google/android/exoplayer2/extractor/ts/DtsReader;

    iget-object v2, p2, Lcom/google/android/exoplayer2/extractor/ts/TsPayloadReader$EsInfo;->language:Ljava/lang/String;

    invoke-direct {v1, v2}, Lcom/google/android/exoplayer2/extractor/ts/DtsReader;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v1}, Lcom/google/android/exoplayer2/extractor/ts/PesReader;-><init>(Lcom/google/android/exoplayer2/extractor/ts/ElementaryStreamReader;)V

    goto :goto_0

    .line 75
    :sswitch_4
    new-instance v0, Lcom/google/android/exoplayer2/extractor/ts/PesReader;

    new-instance v1, Lcom/google/android/exoplayer2/extractor/ts/H262Reader;

    invoke-direct {v1}, Lcom/google/android/exoplayer2/extractor/ts/H262Reader;-><init>()V

    invoke-direct {v0, v1}, Lcom/google/android/exoplayer2/extractor/ts/PesReader;-><init>(Lcom/google/android/exoplayer2/extractor/ts/ElementaryStreamReader;)V

    goto :goto_0

    .line 77
    :sswitch_5
    const/4 v1, 0x4

    invoke-direct {p0, v1}, Lcom/google/android/exoplayer2/extractor/ts/DefaultTsPayloadReaderFactory;->isSet(I)Z

    move-result v1

    if-nez v1, :cond_0

    new-instance v0, Lcom/google/android/exoplayer2/extractor/ts/PesReader;

    new-instance v1, Lcom/google/android/exoplayer2/extractor/ts/H264Reader;

    const/4 v2, 0x1

    .line 78
    invoke-direct {p0, v2}, Lcom/google/android/exoplayer2/extractor/ts/DefaultTsPayloadReaderFactory;->isSet(I)Z

    move-result v2

    const/16 v3, 0x8

    invoke-direct {p0, v3}, Lcom/google/android/exoplayer2/extractor/ts/DefaultTsPayloadReaderFactory;->isSet(I)Z

    move-result v3

    invoke-direct {v1, v2, v3}, Lcom/google/android/exoplayer2/extractor/ts/H264Reader;-><init>(ZZ)V

    invoke-direct {v0, v1}, Lcom/google/android/exoplayer2/extractor/ts/PesReader;-><init>(Lcom/google/android/exoplayer2/extractor/ts/ElementaryStreamReader;)V

    goto :goto_0

    .line 80
    :sswitch_6
    new-instance v0, Lcom/google/android/exoplayer2/extractor/ts/PesReader;

    new-instance v1, Lcom/google/android/exoplayer2/extractor/ts/H265Reader;

    invoke-direct {v1}, Lcom/google/android/exoplayer2/extractor/ts/H265Reader;-><init>()V

    invoke-direct {v0, v1}, Lcom/google/android/exoplayer2/extractor/ts/PesReader;-><init>(Lcom/google/android/exoplayer2/extractor/ts/ElementaryStreamReader;)V

    goto :goto_0

    .line 82
    :sswitch_7
    const/16 v1, 0x10

    invoke-direct {p0, v1}, Lcom/google/android/exoplayer2/extractor/ts/DefaultTsPayloadReaderFactory;->isSet(I)Z

    move-result v1

    if-nez v1, :cond_0

    new-instance v0, Lcom/google/android/exoplayer2/extractor/ts/SectionReader;

    new-instance v1, Lcom/google/android/exoplayer2/extractor/ts/SpliceInfoSectionReader;

    invoke-direct {v1}, Lcom/google/android/exoplayer2/extractor/ts/SpliceInfoSectionReader;-><init>()V

    invoke-direct {v0, v1}, Lcom/google/android/exoplayer2/extractor/ts/SectionReader;-><init>(Lcom/google/android/exoplayer2/extractor/ts/SectionPayloadReader;)V

    goto/16 :goto_0

    .line 85
    :sswitch_8
    new-instance v0, Lcom/google/android/exoplayer2/extractor/ts/PesReader;

    new-instance v1, Lcom/google/android/exoplayer2/extractor/ts/Id3Reader;

    invoke-direct {v1}, Lcom/google/android/exoplayer2/extractor/ts/Id3Reader;-><init>()V

    invoke-direct {v0, v1}, Lcom/google/android/exoplayer2/extractor/ts/PesReader;-><init>(Lcom/google/android/exoplayer2/extractor/ts/ElementaryStreamReader;)V

    goto/16 :goto_0

    .line 61
    :sswitch_data_0
    .sparse-switch
        0x2 -> :sswitch_4
        0x3 -> :sswitch_0
        0x4 -> :sswitch_0
        0xf -> :sswitch_1
        0x15 -> :sswitch_8
        0x1b -> :sswitch_5
        0x24 -> :sswitch_6
        0x81 -> :sswitch_2
        0x82 -> :sswitch_3
        0x86 -> :sswitch_7
        0x87 -> :sswitch_2
        0x8a -> :sswitch_3
    .end sparse-switch
.end method
