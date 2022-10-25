.class public final Lio/sentry/Sentry;
.super Ljava/lang/Object;
.source "Sentry.java"


# static fields
.field private static autoInitAttempted:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private static final logger:Lorg/slf4j/Logger;

.field private static volatile storedClient:Lio/sentry/SentryClient;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 17
    const-class v0, Lio/sentry/Sentry;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    sput-object v0, Lio/sentry/Sentry;->logger:Lorg/slf4j/Logger;

    .line 22
    const/4 v0, 0x0

    sput-object v0, Lio/sentry/Sentry;->storedClient:Lio/sentry/SentryClient;

    .line 27
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    sput-object v0, Lio/sentry/Sentry;->autoInitAttempted:Ljava/util/concurrent/atomic/AtomicBoolean;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    return-void
.end method

.method public static capture(Lio/sentry/event/Event;)V
    .locals 1
    .param p0, "event"    # Lio/sentry/event/Event;

    .prologue
    .line 127
    invoke-static {}, Lio/sentry/Sentry;->getStoredClient()Lio/sentry/SentryClient;

    move-result-object v0

    invoke-virtual {v0, p0}, Lio/sentry/SentryClient;->sendEvent(Lio/sentry/event/Event;)V

    .line 128
    return-void
.end method

.method public static capture(Lio/sentry/event/EventBuilder;)V
    .locals 1
    .param p0, "eventBuilder"    # Lio/sentry/event/EventBuilder;

    .prologue
    .line 160
    invoke-static {}, Lio/sentry/Sentry;->getStoredClient()Lio/sentry/SentryClient;

    move-result-object v0

    invoke-virtual {v0, p0}, Lio/sentry/SentryClient;->sendEvent(Lio/sentry/event/EventBuilder;)V

    .line 161
    return-void
.end method

.method public static capture(Ljava/lang/String;)V
    .locals 1
    .param p0, "message"    # Ljava/lang/String;

    .prologue
    .line 150
    invoke-static {}, Lio/sentry/Sentry;->getStoredClient()Lio/sentry/SentryClient;

    move-result-object v0

    invoke-virtual {v0, p0}, Lio/sentry/SentryClient;->sendMessage(Ljava/lang/String;)V

    .line 151
    return-void
.end method

.method public static capture(Ljava/lang/Throwable;)V
    .locals 1
    .param p0, "throwable"    # Ljava/lang/Throwable;

    .prologue
    .line 139
    invoke-static {}, Lio/sentry/Sentry;->getStoredClient()Lio/sentry/SentryClient;

    move-result-object v0

    invoke-virtual {v0, p0}, Lio/sentry/SentryClient;->sendException(Ljava/lang/Throwable;)V

    .line 140
    return-void
.end method

.method public static clearContext()V
    .locals 1

    .prologue
    .line 185
    invoke-static {}, Lio/sentry/Sentry;->getStoredClient()Lio/sentry/SentryClient;

    move-result-object v0

    invoke-virtual {v0}, Lio/sentry/SentryClient;->getContext()Lio/sentry/context/Context;

    move-result-object v0

    invoke-virtual {v0}, Lio/sentry/context/Context;->clear()V

    .line 186
    return-void
.end method

.method public static close()V
    .locals 2

    .prologue
    .line 192
    sget-object v0, Lio/sentry/Sentry;->storedClient:Lio/sentry/SentryClient;

    if-nez v0, :cond_0

    .line 201
    :goto_0
    return-void

    .line 196
    :cond_0
    sget-object v0, Lio/sentry/Sentry;->storedClient:Lio/sentry/SentryClient;

    invoke-virtual {v0}, Lio/sentry/SentryClient;->closeConnection()V

    .line 197
    const/4 v0, 0x0

    sput-object v0, Lio/sentry/Sentry;->storedClient:Lio/sentry/SentryClient;

    .line 200
    sget-object v0, Lio/sentry/Sentry;->autoInitAttempted:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    goto :goto_0
.end method

