.class Lcom/vkontakte/android/fragments/NewsFragment$StoriesHeaderAdapter;
.super Lme/grishka/appkit/views/UsableRecyclerView$Adapter;
.source "NewsFragment.java"

# interfaces
.implements Lcom/vkontakte/android/ui/CardItemDecorator$Provider;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/NewsFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "StoriesHeaderAdapter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lme/grishka/appkit/views/UsableRecyclerView$Adapter",
        "<",
        "Lcom/vkontakte/android/fragments/NewsFragment$StoriesHeaderHolder;",
        ">;",
        "Lcom/vkontakte/android/ui/CardItemDecorator$Provider;"
    }
.end annotation


# instance fields
.field private getStoriesResponse:Lcom/vk/stories/model/GetStoriesResponse;

.field private scrollToBegin:Z

.field final synthetic this$0:Lcom/vkontakte/android/fragments/NewsFragment;


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/fragments/NewsFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/NewsFragment;

    .prologue
    .line 1588
    iput-object p1, p0, Lcom/vkontakte/android/fragments/NewsFragment$StoriesHeaderAdapter;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    invoke-direct {p0}, Lme/grishka/appkit/views/UsableRecyclerView$Adapter;-><init>()V

    .line 1589
    return-void
.end method

.method static synthetic access$4100(Lcom/vkontakte/android/fragments/NewsFragment$StoriesHeaderAdapter;)Lcom/vk/stories/model/GetStoriesResponse;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/NewsFragment$StoriesHeaderAdapter;

    .prologue
    .line 1583
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment$StoriesHeaderAdapter;->getStoriesResponse:Lcom/vk/stories/model/GetStoriesResponse;

    return-object v0
.end method


# virtual methods
.method public getBlockType(I)I
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 1619
    const/4 v0, 0x7

    return v0
.end method

.method public getImageCountForItem(I)I
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 1629
    const/4 v0, 0x0

    return v0
.end method

.method public getImageURL(II)Ljava/lang/String;
    .locals 1
    .param p1, "position"    # I
    .param p2, "image"    # I

    .prologue
    .line 1634
    const/4 v0, 0x0

    return-object v0
.end method

.method public getItemCount()I
    .locals 2

    .prologue
    const/4 v0, 0x0

    .line 1607
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vkontakte/android/auth/VKAccount;->isStoriesAvailable()Z

    move-result v1

    if-nez v1, :cond_1

    .line 1613
    :cond_0
    :goto_0
    return v0

    .line 1610
    :cond_1
    iget-object v1, p0, Lcom/vkontakte/android/fragments/NewsFragment$StoriesHeaderAdapter;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/NewsFragment;->access$4600(Lcom/vkontakte/android/fragments/NewsFragment;)I

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/NewsFragment$StoriesHeaderAdapter;->getStoriesResponse:Lcom/vk/stories/model/GetStoriesResponse;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/NewsFragment$StoriesHeaderAdapter;->getStoriesResponse:Lcom/vk/stories/model/GetStoriesResponse;

    iget-object v1, v1, Lcom/vk/stories/model/GetStoriesResponse;->storiesResponse:Ljava/util/ArrayList;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/NewsFragment$StoriesHeaderAdapter;->getStoriesResponse:Lcom/vk/stories/model/GetStoriesResponse;

    iget-object v1, v1, Lcom/vk/stories/model/GetStoriesResponse;->storiesResponse:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_0

    .line 1611
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public getItemViewType(I)I
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 1624
    const v0, 0x75251

    return v0
.end method

