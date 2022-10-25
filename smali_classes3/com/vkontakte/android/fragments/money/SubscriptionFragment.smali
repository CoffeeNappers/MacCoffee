.class public Lcom/vkontakte/android/fragments/money/SubscriptionFragment;
.super Lcom/vkontakte/android/fragments/CardRecyclerFragment;
.source "SubscriptionFragment.java"

# interfaces
.implements Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/fragments/money/SubscriptionFragment$ControlSubscriptionHolder;,
        Lcom/vkontakte/android/fragments/money/SubscriptionFragment$DescriptionHolder;,
        Lcom/vkontakte/android/fragments/money/SubscriptionFragment$Adapter;,
        Lcom/vkontakte/android/fragments/money/SubscriptionFragment$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/fragments/CardRecyclerFragment",
        "<",
        "Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;",
        ">;",
        "Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener",
        "<",
        "Lcom/vkontakte/android/data/Subscription;",
        ">;"
    }
.end annotation


# instance fields
.field private adapter:Lcom/vkontakte/android/fragments/money/SubscriptionFragment$Adapter;

.field private currentRequest:Lcom/vkontakte/android/api/store/GetSubscription;

.field private final helper:Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionHelper;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionHelper",
            "<",
            "Lcom/vkontakte/android/data/Subscription;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 60
    const/16 v0, 0x14

    invoke-direct {p0, v0}, Lcom/vkontakte/android/fragments/CardRecyclerFragment;-><init>(I)V

    .line 54
    iput-object v1, p0, Lcom/vkontakte/android/fragments/money/SubscriptionFragment;->adapter:Lcom/vkontakte/android/fragments/money/SubscriptionFragment$Adapter;

    .line 55
    iput-object v1, p0, Lcom/vkontakte/android/fragments/money/SubscriptionFragment;->currentRequest:Lcom/vkontakte/android/api/store/GetSubscription;

    .line 57
    new-instance v0, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionHelper;

    invoke-direct {v0}, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionHelper;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/money/SubscriptionFragment;->helper:Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionHelper;

    .line 61
    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/fragments/money/SubscriptionFragment;Lcom/vkontakte/android/data/Subscription;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/money/SubscriptionFragment;
    .param p1, "x1"    # Lcom/vkontakte/android/data/Subscription;

    .prologue
    .line 38
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/money/SubscriptionFragment;->onSubscriptionLoaded(Lcom/vkontakte/android/data/Subscription;)V

    return-void
.end method

.method static synthetic access$100(Lcom/vkontakte/android/fragments/money/SubscriptionFragment;)Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionHelper;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/money/SubscriptionFragment;

    .prologue
    .line 38
    iget-object v0, p0, Lcom/vkontakte/android/fragments/money/SubscriptionFragment;->helper:Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionHelper;

    return-object v0
.end method

.method static synthetic access$202(Lcom/vkontakte/android/fragments/money/SubscriptionFragment;Lcom/vkontakte/android/api/store/GetSubscription;)Lcom/vkontakte/android/api/store/GetSubscription;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/money/SubscriptionFragment;
    .param p1, "x1"    # Lcom/vkontakte/android/api/store/GetSubscription;

    .prologue
    .line 38
    iput-object p1, p0, Lcom/vkontakte/android/fragments/money/SubscriptionFragment;->currentRequest:Lcom/vkontakte/android/api/store/GetSubscription;

    return-object p1
.end method

