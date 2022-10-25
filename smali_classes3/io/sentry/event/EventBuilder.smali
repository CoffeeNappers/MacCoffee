.class public Lio/sentry/event/EventBuilder;
.super Ljava/lang/Object;
.source "EventBuilder.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/sentry/event/EventBuilder$1;,
        Lio/sentry/event/EventBuilder$HostnameCache;
    }
.end annotation


# static fields
.field public static final DEFAULT_HOSTNAME:Ljava/lang/String; = "unavailable"

.field public static final DEFAULT_PLATFORM:Ljava/lang/String; = "java"

.field private static final HOSTNAME_CACHE:Lio/sentry/event/EventBuilder$HostnameCache;

.field public static final HOSTNAME_CACHE_DURATION:J

.field private static final UTF_8:Ljava/nio/charset/Charset;


# instance fields
.field private alreadyBuilt:Z

.field private final event:Lio/sentry/event/Event;

.field private sdkIntegrations:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    .line 35
    sget-object v0, Ljava/util/concurrent/TimeUnit;->HOURS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v2, 0x5

    invoke-virtual {v0, v2, v3}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v0

    sput-wide v0, Lio/sentry/event/EventBuilder;->HOSTNAME_CACHE_DURATION:J

    .line 36
    const-string/jumbo v0, "UTF-8"

    invoke-static {v0}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v0

    sput-object v0, Lio/sentry/event/EventBuilder;->UTF_8:Ljava/nio/charset/Charset;

    .line 37
    new-instance v0, Lio/sentry/event/EventBuilder$HostnameCache;

    sget-wide v2, Lio/sentry/event/EventBuilder;->HOSTNAME_CACHE_DURATION:J

    const/4 v1, 0x0

    invoke-direct {v0, v2, v3, v1}, Lio/sentry/event/EventBuilder$HostnameCache;-><init>(JLio/sentry/event/EventBuilder$1;)V

    sput-object v0, Lio/sentry/event/EventBuilder;->HOSTNAME_CACHE:Lio/sentry/event/EventBuilder$HostnameCache;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 48
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-direct {p0, v0}, Lio/sentry/event/EventBuilder;-><init>(Ljava/util/UUID;)V

    .line 49
    return-void
.end method

.method public constructor <init>(Ljava/util/UUID;)V
    .locals 1
    .param p1, "eventId"    # Ljava/util/UUID;

    .prologue
    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    const/4 v0, 0x0

    iput-boolean v0, p0, Lio/sentry/event/EventBuilder;->alreadyBuilt:Z

    .line 40
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lio/sentry/event/EventBuilder;->sdkIntegrations:Ljava/util/Set;

    .line 57
    new-instance v0, Lio/sentry/event/Event;

    invoke-direct {v0, p1}, Lio/sentry/event/Event;-><init>(Ljava/util/UUID;)V

    iput-object v0, p0, Lio/sentry/event/EventBuilder;->event:Lio/sentry/event/Event;

    .line 58
    return-void
.end method

