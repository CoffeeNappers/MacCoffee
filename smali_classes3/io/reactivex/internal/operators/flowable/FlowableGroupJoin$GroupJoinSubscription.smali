.class final Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription;
.super Ljava/util/concurrent/atomic/AtomicInteger;
.source "FlowableGroupJoin.java"

# interfaces
.implements Lorg/reactivestreams/Subscription;
.implements Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$JoinSupport;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/flowable/FlowableGroupJoin;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "GroupJoinSubscription"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T",
        "Left:Ljava/lang/Object;",
        "TRight:",
        "Ljava/lang/Object;",
        "T",
        "LeftEnd:Ljava/lang/Object;",
        "TRightEnd:",
        "Ljava/lang/Object;",
        "R:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/concurrent/atomic/AtomicInteger;",
        "Lorg/reactivestreams/Subscription;",
        "Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$JoinSupport;"
    }
.end annotation


# static fields
.field static final LEFT_CLOSE:Ljava/lang/Integer;

.field static final LEFT_VALUE:Ljava/lang/Integer;

.field static final RIGHT_CLOSE:Ljava/lang/Integer;

.field static final RIGHT_VALUE:Ljava/lang/Integer;

.field private static final serialVersionUID:J = -0x54414b546f40e739L


# instance fields
.field final active:Ljava/util/concurrent/atomic/AtomicInteger;

.field final actual:Lorg/reactivestreams/Subscriber;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/reactivestreams/Subscriber",
            "<-TR;>;"
        }
    .end annotation
.end field

.field volatile cancelled:Z

.field final disposables:Lio/reactivex/disposables/CompositeDisposable;

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

.field final leftEnd:Lio/reactivex/functions/Function;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Function",
            "<-TT",
            "Left;",
            "+",
            "Lorg/reactivestreams/Publisher",
            "<TT",
            "LeftEnd;",
            ">;>;"
        }
    .end annotation
.end field

.field leftIndex:I

.field final lefts:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Integer;",
            "Lio/reactivex/processors/UnicastProcessor",
            "<TTRight;>;>;"
        }
    .end annotation
.end field

.field final queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/internal/queue/SpscLinkedArrayQueue",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field final requested:Ljava/util/concurrent/atomic/AtomicLong;

.field final resultSelector:Lio/reactivex/functions/BiFunction;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/BiFunction",
            "<-TT",
            "Left;",
            "-",
            "Lio/reactivex/Flowable",
            "<TTRight;>;+TR;>;"
        }
    .end annotation
.end field

.field final rightEnd:Lio/reactivex/functions/Function;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Function",
            "<-TTRight;+",
            "Lorg/reactivestreams/Publisher",
            "<TTRightEnd;>;>;"
        }
    .end annotation
.end field

.field rightIndex:I

.field final rights:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Integer;",
            "TTRight;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 123
    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    sput-object v0, Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription;->LEFT_VALUE:Ljava/lang/Integer;

    .line 125
    const/4 v0, 0x2

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    sput-object v0, Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription;->RIGHT_VALUE:Ljava/lang/Integer;

    .line 127
    const/4 v0, 0x3

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    sput-object v0, Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription;->LEFT_CLOSE:Ljava/lang/Integer;

    .line 129
    const/4 v0, 0x4

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    sput-object v0, Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription;->RIGHT_CLOSE:Ljava/lang/Integer;

    return-void
.end method

