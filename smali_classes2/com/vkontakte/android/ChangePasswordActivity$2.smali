.class Lcom/vkontakte/android/ChangePasswordActivity$2;
.super Lcom/vkontakte/android/api/SimpleCallback;
.source "ChangePasswordActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/ChangePasswordActivity;->changePassword(Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/SimpleCallback",
        "<",
        "Lcom/vkontakte/android/api/account/AccountChangePassword$Result;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/ChangePasswordActivity;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/ChangePasswordActivity;Landroid/content/Context;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/ChangePasswordActivity;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 98
    iput-object p1, p0, Lcom/vkontakte/android/ChangePasswordActivity$2;->this$0:Lcom/vkontakte/android/ChangePasswordActivity;

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/SimpleCallback;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 2
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 110
    invoke-virtual {p1}, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->getCodeValue()I

    move-result v0

    const/16 v1, 0xf

    if-ne v0, v1, :cond_0

    .line 111
    iget-object v0, p0, Lcom/vkontakte/android/ChangePasswordActivity$2;->this$0:Lcom/vkontakte/android/ChangePasswordActivity;

    invoke-static {p0}, Lcom/vkontakte/android/ChangePasswordActivity$2$$Lambda$2;->lambdaFactory$(Lcom/vkontakte/android/ChangePasswordActivity$2;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ChangePasswordActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 115
    :goto_0
    return-void

    .line 113
    :cond_0
    invoke-super {p0, p1}, Lcom/vkontakte/android/api/SimpleCallback;->fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V

    goto :goto_0
.end method

.method synthetic lambda$fail$1()V
    .locals 3

    .prologue
    .line 111
    iget-object v0, p0, Lcom/vkontakte/android/ChangePasswordActivity$2;->this$0:Lcom/vkontakte/android/ChangePasswordActivity;

    const v1, 0x7f08047b

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    return-void
.end method

.method synthetic lambda$success$0()V
    .locals 3

    .prologue
    .line 103
    iget-object v0, p0, Lcom/vkontakte/android/ChangePasswordActivity$2;->this$0:Lcom/vkontakte/android/ChangePasswordActivity;

    const v1, 0x7f080495

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 104
    iget-object v0, p0, Lcom/vkontakte/android/ChangePasswordActivity$2;->this$0:Lcom/vkontakte/android/ChangePasswordActivity;

    invoke-virtual {v0}, Lcom/vkontakte/android/ChangePasswordActivity;->finish()V

    .line 105
    return-void
.end method

.method public success(Lcom/vkontakte/android/api/account/AccountChangePassword$Result;)V
    .locals 2
    .param p1, "result"    # Lcom/vkontakte/android/api/account/AccountChangePassword$Result;

    .prologue
    .line 101
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->editCurrent()Lcom/vkontakte/android/auth/VKAccountEditor;

    move-result-object v0

    iget-object v1, p1, Lcom/vkontakte/android/api/account/AccountChangePassword$Result;->token:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/auth/VKAccountEditor;->setAccessToken(Ljava/lang/String;)Lcom/vkontakte/android/auth/VKAccountEditor;

    move-result-object v0

    iget-object v1, p1, Lcom/vkontakte/android/api/account/AccountChangePassword$Result;->secret:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/auth/VKAccountEditor;->setSecret(Ljava/lang/String;)Lcom/vkontakte/android/auth/VKAccountEditor;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/auth/VKAccountEditor;->commit()V

    .line 102
    iget-object v0, p0, Lcom/vkontakte/android/ChangePasswordActivity$2;->this$0:Lcom/vkontakte/android/ChangePasswordActivity;

    invoke-static {p0}, Lcom/vkontakte/android/ChangePasswordActivity$2$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/ChangePasswordActivity$2;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ChangePasswordActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 106
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 98
    check-cast p1, Lcom/vkontakte/android/api/account/AccountChangePassword$Result;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/ChangePasswordActivity$2;->success(Lcom/vkontakte/android/api/account/AccountChangePassword$Result;)V

    return-void
.end method
