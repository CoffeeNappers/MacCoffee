.class Lcom/vkontakte/android/fragments/ProfileEditFragment$15;
.super Lcom/vkontakte/android/api/SimpleCallback;
.source "ProfileEditFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/ProfileEditFragment;->save()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/SimpleCallback",
        "<",
        "Lcom/vkontakte/android/api/account/AccountSaveProfileInfo$Result;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

.field final synthetic val$newInfo:Landroid/os/Bundle;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/ProfileEditFragment;Landroid/app/Fragment;Landroid/os/Bundle;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/ProfileEditFragment;
    .param p2, "fragment"    # Landroid/app/Fragment;

    .prologue
    .line 579
    iput-object p1, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$15;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    iput-object p3, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$15;->val$newInfo:Landroid/os/Bundle;

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/SimpleCallback;-><init>(Landroid/app/Fragment;)V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 3
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 609
    invoke-virtual {p1}, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->getCodeValue()I

    move-result v0

    const/16 v1, 0x64

    if-ne v0, v1, :cond_0

    .line 610
    new-instance v0, Lcom/vkontakte/android/VKAlertDialog$Builder;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$15;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vkontakte/android/VKAlertDialog$Builder;-><init>(Landroid/content/Context;)V

    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$15;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    const v2, 0x7f0806a4

    .line 611
    invoke-virtual {v1, v2}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f0801f9

    .line 612
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f080479

    const/4 v2, 0x0

    .line 613
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 614
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 618
    :goto_0
    return-void

    .line 617
    :cond_0
    invoke-super {p0, p1}, Lcom/vkontakte/android/api/SimpleCallback;->fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V

    goto :goto_0
.end method

.method public success(Lcom/vkontakte/android/api/account/AccountSaveProfileInfo$Result;)V
    .locals 8
    .param p1, "res"    # Lcom/vkontakte/android/api/account/AccountSaveProfileInfo$Result;

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 583
    iget v1, p1, Lcom/vkontakte/android/api/account/AccountSaveProfileInfo$Result;->nameStatus:I

    if-nez v1, :cond_3

    .line 584
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$15;->val$newInfo:Landroid/os/Bundle;

    const-string/jumbo v2, "first_name"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$15;->val$newInfo:Landroid/os/Bundle;

    const-string/jumbo v2, "last_name"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 585
    :cond_0
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v1, "com.vkontakte.android.USER_NAME_CHANGED"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 586
    .local v0, "intent":Landroid/content/Intent;
    const-string/jumbo v1, "name"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p1, Lcom/vkontakte/android/api/account/AccountSaveProfileInfo$Result;->newFirst:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p1, Lcom/vkontakte/android/api/account/AccountSaveProfileInfo$Result;->newLast:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 587
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$15;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const-string/jumbo v2, "com.vkontakte.android.permission.ACCESS_DATA"

    invoke-virtual {v1, v0, v2}, Landroid/app/Activity;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 589
    .end local v0    # "intent":Landroid/content/Intent;
    :cond_1
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$15;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const/4 v2, -0x1

    invoke-virtual {v1, v2}, Landroid/app/Activity;->setResult(I)V

    .line 590
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$15;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->finish()V

    .line 605
    :cond_2
    :goto_0
    return-void

    .line 593
    :cond_3
    iget v1, p1, Lcom/vkontakte/android/api/account/AccountSaveProfileInfo$Result;->nameStatus:I

    if-ne v1, v7, :cond_4

    .line 594
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$15;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$15;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    const v3, 0x7f0801d4

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v7}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->access$2000(Lcom/vkontakte/android/fragments/ProfileEditFragment;Ljava/lang/String;Z)V

    .line 596
    :cond_4
    iget v1, p1, Lcom/vkontakte/android/api/account/AccountSaveProfileInfo$Result;->nameStatus:I

    const/4 v2, 0x2

    if-ne v1, v2, :cond_5

    .line 597
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$15;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$15;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    const v3, 0x7f0801d1

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v6}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->access$2000(Lcom/vkontakte/android/fragments/ProfileEditFragment;Ljava/lang/String;Z)V

    .line 599
    :cond_5
    iget v1, p1, Lcom/vkontakte/android/api/account/AccountSaveProfileInfo$Result;->nameStatus:I

    const/4 v2, 0x3

    if-ne v1, v2, :cond_6

    .line 600
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$15;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$15;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    const v3, 0x7f0801d6

    new-array v4, v7, [Ljava/lang/Object;

    iget v5, p1, Lcom/vkontakte/android/api/account/AccountSaveProfileInfo$Result;->nameRetryIn:I

    invoke-static {v5}, Lcom/vkontakte/android/TimeUtils;->langDate(I)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v6

    invoke-virtual {v2, v3, v4}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v6}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->access$2000(Lcom/vkontakte/android/fragments/ProfileEditFragment;Ljava/lang/String;Z)V

    .line 602
    :cond_6
    iget v1, p1, Lcom/vkontakte/android/api/account/AccountSaveProfileInfo$Result;->nameStatus:I

    const/4 v2, 0x4

    if-ne v1, v2, :cond_2

    .line 603
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$15;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$15;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    const v3, 0x7f0801d7

    new-array v4, v7, [Ljava/lang/Object;

    iget v5, p1, Lcom/vkontakte/android/api/account/AccountSaveProfileInfo$Result;->nameRetryIn:I

    invoke-static {v5}, Lcom/vkontakte/android/TimeUtils;->langDate(I)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v6

    invoke-virtual {v2, v3, v4}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v6}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->access$2000(Lcom/vkontakte/android/fragments/ProfileEditFragment;Ljava/lang/String;Z)V

    goto :goto_0
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 579
    check-cast p1, Lcom/vkontakte/android/api/account/AccountSaveProfileInfo$Result;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/ProfileEditFragment$15;->success(Lcom/vkontakte/android/api/account/AccountSaveProfileInfo$Result;)V

    return-void
.end method
