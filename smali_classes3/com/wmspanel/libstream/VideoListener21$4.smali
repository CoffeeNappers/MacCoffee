.class Lcom/wmspanel/libstream/VideoListener21$4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/wmspanel/libstream/VideoListener21;->release()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/wmspanel/libstream/VideoListener21;


# direct methods
.method constructor <init>(Lcom/wmspanel/libstream/VideoListener21;)V
    .locals 0
    .param p1, "this$0"    # Lcom/wmspanel/libstream/VideoListener21;

    .prologue
    .line 208
    iput-object p1, p0, Lcom/wmspanel/libstream/VideoListener21$4;->this$0:Lcom/wmspanel/libstream/VideoListener21;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 210
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener21$4;->this$0:Lcom/wmspanel/libstream/VideoListener21;

    iget-object v0, v0, Lcom/wmspanel/libstream/VideoListener21;->mCamera2:Landroid/hardware/camera2/CameraDevice;

    if-eqz v0, :cond_0

    .line 211
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener21$4;->this$0:Lcom/wmspanel/libstream/VideoListener21;

    iget-object v0, v0, Lcom/wmspanel/libstream/VideoListener21;->mCamera2:Landroid/hardware/camera2/CameraDevice;

    invoke-virtual {v0}, Landroid/hardware/camera2/CameraDevice;->close()V

    .line 213
    :cond_0
    iget-object v0, p0, Lcom/wmspanel/libstream/VideoListener21$4;->this$0:Lcom/wmspanel/libstream/VideoListener21;

    const/4 v1, 0x0

    iput-object v1, v0, Lcom/wmspanel/libstream/VideoListener21;->mCamera2:Landroid/hardware/camera2/CameraDevice;

    .line 214
    return-void
.end method