.method constructor <init>(Lorg/reactivestreams/Subscriber;Lio/reactivex/functions/Function;Lio/reactivex/functions/Function;Lio/reactivex/functions/BiFunction;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber",
            "<-TR;>;",
            "Lio/reactivex/functions/Function",
            "<-TT",
            "Left;",
            "+",
            "Lorg/reactivestreams/Publisher",
            "<TT",
            "LeftEnd;",
            ">;>;",
            "Lio/reactivex/functions/Function",
            "<-TTRight;+",
            "Lorg/reactivestreams/Publisher",
            "<TTRightEnd;>;>;",
            "Lio/reactivex/functions/BiFunction",
            "<-TT",
            "Left;",
            "-",
            "Lio/reactivex/Flowable",
            "<TTRight;>;+TR;>;)V"
        }
    .end annotation

    .prologue
    .line 133
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription;, "Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription<TTLeft;TTRight;TTLeftEnd;TTRightEnd;TR;>;"
    .local p1, "actual":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TR;>;"
    .local p2, "leftEnd":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TTLeft;+Lorg/reactivestreams/Publisher<TTLeftEnd;>;>;"
    .local p3, "rightEnd":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TTRight;+Lorg/reactivestreams/Publisher<TTRightEnd;>;>;"
    .local p4, "resultSelector":Lio/reactivex/functions/BiFunction;, "Lio/reactivex/functions/BiFunction<-TTLeft;-Lio/reactivex/Flowable<TTRight;>;+TR;>;"
    invoke-direct {p0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    .line 134
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription;->actual:Lorg/reactivestreams/Subscriber;

    .line 135
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    .line 136
    new-instance v0, Lio/reactivex/disposables/CompositeDisposable;

    invoke-direct {v0}, Lio/reactivex/disposables/CompositeDisposable;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription;->disposables:Lio/reactivex/disposables/CompositeDisposable;

    .line 137
    new-instance v0, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    invoke-static {}, Lio/reactivex/Flowable;->bufferSize()I

    move-result v1

    invoke-direct {v0, v1}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;-><init>(I)V

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription;->queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    .line 138
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription;->lefts:Ljava/util/Map;

    .line 139
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription;->rights:Ljava/util/Map;

    .line 140
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription;->error:Ljava/util/concurrent/atomic/AtomicReference;

    .line 141
    iput-object p2, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription;->leftEnd:Lio/reactivex/functions/Function;

    .line 142
    iput-object p3, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription;->rightEnd:Lio/reactivex/functions/Function;

    .line 143
    iput-object p4, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription;->resultSelector:Lio/reactivex/functions/BiFunction;

    .line 144
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription;->active:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 145
    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 1

    .prologue
    .line 156
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription;, "Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription<TTLeft;TTRight;TTLeftEnd;TTRightEnd;TR;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription;->cancelled:Z

    if-eqz v0, :cond_1

    .line 164
    :cond_0
    :goto_0
    return-void

    .line 159
    :cond_1
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription;->cancelled:Z

    .line 160
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription;->cancelAll()V

    .line 161
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription;->getAndIncrement()I

    move-result v0

    if-nez v0, :cond_0

    .line 162
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription;->queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    invoke-virtual {v0}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->clear()V

    goto :goto_0
.end method

.method cancelAll()V
    .locals 1

    .prologue
    .line 167
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription;, "Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription<TTLeft;TTRight;TTLeftEnd;TTRightEnd;TR;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription;->disposables:Lio/reactivex/disposables/CompositeDisposable;

    invoke-virtual {v0}, Lio/reactivex/disposables/CompositeDisposable;->dispose()V

    .line 168
    return-void
.end method

.method drain()V
    .locals 28

    .prologue
    .line 192
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription;, "Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription<TTLeft;TTRight;TTLeftEnd;TTRightEnd;TR;>;"
    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription;->getAndIncrement()I

    move-result v23

    if-eqz v23, :cond_0

    .line 348
    :goto_0
    return-void

    .line 196
    :cond_0
    const/4 v13, 0x1

    .line 197
    .local v13, "missed":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription;->queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    move-object/from16 v17, v0

    .line 198
    .local v17, "q":Lio/reactivex/internal/queue/SpscLinkedArrayQueue;, "Lio/reactivex/internal/queue/SpscLinkedArrayQueue<Ljava/lang/Object;>;"
    move-object/from16 v0, p0

    iget-object v4, v0, Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription;->actual:Lorg/reactivestreams/Subscriber;

    .line 202
    .local v4, "a":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TR;>;"
    :cond_1
    :goto_1
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription;->cancelled:Z

    move/from16 v23, v0

    if-eqz v23, :cond_2

    .line 203
    invoke-virtual/range {v17 .. v17}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->clear()V

    goto :goto_0

    .line 207
    :cond_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription;->error:Ljava/util/concurrent/atomic/AtomicReference;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Throwable;

    .line 208
    .local v8, "ex":Ljava/lang/Throwable;
    if-eqz v8, :cond_3

    .line 209
    invoke-virtual/range {v17 .. v17}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->clear()V

    .line 210
    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription;->cancelAll()V

    .line 211
    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription;->errorAll(Lorg/reactivestreams/Subscriber;)V

    goto :goto_0

    .line 215
    :cond_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription;->active:Ljava/util/concurrent/atomic/AtomicInteger;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v23

    if-nez v23, :cond_4

    const/4 v5, 0x1

    .line 217
    .local v5, "d":Z
    :goto_2
    invoke-virtual/range {v17 .. v17}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->poll()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/lang/Integer;

    .line 219
    .local v14, "mode":Ljava/lang/Integer;
    if-nez v14, :cond_5

    const/4 v6, 0x1

    .line 221
    .local v6, "empty":Z
    :goto_3
    if-eqz v5, :cond_7

    if-eqz v6, :cond_7

    .line 222
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription;->lefts:Ljava/util/Map;

    move-object/from16 v23, v0

    invoke-interface/range {v23 .. v23}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v23

    invoke-interface/range {v23 .. v23}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v10

    .local v10, "i$":Ljava/util/Iterator;
    :goto_4
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v23

    if-eqz v23, :cond_6

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Lio/reactivex/processors/UnicastProcessor;

    .line 223
    .local v19, "up":Lio/reactivex/processors/UnicastProcessor;, "Lio/reactivex/processors/UnicastProcessor<*>;"
    invoke-virtual/range {v19 .. v19}, Lio/reactivex/processors/UnicastProcessor;->onComplete()V

    goto :goto_4

    .line 215
    .end local v5    # "d":Z
    .end local v6    # "empty":Z
    .end local v10    # "i$":Ljava/util/Iterator;
    .end local v14    # "mode":Ljava/lang/Integer;
    .end local v19    # "up":Lio/reactivex/processors/UnicastProcessor;, "Lio/reactivex/processors/UnicastProcessor<*>;"
    :cond_4
    const/4 v5, 0x0

    goto :goto_2

    .line 219
    .restart local v5    # "d":Z
    .restart local v14    # "mode":Ljava/lang/Integer;
    :cond_5
    const/4 v6, 0x0

    goto :goto_3

    .line 226
    .restart local v6    # "empty":Z
    .restart local v10    # "i$":Ljava/util/Iterator;
    :cond_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription;->lefts:Ljava/util/Map;

    move-object/from16 v23, v0

    invoke-interface/range {v23 .. v23}, Ljava/util/Map;->clear()V

    .line 227
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription;->rights:Ljava/util/Map;

    move-object/from16 v23, v0

    invoke-interface/range {v23 .. v23}, Ljava/util/Map;->clear()V

    .line 228
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription;->disposables:Lio/reactivex/disposables/CompositeDisposable;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Lio/reactivex/disposables/CompositeDisposable;->dispose()V

    .line 230
    invoke-interface {v4}, Lorg/reactivestreams/Subscriber;->onComplete()V

    goto/16 :goto_0

    .line 234
    .end local v10    # "i$":Ljava/util/Iterator;
    :cond_7
    if-eqz v6, :cond_8

    .line 343
    neg-int v0, v13

    move/from16 v23, v0

    move-object/from16 v0, p0

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription;->addAndGet(I)I

    move-result v13

    .line 344
    if-nez v13, :cond_1

    goto/16 :goto_0

    .line 238
    :cond_8
    invoke-virtual/range {v17 .. v17}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->poll()Ljava/lang/Object;

    move-result-object v21

    .line 240
    .local v21, "val":Ljava/lang/Object;
    sget-object v23, Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription;->LEFT_VALUE:Ljava/lang/Integer;

    move-object/from16 v0, v23

    if-ne v14, v0, :cond_b

    .line 242
    move-object/from16 v12, v21

    .line 244
    .local v12, "left":Ljava/lang/Object;, "TTLeft;"
    invoke-static {}, Lio/reactivex/processors/UnicastProcessor;->create()Lio/reactivex/processors/UnicastProcessor;

    move-result-object v20

    .line 245
    .local v20, "up":Lio/reactivex/processors/UnicastProcessor;, "Lio/reactivex/processors/UnicastProcessor<TTRight;>;"
    move-object/from16 v0, p0

    iget v11, v0, Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription;->leftIndex:I

    add-int/lit8 v23, v11, 0x1

    move/from16 v0, v23

    move-object/from16 v1, p0

    iput v0, v1, Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription;->leftIndex:I

    .line 246
    .local v11, "idx":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription;->lefts:Ljava/util/Map;

    move-object/from16 v23, v0

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v24

    move-object/from16 v0, v23

    move-object/from16 v1, v24

    move-object/from16 v2, v20

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 251
    :try_start_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription;->leftEnd:Lio/reactivex/functions/Function;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    invoke-interface {v0, v12}, Lio/reactivex/functions/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v23

    const-string/jumbo v24, "The leftEnd returned a null Publisher"

    invoke-static/range {v23 .. v24}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lorg/reactivestreams/Publisher;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 257
    .local v15, "p":Lorg/reactivestreams/Publisher;, "Lorg/reactivestreams/Publisher<TTLeftEnd;>;"
    new-instance v7, Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$LeftRightEndSubscriber;

    const/16 v23, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v23

    invoke-direct {v7, v0, v1, v11}, Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$LeftRightEndSubscriber;-><init>(Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$JoinSupport;ZI)V

    .line 258
    .local v7, "end":Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$LeftRightEndSubscriber;
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription;->disposables:Lio/reactivex/disposables/CompositeDisposable;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    invoke-virtual {v0, v7}, Lio/reactivex/disposables/CompositeDisposable;->add(Lio/reactivex/disposables/Disposable;)Z

    .line 260
    invoke-interface {v15, v7}, Lorg/reactivestreams/Publisher;->subscribe(Lorg/reactivestreams/Subscriber;)V

    .line 262
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription;->error:Ljava/util/concurrent/atomic/AtomicReference;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v8

    .end local v8    # "ex":Ljava/lang/Throwable;
    check-cast v8, Ljava/lang/Throwable;

    .line 263
    .restart local v8    # "ex":Ljava/lang/Throwable;
    if-eqz v8, :cond_9

    .line 264
    invoke-virtual/range {v17 .. v17}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->clear()V

    .line 265
    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription;->cancelAll()V

    .line 266
    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription;->errorAll(Lorg/reactivestreams/Subscriber;)V

    goto/16 :goto_0

    .line 252
    .end local v7    # "end":Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$LeftRightEndSubscriber;
    .end local v15    # "p":Lorg/reactivestreams/Publisher;, "Lorg/reactivestreams/Publisher<TTLeftEnd;>;"
    :catch_0
    move-exception v9

    .line 253
    .local v9, "exc":Ljava/lang/Throwable;
    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v9, v4, v1}, Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription;->fail(Ljava/lang/Throwable;Lorg/reactivestreams/Subscriber;Lio/reactivex/internal/fuseable/SimpleQueue;)V

    goto/16 :goto_0

    .line 273
    .end local v9    # "exc":Ljava/lang/Throwable;
    .restart local v7    # "end":Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$LeftRightEndSubscriber;
    .restart local v15    # "p":Lorg/reactivestreams/Publisher;, "Lorg/reactivestreams/Publisher<TTLeftEnd;>;"
    :cond_9
    :try_start_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription;->resultSelector:Lio/reactivex/functions/BiFunction;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    move-object/from16 v1, v20

    invoke-interface {v0, v12, v1}, Lio/reactivex/functions/BiFunction;->apply(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v23

    const-string/jumbo v24, "The resultSelector returned a null value"

    invoke-static/range {v23 .. v24}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v22

    .line 280
    .local v22, "w":Ljava/lang/Object;, "TR;"
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v24

    const-wide/16 v26, 0x0

    cmp-long v23, v24, v26

    if-eqz v23, :cond_a

    .line 281
    move-object/from16 v0, v22

    invoke-interface {v4, v0}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 282
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    move-object/from16 v23, v0

    const-wide/16 v24, 0x1

    invoke-static/range {v23 .. v25}, Lio/reactivex/internal/util/BackpressureHelper;->produced(Ljava/util/concurrent/atomic/AtomicLong;J)J

    .line 288
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription;->rights:Ljava/util/Map;

    move-object/from16 v23, v0

    invoke-interface/range {v23 .. v23}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v23

    invoke-interface/range {v23 .. v23}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v10

    .restart local v10    # "i$":Ljava/util/Iterator;
    :goto_5
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v23

    if-eqz v23, :cond_1

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v18

    .line 289
    .local v18, "right":Ljava/lang/Object;, "TTRight;"
    move-object/from16 v0, v20

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lio/reactivex/processors/UnicastProcessor;->onNext(Ljava/lang/Object;)V

    goto :goto_5

    .line 274
    .end local v10    # "i$":Ljava/util/Iterator;
    .end local v18    # "right":Ljava/lang/Object;, "TTRight;"
    .end local v22    # "w":Ljava/lang/Object;, "TR;"
    :catch_1
    move-exception v9

    .line 275
    .restart local v9    # "exc":Ljava/lang/Throwable;
    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v9, v4, v1}, Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription;->fail(Ljava/lang/Throwable;Lorg/reactivestreams/Subscriber;Lio/reactivex/internal/fuseable/SimpleQueue;)V

    goto/16 :goto_0

    .line 284
    .end local v9    # "exc":Ljava/lang/Throwable;
    .restart local v22    # "w":Ljava/lang/Object;, "TR;"
    :cond_a
    new-instance v23, Lio/reactivex/exceptions/MissingBackpressureException;

    const-string/jumbo v24, "Could not emit value due to lack of requests"

    invoke-direct/range {v23 .. v24}, Lio/reactivex/exceptions/MissingBackpressureException;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p0

    move-object/from16 v1, v23

    move-object/from16 v2, v17

    invoke-virtual {v0, v1, v4, v2}, Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription;->fail(Ljava/lang/Throwable;Lorg/reactivestreams/Subscriber;Lio/reactivex/internal/fuseable/SimpleQueue;)V

    goto/16 :goto_0

    .line 292
    .end local v7    # "end":Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$LeftRightEndSubscriber;
    .end local v11    # "idx":I
    .end local v12    # "left":Ljava/lang/Object;, "TTLeft;"
    .end local v15    # "p":Lorg/reactivestreams/Publisher;, "Lorg/reactivestreams/Publisher<TTLeftEnd;>;"
    .end local v20    # "up":Lio/reactivex/processors/UnicastProcessor;, "Lio/reactivex/processors/UnicastProcessor<TTRight;>;"
    .end local v22    # "w":Ljava/lang/Object;, "TR;"
    :cond_b
    sget-object v23, Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription;->RIGHT_VALUE:Ljava/lang/Integer;

    move-object/from16 v0, v23

    if-ne v14, v0, :cond_d

    .line 294
    move-object/from16 v18, v21

    .line 296
    .restart local v18    # "right":Ljava/lang/Object;, "TTRight;"
    move-object/from16 v0, p0

    iget v11, v0, Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription;->rightIndex:I

    add-int/lit8 v23, v11, 0x1

    move/from16 v0, v23

    move-object/from16 v1, p0

    iput v0, v1, Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription;->rightIndex:I

    .line 298
    .restart local v11    # "idx":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription;->rights:Ljava/util/Map;

    move-object/from16 v23, v0

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v24

    move-object/from16 v0, v23

    move-object/from16 v1, v24

    move-object/from16 v2, v18

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 303
    :try_start_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription;->rightEnd:Lio/reactivex/functions/Function;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    move-object/from16 v1, v18

    invoke-interface {v0, v1}, Lio/reactivex/functions/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v23

    const-string/jumbo v24, "The rightEnd returned a null Publisher"

    invoke-static/range {v23 .. v24}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Lorg/reactivestreams/Publisher;
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_2

    .line 309
    .local v16, "p":Lorg/reactivestreams/Publisher;, "Lorg/reactivestreams/Publisher<TTRightEnd;>;"
    new-instance v7, Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$LeftRightEndSubscriber;

    const/16 v23, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v23

    invoke-direct {v7, v0, v1, v11}, Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$LeftRightEndSubscriber;-><init>(Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$JoinSupport;ZI)V

    .line 310
    .restart local v7    # "end":Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$LeftRightEndSubscriber;
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription;->disposables:Lio/reactivex/disposables/CompositeDisposable;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    invoke-virtual {v0, v7}, Lio/reactivex/disposables/CompositeDisposable;->add(Lio/reactivex/disposables/Disposable;)Z

    .line 312
    move-object/from16 v0, v16

    invoke-interface {v0, v7}, Lorg/reactivestreams/Publisher;->subscribe(Lorg/reactivestreams/Subscriber;)V

    .line 314
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription;->error:Ljava/util/concurrent/atomic/AtomicReference;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v8

    .end local v8    # "ex":Ljava/lang/Throwable;
    check-cast v8, Ljava/lang/Throwable;

    .line 315
    .restart local v8    # "ex":Ljava/lang/Throwable;
    if-eqz v8, :cond_c

    .line 316
    invoke-virtual/range {v17 .. v17}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->clear()V

    .line 317
    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription;->cancelAll()V

    .line 318
    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription;->errorAll(Lorg/reactivestreams/Subscriber;)V

    goto/16 :goto_0

    .line 304
    .end local v7    # "end":Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$LeftRightEndSubscriber;
    .end local v16    # "p":Lorg/reactivestreams/Publisher;, "Lorg/reactivestreams/Publisher<TTRightEnd;>;"
    :catch_2
    move-exception v9

    .line 305
    .restart local v9    # "exc":Ljava/lang/Throwable;
    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v9, v4, v1}, Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription;->fail(Ljava/lang/Throwable;Lorg/reactivestreams/Subscriber;Lio/reactivex/internal/fuseable/SimpleQueue;)V

    goto/16 :goto_0

    .line 322
    .end local v9    # "exc":Ljava/lang/Throwable;
    .restart local v7    # "end":Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$LeftRightEndSubscriber;
    .restart local v16    # "p":Lorg/reactivestreams/Publisher;, "Lorg/reactivestreams/Publisher<TTRightEnd;>;"
    :cond_c
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription;->lefts:Ljava/util/Map;

    move-object/from16 v23, v0

    invoke-interface/range {v23 .. v23}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v23

    invoke-interface/range {v23 .. v23}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v10

    .restart local v10    # "i$":Ljava/util/Iterator;
    :goto_6
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v23

    if-eqz v23, :cond_1

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Lio/reactivex/processors/UnicastProcessor;

    .line 323
    .restart local v20    # "up":Lio/reactivex/processors/UnicastProcessor;, "Lio/reactivex/processors/UnicastProcessor<TTRight;>;"
    move-object/from16 v0, v20

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lio/reactivex/processors/UnicastProcessor;->onNext(Ljava/lang/Object;)V

    goto :goto_6

    .line 326
    .end local v7    # "end":Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$LeftRightEndSubscriber;
    .end local v10    # "i$":Ljava/util/Iterator;
    .end local v11    # "idx":I
    .end local v16    # "p":Lorg/reactivestreams/Publisher;, "Lorg/reactivestreams/Publisher<TTRightEnd;>;"
    .end local v18    # "right":Ljava/lang/Object;, "TTRight;"
    .end local v20    # "up":Lio/reactivex/processors/UnicastProcessor;, "Lio/reactivex/processors/UnicastProcessor<TTRight;>;"
    :cond_d
    sget-object v23, Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription;->LEFT_CLOSE:Ljava/lang/Integer;

    move-object/from16 v0, v23

    if-ne v14, v0, :cond_e

    move-object/from16 v7, v21

    .line 327
    check-cast v7, Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$LeftRightEndSubscriber;

    .line 329
    .restart local v7    # "end":Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$LeftRightEndSubscriber;
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription;->lefts:Ljava/util/Map;

    move-object/from16 v23, v0

    iget v0, v7, Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$LeftRightEndSubscriber;->index:I

    move/from16 v24, v0

    invoke-static/range {v24 .. v24}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v24

    invoke-interface/range {v23 .. v24}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Lio/reactivex/processors/UnicastProcessor;

    .line 330
    .restart local v20    # "up":Lio/reactivex/processors/UnicastProcessor;, "Lio/reactivex/processors/UnicastProcessor<TTRight;>;"
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription;->disposables:Lio/reactivex/disposables/CompositeDisposable;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    invoke-virtual {v0, v7}, Lio/reactivex/disposables/CompositeDisposable;->remove(Lio/reactivex/disposables/Disposable;)Z

    .line 331
    if-eqz v20, :cond_1

    .line 332
    invoke-virtual/range {v20 .. v20}, Lio/reactivex/processors/UnicastProcessor;->onComplete()V

    goto/16 :goto_1

    .line 335
    .end local v7    # "end":Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$LeftRightEndSubscriber;
    .end local v20    # "up":Lio/reactivex/processors/UnicastProcessor;, "Lio/reactivex/processors/UnicastProcessor<TTRight;>;"
    :cond_e
    sget-object v23, Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription;->RIGHT_CLOSE:Ljava/lang/Integer;

    move-object/from16 v0, v23

    if-ne v14, v0, :cond_1

    move-object/from16 v7, v21

    .line 336
    check-cast v7, Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$LeftRightEndSubscriber;

    .line 338
    .restart local v7    # "end":Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$LeftRightEndSubscriber;
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription;->rights:Ljava/util/Map;

    move-object/from16 v23, v0

    iget v0, v7, Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$LeftRightEndSubscriber;->index:I

    move/from16 v24, v0

    invoke-static/range {v24 .. v24}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v24

    invoke-interface/range {v23 .. v24}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 339
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription;->disposables:Lio/reactivex/disposables/CompositeDisposable;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    invoke-virtual {v0, v7}, Lio/reactivex/disposables/CompositeDisposable;->remove(Lio/reactivex/disposables/Disposable;)Z

    goto/16 :goto_1
