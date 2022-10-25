.class public final Lio/reactivex/schedulers/Timed;
.super Ljava/lang/Object;
.source "Timed.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field final time:J

.field final unit:Ljava/util/concurrent/TimeUnit;

.field final value:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/Object;JLjava/util/concurrent/TimeUnit;)V
    .locals 2
    .param p2, "time"    # J
    .param p4, "unit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;J",
            "Ljava/util/concurrent/TimeUnit;",
            ")V"
        }
    .end annotation

    .prologue
    .line 37
    .local p0, "this":Lio/reactivex/schedulers/Timed;, "Lio/reactivex/schedulers/Timed<TT;>;"
    .local p1, "value":Ljava/lang/Object;, "TT;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    iput-object p1, p0, Lio/reactivex/schedulers/Timed;->value:Ljava/lang/Object;

    .line 39
    iput-wide p2, p0, Lio/reactivex/schedulers/Timed;->time:J

    .line 40
    const-string/jumbo v0, "unit is null"

    invoke-static {p4, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/concurrent/TimeUnit;

    iput-object v0, p0, Lio/reactivex/schedulers/Timed;->unit:Ljava/util/concurrent/TimeUnit;

    .line 41
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 6
    .param p1, "other"    # Ljava/lang/Object;

    .prologue
    .local p0, "this":Lio/reactivex/schedulers/Timed;, "Lio/reactivex/schedulers/Timed<TT;>;"
    const/4 v1, 0x0

    .line 78
    instance-of v2, p1, Lio/reactivex/schedulers/Timed;

    if-eqz v2, :cond_0

    move-object v0, p1

    .line 79
    check-cast v0, Lio/reactivex/schedulers/Timed;

    .line 80
    .local v0, "o":Lio/reactivex/schedulers/Timed;, "Lio/reactivex/schedulers/Timed<*>;"
    iget-object v2, p0, Lio/reactivex/schedulers/Timed;->value:Ljava/lang/Object;

    iget-object v3, v0, Lio/reactivex/schedulers/Timed;->value:Ljava/lang/Object;

    invoke-static {v2, v3}, Lio/reactivex/internal/functions/ObjectHelper;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    iget-wide v2, p0, Lio/reactivex/schedulers/Timed;->time:J

    iget-wide v4, v0, Lio/reactivex/schedulers/Timed;->time:J

    cmp-long v2, v2, v4

    if-nez v2, :cond_0

    iget-object v2, p0, Lio/reactivex/schedulers/Timed;->unit:Ljava/util/concurrent/TimeUnit;

    iget-object v3, v0, Lio/reactivex/schedulers/Timed;->unit:Ljava/util/concurrent/TimeUnit;

    invoke-static {v2, v3}, Lio/reactivex/internal/functions/ObjectHelper;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v1, 0x1

    .line 84
    .end local v0    # "o":Lio/reactivex/schedulers/Timed;, "Lio/reactivex/schedulers/Timed<*>;"
    :cond_0
    return v1
.end method

.method public hashCode()I
    .locals 6

    .prologue
    .line 89
    .local p0, "this":Lio/reactivex/schedulers/Timed;, "Lio/reactivex/schedulers/Timed<TT;>;"
    iget-object v1, p0, Lio/reactivex/schedulers/Timed;->value:Ljava/lang/Object;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lio/reactivex/schedulers/Timed;->value:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v0

    .line 90
    .local v0, "h":I
    :goto_0
    mul-int/lit8 v1, v0, 0x1f

    iget-wide v2, p0, Lio/reactivex/schedulers/Timed;->time:J

    const/16 v4, 0x1f

    ushr-long/2addr v2, v4

    iget-wide v4, p0, Lio/reactivex/schedulers/Timed;->time:J

    xor-long/2addr v2, v4

    long-to-int v2, v2

    add-int v0, v1, v2

    .line 91
    mul-int/lit8 v1, v0, 0x1f

    iget-object v2, p0, Lio/reactivex/schedulers/Timed;->unit:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v2}, Ljava/util/concurrent/TimeUnit;->hashCode()I

    move-result v2

    add-int v0, v1, v2

    .line 92
    return v0

    .line 89
    .end local v0    # "h":I
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public time()J
    .locals 2

    .prologue
    .line 64
    .local p0, "this":Lio/reactivex/schedulers/Timed;, "Lio/reactivex/schedulers/Timed<TT;>;"
    iget-wide v0, p0, Lio/reactivex/schedulers/Timed;->time:J

    return-wide v0
.end method

.method public time(Ljava/util/concurrent/TimeUnit;)J
    .locals 3
    .param p1, "unit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 73
    .local p0, "this":Lio/reactivex/schedulers/Timed;, "Lio/reactivex/schedulers/Timed<TT;>;"
    iget-wide v0, p0, Lio/reactivex/schedulers/Timed;->time:J

    iget-object v2, p0, Lio/reactivex/schedulers/Timed;->unit:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p1, v0, v1, v2}, Ljava/util/concurrent/TimeUnit;->convert(JLjava/util/concurrent/TimeUnit;)J

    move-result-wide v0

    return-wide v0
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 97
    .local p0, "this":Lio/reactivex/schedulers/Timed;, "Lio/reactivex/schedulers/Timed<TT;>;"
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "Timed[time="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p0, Lio/reactivex/schedulers/Timed;->time:J

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", unit="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lio/reactivex/schedulers/Timed;->unit:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", value="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lio/reactivex/schedulers/Timed;->value:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public unit()Ljava/util/concurrent/TimeUnit;
    .locals 1

    .prologue
    .line 56
    .local p0, "this":Lio/reactivex/schedulers/Timed;, "Lio/reactivex/schedulers/Timed<TT;>;"
    iget-object v0, p0, Lio/reactivex/schedulers/Timed;->unit:Ljava/util/concurrent/TimeUnit;

    return-object v0
.end method

.method public value()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .line 48
    .local p0, "this":Lio/reactivex/schedulers/Timed;, "Lio/reactivex/schedulers/Timed<TT;>;"
    iget-object v0, p0, Lio/reactivex/schedulers/Timed;->value:Ljava/lang/Object;

    return-object v0
.end method
