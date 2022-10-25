.class public Lio/sentry/SentryClient;
.super Ljava/lang/Object;
.source "SentryClient.java"


# static fields
.field private static final lockdownLogger:Lorg/slf4j/Logger;

.field private static final logger:Lorg/slf4j/Logger;


# instance fields
.field private final builderHelpers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lio/sentry/event/helper/EventBuilderHelper;",
            ">;"
        }
    .end annotation
.end field

.field private final connection:Lio/sentry/connection/Connection;

.field private final contextManager:Lio/sentry/context/ContextManager;

.field protected dist:Ljava/lang/String;

.field protected environment:Ljava/lang/String;

.field protected extraTags:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field protected release:Ljava/lang/String;

.field protected serverName:Ljava/lang/String;

.field protected tags:Ljava/util/Map;
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


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 27
    const-class v0, Lio/sentry/SentryClient;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    sput-object v0, Lio/sentry/SentryClient;->logger:Lorg/slf4j/Logger;

    .line 29
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-class v1, Lio/sentry/SentryClient;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ".lockdown"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/String;)Lorg/slf4j/Logger;

    move-result-object v0

    sput-object v0, Lio/sentry/SentryClient;->lockdownLogger:Lorg/slf4j/Logger;

    return-void
.end method

.method public constructor <init>(Lio/sentry/connection/Connection;Lio/sentry/context/ContextManager;)V
    .locals 1
    .param p1, "connection"    # Lio/sentry/connection/Connection;
    .param p2, "contextManager"    # Lio/sentry/context/ContextManager;

    .prologue
    .line 92
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 61
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lio/sentry/SentryClient;->tags:Ljava/util/Map;

    .line 68
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lio/sentry/SentryClient;->extraTags:Ljava/util/Set;

    .line 76
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    iput-object v0, p0, Lio/sentry/SentryClient;->builderHelpers:Ljava/util/List;

    .line 93
    iput-object p1, p0, Lio/sentry/SentryClient;->connection:Lio/sentry/connection/Connection;

    .line 94
    iput-object p2, p0, Lio/sentry/SentryClient;->contextManager:Lio/sentry/context/ContextManager;

    .line 95
    return-void
.end method


# virtual methods
.method public addBuilderHelper(Lio/sentry/event/helper/EventBuilderHelper;)V
    .locals 2
    .param p1, "builderHelper"    # Lio/sentry/event/helper/EventBuilderHelper;

    .prologue
    .line 199
    sget-object v0, Lio/sentry/SentryClient;->logger:Lorg/slf4j/Logger;

    const-string/jumbo v1, "Adding \'{}\' to the list of builder helpers."

    invoke-interface {v0, v1, p1}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;Ljava/lang/Object;)V

    .line 200
    iget-object v0, p0, Lio/sentry/SentryClient;->builderHelpers:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 201
    return-void
.end method

.method addEventSendCallback(Lio/sentry/connection/EventSendCallback;)V
    .locals 1
    .param p1, "eventSendCallback"    # Lio/sentry/connection/EventSendCallback;

    .prologue
    .line 320
    iget-object v0, p0, Lio/sentry/SentryClient;->connection:Lio/sentry/connection/Connection;

    invoke-interface {v0, p1}, Lio/sentry/connection/Connection;->addEventSendCallback(Lio/sentry/connection/EventSendCallback;)V

    .line 321
    return-void
.end method

.method public addExtraTag(Ljava/lang/String;)V
    .locals 1
    .param p1, "extraName"    # Ljava/lang/String;

    .prologue
    .line 310
    iget-object v0, p0, Lio/sentry/SentryClient;->extraTags:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 311
    return-void
.end method

