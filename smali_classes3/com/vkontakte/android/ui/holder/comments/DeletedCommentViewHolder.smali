.class public Lcom/vkontakte/android/ui/holder/comments/DeletedCommentViewHolder;
.super Lcom/vkontakte/android/ui/holder/comments/AbsCommentViewHolder;
.source "DeletedCommentViewHolder.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/ui/holder/comments/DeletedCommentViewHolder$DeletedCommentViewHolderListener;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T::",
        "Lcom/vkontakte/android/Comment;",
        ">",
        "Lcom/vkontakte/android/ui/holder/comments/AbsCommentViewHolder",
        "<TT;>;",
        "Landroid/view/View$OnClickListener;"
    }
.end annotation


# instance fields
.field private block:Landroid/widget/TextView;

.field private final holderListener:Lcom/vkontakte/android/ui/holder/comments/DeletedCommentViewHolder$DeletedCommentViewHolderListener;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/ui/holder/comments/DeletedCommentViewHolder$DeletedCommentViewHolderListener",
            "<TT;>;"
        }
    .end annotation
.end field

.field private report:Landroid/widget/TextView;

.field private restore:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/view/ViewGroup;Lcom/vkontakte/android/ui/holder/comments/DeletedCommentViewHolder$DeletedCommentViewHolderListener;)V
    .locals 1
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2    # Lcom/vkontakte/android/ui/holder/comments/DeletedCommentViewHolder$DeletedCommentViewHolderListener;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/ViewGroup;",
            "Lcom/vkontakte/android/ui/holder/comments/DeletedCommentViewHolder$DeletedCommentViewHolderListener",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 32
    .local p0, "this":Lcom/vkontakte/android/ui/holder/comments/DeletedCommentViewHolder;, "Lcom/vkontakte/android/ui/holder/comments/DeletedCommentViewHolder<TT;>;"
    .local p2, "holderListener":Lcom/vkontakte/android/ui/holder/comments/DeletedCommentViewHolder$DeletedCommentViewHolderListener;, "Lcom/vkontakte/android/ui/holder/comments/DeletedCommentViewHolder$DeletedCommentViewHolderListener<TT;>;"
    const v0, 0x7f03007e

    invoke-direct {p0, v0, p1}, Lcom/vkontakte/android/ui/holder/comments/AbsCommentViewHolder;-><init>(ILandroid/view/ViewGroup;)V

    .line 34
    iput-object p2, p0, Lcom/vkontakte/android/ui/holder/comments/DeletedCommentViewHolder;->holderListener:Lcom/vkontakte/android/ui/holder/comments/DeletedCommentViewHolder$DeletedCommentViewHolderListener;

    .line 36
    const v0, 0x7f100278

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/holder/comments/DeletedCommentViewHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/holder/comments/DeletedCommentViewHolder;->restore:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 37
    const v0, 0x7f10027a

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/holder/comments/DeletedCommentViewHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/holder/comments/DeletedCommentViewHolder;->block:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 38
    const v0, 0x7f100279

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/holder/comments/DeletedCommentViewHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/holder/comments/DeletedCommentViewHolder;->report:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 39
    return-void
.end method


