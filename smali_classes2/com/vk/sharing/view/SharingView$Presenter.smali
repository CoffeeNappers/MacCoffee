.class public interface abstract Lcom/vk/sharing/view/SharingView$Presenter;
.super Ljava/lang/Object;
.source "SharingView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/sharing/view/SharingView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "Presenter"
.end annotation


# virtual methods
.method public abstract onActionClick(I)V
.end method

.method public abstract onBackClick()V
.end method

.method public abstract onClearClick()V
.end method

.method public abstract onListItemClick(Lcom/vk/sharing/target/Target;I)V
    .param p1    # Lcom/vk/sharing/target/Target;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract onListScrolledToTheEnd()V
.end method

.method public abstract onOutsideClick()V
.end method

.method public abstract onRetryClick()V
.end method

.method public abstract onSearchClick()V
.end method

.method public abstract onSearchInputChanged(Ljava/lang/String;)V
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract onSendClick()V
.end method

.method public abstract onViewHidden()V
.end method

.method public abstract onViewShown()V
.end method
