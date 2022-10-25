.class public Lio/sentry/event/helper/ContextBuilderHelper;
.super Ljava/lang/Object;
.source "ContextBuilderHelper.java"

# interfaces
.implements Lio/sentry/event/helper/EventBuilderHelper;


# instance fields
.field private sentryClient:Lio/sentry/SentryClient;


# direct methods
.method public constructor <init>(Lio/sentry/SentryClient;)V
    .locals 0
    .param p1, "sentryClient"    # Lio/sentry/SentryClient;

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    iput-object p1, p0, Lio/sentry/event/helper/ContextBuilderHelper;->sentryClient:Lio/sentry/SentryClient;

    .line 32
    return-void
.end method

.method private fromUser(Lio/sentry/event/User;)Lio/sentry/event/interfaces/UserInterface;
    .locals 5
    .param p1, "user"    # Lio/sentry/event/User;

    .prologue
    .line 59
    new-instance v0, Lio/sentry/event/interfaces/UserInterface;

    invoke-virtual {p1}, Lio/sentry/event/User;->getId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lio/sentry/event/User;->getUsername()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Lio/sentry/event/User;->getIpAddress()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1}, Lio/sentry/event/User;->getEmail()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v0, v1, v2, v3, v4}, Lio/sentry/event/interfaces/UserInterface;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method


# virtual methods
.method public helpBuildingEvent(Lio/sentry/event/EventBuilder;)V
    .locals 4
    .param p1, "eventBuilder"    # Lio/sentry/event/EventBuilder;

    .prologue
    .line 36
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 37
    .local v1, "breadcrumbs":Ljava/util/List;, "Ljava/util/List<Lio/sentry/event/Breadcrumb;>;"
    iget-object v3, p0, Lio/sentry/event/helper/ContextBuilderHelper;->sentryClient:Lio/sentry/SentryClient;

    invoke-virtual {v3}, Lio/sentry/SentryClient;->getContext()Lio/sentry/context/Context;

    move-result-object v2

    .line 39
    .local v2, "context":Lio/sentry/context/Context;
    invoke-virtual {v2}, Lio/sentry/context/Context;->getBreadcrumbs()Ljava/util/Iterator;

    move-result-object v0

    .line 40
    .local v0, "breadcrumbIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lio/sentry/event/Breadcrumb;>;"
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 41
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 44
    :cond_0
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_1

    .line 45
    invoke-virtual {p1, v1}, Lio/sentry/event/EventBuilder;->withBreadcrumbs(Ljava/util/List;)Lio/sentry/event/EventBuilder;

    .line 48
    :cond_1
    invoke-virtual {v2}, Lio/sentry/context/Context;->getUser()Lio/sentry/event/User;

    move-result-object v3

    if-eqz v3, :cond_2

    .line 49
    invoke-virtual {v2}, Lio/sentry/context/Context;->getUser()Lio/sentry/event/User;

    move-result-object v3

    invoke-direct {p0, v3}, Lio/sentry/event/helper/ContextBuilderHelper;->fromUser(Lio/sentry/event/User;)Lio/sentry/event/interfaces/UserInterface;

    move-result-object v3

    invoke-virtual {p1, v3}, Lio/sentry/event/EventBuilder;->withSentryInterface(Lio/sentry/event/interfaces/SentryInterface;)Lio/sentry/event/EventBuilder;

    .line 51
    :cond_2
    return-void
.end method
