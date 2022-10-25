.class public interface abstract Lcom/vk/music/view/adapter/TotalFooterCreatorBinder$Interactor;
.super Ljava/lang/Object;
.source "TotalFooterCreatorBinder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/music/view/adapter/TotalFooterCreatorBinder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "Interactor"
.end annotation


# virtual methods
.method public abstract getLayoutInflater()Landroid/view/LayoutInflater;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end method

.method public abstract getMusicTracks()Ljava/util/List;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getResourcer()Lcom/vk/core/util/Resourcer;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end method
