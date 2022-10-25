.class public Lcom/vkontakte/android/ui/holder/market/GoodLikesHolder;
.super Lcom/vkontakte/android/ui/holder/RecyclerHolder;
.source "GoodLikesHolder.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
        "<",
        "Lcom/vkontakte/android/data/Good;",
        ">;",
        "Landroid/view/View$OnClickListener;"
    }
.end annotation


# instance fields
.field final likeBarBinder:Lcom/vkontakte/android/ui/binder/LikeBarBinder;


# direct methods
.method public constructor <init>(Landroid/view/ViewGroup;)V
    .locals 2
    .param p1, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 27
    const v0, 0x7f0301b6

    invoke-direct {p0, v0, p1}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;-><init>(ILandroid/view/ViewGroup;)V

    .line 28
    new-instance v0, Lcom/vkontakte/android/ui/binder/LikeBarBinder;

    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/market/GoodLikesHolder;->itemView:Landroid/view/View;

    invoke-direct {v0, v1}, Lcom/vkontakte/android/ui/binder/LikeBarBinder;-><init>(Landroid/view/View;)V

    iput-object v0, p0, Lcom/vkontakte/android/ui/holder/market/GoodLikesHolder;->likeBarBinder:Lcom/vkontakte/android/ui/binder/LikeBarBinder;

    .line 29
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/market/GoodLikesHolder;->likeBarBinder:Lcom/vkontakte/android/ui/binder/LikeBarBinder;

    iget-object v0, v0, Lcom/vkontakte/android/ui/binder/LikeBarBinder;->likesContainer:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 30
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/market/GoodLikesHolder;->likeBarBinder:Lcom/vkontakte/android/ui/binder/LikeBarBinder;

    iget-object v0, v0, Lcom/vkontakte/android/ui/binder/LikeBarBinder;->likesCounterView:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 31
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/market/GoodLikesHolder;->likeBarBinder:Lcom/vkontakte/android/ui/binder/LikeBarBinder;

    iget-object v0, v0, Lcom/vkontakte/android/ui/binder/LikeBarBinder;->repostsCounterView:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 32
    return-void
.end method


# virtual methods
.method public onBind(Lcom/vkontakte/android/data/Good;)V
    .locals 8
    .param p1, "item"    # Lcom/vkontakte/android/data/Good;

    .prologue
    const/4 v7, 0x1

    const/4 v2, 0x0

    .line 36
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/market/GoodLikesHolder;->likeBarBinder:Lcom/vkontakte/android/ui/binder/LikeBarBinder;

    iget v1, p1, Lcom/vkontakte/android/data/Good;->user_likes:I

    if-eqz v1, :cond_0

    move v1, v7

    :goto_0
    iget v3, p1, Lcom/vkontakte/android/data/Good;->likes_count:I

    iget-object v6, p1, Lcom/vkontakte/android/data/Good;->likes:Ljava/util/List;

    move v4, v2

    move v5, v2

    invoke-virtual/range {v0 .. v6}, Lcom/vkontakte/android/ui/binder/LikeBarBinder;->bind(ZZIIILjava/util/List;)V

    .line 37
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/market/GoodLikesHolder;->likeBarBinder:Lcom/vkontakte/android/ui/binder/LikeBarBinder;

    iget-object v1, v0, Lcom/vkontakte/android/ui/binder/LikeBarBinder;->likesCounterView:Landroid/widget/TextView;

    iget v0, p1, Lcom/vkontakte/android/data/Good;->availability:I

    if-nez v0, :cond_1

    move v0, v7

    :goto_1
    invoke-static {v1, v0}, Lcom/vkontakte/android/ViewUtils;->setEnabled(Landroid/view/View;Z)V

    .line 38
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/market/GoodLikesHolder;->likeBarBinder:Lcom/vkontakte/android/ui/binder/LikeBarBinder;

    iget-object v0, v0, Lcom/vkontakte/android/ui/binder/LikeBarBinder;->repostsCounterView:Landroid/widget/TextView;

    iget v1, p1, Lcom/vkontakte/android/data/Good;->availability:I

    if-nez v1, :cond_2

    :goto_2
    invoke-static {v0, v7}, Lcom/vkontakte/android/ViewUtils;->setEnabled(Landroid/view/View;Z)V

    .line 39
    return-void

    :cond_0
    move v1, v2

    .line 36
    goto :goto_0

    :cond_1
    move v0, v2

    .line 37
    goto :goto_1

    :cond_2
    move v7, v2

    .line 38
    goto :goto_2
.end method

