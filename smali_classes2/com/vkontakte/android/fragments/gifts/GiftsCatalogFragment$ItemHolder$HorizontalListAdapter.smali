.class Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$ItemHolder$HorizontalListAdapter;
.super Lme/grishka/appkit/views/UsableRecyclerView$Adapter;
.source "GiftsCatalogFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$ItemHolder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "HorizontalListAdapter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lme/grishka/appkit/views/UsableRecyclerView$Adapter",
        "<",
        "Lcom/vkontakte/android/fragments/gifts/GiftHolder;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$ItemHolder;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$ItemHolder;)V
    .locals 0

    .prologue
    .line 402
    iput-object p1, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$ItemHolder$HorizontalListAdapter;->this$1:Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$ItemHolder;

    invoke-direct {p0}, Lme/grishka/appkit/views/UsableRecyclerView$Adapter;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$ItemHolder;Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$ItemHolder;
    .param p2, "x1"    # Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$1;

    .prologue
    .line 402
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$ItemHolder$HorizontalListAdapter;-><init>(Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$ItemHolder;)V

    return-void
.end method


# virtual methods
.method public getImageCountForItem(I)I
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 421
    const/4 v0, 0x1

    return v0
.end method

.method public getImageURL(II)Ljava/lang/String;
    .locals 2
    .param p1, "position"    # I
    .param p2, "image"    # I

    .prologue
    .line 426
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$ItemHolder$HorizontalListAdapter;->this$1:Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$ItemHolder;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$ItemHolder;->access$1300(Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$ItemHolder;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/api/models/CatalogedGift;

    iget-object v0, v0, Lcom/vkontakte/android/api/models/CatalogedGift;->gift:Lcom/vkontakte/android/api/models/Gift;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$ItemHolder$HorizontalListAdapter;->this$1:Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$ItemHolder;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$ItemHolder;->this$0:Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->access$1400(Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/models/Gift;->getImage(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getItemCount()I
    .locals 1

    .prologue
    .line 416
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$ItemHolder$HorizontalListAdapter;->this$1:Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$ItemHolder;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$ItemHolder;->access$1300(Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$ItemHolder;)Ljava/util/List;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$ItemHolder$HorizontalListAdapter;->this$1:Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$ItemHolder;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$ItemHolder;->access$1300(Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$ItemHolder;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    goto :goto_0
.end method

.method public bridge synthetic onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    .prologue
    .line 402
    check-cast p1, Lcom/vkontakte/android/fragments/gifts/GiftHolder;

    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$ItemHolder$HorizontalListAdapter;->onBindViewHolder(Lcom/vkontakte/android/fragments/gifts/GiftHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/vkontakte/android/fragments/gifts/GiftHolder;I)V
    .locals 2
    .param p1, "holder"    # Lcom/vkontakte/android/fragments/gifts/GiftHolder;
    .param p2, "position"    # I

    .prologue
    .line 411
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$ItemHolder$HorizontalListAdapter;->this$1:Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$ItemHolder;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$ItemHolder;->this$0:Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->access$1100(Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;)I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/fragments/gifts/GiftHolder;->setSize(I)Lcom/vkontakte/android/fragments/gifts/GiftHolder;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$ItemHolder$HorizontalListAdapter;->this$1:Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$ItemHolder;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$ItemHolder;->access$1300(Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$ItemHolder;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/gifts/GiftHolder;->bind(Ljava/lang/Object;)V

    .line 412
    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 1

    .prologue
    .line 402
    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$ItemHolder$HorizontalListAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/vkontakte/android/fragments/gifts/GiftHolder;

    move-result-object v0

    return-object v0
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/vkontakte/android/fragments/gifts/GiftHolder;
    .locals 2
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # I

    .prologue
    .line 406
    new-instance v0, Lcom/vkontakte/android/fragments/gifts/GiftHolder;

    invoke-direct {v0, p1}, Lcom/vkontakte/android/fragments/gifts/GiftHolder;-><init>(Landroid/view/ViewGroup;)V

    iget-object v1, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$ItemHolder$HorizontalListAdapter;->this$1:Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$ItemHolder;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$ItemHolder;->this$0:Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->access$1200(Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;)Lcom/vkontakte/android/functions/VoidF1;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/gifts/GiftHolder;->onClick(Lcom/vkontakte/android/functions/VoidF1;)Lcom/vkontakte/android/fragments/gifts/GiftHolder;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$ItemHolder$HorizontalListAdapter;->this$1:Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$ItemHolder;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$ItemHolder;->this$0:Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->access$1100(Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/gifts/GiftHolder;->setSize(I)Lcom/vkontakte/android/fragments/gifts/GiftHolder;

    move-result-object v0

    return-object v0
.end method
