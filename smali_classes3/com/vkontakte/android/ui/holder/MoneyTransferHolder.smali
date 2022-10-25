.class public Lcom/vkontakte/android/ui/holder/MoneyTransferHolder;
.super Lcom/vkontakte/android/ui/holder/RecyclerHolder;
.source "MoneyTransferHolder.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
        "<",
        "Lcom/vkontakte/android/MoneyTransfer;",
        ">;",
        "Landroid/view/View$OnClickListener;"
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "MoneyTransferHolder"


# instance fields
.field private final mInfo:Landroid/widget/TextView;

.field private final mNegativeButton:Landroid/widget/TextView;

.field private final mPhoto:Lcom/vk/imageloader/view/VKImageView;

.field private final mPositiveButton:Landroid/widget/TextView;

.field private final mSubtitle:Landroid/widget/TextView;

.field private final mSum:Landroid/widget/TextView;

.field private final mTitle:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/view/ViewGroup;)V
    .locals 1
    .param p1, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 54
    const v0, 0x7f030120

    invoke-direct {p0, v0, p1}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;-><init>(ILandroid/view/ViewGroup;)V

    .line 55
    const v0, 0x7f100128

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/holder/MoneyTransferHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/holder/MoneyTransferHolder;->mTitle:Landroid/widget/TextView;

    .line 56
    const v0, 0x7f10019c

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/holder/MoneyTransferHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/holder/MoneyTransferHolder;->mSubtitle:Landroid/widget/TextView;

    .line 57
    const v0, 0x7f1002b1

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/holder/MoneyTransferHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/holder/MoneyTransferHolder;->mInfo:Landroid/widget/TextView;

    .line 58
    const v0, 0x7f1001e8

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/holder/MoneyTransferHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/imageloader/view/VKImageView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/holder/MoneyTransferHolder;->mPhoto:Lcom/vk/imageloader/view/VKImageView;

    .line 59
    const v0, 0x7f1002b3

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/holder/MoneyTransferHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/holder/MoneyTransferHolder;->mPositiveButton:Landroid/widget/TextView;

    .line 60
    const v0, 0x7f1002b4

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/holder/MoneyTransferHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/holder/MoneyTransferHolder;->mNegativeButton:Landroid/widget/TextView;

    .line 62
    const v0, 0x7f1003ab

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/holder/MoneyTransferHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/holder/MoneyTransferHolder;->mSum:Landroid/widget/TextView;

    .line 64
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/MoneyTransferHolder;->mPositiveButton:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 65
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/MoneyTransferHolder;->mNegativeButton:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 66
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/MoneyTransferHolder;->itemView:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 68
    return-void
.end method

