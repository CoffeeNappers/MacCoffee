.class final Lio/reactivex/internal/operators/single/SingleInternalHelper$ToFlowableIterator;
.super Ljava/lang/Object;
.source "SingleInternalHelper.java"

# interfaces
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/single/SingleInternalHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "ToFlowableIterator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/util/Iterator",
        "<",
        "Lio/reactivex/Flowable",
        "<TT;>;>;"
    }
.end annotation


# instance fields
.field private final sit:Ljava/util/Iterator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Iterator",
            "<+",
            "Lio/reactivex/SingleSource",
            "<+TT;>;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Ljava/util/Iterator;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Iterator",
            "<+",
            "Lio/reactivex/SingleSource",
            "<+TT;>;>;)V"
        }
    .end annotation

    .prologue
    .line 66
    .local p0, "this":Lio/reactivex/internal/operators/single/SingleInternalHelper$ToFlowableIterator;, "Lio/reactivex/internal/operators/single/SingleInternalHelper$ToFlowableIterator<TT;>;"
    .local p1, "sit":Ljava/util/Iterator;, "Ljava/util/Iterator<+Lio/reactivex/SingleSource<+TT;>;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 67
    iput-object p1, p0, Lio/reactivex/internal/operators/single/SingleInternalHelper$ToFlowableIterator;->sit:Ljava/util/Iterator;

    .line 68
    return-void
.end method


# virtual methods
.method public hasNext()Z
    .locals 1

    .prologue
    .line 72
    .local p0, "this":Lio/reactivex/internal/operators/single/SingleInternalHelper$ToFlowableIterator;, "Lio/reactivex/internal/operators/single/SingleInternalHelper$ToFlowableIterator<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/single/SingleInternalHelper$ToFlowableIterator;->sit:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    return v0
.end method

.method public next()Lio/reactivex/Flowable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lio/reactivex/Flowable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 77
    .local p0, "this":Lio/reactivex/internal/operators/single/SingleInternalHelper$ToFlowableIterator;, "Lio/reactivex/internal/operators/single/SingleInternalHelper$ToFlowableIterator<TT;>;"
    new-instance v1, Lio/reactivex/internal/operators/single/SingleToFlowable;

    iget-object v0, p0, Lio/reactivex/internal/operators/single/SingleInternalHelper$ToFlowableIterator;->sit:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/reactivex/SingleSource;

    invoke-direct {v1, v0}, Lio/reactivex/internal/operators/single/SingleToFlowable;-><init>(Lio/reactivex/SingleSource;)V

    return-object v1
.end method

.method public bridge synthetic next()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 63
    .local p0, "this":Lio/reactivex/internal/operators/single/SingleInternalHelper$ToFlowableIterator;, "Lio/reactivex/internal/operators/single/SingleInternalHelper$ToFlowableIterator<TT;>;"
    invoke-virtual {p0}, Lio/reactivex/internal/operators/single/SingleInternalHelper$ToFlowableIterator;->next()Lio/reactivex/Flowable;

    move-result-object v0

    return-object v0
.end method

.method public remove()V
    .locals 1

    .prologue
    .line 82
    .local p0, "this":Lio/reactivex/internal/operators/single/SingleInternalHelper$ToFlowableIterator;, "Lio/reactivex/internal/operators/single/SingleInternalHelper$ToFlowableIterator<TT;>;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method
