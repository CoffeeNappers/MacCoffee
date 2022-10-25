.class Lcom/vk/stories/view/StoryView$12;
.super Ljava/lang/Object;
.source "StoryView.java"

# interfaces
.implements Lcom/vk/imageloader/OnLoadCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/stories/view/StoryView;->openStory(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/stories/view/StoryView;


# direct methods
.method constructor <init>(Lcom/vk/stories/view/StoryView;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/stories/view/StoryView;

    .prologue
    .line 703
    iput-object p1, p0, Lcom/vk/stories/view/StoryView$12;->this$0:Lcom/vk/stories/view/StoryView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFailure()V
    .locals 1

    .prologue
    .line 715
    iget-object v0, p0, Lcom/vk/stories/view/StoryView$12;->this$0:Lcom/vk/stories/view/StoryView;

    invoke-static {v0}, Lcom/vk/stories/view/StoryView;->access$200(Lcom/vk/stories/view/StoryView;)V

    .line 716
    iget-object v0, p0, Lcom/vk/stories/view/StoryView$12;->this$0:Lcom/vk/stories/view/StoryView;

    invoke-static {v0}, Lcom/vk/stories/view/StoryView;->access$1500(Lcom/vk/stories/view/StoryView;)V

    .line 717
    return-void
.end method

.method public onSuccess(II)V
    .locals 2
    .param p1, "width"    # I
    .param p2, "height"    # I

    .prologue
    const/4 v1, 0x1

    .line 706
    iget-object v0, p0, Lcom/vk/stories/view/StoryView$12;->this$0:Lcom/vk/stories/view/StoryView;

    invoke-static {v0, v1}, Lcom/vk/stories/view/StoryView;->access$1902(Lcom/vk/stories/view/StoryView;Z)Z

    .line 707
    iget-object v0, p0, Lcom/vk/stories/view/StoryView$12;->this$0:Lcom/vk/stories/view/StoryView;

    invoke-virtual {v0}, Lcom/vk/stories/view/StoryView;->resetProgress()V

    .line 708
    iget-object v0, p0, Lcom/vk/stories/view/StoryView$12;->this$0:Lcom/vk/stories/view/StoryView;

    invoke-static {v0, v1}, Lcom/vk/stories/view/StoryView;->access$1800(Lcom/vk/stories/view/StoryView;Z)V

    .line 709
    iget-object v0, p0, Lcom/vk/stories/view/StoryView$12;->this$0:Lcom/vk/stories/view/StoryView;

    invoke-static {v0}, Lcom/vk/stories/view/StoryView;->access$200(Lcom/vk/stories/view/StoryView;)V

    .line 710
    iget-object v0, p0, Lcom/vk/stories/view/StoryView$12;->this$0:Lcom/vk/stories/view/StoryView;

    invoke-static {v0}, Lcom/vk/stories/view/StoryView;->access$300(Lcom/vk/stories/view/StoryView;)V

    .line 711
    return-void
.end method
