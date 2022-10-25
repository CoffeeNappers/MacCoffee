.class public Lio/sentry/jul/SentryHandler;
.super Ljava/util/logging/Handler;
.source "SentryHandler.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/sentry/jul/SentryHandler$1;,
        Lio/sentry/jul/SentryHandler$DropSentryFilter;
    }
.end annotation


# static fields
.field public static final THREAD_ID:Ljava/lang/String; = "Sentry-ThreadId"


# instance fields
.field protected printfStyle:Z


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/util/logging/Handler;-><init>()V

    .line 37
    invoke-virtual {p0}, Lio/sentry/jul/SentryHandler;->retrieveProperties()V

    .line 38
    new-instance v0, Lio/sentry/jul/SentryHandler$DropSentryFilter;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lio/sentry/jul/SentryHandler$DropSentryFilter;-><init>(Lio/sentry/jul/SentryHandler;Lio/sentry/jul/SentryHandler$1;)V

    invoke-virtual {p0, v0}, Lio/sentry/jul/SentryHandler;->setFilter(Ljava/util/logging/Filter;)V

    .line 39
    return-void
.end method

.method protected static formatMessageParameters([Ljava/lang/Object;)Ljava/util/List;
    .locals 6
    .param p0, "parameters"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/Object;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 70
    new-instance v1, Ljava/util/ArrayList;

    array-length v5, p0

    invoke-direct {v1, v5}, Ljava/util/ArrayList;-><init>(I)V

    .line 71
    .local v1, "formattedParameters":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    move-object v0, p0

    .local v0, "arr$":[Ljava/lang/Object;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_0
    if-ge v2, v3, :cond_1

    aget-object v4, v0, v2

    .line 72
    .local v4, "parameter":Ljava/lang/Object;
    if-eqz v4, :cond_0

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    :goto_1
    invoke-interface {v1, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 71
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 72
    :cond_0
    const/4 v5, 0x0

    goto :goto_1

    .line 74
    .end local v4    # "parameter":Ljava/lang/Object;
    :cond_1
    return-object v1
.end method

.method protected static getLevel(Ljava/util/logging/Level;)Lio/sentry/event/Event$Level;
    .locals 2
    .param p0, "level"    # Ljava/util/logging/Level;

    .prologue
    .line 48
    invoke-virtual {p0}, Ljava/util/logging/Level;->intValue()I

    move-result v0

    sget-object v1, Ljava/util/logging/Level;->SEVERE:Ljava/util/logging/Level;

    invoke-virtual {v1}, Ljava/util/logging/Level;->intValue()I

    move-result v1

    if-lt v0, v1, :cond_0

    .line 49
    sget-object v0, Lio/sentry/event/Event$Level;->ERROR:Lio/sentry/event/Event$Level;

    .line 57
    :goto_0
    return-object v0

    .line 50
    :cond_0
    invoke-virtual {p0}, Ljava/util/logging/Level;->intValue()I

    move-result v0

    sget-object v1, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    invoke-virtual {v1}, Ljava/util/logging/Level;->intValue()I

    move-result v1

    if-lt v0, v1, :cond_1

    .line 51
    sget-object v0, Lio/sentry/event/Event$Level;->WARNING:Lio/sentry/event/Event$Level;

    goto :goto_0

    .line 52
    :cond_1
    invoke-virtual {p0}, Ljava/util/logging/Level;->intValue()I

    move-result v0

    sget-object v1, Ljava/util/logging/Level;->INFO:Ljava/util/logging/Level;

    invoke-virtual {v1}, Ljava/util/logging/Level;->intValue()I

    move-result v1

    if-lt v0, v1, :cond_2

    .line 53
    sget-object v0, Lio/sentry/event/Event$Level;->INFO:Lio/sentry/event/Event$Level;

    goto :goto_0

    .line 54
    :cond_2
    invoke-virtual {p0}, Ljava/util/logging/Level;->intValue()I

    move-result v0

    sget-object v1, Ljava/util/logging/Level;->ALL:Ljava/util/logging/Level;

    invoke-virtual {v1}, Ljava/util/logging/Level;->intValue()I

    move-result v1

    if-lt v0, v1, :cond_3

    .line 55
    sget-object v0, Lio/sentry/event/Event$Level;->DEBUG:Lio/sentry/event/Event$Level;

    goto :goto_0

    .line 57
    :cond_3
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public close()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/SecurityException;
        }
    .end annotation

    .prologue
    .line 192
    invoke-static {}, Lio/sentry/environment/SentryEnvironment;->startManagingThread()V

    .line 194
    :try_start_0
    invoke-static {}, Lio/sentry/Sentry;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 198
    invoke-static {}, Lio/sentry/environment/SentryEnvironment;->stopManagingThread()V

    .line 200
    :goto_0
    return-void

    .line 195
    :catch_0
    move-exception v0

    .line 196
    .local v0, "e":Ljava/lang/Exception;
    :try_start_1
    const-string/jumbo v1, "An exception occurred while closing the Sentry connection"

    const/4 v2, 0x3

    invoke-virtual {p0, v1, v0, v2}, Lio/sentry/jul/SentryHandler;->reportError(Ljava/lang/String;Ljava/lang/Exception;I)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 198
    invoke-static {}, Lio/sentry/environment/SentryEnvironment;->stopManagingThread()V

    goto :goto_0

    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v1

    invoke-static {}, Lio/sentry/environment/SentryEnvironment;->stopManagingThread()V

    throw v1
.end method

.method protected createEventBuilder(Ljava/util/logging/LogRecord;)Lio/sentry/event/EventBuilder;
    .locals 18
    .param p1, "record"    # Ljava/util/logging/LogRecord;

    .prologue
    .line 111
    new-instance v13, Lio/sentry/event/EventBuilder;

    invoke-direct {v13}, Lio/sentry/event/EventBuilder;-><init>()V

    const-string/jumbo v14, "java.util.logging"

    invoke-virtual {v13, v14}, Lio/sentry/event/EventBuilder;->withSdkIntegration(Ljava/lang/String;)Lio/sentry/event/EventBuilder;

    move-result-object v13

    invoke-virtual/range {p1 .. p1}, Ljava/util/logging/LogRecord;->getLevel()Ljava/util/logging/Level;

    move-result-object v14

    invoke-static {v14}, Lio/sentry/jul/SentryHandler;->getLevel(Ljava/util/logging/Level;)Lio/sentry/event/Event$Level;

    move-result-object v14

    invoke-virtual {v13, v14}, Lio/sentry/event/EventBuilder;->withLevel(Lio/sentry/event/Event$Level;)Lio/sentry/event/EventBuilder;

    move-result-object v13

    new-instance v14, Ljava/util/Date;

    invoke-virtual/range {p1 .. p1}, Ljava/util/logging/LogRecord;->getMillis()J

    move-result-wide v16

    move-wide/from16 v0, v16

    invoke-direct {v14, v0, v1}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v13, v14}, Lio/sentry/event/EventBuilder;->withTimestamp(Ljava/util/Date;)Lio/sentry/event/EventBuilder;

    move-result-object v13

    invoke-virtual/range {p1 .. p1}, Ljava/util/logging/LogRecord;->getLoggerName()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Lio/sentry/event/EventBuilder;->withLogger(Ljava/lang/String;)Lio/sentry/event/EventBuilder;

    move-result-object v3

    .line 117
    .local v3, "eventBuilder":Lio/sentry/event/EventBuilder;
    invoke-virtual/range {p1 .. p1}, Ljava/util/logging/LogRecord;->getMessage()Ljava/lang/String;

    move-result-object v9

    .line 118
    .local v9, "message":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Ljava/util/logging/LogRecord;->getResourceBundle()Ljava/util/ResourceBundle;

    move-result-object v13

    if-eqz v13, :cond_0

    invoke-virtual/range {p1 .. p1}, Ljava/util/logging/LogRecord;->getResourceBundle()Ljava/util/ResourceBundle;

    move-result-object v13

    invoke-virtual/range {p1 .. p1}, Ljava/util/logging/LogRecord;->getMessage()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/util/ResourceBundle;->containsKey(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_0

    .line 119
    invoke-virtual/range {p1 .. p1}, Ljava/util/logging/LogRecord;->getResourceBundle()Ljava/util/ResourceBundle;

    move-result-object v13

    invoke-virtual/range {p1 .. p1}, Ljava/util/logging/LogRecord;->getMessage()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/util/ResourceBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 122
    :cond_0
    move-object v12, v9

    .line 123
    .local v12, "topLevelMessage":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Ljava/util/logging/LogRecord;->getParameters()[Ljava/lang/Object;

    move-result-object v13

    if-nez v13, :cond_2

    .line 124
    new-instance v13, Lio/sentry/event/interfaces/MessageInterface;

    invoke-direct {v13, v9}, Lio/sentry/event/interfaces/MessageInterface;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v13}, Lio/sentry/event/EventBuilder;->withSentryInterface(Lio/sentry/event/interfaces/SentryInterface;)Lio/sentry/event/EventBuilder;

    .line 137
    :goto_0
    invoke-virtual {v3, v12}, Lio/sentry/event/EventBuilder;->withMessage(Ljava/lang/String;)Lio/sentry/event/EventBuilder;

    .line 139
    invoke-virtual/range {p1 .. p1}, Ljava/util/logging/LogRecord;->getThrown()Ljava/lang/Throwable;

    move-result-object v11

    .line 140
    .local v11, "throwable":Ljava/lang/Throwable;
    if-eqz v11, :cond_1

    .line 141
    new-instance v13, Lio/sentry/event/interfaces/ExceptionInterface;

    invoke-direct {v13, v11}, Lio/sentry/event/interfaces/ExceptionInterface;-><init>(Ljava/lang/Throwable;)V

    invoke-virtual {v3, v13}, Lio/sentry/event/EventBuilder;->withSentryInterface(Lio/sentry/event/interfaces/SentryInterface;)Lio/sentry/event/EventBuilder;

    .line 144
    :cond_1
    invoke-virtual/range {p1 .. p1}, Ljava/util/logging/LogRecord;->getSourceClassName()Ljava/lang/String;

    move-result-object v13

    if-eqz v13, :cond_3

    invoke-virtual/range {p1 .. p1}, Ljava/util/logging/LogRecord;->getSourceMethodName()Ljava/lang/String;

    move-result-object v13

    if-eqz v13, :cond_3

    .line 145
    new-instance v4, Ljava/lang/StackTraceElement;

    invoke-virtual/range {p1 .. p1}, Ljava/util/logging/LogRecord;->getSourceClassName()Ljava/lang/String;

    move-result-object v13

    invoke-virtual/range {p1 .. p1}, Ljava/util/logging/LogRecord;->getSourceMethodName()Ljava/lang/String;

    move-result-object v14

    const/4 v15, 0x0

    const/16 v16, -0x1

    move/from16 v0, v16

    invoke-direct {v4, v13, v14, v15, v0}, Ljava/lang/StackTraceElement;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    .line 147
    .local v4, "fakeFrame":Ljava/lang/StackTraceElement;
    invoke-virtual {v3, v4}, Lio/sentry/event/EventBuilder;->withCulprit(Ljava/lang/StackTraceElement;)Lio/sentry/event/EventBuilder;

    .line 152
    .end local v4    # "fakeFrame":Ljava/lang/StackTraceElement;
    :goto_1
    invoke-static {}, Lorg/slf4j/MDC;->getMDCAdapter()Lorg/slf4j/spi/MDCAdapter;

    move-result-object v13

    invoke-interface {v13}, Lorg/slf4j/spi/MDCAdapter;->getCopyOfContextMap()Ljava/util/Map;

    move-result-object v7

    .line 153
    .local v7, "mdc":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    if-eqz v7, :cond_5

    .line 154
    invoke-interface {v7}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v13

    invoke-interface {v13}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .local v6, "i$":Ljava/util/Iterator;
    :goto_2
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_5

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/util/Map$Entry;

    .line 155
    .local v8, "mdcEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-static {}, Lio/sentry/Sentry;->getStoredClient()Lio/sentry/SentryClient;

    move-result-object v13

    invoke-virtual {v13}, Lio/sentry/SentryClient;->getExtraTags()Ljava/util/Set;

    move-result-object v13

    invoke-interface {v8}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v14

    invoke-interface {v13, v14}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_4

    .line 156
    invoke-interface {v8}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/String;

    invoke-interface {v8}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/lang/String;

    invoke-virtual {v3, v13, v14}, Lio/sentry/event/EventBuilder;->withTag(Ljava/lang/String;Ljava/lang/String;)Lio/sentry/event/EventBuilder;

    goto :goto_2

    .line 127
    .end local v6    # "i$":Ljava/util/Iterator;
    .end local v7    # "mdc":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v8    # "mdcEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v11    # "throwable":Ljava/lang/Throwable;
    :cond_2
    invoke-virtual/range {p1 .. p1}, Ljava/util/logging/LogRecord;->getParameters()[Ljava/lang/Object;

    move-result-object v13

    invoke-static {v13}, Lio/sentry/jul/SentryHandler;->formatMessageParameters([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v10

    .line 129
    .local v10, "parameters":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :try_start_0
    invoke-virtual/range {p1 .. p1}, Ljava/util/logging/LogRecord;->getParameters()[Ljava/lang/Object;

    move-result-object v13

    move-object/from16 v0, p0

    invoke-virtual {v0, v9, v13}, Lio/sentry/jul/SentryHandler;->formatMessage(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v5

    .line 130
    .local v5, "formatted":Ljava/lang/String;
    move-object v12, v5

    .line 135
    :goto_3
    new-instance v13, Lio/sentry/event/interfaces/MessageInterface;

    invoke-direct {v13, v9, v10, v5}, Lio/sentry/event/interfaces/MessageInterface;-><init>(Ljava/lang/String;Ljava/util/List;Ljava/lang/String;)V

    invoke-virtual {v3, v13}, Lio/sentry/event/EventBuilder;->withSentryInterface(Lio/sentry/event/interfaces/SentryInterface;)Lio/sentry/event/EventBuilder;

    goto/16 :goto_0

    .line 131
    .end local v5    # "formatted":Ljava/lang/String;
    :catch_0
    move-exception v2

    .line 133
    .local v2, "e":Ljava/lang/Exception;
    const/4 v5, 0x0

    .restart local v5    # "formatted":Ljava/lang/String;
    goto :goto_3

    .line 149
    .end local v2    # "e":Ljava/lang/Exception;
    .end local v5    # "formatted":Ljava/lang/String;
    .end local v10    # "parameters":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .restart local v11    # "throwable":Ljava/lang/Throwable;
    :cond_3
    invoke-virtual/range {p1 .. p1}, Ljava/util/logging/LogRecord;->getLoggerName()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v3, v13}, Lio/sentry/event/EventBuilder;->withCulprit(Ljava/lang/String;)Lio/sentry/event/EventBuilder;

    goto :goto_1

    .line 158
    .restart local v6    # "i$":Ljava/util/Iterator;
    .restart local v7    # "mdc":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v8    # "mdcEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_4
    invoke-interface {v8}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/String;

    invoke-interface {v8}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v14

    invoke-virtual {v3, v13, v14}, Lio/sentry/event/EventBuilder;->withExtra(Ljava/lang/String;Ljava/lang/Object;)Lio/sentry/event/EventBuilder;

    goto :goto_2

    .line 163
    .end local v6    # "i$":Ljava/util/Iterator;
    .end local v8    # "mdcEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_5
    const-string/jumbo v13, "Sentry-ThreadId"

    invoke-virtual/range {p1 .. p1}, Ljava/util/logging/LogRecord;->getThreadID()I

    move-result v14

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    invoke-virtual {v3, v13, v14}, Lio/sentry/event/EventBuilder;->withExtra(Ljava/lang/String;Ljava/lang/Object;)Lio/sentry/event/EventBuilder;

    .line 165
    return-object v3
.end method

.method public flush()V
    .locals 0

    .prologue
    .line 188
    return-void
.end method

.method protected formatMessage(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    .locals 2
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "parameters"    # [Ljava/lang/Object;

    .prologue
    .line 178
    iget-boolean v1, p0, Lio/sentry/jul/SentryHandler;->printfStyle:Z

    if-eqz v1, :cond_0

    .line 179
    invoke-static {p1, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 183
    .local v0, "formatted":Ljava/lang/String;
    :goto_0
    return-object v0

    .line 181
    .end local v0    # "formatted":Ljava/lang/String;
    :cond_0
    invoke-static {p1, p2}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .restart local v0    # "formatted":Ljava/lang/String;
    goto :goto_0
.end method

.method public publish(Ljava/util/logging/LogRecord;)V
    .locals 4
    .param p1, "record"    # Ljava/util/logging/LogRecord;

    .prologue
    .line 89
    invoke-virtual {p0, p1}, Lio/sentry/jul/SentryHandler;->isLoggable(Ljava/util/logging/LogRecord;)Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-static {}, Lio/sentry/environment/SentryEnvironment;->isManagingThread()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 102
    :cond_0
    :goto_0
    return-void

    .line 93
    :cond_1
    invoke-static {}, Lio/sentry/environment/SentryEnvironment;->startManagingThread()V

    .line 95
    :try_start_0
    invoke-virtual {p0, p1}, Lio/sentry/jul/SentryHandler;->createEventBuilder(Ljava/util/logging/LogRecord;)Lio/sentry/event/EventBuilder;

    move-result-object v1

    .line 96
    .local v1, "eventBuilder":Lio/sentry/event/EventBuilder;
    invoke-static {v1}, Lio/sentry/Sentry;->capture(Lio/sentry/event/EventBuilder;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 100
    invoke-static {}, Lio/sentry/environment/SentryEnvironment;->stopManagingThread()V

    goto :goto_0

    .line 97
    .end local v1    # "eventBuilder":Lio/sentry/event/EventBuilder;
    :catch_0
    move-exception v0

    .line 98
    .local v0, "e":Ljava/lang/Exception;
    :try_start_1
    const-string/jumbo v2, "An exception occurred while creating a new event in Sentry"

    const/4 v3, 0x1

    invoke-virtual {p0, v2, v0, v3}, Lio/sentry/jul/SentryHandler;->reportError(Ljava/lang/String;Ljava/lang/Exception;I)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 100
    invoke-static {}, Lio/sentry/environment/SentryEnvironment;->stopManagingThread()V

    goto :goto_0

    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v2

    invoke-static {}, Lio/sentry/environment/SentryEnvironment;->stopManagingThread()V

    throw v2
.end method

.method protected retrieveProperties()V
    .locals 4

    .prologue
    .line 81
    invoke-static {}, Ljava/util/logging/LogManager;->getLogManager()Ljava/util/logging/LogManager;

    move-result-object v1

    .line 82
    .local v1, "manager":Ljava/util/logging/LogManager;
    const-class v2, Lio/sentry/jul/SentryHandler;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    .line 83
    .local v0, "className":Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, ".printfStyle"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/logging/LogManager;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    invoke-virtual {p0, v2}, Lio/sentry/jul/SentryHandler;->setPrintfStyle(Z)V

    .line 84
    return-void
.end method

.method public setPrintfStyle(Z)V
    .locals 0
    .param p1, "printfStyle"    # Z

    .prologue
    .line 203
    iput-boolean p1, p0, Lio/sentry/jul/SentryHandler;->printfStyle:Z

    .line 204
    return-void
.end method
