.class public Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;
.super Lme/grishka/appkit/fragments/AppKitFragment;
.source "MoneyTransferDetailsFragment.java"


# static fields
.field private static final EXTRA_DATA_ARG:Ljava/lang/String; = "data"


# instance fields
.field private imagePeer:Lcom/vk/imageloader/view/VKImageView;

.field private mData:Lcom/vkontakte/android/MoneyTransfer;

.field private textViewCancel:Landroid/widget/TextView;

.field private textViewComment:Landroid/widget/TextView;

.field private textViewCurrencySymbol:Landroid/widget/TextView;

.field private textViewDate:Landroid/widget/TextView;

.field private textViewNegative:Landroid/widget/TextView;

.field private textViewPositive:Landroid/widget/TextView;

.field private textViewRepeat:Landroid/widget/TextView;

.field private textViewSign:Landroid/widget/TextView;

.field private textViewStatus:Landroid/widget/TextView;

.field private textViewSum:Landroid/widget/TextView;

.field private textViewTo:Landroid/widget/TextView;

.field private viewDivider:Landroid/view/View;

.field private viewGroupCommentStatus:Landroid/view/ViewGroup;

.field private viewGroupPositiveNegative:Landroid/view/ViewGroup;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 36
    invoke-direct {p0}, Lme/grishka/appkit/fragments/AppKitFragment;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;)Lcom/vkontakte/android/MoneyTransfer;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;

    .prologue
    .line 36
    iget-object v0, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->mData:Lcom/vkontakte/android/MoneyTransfer;

    return-object v0
.end method

.method static synthetic access$002(Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;Lcom/vkontakte/android/MoneyTransfer;)Lcom/vkontakte/android/MoneyTransfer;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;
    .param p1, "x1"    # Lcom/vkontakte/android/MoneyTransfer;

    .prologue
    .line 36
    iput-object p1, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->mData:Lcom/vkontakte/android/MoneyTransfer;

    return-object p1
.end method

