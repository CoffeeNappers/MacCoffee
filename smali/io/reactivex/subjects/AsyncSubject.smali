.class public final Lio/reactivex/subjects/AsyncSubject;
.super Lio/reactivex/subjects/Subject;
.source "AsyncSubject.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/reactivex/subjects/AsyncSubject$AsyncDisposable;
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
.field static final EMPTY:[Lio/reactivex/subjects/AsyncSubject$AsyncDisposable;

.field static final TERMINATED:[Lio/reactivex/subjects/AsyncSubject$AsyncDisposable;


# instance fields
.field error:Ljava/lang/Throwable;

.field final subscribers:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<[",
            "Lio/reactivex/subjects/AsyncSubject$AsyncDisposable",
            "<TT;>;>;"
        }
    .end annotation
.end field

.field value:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 37
    new-array v0, v1, [Lio/reactivex/subjects/AsyncSubject$AsyncDisposable;

    sput-object v0, Lio/reactivex/subjects/AsyncSubject;->EMPTY:[Lio/reactivex/subjects/AsyncSubject$AsyncDisposable;

    .line 40
    new-array v0, v1, [Lio/reactivex/subjects/AsyncSubject$AsyncDisposable;

    sput-object v0, Lio/reactivex/subjects/AsyncSubject;->TERMINATED:[Lio/reactivex/subjects/AsyncSubject$AsyncDisposable;

    return-void
.end method

.method constructor <init>()V
    .locals 2

    .prologue
    .line 65
    .local p0, "this":Lio/reactivex/subjects/AsyncSubject;, "Lio/reactivex/subjects/AsyncSubject<TT;>;"
    invoke-direct {p0}, Lio/reactivex/subjects/Subject;-><init>()V

    .line 66
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    sget-object v1, Lio/reactivex/subjects/AsyncSubject;->EMPTY:[Lio/reactivex/subjects/AsyncSubject$AsyncDisposable;

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lio/reactivex/subjects/AsyncSubject;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    .line 67
    return-void
.end method

.method public static create()Lio/reactivex/subjects/AsyncSubject;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">()",
            "Lio/reactivex/subjects/AsyncSubject",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .prologue
    .line 57
    new-instance v0, Lio/reactivex/subjects/AsyncSubject;

    invoke-direct {v0}, Lio/reactivex/subjects/AsyncSubject;-><init>()V

    return-object v0
.end method


# virtual methods
.method add(Lio/reactivex/subjects/AsyncSubject$AsyncDisposable;)Z
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/subjects/AsyncSubject$AsyncDisposable",
            "<TT;>;)Z"
        }
    .end annotation

    .prologue
    .local p0, "this":Lio/reactivex/subjects/AsyncSubject;, "Lio/reactivex/subjects/AsyncSubject<TT;>;"
    .local p1, "ps":Lio/reactivex/subjects/AsyncSubject$AsyncDisposable;, "Lio/reactivex/subjects/AsyncSubject$AsyncDisposable<TT;>;"
    const/4 v3, 0x0

    .line 185
    :cond_0
    iget-object v4, p0, Lio/reactivex/subjects/AsyncSubject;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/reactivex/subjects/AsyncSubject$AsyncDisposable;

    .line 186
    .local v0, "a":[Lio/reactivex/subjects/AsyncSubject$AsyncDisposable;, "[Lio/reactivex/subjects/AsyncSubject$AsyncDisposable<TT;>;"
    sget-object v4, Lio/reactivex/subjects/AsyncSubject;->TERMINATED:[Lio/reactivex/subjects/AsyncSubject$AsyncDisposable;

    if-ne v0, v4, :cond_1

    .line 197
    :goto_0
    return v3

    .line 190
    :cond_1
    array-length v2, v0

    .line 192
    .local v2, "n":I
    add-int/lit8 v4, v2, 0x1

    new-array v1, v4, [Lio/reactivex/subjects/AsyncSubject$AsyncDisposable;

    .line 193
    .local v1, "b":[Lio/reactivex/subjects/AsyncSubject$AsyncDisposable;, "[Lio/reactivex/subjects/AsyncSubject$AsyncDisposable<TT;>;"
    invoke-static {v0, v3, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 194
    aput-object p1, v1, v2

    .line 196
    iget-object v4, p0, Lio/reactivex/subjects/AsyncSubject;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v4, v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 197
    const/4 v3, 0x1

    goto :goto_0
.end method

.method public getThrowable()Ljava/lang/Throwable;
    .locals 2

    .prologue
    .line 151
    .local p0, "this":Lio/reactivex/subjects/AsyncSubject;, "Lio/reactivex/subjects/AsyncSubject<TT;>;"
    iget-object v0, p0, Lio/reactivex/subjects/AsyncSubject;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lio/reactivex/subjects/AsyncSubject;->TERMINATED:[Lio/reactivex/subjects/AsyncSubject$AsyncDisposable;

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lio/reactivex/subjects/AsyncSubject;->error:Ljava/lang/Throwable;

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

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
    .line 257
    .local p0, "this":Lio/reactivex/subjects/AsyncSubject;, "Lio/reactivex/subjects/AsyncSubject<TT;>;"
    iget-object v0, p0, Lio/reactivex/subjects/AsyncSubject;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lio/reactivex/subjects/AsyncSubject;->TERMINATED:[Lio/reactivex/subjects/AsyncSubject$AsyncDisposable;

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lio/reactivex/subjects/AsyncSubject;->value:Ljava/lang/Object;

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getValues()[Ljava/lang/Object;
    .locals 3

    .prologue
    .local p0, "this":Lio/reactivex/subjects/AsyncSubject;, "Lio/reactivex/subjects/AsyncSubject<TT;>;"
    const/4 v2, 0x0

    .line 266
    invoke-virtual {p0}, Lio/reactivex/subjects/AsyncSubject;->getValue()Ljava/lang/Object;

    move-result-object v0

    .line 267
    .local v0, "v":Ljava/lang/Object;, "TT;"
    if-eqz v0, :cond_0

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    aput-object v0, v1, v2

    :goto_0
    return-object v1

    :cond_0
    new-array v1, v2, [Ljava/lang/Object;

    goto :goto_0
.end method

.method public getValues([Ljava/lang/Object;)[Ljava/lang/Object;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([TT;)[TT;"
        }
    .end annotation

    .prologue
    .local p0, "this":Lio/reactivex/subjects/AsyncSubject;, "Lio/reactivex/subjects/AsyncSubject<TT;>;"
    .local p1, "array":[Ljava/lang/Object;, "[TT;"
    const/4 v5, 0x0

    const/4 v4, 0x0

    const/4 v3, 0x1

    .line 279
    invoke-virtual {p0}, Lio/reactivex/subjects/AsyncSubject;->getValue()Ljava/lang/Object;

    move-result-object v1

    .line 280
    .local v1, "v":Ljava/lang/Object;, "TT;"
    if-nez v1, :cond_1

    .line 281
    array-length v2, p1

    if-eqz v2, :cond_0

    .line 282
    aput-object v5, p1, v4

    :cond_0
    move-object v0, p1

    .line 293
    .end local p1    # "array":[Ljava/lang/Object;, "[TT;"
    .local v0, "array":[Ljava/lang/Object;, "[TT;"
    :goto_0
    return-object v0

    .line 286
    .end local v0    # "array":[Ljava/lang/Object;, "[TT;"
    .restart local p1    # "array":[Ljava/lang/Object;, "[TT;"
    :cond_1
    array-length v2, p1

    if-nez v2, :cond_2

    .line 287
    invoke-static {p1, v3}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object p1

    .line 289
    :cond_2
    aput-object v1, p1, v4

    .line 290
    array-length v2, p1

    if-eq v2, v3, :cond_3

    .line 291
    aput-object v5, p1, v3

    :cond_3
    move-object v0, p1

    .line 293
    .end local p1    # "array":[Ljava/lang/Object;, "[TT;"
    .restart local v0    # "array":[Ljava/lang/Object;, "[TT;"
    goto :goto_0
.end method

.method public hasComplete()Z
    .locals 2

    .prologue
    .line 146
    .local p0, "this":Lio/reactivex/subjects/AsyncSubject;, "Lio/reactivex/subjects/AsyncSubject<TT;>;"
    iget-object v0, p0, Lio/reactivex/subjects/AsyncSubject;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lio/reactivex/subjects/AsyncSubject;->TERMINATED:[Lio/reactivex/subjects/AsyncSubject$AsyncDisposable;

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lio/reactivex/subjects/AsyncSubject;->error:Ljava/lang/Throwable;

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public hasObservers()Z
    .locals 1

    .prologue
    .line 136
    .local p0, "this":Lio/reactivex/subjects/AsyncSubject;, "Lio/reactivex/subjects/AsyncSubject<TT;>;"
    iget-object v0, p0, Lio/reactivex/subjects/AsyncSubject;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/reactivex/subjects/AsyncSubject$AsyncDisposable;

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
    .line 141
    .local p0, "this":Lio/reactivex/subjects/AsyncSubject;, "Lio/reactivex/subjects/AsyncSubject<TT;>;"
    iget-object v0, p0, Lio/reactivex/subjects/AsyncSubject;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lio/reactivex/subjects/AsyncSubject;->TERMINATED:[Lio/reactivex/subjects/AsyncSubject$AsyncDisposable;

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lio/reactivex/subjects/AsyncSubject;->error:Ljava/lang/Throwable;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public hasValue()Z
    .locals 2

    .prologue
    .line 248
    .local p0, "this":Lio/reactivex/subjects/AsyncSubject;, "Lio/reactivex/subjects/AsyncSubject<TT;>;"
    iget-object v0, p0, Lio/reactivex/subjects/AsyncSubject;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lio/reactivex/subjects/AsyncSubject;->TERMINATED:[Lio/reactivex/subjects/AsyncSubject$AsyncDisposable;

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lio/reactivex/subjects/AsyncSubject;->value:Ljava/lang/Object;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method nullOnNext()V
    .locals 7

    .prologue
    .line 90
    .local p0, "this":Lio/reactivex/subjects/AsyncSubject;, "Lio/reactivex/subjects/AsyncSubject<TT;>;"
    const/4 v5, 0x0

    iput-object v5, p0, Lio/reactivex/subjects/AsyncSubject;->value:Ljava/lang/Object;

    .line 91
    new-instance v2, Ljava/lang/NullPointerException;

    const-string/jumbo v5, "onNext called with null. Null values are generally not allowed in 2.x operators and sources."

    invoke-direct {v2, v5}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 92
    .local v2, "ex":Ljava/lang/Throwable;
    iput-object v2, p0, Lio/reactivex/subjects/AsyncSubject;->error:Ljava/lang/Throwable;

    .line 93
    iget-object v5, p0, Lio/reactivex/subjects/AsyncSubject;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    sget-object v6, Lio/reactivex/subjects/AsyncSubject;->TERMINATED:[Lio/reactivex/subjects/AsyncSubject$AsyncDisposable;

    invoke-virtual {v5, v6}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/reactivex/subjects/AsyncSubject$AsyncDisposable;

    .local v0, "arr$":[Lio/reactivex/subjects/AsyncSubject$AsyncDisposable;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_0
    if-ge v3, v4, :cond_0

    aget-object v1, v0, v3

    .line 94
    .local v1, "as":Lio/reactivex/subjects/AsyncSubject$AsyncDisposable;, "Lio/reactivex/subjects/AsyncSubject$AsyncDisposable<TT;>;"
    invoke-virtual {v1, v2}, Lio/reactivex/subjects/AsyncSubject$AsyncDisposable;->onError(Ljava/lang/Throwable;)V

    .line 93
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 96
    .end local v1    # "as":Lio/reactivex/subjects/AsyncSubject$AsyncDisposable;, "Lio/reactivex/subjects/AsyncSubject$AsyncDisposable<TT;>;"
    :cond_0
    return-void
.end method

.method public onComplete()V
    .locals 8

    .prologue
    .line 118
    .local p0, "this":Lio/reactivex/subjects/AsyncSubject;, "Lio/reactivex/subjects/AsyncSubject<TT;>;"
    iget-object v6, p0, Lio/reactivex/subjects/AsyncSubject;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v6}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v6

    sget-object v7, Lio/reactivex/subjects/AsyncSubject;->TERMINATED:[Lio/reactivex/subjects/AsyncSubject$AsyncDisposable;

    if-ne v6, v7, :cond_1

    .line 132
    :cond_0
    return-void

    .line 121
    :cond_1
    iget-object v5, p0, Lio/reactivex/subjects/AsyncSubject;->value:Ljava/lang/Object;

    .line 122
    .local v5, "v":Ljava/lang/Object;, "TT;"
    iget-object v6, p0, Lio/reactivex/subjects/AsyncSubject;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    sget-object v7, Lio/reactivex/subjects/AsyncSubject;->TERMINATED:[Lio/reactivex/subjects/AsyncSubject$AsyncDisposable;

    invoke-virtual {v6, v7}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Lio/reactivex/subjects/AsyncSubject$AsyncDisposable;

    .line 123
    .local v1, "array":[Lio/reactivex/subjects/AsyncSubject$AsyncDisposable;, "[Lio/reactivex/subjects/AsyncSubject$AsyncDisposable<TT;>;"
    if-nez v5, :cond_2

    .line 124
    move-object v0, v1

    .local v0, "arr$":[Lio/reactivex/subjects/AsyncSubject$AsyncDisposable;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_0
    if-ge v3, v4, :cond_0

    aget-object v2, v0, v3

    .line 125
    .local v2, "as":Lio/reactivex/subjects/AsyncSubject$AsyncDisposable;, "Lio/reactivex/subjects/AsyncSubject$AsyncDisposable<TT;>;"
    invoke-virtual {v2}, Lio/reactivex/subjects/AsyncSubject$AsyncDisposable;->onComplete()V

    .line 124
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 128
    .end local v0    # "arr$":[Lio/reactivex/subjects/AsyncSubject$AsyncDisposable;
    .end local v2    # "as":Lio/reactivex/subjects/AsyncSubject$AsyncDisposable;, "Lio/reactivex/subjects/AsyncSubject$AsyncDisposable<TT;>;"
    .end local v3    # "i$":I
    .end local v4    # "len$":I
    :cond_2
    move-object v0, v1

    .restart local v0    # "arr$":[Lio/reactivex/subjects/AsyncSubject$AsyncDisposable;
    array-length v4, v0

    .restart local v4    # "len$":I
    const/4 v3, 0x0

    .restart local v3    # "i$":I
    :goto_1
    if-ge v3, v4, :cond_0

    aget-object v2, v0, v3

    .line 129
    .restart local v2    # "as":Lio/reactivex/subjects/AsyncSubject$AsyncDisposable;, "Lio/reactivex/subjects/AsyncSubject$AsyncDisposable<TT;>;"
    invoke-virtual {v2, v5}, Lio/reactivex/subjects/AsyncSubject$AsyncDisposable;->complete(Ljava/lang/Object;)V

    .line 128
    add-int/lit8 v3, v3, 0x1

    goto :goto_1
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 6
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 101
    .local p0, "this":Lio/reactivex/subjects/AsyncSubject;, "Lio/reactivex/subjects/AsyncSubject<TT;>;"
    if-nez p1, :cond_0

    .line 102
    new-instance p1, Ljava/lang/NullPointerException;

    .end local p1    # "t":Ljava/lang/Throwable;
    const-string/jumbo v4, "onError called with null. Null values are generally not allowed in 2.x operators and sources."

    invoke-direct {p1, v4}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 104
    .restart local p1    # "t":Ljava/lang/Throwable;
    :cond_0
    iget-object v4, p0, Lio/reactivex/subjects/AsyncSubject;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v4

    sget-object v5, Lio/reactivex/subjects/AsyncSubject;->TERMINATED:[Lio/reactivex/subjects/AsyncSubject$AsyncDisposable;

    if-ne v4, v5, :cond_2

    .line 105
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    .line 113
    :cond_1
    return-void

    .line 108
    :cond_2
    const/4 v4, 0x0

    iput-object v4, p0, Lio/reactivex/subjects/AsyncSubject;->value:Ljava/lang/Object;

    .line 109
    iput-object p1, p0, Lio/reactivex/subjects/AsyncSubject;->error:Ljava/lang/Throwable;

    .line 110
    iget-object v4, p0, Lio/reactivex/subjects/AsyncSubject;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    sget-object v5, Lio/reactivex/subjects/AsyncSubject;->TERMINATED:[Lio/reactivex/subjects/AsyncSubject$AsyncDisposable;

    invoke-virtual {v4, v5}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/reactivex/subjects/AsyncSubject$AsyncDisposable;

    .local v0, "arr$":[Lio/reactivex/subjects/AsyncSubject$AsyncDisposable;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_0
    if-ge v2, v3, :cond_1

    aget-object v1, v0, v2

    .line 111
    .local v1, "as":Lio/reactivex/subjects/AsyncSubject$AsyncDisposable;, "Lio/reactivex/subjects/AsyncSubject$AsyncDisposable<TT;>;"
    invoke-virtual {v1, p1}, Lio/reactivex/subjects/AsyncSubject$AsyncDisposable;->onError(Ljava/lang/Throwable;)V

    .line 110
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 78
    .local p0, "this":Lio/reactivex/subjects/AsyncSubject;, "Lio/reactivex/subjects/AsyncSubject<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget-object v0, p0, Lio/reactivex/subjects/AsyncSubject;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lio/reactivex/subjects/AsyncSubject;->TERMINATED:[Lio/reactivex/subjects/AsyncSubject$AsyncDisposable;

    if-ne v0, v1, :cond_0

    .line 86
    :goto_0
    return-void

    .line 81
    :cond_0
    if-nez p1, :cond_1

    .line 82
    invoke-virtual {p0}, Lio/reactivex/subjects/AsyncSubject;->nullOnNext()V

    goto :goto_0

    .line 85
    :cond_1
    iput-object p1, p0, Lio/reactivex/subjects/AsyncSubject;->value:Ljava/lang/Object;

    goto :goto_0
.end method

.method public onSubscribe(Lio/reactivex/disposables/Disposable;)V
    .locals 2
    .param p1, "s"    # Lio/reactivex/disposables/Disposable;

    .prologue
    .line 71
    .local p0, "this":Lio/reactivex/subjects/AsyncSubject;, "Lio/reactivex/subjects/AsyncSubject<TT;>;"
    iget-object v0, p0, Lio/reactivex/subjects/AsyncSubject;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lio/reactivex/subjects/AsyncSubject;->TERMINATED:[Lio/reactivex/subjects/AsyncSubject$AsyncDisposable;

    if-ne v0, v1, :cond_0

    .line 72
    invoke-interface {p1}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 74
    :cond_0
    return-void
.end method

.method remove(Lio/reactivex/subjects/AsyncSubject$AsyncDisposable;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/subjects/AsyncSubject$AsyncDisposable",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lio/reactivex/subjects/AsyncSubject;, "Lio/reactivex/subjects/AsyncSubject<TT;>;"
    .local p1, "ps":Lio/reactivex/subjects/AsyncSubject$AsyncDisposable;, "Lio/reactivex/subjects/AsyncSubject$AsyncDisposable<TT;>;"
    const/4 v7, 0x0

    .line 209
    :cond_0
    iget-object v5, p0, Lio/reactivex/subjects/AsyncSubject;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v5}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/reactivex/subjects/AsyncSubject$AsyncDisposable;

    .line 210
    .local v0, "a":[Lio/reactivex/subjects/AsyncSubject$AsyncDisposable;, "[Lio/reactivex/subjects/AsyncSubject$AsyncDisposable<TT;>;"
    array-length v4, v0

    .line 211
    .local v4, "n":I
    if-nez v4, :cond_2

    .line 237
    :cond_1
    :goto_0
    return-void

    .line 215
    :cond_2
    const/4 v3, -0x1

    .line 216
    .local v3, "j":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    if-ge v2, v4, :cond_3

    .line 217
    aget-object v5, v0, v2

    if-ne v5, p1, :cond_4

    .line 218
    move v3, v2

    .line 223
    :cond_3
    if-ltz v3, :cond_1

    .line 229
    const/4 v5, 0x1

    if-ne v4, v5, :cond_5

    .line 230
    sget-object v1, Lio/reactivex/subjects/AsyncSubject;->EMPTY:[Lio/reactivex/subjects/AsyncSubject$AsyncDisposable;

    .line 236
    .local v1, "b":[Lio/reactivex/subjects/AsyncSubject$AsyncDisposable;, "[Lio/reactivex/subjects/AsyncSubject$AsyncDisposable<TT;>;"
    :goto_2
    iget-object v5, p0, Lio/reactivex/subjects/AsyncSubject;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v5, v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    goto :goto_0

    .line 216
    .end local v1    # "b":[Lio/reactivex/subjects/AsyncSubject$AsyncDisposable;, "[Lio/reactivex/subjects/AsyncSubject$AsyncDisposable<TT;>;"
    :cond_4
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 232
    :cond_5
    add-int/lit8 v5, v4, -0x1

    new-array v1, v5, [Lio/reactivex/subjects/AsyncSubject$AsyncDisposable;

    .line 233
    .restart local v1    # "b":[Lio/reactivex/subjects/AsyncSubject$AsyncDisposable;, "[Lio/reactivex/subjects/AsyncSubject$AsyncDisposable<TT;>;"
    invoke-static {v0, v7, v1, v7, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 234
    add-int/lit8 v5, v3, 0x1

    sub-int v6, v4, v3

    add-int/lit8 v6, v6, -0x1

    invoke-static {v0, v5, v1, v3, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_2
.end method

.method protected subscribeActual(Lio/reactivex/Observer;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Observer",
            "<-TT;>;)V"
        }
    .end annotation

    .prologue
    .line 156
    .local p0, "this":Lio/reactivex/subjects/AsyncSubject;, "Lio/reactivex/subjects/AsyncSubject<TT;>;"
    .local p1, "s":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TT;>;"
    new-instance v0, Lio/reactivex/subjects/AsyncSubject$AsyncDisposable;

    invoke-direct {v0, p1, p0}, Lio/reactivex/subjects/AsyncSubject$AsyncDisposable;-><init>(Lio/reactivex/Observer;Lio/reactivex/subjects/AsyncSubject;)V

    .line 157
    .local v0, "as":Lio/reactivex/subjects/AsyncSubject$AsyncDisposable;, "Lio/reactivex/subjects/AsyncSubject$AsyncDisposable<TT;>;"
    invoke-interface {p1, v0}, Lio/reactivex/Observer;->onSubscribe(Lio/reactivex/disposables/Disposable;)V

    .line 158
    invoke-virtual {p0, v0}, Lio/reactivex/subjects/AsyncSubject;->add(Lio/reactivex/subjects/AsyncSubject$AsyncDisposable;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 159
    invoke-virtual {v0}, Lio/reactivex/subjects/AsyncSubject$AsyncDisposable;->isDisposed()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 160
    invoke-virtual {p0, v0}, Lio/reactivex/subjects/AsyncSubject;->remove(Lio/reactivex/subjects/AsyncSubject$AsyncDisposable;)V

    .line 175
    :cond_0
    :goto_0
    return-void

    .line 163
    :cond_1
    iget-object v1, p0, Lio/reactivex/subjects/AsyncSubject;->error:Ljava/lang/Throwable;

    .line 164
    .local v1, "ex":Ljava/lang/Throwable;
    if-eqz v1, :cond_2

    .line 165
    invoke-interface {p1, v1}, Lio/reactivex/Observer;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 167
    :cond_2
    iget-object v2, p0, Lio/reactivex/subjects/AsyncSubject;->value:Ljava/lang/Object;

    .line 168
    .local v2, "v":Ljava/lang/Object;, "TT;"
    if-eqz v2, :cond_3

    .line 169
    invoke-virtual {v0, v2}, Lio/reactivex/subjects/AsyncSubject$AsyncDisposable;->complete(Ljava/lang/Object;)V

    goto :goto_0

    .line 171
    :cond_3
    invoke-virtual {v0}, Lio/reactivex/subjects/AsyncSubject$AsyncDisposable;->onComplete()V

    goto :goto_0
.end method
