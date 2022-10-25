.class Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Adapter;
.super Lcom/vkontakte/android/fragments/base/GridFragment$GridAdapter;
.source "FriendsImportFragment.java"

# interfaces
.implements Lcom/vkontakte/android/functions/IntFIntInt;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "Adapter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/fragments/base/GridFragment",
        "<",
        "Lcom/vkontakte/android/UserProfile;",
        ">.GridAdapter<",
        "Lcom/vkontakte/android/ui/holder/RecyclerHolder;",
        ">;",
        "Lcom/vkontakte/android/functions/IntFIntInt;"
    }
.end annotation


# static fields
.field static final TYPE_HEADER:I = 0x2

.field static final TYPE_IMPORT:I = 0x1

.field static final TYPE_ITEM:I = 0x3


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;)V
    .locals 0

    .prologue
    .line 239
    iput-object p1, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;

    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/base/GridFragment$GridAdapter;-><init>(Lcom/vkontakte/android/fragments/base/GridFragment;)V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;
    .param p2, "x1"    # Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$1;

    .prologue
    .line 239
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Adapter;-><init>(Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;)V

    return-void
.end method


# virtual methods
.method public f(II)I
    .locals 2
    .param p1, "position"    # I
    .param p2, "totalSpans"    # I

    .prologue
    .line 328
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Adapter;->getItemViewType(I)I

    move-result v0

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    const/4 p2, 0x1

    .end local p2    # "totalSpans":I
    :cond_0
    return p2
.end method

.method public getBlockType(I)I
    .locals 5
    .param p1, "position"    # I

    .prologue
    const/4 v2, 0x0

    .line 247
    iget-object v3, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;

    iget-object v3, v3, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;->mImportServices:Ljava/util/List;

    if-nez v3, :cond_2

    move v0, v2

    .line 248
    .local v0, "importCount":I
    :goto_0
    if-eqz p1, :cond_0

    if-ne p1, v0, :cond_3

    iget-object v3, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;->access$600(Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;)Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_3

    .line 249
    :cond_0
    const/16 v2, 0x1a

    .line 270
    :cond_1
    :goto_1
    return v2

    .line 247
    .end local v0    # "importCount":I
    :cond_2
    iget-object v3, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;

    iget-object v3, v3, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;->mImportServices:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v0

    goto :goto_0

    .line 250
    .restart local v0    # "importCount":I
    :cond_3
    add-int/lit8 v3, v0, -0x1

    if-ne p1, v3, :cond_4

    .line 251
    const/16 v2, 0x1c

    goto :goto_1

    .line 252
    :cond_4
    if-lez p1, :cond_5

    add-int/lit8 v3, v0, -0x1

    if-ge p1, v3, :cond_5

    .line 253
    const/16 v2, 0x19

    goto :goto_1

    .line 256
    :cond_5
    iget-object v3, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;->access$700(Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;)Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_1

    .line 259
    const/4 v2, 0x0

    .line 260
    .local v2, "result":I
    sub-int v3, p1, v0

    add-int/lit8 p1, v3, -0x1

    .line 261
    iget-object v3, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;

    invoke-virtual {v3}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;->getColumnsCount()I

    move-result v1

    .line 263
    .local v1, "numColumns":I
    rem-int v3, p1, v1

    if-nez v3, :cond_6

    .line 264
    or-int/lit8 v2, v2, 0x8

    goto :goto_1

    .line 265
    :cond_6
    rem-int v3, p1, v1

    add-int/lit8 v4, v1, -0x1

    if-ne v3, v4, :cond_7

    .line 266
    or-int/lit8 v2, v2, 0x10

    goto :goto_1

    .line 268
    :cond_7
    or-int/lit8 v2, v2, 0x1

    goto :goto_1
.end method

.method public getImageCountForItem(I)I
    .locals 2
    .param p1, "position"    # I

    .prologue
    .line 313
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Adapter;->getItemViewType(I)I

    move-result v0

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

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
    .line 318
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Adapter;->getItemViewType(I)I

    move-result v0

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;->access$900(Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;)Ljava/util/ArrayList;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;->mImportServices:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    sub-int v1, p1, v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/UserProfile;

    iget-object v0, v0, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getItemCount()I
    .locals 2

    .prologue
    .line 323
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;->mImportServices:Ljava/util/List;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    invoke-super {p0}, Lcom/vkontakte/android/fragments/base/GridFragment$GridAdapter;->getItemCount()I

    move-result v1

    add-int/2addr v0, v1

    return v0

    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;->mImportServices:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    goto :goto_0
