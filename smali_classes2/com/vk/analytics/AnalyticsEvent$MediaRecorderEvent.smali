.class public Lcom/vk/analytics/AnalyticsEvent$MediaRecorderEvent;
.super Lcom/vk/analytics/AnalyticsEvent$ErrorEvent;
.source "AnalyticsEvent.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/analytics/AnalyticsEvent;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "MediaRecorderEvent"
.end annotation


# direct methods
.method public constructor <init>(ZZ)V
    .locals 1
    .param p1, "encoder"    # Z
    .param p2, "video"    # Z

    .prologue
    .line 133
    if-nez p1, :cond_0

    const-string/jumbo v0, "ERROR_RECORDER"

    :goto_0
    invoke-direct {p0, v0}, Lcom/vk/analytics/AnalyticsEvent$ErrorEvent;-><init>(Ljava/lang/String;)V

    .line 136
    return-void

    .line 133
    :cond_0
    if-eqz p2, :cond_1

    const-string/jumbo v0, "ERROR_ENCODER_VIDEO"

    goto :goto_0

    :cond_1
    const-string/jumbo v0, "ERROR_ENCODER_AUDIO"

    goto :goto_0
.end method
