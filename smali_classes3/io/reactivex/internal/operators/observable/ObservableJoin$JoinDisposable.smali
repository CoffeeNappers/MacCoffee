.class final Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable;
.super Ljava/util/concurrent/atomic/AtomicInteger;
.source "ObservableJoin.java"

# interfaces
.implements Lio/reactivex/disposables/Disposable;
.implements Lio/reactivex/internal/operators/observable/ObservableGroupJoin$JoinSupport;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/observable/ObservableJoin;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "JoinDisposable"
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
        "Lio/reactivex/disposables/Disposable;",
        "Lio/reactivex/internal/operators/observable/ObservableGroupJoin$JoinSupport;"
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

.field final actual:Lio/reactivex/Observer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/Observer",
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
            "Lio/reactivex/ObservableSource",
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
            "Lio/reactivex/ObservableSource",
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
    .line 106
    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    sput-object v0, Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable;->LEFT_VALUE:Ljava/lang/Integer;

    .line 108
    const/4 v0, 0x2

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    sput-object v0, Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable;->RIGHT_VALUE:Ljava/lang/Integer;

    .line 110
    const/4 v0, 0x3

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    sput-object v0, Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable;->LEFT_CLOSE:Ljava/lang/Integer;

    .line 112
    const/4 v0, 0x4

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    sput-object v0, Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable;->RIGHT_CLOSE:Ljava/lang/Integer;

    return-void
.end method

