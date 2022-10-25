.class Lcom/vkontakte/android/fragments/NewsFragment$StoriesHeaderHolder;
.super Lcom/vkontakte/android/ui/holder/RecyclerHolder;
.source "NewsFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/NewsFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "StoriesHeaderHolder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
        "<",
        "Ljava/util/ArrayList",
        "<",
        "Lcom/vk/stories/model/StoriesContainer;",
        ">;>;"
    }
.end annotation


# instance fields
.field private final storiesAdapter:Lcom/vkontakte/android/fragments/NewsFragment$StoriesAdapter;

.field private final storiesRecyclerView:Lme/grishka/appkit/views/UsableRecyclerView;

.field final synthetic this$0:Lcom/vkontakte/android/fragments/NewsFragment;


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/fragments/NewsFragment;Landroid/view/ViewGroup;)V
    .locals 4
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/NewsFragment;
    .param p2, "container"    # Landroid/view/ViewGroup;

    .prologue
    const/4 v3, 0x0

    .line 1558
    iput-object p1, p0, Lcom/vkontakte/android/fragments/NewsFragment$StoriesHeaderHolder;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    .line 1559
    const v0, 0x7f03016a

    invoke-direct {p0, v0, p2}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;-><init>(ILandroid/view/ViewGroup;)V

    .line 1561
    const v0, 0x7f100418

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/NewsFragment$StoriesHeaderHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lme/grishka/appkit/views/UsableRecyclerView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment$StoriesHeaderHolder;->storiesRecyclerView:Lme/grishka/appkit/views/UsableRecyclerView;

    .line 1562
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment$StoriesHeaderHolder;->storiesRecyclerView:Lme/grishka/appkit/views/UsableRecyclerView;

    new-instance v1, Landroid/support/v7/widget/LinearLayoutManager;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/NewsFragment$StoriesHeaderHolder;->storiesRecyclerView:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v2}, Lme/grishka/appkit/views/UsableRecyclerView;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2, v3, v3}, Landroid/support/v7/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    invoke-virtual {v0, v1}, Lme/grishka/appkit/views/UsableRecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    .line 1563
    new-instance v0, Lcom/vkontakte/android/fragments/NewsFragment$StoriesAdapter;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/NewsFragment$StoriesHeaderHolder;->storiesRecyclerView:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-direct {v0, p1, v1}, Lcom/vkontakte/android/fragments/NewsFragment$StoriesAdapter;-><init>(Lcom/vkontakte/android/fragments/NewsFragment;Landroid/support/v7/widget/RecyclerView;)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment$StoriesHeaderHolder;->storiesAdapter:Lcom/vkontakte/android/fragments/NewsFragment$StoriesAdapter;

    .line 1564
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment$StoriesHeaderHolder;->storiesRecyclerView:Lme/grishka/appkit/views/UsableRecyclerView;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/NewsFragment$StoriesHeaderHolder;->storiesAdapter:Lcom/vkontakte/android/fragments/NewsFragment$StoriesAdapter;

    invoke-virtual {v0, v1}, Lme/grishka/appkit/views/UsableRecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 1565
    return-void
.end method


# virtual methods
.method public bridge synthetic onBind(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 1553
    check-cast p1, Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/NewsFragment$StoriesHeaderHolder;->onBind(Ljava/util/ArrayList;)V

    return-void
.end method

.method public onBind(Ljava/util/ArrayList;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vk/stories/model/StoriesContainer;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 1569
    .local p1, "item":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/stories/model/StoriesContainer;>;"
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-nez v0, :cond_1

    .line 1570
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment$StoriesHeaderHolder;->storiesRecyclerView:Lme/grishka/appkit/views/UsableRecyclerView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lme/grishka/appkit/views/UsableRecyclerView;->setVisibility(I)V

    .line 1571
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment$StoriesHeaderHolder;->storiesAdapter:Lcom/vkontakte/android/fragments/NewsFragment$StoriesAdapter;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/NewsFragment$StoriesAdapter;->clear()V

    .line 1576
    :goto_0
    return-void

    .line 1573
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment$StoriesHeaderHolder;->storiesAdapter:Lcom/vkontakte/android/fragments/NewsFragment$StoriesAdapter;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/fragments/NewsFragment$StoriesAdapter;->setStories(Ljava/util/ArrayList;)V

    .line 1574
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment$StoriesHeaderHolder;->storiesRecyclerView:Lme/grishka/appkit/views/UsableRecyclerView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lme/grishka/appkit/views/UsableRecyclerView;->setVisibility(I)V

    goto :goto_0
.end method

.method public scrollToBegin()V
    .locals 2

    .prologue
    .line 1579
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment$StoriesHeaderHolder;->storiesRecyclerView:Lme/grishka/appkit/views/UsableRecyclerView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lme/grishka/appkit/views/UsableRecyclerView;->scrollToPosition(I)V

    .line 1580
    return-void
.end method
