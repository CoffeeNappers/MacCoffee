.class Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;
.super Lme/grishka/appkit/views/UsableRecyclerView$Adapter;
.source "PrivacyEditFragment.java"

# interfaces
.implements Lcom/vkontakte/android/ui/CardItemDecorator$Provider;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/PrivacyEditFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "UserListAdapter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lme/grishka/appkit/views/UsableRecyclerView$Adapter",
        "<",
        "Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;",
        ">;",
        "Lcom/vkontakte/android/ui/CardItemDecorator$Provider;"
    }
.end annotation


# instance fields
.field f1:Lcom/vkontakte/android/functions/VoidF1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/functions/VoidF1",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;"
        }
    .end annotation
.end field

.field final isAllowed:Z

.field selectFriendList:Lcom/vkontakte/android/ui/holder/SettingsSelectFriendHolder$Data;

.field selectFriends:Lcom/vkontakte/android/ui/holder/SettingsSelectFriendHolder$Data;

.field final synthetic this$0:Lcom/vkontakte/android/fragments/PrivacyEditFragment;

.field private users:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;"
        }
    .end annotation
.end field

.field private visible:Z


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/fragments/PrivacyEditFragment;Lcom/vkontakte/android/functions/VoidF0;Lcom/vkontakte/android/functions/VoidF0;Z)V
    .locals 2
    .param p2, "selectFriendsFunc"    # Lcom/vkontakte/android/functions/VoidF0;
    .param p3, "selectFriendListFunc"    # Lcom/vkontakte/android/functions/VoidF0;
    .param p4, "isAllowed"    # Z

    .prologue
    .line 491
    iput-object p1, p0, Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;->this$0:Lcom/vkontakte/android/fragments/PrivacyEditFragment;

    invoke-direct {p0}, Lme/grishka/appkit/views/UsableRecyclerView$Adapter;-><init>()V

    .line 479
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;->users:Ljava/util/ArrayList;

    .line 480
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;->visible:Z

    .line 481
    invoke-static {p0}, Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;)Lcom/vkontakte/android/functions/VoidF1;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;->f1:Lcom/vkontakte/android/functions/VoidF1;

    .line 492
    new-instance v0, Lcom/vkontakte/android/ui/holder/SettingsSelectFriendHolder$Data;

    const v1, 0x7f0804b6

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-direct {v0, v1, p2}, Lcom/vkontakte/android/ui/holder/SettingsSelectFriendHolder$Data;-><init>(Ljava/lang/Object;Lcom/vkontakte/android/functions/VoidF0;)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;->selectFriends:Lcom/vkontakte/android/ui/holder/SettingsSelectFriendHolder$Data;

    .line 493
    new-instance v0, Lcom/vkontakte/android/ui/holder/SettingsSelectFriendHolder$Data;

    const v1, 0x7f0804b8

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-direct {v0, v1, p3}, Lcom/vkontakte/android/ui/holder/SettingsSelectFriendHolder$Data;-><init>(Ljava/lang/Object;Lcom/vkontakte/android/functions/VoidF0;)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;->selectFriendList:Lcom/vkontakte/android/ui/holder/SettingsSelectFriendHolder$Data;

    .line 494
    iput-boolean p4, p0, Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;->isAllowed:Z

    .line 495
    return-void
.end method

