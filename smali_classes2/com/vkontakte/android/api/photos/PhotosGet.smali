.class public Lcom/vkontakte/android/api/photos/PhotosGet;
.super Lcom/vkontakte/android/api/ListAPIRequest;
.source "PhotosGet.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/ListAPIRequest",
        "<",
        "Lcom/vkontakte/android/Photo;",
        ">;"
    }
.end annotation


# instance fields
.field uid:I


# direct methods
.method public constructor <init>(IIII)V
    .locals 6
    .param p1, "uid"    # I
    .param p2, "aid"    # I
    .param p3, "offset"    # I
    .param p4, "count"    # I

    .prologue
    .line 10
    const/4 v5, 0x0

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    invoke-direct/range {v0 .. v5}, Lcom/vkontakte/android/api/photos/PhotosGet;-><init>(IIIIZ)V

    .line 11
    return-void
.end method

.method public constructor <init>(IIIIZ)V
    .locals 3
    .param p1, "uid"    # I
    .param p2, "aid"    # I
    .param p3, "offset"    # I
    .param p4, "count"    # I
    .param p5, "rev"    # Z

    .prologue
    const/4 v2, 0x1

    .line 14
    if-eqz p2, :cond_1

    const-string/jumbo v0, "photos.get"

    :goto_0
    const-class v1, Lcom/vkontakte/android/Photo;

    invoke-direct {p0, v0, v1}, Lcom/vkontakte/android/api/ListAPIRequest;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    .line 15
    iput p1, p0, Lcom/vkontakte/android/api/photos/PhotosGet;->uid:I

    .line 16
    const-string/jumbo v0, "album_id"

    invoke-virtual {p0, v0, p2}, Lcom/vkontakte/android/api/photos/PhotosGet;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    const-string/jumbo v1, "owner_id"

    invoke-virtual {v0, v1, p1}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    const-string/jumbo v1, "extended"

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 17
    const-string/jumbo v0, "photo_sizes"

    invoke-virtual {p0, v0, v2}, Lcom/vkontakte/android/api/photos/PhotosGet;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 18
    const-string/jumbo v0, "offset"

    invoke-virtual {p0, v0, p3}, Lcom/vkontakte/android/api/photos/PhotosGet;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    const-string/jumbo v1, "count"

    invoke-virtual {v0, v1, p4}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 19
    if-eqz p5, :cond_0

    .line 20
    const-string/jumbo v0, "rev"

    invoke-virtual {p0, v0, v2}, Lcom/vkontakte/android/api/photos/PhotosGet;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 22
    :cond_0
    return-void

    .line 14
    :cond_1
    const-string/jumbo v0, "photos.getAll"

    goto :goto_0
.end method
