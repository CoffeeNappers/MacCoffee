.class Lcom/vkontakte/android/fragments/messages/ChatFragment$14;
.super Lcom/vkontakte/android/api/SimpleCallback;
.source "ChatFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/messages/ChatFragment;->onOptionsItemSelected(Landroid/view/MenuItem;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/SimpleCallback",
        "<",
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

.field final synthetic val$isBlocked:Z


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/messages/ChatFragment;Z)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/messages/ChatFragment;

    .prologue
    .line 1916
    iput-object p1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$14;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    iput-boolean p2, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$14;->val$isBlocked:Z

    invoke-direct {p0}, Lcom/vkontakte/android/api/SimpleCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public success(Ljava/lang/Boolean;)V
    .locals 3
    .param p1, "result"    # Ljava/lang/Boolean;

    .prologue
    .line 1918
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v1, "com.vkontakte.android.COMMUNITY_MESSAGES_BLOCK_CHANGED"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1919
    .local v0, "intent":Landroid/content/Intent;
    const-string/jumbo v2, "is_messages_blocked"

    iget-boolean v1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$14;->val$isBlocked:Z

    if-nez v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 1920
    const-string/jumbo v1, "id"

    iget-object v2, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$14;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$300(Lcom/vkontakte/android/fragments/messages/ChatFragment;)I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1921
    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$14;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    const-string/jumbo v2, "com.vkontakte.android.permission.ACCESS_DATA"

    invoke-virtual {v1, v0, v2}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 1922
    return-void

    .line 1919
    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 1916
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/messages/ChatFragment$14;->success(Ljava/lang/Boolean;)V

    return-void
.end method
