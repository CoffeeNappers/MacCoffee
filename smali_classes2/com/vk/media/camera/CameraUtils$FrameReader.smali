.class public interface abstract Lcom/vk/media/camera/CameraUtils$FrameReader;
.super Ljava/lang/Object;
.source "CameraUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/media/camera/CameraUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "FrameReader"
.end annotation


# virtual methods
.method public abstract clear()V
.end method

.method public abstract pull(Lcom/vk/media/camera/CameraUtils$Frame;)V
.end method

.method public abstract setTexture(Lcom/vk/media/utils/RenderHelpers$RenderTexture;)V
.end method
