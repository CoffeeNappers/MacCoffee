.class public interface abstract Lcom/vk/music/model/SelectMusicModel$Callback;
.super Ljava/lang/Object;
.source "SelectMusicModel.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/music/model/SelectMusicModel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "Callback"
.end annotation


# virtual methods
.method public abstract onLoadingDone(Lcom/vk/music/model/SelectMusicModel;)V
    .param p1    # Lcom/vk/music/model/SelectMusicModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract onLoadingError(Lcom/vk/music/model/SelectMusicModel;Ljava/lang/String;)V
    .param p1    # Lcom/vk/music/model/SelectMusicModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract onLoadingMoreDone(Lcom/vk/music/model/SelectMusicModel;)V
    .param p1    # Lcom/vk/music/model/SelectMusicModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract onLoadingMoreError(Lcom/vk/music/model/SelectMusicModel;Ljava/lang/String;)V
    .param p1    # Lcom/vk/music/model/SelectMusicModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method
