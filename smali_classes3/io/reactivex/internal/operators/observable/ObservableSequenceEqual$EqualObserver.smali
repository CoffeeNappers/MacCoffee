.class final Lio/reactivex/internal/operators/observable/ObservableSequenceEqual$EqualObserver;
.super Ljava/lang/Object;
.source "ObservableSequenceEqual.java"

# interfaces
.implements Lio/reactivex/Observer;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/observable/ObservableSequenceEqual;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "EqualObserver"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lio/reactivex/Observer",
        "<TT;>;"
    }
.end annotation


# instance fields
.field volatile done:Z

.field error:Ljava/lang/Throwable;

.field final index:I

.field final parent:Lio/reactivex/internal/operators/observable/ObservableSequenceEqual$EqualCoordinator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/internal/operators/observable/ObservableSequenceEqual$EqualCoordinator",
            "<TT;>;"
        }
    .end annotation
.end field

.field final queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/internal/queue/SpscLinkedArrayQueue",
            "<TT;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lio/reactivex/internal/operators/observable/ObservableSequenceEqual$EqualCoordinator;II)V
    .locals 1
    .param p2, "index"    # I
    .param p3, "bufferSize"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/internal/operators/observable/ObservableSequenceEqual$EqualCoordinator",
            "<TT;>;II)V"
        }
    .end annotation

    .prologue
    .line 226
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableSequenceEqual$EqualObserver;, "Lio/reactivex/internal/operators/observable/ObservableSequenceEqual$EqualObserver<TT;>;"
    .local p1, "parent":Lio/reactivex/internal/operators/observable/ObservableSequenceEqual$EqualCoordinator;, "Lio/reactivex/internal/operators/observable/ObservableSequenceEqual$EqualCoordinator<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 227
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableSequenceEqual$EqualObserver;->parent:Lio/reactivex/internal/operators/observable/ObservableSequenceEqual$EqualCoordinator;

    .line 228
    iput p2, p0, Lio/reactivex/internal/operators/observable/ObservableSequenceEqual$EqualObserver;->index:I

    .line 229
    new-instance v0, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    invoke-direct {v0, p3}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;-><init>(I)V

    iput-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableSequenceEqual$EqualObserver;->queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    .line 230
    return-void
.end method


# virtual methods
.method public onComplete()V
    .locals 1

    .prologue
    .line 252
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableSequenceEqual$EqualObserver;, "Lio/reactivex/internal/operators/observable/ObservableSequenceEqual$EqualObserver<TT;>;"
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableSequenceEqual$EqualObserver;->done:Z

    .line 253
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableSequenceEqual$EqualObserver;->parent:Lio/reactivex/internal/operators/observable/ObservableSequenceEqual$EqualCoordinator;

    invoke-virtual {v0}, Lio/reactivex/internal/operators/observable/ObservableSequenceEqual$EqualCoordinator;->drain()V

    .line 254
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 245
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableSequenceEqual$EqualObserver;, "Lio/reactivex/internal/operators/observable/ObservableSequenceEqual$EqualObserver<TT;>;"
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableSequenceEqual$EqualObserver;->error:Ljava/lang/Throwable;

    .line 246
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableSequenceEqual$EqualObserver;->done:Z

    .line 247
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableSequenceEqual$EqualObserver;->parent:Lio/reactivex/internal/operators/observable/ObservableSequenceEqual$EqualCoordinator;

    invoke-virtual {v0}, Lio/reactivex/internal/operators/observable/ObservableSequenceEqual$EqualCoordinator;->drain()V

    .line 248
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 239
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableSequenceEqual$EqualObserver;, "Lio/reactivex/internal/operators/observable/ObservableSequenceEqual$EqualObserver<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableSequenceEqual$EqualObserver;->queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    invoke-virtual {v0, p1}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->offer(Ljava/lang/Object;)Z

    .line 240
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableSequenceEqual$EqualObserver;->parent:Lio/reactivex/internal/operators/observable/ObservableSequenceEqual$EqualCoordinator;

    invoke-virtual {v0}, Lio/reactivex/internal/operators/observable/ObservableSequenceEqual$EqualCoordinator;->drain()V

    .line 241
    return-void
.end method

.method public onSubscribe(Lio/reactivex/disposables/Disposable;)V
    .locals 2
    .param p1, "s"    # Lio/reactivex/disposables/Disposable;

    .prologue
    .line 234
    .local p0, "this":Lio/reactivex/internal/operators/observable/ObservableSequenceEqual$EqualObserver;, "Lio/reactivex/internal/operators/observable/ObservableSequenceEqual$EqualObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableSequenceEqual$EqualObserver;->parent:Lio/reactivex/internal/operators/observable/ObservableSequenceEqual$EqualCoordinator;

    iget v1, p0, Lio/reactivex/internal/operators/observable/ObservableSequenceEqual$EqualObserver;->index:I

    invoke-virtual {v0, p1, v1}, Lio/reactivex/internal/operators/observable/ObservableSequenceEqual$EqualCoordinator;->setDisposable(Lio/reactivex/disposables/Disposable;I)Z

    .line 235
    return-void
.end method
