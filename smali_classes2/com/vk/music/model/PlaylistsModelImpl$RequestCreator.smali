.class public interface abstract Lcom/vk/music/model/PlaylistsModelImpl$RequestCreator;
.super Ljava/lang/Object;
.source "PlaylistsModelImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/music/model/PlaylistsModelImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "RequestCreator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# virtual methods
.method public abstract createLoadRequest(Lcom/vk/music/model/PlaylistsModelImpl;II)Lcom/vkontakte/android/api/VKAPIRequest;
    .param p1    # Lcom/vk/music/model/PlaylistsModelImpl;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vk/music/model/PlaylistsModelImpl;",
            "II)",
            "Lcom/vkontakte/android/api/VKAPIRequest",
            "<TT;>;"
        }
    .end annotation
.end method
