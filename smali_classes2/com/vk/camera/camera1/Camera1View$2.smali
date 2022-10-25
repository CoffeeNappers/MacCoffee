.class Lcom/vk/camera/camera1/Camera1View$2;
.super Ljava/lang/Object;
.source "Camera1View.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/camera/camera1/Camera1View;->processJpeg([B)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/camera/camera1/Camera1View;

.field final synthetic val$jpegData:[B


# direct methods
.method constructor <init>(Lcom/vk/camera/camera1/Camera1View;[B)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/camera/camera1/Camera1View;

    .prologue
    .line 633
    iput-object p1, p0, Lcom/vk/camera/camera1/Camera1View$2;->this$0:Lcom/vk/camera/camera1/Camera1View;

    iput-object p2, p0, Lcom/vk/camera/camera1/Camera1View$2;->val$jpegData:[B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 636
    iget-object v0, p0, Lcom/vk/camera/camera1/Camera1View$2;->this$0:Lcom/vk/camera/camera1/Camera1View;

    invoke-static {v0}, Lcom/vk/camera/camera1/Camera1View;->access$100(Lcom/vk/camera/camera1/Camera1View;)Lcom/vk/camera/CameraObject$OnPhotoResultListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 637
    iget-object v0, p0, Lcom/vk/camera/camera1/Camera1View$2;->this$0:Lcom/vk/camera/camera1/Camera1View;

    invoke-static {v0}, Lcom/vk/camera/camera1/Camera1View;->access$100(Lcom/vk/camera/camera1/Camera1View;)Lcom/vk/camera/CameraObject$OnPhotoResultListener;

    move-result-object v0

    iget-object v1, p0, Lcom/vk/camera/camera1/Camera1View$2;->val$jpegData:[B

    invoke-interface {v0, v1}, Lcom/vk/camera/CameraObject$OnPhotoResultListener;->onReady([B)V

    .line 639
    :cond_0
    return-void
.end method
