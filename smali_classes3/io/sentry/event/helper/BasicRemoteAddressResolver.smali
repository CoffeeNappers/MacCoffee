.class public Lio/sentry/event/helper/BasicRemoteAddressResolver;
.super Ljava/lang/Object;
.source "BasicRemoteAddressResolver.java"

# interfaces
.implements Lio/sentry/event/helper/RemoteAddressResolver;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getRemoteAddress(Ljavax/servlet/http/HttpServletRequest;)Ljava/lang/String;
    .locals 1
    .param p1, "request"    # Ljavax/servlet/http/HttpServletRequest;

    .prologue
    .line 17
    invoke-interface {p1}, Ljavax/servlet/http/HttpServletRequest;->getRemoteAddr()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
