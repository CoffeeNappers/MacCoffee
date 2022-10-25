.class abstract Lcom/vk/sharing/BasePresenter;
.super Ljava/lang/Object;
.source "BasePresenter.java"

# interfaces
.implements Lcom/vk/sharing/view/SharingView$Presenter;
.implements Lcom/vk/sharing/target/TargetsLoader$Callback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/sharing/BasePresenter$DelegateContext;
    }
.end annotation


# static fields
.field private static final TARGETS_MAX:I = 0x14


# instance fields
.field final context:Lcom/vk/sharing/BasePresenter$DelegateContext;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field

.field final targets:Lcom/vk/sharing/target/Targets;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field

.field final targetsLoader:Lcom/vk/sharing/target/TargetsLoader;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field

.field final view:Lcom/vk/sharing/view/SharingView;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field


# direct methods
.method constructor <init>(Lcom/vk/sharing/BasePresenter$DelegateContext;)V
    .locals 1
    .param p1, "context"    # Lcom/vk/sharing/BasePresenter$DelegateContext;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 73
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 74
    iput-object p1, p0, Lcom/vk/sharing/BasePresenter;->context:Lcom/vk/sharing/BasePresenter$DelegateContext;

    .line 75
    invoke-interface {p1}, Lcom/vk/sharing/BasePresenter$DelegateContext;->getTargets()Lcom/vk/sharing/target/Targets;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/sharing/BasePresenter;->targets:Lcom/vk/sharing/target/Targets;

    .line 76
    invoke-interface {p1}, Lcom/vk/sharing/BasePresenter$DelegateContext;->getTargetsLoader()Lcom/vk/sharing/target/TargetsLoader;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/sharing/BasePresenter;->targetsLoader:Lcom/vk/sharing/target/TargetsLoader;

    .line 77
    invoke-interface {p1}, Lcom/vk/sharing/BasePresenter$DelegateContext;->getView()Lcom/vk/sharing/view/SharingView;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/sharing/BasePresenter;->view:Lcom/vk/sharing/view/SharingView;

    .line 78
    return-void
.end method

.method constructor <init>(Lcom/vk/sharing/BasePresenter;)V
    .locals 1
    .param p1, "presenter"    # Lcom/vk/sharing/BasePresenter;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 81
    iget-object v0, p1, Lcom/vk/sharing/BasePresenter;->context:Lcom/vk/sharing/BasePresenter$DelegateContext;

    invoke-direct {p0, v0}, Lcom/vk/sharing/BasePresenter;-><init>(Lcom/vk/sharing/BasePresenter$DelegateContext;)V

    .line 82
    return-void
.end method


