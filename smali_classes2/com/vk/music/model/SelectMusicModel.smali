.class public interface abstract Lcom/vk/music/model/SelectMusicModel;
.super Ljava/lang/Object;
.source "SelectMusicModel.java"

# interfaces
.implements Lcom/vk/music/model/ActiveModel;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/music/model/SelectMusicModel$View;,
        Lcom/vk/music/model/SelectMusicModel$Callback;
    }
.end annotation


# virtual methods
.method public abstract load()V
.end method

.method public abstract loadMore()V
.end method

.method public abstract select(Lcom/vkontakte/android/audio/MusicTrack;)V
    .param p1    # Lcom/vkontakte/android/audio/MusicTrack;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract subscribe(Lcom/vk/music/model/SelectMusicModel$Callback;)V
    .param p1    # Lcom/vk/music/model/SelectMusicModel$Callback;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract unselect(Lcom/vkontakte/android/audio/MusicTrack;)V
    .param p1    # Lcom/vkontakte/android/audio/MusicTrack;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract unsubscribe(Lcom/vk/music/model/SelectMusicModel$Callback;)V
    .param p1    # Lcom/vk/music/model/SelectMusicModel$Callback;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method
