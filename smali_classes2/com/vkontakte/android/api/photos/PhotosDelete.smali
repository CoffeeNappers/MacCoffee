.class public Lcom/vkontakte/android/api/photos/PhotosDelete;
.super Lcom/vkontakte/android/api/ResultlessAPIRequest;
.source "PhotosDelete.java"


# direct methods
.method public constructor <init>(II)V
    .locals 2
    .param p1, "oid"    # I
    .param p2, "pid"    # I

    .prologue
    .line 8
    const-string/jumbo v0, "photos.delete"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/api/ResultlessAPIRequest;-><init>(Ljava/lang/String;)V

    .line 9
    const-string/jumbo v0, "owner_id"

    invoke-virtual {p0, v0, p1}, Lcom/vkontakte/android/api/photos/PhotosDelete;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    const-string/jumbo v1, "photo_id"

    invoke-virtual {v0, v1, p2}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 10
    return-void
.end method
