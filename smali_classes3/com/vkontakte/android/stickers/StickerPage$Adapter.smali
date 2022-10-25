.class Lcom/vkontakte/android/stickers/StickerPage$Adapter;
.super Lme/grishka/appkit/views/UsableRecyclerView$Adapter;
.source "StickerPage.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/stickers/StickerPage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "Adapter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lme/grishka/appkit/views/UsableRecyclerView$Adapter",
        "<",
        "Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/stickers/StickerPage;


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/stickers/StickerPage;)V
    .locals 1

    .prologue
    .line 245
    iput-object p1, p0, Lcom/vkontakte/android/stickers/StickerPage$Adapter;->this$0:Lcom/vkontakte/android/stickers/StickerPage;

    invoke-direct {p0}, Lme/grishka/appkit/views/UsableRecyclerView$Adapter;-><init>()V

    .line 246
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/stickers/StickerPage$Adapter;->setHasStableIds(Z)V

    .line 247
    return-void
.end method


# virtual methods
.method public getImageCountForItem(I)I
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 299
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/stickers/StickerPage$Adapter;->getItemViewType(I)I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getItemCount()I
    .locals 1

    .prologue
    .line 275
    iget-object v0, p0, Lcom/vkontakte/android/stickers/StickerPage$Adapter;->this$0:Lcom/vkontakte/android/stickers/StickerPage;

    invoke-static {v0}, Lcom/vkontakte/android/stickers/StickerPage;->access$100(Lcom/vkontakte/android/stickers/StickerPage;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/stickers/StickerPage$Adapter;->this$0:Lcom/vkontakte/android/stickers/StickerPage;

    invoke-static {v0}, Lcom/vkontakte/android/stickers/StickerPage;->access$000(Lcom/vkontakte/android/stickers/StickerPage;)Lcom/vkontakte/android/data/orm/StickerStockItem;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/data/orm/StickerStockItem;->getAllStickerIds()[I

    move-result-object v0

    array-length v0, v0

    add-int/lit8 v0, v0, 0x1

    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/stickers/StickerPage$Adapter;->this$0:Lcom/vkontakte/android/stickers/StickerPage;

    invoke-static {v0}, Lcom/vkontakte/android/stickers/StickerPage;->access$000(Lcom/vkontakte/android/stickers/StickerPage;)Lcom/vkontakte/android/data/orm/StickerStockItem;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/data/orm/StickerStockItem;->getAllStickerIds()[I

    move-result-object v0

    array-length v0, v0

    goto :goto_0
.end method

.method public getItemId(I)J
    .locals 2
    .param p1, "position"    # I

    .prologue
    .line 288
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/stickers/StickerPage$Adapter;->getItemViewType(I)I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 293
    iget-object v0, p0, Lcom/vkontakte/android/stickers/StickerPage$Adapter;->this$0:Lcom/vkontakte/android/stickers/StickerPage;

    invoke-static {v0}, Lcom/vkontakte/android/stickers/StickerPage;->access$000(Lcom/vkontakte/android/stickers/StickerPage;)Lcom/vkontakte/android/data/orm/StickerStockItem;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/data/orm/StickerStockItem;->getAllStickerIds()[I

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/stickers/StickerPage$Adapter;->this$0:Lcom/vkontakte/android/stickers/StickerPage;

    invoke-static {v1}, Lcom/vkontakte/android/stickers/StickerPage;->access$100(Lcom/vkontakte/android/stickers/StickerPage;)Z

    move-result v1

    if-eqz v1, :cond_0

    add-int/lit8 p1, p1, -0x1

    .end local p1    # "position":I
    :cond_0
    aget v0, v0, p1

    int-to-long v0, v0

    :goto_0
    return-wide v0

    .line 290
    .restart local p1    # "position":I
    :pswitch_0
    const-wide/16 v0, -0x1

    goto :goto_0

    .line 288
    :pswitch_data_0
    .packed-switch -0x1
        :pswitch_0
    .end packed-switch
.end method

.method public getItemViewType(I)I
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 280
    iget-object v0, p0, Lcom/vkontakte/android/stickers/StickerPage$Adapter;->this$0:Lcom/vkontakte/android/stickers/StickerPage;

    invoke-static {v0}, Lcom/vkontakte/android/stickers/StickerPage;->access$100(Lcom/vkontakte/android/stickers/StickerPage;)Z

    move-result v0

    if-eqz v0, :cond_0

    if-nez p1, :cond_0

    .line 281
    const/4 v0, -0x1

    .line 283
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public bridge synthetic onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    .prologue
    .line 243
    check-cast p1, Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;

    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/stickers/StickerPage$Adapter;->onBindViewHolder(Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;I)V
    .locals 2
    .param p1, "holder"    # Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;
    .param p2, "position"    # I

    .prologue
    .line 262
    invoke-virtual {p0, p2}, Lcom/vkontakte/android/stickers/StickerPage$Adapter;->getItemViewType(I)I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 271
    .end local p1    # "holder":Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;
    :goto_0
    return-void

    .line 264
    .restart local p1    # "holder":Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;
    :pswitch_0
    check-cast p1, Lcom/vkontakte/android/stickers/StickerPage$HeaderHolder;

    .end local p1    # "holder":Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;
    iget-object v0, p0, Lcom/vkontakte/android/stickers/StickerPage$Adapter;->this$0:Lcom/vkontakte/android/stickers/StickerPage;

    invoke-static {v0}, Lcom/vkontakte/android/stickers/StickerPage;->access$000(Lcom/vkontakte/android/stickers/StickerPage;)Lcom/vkontakte/android/data/orm/StickerStockItem;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/stickers/StickerPage$HeaderHolder;->bind(Lcom/vkontakte/android/data/orm/StickerStockItem;)V

    goto :goto_0

    .line 268
    .restart local p1    # "holder":Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;
    :pswitch_1
    check-cast p1, Lcom/vkontakte/android/stickers/StickerPage$StickerHolder;

    .end local p1    # "holder":Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;
    invoke-virtual {p0, p2}, Lcom/vkontakte/android/stickers/StickerPage$Adapter;->getItemId(I)J

    move-result-wide v0

    long-to-int v0, v0

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/stickers/StickerPage$StickerHolder;->bind(I)V

    goto :goto_0

    .line 262
    nop

    :pswitch_data_0
    .packed-switch -0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 1

    .prologue
    .line 243
    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/stickers/StickerPage$Adapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;

    move-result-object v0

    return-object v0
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;
    .locals 4
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # I

    .prologue
    .line 251
    packed-switch p2, :pswitch_data_0

    .line 256
    new-instance v0, Lcom/vkontakte/android/stickers/StickerPage$StickerHolder;

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/stickers/StickerPage$Adapter;->this$0:Lcom/vkontakte/android/stickers/StickerPage;

    invoke-static {v2}, Lcom/vkontakte/android/stickers/StickerPage;->access$300(Lcom/vkontakte/android/stickers/StickerPage;)Lcom/vkontakte/android/stickers/StickersView$Listener;

    move-result-object v2

    iget-object v3, p0, Lcom/vkontakte/android/stickers/StickerPage$Adapter;->this$0:Lcom/vkontakte/android/stickers/StickerPage;

    invoke-static {v3}, Lcom/vkontakte/android/stickers/StickerPage;->access$000(Lcom/vkontakte/android/stickers/StickerPage;)Lcom/vkontakte/android/data/orm/StickerStockItem;

    move-result-object v3

    invoke-direct {v0, v1, v2, v3}, Lcom/vkontakte/android/stickers/StickerPage$StickerHolder;-><init>(Landroid/content/Context;Lcom/vkontakte/android/stickers/StickersView$Listener;Lcom/vkontakte/android/data/orm/StickerStockItem;)V

    :goto_0
    return-object v0

    .line 253
    :pswitch_0
    new-instance v0, Lcom/vkontakte/android/stickers/StickerPage$HeaderHolder;

    iget-object v1, p0, Lcom/vkontakte/android/stickers/StickerPage$Adapter;->this$0:Lcom/vkontakte/android/stickers/StickerPage;

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/stickers/StickerPage$HeaderHolder;-><init>(Lcom/vkontakte/android/stickers/StickerPage;Landroid/content/Context;)V

    goto :goto_0

    .line 251
    nop

    :pswitch_data_0
    .packed-switch -0x1
        :pswitch_0
    .end packed-switch
.end method
