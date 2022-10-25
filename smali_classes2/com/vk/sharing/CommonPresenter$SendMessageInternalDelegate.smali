.class final Lcom/vk/sharing/CommonPresenter$SendMessageInternalDelegate;
.super Lcom/vk/sharing/CommonPresenter$InternalDelegate;
.source "CommonPresenter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/sharing/CommonPresenter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "SendMessageInternalDelegate"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/sharing/CommonPresenter;


# direct methods
.method constructor <init>(Lcom/vk/sharing/CommonPresenter;)V
    .locals 1

    .prologue
    .line 240
    iput-object p1, p0, Lcom/vk/sharing/CommonPresenter$SendMessageInternalDelegate;->this$0:Lcom/vk/sharing/CommonPresenter;

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/vk/sharing/CommonPresenter$InternalDelegate;-><init>(Lcom/vk/sharing/CommonPresenter;Lcom/vk/sharing/CommonPresenter$1;)V

    .line 241
    iget-object v0, p1, Lcom/vk/sharing/CommonPresenter;->view:Lcom/vk/sharing/view/SharingView;

    invoke-virtual {v0}, Lcom/vk/sharing/view/SharingView;->showFooterSend()V

    .line 242
    invoke-direct {p0}, Lcom/vk/sharing/CommonPresenter$SendMessageInternalDelegate;->updateSubtitle()V

    .line 243
    invoke-direct {p0}, Lcom/vk/sharing/CommonPresenter$SendMessageInternalDelegate;->updateCounter()V

    .line 244
    return-void
.end method

.method constructor <init>(Lcom/vk/sharing/CommonPresenter;Lcom/vk/sharing/target/Target;I)V
    .locals 1
    .param p1    # Lcom/vk/sharing/CommonPresenter;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "target"    # Lcom/vk/sharing/target/Target;
    .param p3, "position"    # I

    .prologue
    .line 246
    iput-object p1, p0, Lcom/vk/sharing/CommonPresenter$SendMessageInternalDelegate;->this$0:Lcom/vk/sharing/CommonPresenter;

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/vk/sharing/CommonPresenter$InternalDelegate;-><init>(Lcom/vk/sharing/CommonPresenter;Lcom/vk/sharing/CommonPresenter$1;)V

    .line 247
    iget-object v0, p1, Lcom/vk/sharing/CommonPresenter;->view:Lcom/vk/sharing/view/SharingView;

    invoke-static {v0}, Lcom/vk/sharing/KitKatTransitions;->run(Landroid/view/ViewGroup;)V

    .line 249
    invoke-virtual {p0, p2, p3}, Lcom/vk/sharing/CommonPresenter$SendMessageInternalDelegate;->toggleTarget(Lcom/vk/sharing/target/Target;I)V

    .line 250
    invoke-direct {p0}, Lcom/vk/sharing/CommonPresenter$SendMessageInternalDelegate;->updateSubtitle()V

    .line 251
    iget-object v0, p1, Lcom/vk/sharing/CommonPresenter;->view:Lcom/vk/sharing/view/SharingView;

    invoke-virtual {v0}, Lcom/vk/sharing/view/SharingView;->showFooterSend()V

    .line 252
    iget-object v0, p1, Lcom/vk/sharing/CommonPresenter;->view:Lcom/vk/sharing/view/SharingView;

    invoke-virtual {v0}, Lcom/vk/sharing/view/SharingView;->enableSendFooter()V

    .line 253
    return-void
.end method

