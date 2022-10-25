.class public final Lio/reactivex/subjects/SingleSubject;
.super Lio/reactivex/Single;
.source "SingleSubject.java"

# interfaces
.implements Lio/reactivex/SingleObserver;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/reactivex/subjects/SingleSubject$SingleDisposable;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/Single",
        "<TT;>;",
        "Lio/reactivex/SingleObserver",
        "<TT;>;"
    }
.end annotation

.annotation build Lio/reactivex/annotations/Experimental;
.end annotation


# static fields
.field static final EMPTY:[Lio/reactivex/subjects/SingleSubject$SingleDisposable;

.field static final TERMINATED:[Lio/reactivex/subjects/SingleSubject$SingleDisposable;


# instance fields
.field error:Ljava/lang/Throwable;

.field final observers:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<[",
            "Lio/reactivex/subjects/SingleSubject$SingleDisposable",
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
    new-array v0, v1, [Lio/reactivex/subjects/SingleSubject$SingleDisposable;

    sput-object v0, Lio/reactivex/subjects/SingleSubject;->EMPTY:[Lio/reactivex/subjects/SingleSubject$SingleDisposable;

    .line 44
    new-array v0, v1, [Lio/reactivex/subjects/SingleSubject$SingleDisposable;

    sput-object v0, Lio/reactivex/subjects/SingleSubject;->TERMINATED:[Lio/reactivex/subjects/SingleSubject$SingleDisposable;

    return-void
.end method

.method constructor <init>()V
    .locals 2

    .prologue
    .line 61
    .local p0, "this":Lio/reactivex/subjects/SingleSubject;, "Lio/reactivex/subjects/SingleSubject<TT;>;"
    invoke-direct {p0}, Lio/reactivex/Single;-><init>()V

    .line 62
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    iput-object v0, p0, Lio/reactivex/subjects/SingleSubject;->once:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 63
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    sget-object v1, Lio/reactivex/subjects/SingleSubject;->EMPTY:[Lio/reactivex/subjects/SingleSubject$SingleDisposable;

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lio/reactivex/subjects/SingleSubject;->observers:Ljava/util/concurrent/atomic/AtomicReference;

    .line 64
    return-void
.end method

.method public static create()Lio/reactivex/subjects/SingleSubject;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">()",
            "Lio/reactivex/subjects/SingleSubject",
            "<TT;>;"
        }
    .end annotation

    .annotation runtime Lio/reactivex/annotations/CheckReturnValue;
    .end annotation

    .prologue
    .line 57
    new-instance v0, Lio/reactivex/subjects/SingleSubject;

    invoke-direct {v0}, Lio/reactivex/subjects/SingleSubject;-><init>()V

    return-object v0
.end method


# virtual methods
.method add(Lio/reactivex/subjects/SingleSubject$SingleDisposable;)Z
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/subjects/SingleSubject$SingleDisposable",
            "<TT;>;)Z"
        }
    .end annotation

    .prologue
    .local p0, "this":Lio/reactivex/subjects/SingleSubject;, "Lio/reactivex/subjects/SingleSubject<TT;>;"
    .local p1, "inner":Lio/reactivex/subjects/SingleSubject$SingleDisposable;, "Lio/reactivex/subjects/SingleSubject$SingleDisposable<TT;>;"
    const/4 v3, 0x0

    .line 124
    :cond_0
    iget-object v4, p0, Lio/reactivex/subjects/SingleSubject;->observers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/reactivex/subjects/SingleSubject$SingleDisposable;

    .line 125
    .local v0, "a":[Lio/reactivex/subjects/SingleSubject$SingleDisposable;, "[Lio/reactivex/subjects/SingleSubject$SingleDisposable<TT;>;"
    sget-object v4, Lio/reactivex/subjects/SingleSubject;->TERMINATED:[Lio/reactivex/subjects/SingleSubject$SingleDisposable;

    if-ne v0, v4, :cond_1

    .line 135
    :goto_0
    return v3

    .line 129
    :cond_1
    array-length v2, v0

    .line 131
    .local v2, "n":I
    add-int/lit8 v4, v2, 0x1

    new-array v1, v4, [Lio/reactivex/subjects/SingleSubject$SingleDisposable;

    .line 132
    .local v1, "b":[Lio/reactivex/subjects/SingleSubject$SingleDisposable;, "[Lio/reactivex/subjects/SingleSubject$SingleDisposable<TT;>;"
    invoke-static {v0, v3, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 133
    aput-object p1, v1, v2

    .line 134
    iget-object v4, p0, Lio/reactivex/subjects/SingleSubject;->observers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v4, v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 135
    const/4 v3, 0x1

    goto :goto_0
.end method

.method public getThrowable()Ljava/lang/Throwable;
    .locals 2

    .prologue
    .line 200
    .local p0, "this":Lio/reactivex/subjects/SingleSubject;, "Lio/reactivex/subjects/SingleSubject<TT;>;"
    iget-object v0, p0, Lio/reactivex/subjects/SingleSubject;->observers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lio/reactivex/subjects/SingleSubject;->TERMINATED:[Lio/reactivex/subjects/SingleSubject$SingleDisposable;

    if-ne v0, v1, :cond_0

    .line 201
    iget-object v0, p0, Lio/reactivex/subjects/SingleSubject;->error:Ljava/lang/Throwable;

    .line 203
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
    .line 181
    .local p0, "this":Lio/reactivex/subjects/SingleSubject;, "Lio/reactivex/subjects/SingleSubject<TT;>;"
    iget-object v0, p0, Lio/reactivex/subjects/SingleSubject;->observers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lio/reactivex/subjects/SingleSubject;->TERMINATED:[Lio/reactivex/subjects/SingleSubject$SingleDisposable;

    if-ne v0, v1, :cond_0

    .line 182
    iget-object v0, p0, Lio/reactivex/subjects/SingleSubject;->value:Ljava/lang/Object;

    .line 184
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public hasObservers()Z
    .locals 1

    .prologue
    .line 219
    .local p0, "this":Lio/reactivex/subjects/SingleSubject;, "Lio/reactivex/subjects/SingleSubject<TT;>;"
    iget-object v0, p0, Lio/reactivex/subjects/SingleSubject;->observers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/reactivex/subjects/SingleSubject$SingleDisposable;

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
    .line 211
    .local p0, "this":Lio/reactivex/subjects/SingleSubject;, "Lio/reactivex/subjects/SingleSubject<TT;>;"
    iget-object v0, p0, Lio/reactivex/subjects/SingleSubject;->observers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lio/reactivex/subjects/SingleSubject;->TERMINATED:[Lio/reactivex/subjects/SingleSubject$SingleDisposable;

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lio/reactivex/subjects/SingleSubject;->error:Ljava/lang/Throwable;

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
    .line 192
    .local p0, "this":Lio/reactivex/subjects/SingleSubject;, "Lio/reactivex/subjects/SingleSubject<TT;>;"
    iget-object v0, p0, Lio/reactivex/subjects/SingleSubject;->observers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lio/reactivex/subjects/SingleSubject;->TERMINATED:[Lio/reactivex/subjects/SingleSubject$SingleDisposable;

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lio/reactivex/subjects/SingleSubject;->value:Ljava/lang/Object;

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
    .line 227
    .local p0, "this":Lio/reactivex/subjects/SingleSubject;, "Lio/reactivex/subjects/SingleSubject<TT;>;"
    iget-object v0, p0, Lio/reactivex/subjects/SingleSubject;->observers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/reactivex/subjects/SingleSubject$SingleDisposable;

    array-length v0, v0

    return v0
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 7
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 91
    .local p0, "this":Lio/reactivex/subjects/SingleSubject;, "Lio/reactivex/subjects/SingleSubject<TT;>;"
    if-nez p1, :cond_0

    .line 92
    new-instance p1, Ljava/lang/NullPointerException;

    .end local p1    # "e":Ljava/lang/Throwable;
    const-string/jumbo v4, "Null errors are not allowed in 2.x"

    invoke-direct {p1, v4}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 94
    .restart local p1    # "e":Ljava/lang/Throwable;
    :cond_0
    iget-object v4, p0, Lio/reactivex/subjects/SingleSubject;->once:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v5, 0x0

    const/4 v6, 0x1

    invoke-virtual {v4, v5, v6}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 95
    iput-object p1, p0, Lio/reactivex/subjects/SingleSubject;->error:Ljava/lang/Throwable;

    .line 96
    iget-object v4, p0, Lio/reactivex/subjects/SingleSubject;->observers:Ljava/util/concurrent/atomic/AtomicReference;

    sget-object v5, Lio/reactivex/subjects/SingleSubject;->TERMINATED:[Lio/reactivex/subjects/SingleSubject$SingleDisposable;

    invoke-virtual {v4, v5}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/reactivex/subjects/SingleSubject$SingleDisposable;

    .local v0, "arr$":[Lio/reactivex/subjects/SingleSubject$SingleDisposable;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_0
    if-ge v1, v2, :cond_2

    aget-object v3, v0, v1

    .line 97
    .local v3, "md":Lio/reactivex/subjects/SingleSubject$SingleDisposable;, "Lio/reactivex/subjects/SingleSubject$SingleDisposable<TT;>;"
    iget-object v4, v3, Lio/reactivex/subjects/SingleSubject$SingleDisposable;->actual:Lio/reactivex/SingleObserver;

    invoke-interface {v4, p1}, Lio/reactivex/SingleObserver;->onError(Ljava/lang/Throwable;)V

    .line 96
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 100
    .end local v0    # "arr$":[Lio/reactivex/subjects/SingleSubject$SingleDisposable;
    .end local v1    # "i$":I
    .end local v2    # "len$":I
    .end local v3    # "md":Lio/reactivex/subjects/SingleSubject$SingleDisposable;, "Lio/reactivex/subjects/SingleSubject$SingleDisposable<TT;>;"
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
    .local p0, "this":Lio/reactivex/subjects/SingleSubject;, "Lio/reactivex/subjects/SingleSubject<TT;>;"
    iget-object v0, p0, Lio/reactivex/subjects/SingleSubject;->observers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lio/reactivex/subjects/SingleSubject;->TERMINATED:[Lio/reactivex/subjects/SingleSubject$SingleDisposable;

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
    .local p0, "this":Lio/reactivex/subjects/SingleSubject;, "Lio/reactivex/subjects/SingleSubject<TT;>;"
    .local p1, "value":Ljava/lang/Object;, "TT;"
    if-nez p1, :cond_1

    .line 77
    new-instance v4, Ljava/lang/NullPointerException;

    const-string/jumbo v5, "Null values are not allowed in 2.x"

    invoke-direct {v4, v5}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v4}, Lio/reactivex/subjects/SingleSubject;->onError(Ljava/lang/Throwable;)V

    .line 86
    :cond_0
    return-void

    .line 80
    :cond_1
    iget-object v4, p0, Lio/reactivex/subjects/SingleSubject;->once:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v5, 0x0

    const/4 v6, 0x1

    invoke-virtual {v4, v5, v6}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 81
    iput-object p1, p0, Lio/reactivex/subjects/SingleSubject;->value:Ljava/lang/Object;

    .line 82
    iget-object v4, p0, Lio/reactivex/subjects/SingleSubject;->observers:Ljava/util/concurrent/atomic/AtomicReference;

    sget-object v5, Lio/reactivex/subjects/SingleSubject;->TERMINATED:[Lio/reactivex/subjects/SingleSubject$SingleDisposable;

    invoke-virtual {v4, v5}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/reactivex/subjects/SingleSubject$SingleDisposable;

    .local v0, "arr$":[Lio/reactivex/subjects/SingleSubject$SingleDisposable;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_0
    if-ge v1, v2, :cond_0

    aget-object v3, v0, v1

    .line 83
    .local v3, "md":Lio/reactivex/subjects/SingleSubject$SingleDisposable;, "Lio/reactivex/subjects/SingleSubject$SingleDisposable<TT;>;"
    iget-object v4, v3, Lio/reactivex/subjects/SingleSubject$SingleDisposable;->actual:Lio/reactivex/SingleObserver;

    invoke-interface {v4, p1}, Lio/reactivex/SingleObserver;->onSuccess(Ljava/lang/Object;)V

    .line 82
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method remove(Lio/reactivex/subjects/SingleSubject$SingleDisposable;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/subjects/SingleSubject$SingleDisposable",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lio/reactivex/subjects/SingleSubject;, "Lio/reactivex/subjects/SingleSubject<TT;>;"
    .local p1, "inner":Lio/reactivex/subjects/SingleSubject$SingleDisposable;, "Lio/reactivex/subjects/SingleSubject$SingleDisposable<TT;>;"
    const/4 v7, 0x0

    .line 143
    :cond_0
    iget-object v5, p0, Lio/reactivex/subjects/SingleSubject;->observers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v5}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/reactivex/subjects/SingleSubject$SingleDisposable;

    .line 144
    .local v0, "a":[Lio/reactivex/subjects/SingleSubject$SingleDisposable;, "[Lio/reactivex/subjects/SingleSubject$SingleDisposable<TT;>;"
    array-length v4, v0

    .line 145
    .local v4, "n":I
    if-nez v4, :cond_2

    .line 171
    :cond_1
    :goto_0
    return-void

    .line 149
    :cond_2
    const/4 v3, -0x1

    .line 151
    .local v3, "j":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    if-ge v2, v4, :cond_3

    .line 152
    aget-object v5, v0, v2

    if-ne v5, p1, :cond_4

    .line 153
    move v3, v2

    .line 158
    :cond_3
    if-ltz v3, :cond_1

    .line 162
    const/4 v5, 0x1

    if-ne v4, v5, :cond_5

    .line 163
    sget-object v1, Lio/reactivex/subjects/SingleSubject;->EMPTY:[Lio/reactivex/subjects/SingleSubject$SingleDisposable;

    .line 170
    .local v1, "b":[Lio/reactivex/subjects/SingleSubject$SingleDisposable;, "[Lio/reactivex/subjects/SingleSubject$SingleDisposable<TT;>;"
    :goto_2
    iget-object v5, p0, Lio/reactivex/subjects/SingleSubject;->observers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v5, v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    goto :goto_0

    .line 151
    .end local v1    # "b":[Lio/reactivex/subjects/SingleSubject$SingleDisposable;, "[Lio/reactivex/subjects/SingleSubject$SingleDisposable<TT;>;"
    :cond_4
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 165
    :cond_5
    add-int/lit8 v5, v4, -0x1

    new-array v1, v5, [Lio/reactivex/subjects/SingleSubject$SingleDisposable;

    .line 166
    .restart local v1    # "b":[Lio/reactivex/subjects/SingleSubject$SingleDisposable;, "[Lio/reactivex/subjects/SingleSubject$SingleDisposable<TT;>;"
    invoke-static {v0, v7, v1, v7, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 167
    add-int/lit8 v5, v3, 0x1

    sub-int v6, v4, v3

    add-int/lit8 v6, v6, -0x1

    invoke-static {v0, v5, v1, v3, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_2
.end method

.method protected subscribeActual(Lio/reactivex/SingleObserver;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/SingleObserver",
            "<-TT;>;)V"
        }
    .end annotation

    .prologue
    .line 106
    .local p0, "this":Lio/reactivex/subjects/SingleSubject;, "Lio/reactivex/subjects/SingleSubject<TT;>;"
    .local p1, "observer":Lio/reactivex/SingleObserver;, "Lio/reactivex/SingleObserver<-TT;>;"
    new-instance v1, Lio/reactivex/subjects/SingleSubject$SingleDisposable;

    invoke-direct {v1, p1, p0}, Lio/reactivex/subjects/SingleSubject$SingleDisposable;-><init>(Lio/reactivex/SingleObserver;Lio/reactivex/subjects/SingleSubject;)V

    .line 107
    .local v1, "md":Lio/reactivex/subjects/SingleSubject$SingleDisposable;, "Lio/reactivex/subjects/SingleSubject$SingleDisposable<TT;>;"
    invoke-interface {p1, v1}, Lio/reactivex/SingleObserver;->onSubscribe(Lio/reactivex/disposables/Disposable;)V

    .line 108
    invoke-virtual {p0, v1}, Lio/reactivex/subjects/SingleSubject;->add(Lio/reactivex/subjects/SingleSubject$SingleDisposable;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 109
    invoke-virtual {v1}, Lio/reactivex/subjects/SingleSubject$SingleDisposable;->isDisposed()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 110
    invoke-virtual {p0, v1}, Lio/reactivex/subjects/SingleSubject;->remove(Lio/reactivex/subjects/SingleSubject$SingleDisposable;)V

    .line 120
    :cond_0
    :goto_0
    return-void

    .line 113
    :cond_1
    iget-object v0, p0, Lio/reactivex/subjects/SingleSubject;->error:Ljava/lang/Throwable;

    .line 114
    .local v0, "ex":Ljava/lang/Throwable;
    if-eqz v0, :cond_2

    .line 115
    invoke-interface {p1, v0}, Lio/reactivex/SingleObserver;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 117
    :cond_2
    iget-object v2, p0, Lio/reactivex/subjects/SingleSubject;->value:Ljava/lang/Object;

    invoke-interface {p1, v2}, Lio/reactivex/SingleObserver;->onSuccess(Ljava/lang/Object;)V

    goto :goto_0
.end method
