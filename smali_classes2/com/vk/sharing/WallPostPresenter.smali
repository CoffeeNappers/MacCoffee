.class final Lcom/vk/sharing/WallPostPresenter;
.super Lcom/vk/sharing/BasePresenter;
.source "WallPostPresenter.java"


# direct methods
.method constructor <init>(Lcom/vk/sharing/BasePresenter$DelegateContext;)V
    .locals 0
    .param p1, "context"    # Lcom/vk/sharing/BasePresenter$DelegateContext;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 13
    invoke-direct {p0, p1}, Lcom/vk/sharing/BasePresenter;-><init>(Lcom/vk/sharing/BasePresenter$DelegateContext;)V

    .line 15
    invoke-direct {p0}, Lcom/vk/sharing/WallPostPresenter;->init()V

    .line 16
    return-void
.end method

.method constructor <init>(Lcom/vk/sharing/CommonPresenter;)V
    .locals 1
    .param p1, "presenter"    # Lcom/vk/sharing/CommonPresenter;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 19
    invoke-direct {p0, p1}, Lcom/vk/sharing/BasePresenter;-><init>(Lcom/vk/sharing/BasePresenter;)V

    .line 21
    iget-object v0, p0, Lcom/vk/sharing/WallPostPresenter;->view:Lcom/vk/sharing/view/SharingView;

    invoke-static {v0}, Lcom/vk/sharing/KitKatTransitions;->run(Landroid/view/ViewGroup;)V

    .line 23
    invoke-direct {p0}, Lcom/vk/sharing/WallPostPresenter;->init()V

    .line 24
    return-void
.end method

.method private init()V
    .locals 3

    .prologue
    .line 27
    iget-object v0, p0, Lcom/vk/sharing/WallPostPresenter;->view:Lcom/vk/sharing/view/SharingView;

    invoke-virtual {v0}, Lcom/vk/sharing/view/SharingView;->hideHeaderSearchButton()V

    .line 28
    iget-object v0, p0, Lcom/vk/sharing/WallPostPresenter;->view:Lcom/vk/sharing/view/SharingView;

    invoke-virtual {v0}, Lcom/vk/sharing/view/SharingView;->showHeaderBackButton()V

    .line 29
    iget-object v0, p0, Lcom/vk/sharing/WallPostPresenter;->view:Lcom/vk/sharing/view/SharingView;

    const v1, 0x7f080684

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {p0, v1, v2}, Lcom/vk/sharing/WallPostPresenter;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/sharing/view/SharingView;->setTitle(Ljava/lang/String;)V

    .line 30
    iget-object v0, p0, Lcom/vk/sharing/WallPostPresenter;->view:Lcom/vk/sharing/view/SharingView;

    invoke-virtual {v0}, Lcom/vk/sharing/view/SharingView;->hideContent()V

    .line 31
    iget-object v0, p0, Lcom/vk/sharing/WallPostPresenter;->view:Lcom/vk/sharing/view/SharingView;

    invoke-virtual {v0}, Lcom/vk/sharing/view/SharingView;->showFooterSend()V

    .line 32
    iget-object v0, p0, Lcom/vk/sharing/WallPostPresenter;->view:Lcom/vk/sharing/view/SharingView;

    invoke-virtual {v0}, Lcom/vk/sharing/view/SharingView;->showFooterAttachments()V

    .line 33
    iget-object v0, p0, Lcom/vk/sharing/WallPostPresenter;->view:Lcom/vk/sharing/view/SharingView;

    invoke-virtual {v0}, Lcom/vk/sharing/view/SharingView;->enableSendFooter()V

    .line 34
    return-void
.end method


# virtual methods
.method public onBackClick()V
    .locals 2

    .prologue
    .line 44
    iget-object v0, p0, Lcom/vk/sharing/WallPostPresenter;->context:Lcom/vk/sharing/BasePresenter$DelegateContext;

    new-instance v1, Lcom/vk/sharing/CommonPresenter;

    invoke-direct {v1, p0}, Lcom/vk/sharing/CommonPresenter;-><init>(Lcom/vk/sharing/WallPostPresenter;)V

    invoke-interface {v0, v1}, Lcom/vk/sharing/BasePresenter$DelegateContext;->setNextPresenter(Lcom/vk/sharing/BasePresenter;)V

    .line 45
    return-void
.end method

.method public onSendClick()V
    .locals 2

    .prologue
    .line 38
    iget-object v0, p0, Lcom/vk/sharing/WallPostPresenter;->context:Lcom/vk/sharing/BasePresenter$DelegateContext;

    iget-object v1, p0, Lcom/vk/sharing/WallPostPresenter;->view:Lcom/vk/sharing/view/SharingView;

    invoke-virtual {v1}, Lcom/vk/sharing/view/SharingView;->getCommentText()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/vk/sharing/BasePresenter$DelegateContext;->repost(Ljava/lang/String;)V

    .line 39
    iget-object v0, p0, Lcom/vk/sharing/WallPostPresenter;->view:Lcom/vk/sharing/view/SharingView;

    invoke-virtual {v0}, Lcom/vk/sharing/view/SharingView;->hide()V

    .line 40
    return-void
.end method
