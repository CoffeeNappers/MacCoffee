.class Lcom/wmspanel/libstream/VideoListenerGLES21$4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/wmspanel/libstream/VideoListenerGLES21;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/wmspanel/libstream/VideoListenerGLES21;


# direct methods
.method constructor <init>(Lcom/wmspanel/libstream/VideoListenerGLES21;)V
    .locals 0
    .param p1, "this$0"    # Lcom/wmspanel/libstream/VideoListenerGLES21;

    .prologue
    .line 434
    iput-object p1, p0, Lcom/wmspanel/libstream/VideoListenerGLES21$4;->this$0:Lcom/wmspanel/libstream/VideoListenerGLES21;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 436
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21$4;->this$0:Lcom/wmspanel/libstream/VideoListenerGLES21;

    iget-object v0, v0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mCamera2:Landroid/hardware/camera2/CameraDevice;

    if-eqz v0, :cond_0

    .line 437
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21$4;->this$0:Lcom/wmspanel/libstream/VideoListenerGLES21;

    iget-object v0, v0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mCamera2:Landroid/hardware/camera2/CameraDevice;

    invoke-virtual {v0}, Landroid/hardware/camera2/CameraDevice;->close()V

    .line 439
    :cond_0
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListenerGLES21$4;->this$0:Lcom/wmspanel/libstream/VideoListenerGLES21;

    const/4 v1, 0x0

    iput-object v1, v0, Lcom/wmspanel/libstream/VideoListenerGLES21;->mCamera2:Landroid/hardware/camera2/CameraDevice;

    .line 440
    return-void
.end method
