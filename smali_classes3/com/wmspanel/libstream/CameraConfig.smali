.class public Lcom/wmspanel/libstream/CameraConfig;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public cameraId:Ljava/lang/String;

.field public fpsRange:Lcom/wmspanel/libstream/Streamer$FpsRange;

.field public videoSize:Lcom/wmspanel/libstream/Streamer$Size;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 9
    iput-object v0, p0, Lcom/wmspanel/libstream/CameraConfig;->cameraId:Ljava/lang/String;

    .line 10
    iput-object v0, p0, Lcom/wmspanel/libstream/CameraConfig;->fpsRange:Lcom/wmspanel/libstream/Streamer$FpsRange;

    .line 11
    iput-object v0, p0, Lcom/wmspanel/libstream/CameraConfig;->videoSize:Lcom/wmspanel/libstream/Streamer$Size;

    .line 12
    return-void
.end method
