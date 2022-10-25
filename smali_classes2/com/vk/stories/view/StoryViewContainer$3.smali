.class Lcom/vk/stories/view/StoryViewContainer$3;
.super Ljava/lang/Object;
.source "StoryViewContainer.java"

# interfaces
.implements Landroid/support/v4/view/ViewPager$OnPageChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/stories/view/StoryViewContainer;->init()V
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
    .line 137
    iput-object p1, p0, Lcom/vk/stories/view/StoryViewContainer$3;->this$0:Lcom/vk/stories/view/StoryViewContainer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPageScrollStateChanged(I)V
    .locals 4
    .param p1, "state"    # I

    .prologue
    .line 150
    iget-object v0, p0, Lcom/vk/stories/view/StoryViewContainer$3;->this$0:Lcom/vk/stories/view/StoryViewContainer;

    invoke-static {v0, p1}, Lcom/vk/stories/view/StoryViewContainer;->access$302(Lcom/vk/stories/view/StoryViewContainer;I)I

    .line 152
    iget-object v0, p0, Lcom/vk/stories/view/StoryViewContainer$3;->this$0:Lcom/vk/stories/view/StoryViewContainer;

    invoke-static {v0}, Lcom/vk/stories/view/StoryViewContainer;->access$400(Lcom/vk/stories/view/StoryViewContainer;)V

    .line 154
    const/4 v0, 0x1

    if-ne p1, v0, :cond_2

    .line 155
    iget-object v0, p0, Lcom/vk/stories/view/StoryViewContainer$3;->this$0:Lcom/vk/stories/view/StoryViewContainer;

    invoke-static {v0}, Lcom/vk/stories/view/StoryViewContainer;->access$500(Lcom/vk/stories/view/StoryViewContainer;)Lcom/vk/stories/view/StoriesViewPager;

    move-result-object v0

    const-wide/high16 v2, 0x3ff0000000000000L    # 1.0

    invoke-virtual {v0, v2, v3}, Lcom/vk/stories/view/StoriesViewPager;->setScrollDurationFactor(D)V

    .line 160
    :cond_0
    :goto_0
    if-nez p1, :cond_1

    .line 161
    iget-object v0, p0, Lcom/vk/stories/view/StoryViewContainer$3;->this$0:Lcom/vk/stories/view/StoryViewContainer;

    invoke-static {v0}, Lcom/vk/stories/view/StoryViewContainer;->access$700(Lcom/vk/stories/view/StoryViewContainer;)Lcom/vk/stories/view/StoryViewContainer$ControlCallback;

    move-result-object v1

    iget-object v0, p0, Lcom/vk/stories/view/StoryViewContainer$3;->this$0:Lcom/vk/stories/view/StoryViewContainer;

    invoke-static {v0}, Lcom/vk/stories/view/StoryViewContainer;->access$600(Lcom/vk/stories/view/StoryViewContainer;)Ljava/util/ArrayList;

    move-result-object v0

    iget-object v2, p0, Lcom/vk/stories/view/StoryViewContainer$3;->this$0:Lcom/vk/stories/view/StoryViewContainer;

    invoke-static {v2}, Lcom/vk/stories/view/StoryViewContainer;->access$500(Lcom/vk/stories/view/StoryViewContainer;)Lcom/vk/stories/view/StoriesViewPager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vk/stories/view/StoriesViewPager;->getCurrentItem()I

    move-result v2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/stories/model/StoriesContainer;

    invoke-virtual {v0}, Lcom/vk/stories/model/StoriesContainer;->getAuthorId()I

    move-result v0

    invoke-interface {v1, v0}, Lcom/vk/stories/view/StoryViewContainer$ControlCallback;->scrollStoriesListToAuthorId(I)V

    .line 162
    iget-object v0, p0, Lcom/vk/stories/view/StoryViewContainer$3;->this$0:Lcom/vk/stories/view/StoryViewContainer;

    iget-object v1, p0, Lcom/vk/stories/view/StoryViewContainer$3;->this$0:Lcom/vk/stories/view/StoryViewContainer;

    invoke-static {v1}, Lcom/vk/stories/view/StoryViewContainer;->access$500(Lcom/vk/stories/view/StoryViewContainer;)Lcom/vk/stories/view/StoriesViewPager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vk/stories/view/StoriesViewPager;->getCurrentItem()I

    move-result v1

    invoke-static {v0, v1}, Lcom/vk/stories/view/StoryViewContainer;->access$802(Lcom/vk/stories/view/StoryViewContainer;I)I

    .line 165
    :cond_1
    if-nez p1, :cond_3

    iget-object v0, p0, Lcom/vk/stories/view/StoryViewContainer$3;->this$0:Lcom/vk/stories/view/StoryViewContainer;

    invoke-static {v0}, Lcom/vk/stories/view/StoryViewContainer;->access$700(Lcom/vk/stories/view/StoryViewContainer;)Lcom/vk/stories/view/StoryViewContainer$ControlCallback;

    move-result-object v0

    invoke-interface {v0}, Lcom/vk/stories/view/StoryViewContainer$ControlCallback;->noDragGestureInProgress()Z

    move-result v0

    if-nez v0, :cond_3

    .line 166
    iget-object v0, p0, Lcom/vk/stories/view/StoryViewContainer$3;->this$0:Lcom/vk/stories/view/StoryViewContainer;

    invoke-virtual {v0}, Lcom/vk/stories/view/StoryViewContainer;->playStory()V

    .line 170
    :goto_1
    return-void

    .line 156
    :cond_2
    if-nez p1, :cond_0

    .line 157
    iget-object v0, p0, Lcom/vk/stories/view/StoryViewContainer$3;->this$0:Lcom/vk/stories/view/StoryViewContainer;

    invoke-static {v0}, Lcom/vk/stories/view/StoryViewContainer;->access$500(Lcom/vk/stories/view/StoryViewContainer;)Lcom/vk/stories/view/StoriesViewPager;

    move-result-object v0

    const-wide/high16 v2, 0x3ff8000000000000L    # 1.5

    invoke-virtual {v0, v2, v3}, Lcom/vk/stories/view/StoriesViewPager;->setScrollDurationFactor(D)V

    goto :goto_0

    .line 168
    :cond_3
    iget-object v0, p0, Lcom/vk/stories/view/StoryViewContainer$3;->this$0:Lcom/vk/stories/view/StoryViewContainer;

    invoke-virtual {v0}, Lcom/vk/stories/view/StoryViewContainer;->pauseStory()V

    goto :goto_1
.end method

.method public onPageScrolled(IFI)V
    .locals 0
    .param p1, "position"    # I
    .param p2, "positionOffset"    # F
    .param p3, "positionOffsetPixels"    # I

    .prologue
    .line 141
    return-void
.end method

.method public onPageSelected(I)V
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 145
    iget-object v0, p0, Lcom/vk/stories/view/StoryViewContainer$3;->this$0:Lcom/vk/stories/view/StoryViewContainer;

    invoke-static {v0}, Lcom/vk/stories/view/StoryViewContainer;->access$200(Lcom/vk/stories/view/StoryViewContainer;)V

    .line 146
    return-void
.end method
