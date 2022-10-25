.class public Lio/sentry/marshaller/json/MessageInterfaceBinding;
.super Ljava/lang/Object;
.source "MessageInterfaceBinding.java"

# interfaces
.implements Lio/sentry/marshaller/json/InterfaceBinding;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lio/sentry/marshaller/json/InterfaceBinding",
        "<",
        "Lio/sentry/event/interfaces/MessageInterface;",
        ">;"
    }
.end annotation


# static fields
.field public static final DEFAULT_MAX_MESSAGE_LENGTH:I = 0x3e8

.field private static final FORMATTED_PARAMETER:Ljava/lang/String; = "formatted"

.field private static final MESSAGE_PARAMETER:Ljava/lang/String; = "message"

.field private static final PARAMS_PARAMETER:Ljava/lang/String; = "params"


# instance fields
.field private final maxMessageLength:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    const/16 v0, 0x3e8

    iput v0, p0, Lio/sentry/marshaller/json/MessageInterfaceBinding;->maxMessageLength:I

    .line 31
    return-void
.end method

.method public constructor <init>(I)V
    .locals 0
    .param p1, "maxMessageLength"    # I

    .prologue
    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    iput p1, p0, Lio/sentry/marshaller/json/MessageInterfaceBinding;->maxMessageLength:I

    .line 40
    return-void
.end method


# virtual methods
.method public writeInterface(Lcom/fasterxml/jackson/core/JsonGenerator;Lio/sentry/event/interfaces/MessageInterface;)V
    .locals 5
    .param p1, "generator"    # Lcom/fasterxml/jackson/core/JsonGenerator;
    .param p2, "messageInterface"    # Lio/sentry/event/interfaces/MessageInterface;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 44
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    .line 45
    const-string/jumbo v2, "message"

    invoke-virtual {p2}, Lio/sentry/event/interfaces/MessageInterface;->getMessage()Ljava/lang/String;

    move-result-object v3

    iget v4, p0, Lio/sentry/marshaller/json/MessageInterfaceBinding;->maxMessageLength:I

    invoke-static {v3, v4}, Lio/sentry/util/Util;->trimString(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v2, v3}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 46
    const-string/jumbo v2, "params"

    invoke-virtual {p1, v2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeArrayFieldStart(Ljava/lang/String;)V

    .line 47
    invoke-virtual {p2}, Lio/sentry/event/interfaces/MessageInterface;->getParameters()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 48
    .local v1, "parameter":Ljava/lang/String;
    invoke-virtual {p1, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    goto :goto_0

    .line 50
    .end local v1    # "parameter":Ljava/lang/String;
    :cond_0
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeEndArray()V

    .line 51
    invoke-virtual {p2}, Lio/sentry/event/interfaces/MessageInterface;->getFormatted()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 52
    const-string/jumbo v2, "formatted"

    invoke-virtual {p2}, Lio/sentry/event/interfaces/MessageInterface;->getFormatted()Ljava/lang/String;

    move-result-object v3

    iget v4, p0, Lio/sentry/marshaller/json/MessageInterfaceBinding;->maxMessageLength:I

    invoke-static {v3, v4}, Lio/sentry/util/Util;->trimString(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v2, v3}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 55
    :cond_1
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeEndObject()V

    .line 56
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
    .line 12
    check-cast p2, Lio/sentry/event/interfaces/MessageInterface;

    invoke-virtual {p0, p1, p2}, Lio/sentry/marshaller/json/MessageInterfaceBinding;->writeInterface(Lcom/fasterxml/jackson/core/JsonGenerator;Lio/sentry/event/interfaces/MessageInterface;)V

    return-void
.end method
