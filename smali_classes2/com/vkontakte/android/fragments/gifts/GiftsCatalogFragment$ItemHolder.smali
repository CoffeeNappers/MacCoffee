.class Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$ItemHolder;
.super Lcom/vkontakte/android/ui/holder/RecyclerHolder;
.source "GiftsCatalogFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ItemHolder"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$ItemHolder$HorizontalListAdapter;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
        "<",
        "Lcom/vkontakte/android/api/models/GiftCategory;",
        ">;"
    }
.end annotation


# instance fields
.field private final mAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;

.field private mData:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/api/models/CatalogedGift;",
            ">;"
        }
    .end annotation
.end field

.field private mLastMinHeight:I

.field mLastPosition:I

.field private final mRecycler:Lme/grishka/appkit/views/UsableRecyclerView;

.field final synthetic this$0:Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;Landroid/view/ViewGroup;)V
    .locals 4
    .param p2, "parent"    # Landroid/view/ViewGroup;

    .prologue
    const/4 v3, 0x0

    .line 379
    iput-object p1, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$ItemHolder;->this$0:Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;

    .line 380
    new-instance v0, Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {p2}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lme/grishka/appkit/views/UsableRecyclerView;-><init>(Landroid/content/Context;)V

    invoke-direct {p0, v0}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;-><init>(Landroid/view/View;)V

    .line 377
    const/4 v0, -0x1

    iput v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$ItemHolder;->mLastPosition:I

    .line 381
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$ItemHolder;->itemView:Landroid/view/View;

    check-cast v0, Lme/grishka/appkit/views/UsableRecyclerView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$ItemHolder;->mRecycler:Lme/grishka/appkit/views/UsableRecyclerView;

    .line 382
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$ItemHolder;->mRecycler:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v0, v3}, Lme/grishka/appkit/views/UsableRecyclerView;->setNestedScrollingEnabled(Z)V

    .line 383
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$ItemHolder;->mRecycler:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v0, v3}, Lme/grishka/appkit/views/UsableRecyclerView;->setClipToPadding(Z)V

    .line 384
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$ItemHolder;->mRecycler:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-static {p1}, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->access$700(Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;)I

    move-result v1

    invoke-static {p1}, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->access$700(Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;)I

    move-result v2

    invoke-virtual {v0, v1, v3, v2, v3}, Lme/grishka/appkit/views/UsableRecyclerView;->setPadding(IIII)V

    .line 385
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$ItemHolder;->mRecycler:Lme/grishka/appkit/views/UsableRecyclerView;

    new-instance v1, Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$ItemHolder;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2, v3, v3}, Landroid/support/v7/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    invoke-virtual {v0, v1}, Lme/grishka/appkit/views/UsableRecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    .line 386
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$ItemHolder;->mRecycler:Lme/grishka/appkit/views/UsableRecyclerView;

    new-instance v1, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$ItemHolder$HorizontalListAdapter;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$ItemHolder$HorizontalListAdapter;-><init>(Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$ItemHolder;Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$1;)V

    iput-object v1, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$ItemHolder;->mAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;

    invoke-virtual {v0, v1}, Lme/grishka/appkit/views/UsableRecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 387
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$ItemHolder;->mRecycler:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-static {}, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->access$900()Lcom/vkontakte/android/ui/recyclerview/SpaceItemDecoration;

    move-result-object v1

    invoke-virtual {v0, v1}, Lme/grishka/appkit/views/UsableRecyclerView;->removeItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    .line 388
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$ItemHolder;->mRecycler:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-static {}, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->access$900()Lcom/vkontakte/android/ui/recyclerview/SpaceItemDecoration;

    move-result-object v1

    invoke-virtual {v0, v1}, Lme/grishka/appkit/views/UsableRecyclerView;->addItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    .line 389
    return-void
.end method

.method static synthetic access$1300(Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$ItemHolder;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$ItemHolder;

    .prologue
    .line 371
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$ItemHolder;->mData:Ljava/util/List;

    return-object v0
.end method


# virtual methods
.method public onBind(Lcom/vkontakte/android/api/models/GiftCategory;)V
    .locals 2
    .param p1, "item"    # Lcom/vkontakte/android/api/models/GiftCategory;

    .prologue
    .line 393
    iget-object v0, p1, Lcom/vkontakte/android/api/models/GiftCategory;->items:Ljava/util/List;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$ItemHolder;->mData:Ljava/util/List;

    .line 394
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$ItemHolder;->mAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/api/models/GiftCategory;->setTag(Ljava/lang/Object;)V

    .line 395
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$ItemHolder;->mAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 396
    iget v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$ItemHolder;->mLastMinHeight:I

    iget-object v1, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$ItemHolder;->this$0:Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->access$1000(Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;)I

    move-result v1

    if-eq v0, v1, :cond_0

    .line 397
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$ItemHolder;->this$0:Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->access$1000(Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;)I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$ItemHolder;->mLastMinHeight:I

    .line 398
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$ItemHolder;->mRecycler:Lme/grishka/appkit/views/UsableRecyclerView;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$ItemHolder;->this$0:Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->access$1000(Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;)I

    move-result v1

    invoke-virtual {v0, v1}, Lme/grishka/appkit/views/UsableRecyclerView;->setMinimumHeight(I)V

    .line 400
    :cond_0
    return-void
.end method

.method public bridge synthetic onBind(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 371
    check-cast p1, Lcom/vkontakte/android/api/models/GiftCategory;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$ItemHolder;->onBind(Lcom/vkontakte/android/api/models/GiftCategory;)V

    return-void
.end method
