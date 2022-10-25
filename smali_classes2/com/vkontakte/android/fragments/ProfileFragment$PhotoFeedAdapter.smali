.class abstract Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedAdapter;
.super Lcom/vkontakte/android/ui/adapters/LoadingAdapter;
.source "ProfileFragment.java"

# interfaces
.implements Lcom/vkontakte/android/PhotoViewer$PhotoViewerCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/ProfileFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x402
    name = "PhotoFeedAdapter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/ui/adapters/LoadingAdapter",
        "<",
        "Lcom/vkontakte/android/Photo;",
        "Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedViewHolder;",
        ">;",
        "Lcom/vkontakte/android/PhotoViewer$PhotoViewerCallback;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/ProfileFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/ProfileFragment;Ljava/util/List;Lme/grishka/appkit/views/UsableRecyclerView;)V
    .locals 1
    .param p3, "list"    # Lme/grishka/appkit/views/UsableRecyclerView;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/Photo;",
            ">;",
            "Lme/grishka/appkit/views/UsableRecyclerView;",
            ")V"
        }
    .end annotation

    .prologue
    .line 3987
    .local p2, "initialList":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/Photo;>;"
    iput-object p1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedAdapter;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    .line 3988
    const/16 v0, 0x32

    invoke-direct {p0, p2, p3, v0}, Lcom/vkontakte/android/ui/adapters/LoadingAdapter;-><init>(Ljava/util/List;Lme/grishka/appkit/views/UsableRecyclerView;I)V

    .line 3989
    return-void
.end method

.method static synthetic access$6800(Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedAdapter;)Lme/grishka/appkit/utils/Preloader;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedAdapter;

    .prologue
    .line 3984
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedAdapter;->preloader:Lme/grishka/appkit/utils/Preloader;

    return-object v0
.end method

.method static synthetic access$6900(Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedAdapter;)Lme/grishka/appkit/utils/Preloader;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedAdapter;

    .prologue
    .line 3984
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedAdapter;->preloader:Lme/grishka/appkit/utils/Preloader;

    return-object v0
.end method


# virtual methods
.method public getImageCountForItem(I)I
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 4015
    const/4 v0, 0x1

    return v0
.end method

.method public getImageURL(II)Ljava/lang/String;
    .locals 4
    .param p1, "position"    # I
    .param p2, "image"    # I

    .prologue
    const/16 v2, 0x6d

    .line 4020
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedAdapter;->displayItems:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/Photo;

    sget v1, Lcom/vkontakte/android/Global;->displayDensity:F

    const/high16 v3, 0x3f800000    # 1.0f

    cmpl-float v1, v1, v3

    if-lez v1, :cond_1

    sget v1, Lcom/vkontakte/android/Global;->displayDensity:F

    const/high16 v3, 0x40000000    # 2.0f

    cmpl-float v1, v1, v3

    if-lez v1, :cond_0

    const/16 v1, 0x70

    :goto_0
    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/Photo;->getImage(CC)Lcom/vkontakte/android/Photo$Image;

    move-result-object v0

    iget-object v0, v0, Lcom/vkontakte/android/Photo$Image;->url:Ljava/lang/String;

    return-object v0

    :cond_0
    const/16 v1, 0x6f

    goto :goto_0

    :cond_1
    move v1, v2

    goto :goto_0
.end method

