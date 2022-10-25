.class Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$Adapter;
.super Lcom/vkontakte/android/fragments/base/GridFragment$GridAdapter;
.source "StickerManagerFragment.java"

# interfaces
.implements Lcom/vkontakte/android/ui/recyclerview/BottomDividerDecoration$Provider;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "Adapter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/fragments/base/GridFragment",
        "<",
        "Lcom/vkontakte/android/data/orm/StickerStockItem;",
        ">.GridAdapter<",
        "Lcom/vkontakte/android/ui/holder/RecyclerHolder;",
        ">;",
        "Lcom/vkontakte/android/ui/recyclerview/BottomDividerDecoration$Provider;"
    }
.end annotation


# static fields
.field static final TYPE_HEADER:I = 0x0

.field static final TYPE_ITEM:I = 0x1

.field static final TYPE_SETTING:I = 0x2


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;)V
    .locals 0

    .prologue
    .line 211
    iput-object p1, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;

    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/base/GridFragment$GridAdapter;-><init>(Lcom/vkontakte/android/fragments/base/GridFragment;)V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;
    .param p2, "x1"    # Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$1;

    .prologue
    .line 211
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$Adapter;-><init>(Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;)V

    return-void
.end method

.method private get(I)Lcom/vkontakte/android/data/orm/StickerStockItem;
    .locals 2
    .param p1, "position"    # I

    .prologue
    .line 218
    iget-object v0, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;->listActivePositionToCollectionIndex(I)I

    move-result p1

    .line 219
    iget-object v0, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;->mActive:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-ge p1, v0, :cond_0

    .line 220
    iget-object v0, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;->mActive:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/data/orm/StickerStockItem;

    .line 223
    :goto_0
    return-object v0

    .line 222
    :cond_0
    add-int/lit8 p1, p1, -0x1

    .line 223
    iget-object v0, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;->mInactive:Ljava/util/List;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;->mActive:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    sub-int v1, p1, v1

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/data/orm/StickerStockItem;

    goto :goto_0
.end method


# virtual methods
.method public drawAfter(I)Z
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 306
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$Adapter;->getItemCount()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    if-ge p1, v0, :cond_0

    add-int/lit8 v0, p1, 0x1

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$Adapter;->getItemViewType(I)I

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
    .locals 4
    .param p1, "position"    # I

    .prologue
    .line 284
    const/4 v1, 0x0

    .line 285
    .local v1, "result":I
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$Adapter;->getItemCount()I

    move-result v0

    .line 286
    .local v0, "itemCount":I
    if-ne p1, v0, :cond_0

    move v2, v1

    .line 301
    .end local v1    # "result":I
    .local v2, "result":I
    :goto_0
    return v2

    .line 289
    .end local v2    # "result":I
    .restart local v1    # "result":I
    :cond_0
    if-nez p1, :cond_1

    .line 290
    or-int/lit8 v1, v1, 0x6

    .line 292
    :cond_1
    const/4 v3, 0x1

    if-ne p1, v3, :cond_2

    .line 293
    or-int/lit8 v1, v1, 0x2

    .line 295
    :cond_2
    add-int/lit8 v3, v0, -0x1

    if-ne p1, v3, :cond_3

    .line 298
    :cond_3
    if-nez v1, :cond_4

    .line 299
    or-int/lit8 v1, v1, 0x1

    :cond_4
    move v2, v1

    .line 301
    .end local v1    # "result":I
    .restart local v2    # "result":I
    goto :goto_0
.end method

.method public getImageCountForItem(I)I
    .locals 2
    .param p1, "position"    # I

    .prologue
    const/4 v0, 0x1

    .line 242
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$Adapter;->getItemViewType(I)I

    move-result v1

    if-ne v1, v0, :cond_0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getImageURL(II)Ljava/lang/String;
    .locals 2
    .param p1, "position"    # I
    .param p2, "image"    # I

    .prologue
    .line 247
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$Adapter;->getItemViewType(I)I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$Adapter;->get(I)Lcom/vkontakte/android/data/orm/StickerStockItem;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;

    iget v1, v1, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;->mPhotoSize:I

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/data/orm/StickerStockItem;->getPhoto(I)Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getItemCount()I
    .locals 4

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 229
    iget-object v0, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;->mActive:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    iget-object v3, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;

    iget-object v3, v3, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;->mInactive:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    add-int/2addr v3, v0

    iget-object v0, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;->mInactive:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    move v0, v1

    :goto_0
    add-int/2addr v0, v3

    iget-object v3, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;

    iget-object v3, v3, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;->mActive:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_1

    :goto_1
    add-int/2addr v0, v1

    return v0

    :cond_0
    move v0, v2

    goto :goto_0

    :cond_1
    move v1, v2

    goto :goto_1
