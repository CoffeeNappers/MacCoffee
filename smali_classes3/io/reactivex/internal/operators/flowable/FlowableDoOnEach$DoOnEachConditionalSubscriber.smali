.class final Lio/reactivex/internal/operators/flowable/FlowableDoOnEach$DoOnEachConditionalSubscriber;
.super Lio/reactivex/internal/subscribers/BasicFuseableConditionalSubscriber;
.source "FlowableDoOnEach.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/flowable/FlowableDoOnEach;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "DoOnEachConditionalSubscriber"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/internal/subscribers/BasicFuseableConditionalSubscriber",
        "<TT;TT;>;"
    }
.end annotation


# instance fields
.field final onAfterTerminate:Lio/reactivex/functions/Action;

.field final onComplete:Lio/reactivex/functions/Action;

.field final onError:Lio/reactivex/functions/Consumer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Consumer",
            "<-",
            "Ljava/lang/Throwable;",
            ">;"
        }
    .end annotation
.end field

.field final onNext:Lio/reactivex/functions/Consumer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Consumer",
            "<-TT;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lio/reactivex/internal/fuseable/ConditionalSubscriber;Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Action;Lio/reactivex/functions/Action;)V
    .locals 0
    .param p4, "onComplete"    # Lio/reactivex/functions/Action;
    .param p5, "onAfterTerminate"    # Lio/reactivex/functions/Action;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/internal/fuseable/ConditionalSubscriber",
            "<-TT;>;",
            "Lio/reactivex/functions/Consumer",
            "<-TT;>;",
            "Lio/reactivex/functions/Consumer",
            "<-",
            "Ljava/lang/Throwable;",
            ">;",
            "Lio/reactivex/functions/Action;",
            "Lio/reactivex/functions/Action;",
            ")V"
        }
    .end annotation

    .prologue
    .line 183
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableDoOnEach$DoOnEachConditionalSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableDoOnEach$DoOnEachConditionalSubscriber<TT;>;"
    .local p1, "actual":Lio/reactivex/internal/fuseable/ConditionalSubscriber;, "Lio/reactivex/internal/fuseable/ConditionalSubscriber<-TT;>;"
    .local p2, "onNext":Lio/reactivex/functions/Consumer;, "Lio/reactivex/functions/Consumer<-TT;>;"
    .local p3, "onError":Lio/reactivex/functions/Consumer;, "Lio/reactivex/functions/Consumer<-Ljava/lang/Throwable;>;"
    invoke-direct {p0, p1}, Lio/reactivex/internal/subscribers/BasicFuseableConditionalSubscriber;-><init>(Lio/reactivex/internal/fuseable/ConditionalSubscriber;)V

    .line 184
    iput-object p2, p0, Lio/reactivex/internal/operators/flowable/FlowableDoOnEach$DoOnEachConditionalSubscriber;->onNext:Lio/reactivex/functions/Consumer;

    .line 185
    iput-object p3, p0, Lio/reactivex/internal/operators/flowable/FlowableDoOnEach$DoOnEachConditionalSubscriber;->onError:Lio/reactivex/functions/Consumer;

    .line 186
    iput-object p4, p0, Lio/reactivex/internal/operators/flowable/FlowableDoOnEach$DoOnEachConditionalSubscriber;->onComplete:Lio/reactivex/functions/Action;

    .line 187
    iput-object p5, p0, Lio/reactivex/internal/operators/flowable/FlowableDoOnEach$DoOnEachConditionalSubscriber;->onAfterTerminate:Lio/reactivex/functions/Action;

    .line 188
    return-void
.end method


