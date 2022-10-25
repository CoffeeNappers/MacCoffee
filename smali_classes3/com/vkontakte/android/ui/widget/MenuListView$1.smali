.class Lcom/vkontakte/android/ui/widget/MenuListView$1;
.super Landroid/content/BroadcastReceiver;
.source "MenuListView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/ui/widget/MenuListView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/ui/widget/MenuListView;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/ui/widget/MenuListView;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/ui/widget/MenuListView;

    .prologue
    .line 135
    iput-object p1, p0, Lcom/vkontakte/android/ui/widget/MenuListView$1;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 9
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v5, 0x0

    const/4 v6, 0x5

    .line 138
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v7

    const/4 v4, -0x1

    invoke-virtual {v7}, Ljava/lang/String;->hashCode()I

    move-result v8

    sparse-switch v8, :sswitch_data_0

    :cond_0
    :goto_0
    packed-switch v4, :pswitch_data_0

    .line 198
    :cond_1
    :goto_1
    return-void

    .line 138
    :sswitch_0
    const-string/jumbo v8, "com.vkontakte.android.FRIEND_LIST_CHANGED"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    move v4, v5

    goto :goto_0

    :sswitch_1
    const-string/jumbo v8, "com.vkontakte.android.GROUP_LIST_CHANGED"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    const/4 v4, 0x1

    goto :goto_0

    :sswitch_2
    const-string/jumbo v8, "com.vkontakte.android.USER_PRESENCE"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    const/4 v4, 0x2

    goto :goto_0

    :sswitch_3
    const-string/jumbo v8, "com.vkontakte.android.GROUPS_UPDATED"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    const/4 v4, 0x3

    goto :goto_0

    :sswitch_4
    const-string/jumbo v8, "com.vkontakte.android.USER_PHOTO_CHANGED"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    const/4 v4, 0x4

    goto :goto_0

    :sswitch_5
    const-string/jumbo v8, "com.vkontakte.android.USER_NAME_CHANGED"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    move v4, v6

    goto :goto_0

    :sswitch_6
    const-string/jumbo v8, "com.vkontakte.android.COUNTERS_UPDATED"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    const/4 v4, 0x6

    goto :goto_0

    :sswitch_7
    const-string/jumbo v8, "com.vkontakte.android.FRIEND_REQUESTS_CHANGED"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    const/4 v4, 0x7

    goto :goto_0

    .line 141
    :pswitch_0
    iget-object v4, p0, Lcom/vkontakte/android/ui/widget/MenuListView$1;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v4}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$000(Lcom/vkontakte/android/ui/widget/MenuListView;)Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/ArrayList;->clear()V

    .line 142
    iget-object v4, p0, Lcom/vkontakte/android/ui/widget/MenuListView$1;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v4}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$000(Lcom/vkontakte/android/ui/widget/MenuListView;)Ljava/util/ArrayList;

    move-result-object v4

    invoke-static {v4}, Lcom/vkontakte/android/data/Friends;->getFriends(Ljava/util/ArrayList;)V

    .line 143
    iget-object v4, p0, Lcom/vkontakte/android/ui/widget/MenuListView$1;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v4}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$000(Lcom/vkontakte/android/ui/widget/MenuListView;)Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-le v4, v6, :cond_2

    .line 144
    iget-object v4, p0, Lcom/vkontakte/android/ui/widget/MenuListView$1;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v4}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$000(Lcom/vkontakte/android/ui/widget/MenuListView;)Ljava/util/ArrayList;

    move-result-object v4

    iget-object v5, p0, Lcom/vkontakte/android/ui/widget/MenuListView$1;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v5}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$000(Lcom/vkontakte/android/ui/widget/MenuListView;)Ljava/util/ArrayList;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    invoke-virtual {v4, v6, v5}, Ljava/util/ArrayList;->subList(II)Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->clear()V

    .line 146
    :cond_2
    iget-object v4, p0, Lcom/vkontakte/android/ui/widget/MenuListView$1;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-virtual {v4}, Lcom/vkontakte/android/ui/widget/MenuListView;->updateList()V

    goto/16 :goto_1

    .line 150
    :pswitch_1
    iget-object v4, p0, Lcom/vkontakte/android/ui/widget/MenuListView$1;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v4}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$100(Lcom/vkontakte/android/ui/widget/MenuListView;)Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/ArrayList;->clear()V

    .line 151
    iget-object v4, p0, Lcom/vkontakte/android/ui/widget/MenuListView$1;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v4}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$100(Lcom/vkontakte/android/ui/widget/MenuListView;)Ljava/util/ArrayList;

    move-result-object v4

    invoke-static {v4}, Lcom/vkontakte/android/data/Groups;->getGroups(Ljava/util/ArrayList;)V

    .line 152
    iget-object v4, p0, Lcom/vkontakte/android/ui/widget/MenuListView$1;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v4}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$100(Lcom/vkontakte/android/ui/widget/MenuListView;)Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-le v4, v6, :cond_3

    .line 153
    iget-object v4, p0, Lcom/vkontakte/android/ui/widget/MenuListView$1;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v4}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$100(Lcom/vkontakte/android/ui/widget/MenuListView;)Ljava/util/ArrayList;

    move-result-object v4

    iget-object v5, p0, Lcom/vkontakte/android/ui/widget/MenuListView$1;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v5}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$100(Lcom/vkontakte/android/ui/widget/MenuListView;)Ljava/util/ArrayList;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    invoke-virtual {v4, v6, v5}, Ljava/util/ArrayList;->subList(II)Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->clear()V

    .line 155
    :cond_3
    iget-object v4, p0, Lcom/vkontakte/android/ui/widget/MenuListView$1;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-virtual {v4}, Lcom/vkontakte/android/ui/widget/MenuListView;->updateList()V

    goto/16 :goto_1

    .line 159
    :pswitch_2
    const-string/jumbo v4, "uid"

    invoke-virtual {p2, v4, v5}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v3

    .line 160
    .local v3, "uid":I
    const/4 v1, 0x0

    .local v1, "i":I
    iget-object v4, p0, Lcom/vkontakte/android/ui/widget/MenuListView$1;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v4}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$000(Lcom/vkontakte/android/ui/widget/MenuListView;)Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v0

    .local v0, "friendsSize":I
    :goto_2
    if-ge v1, v0, :cond_1

    .line 161
    iget-object v4, p0, Lcom/vkontakte/android/ui/widget/MenuListView$1;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v4}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$000(Lcom/vkontakte/android/ui/widget/MenuListView;)Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/UserProfile;

    .line 162
    .local v2, "p":Lcom/vkontakte/android/UserProfile;
    iget v4, v2, Lcom/vkontakte/android/UserProfile;->uid:I

    if-ne v4, v3, :cond_4

    .line 163
    const-string/jumbo v4, "online"

    invoke-virtual {p2, v4, v5}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v4

    iput v4, v2, Lcom/vkontakte/android/UserProfile;->online:I

    .line 164
    iget-object v4, p0, Lcom/vkontakte/android/ui/widget/MenuListView$1;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-virtual {v4}, Lcom/vkontakte/android/ui/widget/MenuListView;->updateList()V

    .line 160
    :cond_4
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 170
    .end local v0    # "friendsSize":I
    .end local v1    # "i":I
    .end local v2    # "p":Lcom/vkontakte/android/UserProfile;
    .end local v3    # "uid":I
    :pswitch_3
    iget-object v4, p0, Lcom/vkontakte/android/ui/widget/MenuListView$1;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v4}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$100(Lcom/vkontakte/android/ui/widget/MenuListView;)Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/ArrayList;->clear()V

    .line 171
    iget-object v4, p0, Lcom/vkontakte/android/ui/widget/MenuListView$1;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v4}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$100(Lcom/vkontakte/android/ui/widget/MenuListView;)Ljava/util/ArrayList;

    move-result-object v4

    invoke-static {v4}, Lcom/vkontakte/android/data/Groups;->getGroups(Ljava/util/ArrayList;)V

    .line 172
    iget-object v4, p0, Lcom/vkontakte/android/ui/widget/MenuListView$1;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v4}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$100(Lcom/vkontakte/android/ui/widget/MenuListView;)Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-le v4, v6, :cond_5

    .line 173
    iget-object v4, p0, Lcom/vkontakte/android/ui/widget/MenuListView$1;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v4}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$100(Lcom/vkontakte/android/ui/widget/MenuListView;)Ljava/util/ArrayList;

    move-result-object v4

    iget-object v5, p0, Lcom/vkontakte/android/ui/widget/MenuListView$1;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v5}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$100(Lcom/vkontakte/android/ui/widget/MenuListView;)Ljava/util/ArrayList;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    invoke-virtual {v4, v6, v5}, Ljava/util/ArrayList;->subList(II)Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->clear()V

    .line 175
    :cond_5
    iget-object v4, p0, Lcom/vkontakte/android/ui/widget/MenuListView$1;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-virtual {v4}, Lcom/vkontakte/android/ui/widget/MenuListView;->updateList()V

    goto/16 :goto_1

    .line 179
    :pswitch_4
    const-string/jumbo v4, "id"

    invoke-virtual {p2, v4, v5}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v4

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v5

    invoke-virtual {v5}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v5

    if-ne v4, v5, :cond_1

    .line 180
    iget-object v4, p0, Lcom/vkontakte/android/ui/widget/MenuListView$1;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    const-string/jumbo v5, "photo"

    invoke-virtual {p2, v5}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$202(Lcom/vkontakte/android/ui/widget/MenuListView;Ljava/lang/String;)Ljava/lang/String;

    .line 181
    iget-object v4, p0, Lcom/vkontakte/android/ui/widget/MenuListView$1;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-virtual {v4}, Lcom/vkontakte/android/ui/widget/MenuListView;->updateList()V

    goto/16 :goto_1

    .line 186
    :pswitch_5
    iget-object v4, p0, Lcom/vkontakte/android/ui/widget/MenuListView$1;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    const-string/jumbo v5, "name"

    invoke-virtual {p2, v5}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$302(Lcom/vkontakte/android/ui/widget/MenuListView;Ljava/lang/String;)Ljava/lang/String;

    .line 187
    iget-object v4, p0, Lcom/vkontakte/android/ui/widget/MenuListView$1;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-virtual {v4}, Lcom/vkontakte/android/ui/widget/MenuListView;->updateList()V

    goto/16 :goto_1

    .line 192
    :pswitch_6
    const-string/jumbo v4, "out"

    invoke-virtual {p2, v4, v5}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v4

    if-nez v4, :cond_1

    .line 193
    iget-object v4, p0, Lcom/vkontakte/android/ui/widget/MenuListView$1;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-virtual {v4}, Lcom/vkontakte/android/ui/widget/MenuListView;->updateList()V

    goto/16 :goto_1

    .line 138
    :sswitch_data_0
    .sparse-switch
        -0x7a1c0cb0 -> :sswitch_2
        -0x66d52c6b -> :sswitch_0
        -0x5455e5ae -> :sswitch_6
        -0xa4aab11 -> :sswitch_3
        0x13def032 -> :sswitch_4
        0x247753bb -> :sswitch_7
        0x248280b5 -> :sswitch_5
        0x30a54e12 -> :sswitch_1
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_6
    .end packed-switch
.end method
