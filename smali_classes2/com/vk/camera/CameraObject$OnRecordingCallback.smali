.class public interface abstract Lcom/vk/camera/CameraObject$OnRecordingCallback;
.super Ljava/lang/Object;
.source "CameraObject.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/camera/CameraObject;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "OnRecordingCallback"
.end annotation


# virtual methods
.method public abstract onCancel()V
.end method

.method public abstract onError(II)V
.end method

.method public abstract onFinish(Ljava/io/File;)V
.end method

.method public abstract onInfo(II)V
.end method

.method public abstract onProgress(JJ)V
.end method

.method public abstract onStart()V
.end method
