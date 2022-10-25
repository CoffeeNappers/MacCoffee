.class final Lcom/vk/sharing/DialogSearchPresenter;
.super Lcom/vk/sharing/BasePresenter;
.source "DialogSearchPresenter.java"


# static fields
.field private static final SEARCH_DELAY:I = 0x12c


# instance fields
.field private final searchRunnable:Ljava/lang/Runnable;


# direct methods
.method constructor <init>(Lcom/vk/sharing/BasePresenter$DelegateContext;)V
    .locals 1
    .param p1, "context"    # Lcom/vk/sharing/BasePresenter$DelegateContext;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 21
    invoke-direct {p0, p1}, Lcom/vk/sharing/BasePresenter;-><init>(Lcom/vk/sharing/BasePresenter$DelegateContext;)V

    .line 18
    invoke-static {p0}, Lcom/vk/sharing/DialogSearchPresenter$$Lambda$1;->lambdaFactory$(Lcom/vk/sharing/DialogSearchPresenter;)Ljava/lang/Runnable;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/sharing/DialogSearchPresenter;->searchRunnable:Ljava/lang/Runnable;

    .line 23
    invoke-direct {p0}, Lcom/vk/sharing/DialogSearchPresenter;->init()V

    .line 24
    return-void
.end method

.method constructor <init>(Lcom/vk/sharing/CommonPresenter;)V
    .locals 1
    .param p1, "presenter"    # Lcom/vk/sharing/CommonPresenter;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 27
    invoke-direct {p0, p1}, Lcom/vk/sharing/BasePresenter;-><init>(Lcom/vk/sharing/BasePresenter;)V

    .line 18
    invoke-static {p0}, Lcom/vk/sharing/DialogSearchPresenter$$Lambda$2;->lambdaFactory$(Lcom/vk/sharing/DialogSearchPresenter;)Ljava/lang/Runnable;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/sharing/DialogSearchPresenter;->searchRunnable:Ljava/lang/Runnable;

    .line 29
    iget-object v0, p0, Lcom/vk/sharing/DialogSearchPresenter;->view:Lcom/vk/sharing/view/SharingView;

    invoke-virtual {v0}, Lcom/vk/sharing/view/SharingView;->showKeyboard()V

    .line 30
    iget-object v0, p0, Lcom/vk/sharing/DialogSearchPresenter;->view:Lcom/vk/sharing/view/SharingView;

    invoke-static {v0}, Lcom/vk/sharing/KitKatTransitions;->run(Landroid/view/ViewGroup;)V

    .line 32
    invoke-direct {p0}, Lcom/vk/sharing/DialogSearchPresenter;->init()V

    .line 33
    return-void
.end method

