.class public final Lio/reactivex/internal/disposables/ArrayCompositeDisposable;
.super Ljava/util/concurrent/atomic/AtomicReferenceArray;
.source "ArrayCompositeDisposable.java"

# interfaces
.implements Lio/reactivex/disposables/Disposable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/concurrent/atomic/AtomicReferenceArray",
        "<",
        "Lio/reactivex/disposables/Disposable;",
        ">;",
        "Lio/reactivex/disposables/Disposable;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x261d229f8c0b4b20L


# direct methods
.method public constructor <init>(I)V
    .locals 0
    .param p1, "capacity"    # I

    .prologue
    .line 32
    invoke-direct {p0, p1}, Ljava/util/concurrent/atomic/AtomicReferenceArray;-><init>(I)V

    .line 33
    return-void
.end method


# virtual methods
.method public dispose()V
    .locals 5

    .prologue
    .line 78
    const/4 v3, 0x0

    invoke-virtual {p0, v3}, Lio/reactivex/internal/disposables/ArrayCompositeDisposable;->get(I)Ljava/lang/Object;

    move-result-object v3

    sget-object v4, Lio/reactivex/internal/disposables/DisposableHelper;->DISPOSED:Lio/reactivex/internal/disposables/DisposableHelper;

    if-eq v3, v4, :cond_1

    .line 79
    invoke-virtual {p0}, Lio/reactivex/internal/disposables/ArrayCompositeDisposable;->length()I

    move-result v2

    .line 80
    .local v2, "s":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, v2, :cond_1

    .line 81
    invoke-virtual {p0, v0}, Lio/reactivex/internal/disposables/ArrayCompositeDisposable;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/reactivex/disposables/Disposable;

    .line 82
    .local v1, "o":Lio/reactivex/disposables/Disposable;
    sget-object v3, Lio/reactivex/internal/disposables/DisposableHelper;->DISPOSED:Lio/reactivex/internal/disposables/DisposableHelper;

    if-eq v1, v3, :cond_0

    .line 83
    sget-object v3, Lio/reactivex/internal/disposables/DisposableHelper;->DISPOSED:Lio/reactivex/internal/disposables/DisposableHelper;

    invoke-virtual {p0, v0, v3}, Lio/reactivex/internal/disposables/ArrayCompositeDisposable;->getAndSet(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .end local v1    # "o":Lio/reactivex/disposables/Disposable;
    check-cast v1, Lio/reactivex/disposables/Disposable;

    .line 84
    .restart local v1    # "o":Lio/reactivex/disposables/Disposable;
    sget-object v3, Lio/reactivex/internal/disposables/DisposableHelper;->DISPOSED:Lio/reactivex/internal/disposables/DisposableHelper;

    if-eq v1, v3, :cond_0

    if-eqz v1, :cond_0

    .line 85
    invoke-interface {v1}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 80
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 90
    .end local v0    # "i":I
    .end local v1    # "o":Lio/reactivex/disposables/Disposable;
    .end local v2    # "s":I
    :cond_1
    return-void
.end method

.method public isDisposed()Z
    .locals 3

    .prologue
    const/4 v0, 0x0

    .line 94
    invoke-virtual {p0, v0}, Lio/reactivex/internal/disposables/ArrayCompositeDisposable;->get(I)Ljava/lang/Object;

    move-result-object v1

    sget-object v2, Lio/reactivex/internal/disposables/DisposableHelper;->DISPOSED:Lio/reactivex/internal/disposables/DisposableHelper;

    if-ne v1, v2, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method public replaceResource(ILio/reactivex/disposables/Disposable;)Lio/reactivex/disposables/Disposable;
    .locals 2
    .param p1, "index"    # I
    .param p2, "resource"    # Lio/reactivex/disposables/Disposable;

    .prologue
    .line 65
    :cond_0
    invoke-virtual {p0, p1}, Lio/reactivex/internal/disposables/ArrayCompositeDisposable;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/reactivex/disposables/Disposable;

    .line 66
    .local v0, "o":Lio/reactivex/disposables/Disposable;
    sget-object v1, Lio/reactivex/internal/disposables/DisposableHelper;->DISPOSED:Lio/reactivex/internal/disposables/DisposableHelper;

    if-ne v0, v1, :cond_1

    .line 67
    invoke-interface {p2}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 68
    const/4 v0, 0x0

    .line 71
    .end local v0    # "o":Lio/reactivex/disposables/Disposable;
    :goto_0
    return-object v0

    .line 70
    .restart local v0    # "o":Lio/reactivex/disposables/Disposable;
    :cond_1
    invoke-virtual {p0, p1, v0, p2}, Lio/reactivex/internal/disposables/ArrayCompositeDisposable;->compareAndSet(ILjava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0
.end method

.method public setResource(ILio/reactivex/disposables/Disposable;)Z
    .locals 2
    .param p1, "index"    # I
    .param p2, "resource"    # Lio/reactivex/disposables/Disposable;

    .prologue
    .line 43
    :cond_0
    invoke-virtual {p0, p1}, Lio/reactivex/internal/disposables/ArrayCompositeDisposable;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/reactivex/disposables/Disposable;

    .line 44
    .local v0, "o":Lio/reactivex/disposables/Disposable;
    sget-object v1, Lio/reactivex/internal/disposables/DisposableHelper;->DISPOSED:Lio/reactivex/internal/disposables/DisposableHelper;

    if-ne v0, v1, :cond_1

    .line 45
    invoke-interface {p2}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 46
    const/4 v1, 0x0

    .line 52
    :goto_0
    return v1

    .line 48
    :cond_1
    invoke-virtual {p0, p1, v0, p2}, Lio/reactivex/internal/disposables/ArrayCompositeDisposable;->compareAndSet(ILjava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 49
    if-eqz v0, :cond_2

    .line 50
    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    .line 52
    :cond_2
    const/4 v1, 0x1

    goto :goto_0
.end method
