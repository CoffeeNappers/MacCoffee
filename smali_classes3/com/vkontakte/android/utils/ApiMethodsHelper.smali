.class public Lcom/vkontakte/android/utils/ApiMethodsHelper;
.super Ljava/lang/Object;
.source "ApiMethodsHelper.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static addUserToChat(Landroid/content/Context;ILcom/vkontakte/android/UserProfile;ILcom/vkontakte/android/api/Callback;)V
    .locals 1
    .param p0, "ctx"    # Landroid/content/Context;
    .param p1, "id"    # I
    .param p2, "p"    # Lcom/vkontakte/android/UserProfile;
    .param p3, "uid"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "I",
            "Lcom/vkontakte/android/UserProfile;",
            "I",
            "Lcom/vkontakte/android/api/Callback",
            "<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 35
    .local p4, "callback":Lcom/vkontakte/android/api/Callback;, "Lcom/vkontakte/android/api/Callback<Ljava/lang/Boolean;>;"
    new-instance v0, Lcom/vkontakte/android/api/messages/MessagesAddChatUser;

    if-nez p2, :cond_0

    .end local p3    # "uid":I
    :goto_0
    invoke-direct {v0, p1, p3}, Lcom/vkontakte/android/api/messages/MessagesAddChatUser;-><init>(II)V

    invoke-virtual {v0, p4}, Lcom/vkontakte/android/api/messages/MessagesAddChatUser;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 36
    return-void

    .line 35
    .restart local p3    # "uid":I
    :cond_0
    iget p3, p2, Lcom/vkontakte/android/UserProfile;->uid:I

    goto :goto_0
.end method

.method public static allowMessagesFromGroup(Landroid/content/Context;ILcom/vkontakte/android/api/Callback;)V
    .locals 1
    .param p0, "ctx"    # Landroid/content/Context;
    .param p1, "groupId"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "I",
            "Lcom/vkontakte/android/api/Callback",
            "<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 59
    .local p2, "callback":Lcom/vkontakte/android/api/Callback;, "Lcom/vkontakte/android/api/Callback<Ljava/lang/Boolean;>;"
    new-instance v0, Lcom/vkontakte/android/api/messages/MessagesAllowFromGroup;

    invoke-direct {v0, p1}, Lcom/vkontakte/android/api/messages/MessagesAllowFromGroup;-><init>(I)V

    invoke-virtual {v0, p2}, Lcom/vkontakte/android/api/messages/MessagesAllowFromGroup;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 60
    return-void
.end method

.method public static clearHistory(Landroid/content/Context;ILjava/lang/Object;Lcom/vkontakte/android/functions/VoidF2;)V
    .locals 3
    .param p0, "ctx"    # Landroid/content/Context;
    .param p1, "uid"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Landroid/content/Context;",
            "ITT;",
            "Lcom/vkontakte/android/functions/VoidF2",
            "<",
            "Ljava/lang/Integer;",
            "TT;>;)V"
        }
    .end annotation

    .prologue
    .line 22
    .local p2, "object":Ljava/lang/Object;, "TT;"
    .local p3, "f":Lcom/vkontakte/android/functions/VoidF2;, "Lcom/vkontakte/android/functions/VoidF2<Ljava/lang/Integer;TT;>;"
    new-instance v0, Lcom/vkontakte/android/VKAlertDialog$Builder;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/VKAlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x7f080176

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f080148

    .line 23
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f080798

    invoke-static {p1, p0, p3, p2}, Lcom/vkontakte/android/utils/ApiMethodsHelper$$Lambda$1;->lambdaFactory$(ILandroid/content/Context;Lcom/vkontakte/android/functions/VoidF2;Ljava/lang/Object;)Landroid/content/DialogInterface$OnClickListener;

    move-result-object v2

    .line 24
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f080433

    const/4 v2, 0x0

    .line 31
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 32
    return-void
.end method

.method public static denyMessagesFromGroup(Landroid/content/Context;ILcom/vkontakte/android/api/Callback;)V
    .locals 1
    .param p0, "ctx"    # Landroid/content/Context;
    .param p1, "groupId"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "I",
            "Lcom/vkontakte/android/api/Callback",
            "<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 55
    .local p2, "callback":Lcom/vkontakte/android/api/Callback;, "Lcom/vkontakte/android/api/Callback<Ljava/lang/Boolean;>;"
    new-instance v0, Lcom/vkontakte/android/api/messages/MessagesDenyFromGroup;

    invoke-direct {v0, p1}, Lcom/vkontakte/android/api/messages/MessagesDenyFromGroup;-><init>(I)V

    invoke-virtual {v0, p2}, Lcom/vkontakte/android/api/messages/MessagesDenyFromGroup;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 56
    return-void
