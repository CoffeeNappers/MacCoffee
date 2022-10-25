.class final Lcom/vk/sharing/GroupPostPresenter;
.super Lcom/vk/sharing/BasePresenter;
.source "GroupPostPresenter.java"


# direct methods
.method constructor <init>(Lcom/vk/sharing/BasePresenter$DelegateContext;)V
    .locals 0
    .param p1, "context"    # Lcom/vk/sharing/BasePresenter$DelegateContext;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 19
    invoke-direct {p0, p1}, Lcom/vk/sharing/BasePresenter;-><init>(Lcom/vk/sharing/BasePresenter$DelegateContext;)V

    .line 21
    invoke-direct {p0}, Lcom/vk/sharing/GroupPostPresenter;->init()V

    .line 22
    return-void
.end method

.method constructor <init>(Lcom/vk/sharing/CommonPresenter;)V
    .locals 1
    .param p1, "presenter"    # Lcom/vk/sharing/CommonPresenter;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 25
    invoke-direct {p0, p1}, Lcom/vk/sharing/BasePresenter;-><init>(Lcom/vk/sharing/BasePresenter;)V

    .line 27
    iget-object v0, p0, Lcom/vk/sharing/GroupPostPresenter;->view:Lcom/vk/sharing/view/SharingView;

    invoke-static {v0}, Lcom/vk/sharing/KitKatTransitions;->run(Landroid/view/ViewGroup;)V

    .line 29
    invoke-direct {p0}, Lcom/vk/sharing/GroupPostPresenter;->init()V

    .line 30
    return-void
.end method

.method constructor <init>(Lcom/vk/sharing/GroupSearchPresenter;Lcom/vk/sharing/target/Target;)V
    .locals 3
    .param p1, "presenter"    # Lcom/vk/sharing/GroupSearchPresenter;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "target"    # Lcom/vk/sharing/target/Target;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    const/4 v2, 0x0

    .line 33
    invoke-direct {p0, p1}, Lcom/vk/sharing/BasePresenter;-><init>(Lcom/vk/sharing/BasePresenter;)V

    .line 35
    iget-object v0, p0, Lcom/vk/sharing/GroupPostPresenter;->view:Lcom/vk/sharing/view/SharingView;

    invoke-static {v0}, Lcom/vk/sharing/KitKatTransitions;->run(Landroid/view/ViewGroup;)V

    .line 37
    if-eqz p2, :cond_0

    .line 38
    iget-object v0, p0, Lcom/vk/sharing/GroupPostPresenter;->targets:Lcom/vk/sharing/target/Targets;

    invoke-virtual {v0, p2}, Lcom/vk/sharing/target/Targets;->toggleGroupSelection(Lcom/vk/sharing/target/Target;)Z

    .line 40
    :cond_0
    iget-object v0, p0, Lcom/vk/sharing/GroupPostPresenter;->targets:Lcom/vk/sharing/target/Targets;

    invoke-virtual {v0, v2}, Lcom/vk/sharing/target/Targets;->setSearchResultTargets(Ljava/util/ArrayList;)V

    .line 41
    iget-object v0, p0, Lcom/vk/sharing/GroupPostPresenter;->targets:Lcom/vk/sharing/target/Targets;

    const-string/jumbo v1, ""

    invoke-virtual {v0, v1}, Lcom/vk/sharing/target/Targets;->setQuery(Ljava/lang/String;)V

    .line 43
    iget-object v0, p0, Lcom/vk/sharing/GroupPostPresenter;->view:Lcom/vk/sharing/view/SharingView;

    invoke-virtual {v0}, Lcom/vk/sharing/view/SharingView;->showHeaderCommon()V

    .line 44
    iget-object v0, p0, Lcom/vk/sharing/GroupPostPresenter;->view:Lcom/vk/sharing/view/SharingView;

    invoke-virtual {v0}, Lcom/vk/sharing/view/SharingView;->showHeaderSearchButton()V

    .line 45
    iget-object v0, p0, Lcom/vk/sharing/GroupPostPresenter;->view:Lcom/vk/sharing/view/SharingView;

    invoke-virtual {v0, v2}, Lcom/vk/sharing/view/SharingView;->setSearchQuery(Ljava/lang/String;)V

    .line 46
    invoke-direct {p0}, Lcom/vk/sharing/GroupPostPresenter;->init()V

    .line 47
    return-void
.end method

