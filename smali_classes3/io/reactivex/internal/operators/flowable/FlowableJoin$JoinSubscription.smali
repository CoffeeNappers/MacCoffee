.class final Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;
.super Ljava/util/concurrent/atomic/AtomicInteger;
.source "FlowableJoin.java"

# interfaces
.implements Lorg/reactivestreams/Subscription;
.implements Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$JoinSupport;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/flowable/FlowableJoin;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "JoinSubscription"
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
            "TT",
            "Left;",
            ">;"
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
            "-TTRight;+TR;>;"
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
    .line 107
    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    sput-object v0, Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;->LEFT_VALUE:Ljava/lang/Integer;

    .line 109
    const/4 v0, 0x2

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    sput-object v0, Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;->RIGHT_VALUE:Ljava/lang/Integer;

    .line 111
    const/4 v0, 0x3

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    sput-object v0, Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;->LEFT_CLOSE:Ljava/lang/Integer;

    .line 113
    const/4 v0, 0x4

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    sput-object v0, Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;->RIGHT_CLOSE:Ljava/lang/Integer;

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
            "-TTRight;+TR;>;)V"
        }
    .end annotation

    .prologue
    .line 117
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;, "Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription<TTLeft;TTRight;TTLeftEnd;TTRightEnd;TR;>;"
    .local p1, "actual":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TR;>;"
    .local p2, "leftEnd":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TTLeft;+Lorg/reactivestreams/Publisher<TTLeftEnd;>;>;"
    .local p3, "rightEnd":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TTRight;+Lorg/reactivestreams/Publisher<TTRightEnd;>;>;"
    .local p4, "resultSelector":Lio/reactivex/functions/BiFunction;, "Lio/reactivex/functions/BiFunction<-TTLeft;-TTRight;+TR;>;"
    invoke-direct {p0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    .line 118
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;->actual:Lorg/reactivestreams/Subscriber;

    .line 119
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    .line 120
    new-instance v0, Lio/reactivex/disposables/CompositeDisposable;

    invoke-direct {v0}, Lio/reactivex/disposables/CompositeDisposable;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;->disposables:Lio/reactivex/disposables/CompositeDisposable;

    .line 121
    new-instance v0, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    invoke-static {}, Lio/reactivex/Flowable;->bufferSize()I

    move-result v1

    invoke-direct {v0, v1}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;-><init>(I)V

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;->queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    .line 122
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;->lefts:Ljava/util/Map;

    .line 123
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;->rights:Ljava/util/Map;

    .line 124
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;->error:Ljava/util/concurrent/atomic/AtomicReference;

    .line 125
    iput-object p2, p0, Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;->leftEnd:Lio/reactivex/functions/Function;

    .line 126
    iput-object p3, p0, Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;->rightEnd:Lio/reactivex/functions/Function;

    .line 127
    iput-object p4, p0, Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;->resultSelector:Lio/reactivex/functions/BiFunction;

    .line 128
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;->active:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 129
    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 1

    .prologue
    .line 140
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;, "Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription<TTLeft;TTRight;TTLeftEnd;TTRightEnd;TR;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;->cancelled:Z

    if-eqz v0, :cond_1

    .line 148
    :cond_0
    :goto_0
    return-void

    .line 143
    :cond_1
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;->cancelled:Z

    .line 144
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;->cancelAll()V

    .line 145
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;->getAndIncrement()I

    move-result v0

    if-nez v0, :cond_0

    .line 146
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;->queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    invoke-virtual {v0}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->clear()V

    goto :goto_0
.end method

.method cancelAll()V
    .locals 1

    .prologue
    .line 151
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;, "Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription<TTLeft;TTRight;TTLeftEnd;TTRightEnd;TR;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;->disposables:Lio/reactivex/disposables/CompositeDisposable;

    invoke-virtual {v0}, Lio/reactivex/disposables/CompositeDisposable;->dispose()V

    .line 152
    return-void
.end method

.method drain()V
    .locals 28

    .prologue
    .line 172
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;, "Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription<TTLeft;TTRight;TTLeftEnd;TTRightEnd;TR;>;"
    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;->getAndIncrement()I

    move-result v25

    if-eqz v25, :cond_0

    .line 357
    :goto_0
    return-void

    .line 176
    :cond_0
    const/4 v15, 0x1

    .line 177
    .local v15, "missed":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;->queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    move-object/from16 v19, v0

    .line 178
    .local v19, "q":Lio/reactivex/internal/queue/SpscLinkedArrayQueue;, "Lio/reactivex/internal/queue/SpscLinkedArrayQueue<Ljava/lang/Object;>;"
    move-object/from16 v0, p0

    iget-object v4, v0, Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;->actual:Lorg/reactivestreams/Subscriber;

    .line 182
    .local v4, "a":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TR;>;"
    :cond_1
    :goto_1
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;->cancelled:Z

    move/from16 v25, v0

    if-eqz v25, :cond_2

    .line 183
    invoke-virtual/range {v19 .. v19}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->clear()V

    goto :goto_0

    .line 187
    :cond_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;->error:Ljava/util/concurrent/atomic/AtomicReference;

    move-object/from16 v25, v0

    invoke-virtual/range {v25 .. v25}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/Throwable;

    .line 188
    .local v10, "ex":Ljava/lang/Throwable;
    if-eqz v10, :cond_3

    .line 189
    invoke-virtual/range {v19 .. v19}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->clear()V

    .line 190
    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;->cancelAll()V

    .line 191
    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;->errorAll(Lorg/reactivestreams/Subscriber;)V

    goto :goto_0

    .line 195
    :cond_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;->active:Ljava/util/concurrent/atomic/AtomicInteger;

    move-object/from16 v25, v0

    invoke-virtual/range {v25 .. v25}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v25

    if-nez v25, :cond_4

    const/4 v5, 0x1

    .line 197
    .local v5, "d":Z
    :goto_2
    invoke-virtual/range {v19 .. v19}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->poll()Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Ljava/lang/Integer;

    .line 199
    .local v16, "mode":Ljava/lang/Integer;
    if-nez v16, :cond_5

    const/4 v8, 0x1

    .line 201
    .local v8, "empty":Z
    :goto_3
    if-eqz v5, :cond_6

    if-eqz v8, :cond_6

    .line 203
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;->lefts:Ljava/util/Map;

    move-object/from16 v25, v0

    invoke-interface/range {v25 .. v25}, Ljava/util/Map;->clear()V

    .line 204
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;->rights:Ljava/util/Map;

    move-object/from16 v25, v0

    invoke-interface/range {v25 .. v25}, Ljava/util/Map;->clear()V

    .line 205
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;->disposables:Lio/reactivex/disposables/CompositeDisposable;

    move-object/from16 v25, v0

    invoke-virtual/range {v25 .. v25}, Lio/reactivex/disposables/CompositeDisposable;->dispose()V

    .line 207
    invoke-interface {v4}, Lorg/reactivestreams/Subscriber;->onComplete()V

    goto :goto_0

    .line 195
    .end local v5    # "d":Z
    .end local v8    # "empty":Z
    .end local v16    # "mode":Ljava/lang/Integer;
    :cond_4
    const/4 v5, 0x0

    goto :goto_2

    .line 199
    .restart local v5    # "d":Z
    .restart local v16    # "mode":Ljava/lang/Integer;
    :cond_5
    const/4 v8, 0x0

    goto :goto_3

    .line 211
    .restart local v8    # "empty":Z
    :cond_6
    if-eqz v8, :cond_7

    .line 352
    neg-int v0, v15

    move/from16 v25, v0

    move-object/from16 v0, p0

    move/from16 v1, v25

    invoke-virtual {v0, v1}, Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;->addAndGet(I)I

    move-result v15

    .line 353
    if-nez v15, :cond_1

    goto :goto_0

    .line 215
    :cond_7
    invoke-virtual/range {v19 .. v19}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->poll()Ljava/lang/Object;

    move-result-object v23

    .line 217
    .local v23, "val":Ljava/lang/Object;
    sget-object v25, Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;->LEFT_VALUE:Ljava/lang/Integer;

    move-object/from16 v0, v16

    move-object/from16 v1, v25

    if-ne v0, v1, :cond_b

    .line 219
    move-object/from16 v14, v23

    .line 221
    .local v14, "left":Ljava/lang/Object;, "TTLeft;"
    move-object/from16 v0, p0

    iget v13, v0, Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;->leftIndex:I

    add-int/lit8 v25, v13, 0x1

    move/from16 v0, v25

    move-object/from16 v1, p0

    iput v0, v1, Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;->leftIndex:I

    .line 222
    .local v13, "idx":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;->lefts:Ljava/util/Map;

    move-object/from16 v25, v0

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v26

    move-object/from16 v0, v25

    move-object/from16 v1, v26

    invoke-interface {v0, v1, v14}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 227
    :try_start_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;->leftEnd:Lio/reactivex/functions/Function;

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    invoke-interface {v0, v14}, Lio/reactivex/functions/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v25

    const-string/jumbo v26, "The leftEnd returned a null Publisher"

    invoke-static/range {v25 .. v26}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Lorg/reactivestreams/Publisher;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 233
    .local v17, "p":Lorg/reactivestreams/Publisher;, "Lorg/reactivestreams/Publisher<TTLeftEnd;>;"
    new-instance v9, Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$LeftRightEndSubscriber;

    const/16 v25, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v25

    invoke-direct {v9, v0, v1, v13}, Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$LeftRightEndSubscriber;-><init>(Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$JoinSupport;ZI)V

    .line 234
    .local v9, "end":Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$LeftRightEndSubscriber;
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;->disposables:Lio/reactivex/disposables/CompositeDisposable;

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    invoke-virtual {v0, v9}, Lio/reactivex/disposables/CompositeDisposable;->add(Lio/reactivex/disposables/Disposable;)Z

    .line 236
    move-object/from16 v0, v17

    invoke-interface {v0, v9}, Lorg/reactivestreams/Publisher;->subscribe(Lorg/reactivestreams/Subscriber;)V

    .line 238
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;->error:Ljava/util/concurrent/atomic/AtomicReference;

    move-object/from16 v25, v0

    invoke-virtual/range {v25 .. v25}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v10

    .end local v10    # "ex":Ljava/lang/Throwable;
    check-cast v10, Ljava/lang/Throwable;

    .line 239
    .restart local v10    # "ex":Ljava/lang/Throwable;
    if-eqz v10, :cond_8

    .line 240
    invoke-virtual/range {v19 .. v19}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->clear()V

    .line 241
    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;->cancelAll()V

    .line 242
    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;->errorAll(Lorg/reactivestreams/Subscriber;)V

    goto/16 :goto_0

    .line 228
    .end local v9    # "end":Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$LeftRightEndSubscriber;
    .end local v17    # "p":Lorg/reactivestreams/Publisher;, "Lorg/reactivestreams/Publisher<TTLeftEnd;>;"
    :catch_0
    move-exception v11

    .line 229
    .local v11, "exc":Ljava/lang/Throwable;
    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-virtual {v0, v11, v4, v1}, Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;->fail(Ljava/lang/Throwable;Lorg/reactivestreams/Subscriber;Lio/reactivex/internal/fuseable/SimpleQueue;)V

    goto/16 :goto_0

    .line 246
    .end local v11    # "exc":Ljava/lang/Throwable;
    .restart local v9    # "end":Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$LeftRightEndSubscriber;
    .restart local v17    # "p":Lorg/reactivestreams/Publisher;, "Lorg/reactivestreams/Publisher<TTLeftEnd;>;"
    :cond_8
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    move-object/from16 v25, v0

    invoke-virtual/range {v25 .. v25}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v20

    .line 247
    .local v20, "r":J
    const-wide/16 v6, 0x0

    .line 249
    .local v6, "e":J
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;->rights:Ljava/util/Map;

    move-object/from16 v25, v0

    invoke-interface/range {v25 .. v25}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v25

    invoke-interface/range {v25 .. v25}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v12

    .local v12, "i$":Ljava/util/Iterator;
    :goto_4
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v25

    if-eqz v25, :cond_a

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v22

    .line 254
    .local v22, "right":Ljava/lang/Object;, "TTRight;"
    :try_start_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;->resultSelector:Lio/reactivex/functions/BiFunction;

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    move-object/from16 v1, v22

    invoke-interface {v0, v14, v1}, Lio/reactivex/functions/BiFunction;->apply(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v25

    const-string/jumbo v26, "The resultSelector returned a null value"

    invoke-static/range {v25 .. v26}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v24

    .line 260
    .local v24, "w":Ljava/lang/Object;, "TR;"
    cmp-long v25, v6, v20

    if-eqz v25, :cond_9

    .line 261
    move-object/from16 v0, v24

    invoke-interface {v4, v0}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 263
    const-wide/16 v26, 0x1

    add-long v6, v6, v26

    goto :goto_4

    .line 255
    .end local v24    # "w":Ljava/lang/Object;, "TR;"
    :catch_1
    move-exception v11

    .line 256
    .restart local v11    # "exc":Ljava/lang/Throwable;
    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-virtual {v0, v11, v4, v1}, Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;->fail(Ljava/lang/Throwable;Lorg/reactivestreams/Subscriber;Lio/reactivex/internal/fuseable/SimpleQueue;)V

    goto/16 :goto_0

    .line 265
    .end local v11    # "exc":Ljava/lang/Throwable;
    .restart local v24    # "w":Ljava/lang/Object;, "TR;"
    :cond_9
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;->error:Ljava/util/concurrent/atomic/AtomicReference;

    move-object/from16 v25, v0

    new-instance v26, Lio/reactivex/exceptions/MissingBackpressureException;

    const-string/jumbo v27, "Could not emit value due to lack of requests"

    invoke-direct/range {v26 .. v27}, Lio/reactivex/exceptions/MissingBackpressureException;-><init>(Ljava/lang/String;)V

    invoke-static/range {v25 .. v26}, Lio/reactivex/internal/util/ExceptionHelper;->addThrowable(Ljava/util/concurrent/atomic/AtomicReference;Ljava/lang/Throwable;)Z

    .line 266
    invoke-virtual/range {v19 .. v19}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->clear()V

    .line 267
    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;->cancelAll()V

    .line 268
    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;->errorAll(Lorg/reactivestreams/Subscriber;)V

    goto/16 :goto_0

    .line 273
    .end local v22    # "right":Ljava/lang/Object;, "TTRight;"
    .end local v24    # "w":Ljava/lang/Object;, "TR;"
    :cond_a
    const-wide/16 v26, 0x0

    cmp-long v25, v6, v26

    if-eqz v25, :cond_1

    .line 274
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    invoke-static {v0, v6, v7}, Lio/reactivex/internal/util/BackpressureHelper;->produced(Ljava/util/concurrent/atomic/AtomicLong;J)J

    goto/16 :goto_1

    .line 277
    .end local v6    # "e":J
    .end local v9    # "end":Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$LeftRightEndSubscriber;
    .end local v12    # "i$":Ljava/util/Iterator;
    .end local v13    # "idx":I
    .end local v14    # "left":Ljava/lang/Object;, "TTLeft;"
    .end local v17    # "p":Lorg/reactivestreams/Publisher;, "Lorg/reactivestreams/Publisher<TTLeftEnd;>;"
    .end local v20    # "r":J
    :cond_b
    sget-object v25, Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;->RIGHT_VALUE:Ljava/lang/Integer;

    move-object/from16 v0, v16

    move-object/from16 v1, v25

    if-ne v0, v1, :cond_f

    .line 279
    move-object/from16 v22, v23

    .line 281
    .restart local v22    # "right":Ljava/lang/Object;, "TTRight;"
    move-object/from16 v0, p0

    iget v13, v0, Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;->rightIndex:I

    add-int/lit8 v25, v13, 0x1

    move/from16 v0, v25

    move-object/from16 v1, p0

    iput v0, v1, Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;->rightIndex:I

    .line 283
    .restart local v13    # "idx":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;->rights:Ljava/util/Map;

    move-object/from16 v25, v0

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v26

    move-object/from16 v0, v25

    move-object/from16 v1, v26

    move-object/from16 v2, v22

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 288
    :try_start_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;->rightEnd:Lio/reactivex/functions/Function;

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    move-object/from16 v1, v22

    invoke-interface {v0, v1}, Lio/reactivex/functions/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v25

    const-string/jumbo v26, "The rightEnd returned a null Publisher"

    invoke-static/range {v25 .. v26}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Lorg/reactivestreams/Publisher;
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_2

    .line 294
    .local v18, "p":Lorg/reactivestreams/Publisher;, "Lorg/reactivestreams/Publisher<TTRightEnd;>;"
    new-instance v9, Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$LeftRightEndSubscriber;

    const/16 v25, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v25

    invoke-direct {v9, v0, v1, v13}, Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$LeftRightEndSubscriber;-><init>(Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$JoinSupport;ZI)V

    .line 295
    .restart local v9    # "end":Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$LeftRightEndSubscriber;
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;->disposables:Lio/reactivex/disposables/CompositeDisposable;

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    invoke-virtual {v0, v9}, Lio/reactivex/disposables/CompositeDisposable;->add(Lio/reactivex/disposables/Disposable;)Z

    .line 297
    move-object/from16 v0, v18

    invoke-interface {v0, v9}, Lorg/reactivestreams/Publisher;->subscribe(Lorg/reactivestreams/Subscriber;)V

    .line 299
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;->error:Ljava/util/concurrent/atomic/AtomicReference;

    move-object/from16 v25, v0

    invoke-virtual/range {v25 .. v25}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v10

    .end local v10    # "ex":Ljava/lang/Throwable;
    check-cast v10, Ljava/lang/Throwable;

    .line 300
    .restart local v10    # "ex":Ljava/lang/Throwable;
    if-eqz v10, :cond_c

    .line 301
    invoke-virtual/range {v19 .. v19}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->clear()V

    .line 302
    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;->cancelAll()V

    .line 303
    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;->errorAll(Lorg/reactivestreams/Subscriber;)V

    goto/16 :goto_0

    .line 289
    .end local v9    # "end":Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$LeftRightEndSubscriber;
    .end local v18    # "p":Lorg/reactivestreams/Publisher;, "Lorg/reactivestreams/Publisher<TTRightEnd;>;"
    :catch_2
    move-exception v11

    .line 290
    .restart local v11    # "exc":Ljava/lang/Throwable;
    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-virtual {v0, v11, v4, v1}, Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;->fail(Ljava/lang/Throwable;Lorg/reactivestreams/Subscriber;Lio/reactivex/internal/fuseable/SimpleQueue;)V

    goto/16 :goto_0

    .line 307
    .end local v11    # "exc":Ljava/lang/Throwable;
    .restart local v9    # "end":Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$LeftRightEndSubscriber;
    .restart local v18    # "p":Lorg/reactivestreams/Publisher;, "Lorg/reactivestreams/Publisher<TTRightEnd;>;"
    :cond_c
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    move-object/from16 v25, v0

    invoke-virtual/range {v25 .. v25}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v20

    .line 308
    .restart local v20    # "r":J
    const-wide/16 v6, 0x0

    .line 310
    .restart local v6    # "e":J
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;->lefts:Ljava/util/Map;

    move-object/from16 v25, v0

    invoke-interface/range {v25 .. v25}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v25

    invoke-interface/range {v25 .. v25}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v12

    .restart local v12    # "i$":Ljava/util/Iterator;
    :goto_5
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v25

    if-eqz v25, :cond_e

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    .line 315
    .restart local v14    # "left":Ljava/lang/Object;, "TTLeft;"
    :try_start_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;->resultSelector:Lio/reactivex/functions/BiFunction;

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    move-object/from16 v1, v22

    invoke-interface {v0, v14, v1}, Lio/reactivex/functions/BiFunction;->apply(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v25

    const-string/jumbo v26, "The resultSelector returned a null value"

    invoke-static/range {v25 .. v26}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    :try_end_3
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_3

    move-result-object v24

    .line 321
    .restart local v24    # "w":Ljava/lang/Object;, "TR;"
    cmp-long v25, v6, v20

    if-eqz v25, :cond_d

    .line 322
    move-object/from16 v0, v24

    invoke-interface {v4, v0}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 324
    const-wide/16 v26, 0x1

    add-long v6, v6, v26

    goto :goto_5

    .line 316
    .end local v24    # "w":Ljava/lang/Object;, "TR;"
    :catch_3
    move-exception v11

    .line 317
    .restart local v11    # "exc":Ljava/lang/Throwable;
    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-virtual {v0, v11, v4, v1}, Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;->fail(Ljava/lang/Throwable;Lorg/reactivestreams/Subscriber;Lio/reactivex/internal/fuseable/SimpleQueue;)V

    goto/16 :goto_0

    .line 326
    .end local v11    # "exc":Ljava/lang/Throwable;
    .restart local v24    # "w":Ljava/lang/Object;, "TR;"
    :cond_d
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;->error:Ljava/util/concurrent/atomic/AtomicReference;

    move-object/from16 v25, v0

    new-instance v26, Lio/reactivex/exceptions/MissingBackpressureException;

    const-string/jumbo v27, "Could not emit value due to lack of requests"

    invoke-direct/range {v26 .. v27}, Lio/reactivex/exceptions/MissingBackpressureException;-><init>(Ljava/lang/String;)V

    invoke-static/range {v25 .. v26}, Lio/reactivex/internal/util/ExceptionHelper;->addThrowable(Ljava/util/concurrent/atomic/AtomicReference;Ljava/lang/Throwable;)Z

    .line 327
    invoke-virtual/range {v19 .. v19}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->clear()V

    .line 328
    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;->cancelAll()V

    .line 329
    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;->errorAll(Lorg/reactivestreams/Subscriber;)V

    goto/16 :goto_0

    .line 334
    .end local v14    # "left":Ljava/lang/Object;, "TTLeft;"
    .end local v24    # "w":Ljava/lang/Object;, "TR;"
    :cond_e
    const-wide/16 v26, 0x0

    cmp-long v25, v6, v26

    if-eqz v25, :cond_1

    .line 335
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    invoke-static {v0, v6, v7}, Lio/reactivex/internal/util/BackpressureHelper;->produced(Ljava/util/concurrent/atomic/AtomicLong;J)J

    goto/16 :goto_1

    .line 338
    .end local v6    # "e":J
    .end local v9    # "end":Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$LeftRightEndSubscriber;
    .end local v12    # "i$":Ljava/util/Iterator;
    .end local v13    # "idx":I
    .end local v18    # "p":Lorg/reactivestreams/Publisher;, "Lorg/reactivestreams/Publisher<TTRightEnd;>;"
    .end local v20    # "r":J
    .end local v22    # "right":Ljava/lang/Object;, "TTRight;"
    :cond_f
    sget-object v25, Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;->LEFT_CLOSE:Ljava/lang/Integer;

    move-object/from16 v0, v16

    move-object/from16 v1, v25

    if-ne v0, v1, :cond_10

    move-object/from16 v9, v23

    .line 339
    check-cast v9, Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$LeftRightEndSubscriber;

    .line 341
    .restart local v9    # "end":Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$LeftRightEndSubscriber;
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;->lefts:Ljava/util/Map;

    move-object/from16 v25, v0

    iget v0, v9, Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$LeftRightEndSubscriber;->index:I

    move/from16 v26, v0

    invoke-static/range {v26 .. v26}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v26

    invoke-interface/range {v25 .. v26}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 342
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;->disposables:Lio/reactivex/disposables/CompositeDisposable;

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    invoke-virtual {v0, v9}, Lio/reactivex/disposables/CompositeDisposable;->remove(Lio/reactivex/disposables/Disposable;)Z

    goto/16 :goto_1

    .line 344
    .end local v9    # "end":Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$LeftRightEndSubscriber;
    :cond_10
    sget-object v25, Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;->RIGHT_CLOSE:Ljava/lang/Integer;

    move-object/from16 v0, v16

    move-object/from16 v1, v25

    if-ne v0, v1, :cond_1

    move-object/from16 v9, v23

    .line 345
    check-cast v9, Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$LeftRightEndSubscriber;

    .line 347
    .restart local v9    # "end":Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$LeftRightEndSubscriber;
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;->rights:Ljava/util/Map;

    move-object/from16 v25, v0

    iget v0, v9, Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$LeftRightEndSubscriber;->index:I

    move/from16 v26, v0

    invoke-static/range {v26 .. v26}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v26

    invoke-interface/range {v25 .. v26}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 348
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;->disposables:Lio/reactivex/disposables/CompositeDisposable;

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    invoke-virtual {v0, v9}, Lio/reactivex/disposables/CompositeDisposable;->remove(Lio/reactivex/disposables/Disposable;)Z

    goto/16 :goto_1
.end method

.method errorAll(Lorg/reactivestreams/Subscriber;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 155
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;, "Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription<TTLeft;TTRight;TTLeftEnd;TTRightEnd;TR;>;"
    .local p1, "a":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<*>;"
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;->error:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-static {v1}, Lio/reactivex/internal/util/ExceptionHelper;->terminate(Ljava/util/concurrent/atomic/AtomicReference;)Ljava/lang/Throwable;

    move-result-object v0

    .line 157
    .local v0, "ex":Ljava/lang/Throwable;
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;->lefts:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->clear()V

    .line 158
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;->rights:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->clear()V

    .line 160
    invoke-interface {p1, v0}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    .line 161
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
    .line 164
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;, "Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription<TTLeft;TTRight;TTLeftEnd;TTRightEnd;TR;>;"
    .local p2, "a":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<*>;"
    .local p3, "q":Lio/reactivex/internal/fuseable/SimpleQueue;, "Lio/reactivex/internal/fuseable/SimpleQueue<*>;"
    invoke-static {p1}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 165
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;->error:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-static {v0, p1}, Lio/reactivex/internal/util/ExceptionHelper;->addThrowable(Ljava/util/concurrent/atomic/AtomicReference;Ljava/lang/Throwable;)Z

    .line 166
    invoke-interface {p3}, Lio/reactivex/internal/fuseable/SimpleQueue;->clear()V

    .line 167
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;->cancelAll()V

    .line 168
    invoke-virtual {p0, p2}, Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;->errorAll(Lorg/reactivestreams/Subscriber;)V

    .line 169
    return-void
.end method

.method public innerClose(ZLio/reactivex/internal/operators/flowable/FlowableGroupJoin$LeftRightEndSubscriber;)V
    .locals 2
    .param p1, "isLeft"    # Z
    .param p2, "index"    # Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$LeftRightEndSubscriber;

    .prologue
    .line 386
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;, "Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription<TTLeft;TTRight;TTLeftEnd;TTRightEnd;TR;>;"
    monitor-enter p0

    .line 387
    :try_start_0
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;->queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    if-eqz p1, :cond_0

    sget-object v0, Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;->LEFT_CLOSE:Ljava/lang/Integer;

    :goto_0
    invoke-virtual {v1, v0, p2}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->offer(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 388
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 389
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;->drain()V

    .line 390
    return-void

    .line 387
    :cond_0
    :try_start_1
    sget-object v0, Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;->RIGHT_CLOSE:Ljava/lang/Integer;

    goto :goto_0

    .line 388
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
    .line 394
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;, "Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription<TTLeft;TTRight;TTLeftEnd;TTRightEnd;TR;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;->error:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-static {v0, p1}, Lio/reactivex/internal/util/ExceptionHelper;->addThrowable(Ljava/util/concurrent/atomic/AtomicReference;Ljava/lang/Throwable;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 395
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;->drain()V

    .line 399
    :goto_0
    return-void

    .line 397
    :cond_0
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public innerComplete(Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$LeftRightSubscriber;)V
    .locals 1
    .param p1, "sender"    # Lio/reactivex/internal/operators/flowable/FlowableGroupJoin$LeftRightSubscriber;

    .prologue
    .line 371
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;, "Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription<TTLeft;TTRight;TTLeftEnd;TTRightEnd;TR;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;->disposables:Lio/reactivex/disposables/CompositeDisposable;

    invoke-virtual {v0, p1}, Lio/reactivex/disposables/CompositeDisposable;->delete(Lio/reactivex/disposables/Disposable;)Z

    .line 372
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;->active:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 373
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;->drain()V

    .line 374
    return-void
.end method

.method public innerError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "ex"    # Ljava/lang/Throwable;

    .prologue
    .line 361
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;, "Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription<TTLeft;TTRight;TTLeftEnd;TTRightEnd;TR;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;->error:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-static {v0, p1}, Lio/reactivex/internal/util/ExceptionHelper;->addThrowable(Ljava/util/concurrent/atomic/AtomicReference;Ljava/lang/Throwable;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 362
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;->active:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 363
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;->drain()V

    .line 367
    :goto_0
    return-void

    .line 365
    :cond_0
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public innerValue(ZLjava/lang/Object;)V
    .locals 2
    .param p1, "isLeft"    # Z
    .param p2, "o"    # Ljava/lang/Object;

    .prologue
    .line 378
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;, "Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription<TTLeft;TTRight;TTLeftEnd;TTRightEnd;TR;>;"
    monitor-enter p0

    .line 379
    :try_start_0
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;->queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    if-eqz p1, :cond_0

    sget-object v0, Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;->LEFT_VALUE:Ljava/lang/Integer;

    :goto_0
    invoke-virtual {v1, v0, p2}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->offer(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 380
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 381
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;->drain()V

    .line 382
    return-void

    .line 379
    :cond_0
    :try_start_1
    sget-object v0, Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;->RIGHT_VALUE:Ljava/lang/Integer;

    goto :goto_0

    .line 380
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
    .line 133
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;, "Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription<TTLeft;TTRight;TTLeftEnd;TTRightEnd;TR;>;"
    invoke-static {p1, p2}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->validate(J)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 134
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableJoin$JoinSubscription;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-static {v0, p1, p2}, Lio/reactivex/internal/util/BackpressureHelper;->add(Ljava/util/concurrent/atomic/AtomicLong;J)J

    .line 136
    :cond_0
    return-void
.end method
