.class Lcom/vkontakte/android/fragments/ProfileFragment$VideoFeedAdapter;
.super Lme/grishka/appkit/views/UsableRecyclerView$Adapter;
.source "ProfileFragment.java"

# interfaces
.implements Lme/grishka/appkit/utils/Preloader$Callback;
.implements Lme/grishka/appkit/views/UsableRecyclerView$Listener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/ProfileFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "VideoFeedAdapter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lme/grishka/appkit/views/UsableRecyclerView$Adapter",
        "<",
        "Lcom/vkontakte/android/fragments/ProfileFragment$VideoFeedViewHolder;",
        ">;",
        "Lme/grishka/appkit/utils/Preloader$Callback",
        "<",
        "Lcom/vkontakte/android/api/VideoFile;",
        ">;",
        "Lme/grishka/appkit/views/UsableRecyclerView$Listener;"
    }
.end annotation


# instance fields
.field protected dataLoading:Z

.field protected preloader:Lme/grishka/appkit/utils/Preloader;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lme/grishka/appkit/utils/Preloader",
            "<",
            "Lcom/vkontakte/android/api/VideoFile;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/vkontakte/android/fragments/ProfileFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/ProfileFragment;Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/api/VideoFile;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 4284
    .local p2, "initialList":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/api/VideoFile;>;"
    iput-object p1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$VideoFeedAdapter;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-direct {p0}, Lme/grishka/appkit/views/UsableRecyclerView$Adapter;-><init>()V

    .line 4281
    new-instance v0, Lme/grishka/appkit/utils/Preloader;

    const/16 v1, 0x14

    invoke-direct {v0, p0, v1}, Lme/grishka/appkit/utils/Preloader;-><init>(Lme/grishka/appkit/utils/Preloader$Callback;I)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$VideoFeedAdapter;->preloader:Lme/grishka/appkit/utils/Preloader;

    .line 4282
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$VideoFeedAdapter;->dataLoading:Z

    .line 4285
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$VideoFeedAdapter;->preloader:Lme/grishka/appkit/utils/Preloader;

    const/4 v1, 0x1

    invoke-virtual {v0, p2, v1}, Lme/grishka/appkit/utils/Preloader;->onDataLoaded(Ljava/util/List;Z)V

    .line 4286
    return-void
.end method


# virtual methods
.method public getImageCountForItem(I)I
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 4305
    const/4 v0, 0x1

    return v0
.end method

.method public getImageURL(II)Ljava/lang/String;
    .locals 1
    .param p1, "position"    # I
    .param p2, "image"    # I

    .prologue
    .line 4310
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$VideoFeedAdapter;->preloader:Lme/grishka/appkit/utils/Preloader;

    invoke-virtual {v0}, Lme/grishka/appkit/utils/Preloader;->getData()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/api/VideoFile;

    iget-object v0, v0, Lcom/vkontakte/android/api/VideoFile;->urlBigThumb:Ljava/lang/String;

    return-object v0
.end method

.method public getItemCount()I
    .locals 1

    .prologue
    .line 4300
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$VideoFeedAdapter;->preloader:Lme/grishka/appkit/utils/Preloader;

    invoke-virtual {v0}, Lme/grishka/appkit/utils/Preloader;->getData()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public isDataLoading()Z
    .locals 1

    .prologue
    .line 4348
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$VideoFeedAdapter;->dataLoading:Z

    return v0
.end method

.method public isRefreshing()Z
    .locals 1

    .prologue
    .line 4353
    const/4 v0, 0x0

    return v0
.end method

.method public loadData(II)V
    .locals 2
    .param p1, "offset"    # I
    .param p2, "count"    # I

    .prologue
    .line 4320
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$VideoFeedAdapter;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$100(Lcom/vkontakte/android/fragments/ProfileFragment;)I

    move-result v0

    const/4 v1, 0x0

    invoke-static {v0, v1, p1, p2}, Lcom/vkontakte/android/api/video/VideoGet;->get(IIII)Lcom/vkontakte/android/api/video/VideoGet;

    move-result-object v0

    new-instance v1, Lcom/vkontakte/android/fragments/ProfileFragment$VideoFeedAdapter$1;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/fragments/ProfileFragment$VideoFeedAdapter$1;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment$VideoFeedAdapter;)V

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/video/VideoGet;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$VideoFeedAdapter;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    .line 4331
    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 4332
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$VideoFeedAdapter;->dataLoading:Z

    .line 4333
    return-void
.end method

.method public onAppendItems(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/api/VideoFile;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 4339
    .local p1, "items":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/api/VideoFile;>;"
    return-void
.end method

.method public bridge synthetic onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    .prologue
    .line 4279
    check-cast p1, Lcom/vkontakte/android/fragments/ProfileFragment$VideoFeedViewHolder;

    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/fragments/ProfileFragment$VideoFeedAdapter;->onBindViewHolder(Lcom/vkontakte/android/fragments/ProfileFragment$VideoFeedViewHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/vkontakte/android/fragments/ProfileFragment$VideoFeedViewHolder;I)V
    .locals 1
    .param p1, "holder"    # Lcom/vkontakte/android/fragments/ProfileFragment$VideoFeedViewHolder;
    .param p2, "position"    # I

    .prologue
    .line 4295
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$VideoFeedAdapter;->preloader:Lme/grishka/appkit/utils/Preloader;

    invoke-virtual {v0}, Lme/grishka/appkit/utils/Preloader;->getData()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/fragments/ProfileFragment$VideoFeedViewHolder;->bind(Ljava/lang/Object;)V

    .line 4296
    return-void
.end method

.method public onClearItems()V
    .locals 1

    .prologue
    .line 4343
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$VideoFeedAdapter;->preloader:Lme/grishka/appkit/utils/Preloader;

    invoke-virtual {v0}, Lme/grishka/appkit/utils/Preloader;->getData()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 4344
    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 1

    .prologue
    .line 4279
    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/fragments/ProfileFragment$VideoFeedAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/vkontakte/android/fragments/ProfileFragment$VideoFeedViewHolder;

    move-result-object v0

    return-object v0
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/vkontakte/android/fragments/ProfileFragment$VideoFeedViewHolder;
    .locals 2
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # I

    .prologue
    .line 4290
    new-instance v0, Lcom/vkontakte/android/fragments/ProfileFragment$VideoFeedViewHolder;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$VideoFeedAdapter;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-direct {v0, v1}, Lcom/vkontakte/android/fragments/ProfileFragment$VideoFeedViewHolder;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;)V

    return-object v0
.end method

.method public onScrollStarted()V
    .locals 0

    .prologue
    .line 4364
    return-void
.end method

.method public onScrolledToLastItem()V
    .locals 1

    .prologue
    .line 4358
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$VideoFeedAdapter;->preloader:Lme/grishka/appkit/utils/Preloader;

    invoke-virtual {v0}, Lme/grishka/appkit/utils/Preloader;->onScrolledToLastItem()V

    .line 4359
    return-void
.end method

.method public updateList()V
    .locals 0

    .prologue
    .line 4315
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment$VideoFeedAdapter;->notifyDataSetChanged()V

    .line 4316
    return-void
.end method