.method public getPhotoBounds(ILandroid/graphics/Rect;Landroid/graphics/Rect;)V
    .locals 11
    .param p1, "index"    # I
    .param p2, "outRect"    # Landroid/graphics/Rect;
    .param p3, "outClip"    # Landroid/graphics/Rect;

    .prologue
    const/4 v10, 0x1

    const/4 v8, 0x0

    .line 4043
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v6, p0, Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedAdapter;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v6}, Lme/grishka/appkit/views/UsableRecyclerView;->getChildCount()I

    move-result v6

    if-ge v1, v6, :cond_1

    .line 4044
    iget-object v6, p0, Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedAdapter;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v6, v1}, Lme/grishka/appkit/views/UsableRecyclerView;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    .line 4045
    .local v5, "v":Landroid/view/View;
    iget-object v6, p0, Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedAdapter;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v6, v5}, Lme/grishka/appkit/views/UsableRecyclerView;->getChildViewHolder(Landroid/view/View;)Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;

    move-result-object v0

    .line 4046
    .local v0, "holder":Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;
    instance-of v6, v0, Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedViewHolder;

    if-eqz v6, :cond_2

    .line 4047
    check-cast v0, Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedViewHolder;

    .end local v0    # "holder":Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;
    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedViewHolder;->getItem()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vkontakte/android/Photo;

    .line 4048
    .local v4, "photo":Lcom/vkontakte/android/Photo;
    iget-object v6, p0, Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedAdapter;->preloader:Lme/grishka/appkit/utils/Preloader;

    invoke-virtual {v6}, Lme/grishka/appkit/utils/Preloader;->getData()Ljava/util/ArrayList;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v6

    if-ne v6, p1, :cond_2

    .line 4049
    const/4 v6, 0x2

    new-array v2, v6, [I

    fill-array-data v2, :array_0

    .line 4050
    .local v2, "loc":[I
    invoke-virtual {v5, v2}, Landroid/view/View;->getLocationInWindow([I)V

    .line 4051
    aget v6, v2, v8

    aget v7, v2, v10

    aget v8, v2, v8

    invoke-virtual {v5}, Landroid/view/View;->getWidth()I

    move-result v9

    add-int/2addr v8, v9

    aget v9, v2, v10

    invoke-virtual {v5}, Landroid/view/View;->getHeight()I

    move-result v10

    add-int/2addr v9, v10

    invoke-virtual {p2, v6, v7, v8, v9}, Landroid/graphics/Rect;->set(IIII)V

    .line 4052
    iget-object v6, p0, Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedAdapter;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-static {v5, v6}, Lme/grishka/appkit/utils/V;->getViewOffset(Landroid/view/View;Landroid/view/View;)Landroid/graphics/Point;

    move-result-object v3

    .line 4053
    .local v3, "offset":Landroid/graphics/Point;
    iget v6, v3, Landroid/graphics/Point;->y:I

    if-gez v6, :cond_0

    .line 4054
    iget v6, v3, Landroid/graphics/Point;->y:I

    neg-int v6, v6

    iput v6, p3, Landroid/graphics/Rect;->top:I

    .line 4056
    :cond_0
    iget v6, v3, Landroid/graphics/Point;->y:I

    invoke-virtual {v5}, Landroid/view/View;->getHeight()I

    move-result v7

    add-int/2addr v6, v7

    iget-object v7, p0, Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedAdapter;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v7}, Lme/grishka/appkit/views/UsableRecyclerView;->getHeight()I

    move-result v7

    if-le v6, v7, :cond_1

    .line 4057
    iget v6, v3, Landroid/graphics/Point;->y:I

    invoke-virtual {v5}, Landroid/view/View;->getHeight()I

    move-result v7

    add-int/2addr v6, v7

    iget-object v7, p0, Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedAdapter;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v7}, Lme/grishka/appkit/views/UsableRecyclerView;->getHeight()I

    move-result v7

    sub-int/2addr v6, v7

    iput v6, p3, Landroid/graphics/Rect;->bottom:I

    .line 4063
    .end local v2    # "loc":[I
    .end local v3    # "offset":Landroid/graphics/Point;
    .end local v4    # "photo":Lcom/vkontakte/android/Photo;
    .end local v5    # "v":Landroid/view/View;
    :cond_1
    return-void

    .line 4043
    .restart local v5    # "v":Landroid/view/View;
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 4049
    nop

    :array_0
    .array-data 4
        0x0
        0x0
    .end array-data
.end method

.method public isMoreAvailable()Z
    .locals 1

    .prologue
    .line 4067
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedAdapter;->preloader:Lme/grishka/appkit/utils/Preloader;

    invoke-virtual {v0}, Lme/grishka/appkit/utils/Preloader;->isMoreAvailable()Z

    move-result v0

    return v0
.end method

.method public abstract loadData(II)V
.end method

.method public loadMore()V
    .locals 1

    .prologue
    .line 4072
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedAdapter;->preloader:Lme/grishka/appkit/utils/Preloader;

    invoke-virtual {v0}, Lme/grishka/appkit/utils/Preloader;->onScrolledToLastItem()V

    .line 4073
    return-void
.end method

.method public onAppendItems(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/Photo;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 4028
    .local p1, "items":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/Photo;>;"
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/Photo;

    .line 4029
    .local v0, "photo":Lcom/vkontakte/android/Photo;
    iget-boolean v2, v0, Lcom/vkontakte/android/Photo;->hidden:Z

    if-nez v2, :cond_0

    .line 4030
    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedAdapter;->displayItems:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 4033
    .end local v0    # "photo":Lcom/vkontakte/android/Photo;
    :cond_1
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedAdapter;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$6700(Lcom/vkontakte/android/fragments/ProfileFragment;)Lcom/vkontakte/android/PhotoViewer;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 4034
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedAdapter;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$6700(Lcom/vkontakte/android/fragments/ProfileFragment;)Lcom/vkontakte/android/PhotoViewer;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/vkontakte/android/PhotoViewer;->appendPhotos(Ljava/util/List;)V

    .line 4036
    :cond_2
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedAdapter;->displayItems:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-nez v1, :cond_3

    .line 4037
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedAdapter;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$7000(Lcom/vkontakte/android/fragments/ProfileFragment;)Landroid/view/ViewGroup;

    move-result-object v1

    invoke-static {p0}, Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedAdapter$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedAdapter;)Ljava/lang/Runnable;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->post(Ljava/lang/Runnable;)Z

    .line 4039
    :cond_3
    return-void
.end method

.method public bridge synthetic onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    .prologue
    .line 3984
    check-cast p1, Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedViewHolder;

    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedAdapter;->onBindViewHolder(Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedViewHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedViewHolder;I)V
    .locals 1
    .param p1, "holder"    # Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedViewHolder;
    .param p2, "position"    # I

    .prologue
    .line 4010
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedAdapter;->displayItems:Ljava/util/ArrayList;

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedViewHolder;->bind(Ljava/lang/Object;)V

    .line 4011
    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 1

    .prologue
    .line 3984
    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedViewHolder;

    move-result-object v0

    return-object v0
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedViewHolder;
    .locals 1
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # I

    .prologue
    .line 3993
    new-instance v0, Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedAdapter$1;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedAdapter$1;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedAdapter;)V

    return-object v0
.end method

.method public onDismissed()V
    .locals 2

    .prologue
    .line 4077
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedAdapter;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$6702(Lcom/vkontakte/android/fragments/ProfileFragment;Lcom/vkontakte/android/PhotoViewer;)Lcom/vkontakte/android/PhotoViewer;

    .line 4078
    return-void
.end method
