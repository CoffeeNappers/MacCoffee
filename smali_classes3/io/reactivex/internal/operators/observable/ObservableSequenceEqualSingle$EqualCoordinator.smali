.class final Lio/reactivex/internal/operators/observable/ObservableSequenceEqualSingle$EqualCoordinator;
.super Ljava/util/concurrent/atomic/AtomicInteger;
.source "ObservableSequenceEqualSingle.java"

# interfaces
.implements Lio/reactivex/disposables/Disposable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/observable/ObservableSequenceEqualSingle;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "EqualCoordinator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/concurrent/atomic/AtomicInteger;",
        "Lio/reactivex/disposables/Disposable;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x55bcb3aaa8a061f8L


# instance fields
.field final actual:Lio/reactivex/SingleObserver;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/SingleObserver",
            "<-",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field volatile cancelled:Z

.field final comparer:Lio/reactivex/functions/BiPredicate;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/BiPredicate",
            "<-TT;-TT;>;"
        }
    .end annotation
.end field

.field final first:Lio/reactivex/ObservableSource;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/ObservableSource",
            "<+TT;>;"
        }
    .end annotation
.end field

.field final observers:[Lio/reactivex/internal/operators/observable/ObservableSequenceEqualSingle$EqualObserver;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Lio/reactivex/internal/operators/observable/ObservableSequenceEqualSingle$EqualObserver",
            "<TT;>;"
        }
    .end annotation
.end field

.field final resources:Lio/reactivex/internal/disposables/ArrayCompositeDisposable;

.field final second:Lio/reactivex/ObservableSource;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/ObservableSource",
            "<+TT;>;"
        }
    .end annotation
.end field

