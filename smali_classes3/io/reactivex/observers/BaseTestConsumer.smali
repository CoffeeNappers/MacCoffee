.class public abstract Lio/reactivex/observers/BaseTestConsumer;
.super Ljava/lang/Object;
.source "BaseTestConsumer.java"

# interfaces
.implements Lio/reactivex/disposables/Disposable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/reactivex/observers/BaseTestConsumer$1;,
        Lio/reactivex/observers/BaseTestConsumer$TestWaitStrategy;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "U:",
        "Lio/reactivex/observers/BaseTestConsumer",
        "<TT;TU;>;>",
        "Ljava/lang/Object;",
        "Lio/reactivex/disposables/Disposable;"
    }
.end annotation


# instance fields
.field protected checkSubscriptionOnce:Z

.field protected completions:J

.field protected final done:Ljava/util/concurrent/CountDownLatch;

.field protected final errors:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/Throwable;",
            ">;"
        }
    .end annotation
.end field

.field protected establishedFusionMode:I

.field protected initialFusionMode:I

.field protected lastThread:Ljava/lang/Thread;

.field protected tag:Ljava/lang/CharSequence;

.field protected timeout:Z

.field protected final values:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 62
    .local p0, "this":Lio/reactivex/observers/BaseTestConsumer;, "Lio/reactivex/observers/BaseTestConsumer<TT;TU;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 63
    new-instance v0, Lio/reactivex/internal/util/VolatileSizeArrayList;

    invoke-direct {v0}, Lio/reactivex/internal/util/VolatileSizeArrayList;-><init>()V

    iput-object v0, p0, Lio/reactivex/observers/BaseTestConsumer;->values:Ljava/util/List;

    .line 64
    new-instance v0, Lio/reactivex/internal/util/VolatileSizeArrayList;

    invoke-direct {v0}, Lio/reactivex/internal/util/VolatileSizeArrayList;-><init>()V

    iput-object v0, p0, Lio/reactivex/observers/BaseTestConsumer;->errors:Ljava/util/List;

    .line 65
    new-instance v0, Ljava/util/concurrent/CountDownLatch;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    iput-object v0, p0, Lio/reactivex/observers/BaseTestConsumer;->done:Ljava/util/concurrent/CountDownLatch;

    .line 66
    return-void
.end method

.method public static valueAndClass(Ljava/lang/Object;)Ljava/lang/String;
    .locals 2
    .param p0, "o"    # Ljava/lang/Object;

    .prologue
    .line 447
    if-eqz p0, :cond_0

    .line 448
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, " (class: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 450
    :goto_0
    return-object v0

    :cond_0
    const-string/jumbo v0, "null"

    goto :goto_0
.end method


# virtual methods
.method public final assertComplete()Lio/reactivex/observers/BaseTestConsumer;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TU;"
        }
    .end annotation

    .prologue
    .line 214
    .local p0, "this":Lio/reactivex/observers/BaseTestConsumer;, "Lio/reactivex/observers/BaseTestConsumer<TT;TU;>;"
    iget-wide v0, p0, Lio/reactivex/observers/BaseTestConsumer;->completions:J

    .line 215
    .local v0, "c":J
    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-nez v2, :cond_0

    .line 216
    const-string/jumbo v2, "Not completed"

    invoke-virtual {p0, v2}, Lio/reactivex/observers/BaseTestConsumer;->fail(Ljava/lang/String;)Ljava/lang/AssertionError;

    move-result-object v2

    throw v2

    .line 218
    :cond_0
    const-wide/16 v2, 0x1

    cmp-long v2, v0, v2

    if-lez v2, :cond_1

    .line 219
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Multiple completions: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lio/reactivex/observers/BaseTestConsumer;->fail(Ljava/lang/String;)Ljava/lang/AssertionError;

    move-result-object v2

    throw v2

    .line 221
    :cond_1
    return-object p0
.end method

.method public final assertEmpty()Lio/reactivex/observers/BaseTestConsumer;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TU;"
        }
    .end annotation

    .prologue
    .line 776
    .local p0, "this":Lio/reactivex/observers/BaseTestConsumer;, "Lio/reactivex/observers/BaseTestConsumer<TT;TU;>;"
    invoke-virtual {p0}, Lio/reactivex/observers/BaseTestConsumer;->assertSubscribed()Lio/reactivex/observers/BaseTestConsumer;

    move-result-object v0

    invoke-virtual {v0}, Lio/reactivex/observers/BaseTestConsumer;->assertNoValues()Lio/reactivex/observers/BaseTestConsumer;

    move-result-object v0

    invoke-virtual {v0}, Lio/reactivex/observers/BaseTestConsumer;->assertNoErrors()Lio/reactivex/observers/BaseTestConsumer;

    move-result-object v0

    invoke-virtual {v0}, Lio/reactivex/observers/BaseTestConsumer;->assertNotComplete()Lio/reactivex/observers/BaseTestConsumer;

    move-result-object v0

    return-object v0
.end method

.method public final assertError(Lio/reactivex/functions/Predicate;)Lio/reactivex/observers/BaseTestConsumer;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/functions/Predicate",
            "<",
            "Ljava/lang/Throwable;",
            ">;)TU;"
        }
    .end annotation

    .prologue
    .line 290
    .local p0, "this":Lio/reactivex/observers/BaseTestConsumer;, "Lio/reactivex/observers/BaseTestConsumer<TT;TU;>;"
    .local p1, "errorPredicate":Lio/reactivex/functions/Predicate;, "Lio/reactivex/functions/Predicate<Ljava/lang/Throwable;>;"
    iget-object v5, p0, Lio/reactivex/observers/BaseTestConsumer;->errors:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v4

    .line 291
    .local v4, "s":I
    if-nez v4, :cond_0

    .line 292
    const-string/jumbo v5, "No errors"

    invoke-virtual {p0, v5}, Lio/reactivex/observers/BaseTestConsumer;->fail(Ljava/lang/String;)Ljava/lang/AssertionError;

    move-result-object v5

    throw v5

    .line 295
    :cond_0
    const/4 v2, 0x0

    .line 297
    .local v2, "found":Z
    iget-object v5, p0, Lio/reactivex/observers/BaseTestConsumer;->errors:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :cond_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Throwable;

    .line 299
    .local v0, "e":Ljava/lang/Throwable;
    :try_start_0
    invoke-interface {p1, v0}, Lio/reactivex/functions/Predicate;->test(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v5

    if-eqz v5, :cond_1

    .line 300
    const/4 v2, 0x1

    .line 308
    .end local v0    # "e":Ljava/lang/Throwable;
    :cond_2
    if-eqz v2, :cond_3

    .line 309
    const/4 v5, 0x1

    if-eq v4, v5, :cond_4

    .line 310
    const-string/jumbo v5, "Error present but other errors as well"

    invoke-virtual {p0, v5}, Lio/reactivex/observers/BaseTestConsumer;->fail(Ljava/lang/String;)Ljava/lang/AssertionError;

    move-result-object v5

    throw v5

    .line 303
    .restart local v0    # "e":Ljava/lang/Throwable;
    :catch_0
    move-exception v1

    .line 304
    .local v1, "ex":Ljava/lang/Exception;
    invoke-static {v1}, Lio/reactivex/internal/util/ExceptionHelper;->wrapOrThrow(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;

    move-result-object v5

    throw v5

    .line 313
    .end local v0    # "e":Ljava/lang/Throwable;
    .end local v1    # "ex":Ljava/lang/Exception;
    :cond_3
    const-string/jumbo v5, "Error not present"

    invoke-virtual {p0, v5}, Lio/reactivex/observers/BaseTestConsumer;->fail(Ljava/lang/String;)Ljava/lang/AssertionError;

    move-result-object v5

    throw v5

    .line 315
    :cond_4
    return-object p0
.end method

.method public final assertError(Ljava/lang/Class;)Lio/reactivex/observers/BaseTestConsumer;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<+",
            "Ljava/lang/Throwable;",
            ">;)TU;"
        }
    .end annotation

    .prologue
    .line 277
    .local p0, "this":Lio/reactivex/observers/BaseTestConsumer;, "Lio/reactivex/observers/BaseTestConsumer<TT;TU;>;"
    .local p1, "errorClass":Ljava/lang/Class;, "Ljava/lang/Class<+Ljava/lang/Throwable;>;"
    invoke-static {p1}, Lio/reactivex/internal/functions/Functions;->isInstanceOf(Ljava/lang/Class;)Lio/reactivex/functions/Predicate;

    move-result-object v0

    invoke-virtual {p0, v0}, Lio/reactivex/observers/BaseTestConsumer;->assertError(Lio/reactivex/functions/Predicate;)Lio/reactivex/observers/BaseTestConsumer;

    move-result-object v0

    return-object v0
.end method

.method public final assertError(Ljava/lang/Throwable;)Lio/reactivex/observers/BaseTestConsumer;
    .locals 1
    .param p1, "error"    # Ljava/lang/Throwable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Throwable;",
            ")TU;"
        }
    .end annotation

    .prologue
    .line 266
    .local p0, "this":Lio/reactivex/observers/BaseTestConsumer;, "Lio/reactivex/observers/BaseTestConsumer<TT;TU;>;"
    invoke-static {p1}, Lio/reactivex/internal/functions/Functions;->equalsWith(Ljava/lang/Object;)Lio/reactivex/functions/Predicate;

    move-result-object v0

    invoke-virtual {p0, v0}, Lio/reactivex/observers/BaseTestConsumer;->assertError(Lio/reactivex/functions/Predicate;)Lio/reactivex/observers/BaseTestConsumer;

    move-result-object v0

    return-object v0
