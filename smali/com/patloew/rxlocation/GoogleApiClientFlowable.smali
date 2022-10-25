.class public Lcom/patloew/rxlocation/GoogleApiClientFlowable;
.super Lcom/patloew/rxlocation/RxLocationFlowableOnSubscribe;
.source "GoogleApiClientFlowable.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/patloew/rxlocation/RxLocationFlowableOnSubscribe",
        "<",
        "Lcom/google/android/gms/common/api/GoogleApiClient;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>(Landroid/content/Context;[Lcom/google/android/gms/common/api/Api;[Lcom/google/android/gms/common/api/Scope;)V
    .locals 0
    .param p1, "ctx"    # Landroid/content/Context;
    .param p3, "scopes"    # [Lcom/google/android/gms/common/api/Scope;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "[",
            "Lcom/google/android/gms/common/api/Api",
            "<+",
            "Lcom/google/android/gms/common/api/Api$ApiOptions$NotRequiredOptions;",
            ">;[",
            "Lcom/google/android/gms/common/api/Scope;",
            ")V"
        }
    .end annotation

    .prologue
    .line 36
    .local p2, "apis":[Lcom/google/android/gms/common/api/Api;, "[Lcom/google/android/gms/common/api/Api<+Lcom/google/android/gms/common/api/Api$ApiOptions$NotRequiredOptions;>;"
    invoke-direct {p0, p1, p2, p3}, Lcom/patloew/rxlocation/RxLocationFlowableOnSubscribe;-><init>(Landroid/content/Context;[Lcom/google/android/gms/common/api/Api;[Lcom/google/android/gms/common/api/Scope;)V

    .line 37
    return-void
.end method

.method public static varargs create(Landroid/content/Context;[Lcom/google/android/gms/common/api/Api;)Lio/reactivex/Flowable;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # [Lcom/google/android/gms/common/api/Api;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "[",
            "Lcom/google/android/gms/common/api/Api",
            "<+",
            "Lcom/google/android/gms/common/api/Api$ApiOptions$NotRequiredOptions;",
            ">;)",
            "Lio/reactivex/Flowable",
            "<",
            "Lcom/google/android/gms/common/api/GoogleApiClient;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljava/lang/SafeVarargs;
    .end annotation

    .prologue
    .line 41
    .local p1, "apis":[Lcom/google/android/gms/common/api/Api;, "[Lcom/google/android/gms/common/api/Api<+Lcom/google/android/gms/common/api/Api$ApiOptions$NotRequiredOptions;>;"
    new-instance v0, Lcom/patloew/rxlocation/GoogleApiClientFlowable;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p1, v1}, Lcom/patloew/rxlocation/GoogleApiClientFlowable;-><init>(Landroid/content/Context;[Lcom/google/android/gms/common/api/Api;[Lcom/google/android/gms/common/api/Scope;)V

    sget-object v1, Lio/reactivex/BackpressureStrategy;->LATEST:Lio/reactivex/BackpressureStrategy;

    invoke-static {v0, v1}, Lio/reactivex/Flowable;->create(Lio/reactivex/FlowableOnSubscribe;Lio/reactivex/BackpressureStrategy;)Lio/reactivex/Flowable;

    move-result-object v0

    return-object v0
.end method

.method public static create(Landroid/content/Context;[Lcom/google/android/gms/common/api/Api;[Lcom/google/android/gms/common/api/Scope;)Lio/reactivex/Flowable;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # [Lcom/google/android/gms/common/api/Api;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "scopes"    # [Lcom/google/android/gms/common/api/Scope;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "[",
            "Lcom/google/android/gms/common/api/Api",
            "<+",
            "Lcom/google/android/gms/common/api/Api$ApiOptions$NotRequiredOptions;",
            ">;[",
            "Lcom/google/android/gms/common/api/Scope;",
            ")",
            "Lio/reactivex/Flowable",
            "<",
            "Lcom/google/android/gms/common/api/GoogleApiClient;",
            ">;"
        }
    .end annotation

    .prologue
    .line 45
    .local p1, "apis":[Lcom/google/android/gms/common/api/Api;, "[Lcom/google/android/gms/common/api/Api<+Lcom/google/android/gms/common/api/Api$ApiOptions$NotRequiredOptions;>;"
    new-instance v0, Lcom/patloew/rxlocation/GoogleApiClientFlowable;

    invoke-direct {v0, p0, p1, p2}, Lcom/patloew/rxlocation/GoogleApiClientFlowable;-><init>(Landroid/content/Context;[Lcom/google/android/gms/common/api/Api;[Lcom/google/android/gms/common/api/Scope;)V

    sget-object v1, Lio/reactivex/BackpressureStrategy;->LATEST:Lio/reactivex/BackpressureStrategy;

    invoke-static {v0, v1}, Lio/reactivex/Flowable;->create(Lio/reactivex/FlowableOnSubscribe;Lio/reactivex/BackpressureStrategy;)Lio/reactivex/Flowable;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method protected onGoogleApiClientReady(Lcom/google/android/gms/common/api/GoogleApiClient;Lio/reactivex/FlowableEmitter;)V
    .locals 0
    .param p1, "apiClient"    # Lcom/google/android/gms/common/api/GoogleApiClient;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/GoogleApiClient;",
            "Lio/reactivex/FlowableEmitter",
            "<",
            "Lcom/google/android/gms/common/api/GoogleApiClient;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 50
    .local p2, "emitter":Lio/reactivex/FlowableEmitter;, "Lio/reactivex/FlowableEmitter<Lcom/google/android/gms/common/api/GoogleApiClient;>;"
    invoke-interface {p2, p1}, Lio/reactivex/FlowableEmitter;->onNext(Ljava/lang/Object;)V

    .line 51
    return-void
.end method
