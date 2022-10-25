.class Lcom/vkontakte/android/fragments/ProfileFragment$23;
.super Lcom/vkontakte/android/api/ResultlessCallback;
.source "ProfileFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/ProfileFragment;->joinGroup(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

.field final synthetic val$sure:Z


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/ProfileFragment;Landroid/content/Context;Z)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/ProfileFragment;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 2923
    iput-object p1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$23;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    iput-boolean p3, p0, Lcom/vkontakte/android/fragments/ProfileFragment$23;->val$sure:Z

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/ResultlessCallback;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 3
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 2944
    new-instance v0, Lcom/vkontakte/android/VKAlertDialog$Builder;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$23;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vkontakte/android/VKAlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x7f0801f9

    .line 2945
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 2946
    invoke-virtual {p1}, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->getCodeValue()I

    move-result v0

    const/16 v2, 0xf

    if-ne v0, v2, :cond_0

    const v0, 0x7f08048c

    :goto_0
    invoke-virtual {v1, v0}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f080479

    const/4 v2, 0x0

    .line 2947
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 2948
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 2949
    return-void

    .line 2946
    :cond_0
    const v0, 0x7f0801f6

    goto :goto_0
.end method

.method public success()V
    .locals 6

    .prologue
    const/4 v5, 0x5

    .line 2926
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$23;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    const-string/jumbo v2, "from_post"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 2927
    const-string/jumbo v1, "subscription_from_post"

    invoke-static {v1}, Lcom/vkontakte/android/data/Analytics;->track(Ljava/lang/String;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->collapse()Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->unique()Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v1

    const-string/jumbo v2, "post_ids"

    iget-object v3, p0, Lcom/vkontakte/android/fragments/ProfileFragment$23;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-virtual {v3}, Lcom/vkontakte/android/fragments/ProfileFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v3

    const-string/jumbo v4, "from_post"

    invoke-virtual {v3, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->addParam(Ljava/lang/String;Ljava/lang/Object;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->commit()Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->flushBuffer()Lcom/vkontakte/android/data/Analytics$EventBuilder;

    .line 2929
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$23;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$000(Lcom/vkontakte/android/fragments/ProfileFragment;)Lcom/vkontakte/android/api/ExtendedUserProfile;

    move-result-object v1

    iget v1, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->friendStatus:I

    if-ne v1, v5, :cond_1

    .line 2930
    invoke-static {}, Lcom/vkontakte/android/data/Groups;->decreaseInvites()V

    .line 2932
    :cond_1
    iget-boolean v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$23;->val$sure:Z

    if-eqz v1, :cond_3

    const/4 v0, 0x1

    .line 2933
    .local v0, "joinedStatus":I
    :goto_0
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$23;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$000(Lcom/vkontakte/android/fragments/ProfileFragment;)Lcom/vkontakte/android/api/ExtendedUserProfile;

    move-result-object v1

    iget v1, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->groupAccess:I

    if-eqz v1, :cond_5

    .line 2934
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$23;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$000(Lcom/vkontakte/android/fragments/ProfileFragment;)Lcom/vkontakte/android/api/ExtendedUserProfile;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment$23;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$000(Lcom/vkontakte/android/fragments/ProfileFragment;)Lcom/vkontakte/android/api/ExtendedUserProfile;

    move-result-object v2

    iget v2, v2, Lcom/vkontakte/android/api/ExtendedUserProfile;->friendStatus:I

    if-eq v2, v5, :cond_2

    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment$23;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$000(Lcom/vkontakte/android/fragments/ProfileFragment;)Lcom/vkontakte/android/api/ExtendedUserProfile;

    move-result-object v2

    iget v2, v2, Lcom/vkontakte/android/api/ExtendedUserProfile;->adminLevel:I

    if-lez v2, :cond_4

    .end local v0    # "joinedStatus":I
    :cond_2
    :goto_1
    iput v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->friendStatus:I

    .line 2938
    :goto_2
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$23;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$100(Lcom/vkontakte/android/fragments/ProfileFragment;)I

    move-result v1

    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment$23;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$000(Lcom/vkontakte/android/fragments/ProfileFragment;)Lcom/vkontakte/android/api/ExtendedUserProfile;

    move-result-object v2

    iget v2, v2, Lcom/vkontakte/android/api/ExtendedUserProfile;->friendStatus:I

    invoke-static {v1, v2}, Lcom/vkontakte/android/data/Groups;->notifyGroupStatusChanged(II)V

    .line 2939
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$23;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$3300(Lcom/vkontakte/android/fragments/ProfileFragment;)V

    .line 2940
    return-void

    .line 2932
    :cond_3
    const/4 v0, 0x2

    goto :goto_0

    .line 2934
    .restart local v0    # "joinedStatus":I
    :cond_4
    const/4 v0, 0x4

    goto :goto_1

    .line 2936
    :cond_5
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$23;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$000(Lcom/vkontakte/android/fragments/ProfileFragment;)Lcom/vkontakte/android/api/ExtendedUserProfile;

    move-result-object v1

    iput v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->friendStatus:I

    goto :goto_2
.end method
