.class final Lio/reactivex/internal/operators/flowable/FlowableGenerate$GeneratorSubscription;
.super Ljava/util/concurrent/atomic/AtomicLong;
.source "FlowableGenerate.java"

# interfaces
.implements Lio/reactivex/Emitter;
.implements Lorg/reactivestreams/Subscription;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/flowable/FlowableGenerate;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "GeneratorSubscription"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "S:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/concurrent/atomic/AtomicLong;",
        "Lio/reactivex/Emitter",
        "<TT;>;",
        "Lorg/reactivestreams/Subscription;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x68ffc50b57428478L


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

.field final disposeState:Lio/reactivex/functions/Consumer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Consumer",
            "<-TS;>;"
        }
    .end annotation
.end field

.field final generator:Lio/reactivex/functions/BiFunction;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/BiFunction",
            "<TS;-",
            "Lio/reactivex/Emitter",
            "<TT;>;TS;>;"
        }
    .end annotation
.end field

.field hasNext:Z

.field state:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TS;"
        }
    .end annotation
.end field

.field terminate:Z


# direct methods
.method constructor <init>(Lorg/reactivestreams/Subscriber;Lio/reactivex/functions/BiFunction;Lio/reactivex/functions/Consumer;Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber",
            "<-TT;>;",
            "Lio/reactivex/functions/BiFunction",
            "<TS;-",
            "Lio/reactivex/Emitter",
            "<TT;>;TS;>;",
            "Lio/reactivex/functions/Consumer",
            "<-TS;>;TS;)V"
        }
    .end annotation

    .prologue
    .line 75
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableGenerate$GeneratorSubscription;, "Lio/reactivex/internal/operators/flowable/FlowableGenerate$GeneratorSubscription<TT;TS;>;"
    .local p1, "actual":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    .local p2, "generator":Lio/reactivex/functions/BiFunction;, "Lio/reactivex/functions/BiFunction<TS;-Lio/reactivex/Emitter<TT;>;TS;>;"
    .local p3, "disposeState":Lio/reactivex/functions/Consumer;, "Lio/reactivex/functions/Consumer<-TS;>;"
    .local p4, "initialState":Ljava/lang/Object;, "TS;"
    invoke-direct {p0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    .line 76
    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableGenerate$GeneratorSubscription;->actual:Lorg/reactivestreams/Subscriber;

    .line 77
    iput-object p2, p0, Lio/reactivex/internal/operators/flowable/FlowableGenerate$GeneratorSubscription;->generator:Lio/reactivex/functions/BiFunction;

    .line 78
    iput-object p3, p0, Lio/reactivex/internal/operators/flowable/FlowableGenerate$GeneratorSubscription;->disposeState:Lio/reactivex/functions/Consumer;

    .line 79
    iput-object p4, p0, Lio/reactivex/internal/operators/flowable/FlowableGenerate$GeneratorSubscription;->state:Ljava/lang/Object;

    .line 80
    return-void
.end method

.method private dispose(Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TS;)V"
        }
    .end annotation

    .prologue
    .line 143
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableGenerate$GeneratorSubscription;, "Lio/reactivex/internal/operators/flowable/FlowableGenerate$GeneratorSubscription<TT;TS;>;"
    .local p1, "s":Ljava/lang/Object;, "TS;"
    :try_start_0
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableGenerate$GeneratorSubscription;->disposeState:Lio/reactivex/functions/Consumer;

    invoke-interface {v1, p1}, Lio/reactivex/functions/Consumer;->accept(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 148
    :goto_0
    return-void

    .line 144
    :catch_0
    move-exception v0

    .line 145
    .local v0, "ex":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 146
    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method


# virtual methods
.method public cancel()V
    .locals 6

    .prologue
    .line 152
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableGenerate$GeneratorSubscription;, "Lio/reactivex/internal/operators/flowable/FlowableGenerate$GeneratorSubscription<TT;TS;>;"
    iget-boolean v1, p0, Lio/reactivex/internal/operators/flowable/FlowableGenerate$GeneratorSubscription;->cancelled:Z

    if-nez v1, :cond_0

    .line 153
    const/4 v1, 0x1

    iput-boolean v1, p0, Lio/reactivex/internal/operators/flowable/FlowableGenerate$GeneratorSubscription;->cancelled:Z

    .line 156
    const-wide/16 v2, 0x1

    invoke-static {p0, v2, v3}, Lio/reactivex/internal/util/BackpressureHelper;->add(Ljava/util/concurrent/atomic/AtomicLong;J)J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v1, v2, v4

    if-nez v1, :cond_0

    .line 157
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableGenerate$GeneratorSubscription;->state:Ljava/lang/Object;

    .line 158
    .local v0, "s":Ljava/lang/Object;, "TS;"
    const/4 v1, 0x0

    iput-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableGenerate$GeneratorSubscription;->state:Ljava/lang/Object;

    .line 159
    invoke-direct {p0, v0}, Lio/reactivex/internal/operators/flowable/FlowableGenerate$GeneratorSubscription;->dispose(Ljava/lang/Object;)V

    .line 162
    .end local v0    # "s":Ljava/lang/Object;, "TS;"
    :cond_0
    return-void
.end method

.method public onComplete()V
    .locals 1

    .prologue
    .line 195
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableGenerate$GeneratorSubscription;, "Lio/reactivex/internal/operators/flowable/FlowableGenerate$GeneratorSubscription<TT;TS;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableGenerate$GeneratorSubscription;->terminate:Z

    if-nez v0, :cond_0

    .line 196
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableGenerate$GeneratorSubscription;->terminate:Z

    .line 197
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableGenerate$GeneratorSubscription;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v0}, Lorg/reactivestreams/Subscriber;->onComplete()V

    .line 199
    :cond_0
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 182
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableGenerate$GeneratorSubscription;, "Lio/reactivex/internal/operators/flowable/FlowableGenerate$GeneratorSubscription<TT;TS;>;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableGenerate$GeneratorSubscription;->terminate:Z

    if-eqz v0, :cond_0

    .line 183
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    .line 191
    :goto_0
    return-void

    .line 185
    :cond_0
    if-nez p1, :cond_1

    .line 186
    new-instance p1, Ljava/lang/NullPointerException;

    .end local p1    # "t":Ljava/lang/Throwable;
    const-string/jumbo v0, "onError called with null. Null values are generally not allowed in 2.x operators and sources."

    invoke-direct {p1, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 188
    .restart local p1    # "t":Ljava/lang/Throwable;
    :cond_1
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableGenerate$GeneratorSubscription;->terminate:Z

    .line 189
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableGenerate$GeneratorSubscription;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v0, p1}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 166
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableGenerate$GeneratorSubscription;, "Lio/reactivex/internal/operators/flowable/FlowableGenerate$GeneratorSubscription<TT;TS;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableGenerate$GeneratorSubscription;->terminate:Z

    if-nez v0, :cond_0

    .line 167
    iget-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableGenerate$GeneratorSubscription;->hasNext:Z

    if-eqz v0, :cond_1

    .line 168
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "onNext already called in this generate turn"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lio/reactivex/internal/operators/flowable/FlowableGenerate$GeneratorSubscription;->onError(Ljava/lang/Throwable;)V

    .line 178
    :cond_0
    :goto_0
    return-void

    .line 170
    :cond_1
    if-nez p1, :cond_2

    .line 171
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "onNext called with null. Null values are generally not allowed in 2.x operators and sources."

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lio/reactivex/internal/operators/flowable/FlowableGenerate$GeneratorSubscription;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 173
    :cond_2
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableGenerate$GeneratorSubscription;->hasNext:Z

    .line 174
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableGenerate$GeneratorSubscription;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v0, p1}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public request(J)V
    .locals 13
    .param p1, "n"    # J

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableGenerate$GeneratorSubscription;, "Lio/reactivex/internal/operators/flowable/FlowableGenerate$GeneratorSubscription<TT;TS;>;"
    const-wide/16 v10, 0x0

    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 84
    invoke-static {p1, p2}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->validate(J)Z

    move-result v5

    if-nez v5, :cond_1

    .line 139
    :cond_0
    :goto_0
    return-void

    .line 87
    :cond_1
    invoke-static {p0, p1, p2}, Lio/reactivex/internal/util/BackpressureHelper;->add(Ljava/util/concurrent/atomic/AtomicLong;J)J

    move-result-wide v6

    cmp-long v5, v6, v10

    if-nez v5, :cond_0

    .line 91
    const-wide/16 v0, 0x0

    .line 93
    .local v0, "e":J
    iget-object v4, p0, Lio/reactivex/internal/operators/flowable/FlowableGenerate$GeneratorSubscription;->state:Ljava/lang/Object;

    .line 95
    .local v4, "s":Ljava/lang/Object;, "TS;"
    iget-object v3, p0, Lio/reactivex/internal/operators/flowable/FlowableGenerate$GeneratorSubscription;->generator:Lio/reactivex/functions/BiFunction;

    .line 98
    .local v3, "f":Lio/reactivex/functions/BiFunction;, "Lio/reactivex/functions/BiFunction<TS;-Lio/reactivex/Emitter<TT;>;TS;>;"
    :cond_2
    :goto_1
    cmp-long v5, v0, p1

    if-eqz v5, :cond_5

    .line 100
    iget-boolean v5, p0, Lio/reactivex/internal/operators/flowable/FlowableGenerate$GeneratorSubscription;->cancelled:Z

    if-eqz v5, :cond_3

    .line 101
    iput-object v8, p0, Lio/reactivex/internal/operators/flowable/FlowableGenerate$GeneratorSubscription;->state:Ljava/lang/Object;

    .line 102
    invoke-direct {p0, v4}, Lio/reactivex/internal/operators/flowable/FlowableGenerate$GeneratorSubscription;->dispose(Ljava/lang/Object;)V

    goto :goto_0

    .line 106
    :cond_3
    const/4 v5, 0x0

    iput-boolean v5, p0, Lio/reactivex/internal/operators/flowable/FlowableGenerate$GeneratorSubscription;->hasNext:Z

    .line 109
    :try_start_0
    invoke-interface {v3, v4, p0}, Lio/reactivex/functions/BiFunction;->apply(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v4

    .line 119
    iget-boolean v5, p0, Lio/reactivex/internal/operators/flowable/FlowableGenerate$GeneratorSubscription;->terminate:Z

    if-eqz v5, :cond_4

    .line 120
    iput-boolean v9, p0, Lio/reactivex/internal/operators/flowable/FlowableGenerate$GeneratorSubscription;->cancelled:Z

    .line 121
    iput-object v8, p0, Lio/reactivex/internal/operators/flowable/FlowableGenerate$GeneratorSubscription;->state:Ljava/lang/Object;

    .line 122
    invoke-direct {p0, v4}, Lio/reactivex/internal/operators/flowable/FlowableGenerate$GeneratorSubscription;->dispose(Ljava/lang/Object;)V

    goto :goto_0

    .line 110
    :catch_0
    move-exception v2

    .line 111
    .local v2, "ex":Ljava/lang/Throwable;
    invoke-static {v2}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 112
    iput-boolean v9, p0, Lio/reactivex/internal/operators/flowable/FlowableGenerate$GeneratorSubscription;->cancelled:Z

    .line 113
    iput-object v8, p0, Lio/reactivex/internal/operators/flowable/FlowableGenerate$GeneratorSubscription;->state:Ljava/lang/Object;

    .line 114
    invoke-virtual {p0, v2}, Lio/reactivex/internal/operators/flowable/FlowableGenerate$GeneratorSubscription;->onError(Ljava/lang/Throwable;)V

    .line 115
    invoke-direct {p0, v4}, Lio/reactivex/internal/operators/flowable/FlowableGenerate$GeneratorSubscription;->dispose(Ljava/lang/Object;)V

    goto :goto_0

    .line 126
    .end local v2    # "ex":Ljava/lang/Throwable;
    :cond_4
    const-wide/16 v6, 0x1

    add-long/2addr v0, v6

    goto :goto_1

    .line 129
    :cond_5
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableGenerate$GeneratorSubscription;->get()J

    move-result-wide p1

    .line 130
    cmp-long v5, v0, p1

    if-nez v5, :cond_2

    .line 131
    iput-object v4, p0, Lio/reactivex/internal/operators/flowable/FlowableGenerate$GeneratorSubscription;->state:Ljava/lang/Object;

    .line 132
    neg-long v6, v0

    invoke-virtual {p0, v6, v7}, Lio/reactivex/internal/operators/flowable/FlowableGenerate$GeneratorSubscription;->addAndGet(J)J

    move-result-wide p1

    .line 133
    cmp-long v5, p1, v10

    if-eqz v5, :cond_0

    .line 136
    const-wide/16 v0, 0x0

    goto :goto_1
.end method
