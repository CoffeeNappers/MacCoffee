.class final Lio/reactivex/internal/operators/observable/ObservableRange$RangeDisposable;
.super Lio/reactivex/internal/observers/BasicIntQueueDisposable;
.source "ObservableRange.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/observable/ObservableRange;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "RangeDisposable"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lio/reactivex/internal/observers/BasicIntQueueDisposable",
        "<",
        "Ljava/lang/Integer;",
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
            "Ljava/lang/Integer;",
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
            "Ljava/lang/Integer;",
            ">;JJ)V"
        }
    .end annotation

    .prologue
    .line 51
    .local p1, "actual":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-Ljava/lang/Integer;>;"
    invoke-direct {p0}, Lio/reactivex/internal/observers/BasicIntQueueDisposable;-><init>()V

    .line 52
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableRange$RangeDisposable;->actual:Lio/reactivex/Observer;

    .line 53
    iput-wide p2, p0, Lio/reactivex/internal/operators/observable/ObservableRange$RangeDisposable;->index:J

    .line 54
    iput-wide p4, p0, Lio/reactivex/internal/operators/observable/ObservableRange$RangeDisposable;->end:J

    .line 55
    return-void
.end method


# virtual methods
.method public clear()V
    .locals 2

    .prologue
    .line 91
    iget-wide v0, p0, Lio/reactivex/internal/operators/observable/ObservableRange$RangeDisposable;->end:J

    iput-wide v0, p0, Lio/reactivex/internal/operators/observable/ObservableRange$RangeDisposable;->index:J

    .line 92
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lio/reactivex/internal/operators/observable/ObservableRange$RangeDisposable;->lazySet(I)V

    .line 93
    return-void
.end method

.method public dispose()V
    .locals 1

    .prologue
    .line 97
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lio/reactivex/internal/operators/observable/ObservableRange$RangeDisposable;->set(I)V

    .line 98
    return-void
.end method

.method public isDisposed()Z
    .locals 1

    .prologue
    .line 102
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableRange$RangeDisposable;->get()I

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
    .line 86
    iget-wide v0, p0, Lio/reactivex/internal/operators/observable/ObservableRange$RangeDisposable;->index:J

    iget-wide v2, p0, Lio/reactivex/internal/operators/observable/ObservableRange$RangeDisposable;->end:J

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public poll()Ljava/lang/Integer;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .annotation build Lio/reactivex/annotations/Nullable;
    .end annotation

    .prologue
    .line 75
    iget-wide v0, p0, Lio/reactivex/internal/operators/observable/ObservableRange$RangeDisposable;->index:J

    .line 76
    .local v0, "i":J
    iget-wide v2, p0, Lio/reactivex/internal/operators/observable/ObservableRange$RangeDisposable;->end:J

    cmp-long v2, v0, v2

    if-eqz v2, :cond_0

    .line 77
    const-wide/16 v2, 0x1

    add-long/2addr v2, v0

    iput-wide v2, p0, Lio/reactivex/internal/operators/observable/ObservableRange$RangeDisposable;->index:J

    .line 78
    long-to-int v2, v0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    .line 81
    :goto_0
    return-object v2

    .line 80
    :cond_0
    const/4 v2, 0x1

    invoke-virtual {p0, v2}, Lio/reactivex/internal/operators/observable/ObservableRange$RangeDisposable;->lazySet(I)V

    .line 81
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
    .line 38
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableRange$RangeDisposable;->poll()Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public requestFusion(I)I
    .locals 2
    .param p1, "mode"    # I

    .prologue
    const/4 v0, 0x1

    .line 107
    and-int/lit8 v1, p1, 0x1

    if-eqz v1, :cond_0

    .line 108
    iput-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableRange$RangeDisposable;->fused:Z

    .line 111
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method run()V
    .locals 8

    .prologue
    .line 58
    iget-boolean v1, p0, Lio/reactivex/internal/operators/observable/ObservableRange$RangeDisposable;->fused:Z

    if-eqz v1, :cond_1

    .line 70
    :cond_0
    :goto_0
    return-void

    .line 61
    :cond_1
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableRange$RangeDisposable;->actual:Lio/reactivex/Observer;

    .line 62
    .local v0, "actual":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-Ljava/lang/Integer;>;"
    iget-wide v2, p0, Lio/reactivex/internal/operators/observable/ObservableRange$RangeDisposable;->end:J

    .line 63
    .local v2, "e":J
    iget-wide v4, p0, Lio/reactivex/internal/operators/observable/ObservableRange$RangeDisposable;->index:J

    .local v4, "i":J
    :goto_1
    cmp-long v1, v4, v2

    if-eqz v1, :cond_2

    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableRange$RangeDisposable;->get()I

    move-result v1

    if-nez v1, :cond_2

    .line 64
    long-to-int v1, v4

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Lio/reactivex/Observer;->onNext(Ljava/lang/Object;)V

    .line 63
    const-wide/16 v6, 0x1

    add-long/2addr v4, v6

    goto :goto_1

    .line 66
    :cond_2
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableRange$RangeDisposable;->get()I

    move-result v1

    if-nez v1, :cond_0

    .line 67
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lio/reactivex/internal/operators/observable/ObservableRange$RangeDisposable;->lazySet(I)V

    .line 68
    invoke-interface {v0}, Lio/reactivex/Observer;->onComplete()V

    goto :goto_0
.end method
