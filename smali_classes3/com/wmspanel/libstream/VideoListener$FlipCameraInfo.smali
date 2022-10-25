.class public Lcom/wmspanel/libstream/VideoListener$FlipCameraInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/wmspanel/libstream/VideoListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xc
    name = "FlipCameraInfo"
.end annotation


# instance fields
.field public cameraId:Ljava/lang/String;

.field public fpsRange:Lcom/wmspanel/libstream/Streamer$FpsRange;

.field public scale:F

.field public scale_horizon:F

.field public scale_landscape_letterbox:F

.field public scale_landscape_pillarbox:F

.field public scale_letterbox:F

.field public videoSize:Lcom/wmspanel/libstream/Streamer$Size;


# direct methods
.method protected constructor <init>()V
    .locals 0

    .prologue
    .line 291
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
