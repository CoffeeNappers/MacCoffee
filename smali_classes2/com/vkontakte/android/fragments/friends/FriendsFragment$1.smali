.class Lcom/vkontakte/android/fragments/friends/FriendsFragment$1;
.super Landroid/content/BroadcastReceiver;
.source "FriendsFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/friends/FriendsFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/friends/FriendsFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/friends/FriendsFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    .prologue
    .line 147
    iput-object p1, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$1;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 10
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v7, 0x1

    const/4 v5, 0x0

    const/4 v8, 0x2

    const/4 v6, -0x1

    .line 150
    iget-object v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$1;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    invoke-virtual {v4}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->isAdded()Z

    move-result v4

    if-nez v4, :cond_1

    .line 216
    :cond_0
    :goto_0
    return-void

    .line 153
    :cond_1
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->hashCode()I

    move-result v9

    sparse-switch v9, :sswitch_data_0

    :cond_2
    move v4, v6

    :goto_1
    packed-switch v4, :pswitch_data_0

    goto :goto_0

    .line 155
    :pswitch_0
    iget-object v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$1;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->access$000(Lcom/vkontakte/android/fragments/friends/FriendsFragment;)I

    move-result v4

    if-eqz v4, :cond_3

    iget-object v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$1;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->access$000(Lcom/vkontakte/android/fragments/friends/FriendsFragment;)I

    move-result v4

    invoke-static {v4}, Lcom/vkontakte/android/auth/VKAccountManager;->isCurrentUser(I)Z

    move-result v4

    if-eqz v4, :cond_4

    :cond_3
    iget-object v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$1;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->access$100(Lcom/vkontakte/android/fragments/friends/FriendsFragment;)Z

    move-result v4

    if-nez v4, :cond_4

    .line 156
    iget-object v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$1;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    invoke-static {v4, v5}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->access$202(Lcom/vkontakte/android/fragments/friends/FriendsFragment;Z)Z

    .line 157
    iget-object v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$1;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    invoke-static {v4, v7}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->access$302(Lcom/vkontakte/android/fragments/friends/FriendsFragment;Z)Z

    .line 158
    iget-object v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$1;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->access$400(Lcom/vkontakte/android/fragments/friends/FriendsFragment;)Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/ArrayList;->clear()V

    .line 159
    iget-object v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$1;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->access$400(Lcom/vkontakte/android/fragments/friends/FriendsFragment;)Ljava/util/ArrayList;

    move-result-object v4

    invoke-static {v4}, Lcom/vkontakte/android/data/Friends;->getFriends(Ljava/util/ArrayList;)V

    .line 160
    iget-object v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$1;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    new-instance v6, Ljava/util/ArrayList;

    iget-object v7, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$1;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    invoke-static {v7}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->access$400(Lcom/vkontakte/android/fragments/friends/FriendsFragment;)Ljava/util/ArrayList;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-static {v4, v6, v5}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->access$500(Lcom/vkontakte/android/fragments/friends/FriendsFragment;Ljava/util/List;Z)V

    .line 161
    iget-object v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$1;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->access$600(Lcom/vkontakte/android/fragments/friends/FriendsFragment;)V

    goto :goto_0

    .line 153
    :sswitch_0
    const-string/jumbo v9, "com.vkontakte.android.FRIEND_LIST_CHANGED"

    invoke-virtual {v4, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    move v4, v5

    goto :goto_1

    :sswitch_1
    const-string/jumbo v9, "com.vkontakte.android.FRIEND_COUNTER_CHANGED"

    invoke-virtual {v4, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    move v4, v7

    goto :goto_1

    :sswitch_2
    const-string/jumbo v9, "com.vkontakte.android.FRIEND_REQUESTS_CHANGED"

    invoke-virtual {v4, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    move v4, v8

    goto :goto_1

    :sswitch_3
    const-string/jumbo v9, "com.vkontakte.android.REQUESTS_UPDATED"

    invoke-virtual {v4, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    const/4 v4, 0x3

    goto :goto_1

    .line 163
    :cond_4
    iget-object v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$1;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    iget-object v5, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$1;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    invoke-static {v5}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->access$700(Lcom/vkontakte/android/fragments/friends/FriendsFragment;)I

    move-result v5

    invoke-virtual {v4, v5}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->onSpinnerItemSelected(I)Z

    goto/16 :goto_0

    .line 167
    :pswitch_1
    const-string/jumbo v4, "value"

    invoke-virtual {p2, v4, v5}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v3

    .line 168
    .local v3, "value":I
    const-string/jumbo v4, "type"

    invoke-virtual {p2, v4}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/data/Friends$Request;

    .line 169
    .local v2, "type":Lcom/vkontakte/android/data/Friends$Request;
    iget-object v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$1;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->access$800(Lcom/vkontakte/android/fragments/friends/FriendsFragment;)I

    move-result v4

    if-ne v4, v8, :cond_0

    .line 170
    sget-object v4, Lcom/vkontakte/android/fragments/friends/FriendsFragment$5;->$SwitchMap$com$vkontakte$android$data$Friends$Request:[I

    invoke-virtual {v2}, Lcom/vkontakte/android/data/Friends$Request;->ordinal()I

    move-result v5

    aget v4, v4, v5

    packed-switch v4, :pswitch_data_1

    goto/16 :goto_0

    .line 172
    :pswitch_2
    iget-object v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$1;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->access$900(Lcom/vkontakte/android/fragments/friends/FriendsFragment;)I

    move-result v4

    if-eq v4, v3, :cond_0

    .line 173
    iget-object v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$1;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    invoke-static {v4, v3}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->access$902(Lcom/vkontakte/android/fragments/friends/FriendsFragment;I)I

    .line 174
    iget-object v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$1;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    invoke-static {v4, v8}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->access$1000(Lcom/vkontakte/android/fragments/friends/FriendsFragment;I)V

    goto/16 :goto_0

    .line 178
    :pswitch_3
    iget-object v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$1;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->access$1100(Lcom/vkontakte/android/fragments/friends/FriendsFragment;)I

    move-result v4

    if-eq v4, v3, :cond_0

    .line 179
    iget-object v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$1;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    invoke-static {v4, v3}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->access$1102(Lcom/vkontakte/android/fragments/friends/FriendsFragment;I)I

    .line 180
    iget-object v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$1;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    invoke-static {v4, v8}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->access$1000(Lcom/vkontakte/android/fragments/friends/FriendsFragment;I)V

    goto/16 :goto_0

    .line 184
    :pswitch_4
    iget-object v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$1;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->access$1200(Lcom/vkontakte/android/fragments/friends/FriendsFragment;)I

    move-result v4

    if-eq v4, v3, :cond_0

    .line 185
    iget-object v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$1;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    invoke-static {v4, v3}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->access$1202(Lcom/vkontakte/android/fragments/friends/FriendsFragment;I)I

    .line 186
    iget-object v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$1;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    invoke-static {v4, v8}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->access$1000(Lcom/vkontakte/android/fragments/friends/FriendsFragment;I)V

    goto/16 :goto_0

    .line 193
    .end local v2    # "type":Lcom/vkontakte/android/data/Friends$Request;
    .end local v3    # "value":I
    :pswitch_5
    iget-object v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$1;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->access$1300(Lcom/vkontakte/android/fragments/friends/FriendsFragment;)Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    move-result-object v4

    invoke-virtual {v4}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->isAdded()Z

    move-result v4

    if-eqz v4, :cond_0

    iget-object v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$1;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->access$1400(Lcom/vkontakte/android/fragments/friends/FriendsFragment;)Z

    move-result v4

    if-nez v4, :cond_0

    iget-object v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$1;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->access$1500(Lcom/vkontakte/android/fragments/friends/FriendsFragment;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 194
    iget-object v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$1;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->access$1600(Lcom/vkontakte/android/fragments/friends/FriendsFragment;)Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->clear()V

    .line 195
    iget-object v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$1;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->access$1700(Lcom/vkontakte/android/fragments/friends/FriendsFragment;)Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->clear()V

    .line 196
    invoke-static {v7}, Lcom/vkontakte/android/data/Friends;->reload(Z)V

    goto/16 :goto_0

    .line 200
    :pswitch_6
    iget-object v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$1;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->access$1400(Lcom/vkontakte/android/fragments/friends/FriendsFragment;)Z

    move-result v4

    if-nez v4, :cond_0

    iget-object v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$1;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->access$1500(Lcom/vkontakte/android/fragments/friends/FriendsFragment;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 201
    iget-object v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$1;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->access$1600(Lcom/vkontakte/android/fragments/friends/FriendsFragment;)Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->clear()V

    .line 202
    iget-object v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$1;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->access$1700(Lcom/vkontakte/android/fragments/friends/FriendsFragment;)Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->clear()V

    .line 203
    iget-object v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$1;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->access$1600(Lcom/vkontakte/android/fragments/friends/FriendsFragment;)Ljava/util/List;

    move-result-object v4

    const-string/jumbo v5, "in"

    invoke-virtual {p2, v5}, Landroid/content/Intent;->getParcelableArrayListExtra(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 204
    iget-object v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$1;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->access$1700(Lcom/vkontakte/android/fragments/friends/FriendsFragment;)Ljava/util/List;

    move-result-object v4

    const-string/jumbo v5, "suggest"

    invoke-virtual {p2, v5}, Landroid/content/Intent;->getParcelableArrayListExtra(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 205
    const-string/jumbo v4, "count_in"

    invoke-virtual {p2, v4, v6}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    .line 206
    .local v0, "newIn":I
    const-string/jumbo v4, "count_suggest"

    invoke-virtual {p2, v4, v6}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    .line 207
    .local v1, "newSuggest":I
    if-eq v0, v6, :cond_5

    .line 208
    iget-object v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$1;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    invoke-static {v4, v0}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->access$902(Lcom/vkontakte/android/fragments/friends/FriendsFragment;I)I

    .line 210
    :cond_5
    if-eq v1, v6, :cond_0

    .line 211
    iget-object v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$1;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    invoke-static {v4, v1}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->access$1202(Lcom/vkontakte/android/fragments/friends/FriendsFragment;I)I

    goto/16 :goto_0

    .line 153
    :sswitch_data_0
    .sparse-switch
        -0x66d52c6b -> :sswitch_0
        -0x7920ce1 -> :sswitch_3
        0x247753bb -> :sswitch_2
        0x45888c4f -> :sswitch_1
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_5
        :pswitch_6
    .end packed-switch

    .line 170
    :pswitch_data_1
    .packed-switch 0x1
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method