.method static synthetic access$200(Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;

    .prologue
    .line 476
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;->visible:Z

    return v0
.end method

.method static synthetic access$202(Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;
    .param p1, "x1"    # Z

    .prologue
    .line 476
    iput-boolean p1, p0, Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;->visible:Z

    return p1
.end method

.method static synthetic access$400(Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;

    .prologue
    .line 476
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;->users:Ljava/util/ArrayList;

    return-object v0
.end method


# virtual methods
.method public getBlockType(I)I
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 556
    if-nez p1, :cond_0

    .line 557
    const/4 v0, 0x2

    .line 561
    :goto_0
    return v0

    .line 558
    :cond_0
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;->getItemCount()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    if-eq p1, v0, :cond_1

    .line 559
    const/4 v0, 0x1

    goto :goto_0

    .line 561
    :cond_1
    const/4 v0, 0x4

    goto :goto_0
.end method

.method public getImageCountForItem(I)I
    .locals 3
    .param p1, "item"    # I

    .prologue
    const/4 v1, 0x0

    .line 567
    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;->getItemCount()I

    move-result v0

    add-int/lit8 v0, v0, -0x3

    if-lt p1, v0, :cond_1

    :cond_0
    move v0, v1

    .line 573
    :goto_0
    return v0

    .line 570
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;->users:Ljava/util/ArrayList;

    add-int/lit8 v2, p1, -0x1

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/UserProfile;

    iget v0, v0, Lcom/vkontakte/android/UserProfile;->uid:I

    const v2, 0x77359400

    if-le v0, v2, :cond_2

    move v0, v1

    .line 571
    goto :goto_0

    .line 573
    :cond_2
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public getImageURL(II)Ljava/lang/String;
    .locals 2
    .param p1, "item"    # I
    .param p2, "image"    # I

    .prologue
    .line 578
    add-int/lit8 v0, p1, -0x1

    if-ltz v0, :cond_0

    add-int/lit8 v0, p1, -0x1

    iget-object v1, p0, Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;->users:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;->users:Ljava/util/ArrayList;

    add-int/lit8 v1, p1, -0x1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/UserProfile;

    iget-object v0, v0, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getItemCount()I
    .locals 1

    .prologue
    .line 551
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;->visible:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;->users:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, 0x4

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getItemViewType(I)I
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 499
    if-nez p1, :cond_0

    .line 500
    const/16 v0, 0xa

    .line 508
    :goto_0
    return v0

    .line 501
    :cond_0
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;->getItemCount()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    if-ne p1, v0, :cond_1

    .line 502
    const/16 v0, 0xb

    goto :goto_0

    .line 503
    :cond_1
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;->getItemCount()I

    move-result v0

    add-int/lit8 v0, v0, -0x2

    if-ne p1, v0, :cond_2

    .line 504
    const/16 v0, 0xe

    goto :goto_0

    .line 505
    :cond_2
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;->getItemCount()I

    move-result v0

    add-int/lit8 v0, v0, -0x3

    if-ne p1, v0, :cond_3

    .line 506
    const/16 v0, 0xc

    goto :goto_0

    .line 508
    :cond_3
    const/16 v0, 0xd

    goto :goto_0
.end method

.method synthetic lambda$new$0(Lcom/vkontakte/android/UserProfile;)V
    .locals 2
    .param p1, "v"    # Lcom/vkontakte/android/UserProfile;

    .prologue
    .line 482
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;->users:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 483
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;->this$0:Lcom/vkontakte/android/fragments/PrivacyEditFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->access$700(Lcom/vkontakte/android/fragments/PrivacyEditFragment;)V

    .line 484
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;->this$0:Lcom/vkontakte/android/fragments/PrivacyEditFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->updateList()V

    .line 485
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;->this$0:Lcom/vkontakte/android/fragments/PrivacyEditFragment;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->access$802(Lcom/vkontakte/android/fragments/PrivacyEditFragment;Z)Z

    .line 486
    return-void
.end method

.method public bridge synthetic onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    .prologue
    .line 476
    check-cast p1, Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;

    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;->onBindViewHolder(Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;I)V
    .locals 4
    .param p1, "holder"    # Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;
    .param p2, "position"    # I

    .prologue
    .line 530
    invoke-virtual {p0, p2}, Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;->getItemViewType(I)I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 541
    :goto_0
    :pswitch_0
    instance-of v0, p1, Lcom/vkontakte/android/ui/holder/UserHolder;

    if-eqz v0, :cond_0

    move-object v0, p1

    .line 542
    check-cast v0, Lcom/vkontakte/android/ui/holder/UserHolder;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;->users:Ljava/util/ArrayList;

    add-int/lit8 v2, p2, -0x1

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/holder/UserHolder;->bind(Ljava/lang/Object;)V

    .line 543
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;->users:Ljava/util/ArrayList;

    add-int/lit8 v1, p2, -0x1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/UserProfile;

    iget v0, v0, Lcom/vkontakte/android/UserProfile;->uid:I

    const v1, 0x77359400

    if-lt v0, v1, :cond_0

    .line 544
    check-cast p1, Lcom/vkontakte/android/ui/holder/UserHolder;

    .end local p1    # "holder":Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;
    iget-object v1, p1, Lcom/vkontakte/android/ui/holder/UserHolder;->mImage:Lcom/vk/imageloader/view/VKImageView;

    invoke-static {}, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->access$600()[I

    move-result-object v2

    iget-object v0, p0, Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;->users:Ljava/util/ArrayList;

    add-int/lit8 v3, p2, -0x1

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/UserProfile;

    iget v0, v0, Lcom/vkontakte/android/UserProfile;->uid:I

    const v3, 0x77359401

    sub-int/2addr v0, v3

    invoke-static {}, Lcom/vkontakte/android/fragments/PrivacyEditFragment;->access$600()[I

    move-result-object v3

    array-length v3, v3

    rem-int/2addr v0, v3

    aget v0, v2, v0

    invoke-virtual {v1, v0}, Lcom/vk/imageloader/view/VKImageView;->setImageResource(I)V

    .line 547
    :cond_0
    return-void

    .restart local p1    # "holder":Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;
    :pswitch_1
    move-object v0, p1

    .line 532
    check-cast v0, Lcom/vkontakte/android/ui/holder/commons/TitleHolder;

    iget-boolean v1, p0, Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;->isAllowed:Z

    if-eqz v1, :cond_1

    const v1, 0x7f08052b

    :goto_1
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/holder/commons/TitleHolder;->bind(Ljava/lang/Object;)V

    goto :goto_0

    :cond_1
    const v1, 0x7f08052c

    goto :goto_1

    :pswitch_2
    move-object v0, p1

    .line 535
    check-cast v0, Lcom/vkontakte/android/ui/holder/SettingsSelectFriendHolder;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;->selectFriends:Lcom/vkontakte/android/ui/holder/SettingsSelectFriendHolder$Data;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/holder/SettingsSelectFriendHolder;->bind(Ljava/lang/Object;)V

    goto :goto_0

    :pswitch_3
    move-object v0, p1

    .line 538
    check-cast v0, Lcom/vkontakte/android/ui/holder/SettingsSelectFriendHolder;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;->selectFriendList:Lcom/vkontakte/android/ui/holder/SettingsSelectFriendHolder$Data;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/holder/SettingsSelectFriendHolder;->bind(Ljava/lang/Object;)V

    goto :goto_0

    .line 530
    :pswitch_data_0
    .packed-switch 0xa
        :pswitch_1
        :pswitch_0
        :pswitch_2
        :pswitch_0
        :pswitch_3
    .end packed-switch
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 1

    .prologue
    .line 476
    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;

    move-result-object v0

    return-object v0
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;
    .locals 2
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # I

    .prologue
    .line 514
    packed-switch p2, :pswitch_data_0

    .line 521
    :pswitch_0
    const v0, 0x7f030221

    invoke-static {p1, v0}, Lcom/vkontakte/android/ui/holder/UserHolder;->actionable(Landroid/view/ViewGroup;I)Lcom/vkontakte/android/ui/holder/UserHolder;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;->f1:Lcom/vkontakte/android/functions/VoidF1;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/holder/UserHolder;->onAction(Lcom/vkontakte/android/functions/VoidF1;)Lcom/vkontakte/android/ui/holder/UserHolder;

    move-result-object v0

    .line 524
    :goto_0
    return-object v0

    .line 516
    :pswitch_1
    invoke-static {p1}, Lcom/vkontakte/android/ui/holder/commons/TitleHolder;->blueTitle(Landroid/view/ViewGroup;)Lcom/vkontakte/android/ui/holder/commons/TitleHolder;

    move-result-object v1

    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/PrivacyEditFragment$UserListAdapter;->isAllowed:Z

    if-eqz v0, :cond_0

    const v0, 0x7f08052b

    :goto_1
    invoke-virtual {v1, v0}, Lcom/vkontakte/android/ui/holder/commons/TitleHolder;->withText(I)Lcom/vkontakte/android/ui/holder/commons/TitleHolder;

    move-result-object v0

    goto :goto_0

    :cond_0
    const v0, 0x7f08052c

    goto :goto_1

    .line 518
    :pswitch_2
    new-instance v0, Lcom/vkontakte/android/ui/holder/commons/BackgroundHolder;

    invoke-direct {v0, p1}, Lcom/vkontakte/android/ui/holder/commons/BackgroundHolder;-><init>(Landroid/view/ViewGroup;)V

    const v1, 0x7f02005d

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/holder/commons/BackgroundHolder;->setRes(I)Lcom/vkontakte/android/ui/holder/commons/BackgroundHolder;

    move-result-object v0

    goto :goto_0

    .line 524
    :pswitch_3
    new-instance v0, Lcom/vkontakte/android/ui/holder/SettingsSelectFriendHolder;

    invoke-direct {v0, p1}, Lcom/vkontakte/android/ui/holder/SettingsSelectFriendHolder;-><init>(Landroid/view/ViewGroup;)V

    goto :goto_0

    .line 514
    :pswitch_data_0
    .packed-switch 0xa
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_0
        :pswitch_3
    .end packed-switch
.end method
