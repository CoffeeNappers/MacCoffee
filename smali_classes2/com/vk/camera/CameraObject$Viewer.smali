.class public interface abstract Lcom/vk/camera/CameraObject$Viewer;
.super Ljava/lang/Object;
.source "CameraObject.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/camera/CameraObject;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "Viewer"
.end annotation


# virtual methods
.method public abstract getCurrentMode()Lcom/vk/camera/CameraMode;
.end method

.method public abstract getFlashMode()I
.end method

.method public abstract getZoomLevel()F
.end method

.method public abstract isBackCamera()Z
.end method

.method public abstract isFrontCamera()Z
.end method

.method public abstract setCameraOrientationListener(Lcom/vk/camera/camera1/CameraOrientationListener;)V
.end method

.method public abstract setFlashMode(I)V
.end method

.method public abstract setOnCameraResultListener(Lcom/vk/camera/CameraObject$OnPhotoResultListener;)V
.end method

.method public abstract setUseFullBleedPreview(Z)V
.end method

.method public abstract setZoomLevel(F)V
.end method

.method public abstract start()V
.end method

.method public abstract start(Lcom/vk/camera/CameraMode;)V
.end method

.method public abstract stop(Z)V
.end method

.method public abstract takePicture()V
.end method
