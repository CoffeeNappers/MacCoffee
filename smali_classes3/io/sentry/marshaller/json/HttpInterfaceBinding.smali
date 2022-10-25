.class public Lio/sentry/marshaller/json/HttpInterfaceBinding;
.super Ljava/lang/Object;
.source "HttpInterfaceBinding.java"

# interfaces
.implements Lio/sentry/marshaller/json/InterfaceBinding;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lio/sentry/marshaller/json/InterfaceBinding",
        "<",
        "Lio/sentry/event/interfaces/HttpInterface;",
        ">;"
    }
.end annotation


# static fields
.field private static final BODY:Ljava/lang/String; = "body"

.field private static final COOKIES:Ljava/lang/String; = "cookies"

.field private static final DATA:Ljava/lang/String; = "data"

.field private static final ENVIRONMENT:Ljava/lang/String; = "env"

.field private static final ENV_AUTH_TYPE:Ljava/lang/String; = "AUTH_TYPE"

.field private static final ENV_LOCAL_ADDR:Ljava/lang/String; = "LOCAL_ADDR"

.field private static final ENV_LOCAL_NAME:Ljava/lang/String; = "LOCAL_NAME"

.field private static final ENV_LOCAL_PORT:Ljava/lang/String; = "LOCAL_PORT"

.field private static final ENV_REMOTE_ADDR:Ljava/lang/String; = "REMOTE_ADDR"

.field private static final ENV_REMOTE_USER:Ljava/lang/String; = "REMOTE_USER"

.field private static final ENV_REQUEST_ASYNC:Ljava/lang/String; = "REQUEST_ASYNC"

.field private static final ENV_REQUEST_SECURE:Ljava/lang/String; = "REQUEST_SECURE"

.field private static final ENV_SERVER_NAME:Ljava/lang/String; = "SERVER_NAME"

.field private static final ENV_SERVER_PORT:Ljava/lang/String; = "SERVER_PORT"

.field private static final ENV_SERVER_PROTOCOL:Ljava/lang/String; = "SERVER_PROTOCOL"

.field private static final HEADERS:Ljava/lang/String; = "headers"

.field public static final MAX_BODY_LENGTH:I = 0x800

.field private static final METHOD:Ljava/lang/String; = "method"

.field private static final QUERY_STRING:Ljava/lang/String; = "query_string"

