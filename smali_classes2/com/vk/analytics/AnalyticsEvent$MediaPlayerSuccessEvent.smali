.class public Lcom/vk/analytics/AnalyticsEvent$MediaPlayerSuccessEvent;
.super Lcom/vk/analytics/AnalyticsEvent;
.source "AnalyticsEvent.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/analytics/AnalyticsEvent;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "MediaPlayerSuccessEvent"
.end annotation


# static fields
.field protected static final EVENTS_COLLECT:I = 0x10

.field private static sSuccessEventCounter:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 75
    const/4 v0, 0x0

    sput v0, Lcom/vk/analytics/AnalyticsEvent$MediaPlayerSuccessEvent;->sSuccessEventCounter:I

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 77
    invoke-direct {p0}, Lcom/vk/analytics/AnalyticsEvent;-><init>()V

    .line 78
    const-string/jumbo v0, "SUCCESS_PLAYER"

    iput-object v0, p0, Lcom/vk/analytics/AnalyticsEvent$MediaPlayerSuccessEvent;->mName:Ljava/lang/String;

    .line 79
    sget v0, Lcom/vk/analytics/AnalyticsEvent$MediaPlayerSuccessEvent;->sSuccessEventCounter:I

    add-int/lit8 v0, v0, 0x1

    sput v0, Lcom/vk/analytics/AnalyticsEvent$MediaPlayerSuccessEvent;->sSuccessEventCounter:I

    .line 80
    return-void
.end method


# virtual methods
.method public isReady()Z
    .locals 2

    .prologue
    .line 84
    sget v0, Lcom/vk/analytics/AnalyticsEvent$MediaPlayerSuccessEvent;->sSuccessEventCounter:I

    const/16 v1, 0x10

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