.method public static getStoredClient()Lio/sentry/SentryClient;
    .locals 3

    .prologue
    .line 93
    sget-object v0, Lio/sentry/Sentry;->storedClient:Lio/sentry/SentryClient;

    if-eqz v0, :cond_0

    .line 94
    sget-object v0, Lio/sentry/Sentry;->storedClient:Lio/sentry/SentryClient;

    .line 105
    :goto_0
    return-object v0

    .line 97
    :cond_0
    const-class v1, Lio/sentry/Sentry;

    monitor-enter v1

    .line 98
    :try_start_0
    sget-object v0, Lio/sentry/Sentry;->storedClient:Lio/sentry/SentryClient;

    if-nez v0, :cond_1

    sget-object v0, Lio/sentry/Sentry;->autoInitAttempted:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-nez v0, :cond_1

    .line 100
    sget-object v0, Lio/sentry/Sentry;->autoInitAttempted:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 101
    invoke-static {}, Lio/sentry/Sentry;->init()Lio/sentry/SentryClient;

    .line 103
    :cond_1
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 105
    sget-object v0, Lio/sentry/Sentry;->storedClient:Lio/sentry/SentryClient;

    goto :goto_0

    .line 103
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public static init()Lio/sentry/SentryClient;
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 43
    invoke-static {v0, v0}, Lio/sentry/Sentry;->init(Ljava/lang/String;Lio/sentry/SentryClientFactory;)Lio/sentry/SentryClient;

    move-result-object v0

    return-object v0
.end method

.method public static init(Lio/sentry/SentryClientFactory;)Lio/sentry/SentryClient;
    .locals 1
    .param p0, "sentryClientFactory"    # Lio/sentry/SentryClientFactory;

    .prologue
    .line 54
    const/4 v0, 0x0

    invoke-static {v0, p0}, Lio/sentry/Sentry;->init(Ljava/lang/String;Lio/sentry/SentryClientFactory;)Lio/sentry/SentryClient;

    move-result-object v0

    return-object v0
.end method

.method public static init(Ljava/lang/String;)Lio/sentry/SentryClient;
    .locals 1
    .param p0, "dsn"    # Ljava/lang/String;

    .prologue
    .line 65
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lio/sentry/Sentry;->init(Ljava/lang/String;Lio/sentry/SentryClientFactory;)Lio/sentry/SentryClient;

    move-result-object v0

    return-object v0
.end method

.method public static init(Ljava/lang/String;Lio/sentry/SentryClientFactory;)Lio/sentry/SentryClient;
    .locals 1
    .param p0, "dsn"    # Ljava/lang/String;
    .param p1, "sentryClientFactory"    # Lio/sentry/SentryClientFactory;

    .prologue
    .line 80
    invoke-static {p0, p1}, Lio/sentry/SentryClientFactory;->sentryClient(Ljava/lang/String;Lio/sentry/SentryClientFactory;)Lio/sentry/SentryClient;

    move-result-object v0

    .line 81
    .local v0, "sentryClient":Lio/sentry/SentryClient;
    invoke-static {v0}, Lio/sentry/Sentry;->setStoredClient(Lio/sentry/SentryClient;)V

    .line 82
    return-object v0
.end method

.method public static record(Lio/sentry/event/Breadcrumb;)V
    .locals 1
    .param p0, "breadcrumb"    # Lio/sentry/event/Breadcrumb;

    .prologue
    .line 169
    invoke-static {}, Lio/sentry/Sentry;->getStoredClient()Lio/sentry/SentryClient;

    move-result-object v0

    invoke-virtual {v0}, Lio/sentry/SentryClient;->getContext()Lio/sentry/context/Context;

    move-result-object v0

    invoke-virtual {v0, p0}, Lio/sentry/context/Context;->recordBreadcrumb(Lio/sentry/event/Breadcrumb;)V

    .line 170
    return-void
.end method

.method public static setStoredClient(Lio/sentry/SentryClient;)V
    .locals 3
    .param p0, "client"    # Lio/sentry/SentryClient;

    .prologue
    .line 114
    sget-object v0, Lio/sentry/Sentry;->storedClient:Lio/sentry/SentryClient;

    if-eqz v0, :cond_0

    .line 115
    sget-object v0, Lio/sentry/Sentry;->logger:Lorg/slf4j/Logger;

    const-string/jumbo v1, "Overwriting statically stored SentryClient instance {} with {}."

    sget-object v2, Lio/sentry/Sentry;->storedClient:Lio/sentry/SentryClient;

    invoke-interface {v0, v1, v2, p0}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 118
    :cond_0
    sput-object p0, Lio/sentry/Sentry;->storedClient:Lio/sentry/SentryClient;

    .line 119
    return-void
.end method

.method public static setUser(Lio/sentry/event/User;)V
    .locals 1
    .param p0, "user"    # Lio/sentry/event/User;

    .prologue
    .line 178
    invoke-static {}, Lio/sentry/Sentry;->getStoredClient()Lio/sentry/SentryClient;

    move-result-object v0

    invoke-virtual {v0}, Lio/sentry/SentryClient;->getContext()Lio/sentry/context/Context;

    move-result-object v0

    invoke-virtual {v0, p0}, Lio/sentry/context/Context;->setUser(Lio/sentry/event/User;)V

    .line 179
    return-void
.end method
