.class final Lio/reactivex/internal/operators/observable/ObservableRangeLong$RangeDisposable;
.super Lio/reactivex/internal/observers/BasicIntQueueDisposable;
.source "ObservableRangeLong.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/observable/ObservableRangeLong;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "RangeDisposable"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lio/reactivex/internal/observers/BasicIntQueueDisposable",
        "<",
        "Ljava/lang/Long;",
        ">;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x580b77479f42190L


# instance fields
.field final actual:Lio/reactivex/Observer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/Observer",
            "<-",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field final end:J

.field fused:Z

.field index:J


# direct methods
.method constructor <init>(Lio/reactivex/Observer;JJ)V
    .locals 0
    .param p2, "start"    # J
    .param p4, "end"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Observer",
            "<-",
            "Ljava/lang/Long;",
            ">;JJ)V"
        }
    .end annotation

    .prologue
    .line 48
    .local p1, "actual":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-Ljava/lang/Long;>;"
    invoke-direct {p0}, Lio/reactivex/internal/observers/BasicIntQueueDisposable;-><init>()V

    .line 49
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableRangeLong$RangeDisposable;->actual:Lio/reactivex/Observer;

    .line 50
    iput-wide p2, p0, Lio/reactivex/internal/operators/observable/ObservableRangeLong$RangeDisposable;->index:J

    .line 51
    iput-wide p4, p0, Lio/reactivex/internal/operators/observable/ObservableRangeLong$RangeDisposable;->end:J

    .line 52
    return-void
.end method


# virtual methods
.method public clear()V
    .locals 2

    .prologue
    .line 88
    iget-wide v0, p0, Lio/reactivex/internal/operators/observable/ObservableRangeLong$RangeDisposable;->end:J

    iput-wide v0, p0, Lio/reactivex/internal/operators/observable/ObservableRangeLong$RangeDisposable;->index:J

    .line 89
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lio/reactivex/internal/operators/observable/ObservableRangeLong$RangeDisposable;->lazySet(I)V

    .line 90
    return-void
.end method

.method public dispose()V
    .locals 1

    .prologue
    .line 94
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lio/reactivex/internal/operators/observable/ObservableRangeLong$RangeDisposable;->set(I)V

    .line 95
    return-void
.end method

.method public isDisposed()Z
    .locals 1

    .prologue
    .line 99
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableRangeLong$RangeDisposable;->get()I

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isEmpty()Z
    .locals 4

    .prologue
    .line 83
    iget-wide v0, p0, Lio/reactivex/internal/operators/observable/ObservableRangeLong$RangeDisposable;->index:J

    iget-wide v2, p0, Lio/reactivex/internal/operators/observable/ObservableRangeLong$RangeDisposable;->end:J

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public poll()Ljava/lang/Long;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .annotation build Lio/reactivex/annotations/Nullable;
    .end annotation

    .prologue
    .line 72
    iget-wide v0, p0, Lio/reactivex/internal/operators/observable/ObservableRangeLong$RangeDisposable;->index:J

    .line 73
    .local v0, "i":J
    iget-wide v2, p0, Lio/reactivex/internal/operators/observable/ObservableRangeLong$RangeDisposable;->end:J

    cmp-long v2, v0, v2

    if-eqz v2, :cond_0

    .line 74
    const-wide/16 v2, 0x1

    add-long/2addr v2, v0

    iput-wide v2, p0, Lio/reactivex/internal/operators/observable/ObservableRangeLong$RangeDisposable;->index:J

    .line 75
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    .line 78
    :goto_0
    return-object v2

    .line 77
    :cond_0
    const/4 v2, 0x1

    invoke-virtual {p0, v2}, Lio/reactivex/internal/operators/observable/ObservableRangeLong$RangeDisposable;->lazySet(I)V

    .line 78
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public bridge synthetic poll()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 35
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableRangeLong$RangeDisposable;->poll()Ljava/lang/Long;

    move-result-object v0

    return-object v0
.end method

.method public requestFusion(I)I
    .locals 2
    .param p1, "mode"    # I

    .prologue
    const/4 v0, 0x1

    .line 104
    and-int/lit8 v1, p1, 0x1

    if-eqz v1, :cond_0

    .line 105
    iput-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableRangeLong$RangeDisposable;->fused:Z

    .line 108
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method run()V
    .locals 8

    .prologue
    .line 55
    iget-boolean v1, p0, Lio/reactivex/internal/operators/observable/ObservableRangeLong$RangeDisposable;->fused:Z

    if-eqz v1, :cond_1

    .line 67
    :cond_0
    :goto_0
    return-void

    .line 58
    :cond_1
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableRangeLong$RangeDisposable;->actual:Lio/reactivex/Observer;

    .line 59
    .local v0, "actual":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-Ljava/lang/Long;>;"
    iget-wide v2, p0, Lio/reactivex/internal/operators/observable/ObservableRangeLong$RangeDisposable;->end:J

    .line 60
    .local v2, "e":J
    iget-wide v4, p0, Lio/reactivex/internal/operators/observable/ObservableRangeLong$RangeDisposable;->index:J

    .local v4, "i":J
    :goto_1
    cmp-long v1, v4, v2

    if-eqz v1, :cond_2

    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableRangeLong$RangeDisposable;->get()I

    move-result v1

    if-nez v1, :cond_2

    .line 61
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-interface {v0, v1}, Lio/reactivex/Observer;->onNext(Ljava/lang/Object;)V

    .line 60
    const-wide/16 v6, 0x1

    add-long/2addr v4, v6

    goto :goto_1

    .line 63
    :cond_2
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableRangeLong$RangeDisposable;->get()I

    move-result v1

    if-nez v1, :cond_0

    .line 64
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lio/reactivex/internal/operators/observable/ObservableRangeLong$RangeDisposable;->lazySet(I)V

    .line 65
    invoke-interface {v0}, Lio/reactivex/Observer;->onComplete()V

    goto :goto_0
.end method