.method private onSubscriptionLoaded(Lcom/vkontakte/android/data/Subscription;)V
    .locals 4
    .param p1, "subscription"    # Lcom/vkontakte/android/data/Subscription;

    .prologue
    const/4 v3, 0x0

    .line 121
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 122
    .local v0, "dataList":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;>;"
    iget-boolean v1, p0, Lcom/vkontakte/android/fragments/money/SubscriptionFragment;->isTablet:Z

    if-eqz v1, :cond_0

    .line 123
    invoke-static {v3, p1}, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;->top(ILjava/lang/Object;)Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 128
    :goto_0
    const/4 v1, 0x1

    const v2, 0x7f02005d

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;->bottom(ILjava/lang/Object;)Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 129
    const/4 v1, 0x3

    invoke-static {v1, p1}, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;->topBottom(ILjava/lang/Object;)Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 130
    const/4 v1, 0x2

    invoke-static {v1, p1}, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;->none(ILjava/lang/Object;)Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 132
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/money/SubscriptionFragment;->getAdapter()Lcom/vkontakte/android/fragments/money/SubscriptionFragment$Adapter;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/vkontakte/android/fragments/money/SubscriptionFragment$Adapter;->setData(Ljava/util/List;)V

    .line 133
    invoke-virtual {p0, v0, v3}, Lcom/vkontakte/android/fragments/money/SubscriptionFragment;->onDataLoaded(Ljava/util/List;Z)V

    .line 134
    return-void

    .line 125
    :cond_0
    invoke-static {v3, p1}, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;->middle(ILjava/lang/Object;)Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method


# virtual methods
.method protected doLoadData(II)V
    .locals 4
    .param p1, "offset"    # I
    .param p2, "count"    # I

    .prologue
    .line 85
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/money/SubscriptionFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v2

    const-string/jumbo v3, "subscription"

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/data/Subscription;

    .line 86
    .local v0, "subscription":Lcom/vkontakte/android/data/Subscription;
    if-eqz v0, :cond_0

    .line 87
    invoke-direct {p0, v0}, Lcom/vkontakte/android/fragments/money/SubscriptionFragment;->onSubscriptionLoaded(Lcom/vkontakte/android/data/Subscription;)V

    .line 118
    :goto_0
    return-void

    .line 89
    :cond_0
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/money/SubscriptionFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v2

    const-string/jumbo v3, "subscription_id"

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v1

    .line 90
    .local v1, "subscriptionId":I
    new-instance v2, Lcom/vkontakte/android/api/store/GetSubscription;

    invoke-direct {v2, v1}, Lcom/vkontakte/android/api/store/GetSubscription;-><init>(I)V

    iput-object v2, p0, Lcom/vkontakte/android/fragments/money/SubscriptionFragment;->currentRequest:Lcom/vkontakte/android/api/store/GetSubscription;

    .line 91
    iget-object v2, p0, Lcom/vkontakte/android/fragments/money/SubscriptionFragment;->currentRequest:Lcom/vkontakte/android/api/store/GetSubscription;

    new-instance v3, Lcom/vkontakte/android/fragments/money/SubscriptionFragment$1;

    invoke-direct {v3, p0}, Lcom/vkontakte/android/fragments/money/SubscriptionFragment$1;-><init>(Lcom/vkontakte/android/fragments/money/SubscriptionFragment;)V

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/api/store/GetSubscription;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 116
    iget-object v2, p0, Lcom/vkontakte/android/fragments/money/SubscriptionFragment;->currentRequest:Lcom/vkontakte/android/api/store/GetSubscription;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/money/SubscriptionFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/api/store/GetSubscription;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    goto :goto_0
.end method

.method protected bridge synthetic getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;
    .locals 1

    .prologue
    .line 38
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/money/SubscriptionFragment;->getAdapter()Lcom/vkontakte/android/fragments/money/SubscriptionFragment$Adapter;

    move-result-object v0

    return-object v0
.end method

