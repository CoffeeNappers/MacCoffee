.class Lcom/vk/stories/CreateAndEditStoryActivity$79;
.super Ljava/lang/Object;
.source "CreateAndEditStoryActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/stories/CreateAndEditStoryActivity;->onVideoFileReady(Ljava/io/File;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

.field final synthetic val$video:Ljava/io/File;


# direct methods
.method constructor <init>(Lcom/vk/stories/CreateAndEditStoryActivity;Ljava/io/File;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 2343
    iput-object p1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$79;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    iput-object p2, p0, Lcom/vk/stories/CreateAndEditStoryActivity$79;->val$video:Ljava/io/File;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 2346
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$79;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$900(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    .line 2347
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$79;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$79;->val$video:Ljava/io/File;

    invoke-static {v0, v1}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$8902(Lcom/vk/stories/CreateAndEditStoryActivity;Ljava/io/File;)Ljava/io/File;

    .line 2348
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$79;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {}, Lcom/vk/camera/camera1/CameraHolder;->instance()Lcom/vk/camera/camera1/CameraHolder;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vk/camera/camera1/CameraHolder;->currentCameraFrontal()Z

    move-result v1

    invoke-static {v0, v1}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$9002(Lcom/vk/stories/CreateAndEditStoryActivity;Z)Z

    .line 2349
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$79;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$5602(Lcom/vk/stories/CreateAndEditStoryActivity;Z)Z

    .line 2350
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$79;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$8700(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    .line 2351
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$79;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$8800(Lcom/vk/stories/CreateAndEditStoryActivity;Z)V

    .line 2352
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$79;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$8600(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    .line 2353
    return-void
.end method