.method constructor <init>(Lio/reactivex/Observer;Lio/reactivex/functions/Function;Lio/reactivex/functions/Function;Lio/reactivex/functions/BiFunction;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Observer",
            "<-TR;>;",
            "Lio/reactivex/functions/Function",
            "<-TT",
            "Left;",
            "+",
            "Lio/reactivex/ObservableSource",
            "<TT",
            "LeftEnd;",
            ">;>;",
            "Lio/reactivex/functions/Function",
            "<-TTRight;+",
            "Lio/reactivex/ObservableSource",
            "<TTRightEnd;>;>;",
            "Lio/reactivex/functions/BiFunction",
            "<-TT",
            "Left;",
            "-TTRight;+TR;>;)V"
        }
    .end annotation

    .prologue
    .line 117
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable;, "Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable<TTLeft;TTRight;TTLeftEnd;TTRightEnd;TR;>;"
    .local p1, "actual":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TR;>;"
    .local p2, "leftEnd":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TTLeft;+Lio/reactivex/ObservableSource<TTLeftEnd;>;>;"
    .local p3, "rightEnd":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TTRight;+Lio/reactivex/ObservableSource<TTRightEnd;>;>;"
    .local p4, "resultSelector":Lio/reactivex/functions/BiFunction;, "Lio/reactivex/functions/BiFunction<-TTLeft;-TTRight;+TR;>;"
    invoke-direct {p0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    .line 118
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable;->actual:Lio/reactivex/Observer;

    .line 119
    new-instance v0, Lio/reactivex/disposables/CompositeDisposable;

    invoke-direct {v0}, Lio/reactivex/disposables/CompositeDisposable;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable;->disposables:Lio/reactivex/disposables/CompositeDisposable;

    .line 120
    new-instance v0, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    invoke-static {}, Lio/reactivex/Observable;->bufferSize()I

    move-result v1

    invoke-direct {v0, v1}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;-><init>(I)V

    iput-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable;->queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    .line 121
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable;->lefts:Ljava/util/Map;

    .line 122
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable;->rights:Ljava/util/Map;

    .line 123
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable;->error:Ljava/util/concurrent/atomic/AtomicReference;

    .line 124
    iput-object p2, p0, Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable;->leftEnd:Lio/reactivex/functions/Function;

    .line 125
    iput-object p3, p0, Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable;->rightEnd:Lio/reactivex/functions/Function;

    .line 126
    iput-object p4, p0, Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable;->resultSelector:Lio/reactivex/functions/BiFunction;

    .line 127
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable;->active:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 128
    return-void
.end method


# virtual methods
.method cancelAll()V
    .locals 1

    .prologue
    .line 147
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable;, "Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable<TTLeft;TTRight;TTLeftEnd;TTRightEnd;TR;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable;->disposables:Lio/reactivex/disposables/CompositeDisposable;

    invoke-virtual {v0}, Lio/reactivex/disposables/CompositeDisposable;->dispose()V

    .line 148
    return-void
.end method

.method public dispose()V
    .locals 1

    .prologue
    .line 132
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable;, "Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable<TTLeft;TTRight;TTLeftEnd;TTRightEnd;TR;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable;->cancelled:Z

    if-nez v0, :cond_0

    .line 133
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable;->cancelled:Z

    .line 134
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable;->cancelAll()V

    .line 135
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable;->getAndIncrement()I

    move-result v0

    if-nez v0, :cond_0

    .line 136
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable;->queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    invoke-virtual {v0}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->clear()V

    .line 139
    :cond_0
    return-void
.end method

.method drain()V
    .locals 22

    .prologue
    .line 168
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable;, "Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable<TTLeft;TTRight;TTLeftEnd;TTRightEnd;TR;>;"
    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable;->getAndIncrement()I

    move-result v20

    if-eqz v20, :cond_0

    .line 318
    :goto_0
    return-void

    .line 172
    :cond_0
    const/4 v12, 0x1

    .line 173
    .local v12, "missed":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable;->queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    move-object/from16 v16, v0

    .line 174
    .local v16, "q":Lio/reactivex/internal/queue/SpscLinkedArrayQueue;, "Lio/reactivex/internal/queue/SpscLinkedArrayQueue<Ljava/lang/Object;>;"
    move-object/from16 v0, p0

    iget-object v3, v0, Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable;->actual:Lio/reactivex/Observer;

    .line 178
    .local v3, "a":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TR;>;"
    :cond_1
    :goto_1
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable;->cancelled:Z

    move/from16 v20, v0

    if-eqz v20, :cond_2

    .line 179
    invoke-virtual/range {v16 .. v16}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->clear()V

    goto :goto_0

    .line 183
    :cond_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable;->error:Ljava/util/concurrent/atomic/AtomicReference;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Throwable;

    .line 184
    .local v7, "ex":Ljava/lang/Throwable;
    if-eqz v7, :cond_3

    .line 185
    invoke-virtual/range {v16 .. v16}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->clear()V

    .line 186
    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable;->cancelAll()V

    .line 187
    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable;->errorAll(Lio/reactivex/Observer;)V

    goto :goto_0

    .line 191
    :cond_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable;->active:Ljava/util/concurrent/atomic/AtomicInteger;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v20

    if-nez v20, :cond_4

    const/4 v4, 0x1

    .line 193
    .local v4, "d":Z
    :goto_2
    invoke-virtual/range {v16 .. v16}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->poll()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/Integer;

    .line 195
    .local v13, "mode":Ljava/lang/Integer;
    if-nez v13, :cond_5

    const/4 v5, 0x1

    .line 197
    .local v5, "empty":Z
    :goto_3
    if-eqz v4, :cond_6

    if-eqz v5, :cond_6

    .line 199
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable;->lefts:Ljava/util/Map;

    move-object/from16 v20, v0

    invoke-interface/range {v20 .. v20}, Ljava/util/Map;->clear()V

    .line 200
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable;->rights:Ljava/util/Map;

    move-object/from16 v20, v0

    invoke-interface/range {v20 .. v20}, Ljava/util/Map;->clear()V

    .line 201
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable;->disposables:Lio/reactivex/disposables/CompositeDisposable;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Lio/reactivex/disposables/CompositeDisposable;->dispose()V

    .line 203
    invoke-interface {v3}, Lio/reactivex/Observer;->onComplete()V

    goto :goto_0

    .line 191
    .end local v4    # "d":Z
    .end local v5    # "empty":Z
    .end local v13    # "mode":Ljava/lang/Integer;
    :cond_4
    const/4 v4, 0x0

    goto :goto_2

    .line 195
    .restart local v4    # "d":Z
    .restart local v13    # "mode":Ljava/lang/Integer;
    :cond_5
    const/4 v5, 0x0

    goto :goto_3

    .line 207
    .restart local v5    # "empty":Z
    :cond_6
    if-eqz v5, :cond_7

    .line 313
    neg-int v0, v12

    move/from16 v20, v0

    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable;->addAndGet(I)I

    move-result v12

    .line 314
    if-nez v12, :cond_1

    goto :goto_0

    .line 211
    :cond_7
    invoke-virtual/range {v16 .. v16}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->poll()Ljava/lang/Object;

    move-result-object v18

    .line 213
    .local v18, "val":Ljava/lang/Object;
    sget-object v20, Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable;->LEFT_VALUE:Ljava/lang/Integer;

    move-object/from16 v0, v20

    if-ne v13, v0, :cond_9

    .line 215
    move-object/from16 v11, v18

    .line 217
    .local v11, "left":Ljava/lang/Object;, "TTLeft;"
    move-object/from16 v0, p0

    iget v10, v0, Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable;->leftIndex:I

    add-int/lit8 v20, v10, 0x1

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput v0, v1, Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable;->leftIndex:I

    .line 218
    .local v10, "idx":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable;->lefts:Ljava/util/Map;

    move-object/from16 v20, v0

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v21

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-interface {v0, v1, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 223
    :try_start_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable;->leftEnd:Lio/reactivex/functions/Function;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-interface {v0, v11}, Lio/reactivex/functions/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v20

    const-string/jumbo v21, "The leftEnd returned a null ObservableSource"

    invoke-static/range {v20 .. v21}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lio/reactivex/ObservableSource;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 229
    .local v14, "p":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<TTLeftEnd;>;"
    new-instance v6, Lio/reactivex/internal/operators/observable/ObservableGroupJoin$LeftRightEndObserver;

    const/16 v20, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-direct {v6, v0, v1, v10}, Lio/reactivex/internal/operators/observable/ObservableGroupJoin$LeftRightEndObserver;-><init>(Lio/reactivex/internal/operators/observable/ObservableGroupJoin$JoinSupport;ZI)V

    .line 230
    .local v6, "end":Lio/reactivex/internal/operators/observable/ObservableGroupJoin$LeftRightEndObserver;
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable;->disposables:Lio/reactivex/disposables/CompositeDisposable;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-virtual {v0, v6}, Lio/reactivex/disposables/CompositeDisposable;->add(Lio/reactivex/disposables/Disposable;)Z

    .line 232
    invoke-interface {v14, v6}, Lio/reactivex/ObservableSource;->subscribe(Lio/reactivex/Observer;)V

    .line 234
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable;->error:Ljava/util/concurrent/atomic/AtomicReference;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v7

    .end local v7    # "ex":Ljava/lang/Throwable;
    check-cast v7, Ljava/lang/Throwable;

    .line 235
    .restart local v7    # "ex":Ljava/lang/Throwable;
    if-eqz v7, :cond_8

    .line 236
    invoke-virtual/range {v16 .. v16}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->clear()V

    .line 237
    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable;->cancelAll()V

    .line 238
    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable;->errorAll(Lio/reactivex/Observer;)V

    goto/16 :goto_0

    .line 224
    .end local v6    # "end":Lio/reactivex/internal/operators/observable/ObservableGroupJoin$LeftRightEndObserver;
    .end local v14    # "p":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<TTLeftEnd;>;"
    :catch_0
    move-exception v8

    .line 225
    .local v8, "exc":Ljava/lang/Throwable;
    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-virtual {v0, v8, v3, v1}, Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable;->fail(Ljava/lang/Throwable;Lio/reactivex/Observer;Lio/reactivex/internal/queue/SpscLinkedArrayQueue;)V

    goto/16 :goto_0

    .line 242
    .end local v8    # "exc":Ljava/lang/Throwable;
    .restart local v6    # "end":Lio/reactivex/internal/operators/observable/ObservableGroupJoin$LeftRightEndObserver;
    .restart local v14    # "p":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<TTLeftEnd;>;"
    :cond_8
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable;->rights:Ljava/util/Map;

    move-object/from16 v20, v0

    invoke-interface/range {v20 .. v20}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v20

    invoke-interface/range {v20 .. v20}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v9

    .local v9, "i$":Ljava/util/Iterator;
    :goto_4
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v20

    if-eqz v20, :cond_1

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v17

    .line 247
    .local v17, "right":Ljava/lang/Object;, "TTRight;"
    :try_start_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable;->resultSelector:Lio/reactivex/functions/BiFunction;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    move-object/from16 v1, v17

    invoke-interface {v0, v11, v1}, Lio/reactivex/functions/BiFunction;->apply(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v20

    const-string/jumbo v21, "The resultSelector returned a null value"

    invoke-static/range {v20 .. v21}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v19

    .line 253
    .local v19, "w":Ljava/lang/Object;, "TR;"
    move-object/from16 v0, v19

    invoke-interface {v3, v0}, Lio/reactivex/Observer;->onNext(Ljava/lang/Object;)V

    goto :goto_4

    .line 248
    .end local v19    # "w":Ljava/lang/Object;, "TR;"
    :catch_1
    move-exception v8

    .line 249
    .restart local v8    # "exc":Ljava/lang/Throwable;
    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-virtual {v0, v8, v3, v1}, Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable;->fail(Ljava/lang/Throwable;Lio/reactivex/Observer;Lio/reactivex/internal/queue/SpscLinkedArrayQueue;)V

    goto/16 :goto_0

    .line 256
    .end local v6    # "end":Lio/reactivex/internal/operators/observable/ObservableGroupJoin$LeftRightEndObserver;
    .end local v8    # "exc":Ljava/lang/Throwable;
    .end local v9    # "i$":Ljava/util/Iterator;
    .end local v10    # "idx":I
    .end local v11    # "left":Ljava/lang/Object;, "TTLeft;"
    .end local v14    # "p":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<TTLeftEnd;>;"
    .end local v17    # "right":Ljava/lang/Object;, "TTRight;"
    :cond_9
    sget-object v20, Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable;->RIGHT_VALUE:Ljava/lang/Integer;

    move-object/from16 v0, v20

    if-ne v13, v0, :cond_b

    .line 258
    move-object/from16 v17, v18

    .line 260
    .restart local v17    # "right":Ljava/lang/Object;, "TTRight;"
    move-object/from16 v0, p0

    iget v10, v0, Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable;->rightIndex:I

    add-int/lit8 v20, v10, 0x1

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput v0, v1, Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable;->rightIndex:I

    .line 262
    .restart local v10    # "idx":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable;->rights:Ljava/util/Map;

    move-object/from16 v20, v0

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v21

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    move-object/from16 v2, v17

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 267
    :try_start_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable;->rightEnd:Lio/reactivex/functions/Function;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    move-object/from16 v1, v17

    invoke-interface {v0, v1}, Lio/reactivex/functions/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v20

    const-string/jumbo v21, "The rightEnd returned a null ObservableSource"

    invoke-static/range {v20 .. v21}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lio/reactivex/ObservableSource;
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_2

    .line 273
    .local v15, "p":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<TTRightEnd;>;"
    new-instance v6, Lio/reactivex/internal/operators/observable/ObservableGroupJoin$LeftRightEndObserver;

    const/16 v20, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-direct {v6, v0, v1, v10}, Lio/reactivex/internal/operators/observable/ObservableGroupJoin$LeftRightEndObserver;-><init>(Lio/reactivex/internal/operators/observable/ObservableGroupJoin$JoinSupport;ZI)V

    .line 274
    .restart local v6    # "end":Lio/reactivex/internal/operators/observable/ObservableGroupJoin$LeftRightEndObserver;
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable;->disposables:Lio/reactivex/disposables/CompositeDisposable;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-virtual {v0, v6}, Lio/reactivex/disposables/CompositeDisposable;->add(Lio/reactivex/disposables/Disposable;)Z

    .line 276
    invoke-interface {v15, v6}, Lio/reactivex/ObservableSource;->subscribe(Lio/reactivex/Observer;)V

    .line 278
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable;->error:Ljava/util/concurrent/atomic/AtomicReference;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v7

    .end local v7    # "ex":Ljava/lang/Throwable;
    check-cast v7, Ljava/lang/Throwable;

    .line 279
    .restart local v7    # "ex":Ljava/lang/Throwable;
    if-eqz v7, :cond_a

    .line 280
    invoke-virtual/range {v16 .. v16}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->clear()V

    .line 281
    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable;->cancelAll()V

    .line 282
    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable;->errorAll(Lio/reactivex/Observer;)V

    goto/16 :goto_0

    .line 268
    .end local v6    # "end":Lio/reactivex/internal/operators/observable/ObservableGroupJoin$LeftRightEndObserver;
    .end local v15    # "p":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<TTRightEnd;>;"
    :catch_2
    move-exception v8

    .line 269
    .restart local v8    # "exc":Ljava/lang/Throwable;
    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-virtual {v0, v8, v3, v1}, Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable;->fail(Ljava/lang/Throwable;Lio/reactivex/Observer;Lio/reactivex/internal/queue/SpscLinkedArrayQueue;)V

    goto/16 :goto_0

    .line 286
    .end local v8    # "exc":Ljava/lang/Throwable;
    .restart local v6    # "end":Lio/reactivex/internal/operators/observable/ObservableGroupJoin$LeftRightEndObserver;
    .restart local v15    # "p":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<TTRightEnd;>;"
    :cond_a
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable;->lefts:Ljava/util/Map;

    move-object/from16 v20, v0

    invoke-interface/range {v20 .. v20}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v20

    invoke-interface/range {v20 .. v20}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v9

    .restart local v9    # "i$":Ljava/util/Iterator;
    :goto_5
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v20

    if-eqz v20, :cond_1

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    .line 291
    .restart local v11    # "left":Ljava/lang/Object;, "TTLeft;"
    :try_start_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable;->resultSelector:Lio/reactivex/functions/BiFunction;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    move-object/from16 v1, v17

    invoke-interface {v0, v11, v1}, Lio/reactivex/functions/BiFunction;->apply(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v20

    const-string/jumbo v21, "The resultSelector returned a null value"

    invoke-static/range {v20 .. v21}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    :try_end_3
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_3

    move-result-object v19

    .line 297
    .restart local v19    # "w":Ljava/lang/Object;, "TR;"
    move-object/from16 v0, v19

    invoke-interface {v3, v0}, Lio/reactivex/Observer;->onNext(Ljava/lang/Object;)V

    goto :goto_5

    .line 292
    .end local v19    # "w":Ljava/lang/Object;, "TR;"
    :catch_3
    move-exception v8

    .line 293
    .restart local v8    # "exc":Ljava/lang/Throwable;
    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-virtual {v0, v8, v3, v1}, Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable;->fail(Ljava/lang/Throwable;Lio/reactivex/Observer;Lio/reactivex/internal/queue/SpscLinkedArrayQueue;)V

    goto/16 :goto_0

    .line 300
    .end local v6    # "end":Lio/reactivex/internal/operators/observable/ObservableGroupJoin$LeftRightEndObserver;
    .end local v8    # "exc":Ljava/lang/Throwable;
    .end local v9    # "i$":Ljava/util/Iterator;
    .end local v10    # "idx":I
    .end local v11    # "left":Ljava/lang/Object;, "TTLeft;"
    .end local v15    # "p":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<TTRightEnd;>;"
    .end local v17    # "right":Ljava/lang/Object;, "TTRight;"
    :cond_b
    sget-object v20, Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable;->LEFT_CLOSE:Ljava/lang/Integer;

    move-object/from16 v0, v20

    if-ne v13, v0, :cond_c

    move-object/from16 v6, v18

    .line 301
    check-cast v6, Lio/reactivex/internal/operators/observable/ObservableGroupJoin$LeftRightEndObserver;

    .line 303
    .restart local v6    # "end":Lio/reactivex/internal/operators/observable/ObservableGroupJoin$LeftRightEndObserver;
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable;->lefts:Ljava/util/Map;

    move-object/from16 v20, v0

    iget v0, v6, Lio/reactivex/internal/operators/observable/ObservableGroupJoin$LeftRightEndObserver;->index:I

    move/from16 v21, v0

    invoke-static/range {v21 .. v21}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v21

    invoke-interface/range {v20 .. v21}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 304
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable;->disposables:Lio/reactivex/disposables/CompositeDisposable;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-virtual {v0, v6}, Lio/reactivex/disposables/CompositeDisposable;->remove(Lio/reactivex/disposables/Disposable;)Z

    goto/16 :goto_1

    .end local v6    # "end":Lio/reactivex/internal/operators/observable/ObservableGroupJoin$LeftRightEndObserver;
    :cond_c
    move-object/from16 v6, v18

    .line 306
    check-cast v6, Lio/reactivex/internal/operators/observable/ObservableGroupJoin$LeftRightEndObserver;

    .line 308
    .restart local v6    # "end":Lio/reactivex/internal/operators/observable/ObservableGroupJoin$LeftRightEndObserver;
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable;->rights:Ljava/util/Map;

    move-object/from16 v20, v0

    iget v0, v6, Lio/reactivex/internal/operators/observable/ObservableGroupJoin$LeftRightEndObserver;->index:I

    move/from16 v21, v0

    invoke-static/range {v21 .. v21}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v21

    invoke-interface/range {v20 .. v21}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 309
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable;->disposables:Lio/reactivex/disposables/CompositeDisposable;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-virtual {v0, v6}, Lio/reactivex/disposables/CompositeDisposable;->remove(Lio/reactivex/disposables/Disposable;)Z

    goto/16 :goto_1
.end method

.method errorAll(Lio/reactivex/Observer;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Observer",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 151
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable;, "Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable<TTLeft;TTRight;TTLeftEnd;TTRightEnd;TR;>;"
    .local p1, "a":Lio/reactivex/Observer;, "Lio/reactivex/Observer<*>;"
    iget-object v1, p0, Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable;->error:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-static {v1}, Lio/reactivex/internal/util/ExceptionHelper;->terminate(Ljava/util/concurrent/atomic/AtomicReference;)Ljava/lang/Throwable;

    move-result-object v0

    .line 153
    .local v0, "ex":Ljava/lang/Throwable;
    iget-object v1, p0, Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable;->lefts:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->clear()V

    .line 154
    iget-object v1, p0, Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable;->rights:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->clear()V

    .line 156
    invoke-interface {p1, v0}, Lio/reactivex/Observer;->onError(Ljava/lang/Throwable;)V

    .line 157
    return-void
.end method

.method fail(Ljava/lang/Throwable;Lio/reactivex/Observer;Lio/reactivex/internal/queue/SpscLinkedArrayQueue;)V
    .locals 1
    .param p1, "exc"    # Ljava/lang/Throwable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Throwable;",
            "Lio/reactivex/Observer",
            "<*>;",
            "Lio/reactivex/internal/queue/SpscLinkedArrayQueue",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 160
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable;, "Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable<TTLeft;TTRight;TTLeftEnd;TTRightEnd;TR;>;"
    .local p2, "a":Lio/reactivex/Observer;, "Lio/reactivex/Observer<*>;"
    .local p3, "q":Lio/reactivex/internal/queue/SpscLinkedArrayQueue;, "Lio/reactivex/internal/queue/SpscLinkedArrayQueue<*>;"
    invoke-static {p1}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 161
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable;->error:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-static {v0, p1}, Lio/reactivex/internal/util/ExceptionHelper;->addThrowable(Ljava/util/concurrent/atomic/AtomicReference;Ljava/lang/Throwable;)Z

    .line 162
    invoke-virtual {p3}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->clear()V

    .line 163
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable;->cancelAll()V

    .line 164
    invoke-virtual {p0, p2}, Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable;->errorAll(Lio/reactivex/Observer;)V

    .line 165
    return-void
.end method

.method public innerClose(ZLio/reactivex/internal/operators/observable/ObservableGroupJoin$LeftRightEndObserver;)V
    .locals 2
    .param p1, "isLeft"    # Z
    .param p2, "index"    # Lio/reactivex/internal/operators/observable/ObservableGroupJoin$LeftRightEndObserver;

    .prologue
    .line 347
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable;, "Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable<TTLeft;TTRight;TTLeftEnd;TTRightEnd;TR;>;"
    monitor-enter p0

    .line 348
    :try_start_0
    iget-object v1, p0, Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable;->queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    if-eqz p1, :cond_0

    sget-object v0, Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable;->LEFT_CLOSE:Ljava/lang/Integer;

    :goto_0
    invoke-virtual {v1, v0, p2}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->offer(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 349
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 350
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable;->drain()V

    .line 351
    return-void

    .line 348
    :cond_0
    :try_start_1
    sget-object v0, Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable;->RIGHT_CLOSE:Ljava/lang/Integer;

    goto :goto_0

    .line 349
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
    .line 355
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable;, "Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable<TTLeft;TTRight;TTLeftEnd;TTRightEnd;TR;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable;->error:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-static {v0, p1}, Lio/reactivex/internal/util/ExceptionHelper;->addThrowable(Ljava/util/concurrent/atomic/AtomicReference;Ljava/lang/Throwable;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 356
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable;->drain()V

    .line 360
    :goto_0
    return-void

    .line 358
    :cond_0
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public innerComplete(Lio/reactivex/internal/operators/observable/ObservableGroupJoin$LeftRightObserver;)V
    .locals 1
    .param p1, "sender"    # Lio/reactivex/internal/operators/observable/ObservableGroupJoin$LeftRightObserver;

    .prologue
    .line 332
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable;, "Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable<TTLeft;TTRight;TTLeftEnd;TTRightEnd;TR;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable;->disposables:Lio/reactivex/disposables/CompositeDisposable;

    invoke-virtual {v0, p1}, Lio/reactivex/disposables/CompositeDisposable;->delete(Lio/reactivex/disposables/Disposable;)Z

    .line 333
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable;->active:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 334
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable;->drain()V

    .line 335
    return-void
.end method

.method public innerError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "ex"    # Ljava/lang/Throwable;

    .prologue
    .line 322
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable;, "Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable<TTLeft;TTRight;TTLeftEnd;TTRightEnd;TR;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable;->error:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-static {v0, p1}, Lio/reactivex/internal/util/ExceptionHelper;->addThrowable(Ljava/util/concurrent/atomic/AtomicReference;Ljava/lang/Throwable;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 323
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable;->active:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 324
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable;->drain()V

    .line 328
    :goto_0
    return-void

    .line 326
    :cond_0
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public innerValue(ZLjava/lang/Object;)V
    .locals 2
    .param p1, "isLeft"    # Z
    .param p2, "o"    # Ljava/lang/Object;

    .prologue
    .line 339
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable;, "Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable<TTLeft;TTRight;TTLeftEnd;TTRightEnd;TR;>;"
    monitor-enter p0

    .line 340
    :try_start_0
    iget-object v1, p0, Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable;->queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    if-eqz p1, :cond_0

    sget-object v0, Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable;->LEFT_VALUE:Ljava/lang/Integer;

    :goto_0
    invoke-virtual {v1, v0, p2}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->offer(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 341
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 342
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable;->drain()V

    .line 343
    return-void

    .line 340
    :cond_0
    :try_start_1
    sget-object v0, Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable;->RIGHT_VALUE:Ljava/lang/Integer;

    goto :goto_0

    .line 341
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public isDisposed()Z
    .locals 1

    .prologue
    .line 143
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable;, "Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable<TTLeft;TTRight;TTLeftEnd;TTRightEnd;TR;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableJoin$JoinDisposable;->cancelled:Z

    return v0
.end method
