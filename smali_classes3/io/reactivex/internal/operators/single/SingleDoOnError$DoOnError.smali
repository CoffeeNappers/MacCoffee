.class final Lio/reactivex/internal/operators/single/SingleDoOnError$DoOnError;
.super Ljava/lang/Object;
.source "SingleDoOnError.java"

# interfaces
.implements Lio/reactivex/SingleObserver;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/single/SingleDoOnError;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "DoOnError"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lio/reactivex/SingleObserver",
        "<TT;>;"
    }
.end annotation


# instance fields
.field private final s:Lio/reactivex/SingleObserver;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/SingleObserver",
            "<-TT;>;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lio/reactivex/internal/operators/single/SingleDoOnError;


# direct methods
.method constructor <init>(Lio/reactivex/internal/operators/single/SingleDoOnError;Lio/reactivex/SingleObserver;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/SingleObserver",
            "<-TT;>;)V"
        }
    .end annotation

    .prologue
    .line 41
    .local p0, "this":Lio/reactivex/internal/operators/single/SingleDoOnError$DoOnError;, "Lio/reactivex/internal/operators/single/SingleDoOnError<TT;>.DoOnError;"
    .local p2, "s":Lio/reactivex/SingleObserver;, "Lio/reactivex/SingleObserver<-TT;>;"
    iput-object p1, p0, Lio/reactivex/internal/operators/single/SingleDoOnError$DoOnError;->this$0:Lio/reactivex/internal/operators/single/SingleDoOnError;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    iput-object p2, p0, Lio/reactivex/internal/operators/single/SingleDoOnError$DoOnError;->s:Lio/reactivex/SingleObserver;

    .line 43
    return-void
.end method


# virtual methods
.method public onError(Ljava/lang/Throwable;)V
    .locals 4
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 58
    .local p0, "this":Lio/reactivex/internal/operators/single/SingleDoOnError$DoOnError;, "Lio/reactivex/internal/operators/single/SingleDoOnError<TT;>.DoOnError;"
    :try_start_0
    iget-object v2, p0, Lio/reactivex/internal/operators/single/SingleDoOnError$DoOnError;->this$0:Lio/reactivex/internal/operators/single/SingleDoOnError;

    iget-object v2, v2, Lio/reactivex/internal/operators/single/SingleDoOnError;->onError:Lio/reactivex/functions/Consumer;

    invoke-interface {v2, p1}, Lio/reactivex/functions/Consumer;->accept(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 63
    :goto_0
    iget-object v2, p0, Lio/reactivex/internal/operators/single/SingleDoOnError$DoOnError;->s:Lio/reactivex/SingleObserver;

    invoke-interface {v2, p1}, Lio/reactivex/SingleObserver;->onError(Ljava/lang/Throwable;)V

    .line 64
    return-void

    .line 59
    :catch_0
    move-exception v1

    .line 60
    .local v1, "ex":Ljava/lang/Throwable;
    invoke-static {v1}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 61
    new-instance v0, Lio/reactivex/exceptions/CompositeException;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Throwable;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    const/4 v3, 0x1

    aput-object v1, v2, v3

    invoke-direct {v0, v2}, Lio/reactivex/exceptions/CompositeException;-><init>([Ljava/lang/Throwable;)V

    .end local p1    # "e":Ljava/lang/Throwable;
    .local v0, "e":Ljava/lang/Throwable;
    move-object p1, v0

    .end local v0    # "e":Ljava/lang/Throwable;
    .restart local p1    # "e":Ljava/lang/Throwable;
    goto :goto_0
.end method

.method public onSubscribe(Lio/reactivex/disposables/Disposable;)V
    .locals 1
    .param p1, "d"    # Lio/reactivex/disposables/Disposable;

    .prologue
    .line 47
    .local p0, "this":Lio/reactivex/internal/operators/single/SingleDoOnError$DoOnError;, "Lio/reactivex/internal/operators/single/SingleDoOnError<TT;>.DoOnError;"
    iget-object v0, p0, Lio/reactivex/internal/operators/single/SingleDoOnError$DoOnError;->s:Lio/reactivex/SingleObserver;

    invoke-interface {v0, p1}, Lio/reactivex/SingleObserver;->onSubscribe(Lio/reactivex/disposables/Disposable;)V

    .line 48
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
    .line 52
    .local p0, "this":Lio/reactivex/internal/operators/single/SingleDoOnError$DoOnError;, "Lio/reactivex/internal/operators/single/SingleDoOnError<TT;>.DoOnError;"
    .local p1, "value":Ljava/lang/Object;, "TT;"
    iget-object v0, p0, Lio/reactivex/internal/operators/single/SingleDoOnError$DoOnError;->s:Lio/reactivex/SingleObserver;

    invoke-interface {v0, p1}, Lio/reactivex/SingleObserver;->onSuccess(Ljava/lang/Object;)V

    .line 53
    return-void
.end method
