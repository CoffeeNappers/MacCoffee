.class public interface abstract Lcom/vk/camera/camera1/FocusOverlayManager$Listener;
.super Ljava/lang/Object;
.source "FocusOverlayManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/camera/camera1/FocusOverlayManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "Listener"
.end annotation


# virtual methods
.method public abstract autoFocus()V
.end method

.method public abstract cancelAutoFocus()V
.end method

.method public abstract capture()Z
.end method

.method public abstract setFocusParameters()V
.end method

.method public abstract transformToPreviewCoordinates(II)Landroid/graphics/Point;
.end method
