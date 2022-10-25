.class public Lio/sentry/event/interfaces/HttpInterface;
.super Ljava/lang/Object;
.source "HttpInterface.java"

# interfaces
.implements Lio/sentry/event/interfaces/SentryInterface;


# static fields
.field public static final HTTP_INTERFACE:Ljava/lang/String; = "sentry.interfaces.Http"


# instance fields
.field private final asyncStarted:Z

.field private final authType:Ljava/lang/String;

.field private final body:Ljava/lang/String;

.field private final cookies:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final headers:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field private final localAddr:Ljava/lang/String;

.field private final localName:Ljava/lang/String;

.field private final localPort:I

.field private final method:Ljava/lang/String;

.field private final parameters:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field private final protocol:Ljava/lang/String;

.field private final queryString:Ljava/lang/String;

.field private final remoteAddr:Ljava/lang/String;

.field private final remoteUser:Ljava/lang/String;

.field private final requestUrl:Ljava/lang/String;

.field private final secure:Z

.field private final serverName:Ljava/lang/String;

.field private final serverPort:I


# direct methods
.method public constructor <init>(Ljavax/servlet/http/HttpServletRequest;)V
    .locals 1
    .param p1, "request"    # Ljavax/servlet/http/HttpServletRequest;

    .prologue
    .line 43
    new-instance v0, Lio/sentry/event/helper/BasicRemoteAddressResolver;

    invoke-direct {v0}, Lio/sentry/event/helper/BasicRemoteAddressResolver;-><init>()V

    invoke-direct {p0, p1, v0}, Lio/sentry/event/interfaces/HttpInterface;-><init>(Ljavax/servlet/http/HttpServletRequest;Lio/sentry/event/helper/RemoteAddressResolver;)V

    .line 44
    return-void
.end method

.method public constructor <init>(Ljavax/servlet/http/HttpServletRequest;Lio/sentry/event/helper/RemoteAddressResolver;)V
    .locals 1
    .param p1, "request"    # Ljavax/servlet/http/HttpServletRequest;
    .param p2, "remoteAddressResolver"    # Lio/sentry/event/helper/RemoteAddressResolver;

    .prologue
    .line 53
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lio/sentry/event/interfaces/HttpInterface;-><init>(Ljavax/servlet/http/HttpServletRequest;Lio/sentry/event/helper/RemoteAddressResolver;Ljava/lang/String;)V

    .line 54
    return-void
.end method

