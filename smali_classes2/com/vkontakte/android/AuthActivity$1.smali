.class Lcom/vkontakte/android/AuthActivity$1;
.super Lcom/vkontakte/android/auth/VKAuthHelper;
.source "AuthActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/AuthActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/AuthActivity;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/AuthActivity;Landroid/app/Activity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/AuthActivity;
    .param p2, "activity"    # Landroid/app/Activity;

    .prologue
    .line 48
    iput-object p1, p0, Lcom/vkontakte/android/AuthActivity$1;->this$0:Lcom/vkontakte/android/AuthActivity;

    invoke-direct {p0, p2}, Lcom/vkontakte/android/auth/VKAuthHelper;-><init>(Landroid/app/Activity;)V

    return-void
.end method


# virtual methods
.method public onAuthFinish(ILcom/vkontakte/android/auth/VKAuth$AuthAnswer;)V
    .locals 6
    .param p1, "result"    # I
    .param p2, "answer"    # Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    const/4 v5, 0x0

    .line 56
    iget-object v3, p0, Lcom/vkontakte/android/AuthActivity$1;->this$0:Lcom/vkontakte/android/AuthActivity;

    invoke-static {v3}, Lcom/vkontakte/android/AuthActivity;->access$100(Lcom/vkontakte/android/AuthActivity;)V

    .line 57
    const/4 v3, 0x1

    if-ne p1, v3, :cond_2

    .line 59
    :try_start_0
    iget-object v3, p0, Lcom/vkontakte/android/AuthActivity$1;->this$0:Lcom/vkontakte/android/AuthActivity;

    const-string/jumbo v4, "input_method"

    invoke-virtual {v3, v4}, Lcom/vkontakte/android/AuthActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 60
    .local v0, "imm":Landroid/view/inputmethod/InputMethodManager;
    iget-object v3, p0, Lcom/vkontakte/android/AuthActivity$1;->this$0:Lcom/vkontakte/android/AuthActivity;

    invoke-virtual {v3}, Lcom/vkontakte/android/AuthActivity;->getCurrentFocus()Landroid/view/View;

    move-result-object v2

    .line 61
    .local v2, "view":Landroid/view/View;
    if-eqz v2, :cond_0

    .line 62
    invoke-virtual {v2}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v0, v3, v4}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 68
    .end local v0    # "imm":Landroid/view/inputmethod/InputMethodManager;
    .end local v2    # "view":Landroid/view/View;
    :cond_0
    :goto_0
    iget-object v3, p0, Lcom/vkontakte/android/AuthActivity$1;->this$0:Lcom/vkontakte/android/AuthActivity;

    const/4 v4, -0x1

    invoke-virtual {v3, v4}, Lcom/vkontakte/android/AuthActivity;->setResult(I)V

    .line 69
    iget-object v3, p0, Lcom/vkontakte/android/AuthActivity$1;->this$0:Lcom/vkontakte/android/AuthActivity;

    invoke-virtual {v3}, Lcom/vkontakte/android/AuthActivity;->getIntent()Landroid/content/Intent;

    move-result-object v3

    const-string/jumbo v4, "accountAuthenticatorResponse"

    invoke-virtual {v3, v4}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 71
    :try_start_1
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 72
    .local v1, "res":Landroid/os/Bundle;
    const-string/jumbo v3, "authAccount"

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v4

    invoke-virtual {v4}, Lcom/vkontakte/android/auth/VKAccount;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 73
    const-string/jumbo v3, "accountType"

    const-string/jumbo v4, "com.vkontakte.account"

    invoke-virtual {v1, v3, v4}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 74
    iget-object v3, p0, Lcom/vkontakte/android/AuthActivity$1;->this$0:Lcom/vkontakte/android/AuthActivity;

    invoke-virtual {v3, v1}, Lcom/vkontakte/android/AuthActivity;->setAccountAuthenticatorResult(Landroid/os/Bundle;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 79
    .end local v1    # "res":Landroid/os/Bundle;
    :cond_1
    :goto_1
    iget-object v3, p0, Lcom/vkontakte/android/AuthActivity$1;->this$0:Lcom/vkontakte/android/AuthActivity;

    invoke-virtual {v3}, Lcom/vkontakte/android/AuthActivity;->finish()V

    .line 87
    :goto_2
    return-void

    .line 81
    :cond_2
    if-eqz p2, :cond_3

    iget-object v3, p2, Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;->concatError:Ljava/lang/String;

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_3

    iget-object v3, p2, Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;->concatError:Ljava/lang/String;

    const-string/jumbo v4, "code"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 82
    iget-object v3, p0, Lcom/vkontakte/android/AuthActivity$1;->this$0:Lcom/vkontakte/android/AuthActivity;

    invoke-static {v3}, Lcom/vkontakte/android/AuthActivity;->access$200(Lcom/vkontakte/android/AuthActivity;)V

    goto :goto_2

    .line 84
    :cond_3
    iget-object v3, p0, Lcom/vkontakte/android/AuthActivity$1;->this$0:Lcom/vkontakte/android/AuthActivity;

    invoke-virtual {p0, v3, v5, p1, p2}, Lcom/vkontakte/android/AuthActivity$1;->showErrorMessage(Landroid/app/Activity;ZILcom/vkontakte/android/auth/VKAuth$AuthAnswer;)V

    goto :goto_2

    .line 75
    :catch_0
    move-exception v3

    goto :goto_1

    .line 64
    :catch_1
    move-exception v3

    goto :goto_0
.end method

.method public onAuthNeedValidation(Lcom/vkontakte/android/auth/VKAuthState;Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;)V
    .locals 1
    .param p1, "helper"    # Lcom/vkontakte/android/auth/VKAuthState;
    .param p2, "answer"    # Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;

    .prologue
    .line 91
    invoke-super {p0, p1, p2}, Lcom/vkontakte/android/auth/VKAuthHelper;->onAuthNeedValidation(Lcom/vkontakte/android/auth/VKAuthState;Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;)V

    .line 92
    iget-object v0, p0, Lcom/vkontakte/android/AuthActivity$1;->this$0:Lcom/vkontakte/android/AuthActivity;

    invoke-static {v0}, Lcom/vkontakte/android/AuthActivity;->access$100(Lcom/vkontakte/android/AuthActivity;)V

    .line 93
    return-void
.end method

.method public onAuthStart()V
    .locals 1

    .prologue
    .line 51
    iget-object v0, p0, Lcom/vkontakte/android/AuthActivity$1;->this$0:Lcom/vkontakte/android/AuthActivity;

    invoke-static {v0}, Lcom/vkontakte/android/AuthActivity;->access$000(Lcom/vkontakte/android/AuthActivity;)V

    .line 52
    return-void
.end method
