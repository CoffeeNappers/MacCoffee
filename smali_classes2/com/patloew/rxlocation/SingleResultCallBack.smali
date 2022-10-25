.class Lcom/patloew/rxlocation/SingleResultCallBack;
.super Ljava/lang/Object;
.source "SingleResultCallBack.java"

# interfaces
.implements Lcom/google/android/gms/common/api/ResultCallback;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T::",
        "Lcom/google/android/gms/common/api/Result;",
        "R:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/google/android/gms/common/api/ResultCallback",
        "<TT;>;"
    }
.end annotation


# static fields
.field private static final ID_FUNC:Lio/reactivex/functions/Function;


# instance fields
.field private final emitter:Lio/reactivex/SingleEmitter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/SingleEmitter",
            "<TR;>;"
        }
    .end annotation
.end field

.field private final mapper:Lio/reactivex/functions/Function;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Function",
            "<TT;TR;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 26
    invoke-static {}, Lcom/patloew/rxlocation/SingleResultCallBack$$Lambda$1;->lambdaFactory$()Lio/reactivex/functions/Function;

    move-result-object v0

    sput-object v0, Lcom/patloew/rxlocation/SingleResultCallBack;->ID_FUNC:Lio/reactivex/functions/Function;

    return-void
.end method

.method private constructor <init>(Lio/reactivex/SingleEmitter;Lio/reactivex/functions/Function;)V
    .locals 0
    .param p1    # Lio/reactivex/SingleEmitter;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lio/reactivex/functions/Function;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/SingleEmitter",
            "<TR;>;",
            "Lio/reactivex/functions/Function",
            "<TT;TR;>;)V"
        }
    .end annotation

    .prologue
    .line 31
    .local p0, "this":Lcom/patloew/rxlocation/SingleResultCallBack;, "Lcom/patloew/rxlocation/SingleResultCallBack<TT;TR;>;"
    .local p1, "emitter":Lio/reactivex/SingleEmitter;, "Lio/reactivex/SingleEmitter<TR;>;"
    .local p2, "mapper":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<TT;TR;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    iput-object p1, p0, Lcom/patloew/rxlocation/SingleResultCallBack;->emitter:Lio/reactivex/SingleEmitter;

    .line 33
    iput-object p2, p0, Lcom/patloew/rxlocation/SingleResultCallBack;->mapper:Lio/reactivex/functions/Function;

    .line 34
    return-void
.end method

.method static get(Lio/reactivex/SingleEmitter;)Lcom/google/android/gms/common/api/ResultCallback;
    .locals 2
    .param p0    # Lio/reactivex/SingleEmitter;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lcom/google/android/gms/common/api/Result;",
            ">(",
            "Lio/reactivex/SingleEmitter",
            "<TT;>;)",
            "Lcom/google/android/gms/common/api/ResultCallback",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 42
    .local p0, "emitter":Lio/reactivex/SingleEmitter;, "Lio/reactivex/SingleEmitter<TT;>;"
    new-instance v0, Lcom/patloew/rxlocation/SingleResultCallBack;

    sget-object v1, Lcom/patloew/rxlocation/SingleResultCallBack;->ID_FUNC:Lio/reactivex/functions/Function;

    invoke-direct {v0, p0, v1}, Lcom/patloew/rxlocation/SingleResultCallBack;-><init>(Lio/reactivex/SingleEmitter;Lio/reactivex/functions/Function;)V

    return-object v0
.end method

.method static get(Lio/reactivex/SingleEmitter;Lio/reactivex/functions/Function;)Lcom/google/android/gms/common/api/ResultCallback;
    .locals 1
    .param p0    # Lio/reactivex/SingleEmitter;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Lio/reactivex/functions/Function;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lcom/google/android/gms/common/api/Result;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/SingleEmitter",
            "<TR;>;",
            "Lio/reactivex/functions/Function",
            "<TT;TR;>;)",
            "Lcom/google/android/gms/common/api/ResultCallback",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 37
    .local p0, "emitter":Lio/reactivex/SingleEmitter;, "Lio/reactivex/SingleEmitter<TR;>;"
    .local p1, "mapper":Lio/reactivex/functions/Function;, "Lio/reactivex/functions/Function<TT;TR;>;"
    new-instance v0, Lcom/patloew/rxlocation/SingleResultCallBack;

    invoke-direct {v0, p0, p1}, Lcom/patloew/rxlocation/SingleResultCallBack;-><init>(Lio/reactivex/SingleEmitter;Lio/reactivex/functions/Function;)V

    return-object v0
.end method

.method static synthetic lambda$static$0(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0
    .param p0, "input"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 26
    return-object p0
.end method


# virtual methods
.method public onResult(Lcom/google/android/gms/common/api/Result;)V
    .locals 3
    .param p1    # Lcom/google/android/gms/common/api/Result;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 47
    .local p0, "this":Lcom/patloew/rxlocation/SingleResultCallBack;, "Lcom/patloew/rxlocation/SingleResultCallBack<TT;TR;>;"
    .local p1, "result":Lcom/google/android/gms/common/api/Result;, "TT;"
    invoke-interface {p1}, Lcom/google/android/gms/common/api/Result;->getStatus()Lcom/google/android/gms/common/api/Status;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/common/api/Status;->isSuccess()Z

    move-result v1

    if-nez v1, :cond_0

    .line 48
    iget-object v1, p0, Lcom/patloew/rxlocation/SingleResultCallBack;->emitter:Lio/reactivex/SingleEmitter;

    new-instance v2, Lcom/patloew/rxlocation/StatusException;

    invoke-direct {v2, p1}, Lcom/patloew/rxlocation/StatusException;-><init>(Lcom/google/android/gms/common/api/Result;)V

    invoke-interface {v1, v2}, Lio/reactivex/SingleEmitter;->onError(Ljava/lang/Throwable;)V

    .line 56
    :goto_0
    return-void

    .line 51
    :cond_0
    :try_start_0
    iget-object v1, p0, Lcom/patloew/rxlocation/SingleResultCallBack;->emitter:Lio/reactivex/SingleEmitter;

    iget-object v2, p0, Lcom/patloew/rxlocation/SingleResultCallBack;->mapper:Lio/reactivex/functions/Function;

    invoke-interface {v2, p1}, Lio/reactivex/functions/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v1, v2}, Lio/reactivex/SingleEmitter;->onSuccess(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 52
    :catch_0
    move-exception v0

    .line 53
    .local v0, "e":Ljava/lang/Exception;
    iget-object v1, p0, Lcom/patloew/rxlocation/SingleResultCallBack;->emitter:Lio/reactivex/SingleEmitter;

    invoke-interface {v1, v0}, Lio/reactivex/SingleEmitter;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method