.end method

.method public final assertErrorMessage(Ljava/lang/String;)Lio/reactivex/observers/BaseTestConsumer;
    .locals 5
    .param p1, "message"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")TU;"
        }
    .end annotation

    .prologue
    .line 632
    .local p0, "this":Lio/reactivex/observers/BaseTestConsumer;, "Lio/reactivex/observers/BaseTestConsumer<TT;TU;>;"
    iget-object v3, p0, Lio/reactivex/observers/BaseTestConsumer;->errors:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v2

    .line 633
    .local v2, "s":I
    if-nez v2, :cond_0

    .line 634
    const-string/jumbo v3, "No errors"

    invoke-virtual {p0, v3}, Lio/reactivex/observers/BaseTestConsumer;->fail(Ljava/lang/String;)Ljava/lang/AssertionError;

    move-result-object v3

    throw v3

    .line 636
    :cond_0
    const/4 v3, 0x1

    if-ne v2, v3, :cond_1

    .line 637
    iget-object v3, p0, Lio/reactivex/observers/BaseTestConsumer;->errors:Ljava/util/List;

    const/4 v4, 0x0

    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Throwable;

    .line 638
    .local v0, "e":Ljava/lang/Throwable;
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v1

    .line 639
    .local v1, "errorMessage":Ljava/lang/String;
    invoke-static {p1, v1}, Lio/reactivex/internal/functions/ObjectHelper;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    .line 640
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "Error message differs; Expected: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, ", Actual: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lio/reactivex/observers/BaseTestConsumer;->fail(Ljava/lang/String;)Ljava/lang/AssertionError;

    move-result-object v3

    throw v3

    .line 643
    .end local v0    # "e":Ljava/lang/Throwable;
    .end local v1    # "errorMessage":Ljava/lang/String;
    :cond_1
    const-string/jumbo v3, "Multiple errors"

    invoke-virtual {p0, v3}, Lio/reactivex/observers/BaseTestConsumer;->fail(Ljava/lang/String;)Ljava/lang/AssertionError;

    move-result-object v3

    throw v3

    .line 645
    .restart local v0    # "e":Ljava/lang/Throwable;
    .restart local v1    # "errorMessage":Ljava/lang/String;
    :cond_2
    return-object p0
.end method

