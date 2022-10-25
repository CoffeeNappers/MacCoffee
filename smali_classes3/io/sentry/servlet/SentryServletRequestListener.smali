.class public Lio/sentry/servlet/SentryServletRequestListener;
.super Ljava/lang/Object;
.source "SentryServletRequestListener.java"

# interfaces
.implements Ljavax/servlet/ServletRequestListener;


# static fields
.field private static final THREAD_REQUEST:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal",
            "<",
            "Ljavax/servlet/http/HttpServletRequest;",
            ">;"
        }
    .end annotation
.end field

.field private static final logger:Lorg/slf4j/Logger;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 19
    const-class v0, Lio/sentry/servlet/SentryServletRequestListener;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    sput-object v0, Lio/sentry/servlet/SentryServletRequestListener;->logger:Lorg/slf4j/Logger;

    .line 21
    new-instance v0, Ljava/lang/ThreadLocal;

    invoke-direct {v0}, Ljava/lang/ThreadLocal;-><init>()V

    sput-object v0, Lio/sentry/servlet/SentryServletRequestListener;->THREAD_REQUEST:Ljava/lang/ThreadLocal;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getServletRequest()Ljavax/servlet/http/HttpServletRequest;
    .locals 1

    .prologue
    .line 24
    sget-object v0, Lio/sentry/servlet/SentryServletRequestListener;->THREAD_REQUEST:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljavax/servlet/http/HttpServletRequest;

    return-object v0
.end method


# virtual methods
.method public requestDestroyed(Ljavax/servlet/ServletRequestEvent;)V
    .locals 4
    .param p1, "servletRequestEvent"    # Ljavax/servlet/ServletRequestEvent;

    .prologue
    .line 29
    sget-object v2, Lio/sentry/servlet/SentryServletRequestListener;->THREAD_REQUEST:Ljava/lang/ThreadLocal;

    invoke-virtual {v2}, Ljava/lang/ThreadLocal;->remove()V

    .line 32
    :try_start_0
    invoke-static {}, Lio/sentry/Sentry;->getStoredClient()Lio/sentry/SentryClient;

    move-result-object v1

    .line 33
    .local v1, "sentryClient":Lio/sentry/SentryClient;
    if-eqz v1, :cond_0

    .line 34
    invoke-virtual {v1}, Lio/sentry/SentryClient;->getContext()Lio/sentry/context/Context;

    move-result-object v2

    invoke-virtual {v2}, Lio/sentry/context/Context;->clear()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 39
    .end local v1    # "sentryClient":Lio/sentry/SentryClient;
    :cond_0
    :goto_0
    return-void

    .line 36
    :catch_0
    move-exception v0

    .line 37
    .local v0, "e":Ljava/lang/Exception;
    sget-object v2, Lio/sentry/servlet/SentryServletRequestListener;->logger:Lorg/slf4j/Logger;

    const-string/jumbo v3, "Error clearing Context state."

    invoke-interface {v2, v3, v0}, Lorg/slf4j/Logger;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public requestInitialized(Ljavax/servlet/ServletRequestEvent;)V
    .locals 2
    .param p1, "servletRequestEvent"    # Ljavax/servlet/ServletRequestEvent;

    .prologue
    .line 43
    invoke-virtual {p1}, Ljavax/servlet/ServletRequestEvent;->getServletRequest()Ljavax/servlet/ServletRequest;

    move-result-object v0

    .line 44
    .local v0, "servletRequest":Ljavax/servlet/ServletRequest;
    instance-of v1, v0, Ljavax/servlet/http/HttpServletRequest;

    if-eqz v1, :cond_0

    .line 45
    sget-object v1, Lio/sentry/servlet/SentryServletRequestListener;->THREAD_REQUEST:Ljava/lang/ThreadLocal;

    check-cast v0, Ljavax/servlet/http/HttpServletRequest;

    .end local v0    # "servletRequest":Ljavax/servlet/ServletRequest;
    invoke-virtual {v1, v0}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    .line 47
    :cond_0
    return-void
.end method
