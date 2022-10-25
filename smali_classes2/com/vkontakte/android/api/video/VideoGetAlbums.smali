.class public Lcom/vkontakte/android/api/video/VideoGetAlbums;
.super Lcom/vkontakte/android/api/ListAPIRequest;
.source "VideoGetAlbums.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/ListAPIRequest",
        "<",
        "Lcom/vkontakte/android/api/VideoAlbum;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(III)V
    .locals 3
    .param p1, "oid"    # I
    .param p2, "offset"    # I
    .param p3, "count"    # I

    .prologue
    .line 9
    const-string/jumbo v0, "video.getAlbums"

    const-class v1, Lcom/vkontakte/android/api/VideoAlbum;

    invoke-direct {p0, v0, v1}, Lcom/vkontakte/android/api/ListAPIRequest;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    .line 10
    const-string/jumbo v0, "owner_id"

    invoke-virtual {p0, v0, p1}, Lcom/vkontakte/android/api/video/VideoGetAlbums;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    const-string/jumbo v1, "count"

    invoke-virtual {v0, v1, p3}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    const-string/jumbo v1, "offset"

    invoke-virtual {v0, v1, p2}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    const-string/jumbo v1, "extended"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 11
    return-void
.end method
