.class public final Lio/reactivex/internal/operators/observable/ObservableConcatMap;
.super Lio/reactivex/internal/operators/observable/AbstractObservableWithUpstream;
.source "ObservableConcatMap.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/reactivex/internal/operators/observable/ObservableConcatMap$ConcatMapDelayErrorObserver;,
        Lio/reactivex/internal/operators/observable/ObservableConcatMap$SourceObserver;
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

.field final delayErrors:Lio/reactivex/internal/util/ErrorMode;

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


# direct methods
.method public constructor <init>(Lio/reactivex/ObservableSource;Lio/reactivex/functions/Function;ILio/reactivex/internal/util/ErrorMode;)V
    .locals 1
    .param p3, "bufferSize"    # I
    .param p4, "delayErrors"    # Lio/reactivex/internal/util/ErrorMode;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/ObservableSource",
            "<TT;>;",
            "Lio/reactivex/functions/Function",
            "<-TT;+",
            "Lio/reactivex/ObservableSource",
            "<+TU;>;>;I",
            "Lio/reactivex/internal/util/ErrorMode;",
            ")V"
        }
    .end annotation

    .prologue
    .line 38
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableConcatMap;, "Lio/reactivex/internal/operators/observable/ObservableConcatMap<TT;TU;>;"
    .local p1, "source":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<TT;>;"
    .local p2, "mapper":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+Lio/reactivex/ObservableSource<+TU;>;>;"
    invoke-direct {p0, p1}, Lio/reactivex/internal/operators/observable/AbstractObservableWithUpstream;-><init>(Lio/reactivex/ObservableSource;)V

    .line 39
    iput-object p2, p0, Lio/reactivex/internal/operators/observable/ObservableConcatMap;->mapper:Lio/reactivex/functions/Function;

    .line 40
    iput-object p4, p0, Lio/reactivex/internal/operators/observable/ObservableConcatMap;->delayErrors:Lio/reactivex/internal/util/ErrorMode;

    .line 41
    const/16 v0, 0x8

    invoke-static {v0, p3}, Ljava/lang/Math;->max(II)I

    move-result v0

    iput v0, p0, Lio/reactivex/internal/operators/observable/ObservableConcatMap;->bufferSize:I

    .line 42
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
    .line 46
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableConcatMap;, "Lio/reactivex/internal/operators/observable/ObservableConcatMap<TT;TU;>;"
    .local p1, "s":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TU;>;"
    iget-object v1, p0, Lio/reactivex/internal/operators/observable/ObservableConcatMap;->source:Lio/reactivex/ObservableSource;

    iget-object v2, p0, Lio/reactivex/internal/operators/observable/ObservableConcatMap;->mapper:Lio/reactivex/functions/Function;

    invoke-static {v1, p1, v2}, Lio/reactivex/internal/operators/observable/ObservableScalarXMap;->tryScalarXMapSubscribe(Lio/reactivex/ObservableSource;Lio/reactivex/Observer;Lio/reactivex/functions/Function;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 56
    :goto_0
    return-void

    .line 50
    :cond_0
    iget-object v1, p0, Lio/reactivex/internal/operators/observable/ObservableConcatMap;->delayErrors:Lio/reactivex/internal/util/ErrorMode;

    sget-object v2, Lio/reactivex/internal/util/ErrorMode;->IMMEDIATE:Lio/reactivex/internal/util/ErrorMode;

    if-ne v1, v2, :cond_1

    .line 51
    new-instance v0, Lio/reactivex/observers/SerializedObserver;

    invoke-direct {v0, p1}, Lio/reactivex/observers/SerializedObserver;-><init>(Lio/reactivex/Observer;)V

    .line 52
    .local v0, "serial":Lio/reactivex/observers/SerializedObserver;, "Lio/reactivex/observers/SerializedObserver<TU;>;"
    iget-object v1, p0, Lio/reactivex/internal/operators/observable/ObservableConcatMap;->source:Lio/reactivex/ObservableSource;

    new-instance v2, Lio/reactivex/internal/operators/observable/ObservableConcatMap$SourceObserver;

    iget-object v3, p0, Lio/reactivex/internal/operators/observable/ObservableConcatMap;->mapper:Lio/reactivex/functions/Function;

    iget v4, p0, Lio/reactivex/internal/operators/observable/ObservableConcatMap;->bufferSize:I

    invoke-direct {v2, v0, v3, v4}, Lio/reactivex/internal/operators/observable/ObservableConcatMap$SourceObserver;-><init>(Lio/reactivex/Observer;Lio/reactivex/functions/Function;I)V

    invoke-interface {v1, v2}, Lio/reactivex/ObservableSource;->subscribe(Lio/reactivex/Observer;)V

    goto :goto_0

    .line 54
    .end local v0    # "serial":Lio/reactivex/observers/SerializedObserver;, "Lio/reactivex/observers/SerializedObserver<TU;>;"
    :cond_1
    iget-object v2, p0, Lio/reactivex/internal/operators/observable/ObservableConcatMap;->source:Lio/reactivex/ObservableSource;

    new-instance v3, Lio/reactivex/internal/operators/observable/ObservableConcatMap$ConcatMapDelayErrorObserver;

    iget-object v4, p0, Lio/reactivex/internal/operators/observable/ObservableConcatMap;->mapper:Lio/reactivex/functions/Function;

    iget v5, p0, Lio/reactivex/internal/operators/observable/ObservableConcatMap;->bufferSize:I

    iget-object v1, p0, Lio/reactivex/internal/operators/observable/ObservableConcatMap;->delayErrors:Lio/reactivex/internal/util/ErrorMode;

    sget-object v6, Lio/reactivex/internal/util/ErrorMode;->END:Lio/reactivex/internal/util/ErrorMode;

    if-ne v1, v6, :cond_2

    const/4 v1, 0x1

    :goto_1
    invoke-direct {v3, p1, v4, v5, v1}, Lio/reactivex/internal/operators/observable/ObservableConcatMap$ConcatMapDelayErrorObserver;-><init>(Lio/reactivex/Observer;Lio/reactivex/functions/Function;IZ)V

    invoke-interface {v2, v3}, Lio/reactivex/ObservableSource;->subscribe(Lio/reactivex/Observer;)V

    goto :goto_0

    :cond_2
    const/4 v1, 0x0

    goto :goto_1
.end method
