.class public Lcom/wmspanel/libstream/VideoConfig;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public bitRate:I

.field public fps:F

.field public keyFrameInterval:I

.field public profileLevel:Landroid/media/MediaCodecInfo$CodecProfileLevel;

.field public videoSize:Lcom/wmspanel/libstream/Streamer$Size;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    const v0, 0x1e8480

    iput v0, p0, Lcom/wmspanel/libstream/VideoConfig;->bitRate:I

    .line 14
    const/high16 v0, 0x41f00000    # 30.0f

    iput v0, p0, Lcom/wmspanel/libstream/VideoConfig;->fps:F

    .line 15
    const/4 v0, 0x2

    iput v0, p0, Lcom/wmspanel/libstream/VideoConfig;->keyFrameInterval:I

    .line 16
    iput-object v1, p0, Lcom/wmspanel/libstream/VideoConfig;->videoSize:Lcom/wmspanel/libstream/Streamer$Size;

    .line 17
    iput-object v1, p0, Lcom/wmspanel/libstream/VideoConfig;->profileLevel:Landroid/media/MediaCodecInfo$CodecProfileLevel;

    .line 18
    return-void
.end method
