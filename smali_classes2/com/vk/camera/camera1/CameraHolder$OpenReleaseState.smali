.class Lcom/vk/camera/camera1/CameraHolder$OpenReleaseState;
.super Ljava/lang/Object;
.source "CameraHolder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/camera/camera1/CameraHolder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "OpenReleaseState"
.end annotation


# instance fields
.field device:Ljava/lang/String;

.field id:I

.field stack:[Ljava/lang/String;

.field time:J


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vk/camera/camera1/CameraHolder$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vk/camera/camera1/CameraHolder$1;

    .prologue
    .line 34
    invoke-direct {p0}, Lcom/vk/camera/camera1/CameraHolder$OpenReleaseState;-><init>()V

    return-void
.end method
