.class Lcom/vkontakte/android/fragments/ProfileFragment$GoodsAdapter;
.super Lcom/vkontakte/android/ui/adapters/LoadingAdapter;
.source "ProfileFragment.java"

# interfaces
.implements Lcom/vkontakte/android/ui/widget/HorizontalRecyclerView$ItemWidthFixable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/ProfileFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "GoodsAdapter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/ui/adapters/LoadingAdapter",
        "<",
        "Lcom/vkontakte/android/data/Good;",
        "Lcom/vkontakte/android/fragments/ProfileFragment$GoodViewHolder;",
        ">;",
        "Lcom/vkontakte/android/ui/widget/HorizontalRecyclerView$ItemWidthFixable;"
    }
.end annotation


# instance fields
.field itemWidth:I

.field mainAlbumId:I

.field final synthetic this$0:Lcom/vkontakte/android/fragments/ProfileFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/ProfileFragment;Ljava/util/List;Lme/grishka/appkit/views/UsableRecyclerView;I)V
    .locals 1
    .param p3, "list"    # Lme/grishka/appkit/views/UsableRecyclerView;
    .param p4, "mainAlbumId"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/data/Good;",
            ">;",
            "Lme/grishka/appkit/views/UsableRecyclerView;",
            "I)V"
        }
    .end annotation

    .prologue
    .line 4087
    .local p2, "initialList":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/data/Good;>;"
    iput-object p1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$GoodsAdapter;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    .line 4088
    const/16 v0, 0xa

    invoke-direct {p0, p2, p3, v0}, Lcom/vkontakte/android/ui/adapters/LoadingAdapter;-><init>(Ljava/util/List;Lme/grishka/appkit/views/UsableRecyclerView;I)V

    .line 4089
    iput p4, p0, Lcom/vkontakte/android/fragments/ProfileFragment$GoodsAdapter;->mainAlbumId:I

    .line 4090
    return-void
.end method

