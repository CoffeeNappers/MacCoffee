.class final Lcom/vk/sharing/CommonPresenter$ActionsInternalDelegate;
.super Lcom/vk/sharing/CommonPresenter$InternalDelegate;
.source "CommonPresenter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/sharing/CommonPresenter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "ActionsInternalDelegate"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/sharing/CommonPresenter;


# direct methods
.method constructor <init>(Lcom/vk/sharing/CommonPresenter;)V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 218
    iput-object p1, p0, Lcom/vk/sharing/CommonPresenter$ActionsInternalDelegate;->this$0:Lcom/vk/sharing/CommonPresenter;

    invoke-direct {p0, p1, v1}, Lcom/vk/sharing/CommonPresenter$InternalDelegate;-><init>(Lcom/vk/sharing/CommonPresenter;Lcom/vk/sharing/CommonPresenter$1;)V

    .line 219
    iget-object v0, p1, Lcom/vk/sharing/CommonPresenter;->view:Lcom/vk/sharing/view/SharingView;

    invoke-virtual {v0, v1}, Lcom/vk/sharing/view/SharingView;->setSubtitle(Ljava/lang/String;)V

    .line 220
    iget-object v0, p1, Lcom/vk/sharing/CommonPresenter;->view:Lcom/vk/sharing/view/SharingView;

    invoke-virtual {v0}, Lcom/vk/sharing/view/SharingView;->showFooterActions()V

    .line 221
    return-void
.end method

.method constructor <init>(Lcom/vk/sharing/CommonPresenter;Lcom/vk/sharing/target/Target;I)V
    .locals 2
    .param p1    # Lcom/vk/sharing/CommonPresenter;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "target"    # Lcom/vk/sharing/target/Target;
    .param p3, "position"    # I

    .prologue
    const/4 v1, 0x0

    .line 223
    iput-object p1, p0, Lcom/vk/sharing/CommonPresenter$ActionsInternalDelegate;->this$0:Lcom/vk/sharing/CommonPresenter;

    invoke-direct {p0, p1, v1}, Lcom/vk/sharing/CommonPresenter$InternalDelegate;-><init>(Lcom/vk/sharing/CommonPresenter;Lcom/vk/sharing/CommonPresenter$1;)V

    .line 224
    iget-object v0, p1, Lcom/vk/sharing/CommonPresenter;->view:Lcom/vk/sharing/view/SharingView;

    invoke-static {v0}, Lcom/vk/sharing/KitKatTransitions;->run(Landroid/view/ViewGroup;)V

    .line 226
    invoke-virtual {p0, p2, p3}, Lcom/vk/sharing/CommonPresenter$ActionsInternalDelegate;->toggleTarget(Lcom/vk/sharing/target/Target;I)V

    .line 227
    iget-object v0, p1, Lcom/vk/sharing/CommonPresenter;->view:Lcom/vk/sharing/view/SharingView;

    invoke-virtual {v0, v1}, Lcom/vk/sharing/view/SharingView;->setSubtitle(Ljava/lang/String;)V

    .line 228
    iget-object v0, p1, Lcom/vk/sharing/CommonPresenter;->view:Lcom/vk/sharing/view/SharingView;

    invoke-virtual {v0}, Lcom/vk/sharing/view/SharingView;->showFooterActions()V

    .line 229
    return-void
.end method


# virtual methods
.method onListItemClick(Lcom/vk/sharing/target/Target;I)V
    .locals 3
    .param p1, "target"    # Lcom/vk/sharing/target/Target;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "position"    # I

    .prologue
    .line 233
    iget-object v0, p0, Lcom/vk/sharing/CommonPresenter$ActionsInternalDelegate;->this$0:Lcom/vk/sharing/CommonPresenter;

    new-instance v1, Lcom/vk/sharing/CommonPresenter$SendMessageInternalDelegate;

    iget-object v2, p0, Lcom/vk/sharing/CommonPresenter$ActionsInternalDelegate;->this$0:Lcom/vk/sharing/CommonPresenter;

    invoke-direct {v1, v2, p1, p2}, Lcom/vk/sharing/CommonPresenter$SendMessageInternalDelegate;-><init>(Lcom/vk/sharing/CommonPresenter;Lcom/vk/sharing/target/Target;I)V

    invoke-static {v0, v1}, Lcom/vk/sharing/CommonPresenter;->access$102(Lcom/vk/sharing/CommonPresenter;Lcom/vk/sharing/CommonPresenter$InternalDelegate;)Lcom/vk/sharing/CommonPresenter$InternalDelegate;

    .line 234
    return-void
.end method
