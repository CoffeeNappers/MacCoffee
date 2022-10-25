.class final Lio/reactivex/internal/operators/single/SingleOnErrorReturn$OnErrorReturn;
.super Ljava/lang/Object;
.source "SingleOnErrorReturn.java"

# interfaces
.implements Lio/reactivex/SingleObserver;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/single/SingleOnErrorReturn;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "OnErrorReturn"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lio/reactivex/SingleObserver",
        "<TT;>;"
    }
.end annotation


# instance fields
.field private final observer:Lio/reactivex/SingleObserver;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/SingleObserver",
            "<-TT;>;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lio/reactivex/internal/operators/single/SingleOnErrorReturn;


# direct methods
.method constructor <init>(Lio/reactivex/internal/operators/single/SingleOnErrorReturn;Lio/reactivex/SingleObserver;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/SingleObserver",
            "<-TT;>;)V"
        }
    .end annotation

    .prologue
    .line 47
    .local p0, "this":Lio/reactivex/internal/operators/single/SingleOnErrorReturn$OnErrorReturn;, "Lio/reactivex/internal/operators/single/SingleOnErrorReturn<TT;>.OnErrorReturn;"
    .local p2, "observer":Lio/reactivex/SingleObserver;, "Lio/reactivex/SingleObserver<-TT;>;"
    iput-object p1, p0, Lio/reactivex/internal/operators/single/SingleOnErrorReturn$OnErrorReturn;->this$0:Lio/reactivex/internal/operators/single/SingleOnErrorReturn;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    iput-object p2, p0, Lio/reactivex/internal/operators/single/SingleOnErrorReturn$OnErrorReturn;->observer:Lio/reactivex/SingleObserver;

    .line 49
    return-void
.end method


# virtual methods
.method public onError(Ljava/lang/Throwable;)V
    .locals 7
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 55
    .local p0, "this":Lio/reactivex/internal/operators/single/SingleOnErrorReturn$OnErrorReturn;, "Lio/reactivex/internal/operators/single/SingleOnErrorReturn<TT;>.OnErrorReturn;"
    iget-object v3, p0, Lio/reactivex/internal/operators/single/SingleOnErrorReturn$OnErrorReturn;->this$0:Lio/reactivex/internal/operators/single/SingleOnErrorReturn;

    iget-object v3, v3, Lio/reactivex/internal/operators/single/SingleOnErrorReturn;->valueSupplier:Lio/reactivex/functions/Function;

    if-eqz v3, :cond_0

    .line 57
    :try_start_0
    iget-object v3, p0, Lio/reactivex/internal/operators/single/SingleOnErrorReturn$OnErrorReturn;->this$0:Lio/reactivex/internal/operators/single/SingleOnErrorReturn;

    iget-object v3, v3, Lio/reactivex/internal/operators/single/SingleOnErrorReturn;->valueSupplier:Lio/reactivex/functions/Function;

    invoke-interface {v3, p1}, Lio/reactivex/functions/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 67
    .local v2, "v":Ljava/lang/Object;, "TT;"
    :goto_0
    if-nez v2, :cond_1

    .line 68
    new-instance v1, Ljava/lang/NullPointerException;

    const-string/jumbo v3, "Value supplied was null"

    invoke-direct {v1, v3}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 69
    .local v1, "npe":Ljava/lang/NullPointerException;
    invoke-virtual {v1, p1}, Ljava/lang/NullPointerException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 70
    iget-object v3, p0, Lio/reactivex/internal/operators/single/SingleOnErrorReturn$OnErrorReturn;->observer:Lio/reactivex/SingleObserver;

    invoke-interface {v3, v1}, Lio/reactivex/SingleObserver;->onError(Ljava/lang/Throwable;)V

    .line 75
    .end local v1    # "npe":Ljava/lang/NullPointerException;
    .end local v2    # "v":Ljava/lang/Object;, "TT;"
    :goto_1
    return-void

    .line 58
    :catch_0
    move-exception v0

    .line 59
    .local v0, "ex":Ljava/lang/Throwable;
    invoke-static {v0}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    .line 60
    iget-object v3, p0, Lio/reactivex/internal/operators/single/SingleOnErrorReturn$OnErrorReturn;->observer:Lio/reactivex/SingleObserver;

    new-instance v4, Lio/reactivex/exceptions/CompositeException;

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Throwable;

    const/4 v6, 0x0

    aput-object p1, v5, v6

    const/4 v6, 0x1

    aput-object v0, v5, v6

    invoke-direct {v4, v5}, Lio/reactivex/exceptions/CompositeException;-><init>([Ljava/lang/Throwable;)V

    invoke-interface {v3, v4}, Lio/reactivex/SingleObserver;->onError(Ljava/lang/Throwable;)V

    goto :goto_1

    .line 64
    .end local v0    # "ex":Ljava/lang/Throwable;
    :cond_0
    iget-object v3, p0, Lio/reactivex/internal/operators/single/SingleOnErrorReturn$OnErrorReturn;->this$0:Lio/reactivex/internal/operators/single/SingleOnErrorReturn;

    iget-object v2, v3, Lio/reactivex/internal/operators/single/SingleOnErrorReturn;->value:Ljava/lang/Object;

    .restart local v2    # "v":Ljava/lang/Object;, "TT;"
    goto :goto_0

    .line 74
    :cond_1
    iget-object v3, p0, Lio/reactivex/internal/operators/single/SingleOnErrorReturn$OnErrorReturn;->observer:Lio/reactivex/SingleObserver;

    invoke-interface {v3, v2}, Lio/reactivex/SingleObserver;->onSuccess(Ljava/lang/Object;)V

    goto :goto_1
.end method

.method public onSubscribe(Lio/reactivex/disposables/Disposable;)V
    .locals 1
    .param p1, "d"    # Lio/reactivex/disposables/Disposable;

    .prologue
    .line 79
    .local p0, "this":Lio/reactivex/internal/operators/single/SingleOnErrorReturn$OnErrorReturn;, "Lio/reactivex/internal/operators/single/SingleOnErrorReturn<TT;>.OnErrorReturn;"
    iget-object v0, p0, Lio/reactivex/internal/operators/single/SingleOnErrorReturn$OnErrorReturn;->observer:Lio/reactivex/SingleObserver;

    invoke-interface {v0, p1}, Lio/reactivex/SingleObserver;->onSubscribe(Lio/reactivex/disposables/Disposable;)V

    .line 80
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
    .line 84
    .local p0, "this":Lio/reactivex/internal/operators/single/SingleOnErrorReturn$OnErrorReturn;, "Lio/reactivex/internal/operators/single/SingleOnErrorReturn<TT;>.OnErrorReturn;"
    .local p1, "value":Ljava/lang/Object;, "TT;"
    iget-object v0, p0, Lio/reactivex/internal/operators/single/SingleOnErrorReturn$OnErrorReturn;->observer:Lio/reactivex/SingleObserver;

    invoke-interface {v0, p1}, Lio/reactivex/SingleObserver;->onSuccess(Ljava/lang/Object;)V

    .line 85
    return-void
.end method
