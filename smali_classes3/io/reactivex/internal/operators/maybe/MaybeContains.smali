.class public final Lio/reactivex/internal/operators/maybe/MaybeContains;
.super Lio/reactivex/Single;
.source "MaybeContains.java"

# interfaces
.implements Lio/reactivex/internal/fuseable/HasUpstreamMaybeSource;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/reactivex/internal/operators/maybe/MaybeContains$ContainsMaybeObserver;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/Single",
        "<",
        "Ljava/lang/Boolean;",
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

.field final value:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lio/reactivex/MaybeSource;Ljava/lang/Object;)V
    .locals 0
    .param p2, "value"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/MaybeSource",
            "<TT;>;",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation

    .prologue
    .line 34
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeContains;, "Lio/reactivex/internal/operators/maybe/MaybeContains<TT;>;"
    .local p1, "source":Lio/reactivex/MaybeSource;, "Lio/reactivex/MaybeSource<TT;>;"
    invoke-direct {p0}, Lio/reactivex/Single;-><init>()V

    .line 35
    iput-object p1, p0, Lio/reactivex/internal/operators/maybe/MaybeContains;->source:Lio/reactivex/MaybeSource;

    .line 36
    iput-object p2, p0, Lio/reactivex/internal/operators/maybe/MaybeContains;->value:Ljava/lang/Object;

    .line 37
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
    .line 41
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeContains;, "Lio/reactivex/internal/operators/maybe/MaybeContains<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeContains;->source:Lio/reactivex/MaybeSource;

    return-object v0
.end method

.method protected subscribeActual(Lio/reactivex/SingleObserver;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/SingleObserver",
            "<-",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 46
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeContains;, "Lio/reactivex/internal/operators/maybe/MaybeContains<TT;>;"
    .local p1, "observer":Lio/reactivex/SingleObserver;, "Lio/reactivex/SingleObserver<-Ljava/lang/Boolean;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeContains;->source:Lio/reactivex/MaybeSource;

    new-instance v1, Lio/reactivex/internal/operators/maybe/MaybeContains$ContainsMaybeObserver;

    iget-object v2, p0, Lio/reactivex/internal/operators/maybe/MaybeContains;->value:Ljava/lang/Object;

    invoke-direct {v1, p1, v2}, Lio/reactivex/internal/operators/maybe/MaybeContains$ContainsMaybeObserver;-><init>(Lio/reactivex/SingleObserver;Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Lio/reactivex/MaybeSource;->subscribe(Lio/reactivex/MaybeObserver;)V

    .line 47
    return-void
.end method
