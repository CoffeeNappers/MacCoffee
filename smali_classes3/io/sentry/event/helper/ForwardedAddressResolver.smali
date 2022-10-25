.class public Lio/sentry/event/helper/ForwardedAddressResolver;
.super Ljava/lang/Object;
.source "ForwardedAddressResolver.java"

# interfaces
.implements Lio/sentry/event/helper/RemoteAddressResolver;


# instance fields
.field private basicRemoteAddressResolver:Lio/sentry/event/helper/BasicRemoteAddressResolver;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    new-instance v0, Lio/sentry/event/helper/BasicRemoteAddressResolver;

    invoke-direct {v0}, Lio/sentry/event/helper/BasicRemoteAddressResolver;-><init>()V

    iput-object v0, p0, Lio/sentry/event/helper/ForwardedAddressResolver;->basicRemoteAddressResolver:Lio/sentry/event/helper/BasicRemoteAddressResolver;

    .line 23
    return-void
.end method

.method private static firstAddress(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "csvAddrs"    # Ljava/lang/String;

    .prologue
    .line 26
    const-string/jumbo v1, ","

    invoke-virtual {p0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    .line 27
    .local v0, "ips":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method


# virtual methods
.method public getRemoteAddress(Ljavax/servlet/http/HttpServletRequest;)Ljava/lang/String;
    .locals 2
    .param p1, "request"    # Ljavax/servlet/http/HttpServletRequest;

    .prologue
    .line 32
    const-string/jumbo v1, "X-FORWARDED-FOR"

    invoke-interface {p1, v1}, Ljavax/servlet/http/HttpServletRequest;->getHeader(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 33
    .local v0, "forwarded":Ljava/lang/String;
    invoke-static {v0}, Lio/sentry/util/Util;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 34
    invoke-static {v0}, Lio/sentry/event/helper/ForwardedAddressResolver;->firstAddress(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 36
    :goto_0
    return-object v1

    :cond_0
    iget-object v1, p0, Lio/sentry/event/helper/ForwardedAddressResolver;->basicRemoteAddressResolver:Lio/sentry/event/helper/BasicRemoteAddressResolver;

    invoke-virtual {v1, p1}, Lio/sentry/event/helper/BasicRemoteAddressResolver;->getRemoteAddress(Ljavax/servlet/http/HttpServletRequest;)Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method
