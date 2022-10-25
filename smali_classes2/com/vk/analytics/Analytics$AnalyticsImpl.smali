.class Lcom/vk/analytics/Analytics$AnalyticsImpl;
.super Ljava/lang/Object;
.source "Analytics.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/analytics/Analytics;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "AnalyticsImpl"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/analytics/Analytics$AnalyticsImpl$CustomBuilderHelper;,
        Lcom/vk/analytics/Analytics$AnalyticsImpl$CustomFactory;
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 264
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static init(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p0, "ctx"    # Landroid/content/Context;
    .param p1, "dsn"    # Ljava/lang/String;
    .param p2, "id"    # Ljava/lang/String;

    .prologue
    .line 266
    new-instance v0, Lcom/vk/analytics/Analytics$AnalyticsImpl$CustomFactory;

    invoke-direct {v0, p0, p2}, Lcom/vk/analytics/Analytics$AnalyticsImpl$CustomFactory;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    invoke-static {p1, v0}, Lio/sentry/Sentry;->init(Ljava/lang/String;Lio/sentry/SentryClientFactory;)Lio/sentry/SentryClient;

    .line 267
    return-void
.end method

.method public static logEvent(Lcom/vk/analytics/AnalyticsEvent;Z)Z
    .locals 9
    .param p0, "event"    # Lcom/vk/analytics/AnalyticsEvent;
    .param p1, "error"    # Z

    .prologue
    .line 270
    new-instance v6, Lio/sentry/event/EventBuilder;

    invoke-direct {v6}, Lio/sentry/event/EventBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/vk/analytics/AnalyticsEvent;->getEventName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Lio/sentry/event/EventBuilder;->withMessage(Ljava/lang/String;)Lio/sentry/event/EventBuilder;

    move-result-object v7

    if-eqz p1, :cond_2

    sget-object v6, Lio/sentry/event/Event$Level;->ERROR:Lio/sentry/event/Event$Level;

    .line 271
    :goto_0
    invoke-virtual {v7, v6}, Lio/sentry/event/EventBuilder;->withLevel(Lio/sentry/event/Event$Level;)Lio/sentry/event/EventBuilder;

    move-result-object v2

    .line 272
    .local v2, "eventBuilder":Lio/sentry/event/EventBuilder;
    invoke-static {}, Lio/sentry/Sentry;->getStoredClient()Lio/sentry/SentryClient;

    move-result-object v6

    invoke-virtual {v6, v2}, Lio/sentry/SentryClient;->runBuilderHelpers(Lio/sentry/event/EventBuilder;)V

    .line 274
    invoke-virtual {p0}, Lcom/vk/analytics/AnalyticsEvent;->params()Landroid/os/Bundle;

    move-result-object v0

    .line 275
    .local v0, "bundle":Landroid/os/Bundle;
    if-eqz v0, :cond_4

    .line 277
    :try_start_0
    iget-object v6, p0, Lcom/vk/analytics/AnalyticsEvent;->mTags:Ljava/util/HashMap;

    invoke-virtual {v6}, Ljava/util/HashMap;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_0

    .line 278
    invoke-virtual {v2}, Lio/sentry/event/EventBuilder;->getEvent()Lio/sentry/event/Event;

    move-result-object v1

    .line 279
    .local v1, "e":Lio/sentry/event/Event;
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Lio/sentry/event/Event;->getContexts()Ljava/util/Map;

    move-result-object v6

    if-eqz v6, :cond_0

    .line 280
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 281
    .local v4, "tags":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    iget-object v6, p0, Lcom/vk/analytics/AnalyticsEvent;->mTags:Ljava/util/HashMap;

    invoke-interface {v4, v6}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 282
    invoke-virtual {v1}, Lio/sentry/event/Event;->getContexts()Ljava/util/Map;

    move-result-object v6

    invoke-virtual {p0}, Lcom/vk/analytics/AnalyticsEvent;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v7, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 286
    .end local v1    # "e":Lio/sentry/event/Event;
    .end local v4    # "tags":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_0
    invoke-virtual {v0}, Landroid/os/Bundle;->keySet()Ljava/util/Set;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_1
    :goto_1
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_3

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 287
    .local v3, "key":Ljava/lang/String;
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_1

    .line 288
    invoke-virtual {v0, v3}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 289
    .local v5, "value":Ljava/lang/String;
    invoke-virtual {v2, v3, v5}, Lio/sentry/event/EventBuilder;->withExtra(Ljava/lang/String;Ljava/lang/Object;)Lio/sentry/event/EventBuilder;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 293
    .end local v3    # "key":Ljava/lang/String;
    .end local v5    # "value":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 294
    .local v1, "e":Ljava/lang/Exception;
    invoke-static {}, Lcom/vk/analytics/Analytics;->access$300()Ljava/lang/String;

    move-result-object v7

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "logEvent: "

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    if-eqz v1, :cond_5

    invoke-virtual {v1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v6

    :goto_2
    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v7, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 295
    const/4 v6, 0x0

    .line 298
    .end local v1    # "e":Ljava/lang/Exception;
    :goto_3
    return v6

    .line 270
    .end local v0    # "bundle":Landroid/os/Bundle;
    .end local v2    # "eventBuilder":Lio/sentry/event/EventBuilder;
    :cond_2
    sget-object v6, Lio/sentry/event/Event$Level;->INFO:Lio/sentry/event/Event$Level;

    goto/16 :goto_0

    .line 292
    .restart local v0    # "bundle":Landroid/os/Bundle;
    .restart local v2    # "eventBuilder":Lio/sentry/event/EventBuilder;
    :cond_3
    :try_start_1
    invoke-static {}, Lio/sentry/Sentry;->getStoredClient()Lio/sentry/SentryClient;

    move-result-object v6

    invoke-virtual {v2}, Lio/sentry/event/EventBuilder;->build()Lio/sentry/event/Event;

    move-result-object v7

    invoke-virtual {v6, v7}, Lio/sentry/SentryClient;->sendEvent(Lio/sentry/event/Event;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 298
    :cond_4
    const/4 v6, 0x1

    goto :goto_3

    .line 294
    .restart local v1    # "e":Ljava/lang/Exception;
    :cond_5
    const/4 v6, 0x0

    goto :goto_2
.end method