.method public final varargs assertFailure(Lio/reactivex/functions/Predicate;[Ljava/lang/Object;)Lio/reactivex/observers/BaseTestConsumer;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/functions/Predicate",
            "<",
            "Ljava/lang/Throwable;",
            ">;[TT;)TU;"
        }
    .end annotation

    .prologue
    .line 724
    .local p0, "this":Lio/reactivex/observers/BaseTestConsumer;, "Lio/reactivex/observers/BaseTestConsumer<TT;TU;>;"
    .local p1, "errorPredicate":Lio/reactivex/functions/Predicate;, "Lio/reactivex/functions/Predicate<Ljava/lang/Throwable;>;"
    .local p2, "values":[Ljava/lang/Object;, "[TT;"
    invoke-virtual {p0}, Lio/reactivex/observers/BaseTestConsumer;->assertSubscribed()Lio/reactivex/observers/BaseTestConsumer;

    move-result-object v0

    invoke-virtual {v0, p2}, Lio/reactivex/observers/BaseTestConsumer;->assertValues([Ljava/lang/Object;)Lio/reactivex/observers/BaseTestConsumer;

    move-result-object v0

    invoke-virtual {v0, p1}, Lio/reactivex/observers/BaseTestConsumer;->assertError(Lio/reactivex/functions/Predicate;)Lio/reactivex/observers/BaseTestConsumer;

    move-result-object v0

    invoke-virtual {v0}, Lio/reactivex/observers/BaseTestConsumer;->assertNotComplete()Lio/reactivex/observers/BaseTestConsumer;

    move-result-object v0

    return-object v0
.end method

.method public final varargs assertFailure(Ljava/lang/Class;[Ljava/lang/Object;)Lio/reactivex/observers/BaseTestConsumer;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<+",
            "Ljava/lang/Throwable;",
            ">;[TT;)TU;"
        }
    .end annotation

    .prologue
    .line 708
    .local p0, "this":Lio/reactivex/observers/BaseTestConsumer;, "Lio/reactivex/observers/BaseTestConsumer<TT;TU;>;"
    .local p1, "error":Ljava/lang/Class;, "Ljava/lang/Class<+Ljava/lang/Throwable;>;"
    .local p2, "values":[Ljava/lang/Object;, "[TT;"
    invoke-virtual {p0}, Lio/reactivex/observers/BaseTestConsumer;->assertSubscribed()Lio/reactivex/observers/BaseTestConsumer;

    move-result-object v0

    invoke-virtual {v0, p2}, Lio/reactivex/observers/BaseTestConsumer;->assertValues([Ljava/lang/Object;)Lio/reactivex/observers/BaseTestConsumer;

    move-result-object v0

    invoke-virtual {v0, p1}, Lio/reactivex/observers/BaseTestConsumer;->assertError(Ljava/lang/Class;)Lio/reactivex/observers/BaseTestConsumer;

    move-result-object v0

    invoke-virtual {v0}, Lio/reactivex/observers/BaseTestConsumer;->assertNotComplete()Lio/reactivex/observers/BaseTestConsumer;

    move-result-object v0

    return-object v0
.end method

.method public final varargs assertFailureAndMessage(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Object;)Lio/reactivex/observers/BaseTestConsumer;
    .locals 1
    .param p2, "message"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<+",
            "Ljava/lang/Throwable;",
            ">;",
            "Ljava/lang/String;",
            "[TT;)TU;"
        }
    .end annotation

    .prologue
    .line 741
    .local p0, "this":Lio/reactivex/observers/BaseTestConsumer;, "Lio/reactivex/observers/BaseTestConsumer<TT;TU;>;"
    .local p1, "error":Ljava/lang/Class;, "Ljava/lang/Class<+Ljava/lang/Throwable;>;"
    .local p3, "values":[Ljava/lang/Object;, "[TT;"
    invoke-virtual {p0}, Lio/reactivex/observers/BaseTestConsumer;->assertSubscribed()Lio/reactivex/observers/BaseTestConsumer;

    move-result-object v0

    invoke-virtual {v0, p3}, Lio/reactivex/observers/BaseTestConsumer;->assertValues([Ljava/lang/Object;)Lio/reactivex/observers/BaseTestConsumer;

    move-result-object v0

    invoke-virtual {v0, p1}, Lio/reactivex/observers/BaseTestConsumer;->assertError(Ljava/lang/Class;)Lio/reactivex/observers/BaseTestConsumer;

    move-result-object v0

    invoke-virtual {v0, p2}, Lio/reactivex/observers/BaseTestConsumer;->assertErrorMessage(Ljava/lang/String;)Lio/reactivex/observers/BaseTestConsumer;

    move-result-object v0

    invoke-virtual {v0}, Lio/reactivex/observers/BaseTestConsumer;->assertNotComplete()Lio/reactivex/observers/BaseTestConsumer;

    move-result-object v0

    return-object v0
.end method

.method public final assertNever(Lio/reactivex/functions/Predicate;)Lio/reactivex/observers/BaseTestConsumer;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/functions/Predicate",
            "<-TT;>;)TU;"
        }
    .end annotation

    .annotation build Lio/reactivex/annotations/Experimental;
    .end annotation

    .prologue
    .line 390
    .local p0, "this":Lio/reactivex/observers/BaseTestConsumer;, "Lio/reactivex/observers/BaseTestConsumer<TT;TU;>;"
    .local p1, "valuePredicate":Lio/reactivex/functions/Predicate;, "Lio/reactivex/functions/Predicate<-TT;>;"
    iget-object v4, p0, Lio/reactivex/observers/BaseTestConsumer;->values:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v2

    .line 392
    .local v2, "s":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v2, :cond_1

    .line 393
    iget-object v4, p0, Lio/reactivex/observers/BaseTestConsumer;->values:Ljava/util/List;

    invoke-interface {v4, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    .line 395
    .local v3, "v":Ljava/lang/Object;, "TT;"
    :try_start_0
    invoke-interface {p1, v3}, Lio/reactivex/functions/Predicate;->test(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 396
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "Value at position "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, " matches predicate "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, ", which was not expected."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Lio/reactivex/observers/BaseTestConsumer;->fail(Ljava/lang/String;)Ljava/lang/AssertionError;

    move-result-object v4

    throw v4
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 398
    :catch_0
    move-exception v0

    .line 399
    .local v0, "ex":Ljava/lang/Exception;
    invoke-static {v0}, Lio/reactivex/internal/util/ExceptionHelper;->wrapOrThrow(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;

    move-result-object v4

    throw v4

    .line 392
    .end local v0    # "ex":Ljava/lang/Exception;
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 402
    .end local v3    # "v":Ljava/lang/Object;, "TT;"
    :cond_1
    return-object p0
.end method

.method public final assertNever(Ljava/lang/Object;)Lio/reactivex/observers/BaseTestConsumer;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)TU;"
        }
    .end annotation

    .annotation build Lio/reactivex/annotations/Experimental;
    .end annotation

    .prologue
    .line 348
    .local p0, "this":Lio/reactivex/observers/BaseTestConsumer;, "Lio/reactivex/observers/BaseTestConsumer<TT;TU;>;"
    .local p1, "value":Ljava/lang/Object;, "TT;"
    iget-object v3, p0, Lio/reactivex/observers/BaseTestConsumer;->values:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v1

    .line 350
    .local v1, "s":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, v1, :cond_1

    .line 351
    iget-object v3, p0, Lio/reactivex/observers/BaseTestConsumer;->values:Ljava/util/List;

    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    .line 352
    .local v2, "v":Ljava/lang/Object;, "TT;"
    invoke-static {v2, p1}, Lio/reactivex/internal/functions/ObjectHelper;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 353
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "Value at position "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, " is equal to "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {p1}, Lio/reactivex/observers/BaseTestConsumer;->valueAndClass(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "; Expected them to be different"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lio/reactivex/observers/BaseTestConsumer;->fail(Ljava/lang/String;)Ljava/lang/AssertionError;

    move-result-object v3

    throw v3

    .line 350
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 356
    .end local v2    # "v":Ljava/lang/Object;, "TT;"
    :cond_1
    return-object p0
.end method

.method public final assertNoErrors()Lio/reactivex/observers/BaseTestConsumer;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TU;"
        }
    .end annotation

    .prologue
    .line 246
    .local p0, "this":Lio/reactivex/observers/BaseTestConsumer;, "Lio/reactivex/observers/BaseTestConsumer<TT;TU;>;"
    iget-object v1, p0, Lio/reactivex/observers/BaseTestConsumer;->errors:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v0

    .line 247
    .local v0, "s":I
    if-eqz v0, :cond_0

    .line 248
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Error(s) present: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lio/reactivex/observers/BaseTestConsumer;->errors:Ljava/util/List;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lio/reactivex/observers/BaseTestConsumer;->fail(Ljava/lang/String;)Ljava/lang/AssertionError;

    move-result-object v1

    throw v1

    .line 250
    :cond_0
    return-object p0
.end method

.method public final assertNoTimeout()Lio/reactivex/observers/BaseTestConsumer;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TU;"
        }
    .end annotation

    .annotation build Lio/reactivex/annotations/Experimental;
    .end annotation

    .prologue
    .line 974
    .local p0, "this":Lio/reactivex/observers/BaseTestConsumer;, "Lio/reactivex/observers/BaseTestConsumer<TT;TU;>;"
    iget-boolean v0, p0, Lio/reactivex/observers/BaseTestConsumer;->timeout:Z

    if-eqz v0, :cond_0

    .line 975
    const-string/jumbo v0, "Timeout?!"

    invoke-virtual {p0, v0}, Lio/reactivex/observers/BaseTestConsumer;->fail(Ljava/lang/String;)Ljava/lang/AssertionError;

    move-result-object v0

    throw v0

    .line 977
    :cond_0
    return-object p0
.end method

.method public final assertNoValues()Lio/reactivex/observers/BaseTestConsumer;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TU;"
        }
    .end annotation

    .prologue
    .line 472
    .local p0, "this":Lio/reactivex/observers/BaseTestConsumer;, "Lio/reactivex/observers/BaseTestConsumer<TT;TU;>;"
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lio/reactivex/observers/BaseTestConsumer;->assertValueCount(I)Lio/reactivex/observers/BaseTestConsumer;

    move-result-object v0

    return-object v0
.end method

.method public final assertNotComplete()Lio/reactivex/observers/BaseTestConsumer;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TU;"
        }
    .end annotation

    .prologue
    .local p0, "this":Lio/reactivex/observers/BaseTestConsumer;, "Lio/reactivex/observers/BaseTestConsumer<TT;TU;>;"
    const-wide/16 v4, 0x1

    .line 230
    iget-wide v0, p0, Lio/reactivex/observers/BaseTestConsumer;->completions:J

    .line 231
    .local v0, "c":J
    cmp-long v2, v0, v4

    if-nez v2, :cond_0

    .line 232
    const-string/jumbo v2, "Completed!"

    invoke-virtual {p0, v2}, Lio/reactivex/observers/BaseTestConsumer;->fail(Ljava/lang/String;)Ljava/lang/AssertionError;

    move-result-object v2

    throw v2

    .line 234
    :cond_0
    cmp-long v2, v0, v4

    if-lez v2, :cond_1

    .line 235
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Multiple completions: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lio/reactivex/observers/BaseTestConsumer;->fail(Ljava/lang/String;)Ljava/lang/AssertionError;

    move-result-object v2

    throw v2

    .line 237
    :cond_1
    return-object p0
.end method

.method public abstract assertNotSubscribed()Lio/reactivex/observers/BaseTestConsumer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TU;"
        }
    .end annotation
.end method

.method public final assertNotTerminated()Lio/reactivex/observers/BaseTestConsumer;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TU;"
        }
    .end annotation

    .prologue
    .line 588
    .local p0, "this":Lio/reactivex/observers/BaseTestConsumer;, "Lio/reactivex/observers/BaseTestConsumer<TT;TU;>;"
    iget-object v0, p0, Lio/reactivex/observers/BaseTestConsumer;->done:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v0}, Ljava/util/concurrent/CountDownLatch;->getCount()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 589
    const-string/jumbo v0, "Subscriber terminated!"

    invoke-virtual {p0, v0}, Lio/reactivex/observers/BaseTestConsumer;->fail(Ljava/lang/String;)Ljava/lang/AssertionError;

    move-result-object v0

    throw v0

    .line 591
    :cond_0
    return-object p0
