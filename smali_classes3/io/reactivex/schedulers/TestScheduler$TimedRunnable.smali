.class final Lio/reactivex/schedulers/TestScheduler$TimedRunnable;
.super Ljava/lang/Object;
.source "TestScheduler.java"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/schedulers/TestScheduler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "TimedRunnable"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Comparable",
        "<",
        "Lio/reactivex/schedulers/TestScheduler$TimedRunnable;",
        ">;"
    }
.end annotation


# instance fields
.field final count:J

.field final run:Ljava/lang/Runnable;

.field final scheduler:Lio/reactivex/schedulers/TestScheduler$TestWorker;

.field final time:J


# direct methods
.method constructor <init>(Lio/reactivex/schedulers/TestScheduler$TestWorker;JLjava/lang/Runnable;J)V
    .locals 0
    .param p1, "scheduler"    # Lio/reactivex/schedulers/TestScheduler$TestWorker;
    .param p2, "time"    # J
    .param p4, "run"    # Ljava/lang/Runnable;
    .param p5, "count"    # J

    .prologue
    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    iput-wide p2, p0, Lio/reactivex/schedulers/TestScheduler$TimedRunnable;->time:J

    .line 47
    iput-object p4, p0, Lio/reactivex/schedulers/TestScheduler$TimedRunnable;->run:Ljava/lang/Runnable;

    .line 48
    iput-object p1, p0, Lio/reactivex/schedulers/TestScheduler$TimedRunnable;->scheduler:Lio/reactivex/schedulers/TestScheduler$TestWorker;

    .line 49
    iput-wide p5, p0, Lio/reactivex/schedulers/TestScheduler$TimedRunnable;->count:J

    .line 50
    return-void
.end method


# virtual methods
.method public compareTo(Lio/reactivex/schedulers/TestScheduler$TimedRunnable;)I
    .locals 4
    .param p1, "o"    # Lio/reactivex/schedulers/TestScheduler$TimedRunnable;

    .prologue
    .line 59
    iget-wide v0, p0, Lio/reactivex/schedulers/TestScheduler$TimedRunnable;->time:J

    iget-wide v2, p1, Lio/reactivex/schedulers/TestScheduler$TimedRunnable;->time:J

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 60
    iget-wide v0, p0, Lio/reactivex/schedulers/TestScheduler$TimedRunnable;->count:J

    iget-wide v2, p1, Lio/reactivex/schedulers/TestScheduler$TimedRunnable;->count:J

    invoke-static {v0, v1, v2, v3}, Lio/reactivex/internal/functions/ObjectHelper;->compare(JJ)I

    move-result v0

    .line 62
    :goto_0
    return v0

    :cond_0
    iget-wide v0, p0, Lio/reactivex/schedulers/TestScheduler$TimedRunnable;->time:J

    iget-wide v2, p1, Lio/reactivex/schedulers/TestScheduler$TimedRunnable;->time:J

    invoke-static {v0, v1, v2, v3}, Lio/reactivex/internal/functions/ObjectHelper;->compare(JJ)I

    move-result v0

    goto :goto_0
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 1
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 38
    check-cast p1, Lio/reactivex/schedulers/TestScheduler$TimedRunnable;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lio/reactivex/schedulers/TestScheduler$TimedRunnable;->compareTo(Lio/reactivex/schedulers/TestScheduler$TimedRunnable;)I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 6

    .prologue
    .line 54
    const-string/jumbo v0, "TimedRunnable(time = %d, run = %s)"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget-wide v4, p0, Lio/reactivex/schedulers/TestScheduler$TimedRunnable;->time:J

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    iget-object v3, p0, Lio/reactivex/schedulers/TestScheduler$TimedRunnable;->run:Ljava/lang/Runnable;

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
