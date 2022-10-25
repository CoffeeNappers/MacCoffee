.class public Lcom/vk/analytics/AnalyticsEvent$ErrorEvent;
.super Lcom/vk/analytics/AnalyticsEvent;
.source "AnalyticsEvent.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/analytics/AnalyticsEvent;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ErrorEvent"
.end annotation


# static fields
.field protected static final EVENTS_MAX_ERRORS:I = 0x2

.field protected static sErrorEventCounter:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 31
    const/4 v0, 0x0

    sput v0, Lcom/vk/analytics/AnalyticsEvent$ErrorEvent;->sErrorEventCounter:I

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 33
    invoke-direct {p0}, Lcom/vk/analytics/AnalyticsEvent;-><init>()V

    .line 34
    iput-object p1, p0, Lcom/vk/analytics/AnalyticsEvent$ErrorEvent;->mName:Ljava/lang/String;

    .line 35
    sget v0, Lcom/vk/analytics/AnalyticsEvent$ErrorEvent;->sErrorEventCounter:I

    add-int/lit8 v0, v0, 0x1

    sput v0, Lcom/vk/analytics/AnalyticsEvent$ErrorEvent;->sErrorEventCounter:I

    .line 36
    return-void
.end method


# virtual methods
.method public isReady()Z
    .locals 2

    .prologue
    .line 40
    sget v0, Lcom/vk/analytics/AnalyticsEvent$ErrorEvent;->sErrorEventCounter:I

    const/4 v1, 0x2

    if-gt v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
