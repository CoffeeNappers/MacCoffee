.class Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$Adapter;
.super Lcom/vkontakte/android/fragments/base/GridFragment$GridAdapter;
.source "GiftsCatalogFragment.java"

# interfaces
.implements Lcom/vkontakte/android/ui/recyclerview/BottomDividerDecoration$Provider;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "Adapter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/fragments/base/GridFragment",
        "<",
        "Lcom/vkontakte/android/api/models/GiftCategory;",
        ">.GridAdapter<",
        "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
        "<",
        "Lcom/vkontakte/android/api/models/GiftCategory;",
        ">;>;",
        "Lcom/vkontakte/android/ui/recyclerview/BottomDividerDecoration$Provider;"
    }
.end annotation


# static fields
.field static final TYPE_FOOTER:I = 0x2

.field static final TYPE_HEADER:I = 0x1

.field static final TYPE_ITEM:I


# instance fields
.field private mGridStates:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Landroid/os/Parcelable;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;)V
    .locals 1

    .prologue
    .line 283
    iput-object p1, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;

    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/base/GridFragment$GridAdapter;-><init>(Lcom/vkontakte/android/fragments/base/GridFragment;)V

    .line 285
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$Adapter;->mGridStates:Landroid/util/SparseArray;

    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;
    .param p2, "x1"    # Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$1;

    .prologue
    .line 283
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$Adapter;-><init>(Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;)V

    return-void
.end method


# virtual methods
.method public drawAfter(I)Z
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 344
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$Adapter;->getItemViewType(I)I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getBlockType(I)I
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 339
    const/4 v0, 0x0

    return v0
.end method

.method public getItemCount()I
    .locals 1

    .prologue
    .line 334
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->access$600(Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    shl-int/lit8 v0, v0, 0x1

    add-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public getItemViewType(I)I
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 329
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$Adapter;->getItemCount()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    if-ne p1, v0, :cond_0

    const/4 v0, 0x2

    :goto_0
    return v0

    :cond_0
    rem-int/lit8 v0, p1, 0x2

    if-nez v0, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public bridge synthetic onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    .prologue
    .line 283
    check-cast p1, Lcom/vkontakte/android/ui/holder/RecyclerHolder;

    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$Adapter;->onBindViewHolder(Lcom/vkontakte/android/ui/holder/RecyclerHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/vkontakte/android/ui/holder/RecyclerHolder;I)V
    .locals 4
    .param p2, "position"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
            "<",
            "Lcom/vkontakte/android/api/models/GiftCategory;",
            ">;I)V"
        }
    .end annotation

    .prologue
    .line 313
    .local p1, "holder":Lcom/vkontakte/android/ui/holder/RecyclerHolder;, "Lcom/vkontakte/android/ui/holder/RecyclerHolder<Lcom/vkontakte/android/api/models/GiftCategory;>;"
    invoke-virtual {p0, p2}, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$Adapter;->getItemViewType(I)I

    move-result v1

    .line 315
    .local v1, "viewType":I
    const/4 v2, 0x2

    if-eq v1, v2, :cond_0

    .line 316
    iget-object v2, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->access$500(Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;)Ljava/util/ArrayList;

    move-result-object v2

    shr-int/lit8 v3, p2, 0x1

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p1, v2}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;->bind(Ljava/lang/Object;)V

    .line 319
    :cond_0
    if-nez v1, :cond_1

    .line 320
    iget-object v2, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$Adapter;->mGridStates:Landroid/util/SparseArray;

    invoke-virtual {v2, p2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/Parcelable;

    .line 321
    .local v0, "savedState":Landroid/os/Parcelable;
    if-eqz v0, :cond_1

    .line 322
    iget-object v2, p1, Lcom/vkontakte/android/ui/holder/RecyclerHolder;->itemView:Landroid/view/View;

    check-cast v2, Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v2}, Landroid/support/v7/widget/RecyclerView;->getLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 325
    .end local v0    # "savedState":Landroid/os/Parcelable;
    :cond_1
    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 1

    .prologue
    .line 283
    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$Adapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/vkontakte/android/ui/holder/RecyclerHolder;

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
            "Lcom/vkontakte/android/api/models/GiftCategory;",
            ">;"
        }
    .end annotation

    .prologue
    .line 292
    packed-switch p2, :pswitch_data_0

    .line 300
    const/4 v0, 0x0

    :goto_0
    return-object v0

    .line 294
    :pswitch_0
    new-instance v0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$HeaderHolder;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;

    invoke-direct {v0, v1, p1}, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$HeaderHolder;-><init>(Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;Landroid/view/ViewGroup;)V

    goto :goto_0

    .line 296
    :pswitch_1
    new-instance v0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$ItemHolder;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;

    invoke-direct {v0, v1, p1}, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$ItemHolder;-><init>(Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;Landroid/view/ViewGroup;)V

    goto :goto_0

    .line 298
    :pswitch_2
    new-instance v0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$FooterHolder;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;

    invoke-direct {v0, v1, p1}, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$FooterHolder;-><init>(Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;Landroid/view/ViewGroup;)V

    goto :goto_0

    .line 292
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method public bridge synthetic onViewRecycled(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V
    .locals 0

    .prologue
    .line 283
    check-cast p1, Lcom/vkontakte/android/ui/holder/RecyclerHolder;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$Adapter;->onViewRecycled(Lcom/vkontakte/android/ui/holder/RecyclerHolder;)V

    return-void
.end method

.method public onViewRecycled(Lcom/vkontakte/android/ui/holder/RecyclerHolder;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
            "<",
            "Lcom/vkontakte/android/api/models/GiftCategory;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 306
    .local p1, "holder":Lcom/vkontakte/android/ui/holder/RecyclerHolder;, "Lcom/vkontakte/android/ui/holder/RecyclerHolder<Lcom/vkontakte/android/api/models/GiftCategory;>;"
    invoke-virtual {p1}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;->getItemViewType()I

    move-result v0

    if-nez v0, :cond_0

    .line 307
    iget-object v1, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$Adapter;->mGridStates:Landroid/util/SparseArray;

    invoke-virtual {p1}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;->getAdapterPosition()I

    move-result v2

    iget-object v0, p1, Lcom/vkontakte/android/ui/holder/RecyclerHolder;->itemView:Landroid/view/View;

    check-cast v0, Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView;->getLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v0

    invoke-virtual {v1, v2, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 309
    :cond_0
    return-void
.end method
