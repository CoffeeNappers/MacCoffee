.class final Lio/sentry/event/EventBuilder$HostnameCache;
.super Ljava/lang/Object;
.source "EventBuilder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/sentry/event/EventBuilder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "HostnameCache"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/sentry/event/EventBuilder$HostnameCache$HostRetriever;
    }
.end annotation


# static fields
.field public static final GET_HOSTNAME_TIMEOUT:J

.field private static final logger:Lorg/slf4j/Logger;


# instance fields
.field private final cacheDuration:J

.field private expirationTimestamp:J

.field private hostname:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    .line 457
    sget-object v0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v2, 0x1

    invoke-virtual {v0, v2, v3}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v0

    sput-wide v0, Lio/sentry/event/EventBuilder$HostnameCache;->GET_HOSTNAME_TIMEOUT:J

    .line 458
    const-class v0, Lio/sentry/event/EventBuilder$HostnameCache;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    sput-object v0, Lio/sentry/event/EventBuilder$HostnameCache;->logger:Lorg/slf4j/Logger;

    return-void
.end method

.method private constructor <init>(J)V
    .locals 1
    .param p1, "cacheDuration"    # J

    .prologue
    .line 477
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 466
    const-string/jumbo v0, "unavailable"

    iput-object v0, p0, Lio/sentry/event/EventBuilder$HostnameCache;->hostname:Ljava/lang/String;

    .line 478
    iput-wide p1, p0, Lio/sentry/event/EventBuilder$HostnameCache;->cacheDuration:J

    .line 479
    return-void
.end method

.method synthetic constructor <init>(JLio/sentry/event/EventBuilder$1;)V
    .locals 1
    .param p1, "x0"    # J
    .param p3, "x1"    # Lio/sentry/event/EventBuilder$1;

    .prologue
    .line 453
    invoke-direct {p0, p1, p2}, Lio/sentry/event/EventBuilder$HostnameCache;-><init>(J)V

    return-void
.end method


# virtual methods
.method public getHostname()Ljava/lang/String;
    .locals 4

    .prologue
    .line 489
    iget-wide v0, p0, Lio/sentry/event/EventBuilder$HostnameCache;->expirationTimestamp:J

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-gez v0, :cond_0

    .line 490
    invoke-virtual {p0}, Lio/sentry/event/EventBuilder$HostnameCache;->updateCache()V

    .line 493
    :cond_0
    iget-object v0, p0, Lio/sentry/event/EventBuilder$HostnameCache;->hostname:Ljava/lang/String;

    return-object v0
.end method

.method public updateCache()V
    .locals 8

    .prologue
    .line 500
    new-instance v1, Ljava/util/concurrent/FutureTask;

    new-instance v2, Lio/sentry/event/EventBuilder$HostnameCache$HostRetriever;

    const/4 v3, 0x0

    invoke-direct {v2, v3}, Lio/sentry/event/EventBuilder$HostnameCache$HostRetriever;-><init>(Lio/sentry/event/EventBuilder$1;)V

    invoke-direct {v1, v2}, Ljava/util/concurrent/FutureTask;-><init>(Ljava/util/concurrent/Callable;)V

    .line 502
    .local v1, "futureTask":Ljava/util/concurrent/FutureTask;, "Ljava/util/concurrent/FutureTask<Ljava/lang/String;>;"
    :try_start_0
    new-instance v2, Ljava/lang/Thread;

    invoke-direct {v2, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    .line 503
    sget-object v2, Lio/sentry/event/EventBuilder$HostnameCache;->logger:Lorg/slf4j/Logger;

    const-string/jumbo v3, "Updating the hostname cache"

    invoke-interface {v2, v3}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;)V

    .line 504
    sget-wide v2, Lio/sentry/event/EventBuilder$HostnameCache;->GET_HOSTNAME_TIMEOUT:J

    sget-object v4, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v1, v2, v3, v4}, Ljava/util/concurrent/FutureTask;->get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    iput-object v2, p0, Lio/sentry/event/EventBuilder$HostnameCache;->hostname:Ljava/lang/String;

    .line 505
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iget-wide v4, p0, Lio/sentry/event/EventBuilder$HostnameCache;->cacheDuration:J

    add-long/2addr v2, v4

    iput-wide v2, p0, Lio/sentry/event/EventBuilder$HostnameCache;->expirationTimestamp:J
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 511
    :goto_0
    return-void

    .line 506
    :catch_0
    move-exception v0

    .line 507
    .local v0, "e":Ljava/lang/Exception;
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/util/concurrent/FutureTask;->cancel(Z)Z

    .line 508
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    sget-object v4, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v6, 0x1

    invoke-virtual {v4, v6, v7}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v4

    add-long/2addr v2, v4

    iput-wide v2, p0, Lio/sentry/event/EventBuilder$HostnameCache;->expirationTimestamp:J

    .line 509
    sget-object v2, Lio/sentry/event/EventBuilder$HostnameCache;->logger:Lorg/slf4j/Logger;

    const-string/jumbo v3, "Localhost hostname lookup failed, keeping the value \'{}\'"

    iget-object v4, p0, Lio/sentry/event/EventBuilder$HostnameCache;->hostname:Ljava/lang/String;

    invoke-interface {v2, v3, v4, v0}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_0
.end method
