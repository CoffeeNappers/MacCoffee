.class Lio/sentry/connection/BufferedConnection$Flusher;
.super Ljava/lang/Object;
.source "BufferedConnection.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/sentry/connection/BufferedConnection;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "Flusher"
.end annotation


# instance fields
.field private minAgeMillis:J

.field final synthetic this$0:Lio/sentry/connection/BufferedConnection;


# direct methods
.method constructor <init>(Lio/sentry/connection/BufferedConnection;J)V
    .locals 0
    .param p2, "minAgeMillis"    # J

    .prologue
    .line 199
    iput-object p1, p0, Lio/sentry/connection/BufferedConnection$Flusher;->this$0:Lio/sentry/connection/BufferedConnection;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 200
    iput-wide p2, p0, Lio/sentry/connection/BufferedConnection$Flusher;->minAgeMillis:J

    .line 201
    return-void
.end method


# virtual methods
.method public run()V
    .locals 12

    .prologue
    .line 205
    invoke-static {}, Lio/sentry/connection/BufferedConnection;->access$300()Lorg/slf4j/Logger;

    move-result-object v7

    const-string/jumbo v10, "Running Flusher"

    invoke-interface {v7, v10}, Lorg/slf4j/Logger;->trace(Ljava/lang/String;)V

    .line 207
    invoke-static {}, Lio/sentry/environment/SentryEnvironment;->startManagingThread()V

    .line 209
    :try_start_0
    iget-object v7, p0, Lio/sentry/connection/BufferedConnection$Flusher;->this$0:Lio/sentry/connection/BufferedConnection;

    invoke-static {v7}, Lio/sentry/connection/BufferedConnection;->access$200(Lio/sentry/connection/BufferedConnection;)Lio/sentry/buffer/Buffer;

    move-result-object v7

    invoke-interface {v7}, Lio/sentry/buffer/Buffer;->getEvents()Ljava/util/Iterator;

    move-result-object v6

    .line 210
    .local v6, "events":Ljava/util/Iterator;, "Ljava/util/Iterator<Lio/sentry/event/Event;>;"
    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_1

    iget-object v7, p0, Lio/sentry/connection/BufferedConnection$Flusher;->this$0:Lio/sentry/connection/BufferedConnection;

    invoke-static {v7}, Lio/sentry/connection/BufferedConnection;->access$400(Lio/sentry/connection/BufferedConnection;)Z

    move-result v7

    if-nez v7, :cond_1

    .line 211
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lio/sentry/event/Event;

    .line 220
    .local v3, "event":Lio/sentry/event/Event;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    .line 221
    .local v8, "now":J
    invoke-virtual {v3}, Lio/sentry/event/Event;->getTimestamp()Ljava/util/Date;

    move-result-object v7

    invoke-virtual {v7}, Ljava/util/Date;->getTime()J

    move-result-wide v4

    .line 222
    .local v4, "eventTime":J
    sub-long v0, v8, v4

    .line 223
    .local v0, "age":J
    iget-wide v10, p0, Lio/sentry/connection/BufferedConnection$Flusher;->minAgeMillis:J

    cmp-long v7, v0, v10

    if-gez v7, :cond_0

    .line 224
    invoke-static {}, Lio/sentry/connection/BufferedConnection;->access$300()Lorg/slf4j/Logger;

    move-result-object v7

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v11, "Ignoring buffered event because it only "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string/jumbo v11, "ms old."

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-interface {v7, v10}, Lorg/slf4j/Logger;->trace(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 242
    invoke-static {}, Lio/sentry/environment/SentryEnvironment;->stopManagingThread()V

    .line 244
    .end local v0    # "age":J
    .end local v3    # "event":Lio/sentry/event/Event;
    .end local v4    # "eventTime":J
    .end local v8    # "now":J
    :goto_1
    return-void

    .line 229
    .restart local v0    # "age":J
    .restart local v3    # "event":Lio/sentry/event/Event;
    .restart local v4    # "eventTime":J
    .restart local v8    # "now":J
    :cond_0
    :try_start_1
    invoke-static {}, Lio/sentry/connection/BufferedConnection;->access$300()Lorg/slf4j/Logger;

    move-result-object v7

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v11, "Flusher attempting to send Event: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v3}, Lio/sentry/event/Event;->getId()Ljava/util/UUID;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-interface {v7, v10}, Lorg/slf4j/Logger;->trace(Ljava/lang/String;)V

    .line 230
    iget-object v7, p0, Lio/sentry/connection/BufferedConnection$Flusher;->this$0:Lio/sentry/connection/BufferedConnection;

    invoke-virtual {v7, v3}, Lio/sentry/connection/BufferedConnection;->send(Lio/sentry/event/Event;)V

    .line 231
    invoke-static {}, Lio/sentry/connection/BufferedConnection;->access$300()Lorg/slf4j/Logger;

    move-result-object v7

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v11, "Flusher successfully sent Event: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v3}, Lio/sentry/event/Event;->getId()Ljava/util/UUID;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-interface {v7, v10}, Lorg/slf4j/Logger;->trace(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto/16 :goto_0

    .line 232
    :catch_0
    move-exception v2

    .line 233
    .local v2, "e":Ljava/lang/Exception;
    :try_start_2
    invoke-static {}, Lio/sentry/connection/BufferedConnection;->access$300()Lorg/slf4j/Logger;

    move-result-object v7

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v11, "Flusher failed to send Event: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v3}, Lio/sentry/event/Event;->getId()Ljava/util/UUID;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-interface {v7, v10, v2}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 236
    invoke-static {}, Lio/sentry/connection/BufferedConnection;->access$300()Lorg/slf4j/Logger;

    move-result-object v7

    const-string/jumbo v10, "Flusher run exiting early."

    invoke-interface {v7, v10}, Lorg/slf4j/Logger;->trace(Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 242
    invoke-static {}, Lio/sentry/environment/SentryEnvironment;->stopManagingThread()V

    goto :goto_1

    .line 240
    .end local v0    # "age":J
    .end local v2    # "e":Ljava/lang/Exception;
    .end local v3    # "event":Lio/sentry/event/Event;
    .end local v4    # "eventTime":J
    .end local v8    # "now":J
    :cond_1
    :try_start_3
    invoke-static {}, Lio/sentry/connection/BufferedConnection;->access$300()Lorg/slf4j/Logger;

    move-result-object v7

    const-string/jumbo v10, "Flusher run exiting, no more events to send."

    invoke-interface {v7, v10}, Lorg/slf4j/Logger;->trace(Ljava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 242
    invoke-static {}, Lio/sentry/environment/SentryEnvironment;->stopManagingThread()V

    goto/16 :goto_1

    .end local v6    # "events":Ljava/util/Iterator;, "Ljava/util/Iterator<Lio/sentry/event/Event;>;"
    :catchall_0
    move-exception v7

    invoke-static {}, Lio/sentry/environment/SentryEnvironment;->stopManagingThread()V

    throw v7
.end method
