.class Lcom/vkontakte/android/fragments/stickers/StoreTabFragment$Adapter;
.super Lme/grishka/appkit/views/UsableRecyclerView$Adapter;
.source "StoreTabFragment.java"

# interfaces
.implements Lcom/vkontakte/android/ui/recyclerview/CardItemDecoration$Provider;
.implements Lcom/vkontakte/android/ui/recyclerview/BottomDividerDecoration$Provider;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "Adapter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lme/grishka/appkit/views/UsableRecyclerView$Adapter",
        "<",
        "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
        "<",
        "Lcom/vkontakte/android/data/orm/StickerStockItem;",
        ">;>;",
        "Lcom/vkontakte/android/ui/recyclerview/CardItemDecoration$Provider;",
        "Lcom/vkontakte/android/ui/recyclerview/BottomDividerDecoration$Provider;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;)V
    .locals 0

    .prologue
    .line 206
    iput-object p1, p0, Lcom/vkontakte/android/fragments/stickers/StoreTabFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;

    invoke-direct {p0}, Lme/grishka/appkit/views/UsableRecyclerView$Adapter;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;Lcom/vkontakte/android/fragments/stickers/StoreTabFragment$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;
    .param p2, "x1"    # Lcom/vkontakte/android/fragments/stickers/StoreTabFragment$1;

    .prologue
    .line 206
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/stickers/StoreTabFragment$Adapter;-><init>(Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;)V

    return-void
.end method


# virtual methods
.method public drawAfter(I)Z
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 239
    const/4 v0, 0x1

    return v0
.end method

.method public getBlockType(I)I
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 234
    const/16 v0, 0x1f

    return v0
.end method

.method public getImageCountForItem(I)I
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 224
    const/4 v0, 0x1

    return v0
.end method

.method public getImageURL(II)Ljava/lang/String;
    .locals 1
    .param p1, "position"    # I
    .param p2, "image"    # I

    .prologue
    .line 229
    iget-object v0, p0, Lcom/vkontakte/android/fragments/stickers/StoreTabFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;->access$100(Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;)Lcom/vkontakte/android/api/store/StoreGetCatalog$Section;

    move-result-object v0

    iget-object v0, v0, Lcom/vkontakte/android/api/store/StoreGetCatalog$Section;->stickers:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/data/orm/StickerStockItem;

    invoke-virtual {v0}, Lcom/vkontakte/android/data/orm/StickerStockItem;->getThumbUrl()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getItemCount()I
    .locals 1

    .prologue
    .line 219
    iget-object v0, p0, Lcom/vkontakte/android/fragments/stickers/StoreTabFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;->access$100(Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;)Lcom/vkontakte/android/api/store/StoreGetCatalog$Section;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/stickers/StoreTabFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;->access$100(Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;)Lcom/vkontakte/android/api/store/StoreGetCatalog$Section;

    move-result-object v0

    iget-object v0, v0, Lcom/vkontakte/android/api/store/StoreGetCatalog$Section;->stickers:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    goto :goto_0
.end method

.method public bridge synthetic onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    .prologue
    .line 206
    check-cast p1, Lcom/vkontakte/android/ui/holder/RecyclerHolder;

    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/fragments/stickers/StoreTabFragment$Adapter;->onBindViewHolder(Lcom/vkontakte/android/ui/holder/RecyclerHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/vkontakte/android/ui/holder/RecyclerHolder;I)V
    .locals 1
    .param p2, "position"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
            "<",
            "Lcom/vkontakte/android/data/orm/StickerStockItem;",
            ">;I)V"
        }
    .end annotation

    .prologue
    .line 214
    .local p1, "holder":Lcom/vkontakte/android/ui/holder/RecyclerHolder;, "Lcom/vkontakte/android/ui/holder/RecyclerHolder<Lcom/vkontakte/android/data/orm/StickerStockItem;>;"
    iget-object v0, p0, Lcom/vkontakte/android/fragments/stickers/StoreTabFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;->access$100(Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;)Lcom/vkontakte/android/api/store/StoreGetCatalog$Section;

    move-result-object v0

    iget-object v0, v0, Lcom/vkontakte/android/api/store/StoreGetCatalog$Section;->stickers:Ljava/util/List;

    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;->bind(Ljava/lang/Object;)V

    .line 215
    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 1

    .prologue
    .line 206
    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/fragments/stickers/StoreTabFragment$Adapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/vkontakte/android/ui/holder/RecyclerHolder;

    move-result-object v0

    return-object v0
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/vkontakte/android/ui/holder/RecyclerHolder;
    .locals 2
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/ViewGroup;",
            "I)",
            "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
            "<",
            "Lcom/vkontakte/android/data/orm/StickerStockItem;",
            ">;"
        }
    .end annotation

    .prologue
    .line 209
    new-instance v0, Lcom/vkontakte/android/fragments/stickers/StickerStoreListHolder;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/stickers/StoreTabFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;->access$500(Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;)Landroid/view/View$OnClickListener;

    move-result-object v1

    invoke-direct {v0, p1, v1}, Lcom/vkontakte/android/fragments/stickers/StickerStoreListHolder;-><init>(Landroid/view/ViewGroup;Landroid/view/View$OnClickListener;)V

    return-object v0
.end method
