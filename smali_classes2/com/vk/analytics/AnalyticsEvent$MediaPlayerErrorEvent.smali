.class public Lcom/vk/analytics/AnalyticsEvent$MediaPlayerErrorEvent;
.super Lcom/vk/analytics/AnalyticsEvent$ErrorEvent;
.source "AnalyticsEvent.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/analytics/AnalyticsEvent;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "MediaPlayerErrorEvent"
.end annotation


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 3
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 57
    const-string/jumbo v0, "ERROR_PLAYER"

    invoke-direct {p0, v0}, Lcom/vk/analytics/AnalyticsEvent$ErrorEvent;-><init>(Ljava/lang/String;)V

    .line 58
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 59
    invoke-virtual {p0}, Lcom/vk/analytics/AnalyticsEvent$MediaPlayerErrorEvent;->params()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "key_decoder"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 61
    :cond_0
    invoke-virtual {p0}, Lcom/vk/analytics/AnalyticsEvent$MediaPlayerErrorEvent;->params()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "key_failure_count"

    sget v2, Lcom/vk/analytics/AnalyticsEvent$MediaPlayerErrorEvent;->sErrorEventCounter:I

    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 62
    return-void
.end method