.end method

.method errorAll(Lorg/reactivestreams/Subscriber;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 171
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription;, "Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription<TTLeft;TTRight;TTLeftEnd;TTRightEnd;TR;>;"
    .local p1, "a":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<*>;"
    iget-object v3, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription;->error:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-static {v3}, Lio/reactivex/internal/util/ExceptionHelper;->terminate(Ljava/util/concurrent/atomic/AtomicReference;)Ljava/lang/Throwable;

    move-result-object v0

    .line 173
    .local v0, "ex":Ljava/lang/Throwable;
    iget-object v3, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription;->lefts:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lio/reactivex/processors/UnicastProcessor;

    .line 174
    .local v2, "up":Lio/reactivex/processors/UnicastProcessor;, "Lio/reactivex/processors/UnicastProcessor<TTRight;>;"
    invoke-virtual {v2, v0}, Lio/reactivex/processors/UnicastProcessor;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 177
    .end local v2    # "up":Lio/reactivex/processors/UnicastProcessor;, "Lio/reactivex/processors/UnicastProcessor<TTRight;>;"
    :cond_0
    iget-object v3, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription;->lefts:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->clear()V

    .line 178
    iget-object v3, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription;->rights:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->clear()V

    .line 180
    invoke-interface {p1, v0}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    .line 181
    return-void
.end method

.method fail(Ljava/lang/Throwable;Lorg/reactivestreams/Subscriber;Lio/reactivex/internal/fuseable/SimpleQueue;)V
    .locals 1
    .param p1, "exc"    # Ljava/lang/Throwable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Throwable;",
            "Lorg/reactivestreams/Subscriber",
            "<*>;",
            "Lio/reactivex/internal/fuseable/SimpleQueue",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 184
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription;, "Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription<TTLeft;TTRight;TTLeftEnd;TTRightEnd;TR;>;"
    .local p2, "a":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<*>;"
    .local p3, "q":Lio/reactivex/internal/fuseable/SimpleQueue;, "Lio/reactivex/internal/fuseable/SimpleQueue<*>;"
    invoke-static {p1}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 185
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription;->error:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-static {v0, p1}, Lio/reactivex/internal/util/ExceptionHelper;->addThrowable(Ljava/util/concurrent/atomic/AtomicReference;Ljava/lang/Throwable;)Z

    .line 186
    invoke-interface {p3}, Lio/reactivex/internal/fuseable/SimpleQueue;->clear()V

    .line 187
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription;->cancelAll()V

    .line 188
    invoke-virtual {p0, p2}, Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription;->errorAll(Lorg/reactivestreams/Subscriber;)V

    .line 189
    return-void
.end method

.method public innerClose(ZLio/reactivex/internal/operators/flowable/FlowableGroupJoin$LeftRightEndSubscriber;)V
    .locals 2
    .param p1, "isLeft"    # Z
    .param p2, "index"    # Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$LeftRightEndSubscriber;

    .prologue
    .line 377
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription;, "Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription<TTLeft;TTRight;TTLeftEnd;TTRightEnd;TR;>;"
    monitor-enter p0

    .line 378
    :try_start_0
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription;->queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    if-eqz p1, :cond_0

    sget-object v0, Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription;->LEFT_CLOSE:Ljava/lang/Integer;

    :goto_0
    invoke-virtual {v1, v0, p2}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->offer(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 379
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 380
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription;->drain()V

    .line 381
    return-void

    .line 378
    :cond_0
    :try_start_1
    sget-object v0, Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription;->RIGHT_CLOSE:Ljava/lang/Integer;

    goto :goto_0

    .line 379
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public innerCloseError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "ex"    # Ljava/lang/Throwable;

    .prologue
    .line 385
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription;, "Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription<TTLeft;TTRight;TTLeftEnd;TTRightEnd;TR;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription;->error:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-static {v0, p1}, Lio/reactivex/internal/util/ExceptionHelper;->addThrowable(Ljava/util/concurrent/atomic/AtomicReference;Ljava/lang/Throwable;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 386
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription;->drain()V

    .line 390
    :goto_0
    return-void

    .line 388
    :cond_0
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public innerComplete(Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$LeftRightSubscriber;)V
    .locals 1
    .param p1, "sender"    # Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$LeftRightSubscriber;

    .prologue
    .line 362
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription;, "Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription<TTLeft;TTRight;TTLeftEnd;TTRightEnd;TR;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription;->disposables:Lio/reactivex/disposables/CompositeDisposable;

    invoke-virtual {v0, p1}, Lio/reactivex/disposables/CompositeDisposable;->delete(Lio/reactivex/disposables/Disposable;)Z

    .line 363
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription;->active:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 364
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription;->drain()V

    .line 365
    return-void
.end method

.method public innerError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "ex"    # Ljava/lang/Throwable;

    .prologue
    .line 352
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription;, "Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription<TTLeft;TTRight;TTLeftEnd;TTRightEnd;TR;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription;->error:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-static {v0, p1}, Lio/reactivex/internal/util/ExceptionHelper;->addThrowable(Ljava/util/concurrent/atomic/AtomicReference;Ljava/lang/Throwable;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 353
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription;->active:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 354
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription;->drain()V

    .line 358
    :goto_0
    return-void

    .line 356
    :cond_0
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public innerValue(ZLjava/lang/Object;)V
    .locals 2
    .param p1, "isLeft"    # Z
    .param p2, "o"    # Ljava/lang/Object;

    .prologue
    .line 369
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription;, "Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription<TTLeft;TTRight;TTLeftEnd;TTRightEnd;TR;>;"
    monitor-enter p0

    .line 370
    :try_start_0
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription;->queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    if-eqz p1, :cond_0

    sget-object v0, Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription;->LEFT_VALUE:Ljava/lang/Integer;

    :goto_0
    invoke-virtual {v1, v0, p2}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->offer(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 371
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 372
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription;->drain()V

    .line 373
    return-void

    .line 370
    :cond_0
    :try_start_1
    sget-object v0, Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription;->RIGHT_VALUE:Ljava/lang/Integer;

    goto :goto_0

    .line 371
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public request(J)V
    .locals 1
    .param p1, "n"    # J

    .prologue
    .line 149
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription;, "Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription<TTLeft;TTRight;TTLeftEnd;TTRightEnd;TR;>;"
    invoke-static {p1, p2}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->validate(J)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 150
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$GroupJoinSubscription;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-static {v0, p1, p2}, Lio/reactivex/internal/util/BackpressureHelper;->add(Ljava/util/concurrent/atomic/AtomicLong;J)J

    .line 152
    :cond_0
    return-void
.end method
