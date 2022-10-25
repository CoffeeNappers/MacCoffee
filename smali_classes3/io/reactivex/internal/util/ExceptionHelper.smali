.class public final Lio/reactivex/internal/util/ExceptionHelper;
.super Ljava/lang/Object;
.source "ExceptionHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/reactivex/internal/util/ExceptionHelper$Termination;
    }
.end annotation


# static fields
.field public static final TERMINATED:Ljava/lang/Throwable;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 52
    new-instance v0, Lio/reactivex/internal/util/ExceptionHelper$Termination;

    invoke-direct {v0}, Lio/reactivex/internal/util/ExceptionHelper$Termination;-><init>()V

    sput-object v0, Lio/reactivex/internal/util/ExceptionHelper;->TERMINATED:Ljava/lang/Throwable;

    return-void
.end method

.method private constructor <init>()V
    .locals 2

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "No instances!"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static addThrowable(Ljava/util/concurrent/atomic/AtomicReference;Ljava/lang/Throwable;)Z
    .locals 5
    .param p1, "exception"    # Ljava/lang/Throwable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Ljava/lang/Throwable;",
            ">;",
            "Ljava/lang/Throwable;",
            ")Z"
        }
    .end annotation

    .prologue
    .local p0, "field":Ljava/util/concurrent/atomic/AtomicReference;, "Ljava/util/concurrent/atomic/AtomicReference<Ljava/lang/Throwable;>;"
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 56
    :cond_0
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Throwable;

    .line 58
    .local v0, "current":Ljava/lang/Throwable;
    sget-object v4, Lio/reactivex/internal/util/ExceptionHelper;->TERMINATED:Ljava/lang/Throwable;

    if-ne v0, v4, :cond_1

    .line 70
    :goto_0
    return v2

    .line 63
    :cond_1
    if-nez v0, :cond_2

    .line 64
    move-object v1, p1

    .line 69
    .local v1, "update":Ljava/lang/Throwable;
    :goto_1
    invoke-virtual {p0, v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    move v2, v3

    .line 70
    goto :goto_0

    .line 66
    .end local v1    # "update":Ljava/lang/Throwable;
    :cond_2
    new-instance v1, Lio/reactivex/exceptions/CompositeException;

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Throwable;

    aput-object v0, v4, v2

    aput-object p1, v4, v3

    invoke-direct {v1, v4}, Lio/reactivex/exceptions/CompositeException;-><init>([Ljava/lang/Throwable;)V

    .restart local v1    # "update":Ljava/lang/Throwable;
    goto :goto_1
.end method

.method public static flatten(Ljava/lang/Throwable;)Ljava/util/List;
    .locals 7
    .param p0, "t"    # Ljava/lang/Throwable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Throwable;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Throwable;",
            ">;"
        }
    .end annotation

    .prologue
    .line 89
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 90
    .local v5, "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    new-instance v1, Ljava/util/ArrayDeque;

    invoke-direct {v1}, Ljava/util/ArrayDeque;-><init>()V

    .line 91
    .local v1, "deque":Ljava/util/ArrayDeque;, "Ljava/util/ArrayDeque<Ljava/lang/Throwable;>;"
    invoke-virtual {v1, p0}, Ljava/util/ArrayDeque;->offer(Ljava/lang/Object;)Z

    .line 93
    :cond_0
    :goto_0
    invoke-virtual {v1}, Ljava/util/ArrayDeque;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_2

    .line 94
    invoke-virtual {v1}, Ljava/util/ArrayDeque;->removeFirst()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Throwable;

    .line 95
    .local v2, "e":Ljava/lang/Throwable;
    instance-of v6, v2, Lio/reactivex/exceptions/CompositeException;

    if-eqz v6, :cond_1

    move-object v0, v2

    .line 96
    check-cast v0, Lio/reactivex/exceptions/CompositeException;

    .line 97
    .local v0, "ce":Lio/reactivex/exceptions/CompositeException;
    invoke-virtual {v0}, Lio/reactivex/exceptions/CompositeException;->getExceptions()Ljava/util/List;

    move-result-object v3

    .line 98
    .local v3, "exceptions":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v6

    add-int/lit8 v4, v6, -0x1

    .local v4, "i":I
    :goto_1
    if-ltz v4, :cond_0

    .line 99
    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v1, v6}, Ljava/util/ArrayDeque;->offerFirst(Ljava/lang/Object;)Z

    .line 98
    add-int/lit8 v4, v4, -0x1

    goto :goto_1

    .line 102
    .end local v0    # "ce":Lio/reactivex/exceptions/CompositeException;
    .end local v3    # "exceptions":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    .end local v4    # "i":I
    :cond_1
    invoke-interface {v5, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 106
    .end local v2    # "e":Ljava/lang/Throwable;
    :cond_2
    return-object v5
.end method

.method public static terminate(Ljava/util/concurrent/atomic/AtomicReference;)Ljava/lang/Throwable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Ljava/lang/Throwable;",
            ">;)",
            "Ljava/lang/Throwable;"
        }
    .end annotation

    .prologue
    .line 76
    .local p0, "field":Ljava/util/concurrent/atomic/AtomicReference;, "Ljava/util/concurrent/atomic/AtomicReference<Ljava/lang/Throwable;>;"
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Throwable;

    .line 77
    .local v0, "current":Ljava/lang/Throwable;
    sget-object v1, Lio/reactivex/internal/util/ExceptionHelper;->TERMINATED:Ljava/lang/Throwable;

    if-eq v0, v1, :cond_0

    .line 78
    sget-object v1, Lio/reactivex/internal/util/ExceptionHelper;->TERMINATED:Ljava/lang/Throwable;

    invoke-virtual {p0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "current":Ljava/lang/Throwable;
    check-cast v0, Ljava/lang/Throwable;

    .line 80
    .restart local v0    # "current":Ljava/lang/Throwable;
    :cond_0
    return-object v0
.end method

.method public static wrapOrThrow(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;
    .locals 1
    .param p0, "error"    # Ljava/lang/Throwable;

    .prologue
    .line 39
    instance-of v0, p0, Ljava/lang/Error;

    if-eqz v0, :cond_0

    .line 40
    check-cast p0, Ljava/lang/Error;

    .end local p0    # "error":Ljava/lang/Throwable;
    throw p0

    .line 42
    .restart local p0    # "error":Ljava/lang/Throwable;
    :cond_0
    instance-of v0, p0, Ljava/lang/RuntimeException;

    if-eqz v0, :cond_1

    .line 43
    check-cast p0, Ljava/lang/RuntimeException;

    .line 45
    .end local p0    # "error":Ljava/lang/Throwable;
    :goto_0
    return-object p0

    .restart local p0    # "error":Ljava/lang/Throwable;
    :cond_1
    new-instance v0, Ljava/lang/RuntimeException;

    invoke-direct {v0, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    move-object p0, v0

    goto :goto_0
.end method
