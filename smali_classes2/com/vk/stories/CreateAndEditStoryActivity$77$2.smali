.class Lcom/vk/stories/CreateAndEditStoryActivity$77$2;
.super Ljava/lang/Object;
.source "CreateAndEditStoryActivity.java"

# interfaces
.implements Lcom/vk/camera/CameraObject$OnRecordingCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/stories/CreateAndEditStoryActivity$77;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/vk/stories/CreateAndEditStoryActivity$77;


# direct methods
.method constructor <init>(Lcom/vk/stories/CreateAndEditStoryActivity$77;)V
    .locals 0
    .param p1, "this$1"    # Lcom/vk/stories/CreateAndEditStoryActivity$77;

    .prologue
    .line 2241
    iput-object p1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$77$2;->this$1:Lcom/vk/stories/CreateAndEditStoryActivity$77;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCancel()V
    .locals 3

    .prologue
    const/4 v2, 0x1

    .line 2255
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$77$2;->this$1:Lcom/vk/stories/CreateAndEditStoryActivity$77;

    iget-object v0, v0, Lcom/vk/stories/CreateAndEditStoryActivity$77;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$8000(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vk/stories/view/ShutterButton;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/vk/stories/view/ShutterButton;->setRedProgress(F)V

    .line 2256
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$77$2;->this$1:Lcom/vk/stories/CreateAndEditStoryActivity$77;

    iget-object v0, v0, Lcom/vk/stories/CreateAndEditStoryActivity$77;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    const/4 v1, 0x0

    invoke-static {v0, v2, v1}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$8100(Lcom/vk/stories/CreateAndEditStoryActivity;ZZ)V

    .line 2257
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$77$2;->this$1:Lcom/vk/stories/CreateAndEditStoryActivity$77;

    iget-object v0, v0, Lcom/vk/stories/CreateAndEditStoryActivity$77;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$8000(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vk/stories/view/ShutterButton;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcom/vk/stories/view/ShutterButton;->toPhotoShutter(Z)Landroid/animation/AnimatorSet;

    .line 2258
    return-void
.end method

.method public onError(II)V
    .locals 3
    .param p1, "what"    # I
    .param p2, "extra"    # I

    .prologue
    .line 2274
    const/4 v0, 0x2

    if-ne p2, v0, :cond_0

    .line 2276
    invoke-static {}, Lcom/vk/camera/CameraPrefs;->instance()Lcom/vk/camera/CameraPrefs;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/vk/camera/CameraPrefs;->useMediaRecorder(Z)V

    .line 2277
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$77$2;->this$1:Lcom/vk/stories/CreateAndEditStoryActivity$77;

    iget-object v0, v0, Lcom/vk/stories/CreateAndEditStoryActivity$77;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-virtual {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->finish()V

    .line 2279
    :cond_0
    invoke-static {}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$8400()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "onError what="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ", extra="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 2280
    return-void
.end method

.method public onFinish(Ljava/io/File;)V
    .locals 1
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 2262
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$77$2;->this$1:Lcom/vk/stories/CreateAndEditStoryActivity$77;

    iget-object v0, v0, Lcom/vk/stories/CreateAndEditStoryActivity$77;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0, p1}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$8200(Lcom/vk/stories/CreateAndEditStoryActivity;Ljava/io/File;)V

    .line 2263
    return-void
.end method

.method public onInfo(II)V
    .locals 1
    .param p1, "what"    # I
    .param p2, "extra"    # I

    .prologue
    .line 2267
    const/16 v0, 0x320

    if-ne p1, v0, :cond_0

    .line 2268
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$77$2;->this$1:Lcom/vk/stories/CreateAndEditStoryActivity$77;

    iget-object v0, v0, Lcom/vk/stories/CreateAndEditStoryActivity$77;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$8300(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    .line 2270
    :cond_0
    return-void
.end method

.method public onProgress(JJ)V
    .locals 3
    .param p1, "recorded"    # J
    .param p3, "max"    # J

    .prologue
    .line 2249
    long-to-float v1, p1

    long-to-float v2, p3

    div-float v0, v1, v2

    .line 2250
    .local v0, "progress":F
    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$77$2;->this$1:Lcom/vk/stories/CreateAndEditStoryActivity$77;

    iget-object v1, v1, Lcom/vk/stories/CreateAndEditStoryActivity$77;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v1}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$8000(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vk/stories/view/ShutterButton;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/vk/stories/view/ShutterButton;->setRedProgress(F)V

    .line 2251
    return-void
.end method

.method public onStart()V
    .locals 2

    .prologue
    .line 2244
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$77$2;->this$1:Lcom/vk/stories/CreateAndEditStoryActivity$77;

    iget-object v0, v0, Lcom/vk/stories/CreateAndEditStoryActivity$77;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$8000(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vk/stories/view/ShutterButton;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/vk/stories/view/ShutterButton;->setRedProgress(F)V

    .line 2245
    return-void
.end method
