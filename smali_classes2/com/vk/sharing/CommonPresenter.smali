.class final Lcom/vk/sharing/CommonPresenter;
.super Lcom/vk/sharing/BasePresenter;
.source "CommonPresenter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/sharing/CommonPresenter$SendMessageInternalDelegate;,
        Lcom/vk/sharing/CommonPresenter$ActionsInternalDelegate;,
        Lcom/vk/sharing/CommonPresenter$InternalDelegate;
    }
.end annotation


# instance fields
.field private internalDelegate:Lcom/vk/sharing/CommonPresenter$InternalDelegate;


# direct methods
.method constructor <init>(Lcom/vk/sharing/BasePresenter$DelegateContext;)V
    .locals 1
    .param p1, "context"    # Lcom/vk/sharing/BasePresenter$DelegateContext;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 22
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/vk/sharing/CommonPresenter;-><init>(Lcom/vk/sharing/BasePresenter$DelegateContext;Z)V

    .line 23
    return-void
.end method

.method constructor <init>(Lcom/vk/sharing/BasePresenter$DelegateContext;Z)V
    .locals 2
    .param p1, "context"    # Lcom/vk/sharing/BasePresenter$DelegateContext;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "initial"    # Z

    .prologue
    .line 26
    invoke-direct {p0, p1}, Lcom/vk/sharing/BasePresenter;-><init>(Lcom/vk/sharing/BasePresenter$DelegateContext;)V

    .line 28
    if-eqz p2, :cond_0

    .line 29
    iget-object v0, p0, Lcom/vk/sharing/CommonPresenter;->view:Lcom/vk/sharing/view/SharingView;

    invoke-virtual {v0}, Lcom/vk/sharing/view/SharingView;->show()V

    .line 31
    :cond_0
    invoke-direct {p0}, Lcom/vk/sharing/CommonPresenter;->init()V

    .line 32
    iget-object v0, p0, Lcom/vk/sharing/CommonPresenter;->targets:Lcom/vk/sharing/target/Targets;

    invoke-virtual {v0}, Lcom/vk/sharing/target/Targets;->isDialogsLoaded()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 33
    iget-object v0, p0, Lcom/vk/sharing/CommonPresenter;->view:Lcom/vk/sharing/view/SharingView;

    iget-object v1, p0, Lcom/vk/sharing/CommonPresenter;->targets:Lcom/vk/sharing/target/Targets;

    invoke-virtual {v1}, Lcom/vk/sharing/target/Targets;->getDialogTargets()Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/sharing/view/SharingView;->setTargets(Ljava/util/List;)V

    .line 34
    iget-object v0, p0, Lcom/vk/sharing/CommonPresenter;->view:Lcom/vk/sharing/view/SharingView;

    invoke-virtual {v0}, Lcom/vk/sharing/view/SharingView;->showList()V

    .line 44
    :cond_1
    :goto_0
    invoke-direct {p0}, Lcom/vk/sharing/CommonPresenter;->initInternalDelegate()V

    .line 45
    return-void

    .line 36
    :cond_2
    iget-object v0, p0, Lcom/vk/sharing/CommonPresenter;->targetsLoader:Lcom/vk/sharing/target/TargetsLoader;

    invoke-virtual {v0}, Lcom/vk/sharing/target/TargetsLoader;->isLoadingDialogs()Z

    move-result v0

    if-nez v0, :cond_3

    .line 37
    iget-object v0, p0, Lcom/vk/sharing/CommonPresenter;->targetsLoader:Lcom/vk/sharing/target/TargetsLoader;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/vk/sharing/target/TargetsLoader;->loadDialogs(I)V

    .line 39
    :cond_3
    if-nez p2, :cond_1

    .line 40
    iget-object v0, p0, Lcom/vk/sharing/CommonPresenter;->view:Lcom/vk/sharing/view/SharingView;

    invoke-virtual {v0}, Lcom/vk/sharing/view/SharingView;->showLoading()V

    goto :goto_0
.end method