.method public addTag(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 269
    iget-object v0, p0, Lio/sentry/SentryClient;->tags:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 270
    return-void
.end method

.method public closeConnection()V
    .locals 3

    .prologue
    .line 212
    :try_start_0
    iget-object v1, p0, Lio/sentry/SentryClient;->connection:Lio/sentry/connection/Connection;

    invoke-interface {v1}, Lio/sentry/connection/Connection;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 216
    return-void

    .line 213
    :catch_0
    move-exception v0

    .line 214
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Ljava/lang/RuntimeException;

    const-string/jumbo v2, "Couldn\'t close the Sentry connection"

    invoke-direct {v1, v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public getBuilderHelpers()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lio/sentry/event/helper/EventBuilderHelper;",
            ">;"
        }
    .end annotation

    .prologue
    .line 204
    iget-object v0, p0, Lio/sentry/SentryClient;->builderHelpers:Ljava/util/List;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getContext()Lio/sentry/context/Context;
    .locals 1

    .prologue
    .line 219
    iget-object v0, p0, Lio/sentry/SentryClient;->contextManager:Lio/sentry/context/ContextManager;

    invoke-interface {v0}, Lio/sentry/context/ContextManager;->getContext()Lio/sentry/context/Context;

    move-result-object v0

    return-object v0
.end method

.method public getDist()Ljava/lang/String;
    .locals 1

    .prologue
    .line 227
    iget-object v0, p0, Lio/sentry/SentryClient;->dist:Ljava/lang/String;

    return-object v0
.end method

.method public getEnvironment()Ljava/lang/String;
    .locals 1

    .prologue
    .line 231
    iget-object v0, p0, Lio/sentry/SentryClient;->environment:Ljava/lang/String;

    return-object v0
.end method

.method public getExtraTags()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 243
    iget-object v0, p0, Lio/sentry/SentryClient;->extraTags:Ljava/util/Set;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public getRelease()Ljava/lang/String;
    .locals 1

    .prologue
    .line 223
    iget-object v0, p0, Lio/sentry/SentryClient;->release:Ljava/lang/String;

    return-object v0
.end method

.method public getServerName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 235
    iget-object v0, p0, Lio/sentry/SentryClient;->serverName:Ljava/lang/String;

    return-object v0
.end method

.method public getTags()Ljava/util/Map;
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
    .line 239
    iget-object v0, p0, Lio/sentry/SentryClient;->tags:Ljava/util/Map;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public removeBuilderHelper(Lio/sentry/event/helper/EventBuilderHelper;)V
    .locals 2
    .param p1, "builderHelper"    # Lio/sentry/event/helper/EventBuilderHelper;

    .prologue
    .line 189
    sget-object v0, Lio/sentry/SentryClient;->logger:Lorg/slf4j/Logger;

    const-string/jumbo v1, "Removing \'{}\' from the list of builder helpers."

    invoke-interface {v0, v1, p1}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;Ljava/lang/Object;)V

    .line 190
    iget-object v0, p0, Lio/sentry/SentryClient;->builderHelpers:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 191
    return-void
.end method

.method public runBuilderHelpers(Lio/sentry/event/EventBuilder;)V
    .locals 3
    .param p1, "eventBuilder"    # Lio/sentry/event/EventBuilder;

    .prologue
    .line 104
    iget-object v2, p0, Lio/sentry/SentryClient;->builderHelpers:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/sentry/event/helper/EventBuilderHelper;

    .line 105
    .local v0, "builderHelper":Lio/sentry/event/helper/EventBuilderHelper;
    invoke-interface {v0, p1}, Lio/sentry/event/helper/EventBuilderHelper;->helpBuildingEvent(Lio/sentry/event/EventBuilder;)V

    goto :goto_0

    .line 107
    .end local v0    # "builderHelper":Lio/sentry/event/helper/EventBuilderHelper;
    :cond_0
    return-void
.end method

