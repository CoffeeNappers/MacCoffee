.class public final Lio/sentry/config/JndiLookup;
.super Ljava/lang/Object;
.source "JndiLookup.java"


# static fields
.field private static final JNDI_PREFIX:Ljava/lang/String; = "java:comp/env/sentry/"

.field private static final logger:Lorg/slf4j/Logger;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 19
    const-class v0, Lio/sentry/config/JndiLookup;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    sput-object v0, Lio/sentry/config/JndiLookup;->logger:Lorg/slf4j/Logger;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    return-void
.end method

.method public static jndiLookup(Ljava/lang/String;)Ljava/lang/String;
    .locals 7
    .param p0, "key"    # Ljava/lang/String;

    .prologue
    .line 32
    const/4 v3, 0x0

    .line 34
    .local v3, "value":Ljava/lang/String;
    :try_start_0
    new-instance v1, Ljavax/naming/InitialContext;

    invoke-direct {v1}, Ljavax/naming/InitialContext;-><init>()V

    .line 35
    .local v1, "c":Ljavax/naming/Context;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "java:comp/env/sentry/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v1, v4}, Ljavax/naming/Context;->lookup(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    move-object v0, v4

    check-cast v0, Ljava/lang/String;

    move-object v3, v0
    :try_end_0
    .catch Ljavax/naming/NoInitialContextException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljavax/naming/NamingException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_2

    .line 43
    .end local v1    # "c":Ljavax/naming/Context;
    :goto_0
    return-object v3

    .line 36
    :catch_0
    move-exception v2

    .line 37
    .local v2, "e":Ljavax/naming/NoInitialContextException;
    sget-object v4, Lio/sentry/config/JndiLookup;->logger:Lorg/slf4j/Logger;

    const-string/jumbo v5, "JNDI not configured for Sentry (NoInitialContextEx)"

    invoke-interface {v4, v5}, Lorg/slf4j/Logger;->trace(Ljava/lang/String;)V

    goto :goto_0

    .line 38
    .end local v2    # "e":Ljavax/naming/NoInitialContextException;
    :catch_1
    move-exception v2

    .line 39
    .local v2, "e":Ljavax/naming/NamingException;
    sget-object v4, Lio/sentry/config/JndiLookup;->logger:Lorg/slf4j/Logger;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "No /sentry/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, " in JNDI"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Lorg/slf4j/Logger;->trace(Ljava/lang/String;)V

    goto :goto_0

    .line 40
    .end local v2    # "e":Ljavax/naming/NamingException;
    :catch_2
    move-exception v2

    .line 41
    .local v2, "e":Ljava/lang/RuntimeException;
    sget-object v4, Lio/sentry/config/JndiLookup;->logger:Lorg/slf4j/Logger;

    const-string/jumbo v5, "Odd RuntimeException while testing for JNDI"

    invoke-interface {v4, v5, v2}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method