.method private updateCounter()V
    .locals 3

    .prologue
    .line 293
    iget-object v1, p0, Lcom/vk/sharing/CommonPresenter$SendMessageInternalDelegate;->this$0:Lcom/vk/sharing/CommonPresenter;

    iget-object v1, v1, Lcom/vk/sharing/CommonPresenter;->targets:Lcom/vk/sharing/target/Targets;

    invoke-virtual {v1}, Lcom/vk/sharing/target/Targets;->getSelectedTargetsSize()I

    move-result v0

    .line 294
    .local v0, "selectedSize":I
    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 295
    iget-object v1, p0, Lcom/vk/sharing/CommonPresenter$SendMessageInternalDelegate;->this$0:Lcom/vk/sharing/CommonPresenter;

    iget-object v1, v1, Lcom/vk/sharing/CommonPresenter;->view:Lcom/vk/sharing/view/SharingView;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/vk/sharing/view/SharingView;->setSendButtonCount(I)V

    .line 299
    :goto_0
    return-void

    .line 297
    :cond_0
    iget-object v1, p0, Lcom/vk/sharing/CommonPresenter$SendMessageInternalDelegate;->this$0:Lcom/vk/sharing/CommonPresenter;

    iget-object v1, v1, Lcom/vk/sharing/CommonPresenter;->view:Lcom/vk/sharing/view/SharingView;

    invoke-virtual {v1, v0}, Lcom/vk/sharing/view/SharingView;->setSendButtonCount(I)V

    goto :goto_0
.end method

