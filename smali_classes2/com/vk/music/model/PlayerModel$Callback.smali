.class public interface abstract Lcom/vk/music/model/PlayerModel$Callback;
.super Ljava/lang/Object;
.source "PlayerModel.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/music/model/PlayerModel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "Callback"
.end annotation


# virtual methods
.method public abstract onPlayingPaused(Lcom/vk/music/model/PlayerModel;)V
    .param p1    # Lcom/vk/music/model/PlayerModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract onPlayingResumed(Lcom/vk/music/model/PlayerModel;)V
    .param p1    # Lcom/vk/music/model/PlayerModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract onPlayingStopped(Lcom/vk/music/model/PlayerModel;)V
    .param p1    # Lcom/vk/music/model/PlayerModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method
