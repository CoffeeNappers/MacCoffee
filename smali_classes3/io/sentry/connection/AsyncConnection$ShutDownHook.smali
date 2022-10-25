.class final Lio/sentry/connection/AsyncConnection$ShutDownHook;
.super Ljava/lang/Thread;
.source "AsyncConnection.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/sentry/connection/AsyncConnection;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "ShutDownHook"
.end annotation


# instance fields
.field private volatile enabled:Z

.field final synthetic this$0:Lio/sentry/connection/AsyncConnection;


# direct methods
.method private constructor <init>(Lio/sentry/connection/AsyncConnection;)V
    .locals 1

    .prologue
    .line 182
    iput-object p1, p0, Lio/sentry/connection/AsyncConnection$ShutDownHook;->this$0:Lio/sentry/connection/AsyncConnection;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 187
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/sentry/connection/AsyncConnection$ShutDownHook;->enabled:Z

    return-void
.end method

.method synthetic constructor <init>(Lio/sentry/connection/AsyncConnection;Lio/sentry/connection/AsyncConnection$1;)V
    .locals 0
    .param p1, "x0"    # Lio/sentry/connection/AsyncConnection;
    .param p2, "x1"    # Lio/sentry/connection/AsyncConnection$1;

    .prologue
    .line 182
    invoke-direct {p0, p1}, Lio/sentry/connection/AsyncConnection$ShutDownHook;-><init>(Lio/sentry/connection/AsyncConnection;)V

    return-void
.end method

.method static synthetic access$202(Lio/sentry/connection/AsyncConnection$ShutDownHook;Z)Z
    .locals 0
    .param p0, "x0"    # Lio/sentry/connection/AsyncConnection$ShutDownHook;
    .param p1, "x1"    # Z

    .prologue
    .line 182
    iput-boolean p1, p0, Lio/sentry/connection/AsyncConnection$ShutDownHook;->enabled:Z

    return p1
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 191
    iget-boolean v1, p0, Lio/sentry/connection/AsyncConnection$ShutDownHook;->enabled:Z

    if-nez v1, :cond_0

    .line 205
    :goto_0
    return-void

    .line 195
    :cond_0
    invoke-static {}, Lio/sentry/environment/SentryEnvironment;->startManagingThread()V

    .line 198
    :try_start_0
    invoke-static {}, Lio/sentry/connection/AsyncConnection;->access$500()Lorg/slf4j/Logger;

    move-result-object v1

    const-string/jumbo v2, "Automatic shutdown of the async connection"

    invoke-interface {v1, v2}, Lorg/slf4j/Logger;->info(Ljava/lang/String;)V

    .line 199
    iget-object v1, p0, Lio/sentry/connection/AsyncConnection$ShutDownHook;->this$0:Lio/sentry/connection/AsyncConnection;

    invoke-static {v1}, Lio/sentry/connection/AsyncConnection;->access$600(Lio/sentry/connection/AsyncConnection;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 203
    invoke-static {}, Lio/sentry/environment/SentryEnvironment;->stopManagingThread()V

    goto :goto_0

    .line 200
    :catch_0
    move-exception v0

    .line 201
    .local v0, "e":Ljava/lang/Exception;
    :try_start_1
    invoke-static {}, Lio/sentry/connection/AsyncConnection;->access$500()Lorg/slf4j/Logger;

    move-result-object v1

    const-string/jumbo v2, "An exception occurred while closing the connection."

    invoke-interface {v1, v2, v0}, Lorg/slf4j/Logger;->error(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 203
    invoke-static {}, Lio/sentry/environment/SentryEnvironment;->stopManagingThread()V

    goto :goto_0

    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v1

    invoke-static {}, Lio/sentry/environment/SentryEnvironment;->stopManagingThread()V

    throw v1
.end method