.method private autoSetMissingValues()V
    .locals 5

    .prologue
    .line 78
    iget-object v0, p0, Lio/sentry/event/EventBuilder;->event:Lio/sentry/event/Event;

    invoke-virtual {v0}, Lio/sentry/event/Event;->getTimestamp()Ljava/util/Date;

    move-result-object v0

    if-nez v0, :cond_0

    .line 79
    iget-object v0, p0, Lio/sentry/event/EventBuilder;->event:Lio/sentry/event/Event;

    new-instance v1, Ljava/util/Date;

    invoke-direct {v1}, Ljava/util/Date;-><init>()V

    invoke-virtual {v0, v1}, Lio/sentry/event/Event;->setTimestamp(Ljava/util/Date;)V

    .line 83
    :cond_0
    iget-object v0, p0, Lio/sentry/event/EventBuilder;->event:Lio/sentry/event/Event;

    invoke-virtual {v0}, Lio/sentry/event/Event;->getPlatform()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_1

    .line 84
    iget-object v0, p0, Lio/sentry/event/EventBuilder;->event:Lio/sentry/event/Event;

    const-string/jumbo v1, "java"

    invoke-virtual {v0, v1}, Lio/sentry/event/Event;->setPlatform(Ljava/lang/String;)V

    .line 88
    :cond_1
    iget-object v0, p0, Lio/sentry/event/EventBuilder;->event:Lio/sentry/event/Event;

    invoke-virtual {v0}, Lio/sentry/event/Event;->getSdk()Lio/sentry/event/Sdk;

    move-result-object v0

    if-nez v0, :cond_2

    .line 89
    iget-object v0, p0, Lio/sentry/event/EventBuilder;->event:Lio/sentry/event/Event;

    new-instance v1, Lio/sentry/event/Sdk;

    const-string/jumbo v2, "sentry-java"

    sget-object v3, Lio/sentry/environment/SentryEnvironment;->SDK_VERSION:Ljava/lang/String;

    iget-object v4, p0, Lio/sentry/event/EventBuilder;->sdkIntegrations:Ljava/util/Set;

    invoke-direct {v1, v2, v3, v4}, Lio/sentry/event/Sdk;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/Set;)V

    invoke-virtual {v0, v1}, Lio/sentry/event/Event;->setSdk(Lio/sentry/event/Sdk;)V

    .line 94
    :cond_2
    iget-object v0, p0, Lio/sentry/event/EventBuilder;->event:Lio/sentry/event/Event;

    invoke-virtual {v0}, Lio/sentry/event/Event;->getServerName()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_3

    .line 95
    iget-object v0, p0, Lio/sentry/event/EventBuilder;->event:Lio/sentry/event/Event;

    sget-object v1, Lio/sentry/event/EventBuilder;->HOSTNAME_CACHE:Lio/sentry/event/EventBuilder$HostnameCache;

    invoke-virtual {v1}, Lio/sentry/event/EventBuilder$HostnameCache;->getHostname()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/sentry/event/Event;->setServerName(Ljava/lang/String;)V

    .line 97
    :cond_3
    return-void
.end method

