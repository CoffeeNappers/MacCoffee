.class Lcom/vkontakte/android/NetworkProxyPreferences$2;
.super Ljava/lang/Object;
.source "NetworkProxyPreferences.java"

# interfaces
.implements Lio/reactivex/functions/Consumer;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/NetworkProxyPreferences;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lio/reactivex/functions/Consumer",
        "<",
        "Ljava/lang/Throwable;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/NetworkProxyPreferences;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/NetworkProxyPreferences;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/NetworkProxyPreferences;

    .prologue
    .line 90
    iput-object p1, p0, Lcom/vkontakte/android/NetworkProxyPreferences$2;->this$0:Lcom/vkontakte/android/NetworkProxyPreferences;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic accept(Ljava/lang/Object;)V
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 90
    check-cast p1, Ljava/lang/Throwable;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/NetworkProxyPreferences$2;->accept(Ljava/lang/Throwable;)V

    return-void
.end method

.method public accept(Ljava/lang/Throwable;)V
    .locals 7
    .param p1, "throwable"    # Ljava/lang/Throwable;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    const/4 v6, 0x2

    .line 93
    iget-object v2, p0, Lcom/vkontakte/android/NetworkProxyPreferences$2;->this$0:Lcom/vkontakte/android/NetworkProxyPreferences;

    invoke-static {v2, v1}, Lcom/vkontakte/android/NetworkProxyPreferences;->access$002(Lcom/vkontakte/android/NetworkProxyPreferences;Lio/reactivex/disposables/Disposable;)Lio/reactivex/disposables/Disposable;

    .line 94
    instance-of v2, p1, Lcom/vkontakte/android/api/APIException;

    if-eqz v2, :cond_1

    move-object v0, p1

    .line 95
    check-cast v0, Lcom/vkontakte/android/api/APIException;

    .line 96
    .local v0, "e":Lcom/vkontakte/android/api/APIException;
    new-array v2, v6, [Ljava/lang/Object;

    const/4 v3, 0x0

    const-class v4, Lcom/vkontakte/android/NetworkProxyPreferences;

    invoke-virtual {v4}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x1

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "error="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    if-eqz v0, :cond_0

    iget-object v5, v0, Lcom/vkontakte/android/api/APIException;->errorResponse:Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    if-eqz v5, :cond_0

    iget-object v1, v0, Lcom/vkontakte/android/api/APIException;->errorResponse:Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .line 97
    invoke-virtual {v1}, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->toString()Ljava/lang/String;

    move-result-object v1

    :cond_0
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    aput-object v1, v2, v3

    .line 96
    invoke-static {v2}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    .line 98
    iget-object v1, p0, Lcom/vkontakte/android/NetworkProxyPreferences$2;->this$0:Lcom/vkontakte/android/NetworkProxyPreferences;

    invoke-static {v1}, Lcom/vkontakte/android/NetworkProxyPreferences;->access$104(Lcom/vkontakte/android/NetworkProxyPreferences;)I

    move-result v1

    if-ge v1, v6, :cond_1

    .line 99
    iget-object v1, p0, Lcom/vkontakte/android/NetworkProxyPreferences$2;->this$0:Lcom/vkontakte/android/NetworkProxyPreferences;

    invoke-static {v1}, Lcom/vkontakte/android/NetworkProxyPreferences;->access$200(Lcom/vkontakte/android/NetworkProxyPreferences;)V

    .line 104
    .end local v0    # "e":Lcom/vkontakte/android/api/APIException;
    :goto_0
    return-void

    .line 103
    :cond_1
    iget-object v1, p0, Lcom/vkontakte/android/NetworkProxyPreferences$2;->this$0:Lcom/vkontakte/android/NetworkProxyPreferences;

    invoke-virtual {v1}, Lcom/vkontakte/android/NetworkProxyPreferences;->onProxyDisabled()V

    goto :goto_0
.end method
