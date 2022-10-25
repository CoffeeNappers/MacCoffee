.class Lcom/vk/stories/CreateAndEditStoryActivity$76;
.super Landroid/animation/AnimatorListenerAdapter;
.source "CreateAndEditStoryActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/stories/CreateAndEditStoryActivity;->hideDeleteArea()V
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
    .line 2188
    iput-object p1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$76;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 2
    .param p1, "animation"    # Landroid/animation/Animator;

    .prologue
    .line 2191
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$76;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$7300(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vk/stories/view/StickerDeleteAreaView;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lcom/vk/stories/view/StickerDeleteAreaView;->setVisibility(I)V

    .line 2192
    return-void
.end method
