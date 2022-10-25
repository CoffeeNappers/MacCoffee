.class Lcom/patloew/rxlocation/StatusErrorResultCallBack;
.super Ljava/lang/Object;
.source "StatusErrorResultCallBack.java"

# interfaces
.implements Lcom/google/android/gms/common/api/ResultCallback;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/android/gms/common/api/ResultCallback",
        "<",
        "Lcom/google/android/gms/common/api/Status;",
        ">;"
    }
.end annotation


# instance fields
.field private final emitter:Lio/reactivex/FlowableEmitter;


# direct methods
.method constructor <init>(Lio/reactivex/FlowableEmitter;)V
    .locals 0
    .param p1, "emitter"    # Lio/reactivex/FlowableEmitter;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    iput-object p1, p0, Lcom/patloew/rxlocation/StatusErrorResultCallBack;->emitter:Lio/reactivex/FlowableEmitter;

    .line 29
    return-void
.end method


# virtual methods
.method public bridge synthetic onResult(Lcom/google/android/gms/common/api/Result;)V
    .locals 0
    .param p1    # Lcom/google/android/gms/common/api/Result;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 23
    check-cast p1, Lcom/google/android/gms/common/api/Status;

    invoke-virtual {p0, p1}, Lcom/patloew/rxlocation/StatusErrorResultCallBack;->onResult(Lcom/google/android/gms/common/api/Status;)V

    return-void
.end method

.method public onResult(Lcom/google/android/gms/common/api/Status;)V
    .locals 2
    .param p1, "status"    # Lcom/google/android/gms/common/api/Status;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 33
    invoke-virtual {p1}, Lcom/google/android/gms/common/api/Status;->isSuccess()Z

    move-result v0

    if-nez v0, :cond_0

    .line 34
    iget-object v0, p0, Lcom/patloew/rxlocation/StatusErrorResultCallBack;->emitter:Lio/reactivex/FlowableEmitter;

    new-instance v1, Lcom/patloew/rxlocation/StatusException;

    invoke-direct {v1, p1}, Lcom/patloew/rxlocation/StatusException;-><init>(Lcom/google/android/gms/common/api/Result;)V

    invoke-interface {v0, v1}, Lio/reactivex/FlowableEmitter;->onError(Ljava/lang/Throwable;)V

    .line 36
    :cond_0
    return-void
.end method