.end method

.method public getItemViewType(I)I
    .locals 2
    .param p1, "position"    # I

    .prologue
    .line 276
    iget-object v1, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;->mImportServices:Ljava/util/List;

    if-nez v1, :cond_0

    const/4 v0, 0x0

    .line 277
    .local v0, "importantSize":I
    :goto_0
    if-ge p1, v0, :cond_1

    const/4 v1, 0x1

    :goto_1
    return v1

    .line 276
    .end local v0    # "importantSize":I
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;->mImportServices:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v0

    goto :goto_0

    .line 277
    .restart local v0    # "importantSize":I
    :cond_1
    if-ne p1, v0, :cond_2

    const/4 v1, 0x2

    goto :goto_1

    :cond_2
    const/4 v1, 0x3

    goto :goto_1
.end method

.method public bridge synthetic onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    .prologue
    .line 239
    check-cast p1, Lcom/vkontakte/android/ui/holder/RecyclerHolder;

    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Adapter;->onBindViewHolder(Lcom/vkontakte/android/ui/holder/RecyclerHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/vkontakte/android/ui/holder/RecyclerHolder;I)V
    .locals 2
    .param p1, "holder"    # Lcom/vkontakte/android/ui/holder/RecyclerHolder;
    .param p2, "position"    # I

    .prologue
    .line 299
    invoke-virtual {p0, p2}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Adapter;->getItemViewType(I)I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 309
    .end local p1    # "holder":Lcom/vkontakte/android/ui/holder/RecyclerHolder;
    :goto_0
    :pswitch_0
    return-void

    .line 301
    .restart local p1    # "holder":Lcom/vkontakte/android/ui/holder/RecyclerHolder;
    :pswitch_1
    check-cast p1, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$ImportHolder;

    .end local p1    # "holder":Lcom/vkontakte/android/ui/holder/RecyclerHolder;
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;->mImportServices:Ljava/util/List;

    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$ImportHolder;->bind(Ljava/lang/Object;)V

    goto :goto_0

    .line 305
    .restart local p1    # "holder":Lcom/vkontakte/android/ui/holder/RecyclerHolder;
    :pswitch_2
    check-cast p1, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$UserHolder;

    .end local p1    # "holder":Lcom/vkontakte/android/ui/holder/RecyclerHolder;
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;->access$800(Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;)Ljava/util/ArrayList;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;->mImportServices:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    sub-int v1, p2, v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$UserHolder;->bind(Ljava/lang/Object;)V

    goto :goto_0

    .line 299
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 1

    .prologue
    .line 239
    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Adapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/vkontakte/android/ui/holder/RecyclerHolder;

    move-result-object v0

    return-object v0
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/vkontakte/android/ui/holder/RecyclerHolder;
    .locals 3
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # I

    .prologue
    .line 282
    packed-switch p2, :pswitch_data_0

    .line 293
    const/4 v0, 0x0

    :goto_0
    return-object v0

    .line 284
    :pswitch_0
    new-instance v0, Lcom/vkontakte/android/fragments/friends/HeaderHolder;

    invoke-direct {v0, p1}, Lcom/vkontakte/android/fragments/friends/HeaderHolder;-><init>(Landroid/view/ViewGroup;)V

    .line 285
    .local v0, "holder":Lcom/vkontakte/android/fragments/friends/HeaderHolder;
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f0806e1

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/friends/HeaderHolder;->bind(Ljava/lang/Object;)V

    goto :goto_0

    .line 289
    .end local v0    # "holder":Lcom/vkontakte/android/fragments/friends/HeaderHolder;
    :pswitch_1
    new-instance v0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$ImportHolder;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;

    invoke-direct {v0, v1, p1}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$ImportHolder;-><init>(Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;Landroid/view/ViewGroup;)V

    goto :goto_0

    .line 291
    :pswitch_2
    new-instance v0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$UserHolder;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;

    invoke-direct {v0, v1, p1}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$UserHolder;-><init>(Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;Landroid/view/ViewGroup;)V

    goto :goto_0

    .line 282
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method
