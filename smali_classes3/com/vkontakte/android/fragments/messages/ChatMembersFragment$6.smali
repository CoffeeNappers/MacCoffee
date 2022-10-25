.class Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$6;
.super Lcom/vkontakte/android/api/ResultlessCallback;
.source "ChatMembersFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;->addUserToChat(Lcom/vkontakte/android/UserProfile;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;

.field final synthetic val$p:Lcom/vkontakte/android/UserProfile;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;Landroid/content/Context;Lcom/vkontakte/android/UserProfile;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 424
    iput-object p1, p0, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$6;->this$0:Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;

    iput-object p3, p0, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$6;->val$p:Lcom/vkontakte/android/UserProfile;

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/ResultlessCallback;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 4
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 442
    invoke-virtual {p1}, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->getCodeValue()I

    move-result v1

    const/16 v2, 0xf

    if-ne v1, v2, :cond_2

    .line 443
    const/4 v0, 0x0

    .line 444
    .local v0, "err":Ljava/lang/String;
    iget-object v1, p1, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->message:Ljava/lang/String;

    const-string/jumbo v2, "already left"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 445
    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$6;->this$0:Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;

    const v2, 0x7f08012e

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 449
    :cond_0
    :goto_0
    if-eqz v0, :cond_2

    .line 450
    new-instance v1, Landroid/app/AlertDialog$Builder;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$6;->this$0:Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;

    invoke-virtual {v2}, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v2, 0x7f0801f9

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x7f080479

    const/4 v3, 0x0

    .line 451
    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 456
    .end local v0    # "err":Ljava/lang/String;
    :goto_1
    return-void

    .line 446
    .restart local v0    # "err":Ljava/lang/String;
    :cond_1
    iget-object v1, p1, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->message:Ljava/lang/String;

    const-string/jumbo v2, "already in"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 447
    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$6;->this$0:Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;

    const v2, 0x7f08012d

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 455
    .end local v0    # "err":Ljava/lang/String;
    :cond_2
    invoke-super {p0, p1}, Lcom/vkontakte/android/api/ResultlessCallback;->fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V

    goto :goto_1
.end method

.method public success()V
    .locals 3

    .prologue
    .line 427
    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$6;->val$p:Lcom/vkontakte/android/UserProfile;

    if-nez v1, :cond_0

    .line 428
    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$6;->this$0:Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;->reload()V

    .line 438
    :goto_0
    return-void

    .line 430
    :cond_0
    new-instance v0, Lcom/vkontakte/android/ChatUser;

    invoke-direct {v0}, Lcom/vkontakte/android/ChatUser;-><init>()V

    .line 431
    .local v0, "cu":Lcom/vkontakte/android/ChatUser;
    new-instance v1, Lcom/vkontakte/android/UserProfile;

    invoke-direct {v1}, Lcom/vkontakte/android/UserProfile;-><init>()V

    iput-object v1, v0, Lcom/vkontakte/android/ChatUser;->inviter:Lcom/vkontakte/android/UserProfile;

    .line 432
    iget-object v1, v0, Lcom/vkontakte/android/ChatUser;->inviter:Lcom/vkontakte/android/UserProfile;

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v2

    iput v2, v1, Lcom/vkontakte/android/UserProfile;->uid:I

    .line 433
    iget-object v1, v0, Lcom/vkontakte/android/ChatUser;->inviter:Lcom/vkontakte/android/UserProfile;

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vkontakte/android/auth/VKAccount;->getName()Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    .line 434
    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$6;->val$p:Lcom/vkontakte/android/UserProfile;

    iput-object v1, v0, Lcom/vkontakte/android/ChatUser;->user:Lcom/vkontakte/android/UserProfile;

    .line 435
    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$6;->this$0:Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;->access$600(Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;)Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$Adapter;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$Adapter;->addChatUser(Lcom/vkontakte/android/ChatUser;)V

    .line 436
    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$6;->this$0:Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;->updateList()V

    goto :goto_0
.end method
