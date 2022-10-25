.class public Lcom/vkontakte/android/ui/holder/messages/RemovableChatUserViewHolder;
.super Lcom/vkontakte/android/ui/holder/RecyclerHolder;
.source "RemovableChatUserViewHolder.java"

# interfaces
.implements Lme/grishka/appkit/views/UsableRecyclerView$Clickable;
.implements Lcom/vkontakte/android/ui/CardItemDecorator$Provider;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
        "<",
        "Lcom/vkontakte/android/ChatUser;",
        ">;",
        "Lme/grishka/appkit/views/UsableRecyclerView$Clickable;",
        "Lcom/vkontakte/android/ui/CardItemDecorator$Provider;"
    }
.end annotation


# instance fields
.field public final btnClose:Landroid/view/View;

.field public isCreate:Z

.field public final name:Landroid/widget/TextView;

.field public onClickListener:Landroid/view/View$OnClickListener;

.field public final online:Landroid/widget/ImageView;

.field public final photo:Lcom/vk/imageloader/view/VKImageView;

.field public final subtitle:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 33
    const v0, 0x7f0301ec

    invoke-direct {p0, v0, p1}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;-><init>(ILandroid/content/Context;)V

    .line 29
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/ui/holder/messages/RemovableChatUserViewHolder;->isCreate:Z

    .line 30
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/ui/holder/messages/RemovableChatUserViewHolder;->onClickListener:Landroid/view/View$OnClickListener;

    .line 34
    const v0, 0x1020014

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/holder/messages/RemovableChatUserViewHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/holder/messages/RemovableChatUserViewHolder;->name:Landroid/widget/TextView;

    .line 35
    const v0, 0x1020015

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/holder/messages/RemovableChatUserViewHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/holder/messages/RemovableChatUserViewHolder;->subtitle:Landroid/widget/TextView;

    .line 36
    const v0, 0x7f1001e8

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/holder/messages/RemovableChatUserViewHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/imageloader/view/VKImageView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/holder/messages/RemovableChatUserViewHolder;->photo:Lcom/vk/imageloader/view/VKImageView;

    .line 37
    const v0, 0x7f100518

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/holder/messages/RemovableChatUserViewHolder;->$(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/ui/holder/messages/RemovableChatUserViewHolder;->btnClose:Landroid/view/View;

    .line 38
    const v0, 0x7f100066

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/holder/messages/RemovableChatUserViewHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/holder/messages/RemovableChatUserViewHolder;->online:Landroid/widget/ImageView;

    .line 40
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/messages/RemovableChatUserViewHolder;->btnClose:Landroid/view/View;

    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/messages/RemovableChatUserViewHolder;->onClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 41
    return-void
.end method

.method public static getImageUrl(Ljava/lang/Object;)Ljava/lang/String;
    .locals 1
    .param p0, "obj"    # Ljava/lang/Object;

    .prologue
    .line 78
    instance-of v0, p0, Lcom/vkontakte/android/ChatUser;

    if-eqz v0, :cond_0

    .line 79
    check-cast p0, Lcom/vkontakte/android/ChatUser;

    .end local p0    # "obj":Ljava/lang/Object;
    iget-object v0, p0, Lcom/vkontakte/android/ChatUser;->user:Lcom/vkontakte/android/UserProfile;

    iget-object v0, v0, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    .line 81
    :goto_0
    return-object v0

    .restart local p0    # "obj":Ljava/lang/Object;
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public getBlockType(I)I
    .locals 2
    .param p1, "position"    # I

    .prologue
    const/4 v1, 0x2

    .line 73
    rem-int/lit8 v0, p1, 0x3

    .line 74
    .local v0, "i":I
    if-nez v0, :cond_0

    :goto_0
    return v1

    :cond_0
    if-ne v0, v1, :cond_1

    const/4 v1, 0x4

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public onBind(Lcom/vkontakte/android/ChatUser;)V
    .locals 5
    .param p1, "chatUser"    # Lcom/vkontakte/android/ChatUser;

    .prologue
    const/4 v1, 0x0

    .line 45
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/messages/RemovableChatUserViewHolder;->photo:Lcom/vk/imageloader/view/VKImageView;

    iget-object v2, p1, Lcom/vkontakte/android/ChatUser;->user:Lcom/vkontakte/android/UserProfile;

    iget-object v2, v2, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    invoke-virtual {v0, v2}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    .line 46
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/messages/RemovableChatUserViewHolder;->name:Landroid/widget/TextView;

    iget-object v2, p1, Lcom/vkontakte/android/ChatUser;->user:Lcom/vkontakte/android/UserProfile;

    iget-object v2, v2, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 47
    iget-object v0, p1, Lcom/vkontakte/android/ChatUser;->inviter:Lcom/vkontakte/android/UserProfile;

    iget v0, v0, Lcom/vkontakte/android/UserProfile;->uid:I

    iget-object v2, p1, Lcom/vkontakte/android/ChatUser;->user:Lcom/vkontakte/android/UserProfile;

    iget v2, v2, Lcom/vkontakte/android/UserProfile;->uid:I

    if-eq v0, v2, :cond_0

    invoke-virtual {p1}, Lcom/vkontakte/android/ChatUser;->isAdmin()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 48
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/messages/RemovableChatUserViewHolder;->subtitle:Landroid/widget/TextView;

    const v2, 0x7f080129

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(I)V

    .line 52
    :goto_0
    iget-object v2, p0, Lcom/vkontakte/android/ui/holder/messages/RemovableChatUserViewHolder;->btnClose:Landroid/view/View;

    iget-object v0, p1, Lcom/vkontakte/android/ChatUser;->user:Lcom/vkontakte/android/UserProfile;

    iget v0, v0, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-static {v0}, Lcom/vkontakte/android/auth/VKAccountManager;->isCurrentUser(I)Z

    move-result v0

    if-nez v0, :cond_4

    iget-object v0, p1, Lcom/vkontakte/android/ChatUser;->inviter:Lcom/vkontakte/android/UserProfile;

    iget v0, v0, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-static {v0}, Lcom/vkontakte/android/auth/VKAccountManager;->isCurrentUser(I)Z

    move-result v0

    if-nez v0, :cond_1

    iget v0, p1, Lcom/vkontakte/android/ChatUser;->admin:I

    .line 53
    invoke-static {v0}, Lcom/vkontakte/android/auth/VKAccountManager;->isCurrentUser(I)Z

    move-result v0

    if-eqz v0, :cond_4

    :cond_1
    iget-boolean v0, p0, Lcom/vkontakte/android/ui/holder/messages/RemovableChatUserViewHolder;->isCreate:Z

    if-nez v0, :cond_4

    move v0, v1

    .line 52
    :goto_1
    invoke-virtual {v2, v0}, Landroid/view/View;->setVisibility(I)V

    .line 54
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/messages/RemovableChatUserViewHolder;->btnClose:Landroid/view/View;

    iget-object v1, p1, Lcom/vkontakte/android/ChatUser;->user:Lcom/vkontakte/android/UserProfile;

    iget v1, v1, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 56
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/messages/RemovableChatUserViewHolder;->online:Landroid/widget/ImageView;

    iget-object v1, p1, Lcom/vkontakte/android/ChatUser;->user:Lcom/vkontakte/android/UserProfile;

    const/16 v2, 0x30

    invoke-static {v0, v1, v2}, Lcom/vkontakte/android/ui/holder/UserHolder;->updateOnlineImage(Landroid/widget/ImageView;Lcom/vkontakte/android/UserProfile;I)V

    .line 57
    return-void

    .line 50
    :cond_2
    iget-object v2, p0, Lcom/vkontakte/android/ui/holder/messages/RemovableChatUserViewHolder;->subtitle:Landroid/widget/TextView;

    iget-object v0, p1, Lcom/vkontakte/android/ChatUser;->inviter:Lcom/vkontakte/android/UserProfile;

    iget-boolean v0, v0, Lcom/vkontakte/android/UserProfile;->f:Z

    if-eqz v0, :cond_3

    const v0, 0x7f080321

    :goto_2
    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    iget-object v4, p1, Lcom/vkontakte/android/ChatUser;->inviter:Lcom/vkontakte/android/UserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    aput-object v4, v3, v1

    invoke-virtual {p0, v0, v3}, Lcom/vkontakte/android/ui/holder/messages/RemovableChatUserViewHolder;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    :cond_3
    const v0, 0x7f080322

    goto :goto_2

    .line 53
    :cond_4
    const/4 v0, 0x4

    goto :goto_1
.end method

.method public bridge synthetic onBind(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 21
    check-cast p1, Lcom/vkontakte/android/ChatUser;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/ui/holder/messages/RemovableChatUserViewHolder;->onBind(Lcom/vkontakte/android/ChatUser;)V

    return-void
.end method

.method public onClick()V
    .locals 2

    .prologue
    .line 68
    new-instance v1, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/messages/RemovableChatUserViewHolder;->getItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/ChatUser;

    iget-object v0, v0, Lcom/vkontakte/android/ChatUser;->user:Lcom/vkontakte/android/UserProfile;

    iget v0, v0, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-direct {v1, v0}, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;-><init>(I)V

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/messages/RemovableChatUserViewHolder;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;->go(Landroid/content/Context;)Z

    .line 69
    return-void
.end method

.method public setOnClickListenerAndIsCreate(Landroid/view/View$OnClickListener;Z)V
    .locals 1
    .param p1, "onClickListener"    # Landroid/view/View$OnClickListener;
    .param p2, "isCreate"    # Z

    .prologue
    .line 60
    iput-object p1, p0, Lcom/vkontakte/android/ui/holder/messages/RemovableChatUserViewHolder;->onClickListener:Landroid/view/View$OnClickListener;

    .line 61
    iput-boolean p2, p0, Lcom/vkontakte/android/ui/holder/messages/RemovableChatUserViewHolder;->isCreate:Z

    .line 63
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/messages/RemovableChatUserViewHolder;->btnClose:Landroid/view/View;

    invoke-virtual {v0, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 64
    return-void
.end method
