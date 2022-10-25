.class interface abstract Lcom/vkontakte/android/audio/player/DownloadTaskBase$DownloadTaskListener;
.super Ljava/lang/Object;
.source "DownloadTaskBase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/audio/player/DownloadTaskBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x608
    name = "DownloadTaskListener"
.end annotation


# virtual methods
.method public abstract isAllTasksFinished()Z
.end method

.method public abstract onFinished(Lcom/vkontakte/android/audio/player/DownloadTaskBase;Z)V
.end method

.method public varargs abstract onRemoveTracks([Lcom/vkontakte/android/audio/player/SavedTrack;)V
.end method

.method public varargs abstract onSaveTracks([Lcom/vkontakte/android/audio/player/SavedTrack;)V
.end method
