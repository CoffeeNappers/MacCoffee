.class public Lio/sentry/SentryUncaughtExceptionHandler;
.super Ljava/lang/Object;
.source "SentryUncaughtExceptionHandler.java"

# interfaces
.implements Ljava/lang/Thread$UncaughtExceptionHandler;


# static fields
.field private static final logger:Lorg/slf4j/Logger;


# instance fields
.field private defaultExceptionHandler:Ljava/lang/Thread$UncaughtExceptionHandler;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 14
    const-class v0, Lio/sentry/SentryClientFactory;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    sput-object v0, Lio/sentry/SentryUncaughtExceptionHandler;->logger:Lorg/slf4j/Logger;

    return-void
.end method

.method public constructor <init>(Ljava/lang/Thread$UncaughtExceptionHandler;)V
    .locals 0
    .param p1, "defaultExceptionHandler"    # Ljava/lang/Thread$UncaughtExceptionHandler;

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    iput-object p1, p0, Lio/sentry/SentryUncaughtExceptionHandler;->defaultExceptionHandler:Ljava/lang/Thread$UncaughtExceptionHandler;

    .line 29
    return-void
.end method

.method public static setup()V
    .locals 4

    .prologue
    .line 64
    invoke-static {}, Ljava/lang/Thread;->getDefaultUncaughtExceptionHandler()Ljava/lang/Thread$UncaughtExceptionHandler;

    move-result-object v0

    .line 65
    .local v0, "currentHandler":Ljava/lang/Thread$UncaughtExceptionHandler;
    if-eqz v0, :cond_0

    .line 66
    sget-object v1, Lio/sentry/SentryUncaughtExceptionHandler;->logger:Lorg/slf4j/Logger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "default UncaughtExceptionHandler class=\'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "\'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;)V

    .line 70
    :cond_0
    instance-of v1, v0, Lio/sentry/SentryUncaughtExceptionHandler;

    if-nez v1, :cond_1

    .line 72
    new-instance v1, Lio/sentry/SentryUncaughtExceptionHandler;

    invoke-direct {v1, v0}, Lio/sentry/SentryUncaughtExceptionHandler;-><init>(Ljava/lang/Thread$UncaughtExceptionHandler;)V

    invoke-static {v1}, Ljava/lang/Thread;->setDefaultUncaughtExceptionHandler(Ljava/lang/Thread$UncaughtExceptionHandler;)V

    .line 75
    :cond_1
    return-void
.end method


# virtual methods
.method public uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V
    .locals 4
    .param p1, "thread"    # Ljava/lang/Thread;
    .param p2, "thrown"    # Ljava/lang/Throwable;

    .prologue
    .line 40
    sget-object v2, Lio/sentry/SentryUncaughtExceptionHandler;->logger:Lorg/slf4j/Logger;

    const-string/jumbo v3, "Uncaught exception received."

    invoke-interface {v2, v3}, Lorg/slf4j/Logger;->trace(Ljava/lang/String;)V

    .line 42
    new-instance v2, Lio/sentry/event/EventBuilder;

    invoke-direct {v2}, Lio/sentry/event/EventBuilder;-><init>()V

    invoke-virtual {p2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lio/sentry/event/EventBuilder;->withMessage(Ljava/lang/String;)Lio/sentry/event/EventBuilder;

    move-result-object v2

    sget-object v3, Lio/sentry/event/Event$Level;->FATAL:Lio/sentry/event/Event$Level;

    invoke-virtual {v2, v3}, Lio/sentry/event/EventBuilder;->withLevel(Lio/sentry/event/Event$Level;)Lio/sentry/event/EventBuilder;

    move-result-object v2

    new-instance v3, Lio/sentry/event/interfaces/ExceptionInterface;

    invoke-direct {v3, p2}, Lio/sentry/event/interfaces/ExceptionInterface;-><init>(Ljava/lang/Throwable;)V

    invoke-virtual {v2, v3}, Lio/sentry/event/EventBuilder;->withSentryInterface(Lio/sentry/event/interfaces/SentryInterface;)Lio/sentry/event/EventBuilder;

    move-result-object v1

    .line 48
    .local v1, "eventBuilder":Lio/sentry/event/EventBuilder;
    :try_start_0
    invoke-static {v1}, Lio/sentry/Sentry;->capture(Lio/sentry/event/EventBuilder;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 53
    :goto_0
    iget-object v2, p0, Lio/sentry/SentryUncaughtExceptionHandler;->defaultExceptionHandler:Ljava/lang/Thread$UncaughtExceptionHandler;

    if-eqz v2, :cond_0

    .line 55
    iget-object v2, p0, Lio/sentry/SentryUncaughtExceptionHandler;->defaultExceptionHandler:Ljava/lang/Thread$UncaughtExceptionHandler;

    invoke-interface {v2, p1, p2}, Ljava/lang/Thread$UncaughtExceptionHandler;->uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V

    .line 57
    :cond_0
    return-void

    .line 49
    :catch_0
    move-exception v0

    .line 50
    .local v0, "e":Ljava/lang/Exception;
    sget-object v2, Lio/sentry/SentryUncaughtExceptionHandler;->logger:Lorg/slf4j/Logger;

    const-string/jumbo v3, "Error sending uncaught exception to Sentry."

    invoke-interface {v2, v3, v0}, Lorg/slf4j/Logger;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method
