.class public Lio/sentry/connection/NoopConnection;
.super Lio/sentry/connection/AbstractConnection;
.source "NoopConnection.java"


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 17
    invoke-direct {p0, v0, v0}, Lio/sentry/connection/AbstractConnection;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    return-void
.end method


# virtual methods
.method public close()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 26
    return-void
.end method

.method protected doSend(Lio/sentry/event/Event;)V
    .locals 0
    .param p1, "event"    # Lio/sentry/event/Event;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lio/sentry/connection/ConnectionException;
        }
    .end annotation

    .prologue
    .line 22
    return-void
.end method
