.class Lcom/vk/analytics/Analytics$AnalyticsImpl$CustomBuilderHelper;
.super Lio/sentry/android/event/helper/AndroidEventBuilderHelper;
.source "Analytics.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/analytics/Analytics$AnalyticsImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "CustomBuilderHelper"
.end annotation


# instance fields
.field private user:Lio/sentry/event/interfaces/UserInterface;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lio/sentry/event/interfaces/UserInterface;)V
    .locals 0
    .param p1, "ctx"    # Landroid/content/Context;
    .param p2, "user"    # Lio/sentry/event/interfaces/UserInterface;

    .prologue
    .line 327
    invoke-direct {p0, p1}, Lio/sentry/android/event/helper/AndroidEventBuilderHelper;-><init>(Landroid/content/Context;)V

    .line 328
    iput-object p2, p0, Lcom/vk/analytics/Analytics$AnalyticsImpl$CustomBuilderHelper;->user:Lio/sentry/event/interfaces/UserInterface;

    .line 329
    return-void
.end method


# virtual methods
.method public helpBuildingEvent(Lio/sentry/event/EventBuilder;)V
    .locals 2
    .param p1, "eventBuilder"    # Lio/sentry/event/EventBuilder;

    .prologue
    .line 333
    invoke-super {p0, p1}, Lio/sentry/android/event/helper/AndroidEventBuilderHelper;->helpBuildingEvent(Lio/sentry/event/EventBuilder;)V

    .line 334
    iget-object v0, p0, Lcom/vk/analytics/Analytics$AnalyticsImpl$CustomBuilderHelper;->user:Lio/sentry/event/interfaces/UserInterface;

    if-eqz v0, :cond_0

    .line 335
    iget-object v0, p0, Lcom/vk/analytics/Analytics$AnalyticsImpl$CustomBuilderHelper;->user:Lio/sentry/event/interfaces/UserInterface;

    const/4 v1, 0x1

    invoke-virtual {p1, v0, v1}, Lio/sentry/event/EventBuilder;->withSentryInterface(Lio/sentry/event/interfaces/SentryInterface;Z)Lio/sentry/event/EventBuilder;

    .line 337
    :cond_0
    return-void
.end method