.method protected getAdapter()Lcom/vkontakte/android/fragments/money/SubscriptionFragment$Adapter;
    .locals 2

    .prologue
    .line 147
    iget-object v0, p0, Lcom/vkontakte/android/fragments/money/SubscriptionFragment;->adapter:Lcom/vkontakte/android/fragments/money/SubscriptionFragment$Adapter;

    if-nez v0, :cond_0

    .line 148
    new-instance v0, Lcom/vkontakte/android/fragments/money/SubscriptionFragment$Adapter;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/vkontakte/android/fragments/money/SubscriptionFragment$Adapter;-><init>(Lcom/vkontakte/android/fragments/money/SubscriptionFragment;Lcom/vkontakte/android/fragments/money/SubscriptionFragment$1;)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/money/SubscriptionFragment;->adapter:Lcom/vkontakte/android/fragments/money/SubscriptionFragment$Adapter;

    .line 150
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/money/SubscriptionFragment;->adapter:Lcom/vkontakte/android/fragments/money/SubscriptionFragment$Adapter;

    return-object v0
.end method

.method public onAttach(Landroid/app/Activity;)V
    .locals 1
    .param p1, "act"    # Landroid/app/Activity;

    .prologue
    .line 65
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/CardRecyclerFragment;->onAttach(Landroid/app/Activity;)V

    .line 66
    const v0, 0x7f0806dd

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/money/SubscriptionFragment;->setTitle(I)V

    .line 67
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/money/SubscriptionFragment;->setHasOptionsMenu(Z)V

    .line 68
    iget-object v0, p0, Lcom/vkontakte/android/fragments/money/SubscriptionFragment;->helper:Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionHelper;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionHelper;->onAttach(Landroid/app/Activity;)V

    .line 69
    return-void
.end method

.method public onDestroy()V
    .locals 1

    .prologue
    .line 138
    invoke-super {p0}, Lcom/vkontakte/android/fragments/CardRecyclerFragment;->onDestroy()V

    .line 139
    iget-object v0, p0, Lcom/vkontakte/android/fragments/money/SubscriptionFragment;->currentRequest:Lcom/vkontakte/android/api/store/GetSubscription;

    .line 140
    .local v0, "req":Lcom/vkontakte/android/api/store/GetSubscription;
    if-eqz v0, :cond_0

    .line 141
    invoke-virtual {v0}, Lcom/vkontakte/android/api/store/GetSubscription;->cancel()V

    .line 143
    :cond_0
    return-void
.end method

.method public onDetach()V
    .locals 2

    .prologue
    .line 73
    iget-object v0, p0, Lcom/vkontakte/android/fragments/money/SubscriptionFragment;->helper:Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionHelper;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/money/SubscriptionFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionHelper;->onDetach(Landroid/app/Activity;)V

    .line 74
    invoke-super {p0}, Lcom/vkontakte/android/fragments/CardRecyclerFragment;->onDetach()V

    .line 75
    return-void
.end method

.method public onSuccess(Lcom/vkontakte/android/data/Subscription;)V
    .locals 2
    .param p1, "subscription"    # Lcom/vkontakte/android/data/Subscription;

    .prologue
    .line 155
    const/4 v1, 0x1

    iput-boolean v1, p1, Lcom/vkontakte/android/data/Subscription;->purchased:Z

    .line 156
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/money/SubscriptionFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 157
    .local v0, "activity":Landroid/app/Activity;
    if-eqz v0, :cond_0

    .line 158
    invoke-static {v0}, Lcom/vkontakte/android/fragments/money/MusicSubscriptionsWasBoughtFragment;->show(Landroid/content/Context;)V

    .line 159
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/money/SubscriptionFragment;->updateList()V

    .line 160
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/money/SubscriptionFragment;->refresh()V

    .line 162
    :cond_0
    return-void
.end method

.method public bridge synthetic onSuccess(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 38
    check-cast p1, Lcom/vkontakte/android/data/Subscription;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/money/SubscriptionFragment;->onSuccess(Lcom/vkontakte/android/data/Subscription;)V

    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 0
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 79
    invoke-super {p0, p1, p2}, Lcom/vkontakte/android/fragments/CardRecyclerFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 80
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/money/SubscriptionFragment;->loadData()V

    .line 81
    return-void
.end method