.method public bridge synthetic onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    .prologue
    .line 1583
    check-cast p1, Lcom/vkontakte/android/fragments/NewsFragment$StoriesHeaderHolder;

    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/fragments/NewsFragment$StoriesHeaderAdapter;->onBindViewHolder(Lcom/vkontakte/android/fragments/NewsFragment$StoriesHeaderHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/vkontakte/android/fragments/NewsFragment$StoriesHeaderHolder;I)V
    .locals 1
    .param p1, "holder"    # Lcom/vkontakte/android/fragments/NewsFragment$StoriesHeaderHolder;
    .param p2, "position"    # I

    .prologue
    .line 1598
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment$StoriesHeaderAdapter;->getStoriesResponse:Lcom/vk/stories/model/GetStoriesResponse;

    if-nez v0, :cond_1

    const/4 v0, 0x0

    :goto_0
    invoke-virtual {p1, v0}, Lcom/vkontakte/android/fragments/NewsFragment$StoriesHeaderHolder;->bind(Ljava/lang/Object;)V

    .line 1599
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/NewsFragment$StoriesHeaderAdapter;->scrollToBegin:Z

    if-eqz v0, :cond_0

    .line 1600
    invoke-virtual {p1}, Lcom/vkontakte/android/fragments/NewsFragment$StoriesHeaderHolder;->scrollToBegin()V

    .line 1601
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/NewsFragment$StoriesHeaderAdapter;->scrollToBegin:Z

    .line 1603
    :cond_0
    return-void

    .line 1598
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment$StoriesHeaderAdapter;->getStoriesResponse:Lcom/vk/stories/model/GetStoriesResponse;

    iget-object v0, v0, Lcom/vk/stories/model/GetStoriesResponse;->storiesResponse:Ljava/util/ArrayList;

    goto :goto_0
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 1

    .prologue
    .line 1583
    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/fragments/NewsFragment$StoriesHeaderAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/vkontakte/android/fragments/NewsFragment$StoriesHeaderHolder;

    move-result-object v0

    return-object v0
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/vkontakte/android/fragments/NewsFragment$StoriesHeaderHolder;
    .locals 2
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # I

    .prologue
    .line 1593
    new-instance v0, Lcom/vkontakte/android/fragments/NewsFragment$StoriesHeaderHolder;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/NewsFragment$StoriesHeaderAdapter;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    invoke-direct {v0, v1, p1}, Lcom/vkontakte/android/fragments/NewsFragment$StoriesHeaderHolder;-><init>(Lcom/vkontakte/android/fragments/NewsFragment;Landroid/view/ViewGroup;)V

    return-object v0
.end method

.method public scrollToBegin()V
    .locals 1

    .prologue
    .line 1654
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/NewsFragment$StoriesHeaderAdapter;->scrollToBegin:Z

    .line 1655
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/NewsFragment$StoriesHeaderAdapter;->notifyDataSetChanged()V

    .line 1656
    return-void
.end method

.method public setGetStoriesResponse(Lcom/vk/stories/model/GetStoriesResponse;)V
    .locals 0
    .param p1, "getStoriesResponse"    # Lcom/vk/stories/model/GetStoriesResponse;

    .prologue
    .line 1638
    iput-object p1, p0, Lcom/vkontakte/android/fragments/NewsFragment$StoriesHeaderAdapter;->getStoriesResponse:Lcom/vk/stories/model/GetStoriesResponse;

    .line 1640
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/NewsFragment$StoriesHeaderAdapter;->scrollToBegin()V

    .line 1641
    return-void
.end method

.method public setGetStoriesResponse(Ljava/util/ArrayList;)V
    .locals 1
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
    .line 1644
    .local p1, "stories":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/stories/model/StoriesContainer;>;"
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment$StoriesHeaderAdapter;->getStoriesResponse:Lcom/vk/stories/model/GetStoriesResponse;

    if-nez v0, :cond_0

    .line 1651
    :goto_0
    return-void

    .line 1647
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment$StoriesHeaderAdapter;->getStoriesResponse:Lcom/vk/stories/model/GetStoriesResponse;

    iget-object v0, v0, Lcom/vk/stories/model/GetStoriesResponse;->storiesResponse:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 1648
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment$StoriesHeaderAdapter;->getStoriesResponse:Lcom/vk/stories/model/GetStoriesResponse;

    iget-object v0, v0, Lcom/vk/stories/model/GetStoriesResponse;->storiesResponse:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 1650
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/NewsFragment$StoriesHeaderAdapter;->scrollToBegin()V

    goto :goto_0
.end method
