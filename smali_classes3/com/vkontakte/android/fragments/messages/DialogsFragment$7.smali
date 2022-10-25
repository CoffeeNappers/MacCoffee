.class Lcom/vkontakte/android/fragments/messages/DialogsFragment$7;
.super Lcom/vkontakte/android/api/SimpleCallback;
.source "DialogsFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/messages/DialogsFragment;->allowMessages(Lcom/vkontakte/android/DialogEntry;)V
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
.field final synthetic this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

.field final synthetic val$e:Lcom/vkontakte/android/DialogEntry;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/messages/DialogsFragment;Lcom/vkontakte/android/DialogEntry;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    .prologue
    .line 901
    iput-object p1, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$7;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    iput-object p2, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$7;->val$e:Lcom/vkontakte/android/DialogEntry;

    invoke-direct {p0}, Lcom/vkontakte/android/api/SimpleCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public success(Ljava/lang/Boolean;)V
    .locals 3
    .param p1, "result"    # Ljava/lang/Boolean;

    .prologue
    .line 904
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v1, "com.vkontakte.android.COMMUNITY_MESSAGES_BLOCK_CHANGED"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 905
    .local v0, "intent":Landroid/content/Intent;
    const-string/jumbo v1, "is_messages_blocked"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 906
    const-string/jumbo v1, "id"

    iget-object v2, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$7;->val$e:Lcom/vkontakte/android/DialogEntry;

    iget-object v2, v2, Lcom/vkontakte/android/DialogEntry;->lastMessage:Lcom/vkontakte/android/Message;

    iget v2, v2, Lcom/vkontakte/android/Message;->peer:I

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 907
    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$7;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    const-string/jumbo v2, "com.vkontakte.android.permission.ACCESS_DATA"

    invoke-virtual {v1, v0, v2}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 908
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 901
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/messages/DialogsFragment$7;->success(Ljava/lang/Boolean;)V

    return-void
.end method
