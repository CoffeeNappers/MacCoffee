.class final Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapSubscriber;
.super Ljava/util/concurrent/atomic/AtomicInteger;
.source "FlowableSwitchMap.java"

# interfaces
.implements Lio/reactivex/FlowableSubscriber;
.implements Lorg/reactivestreams/Subscription;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/flowable/FlowableSwitchMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "SwitchMapSubscriber"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "R:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/concurrent/atomic/AtomicInteger;",
        "Lio/reactivex/FlowableSubscriber",
        "<TT;>;",
        "Lorg/reactivestreams/Subscription;"
    }
.end annotation


# static fields
.field static final CANCELLED:Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapInnerSubscriber;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapInnerSubscriber",
            "<",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private static final serialVersionUID:J = -0x3072c973d405526bL


# instance fields
.field final active:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapInnerSubscriber",
            "<TT;TR;>;>;"
        }
    .end annotation
.end field

.field final actual:Lorg/reactivestreams/Subscriber;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/reactivestreams/Subscriber",
            "<-TR;>;"
        }
    .end annotation
.end field

.field final bufferSize:I

.field volatile cancelled:Z

.field final delayErrors:Z

.field volatile done:Z

.field final error:Lio/reactivex/internal/util/AtomicThrowable;

.field final mapper:Lio/reactivex/functions/Function;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Function",
            "<-TT;+",
            "Lorg/reactivestreams/Publisher",
            "<+TR;>;>;"
        }
    .end annotation
.end field

.field final requested:Ljava/util/concurrent/atomic/AtomicLong;

.field s:Lorg/reactivestreams/Subscription;

.field volatile unique:J


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    .line 74
    new-instance v0, Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapInnerSubscriber;

    const/4 v1, 0x0

    const-wide/16 v2, -0x1

    const/4 v4, 0x1

    invoke-direct {v0, v1, v2, v3, v4}, Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapInnerSubscriber;-><init>(Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapSubscriber;JI)V

    sput-object v0, Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapSubscriber;->CANCELLED:Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapInnerSubscriber;

    .line 75
    sget-object v0, Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapSubscriber;->CANCELLED:Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapInnerSubscriber;

    invoke-virtual {v0}, Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapInnerSubscriber;->cancel()V

    .line 76
    return-void
.end method

.method constructor <init>(Lorg/reactivestreams/Subscriber;Lio/reactivex/functions/Function;IZ)V
    .locals 1
    .param p3, "bufferSize"    # I
    .param p4, "delayErrors"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber",
            "<-TR;>;",
            "Lio/reactivex/functions/Function",
            "<-TT;+",
            "Lorg/reactivestreams/Publisher",
            "<+TR;>;>;IZ)V"
        }
    .end annotation

    .prologue
    .line 82
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapSubscriber<TT;TR;>;"
    .local p1, "actual":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TR;>;"
    .local p2, "mapper":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-TT;+Lorg/reactivestreams/Publisher<+TR;>;>;"
    invoke-direct {p0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    .line 68
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapSubscriber;->active:Ljava/util/concurrent/atomic/AtomicReference;

    .line 70
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapSubscriber;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    .line 83
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    .line 84
    iput-object p2, p0, Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapSubscriber;->mapper:Lio/reactivex/functions/Function;

    .line 85
    iput p3, p0, Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapSubscriber;->bufferSize:I

    .line 86
    iput-boolean p4, p0, Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapSubscriber;->delayErrors:Z

    .line 87
    new-instance v0, Lio/reactivex/internal/util/AtomicThrowable;

    invoke-direct {v0}, Lio/reactivex/internal/util/AtomicThrowable;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapSubscriber;->error:Lio/reactivex/internal/util/AtomicThrowable;

    .line 88
    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 1

    .prologue
    .line 172
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapSubscriber<TT;TR;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapSubscriber;->cancelled:Z

    if-nez v0, :cond_0

    .line 173
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapSubscriber;->cancelled:Z

    .line 174
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v0}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 176
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapSubscriber;->disposeInner()V

    .line 178
    :cond_0
    return-void
.end method

