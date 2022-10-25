.class final Lio/reactivex/internal/operators/parallel/ParallelSortedJoin$SortedJoinSubscription;
.super Ljava/util/concurrent/atomic/AtomicInteger;
.source "ParallelSortedJoin.java"

# interfaces
.implements Lorg/reactivestreams/Subscription;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/parallel/ParallelSortedJoin;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "SortedJoinSubscription"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/concurrent/atomic/AtomicInteger;",
        "Lorg/reactivestreams/Subscription;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x30527af9756114d9L


# instance fields
.field final actual:Lorg/reactivestreams/Subscriber;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/reactivestreams/Subscriber",
            "<-TT;>;"
        }
    .end annotation
.end field

.field volatile cancelled:Z

.field final comparator:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator",
            "<-TT;>;"
        }
    .end annotation
.end field

.field final error:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Ljava/lang/Throwable;",
            ">;"
        }
    .end annotation
.end field

.field final indexes:[I

.field final lists:[Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Ljava/util/List",
            "<TT;>;"
        }
    .end annotation
.end field

.field final remaining:Ljava/util/concurrent/atomic/AtomicInteger;

.field final requested:Ljava/util/concurrent/atomic/AtomicLong;

.field final subscribers:[Lio/reactivex/internal/operators/parallel/ParallelSortedJoin$SortedJoinInnerSubscriber;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Lio/reactivex/internal/operators/parallel/ParallelSortedJoin$SortedJoinInnerSubscriber",
            "<TT;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lorg/reactivestreams/Subscriber;ILjava/util/Comparator;)V
    .locals 3
    .param p2, "n"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber",
            "<-TT;>;I",
            "Ljava/util/Comparator",
            "<-TT;>;)V"
        }
    .end annotation

    .prologue
    .line 80
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelSortedJoin$SortedJoinSubscription;, "Lio/reactivex/internal/operators/parallel/ParallelSortedJoin$SortedJoinSubscription<TT;>;"
    .local p1, "actual":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    .local p3, "comparator":Ljava/util/Comparator;, "Ljava/util/Comparator<-TT;>;"
    invoke-direct {p0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    .line 71
    new-instance v2, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v2}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v2, p0, Lio/reactivex/internal/operators/parallel/ParallelSortedJoin$SortedJoinSubscription;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    .line 75
    new-instance v2, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v2}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    iput-object v2, p0, Lio/reactivex/internal/operators/parallel/ParallelSortedJoin$SortedJoinSubscription;->remaining:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 77
    new-instance v2, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v2}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object v2, p0, Lio/reactivex/internal/operators/parallel/ParallelSortedJoin$SortedJoinSubscription;->error:Ljava/util/concurrent/atomic/AtomicReference;

    .line 81
    iput-object p1, p0, Lio/reactivex/internal/operators/parallel/ParallelSortedJoin$SortedJoinSubscription;->actual:Lorg/reactivestreams/Subscriber;

    .line 82
    iput-object p3, p0, Lio/reactivex/internal/operators/parallel/ParallelSortedJoin$SortedJoinSubscription;->comparator:Ljava/util/Comparator;

    .line 84
    new-array v1, p2, [Lio/reactivex/internal/operators/parallel/ParallelSortedJoin$SortedJoinInnerSubscriber;

    .line 86
    .local v1, "s":[Lio/reactivex/internal/operators/parallel/ParallelSortedJoin$SortedJoinInnerSubscriber;, "[Lio/reactivex/internal/operators/parallel/ParallelSortedJoin$SortedJoinInnerSubscriber<TT;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, p2, :cond_0

    .line 87
    new-instance v2, Lio/reactivex/internal/operators/parallel/ParallelSortedJoin$SortedJoinInnerSubscriber;

    invoke-direct {v2, p0, v0}, Lio/reactivex/internal/operators/parallel/ParallelSortedJoin$SortedJoinInnerSubscriber;-><init>(Lio/reactivex/internal/operators/parallel/ParallelSortedJoin$SortedJoinSubscription;I)V

    aput-object v2, v1, v0

    .line 86
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 89
    :cond_0
    iput-object v1, p0, Lio/reactivex/internal/operators/parallel/ParallelSortedJoin$SortedJoinSubscription;->subscribers:[Lio/reactivex/internal/operators/parallel/ParallelSortedJoin$SortedJoinInnerSubscriber;

    .line 90
    new-array v2, p2, [Ljava/util/List;

    iput-object v2, p0, Lio/reactivex/internal/operators/parallel/ParallelSortedJoin$SortedJoinSubscription;->lists:[Ljava/util/List;

    .line 91
    new-array v2, p2, [I

    iput-object v2, p0, Lio/reactivex/internal/operators/parallel/ParallelSortedJoin$SortedJoinSubscription;->indexes:[I

    .line 92
    iget-object v2, p0, Lio/reactivex/internal/operators/parallel/ParallelSortedJoin$SortedJoinSubscription;->remaining:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v2, p2}, Ljava/util/concurrent/atomic/AtomicInteger;->lazySet(I)V

    .line 93
    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 2

    .prologue
    .line 107
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelSortedJoin$SortedJoinSubscription;, "Lio/reactivex/internal/operators/parallel/ParallelSortedJoin$SortedJoinSubscription<TT;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/parallel/ParallelSortedJoin$SortedJoinSubscription;->cancelled:Z

    if-nez v0, :cond_0

    .line 108
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/parallel/ParallelSortedJoin$SortedJoinSubscription;->cancelled:Z

    .line 109
    invoke-virtual {p0}, Lio/reactivex/internal/operators/parallel/ParallelSortedJoin$SortedJoinSubscription;->cancelAll()V

    .line 110
    invoke-virtual {p0}, Lio/reactivex/internal/operators/parallel/ParallelSortedJoin$SortedJoinSubscription;->getAndIncrement()I

    move-result v0

    if-nez v0, :cond_0

    .line 111
    iget-object v0, p0, Lio/reactivex/internal/operators/parallel/ParallelSortedJoin$SortedJoinSubscription;->lists:[Ljava/util/List;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Ljava/util/Arrays;->fill([Ljava/lang/Object;Ljava/lang/Object;)V

    .line 114
    :cond_0
    return-void
.end method

.method cancelAll()V
    .locals 4

    .prologue
    .line 117
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelSortedJoin$SortedJoinSubscription;, "Lio/reactivex/internal/operators/parallel/ParallelSortedJoin$SortedJoinSubscription<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/parallel/ParallelSortedJoin$SortedJoinSubscription;->subscribers:[Lio/reactivex/internal/operators/parallel/ParallelSortedJoin$SortedJoinInnerSubscriber;

    .local v0, "arr$":[Lio/reactivex/internal/operators/parallel/ParallelSortedJoin$SortedJoinInnerSubscriber;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_0
    if-ge v1, v2, :cond_0

    aget-object v3, v0, v1

    .line 118
    .local v3, "s":Lio/reactivex/internal/operators/parallel/ParallelSortedJoin$SortedJoinInnerSubscriber;, "Lio/reactivex/internal/operators/parallel/ParallelSortedJoin$SortedJoinInnerSubscriber<TT;>;"
    invoke-virtual {v3}, Lio/reactivex/internal/operators/parallel/ParallelSortedJoin$SortedJoinInnerSubscriber;->cancel()V

    .line 117
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 120
    .end local v3    # "s":Lio/reactivex/internal/operators/parallel/ParallelSortedJoin$SortedJoinInnerSubscriber;, "Lio/reactivex/internal/operators/parallel/ParallelSortedJoin$SortedJoinInnerSubscriber<TT;>;"
    :cond_0
    return-void
.end method

.method drain()V
    .locals 28

    .prologue
    .line 140
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelSortedJoin$SortedJoinSubscription;, "Lio/reactivex/internal/operators/parallel/ParallelSortedJoin$SortedJoinSubscription<TT;>;"
    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/parallel/ParallelSortedJoin$SortedJoinSubscription;->getAndIncrement()I

    move-result v24

    if-eqz v24, :cond_0

    .line 262
    :goto_0
    return-void

    .line 144
    :cond_0
    const/16 v18, 0x1

    .line 145
    .local v18, "missed":I
    move-object/from16 v0, p0

    iget-object v4, v0, Lio/reactivex/internal/operators/parallel/ParallelSortedJoin$SortedJoinSubscription;->actual:Lorg/reactivestreams/Subscriber;

    .line 146
    .local v4, "a":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    move-object/from16 v0, p0

    iget-object v15, v0, Lio/reactivex/internal/operators/parallel/ParallelSortedJoin$SortedJoinSubscription;->lists:[Ljava/util/List;

    .line 147
    .local v15, "lists":[Ljava/util/List;, "[Ljava/util/List<TT;>;"
    move-object/from16 v0, p0

    iget-object v13, v0, Lio/reactivex/internal/operators/parallel/ParallelSortedJoin$SortedJoinSubscription;->indexes:[I

    .line 148
    .local v13, "indexes":[I
    array-length v0, v13

    move/from16 v19, v0

    .line 152
    .local v19, "n":I
    :cond_1
    :goto_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/parallel/ParallelSortedJoin$SortedJoinSubscription;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v20

    .line 153
    .local v20, "r":J
    const-wide/16 v6, 0x0

    .line 155
    .local v6, "e":J
    :goto_2
    cmp-long v24, v6, v20

    if-eqz v24, :cond_a

    .line 156
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lio/reactivex/internal/operators/parallel/ParallelSortedJoin$SortedJoinSubscription;->cancelled:Z

    move/from16 v24, v0

    if-eqz v24, :cond_2

    .line 157
    const/16 v24, 0x0

    move-object/from16 v0, v24

    invoke-static {v15, v0}, Ljava/util/Arrays;->fill([Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_0

    .line 161
    :cond_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/parallel/ParallelSortedJoin$SortedJoinSubscription;->error:Ljava/util/concurrent/atomic/AtomicReference;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Throwable;

    .line 162
    .local v9, "ex":Ljava/lang/Throwable;
    if-eqz v9, :cond_3

    .line 163
    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/parallel/ParallelSortedJoin$SortedJoinSubscription;->cancelAll()V

    .line 164
    const/16 v24, 0x0

    move-object/from16 v0, v24

    invoke-static {v15, v0}, Ljava/util/Arrays;->fill([Ljava/lang/Object;Ljava/lang/Object;)V

    .line 165
    invoke-interface {v4, v9}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 169
    :cond_3
    const/16 v16, 0x0

    .line 170
    .local v16, "min":Ljava/lang/Object;, "TT;"
    const/16 v17, -0x1

    .line 172
    .local v17, "minIndex":I
    const/4 v11, 0x0

    .end local v16    # "min":Ljava/lang/Object;, "TT;"
    .local v11, "i":I
    :goto_3
    move/from16 v0, v19

    if-ge v11, v0, :cond_8

    .line 173
    aget-object v14, v15, v11

    .line 174
    .local v14, "list":Ljava/util/List;, "Ljava/util/List<TT;>;"
    aget v12, v13, v11

    .line 176
    .local v12, "index":I
    invoke-interface {v14}, Ljava/util/List;->size()I

    move-result v24

    move/from16 v0, v24

    if-eq v0, v12, :cond_4

    .line 177
    if-nez v16, :cond_5

    .line 178
    invoke-interface {v14, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v16

    .line 179
    .restart local v16    # "min":Ljava/lang/Object;, "TT;"
    move/from16 v17, v11

    .line 172
    .end local v16    # "min":Ljava/lang/Object;, "TT;"
    :cond_4
    :goto_4
    add-int/lit8 v11, v11, 0x1

    goto :goto_3

    .line 181
    :cond_5
    invoke-interface {v14, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    .line 186
    .local v5, "b":Ljava/lang/Object;, "TT;"
    :try_start_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/parallel/ParallelSortedJoin$SortedJoinSubscription;->comparator:Ljava/util/Comparator;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    move-object/from16 v1, v16

    invoke-interface {v0, v1, v5}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result v24

    if-lez v24, :cond_6

    const/16 v22, 0x1

    .line 197
    .local v22, "smaller":Z
    :goto_5
    if-eqz v22, :cond_4

    .line 198
    move-object/from16 v16, v5

    .line 199
    .restart local v16    # "min":Ljava/lang/Object;, "TT;"
    move/from16 v17, v11

    goto :goto_4

    .line 186
    .end local v16    # "min":Ljava/lang/Object;, "TT;"
    .end local v22    # "smaller":Z
    :cond_6
    const/16 v22, 0x0

    goto :goto_5

    .line 187
    :catch_0
    move-exception v10

    .line 188
    .local v10, "exc":Ljava/lang/Throwable;
    invoke-static {v10}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 189
    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/parallel/ParallelSortedJoin$SortedJoinSubscription;->cancelAll()V

    .line 190
    const/16 v24, 0x0

    move-object/from16 v0, v24

    invoke-static {v15, v0}, Ljava/util/Arrays;->fill([Ljava/lang/Object;Ljava/lang/Object;)V

    .line 191
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/parallel/ParallelSortedJoin$SortedJoinSubscription;->error:Ljava/util/concurrent/atomic/AtomicReference;

    move-object/from16 v24, v0

    const/16 v25, 0x0

    move-object/from16 v0, v24

    move-object/from16 v1, v25

    invoke-virtual {v0, v1, v10}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v24

    if-nez v24, :cond_7

    .line 192
    invoke-static {v10}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    .line 194
    :cond_7
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/parallel/ParallelSortedJoin$SortedJoinSubscription;->error:Ljava/util/concurrent/atomic/AtomicReference;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v24

    check-cast v24, Ljava/lang/Throwable;

    move-object/from16 v0, v24

    invoke-interface {v4, v0}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto/16 :goto_0

    .line 205
    .end local v5    # "b":Ljava/lang/Object;, "TT;"
    .end local v10    # "exc":Ljava/lang/Throwable;
    .end local v12    # "index":I
    .end local v14    # "list":Ljava/util/List;, "Ljava/util/List<TT;>;"
    :cond_8
    if-nez v16, :cond_9

    .line 206
    const/16 v24, 0x0

    move-object/from16 v0, v24

    invoke-static {v15, v0}, Ljava/util/Arrays;->fill([Ljava/lang/Object;Ljava/lang/Object;)V

    .line 207
    invoke-interface {v4}, Lorg/reactivestreams/Subscriber;->onComplete()V

    goto/16 :goto_0

    .line 211
    :cond_9
    move-object/from16 v0, v16

    invoke-interface {v4, v0}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 213
    aget v24, v13, v17

    add-int/lit8 v24, v24, 0x1

    aput v24, v13, v17

    .line 215
    const-wide/16 v24, 0x1

    add-long v6, v6, v24

    .line 216
    goto/16 :goto_2

    .line 218
    .end local v9    # "ex":Ljava/lang/Throwable;
    .end local v11    # "i":I
    .end local v17    # "minIndex":I
    :cond_a
    cmp-long v24, v6, v20

    if-nez v24, :cond_f

    .line 219
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lio/reactivex/internal/operators/parallel/ParallelSortedJoin$SortedJoinSubscription;->cancelled:Z

    move/from16 v24, v0

    if-eqz v24, :cond_b

    .line 220
    const/16 v24, 0x0

    move-object/from16 v0, v24

    invoke-static {v15, v0}, Ljava/util/Arrays;->fill([Ljava/lang/Object;Ljava/lang/Object;)V

    goto/16 :goto_0

    .line 224
    :cond_b
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/parallel/ParallelSortedJoin$SortedJoinSubscription;->error:Ljava/util/concurrent/atomic/AtomicReference;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Throwable;

    .line 225
    .restart local v9    # "ex":Ljava/lang/Throwable;
    if-eqz v9, :cond_c

    .line 226
    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/parallel/ParallelSortedJoin$SortedJoinSubscription;->cancelAll()V

    .line 227
    const/16 v24, 0x0

    move-object/from16 v0, v24

    invoke-static {v15, v0}, Ljava/util/Arrays;->fill([Ljava/lang/Object;Ljava/lang/Object;)V

    .line 228
    invoke-interface {v4, v9}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto/16 :goto_0

    .line 232
    :cond_c
    const/4 v8, 0x1

    .line 234
    .local v8, "empty":Z
    const/4 v11, 0x0

    .restart local v11    # "i":I
    :goto_6
    move/from16 v0, v19

    if-ge v11, v0, :cond_d

    .line 235
    aget v24, v13, v11

    aget-object v25, v15, v11

    invoke-interface/range {v25 .. v25}, Ljava/util/List;->size()I

    move-result v25

    move/from16 v0, v24

    move/from16 v1, v25

    if-eq v0, v1, :cond_e

    .line 236
    const/4 v8, 0x0

    .line 241
    :cond_d
    if-eqz v8, :cond_f

    .line 242
    const/16 v24, 0x0

    move-object/from16 v0, v24

    invoke-static {v15, v0}, Ljava/util/Arrays;->fill([Ljava/lang/Object;Ljava/lang/Object;)V

    .line 243
    invoke-interface {v4}, Lorg/reactivestreams/Subscriber;->onComplete()V

    goto/16 :goto_0

    .line 234
    :cond_e
    add-int/lit8 v11, v11, 0x1

    goto :goto_6

    .line 248
    .end local v8    # "empty":Z
    .end local v9    # "ex":Ljava/lang/Throwable;
    .end local v11    # "i":I
    :cond_f
    const-wide/16 v24, 0x0

    cmp-long v24, v6, v24

    if-eqz v24, :cond_10

    const-wide v24, 0x7fffffffffffffffL

    cmp-long v24, v20, v24

    if-eqz v24, :cond_10

    .line 249
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/parallel/ParallelSortedJoin$SortedJoinSubscription;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    move-object/from16 v24, v0

    neg-long v0, v6

    move-wide/from16 v26, v0

    move-object/from16 v0, v24

    move-wide/from16 v1, v26

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicLong;->addAndGet(J)J

    .line 252
    :cond_10
    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/parallel/ParallelSortedJoin$SortedJoinSubscription;->get()I

    move-result v23

    .line 253
    .local v23, "w":I
    move/from16 v0, v23

    move/from16 v1, v18

    if-ne v0, v1, :cond_11

    .line 254
    move/from16 v0, v18

    neg-int v0, v0

    move/from16 v24, v0

    move-object/from16 v0, p0

    move/from16 v1, v24

    invoke-virtual {v0, v1}, Lio/reactivex/internal/operators/parallel/ParallelSortedJoin$SortedJoinSubscription;->addAndGet(I)I

    move-result v18

    .line 255
    if-nez v18, :cond_1

    goto/16 :goto_0

    .line 259
    :cond_11
    move/from16 v18, v23

    goto/16 :goto_1
.end method

.method innerError(Ljava/lang/Throwable;)V
    .locals 2
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 130
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelSortedJoin$SortedJoinSubscription;, "Lio/reactivex/internal/operators/parallel/ParallelSortedJoin$SortedJoinSubscription<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/parallel/ParallelSortedJoin$SortedJoinSubscription;->error:Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v1, 0x0

    invoke-virtual {v0, v1, p1}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 131
    invoke-virtual {p0}, Lio/reactivex/internal/operators/parallel/ParallelSortedJoin$SortedJoinSubscription;->drain()V

    .line 137
    :cond_0
    :goto_0
    return-void

    .line 133
    :cond_1
    iget-object v0, p0, Lio/reactivex/internal/operators/parallel/ParallelSortedJoin$SortedJoinSubscription;->error:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-eq p1, v0, :cond_0

    .line 134
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method innerNext(Ljava/util/List;I)V
    .locals 1
    .param p2, "index"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<TT;>;I)V"
        }
    .end annotation

    .prologue
    .line 123
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelSortedJoin$SortedJoinSubscription;, "Lio/reactivex/internal/operators/parallel/ParallelSortedJoin$SortedJoinSubscription<TT;>;"
    .local p1, "value":Ljava/util/List;, "Ljava/util/List<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/parallel/ParallelSortedJoin$SortedJoinSubscription;->lists:[Ljava/util/List;

    aput-object p1, v0, p2

    .line 124
    iget-object v0, p0, Lio/reactivex/internal/operators/parallel/ParallelSortedJoin$SortedJoinSubscription;->remaining:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    move-result v0

    if-nez v0, :cond_0

    .line 125
    invoke-virtual {p0}, Lio/reactivex/internal/operators/parallel/ParallelSortedJoin$SortedJoinSubscription;->drain()V

    .line 127
    :cond_0
    return-void
.end method

.method public request(J)V
    .locals 1
    .param p1, "n"    # J

    .prologue
    .line 97
    .local p0, "this":Lio/reactivex/internal/operators/parallel/ParallelSortedJoin$SortedJoinSubscription;, "Lio/reactivex/internal/operators/parallel/ParallelSortedJoin$SortedJoinSubscription<TT;>;"
    invoke-static {p1, p2}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->validate(J)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 98
    iget-object v0, p0, Lio/reactivex/internal/operators/parallel/ParallelSortedJoin$SortedJoinSubscription;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-static {v0, p1, p2}, Lio/reactivex/internal/util/BackpressureHelper;->add(Ljava/util/concurrent/atomic/AtomicLong;J)J

    .line 99
    iget-object v0, p0, Lio/reactivex/internal/operators/parallel/ParallelSortedJoin$SortedJoinSubscription;->remaining:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    if-nez v0, :cond_0

    .line 100
    invoke-virtual {p0}, Lio/reactivex/internal/operators/parallel/ParallelSortedJoin$SortedJoinSubscription;->drain()V

    .line 103
    :cond_0
    return-void
.end method
