.class public final Lio/reactivex/internal/operators/observable/BlockingObservableNext;
.super Ljava/lang/Object;
.source "BlockingObservableNext.java"

# interfaces
.implements Ljava/lang/Iterable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/reactivex/internal/operators/observable/BlockingObservableNext$NextObserver;,
        Lio/reactivex/internal/operators/observable/BlockingObservableNext$NextIterator;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/lang/Iterable",
        "<TT;>;"
    }
.end annotation


# instance fields
.field final source:Lio/reactivex/ObservableSource;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/ObservableSource",
            "<TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lio/reactivex/ObservableSource;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/ObservableSource",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 36
    .local p0, "this":Lio/reactivex/internal/operators/observable/BlockingObservableNext;, "Lio/reactivex/internal/operators/observable/BlockingObservableNext<TT;>;"
    .local p1, "source":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/BlockingObservableNext;->source:Lio/reactivex/ObservableSource;

    .line 38
    return-void
.end method


# virtual methods
.method public iterator()Ljava/util/Iterator;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 42
    .local p0, "this":Lio/reactivex/internal/operators/observable/BlockingObservableNext;, "Lio/reactivex/internal/operators/observable/BlockingObservableNext<TT;>;"
    new-instance v0, Lio/reactivex/internal/operators/observable/BlockingObservableNext$NextObserver;

    invoke-direct {v0}, Lio/reactivex/internal/operators/observable/BlockingObservableNext$NextObserver;-><init>()V

    .line 43
    .local v0, "nextObserver":Lio/reactivex/internal/operators/observable/BlockingObservableNext$NextObserver;, "Lio/reactivex/internal/operators/observable/BlockingObservableNext$NextObserver<TT;>;"
    new-instance v1, Lio/reactivex/internal/operators/observable/BlockingObservableNext$NextIterator;

    iget-object v2, p0, Lio/reactivex/internal/operators/observable/BlockingObservableNext;->source:Lio/reactivex/ObservableSource;

    invoke-direct {v1, v2, v0}, Lio/reactivex/internal/operators/observable/BlockingObservableNext$NextIterator;-><init>(Lio/reactivex/ObservableSource;Lio/reactivex/internal/operators/observable/BlockingObservableNext$NextObserver;)V

    return-object v1
.end method
