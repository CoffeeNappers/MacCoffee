.class final Lio/reactivex/subjects/MaybeSubject$MaybeDisposable;
.super Ljava/util/concurrent/atomic/AtomicReference;
.source "MaybeSubject.java"

# interfaces
.implements Lio/reactivex/disposables/Disposable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/subjects/MaybeSubject;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "MaybeDisposable"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/concurrent/atomic/AtomicReference",
        "<",
        "Lio/reactivex/subjects/MaybeSubject",
        "<TT;>;>;",
        "Lio/reactivex/disposables/Disposable;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x6a2d77ea7e969284L


# instance fields
.field final actual:Lio/reactivex/MaybeObserver;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/MaybeObserver",
            "<-TT;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lio/reactivex/MaybeObserver;Lio/reactivex/subjects/MaybeSubject;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/MaybeObserver",
            "<-TT;>;",
            "Lio/reactivex/subjects/MaybeSubject",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 259
    .local p0, "this":Lio/reactivex/subjects/MaybeSubject$MaybeDisposable;, "Lio/reactivex/subjects/MaybeSubject$MaybeDisposable<TT;>;"
    .local p1, "actual":Lio/reactivex/MaybeObserver;, "Lio/reactivex/MaybeObserver<-TT;>;"
    .local p2, "parent":Lio/reactivex/subjects/MaybeSubject;, "Lio/reactivex/subjects/MaybeSubject<TT;>;"
    invoke-direct {p0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    .line 260
    iput-object p1, p0, Lio/reactivex/subjects/MaybeSubject$MaybeDisposable;->actual:Lio/reactivex/MaybeObserver;

    .line 261
    invoke-virtual {p0, p2}, Lio/reactivex/subjects/MaybeSubject$MaybeDisposable;->lazySet(Ljava/lang/Object;)V

    .line 262
    return-void
.end method


# virtual methods
.method public dispose()V
    .locals 2

    .prologue
    .line 266
    .local p0, "this":Lio/reactivex/subjects/MaybeSubject$MaybeDisposable;, "Lio/reactivex/subjects/MaybeSubject$MaybeDisposable<TT;>;"
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lio/reactivex/subjects/MaybeSubject$MaybeDisposable;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/reactivex/subjects/MaybeSubject;

    .line 267
    .local v0, "parent":Lio/reactivex/subjects/MaybeSubject;, "Lio/reactivex/subjects/MaybeSubject<TT;>;"
    if-eqz v0, :cond_0

    .line 268
    invoke-virtual {v0, p0}, Lio/reactivex/subjects/MaybeSubject;->remove(Lio/reactivex/subjects/MaybeSubject$MaybeDisposable;)V

    .line 270
    :cond_0
    return-void
.end method

.method public isDisposed()Z
    .locals 1

    .prologue
    .line 274
    .local p0, "this":Lio/reactivex/subjects/MaybeSubject$MaybeDisposable;, "Lio/reactivex/subjects/MaybeSubject$MaybeDisposable<TT;>;"
    invoke-virtual {p0}, Lio/reactivex/subjects/MaybeSubject$MaybeDisposable;->get()Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