.end method

.method public getItemViewType(I)I
    .locals 3
    .param p1, "position"    # I

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 234
    if-nez p1, :cond_1

    const/4 v0, 0x2

    .line 237
    :cond_0
    :goto_0
    return v0

    .line 235
    :cond_1
    if-ne p1, v1, :cond_2

    iget-object v2, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;

    iget-object v2, v2, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;->mActive:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 236
    :cond_2
    iget-object v2, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;

    invoke-virtual {v2, p1}, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;->listActivePositionToCollectionIndex(I)I

    move-result p1

    .line 237
    iget-object v2, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;

    iget-object v2, v2, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;->mActive:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ne p1, v2, :cond_3

    iget-object v2, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;

    iget-object v2, v2, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;->mInactive:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_0

    :cond_3
    move v0, v1

    goto :goto_0
.end method

.method public bridge synthetic onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    .prologue
    .line 211
    check-cast p1, Lcom/vkontakte/android/ui/holder/RecyclerHolder;

    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$Adapter;->onBindViewHolder(Lcom/vkontakte/android/ui/holder/RecyclerHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/vkontakte/android/ui/holder/RecyclerHolder;I)V
    .locals 2
    .param p1, "holder"    # Lcom/vkontakte/android/ui/holder/RecyclerHolder;
    .param p2, "position"    # I

    .prologue
    .line 266
    invoke-virtual {p0, p2}, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$Adapter;->getItemViewType(I)I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 280
    .end local p1    # "holder":Lcom/vkontakte/android/ui/holder/RecyclerHolder;
    :goto_0
    return-void

    .line 268
    .restart local p1    # "holder":Lcom/vkontakte/android/ui/holder/RecyclerHolder;
    :pswitch_0
    check-cast p1, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$Holder;

    .end local p1    # "holder":Lcom/vkontakte/android/ui/holder/RecyclerHolder;
    invoke-direct {p0, p2}, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$Adapter;->get(I)Lcom/vkontakte/android/data/orm/StickerStockItem;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$Holder;->bind(Ljava/lang/Object;)V

    goto :goto_0

    .restart local p1    # "holder":Lcom/vkontakte/android/ui/holder/RecyclerHolder;
    :pswitch_1
    move-object v0, p1

    .line 272
    check-cast v0, Lcom/vkontakte/android/fragments/friends/HeaderHolder;

    const/4 v1, 0x1

    if-ne p2, v1, :cond_0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;->mActive:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    const v1, 0x7f0806c1

    :goto_1
    invoke-virtual {p1, v1}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/friends/HeaderHolder;->bind(Ljava/lang/Object;)V

    goto :goto_0

    :cond_0
    const v1, 0x7f0806c4

    goto :goto_1

    .line 276
    :pswitch_2
    check-cast p1, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$SettingHolder;

    .end local p1    # "holder":Lcom/vkontakte/android/ui/holder/RecyclerHolder;
    iget-object v0, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Lcom/vkontakte/android/stickers/Stickers;->get(Landroid/content/Context;)Lcom/vkontakte/android/stickers/Stickers;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/stickers/Stickers;->isSuggestsEnabled()Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$SettingHolder;->bind(Ljava/lang/Object;)V

    goto :goto_0

    .line 266
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 1

    .prologue
    .line 211
    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$Adapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/vkontakte/android/ui/holder/RecyclerHolder;

    move-result-object v0

    return-object v0
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/vkontakte/android/ui/holder/RecyclerHolder;
    .locals 2
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # I

    .prologue
    .line 252
    packed-switch p2, :pswitch_data_0

    .line 260
    const/4 v0, 0x0

    :goto_0
    return-object v0

    .line 254
    :pswitch_0
    new-instance v0, Lcom/vkontakte/android/fragments/friends/HeaderHolder;

    invoke-direct {v0, p1}, Lcom/vkontakte/android/fragments/friends/HeaderHolder;-><init>(Landroid/view/ViewGroup;)V

    goto :goto_0

    .line 256
    :pswitch_1
    new-instance v0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$Holder;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;

    invoke-direct {v0, v1, p1}, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$Holder;-><init>(Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;Landroid/view/ViewGroup;)V

    goto :goto_0

    .line 258
    :pswitch_2
    new-instance v0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$SettingHolder;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;

    invoke-direct {v0, v1, p1}, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$SettingHolder;-><init>(Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;Landroid/view/ViewGroup;)V

    goto :goto_0

    .line 252
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method