.end method

.method public final varargs assertResult([Ljava/lang/Object;)Lio/reactivex/observers/BaseTestConsumer;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([TT;)TU;"
        }
    .end annotation

    .prologue
    .line 694
    .local p0, "this":Lio/reactivex/observers/BaseTestConsumer;, "Lio/reactivex/observers/BaseTestConsumer<TT;TU;>;"
    .local p1, "values":[Ljava/lang/Object;, "[TT;"
    invoke-virtual {p0}, Lio/reactivex/observers/BaseTestConsumer;->assertSubscribed()Lio/reactivex/observers/BaseTestConsumer;

    move-result-object v0

    invoke-virtual {v0, p1}, Lio/reactivex/observers/BaseTestConsumer;->assertValues([Ljava/lang/Object;)Lio/reactivex/observers/BaseTestConsumer;

    move-result-object v0

    invoke-virtual {v0}, Lio/reactivex/observers/BaseTestConsumer;->assertNoErrors()Lio/reactivex/observers/BaseTestConsumer;

    move-result-object v0

    invoke-virtual {v0}, Lio/reactivex/observers/BaseTestConsumer;->assertComplete()Lio/reactivex/observers/BaseTestConsumer;

    move-result-object v0

    return-object v0
.end method

.method public abstract assertSubscribed()Lio/reactivex/observers/BaseTestConsumer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TU;"
        }
    .end annotation
.end method

.method public final assertTerminated()Lio/reactivex/observers/BaseTestConsumer;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TU;"
        }
    .end annotation

    .prologue
    .local p0, "this":Lio/reactivex/observers/BaseTestConsumer;, "Lio/reactivex/observers/BaseTestConsumer<TT;TU;>;"
    const-wide/16 v6, 0x0

    .line 564
    iget-object v3, p0, Lio/reactivex/observers/BaseTestConsumer;->done:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v3}, Ljava/util/concurrent/CountDownLatch;->getCount()J

    move-result-wide v4

    cmp-long v3, v4, v6

    if-eqz v3, :cond_0

    .line 565
    const-string/jumbo v3, "Subscriber still running!"

    invoke-virtual {p0, v3}, Lio/reactivex/observers/BaseTestConsumer;->fail(Ljava/lang/String;)Ljava/lang/AssertionError;

    move-result-object v3

    throw v3

    .line 567
    :cond_0
    iget-wide v0, p0, Lio/reactivex/observers/BaseTestConsumer;->completions:J

    .line 568
    .local v0, "c":J
    const-wide/16 v4, 0x1

    cmp-long v3, v0, v4

    if-lez v3, :cond_1

    .line 569
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "Terminated with multiple completions: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lio/reactivex/observers/BaseTestConsumer;->fail(Ljava/lang/String;)Ljava/lang/AssertionError;

    move-result-object v3

    throw v3

    .line 571
    :cond_1
    iget-object v3, p0, Lio/reactivex/observers/BaseTestConsumer;->errors:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v2

    .line 572
    .local v2, "s":I
    const/4 v3, 0x1

    if-le v2, v3, :cond_2

    .line 573
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "Terminated with multiple errors: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lio/reactivex/observers/BaseTestConsumer;->fail(Ljava/lang/String;)Ljava/lang/AssertionError;

    move-result-object v3

    throw v3

    .line 576
    :cond_2
    cmp-long v3, v0, v6

    if-eqz v3, :cond_3

    if-eqz v2, :cond_3

    .line 577
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "Terminated with multiple completions and errors: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lio/reactivex/observers/BaseTestConsumer;->fail(Ljava/lang/String;)Ljava/lang/AssertionError;

    move-result-object v3

    throw v3

    .line 579
    :cond_3
    return-object p0
.end method

.method public final assertTimeout()Lio/reactivex/observers/BaseTestConsumer;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TU;"
        }
    .end annotation

    .annotation build Lio/reactivex/annotations/Experimental;
    .end annotation

    .prologue
    .line 959
    .local p0, "this":Lio/reactivex/observers/BaseTestConsumer;, "Lio/reactivex/observers/BaseTestConsumer<TT;TU;>;"
    iget-boolean v0, p0, Lio/reactivex/observers/BaseTestConsumer;->timeout:Z

    if-nez v0, :cond_0

    .line 960
    const-string/jumbo v0, "No timeout?!"

    invoke-virtual {p0, v0}, Lio/reactivex/observers/BaseTestConsumer;->fail(Ljava/lang/String;)Ljava/lang/AssertionError;

    move-result-object v0

    throw v0

    .line 962
    :cond_0
    return-object p0
.end method

