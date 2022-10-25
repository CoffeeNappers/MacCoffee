.class public Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;
.super Lcom/vkontakte/android/fragments/VKRecyclerFragment;
.source "MoneyTransfersFragment.java"

# interfaces
.implements Lcom/vk/attachpicker/SupportExternalToolbarContainer;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment$HeaderHolder;,
        Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment$Adapter;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/fragments/VKRecyclerFragment",
        "<",
        "Lcom/vkontakte/android/MoneyTransfer;",
        ">;",
        "Lcom/vk/attachpicker/SupportExternalToolbarContainer;"
    }
.end annotation


# static fields
.field public static final ALLOW_REFRESH_ARGUMENT:Ljava/lang/String; = "allow_refresh"

.field public static final FILTER_ALL:I = 0x0

.field public static final FILTER_ARGUMENT:Ljava/lang/String; = "filter"

.field public static final FILTER_INCOMING:I = 0x2

.field public static final FILTER_OUTGOING:I = 0x1

.field public static final PEER_ARGUMENT:Ljava/lang/String; = "peer_id"

.field public static final PICK_USER_RESULT:I = 0x1

.field public static final SHOW_HEADER_ARGUMENT:Ljava/lang/String; = "show_header"


# instance fields
.field private mAdapter:Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment$Adapter;

.field private mAllowRefresh:Z

.field private mFilter:I

.field private mHeader:Landroid/widget/LinearLayout;

.field private mPeerId:I

.field mReceiver:Landroid/content/BroadcastReceiver;

