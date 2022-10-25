.class public abstract Lio/sentry/connection/AbstractConnection;
.super Ljava/lang/Object;
.source "AbstractConnection.java"

# interfaces
.implements Lio/sentry/connection/Connection;


# static fields
.field public static final SENTRY_PROTOCOL_VERSION:Ljava/lang/String; = "6"

.field private static final logger:Lorg/slf4j/Logger;


# instance fields
.field private final authHeader:Ljava/lang/String;

.field private eventSendCallbacks:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lio/sentry/connection/EventSendCallback;",
            ">;"
        }
    .end annotation
.end field

.field private lockdownManager:Lio/sentry/connection/LockdownManager;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 23
    const-class v0, Lio/sentry/connection/AbstractConnection;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    sput-object v0, Lio/sentry/connection/AbstractConnection;->logger:Lorg/slf4j/Logger;

    return-void
.end method

.method protected constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "publicKey"    # Ljava/lang/String;
    .param p2, "secretKey"    # Ljava/lang/String;

    .prologue
    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    new-instance v0, Lio/sentry/connection/LockdownManager;

    invoke-direct {v0}, Lio/sentry/connection/LockdownManager;-><init>()V

    iput-object v0, p0, Lio/sentry/connection/AbstractConnection;->lockdownManager:Lio/sentry/connection/LockdownManager;

    .line 43
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lio/sentry/connection/AbstractConnection;->eventSendCallbacks:Ljava/util/Set;

    .line 44
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "Sentry sentry_version=6,sentry_client="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {}, Lio/sentry/environment/SentryEnvironment;->getSentryName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "sentry_key="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "sentry_secret="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lio/sentry/connection/AbstractConnection;->authHeader:Ljava/lang/String;

    .line 48
    return-void
.end method


# virtual methods
.method public addEventSendCallback(Lio/sentry/connection/EventSendCallback;)V
    .locals 1
    .param p1, "eventSendCallback"    # Lio/sentry/connection/EventSendCallback;

    .prologue
    .line 115
    iget-object v0, p0, Lio/sentry/connection/AbstractConnection;->eventSendCallbacks:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 116
    return-void
.end method

.method protected abstract doSend(Lio/sentry/event/Event;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lio/sentry/connection/ConnectionException;
        }
    .end annotation
.end method

.method protected getAuthHeader()Ljava/lang/String;
    .locals 1

    .prologue
    .line 56
    iget-object v0, p0, Lio/sentry/connection/AbstractConnection;->authHeader:Ljava/lang/String;

    return-object v0
.end method

.method public final send(Lio/sentry/event/Event;)V
    .locals 7
    .param p1, "event"    # Lio/sentry/event/Event;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lio/sentry/connection/ConnectionException;
        }
    .end annotation

    .prologue
    .line 62
    :try_start_0
    iget-object v4, p0, Lio/sentry/connection/AbstractConnection;->lockdownManager:Lio/sentry/connection/LockdownManager;

    invoke-virtual {v4}, Lio/sentry/connection/LockdownManager;->isLockedDown()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 68
    new-instance v4, Lio/sentry/connection/LockedDownException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "Dropping an Event due to lockdown: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lio/sentry/connection/LockedDownException;-><init>(Ljava/lang/String;)V

    throw v4
    :try_end_0
    .catch Lio/sentry/connection/ConnectionException; {:try_start_0 .. :try_end_0} :catch_0

    .line 83
    :catch_0
    move-exception v0

    .line 84
    .local v0, "e":Lio/sentry/connection/ConnectionException;
    iget-object v4, p0, Lio/sentry/connection/AbstractConnection;->eventSendCallbacks:Ljava/util/Set;

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/sentry/connection/EventSendCallback;

    .line 86
    .local v1, "eventSendCallback":Lio/sentry/connection/EventSendCallback;
    :try_start_1
    invoke-interface {v1, p1, v0}, Lio/sentry/connection/EventSendCallback;->onFailure(Lio/sentry/event/Event;Ljava/lang/Exception;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 87
    :catch_1
    move-exception v2

    .line 88
    .local v2, "exc":Ljava/lang/Exception;
    sget-object v4, Lio/sentry/connection/AbstractConnection;->logger:Lorg/slf4j/Logger;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "An exception occurred while running an EventSendCallback.onFailure: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5, v2}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 71
    .end local v0    # "e":Lio/sentry/connection/ConnectionException;
    .end local v1    # "eventSendCallback":Lio/sentry/connection/EventSendCallback;
    .end local v2    # "exc":Ljava/lang/Exception;
    .end local v3    # "i$":Ljava/util/Iterator;
    :cond_0
    :try_start_2
    invoke-virtual {p0, p1}, Lio/sentry/connection/AbstractConnection;->doSend(Lio/sentry/event/Event;)V

    .line 73
    iget-object v4, p0, Lio/sentry/connection/AbstractConnection;->eventSendCallbacks:Ljava/util/Set;

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .restart local v3    # "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/sentry/connection/EventSendCallback;
    :try_end_2
    .catch Lio/sentry/connection/ConnectionException; {:try_start_2 .. :try_end_2} :catch_0

    .line 75
    .restart local v1    # "eventSendCallback":Lio/sentry/connection/EventSendCallback;
    :try_start_3
    invoke-interface {v1, p1}, Lio/sentry/connection/EventSendCallback;->onSuccess(Lio/sentry/event/Event;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2
    .catch Lio/sentry/connection/ConnectionException; {:try_start_3 .. :try_end_3} :catch_0

    goto :goto_1

    .line 76
    :catch_2
    move-exception v2

    .line 77
    .restart local v2    # "exc":Ljava/lang/Exception;
    :try_start_4
    sget-object v4, Lio/sentry/connection/AbstractConnection;->logger:Lorg/slf4j/Logger;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "An exception occurred while running an EventSendCallback.onSuccess: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5, v2}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1

    .line 82
    .end local v1    # "eventSendCallback":Lio/sentry/connection/EventSendCallback;
    .end local v2    # "exc":Ljava/lang/Exception;
    :cond_1
    iget-object v4, p0, Lio/sentry/connection/AbstractConnection;->lockdownManager:Lio/sentry/connection/LockdownManager;

    invoke-virtual {v4}, Lio/sentry/connection/LockdownManager;->resetState()V
    :try_end_4
    .catch Lio/sentry/connection/ConnectionException; {:try_start_4 .. :try_end_4} :catch_0

    .line 98
    return-void

    .line 93
    .restart local v0    # "e":Lio/sentry/connection/ConnectionException;
    :cond_2
    sget-object v4, Lio/sentry/connection/AbstractConnection;->logger:Lorg/slf4j/Logger;

    const-string/jumbo v5, "An exception due to the connection occurred, a lockdown will be initiated."

    invoke-interface {v4, v5, v0}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 94
    iget-object v4, p0, Lio/sentry/connection/AbstractConnection;->lockdownManager:Lio/sentry/connection/LockdownManager;

    invoke-virtual {v4, v0}, Lio/sentry/connection/LockdownManager;->setState(Lio/sentry/connection/ConnectionException;)V

    .line 96
    throw v0
.end method
