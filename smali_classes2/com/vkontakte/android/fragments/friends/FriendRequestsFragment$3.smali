.class Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment$3;
.super Lcom/vkontakte/android/api/SimpleCallback;
.source "FriendRequestsFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;->lambda$onOptionsItemSelected$0(Landroid/app/Activity;Landroid/content/DialogInterface;I)V
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
.field final synthetic this$0:Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;

.field final synthetic val$activity:Landroid/app/Activity;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;Landroid/app/Activity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;

    .prologue
    .line 154
    iput-object p1, p0, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment$3;->this$0:Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;

    iput-object p2, p0, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment$3;->val$activity:Landroid/app/Activity;

    invoke-direct {p0}, Lcom/vkontakte/android/api/SimpleCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public success(Ljava/lang/Boolean;)V
    .locals 1
    .param p1, "result"    # Ljava/lang/Boolean;

    .prologue
    .line 157
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment$3;->this$0:Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;->isResumed()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 158
    invoke-static {}, Lcom/vkontakte/android/LongPollService;->updateCounters()V

    .line 159
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment$3;->val$activity:Landroid/app/Activity;

    if-eqz v0, :cond_0

    .line 160
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment$3;->val$activity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    .line 163
    :cond_0
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 154
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment$3;->success(Ljava/lang/Boolean;)V

    return-void
.end method