.field private mShowHeader:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 63
    const/16 v0, 0x14

    invoke-direct {p0, v0}, Lcom/vkontakte/android/fragments/VKRecyclerFragment;-><init>(I)V

    .line 74
    new-instance v0, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment$1;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment$1;-><init>(Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;->mReceiver:Landroid/content/BroadcastReceiver;

    .line 64
    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;

    .prologue
    .line 40
    iget-object v0, p0, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$100(Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;

    .prologue
    .line 40
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;->refresh()V

    return-void
.end method

.method static synthetic access$1000(Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;)Landroid/widget/LinearLayout;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;

    .prologue
    .line 40
    iget-object v0, p0, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;->mHeader:Landroid/widget/LinearLayout;

    return-object v0
.end method

.method static synthetic access$200(Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;II)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;
    .param p1, "x1"    # I
    .param p2, "x2"    # I

    .prologue
    .line 40
    invoke-direct {p0, p1, p2}, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;->setItemStatus(II)V

    return-void
.end method

.method static synthetic access$300(Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;)I
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;

    .prologue
    .line 40
    iget v0, p0, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;->mPeerId:I

    return v0
.end method

.method static synthetic access$400(Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;

    .prologue
    .line 40
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;->mShowHeader:Z

    return v0
.end method

.method static synthetic access$500(Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;

    .prologue
    .line 40
    iget-object v0, p0, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$600(Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;

    .prologue
    .line 40
    iget-object v0, p0, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$700(Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;

    .prologue
    .line 40
    iget-object v0, p0, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$800(Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;

    .prologue
    .line 40
    iget-object v0, p0, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$900(Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;

    .prologue
    .line 40
    iget-object v0, p0, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic lambda$onCreateContentView$0(Landroid/view/View;)V
    .locals 2
    .param p0, "v"    # Landroid/view/View;

    .prologue
    .line 194
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {}, Lcom/vkontakte/android/MoneyTransfer;->getLandingUrl()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/money/MoneyWebViewFragment;->showTerms(Landroid/content/Context;Ljava/lang/String;)V

    .line 195
    return-void
.end method

.method private sendToPeer(I)V
    .locals 4
    .param p1, "idTo"    # I

    .prologue
    .line 235
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const/4 v1, 0x0

    const-string/jumbo v2, ""

    const-string/jumbo v3, ""

    invoke-static {v0, p1, v1, v2, v3}, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->start(Landroid/app/Activity;ILcom/vkontakte/android/UserProfile;Ljava/lang/String;Ljava/lang/String;)V

    .line 236
    return-void
.end method

.method private setItemStatus(II)V
    .locals 5
    .param p1, "transferId"    # I
    .param p2, "status"    # I

    .prologue
    .line 105
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment$Adapter;

    .line 107
    .local v0, "adapter":Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment$Adapter;
    const/4 v1, 0x0

    .line 109
    .local v1, "item":Lcom/vkontakte/android/MoneyTransfer;
    iget-object v3, p0, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;->data:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/MoneyTransfer;

    .line 110
    .local v2, "mt":Lcom/vkontakte/android/MoneyTransfer;
    iget v4, v2, Lcom/vkontakte/android/MoneyTransfer;->id:I

    if-ne v4, p1, :cond_0

    .line 111
    move-object v1, v2

    .line 116
    .end local v2    # "mt":Lcom/vkontakte/android/MoneyTransfer;
    :cond_1
    if-eqz v1, :cond_2

    .line 117
    iput p2, v1, Lcom/vkontakte/android/MoneyTransfer;->status:I

    .line 118
    iget v3, v1, Lcom/vkontakte/android/MoneyTransfer;->id:I

    invoke-virtual {v0, v3}, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment$Adapter;->getPositionByMoneyTransferId(I)I

    move-result v3

    invoke-virtual {v0, v3}, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment$Adapter;->notifyItemChanged(I)V

    .line 120
    :cond_2
    return-void
.end method


# virtual methods
.method protected canGoBack()Z
    .locals 1

    .prologue
    .line 240
    const/4 v0, 0x0

    return v0
.end method

.method protected doLoadData(II)V
    .locals 3
    .param p1, "offset"    # I
    .param p2, "count"    # I

    .prologue
    .line 250
    new-instance v0, Lcom/vkontakte/android/api/money/GetMoneyTransferList;

    iget v1, p0, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;->mFilter:I

    iget v2, p0, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;->mPeerId:I

    invoke-direct {v0, v1, v2, p1, p2}, Lcom/vkontakte/android/api/money/GetMoneyTransferList;-><init>(IIII)V

    new-instance v1, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment$4;

    invoke-direct {v1, p0, p0}, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment$4;-><init>(Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;Lme/grishka/appkit/fragments/BaseRecyclerFragment;)V

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/money/GetMoneyTransferList;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 256
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;->currentRequest:Lme/grishka/appkit/api/APIRequest;

    .line 257
    return-void
.end method

.method protected getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;
    .locals 2

    .prologue
    .line 262
    iget-object v0, p0, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;->mAdapter:Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment$Adapter;

    if-nez v0, :cond_0

    .line 263
    new-instance v0, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment$Adapter;

    iget-boolean v1, p0, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;->mShowHeader:Z

    invoke-direct {v0, p0, v1}, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment$Adapter;-><init>(Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;Z)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;->mAdapter:Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment$Adapter;

    .line 265
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;->mAdapter:Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment$Adapter;

    return-object v0
.end method

.method public hasNavigationDrawer()Z
    .locals 1

    .prologue
    .line 245
    const/4 v0, 0x0

    return v0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 2
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 223
    const/4 v1, -0x1

    if-eq p2, v1, :cond_1

    .line 232
    :cond_0
    :goto_0
    return-void

    .line 227
    :cond_1
    const/4 v1, 0x1

    if-ne p1, v1, :cond_0

    .line 228
    const-string/jumbo v1, "user"

    invoke-virtual {p3, v1}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/UserProfile;

    .line 230
    .local v0, "user":Lcom/vkontakte/android/UserProfile;
    iget v1, v0, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-direct {p0, v1}, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;->sendToPeer(I)V

    goto :goto_0
.end method

.method public onAttach(Landroid/app/Activity;)V
    .locals 4
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 124
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/VKRecyclerFragment;->onAttach(Landroid/app/Activity;)V

    .line 126
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f08036b

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;->setTitle(Ljava/lang/CharSequence;)V

    .line 128
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v2

    const-string/jumbo v3, "peer_id"

    invoke-virtual {v2, v3, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v2

    iput v2, p0, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;->mPeerId:I

    .line 129
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v2

    const-string/jumbo v3, "filter"

    invoke-virtual {v2, v3, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v2

    iput v2, p0, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;->mFilter:I

    .line 130
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v2

    const-string/jumbo v3, "show_header"

    invoke-virtual {v2, v3, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v2

    iget-boolean v2, v2, Lcom/vkontakte/android/auth/VKAccount;->moneyTransfersCanSend:Z

    if-eqz v2, :cond_0

    move v0, v1

    :cond_0
    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;->mShowHeader:Z

    .line 131
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v2, "allow_refresh"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;->mAllowRefresh:Z

    .line 132
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;->loadData()V

    .line 133
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 5
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 137
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/VKRecyclerFragment;->onCreate(Landroid/os/Bundle;)V

    .line 138
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 139
    .local v0, "filter":Landroid/content/IntentFilter;
    const-string/jumbo v1, "com.vkontakte.android.ACTION_MONEY_TRANSFER_ACCEPTED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 140
    const-string/jumbo v1, "com.vkontakte.android.ACTION_MONEY_TRANSFER_SENT"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 141
    const-string/jumbo v1, "com.vkontakte.android.ACTION_MONEY_TRANSFER_CANCELLED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 142
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;->mReceiver:Landroid/content/BroadcastReceiver;

    const-string/jumbo v3, "com.vkontakte.android.permission.ACCESS_DATA"

    const/4 v4, 0x0

    invoke-virtual {v1, v2, v0, v3, v4}, Landroid/app/Activity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;)Landroid/content/Intent;

    .line 143
    return-void
.end method

.method public onCreateContentView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 6
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 173
    const v4, 0x7f03011f

    const/4 v5, 0x0

    invoke-virtual {p1, v4, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/LinearLayout;

    iput-object v4, p0, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;->mHeader:Landroid/widget/LinearLayout;

    .line 175
    iget-object v4, p0, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;->mHeader:Landroid/widget/LinearLayout;

    const v5, 0x7f1003b3

    invoke-virtual {v4, v5}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v2

    .line 177
    .local v2, "newPaymentButton":Landroid/view/View;
    new-instance v4, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment$2;

    invoke-direct {v4, p0}, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment$2;-><init>(Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;)V

    invoke-virtual {v2, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 191
    iget-object v4, p0, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;->mHeader:Landroid/widget/LinearLayout;

    const v5, 0x7f1003b4

    invoke-virtual {v4, v5}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v3

    .line 193
    .local v3, "readMoreView":Landroid/view/View;
    invoke-static {}, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment$$Lambda$1;->lambdaFactory$()Landroid/view/View$OnClickListener;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 199
    invoke-super {p0, p1, p2, p3}, Lcom/vkontakte/android/fragments/VKRecyclerFragment;->onCreateContentView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    move-result-object v0

    .line 202
    .local v0, "contentView":Landroid/view/View;
    new-instance v1, Lme/grishka/appkit/views/DividerItemDecoration;

    new-instance v4, Landroid/graphics/drawable/ColorDrawable;

    const/high16 v5, 0x26000000

    invoke-direct {v4, v5}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    const/high16 v5, 0x3f000000    # 0.5f

    invoke-static {v5}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v5

    invoke-direct {v1, v4, v5}, Lme/grishka/appkit/views/DividerItemDecoration;-><init>(Landroid/graphics/drawable/Drawable;I)V

    .line 203
    .local v1, "dividers":Lme/grishka/appkit/views/DividerItemDecoration;
    iget-object v4, p0, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v4, v1}, Lme/grishka/appkit/views/UsableRecyclerView;->addItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    .line 204
    new-instance v4, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment$3;

    invoke-direct {v4, p0}, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment$3;-><init>(Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;)V

    invoke-virtual {v1, v4}, Lme/grishka/appkit/views/DividerItemDecoration;->setProvider(Lme/grishka/appkit/views/DividerItemDecoration$Provider;)Lme/grishka/appkit/views/DividerItemDecoration;

    .line 214
    return-object v0
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 2
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 153
    invoke-super {p0, p1, p2, p3}, Lcom/vkontakte/android/fragments/VKRecyclerFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    move-result-object v0

    .line 154
    .local v0, "view":Landroid/view/View;
    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 156
    iget-boolean v1, p0, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;->mAllowRefresh:Z

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;->setRefreshEnabled(Z)V

    .line 158
    return-object v0
.end method

.method public onDestroy()V
    .locals 2

    .prologue
    .line 147
    invoke-super {p0}, Lcom/vkontakte/android/fragments/VKRecyclerFragment;->onDestroy()V

    .line 148
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/app/Activity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 149
    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 3
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 163
    invoke-super {p0, p1, p2}, Lcom/vkontakte/android/fragments/VKRecyclerFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 164
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;->getToolbar()Landroid/support/v7/widget/Toolbar;

    move-result-object v0

    .line 165
    .local v0, "toolbar":Landroid/support/v7/widget/Toolbar;
    if-eqz v0, :cond_0

    .line 166
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;->getToolbar()Landroid/support/v7/widget/Toolbar;

    move-result-object v1

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/support/v7/widget/Toolbar;->setVisibility(I)V

    .line 168
    :cond_0
    return-void
.end method

.method public provideToolbar(Landroid/content/Context;)Landroid/view/ViewGroup;
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 270
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;->getToolbar()Landroid/support/v7/widget/Toolbar;

    move-result-object v0

    return-object v0
.end method

.method startUserPicker()V
    .locals 2

    .prologue
    .line 218
    new-instance v0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;

    invoke-direct {v0}, Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;-><init>()V

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;->setSelect()Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;->forResult(Landroid/app/Fragment;I)Z

    .line 219
    return-void
.end method
