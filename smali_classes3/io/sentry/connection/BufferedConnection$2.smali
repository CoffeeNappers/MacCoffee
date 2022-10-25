.class Lio/sentry/connection/BufferedConnection$2;
.super Ljava/lang/Object;
.source "BufferedConnection.java"

# interfaces
.implements Lio/sentry/connection/Connection;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/sentry/connection/BufferedConnection;->wrapConnectionWithBufferWriter(Lio/sentry/connection/Connection;)Lio/sentry/connection/Connection;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lio/sentry/connection/BufferedConnection;

.field final synthetic val$connectionToWrap:Lio/sentry/connection/Connection;

.field final wrappedConnection:Lio/sentry/connection/Connection;


# direct methods
.method constructor <init>(Lio/sentry/connection/BufferedConnection;Lio/sentry/connection/Connection;)V
    .locals 1

    .prologue
    .line 161
    iput-object p1, p0, Lio/sentry/connection/BufferedConnection$2;->this$0:Lio/sentry/connection/BufferedConnection;

    iput-object p2, p0, Lio/sentry/connection/BufferedConnection$2;->val$connectionToWrap:Lio/sentry/connection/Connection;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 162
    iget-object v0, p0, Lio/sentry/connection/BufferedConnection$2;->val$connectionToWrap:Lio/sentry/connection/Connection;

    iput-object v0, p0, Lio/sentry/connection/BufferedConnection$2;->wrappedConnection:Lio/sentry/connection/Connection;

    return-void
.end method


# virtual methods
.method public addEventSendCallback(Lio/sentry/connection/EventSendCallback;)V
    .locals 1
    .param p1, "eventSendCallback"    # Lio/sentry/connection/EventSendCallback;

    .prologue
    .line 178
    iget-object v0, p0, Lio/sentry/connection/BufferedConnection$2;->wrappedConnection:Lio/sentry/connection/Connection;

    invoke-interface {v0, p1}, Lio/sentry/connection/Connection;->addEventSendCallback(Lio/sentry/connection/EventSendCallback;)V

    .line 179
    return-void
.end method

.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 183
    iget-object v0, p0, Lio/sentry/connection/BufferedConnection$2;->wrappedConnection:Lio/sentry/connection/Connection;

    invoke-interface {v0}, Lio/sentry/connection/Connection;->close()V

    .line 184
    return-void
.end method

.method public send(Lio/sentry/event/Event;)V
    .locals 3
    .param p1, "event"    # Lio/sentry/event/Event;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lio/sentry/connection/ConnectionException;
        }
    .end annotation

    .prologue
    .line 168
    :try_start_0
    iget-object v1, p0, Lio/sentry/connection/BufferedConnection$2;->this$0:Lio/sentry/connection/BufferedConnection;

    invoke-static {v1}, Lio/sentry/connection/BufferedConnection;->access$200(Lio/sentry/connection/BufferedConnection;)Lio/sentry/buffer/Buffer;

    move-result-object v1

    invoke-interface {v1, p1}, Lio/sentry/buffer/Buffer;->add(Lio/sentry/event/Event;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 173
    :goto_0
    iget-object v1, p0, Lio/sentry/connection/BufferedConnection$2;->wrappedConnection:Lio/sentry/connection/Connection;

    invoke-interface {v1, p1}, Lio/sentry/connection/Connection;->send(Lio/sentry/event/Event;)V

    .line 174
    return-void

    .line 169
    :catch_0
    move-exception v0

    .line 170
    .local v0, "e":Ljava/lang/Exception;
    invoke-static {}, Lio/sentry/connection/BufferedConnection;->access$300()Lorg/slf4j/Logger;

    move-result-object v1

    const-string/jumbo v2, "Exception occurred while attempting to add Event to buffer: "

    invoke-interface {v1, v2, v0}, Lorg/slf4j/Logger;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method
