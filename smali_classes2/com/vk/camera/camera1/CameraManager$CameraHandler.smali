.class Lcom/vk/camera/camera1/CameraManager$CameraHandler;
.super Landroid/os/Handler;
.source "CameraManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/camera/camera1/CameraManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "CameraHandler"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/camera/camera1/CameraManager;


# direct methods
.method constructor <init>(Lcom/vk/camera/camera1/CameraManager;Landroid/os/Looper;)V
    .locals 0
    .param p2, "looper"    # Landroid/os/Looper;

    .prologue
    .line 69
    iput-object p1, p0, Lcom/vk/camera/camera1/CameraManager$CameraHandler;->this$0:Lcom/vk/camera/camera1/CameraManager;

    .line 70
    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 71
    return-void
.end method

.method private enableShutterSound(Z)V
    .locals 1
    .param p1, "enable"    # Z
    .annotation build Landroid/annotation/TargetApi;
        value = 0x11
    .end annotation

    .prologue
    .line 99
    iget-object v0, p0, Lcom/vk/camera/camera1/CameraManager$CameraHandler;->this$0:Lcom/vk/camera/camera1/CameraManager;

    invoke-static {v0}, Lcom/vk/camera/camera1/CameraManager;->access$000(Lcom/vk/camera/camera1/CameraManager;)Landroid/hardware/Camera;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/hardware/Camera;->enableShutterSound(Z)Z

    .line 100
    return-void
.end method

.method private setFaceDetectionListener(Landroid/hardware/Camera$FaceDetectionListener;)V
    .locals 1
    .param p1, "listener"    # Landroid/hardware/Camera$FaceDetectionListener;
    .annotation build Landroid/annotation/TargetApi;
        value = 0xe
    .end annotation

    .prologue
    .line 85
    iget-object v0, p0, Lcom/vk/camera/camera1/CameraManager$CameraHandler;->this$0:Lcom/vk/camera/camera1/CameraManager;

    invoke-static {v0}, Lcom/vk/camera/camera1/CameraManager;->access$000(Lcom/vk/camera/camera1/CameraManager;)Landroid/hardware/Camera;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/hardware/Camera;->setFaceDetectionListener(Landroid/hardware/Camera$FaceDetectionListener;)V

    .line 86
    return-void
.end method

