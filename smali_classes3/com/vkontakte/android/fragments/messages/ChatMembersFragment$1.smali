.class Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$1;
.super Landroid/content/BroadcastReceiver;
.source "ChatMembersFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;

    .prologue
    .line 90
    iput-object p1, p0, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 9
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v8, 0x0

    const/4 v7, 0x0

    .line 93
    const-string/jumbo v4, "com.vkontakte.android.CHAT_CHANGED"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 94
    const-string/jumbo v4, "id"

    invoke-virtual {p2, v4, v7}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    .line 95
    .local v0, "cid":I
    const-string/jumbo v4, "vk"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "Received chat changed: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 96
    iget-object v4, p0, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;->access$100(Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;)I

    move-result v4

    if-ne v0, v4, :cond_0

    .line 97
    iget-object v4, p0, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;->access$200(Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;)V

    .line 98
    iget-object v4, p0, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;->access$300(Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;)V

    .line 101
    .end local v0    # "cid":I
    :cond_0
    const-string/jumbo v4, "com.vkontakte.android.UPLOAD_PROGRESS"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 102
    const-string/jumbo v4, "id"

    invoke-virtual {p2, v4, v7}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    .line 103
    .local v2, "id":I
    iget-object v4, p0, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;->access$400(Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;)I

    move-result v4

    if-ne v2, v4, :cond_1

    .line 104
    const-string/jumbo v4, "done"

    invoke-virtual {p2, v4, v7}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    .line 105
    .local v1, "done":I
    const-string/jumbo v4, "total"

    invoke-virtual {p2, v4, v7}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v3

    .line 106
    .local v3, "total":I
    iget-object v4, p0, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;->access$500(Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;)Landroid/app/ProgressDialog;

    move-result-object v4

    if-eqz v4, :cond_1

    .line 107
    iget-object v4, p0, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;->access$500(Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;)Landroid/app/ProgressDialog;

    move-result-object v4

    invoke-virtual {v4, v7}, Landroid/app/ProgressDialog;->setIndeterminate(Z)V

    .line 108
    iget-object v4, p0, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;->access$500(Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;)Landroid/app/ProgressDialog;

    move-result-object v4

    invoke-virtual {v4, v3}, Landroid/app/ProgressDialog;->setMax(I)V

    .line 109
    iget-object v4, p0, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;->access$500(Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;)Landroid/app/ProgressDialog;

    move-result-object v4

    invoke-virtual {v4, v1}, Landroid/app/ProgressDialog;->setProgress(I)V

    .line 113
    .end local v1    # "done":I
    .end local v2    # "id":I
    .end local v3    # "total":I
    :cond_1
    const-string/jumbo v4, "com.vkontakte.android.UPLOAD_DONE"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 114
    const-string/jumbo v4, "id"

    invoke-virtual {p2, v4, v7}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    .line 115
    .restart local v2    # "id":I
    iget-object v4, p0, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;->access$400(Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;)I

    move-result v4

    if-ne v2, v4, :cond_2

    .line 116
    iget-object v4, p0, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;->access$500(Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;)Landroid/app/ProgressDialog;

    move-result-object v4

    invoke-static {v4}, Lcom/vkontakte/android/ViewUtils;->dismissDialogSafety(Landroid/app/Dialog;)V

    .line 117
    iget-object v4, p0, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;

    invoke-static {v4, v8}, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;->access$502(Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;Landroid/app/ProgressDialog;)Landroid/app/ProgressDialog;

    .line 120
    .end local v2    # "id":I
    :cond_2
    const-string/jumbo v4, "com.vkontakte.android.UPLOAD_FAILED"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 121
    const-string/jumbo v4, "id"

    invoke-virtual {p2, v4, v7}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    .line 122
    .restart local v2    # "id":I
    iget-object v4, p0, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;->access$400(Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;)I

    move-result v4

    if-ne v2, v4, :cond_3

    .line 123
    iget-object v4, p0, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;->access$500(Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;)Landroid/app/ProgressDialog;

    move-result-object v4

    invoke-static {v4}, Lcom/vkontakte/android/ViewUtils;->dismissDialogSafety(Landroid/app/Dialog;)V

    .line 124
    iget-object v4, p0, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;

    invoke-static {v4, v8}, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;->access$502(Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;Landroid/app/ProgressDialog;)Landroid/app/ProgressDialog;

    .line 125
    new-instance v4, Landroid/app/AlertDialog$Builder;

    iget-object v5, p0, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;

    invoke-virtual {v5}, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;->getActivity()Landroid/app/Activity;

    move-result-object v5

    invoke-direct {v4, v5}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v5, 0x7f0801f9

    invoke-virtual {v4, v5}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    const v5, 0x7f080736

    invoke-virtual {v4, v5}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    const v5, 0x7f080479

    .line 126
    invoke-virtual {v4, v5, v8}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    invoke-virtual {v4}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 129
    .end local v2    # "id":I
    :cond_3
    return-void
.end method
