.class Lcom/vk/stories/view/StoryViewContainer$5;
.super Ljava/lang/Object;
.source "StoryViewContainer.java"

# interfaces
.implements Lcom/vk/core/widget/OnTouchDownListener$DownUpListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/stories/view/StoryViewContainer;->initTouchListener()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/stories/view/StoryViewContainer;


# direct methods
.method constructor <init>(Lcom/vk/stories/view/StoryViewContainer;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/stories/view/StoryViewContainer;

    .prologue
    .line 264
    iput-object p1, p0, Lcom/vk/stories/view/StoryViewContainer$5;->this$0:Lcom/vk/stories/view/StoryViewContainer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic lambda$onClick$0(Lcom/vk/stories/view/StoryView;)V
    .locals 0
    .param p0, "sv"    # Lcom/vk/stories/view/StoryView;

    .prologue
    .line 290
    invoke-virtual {p0}, Lcom/vk/stories/view/StoryView;->externalPrevClick()V

    return-void
.end method

.method static synthetic lambda$onClick$1(Lcom/vk/stories/view/StoryView;)V
    .locals 0
    .param p0, "sv"    # Lcom/vk/stories/view/StoryView;

    .prologue
    .line 292
    invoke-virtual {p0}, Lcom/vk/stories/view/StoryView;->externalNextClick()V

    return-void
.end method


# virtual methods
.method public declared-synchronized onClick(II)V
    .locals 2
    .param p1, "x"    # I
    .param p2, "y"    # I

    .prologue
    .line 283
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/vk/stories/view/StoryViewContainer$5;->this$0:Lcom/vk/stories/view/StoryViewContainer;

    invoke-static {v0}, Lcom/vk/stories/view/StoryViewContainer;->access$300(Lcom/vk/stories/view/StoryViewContainer;)I

    move-result v0

    if-nez v0, :cond_0

    .line 284
    iget-object v0, p0, Lcom/vk/stories/view/StoryViewContainer$5;->this$0:Lcom/vk/stories/view/StoryViewContainer;

    invoke-static {v0}, Lcom/vk/stories/view/StoryViewContainer;->access$1200(Lcom/vk/stories/view/StoryViewContainer;)Lcom/vk/core/util/TimeoutLock;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/core/util/TimeoutLock;->isLocked()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-eqz v0, :cond_1

    .line 295
    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    .line 287
    :cond_1
    :try_start_1
    iget-object v0, p0, Lcom/vk/stories/view/StoryViewContainer$5;->this$0:Lcom/vk/stories/view/StoryViewContainer;

    invoke-static {v0}, Lcom/vk/stories/view/StoryViewContainer;->access$1200(Lcom/vk/stories/view/StoryViewContainer;)Lcom/vk/core/util/TimeoutLock;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/core/util/TimeoutLock;->lock()V

    .line 289
    iget-object v0, p0, Lcom/vk/stories/view/StoryViewContainer$5;->this$0:Lcom/vk/stories/view/StoryViewContainer;

    invoke-static {v0}, Lcom/vk/stories/view/StoryViewContainer;->access$1000(Lcom/vk/stories/view/StoryViewContainer;)I

    move-result v0

    if-ge p1, v0, :cond_2

    .line 290
    iget-object v0, p0, Lcom/vk/stories/view/StoryViewContainer$5;->this$0:Lcom/vk/stories/view/StoryViewContainer;

    invoke-static {}, Lcom/vk/stories/view/StoryViewContainer$5$$Lambda$1;->lambdaFactory$()Lcom/vk/stories/view/StoryViewContainer$StoryViewCallback;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vk/stories/view/StoryViewContainer;->access$1300(Lcom/vk/stories/view/StoryViewContainer;Lcom/vk/stories/view/StoryViewContainer$StoryViewCallback;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 283
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 292
    :cond_2
    :try_start_2
    iget-object v0, p0, Lcom/vk/stories/view/StoryViewContainer$5;->this$0:Lcom/vk/stories/view/StoryViewContainer;

    invoke-static {}, Lcom/vk/stories/view/StoryViewContainer$5$$Lambda$2;->lambdaFactory$()Lcom/vk/stories/view/StoryViewContainer$StoryViewCallback;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vk/stories/view/StoryViewContainer;->access$1300(Lcom/vk/stories/view/StoryViewContainer;Lcom/vk/stories/view/StoryViewContainer$StoryViewCallback;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0
.end method

.method public onDown(II)V
    .locals 1
    .param p1, "x"    # I
    .param p2, "y"    # I

    .prologue
    .line 267
    iget-object v0, p0, Lcom/vk/stories/view/StoryViewContainer$5;->this$0:Lcom/vk/stories/view/StoryViewContainer;

    invoke-virtual {v0}, Lcom/vk/stories/view/StoryViewContainer;->pauseStory()V

    .line 268
    iget-object v0, p0, Lcom/vk/stories/view/StoryViewContainer$5;->this$0:Lcom/vk/stories/view/StoryViewContainer;

    invoke-static {v0}, Lcom/vk/stories/view/StoryViewContainer;->access$1000(Lcom/vk/stories/view/StoryViewContainer;)I

    move-result v0

    if-ge p1, v0, :cond_0

    .line 269
    iget-object v0, p0, Lcom/vk/stories/view/StoryViewContainer$5;->this$0:Lcom/vk/stories/view/StoryViewContainer;

    invoke-static {v0}, Lcom/vk/stories/view/StoryViewContainer;->access$1100(Lcom/vk/stories/view/StoryViewContainer;)V

    .line 271
    :cond_0
    return-void
.end method

.method public onUp(II)V
    .locals 1
    .param p1, "x"    # I
    .param p2, "y"    # I

    .prologue
    .line 275
    iget-object v0, p0, Lcom/vk/stories/view/StoryViewContainer$5;->this$0:Lcom/vk/stories/view/StoryViewContainer;

    invoke-static {v0}, Lcom/vk/stories/view/StoryViewContainer;->access$300(Lcom/vk/stories/view/StoryViewContainer;)I

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/vk/stories/view/StoryViewContainer$5;->this$0:Lcom/vk/stories/view/StoryViewContainer;

    invoke-static {v0}, Lcom/vk/stories/view/StoryViewContainer;->access$700(Lcom/vk/stories/view/StoryViewContainer;)Lcom/vk/stories/view/StoryViewContainer$ControlCallback;

    move-result-object v0

    invoke-interface {v0}, Lcom/vk/stories/view/StoryViewContainer$ControlCallback;->noDragGestureInProgress()Z

    move-result v0

    if-nez v0, :cond_0

    .line 276
    iget-object v0, p0, Lcom/vk/stories/view/StoryViewContainer$5;->this$0:Lcom/vk/stories/view/StoryViewContainer;

    invoke-virtual {v0}, Lcom/vk/stories/view/StoryViewContainer;->playStory()V

    .line 278
    :cond_0
    iget-object v0, p0, Lcom/vk/stories/view/StoryViewContainer$5;->this$0:Lcom/vk/stories/view/StoryViewContainer;

    invoke-static {v0}, Lcom/vk/stories/view/StoryViewContainer;->access$400(Lcom/vk/stories/view/StoryViewContainer;)V

    .line 279
    return-void
.end method