.method private init()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 50
    iget-object v0, p0, Lcom/vk/sharing/GroupPostPresenter;->view:Lcom/vk/sharing/view/SharingView;

    invoke-virtual {v0}, Lcom/vk/sharing/view/SharingView;->showHeaderBackButton()V

    .line 51
    iget-object v0, p0, Lcom/vk/sharing/GroupPostPresenter;->view:Lcom/vk/sharing/view/SharingView;

    const v1, 0x7f080685

    new-array v2, v3, [Ljava/lang/Object;

    invoke-virtual {p0, v1, v2}, Lcom/vk/sharing/GroupPostPresenter;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/sharing/view/SharingView;->setTitle(Ljava/lang/String;)V

    .line 52
    iget-object v0, p0, Lcom/vk/sharing/GroupPostPresenter;->view:Lcom/vk/sharing/view/SharingView;

    const v1, 0x7f080672

    new-array v2, v3, [Ljava/lang/Object;

    invoke-virtual {p0, v1, v2}, Lcom/vk/sharing/GroupPostPresenter;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/sharing/view/SharingView;->setEmptyText(Ljava/lang/String;)V

    .line 53
    iget-object v0, p0, Lcom/vk/sharing/GroupPostPresenter;->view:Lcom/vk/sharing/view/SharingView;

    const v1, 0x7f080674

    new-array v2, v3, [Ljava/lang/Object;

    invoke-virtual {p0, v1, v2}, Lcom/vk/sharing/GroupPostPresenter;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/sharing/view/SharingView;->setErrorMessage(Ljava/lang/String;)V

    .line 54
    iget-object v0, p0, Lcom/vk/sharing/GroupPostPresenter;->view:Lcom/vk/sharing/view/SharingView;

    invoke-virtual {v0}, Lcom/vk/sharing/view/SharingView;->showFooterSend()V

    .line 55
    iget-object v0, p0, Lcom/vk/sharing/GroupPostPresenter;->view:Lcom/vk/sharing/view/SharingView;

    iget-object v1, p0, Lcom/vk/sharing/GroupPostPresenter;->targets:Lcom/vk/sharing/target/Targets;

    invoke-virtual {v1}, Lcom/vk/sharing/target/Targets;->getGroupTargets()Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/sharing/view/SharingView;->setTargets(Ljava/util/List;)V

    .line 56
    iget-object v0, p0, Lcom/vk/sharing/GroupPostPresenter;->targets:Lcom/vk/sharing/target/Targets;

    invoke-virtual {v0}, Lcom/vk/sharing/target/Targets;->isGroupsLoaded()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 57
    iget-object v0, p0, Lcom/vk/sharing/GroupPostPresenter;->targets:Lcom/vk/sharing/target/Targets;

    invoke-virtual {v0}, Lcom/vk/sharing/target/Targets;->getGroupTargets()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 58
    iget-object v0, p0, Lcom/vk/sharing/GroupPostPresenter;->view:Lcom/vk/sharing/view/SharingView;

    invoke-virtual {v0}, Lcom/vk/sharing/view/SharingView;->hideHeaderSearchButton()V

    .line 59
    iget-object v0, p0, Lcom/vk/sharing/GroupPostPresenter;->view:Lcom/vk/sharing/view/SharingView;

    invoke-virtual {v0}, Lcom/vk/sharing/view/SharingView;->disableSendFooter()V

    .line 64
    :goto_0
    iget-object v0, p0, Lcom/vk/sharing/GroupPostPresenter;->view:Lcom/vk/sharing/view/SharingView;

    invoke-virtual {v0}, Lcom/vk/sharing/view/SharingView;->showList()V

    .line 72
    :cond_0
    :goto_1
    invoke-direct {p0}, Lcom/vk/sharing/GroupPostPresenter;->updateSubtitle()V

    .line 73
    invoke-direct {p0}, Lcom/vk/sharing/GroupPostPresenter;->updateCounter()V

    .line 74
    return-void

    .line 61
    :cond_1
    iget-object v0, p0, Lcom/vk/sharing/GroupPostPresenter;->view:Lcom/vk/sharing/view/SharingView;

    invoke-virtual {v0}, Lcom/vk/sharing/view/SharingView;->showHeaderSearchButton()V

    .line 62
    iget-object v0, p0, Lcom/vk/sharing/GroupPostPresenter;->view:Lcom/vk/sharing/view/SharingView;

    invoke-virtual {v0}, Lcom/vk/sharing/view/SharingView;->enableSendFooter()V

    goto :goto_0

    .line 66
    :cond_2
    iget-object v0, p0, Lcom/vk/sharing/GroupPostPresenter;->view:Lcom/vk/sharing/view/SharingView;

    invoke-virtual {v0}, Lcom/vk/sharing/view/SharingView;->showLoading()V

    .line 67
    iget-object v0, p0, Lcom/vk/sharing/GroupPostPresenter;->view:Lcom/vk/sharing/view/SharingView;

    invoke-virtual {v0}, Lcom/vk/sharing/view/SharingView;->disableSendFooter()V

    .line 68
    iget-object v0, p0, Lcom/vk/sharing/GroupPostPresenter;->targetsLoader:Lcom/vk/sharing/target/TargetsLoader;

    invoke-virtual {v0}, Lcom/vk/sharing/target/TargetsLoader;->isLoadingGroups()Z

    move-result v0

    if-nez v0, :cond_0

    .line 69
    iget-object v0, p0, Lcom/vk/sharing/GroupPostPresenter;->targetsLoader:Lcom/vk/sharing/target/TargetsLoader;

    invoke-virtual {v0}, Lcom/vk/sharing/target/TargetsLoader;->loadGroups()V

    goto :goto_1
.end method

.method private updateCounter()V
    .locals 3

    .prologue
    .line 153
    iget-object v1, p0, Lcom/vk/sharing/GroupPostPresenter;->targets:Lcom/vk/sharing/target/Targets;

    invoke-virtual {v1}, Lcom/vk/sharing/target/Targets;->getSelectedTargetsSize()I

    move-result v0

    .line 154
    .local v0, "selectedSize":I
    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 155
    iget-object v1, p0, Lcom/vk/sharing/GroupPostPresenter;->view:Lcom/vk/sharing/view/SharingView;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/vk/sharing/view/SharingView;->setSendButtonCount(I)V

    .line 159
    :goto_0
    return-void

    .line 157
    :cond_0
    iget-object v1, p0, Lcom/vk/sharing/GroupPostPresenter;->view:Lcom/vk/sharing/view/SharingView;

    invoke-virtual {v1, v0}, Lcom/vk/sharing/view/SharingView;->setSendButtonCount(I)V

    goto :goto_0
.end method

.method private updateSubtitle()V
    .locals 9

    .prologue
    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 131
    iget-object v2, p0, Lcom/vk/sharing/GroupPostPresenter;->targets:Lcom/vk/sharing/target/Targets;

    invoke-virtual {v2}, Lcom/vk/sharing/target/Targets;->getSelectedTargets()Ljava/util/List;

    move-result-object v1

    .line 132
    .local v1, "selectedTargets":Ljava/util/List;, "Ljava/util/List<Lcom/vk/sharing/target/Target;>;"
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v0

    .line 133
    .local v0, "selectedSize":I
    packed-switch v0, :pswitch_data_0

    .line 144
    iget-object v3, p0, Lcom/vk/sharing/GroupPostPresenter;->view:Lcom/vk/sharing/view/SharingView;

    const v4, 0x7f080682

    const/4 v2, 0x2

    new-array v5, v2, [Ljava/lang/Object;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 146
    invoke-interface {v1, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vk/sharing/target/Target;

    iget-object v2, v2, Lcom/vk/sharing/target/Target;->name:Ljava/lang/String;

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v6, ", "

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-interface {v1, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vk/sharing/target/Target;

    iget-object v2, v2, Lcom/vk/sharing/target/Target;->name:Ljava/lang/String;

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v5, v7

    add-int/lit8 v2, v0, -0x2

    .line 147
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v5, v8

    .line 144
    invoke-virtual {p0, v4, v5}, Lcom/vk/sharing/GroupPostPresenter;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Lcom/vk/sharing/view/SharingView;->setSubtitle(Ljava/lang/String;)V

    .line 150
    :goto_0
    return-void

    .line 135
    :pswitch_0
    iget-object v2, p0, Lcom/vk/sharing/GroupPostPresenter;->view:Lcom/vk/sharing/view/SharingView;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/vk/sharing/view/SharingView;->setSubtitle(Ljava/lang/String;)V

    goto :goto_0

    .line 138
    :pswitch_1
    iget-object v3, p0, Lcom/vk/sharing/GroupPostPresenter;->view:Lcom/vk/sharing/view/SharingView;

    invoke-interface {v1, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vk/sharing/target/Target;

    iget-object v2, v2, Lcom/vk/sharing/target/Target;->name:Ljava/lang/String;

    invoke-virtual {v3, v2}, Lcom/vk/sharing/view/SharingView;->setSubtitle(Ljava/lang/String;)V

    goto :goto_0

    .line 141
    :pswitch_2
    iget-object v3, p0, Lcom/vk/sharing/GroupPostPresenter;->view:Lcom/vk/sharing/view/SharingView;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {v1, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vk/sharing/target/Target;

    iget-object v2, v2, Lcom/vk/sharing/target/Target;->name:Ljava/lang/String;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v4, ", "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-interface {v1, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vk/sharing/target/Target;

    iget-object v2, v2, Lcom/vk/sharing/target/Target;->name:Ljava/lang/String;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Lcom/vk/sharing/view/SharingView;->setSubtitle(Ljava/lang/String;)V

    goto :goto_0

    .line 133
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method


# virtual methods
.method public onBackClick()V
    .locals 2

    .prologue
    .line 96
    iget-object v0, p0, Lcom/vk/sharing/GroupPostPresenter;->context:Lcom/vk/sharing/BasePresenter$DelegateContext;

    new-instance v1, Lcom/vk/sharing/CommonPresenter;

    invoke-direct {v1, p0}, Lcom/vk/sharing/CommonPresenter;-><init>(Lcom/vk/sharing/GroupPostPresenter;)V

    invoke-interface {v0, v1}, Lcom/vk/sharing/BasePresenter$DelegateContext;->setNextPresenter(Lcom/vk/sharing/BasePresenter;)V

    .line 97
    return-void
.end method

.method public onGroupLoadingCompleted(Ljava/util/ArrayList;)V
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
    .line 118
    .local p1, "targets":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/sharing/target/Target;>;"
    invoke-super {p0, p1}, Lcom/vk/sharing/BasePresenter;->onGroupLoadingCompleted(Ljava/util/ArrayList;)V

    .line 119
    iget-object v0, p0, Lcom/vk/sharing/GroupPostPresenter;->view:Lcom/vk/sharing/view/SharingView;

    iget-object v1, p0, Lcom/vk/sharing/GroupPostPresenter;->targets:Lcom/vk/sharing/target/Targets;

    invoke-virtual {v1}, Lcom/vk/sharing/target/Targets;->getGroupTargets()Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/sharing/view/SharingView;->setTargets(Ljava/util/List;)V

    .line 120
    iget-object v0, p0, Lcom/vk/sharing/GroupPostPresenter;->targets:Lcom/vk/sharing/target/Targets;

    invoke-virtual {v0}, Lcom/vk/sharing/target/Targets;->getGroupTargets()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 121
    iget-object v0, p0, Lcom/vk/sharing/GroupPostPresenter;->view:Lcom/vk/sharing/view/SharingView;

    invoke-virtual {v0}, Lcom/vk/sharing/view/SharingView;->hideHeaderSearchButton()V

    .line 122
    iget-object v0, p0, Lcom/vk/sharing/GroupPostPresenter;->view:Lcom/vk/sharing/view/SharingView;

    invoke-virtual {v0}, Lcom/vk/sharing/view/SharingView;->disableSendFooter()V

    .line 127
    :goto_0
    iget-object v0, p0, Lcom/vk/sharing/GroupPostPresenter;->view:Lcom/vk/sharing/view/SharingView;

    invoke-virtual {v0}, Lcom/vk/sharing/view/SharingView;->showList()V

    .line 128
    return-void

    .line 124
    :cond_0
    iget-object v0, p0, Lcom/vk/sharing/GroupPostPresenter;->view:Lcom/vk/sharing/view/SharingView;

    invoke-virtual {v0}, Lcom/vk/sharing/view/SharingView;->showHeaderSearchButton()V

    .line 125
    iget-object v0, p0, Lcom/vk/sharing/GroupPostPresenter;->view:Lcom/vk/sharing/view/SharingView;

    invoke-virtual {v0}, Lcom/vk/sharing/view/SharingView;->enableSendFooter()V

    goto :goto_0
.end method

.method public onListItemClick(Lcom/vk/sharing/target/Target;I)V
    .locals 2
    .param p1, "target"    # Lcom/vk/sharing/target/Target;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "position"    # I

    .prologue
    .line 106
    iget-object v1, p0, Lcom/vk/sharing/GroupPostPresenter;->targets:Lcom/vk/sharing/target/Targets;

    invoke-virtual {v1}, Lcom/vk/sharing/target/Targets;->getSelectedTargetsSize()I

    move-result v0

    .line 107
    .local v0, "prevSelectedSize":I
    if-eqz v0, :cond_0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    iget-object v1, p0, Lcom/vk/sharing/GroupPostPresenter;->targets:Lcom/vk/sharing/target/Targets;

    invoke-virtual {v1, p1}, Lcom/vk/sharing/target/Targets;->isTargetSelected(Lcom/vk/sharing/target/Target;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 108
    :cond_0
    iget-object v1, p0, Lcom/vk/sharing/GroupPostPresenter;->view:Lcom/vk/sharing/view/SharingView;

    invoke-static {v1}, Lcom/vk/sharing/KitKatTransitions;->run(Landroid/view/ViewGroup;)V

    .line 110
    :cond_1
    iget-object v1, p0, Lcom/vk/sharing/GroupPostPresenter;->targets:Lcom/vk/sharing/target/Targets;

    invoke-virtual {v1, p1}, Lcom/vk/sharing/target/Targets;->toggleSelection(Lcom/vk/sharing/target/Target;)Z

    .line 111
    iget-object v1, p0, Lcom/vk/sharing/GroupPostPresenter;->view:Lcom/vk/sharing/view/SharingView;

    invoke-virtual {v1, p2}, Lcom/vk/sharing/view/SharingView;->updateTargetAtPosition(I)V

    .line 112
    invoke-direct {p0}, Lcom/vk/sharing/GroupPostPresenter;->updateSubtitle()V

    .line 113
    invoke-direct {p0}, Lcom/vk/sharing/GroupPostPresenter;->updateCounter()V

    .line 114
    return-void
.end method

.method public onRetryClick()V
    .locals 1

    .prologue
    .line 88
    iget-object v0, p0, Lcom/vk/sharing/GroupPostPresenter;->targetsLoader:Lcom/vk/sharing/target/TargetsLoader;

    invoke-virtual {v0}, Lcom/vk/sharing/target/TargetsLoader;->isLoadingGroups()Z

    move-result v0

    if-nez v0, :cond_0

    .line 89
    iget-object v0, p0, Lcom/vk/sharing/GroupPostPresenter;->targetsLoader:Lcom/vk/sharing/target/TargetsLoader;

    invoke-virtual {v0}, Lcom/vk/sharing/target/TargetsLoader;->loadGroups()V

    .line 90
    iget-object v0, p0, Lcom/vk/sharing/GroupPostPresenter;->view:Lcom/vk/sharing/view/SharingView;

    invoke-virtual {v0}, Lcom/vk/sharing/view/SharingView;->showLoading()V

    .line 92
    :cond_0
    return-void
.end method

.method public onSearchClick()V
    .locals 2

    .prologue
    .line 101
    iget-object v0, p0, Lcom/vk/sharing/GroupPostPresenter;->context:Lcom/vk/sharing/BasePresenter$DelegateContext;

    new-instance v1, Lcom/vk/sharing/GroupSearchPresenter;

    invoke-direct {v1, p0}, Lcom/vk/sharing/GroupSearchPresenter;-><init>(Lcom/vk/sharing/GroupPostPresenter;)V

    invoke-interface {v0, v1}, Lcom/vk/sharing/BasePresenter$DelegateContext;->setNextPresenter(Lcom/vk/sharing/BasePresenter;)V

    .line 102
    return-void
.end method

.method public onSendClick()V
    .locals 3

    .prologue
    .line 78
    iget-object v0, p0, Lcom/vk/sharing/GroupPostPresenter;->targets:Lcom/vk/sharing/target/Targets;

    invoke-virtual {v0}, Lcom/vk/sharing/target/Targets;->getSelectedTargetsSize()I

    move-result v0

    if-eqz v0, :cond_0

    .line 79
    iget-object v0, p0, Lcom/vk/sharing/GroupPostPresenter;->context:Lcom/vk/sharing/BasePresenter$DelegateContext;

    iget-object v1, p0, Lcom/vk/sharing/GroupPostPresenter;->view:Lcom/vk/sharing/view/SharingView;

    invoke-virtual {v1}, Lcom/vk/sharing/view/SharingView;->getCommentText()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/vk/sharing/GroupPostPresenter;->targets:Lcom/vk/sharing/target/Targets;

    invoke-virtual {v2}, Lcom/vk/sharing/target/Targets;->getSelectedTargets()Ljava/util/List;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/vk/sharing/BasePresenter$DelegateContext;->repost(Ljava/lang/String;Ljava/util/Collection;)V

    .line 80
    iget-object v0, p0, Lcom/vk/sharing/GroupPostPresenter;->view:Lcom/vk/sharing/view/SharingView;

    invoke-virtual {v0}, Lcom/vk/sharing/view/SharingView;->hide()V

    .line 84
    :goto_0
    return-void

    .line 82
    :cond_0
    const v0, 0x7f080686

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-virtual {p0, v0, v1}, Lcom/vk/sharing/GroupPostPresenter;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/vk/core/util/ToastUtils;->showToast(Ljava/lang/String;)V

    goto :goto_0
.end method
