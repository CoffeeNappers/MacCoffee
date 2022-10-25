.class Lcom/vk/stories/CreateAndEditStoryActivity$24;
.super Ljava/lang/Object;
.source "CreateAndEditStoryActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/stories/CreateAndEditStoryActivity;->initCameraViewPart()V
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
    .line 1005
    iput-object p1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$24;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "v1"    # Landroid/view/View;

    .prologue
    const/4 v2, 0x2

    .line 1008
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$24;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$2200(Lcom/vk/stories/CreateAndEditStoryActivity;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1018
    :goto_0
    return-void

    .line 1011
    :cond_0
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$24;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$2300(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vk/camera/camera1/Camera1View;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/camera/camera1/Camera1View;->getFlashMode()I

    move-result v0

    if-ne v0, v2, :cond_1

    .line 1012
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$24;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$2400(Lcom/vk/stories/CreateAndEditStoryActivity;)Landroid/widget/ImageView;

    move-result-object v0

    const v1, 0x7f0201b5

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 1013
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$24;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$2300(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vk/camera/camera1/Camera1View;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/vk/camera/camera1/Camera1View;->setFlashMode(I)V

    goto :goto_0

    .line 1015
    :cond_1
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$24;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$2400(Lcom/vk/stories/CreateAndEditStoryActivity;)Landroid/widget/ImageView;

    move-result-object v0

    const v1, 0x7f0201b6

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 1016
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$24;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$2300(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vk/camera/camera1/Camera1View;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcom/vk/camera/camera1/Camera1View;->setFlashMode(I)V

    goto :goto_0
.end method
