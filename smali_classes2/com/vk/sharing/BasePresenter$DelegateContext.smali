.class interface abstract Lcom/vk/sharing/BasePresenter$DelegateContext;
.super Ljava/lang/Object;
.source "BasePresenter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/sharing/BasePresenter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x608
    name = "DelegateContext"
.end annotation


# virtual methods
.method public abstract copyLink()V
.end method

.method public abstract destroy()V
.end method

.method public abstract getActionsInfo()Lcom/vk/sharing/action/ActionsInfo;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end method

.method public abstract getGroupPickerInfo()Lcom/vk/sharing/picker/GroupPickerInfo;
.end method

.method public varargs abstract getString(I[Ljava/lang/Object;)Ljava/lang/String;
    .param p1    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param
    .param p2    # [Ljava/lang/Object;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end method

.method public abstract getTargets()Lcom/vk/sharing/target/Targets;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end method

.method public abstract getTargetsLoader()Lcom/vk/sharing/target/TargetsLoader;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end method

.method public abstract getView()Lcom/vk/sharing/view/SharingView;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end method

.method public abstract handlePickedTarget(Lcom/vk/sharing/target/Target;)V
    .param p1    # Lcom/vk/sharing/target/Target;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract repost(Ljava/lang/String;)V
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract repost(Ljava/lang/String;Ljava/util/Collection;)V
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/util/Collection;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Collection",
            "<",
            "Lcom/vk/sharing/target/Target;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract sendMessage(Ljava/lang/String;Ljava/util/Collection;)V
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/util/Collection;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Collection",
            "<",
            "Lcom/vk/sharing/target/Target;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract setNextPresenter(Lcom/vk/sharing/BasePresenter;)V
    .param p1    # Lcom/vk/sharing/BasePresenter;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract share()V
.end method
