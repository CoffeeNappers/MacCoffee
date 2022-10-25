.class Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge$2$1;
.super Ljava/lang/Object;
.source "HtmlGameFragment.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge$2;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge$2;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge$2;)V
    .locals 0
    .param p1, "this$2"    # Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge$2;

    .prologue
    .line 291
    iput-object p1, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge$2$1;->this$2:Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge$2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 6
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 303
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 304
    .local v0, "errorJson":Lorg/json/JSONObject;
    const-string/jumbo v4, "error_code"

    invoke-virtual {p1}, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->getCode()I

    move-result v5

    invoke-virtual {v0, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 305
    const-string/jumbo v4, "error_msg"

    iget-object v5, p1, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->message:Ljava/lang/String;

    invoke-virtual {v0, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 306
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    .line 307
    .local v3, "responseJson":Lorg/json/JSONObject;
    const-string/jumbo v4, "error"

    invoke-virtual {v3, v4, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 309
    invoke-virtual {v3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v1

    .line 310
    .local v1, "errorStr":Ljava/lang/String;
    iget-object v4, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge$2$1;->this$2:Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge$2;

    iget-object v4, v4, Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge$2;->this$1:Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge;

    iget-object v4, v4, Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge;->this$0:Lcom/vkontakte/android/fragments/HtmlGameFragment;

    iget-object v5, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge$2$1;->this$2:Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge$2;

    iget-object v5, v5, Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge$2;->val$callbackId:Ljava/lang/String;

    invoke-static {v4, v5, v1}, Lcom/vkontakte/android/fragments/HtmlGameFragment;->access$1100(Lcom/vkontakte/android/fragments/HtmlGameFragment;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 316
    .end local v0    # "errorJson":Lorg/json/JSONObject;
    .end local v1    # "errorStr":Ljava/lang/String;
    .end local v3    # "responseJson":Lorg/json/JSONObject;
    :goto_0
    return-void

    .line 312
    :catch_0
    move-exception v2

    .line 313
    .local v2, "exc":Lorg/json/JSONException;
    const-string/jumbo v4, "HtmlGameFragment"

    invoke-virtual {v2}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5, v2}, Lcom/vkontakte/android/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public success(Ljava/lang/Object;)V
    .locals 3
    .param p1, "result"    # Ljava/lang/Object;

    .prologue
    .line 295
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 297
    .local v0, "resultStr":Ljava/lang/String;
    iget-object v1, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge$2$1;->this$2:Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge$2;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge$2;->this$1:Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge;->this$0:Lcom/vkontakte/android/fragments/HtmlGameFragment;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge$2$1;->this$2:Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge$2;

    iget-object v2, v2, Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge$2;->val$callbackId:Ljava/lang/String;

    invoke-static {v1, v2, v0}, Lcom/vkontakte/android/fragments/HtmlGameFragment;->access$1100(Lcom/vkontakte/android/fragments/HtmlGameFragment;Ljava/lang/String;Ljava/lang/String;)V

    .line 298
    return-void
.end method