# virtual methods
.method public onComplete()V
    .locals 2

    .prologue
    .line 256
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableDoOnEach$DoOnEachConditionalSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableDoOnEach$DoOnEachConditionalSubscriber<TT;>;"
    iget-boolean v1, p0, Lio/reactivex/internal/operators/flowable/FlowableDoOnEach$DoOnEachConditionalSubscriber;->done:Z

    if-eqz v1, :cond_0

    .line 275
    :goto_0
    return-void

    .line 260
    :cond_0
    :try_start_0
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableDoOnEach$DoOnEachConditionalSubscriber;->onComplete:Lio/reactivex/functions/Action;

    invoke-interface {v1}, Lio/reactivex/functions/Action;->run()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_1

    .line 266
    const/4 v1, 0x1

    iput-boolean v1, p0, Lio/reactivex/internal/operators/flowable/FlowableDoOnEach$DoOnEachConditionalSubscriber;->done:Z

    .line 267
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableDoOnEach$DoOnEachConditionalSubscriber;->actual:Lio/reactivex/internal/fuseable/ConditionalSubscriber;

    invoke-interface {v1}, Lio/reactivex/internal/fuseable/ConditionalSubscriber;->onComplete()V

    .line 270
    :try_start_1
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableDoOnEach$DoOnEachConditionalSubscriber;->onAfterTerminate:Lio/reactivex/functions/Action;

    invoke-interface {v1}, Lio/reactivex/functions/Action;->run()V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 271
    :catch_0
    move-exception v0

    .line 272
    .local v0, "e":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 273
    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 261
    .end local v0    # "e":Ljava/lang/Throwable;
    :catch_1
    move-exception v0

    .line 262
    .restart local v0    # "e":Ljava/lang/Throwable;
    invoke-virtual {p0, v0}, Lio/reactivex/internal/operators/flowable/FlowableDoOnEach$DoOnEachConditionalSubscriber;->fail(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 7
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableDoOnEach$DoOnEachConditionalSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableDoOnEach$DoOnEachConditionalSubscriber<TT;>;"
    const/4 v6, 0x1

    .line 229
    iget-boolean v2, p0, Lio/reactivex/internal/operators/flowable/FlowableDoOnEach$DoOnEachConditionalSubscriber;->done:Z

    if-eqz v2, :cond_0

    .line 230
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    .line 252
    :goto_0
    return-void

    .line 233
    :cond_0
    iput-boolean v6, p0, Lio/reactivex/internal/operators/flowable/FlowableDoOnEach$DoOnEachConditionalSubscriber;->done:Z

    .line 234
    const/4 v1, 0x1

    .line 236
    .local v1, "relay":Z
    :try_start_0
    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableDoOnEach$DoOnEachConditionalSubscriber;->onError:Lio/reactivex/functions/Consumer;

    invoke-interface {v2, p1}, Lio/reactivex/functions/Consumer;->accept(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_1

    .line 242
    :goto_1
    if-eqz v1, :cond_1

    .line 243
    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableDoOnEach$DoOnEachConditionalSubscriber;->actual:Lio/reactivex/internal/fuseable/ConditionalSubscriber;

    invoke-interface {v2, p1}, Lio/reactivex/internal/fuseable/ConditionalSubscriber;->onError(Ljava/lang/Throwable;)V

    .line 247
    :cond_1
    :try_start_1
    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableDoOnEach$DoOnEachConditionalSubscriber;->onAfterTerminate:Lio/reactivex/functions/Action;

    invoke-interface {v2}, Lio/reactivex/functions/Action;->run()V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 248
    :catch_0
    move-exception v0

    .line 249
    .local v0, "e":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 250
    invoke-static {v0}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 237
    .end local v0    # "e":Ljava/lang/Throwable;
    :catch_1
    move-exception v0

    .line 238
    .restart local v0    # "e":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 239
    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableDoOnEach$DoOnEachConditionalSubscriber;->actual:Lio/reactivex/internal/fuseable/ConditionalSubscriber;

    new-instance v3, Lio/reactivex/exceptions/CompositeException;

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Throwable;

    const/4 v5, 0x0

    aput-object p1, v4, v5

    aput-object v0, v4, v6

    invoke-direct {v3, v4}, Lio/reactivex/exceptions/CompositeException;-><init>([Ljava/lang/Throwable;)V

    invoke-interface {v2, v3}, Lio/reactivex/internal/fuseable/ConditionalSubscriber;->onError(Ljava/lang/Throwable;)V

    .line 240
    const/4 v1, 0x0

    goto :goto_1
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 192
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableDoOnEach$DoOnEachConditionalSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableDoOnEach$DoOnEachConditionalSubscriber<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget-boolean v1, p0, Lio/reactivex/internal/operators/flowable/FlowableDoOnEach$DoOnEachConditionalSubscriber;->done:Z

    if-eqz v1, :cond_0

    .line 209
    :goto_0
    return-void

    .line 196
    :cond_0
    iget v1, p0, Lio/reactivex/internal/operators/flowable/FlowableDoOnEach$DoOnEachConditionalSubscriber;->sourceMode:I

    if-eqz v1, :cond_1

    .line 197
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableDoOnEach$DoOnEachConditionalSubscriber;->actual:Lio/reactivex/internal/fuseable/ConditionalSubscriber;

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Lio/reactivex/internal/fuseable/ConditionalSubscriber;->onNext(Ljava/lang/Object;)V

    goto :goto_0

    .line 202
    :cond_1
    :try_start_0
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableDoOnEach$DoOnEachConditionalSubscriber;->onNext:Lio/reactivex/functions/Consumer;

    invoke-interface {v1, p1}, Lio/reactivex/functions/Consumer;->accept(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 208
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableDoOnEach$DoOnEachConditionalSubscriber;->actual:Lio/reactivex/internal/fuseable/ConditionalSubscriber;

    invoke-interface {v1, p1}, Lio/reactivex/internal/fuseable/ConditionalSubscriber;->onNext(Ljava/lang/Object;)V

    goto :goto_0

    .line 203
    :catch_0
    move-exception v0

    .line 204
    .local v0, "e":Ljava/lang/Throwable;
    invoke-virtual {p0, v0}, Lio/reactivex/internal/operators/flowable/FlowableDoOnEach$DoOnEachConditionalSubscriber;->fail(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public poll()Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .annotation build Lio/reactivex/annotations/Nullable;
    .end annotation

    .prologue
    .line 285
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableDoOnEach$DoOnEachConditionalSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableDoOnEach$DoOnEachConditionalSubscriber<TT;>;"
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableDoOnEach$DoOnEachConditionalSubscriber;->qs:Lio/reactivex/internal/fuseable/QueueSubscription;

    invoke-interface {v1}, Lio/reactivex/internal/fuseable/QueueSubscription;->poll()Ljava/lang/Object;

    move-result-object v0

    .line 287
    .local v0, "v":Ljava/lang/Object;, "TT;"
    if-eqz v0, :cond_1

    .line 289
    :try_start_0
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableDoOnEach$DoOnEachConditionalSubscriber;->onNext:Lio/reactivex/functions/Consumer;

    invoke-interface {v1, v0}, Lio/reactivex/functions/Consumer;->accept(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 291
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableDoOnEach$DoOnEachConditionalSubscriber;->onAfterTerminate:Lio/reactivex/functions/Action;

    invoke-interface {v1}, Lio/reactivex/functions/Action;->run()V

    .line 300
    :cond_0
    :goto_0
    return-object v0

    .line 291
    :catchall_0
    move-exception v1

    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableDoOnEach$DoOnEachConditionalSubscriber;->onAfterTerminate:Lio/reactivex/functions/Action;

    invoke-interface {v2}, Lio/reactivex/functions/Action;->run()V

    throw v1

    .line 294
    :cond_1
    iget v1, p0, Lio/reactivex/internal/operators/flowable/FlowableDoOnEach$DoOnEachConditionalSubscriber;->sourceMode:I

    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    .line 295
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableDoOnEach$DoOnEachConditionalSubscriber;->onComplete:Lio/reactivex/functions/Action;

    invoke-interface {v1}, Lio/reactivex/functions/Action;->run()V

    .line 297
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableDoOnEach$DoOnEachConditionalSubscriber;->onAfterTerminate:Lio/reactivex/functions/Action;

    invoke-interface {v1}, Lio/reactivex/functions/Action;->run()V

    goto :goto_0
.end method

.method public requestFusion(I)I
    .locals 1
    .param p1, "mode"    # I

    .prologue
    .line 279
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableDoOnEach$DoOnEachConditionalSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableDoOnEach$DoOnEachConditionalSubscriber<TT;>;"
    invoke-virtual {p0, p1}, Lio/reactivex/internal/operators/flowable/FlowableDoOnEach$DoOnEachConditionalSubscriber;->transitiveBoundaryFusion(I)I

    move-result v0

    return v0
.end method

.method public tryOnNext(Ljava/lang/Object;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/flowable/FlowableDoOnEach$DoOnEachConditionalSubscriber;, "Lio/reactivex/internal/operators/flowable/FlowableDoOnEach$DoOnEachConditionalSubscriber<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    const/4 v1, 0x0

    .line 213
    iget-boolean v2, p0, Lio/reactivex/internal/operators/flowable/FlowableDoOnEach$DoOnEachConditionalSubscriber;->done:Z

    if-eqz v2, :cond_0

    .line 224
    :goto_0
    return v1

    .line 218
    :cond_0
    :try_start_0
    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableDoOnEach$DoOnEachConditionalSubscriber;->onNext:Lio/reactivex/functions/Consumer;

    invoke-interface {v2, p1}, Lio/reactivex/functions/Consumer;->accept(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 224
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableDoOnEach$DoOnEachConditionalSubscriber;->actual:Lio/reactivex/internal/fuseable/ConditionalSubscriber;

    invoke-interface {v1, p1}, Lio/reactivex/internal/fuseable/ConditionalSubscriber;->tryOnNext(Ljava/lang/Object;)Z

    move-result v1

    goto :goto_0

    .line 219
    :catch_0
    move-exception v0

    .line 220
    .local v0, "e":Ljava/lang/Throwable;
    invoke-virtual {p0, v0}, Lio/reactivex/internal/operators/flowable/FlowableDoOnEach$DoOnEachConditionalSubscriber;->fail(Ljava/lang/Throwable;)V

    goto :goto_0
.end method
