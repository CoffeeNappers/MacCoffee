.class public final Lio/reactivex/internal/operators/observable/ObservableJust;
.super Lio/reactivex/Observable;
.source "ObservableJust.java"

# interfaces
.implements Lio/reactivex/internal/fuseable/ScalarCallable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/Observable",
        "<TT;>;",
        "Lio/reactivex/internal/fuseable/ScalarCallable",
        "<TT;>;"
    }
.end annotation


# instance fields
.field private final value:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 27
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableJust;, "Lio/reactivex/internal/operators/observable/ObservableJust<TT;>;"
    .local p1, "value":Ljava/lang/Object;, "TT;"
    invoke-direct {p0}, Lio/reactivex/Observable;-><init>()V

    .line 28
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableJust;->value:Ljava/lang/Object;

    .line 29
    return-void
.end method


# virtual methods
.method public call()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .line 40
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableJust;, "Lio/reactivex/internal/operators/observable/ObservableJust<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableJust;->value:Ljava/lang/Object;

    return-object v0
.end method

.method protected subscribeActual(Lio/reactivex/Observer;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Observer",
            "<-TT;>;)V"
        }
    .end annotation

    .prologue
    .line 33
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableJust;, "Lio/reactivex/internal/operators/observable/ObservableJust<TT;>;"
    .local p1, "s":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TT;>;"
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableScalarXMap$ScalarDisposable;

    iget-object v1, p0, Lio/reactivex/internal/operators/observable/ObservableJust;->value:Ljava/lang/Object;

    invoke-direct {v0, p1, v1}, Lio/reactivex/internal/operators/observable/ObservableScalarXMap$ScalarDisposable;-><init>(Lio/reactivex/Observer;Ljava/lang/Object;)V

    .line 34
    .local v0, "sd":Lio/reactivex/internal/operators/observable/ObservableScalarXMap$ScalarDisposable;, "Lio/reactivex/internal/operators/observable/ObservableScalarXMap$ScalarDisposable<TT;>;"
    invoke-interface {p1, v0}, Lio/reactivex/Observer;->onSubscribe(Lio/reactivex/disposables/Disposable;)V

    .line 35
    invoke-virtual {v0}, Lio/reactivex/internal/operators/observable/ObservableScalarXMap$ScalarDisposable;->run()V

    .line 36
    return-void
.end method
