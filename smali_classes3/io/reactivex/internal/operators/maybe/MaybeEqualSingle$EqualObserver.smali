.class final Lio/reactivex/internal/operators/maybe/MaybeEqualSingle$EqualObserver;
.super Ljava/util/concurrent/atomic/AtomicReference;
.source "MaybeEqualSingle.java"

# interfaces
.implements Lio/reactivex/MaybeObserver;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/maybe/MaybeEqualSingle;
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
        "Ljava/util/concurrent/atomic/AtomicReference",
        "<",
        "Lio/reactivex/disposables/Disposable;",
        ">;",
        "Lio/reactivex/MaybeObserver",
        "<TT;>;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x2a13bcaec894a113L


# instance fields
.field final parent:Lio/reactivex/internal/operators/maybe/MaybeEqualSingle$EqualCoordinator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/internal/operators/maybe/MaybeEqualSingle$EqualCoordinator",
            "<TT;>;"
        }
    .end annotation
.end field

.field value:Ljava/lang/Object;


# direct methods
.method constructor <init>(Lio/reactivex/internal/operators/maybe/MaybeEqualSingle$EqualCoordinator;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/internal/operators/maybe/MaybeEqualSingle$EqualCoordinator",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 137
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeEqualSingle$EqualObserver;, "Lio/reactivex/internal/operators/maybe/MaybeEqualSingle$EqualObserver<TT;>;"
    .local p1, "parent":Lio/reactivex/internal/operators/maybe/MaybeEqualSingle$EqualCoordinator;, "Lio/reactivex/internal/operators/maybe/MaybeEqualSingle$EqualCoordinator<TT;>;"
    invoke-direct {p0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    .line 138
    iput-object p1, p0, Lio/reactivex/internal/operators/maybe/MaybeEqualSingle$EqualObserver;->parent:Lio/reactivex/internal/operators/maybe/MaybeEqualSingle$EqualCoordinator;

    .line 139
    return-void
.end method


# virtual methods
.method public dispose()V
    .locals 0

    .prologue
    .line 142
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeEqualSingle$EqualObserver;, "Lio/reactivex/internal/operators/maybe/MaybeEqualSingle$EqualObserver<TT;>;"
    invoke-static {p0}, Lio/reactivex/internal/disposables/DisposableHelper;->dispose(Ljava/util/concurrent/atomic/AtomicReference;)Z

    .line 143
    return-void
.end method

.method public onComplete()V
    .locals 1

    .prologue
    .line 163
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeEqualSingle$EqualObserver;, "Lio/reactivex/internal/operators/maybe/MaybeEqualSingle$EqualObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeEqualSingle$EqualObserver;->parent:Lio/reactivex/internal/operators/maybe/MaybeEqualSingle$EqualCoordinator;

    invoke-virtual {v0}, Lio/reactivex/internal/operators/maybe/MaybeEqualSingle$EqualCoordinator;->done()V

    .line 164
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 158
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeEqualSingle$EqualObserver;, "Lio/reactivex/internal/operators/maybe/MaybeEqualSingle$EqualObserver<TT;>;"
    iget-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeEqualSingle$EqualObserver;->parent:Lio/reactivex/internal/operators/maybe/MaybeEqualSingle$EqualCoordinator;

    invoke-virtual {v0, p0, p1}, Lio/reactivex/internal/operators/maybe/MaybeEqualSingle$EqualCoordinator;->error(Lio/reactivex/internal/operators/maybe/MaybeEqualSingle$EqualObserver;Ljava/lang/Throwable;)V

    .line 159
    return-void
.end method

.method public onSubscribe(Lio/reactivex/disposables/Disposable;)V
    .locals 0
    .param p1, "d"    # Lio/reactivex/disposables/Disposable;

    .prologue
    .line 147
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeEqualSingle$EqualObserver;, "Lio/reactivex/internal/operators/maybe/MaybeEqualSingle$EqualObserver<TT;>;"
    invoke-static {p0, p1}, Lio/reactivex/internal/disposables/DisposableHelper;->setOnce(Ljava/util/concurrent/atomic/AtomicReference;Lio/reactivex/disposables/Disposable;)Z

    .line 148
    return-void
.end method

.method public onSuccess(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 152
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeEqualSingle$EqualObserver;, "Lio/reactivex/internal/operators/maybe/MaybeEqualSingle$EqualObserver<TT;>;"
    .local p1, "value":Ljava/lang/Object;, "TT;"
    iput-object p1, p0, Lio/reactivex/internal/operators/maybe/MaybeEqualSingle$EqualObserver;->value:Ljava/lang/Object;

    .line 153
    iget-object v0, p0, Lio/reactivex/internal/operators/maybe/MaybeEqualSingle$EqualObserver;->parent:Lio/reactivex/internal/operators/maybe/MaybeEqualSingle$EqualCoordinator;

    invoke-virtual {v0}, Lio/reactivex/internal/operators/maybe/MaybeEqualSingle$EqualCoordinator;->done()V

    .line 154
    return-void
.end method
