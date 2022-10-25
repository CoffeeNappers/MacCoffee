.class final Lio/reactivex/internal/operators/single/SingleMap$MapSingleObserver;
.super Ljava/lang/Object;
.source "SingleMap.java"

# interfaces
.implements Lio/reactivex/SingleObserver;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/single/SingleMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "MapSingleObserver"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "R:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lio/reactivex/SingleObserver",
        "<TT;>;"
    }
.end annotation


# instance fields
.field final mapper:Lio/reactivex/functions/Function;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Function",
            "<-TT;+TR;>;"
        }
    .end annotation
.end field

.field final t:Lio/reactivex/SingleObserver;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/SingleObserver",
            "<-TR;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lio/reactivex/SingleObserver;Lio/reactivex/functions/Function;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/SingleObserver",
            "<-TR;>;",
            "Lio/reactivex/functions/Function",
            "<-TT;+TR;>;)V"
        }
    .end annotation

    .prologue
    .line 42
    .local p0, "this":Lio/reactivex/internal/operators/single/SingleMap$MapSingleObserver;, "Lio/reactivex/internal/operators/single/SingleMap$MapSingleObserver<TT;TR;>;"
    .local p1, "t":Lio/reactivex/SingleObserver;, "Lio/reactivex/SingleObserver<-TR;>;"
    .local p2, "mapper":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+TR;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    iput-object p1, p0, Lio/reactivex/internal/operators/single/SingleMap$MapSingleObserver;->t:Lio/reactivex/SingleObserver;

    .line 44
    iput-object p2, p0, Lio/reactivex/internal/operators/single/SingleMap$MapSingleObserver;->mapper:Lio/reactivex/functions/Function;

    .line 45
    return-void
.end method


# virtual methods
.method public onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 68
    .local p0, "this":Lio/reactivex/internal/operators/single/SingleMap$MapSingleObserver;, "Lio/reactivex/internal/operators/single/SingleMap$MapSingleObserver<TT;TR;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/single/SingleMap$MapSingleObserver;->t:Lio/reactivex/SingleObserver;

    invoke-interface {v0, p1}, Lio/reactivex/SingleObserver;->onError(Ljava/lang/Throwable;)V

    .line 69
    return-void
.end method

.method public onSubscribe(Lio/reactivex/disposables/Disposable;)V
    .locals 1
    .param p1, "d"    # Lio/reactivex/disposables/Disposable;

    .prologue
    .line 49
    .local p0, "this":Lio/reactivex/internal/operators/single/SingleMap$MapSingleObserver;, "Lio/reactivex/internal/operators/single/SingleMap$MapSingleObserver<TT;TR;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/single/SingleMap$MapSingleObserver;->t:Lio/reactivex/SingleObserver;

    invoke-interface {v0, p1}, Lio/reactivex/SingleObserver;->onSubscribe(Lio/reactivex/disposables/Disposable;)V

    .line 50
    return-void
.end method

.method public onSuccess(Ljava/lang/Object;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 56
    .local p0, "this":Lio/reactivex/internal/operators/single/SingleMap$MapSingleObserver;, "Lio/reactivex/internal/operators/single/SingleMap$MapSingleObserver<TT;TR;>;"
    .local p1, "value":Ljava/lang/Object;, "TT;"
    :try_start_0
    iget-object v2, p0, Lio/reactivex/internal/operators/single/SingleMap$MapSingleObserver;->mapper:Lio/reactivex/functions/Function;

    invoke-interface {v2, p1}, Lio/reactivex/functions/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 63
    .local v1, "v":Ljava/lang/Object;, "TR;"
    iget-object v2, p0, Lio/reactivex/internal/operators/single/SingleMap$MapSingleObserver;->t:Lio/reactivex/SingleObserver;

    invoke-interface {v2, v1}, Lio/reactivex/SingleObserver;->onSuccess(Ljava/lang/Object;)V

    .line 64
    .end local v1    # "v":Ljava/lang/Object;, "TR;"
    :goto_0
    return-void

    .line 57
    :catch_0
    move-exception v0

    .line 58
    .local v0, "e":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 59
    invoke-virtual {p0, v0}, Lio/reactivex/internal/operators/single/SingleMap$MapSingleObserver;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method
