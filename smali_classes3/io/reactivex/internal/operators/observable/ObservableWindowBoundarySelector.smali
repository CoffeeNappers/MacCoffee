.class public final Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector;
.super Lio/reactivex/internal/operators/observable/AbstractObservableWithUpstream;
.source "ObservableWindowBoundarySelector.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$OperatorWindowBoundaryCloseObserver;,
        Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$OperatorWindowBoundaryOpenObserver;,
        Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowOperation;,
        Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowBoundaryMainObserver;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "B:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/internal/operators/observable/AbstractObservableWithUpstream",
        "<TT;",
        "Lio/reactivex/Observable",
        "<TT;>;>;"
    }
.end annotation


# instance fields
.field final bufferSize:I

.field final close:Lio/reactivex/functions/Function;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Function",
            "<-TB;+",
            "Lio/reactivex/ObservableSource",
            "<TV;>;>;"
        }
    .end annotation
.end field

.field final open:Lio/reactivex/ObservableSource;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/ObservableSource",
            "<TB;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Lio/reactivex/functions/Function;I)V
    .locals 0
    .param p4, "bufferSize"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/ObservableSource",
            "<TT;>;",
            "Lio/reactivex/ObservableSource",
            "<TB;>;",
            "Lio/reactivex/functions/Function",
            "<-TB;+",
            "Lio/reactivex/ObservableSource",
            "<TV;>;>;I)V"
        }
    .end annotation

    .prologue
    .line 43
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector;, "Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector<TT;TB;TV;>;"
    .local p1, "source":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<TT;>;"
    .local p2, "open":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<TB;>;"
    .local p3, "close":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TB;+Lio/reactivex/ObservableSource<TV;>;>;"
    invoke-direct {p0, p1}, Lio/reactivex/internal/operators/observable/AbstractObservableWithUpstream;-><init>(Lio/reactivex/ObservableSource;)V

    .line 44
    iput-object p2, p0, Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector;->open:Lio/reactivex/ObservableSource;

    .line 45
    iput-object p3, p0, Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector;->close:Lio/reactivex/functions/Function;

    .line 46
    iput p4, p0, Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector;->bufferSize:I

    .line 47
    return-void
.end method


# virtual methods
.method public subscribeActual(Lio/reactivex/Observer;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Observer",
            "<-",
            "Lio/reactivex/Observable",
            "<TT;>;>;)V"
        }
    .end annotation

    .prologue
    .line 51
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector;, "Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector<TT;TB;TV;>;"
    .local p1, "t":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-Lio/reactivex/Observable<TT;>;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector;->source:Lio/reactivex/ObservableSource;

    new-instance v1, Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowBoundaryMainObserver;

    new-instance v2, Lio/reactivex/observers/SerializedObserver;

    invoke-direct {v2, p1}, Lio/reactivex/observers/SerializedObserver;-><init>(Lio/reactivex/Observer;)V

    iget-object v3, p0, Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector;->open:Lio/reactivex/ObservableSource;

    iget-object v4, p0, Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector;->close:Lio/reactivex/functions/Function;

    iget v5, p0, Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector;->bufferSize:I

    invoke-direct {v1, v2, v3, v4, v5}, Lio/reactivex/internal/operators/observable/ObservableWindowBoundarySelector$WindowBoundaryMainObserver;-><init>(Lio/reactivex/Observer;Lio/reactivex/ObservableSource;Lio/reactivex/functions/Function;I)V

    invoke-interface {v0, v1}, Lio/reactivex/ObservableSource;->subscribe(Lio/reactivex/Observer;)V

    .line 54
    return-void
.end method
