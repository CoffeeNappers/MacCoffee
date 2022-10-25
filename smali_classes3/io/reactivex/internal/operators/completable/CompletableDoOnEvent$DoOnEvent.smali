.class final Lio/reactivex/internal/operators/completable/CompletableDoOnEvent$DoOnEvent;
.super Ljava/lang/Object;
.source "CompletableDoOnEvent.java"

# interfaces
.implements Lio/reactivex/CompletableObserver;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/completable/CompletableDoOnEvent;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "DoOnEvent"
.end annotation


# instance fields
.field private final observer:Lio/reactivex/CompletableObserver;

.field final synthetic this$0:Lio/reactivex/internal/operators/completable/CompletableDoOnEvent;


# direct methods
.method constructor <init>(Lio/reactivex/internal/operators/completable/CompletableDoOnEvent;Lio/reactivex/CompletableObserver;)V
    .locals 0
    .param p2, "observer"    # Lio/reactivex/CompletableObserver;

    .prologue
    .line 41
    iput-object p1, p0, Lio/reactivex/internal/operators/completable/CompletableDoOnEvent$DoOnEvent;->this$0:Lio/reactivex/internal/operators/completable/CompletableDoOnEvent;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    iput-object p2, p0, Lio/reactivex/internal/operators/completable/CompletableDoOnEvent$DoOnEvent;->observer:Lio/reactivex/CompletableObserver;

    .line 43
    return-void
.end method


# virtual methods
.method public onComplete()V
    .locals 3

    .prologue
    .line 48
    :try_start_0
    iget-object v1, p0, Lio/reactivex/internal/operators/completable/CompletableDoOnEvent$DoOnEvent;->this$0:Lio/reactivex/internal/operators/completable/CompletableDoOnEvent;

    iget-object v1, v1, Lio/reactivex/internal/operators/completable/CompletableDoOnEvent;->onEvent:Lio/reactivex/functions/Consumer;

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Lio/reactivex/functions/Consumer;->accept(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 55
    iget-object v1, p0, Lio/reactivex/internal/operators/completable/CompletableDoOnEvent$DoOnEvent;->observer:Lio/reactivex/CompletableObserver;

    invoke-interface {v1}, Lio/reactivex/CompletableObserver;->onComplete()V

    .line 56
    :goto_0
    return-void

    .line 49
    :catch_0
    move-exception v0

    .line 50
    .local v0, "e":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 51
    iget-object v1, p0, Lio/reactivex/internal/operators/completable/CompletableDoOnEvent$DoOnEvent;->observer:Lio/reactivex/CompletableObserver;

    invoke-interface {v1, v0}, Lio/reactivex/CompletableObserver;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 4
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 61
    :try_start_0
    iget-object v2, p0, Lio/reactivex/internal/operators/completable/CompletableDoOnEvent$DoOnEvent;->this$0:Lio/reactivex/internal/operators/completable/CompletableDoOnEvent;

    iget-object v2, v2, Lio/reactivex/internal/operators/completable/CompletableDoOnEvent;->onEvent:Lio/reactivex/functions/Consumer;

    invoke-interface {v2, p1}, Lio/reactivex/functions/Consumer;->accept(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 67
    :goto_0
    iget-object v2, p0, Lio/reactivex/internal/operators/completable/CompletableDoOnEvent$DoOnEvent;->observer:Lio/reactivex/CompletableObserver;

    invoke-interface {v2, p1}, Lio/reactivex/CompletableObserver;->onError(Ljava/lang/Throwable;)V

    .line 68
    return-void

    .line 62
    :catch_0
    move-exception v1

    .line 63
    .local v1, "ex":Ljava/lang/Throwable;
    invoke-static {v1}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 64
    new-instance v0, Lio/reactivex/exceptions/CompositeException;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Throwable;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    const/4 v3, 0x1

    aput-object v1, v2, v3

    invoke-direct {v0, v2}, Lio/reactivex/exceptions/CompositeException;-><init>([Ljava/lang/Throwable;)V

    .end local p1    # "e":Ljava/lang/Throwable;
    .local v0, "e":Ljava/lang/Throwable;
    move-object p1, v0

    .end local v0    # "e":Ljava/lang/Throwable;
    .restart local p1    # "e":Ljava/lang/Throwable;
    goto :goto_0
.end method

.method public onSubscribe(Lio/reactivex/disposables/Disposable;)V
    .locals 1
    .param p1, "d"    # Lio/reactivex/disposables/Disposable;

    .prologue
    .line 72
    iget-object v0, p0, Lio/reactivex/internal/operators/completable/CompletableDoOnEvent$DoOnEvent;->observer:Lio/reactivex/CompletableObserver;

    invoke-interface {v0, p1}, Lio/reactivex/CompletableObserver;->onSubscribe(Lio/reactivex/disposables/Disposable;)V

    .line 73
    return-void
.end method
