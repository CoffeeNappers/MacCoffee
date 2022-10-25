.class Lcom/vkontakte/android/activities/RestoreActivity$1;
.super Lcom/vkontakte/android/auth/VKAuthHelper;
.source "RestoreActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/activities/RestoreActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/activities/RestoreActivity;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/activities/RestoreActivity;Landroid/app/Activity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/activities/RestoreActivity;
    .param p2, "activity"    # Landroid/app/Activity;

    .prologue
    .line 71
    iput-object p1, p0, Lcom/vkontakte/android/activities/RestoreActivity$1;->this$0:Lcom/vkontakte/android/activities/RestoreActivity;

    invoke-direct {p0, p2}, Lcom/vkontakte/android/auth/VKAuthHelper;-><init>(Landroid/app/Activity;)V

    return-void
.end method


# virtual methods
.method public onAuthFinish(ILcom/vkontakte/android/auth/VKAuth$AuthAnswer;)V
    .locals 3
    .param p1, "result"    # I
    .param p2, "answer"    # Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    const/4 v2, 0x2

    .line 79
    iget-object v0, p0, Lcom/vkontakte/android/activities/RestoreActivity$1;->this$0:Lcom/vkontakte/android/activities/RestoreActivity;

    invoke-virtual {v0}, Lcom/vkontakte/android/activities/RestoreActivity;->hideProgress()V

    .line 80
    if-ne p1, v2, :cond_0

    if-eqz p2, :cond_0

    .line 81
    iget-object v0, p0, Lcom/vkontakte/android/activities/RestoreActivity$1;->this$0:Lcom/vkontakte/android/activities/RestoreActivity;

    iget-object v1, p2, Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;->changePasswordHash:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/vkontakte/android/activities/RestoreActivity;->access$002(Lcom/vkontakte/android/activities/RestoreActivity;Ljava/lang/String;)Ljava/lang/String;

    .line 82
    iget-object v0, p0, Lcom/vkontakte/android/activities/RestoreActivity$1;->this$0:Lcom/vkontakte/android/activities/RestoreActivity;

    iget v1, p2, Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;->userId:I

    invoke-static {v0, v1}, Lcom/vkontakte/android/activities/RestoreActivity;->access$102(Lcom/vkontakte/android/activities/RestoreActivity;I)I

    .line 83
    iget-object v0, p0, Lcom/vkontakte/android/activities/RestoreActivity$1;->this$0:Lcom/vkontakte/android/activities/RestoreActivity;

    iget-object v1, p2, Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;->accessToken:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/vkontakte/android/activities/RestoreActivity;->access$202(Lcom/vkontakte/android/activities/RestoreActivity;Ljava/lang/String;)Ljava/lang/String;

    .line 84
    iget-object v0, p0, Lcom/vkontakte/android/activities/RestoreActivity$1;->this$0:Lcom/vkontakte/android/activities/RestoreActivity;

    iget-object v1, p2, Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;->secret:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/vkontakte/android/activities/RestoreActivity;->access$302(Lcom/vkontakte/android/activities/RestoreActivity;Ljava/lang/String;)Ljava/lang/String;

    .line 85
    iget-object v0, p0, Lcom/vkontakte/android/activities/RestoreActivity$1;->this$0:Lcom/vkontakte/android/activities/RestoreActivity;

    invoke-static {v0, v2}, Lcom/vkontakte/android/activities/RestoreActivity;->access$400(Lcom/vkontakte/android/activities/RestoreActivity;I)V

    .line 95
    :goto_0
    return-void

    .line 87
    :cond_0
    if-nez p2, :cond_1

    .line 88
    iget-object v0, p0, Lcom/vkontakte/android/activities/RestoreActivity$1;->this$0:Lcom/vkontakte/android/activities/RestoreActivity;

    iget-object v1, p0, Lcom/vkontakte/android/activities/RestoreActivity$1;->this$0:Lcom/vkontakte/android/activities/RestoreActivity;

    const v2, 0x7f0806a2

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/activities/RestoreActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vkontakte/android/activities/RestoreActivity;->access$500(Lcom/vkontakte/android/activities/RestoreActivity;Ljava/lang/String;)V

    goto :goto_0

    .line 89
    :cond_1
    iget-object v0, p2, Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;->concatError:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p2, Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;->concatError:Ljava/lang/String;

    const-string/jumbo v1, "code"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 90
    iget-object v0, p0, Lcom/vkontakte/android/activities/RestoreActivity$1;->this$0:Lcom/vkontakte/android/activities/RestoreActivity;

    iget-object v1, p0, Lcom/vkontakte/android/activities/RestoreActivity$1;->this$0:Lcom/vkontakte/android/activities/RestoreActivity;

    const v2, 0x7f08069a

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/activities/RestoreActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vkontakte/android/activities/RestoreActivity;->access$500(Lcom/vkontakte/android/activities/RestoreActivity;Ljava/lang/String;)V

    goto :goto_0

    .line 92
    :cond_2
    iget-object v0, p0, Lcom/vkontakte/android/activities/RestoreActivity$1;->this$0:Lcom/vkontakte/android/activities/RestoreActivity;

    iget-object v1, p2, Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;->concatError:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/vkontakte/android/activities/RestoreActivity;->access$500(Lcom/vkontakte/android/activities/RestoreActivity;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public onAuthNeedValidation(Lcom/vkontakte/android/auth/VKAuthState;Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;)V
    .locals 1
    .param p1, "helper"    # Lcom/vkontakte/android/auth/VKAuthState;
    .param p2, "answer"    # Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;

    .prologue
    .line 99
    invoke-super {p0, p1, p2}, Lcom/vkontakte/android/auth/VKAuthHelper;->onAuthNeedValidation(Lcom/vkontakte/android/auth/VKAuthState;Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;)V

    .line 100
    iget-object v0, p0, Lcom/vkontakte/android/activities/RestoreActivity$1;->this$0:Lcom/vkontakte/android/activities/RestoreActivity;

    invoke-virtual {v0}, Lcom/vkontakte/android/activities/RestoreActivity;->hideProgress()V

    .line 101
    return-void
.end method

.method public onAuthStart()V
    .locals 1

    .prologue
    .line 74
    iget-object v0, p0, Lcom/vkontakte/android/activities/RestoreActivity$1;->this$0:Lcom/vkontakte/android/activities/RestoreActivity;

    invoke-virtual {v0}, Lcom/vkontakte/android/activities/RestoreActivity;->showProgress()V

    .line 75
    return-void
.end method
