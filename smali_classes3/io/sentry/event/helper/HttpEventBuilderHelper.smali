.class public Lio/sentry/event/helper/HttpEventBuilderHelper;
.super Ljava/lang/Object;
.source "HttpEventBuilderHelper.java"

# interfaces
.implements Lio/sentry/event/helper/EventBuilderHelper;


# instance fields
.field private final remoteAddressResolver:Lio/sentry/event/helper/RemoteAddressResolver;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    new-instance v0, Lio/sentry/event/helper/BasicRemoteAddressResolver;

    invoke-direct {v0}, Lio/sentry/event/helper/BasicRemoteAddressResolver;-><init>()V

    iput-object v0, p0, Lio/sentry/event/helper/HttpEventBuilderHelper;->remoteAddressResolver:Lio/sentry/event/helper/RemoteAddressResolver;

    .line 25
    return-void
.end method

.method public constructor <init>(Lio/sentry/event/helper/RemoteAddressResolver;)V
    .locals 0
    .param p1, "remoteAddressResolver"    # Lio/sentry/event/helper/RemoteAddressResolver;

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    iput-object p1, p0, Lio/sentry/event/helper/HttpEventBuilderHelper;->remoteAddressResolver:Lio/sentry/event/helper/RemoteAddressResolver;

    .line 34
    return-void
.end method

.method private addHttpInterface(Lio/sentry/event/EventBuilder;Ljavax/servlet/http/HttpServletRequest;)V
    .locals 2
    .param p1, "eventBuilder"    # Lio/sentry/event/EventBuilder;
    .param p2, "servletRequest"    # Ljavax/servlet/http/HttpServletRequest;

    .prologue
    .line 48
    new-instance v0, Lio/sentry/event/interfaces/HttpInterface;

    iget-object v1, p0, Lio/sentry/event/helper/HttpEventBuilderHelper;->remoteAddressResolver:Lio/sentry/event/helper/RemoteAddressResolver;

    invoke-direct {v0, p2, v1}, Lio/sentry/event/interfaces/HttpInterface;-><init>(Ljavax/servlet/http/HttpServletRequest;Lio/sentry/event/helper/RemoteAddressResolver;)V

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Lio/sentry/event/EventBuilder;->withSentryInterface(Lio/sentry/event/interfaces/SentryInterface;Z)Lio/sentry/event/EventBuilder;

    .line 49
    return-void
.end method

.method private addUserInterface(Lio/sentry/event/EventBuilder;Ljavax/servlet/http/HttpServletRequest;)V
    .locals 4
    .param p1, "eventBuilder"    # Lio/sentry/event/EventBuilder;
    .param p2, "servletRequest"    # Ljavax/servlet/http/HttpServletRequest;

    .prologue
    const/4 v3, 0x0

    .line 52
    const/4 v1, 0x0

    .line 53
    .local v1, "username":Ljava/lang/String;
    invoke-interface {p2}, Ljavax/servlet/http/HttpServletRequest;->getUserPrincipal()Ljava/security/Principal;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 54
    invoke-interface {p2}, Ljavax/servlet/http/HttpServletRequest;->getUserPrincipal()Ljava/security/Principal;

    move-result-object v2

    invoke-interface {v2}, Ljava/security/Principal;->getName()Ljava/lang/String;

    move-result-object v1

    .line 57
    :cond_0
    new-instance v0, Lio/sentry/event/interfaces/UserInterface;

    iget-object v2, p0, Lio/sentry/event/helper/HttpEventBuilderHelper;->remoteAddressResolver:Lio/sentry/event/helper/RemoteAddressResolver;

    invoke-interface {v2, p2}, Lio/sentry/event/helper/RemoteAddressResolver;->getRemoteAddress(Ljavax/servlet/http/HttpServletRequest;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v3, v1, v2, v3}, Lio/sentry/event/interfaces/UserInterface;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 59
    .local v0, "userInterface":Lio/sentry/event/interfaces/UserInterface;
    const/4 v2, 0x0

    invoke-virtual {p1, v0, v2}, Lio/sentry/event/EventBuilder;->withSentryInterface(Lio/sentry/event/interfaces/SentryInterface;Z)Lio/sentry/event/EventBuilder;

    .line 60
    return-void
.end method


# virtual methods
.method public getRemoteAddressResolver()Lio/sentry/event/helper/RemoteAddressResolver;
    .locals 1

    .prologue
    .line 63
    iget-object v0, p0, Lio/sentry/event/helper/HttpEventBuilderHelper;->remoteAddressResolver:Lio/sentry/event/helper/RemoteAddressResolver;

    return-object v0
.end method

.method public helpBuildingEvent(Lio/sentry/event/EventBuilder;)V
    .locals 1
    .param p1, "eventBuilder"    # Lio/sentry/event/EventBuilder;

    .prologue
    .line 38
    invoke-static {}, Lio/sentry/servlet/SentryServletRequestListener;->getServletRequest()Ljavax/servlet/http/HttpServletRequest;

    move-result-object v0

    .line 39
    .local v0, "servletRequest":Ljavax/servlet/http/HttpServletRequest;
    if-nez v0, :cond_0

    .line 45
    :goto_0
    return-void

    .line 43
    :cond_0
    invoke-direct {p0, p1, v0}, Lio/sentry/event/helper/HttpEventBuilderHelper;->addHttpInterface(Lio/sentry/event/EventBuilder;Ljavax/servlet/http/HttpServletRequest;)V

    .line 44
    invoke-direct {p0, p1, v0}, Lio/sentry/event/helper/HttpEventBuilderHelper;->addUserInterface(Lio/sentry/event/EventBuilder;Ljavax/servlet/http/HttpServletRequest;)V

    goto :goto_0
.end method
