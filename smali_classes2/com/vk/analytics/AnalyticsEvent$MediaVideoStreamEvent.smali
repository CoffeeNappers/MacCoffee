.class public Lcom/vk/analytics/AnalyticsEvent$MediaVideoStreamEvent;
.super Lcom/vk/analytics/AnalyticsEvent$ErrorEvent;
.source "AnalyticsEvent.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/analytics/AnalyticsEvent;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "MediaVideoStreamEvent"
.end annotation


# direct methods
.method public constructor <init>(II)V
    .locals 3
    .param p1, "ownerId"    # I
    .param p2, "videoId"    # I

    .prologue
    .line 67
    const-string/jumbo v0, "ERROR_VIDEO_STREAM"

    invoke-direct {p0, v0}, Lcom/vk/analytics/AnalyticsEvent$ErrorEvent;-><init>(Ljava/lang/String;)V

    .line 68
    invoke-virtual {p0}, Lcom/vk/analytics/AnalyticsEvent$MediaVideoStreamEvent;->params()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "key_video_oid"

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 69
    invoke-virtual {p0}, Lcom/vk/analytics/AnalyticsEvent$MediaVideoStreamEvent;->params()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "key_video_vid"

    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 70
    return-void
.end method
