.class public interface abstract Lcom/vkontakte/android/audio/player/SavedTracks$SavedTracksListener;
.super Ljava/lang/Object;
.source "SavedTracks.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/audio/player/SavedTracks;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "SavedTracksListener"
.end annotation


# virtual methods
.method public abstract onDownloadFinished(Z)V
.end method

.method public abstract onDownloadStarted()V
.end method

.method public abstract onSavedTracksChanged()V
.end method

.method public abstract onSavedTracksSaved()V
.end method
