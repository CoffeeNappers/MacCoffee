.class Lcom/vk/stories/view/StoryView$3;
.super Ljava/lang/Object;
.source "StoryView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/stories/view/StoryView;
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
    .line 105
    iput-object p1, p0, Lcom/vk/stories/view/StoryView$3;->this$0:Lcom/vk/stories/view/StoryView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 108
    iget-object v0, p0, Lcom/vk/stories/view/StoryView$3;->this$0:Lcom/vk/stories/view/StoryView;

    invoke-static {v0}, Lcom/vk/stories/view/StoryView;->access$900(Lcom/vk/stories/view/StoryView;)Lcom/vk/core/util/ElapsedTimeCounter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/core/util/ElapsedTimeCounter;->stop()V

    .line 109
    iget-object v0, p0, Lcom/vk/stories/view/StoryView$3;->this$0:Lcom/vk/stories/view/StoryView;

    invoke-static {v0}, Lcom/vk/stories/view/StoryView;->access$1000(Lcom/vk/stories/view/StoryView;)Landroid/os/Handler;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 110
    iget-object v0, p0, Lcom/vk/stories/view/StoryView$3;->this$0:Lcom/vk/stories/view/StoryView;

    invoke-static {v0}, Lcom/vk/stories/view/StoryView;->access$1100(Lcom/vk/stories/view/StoryView;)Lcom/vk/core/view/SimpleVideoView;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/vk/core/view/SimpleVideoView;->setPlayWhenReady(Z)V

    .line 111
    return-void
.end method
