.class public final Lio/reactivex/internal/operators/maybe/MaybeCount;
.super Lio/reactivex/Single;
.source "MaybeCount.java"

# interfaces
.implements Lio/reactivex/internal/fuseable/HasUpstreamMaybeSource;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/reactivex/internal/operators/maybe/MaybeCount$CountMaybeObserver;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/Single",
        "<",
        "Ljava/lang/Long;",
        ">;",
        "Lio/reactivex/internal/fuseable/HasUpstreamMaybeSource",
        "<TT;>;"
    }
.end annotation


# instance fields
.field final source:Lio/reactivex/MaybeSource;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/MaybeSource",
            "<TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lio/reactivex/MaybeSource;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/MaybeSource",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 30
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeCount;, "Lio/reactivex/internal/operators/maybe/MaybeCount<TT;>;"
    .local p1, "source":Lio/reactivex/MaybeSource;, "Lio/reactivex/MaybeSource<TT;>;"
    invoke-direct {p0}, Lio/reactivex/Single;-><init>()V

    .line 31
    iput-object p1, p0, Lio/reactivex/internal/operators/maybe/MaybeCount;->source:Lio/reactivex/MaybeSource;

    .line 32
    return-void
.end method


# virtual methods
.method public source()Lio/reactivex/MaybeSource;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lio/reactivex/MaybeSource",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 36
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeCount;, "Lio/reactivex/internal/operators/maybe/MaybeCount<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeCount;->source:Lio/reactivex/MaybeSource;

    return-object v0
.end method

.method protected subscribeActual(Lio/reactivex/SingleObserver;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/SingleObserver",
            "<-",
            "Ljava/lang/Long;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 41
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeCount;, "Lio/reactivex/internal/operators/maybe/MaybeCount<TT;>;"
    .local p1, "observer":Lio/reactivex/SingleObserver;, "Lio/reactivex/SingleObserver<-Ljava/lang/Long;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeCount;->source:Lio/reactivex/MaybeSource;

    new-instance v1, Lio/reactivex/internal/operators/maybe/MaybeCount$CountMaybeObserver;

    invoke-direct {v1, p1}, Lio/reactivex/internal/operators/maybe/MaybeCount$CountMaybeObserver;-><init>(Lio/reactivex/SingleObserver;)V

    invoke-interface {v0, v1}, Lio/reactivex/MaybeSource;->subscribe(Lio/reactivex/MaybeObserver;)V

    .line 42
    return-void
.end method