.method private updateSubtitle()V
    .locals 10

    .prologue
    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 271
    iget-object v2, p0, Lcom/vk/sharing/CommonPresenter$SendMessageInternalDelegate;->this$0:Lcom/vk/sharing/CommonPresenter;

    iget-object v2, v2, Lcom/vk/sharing/CommonPresenter;->targets:Lcom/vk/sharing/target/Targets;

    invoke-virtual {v2}, Lcom/vk/sharing/target/Targets;->getSelectedTargets()Ljava/util/List;

    move-result-object v1

    .line 272
    .local v1, "selectedTargets":Ljava/util/List;, "Ljava/util/List<Lcom/vk/sharing/target/Target;>;"
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v0

    .line 273
    .local v0, "selectedSize":I
    packed-switch v0, :pswitch_data_0

    .line 284
    iget-object v2, p0, Lcom/vk/sharing/CommonPresenter$SendMessageInternalDelegate;->this$0:Lcom/vk/sharing/CommonPresenter;

    iget-object v3, v2, Lcom/vk/sharing/CommonPresenter;->view:Lcom/vk/sharing/view/SharingView;

    iget-object v4, p0, Lcom/vk/sharing/CommonPresenter$SendMessageInternalDelegate;->this$0:Lcom/vk/sharing/CommonPresenter;

    const v5, 0x7f080682

    const/4 v2, 0x2

    new-array v6, v2, [Ljava/lang/Object;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 286
    invoke-interface {v1, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vk/sharing/target/Target;

    iget-object v2, v2, Lcom/vk/sharing/target/Target;->name:Ljava/lang/String;

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v7, ", "

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-interface {v1, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vk/sharing/target/Target;

    iget-object v2, v2, Lcom/vk/sharing/target/Target;->name:Ljava/lang/String;

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v6, v8

    add-int/lit8 v2, v0, -0x2

    .line 287
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v6, v9

    .line 284
    invoke-virtual {v4, v5, v6}, Lcom/vk/sharing/CommonPresenter;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Lcom/vk/sharing/view/SharingView;->setSubtitle(Ljava/lang/String;)V

    .line 290
    :goto_0
    return-void

    .line 275
    :pswitch_0
    iget-object v2, p0, Lcom/vk/sharing/CommonPresenter$SendMessageInternalDelegate;->this$0:Lcom/vk/sharing/CommonPresenter;

    iget-object v2, v2, Lcom/vk/sharing/CommonPresenter;->view:Lcom/vk/sharing/view/SharingView;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/vk/sharing/view/SharingView;->setSubtitle(Ljava/lang/String;)V

    goto :goto_0

    .line 278
    :pswitch_1
    iget-object v2, p0, Lcom/vk/sharing/CommonPresenter$SendMessageInternalDelegate;->this$0:Lcom/vk/sharing/CommonPresenter;

    iget-object v3, v2, Lcom/vk/sharing/CommonPresenter;->view:Lcom/vk/sharing/view/SharingView;

    invoke-interface {v1, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vk/sharing/target/Target;

    iget-object v2, v2, Lcom/vk/sharing/target/Target;->name:Ljava/lang/String;

    invoke-virtual {v3, v2}, Lcom/vk/sharing/view/SharingView;->setSubtitle(Ljava/lang/String;)V

    goto :goto_0

    .line 281
    :pswitch_2
    iget-object v2, p0, Lcom/vk/sharing/CommonPresenter$SendMessageInternalDelegate;->this$0:Lcom/vk/sharing/CommonPresenter;

    iget-object v3, v2, Lcom/vk/sharing/CommonPresenter;->view:Lcom/vk/sharing/view/SharingView;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {v1, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vk/sharing/target/Target;

    iget-object v2, v2, Lcom/vk/sharing/target/Target;->name:Ljava/lang/String;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v4, ", "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-interface {v1, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vk/sharing/target/Target;

    iget-object v2, v2, Lcom/vk/sharing/target/Target;->name:Ljava/lang/String;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Lcom/vk/sharing/view/SharingView;->setSubtitle(Ljava/lang/String;)V

    goto :goto_0

    .line 273
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method


# virtual methods
.method public onListItemClick(Lcom/vk/sharing/target/Target;I)V
    .locals 3
    .param p1, "target"    # Lcom/vk/sharing/target/Target;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "position"    # I

    .prologue
    .line 257
    iget-object v0, p0, Lcom/vk/sharing/CommonPresenter$SendMessageInternalDelegate;->this$0:Lcom/vk/sharing/CommonPresenter;

    iget-object v0, v0, Lcom/vk/sharing/CommonPresenter;->targets:Lcom/vk/sharing/target/Targets;

    invoke-virtual {v0}, Lcom/vk/sharing/target/Targets;->getSelectedTargetsSize()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/vk/sharing/CommonPresenter$SendMessageInternalDelegate;->this$0:Lcom/vk/sharing/CommonPresenter;

    iget-object v0, v0, Lcom/vk/sharing/CommonPresenter;->targets:Lcom/vk/sharing/target/Targets;

    .line 258
    invoke-virtual {v0, p1}, Lcom/vk/sharing/target/Targets;->isTargetSelected(Lcom/vk/sharing/target/Target;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vk/sharing/CommonPresenter$SendMessageInternalDelegate;->this$0:Lcom/vk/sharing/CommonPresenter;

    iget-object v0, v0, Lcom/vk/sharing/CommonPresenter;->context:Lcom/vk/sharing/BasePresenter$DelegateContext;

    .line 259
    invoke-interface {v0}, Lcom/vk/sharing/BasePresenter$DelegateContext;->getActionsInfo()Lcom/vk/sharing/action/ActionsInfo;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/sharing/action/ActionsInfo;->canAtLeastOneAction()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 261
    iget-object v0, p0, Lcom/vk/sharing/CommonPresenter$SendMessageInternalDelegate;->this$0:Lcom/vk/sharing/CommonPresenter;

    new-instance v1, Lcom/vk/sharing/CommonPresenter$ActionsInternalDelegate;

    iget-object v2, p0, Lcom/vk/sharing/CommonPresenter$SendMessageInternalDelegate;->this$0:Lcom/vk/sharing/CommonPresenter;

    invoke-direct {v1, v2, p1, p2}, Lcom/vk/sharing/CommonPresenter$ActionsInternalDelegate;-><init>(Lcom/vk/sharing/CommonPresenter;Lcom/vk/sharing/target/Target;I)V

    invoke-static {v0, v1}, Lcom/vk/sharing/CommonPresenter;->access$102(Lcom/vk/sharing/CommonPresenter;Lcom/vk/sharing/CommonPresenter$InternalDelegate;)Lcom/vk/sharing/CommonPresenter$InternalDelegate;

    .line 268
    :goto_0
    return-void

    .line 264
    :cond_0
    invoke-virtual {p0, p1, p2}, Lcom/vk/sharing/CommonPresenter$SendMessageInternalDelegate;->toggleTarget(Lcom/vk/sharing/target/Target;I)V

    .line 265
    invoke-direct {p0}, Lcom/vk/sharing/CommonPresenter$SendMessageInternalDelegate;->updateSubtitle()V

    .line 266
    invoke-direct {p0}, Lcom/vk/sharing/CommonPresenter$SendMessageInternalDelegate;->updateCounter()V

    goto :goto_0
.end method