.method public bridge synthetic onBind(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 22
    check-cast p1, Lcom/vkontakte/android/data/Good;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/ui/holder/market/GoodLikesHolder;->onBind(Lcom/vkontakte/android/data/Good;)V

    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 6
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 45
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/market/GoodLikesHolder;->getItem()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/data/Good;

    .line 46
    .local v2, "lastGood":Lcom/vkontakte/android/data/Good;
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v5

    packed-switch v5, :pswitch_data_0

    .line 89
    :cond_0
    :goto_0
    :pswitch_0
    return-void

    .line 48
    :pswitch_1
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lcom/vkontakte/android/auth/VKAuth;->ensureLoggedIn(Landroid/content/Context;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 49
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lcom/vk/sharing/Sharing;->from(Landroid/content/Context;)Lcom/vk/sharing/Sharing$Builder;

    move-result-object v3

    const-string/jumbo v4, "goods"

    .line 50
    invoke-static {v2, v4}, Lcom/vk/sharing/attachment/Attachments;->createInfo(Lcom/vkontakte/android/data/Good;Ljava/lang/String;)Lcom/vk/sharing/attachment/AttachmentInfo;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/vk/sharing/Sharing$Builder;->withAttachment(Lcom/vk/sharing/attachment/AttachmentInfo;)Lcom/vk/sharing/Sharing$Builder;

    move-result-object v3

    .line 51
    invoke-static {v2}, Lcom/vk/sharing/action/Actions;->createInfo(Lcom/vkontakte/android/data/Good;)Lcom/vk/sharing/action/ActionsInfo;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/vk/sharing/Sharing$Builder;->withActions(Lcom/vk/sharing/action/ActionsInfo;)Lcom/vk/sharing/Sharing$Builder;

    move-result-object v3

    .line 52
    invoke-virtual {v3}, Lcom/vk/sharing/Sharing$Builder;->share()V

    goto :goto_0

    .line 56
    :pswitch_2
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 57
    .local v0, "args":Landroid/os/Bundle;
    const-string/jumbo v3, "title"

    const v4, 0x7f080337

    invoke-virtual {p0, v4}, Lcom/vkontakte/android/ui/holder/market/GoodLikesHolder;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Landroid/os/Bundle;->putCharSequence(Ljava/lang/String;Ljava/lang/CharSequence;)V

    .line 58
    const-string/jumbo v3, "ltype"

    const/4 v4, 0x6

    invoke-virtual {v0, v3, v4}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 59
    const-string/jumbo v3, "oid"

    iget v4, v2, Lcom/vkontakte/android/data/Good;->owner_id:I

    invoke-virtual {v0, v3, v4}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 60
    const-string/jumbo v3, "item_id"

    iget v4, v2, Lcom/vkontakte/android/data/Good;->id:I

    invoke-virtual {v0, v3, v4}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 61
    const-class v3, Lcom/vkontakte/android/fragments/LikesListFragment;

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/market/GoodLikesHolder;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v3, v0, v4}, Lcom/vkontakte/android/navigation/Navigate;->to(Ljava/lang/Class;Landroid/os/Bundle;Landroid/content/Context;)V

    goto :goto_0

    .line 64
    .end local v0    # "args":Landroid/os/Bundle;
    :pswitch_3
    iget v5, v2, Lcom/vkontakte/android/data/Good;->user_likes:I

    if-nez v5, :cond_1

    move v1, v3

    .line 65
    .local v1, "isAdd":Z
    :goto_1
    if-nez v1, :cond_2

    .line 66
    iput v4, v2, Lcom/vkontakte/android/data/Good;->user_likes:I

    .line 67
    iget v3, v2, Lcom/vkontakte/android/data/Good;->likes_count:I

    add-int/lit8 v3, v3, -0x1

    iput v3, v2, Lcom/vkontakte/android/data/Good;->likes_count:I

    .line 72
    :goto_2
    invoke-virtual {p0, v2}, Lcom/vkontakte/android/ui/holder/market/GoodLikesHolder;->bind(Ljava/lang/Object;)V

    .line 73
    invoke-static {v2}, Lcom/vkontakte/android/api/wall/WallLike;->market(Lcom/vkontakte/android/data/Good;)Lcom/vkontakte/android/api/wall/WallLike;

    move-result-object v3

    new-instance v4, Lcom/vkontakte/android/ui/holder/market/GoodLikesHolder$1;

    invoke-direct {v4, p0, v2, v1}, Lcom/vkontakte/android/ui/holder/market/GoodLikesHolder$1;-><init>(Lcom/vkontakte/android/ui/holder/market/GoodLikesHolder;Lcom/vkontakte/android/data/Good;Z)V

    invoke-virtual {v3, v4}, Lcom/vkontakte/android/api/wall/WallLike;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v3

    iget-object v4, p0, Lcom/vkontakte/android/ui/holder/market/GoodLikesHolder;->itemView:Landroid/view/View;

    .line 86
    invoke-virtual {v3, v4}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/view/View;)Lcom/vkontakte/android/api/VKAPIRequest;

    goto/16 :goto_0

    .end local v1    # "isAdd":Z
    :cond_1
    move v1, v4

    .line 64
    goto :goto_1

    .line 69
    .restart local v1    # "isAdd":Z
    :cond_2
    iput v3, v2, Lcom/vkontakte/android/data/Good;->user_likes:I

    .line 70
    iget v3, v2, Lcom/vkontakte/android/data/Good;->likes_count:I

    add-int/lit8 v3, v3, 0x1

    iput v3, v2, Lcom/vkontakte/android/data/Good;->likes_count:I

    goto :goto_2

    .line 46
    nop

    :pswitch_data_0
    .packed-switch 0x7f1004c8
        :pswitch_2
        :pswitch_0
        :pswitch_0
        :pswitch_3
        :pswitch_1
    .end packed-switch
.end method
