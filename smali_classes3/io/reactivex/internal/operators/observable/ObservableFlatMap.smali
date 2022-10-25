.class public final Lio/reactivex/internal/operators/observable/ObservableFlatMap;
.super Lio/reactivex/internal/operators/observable/AbstractObservableWithUpstream;
.source "ObservableFlatMap.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/reactivex/internal/operators/observable/ObservableFlatMap$InnerObserver;,
        Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "U:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/internal/operators/observable/AbstractObservableWithUpstream",
        "<TT;TU;>;"
    }
.end annotation


# instance fields
.field final bufferSize:I

.field final delayErrors:Z

.field final mapper:Lio/reactivex/functions/Function;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Function",
            "<-TT;+",
            "Lio/reactivex/ObservableSource",
            "<+TU;>;>;"
        }
    .end annotation
.end field

.field final maxConcurrency:I


# direct methods
.method public constructor <init>(Lio/reactivex/ObservableSource;Lio/reactivex/functions/Function;ZII)V
    .locals 0
    .param p3, "delayErrors"    # Z
    .param p4, "maxConcurrency"    # I
    .param p5, "bufferSize"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/ObservableSource",
            "<TT;>;",
            "Lio/reactivex/functions/Function",
            "<-TT;+",
            "Lio/reactivex/ObservableSource",
            "<+TU;>;>;ZII)V"
        }
    .end annotation

    .prologue
    .line 41
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableFlatMap;, "Lio/reactivex/internal/operators/observable/ObservableFlatMap<TT;TU;>;"
    .local p1, "source":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<TT;>;"
    .local p2, "mapper":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+Lio/reactivex/ObservableSource<+TU;>;>;"
    invoke-direct {p0, p1}, Lio/reactivex/internal/operators/observable/AbstractObservableWithUpstream;-><init>(Lio/reactivex/ObservableSource;)V

    .line 42
    iput-object p2, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMap;->mapper:Lio/reactivex/functions/Function;

    .line 43
    iput-boolean p3, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMap;->delayErrors:Z

    .line 44
    iput p4, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMap;->maxConcurrency:I

    .line 45
    iput p5, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMap;->bufferSize:I

    .line 46
    return-void
.end method


# virtual methods
.method public subscribeActual(Lio/reactivex/Observer;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Observer",
            "<-TU;>;)V"
        }
    .end annotation

    .prologue
    .line 51
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableFlatMap;, "Lio/reactivex/internal/operators/observable/ObservableFlatMap<TT;TU;>;"
    .local p1, "t":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TU;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMap;->source:Lio/reactivex/ObservableSource;

    iget-object v1, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMap;->mapper:Lio/reactivex/functions/Function;

    invoke-static {v0, p1, v1}, Lio/reactivex/internal/operators/observable/ObservableScalarXMap;->tryScalarXMapSubscribe(Lio/reactivex/ObservableSource;Lio/reactivex/Observer;Lio/reactivex/functions/Function;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 56
    :goto_0
    return-void

    .line 55
    :cond_0
    iget-object v6, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMap;->source:Lio/reactivex/ObservableSource;

    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;

    iget-object v2, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMap;->mapper:Lio/reactivex/functions/Function;

    iget-boolean v3, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMap;->delayErrors:Z

    iget v4, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMap;->maxConcurrency:I

    iget v5, p0, Lio/reactivex/internal/operators/observable/ObservableFlatMap;->bufferSize:I

    move-object v1, p1

    invoke-direct/range {v0 .. v5}, Lio/reactivex/internal/operators/observable/ObservableFlatMap$MergeObserver;-><init>(Lio/reactivex/Observer;Lio/reactivex/functions/Function;ZII)V

    invoke-interface {v6, v0}, Lio/reactivex/ObservableSource;->subscribe(Lio/reactivex/Observer;)V

    goto :goto_0
.end method
