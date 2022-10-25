.class Lcom/vkontakte/android/fragments/ProfileFragment$22;
.super Ljava/lang/Object;
.source "ProfileFragment.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/ProfileFragment;->doAddFriend(Ljava/lang/String;)V
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
.field final synthetic this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

.field final synthetic val$msg:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/ProfileFragment;Ljava/lang/String;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/ProfileFragment;

    .prologue
    .line 2852
    iput-object p1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$22;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    iput-object p2, p0, Lcom/vkontakte/android/fragments/ProfileFragment$22;->val$msg:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 9
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    const v8, 0x7f080479

    const/4 v3, 0x1

    const/4 v7, 0x0

    const/4 v6, 0x0

    const v2, 0x7f0801f9

    .line 2885
    invoke-virtual {p1}, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->getCodeValue()I

    move-result v0

    const/16 v1, 0xaf

    if-ne v0, v1, :cond_1

    .line 2886
    new-instance v0, Lcom/vkontakte/android/VKAlertDialog$Builder;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$22;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vkontakte/android/VKAlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 2887
    invoke-virtual {v0, v2}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$22;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    .line 2888
    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$22;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$000(Lcom/vkontakte/android/fragments/ProfileFragment;)Lcom/vkontakte/android/api/ExtendedUserProfile;

    move-result-object v0

    iget-object v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->profile:Lcom/vkontakte/android/UserProfile;

    iget-boolean v0, v0, Lcom/vkontakte/android/UserProfile;->f:Z

    if-eqz v0, :cond_0

    const v0, 0x7f0800ad

    :goto_0
    new-array v3, v3, [Ljava/lang/Object;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Lcom/vkontakte/android/fragments/ProfileFragment$22;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v5}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$000(Lcom/vkontakte/android/fragments/ProfileFragment;)Lcom/vkontakte/android/api/ExtendedUserProfile;

    move-result-object v5

    iget-object v5, v5, Lcom/vkontakte/android/api/ExtendedUserProfile;->firstNameDat:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, " "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/vkontakte/android/fragments/ProfileFragment$22;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v5}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$000(Lcom/vkontakte/android/fragments/ProfileFragment;)Lcom/vkontakte/android/api/ExtendedUserProfile;

    move-result-object v5

    iget-object v5, v5, Lcom/vkontakte/android/api/ExtendedUserProfile;->lastNameDat:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v7

    invoke-virtual {v2, v0, v3}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 2889
    invoke-virtual {v0, v8, v6}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 2890
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 2918
    :goto_1
    return-void

    .line 2888
    :cond_0
    const v0, 0x7f0800ae

    goto :goto_0

    .line 2891
    :cond_1
    invoke-virtual {p1}, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->getCodeValue()I

    move-result v0

    const/16 v1, 0xb0

    if-ne v0, v1, :cond_3

    .line 2892
    new-instance v0, Lcom/vkontakte/android/VKAlertDialog$Builder;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$22;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vkontakte/android/VKAlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 2893
    invoke-virtual {v0, v2}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$22;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    .line 2894
    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$22;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$000(Lcom/vkontakte/android/fragments/ProfileFragment;)Lcom/vkontakte/android/api/ExtendedUserProfile;

    move-result-object v0

    iget-object v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->profile:Lcom/vkontakte/android/UserProfile;

    iget-boolean v0, v0, Lcom/vkontakte/android/UserProfile;->f:Z

    if-eqz v0, :cond_2

    const v0, 0x7f0800ab

    :goto_2
    new-array v3, v3, [Ljava/lang/Object;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Lcom/vkontakte/android/fragments/ProfileFragment$22;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v5}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$000(Lcom/vkontakte/android/fragments/ProfileFragment;)Lcom/vkontakte/android/api/ExtendedUserProfile;

    move-result-object v5

    iget-object v5, v5, Lcom/vkontakte/android/api/ExtendedUserProfile;->firstNameAcc:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, " "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/vkontakte/android/fragments/ProfileFragment$22;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v5}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$000(Lcom/vkontakte/android/fragments/ProfileFragment;)Lcom/vkontakte/android/api/ExtendedUserProfile;

    move-result-object v5

    iget-object v5, v5, Lcom/vkontakte/android/api/ExtendedUserProfile;->lastNameAcc:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v7

    invoke-virtual {v2, v0, v3}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f08071c

    new-instance v2, Lcom/vkontakte/android/fragments/ProfileFragment$22$1;

    invoke-direct {v2, p0}, Lcom/vkontakte/android/fragments/ProfileFragment$22$1;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment$22;)V

    .line 2895
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f08011f

    .line 2909
    invoke-virtual {v0, v1, v6}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 2910
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto :goto_1

    .line 2894
    :cond_2
    const v0, 0x7f0800ac

    goto :goto_2

    .line 2912
    :cond_3
    new-instance v1, Lcom/vkontakte/android/VKAlertDialog$Builder;

    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$22;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    if-nez v0, :cond_4

    invoke-static {}, Lcom/vkontakte/android/AppStateTracker;->getCurrentActivity()Landroid/app/Activity;

    move-result-object v0

    :goto_3
    invoke-direct {v1, v0}, Lcom/vkontakte/android/VKAlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 2913
    invoke-virtual {v1, v2}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f0801f3

    .line 2914
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 2915
    invoke-virtual {v0, v8, v6}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 2916
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto/16 :goto_1

    .line 2912
    :cond_4
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$22;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    goto :goto_3
.end method

