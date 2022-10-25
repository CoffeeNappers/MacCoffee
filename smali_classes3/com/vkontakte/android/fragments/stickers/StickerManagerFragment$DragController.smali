.class Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$DragController;
.super Landroid/support/v7/widget/helper/ItemTouchHelper$Callback;
.source "StickerManagerFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DragController"
.end annotation


# instance fields
.field private mDragging:Z

.field private mEndPosition:I

.field private mStartPosition:I

.field final synthetic this$0:Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;)V
    .locals 0

    .prologue
    .line 379
    iput-object p1, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$DragController;->this$0:Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;

    invoke-direct {p0}, Landroid/support/v7/widget/helper/ItemTouchHelper$Callback;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;
    .param p2, "x1"    # Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$1;

    .prologue
    .line 379
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$DragController;-><init>(Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;)V

    return-void
.end method


# virtual methods
.method public canDropOver(Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$ViewHolder;Landroid/support/v7/widget/RecyclerView$ViewHolder;)Z
    .locals 1
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;
    .param p2, "current"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .param p3, "target"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .prologue
    .line 392
    instance-of v0, p3, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$Holder;

    if-eqz v0, :cond_0

    check-cast p3, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$Holder;

    .end local p3    # "target":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    invoke-virtual {p3}, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$Holder;->getItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/data/orm/StickerStockItem;

    iget-boolean v0, v0, Lcom/vkontakte/android/data/orm/StickerStockItem;->active:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getMovementFlags(Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$ViewHolder;)I
    .locals 3
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;
    .param p2, "viewHolder"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .prologue
    const/4 v1, 0x0

    .line 387
    instance-of v0, p2, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$Holder;

    if-eqz v0, :cond_0

    check-cast p2, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$Holder;

    .end local p2    # "viewHolder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    invoke-virtual {p2}, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$Holder;->getItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/data/orm/StickerStockItem;

    iget-boolean v0, v0, Lcom/vkontakte/android/data/orm/StickerStockItem;->active:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$DragController;->this$0:Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;->mActive:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v2, 0x1

    if-le v0, v2, :cond_0

    const/4 v0, 0x3

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$DragController;->makeMovementFlags(II)I

    move-result v0

    :goto_0
    return v0

    :cond_0
    move v0, v1

    goto :goto_0
.end method

.method public isItemViewSwipeEnabled()Z
    .locals 1

    .prologue
    .line 445
    const/4 v0, 0x0

    return v0
.end method

.method public isLongPressDragEnabled()Z
    .locals 1

    .prologue
    .line 440
    const/4 v0, 0x1

    return v0
.end method

.method public onMove(Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$ViewHolder;Landroid/support/v7/widget/RecyclerView$ViewHolder;)Z
    .locals 7
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;
    .param p2, "viewHolder"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .param p3, "target"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .prologue
    .line 397
    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->getAdapterPosition()I

    move-result v0

    .line 398
    .local v0, "fromPosition":I
    invoke-virtual {p3}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->getAdapterPosition()I

    move-result v2

    .line 400
    .local v2, "toPosition":I
    if-ge v0, v2, :cond_0

    .line 401
    move v1, v0

    .local v1, "i":I
    :goto_0
    if-ge v1, v2, :cond_1

    .line 402
    iget-object v3, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$DragController;->this$0:Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;

    iget-object v3, v3, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;->mActive:Ljava/util/List;

    iget-object v4, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$DragController;->this$0:Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;

    invoke-virtual {v4, v1}, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;->listActivePositionToCollectionIndex(I)I

    move-result v4

    iget-object v5, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$DragController;->this$0:Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;

    add-int/lit8 v6, v1, 0x1

    invoke-virtual {v5, v6}, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;->listActivePositionToCollectionIndex(I)I

    move-result v5

    invoke-static {v3, v4, v5}, Ljava/util/Collections;->swap(Ljava/util/List;II)V

    .line 401
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 405
    .end local v1    # "i":I
    :cond_0
    move v1, v0

    .restart local v1    # "i":I
    :goto_1
    if-le v1, v2, :cond_1

    .line 406
    iget-object v3, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$DragController;->this$0:Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;

    iget-object v3, v3, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;->mActive:Ljava/util/List;

    iget-object v4, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$DragController;->this$0:Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;

    invoke-virtual {v4, v1}, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;->listActivePositionToCollectionIndex(I)I

    move-result v4

    iget-object v5, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$DragController;->this$0:Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;

    add-int/lit8 v6, v1, -0x1

    invoke-virtual {v5, v6}, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;->listActivePositionToCollectionIndex(I)I

    move-result v5

    invoke-static {v3, v4, v5}, Ljava/util/Collections;->swap(Ljava/util/List;II)V

    .line 405
    add-int/lit8 v1, v1, -0x1

    goto :goto_1

    .line 409
    :cond_1
    iget-object v3, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$DragController;->this$0:Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;->access$500(Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;)Lcom/vkontakte/android/fragments/base/GridFragment$GridAdapter;

    move-result-object v3

    iput v2, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$DragController;->mEndPosition:I

    invoke-virtual {v3, v0, v2}, Lcom/vkontakte/android/fragments/base/GridFragment$GridAdapter;->notifyItemMoved(II)V

    .line 410
    const/4 v3, 0x1

    return v3
.end method

.method public onSelectedChanged(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 4
    .param p1, "viewHolder"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .param p2, "actionState"    # I

    .prologue
    const/4 v3, 0x0

    .line 415
    invoke-super {p0, p1, p2}, Landroid/support/v7/widget/helper/ItemTouchHelper$Callback;->onSelectedChanged(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V

    .line 416
    packed-switch p2, :pswitch_data_0

    .line 431
    :goto_0
    :pswitch_0
    return-void

    .line 418
    :pswitch_1
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$DragController;->mDragging:Z

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$DragController;->mStartPosition:I

    iget v1, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$DragController;->mEndPosition:I

    if-eq v0, v1, :cond_0

    .line 419
    iget-object v0, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$DragController;->this$0:Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;

    iget v1, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$DragController;->mStartPosition:I

    iget v2, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$DragController;->mEndPosition:I

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;->sendReorder(II)V

    .line 421
    :cond_0
    iput-boolean v3, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$DragController;->mDragging:Z

    goto :goto_0

    .line 425
    :pswitch_2
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$DragController;->mDragging:Z

    .line 426
    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->getAdapterPosition()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$DragController;->mStartPosition:I

    .line 427
    iget-object v0, p1, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v0, v3}, Landroid/view/View;->performHapticFeedback(I)Z

    goto :goto_0

    .line 416
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method public onSwiped(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 0
    .param p1, "viewHolder"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .param p2, "direction"    # I

    .prologue
    .line 436
    return-void
.end method
