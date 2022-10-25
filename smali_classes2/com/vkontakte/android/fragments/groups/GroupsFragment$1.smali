.class Lcom/vkontakte/android/fragments/groups/GroupsFragment$1;
.super Landroid/content/BroadcastReceiver;
.source "GroupsFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/groups/GroupsFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/groups/GroupsFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/groups/GroupsFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/groups/GroupsFragment;

    .prologue
    .line 57
    iput-object p1, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment$1;->this$0:Lcom/vkontakte/android/fragments/groups/GroupsFragment;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 60
    iget-object v0, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment$1;->this$0:Lcom/vkontakte/android/fragments/groups/GroupsFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->isAdded()Z

    move-result v0

    if-nez v0, :cond_1

    .line 80
    :cond_0
    :goto_0
    return-void

    .line 63
    :cond_1
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v3

    const/4 v0, -0x1

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v4

    sparse-switch v4, :sswitch_data_0

    :cond_2
    :goto_1
    packed-switch v0, :pswitch_data_0

    goto :goto_0

    .line 65
    :pswitch_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment$1;->this$0:Lcom/vkontakte/android/fragments/groups/GroupsFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->doLoadData()V

    goto :goto_0

    .line 63
    :sswitch_0
    const-string/jumbo v4, "com.vkontakte.android.GROUP_LIST_CHANGED"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    move v0, v1

    goto :goto_1

    :sswitch_1
    const-string/jumbo v4, "com.vkontakte.android.GROUP_INVITES_CHANGED"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    move v0, v2

    goto :goto_1

    .line 69
    :pswitch_1
    iget-object v0, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment$1;->this$0:Lcom/vkontakte/android/fragments/groups/GroupsFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->access$000(Lcom/vkontakte/android/fragments/groups/GroupsFragment;)I

    move-result v0

    invoke-static {}, Lcom/vkontakte/android/LongPollService;->getNumGroupInvitations()I

    move-result v3

    if-eq v0, v3, :cond_0

    .line 70
    iget-object v0, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment$1;->this$0:Lcom/vkontakte/android/fragments/groups/GroupsFragment;

    invoke-static {}, Lcom/vkontakte/android/LongPollService;->getNumGroupInvitations()I

    move-result v3

    invoke-static {v0, v3}, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->access$002(Lcom/vkontakte/android/fragments/groups/GroupsFragment;I)I

    .line 72
    iget-object v0, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment$1;->this$0:Lcom/vkontakte/android/fragments/groups/GroupsFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->getPagerCurrentItem()I

    move-result v0

    const/4 v3, 0x2

    if-ne v0, v3, :cond_3

    iget-object v0, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment$1;->this$0:Lcom/vkontakte/android/fragments/groups/GroupsFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->access$000(Lcom/vkontakte/android/fragments/groups/GroupsFragment;)I

    move-result v0

    if-nez v0, :cond_3

    .line 73
    iget-object v0, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment$1;->this$0:Lcom/vkontakte/android/fragments/groups/GroupsFragment;

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->setPagerCurrentItem(IZ)V

    .line 75
    :cond_3
    iget-object v0, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment$1;->this$0:Lcom/vkontakte/android/fragments/groups/GroupsFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->access$100(Lcom/vkontakte/android/fragments/groups/GroupsFragment;)V

    goto :goto_0

    .line 63
    :sswitch_data_0
    .sparse-switch
        -0x6eed6cc0 -> :sswitch_1
        0x30a54e12 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
