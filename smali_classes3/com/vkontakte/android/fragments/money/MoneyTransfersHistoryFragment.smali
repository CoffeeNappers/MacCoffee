.class public Lcom/vkontakte/android/fragments/money/MoneyTransfersHistoryFragment;
.super Lcom/vkontakte/android/fragments/VKTabbedFragment;
.source "MoneyTransfersHistoryFragment.java"


# instance fields
.field private receivedTransfersFragment:Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;

.field private sentTransfersFragment:Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 17
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/VKTabbedFragment;-><init>()V

    return-void
.end method

.method private createMoneyTransfersFragment(IZ)Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;
    .locals 3
    .param p1, "filter"    # I
    .param p2, "showHeader"    # Z

    .prologue
    .line 46
    new-instance v1, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;

    invoke-direct {v1}, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;-><init>()V

    .line 47
    .local v1, "f":Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 48
    .local v0, "b":Landroid/os/Bundle;
    const-string/jumbo v2, "filter"

    invoke-virtual {v0, v2, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 49
    const-string/jumbo v2, "show_header"

    invoke-virtual {v0, v2, p2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 50
    invoke-virtual {v1, v0}, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;->setArguments(Landroid/os/Bundle;)V

    .line 51
    return-object v1
.end method


# virtual methods
.method public onAttach(Landroid/app/Activity;)V
    .locals 6
    .param p1, "act"    # Landroid/app/Activity;

    .prologue
    const/4 v5, 0x2

    const/4 v4, 0x1

    .line 26
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/VKTabbedFragment;->onAttach(Landroid/app/Activity;)V

    .line 27
    const v2, 0x7f08036d

    invoke-virtual {p0, v2}, Lcom/vkontakte/android/fragments/money/MoneyTransfersHistoryFragment;->setTitle(I)V

    .line 29
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1, v5}, Ljava/util/ArrayList;-><init>(I)V

    .line 30
    .local v1, "titles":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/money/MoneyTransfersHistoryFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f080386

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 31
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/money/MoneyTransfersHistoryFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f080382

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 33
    invoke-direct {p0, v4, v4}, Lcom/vkontakte/android/fragments/money/MoneyTransfersHistoryFragment;->createMoneyTransfersFragment(IZ)Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;

    move-result-object v2

    iput-object v2, p0, Lcom/vkontakte/android/fragments/money/MoneyTransfersHistoryFragment;->sentTransfersFragment:Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;

    .line 35
    const/4 v2, 0x0

    invoke-direct {p0, v5, v2}, Lcom/vkontakte/android/fragments/money/MoneyTransfersHistoryFragment;->createMoneyTransfersFragment(IZ)Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;

    move-result-object v2

    iput-object v2, p0, Lcom/vkontakte/android/fragments/money/MoneyTransfersHistoryFragment;->receivedTransfersFragment:Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;

    .line 37
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 39
    .local v0, "tabs":Ljava/util/List;, "Ljava/util/List<Landroid/app/Fragment;>;"
    iget-object v2, p0, Lcom/vkontakte/android/fragments/money/MoneyTransfersHistoryFragment;->sentTransfersFragment:Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 40
    iget-object v2, p0, Lcom/vkontakte/android/fragments/money/MoneyTransfersHistoryFragment;->receivedTransfersFragment:Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 42
    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/fragments/money/MoneyTransfersHistoryFragment;->setTabs(Ljava/util/List;Ljava/util/List;)V

    .line 43
    return-void
.end method