.method disposeInner()V
    .locals 3

    .prologue
    .line 182
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapSubscriber<TT;TR;>;"
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapSubscriber;->active:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapInnerSubscriber;

    .line 183
    .local v0, "a":Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapInnerSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapInnerSubscriber<TT;TR;>;"
    sget-object v1, Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapSubscriber;->CANCELLED:Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapInnerSubscriber;

    if-eq v0, v1, :cond_0

    .line 184
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapSubscriber;->active:Ljava/util/concurrent/atomic/AtomicReference;

    sget-object v2, Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapSubscriber;->CANCELLED:Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapInnerSubscriber;

    invoke-virtual {v1, v2}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "a":Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapInnerSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapInnerSubscriber<TT;TR;>;"
    check-cast v0, Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapInnerSubscriber;

    .line 185
    .restart local v0    # "a":Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapInnerSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapInnerSubscriber<TT;TR;>;"
    sget-object v1, Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapSubscriber;->CANCELLED:Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapInnerSubscriber;

    if-eq v0, v1, :cond_0

    if-eqz v0, :cond_0

    .line 186
    invoke-virtual {v0}, Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapInnerSubscriber;->cancel()V

    .line 189
    :cond_0
    return-void
.end method

.method drain()V
    .locals 22

    .prologue
    .line 192
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapSubscriber<TT;TR;>;"
    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapSubscriber;->getAndIncrement()I

    move-result v18

    if-eqz v18, :cond_1

    .line 332
    :cond_0
    :goto_0
    return-void

    .line 196
    :cond_1
    move-object/from16 v0, p0

    iget-object v4, v0, Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    .line 198
    .local v4, "a":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TR;>;"
    const/4 v12, 0x1

    .line 202
    .local v12, "missing":I
    :cond_2
    :goto_1
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapSubscriber;->cancelled:Z

    move/from16 v18, v0

    if-eqz v18, :cond_3

    .line 203
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapSubscriber;->active:Ljava/util/concurrent/atomic/AtomicReference;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    invoke-virtual/range {v18 .. v19}, Ljava/util/concurrent/atomic/AtomicReference;->lazySet(Ljava/lang/Object;)V

    goto :goto_0

    .line 207
    :cond_3
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapSubscriber;->done:Z

    move/from16 v18, v0

    if-eqz v18, :cond_7

    .line 208
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapSubscriber;->delayErrors:Z

    move/from16 v18, v0

    if-eqz v18, :cond_5

    .line 209
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapSubscriber;->active:Ljava/util/concurrent/atomic/AtomicReference;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v18

    if-nez v18, :cond_7

    .line 210
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapSubscriber;->error:Lio/reactivex/internal/util/AtomicThrowable;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lio/reactivex/internal/util/AtomicThrowable;->get()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Throwable;

    .line 211
    .local v9, "err":Ljava/lang/Throwable;
    if-eqz v9, :cond_4

    .line 212
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapSubscriber;->error:Lio/reactivex/internal/util/AtomicThrowable;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lio/reactivex/internal/util/AtomicThrowable;->terminate()Ljava/lang/Throwable;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-interface {v4, v0}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 214
    :cond_4
    invoke-interface {v4}, Lorg/reactivestreams/Subscriber;->onComplete()V

    goto :goto_0

    .line 219
    .end local v9    # "err":Ljava/lang/Throwable;
    :cond_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapSubscriber;->error:Lio/reactivex/internal/util/AtomicThrowable;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lio/reactivex/internal/util/AtomicThrowable;->get()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Throwable;

    .line 220
    .restart local v9    # "err":Ljava/lang/Throwable;
    if-eqz v9, :cond_6

    .line 221
    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapSubscriber;->disposeInner()V

    .line 222
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapSubscriber;->error:Lio/reactivex/internal/util/AtomicThrowable;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lio/reactivex/internal/util/AtomicThrowable;->terminate()Ljava/lang/Throwable;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-interface {v4, v0}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 225
    :cond_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapSubscriber;->active:Ljava/util/concurrent/atomic/AtomicReference;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v18

    if-nez v18, :cond_7

    .line 226
    invoke-interface {v4}, Lorg/reactivestreams/Subscriber;->onComplete()V

    goto/16 :goto_0

    .line 232
    .end local v9    # "err":Ljava/lang/Throwable;
    :cond_7
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapSubscriber;->active:Ljava/util/concurrent/atomic/AtomicReference;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapInnerSubscriber;

    .line 233
    .local v11, "inner":Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapInnerSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapInnerSubscriber<TT;TR;>;"
    if-eqz v11, :cond_8

    iget-object v13, v11, Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapInnerSubscriber;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    .line 234
    .local v13, "q":Lio/reactivex/internal/fuseable/SimpleQueue;, "Lio/reactivex/internal/fuseable/SimpleQueue<TR;>;"
    :goto_2
    if-eqz v13, :cond_f

    .line 235
    iget-boolean v0, v11, Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapInnerSubscriber;->done:Z

    move/from16 v18, v0

    if-eqz v18, :cond_b

    .line 236
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapSubscriber;->delayErrors:Z

    move/from16 v18, v0

    if-nez v18, :cond_a

    .line 237
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapSubscriber;->error:Lio/reactivex/internal/util/AtomicThrowable;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lio/reactivex/internal/util/AtomicThrowable;->get()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Throwable;

    .line 238
    .restart local v9    # "err":Ljava/lang/Throwable;
    if-eqz v9, :cond_9

    .line 239
    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapSubscriber;->disposeInner()V

    .line 240
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapSubscriber;->error:Lio/reactivex/internal/util/AtomicThrowable;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lio/reactivex/internal/util/AtomicThrowable;->terminate()Ljava/lang/Throwable;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-interface {v4, v0}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto/16 :goto_0

    .line 233
    .end local v9    # "err":Ljava/lang/Throwable;
    .end local v13    # "q":Lio/reactivex/internal/fuseable/SimpleQueue;, "Lio/reactivex/internal/fuseable/SimpleQueue<TR;>;"
    :cond_8
    const/4 v13, 0x0

    goto :goto_2

    .line 243
    .restart local v9    # "err":Ljava/lang/Throwable;
    .restart local v13    # "q":Lio/reactivex/internal/fuseable/SimpleQueue;, "Lio/reactivex/internal/fuseable/SimpleQueue<TR;>;"
    :cond_9
    invoke-interface {v13}, Lio/reactivex/internal/fuseable/SimpleQueue;->isEmpty()Z

    move-result v18

    if-eqz v18, :cond_b

    .line 244
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapSubscriber;->active:Ljava/util/concurrent/atomic/AtomicReference;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v0, v11, v1}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    goto/16 :goto_1

    .line 248
    .end local v9    # "err":Ljava/lang/Throwable;
    :cond_a
    invoke-interface {v13}, Lio/reactivex/internal/fuseable/SimpleQueue;->isEmpty()Z

    move-result v18

    if-eqz v18, :cond_b

    .line 249
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapSubscriber;->active:Ljava/util/concurrent/atomic/AtomicReference;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v0, v11, v1}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    goto/16 :goto_1

    .line 255
    :cond_b
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapSubscriber;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v14

    .line 256
    .local v14, "r":J
    const-wide/16 v6, 0x0

    .line 257
    .local v6, "e":J
    const/16 v16, 0x0

    .line 259
    .local v16, "retry":Z
    :goto_3
    cmp-long v18, v6, v14

    if-eqz v18, :cond_c

    .line 260
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapSubscriber;->cancelled:Z

    move/from16 v18, v0

    if-nez v18, :cond_0

    .line 264
    iget-boolean v5, v11, Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapInnerSubscriber;->done:Z

    .line 268
    .local v5, "d":Z
    :try_start_0
    invoke-interface {v13}, Lio/reactivex/internal/fuseable/SimpleQueue;->poll()Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v17

    .line 276
    :goto_4
    if-nez v17, :cond_10

    const/4 v8, 0x1

    .line 278
    .local v8, "empty":Z
    :goto_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapSubscriber;->active:Ljava/util/concurrent/atomic/AtomicReference;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v18

    move-object/from16 v0, v18

    if-eq v11, v0, :cond_11

    .line 279
    const/16 v16, 0x1

    .line 313
    .end local v5    # "d":Z
    .end local v8    # "empty":Z
    :cond_c
    :goto_6
    const-wide/16 v18, 0x0

    cmp-long v18, v6, v18

    if-eqz v18, :cond_e

    .line 314
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapSubscriber;->cancelled:Z

    move/from16 v18, v0

    if-nez v18, :cond_e

    .line 315
    const-wide v18, 0x7fffffffffffffffL

    cmp-long v18, v14, v18

    if-eqz v18, :cond_d

    .line 316
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapSubscriber;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    move-object/from16 v18, v0

    neg-long v0, v6

    move-wide/from16 v20, v0

    move-object/from16 v0, v18

    move-wide/from16 v1, v20

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicLong;->addAndGet(J)J

    .line 318
    :cond_d
    invoke-virtual {v11}, Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapInnerSubscriber;->get()Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Lorg/reactivestreams/Subscription;

    move-object/from16 v0, v18

    invoke-interface {v0, v6, v7}, Lorg/reactivestreams/Subscription;->request(J)V

    .line 322
    :cond_e
    if-nez v16, :cond_2

    .line 327
    .end local v6    # "e":J
    .end local v14    # "r":J
    .end local v16    # "retry":Z
    :cond_f
    neg-int v0, v12

    move/from16 v18, v0

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapSubscriber;->addAndGet(I)I

    move-result v12

    .line 328
    if-nez v12, :cond_2

    goto/16 :goto_0

    .line 269
    .restart local v5    # "d":Z
    .restart local v6    # "e":J
    .restart local v14    # "r":J
    .restart local v16    # "retry":Z
    :catch_0
    move-exception v10

    .line 270
    .local v10, "ex":Ljava/lang/Throwable;
    invoke-static {v10}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 271
    invoke-virtual {v11}, Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapInnerSubscriber;->cancel()V

    .line 272
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapSubscriber;->error:Lio/reactivex/internal/util/AtomicThrowable;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v0, v10}, Lio/reactivex/internal/util/AtomicThrowable;->addThrowable(Ljava/lang/Throwable;)Z

    .line 273
    const/4 v5, 0x1

    .line 274
    const/16 v17, 0x0

    .local v17, "v":Ljava/lang/Object;, "TR;"
    goto :goto_4

    .line 276
    .end local v10    # "ex":Ljava/lang/Throwable;
    .end local v17    # "v":Ljava/lang/Object;, "TR;"
    :cond_10
    const/4 v8, 0x0

    goto :goto_5

    .line 283
    .restart local v8    # "empty":Z
    :cond_11
    if-eqz v5, :cond_14

    .line 284
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapSubscriber;->delayErrors:Z

    move/from16 v18, v0

    if-nez v18, :cond_13

    .line 285
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapSubscriber;->error:Lio/reactivex/internal/util/AtomicThrowable;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lio/reactivex/internal/util/AtomicThrowable;->get()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Throwable;

    .line 286
    .restart local v9    # "err":Ljava/lang/Throwable;
    if-eqz v9, :cond_12

    .line 287
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapSubscriber;->error:Lio/reactivex/internal/util/AtomicThrowable;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lio/reactivex/internal/util/AtomicThrowable;->terminate()Ljava/lang/Throwable;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-interface {v4, v0}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto/16 :goto_0

    .line 290
    :cond_12
    if-eqz v8, :cond_14

    .line 291
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapSubscriber;->active:Ljava/util/concurrent/atomic/AtomicReference;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v0, v11, v1}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 292
    const/16 v16, 0x1

    .line 293
    goto/16 :goto_6

    .line 296
    .end local v9    # "err":Ljava/lang/Throwable;
    :cond_13
    if-eqz v8, :cond_14

    .line 297
    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapSubscriber;->active:Ljava/util/concurrent/atomic/AtomicReference;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v0, v11, v1}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 298
    const/16 v16, 0x1

    .line 299
    goto/16 :goto_6

    .line 304
    :cond_14
    if-nez v8, :cond_c

    .line 308
    move-object/from16 v0, v17

    invoke-interface {v4, v0}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 310
    const-wide/16 v18, 0x1

    add-long v6, v6, v18

    .line 311
    goto/16 :goto_3
