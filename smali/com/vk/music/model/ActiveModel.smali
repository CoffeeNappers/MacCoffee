.class public interface abstract Lcom/vk/music/model/ActiveModel;
.super Ljava/lang/Object;
.source "ActiveModel.java"


# virtual methods
.method public abstract clearCallbacks()V
.end method

.method public abstract release()V
.end method

.method public abstract restore(Landroid/os/Bundle;)V
    .param p1    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract save()Landroid/os/Bundle;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end method