.method public final assertValue(Lio/reactivex/functions/Predicate;)Lio/reactivex/observers/BaseTestConsumer;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/functions/Predicate",
            "<TT;>;)TU;"
        }
    .end annotation

    .prologue
    .line 369
    .local p0, "this":Lio/reactivex/observers/BaseTestConsumer;, "Lio/reactivex/observers/BaseTestConsumer<TT;TU;>;"
    .local p1, "valuePredicate":Lio/reactivex/functions/Predicate;, "Lio/reactivex/functions/Predicate<TT;>;"
    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1}, Lio/reactivex/observers/BaseTestConsumer;->assertValueAt(ILio/reactivex/functions/Predicate;)Lio/reactivex/observers/BaseTestConsumer;

    .line 371
    iget-object v0, p0, Lio/reactivex/observers/BaseTestConsumer;->values:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x1

    if-le v0, v1, :cond_0

    .line 372
    const-string/jumbo v0, "Value present but other values as well"

    invoke-virtual {p0, v0}, Lio/reactivex/observers/BaseTestConsumer;->fail(Ljava/lang/String;)Ljava/lang/AssertionError;

    move-result-object v0

    throw v0

    .line 375
    :cond_0
    return-object p0
.end method

.method public final assertValue(Ljava/lang/Object;)Lio/reactivex/observers/BaseTestConsumer;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)TU;"
        }
    .end annotation

    .prologue
    .line 326
    .local p0, "this":Lio/reactivex/observers/BaseTestConsumer;, "Lio/reactivex/observers/BaseTestConsumer<TT;TU;>;"
    .local p1, "value":Ljava/lang/Object;, "TT;"
    iget-object v2, p0, Lio/reactivex/observers/BaseTestConsumer;->values:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v0

    .line 327
    .local v0, "s":I
    const/4 v2, 0x1

    if-eq v0, v2, :cond_0

    .line 328
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Expected: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {p1}, Lio/reactivex/observers/BaseTestConsumer;->valueAndClass(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, ", Actual: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lio/reactivex/observers/BaseTestConsumer;->values:Ljava/util/List;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lio/reactivex/observers/BaseTestConsumer;->fail(Ljava/lang/String;)Ljava/lang/AssertionError;

    move-result-object v2

    throw v2

    .line 330
    :cond_0
    iget-object v2, p0, Lio/reactivex/observers/BaseTestConsumer;->values:Ljava/util/List;

    const/4 v3, 0x0

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    .line 331
    .local v1, "v":Ljava/lang/Object;, "TT;"
    invoke-static {p1, v1}, Lio/reactivex/internal/functions/ObjectHelper;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 332
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Expected: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {p1}, Lio/reactivex/observers/BaseTestConsumer;->valueAndClass(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, ", Actual: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {v1}, Lio/reactivex/observers/BaseTestConsumer;->valueAndClass(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lio/reactivex/observers/BaseTestConsumer;->fail(Ljava/lang/String;)Ljava/lang/AssertionError;

    move-result-object v2

    throw v2

    .line 334
    :cond_1
    return-object p0
.end method

.method public final assertValueAt(ILio/reactivex/functions/Predicate;)Lio/reactivex/observers/BaseTestConsumer;
    .locals 5
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lio/reactivex/functions/Predicate",
            "<TT;>;)TU;"
        }
    .end annotation

    .prologue
    .line 416
    .local p0, "this":Lio/reactivex/observers/BaseTestConsumer;, "Lio/reactivex/observers/BaseTestConsumer<TT;TU;>;"
    .local p2, "valuePredicate":Lio/reactivex/functions/Predicate;, "Lio/reactivex/functions/Predicate<TT;>;"
    iget-object v3, p0, Lio/reactivex/observers/BaseTestConsumer;->values:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v2

    .line 417
    .local v2, "s":I
    if-nez v2, :cond_0

    .line 418
    const-string/jumbo v3, "No values"

    invoke-virtual {p0, v3}, Lio/reactivex/observers/BaseTestConsumer;->fail(Ljava/lang/String;)Ljava/lang/AssertionError;

    move-result-object v3

    throw v3

    .line 421
    :cond_0
    iget-object v3, p0, Lio/reactivex/observers/BaseTestConsumer;->values:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-lt p1, v3, :cond_1

    .line 422
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "Invalid index: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lio/reactivex/observers/BaseTestConsumer;->fail(Ljava/lang/String;)Ljava/lang/AssertionError;

    move-result-object v3

    throw v3

    .line 425
    :cond_1
    const/4 v1, 0x0

    .line 428
    .local v1, "found":Z
    :try_start_0
    iget-object v3, p0, Lio/reactivex/observers/BaseTestConsumer;->values:Ljava/util/List;

    invoke-interface {v3, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    invoke-interface {p2, v3}, Lio/reactivex/functions/Predicate;->test(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v3

    if-eqz v3, :cond_2

    .line 429
    const/4 v1, 0x1

    .line 435
    :cond_2
    if-nez v1, :cond_3

    .line 436
    const-string/jumbo v3, "Value not present"

    invoke-virtual {p0, v3}, Lio/reactivex/observers/BaseTestConsumer;->fail(Ljava/lang/String;)Ljava/lang/AssertionError;

    move-result-object v3

    throw v3

    .line 431
    :catch_0
    move-exception v0

    .line 432
    .local v0, "ex":Ljava/lang/Exception;
    invoke-static {v0}, Lio/reactivex/internal/util/ExceptionHelper;->wrapOrThrow(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;

    move-result-object v3

    throw v3

    .line 438
    .end local v0    # "ex":Ljava/lang/Exception;
    :cond_3
    return-object p0
.end method

.method public final assertValueCount(I)Lio/reactivex/observers/BaseTestConsumer;
    .locals 3
    .param p1, "count"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TU;"
        }
    .end annotation

    .prologue
    .line 460
    .local p0, "this":Lio/reactivex/observers/BaseTestConsumer;, "Lio/reactivex/observers/BaseTestConsumer<TT;TU;>;"
    iget-object v1, p0, Lio/reactivex/observers/BaseTestConsumer;->values:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v0

    .line 461
    .local v0, "s":I
    if-eq v0, p1, :cond_0

    .line 462
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Value counts differ; Expected: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ", Actual: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lio/reactivex/observers/BaseTestConsumer;->fail(Ljava/lang/String;)Ljava/lang/AssertionError;

    move-result-object v1

    throw v1

    .line 464
    :cond_0
    return-object p0
.end method

.method public final assertValueSequence(Ljava/lang/Iterable;)Lio/reactivex/observers/BaseTestConsumer;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable",
            "<+TT;>;)TU;"
        }
    .end annotation

    .prologue
    .line 527
    .local p0, "this":Lio/reactivex/observers/BaseTestConsumer;, "Lio/reactivex/observers/BaseTestConsumer<TT;TU;>;"
    .local p1, "sequence":Ljava/lang/Iterable;, "Ljava/lang/Iterable<+TT;>;"
    const/4 v2, 0x0

    .line 528
    .local v2, "i":I
    iget-object v7, p0, Lio/reactivex/observers/BaseTestConsumer;->values:Ljava/util/List;

    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .line 529
    .local v6, "vit":Ljava/util/Iterator;, "Ljava/util/Iterator<TT;>;"
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .line 533
    .local v3, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<+TT;>;"
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    .line 534
    .local v0, "actualNext":Z
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    .line 536
    .local v1, "expectedNext":Z
    if-eqz v0, :cond_0

    if-nez v1, :cond_1

    .line 549
    :cond_0
    if-eqz v0, :cond_3

    .line 550
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "More values received than expected ("

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v8, ")"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0, v7}, Lio/reactivex/observers/BaseTestConsumer;->fail(Ljava/lang/String;)Ljava/lang/AssertionError;

    move-result-object v7

    throw v7

    .line 540
    :cond_1
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    .line 541
    .local v5, "v":Ljava/lang/Object;, "TT;"
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    .line 543
    .local v4, "u":Ljava/lang/Object;, "TT;"
    invoke-static {v4, v5}, Lio/reactivex/internal/functions/ObjectHelper;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_2

    .line 544
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "Values at position "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v8, " differ; Expected: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-static {v4}, Lio/reactivex/observers/BaseTestConsumer;->valueAndClass(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v8, ", Actual: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-static {v5}, Lio/reactivex/observers/BaseTestConsumer;->valueAndClass(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0, v7}, Lio/reactivex/observers/BaseTestConsumer;->fail(Ljava/lang/String;)Ljava/lang/AssertionError;

    move-result-object v7

    throw v7

    .line 546
    :cond_2
    add-int/lit8 v2, v2, 0x1

    .line 547
    goto :goto_0

    .line 552
    .end local v4    # "u":Ljava/lang/Object;, "TT;"
    .end local v5    # "v":Ljava/lang/Object;, "TT;"
    :cond_3
    if-eqz v1, :cond_4

    .line 553
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "Fever values received than expected ("

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v8, ")"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0, v7}, Lio/reactivex/observers/BaseTestConsumer;->fail(Ljava/lang/String;)Ljava/lang/AssertionError;

    move-result-object v7

    throw v7

    .line 555
    :cond_4
    return-object p0
