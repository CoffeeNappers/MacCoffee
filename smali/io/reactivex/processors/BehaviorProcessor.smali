.class public final Lio/reactivex/processors/BehaviorProcessor;
.super Lio/reactivex/processors/FlowableProcessor;
.source "BehaviorProcessor.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;
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
.field static final EMPTY:[Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;

.field static final EMPTY_ARRAY:[Ljava/lang/Object;

.field static final TERMINATED:[Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;


# instance fields
.field done:Z

.field index:J

.field final lock:Ljava/util/concurrent/locks/ReadWriteLock;

.field final readLock:Ljava/util/concurrent/locks/Lock;

.field final subscribers:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<[",
            "Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription",
            "<TT;>;>;"
        }
    .end annotation
.end field

.field final value:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field final writeLock:Ljava/util/concurrent/locks/Lock;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 76
    new-array v0, v1, [Ljava/lang/Object;

    sput-object v0, Lio/reactivex/processors/BehaviorProcessor;->EMPTY_ARRAY:[Ljava/lang/Object;

    .line 79
    new-array v0, v1, [Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;

    sput-object v0, Lio/reactivex/processors/BehaviorProcessor;->EMPTY:[Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;

    .line 82
    new-array v0, v1, [Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;

    sput-object v0, Lio/reactivex/processors/BehaviorProcessor;->TERMINATED:[Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;

    return-void
.end method

.method constructor <init>()V
    .locals 2

    .prologue
    .line 128
    .local p0, "this":Lio/reactivex/processors/BehaviorProcessor;, "Lio/reactivex/processors/BehaviorProcessor<TT;>;"
    invoke-direct {p0}, Lio/reactivex/processors/FlowableProcessor;-><init>()V

    .line 129
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object v0, p0, Lio/reactivex/processors/BehaviorProcessor;->value:Ljava/util/concurrent/atomic/AtomicReference;

    .line 130
    new-instance v0, Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-direct {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;-><init>()V

    iput-object v0, p0, Lio/reactivex/processors/BehaviorProcessor;->lock:Ljava/util/concurrent/locks/ReadWriteLock;

    .line 131
    iget-object v0, p0, Lio/reactivex/processors/BehaviorProcessor;->lock:Ljava/util/concurrent/locks/ReadWriteLock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/ReadWriteLock;->readLock()Ljava/util/concurrent/locks/Lock;

    move-result-object v0

    iput-object v0, p0, Lio/reactivex/processors/BehaviorProcessor;->readLock:Ljava/util/concurrent/locks/Lock;

    .line 132
    iget-object v0, p0, Lio/reactivex/processors/BehaviorProcessor;->lock:Ljava/util/concurrent/locks/ReadWriteLock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/ReadWriteLock;->writeLock()Ljava/util/concurrent/locks/Lock;

    move-result-object v0

    iput-object v0, p0, Lio/reactivex/processors/BehaviorProcessor;->writeLock:Ljava/util/concurrent/locks/Lock;

    .line 133
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    sget-object v1, Lio/reactivex/processors/BehaviorProcessor;->EMPTY:[Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lio/reactivex/processors/BehaviorProcessor;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    .line 134
    return-void
.end method

.method constructor <init>(Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 143
    .local p0, "this":Lio/reactivex/processors/BehaviorProcessor;, "Lio/reactivex/processors/BehaviorProcessor<TT;>;"
    .local p1, "defaultValue":Ljava/lang/Object;, "TT;"
    invoke-direct {p0}, Lio/reactivex/processors/BehaviorProcessor;-><init>()V

    .line 144
    iget-object v0, p0, Lio/reactivex/processors/BehaviorProcessor;->value:Ljava/util/concurrent/atomic/AtomicReference;

    const-string/jumbo v1, "defaultValue is null"

    invoke-static {p1, v1}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->lazySet(Ljava/lang/Object;)V

    .line 145
    return-void
.end method

.method public static create()Lio/reactivex/processors/BehaviorProcessor;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">()",
            "Lio/reactivex/processors/BehaviorProcessor",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .prologue
    .line 103
    new-instance v0, Lio/reactivex/processors/BehaviorProcessor;

    invoke-direct {v0}, Lio/reactivex/processors/BehaviorProcessor;-><init>()V

    return-object v0
.end method

.method public static createDefault(Ljava/lang/Object;)Lio/reactivex/processors/BehaviorProcessor;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;)",
            "Lio/reactivex/processors/BehaviorProcessor",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .prologue
    .line 119
    .local p0, "defaultValue":Ljava/lang/Object;, "TT;"
    const-string/jumbo v0, "defaultValue is null"

    invoke-static {p0, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 120
    new-instance v0, Lio/reactivex/processors/BehaviorProcessor;

    invoke-direct {v0, p0}, Lio/reactivex/processors/BehaviorProcessor;-><init>(Ljava/lang/Object;)V

    return-object v0
.end method


# virtual methods
.method add(Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;)Z
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription",
            "<TT;>;)Z"
        }
    .end annotation

    .prologue
    .local p0, "this":Lio/reactivex/processors/BehaviorProcessor;, "Lio/reactivex/processors/BehaviorProcessor<TT;>;"
    .local p1, "rs":Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;, "Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription<TT;>;"
    const/4 v3, 0x0

    .line 358
    :cond_0
    iget-object v4, p0, Lio/reactivex/processors/BehaviorProcessor;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;

    .line 359
    .local v0, "a":[Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;, "[Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription<TT;>;"
    sget-object v4, Lio/reactivex/processors/BehaviorProcessor;->TERMINATED:[Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;

    if-ne v0, v4, :cond_1

    .line 368
    :goto_0
    return v3

    .line 362
    :cond_1
    array-length v2, v0

    .line 364
    .local v2, "len":I
    add-int/lit8 v4, v2, 0x1

    new-array v1, v4, [Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;

    .line 365
    .local v1, "b":[Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;, "[Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription<TT;>;"
    invoke-static {v0, v3, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 366
    aput-object p1, v1, v2

    .line 367
    iget-object v4, p0, Lio/reactivex/processors/BehaviorProcessor;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v4, v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 368
    const/4 v3, 0x1

    goto :goto_0
.end method

.method public getThrowable()Ljava/lang/Throwable;
    .locals 2

    .prologue
    .line 267
    .local p0, "this":Lio/reactivex/processors/BehaviorProcessor;, "Lio/reactivex/processors/BehaviorProcessor<TT;>;"
    iget-object v1, p0, Lio/reactivex/processors/BehaviorProcessor;->value:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    .line 268
    .local v0, "o":Ljava/lang/Object;
    invoke-static {v0}, Lio/reactivex/internal/util/NotificationLite;->isError(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 269
    invoke-static {v0}, Lio/reactivex/internal/util/NotificationLite;->getError(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object v1

    .line 271
    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public getValue()Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .line 280
    .local p0, "this":Lio/reactivex/processors/BehaviorProcessor;, "Lio/reactivex/processors/BehaviorProcessor<TT;>;"
    iget-object v1, p0, Lio/reactivex/processors/BehaviorProcessor;->value:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    .line 281
    .local v0, "o":Ljava/lang/Object;
    invoke-static {v0}, Lio/reactivex/internal/util/NotificationLite;->isComplete(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    invoke-static {v0}, Lio/reactivex/internal/util/NotificationLite;->isError(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 282
    :cond_0
    const/4 v1, 0x0

    .line 284
    :goto_0
    return-object v1

    :cond_1
    invoke-static {v0}, Lio/reactivex/internal/util/NotificationLite;->getValue(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_0
.end method

.method public getValues()[Ljava/lang/Object;
    .locals 3

    .prologue
    .line 294
    .local p0, "this":Lio/reactivex/processors/BehaviorProcessor;, "Lio/reactivex/processors/BehaviorProcessor<TT;>;"
    sget-object v0, Lio/reactivex/processors/BehaviorProcessor;->EMPTY_ARRAY:[Ljava/lang/Object;

    check-cast v0, [Ljava/lang/Object;

    .line 295
    .local v0, "a":[Ljava/lang/Object;, "[TT;"
    invoke-virtual {p0, v0}, Lio/reactivex/processors/BehaviorProcessor;->getValues([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    .line 296
    .local v1, "b":[Ljava/lang/Object;, "[TT;"
    sget-object v2, Lio/reactivex/processors/BehaviorProcessor;->EMPTY_ARRAY:[Ljava/lang/Object;

    if-ne v1, v2, :cond_0

    .line 297
    const/4 v2, 0x0

    new-array v1, v2, [Ljava/lang/Object;

    .line 299
    .end local v1    # "b":[Ljava/lang/Object;, "[TT;"
    :cond_0
    return-object v1
.end method

.method public getValues([Ljava/lang/Object;)[Ljava/lang/Object;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([TT;)[TT;"
        }
    .end annotation

    .prologue
    .local p0, "this":Lio/reactivex/processors/BehaviorProcessor;, "Lio/reactivex/processors/BehaviorProcessor<TT;>;"
    .local p1, "array":[Ljava/lang/Object;, "[TT;"
    const/4 v6, 0x0

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 313
    iget-object v3, p0, Lio/reactivex/processors/BehaviorProcessor;->value:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    .line 314
    .local v1, "o":Ljava/lang/Object;
    if-eqz v1, :cond_0

    invoke-static {v1}, Lio/reactivex/internal/util/NotificationLite;->isComplete(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    invoke-static {v1}, Lio/reactivex/internal/util/NotificationLite;->isError(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 315
    :cond_0
    array-length v3, p1

    if-eqz v3, :cond_1

    .line 316
    aput-object v6, p1, v4

    :cond_1
    move-object v0, p1

    .line 330
    .end local p1    # "array":[Ljava/lang/Object;, "[TT;"
    .local v0, "array":[Ljava/lang/Object;, "[TT;"
    :goto_0
    return-object v0

    .line 320
    .end local v0    # "array":[Ljava/lang/Object;, "[TT;"
    .restart local p1    # "array":[Ljava/lang/Object;, "[TT;"
    :cond_2
    invoke-static {v1}, Lio/reactivex/internal/util/NotificationLite;->getValue(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 321
    .local v2, "v":Ljava/lang/Object;, "TT;"
    array-length v3, p1

    if-eqz v3, :cond_4

    .line 322
    aput-object v2, p1, v4

    .line 323
    array-length v3, p1

    if-eq v3, v5, :cond_3

    .line 324
    aput-object v6, p1, v5

    :cond_3
    :goto_1
    move-object v0, p1

    .line 330
    .end local p1    # "array":[Ljava/lang/Object;, "[TT;"
    .restart local v0    # "array":[Ljava/lang/Object;, "[TT;"
    goto :goto_0

    .line 327
    .end local v0    # "array":[Ljava/lang/Object;, "[TT;"
    .restart local p1    # "array":[Ljava/lang/Object;, "[TT;"
    :cond_4
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v3

    invoke-static {v3, v5}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Ljava/lang/Object;

    move-object p1, v3

    check-cast p1, [Ljava/lang/Object;

    .line 328
    aput-object v2, p1, v4

    goto :goto_1
.end method

.method public hasComplete()Z
    .locals 2

    .prologue
    .line 335
    .local p0, "this":Lio/reactivex/processors/BehaviorProcessor;, "Lio/reactivex/processors/BehaviorProcessor<TT;>;"
    iget-object v1, p0, Lio/reactivex/processors/BehaviorProcessor;->value:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    .line 336
    .local v0, "o":Ljava/lang/Object;
    invoke-static {v0}, Lio/reactivex/internal/util/NotificationLite;->isComplete(Ljava/lang/Object;)Z

    move-result v1

    return v1
.end method

.method public hasSubscribers()Z
    .locals 1

    .prologue
    .line 257
    .local p0, "this":Lio/reactivex/processors/BehaviorProcessor;, "Lio/reactivex/processors/BehaviorProcessor<TT;>;"
    iget-object v0, p0, Lio/reactivex/processors/BehaviorProcessor;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;

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
    .line 341
    .local p0, "this":Lio/reactivex/processors/BehaviorProcessor;, "Lio/reactivex/processors/BehaviorProcessor<TT;>;"
    iget-object v1, p0, Lio/reactivex/processors/BehaviorProcessor;->value:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    .line 342
    .local v0, "o":Ljava/lang/Object;
    invoke-static {v0}, Lio/reactivex/internal/util/NotificationLite;->isError(Ljava/lang/Object;)Z

    move-result v1

    return v1
.end method

.method public hasValue()Z
    .locals 2

    .prologue
    .line 351
    .local p0, "this":Lio/reactivex/processors/BehaviorProcessor;, "Lio/reactivex/processors/BehaviorProcessor<TT;>;"
    iget-object v1, p0, Lio/reactivex/processors/BehaviorProcessor;->value:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    .line 352
    .local v0, "o":Ljava/lang/Object;
    if-eqz v0, :cond_0

    invoke-static {v0}, Lio/reactivex/internal/util/NotificationLite;->isComplete(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    invoke-static {v0}, Lio/reactivex/internal/util/NotificationLite;->isError(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public offer(Ljava/lang/Object;)Z
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    .annotation build Lio/reactivex/annotations/Experimental;
    .end annotation

    .prologue
    .local p0, "this":Lio/reactivex/processors/BehaviorProcessor;, "Lio/reactivex/processors/BehaviorProcessor<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    const/4 v7, 0x1

    .line 235
    if-nez p1, :cond_1

    .line 236
    new-instance v8, Ljava/lang/NullPointerException;

    const-string/jumbo v9, "onNext called with null. Null values are generally not allowed in 2.x operators and sources."

    invoke-direct {v8, v9}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v8}, Lio/reactivex/processors/BehaviorProcessor;->onError(Ljava/lang/Throwable;)V

    .line 252
    :cond_0
    :goto_0
    return v7

    .line 239
    :cond_1
    iget-object v8, p0, Lio/reactivex/processors/BehaviorProcessor;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v8}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;

    .line 241
    .local v1, "array":[Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;, "[Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription<TT;>;"
    move-object v0, v1

    .local v0, "arr$":[Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_1
    if-ge v3, v4, :cond_3

    aget-object v6, v0, v3

    .line 242
    .local v6, "s":Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;, "Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription<TT;>;"
    invoke-virtual {v6}, Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;->isFull()Z

    move-result v8

    if-eqz v8, :cond_2

    .line 243
    const/4 v7, 0x0

    goto :goto_0

    .line 241
    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 247
    .end local v6    # "s":Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;, "Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription<TT;>;"
    :cond_3
    invoke-static {p1}, Lio/reactivex/internal/util/NotificationLite;->next(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    .line 248
    .local v5, "o":Ljava/lang/Object;
    invoke-virtual {p0, v5}, Lio/reactivex/processors/BehaviorProcessor;->setCurrent(Ljava/lang/Object;)V

    .line 249
    move-object v0, v1

    array-length v4, v0

    const/4 v3, 0x0

    :goto_2
    if-ge v3, v4, :cond_0

    aget-object v2, v0, v3

    .line 250
    .local v2, "bs":Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;, "Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription<TT;>;"
    iget-wide v8, p0, Lio/reactivex/processors/BehaviorProcessor;->index:J

    invoke-virtual {v2, v5, v8, v9}, Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;->emitNext(Ljava/lang/Object;J)V

    .line 249
    add-int/lit8 v3, v3, 0x1

    goto :goto_2
.end method

.method public onComplete()V
    .locals 8

    .prologue
    .line 210
    .local p0, "this":Lio/reactivex/processors/BehaviorProcessor;, "Lio/reactivex/processors/BehaviorProcessor<TT;>;"
    iget-boolean v5, p0, Lio/reactivex/processors/BehaviorProcessor;->done:Z

    if-eqz v5, :cond_1

    .line 218
    :cond_0
    return-void

    .line 213
    :cond_1
    const/4 v5, 0x1

    iput-boolean v5, p0, Lio/reactivex/processors/BehaviorProcessor;->done:Z

    .line 214
    invoke-static {}, Lio/reactivex/internal/util/NotificationLite;->complete()Ljava/lang/Object;

    move-result-object v4

    .line 215
    .local v4, "o":Ljava/lang/Object;
    invoke-virtual {p0, v4}, Lio/reactivex/processors/BehaviorProcessor;->terminate(Ljava/lang/Object;)[Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;

    move-result-object v0

    .local v0, "arr$":[Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_0
    if-ge v2, v3, :cond_0

    aget-object v1, v0, v2

    .line 216
    .local v1, "bs":Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;, "Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription<TT;>;"
    iget-wide v6, p0, Lio/reactivex/processors/BehaviorProcessor;->index:J

    invoke-virtual {v1, v4, v6, v7}, Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;->emitNext(Ljava/lang/Object;J)V

    .line 215
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 8
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 194
    .local p0, "this":Lio/reactivex/processors/BehaviorProcessor;, "Lio/reactivex/processors/BehaviorProcessor<TT;>;"
    if-nez p1, :cond_0

    .line 195
    new-instance p1, Ljava/lang/NullPointerException;

    .end local p1    # "t":Ljava/lang/Throwable;
    const-string/jumbo v5, "onError called with null. Null values are generally not allowed in 2.x operators and sources."

    invoke-direct {p1, v5}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 197
    .restart local p1    # "t":Ljava/lang/Throwable;
    :cond_0
    iget-boolean v5, p0, Lio/reactivex/processors/BehaviorProcessor;->done:Z

    if-eqz v5, :cond_2

    .line 198
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    .line 206
    :cond_1
    return-void

    .line 201
    :cond_2
    const/4 v5, 0x1

    iput-boolean v5, p0, Lio/reactivex/processors/BehaviorProcessor;->done:Z

    .line 202
    invoke-static {p1}, Lio/reactivex/internal/util/NotificationLite;->error(Ljava/lang/Throwable;)Ljava/lang/Object;

    move-result-object v4

    .line 203
    .local v4, "o":Ljava/lang/Object;
    invoke-virtual {p0, v4}, Lio/reactivex/processors/BehaviorProcessor;->terminate(Ljava/lang/Object;)[Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;

    move-result-object v0

    .local v0, "arr$":[Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_0
    if-ge v2, v3, :cond_1

    aget-object v1, v0, v2

    .line 204
    .local v1, "bs":Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;, "Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription<TT;>;"
    iget-wide v6, p0, Lio/reactivex/processors/BehaviorProcessor;->index:J

    invoke-virtual {v1, v4, v6, v7}, Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;->emitNext(Ljava/lang/Object;J)V

    .line 203
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 178
    .local p0, "this":Lio/reactivex/processors/BehaviorProcessor;, "Lio/reactivex/processors/BehaviorProcessor<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    if-nez p1, :cond_1

    .line 179
    new-instance v5, Ljava/lang/NullPointerException;

    const-string/jumbo v6, "onNext called with null. Null values are generally not allowed in 2.x operators and sources."

    invoke-direct {v5, v6}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v5}, Lio/reactivex/processors/BehaviorProcessor;->onError(Ljava/lang/Throwable;)V

    .line 190
    :cond_0
    return-void

    .line 182
    :cond_1
    iget-boolean v5, p0, Lio/reactivex/processors/BehaviorProcessor;->done:Z

    if-nez v5, :cond_0

    .line 185
    invoke-static {p1}, Lio/reactivex/internal/util/NotificationLite;->next(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    .line 186
    .local v4, "o":Ljava/lang/Object;
    invoke-virtual {p0, v4}, Lio/reactivex/processors/BehaviorProcessor;->setCurrent(Ljava/lang/Object;)V

    .line 187
    iget-object v5, p0, Lio/reactivex/processors/BehaviorProcessor;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v5}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;

    .local v0, "arr$":[Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_0
    if-ge v2, v3, :cond_0

    aget-object v1, v0, v2

    .line 188
    .local v1, "bs":Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;, "Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription<TT;>;"
    iget-wide v6, p0, Lio/reactivex/processors/BehaviorProcessor;->index:J

    invoke-virtual {v1, v4, v6, v7}, Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;->emitNext(Ljava/lang/Object;J)V

    .line 187
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method public onSubscribe(Lorg/reactivestreams/Subscription;)V
    .locals 2
    .param p1, "s"    # Lorg/reactivestreams/Subscription;

    .prologue
    .line 169
    .local p0, "this":Lio/reactivex/processors/BehaviorProcessor;, "Lio/reactivex/processors/BehaviorProcessor<TT;>;"
    iget-boolean v0, p0, Lio/reactivex/processors/BehaviorProcessor;->done:Z

    if-eqz v0, :cond_0

    .line 170
    invoke-interface {p1}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 174
    :goto_0
    return-void

    .line 173
    :cond_0
    const-wide v0, 0x7fffffffffffffffL

    invoke-interface {p1, v0, v1}, Lorg/reactivestreams/Subscription;->request(J)V

    goto :goto_0
.end method

.method remove(Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lio/reactivex/processors/BehaviorProcessor;, "Lio/reactivex/processors/BehaviorProcessor<TT;>;"
    .local p1, "rs":Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;, "Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription<TT;>;"
    const/4 v7, 0x0

    .line 376
    :cond_0
    iget-object v5, p0, Lio/reactivex/processors/BehaviorProcessor;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v5}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;

    .line 377
    .local v0, "a":[Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;, "[Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription<TT;>;"
    sget-object v5, Lio/reactivex/processors/BehaviorProcessor;->TERMINATED:[Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;

    if-eq v0, v5, :cond_1

    sget-object v5, Lio/reactivex/processors/BehaviorProcessor;->EMPTY:[Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;

    if-ne v0, v5, :cond_2

    .line 401
    :cond_1
    :goto_0
    return-void

    .line 380
    :cond_2
    array-length v4, v0

    .line 381
    .local v4, "len":I
    const/4 v3, -0x1

    .line 382
    .local v3, "j":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    if-ge v2, v4, :cond_3

    .line 383
    aget-object v5, v0, v2

    if-ne v5, p1, :cond_4

    .line 384
    move v3, v2

    .line 389
    :cond_3
    if-ltz v3, :cond_1

    .line 393
    const/4 v5, 0x1

    if-ne v4, v5, :cond_5

    .line 394
    sget-object v1, Lio/reactivex/processors/BehaviorProcessor;->EMPTY:[Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;

    .line 400
    .local v1, "b":[Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;, "[Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription<TT;>;"
    :goto_2
    iget-object v5, p0, Lio/reactivex/processors/BehaviorProcessor;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v5, v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    goto :goto_0

    .line 382
    .end local v1    # "b":[Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;, "[Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription<TT;>;"
    :cond_4
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 396
    :cond_5
    add-int/lit8 v5, v4, -0x1

    new-array v1, v5, [Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;

    .line 397
    .restart local v1    # "b":[Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;, "[Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription<TT;>;"
    invoke-static {v0, v7, v1, v7, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 398
    add-int/lit8 v5, v3, 0x1

    sub-int v6, v4, v3

    add-int/lit8 v6, v6, -0x1

    invoke-static {v0, v5, v1, v3, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_2
.end method

.method setCurrent(Ljava/lang/Object;)V
    .locals 6
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 422
    .local p0, "this":Lio/reactivex/processors/BehaviorProcessor;, "Lio/reactivex/processors/BehaviorProcessor<TT;>;"
    iget-object v0, p0, Lio/reactivex/processors/BehaviorProcessor;->writeLock:Ljava/util/concurrent/locks/Lock;

    .line 423
    .local v0, "wl":Ljava/util/concurrent/locks/Lock;
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 424
    iget-wide v2, p0, Lio/reactivex/processors/BehaviorProcessor;->index:J

    const-wide/16 v4, 0x1

    add-long/2addr v2, v4

    iput-wide v2, p0, Lio/reactivex/processors/BehaviorProcessor;->index:J

    .line 425
    iget-object v1, p0, Lio/reactivex/processors/BehaviorProcessor;->value:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1, p1}, Ljava/util/concurrent/atomic/AtomicReference;->lazySet(Ljava/lang/Object;)V

    .line 426
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 427
    return-void
.end method

.method protected subscribeActual(Lorg/reactivestreams/Subscriber;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber",
            "<-TT;>;)V"
        }
    .end annotation

    .prologue
    .line 149
    .local p0, "this":Lio/reactivex/processors/BehaviorProcessor;, "Lio/reactivex/processors/BehaviorProcessor<TT;>;"
    .local p1, "s":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    new-instance v0, Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;

    invoke-direct {v0, p1, p0}, Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;-><init>(Lorg/reactivestreams/Subscriber;Lio/reactivex/processors/BehaviorProcessor;)V

    .line 150
    .local v0, "bs":Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;, "Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription<TT;>;"
    invoke-interface {p1, v0}, Lorg/reactivestreams/Subscriber;->onSubscribe(Lorg/reactivestreams/Subscription;)V

    .line 151
    invoke-virtual {p0, v0}, Lio/reactivex/processors/BehaviorProcessor;->add(Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 152
    iget-boolean v2, v0, Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;->cancelled:Z

    if-eqz v2, :cond_0

    .line 153
    invoke-virtual {p0, v0}, Lio/reactivex/processors/BehaviorProcessor;->remove(Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;)V

    .line 165
    :goto_0
    return-void

    .line 155
    :cond_0
    invoke-virtual {v0}, Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;->emitFirst()V

    goto :goto_0

    .line 158
    :cond_1
    iget-object v2, p0, Lio/reactivex/processors/BehaviorProcessor;->value:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    .line 159
    .local v1, "o":Ljava/lang/Object;
    invoke-static {v1}, Lio/reactivex/internal/util/NotificationLite;->isComplete(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 160
    invoke-interface {p1}, Lorg/reactivestreams/Subscriber;->onComplete()V

    goto :goto_0

    .line 162
    :cond_2
    invoke-static {v1}, Lio/reactivex/internal/util/NotificationLite;->getError(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object v2

    invoke-interface {p1, v2}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method subscriberCount()I
    .locals 1

    .prologue
    .line 262
    .local p0, "this":Lio/reactivex/processors/BehaviorProcessor;, "Lio/reactivex/processors/BehaviorProcessor<TT;>;"
    iget-object v0, p0, Lio/reactivex/processors/BehaviorProcessor;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;

    array-length v0, v0

    return v0
.end method

.method terminate(Ljava/lang/Object;)[Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;
    .locals 3
    .param p1, "terminalValue"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")[",
            "Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 409
    .local p0, "this":Lio/reactivex/processors/BehaviorProcessor;, "Lio/reactivex/processors/BehaviorProcessor<TT;>;"
    iget-object v1, p0, Lio/reactivex/processors/BehaviorProcessor;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;

    .line 410
    .local v0, "a":[Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;, "[Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription<TT;>;"
    sget-object v1, Lio/reactivex/processors/BehaviorProcessor;->TERMINATED:[Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;

    if-eq v0, v1, :cond_0

    .line 411
    iget-object v1, p0, Lio/reactivex/processors/BehaviorProcessor;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    sget-object v2, Lio/reactivex/processors/BehaviorProcessor;->TERMINATED:[Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;

    invoke-virtual {v1, v2}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "a":[Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;, "[Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription<TT;>;"
    check-cast v0, [Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;

    .line 412
    .restart local v0    # "a":[Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;, "[Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription<TT;>;"
    sget-object v1, Lio/reactivex/processors/BehaviorProcessor;->TERMINATED:[Lio/reactivex/processors/BehaviorProcessor$BehaviorSubscription;

    if-eq v0, v1, :cond_0

    .line 414
    invoke-virtual {p0, p1}, Lio/reactivex/processors/BehaviorProcessor;->setCurrent(Ljava/lang/Object;)V

    .line 418
    :cond_0
    return-object v0
.end method
