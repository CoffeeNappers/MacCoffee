.class Lcom/vk/stories/CreateAndEditStoryActivity$83;
.super Landroid/animation/AnimatorListenerAdapter;
.source "CreateAndEditStoryActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/stories/CreateAndEditStoryActivity;->editorToCamera(Ljava/lang/Runnable;)V
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
    .line 2767
    iput-object p1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$83;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 6
    .param p1, "animation"    # Landroid/animation/Animator;

    .prologue
    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 2770
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$83;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    new-array v1, v5, [Landroid/view/View;

    iget-object v2, p0, Lcom/vk/stories/CreateAndEditStoryActivity$83;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v2}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$9800(Lcom/vk/stories/CreateAndEditStoryActivity;)Landroid/widget/ImageView;

    move-result-object v2

    aput-object v2, v1, v3

    iget-object v2, p0, Lcom/vk/stories/CreateAndEditStoryActivity$83;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v2}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$5200(Lcom/vk/stories/CreateAndEditStoryActivity;)Landroid/widget/ImageView;

    move-result-object v2

    aput-object v2, v1, v4

    invoke-static {v0, v1}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$9700(Lcom/vk/stories/CreateAndEditStoryActivity;[Landroid/view/View;)V

    .line 2771
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$83;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    const/4 v1, 0x3

    new-array v1, v1, [Landroid/view/View;

    iget-object v2, p0, Lcom/vk/stories/CreateAndEditStoryActivity$83;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v2}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$5700(Lcom/vk/stories/CreateAndEditStoryActivity;)Landroid/widget/ImageView;

    move-result-object v2

    aput-object v2, v1, v3

    iget-object v2, p0, Lcom/vk/stories/CreateAndEditStoryActivity$83;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v2}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$9500(Lcom/vk/stories/CreateAndEditStoryActivity;)Landroid/view/View;

    move-result-object v2

    aput-object v2, v1, v4

    iget-object v2, p0, Lcom/vk/stories/CreateAndEditStoryActivity$83;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v2}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$9600(Lcom/vk/stories/CreateAndEditStoryActivity;)Landroid/widget/FrameLayout;

    move-result-object v2

    aput-object v2, v1, v5

    invoke-static {v0, v1}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$5400(Lcom/vk/stories/CreateAndEditStoryActivity;[Landroid/view/View;)V

    .line 2773
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$83;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$10200(Lcom/vk/stories/CreateAndEditStoryActivity;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2774
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$83;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    new-array v1, v4, [Landroid/view/View;

    iget-object v2, p0, Lcom/vk/stories/CreateAndEditStoryActivity$83;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v2}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$2400(Lcom/vk/stories/CreateAndEditStoryActivity;)Landroid/widget/ImageView;

    move-result-object v2

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$9700(Lcom/vk/stories/CreateAndEditStoryActivity;[Landroid/view/View;)V

    .line 2779
    :goto_0
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$83;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$3000(Lcom/vk/stories/CreateAndEditStoryActivity;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 2780
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$83;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    new-array v1, v4, [Landroid/view/View;

    iget-object v2, p0, Lcom/vk/stories/CreateAndEditStoryActivity$83;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v2}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$5300(Lcom/vk/stories/CreateAndEditStoryActivity;)Landroid/view/View;

    move-result-object v2

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$9700(Lcom/vk/stories/CreateAndEditStoryActivity;[Landroid/view/View;)V

    .line 2785
    :goto_1
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$83;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$3000(Lcom/vk/stories/CreateAndEditStoryActivity;)Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$83;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$10300(Lcom/vk/stories/CreateAndEditStoryActivity;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 2786
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$83;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    new-array v1, v4, [Landroid/view/View;

    iget-object v2, p0, Lcom/vk/stories/CreateAndEditStoryActivity$83;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v2}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$9900(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vk/stories/view/VerticalPagerIndicator;

    move-result-object v2

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$9700(Lcom/vk/stories/CreateAndEditStoryActivity;[Landroid/view/View;)V

    .line 2791
    :goto_2
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$83;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$2700(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vk/attachpicker/mediastore/MediaStoreEntry;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 2792
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$83;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    new-array v1, v4, [Landroid/view/View;

    iget-object v2, p0, Lcom/vk/stories/CreateAndEditStoryActivity$83;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v2}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$2800(Lcom/vk/stories/CreateAndEditStoryActivity;)Landroid/view/View;

    move-result-object v2

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$9700(Lcom/vk/stories/CreateAndEditStoryActivity;[Landroid/view/View;)V

    .line 2796
    :goto_3
    return-void

    .line 2776
    :cond_0
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$83;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    new-array v1, v4, [Landroid/view/View;

    iget-object v2, p0, Lcom/vk/stories/CreateAndEditStoryActivity$83;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v2}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$2400(Lcom/vk/stories/CreateAndEditStoryActivity;)Landroid/widget/ImageView;

    move-result-object v2

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$5400(Lcom/vk/stories/CreateAndEditStoryActivity;[Landroid/view/View;)V

    goto :goto_0

    .line 2782
    :cond_1
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$83;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    new-array v1, v4, [Landroid/view/View;

    iget-object v2, p0, Lcom/vk/stories/CreateAndEditStoryActivity$83;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v2}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$5300(Lcom/vk/stories/CreateAndEditStoryActivity;)Landroid/view/View;

    move-result-object v2

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$5400(Lcom/vk/stories/CreateAndEditStoryActivity;[Landroid/view/View;)V

    goto :goto_1

    .line 2788
    :cond_2
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$83;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    new-array v1, v4, [Landroid/view/View;

    iget-object v2, p0, Lcom/vk/stories/CreateAndEditStoryActivity$83;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v2}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$9900(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vk/stories/view/VerticalPagerIndicator;

    move-result-object v2

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$5400(Lcom/vk/stories/CreateAndEditStoryActivity;[Landroid/view/View;)V

    goto :goto_2

    .line 2794
    :cond_3
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$83;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    new-array v1, v4, [Landroid/view/View;

    iget-object v2, p0, Lcom/vk/stories/CreateAndEditStoryActivity$83;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v2}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$2800(Lcom/vk/stories/CreateAndEditStoryActivity;)Landroid/view/View;

    move-result-object v2

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$5400(Lcom/vk/stories/CreateAndEditStoryActivity;[Landroid/view/View;)V

    goto :goto_3
.end method
