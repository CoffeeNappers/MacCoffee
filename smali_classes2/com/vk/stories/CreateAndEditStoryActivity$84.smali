.class Lcom/vk/stories/CreateAndEditStoryActivity$84;
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

.field final synthetic val$onFinish:Ljava/lang/Runnable;


# direct methods
.method constructor <init>(Lcom/vk/stories/CreateAndEditStoryActivity;Ljava/lang/Runnable;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 2812
    iput-object p1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$84;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    iput-object p2, p0, Lcom/vk/stories/CreateAndEditStoryActivity$84;->val$onFinish:Ljava/lang/Runnable;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 3
    .param p1, "animation"    # Landroid/animation/Animator;

    .prologue
    const/4 v2, 0x0

    .line 2815
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$84;->val$onFinish:Ljava/lang/Runnable;

    if-eqz v0, :cond_0

    .line 2816
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$84;->val$onFinish:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 2818
    :cond_0
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$84;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    const/4 v1, 0x1

    invoke-static {v0, v1, v2, v2}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$5500(Lcom/vk/stories/CreateAndEditStoryActivity;ZZZ)V

    .line 2819
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$84;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$10400(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    .line 2820
    return-void
.end method