# virtual methods
.method final varargs getString(I[Ljava/lang/Object;)Ljava/lang/String;
    .locals 1
    .param p1, "id"    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param
    .param p2, "formatArgs"    # [Ljava/lang/Object;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 181
    iget-object v0, p0, Lcom/vk/sharing/BasePresenter;->context:Lcom/vk/sharing/BasePresenter$DelegateContext;

    invoke-interface {v0, p1, p2}, Lcom/vk/sharing/BasePresenter$DelegateContext;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public onActionClick(I)V
    .locals 0
    .param p1, "action"    # I

    .prologue
    .line 109
    return-void
.end method

.method public onBackClick()V
    .locals 1

    .prologue
    .line 122
    iget-object v0, p0, Lcom/vk/sharing/BasePresenter;->view:Lcom/vk/sharing/view/SharingView;

    invoke-virtual {v0}, Lcom/vk/sharing/view/SharingView;->hide()V

    .line 123
    return-void
.end method

.method public onClearClick()V
    .locals 2

    .prologue
    .line 133
    iget-object v0, p0, Lcom/vk/sharing/BasePresenter;->view:Lcom/vk/sharing/view/SharingView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/vk/sharing/view/SharingView;->setSearchQuery(Ljava/lang/String;)V

    .line 134
    return-void
.end method

.method public onDialogLoadingCompleted(Ljava/util/ArrayList;)V
    .locals 3
    .param p1    # Ljava/util/ArrayList;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CallSuper;
    .end annotation

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
    .line 143
    .local p1, "targets":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/sharing/target/Target;>;"
    iget-object v0, p0, Lcom/vk/sharing/BasePresenter;->targets:Lcom/vk/sharing/target/Targets;

    invoke-virtual {v0, p1}, Lcom/vk/sharing/target/Targets;->addTargetsToDialogs(Ljava/util/ArrayList;)V

    .line 144
    iget-object v1, p0, Lcom/vk/sharing/BasePresenter;->targets:Lcom/vk/sharing/target/Targets;

    iget-object v0, p0, Lcom/vk/sharing/BasePresenter;->targets:Lcom/vk/sharing/target/Targets;

    invoke-virtual {v0}, Lcom/vk/sharing/target/Targets;->getDialogTargetsSize()I

    move-result v0

    const/16 v2, 0x14

    if-eq v0, v2, :cond_0

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/16 v2, 0xa

    if-ge v0, v2, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    invoke-virtual {v1, v0}, Lcom/vk/sharing/target/Targets;->setFull(Z)V

    .line 145
    return-void

    .line 144
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public final onDialogLoadingFailed()V
    .locals 1

    .prologue
    .line 149
    iget-object v0, p0, Lcom/vk/sharing/BasePresenter;->targets:Lcom/vk/sharing/target/Targets;

    invoke-virtual {v0}, Lcom/vk/sharing/target/Targets;->isDialogsLoaded()Z

    move-result v0

    if-nez v0, :cond_0

    .line 150
    iget-object v0, p0, Lcom/vk/sharing/BasePresenter;->view:Lcom/vk/sharing/view/SharingView;

    invoke-virtual {v0}, Lcom/vk/sharing/view/SharingView;->showError()V

    .line 152
    :cond_0
    return-void
.end method

.method public onDialogSearchingCompleted(Ljava/util/ArrayList;)V
    .locals 1
    .param p1    # Ljava/util/ArrayList;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CallSuper;
    .end annotation

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
    .line 157
    .local p1, "targets":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/sharing/target/Target;>;"
    iget-object v0, p0, Lcom/vk/sharing/BasePresenter;->targets:Lcom/vk/sharing/target/Targets;

    invoke-virtual {v0, p1}, Lcom/vk/sharing/target/Targets;->setSearchResultTargets(Ljava/util/ArrayList;)V

    .line 158
    return-void
.end method

.method public onDialogSearchingFailed()V
    .locals 0

    .prologue
    .line 161
    return-void
.end method

.method public onGroupLoadingCompleted(Ljava/util/ArrayList;)V
    .locals 1
    .param p1    # Ljava/util/ArrayList;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CallSuper;
    .end annotation

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
    .line 166
    .local p1, "targets":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/sharing/target/Target;>;"
    iget-object v0, p0, Lcom/vk/sharing/BasePresenter;->targets:Lcom/vk/sharing/target/Targets;

    invoke-virtual {v0, p1}, Lcom/vk/sharing/target/Targets;->addTargetsToGroups(Ljava/util/ArrayList;)V

    .line 167
    return-void
.end method

.method public final onGroupLoadingFailed()V
    .locals 1

    .prologue
    .line 171
    iget-object v0, p0, Lcom/vk/sharing/BasePresenter;->targets:Lcom/vk/sharing/target/Targets;

    invoke-virtual {v0}, Lcom/vk/sharing/target/Targets;->isGroupsLoaded()Z

    move-result v0

    if-nez v0, :cond_0

    .line 172
    iget-object v0, p0, Lcom/vk/sharing/BasePresenter;->view:Lcom/vk/sharing/view/SharingView;

    invoke-virtual {v0}, Lcom/vk/sharing/view/SharingView;->showError()V

    .line 174
    :cond_0
    return-void
.end method

.method public onGroupSearchingCompleted(Ljava/util/ArrayList;)V
    .locals 0
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
    .line 177
    .local p1, "targets":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/sharing/target/Target;>;"
    return-void
.end method

.method public onListItemClick(Lcom/vk/sharing/target/Target;I)V
    .locals 0
    .param p1, "target"    # Lcom/vk/sharing/target/Target;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "position"    # I

    .prologue
    .line 106
    return-void
.end method

.method public onListScrolledToTheEnd()V
    .locals 0

    .prologue
    .line 103
    return-void
.end method

.method public onOutsideClick()V
    .locals 1

    .prologue
    .line 99
    iget-object v0, p0, Lcom/vk/sharing/BasePresenter;->view:Lcom/vk/sharing/view/SharingView;

    invoke-virtual {v0}, Lcom/vk/sharing/view/SharingView;->hide()V

    .line 100
    return-void
.end method

.method public onRetryClick()V
    .locals 0

    .prologue
    .line 129
    return-void
.end method

.method public onSearchClick()V
    .locals 0

    .prologue
    .line 118
    return-void
.end method

.method public onSearchInputChanged(Ljava/lang/String;)V
    .locals 1
    .param p1, "query"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/CallSuper;
    .end annotation

    .prologue
    .line 114
    iget-object v0, p0, Lcom/vk/sharing/BasePresenter;->targets:Lcom/vk/sharing/target/Targets;

    invoke-virtual {v0, p1}, Lcom/vk/sharing/target/Targets;->setQuery(Ljava/lang/String;)V

    .line 115
    return-void
.end method

.method public onSendClick()V
    .locals 0

    .prologue
    .line 126
    return-void
.end method

.method public final onViewHidden()V
    .locals 1

    .prologue
    .line 94
    iget-object v0, p0, Lcom/vk/sharing/BasePresenter;->context:Lcom/vk/sharing/BasePresenter$DelegateContext;

    invoke-interface {v0}, Lcom/vk/sharing/BasePresenter$DelegateContext;->destroy()V

    .line 95
    return-void
.end method

.method public onViewShown()V
    .locals 0

    .prologue
    .line 90
    return-void
.end method
