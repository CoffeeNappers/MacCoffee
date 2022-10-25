.class public interface abstract Lcom/vk/media/camera/CameraUtils$Recorder;
.super Ljava/lang/Object;
.source "CameraUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/media/camera/CameraUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "Recorder"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/media/camera/CameraUtils$Recorder$OnRecordFrame;
    }
.end annotation


# virtual methods
.method public abstract isRecording()Z
.end method

.method public abstract prepare()Z
.end method

.method public abstract release()V
.end method

.method public abstract setMaxDuration(I)V
.end method

.method public abstract setOnErrorListener(Landroid/media/MediaRecorder$OnErrorListener;)V
.end method

.method public abstract setOnInfoListener(Landroid/media/MediaRecorder$OnInfoListener;)V
.end method

.method public abstract setOrientationHint(I)V
.end method

.method public abstract setOutputFile(Ljava/io/File;)V
.end method

.method public abstract setProfile(Landroid/media/CamcorderProfile;)V
.end method

.method public abstract start()Z
.end method

.method public abstract stop()V
.end method