.method private buildCulpritString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;
    .locals 3
    .param p1, "className"    # Ljava/lang/String;
    .param p2, "methodName"    # Ljava/lang/String;
    .param p3, "fileName"    # Ljava/lang/String;
    .param p4, "lineNumber"    # I

    .prologue
    .line 246
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 248
    .local v0, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 252
    if-eqz p3, :cond_1

    invoke-virtual {p3}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1

    .line 253
    const-string/jumbo v1, "("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 254
    if-ltz p4, :cond_0

    .line 255
    const-string/jumbo v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 257
    :cond_0
    const-string/jumbo v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 260
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private static calculateChecksum(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p0, "string"    # Ljava/lang/String;

    .prologue
    .line 67
    sget-object v2, Lio/sentry/event/EventBuilder;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {p0, v2}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v0

    .line 68
    .local v0, "bytes":[B
    new-instance v1, Ljava/util/zip/CRC32;

    invoke-direct {v1}, Ljava/util/zip/CRC32;-><init>()V

    .line 69
    .local v1, "checksum":Ljava/util/zip/Checksum;
    const/4 v2, 0x0

    array-length v3, v0

    invoke-interface {v1, v0, v2, v3}, Ljava/util/zip/Checksum;->update([BII)V

    .line 70
    invoke-interface {v1}, Ljava/util/zip/Checksum;->getValue()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->toHexString(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method private makeImmutable()V
    .locals 5

    .prologue
    .line 104
    iget-object v3, p0, Lio/sentry/event/EventBuilder;->event:Lio/sentry/event/Event;

    iget-object v4, p0, Lio/sentry/event/EventBuilder;->event:Lio/sentry/event/Event;

    invoke-virtual {v4}, Lio/sentry/event/Event;->getTags()Ljava/util/Map;

    move-result-object v4

    invoke-static {v4}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v4

    invoke-virtual {v3, v4}, Lio/sentry/event/Event;->setTags(Ljava/util/Map;)V

    .line 107
    iget-object v3, p0, Lio/sentry/event/EventBuilder;->event:Lio/sentry/event/Event;

    iget-object v4, p0, Lio/sentry/event/EventBuilder;->event:Lio/sentry/event/Event;

    invoke-virtual {v4}, Lio/sentry/event/Event;->getBreadcrumbs()Ljava/util/List;

    move-result-object v4

    invoke-static {v4}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v4

    invoke-virtual {v3, v4}, Lio/sentry/event/Event;->setBreadcrumbs(Ljava/util/List;)V

    .line 110
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 111
    .local v2, "tempContexts":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;>;"
    iget-object v3, p0, Lio/sentry/event/EventBuilder;->event:Lio/sentry/event/Event;

    invoke-virtual {v3}, Lio/sentry/event/Event;->getContexts()Ljava/util/Map;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 112
    .local v0, "contextEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map;

    invoke-static {v3}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v3

    invoke-interface {v2, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 114
    .end local v0    # "contextEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;>;"
    :cond_0
    iget-object v3, p0, Lio/sentry/event/EventBuilder;->event:Lio/sentry/event/Event;

    invoke-static {v2}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v4

    invoke-virtual {v3, v4}, Lio/sentry/event/Event;->setContexts(Ljava/util/Map;)V

    .line 117
    iget-object v3, p0, Lio/sentry/event/EventBuilder;->event:Lio/sentry/event/Event;

    iget-object v4, p0, Lio/sentry/event/EventBuilder;->event:Lio/sentry/event/Event;

    invoke-virtual {v4}, Lio/sentry/event/Event;->getExtra()Ljava/util/Map;

    move-result-object v4

    invoke-static {v4}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v4

    invoke-virtual {v3, v4}, Lio/sentry/event/Event;->setExtra(Ljava/util/Map;)V

    .line 120
    iget-object v3, p0, Lio/sentry/event/EventBuilder;->event:Lio/sentry/event/Event;

    iget-object v4, p0, Lio/sentry/event/EventBuilder;->event:Lio/sentry/event/Event;

    invoke-virtual {v4}, Lio/sentry/event/Event;->getSentryInterfaces()Ljava/util/Map;

    move-result-object v4

    invoke-static {v4}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v4

    invoke-virtual {v3, v4}, Lio/sentry/event/Event;->setSentryInterfaces(Ljava/util/Map;)V

    .line 121
    return-void
.end method


# virtual methods
.method public declared-synchronized build()Lio/sentry/event/Event;
    .locals 2

    .prologue
    .line 419
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lio/sentry/event/EventBuilder;->alreadyBuilt:Z

    if-eqz v0, :cond_0

    .line 420
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "A message can\'t be built twice"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 419
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 423
    :cond_0
    :try_start_1
    invoke-direct {p0}, Lio/sentry/event/EventBuilder;->autoSetMissingValues()V

    .line 424
    invoke-direct {p0}, Lio/sentry/event/EventBuilder;->makeImmutable()V

    .line 427
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/sentry/event/EventBuilder;->alreadyBuilt:Z

    .line 428
    iget-object v0, p0, Lio/sentry/event/EventBuilder;->event:Lio/sentry/event/Event;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-object v0
.end method

.method public getEvent()Lio/sentry/event/Event;
    .locals 1

    .prologue
    .line 432
    iget-object v0, p0, Lio/sentry/event/EventBuilder;->event:Lio/sentry/event/Event;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 437
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "EventBuilder{event="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lio/sentry/event/EventBuilder;->event:Lio/sentry/event/Event;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", alreadyBuilt="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lio/sentry/event/EventBuilder;->alreadyBuilt:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public withBreadcrumbs(Ljava/util/List;)Lio/sentry/event/EventBuilder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lio/sentry/event/Breadcrumb;",
            ">;)",
            "Lio/sentry/event/EventBuilder;"
        }
    .end annotation

    .prologue
    .line 295
    .local p1, "breadcrumbs":Ljava/util/List;, "Ljava/util/List<Lio/sentry/event/Breadcrumb;>;"
    iget-object v0, p0, Lio/sentry/event/EventBuilder;->event:Lio/sentry/event/Event;

    invoke-virtual {v0, p1}, Lio/sentry/event/Event;->setBreadcrumbs(Ljava/util/List;)V

    .line 296
    return-object p0
.end method

.method public withChecksum(Ljava/lang/String;)Lio/sentry/event/EventBuilder;
    .locals 1
    .param p1, "checksum"    # Ljava/lang/String;

    .prologue
    .line 376
    iget-object v0, p0, Lio/sentry/event/EventBuilder;->event:Lio/sentry/event/Event;

    invoke-virtual {v0, p1}, Lio/sentry/event/Event;->setChecksum(Ljava/lang/String;)V

    .line 377
    return-object p0
.end method

.method public withChecksumFor(Ljava/lang/String;)Lio/sentry/event/EventBuilder;
    .locals 1
    .param p1, "contentToChecksum"    # Ljava/lang/String;

    .prologue
    .line 364
    invoke-static {p1}, Lio/sentry/event/EventBuilder;->calculateChecksum(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lio/sentry/event/EventBuilder;->withChecksum(Ljava/lang/String;)Lio/sentry/event/EventBuilder;

    move-result-object v0

    return-object v0
.end method

.method public withContexts(Ljava/util/Map;)Lio/sentry/event/EventBuilder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;)",
            "Lio/sentry/event/EventBuilder;"
        }
    .end annotation

    .prologue
    .line 306
    .local p1, "contexts":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;>;"
    iget-object v0, p0, Lio/sentry/event/EventBuilder;->event:Lio/sentry/event/Event;

    invoke-virtual {v0, p1}, Lio/sentry/event/Event;->setContexts(Ljava/util/Map;)V

    .line 307
    return-object p0
.end method

.method public withCulprit(Lio/sentry/event/interfaces/SentryStackTraceElement;)Lio/sentry/event/EventBuilder;
    .locals 4
    .param p1, "frame"    # Lio/sentry/event/interfaces/SentryStackTraceElement;

    .prologue
    .line 229
    invoke-virtual {p1}, Lio/sentry/event/interfaces/SentryStackTraceElement;->getModule()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lio/sentry/event/interfaces/SentryStackTraceElement;->getFunction()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lio/sentry/event/interfaces/SentryStackTraceElement;->getFileName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Lio/sentry/event/interfaces/SentryStackTraceElement;->getLineno()I

    move-result v3

    invoke-direct {p0, v0, v1, v2, v3}, Lio/sentry/event/EventBuilder;->buildCulpritString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lio/sentry/event/EventBuilder;->withCulprit(Ljava/lang/String;)Lio/sentry/event/EventBuilder;

    move-result-object v0

    return-object v0
.end method

.method public withCulprit(Ljava/lang/StackTraceElement;)Lio/sentry/event/EventBuilder;
    .locals 4
    .param p1, "frame"    # Ljava/lang/StackTraceElement;

    .prologue
    .line 241
    invoke-virtual {p1}, Ljava/lang/StackTraceElement;->getClassName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/StackTraceElement;->getMethodName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/StackTraceElement;->getFileName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/StackTraceElement;->getLineNumber()I

    move-result v3

    invoke-direct {p0, v0, v1, v2, v3}, Lio/sentry/event/EventBuilder;->buildCulpritString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lio/sentry/event/EventBuilder;->withCulprit(Ljava/lang/String;)Lio/sentry/event/EventBuilder;

    move-result-object v0

    return-object v0
.end method

.method public withCulprit(Ljava/lang/String;)Lio/sentry/event/EventBuilder;
    .locals 1
    .param p1, "culprit"    # Ljava/lang/String;

    .prologue
    .line 270
    iget-object v0, p0, Lio/sentry/event/EventBuilder;->event:Lio/sentry/event/Event;

    invoke-virtual {v0, p1}, Lio/sentry/event/Event;->setCulprit(Ljava/lang/String;)V

    .line 271
    return-object p0
.end method

.method public withDist(Ljava/lang/String;)Lio/sentry/event/EventBuilder;
    .locals 1
    .param p1, "dist"    # Ljava/lang/String;

    .prologue
    .line 174
    iget-object v0, p0, Lio/sentry/event/EventBuilder;->event:Lio/sentry/event/Event;

    invoke-virtual {v0, p1}, Lio/sentry/event/Event;->setDist(Ljava/lang/String;)V

    .line 175
    return-object p0
.end method

.method public withEnvironment(Ljava/lang/String;)Lio/sentry/event/EventBuilder;
    .locals 1
    .param p1, "environment"    # Ljava/lang/String;

    .prologue
    .line 185
    iget-object v0, p0, Lio/sentry/event/EventBuilder;->event:Lio/sentry/event/Event;

    invoke-virtual {v0, p1}, Lio/sentry/event/Event;->setEnvironment(Ljava/lang/String;)V

    .line 186
    return-object p0
.end method

.method public withExtra(Ljava/lang/String;Ljava/lang/Object;)Lio/sentry/event/EventBuilder;
    .locals 1
    .param p1, "extraName"    # Ljava/lang/String;
    .param p2, "extraValue"    # Ljava/lang/Object;

    .prologue
    .line 329
    iget-object v0, p0, Lio/sentry/event/EventBuilder;->event:Lio/sentry/event/Event;

    invoke-virtual {v0}, Lio/sentry/event/Event;->getExtra()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 330
    return-object p0
.end method

.method public withFingerprint(Ljava/util/List;)Lio/sentry/event/EventBuilder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Lio/sentry/event/EventBuilder;"
        }
    .end annotation

    .prologue
    .line 353
    .local p1, "fingerprint":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    iget-object v0, p0, Lio/sentry/event/EventBuilder;->event:Lio/sentry/event/Event;

    invoke-virtual {v0, p1}, Lio/sentry/event/Event;->setFingerprint(Ljava/util/List;)V

    .line 354
    return-object p0
.end method

.method public varargs withFingerprint([Ljava/lang/String;)Lio/sentry/event/EventBuilder;
    .locals 2
    .param p1, "fingerprint"    # [Ljava/lang/String;

    .prologue
    .line 340
    new-instance v0, Ljava/util/ArrayList;

    array-length v1, p1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 341
    .local v0, "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-static {v0, p1}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    .line 342
    iget-object v1, p0, Lio/sentry/event/EventBuilder;->event:Lio/sentry/event/Event;

    invoke-virtual {v1, v0}, Lio/sentry/event/Event;->setFingerprint(Ljava/util/List;)V

    .line 343
    return-object p0
.end method

.method public withLevel(Lio/sentry/event/Event$Level;)Lio/sentry/event/EventBuilder;
    .locals 1
    .param p1, "level"    # Lio/sentry/event/Event$Level;

    .prologue
    .line 152
    iget-object v0, p0, Lio/sentry/event/EventBuilder;->event:Lio/sentry/event/Event;

    invoke-virtual {v0, p1}, Lio/sentry/event/Event;->setLevel(Lio/sentry/event/Event$Level;)V

    .line 153
    return-object p0
.end method

.method public withLogger(Ljava/lang/String;)Lio/sentry/event/EventBuilder;
    .locals 1
    .param p1, "logger"    # Ljava/lang/String;

    .prologue
    .line 196
    iget-object v0, p0, Lio/sentry/event/EventBuilder;->event:Lio/sentry/event/Event;

    invoke-virtual {v0, p1}, Lio/sentry/event/Event;->setLogger(Ljava/lang/String;)V

    .line 197
    return-object p0
.end method

.method public withMessage(Ljava/lang/String;)Lio/sentry/event/EventBuilder;
    .locals 1
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 130
    iget-object v0, p0, Lio/sentry/event/EventBuilder;->event:Lio/sentry/event/Event;

    invoke-virtual {v0, p1}, Lio/sentry/event/Event;->setMessage(Ljava/lang/String;)V

    .line 131
    return-object p0
.end method

.method public withPlatform(Ljava/lang/String;)Lio/sentry/event/EventBuilder;
    .locals 1
    .param p1, "platform"    # Ljava/lang/String;

    .prologue
    .line 207
    iget-object v0, p0, Lio/sentry/event/EventBuilder;->event:Lio/sentry/event/Event;

    invoke-virtual {v0, p1}, Lio/sentry/event/Event;->setPlatform(Ljava/lang/String;)V

    .line 208
    return-object p0
.end method

.method public withRelease(Ljava/lang/String;)Lio/sentry/event/EventBuilder;
    .locals 1
    .param p1, "release"    # Ljava/lang/String;

    .prologue
    .line 163
    iget-object v0, p0, Lio/sentry/event/EventBuilder;->event:Lio/sentry/event/Event;

    invoke-virtual {v0, p1}, Lio/sentry/event/Event;->setRelease(Ljava/lang/String;)V

    .line 164
    return-object p0
.end method

.method public withSdkIntegration(Ljava/lang/String;)Lio/sentry/event/EventBuilder;
    .locals 1
    .param p1, "integration"    # Ljava/lang/String;

    .prologue
    .line 218
    iget-object v0, p0, Lio/sentry/event/EventBuilder;->sdkIntegrations:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 219
    return-object p0
.end method

.method public withSentryInterface(Lio/sentry/event/interfaces/SentryInterface;)Lio/sentry/event/EventBuilder;
    .locals 1
    .param p1, "sentryInterface"    # Lio/sentry/event/interfaces/SentryInterface;

    .prologue
    .line 390
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lio/sentry/event/EventBuilder;->withSentryInterface(Lio/sentry/event/interfaces/SentryInterface;Z)Lio/sentry/event/EventBuilder;

    move-result-object v0

    return-object v0
.end method

.method public withSentryInterface(Lio/sentry/event/interfaces/SentryInterface;Z)Lio/sentry/event/EventBuilder;
    .locals 2
    .param p1, "sentryInterface"    # Lio/sentry/event/interfaces/SentryInterface;
    .param p2, "replace"    # Z

    .prologue
    .line 405
    if-nez p2, :cond_0

    iget-object v0, p0, Lio/sentry/event/EventBuilder;->event:Lio/sentry/event/Event;

    invoke-virtual {v0}, Lio/sentry/event/Event;->getSentryInterfaces()Ljava/util/Map;

    move-result-object v0

    invoke-interface {p1}, Lio/sentry/event/interfaces/SentryInterface;->getInterfaceName()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 406
    :cond_0
    iget-object v0, p0, Lio/sentry/event/EventBuilder;->event:Lio/sentry/event/Event;

    invoke-virtual {v0}, Lio/sentry/event/Event;->getSentryInterfaces()Ljava/util/Map;

    move-result-object v0

    invoke-interface {p1}, Lio/sentry/event/interfaces/SentryInterface;->getInterfaceName()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 408
    :cond_1
    return-object p0
.end method

.method public withServerName(Ljava/lang/String;)Lio/sentry/event/EventBuilder;
    .locals 1
    .param p1, "serverName"    # Ljava/lang/String;

    .prologue
    .line 317
    iget-object v0, p0, Lio/sentry/event/EventBuilder;->event:Lio/sentry/event/Event;

    invoke-virtual {v0, p1}, Lio/sentry/event/Event;->setServerName(Ljava/lang/String;)V

    .line 318
    return-object p0
.end method

.method public withTag(Ljava/lang/String;Ljava/lang/String;)Lio/sentry/event/EventBuilder;
    .locals 1
    .param p1, "tagKey"    # Ljava/lang/String;
    .param p2, "tagValue"    # Ljava/lang/String;

    .prologue
    .line 284
    iget-object v0, p0, Lio/sentry/event/EventBuilder;->event:Lio/sentry/event/Event;

    invoke-virtual {v0}, Lio/sentry/event/Event;->getTags()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 285
    return-object p0
.end method

.method public withTimestamp(Ljava/util/Date;)Lio/sentry/event/EventBuilder;
    .locals 1
    .param p1, "timestamp"    # Ljava/util/Date;

    .prologue
    .line 141
    iget-object v0, p0, Lio/sentry/event/EventBuilder;->event:Lio/sentry/event/Event;

    invoke-virtual {v0, p1}, Lio/sentry/event/Event;->setTimestamp(Ljava/util/Date;)V

    .line 142
    return-object p0
.end method
