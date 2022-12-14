.class public final Lio/reactivex/internal/operators/observable/ObservableScalarXMap$ScalarDisposable;
.super Ljava/util/concurrent/atomic/AtomicInteger;
.source "ObservableScalarXMap.java"

# interfaces
.implements Lio/reactivex/internal/fuseable/QueueDisposable;
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/observable/ObservableScalarXMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "ScalarDisposable"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/concurrent/atomic/AtomicInteger;",
        "Lio/reactivex/internal/fuseable/QueueDisposable",
        "<TT;>;",
        "Ljava/lang/Runnable;"
    }
.end annotation


# static fields
.field static final FUSED:I = 0x1

.field static final ON_COMPLETE:I = 0x3

.field static final ON_NEXT:I = 0x2

.field static final START:I = 0x0

.field private static final serialVersionUID:J = 0x35dc0e519322c4a3L


# instance fields
.field final observer:Lio/reactivex/Observer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/Observer",
            "<-TT;>;"
        }
    .end annotation
.end field

.field final value:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lio/reactivex/Observer;Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Observer",
            "<-TT;>;TT;)V"
        }
    .end annotation

    .prologue
    .line 191
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableScalarXMap$ScalarDisposable;, "Lio/reactivex/internal/operators/observable/ObservableScalarXMap$ScalarDisposable<TT;>;"
    .local p1, "observer":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TT;>;"
    .local p2, "value":Ljava/lang/Object;, "TT;"
    invoke-direct {p0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    .line 192
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableScalarXMap$ScalarDisposable;->observer:Lio/reactivex/Observer;

    .line 193
    iput-object p2, p0, Lio/reactivex/internal/operators/observable/ObservableScalarXMap$ScalarDisposable;->value:Ljava/lang/Object;

    .line 194
    return-void
.end method


# virtual methods
.method public clear()V
    .locals 1

    .prologue
    .line 223
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableScalarXMap$ScalarDisposable;, "Lio/reactivex/internal/operators/observable/ObservableScalarXMap$ScalarDisposable<TT;>;"
    const/4 v0, 0x3

    invoke-virtual {p0, v0}, Lio/reactivex/internal/operators/observable/ObservableScalarXMap$ScalarDisposable;->lazySet(I)V

    .line 224
    return-void
.end method

.method public dispose()V
    .locals 1

    .prologue
    .line 228
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableScalarXMap$ScalarDisposable;, "Lio/reactivex/internal/operators/observable/ObservableScalarXMap$ScalarDisposable<TT;>;"
    const/4 v0, 0x3

    invoke-virtual {p0, v0}, Lio/reactivex/internal/operators/observable/ObservableScalarXMap$ScalarDisposable;->set(I)V

    .line 229
    return-void
.end method

.method public isDisposed()Z
    .locals 2

    .prologue
    .line 233
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableScalarXMap$ScalarDisposable;, "Lio/reactivex/internal/operators/observable/ObservableScalarXMap$ScalarDisposable<TT;>;"
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableScalarXMap$ScalarDisposable;->get()I

    move-result v0

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isEmpty()Z
    .locals 2

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableScalarXMap$ScalarDisposable;, "Lio/reactivex/internal/operators/observable/ObservableScalarXMap$ScalarDisposable<TT;>;"
    const/4 v0, 0x1

    .line 218
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableScalarXMap$ScalarDisposable;->get()I

    move-result v1

    if-eq v1, v0, :cond_0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public offer(Ljava/lang/Object;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    .prologue
    .line 198
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableScalarXMap$ScalarDisposable;, "Lio/reactivex/internal/operators/observable/ObservableScalarXMap$ScalarDisposable<TT;>;"
    .local p1, "value":Ljava/lang/Object;, "TT;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string/jumbo v1, "Should not be called!"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public offer(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TT;)Z"
        }
    .end annotation

    .prologue
    .line 203
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableScalarXMap$ScalarDisposable;, "Lio/reactivex/internal/operators/observable/ObservableScalarXMap$ScalarDisposable<TT;>;"
    .local p1, "v1":Ljava/lang/Object;, "TT;"
    .local p2, "v2":Ljava/lang/Object;, "TT;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string/jumbo v1, "Should not be called!"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public poll()Ljava/lang/Object;
    .locals 2
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
    .line 209
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableScalarXMap$ScalarDisposable;, "Lio/reactivex/internal/operators/observable/ObservableScalarXMap$ScalarDisposable<TT;>;"
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableScalarXMap$ScalarDisposable;->get()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 210
    const/4 v0, 0x3

    invoke-virtual {p0, v0}, Lio/reactivex/internal/operators/observable/ObservableScalarXMap$ScalarDisposable;->lazySet(I)V

    .line 211
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableScalarXMap$ScalarDisposable;->value:Ljava/lang/Object;

    .line 213
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public requestFusion(I)I
    .locals 2
    .param p1, "mode"    # I

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableScalarXMap$ScalarDisposable;, "Lio/reactivex/internal/operators/observable/ObservableScalarXMap$ScalarDisposable<TT;>;"
    const/4 v0, 0x1

    .line 238
    and-int/lit8 v1, p1, 0x1

    if-eqz v1, :cond_0

    .line 239
    invoke-virtual {p0, v0}, Lio/reactivex/internal/operators/observable/ObservableScalarXMap$ScalarDisposable;->lazySet(I)V

    .line 242
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public run()V
    .locals 3

    .prologue
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableScalarXMap$ScalarDisposable;, "Lio/reactivex/internal/operators/observable/ObservableScalarXMap$ScalarDisposable<TT;>;"
    const/4 v2, 0x2

    .line 247
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableScalarXMap$ScalarDisposable;->get()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    invoke-virtual {p0, v0, v2}, Lio/reactivex/internal/operators/observable/ObservableScalarXMap$ScalarDisposable;->compareAndSet(II)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 248
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableScalarXMap$ScalarDisposable;->observer:Lio/reactivex/Observer;

    iget-object v1, p0, Lio/reactivex/internal/operators/observable/ObservableScalarXMap$ScalarDisposable;->value:Ljava/lang/Object;

    invoke-interface {v0, v1}, Lio/reactivex/Observer;->onNext(Ljava/lang/Object;)V

    .line 249
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableScalarXMap$ScalarDisposable;->get()I

    move-result v0

    if-ne v0, v2, :cond_0

    .line 250
    const/4 v0, 0x3

    invoke-virtual {p0, v0}, Lio/reactivex/internal/operators/observable/ObservableScalarXMap$ScalarDisposable;->lazySet(I)V

    .line 251
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableScalarXMap$ScalarDisposable;->observer:Lio/reactivex/Observer;

    invoke-interface {v0}, Lio/reactivex/Observer;->onComplete()V

    .line 254
    :cond_0
    return-void
.end method
