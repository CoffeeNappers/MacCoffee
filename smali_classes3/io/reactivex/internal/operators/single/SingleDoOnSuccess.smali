.class public final Lio/reactivex/internal/operators/single/SingleDoOnSuccess;
.super Lio/reactivex/Single;
.source "SingleDoOnSuccess.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/reactivex/internal/operators/single/SingleDoOnSuccess$DoOnSuccess;
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


# instance fields
.field final onSuccess:Lio/reactivex/functions/Consumer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Consumer",
            "<-TT;>;"
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
.method public constructor <init>(Lio/reactivex/SingleSource;Lio/reactivex/functions/Consumer;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/SingleSource",
            "<TT;>;",
            "Lio/reactivex/functions/Consumer",
            "<-TT;>;)V"
        }
    .end annotation

    .prologue
    .line 27
    .local p0, "this":Lio/reactivex/internal/operators/single/SingleDoOnSuccess;, "Lio/reactivex/internal/operators/single/SingleDoOnSuccess<TT;>;"
    .local p1, "source":Lio/reactivex/SingleSource;, "Lio/reactivex/SingleSource<TT;>;"
    .local p2, "onSuccess":Lio/reactivex/functions/Consumer;, "Lio/reactivex/functions/Consumer<-TT;>;"
    invoke-direct {p0}, Lio/reactivex/Single;-><init>()V

    .line 28
    iput-object p1, p0, Lio/reactivex/internal/operators/single/SingleDoOnSuccess;->source:Lio/reactivex/SingleSource;

    .line 29
    iput-object p2, p0, Lio/reactivex/internal/operators/single/SingleDoOnSuccess;->onSuccess:Lio/reactivex/functions/Consumer;

    .line 30
    return-void
.end method


# virtual methods
.method protected subscribeActual(Lio/reactivex/SingleObserver;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/SingleObserver",
            "<-TT;>;)V"
        }
    .end annotation

    .prologue
    .line 35
    .local p0, "this":Lio/reactivex/internal/operators/single/SingleDoOnSuccess;, "Lio/reactivex/internal/operators/single/SingleDoOnSuccess<TT;>;"
    .local p1, "s":Lio/reactivex/SingleObserver;, "Lio/reactivex/SingleObserver<-TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/single/SingleDoOnSuccess;->source:Lio/reactivex/SingleSource;

    new-instance v1, Lio/reactivex/internal/operators/single/SingleDoOnSuccess$DoOnSuccess;

    invoke-direct {v1, p0, p1}, Lio/reactivex/internal/operators/single/SingleDoOnSuccess$DoOnSuccess;-><init>(Lio/reactivex/internal/operators/single/SingleDoOnSuccess;Lio/reactivex/SingleObserver;)V

    invoke-interface {v0, v1}, Lio/reactivex/SingleSource;->subscribe(Lio/reactivex/SingleObserver;)V

    .line 36
    return-void
.end method
