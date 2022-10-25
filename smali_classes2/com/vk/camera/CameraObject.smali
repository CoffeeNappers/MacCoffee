.class public Lcom/vk/camera/CameraObject;
.super Ljava/lang/Object;
.source "CameraObject.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/camera/CameraObject$OnPhotoResultListener;,
        Lcom/vk/camera/CameraObject$OnVideoResultListener;,
        Lcom/vk/camera/CameraObject$OnRecordingCallback;,
        Lcom/vk/camera/CameraObject$Recorder;,
        Lcom/vk/camera/CameraObject$Viewer;
    }
.end annotation


# static fields
.field public static final FLASH_MODE_AUTO:I = 0x1

.field public static final FLASH_MODE_OFF:I = 0x0

.field public static final FLASH_MODE_ON:I = 0x2

.field public static final MODE_BOTH:I = 0x2

.field public static final MODE_PHOTO:I = 0x0

.field public static final MODE_VIDEO:I = 0x1


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
