.class public Lcom/vkontakte/android/ui/holder/gamepage/GameNewsTitle;
.super Lcom/vkontakte/android/ui/holder/RecyclerHolder;
.source "GameNewsTitle.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/ui/holder/gamepage/GameNewsTitle$Data;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
        "<",
        "Lcom/vkontakte/android/ui/holder/gamepage/GameNewsTitle$Data;",
        ">;",
        "Landroid/view/View$OnClickListener;"
    }
.end annotation


# instance fields
.field subscribeButton:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 32
    const v0, 0x7f03003b

    invoke-direct {p0, v0, p1}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;-><init>(ILandroid/content/Context;)V

    .line 34
    const v0, 0x7f1001d2

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/holder/gamepage/GameNewsTitle;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameNewsTitle;->subscribeButton:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 35
    return-void
.end method

.method private joinGroup()V
    .locals 3

    .prologue
    .line 58
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/gamepage/GameNewsTitle;->getItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/ui/holder/gamepage/GameNewsTitle$Data;

    iget v0, v0, Lcom/vkontakte/android/ui/holder/gamepage/GameNewsTitle$Data;->appId:I

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vkontakte/android/api/groups/GroupsJoin;->createGroupsJoinAndSendAllStats(IZ)Lcom/vkontakte/android/api/groups/GroupsJoin;

    move-result-object v1

    new-instance v2, Lcom/vkontakte/android/ui/holder/gamepage/GameNewsTitle$1;

    const/4 v0, 0x0

    check-cast v0, Landroid/app/Activity;

    invoke-direct {v2, p0, v0}, Lcom/vkontakte/android/ui/holder/gamepage/GameNewsTitle$1;-><init>(Lcom/vkontakte/android/ui/holder/gamepage/GameNewsTitle;Landroid/content/Context;)V

    .line 59
    invoke-virtual {v1, v2}, Lcom/vkontakte/android/api/groups/GroupsJoin;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 75
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/gamepage/GameNewsTitle;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/gamepage/GameNewsTitle;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 76
    return-void
.end method

.method private leaveGroup()V
    .locals 3

    .prologue
    .line 79
    new-instance v1, Lcom/vkontakte/android/api/groups/GroupsLeave;

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/gamepage/GameNewsTitle;->getItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/ui/holder/gamepage/GameNewsTitle$Data;

    iget v0, v0, Lcom/vkontakte/android/ui/holder/gamepage/GameNewsTitle$Data;->appId:I

    invoke-direct {v1, v0}, Lcom/vkontakte/android/api/groups/GroupsLeave;-><init>(I)V

    new-instance v2, Lcom/vkontakte/android/ui/holder/gamepage/GameNewsTitle$2;

    const/4 v0, 0x0

    check-cast v0, Landroid/app/Activity;

    invoke-direct {v2, p0, v0}, Lcom/vkontakte/android/ui/holder/gamepage/GameNewsTitle$2;-><init>(Lcom/vkontakte/android/ui/holder/gamepage/GameNewsTitle;Landroid/content/Context;)V

    .line 80
    invoke-virtual {v1, v2}, Lcom/vkontakte/android/api/groups/GroupsLeave;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 96
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/gamepage/GameNewsTitle;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 97
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/gamepage/GameNewsTitle;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 98
    return-void
.end method


# virtual methods
.method public onBind(Lcom/vkontakte/android/ui/holder/gamepage/GameNewsTitle$Data;)V
    .locals 2
    .param p1, "item"    # Lcom/vkontakte/android/ui/holder/gamepage/GameNewsTitle$Data;

    .prologue
    .line 39
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameNewsTitle;->subscribeButton:Landroid/widget/TextView;

    iget-boolean v0, p1, Lcom/vkontakte/android/ui/holder/gamepage/GameNewsTitle$Data;->isMember:Z

    if-eqz v0, :cond_0

    const v0, 0x7f08025c

    :goto_0
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(I)V

    .line 40
    return-void

    .line 39
    :cond_0
    const v0, 0x7f08025b

    goto :goto_0
.end method

.method public bridge synthetic onBind(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 17
    check-cast p1, Lcom/vkontakte/android/ui/holder/gamepage/GameNewsTitle$Data;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/ui/holder/gamepage/GameNewsTitle;->onBind(Lcom/vkontakte/android/ui/holder/gamepage/GameNewsTitle$Data;)V

    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 46
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/gamepage/GameNewsTitle;->getItem()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 47
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/gamepage/GameNewsTitle;->getItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/ui/holder/gamepage/GameNewsTitle$Data;

    iget-boolean v0, v0, Lcom/vkontakte/android/ui/holder/gamepage/GameNewsTitle$Data;->isMember:Z

    if-eqz v0, :cond_1

    .line 48
    invoke-direct {p0}, Lcom/vkontakte/android/ui/holder/gamepage/GameNewsTitle;->leaveGroup()V

    .line 53
    :cond_0
    :goto_0
    return-void

    .line 50
    :cond_1
    invoke-direct {p0}, Lcom/vkontakte/android/ui/holder/gamepage/GameNewsTitle;->joinGroup()V

    goto :goto_0
.end method
