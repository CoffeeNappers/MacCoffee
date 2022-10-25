.class Lcom/vk/media/camera/CameraRender$1;
.super Ljava/lang/Object;
.source "CameraRender.java"

# interfaces
.implements Lcom/vk/media/camera/CameraUtils$Recorder$OnRecordFrame;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/media/camera/CameraRender;
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
    .line 36
    iput-object p1, p0, Lcom/vk/media/camera/CameraRender$1;->this$0:Lcom/vk/media/camera/CameraRender;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onRecord(Lcom/vk/media/camera/CameraUtils$Frame;)J
    .locals 2
    .param p1, "frame"    # Lcom/vk/media/camera/CameraUtils$Frame;

    .prologue
    .line 39
    iget-object v0, p0, Lcom/vk/media/camera/CameraRender$1;->this$0:Lcom/vk/media/camera/CameraRender;

    iget-object v1, p0, Lcom/vk/media/camera/CameraRender$1;->this$0:Lcom/vk/media/camera/CameraRender;

    invoke-static {v1}, Lcom/vk/media/camera/CameraRender;->access$000(Lcom/vk/media/camera/CameraRender;)Lcom/vk/media/utils/RenderDrawable$Flip;

    move-result-object v1

    invoke-static {v0, p1, v1}, Lcom/vk/media/camera/CameraRender;->access$100(Lcom/vk/media/camera/CameraRender;Lcom/vk/media/camera/CameraUtils$Frame;Lcom/vk/media/utils/RenderDrawable$Flip;)J

    move-result-wide v0

    return-wide v0
.end method
