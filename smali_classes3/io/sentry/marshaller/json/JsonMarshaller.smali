.class public Lio/sentry/marshaller/json/JsonMarshaller;
.super Ljava/lang/Object;
.source "JsonMarshaller.java"

# interfaces
.implements Lio/sentry/marshaller/Marshaller;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/sentry/marshaller/json/JsonMarshaller$2;
    }
.end annotation


# static fields
.field public static final BREADCRUMBS:Ljava/lang/String; = "breadcrumbs"

.field public static final CHECKSUM:Ljava/lang/String; = "checksum"

.field public static final CONTEXTS:Ljava/lang/String; = "contexts"

.field public static final CULPRIT:Ljava/lang/String; = "culprit"

.field public static final DEFAULT_MAX_MESSAGE_LENGTH:I = 0x3e8

.field public static final DIST:Ljava/lang/String; = "dist"

.field public static final ENVIRONMENT:Ljava/lang/String; = "environment"

.field public static final EVENT_ID:Ljava/lang/String; = "event_id"

.field public static final EXTRA:Ljava/lang/String; = "extra"

.field public static final FINGERPRINT:Ljava/lang/String; = "fingerprint"

.field private static final ISO_FORMAT:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal",
            "<",
            "Ljava/text/DateFormat;",
            ">;"
        }
    .end annotation
.end field

.field public static final LEVEL:Ljava/lang/String; = "level"

.field public static final LOGGER:Ljava/lang/String; = "logger"

.field public static final MESSAGE:Ljava/lang/String; = "message"

.field public static final MODULES:Ljava/lang/String; = "modules"

.field public static final PLATFORM:Ljava/lang/String; = "platform"

.field public static final RELEASE:Ljava/lang/String; = "release"

.field public static final SDK:Ljava/lang/String; = "sdk"

.field public static final SERVER_NAME:Ljava/lang/String; = "server_name"

.field public static final TAGS:Ljava/lang/String; = "tags"

.field public static final TIMESTAMP:Ljava/lang/String; = "timestamp"

.field private static final logger:Lorg/slf4j/Logger;


# instance fields
.field private compression:Z

.field private final interfaceBindings:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Class",
            "<+",
            "Lio/sentry/event/interfaces/SentryInterface;",
            ">;",
            "Lio/sentry/marshaller/json/InterfaceBinding",
            "<*>;>;"
        }
    .end annotation
.end field

.field private final jsonFactory:Lcom/fasterxml/jackson/core/JsonFactory;

.field private final maxMessageLength:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 110
    new-instance v0, Lio/sentry/marshaller/json/JsonMarshaller$1;

    invoke-direct {v0}, Lio/sentry/marshaller/json/JsonMarshaller$1;-><init>()V

    sput-object v0, Lio/sentry/marshaller/json/JsonMarshaller;->ISO_FORMAT:Ljava/lang/ThreadLocal;

    .line 119
    const-class v0, Lio/sentry/marshaller/json/JsonMarshaller;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    sput-object v0, Lio/sentry/marshaller/json/JsonMarshaller;->logger:Lorg/slf4j/Logger;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 134
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 120
    new-instance v0, Lcom/fasterxml/jackson/core/JsonFactory;

    invoke-direct {v0}, Lcom/fasterxml/jackson/core/JsonFactory;-><init>()V

    iput-object v0, p0, Lio/sentry/marshaller/json/JsonMarshaller;->jsonFactory:Lcom/fasterxml/jackson/core/JsonFactory;

    .line 121
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lio/sentry/marshaller/json/JsonMarshaller;->interfaceBindings:Ljava/util/Map;

    .line 125
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/sentry/marshaller/json/JsonMarshaller;->compression:Z

    .line 135
    const/16 v0, 0x3e8

    iput v0, p0, Lio/sentry/marshaller/json/JsonMarshaller;->maxMessageLength:I

    .line 136
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .param p1, "maxMessageLength"    # I

    .prologue
    .line 143
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 120
    new-instance v0, Lcom/fasterxml/jackson/core/JsonFactory;

    invoke-direct {v0}, Lcom/fasterxml/jackson/core/JsonFactory;-><init>()V

    iput-object v0, p0, Lio/sentry/marshaller/json/JsonMarshaller;->jsonFactory:Lcom/fasterxml/jackson/core/JsonFactory;

    .line 121
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lio/sentry/marshaller/json/JsonMarshaller;->interfaceBindings:Ljava/util/Map;

    .line 125
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/sentry/marshaller/json/JsonMarshaller;->compression:Z

    .line 144
    iput p1, p0, Lio/sentry/marshaller/json/JsonMarshaller;->maxMessageLength:I

    .line 145
    return-void