.end method

.method public final assertValueSet(Ljava/util/Collection;)Lio/reactivex/observers/BaseTestConsumer;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<+TT;>;)TU;"
        }
    .end annotation

    .prologue
    .line 508
    .local p0, "this":Lio/reactivex/observers/BaseTestConsumer;, "Lio/reactivex/observers/BaseTestConsumer<TT;TU;>;"
    .local p1, "expected":Ljava/util/Collection;, "Ljava/util/Collection<+TT;>;"
    invoke-interface {p1}, Ljava/util/Collection;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 509
    invoke-virtual {p0}, Lio/reactivex/observers/BaseTestConsumer;->assertNoValues()Lio/reactivex/observers/BaseTestConsumer;

    .line 517
    :cond_0
    return-object p0

    .line 512
    :cond_1
    iget-object v2, p0, Lio/reactivex/observers/BaseTestConsumer;->values:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 513
    .local v1, "v":Ljava/lang/Object;, "TT;"
    invoke-interface {p1, v1}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 514
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Value not in the expected collection: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {v1}, Lio/reactivex/observers/BaseTestConsumer;->valueAndClass(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lio/reactivex/observers/BaseTestConsumer;->fail(Ljava/lang/String;)Ljava/lang/AssertionError;

    move-result-object v2

    throw v2
.end method

.method public final varargs assertValues([Ljava/lang/Object;)Lio/reactivex/observers/BaseTestConsumer;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([TT;)TU;"
        }
    .end annotation

    .prologue
    .line 483
    .local p0, "this":Lio/reactivex/observers/BaseTestConsumer;, "Lio/reactivex/observers/BaseTestConsumer<TT;TU;>;"
    .local p1, "values":[Ljava/lang/Object;, "[TT;"
    iget-object v4, p0, Lio/reactivex/observers/BaseTestConsumer;->values:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v1

    .line 484
    .local v1, "s":I
    array-length v4, p1

    if-eq v1, v4, :cond_0

    .line 485
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "Value count differs; Expected: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    array-length v5, p1

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, " "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {p1}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, ", Actual: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, " "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lio/reactivex/observers/BaseTestConsumer;->values:Ljava/util/List;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Lio/reactivex/observers/BaseTestConsumer;->fail(Ljava/lang/String;)Ljava/lang/AssertionError;

    move-result-object v4

    throw v4

    .line 488
    :cond_0
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, v1, :cond_2

    .line 489
    iget-object v4, p0, Lio/reactivex/observers/BaseTestConsumer;->values:Ljava/util/List;

    invoke-interface {v4, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    .line 490
    .local v3, "v":Ljava/lang/Object;, "TT;"
    aget-object v2, p1, v0

    .line 491
    .local v2, "u":Ljava/lang/Object;, "TT;"
    invoke-static {v2, v3}, Lio/reactivex/internal/functions/ObjectHelper;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 492
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "Values at position "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, " differ; Expected: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {v2}, Lio/reactivex/observers/BaseTestConsumer;->valueAndClass(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, ", Actual: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {v3}, Lio/reactivex/observers/BaseTestConsumer;->valueAndClass(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Lio/reactivex/observers/BaseTestConsumer;->fail(Ljava/lang/String;)Ljava/lang/AssertionError;

    move-result-object v4

    throw v4

    .line 488
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 495
    .end local v2    # "u":Ljava/lang/Object;, "TT;"
    .end local v3    # "v":Ljava/lang/Object;, "TT;"
    :cond_2
    return-object p0
.end method

.method public final await()Lio/reactivex/observers/BaseTestConsumer;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TU;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 183
    .local p0, "this":Lio/reactivex/observers/BaseTestConsumer;, "Lio/reactivex/observers/BaseTestConsumer<TT;TU;>;"
    iget-object v0, p0, Lio/reactivex/observers/BaseTestConsumer;->done:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v0}, Ljava/util/concurrent/CountDownLatch;->getCount()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 188
    :goto_0
    return-object p0

    .line 187
    :cond_0
    iget-object v0, p0, Lio/reactivex/observers/BaseTestConsumer;->done:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v0}, Ljava/util/concurrent/CountDownLatch;->await()V

    goto :goto_0
.end method

.method public final await(JLjava/util/concurrent/TimeUnit;)Z
    .locals 9
    .param p1, "time"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .local p0, "this":Lio/reactivex/observers/BaseTestConsumer;, "Lio/reactivex/observers/BaseTestConsumer<TT;TU;>;"
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 201
    iget-object v3, p0, Lio/reactivex/observers/BaseTestConsumer;->done:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v3}, Ljava/util/concurrent/CountDownLatch;->getCount()J

    move-result-wide v4

    const-wide/16 v6, 0x0

    cmp-long v3, v4, v6

    if-eqz v3, :cond_0

    iget-object v3, p0, Lio/reactivex/observers/BaseTestConsumer;->done:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v3, p1, p2, p3}, Ljava/util/concurrent/CountDownLatch;->await(JLjava/util/concurrent/TimeUnit;)Z

    move-result v3

    if-eqz v3, :cond_1

    :cond_0
    move v0, v1

    .line 202
    .local v0, "d":Z
    :goto_0
    if-nez v0, :cond_2

    :goto_1
    iput-boolean v1, p0, Lio/reactivex/observers/BaseTestConsumer;->timeout:Z

    .line 203
    return v0

    .end local v0    # "d":Z
    :cond_1
    move v0, v2

    .line 201
    goto :goto_0

    .restart local v0    # "d":Z
    :cond_2
    move v1, v2

    .line 202
    goto :goto_1
.end method

.method public final awaitCount(I)Lio/reactivex/observers/BaseTestConsumer;
    .locals 4
    .param p1, "atLeast"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TU;"
        }
    .end annotation

    .annotation build Lio/reactivex/annotations/Experimental;
    .end annotation

    .prologue
    .line 871
    .local p0, "this":Lio/reactivex/observers/BaseTestConsumer;, "Lio/reactivex/observers/BaseTestConsumer<TT;TU;>;"
    sget-object v0, Lio/reactivex/observers/BaseTestConsumer$TestWaitStrategy;->SLEEP_10MS:Lio/reactivex/observers/BaseTestConsumer$TestWaitStrategy;

    const-wide/16 v2, 0x1388

    invoke-virtual {p0, p1, v0, v2, v3}, Lio/reactivex/observers/BaseTestConsumer;->awaitCount(ILjava/lang/Runnable;J)Lio/reactivex/observers/BaseTestConsumer;

    move-result-object v0

    return-object v0
