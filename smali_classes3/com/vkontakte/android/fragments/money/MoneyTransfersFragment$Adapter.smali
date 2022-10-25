.class public Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment$Adapter;
.super Lme/grishka/appkit/views/UsableRecyclerView$Adapter;
.source "MoneyTransfersFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "Adapter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lme/grishka/appkit/views/UsableRecyclerView$Adapter",
        "<",
        "Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;",
        ">;"
    }
.end annotation


# instance fields
.field private final TYPE_HEADER:I

.field private final TYPE_MONEY_TRANSFER:I

.field private mShowHeader:Z

.field final synthetic this$0:Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;Z)V
    .locals 1
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;
    .param p2, "showHeader"    # Z

    .prologue
    .line 304
    iput-object p1, p0, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;

    invoke-direct {p0}, Lme/grishka/appkit/views/UsableRecyclerView$Adapter;-><init>()V

    .line 279
    const/4 v0, 0x0

    iput v0, p0, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment$Adapter;->TYPE_HEADER:I

    .line 280
    const/4 v0, 0x1

    iput v0, p0, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment$Adapter;->TYPE_MONEY_TRANSFER:I

    .line 305
    iput-boolean p2, p0, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment$Adapter;->mShowHeader:Z

    .line 306
    return-void
.end method

.method private getByPos(I)Lcom/vkontakte/android/MoneyTransfer;
    .locals 2
    .param p1, "position"    # I

    .prologue
    .line 284
    iget-object v0, p0, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;->access$500(Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;)Ljava/util/ArrayList;

    move-result-object v0

    iget-boolean v1, p0, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment$Adapter;->mShowHeader:Z

    if-eqz v1, :cond_0

    add-int/lit8 p1, p1, -0x1

    .end local p1    # "position":I
    :cond_0
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/MoneyTransfer;

    return-object v0
.end method


# virtual methods
.method public getImageCountForItem(I)I
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 349
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment$Adapter;->mShowHeader:Z

    if-eqz v0, :cond_0

    if-nez p1, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public getImageURL(II)Ljava/lang/String;
    .locals 1
    .param p1, "position"    # I
    .param p2, "image"    # I

    .prologue
    .line 354
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment$Adapter;->getByPos(I)Lcom/vkontakte/android/MoneyTransfer;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/MoneyTransfer;->getPeerUser()Lcom/vkontakte/android/UserProfile;

    move-result-object v0

    iget-object v0, v0, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    return-object v0
.end method

.method public getItemCount()I
    .locals 2

    .prologue
    .line 344
    iget-object v0, p0, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;->access$900(Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment$Adapter;->mShowHeader:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    add-int/2addr v0, v1

    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getItemViewType(I)I
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 335
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment$Adapter;->mShowHeader:Z

    if-eqz v0, :cond_0

    if-nez p1, :cond_0

    .line 336
    const/4 v0, 0x0

    .line 339
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public getPositionByMoneyTransferId(I)I
    .locals 3
    .param p1, "id"    # I

    .prologue
    .line 288
    const/4 v1, -0x1

    .line 289
    .local v1, "ind":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v2, p0, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;->access$600(Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v0, v2, :cond_0

    .line 290
    iget-object v2, p0, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;->access$700(Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/MoneyTransfer;

    iget v2, v2, Lcom/vkontakte/android/MoneyTransfer;->id:I

    if-ne v2, p1, :cond_2

    .line 291
    move v1, v0

    .line 296
    :cond_0
    const/4 v2, -0x1

    if-ne v1, v2, :cond_3

    .line 300
    .end local v1    # "ind":I
    :cond_1
    :goto_1
    return v1

    .line 289
    .restart local v1    # "ind":I
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 300
    :cond_3
    iget-boolean v2, p0, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment$Adapter;->mShowHeader:Z

    if-eqz v2, :cond_1

    add-int/lit8 v1, v1, 0x1

    goto :goto_1
.end method

.method public bridge synthetic onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    .prologue
    .line 274
    check-cast p1, Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;

    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment$Adapter;->onBindViewHolder(Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;I)V
    .locals 3
    .param p1, "holder"    # Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;
    .param p2, "position"    # I

    .prologue
    .line 322
    const-string/jumbo v0, "MoneyTransfersAdapter"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "onBindViewHolder + position = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vkontakte/android/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 325
    instance-of v0, p1, Lcom/vkontakte/android/ui/holder/MoneyTransferHolder;

    if-eqz v0, :cond_1

    .line 326
    check-cast p1, Lcom/vkontakte/android/ui/holder/MoneyTransferHolder;

    .end local p1    # "holder":Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;
    invoke-direct {p0, p2}, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment$Adapter;->getByPos(I)Lcom/vkontakte/android/MoneyTransfer;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/ui/holder/MoneyTransferHolder;->bind(Ljava/lang/Object;)V

    .line 331
    :cond_0
    :goto_0
    return-void

    .line 328
    .restart local p1    # "holder":Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;
    :cond_1
    instance-of v0, p1, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment$HeaderHolder;

    if-eqz v0, :cond_0

    .line 329
    check-cast p1, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment$HeaderHolder;

    .end local p1    # "holder":Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;
    iget-object v0, p0, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;->access$800(Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment$HeaderHolder;->setEmpty(Z)V

    goto :goto_0
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 1

    .prologue
    .line 274
    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment$Adapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;

    move-result-object v0

    return-object v0
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;
    .locals 2
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # I

    .prologue
    .line 310
    packed-switch p2, :pswitch_data_0

    .line 317
    const/4 v0, 0x0

    :goto_0
    return-object v0

    .line 312
    :pswitch_0
    new-instance v0, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment$HeaderHolder;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;

    invoke-direct {v0, v1}, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment$HeaderHolder;-><init>(Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;)V

    goto :goto_0

    .line 314
    :pswitch_1
    new-instance v0, Lcom/vkontakte/android/ui/holder/MoneyTransferHolder;

    invoke-direct {v0, p1}, Lcom/vkontakte/android/ui/holder/MoneyTransferHolder;-><init>(Landroid/view/ViewGroup;)V

    goto :goto_0

    .line 310
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
