.class public Lcom/vk/core/util/RxUtil;
.super Ljava/lang/Object;
.source "RxUtil.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static blockingGetWithNull(Lio/reactivex/Observable;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lio/reactivex/Observable",
            "<TT;>;)TT;"
        }
    .end annotation

    .prologue
    .line 8
    .local p0, "observable":Lio/reactivex/Observable;, "Lio/reactivex/Observable<TT;>;"
    :try_start_0
    invoke-virtual {p0}, Lio/reactivex/Observable;->blockingFirst()Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 10
    :goto_0
    return-object v1

    .line 9
    :catch_0
    move-exception v0

    .line 10
    .local v0, "t":Ljava/lang/Throwable;
    const/4 v1, 0x0

    goto :goto_0
.end method