.end method

.method private formatId(Ljava/util/UUID;)Ljava/lang/String;
    .locals 3
    .param p1, "id"    # Ljava/util/UUID;

    .prologue
    .line 367
    invoke-virtual {p1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "-"

    const-string/jumbo v2, ""

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private formatLevel(Lio/sentry/event/Event$Level;)Ljava/lang/String;
    .locals 4
    .param p1, "level"    # Lio/sentry/event/Event$Level;

    .prologue
    const/4 v0, 0x0

    .line 377
    if-nez p1, :cond_0

    .line 395
    :goto_0
    return-object v0

    .line 381
    :cond_0
    sget-object v1, Lio/sentry/marshaller/json/JsonMarshaller$2;->$SwitchMap$io$sentry$event$Event$Level:[I

    invoke-virtual {p1}, Lio/sentry/event/Event$Level;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    .line 393
    sget-object v1, Lio/sentry/marshaller/json/JsonMarshaller;->logger:Lorg/slf4j/Logger;

    const-string/jumbo v2, "The level \'{}\' isn\'t supported, this should NEVER happen, contact Sentry developers"

    invoke-virtual {p1}, Lio/sentry/event/Event$Level;->name()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Lorg/slf4j/Logger;->error(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0

    .line 383
    :pswitch_0
    const-string/jumbo v0, "debug"

    goto :goto_0

    .line 385
    :pswitch_1
    const-string/jumbo v0, "fatal"

    goto :goto_0

    .line 387
    :pswitch_2
    const-string/jumbo v0, "warning"

    goto :goto_0

    .line 389
    :pswitch_3
    const-string/jumbo v0, "info"

    goto :goto_0

    .line 391
    :pswitch_4
    const-string/jumbo v0, "error"

    goto :goto_0

    .line 381
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method

.method private getInterfaceBinding(Lio/sentry/event/interfaces/SentryInterface;)Lio/sentry/marshaller/json/InterfaceBinding;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lio/sentry/event/interfaces/SentryInterface;",
            ">(TT;)",
            "Lio/sentry/marshaller/json/InterfaceBinding",
            "<-TT;>;"
        }
    .end annotation

    .prologue
    .line 226
    .local p1, "sentryInterface":Lio/sentry/event/interfaces/SentryInterface;, "TT;"
    iget-object v0, p0, Lio/sentry/marshaller/json/JsonMarshaller;->interfaceBindings:Ljava/util/Map;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/sentry/marshaller/json/InterfaceBinding;

    return-object v0
.end method

.method private safelyWriteObject(Lcom/fasterxml/jackson/core/JsonGenerator;Ljava/lang/Object;)V
    .locals 7
    .param p1, "generator"    # Lcom/fasterxml/jackson/core/JsonGenerator;
    .param p2, "value"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 249
    if-eqz p2, :cond_0

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->isArray()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 250
    check-cast p2, [Ljava/lang/Object;

    .end local p2    # "value":Ljava/lang/Object;
    check-cast p2, [Ljava/lang/Object;

    invoke-static {p2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p2

    .line 253
    :cond_0
    instance-of v4, p2, Ljava/lang/Iterable;

    if-eqz v4, :cond_2

    .line 254
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartArray()V

    .line 255
    check-cast p2, Ljava/lang/Iterable;

    invoke-interface {p2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    .line 256
    .local v3, "subValue":Ljava/lang/Object;
    invoke-direct {p0, p1, v3}, Lio/sentry/marshaller/json/JsonMarshaller;->safelyWriteObject(Lcom/fasterxml/jackson/core/JsonGenerator;Ljava/lang/Object;)V

    goto :goto_0

    .line 258
    .end local v3    # "subValue":Ljava/lang/Object;
    :cond_1
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeEndArray()V

    .line 282
    .end local v2    # "i$":Ljava/util/Iterator;
    :goto_1
    return-void

    .line 259
    :cond_2
    instance-of v4, p2, Ljava/util/Map;

    if-eqz v4, :cond_5

    .line 260
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    .line 261
    check-cast p2, Ljava/util/Map;

    invoke-interface {p2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .restart local v2    # "i$":Ljava/util/Iterator;
    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_4

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 262
    .local v1, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<**>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    if-nez v4, :cond_3

    .line 263
    const-string/jumbo v4, "null"

    invoke-virtual {p1, v4}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 267
    :goto_3
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    invoke-direct {p0, p1, v4}, Lio/sentry/marshaller/json/JsonMarshaller;->safelyWriteObject(Lcom/fasterxml/jackson/core/JsonGenerator;Ljava/lang/Object;)V

    goto :goto_2

    .line 265
    :cond_3
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    goto :goto_3

    .line 269
    .end local v1    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<**>;"
    :cond_4
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeEndObject()V

    goto :goto_1

    .line 270
    .end local v2    # "i$":Ljava/util/Iterator;
    :cond_5
    if-nez p2, :cond_6

    .line 271
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNull()V

    goto :goto_1

    .line 275
    :cond_6
    :try_start_0
    invoke-virtual {p1, p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeObject(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 276
    :catch_0
    move-exception v0

    .line 277
    .local v0, "e":Ljava/lang/IllegalStateException;
    sget-object v4, Lio/sentry/marshaller/json/JsonMarshaller;->logger:Lorg/slf4j/Logger;

    const-string/jumbo v5, "Couldn\'t marshal \'{}\' of type \'{}\', had to be converted into a String"

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-interface {v4, v5, p2, v6}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 279
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    goto :goto_1
.end method

.method private writeBreadcumbs(Lcom/fasterxml/jackson/core/JsonGenerator;Ljava/util/List;)V
    .locals 10
    .param p1, "generator"    # Lcom/fasterxml/jackson/core/JsonGenerator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/core/JsonGenerator;",
            "Ljava/util/List",
            "<",
            "Lio/sentry/event/Breadcrumb;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 308
    .local p2, "breadcrumbs":Ljava/util/List;, "Ljava/util/List<Lio/sentry/event/Breadcrumb;>;"
    invoke-interface {p2}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 342
    :goto_0
    return-void

    .line 312
    :cond_0
    const-string/jumbo v4, "breadcrumbs"

    invoke-virtual {p1, v4}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeObjectFieldStart(Ljava/lang/String;)V

    .line 313
    const-string/jumbo v4, "values"

    invoke-virtual {p1, v4}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeArrayFieldStart(Ljava/lang/String;)V

    .line 314
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_7

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/sentry/event/Breadcrumb;

    .line 315
    .local v0, "breadcrumb":Lio/sentry/event/Breadcrumb;
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    .line 317
    const-string/jumbo v4, "timestamp"

    invoke-virtual {v0}, Lio/sentry/event/Breadcrumb;->getTimestamp()Ljava/util/Date;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/Date;->getTime()J

    move-result-wide v6

    const-wide/16 v8, 0x3e8

    div-long/2addr v6, v8

    invoke-virtual {p1, v4, v6, v7}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 319
    invoke-virtual {v0}, Lio/sentry/event/Breadcrumb;->getType()Lio/sentry/event/Breadcrumb$Type;

    move-result-object v4

    if-eqz v4, :cond_1

    .line 320
    const-string/jumbo v4, "type"

    invoke-virtual {v0}, Lio/sentry/event/Breadcrumb;->getType()Lio/sentry/event/Breadcrumb$Type;

    move-result-object v5

    invoke-virtual {v5}, Lio/sentry/event/Breadcrumb$Type;->getValue()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1, v4, v5}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 322
    :cond_1
    invoke-virtual {v0}, Lio/sentry/event/Breadcrumb;->getLevel()Lio/sentry/event/Breadcrumb$Level;

    move-result-object v4

    if-eqz v4, :cond_2

    .line 323
    const-string/jumbo v4, "level"

    invoke-virtual {v0}, Lio/sentry/event/Breadcrumb;->getLevel()Lio/sentry/event/Breadcrumb$Level;

    move-result-object v5

    invoke-virtual {v5}, Lio/sentry/event/Breadcrumb$Level;->getValue()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1, v4, v5}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 325
    :cond_2
    invoke-virtual {v0}, Lio/sentry/event/Breadcrumb;->getMessage()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_3

    .line 326
    const-string/jumbo v4, "message"

    invoke-virtual {v0}, Lio/sentry/event/Breadcrumb;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1, v4, v5}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 328
    :cond_3
    invoke-virtual {v0}, Lio/sentry/event/Breadcrumb;->getCategory()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_4

    .line 329
    const-string/jumbo v4, "category"

    invoke-virtual {v0}, Lio/sentry/event/Breadcrumb;->getCategory()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1, v4, v5}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 331
    :cond_4
    invoke-virtual {v0}, Lio/sentry/event/Breadcrumb;->getData()Ljava/util/Map;

    move-result-object v4

    if-eqz v4, :cond_6

    invoke-virtual {v0}, Lio/sentry/event/Breadcrumb;->getData()Ljava/util/Map;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Map;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_6

    .line 332
    const-string/jumbo v4, "data"

    invoke-virtual {p1, v4}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeObjectFieldStart(Ljava/lang/String;)V

    .line 333
    invoke-virtual {v0}, Lio/sentry/event/Breadcrumb;->getData()Ljava/util/Map;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :goto_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_5

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 334
    .local v1, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {p1, v4, v5}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    .line 336
    .end local v1    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_5
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeEndObject()V

    .line 338
    .end local v3    # "i$":Ljava/util/Iterator;
    :cond_6
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeEndObject()V

    goto/16 :goto_1

    .line 340
    .end local v0    # "breadcrumb":Lio/sentry/event/Breadcrumb;
    :cond_7
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeEndArray()V

    .line 341
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeEndObject()V

    goto/16 :goto_0
.end method

.method private writeCollection(Lcom/fasterxml/jackson/core/JsonGenerator;Ljava/lang/String;Ljava/util/Collection;)V
    .locals 3
    .param p1, "generator"    # Lcom/fasterxml/jackson/core/JsonGenerator;
    .param p2, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/core/JsonGenerator;",
            "Ljava/lang/String;",
            "Ljava/util/Collection",
            "<",
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
    .line 239
    .local p3, "value":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    if-eqz p3, :cond_1

    invoke-interface {p3}, Ljava/util/Collection;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_1

    .line 240
    invoke-virtual {p1, p2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeArrayFieldStart(Ljava/lang/String;)V

    .line 241
    invoke-interface {p3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 242
    .local v0, "element":Ljava/lang/String;
    invoke-virtual {p1, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    goto :goto_0

    .line 244
    .end local v0    # "element":Ljava/lang/String;
    :cond_0
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeEndArray()V

    .line 246
    .end local v1    # "i$":Ljava/util/Iterator;
    :cond_1
    return-void
.end method

.method private writeContent(Lcom/fasterxml/jackson/core/JsonGenerator;Lio/sentry/event/Event;)V
    .locals 3
    .param p1, "generator"    # Lcom/fasterxml/jackson/core/JsonGenerator;
    .param p2, "event"    # Lio/sentry/event/Event;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 183
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStartObject()V

    .line 185
    const-string/jumbo v0, "event_id"

    invoke-virtual {p2}, Lio/sentry/event/Event;->getId()Ljava/util/UUID;

    move-result-object v1

    invoke-direct {p0, v1}, Lio/sentry/marshaller/json/JsonMarshaller;->formatId(Ljava/util/UUID;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 186
    const-string/jumbo v0, "message"

    invoke-virtual {p2}, Lio/sentry/event/Event;->getMessage()Ljava/lang/String;

    move-result-object v1

    iget v2, p0, Lio/sentry/marshaller/json/JsonMarshaller;->maxMessageLength:I

    invoke-static {v1, v2}, Lio/sentry/util/Util;->trimString(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 187
    const-string/jumbo v1, "timestamp"

    sget-object v0, Lio/sentry/marshaller/json/JsonMarshaller;->ISO_FORMAT:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/text/DateFormat;

    invoke-virtual {p2}, Lio/sentry/event/Event;->getTimestamp()Ljava/util/Date;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v1, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 188
    const-string/jumbo v0, "level"

    invoke-virtual {p2}, Lio/sentry/event/Event;->getLevel()Lio/sentry/event/Event$Level;

    move-result-object v1

    invoke-direct {p0, v1}, Lio/sentry/marshaller/json/JsonMarshaller;->formatLevel(Lio/sentry/event/Event$Level;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 189
    const-string/jumbo v0, "logger"

    invoke-virtual {p2}, Lio/sentry/event/Event;->getLogger()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 190
    const-string/jumbo v0, "platform"

    invoke-virtual {p2}, Lio/sentry/event/Event;->getPlatform()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 191
    const-string/jumbo v0, "culprit"

    invoke-virtual {p2}, Lio/sentry/event/Event;->getCulprit()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 192
    invoke-virtual {p2}, Lio/sentry/event/Event;->getSdk()Lio/sentry/event/Sdk;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lio/sentry/marshaller/json/JsonMarshaller;->writeSdk(Lcom/fasterxml/jackson/core/JsonGenerator;Lio/sentry/event/Sdk;)V

    .line 193
    invoke-virtual {p2}, Lio/sentry/event/Event;->getTags()Ljava/util/Map;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lio/sentry/marshaller/json/JsonMarshaller;->writeTags(Lcom/fasterxml/jackson/core/JsonGenerator;Ljava/util/Map;)V

    .line 194
    invoke-virtual {p2}, Lio/sentry/event/Event;->getBreadcrumbs()Ljava/util/List;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lio/sentry/marshaller/json/JsonMarshaller;->writeBreadcumbs(Lcom/fasterxml/jackson/core/JsonGenerator;Ljava/util/List;)V

    .line 195
    invoke-virtual {p2}, Lio/sentry/event/Event;->getContexts()Ljava/util/Map;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lio/sentry/marshaller/json/JsonMarshaller;->writeContexts(Lcom/fasterxml/jackson/core/JsonGenerator;Ljava/util/Map;)V

    .line 196
    const-string/jumbo v0, "server_name"

    invoke-virtual {p2}, Lio/sentry/event/Event;->getServerName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 197
    const-string/jumbo v0, "release"

    invoke-virtual {p2}, Lio/sentry/event/Event;->getRelease()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 198
    const-string/jumbo v0, "dist"

    invoke-virtual {p2}, Lio/sentry/event/Event;->getDist()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 199
    const-string/jumbo v0, "environment"

    invoke-virtual {p2}, Lio/sentry/event/Event;->getEnvironment()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 200
    invoke-virtual {p2}, Lio/sentry/event/Event;->getExtra()Ljava/util/Map;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lio/sentry/marshaller/json/JsonMarshaller;->writeExtras(Lcom/fasterxml/jackson/core/JsonGenerator;Ljava/util/Map;)V

    .line 201
    const-string/jumbo v0, "fingerprint"

    invoke-virtual {p2}, Lio/sentry/event/Event;->getFingerprint()Ljava/util/List;

    move-result-object v1

    invoke-direct {p0, p1, v0, v1}, Lio/sentry/marshaller/json/JsonMarshaller;->writeCollection(Lcom/fasterxml/jackson/core/JsonGenerator;Ljava/lang/String;Ljava/util/Collection;)V

    .line 202
    const-string/jumbo v0, "checksum"

    invoke-virtual {p2}, Lio/sentry/event/Event;->getChecksum()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 203
    invoke-virtual {p2}, Lio/sentry/event/Event;->getSentryInterfaces()Ljava/util/Map;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lio/sentry/marshaller/json/JsonMarshaller;->writeInterfaces(Lcom/fasterxml/jackson/core/JsonGenerator;Ljava/util/Map;)V

    .line 205
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeEndObject()V

    .line 206
    return-void
.end method

.method private writeContexts(Lcom/fasterxml/jackson/core/JsonGenerator;Ljava/util/Map;)V
    .locals 6
    .param p1, "generator"    # Lcom/fasterxml/jackson/core/JsonGenerator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/core/JsonGenerator;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 345
    .local p2, "contexts":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;>;"
    invoke-interface {p2}, Ljava/util/Map;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 358
    :goto_0
    return-void

    .line 349
    :cond_0
    const-string/jumbo v4, "contexts"

    invoke-virtual {p1, v4}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeObjectFieldStart(Ljava/lang/String;)V

    .line 350
    invoke-interface {p2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 351
    .local v0, "contextEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {p1, v4}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeObjectFieldStart(Ljava/lang/String;)V

    .line 352
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map;

    invoke-interface {v4}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    .line 353
    .local v3, "innerContextEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {p1, v4, v5}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeObjectField(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_2

    .line 355
    .end local v3    # "innerContextEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_1
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeEndObject()V

    goto :goto_1

    .line 357
    .end local v0    # "contextEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;>;"
    .end local v2    # "i$":Ljava/util/Iterator;
    :cond_2
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeEndObject()V

    goto :goto_0
.end method

.method private writeExtras(Lcom/fasterxml/jackson/core/JsonGenerator;Ljava/util/Map;)V
    .locals 3
    .param p1, "generator"    # Lcom/fasterxml/jackson/core/JsonGenerator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/core/JsonGenerator;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 230
    .local p2, "extras":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string/jumbo v2, "extra"

    invoke-virtual {p1, v2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeObjectFieldStart(Ljava/lang/String;)V

    .line 231
    invoke-interface {p2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 232
    .local v0, "extra":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {p1, v2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 233
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    invoke-direct {p0, p1, v2}, Lio/sentry/marshaller/json/JsonMarshaller;->safelyWriteObject(Lcom/fasterxml/jackson/core/JsonGenerator;Ljava/lang/Object;)V

    goto :goto_0

    .line 235
    .end local v0    # "extra":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_0
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeEndObject()V

    .line 236
    return-void
.end method

.method private writeInterfaces(Lcom/fasterxml/jackson/core/JsonGenerator;Ljava/util/Map;)V
    .locals 6
    .param p1, "generator"    # Lcom/fasterxml/jackson/core/JsonGenerator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/core/JsonGenerator;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lio/sentry/event/interfaces/SentryInterface;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 210
    .local p2, "sentryInterfaces":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lio/sentry/event/interfaces/SentryInterface;>;"
    invoke-interface {p2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 211
    .local v1, "interfaceEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lio/sentry/event/interfaces/SentryInterface;>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lio/sentry/event/interfaces/SentryInterface;

    .line 213
    .local v2, "sentryInterface":Lio/sentry/event/interfaces/SentryInterface;
    iget-object v3, p0, Lio/sentry/marshaller/json/JsonMarshaller;->interfaceBindings:Ljava/util/Map;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 214
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {p1, v3}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 215
    invoke-direct {p0, v2}, Lio/sentry/marshaller/json/JsonMarshaller;->getInterfaceBinding(Lio/sentry/event/interfaces/SentryInterface;)Lio/sentry/marshaller/json/InterfaceBinding;

    move-result-object v4

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lio/sentry/event/interfaces/SentryInterface;

    invoke-interface {v4, p1, v3}, Lio/sentry/marshaller/json/InterfaceBinding;->writeInterface(Lcom/fasterxml/jackson/core/JsonGenerator;Lio/sentry/event/interfaces/SentryInterface;)V

    goto :goto_0

    .line 217
    :cond_0
    sget-object v3, Lio/sentry/marshaller/json/JsonMarshaller;->logger:Lorg/slf4j/Logger;

    const-string/jumbo v4, "Couldn\'t parse the content of \'{}\' provided in {}."

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    invoke-interface {v3, v4, v5, v2}, Lorg/slf4j/Logger;->error(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_0

    .line 221
    .end local v1    # "interfaceEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lio/sentry/event/interfaces/SentryInterface;>;"
    .end local v2    # "sentryInterface":Lio/sentry/event/interfaces/SentryInterface;
    :cond_1
    return-void
.end method

.method private writeSdk(Lcom/fasterxml/jackson/core/JsonGenerator;Lio/sentry/event/Sdk;)V
    .locals 4
    .param p1, "generator"    # Lcom/fasterxml/jackson/core/JsonGenerator;
    .param p2, "sdk"    # Lio/sentry/event/Sdk;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 285
    const-string/jumbo v2, "sdk"

    invoke-virtual {p1, v2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeObjectFieldStart(Ljava/lang/String;)V

    .line 286
    const-string/jumbo v2, "name"

    invoke-virtual {p2}, Lio/sentry/event/Sdk;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v2, v3}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 287
    const-string/jumbo v2, "version"

    invoke-virtual {p2}, Lio/sentry/event/Sdk;->getVersion()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v2, v3}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 288
    invoke-virtual {p2}, Lio/sentry/event/Sdk;->getIntegrations()Ljava/util/Set;

    move-result-object v2

    if-eqz v2, :cond_1

    invoke-virtual {p2}, Lio/sentry/event/Sdk;->getIntegrations()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_1

    .line 289
    const-string/jumbo v2, "integrations"

    invoke-virtual {p1, v2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeArrayFieldStart(Ljava/lang/String;)V

    .line 290
    invoke-virtual {p2}, Lio/sentry/event/Sdk;->getIntegrations()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 291
    .local v1, "integration":Ljava/lang/String;
    invoke-virtual {p1, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeString(Ljava/lang/String;)V

    goto :goto_0

    .line 293
    .end local v1    # "integration":Ljava/lang/String;
    :cond_0
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeEndArray()V

    .line 295
    .end local v0    # "i$":Ljava/util/Iterator;
    :cond_1
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeEndObject()V

    .line 296
    return-void
.end method

.method private writeTags(Lcom/fasterxml/jackson/core/JsonGenerator;Ljava/util/Map;)V
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
    .line 299
    .local p2, "tags":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string/jumbo v2, "tags"

    invoke-virtual {p1, v2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeObjectFieldStart(Ljava/lang/String;)V

    .line 300
    invoke-interface {p2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 301
    .local v1, "tag":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {p1, v2, v3}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 303
    .end local v1    # "tag":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_0
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeEndObject()V

    .line 304
    return-void
.end method


# virtual methods
.method public addInterfaceBinding(Ljava/lang/Class;Lio/sentry/marshaller/json/InterfaceBinding;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lio/sentry/event/interfaces/SentryInterface;",
            "F:TT;>(",
            "Ljava/lang/Class",
            "<TF;>;",
            "Lio/sentry/marshaller/json/InterfaceBinding",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 409
    .local p1, "sentryInterfaceClass":Ljava/lang/Class;, "Ljava/lang/Class<TF;>;"
    .local p2, "binding":Lio/sentry/marshaller/json/InterfaceBinding;, "Lio/sentry/marshaller/json/InterfaceBinding<TT;>;"
    iget-object v0, p0, Lio/sentry/marshaller/json/JsonMarshaller;->interfaceBindings:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 410
    return-void
.end method

.method public getContentEncoding()Ljava/lang/String;
    .locals 1

    .prologue
    .line 176
    invoke-virtual {p0}, Lio/sentry/marshaller/json/JsonMarshaller;->isCompressed()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 177
    const-string/jumbo v0, "gzip"

    .line 179
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getContentType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 171
    const-string/jumbo v0, "application/json"

    return-object v0
.end method

.method public isCompressed()Z
    .locals 1

    .prologue
    .line 422
    iget-boolean v0, p0, Lio/sentry/marshaller/json/JsonMarshaller;->compression:Z

    return v0
.end method

.method public marshall(Lio/sentry/event/Event;Ljava/io/OutputStream;)V
    .locals 7
    .param p1, "event"    # Lio/sentry/event/Event;
    .param p2, "destination"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 150
    new-instance v0, Lio/sentry/marshaller/Marshaller$UncloseableOutputStream;

    invoke-direct {v0, p2}, Lio/sentry/marshaller/Marshaller$UncloseableOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 152
    .end local p2    # "destination":Ljava/io/OutputStream;
    .local v0, "destination":Ljava/io/OutputStream;
    iget-boolean v4, p0, Lio/sentry/marshaller/json/JsonMarshaller;->compression:Z

    if-eqz v4, :cond_4

    .line 153
    new-instance p2, Ljava/util/zip/GZIPOutputStream;

    invoke-direct {p2, v0}, Ljava/util/zip/GZIPOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 156
    .end local v0    # "destination":Ljava/io/OutputStream;
    .restart local p2    # "destination":Ljava/io/OutputStream;
    :goto_0
    :try_start_0
    iget-object v4, p0, Lio/sentry/marshaller/json/JsonMarshaller;->jsonFactory:Lcom/fasterxml/jackson/core/JsonFactory;

    invoke-virtual {v4, p2}, Lcom/fasterxml/jackson/core/JsonFactory;->createGenerator(Ljava/io/OutputStream;)Lcom/fasterxml/jackson/core/JsonGenerator;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v2

    .local v2, "generator":Lcom/fasterxml/jackson/core/JsonGenerator;
    const/4 v5, 0x0

    .line 157
    :try_start_1
    invoke-direct {p0, v2, p1}, Lio/sentry/marshaller/json/JsonMarshaller;->writeContent(Lcom/fasterxml/jackson/core/JsonGenerator;Lio/sentry/event/Event;)V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_3
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 158
    if-eqz v2, :cond_0

    if-eqz v5, :cond_1

    :try_start_2
    invoke-virtual {v2}, Lcom/fasterxml/jackson/core/JsonGenerator;->close()V
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 162
    :cond_0
    :goto_1
    :try_start_3
    invoke-virtual {p2}, Ljava/io/OutputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_5

    .line 167
    .end local v2    # "generator":Lcom/fasterxml/jackson/core/JsonGenerator;
    :goto_2
    return-void

    .line 158
    .restart local v2    # "generator":Lcom/fasterxml/jackson/core/JsonGenerator;
    :catch_0
    move-exception v3

    .local v3, "x2":Ljava/lang/Throwable;
    :try_start_4
    invoke-virtual {v5, v3}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_1

    .end local v2    # "generator":Lcom/fasterxml/jackson/core/JsonGenerator;
    .end local v3    # "x2":Ljava/lang/Throwable;
    :catch_1
    move-exception v1

    .line 159
    .local v1, "e":Ljava/io/IOException;
    :try_start_5
    sget-object v4, Lio/sentry/marshaller/json/JsonMarshaller;->logger:Lorg/slf4j/Logger;

    const-string/jumbo v5, "An exception occurred while serialising the event."

    invoke-interface {v4, v5, v1}, Lorg/slf4j/Logger;->error(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 162
    :try_start_6
    invoke-virtual {p2}, Ljava/io/OutputStream;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_2

    goto :goto_2

    .line 163
    :catch_2
    move-exception v1

    .line 164
    sget-object v4, Lio/sentry/marshaller/json/JsonMarshaller;->logger:Lorg/slf4j/Logger;

    const-string/jumbo v5, "An exception occurred while serialising the event."

    invoke-interface {v4, v5, v1}, Lorg/slf4j/Logger;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_2

    .line 158
    .end local v1    # "e":Ljava/io/IOException;
    .restart local v2    # "generator":Lcom/fasterxml/jackson/core/JsonGenerator;
    :cond_1
    :try_start_7
    invoke-virtual {v2}, Lcom/fasterxml/jackson/core/JsonGenerator;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_1
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    goto :goto_1

    .line 161
    .end local v2    # "generator":Lcom/fasterxml/jackson/core/JsonGenerator;
    :catchall_0
    move-exception v4

    .line 162
    :try_start_8
    invoke-virtual {p2}, Ljava/io/OutputStream;->close()V
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_6

    .line 165
    :goto_3
    throw v4

    .line 156
    .restart local v2    # "generator":Lcom/fasterxml/jackson/core/JsonGenerator;
    :catch_3
    move-exception v5

    :try_start_9
    throw v5
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_1

    .line 158
    :catchall_1
    move-exception v4

    if-eqz v2, :cond_2

    if-eqz v5, :cond_3

    :try_start_a
    invoke-virtual {v2}, Lcom/fasterxml/jackson/core/JsonGenerator;->close()V
    :try_end_a
    .catch Ljava/lang/Throwable; {:try_start_a .. :try_end_a} :catch_4
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_1
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    :cond_2
    :goto_4
    :try_start_b
    throw v4

    :catch_4
    move-exception v3

    .restart local v3    # "x2":Ljava/lang/Throwable;
    invoke-virtual {v5, v3}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_4

    .end local v3    # "x2":Ljava/lang/Throwable;
    :cond_3
    invoke-virtual {v2}, Lcom/fasterxml/jackson/core/JsonGenerator;->close()V
    :try_end_b
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_b} :catch_1
    .catchall {:try_start_b .. :try_end_b} :catchall_0

    goto :goto_4

    .line 163
    :catch_5
    move-exception v1

    .line 164
    .restart local v1    # "e":Ljava/io/IOException;
    sget-object v4, Lio/sentry/marshaller/json/JsonMarshaller;->logger:Lorg/slf4j/Logger;

    const-string/jumbo v5, "An exception occurred while serialising the event."

    invoke-interface {v4, v5, v1}, Lorg/slf4j/Logger;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_2

    .line 163
    .end local v1    # "e":Ljava/io/IOException;
    .end local v2    # "generator":Lcom/fasterxml/jackson/core/JsonGenerator;
    :catch_6
    move-exception v1

    .line 164
    .restart local v1    # "e":Ljava/io/IOException;
    sget-object v5, Lio/sentry/marshaller/json/JsonMarshaller;->logger:Lorg/slf4j/Logger;

    const-string/jumbo v6, "An exception occurred while serialising the event."

    invoke-interface {v5, v6, v1}, Lorg/slf4j/Logger;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_3

    .end local v1    # "e":Ljava/io/IOException;
    .end local p2    # "destination":Ljava/io/OutputStream;
    .restart local v0    # "destination":Ljava/io/OutputStream;
    :cond_4
    move-object p2, v0

    .end local v0    # "destination":Ljava/io/OutputStream;
    .restart local p2    # "destination":Ljava/io/OutputStream;
    goto :goto_0
.end method

.method public setCompression(Z)V
    .locals 0
    .param p1, "compression"    # Z

    .prologue
    .line 418
    iput-boolean p1, p0, Lio/sentry/marshaller/json/JsonMarshaller;->compression:Z

    .line 419
    return-void
.end method
