.class final Lio/reactivex/internal/operators/flowable/FlowableFromIterable$IteratorSubscription;
.super Lio/reactivex/internal/operators/flowable/FlowableFromIterable$BaseRangeSubscription;
.source "FlowableFromIterable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/flowable/FlowableFromIterable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "IteratorSubscription"
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
.field final actual:Lorg/reactivestreams/Subscriber;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/reactivestreams/Subscriber",
            "<-TT;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lorg/reactivestreams/Subscriber;Ljava/util/Iterator;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber",
            "<-TT;>;",
            "Ljava/util/Iterator",
            "<+TT;>;)V"
        }
    .end annotation

    .prologue
    .line 150
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableFromIterable$IteratorSubscription;, "Lio/reactivex/internal/operators/flowable/FlowableFromIterable$IteratorSubscription<TT;>;"
    .local p1, "actual":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    .local p2, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<+TT;>;"
    invoke-direct {p0, p2}, Lio/reactivex/internal/operators/flowable/FlowableFromIterable$BaseRangeSubscription;-><init>(Ljava/util/Iterator;)V

    .line 151
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableFromIterable$IteratorSubscription;->actual:Lorg/reactivestreams/Subscriber;

    .line 152
    return-void
.end method


# virtual methods
.method fastPath()V
    .locals 7

    .prologue
    .line 156
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableFromIterable$IteratorSubscription;, "Lio/reactivex/internal/operators/flowable/FlowableFromIterable$IteratorSubscription<TT;>;"
    iget-object v3, p0, Lio/reactivex/internal/operators/flowable/FlowableFromIterable$IteratorSubscription;->it:Ljava/util/Iterator;

    .line 157
    .local v3, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<+TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableFromIterable$IteratorSubscription;->actual:Lorg/reactivestreams/Subscriber;

    .line 159
    .local v0, "a":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    :cond_0
    iget-boolean v5, p0, Lio/reactivex/internal/operators/flowable/FlowableFromIterable$IteratorSubscription;->cancelled:Z

    if-eqz v5, :cond_2

    .line 203
    :cond_1
    :goto_0
    return-void

    .line 166
    :cond_2
    :try_start_0
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v4

    .line 173
    .local v4, "t":Ljava/lang/Object;, "TT;"
    iget-boolean v5, p0, Lio/reactivex/internal/operators/flowable/FlowableFromIterable$IteratorSubscription;->cancelled:Z

    if-nez v5, :cond_1

    .line 177
    if-nez v4, :cond_3

    .line 178
    new-instance v5, Ljava/lang/NullPointerException;

    const-string/jumbo v6, "Iterator.next() returned a null value"

    invoke-direct {v5, v6}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    invoke-interface {v0, v5}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 167
    .end local v4    # "t":Ljava/lang/Object;, "TT;"
    :catch_0
    move-exception v2

    .line 168
    .local v2, "ex":Ljava/lang/Throwable;
    invoke-static {v2}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 169
    invoke-interface {v0, v2}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 181
    .end local v2    # "ex":Ljava/lang/Throwable;
    .restart local v4    # "t":Ljava/lang/Object;, "TT;"
    :cond_3
    invoke-interface {v0, v4}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 184
    iget-boolean v5, p0, Lio/reactivex/internal/operators/flowable/FlowableFromIterable$IteratorSubscription;->cancelled:Z

    if-nez v5, :cond_1

    .line 191
    :try_start_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    move-result v1

    .line 199
    .local v1, "b":Z
    if-nez v1, :cond_0

    .line 200
    iget-boolean v5, p0, Lio/reactivex/internal/operators/flowable/FlowableFromIterable$IteratorSubscription;->cancelled:Z

    if-nez v5, :cond_1

    .line 201
    invoke-interface {v0}, Lorg/reactivestreams/Subscriber;->onComplete()V

    goto :goto_0

    .line 192
    .end local v1    # "b":Z
    :catch_1
    move-exception v2

    .line 193
    .restart local v2    # "ex":Ljava/lang/Throwable;
    invoke-static {v2}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 194
    invoke-interface {v0, v2}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method slowPath(J)V
    .locals 11
    .param p1, "r"    # J

    .prologue
    .line 210
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableFromIterable$IteratorSubscription;, "Lio/reactivex/internal/operators/flowable/FlowableFromIterable$IteratorSubscription<TT;>;"
    const-wide/16 v2, 0x0

    .line 211
    .local v2, "e":J
    iget-object v5, p0, Lio/reactivex/internal/operators/flowable/FlowableFromIterable$IteratorSubscription;->it:Ljava/util/Iterator;

    .line 212
    .local v5, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<+TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableFromIterable$IteratorSubscription;->actual:Lorg/reactivestreams/Subscriber;

    .line 216
    .local v0, "a":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    :cond_0
    :goto_0
    cmp-long v7, v2, p1

    if-eqz v7, :cond_5

    .line 218
    iget-boolean v7, p0, Lio/reactivex/internal/operators/flowable/FlowableFromIterable$IteratorSubscription;->cancelled:Z

    if-eqz v7, :cond_2

    .line 271
    :cond_1
    :goto_1
    return-void

    .line 225
    :cond_2
    :try_start_0
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v6

    .line 232
    .local v6, "t":Ljava/lang/Object;, "TT;"
    iget-boolean v7, p0, Lio/reactivex/internal/operators/flowable/FlowableFromIterable$IteratorSubscription;->cancelled:Z

    if-nez v7, :cond_1

    .line 236
    if-nez v6, :cond_3

    .line 237
    new-instance v7, Ljava/lang/NullPointerException;

    const-string/jumbo v8, "Iterator.next() returned a null value"

    invoke-direct {v7, v8}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    invoke-interface {v0, v7}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_1

    .line 226
    .end local v6    # "t":Ljava/lang/Object;, "TT;"
    :catch_0
    move-exception v4

    .line 227
    .local v4, "ex":Ljava/lang/Throwable;
    invoke-static {v4}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 228
    invoke-interface {v0, v4}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_1

    .line 240
    .end local v4    # "ex":Ljava/lang/Throwable;
    .restart local v6    # "t":Ljava/lang/Object;, "TT;"
    :cond_3
    invoke-interface {v0, v6}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 243
    iget-boolean v7, p0, Lio/reactivex/internal/operators/flowable/FlowableFromIterable$IteratorSubscription;->cancelled:Z

    if-nez v7, :cond_1

    .line 250
    :try_start_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    move-result v1

    .line 257
    .local v1, "b":Z
    if-nez v1, :cond_4

    .line 258
    iget-boolean v7, p0, Lio/reactivex/internal/operators/flowable/FlowableFromIterable$IteratorSubscription;->cancelled:Z

    if-nez v7, :cond_1

    .line 259
    invoke-interface {v0}, Lorg/reactivestreams/Subscriber;->onComplete()V

    goto :goto_1

    .line 251
    .end local v1    # "b":Z
    :catch_1
    move-exception v4

    .line 252
    .restart local v4    # "ex":Ljava/lang/Throwable;
    invoke-static {v4}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 253
    invoke-interface {v0, v4}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_1

    .line 264
    .end local v4    # "ex":Ljava/lang/Throwable;
    .restart local v1    # "b":Z
    :cond_4
    const-wide/16 v8, 0x1

    add-long/2addr v2, v8

    .line 265
    goto :goto_0

    .line 267
    .end local v1    # "b":Z
    .end local v6    # "t":Ljava/lang/Object;, "TT;"
    :cond_5
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableFromIterable$IteratorSubscription;->get()J

    move-result-wide p1

    .line 268
    cmp-long v7, v2, p1

    if-nez v7, :cond_0

    .line 269
    neg-long v8, v2

    invoke-virtual {p0, v8, v9}, Lio/reactivex/internal/operators/flowable/FlowableFromIterable$IteratorSubscription;->addAndGet(J)J

    move-result-wide p1

    .line 270
    const-wide/16 v8, 0x0

    cmp-long v7, p1, v8

    if-eqz v7, :cond_1

    .line 273
    const-wide/16 v2, 0x0

    goto :goto_0
.end method
