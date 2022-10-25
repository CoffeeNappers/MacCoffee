.class final Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$Adapter;
.super Lcom/vkontakte/android/fragments/base/GridFragment$GridAdapter;
.source "GiftSendFragment.java"

# interfaces
.implements Lcom/vkontakte/android/ui/recyclerview/BottomDividerDecoration$Provider;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "Adapter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/fragments/base/GridFragment",
        "<",
        "Ljava/lang/Object;",
        ">.GridAdapter<",
        "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
        "<*>;>;",
        "Lcom/vkontakte/android/ui/recyclerview/BottomDividerDecoration$Provider;"
    }
.end annotation


# static fields
.field static final TYPE_ADD:I = 0x3

.field static final TYPE_GIFT:I = 0x0

.field static final TYPE_HEADER:I = 0x1

.field static final TYPE_MESSAGE:I = 0x4

.field static final TYPE_PRIVACY:I = 0x5

.field static final TYPE_SEND:I = 0x6

.field static final TYPE_USER:I = 0x2


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;

    .prologue
    .line 444
    iput-object p1, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;

    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/base/GridFragment$GridAdapter;-><init>(Lcom/vkontakte/android/fragments/base/GridFragment;)V

    return-void
.end method


# virtual methods
.method public drawAfter(I)Z
    .locals 2
    .param p1, "position"    # I

    .prologue
    .line 566
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$Adapter;->getItemViewType(I)I

    move-result v0

    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getBlockType(I)I
    .locals 2
    .param p1, "position"    # I

    .prologue
    .line 550
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$Adapter;->getItemViewType(I)I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 560
    const/4 v0, 0x0

    :goto_0
    return v0

    .line 553
    :pswitch_0
    const/16 v0, 0x1a

    goto :goto_0

    .line 555
    :pswitch_1
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;

    iget-boolean v0, v0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mAddVisibility:Z

    if-nez v0, :cond_0

    add-int/lit8 v0, p1, -0x2

    iget-object v1, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mRecipients:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x4

    :goto_1
    or-int/lit8 v0, v0, 0x18

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    goto :goto_1

    .line 558
    :pswitch_2
    const/16 v0, 0x1c

    goto :goto_0

    .line 550
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method public getItemCount()I
    .locals 2

    .prologue
    const/4 v0, 0x5

    .line 504
    iget-object v1, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mRecipients:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    :goto_0
    return v0

    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;

    iget-boolean v1, v1, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mAddVisibility:Z

    if-eqz v1, :cond_1

    const/4 v0, 0x6

    :cond_1
    iget-object v1, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mRecipients:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    add-int/2addr v0, v1

    goto :goto_0
.end method

.method public getItemViewType(I)I
    .locals 6
    .param p1, "position"    # I

    .prologue
    const/4 v3, 0x5

    const/4 v4, 0x4

    const/4 v0, 0x3

    const/4 v2, 0x0

    const/4 v1, 0x2

    .line 509
    iget-object v5, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;

    iget-object v5, v5, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mRecipients:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_1

    .line 510
    packed-switch p1, :pswitch_data_0

    .line 516
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$Adapter;->getItemCount()I

    move-result v2

    sub-int/2addr v2, p1

    packed-switch v2, :pswitch_data_1

    move v0, v1

    .line 543
    :cond_0
    :goto_0
    :pswitch_0
    return v0

    :pswitch_1
    move v0, v2

    .line 512
    goto :goto_0

    .line 514
    :pswitch_2
    const/4 v0, 0x1

    goto :goto_0

    .line 518
    :pswitch_3
    const/4 v0, 0x6

    goto :goto_0

    :pswitch_4
    move v0, v3

    .line 520
    goto :goto_0

    :pswitch_5
    move v0, v4

    .line 522
    goto :goto_0

    .line 524
    :pswitch_6
    iget-object v2, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;

    iget-boolean v2, v2, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mAddVisibility:Z

    if-nez v2, :cond_0

    move v0, v1

    goto :goto_0

    .line 531
    :cond_1
    packed-switch p1, :pswitch_data_2

    move v0, v1

    .line 543
    goto :goto_0

    :pswitch_7
    move v0, v2

    .line 533
    goto :goto_0

    :pswitch_8
    move v0, v4

    .line 537
    goto :goto_0

    :pswitch_9
    move v0, v3

    .line 539
    goto :goto_0

    .line 541
    :pswitch_a
    const/4 v0, 0x6

    goto :goto_0

    .line 510
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_2
    .end packed-switch

    .line 516
    :pswitch_data_1
    .packed-switch 0x1
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
    .end packed-switch

    .line 531
    :pswitch_data_2
    .packed-switch 0x0
        :pswitch_7
        :pswitch_0
        :pswitch_8
        :pswitch_9
        :pswitch_a
    .end packed-switch
.end method