.method public sendEvent(Lio/sentry/event/Event;)V
    .locals 4
    .param p1, "event"    # Lio/sentry/event/Event;

    .prologue
    .line 116
    :try_start_0
    iget-object v1, p0, Lio/sentry/SentryClient;->connection:Lio/sentry/connection/Connection;

    invoke-interface {v1, p1}, Lio/sentry/connection/Connection;->send(Lio/sentry/event/Event;)V
    :try_end_0
    .catch Lio/sentry/connection/LockedDownException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 122
    invoke-virtual {p0}, Lio/sentry/SentryClient;->getContext()Lio/sentry/context/Context;

    move-result-object v1

    invoke-virtual {p1}, Lio/sentry/event/Event;->getId()Ljava/util/UUID;

    move-result-object v2

    invoke-virtual {v1, v2}, Lio/sentry/context/Context;->setLastEventId(Ljava/util/UUID;)V

    .line 124
    :goto_0
    return-void

    .line 117
    :catch_0
    move-exception v0

    .line 118
    .local v0, "e":Lio/sentry/connection/LockedDownException;
    :try_start_1
    sget-object v1, Lio/sentry/SentryClient;->lockdownLogger:Lorg/slf4j/Logger;

    const-string/jumbo v2, "The connection to Sentry is currently locked down."

    invoke-interface {v1, v2, v0}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 122
    invoke-virtual {p0}, Lio/sentry/SentryClient;->getContext()Lio/sentry/context/Context;

    move-result-object v1

    invoke-virtual {p1}, Lio/sentry/event/Event;->getId()Ljava/util/UUID;

    move-result-object v2

    invoke-virtual {v1, v2}, Lio/sentry/context/Context;->setLastEventId(Ljava/util/UUID;)V

    goto :goto_0

    .line 119
    .end local v0    # "e":Lio/sentry/connection/LockedDownException;
    :catch_1
    move-exception v0

    .line 120
    .local v0, "e":Ljava/lang/Exception;
    :try_start_2
    sget-object v1, Lio/sentry/SentryClient;->logger:Lorg/slf4j/Logger;

    const-string/jumbo v2, "An exception occurred while sending the event to Sentry."

    invoke-interface {v1, v2, v0}, Lorg/slf4j/Logger;->error(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 122
    invoke-virtual {p0}, Lio/sentry/SentryClient;->getContext()Lio/sentry/context/Context;

    move-result-object v1

    invoke-virtual {p1}, Lio/sentry/event/Event;->getId()Ljava/util/UUID;

    move-result-object v2

    invoke-virtual {v1, v2}, Lio/sentry/context/Context;->setLastEventId(Ljava/util/UUID;)V

    goto :goto_0

    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v1

    invoke-virtual {p0}, Lio/sentry/SentryClient;->getContext()Lio/sentry/context/Context;

    move-result-object v2

    invoke-virtual {p1}, Lio/sentry/event/Event;->getId()Ljava/util/UUID;

    move-result-object v3

    invoke-virtual {v2, v3}, Lio/sentry/context/Context;->setLastEventId(Ljava/util/UUID;)V

    throw v1
.end method

.method public sendEvent(Lio/sentry/event/EventBuilder;)V
    .locals 5
    .param p1, "eventBuilder"    # Lio/sentry/event/EventBuilder;

    .prologue
    .line 132
    iget-object v3, p0, Lio/sentry/SentryClient;->release:Ljava/lang/String;

    invoke-static {v3}, Lio/sentry/util/Util;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 133
    iget-object v3, p0, Lio/sentry/SentryClient;->release:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Lio/sentry/event/EventBuilder;->withRelease(Ljava/lang/String;)Lio/sentry/event/EventBuilder;

    .line 134
    iget-object v3, p0, Lio/sentry/SentryClient;->dist:Ljava/lang/String;

    invoke-static {v3}, Lio/sentry/util/Util;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 135
    iget-object v3, p0, Lio/sentry/SentryClient;->dist:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Lio/sentry/event/EventBuilder;->withDist(Ljava/lang/String;)Lio/sentry/event/EventBuilder;

    .line 139
    :cond_0
    iget-object v3, p0, Lio/sentry/SentryClient;->environment:Ljava/lang/String;

    invoke-static {v3}, Lio/sentry/util/Util;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 140
    iget-object v3, p0, Lio/sentry/SentryClient;->environment:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Lio/sentry/event/EventBuilder;->withEnvironment(Ljava/lang/String;)Lio/sentry/event/EventBuilder;

    .line 143
    :cond_1
    iget-object v3, p0, Lio/sentry/SentryClient;->serverName:Ljava/lang/String;

    invoke-static {v3}, Lio/sentry/util/Util;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_2

    .line 144
    iget-object v3, p0, Lio/sentry/SentryClient;->serverName:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Lio/sentry/event/EventBuilder;->withServerName(Ljava/lang/String;)Lio/sentry/event/EventBuilder;

    .line 147
    :cond_2
    iget-object v3, p0, Lio/sentry/SentryClient;->tags:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 148
    .local v2, "tagEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {p1, v3, v4}, Lio/sentry/event/EventBuilder;->withTag(Ljava/lang/String;Ljava/lang/String;)Lio/sentry/event/EventBuilder;

    goto :goto_0

    .line 151
    .end local v2    # "tagEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_3
    invoke-virtual {p0, p1}, Lio/sentry/SentryClient;->runBuilderHelpers(Lio/sentry/event/EventBuilder;)V

    .line 152
    invoke-virtual {p1}, Lio/sentry/event/EventBuilder;->build()Lio/sentry/event/Event;

    move-result-object v0

    .line 153
    .local v0, "event":Lio/sentry/event/Event;
    invoke-virtual {p0, v0}, Lio/sentry/SentryClient;->sendEvent(Lio/sentry/event/Event;)V

    .line 154
    return-void
.end method

.method public sendException(Ljava/lang/Throwable;)V
    .locals 3
    .param p1, "throwable"    # Ljava/lang/Throwable;

    .prologue
    .line 177
    new-instance v1, Lio/sentry/event/EventBuilder;

    invoke-direct {v1}, Lio/sentry/event/EventBuilder;-><init>()V

    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lio/sentry/event/EventBuilder;->withMessage(Ljava/lang/String;)Lio/sentry/event/EventBuilder;

    move-result-object v1

    sget-object v2, Lio/sentry/event/Event$Level;->ERROR:Lio/sentry/event/Event$Level;

    invoke-virtual {v1, v2}, Lio/sentry/event/EventBuilder;->withLevel(Lio/sentry/event/Event$Level;)Lio/sentry/event/EventBuilder;

    move-result-object v1

    new-instance v2, Lio/sentry/event/interfaces/ExceptionInterface;

    invoke-direct {v2, p1}, Lio/sentry/event/interfaces/ExceptionInterface;-><init>(Ljava/lang/Throwable;)V

    invoke-virtual {v1, v2}, Lio/sentry/event/EventBuilder;->withSentryInterface(Lio/sentry/event/interfaces/SentryInterface;)Lio/sentry/event/EventBuilder;

    move-result-object v0

    .line 180
    .local v0, "eventBuilder":Lio/sentry/event/EventBuilder;
    invoke-virtual {p0, v0}, Lio/sentry/SentryClient;->sendEvent(Lio/sentry/event/EventBuilder;)V

    .line 181
    return-void
.end method

.method public sendMessage(Ljava/lang/String;)V
    .locals 3
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 164
    new-instance v1, Lio/sentry/event/EventBuilder;

    invoke-direct {v1}, Lio/sentry/event/EventBuilder;-><init>()V

    invoke-virtual {v1, p1}, Lio/sentry/event/EventBuilder;->withMessage(Ljava/lang/String;)Lio/sentry/event/EventBuilder;

    move-result-object v1

    sget-object v2, Lio/sentry/event/Event$Level;->INFO:Lio/sentry/event/Event$Level;

    invoke-virtual {v1, v2}, Lio/sentry/event/EventBuilder;->withLevel(Lio/sentry/event/Event$Level;)Lio/sentry/event/EventBuilder;

    move-result-object v0

    .line 166
    .local v0, "eventBuilder":Lio/sentry/event/EventBuilder;
    invoke-virtual {p0, v0}, Lio/sentry/SentryClient;->sendEvent(Lio/sentry/event/EventBuilder;)V

    .line 167
    return-void
.end method

.method public setDist(Ljava/lang/String;)V
    .locals 0
    .param p1, "dist"    # Ljava/lang/String;

    .prologue
    .line 251
    iput-object p1, p0, Lio/sentry/SentryClient;->dist:Ljava/lang/String;

    .line 252
    return-void
.end method

.method public setEnvironment(Ljava/lang/String;)V
    .locals 0
    .param p1, "environment"    # Ljava/lang/String;

    .prologue
    .line 255
    iput-object p1, p0, Lio/sentry/SentryClient;->environment:Ljava/lang/String;

    .line 256
    return-void
.end method

.method public setExtraTags(Ljava/util/Set;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 294
    .local p1, "extraTags":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    if-nez p1, :cond_0

    .line 295
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lio/sentry/SentryClient;->extraTags:Ljava/util/Set;

    .line 299
    :goto_0
    return-void

    .line 297
    :cond_0
    iput-object p1, p0, Lio/sentry/SentryClient;->extraTags:Ljava/util/Set;

    goto :goto_0
.end method

.method public setRelease(Ljava/lang/String;)V
    .locals 0
    .param p1, "release"    # Ljava/lang/String;

    .prologue
    .line 247
    iput-object p1, p0, Lio/sentry/SentryClient;->release:Ljava/lang/String;

    .line 248
    return-void
.end method

.method public setServerName(Ljava/lang/String;)V
    .locals 0
    .param p1, "serverName"    # Ljava/lang/String;

    .prologue
    .line 259
    iput-object p1, p0, Lio/sentry/SentryClient;->serverName:Ljava/lang/String;

    .line 260
    return-void
.end method

.method public setTags(Ljava/util/Map;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 278
    .local p1, "tags":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    if-nez p1, :cond_0

    .line 279
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lio/sentry/SentryClient;->tags:Ljava/util/Map;

    .line 283
    :goto_0
    return-void

    .line 281
    :cond_0
    iput-object p1, p0, Lio/sentry/SentryClient;->tags:Ljava/util/Map;

    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    const/16 v2, 0x27

    .line 325
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "SentryClient{release=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lio/sentry/SentryClient;->release:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", dist=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lio/sentry/SentryClient;->dist:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", environment=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lio/sentry/SentryClient;->environment:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", serverName=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lio/sentry/SentryClient;->serverName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", tags="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lio/sentry/SentryClient;->tags:Ljava/util/Map;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", extraTags="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lio/sentry/SentryClient;->extraTags:Ljava/util/Set;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", connection="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lio/sentry/SentryClient;->connection:Lio/sentry/connection/Connection;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", builderHelpers="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lio/sentry/SentryClient;->builderHelpers:Ljava/util/List;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", contextManager="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lio/sentry/SentryClient;->contextManager:Lio/sentry/context/ContextManager;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
