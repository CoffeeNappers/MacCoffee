.class Lcom/vkontakte/android/api/VKAPIRequest$1;
.super Ljava/lang/Object;
.source "VKAPIRequest.java"

# interfaces
.implements Lio/reactivex/ObservableOnSubscribe;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/api/VKAPIRequest;->toObservable()Lio/reactivex/Observable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lio/reactivex/ObservableOnSubscribe",
        "<TT;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/api/VKAPIRequest;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/api/VKAPIRequest;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/api/VKAPIRequest;

    .prologue
    .line 271
    .local p0, "this":Lcom/vkontakte/android/api/VKAPIRequest$1;, "Lcom/vkontakte/android/api/VKAPIRequest$1;"
    iput-object p1, p0, Lcom/vkontakte/android/api/VKAPIRequest$1;->this$0:Lcom/vkontakte/android/api/VKAPIRequest;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public subscribe(Lio/reactivex/ObservableEmitter;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/ObservableEmitter",
            "<TT;>;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 274
    .local p0, "this":Lcom/vkontakte/android/api/VKAPIRequest$1;, "Lcom/vkontakte/android/api/VKAPIRequest$1;"
    .local p1, "e":Lio/reactivex/ObservableEmitter;, "Lio/reactivex/ObservableEmitter<TT;>;"
    iget-object v3, p0, Lcom/vkontakte/android/api/VKAPIRequest$1;->this$0:Lcom/vkontakte/android/api/VKAPIRequest;

    invoke-interface {p1, v3}, Lio/reactivex/ObservableEmitter;->setCancellable(Lio/reactivex/functions/Cancellable;)V

    .line 276
    :try_start_0
    iget-object v3, p0, Lcom/vkontakte/android/api/VKAPIRequest$1;->this$0:Lcom/vkontakte/android/api/VKAPIRequest;

    invoke-static {v3}, Lcom/vkontakte/android/api/APIController;->runRequest(Lcom/vkontakte/android/api/VKAPIRequest;)Lorg/json/JSONObject;

    move-result-object v1

    .line 277
    .local v1, "o":Lorg/json/JSONObject;
    invoke-interface {p1}, Lio/reactivex/ObservableEmitter;->isDisposed()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 295
    .end local v1    # "o":Lorg/json/JSONObject;
    :cond_0
    :goto_0
    return-void

    .line 281
    .restart local v1    # "o":Lorg/json/JSONObject;
    :cond_1
    iget-object v3, p0, Lcom/vkontakte/android/api/VKAPIRequest$1;->this$0:Lcom/vkontakte/android/api/VKAPIRequest;

    invoke-virtual {v3, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->parseResponse(Lorg/json/JSONObject;)Ljava/lang/Object;

    move-result-object v2

    .line 282
    .local v2, "result":Ljava/lang/Object;
    if-nez v2, :cond_2

    .line 283
    new-instance v3, Ljava/io/IOException;

    const-string/jumbo v4, "Can\'t parse response"

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 290
    .end local v1    # "o":Lorg/json/JSONObject;
    .end local v2    # "result":Ljava/lang/Object;
    :catch_0
    move-exception v0

    .line 291
    .local v0, "ex":Ljava/lang/Exception;
    invoke-interface {p1}, Lio/reactivex/ObservableEmitter;->isDisposed()Z

    move-result v3

    if-nez v3, :cond_0

    .line 292
    invoke-interface {p1, v0}, Lio/reactivex/ObservableEmitter;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 284
    .end local v0    # "ex":Ljava/lang/Exception;
    .restart local v1    # "o":Lorg/json/JSONObject;
    .restart local v2    # "result":Ljava/lang/Object;
    :cond_2
    :try_start_1
    instance-of v3, v2, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    if-eqz v3, :cond_3

    .line 285
    new-instance v3, Lcom/vkontakte/android/api/APIException;

    check-cast v2, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .end local v2    # "result":Ljava/lang/Object;
    invoke-direct {v3, v2}, Lcom/vkontakte/android/api/APIException;-><init>(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V

    throw v3

    .line 286
    .restart local v2    # "result":Ljava/lang/Object;
    :cond_3
    invoke-interface {p1}, Lio/reactivex/ObservableEmitter;->isDisposed()Z

    move-result v3

    if-nez v3, :cond_0

    .line 287
    invoke-interface {p1, v2}, Lio/reactivex/ObservableEmitter;->onNext(Ljava/lang/Object;)V

    .line 288
    invoke-interface {p1}, Lio/reactivex/ObservableEmitter;->onComplete()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0
.end method