.method public constructor <init>(Ljavax/servlet/http/HttpServletRequest;Lio/sentry/event/helper/RemoteAddressResolver;Ljava/lang/String;)V
    .locals 9
    .param p1, "request"    # Ljavax/servlet/http/HttpServletRequest;
    .param p2, "remoteAddressResolver"    # Lio/sentry/event/helper/RemoteAddressResolver;
    .param p3, "body"    # Ljava/lang/String;

    .prologue
    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 64
    invoke-interface {p1}, Ljavax/servlet/http/HttpServletRequest;->getRequestURL()Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lio/sentry/event/interfaces/HttpInterface;->requestUrl:Ljava/lang/String;

    .line 65
    invoke-interface {p1}, Ljavax/servlet/http/HttpServletRequest;->getMethod()Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lio/sentry/event/interfaces/HttpInterface;->method:Ljava/lang/String;

    .line 66
    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    iput-object v6, p0, Lio/sentry/event/interfaces/HttpInterface;->parameters:Ljava/util/Map;

    .line 67
    invoke-interface {p1}, Ljavax/servlet/http/HttpServletRequest;->getParameterMap()Ljava/util/Map;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Map$Entry;

    .line 68
    .local v5, "parameterMapEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;[Ljava/lang/String;>;"
    iget-object v7, p0, Lio/sentry/event/interfaces/HttpInterface;->parameters:Ljava/util/Map;

    invoke-interface {v5}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v8

    invoke-interface {v5}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, [Ljava/lang/Object;

    invoke-static {v6}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v6

    invoke-interface {v7, v8, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 70
    .end local v5    # "parameterMapEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;[Ljava/lang/String;>;"
    :cond_0
    invoke-interface {p1}, Ljavax/servlet/http/HttpServletRequest;->getQueryString()Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lio/sentry/event/interfaces/HttpInterface;->queryString:Ljava/lang/String;

    .line 71
    invoke-interface {p1}, Ljavax/servlet/http/HttpServletRequest;->getCookies()[Ljavax/servlet/http/Cookie;

    move-result-object v6

    if-eqz v6, :cond_1

    .line 72
    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    iput-object v6, p0, Lio/sentry/event/interfaces/HttpInterface;->cookies:Ljava/util/Map;

    .line 73
    invoke-interface {p1}, Ljavax/servlet/http/HttpServletRequest;->getCookies()[Ljavax/servlet/http/Cookie;

    move-result-object v0

    .local v0, "arr$":[Ljavax/servlet/http/Cookie;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_1
    if-ge v3, v4, :cond_2

    aget-object v1, v0, v3

    .line 74
    .local v1, "cookie":Ljavax/servlet/http/Cookie;
    iget-object v6, p0, Lio/sentry/event/interfaces/HttpInterface;->cookies:Ljava/util/Map;

    invoke-virtual {v1}, Ljavax/servlet/http/Cookie;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v1}, Ljavax/servlet/http/Cookie;->getValue()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v6, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 73
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 77
    .end local v0    # "arr$":[Ljavax/servlet/http/Cookie;
    .end local v1    # "cookie":Ljavax/servlet/http/Cookie;
    .end local v4    # "len$":I
    .local v3, "i$":Ljava/util/Iterator;
    :cond_1
    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v6

    iput-object v6, p0, Lio/sentry/event/interfaces/HttpInterface;->cookies:Ljava/util/Map;

    .line 79
    .end local v3    # "i$":Ljava/util/Iterator;
    :cond_2
    invoke-interface {p2, p1}, Lio/sentry/event/helper/RemoteAddressResolver;->getRemoteAddress(Ljavax/servlet/http/HttpServletRequest;)Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lio/sentry/event/interfaces/HttpInterface;->remoteAddr:Ljava/lang/String;

    .line 80
    invoke-interface {p1}, Ljavax/servlet/http/HttpServletRequest;->getServerName()Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lio/sentry/event/interfaces/HttpInterface;->serverName:Ljava/lang/String;

    .line 81
    invoke-interface {p1}, Ljavax/servlet/http/HttpServletRequest;->getServerPort()I

    move-result v6

    iput v6, p0, Lio/sentry/event/interfaces/HttpInterface;->serverPort:I

    .line 82
    invoke-interface {p1}, Ljavax/servlet/http/HttpServletRequest;->getLocalAddr()Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lio/sentry/event/interfaces/HttpInterface;->localAddr:Ljava/lang/String;

    .line 83
    invoke-interface {p1}, Ljavax/servlet/http/HttpServletRequest;->getLocalName()Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lio/sentry/event/interfaces/HttpInterface;->localName:Ljava/lang/String;

    .line 84
    invoke-interface {p1}, Ljavax/servlet/http/HttpServletRequest;->getLocalPort()I

    move-result v6

    iput v6, p0, Lio/sentry/event/interfaces/HttpInterface;->localPort:I

    .line 85
    invoke-interface {p1}, Ljavax/servlet/http/HttpServletRequest;->getProtocol()Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lio/sentry/event/interfaces/HttpInterface;->protocol:Ljava/lang/String;

    .line 86
    invoke-interface {p1}, Ljavax/servlet/http/HttpServletRequest;->isSecure()Z

    move-result v6

    iput-boolean v6, p0, Lio/sentry/event/interfaces/HttpInterface;->secure:Z

    .line 87
    invoke-interface {p1}, Ljavax/servlet/http/HttpServletRequest;->isAsyncStarted()Z

    move-result v6

    iput-boolean v6, p0, Lio/sentry/event/interfaces/HttpInterface;->asyncStarted:Z

    .line 88
    invoke-interface {p1}, Ljavax/servlet/http/HttpServletRequest;->getAuthType()Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lio/sentry/event/interfaces/HttpInterface;->authType:Ljava/lang/String;

    .line 89
    invoke-interface {p1}, Ljavax/servlet/http/HttpServletRequest;->getRemoteUser()Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lio/sentry/event/interfaces/HttpInterface;->remoteUser:Ljava/lang/String;

    .line 90
    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    iput-object v6, p0, Lio/sentry/event/interfaces/HttpInterface;->headers:Ljava/util/Map;

    .line 91
    invoke-interface {p1}, Ljavax/servlet/http/HttpServletRequest;->getHeaderNames()Ljava/util/Enumeration;

    move-result-object v6

    invoke-static {v6}, Ljava/util/Collections;->list(Ljava/util/Enumeration;)Ljava/util/ArrayList;

    move-result-object v6

    invoke-virtual {v6}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .restart local v3    # "i$":Ljava/util/Iterator;
    :goto_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_3

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 92
    .local v2, "headerName":Ljava/lang/String;
    iget-object v6, p0, Lio/sentry/event/interfaces/HttpInterface;->headers:Ljava/util/Map;

    invoke-interface {p1, v2}, Ljavax/servlet/http/HttpServletRequest;->getHeaders(Ljava/lang/String;)Ljava/util/Enumeration;

    move-result-object v7

    invoke-static {v7}, Ljava/util/Collections;->list(Ljava/util/Enumeration;)Ljava/util/ArrayList;

    move-result-object v7

    invoke-interface {v6, v2, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2

    .line 94
    .end local v2    # "headerName":Ljava/lang/String;
    :cond_3
    iput-object p3, p0, Lio/sentry/event/interfaces/HttpInterface;->body:Ljava/lang/String;

    .line 95
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 186
    if-ne p0, p1, :cond_1

    .line 250
    :cond_0
    :goto_0
    return v1

    .line 189
    :cond_1
    if-eqz p1, :cond_2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_3

    :cond_2
    move v1, v2

    .line 190
    goto :goto_0

    :cond_3
    move-object v0, p1

    .line 193
    check-cast v0, Lio/sentry/event/interfaces/HttpInterface;

    .line 195
    .local v0, "that":Lio/sentry/event/interfaces/HttpInterface;
    iget-boolean v3, p0, Lio/sentry/event/interfaces/HttpInterface;->asyncStarted:Z

    iget-boolean v4, v0, Lio/sentry/event/interfaces/HttpInterface;->asyncStarted:Z

    if-eq v3, v4, :cond_4

    move v1, v2

    .line 196
    goto :goto_0

    .line 198
    :cond_4
    iget v3, p0, Lio/sentry/event/interfaces/HttpInterface;->localPort:I

    iget v4, v0, Lio/sentry/event/interfaces/HttpInterface;->localPort:I

    if-eq v3, v4, :cond_5

    move v1, v2

    .line 199
    goto :goto_0

    .line 201
    :cond_5
    iget-boolean v3, p0, Lio/sentry/event/interfaces/HttpInterface;->secure:Z

    iget-boolean v4, v0, Lio/sentry/event/interfaces/HttpInterface;->secure:Z

    if-eq v3, v4, :cond_6

    move v1, v2

    .line 202
    goto :goto_0

    .line 204
    :cond_6
    iget v3, p0, Lio/sentry/event/interfaces/HttpInterface;->serverPort:I

    iget v4, v0, Lio/sentry/event/interfaces/HttpInterface;->serverPort:I

    if-eq v3, v4, :cond_7

    move v1, v2

    .line 205
    goto :goto_0

    .line 207
    :cond_7
    iget-object v3, p0, Lio/sentry/event/interfaces/HttpInterface;->authType:Ljava/lang/String;

    if-eqz v3, :cond_9

    iget-object v3, p0, Lio/sentry/event/interfaces/HttpInterface;->authType:Ljava/lang/String;

    iget-object v4, v0, Lio/sentry/event/interfaces/HttpInterface;->authType:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_a

    :cond_8
    move v1, v2

    .line 208
    goto :goto_0

    .line 207
    :cond_9
    iget-object v3, v0, Lio/sentry/event/interfaces/HttpInterface;->authType:Ljava/lang/String;

    if-nez v3, :cond_8

    .line 210
    :cond_a
    iget-object v3, p0, Lio/sentry/event/interfaces/HttpInterface;->cookies:Ljava/util/Map;

    iget-object v4, v0, Lio/sentry/event/interfaces/HttpInterface;->cookies:Ljava/util/Map;

    invoke-interface {v3, v4}, Ljava/util/Map;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_b

    move v1, v2

    .line 211
    goto :goto_0

    .line 213
    :cond_b
    iget-object v3, p0, Lio/sentry/event/interfaces/HttpInterface;->headers:Ljava/util/Map;

    iget-object v4, v0, Lio/sentry/event/interfaces/HttpInterface;->headers:Ljava/util/Map;

    invoke-interface {v3, v4}, Ljava/util/Map;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_c

    move v1, v2

    .line 214
    goto :goto_0

    .line 216
    :cond_c
    iget-object v3, p0, Lio/sentry/event/interfaces/HttpInterface;->localAddr:Ljava/lang/String;

    if-eqz v3, :cond_e

    iget-object v3, p0, Lio/sentry/event/interfaces/HttpInterface;->localAddr:Ljava/lang/String;

    iget-object v4, v0, Lio/sentry/event/interfaces/HttpInterface;->localAddr:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_f

    :cond_d
    move v1, v2

    .line 217
    goto :goto_0

    .line 216
    :cond_e
    iget-object v3, v0, Lio/sentry/event/interfaces/HttpInterface;->localAddr:Ljava/lang/String;

    if-nez v3, :cond_d

    .line 219
    :cond_f
    iget-object v3, p0, Lio/sentry/event/interfaces/HttpInterface;->localName:Ljava/lang/String;

    if-eqz v3, :cond_11

    iget-object v3, p0, Lio/sentry/event/interfaces/HttpInterface;->localName:Ljava/lang/String;

    iget-object v4, v0, Lio/sentry/event/interfaces/HttpInterface;->localName:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_12

    :cond_10
    move v1, v2

    .line 220
    goto/16 :goto_0

    .line 219
    :cond_11
    iget-object v3, v0, Lio/sentry/event/interfaces/HttpInterface;->localName:Ljava/lang/String;

    if-nez v3, :cond_10

    .line 222
    :cond_12
    iget-object v3, p0, Lio/sentry/event/interfaces/HttpInterface;->method:Ljava/lang/String;

    if-eqz v3, :cond_14

    iget-object v3, p0, Lio/sentry/event/interfaces/HttpInterface;->method:Ljava/lang/String;

    iget-object v4, v0, Lio/sentry/event/interfaces/HttpInterface;->method:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_15

    :cond_13
    move v1, v2

    .line 223
    goto/16 :goto_0

    .line 222
    :cond_14
    iget-object v3, v0, Lio/sentry/event/interfaces/HttpInterface;->method:Ljava/lang/String;

    if-nez v3, :cond_13

    .line 225
    :cond_15
    iget-object v3, p0, Lio/sentry/event/interfaces/HttpInterface;->parameters:Ljava/util/Map;

    iget-object v4, v0, Lio/sentry/event/interfaces/HttpInterface;->parameters:Ljava/util/Map;

    invoke-interface {v3, v4}, Ljava/util/Map;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_16

    move v1, v2

    .line 226
    goto/16 :goto_0

    .line 228
    :cond_16
    iget-object v3, p0, Lio/sentry/event/interfaces/HttpInterface;->protocol:Ljava/lang/String;

    if-eqz v3, :cond_18

    iget-object v3, p0, Lio/sentry/event/interfaces/HttpInterface;->protocol:Ljava/lang/String;

    iget-object v4, v0, Lio/sentry/event/interfaces/HttpInterface;->protocol:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_19

    :cond_17
    move v1, v2

    .line 229
    goto/16 :goto_0

    .line 228
    :cond_18
    iget-object v3, v0, Lio/sentry/event/interfaces/HttpInterface;->protocol:Ljava/lang/String;

    if-nez v3, :cond_17

    .line 231
    :cond_19
    iget-object v3, p0, Lio/sentry/event/interfaces/HttpInterface;->queryString:Ljava/lang/String;

    if-eqz v3, :cond_1b

    iget-object v3, p0, Lio/sentry/event/interfaces/HttpInterface;->queryString:Ljava/lang/String;

    iget-object v4, v0, Lio/sentry/event/interfaces/HttpInterface;->queryString:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1c

    :cond_1a
    move v1, v2

    .line 232
    goto/16 :goto_0

    .line 231
    :cond_1b
    iget-object v3, v0, Lio/sentry/event/interfaces/HttpInterface;->queryString:Ljava/lang/String;

    if-nez v3, :cond_1a

    .line 234
    :cond_1c
    iget-object v3, p0, Lio/sentry/event/interfaces/HttpInterface;->remoteAddr:Ljava/lang/String;

    if-eqz v3, :cond_1e

    iget-object v3, p0, Lio/sentry/event/interfaces/HttpInterface;->remoteAddr:Ljava/lang/String;

    iget-object v4, v0, Lio/sentry/event/interfaces/HttpInterface;->remoteAddr:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1f

    :cond_1d
    move v1, v2

    .line 235
    goto/16 :goto_0

    .line 234
    :cond_1e
    iget-object v3, v0, Lio/sentry/event/interfaces/HttpInterface;->remoteAddr:Ljava/lang/String;

    if-nez v3, :cond_1d

    .line 237
    :cond_1f
    iget-object v3, p0, Lio/sentry/event/interfaces/HttpInterface;->remoteUser:Ljava/lang/String;

    if-eqz v3, :cond_21

    iget-object v3, p0, Lio/sentry/event/interfaces/HttpInterface;->remoteUser:Ljava/lang/String;

    iget-object v4, v0, Lio/sentry/event/interfaces/HttpInterface;->remoteUser:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_22

    :cond_20
    move v1, v2

    .line 238
    goto/16 :goto_0

    .line 237
    :cond_21
    iget-object v3, v0, Lio/sentry/event/interfaces/HttpInterface;->remoteUser:Ljava/lang/String;

    if-nez v3, :cond_20

    .line 240
    :cond_22
    iget-object v3, p0, Lio/sentry/event/interfaces/HttpInterface;->requestUrl:Ljava/lang/String;

    iget-object v4, v0, Lio/sentry/event/interfaces/HttpInterface;->requestUrl:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_23

    move v1, v2

    .line 241
    goto/16 :goto_0

    .line 243
    :cond_23
    iget-object v3, p0, Lio/sentry/event/interfaces/HttpInterface;->serverName:Ljava/lang/String;

    if-eqz v3, :cond_25

    iget-object v3, p0, Lio/sentry/event/interfaces/HttpInterface;->serverName:Ljava/lang/String;

    iget-object v4, v0, Lio/sentry/event/interfaces/HttpInterface;->serverName:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_26

    :cond_24
    move v1, v2

    .line 244
    goto/16 :goto_0

    .line 243
    :cond_25
    iget-object v3, v0, Lio/sentry/event/interfaces/HttpInterface;->serverName:Ljava/lang/String;

    if-nez v3, :cond_24

    .line 246
    :cond_26
    iget-object v3, p0, Lio/sentry/event/interfaces/HttpInterface;->body:Ljava/lang/String;

    if-eqz v3, :cond_27

    iget-object v3, p0, Lio/sentry/event/interfaces/HttpInterface;->body:Ljava/lang/String;

    iget-object v4, v0, Lio/sentry/event/interfaces/HttpInterface;->body:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    :goto_1
    move v1, v2

    .line 247
    goto/16 :goto_0

    .line 246
    :cond_27
    iget-object v3, v0, Lio/sentry/event/interfaces/HttpInterface;->body:Ljava/lang/String;

    if-eqz v3, :cond_0

    goto :goto_1
.end method

.method public getAuthType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 159
    iget-object v0, p0, Lio/sentry/event/interfaces/HttpInterface;->authType:Ljava/lang/String;

    return-object v0
.end method

.method public getBody()Ljava/lang/String;
    .locals 1

    .prologue
    .line 167
    iget-object v0, p0, Lio/sentry/event/interfaces/HttpInterface;->body:Ljava/lang/String;

    return-object v0
.end method

.method public getCookies()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 119
    iget-object v0, p0, Lio/sentry/event/interfaces/HttpInterface;->cookies:Ljava/util/Map;

    return-object v0
.end method

.method public getHeaders()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 171
    iget-object v0, p0, Lio/sentry/event/interfaces/HttpInterface;->headers:Ljava/util/Map;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public getInterfaceName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 99
    const-string/jumbo v0, "sentry.interfaces.Http"

    return-object v0
.end method

.method public getLocalAddr()Ljava/lang/String;
    .locals 1

    .prologue
    .line 135
    iget-object v0, p0, Lio/sentry/event/interfaces/HttpInterface;->localAddr:Ljava/lang/String;

    return-object v0
.end method

.method public getLocalName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 139
    iget-object v0, p0, Lio/sentry/event/interfaces/HttpInterface;->localName:Ljava/lang/String;

    return-object v0
.end method

.method public getLocalPort()I
    .locals 1

    .prologue
    .line 143
    iget v0, p0, Lio/sentry/event/interfaces/HttpInterface;->localPort:I

    return v0
.end method

.method public getMethod()Ljava/lang/String;
    .locals 1

    .prologue
    .line 107
    iget-object v0, p0, Lio/sentry/event/interfaces/HttpInterface;->method:Ljava/lang/String;

    return-object v0
.end method

.method public getParameters()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 111
    iget-object v0, p0, Lio/sentry/event/interfaces/HttpInterface;->parameters:Ljava/util/Map;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public getProtocol()Ljava/lang/String;
    .locals 1

    .prologue
    .line 147
    iget-object v0, p0, Lio/sentry/event/interfaces/HttpInterface;->protocol:Ljava/lang/String;

    return-object v0
.end method

.method public getQueryString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 115
    iget-object v0, p0, Lio/sentry/event/interfaces/HttpInterface;->queryString:Ljava/lang/String;

    return-object v0
.end method

.method public getRemoteAddr()Ljava/lang/String;
    .locals 1

    .prologue
    .line 123
    iget-object v0, p0, Lio/sentry/event/interfaces/HttpInterface;->remoteAddr:Ljava/lang/String;

    return-object v0
.end method

.method public getRemoteUser()Ljava/lang/String;
    .locals 1

    .prologue
    .line 163
    iget-object v0, p0, Lio/sentry/event/interfaces/HttpInterface;->remoteUser:Ljava/lang/String;

    return-object v0
.end method

.method public getRequestUrl()Ljava/lang/String;
    .locals 1

    .prologue
    .line 103
    iget-object v0, p0, Lio/sentry/event/interfaces/HttpInterface;->requestUrl:Ljava/lang/String;

    return-object v0
.end method

.method public getServerName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 127
    iget-object v0, p0, Lio/sentry/event/interfaces/HttpInterface;->serverName:Ljava/lang/String;

    return-object v0
.end method

.method public getServerPort()I
    .locals 1

    .prologue
    .line 131
    iget v0, p0, Lio/sentry/event/interfaces/HttpInterface;->serverPort:I

    return v0
.end method

.method public hashCode()I
    .locals 3

    .prologue
    .line 255
    iget-object v1, p0, Lio/sentry/event/interfaces/HttpInterface;->requestUrl:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v0

    .line 256
    .local v0, "result":I
    mul-int/lit8 v2, v0, 0x1f

    iget-object v1, p0, Lio/sentry/event/interfaces/HttpInterface;->method:Ljava/lang/String;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lio/sentry/event/interfaces/HttpInterface;->method:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    :goto_0
    add-int v0, v2, v1

    .line 257
    mul-int/lit8 v1, v0, 0x1f

    iget-object v2, p0, Lio/sentry/event/interfaces/HttpInterface;->parameters:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->hashCode()I

    move-result v2

    add-int v0, v1, v2

    .line 258
    return v0

    .line 256
    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public isAsyncStarted()Z
    .locals 1

    .prologue
    .line 155
    iget-boolean v0, p0, Lio/sentry/event/interfaces/HttpInterface;->asyncStarted:Z

    return v0
.end method

.method public isSecure()Z
    .locals 1

    .prologue
    .line 151
    iget-boolean v0, p0, Lio/sentry/event/interfaces/HttpInterface;->secure:Z

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    const/16 v2, 0x27

    .line 176
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "HttpInterface{requestUrl=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lio/sentry/event/interfaces/HttpInterface;->requestUrl:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", method=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lio/sentry/event/interfaces/HttpInterface;->method:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", queryString=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lio/sentry/event/interfaces/HttpInterface;->queryString:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", parameters="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lio/sentry/event/interfaces/HttpInterface;->parameters:Ljava/util/Map;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
