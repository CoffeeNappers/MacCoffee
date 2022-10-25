.class public final Lio/reactivex/subjects/MaybeSubject;
.super Lio/reactivex/Maybe;
.source "MaybeSubject.java"

# interfaces
.implements Lio/reactivex/MaybeObserver;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/reactivex/subjects/MaybeSubject$MaybeDisposable;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/Maybe",
        "<TT;>;",
        "Lio/reactivex/MaybeObserver",
        "<TT;>;"
    }
.end annotation

.annotation build Lio/reactivex/annotations/Experimental;
.end annotation


# static fields
.field static final EMPTY:[Lio/reactivex/subjects/MaybeSubject$MaybeDisposable;

.field static final TERMINATED:[Lio/reactivex/subjects/MaybeSubject$MaybeDisposable;


# instance fields
.field error:Ljava/lang/Throwable;

.field final observers:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<[",
            "Lio/reactivex/subjects/MaybeSubject$MaybeDisposable",
            "<TT;>;>;"
        }
    .end annotation
.end field

.field final once:Ljava/util/concurrent/atomic/AtomicBoolean;

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

    .line 41
    new-array v0, v1, [Lio/reactivex/subjects/MaybeSubject$MaybeDisposable;

    sput-object v0, Lio/reactivex/subjects/MaybeSubject;->EMPTY:[Lio/reactivex/subjects/MaybeSubject$MaybeDisposable;

    .line 44
    new-array v0, v1, [Lio/reactivex/subjects/MaybeSubject$MaybeDisposable;

    sput-object v0, Lio/reactivex/subjects/MaybeSubject;->TERMINATED:[Lio/reactivex/subjects/MaybeSubject$MaybeDisposable;

    return-void
.end method

.method constructor <init>()V
    .locals 2

    .prologue
    .line 61
    .local p0, "this":Lio/reactivex/subjects/MaybeSubject;, "Lio/reactivex/subjects/MaybeSubject<TT;>;"
    invoke-direct {p0}, Lio/reactivex/Maybe;-><init>()V

    .line 62
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    iput-object v0, p0, Lio/reactivex/subjects/MaybeSubject;->once:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 63
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    sget-object v1, Lio/reactivex/subjects/MaybeSubject;->EMPTY:[Lio/reactivex/subjects/MaybeSubject$MaybeDisposable;

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lio/reactivex/subjects/MaybeSubject;->observers:Ljava/util/concurrent/atomic/AtomicReference;

    .line 64
    return-void
.end method

.method public static create()Lio/reactivex/subjects/MaybeSubject;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">()",
            "Lio/reactivex/subjects/MaybeSubject",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .prologue
    .line 57
    new-instance v0, Lio/reactivex/subjects/MaybeSubject;

    invoke-direct {v0}, Lio/reactivex/subjects/MaybeSubject;-><init>()V

    return-object v0
.end method


# virtual methods
.method add(Lio/reactivex/subjects/MaybeSubject$MaybeDisposable;)Z
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/subjects/MaybeSubject$MaybeDisposable",
            "<TT;>;)Z"
        }
    .end annotation

    .prologue
    .local p0, "this":Lio/reactivex/subjects/MaybeSubject;, "Lio/reactivex/subjects/MaybeSubject<TT;>;"
    .local p1, "inner":Lio/reactivex/subjects/MaybeSubject$MaybeDisposable;, "Lio/reactivex/subjects/MaybeSubject$MaybeDisposable<TT;>;"
    const/4 v3, 0x0

    .line 139
    :cond_0
    iget-object v4, p0, Lio/reactivex/subjects/MaybeSubject;->observers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/reactivex/subjects/MaybeSubject$MaybeDisposable;

    .line 140
    .local v0, "a":[Lio/reactivex/subjects/MaybeSubject$MaybeDisposable;, "[Lio/reactivex/subjects/MaybeSubject$MaybeDisposable<TT;>;"
    sget-object v4, Lio/reactivex/subjects/MaybeSubject;->TERMINATED:[Lio/reactivex/subjects/MaybeSubject$MaybeDisposable;

    if-ne v0, v4, :cond_1

    .line 150
    :goto_0
    return v3

    .line 144
    :cond_1
    array-length v2, v0

    .line 146
    .local v2, "n":I
    add-int/lit8 v4, v2, 0x1

    new-array v1, v4, [Lio/reactivex/subjects/MaybeSubject$MaybeDisposable;

    .line 147
    .local v1, "b":[Lio/reactivex/subjects/MaybeSubject$MaybeDisposable;, "[Lio/reactivex/subjects/MaybeSubject$MaybeDisposable<TT;>;"
    invoke-static {v0, v3, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 148
    aput-object p1, v1, v2

    .line 149
    iget-object v4, p0, Lio/reactivex/subjects/MaybeSubject;->observers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v4, v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 150
    const/4 v3, 0x1

    goto :goto_0
.end method

.method public getThrowable()Ljava/lang/Throwable;
    .locals 2

    .prologue
    .line 215
    .local p0, "this":Lio/reactivex/subjects/MaybeSubject;, "Lio/reactivex/subjects/MaybeSubject<TT;>;"
    iget-object v0, p0, Lio/reactivex/subjects/MaybeSubject;->observers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lio/reactivex/subjects/MaybeSubject;->TERMINATED:[Lio/reactivex/subjects/MaybeSubject$MaybeDisposable;

    if-ne v0, v1, :cond_0

    .line 216
    iget-object v0, p0, Lio/reactivex/subjects/MaybeSubject;->error:Ljava/lang/Throwable;

    .line 218
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
    .line 196
    .local p0, "this":Lio/reactivex/subjects/MaybeSubject;, "Lio/reactivex/subjects/MaybeSubject<TT;>;"
    iget-object v0, p0, Lio/reactivex/subjects/MaybeSubject;->observers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lio/reactivex/subjects/MaybeSubject;->TERMINATED:[Lio/reactivex/subjects/MaybeSubject$MaybeDisposable;

    if-ne v0, v1, :cond_0

    .line 197
    iget-object v0, p0, Lio/reactivex/subjects/MaybeSubject;->value:Ljava/lang/Object;

    .line 199
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public hasComplete()Z
    .locals 2

    .prologue
    .line 234
    .local p0, "this":Lio/reactivex/subjects/MaybeSubject;, "Lio/reactivex/subjects/MaybeSubject<TT;>;"
    iget-object v0, p0, Lio/reactivex/subjects/MaybeSubject;->observers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lio/reactivex/subjects/MaybeSubject;->TERMINATED:[Lio/reactivex/subjects/MaybeSubject$MaybeDisposable;

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lio/reactivex/subjects/MaybeSubject;->value:Ljava/lang/Object;

    if-nez v0, :cond_0

    iget-object v0, p0, Lio/reactivex/subjects/MaybeSubject;->error:Ljava/lang/Throwable;

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
    .line 242
    .local p0, "this":Lio/reactivex/subjects/MaybeSubject;, "Lio/reactivex/subjects/MaybeSubject<TT;>;"
    iget-object v0, p0, Lio/reactivex/subjects/MaybeSubject;->observers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/reactivex/subjects/MaybeSubject$MaybeDisposable;

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
    .line 226
    .local p0, "this":Lio/reactivex/subjects/MaybeSubject;, "Lio/reactivex/subjects/MaybeSubject<TT;>;"
    iget-object v0, p0, Lio/reactivex/subjects/MaybeSubject;->observers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lio/reactivex/subjects/MaybeSubject;->TERMINATED:[Lio/reactivex/subjects/MaybeSubject$MaybeDisposable;

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lio/reactivex/subjects/MaybeSubject;->error:Ljava/lang/Throwable;

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
    .line 207
    .local p0, "this":Lio/reactivex/subjects/MaybeSubject;, "Lio/reactivex/subjects/MaybeSubject<TT;>;"
    iget-object v0, p0, Lio/reactivex/subjects/MaybeSubject;->observers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lio/reactivex/subjects/MaybeSubject;->TERMINATED:[Lio/reactivex/subjects/MaybeSubject$MaybeDisposable;

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lio/reactivex/subjects/MaybeSubject;->value:Ljava/lang/Object;

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
    .line 250
    .local p0, "this":Lio/reactivex/subjects/MaybeSubject;, "Lio/reactivex/subjects/MaybeSubject<TT;>;"
    iget-object v0, p0, Lio/reactivex/subjects/MaybeSubject;->observers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/reactivex/subjects/MaybeSubject$MaybeDisposable;

    array-length v0, v0

    return v0
.end method

.method public onComplete()V
    .locals 7

    .prologue
    .line 107
    .local p0, "this":Lio/reactivex/subjects/MaybeSubject;, "Lio/reactivex/subjects/MaybeSubject<TT;>;"
    iget-object v4, p0, Lio/reactivex/subjects/MaybeSubject;->once:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v5, 0x0

    const/4 v6, 0x1

    invoke-virtual {v4, v5, v6}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 108
    iget-object v4, p0, Lio/reactivex/subjects/MaybeSubject;->observers:Ljava/util/concurrent/atomic/AtomicReference;

    sget-object v5, Lio/reactivex/subjects/MaybeSubject;->TERMINATED:[Lio/reactivex/subjects/MaybeSubject$MaybeDisposable;

    invoke-virtual {v4, v5}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/reactivex/subjects/MaybeSubject$MaybeDisposable;

    .local v0, "arr$":[Lio/reactivex/subjects/MaybeSubject$MaybeDisposable;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_0
    if-ge v1, v2, :cond_0

    aget-object v3, v0, v1

    .line 109
    .local v3, "md":Lio/reactivex/subjects/MaybeSubject$MaybeDisposable;, "Lio/reactivex/subjects/MaybeSubject$MaybeDisposable<TT;>;"
    iget-object v4, v3, Lio/reactivex/subjects/MaybeSubject$MaybeDisposable;->actual:Lio/reactivex/MaybeObserver;

    invoke-interface {v4}, Lio/reactivex/MaybeObserver;->onComplete()V

    .line 108
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 112
    .end local v0    # "arr$":[Lio/reactivex/subjects/MaybeSubject$MaybeDisposable;
    .end local v1    # "i$":I
    .end local v2    # "len$":I
    .end local v3    # "md":Lio/reactivex/subjects/MaybeSubject$MaybeDisposable;, "Lio/reactivex/subjects/MaybeSubject$MaybeDisposable<TT;>;"
    :cond_0
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 7
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 91
    .local p0, "this":Lio/reactivex/subjects/MaybeSubject;, "Lio/reactivex/subjects/MaybeSubject<TT;>;"
    if-nez p1, :cond_0

    .line 92
    new-instance p1, Ljava/lang/NullPointerException;

    .end local p1    # "e":Ljava/lang/Throwable;
    const-string/jumbo v4, "Null errors are not allowed in 2.x"

    invoke-direct {p1, v4}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 94
    .restart local p1    # "e":Ljava/lang/Throwable;
    :cond_0
    iget-object v4, p0, Lio/reactivex/subjects/MaybeSubject;->once:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v5, 0x0

    const/4 v6, 0x1

    invoke-virtual {v4, v5, v6}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 95
    iput-object p1, p0, Lio/reactivex/subjects/MaybeSubject;->error:Ljava/lang/Throwable;

    .line 96
    iget-object v4, p0, Lio/reactivex/subjects/MaybeSubject;->observers:Ljava/util/concurrent/atomic/AtomicReference;

    sget-object v5, Lio/reactivex/subjects/MaybeSubject;->TERMINATED:[Lio/reactivex/subjects/MaybeSubject$MaybeDisposable;

    invoke-virtual {v4, v5}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/reactivex/subjects/MaybeSubject$MaybeDisposable;

    .local v0, "arr$":[Lio/reactivex/subjects/MaybeSubject$MaybeDisposable;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_0
    if-ge v1, v2, :cond_2

    aget-object v3, v0, v1

    .line 97
    .local v3, "md":Lio/reactivex/subjects/MaybeSubject$MaybeDisposable;, "Lio/reactivex/subjects/MaybeSubject$MaybeDisposable<TT;>;"
    iget-object v4, v3, Lio/reactivex/subjects/MaybeSubject$MaybeDisposable;->actual:Lio/reactivex/MaybeObserver;

    invoke-interface {v4, p1}, Lio/reactivex/MaybeObserver;->onError(Ljava/lang/Throwable;)V

    .line 96
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 100
    .end local v0    # "arr$":[Lio/reactivex/subjects/MaybeSubject$MaybeDisposable;
    .end local v1    # "i$":I
    .end local v2    # "len$":I
    .end local v3    # "md":Lio/reactivex/subjects/MaybeSubject$MaybeDisposable;, "Lio/reactivex/subjects/MaybeSubject$MaybeDisposable<TT;>;"
    :cond_1
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    .line 102
    :cond_2
    return-void
.end method

.method public onSubscribe(Lio/reactivex/disposables/Disposable;)V
    .locals 2
    .param p1, "d"    # Lio/reactivex/disposables/Disposable;

    .prologue
    .line 68
    .local p0, "this":Lio/reactivex/subjects/MaybeSubject;, "Lio/reactivex/subjects/MaybeSubject<TT;>;"
    iget-object v0, p0, Lio/reactivex/subjects/MaybeSubject;->observers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lio/reactivex/subjects/MaybeSubject;->TERMINATED:[Lio/reactivex/subjects/MaybeSubject$MaybeDisposable;

    if-ne v0, v1, :cond_0

    .line 69
    invoke-interface {p1}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 71
    :cond_0
    return-void
.end method

.method public onSuccess(Ljava/lang/Object;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 76
    .local p0, "this":Lio/reactivex/subjects/MaybeSubject;, "Lio/reactivex/subjects/MaybeSubject<TT;>;"
    .local p1, "value":Ljava/lang/Object;, "TT;"
    if-nez p1, :cond_1

    .line 77
    new-instance v4, Ljava/lang/NullPointerException;

    const-string/jumbo v5, "Null values are not allowed in 2.x"

    invoke-direct {v4, v5}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v4}, Lio/reactivex/subjects/MaybeSubject;->onError(Ljava/lang/Throwable;)V

    .line 86
    :cond_0
    return-void

    .line 80
    :cond_1
    iget-object v4, p0, Lio/reactivex/subjects/MaybeSubject;->once:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v5, 0x0

    const/4 v6, 0x1

    invoke-virtual {v4, v5, v6}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 81
    iput-object p1, p0, Lio/reactivex/subjects/MaybeSubject;->value:Ljava/lang/Object;

    .line 82
    iget-object v4, p0, Lio/reactivex/subjects/MaybeSubject;->observers:Ljava/util/concurrent/atomic/AtomicReference;

    sget-object v5, Lio/reactivex/subjects/MaybeSubject;->TERMINATED:[Lio/reactivex/subjects/MaybeSubject$MaybeDisposable;

    invoke-virtual {v4, v5}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/reactivex/subjects/MaybeSubject$MaybeDisposable;

    .local v0, "arr$":[Lio/reactivex/subjects/MaybeSubject$MaybeDisposable;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_0
    if-ge v1, v2, :cond_0

    aget-object v3, v0, v1

    .line 83
    .local v3, "md":Lio/reactivex/subjects/MaybeSubject$MaybeDisposable;, "Lio/reactivex/subjects/MaybeSubject$MaybeDisposable<TT;>;"
    iget-object v4, v3, Lio/reactivex/subjects/MaybeSubject$MaybeDisposable;->actual:Lio/reactivex/MaybeObserver;

    invoke-interface {v4, p1}, Lio/reactivex/MaybeObserver;->onSuccess(Ljava/lang/Object;)V

    .line 82
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method remove(Lio/reactivex/subjects/MaybeSubject$MaybeDisposable;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/subjects/MaybeSubject$MaybeDisposable",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lio/reactivex/subjects/MaybeSubject;, "Lio/reactivex/subjects/MaybeSubject<TT;>;"
    .local p1, "inner":Lio/reactivex/subjects/MaybeSubject$MaybeDisposable;, "Lio/reactivex/subjects/MaybeSubject$MaybeDisposable<TT;>;"
    const/4 v7, 0x0

    .line 158
    :cond_0
    iget-object v5, p0, Lio/reactivex/subjects/MaybeSubject;->observers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v5}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/reactivex/subjects/MaybeSubject$MaybeDisposable;

    .line 159
    .local v0, "a":[Lio/reactivex/subjects/MaybeSubject$MaybeDisposable;, "[Lio/reactivex/subjects/MaybeSubject$MaybeDisposable<TT;>;"
    array-length v4, v0

    .line 160
    .local v4, "n":I
    if-nez v4, :cond_2

    .line 186
    :cond_1
    :goto_0
    return-void

    .line 164
    :cond_2
    const/4 v3, -0x1

    .line 166
    .local v3, "j":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    if-ge v2, v4, :cond_3

    .line 167
    aget-object v5, v0, v2

    if-ne v5, p1, :cond_4

    .line 168
    move v3, v2

    .line 173
    :cond_3
    if-ltz v3, :cond_1

    .line 177
    const/4 v5, 0x1

    if-ne v4, v5, :cond_5

    .line 178
    sget-object v1, Lio/reactivex/subjects/MaybeSubject;->EMPTY:[Lio/reactivex/subjects/MaybeSubject$MaybeDisposable;

    .line 185
    .local v1, "b":[Lio/reactivex/subjects/MaybeSubject$MaybeDisposable;, "[Lio/reactivex/subjects/MaybeSubject$MaybeDisposable<TT;>;"
    :goto_2
    iget-object v5, p0, Lio/reactivex/subjects/MaybeSubject;->observers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v5, v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    goto :goto_0

    .line 166
    .end local v1    # "b":[Lio/reactivex/subjects/MaybeSubject$MaybeDisposable;, "[Lio/reactivex/subjects/MaybeSubject$MaybeDisposable<TT;>;"
    :cond_4
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 180
    :cond_5
    add-int/lit8 v5, v4, -0x1

    new-array v1, v5, [Lio/reactivex/subjects/MaybeSubject$MaybeDisposable;

    .line 181
    .restart local v1    # "b":[Lio/reactivex/subjects/MaybeSubject$MaybeDisposable;, "[Lio/reactivex/subjects/MaybeSubject$MaybeDisposable<TT;>;"
    invoke-static {v0, v7, v1, v7, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 182
    add-int/lit8 v5, v3, 0x1

    sub-int v6, v4, v3

    add-int/lit8 v6, v6, -0x1

    invoke-static {v0, v5, v1, v3, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_2
.end method

.method protected subscribeActual(Lio/reactivex/MaybeObserver;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/MaybeObserver",
            "<-TT;>;)V"
        }
    .end annotation

    .prologue
    .line 116
    .local p0, "this":Lio/reactivex/subjects/MaybeSubject;, "Lio/reactivex/subjects/MaybeSubject<TT;>;"
    .local p1, "observer":Lio/reactivex/MaybeObserver;, "Lio/reactivex/MaybeObserver<-TT;>;"
    new-instance v1, Lio/reactivex/subjects/MaybeSubject$MaybeDisposable;

    invoke-direct {v1, p1, p0}, Lio/reactivex/subjects/MaybeSubject$MaybeDisposable;-><init>(Lio/reactivex/MaybeObserver;Lio/reactivex/subjects/MaybeSubject;)V

    .line 117
    .local v1, "md":Lio/reactivex/subjects/MaybeSubject$MaybeDisposable;, "Lio/reactivex/subjects/MaybeSubject$MaybeDisposable<TT;>;"
    invoke-interface {p1, v1}, Lio/reactivex/MaybeObserver;->onSubscribe(Lio/reactivex/disposables/Disposable;)V

    .line 118
    invoke-virtual {p0, v1}, Lio/reactivex/subjects/MaybeSubject;->add(Lio/reactivex/subjects/MaybeSubject$MaybeDisposable;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 119
    invoke-virtual {v1}, Lio/reactivex/subjects/MaybeSubject$MaybeDisposable;->isDisposed()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 120
    invoke-virtual {p0, v1}, Lio/reactivex/subjects/MaybeSubject;->remove(Lio/reactivex/subjects/MaybeSubject$MaybeDisposable;)V

    .line 135
    :cond_0
    :goto_0
    return-void

    .line 123
    :cond_1
    iget-object v0, p0, Lio/reactivex/subjects/MaybeSubject;->error:Ljava/lang/Throwable;

    .line 124
    .local v0, "ex":Ljava/lang/Throwable;
    if-eqz v0, :cond_2

    .line 125
    invoke-interface {p1, v0}, Lio/reactivex/MaybeObserver;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 127
    :cond_2
    iget-object v2, p0, Lio/reactivex/subjects/MaybeSubject;->value:Ljava/lang/Object;

    .line 128
    .local v2, "v":Ljava/lang/Object;, "TT;"
    if-nez v2, :cond_3

    .line 129
    invoke-interface {p1}, Lio/reactivex/MaybeObserver;->onComplete()V

    goto :goto_0

    .line 131
    :cond_3
    invoke-interface {p1, v2}, Lio/reactivex/MaybeObserver;->onSuccess(Ljava/lang/Object;)V

    goto :goto_0
.end method
