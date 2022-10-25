.class Lcom/vk/stories/CreateAndEditStoryActivity$55;
.super Landroid/animation/AnimatorListenerAdapter;
.source "CreateAndEditStoryActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/stories/CreateAndEditStoryActivity;->showMasksPanel(Z)V
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
    .line 1717
    iput-object p1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$55;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 6
    .param p1, "animation"    # Landroid/animation/Animator;

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 1720
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$55;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    const/4 v1, 0x3

    new-array v1, v1, [Landroid/view/View;

    iget-object v2, p0, Lcom/vk/stories/CreateAndEditStoryActivity$55;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v2}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$2800(Lcom/vk/stories/CreateAndEditStoryActivity;)Landroid/view/View;

    move-result-object v2

    aput-object v2, v1, v4

    iget-object v2, p0, Lcom/vk/stories/CreateAndEditStoryActivity$55;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v2}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$5200(Lcom/vk/stories/CreateAndEditStoryActivity;)Landroid/widget/ImageView;

    move-result-object v2

    aput-object v2, v1, v5

    const/4 v2, 0x2

    iget-object v3, p0, Lcom/vk/stories/CreateAndEditStoryActivity$55;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v3}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$5300(Lcom/vk/stories/CreateAndEditStoryActivity;)Landroid/view/View;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$5400(Lcom/vk/stories/CreateAndEditStoryActivity;[Landroid/view/View;)V

    .line 1721
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$55;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0, v5, v4, v4}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$5500(Lcom/vk/stories/CreateAndEditStoryActivity;ZZZ)V

    .line 1722
    return-void
.end method
