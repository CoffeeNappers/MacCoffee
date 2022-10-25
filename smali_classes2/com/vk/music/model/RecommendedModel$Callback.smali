.class public interface abstract Lcom/vk/music/model/RecommendedModel$Callback;
.super Ljava/lang/Object;
.source "RecommendedModel.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/music/model/RecommendedModel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "Callback"
.end annotation


# virtual methods
.method public abstract onLoadingDone(Lcom/vk/music/model/RecommendedModel;)V
    .param p1    # Lcom/vk/music/model/RecommendedModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract onLoadingError(Lcom/vk/music/model/RecommendedModel;Lme/grishka/appkit/api/ErrorResponse;)V
    .param p1    # Lcom/vk/music/model/RecommendedModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lme/grishka/appkit/api/ErrorResponse;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method
