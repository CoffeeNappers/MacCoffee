.class Lcom/vk/stories/CreateAndEditStoryActivity$80;
.super Landroid/animation/AnimatorListenerAdapter;
.source "CreateAndEditStoryActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/stories/CreateAndEditStoryActivity;->cameraActionStartRecording()V
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
    .line 2373
    iput-object p1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$80;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1
    .param p1, "animation"    # Landroid/animation/Animator;

    .prologue
    .line 2376
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$80;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$9100(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    .line 2377
    return-void
.end method
