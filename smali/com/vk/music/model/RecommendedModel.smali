.class public interface abstract Lcom/vk/music/model/RecommendedModel;
.super Ljava/lang/Object;
.source "RecommendedModel.java"

# interfaces
.implements Lcom/vk/music/model/ActiveModel;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/music/model/RecommendedModel$Callback;
    }
.end annotation


# virtual methods
.method public abstract getError()Ljava/lang/String;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end method

.method public abstract getMusicTrackModel()Lcom/vk/music/model/MusicTrackModel;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end method

.method public abstract getPlayerModel()Lcom/vk/music/model/PlayerModel;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end method

.method public abstract getSections()Ljava/util/ArrayList;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vk/music/dto/Section;",
            ">;"
        }
    .end annotation
.end method

.method public abstract load()V
.end method

.method public abstract playSection(Lcom/vk/music/dto/Section;Lcom/vkontakte/android/audio/MusicTrack;)V
    .param p1    # Lcom/vk/music/dto/Section;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/vkontakte/android/audio/MusicTrack;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
.end method

.method public abstract subscribe(Lcom/vk/music/model/RecommendedModel$Callback;)V
    .param p1    # Lcom/vk/music/model/RecommendedModel$Callback;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract unsubscribe(Lcom/vk/music/model/RecommendedModel$Callback;)V
    .param p1    # Lcom/vk/music/model/RecommendedModel$Callback;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method
