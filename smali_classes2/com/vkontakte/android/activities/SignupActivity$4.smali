.class Lcom/vkontakte/android/activities/SignupActivity$4;
.super Ljava/lang/Object;
.source "SignupActivity.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/activities/SignupActivity;->complete(Lcom/vkontakte/android/api/auth/AuthConfirm;)V
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
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/activities/SignupActivity;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/activities/SignupActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/activities/SignupActivity;

    .prologue
    .line 395
    iput-object p1, p0, Lcom/vkontakte/android/activities/SignupActivity$4;->this$0:Lcom/vkontakte/android/activities/SignupActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 4
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 412
    invoke-virtual {p1}, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->getCodeValue()I

    move-result v0

    .line 413
    .local v0, "errorCode":I
    const/16 v1, 0xe

    if-ne v0, v1, :cond_1

    .line 425
    :cond_0
    :goto_0
    return-void

    .line 416
    :cond_1
    const/16 v1, 0x456

    if-ne v0, v1, :cond_2

    .line 417
    iget-object v1, p0, Lcom/vkontakte/android/activities/SignupActivity$4;->this$0:Lcom/vkontakte/android/activities/SignupActivity;

    iget-object v2, p0, Lcom/vkontakte/android/activities/SignupActivity$4;->this$0:Lcom/vkontakte/android/activities/SignupActivity;

    const v3, 0x7f08069a

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/activities/SignupActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/vkontakte/android/activities/SignupActivity;->access$200(Lcom/vkontakte/android/activities/SignupActivity;Ljava/lang/String;)V

    goto :goto_0

    .line 418
    :cond_2
    const/16 v1, 0x457

    if-eq v0, v1, :cond_0

    .line 420
    const/4 v1, -0x1

    if-ne v0, v1, :cond_3

    .line 421
    iget-object v1, p0, Lcom/vkontakte/android/activities/SignupActivity$4;->this$0:Lcom/vkontakte/android/activities/SignupActivity;

    iget-object v2, p0, Lcom/vkontakte/android/activities/SignupActivity$4;->this$0:Lcom/vkontakte/android/activities/SignupActivity;

    const v3, 0x7f0801f6

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/activities/SignupActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/vkontakte/android/activities/SignupActivity;->access$200(Lcom/vkontakte/android/activities/SignupActivity;Ljava/lang/String;)V

    goto :goto_0

    .line 423
    :cond_3
    iget-object v1, p0, Lcom/vkontakte/android/activities/SignupActivity$4;->this$0:Lcom/vkontakte/android/activities/SignupActivity;

    invoke-static {v1, p1}, Lcom/vkontakte/android/activities/SignupActivity;->access$400(Lcom/vkontakte/android/activities/SignupActivity;Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V

    goto :goto_0
.end method

.method public success(Ljava/lang/Integer;)V
    .locals 11
    .param p1, "uid"    # Ljava/lang/Integer;

    .prologue
    .line 398
    invoke-static {}, Lcom/my/tracker/MyTracker;->trackRegistrationEvent()V

    .line 400
    new-instance v9, Landroid/content/Intent;

    invoke-direct {v9}, Landroid/content/Intent;-><init>()V

    .line 401
    .local v9, "intent":Landroid/content/Intent;
    const-string/jumbo v0, "auth_state"

    iget-object v1, p0, Lcom/vkontakte/android/activities/SignupActivity$4;->this$0:Lcom/vkontakte/android/activities/SignupActivity;

    invoke-static {v1}, Lcom/vkontakte/android/activities/SignupActivity;->access$500(Lcom/vkontakte/android/activities/SignupActivity;)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/activities/SignupActivity$4;->this$0:Lcom/vkontakte/android/activities/SignupActivity;

    invoke-static {v2}, Lcom/vkontakte/android/activities/SignupActivity;->access$700(Lcom/vkontakte/android/activities/SignupActivity;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/vkontakte/android/auth/VKAuthState;->byLoginPassword(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/auth/VKAuthState;

    move-result-object v1

    invoke-virtual {v9, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 402
    iget-object v0, p0, Lcom/vkontakte/android/activities/SignupActivity$4;->this$0:Lcom/vkontakte/android/activities/SignupActivity;

    const/4 v1, -0x1

    invoke-virtual {v0, v1, v9}, Lcom/vkontakte/android/activities/SignupActivity;->setResult(ILandroid/content/Intent;)V

    .line 403
    iget-object v0, p0, Lcom/vkontakte/android/activities/SignupActivity$4;->this$0:Lcom/vkontakte/android/activities/SignupActivity;

    invoke-virtual {v0}, Lcom/vkontakte/android/activities/SignupActivity;->finish()V

    .line 404
    iget-object v0, p0, Lcom/vkontakte/android/activities/SignupActivity$4;->this$0:Lcom/vkontakte/android/activities/SignupActivity;

    invoke-static {v0}, Lcom/vkontakte/android/activities/SignupActivity;->access$800(Lcom/vkontakte/android/activities/SignupActivity;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 405
    iget-object v10, p0, Lcom/vkontakte/android/activities/SignupActivity$4;->this$0:Lcom/vkontakte/android/activities/SignupActivity;

    new-instance v0, Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;

    iget-object v1, p0, Lcom/vkontakte/android/activities/SignupActivity$4;->this$0:Lcom/vkontakte/android/activities/SignupActivity;

    iget-object v2, p0, Lcom/vkontakte/android/activities/SignupActivity$4;->this$0:Lcom/vkontakte/android/activities/SignupActivity;

    .line 406
    invoke-static {v2}, Lcom/vkontakte/android/activities/SignupActivity;->access$800(Lcom/vkontakte/android/activities/SignupActivity;)Ljava/lang/String;

    move-result-object v2

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v3

    invoke-virtual {v3}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v3

    const/4 v4, 0x1

    iget-object v5, p0, Lcom/vkontakte/android/activities/SignupActivity$4;->this$0:Lcom/vkontakte/android/activities/SignupActivity;

    invoke-static {v5}, Lcom/vkontakte/android/activities/SignupActivity;->access$900(Lcom/vkontakte/android/activities/SignupActivity;)F

    move-result v5

    iget-object v6, p0, Lcom/vkontakte/android/activities/SignupActivity$4;->this$0:Lcom/vkontakte/android/activities/SignupActivity;

    invoke-static {v6}, Lcom/vkontakte/android/activities/SignupActivity;->access$1000(Lcom/vkontakte/android/activities/SignupActivity;)F

    move-result v6

    iget-object v7, p0, Lcom/vkontakte/android/activities/SignupActivity$4;->this$0:Lcom/vkontakte/android/activities/SignupActivity;

    invoke-static {v7}, Lcom/vkontakte/android/activities/SignupActivity;->access$1100(Lcom/vkontakte/android/activities/SignupActivity;)F

    move-result v7

    iget-object v8, p0, Lcom/vkontakte/android/activities/SignupActivity$4;->this$0:Lcom/vkontakte/android/activities/SignupActivity;

    invoke-static {v8}, Lcom/vkontakte/android/activities/SignupActivity;->access$1200(Lcom/vkontakte/android/activities/SignupActivity;)F

    move-result v8

    invoke-direct/range {v0 .. v8}, Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;-><init>(Landroid/content/Context;Ljava/lang/String;IZFFFF)V

    .line 405
    invoke-static {v10, v0}, Lcom/vkontakte/android/upload/Upload;->start(Landroid/content/Context;Lcom/vkontakte/android/upload/UploadTask;)V

    .line 408
    :cond_0
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 395
    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/activities/SignupActivity$4;->success(Ljava/lang/Integer;)V

    return-void
.end method