.method constructor <init>(Lcom/vk/sharing/DialogSearchPresenter;Lcom/vk/sharing/target/Target;)V
    .locals 3
    .param p1, "presenter"    # Lcom/vk/sharing/DialogSearchPresenter;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "target"    # Lcom/vk/sharing/target/Target;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    const/4 v2, 0x0

    .line 48
    invoke-direct {p0, p1}, Lcom/vk/sharing/BasePresenter;-><init>(Lcom/vk/sharing/BasePresenter;)V

    .line 50
    iget-object v0, p0, Lcom/vk/sharing/CommonPresenter;->view:Lcom/vk/sharing/view/SharingView;

    invoke-static {v0}, Lcom/vk/sharing/KitKatTransitions;->run(Landroid/view/ViewGroup;)V

    .line 52
    invoke-direct {p0}, Lcom/vk/sharing/CommonPresenter;->init()V

    .line 53
    if-eqz p2, :cond_1

    .line 54
    iget-object v0, p0, Lcom/vk/sharing/CommonPresenter;->targets:Lcom/vk/sharing/target/Targets;

    invoke-virtual {v0, p2}, Lcom/vk/sharing/target/Targets;->containsTarget(Lcom/vk/sharing/target/Target;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 55
    iget-object v0, p0, Lcom/vk/sharing/CommonPresenter;->targets:Lcom/vk/sharing/target/Targets;

    invoke-virtual {v0, p2}, Lcom/vk/sharing/target/Targets;->addTargetToDialogs(Lcom/vk/sharing/target/Target;)V

    .line 57
    :cond_0
    iget-object v0, p0, Lcom/vk/sharing/CommonPresenter;->targets:Lcom/vk/sharing/target/Targets;

    invoke-virtual {v0, p2}, Lcom/vk/sharing/target/Targets;->toggleSelection(Lcom/vk/sharing/target/Target;)Z

    .line 59
    :cond_1
    iget-object v0, p0, Lcom/vk/sharing/CommonPresenter;->targets:Lcom/vk/sharing/target/Targets;

    invoke-virtual {v0, v2}, Lcom/vk/sharing/target/Targets;->setSearchResultTargets(Ljava/util/ArrayList;)V

    .line 60
    iget-object v0, p0, Lcom/vk/sharing/CommonPresenter;->targets:Lcom/vk/sharing/target/Targets;

    const-string/jumbo v1, ""

    invoke-virtual {v0, v1}, Lcom/vk/sharing/target/Targets;->setQuery(Ljava/lang/String;)V

    .line 62
    iget-object v0, p0, Lcom/vk/sharing/CommonPresenter;->view:Lcom/vk/sharing/view/SharingView;

    invoke-virtual {v0}, Lcom/vk/sharing/view/SharingView;->showHeaderCommon()V

    .line 63
    iget-object v0, p0, Lcom/vk/sharing/CommonPresenter;->view:Lcom/vk/sharing/view/SharingView;

    invoke-virtual {v0}, Lcom/vk/sharing/view/SharingView;->hideHeaderBackButton()V

    .line 64
    iget-object v0, p0, Lcom/vk/sharing/CommonPresenter;->view:Lcom/vk/sharing/view/SharingView;

    invoke-virtual {v0}, Lcom/vk/sharing/view/SharingView;->showHeaderSearchButton()V

    .line 65
    iget-object v0, p0, Lcom/vk/sharing/CommonPresenter;->view:Lcom/vk/sharing/view/SharingView;

    invoke-virtual {v0, v2}, Lcom/vk/sharing/view/SharingView;->setSearchQuery(Ljava/lang/String;)V

    .line 66
    iget-object v0, p0, Lcom/vk/sharing/CommonPresenter;->view:Lcom/vk/sharing/view/SharingView;

    iget-object v1, p0, Lcom/vk/sharing/CommonPresenter;->targets:Lcom/vk/sharing/target/Targets;

    invoke-virtual {v1}, Lcom/vk/sharing/target/Targets;->getDialogTargets()Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/sharing/view/SharingView;->setTargets(Ljava/util/List;)V

    .line 67
    iget-object v0, p0, Lcom/vk/sharing/CommonPresenter;->view:Lcom/vk/sharing/view/SharingView;

    invoke-virtual {v0}, Lcom/vk/sharing/view/SharingView;->showList()V

    .line 69
    invoke-direct {p0}, Lcom/vk/sharing/CommonPresenter;->initInternalDelegate()V

    .line 70
    return-void
.end method

.method constructor <init>(Lcom/vk/sharing/GroupPostPresenter;)V
    .locals 2
    .param p1, "presenter"    # Lcom/vk/sharing/GroupPostPresenter;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 89
    invoke-direct {p0, p1}, Lcom/vk/sharing/BasePresenter;-><init>(Lcom/vk/sharing/BasePresenter;)V

    .line 91
    iget-object v0, p0, Lcom/vk/sharing/CommonPresenter;->view:Lcom/vk/sharing/view/SharingView;

    invoke-static {v0}, Lcom/vk/sharing/KitKatTransitions;->run(Landroid/view/ViewGroup;)V

    .line 93
    invoke-direct {p0}, Lcom/vk/sharing/CommonPresenter;->init()V

    .line 94
    iget-object v0, p0, Lcom/vk/sharing/CommonPresenter;->view:Lcom/vk/sharing/view/SharingView;

    invoke-virtual {v0}, Lcom/vk/sharing/view/SharingView;->showHeaderSearchButton()V

    .line 95
    iget-object v0, p0, Lcom/vk/sharing/CommonPresenter;->view:Lcom/vk/sharing/view/SharingView;

    invoke-virtual {v0}, Lcom/vk/sharing/view/SharingView;->hideHeaderBackButton()V

    .line 96
    iget-object v0, p0, Lcom/vk/sharing/CommonPresenter;->targets:Lcom/vk/sharing/target/Targets;

    invoke-virtual {v0}, Lcom/vk/sharing/target/Targets;->clearSelection()V

    .line 97
    iget-object v0, p0, Lcom/vk/sharing/CommonPresenter;->targets:Lcom/vk/sharing/target/Targets;

    invoke-virtual {v0}, Lcom/vk/sharing/target/Targets;->isDialogsLoaded()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 98
    iget-object v0, p0, Lcom/vk/sharing/CommonPresenter;->view:Lcom/vk/sharing/view/SharingView;

    iget-object v1, p0, Lcom/vk/sharing/CommonPresenter;->targets:Lcom/vk/sharing/target/Targets;

    invoke-virtual {v1}, Lcom/vk/sharing/target/Targets;->getDialogTargets()Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/sharing/view/SharingView;->setTargets(Ljava/util/List;)V

    .line 99
    iget-object v0, p0, Lcom/vk/sharing/CommonPresenter;->view:Lcom/vk/sharing/view/SharingView;

    invoke-virtual {v0}, Lcom/vk/sharing/view/SharingView;->showList()V

    .line 107
    :goto_0
    invoke-direct {p0}, Lcom/vk/sharing/CommonPresenter;->initInternalDelegate()V

    .line 108
    return-void

    .line 101
    :cond_0
    iget-object v0, p0, Lcom/vk/sharing/CommonPresenter;->targetsLoader:Lcom/vk/sharing/target/TargetsLoader;

    invoke-virtual {v0}, Lcom/vk/sharing/target/TargetsLoader;->isLoadingDialogs()Z

    move-result v0

    if-nez v0, :cond_1

    .line 102
    iget-object v0, p0, Lcom/vk/sharing/CommonPresenter;->targetsLoader:Lcom/vk/sharing/target/TargetsLoader;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/vk/sharing/target/TargetsLoader;->loadDialogs(I)V

    .line 104
    :cond_1
    iget-object v0, p0, Lcom/vk/sharing/CommonPresenter;->view:Lcom/vk/sharing/view/SharingView;

    invoke-virtual {v0}, Lcom/vk/sharing/view/SharingView;->showLoading()V

    goto :goto_0
.end method

.method constructor <init>(Lcom/vk/sharing/WallPostPresenter;)V
    .locals 2
    .param p1, "delegate"    # Lcom/vk/sharing/WallPostPresenter;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 73
    invoke-direct {p0, p1}, Lcom/vk/sharing/BasePresenter;-><init>(Lcom/vk/sharing/BasePresenter;)V

    .line 75
    iget-object v0, p0, Lcom/vk/sharing/CommonPresenter;->view:Lcom/vk/sharing/view/SharingView;

    invoke-static {v0}, Lcom/vk/sharing/KitKatTransitions;->run(Landroid/view/ViewGroup;)V

    .line 77
    invoke-direct {p0}, Lcom/vk/sharing/CommonPresenter;->init()V

    .line 78
    iget-object v0, p0, Lcom/vk/sharing/CommonPresenter;->view:Lcom/vk/sharing/view/SharingView;

    invoke-virtual {v0}, Lcom/vk/sharing/view/SharingView;->showHeaderSearchButton()V

    .line 79
    iget-object v0, p0, Lcom/vk/sharing/CommonPresenter;->view:Lcom/vk/sharing/view/SharingView;

    invoke-virtual {v0}, Lcom/vk/sharing/view/SharingView;->hideHeaderBackButton()V

    .line 80
    iget-object v0, p0, Lcom/vk/sharing/CommonPresenter;->view:Lcom/vk/sharing/view/SharingView;

    invoke-virtual {v0}, Lcom/vk/sharing/view/SharingView;->showContent()V

    .line 81
    iget-object v0, p0, Lcom/vk/sharing/CommonPresenter;->view:Lcom/vk/sharing/view/SharingView;

    invoke-virtual {v0}, Lcom/vk/sharing/view/SharingView;->hideFooterAttachments()V

    .line 82
    iget-object v0, p0, Lcom/vk/sharing/CommonPresenter;->view:Lcom/vk/sharing/view/SharingView;

    iget-object v1, p0, Lcom/vk/sharing/CommonPresenter;->targets:Lcom/vk/sharing/target/Targets;

    invoke-virtual {v1}, Lcom/vk/sharing/target/Targets;->getDialogTargets()Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/sharing/view/SharingView;->setTargets(Ljava/util/List;)V

    .line 83
    iget-object v0, p0, Lcom/vk/sharing/CommonPresenter;->view:Lcom/vk/sharing/view/SharingView;

    invoke-virtual {v0}, Lcom/vk/sharing/view/SharingView;->showList()V

    .line 85
    invoke-direct {p0}, Lcom/vk/sharing/CommonPresenter;->initInternalDelegate()V

    .line 86
    return-void
.end method

.method static synthetic access$102(Lcom/vk/sharing/CommonPresenter;Lcom/vk/sharing/CommonPresenter$InternalDelegate;)Lcom/vk/sharing/CommonPresenter$InternalDelegate;
    .locals 0
    .param p0, "x0"    # Lcom/vk/sharing/CommonPresenter;
    .param p1, "x1"    # Lcom/vk/sharing/CommonPresenter$InternalDelegate;

    .prologue
    .line 17
    iput-object p1, p0, Lcom/vk/sharing/CommonPresenter;->internalDelegate:Lcom/vk/sharing/CommonPresenter$InternalDelegate;

    return-object p1
.end method

.method private init()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 111
    iget-object v0, p0, Lcom/vk/sharing/CommonPresenter;->view:Lcom/vk/sharing/view/SharingView;

    const v1, 0x7f080683

    new-array v2, v3, [Ljava/lang/Object;

    invoke-virtual {p0, v1, v2}, Lcom/vk/sharing/CommonPresenter;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/sharing/view/SharingView;->setTitle(Ljava/lang/String;)V

    .line 112
    iget-object v0, p0, Lcom/vk/sharing/CommonPresenter;->view:Lcom/vk/sharing/view/SharingView;

    const v1, 0x7f080671

    new-array v2, v3, [Ljava/lang/Object;

    invoke-virtual {p0, v1, v2}, Lcom/vk/sharing/CommonPresenter;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/sharing/view/SharingView;->setEmptyText(Ljava/lang/String;)V

    .line 113
    iget-object v0, p0, Lcom/vk/sharing/CommonPresenter;->view:Lcom/vk/sharing/view/SharingView;

    const v1, 0x7f080673

    new-array v2, v3, [Ljava/lang/Object;

    invoke-virtual {p0, v1, v2}, Lcom/vk/sharing/CommonPresenter;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/sharing/view/SharingView;->setErrorMessage(Ljava/lang/String;)V

    .line 114
    return-void
.end method

.method private initInternalDelegate()V
    .locals 1

    .prologue
    .line 118
    iget-object v0, p0, Lcom/vk/sharing/CommonPresenter;->context:Lcom/vk/sharing/BasePresenter$DelegateContext;

    invoke-interface {v0}, Lcom/vk/sharing/BasePresenter$DelegateContext;->getActionsInfo()Lcom/vk/sharing/action/ActionsInfo;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/sharing/action/ActionsInfo;->canAtLeastOneAction()Z

    move-result v0

    if-nez v0, :cond_0

    .line 122
    new-instance v0, Lcom/vk/sharing/CommonPresenter$SendMessageInternalDelegate;

    invoke-direct {v0, p0}, Lcom/vk/sharing/CommonPresenter$SendMessageInternalDelegate;-><init>(Lcom/vk/sharing/CommonPresenter;)V

    iput-object v0, p0, Lcom/vk/sharing/CommonPresenter;->internalDelegate:Lcom/vk/sharing/CommonPresenter$InternalDelegate;

    .line 135
    :goto_0
    return-void

    .line 127
    :cond_0
    iget-object v0, p0, Lcom/vk/sharing/CommonPresenter;->targets:Lcom/vk/sharing/target/Targets;

    invoke-virtual {v0}, Lcom/vk/sharing/target/Targets;->getSelectedTargetsSize()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 132
    new-instance v0, Lcom/vk/sharing/CommonPresenter$SendMessageInternalDelegate;

    invoke-direct {v0, p0}, Lcom/vk/sharing/CommonPresenter$SendMessageInternalDelegate;-><init>(Lcom/vk/sharing/CommonPresenter;)V

    iput-object v0, p0, Lcom/vk/sharing/CommonPresenter;->internalDelegate:Lcom/vk/sharing/CommonPresenter$InternalDelegate;

    goto :goto_0

    .line 129
    :pswitch_0
    new-instance v0, Lcom/vk/sharing/CommonPresenter$ActionsInternalDelegate;

    invoke-direct {v0, p0}, Lcom/vk/sharing/CommonPresenter$ActionsInternalDelegate;-><init>(Lcom/vk/sharing/CommonPresenter;)V

    iput-object v0, p0, Lcom/vk/sharing/CommonPresenter;->internalDelegate:Lcom/vk/sharing/CommonPresenter$InternalDelegate;

    goto :goto_0

    .line 127
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public onActionClick(I)V
    .locals 2
    .param p1, "action"    # I

    .prologue
    .line 168
    packed-switch p1, :pswitch_data_0

    .line 184
    :goto_0
    return-void

    .line 170
    :pswitch_0
    iget-object v0, p0, Lcom/vk/sharing/CommonPresenter;->context:Lcom/vk/sharing/BasePresenter$DelegateContext;

    new-instance v1, Lcom/vk/sharing/WallPostPresenter;

    invoke-direct {v1, p0}, Lcom/vk/sharing/WallPostPresenter;-><init>(Lcom/vk/sharing/CommonPresenter;)V

    invoke-interface {v0, v1}, Lcom/vk/sharing/BasePresenter$DelegateContext;->setNextPresenter(Lcom/vk/sharing/BasePresenter;)V

    goto :goto_0

    .line 173
    :pswitch_1
    iget-object v0, p0, Lcom/vk/sharing/CommonPresenter;->context:Lcom/vk/sharing/BasePresenter$DelegateContext;

    new-instance v1, Lcom/vk/sharing/GroupPostPresenter;

    invoke-direct {v1, p0}, Lcom/vk/sharing/GroupPostPresenter;-><init>(Lcom/vk/sharing/CommonPresenter;)V

    invoke-interface {v0, v1}, Lcom/vk/sharing/BasePresenter$DelegateContext;->setNextPresenter(Lcom/vk/sharing/BasePresenter;)V

    goto :goto_0

    .line 176
    :pswitch_2
    iget-object v0, p0, Lcom/vk/sharing/CommonPresenter;->context:Lcom/vk/sharing/BasePresenter$DelegateContext;

    invoke-interface {v0}, Lcom/vk/sharing/BasePresenter$DelegateContext;->copyLink()V

    .line 177
    iget-object v0, p0, Lcom/vk/sharing/CommonPresenter;->view:Lcom/vk/sharing/view/SharingView;

    invoke-virtual {v0}, Lcom/vk/sharing/view/SharingView;->hide()V

    goto :goto_0

    .line 180
    :pswitch_3
    iget-object v0, p0, Lcom/vk/sharing/CommonPresenter;->context:Lcom/vk/sharing/BasePresenter$DelegateContext;

    invoke-interface {v0}, Lcom/vk/sharing/BasePresenter$DelegateContext;->share()V

    .line 181
    iget-object v0, p0, Lcom/vk/sharing/CommonPresenter;->view:Lcom/vk/sharing/view/SharingView;

    invoke-virtual {v0}, Lcom/vk/sharing/view/SharingView;->hide()V

    goto :goto_0

    .line 168
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
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
    .line 201
    .local p1, "targets":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/sharing/target/Target;>;"
    invoke-super {p0, p1}, Lcom/vk/sharing/BasePresenter;->onDialogLoadingCompleted(Ljava/util/ArrayList;)V

    .line 202
    iget-object v0, p0, Lcom/vk/sharing/CommonPresenter;->view:Lcom/vk/sharing/view/SharingView;

    iget-object v1, p0, Lcom/vk/sharing/CommonPresenter;->targets:Lcom/vk/sharing/target/Targets;

    invoke-virtual {v1}, Lcom/vk/sharing/target/Targets;->getDialogTargets()Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/sharing/view/SharingView;->setTargets(Ljava/util/List;)V

    .line 203
    iget-object v0, p0, Lcom/vk/sharing/CommonPresenter;->view:Lcom/vk/sharing/view/SharingView;

    invoke-virtual {v0}, Lcom/vk/sharing/view/SharingView;->showList()V

    .line 204
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
    .line 153
    iget-object v0, p0, Lcom/vk/sharing/CommonPresenter;->internalDelegate:Lcom/vk/sharing/CommonPresenter$InternalDelegate;

    invoke-virtual {v0, p1, p2}, Lcom/vk/sharing/CommonPresenter$InternalDelegate;->onListItemClick(Lcom/vk/sharing/target/Target;I)V

    .line 154
    return-void
.end method

.method public onListScrolledToTheEnd()V
    .locals 2

    .prologue
    .line 146
    iget-object v0, p0, Lcom/vk/sharing/CommonPresenter;->targetsLoader:Lcom/vk/sharing/target/TargetsLoader;

    invoke-virtual {v0}, Lcom/vk/sharing/target/TargetsLoader;->isLoadingDialogs()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/vk/sharing/CommonPresenter;->targets:Lcom/vk/sharing/target/Targets;

    invoke-virtual {v0}, Lcom/vk/sharing/target/Targets;->isFull()Z

    move-result v0

    if-nez v0, :cond_0

    .line 147
    iget-object v0, p0, Lcom/vk/sharing/CommonPresenter;->targetsLoader:Lcom/vk/sharing/target/TargetsLoader;

    iget-object v1, p0, Lcom/vk/sharing/CommonPresenter;->targets:Lcom/vk/sharing/target/Targets;

    invoke-virtual {v1}, Lcom/vk/sharing/target/Targets;->getDialogTargetsSize()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/vk/sharing/target/TargetsLoader;->loadDialogs(I)V

    .line 149
    :cond_0
    return-void
.end method

.method public onRetryClick()V
    .locals 2

    .prologue
    .line 193
    iget-object v0, p0, Lcom/vk/sharing/CommonPresenter;->targetsLoader:Lcom/vk/sharing/target/TargetsLoader;

    invoke-virtual {v0}, Lcom/vk/sharing/target/TargetsLoader;->isLoadingDialogs()Z

    move-result v0

    if-nez v0, :cond_0

    .line 194
    iget-object v0, p0, Lcom/vk/sharing/CommonPresenter;->targetsLoader:Lcom/vk/sharing/target/TargetsLoader;

    iget-object v1, p0, Lcom/vk/sharing/CommonPresenter;->targets:Lcom/vk/sharing/target/Targets;

    invoke-virtual {v1}, Lcom/vk/sharing/target/Targets;->getDialogTargetsSize()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/vk/sharing/target/TargetsLoader;->loadDialogs(I)V

    .line 195
    iget-object v0, p0, Lcom/vk/sharing/CommonPresenter;->view:Lcom/vk/sharing/view/SharingView;

    invoke-virtual {v0}, Lcom/vk/sharing/view/SharingView;->showLoading()V

    .line 197
    :cond_0
    return-void
.end method

.method public onSearchClick()V
    .locals 2

    .prologue
    .line 188
    iget-object v0, p0, Lcom/vk/sharing/CommonPresenter;->context:Lcom/vk/sharing/BasePresenter$DelegateContext;

    new-instance v1, Lcom/vk/sharing/DialogSearchPresenter;

    invoke-direct {v1, p0}, Lcom/vk/sharing/DialogSearchPresenter;-><init>(Lcom/vk/sharing/CommonPresenter;)V

    invoke-interface {v0, v1}, Lcom/vk/sharing/BasePresenter$DelegateContext;->setNextPresenter(Lcom/vk/sharing/BasePresenter;)V

    .line 189
    return-void
.end method

.method public onSendClick()V
    .locals 3

    .prologue
    .line 158
    iget-object v0, p0, Lcom/vk/sharing/CommonPresenter;->targets:Lcom/vk/sharing/target/Targets;

    invoke-virtual {v0}, Lcom/vk/sharing/target/Targets;->getSelectedTargetsSize()I

    move-result v0

    if-eqz v0, :cond_0

    .line 159
    iget-object v0, p0, Lcom/vk/sharing/CommonPresenter;->context:Lcom/vk/sharing/BasePresenter$DelegateContext;

    iget-object v1, p0, Lcom/vk/sharing/CommonPresenter;->view:Lcom/vk/sharing/view/SharingView;

    invoke-virtual {v1}, Lcom/vk/sharing/view/SharingView;->getCommentText()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/vk/sharing/CommonPresenter;->targets:Lcom/vk/sharing/target/Targets;

    invoke-virtual {v2}, Lcom/vk/sharing/target/Targets;->getSelectedTargets()Ljava/util/List;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/vk/sharing/BasePresenter$DelegateContext;->sendMessage(Ljava/lang/String;Ljava/util/Collection;)V

    .line 160
    iget-object v0, p0, Lcom/vk/sharing/CommonPresenter;->view:Lcom/vk/sharing/view/SharingView;

    invoke-virtual {v0}, Lcom/vk/sharing/view/SharingView;->hide()V

    .line 164
    :goto_0
    return-void

    .line 162
    :cond_0
    const v0, 0x7f080687

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-virtual {p0, v0, v1}, Lcom/vk/sharing/CommonPresenter;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/vk/core/util/ToastUtils;->showToast(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public onViewShown()V
    .locals 1

    .prologue
    .line 139
    iget-object v0, p0, Lcom/vk/sharing/CommonPresenter;->targetsLoader:Lcom/vk/sharing/target/TargetsLoader;

    invoke-virtual {v0}, Lcom/vk/sharing/target/TargetsLoader;->isLoadingDialogs()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 140
    iget-object v0, p0, Lcom/vk/sharing/CommonPresenter;->view:Lcom/vk/sharing/view/SharingView;

    invoke-virtual {v0}, Lcom/vk/sharing/view/SharingView;->showLoading()V

    .line 142
    :cond_0
    return-void
.end method
