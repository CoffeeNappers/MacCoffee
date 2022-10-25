.class Lcom/vkontakte/android/fragments/AudioPlaylistFragment$DragController;
.super Landroid/support/v7/widget/helper/ItemTouchHelper$Callback;
.source "AudioPlaylistFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/AudioPlaylistFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DragController"
.end annotation


# instance fields
.field private mDragging:Z

.field private mEndPosition:I

.field private mStartPosition:I

.field final synthetic this$0:Lcom/vkontakte/android/fragments/AudioPlaylistFragment;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/fragments/AudioPlaylistFragment;)V
    .locals 0

    .prologue
    .line 372
    iput-object p1, p0, Lcom/vkontakte/android/fragments/AudioPlaylistFragment$DragController;->this$0:Lcom/vkontakte/android/fragments/AudioPlaylistFragment;

    invoke-direct {p0}, Landroid/support/v7/widget/helper/ItemTouchHelper$Callback;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/fragments/AudioPlaylistFragment;Lcom/vkontakte/android/fragments/AudioPlaylistFragment$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/fragments/AudioPlaylistFragment;
    .param p2, "x1"    # Lcom/vkontakte/android/fragments/AudioPlaylistFragment$1;

    .prologue
    .line 372
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/AudioPlaylistFragment$DragController;-><init>(Lcom/vkontakte/android/fragments/AudioPlaylistFragment;)V

    return-void
.end method


# virtual methods
.method public canDropOver(Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$ViewHolder;Landroid/support/v7/widget/RecyclerView$ViewHolder;)Z
    .locals 1
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;
    .param p2, "current"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .param p3, "target"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .prologue
    .line 386
    const/4 v0, 0x1

    return v0
.end method

.method public getMovementFlags(Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$ViewHolder;)I
    .locals 4
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;
    .param p2, "viewHolder"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .prologue
    const/4 v1, 0x0

    .line 380
    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->getAdapterPosition()I

    move-result v2

    invoke-static {}, Lcom/vkontakte/android/audio/AudioFacade;->getActualTrackIndex()I

    move-result v3

    if-eq v2, v3, :cond_1

    const/4 v0, 0x1

    .line 381
    .local v0, "isCurrentPosition":Z
    :goto_0
    const/4 v2, 0x3

    if-eqz v0, :cond_0

    const/16 v1, 0xc

    :cond_0
    invoke-static {v2, v1}, Lcom/vkontakte/android/fragments/AudioPlaylistFragment$DragController;->makeMovementFlags(II)I

    move-result v1

    return v1

    .end local v0    # "isCurrentPosition":Z
    :cond_1
    move v0, v1

    .line 380
    goto :goto_0
.end method

.method public isItemViewSwipeEnabled()Z
    .locals 1

    .prologue
    .line 444
    const/4 v0, 0x1

    return v0
.end method

.method public isLongPressDragEnabled()Z
    .locals 1

    .prologue
    .line 439
    const/4 v0, 0x1

    return v0
.end method