# virtual methods
.method public onBind(Lcom/vkontakte/android/Comment;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/vkontakte/android/ui/holder/comments/DeletedCommentViewHolder;, "Lcom/vkontakte/android/ui/holder/comments/DeletedCommentViewHolder<TT;>;"
    .local p1, "comment":Lcom/vkontakte/android/Comment;, "TT;"
    const/16 v6, 0x8

    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 58
    iget-object v2, p0, Lcom/vkontakte/android/ui/holder/comments/DeletedCommentViewHolder;->holderListener:Lcom/vkontakte/android/ui/holder/comments/DeletedCommentViewHolder$DeletedCommentViewHolderListener;

    invoke-interface {v2}, Lcom/vkontakte/android/ui/holder/comments/DeletedCommentViewHolder$DeletedCommentViewHolderListener;->canBanUsers()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {p1}, Lcom/vkontakte/android/Comment;->getUid()I

    move-result v2

    if-lez v2, :cond_1

    invoke-interface {p1}, Lcom/vkontakte/android/Comment;->getUid()I

    move-result v2

    invoke-static {v2}, Lcom/vkontakte/android/auth/VKAccountManager;->isCurrentUser(I)Z

    move-result v2

    if-nez v2, :cond_1

    move v0, v3

    .line 59
    .local v0, "canBan":Z
    :goto_0
    invoke-interface {p1}, Lcom/vkontakte/android/Comment;->getUid()I

    move-result v2

    invoke-static {v2}, Lcom/vkontakte/android/auth/VKAccountManager;->isCurrentUser(I)Z

    move-result v2

    if-nez v2, :cond_2

    move v1, v3

    .line 60
    .local v1, "canReport":Z
    :goto_1
    iget-object v2, p0, Lcom/vkontakte/android/ui/holder/comments/DeletedCommentViewHolder;->itemView:Landroid/view/View;

    check-cast v2, Landroid/widget/LinearLayout;

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/comments/DeletedCommentViewHolder;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-static {v5}, Lcom/vk/core/util/Screen;->isTablet(Landroid/content/Context;)Z

    move-result v5

    if-nez v5, :cond_0

    if-nez v0, :cond_3

    if-nez v1, :cond_3

    :cond_0
    move v5, v4

    :goto_2
    invoke-virtual {v2, v5}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 61
    iget-object v5, p0, Lcom/vkontakte/android/ui/holder/comments/DeletedCommentViewHolder;->block:Landroid/widget/TextView;

    if-eqz v0, :cond_4

    move v2, v4

    :goto_3
    invoke-virtual {v5, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 62
    iget-object v5, p0, Lcom/vkontakte/android/ui/holder/comments/DeletedCommentViewHolder;->report:Landroid/widget/TextView;

    if-eqz v1, :cond_5

    move v2, v4

    :goto_4
    invoke-virtual {v5, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 63
    invoke-interface {p1}, Lcom/vkontakte/android/Comment;->isReported()Z

    move-result v2

    if-eqz v2, :cond_6

    .line 64
    iget-object v2, p0, Lcom/vkontakte/android/ui/holder/comments/DeletedCommentViewHolder;->restore:Landroid/widget/TextView;

    invoke-virtual {v2, v6}, Landroid/widget/TextView;->setVisibility(I)V

    .line 65
    iget-object v2, p0, Lcom/vkontakte/android/ui/holder/comments/DeletedCommentViewHolder;->report:Landroid/widget/TextView;

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 66
    iget-object v2, p0, Lcom/vkontakte/android/ui/holder/comments/DeletedCommentViewHolder;->report:Landroid/widget/TextView;

    const v5, 0x7f0805be

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setText(I)V

    .line 71
    :goto_5
    invoke-interface {p1}, Lcom/vkontakte/android/Comment;->isBanned()Z

    move-result v2

    if-eqz v2, :cond_7

    .line 72
    iget-object v2, p0, Lcom/vkontakte/android/ui/holder/comments/DeletedCommentViewHolder;->block:Landroid/widget/TextView;

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 73
    iget-object v2, p0, Lcom/vkontakte/android/ui/holder/comments/DeletedCommentViewHolder;->block:Landroid/widget/TextView;

    const v3, 0x7f08073b

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(I)V

    .line 78
    :goto_6
    return-void

    .end local v0    # "canBan":Z
    .end local v1    # "canReport":Z
    :cond_1
    move v0, v4

    .line 58
    goto :goto_0

    .restart local v0    # "canBan":Z
    :cond_2
    move v1, v4

    .line 59
    goto :goto_1

    .restart local v1    # "canReport":Z
    :cond_3
    move v5, v3

    .line 60
    goto :goto_2

    :cond_4
    move v2, v6

    .line 61
    goto :goto_3

    :cond_5
    move v2, v6

    .line 62
    goto :goto_4

    .line 68
    :cond_6
    iget-object v2, p0, Lcom/vkontakte/android/ui/holder/comments/DeletedCommentViewHolder;->report:Landroid/widget/TextView;

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 69
    iget-object v2, p0, Lcom/vkontakte/android/ui/holder/comments/DeletedCommentViewHolder;->report:Landroid/widget/TextView;

    const v5, 0x7f0805bd

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setText(I)V

    goto :goto_5

    .line 75
    :cond_7
    iget-object v2, p0, Lcom/vkontakte/android/ui/holder/comments/DeletedCommentViewHolder;->block:Landroid/widget/TextView;

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 76
    iget-object v2, p0, Lcom/vkontakte/android/ui/holder/comments/DeletedCommentViewHolder;->block:Landroid/widget/TextView;

    const v3, 0x7f080119

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(I)V

    goto :goto_6
.end method

.method public bridge synthetic onBind(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 14
    .local p0, "this":Lcom/vkontakte/android/ui/holder/comments/DeletedCommentViewHolder;, "Lcom/vkontakte/android/ui/holder/comments/DeletedCommentViewHolder<TT;>;"
    check-cast p1, Lcom/vkontakte/android/Comment;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/ui/holder/comments/DeletedCommentViewHolder;->onBind(Lcom/vkontakte/android/Comment;)V

    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 43
    .local p0, "this":Lcom/vkontakte/android/ui/holder/comments/DeletedCommentViewHolder;, "Lcom/vkontakte/android/ui/holder/comments/DeletedCommentViewHolder<TT;>;"
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 54
    :goto_0
    return-void

    .line 45
    :pswitch_0
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/comments/DeletedCommentViewHolder;->holderListener:Lcom/vkontakte/android/ui/holder/comments/DeletedCommentViewHolder$DeletedCommentViewHolderListener;

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/comments/DeletedCommentViewHolder;->getItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/Comment;

    invoke-interface {v0}, Lcom/vkontakte/android/Comment;->getId()I

    move-result v0

    invoke-interface {v1, v0}, Lcom/vkontakte/android/ui/holder/comments/DeletedCommentViewHolder$DeletedCommentViewHolderListener;->restoreComment(I)V

    goto :goto_0

    .line 48
    :pswitch_1
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/comments/DeletedCommentViewHolder;->holderListener:Lcom/vkontakte/android/ui/holder/comments/DeletedCommentViewHolder$DeletedCommentViewHolderListener;

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/comments/DeletedCommentViewHolder;->getItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/Comment;

    invoke-interface {v1, v0}, Lcom/vkontakte/android/ui/holder/comments/DeletedCommentViewHolder$DeletedCommentViewHolderListener;->banUser(Lcom/vkontakte/android/Comment;)V

    goto :goto_0

    .line 51
    :pswitch_2
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/comments/DeletedCommentViewHolder;->holderListener:Lcom/vkontakte/android/ui/holder/comments/DeletedCommentViewHolder$DeletedCommentViewHolderListener;

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/comments/DeletedCommentViewHolder;->getItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/Comment;

    invoke-interface {v1, v0}, Lcom/vkontakte/android/ui/holder/comments/DeletedCommentViewHolder$DeletedCommentViewHolderListener;->reportComment(Lcom/vkontakte/android/Comment;)V

    goto :goto_0

    .line 43
    :pswitch_data_0
    .packed-switch 0x7f100278
        :pswitch_0
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method
