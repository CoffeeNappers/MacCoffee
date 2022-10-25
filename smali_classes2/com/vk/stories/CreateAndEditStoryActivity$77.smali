.class Lcom/vk/stories/CreateAndEditStoryActivity$77;
.super Ljava/lang/Object;
.source "CreateAndEditStoryActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/stories/CreateAndEditStoryActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/stories/CreateAndEditStoryActivity;


# direct methods
.method constructor <init>(Lcom/vk/stories/CreateAndEditStoryActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 2222
    iput-object p1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$77;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 2225
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$77;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$7800(Lcom/vk/stories/CreateAndEditStoryActivity;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2289
    :goto_0
    return-void

    .line 2228
    :cond_0
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$77;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    new-instance v1, Lcom/vk/stories/CreateAndEditStoryActivity$77$1;

    iget-object v2, p0, Lcom/vk/stories/CreateAndEditStoryActivity$77;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-direct {v1, p0, v2}, Lcom/vk/stories/CreateAndEditStoryActivity$77$1;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity$77;Landroid/content/Context;)V

    invoke-static {v0, v1}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$2302(Lcom/vk/stories/CreateAndEditStoryActivity;Lcom/vk/camera/camera1/Camera1View;)Lcom/vk/camera/camera1/Camera1View;

    .line 2238
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$77;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$2300(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vk/camera/camera1/Camera1View;

    move-result-object v0

    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$77;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v1}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$7900(Lcom/vk/stories/CreateAndEditStoryActivity;)Landroid/view/View$OnTouchListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/camera/camera1/Camera1View;->setExternalTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 2239
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$77;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$2300(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vk/camera/camera1/Camera1View;

    move-result-object v0

    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$77;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-virtual {v0, v1}, Lcom/vk/camera/camera1/Camera1View;->setOnCameraResultListener(Lcom/vk/camera/CameraObject$OnPhotoResultListener;)V

    .line 2240
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$77;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$2300(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vk/camera/camera1/Camera1View;

    move-result-object v0

    const-wide/16 v2, 0x3a98

    invoke-virtual {v0, v2, v3}, Lcom/vk/camera/camera1/Camera1View;->setMaxRecordingLengthMs(J)V

    .line 2241
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$77;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$2300(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vk/camera/camera1/Camera1View;

    move-result-object v0

    new-instance v1, Lcom/vk/stories/CreateAndEditStoryActivity$77$2;

    invoke-direct {v1, p0}, Lcom/vk/stories/CreateAndEditStoryActivity$77$2;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity$77;)V

    invoke-virtual {v0, v1}, Lcom/vk/camera/camera1/Camera1View;->setRecordingCallback(Lcom/vk/camera/CameraObject$OnRecordingCallback;)V

    .line 2282
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$77;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$8500(Lcom/vk/stories/CreateAndEditStoryActivity;)Landroid/widget/FrameLayout;

    move-result-object v0

    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$77;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v1}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$2300(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vk/camera/camera1/Camera1View;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 2283
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$77;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    new-instance v1, Lcom/vk/stories/CreateAndEditStoryActivity$77$3;

    invoke-direct {v1, p0}, Lcom/vk/stories/CreateAndEditStoryActivity$77$3;-><init>(Lcom/vk/stories/CreateAndEditStoryActivity$77;)V

    const-wide/16 v2, 0x12c

    invoke-virtual {v0, v1, v2, v3}, Lcom/vk/stories/CreateAndEditStoryActivity;->postDelayed(Ljava/lang/Runnable;J)V

    goto :goto_0
.end method
