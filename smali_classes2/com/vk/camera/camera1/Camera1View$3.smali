.class Lcom/vk/camera/camera1/Camera1View$3;
.super Ljava/lang/Object;
.source "Camera1View.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/camera/camera1/Camera1View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/camera/camera1/Camera1View;


# direct methods
.method constructor <init>(Lcom/vk/camera/camera1/Camera1View;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/camera/camera1/Camera1View;

    .prologue
    .line 748
    iput-object p1, p0, Lcom/vk/camera/camera1/Camera1View$3;->this$0:Lcom/vk/camera/camera1/Camera1View;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    .prologue
    .line 751
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    iget-object v1, p0, Lcom/vk/camera/camera1/Camera1View$3;->this$0:Lcom/vk/camera/camera1/Camera1View;

    invoke-static {v1}, Lcom/vk/camera/camera1/Camera1View;->access$1000(Lcom/vk/camera/camera1/Camera1View;)J

    move-result-wide v6

    sub-long v2, v4, v6

    .line 752
    .local v2, "milliseconds":J
    iget-object v1, p0, Lcom/vk/camera/camera1/Camera1View$3;->this$0:Lcom/vk/camera/camera1/Camera1View;

    invoke-virtual {v1}, Lcom/vk/camera/camera1/Camera1View;->isRecording()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 753
    iget-object v1, p0, Lcom/vk/camera/camera1/Camera1View$3;->this$0:Lcom/vk/camera/camera1/Camera1View;

    invoke-static {v1}, Lcom/vk/camera/camera1/Camera1View;->access$1100(Lcom/vk/camera/camera1/Camera1View;)Lcom/vk/camera/CameraRecorder$RecorderBase;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vk/camera/CameraRecorder$RecorderBase;->getCallback()Lcom/vk/camera/CameraObject$OnRecordingCallback;

    move-result-object v0

    .line 754
    .local v0, "cb":Lcom/vk/camera/CameraObject$OnRecordingCallback;
    if-eqz v0, :cond_0

    .line 755
    iget-object v1, p0, Lcom/vk/camera/camera1/Camera1View$3;->this$0:Lcom/vk/camera/camera1/Camera1View;

    invoke-static {v1}, Lcom/vk/camera/camera1/Camera1View;->access$1100(Lcom/vk/camera/camera1/Camera1View;)Lcom/vk/camera/CameraRecorder$RecorderBase;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vk/camera/CameraRecorder$RecorderBase;->getMaxRecordingLengthMs()J

    move-result-wide v4

    invoke-interface {v0, v2, v3, v4, v5}, Lcom/vk/camera/CameraObject$OnRecordingCallback;->onProgress(JJ)V

    .line 757
    :cond_0
    iget-object v1, p0, Lcom/vk/camera/camera1/Camera1View$3;->this$0:Lcom/vk/camera/camera1/Camera1View;

    invoke-static {v1}, Lcom/vk/camera/camera1/Camera1View;->access$1300(Lcom/vk/camera/camera1/Camera1View;)Landroid/os/Handler;

    move-result-object v1

    iget-object v4, p0, Lcom/vk/camera/camera1/Camera1View$3;->this$0:Lcom/vk/camera/camera1/Camera1View;

    invoke-static {v4}, Lcom/vk/camera/camera1/Camera1View;->access$1200(Lcom/vk/camera/camera1/Camera1View;)Ljava/lang/Runnable;

    move-result-object v4

    const-wide/16 v6, 0x10

    invoke-virtual {v1, v4, v6, v7}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 761
    .end local v0    # "cb":Lcom/vk/camera/CameraObject$OnRecordingCallback;
    :goto_0
    return-void

    .line 759
    :cond_1
    iget-object v1, p0, Lcom/vk/camera/camera1/Camera1View$3;->this$0:Lcom/vk/camera/camera1/Camera1View;

    invoke-static {v1}, Lcom/vk/camera/camera1/Camera1View;->access$1400(Lcom/vk/camera/camera1/Camera1View;)V

    goto :goto_0
.end method
