.class Lcom/vkontakte/android/fragments/groups/AdminedGroupsFragment$1;
.super Landroid/content/BroadcastReceiver;
.source "AdminedGroupsFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/groups/AdminedGroupsFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/groups/AdminedGroupsFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/groups/AdminedGroupsFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/groups/AdminedGroupsFragment;

    .prologue
    .line 50
    iput-object p1, p0, Lcom/vkontakte/android/fragments/groups/AdminedGroupsFragment$1;->this$0:Lcom/vkontakte/android/fragments/groups/AdminedGroupsFragment;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 53
    iget-object v0, p0, Lcom/vkontakte/android/fragments/groups/AdminedGroupsFragment$1;->this$0:Lcom/vkontakte/android/fragments/groups/AdminedGroupsFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/groups/AdminedGroupsFragment;->isAdded()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "com.vkontakte.android.GROUP_LIST_CHANGED"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 54
    iget-object v0, p0, Lcom/vkontakte/android/fragments/groups/AdminedGroupsFragment$1;->this$0:Lcom/vkontakte/android/fragments/groups/AdminedGroupsFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/groups/AdminedGroupsFragment;->access$000(Lcom/vkontakte/android/fragments/groups/AdminedGroupsFragment;)V

    .line 56
    :cond_0
    return-void
.end method
