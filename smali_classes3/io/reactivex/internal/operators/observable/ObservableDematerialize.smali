.class public final Lio/reactivex/internal/operators/observable/ObservableDematerialize;
.super Lio/reactivex/internal/operators/observable/AbstractObservableWithUpstream;
.source "ObservableDematerialize.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/reactivex/internal/operators/observable/ObservableDematerialize$DematerializeObserver;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/internal/operators/observable/AbstractObservableWithUpstream",
        "<",
        "Lio/reactivex/Notification",
        "<TT;>;TT;>;"
    }
.end annotation


# direct methods
.method public constructor <init>(Lio/reactivex/ObservableSource;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/ObservableSource",
            "<",
            "Lio/reactivex/Notification",
            "<TT;>;>;)V"
        }
    .end annotation

    .prologue
    .line 24
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableDematerialize;, "Lio/reactivex/internal/operators/observable/ObservableDematerialize<TT;>;"
    .local p1, "source":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<Lio/reactivex/Notification<TT;>;>;"
    invoke-direct {p0, p1}, Lio/reactivex/internal/operators/observable/AbstractObservableWithUpstream;-><init>(Lio/reactivex/ObservableSource;)V

    .line 25
    return-void
.end method


# virtual methods
.method public subscribeActual(Lio/reactivex/Observer;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Observer",
            "<-TT;>;)V"
        }
    .end annotation

    .prologue
    .line 29
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableDematerialize;, "Lio/reactivex/internal/operators/observable/ObservableDematerialize<TT;>;"
    .local p1, "t":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableDematerialize;->source:Lio/reactivex/ObservableSource;

    new-instance v1, Lio/reactivex/internal/operators/observable/ObservableDematerialize$DematerializeObserver;

    invoke-direct {v1, p1}, Lio/reactivex/internal/operators/observable/ObservableDematerialize$DematerializeObserver;-><init>(Lio/reactivex/Observer;)V

    invoke-interface {v0, v1}, Lio/reactivex/ObservableSource;->subscribe(Lio/reactivex/Observer;)V

    .line 30
    return-void
.end method
