.class final Lio/reactivex/internal/operators/flowable/FlowableFromIterable$IteratorConditionalSubscription;
.super Lio/reactivex/internal/operators/flowable/FlowableFromIterable$BaseRangeSubscription;
.source "FlowableFromIterable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/flowable/FlowableFromIterable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "IteratorConditionalSubscription"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/internal/operators/flowable/FlowableFromIterable$BaseRangeSubscription",
        "<TT;>;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x53954cbe186540ffL


# instance fields
.field final actual:Lio/reactivex/internal/fuseable/ConditionalSubscriber;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/internal/fuseable/ConditionalSubscriber",
            "<-TT;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lio/reactivex/internal/fuseable/ConditionalSubscriber;Ljava/util/Iterator;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/internal/fuseable/ConditionalSubscriber",
            "<-TT;>;",
            "Ljava/util/Iterator",
            "<+TT;>;)V"
        }
    .end annotation

    .prologue
    .line 288
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableFromIterable$IteratorConditionalSubscription;, "Lio/reactivex/internal/operators/flowable/FlowableFromIterable$IteratorConditionalSubscription<TT;>;"
    .local p1, "actual":Lio/reactivex/internal/fuseable/ConditionalSubscriber;, "Lio/reactivex/internal/fuseable/ConditionalSubscriber<-TT;>;"
    .local p2, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<+TT;>;"
    invoke-direct {p0, p2}, Lio/reactivex/internal/operators/flowable/FlowableFromIterable$BaseRangeSubscription;-><init>(Ljava/util/Iterator;)V

    .line 289
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableFromIterable$IteratorConditionalSubscription;->actual:Lio/reactivex/internal/fuseable/ConditionalSubscriber;

    .line 290
    return-void
.end method


