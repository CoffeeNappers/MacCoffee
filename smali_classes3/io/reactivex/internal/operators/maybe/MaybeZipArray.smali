.class public final Lio/reactivex/internal/operators/maybe/MaybeZipArray;
.super Lio/reactivex/Maybe;
.source "MaybeZipArray.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/reactivex/internal/operators/maybe/MaybeZipArray$SingletonArrayFunc;,
        Lio/reactivex/internal/operators/maybe/MaybeZipArray$ZipMaybeObserver;,
        Lio/reactivex/internal/operators/maybe/MaybeZipArray$ZipCoordinator;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "R:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/Maybe",
        "<TR;>;"
    }
.end annotation


# instance fields
.field final sources:[Lio/reactivex/MaybeSource;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Lio/reactivex/MaybeSource",
            "<+TT;>;"
        }
    .end annotation
.end field

.field final zipper:Lio/reactivex/functions/Function;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Function",
            "<-[",
            "Ljava/lang/Object;",
            "+TR;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>([Lio/reactivex/MaybeSource;Lio/reactivex/functions/Function;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lio/reactivex/MaybeSource",
            "<+TT;>;",
            "Lio/reactivex/functions/Function",
            "<-[",
            "Ljava/lang/Object;",
            "+TR;>;)V"
        }
    .end annotation

    .prologue
    .line 32
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeZipArray;, "Lio/reactivex/internal/operators/maybe/MaybeZipArray<TT;TR;>;"
    .local p1, "sources":[Lio/reactivex/MaybeSource;, "[Lio/reactivex/MaybeSource<+TT;>;"
    .local p2, "zipper":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<-[Ljava/lang/Object;+TR;>;"
    invoke-direct {p0}, Lio/reactivex/Maybe;-><init>()V

    .line 33
    iput-object p1, p0, Lio/reactivex/internal/operators/maybe/MaybeZipArray;->sources:[Lio/reactivex/MaybeSource;

    .line 34
    iput-object p2, p0, Lio/reactivex/internal/operators/maybe/MaybeZipArray;->zipper:Lio/reactivex/functions/Function;

    .line 35
    return-void
.end method


# virtual methods
.method protected subscribeActual(Lio/reactivex/MaybeObserver;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/MaybeObserver",
            "<-TR;>;)V"
        }
    .end annotation

    .prologue
    .line 39
    .local p0, "this":Lio/reactivex/internal/operators/maybe/MaybeZipArray;, "Lio/reactivex/internal/operators/maybe/MaybeZipArray<TT;TR;>;"
    .local p1, "observer":Lio/reactivex/MaybeObserver;, "Lio/reactivex/MaybeObserver<-TR;>;"
    iget-object v4, p0, Lio/reactivex/internal/operators/maybe/MaybeZipArray;->sources:[Lio/reactivex/MaybeSource;

    .line 40
    .local v4, "sources":[Lio/reactivex/MaybeSource;, "[Lio/reactivex/MaybeSource<+TT;>;"
    array-length v1, v4

    .line 43
    .local v1, "n":I
    const/4 v5, 0x1

    if-ne v1, v5, :cond_1

    .line 44
    const/4 v5, 0x0

    aget-object v5, v4, v5

    new-instance v6, Lio/reactivex/internal/operators/maybe/MaybeMap$MapMaybeObserver;

    new-instance v7, Lio/reactivex/internal/operators/maybe/MaybeZipArray$SingletonArrayFunc;

    invoke-direct {v7, p0}, Lio/reactivex/internal/operators/maybe/MaybeZipArray$SingletonArrayFunc;-><init>(Lio/reactivex/internal/operators/maybe/MaybeZipArray;)V

    invoke-direct {v6, p1, v7}, Lio/reactivex/internal/operators/maybe/MaybeMap$MapMaybeObserver;-><init>(Lio/reactivex/MaybeObserver;Lio/reactivex/functions/Function;)V

    invoke-interface {v5, v6}, Lio/reactivex/MaybeSource;->subscribe(Lio/reactivex/MaybeObserver;)V

    .line 65
    :cond_0
    :goto_0
    return-void

    .line 48
    :cond_1
    new-instance v2, Lio/reactivex/internal/operators/maybe/MaybeZipArray$ZipCoordinator;

    iget-object v5, p0, Lio/reactivex/internal/operators/maybe/MaybeZipArray;->zipper:Lio/reactivex/functions/Function;

    invoke-direct {v2, p1, v1, v5}, Lio/reactivex/internal/operators/maybe/MaybeZipArray$ZipCoordinator;-><init>(Lio/reactivex/MaybeObserver;ILio/reactivex/functions/Function;)V

    .line 50
    .local v2, "parent":Lio/reactivex/internal/operators/maybe/MaybeZipArray$ZipCoordinator;, "Lio/reactivex/internal/operators/maybe/MaybeZipArray$ZipCoordinator<TT;TR;>;"
    invoke-interface {p1, v2}, Lio/reactivex/MaybeObserver;->onSubscribe(Lio/reactivex/disposables/Disposable;)V

    .line 52
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    if-ge v0, v1, :cond_0

    .line 53
    invoke-virtual {v2}, Lio/reactivex/internal/operators/maybe/MaybeZipArray$ZipCoordinator;->isDisposed()Z

    move-result v5

    if-nez v5, :cond_0

    .line 57
    aget-object v3, v4, v0

    .line 59
    .local v3, "source":Lio/reactivex/MaybeSource;, "Lio/reactivex/MaybeSource<+TT;>;"
    if-nez v3, :cond_2

    .line 60
    new-instance v5, Ljava/lang/NullPointerException;

    const-string/jumbo v6, "One of the sources is null"

    invoke-direct {v5, v6}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v5, v0}, Lio/reactivex/internal/operators/maybe/MaybeZipArray$ZipCoordinator;->innerError(Ljava/lang/Throwable;I)V

    goto :goto_0

    .line 63
    :cond_2
    iget-object v5, v2, Lio/reactivex/internal/operators/maybe/MaybeZipArray$ZipCoordinator;->observers:[Lio/reactivex/internal/operators/maybe/MaybeZipArray$ZipMaybeObserver;

    aget-object v5, v5, v0

    invoke-interface {v3, v5}, Lio/reactivex/MaybeSource;->subscribe(Lio/reactivex/MaybeObserver;)V

    .line 52
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method
