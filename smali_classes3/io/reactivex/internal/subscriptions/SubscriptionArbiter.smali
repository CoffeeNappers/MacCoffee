.class public Lio/reactivex/internal/subscriptions/SubscriptionArbiter;
.super Ljava/util/concurrent/atomic/AtomicInteger;
.source "SubscriptionArbiter.java"

# interfaces
.implements Lorg/reactivestreams/Subscription;


# static fields
.field private static final serialVersionUID:J = -0x1e62bfbf4b5b12feL


# instance fields
.field actual:Lorg/reactivestreams/Subscription;

.field volatile cancelled:Z

.field final missedProduced:Ljava/util/concurrent/atomic/AtomicLong;

.field final missedRequested:Ljava/util/concurrent/atomic/AtomicLong;

.field final missedSubscription:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Lorg/reactivestreams/Subscription;",
            ">;"
        }
    .end annotation
.end field

.field requested:J

.field protected unbounded:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 62
    invoke-direct {p0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    .line 63
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/subscriptions/SubscriptionArbiter;->missedSubscription:Ljava/util/concurrent/atomic/AtomicReference;

    .line 64
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/subscriptions/SubscriptionArbiter;->missedRequested:Ljava/util/concurrent/atomic/AtomicLong;

    .line 65
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/subscriptions/SubscriptionArbiter;->missedProduced:Ljava/util/concurrent/atomic/AtomicLong;

    .line 66
    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 1

    .prologue
    .line 176
    iget-boolean v0, p0, Lio/reactivex/internal/subscriptions/SubscriptionArbiter;->cancelled:Z

    if-nez v0, :cond_0

    .line 177
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/subscriptions/SubscriptionArbiter;->cancelled:Z

    .line 179
    invoke-virtual {p0}, Lio/reactivex/internal/subscriptions/SubscriptionArbiter;->drain()V

    .line 181
    :cond_0
    return-void
.end method

.method final drain()V
    .locals 1

    .prologue
    .line 184
    invoke-virtual {p0}, Lio/reactivex/internal/subscriptions/SubscriptionArbiter;->getAndIncrement()I

    move-result v0

    if-eqz v0, :cond_0

    .line 188
    :goto_0
    return-void

    .line 187
    :cond_0
    invoke-virtual {p0}, Lio/reactivex/internal/subscriptions/SubscriptionArbiter;->drainLoop()V

    goto :goto_0
.end method

.method final drainLoop()V
    .locals 24

    .prologue
    .line 191
    const/4 v5, 0x1

    .line 193
    .local v5, "missed":I
    const-wide/16 v14, 0x0

    .line 194
    .local v14, "requestAmount":J
    const/4 v11, 0x0

    .line 198
    .local v11, "requestTarget":Lorg/reactivestreams/Subscription;
    :cond_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/subscriptions/SubscriptionArbiter;->missedSubscription:Ljava/util/concurrent/atomic/AtomicReference;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lorg/reactivestreams/Subscription;

    .line 200
    .local v10, "ms":Lorg/reactivestreams/Subscription;
    if-eqz v10, :cond_1

    .line 201
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/subscriptions/SubscriptionArbiter;->missedSubscription:Ljava/util/concurrent/atomic/AtomicReference;

    move-object/from16 v20, v0

    const/16 v21, 0x0

    invoke-virtual/range {v20 .. v21}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    .end local v10    # "ms":Lorg/reactivestreams/Subscription;
    check-cast v10, Lorg/reactivestreams/Subscription;

    .line 204
    .restart local v10    # "ms":Lorg/reactivestreams/Subscription;
    :cond_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/subscriptions/SubscriptionArbiter;->missedRequested:Ljava/util/concurrent/atomic/AtomicLong;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v8

    .line 205
    .local v8, "mr":J
    const-wide/16 v20, 0x0

    cmp-long v20, v8, v20

    if-eqz v20, :cond_2

    .line 206
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/subscriptions/SubscriptionArbiter;->missedRequested:Ljava/util/concurrent/atomic/AtomicLong;

    move-object/from16 v20, v0

    const-wide/16 v22, 0x0

    move-object/from16 v0, v20

    move-wide/from16 v1, v22

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicLong;->getAndSet(J)J

    move-result-wide v8

    .line 209
    :cond_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/subscriptions/SubscriptionArbiter;->missedProduced:Ljava/util/concurrent/atomic/AtomicLong;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v6

    .line 210
    .local v6, "mp":J
    const-wide/16 v20, 0x0

    cmp-long v20, v6, v20

    if-eqz v20, :cond_3

    .line 211
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/subscriptions/SubscriptionArbiter;->missedProduced:Ljava/util/concurrent/atomic/AtomicLong;

    move-object/from16 v20, v0

    const-wide/16 v22, 0x0

    move-object/from16 v0, v20

    move-wide/from16 v1, v22

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicLong;->getAndSet(J)J

    move-result-wide v6

    .line 214
    :cond_3
    move-object/from16 v0, p0

    iget-object v4, v0, Lio/reactivex/internal/subscriptions/SubscriptionArbiter;->actual:Lorg/reactivestreams/Subscription;

    .line 216
    .local v4, "a":Lorg/reactivestreams/Subscription;
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lio/reactivex/internal/subscriptions/SubscriptionArbiter;->cancelled:Z

    move/from16 v20, v0

    if-eqz v20, :cond_7

    .line 217
    if-eqz v4, :cond_4

    .line 218
    invoke-interface {v4}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 219
    const/16 v20, 0x0

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    iput-object v0, v1, Lio/reactivex/internal/subscriptions/SubscriptionArbiter;->actual:Lorg/reactivestreams/Subscription;

    .line 221
    :cond_4
    if-eqz v10, :cond_5

    .line 222
    invoke-interface {v10}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 257
    :cond_5
    :goto_0
    neg-int v0, v5

    move/from16 v20, v0

    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Lio/reactivex/internal/subscriptions/SubscriptionArbiter;->addAndGet(I)I

    move-result v5

    .line 258
    if-nez v5, :cond_0

    .line 259
    const-wide/16 v20, 0x0

    cmp-long v20, v14, v20

    if-eqz v20, :cond_6

    .line 260
    invoke-interface {v11, v14, v15}, Lorg/reactivestreams/Subscription;->request(J)V

    .line 262
    :cond_6
    return-void

    .line 225
    :cond_7
    move-object/from16 v0, p0

    iget-wide v12, v0, Lio/reactivex/internal/subscriptions/SubscriptionArbiter;->requested:J

    .line 226
    .local v12, "r":J
    const-wide v20, 0x7fffffffffffffffL

    cmp-long v20, v12, v20

    if-eqz v20, :cond_9

    .line 227
    invoke-static {v12, v13, v8, v9}, Lio/reactivex/internal/util/BackpressureHelper;->addCap(JJ)J

    move-result-wide v16

    .line 229
    .local v16, "u":J
    const-wide v20, 0x7fffffffffffffffL

    cmp-long v20, v16, v20

    if-eqz v20, :cond_b

    .line 230
    sub-long v18, v16, v6

    .line 231
    .local v18, "v":J
    const-wide/16 v20, 0x0

    cmp-long v20, v18, v20

    if-gez v20, :cond_8

    .line 232
    invoke-static/range {v18 .. v19}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->reportMoreProduced(J)V

    .line 233
    const-wide/16 v18, 0x0

    .line 235
    :cond_8
    move-wide/from16 v12, v18

    .line 239
    .end local v18    # "v":J
    :goto_1
    move-object/from16 v0, p0

    iput-wide v12, v0, Lio/reactivex/internal/subscriptions/SubscriptionArbiter;->requested:J

    .line 242
    .end local v16    # "u":J
    :cond_9
    if-eqz v10, :cond_c

    .line 243
    if-eqz v4, :cond_a

    .line 244
    invoke-interface {v4}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 246
    :cond_a
    move-object/from16 v0, p0

    iput-object v10, v0, Lio/reactivex/internal/subscriptions/SubscriptionArbiter;->actual:Lorg/reactivestreams/Subscription;

    .line 247
    const-wide/16 v20, 0x0

    cmp-long v20, v12, v20

    if-eqz v20, :cond_5

    .line 248
    invoke-static {v14, v15, v12, v13}, Lio/reactivex/internal/util/BackpressureHelper;->addCap(JJ)J

    move-result-wide v14

    .line 249
    move-object v11, v10

    goto :goto_0

    .line 237
    .restart local v16    # "u":J
    :cond_b
    move-wide/from16 v12, v16

    goto :goto_1

    .line 251
    .end local v16    # "u":J
    :cond_c
    if-eqz v4, :cond_5

    const-wide/16 v20, 0x0

    cmp-long v20, v8, v20

    if-eqz v20, :cond_5

    .line 252
    invoke-static {v14, v15, v8, v9}, Lio/reactivex/internal/util/BackpressureHelper;->addCap(JJ)J

    move-result-wide v14

    .line 253
    move-object v11, v4

    goto :goto_0
.end method

.method public final isCancelled()Z
    .locals 1

    .prologue
    .line 280
    iget-boolean v0, p0, Lio/reactivex/internal/subscriptions/SubscriptionArbiter;->cancelled:Z

    return v0
.end method

.method public final isUnbounded()Z
    .locals 1

    .prologue
    .line 272
    iget-boolean v0, p0, Lio/reactivex/internal/subscriptions/SubscriptionArbiter;->unbounded:Z

    return v0
.end method

.method public final produced(J)V
    .locals 7
    .param p1, "n"    # J

    .prologue
    .line 145
    iget-boolean v4, p0, Lio/reactivex/internal/subscriptions/SubscriptionArbiter;->unbounded:Z

    if-eqz v4, :cond_1

    .line 172
    :cond_0
    :goto_0
    return-void

    .line 148
    :cond_1
    invoke-virtual {p0}, Lio/reactivex/internal/subscriptions/SubscriptionArbiter;->get()I

    move-result v4

    if-nez v4, :cond_4

    const/4 v4, 0x0

    const/4 v5, 0x1

    invoke-virtual {p0, v4, v5}, Lio/reactivex/internal/subscriptions/SubscriptionArbiter;->compareAndSet(II)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 149
    iget-wide v0, p0, Lio/reactivex/internal/subscriptions/SubscriptionArbiter;->requested:J

    .line 151
    .local v0, "r":J
    const-wide v4, 0x7fffffffffffffffL

    cmp-long v4, v0, v4

    if-eqz v4, :cond_3

    .line 152
    sub-long v2, v0, p1

    .line 153
    .local v2, "u":J
    const-wide/16 v4, 0x0

    cmp-long v4, v2, v4

    if-gez v4, :cond_2

    .line 154
    invoke-static {v2, v3}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->reportMoreProduced(J)V

    .line 155
    const-wide/16 v2, 0x0

    .line 157
    :cond_2
    iput-wide v2, p0, Lio/reactivex/internal/subscriptions/SubscriptionArbiter;->requested:J

    .line 160
    .end local v2    # "u":J
    :cond_3
    invoke-virtual {p0}, Lio/reactivex/internal/subscriptions/SubscriptionArbiter;->decrementAndGet()I

    move-result v4

    if-eqz v4, :cond_0

    .line 164
    invoke-virtual {p0}, Lio/reactivex/internal/subscriptions/SubscriptionArbiter;->drainLoop()V

    goto :goto_0

    .line 169
    .end local v0    # "r":J
    :cond_4
    iget-object v4, p0, Lio/reactivex/internal/subscriptions/SubscriptionArbiter;->missedProduced:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-static {v4, p1, p2}, Lio/reactivex/internal/util/BackpressureHelper;->add(Ljava/util/concurrent/atomic/AtomicLong;J)J

    .line 171
    invoke-virtual {p0}, Lio/reactivex/internal/subscriptions/SubscriptionArbiter;->drain()V

    goto :goto_0
.end method

.method public final request(J)V
    .locals 9
    .param p1, "n"    # J

    .prologue
    const-wide v6, 0x7fffffffffffffffL

    const/4 v4, 0x1

    .line 111
    invoke-static {p1, p2}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->validate(J)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 112
    iget-boolean v1, p0, Lio/reactivex/internal/subscriptions/SubscriptionArbiter;->unbounded:Z

    if-eqz v1, :cond_1

    .line 142
    :cond_0
    :goto_0
    return-void

    .line 115
    :cond_1
    invoke-virtual {p0}, Lio/reactivex/internal/subscriptions/SubscriptionArbiter;->get()I

    move-result v1

    if-nez v1, :cond_4

    const/4 v1, 0x0

    invoke-virtual {p0, v1, v4}, Lio/reactivex/internal/subscriptions/SubscriptionArbiter;->compareAndSet(II)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 116
    iget-wide v2, p0, Lio/reactivex/internal/subscriptions/SubscriptionArbiter;->requested:J

    .line 118
    .local v2, "r":J
    cmp-long v1, v2, v6

    if-eqz v1, :cond_2

    .line 119
    invoke-static {v2, v3, p1, p2}, Lio/reactivex/internal/util/BackpressureHelper;->addCap(JJ)J

    move-result-wide v2

    .line 120
    iput-wide v2, p0, Lio/reactivex/internal/subscriptions/SubscriptionArbiter;->requested:J

    .line 121
    cmp-long v1, v2, v6

    if-nez v1, :cond_2

    .line 122
    iput-boolean v4, p0, Lio/reactivex/internal/subscriptions/SubscriptionArbiter;->unbounded:Z

    .line 125
    :cond_2
    iget-object v0, p0, Lio/reactivex/internal/subscriptions/SubscriptionArbiter;->actual:Lorg/reactivestreams/Subscription;

    .line 127
    .local v0, "a":Lorg/reactivestreams/Subscription;
    invoke-virtual {p0}, Lio/reactivex/internal/subscriptions/SubscriptionArbiter;->decrementAndGet()I

    move-result v1

    if-eqz v1, :cond_3

    .line 128
    invoke-virtual {p0}, Lio/reactivex/internal/subscriptions/SubscriptionArbiter;->drainLoop()V

    .line 131
    :cond_3
    if-eqz v0, :cond_0

    .line 132
    invoke-interface {v0, p1, p2}, Lorg/reactivestreams/Subscription;->request(J)V

    goto :goto_0

    .line 138
    .end local v0    # "a":Lorg/reactivestreams/Subscription;
    .end local v2    # "r":J
    :cond_4
    iget-object v1, p0, Lio/reactivex/internal/subscriptions/SubscriptionArbiter;->missedRequested:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-static {v1, p1, p2}, Lio/reactivex/internal/util/BackpressureHelper;->add(Ljava/util/concurrent/atomic/AtomicLong;J)J

    .line 140
    invoke-virtual {p0}, Lio/reactivex/internal/subscriptions/SubscriptionArbiter;->drain()V

    goto :goto_0
.end method

.method public final setSubscription(Lorg/reactivestreams/Subscription;)V
    .locals 6
    .param p1, "s"    # Lorg/reactivestreams/Subscription;

    .prologue
    .line 73
    iget-boolean v1, p0, Lio/reactivex/internal/subscriptions/SubscriptionArbiter;->cancelled:Z

    if-eqz v1, :cond_1

    .line 74
    invoke-interface {p1}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 107
    :cond_0
    :goto_0
    return-void

    .line 78
    :cond_1
    const-string/jumbo v1, "s is null"

    invoke-static {p1, v1}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 80
    invoke-virtual {p0}, Lio/reactivex/internal/subscriptions/SubscriptionArbiter;->get()I

    move-result v1

    if-nez v1, :cond_4

    const/4 v1, 0x0

    const/4 v4, 0x1

    invoke-virtual {p0, v1, v4}, Lio/reactivex/internal/subscriptions/SubscriptionArbiter;->compareAndSet(II)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 81
    iget-object v0, p0, Lio/reactivex/internal/subscriptions/SubscriptionArbiter;->actual:Lorg/reactivestreams/Subscription;

    .line 83
    .local v0, "a":Lorg/reactivestreams/Subscription;
    if-eqz v0, :cond_2

    .line 84
    invoke-interface {v0}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 87
    :cond_2
    iput-object p1, p0, Lio/reactivex/internal/subscriptions/SubscriptionArbiter;->actual:Lorg/reactivestreams/Subscription;

    .line 89
    iget-wide v2, p0, Lio/reactivex/internal/subscriptions/SubscriptionArbiter;->requested:J

    .line 91
    .local v2, "r":J
    invoke-virtual {p0}, Lio/reactivex/internal/subscriptions/SubscriptionArbiter;->decrementAndGet()I

    move-result v1

    if-eqz v1, :cond_3

    .line 92
    invoke-virtual {p0}, Lio/reactivex/internal/subscriptions/SubscriptionArbiter;->drainLoop()V

    .line 95
    :cond_3
    const-wide/16 v4, 0x0

    cmp-long v1, v2, v4

    if-eqz v1, :cond_0

    .line 96
    invoke-interface {p1, v2, v3}, Lorg/reactivestreams/Subscription;->request(J)V

    goto :goto_0

    .line 102
    .end local v0    # "a":Lorg/reactivestreams/Subscription;
    .end local v2    # "r":J
    :cond_4
    iget-object v1, p0, Lio/reactivex/internal/subscriptions/SubscriptionArbiter;->missedSubscription:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1, p1}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/reactivestreams/Subscription;

    .line 103
    .restart local v0    # "a":Lorg/reactivestreams/Subscription;
    if-eqz v0, :cond_5

    .line 104
    invoke-interface {v0}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 106
    :cond_5
    invoke-virtual {p0}, Lio/reactivex/internal/subscriptions/SubscriptionArbiter;->drain()V

    goto :goto_0
.end method