.method public bridge synthetic onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    .prologue
    .line 444
    check-cast p1, Lcom/vkontakte/android/ui/holder/RecyclerHolder;

    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$Adapter;->onBindViewHolder(Lcom/vkontakte/android/ui/holder/RecyclerHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/vkontakte/android/ui/holder/RecyclerHolder;I)V
    .locals 2
    .param p2, "position"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
            "<*>;I)V"
        }
    .end annotation

    .prologue
    .local p1, "holder":Lcom/vkontakte/android/ui/holder/RecyclerHolder;, "Lcom/vkontakte/android/ui/holder/RecyclerHolder<*>;"
    const/4 v1, 0x0

    .line 477
    invoke-virtual {p0, p2}, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$Adapter;->getItemViewType(I)I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 500
    .end local p1    # "holder":Lcom/vkontakte/android/ui/holder/RecyclerHolder;, "Lcom/vkontakte/android/ui/holder/RecyclerHolder<*>;"
    :goto_0
    return-void

    .line 479
    .restart local p1    # "holder":Lcom/vkontakte/android/ui/holder/RecyclerHolder;, "Lcom/vkontakte/android/ui/holder/RecyclerHolder<*>;"
    :pswitch_0
    check-cast p1, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$GiftHolder;

    .end local p1    # "holder":Lcom/vkontakte/android/ui/holder/RecyclerHolder;, "Lcom/vkontakte/android/ui/holder/RecyclerHolder<*>;"
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mGift:Lcom/vkontakte/android/api/models/CatalogedGift;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$GiftHolder;->bind(Ljava/lang/Object;)V

    goto :goto_0

    .line 482
    .restart local p1    # "holder":Lcom/vkontakte/android/ui/holder/RecyclerHolder;, "Lcom/vkontakte/android/ui/holder/RecyclerHolder<*>;"
    :pswitch_1
    invoke-virtual {p1, v1}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;->bind(Ljava/lang/Object;)V

    goto :goto_0

    .line 485
    :pswitch_2
    check-cast p1, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$UserHolder;

    .end local p1    # "holder":Lcom/vkontakte/android/ui/holder/RecyclerHolder;, "Lcom/vkontakte/android/ui/holder/RecyclerHolder<*>;"
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->mRecipients:Ljava/util/List;

    add-int/lit8 v1, p2, -0x2

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$UserHolder;->bind(Ljava/lang/Object;)V

    goto :goto_0

    .line 488
    .restart local p1    # "holder":Lcom/vkontakte/android/ui/holder/RecyclerHolder;, "Lcom/vkontakte/android/ui/holder/RecyclerHolder<*>;"
    :pswitch_3
    invoke-virtual {p1, v1}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;->bind(Ljava/lang/Object;)V

    goto :goto_0

    .line 491
    :pswitch_4
    invoke-virtual {p1, v1}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;->bind(Ljava/lang/Object;)V

    goto :goto_0

    .line 494
    :pswitch_5
    invoke-virtual {p1, v1}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;->bind(Ljava/lang/Object;)V

    goto :goto_0

    .line 497
    :pswitch_6
    invoke-virtual {p1, v1}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;->bind(Ljava/lang/Object;)V

    goto :goto_0

    .line 477
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
    .end packed-switch
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 1

    .prologue
    .line 444
    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$Adapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/vkontakte/android/ui/holder/RecyclerHolder;

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
            "<*>;"
        }
    .end annotation

    .prologue
    .line 456
    packed-switch p2, :pswitch_data_0

    .line 472
    const/4 v0, 0x0

    :goto_0
    return-object v0

    .line 458
    :pswitch_0
    new-instance v0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$GiftHolder;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;

    invoke-direct {v0, v1, p1}, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$GiftHolder;-><init>(Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;Landroid/view/ViewGroup;)V

    goto :goto_0

    .line 460
    :pswitch_1
    new-instance v0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$HeaderHolder;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;

    invoke-direct {v0, v1, p1}, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$HeaderHolder;-><init>(Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;Landroid/view/ViewGroup;)V

    goto :goto_0

    .line 462
    :pswitch_2
    new-instance v0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$UserHolder;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;

    invoke-direct {v0, v1, p1}, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$UserHolder;-><init>(Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;Landroid/view/ViewGroup;)V

    goto :goto_0

    .line 464
    :pswitch_3
    new-instance v0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$AddHolder;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;

    invoke-direct {v0, v1, p1}, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$AddHolder;-><init>(Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;Landroid/view/ViewGroup;)V

    goto :goto_0

    .line 466
    :pswitch_4
    new-instance v0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$MessageHolder;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;

    invoke-direct {v0, v1, p1}, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$MessageHolder;-><init>(Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;Landroid/view/ViewGroup;)V

    goto :goto_0

    .line 468
    :pswitch_5
    new-instance v0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$PrivacyHolder;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;

    invoke-direct {v0, v1, p1}, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$PrivacyHolder;-><init>(Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;Landroid/view/ViewGroup;)V

    goto :goto_0

    .line 470
    :pswitch_6
    new-instance v0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$SendHolder;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;

    invoke-direct {v0, v1, p1}, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$SendHolder;-><init>(Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;Landroid/view/ViewGroup;)V

    goto :goto_0

    .line 456
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
    .end packed-switch
.end method

.method public bridge synthetic onViewDetachedFromWindow(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V
    .locals 0

    .prologue
    .line 444
    check-cast p1, Lcom/vkontakte/android/ui/holder/RecyclerHolder;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$Adapter;->onViewDetachedFromWindow(Lcom/vkontakte/android/ui/holder/RecyclerHolder;)V

    return-void
.end method

.method public onViewDetachedFromWindow(Lcom/vkontakte/android/ui/holder/RecyclerHolder;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 571
    .local p1, "holder":Lcom/vkontakte/android/ui/holder/RecyclerHolder;, "Lcom/vkontakte/android/ui/holder/RecyclerHolder<*>;"
    instance-of v0, p1, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$MessageHolder;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 572
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Lcom/vk/core/util/KeyboardUtils;->hideKeyboard(Landroid/content/Context;)V

    .line 574
    :cond_0
    return-void
.end method
