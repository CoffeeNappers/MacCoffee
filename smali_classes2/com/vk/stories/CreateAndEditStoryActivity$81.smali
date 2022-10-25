.class Lcom/vk/stories/CreateAndEditStoryActivity$81;
.super Landroid/animation/AnimatorListenerAdapter;
.source "CreateAndEditStoryActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/stories/CreateAndEditStoryActivity;->cameraToEditor(Z)V
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
    .line 2693
    iput-object p1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$81;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 7
    .param p1, "animation"    # Landroid/animation/Animator;

    .prologue
    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 2696
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$81;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$8900(Lcom/vk/stories/CreateAndEditStoryActivity;)Ljava/io/File;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 2697
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$81;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$5700(Lcom/vk/stories/CreateAndEditStoryActivity;)Landroid/widget/ImageView;

    move-result-object v0

    const v1, 0x7f02021b

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 2698
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$81;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    new-array v1, v6, [Landroid/view/View;

    iget-object v2, p0, Lcom/vk/stories/CreateAndEditStoryActivity$81;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v2}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$5700(Lcom/vk/stories/CreateAndEditStoryActivity;)Landroid/widget/ImageView;

    move-result-object v2

    aput-object v2, v1, v3

    iget-object v2, p0, Lcom/vk/stories/CreateAndEditStoryActivity$81;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v2}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$9500(Lcom/vk/stories/CreateAndEditStoryActivity;)Landroid/view/View;

    move-result-object v2

    aput-object v2, v1, v4

    iget-object v2, p0, Lcom/vk/stories/CreateAndEditStoryActivity$81;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v2}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$9600(Lcom/vk/stories/CreateAndEditStoryActivity;)Landroid/widget/FrameLayout;

    move-result-object v2

    aput-object v2, v1, v5

    invoke-static {v0, v1}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$9700(Lcom/vk/stories/CreateAndEditStoryActivity;[Landroid/view/View;)V

    .line 2702
    :goto_0
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$81;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    const/4 v1, 0x6

    new-array v1, v1, [Landroid/view/View;

    iget-object v2, p0, Lcom/vk/stories/CreateAndEditStoryActivity$81;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v2}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$9800(Lcom/vk/stories/CreateAndEditStoryActivity;)Landroid/widget/ImageView;

    move-result-object v2

    aput-object v2, v1, v3

    iget-object v2, p0, Lcom/vk/stories/CreateAndEditStoryActivity$81;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v2}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$2400(Lcom/vk/stories/CreateAndEditStoryActivity;)Landroid/widget/ImageView;

    move-result-object v2

    aput-object v2, v1, v4

    iget-object v2, p0, Lcom/vk/stories/CreateAndEditStoryActivity$81;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v2}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$5200(Lcom/vk/stories/CreateAndEditStoryActivity;)Landroid/widget/ImageView;

    move-result-object v2

    aput-object v2, v1, v5

    iget-object v2, p0, Lcom/vk/stories/CreateAndEditStoryActivity$81;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v2}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$2800(Lcom/vk/stories/CreateAndEditStoryActivity;)Landroid/view/View;

    move-result-object v2

    aput-object v2, v1, v6

    const/4 v2, 0x4

    iget-object v3, p0, Lcom/vk/stories/CreateAndEditStoryActivity$81;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    .line 2703
    invoke-static {v3}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$5300(Lcom/vk/stories/CreateAndEditStoryActivity;)Landroid/view/View;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x5

    iget-object v3, p0, Lcom/vk/stories/CreateAndEditStoryActivity$81;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v3}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$9900(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vk/stories/view/VerticalPagerIndicator;

    move-result-object v3

    aput-object v3, v1, v2

    .line 2702
    invoke-static {v0, v1}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$5400(Lcom/vk/stories/CreateAndEditStoryActivity;[Landroid/view/View;)V

    .line 2704
    return-void

    .line 2700
    :cond_0
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$81;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    new-array v1, v5, [Landroid/view/View;

    iget-object v2, p0, Lcom/vk/stories/CreateAndEditStoryActivity$81;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v2}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$9500(Lcom/vk/stories/CreateAndEditStoryActivity;)Landroid/view/View;

    move-result-object v2

    aput-object v2, v1, v3

    iget-object v2, p0, Lcom/vk/stories/CreateAndEditStoryActivity$81;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v2}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$9600(Lcom/vk/stories/CreateAndEditStoryActivity;)Landroid/widget/FrameLayout;

    move-result-object v2

    aput-object v2, v1, v4

    invoke-static {v0, v1}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$9700(Lcom/vk/stories/CreateAndEditStoryActivity;[Landroid/view/View;)V

    goto :goto_0
.end method
