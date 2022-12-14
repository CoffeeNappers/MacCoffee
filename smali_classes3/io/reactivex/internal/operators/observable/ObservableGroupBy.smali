.class public final Lio/reactivex/internal/operators/observable/ObservableGroupBy;
.super Lio/reactivex/internal/operators/observable/AbstractObservableWithUpstream;
.source "ObservableGroupBy.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/reactivex/internal/operators/observable/ObservableGroupBy$State;,
        Lio/reactivex/internal/operators/observable/ObservableGroupBy$GroupedUnicast;,
        Lio/reactivex/internal/operators/observable/ObservableGroupBy$GroupByObserver;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/internal/operators/observable/AbstractObservableWithUpstream",
        "<TT;",
        "Lio/reactivex/observables/GroupedObservable",
        "<TK;TV;>;>;"
    }
.end annotation


# instance fields
.field final bufferSize:I

.field final delayError:Z

.field final keySelector:Lio/reactivex/functions/Function;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Function",
            "<-TT;+TK;>;"
        }
    .end annotation
.end field

.field final valueSelector:Lio/reactivex/functions/Function;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Function",
            "<-TT;+TV;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lio/reactivex/ObservableSource;Lio/reactivex/functions/Function;Lio/reactivex/functions/Function;IZ)V
    .locals 0
    .param p4, "bufferSize"    # I
    .param p5, "delayError"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/ObservableSource",
            "<TT;>;",
            "Lio/reactivex/functions/Function",
            "<-TT;+TK;>;",
            "Lio/reactivex/functions/Function",
            "<-TT;+TV;>;IZ)V"
        }
    .end annotation

    .prologue
    .line 39
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableGroupBy;, "Lio/reactivex/internal/operators/observable/ObservableGroupBy<TT;TK;TV;>;"
    .local p1, "source":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<TT;>;"
    .local p2, "keySelector":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+TK;>;"
    .local p3, "valueSelector":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+TV;>;"
    invoke-direct {p0, p1}, Lio/reactivex/internal/operators/observable/AbstractObservableWithUpstream;-><init>(Lio/reactivex/ObservableSource;)V

    .line 40
    iput-object p2, p0, Lio/reactivex/internal/operators/observable/ObservableGroupBy;->keySelector:Lio/reactivex/functions/Function;

    .line 41
    iput-object p3, p0, Lio/reactivex/internal/operators/observable/ObservableGroupBy;->valueSelector:Lio/reactivex/functions/Function;

    .line 42
    iput p4, p0, Lio/reactivex/internal/operators/observable/ObservableGroupBy;->bufferSize:I

    .line 43
    iput-boolean p5, p0, Lio/reactivex/internal/operators/observable/ObservableGroupBy;->delayError:Z

    .line 44
    return-void
.end method


# virtual methods
.method public subscribeActual(Lio/reactivex/Observer;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Observer",
            "<-",
            "Lio/reactivex/observables/GroupedObservable",
            "<TK;TV;>;>;)V"
        }
    .end annotation

    .prologue
    .line 48
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableGroupBy;, "Lio/reactivex/internal/operators/observable/ObservableGroupBy<TT;TK;TV;>;"
    .local p1, "t":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-Lio/reactivex/observables/GroupedObservable<TK;TV;>;>;"
    iget-object v6, p0, Lio/reactivex/internal/operators/observable/ObservableGroupBy;->source:Lio/reactivex/ObservableSource;

    new-instance v0, Lio/reactivex/internal/operators/observable/ObservableGroupBy$GroupByObserver;

    iget-object v2, p0, Lio/reactivex/internal/operators/observable/ObservableGroupBy;->keySelector:Lio/reactivex/functions/Function;

    iget-object v3, p0, Lio/reactivex/internal/operators/observable/ObservableGroupBy;->valueSelector:Lio/reactivex/functions/Function;

    iget v4, p0, Lio/reactivex/internal/operators/observable/ObservableGroupBy;->bufferSize:I

    iget-boolean v5, p0, Lio/reactivex/internal/operators/observable/ObservableGroupBy;->delayError:Z

    move-object v1, p1

    invoke-direct/range {v0 .. v5}, Lio/reactivex/internal/operators/observable/ObservableGroupBy$GroupByObserver;-><init>(Lio/reactivex/Observer;Lio/reactivex/functions/Function;Lio/reactivex/functions/Function;IZ)V

    invoke-interface {v6, v0}, Lio/reactivex/ObservableSource;->subscribe(Lio/reactivex/Observer;)V

    .line 49
    return-void
.end method
