.class public final Lio/reactivex/internal/operators/observable/ObservableSingleMaybe;
.super Lio/reactivex/Maybe;
.source "ObservableSingleMaybe.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/reactivex/internal/operators/observable/ObservableSingleMaybe$SingleElementObserver;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/Maybe",
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
    .line 25
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableSingleMaybe;, "Lio/reactivex/internal/operators/observable/ObservableSingleMaybe<TT;>;"
    .local p1, "source":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<TT;>;"
    invoke-direct {p0}, Lio/reactivex/Maybe;-><init>()V

    .line 26
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableSingleMaybe;->source:Lio/reactivex/ObservableSource;

    .line 27
    return-void
.end method


# virtual methods
.method public subscribeActual(Lio/reactivex/MaybeObserver;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/MaybeObserver",
            "<-TT;>;)V"
        }
    .end annotation

    .prologue
    .line 30
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableSingleMaybe;, "Lio/reactivex/internal/operators/observable/ObservableSingleMaybe<TT;>;"
    .local p1, "t":Lio/reactivex/MaybeObserver;, "Lio/reactivex/MaybeObserver<-TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableSingleMaybe;->source:Lio/reactivex/ObservableSource;

    new-instance v1, Lio/reactivex/internal/operators/observable/ObservableSingleMaybe$SingleElementObserver;

    invoke-direct {v1, p1}, Lio/reactivex/internal/operators/observable/ObservableSingleMaybe$SingleElementObserver;-><init>(Lio/reactivex/MaybeObserver;)V

    invoke-interface {v0, v1}, Lio/reactivex/ObservableSource;->subscribe(Lio/reactivex/Observer;)V

    .line 31
    return-void
.end method