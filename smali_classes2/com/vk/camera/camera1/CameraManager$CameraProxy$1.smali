.class Lcom/vk/camera/camera1/CameraManager$CameraProxy$1;
.super Ljava/lang/Object;
.source "CameraManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/camera/camera1/CameraManager$CameraProxy;->takePicture(Landroid/hardware/Camera$ShutterCallback;Landroid/hardware/Camera$PictureCallback;Landroid/hardware/Camera$PictureCallback;Landroid/hardware/Camera$PictureCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/vk/camera/camera1/CameraManager$CameraProxy;

.field final synthetic val$jpeg:Landroid/hardware/Camera$PictureCallback;

.field final synthetic val$postview:Landroid/hardware/Camera$PictureCallback;

.field final synthetic val$raw:Landroid/hardware/Camera$PictureCallback;

.field final synthetic val$shutter:Landroid/hardware/Camera$ShutterCallback;


# direct methods
.method constructor <init>(Lcom/vk/camera/camera1/CameraManager$CameraProxy;Landroid/hardware/Camera$ShutterCallback;Landroid/hardware/Camera$PictureCallback;Landroid/hardware/Camera$PictureCallback;Landroid/hardware/Camera$PictureCallback;)V
    .locals 0
    .param p1, "this$1"    # Lcom/vk/camera/camera1/CameraManager$CameraProxy;

    .prologue
    .line 408
    iput-object p1, p0, Lcom/vk/camera/camera1/CameraManager$CameraProxy$1;->this$1:Lcom/vk/camera/camera1/CameraManager$CameraProxy;

    iput-object p2, p0, Lcom/vk/camera/camera1/CameraManager$CameraProxy$1;->val$shutter:Landroid/hardware/Camera$ShutterCallback;

    iput-object p3, p0, Lcom/vk/camera/camera1/CameraManager$CameraProxy$1;->val$raw:Landroid/hardware/Camera$PictureCallback;

    iput-object p4, p0, Lcom/vk/camera/camera1/CameraManager$CameraProxy$1;->val$postview:Landroid/hardware/Camera$PictureCallback;

    iput-object p5, p0, Lcom/vk/camera/camera1/CameraManager$CameraProxy$1;->val$jpeg:Landroid/hardware/Camera$PictureCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    .line 412
    :try_start_0
    iget-object v0, p0, Lcom/vk/camera/camera1/CameraManager$CameraProxy$1;->this$1:Lcom/vk/camera/camera1/CameraManager$CameraProxy;

    iget-object v0, v0, Lcom/vk/camera/camera1/CameraManager$CameraProxy;->this$0:Lcom/vk/camera/camera1/CameraManager;

    invoke-static {v0}, Lcom/vk/camera/camera1/CameraManager;->access$000(Lcom/vk/camera/camera1/CameraManager;)Landroid/hardware/Camera;

    move-result-object v0

    iget-object v1, p0, Lcom/vk/camera/camera1/CameraManager$CameraProxy$1;->val$shutter:Landroid/hardware/Camera$ShutterCallback;

    iget-object v2, p0, Lcom/vk/camera/camera1/CameraManager$CameraProxy$1;->val$raw:Landroid/hardware/Camera$PictureCallback;

    iget-object v3, p0, Lcom/vk/camera/camera1/CameraManager$CameraProxy$1;->val$postview:Landroid/hardware/Camera$PictureCallback;

    iget-object v4, p0, Lcom/vk/camera/camera1/CameraManager$CameraProxy$1;->val$jpeg:Landroid/hardware/Camera$PictureCallback;

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/hardware/Camera;->takePicture(Landroid/hardware/Camera$ShutterCallback;Landroid/hardware/Camera$PictureCallback;Landroid/hardware/Camera$PictureCallback;Landroid/hardware/Camera$PictureCallback;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 416
    :goto_0
    iget-object v0, p0, Lcom/vk/camera/camera1/CameraManager$CameraProxy$1;->this$1:Lcom/vk/camera/camera1/CameraManager$CameraProxy;

    iget-object v0, v0, Lcom/vk/camera/camera1/CameraManager$CameraProxy;->this$0:Lcom/vk/camera/camera1/CameraManager;

    invoke-static {v0}, Lcom/vk/camera/camera1/CameraManager;->access$500(Lcom/vk/camera/camera1/CameraManager;)Landroid/os/ConditionVariable;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/ConditionVariable;->open()V

    .line 417
    return-void

    .line 413
    :catch_0
    move-exception v0

    goto :goto_0
.end method
