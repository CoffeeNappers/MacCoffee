.class Lcom/vkontakte/android/api/APIController$RequestRunner$1;
.super Ljava/lang/Object;
.source "APIController.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/api/APIController$RequestRunner;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/api/APIController$RequestRunner;

.field final synthetic val$networkFail:Z

.field final synthetic val$result:Ljava/lang/Object;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/api/APIController$RequestRunner;Ljava/lang/Object;Z)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/api/APIController$RequestRunner;

    .prologue
    .line 489
    iput-object p1, p0, Lcom/vkontakte/android/api/APIController$RequestRunner$1;->this$0:Lcom/vkontakte/android/api/APIController$RequestRunner;

    iput-object p2, p0, Lcom/vkontakte/android/api/APIController$RequestRunner$1;->val$result:Ljava/lang/Object;

    iput-boolean p3, p0, Lcom/vkontakte/android/api/APIController$RequestRunner$1;->val$networkFail:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    const/16 v2, 0xe

    .line 491
    iget-object v1, p0, Lcom/vkontakte/android/api/APIController$RequestRunner$1;->val$result:Ljava/lang/Object;

    if-eqz v1, :cond_2

    .line 493
    :try_start_0
    iget-object v1, p0, Lcom/vkontakte/android/api/APIController$RequestRunner$1;->val$result:Ljava/lang/Object;

    instance-of v1, v1, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/vkontakte/android/api/APIController$RequestRunner$1;->val$result:Ljava/lang/Object;

    check-cast v1, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    invoke-virtual {v1}, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->getCodeValue()I

    move-result v1

    if-ne v1, v2, :cond_1

    .line 494
    iget-object v1, p0, Lcom/vkontakte/android/api/APIController$RequestRunner$1;->this$0:Lcom/vkontakte/android/api/APIController$RequestRunner;

    iget-object v1, v1, Lcom/vkontakte/android/api/APIController$RequestRunner;->r:Lcom/vkontakte/android/api/VKAPIRequest;

    new-instance v2, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    const/16 v3, 0xe

    const-string/jumbo v4, "Flood control"

    invoke-direct {v2, v3, v4}, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;-><init>(ILjava/lang/String;)V

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/api/VKAPIRequest;->invokeCallback(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 515
    :goto_0
    iget-object v1, p0, Lcom/vkontakte/android/api/APIController$RequestRunner$1;->this$0:Lcom/vkontakte/android/api/APIController$RequestRunner;

    iget-object v1, v1, Lcom/vkontakte/android/api/APIController$RequestRunner;->r:Lcom/vkontakte/android/api/VKAPIRequest;

    iget-object v1, v1, Lcom/vkontakte/android/api/VKAPIRequest;->progressDialog:Landroid/app/ProgressDialog;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/vkontakte/android/api/APIController$RequestRunner$1;->this$0:Lcom/vkontakte/android/api/APIController$RequestRunner;

    iget-object v1, v1, Lcom/vkontakte/android/api/APIController$RequestRunner;->r:Lcom/vkontakte/android/api/VKAPIRequest;

    iget-object v1, v1, Lcom/vkontakte/android/api/VKAPIRequest;->progressDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v1}, Landroid/app/ProgressDialog;->isShowing()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 516
    iget-object v1, p0, Lcom/vkontakte/android/api/APIController$RequestRunner$1;->this$0:Lcom/vkontakte/android/api/APIController$RequestRunner;

    iget-object v1, v1, Lcom/vkontakte/android/api/APIController$RequestRunner;->r:Lcom/vkontakte/android/api/VKAPIRequest;

    iget-object v1, v1, Lcom/vkontakte/android/api/VKAPIRequest;->progressDialog:Landroid/app/ProgressDialog;

    invoke-static {v1}, Lcom/vkontakte/android/ViewUtils;->dismissDialogSafety(Landroid/app/Dialog;)V

    .line 518
    :cond_0
    return-void

    .line 496
    :cond_1
    :try_start_1
    iget-object v1, p0, Lcom/vkontakte/android/api/APIController$RequestRunner$1;->this$0:Lcom/vkontakte/android/api/APIController$RequestRunner;

    iget-object v1, v1, Lcom/vkontakte/android/api/APIController$RequestRunner;->r:Lcom/vkontakte/android/api/VKAPIRequest;

    iget-object v2, p0, Lcom/vkontakte/android/api/APIController$RequestRunner$1;->val$result:Ljava/lang/Object;

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/api/VKAPIRequest;->invokeCallback(Ljava/lang/Object;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 498
    :catch_0
    move-exception v0

    .line 500
    .local v0, "x":Ljava/lang/Exception;
    const-string/jumbo v1, "vk"

    const-string/jumbo v2, "Callback exception"

    invoke-static {v1, v2, v0}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 501
    iget-object v1, p0, Lcom/vkontakte/android/api/APIController$RequestRunner$1;->this$0:Lcom/vkontakte/android/api/APIController$RequestRunner;

    iget-object v1, v1, Lcom/vkontakte/android/api/APIController$RequestRunner;->r:Lcom/vkontakte/android/api/VKAPIRequest;

    new-instance v2, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    const/4 v3, -0x3

    const-string/jumbo v4, "Callback invocation failed (parse error?)"

    invoke-direct {v2, v3, v4}, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;-><init>(ILjava/lang/String;)V

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/api/VKAPIRequest;->invokeCallback(Ljava/lang/Object;)V

    goto :goto_0

    .line 503
    .end local v0    # "x":Ljava/lang/Exception;
    :cond_2
    iget-boolean v1, p0, Lcom/vkontakte/android/api/APIController$RequestRunner$1;->val$networkFail:Z

    if-eqz v1, :cond_4

    .line 504
    sget-boolean v1, Lcom/vkontakte/android/api/APIController;->API_DEBUG:Z

    if-eqz v1, :cond_3

    .line 505
    const-string/jumbo v2, "vk"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Request "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v1, p0, Lcom/vkontakte/android/api/APIController$RequestRunner$1;->this$0:Lcom/vkontakte/android/api/APIController$RequestRunner;

    iget-object v1, v1, Lcom/vkontakte/android/api/APIController$RequestRunner;->r:Lcom/vkontakte/android/api/VKAPIRequest;

    iget-object v1, v1, Lcom/vkontakte/android/api/VKAPIRequest;->params:Ljava/util/LinkedHashMap;

    const-string/jumbo v4, "method"

    invoke-virtual {v1, v4}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v3, " failed with network error"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 507
    :cond_3
    iget-object v1, p0, Lcom/vkontakte/android/api/APIController$RequestRunner$1;->this$0:Lcom/vkontakte/android/api/APIController$RequestRunner;

    iget-object v1, v1, Lcom/vkontakte/android/api/APIController$RequestRunner;->r:Lcom/vkontakte/android/api/VKAPIRequest;

    new-instance v2, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    const/4 v3, -0x1

    const-string/jumbo v4, "I/O Error"

    invoke-direct {v2, v3, v4}, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;-><init>(ILjava/lang/String;)V

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/api/VKAPIRequest;->invokeCallback(Ljava/lang/Object;)V

    goto/16 :goto_0

    .line 510
    :cond_4
    sget-boolean v1, Lcom/vkontakte/android/api/APIController;->API_DEBUG:Z

    if-eqz v1, :cond_5

    .line 511
    const-string/jumbo v2, "vk"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Request "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v1, p0, Lcom/vkontakte/android/api/APIController$RequestRunner$1;->this$0:Lcom/vkontakte/android/api/APIController$RequestRunner;

    iget-object v1, v1, Lcom/vkontakte/android/api/APIController$RequestRunner;->r:Lcom/vkontakte/android/api/VKAPIRequest;

    iget-object v1, v1, Lcom/vkontakte/android/api/VKAPIRequest;->params:Ljava/util/LinkedHashMap;

    const-string/jumbo v4, "method"

    invoke-virtual {v1, v4}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v3, " failed with other error (malformed response?)"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 513
    :cond_5
    iget-object v1, p0, Lcom/vkontakte/android/api/APIController$RequestRunner$1;->this$0:Lcom/vkontakte/android/api/APIController$RequestRunner;

    iget-object v1, v1, Lcom/vkontakte/android/api/APIController$RequestRunner;->r:Lcom/vkontakte/android/api/VKAPIRequest;

    new-instance v2, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    const/4 v3, -0x2

    const-string/jumbo v4, "Response parse failed"

    invoke-direct {v2, v3, v4}, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;-><init>(ILjava/lang/String;)V

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/api/VKAPIRequest;->invokeCallback(Ljava/lang/Object;)V

    goto/16 :goto_0
.end method
