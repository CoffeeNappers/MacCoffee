.class final Lcom/vkontakte/android/data/Messages$9;
.super Ljava/lang/Object;
.source "Messages.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/data/Messages;->uploadDone(ILcom/vkontakte/android/attachments/Attachment;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
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
.field final synthetic val$m:Lcom/vkontakte/android/Message;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/Message;)V
    .locals 0

    .prologue
    .line 957
    iput-object p1, p0, Lcom/vkontakte/android/data/Messages$9;->val$m:Lcom/vkontakte/android/Message;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 5
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    const/4 v4, 0x1

    .line 973
    iget-object v1, p0, Lcom/vkontakte/android/data/Messages$9;->val$m:Lcom/vkontakte/android/Message;

    invoke-static {v1}, Lcom/vkontakte/android/data/Messages;->access$100(Lcom/vkontakte/android/Message;)V

    .line 974
    iget-object v1, p0, Lcom/vkontakte/android/data/Messages$9;->val$m:Lcom/vkontakte/android/Message;

    iput-boolean v4, v1, Lcom/vkontakte/android/Message;->sendFailed:Z

    .line 975
    iget-object v1, p0, Lcom/vkontakte/android/data/Messages$9;->val$m:Lcom/vkontakte/android/Message;

    const/4 v2, 0x0

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v3

    invoke-virtual {v3}, Lcom/vkontakte/android/auth/VKAccount;->getPhoto()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/vkontakte/android/data/Messages;->add(Lcom/vkontakte/android/Message;Lcom/vkontakte/android/UserProfile;Ljava/lang/String;)V

    .line 976
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v1, "com.vkontakte.android.MESSAGE_SEND_FAILED"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 977
    .local v0, "intent":Landroid/content/Intent;
    const-string/jumbo v1, "id"

    iget-object v2, p0, Lcom/vkontakte/android/data/Messages$9;->val$m:Lcom/vkontakte/android/Message;

    iget v2, v2, Lcom/vkontakte/android/Message;->id:I

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 978
    invoke-virtual {p1}, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->getCodeValue()I

    move-result v1

    const/4 v2, 0x7

    if-ne v1, v2, :cond_0

    .line 979
    const-string/jumbo v1, "privacy"

    invoke-virtual {v0, v1, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 981
    :cond_0
    sget-object v1, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const-string/jumbo v2, "com.vkontakte.android.permission.ACCESS_DATA"

    invoke-virtual {v1, v0, v2}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 982
    sget-object v1, Lcom/vkontakte/android/data/Messages;->sendLock:Lcom/vkontakte/android/background/CountingLock;

    invoke-virtual {v1}, Lcom/vkontakte/android/background/CountingLock;->decrement()V

    .line 983
    return-void
.end method

.method public success(Ljava/lang/Integer;)V
    .locals 4
    .param p1, "mid"    # Ljava/lang/Integer;

    .prologue
    .line 960
    iget-object v1, p0, Lcom/vkontakte/android/data/Messages$9;->val$m:Lcom/vkontakte/android/Message;

    iget v1, v1, Lcom/vkontakte/android/Message;->id:I

    iget-object v2, p0, Lcom/vkontakte/android/data/Messages$9;->val$m:Lcom/vkontakte/android/Message;

    iget v2, v2, Lcom/vkontakte/android/Message;->peer:I

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-static {v1, v2, v3}, Lcom/vkontakte/android/cache/Cache;->setMessageID(III)V

    .line 961
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v1, "com.vkontakte.android.MESSAGE_ID_CHANGED"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 962
    .local v0, "intent":Landroid/content/Intent;
    const-string/jumbo v1, "oldID"

    iget-object v2, p0, Lcom/vkontakte/android/data/Messages$9;->val$m:Lcom/vkontakte/android/Message;

    iget v2, v2, Lcom/vkontakte/android/Message;->id:I

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 963
    const-string/jumbo v1, "newID"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 964
    sget-object v1, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const-string/jumbo v2, "com.vkontakte.android.permission.ACCESS_DATA"

    invoke-virtual {v1, v0, v2}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 965
    iget-object v1, p0, Lcom/vkontakte/android/data/Messages$9;->val$m:Lcom/vkontakte/android/Message;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v2

    iput v2, v1, Lcom/vkontakte/android/Message;->id:I

    .line 966
    iget-object v1, p0, Lcom/vkontakte/android/data/Messages$9;->val$m:Lcom/vkontakte/android/Message;

    invoke-static {v1}, Lcom/vkontakte/android/data/Messages;->access$100(Lcom/vkontakte/android/Message;)V

    .line 967
    iget-object v1, p0, Lcom/vkontakte/android/data/Messages$9;->val$m:Lcom/vkontakte/android/Message;

    invoke-static {v1}, Lcom/vkontakte/android/data/Messages;->access$200(Lcom/vkontakte/android/Message;)V

    .line 968
    sget-object v1, Lcom/vkontakte/android/data/Messages;->sendLock:Lcom/vkontakte/android/background/CountingLock;

    invoke-virtual {v1}, Lcom/vkontakte/android/background/CountingLock;->decrement()V

    .line 969
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 957
    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/data/Messages$9;->success(Ljava/lang/Integer;)V

    return-void
.end method
