.class final Lio/reactivex/subjects/ReplaySubject$SizeBoundReplayBuffer;
.super Ljava/util/concurrent/atomic/AtomicReference;
.source "ReplaySubject.java"

# interfaces
.implements Lio/reactivex/subjects/ReplaySubject$ReplayBuffer;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/subjects/ReplaySubject;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "SizeBoundReplayBuffer"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/concurrent/atomic/AtomicReference",
        "<",
        "Ljava/lang/Object;",
        ">;",
        "Lio/reactivex/subjects/ReplaySubject$ReplayBuffer",
        "<TT;>;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0xf5f291fe2c1030bL


# instance fields
.field volatile done:Z

.field volatile head:Lio/reactivex/subjects/ReplaySubject$Node;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/subjects/ReplaySubject$Node",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field final maxSize:I

.field size:I

.field tail:Lio/reactivex/subjects/ReplaySubject$Node;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/subjects/ReplaySubject$Node",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(I)V
    .locals 2
    .param p1, "maxSize"    # I

    .prologue
    .line 725
    .local p0, "this":Lio/reactivex/subjects/ReplaySubject$SizeBoundReplayBuffer;, "Lio/reactivex/subjects/ReplaySubject$SizeBoundReplayBuffer<TT;>;"
    invoke-direct {p0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    .line 726
    const-string/jumbo v1, "maxSize"

    invoke-static {p1, v1}, Lio/reactivex/internal/functions/ObjectHelper;->verifyPositive(ILjava/lang/String;)I

    move-result v1

    iput v1, p0, Lio/reactivex/subjects/ReplaySubject$SizeBoundReplayBuffer;->maxSize:I

    .line 727
    new-instance v0, Lio/reactivex/subjects/ReplaySubject$Node;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lio/reactivex/subjects/ReplaySubject$Node;-><init>(Ljava/lang/Object;)V

    .line 728
    .local v0, "h":Lio/reactivex/subjects/ReplaySubject$Node;, "Lio/reactivex/subjects/ReplaySubject$Node<Ljava/lang/Object;>;"
    iput-object v0, p0, Lio/reactivex/subjects/ReplaySubject$SizeBoundReplayBuffer;->tail:Lio/reactivex/subjects/ReplaySubject$Node;

    .line 729
    iput-object v0, p0, Lio/reactivex/subjects/ReplaySubject$SizeBoundReplayBuffer;->head:Lio/reactivex/subjects/ReplaySubject$Node;

    .line 730
    return-void
.end method


# virtual methods
.method public add(Ljava/lang/Object;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 742
    .local p0, "this":Lio/reactivex/subjects/ReplaySubject$SizeBoundReplayBuffer;, "Lio/reactivex/subjects/ReplaySubject$SizeBoundReplayBuffer<TT;>;"
    .local p1, "value":Ljava/lang/Object;, "TT;"
    new-instance v0, Lio/reactivex/subjects/ReplaySubject$Node;

    invoke-direct {v0, p1}, Lio/reactivex/subjects/ReplaySubject$Node;-><init>(Ljava/lang/Object;)V

    .line 743
    .local v0, "n":Lio/reactivex/subjects/ReplaySubject$Node;, "Lio/reactivex/subjects/ReplaySubject$Node<Ljava/lang/Object;>;"
    iget-object v1, p0, Lio/reactivex/subjects/ReplaySubject$SizeBoundReplayBuffer;->tail:Lio/reactivex/subjects/ReplaySubject$Node;

    .line 745
    .local v1, "t":Lio/reactivex/subjects/ReplaySubject$Node;, "Lio/reactivex/subjects/ReplaySubject$Node<Ljava/lang/Object;>;"
    iput-object v0, p0, Lio/reactivex/subjects/ReplaySubject$SizeBoundReplayBuffer;->tail:Lio/reactivex/subjects/ReplaySubject$Node;

    .line 746
    iget v2, p0, Lio/reactivex/subjects/ReplaySubject$SizeBoundReplayBuffer;->size:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lio/reactivex/subjects/ReplaySubject$SizeBoundReplayBuffer;->size:I

    .line 747
    invoke-virtual {v1, v0}, Lio/reactivex/subjects/ReplaySubject$Node;->set(Ljava/lang/Object;)V

    .line 749
    invoke-virtual {p0}, Lio/reactivex/subjects/ReplaySubject$SizeBoundReplayBuffer;->trim()V

    .line 750
    return-void
.end method

.method public addFinal(Ljava/lang/Object;)V
    .locals 3
    .param p1, "notificationLite"    # Ljava/lang/Object;

    .prologue
    .line 754
    .local p0, "this":Lio/reactivex/subjects/ReplaySubject$SizeBoundReplayBuffer;, "Lio/reactivex/subjects/ReplaySubject$SizeBoundReplayBuffer<TT;>;"
    new-instance v0, Lio/reactivex/subjects/ReplaySubject$Node;

    invoke-direct {v0, p1}, Lio/reactivex/subjects/ReplaySubject$Node;-><init>(Ljava/lang/Object;)V

    .line 755
    .local v0, "n":Lio/reactivex/subjects/ReplaySubject$Node;, "Lio/reactivex/subjects/ReplaySubject$Node<Ljava/lang/Object;>;"
    iget-object v1, p0, Lio/reactivex/subjects/ReplaySubject$SizeBoundReplayBuffer;->tail:Lio/reactivex/subjects/ReplaySubject$Node;

    .line 757
    .local v1, "t":Lio/reactivex/subjects/ReplaySubject$Node;, "Lio/reactivex/subjects/ReplaySubject$Node<Ljava/lang/Object;>;"
    iput-object v0, p0, Lio/reactivex/subjects/ReplaySubject$SizeBoundReplayBuffer;->tail:Lio/reactivex/subjects/ReplaySubject$Node;

    .line 758
    iget v2, p0, Lio/reactivex/subjects/ReplaySubject$SizeBoundReplayBuffer;->size:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lio/reactivex/subjects/ReplaySubject$SizeBoundReplayBuffer;->size:I

    .line 759
    invoke-virtual {v1, v0}, Lio/reactivex/subjects/ReplaySubject$Node;->lazySet(Ljava/lang/Object;)V

    .line 761
    const/4 v2, 0x1

    iput-boolean v2, p0, Lio/reactivex/subjects/ReplaySubject$SizeBoundReplayBuffer;->done:Z

    .line 762
    return-void
.end method

.method public getValue()Ljava/lang/Object;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .line 767
    .local p0, "this":Lio/reactivex/subjects/ReplaySubject$SizeBoundReplayBuffer;, "Lio/reactivex/subjects/ReplaySubject$SizeBoundReplayBuffer<TT;>;"
    const/4 v2, 0x0

    .line 768
    .local v2, "prev":Lio/reactivex/subjects/ReplaySubject$Node;, "Lio/reactivex/subjects/ReplaySubject$Node<Ljava/lang/Object;>;"
    iget-object v0, p0, Lio/reactivex/subjects/ReplaySubject$SizeBoundReplayBuffer;->head:Lio/reactivex/subjects/ReplaySubject$Node;

    .line 771
    .local v0, "h":Lio/reactivex/subjects/ReplaySubject$Node;, "Lio/reactivex/subjects/ReplaySubject$Node<Ljava/lang/Object;>;"
    :goto_0
    invoke-virtual {v0}, Lio/reactivex/subjects/ReplaySubject$Node;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/reactivex/subjects/ReplaySubject$Node;

    .line 772
    .local v1, "next":Lio/reactivex/subjects/ReplaySubject$Node;, "Lio/reactivex/subjects/ReplaySubject$Node<Ljava/lang/Object;>;"
    if-nez v1, :cond_1

    .line 779
    iget-object v3, v0, Lio/reactivex/subjects/ReplaySubject$Node;->value:Ljava/lang/Object;

    .line 780
    .local v3, "v":Ljava/lang/Object;
    if-nez v3, :cond_2

    .line 781
    const/4 v3, 0x0

    .line 787
    .end local v3    # "v":Ljava/lang/Object;
    :cond_0
    :goto_1
    return-object v3

    .line 775
    :cond_1
    move-object v2, v0

    .line 776
    move-object v0, v1

    .line 777
    goto :goto_0

    .line 783
    .restart local v3    # "v":Ljava/lang/Object;
    :cond_2
    invoke-static {v3}, Lio/reactivex/internal/util/NotificationLite;->isComplete(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_3

    invoke-static {v3}, Lio/reactivex/internal/util/NotificationLite;->isError(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 784
    :cond_3
    iget-object v3, v2, Lio/reactivex/subjects/ReplaySubject$Node;->value:Ljava/lang/Object;

    goto :goto_1
.end method

.method public getValues([Ljava/lang/Object;)[Ljava/lang/Object;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([TT;)[TT;"
        }
    .end annotation

    .prologue
    .local p0, "this":Lio/reactivex/subjects/ReplaySubject$SizeBoundReplayBuffer;, "Lio/reactivex/subjects/ReplaySubject$SizeBoundReplayBuffer<TT;>;"
    .local p1, "array":[Ljava/lang/Object;, "[TT;"
    const/4 v5, 0x0

    .line 793
    iget-object v0, p0, Lio/reactivex/subjects/ReplaySubject$SizeBoundReplayBuffer;->head:Lio/reactivex/subjects/ReplaySubject$Node;

    .line 794
    .local v0, "h":Lio/reactivex/subjects/ReplaySubject$Node;, "Lio/reactivex/subjects/ReplaySubject$Node<Ljava/lang/Object;>;"
    invoke-virtual {p0}, Lio/reactivex/subjects/ReplaySubject$SizeBoundReplayBuffer;->size()I

    move-result v3

    .line 796
    .local v3, "s":I
    if-nez v3, :cond_1

    .line 797
    array-length v4, p1

    if-eqz v4, :cond_0

    .line 798
    const/4 v4, 0x0

    aput-object v5, p1, v4

    .line 817
    :cond_0
    :goto_0
    return-object p1

    .line 801
    :cond_1
    array-length v4, p1

    if-ge v4, v3, :cond_2

    .line 802
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v4

    invoke-static {v4, v3}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [Ljava/lang/Object;

    move-object p1, v4

    check-cast p1, [Ljava/lang/Object;

    .line 805
    :cond_2
    const/4 v1, 0x0

    .line 806
    .local v1, "i":I
    :goto_1
    if-eq v1, v3, :cond_3

    .line 807
    invoke-virtual {v0}, Lio/reactivex/subjects/ReplaySubject$Node;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lio/reactivex/subjects/ReplaySubject$Node;

    .line 808
    .local v2, "next":Lio/reactivex/subjects/ReplaySubject$Node;, "Lio/reactivex/subjects/ReplaySubject$Node<Ljava/lang/Object;>;"
    iget-object v4, v2, Lio/reactivex/subjects/ReplaySubject$Node;->value:Ljava/lang/Object;

    aput-object v4, p1, v1

    .line 809
    add-int/lit8 v1, v1, 0x1

    .line 810
    move-object v0, v2

    .line 811
    goto :goto_1

    .line 812
    .end local v2    # "next":Lio/reactivex/subjects/ReplaySubject$Node;, "Lio/reactivex/subjects/ReplaySubject$Node<Ljava/lang/Object;>;"
    :cond_3
    array-length v4, p1

    if-le v4, v3, :cond_0

    .line 813
    aput-object v5, p1, v3

    goto :goto_0
.end method

.method public replay(Lio/reactivex/subjects/ReplaySubject$ReplayDisposable;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/subjects/ReplaySubject$ReplayDisposable",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lio/reactivex/subjects/ReplaySubject$SizeBoundReplayBuffer;, "Lio/reactivex/subjects/ReplaySubject$SizeBoundReplayBuffer<TT;>;"
    .local p1, "rs":Lio/reactivex/subjects/ReplaySubject$ReplayDisposable;, "Lio/reactivex/subjects/ReplaySubject$ReplayDisposable<TT;>;"
    const/4 v6, 0x0

    .line 823
    invoke-virtual {p1}, Lio/reactivex/subjects/ReplaySubject$ReplayDisposable;->getAndIncrement()I

    move-result v5

    if-eqz v5, :cond_0

    .line 881
    :goto_0
    return-void

    .line 827
    :cond_0
    const/4 v2, 0x1

    .line 828
    .local v2, "missed":I
    iget-object v0, p1, Lio/reactivex/subjects/ReplaySubject$ReplayDisposable;->actual:Lio/reactivex/Observer;

    .line 830
    .local v0, "a":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TT;>;"
    iget-object v1, p1, Lio/reactivex/subjects/ReplaySubject$ReplayDisposable;->index:Ljava/lang/Object;

    check-cast v1, Lio/reactivex/subjects/ReplaySubject$Node;

    .line 831
    .local v1, "index":Lio/reactivex/subjects/ReplaySubject$Node;, "Lio/reactivex/subjects/ReplaySubject$Node<Ljava/lang/Object;>;"
    if-nez v1, :cond_1

    .line 832
    iget-object v1, p0, Lio/reactivex/subjects/ReplaySubject$SizeBoundReplayBuffer;->head:Lio/reactivex/subjects/ReplaySubject$Node;

    .line 838
    :cond_1
    :goto_1
    iget-boolean v5, p1, Lio/reactivex/subjects/ReplaySubject$ReplayDisposable;->cancelled:Z

    if-eqz v5, :cond_2

    .line 839
    iput-object v6, p1, Lio/reactivex/subjects/ReplaySubject$ReplayDisposable;->index:Ljava/lang/Object;

    goto :goto_0

    .line 843
    :cond_2
    invoke-virtual {v1}, Lio/reactivex/subjects/ReplaySubject$Node;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lio/reactivex/subjects/ReplaySubject$Node;

    .line 845
    .local v3, "n":Lio/reactivex/subjects/ReplaySubject$Node;, "Lio/reactivex/subjects/ReplaySubject$Node<Ljava/lang/Object;>;"
    if-nez v3, :cond_3

    .line 870
    invoke-virtual {v1}, Lio/reactivex/subjects/ReplaySubject$Node;->get()Ljava/lang/Object;

    move-result-object v5

    if-nez v5, :cond_1

    .line 874
    iput-object v1, p1, Lio/reactivex/subjects/ReplaySubject$ReplayDisposable;->index:Ljava/lang/Object;

    .line 876
    neg-int v5, v2

    invoke-virtual {p1, v5}, Lio/reactivex/subjects/ReplaySubject$ReplayDisposable;->addAndGet(I)I

    move-result v2

    .line 877
    if-nez v2, :cond_1

    goto :goto_0

    .line 849
    :cond_3
    iget-object v4, v3, Lio/reactivex/subjects/ReplaySubject$Node;->value:Ljava/lang/Object;

    .line 851
    .local v4, "o":Ljava/lang/Object;
    iget-boolean v5, p0, Lio/reactivex/subjects/ReplaySubject$SizeBoundReplayBuffer;->done:Z

    if-eqz v5, :cond_5

    .line 852
    invoke-virtual {v3}, Lio/reactivex/subjects/ReplaySubject$Node;->get()Ljava/lang/Object;

    move-result-object v5

    if-nez v5, :cond_5

    .line 854
    invoke-static {v4}, Lio/reactivex/internal/util/NotificationLite;->isComplete(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 855
    invoke-interface {v0}, Lio/reactivex/Observer;->onComplete()V

    .line 859
    :goto_2
    iput-object v6, p1, Lio/reactivex/subjects/ReplaySubject$ReplayDisposable;->index:Ljava/lang/Object;

    .line 860
    const/4 v5, 0x1

    iput-boolean v5, p1, Lio/reactivex/subjects/ReplaySubject$ReplayDisposable;->cancelled:Z

    goto :goto_0

    .line 857
    :cond_4
    invoke-static {v4}, Lio/reactivex/internal/util/NotificationLite;->getError(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object v5

    invoke-interface {v0, v5}, Lio/reactivex/Observer;->onError(Ljava/lang/Throwable;)V

    goto :goto_2

    .line 865
    :cond_5
    invoke-interface {v0, v4}, Lio/reactivex/Observer;->onNext(Ljava/lang/Object;)V

    .line 867
    move-object v1, v3

    .line 868
    goto :goto_1
.end method

.method public size()I
    .locals 5

    .prologue
    .line 885
    .local p0, "this":Lio/reactivex/subjects/ReplaySubject$SizeBoundReplayBuffer;, "Lio/reactivex/subjects/ReplaySubject$SizeBoundReplayBuffer<TT;>;"
    const/4 v3, 0x0

    .line 886
    .local v3, "s":I
    iget-object v0, p0, Lio/reactivex/subjects/ReplaySubject$SizeBoundReplayBuffer;->head:Lio/reactivex/subjects/ReplaySubject$Node;

    .line 887
    .local v0, "h":Lio/reactivex/subjects/ReplaySubject$Node;, "Lio/reactivex/subjects/ReplaySubject$Node<Ljava/lang/Object;>;"
    :goto_0
    const v4, 0x7fffffff

    if-eq v3, v4, :cond_1

    .line 888
    invoke-virtual {v0}, Lio/reactivex/subjects/ReplaySubject$Node;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/reactivex/subjects/ReplaySubject$Node;

    .line 889
    .local v1, "next":Lio/reactivex/subjects/ReplaySubject$Node;, "Lio/reactivex/subjects/ReplaySubject$Node<Ljava/lang/Object;>;"
    if-nez v1, :cond_2

    .line 890
    iget-object v2, v0, Lio/reactivex/subjects/ReplaySubject$Node;->value:Ljava/lang/Object;

    .line 891
    .local v2, "o":Ljava/lang/Object;
    invoke-static {v2}, Lio/reactivex/internal/util/NotificationLite;->isComplete(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    invoke-static {v2}, Lio/reactivex/internal/util/NotificationLite;->isError(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 892
    :cond_0
    add-int/lit8 v3, v3, -0x1

    .line 900
    .end local v1    # "next":Lio/reactivex/subjects/ReplaySubject$Node;, "Lio/reactivex/subjects/ReplaySubject$Node<Ljava/lang/Object;>;"
    .end local v2    # "o":Ljava/lang/Object;
    :cond_1
    return v3

    .line 896
    .restart local v1    # "next":Lio/reactivex/subjects/ReplaySubject$Node;, "Lio/reactivex/subjects/ReplaySubject$Node<Ljava/lang/Object;>;"
    :cond_2
    add-int/lit8 v3, v3, 0x1

    .line 897
    move-object v0, v1

    .line 898
    goto :goto_0
.end method

.method trim()V
    .locals 3

    .prologue
    .line 733
    .local p0, "this":Lio/reactivex/subjects/ReplaySubject$SizeBoundReplayBuffer;, "Lio/reactivex/subjects/ReplaySubject$SizeBoundReplayBuffer<TT;>;"
    iget v1, p0, Lio/reactivex/subjects/ReplaySubject$SizeBoundReplayBuffer;->size:I

    iget v2, p0, Lio/reactivex/subjects/ReplaySubject$SizeBoundReplayBuffer;->maxSize:I

    if-le v1, v2, :cond_0

    .line 734
    iget v1, p0, Lio/reactivex/subjects/ReplaySubject$SizeBoundReplayBuffer;->size:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lio/reactivex/subjects/ReplaySubject$SizeBoundReplayBuffer;->size:I

    .line 735
    iget-object v0, p0, Lio/reactivex/subjects/ReplaySubject$SizeBoundReplayBuffer;->head:Lio/reactivex/subjects/ReplaySubject$Node;

    .line 736
    .local v0, "h":Lio/reactivex/subjects/ReplaySubject$Node;, "Lio/reactivex/subjects/ReplaySubject$Node<Ljava/lang/Object;>;"
    invoke-virtual {v0}, Lio/reactivex/subjects/ReplaySubject$Node;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/reactivex/subjects/ReplaySubject$Node;

    iput-object v1, p0, Lio/reactivex/subjects/ReplaySubject$SizeBoundReplayBuffer;->head:Lio/reactivex/subjects/ReplaySubject$Node;

    .line 738
    .end local v0    # "h":Lio/reactivex/subjects/ReplaySubject$Node;, "Lio/reactivex/subjects/ReplaySubject$Node<Ljava/lang/Object;>;"
    :cond_0
    return-void
.end method
