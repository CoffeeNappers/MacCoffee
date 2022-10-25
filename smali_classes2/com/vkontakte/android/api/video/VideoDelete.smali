.class public Lcom/vkontakte/android/api/video/VideoDelete;
.super Lcom/vkontakte/android/api/ResultlessAPIRequest;
.source "VideoDelete.java"


# static fields
.field private static final methods:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 6
    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string/jumbo v2, "wall.delete"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string/jumbo v2, "photos.delete"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string/jumbo v2, ""

    aput-object v2, v0, v1

    sput-object v0, Lcom/vkontakte/android/api/video/VideoDelete;->methods:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(III)V
    .locals 1
    .param p1, "ownerID"    # I
    .param p2, "videoId"    # I
    .param p3, "targetId"    # I

    .prologue
    .line 9
    const-string/jumbo v0, "video.delete"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/api/ResultlessAPIRequest;-><init>(Ljava/lang/String;)V

    .line 10
    const-string/jumbo v0, "owner_id"

    invoke-virtual {p0, v0, p1}, Lcom/vkontakte/android/api/video/VideoDelete;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 11
    const-string/jumbo v0, "video_id"

    invoke-virtual {p0, v0, p2}, Lcom/vkontakte/android/api/video/VideoDelete;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 12
    const-string/jumbo v0, "target_id"

    invoke-virtual {p0, v0, p3}, Lcom/vkontakte/android/api/video/VideoDelete;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 14
    return-void
.end method
