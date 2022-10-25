.class Lcom/vk/stories/CreateAndEditStoryActivity$86;
.super Landroid/animation/AnimatorListenerAdapter;
.source "CreateAndEditStoryActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/stories/CreateAndEditStoryActivity;->openDrawing()V
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
    .line 2876
    iput-object p1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$86;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 3
    .param p1, "animation"    # Landroid/animation/Animator;

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 2879
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$86;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0, v1, v2}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$10100(Lcom/vk/stories/CreateAndEditStoryActivity;ZZ)V

    .line 2880
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$86;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0, v1, v1, v2}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$5500(Lcom/vk/stories/CreateAndEditStoryActivity;ZZZ)V

    .line 2881
    return-void
.end method
