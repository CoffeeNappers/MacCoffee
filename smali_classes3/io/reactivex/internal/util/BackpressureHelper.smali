.class public final Lio/reactivex/internal/util/BackpressureHelper;
.super Ljava/lang/Object;
.source "BackpressureHelper.java"


# direct methods
.method private constructor <init>()V
    .locals 2

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "No instances!"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static add(Ljava/util/concurrent/atomic/AtomicLong;J)J
    .locals 7
    .param p0, "requested"    # Ljava/util/concurrent/atomic/AtomicLong;
    .param p1, "n"    # J

    .prologue
    const-wide v4, 0x7fffffffffffffffL

    .line 67
    :cond_0
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v0

    .line 68
    .local v0, "r":J
    cmp-long v6, v0, v4

    if-nez v6, :cond_1

    move-wide v0, v4

    .line 73
    .end local v0    # "r":J
    :goto_0
    return-wide v0

    .line 71
    .restart local v0    # "r":J
    :cond_1
    invoke-static {v0, v1, p1, p2}, Lio/reactivex/internal/util/BackpressureHelper;->addCap(JJ)J

    move-result-wide v2

    .line 72
    .local v2, "u":J
    invoke-virtual {p0, v0, v1, v2, v3}, Ljava/util/concurrent/atomic/AtomicLong;->compareAndSet(JJ)Z

    move-result v6

    if-eqz v6, :cond_0

    goto :goto_0
.end method

.method public static addCancel(Ljava/util/concurrent/atomic/AtomicLong;J)J
    .locals 9
    .param p0, "requested"    # Ljava/util/concurrent/atomic/AtomicLong;
    .param p1, "n"    # J

    .prologue
    const-wide v6, 0x7fffffffffffffffL

    const-wide/high16 v4, -0x8000000000000000L

    .line 88
    :cond_0
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v0

    .line 89
    .local v0, "r":J
    cmp-long v8, v0, v4

    if-nez v8, :cond_1

    move-wide v0, v4

    .line 97
    .end local v0    # "r":J
    :goto_0
    return-wide v0

    .line 92
    .restart local v0    # "r":J
    :cond_1
    cmp-long v8, v0, v6

    if-nez v8, :cond_2

    move-wide v0, v6

    .line 93
    goto :goto_0

    .line 95
    :cond_2
    invoke-static {v0, v1, p1, p2}, Lio/reactivex/internal/util/BackpressureHelper;->addCap(JJ)J

    move-result-wide v2

    .line 96
    .local v2, "u":J
    invoke-virtual {p0, v0, v1, v2, v3}, Ljava/util/concurrent/atomic/AtomicLong;->compareAndSet(JJ)Z

    move-result v8

    if-eqz v8, :cond_0

    goto :goto_0
.end method

.method public static addCap(JJ)J
    .locals 4
    .param p0, "a"    # J
    .param p2, "b"    # J

    .prologue
    .line 35
    add-long v0, p0, p2

    .line 36
    .local v0, "u":J
    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-gez v2, :cond_0

    .line 37
    const-wide v0, 0x7fffffffffffffffL

    .line 39
    .end local v0    # "u":J
    :cond_0
    return-wide v0
.end method

.method public static multiplyCap(JJ)J
    .locals 6
    .param p0, "a"    # J
    .param p2, "b"    # J

    .prologue
    .line 49
    mul-long v0, p0, p2

    .line 50
    .local v0, "u":J
    or-long v2, p0, p2

    const/16 v4, 0x1f

    ushr-long/2addr v2, v4

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-eqz v2, :cond_0

    .line 51
    div-long v2, v0, p0

    cmp-long v2, v2, p2

    if-eqz v2, :cond_0

    .line 52
    const-wide v0, 0x7fffffffffffffffL

    .line 55
    .end local v0    # "u":J
    :cond_0
    return-wide v0
.end method

.method public static produced(Ljava/util/concurrent/atomic/AtomicLong;J)J
    .locals 9
    .param p0, "requested"    # Ljava/util/concurrent/atomic/AtomicLong;
    .param p1, "n"    # J

    .prologue
    const-wide v4, 0x7fffffffffffffffL

    .line 110
    :cond_0
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v0

    .line 111
    .local v0, "current":J
    cmp-long v6, v0, v4

    if-nez v6, :cond_1

    move-wide v2, v4

    .line 120
    :goto_0
    return-wide v2

    .line 114
    :cond_1
    sub-long v2, v0, p1

    .line 115
    .local v2, "update":J
    const-wide/16 v6, 0x0

    cmp-long v6, v2, v6

    if-gez v6, :cond_2

    .line 116
    new-instance v6, Ljava/lang/IllegalStateException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "More produced than requested: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    invoke-static {v6}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    .line 117
    const-wide/16 v2, 0x0

    .line 119
    :cond_2
    invoke-virtual {p0, v0, v1, v2, v3}, Ljava/util/concurrent/atomic/AtomicLong;->compareAndSet(JJ)Z

    move-result v6

    if-eqz v6, :cond_0

    goto :goto_0
.end method

.method public static producedCancel(Ljava/util/concurrent/atomic/AtomicLong;J)J
    .locals 11
    .param p0, "requested"    # Ljava/util/concurrent/atomic/AtomicLong;
    .param p1, "n"    # J

    .prologue
    const-wide v6, 0x7fffffffffffffffL

    const-wide/high16 v4, -0x8000000000000000L

    .line 134
    :cond_0
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v0

    .line 135
    .local v0, "current":J
    cmp-long v8, v0, v4

    if-nez v8, :cond_1

    move-wide v2, v4

    .line 147
    :goto_0
    return-wide v2

    .line 138
    :cond_1
    cmp-long v8, v0, v6

    if-nez v8, :cond_2

    move-wide v2, v6

    .line 139
    goto :goto_0

    .line 141
    :cond_2
    sub-long v2, v0, p1

    .line 142
    .local v2, "update":J
    const-wide/16 v8, 0x0

    cmp-long v8, v2, v8

    if-gez v8, :cond_3

    .line 143
    new-instance v8, Ljava/lang/IllegalStateException;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v10, "More produced than requested: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    invoke-static {v8}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    .line 144
    const-wide/16 v2, 0x0

    .line 146
    :cond_3
    invoke-virtual {p0, v0, v1, v2, v3}, Ljava/util/concurrent/atomic/AtomicLong;->compareAndSet(JJ)Z

    move-result v8

    if-eqz v8, :cond_0

    goto :goto_0
.end method