.method private formatTitle()Ljava/lang/String;
    .locals 5

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x1

    .line 120
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/MoneyTransferHolder;->getItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/MoneyTransfer;

    invoke-virtual {v0}, Lcom/vkontakte/android/MoneyTransfer;->isIncoming()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 121
    const v1, 0x7f080365

    new-array v2, v3, [Ljava/lang/Object;

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/MoneyTransferHolder;->getItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/MoneyTransfer;

    iget-object v0, v0, Lcom/vkontakte/android/MoneyTransfer;->fromUser:Lcom/vkontakte/android/UserProfile;

    invoke-virtual {v0, v3}, Lcom/vkontakte/android/UserProfile;->getNameInCase(I)Ljava/lang/String;

    move-result-object v0

    aput-object v0, v2, v4

    invoke-virtual {p0, v1, v2}, Lcom/vkontakte/android/ui/holder/MoneyTransferHolder;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 124
    :goto_0
    return-object v0

    :cond_0
    const v1, 0x7f08038c

    new-array v2, v3, [Ljava/lang/Object;

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/MoneyTransferHolder;->getItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/MoneyTransfer;

    iget-object v0, v0, Lcom/vkontakte/android/MoneyTransfer;->toUser:Lcom/vkontakte/android/UserProfile;

    const/4 v3, 0x2

    invoke-virtual {v0, v3}, Lcom/vkontakte/android/UserProfile;->getNameInCase(I)Ljava/lang/String;

    move-result-object v0

    aput-object v0, v2, v4

    invoke-virtual {p0, v1, v2}, Lcom/vkontakte/android/ui/holder/MoneyTransferHolder;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method


# virtual methods
.method public onBind(Lcom/vkontakte/android/MoneyTransfer;)V
    .locals 9
    .param p1, "item"    # Lcom/vkontakte/android/MoneyTransfer;

    .prologue
    const/16 v5, 0x8

    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 73
    :try_start_0
    const-string/jumbo v6, "MoneyTransferHolder"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "bind "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/vkontakte/android/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 74
    iget-object v6, p0, Lcom/vkontakte/android/ui/holder/MoneyTransferHolder;->mPhoto:Lcom/vk/imageloader/view/VKImageView;

    invoke-virtual {p1}, Lcom/vkontakte/android/MoneyTransfer;->getPeerUser()Lcom/vkontakte/android/UserProfile;

    move-result-object v7

    iget-object v7, v7, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    invoke-virtual {v6, v7}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    .line 75
    iget-object v6, p0, Lcom/vkontakte/android/ui/holder/MoneyTransferHolder;->mTitle:Landroid/widget/TextView;

    invoke-direct {p0}, Lcom/vkontakte/android/ui/holder/MoneyTransferHolder;->formatTitle()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 76
    iget-object v6, p1, Lcom/vkontakte/android/MoneyTransfer;->displayableComment:Ljava/lang/CharSequence;

    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_2

    move v1, v3

    .line 77
    .local v1, "haveComment":Z
    :goto_0
    iget-object v7, p0, Lcom/vkontakte/android/ui/holder/MoneyTransferHolder;->mSubtitle:Landroid/widget/TextView;

    if-eqz v1, :cond_3

    iget-object v6, p1, Lcom/vkontakte/android/MoneyTransfer;->displayableComment:Ljava/lang/CharSequence;

    :goto_1
    invoke-virtual {v7, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 78
    iget-object v6, p0, Lcom/vkontakte/android/ui/holder/MoneyTransferHolder;->mSubtitle:Landroid/widget/TextView;

    if-eqz v1, :cond_0

    move v5, v4

    :cond_0
    invoke-virtual {v6, v5}, Landroid/widget/TextView;->setVisibility(I)V

    .line 79
    iget-object v5, p0, Lcom/vkontakte/android/ui/holder/MoneyTransferHolder;->mInfo:Landroid/widget/TextView;

    iget v6, p1, Lcom/vkontakte/android/MoneyTransfer;->date:I

    const/4 v7, 0x0

    invoke-static {v6, v7}, Lcom/vkontakte/android/TimeUtils;->langDate(IZ)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 81
    invoke-virtual {p1}, Lcom/vkontakte/android/MoneyTransfer;->isIncoming()Z

    move-result v5

    if-eqz v5, :cond_4

    iget v5, p1, Lcom/vkontakte/android/MoneyTransfer;->status:I

    if-nez v5, :cond_4

    move v2, v3

    .line 82
    .local v2, "isPendingIncoming":Z
    :goto_2
    invoke-virtual {p1}, Lcom/vkontakte/android/MoneyTransfer;->isIncoming()Z

    move-result v5

    if-nez v5, :cond_5

    iget v5, p1, Lcom/vkontakte/android/MoneyTransfer;->status:I

    if-nez v5, :cond_5

    .line 90
    .local v3, "isPendingOutgoing":Z
    :goto_3
    iget-object v4, p0, Lcom/vkontakte/android/ui/holder/MoneyTransferHolder;->mPositiveButton:Landroid/widget/TextView;

    const/16 v5, 0x8

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setVisibility(I)V

    .line 91
    iget-object v4, p0, Lcom/vkontakte/android/ui/holder/MoneyTransferHolder;->mNegativeButton:Landroid/widget/TextView;

    const/16 v5, 0x8

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setVisibility(I)V

    .line 93
    if-eqz v2, :cond_6

    .line 94
    iget-object v4, p0, Lcom/vkontakte/android/ui/holder/MoneyTransferHolder;->mNegativeButton:Landroid/widget/TextView;

    const v5, 0x7f080364

    invoke-virtual {p0, v5}, Lcom/vkontakte/android/ui/holder/MoneyTransferHolder;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 99
    :cond_1
    :goto_4
    iget-object v4, p0, Lcom/vkontakte/android/ui/holder/MoneyTransferHolder;->mSum:Landroid/widget/TextView;

    invoke-virtual {p1}, Lcom/vkontakte/android/MoneyTransfer;->getSignedAmountWithCurrencyFormatted()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 101
    iget v4, p1, Lcom/vkontakte/android/MoneyTransfer;->status:I

    packed-switch v4, :pswitch_data_0

    .line 117
    .end local v1    # "haveComment":Z
    .end local v2    # "isPendingIncoming":Z
    .end local v3    # "isPendingOutgoing":Z
    :goto_5
    return-void

    :cond_2
    move v1, v4

    .line 76
    goto :goto_0

    .line 77
    .restart local v1    # "haveComment":Z
    :cond_3
    const-string/jumbo v6, ""

    goto :goto_1

    :cond_4
    move v2, v4

    .line 81
    goto :goto_2

    .restart local v2    # "isPendingIncoming":Z
    :cond_5
    move v3, v4

    .line 82
    goto :goto_3

    .line 95
    .restart local v3    # "isPendingOutgoing":Z
    :cond_6
    if-eqz v3, :cond_1

    .line 96
    iget-object v4, p0, Lcom/vkontakte/android/ui/holder/MoneyTransferHolder;->mNegativeButton:Landroid/widget/TextView;

    const v5, 0x7f080360

    invoke-virtual {p0, v5}, Lcom/vkontakte/android/ui/holder/MoneyTransferHolder;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_4

    .line 113
    .end local v1    # "haveComment":Z
    .end local v2    # "isPendingIncoming":Z
    .end local v3    # "isPendingOutgoing":Z
    :catch_0
    move-exception v0

    .line 114
    .local v0, "exc":Ljava/lang/Exception;
    const-string/jumbo v4, "MoneyTransferHolder"

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/vkontakte/android/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_5

    .line 103
    .end local v0    # "exc":Ljava/lang/Exception;
    .restart local v1    # "haveComment":Z
    .restart local v2    # "isPendingIncoming":Z
    .restart local v3    # "isPendingOutgoing":Z
    :pswitch_0
    :try_start_1
    iget-object v4, p0, Lcom/vkontakte/android/ui/holder/MoneyTransferHolder;->mSum:Landroid/widget/TextView;

    const v5, -0x19b9ba

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setTextColor(I)V

    goto :goto_5

    .line 106
    :pswitch_1
    iget-object v4, p0, Lcom/vkontakte/android/ui/holder/MoneyTransferHolder;->mSum:Landroid/widget/TextView;

    const/high16 v5, -0x1000000

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setTextColor(I)V

    goto :goto_5

    .line 109
    :pswitch_2
    iget-object v4, p0, Lcom/vkontakte/android/ui/holder/MoneyTransferHolder;->mSum:Landroid/widget/TextView;

    const v5, -0x6f6b67

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setTextColor(I)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_5

    .line 101
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public bridge synthetic onBind(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 36
    check-cast p1, Lcom/vkontakte/android/MoneyTransfer;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/ui/holder/MoneyTransferHolder;->onBind(Lcom/vkontakte/android/MoneyTransfer;)V

    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 5
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 130
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/MoneyTransferHolder;->mPositiveButton:Landroid/widget/TextView;

    if-ne p1, v1, :cond_0

    .line 131
    new-instance v2, Lcom/vkontakte/android/api/money/MoneyGetTransfer;

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/MoneyTransferHolder;->getItem()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/MoneyTransfer;

    iget v3, v1, Lcom/vkontakte/android/MoneyTransfer;->id:I

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/MoneyTransferHolder;->getItem()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/MoneyTransfer;

    iget v4, v1, Lcom/vkontakte/android/MoneyTransfer;->from_id:I

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/MoneyTransferHolder;->getItem()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/MoneyTransfer;

    iget v1, v1, Lcom/vkontakte/android/MoneyTransfer;->to_id:I

    invoke-direct {v2, v3, v4, v1}, Lcom/vkontakte/android/api/money/MoneyGetTransfer;-><init>(III)V

    new-instance v1, Lcom/vkontakte/android/ui/holder/MoneyTransferHolder$1;

    invoke-direct {v1, p0, p1}, Lcom/vkontakte/android/ui/holder/MoneyTransferHolder$1;-><init>(Lcom/vkontakte/android/ui/holder/MoneyTransferHolder;Landroid/view/View;)V

    .line 132
    invoke-virtual {v2, v1}, Lcom/vkontakte/android/api/money/MoneyGetTransfer;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v2

    .line 138
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    check-cast v1, Landroid/app/Activity;

    invoke-virtual {v2, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v2

    .line 139
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    check-cast v1, Landroid/app/Activity;

    invoke-virtual {v2, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 166
    :goto_0
    return-void

    .line 141
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/MoneyTransferHolder;->mNegativeButton:Landroid/widget/TextView;

    if-ne p1, v1, :cond_1

    .line 143
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/MoneyTransferHolder;->getItem()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/MoneyTransfer;

    iget v0, v1, Lcom/vkontakte/android/MoneyTransfer;->id:I

    .line 145
    .local v0, "id":I
    new-instance v1, Lcom/vkontakte/android/api/money/MoneyDeclineTransfer;

    invoke-direct {v1, v0}, Lcom/vkontakte/android/api/money/MoneyDeclineTransfer;-><init>(I)V

    new-instance v2, Lcom/vkontakte/android/ui/holder/MoneyTransferHolder$2;

    invoke-direct {v2, p0, p1, v0}, Lcom/vkontakte/android/ui/holder/MoneyTransferHolder$2;-><init>(Lcom/vkontakte/android/ui/holder/MoneyTransferHolder;Landroid/view/View;I)V

    .line 146
    invoke-virtual {v1, v2}, Lcom/vkontakte/android/api/money/MoneyDeclineTransfer;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    .line 158
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    .line 159
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    goto :goto_0

    .line 163
    .end local v0    # "id":I
    :cond_1
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/MoneyTransferHolder;->getItem()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/MoneyTransfer;

    .line 164
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lcom/vkontakte/android/utils/Utils;->castToActivity(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object v2

    .line 163
    invoke-static {v1, v2}, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->show(Lcom/vkontakte/android/MoneyTransfer;Landroid/content/Context;)V

    goto :goto_0
.end method