.field private static final URL:Ljava/lang/String; = "url"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private writeCookies(Lcom/fasterxml/jackson/core/JsonGenerator;Ljava/util/Map;)V
    .locals 4
    .param p1, "generator"    # Lcom/fasterxml/jackson/core/JsonGenerator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/core/JsonGenerator;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 92
    .local p2, "cookies":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {p2}, Ljava/util/Map;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 93
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNull()V

    .line 102
    :goto_0
    return-void

    .line 97
    :cond_0
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    .line 98
    invoke-interface {p2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 99
    .local v0, "cookie":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {p1, v2, v3}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 101
    .end local v0    # "cookie":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_1
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeEndObject()V

    goto :goto_0
.end method

.method private writeData(Lcom/fasterxml/jackson/core/JsonGenerator;Ljava/util/Map;Ljava/lang/String;)V
    .locals 6
    .param p1, "generator"    # Lcom/fasterxml/jackson/core/JsonGenerator;
    .param p3, "body"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/core/JsonGenerator;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;>;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 107
    .local p2, "parameterMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/Collection<Ljava/lang/String;>;>;"
    if-nez p2, :cond_0

    if-nez p3, :cond_0

    .line 108
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNull()V

    .line 126
    :goto_0
    return-void

    .line 112
    :cond_0
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    .line 113
    if-eqz p3, :cond_1

    .line 114
    const-string/jumbo v4, "body"

    const/16 v5, 0x800

    invoke-static {p3, v5}, Lio/sentry/util/Util;->trimString(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1, v4, v5}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 116
    :cond_1
    if-eqz p2, :cond_3

    .line 117
    invoke-interface {p2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 118
    .local v2, "parameter":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/Collection<Ljava/lang/String;>;>;"
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {p1, v4}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeArrayFieldStart(Ljava/lang/String;)V

    .line 119
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Collection;

    invoke-interface {v4}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 120
    .local v3, "parameterValue":Ljava/lang/String;
    invoke-virtual {p1, v3}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    goto :goto_2

    .line 122
    .end local v3    # "parameterValue":Ljava/lang/String;
    :cond_2
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeEndArray()V

    goto :goto_1

    .line 125
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v2    # "parameter":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/Collection<Ljava/lang/String;>;>;"
    :cond_3
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeEndObject()V

    goto :goto_0
.end method

.method private writeEnvironment(Lcom/fasterxml/jackson/core/JsonGenerator;Lio/sentry/event/interfaces/HttpInterface;)V
    .locals 2
    .param p1, "generator"    # Lcom/fasterxml/jackson/core/JsonGenerator;
    .param p2, "httpInterface"    # Lio/sentry/event/interfaces/HttpInterface;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 61
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    .line 62
    const-string/jumbo v0, "REMOTE_ADDR"

    invoke-virtual {p2}, Lio/sentry/event/interfaces/HttpInterface;->getRemoteAddr()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 63
    const-string/jumbo v0, "SERVER_NAME"

    invoke-virtual {p2}, Lio/sentry/event/interfaces/HttpInterface;->getServerName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 64
    const-string/jumbo v0, "SERVER_PORT"

    invoke-virtual {p2}, Lio/sentry/event/interfaces/HttpInterface;->getServerPort()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 65
    const-string/jumbo v0, "LOCAL_ADDR"

    invoke-virtual {p2}, Lio/sentry/event/interfaces/HttpInterface;->getLocalAddr()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 66
    const-string/jumbo v0, "LOCAL_NAME"

    invoke-virtual {p2}, Lio/sentry/event/interfaces/HttpInterface;->getLocalName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 67
    const-string/jumbo v0, "LOCAL_PORT"

    invoke-virtual {p2}, Lio/sentry/event/interfaces/HttpInterface;->getLocalPort()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 68
    const-string/jumbo v0, "SERVER_PROTOCOL"

    invoke-virtual {p2}, Lio/sentry/event/interfaces/HttpInterface;->getProtocol()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 69
    const-string/jumbo v0, "REQUEST_SECURE"

    invoke-virtual {p2}, Lio/sentry/event/interfaces/HttpInterface;->isSecure()Z

    move-result v1

    invoke-virtual {p1, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 70
    const-string/jumbo v0, "REQUEST_ASYNC"

    invoke-virtual {p2}, Lio/sentry/event/interfaces/HttpInterface;->isAsyncStarted()Z

    move-result v1

    invoke-virtual {p1, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 71
    const-string/jumbo v0, "AUTH_TYPE"

    invoke-virtual {p2}, Lio/sentry/event/interfaces/HttpInterface;->getAuthType()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 73
    const-string/jumbo v0, "REMOTE_USER"

    invoke-virtual {p2}, Lio/sentry/event/interfaces/HttpInterface;->getRemoteUser()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 74
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeEndObject()V

    .line 75
    return-void
.end method

.method private writeHeaders(Lcom/fasterxml/jackson/core/JsonGenerator;Ljava/util/Map;)V
    .locals 5
    .param p1, "generator"    # Lcom/fasterxml/jackson/core/JsonGenerator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/core/JsonGenerator;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;>;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 78
    .local p2, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/Collection<Ljava/lang/String;>;>;"
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartArray()V

    .line 79
    invoke-interface {p2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 80
    .local v0, "headerEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/Collection<Ljava/lang/String;>;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Collection;

    invoke-interface {v4}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 81
    .local v3, "value":Ljava/lang/String;
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartArray()V

    .line 82
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {p1, v4}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    .line 83
    invoke-virtual {p1, v3}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    .line 84
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeEndArray()V

    goto :goto_0

    .line 87
    .end local v0    # "headerEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/Collection<Ljava/lang/String;>;>;"
    .end local v2    # "i$":Ljava/util/Iterator;
    .end local v3    # "value":Ljava/lang/String;
    :cond_1
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeEndArray()V

    .line 88
    return-void
.end method


# virtual methods
.method public writeInterface(Lcom/fasterxml/jackson/core/JsonGenerator;Lio/sentry/event/interfaces/HttpInterface;)V
    .locals 2
    .param p1, "generator"    # Lcom/fasterxml/jackson/core/JsonGenerator;
    .param p2, "httpInterface"    # Lio/sentry/event/interfaces/HttpInterface;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 45
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    .line 46
    const-string/jumbo v0, "url"

    invoke-virtual {p2}, Lio/sentry/event/interfaces/HttpInterface;->getRequestUrl()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 47
    const-string/jumbo v0, "method"

    invoke-virtual {p2}, Lio/sentry/event/interfaces/HttpInterface;->getMethod()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 48
    const-string/jumbo v0, "data"

    invoke-virtual {p1, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 49
    invoke-virtual {p2}, Lio/sentry/event/interfaces/HttpInterface;->getParameters()Ljava/util/Map;

    move-result-object v0

    invoke-virtual {p2}, Lio/sentry/event/interfaces/HttpInterface;->getBody()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, p1, v0, v1}, Lio/sentry/marshaller/json/HttpInterfaceBinding;->writeData(Lcom/fasterxml/jackson/core/JsonGenerator;Ljava/util/Map;Ljava/lang/String;)V

    .line 50
    const-string/jumbo v0, "query_string"

    invoke-virtual {p2}, Lio/sentry/event/interfaces/HttpInterface;->getQueryString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 51
    const-string/jumbo v0, "cookies"

    invoke-virtual {p1, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 52
    invoke-virtual {p2}, Lio/sentry/event/interfaces/HttpInterface;->getCookies()Ljava/util/Map;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lio/sentry/marshaller/json/HttpInterfaceBinding;->writeCookies(Lcom/fasterxml/jackson/core/JsonGenerator;Ljava/util/Map;)V

    .line 53
    const-string/jumbo v0, "headers"

    invoke-virtual {p1, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 54
    invoke-virtual {p2}, Lio/sentry/event/interfaces/HttpInterface;->getHeaders()Ljava/util/Map;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lio/sentry/marshaller/json/HttpInterfaceBinding;->writeHeaders(Lcom/fasterxml/jackson/core/JsonGenerator;Ljava/util/Map;)V

    .line 55
    const-string/jumbo v0, "env"

    invoke-virtual {p1, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 56
    invoke-direct {p0, p1, p2}, Lio/sentry/marshaller/json/HttpInterfaceBinding;->writeEnvironment(Lcom/fasterxml/jackson/core/JsonGenerator;Lio/sentry/event/interfaces/HttpInterface;)V

    .line 57
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeEndObject()V

    .line 58
    return-void
.end method

.method public bridge synthetic writeInterface(Lcom/fasterxml/jackson/core/JsonGenerator;Lio/sentry/event/interfaces/SentryInterface;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 14
    check-cast p2, Lio/sentry/event/interfaces/HttpInterface;

    invoke-virtual {p0, p1, p2}, Lio/sentry/marshaller/json/HttpInterfaceBinding;->writeInterface(Lcom/fasterxml/jackson/core/JsonGenerator;Lio/sentry/event/interfaces/HttpInterface;)V

    return-void
.end method