.method static synthetic access$7102(Lcom/vkontakte/android/fragments/ProfileFragment$GoodsAdapter;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileFragment$GoodsAdapter;
    .param p1, "x1"    # Z

    .prologue
    .line 4081
    iput-boolean p1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$GoodsAdapter;->dataLoading:Z

    return p1
.end method

.method static synthetic access$7200(Lcom/vkontakte/android/fragments/ProfileFragment$GoodsAdapter;)Lme/grishka/appkit/utils/Preloader;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileFragment$GoodsAdapter;

    .prologue
    .line 4081
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$GoodsAdapter;->preloader:Lme/grishka/appkit/utils/Preloader;

    return-object v0
.end method

.method static synthetic access$7300(Lcom/vkontakte/android/fragments/ProfileFragment$GoodsAdapter;)Lme/grishka/appkit/utils/Preloader;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileFragment$GoodsAdapter;

    .prologue
    .line 4081
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$GoodsAdapter;->preloader:Lme/grishka/appkit/utils/Preloader;

    return-object v0
.end method

.method static synthetic access$7400(Lcom/vkontakte/android/fragments/ProfileFragment$GoodsAdapter;)Lme/grishka/appkit/utils/Preloader;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileFragment$GoodsAdapter;

    .prologue
    .line 4081
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$GoodsAdapter;->preloader:Lme/grishka/appkit/utils/Preloader;

    return-object v0
.end method

.method static synthetic access$7502(Lcom/vkontakte/android/fragments/ProfileFragment$GoodsAdapter;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileFragment$GoodsAdapter;
    .param p1, "x1"    # Z

    .prologue
    .line 4081
    iput-boolean p1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$GoodsAdapter;->dataLoading:Z

    return p1
.end method


# virtual methods
.method public getImageCountForItem(I)I
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 4105
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$GoodsAdapter;->displayItems:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/data/Good;

    iget-object v0, v0, Lcom/vkontakte/android/data/Good;->photos:[Lcom/vkontakte/android/Photo;

    invoke-static {v0}, Lcom/vkontakte/android/utils/Utils;->isEmptyArray([Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public getImageURL(II)Ljava/lang/String;
    .locals 4
    .param p1, "position"    # I
    .param p2, "image"    # I

    .prologue
    const/4 v2, 0x0

    .line 4115
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$GoodsAdapter;->displayItems:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/data/Good;

    iget-object v1, v1, Lcom/vkontakte/android/data/Good;->photos:[Lcom/vkontakte/android/Photo;

    invoke-static {v1}, Lcom/vkontakte/android/utils/Utils;->isEmptyArray([Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 4116
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$GoodsAdapter;->displayItems:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/data/Good;

    iget-object v1, v1, Lcom/vkontakte/android/data/Good;->photos:[Lcom/vkontakte/android/Photo;

    const/4 v3, 0x0

    aget-object v1, v1, v3

    const/high16 v3, 0x43080000    # 136.0f

    invoke-static {v3}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v3

    invoke-virtual {v1, v3}, Lcom/vkontakte/android/Photo;->getImageByWidth(I)Lcom/vkontakte/android/Photo$Image;

    move-result-object v0

    .line 4117
    .local v0, "image1":Lcom/vkontakte/android/Photo$Image;
    if-nez v0, :cond_0

    move-object v1, v2

    .line 4120
    .end local v0    # "image1":Lcom/vkontakte/android/Photo$Image;
    :goto_0
    return-object v1

    .line 4117
    .restart local v0    # "image1":Lcom/vkontakte/android/Photo$Image;
    :cond_0
    iget-object v1, v0, Lcom/vkontakte/android/Photo$Image;->url:Ljava/lang/String;

    goto :goto_0

    .end local v0    # "image1":Lcom/vkontakte/android/Photo$Image;
    :cond_1
    move-object v1, v2

    .line 4120
    goto :goto_0
.end method

.method public loadData(II)V
    .locals 3
    .param p1, "offset"    # I
    .param p2, "count"    # I

    .prologue
    .line 4125
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$GoodsAdapter;->dataLoading:Z

    .line 4126
    iget v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$GoodsAdapter;->mainAlbumId:I

    if-ltz v1, :cond_0

    new-instance v0, Lcom/vkontakte/android/api/market/MarketGet;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$GoodsAdapter;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$100(Lcom/vkontakte/android/fragments/ProfileFragment;)I

    move-result v1

    iget v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment$GoodsAdapter;->mainAlbumId:I

    invoke-direct {v0, v1, p1, p2, v2}, Lcom/vkontakte/android/api/market/MarketGet;-><init>(IIII)V

    .line 4128
    .local v0, "marketGet":Lcom/vkontakte/android/api/market/MarketGet;
    :goto_0
    new-instance v1, Lcom/vkontakte/android/fragments/ProfileFragment$GoodsAdapter$1;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/fragments/ProfileFragment$GoodsAdapter$1;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment$GoodsAdapter;)V

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/market/MarketGet;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment$GoodsAdapter;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    .line 4139
    invoke-virtual {v2}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 4140
    return-void

    .line 4126
    .end local v0    # "marketGet":Lcom/vkontakte/android/api/market/MarketGet;
    :cond_0
    new-instance v0, Lcom/vkontakte/android/api/market/MarketGet;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$GoodsAdapter;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    .line 4127
    invoke-static {v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$100(Lcom/vkontakte/android/fragments/ProfileFragment;)I

    move-result v1

    invoke-direct {v0, v1, p1, p2}, Lcom/vkontakte/android/api/market/MarketGet;-><init>(III)V

    goto :goto_0
.end method

.method public onAppendItems(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/data/Good;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 4144
    .local p1, "items":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/data/Good;>;"
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/data/Good;

    .line 4145
    .local v0, "good":Lcom/vkontakte/android/data/Good;
    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment$GoodsAdapter;->displayItems:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 4147
    .end local v0    # "good":Lcom/vkontakte/android/data/Good;
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$GoodsAdapter;->displayItems:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-nez v1, :cond_1

    .line 4148
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$GoodsAdapter;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$7600(Lcom/vkontakte/android/fragments/ProfileFragment;)Landroid/view/ViewGroup;

    move-result-object v1

    invoke-static {p0}, Lcom/vkontakte/android/fragments/ProfileFragment$GoodsAdapter$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/fragments/ProfileFragment$GoodsAdapter;)Ljava/lang/Runnable;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->post(Ljava/lang/Runnable;)Z

    .line 4150
    :cond_1
    return-void
.end method

.method public bridge synthetic onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    .prologue
    .line 4081
    check-cast p1, Lcom/vkontakte/android/fragments/ProfileFragment$GoodViewHolder;

    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/fragments/ProfileFragment$GoodsAdapter;->onBindViewHolder(Lcom/vkontakte/android/fragments/ProfileFragment$GoodViewHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/vkontakte/android/fragments/ProfileFragment$GoodViewHolder;I)V
    .locals 1
    .param p1, "holder"    # Lcom/vkontakte/android/fragments/ProfileFragment$GoodViewHolder;
    .param p2, "position"    # I

    .prologue
    .line 4099
    iget v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$GoodsAdapter;->itemWidth:I

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/fragments/ProfileFragment$GoodViewHolder;->setItemWidth(I)V

    .line 4100
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$GoodsAdapter;->displayItems:Ljava/util/ArrayList;

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/fragments/ProfileFragment$GoodViewHolder;->bind(Ljava/lang/Object;)V

    .line 4101
    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 1

    .prologue
    .line 4081
    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/fragments/ProfileFragment$GoodsAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/vkontakte/android/fragments/ProfileFragment$GoodViewHolder;

    move-result-object v0

    return-object v0
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/vkontakte/android/fragments/ProfileFragment$GoodViewHolder;
    .locals 2
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # I

    .prologue
    .line 4094
    new-instance v0, Lcom/vkontakte/android/fragments/ProfileFragment$GoodViewHolder;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$GoodsAdapter;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-direct {v0, v1, p1}, Lcom/vkontakte/android/fragments/ProfileFragment$GoodViewHolder;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;Landroid/view/ViewGroup;)V

    return-object v0
.end method

.method public setItemWidth(I)V
    .locals 0
    .param p1, "width"    # I

    .prologue
    .line 4110
    iput p1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$GoodsAdapter;->itemWidth:I

    .line 4111
    return-void
.end method