.end method

.method public onComplete()V
    .locals 1

    .prologue
    .line 151
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapSubscriber<TT;TR;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapSubscriber;->done:Z

    if-eqz v0, :cond_0

    .line 156
    :goto_0
    return-void

    .line 154
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapSubscriber;->done:Z

    .line 155
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapSubscriber;->drain()V

    goto :goto_0
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 138
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapSubscriber<TT;TR;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapSubscriber;->done:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapSubscriber;->error:Lio/reactivex/internal/util/AtomicThrowable;

    invoke-virtual {v0, p1}, Lio/reactivex/internal/util/AtomicThrowable;->addThrowable(Ljava/lang/Throwable;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 139
    iget-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapSubscriber;->delayErrors:Z

    if-nez v0, :cond_0

    .line 140
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapSubscriber;->disposeInner()V

    .line 142
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapSubscriber;->done:Z

    .line 143
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapSubscriber;->drain()V

    .line 147
    :goto_0
    return-void

    .line 145
    :cond_1
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 100
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapSubscriber<TT;TR;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget-boolean v6, p0, Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapSubscriber;->done:Z

    if-eqz v6, :cond_1

    .line 134
    :cond_0
    :goto_0
    return-void

    .line 104
    :cond_1
    iget-wide v6, p0, Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapSubscriber;->unique:J

    const-wide/16 v8, 0x1

    add-long v0, v6, v8

    .line 105
    .local v0, "c":J
    iput-wide v0, p0, Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapSubscriber;->unique:J

    .line 107
    iget-object v6, p0, Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapSubscriber;->active:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v6}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapInnerSubscriber;

    .line 108
    .local v3, "inner":Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapInnerSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapInnerSubscriber<TT;TR;>;"
    if-eqz v3, :cond_2

    .line 109
    invoke-virtual {v3}, Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapInnerSubscriber;->cancel()V

    .line 114
    :cond_2
    :try_start_0
    iget-object v6, p0, Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapSubscriber;->mapper:Lio/reactivex/functions/Function;

    invoke-interface {v6, p1}, Lio/reactivex/functions/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    const-string/jumbo v7, "The publisher returned is null"

    invoke-static {v6, v7}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/reactivestreams/Publisher;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 122
    .local v5, "p":Lorg/reactivestreams/Publisher;, "Lorg/reactivestreams/Publisher<+TR;>;"
    new-instance v4, Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapInnerSubscriber;

    iget v6, p0, Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapSubscriber;->bufferSize:I

    invoke-direct {v4, p0, v0, v1, v6}, Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapInnerSubscriber;-><init>(Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapSubscriber;JI)V

    .line 125
    .local v4, "nextInner":Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapInnerSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapInnerSubscriber<TT;TR;>;"
    :cond_3
    iget-object v6, p0, Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapSubscriber;->active:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v6}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v3

    .end local v3    # "inner":Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapInnerSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapInnerSubscriber<TT;TR;>;"
    check-cast v3, Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapInnerSubscriber;

    .line 126
    .restart local v3    # "inner":Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapInnerSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapInnerSubscriber<TT;TR;>;"
    sget-object v6, Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapSubscriber;->CANCELLED:Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapInnerSubscriber;

    if-eq v3, v6, :cond_0

    .line 129
    iget-object v6, p0, Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapSubscriber;->active:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v6, v3, v4}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 130
    invoke-interface {v5, v4}, Lorg/reactivestreams/Publisher;->subscribe(Lorg/reactivestreams/Subscriber;)V

    goto :goto_0

    .line 115
    .end local v4    # "nextInner":Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapInnerSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapInnerSubscriber<TT;TR;>;"
    .end local v5    # "p":Lorg/reactivestreams/Publisher;, "Lorg/reactivestreams/Publisher<+TR;>;"
    :catch_0
    move-exception v2

    .line 116
    .local v2, "e":Ljava/lang/Throwable;
    invoke-static {v2}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 117
    iget-object v6, p0, Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v6}, Lorg/reactivestreams/Subscription;->cancel()V

    .line 118
    invoke-virtual {p0, v2}, Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapSubscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onSubscribe(Lorg/reactivestreams/Subscription;)V
    .locals 1
    .param p1, "s"    # Lorg/reactivestreams/Subscription;

    .prologue
    .line 92
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapSubscriber<TT;TR;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-static {v0, p1}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->validate(Lorg/reactivestreams/Subscription;Lorg/reactivestreams/Subscription;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 93
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapSubscriber;->s:Lorg/reactivestreams/Subscription;

    .line 94
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v0, p0}, Lorg/reactivestreams/Subscriber;->onSubscribe(Lorg/reactivestreams/Subscription;)V

    .line 96
    :cond_0
    return-void
.end method

.method public request(J)V
    .locals 5
    .param p1, "n"    # J

    .prologue
    .line 160
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapSubscriber<TT;TR;>;"
    invoke-static {p1, p2}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->validate(J)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 161
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapSubscriber;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-static {v0, p1, p2}, Lio/reactivex/internal/util/BackpressureHelper;->add(Ljava/util/concurrent/atomic/AtomicLong;J)J

    .line 162
    iget-wide v0, p0, Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapSubscriber;->unique:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_1

    .line 163
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapSubscriber;->s:Lorg/reactivestreams/Subscription;

    const-wide v2, 0x7fffffffffffffffL

    invoke-interface {v0, v2, v3}, Lorg/reactivestreams/Subscription;->request(J)V

    .line 168
    :cond_0
    :goto_0
    return-void

    .line 165
    :cond_1
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableSwitchMap$SwitchMapSubscriber;->drain()V

    goto :goto_0
.end method
