.class public Lcom/vkontakte/android/api/video/VideoLiveHeartbeat;
.super Lcom/vkontakte/android/api/ResultlessAPIRequest;
.source "VideoLiveHeartbeat.java"


# direct methods
.method public constructor <init>(II)V
    .locals 2
    .param p1, "ownerID"    # I
    .param p2, "videoID"    # I

    .prologue
    const/4 v1, 0x0

    .line 10
    const-string/jumbo v0, "video.liveHeartbeat"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/api/ResultlessAPIRequest;-><init>(Ljava/lang/String;)V

    .line 11
    const-string/jumbo v0, "owner_id"

    invoke-virtual {p0, v0, p1}, Lcom/vkontakte/android/api/video/VideoLiveHeartbeat;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 12
    const-string/jumbo v0, "video_id"

    invoke-virtual {p0, v0, p2}, Lcom/vkontakte/android/api/video/VideoLiveHeartbeat;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 13
    const-string/jumbo v0, "spectators_count"

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/video/VideoLiveHeartbeat;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 14
    const-string/jumbo v0, "extended"

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/video/VideoLiveHeartbeat;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 15
    return-void
.end method
