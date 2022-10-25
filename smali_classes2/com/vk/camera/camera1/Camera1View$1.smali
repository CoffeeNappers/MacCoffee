.class Lcom/vk/camera/camera1/Camera1View$1;
.super Ljava/lang/Object;
.source "Camera1View.java"

# interfaces
.implements Landroid/hardware/Camera$PictureCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/camera/camera1/Camera1View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/camera/camera1/Camera1View;


# direct methods
.method constructor <init>(Lcom/vk/camera/camera1/Camera1View;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/camera/camera1/Camera1View;

    .prologue
    .line 70
    iput-object p1, p0, Lcom/vk/camera/camera1/Camera1View$1;->this$0:Lcom/vk/camera/camera1/Camera1View;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPictureTaken([BLandroid/hardware/Camera;)V
    .locals 1
    .param p1, "data"    # [B
    .param p2, "camera"    # Landroid/hardware/Camera;

    .prologue
    .line 73
    iget-object v0, p0, Lcom/vk/camera/camera1/Camera1View$1;->this$0:Lcom/vk/camera/camera1/Camera1View;

    invoke-static {v0, p1}, Lcom/vk/camera/camera1/Camera1View;->access$000(Lcom/vk/camera/camera1/Camera1View;[B)V

    .line 74
    return-void
.end method
