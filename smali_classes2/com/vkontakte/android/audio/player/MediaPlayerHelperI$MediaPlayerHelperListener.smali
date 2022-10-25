.class public interface abstract Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener;
.super Ljava/lang/Object;
.source "MediaPlayerHelperI.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "MediaPlayerHelperListener"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener$ErrorType;
    }
.end annotation


# virtual methods
.method public abstract onBufferingProgress(Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;I)V
    .param p1    # Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract onCompleted(Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;)V
    .param p1    # Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract onError(Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$MediaPlayerHelperListener$ErrorType;)V
    .param p1    # Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract onHelperIdChange(I)V
.end method

.method public abstract onPrepared(Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;I)V
    .param p1    # Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract onProgress(Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;I)V
    .param p1    # Lcom/vkontakte/android/audio/player/MediaPlayerHelperI;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method
