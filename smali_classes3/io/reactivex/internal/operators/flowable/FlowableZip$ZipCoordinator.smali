.class final Lio/reactivex/internal/operators/flowable/FlowableZip$ZipCoordinator;
.super Ljava/util/concurrent/atomic/AtomicInteger;
.source "FlowableZip.java"

# interfaces
.implements Lorg/reactivestreams/Subscription;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/flowable/FlowableZip;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "ZipCoordinator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "R:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/concurrent/atomic/AtomicInteger;",
        "Lorg/reactivestreams/Subscription;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x21ca630c444d714fL


# instance fields
.field final actual:Lorg/reactivestreams/Subscriber;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/reactivestreams/Subscriber",
            "<-TR;>;"
        }
    .end annotation
.end field

.field volatile cancelled:Z

.field final current:[Ljava/lang/Object;

.field final delayErrors:Z

.field final errors:Lio/reactivex/internal/util/AtomicThrowable;

.field final requested:Ljava/util/concurrent/atomic/AtomicLong;

.field final subscribers:[Lio/reactivex/internal/operators/flowable/FlowableZip$ZipSubscriber;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Lio/reactivex/internal/operators/flowable/FlowableZip$ZipSubscriber",
            "<TT;TR;>;"
        }
    .end annotation
.end field

.field final zipper:Lio/reactivex/functions/Function;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Function",
            "<-[",
            "Ljava/lang/Object;",
            "+TR;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lorg/reactivestreams/Subscriber;Lio/reactivex/functions/Function;IIZ)V
    .locals 3
    .param p3, "n"    # I
    .param p4, "prefetch"    # I
    .param p5, "delayErrors"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber",
            "<-TR;>;",
            "Lio/reactivex/functions/Function",
            "<-[",
            "Ljava/lang/Object;",
            "+TR;>;IIZ)V"
        }
    .end annotation

    .prologue
    .line 106
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableZip$ZipCoordinator;, "Lio/reactivex/internal/operators/flowable/FlowableZip$ZipCoordinator<TT;TR;>;"
    .local p1, "actual":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TR;>;"
    .local p2, "zipper":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-[Ljava/lang/Object;+TR;>;"
    invoke-direct {p0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    .line 107
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableZip$ZipCoordinator;->actual:Lorg/reactivestreams/Subscriber;

    .line 108
    iput-object p2, p0, Lio/reactivex/internal/operators/flowable/FlowableZip$ZipCoordinator;->zipper:Lio/reactivex/functions/Function;

    .line 109
    iput-boolean p5, p0, Lio/reactivex/internal/operators/flowable/FlowableZip$ZipCoordinator;->delayErrors:Z

    .line 111
    new-array v0, p3, [Lio/reactivex/internal/operators/flowable/FlowableZip$ZipSubscriber;

    .line 112
    .local v0, "a":[Lio/reactivex/internal/operators/flowable/FlowableZip$ZipSubscriber;, "[Lio/reactivex/internal/operators/flowable/FlowableZip$ZipSubscriber<TT;TR;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, p3, :cond_0

    .line 113
    new-instance v2, Lio/reactivex/internal/operators/flowable/FlowableZip$ZipSubscriber;

    invoke-direct {v2, p0, p4}, Lio/reactivex/internal/operators/flowable/FlowableZip$ZipSubscriber;-><init>(Lio/reactivex/internal/operators/flowable/FlowableZip$ZipCoordinator;I)V

    aput-object v2, v0, v1

    .line 112
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 115
    :cond_0
    new-array v2, p3, [Ljava/lang/Object;

    iput-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableZip$ZipCoordinator;->current:[Ljava/lang/Object;

    .line 116
    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableZip$ZipCoordinator;->subscribers:[Lio/reactivex/internal/operators/flowable/FlowableZip$ZipSubscriber;

    .line 117
    new-instance v2, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v2}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableZip$ZipCoordinator;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    .line 118
    new-instance v2, Lio/reactivex/internal/util/AtomicThrowable;

    invoke-direct {v2}, Lio/reactivex/internal/util/AtomicThrowable;-><init>()V

    iput-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableZip$ZipCoordinator;->errors:Lio/reactivex/internal/util/AtomicThrowable;

    .line 119
    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 1

    .prologue
    .line 141
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableZip$ZipCoordinator;, "Lio/reactivex/internal/operators/flowable/FlowableZip$ZipCoordinator<TT;TR;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableZip$ZipCoordinator;->cancelled:Z

    if-nez v0, :cond_0

    .line 142
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableZip$ZipCoordinator;->cancelled:Z

    .line 144
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableZip$ZipCoordinator;->cancelAll()V

    .line 146
    :cond_0
    return-void
.end method

.method cancelAll()V
    .locals 4

    .prologue
    .line 158
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableZip$ZipCoordinator;, "Lio/reactivex/internal/operators/flowable/FlowableZip$ZipCoordinator<TT;TR;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableZip$ZipCoordinator;->subscribers:[Lio/reactivex/internal/operators/flowable/FlowableZip$ZipSubscriber;

    .local v0, "arr$":[Lio/reactivex/internal/operators/flowable/FlowableZip$ZipSubscriber;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_0
    if-ge v1, v2, :cond_0

    aget-object v3, v0, v1

    .line 159
    .local v3, "s":Lio/reactivex/internal/operators/flowable/FlowableZip$ZipSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableZip$ZipSubscriber<TT;TR;>;"
    invoke-virtual {v3}, Lio/reactivex/internal/operators/flowable/FlowableZip$ZipSubscriber;->cancel()V

    .line 158
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 161
    .end local v3    # "s":Lio/reactivex/internal/operators/flowable/FlowableZip$ZipSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableZip$ZipSubscriber<TT;TR;>;"
    :cond_0
    return-void
.end method

.method drain()V
    .locals 26

    .prologue
    .line 165
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableZip$ZipCoordinator;, "Lio/reactivex/internal/operators/flowable/FlowableZip$ZipCoordinator<TT;TR;>;"
    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/flowable/FlowableZip$ZipCoordinator;->getAndIncrement()I

    move-result v23

    if-eqz v23, :cond_1

    .line 320
    :cond_0
    :goto_0
    return-void

    .line 169
    :cond_1
    move-object/from16 v0, p0

    iget-object v2, v0, Lio/reactivex/internal/operators/flowable/FlowableZip$ZipCoordinator;->actual:Lorg/reactivestreams/Subscriber;

    .line 170
    .local v2, "a":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TR;>;"
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableZip$ZipCoordinator;->subscribers:[Lio/reactivex/internal/operators/flowable/FlowableZip$ZipSubscriber;

    move-object/from16 v16, v0

    .line 171
    .local v16, "qs":[Lio/reactivex/internal/operators/flowable/FlowableZip$ZipSubscriber;, "[Lio/reactivex/internal/operators/flowable/FlowableZip$ZipSubscriber<TT;TR;>;"
    move-object/from16 v0, v16

    array-length v14, v0

    .line 172
    .local v14, "n":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableZip$ZipCoordinator;->current:[Ljava/lang/Object;

    move-object/from16 v22, v0

    .line 174
    .local v22, "values":[Ljava/lang/Object;
    const/4 v13, 0x1

    .line 178
    .local v13, "missed":I
    :cond_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableZip$ZipCoordinator;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v18

    .line 179
    .local v18, "r":J
    const-wide/16 v6, 0x0

    .line 181
    .local v6, "e":J
    :goto_1
    cmp-long v23, v18, v6

    if-eqz v23, :cond_c

    .line 183
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lio/reactivex/internal/operators/flowable/FlowableZip$ZipCoordinator;->cancelled:Z

    move/from16 v23, v0

    if-nez v23, :cond_0

    .line 187
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lio/reactivex/internal/operators/flowable/FlowableZip$ZipCoordinator;->delayErrors:Z

    move/from16 v23, v0

    if-nez v23, :cond_3

    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableZip$ZipCoordinator;->errors:Lio/reactivex/internal/util/AtomicThrowable;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Lio/reactivex/internal/util/AtomicThrowable;->get()Ljava/lang/Object;

    move-result-object v23

    if-eqz v23, :cond_3

    .line 188
    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/flowable/FlowableZip$ZipCoordinator;->cancelAll()V

    .line 189
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableZip$ZipCoordinator;->errors:Lio/reactivex/internal/util/AtomicThrowable;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Lio/reactivex/internal/util/AtomicThrowable;->terminate()Ljava/lang/Throwable;

    move-result-object v23

    move-object/from16 v0, v23

    invoke-interface {v2, v0}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 193
    :cond_3
    const/4 v5, 0x0

    .line 195
    .local v5, "empty":Z
    const/4 v11, 0x0

    .local v11, "j":I
    :goto_2
    if-ge v11, v14, :cond_b

    .line 196
    aget-object v10, v16, v11

    .line 197
    .local v10, "inner":Lio/reactivex/internal/operators/flowable/FlowableZip$ZipSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableZip$ZipSubscriber<TT;TR;>;"
    aget-object v23, v22, v11

    if-nez v23, :cond_8

    .line 199
    :try_start_0
    iget-boolean v4, v10, Lio/reactivex/internal/operators/flowable/FlowableZip$ZipSubscriber;->done:Z

    .line 200
    .local v4, "d":Z
    iget-object v15, v10, Lio/reactivex/internal/operators/flowable/FlowableZip$ZipSubscriber;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    .line 202
    .local v15, "q":Lio/reactivex/internal/fuseable/SimpleQueue;, "Lio/reactivex/internal/fuseable/SimpleQueue<TT;>;"
    if-eqz v15, :cond_4

    invoke-interface {v15}, Lio/reactivex/internal/fuseable/SimpleQueue;->poll()Ljava/lang/Object;

    move-result-object v21

    .line 204
    .local v21, "v":Ljava/lang/Object;, "TT;"
    :goto_3
    if-nez v21, :cond_5

    const/16 v17, 0x1

    .line 205
    .local v17, "sourceEmpty":Z
    :goto_4
    if-eqz v4, :cond_7

    if-eqz v17, :cond_7

    .line 206
    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/flowable/FlowableZip$ZipCoordinator;->cancelAll()V

    .line 207
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableZip$ZipCoordinator;->errors:Lio/reactivex/internal/util/AtomicThrowable;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Lio/reactivex/internal/util/AtomicThrowable;->get()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Throwable;

    .line 208
    .local v8, "ex":Ljava/lang/Throwable;
    if-eqz v8, :cond_6

    .line 209
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableZip$ZipCoordinator;->errors:Lio/reactivex/internal/util/AtomicThrowable;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Lio/reactivex/internal/util/AtomicThrowable;->terminate()Ljava/lang/Throwable;

    move-result-object v23

    move-object/from16 v0, v23

    invoke-interface {v2, v0}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    .line 220
    .end local v4    # "d":Z
    .end local v8    # "ex":Ljava/lang/Throwable;
    .end local v15    # "q":Lio/reactivex/internal/fuseable/SimpleQueue;, "Lio/reactivex/internal/fuseable/SimpleQueue<TT;>;"
    .end local v17    # "sourceEmpty":Z
    .end local v21    # "v":Ljava/lang/Object;, "TT;"
    :catch_0
    move-exception v8

    .line 221
    .restart local v8    # "ex":Ljava/lang/Throwable;
    invoke-static {v8}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 223
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableZip$ZipCoordinator;->errors:Lio/reactivex/internal/util/AtomicThrowable;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    invoke-virtual {v0, v8}, Lio/reactivex/internal/util/AtomicThrowable;->addThrowable(Ljava/lang/Throwable;)Z

    .line 224
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lio/reactivex/internal/operators/flowable/FlowableZip$ZipCoordinator;->delayErrors:Z

    move/from16 v23, v0

    if-nez v23, :cond_a

    .line 225
    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/flowable/FlowableZip$ZipCoordinator;->cancelAll()V

    .line 226
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableZip$ZipCoordinator;->errors:Lio/reactivex/internal/util/AtomicThrowable;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Lio/reactivex/internal/util/AtomicThrowable;->terminate()Ljava/lang/Throwable;

    move-result-object v23

    move-object/from16 v0, v23

    invoke-interface {v2, v0}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto/16 :goto_0

    .line 202
    .end local v8    # "ex":Ljava/lang/Throwable;
    .restart local v4    # "d":Z
    .restart local v15    # "q":Lio/reactivex/internal/fuseable/SimpleQueue;, "Lio/reactivex/internal/fuseable/SimpleQueue<TT;>;"
    :cond_4
    const/16 v21, 0x0

    goto :goto_3

    .line 204
    .restart local v21    # "v":Ljava/lang/Object;, "TT;"
    :cond_5
    const/16 v17, 0x0

    goto :goto_4

    .line 211
    .restart local v8    # "ex":Ljava/lang/Throwable;
    .restart local v17    # "sourceEmpty":Z
    :cond_6
    :try_start_1
    invoke-interface {v2}, Lorg/reactivestreams/Subscriber;->onComplete()V

    goto/16 :goto_0

    .line 215
    .end local v8    # "ex":Ljava/lang/Throwable;
    :cond_7
    if-nez v17, :cond_9

    .line 216
    aput-object v21, v22, v11
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0

    .line 195
    .end local v4    # "d":Z
    .end local v15    # "q":Lio/reactivex/internal/fuseable/SimpleQueue;, "Lio/reactivex/internal/fuseable/SimpleQueue<TT;>;"
    .end local v17    # "sourceEmpty":Z
    .end local v21    # "v":Ljava/lang/Object;, "TT;"
    :cond_8
    :goto_5
    add-int/lit8 v11, v11, 0x1

    goto :goto_2

    .line 218
    .restart local v4    # "d":Z
    .restart local v15    # "q":Lio/reactivex/internal/fuseable/SimpleQueue;, "Lio/reactivex/internal/fuseable/SimpleQueue<TT;>;"
    .restart local v17    # "sourceEmpty":Z
    .restart local v21    # "v":Ljava/lang/Object;, "TT;"
    :cond_9
    const/4 v5, 0x1

    goto :goto_5

    .line 229
    .end local v4    # "d":Z
    .end local v15    # "q":Lio/reactivex/internal/fuseable/SimpleQueue;, "Lio/reactivex/internal/fuseable/SimpleQueue<TT;>;"
    .end local v17    # "sourceEmpty":Z
    .end local v21    # "v":Ljava/lang/Object;, "TT;"
    .restart local v8    # "ex":Ljava/lang/Throwable;
    :cond_a
    const/4 v5, 0x1

    goto :goto_5

    .line 234
    .end local v8    # "ex":Ljava/lang/Throwable;
    .end local v10    # "inner":Lio/reactivex/internal/operators/flowable/FlowableZip$ZipSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableZip$ZipSubscriber<TT;TR;>;"
    :cond_b
    if-eqz v5, :cond_d

    .line 257
    .end local v5    # "empty":Z
    .end local v11    # "j":I
    :cond_c
    cmp-long v23, v18, v6

    if-nez v23, :cond_14

    .line 258
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lio/reactivex/internal/operators/flowable/FlowableZip$ZipCoordinator;->cancelled:Z

    move/from16 v23, v0

    if-nez v23, :cond_0

    .line 262
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lio/reactivex/internal/operators/flowable/FlowableZip$ZipCoordinator;->delayErrors:Z

    move/from16 v23, v0

    if-nez v23, :cond_e

    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableZip$ZipCoordinator;->errors:Lio/reactivex/internal/util/AtomicThrowable;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Lio/reactivex/internal/util/AtomicThrowable;->get()Ljava/lang/Object;

    move-result-object v23

    if-eqz v23, :cond_e

    .line 263
    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/flowable/FlowableZip$ZipCoordinator;->cancelAll()V

    .line 264
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableZip$ZipCoordinator;->errors:Lio/reactivex/internal/util/AtomicThrowable;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Lio/reactivex/internal/util/AtomicThrowable;->terminate()Ljava/lang/Throwable;

    move-result-object v23

    move-object/from16 v0, v23

    invoke-interface {v2, v0}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto/16 :goto_0

    .line 241
    .restart local v5    # "empty":Z
    .restart local v11    # "j":I
    :cond_d
    :try_start_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableZip$ZipCoordinator;->zipper:Lio/reactivex/functions/Function;

    move-object/from16 v23, v0

    invoke-virtual/range {v22 .. v22}, [Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v24

    invoke-interface/range {v23 .. v24}, Lio/reactivex/functions/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v23

    const-string/jumbo v24, "The zipper returned a null value"

    invoke-static/range {v23 .. v24}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_1

    move-result-object v20

    .line 250
    .local v20, "v":Ljava/lang/Object;, "TR;"
    move-object/from16 v0, v20

    invoke-interface {v2, v0}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 252
    const-wide/16 v24, 0x1

    add-long v6, v6, v24

    .line 254
    const/16 v23, 0x0

    invoke-static/range {v22 .. v23}, Ljava/util/Arrays;->fill([Ljava/lang/Object;Ljava/lang/Object;)V

    goto/16 :goto_1

    .line 242
    .end local v20    # "v":Ljava/lang/Object;, "TR;"
    :catch_1
    move-exception v8

    .line 243
    .restart local v8    # "ex":Ljava/lang/Throwable;
    invoke-static {v8}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 244
    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/flowable/FlowableZip$ZipCoordinator;->cancelAll()V

    .line 245
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableZip$ZipCoordinator;->errors:Lio/reactivex/internal/util/AtomicThrowable;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    invoke-virtual {v0, v8}, Lio/reactivex/internal/util/AtomicThrowable;->addThrowable(Ljava/lang/Throwable;)Z

    .line 246
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableZip$ZipCoordinator;->errors:Lio/reactivex/internal/util/AtomicThrowable;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Lio/reactivex/internal/util/AtomicThrowable;->terminate()Ljava/lang/Throwable;

    move-result-object v23

    move-object/from16 v0, v23

    invoke-interface {v2, v0}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto/16 :goto_0

    .line 268
    .end local v5    # "empty":Z
    .end local v8    # "ex":Ljava/lang/Throwable;
    .end local v11    # "j":I
    :cond_e
    const/4 v11, 0x0

    .restart local v11    # "j":I
    :goto_6
    if-ge v11, v14, :cond_14

    .line 269
    aget-object v10, v16, v11

    .line 270
    .restart local v10    # "inner":Lio/reactivex/internal/operators/flowable/FlowableZip$ZipSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableZip$ZipSubscriber<TT;TR;>;"
    aget-object v23, v22, v11

    if-nez v23, :cond_13

    .line 272
    :try_start_3
    iget-boolean v4, v10, Lio/reactivex/internal/operators/flowable/FlowableZip$ZipSubscriber;->done:Z

    .line 273
    .restart local v4    # "d":Z
    iget-object v15, v10, Lio/reactivex/internal/operators/flowable/FlowableZip$ZipSubscriber;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    .line 274
    .restart local v15    # "q":Lio/reactivex/internal/fuseable/SimpleQueue;, "Lio/reactivex/internal/fuseable/SimpleQueue<TT;>;"
    if-eqz v15, :cond_f

    invoke-interface {v15}, Lio/reactivex/internal/fuseable/SimpleQueue;->poll()Ljava/lang/Object;

    move-result-object v21

    .line 276
    .restart local v21    # "v":Ljava/lang/Object;, "TT;"
    :goto_7
    if-nez v21, :cond_10

    const/4 v5, 0x1

    .line 277
    .restart local v5    # "empty":Z
    :goto_8
    if-eqz v4, :cond_12

    if-eqz v5, :cond_12

    .line 278
    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/flowable/FlowableZip$ZipCoordinator;->cancelAll()V

    .line 279
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableZip$ZipCoordinator;->errors:Lio/reactivex/internal/util/AtomicThrowable;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Lio/reactivex/internal/util/AtomicThrowable;->get()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Throwable;

    .line 280
    .restart local v8    # "ex":Ljava/lang/Throwable;
    if-eqz v8, :cond_11

    .line 281
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableZip$ZipCoordinator;->errors:Lio/reactivex/internal/util/AtomicThrowable;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Lio/reactivex/internal/util/AtomicThrowable;->terminate()Ljava/lang/Throwable;

    move-result-object v23

    move-object/from16 v0, v23

    invoke-interface {v2, v0}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V
    :try_end_3
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_2

    goto/16 :goto_0

    .line 290
    .end local v4    # "d":Z
    .end local v5    # "empty":Z
    .end local v8    # "ex":Ljava/lang/Throwable;
    .end local v15    # "q":Lio/reactivex/internal/fuseable/SimpleQueue;, "Lio/reactivex/internal/fuseable/SimpleQueue<TT;>;"
    .end local v21    # "v":Ljava/lang/Object;, "TT;"
    :catch_2
    move-exception v8

    .line 291
    .restart local v8    # "ex":Ljava/lang/Throwable;
    invoke-static {v8}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 292
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableZip$ZipCoordinator;->errors:Lio/reactivex/internal/util/AtomicThrowable;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    invoke-virtual {v0, v8}, Lio/reactivex/internal/util/AtomicThrowable;->addThrowable(Ljava/lang/Throwable;)Z

    .line 293
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lio/reactivex/internal/operators/flowable/FlowableZip$ZipCoordinator;->delayErrors:Z

    move/from16 v23, v0

    if-nez v23, :cond_13

    .line 294
    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/flowable/FlowableZip$ZipCoordinator;->cancelAll()V

    .line 295
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableZip$ZipCoordinator;->errors:Lio/reactivex/internal/util/AtomicThrowable;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Lio/reactivex/internal/util/AtomicThrowable;->terminate()Ljava/lang/Throwable;

    move-result-object v23

    move-object/from16 v0, v23

    invoke-interface {v2, v0}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto/16 :goto_0

    .line 274
    .end local v8    # "ex":Ljava/lang/Throwable;
    .restart local v4    # "d":Z
    .restart local v15    # "q":Lio/reactivex/internal/fuseable/SimpleQueue;, "Lio/reactivex/internal/fuseable/SimpleQueue<TT;>;"
    :cond_f
    const/16 v21, 0x0

    goto :goto_7

    .line 276
    .restart local v21    # "v":Ljava/lang/Object;, "TT;"
    :cond_10
    const/4 v5, 0x0

    goto :goto_8

    .line 283
    .restart local v5    # "empty":Z
    .restart local v8    # "ex":Ljava/lang/Throwable;
    :cond_11
    :try_start_4
    invoke-interface {v2}, Lorg/reactivestreams/Subscriber;->onComplete()V

    goto/16 :goto_0

    .line 287
    .end local v8    # "ex":Ljava/lang/Throwable;
    :cond_12
    if-nez v5, :cond_13

    .line 288
    aput-object v21, v22, v11
    :try_end_4
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_2

    .line 268
    .end local v4    # "d":Z
    .end local v5    # "empty":Z
    .end local v15    # "q":Lio/reactivex/internal/fuseable/SimpleQueue;, "Lio/reactivex/internal/fuseable/SimpleQueue<TT;>;"
    .end local v21    # "v":Ljava/lang/Object;, "TT;"
    :cond_13
    add-int/lit8 v11, v11, 0x1

    goto :goto_6

    .line 304
    .end local v10    # "inner":Lio/reactivex/internal/operators/flowable/FlowableZip$ZipSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableZip$ZipSubscriber<TT;TR;>;"
    .end local v11    # "j":I
    :cond_14
    const-wide/16 v24, 0x0

    cmp-long v23, v6, v24

    if-eqz v23, :cond_16

    .line 306
    move-object/from16 v3, v16

    .local v3, "arr$":[Lio/reactivex/internal/operators/flowable/FlowableZip$ZipSubscriber;
    array-length v12, v3

    .local v12, "len$":I
    const/4 v9, 0x0

    .local v9, "i$":I
    :goto_9
    if-ge v9, v12, :cond_15

    aget-object v10, v3, v9

    .line 307
    .restart local v10    # "inner":Lio/reactivex/internal/operators/flowable/FlowableZip$ZipSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableZip$ZipSubscriber<TT;TR;>;"
    invoke-virtual {v10, v6, v7}, Lio/reactivex/internal/operators/flowable/FlowableZip$ZipSubscriber;->request(J)V

    .line 306
    add-int/lit8 v9, v9, 0x1

    goto :goto_9

    .line 310
    .end local v10    # "inner":Lio/reactivex/internal/operators/flowable/FlowableZip$ZipSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableZip$ZipSubscriber<TT;TR;>;"
    :cond_15
    const-wide v24, 0x7fffffffffffffffL

    cmp-long v23, v18, v24

    if-eqz v23, :cond_16

    .line 311
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableZip$ZipCoordinator;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    move-object/from16 v23, v0

    neg-long v0, v6

    move-wide/from16 v24, v0

    invoke-virtual/range {v23 .. v25}, Ljava/util/concurrent/atomic/AtomicLong;->addAndGet(J)J

    .line 315
    .end local v3    # "arr$":[Lio/reactivex/internal/operators/flowable/FlowableZip$ZipSubscriber;
    .end local v9    # "i$":I
    .end local v12    # "len$":I
    :cond_16
    neg-int v0, v13

    move/from16 v23, v0

    move-object/from16 v0, p0

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Lio/reactivex/internal/operators/flowable/FlowableZip$ZipCoordinator;->addAndGet(I)I

    move-result v13

    .line 316
    if-nez v13, :cond_2

    goto/16 :goto_0
.end method

.method error(Lio/reactivex/internal/operators/flowable/FlowableZip$ZipSubscriber;Ljava/lang/Throwable;)V
    .locals 1
    .param p2, "e"    # Ljava/lang/Throwable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/internal/operators/flowable/FlowableZip$ZipSubscriber",
            "<TT;TR;>;",
            "Ljava/lang/Throwable;",
            ")V"
        }
    .end annotation

    .prologue
    .line 149
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableZip$ZipCoordinator;, "Lio/reactivex/internal/operators/flowable/FlowableZip$ZipCoordinator<TT;TR;>;"
    .local p1, "inner":Lio/reactivex/internal/operators/flowable/FlowableZip$ZipSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableZip$ZipSubscriber<TT;TR;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableZip$ZipCoordinator;->errors:Lio/reactivex/internal/util/AtomicThrowable;

    invoke-virtual {v0, p2}, Lio/reactivex/internal/util/AtomicThrowable;->addThrowable(Ljava/lang/Throwable;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 150
    const/4 v0, 0x1

    iput-boolean v0, p1, Lio/reactivex/internal/operators/flowable/FlowableZip$ZipSubscriber;->done:Z

    .line 151
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableZip$ZipCoordinator;->drain()V

    .line 155
    :goto_0
    return-void

    .line 153
    :cond_0
    invoke-static {p2}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public request(J)V
    .locals 1
    .param p1, "n"    # J

    .prologue
    .line 133
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableZip$ZipCoordinator;, "Lio/reactivex/internal/operators/flowable/FlowableZip$ZipCoordinator<TT;TR;>;"
    invoke-static {p1, p2}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->validate(J)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 134
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableZip$ZipCoordinator;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-static {v0, p1, p2}, Lio/reactivex/internal/util/BackpressureHelper;->add(Ljava/util/concurrent/atomic/AtomicLong;J)J

    .line 135
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableZip$ZipCoordinator;->drain()V

    .line 137
    :cond_0
    return-void
.end method

.method subscribe([Lorg/reactivestreams/Publisher;I)V
    .locals 4
    .param p2, "n"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lorg/reactivestreams/Publisher",
            "<+TT;>;I)V"
        }
    .end annotation

    .prologue
    .line 122
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableZip$ZipCoordinator;, "Lio/reactivex/internal/operators/flowable/FlowableZip$ZipCoordinator<TT;TR;>;"
    .local p1, "sources":[Lorg/reactivestreams/Publisher;, "[Lorg/reactivestreams/Publisher<+TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableZip$ZipCoordinator;->subscribers:[Lio/reactivex/internal/operators/flowable/FlowableZip$ZipSubscriber;

    .line 123
    .local v0, "a":[Lio/reactivex/internal/operators/flowable/FlowableZip$ZipSubscriber;, "[Lio/reactivex/internal/operators/flowable/FlowableZip$ZipSubscriber<TT;TR;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, p2, :cond_0

    .line 124
    iget-boolean v2, p0, Lio/reactivex/internal/operators/flowable/FlowableZip$ZipCoordinator;->cancelled:Z

    if-nez v2, :cond_0

    iget-boolean v2, p0, Lio/reactivex/internal/operators/flowable/FlowableZip$ZipCoordinator;->delayErrors:Z

    if-nez v2, :cond_1

    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableZip$ZipCoordinator;->errors:Lio/reactivex/internal/util/AtomicThrowable;

    invoke-virtual {v2}, Lio/reactivex/internal/util/AtomicThrowable;->get()Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 129
    :cond_0
    return-void

    .line 127
    :cond_1
    aget-object v2, p1, v1

    aget-object v3, v0, v1

    invoke-interface {v2, v3}, Lorg/reactivestreams/Publisher;->subscribe(Lorg/reactivestreams/Subscriber;)V

    .line 123
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method