.method private init()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 36
    iget-object v0, p0, Lcom/vk/sharing/DialogSearchPresenter;->view:Lcom/vk/sharing/view/SharingView;

    const v1, 0x7f08045d

    new-array v2, v3, [Ljava/lang/Object;

    invoke-virtual {p0, v1, v2}, Lcom/vk/sharing/DialogSearchPresenter;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/sharing/view/SharingView;->setEmptyText(Ljava/lang/String;)V

    .line 37
    iget-object v0, p0, Lcom/vk/sharing/DialogSearchPresenter;->view:Lcom/vk/sharing/view/SharingView;

    const v1, 0x7f080673

    new-array v2, v3, [Ljava/lang/Object;

    invoke-virtual {p0, v1, v2}, Lcom/vk/sharing/DialogSearchPresenter;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/sharing/view/SharingView;->setErrorMessage(Ljava/lang/String;)V

    .line 38
    iget-object v0, p0, Lcom/vk/sharing/DialogSearchPresenter;->view:Lcom/vk/sharing/view/SharingView;

    invoke-virtual {v0}, Lcom/vk/sharing/view/SharingView;->hideHeaderSearchButton()V

    .line 39
    iget-object v0, p0, Lcom/vk/sharing/DialogSearchPresenter;->view:Lcom/vk/sharing/view/SharingView;

    invoke-virtual {v0}, Lcom/vk/sharing/view/SharingView;->showHeaderBackButton()V

    .line 40
    iget-object v0, p0, Lcom/vk/sharing/DialogSearchPresenter;->view:Lcom/vk/sharing/view/SharingView;

    invoke-virtual {v0}, Lcom/vk/sharing/view/SharingView;->showHeaderSearch()V

    .line 41
    iget-object v0, p0, Lcom/vk/sharing/DialogSearchPresenter;->view:Lcom/vk/sharing/view/SharingView;

    const v1, 0x7f080676

    new-array v2, v3, [Ljava/lang/Object;

    invoke-virtual {p0, v1, v2}, Lcom/vk/sharing/DialogSearchPresenter;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/sharing/view/SharingView;->setSearchHint(Ljava/lang/String;)V

    .line 42
    iget-object v0, p0, Lcom/vk/sharing/DialogSearchPresenter;->view:Lcom/vk/sharing/view/SharingView;

    invoke-virtual {v0}, Lcom/vk/sharing/view/SharingView;->showFooterCancel()V

    .line 44
    iget-object v0, p0, Lcom/vk/sharing/DialogSearchPresenter;->targets:Lcom/vk/sharing/target/Targets;

    invoke-virtual {v0}, Lcom/vk/sharing/target/Targets;->isDialogsLoaded()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 45
    iget-object v0, p0, Lcom/vk/sharing/DialogSearchPresenter;->targets:Lcom/vk/sharing/target/Targets;

    invoke-virtual {v0}, Lcom/vk/sharing/target/Targets;->getQuery()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 46
    iget-object v0, p0, Lcom/vk/sharing/DialogSearchPresenter;->view:Lcom/vk/sharing/view/SharingView;

    iget-object v1, p0, Lcom/vk/sharing/DialogSearchPresenter;->targets:Lcom/vk/sharing/target/Targets;

    invoke-virtual {v1}, Lcom/vk/sharing/target/Targets;->getDialogTargets()Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/sharing/view/SharingView;->setTargets(Ljava/util/List;)V

    .line 52
    :goto_0
    iget-object v0, p0, Lcom/vk/sharing/DialogSearchPresenter;->view:Lcom/vk/sharing/view/SharingView;

    invoke-virtual {v0}, Lcom/vk/sharing/view/SharingView;->showList()V

    .line 59
    :goto_1
    return-void

    .line 48
    :cond_0
    iget-object v0, p0, Lcom/vk/sharing/DialogSearchPresenter;->view:Lcom/vk/sharing/view/SharingView;

    invoke-virtual {v0}, Lcom/vk/sharing/view/SharingView;->showClearButton()V

    .line 49
    iget-object v0, p0, Lcom/vk/sharing/DialogSearchPresenter;->view:Lcom/vk/sharing/view/SharingView;

    iget-object v1, p0, Lcom/vk/sharing/DialogSearchPresenter;->targets:Lcom/vk/sharing/target/Targets;

    invoke-virtual {v1}, Lcom/vk/sharing/target/Targets;->getQuery()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/sharing/view/SharingView;->setSearchQuery(Ljava/lang/String;)V

    .line 50
    iget-object v0, p0, Lcom/vk/sharing/DialogSearchPresenter;->view:Lcom/vk/sharing/view/SharingView;

    iget-object v1, p0, Lcom/vk/sharing/DialogSearchPresenter;->targets:Lcom/vk/sharing/target/Targets;

    invoke-virtual {v1}, Lcom/vk/sharing/target/Targets;->getSearchResultTargets()Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/sharing/view/SharingView;->setTargets(Ljava/util/List;)V

    goto :goto_0

    .line 54
    :cond_1
    iget-object v0, p0, Lcom/vk/sharing/DialogSearchPresenter;->targetsLoader:Lcom/vk/sharing/target/TargetsLoader;

    invoke-virtual {v0}, Lcom/vk/sharing/target/TargetsLoader;->isLoadingDialogs()Z

    move-result v0

    if-nez v0, :cond_2

    .line 55
    iget-object v0, p0, Lcom/vk/sharing/DialogSearchPresenter;->targetsLoader:Lcom/vk/sharing/target/TargetsLoader;

    invoke-virtual {v0, v3}, Lcom/vk/sharing/target/TargetsLoader;->loadDialogs(I)V

    .line 57
    :cond_2
    iget-object v0, p0, Lcom/vk/sharing/DialogSearchPresenter;->view:Lcom/vk/sharing/view/SharingView;

    invoke-virtual {v0}, Lcom/vk/sharing/view/SharingView;->showLoading()V

    goto :goto_1
.end method


# virtual methods
.method synthetic lambda$new$0()V
    .locals 2

    .prologue
    .line 18
    iget-object v0, p0, Lcom/vk/sharing/DialogSearchPresenter;->targetsLoader:Lcom/vk/sharing/target/TargetsLoader;

    iget-object v1, p0, Lcom/vk/sharing/DialogSearchPresenter;->targets:Lcom/vk/sharing/target/Targets;

    invoke-virtual {v1}, Lcom/vk/sharing/target/Targets;->getQuery()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/sharing/target/TargetsLoader;->searchDialogs(Ljava/lang/String;)V

    return-void
.end method

.method public onBackClick()V
    .locals 3

    .prologue
    .line 63
    iget-object v0, p0, Lcom/vk/sharing/DialogSearchPresenter;->context:Lcom/vk/sharing/BasePresenter$DelegateContext;

    new-instance v1, Lcom/vk/sharing/CommonPresenter;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcom/vk/sharing/CommonPresenter;-><init>(Lcom/vk/sharing/DialogSearchPresenter;Lcom/vk/sharing/target/Target;)V

    invoke-interface {v0, v1}, Lcom/vk/sharing/BasePresenter$DelegateContext;->setNextPresenter(Lcom/vk/sharing/BasePresenter;)V

    .line 64
    return-void
.end method

.method public onDialogLoadingCompleted(Ljava/util/ArrayList;)V
    .locals 2
    .param p1    # Ljava/util/ArrayList;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vk/sharing/target/Target;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 96
    .local p1, "targets":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/sharing/target/Target;>;"
    invoke-super {p0, p1}, Lcom/vk/sharing/BasePresenter;->onDialogLoadingCompleted(Ljava/util/ArrayList;)V

    .line 97
    iget-object v0, p0, Lcom/vk/sharing/DialogSearchPresenter;->view:Lcom/vk/sharing/view/SharingView;

    invoke-virtual {v0}, Lcom/vk/sharing/view/SharingView;->isSearchQueryEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 98
    iget-object v0, p0, Lcom/vk/sharing/DialogSearchPresenter;->view:Lcom/vk/sharing/view/SharingView;

    iget-object v1, p0, Lcom/vk/sharing/DialogSearchPresenter;->targets:Lcom/vk/sharing/target/Targets;

    invoke-virtual {v1}, Lcom/vk/sharing/target/Targets;->getDialogTargets()Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/sharing/view/SharingView;->setTargets(Ljava/util/List;)V

    .line 99
    iget-object v0, p0, Lcom/vk/sharing/DialogSearchPresenter;->view:Lcom/vk/sharing/view/SharingView;

    invoke-virtual {v0}, Lcom/vk/sharing/view/SharingView;->showList()V

    .line 101
    :cond_0
    return-void
.end method

.method public onDialogSearchingCompleted(Ljava/util/ArrayList;)V
    .locals 2
    .param p1    # Ljava/util/ArrayList;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vk/sharing/target/Target;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 105
    .local p1, "targets":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/sharing/target/Target;>;"
    invoke-super {p0, p1}, Lcom/vk/sharing/BasePresenter;->onDialogSearchingCompleted(Ljava/util/ArrayList;)V

    .line 106
    iget-object v0, p0, Lcom/vk/sharing/DialogSearchPresenter;->view:Lcom/vk/sharing/view/SharingView;

    invoke-virtual {v0}, Lcom/vk/sharing/view/SharingView;->isSearchQueryEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 107
    iget-object v0, p0, Lcom/vk/sharing/DialogSearchPresenter;->view:Lcom/vk/sharing/view/SharingView;

    iget-object v1, p0, Lcom/vk/sharing/DialogSearchPresenter;->targets:Lcom/vk/sharing/target/Targets;

    invoke-virtual {v1}, Lcom/vk/sharing/target/Targets;->getSearchResultTargets()Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/sharing/view/SharingView;->setTargets(Ljava/util/List;)V

    .line 108
    iget-object v0, p0, Lcom/vk/sharing/DialogSearchPresenter;->view:Lcom/vk/sharing/view/SharingView;

    invoke-virtual {v0}, Lcom/vk/sharing/view/SharingView;->showList()V

    .line 109
    iget-object v0, p0, Lcom/vk/sharing/DialogSearchPresenter;->view:Lcom/vk/sharing/view/SharingView;

    invoke-virtual {v0}, Lcom/vk/sharing/view/SharingView;->scrollListToStart()V

    .line 111
    :cond_0
    return-void
.end method

.method public onListItemClick(Lcom/vk/sharing/target/Target;I)V
    .locals 2
    .param p1, "target"    # Lcom/vk/sharing/target/Target;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "position"    # I

    .prologue
    .line 68
    iget-object v0, p0, Lcom/vk/sharing/DialogSearchPresenter;->context:Lcom/vk/sharing/BasePresenter$DelegateContext;

    new-instance v1, Lcom/vk/sharing/CommonPresenter;

    invoke-direct {v1, p0, p1}, Lcom/vk/sharing/CommonPresenter;-><init>(Lcom/vk/sharing/DialogSearchPresenter;Lcom/vk/sharing/target/Target;)V

    invoke-interface {v0, v1}, Lcom/vk/sharing/BasePresenter$DelegateContext;->setNextPresenter(Lcom/vk/sharing/BasePresenter;)V

    .line 69
    return-void
.end method

.method public onRetryClick()V
    .locals 2

    .prologue
    .line 73
    iget-object v0, p0, Lcom/vk/sharing/DialogSearchPresenter;->targetsLoader:Lcom/vk/sharing/target/TargetsLoader;

    invoke-virtual {v0}, Lcom/vk/sharing/target/TargetsLoader;->isLoadingDialogs()Z

    move-result v0

    if-nez v0, :cond_0

    .line 74
    iget-object v0, p0, Lcom/vk/sharing/DialogSearchPresenter;->targetsLoader:Lcom/vk/sharing/target/TargetsLoader;

    iget-object v1, p0, Lcom/vk/sharing/DialogSearchPresenter;->targets:Lcom/vk/sharing/target/Targets;

    invoke-virtual {v1}, Lcom/vk/sharing/target/Targets;->getDialogTargetsSize()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/vk/sharing/target/TargetsLoader;->loadDialogs(I)V

    .line 75
    iget-object v0, p0, Lcom/vk/sharing/DialogSearchPresenter;->view:Lcom/vk/sharing/view/SharingView;

    invoke-virtual {v0}, Lcom/vk/sharing/view/SharingView;->showLoading()V

    .line 77
    :cond_0
    return-void
.end method

.method public onSearchInputChanged(Ljava/lang/String;)V
    .locals 4
    .param p1, "query"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 81
    invoke-super {p0, p1}, Lcom/vk/sharing/BasePresenter;->onSearchInputChanged(Ljava/lang/String;)V

    .line 82
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 83
    iget-object v0, p0, Lcom/vk/sharing/DialogSearchPresenter;->view:Lcom/vk/sharing/view/SharingView;

    invoke-virtual {v0}, Lcom/vk/sharing/view/SharingView;->hideClearButton()V

    .line 84
    iget-object v0, p0, Lcom/vk/sharing/DialogSearchPresenter;->view:Lcom/vk/sharing/view/SharingView;

    iget-object v1, p0, Lcom/vk/sharing/DialogSearchPresenter;->targets:Lcom/vk/sharing/target/Targets;

    invoke-virtual {v1}, Lcom/vk/sharing/target/Targets;->getDialogTargets()Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/sharing/view/SharingView;->setTargets(Ljava/util/List;)V

    .line 85
    iget-object v0, p0, Lcom/vk/sharing/DialogSearchPresenter;->view:Lcom/vk/sharing/view/SharingView;

    invoke-virtual {v0}, Lcom/vk/sharing/view/SharingView;->showList()V

    .line 86
    iget-object v0, p0, Lcom/vk/sharing/DialogSearchPresenter;->view:Lcom/vk/sharing/view/SharingView;

    invoke-virtual {v0}, Lcom/vk/sharing/view/SharingView;->scrollListToStart()V

    .line 92
    :goto_0
    return-void

    .line 88
    :cond_0
    iget-object v0, p0, Lcom/vk/sharing/DialogSearchPresenter;->view:Lcom/vk/sharing/view/SharingView;

    invoke-virtual {v0}, Lcom/vk/sharing/view/SharingView;->showClearButton()V

    .line 89
    iget-object v0, p0, Lcom/vk/sharing/DialogSearchPresenter;->view:Lcom/vk/sharing/view/SharingView;

    iget-object v1, p0, Lcom/vk/sharing/DialogSearchPresenter;->searchRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Lcom/vk/sharing/view/SharingView;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 90
    iget-object v0, p0, Lcom/vk/sharing/DialogSearchPresenter;->view:Lcom/vk/sharing/view/SharingView;

    iget-object v1, p0, Lcom/vk/sharing/DialogSearchPresenter;->searchRunnable:Ljava/lang/Runnable;

    const-wide/16 v2, 0x12c

    invoke-virtual {v0, v1, v2, v3}, Lcom/vk/sharing/view/SharingView;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_0
.end method
