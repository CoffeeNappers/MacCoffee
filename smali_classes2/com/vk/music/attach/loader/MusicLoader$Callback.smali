.class public interface abstract Lcom/vk/music/attach/loader/MusicLoader$Callback;
.super Ljava/lang/Object;
.source "MusicLoader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/music/attach/loader/MusicLoader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "Callback"
.end annotation


# virtual methods
.method public abstract onMusicLoadingDone(Lcom/vk/music/attach/loader/MusicLoader;)V
    .param p1    # Lcom/vk/music/attach/loader/MusicLoader;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract onMusicLoadingError(Lcom/vk/music/attach/loader/MusicLoader;Ljava/lang/String;)V
    .param p1    # Lcom/vk/music/attach/loader/MusicLoader;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract onMusicLoadingMoreDone(Lcom/vk/music/attach/loader/MusicLoader;Ljava/util/List;)V
    .param p1    # Lcom/vk/music/attach/loader/MusicLoader;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/util/List;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vk/music/attach/loader/MusicLoader;",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract onMusicLoadingMoreError(Lcom/vk/music/attach/loader/MusicLoader;Ljava/lang/String;)V
    .param p1    # Lcom/vk/music/attach/loader/MusicLoader;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method
