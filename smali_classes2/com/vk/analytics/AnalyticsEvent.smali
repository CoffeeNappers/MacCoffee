.class public Lcom/vk/analytics/AnalyticsEvent;
.super Ljava/lang/Object;
.source "AnalyticsEvent.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/analytics/AnalyticsEvent$MediaRecorderEvent;,
        Lcom/vk/analytics/AnalyticsEvent$MediaCameraEvent;,
        Lcom/vk/analytics/AnalyticsEvent$MediaPlayerSuccessEvent;,
        Lcom/vk/analytics/AnalyticsEvent$MediaVideoStreamEvent;,
        Lcom/vk/analytics/AnalyticsEvent$MediaPlayerErrorEvent;,
        Lcom/vk/analytics/AnalyticsEvent$MediaDecoderErrorEvent;,
        Lcom/vk/analytics/AnalyticsEvent$ErrorEvent;
    }
.end annotation


# static fields
.field public static final EVENTS_TOTAL_MAX_ERRORS:I = 0x4


# instance fields
.field protected mName:Ljava/lang/String;

.field protected mParams:Landroid/os/Bundle;

.field protected mTags:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    iput-object v0, p0, Lcom/vk/analytics/AnalyticsEvent;->mParams:Landroid/os/Bundle;

    .line 13
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/vk/analytics/AnalyticsEvent;->mTags:Ljava/util/HashMap;

    return-void
.end method


# virtual methods
.method public getEventName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 27
    invoke-virtual {p0}, Lcom/vk/analytics/AnalyticsEvent;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 24
    iget-object v0, p0, Lcom/vk/analytics/AnalyticsEvent;->mName:Ljava/lang/String;

    return-object v0
.end method

.method public isReady()Z
    .locals 1

    .prologue
    .line 16
    const/4 v0, 0x1

    return v0
.end method

.method public params()Landroid/os/Bundle;
    .locals 1

    .prologue
    .line 20
    iget-object v0, p0, Lcom/vk/analytics/AnalyticsEvent;->mParams:Landroid/os/Bundle;

    return-object v0
.end method
