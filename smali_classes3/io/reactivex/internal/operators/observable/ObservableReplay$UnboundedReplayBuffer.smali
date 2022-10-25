.class final Lio/reactivex/internal/operators/observable/ObservableReplay$UnboundedReplayBuffer;
.super Ljava/util/ArrayList;
.source "ObservableReplay.java"

# interfaces
.implements Lio/reactivex/internal/operators/observable/ObservableReplay$ReplayBuffer;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/observable/ObservableReplay;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "UnboundedReplayBuffer"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/ArrayList",
        "<",
        "Ljava/lang/Object;",
        ">;",
        "Lio/reactivex/internal/operators/observable/ObservableReplay$ReplayBuffer",
        "<TT;>;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x62057d556fa2a2d8L


# instance fields
.field volatile size:I


# direct methods
.method constructor <init>(I)V
    .locals 0
    .param p1, "capacityHint"    # I

    .prologue
    .line 511
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableReplay$UnboundedReplayBuffer;, "Lio/reactivex/internal/operators/observable/ObservableReplay$UnboundedReplayBuffer<TT;>;"
    invoke-direct {p0, p1}, Ljava/util/ArrayList;-><init>(I)V

    .line 512
    return-void
.end method


# virtual methods
.method public complete()V
    .locals 1

    .prologue
    .line 527
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableReplay$UnboundedReplayBuffer;, "Lio/reactivex/internal/operators/observable/ObservableReplay$UnboundedReplayBuffer<TT;>;"
    invoke-static {}, Lio/reactivex/internal/util/NotificationLite;->complete()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p0, v0}, Lio/reactivex/internal/operators/observable/ObservableReplay$UnboundedReplayBuffer;->add(Ljava/lang/Object;)Z

    .line 528
    iget v0, p0, Lio/reactivex/internal/operators/observable/ObservableReplay$UnboundedReplayBuffer;->size:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lio/reactivex/internal/operators/observable/ObservableReplay$UnboundedReplayBuffer;->size:I

    .line 529
    return-void
.end method

.method public error(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 521
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableReplay$UnboundedReplayBuffer;, "Lio/reactivex/internal/operators/observable/ObservableReplay$UnboundedReplayBuffer<TT;>;"
    invoke-static {p1}, Lio/reactivex/internal/util/NotificationLite;->error(Ljava/lang/Throwable;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p0, v0}, Lio/reactivex/internal/operators/observable/ObservableReplay$UnboundedReplayBuffer;->add(Ljava/lang/Object;)Z

    .line 522
    iget v0, p0, Lio/reactivex/internal/operators/observable/ObservableReplay$UnboundedReplayBuffer;->size:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lio/reactivex/internal/operators/observable/ObservableReplay$UnboundedReplayBuffer;->size:I

    .line 523
    return-void
.end method

.method public next(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 515
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableReplay$UnboundedReplayBuffer;, "Lio/reactivex/internal/operators/observable/ObservableReplay$UnboundedReplayBuffer<TT;>;"
    .local p1, "value":Ljava/lang/Object;, "TT;"
    invoke-static {p1}, Lio/reactivex/internal/util/NotificationLite;->next(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p0, v0}, Lio/reactivex/internal/operators/observable/ObservableReplay$UnboundedReplayBuffer;->add(Ljava/lang/Object;)Z

    .line 516
    iget v0, p0, Lio/reactivex/internal/operators/observable/ObservableReplay$UnboundedReplayBuffer;->size:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lio/reactivex/internal/operators/observable/ObservableReplay$UnboundedReplayBuffer;->size:I

    .line 517
    return-void
.end method

.method public replay(Lio/reactivex/internal/operators/observable/ObservableReplay$InnerDisposable;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/internal/operators/observable/ObservableReplay$InnerDisposable",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 533
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableReplay$UnboundedReplayBuffer;, "Lio/reactivex/internal/operators/observable/ObservableReplay$UnboundedReplayBuffer<TT;>;"
    .local p1, "output":Lio/reactivex/internal/operators/observable/ObservableReplay$InnerDisposable;, "Lio/reactivex/internal/operators/observable/ObservableReplay$InnerDisposable<TT;>;"
    invoke-virtual {p1}, Lio/reactivex/internal/operators/observable/ObservableReplay$InnerDisposable;->getAndIncrement()I

    move-result v6

    if-eqz v6, :cond_1

    .line 567
    :cond_0
    :goto_0
    return-void

    .line 537
    :cond_1
    iget-object v0, p1, Lio/reactivex/internal/operators/observable/ObservableReplay$InnerDisposable;->child:Lio/reactivex/Observer;

    .line 539
    .local v0, "child":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TT;>;"
    const/4 v3, 0x1

    .line 542
    .local v3, "missed":I
    :cond_2
    invoke-virtual {p1}, Lio/reactivex/internal/operators/observable/ObservableReplay$InnerDisposable;->isDisposed()Z

    move-result v6

    if-nez v6, :cond_0

    .line 545
    iget v5, p0, Lio/reactivex/internal/operators/observable/ObservableReplay$UnboundedReplayBuffer;->size:I

    .line 547
    .local v5, "sourceIndex":I
    invoke-virtual {p1}, Lio/reactivex/internal/operators/observable/ObservableReplay$InnerDisposable;->index()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    .line 548
    .local v2, "destinationIndexObject":Ljava/lang/Integer;
    if-eqz v2, :cond_3

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 550
    .local v1, "destinationIndex":I
    :goto_1
    if-ge v1, v5, :cond_4

    .line 551
    invoke-virtual {p0, v1}, Lio/reactivex/internal/operators/observable/ObservableReplay$UnboundedReplayBuffer;->get(I)Ljava/lang/Object;

    move-result-object v4

    .line 552
    .local v4, "o":Ljava/lang/Object;
    invoke-static {v4, v0}, Lio/reactivex/internal/util/NotificationLite;->accept(Ljava/lang/Object;Lio/reactivex/Observer;)Z

    move-result v6

    if-nez v6, :cond_0

    .line 555
    invoke-virtual {p1}, Lio/reactivex/internal/operators/observable/ObservableReplay$InnerDisposable;->isDisposed()Z

    move-result v6

    if-nez v6, :cond_0

    .line 558
    add-int/lit8 v1, v1, 0x1

    .line 559
    goto :goto_1

    .line 548
    .end local v1    # "destinationIndex":I
    .end local v4    # "o":Ljava/lang/Object;
    :cond_3
    const/4 v1, 0x0

    goto :goto_1

    .line 561
    .restart local v1    # "destinationIndex":I
    :cond_4
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    iput-object v6, p1, Lio/reactivex/internal/operators/observable/ObservableReplay$InnerDisposable;->index:Ljava/lang/Object;

    .line 562
    neg-int v6, v3

    invoke-virtual {p1, v6}, Lio/reactivex/internal/operators/observable/ObservableReplay$InnerDisposable;->addAndGet(I)I

    move-result v3

    .line 563
    if-nez v3, :cond_2

    goto :goto_0
.end method
