.class Lcom/vkontakte/android/activities/RestoreActivity$4;
.super Ljava/lang/Object;
.source "RestoreActivity.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/activities/RestoreActivity;->completeRestore(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vkontakte/android/api/Callback",
        "<",
        "Lcom/vkontakte/android/api/account/AccountChangePassword$Result;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/activities/RestoreActivity;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/activities/RestoreActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/activities/RestoreActivity;

    .prologue
    .line 391
    iput-object p1, p0, Lcom/vkontakte/android/activities/RestoreActivity$4;->this$0:Lcom/vkontakte/android/activities/RestoreActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 3
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 404
    invoke-virtual {p1}, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->getCodeValue()I

    move-result v0

    .line 405
    .local v0, "errorCode":I
    const/16 v1, 0xe

    if-ne v0, v1, :cond_0

    .line 431
    :goto_0
    return-void

    .line 408
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/activities/RestoreActivity$4;->this$0:Lcom/vkontakte/android/activities/RestoreActivity;

    invoke-static {p0, v0, p1}, Lcom/vkontakte/android/activities/RestoreActivity$4$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/activities/RestoreActivity$4;ILcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)Ljava/lang/Runnable;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/activities/RestoreActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method synthetic lambda$fail$0(ILcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 3
    .param p1, "errorCode"    # I
    .param p2, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 409
    const/16 v0, 0x456

    if-ne p1, v0, :cond_1

    .line 410
    iget-object v0, p0, Lcom/vkontakte/android/activities/RestoreActivity$4;->this$0:Lcom/vkontakte/android/activities/RestoreActivity;

    iget-object v1, p0, Lcom/vkontakte/android/activities/RestoreActivity$4;->this$0:Lcom/vkontakte/android/activities/RestoreActivity;

    const v2, 0x7f08069a

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/activities/RestoreActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vkontakte/android/activities/RestoreActivity;->access$500(Lcom/vkontakte/android/activities/RestoreActivity;Ljava/lang/String;)V

    .line 430
    :cond_0
    :goto_0
    return-void

    .line 411
    :cond_1
    const/16 v0, 0x457

    if-eq p1, v0, :cond_0

    .line 413
    const/4 v0, -0x1

    if-ne p1, v0, :cond_2

    .line 414
    iget-object v0, p0, Lcom/vkontakte/android/activities/RestoreActivity$4;->this$0:Lcom/vkontakte/android/activities/RestoreActivity;

    iget-object v1, p0, Lcom/vkontakte/android/activities/RestoreActivity$4;->this$0:Lcom/vkontakte/android/activities/RestoreActivity;

    const v2, 0x7f0801f6

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/activities/RestoreActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vkontakte/android/activities/RestoreActivity;->access$500(Lcom/vkontakte/android/activities/RestoreActivity;Ljava/lang/String;)V

    goto :goto_0

    .line 415
    :cond_2
    const/16 v0, 0xf

    if-ne p1, v0, :cond_4

    .line 416
    iget-object v0, p2, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->message:Ljava/lang/String;

    const-string/jumbo v1, "change_password_hash"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 417
    iget-object v0, p0, Lcom/vkontakte/android/activities/RestoreActivity$4;->this$0:Lcom/vkontakte/android/activities/RestoreActivity;

    iget-object v1, p0, Lcom/vkontakte/android/activities/RestoreActivity$4;->this$0:Lcom/vkontakte/android/activities/RestoreActivity;

    const v2, 0x7f0801fa

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/activities/RestoreActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vkontakte/android/activities/RestoreActivity;->access$500(Lcom/vkontakte/android/activities/RestoreActivity;Ljava/lang/String;)V

    goto :goto_0

    .line 419
    :cond_3
    iget-object v0, p0, Lcom/vkontakte/android/activities/RestoreActivity$4;->this$0:Lcom/vkontakte/android/activities/RestoreActivity;

    invoke-static {v0, p2}, Lcom/vkontakte/android/activities/RestoreActivity;->access$800(Lcom/vkontakte/android/activities/RestoreActivity;Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V

    goto :goto_0

    .line 421
    :cond_4
    const/16 v0, 0x64

    if-ne p1, v0, :cond_6

    .line 422
    iget-object v0, p2, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->message:Ljava/lang/String;

    const-string/jumbo v1, "compromised"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 423
    iget-object v0, p0, Lcom/vkontakte/android/activities/RestoreActivity$4;->this$0:Lcom/vkontakte/android/activities/RestoreActivity;

    iget-object v1, p0, Lcom/vkontakte/android/activities/RestoreActivity$4;->this$0:Lcom/vkontakte/android/activities/RestoreActivity;

    const v2, 0x7f080200

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/activities/RestoreActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vkontakte/android/activities/RestoreActivity;->access$500(Lcom/vkontakte/android/activities/RestoreActivity;Ljava/lang/String;)V

    goto :goto_0

    .line 425
    :cond_5
    iget-object v0, p0, Lcom/vkontakte/android/activities/RestoreActivity$4;->this$0:Lcom/vkontakte/android/activities/RestoreActivity;

    invoke-static {v0, p2}, Lcom/vkontakte/android/activities/RestoreActivity;->access$800(Lcom/vkontakte/android/activities/RestoreActivity;Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V

    goto :goto_0

    .line 428
    :cond_6
    iget-object v0, p0, Lcom/vkontakte/android/activities/RestoreActivity$4;->this$0:Lcom/vkontakte/android/activities/RestoreActivity;

    invoke-static {v0, p2}, Lcom/vkontakte/android/activities/RestoreActivity;->access$800(Lcom/vkontakte/android/activities/RestoreActivity;Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V

    goto :goto_0
.end method

.method public success(Lcom/vkontakte/android/api/account/AccountChangePassword$Result;)V
    .locals 3
    .param p1, "result"    # Lcom/vkontakte/android/api/account/AccountChangePassword$Result;

    .prologue
    .line 394
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 395
    .local v0, "intent":Landroid/content/Intent;
    const-string/jumbo v1, "access_token"

    iget-object v2, p1, Lcom/vkontakte/android/api/account/AccountChangePassword$Result;->token:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 396
    const-string/jumbo v1, "secret"

    iget-object v2, p1, Lcom/vkontakte/android/api/account/AccountChangePassword$Result;->secret:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 397
    const-string/jumbo v1, "user_id"

    iget-object v2, p0, Lcom/vkontakte/android/activities/RestoreActivity$4;->this$0:Lcom/vkontakte/android/activities/RestoreActivity;

    invoke-static {v2}, Lcom/vkontakte/android/activities/RestoreActivity;->access$100(Lcom/vkontakte/android/activities/RestoreActivity;)I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 398
    iget-object v1, p0, Lcom/vkontakte/android/activities/RestoreActivity$4;->this$0:Lcom/vkontakte/android/activities/RestoreActivity;

    const/4 v2, -0x1

    invoke-virtual {v1, v2, v0}, Lcom/vkontakte/android/activities/RestoreActivity;->setResult(ILandroid/content/Intent;)V

    .line 399
    iget-object v1, p0, Lcom/vkontakte/android/activities/RestoreActivity$4;->this$0:Lcom/vkontakte/android/activities/RestoreActivity;

    invoke-virtual {v1}, Lcom/vkontakte/android/activities/RestoreActivity;->finish()V

    .line 400
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 391
    check-cast p1, Lcom/vkontakte/android/api/account/AccountChangePassword$Result;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/activities/RestoreActivity$4;->success(Lcom/vkontakte/android/api/account/AccountChangePassword$Result;)V

    return-void
.end method
