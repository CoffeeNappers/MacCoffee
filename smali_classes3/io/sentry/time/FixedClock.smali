.class public Lio/sentry/time/FixedClock;
.super Ljava/lang/Object;
.source "FixedClock.java"

# interfaces
.implements Lio/sentry/time/Clock;


# instance fields
.field private date:Ljava/util/Date;


# direct methods
.method public constructor <init>(Ljava/util/Date;)V
    .locals 0
    .param p1, "date"    # Ljava/util/Date;

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    iput-object p1, p0, Lio/sentry/time/FixedClock;->date:Ljava/util/Date;

    .line 20
    return-void
.end method


# virtual methods
.method public date()Ljava/util/Date;
    .locals 1

    .prologue
    .line 29
    iget-object v0, p0, Lio/sentry/time/FixedClock;->date:Ljava/util/Date;

    return-object v0
.end method

.method public millis()J
    .locals 2

    .prologue
    .line 24
    iget-object v0, p0, Lio/sentry/time/FixedClock;->date:Ljava/util/Date;

    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    return-wide v0
.end method

.method public setDate(Ljava/util/Date;)V
    .locals 0
    .param p1, "date"    # Ljava/util/Date;

    .prologue
    .line 33
    iput-object p1, p0, Lio/sentry/time/FixedClock;->date:Ljava/util/Date;

    .line 34
    return-void
.end method

.method public tick(JLjava/util/concurrent/TimeUnit;)V
    .locals 7
    .param p1, "duration"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 43
    new-instance v0, Ljava/util/Date;

    iget-object v1, p0, Lio/sentry/time/FixedClock;->date:Ljava/util/Date;

    invoke-virtual {v1}, Ljava/util/Date;->getTime()J

    move-result-wide v2

    invoke-virtual {p3, p1, p2}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v4

    add-long/2addr v2, v4

    invoke-direct {v0, v2, v3}, Ljava/util/Date;-><init>(J)V

    iput-object v0, p0, Lio/sentry/time/FixedClock;->date:Ljava/util/Date;

    .line 44
    return-void
.end method
