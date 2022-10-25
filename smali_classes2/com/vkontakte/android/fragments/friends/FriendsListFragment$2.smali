.class Lcom/vkontakte/android/fragments/friends/FriendsListFragment$2;
.super Landroid/content/BroadcastReceiver;
.source "FriendsListFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/friends/FriendsListFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    .prologue
    .line 116
    .local p0, "this":Lcom/vkontakte/android/fragments/friends/FriendsListFragment$2;, "Lcom/vkontakte/android/fragments/friends/FriendsListFragment$2;"
    iput-object p1, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$2;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .local p0, "this":Lcom/vkontakte/android/fragments/friends/FriendsListFragment$2;, "Lcom/vkontakte/android/fragments/friends/FriendsListFragment$2;"
    const/4 v4, 0x0

    .line 119
    iget-object v2, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$2;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    invoke-virtual {v2}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->isAdded()Z

    move-result v2

    if-nez v2, :cond_1

    .line 130
    :cond_0
    :goto_0
    return-void

    .line 122
    :cond_1
    const-string/jumbo v2, "com.vkontakte.android.FRIEND_REQUESTS_CHANGED"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 123
    const-string/jumbo v2, "value"

    invoke-virtual {p2, v2, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    .line 124
    .local v1, "value":I
    const-string/jumbo v2, "decrease"

    invoke-virtual {p2, v2, v4}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    .line 125
    .local v0, "decrease":Z
    iget-object v2, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$2;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    invoke-virtual {v2, v1}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->setTotalRequests(I)V

    .line 126
    if-nez v0, :cond_0

    .line 127
    iget-object v2, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$2;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    invoke-static {v2, v4}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->access$000(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;Z)V

    goto :goto_0
.end method
