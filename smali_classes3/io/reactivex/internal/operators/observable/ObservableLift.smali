.class public final Lio/reactivex/internal/operators/observable/ObservableLift;
.super Lio/reactivex/internal/operators/observable/AbstractObservableWithUpstream;
.source "ObservableLift.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<R:",
        "Ljava/lang/Object;",
        "T:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/internal/operators/observable/AbstractObservableWithUpstream",
        "<TT;TR;>;"
    }
.end annotation


# instance fields
.field final operator:Lio/reactivex/ObservableOperator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/ObservableOperator",
            "<+TR;-TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lio/reactivex/ObservableSource;Lio/reactivex/ObservableOperator;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/ObservableSource",
            "<TT;>;",
            "Lio/reactivex/ObservableOperator",
            "<+TR;-TT;>;)V"
        }
    .end annotation

    .prologue
    .line 35
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableLift;, "Lio/reactivex/internal/operators/observable/ObservableLift<TR;TT;>;"
    .local p1, "source":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<TT;>;"
    .local p2, "operator":Lio/reactivex/ObservableOperator;, "Lio/reactivex/ObservableOperator<+TR;-TT;>;"
    invoke-direct {p0, p1}, Lio/reactivex/internal/operators/observable/AbstractObservableWithUpstream;-><init>(Lio/reactivex/ObservableSource;)V

    .line 36
    iput-object p2, p0, Lio/reactivex/internal/operators/observable/ObservableLift;->operator:Lio/reactivex/ObservableOperator;

    .line 37
    return-void
.end method


# virtual methods
.method public subscribeActual(Lio/reactivex/Observer;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Observer",
            "<-TR;>;)V"
        }
    .end annotation

    .prologue
    .line 43
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableLift;, "Lio/reactivex/internal/operators/observable/ObservableLift<TR;TT;>;"
    .local p1, "s":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TR;>;"
    :try_start_0
    iget-object v3, p0, Lio/reactivex/internal/operators/observable/ObservableLift;->operator:Lio/reactivex/ObservableOperator;

    invoke-interface {v3, p1}, Lio/reactivex/ObservableOperator;->apply(Lio/reactivex/Observer;)Lio/reactivex/Observer;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "Operator "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lio/reactivex/internal/operators/observable/ObservableLift;->operator:Lio/reactivex/ObservableOperator;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, " returned a null Observer"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lio/reactivex/Observer;
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_1

    .line 57
    .local v2, "observer":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TT;>;"
    iget-object v3, p0, Lio/reactivex/internal/operators/observable/ObservableLift;->source:Lio/reactivex/ObservableSource;

    invoke-interface {v3, v2}, Lio/reactivex/ObservableSource;->subscribe(Lio/reactivex/Observer;)V

    .line 58
    return-void

    .line 44
    .end local v2    # "observer":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TT;>;"
    :catch_0
    move-exception v0

    .line 45
    .local v0, "e":Ljava/lang/NullPointerException;
    throw v0

    .line 46
    .end local v0    # "e":Ljava/lang/NullPointerException;
    :catch_1
    move-exception v0

    .line 47
    .local v0, "e":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 50
    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    .line 52
    new-instance v1, Ljava/lang/NullPointerException;

    const-string/jumbo v3, "Actually not, but can\'t throw other exceptions due to RS"

    invoke-direct {v1, v3}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 53
    .local v1, "npe":Ljava/lang/NullPointerException;
    invoke-virtual {v1, v0}, Ljava/lang/NullPointerException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 54
    throw v1
.end method