.method private setPreviewTexture(Ljava/lang/Object;)V
    .locals 2
    .param p1, "surfaceTexture"    # Ljava/lang/Object;
    .annotation build Landroid/annotation/TargetApi;
        value = 0xb
    .end annotation

    .prologue
    .line 91
    :try_start_0
    iget-object v1, p0, Lcom/vk/camera/camera1/CameraManager$CameraHandler;->this$0:Lcom/vk/camera/camera1/CameraManager;

    invoke-static {v1}, Lcom/vk/camera/camera1/CameraManager;->access$000(Lcom/vk/camera/camera1/CameraManager;)Landroid/hardware/Camera;

    move-result-object v1

    check-cast p1, Landroid/graphics/SurfaceTexture;

    .end local p1    # "surfaceTexture":Ljava/lang/Object;
    invoke-virtual {v1, p1}, Landroid/hardware/Camera;->setPreviewTexture(Landroid/graphics/SurfaceTexture;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 95
    return-void

    .line 92
    :catch_0
    move-exception v0

    .line 93
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method private startFaceDetection()V
    .locals 1
    .annotation build Landroid/annotation/TargetApi;
        value = 0xe
    .end annotation

    .prologue
    .line 75
    iget-object v0, p0, Lcom/vk/camera/camera1/CameraManager$CameraHandler;->this$0:Lcom/vk/camera/camera1/CameraManager;

    invoke-static {v0}, Lcom/vk/camera/camera1/CameraManager;->access$000(Lcom/vk/camera/camera1/CameraManager;)Landroid/hardware/Camera;

    move-result-object v0

    invoke-virtual {v0}, Landroid/hardware/Camera;->startFaceDetection()V

    .line 76
    return-void
.end method

.method private stopFaceDetection()V
    .locals 1
    .annotation build Landroid/annotation/TargetApi;
        value = 0xe
    .end annotation

    .prologue
    .line 80
    iget-object v0, p0, Lcom/vk/camera/camera1/CameraManager$CameraHandler;->this$0:Lcom/vk/camera/camera1/CameraManager;

    invoke-static {v0}, Lcom/vk/camera/camera1/CameraManager;->access$000(Lcom/vk/camera/camera1/CameraManager;)Landroid/hardware/Camera;

    move-result-object v0

    invoke-virtual {v0}, Landroid/hardware/Camera;->stopFaceDetection()V

    .line 81
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 7
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    const/4 v3, 0x1

    const/4 v6, 0x0

    .line 109
    :try_start_0
    iget v2, p1, Landroid/os/Message;->what:I

    packed-switch v2, :pswitch_data_0

    .line 268
    new-instance v2, Ljava/lang/RuntimeException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "Invalid CameraProxy message="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p1, Landroid/os/Message;->what:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 270
    :catch_0
    move-exception v0

    .line 271
    .local v0, "e":Ljava/lang/RuntimeException;
    iget v2, p1, Landroid/os/Message;->what:I

    if-eq v2, v3, :cond_0

    iget-object v2, p0, Lcom/vk/camera/camera1/CameraManager$CameraHandler;->this$0:Lcom/vk/camera/camera1/CameraManager;

    invoke-static {v2}, Lcom/vk/camera/camera1/CameraManager;->access$000(Lcom/vk/camera/camera1/CameraManager;)Landroid/hardware/Camera;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 273
    :try_start_1
    iget-object v2, p0, Lcom/vk/camera/camera1/CameraManager$CameraHandler;->this$0:Lcom/vk/camera/camera1/CameraManager;

    invoke-static {v2}, Lcom/vk/camera/camera1/CameraManager;->access$000(Lcom/vk/camera/camera1/CameraManager;)Landroid/hardware/Camera;

    move-result-object v2

    invoke-virtual {v2}, Landroid/hardware/Camera;->release()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_e

    .line 277
    :goto_0
    iget-object v2, p0, Lcom/vk/camera/camera1/CameraManager$CameraHandler;->this$0:Lcom/vk/camera/camera1/CameraManager;

    invoke-static {v2, v6}, Lcom/vk/camera/camera1/CameraManager;->access$002(Lcom/vk/camera/camera1/CameraManager;Landroid/hardware/Camera;)Landroid/hardware/Camera;

    .line 278
    iget-object v2, p0, Lcom/vk/camera/camera1/CameraManager$CameraHandler;->this$0:Lcom/vk/camera/camera1/CameraManager;

    invoke-static {v2, v6}, Lcom/vk/camera/camera1/CameraManager;->access$102(Lcom/vk/camera/camera1/CameraManager;Lcom/vk/camera/camera1/CameraManager$CameraProxy;)Lcom/vk/camera/camera1/CameraManager$CameraProxy;

    .line 280
    :cond_0
    throw v0

    .line 111
    .end local v0    # "e":Ljava/lang/RuntimeException;
    :pswitch_0
    :try_start_2
    iget-object v2, p0, Lcom/vk/camera/camera1/CameraManager$CameraHandler;->this$0:Lcom/vk/camera/camera1/CameraManager;

    invoke-static {v2}, Lcom/vk/camera/camera1/CameraManager;->access$000(Lcom/vk/camera/camera1/CameraManager;)Landroid/hardware/Camera;

    move-result-object v2

    invoke-virtual {v2}, Landroid/hardware/Camera;->release()V

    .line 112
    iget-object v2, p0, Lcom/vk/camera/camera1/CameraManager$CameraHandler;->this$0:Lcom/vk/camera/camera1/CameraManager;

    const/4 v4, 0x0

    invoke-static {v2, v4}, Lcom/vk/camera/camera1/CameraManager;->access$002(Lcom/vk/camera/camera1/CameraManager;Landroid/hardware/Camera;)Landroid/hardware/Camera;

    .line 113
    iget-object v2, p0, Lcom/vk/camera/camera1/CameraManager$CameraHandler;->this$0:Lcom/vk/camera/camera1/CameraManager;

    const/4 v4, 0x0

    invoke-static {v2, v4}, Lcom/vk/camera/camera1/CameraManager;->access$102(Lcom/vk/camera/camera1/CameraManager;Lcom/vk/camera/camera1/CameraManager$CameraProxy;)Lcom/vk/camera/camera1/CameraManager$CameraProxy;
    :try_end_2
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_2} :catch_0

    .line 282
    :goto_1
    :pswitch_1
    iget-object v2, p0, Lcom/vk/camera/camera1/CameraManager$CameraHandler;->this$0:Lcom/vk/camera/camera1/CameraManager;

    invoke-static {v2}, Lcom/vk/camera/camera1/CameraManager;->access$500(Lcom/vk/camera/camera1/CameraManager;)Landroid/os/ConditionVariable;

    move-result-object v2

    invoke-virtual {v2}, Landroid/os/ConditionVariable;->open()V

    .line 283
    :goto_2
    return-void

    .line 117
    :pswitch_2
    :try_start_3
    iget-object v2, p0, Lcom/vk/camera/camera1/CameraManager$CameraHandler;->this$0:Lcom/vk/camera/camera1/CameraManager;

    const/4 v4, 0x0

    invoke-static {v2, v4}, Lcom/vk/camera/camera1/CameraManager;->access$202(Lcom/vk/camera/camera1/CameraManager;Ljava/lang/Exception;)Ljava/lang/Exception;
    :try_end_3
    .catch Ljava/lang/RuntimeException; {:try_start_3 .. :try_end_3} :catch_0

    .line 119
    :try_start_4
    iget-object v2, p0, Lcom/vk/camera/camera1/CameraManager$CameraHandler;->this$0:Lcom/vk/camera/camera1/CameraManager;

    invoke-static {v2}, Lcom/vk/camera/camera1/CameraManager;->access$000(Lcom/vk/camera/camera1/CameraManager;)Landroid/hardware/Camera;

    move-result-object v2

    invoke-virtual {v2}, Landroid/hardware/Camera;->reconnect()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1
    .catch Ljava/lang/RuntimeException; {:try_start_4 .. :try_end_4} :catch_0

    goto :goto_1

    .line 120
    :catch_1
    move-exception v1

    .line 121
    .local v1, "ex":Ljava/lang/Exception;
    :try_start_5
    iget-object v2, p0, Lcom/vk/camera/camera1/CameraManager$CameraHandler;->this$0:Lcom/vk/camera/camera1/CameraManager;

    invoke-static {v2, v1}, Lcom/vk/camera/camera1/CameraManager;->access$202(Lcom/vk/camera/camera1/CameraManager;Ljava/lang/Exception;)Ljava/lang/Exception;
    :try_end_5
    .catch Ljava/lang/RuntimeException; {:try_start_5 .. :try_end_5} :catch_0

    goto :goto_1

    .line 127
    .end local v1    # "ex":Ljava/lang/Exception;
    :pswitch_3
    :try_start_6
    iget-object v2, p0, Lcom/vk/camera/camera1/CameraManager$CameraHandler;->this$0:Lcom/vk/camera/camera1/CameraManager;

    invoke-static {v2}, Lcom/vk/camera/camera1/CameraManager;->access$000(Lcom/vk/camera/camera1/CameraManager;)Landroid/hardware/Camera;

    move-result-object v2

    invoke-virtual {v2}, Landroid/hardware/Camera;->unlock()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_2
    .catch Ljava/lang/RuntimeException; {:try_start_6 .. :try_end_6} :catch_0

    goto :goto_1

    .line 128
    :catch_2
    move-exception v2

    goto :goto_1

    .line 135
    :pswitch_4
    :try_start_7
    iget-object v2, p0, Lcom/vk/camera/camera1/CameraManager$CameraHandler;->this$0:Lcom/vk/camera/camera1/CameraManager;

    invoke-static {v2}, Lcom/vk/camera/camera1/CameraManager;->access$000(Lcom/vk/camera/camera1/CameraManager;)Landroid/hardware/Camera;

    move-result-object v2

    invoke-virtual {v2}, Landroid/hardware/Camera;->lock()V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_3
    .catch Ljava/lang/RuntimeException; {:try_start_7 .. :try_end_7} :catch_0

    goto :goto_1

    .line 136
    :catch_3
    move-exception v2

    goto :goto_1

    .line 143
    :pswitch_5
    :try_start_8
    iget-object v2, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    invoke-direct {p0, v2}, Lcom/vk/camera/camera1/CameraManager$CameraHandler;->setPreviewTexture(Ljava/lang/Object;)V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_4
    .catch Ljava/lang/RuntimeException; {:try_start_8 .. :try_end_8} :catch_0

    goto :goto_2

    .line 144
    :catch_4
    move-exception v2

    goto :goto_2

    .line 151
    :pswitch_6
    :try_start_9
    iget-object v2, p0, Lcom/vk/camera/camera1/CameraManager$CameraHandler;->this$0:Lcom/vk/camera/camera1/CameraManager;

    invoke-static {v2}, Lcom/vk/camera/camera1/CameraManager;->access$000(Lcom/vk/camera/camera1/CameraManager;)Landroid/hardware/Camera;

    move-result-object v4

    iget-object v2, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v2, Landroid/view/SurfaceHolder;

    invoke-virtual {v4, v2}, Landroid/hardware/Camera;->setPreviewDisplay(Landroid/view/SurfaceHolder;)V
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_5
    .catch Ljava/lang/RuntimeException; {:try_start_9 .. :try_end_9} :catch_0

    goto :goto_2

    .line 152
    :catch_5
    move-exception v2

    goto :goto_2

    .line 159
    :pswitch_7
    :try_start_a
    iget-object v2, p0, Lcom/vk/camera/camera1/CameraManager$CameraHandler;->this$0:Lcom/vk/camera/camera1/CameraManager;

    invoke-static {v2}, Lcom/vk/camera/camera1/CameraManager;->access$000(Lcom/vk/camera/camera1/CameraManager;)Landroid/hardware/Camera;

    move-result-object v2

    invoke-virtual {v2}, Landroid/hardware/Camera;->startPreview()V
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_6
    .catch Ljava/lang/RuntimeException; {:try_start_a .. :try_end_a} :catch_0

    goto :goto_2

    .line 160
    :catch_6
    move-exception v2

    goto :goto_2

    .line 167
    :pswitch_8
    :try_start_b
    iget-object v2, p0, Lcom/vk/camera/camera1/CameraManager$CameraHandler;->this$0:Lcom/vk/camera/camera1/CameraManager;

    invoke-static {v2}, Lcom/vk/camera/camera1/CameraManager;->access$000(Lcom/vk/camera/camera1/CameraManager;)Landroid/hardware/Camera;

    move-result-object v2

    invoke-virtual {v2}, Landroid/hardware/Camera;->stopPreview()V
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_7
    .catch Ljava/lang/RuntimeException; {:try_start_b .. :try_end_b} :catch_0

    goto :goto_1

    .line 168
    :catch_7
    move-exception v2

    goto :goto_1

    .line 174
    :pswitch_9
    :try_start_c
    iget-object v2, p0, Lcom/vk/camera/camera1/CameraManager$CameraHandler;->this$0:Lcom/vk/camera/camera1/CameraManager;

    invoke-static {v2}, Lcom/vk/camera/camera1/CameraManager;->access$000(Lcom/vk/camera/camera1/CameraManager;)Landroid/hardware/Camera;

    move-result-object v4

    iget-object v2, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v2, Landroid/hardware/Camera$PreviewCallback;

    invoke-virtual {v4, v2}, Landroid/hardware/Camera;->setPreviewCallbackWithBuffer(Landroid/hardware/Camera$PreviewCallback;)V

    goto :goto_1

    .line 179
    :pswitch_a
    iget-object v2, p0, Lcom/vk/camera/camera1/CameraManager$CameraHandler;->this$0:Lcom/vk/camera/camera1/CameraManager;

    invoke-static {v2}, Lcom/vk/camera/camera1/CameraManager;->access$000(Lcom/vk/camera/camera1/CameraManager;)Landroid/hardware/Camera;

    move-result-object v4

    iget-object v2, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v2, [B

    check-cast v2, [B

    invoke-virtual {v4, v2}, Landroid/hardware/Camera;->addCallbackBuffer([B)V
    :try_end_c
    .catch Ljava/lang/RuntimeException; {:try_start_c .. :try_end_c} :catch_0

    goto/16 :goto_1

    .line 184
    :pswitch_b
    :try_start_d
    iget-object v2, p0, Lcom/vk/camera/camera1/CameraManager$CameraHandler;->this$0:Lcom/vk/camera/camera1/CameraManager;

    invoke-static {v2}, Lcom/vk/camera/camera1/CameraManager;->access$000(Lcom/vk/camera/camera1/CameraManager;)Landroid/hardware/Camera;

    move-result-object v4

    iget-object v2, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v2, Landroid/hardware/Camera$AutoFocusCallback;

    invoke-virtual {v4, v2}, Landroid/hardware/Camera;->autoFocus(Landroid/hardware/Camera$AutoFocusCallback;)V
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_d} :catch_8
    .catch Ljava/lang/RuntimeException; {:try_start_d .. :try_end_d} :catch_0

    goto/16 :goto_1

    .line 185
    :catch_8
    move-exception v2

    goto/16 :goto_1

    .line 192
    :pswitch_c
    :try_start_e
    iget-object v2, p0, Lcom/vk/camera/camera1/CameraManager$CameraHandler;->this$0:Lcom/vk/camera/camera1/CameraManager;

    invoke-static {v2}, Lcom/vk/camera/camera1/CameraManager;->access$000(Lcom/vk/camera/camera1/CameraManager;)Landroid/hardware/Camera;

    move-result-object v2

    invoke-virtual {v2}, Landroid/hardware/Camera;->cancelAutoFocus()V
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_e} :catch_9
    .catch Ljava/lang/RuntimeException; {:try_start_e .. :try_end_e} :catch_0

    goto/16 :goto_1

    .line 193
    :catch_9
    move-exception v2

    goto/16 :goto_1

    .line 199
    :pswitch_d
    :try_start_f
    iget-object v2, p0, Lcom/vk/camera/camera1/CameraManager$CameraHandler;->this$0:Lcom/vk/camera/camera1/CameraManager;

    iget-object v4, p0, Lcom/vk/camera/camera1/CameraManager$CameraHandler;->this$0:Lcom/vk/camera/camera1/CameraManager;

    invoke-static {v4}, Lcom/vk/camera/camera1/CameraManager;->access$000(Lcom/vk/camera/camera1/CameraManager;)Landroid/hardware/Camera;

    move-result-object v4

    iget-object v5, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    invoke-static {v2, v4, v5}, Lcom/vk/camera/camera1/CameraManager;->access$300(Lcom/vk/camera/camera1/CameraManager;Landroid/hardware/Camera;Ljava/lang/Object;)V
    :try_end_f
    .catch Ljava/lang/RuntimeException; {:try_start_f .. :try_end_f} :catch_0

    goto/16 :goto_1

    .line 204
    :pswitch_e
    :try_start_10
    iget-object v2, p0, Lcom/vk/camera/camera1/CameraManager$CameraHandler;->this$0:Lcom/vk/camera/camera1/CameraManager;

    invoke-static {v2}, Lcom/vk/camera/camera1/CameraManager;->access$000(Lcom/vk/camera/camera1/CameraManager;)Landroid/hardware/Camera;

    move-result-object v2

    iget v4, p1, Landroid/os/Message;->arg1:I

    invoke-virtual {v2, v4}, Landroid/hardware/Camera;->setDisplayOrientation(I)V
    :try_end_10
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_10} :catch_a
    .catch Ljava/lang/RuntimeException; {:try_start_10 .. :try_end_10} :catch_0

    goto/16 :goto_1

    .line 205
    :catch_a
    move-exception v2

    goto/16 :goto_1

    .line 211
    :pswitch_f
    :try_start_11
    iget-object v2, p0, Lcom/vk/camera/camera1/CameraManager$CameraHandler;->this$0:Lcom/vk/camera/camera1/CameraManager;

    invoke-static {v2}, Lcom/vk/camera/camera1/CameraManager;->access$000(Lcom/vk/camera/camera1/CameraManager;)Landroid/hardware/Camera;

    move-result-object v4

    iget-object v2, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v2, Landroid/hardware/Camera$OnZoomChangeListener;

    invoke-virtual {v4, v2}, Landroid/hardware/Camera;->setZoomChangeListener(Landroid/hardware/Camera$OnZoomChangeListener;)V

    goto/16 :goto_1

    .line 216
    :pswitch_10
    iget-object v2, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v2, Landroid/hardware/Camera$FaceDetectionListener;

    invoke-direct {p0, v2}, Lcom/vk/camera/camera1/CameraManager$CameraHandler;->setFaceDetectionListener(Landroid/hardware/Camera$FaceDetectionListener;)V

    goto/16 :goto_1

    .line 220
    :pswitch_11
    invoke-direct {p0}, Lcom/vk/camera/camera1/CameraManager$CameraHandler;->startFaceDetection()V

    goto/16 :goto_1

    .line 224
    :pswitch_12
    invoke-direct {p0}, Lcom/vk/camera/camera1/CameraManager$CameraHandler;->stopFaceDetection()V

    goto/16 :goto_1

    .line 228
    :pswitch_13
    iget-object v2, p0, Lcom/vk/camera/camera1/CameraManager$CameraHandler;->this$0:Lcom/vk/camera/camera1/CameraManager;

    invoke-static {v2}, Lcom/vk/camera/camera1/CameraManager;->access$000(Lcom/vk/camera/camera1/CameraManager;)Landroid/hardware/Camera;

    move-result-object v4

    iget-object v2, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v2, Landroid/hardware/Camera$ErrorCallback;

    invoke-virtual {v4, v2}, Landroid/hardware/Camera;->setErrorCallback(Landroid/hardware/Camera$ErrorCallback;)V
    :try_end_11
    .catch Ljava/lang/RuntimeException; {:try_start_11 .. :try_end_11} :catch_0

    goto/16 :goto_1

    .line 233
    :pswitch_14
    :try_start_12
    iget-object v2, p0, Lcom/vk/camera/camera1/CameraManager$CameraHandler;->this$0:Lcom/vk/camera/camera1/CameraManager;

    invoke-static {v2}, Lcom/vk/camera/camera1/CameraManager;->access$000(Lcom/vk/camera/camera1/CameraManager;)Landroid/hardware/Camera;

    move-result-object v4

    iget-object v2, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v2, Landroid/hardware/Camera$Parameters;

    invoke-virtual {v4, v2}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V
    :try_end_12
    .catch Ljava/lang/Exception; {:try_start_12 .. :try_end_12} :catch_b
    .catch Ljava/lang/RuntimeException; {:try_start_12 .. :try_end_12} :catch_0

    goto/16 :goto_1

    .line 234
    :catch_b
    move-exception v2

    goto/16 :goto_1

    .line 241
    :pswitch_15
    :try_start_13
    iget-object v2, p0, Lcom/vk/camera/camera1/CameraManager$CameraHandler;->this$0:Lcom/vk/camera/camera1/CameraManager;

    iget-object v4, p0, Lcom/vk/camera/camera1/CameraManager$CameraHandler;->this$0:Lcom/vk/camera/camera1/CameraManager;

    invoke-static {v4}, Lcom/vk/camera/camera1/CameraManager;->access$000(Lcom/vk/camera/camera1/CameraManager;)Landroid/hardware/Camera;

    move-result-object v4

    invoke-virtual {v4}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v4

    invoke-static {v2, v4}, Lcom/vk/camera/camera1/CameraManager;->access$402(Lcom/vk/camera/camera1/CameraManager;Landroid/hardware/Camera$Parameters;)Landroid/hardware/Camera$Parameters;
    :try_end_13
    .catch Ljava/lang/Exception; {:try_start_13 .. :try_end_13} :catch_c
    .catch Ljava/lang/RuntimeException; {:try_start_13 .. :try_end_13} :catch_0

    goto/16 :goto_1

    .line 242
    :catch_c
    move-exception v2

    goto/16 :goto_1

    .line 249
    :pswitch_16
    :try_start_14
    iget-object v2, p0, Lcom/vk/camera/camera1/CameraManager$CameraHandler;->this$0:Lcom/vk/camera/camera1/CameraManager;

    invoke-static {v2}, Lcom/vk/camera/camera1/CameraManager;->access$000(Lcom/vk/camera/camera1/CameraManager;)Landroid/hardware/Camera;

    move-result-object v4

    iget-object v2, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v2, Landroid/hardware/Camera$Parameters;

    invoke-virtual {v4, v2}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V
    :try_end_14
    .catch Ljava/lang/Exception; {:try_start_14 .. :try_end_14} :catch_d
    .catch Ljava/lang/RuntimeException; {:try_start_14 .. :try_end_14} :catch_0

    goto/16 :goto_2

    .line 250
    :catch_d
    move-exception v2

    goto/16 :goto_2

    .line 256
    :pswitch_17
    :try_start_15
    iget-object v2, p0, Lcom/vk/camera/camera1/CameraManager$CameraHandler;->this$0:Lcom/vk/camera/camera1/CameraManager;

    invoke-static {v2}, Lcom/vk/camera/camera1/CameraManager;->access$000(Lcom/vk/camera/camera1/CameraManager;)Landroid/hardware/Camera;

    move-result-object v4

    iget-object v2, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v2, Landroid/hardware/Camera$PreviewCallback;

    invoke-virtual {v4, v2}, Landroid/hardware/Camera;->setPreviewCallback(Landroid/hardware/Camera$PreviewCallback;)V

    goto/16 :goto_1

    .line 260
    :pswitch_18
    iget v2, p1, Landroid/os/Message;->arg1:I

    if-ne v2, v3, :cond_1

    move v2, v3

    :goto_3
    invoke-direct {p0, v2}, Lcom/vk/camera/camera1/CameraManager$CameraHandler;->enableShutterSound(Z)V
    :try_end_15
    .catch Ljava/lang/RuntimeException; {:try_start_15 .. :try_end_15} :catch_0

    goto/16 :goto_1

    :cond_1
    const/4 v2, 0x0

    goto :goto_3

    .line 274
    .restart local v0    # "e":Ljava/lang/RuntimeException;
    :catch_e
    move-exception v1

    .line 275
    .restart local v1    # "ex":Ljava/lang/Exception;
    const-string/jumbo v2, "CameraManager"

    const-string/jumbo v3, "Fail to release the camera."

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 109
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_7
        :pswitch_8
        :pswitch_9
        :pswitch_a
        :pswitch_b
        :pswitch_c
        :pswitch_d
        :pswitch_e
        :pswitch_f
        :pswitch_10
        :pswitch_11
        :pswitch_12
        :pswitch_13
        :pswitch_14
        :pswitch_15
        :pswitch_16
        :pswitch_1
        :pswitch_6
        :pswitch_17
        :pswitch_18
    .end packed-switch
.end method
