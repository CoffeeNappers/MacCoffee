.class Lcom/vk/media/camera/CameraSource$CameraPreviewCallback;
.super Ljava/lang/Object;
.source "CameraSource.java"

# interfaces
.implements Landroid/hardware/Camera$PreviewCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/media/camera/CameraSource;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "CameraPreviewCallback"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/media/camera/CameraSource;


# direct methods
.method private constructor <init>(Lcom/vk/media/camera/CameraSource;)V
    .locals 0

    .prologue
    .line 226
    iput-object p1, p0, Lcom/vk/media/camera/CameraSource$CameraPreviewCallback;->this$0:Lcom/vk/media/camera/CameraSource;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vk/media/camera/CameraSource;Lcom/vk/media/camera/CameraSource$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vk/media/camera/CameraSource;
    .param p2, "x1"    # Lcom/vk/media/camera/CameraSource$1;

    .prologue
    .line 226
    invoke-direct {p0, p1}, Lcom/vk/media/camera/CameraSource$CameraPreviewCallback;-><init>(Lcom/vk/media/camera/CameraSource;)V

    return-void
.end method


# virtual methods
.method public onPreviewFrame([BLandroid/hardware/Camera;)V
    .locals 6
    .param p1, "data"    # [B
    .param p2, "camera"    # Landroid/hardware/Camera;

    .prologue
    .line 229
    iget-object v0, p0, Lcom/vk/media/camera/CameraSource$CameraPreviewCallback;->this$0:Lcom/vk/media/camera/CameraSource;

    invoke-static {v0}, Lcom/vk/media/camera/CameraSource;->access$100(Lcom/vk/media/camera/CameraSource;)I

    move-result v5

    .line 230
    .local v5, "rotation":I
    iget-object v0, p0, Lcom/vk/media/camera/CameraSource$CameraPreviewCallback;->this$0:Lcom/vk/media/camera/CameraSource;

    invoke-static {v0}, Lcom/vk/media/camera/CameraSource;->access$200(Lcom/vk/media/camera/CameraSource;)Landroid/hardware/Camera$CameraInfo;

    move-result-object v0

    iget v0, v0, Landroid/hardware/Camera$CameraInfo;->facing:I

    if-nez v0, :cond_0

    .line 231
    rsub-int v5, v5, 0x168

    .line 233
    :cond_0
    iget-object v0, p0, Lcom/vk/media/camera/CameraSource$CameraPreviewCallback;->this$0:Lcom/vk/media/camera/CameraSource;

    invoke-static {v0}, Lcom/vk/media/camera/CameraSource;->access$200(Lcom/vk/media/camera/CameraSource;)Landroid/hardware/Camera$CameraInfo;

    move-result-object v0

    iget v0, v0, Landroid/hardware/Camera$CameraInfo;->orientation:I

    add-int/2addr v0, v5

    rem-int/lit16 v5, v0, 0x168

    .line 234
    iget-object v0, p0, Lcom/vk/media/camera/CameraSource$CameraPreviewCallback;->this$0:Lcom/vk/media/camera/CameraSource;

    invoke-static {v0}, Lcom/vk/media/camera/CameraSource;->access$300(Lcom/vk/media/camera/CameraSource;)Lcom/vk/media/camera/CameraUtils$FrameObserver;

    move-result-object v0

    if-eqz v0, :cond_1

    if-eqz p1, :cond_1

    array-length v0, p1

    iget-object v1, p0, Lcom/vk/media/camera/CameraSource$CameraPreviewCallback;->this$0:Lcom/vk/media/camera/CameraSource;

    invoke-static {v1}, Lcom/vk/media/camera/CameraSource;->access$400(Lcom/vk/media/camera/CameraSource;)I

    move-result v1

    if-ne v0, v1, :cond_1

    .line 236
    iget-object v0, p0, Lcom/vk/media/camera/CameraSource$CameraPreviewCallback;->this$0:Lcom/vk/media/camera/CameraSource;

    invoke-static {v0}, Lcom/vk/media/camera/CameraSource;->access$300(Lcom/vk/media/camera/CameraSource;)Lcom/vk/media/camera/CameraUtils$FrameObserver;

    move-result-object v0

    iget-object v1, p0, Lcom/vk/media/camera/CameraSource$CameraPreviewCallback;->this$0:Lcom/vk/media/camera/CameraSource;

    invoke-static {v1}, Lcom/vk/media/camera/CameraSource;->access$500(Lcom/vk/media/camera/CameraSource;)Lcom/vk/media/utils/MediaUtils$Size;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vk/media/utils/MediaUtils$Size;->getWidth()I

    move-result v3

    iget-object v1, p0, Lcom/vk/media/camera/CameraSource$CameraPreviewCallback;->this$0:Lcom/vk/media/camera/CameraSource;

    invoke-static {v1}, Lcom/vk/media/camera/CameraSource;->access$500(Lcom/vk/media/camera/CameraSource;)Lcom/vk/media/utils/MediaUtils$Size;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vk/media/utils/MediaUtils$Size;->getHeight()I

    move-result v4

    move-object v1, p2

    move-object v2, p1

    invoke-interface/range {v0 .. v5}, Lcom/vk/media/camera/CameraUtils$FrameObserver;->onFrameCaptured(Landroid/hardware/Camera;[BIII)V

    .line 238
    :cond_1
    iget-object v0, p0, Lcom/vk/media/camera/CameraSource$CameraPreviewCallback;->this$0:Lcom/vk/media/camera/CameraSource;

    invoke-static {v0}, Lcom/vk/media/camera/CameraSource;->access$600(Lcom/vk/media/camera/CameraSource;)Landroid/hardware/Camera;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/hardware/Camera;->addCallbackBuffer([B)V

    .line 239
    return-void
.end method