.end method

.method static synthetic lambda$clearHistory$0(ILandroid/content/Context;Lcom/vkontakte/android/functions/VoidF2;Ljava/lang/Object;Landroid/content/DialogInterface;I)V
    .locals 2
    .param p0, "uid"    # I
    .param p1, "ctx"    # Landroid/content/Context;
    .param p2, "f"    # Lcom/vkontakte/android/functions/VoidF2;
    .param p3, "object"    # Ljava/lang/Object;
    .param p4, "dialog"    # Landroid/content/DialogInterface;
    .param p5, "which"    # I

    .prologue
    .line 25
    new-instance v0, Lcom/vkontakte/android/api/messages/MessagesDeleteDialog;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/api/messages/MessagesDeleteDialog;-><init>(I)V

    new-instance v1, Lcom/vkontakte/android/utils/ApiMethodsHelper$1;

    invoke-direct {v1, p1, p2, p0, p3}, Lcom/vkontakte/android/utils/ApiMethodsHelper$1;-><init>(Landroid/content/Context;Lcom/vkontakte/android/functions/VoidF2;ILjava/lang/Object;)V

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/messages/MessagesDeleteDialog;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 30
    invoke-virtual {v0, p1}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 31
    return-void
.end method

.method static synthetic lambda$removeUserFromChat$1(IILandroid/content/Context;Lcom/vkontakte/android/functions/VoidF1;Landroid/content/DialogInterface;I)V
    .locals 2
    .param p0, "chatId"    # I
    .param p1, "uid"    # I
    .param p2, "ctx"    # Landroid/content/Context;
    .param p3, "f"    # Lcom/vkontakte/android/functions/VoidF1;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p4, "dialog"    # Landroid/content/DialogInterface;
    .param p5, "which"    # I

    .prologue
    .line 42
    new-instance v0, Lcom/vkontakte/android/api/messages/MessagesRemoveChatUser;

    invoke-direct {v0, p0, p1}, Lcom/vkontakte/android/api/messages/MessagesRemoveChatUser;-><init>(II)V

    new-instance v1, Lcom/vkontakte/android/utils/ApiMethodsHelper$2;

    invoke-direct {v1, p2, p3, p1}, Lcom/vkontakte/android/utils/ApiMethodsHelper$2;-><init>(Landroid/content/Context;Lcom/vkontakte/android/functions/VoidF1;I)V

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/messages/MessagesRemoveChatUser;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 49
    invoke-virtual {v0, p2}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    invoke-virtual {v0, p2}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 50
    return-void
.end method

.method public static removeUserFromChat(Landroid/content/Context;IILcom/vkontakte/android/functions/VoidF1;)V
    .locals 3
    .param p0, "ctx"    # Landroid/content/Context;
    .param p1, "chatId"    # I
    .param p2, "uid"    # I
    .param p3    # Lcom/vkontakte/android/functions/VoidF1;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "II",
            "Lcom/vkontakte/android/functions/VoidF1",
            "<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 39
    .local p3, "f":Lcom/vkontakte/android/functions/VoidF1;, "Lcom/vkontakte/android/functions/VoidF1<Ljava/lang/Integer;>;"
    new-instance v0, Lcom/vkontakte/android/VKAlertDialog$Builder;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/VKAlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x7f080176

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 40
    invoke-static {p2}, Lcom/vkontakte/android/auth/VKAccountManager;->isCurrentUser(I)Z

    move-result v0

    if-eqz v0, :cond_0

    const v0, 0x7f080130

    :goto_0
    invoke-virtual {v1, v0}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f080798

    invoke-static {p1, p2, p0, p3}, Lcom/vkontakte/android/utils/ApiMethodsHelper$$Lambda$2;->lambdaFactory$(IILandroid/content/Context;Lcom/vkontakte/android/functions/VoidF1;)Landroid/content/DialogInterface$OnClickListener;

    move-result-object v2

    .line 41
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f080433

    const/4 v2, 0x0

    .line 51
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 52
    return-void

    .line 40
    :cond_0
    const v0, 0x7f0801a2

    goto :goto_0
.end method
