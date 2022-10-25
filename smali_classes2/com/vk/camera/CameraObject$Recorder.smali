.class public interface abstract Lcom/vk/camera/CameraObject$Recorder;
.super Ljava/lang/Object;
.source "CameraObject.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/camera/CameraObject;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "Recorder"
.end annotation


# virtual methods
.method public abstract capture(Landroid/hardware/Camera$PictureCallback;)Z
.end method

.method public abstract getMaxRecordingLengthMs()J
.end method

.method public abstract isRecording()Z
.end method

.method public abstract setMaxRecordingLengthMs(J)V
.end method

.method public abstract setRecordingCallback(Lcom/vk/camera/CameraObject$OnRecordingCallback;)V
.end method

.method public abstract startRecording()Z
.end method

.method public abstract stopRecording()V
.end method
