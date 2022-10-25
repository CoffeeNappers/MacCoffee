.class public final Lio/reactivex/internal/operators/single/SingleLift;
.super Lio/reactivex/Single;
.source "SingleLift.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "R:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/Single",
        "<TR;>;"
    }
.end annotation


# instance fields
.field final onLift:Lio/reactivex/SingleOperator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/SingleOperator",
            "<+TR;-TT;>;"
        }
    .end annotation
.end field

.field final source:Lio/reactivex/SingleSource;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/SingleSource",
            "<TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lio/reactivex/SingleSource;Lio/reactivex/SingleOperator;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/SingleSource",
            "<TT;>;",
            "Lio/reactivex/SingleOperator",
            "<+TR;-TT;>;)V"
        }
    .end annotation

    .prologue
    .line 27
    .local p0, "this":Lio/reactivex/internal/operators/single/SingleLift;, "Lio/reactivex/internal/operators/single/SingleLift<TT;TR;>;"
    .local p1, "source":Lio/reactivex/SingleSource;, "Lio/reactivex/SingleSource<TT;>;"
    .local p2, "onLift":Lio/reactivex/SingleOperator;, "Lio/reactivex/SingleOperator<+TR;-TT;>;"
    invoke-direct {p0}, Lio/reactivex/Single;-><init>()V

    .line 28
    iput-object p1, p0, Lio/reactivex/internal/operators/single/SingleLift;->source:Lio/reactivex/SingleSource;

    .line 29
    iput-object p2, p0, Lio/reactivex/internal/operators/single/SingleLift;->onLift:Lio/reactivex/SingleOperator;

    .line 30
    return-void
.end method


# virtual methods
.method protected subscribeActual(Lio/reactivex/SingleObserver;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/SingleObserver",
            "<-TR;>;)V"
        }
    .end annotation

    .prologue
    .line 37
    .local p0, "this":Lio/reactivex/internal/operators/single/SingleLift;, "Lio/reactivex/internal/operators/single/SingleLift<TT;TR;>;"
    .local p1, "s":Lio/reactivex/SingleObserver;, "Lio/reactivex/SingleObserver<-TR;>;"
    :try_start_0
    iget-object v2, p0, Lio/reactivex/internal/operators/single/SingleLift;->onLift:Lio/reactivex/SingleOperator;

    invoke-interface {v2, p1}, Lio/reactivex/SingleOperator;->apply(Lio/reactivex/SingleObserver;)Lio/reactivex/SingleObserver;

    move-result-object v2

    const-string/jumbo v3, "The onLift returned a null SingleObserver"

    invoke-static {v2, v3}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/reactivex/SingleObserver;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 44
    .local v1, "sr":Lio/reactivex/SingleObserver;, "Lio/reactivex/SingleObserver<-TT;>;"
    iget-object v2, p0, Lio/reactivex/internal/operators/single/SingleLift;->source:Lio/reactivex/SingleSource;

    invoke-interface {v2, v1}, Lio/reactivex/SingleSource;->subscribe(Lio/reactivex/SingleObserver;)V

    .line 45
    .end local v1    # "sr":Lio/reactivex/SingleObserver;, "Lio/reactivex/SingleObserver<-TT;>;"
    :goto_0
    return-void

    .line 38
    :catch_0
    move-exception v0

    .line 39
    .local v0, "ex":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 40
    invoke-static {v0, p1}, Lio/reactivex/internal/disposables/EmptyDisposable;->error(Ljava/lang/Throwable;Lio/reactivex/SingleObserver;)V

    goto :goto_0
.end method
