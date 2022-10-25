.class public Lcom/vk/sharing/GroupPickerPresenter;
.super Lcom/vk/sharing/BasePresenter;
.source "GroupPickerPresenter.java"


# instance fields
.field private groupPickerInfo:Lcom/vk/sharing/picker/GroupPickerInfo;


# direct methods
.method constructor <init>(Lcom/vk/sharing/BasePresenter$DelegateContext;)V
    .locals 1
    .param p1, "context"    # Lcom/vk/sharing/BasePresenter$DelegateContext;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 25
    invoke-direct {p0, p1}, Lcom/vk/sharing/BasePresenter;-><init>(Lcom/vk/sharing/BasePresenter$DelegateContext;)V

    .line 27
    invoke-interface {p1}, Lcom/vk/sharing/BasePresenter$DelegateContext;->getGroupPickerInfo()Lcom/vk/sharing/picker/GroupPickerInfo;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/sharing/GroupPickerPresenter;->groupPickerInfo:Lcom/vk/sharing/picker/GroupPickerInfo;

    .line 29
    iget-object v0, p0, Lcom/vk/sharing/GroupPickerPresenter;->view:Lcom/vk/sharing/view/SharingView;

    invoke-virtual {v0}, Lcom/vk/sharing/view/SharingView;->show()V

    .line 31
    invoke-direct {p0}, Lcom/vk/sharing/GroupPickerPresenter;->init()V

    .line 32
    return-void
.end method

.method private createItIsYouTarget()Lcom/vk/sharing/target/Target;
    .locals 4

    .prologue
    .line 129
    new-instance v0, Lcom/vkontakte/android/UserProfile;

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v2

    invoke-direct {v0, v2}, Lcom/vkontakte/android/UserProfile;-><init>(Lcom/vkontakte/android/auth/VKAccount;)V

    .line 130
    .local v0, "currentUser":Lcom/vkontakte/android/UserProfile;
    new-instance v1, Lcom/vk/sharing/target/Target;

    invoke-direct {v1, v0}, Lcom/vk/sharing/target/Target;-><init>(Lcom/vkontakte/android/UserProfile;)V

    .line 131
    .local v1, "target":Lcom/vk/sharing/target/Target;
    const v2, 0x7f080172

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {p0, v2, v3}, Lcom/vk/sharing/GroupPickerPresenter;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/vk/sharing/target/Target;->name:Ljava/lang/String;

    .line 133
    return-object v1
.end method

.method private getTargetById(Ljava/util/ArrayList;I)Lcom/vk/sharing/target/Target;
    .locals 2
    .param p2, "id"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vk/sharing/target/Target;",
            ">;I)",
            "Lcom/vk/sharing/target/Target;"
        }
    .end annotation

    .prologue
    .line 118
    .local p1, "targets":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/sharing/target/Target;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 119
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vk/sharing/target/Target;

    iget v1, v1, Lcom/vk/sharing/target/Target;->id:I

    if-ne v1, p2, :cond_0

    .line 120
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vk/sharing/target/Target;

    .line 124
    :goto_1
    return-object v1

    .line 118
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 124
    :cond_1
    const/4 v1, 0x0

    goto :goto_1
.end method

