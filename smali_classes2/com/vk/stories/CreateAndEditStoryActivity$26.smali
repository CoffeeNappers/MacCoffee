.class Lcom/vk/stories/CreateAndEditStoryActivity$26;
.super Ljava/lang/Object;
.source "CreateAndEditStoryActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/stories/CreateAndEditStoryActivity;->initSwitchCameraButton()V
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
    .line 1046
    iput-object p1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$26;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 1049
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$26;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$2200(Lcom/vk/stories/CreateAndEditStoryActivity;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1059
    :cond_0
    :goto_0
    return-void

    .line 1053
    :cond_1
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$26;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$2500(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vk/core/util/TimeoutLock;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/core/util/TimeoutLock;->isLocked()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$26;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$100(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;

    move-result-object v0

    sget-object v1, Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;->CAMERA:Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;

    if-ne v0, v1, :cond_0

    .line 1056
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$26;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$2500(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vk/core/util/TimeoutLock;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/core/util/TimeoutLock;->lock()V

    .line 1057
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$26;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$2300(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vk/camera/camera1/Camera1View;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/camera/camera1/Camera1View;->changeCamera()V

    .line 1058
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$26;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$2600(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    goto :goto_0
.end method
