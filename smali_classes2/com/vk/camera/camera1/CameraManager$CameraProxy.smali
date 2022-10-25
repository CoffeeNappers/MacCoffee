.class public Lcom/vk/camera/camera1/CameraManager$CameraProxy;
.super Ljava/lang/Object;
.source "CameraManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/camera/camera1/CameraManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "CameraProxy"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/camera/camera1/CameraManager;


# direct methods
.method private constructor <init>(Lcom/vk/camera/camera1/CameraManager;)V
    .locals 2
    .param p1, "this$0"    # Lcom/vk/camera/camera1/CameraManager;

    .prologue
    .line 311
    iput-object p1, p0, Lcom/vk/camera/camera1/CameraManager$CameraProxy;->this$0:Lcom/vk/camera/camera1/CameraManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 312
    invoke-static {p1}, Lcom/vk/camera/camera1/CameraManager;->access$000(Lcom/vk/camera/camera1/CameraManager;)Landroid/hardware/Camera;

    move-result-object v0

    if-nez v0, :cond_0

    .line 313
    new-instance v0, Ljava/lang/RuntimeException;

    const-string/jumbo v1, "Camera is null"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 315
    :cond_0
    return-void
.end method

.method synthetic constructor <init>(Lcom/vk/camera/camera1/CameraManager;Lcom/vk/camera/camera1/CameraManager$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vk/camera/camera1/CameraManager;
    .param p2, "x1"    # Lcom/vk/camera/camera1/CameraManager$1;

    .prologue
    .line 310
    invoke-direct {p0, p1}, Lcom/vk/camera/camera1/CameraManager$CameraProxy;-><init>(Lcom/vk/camera/camera1/CameraManager;)V

    return-void
.end method


# virtual methods
.method public addCallbackBuffer([B)V
    .locals 2
    .param p1, "callbackBuffer"    # [B

    .prologue
    .line 380
    iget-object v0, p0, Lcom/vk/camera/camera1/CameraManager$CameraProxy;->this$0:Lcom/vk/camera/camera1/CameraManager;

    invoke-static {v0}, Lcom/vk/camera/camera1/CameraManager;->access$500(Lcom/vk/camera/camera1/CameraManager;)Landroid/os/ConditionVariable;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/ConditionVariable;->close()V

    .line 381
    iget-object v0, p0, Lcom/vk/camera/camera1/CameraManager$CameraProxy;->this$0:Lcom/vk/camera/camera1/CameraManager;

    invoke-static {v0}, Lcom/vk/camera/camera1/CameraManager;->access$700(Lcom/vk/camera/camera1/CameraManager;)Landroid/os/Handler;

    move-result-object v0

    const/16 v1, 0x9

    invoke-virtual {v0, v1, p1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 382
    iget-object v0, p0, Lcom/vk/camera/camera1/CameraManager$CameraProxy;->this$0:Lcom/vk/camera/camera1/CameraManager;

    invoke-static {v0}, Lcom/vk/camera/camera1/CameraManager;->access$500(Lcom/vk/camera/camera1/CameraManager;)Landroid/os/ConditionVariable;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/ConditionVariable;->block()V

    .line 383
    return-void
.end method

.method public autoFocus(Landroid/hardware/Camera$AutoFocusCallback;)V
    .locals 2
    .param p1, "cb"    # Landroid/hardware/Camera$AutoFocusCallback;

    .prologue
    .line 386
    iget-object v0, p0, Lcom/vk/camera/camera1/CameraManager$CameraProxy;->this$0:Lcom/vk/camera/camera1/CameraManager;

    invoke-static {v0}, Lcom/vk/camera/camera1/CameraManager;->access$500(Lcom/vk/camera/camera1/CameraManager;)Landroid/os/ConditionVariable;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/ConditionVariable;->close()V

    .line 387
    iget-object v0, p0, Lcom/vk/camera/camera1/CameraManager$CameraProxy;->this$0:Lcom/vk/camera/camera1/CameraManager;

    invoke-static {v0}, Lcom/vk/camera/camera1/CameraManager;->access$700(Lcom/vk/camera/camera1/CameraManager;)Landroid/os/Handler;

    move-result-object v0

    const/16 v1, 0xa

    invoke-virtual {v0, v1, p1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 388
    iget-object v0, p0, Lcom/vk/camera/camera1/CameraManager$CameraProxy;->this$0:Lcom/vk/camera/camera1/CameraManager;

    invoke-static {v0}, Lcom/vk/camera/camera1/CameraManager;->access$500(Lcom/vk/camera/camera1/CameraManager;)Landroid/os/ConditionVariable;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/ConditionVariable;->block()V

    .line 389
    return-void
.end method

.method public cancelAutoFocus()V
    .locals 2

    .prologue
    .line 392
    iget-object v0, p0, Lcom/vk/camera/camera1/CameraManager$CameraProxy;->this$0:Lcom/vk/camera/camera1/CameraManager;

    invoke-static {v0}, Lcom/vk/camera/camera1/CameraManager;->access$500(Lcom/vk/camera/camera1/CameraManager;)Landroid/os/ConditionVariable;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/ConditionVariable;->close()V

    .line 393
    iget-object v0, p0, Lcom/vk/camera/camera1/CameraManager$CameraProxy;->this$0:Lcom/vk/camera/camera1/CameraManager;

    invoke-static {v0}, Lcom/vk/camera/camera1/CameraManager;->access$700(Lcom/vk/camera/camera1/CameraManager;)Landroid/os/Handler;

    move-result-object v0

    const/16 v1, 0xb

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 394
    iget-object v0, p0, Lcom/vk/camera/camera1/CameraManager$CameraProxy;->this$0:Lcom/vk/camera/camera1/CameraManager;

    invoke-static {v0}, Lcom/vk/camera/camera1/CameraManager;->access$500(Lcom/vk/camera/camera1/CameraManager;)Landroid/os/ConditionVariable;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/ConditionVariable;->block()V

    .line 395
    return-void
.end method

.method public enableShutterSound(Z)V
    .locals 4
    .param p1, "enable"    # Z

    .prologue
    const/4 v1, 0x0

    .line 481
    iget-object v0, p0, Lcom/vk/camera/camera1/CameraManager$CameraProxy;->this$0:Lcom/vk/camera/camera1/CameraManager;

    invoke-static {v0}, Lcom/vk/camera/camera1/CameraManager;->access$500(Lcom/vk/camera/camera1/CameraManager;)Landroid/os/ConditionVariable;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/ConditionVariable;->close()V

    .line 482
    iget-object v0, p0, Lcom/vk/camera/camera1/CameraManager$CameraProxy;->this$0:Lcom/vk/camera/camera1/CameraManager;

    invoke-static {v0}, Lcom/vk/camera/camera1/CameraManager;->access$700(Lcom/vk/camera/camera1/CameraManager;)Landroid/os/Handler;

    move-result-object v2

    const/16 v3, 0x19

    if-eqz p1, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {v2, v3, v0, v1}, Landroid/os/Handler;->obtainMessage(III)Landroid/os/Message;

    move-result-object v0

    .line 483
    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 484
    iget-object v0, p0, Lcom/vk/camera/camera1/CameraManager$CameraProxy;->this$0:Lcom/vk/camera/camera1/CameraManager;

    invoke-static {v0}, Lcom/vk/camera/camera1/CameraManager;->access$500(Lcom/vk/camera/camera1/CameraManager;)Landroid/os/ConditionVariable;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/ConditionVariable;->block()V

    .line 485
    return-void

    :cond_0
    move v0, v1

    .line 482
    goto :goto_0
.end method

.method public getCamera()Landroid/hardware/Camera;
    .locals 1

    .prologue
    .line 318
    iget-object v0, p0, Lcom/vk/camera/camera1/CameraManager$CameraProxy;->this$0:Lcom/vk/camera/camera1/CameraManager;

    invoke-static {v0}, Lcom/vk/camera/camera1/CameraManager;->access$000(Lcom/vk/camera/camera1/CameraManager;)Landroid/hardware/Camera;

    move-result-object v0

    return-object v0
.end method

.method public getParameters()Landroid/hardware/Camera$Parameters;
    .locals 3

    .prologue
    .line 472
    iget-object v1, p0, Lcom/vk/camera/camera1/CameraManager$CameraProxy;->this$0:Lcom/vk/camera/camera1/CameraManager;

    invoke-static {v1}, Lcom/vk/camera/camera1/CameraManager;->access$500(Lcom/vk/camera/camera1/CameraManager;)Landroid/os/ConditionVariable;

    move-result-object v1

    invoke-virtual {v1}, Landroid/os/ConditionVariable;->close()V

    .line 473
    iget-object v1, p0, Lcom/vk/camera/camera1/CameraManager$CameraProxy;->this$0:Lcom/vk/camera/camera1/CameraManager;

    invoke-static {v1}, Lcom/vk/camera/camera1/CameraManager;->access$700(Lcom/vk/camera/camera1/CameraManager;)Landroid/os/Handler;

    move-result-object v1

    const/16 v2, 0x14

    invoke-virtual {v1, v2}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 474
    iget-object v1, p0, Lcom/vk/camera/camera1/CameraManager$CameraProxy;->this$0:Lcom/vk/camera/camera1/CameraManager;

    invoke-static {v1}, Lcom/vk/camera/camera1/CameraManager;->access$500(Lcom/vk/camera/camera1/CameraManager;)Landroid/os/ConditionVariable;

    move-result-object v1

    invoke-virtual {v1}, Landroid/os/ConditionVariable;->block()V

    .line 475
    iget-object v1, p0, Lcom/vk/camera/camera1/CameraManager$CameraProxy;->this$0:Lcom/vk/camera/camera1/CameraManager;

    invoke-static {v1}, Lcom/vk/camera/camera1/CameraManager;->access$400(Lcom/vk/camera/camera1/CameraManager;)Landroid/hardware/Camera$Parameters;

    move-result-object v0

    .line 476
    .local v0, "parameters":Landroid/hardware/Camera$Parameters;
    iget-object v1, p0, Lcom/vk/camera/camera1/CameraManager$CameraProxy;->this$0:Lcom/vk/camera/camera1/CameraManager;

    const/4 v2, 0x0

    invoke-static {v1, v2}, Lcom/vk/camera/camera1/CameraManager;->access$402(Lcom/vk/camera/camera1/CameraManager;Landroid/hardware/Camera$Parameters;)Landroid/hardware/Camera$Parameters;

    .line 477
    return-object v0
.end method

.method public lock()V
    .locals 2

    .prologue
    .line 343
    iget-object v0, p0, Lcom/vk/camera/camera1/CameraManager$CameraProxy;->this$0:Lcom/vk/camera/camera1/CameraManager;

    invoke-static {v0}, Lcom/vk/camera/camera1/CameraManager;->access$500(Lcom/vk/camera/camera1/CameraManager;)Landroid/os/ConditionVariable;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/ConditionVariable;->close()V

    .line 344
    iget-object v0, p0, Lcom/vk/camera/camera1/CameraManager$CameraProxy;->this$0:Lcom/vk/camera/camera1/CameraManager;

    invoke-static {v0}, Lcom/vk/camera/camera1/CameraManager;->access$700(Lcom/vk/camera/camera1/CameraManager;)Landroid/os/Handler;

    move-result-object v0

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 345
    iget-object v0, p0, Lcom/vk/camera/camera1/CameraManager$CameraProxy;->this$0:Lcom/vk/camera/camera1/CameraManager;

    invoke-static {v0}, Lcom/vk/camera/camera1/CameraManager;->access$500(Lcom/vk/camera/camera1/CameraManager;)Landroid/os/ConditionVariable;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/ConditionVariable;->block()V

    .line 346
    return-void
.end method

.method public reconnect()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 328
    iget-object v0, p0, Lcom/vk/camera/camera1/CameraManager$CameraProxy;->this$0:Lcom/vk/camera/camera1/CameraManager;

    invoke-static {v0}, Lcom/vk/camera/camera1/CameraManager;->access$500(Lcom/vk/camera/camera1/CameraManager;)Landroid/os/ConditionVariable;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/ConditionVariable;->close()V

    .line 329
    iget-object v0, p0, Lcom/vk/camera/camera1/CameraManager$CameraProxy;->this$0:Lcom/vk/camera/camera1/CameraManager;

    invoke-static {v0}, Lcom/vk/camera/camera1/CameraManager;->access$700(Lcom/vk/camera/camera1/CameraManager;)Landroid/os/Handler;

    move-result-object v0

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 330
    iget-object v0, p0, Lcom/vk/camera/camera1/CameraManager$CameraProxy;->this$0:Lcom/vk/camera/camera1/CameraManager;

    invoke-static {v0}, Lcom/vk/camera/camera1/CameraManager;->access$500(Lcom/vk/camera/camera1/CameraManager;)Landroid/os/ConditionVariable;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/ConditionVariable;->block()V

    .line 331
    iget-object v0, p0, Lcom/vk/camera/camera1/CameraManager$CameraProxy;->this$0:Lcom/vk/camera/camera1/CameraManager;

    invoke-static {v0}, Lcom/vk/camera/camera1/CameraManager;->access$200(Lcom/vk/camera/camera1/CameraManager;)Ljava/lang/Exception;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 332
    iget-object v0, p0, Lcom/vk/camera/camera1/CameraManager$CameraProxy;->this$0:Lcom/vk/camera/camera1/CameraManager;

    invoke-static {v0}, Lcom/vk/camera/camera1/CameraManager;->access$200(Lcom/vk/camera/camera1/CameraManager;)Ljava/lang/Exception;

    move-result-object v0

    throw v0

    .line 334
    :cond_0
    return-void
.end method

.method public release()V
    .locals 2

    .prologue
    .line 322
    iget-object v0, p0, Lcom/vk/camera/camera1/CameraManager$CameraProxy;->this$0:Lcom/vk/camera/camera1/CameraManager;

    invoke-static {v0}, Lcom/vk/camera/camera1/CameraManager;->access$500(Lcom/vk/camera/camera1/CameraManager;)Landroid/os/ConditionVariable;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/ConditionVariable;->close()V

    .line 323
    iget-object v0, p0, Lcom/vk/camera/camera1/CameraManager$CameraProxy;->this$0:Lcom/vk/camera/camera1/CameraManager;

    invoke-static {v0}, Lcom/vk/camera/camera1/CameraManager;->access$700(Lcom/vk/camera/camera1/CameraManager;)Landroid/os/Handler;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 324
    iget-object v0, p0, Lcom/vk/camera/camera1/CameraManager$CameraProxy;->this$0:Lcom/vk/camera/camera1/CameraManager;

    invoke-static {v0}, Lcom/vk/camera/camera1/CameraManager;->access$500(Lcom/vk/camera/camera1/CameraManager;)Landroid/os/ConditionVariable;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/ConditionVariable;->block()V

    .line 325
    return-void
.end method

.method public setAutoFocusMoveCallback(Landroid/hardware/Camera$AutoFocusMoveCallback;)V
    .locals 2
    .param p1, "cb"    # Landroid/hardware/Camera$AutoFocusMoveCallback;
    .annotation build Landroid/annotation/TargetApi;
        value = 0x10
    .end annotation

    .prologue
    .line 399
    iget-object v0, p0, Lcom/vk/camera/camera1/CameraManager$CameraProxy;->this$0:Lcom/vk/camera/camera1/CameraManager;

    invoke-static {v0}, Lcom/vk/camera/camera1/CameraManager;->access$500(Lcom/vk/camera/camera1/CameraManager;)Landroid/os/ConditionVariable;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/ConditionVariable;->close()V

    .line 400
    iget-object v0, p0, Lcom/vk/camera/camera1/CameraManager$CameraProxy;->this$0:Lcom/vk/camera/camera1/CameraManager;

    invoke-static {v0}, Lcom/vk/camera/camera1/CameraManager;->access$700(Lcom/vk/camera/camera1/CameraManager;)Landroid/os/Handler;

    move-result-object v0

    const/16 v1, 0xc

    invoke-virtual {v0, v1, p1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 401
    iget-object v0, p0, Lcom/vk/camera/camera1/CameraManager$CameraProxy;->this$0:Lcom/vk/camera/camera1/CameraManager;

    invoke-static {v0}, Lcom/vk/camera/camera1/CameraManager;->access$500(Lcom/vk/camera/camera1/CameraManager;)Landroid/os/ConditionVariable;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/ConditionVariable;->block()V

    .line 402
    return-void
.end method

.method public setDisplayOrientation(I)V
    .locals 3
    .param p1, "degrees"    # I

    .prologue
    .line 423
    iget-object v0, p0, Lcom/vk/camera/camera1/CameraManager$CameraProxy;->this$0:Lcom/vk/camera/camera1/CameraManager;

    invoke-static {v0}, Lcom/vk/camera/camera1/CameraManager;->access$500(Lcom/vk/camera/camera1/CameraManager;)Landroid/os/ConditionVariable;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/ConditionVariable;->close()V

    .line 424
    iget-object v0, p0, Lcom/vk/camera/camera1/CameraManager$CameraProxy;->this$0:Lcom/vk/camera/camera1/CameraManager;

    invoke-static {v0}, Lcom/vk/camera/camera1/CameraManager;->access$700(Lcom/vk/camera/camera1/CameraManager;)Landroid/os/Handler;

    move-result-object v0

    const/16 v1, 0xd

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p1, v2}, Landroid/os/Handler;->obtainMessage(III)Landroid/os/Message;

    move-result-object v0

    .line 425
    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 426
    iget-object v0, p0, Lcom/vk/camera/camera1/CameraManager$CameraProxy;->this$0:Lcom/vk/camera/camera1/CameraManager;

    invoke-static {v0}, Lcom/vk/camera/camera1/CameraManager;->access$500(Lcom/vk/camera/camera1/CameraManager;)Landroid/os/ConditionVariable;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/ConditionVariable;->block()V

    .line 427
    return-void
.end method

.method public setErrorCallback(Landroid/hardware/Camera$ErrorCallback;)V
    .locals 2
    .param p1, "cb"    # Landroid/hardware/Camera$ErrorCallback;

    .prologue
    .line 455
    iget-object v0, p0, Lcom/vk/camera/camera1/CameraManager$CameraProxy;->this$0:Lcom/vk/camera/camera1/CameraManager;

    invoke-static {v0}, Lcom/vk/camera/camera1/CameraManager;->access$500(Lcom/vk/camera/camera1/CameraManager;)Landroid/os/ConditionVariable;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/ConditionVariable;->close()V

    .line 456
    iget-object v0, p0, Lcom/vk/camera/camera1/CameraManager$CameraProxy;->this$0:Lcom/vk/camera/camera1/CameraManager;

    invoke-static {v0}, Lcom/vk/camera/camera1/CameraManager;->access$700(Lcom/vk/camera/camera1/CameraManager;)Landroid/os/Handler;

    move-result-object v0

    const/16 v1, 0x12

    invoke-virtual {v0, v1, p1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 457
    iget-object v0, p0, Lcom/vk/camera/camera1/CameraManager$CameraProxy;->this$0:Lcom/vk/camera/camera1/CameraManager;

    invoke-static {v0}, Lcom/vk/camera/camera1/CameraManager;->access$500(Lcom/vk/camera/camera1/CameraManager;)Landroid/os/ConditionVariable;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/ConditionVariable;->block()V

    .line 458
    return-void
.end method

.method public setFaceDetectionListener(Landroid/hardware/Camera$FaceDetectionListener;)V
    .locals 2
    .param p1, "listener"    # Landroid/hardware/Camera$FaceDetectionListener;
    .annotation build Landroid/annotation/TargetApi;
        value = 0xe
    .end annotation

    .prologue
    .line 437
    iget-object v0, p0, Lcom/vk/camera/camera1/CameraManager$CameraProxy;->this$0:Lcom/vk/camera/camera1/CameraManager;

    invoke-static {v0}, Lcom/vk/camera/camera1/CameraManager;->access$500(Lcom/vk/camera/camera1/CameraManager;)Landroid/os/ConditionVariable;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/ConditionVariable;->close()V

    .line 438
    iget-object v0, p0, Lcom/vk/camera/camera1/CameraManager$CameraProxy;->this$0:Lcom/vk/camera/camera1/CameraManager;

    invoke-static {v0}, Lcom/vk/camera/camera1/CameraManager;->access$700(Lcom/vk/camera/camera1/CameraManager;)Landroid/os/Handler;

    move-result-object v0

    const/16 v1, 0xf

    invoke-virtual {v0, v1, p1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 439
    iget-object v0, p0, Lcom/vk/camera/camera1/CameraManager$CameraProxy;->this$0:Lcom/vk/camera/camera1/CameraManager;

    invoke-static {v0}, Lcom/vk/camera/camera1/CameraManager;->access$500(Lcom/vk/camera/camera1/CameraManager;)Landroid/os/ConditionVariable;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/ConditionVariable;->block()V

    .line 440
    return-void
.end method

.method public setParameters(Landroid/hardware/Camera$Parameters;)V
    .locals 2
    .param p1, "params"    # Landroid/hardware/Camera$Parameters;

    .prologue
    .line 461
    iget-object v0, p0, Lcom/vk/camera/camera1/CameraManager$CameraProxy;->this$0:Lcom/vk/camera/camera1/CameraManager;

    invoke-static {v0}, Lcom/vk/camera/camera1/CameraManager;->access$500(Lcom/vk/camera/camera1/CameraManager;)Landroid/os/ConditionVariable;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/ConditionVariable;->close()V

    .line 462
    iget-object v0, p0, Lcom/vk/camera/camera1/CameraManager$CameraProxy;->this$0:Lcom/vk/camera/camera1/CameraManager;

    invoke-static {v0}, Lcom/vk/camera/camera1/CameraManager;->access$700(Lcom/vk/camera/camera1/CameraManager;)Landroid/os/Handler;

    move-result-object v0

    const/16 v1, 0x13

    invoke-virtual {v0, v1, p1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 463
    iget-object v0, p0, Lcom/vk/camera/camera1/CameraManager$CameraProxy;->this$0:Lcom/vk/camera/camera1/CameraManager;

    invoke-static {v0}, Lcom/vk/camera/camera1/CameraManager;->access$500(Lcom/vk/camera/camera1/CameraManager;)Landroid/os/ConditionVariable;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/ConditionVariable;->block()V

    .line 464
    return-void
.end method

.method public setParametersAsync(Landroid/hardware/Camera$Parameters;)V
    .locals 2
    .param p1, "params"    # Landroid/hardware/Camera$Parameters;

    .prologue
    const/16 v1, 0x15

    .line 467
    iget-object v0, p0, Lcom/vk/camera/camera1/CameraManager$CameraProxy;->this$0:Lcom/vk/camera/camera1/CameraManager;

    invoke-static {v0}, Lcom/vk/camera/camera1/CameraManager;->access$700(Lcom/vk/camera/camera1/CameraManager;)Landroid/os/Handler;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 468
    iget-object v0, p0, Lcom/vk/camera/camera1/CameraManager$CameraProxy;->this$0:Lcom/vk/camera/camera1/CameraManager;

    invoke-static {v0}, Lcom/vk/camera/camera1/CameraManager;->access$700(Lcom/vk/camera/camera1/CameraManager;)Landroid/os/Handler;

    move-result-object v0

    invoke-virtual {v0, v1, p1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 469
    return-void
.end method

.method public setPreviewCallback(Landroid/hardware/Camera$PreviewCallback;)V
    .locals 2
    .param p1, "cb"    # Landroid/hardware/Camera$PreviewCallback;

    .prologue
    .line 368
    iget-object v0, p0, Lcom/vk/camera/camera1/CameraManager$CameraProxy;->this$0:Lcom/vk/camera/camera1/CameraManager;

    invoke-static {v0}, Lcom/vk/camera/camera1/CameraManager;->access$500(Lcom/vk/camera/camera1/CameraManager;)Landroid/os/ConditionVariable;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/ConditionVariable;->close()V

    .line 369
    iget-object v0, p0, Lcom/vk/camera/camera1/CameraManager$CameraProxy;->this$0:Lcom/vk/camera/camera1/CameraManager;

    invoke-static {v0}, Lcom/vk/camera/camera1/CameraManager;->access$700(Lcom/vk/camera/camera1/CameraManager;)Landroid/os/Handler;

    move-result-object v0

    const/16 v1, 0x18

    invoke-virtual {v0, v1, p1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 370
    iget-object v0, p0, Lcom/vk/camera/camera1/CameraManager$CameraProxy;->this$0:Lcom/vk/camera/camera1/CameraManager;

    invoke-static {v0}, Lcom/vk/camera/camera1/CameraManager;->access$500(Lcom/vk/camera/camera1/CameraManager;)Landroid/os/ConditionVariable;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/ConditionVariable;->block()V

    .line 371
    return-void
.end method

.method public setPreviewCallbackWithBuffer(Landroid/hardware/Camera$PreviewCallback;)V
    .locals 2
    .param p1, "cb"    # Landroid/hardware/Camera$PreviewCallback;

    .prologue
    .line 374
    iget-object v0, p0, Lcom/vk/camera/camera1/CameraManager$CameraProxy;->this$0:Lcom/vk/camera/camera1/CameraManager;

    invoke-static {v0}, Lcom/vk/camera/camera1/CameraManager;->access$500(Lcom/vk/camera/camera1/CameraManager;)Landroid/os/ConditionVariable;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/ConditionVariable;->close()V

    .line 375
    iget-object v0, p0, Lcom/vk/camera/camera1/CameraManager$CameraProxy;->this$0:Lcom/vk/camera/camera1/CameraManager;

    invoke-static {v0}, Lcom/vk/camera/camera1/CameraManager;->access$700(Lcom/vk/camera/camera1/CameraManager;)Landroid/os/Handler;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1, p1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 376
    iget-object v0, p0, Lcom/vk/camera/camera1/CameraManager$CameraProxy;->this$0:Lcom/vk/camera/camera1/CameraManager;

    invoke-static {v0}, Lcom/vk/camera/camera1/CameraManager;->access$500(Lcom/vk/camera/camera1/CameraManager;)Landroid/os/ConditionVariable;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/ConditionVariable;->block()V

    .line 377
    return-void
.end method

.method public setPreviewDisplayAsync(Landroid/view/SurfaceHolder;)V
    .locals 2
    .param p1, "surfaceHolder"    # Landroid/view/SurfaceHolder;

    .prologue
    .line 354
    iget-object v0, p0, Lcom/vk/camera/camera1/CameraManager$CameraProxy;->this$0:Lcom/vk/camera/camera1/CameraManager;

    invoke-static {v0}, Lcom/vk/camera/camera1/CameraManager;->access$700(Lcom/vk/camera/camera1/CameraManager;)Landroid/os/Handler;

    move-result-object v0

    const/16 v1, 0x17

    invoke-virtual {v0, v1, p1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 355
    return-void
.end method

.method public setPreviewTextureAsync(Landroid/graphics/SurfaceTexture;)V
    .locals 2
    .param p1, "surfaceTexture"    # Landroid/graphics/SurfaceTexture;
    .annotation build Landroid/annotation/TargetApi;
        value = 0xb
    .end annotation

    .prologue
    .line 350
    iget-object v0, p0, Lcom/vk/camera/camera1/CameraManager$CameraProxy;->this$0:Lcom/vk/camera/camera1/CameraManager;

    invoke-static {v0}, Lcom/vk/camera/camera1/CameraManager;->access$700(Lcom/vk/camera/camera1/CameraManager;)Landroid/os/Handler;

    move-result-object v0

    const/4 v1, 0x5

    invoke-virtual {v0, v1, p1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 351
    return-void
.end method

.method public setZoomChangeListener(Landroid/hardware/Camera$OnZoomChangeListener;)V
    .locals 2
    .param p1, "listener"    # Landroid/hardware/Camera$OnZoomChangeListener;

    .prologue
    .line 430
    iget-object v0, p0, Lcom/vk/camera/camera1/CameraManager$CameraProxy;->this$0:Lcom/vk/camera/camera1/CameraManager;

    invoke-static {v0}, Lcom/vk/camera/camera1/CameraManager;->access$500(Lcom/vk/camera/camera1/CameraManager;)Landroid/os/ConditionVariable;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/ConditionVariable;->close()V

    .line 431
    iget-object v0, p0, Lcom/vk/camera/camera1/CameraManager$CameraProxy;->this$0:Lcom/vk/camera/camera1/CameraManager;

    invoke-static {v0}, Lcom/vk/camera/camera1/CameraManager;->access$700(Lcom/vk/camera/camera1/CameraManager;)Landroid/os/Handler;

    move-result-object v0

    const/16 v1, 0xe

    invoke-virtual {v0, v1, p1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 432
    iget-object v0, p0, Lcom/vk/camera/camera1/CameraManager$CameraProxy;->this$0:Lcom/vk/camera/camera1/CameraManager;

    invoke-static {v0}, Lcom/vk/camera/camera1/CameraManager;->access$500(Lcom/vk/camera/camera1/CameraManager;)Landroid/os/ConditionVariable;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/ConditionVariable;->block()V

    .line 433
    return-void
.end method

.method public startFaceDetection()V
    .locals 2

    .prologue
    .line 443
    iget-object v0, p0, Lcom/vk/camera/camera1/CameraManager$CameraProxy;->this$0:Lcom/vk/camera/camera1/CameraManager;

    invoke-static {v0}, Lcom/vk/camera/camera1/CameraManager;->access$500(Lcom/vk/camera/camera1/CameraManager;)Landroid/os/ConditionVariable;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/ConditionVariable;->close()V

    .line 444
    iget-object v0, p0, Lcom/vk/camera/camera1/CameraManager$CameraProxy;->this$0:Lcom/vk/camera/camera1/CameraManager;

    invoke-static {v0}, Lcom/vk/camera/camera1/CameraManager;->access$700(Lcom/vk/camera/camera1/CameraManager;)Landroid/os/Handler;

    move-result-object v0

    const/16 v1, 0x10

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 445
    iget-object v0, p0, Lcom/vk/camera/camera1/CameraManager$CameraProxy;->this$0:Lcom/vk/camera/camera1/CameraManager;

    invoke-static {v0}, Lcom/vk/camera/camera1/CameraManager;->access$500(Lcom/vk/camera/camera1/CameraManager;)Landroid/os/ConditionVariable;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/ConditionVariable;->block()V

    .line 446
    return-void
.end method

.method public startPreviewAsync()V
    .locals 2

    .prologue
    .line 358
    iget-object v0, p0, Lcom/vk/camera/camera1/CameraManager$CameraProxy;->this$0:Lcom/vk/camera/camera1/CameraManager;

    invoke-static {v0}, Lcom/vk/camera/camera1/CameraManager;->access$700(Lcom/vk/camera/camera1/CameraManager;)Landroid/os/Handler;

    move-result-object v0

    const/4 v1, 0x6

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 359
    return-void
.end method

.method public stopFaceDetection()V
    .locals 2

    .prologue
    .line 449
    iget-object v0, p0, Lcom/vk/camera/camera1/CameraManager$CameraProxy;->this$0:Lcom/vk/camera/camera1/CameraManager;

    invoke-static {v0}, Lcom/vk/camera/camera1/CameraManager;->access$500(Lcom/vk/camera/camera1/CameraManager;)Landroid/os/ConditionVariable;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/ConditionVariable;->close()V

    .line 450
    iget-object v0, p0, Lcom/vk/camera/camera1/CameraManager$CameraProxy;->this$0:Lcom/vk/camera/camera1/CameraManager;

    invoke-static {v0}, Lcom/vk/camera/camera1/CameraManager;->access$700(Lcom/vk/camera/camera1/CameraManager;)Landroid/os/Handler;

    move-result-object v0

    const/16 v1, 0x11

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 451
    iget-object v0, p0, Lcom/vk/camera/camera1/CameraManager$CameraProxy;->this$0:Lcom/vk/camera/camera1/CameraManager;

    invoke-static {v0}, Lcom/vk/camera/camera1/CameraManager;->access$500(Lcom/vk/camera/camera1/CameraManager;)Landroid/os/ConditionVariable;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/ConditionVariable;->block()V

    .line 452
    return-void
.end method

.method public stopPreview()V
    .locals 2

    .prologue
    .line 362
    iget-object v0, p0, Lcom/vk/camera/camera1/CameraManager$CameraProxy;->this$0:Lcom/vk/camera/camera1/CameraManager;

    invoke-static {v0}, Lcom/vk/camera/camera1/CameraManager;->access$500(Lcom/vk/camera/camera1/CameraManager;)Landroid/os/ConditionVariable;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/ConditionVariable;->close()V

    .line 363
    iget-object v0, p0, Lcom/vk/camera/camera1/CameraManager$CameraProxy;->this$0:Lcom/vk/camera/camera1/CameraManager;

    invoke-static {v0}, Lcom/vk/camera/camera1/CameraManager;->access$700(Lcom/vk/camera/camera1/CameraManager;)Landroid/os/Handler;

    move-result-object v0

    const/4 v1, 0x7

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 364
    iget-object v0, p0, Lcom/vk/camera/camera1/CameraManager$CameraProxy;->this$0:Lcom/vk/camera/camera1/CameraManager;

    invoke-static {v0}, Lcom/vk/camera/camera1/CameraManager;->access$500(Lcom/vk/camera/camera1/CameraManager;)Landroid/os/ConditionVariable;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/ConditionVariable;->block()V

    .line 365
    return-void
.end method

.method public takePicture(Landroid/hardware/Camera$ShutterCallback;Landroid/hardware/Camera$PictureCallback;Landroid/hardware/Camera$PictureCallback;Landroid/hardware/Camera$PictureCallback;)V
    .locals 7
    .param p1, "shutter"    # Landroid/hardware/Camera$ShutterCallback;
    .param p2, "raw"    # Landroid/hardware/Camera$PictureCallback;
    .param p3, "postview"    # Landroid/hardware/Camera$PictureCallback;
    .param p4, "jpeg"    # Landroid/hardware/Camera$PictureCallback;

    .prologue
    .line 406
    iget-object v0, p0, Lcom/vk/camera/camera1/CameraManager$CameraProxy;->this$0:Lcom/vk/camera/camera1/CameraManager;

    invoke-static {v0}, Lcom/vk/camera/camera1/CameraManager;->access$500(Lcom/vk/camera/camera1/CameraManager;)Landroid/os/ConditionVariable;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/ConditionVariable;->close()V

    .line 408
    iget-object v0, p0, Lcom/vk/camera/camera1/CameraManager$CameraProxy;->this$0:Lcom/vk/camera/camera1/CameraManager;

    invoke-static {v0}, Lcom/vk/camera/camera1/CameraManager;->access$700(Lcom/vk/camera/camera1/CameraManager;)Landroid/os/Handler;

    move-result-object v6

    new-instance v0, Lcom/vk/camera/camera1/CameraManager$CameraProxy$1;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/vk/camera/camera1/CameraManager$CameraProxy$1;-><init>(Lcom/vk/camera/camera1/CameraManager$CameraProxy;Landroid/hardware/Camera$ShutterCallback;Landroid/hardware/Camera$PictureCallback;Landroid/hardware/Camera$PictureCallback;Landroid/hardware/Camera$PictureCallback;)V

    invoke-virtual {v6, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 419
    iget-object v0, p0, Lcom/vk/camera/camera1/CameraManager$CameraProxy;->this$0:Lcom/vk/camera/camera1/CameraManager;

    invoke-static {v0}, Lcom/vk/camera/camera1/CameraManager;->access$500(Lcom/vk/camera/camera1/CameraManager;)Landroid/os/ConditionVariable;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/ConditionVariable;->block()V

    .line 420
    return-void
.end method

.method public unlock()V
    .locals 2

    .prologue
    .line 337
    iget-object v0, p0, Lcom/vk/camera/camera1/CameraManager$CameraProxy;->this$0:Lcom/vk/camera/camera1/CameraManager;

    invoke-static {v0}, Lcom/vk/camera/camera1/CameraManager;->access$500(Lcom/vk/camera/camera1/CameraManager;)Landroid/os/ConditionVariable;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/ConditionVariable;->close()V

    .line 338
    iget-object v0, p0, Lcom/vk/camera/camera1/CameraManager$CameraProxy;->this$0:Lcom/vk/camera/camera1/CameraManager;

    invoke-static {v0}, Lcom/vk/camera/camera1/CameraManager;->access$700(Lcom/vk/camera/camera1/CameraManager;)Landroid/os/Handler;

    move-result-object v0

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 339
    iget-object v0, p0, Lcom/vk/camera/camera1/CameraManager$CameraProxy;->this$0:Lcom/vk/camera/camera1/CameraManager;

    invoke-static {v0}, Lcom/vk/camera/camera1/CameraManager;->access$500(Lcom/vk/camera/camera1/CameraManager;)Landroid/os/ConditionVariable;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/ConditionVariable;->block()V

    .line 340
    return-void
.end method

.method public waitForIdle()V
    .locals 2

    .prologue
    .line 488
    iget-object v0, p0, Lcom/vk/camera/camera1/CameraManager$CameraProxy;->this$0:Lcom/vk/camera/camera1/CameraManager;

    invoke-static {v0}, Lcom/vk/camera/camera1/CameraManager;->access$500(Lcom/vk/camera/camera1/CameraManager;)Landroid/os/ConditionVariable;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/ConditionVariable;->close()V

    .line 489
    iget-object v0, p0, Lcom/vk/camera/camera1/CameraManager$CameraProxy;->this$0:Lcom/vk/camera/camera1/CameraManager;

    invoke-static {v0}, Lcom/vk/camera/camera1/CameraManager;->access$700(Lcom/vk/camera/camera1/CameraManager;)Landroid/os/Handler;

    move-result-object v0

    const/16 v1, 0x16

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 490
    iget-object v0, p0, Lcom/vk/camera/camera1/CameraManager$CameraProxy;->this$0:Lcom/vk/camera/camera1/CameraManager;

    invoke-static {v0}, Lcom/vk/camera/camera1/CameraManager;->access$500(Lcom/vk/camera/camera1/CameraManager;)Landroid/os/ConditionVariable;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/ConditionVariable;->block()V

    .line 491
    return-void
.end method