.method static synthetic access$100(Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;

    .prologue
    .line 36
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->bindData()V

    return-void
.end method

.method private bindData()V
    .locals 13

    .prologue
    const/4 v12, 0x2

    const/4 v7, 0x1

    const/16 v6, 0x8

    const/4 v11, 0x0

    const/4 v5, 0x0

    .line 214
    iget-object v4, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->mData:Lcom/vkontakte/android/MoneyTransfer;

    iget-object v4, v4, Lcom/vkontakte/android/MoneyTransfer;->displayableComment:Ljava/lang/CharSequence;

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_6

    move v1, v7

    .line 216
    .local v1, "haveComment":Z
    :goto_0
    if-eqz v1, :cond_7

    iget-object v4, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->mData:Lcom/vkontakte/android/MoneyTransfer;

    iget-object v0, v4, Lcom/vkontakte/android/MoneyTransfer;->displayableComment:Ljava/lang/CharSequence;

    .line 218
    .local v0, "commentStr":Ljava/lang/CharSequence;
    :goto_1
    iget-object v4, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->mData:Lcom/vkontakte/android/MoneyTransfer;

    invoke-virtual {v4}, Lcom/vkontakte/android/MoneyTransfer;->isIncoming()Z

    move-result v4

    if-eqz v4, :cond_8

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v8, 0x7f080365

    new-array v9, v7, [Ljava/lang/Object;

    iget-object v10, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->mData:Lcom/vkontakte/android/MoneyTransfer;

    invoke-virtual {v10}, Lcom/vkontakte/android/MoneyTransfer;->getPeerUser()Lcom/vkontakte/android/UserProfile;

    move-result-object v10

    invoke-virtual {v10, v7}, Lcom/vkontakte/android/UserProfile;->getNameInCase(I)Ljava/lang/String;

    move-result-object v10

    aput-object v10, v9, v5

    invoke-virtual {v4, v8, v9}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    .line 223
    .local v3, "toFromText":Ljava/lang/String;
    :goto_2
    iget-object v4, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->mData:Lcom/vkontakte/android/MoneyTransfer;

    invoke-virtual {v4}, Lcom/vkontakte/android/MoneyTransfer;->isIncoming()Z

    move-result v4

    if-eqz v4, :cond_9

    const-string/jumbo v2, "+"

    .line 227
    .local v2, "sign":Ljava/lang/String;
    :goto_3
    iget-object v4, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->textViewTo:Landroid/widget/TextView;

    invoke-virtual {v4, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 229
    iget-object v4, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->textViewDate:Landroid/widget/TextView;

    iget-object v8, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->mData:Lcom/vkontakte/android/MoneyTransfer;

    iget v8, v8, Lcom/vkontakte/android/MoneyTransfer;->date:I

    invoke-static {v8, v5}, Lcom/vkontakte/android/TimeUtils;->langDate(IZ)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v4, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 231
    iget-object v4, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->textViewSign:Landroid/widget/TextView;

    invoke-virtual {v4, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 233
    iget-object v4, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->textViewSum:Landroid/widget/TextView;

    iget-object v8, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->mData:Lcom/vkontakte/android/MoneyTransfer;

    invoke-virtual {v8}, Lcom/vkontakte/android/MoneyTransfer;->getAmountFormatted()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v4, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 235
    iget-object v4, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->textViewCurrencySymbol:Landroid/widget/TextView;

    iget-object v8, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->mData:Lcom/vkontakte/android/MoneyTransfer;

    invoke-virtual {v8}, Lcom/vkontakte/android/MoneyTransfer;->getCurrencySymbol()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v4, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 237
    iget-object v8, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->viewGroupPositiveNegative:Landroid/view/ViewGroup;

    iget-object v4, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->mData:Lcom/vkontakte/android/MoneyTransfer;

    invoke-virtual {v4}, Lcom/vkontakte/android/MoneyTransfer;->isIncoming()Z

    move-result v4

    if-eqz v4, :cond_a

    iget-object v4, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->mData:Lcom/vkontakte/android/MoneyTransfer;

    iget v4, v4, Lcom/vkontakte/android/MoneyTransfer;->status:I

    if-nez v4, :cond_a

    move v4, v5

    :goto_4
    invoke-virtual {v8, v4}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 239
    iget-object v8, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->textViewComment:Landroid/widget/TextView;

    if-eqz v1, :cond_b

    move v4, v5

    :goto_5
    invoke-virtual {v8, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 241
    iget-object v4, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->textViewComment:Landroid/widget/TextView;

    invoke-virtual {v4, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 243
    iget-object v8, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->textViewStatus:Landroid/widget/TextView;

    iget-object v4, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->mData:Lcom/vkontakte/android/MoneyTransfer;

    invoke-virtual {v4}, Lcom/vkontakte/android/MoneyTransfer;->isIncoming()Z

    move-result v4

    if-eqz v4, :cond_0

    iget-object v4, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->mData:Lcom/vkontakte/android/MoneyTransfer;

    iget v4, v4, Lcom/vkontakte/android/MoneyTransfer;->status:I

    if-eq v4, v12, :cond_1

    iget-object v4, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->mData:Lcom/vkontakte/android/MoneyTransfer;

    iget v4, v4, Lcom/vkontakte/android/MoneyTransfer;->status:I

    iget-object v9, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->mData:Lcom/vkontakte/android/MoneyTransfer;

    if-eq v4, v7, :cond_1

    :cond_0
    iget-object v4, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->mData:Lcom/vkontakte/android/MoneyTransfer;

    .line 244
    invoke-virtual {v4}, Lcom/vkontakte/android/MoneyTransfer;->isIncoming()Z

    move-result v4

    if-nez v4, :cond_c

    :cond_1
    move v4, v5

    .line 243
    :goto_6
    invoke-virtual {v8, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 246
    iget-object v4, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->mData:Lcom/vkontakte/android/MoneyTransfer;

    iget v4, v4, Lcom/vkontakte/android/MoneyTransfer;->status:I

    packed-switch v4, :pswitch_data_0

    .line 261
    :goto_7
    iget-object v4, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->textViewStatus:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    iget-object v9, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->mData:Lcom/vkontakte/android/MoneyTransfer;

    invoke-virtual {v9}, Lcom/vkontakte/android/MoneyTransfer;->getStatusStringId()I

    move-result v9

    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v4, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 263
    iget-object v8, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->viewGroupCommentStatus:Landroid/view/ViewGroup;

    iget-object v4, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->textViewComment:Landroid/widget/TextView;

    invoke-virtual {v4}, Landroid/widget/TextView;->getVisibility()I

    move-result v4

    if-eqz v4, :cond_2

    iget-object v4, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->textViewStatus:Landroid/widget/TextView;

    invoke-virtual {v4}, Landroid/widget/TextView;->getVisibility()I

    move-result v4

    if-nez v4, :cond_d

    :cond_2
    move v4, v5

    :goto_8
    invoke-virtual {v8, v4}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 265
    iget-object v8, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->textViewCancel:Landroid/widget/TextView;

    iget-object v4, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->mData:Lcom/vkontakte/android/MoneyTransfer;

    invoke-virtual {v4}, Lcom/vkontakte/android/MoneyTransfer;->isIncoming()Z

    move-result v4

    if-nez v4, :cond_e

    iget-object v4, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->mData:Lcom/vkontakte/android/MoneyTransfer;

    iget v4, v4, Lcom/vkontakte/android/MoneyTransfer;->status:I

    if-nez v4, :cond_e

    move v4, v5

    :goto_9
    invoke-virtual {v8, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 267
    iget-object v8, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->textViewRepeat:Landroid/widget/TextView;

    iget-object v4, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->mData:Lcom/vkontakte/android/MoneyTransfer;

    invoke-virtual {v4}, Lcom/vkontakte/android/MoneyTransfer;->isIncoming()Z

    move-result v4

    if-nez v4, :cond_f

    iget-object v4, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->mData:Lcom/vkontakte/android/MoneyTransfer;

    iget v4, v4, Lcom/vkontakte/android/MoneyTransfer;->status:I

    if-eq v4, v7, :cond_3

    iget-object v4, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->mData:Lcom/vkontakte/android/MoneyTransfer;

    iget v4, v4, Lcom/vkontakte/android/MoneyTransfer;->status:I

    if-ne v4, v12, :cond_f

    :cond_3
    move v4, v5

    :goto_a
    invoke-virtual {v8, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 269
    iget-object v4, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->viewDivider:Landroid/view/View;

    iget-object v7, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->textViewCancel:Landroid/widget/TextView;

    invoke-virtual {v7}, Landroid/widget/TextView;->getVisibility()I

    move-result v7

    if-eqz v7, :cond_4

    iget-object v7, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->textViewRepeat:Landroid/widget/TextView;

    invoke-virtual {v7}, Landroid/widget/TextView;->getVisibility()I

    move-result v7

    if-nez v7, :cond_5

    :cond_4
    move v6, v5

    :cond_5
    invoke-virtual {v4, v6}, Landroid/view/View;->setVisibility(I)V

    .line 270
    return-void

    .end local v0    # "commentStr":Ljava/lang/CharSequence;
    .end local v1    # "haveComment":Z
    .end local v2    # "sign":Ljava/lang/String;
    .end local v3    # "toFromText":Ljava/lang/String;
    :cond_6
    move v1, v5

    .line 214
    goto/16 :goto_0

    .line 216
    .restart local v1    # "haveComment":Z
    :cond_7
    const-string/jumbo v0, ""

    goto/16 :goto_1

    .line 219
    .restart local v0    # "commentStr":Ljava/lang/CharSequence;
    :cond_8
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v8, 0x7f08038c

    new-array v9, v7, [Ljava/lang/Object;

    iget-object v10, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->mData:Lcom/vkontakte/android/MoneyTransfer;

    invoke-virtual {v10}, Lcom/vkontakte/android/MoneyTransfer;->getPeerUser()Lcom/vkontakte/android/UserProfile;

    move-result-object v10

    invoke-virtual {v10, v12}, Lcom/vkontakte/android/UserProfile;->getNameInCase(I)Ljava/lang/String;

    move-result-object v10

    aput-object v10, v9, v5

    invoke-virtual {v4, v8, v9}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    goto/16 :goto_2

    .line 223
    .restart local v3    # "toFromText":Ljava/lang/String;
    :cond_9
    const-string/jumbo v2, "\u2212"

    goto/16 :goto_3

    .restart local v2    # "sign":Ljava/lang/String;
    :cond_a
    move v4, v6

    .line 237
    goto/16 :goto_4

    :cond_b
    move v4, v6

    .line 239
    goto/16 :goto_5

    :cond_c
    move v4, v6

    .line 244
    goto/16 :goto_6

    .line 248
    :pswitch_0
    iget-object v4, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->textViewStatus:Landroid/widget/TextView;

    const v8, -0x19b9ba

    invoke-virtual {v4, v8}, Landroid/widget/TextView;->setTextColor(I)V

    .line 249
    iget-object v4, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->textViewStatus:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->getContext()Landroid/content/Context;

    move-result-object v8

    invoke-virtual {v8}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v9, 0x7f02017c

    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v8

    invoke-virtual {v4, v8, v11, v11, v11}, Landroid/widget/TextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_7

    .line 252
    :pswitch_1
    iget-object v4, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->textViewStatus:Landroid/widget/TextView;

    const v8, -0xb44cb5

    invoke-virtual {v4, v8}, Landroid/widget/TextView;->setTextColor(I)V

    .line 253
    iget-object v4, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->textViewStatus:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->getContext()Landroid/content/Context;

    move-result-object v8

    invoke-virtual {v8}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v9, 0x7f020183

    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v8

    invoke-virtual {v4, v8, v11, v11, v11}, Landroid/widget/TextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_7

    .line 256
    :pswitch_2
    iget-object v4, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->textViewStatus:Landroid/widget/TextView;

    const v8, -0x6f6b67

    invoke-virtual {v4, v8}, Landroid/widget/TextView;->setTextColor(I)V

    .line 257
    iget-object v4, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->textViewStatus:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->getContext()Landroid/content/Context;

    move-result-object v8

    invoke-virtual {v8}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v9, 0x7f0202d9

    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v8

    invoke-virtual {v4, v8, v11, v11, v11}, Landroid/widget/TextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_7

    :cond_d
    move v4, v6

    .line 263
    goto/16 :goto_8

    :cond_e
    move v4, v6

    .line 265
    goto/16 :goto_9

    :cond_f
    move v4, v6

    .line 267
    goto/16 :goto_a

    .line 246
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private declineTransfer()V
    .locals 2

    .prologue
    .line 186
    new-instance v0, Lcom/vkontakte/android/api/money/MoneyDeclineTransfer;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->mData:Lcom/vkontakte/android/MoneyTransfer;

    iget v1, v1, Lcom/vkontakte/android/MoneyTransfer;->id:I

    invoke-direct {v0, v1}, Lcom/vkontakte/android/api/money/MoneyDeclineTransfer;-><init>(I)V

    new-instance v1, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment$3;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment$3;-><init>(Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;)V

    .line 187
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/money/MoneyDeclineTransfer;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 202
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 203
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 204
    return-void
.end method

.method public static show(IIILandroid/content/Context;)V
    .locals 2
    .param p0, "transferId"    # I
    .param p1, "fromId"    # I
    .param p2, "toId"    # I
    .param p3, "context"    # Landroid/content/Context;

    .prologue
    .line 45
    new-instance v0, Lcom/vkontakte/android/api/money/MoneyGetTransfer;

    invoke-direct {v0, p0, p1, p2}, Lcom/vkontakte/android/api/money/MoneyGetTransfer;-><init>(III)V

    new-instance v1, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment$1;

    invoke-direct {v1, p3, p3}, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment$1;-><init>(Landroid/content/Context;Landroid/content/Context;)V

    .line 46
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/money/MoneyGetTransfer;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 52
    invoke-virtual {v0, p3}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 53
    invoke-virtual {v0, p3}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 54
    return-void
.end method

.method public static show(Lcom/vkontakte/android/MoneyTransfer;Landroid/content/Context;)V
    .locals 5
    .param p0, "mt"    # Lcom/vkontakte/android/MoneyTransfer;
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 58
    invoke-virtual {p0}, Lcom/vkontakte/android/MoneyTransfer;->getPeerUser()Lcom/vkontakte/android/UserProfile;

    move-result-object v1

    if-nez v1, :cond_0

    .line 59
    iget v1, p0, Lcom/vkontakte/android/MoneyTransfer;->id:I

    iget v2, p0, Lcom/vkontakte/android/MoneyTransfer;->from_id:I

    iget v3, p0, Lcom/vkontakte/android/MoneyTransfer;->to_id:I

    invoke-static {v1, v2, v3, p1}, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->show(IIILandroid/content/Context;)V

    .line 76
    :goto_0
    return-void

    .line 63
    :cond_0
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 64
    .local v0, "args":Landroid/os/Bundle;
    const-string/jumbo v1, "data"

    invoke-virtual {v0, v1, p0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 66
    new-instance v1, Lcom/vkontakte/android/navigation/Navigator;

    const-class v2, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;

    new-instance v3, Lcom/vkontakte/android/TabletDialogActivity$Builder;

    const-class v4, Lcom/vkontakte/android/FragmentDialogActivity;

    invoke-direct {v3, v4}, Lcom/vkontakte/android/TabletDialogActivity$Builder;-><init>(Ljava/lang/Class;)V

    const/high16 v4, 0x43b40000    # 360.0f

    .line 69
    invoke-static {v4}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v4

    invoke-virtual {v3, v4}, Lcom/vkontakte/android/TabletDialogActivity$Builder;->setMaxWidth(I)Lcom/vkontakte/android/TabletDialogActivity$Builder;

    move-result-object v3

    const/high16 v4, 0x42000000    # 32.0f

    .line 70
    invoke-static {v4}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v4

    invoke-virtual {v3, v4}, Lcom/vkontakte/android/TabletDialogActivity$Builder;->setMinSpacing(I)Lcom/vkontakte/android/TabletDialogActivity$Builder;

    move-result-object v3

    const/16 v4, 0x11

    .line 71
    invoke-virtual {v3, v4}, Lcom/vkontakte/android/TabletDialogActivity$Builder;->setGravity(I)Lcom/vkontakte/android/TabletDialogActivity$Builder;

    move-result-object v3

    const v4, 0x7f0b0192

    .line 72
    invoke-virtual {v3, v4}, Lcom/vkontakte/android/TabletDialogActivity$Builder;->windowAnimationResource(I)Lcom/vkontakte/android/TabletDialogActivity$Builder;

    move-result-object v3

    const v4, 0x106000b

    .line 73
    invoke-virtual {v3, v4}, Lcom/vkontakte/android/TabletDialogActivity$Builder;->windowBackgroundResource(I)Lcom/vkontakte/android/TabletDialogActivity$Builder;

    move-result-object v3

    invoke-direct {v1, v2, v3, v0}, Lcom/vkontakte/android/navigation/Navigator;-><init>(Ljava/lang/Class;Lcom/vkontakte/android/navigation/Navigator$ActivityNavigator;Landroid/os/Bundle;)V

    .line 74
    invoke-virtual {v1, p1}, Lcom/vkontakte/android/navigation/Navigator;->go(Landroid/content/Context;)Z

    goto :goto_0
.end method


# virtual methods
.method synthetic lambda$onViewCreated$0(Landroid/view/View;)V
    .locals 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 151
    iget-object v0, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->mData:Lcom/vkontakte/android/MoneyTransfer;

    iget-object v0, v0, Lcom/vkontakte/android/MoneyTransfer;->acceptUrl:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->mData:Lcom/vkontakte/android/MoneyTransfer;

    iget-object v0, v0, Lcom/vkontakte/android/MoneyTransfer;->acceptUrl:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 152
    iget-object v0, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->mData:Lcom/vkontakte/android/MoneyTransfer;

    iget-object v0, v0, Lcom/vkontakte/android/MoneyTransfer;->acceptUrl:Ljava/lang/String;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->mData:Lcom/vkontakte/android/MoneyTransfer;

    iget v1, v1, Lcom/vkontakte/android/MoneyTransfer;->id:I

    const/4 v2, 0x2

    invoke-static {p0, v0, v1, v2}, Lcom/vkontakte/android/fragments/money/MoneyWebViewFragment;->start(Landroid/app/Fragment;Ljava/lang/String;II)V

    .line 167
    :goto_0
    return-void

    .line 155
    :cond_0
    new-instance v0, Lcom/vkontakte/android/api/money/MoneyGetTransfer;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->mData:Lcom/vkontakte/android/MoneyTransfer;

    iget v1, v1, Lcom/vkontakte/android/MoneyTransfer;->id:I

    iget-object v2, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->mData:Lcom/vkontakte/android/MoneyTransfer;

    iget v2, v2, Lcom/vkontakte/android/MoneyTransfer;->from_id:I

    iget-object v3, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->mData:Lcom/vkontakte/android/MoneyTransfer;

    iget v3, v3, Lcom/vkontakte/android/MoneyTransfer;->to_id:I

    invoke-direct {v0, v1, v2, v3}, Lcom/vkontakte/android/api/money/MoneyGetTransfer;-><init>(III)V

    new-instance v1, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment$2;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment$2;-><init>(Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;)V

    .line 156
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/money/MoneyGetTransfer;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 164
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 165
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    goto :goto_0
.end method

.method synthetic lambda$onViewCreated$1(Landroid/view/View;)V
    .locals 5
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 171
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->mData:Lcom/vkontakte/android/MoneyTransfer;

    iget v1, v1, Lcom/vkontakte/android/MoneyTransfer;->to_id:I

    iget-object v2, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->mData:Lcom/vkontakte/android/MoneyTransfer;

    iget-object v2, v2, Lcom/vkontakte/android/MoneyTransfer;->toUser:Lcom/vkontakte/android/UserProfile;

    iget-object v3, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->mData:Lcom/vkontakte/android/MoneyTransfer;

    invoke-virtual {v3}, Lcom/vkontakte/android/MoneyTransfer;->getAmountFormatted()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->mData:Lcom/vkontakte/android/MoneyTransfer;

    iget-object v4, v4, Lcom/vkontakte/android/MoneyTransfer;->comment:Ljava/lang/String;

    invoke-static {v0, v1, v2, v3, v4}, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->start(Landroid/app/Activity;ILcom/vkontakte/android/UserProfile;Ljava/lang/String;Ljava/lang/String;)V

    .line 172
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    .line 173
    return-void
.end method

.method synthetic lambda$onViewCreated$2(Landroid/view/View;)V
    .locals 0
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 175
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->declineTransfer()V

    return-void
.end method

.method synthetic lambda$onViewCreated$3(Landroid/view/View;)V
    .locals 0
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 177
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->declineTransfer()V

    return-void
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 0
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 208
    invoke-super {p0, p1}, Lme/grishka/appkit/fragments/AppKitFragment;->onActivityCreated(Landroid/os/Bundle;)V

    .line 209
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->bindData()V

    .line 210
    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 1
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 120
    const/4 v0, -0x1

    if-eq p2, v0, :cond_1

    .line 127
    :cond_0
    :goto_0
    return-void

    .line 124
    :cond_1
    const/4 v0, 0x2

    if-ne p1, v0, :cond_0

    .line 125
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    goto :goto_0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 274
    invoke-super {p0, p1}, Lme/grishka/appkit/fragments/AppKitFragment;->onCreate(Landroid/os/Bundle;)V

    .line 275
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "data"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/MoneyTransfer;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->mData:Lcom/vkontakte/android/MoneyTransfer;

    .line 276
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 2
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 281
    const v0, 0x7f03011e

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public onDestroyView()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 100
    invoke-super {p0}, Lme/grishka/appkit/fragments/AppKitFragment;->onDestroyView()V

    .line 101
    iput-object v0, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->textViewTo:Landroid/widget/TextView;

    .line 102
    iput-object v0, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->textViewDate:Landroid/widget/TextView;

    .line 103
    iput-object v0, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->imagePeer:Lcom/vk/imageloader/view/VKImageView;

    .line 104
    iput-object v0, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->textViewSign:Landroid/widget/TextView;

    .line 105
    iput-object v0, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->textViewSum:Landroid/widget/TextView;

    .line 106
    iput-object v0, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->textViewCurrencySymbol:Landroid/widget/TextView;

    .line 107
    iput-object v0, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->textViewPositive:Landroid/widget/TextView;

    .line 108
    iput-object v0, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->textViewNegative:Landroid/widget/TextView;

    .line 109
    iput-object v0, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->viewGroupPositiveNegative:Landroid/view/ViewGroup;

    .line 110
    iput-object v0, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->viewGroupCommentStatus:Landroid/view/ViewGroup;

    .line 111
    iput-object v0, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->textViewComment:Landroid/widget/TextView;

    .line 112
    iput-object v0, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->textViewStatus:Landroid/widget/TextView;

    .line 113
    iput-object v0, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->textViewRepeat:Landroid/widget/TextView;

    .line 114
    iput-object v0, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->textViewCancel:Landroid/widget/TextView;

    .line 115
    iput-object v0, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->viewDivider:Landroid/view/View;

    .line 116
    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 131
    invoke-super {p0, p1, p2}, Lme/grishka/appkit/fragments/AppKitFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 133
    const v0, 0x7f1003a7

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->textViewTo:Landroid/widget/TextView;

    .line 134
    const v0, 0x7f1003a8

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->textViewDate:Landroid/widget/TextView;

    .line 135
    const v0, 0x7f1001e8

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/imageloader/view/VKImageView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->imagePeer:Lcom/vk/imageloader/view/VKImageView;

    .line 136
    const v0, 0x7f1003aa

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->textViewSign:Landroid/widget/TextView;

    .line 137
    const v0, 0x7f1003ab

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->textViewSum:Landroid/widget/TextView;

    .line 138
    const v0, 0x7f1003ac

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->textViewCurrencySymbol:Landroid/widget/TextView;

    .line 139
    const v0, 0x7f1002b3

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->textViewPositive:Landroid/widget/TextView;

    .line 140
    const v0, 0x7f1002b4

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->textViewNegative:Landroid/widget/TextView;

    .line 141
    const v0, 0x7f1003b2

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->viewGroupPositiveNegative:Landroid/view/ViewGroup;

    .line 142
    const v0, 0x7f1003ad

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->viewGroupCommentStatus:Landroid/view/ViewGroup;

    .line 143
    const v0, 0x7f1003ae

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->textViewComment:Landroid/widget/TextView;

    .line 145
    const v0, 0x7f1003af

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->textViewStatus:Landroid/widget/TextView;

    .line 146
    const v0, 0x7f1003b0

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->textViewRepeat:Landroid/widget/TextView;

    .line 147
    const v0, 0x7f1003b1

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->textViewCancel:Landroid/widget/TextView;

    .line 148
    const v0, 0x7f1001cb

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->viewDivider:Landroid/view/View;

    .line 150
    iget-object v0, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->textViewPositive:Landroid/widget/TextView;

    invoke-static {p0}, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;)Landroid/view/View$OnClickListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 170
    iget-object v0, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->textViewRepeat:Landroid/widget/TextView;

    invoke-static {p0}, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment$$Lambda$2;->lambdaFactory$(Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;)Landroid/view/View$OnClickListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 175
    iget-object v0, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->textViewNegative:Landroid/widget/TextView;

    invoke-static {p0}, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment$$Lambda$3;->lambdaFactory$(Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;)Landroid/view/View$OnClickListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 177
    iget-object v0, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->textViewCancel:Landroid/widget/TextView;

    invoke-static {p0}, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment$$Lambda$4;->lambdaFactory$(Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;)Landroid/view/View$OnClickListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 180
    iget-object v0, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->mData:Lcom/vkontakte/android/MoneyTransfer;

    invoke-virtual {v0}, Lcom/vkontakte/android/MoneyTransfer;->getPeerUser()Lcom/vkontakte/android/UserProfile;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 181
    iget-object v0, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->imagePeer:Lcom/vk/imageloader/view/VKImageView;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->mData:Lcom/vkontakte/android/MoneyTransfer;

    invoke-virtual {v1}, Lcom/vkontakte/android/MoneyTransfer;->getPeerUser()Lcom/vkontakte/android/UserProfile;

    move-result-object v1

    iget-object v1, v1, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    .line 183
    :cond_0
    return-void
.end method
