.class final Lio/sentry/connection/AsyncConnection$EventSubmitter;
.super Ljava/lang/Object;
.source "AsyncConnection.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/sentry/connection/AsyncConnection;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "EventSubmitter"
.end annotation


# instance fields
.field private final event:Lio/sentry/event/Event;

.field final synthetic this$0:Lio/sentry/connection/AsyncConnection;


# direct methods
.method private constructor <init>(Lio/sentry/connection/AsyncConnection;Lio/sentry/event/Event;)V
    .locals 0
    .param p2, "event"    # Lio/sentry/event/Event;

    .prologue
    .line 162
    iput-object p1, p0, Lio/sentry/connection/AsyncConnection$EventSubmitter;->this$0:Lio/sentry/connection/AsyncConnection;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 163
    iput-object p2, p0, Lio/sentry/connection/AsyncConnection$EventSubmitter;->event:Lio/sentry/event/Event;

    .line 164
    return-void
.end method

.method synthetic constructor <init>(Lio/sentry/connection/AsyncConnection;Lio/sentry/event/Event;Lio/sentry/connection/AsyncConnection$1;)V
    .locals 0
    .param p1, "x0"    # Lio/sentry/connection/AsyncConnection;
    .param p2, "x1"    # Lio/sentry/event/Event;
    .param p3, "x2"    # Lio/sentry/connection/AsyncConnection$1;

    .prologue
    .line 159
    invoke-direct {p0, p1, p2}, Lio/sentry/connection/AsyncConnection$EventSubmitter;-><init>(Lio/sentry/connection/AsyncConnection;Lio/sentry/event/Event;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 168
    invoke-static {}, Lio/sentry/environment/SentryEnvironment;->startManagingThread()V

    .line 171
    :try_start_0
    iget-object v1, p0, Lio/sentry/connection/AsyncConnection$EventSubmitter;->this$0:Lio/sentry/connection/AsyncConnection;

    invoke-static {v1}, Lio/sentry/connection/AsyncConnection;->access$300(Lio/sentry/connection/AsyncConnection;)Lio/sentry/connection/Connection;

    move-result-object v1

    iget-object v2, p0, Lio/sentry/connection/AsyncConnection$EventSubmitter;->event:Lio/sentry/event/Event;

    invoke-interface {v1, v2}, Lio/sentry/connection/Connection;->send(Lio/sentry/event/Event;)V
    :try_end_0
    .catch Lio/sentry/connection/LockedDownException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 177
    invoke-static {}, Lio/sentry/environment/SentryEnvironment;->stopManagingThread()V

    .line 179
    :goto_0
    return-void

    .line 172
    :catch_0
    move-exception v0

    .line 173
    .local v0, "e":Lio/sentry/connection/LockedDownException;
    :try_start_1
    invoke-static {}, Lio/sentry/connection/AsyncConnection;->access$400()Lorg/slf4j/Logger;

    move-result-object v1

    const-string/jumbo v2, "The connection to Sentry is currently locked down."

    invoke-interface {v1, v2, v0}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 177
    invoke-static {}, Lio/sentry/environment/SentryEnvironment;->stopManagingThread()V

    goto :goto_0

    .line 174
    .end local v0    # "e":Lio/sentry/connection/LockedDownException;
    :catch_1
    move-exception v0

    .line 175
    .local v0, "e":Ljava/lang/Exception;
    :try_start_2
    invoke-static {}, Lio/sentry/connection/AsyncConnection;->access$500()Lorg/slf4j/Logger;

    move-result-object v1

    const-string/jumbo v2, "An exception occurred while sending the event to Sentry."

    invoke-interface {v1, v2, v0}, Lorg/slf4j/Logger;->error(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 177
    invoke-static {}, Lio/sentry/environment/SentryEnvironment;->stopManagingThread()V

    goto :goto_0

    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v1

    invoke-static {}, Lio/sentry/environment/SentryEnvironment;->stopManagingThread()V

    throw v1
.end method
