.class public final Lio/reactivex/internal/operators/observable/ObservableDelaySubscriptionOther;
.super Lio/reactivex/Observable;
.source "ObservableDelaySubscriptionOther.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/reactivex/internal/operators/observable/ObservableDelaySubscriptionOther$DelayObserver;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "U:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/Observable",
        "<TT;>;"
    }
.end annotation


# instance fields
.field final main:Lio/reactivex/ObservableSource;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/ObservableSource",
            "<+TT;>;"
        }
    .end annotation
.end field

.field final other:Lio/reactivex/ObservableSource;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/ObservableSource",
            "<TU;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;",
            "Lio/reactivex/ObservableSource",
            "<TU;>;)V"
        }
    .end annotation

    .prologue
    .line 31
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableDelaySubscriptionOther;, "Lio/reactivex/internal/operators/observable/ObservableDelaySubscriptionOther<TT;TU;>;"
    .local p1, "main":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT;>;"
    .local p2, "other":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<TU;>;"
    invoke-direct {p0}, Lio/reactivex/Observable;-><init>()V

    .line 32
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableDelaySubscriptionOther;->main:Lio/reactivex/ObservableSource;

    .line 33
    iput-object p2, p0, Lio/reactivex/internal/operators/observable/ObservableDelaySubscriptionOther;->other:Lio/reactivex/ObservableSource;

    .line 34
    return-void
.end method


# virtual methods
.method public subscribeActual(Lio/reactivex/Observer;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Observer",
            "<-TT;>;)V"
        }
    .end annotation

    .prologue
    .line 38
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableDelaySubscriptionOther;, "Lio/reactivex/internal/operators/observable/ObservableDelaySubscriptionOther<TT;TU;>;"
    .local p1, "child":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TT;>;"
    new-instance v1, Lio/reactivex/internal/disposables/SequentialDisposable;

    invoke-direct {v1}, Lio/reactivex/internal/disposables/SequentialDisposable;-><init>()V

    .line 39
    .local v1, "serial":Lio/reactivex/internal/disposables/SequentialDisposable;
    invoke-interface {p1, v1}, Lio/reactivex/Observer;->onSubscribe(Lio/reactivex/disposables/Disposable;)V

    .line 41
    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableDelaySubscriptionOther$DelayObserver;

    invoke-direct {v0, p0, v1, p1}, Lio/reactivex/internal/operators/observable/ObservableDelaySubscriptionOther$DelayObserver;-><init>(Lio/reactivex/internal/operators/observable/ObservableDelaySubscriptionOther;Lio/reactivex/internal/disposables/SequentialDisposable;Lio/reactivex/Observer;)V

    .line 43
    .local v0, "otherObserver":Lio/reactivex/Observer;, "Lio/reactivex/Observer<TU;>;"
    iget-object v2, p0, Lio/reactivex/internal/operators/observable/ObservableDelaySubscriptionOther;->other:Lio/reactivex/ObservableSource;

    invoke-interface {v2, v0}, Lio/reactivex/ObservableSource;->subscribe(Lio/reactivex/Observer;)V

    .line 44
    return-void
.end method
