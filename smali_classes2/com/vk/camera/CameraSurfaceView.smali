.class public Lcom/vk/camera/CameraSurfaceView;
.super Ljava/lang/Object;
.source "CameraSurfaceView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/camera/CameraSurfaceView$SurfaceRecorder;,
        Lcom/vk/camera/CameraSurfaceView$SurfaceEffectsHolder;,
        Lcom/vk/camera/CameraSurfaceView$SurfaceViewHolder;,
        Lcom/vk/camera/CameraSurfaceView$Status;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 26
    const-class v0, Lcom/vk/camera/CameraSurfaceView;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/vk/camera/CameraSurfaceView;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000()Ljava/lang/String;
    .locals 1

    .prologue
    .line 25
    sget-object v0, Lcom/vk/camera/CameraSurfaceView;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method public static create(Landroid/content/Context;Landroid/view/SurfaceHolder$Callback;)Lcom/vk/camera/CameraSurfaceView$SurfaceViewHolder;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "callback"    # Landroid/view/SurfaceHolder$Callback;

    .prologue
    .line 36
    invoke-static {}, Lcom/vk/media/camera/CameraEffects;->isSupported()Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Lcom/vk/camera/CameraSurfaceView$SurfaceEffectsHolder;

    invoke-direct {v0, p0, p1}, Lcom/vk/camera/CameraSurfaceView$SurfaceEffectsHolder;-><init>(Landroid/content/Context;Landroid/view/SurfaceHolder$Callback;)V

    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Lcom/vk/camera/CameraSurfaceView$SurfaceViewHolder;

    invoke-direct {v0, p0, p1}, Lcom/vk/camera/CameraSurfaceView$SurfaceViewHolder;-><init>(Landroid/content/Context;Landroid/view/SurfaceHolder$Callback;)V

    goto :goto_0
.end method
