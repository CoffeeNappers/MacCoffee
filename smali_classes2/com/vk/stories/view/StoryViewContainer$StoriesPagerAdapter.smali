.class Lcom/vk/stories/view/StoryViewContainer$StoriesPagerAdapter;
.super Lcom/vk/attachpicker/widget/ViewPagerAdapter;
.source "StoryViewContainer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/stories/view/StoryViewContainer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "StoriesPagerAdapter"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/stories/view/StoryViewContainer;


# direct methods
.method private constructor <init>(Lcom/vk/stories/view/StoryViewContainer;)V
    .locals 0

    .prologue
    .line 500
    iput-object p1, p0, Lcom/vk/stories/view/StoryViewContainer$StoriesPagerAdapter;->this$0:Lcom/vk/stories/view/StoryViewContainer;

    invoke-direct {p0}, Lcom/vk/attachpicker/widget/ViewPagerAdapter;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vk/stories/view/StoryViewContainer;Lcom/vk/stories/view/StoryViewContainer$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vk/stories/view/StoryViewContainer;
    .param p2, "x1"    # Lcom/vk/stories/view/StoryViewContainer$1;

    .prologue
    .line 500
    invoke-direct {p0, p1}, Lcom/vk/stories/view/StoryViewContainer$StoriesPagerAdapter;-><init>(Lcom/vk/stories/view/StoryViewContainer;)V

    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 1

    .prologue
    .line 509
    iget-object v0, p0, Lcom/vk/stories/view/StoryViewContainer$StoriesPagerAdapter;->this$0:Lcom/vk/stories/view/StoryViewContainer;

    invoke-static {v0}, Lcom/vk/stories/view/StoryViewContainer;->access$600(Lcom/vk/stories/view/StoryViewContainer;)Ljava/util/ArrayList;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 510
    iget-object v0, p0, Lcom/vk/stories/view/StoryViewContainer$StoriesPagerAdapter;->this$0:Lcom/vk/stories/view/StoryViewContainer;

    invoke-static {v0}, Lcom/vk/stories/view/StoryViewContainer;->access$600(Lcom/vk/stories/view/StoryViewContainer;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 512
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getItemPosition(Ljava/lang/Object;)I
    .locals 1
    .param p1, "object"    # Ljava/lang/Object;

    .prologue
    .line 504
    const/4 v0, -0x2

    return v0
.end method

.method public getView(ILandroid/support/v4/view/ViewPager;)Landroid/view/View;
    .locals 8
    .param p1, "position"    # I
    .param p2, "pager"    # Landroid/support/v4/view/ViewPager;

    .prologue
    .line 518
    new-instance v0, Lcom/vk/stories/view/StoryView;

    iget-object v1, p0, Lcom/vk/stories/view/StoryViewContainer$StoriesPagerAdapter;->this$0:Lcom/vk/stories/view/StoryViewContainer;

    invoke-virtual {v1}, Lcom/vk/stories/view/StoryViewContainer;->getContext()Landroid/content/Context;

    move-result-object v1

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/vk/stories/view/StoryViewContainer$StoriesPagerAdapter;->this$0:Lcom/vk/stories/view/StoryViewContainer;

    invoke-static {v3}, Lcom/vk/stories/view/StoryViewContainer;->access$1500(Lcom/vk/stories/view/StoryViewContainer;)Lcom/vk/stories/StoriesController$SourceType;

    move-result-object v3

    iget-object v4, p0, Lcom/vk/stories/view/StoryViewContainer$StoriesPagerAdapter;->this$0:Lcom/vk/stories/view/StoryViewContainer;

    invoke-static {v4}, Lcom/vk/stories/view/StoryViewContainer;->access$1600(Lcom/vk/stories/view/StoryViewContainer;)Lcom/vk/core/widget/OnSwipeTouchListener;

    move-result-object v5

    iget-object v4, p0, Lcom/vk/stories/view/StoryViewContainer$StoriesPagerAdapter;->this$0:Lcom/vk/stories/view/StoryViewContainer;

    invoke-static {v4}, Lcom/vk/stories/view/StoryViewContainer;->access$600(Lcom/vk/stories/view/StoryViewContainer;)Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/vk/stories/model/StoriesContainer;

    iget-object v7, p0, Lcom/vk/stories/view/StoryViewContainer$StoriesPagerAdapter;->this$0:Lcom/vk/stories/view/StoryViewContainer;

    move v4, p1

    invoke-direct/range {v0 .. v7}, Lcom/vk/stories/view/StoryView;-><init>(Landroid/content/Context;ZLcom/vk/stories/StoriesController$SourceType;ILandroid/view/View$OnTouchListener;Lcom/vk/stories/model/StoriesContainer;Lcom/vk/stories/view/StoryView$StoryViewCallback;)V

    .line 519
    .local v0, "storyView":Lcom/vk/stories/view/StoryView;
    return-object v0
.end method
