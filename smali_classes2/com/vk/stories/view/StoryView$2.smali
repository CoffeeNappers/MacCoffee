.class Lcom/vk/stories/view/StoryView$2;
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
    .line 94
    iput-object p1, p0, Lcom/vk/stories/view/StoryView$2;->this$0:Lcom/vk/stories/view/StoryView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 97
    iget-object v0, p0, Lcom/vk/stories/view/StoryView$2;->this$0:Lcom/vk/stories/view/StoryView;

    invoke-static {v0}, Lcom/vk/stories/view/StoryView;->access$000(Lcom/vk/stories/view/StoryView;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 98
    iget-object v0, p0, Lcom/vk/stories/view/StoryView$2;->this$0:Lcom/vk/stories/view/StoryView;

    invoke-static {v0}, Lcom/vk/stories/view/StoryView;->access$900(Lcom/vk/stories/view/StoryView;)Lcom/vk/core/util/ElapsedTimeCounter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/core/util/ElapsedTimeCounter;->start()V

    .line 99
    iget-object v0, p0, Lcom/vk/stories/view/StoryView$2;->this$0:Lcom/vk/stories/view/StoryView;

    invoke-static {v0}, Lcom/vk/stories/view/StoryView;->access$1000(Lcom/vk/stories/view/StoryView;)Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lcom/vk/stories/view/StoryView$2;->this$0:Lcom/vk/stories/view/StoryView;

    invoke-static {v1}, Lcom/vk/stories/view/StoryView;->access$1000(Lcom/vk/stories/view/StoryView;)Landroid/os/Handler;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {v1, v2}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object v1

    const-wide/16 v2, 0x10

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 100
    iget-object v0, p0, Lcom/vk/stories/view/StoryView$2;->this$0:Lcom/vk/stories/view/StoryView;

    invoke-static {v0}, Lcom/vk/stories/view/StoryView;->access$1100(Lcom/vk/stories/view/StoryView;)Lcom/vk/core/view/SimpleVideoView;

    move-result-object v0

    iget-object v1, p0, Lcom/vk/stories/view/StoryView$2;->this$0:Lcom/vk/stories/view/StoryView;

    invoke-virtual {v1}, Lcom/vk/stories/view/StoryView;->isCurrentPage()Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/vk/core/view/SimpleVideoView;->setPlayWhenReady(Z)V

    .line 102
    :cond_0
    return-void
.end method