# virtual methods
.method fastPath()V
    .locals 7

    .prologue
    .line 294
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableFromIterable$IteratorConditionalSubscription;, "Lio/reactivex/internal/operators/flowable/FlowableFromIterable$IteratorConditionalSubscription<TT;>;"
    iget-object v3, p0, Lio/reactivex/internal/operators/flowable/FlowableFromIterable$IteratorConditionalSubscription;->it:Ljava/util/Iterator;

    .line 295
    .local v3, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<+TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableFromIterable$IteratorConditionalSubscription;->actual:Lio/reactivex/internal/fuseable/ConditionalSubscriber;

    .line 297
    .local v0, "a":Lio/reactivex/internal/fuseable/ConditionalSubscriber;, "Lio/reactivex/internal/fuseable/ConditionalSubscriber<-TT;>;"
    :cond_0
    iget-boolean v5, p0, Lio/reactivex/internal/operators/flowable/FlowableFromIterable$IteratorConditionalSubscription;->cancelled:Z

    if-eqz v5, :cond_2

    .line 340
    :cond_1
    :goto_0
    return-void

    .line 304
    :cond_2
    :try_start_0
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v4

    .line 311
    .local v4, "t":Ljava/lang/Object;, "TT;"
    iget-boolean v5, p0, Lio/reactivex/internal/operators/flowable/FlowableFromIterable$IteratorConditionalSubscription;->cancelled:Z

    if-nez v5, :cond_1

    .line 315
    if-nez v4, :cond_3

    .line 316
    new-instance v5, Ljava/lang/NullPointerException;

    const-string/jumbo v6, "Iterator.next() returned a null value"

    invoke-direct {v5, v6}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    invoke-interface {v0, v5}, Lio/reactivex/internal/fuseable/ConditionalSubscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 305
    .end local v4    # "t":Ljava/lang/Object;, "TT;"
    :catch_0
    move-exception v2

    .line 306
    .local v2, "ex":Ljava/lang/Throwable;
    invoke-static {v2}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 307
    invoke-interface {v0, v2}, Lio/reactivex/internal/fuseable/ConditionalSubscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 319
    .end local v2    # "ex":Ljava/lang/Throwable;
    .restart local v4    # "t":Ljava/lang/Object;, "TT;"
    :cond_3
    invoke-interface {v0, v4}, Lio/reactivex/internal/fuseable/ConditionalSubscriber;->tryOnNext(Ljava/lang/Object;)Z

    .line 322
    iget-boolean v5, p0, Lio/reactivex/internal/operators/flowable/FlowableFromIterable$IteratorConditionalSubscription;->cancelled:Z

    if-nez v5, :cond_1

    .line 329
    :try_start_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    move-result v1

    .line 336
    .local v1, "b":Z
    if-nez v1, :cond_0

    .line 337
    iget-boolean v5, p0, Lio/reactivex/internal/operators/flowable/FlowableFromIterable$IteratorConditionalSubscription;->cancelled:Z

    if-nez v5, :cond_1

    .line 338
    invoke-interface {v0}, Lio/reactivex/internal/fuseable/ConditionalSubscriber;->onComplete()V

    goto :goto_0

    .line 330
    .end local v1    # "b":Z
    :catch_1
    move-exception v2

    .line 331
    .restart local v2    # "ex":Ljava/lang/Throwable;
    invoke-static {v2}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 332
    invoke-interface {v0, v2}, Lio/reactivex/internal/fuseable/ConditionalSubscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method slowPath(J)V
    .locals 11
    .param p1, "r"    # J

    .prologue
    .line 347
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableFromIterable$IteratorConditionalSubscription;, "Lio/reactivex/internal/operators/flowable/FlowableFromIterable$IteratorConditionalSubscription<TT;>;"
    const-wide/16 v2, 0x0

    .line 348
    .local v2, "e":J
    iget-object v6, p0, Lio/reactivex/internal/operators/flowable/FlowableFromIterable$IteratorConditionalSubscription;->it:Ljava/util/Iterator;

    .line 349
    .local v6, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<+TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableFromIterable$IteratorConditionalSubscription;->actual:Lio/reactivex/internal/fuseable/ConditionalSubscriber;

    .line 353
    .local v0, "a":Lio/reactivex/internal/fuseable/ConditionalSubscriber;, "Lio/reactivex/internal/fuseable/ConditionalSubscriber<-TT;>;"
    :cond_0
    :goto_0
    cmp-long v8, v2, p1

    if-eqz v8, :cond_5

    .line 355
    iget-boolean v8, p0, Lio/reactivex/internal/operators/flowable/FlowableFromIterable$IteratorConditionalSubscription;->cancelled:Z

    if-eqz v8, :cond_2

    .line 411
    :cond_1
    :goto_1
    return-void

    .line 362
    :cond_2
    :try_start_0
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v7

    .line 369
    .local v7, "t":Ljava/lang/Object;, "TT;"
    iget-boolean v8, p0, Lio/reactivex/internal/operators/flowable/FlowableFromIterable$IteratorConditionalSubscription;->cancelled:Z

    if-nez v8, :cond_1

    .line 374
    if-nez v7, :cond_3

    .line 375
    new-instance v8, Ljava/lang/NullPointerException;

    const-string/jumbo v9, "Iterator.next() returned a null value"

    invoke-direct {v8, v9}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    invoke-interface {v0, v8}, Lio/reactivex/internal/fuseable/ConditionalSubscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_1

    .line 363
    .end local v7    # "t":Ljava/lang/Object;, "TT;"
    :catch_0
    move-exception v4

    .line 364
    .local v4, "ex":Ljava/lang/Throwable;
    invoke-static {v4}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 365
    invoke-interface {v0, v4}, Lio/reactivex/internal/fuseable/ConditionalSubscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_1

    .line 378
    .end local v4    # "ex":Ljava/lang/Throwable;
    .restart local v7    # "t":Ljava/lang/Object;, "TT;"
    :cond_3
    invoke-interface {v0, v7}, Lio/reactivex/internal/fuseable/ConditionalSubscriber;->tryOnNext(Ljava/lang/Object;)Z

    move-result v1

    .line 381
    .local v1, "b":Z
    iget-boolean v8, p0, Lio/reactivex/internal/operators/flowable/FlowableFromIterable$IteratorConditionalSubscription;->cancelled:Z

    if-nez v8, :cond_1

    .line 388
    :try_start_1
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    move-result v5

    .line 395
    .local v5, "hasNext":Z
    if-nez v5, :cond_4

    .line 396
    iget-boolean v8, p0, Lio/reactivex/internal/operators/flowable/FlowableFromIterable$IteratorConditionalSubscription;->cancelled:Z

    if-nez v8, :cond_1

    .line 397
    invoke-interface {v0}, Lio/reactivex/internal/fuseable/ConditionalSubscriber;->onComplete()V

    goto :goto_1

    .line 389
    .end local v5    # "hasNext":Z
    :catch_1
    move-exception v4

    .line 390
    .restart local v4    # "ex":Ljava/lang/Throwable;
    invoke-static {v4}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 391
    invoke-interface {v0, v4}, Lio/reactivex/internal/fuseable/ConditionalSubscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_1

    .line 402
    .end local v4    # "ex":Ljava/lang/Throwable;
    .restart local v5    # "hasNext":Z
    :cond_4
    if-eqz v1, :cond_0

    .line 403
    const-wide/16 v8, 0x1

    add-long/2addr v2, v8

    goto :goto_0

    .line 407
    .end local v1    # "b":Z
    .end local v5    # "hasNext":Z
    .end local v7    # "t":Ljava/lang/Object;, "TT;"
    :cond_5
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableFromIterable$IteratorConditionalSubscription;->get()J

    move-result-wide p1

    .line 408
    cmp-long v8, v2, p1

    if-nez v8, :cond_0

    .line 409
    neg-long v8, v2

    invoke-virtual {p0, v8, v9}, Lio/reactivex/internal/operators/flowable/FlowableFromIterable$IteratorConditionalSubscription;->addAndGet(J)J

    move-result-wide p1

    .line 410
    const-wide/16 v8, 0x0

    cmp-long v8, p1, v8

    if-eqz v8, :cond_1

    .line 413
    const-wide/16 v2, 0x0

    goto :goto_0
.end method
