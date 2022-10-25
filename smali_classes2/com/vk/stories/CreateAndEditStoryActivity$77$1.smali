.class Lcom/vk/stories/CreateAndEditStoryActivity$77$1;
.super Lcom/vk/camera/camera1/Camera1View;
.source "CreateAndEditStoryActivity.java"


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
.method constructor <init>(Lcom/vk/stories/CreateAndEditStoryActivity$77;Landroid/content/Context;)V
    .locals 0
    .param p1, "this$1"    # Lcom/vk/stories/CreateAndEditStoryActivity$77;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 2228
    iput-object p1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$77$1;->this$1:Lcom/vk/stories/CreateAndEditStoryActivity$77;

    invoke-direct {p0, p2}, Lcom/vk/camera/camera1/Camera1View;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method protected onSingleTap(II)V
    .locals 2
    .param p1, "x"    # I
    .param p2, "y"    # I

    .prologue
    .line 2231
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$77$1;->this$1:Lcom/vk/stories/CreateAndEditStoryActivity$77;

    iget-object v0, v0, Lcom/vk/stories/CreateAndEditStoryActivity$77;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$3100(Lcom/vk/stories/CreateAndEditStoryActivity;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2232
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$77$1;->this$1:Lcom/vk/stories/CreateAndEditStoryActivity$77;

    iget-object v0, v0, Lcom/vk/stories/CreateAndEditStoryActivity$77;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$3200(Lcom/vk/stories/CreateAndEditStoryActivity;Z)V

    .line 2236
    :goto_0
    return-void

    .line 2234
    :cond_0
    invoke-super {p0, p1, p2}, Lcom/vk/camera/camera1/Camera1View;->onSingleTap(II)V

    goto :goto_0
.end method
