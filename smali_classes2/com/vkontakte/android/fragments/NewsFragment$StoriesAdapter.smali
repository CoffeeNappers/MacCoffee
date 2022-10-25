.class Lcom/vkontakte/android/fragments/NewsFragment$StoriesAdapter;
.super Lme/grishka/appkit/views/UsableRecyclerView$Adapter;
.source "NewsFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/NewsFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "StoriesAdapter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lme/grishka/appkit/views/UsableRecyclerView$Adapter",
        "<",
        "Lcom/vkontakte/android/fragments/NewsFragment$StoriesHolder;",
        ">;"
    }
.end annotation


# instance fields
.field private final recyclerView:Landroid/support/v7/widget/RecyclerView;

.field private final stories:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vk/stories/model/StoriesContainer;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/vkontakte/android/fragments/NewsFragment;


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/fragments/NewsFragment;Landroid/support/v7/widget/RecyclerView;)V
    .locals 1
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/NewsFragment;
    .param p2, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;

    .prologue
    .line 1379
    iput-object p1, p0, Lcom/vkontakte/android/fragments/NewsFragment$StoriesAdapter;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    invoke-direct {p0}, Lme/grishka/appkit/views/UsableRecyclerView$Adapter;-><init>()V

    .line 1376
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment$StoriesAdapter;->stories:Ljava/util/ArrayList;

    .line 1380
    iput-object p2, p0, Lcom/vkontakte/android/fragments/NewsFragment$StoriesAdapter;->recyclerView:Landroid/support/v7/widget/RecyclerView;

    .line 1381
    return-void
.end method


# virtual methods
.method public clear()V
    .locals 1

    .prologue
    .line 1409
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment$StoriesAdapter;->stories:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 1410
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/NewsFragment$StoriesAdapter;->notifyDataSetChanged()V

    .line 1411
    return-void
.end method

.method public getImageCountForItem(I)I
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 1400
    const/4 v0, 0x1

    return v0
.end method

.method public getImageURL(II)Ljava/lang/String;
    .locals 1
    .param p1, "position"    # I
    .param p2, "image"    # I

    .prologue
    .line 1405
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment$StoriesAdapter;->stories:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/stories/model/StoriesContainer;

    invoke-virtual {v0}, Lcom/vk/stories/model/StoriesContainer;->getAuthorAvatarUrl()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getItemCount()I
    .locals 1

    .prologue
    .line 1395
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment$StoriesAdapter;->stories:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public bridge synthetic onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    .prologue
    .line 1374
    check-cast p1, Lcom/vkontakte/android/fragments/NewsFragment$StoriesHolder;

    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/fragments/NewsFragment$StoriesAdapter;->onBindViewHolder(Lcom/vkontakte/android/fragments/NewsFragment$StoriesHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/vkontakte/android/fragments/NewsFragment$StoriesHolder;I)V
    .locals 1
    .param p1, "holder"    # Lcom/vkontakte/android/fragments/NewsFragment$StoriesHolder;
    .param p2, "position"    # I

    .prologue
    .line 1390
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment$StoriesAdapter;->stories:Ljava/util/ArrayList;

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/fragments/NewsFragment$StoriesHolder;->bind(Ljava/lang/Object;)V

    .line 1391
    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 1

    .prologue
    .line 1374
    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/fragments/NewsFragment$StoriesAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/vkontakte/android/fragments/NewsFragment$StoriesHolder;

    move-result-object v0

    return-object v0
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/vkontakte/android/fragments/NewsFragment$StoriesHolder;
    .locals 3
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # I

    .prologue
    .line 1385
    new-instance v0, Lcom/vkontakte/android/fragments/NewsFragment$StoriesHolder;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/NewsFragment$StoriesAdapter;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/NewsFragment$StoriesAdapter;->recyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-direct {v0, v1, v2, p0}, Lcom/vkontakte/android/fragments/NewsFragment$StoriesHolder;-><init>(Lcom/vkontakte/android/fragments/NewsFragment;Landroid/support/v7/widget/RecyclerView;Lcom/vkontakte/android/fragments/NewsFragment$StoriesAdapter;)V

    return-object v0
.end method

.method public scrollStoriesListToAuthorId(I)V
    .locals 3
    .param p1, "uid"    # I

    .prologue
    .line 1420
    iget-object v1, p0, Lcom/vkontakte/android/fragments/NewsFragment$StoriesAdapter;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/NewsFragment;->access$4300(Lcom/vkontakte/android/fragments/NewsFragment;)Lme/grishka/appkit/views/UsableRecyclerView;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 1421
    iget-object v1, p0, Lcom/vkontakte/android/fragments/NewsFragment$StoriesAdapter;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/NewsFragment;->access$4400(Lcom/vkontakte/android/fragments/NewsFragment;)Lme/grishka/appkit/views/UsableRecyclerView;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lme/grishka/appkit/views/UsableRecyclerView;->scrollToPosition(I)V

    .line 1423
    :cond_0
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lcom/vkontakte/android/fragments/NewsFragment$StoriesAdapter;->stories:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 1424
    iget-object v1, p0, Lcom/vkontakte/android/fragments/NewsFragment$StoriesAdapter;->stories:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vk/stories/model/StoriesContainer;

    invoke-virtual {v1}, Lcom/vk/stories/model/StoriesContainer;->getAuthorId()I

    move-result v1

    if-ne v1, p1, :cond_2

    .line 1425
    iget-object v1, p0, Lcom/vkontakte/android/fragments/NewsFragment$StoriesAdapter;->recyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v1, v0}, Landroid/support/v7/widget/RecyclerView;->scrollToPosition(I)V

    .line 1429
    :cond_1
    return-void

    .line 1423
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public setStories(Ljava/util/ArrayList;)V
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
    .line 1414
    .local p1, "response":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/stories/model/StoriesContainer;>;"
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment$StoriesAdapter;->stories:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 1415
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment$StoriesAdapter;->stories:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 1416
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/NewsFragment$StoriesAdapter;->notifyDataSetChanged()V

    .line 1417
    return-void
.end method
