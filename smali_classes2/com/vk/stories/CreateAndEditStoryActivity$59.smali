.class Lcom/vk/stories/CreateAndEditStoryActivity$59;
.super Ljava/lang/Object;
.source "CreateAndEditStoryActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/stories/CreateAndEditStoryActivity;->initEditorPartView()V
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
    .line 1870
    iput-object p1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$59;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4
    .param p1, "view"    # Landroid/view/View;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 1873
    iget-object v3, p0, Lcom/vk/stories/CreateAndEditStoryActivity$59;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$59;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$5600(Lcom/vk/stories/CreateAndEditStoryActivity;)Z

    move-result v0

    if-nez v0, :cond_1

    move v0, v1

    :goto_0
    invoke-static {v3, v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$5602(Lcom/vk/stories/CreateAndEditStoryActivity;Z)Z

    .line 1874
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$59;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$1600(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vk/attachpicker/widget/TextureVideoView;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 1875
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$59;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$1600(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vk/attachpicker/widget/TextureVideoView;

    move-result-object v0

    iget-object v3, p0, Lcom/vk/stories/CreateAndEditStoryActivity$59;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v3}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$5600(Lcom/vk/stories/CreateAndEditStoryActivity;)Z

    move-result v3

    if-nez v3, :cond_2

    :goto_1
    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/widget/TextureVideoView;->setSound(Z)V

    .line 1877
    :cond_0
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$59;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$5600(Lcom/vk/stories/CreateAndEditStoryActivity;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 1878
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$59;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$5700(Lcom/vk/stories/CreateAndEditStoryActivity;)Landroid/widget/ImageView;

    move-result-object v0

    const v1, 0x7f0202ca

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 1882
    :goto_2
    return-void

    :cond_1
    move v0, v2

    .line 1873
    goto :goto_0

    :cond_2
    move v1, v2

    .line 1875
    goto :goto_1

    .line 1880
    :cond_3
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$59;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$5700(Lcom/vk/stories/CreateAndEditStoryActivity;)Landroid/widget/ImageView;

    move-result-object v0

    const v1, 0x7f02021b

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_2
.end method
