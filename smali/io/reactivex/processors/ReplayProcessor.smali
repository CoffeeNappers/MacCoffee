.class public final Lio/reactivex/processors/ReplayProcessor;
.super Lio/reactivex/processors/FlowableProcessor;
.source "ReplayProcessor.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/reactivex/processors/ReplayProcessor$SizeAndTimeBoundReplayBuffer;,
        Lio/reactivex/processors/ReplayProcessor$SizeBoundReplayBuffer;,
        Lio/reactivex/processors/ReplayProcessor$TimedNode;,
        Lio/reactivex/processors/ReplayProcessor$Node;,
        Lio/reactivex/processors/ReplayProcessor$UnboundedReplayBuffer;,
        Lio/reactivex/processors/ReplayProcessor$ReplaySubscription;,
        Lio/reactivex/processors/ReplayProcessor$ReplayBuffer;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/processors/FlowableProcessor",
        "<TT;>;"
    }
.end annotation


# static fields
.field static final EMPTY:[Lio/reactivex/processors/ReplayProcessor$ReplaySubscription;

.field private static final EMPTY_ARRAY:[Ljava/lang/Object;

.field static final TERMINATED:[Lio/reactivex/processors/ReplayProcessor$ReplaySubscription;


# instance fields
.field final buffer:Lio/reactivex/processors/ReplayProcessor$ReplayBuffer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/processors/ReplayProcessor$ReplayBuffer",
            "<TT;>;"
        }
    .end annotation
.end field

.field done:Z

.field final subscribers:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<[",
            "Lio/reactivex/processors/ReplayProcessor$ReplaySubscription",
            "<TT;>;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 66
    new-array v0, v1, [Ljava/lang/Object;

    sput-object v0, Lio/reactivex/processors/ReplayProcessor;->EMPTY_ARRAY:[Ljava/lang/Object;

    .line 75
    new-array v0, v1, [Lio/reactivex/processors/ReplayProcessor$ReplaySubscription;

    sput-object v0, Lio/reactivex/processors/ReplayProcessor;->EMPTY:[Lio/reactivex/processors/ReplayProcessor$ReplaySubscription;

    .line 78
    new-array v0, v1, [Lio/reactivex/processors/ReplayProcessor$ReplaySubscription;

    sput-object v0, Lio/reactivex/processors/ReplayProcessor;->TERMINATED:[Lio/reactivex/processors/ReplayProcessor$ReplaySubscription;

    return-void
.end method

.method constructor <init>(Lio/reactivex/processors/ReplayProcessor$ReplayBuffer;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/processors/ReplayProcessor$ReplayBuffer",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 241
    .local p0, "this":Lio/reactivex/processors/ReplayProcessor;, "Lio/reactivex/processors/ReplayProcessor<TT;>;"
    .local p1, "buffer":Lio/reactivex/processors/ReplayProcessor$ReplayBuffer;, "Lio/reactivex/processors/ReplayProcessor$ReplayBuffer<TT;>;"
    invoke-direct {p0}, Lio/reactivex/processors/FlowableProcessor;-><init>()V

    .line 242
    iput-object p1, p0, Lio/reactivex/processors/ReplayProcessor;->buffer:Lio/reactivex/processors/ReplayProcessor$ReplayBuffer;

    .line 243
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    sget-object v1, Lio/reactivex/processors/ReplayProcessor;->EMPTY:[Lio/reactivex/processors/ReplayProcessor$ReplaySubscription;

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lio/reactivex/processors/ReplayProcessor;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    .line 244
    return-void
.end method

.method public static create()Lio/reactivex/processors/ReplayProcessor;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">()",
            "Lio/reactivex/processors/ReplayProcessor",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .prologue
    .line 95
    new-instance v0, Lio/reactivex/processors/ReplayProcessor;

    new-instance v1, Lio/reactivex/processors/ReplayProcessor$UnboundedReplayBuffer;

    const/16 v2, 0x10

    invoke-direct {v1, v2}, Lio/reactivex/processors/ReplayProcessor$UnboundedReplayBuffer;-><init>(I)V

    invoke-direct {v0, v1}, Lio/reactivex/processors/ReplayProcessor;-><init>(Lio/reactivex/processors/ReplayProcessor$ReplayBuffer;)V

    return-object v0
.end method

.method public static create(I)Lio/reactivex/processors/ReplayProcessor;
    .locals 2
    .param p0, "capacityHint"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(I)",
            "Lio/reactivex/processors/ReplayProcessor",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .prologue
    .line 115
    new-instance v0, Lio/reactivex/processors/ReplayProcessor;

    new-instance v1, Lio/reactivex/processors/ReplayProcessor$UnboundedReplayBuffer;

    invoke-direct {v1, p0}, Lio/reactivex/processors/ReplayProcessor$UnboundedReplayBuffer;-><init>(I)V

    invoke-direct {v0, v1}, Lio/reactivex/processors/ReplayProcessor;-><init>(Lio/reactivex/processors/ReplayProcessor$ReplayBuffer;)V

    return-object v0
.end method

.method static createUnbounded()Lio/reactivex/processors/ReplayProcessor;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">()",
            "Lio/reactivex/processors/ReplayProcessor",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 157
    new-instance v0, Lio/reactivex/processors/ReplayProcessor;

    new-instance v1, Lio/reactivex/processors/ReplayProcessor$SizeBoundReplayBuffer;

    const v2, 0x7fffffff

    invoke-direct {v1, v2}, Lio/reactivex/processors/ReplayProcessor$SizeBoundReplayBuffer;-><init>(I)V

    invoke-direct {v0, v1}, Lio/reactivex/processors/ReplayProcessor;-><init>(Lio/reactivex/processors/ReplayProcessor$ReplayBuffer;)V

    return-object v0
.end method

.method public static createWithSize(I)Lio/reactivex/processors/ReplayProcessor;
    .locals 2
    .param p0, "maxSize"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(I)",
            "Lio/reactivex/processors/ReplayProcessor",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .prologue
    .line 140
    new-instance v0, Lio/reactivex/processors/ReplayProcessor;

    new-instance v1, Lio/reactivex/processors/ReplayProcessor$SizeBoundReplayBuffer;

    invoke-direct {v1, p0}, Lio/reactivex/processors/ReplayProcessor$SizeBoundReplayBuffer;-><init>(I)V

    invoke-direct {v0, v1}, Lio/reactivex/processors/ReplayProcessor;-><init>(Lio/reactivex/processors/ReplayProcessor$ReplayBuffer;)V

    return-object v0
.end method

.method public static createWithTime(JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;)Lio/reactivex/processors/ReplayProcessor;
    .locals 8
    .param p0, "maxAge"    # J
    .param p2, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p3, "scheduler"    # Lio/reactivex/Scheduler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(J",
            "Ljava/util/concurrent/TimeUnit;",
            "Lio/reactivex/Scheduler;",
            ")",
            "Lio/reactivex/processors/ReplayProcessor",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .prologue
    .line 194
    new-instance v6, Lio/reactivex/processors/ReplayProcessor;

    new-instance v0, Lio/reactivex/processors/ReplayProcessor$SizeAndTimeBoundReplayBuffer;

    const v1, 0x7fffffff

    move-wide v2, p0

    move-object v4, p2

    move-object v5, p3

    invoke-direct/range {v0 .. v5}, Lio/reactivex/processors/ReplayProcessor$SizeAndTimeBoundReplayBuffer;-><init>(IJLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;)V

    invoke-direct {v6, v0}, Lio/reactivex/processors/ReplayProcessor;-><init>(Lio/reactivex/processors/ReplayProcessor$ReplayBuffer;)V

    return-object v6
.end method

.method public static createWithTimeAndSize(JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;I)Lio/reactivex/processors/ReplayProcessor;
    .locals 8
    .param p0, "maxAge"    # J
    .param p2, "unit"    # Ljava/util/concurrent/TimeUnit;
    .param p3, "scheduler"    # Lio/reactivex/Scheduler;
    .param p4, "maxSize"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(J",
            "Ljava/util/concurrent/TimeUnit;",
            "Lio/reactivex/Scheduler;",
            "I)",
            "Lio/reactivex/processors/ReplayProcessor",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .prologue
    .line 233
    new-instance v6, Lio/reactivex/processors/ReplayProcessor;

    new-instance v0, Lio/reactivex/processors/ReplayProcessor$SizeAndTimeBoundReplayBuffer;

    move v1, p4

    move-wide v2, p0

    move-object v4, p2

    move-object v5, p3

    invoke-direct/range {v0 .. v5}, Lio/reactivex/processors/ReplayProcessor$SizeAndTimeBoundReplayBuffer;-><init>(IJLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;)V

    invoke-direct {v6, v0}, Lio/reactivex/processors/ReplayProcessor;-><init>(Lio/reactivex/processors/ReplayProcessor$ReplayBuffer;)V

    return-object v6
.end method


# virtual methods
.method add(Lio/reactivex/processors/ReplayProcessor$ReplaySubscription;)Z
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/processors/ReplayProcessor$ReplaySubscription",
            "<TT;>;)Z"
        }
    .end annotation

    .prologue
    .local p0, "this":Lio/reactivex/processors/ReplayProcessor;, "Lio/reactivex/processors/ReplayProcessor<TT;>;"
    .local p1, "rs":Lio/reactivex/processors/ReplayProcessor$ReplaySubscription;, "Lio/reactivex/processors/ReplayProcessor$ReplaySubscription<TT;>;"
    const/4 v3, 0x0

    .line 410
    :cond_0
    iget-object v4, p0, Lio/reactivex/processors/ReplayProcessor;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/reactivex/processors/ReplayProcessor$ReplaySubscription;

    .line 411
    .local v0, "a":[Lio/reactivex/processors/ReplayProcessor$ReplaySubscription;, "[Lio/reactivex/processors/ReplayProcessor$ReplaySubscription<TT;>;"
    sget-object v4, Lio/reactivex/processors/ReplayProcessor;->TERMINATED:[Lio/reactivex/processors/ReplayProcessor$ReplaySubscription;

    if-ne v0, v4, :cond_1

    .line 420
    :goto_0
    return v3

    .line 414
    :cond_1
    array-length v2, v0

    .line 416
    .local v2, "len":I
    add-int/lit8 v4, v2, 0x1

    new-array v1, v4, [Lio/reactivex/processors/ReplayProcessor$ReplaySubscription;

    .line 417
    .local v1, "b":[Lio/reactivex/processors/ReplayProcessor$ReplaySubscription;, "[Lio/reactivex/processors/ReplayProcessor$ReplaySubscription<TT;>;"
    invoke-static {v0, v3, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 418
    aput-object p1, v1, v2

    .line 419
    iget-object v4, p0, Lio/reactivex/processors/ReplayProcessor;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v4, v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 420
    const/4 v3, 0x1

    goto :goto_0
.end method

.method public getThrowable()Ljava/lang/Throwable;
    .locals 2

    .prologue
    .line 339
    .local p0, "this":Lio/reactivex/processors/ReplayProcessor;, "Lio/reactivex/processors/ReplayProcessor<TT;>;"
    iget-object v1, p0, Lio/reactivex/processors/ReplayProcessor;->buffer:Lio/reactivex/processors/ReplayProcessor$ReplayBuffer;

    invoke-interface {v1}, Lio/reactivex/processors/ReplayProcessor$ReplayBuffer;->get()Ljava/lang/Object;

    move-result-object v0

    .line 340
    .local v0, "o":Ljava/lang/Object;
    invoke-static {v0}, Lio/reactivex/internal/util/NotificationLite;->isError(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 341
    invoke-static {v0}, Lio/reactivex/internal/util/NotificationLite;->getError(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object v1

    .line 343
    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public getValue()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .line 352
    .local p0, "this":Lio/reactivex/processors/ReplayProcessor;, "Lio/reactivex/processors/ReplayProcessor<TT;>;"
    iget-object v0, p0, Lio/reactivex/processors/ReplayProcessor;->buffer:Lio/reactivex/processors/ReplayProcessor$ReplayBuffer;

    invoke-interface {v0}, Lio/reactivex/processors/ReplayProcessor$ReplayBuffer;->getValue()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getValues()[Ljava/lang/Object;
    .locals 3

    .prologue
    .line 362
    .local p0, "this":Lio/reactivex/processors/ReplayProcessor;, "Lio/reactivex/processors/ReplayProcessor<TT;>;"
    sget-object v0, Lio/reactivex/processors/ReplayProcessor;->EMPTY_ARRAY:[Ljava/lang/Object;

    check-cast v0, [Ljava/lang/Object;

    .line 363
    .local v0, "a":[Ljava/lang/Object;, "[TT;"
    invoke-virtual {p0, v0}, Lio/reactivex/processors/ReplayProcessor;->getValues([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    .line 364
    .local v1, "b":[Ljava/lang/Object;, "[TT;"
    sget-object v2, Lio/reactivex/processors/ReplayProcessor;->EMPTY_ARRAY:[Ljava/lang/Object;

    if-ne v1, v2, :cond_0

    .line 365
    const/4 v2, 0x0

    new-array v1, v2, [Ljava/lang/Object;

    .line 367
    .end local v1    # "b":[Ljava/lang/Object;, "[TT;"
    :cond_0
    return-object v1
.end method

.method public getValues([Ljava/lang/Object;)[Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([TT;)[TT;"
        }
    .end annotation

    .prologue
    .line 380
    .local p0, "this":Lio/reactivex/processors/ReplayProcessor;, "Lio/reactivex/processors/ReplayProcessor<TT;>;"
    .local p1, "array":[Ljava/lang/Object;, "[TT;"
    iget-object v0, p0, Lio/reactivex/processors/ReplayProcessor;->buffer:Lio/reactivex/processors/ReplayProcessor$ReplayBuffer;

    invoke-interface {v0, p1}, Lio/reactivex/processors/ReplayProcessor$ReplayBuffer;->getValues([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public hasComplete()Z
    .locals 2

    .prologue
    .line 385
    .local p0, "this":Lio/reactivex/processors/ReplayProcessor;, "Lio/reactivex/processors/ReplayProcessor<TT;>;"
    iget-object v1, p0, Lio/reactivex/processors/ReplayProcessor;->buffer:Lio/reactivex/processors/ReplayProcessor$ReplayBuffer;

    invoke-interface {v1}, Lio/reactivex/processors/ReplayProcessor$ReplayBuffer;->get()Ljava/lang/Object;

    move-result-object v0

    .line 386
    .local v0, "o":Ljava/lang/Object;
    invoke-static {v0}, Lio/reactivex/internal/util/NotificationLite;->isComplete(Ljava/lang/Object;)Z

    move-result v1

    return v1
.end method

.method public hasSubscribers()Z
    .locals 1

    .prologue
    .line 330
    .local p0, "this":Lio/reactivex/processors/ReplayProcessor;, "Lio/reactivex/processors/ReplayProcessor<TT;>;"
    iget-object v0, p0, Lio/reactivex/processors/ReplayProcessor;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/reactivex/processors/ReplayProcessor$ReplaySubscription;

    array-length v0, v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public hasThrowable()Z
    .locals 2

    .prologue
    .line 391
    .local p0, "this":Lio/reactivex/processors/ReplayProcessor;, "Lio/reactivex/processors/ReplayProcessor<TT;>;"
    iget-object v1, p0, Lio/reactivex/processors/ReplayProcessor;->buffer:Lio/reactivex/processors/ReplayProcessor$ReplayBuffer;

    invoke-interface {v1}, Lio/reactivex/processors/ReplayProcessor$ReplayBuffer;->get()Ljava/lang/Object;

    move-result-object v0

    .line 392
    .local v0, "o":Ljava/lang/Object;
    invoke-static {v0}, Lio/reactivex/internal/util/NotificationLite;->isError(Ljava/lang/Object;)Z

    move-result v1

    return v1
.end method

.method public hasValue()Z
    .locals 1

    .prologue
    .line 401
    .local p0, "this":Lio/reactivex/processors/ReplayProcessor;, "Lio/reactivex/processors/ReplayProcessor<TT;>;"
    iget-object v0, p0, Lio/reactivex/processors/ReplayProcessor;->buffer:Lio/reactivex/processors/ReplayProcessor$ReplayBuffer;

    invoke-interface {v0}, Lio/reactivex/processors/ReplayProcessor$ReplayBuffer;->size()I

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onComplete()V
    .locals 8

    .prologue
    .line 312
    .local p0, "this":Lio/reactivex/processors/ReplayProcessor;, "Lio/reactivex/processors/ReplayProcessor<TT;>;"
    iget-boolean v6, p0, Lio/reactivex/processors/ReplayProcessor;->done:Z

    if-eqz v6, :cond_1

    .line 326
    :cond_0
    return-void

    .line 315
    :cond_1
    const/4 v6, 0x1

    iput-boolean v6, p0, Lio/reactivex/processors/ReplayProcessor;->done:Z

    .line 317
    invoke-static {}, Lio/reactivex/internal/util/NotificationLite;->complete()Ljava/lang/Object;

    move-result-object v4

    .line 319
    .local v4, "o":Ljava/lang/Object;
    iget-object v1, p0, Lio/reactivex/processors/ReplayProcessor;->buffer:Lio/reactivex/processors/ReplayProcessor$ReplayBuffer;

    .line 321
    .local v1, "b":Lio/reactivex/processors/ReplayProcessor$ReplayBuffer;, "Lio/reactivex/processors/ReplayProcessor$ReplayBuffer<TT;>;"
    invoke-interface {v1, v4}, Lio/reactivex/processors/ReplayProcessor$ReplayBuffer;->addFinal(Ljava/lang/Object;)V

    .line 323
    iget-object v6, p0, Lio/reactivex/processors/ReplayProcessor;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    sget-object v7, Lio/reactivex/processors/ReplayProcessor;->TERMINATED:[Lio/reactivex/processors/ReplayProcessor$ReplaySubscription;

    invoke-virtual {v6, v7}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/reactivex/processors/ReplayProcessor$ReplaySubscription;

    .local v0, "arr$":[Lio/reactivex/processors/ReplayProcessor$ReplaySubscription;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_0
    if-ge v2, v3, :cond_0

    aget-object v5, v0, v2

    .line 324
    .local v5, "rs":Lio/reactivex/processors/ReplayProcessor$ReplaySubscription;, "Lio/reactivex/processors/ReplayProcessor$ReplaySubscription<TT;>;"
    invoke-interface {v1, v5}, Lio/reactivex/processors/ReplayProcessor$ReplayBuffer;->replay(Lio/reactivex/processors/ReplayProcessor$ReplaySubscription;)V

    .line 323
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 8
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 290
    .local p0, "this":Lio/reactivex/processors/ReplayProcessor;, "Lio/reactivex/processors/ReplayProcessor<TT;>;"
    if-nez p1, :cond_0

    .line 291
    new-instance p1, Ljava/lang/NullPointerException;

    .end local p1    # "t":Ljava/lang/Throwable;
    const-string/jumbo v6, "onError called with null. Null values are generally not allowed in 2.x operators and sources."

    invoke-direct {p1, v6}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 293
    .restart local p1    # "t":Ljava/lang/Throwable;
    :cond_0
    iget-boolean v6, p0, Lio/reactivex/processors/ReplayProcessor;->done:Z

    if-eqz v6, :cond_2

    .line 294
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    .line 307
    :cond_1
    return-void

    .line 297
    :cond_2
    const/4 v6, 0x1

    iput-boolean v6, p0, Lio/reactivex/processors/ReplayProcessor;->done:Z

    .line 299
    invoke-static {p1}, Lio/reactivex/internal/util/NotificationLite;->error(Ljava/lang/Throwable;)Ljava/lang/Object;

    move-result-object v4

    .line 301
    .local v4, "o":Ljava/lang/Object;
    iget-object v1, p0, Lio/reactivex/processors/ReplayProcessor;->buffer:Lio/reactivex/processors/ReplayProcessor$ReplayBuffer;

    .line 303
    .local v1, "b":Lio/reactivex/processors/ReplayProcessor$ReplayBuffer;, "Lio/reactivex/processors/ReplayProcessor$ReplayBuffer<TT;>;"
    invoke-interface {v1, v4}, Lio/reactivex/processors/ReplayProcessor$ReplayBuffer;->addFinal(Ljava/lang/Object;)V

    .line 304
    iget-object v6, p0, Lio/reactivex/processors/ReplayProcessor;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    sget-object v7, Lio/reactivex/processors/ReplayProcessor;->TERMINATED:[Lio/reactivex/processors/ReplayProcessor$ReplaySubscription;

    invoke-virtual {v6, v7}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/reactivex/processors/ReplayProcessor$ReplaySubscription;

    .local v0, "arr$":[Lio/reactivex/processors/ReplayProcessor$ReplaySubscription;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_0
    if-ge v2, v3, :cond_1

    aget-object v5, v0, v2

    .line 305
    .local v5, "rs":Lio/reactivex/processors/ReplayProcessor$ReplaySubscription;, "Lio/reactivex/processors/ReplayProcessor$ReplaySubscription<TT;>;"
    invoke-interface {v1, v5}, Lio/reactivex/processors/ReplayProcessor$ReplayBuffer;->replay(Lio/reactivex/processors/ReplayProcessor$ReplaySubscription;)V

    .line 304
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 271
    .local p0, "this":Lio/reactivex/processors/ReplayProcessor;, "Lio/reactivex/processors/ReplayProcessor<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    if-nez p1, :cond_1

    .line 272
    new-instance v5, Ljava/lang/NullPointerException;

    const-string/jumbo v6, "onNext called with null. Null values are generally not allowed in 2.x operators and sources."

    invoke-direct {v5, v6}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v5}, Lio/reactivex/processors/ReplayProcessor;->onError(Ljava/lang/Throwable;)V

    .line 285
    :cond_0
    return-void

    .line 275
    :cond_1
    iget-boolean v5, p0, Lio/reactivex/processors/ReplayProcessor;->done:Z

    if-nez v5, :cond_0

    .line 279
    iget-object v1, p0, Lio/reactivex/processors/ReplayProcessor;->buffer:Lio/reactivex/processors/ReplayProcessor$ReplayBuffer;

    .line 280
    .local v1, "b":Lio/reactivex/processors/ReplayProcessor$ReplayBuffer;, "Lio/reactivex/processors/ReplayProcessor$ReplayBuffer<TT;>;"
    invoke-interface {v1, p1}, Lio/reactivex/processors/ReplayProcessor$ReplayBuffer;->add(Ljava/lang/Object;)V

    .line 282
    iget-object v5, p0, Lio/reactivex/processors/ReplayProcessor;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v5}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/reactivex/processors/ReplayProcessor$ReplaySubscription;

    .local v0, "arr$":[Lio/reactivex/processors/ReplayProcessor$ReplaySubscription;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_0
    if-ge v2, v3, :cond_0

    aget-object v4, v0, v2

    .line 283
    .local v4, "rs":Lio/reactivex/processors/ReplayProcessor$ReplaySubscription;, "Lio/reactivex/processors/ReplayProcessor$ReplaySubscription<TT;>;"
    invoke-interface {v1, v4}, Lio/reactivex/processors/ReplayProcessor$ReplayBuffer;->replay(Lio/reactivex/processors/ReplayProcessor$ReplaySubscription;)V

    .line 282
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method public onSubscribe(Lorg/reactivestreams/Subscription;)V
    .locals 2
    .param p1, "s"    # Lorg/reactivestreams/Subscription;

    .prologue
    .line 262
    .local p0, "this":Lio/reactivex/processors/ReplayProcessor;, "Lio/reactivex/processors/ReplayProcessor<TT;>;"
    iget-boolean v0, p0, Lio/reactivex/processors/ReplayProcessor;->done:Z

    if-eqz v0, :cond_0

    .line 263
    invoke-interface {p1}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 267
    :goto_0
    return-void

    .line 266
    :cond_0
    const-wide v0, 0x7fffffffffffffffL

    invoke-interface {p1, v0, v1}, Lorg/reactivestreams/Subscription;->request(J)V

    goto :goto_0
.end method

.method remove(Lio/reactivex/processors/ReplayProcessor$ReplaySubscription;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/processors/ReplayProcessor$ReplaySubscription",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lio/reactivex/processors/ReplayProcessor;, "Lio/reactivex/processors/ReplayProcessor<TT;>;"
    .local p1, "rs":Lio/reactivex/processors/ReplayProcessor$ReplaySubscription;, "Lio/reactivex/processors/ReplayProcessor$ReplaySubscription<TT;>;"
    const/4 v7, 0x0

    .line 428
    :cond_0
    iget-object v5, p0, Lio/reactivex/processors/ReplayProcessor;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v5}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/reactivex/processors/ReplayProcessor$ReplaySubscription;

    .line 429
    .local v0, "a":[Lio/reactivex/processors/ReplayProcessor$ReplaySubscription;, "[Lio/reactivex/processors/ReplayProcessor$ReplaySubscription<TT;>;"
    sget-object v5, Lio/reactivex/processors/ReplayProcessor;->TERMINATED:[Lio/reactivex/processors/ReplayProcessor$ReplaySubscription;

    if-eq v0, v5, :cond_1

    sget-object v5, Lio/reactivex/processors/ReplayProcessor;->EMPTY:[Lio/reactivex/processors/ReplayProcessor$ReplaySubscription;

    if-ne v0, v5, :cond_2

    .line 453
    :cond_1
    :goto_0
    return-void

    .line 432
    :cond_2
    array-length v4, v0

    .line 433
    .local v4, "len":I
    const/4 v3, -0x1

    .line 434
    .local v3, "j":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    if-ge v2, v4, :cond_3

    .line 435
    aget-object v5, v0, v2

    if-ne v5, p1, :cond_4

    .line 436
    move v3, v2

    .line 441
    :cond_3
    if-ltz v3, :cond_1

    .line 445
    const/4 v5, 0x1

    if-ne v4, v5, :cond_5

    .line 446
    sget-object v1, Lio/reactivex/processors/ReplayProcessor;->EMPTY:[Lio/reactivex/processors/ReplayProcessor$ReplaySubscription;

    .line 452
    .local v1, "b":[Lio/reactivex/processors/ReplayProcessor$ReplaySubscription;, "[Lio/reactivex/processors/ReplayProcessor$ReplaySubscription<TT;>;"
    :goto_2
    iget-object v5, p0, Lio/reactivex/processors/ReplayProcessor;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v5, v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    goto :goto_0

    .line 434
    .end local v1    # "b":[Lio/reactivex/processors/ReplayProcessor$ReplaySubscription;, "[Lio/reactivex/processors/ReplayProcessor$ReplaySubscription<TT;>;"
    :cond_4
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 448
    :cond_5
    add-int/lit8 v5, v4, -0x1

    new-array v1, v5, [Lio/reactivex/processors/ReplayProcessor$ReplaySubscription;

    .line 449
    .restart local v1    # "b":[Lio/reactivex/processors/ReplayProcessor$ReplaySubscription;, "[Lio/reactivex/processors/ReplayProcessor$ReplaySubscription<TT;>;"
    invoke-static {v0, v7, v1, v7, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 450
    add-int/lit8 v5, v3, 0x1

    sub-int v6, v4, v3

    add-int/lit8 v6, v6, -0x1

    invoke-static {v0, v5, v1, v3, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_2
.end method

.method size()I
    .locals 1

    .prologue
    .line 405
    .local p0, "this":Lio/reactivex/processors/ReplayProcessor;, "Lio/reactivex/processors/ReplayProcessor<TT;>;"
    iget-object v0, p0, Lio/reactivex/processors/ReplayProcessor;->buffer:Lio/reactivex/processors/ReplayProcessor$ReplayBuffer;

    invoke-interface {v0}, Lio/reactivex/processors/ReplayProcessor$ReplayBuffer;->size()I

    move-result v0

    return v0
.end method

.method protected subscribeActual(Lorg/reactivestreams/Subscriber;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber",
            "<-TT;>;)V"
        }
    .end annotation

    .prologue
    .line 248
    .local p0, "this":Lio/reactivex/processors/ReplayProcessor;, "Lio/reactivex/processors/ReplayProcessor<TT;>;"
    .local p1, "s":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    new-instance v0, Lio/reactivex/processors/ReplayProcessor$ReplaySubscription;

    invoke-direct {v0, p1, p0}, Lio/reactivex/processors/ReplayProcessor$ReplaySubscription;-><init>(Lorg/reactivestreams/Subscriber;Lio/reactivex/processors/ReplayProcessor;)V

    .line 249
    .local v0, "rs":Lio/reactivex/processors/ReplayProcessor$ReplaySubscription;, "Lio/reactivex/processors/ReplayProcessor$ReplaySubscription<TT;>;"
    invoke-interface {p1, v0}, Lorg/reactivestreams/Subscriber;->onSubscribe(Lorg/reactivestreams/Subscription;)V

    .line 251
    invoke-virtual {p0, v0}, Lio/reactivex/processors/ReplayProcessor;->add(Lio/reactivex/processors/ReplayProcessor$ReplaySubscription;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 252
    iget-boolean v1, v0, Lio/reactivex/processors/ReplayProcessor$ReplaySubscription;->cancelled:Z

    if-eqz v1, :cond_0

    .line 253
    invoke-virtual {p0, v0}, Lio/reactivex/processors/ReplayProcessor;->remove(Lio/reactivex/processors/ReplayProcessor$ReplaySubscription;)V

    .line 258
    :goto_0
    return-void

    .line 257
    :cond_0
    iget-object v1, p0, Lio/reactivex/processors/ReplayProcessor;->buffer:Lio/reactivex/processors/ReplayProcessor$ReplayBuffer;

    invoke-interface {v1, v0}, Lio/reactivex/processors/ReplayProcessor$ReplayBuffer;->replay(Lio/reactivex/processors/ReplayProcessor$ReplaySubscription;)V

    goto :goto_0
.end method

.method subscriberCount()I
    .locals 1

    .prologue
    .line 334
    .local p0, "this":Lio/reactivex/processors/ReplayProcessor;, "Lio/reactivex/processors/ReplayProcessor<TT;>;"
    iget-object v0, p0, Lio/reactivex/processors/ReplayProcessor;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/reactivex/processors/ReplayProcessor$ReplaySubscription;

    array-length v0, v0

    return v0
.end method
