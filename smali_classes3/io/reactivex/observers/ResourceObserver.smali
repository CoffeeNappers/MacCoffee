.class public abstract Lio/reactivex/observers/ResourceObserver;
.super Ljava/lang/Object;
.source "ResourceObserver.java"

# interfaces
.implements Lio/reactivex/Observer;
.implements Lio/reactivex/disposables/Disposable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lio/reactivex/Observer",
        "<TT;>;",
        "Lio/reactivex/disposables/Disposable;"
    }
.end annotation


# instance fields
.field private final resources:Lio/reactivex/internal/disposables/ListCompositeDisposable;

.field private final s:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Lio/reactivex/disposables/Disposable;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 81
    .local p0, "this":Lio/reactivex/observers/ResourceObserver;, "Lio/reactivex/observers/ResourceObserver<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 83
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object v0, p0, Lio/reactivex/observers/ResourceObserver;->s:Ljava/util/concurrent/atomic/AtomicReference;

    .line 86
    new-instance v0, Lio/reactivex/internal/disposables/ListCompositeDisposable;

    invoke-direct {v0}, Lio/reactivex/internal/disposables/ListCompositeDisposable;-><init>()V

    iput-object v0, p0, Lio/reactivex/observers/ResourceObserver;->resources:Lio/reactivex/internal/disposables/ListCompositeDisposable;

    return-void
.end method


# virtual methods
.method public final add(Lio/reactivex/disposables/Disposable;)V
    .locals 1
    .param p1, "resource"    # Lio/reactivex/disposables/Disposable;

    .prologue
    .line 96
    .local p0, "this":Lio/reactivex/observers/ResourceObserver;, "Lio/reactivex/observers/ResourceObserver<TT;>;"
    const-string/jumbo v0, "resource is null"

    invoke-static {p1, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 97
    iget-object v0, p0, Lio/reactivex/observers/ResourceObserver;->resources:Lio/reactivex/internal/disposables/ListCompositeDisposable;

    invoke-virtual {v0, p1}, Lio/reactivex/internal/disposables/ListCompositeDisposable;->add(Lio/reactivex/disposables/Disposable;)Z

    .line 98
    return-void
.end method

.method public final dispose()V
    .locals 1

    .prologue
    .line 125
    .local p0, "this":Lio/reactivex/observers/ResourceObserver;, "Lio/reactivex/observers/ResourceObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/observers/ResourceObserver;->s:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-static {v0}, Lio/reactivex/internal/disposables/DisposableHelper;->dispose(Ljava/util/concurrent/atomic/AtomicReference;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 126
    iget-object v0, p0, Lio/reactivex/observers/ResourceObserver;->resources:Lio/reactivex/internal/disposables/ListCompositeDisposable;

    invoke-virtual {v0}, Lio/reactivex/internal/disposables/ListCompositeDisposable;->dispose()V

    .line 128
    :cond_0
    return-void
.end method

.method public final isDisposed()Z
    .locals 1

    .prologue
    .line 136
    .local p0, "this":Lio/reactivex/observers/ResourceObserver;, "Lio/reactivex/observers/ResourceObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/observers/ResourceObserver;->s:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/reactivex/disposables/Disposable;

    invoke-static {v0}, Lio/reactivex/internal/disposables/DisposableHelper;->isDisposed(Lio/reactivex/disposables/Disposable;)Z

    move-result v0

    return v0
.end method

.method protected onStart()V
    .locals 0

    .prologue
    .line 114
    .local p0, "this":Lio/reactivex/observers/ResourceObserver;, "Lio/reactivex/observers/ResourceObserver<TT;>;"
    return-void
.end method

.method public final onSubscribe(Lio/reactivex/disposables/Disposable;)V
    .locals 1
    .param p1, "s"    # Lio/reactivex/disposables/Disposable;

    .prologue
    .line 102
    .local p0, "this":Lio/reactivex/observers/ResourceObserver;, "Lio/reactivex/observers/ResourceObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/observers/ResourceObserver;->s:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-static {v0, p1}, Lio/reactivex/internal/disposables/DisposableHelper;->setOnce(Ljava/util/concurrent/atomic/AtomicReference;Lio/reactivex/disposables/Disposable;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 103
    invoke-virtual {p0}, Lio/reactivex/observers/ResourceObserver;->onStart()V

    .line 105
    :cond_0
    return-void
.end method
