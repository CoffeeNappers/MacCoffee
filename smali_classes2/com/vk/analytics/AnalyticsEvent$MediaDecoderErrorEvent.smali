.class public Lcom/vk/analytics/AnalyticsEvent$MediaDecoderErrorEvent;
.super Lcom/vk/analytics/AnalyticsEvent$ErrorEvent;
.source "AnalyticsEvent.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/analytics/AnalyticsEvent;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "MediaDecoderErrorEvent"
.end annotation


# direct methods
.method public constructor <init>(ZLjava/lang/String;)V
    .locals 3
    .param p1, "isVideo"    # Z
    .param p2, "msg"    # Ljava/lang/String;

    .prologue
    .line 46
    if-eqz p1, :cond_1

    const-string/jumbo v0, "ERROR_DECODER_VIDEO"

    :goto_0
    invoke-direct {p0, v0}, Lcom/vk/analytics/AnalyticsEvent$ErrorEvent;-><init>(Ljava/lang/String;)V

    .line 48
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 49
    invoke-virtual {p0}, Lcom/vk/analytics/AnalyticsEvent$MediaDecoderErrorEvent;->params()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "key_decoder"

    invoke-virtual {v0, v1, p2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 51
    :cond_0
    invoke-virtual {p0}, Lcom/vk/analytics/AnalyticsEvent$MediaDecoderErrorEvent;->params()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "key_failure_count"

    sget v2, Lcom/vk/analytics/AnalyticsEvent$MediaDecoderErrorEvent;->sErrorEventCounter:I

    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 52
    return-void

    .line 46
    :cond_1
    const-string/jumbo v0, "ERROR_DECODER_AUDIO"

    goto :goto_0
.end method