.end method

.method public final awaitCount(ILjava/lang/Runnable;)Lio/reactivex/observers/BaseTestConsumer;
    .locals 2
    .param p1, "atLeast"    # I
    .param p2, "waitStrategy"    # Ljava/lang/Runnable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/lang/Runnable;",
            ")TU;"
        }
    .end annotation

    .annotation build Lio/reactivex/annotations/Experimental;
    .end annotation

    .prologue
    .line 889
    .local p0, "this":Lio/reactivex/observers/BaseTestConsumer;, "Lio/reactivex/observers/BaseTestConsumer<TT;TU;>;"
    const-wide/16 v0, 0x1388

    invoke-virtual {p0, p1, p2, v0, v1}, Lio/reactivex/observers/BaseTestConsumer;->awaitCount(ILjava/lang/Runnable;J)Lio/reactivex/observers/BaseTestConsumer;

    move-result-object v0

    return-object v0
.end method

.method public final awaitCount(ILjava/lang/Runnable;J)Lio/reactivex/observers/BaseTestConsumer;
    .locals 7
    .param p1, "atLeast"    # I
    .param p2, "waitStrategy"    # Ljava/lang/Runnable;
    .param p3, "timeoutMillis"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/lang/Runnable;",
            "J)TU;"
        }
    .end annotation

    .annotation build Lio/reactivex/annotations/Experimental;
    .end annotation

    .prologue
    .local p0, "this":Lio/reactivex/observers/BaseTestConsumer;, "Lio/reactivex/observers/BaseTestConsumer<TT;TU;>;"
    const-wide/16 v4, 0x0

    .line 908
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 910
    .local v0, "start":J
    :goto_0
    cmp-long v2, p3, v4

    if-lez v2, :cond_1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    sub-long/2addr v2, v0

    cmp-long v2, v2, p3

    if-ltz v2, :cond_1

    .line 911
    const/4 v2, 0x1

    iput-boolean v2, p0, Lio/reactivex/observers/BaseTestConsumer;->timeout:Z

    .line 923
    :cond_0
    return-object p0

    .line 914
    :cond_1
    iget-object v2, p0, Lio/reactivex/observers/BaseTestConsumer;->done:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v2}, Ljava/util/concurrent/CountDownLatch;->getCount()J

    move-result-wide v2

    cmp-long v2, v2, v4

    if-eqz v2, :cond_0

    .line 917
    iget-object v2, p0, Lio/reactivex/observers/BaseTestConsumer;->values:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v2, p1, :cond_0

    .line 921
    invoke-interface {p2}, Ljava/lang/Runnable;->run()V

    goto :goto_0
.end method

.method public final awaitDone(JLjava/util/concurrent/TimeUnit;)Lio/reactivex/observers/BaseTestConsumer;
    .locals 3
    .param p1, "time"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            ")TU;"
        }
    .end annotation

    .prologue
    .line 759
    .local p0, "this":Lio/reactivex/observers/BaseTestConsumer;, "Lio/reactivex/observers/BaseTestConsumer<TT;TU;>;"
    :try_start_0
    iget-object v1, p0, Lio/reactivex/observers/BaseTestConsumer;->done:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v1, p1, p2, p3}, Ljava/util/concurrent/CountDownLatch;->await(JLjava/util/concurrent/TimeUnit;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 760
    const/4 v1, 0x1

    iput-boolean v1, p0, Lio/reactivex/observers/BaseTestConsumer;->timeout:Z

    .line 761
    invoke-virtual {p0}, Lio/reactivex/observers/BaseTestConsumer;->dispose()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 767
    :cond_0
    return-object p0

    .line 763
    :catch_0
    move-exception v0

    .line 764
    .local v0, "ex":Ljava/lang/InterruptedException;
    invoke-virtual {p0}, Lio/reactivex/observers/BaseTestConsumer;->dispose()V

    .line 765
    invoke-static {v0}, Lio/reactivex/internal/util/ExceptionHelper;->wrapOrThrow(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1
.end method

.method public final awaitTerminalEvent()Z
    .locals 2

    .prologue
    .line 601
    .local p0, "this":Lio/reactivex/observers/BaseTestConsumer;, "Lio/reactivex/observers/BaseTestConsumer<TT;TU;>;"
    :try_start_0
    invoke-virtual {p0}, Lio/reactivex/observers/BaseTestConsumer;->await()Lio/reactivex/observers/BaseTestConsumer;
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 602
    const/4 v1, 0x1

    .line 605
    :goto_0
    return v1

    .line 603
    :catch_0
    move-exception v0

    .line 604
    .local v0, "ex":Ljava/lang/InterruptedException;
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->interrupt()V

    .line 605
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public final awaitTerminalEvent(JLjava/util/concurrent/TimeUnit;)Z
    .locals 3
    .param p1, "duration"    # J
    .param p3, "unit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 618
    .local p0, "this":Lio/reactivex/observers/BaseTestConsumer;, "Lio/reactivex/observers/BaseTestConsumer<TT;TU;>;"
    :try_start_0
    invoke-virtual {p0, p1, p2, p3}, Lio/reactivex/observers/BaseTestConsumer;->await(JLjava/util/concurrent/TimeUnit;)Z
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 621
    :goto_0
    return v1

    .line 619
    :catch_0
    move-exception v0

    .line 620
    .local v0, "ex":Ljava/lang/InterruptedException;
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->interrupt()V

    .line 621
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public final clearTimeout()Lio/reactivex/observers/BaseTestConsumer;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TU;"
        }
    .end annotation

    .annotation build Lio/reactivex/annotations/Experimental;
    .end annotation

    .prologue
    .line 947
    .local p0, "this":Lio/reactivex/observers/BaseTestConsumer;, "Lio/reactivex/observers/BaseTestConsumer<TT;TU;>;"
    const/4 v0, 0x0

    iput-boolean v0, p0, Lio/reactivex/observers/BaseTestConsumer;->timeout:Z

    .line 948
    return-object p0
.end method

.method public final completions()J
    .locals 2

    .prologue
    .line 97
    .local p0, "this":Lio/reactivex/observers/BaseTestConsumer;, "Lio/reactivex/observers/BaseTestConsumer<TT;TU;>;"
    iget-wide v0, p0, Lio/reactivex/observers/BaseTestConsumer;->completions:J

    return-wide v0
.end method

.method public final errorCount()I
    .locals 1

    .prologue
    .line 121
    .local p0, "this":Lio/reactivex/observers/BaseTestConsumer;, "Lio/reactivex/observers/BaseTestConsumer<TT;TU;>;"
    iget-object v0, p0, Lio/reactivex/observers/BaseTestConsumer;->errors:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public final errors()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Throwable;",
            ">;"
        }
    .end annotation

    .prologue
    .line 89
    .local p0, "this":Lio/reactivex/observers/BaseTestConsumer;, "Lio/reactivex/observers/BaseTestConsumer<TT;TU;>;"
    iget-object v0, p0, Lio/reactivex/observers/BaseTestConsumer;->errors:Ljava/util/List;

    return-object v0
