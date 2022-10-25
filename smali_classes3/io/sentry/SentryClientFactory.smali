.class public abstract Lio/sentry/SentryClientFactory;
.super Ljava/lang/Object;
.source "SentryClientFactory.java"


# static fields
.field private static final logger:Lorg/slf4j/Logger;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 13
    const-class v0, Lio/sentry/SentryClientFactory;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    sput-object v0, Lio/sentry/SentryClientFactory;->logger:Lorg/slf4j/Logger;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static resolveDsn(Ljava/lang/String;)Lio/sentry/dsn/Dsn;
    .locals 2
    .param p0, "dsn"    # Ljava/lang/String;

    .prologue
    .line 60
    invoke-static {p0}, Lio/sentry/util/Util;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 61
    new-instance v0, Lio/sentry/dsn/Dsn;

    invoke-direct {v0, p0}, Lio/sentry/dsn/Dsn;-><init>(Ljava/lang/String;)V

    .line 65
    .local v0, "realDsn":Lio/sentry/dsn/Dsn;
    :goto_0
    return-object v0

    .line 63
    .end local v0    # "realDsn":Lio/sentry/dsn/Dsn;
    :cond_0
    new-instance v0, Lio/sentry/dsn/Dsn;

    invoke-static {}, Lio/sentry/dsn/Dsn;->dsnLookup()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lio/sentry/dsn/Dsn;-><init>(Ljava/lang/String;)V

    .restart local v0    # "realDsn":Lio/sentry/dsn/Dsn;
    goto :goto_0
.end method

.method public static sentryClient(Ljava/lang/String;)Lio/sentry/SentryClient;
    .locals 1
    .param p0, "dsn"    # Ljava/lang/String;

    .prologue
    .line 22
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lio/sentry/SentryClientFactory;->sentryClient(Ljava/lang/String;Lio/sentry/SentryClientFactory;)Lio/sentry/SentryClient;

    move-result-object v0

    return-object v0
.end method

.method public static sentryClient(Ljava/lang/String;Lio/sentry/SentryClientFactory;)Lio/sentry/SentryClient;
    .locals 8
    .param p0, "dsn"    # Ljava/lang/String;
    .param p1, "sentryClientFactory"    # Lio/sentry/SentryClientFactory;

    .prologue
    .line 33
    invoke-static {p0}, Lio/sentry/SentryClientFactory;->resolveDsn(Ljava/lang/String;)Lio/sentry/dsn/Dsn;

    move-result-object v3

    .line 36
    .local v3, "realDsn":Lio/sentry/dsn/Dsn;
    if-nez p1, :cond_0

    .line 37
    const-string/jumbo v5, "factory"

    invoke-static {v5, v3}, Lio/sentry/config/Lookup;->lookup(Ljava/lang/String;Lio/sentry/dsn/Dsn;)Ljava/lang/String;

    move-result-object v4

    .line 38
    .local v4, "sentryClientFactoryName":Ljava/lang/String;
    invoke-static {v4}, Lio/sentry/util/Util;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 40
    new-instance p1, Lio/sentry/DefaultSentryClientFactory;

    .end local p1    # "sentryClientFactory":Lio/sentry/SentryClientFactory;
    invoke-direct {p1}, Lio/sentry/DefaultSentryClientFactory;-><init>()V

    .line 55
    .end local v4    # "sentryClientFactoryName":Ljava/lang/String;
    .restart local p1    # "sentryClientFactory":Lio/sentry/SentryClientFactory;
    :cond_0
    :goto_0
    invoke-virtual {p1, v3}, Lio/sentry/SentryClientFactory;->createSentryClient(Lio/sentry/dsn/Dsn;)Lio/sentry/SentryClient;

    move-result-object v5

    :goto_1
    return-object v5

    .line 43
    .restart local v4    # "sentryClientFactoryName":Ljava/lang/String;
    :cond_1
    const/4 v2, 0x0

    .line 45
    .local v2, "factoryClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lio/sentry/SentryClientFactory;>;"
    :try_start_0
    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    .line 46
    invoke-virtual {v2}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v5

    move-object v0, v5

    check-cast v0, Lio/sentry/SentryClientFactory;

    move-object p1, v0
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_0

    .line 47
    :catch_0
    move-exception v1

    .line 48
    .local v1, "e":Ljava/lang/ReflectiveOperationException;
    :goto_2
    sget-object v5, Lio/sentry/SentryClientFactory;->logger:Lorg/slf4j/Logger;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "Error creating SentryClient using factory class: \'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, "\'."

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6, v1}, Lorg/slf4j/Logger;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 50
    const/4 v5, 0x0

    goto :goto_1

    .line 47
    .end local v1    # "e":Ljava/lang/ReflectiveOperationException;
    :catch_1
    move-exception v1

    goto :goto_2

    :catch_2
    move-exception v1

    goto :goto_2
.end method


# virtual methods
.method public abstract createSentryClient(Lio/sentry/dsn/Dsn;)Lio/sentry/SentryClient;
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 79
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "SentryClientFactory{name=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x27

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
