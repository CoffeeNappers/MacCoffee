.class Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment$3;
.super Lcom/vkontakte/android/api/ResultlessCallback;
.source "ManagerEditFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;->save()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;

.field final synthetic val$contactTitle:Ljava/lang/String;

.field final synthetic val$displayableRole:Ljava/lang/String;

.field final synthetic val$role:Ljava/lang/String;

.field final synthetic val$show:Z


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 227
    iput-object p1, p0, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment$3;->this$0:Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;

    iput-object p3, p0, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment$3;->val$displayableRole:Ljava/lang/String;

    iput-object p4, p0, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment$3;->val$role:Ljava/lang/String;

    iput-boolean p5, p0, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment$3;->val$show:Z

    iput-object p6, p0, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment$3;->val$contactTitle:Ljava/lang/String;

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/ResultlessCallback;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public success()V
    .locals 5

    .prologue
    .line 230
    iget-object v2, p0, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment$3;->this$0:Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;->access$200(Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;)Lcom/vkontakte/android/UserProfile;

    move-result-object v2

    iget-object v2, v2, Lcom/vkontakte/android/UserProfile;->extra:Landroid/os/Bundle;

    const-string/jumbo v3, "role"

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1

    const/4 v0, 0x1

    .line 231
    .local v0, "added":Z
    :goto_0
    iget-object v2, p0, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment$3;->this$0:Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;->access$200(Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;)Lcom/vkontakte/android/UserProfile;

    move-result-object v2

    iget-object v3, p0, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment$3;->val$displayableRole:Ljava/lang/String;

    iput-object v3, v2, Lcom/vkontakte/android/UserProfile;->university:Ljava/lang/String;

    .line 232
    iget-object v2, p0, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment$3;->val$role:Ljava/lang/String;

    if-eqz v2, :cond_0

    .line 233
    iget-object v2, p0, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment$3;->this$0:Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;->access$200(Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;)Lcom/vkontakte/android/UserProfile;

    move-result-object v2

    iget-object v2, v2, Lcom/vkontakte/android/UserProfile;->extra:Landroid/os/Bundle;

    const-string/jumbo v3, "role"

    iget-object v4, p0, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment$3;->val$role:Ljava/lang/String;

    invoke-virtual {v2, v3, v4}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 235
    :cond_0
    iget-boolean v2, p0, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment$3;->val$show:Z

    if-eqz v2, :cond_2

    .line 236
    iget-object v2, p0, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment$3;->this$0:Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;->access$200(Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;)Lcom/vkontakte/android/UserProfile;

    move-result-object v2

    iget-object v2, v2, Lcom/vkontakte/android/UserProfile;->extra:Landroid/os/Bundle;

    const-string/jumbo v3, "contact_title"

    iget-object v4, p0, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment$3;->val$contactTitle:Ljava/lang/String;

    invoke-virtual {v2, v3, v4}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 240
    :goto_1
    new-instance v1, Landroid/content/Intent;

    if-eqz v0, :cond_3

    sget-object v2, Lcom/vkontakte/android/data/GroupsAdmin;->ACTION_ADMIN_ADDED:Ljava/lang/String;

    :goto_2
    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 241
    .local v1, "intent":Landroid/content/Intent;
    const-string/jumbo v2, "group_id"

    iget-object v3, p0, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment$3;->this$0:Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;

    invoke-virtual {v3}, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v3

    const-string/jumbo v4, "id"

    invoke-virtual {v3, v4}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 242
    const-string/jumbo v2, "profile"

    iget-object v3, p0, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment$3;->this$0:Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;->access$200(Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;)Lcom/vkontakte/android/UserProfile;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 243
    sget-object v2, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-static {v2}, Landroid/support/v4/content/LocalBroadcastManager;->getInstance(Landroid/content/Context;)Landroid/support/v4/content/LocalBroadcastManager;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/support/v4/content/LocalBroadcastManager;->sendBroadcast(Landroid/content/Intent;)Z

    .line 244
    iget-object v2, p0, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment$3;->this$0:Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;

    invoke-virtual {v2}, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v2

    const-string/jumbo v3, "_dialog"

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 245
    iget-object v2, p0, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment$3;->this$0:Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;

    invoke-virtual {v2}, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;->dismiss()V

    .line 249
    :goto_3
    return-void

    .line 230
    .end local v0    # "added":Z
    .end local v1    # "intent":Landroid/content/Intent;
    :cond_1
    const/4 v0, 0x0

    goto :goto_0

    .line 238
    .restart local v0    # "added":Z
    :cond_2
    iget-object v2, p0, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment$3;->this$0:Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;->access$200(Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;)Lcom/vkontakte/android/UserProfile;

    move-result-object v2

    iget-object v2, v2, Lcom/vkontakte/android/UserProfile;->extra:Landroid/os/Bundle;

    const-string/jumbo v3, "contact_title"

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    goto :goto_1

    .line 240
    :cond_3
    sget-object v2, Lcom/vkontakte/android/data/GroupsAdmin;->ACTION_ADMIN_CHANGED:Ljava/lang/String;

    goto :goto_2

    .line 247
    .restart local v1    # "intent":Landroid/content/Intent;
    :cond_4
    iget-object v2, p0, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment$3;->this$0:Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;

    invoke-virtual {v2}, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->finish()V

    goto :goto_3
.end method
