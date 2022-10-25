.class Lio/sentry/jul/SentryHandler$DropSentryFilter;
.super Ljava/lang/Object;
.source "SentryHandler.java"

# interfaces
.implements Ljava/util/logging/Filter;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/sentry/jul/SentryHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DropSentryFilter"
.end annotation


# instance fields
.field final synthetic this$0:Lio/sentry/jul/SentryHandler;


# direct methods
.method private constructor <init>(Lio/sentry/jul/SentryHandler;)V
    .locals 0

    .prologue
    .line 206
    iput-object p1, p0, Lio/sentry/jul/SentryHandler$DropSentryFilter;->this$0:Lio/sentry/jul/SentryHandler;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lio/sentry/jul/SentryHandler;Lio/sentry/jul/SentryHandler$1;)V
    .locals 0
    .param p1, "x0"    # Lio/sentry/jul/SentryHandler;
    .param p2, "x1"    # Lio/sentry/jul/SentryHandler$1;

    .prologue
    .line 206
    invoke-direct {p0, p1}, Lio/sentry/jul/SentryHandler$DropSentryFilter;-><init>(Lio/sentry/jul/SentryHandler;)V

    return-void
.end method


# virtual methods
.method public isLoggable(Ljava/util/logging/LogRecord;)Z
    .locals 2
    .param p1, "record"    # Ljava/util/logging/LogRecord;

    .prologue
    .line 209
    invoke-virtual {p1}, Ljava/util/logging/LogRecord;->getLoggerName()Ljava/lang/String;

    move-result-object v0

    .line 210
    .local v0, "loggerName":Ljava/lang/String;
    if-eqz v0, :cond_0

    const-string/jumbo v1, "io.sentry"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    :cond_0
    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method
