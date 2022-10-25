.class public Lcom/vkontakte/android/api/video/VideoStopHeartbeat;
.super Lcom/vkontakte/android/api/ResultlessAPIRequest;
.source "VideoStopHeartbeat.java"


# direct methods
.method public constructor <init>(II)V
    .locals 1
    .param p1, "ownerID"    # I
    .param p2, "videoID"    # I

    .prologue
    .line 10
    const-string/jumbo v0, "video.liveStopHeartbeat"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/api/ResultlessAPIRequest;-><init>(Ljava/lang/String;)V

    .line 11
    const-string/jumbo v0, "owner_id"

    invoke-virtual {p0, v0, p1}, Lcom/vkontakte/android/api/video/VideoStopHeartbeat;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 12
    const-string/jumbo v0, "video_id"

    invoke-virtual {p0, v0, p2}, Lcom/vkontakte/android/api/video/VideoStopHeartbeat;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 13
    return-void
.end method
