.class Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment$4;
.super Ljava/lang/Object;
.source "ManagerEditFragment.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;->remove()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;

    .prologue
    .line 259
    iput-object p1, p0, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment$4;->this$0:Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 6
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    const/4 v3, 0x0

    .line 262
    new-instance v0, Lcom/vkontakte/android/api/groups/GroupsEditManager;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment$4;->this$0:Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    const-string/jumbo v2, "id"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v1

    iget-object v2, p0, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment$4;->this$0:Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;->access$200(Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;)Lcom/vkontakte/android/UserProfile;

    move-result-object v2

    iget v2, v2, Lcom/vkontakte/android/UserProfile;->uid:I

    const/4 v4, 0x0

    move-object v5, v3

    invoke-direct/range {v0 .. v5}, Lcom/vkontakte/android/api/groups/GroupsEditManager;-><init>(IILjava/lang/String;ZLjava/lang/String;)V

    new-instance v1, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment$4$1;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment$4;->this$0:Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;

    .line 263
    invoke-virtual {v2}, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-direct {v1, p0, v2}, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment$4$1;-><init>(Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment$4;Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/groups/GroupsEditManager;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment$4;->this$0:Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;

    .line 277
    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment$4;->this$0:Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;

    .line 278
    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/groupadmin/ManagerEditFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 279
    return-void
.end method