.end method

.method protected final fail(Ljava/lang/String;)Ljava/lang/AssertionError;
    .locals 8
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 135
    .local p0, "this":Lio/reactivex/observers/BaseTestConsumer;, "Lio/reactivex/observers/BaseTestConsumer<TT;TU;>;"
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v4, v4, 0x40

    invoke-direct {v1, v4}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 136
    .local v1, "b":Ljava/lang/StringBuilder;
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 138
    const-string/jumbo v4, " ("

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "latch = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lio/reactivex/observers/BaseTestConsumer;->done:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v5}, Ljava/util/concurrent/CountDownLatch;->getCount()J

    move-result-wide v6

    invoke-virtual {v4, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, ", "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "values = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lio/reactivex/observers/BaseTestConsumer;->values:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, ", "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "errors = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lio/reactivex/observers/BaseTestConsumer;->errors:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, ", "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "completions = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-wide v6, p0, Lio/reactivex/observers/BaseTestConsumer;->completions:J

    invoke-virtual {v4, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 145
    iget-boolean v4, p0, Lio/reactivex/observers/BaseTestConsumer;->timeout:Z

    if-eqz v4, :cond_0

    .line 146
    const-string/jumbo v4, ", timeout!"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 149
    :cond_0
    invoke-virtual {p0}, Lio/reactivex/observers/BaseTestConsumer;->isDisposed()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 150
    const-string/jumbo v4, ", disposed!"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 153
    :cond_1
    iget-object v3, p0, Lio/reactivex/observers/BaseTestConsumer;->tag:Ljava/lang/CharSequence;

    .line 154
    .local v3, "tag":Ljava/lang/CharSequence;
    if-eqz v3, :cond_2

    .line 155
    const-string/jumbo v4, ", tag = "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    .line 159
    :cond_2
    const/16 v4, 0x29

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 163
    new-instance v0, Ljava/lang/AssertionError;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v0, v4}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    .line 164
    .local v0, "ae":Ljava/lang/AssertionError;
    iget-object v4, p0, Lio/reactivex/observers/BaseTestConsumer;->errors:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_3

    .line 165
    iget-object v4, p0, Lio/reactivex/observers/BaseTestConsumer;->errors:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    const/4 v5, 0x1

    if-ne v4, v5, :cond_4

    .line 166
    iget-object v4, p0, Lio/reactivex/observers/BaseTestConsumer;->errors:Ljava/util/List;

    const/4 v5, 0x0

    invoke-interface {v4, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Throwable;

    invoke-virtual {v0, v4}, Ljava/lang/AssertionError;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 172
    :cond_3
    :goto_0
    return-object v0

    .line 168
    :cond_4
    new-instance v2, Lio/reactivex/exceptions/CompositeException;

    iget-object v4, p0, Lio/reactivex/observers/BaseTestConsumer;->errors:Ljava/util/List;

    invoke-direct {v2, v4}, Lio/reactivex/exceptions/CompositeException;-><init>(Ljava/lang/Iterable;)V

    .line 169
    .local v2, "ce":Lio/reactivex/exceptions/CompositeException;
    invoke-virtual {v0, v2}, Ljava/lang/AssertionError;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    goto :goto_0
.end method

.method public final getEvents()Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 657
    .local p0, "this":Lio/reactivex/observers/BaseTestConsumer;, "Lio/reactivex/observers/BaseTestConsumer<TT;TU;>;"
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 659
    .local v1, "result":Ljava/util/List;, "Ljava/util/List<Ljava/util/List<Ljava/lang/Object;>;>;"
    invoke-virtual {p0}, Lio/reactivex/observers/BaseTestConsumer;->values()Ljava/util/List;

    move-result-object v4

    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 661
    invoke-virtual {p0}, Lio/reactivex/observers/BaseTestConsumer;->errors()Ljava/util/List;

    move-result-object v4

    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 663
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 664
    .local v0, "completeList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    const-wide/16 v2, 0x0

    .local v2, "i":J
    :goto_0
    iget-wide v4, p0, Lio/reactivex/observers/BaseTestConsumer;->completions:J

    cmp-long v4, v2, v4

    if-gez v4, :cond_0

    .line 665
    invoke-static {}, Lio/reactivex/Notification;->createOnComplete()Lio/reactivex/Notification;

    move-result-object v4

    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 664
    const-wide/16 v4, 0x1

    add-long/2addr v2, v4

    goto :goto_0

    .line 667
    :cond_0
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 669
    return-object v1
.end method

.method public final isTerminated()Z
    .locals 4

    .prologue
    .line 105
    .local p0, "this":Lio/reactivex/observers/BaseTestConsumer;, "Lio/reactivex/observers/BaseTestConsumer<TT;TU;>;"
    iget-object v0, p0, Lio/reactivex/observers/BaseTestConsumer;->done:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v0}, Ljava/util/concurrent/CountDownLatch;->getCount()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public final isTimeout()Z
    .locals 1
    .annotation build Lio/reactivex/annotations/Experimental;
    .end annotation

    .prologue
    .line 935
    .local p0, "this":Lio/reactivex/observers/BaseTestConsumer;, "Lio/reactivex/observers/BaseTestConsumer<TT;TU;>;"
    iget-boolean v0, p0, Lio/reactivex/observers/BaseTestConsumer;->timeout:Z

    return v0
.end method

.method public final lastThread()Ljava/lang/Thread;
    .locals 1

    .prologue
    .line 73
    .local p0, "this":Lio/reactivex/observers/BaseTestConsumer;, "Lio/reactivex/observers/BaseTestConsumer<TT;TU;>;"
    iget-object v0, p0, Lio/reactivex/observers/BaseTestConsumer;->lastThread:Ljava/lang/Thread;

    return-object v0
.end method

.method public final valueCount()I
    .locals 1

    .prologue
    .line 113
    .local p0, "this":Lio/reactivex/observers/BaseTestConsumer;, "Lio/reactivex/observers/BaseTestConsumer<TT;TU;>;"
    iget-object v0, p0, Lio/reactivex/observers/BaseTestConsumer;->values:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public final values()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 81
    .local p0, "this":Lio/reactivex/observers/BaseTestConsumer;, "Lio/reactivex/observers/BaseTestConsumer<TT;TU;>;"
    iget-object v0, p0, Lio/reactivex/observers/BaseTestConsumer;->values:Ljava/util/List;

    return-object v0
.end method

.method public final withTag(Ljava/lang/CharSequence;)Lio/reactivex/observers/BaseTestConsumer;
    .locals 0
    .param p1, "tag"    # Ljava/lang/CharSequence;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/CharSequence;",
            ")TU;"
        }
    .end annotation

    .annotation build Lio/reactivex/annotations/Experimental;
    .end annotation

    .prologue
    .line 792
    .local p0, "this":Lio/reactivex/observers/BaseTestConsumer;, "Lio/reactivex/observers/BaseTestConsumer<TT;TU;>;"
    iput-object p1, p0, Lio/reactivex/observers/BaseTestConsumer;->tag:Ljava/lang/CharSequence;

    .line 793
    return-object p0
.end method