.method public onMove(Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$ViewHolder;Landroid/support/v7/widget/RecyclerView$ViewHolder;)Z
    .locals 7
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;
    .param p2, "viewHolder"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .param p3, "target"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .prologue
    .line 391
    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->getAdapterPosition()I

    move-result v0

    .line 392
    .local v0, "fromPosition":I
    invoke-virtual {p3}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->getAdapterPosition()I

    move-result v2

    .line 394
    .local v2, "toPosition":I
    if-ge v0, v2, :cond_0

    .line 395
    move v1, v0

    .local v1, "i":I
    :goto_0
    if-ge v1, v2, :cond_1

    .line 396
    iget-object v5, p0, Lcom/vkontakte/android/fragments/AudioPlaylistFragment$DragController;->this$0:Lcom/vkontakte/android/fragments/AudioPlaylistFragment;

    invoke-static {v5}, Lcom/vkontakte/android/fragments/AudioPlaylistFragment;->access$400(Lcom/vkontakte/android/fragments/AudioPlaylistFragment;)Ljava/util/ArrayList;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/vkontakte/android/audio/player/PlayerTrack;

    .line 397
    .local v3, "track1":Lcom/vkontakte/android/audio/player/PlayerTrack;
    iget-object v5, p0, Lcom/vkontakte/android/fragments/AudioPlaylistFragment$DragController;->this$0:Lcom/vkontakte/android/fragments/AudioPlaylistFragment;

    invoke-static {v5}, Lcom/vkontakte/android/fragments/AudioPlaylistFragment;->access$400(Lcom/vkontakte/android/fragments/AudioPlaylistFragment;)Ljava/util/ArrayList;

    move-result-object v5

    add-int/lit8 v6, v1, 0x1

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vkontakte/android/audio/player/PlayerTrack;

    .line 398
    .local v4, "track2":Lcom/vkontakte/android/audio/player/PlayerTrack;
    iget-object v5, p0, Lcom/vkontakte/android/fragments/AudioPlaylistFragment$DragController;->this$0:Lcom/vkontakte/android/fragments/AudioPlaylistFragment;

    invoke-static {v5}, Lcom/vkontakte/android/fragments/AudioPlaylistFragment;->access$400(Lcom/vkontakte/android/fragments/AudioPlaylistFragment;)Ljava/util/ArrayList;

    move-result-object v5

    add-int/lit8 v6, v1, 0x1

    invoke-static {v5, v1, v6}, Ljava/util/Collections;->swap(Ljava/util/List;II)V

    .line 399
    invoke-static {v3, v4}, Lcom/vkontakte/android/audio/AudioFacade;->swapPlaylistTracks(Lcom/vkontakte/android/audio/player/PlayerTrack;Lcom/vkontakte/android/audio/player/PlayerTrack;)V

    .line 395
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 402
    .end local v1    # "i":I
    .end local v3    # "track1":Lcom/vkontakte/android/audio/player/PlayerTrack;
    .end local v4    # "track2":Lcom/vkontakte/android/audio/player/PlayerTrack;
    :cond_0
    move v1, v0

    .restart local v1    # "i":I
    :goto_1
    if-le v1, v2, :cond_1

    .line 403
    iget-object v5, p0, Lcom/vkontakte/android/fragments/AudioPlaylistFragment$DragController;->this$0:Lcom/vkontakte/android/fragments/AudioPlaylistFragment;

    invoke-static {v5}, Lcom/vkontakte/android/fragments/AudioPlaylistFragment;->access$400(Lcom/vkontakte/android/fragments/AudioPlaylistFragment;)Ljava/util/ArrayList;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/vkontakte/android/audio/player/PlayerTrack;

    .line 404
    .restart local v3    # "track1":Lcom/vkontakte/android/audio/player/PlayerTrack;
    iget-object v5, p0, Lcom/vkontakte/android/fragments/AudioPlaylistFragment$DragController;->this$0:Lcom/vkontakte/android/fragments/AudioPlaylistFragment;

    invoke-static {v5}, Lcom/vkontakte/android/fragments/AudioPlaylistFragment;->access$400(Lcom/vkontakte/android/fragments/AudioPlaylistFragment;)Ljava/util/ArrayList;

    move-result-object v5

    add-int/lit8 v6, v1, -0x1

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vkontakte/android/audio/player/PlayerTrack;

    .line 405
    .restart local v4    # "track2":Lcom/vkontakte/android/audio/player/PlayerTrack;
    iget-object v5, p0, Lcom/vkontakte/android/fragments/AudioPlaylistFragment$DragController;->this$0:Lcom/vkontakte/android/fragments/AudioPlaylistFragment;

    invoke-static {v5}, Lcom/vkontakte/android/fragments/AudioPlaylistFragment;->access$400(Lcom/vkontakte/android/fragments/AudioPlaylistFragment;)Ljava/util/ArrayList;

    move-result-object v5

    add-int/lit8 v6, v1, -0x1

    invoke-static {v5, v1, v6}, Ljava/util/Collections;->swap(Ljava/util/List;II)V

    .line 406
    invoke-static {v3, v4}, Lcom/vkontakte/android/audio/AudioFacade;->swapPlaylistTracks(Lcom/vkontakte/android/audio/player/PlayerTrack;Lcom/vkontakte/android/audio/player/PlayerTrack;)V

    .line 402
    add-int/lit8 v1, v1, -0x1

    goto :goto_1

    .line 409
    .end local v3    # "track1":Lcom/vkontakte/android/audio/player/PlayerTrack;
    .end local v4    # "track2":Lcom/vkontakte/android/audio/player/PlayerTrack;
    :cond_1
    iget-object v5, p0, Lcom/vkontakte/android/fragments/AudioPlaylistFragment$DragController;->this$0:Lcom/vkontakte/android/fragments/AudioPlaylistFragment;

    invoke-static {v5}, Lcom/vkontakte/android/fragments/AudioPlaylistFragment;->access$600(Lcom/vkontakte/android/fragments/AudioPlaylistFragment;)Lcom/vkontakte/android/fragments/AudioPlaylistFragment$AudioListAdapter;

    move-result-object v5

    iput v2, p0, Lcom/vkontakte/android/fragments/AudioPlaylistFragment$DragController;->mEndPosition:I

    invoke-virtual {v5, v0, v2}, Lcom/vkontakte/android/fragments/AudioPlaylistFragment$AudioListAdapter;->notifyItemMoved(II)V

    .line 410
    const/4 v5, 0x1

    return v5
