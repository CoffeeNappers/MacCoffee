.class public final Lio/reactivex/internal/operators/maybe/MaybeToSingle;
.super Lio/reactivex/Single;
.source "MaybeToSingle.java"

# interfaces
.implements Lio/reactivex/internal/fuseable/HasUpstreamMaybeSource;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/reactivex/internal/operators/maybe/MaybeToSingle$ToSingleMaybeSubscriber;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/Single",
        "<TT;>;",
        "Lio/reactivex/internal/fuseable/HasUpstreamMaybeSource",
        "<TT;>;"
    }
.end annotation


# instance fields
.field final defaultValue:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field final source:Lio/reactivex/MaybeSource;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/MaybeSource",
            "<TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lio/reactivex/MaybeSource;Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/MaybeSource",
            "<TT;>;TT;)V"
        }
    .end annotation

    .prologue
    .line 34
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeToSingle;, "Lio/reactivex/internal/operators/maybe/MaybeToSingle<TT;>;"
    .local p1, "source":Lio/reactivex/MaybeSource;, "Lio/reactivex/MaybeSource<TT;>;"
    .local p2, "defaultValue":Ljava/lang/Object;, "TT;"
    invoke-direct {p0}, Lio/reactivex/Single;-><init>()V

    .line 35
    iput-object p1, p0, Lio/reactivex/internal/operators/maybe/MaybeToSingle;->source:Lio/reactivex/MaybeSource;

    .line 36
    iput-object p2, p0, Lio/reactivex/internal/operators/maybe/MaybeToSingle;->defaultValue:Ljava/lang/Object;

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
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeToSingle;, "Lio/reactivex/internal/operators/maybe/MaybeToSingle<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeToSingle;->source:Lio/reactivex/MaybeSource;

    return-object v0
.end method

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
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeToSingle;, "Lio/reactivex/internal/operators/maybe/MaybeToSingle<TT;>;"
    .local p1, "observer":Lio/reactivex/SingleObserver;, "Lio/reactivex/SingleObserver<-TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeToSingle;->source:Lio/reactivex/MaybeSource;

    new-instance v1, Lio/reactivex/internal/operators/maybe/MaybeToSingle$ToSingleMaybeSubscriber;

    iget-object v2, p0, Lio/reactivex/internal/operators/maybe/MaybeToSingle;->defaultValue:Ljava/lang/Object;

    invoke-direct {v1, p1, v2}, Lio/reactivex/internal/operators/maybe/MaybeToSingle$ToSingleMaybeSubscriber;-><init>(Lio/reactivex/SingleObserver;Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Lio/reactivex/MaybeSource;->subscribe(Lio/reactivex/MaybeObserver;)V

    .line 47
    return-void
.end method
