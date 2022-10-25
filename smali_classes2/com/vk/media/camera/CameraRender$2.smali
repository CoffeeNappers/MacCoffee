.class Lcom/vk/media/camera/CameraRender$2;
.super Ljava/lang/Object;
.source "CameraRender.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/media/camera/CameraRender;->initProfile(Landroid/media/CamcorderProfile;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/media/camera/CameraRender;


# direct methods
.method constructor <init>(Lcom/vk/media/camera/CameraRender;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/media/camera/CameraRender;

    .prologue
    .line 82
    iput-object p1, p0, Lcom/vk/media/camera/CameraRender$2;->this$0:Lcom/vk/media/camera/CameraRender;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 85
    iget-object v0, p0, Lcom/vk/media/camera/CameraRender$2;->this$0:Lcom/vk/media/camera/CameraRender;

    iget-object v0, v0, Lcom/vk/media/camera/CameraRender;->mRecorder:Lcom/vk/media/camera/CameraRecorder;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vk/media/camera/CameraRender$2;->this$0:Lcom/vk/media/camera/CameraRender;

    iget-object v0, v0, Lcom/vk/media/camera/CameraRender;->mRecorder:Lcom/vk/media/camera/CameraRecorder;

    invoke-virtual {v0}, Lcom/vk/media/camera/CameraRecorder;->useExternalRecorder()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 86
    iget-object v0, p0, Lcom/vk/media/camera/CameraRender$2;->this$0:Lcom/vk/media/camera/CameraRender;

    iget-object v0, v0, Lcom/vk/media/camera/CameraRender;->mRecorder:Lcom/vk/media/camera/CameraRecorder;

    iget-object v1, p0, Lcom/vk/media/camera/CameraRender$2;->this$0:Lcom/vk/media/camera/CameraRender;

    invoke-static {v1}, Lcom/vk/media/camera/CameraRender;->access$200(Lcom/vk/media/camera/CameraRender;)Lcom/vk/media/utils/grafika/EglCore;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/media/camera/CameraRecorder;->createSurface(Lcom/vk/media/utils/grafika/EglCore;)V

    .line 88
    :cond_0
    return-void
.end method
