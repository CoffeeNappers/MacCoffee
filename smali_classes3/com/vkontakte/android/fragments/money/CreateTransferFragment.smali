.class public Lcom/vkontakte/android/fragments/money/CreateTransferFragment;
.super Lme/grishka/appkit/fragments/LoaderFragment;
.source "CreateTransferFragment.java"


# static fields
.field private static final ExtraAmount:Ljava/lang/String; = "amount"

.field private static final ExtraComment:Ljava/lang/String; = "comment"

.field private static final ExtraUser:Ljava/lang/String; = "to"

.field private static final ExtraUserId:Ljava/lang/String; = "to_id"


# instance fields
.field private amountAuto:I

.field private mEditTextAmount:Landroid/widget/EditText;

.field private mEditTextComment:Landroid/widget/EditText;

.field private mImageViewTo:Lcom/vk/imageloader/view/VKImageView;

.field private mProceeding:Z

.field private mScrollView:Landroid/widget/ScrollView;

.field private mTextViewHint:Landroid/widget/TextView;

.field private mTextViewRestriction:Landroid/widget/TextView;

.field private mTextViewTo:Landroid/widget/TextView;

.field private mTo:Lcom/vkontakte/android/UserProfile;

.field private mToUid:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 51
    invoke-direct {p0}, Lme/grishka/appkit/fragments/LoaderFragment;-><init>()V

    .line 90
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->mProceeding:Z

    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/fragments/money/CreateTransferFragment;Lcom/vkontakte/android/UserProfile;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/money/CreateTransferFragment;
    .param p1, "x1"    # Lcom/vkontakte/android/UserProfile;

    .prologue
    .line 51
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->handleUserOrGroupToLoaded(Lcom/vkontakte/android/UserProfile;)V

    return-void
.end method

.method static synthetic access$100(Lcom/vkontakte/android/fragments/money/CreateTransferFragment;)I
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/money/CreateTransferFragment;

    .prologue
    .line 51
    iget v0, p0, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->mToUid:I

    return v0
.end method

