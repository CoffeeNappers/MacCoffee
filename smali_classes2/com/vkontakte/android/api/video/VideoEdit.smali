.class public Lcom/vkontakte/android/api/video/VideoEdit;
.super Lcom/vkontakte/android/api/ResultlessAPIRequest;
.source "VideoEdit.java"


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/api/VideoFile;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "video"    # Lcom/vkontakte/android/api/VideoFile;
    .param p2, "newName"    # Ljava/lang/String;
    .param p3, "newDescription"    # Ljava/lang/String;
    .param p4, "privacy"    # Ljava/lang/String;
    .param p5, "commentsPrivacy"    # Ljava/lang/String;

    .prologue
    .line 12
    const-string/jumbo v0, "video.edit"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/api/ResultlessAPIRequest;-><init>(Ljava/lang/String;)V

    .line 13
    const-string/jumbo v0, "owner_id"

    iget v1, p1, Lcom/vkontakte/android/api/VideoFile;->oid:I

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/video/VideoEdit;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 14
    const-string/jumbo v0, "video_id"

    iget v1, p1, Lcom/vkontakte/android/api/VideoFile;->vid:I

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/video/VideoEdit;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 15
    const-string/jumbo v0, "name"

    invoke-virtual {p0, v0, p2}, Lcom/vkontakte/android/api/video/VideoEdit;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 16
    const-string/jumbo v0, "desc"

    invoke-virtual {p0, v0, p3}, Lcom/vkontakte/android/api/video/VideoEdit;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 17
    const-string/jumbo v0, "privacy_view"

    invoke-virtual {p0, v0, p4}, Lcom/vkontakte/android/api/video/VideoEdit;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 19
    const-string/jumbo v0, "privacy_comment"

    invoke-virtual {p0, v0, p5}, Lcom/vkontakte/android/api/video/VideoEdit;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 20
    return-void
.end method