.end method

.method public onSelectedChanged(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 2
    .param p1, "viewHolder"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .param p2, "actionState"    # I

    .prologue
    const/4 v1, 0x0

    .line 415
    invoke-super {p0, p1, p2}, Landroid/support/v7/widget/helper/ItemTouchHelper$Callback;->onSelectedChanged(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V

    .line 416
    packed-switch p2, :pswitch_data_0

    .line 428
    :goto_0
    :pswitch_0
    return-void

    .line 418
    :pswitch_1
    iput-boolean v1, p0, Lcom/vkontakte/android/fragments/AudioPlaylistFragment$DragController;->mDragging:Z

    goto :goto_0

    .line 422
    :pswitch_2
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/AudioPlaylistFragment$DragController;->mDragging:Z

    .line 423
    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->getAdapterPosition()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/fragments/AudioPlaylistFragment$DragController;->mStartPosition:I

    .line 424
    iget-object v0, p1, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->performHapticFeedback(I)Z

    goto :goto_0

    .line 416
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method public onSwiped(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 2
    .param p1, "viewHolder"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .param p2, "direction"    # I

    .prologue
    .line 432
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AudioPlaylistFragment$DragController;->this$0:Lcom/vkontakte/android/fragments/AudioPlaylistFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/AudioPlaylistFragment;->access$400(Lcom/vkontakte/android/fragments/AudioPlaylistFragment;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->getAdapterPosition()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/audio/player/PlayerTrack;

    iget-object v0, v0, Lcom/vkontakte/android/audio/player/PlayerTrack;->uuid:Ljava/lang/String;

    invoke-static {v0}, Lcom/vkontakte/android/audio/AudioFacade;->removePlaylistItem(Ljava/lang/String;)V

    .line 433
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AudioPlaylistFragment$DragController;->this$0:Lcom/vkontakte/android/fragments/AudioPlaylistFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/AudioPlaylistFragment;->access$400(Lcom/vkontakte/android/fragments/AudioPlaylistFragment;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->getAdapterPosition()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 434
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AudioPlaylistFragment$DragController;->this$0:Lcom/vkontakte/android/fragments/AudioPlaylistFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/AudioPlaylistFragment;->access$600(Lcom/vkontakte/android/fragments/AudioPlaylistFragment;)Lcom/vkontakte/android/fragments/AudioPlaylistFragment$AudioListAdapter;

    move-result-object v0

    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->getAdapterPosition()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/AudioPlaylistFragment$AudioListAdapter;->notifyItemRemoved(I)V

    .line 435
    return-void
.end method
