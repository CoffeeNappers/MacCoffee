.class public final Lio/reactivex/subjects/BehaviorSubject;
.super Lio/reactivex/subjects/Subject;
.source "BehaviorSubject.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/reactivex/subjects/BehaviorSubject$BehaviorDisposable;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/subjects/Subject",
        "<TT;>;"
    }
.end annotation


# static fields
.field static final EMPTY:[Lio/reactivex/subjects/BehaviorSubject$BehaviorDisposable;

.field private static final EMPTY_ARRAY:[Ljava/lang/Object;

.field static final TERMINATED:[Lio/reactivex/subjects/BehaviorSubject$BehaviorDisposable;


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
            "Lio/reactivex/subjects/BehaviorSubject$BehaviorDisposable",
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

    .line 74
    new-array v0, v1, [Ljava/lang/Object;

    sput-object v0, Lio/reactivex/subjects/BehaviorSubject;->EMPTY_ARRAY:[Ljava/lang/Object;

    .line 81
    new-array v0, v1, [Lio/reactivex/subjects/BehaviorSubject$BehaviorDisposable;

    sput-object v0, Lio/reactivex/subjects/BehaviorSubject;->EMPTY:[Lio/reactivex/subjects/BehaviorSubject$BehaviorDisposable;

    .line 84
    new-array v0, v1, [Lio/reactivex/subjects/BehaviorSubject$BehaviorDisposable;

    sput-object v0, Lio/reactivex/subjects/BehaviorSubject;->TERMINATED:[Lio/reactivex/subjects/BehaviorSubject$BehaviorDisposable;

    return-void
.end method

.method constructor <init>()V
    .locals 2

    .prologue
    .line 126
    .local p0, "this":Lio/reactivex/subjects/BehaviorSubject;, "Lio/reactivex/subjects/BehaviorSubject<TT;>;"
    invoke-direct {p0}, Lio/reactivex/subjects/Subject;-><init>()V

    .line 127
    new-instance v0, Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-direct {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;-><init>()V

    iput-object v0, p0, Lio/reactivex/subjects/BehaviorSubject;->lock:Ljava/util/concurrent/locks/ReadWriteLock;

    .line 128
    iget-object v0, p0, Lio/reactivex/subjects/BehaviorSubject;->lock:Ljava/util/concurrent/locks/ReadWriteLock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/ReadWriteLock;->readLock()Ljava/util/concurrent/locks/Lock;

    move-result-object v0

    iput-object v0, p0, Lio/reactivex/subjects/BehaviorSubject;->readLock:Ljava/util/concurrent/locks/Lock;

    .line 129
    iget-object v0, p0, Lio/reactivex/subjects/BehaviorSubject;->lock:Ljava/util/concurrent/locks/ReadWriteLock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/ReadWriteLock;->writeLock()Ljava/util/concurrent/locks/Lock;

    move-result-object v0

    iput-object v0, p0, Lio/reactivex/subjects/BehaviorSubject;->writeLock:Ljava/util/concurrent/locks/Lock;

    .line 130
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    sget-object v1, Lio/reactivex/subjects/BehaviorSubject;->EMPTY:[Lio/reactivex/subjects/BehaviorSubject$BehaviorDisposable;

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lio/reactivex/subjects/BehaviorSubject;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    .line 131
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object v0, p0, Lio/reactivex/subjects/BehaviorSubject;->value:Ljava/util/concurrent/atomic/AtomicReference;

    .line 132
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
    .line 141
    .local p0, "this":Lio/reactivex/subjects/BehaviorSubject;, "Lio/reactivex/subjects/BehaviorSubject<TT;>;"
    .local p1, "defaultValue":Ljava/lang/Object;, "TT;"
    invoke-direct {p0}, Lio/reactivex/subjects/BehaviorSubject;-><init>()V

    .line 142
    iget-object v0, p0, Lio/reactivex/subjects/BehaviorSubject;->value:Ljava/util/concurrent/atomic/AtomicReference;

    const-string/jumbo v1, "defaultValue is null"

    invoke-static {p1, v1}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->lazySet(Ljava/lang/Object;)V

    .line 143
    return-void
.end method

.method public static create()Lio/reactivex/subjects/BehaviorSubject;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">()",
            "Lio/reactivex/subjects/BehaviorSubject",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .prologue
    .line 102
    new-instance v0, Lio/reactivex/subjects/BehaviorSubject;

    invoke-direct {v0}, Lio/reactivex/subjects/BehaviorSubject;-><init>()V

    return-object v0
.end method

.method public static createDefault(Ljava/lang/Object;)Lio/reactivex/subjects/BehaviorSubject;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;)",
            "Lio/reactivex/subjects/BehaviorSubject",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .prologue
    .line 118
    .local p0, "defaultValue":Ljava/lang/Object;, "TT;"
    new-instance v0, Lio/reactivex/subjects/BehaviorSubject;

    invoke-direct {v0, p0}, Lio/reactivex/subjects/BehaviorSubject;-><init>(Ljava/lang/Object;)V

    return-object v0
.end method


# virtual methods
.method add(Lio/reactivex/subjects/BehaviorSubject$BehaviorDisposable;)Z
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/subjects/BehaviorSubject$BehaviorDisposable",
            "<TT;>;)Z"
        }
    .end annotation

    .prologue
    .local p0, "this":Lio/reactivex/subjects/BehaviorSubject;, "Lio/reactivex/subjects/BehaviorSubject<TT;>;"
    .local p1, "rs":Lio/reactivex/subjects/BehaviorSubject$BehaviorDisposable;, "Lio/reactivex/subjects/BehaviorSubject$BehaviorDisposable<TT;>;"
    const/4 v3, 0x0

    .line 318
    :cond_0
    iget-object v4, p0, Lio/reactivex/subjects/BehaviorSubject;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/reactivex/subjects/BehaviorSubject$BehaviorDisposable;

    .line 319
    .local v0, "a":[Lio/reactivex/subjects/BehaviorSubject$BehaviorDisposable;, "[Lio/reactivex/subjects/BehaviorSubject$BehaviorDisposable<TT;>;"
    sget-object v4, Lio/reactivex/subjects/BehaviorSubject;->TERMINATED:[Lio/reactivex/subjects/BehaviorSubject$BehaviorDisposable;

    if-ne v0, v4, :cond_1

    .line 328
    :goto_0
    return v3

    .line 322
    :cond_1
    array-length v2, v0

    .line 324
    .local v2, "len":I
    add-int/lit8 v4, v2, 0x1

    new-array v1, v4, [Lio/reactivex/subjects/BehaviorSubject$BehaviorDisposable;

    .line 325
    .local v1, "b":[Lio/reactivex/subjects/BehaviorSubject$BehaviorDisposable;, "[Lio/reactivex/subjects/BehaviorSubject$BehaviorDisposable<TT;>;"
    invoke-static {v0, v3, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 326
    aput-object p1, v1, v2

    .line 327
    iget-object v4, p0, Lio/reactivex/subjects/BehaviorSubject;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v4, v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 328
    const/4 v3, 0x1

    goto :goto_0
.end method

.method public getThrowable()Ljava/lang/Throwable;
    .locals 2

    .prologue
    .line 228
    .local p0, "this":Lio/reactivex/subjects/BehaviorSubject;, "Lio/reactivex/subjects/BehaviorSubject<TT;>;"
    iget-object v1, p0, Lio/reactivex/subjects/BehaviorSubject;->value:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    .line 229
    .local v0, "o":Ljava/lang/Object;
    invoke-static {v0}, Lio/reactivex/internal/util/NotificationLite;->isError(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 230
    invoke-static {v0}, Lio/reactivex/internal/util/NotificationLite;->getError(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object v1

    .line 232
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
    .line 241
    .local p0, "this":Lio/reactivex/subjects/BehaviorSubject;, "Lio/reactivex/subjects/BehaviorSubject<TT;>;"
    iget-object v1, p0, Lio/reactivex/subjects/BehaviorSubject;->value:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    .line 242
    .local v0, "o":Ljava/lang/Object;
    invoke-static {v0}, Lio/reactivex/internal/util/NotificationLite;->isComplete(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    invoke-static {v0}, Lio/reactivex/internal/util/NotificationLite;->isError(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 243
    :cond_0
    const/4 v1, 0x0

    .line 245
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
    .line 255
    .local p0, "this":Lio/reactivex/subjects/BehaviorSubject;, "Lio/reactivex/subjects/BehaviorSubject<TT;>;"
    sget-object v0, Lio/reactivex/subjects/BehaviorSubject;->EMPTY_ARRAY:[Ljava/lang/Object;

    check-cast v0, [Ljava/lang/Object;

    .line 256
    .local v0, "a":[Ljava/lang/Object;, "[TT;"
    invoke-virtual {p0, v0}, Lio/reactivex/subjects/BehaviorSubject;->getValues([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    .line 257
    .local v1, "b":[Ljava/lang/Object;, "[TT;"
    sget-object v2, Lio/reactivex/subjects/BehaviorSubject;->EMPTY_ARRAY:[Ljava/lang/Object;

    if-ne v1, v2, :cond_0

    .line 258
    const/4 v2, 0x0

    new-array v1, v2, [Ljava/lang/Object;

    .line 260
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
    .local p0, "this":Lio/reactivex/subjects/BehaviorSubject;, "Lio/reactivex/subjects/BehaviorSubject<TT;>;"
    .local p1, "array":[Ljava/lang/Object;, "[TT;"
    const/4 v6, 0x0

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 274
    iget-object v3, p0, Lio/reactivex/subjects/BehaviorSubject;->value:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    .line 275
    .local v1, "o":Ljava/lang/Object;
    if-eqz v1, :cond_0

    invoke-static {v1}, Lio/reactivex/internal/util/NotificationLite;->isComplete(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    invoke-static {v1}, Lio/reactivex/internal/util/NotificationLite;->isError(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 276
    :cond_0
    array-length v3, p1

    if-eqz v3, :cond_1

    .line 277
    aput-object v6, p1, v4

    :cond_1
    move-object v0, p1

    .line 291
    .end local p1    # "array":[Ljava/lang/Object;, "[TT;"
    .local v0, "array":[Ljava/lang/Object;, "[TT;"
    :goto_0
    return-object v0

    .line 281
    .end local v0    # "array":[Ljava/lang/Object;, "[TT;"
    .restart local p1    # "array":[Ljava/lang/Object;, "[TT;"
    :cond_2
    invoke-static {v1}, Lio/reactivex/internal/util/NotificationLite;->getValue(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 282
    .local v2, "v":Ljava/lang/Object;, "TT;"
    array-length v3, p1

    if-eqz v3, :cond_4

    .line 283
    aput-object v2, p1, v4

    .line 284
    array-length v3, p1

    if-eq v3, v5, :cond_3

    .line 285
    aput-object v6, p1, v5

    :cond_3
    :goto_1
    move-object v0, p1

    .line 291
    .end local p1    # "array":[Ljava/lang/Object;, "[TT;"
    .restart local v0    # "array":[Ljava/lang/Object;, "[TT;"
    goto :goto_0

    .line 288
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

    .line 289
    aput-object v2, p1, v4

    goto :goto_1
.end method

.method public hasComplete()Z
    .locals 2

    .prologue
    .line 296
    .local p0, "this":Lio/reactivex/subjects/BehaviorSubject;, "Lio/reactivex/subjects/BehaviorSubject<TT;>;"
    iget-object v1, p0, Lio/reactivex/subjects/BehaviorSubject;->value:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    .line 297
    .local v0, "o":Ljava/lang/Object;
    invoke-static {v0}, Lio/reactivex/internal/util/NotificationLite;->isComplete(Ljava/lang/Object;)Z

    move-result v1

    return v1
.end method

.method public hasObservers()Z
    .locals 1

    .prologue
    .line 218
    .local p0, "this":Lio/reactivex/subjects/BehaviorSubject;, "Lio/reactivex/subjects/BehaviorSubject<TT;>;"
    iget-object v0, p0, Lio/reactivex/subjects/BehaviorSubject;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/reactivex/subjects/BehaviorSubject$BehaviorDisposable;

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
    .line 302
    .local p0, "this":Lio/reactivex/subjects/BehaviorSubject;, "Lio/reactivex/subjects/BehaviorSubject<TT;>;"
    iget-object v1, p0, Lio/reactivex/subjects/BehaviorSubject;->value:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    .line 303
    .local v0, "o":Ljava/lang/Object;
    invoke-static {v0}, Lio/reactivex/internal/util/NotificationLite;->isError(Ljava/lang/Object;)Z

    move-result v1

    return v1
.end method

.method public hasValue()Z
    .locals 2

    .prologue
    .line 312
    .local p0, "this":Lio/reactivex/subjects/BehaviorSubject;, "Lio/reactivex/subjects/BehaviorSubject<TT;>;"
    iget-object v1, p0, Lio/reactivex/subjects/BehaviorSubject;->value:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    .line 313
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

.method public onComplete()V
    .locals 8

    .prologue
    .line 206
    .local p0, "this":Lio/reactivex/subjects/BehaviorSubject;, "Lio/reactivex/subjects/BehaviorSubject<TT;>;"
    iget-boolean v5, p0, Lio/reactivex/subjects/BehaviorSubject;->done:Z

    if-eqz v5, :cond_1

    .line 214
    :cond_0
    return-void

    .line 209
    :cond_1
    const/4 v5, 0x1

    iput-boolean v5, p0, Lio/reactivex/subjects/BehaviorSubject;->done:Z

    .line 210
    invoke-static {}, Lio/reactivex/internal/util/NotificationLite;->complete()Ljava/lang/Object;

    move-result-object v4

    .line 211
    .local v4, "o":Ljava/lang/Object;
    invoke-virtual {p0, v4}, Lio/reactivex/subjects/BehaviorSubject;->terminate(Ljava/lang/Object;)[Lio/reactivex/subjects/BehaviorSubject$BehaviorDisposable;

    move-result-object v0

    .local v0, "arr$":[Lio/reactivex/subjects/BehaviorSubject$BehaviorDisposable;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_0
    if-ge v2, v3, :cond_0

    aget-object v1, v0, v2

    .line 212
    .local v1, "bs":Lio/reactivex/subjects/BehaviorSubject$BehaviorDisposable;, "Lio/reactivex/subjects/BehaviorSubject$BehaviorDisposable<TT;>;"
    iget-wide v6, p0, Lio/reactivex/subjects/BehaviorSubject;->index:J

    invoke-virtual {v1, v4, v6, v7}, Lio/reactivex/subjects/BehaviorSubject$BehaviorDisposable;->emitNext(Ljava/lang/Object;J)V

    .line 211
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 8
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 190
    .local p0, "this":Lio/reactivex/subjects/BehaviorSubject;, "Lio/reactivex/subjects/BehaviorSubject<TT;>;"
    if-nez p1, :cond_0

    .line 191
    new-instance p1, Ljava/lang/NullPointerException;

    .end local p1    # "t":Ljava/lang/Throwable;
    const-string/jumbo v5, "onError called with null. Null values are generally not allowed in 2.x operators and sources."

    invoke-direct {p1, v5}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 193
    .restart local p1    # "t":Ljava/lang/Throwable;
    :cond_0
    iget-boolean v5, p0, Lio/reactivex/subjects/BehaviorSubject;->done:Z

    if-eqz v5, :cond_2

    .line 194
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    .line 202
    :cond_1
    return-void

    .line 197
    :cond_2
    const/4 v5, 0x1

    iput-boolean v5, p0, Lio/reactivex/subjects/BehaviorSubject;->done:Z

    .line 198
    invoke-static {p1}, Lio/reactivex/internal/util/NotificationLite;->error(Ljava/lang/Throwable;)Ljava/lang/Object;

    move-result-object v4

    .line 199
    .local v4, "o":Ljava/lang/Object;
    invoke-virtual {p0, v4}, Lio/reactivex/subjects/BehaviorSubject;->terminate(Ljava/lang/Object;)[Lio/reactivex/subjects/BehaviorSubject$BehaviorDisposable;

    move-result-object v0

    .local v0, "arr$":[Lio/reactivex/subjects/BehaviorSubject$BehaviorDisposable;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_0
    if-ge v2, v3, :cond_1

    aget-object v1, v0, v2

    .line 200
    .local v1, "bs":Lio/reactivex/subjects/BehaviorSubject$BehaviorDisposable;, "Lio/reactivex/subjects/BehaviorSubject$BehaviorDisposable<TT;>;"
    iget-wide v6, p0, Lio/reactivex/subjects/BehaviorSubject;->index:J

    invoke-virtual {v1, v4, v6, v7}, Lio/reactivex/subjects/BehaviorSubject$BehaviorDisposable;->emitNext(Ljava/lang/Object;J)V

    .line 199
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
    .line 174
    .local p0, "this":Lio/reactivex/subjects/BehaviorSubject;, "Lio/reactivex/subjects/BehaviorSubject<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    if-nez p1, :cond_1

    .line 175
    new-instance v5, Ljava/lang/NullPointerException;

    const-string/jumbo v6, "onNext called with null. Null values are generally not allowed in 2.x operators and sources."

    invoke-direct {v5, v6}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v5}, Lio/reactivex/subjects/BehaviorSubject;->onError(Ljava/lang/Throwable;)V

    .line 186
    :cond_0
    return-void

    .line 178
    :cond_1
    iget-boolean v5, p0, Lio/reactivex/subjects/BehaviorSubject;->done:Z

    if-nez v5, :cond_0

    .line 181
    invoke-static {p1}, Lio/reactivex/internal/util/NotificationLite;->next(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    .line 182
    .local v4, "o":Ljava/lang/Object;
    invoke-virtual {p0, v4}, Lio/reactivex/subjects/BehaviorSubject;->setCurrent(Ljava/lang/Object;)V

    .line 183
    iget-object v5, p0, Lio/reactivex/subjects/BehaviorSubject;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v5}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/reactivex/subjects/BehaviorSubject$BehaviorDisposable;

    .local v0, "arr$":[Lio/reactivex/subjects/BehaviorSubject$BehaviorDisposable;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_0
    if-ge v2, v3, :cond_0

    aget-object v1, v0, v2

    .line 184
    .local v1, "bs":Lio/reactivex/subjects/BehaviorSubject$BehaviorDisposable;, "Lio/reactivex/subjects/BehaviorSubject$BehaviorDisposable<TT;>;"
    iget-wide v6, p0, Lio/reactivex/subjects/BehaviorSubject;->index:J

    invoke-virtual {v1, v4, v6, v7}, Lio/reactivex/subjects/BehaviorSubject$BehaviorDisposable;->emitNext(Ljava/lang/Object;J)V

    .line 183
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method public onSubscribe(Lio/reactivex/disposables/Disposable;)V
    .locals 1
    .param p1, "s"    # Lio/reactivex/disposables/Disposable;

    .prologue
    .line 167
    .local p0, "this":Lio/reactivex/subjects/BehaviorSubject;, "Lio/reactivex/subjects/BehaviorSubject<TT;>;"
    iget-boolean v0, p0, Lio/reactivex/subjects/BehaviorSubject;->done:Z

    if-eqz v0, :cond_0

    .line 168
    invoke-interface {p1}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 170
    :cond_0
    return-void
.end method

.method remove(Lio/reactivex/subjects/BehaviorSubject$BehaviorDisposable;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/subjects/BehaviorSubject$BehaviorDisposable",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lio/reactivex/subjects/BehaviorSubject;, "Lio/reactivex/subjects/BehaviorSubject<TT;>;"
    .local p1, "rs":Lio/reactivex/subjects/BehaviorSubject$BehaviorDisposable;, "Lio/reactivex/subjects/BehaviorSubject$BehaviorDisposable<TT;>;"
    const/4 v7, 0x0

    .line 336
    :cond_0
    iget-object v5, p0, Lio/reactivex/subjects/BehaviorSubject;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v5}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/reactivex/subjects/BehaviorSubject$BehaviorDisposable;

    .line 337
    .local v0, "a":[Lio/reactivex/subjects/BehaviorSubject$BehaviorDisposable;, "[Lio/reactivex/subjects/BehaviorSubject$BehaviorDisposable<TT;>;"
    sget-object v5, Lio/reactivex/subjects/BehaviorSubject;->TERMINATED:[Lio/reactivex/subjects/BehaviorSubject$BehaviorDisposable;

    if-eq v0, v5, :cond_1

    sget-object v5, Lio/reactivex/subjects/BehaviorSubject;->EMPTY:[Lio/reactivex/subjects/BehaviorSubject$BehaviorDisposable;

    if-ne v0, v5, :cond_2

    .line 361
    :cond_1
    :goto_0
    return-void

    .line 340
    :cond_2
    array-length v4, v0

    .line 341
    .local v4, "len":I
    const/4 v3, -0x1

    .line 342
    .local v3, "j":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    if-ge v2, v4, :cond_3

    .line 343
    aget-object v5, v0, v2

    if-ne v5, p1, :cond_4

    .line 344
    move v3, v2

    .line 349
    :cond_3
    if-ltz v3, :cond_1

    .line 353
    const/4 v5, 0x1

    if-ne v4, v5, :cond_5

    .line 354
    sget-object v1, Lio/reactivex/subjects/BehaviorSubject;->EMPTY:[Lio/reactivex/subjects/BehaviorSubject$BehaviorDisposable;

    .line 360
    .local v1, "b":[Lio/reactivex/subjects/BehaviorSubject$BehaviorDisposable;, "[Lio/reactivex/subjects/BehaviorSubject$BehaviorDisposable<TT;>;"
    :goto_2
    iget-object v5, p0, Lio/reactivex/subjects/BehaviorSubject;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v5, v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    goto :goto_0

    .line 342
    .end local v1    # "b":[Lio/reactivex/subjects/BehaviorSubject$BehaviorDisposable;, "[Lio/reactivex/subjects/BehaviorSubject$BehaviorDisposable<TT;>;"
    :cond_4
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 356
    :cond_5
    add-int/lit8 v5, v4, -0x1

    new-array v1, v5, [Lio/reactivex/subjects/BehaviorSubject$BehaviorDisposable;

    .line 357
    .restart local v1    # "b":[Lio/reactivex/subjects/BehaviorSubject$BehaviorDisposable;, "[Lio/reactivex/subjects/BehaviorSubject$BehaviorDisposable<TT;>;"
    invoke-static {v0, v7, v1, v7, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 358
    add-int/lit8 v5, v3, 0x1

    sub-int v6, v4, v3

    add-int/lit8 v6, v6, -0x1

    invoke-static {v0, v5, v1, v3, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_2
.end method

.method setCurrent(Ljava/lang/Object;)V
    .locals 4
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 382
    .local p0, "this":Lio/reactivex/subjects/BehaviorSubject;, "Lio/reactivex/subjects/BehaviorSubject<TT;>;"
    iget-object v0, p0, Lio/reactivex/subjects/BehaviorSubject;->writeLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 384
    :try_start_0
    iget-wide v0, p0, Lio/reactivex/subjects/BehaviorSubject;->index:J

    const-wide/16 v2, 0x1

    add-long/2addr v0, v2

    iput-wide v0, p0, Lio/reactivex/subjects/BehaviorSubject;->index:J

    .line 385
    iget-object v0, p0, Lio/reactivex/subjects/BehaviorSubject;->value:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/atomic/AtomicReference;->lazySet(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 387
    iget-object v0, p0, Lio/reactivex/subjects/BehaviorSubject;->writeLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 389
    return-void

    .line 387
    :catchall_0
    move-exception v0

    iget-object v1, p0, Lio/reactivex/subjects/BehaviorSubject;->writeLock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0
.end method

.method protected subscribeActual(Lio/reactivex/Observer;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Observer",
            "<-TT;>;)V"
        }
    .end annotation

    .prologue
    .line 147
    .local p0, "this":Lio/reactivex/subjects/BehaviorSubject;, "Lio/reactivex/subjects/BehaviorSubject<TT;>;"
    .local p1, "observer":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TT;>;"
    new-instance v0, Lio/reactivex/subjects/BehaviorSubject$BehaviorDisposable;

    invoke-direct {v0, p1, p0}, Lio/reactivex/subjects/BehaviorSubject$BehaviorDisposable;-><init>(Lio/reactivex/Observer;Lio/reactivex/subjects/BehaviorSubject;)V

    .line 148
    .local v0, "bs":Lio/reactivex/subjects/BehaviorSubject$BehaviorDisposable;, "Lio/reactivex/subjects/BehaviorSubject$BehaviorDisposable<TT;>;"
    invoke-interface {p1, v0}, Lio/reactivex/Observer;->onSubscribe(Lio/reactivex/disposables/Disposable;)V

    .line 149
    invoke-virtual {p0, v0}, Lio/reactivex/subjects/BehaviorSubject;->add(Lio/reactivex/subjects/BehaviorSubject$BehaviorDisposable;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 150
    iget-boolean v2, v0, Lio/reactivex/subjects/BehaviorSubject$BehaviorDisposable;->cancelled:Z

    if-eqz v2, :cond_0

    .line 151
    invoke-virtual {p0, v0}, Lio/reactivex/subjects/BehaviorSubject;->remove(Lio/reactivex/subjects/BehaviorSubject$BehaviorDisposable;)V

    .line 163
    :goto_0
    return-void

    .line 153
    :cond_0
    invoke-virtual {v0}, Lio/reactivex/subjects/BehaviorSubject$BehaviorDisposable;->emitFirst()V

    goto :goto_0

    .line 156
    :cond_1
    iget-object v2, p0, Lio/reactivex/subjects/BehaviorSubject;->value:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    .line 157
    .local v1, "o":Ljava/lang/Object;
    invoke-static {v1}, Lio/reactivex/internal/util/NotificationLite;->isComplete(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 158
    invoke-interface {p1}, Lio/reactivex/Observer;->onComplete()V

    goto :goto_0

    .line 160
    :cond_2
    invoke-static {v1}, Lio/reactivex/internal/util/NotificationLite;->getError(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object v2

    invoke-interface {p1, v2}, Lio/reactivex/Observer;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method subscriberCount()I
    .locals 1

    .prologue
    .line 223
    .local p0, "this":Lio/reactivex/subjects/BehaviorSubject;, "Lio/reactivex/subjects/BehaviorSubject<TT;>;"
    iget-object v0, p0, Lio/reactivex/subjects/BehaviorSubject;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/reactivex/subjects/BehaviorSubject$BehaviorDisposable;

    array-length v0, v0

    return v0
.end method

.method terminate(Ljava/lang/Object;)[Lio/reactivex/subjects/BehaviorSubject$BehaviorDisposable;
    .locals 3
    .param p1, "terminalValue"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")[",
            "Lio/reactivex/subjects/BehaviorSubject$BehaviorDisposable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 369
    .local p0, "this":Lio/reactivex/subjects/BehaviorSubject;, "Lio/reactivex/subjects/BehaviorSubject<TT;>;"
    iget-object v1, p0, Lio/reactivex/subjects/BehaviorSubject;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/reactivex/subjects/BehaviorSubject$BehaviorDisposable;

    .line 370
    .local v0, "a":[Lio/reactivex/subjects/BehaviorSubject$BehaviorDisposable;, "[Lio/reactivex/subjects/BehaviorSubject$BehaviorDisposable<TT;>;"
    sget-object v1, Lio/reactivex/subjects/BehaviorSubject;->TERMINATED:[Lio/reactivex/subjects/BehaviorSubject$BehaviorDisposable;

    if-eq v0, v1, :cond_0

    .line 371
    iget-object v1, p0, Lio/reactivex/subjects/BehaviorSubject;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    sget-object v2, Lio/reactivex/subjects/BehaviorSubject;->TERMINATED:[Lio/reactivex/subjects/BehaviorSubject$BehaviorDisposable;

    invoke-virtual {v1, v2}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "a":[Lio/reactivex/subjects/BehaviorSubject$BehaviorDisposable;, "[Lio/reactivex/subjects/BehaviorSubject$BehaviorDisposable<TT;>;"
    check-cast v0, [Lio/reactivex/subjects/BehaviorSubject$BehaviorDisposable;

    .line 372
    .restart local v0    # "a":[Lio/reactivex/subjects/BehaviorSubject$BehaviorDisposable;, "[Lio/reactivex/subjects/BehaviorSubject$BehaviorDisposable<TT;>;"
    sget-object v1, Lio/reactivex/subjects/BehaviorSubject;->TERMINATED:[Lio/reactivex/subjects/BehaviorSubject$BehaviorDisposable;

    if-eq v0, v1, :cond_0

    .line 374
    invoke-virtual {p0, p1}, Lio/reactivex/subjects/BehaviorSubject;->setCurrent(Ljava/lang/Object;)V

    .line 378
    :cond_0
    return-object v0
.end method