.method private init()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 36
    iget-object v0, p0, Lcom/vk/sharing/GroupPickerPresenter;->view:Lcom/vk/sharing/view/SharingView;

    const v1, 0x7f080160

    new-array v2, v3, [Ljava/lang/Object;

    invoke-virtual {p0, v1, v2}, Lcom/vk/sharing/GroupPickerPresenter;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/sharing/view/SharingView;->setTitle(Ljava/lang/String;)V

    .line 37
    iget-object v0, p0, Lcom/vk/sharing/GroupPickerPresenter;->view:Lcom/vk/sharing/view/SharingView;

    invoke-virtual {v0}, Lcom/vk/sharing/view/SharingView;->hideHeaderSearchButton()V

    .line 38
    iget-object v0, p0, Lcom/vk/sharing/GroupPickerPresenter;->view:Lcom/vk/sharing/view/SharingView;

    const v1, 0x7f080672

    new-array v2, v3, [Ljava/lang/Object;

    invoke-virtual {p0, v1, v2}, Lcom/vk/sharing/GroupPickerPresenter;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/sharing/view/SharingView;->setEmptyText(Ljava/lang/String;)V

    .line 39
    iget-object v0, p0, Lcom/vk/sharing/GroupPickerPresenter;->view:Lcom/vk/sharing/view/SharingView;

    const v1, 0x7f080674

    new-array v2, v3, [Ljava/lang/Object;

    invoke-virtual {p0, v1, v2}, Lcom/vk/sharing/GroupPickerPresenter;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/sharing/view/SharingView;->setErrorMessage(Ljava/lang/String;)V

    .line 41
    iget-object v0, p0, Lcom/vk/sharing/GroupPickerPresenter;->view:Lcom/vk/sharing/view/SharingView;

    invoke-virtual {v0}, Lcom/vk/sharing/view/SharingView;->showFooterCancel()V

    .line 43
    iget-object v0, p0, Lcom/vk/sharing/GroupPickerPresenter;->targets:Lcom/vk/sharing/target/Targets;

    invoke-virtual {v0}, Lcom/vk/sharing/target/Targets;->isGroupsLoaded()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 44
    iget-object v0, p0, Lcom/vk/sharing/GroupPickerPresenter;->view:Lcom/vk/sharing/view/SharingView;

    iget-object v1, p0, Lcom/vk/sharing/GroupPickerPresenter;->targets:Lcom/vk/sharing/target/Targets;

    invoke-virtual {v1}, Lcom/vk/sharing/target/Targets;->getGroupTargets()Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/sharing/view/SharingView;->setTargets(Ljava/util/List;)V

    .line 45
    iget-object v0, p0, Lcom/vk/sharing/GroupPickerPresenter;->view:Lcom/vk/sharing/view/SharingView;

    invoke-virtual {v0}, Lcom/vk/sharing/view/SharingView;->showList()V

    .line 53
    :cond_0
    :goto_0
    return-void

    .line 48
    :cond_1
    iget-object v0, p0, Lcom/vk/sharing/GroupPickerPresenter;->view:Lcom/vk/sharing/view/SharingView;

    invoke-virtual {v0}, Lcom/vk/sharing/view/SharingView;->showLoading()V

    .line 49
    iget-object v0, p0, Lcom/vk/sharing/GroupPickerPresenter;->targetsLoader:Lcom/vk/sharing/target/TargetsLoader;

    invoke-virtual {v0}, Lcom/vk/sharing/target/TargetsLoader;->isLoadingGroups()Z

    move-result v0

    if-nez v0, :cond_0

    .line 50
    invoke-direct {p0}, Lcom/vk/sharing/GroupPickerPresenter;->loadGroups()V

    goto :goto_0
.end method

.method private loadGroups()V
    .locals 2

    .prologue
    .line 56
    iget-object v0, p0, Lcom/vk/sharing/GroupPickerPresenter;->targetsLoader:Lcom/vk/sharing/target/TargetsLoader;

    iget-object v1, p0, Lcom/vk/sharing/GroupPickerPresenter;->groupPickerInfo:Lcom/vk/sharing/picker/GroupPickerInfo;

    iget v1, v1, Lcom/vk/sharing/picker/GroupPickerInfo;->adminedGroupId:I

    invoke-virtual {v0, v1}, Lcom/vk/sharing/target/TargetsLoader;->loadGroupsForImpersonation(I)V

    .line 57
    return-void
.end method

.method private prepateTargets(Ljava/util/ArrayList;)Ljava/util/ArrayList;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vk/sharing/target/Target;",
            ">;)",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vk/sharing/target/Target;",
            ">;"
        }
    .end annotation

    .prologue
    .local p1, "targets":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/sharing/target/Target;>;"
    const/4 v8, 0x1

    .line 71
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 74
    .local v2, "orderedTargets":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/sharing/target/Target;>;"
    invoke-direct {p0}, Lcom/vk/sharing/GroupPickerPresenter;->createItIsYouTarget()Lcom/vk/sharing/target/Target;

    move-result-object v1

    .line 75
    .local v1, "itIsYouTarget":Lcom/vk/sharing/target/Target;
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 79
    iget-object v6, p0, Lcom/vk/sharing/GroupPickerPresenter;->groupPickerInfo:Lcom/vk/sharing/picker/GroupPickerInfo;

    iget v6, v6, Lcom/vk/sharing/picker/GroupPickerInfo;->preselectedGroupId:I

    iget-object v7, p0, Lcom/vk/sharing/GroupPickerPresenter;->groupPickerInfo:Lcom/vk/sharing/picker/GroupPickerInfo;

    iget v7, v7, Lcom/vk/sharing/picker/GroupPickerInfo;->adminedGroupId:I

    if-eq v6, v7, :cond_0

    iget-object v6, p0, Lcom/vk/sharing/GroupPickerPresenter;->groupPickerInfo:Lcom/vk/sharing/picker/GroupPickerInfo;

    iget v6, v6, Lcom/vk/sharing/picker/GroupPickerInfo;->preselectedGroupId:I

    if-lez v6, :cond_0

    .line 80
    iget-object v6, p0, Lcom/vk/sharing/GroupPickerPresenter;->groupPickerInfo:Lcom/vk/sharing/picker/GroupPickerInfo;

    iget v6, v6, Lcom/vk/sharing/picker/GroupPickerInfo;->preselectedGroupId:I

    invoke-direct {p0, p1, v6}, Lcom/vk/sharing/GroupPickerPresenter;->getTargetById(Ljava/util/ArrayList;I)Lcom/vk/sharing/target/Target;

    move-result-object v3

    .line 81
    .local v3, "preselectedTarget":Lcom/vk/sharing/target/Target;
    invoke-virtual {p1, v3}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 82
    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 87
    .end local v3    # "preselectedTarget":Lcom/vk/sharing/target/Target;
    :cond_0
    iget-object v6, p0, Lcom/vk/sharing/GroupPickerPresenter;->groupPickerInfo:Lcom/vk/sharing/picker/GroupPickerInfo;

    iget v6, v6, Lcom/vk/sharing/picker/GroupPickerInfo;->adminedGroupId:I

    invoke-direct {p0, p1, v6}, Lcom/vk/sharing/GroupPickerPresenter;->getTargetById(Ljava/util/ArrayList;I)Lcom/vk/sharing/target/Target;

    move-result-object v0

    .line 88
    .local v0, "adminedTarget":Lcom/vk/sharing/target/Target;
    if-eqz v0, :cond_1

    .line 89
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 90
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 93
    :cond_1
    iget-object v6, p0, Lcom/vk/sharing/GroupPickerPresenter;->groupPickerInfo:Lcom/vk/sharing/picker/GroupPickerInfo;

    iget-boolean v6, v6, Lcom/vk/sharing/picker/GroupPickerInfo;->restrictToAdminedGroup:Z

    if-nez v6, :cond_3

    .line 96
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_2
    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_3

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vk/sharing/target/Target;

    .line 98
    .local v4, "target":Lcom/vk/sharing/target/Target;
    invoke-virtual {v4}, Lcom/vk/sharing/target/Target;->getIsPrivate()Z

    move-result v7

    if-nez v7, :cond_2

    .line 102
    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 106
    .end local v4    # "target":Lcom/vk/sharing/target/Target;
    :cond_3
    iget-object v6, p0, Lcom/vk/sharing/GroupPickerPresenter;->groupPickerInfo:Lcom/vk/sharing/picker/GroupPickerInfo;

    iget v6, v6, Lcom/vk/sharing/picker/GroupPickerInfo;->preselectedGroupId:I

    invoke-direct {p0, v2, v6}, Lcom/vk/sharing/GroupPickerPresenter;->getTargetById(Ljava/util/ArrayList;I)Lcom/vk/sharing/target/Target;

    move-result-object v5

    .line 107
    .local v5, "toBeSelected":Lcom/vk/sharing/target/Target;
    if-eqz v5, :cond_4

    .line 108
    iput-boolean v8, v5, Lcom/vk/sharing/target/Target;->selected:Z

    .line 114
    :goto_1
    return-object v2

    .line 111
    :cond_4
    iput-boolean v8, v1, Lcom/vk/sharing/target/Target;->selected:Z

    goto :goto_1
.end method


# virtual methods
.method public bridge synthetic onActionClick(I)V
    .locals 0

    .prologue
    .line 20
    invoke-super {p0, p1}, Lcom/vk/sharing/BasePresenter;->onActionClick(I)V

    return-void
.end method

.method public bridge synthetic onBackClick()V
    .locals 0

    .prologue
    .line 20
    invoke-super {p0}, Lcom/vk/sharing/BasePresenter;->onBackClick()V

    return-void
.end method

.method public bridge synthetic onClearClick()V
    .locals 0

    .prologue
    .line 20
    invoke-super {p0}, Lcom/vk/sharing/BasePresenter;->onClearClick()V

    return-void
.end method

.method public bridge synthetic onDialogLoadingCompleted(Ljava/util/ArrayList;)V
    .locals 0
    .param p1    # Ljava/util/ArrayList;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CallSuper;
    .end annotation

    .prologue
    .line 20
    invoke-super {p0, p1}, Lcom/vk/sharing/BasePresenter;->onDialogLoadingCompleted(Ljava/util/ArrayList;)V

    return-void
.end method

.method public bridge synthetic onDialogSearchingCompleted(Ljava/util/ArrayList;)V
    .locals 0
    .param p1    # Ljava/util/ArrayList;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CallSuper;
    .end annotation

    .prologue
    .line 20
    invoke-super {p0, p1}, Lcom/vk/sharing/BasePresenter;->onDialogSearchingCompleted(Ljava/util/ArrayList;)V

    return-void
.end method

.method public bridge synthetic onDialogSearchingFailed()V
    .locals 0

    .prologue
    .line 20
    invoke-super {p0}, Lcom/vk/sharing/BasePresenter;->onDialogSearchingFailed()V

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
    .line 61
    .local p1, "targets":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/sharing/target/Target;>;"
    invoke-direct {p0, p1}, Lcom/vk/sharing/GroupPickerPresenter;->prepateTargets(Ljava/util/ArrayList;)Ljava/util/ArrayList;

    move-result-object p1

    .line 63
    invoke-super {p0, p1}, Lcom/vk/sharing/BasePresenter;->onGroupLoadingCompleted(Ljava/util/ArrayList;)V

    .line 65
    iget-object v0, p0, Lcom/vk/sharing/GroupPickerPresenter;->view:Lcom/vk/sharing/view/SharingView;

    iget-object v1, p0, Lcom/vk/sharing/GroupPickerPresenter;->targets:Lcom/vk/sharing/target/Targets;

    invoke-virtual {v1}, Lcom/vk/sharing/target/Targets;->getGroupTargets()Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/sharing/view/SharingView;->setTargets(Ljava/util/List;)V

    .line 67
    iget-object v0, p0, Lcom/vk/sharing/GroupPickerPresenter;->view:Lcom/vk/sharing/view/SharingView;

    invoke-virtual {v0}, Lcom/vk/sharing/view/SharingView;->showList()V

    .line 68
    return-void
.end method

.method public bridge synthetic onGroupSearchingCompleted(Ljava/util/ArrayList;)V
    .locals 0
    .param p1    # Ljava/util/ArrayList;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 20
    invoke-super {p0, p1}, Lcom/vk/sharing/BasePresenter;->onGroupSearchingCompleted(Ljava/util/ArrayList;)V

    return-void
.end method

.method public onListItemClick(Lcom/vk/sharing/target/Target;I)V
    .locals 1
    .param p1, "target"    # Lcom/vk/sharing/target/Target;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "position"    # I

    .prologue
    .line 154
    iget-object v0, p0, Lcom/vk/sharing/GroupPickerPresenter;->context:Lcom/vk/sharing/BasePresenter$DelegateContext;

    invoke-interface {v0, p1}, Lcom/vk/sharing/BasePresenter$DelegateContext;->handlePickedTarget(Lcom/vk/sharing/target/Target;)V

    .line 155
    iget-object v0, p0, Lcom/vk/sharing/GroupPickerPresenter;->view:Lcom/vk/sharing/view/SharingView;

    invoke-virtual {v0}, Lcom/vk/sharing/view/SharingView;->hide()V

    .line 156
    return-void
.end method

.method public bridge synthetic onListScrolledToTheEnd()V
    .locals 0

    .prologue
    .line 20
    invoke-super {p0}, Lcom/vk/sharing/BasePresenter;->onListScrolledToTheEnd()V

    return-void
.end method

.method public bridge synthetic onOutsideClick()V
    .locals 0

    .prologue
    .line 20
    invoke-super {p0}, Lcom/vk/sharing/BasePresenter;->onOutsideClick()V

    return-void
.end method

.method public onRetryClick()V
    .locals 1

    .prologue
    .line 138
    iget-object v0, p0, Lcom/vk/sharing/GroupPickerPresenter;->targetsLoader:Lcom/vk/sharing/target/TargetsLoader;

    invoke-virtual {v0}, Lcom/vk/sharing/target/TargetsLoader;->isLoadingGroups()Z

    move-result v0

    if-nez v0, :cond_0

    .line 139
    invoke-direct {p0}, Lcom/vk/sharing/GroupPickerPresenter;->loadGroups()V

    .line 140
    iget-object v0, p0, Lcom/vk/sharing/GroupPickerPresenter;->view:Lcom/vk/sharing/view/SharingView;

    invoke-virtual {v0}, Lcom/vk/sharing/view/SharingView;->showLoading()V

    .line 142
    :cond_0
    return-void
.end method

.method public bridge synthetic onSearchClick()V
    .locals 0

    .prologue
    .line 20
    invoke-super {p0}, Lcom/vk/sharing/BasePresenter;->onSearchClick()V

    return-void
.end method

.method public bridge synthetic onSearchInputChanged(Ljava/lang/String;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CallSuper;
    .end annotation

    .prologue
    .line 20
    invoke-super {p0, p1}, Lcom/vk/sharing/BasePresenter;->onSearchInputChanged(Ljava/lang/String;)V

    return-void
.end method

.method public bridge synthetic onSendClick()V
    .locals 0

    .prologue
    .line 20
    invoke-super {p0}, Lcom/vk/sharing/BasePresenter;->onSendClick()V

    return-void
.end method

.method public bridge synthetic onViewShown()V
    .locals 0

    .prologue
    .line 20
    invoke-super {p0}, Lcom/vk/sharing/BasePresenter;->onViewShown()V

    return-void
.end method
