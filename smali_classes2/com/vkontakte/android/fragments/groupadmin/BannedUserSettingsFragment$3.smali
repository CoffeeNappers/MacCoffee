.class Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment$3;
.super Lcom/vkontakte/android/api/ResultlessCallback;
.source "BannedUserSettingsFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;->save()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;

.field final synthetic val$comment:Ljava/lang/String;

.field final synthetic val$endDate:I

.field final synthetic val$reason:I

.field final synthetic val$showComment:Z


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;Landroid/content/Context;ILjava/lang/String;IZ)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 234
    iput-object p1, p0, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment$3;->this$0:Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;

    iput p3, p0, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment$3;->val$endDate:I

    iput-object p4, p0, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment$3;->val$comment:Ljava/lang/String;

    iput p5, p0, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment$3;->val$reason:I

    iput-boolean p6, p0, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment$3;->val$showComment:Z

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/ResultlessCallback;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public success()V
    .locals 6

    .prologue
    const/4 v5, 0x0

    .line 237
    iget-object v3, p0, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment$3;->this$0:Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;->access$200(Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;)Lcom/vkontakte/android/UserProfile;

    move-result-object v3

    iget-object v3, v3, Lcom/vkontakte/android/UserProfile;->extra:Landroid/os/Bundle;

    const-string/jumbo v4, "ban_admin"

    invoke-virtual {v3, v4}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v2

    .line 238
    .local v2, "wasBanned":Z
    if-nez v2, :cond_0

    .line 239
    new-instance v1, Lcom/vkontakte/android/UserProfile;

    invoke-direct {v1}, Lcom/vkontakte/android/UserProfile;-><init>()V

    .line 240
    .local v1, "me":Lcom/vkontakte/android/UserProfile;
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v3

    invoke-virtual {v3}, Lcom/vkontakte/android/auth/VKAccount;->getName()Ljava/lang/String;

    move-result-object v3

    iput-object v3, v1, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    .line 241
    iget-object v3, p0, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment$3;->this$0:Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;

    invoke-virtual {v3}, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v3, v4, v5}, Landroid/app/Activity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v3

    const-string/jumbo v4, "usersex"

    invoke-interface {v3, v4, v5}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    iput-boolean v3, v1, Lcom/vkontakte/android/UserProfile;->f:Z

    .line 242
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v3

    invoke-virtual {v3}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v3

    iput v3, v1, Lcom/vkontakte/android/UserProfile;->uid:I

    .line 243
    iget-object v3, p0, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment$3;->this$0:Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;->access$200(Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;)Lcom/vkontakte/android/UserProfile;

    move-result-object v3

    iget-object v3, v3, Lcom/vkontakte/android/UserProfile;->extra:Landroid/os/Bundle;

    const-string/jumbo v4, "ban_admin"

    invoke-virtual {v3, v4, v1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 244
    iget-object v3, p0, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment$3;->this$0:Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;->access$200(Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;)Lcom/vkontakte/android/UserProfile;

    move-result-object v3

    iget-object v3, v3, Lcom/vkontakte/android/UserProfile;->extra:Landroid/os/Bundle;

    const-string/jumbo v4, "ban_date"

    invoke-static {}, Lcom/vkontakte/android/TimeUtils;->getCurrentTime()I

    move-result v5

    invoke-virtual {v3, v4, v5}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 246
    .end local v1    # "me":Lcom/vkontakte/android/UserProfile;
    :cond_0
    iget v3, p0, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment$3;->val$endDate:I

    if-lez v3, :cond_1

    .line 247
    iget-object v3, p0, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment$3;->this$0:Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;->access$200(Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;)Lcom/vkontakte/android/UserProfile;

    move-result-object v3

    iget-object v3, v3, Lcom/vkontakte/android/UserProfile;->extra:Landroid/os/Bundle;

    const-string/jumbo v4, "ban_end_date"

    iget v5, p0, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment$3;->val$endDate:I

    invoke-virtual {v3, v4, v5}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 251
    :goto_0
    iget-object v3, p0, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment$3;->this$0:Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;->access$200(Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;)Lcom/vkontakte/android/UserProfile;

    move-result-object v3

    iget-object v3, v3, Lcom/vkontakte/android/UserProfile;->extra:Landroid/os/Bundle;

    const-string/jumbo v4, "ban_comment"

    iget-object v5, p0, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment$3;->val$comment:Ljava/lang/String;

    invoke-virtual {v3, v4, v5}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 252
    iget-object v3, p0, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment$3;->this$0:Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;->access$200(Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;)Lcom/vkontakte/android/UserProfile;

    move-result-object v3

    iget-object v3, v3, Lcom/vkontakte/android/UserProfile;->extra:Landroid/os/Bundle;

    const-string/jumbo v4, "ban_reason"

    iget v5, p0, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment$3;->val$reason:I

    invoke-virtual {v3, v4, v5}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 253
    iget-object v3, p0, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment$3;->this$0:Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;->access$200(Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;)Lcom/vkontakte/android/UserProfile;

    move-result-object v3

    iget-object v3, v3, Lcom/vkontakte/android/UserProfile;->extra:Landroid/os/Bundle;

    const-string/jumbo v4, "ban_comment_visible"

    iget-boolean v5, p0, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment$3;->val$showComment:Z

    invoke-virtual {v3, v4, v5}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 254
    new-instance v0, Landroid/content/Intent;

    if-eqz v2, :cond_2

    sget-object v3, Lcom/vkontakte/android/data/GroupsAdmin;->ACTION_BAN_CHANGED:Ljava/lang/String;

    :goto_1
    invoke-direct {v0, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 255
    .local v0, "intent":Landroid/content/Intent;
    const-string/jumbo v3, "group_id"

    iget-object v4, p0, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment$3;->this$0:Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;

    invoke-virtual {v4}, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v4

    const-string/jumbo v5, "id"

    invoke-virtual {v4, v5}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v4

    invoke-virtual {v0, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 256
    const-string/jumbo v3, "profile"

    iget-object v4, p0, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment$3;->this$0:Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;->access$200(Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;)Lcom/vkontakte/android/UserProfile;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 257
    sget-object v3, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-static {v3}, Landroid/support/v4/content/LocalBroadcastManager;->getInstance(Landroid/content/Context;)Landroid/support/v4/content/LocalBroadcastManager;

    move-result-object v3

    invoke-virtual {v3, v0}, Landroid/support/v4/content/LocalBroadcastManager;->sendBroadcast(Landroid/content/Intent;)Z

    .line 258
    iget-object v3, p0, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment$3;->this$0:Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;

    invoke-virtual {v3}, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v3

    const-string/jumbo v4, "_dialog"

    invoke-virtual {v3, v4}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 259
    iget-object v3, p0, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment$3;->this$0:Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;

    invoke-virtual {v3}, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;->dismiss()V

    .line 263
    :goto_2
    return-void

    .line 249
    .end local v0    # "intent":Landroid/content/Intent;
    :cond_1
    iget-object v3, p0, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment$3;->this$0:Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;->access$200(Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;)Lcom/vkontakte/android/UserProfile;

    move-result-object v3

    iget-object v3, v3, Lcom/vkontakte/android/UserProfile;->extra:Landroid/os/Bundle;

    const-string/jumbo v4, "ban_end_date"

    invoke-virtual {v3, v4}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 254
    :cond_2
    sget-object v3, Lcom/vkontakte/android/data/GroupsAdmin;->ACTION_BAN_ADDED:Ljava/lang/String;

    goto :goto_1

    .line 261
    .restart local v0    # "intent":Landroid/content/Intent;
    :cond_3
    iget-object v3, p0, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment$3;->this$0:Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;

    invoke-virtual {v3}, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-virtual {v3}, Landroid/app/Activity;->finish()V

    goto :goto_2
.end method
