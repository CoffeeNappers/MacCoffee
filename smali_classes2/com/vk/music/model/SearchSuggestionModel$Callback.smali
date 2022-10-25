.class public interface abstract Lcom/vk/music/model/SearchSuggestionModel$Callback;
.super Ljava/lang/Object;
.source "SearchSuggestionModel.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/music/model/SearchSuggestionModel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "Callback"
.end annotation


# virtual methods
.method public abstract onHintsLoadingDone(Lcom/vk/music/model/SearchSuggestionModel;)V
    .param p1    # Lcom/vk/music/model/SearchSuggestionModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract onHintsLoadingError(Lcom/vk/music/model/SearchSuggestionModel;Ljava/lang/String;)V
    .param p1    # Lcom/vk/music/model/SearchSuggestionModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract onPopularLoadingDone(Lcom/vk/music/model/SearchSuggestionModel;)V
    .param p1    # Lcom/vk/music/model/SearchSuggestionModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract onPopularLoadingError(Lcom/vk/music/model/SearchSuggestionModel;Ljava/lang/String;)V
    .param p1    # Lcom/vk/music/model/SearchSuggestionModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract onRecentsChanged(Lcom/vk/music/model/SearchSuggestionModel;)V
    .param p1    # Lcom/vk/music/model/SearchSuggestionModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method