.method public success(Ljava/lang/Integer;)V
    .locals 7
    .param p1, "result"    # Ljava/lang/Integer;

    .prologue
    const/4 v6, 0x1

    .line 2855
    const/4 v0, 0x0

    .line 2856
    .local v0, "msg":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-ne v1, v6, :cond_1

    .line 2857
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$22;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$000(Lcom/vkontakte/android/fragments/ProfileFragment;)Lcom/vkontakte/android/api/ExtendedUserProfile;

    move-result-object v1

    iget-boolean v1, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->canSendFriendRequest:Z

    if-eqz v1, :cond_0

    .line 2858
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$22;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$22;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$000(Lcom/vkontakte/android/fragments/ProfileFragment;)Lcom/vkontakte/android/api/ExtendedUserProfile;

    move-result-object v1

    iget-object v1, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->profile:Lcom/vkontakte/android/UserProfile;

    iget-boolean v1, v1, Lcom/vkontakte/android/UserProfile;->f:Z

    if-eqz v1, :cond_6

    const v1, 0x7f0800b3

    :goto_0
    new-array v3, v6, [Ljava/lang/Object;

    const/4 v4, 0x0

    iget-object v5, p0, Lcom/vkontakte/android/fragments/ProfileFragment$22;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    .line 2859
    invoke-static {v5}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$000(Lcom/vkontakte/android/fragments/ProfileFragment;)Lcom/vkontakte/android/api/ExtendedUserProfile;

    move-result-object v5

    iget-object v5, v5, Lcom/vkontakte/android/api/ExtendedUserProfile;->firstNameDat:Ljava/lang/String;

    aput-object v5, v3, v4

    .line 2858
    invoke-virtual {v2, v1, v3}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 2861
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$22;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$000(Lcom/vkontakte/android/fragments/ProfileFragment;)Lcom/vkontakte/android/api/ExtendedUserProfile;

    move-result-object v1

    iput v6, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->friendStatus:I

    .line 2863
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const/4 v2, 0x2

    if-ne v1, v2, :cond_2

    .line 2864
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$22;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0800a9

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 2865
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$22;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$000(Lcom/vkontakte/android/fragments/ProfileFragment;)Lcom/vkontakte/android/api/ExtendedUserProfile;

    move-result-object v1

    const/4 v2, 0x3

    iput v2, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->friendStatus:I

    .line 2866
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$22;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$000(Lcom/vkontakte/android/fragments/ProfileFragment;)Lcom/vkontakte/android/api/ExtendedUserProfile;

    move-result-object v1

    iget-object v1, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->profile:Lcom/vkontakte/android/UserProfile;

    invoke-static {v1}, Lcom/vkontakte/android/data/Friends;->addLocally(Lcom/vkontakte/android/UserProfile;)V

    .line 2867
    invoke-static {}, Lcom/vkontakte/android/data/Friends;->decreaseRequests()V

    .line 2869
    :cond_2
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const/4 v2, 0x4

    if-ne v1, v2, :cond_3

    .line 2870
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$22;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0800aa

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 2871
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$22;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$000(Lcom/vkontakte/android/fragments/ProfileFragment;)Lcom/vkontakte/android/api/ExtendedUserProfile;

    move-result-object v1

    iput v6, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->friendStatus:I

    .line 2873
    :cond_3
    if-eqz v0, :cond_4

    .line 2874
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$22;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-static {v1, v0, v6}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 2876
    :cond_4
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$22;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$3200(Lcom/vkontakte/android/fragments/ProfileFragment;)V

    .line 2877
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$22;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    const-string/jumbo v2, "from_post"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 2878
    const-string/jumbo v1, "subscription_from_post"

    invoke-static {v1}, Lcom/vkontakte/android/data/Analytics;->track(Ljava/lang/String;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->collapse()Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->unique()Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v1

    const-string/jumbo v2, "post_ids"

    iget-object v3, p0, Lcom/vkontakte/android/fragments/ProfileFragment$22;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

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

    .line 2880
    :cond_5
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$22;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$100(Lcom/vkontakte/android/fragments/ProfileFragment;)I

    move-result v1

    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment$22;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$000(Lcom/vkontakte/android/fragments/ProfileFragment;)Lcom/vkontakte/android/api/ExtendedUserProfile;

    move-result-object v2

    iget v2, v2, Lcom/vkontakte/android/api/ExtendedUserProfile;->friendStatus:I

    invoke-static {v1, v2}, Lcom/vkontakte/android/data/Friends;->notifyFriendStatusChanged(II)V

    .line 2881
    return-void

    .line 2858
    :cond_6
    const v1, 0x7f0800b4

    goto/16 :goto_0
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 2852
    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/ProfileFragment$22;->success(Ljava/lang/Integer;)V

    return-void
.end method
