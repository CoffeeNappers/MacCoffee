.class public final Lio/reactivex/internal/operators/single/SingleDoFinally;
.super Lio/reactivex/Single;
.source "SingleDoFinally.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/reactivex/internal/operators/single/SingleDoFinally$DoFinallyObserver;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/Single",
        "<TT;>;"
    }
.end annotation

.annotation build Lio/reactivex/annotations/Experimental;
.end annotation


# instance fields
.field final onFinally:Lio/reactivex/functions/Action;

.field final source:Lio/reactivex/SingleSource;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/SingleSource",
            "<TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lio/reactivex/SingleSource;Lio/reactivex/functions/Action;)V
    .locals 0
    .param p2, "onFinally"    # Lio/reactivex/functions/Action;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/SingleSource",
            "<TT;>;",
            "Lio/reactivex/functions/Action;",
            ")V"
        }
    .end annotation

    .prologue
    .line 39
    .local p0, "this":Lio/reactivex/internal/operators/single/SingleDoFinally;, "Lio/reactivex/internal/operators/single/SingleDoFinally<TT;>;"
    .local p1, "source":Lio/reactivex/SingleSource;, "Lio/reactivex/SingleSource<TT;>;"
    invoke-direct {p0}, Lio/reactivex/Single;-><init>()V

    .line 40
    iput-object p1, p0, Lio/reactivex/internal/operators/single/SingleDoFinally;->source:Lio/reactivex/SingleSource;

    .line 41
    iput-object p2, p0, Lio/reactivex/internal/operators/single/SingleDoFinally;->onFinally:Lio/reactivex/functions/Action;

    .line 42
    return-void
.end method


# virtual methods
.method protected subscribeActual(Lio/reactivex/SingleObserver;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/SingleObserver",
            "<-TT;>;)V"
        }
    .end annotation

    .prologue
    .line 46
    .local p0, "this":Lio/reactivex/internal/operators/single/SingleDoFinally;, "Lio/reactivex/internal/operators/single/SingleDoFinally<TT;>;"
    .local p1, "s":Lio/reactivex/SingleObserver;, "Lio/reactivex/SingleObserver<-TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/single/SingleDoFinally;->source:Lio/reactivex/SingleSource;

    new-instance v1, Lio/reactivex/internal/operators/single/SingleDoFinally$DoFinallyObserver;

    iget-object v2, p0, Lio/reactivex/internal/operators/single/SingleDoFinally;->onFinally:Lio/reactivex/functions/Action;

    invoke-direct {v1, p1, v2}, Lio/reactivex/internal/operators/single/SingleDoFinally$DoFinallyObserver;-><init>(Lio/reactivex/SingleObserver;Lio/reactivex/functions/Action;)V

    invoke-interface {v0, v1}, Lio/reactivex/SingleSource;->subscribe(Lio/reactivex/SingleObserver;)V

    .line 47
    return-void
.end method
