.class public abstract Lio/reactivex/observers/DefaultObserver;
.super Ljava/lang/Object;
.source "DefaultObserver.java"

# interfaces
.implements Lio/reactivex/Observer;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lio/reactivex/Observer",
        "<TT;>;"
    }
.end annotation


# instance fields
.field private s:Lio/reactivex/disposables/Disposable;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 65
    .local p0, "this":Lio/reactivex/observers/DefaultObserver;, "Lio/reactivex/observers/DefaultObserver<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method protected final cancel()V
    .locals 2

    .prologue
    .line 79
    .local p0, "this":Lio/reactivex/observers/DefaultObserver;, "Lio/reactivex/observers/DefaultObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/observers/DefaultObserver;->s:Lio/reactivex/disposables/Disposable;

    .line 80
    .local v0, "s":Lio/reactivex/disposables/Disposable;
    sget-object v1, Lio/reactivex/internal/disposables/DisposableHelper;->DISPOSED:Lio/reactivex/internal/disposables/DisposableHelper;

    iput-object v1, p0, Lio/reactivex/observers/DefaultObserver;->s:Lio/reactivex/disposables/Disposable;

    .line 81
    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 82
    return-void
.end method

.method protected onStart()V
    .locals 0

    .prologue
    .line 88
    .local p0, "this":Lio/reactivex/observers/DefaultObserver;, "Lio/reactivex/observers/DefaultObserver<TT;>;"
    return-void
.end method

.method public final onSubscribe(Lio/reactivex/disposables/Disposable;)V
    .locals 1
    .param p1, "s"    # Lio/reactivex/disposables/Disposable;

    .prologue
    .line 69
    .local p0, "this":Lio/reactivex/observers/DefaultObserver;, "Lio/reactivex/observers/DefaultObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/observers/DefaultObserver;->s:Lio/reactivex/disposables/Disposable;

    invoke-static {v0, p1}, Lio/reactivex/internal/disposables/DisposableHelper;->validate(Lio/reactivex/disposables/Disposable;Lio/reactivex/disposables/Disposable;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 70
    iput-object p1, p0, Lio/reactivex/observers/DefaultObserver;->s:Lio/reactivex/disposables/Disposable;

    .line 71
    invoke-virtual {p0}, Lio/reactivex/observers/DefaultObserver;->onStart()V

    .line 73
    :cond_0
    return-void
.end method