.field v1:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field v2:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lio/reactivex/SingleObserver;ILio/reactivex/ObservableSource;Lio/reactivex/ObservableSource;Lio/reactivex/functions/BiPredicate;)V
    .locals 5
    .param p2, "bufferSize"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/SingleObserver",
            "<-",
            "Ljava/lang/Boolean;",
            ">;I",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;",
            "Lio/reactivex/ObservableSource",
            "<+TT;>;",
            "Lio/reactivex/functions/BiPredicate",
            "<-TT;-TT;>;)V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableSequenceEqualSingle$EqualCoordinator;, "Lio/reactivex/internal/operators/observable/ObservableSequenceEqualSingle$EqualCoordinator<TT;>;"
    .local p1, "actual":Lio/reactivex/SingleObserver;, "Lio/reactivex/SingleObserver<-Ljava/lang/Boolean;>;"
    .local p3, "first":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT;>;"
    .local p4, "second":Lio/reactivex/ObservableSource;, "Lio/reactivex/ObservableSource<+TT;>;"
    .local p5, "comparer":Lio/reactivex/functions/BiPredicate;, "Lio/reactivex/functions/BiPredicate<-TT;-TT;>;"
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 71
    invoke-direct {p0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    .line 72
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableSequenceEqualSingle$EqualCoordinator;->actual:Lio/reactivex/SingleObserver;

    .line 73
    iput-object p3, p0, Lio/reactivex/internal/operators/observable/ObservableSequenceEqualSingle$EqualCoordinator;->first:Lio/reactivex/ObservableSource;

    .line 74
    iput-object p4, p0, Lio/reactivex/internal/operators/observable/ObservableSequenceEqualSingle$EqualCoordinator;->second:Lio/reactivex/ObservableSource;

    .line 75
    iput-object p5, p0, Lio/reactivex/internal/operators/observable/ObservableSequenceEqualSingle$EqualCoordinator;->comparer:Lio/reactivex/functions/BiPredicate;

    .line 77
    new-array v0, v4, [Lio/reactivex/internal/operators/observable/ObservableSequenceEqualSingle$EqualObserver;

    .line 78
    .local v0, "as":[Lio/reactivex/internal/operators/observable/ObservableSequenceEqualSingle$EqualObserver;, "[Lio/reactivex/internal/operators/observable/ObservableSequenceEqualSingle$EqualObserver<TT;>;"
    iput-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableSequenceEqualSingle$EqualCoordinator;->observers:[Lio/reactivex/internal/operators/observable/ObservableSequenceEqualSingle$EqualObserver;

    .line 79
    new-instance v1, Lio/reactivex/internal/operators/observable/ObservableSequenceEqualSingle$EqualObserver;

    invoke-direct {v1, p0, v2, p2}, Lio/reactivex/internal/operators/observable/ObservableSequenceEqualSingle$EqualObserver;-><init>(Lio/reactivex/internal/operators/observable/ObservableSequenceEqualSingle$EqualCoordinator;II)V

    aput-object v1, v0, v2

    .line 80
    new-instance v1, Lio/reactivex/internal/operators/observable/ObservableSequenceEqualSingle$EqualObserver;

    invoke-direct {v1, p0, v3, p2}, Lio/reactivex/internal/operators/observable/ObservableSequenceEqualSingle$EqualObserver;-><init>(Lio/reactivex/internal/operators/observable/ObservableSequenceEqualSingle$EqualCoordinator;II)V

    aput-object v1, v0, v3

    .line 81
    new-instance v1, Lio/reactivex/internal/disposables/ArrayCompositeDisposable;

    invoke-direct {v1, v4}, Lio/reactivex/internal/disposables/ArrayCompositeDisposable;-><init>(I)V

    iput-object v1, p0, Lio/reactivex/internal/operators/observable/ObservableSequenceEqualSingle$EqualCoordinator;->resources:Lio/reactivex/internal/disposables/ArrayCompositeDisposable;

    .line 82
    return-void
.end method


# virtual methods
.method cancel(Lio/reactivex/internal/queue/SpscLinkedArrayQueue;Lio/reactivex/internal/queue/SpscLinkedArrayQueue;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/internal/queue/SpscLinkedArrayQueue",
            "<TT;>;",
            "Lio/reactivex/internal/queue/SpscLinkedArrayQueue",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 114
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableSequenceEqualSingle$EqualCoordinator;, "Lio/reactivex/internal/operators/observable/ObservableSequenceEqualSingle$EqualCoordinator<TT;>;"
    .local p1, "q1":Lio/reactivex/internal/queue/SpscLinkedArrayQueue;, "Lio/reactivex/internal/queue/SpscLinkedArrayQueue<TT;>;"
    .local p2, "q2":Lio/reactivex/internal/queue/SpscLinkedArrayQueue;, "Lio/reactivex/internal/queue/SpscLinkedArrayQueue<TT;>;"
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableSequenceEqualSingle$EqualCoordinator;->cancelled:Z

    .line 115
    invoke-virtual {p1}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->clear()V

    .line 116
    invoke-virtual {p2}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->clear()V

    .line 117
    return-void
.end method

.method public dispose()V
    .locals 3

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableSequenceEqualSingle$EqualCoordinator;, "Lio/reactivex/internal/operators/observable/ObservableSequenceEqualSingle$EqualCoordinator<TT;>;"
    const/4 v2, 0x1

    .line 96
    iget-boolean v1, p0, Lio/reactivex/internal/operators/observable/ObservableSequenceEqualSingle$EqualCoordinator;->cancelled:Z

    if-nez v1, :cond_0

    .line 97
    iput-boolean v2, p0, Lio/reactivex/internal/operators/observable/ObservableSequenceEqualSingle$EqualCoordinator;->cancelled:Z

    .line 98
    iget-object v1, p0, Lio/reactivex/internal/operators/observable/ObservableSequenceEqualSingle$EqualCoordinator;->resources:Lio/reactivex/internal/disposables/ArrayCompositeDisposable;

    invoke-virtual {v1}, Lio/reactivex/internal/disposables/ArrayCompositeDisposable;->dispose()V

    .line 100
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableSequenceEqualSingle$EqualCoordinator;->getAndIncrement()I

    move-result v1

    if-nez v1, :cond_0

    .line 101
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableSequenceEqualSingle$EqualCoordinator;->observers:[Lio/reactivex/internal/operators/observable/ObservableSequenceEqualSingle$EqualObserver;

    .line 102
    .local v0, "as":[Lio/reactivex/internal/operators/observable/ObservableSequenceEqualSingle$EqualObserver;, "[Lio/reactivex/internal/operators/observable/ObservableSequenceEqualSingle$EqualObserver<TT;>;"
    const/4 v1, 0x0

    aget-object v1, v0, v1

    iget-object v1, v1, Lio/reactivex/internal/operators/observable/ObservableSequenceEqualSingle$EqualObserver;->queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    invoke-virtual {v1}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->clear()V

    .line 103
    aget-object v1, v0, v2

    iget-object v1, v1, Lio/reactivex/internal/operators/observable/ObservableSequenceEqualSingle$EqualObserver;->queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    invoke-virtual {v1}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->clear()V

    .line 106
    .end local v0    # "as":[Lio/reactivex/internal/operators/observable/ObservableSequenceEqualSingle$EqualObserver;, "[Lio/reactivex/internal/operators/observable/ObservableSequenceEqualSingle$EqualObserver<TT;>;"
    :cond_0
    return-void
.end method

.method drain()V
    .locals 17

    .prologue
    .line 120
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableSequenceEqualSingle$EqualCoordinator;, "Lio/reactivex/internal/operators/observable/ObservableSequenceEqualSingle$EqualCoordinator<TT;>;"
    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/observable/ObservableSequenceEqualSingle$EqualCoordinator;->getAndIncrement()I

    move-result v14

    if-eqz v14, :cond_0

    .line 219
    :goto_0
    return-void

    .line 124
    :cond_0
    const/4 v9, 0x1

    .line 125
    .local v9, "missed":I
    move-object/from16 v0, p0

    iget-object v1, v0, Lio/reactivex/internal/operators/observable/ObservableSequenceEqualSingle$EqualCoordinator;->observers:[Lio/reactivex/internal/operators/observable/ObservableSequenceEqualSingle$EqualObserver;

    .line 127
    .local v1, "as":[Lio/reactivex/internal/operators/observable/ObservableSequenceEqualSingle$EqualObserver;, "[Lio/reactivex/internal/operators/observable/ObservableSequenceEqualSingle$EqualObserver<TT;>;"
    const/4 v14, 0x0

    aget-object v12, v1, v14

    .line 128
    .local v12, "s1":Lio/reactivex/internal/operators/observable/ObservableSequenceEqualSingle$EqualObserver;, "Lio/reactivex/internal/operators/observable/ObservableSequenceEqualSingle$EqualObserver<TT;>;"
    iget-object v10, v12, Lio/reactivex/internal/operators/observable/ObservableSequenceEqualSingle$EqualObserver;->queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    .line 129
    .local v10, "q1":Lio/reactivex/internal/queue/SpscLinkedArrayQueue;, "Lio/reactivex/internal/queue/SpscLinkedArrayQueue<TT;>;"
    const/4 v14, 0x1

    aget-object v13, v1, v14

    .line 130
    .local v13, "s2":Lio/reactivex/internal/operators/observable/ObservableSequenceEqualSingle$EqualObserver;, "Lio/reactivex/internal/operators/observable/ObservableSequenceEqualSingle$EqualObserver<TT;>;"
    iget-object v11, v13, Lio/reactivex/internal/operators/observable/ObservableSequenceEqualSingle$EqualObserver;->queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    .line 135
    .local v11, "q2":Lio/reactivex/internal/queue/SpscLinkedArrayQueue;, "Lio/reactivex/internal/queue/SpscLinkedArrayQueue<TT;>;"
    :cond_1
    move-object/from16 v0, p0

    iget-boolean v14, v0, Lio/reactivex/internal/operators/observable/ObservableSequenceEqualSingle$EqualCoordinator;->cancelled:Z

    if-eqz v14, :cond_2

    .line 136
    invoke-virtual {v10}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->clear()V

    .line 137
    invoke-virtual {v11}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->clear()V

    goto :goto_0

    .line 141
    :cond_2
    iget-boolean v3, v12, Lio/reactivex/internal/operators/observable/ObservableSequenceEqualSingle$EqualObserver;->done:Z

    .line 143
    .local v3, "d1":Z
    if-eqz v3, :cond_3

    .line 144
    iget-object v5, v12, Lio/reactivex/internal/operators/observable/ObservableSequenceEqualSingle$EqualObserver;->error:Ljava/lang/Throwable;

    .line 145
    .local v5, "e":Ljava/lang/Throwable;
    if-eqz v5, :cond_3

    .line 146
    move-object/from16 v0, p0

    invoke-virtual {v0, v10, v11}, Lio/reactivex/internal/operators/observable/ObservableSequenceEqualSingle$EqualCoordinator;->cancel(Lio/reactivex/internal/queue/SpscLinkedArrayQueue;Lio/reactivex/internal/queue/SpscLinkedArrayQueue;)V

    .line 148
    move-object/from16 v0, p0

    iget-object v14, v0, Lio/reactivex/internal/operators/observable/ObservableSequenceEqualSingle$EqualCoordinator;->actual:Lio/reactivex/SingleObserver;

    invoke-interface {v14, v5}, Lio/reactivex/SingleObserver;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 153
    .end local v5    # "e":Ljava/lang/Throwable;
    :cond_3
    iget-boolean v4, v13, Lio/reactivex/internal/operators/observable/ObservableSequenceEqualSingle$EqualObserver;->done:Z

    .line 154
    .local v4, "d2":Z
    if-eqz v4, :cond_4

    .line 155
    iget-object v5, v13, Lio/reactivex/internal/operators/observable/ObservableSequenceEqualSingle$EqualObserver;->error:Ljava/lang/Throwable;

    .line 156
    .restart local v5    # "e":Ljava/lang/Throwable;
    if-eqz v5, :cond_4

    .line 157
    move-object/from16 v0, p0

    invoke-virtual {v0, v10, v11}, Lio/reactivex/internal/operators/observable/ObservableSequenceEqualSingle$EqualCoordinator;->cancel(Lio/reactivex/internal/queue/SpscLinkedArrayQueue;Lio/reactivex/internal/queue/SpscLinkedArrayQueue;)V

    .line 159
    move-object/from16 v0, p0

    iget-object v14, v0, Lio/reactivex/internal/operators/observable/ObservableSequenceEqualSingle$EqualCoordinator;->actual:Lio/reactivex/SingleObserver;

    invoke-interface {v14, v5}, Lio/reactivex/SingleObserver;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 164
    .end local v5    # "e":Ljava/lang/Throwable;
    :cond_4
    move-object/from16 v0, p0

    iget-object v14, v0, Lio/reactivex/internal/operators/observable/ObservableSequenceEqualSingle$EqualCoordinator;->v1:Ljava/lang/Object;

    if-nez v14, :cond_5

    .line 165
    invoke-virtual {v10}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->poll()Ljava/lang/Object;

    move-result-object v14

    move-object/from16 v0, p0

    iput-object v14, v0, Lio/reactivex/internal/operators/observable/ObservableSequenceEqualSingle$EqualCoordinator;->v1:Ljava/lang/Object;

    .line 167
    :cond_5
    move-object/from16 v0, p0

    iget-object v14, v0, Lio/reactivex/internal/operators/observable/ObservableSequenceEqualSingle$EqualCoordinator;->v1:Ljava/lang/Object;

    if-nez v14, :cond_7

    const/4 v6, 0x1

    .line 169
    .local v6, "e1":Z
    :goto_1
    move-object/from16 v0, p0

    iget-object v14, v0, Lio/reactivex/internal/operators/observable/ObservableSequenceEqualSingle$EqualCoordinator;->v2:Ljava/lang/Object;

    if-nez v14, :cond_6

    .line 170
    invoke-virtual {v11}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->poll()Ljava/lang/Object;

    move-result-object v14

    move-object/from16 v0, p0

    iput-object v14, v0, Lio/reactivex/internal/operators/observable/ObservableSequenceEqualSingle$EqualCoordinator;->v2:Ljava/lang/Object;

    .line 172
    :cond_6
    move-object/from16 v0, p0

    iget-object v14, v0, Lio/reactivex/internal/operators/observable/ObservableSequenceEqualSingle$EqualCoordinator;->v2:Ljava/lang/Object;

    if-nez v14, :cond_8

    const/4 v7, 0x1

    .line 174
    .local v7, "e2":Z
    :goto_2
    if-eqz v3, :cond_9

    if-eqz v4, :cond_9

    if-eqz v6, :cond_9

    if-eqz v7, :cond_9

    .line 175
    move-object/from16 v0, p0

    iget-object v14, v0, Lio/reactivex/internal/operators/observable/ObservableSequenceEqualSingle$EqualCoordinator;->actual:Lio/reactivex/SingleObserver;

    const/4 v15, 0x1

    invoke-static {v15}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v15

    invoke-interface {v14, v15}, Lio/reactivex/SingleObserver;->onSuccess(Ljava/lang/Object;)V

    goto/16 :goto_0

    .line 167
    .end local v6    # "e1":Z
    .end local v7    # "e2":Z
    :cond_7
    const/4 v6, 0x0

    goto :goto_1

    .line 172
    .restart local v6    # "e1":Z
    :cond_8
    const/4 v7, 0x0

    goto :goto_2

    .line 178
    .restart local v7    # "e2":Z
    :cond_9
    if-eqz v3, :cond_a

    if-eqz v4, :cond_a

    if-eq v6, v7, :cond_a

    .line 179
    move-object/from16 v0, p0

    invoke-virtual {v0, v10, v11}, Lio/reactivex/internal/operators/observable/ObservableSequenceEqualSingle$EqualCoordinator;->cancel(Lio/reactivex/internal/queue/SpscLinkedArrayQueue;Lio/reactivex/internal/queue/SpscLinkedArrayQueue;)V

    .line 181
    move-object/from16 v0, p0

    iget-object v14, v0, Lio/reactivex/internal/operators/observable/ObservableSequenceEqualSingle$EqualCoordinator;->actual:Lio/reactivex/SingleObserver;

    const/4 v15, 0x0

    invoke-static {v15}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v15

    invoke-interface {v14, v15}, Lio/reactivex/SingleObserver;->onSuccess(Ljava/lang/Object;)V

    goto/16 :goto_0

    .line 185
    :cond_a
    if-nez v6, :cond_c

    if-nez v7, :cond_c

    .line 189
    :try_start_0
    move-object/from16 v0, p0

    iget-object v14, v0, Lio/reactivex/internal/operators/observable/ObservableSequenceEqualSingle$EqualCoordinator;->comparer:Lio/reactivex/functions/BiPredicate;

    move-object/from16 v0, p0

    iget-object v15, v0, Lio/reactivex/internal/operators/observable/ObservableSequenceEqualSingle$EqualCoordinator;->v1:Ljava/lang/Object;

    move-object/from16 v0, p0

    iget-object v0, v0, Lio/reactivex/internal/operators/observable/ObservableSequenceEqualSingle$EqualCoordinator;->v2:Ljava/lang/Object;

    move-object/from16 v16, v0

    invoke-interface/range {v14 .. v16}, Lio/reactivex/functions/BiPredicate;->test(Ljava/lang/Object;Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    .line 198
    .local v2, "c":Z
    if-nez v2, :cond_b

    .line 199
    move-object/from16 v0, p0

    invoke-virtual {v0, v10, v11}, Lio/reactivex/internal/operators/observable/ObservableSequenceEqualSingle$EqualCoordinator;->cancel(Lio/reactivex/internal/queue/SpscLinkedArrayQueue;Lio/reactivex/internal/queue/SpscLinkedArrayQueue;)V

    .line 201
    move-object/from16 v0, p0

    iget-object v14, v0, Lio/reactivex/internal/operators/observable/ObservableSequenceEqualSingle$EqualCoordinator;->actual:Lio/reactivex/SingleObserver;

    const/4 v15, 0x0

    invoke-static {v15}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v15

    invoke-interface {v14, v15}, Lio/reactivex/SingleObserver;->onSuccess(Ljava/lang/Object;)V

    goto/16 :goto_0

    .line 190
    .end local v2    # "c":Z
    :catch_0
    move-exception v8

    .line 191
    .local v8, "ex":Ljava/lang/Throwable;
    invoke-static {v8}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 192
    move-object/from16 v0, p0

    invoke-virtual {v0, v10, v11}, Lio/reactivex/internal/operators/observable/ObservableSequenceEqualSingle$EqualCoordinator;->cancel(Lio/reactivex/internal/queue/SpscLinkedArrayQueue;Lio/reactivex/internal/queue/SpscLinkedArrayQueue;)V

    .line 194
    move-object/from16 v0, p0

    iget-object v14, v0, Lio/reactivex/internal/operators/observable/ObservableSequenceEqualSingle$EqualCoordinator;->actual:Lio/reactivex/SingleObserver;

    invoke-interface {v14, v8}, Lio/reactivex/SingleObserver;->onError(Ljava/lang/Throwable;)V

    goto/16 :goto_0

    .line 205
    .end local v8    # "ex":Ljava/lang/Throwable;
    .restart local v2    # "c":Z
    :cond_b
    const/4 v14, 0x0

    move-object/from16 v0, p0

    iput-object v14, v0, Lio/reactivex/internal/operators/observable/ObservableSequenceEqualSingle$EqualCoordinator;->v1:Ljava/lang/Object;

    .line 206
    const/4 v14, 0x0

    move-object/from16 v0, p0

    iput-object v14, v0, Lio/reactivex/internal/operators/observable/ObservableSequenceEqualSingle$EqualCoordinator;->v2:Ljava/lang/Object;

    .line 209
    .end local v2    # "c":Z
    :cond_c
    if-nez v6, :cond_d

    if-eqz v7, :cond_1

    .line 214
    :cond_d
    neg-int v14, v9

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lio/reactivex/internal/operators/observable/ObservableSequenceEqualSingle$EqualCoordinator;->addAndGet(I)I

    move-result v9

    .line 215
    if-nez v9, :cond_1

    goto/16 :goto_0
.end method

.method public isDisposed()Z
    .locals 1

    .prologue
    .line 110
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableSequenceEqualSingle$EqualCoordinator;, "Lio/reactivex/internal/operators/observable/ObservableSequenceEqualSingle$EqualCoordinator<TT;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableSequenceEqualSingle$EqualCoordinator;->cancelled:Z

    return v0
.end method

.method setDisposable(Lio/reactivex/disposables/Disposable;I)Z
    .locals 1
    .param p1, "s"    # Lio/reactivex/disposables/Disposable;
    .param p2, "index"    # I

    .prologue
    .line 85
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableSequenceEqualSingle$EqualCoordinator;, "Lio/reactivex/internal/operators/observable/ObservableSequenceEqualSingle$EqualCoordinator<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableSequenceEqualSingle$EqualCoordinator;->resources:Lio/reactivex/internal/disposables/ArrayCompositeDisposable;

    invoke-virtual {v0, p2, p1}, Lio/reactivex/internal/disposables/ArrayCompositeDisposable;->setResource(ILio/reactivex/disposables/Disposable;)Z

    move-result v0

    return v0
.end method

.method subscribe()V
    .locals 3

    .prologue
    .line 89
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableSequenceEqualSingle$EqualCoordinator;, "Lio/reactivex/internal/operators/observable/ObservableSequenceEqualSingle$EqualCoordinator<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableSequenceEqualSingle$EqualCoordinator;->observers:[Lio/reactivex/internal/operators/observable/ObservableSequenceEqualSingle$EqualObserver;

    .line 90
    .local v0, "as":[Lio/reactivex/internal/operators/observable/ObservableSequenceEqualSingle$EqualObserver;, "[Lio/reactivex/internal/operators/observable/ObservableSequenceEqualSingle$EqualObserver<TT;>;"
    iget-object v1, p0, Lio/reactivex/internal/operators/observable/ObservableSequenceEqualSingle$EqualCoordinator;->first:Lio/reactivex/ObservableSource;

    const/4 v2, 0x0

    aget-object v2, v0, v2

    invoke-interface {v1, v2}, Lio/reactivex/ObservableSource;->subscribe(Lio/reactivex/Observer;)V

    .line 91
    iget-object v1, p0, Lio/reactivex/internal/operators/observable/ObservableSequenceEqualSingle$EqualCoordinator;->second:Lio/reactivex/ObservableSource;

    const/4 v2, 0x1

    aget-object v2, v0, v2

    invoke-interface {v1, v2}, Lio/reactivex/ObservableSource;->subscribe(Lio/reactivex/Observer;)V

    .line 92
    return-void
.end method
