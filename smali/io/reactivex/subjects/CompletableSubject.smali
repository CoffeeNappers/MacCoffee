.class public final Lio/reactivex/subjects/CompletableSubject;
.super Lio/reactivex/Completable;
.source "CompletableSubject.java"

# interfaces
.implements Lio/reactivex/CompletableObserver;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/reactivex/subjects/CompletableSubject$CompletableDisposable;
    }
.end annotation

.annotation build Lio/reactivex/annotations/Experimental;
.end annotation


# static fields
.field static final EMPTY:[Lio/reactivex/subjects/CompletableSubject$CompletableDisposable;

.field static final TERMINATED:[Lio/reactivex/subjects/CompletableSubject$CompletableDisposable;


# instance fields
.field error:Ljava/lang/Throwable;

.field final observers:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<[",
            "Lio/reactivex/subjects/CompletableSubject$CompletableDisposable;",
            ">;"
        }
    .end annotation
.end field

.field final once:Ljava/util/concurrent/atomic/AtomicBoolean;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 39
    new-array v0, v1, [Lio/reactivex/subjects/CompletableSubject$CompletableDisposable;

    sput-object v0, Lio/reactivex/subjects/CompletableSubject;->EMPTY:[Lio/reactivex/subjects/CompletableSubject$CompletableDisposable;

    .line 41
    new-array v0, v1, [Lio/reactivex/subjects/CompletableSubject$CompletableDisposable;

    sput-object v0, Lio/reactivex/subjects/CompletableSubject;->TERMINATED:[Lio/reactivex/subjects/CompletableSubject$CompletableDisposable;

    return-void
.end method

.method constructor <init>()V
    .locals 2

    .prologue
    .line 55
    invoke-direct {p0}, Lio/reactivex/Completable;-><init>()V

    .line 56
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    iput-object v0, p0, Lio/reactivex/subjects/CompletableSubject;->once:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 57
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    sget-object v1, Lio/reactivex/subjects/CompletableSubject;->EMPTY:[Lio/reactivex/subjects/CompletableSubject$CompletableDisposable;

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lio/reactivex/subjects/CompletableSubject;->observers:Ljava/util/concurrent/atomic/AtomicReference;

    .line 58
    return-void
.end method

.method public static create()Lio/reactivex/subjects/CompletableSubject;
    .locals 1
    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .prologue
    .line 52
    new-instance v0, Lio/reactivex/subjects/CompletableSubject;

    invoke-direct {v0}, Lio/reactivex/subjects/CompletableSubject;-><init>()V

    return-object v0
.end method


# virtual methods
.method add(Lio/reactivex/subjects/CompletableSubject$CompletableDisposable;)Z
    .locals 5
    .param p1, "inner"    # Lio/reactivex/subjects/CompletableSubject$CompletableDisposable;

    .prologue
    const/4 v3, 0x0

    .line 111
    :cond_0
    iget-object v4, p0, Lio/reactivex/subjects/CompletableSubject;->observers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/reactivex/subjects/CompletableSubject$CompletableDisposable;

    .line 112
    .local v0, "a":[Lio/reactivex/subjects/CompletableSubject$CompletableDisposable;
    sget-object v4, Lio/reactivex/subjects/CompletableSubject;->TERMINATED:[Lio/reactivex/subjects/CompletableSubject$CompletableDisposable;

    if-ne v0, v4, :cond_1

    .line 122
    :goto_0
    return v3

    .line 116
    :cond_1
    array-length v2, v0

    .line 118
    .local v2, "n":I
    add-int/lit8 v4, v2, 0x1

    new-array v1, v4, [Lio/reactivex/subjects/CompletableSubject$CompletableDisposable;

    .line 119
    .local v1, "b":[Lio/reactivex/subjects/CompletableSubject$CompletableDisposable;
    invoke-static {v0, v3, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 120
    aput-object p1, v1, v2

    .line 121
    iget-object v4, p0, Lio/reactivex/subjects/CompletableSubject;->observers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v4, v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 122
    const/4 v3, 0x1

    goto :goto_0
.end method

.method public getThrowable()Ljava/lang/Throwable;
    .locals 2

    .prologue
    .line 167
    iget-object v0, p0, Lio/reactivex/subjects/CompletableSubject;->observers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lio/reactivex/subjects/CompletableSubject;->TERMINATED:[Lio/reactivex/subjects/CompletableSubject$CompletableDisposable;

    if-ne v0, v1, :cond_0

    .line 168
    iget-object v0, p0, Lio/reactivex/subjects/CompletableSubject;->error:Ljava/lang/Throwable;

    .line 170
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public hasComplete()Z
    .locals 2

    .prologue
    .line 186
    iget-object v0, p0, Lio/reactivex/subjects/CompletableSubject;->observers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lio/reactivex/subjects/CompletableSubject;->TERMINATED:[Lio/reactivex/subjects/CompletableSubject$CompletableDisposable;

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lio/reactivex/subjects/CompletableSubject;->error:Ljava/lang/Throwable;

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
    .line 194
    iget-object v0, p0, Lio/reactivex/subjects/CompletableSubject;->observers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/reactivex/subjects/CompletableSubject$CompletableDisposable;

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
    .line 178
    iget-object v0, p0, Lio/reactivex/subjects/CompletableSubject;->observers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lio/reactivex/subjects/CompletableSubject;->TERMINATED:[Lio/reactivex/subjects/CompletableSubject$CompletableDisposable;

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lio/reactivex/subjects/CompletableSubject;->error:Ljava/lang/Throwable;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method observerCount()I
    .locals 1

    .prologue
    .line 202
    iget-object v0, p0, Lio/reactivex/subjects/CompletableSubject;->observers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/reactivex/subjects/CompletableSubject$CompletableDisposable;

    array-length v0, v0

    return v0
.end method

.method public onComplete()V
    .locals 7

    .prologue
    .line 84
    iget-object v4, p0, Lio/reactivex/subjects/CompletableSubject;->once:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v5, 0x0

    const/4 v6, 0x1

    invoke-virtual {v4, v5, v6}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 85
    iget-object v4, p0, Lio/reactivex/subjects/CompletableSubject;->observers:Ljava/util/concurrent/atomic/AtomicReference;

    sget-object v5, Lio/reactivex/subjects/CompletableSubject;->TERMINATED:[Lio/reactivex/subjects/CompletableSubject$CompletableDisposable;

    invoke-virtual {v4, v5}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/reactivex/subjects/CompletableSubject$CompletableDisposable;

    .local v0, "arr$":[Lio/reactivex/subjects/CompletableSubject$CompletableDisposable;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_0
    if-ge v1, v2, :cond_0

    aget-object v3, v0, v1

    .line 86
    .local v3, "md":Lio/reactivex/subjects/CompletableSubject$CompletableDisposable;
    iget-object v4, v3, Lio/reactivex/subjects/CompletableSubject$CompletableDisposable;->actual:Lio/reactivex/CompletableObserver;

    invoke-interface {v4}, Lio/reactivex/CompletableObserver;->onComplete()V

    .line 85
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 89
    .end local v0    # "arr$":[Lio/reactivex/subjects/CompletableSubject$CompletableDisposable;
    .end local v1    # "i$":I
    .end local v2    # "len$":I
    .end local v3    # "md":Lio/reactivex/subjects/CompletableSubject$CompletableDisposable;
    :cond_0
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 7
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 69
    if-nez p1, :cond_0

    .line 70
    new-instance p1, Ljava/lang/NullPointerException;

    .end local p1    # "e":Ljava/lang/Throwable;
    const-string/jumbo v4, "Null errors are not allowed in 2.x"

    invoke-direct {p1, v4}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 72
    .restart local p1    # "e":Ljava/lang/Throwable;
    :cond_0
    iget-object v4, p0, Lio/reactivex/subjects/CompletableSubject;->once:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v5, 0x0

    const/4 v6, 0x1

    invoke-virtual {v4, v5, v6}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 73
    iput-object p1, p0, Lio/reactivex/subjects/CompletableSubject;->error:Ljava/lang/Throwable;

    .line 74
    iget-object v4, p0, Lio/reactivex/subjects/CompletableSubject;->observers:Ljava/util/concurrent/atomic/AtomicReference;

    sget-object v5, Lio/reactivex/subjects/CompletableSubject;->TERMINATED:[Lio/reactivex/subjects/CompletableSubject$CompletableDisposable;

    invoke-virtual {v4, v5}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/reactivex/subjects/CompletableSubject$CompletableDisposable;

    .local v0, "arr$":[Lio/reactivex/subjects/CompletableSubject$CompletableDisposable;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_0
    if-ge v1, v2, :cond_2

    aget-object v3, v0, v1

    .line 75
    .local v3, "md":Lio/reactivex/subjects/CompletableSubject$CompletableDisposable;
    iget-object v4, v3, Lio/reactivex/subjects/CompletableSubject$CompletableDisposable;->actual:Lio/reactivex/CompletableObserver;

    invoke-interface {v4, p1}, Lio/reactivex/CompletableObserver;->onError(Ljava/lang/Throwable;)V

    .line 74
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 78
    .end local v0    # "arr$":[Lio/reactivex/subjects/CompletableSubject$CompletableDisposable;
    .end local v1    # "i$":I
    .end local v2    # "len$":I
    .end local v3    # "md":Lio/reactivex/subjects/CompletableSubject$CompletableDisposable;
    :cond_1
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    .line 80
    :cond_2
    return-void
.end method

.method public onSubscribe(Lio/reactivex/disposables/Disposable;)V
    .locals 2
    .param p1, "d"    # Lio/reactivex/disposables/Disposable;

    .prologue
    .line 62
    iget-object v0, p0, Lio/reactivex/subjects/CompletableSubject;->observers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lio/reactivex/subjects/CompletableSubject;->TERMINATED:[Lio/reactivex/subjects/CompletableSubject$CompletableDisposable;

    if-ne v0, v1, :cond_0

    .line 63
    invoke-interface {p1}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 65
    :cond_0
    return-void
.end method

.method remove(Lio/reactivex/subjects/CompletableSubject$CompletableDisposable;)V
    .locals 8
    .param p1, "inner"    # Lio/reactivex/subjects/CompletableSubject$CompletableDisposable;

    .prologue
    const/4 v7, 0x0

    .line 129
    :cond_0
    iget-object v5, p0, Lio/reactivex/subjects/CompletableSubject;->observers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v5}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/reactivex/subjects/CompletableSubject$CompletableDisposable;

    .line 130
    .local v0, "a":[Lio/reactivex/subjects/CompletableSubject$CompletableDisposable;
    array-length v4, v0

    .line 131
    .local v4, "n":I
    if-nez v4, :cond_2

    .line 157
    :cond_1
    :goto_0
    return-void

    .line 135
    :cond_2
    const/4 v3, -0x1

    .line 137
    .local v3, "j":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    if-ge v2, v4, :cond_3

    .line 138
    aget-object v5, v0, v2

    if-ne v5, p1, :cond_4

    .line 139
    move v3, v2

    .line 144
    :cond_3
    if-ltz v3, :cond_1

    .line 148
    const/4 v5, 0x1

    if-ne v4, v5, :cond_5

    .line 149
    sget-object v1, Lio/reactivex/subjects/CompletableSubject;->EMPTY:[Lio/reactivex/subjects/CompletableSubject$CompletableDisposable;

    .line 156
    .local v1, "b":[Lio/reactivex/subjects/CompletableSubject$CompletableDisposable;
    :goto_2
    iget-object v5, p0, Lio/reactivex/subjects/CompletableSubject;->observers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v5, v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    goto :goto_0

    .line 137
    .end local v1    # "b":[Lio/reactivex/subjects/CompletableSubject$CompletableDisposable;
    :cond_4
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 151
    :cond_5
    add-int/lit8 v5, v4, -0x1

    new-array v1, v5, [Lio/reactivex/subjects/CompletableSubject$CompletableDisposable;

    .line 152
    .restart local v1    # "b":[Lio/reactivex/subjects/CompletableSubject$CompletableDisposable;
    invoke-static {v0, v7, v1, v7, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 153
    add-int/lit8 v5, v3, 0x1

    sub-int v6, v4, v3

    add-int/lit8 v6, v6, -0x1

    invoke-static {v0, v5, v1, v3, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_2
.end method

.method protected subscribeActual(Lio/reactivex/CompletableObserver;)V
    .locals 3
    .param p1, "observer"    # Lio/reactivex/CompletableObserver;

    .prologue
    .line 93
    new-instance v1, Lio/reactivex/subjects/CompletableSubject$CompletableDisposable;

    invoke-direct {v1, p1, p0}, Lio/reactivex/subjects/CompletableSubject$CompletableDisposable;-><init>(Lio/reactivex/CompletableObserver;Lio/reactivex/subjects/CompletableSubject;)V

    .line 94
    .local v1, "md":Lio/reactivex/subjects/CompletableSubject$CompletableDisposable;
    invoke-interface {p1, v1}, Lio/reactivex/CompletableObserver;->onSubscribe(Lio/reactivex/disposables/Disposable;)V

    .line 95
    invoke-virtual {p0, v1}, Lio/reactivex/subjects/CompletableSubject;->add(Lio/reactivex/subjects/CompletableSubject$CompletableDisposable;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 96
    invoke-virtual {v1}, Lio/reactivex/subjects/CompletableSubject$CompletableDisposable;->isDisposed()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 97
    invoke-virtual {p0, v1}, Lio/reactivex/subjects/CompletableSubject;->remove(Lio/reactivex/subjects/CompletableSubject$CompletableDisposable;)V

    .line 107
    :cond_0
    :goto_0
    return-void

    .line 100
    :cond_1
    iget-object v0, p0, Lio/reactivex/subjects/CompletableSubject;->error:Ljava/lang/Throwable;

    .line 101
    .local v0, "ex":Ljava/lang/Throwable;
    if-eqz v0, :cond_2

    .line 102
    invoke-interface {p1, v0}, Lio/reactivex/CompletableObserver;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 104
    :cond_2
    invoke-interface {p1}, Lio/reactivex/CompletableObserver;->onComplete()V

    goto :goto_0
.end method
