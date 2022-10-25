.class Lcom/vk/stories/view/StoryView$1;
.super Landroid/os/Handler;
.source "StoryView.java"


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
.method constructor <init>(Lcom/vk/stories/view/StoryView;Landroid/os/Looper;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/stories/view/StoryView;
    .param p2, "x0"    # Landroid/os/Looper;

    .prologue
    .line 62
    iput-object p1, p0, Lcom/vk/stories/view/StoryView$1;->this$0:Lcom/vk/stories/view/StoryView;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 4
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 65
    iget-object v1, p0, Lcom/vk/stories/view/StoryView$1;->this$0:Lcom/vk/stories/view/StoryView;

    invoke-static {v1}, Lcom/vk/stories/view/StoryView;->access$000(Lcom/vk/stories/view/StoryView;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 66
    iget-object v1, p0, Lcom/vk/stories/view/StoryView$1;->this$0:Lcom/vk/stories/view/StoryView;

    invoke-virtual {v1}, Lcom/vk/stories/view/StoryView;->pause()V

    .line 91
    :goto_0
    return-void

    .line 72
    :cond_0
    :try_start_0
    iget-object v1, p0, Lcom/vk/stories/view/StoryView$1;->this$0:Lcom/vk/stories/view/StoryView;

    invoke-static {v1}, Lcom/vk/stories/view/StoryView;->access$100(Lcom/vk/stories/view/StoryView;)F

    move-result v0

    .line 73
    .local v0, "progress":F
    const/4 v1, 0x0

    cmpl-float v1, v0, v1

    if-lez v1, :cond_1

    .line 74
    iget-object v1, p0, Lcom/vk/stories/view/StoryView$1;->this$0:Lcom/vk/stories/view/StoryView;

    invoke-static {v1}, Lcom/vk/stories/view/StoryView;->access$200(Lcom/vk/stories/view/StoryView;)V

    .line 75
    iget-object v1, p0, Lcom/vk/stories/view/StoryView$1;->this$0:Lcom/vk/stories/view/StoryView;

    invoke-static {v1}, Lcom/vk/stories/view/StoryView;->access$300(Lcom/vk/stories/view/StoryView;)V

    .line 76
    iget-object v1, p0, Lcom/vk/stories/view/StoryView$1;->this$0:Lcom/vk/stories/view/StoryView;

    invoke-static {v1}, Lcom/vk/stories/view/StoryView;->access$400(Lcom/vk/stories/view/StoryView;)Lcom/vk/stories/model/StoryEntry;

    move-result-object v1

    iget-object v2, p0, Lcom/vk/stories/view/StoryView$1;->this$0:Lcom/vk/stories/view/StoryView;

    invoke-static {v2}, Lcom/vk/stories/view/StoryView;->access$500(Lcom/vk/stories/view/StoryView;)Lcom/vk/stories/StoriesController$SourceType;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/vk/stories/StoriesController;->markAsSeen(Lcom/vk/stories/model/StoryEntry;Lcom/vk/stories/StoriesController$SourceType;)V

    .line 78
    :cond_1
    const v1, 0x3f7d70a4    # 0.99f

    cmpl-float v1, v0, v1

    if-ltz v1, :cond_3

    iget-object v1, p0, Lcom/vk/stories/view/StoryView$1;->this$0:Lcom/vk/stories/view/StoryView;

    invoke-static {v1}, Lcom/vk/stories/view/StoryView;->access$600(Lcom/vk/stories/view/StoryView;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 79
    iget-object v1, p0, Lcom/vk/stories/view/StoryView$1;->this$0:Lcom/vk/stories/view/StoryView;

    invoke-static {v1}, Lcom/vk/stories/view/StoryView;->access$700(Lcom/vk/stories/view/StoryView;)Lcom/vk/stories/view/StoryProgressView;

    move-result-object v1

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-virtual {v1, v2}, Lcom/vk/stories/view/StoryProgressView;->setProgress(F)V

    .line 80
    iget-object v1, p0, Lcom/vk/stories/view/StoryView$1;->this$0:Lcom/vk/stories/view/StoryView;

    invoke-static {v1}, Lcom/vk/stories/view/StoryView;->access$800(Lcom/vk/stories/view/StoryView;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 87
    .end local v0    # "progress":F
    :catch_0
    move-exception v1

    .line 90
    :cond_2
    :goto_1
    const/4 v1, 0x0

    invoke-static {p0, v1}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object v1

    const-wide/16 v2, 0x10

    invoke-virtual {p0, v1, v2, v3}, Lcom/vk/stories/view/StoryView$1;->sendMessageDelayed(Landroid/os/Message;J)Z

    goto :goto_0

    .line 84
    .restart local v0    # "progress":F
    :cond_3
    :try_start_1
    iget-object v1, p0, Lcom/vk/stories/view/StoryView$1;->this$0:Lcom/vk/stories/view/StoryView;

    invoke-static {v1}, Lcom/vk/stories/view/StoryView;->access$700(Lcom/vk/stories/view/StoryView;)Lcom/vk/stories/view/StoryProgressView;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vk/stories/view/StoryProgressView;->getProgress()F

    move-result v1

    cmpg-float v1, v1, v0

    if-ltz v1, :cond_4

    const v1, 0x3d4ccccd    # 0.05f

    cmpg-float v1, v0, v1

    if-gez v1, :cond_2

    .line 85
    :cond_4
    iget-object v1, p0, Lcom/vk/stories/view/StoryView$1;->this$0:Lcom/vk/stories/view/StoryView;

    invoke-static {v1}, Lcom/vk/stories/view/StoryView;->access$700(Lcom/vk/stories/view/StoryView;)Lcom/vk/stories/view/StoryProgressView;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/vk/stories/view/StoryProgressView;->setProgress(F)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1
.end method
