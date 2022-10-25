.class public final Lio/sentry/environment/SentryEnvironment;
.super Ljava/lang/Object;
.source "SentryEnvironment.java"


# static fields
.field public static final SDK_NAME:Ljava/lang/String; = "sentry-java"

.field public static final SDK_VERSION:Ljava/lang/String;

.field protected static final SENTRY_THREAD:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal",
            "<",
            "Ljava/util/concurrent/atomic/AtomicInteger;",
            ">;"
        }
    .end annotation
.end field

.field private static final logger:Lorg/slf4j/Logger;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 23
    const-string/jumbo v0, "sentry-build"

    invoke-static {v0}, Ljava/util/ResourceBundle;->getBundle(Ljava/lang/String;)Ljava/util/ResourceBundle;

    move-result-object v0

    const-string/jumbo v1, "build.name"

    invoke-virtual {v0, v1}, Ljava/util/ResourceBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lio/sentry/environment/SentryEnvironment;->SDK_VERSION:Ljava/lang/String;

    .line 27
    new-instance v0, Lio/sentry/environment/SentryEnvironment$1;

    invoke-direct {v0}, Lio/sentry/environment/SentryEnvironment$1;-><init>()V

    sput-object v0, Lio/sentry/environment/SentryEnvironment;->SENTRY_THREAD:Ljava/lang/ThreadLocal;

    .line 33
    const-class v0, Lio/sentry/environment/SentryEnvironment;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    sput-object v0, Lio/sentry/environment/SentryEnvironment;->logger:Lorg/slf4j/Logger;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    return-void
.end method

.method public static getSentryName()Ljava/lang/String;
    .locals 2

    .prologue
    .line 95
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "sentry-java/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lio/sentry/environment/SentryEnvironment;->SDK_VERSION:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static isManagingThread()Z
    .locals 1

    .prologue
    .line 86
    sget-object v0, Lio/sentry/environment/SentryEnvironment;->SENTRY_THREAD:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static startManagingThread()V
    .locals 2

    .prologue
    .line 55
    :try_start_0
    invoke-static {}, Lio/sentry/environment/SentryEnvironment;->isManagingThread()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 56
    sget-object v0, Lio/sentry/environment/SentryEnvironment;->logger:Lorg/slf4j/Logger;

    const-string/jumbo v1, "Thread already managed by Sentry"

    invoke-interface {v0, v1}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 59
    :cond_0
    sget-object v0, Lio/sentry/environment/SentryEnvironment;->SENTRY_THREAD:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    .line 61
    return-void

    .line 59
    :catchall_0
    move-exception v0

    move-object v1, v0

    sget-object v0, Lio/sentry/environment/SentryEnvironment;->SENTRY_THREAD:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    throw v1
.end method

.method public static stopManagingThread()V
    .locals 2

    .prologue
    .line 70
    :try_start_0
    invoke-static {}, Lio/sentry/environment/SentryEnvironment;->isManagingThread()Z

    move-result v0

    if-nez v0, :cond_0

    .line 72
    invoke-static {}, Lio/sentry/environment/SentryEnvironment;->startManagingThread()V

    .line 73
    sget-object v0, Lio/sentry/environment/SentryEnvironment;->logger:Lorg/slf4j/Logger;

    const-string/jumbo v1, "Thread not yet managed by Sentry"

    invoke-interface {v0, v1}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 76
    :cond_0
    sget-object v0, Lio/sentry/environment/SentryEnvironment;->SENTRY_THREAD:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 78
    return-void

    .line 76
    :catchall_0
    move-exception v0

    move-object v1, v0

    sget-object v0, Lio/sentry/environment/SentryEnvironment;->SENTRY_THREAD:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    throw v1
.end method
