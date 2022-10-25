.class Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment$4$1;
.super Lcom/vkontakte/android/api/ResultlessCallback;
.source "ManagerEditFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment$4;->onClick(Landroid/content/DialogInterface;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment$4;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment$4;Landroid/content/Context;)V
    .locals 0
    .param p1, "this$1"    # Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment$4;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 263
    iput-object p1, p0, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment$4$1;->this$1:Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment$4;

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/ResultlessCallback;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public success()V
    .locals 4

    .prologue
    .line 266
    new-instance v0, Landroid/content/Intent;

    sget-object v1, Lcom/vkontakte/android/data/GroupsAdmin;->ACTION_ADMIN_REMOVED:Ljava/lang/String;

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 267
    .local v0, "intent":Landroid/content/Intent;
    const-string/jumbo v1, "group_id"

    iget-object v2, p0, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment$4$1;->this$1:Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment$4;

    iget-object v2, v2, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment$4;->this$0:Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;

    invoke-virtual {v2}, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v2

    const-string/jumbo v3, "id"

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 268
    const-string/jumbo v1, "user_id"

    iget-object v2, p0, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment$4$1;->this$1:Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment$4;

    iget-object v2, v2, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment$4;->this$0:Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;->access$200(Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;)Lcom/vkontakte/android/UserProfile;

    move-result-object v2

    iget v2, v2, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 269
    sget-object v1, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-static {v1}, Landroid/support/v4/content/LocalBroadcastManager;->getInstance(Landroid/content/Context;)Landroid/support/v4/content/LocalBroadcastManager;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/support/v4/content/LocalBroadcastManager;->sendBroadcast(Landroid/content/Intent;)Z

    .line 270
    iget-object v1, p0, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment$4$1;->this$1:Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment$4;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment$4;->this$0:Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    const-string/jumbo v2, "_dialog"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 271
    iget-object v1, p0, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment$4$1;->this$1:Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment$4;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment$4;->this$0:Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;->dismiss()V

    .line 275
    :goto_0
    return-void

    .line 273
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment$4$1;->this$1:Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment$4;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment$4;->this$0:Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->finish()V

    goto :goto_0
.end method
