.class public Lcom/vkontakte/android/api/video/VideoLiveSubscribe;
.super Lcom/vkontakte/android/api/ResultlessAPIRequest;
.source "VideoLiveSubscribe.java"


# direct methods
.method public constructor <init>(IZ)V
    .locals 1
    .param p1, "ownerId"    # I
    .param p2, "subscribe"    # Z

    .prologue
    .line 8
    if-eqz p2, :cond_0

    const-string/jumbo v0, "video.liveSubscribe"

    :goto_0
    invoke-direct {p0, v0}, Lcom/vkontakte/android/api/ResultlessAPIRequest;-><init>(Ljava/lang/String;)V

    .line 9
    const-string/jumbo v0, "owner_id"

    invoke-virtual {p0, v0, p1}, Lcom/vkontakte/android/api/video/VideoLiveSubscribe;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 10
    return-void

    .line 8
    :cond_0
    const-string/jumbo v0, "video.liveUnsubscribe"

    goto :goto_0
.end method