.method static synthetic access$202(Lcom/vkontakte/android/fragments/money/CreateTransferFragment;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/money/CreateTransferFragment;
    .param p1, "x1"    # Z

    .prologue
    .line 51
    iput-boolean p1, p0, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->mProceeding:Z

    return p1
.end method

.method static synthetic access$300(Lcom/vkontakte/android/fragments/money/CreateTransferFragment;)Landroid/widget/EditText;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/money/CreateTransferFragment;

    .prologue
    .line 51
    iget-object v0, p0, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->mEditTextAmount:Landroid/widget/EditText;

    return-object v0
.end method

.method static synthetic access$400(Lcom/vkontakte/android/fragments/money/CreateTransferFragment;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/money/CreateTransferFragment;

    .prologue
    .line 51
    iget-object v0, p0, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->mTextViewHint:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$500(Lcom/vkontakte/android/fragments/money/CreateTransferFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/money/CreateTransferFragment;

    .prologue
    .line 51
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->updateRestrictionsText()V

    return-void
.end method

.method static synthetic access$600(Lcom/vkontakte/android/fragments/money/CreateTransferFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/money/CreateTransferFragment;

    .prologue
    .line 51
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->proceedToPayment()V

    return-void
.end method

.method static synthetic access$700(Lcom/vkontakte/android/fragments/money/CreateTransferFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/money/CreateTransferFragment;

    .prologue
    .line 51
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->delayScrollToBottom()V

    return-void
.end method

.method static synthetic access$800(Lcom/vkontakte/android/fragments/money/CreateTransferFragment;)I
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/money/CreateTransferFragment;

    .prologue
    .line 51
    iget v0, p0, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->amountAuto:I

    return v0
.end method

.method static synthetic access$900(Lcom/vkontakte/android/fragments/money/CreateTransferFragment;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/money/CreateTransferFragment;

    .prologue
    .line 51
    iget-object v0, p0, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->mTextViewRestriction:Landroid/widget/TextView;

    return-object v0
.end method

.method private delayScrollToBottom()V
    .locals 4

    .prologue
    .line 161
    iget-object v0, p0, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->mScrollView:Landroid/widget/ScrollView;

    invoke-static {p0}, Lcom/vkontakte/android/fragments/money/CreateTransferFragment$$Lambda$3;->lambdaFactory$(Lcom/vkontakte/android/fragments/money/CreateTransferFragment;)Ljava/lang/Runnable;

    move-result-object v1

    const-wide/16 v2, 0x12c

    invoke-virtual {v0, v1, v2, v3}, Landroid/widget/ScrollView;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 162
    return-void
.end method

.method private ensureFocusAmountField()V
    .locals 2

    .prologue
    .line 145
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    if-nez v1, :cond_1

    .line 158
    :cond_0
    :goto_0
    return-void

    .line 149
    :cond_1
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-static {v1}, Lcom/vkontakte/android/ViewUtils;->getScreenOrientation(Landroid/app/Activity;)I

    move-result v0

    .line 151
    .local v0, "orientation":I
    iget-boolean v1, p0, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->loaded:Z

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->mEditTextAmount:Landroid/widget/EditText;

    if-eqz v1, :cond_0

    iget-boolean v1, p0, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->isTablet:Z

    if-nez v1, :cond_2

    const/4 v1, 0x1

    if-eq v0, v1, :cond_2

    const/16 v1, 0x9

    if-ne v0, v1, :cond_0

    .line 155
    :cond_2
    iget-object v1, p0, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->mEditTextAmount:Landroid/widget/EditText;

    invoke-static {v1}, Lcom/vk/core/util/KeyboardUtils;->showKeyboard(Landroid/view/View;)V

    goto :goto_0
.end method

.method private handleUserOrGroupToLoaded(Lcom/vkontakte/android/UserProfile;)V
    .locals 2
    .param p1, "up"    # Lcom/vkontakte/android/UserProfile;

    .prologue
    .line 126
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 128
    .local v0, "activity":Landroid/app/Activity;
    if-eqz v0, :cond_0

    .line 129
    invoke-static {p0, p1}, Lcom/vkontakte/android/fragments/money/CreateTransferFragment$$Lambda$2;->lambdaFactory$(Lcom/vkontakte/android/fragments/money/CreateTransferFragment;Lcom/vkontakte/android/UserProfile;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 138
    :cond_0
    return-void
.end method

.method private proceedToPayment()V
    .locals 8

    .prologue
    .line 183
    iget-boolean v5, p0, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->mProceeding:Z

    if-eqz v5, :cond_0

    .line 238
    :goto_0
    return-void

    .line 185
    :cond_0
    iget-object v5, p0, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->mTextViewRestriction:Landroid/widget/TextView;

    invoke-virtual {v5}, Landroid/widget/TextView;->getVisibility()I

    move-result v5

    if-nez v5, :cond_1

    iget-object v5, p0, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->mTextViewRestriction:Landroid/widget/TextView;

    invoke-virtual {v5}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v5

    invoke-interface {v5}, Ljava/lang/CharSequence;->length()I

    move-result v5

    if-lez v5, :cond_1

    .line 186
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->getContext()Landroid/content/Context;

    move-result-object v5

    iget-object v6, p0, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->mTextViewRestriction:Landroid/widget/TextView;

    invoke-virtual {v6}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v6

    const/4 v7, 0x0

    invoke-static {v5, v6, v7}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v5

    invoke-virtual {v5}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 189
    :cond_1
    const/4 v5, 0x1

    iput-boolean v5, p0, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->mProceeding:Z

    .line 191
    iget-object v5, p0, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->mEditTextComment:Landroid/widget/EditText;

    invoke-virtual {v5}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    .line 193
    .local v3, "message":Ljava/lang/String;
    const/4 v0, 0x0

    .line 195
    .local v0, "amount":I
    iget-object v5, p0, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->mEditTextAmount:Landroid/widget/EditText;

    invoke-virtual {v5}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    .line 198
    .local v1, "amountStr":Ljava/lang/String;
    :goto_1
    const-string/jumbo v5, " "

    invoke-virtual {v1, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 199
    const-string/jumbo v5, " "

    const-string/jumbo v6, ""

    invoke-virtual {v1, v5, v6}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    goto :goto_1

    .line 203
    :cond_2
    :try_start_0
    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    .line 209
    :goto_2
    new-instance v5, Lcom/vkontakte/android/api/money/MoneySendTransfer;

    iget v6, p0, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->mToUid:I

    invoke-direct {v5, v6, v0, v3}, Lcom/vkontakte/android/api/money/MoneySendTransfer;-><init>(IILjava/lang/String;)V

    new-instance v6, Lcom/vkontakte/android/fragments/money/CreateTransferFragment$2;

    invoke-direct {v6, p0}, Lcom/vkontakte/android/fragments/money/CreateTransferFragment$2;-><init>(Lcom/vkontakte/android/fragments/money/CreateTransferFragment;)V

    .line 210
    invoke-virtual {v5, v6}, Lcom/vkontakte/android/api/money/MoneySendTransfer;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v5

    .line 237
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v5

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v4

    .line 238
    .local v4, "sendTransferRequest":Lcom/vkontakte/android/api/VKAPIRequest;, "Lcom/vkontakte/android/api/VKAPIRequest<Ljava/lang/String;>;"
    goto :goto_0

    .line 205
    .end local v4    # "sendTransferRequest":Lcom/vkontakte/android/api/VKAPIRequest;, "Lcom/vkontakte/android/api/VKAPIRequest<Ljava/lang/String;>;"
    :catch_0
    move-exception v2

    .line 206
    .local v2, "exc":Ljava/lang/Exception;
    const-string/jumbo v5, "CreateTransferFragment"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "Failed to parse amount string "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->mEditTextAmount:Landroid/widget/EditText;

    invoke-virtual {v7}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/vkontakte/android/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2
.end method

.method public static start(Landroid/app/Activity;ILcom/vkontakte/android/UserProfile;Ljava/lang/String;Ljava/lang/String;)V
    .locals 5
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "toId"    # I
    .param p2, "to"    # Lcom/vkontakte/android/UserProfile;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p3, "amount"    # Ljava/lang/String;
    .param p4, "comment"    # Ljava/lang/String;

    .prologue
    .line 62
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 63
    .local v0, "args":Landroid/os/Bundle;
    const-string/jumbo v1, "to_id"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 64
    const-string/jumbo v1, "amount"

    invoke-virtual {v0, v1, p3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 65
    const-string/jumbo v1, "comment"

    invoke-virtual {v0, v1, p4}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 66
    if-eqz p2, :cond_0

    .line 67
    const-string/jumbo v1, "to"

    invoke-virtual {v0, v1, p2}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 70
    :cond_0
    new-instance v1, Lcom/vkontakte/android/navigation/Navigator;

    const-class v2, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;

    new-instance v3, Lcom/vkontakte/android/TabletDialogActivity$Builder;

    invoke-direct {v3}, Lcom/vkontakte/android/TabletDialogActivity$Builder;-><init>()V

    const v4, 0x7f0f0084

    .line 72
    invoke-virtual {v3, v4}, Lcom/vkontakte/android/TabletDialogActivity$Builder;->windowBackgroundResource(I)Lcom/vkontakte/android/TabletDialogActivity$Builder;

    move-result-object v3

    const/high16 v4, 0x44340000    # 720.0f

    .line 73
    invoke-static {v4}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v4

    invoke-virtual {v3, v4}, Lcom/vkontakte/android/TabletDialogActivity$Builder;->setMaxWidth(I)Lcom/vkontakte/android/TabletDialogActivity$Builder;

    move-result-object v3

    const/high16 v4, 0x43e10000    # 450.0f

    .line 74
    invoke-static {v4}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v4

    invoke-virtual {v3, v4}, Lcom/vkontakte/android/TabletDialogActivity$Builder;->setPreferredHeight(I)Lcom/vkontakte/android/TabletDialogActivity$Builder;

    move-result-object v3

    invoke-direct {v1, v2, v3, v0}, Lcom/vkontakte/android/navigation/Navigator;-><init>(Ljava/lang/Class;Lcom/vkontakte/android/navigation/Navigator$ActivityNavigator;Landroid/os/Bundle;)V

    .line 76
    invoke-virtual {v1, p0}, Lcom/vkontakte/android/navigation/Navigator;->go(Landroid/content/Context;)Z

    .line 78
    return-void
.end method

.method private updateRestrictionsText()V
    .locals 13

    .prologue
    const/4 v9, 0x1

    const/4 v12, 0x0

    .line 373
    const/4 v1, 0x0

    .line 375
    .local v1, "amount":I
    :try_start_0
    iget-object v6, p0, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->mEditTextAmount:Landroid/widget/EditText;

    invoke-virtual {v6}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_0

    .line 376
    iget-object v6, p0, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->mEditTextAmount:Landroid/widget/EditText;

    invoke-virtual {v6}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 377
    .local v0, "amStr":Ljava/lang/String;
    const-string/jumbo v6, " "

    const-string/jumbo v7, ""

    invoke-virtual {v0, v6, v7}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    .line 378
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 383
    .end local v0    # "amStr":Ljava/lang/String;
    :cond_0
    :goto_0
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v6

    iget v5, v6, Lcom/vkontakte/android/auth/VKAccount;->moneyTransfersMinAmount:I

    .line 384
    .local v5, "minAmount":I
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v6

    iget v4, v6, Lcom/vkontakte/android/auth/VKAccount;->moneyTransfersMaxAmount:I

    .line 385
    .local v4, "maxAmount":I
    invoke-static {}, Lcom/vkontakte/android/MoneyTransfer;->getYourCurrencySymbol()Ljava/lang/String;

    move-result-object v2

    .line 387
    .local v2, "currency":Ljava/lang/String;
    if-eqz v5, :cond_1

    if-ge v1, v5, :cond_1

    .line 388
    iget-object v6, p0, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->mTextViewRestriction:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    const v8, 0x7f08036a

    new-array v9, v9, [Ljava/lang/Object;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string/jumbo v11, " "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    aput-object v10, v9, v12

    invoke-virtual {v7, v8, v9}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 389
    iget-object v6, p0, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->mTextViewRestriction:Landroid/widget/TextView;

    const v7, -0x55514d

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setTextColor(I)V

    .line 390
    iget-object v6, p0, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->mTextViewRestriction:Landroid/widget/TextView;

    invoke-static {v6, v12}, Lme/grishka/appkit/utils/V;->setVisibilityAnimated(Landroid/view/View;I)V

    .line 391
    iput v5, p0, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->amountAuto:I

    .line 401
    :goto_1
    return-void

    .line 380
    .end local v2    # "currency":Ljava/lang/String;
    .end local v4    # "maxAmount":I
    .end local v5    # "minAmount":I
    :catch_0
    move-exception v3

    .line 381
    .local v3, "exc":Ljava/lang/Exception;
    const-string/jumbo v6, "CreateTransferFragment"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "Failed to parse amount string "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->mEditTextAmount:Landroid/widget/EditText;

    invoke-virtual {v8}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/vkontakte/android/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 392
    .end local v3    # "exc":Ljava/lang/Exception;
    .restart local v2    # "currency":Ljava/lang/String;
    .restart local v4    # "maxAmount":I
    .restart local v5    # "minAmount":I
    :cond_1
    if-eqz v4, :cond_2

    if-le v1, v4, :cond_2

    .line 393
    iget-object v6, p0, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->mTextViewRestriction:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    const v8, 0x7f080369

    new-array v9, v9, [Ljava/lang/Object;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string/jumbo v11, " "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    aput-object v10, v9, v12

    invoke-virtual {v7, v8, v9}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 394
    iget-object v6, p0, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->mTextViewRestriction:Landroid/widget/TextView;

    const v7, -0x19b9ba

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setTextColor(I)V

    .line 395
    iget-object v6, p0, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->mTextViewRestriction:Landroid/widget/TextView;

    invoke-static {v6, v12}, Lme/grishka/appkit/utils/V;->setVisibilityAnimated(Landroid/view/View;I)V

    .line 396
    iput v4, p0, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->amountAuto:I

    goto :goto_1

    .line 398
    :cond_2
    iget-object v6, p0, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->mTextViewRestriction:Landroid/widget/TextView;

    const/4 v7, 0x4

    invoke-static {v6, v7}, Lme/grishka/appkit/utils/V;->setVisibilityAnimated(Landroid/view/View;I)V

    .line 399
    iput v12, p0, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->amountAuto:I

    goto :goto_1
.end method

.method private updateToViews()V
    .locals 2

    .prologue
    .line 404
    iget-object v0, p0, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->mTo:Lcom/vkontakte/android/UserProfile;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->mTextViewTo:Landroid/widget/TextView;

    if-eqz v0, :cond_0

    .line 405
    iget-object v1, p0, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->mTextViewTo:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->mTo:Lcom/vkontakte/android/UserProfile;

    iget v0, v0, Lcom/vkontakte/android/UserProfile;->uid:I

    if-lez v0, :cond_1

    iget-object v0, p0, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->mTo:Lcom/vkontakte/android/UserProfile;

    iget-object v0, v0, Lcom/vkontakte/android/UserProfile;->firstName:Ljava/lang/String;

    :goto_0
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 406
    iget-object v0, p0, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->mImageViewTo:Lcom/vk/imageloader/view/VKImageView;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->mTo:Lcom/vkontakte/android/UserProfile;

    iget-object v1, v1, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    .line 408
    :cond_0
    return-void

    .line 405
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->mTo:Lcom/vkontakte/android/UserProfile;

    iget-object v0, v0, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    goto :goto_0
.end method


# virtual methods
.method protected doLoadData()V
    .locals 3

    .prologue
    .line 96
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 97
    .local v0, "uids":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    iget v1, p0, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->mToUid:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 98
    iget v1, p0, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->mToUid:I

    if-lez v1, :cond_0

    .line 99
    invoke-static {p0}, Lcom/vkontakte/android/fragments/money/CreateTransferFragment$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/fragments/money/CreateTransferFragment;)Lcom/vkontakte/android/data/Friends$GetUsersCallback;

    move-result-object v1

    const/4 v2, 0x2

    invoke-static {v0, v1, v2}, Lcom/vkontakte/android/data/Friends;->getUsers(Ljava/util/Collection;Lcom/vkontakte/android/data/Friends$GetUsersCallback;I)V

    .line 123
    :goto_0
    return-void

    .line 107
    :cond_0
    new-instance v1, Lcom/vkontakte/android/api/groups/GroupsGetById;

    iget v2, p0, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->mToUid:I

    neg-int v2, v2

    invoke-direct {v1, v2}, Lcom/vkontakte/android/api/groups/GroupsGetById;-><init>(I)V

    new-instance v2, Lcom/vkontakte/android/fragments/money/CreateTransferFragment$1;

    invoke-direct {v2, p0}, Lcom/vkontakte/android/fragments/money/CreateTransferFragment$1;-><init>(Lcom/vkontakte/android/fragments/money/CreateTransferFragment;)V

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/api/groups/GroupsGetById;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    .line 121
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    goto :goto_0
.end method

.method synthetic lambda$delayScrollToBottom$2()V
    .locals 2

    .prologue
    .line 161
    iget-object v0, p0, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->mScrollView:Landroid/widget/ScrollView;

    const/16 v1, 0x82

    invoke-virtual {v0, v1}, Landroid/widget/ScrollView;->fullScroll(I)Z

    return-void
.end method

.method synthetic lambda$doLoadData$0(Ljava/util/ArrayList;)V
    .locals 1
    .param p1, "users"    # Ljava/util/ArrayList;

    .prologue
    .line 100
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_0

    .line 101
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/UserProfile;

    invoke-direct {p0, v0}, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->handleUserOrGroupToLoaded(Lcom/vkontakte/android/UserProfile;)V

    .line 104
    :cond_0
    return-void
.end method

.method synthetic lambda$handleUserOrGroupToLoaded$1(Lcom/vkontakte/android/UserProfile;)V
    .locals 0
    .param p1, "up"    # Lcom/vkontakte/android/UserProfile;

    .prologue
    .line 130
    iput-object p1, p0, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->mTo:Lcom/vkontakte/android/UserProfile;

    .line 131
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->updateToViews()V

    .line 133
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->dataLoaded()V

    .line 135
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->ensureFocusAmountField()V

    .line 136
    return-void
.end method

.method synthetic lambda$onCreateContentView$3(Landroid/view/View;)V
    .locals 0
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 286
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->proceedToPayment()V

    return-void
.end method

.method synthetic lambda$onCreateContentView$4(Landroid/view/View;Landroid/view/View;)V
    .locals 3
    .param p1, "view"    # Landroid/view/View;
    .param p2, "v"    # Landroid/view/View;

    .prologue
    .line 293
    iget-object v1, p0, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->mEditTextAmount:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->requestFocus()Z

    .line 294
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    const-string/jumbo v2, "input_method"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 295
    .local v0, "imm":Landroid/view/inputmethod/InputMethodManager;
    iget-object v1, p0, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->mEditTextAmount:Landroid/widget/EditText;

    const/4 v2, 0x2

    invoke-virtual {v0, v1, v2}, Landroid/view/inputmethod/InputMethodManager;->showSoftInput(Landroid/view/View;I)Z

    .line 296
    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 1
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 242
    const/4 v0, -0x1

    if-eq p2, v0, :cond_1

    .line 248
    :cond_0
    :goto_0
    return-void

    .line 245
    :cond_1
    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    .line 246
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    goto :goto_0
.end method

.method public onAttach(Landroid/app/Activity;)V
    .locals 2
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 252
    invoke-super {p0, p1}, Lme/grishka/appkit/fragments/LoaderFragment;->onAttach(Landroid/app/Activity;)V

    .line 253
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "to_id"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->mToUid:I

    .line 254
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "to"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/UserProfile;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->mTo:Lcom/vkontakte/android/UserProfile;

    .line 255
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->loadData()V

    .line 260
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 264
    invoke-super {p0, p1}, Lme/grishka/appkit/fragments/LoaderFragment;->onCreate(Landroid/os/Bundle;)V

    .line 265
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->setHasOptionsMenu(Z)V

    .line 266
    return-void
.end method

.method public onCreateContentView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 9
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 282
    const v6, 0x7f030121

    const/4 v7, 0x0

    invoke-virtual {p1, v6, v7}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v5

    .line 283
    .local v5, "view":Landroid/view/View;
    const v6, 0x7f1003b5

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/ScrollView;

    iput-object v6, p0, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->mScrollView:Landroid/widget/ScrollView;

    .line 284
    const v6, 0x7f1003b8

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    iput-object v6, p0, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->mTextViewHint:Landroid/widget/TextView;

    .line 285
    const v6, 0x7f1002b3

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 286
    .local v3, "mTextViewSend":Landroid/widget/TextView;
    invoke-static {p0}, Lcom/vkontakte/android/fragments/money/CreateTransferFragment$$Lambda$4;->lambdaFactory$(Lcom/vkontakte/android/fragments/money/CreateTransferFragment;)Landroid/view/View$OnClickListener;

    move-result-object v6

    invoke-virtual {v3, v6}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 287
    const v6, 0x7f1003bb

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    iput-object v6, p0, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->mTextViewRestriction:Landroid/widget/TextView;

    .line 288
    const v6, 0x7f1003a7

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    iput-object v6, p0, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->mTextViewTo:Landroid/widget/TextView;

    .line 289
    const v6, 0x7f1003b7

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Lcom/vk/imageloader/view/VKImageView;

    iput-object v6, p0, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->mImageViewTo:Lcom/vk/imageloader/view/VKImageView;

    .line 291
    const v6, 0x7f1003a9

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    .line 292
    .local v4, "sumContainer":Landroid/view/View;
    invoke-static {p0, v5}, Lcom/vkontakte/android/fragments/money/CreateTransferFragment$$Lambda$5;->lambdaFactory$(Lcom/vkontakte/android/fragments/money/CreateTransferFragment;Landroid/view/View;)Landroid/view/View$OnClickListener;

    move-result-object v6

    invoke-virtual {v4, v6}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 298
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->updateToViews()V

    .line 300
    const v6, 0x7f1003b9

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/EditText;

    iput-object v6, p0, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->mEditTextAmount:Landroid/widget/EditText;

    .line 301
    iget-object v6, p0, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->mEditTextAmount:Landroid/widget/EditText;

    new-instance v7, Lcom/vkontakte/android/fragments/money/CreateTransferFragment$3;

    invoke-direct {v7, p0}, Lcom/vkontakte/android/fragments/money/CreateTransferFragment$3;-><init>(Lcom/vkontakte/android/fragments/money/CreateTransferFragment;)V

    invoke-virtual {v6, v7}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 320
    iget-object v6, p0, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->mEditTextAmount:Landroid/widget/EditText;

    new-instance v7, Lcom/vkontakte/android/ui/NumberTextWatcher;

    iget-object v8, p0, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->mEditTextAmount:Landroid/widget/EditText;

    invoke-direct {v7, v8}, Lcom/vkontakte/android/ui/NumberTextWatcher;-><init>(Landroid/widget/EditText;)V

    invoke-virtual {v6, v7}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 321
    const v6, 0x7f1003bc

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/EditText;

    iput-object v6, p0, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->mEditTextComment:Landroid/widget/EditText;

    .line 322
    iget-object v6, p0, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->mEditTextComment:Landroid/widget/EditText;

    new-instance v7, Lcom/vkontakte/android/fragments/money/CreateTransferFragment$4;

    invoke-direct {v7, p0}, Lcom/vkontakte/android/fragments/money/CreateTransferFragment$4;-><init>(Lcom/vkontakte/android/fragments/money/CreateTransferFragment;)V

    invoke-virtual {v6, v7}, Landroid/widget/EditText;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    .line 332
    iget-object v6, p0, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->mEditTextComment:Landroid/widget/EditText;

    new-instance v7, Lcom/vkontakte/android/fragments/money/CreateTransferFragment$5;

    invoke-direct {v7, p0}, Lcom/vkontakte/android/fragments/money/CreateTransferFragment$5;-><init>(Lcom/vkontakte/android/fragments/money/CreateTransferFragment;)V

    invoke-virtual {v6, v7}, Landroid/widget/EditText;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 341
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v6

    const-string/jumbo v7, "amount"

    invoke-virtual {v6, v7}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 342
    .local v0, "inputAmount":Ljava/lang/String;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_0

    .line 343
    iget-object v6, p0, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->mEditTextAmount:Landroid/widget/EditText;

    invoke-virtual {v6, v0}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 346
    :cond_0
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v6

    const-string/jumbo v7, "comment"

    invoke-virtual {v6, v7}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 347
    .local v1, "inputComment":Ljava/lang/String;
    if-eqz v1, :cond_1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_1

    .line 348
    iget-object v6, p0, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->mEditTextComment:Landroid/widget/EditText;

    invoke-virtual {v6, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 351
    :cond_1
    iget-object v6, p0, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->mEditTextAmount:Landroid/widget/EditText;

    iget-object v7, p0, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->mEditTextAmount:Landroid/widget/EditText;

    invoke-virtual {v7}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v7

    invoke-interface {v7}, Landroid/text/Editable;->length()I

    move-result v7

    invoke-virtual {v6, v7}, Landroid/widget/EditText;->setSelection(I)V

    .line 353
    const v6, 0x7f1003ba

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    .line 354
    .local v2, "mCurrencySign":Landroid/widget/TextView;
    invoke-static {}, Lcom/vkontakte/android/MoneyTransfer;->getYourCurrencySymbol()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 356
    iget-object v6, p0, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->mTextViewRestriction:Landroid/widget/TextView;

    new-instance v7, Lcom/vkontakte/android/fragments/money/CreateTransferFragment$6;

    invoke-direct {v7, p0}, Lcom/vkontakte/android/fragments/money/CreateTransferFragment$6;-><init>(Lcom/vkontakte/android/fragments/money/CreateTransferFragment;)V

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 366
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->updateRestrictionsText()V

    .line 367
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->ensureFocusAmountField()V

    .line 369
    return-object v5
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V
    .locals 2
    .param p1, "menu"    # Landroid/view/Menu;
    .param p2, "inflater"    # Landroid/view/MenuInflater;

    .prologue
    .line 167
    const v1, 0x7f080303

    invoke-interface {p1, v1}, Landroid/view/Menu;->add(I)Landroid/view/MenuItem;

    move-result-object v0

    .line 168
    .local v0, "nextItem":Landroid/view/MenuItem;
    const v1, 0x7f0201c6

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    .line 169
    const/4 v1, 0x2

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setShowAsAction(I)V

    .line 170
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 2
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 177
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {}, Lcom/vkontakte/android/MoneyTransfer;->getTermsUrl()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/money/MoneyWebViewFragment;->showTerms(Landroid/content/Context;Ljava/lang/String;)V

    .line 179
    const/4 v0, 0x1

    return v0
.end method

.method public onRefresh()V
    .locals 0

    .prologue
    .line 142
    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 270
    invoke-super {p0, p1, p2}, Lme/grishka/appkit/fragments/LoaderFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 272
    const v0, 0x7f080379

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->setTitle(I)V

    .line 274
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->getToolbar()Landroid/support/v7/widget/Toolbar;

    move-result-object v0

    const v1, 0x7f0202c5

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/Toolbar;->setNavigationIcon(I)V

    .line 275
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->getToolbar()Landroid/support/v7/widget/Toolbar;

    move-result-object v1

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    check-cast v0, Landroid/view/View$OnClickListener;

    invoke-virtual {v1, v0}, Landroid/support/v7/widget/Toolbar;->setNavigationOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 278
    return-void
.end method
