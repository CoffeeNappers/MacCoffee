.class Lcom/vkontakte/android/fragments/messages/DialogsFragment$1;
.super Landroid/content/BroadcastReceiver;
.source "DialogsFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/messages/DialogsFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/messages/DialogsFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    .prologue
    .line 92
    iput-object p1, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method synthetic lambda$null$0(Lcom/vkontakte/android/Message;Landroid/content/Intent;I)V
    .locals 3
    .param p1, "msg"    # Lcom/vkontakte/android/Message;
    .param p2, "intent"    # Landroid/content/Intent;
    .param p3, "unread"    # I

    .prologue
    .line 145
    new-instance v0, Lcom/vkontakte/android/DialogEntry;

    invoke-direct {v0}, Lcom/vkontakte/android/DialogEntry;-><init>()V

    .line 146
    .local v0, "e":Lcom/vkontakte/android/DialogEntry;
    iput-object p1, v0, Lcom/vkontakte/android/DialogEntry;->lastMessage:Lcom/vkontakte/android/Message;

    .line 147
    const-string/jumbo v1, "sender_photo"

    invoke-virtual {p2, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/vkontakte/android/DialogEntry;->lastMessagePhoto:Ljava/lang/String;

    .line 148
    const-string/jumbo v1, "peer_profile"

    invoke-virtual {p2, v1}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/UserProfile;

    iput-object v1, v0, Lcom/vkontakte/android/DialogEntry;->profile:Lcom/vkontakte/android/UserProfile;

    .line 149
    iput p3, v0, Lcom/vkontakte/android/DialogEntry;->unreadCount:I

    .line 150
    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->access$000(Lcom/vkontakte/android/fragments/messages/DialogsFragment;)Ljava/util/ArrayList;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2, v0}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 151
    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->access$200(Lcom/vkontakte/android/fragments/messages/DialogsFragment;)V

    .line 152
    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->access$100(Lcom/vkontakte/android/fragments/messages/DialogsFragment;)V

    .line 153
    return-void
.end method

.method synthetic lambda$null$1(Lcom/vkontakte/android/DialogEntry;)V
    .locals 2
    .param p1, "e"    # Lcom/vkontakte/android/DialogEntry;

    .prologue
    .line 168
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->access$000(Lcom/vkontakte/android/fragments/messages/DialogsFragment;)Ljava/util/ArrayList;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1, p1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 169
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->access$200(Lcom/vkontakte/android/fragments/messages/DialogsFragment;)V

    .line 170
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->access$100(Lcom/vkontakte/android/fragments/messages/DialogsFragment;)V

    .line 171
    return-void
.end method

.method synthetic lambda$null$2(ILcom/vkontakte/android/DialogEntry;ILjava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "peer1"    # I
    .param p2, "e"    # Lcom/vkontakte/android/DialogEntry;
    .param p3, "unread"    # I
    .param p4, "users"    # Ljava/util/ArrayList;
    .param p5, "title"    # Ljava/lang/String;
    .param p6, "photo"    # Ljava/lang/String;

    .prologue
    .line 160
    new-instance v0, Lcom/vkontakte/android/UserProfile;

    invoke-direct {v0}, Lcom/vkontakte/android/UserProfile;-><init>()V

    .line 161
    .local v0, "p":Lcom/vkontakte/android/UserProfile;
    iput p1, v0, Lcom/vkontakte/android/UserProfile;->uid:I

    .line 162
    iput-object p6, v0, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    .line 163
    iput-object p5, v0, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    .line 164
    iput-object v0, p2, Lcom/vkontakte/android/DialogEntry;->profile:Lcom/vkontakte/android/UserProfile;

    .line 165
    iput p3, p2, Lcom/vkontakte/android/DialogEntry;->unreadCount:I

    .line 166
    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 167
    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-static {p0, p2}, Lcom/vkontakte/android/fragments/messages/DialogsFragment$1$$Lambda$7;->lambdaFactory$(Lcom/vkontakte/android/fragments/messages/DialogsFragment$1;Lcom/vkontakte/android/DialogEntry;)Ljava/lang/Runnable;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 173
    :cond_0
    return-void
.end method

.method synthetic lambda$null$5(Lcom/vkontakte/android/DialogEntry;Ljava/util/ArrayList;)V
    .locals 1
    .param p1, "entry"    # Lcom/vkontakte/android/DialogEntry;
    .param p2, "users"    # Ljava/util/ArrayList;

    .prologue
    .line 293
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 294
    invoke-virtual {p1, p2}, Lcom/vkontakte/android/DialogEntry;->setWritesMessage(Ljava/util/Collection;)V

    .line 295
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->access$100(Lcom/vkontakte/android/fragments/messages/DialogsFragment;)V

    .line 297
    :cond_0
    return-void
.end method

.method synthetic lambda$onReceive$3(Lcom/vkontakte/android/Message;Landroid/content/Intent;II)V
    .locals 3
    .param p1, "msg"    # Lcom/vkontakte/android/Message;
    .param p2, "intent"    # Landroid/content/Intent;
    .param p3, "peer1"    # I
    .param p4, "unread"    # I

    .prologue
    const v2, 0x77359400

    .line 140
    if-ge p3, v2, :cond_1

    .line 141
    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    if-nez v1, :cond_0

    .line 175
    :goto_0
    return-void

    .line 144
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-static {p0, p1, p2, p4}, Lcom/vkontakte/android/fragments/messages/DialogsFragment$1$$Lambda$5;->lambdaFactory$(Lcom/vkontakte/android/fragments/messages/DialogsFragment$1;Lcom/vkontakte/android/Message;Landroid/content/Intent;I)Ljava/lang/Runnable;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_0

    .line 155
    :cond_1
    new-instance v0, Lcom/vkontakte/android/DialogEntry;

    invoke-direct {v0}, Lcom/vkontakte/android/DialogEntry;-><init>()V

    .line 156
    .local v0, "e":Lcom/vkontakte/android/DialogEntry;
    iput-object p1, v0, Lcom/vkontakte/android/DialogEntry;->lastMessage:Lcom/vkontakte/android/Message;

    .line 157
    const-string/jumbo v1, "sender_photo"

    invoke-virtual {p2, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/vkontakte/android/DialogEntry;->lastMessagePhoto:Ljava/lang/String;

    .line 158
    invoke-virtual {v0}, Lcom/vkontakte/android/DialogEntry;->updateMutedState()Z

    .line 159
    sub-int v1, p3, v2

    invoke-static {p0, p3, v0, p4}, Lcom/vkontakte/android/fragments/messages/DialogsFragment$1$$Lambda$6;->lambdaFactory$(Lcom/vkontakte/android/fragments/messages/DialogsFragment$1;ILcom/vkontakte/android/DialogEntry;I)Lcom/vkontakte/android/data/Messages$GetChatUsersCallback;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/vkontakte/android/data/Messages;->getChatUsers(ILcom/vkontakte/android/data/Messages$GetChatUsersCallback;)V

    goto :goto_0
.end method

.method synthetic lambda$onReceive$4(Lcom/vkontakte/android/DialogEntry;Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "e"    # Lcom/vkontakte/android/DialogEntry;
    .param p2, "users"    # Ljava/util/ArrayList;
    .param p3, "title"    # Ljava/lang/String;
    .param p4, "photo"    # Ljava/lang/String;

    .prologue
    .line 245
    iget-object v0, p1, Lcom/vkontakte/android/DialogEntry;->profile:Lcom/vkontakte/android/UserProfile;

    iput-object p3, v0, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    .line 246
    if-eqz p4, :cond_0

    .line 247
    iget-object v0, p1, Lcom/vkontakte/android/DialogEntry;->profile:Lcom/vkontakte/android/UserProfile;

    iput-object p4, v0, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    .line 249
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->access$300(Lcom/vkontakte/android/fragments/messages/DialogsFragment;Z)V

    .line 250
    return-void
.end method

.method synthetic lambda$onReceive$6(Lcom/vkontakte/android/DialogEntry;Ljava/util/ArrayList;)V
    .locals 2
    .param p1, "entry"    # Lcom/vkontakte/android/DialogEntry;
    .param p2, "users"    # Ljava/util/ArrayList;

    .prologue
    .line 291
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 292
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {p0, p1, p2}, Lcom/vkontakte/android/fragments/messages/DialogsFragment$1$$Lambda$4;->lambdaFactory$(Lcom/vkontakte/android/fragments/messages/DialogsFragment$1;Lcom/vkontakte/android/DialogEntry;Ljava/util/ArrayList;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 299
    :cond_0
    return-void
.end method

.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 22
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 96
    const-string/jumbo v19, "com.vkontakte.android.NEW_MESSAGE"

    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_9

    .line 97
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    move-object/from16 v19, v0

    invoke-static/range {v19 .. v19}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->access$000(Lcom/vkontakte/android/fragments/messages/DialogsFragment;)Ljava/util/ArrayList;

    move-result-object v19

    if-nez v19, :cond_1

    .line 309
    :cond_0
    :goto_0
    return-void

    .line 100
    :cond_1
    const-string/jumbo v19, "message"

    move-object/from16 v0, p2

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v11

    check-cast v11, Lcom/vkontakte/android/Message;

    .line 101
    .local v11, "msg":Lcom/vkontakte/android/Message;
    const-string/jumbo v19, "peer_id"

    const/16 v20, 0x0

    move-object/from16 v0, p2

    move-object/from16 v1, v19

    move/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v14

    .line 102
    .local v14, "peer":I
    const/4 v7, 0x0

    .line 103
    .local v7, "found":Z
    const/4 v10, 0x0

    .local v10, "j":I
    :goto_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    move-object/from16 v19, v0

    invoke-static/range {v19 .. v19}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->access$000(Lcom/vkontakte/android/fragments/messages/DialogsFragment;)Ljava/util/ArrayList;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/util/ArrayList;->size()I

    move-result v19

    move/from16 v0, v19

    if-ge v10, v0, :cond_8

    .line 104
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    move-object/from16 v19, v0

    invoke-static/range {v19 .. v19}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->access$000(Lcom/vkontakte/android/fragments/messages/DialogsFragment;)Ljava/util/ArrayList;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vkontakte/android/DialogEntry;

    .line 105
    .local v4, "e":Lcom/vkontakte/android/DialogEntry;
    iget-object v0, v4, Lcom/vkontakte/android/DialogEntry;->profile:Lcom/vkontakte/android/UserProfile;

    move-object/from16 v19, v0

    if-eqz v19, :cond_2

    iget-object v0, v4, Lcom/vkontakte/android/DialogEntry;->lastMessage:Lcom/vkontakte/android/Message;

    move-object/from16 v19, v0

    if-nez v19, :cond_3

    .line 103
    :cond_2
    add-int/lit8 v10, v10, 0x1

    goto :goto_1

    .line 108
    :cond_3
    iget-object v0, v4, Lcom/vkontakte/android/DialogEntry;->profile:Lcom/vkontakte/android/UserProfile;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget v0, v0, Lcom/vkontakte/android/UserProfile;->uid:I

    move/from16 v19, v0

    move/from16 v0, v19

    if-ne v0, v14, :cond_2

    .line 109
    iget-boolean v0, v11, Lcom/vkontakte/android/Message;->out:Z

    move/from16 v19, v0

    if-nez v19, :cond_4

    iget-boolean v0, v11, Lcom/vkontakte/android/Message;->readState:Z

    move/from16 v19, v0

    if-nez v19, :cond_4

    .line 110
    iget v0, v4, Lcom/vkontakte/android/DialogEntry;->unreadCount:I

    move/from16 v19, v0

    add-int/lit8 v19, v19, 0x1

    move/from16 v0, v19

    iput v0, v4, Lcom/vkontakte/android/DialogEntry;->unreadCount:I

    .line 112
    :cond_4
    iget-object v0, v4, Lcom/vkontakte/android/DialogEntry;->lastMessage:Lcom/vkontakte/android/Message;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget v0, v0, Lcom/vkontakte/android/Message;->id:I

    move/from16 v19, v0

    iget v0, v11, Lcom/vkontakte/android/Message;->id:I

    move/from16 v20, v0

    move/from16 v0, v19

    move/from16 v1, v20

    if-le v0, v1, :cond_5

    iget-object v0, v4, Lcom/vkontakte/android/DialogEntry;->lastMessage:Lcom/vkontakte/android/Message;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget v0, v0, Lcom/vkontakte/android/Message;->id:I

    move/from16 v19, v0

    if-lez v19, :cond_5

    iget v0, v11, Lcom/vkontakte/android/Message;->id:I

    move/from16 v19, v0

    if-lez v19, :cond_5

    .line 113
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    move-object/from16 v19, v0

    invoke-static/range {v19 .. v19}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->access$100(Lcom/vkontakte/android/fragments/messages/DialogsFragment;)V

    goto/16 :goto_0

    .line 116
    :cond_5
    iput-object v11, v4, Lcom/vkontakte/android/DialogEntry;->lastMessage:Lcom/vkontakte/android/Message;

    .line 117
    const-string/jumbo v19, "sender_photo"

    move-object/from16 v0, p2

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    iput-object v0, v4, Lcom/vkontakte/android/DialogEntry;->lastMessagePhoto:Ljava/lang/String;

    .line 118
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    move-object/from16 v19, v0

    invoke-static/range {v19 .. v19}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->access$000(Lcom/vkontakte/android/fragments/messages/DialogsFragment;)Ljava/util/ArrayList;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/util/ArrayList;->size()I

    move-result v19

    const/16 v20, 0x1

    move/from16 v0, v19

    move/from16 v1, v20

    if-le v0, v1, :cond_7

    .line 119
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    move-object/from16 v19, v0

    invoke-static/range {v19 .. v19}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->access$000(Lcom/vkontakte/android/fragments/messages/DialogsFragment;)Ljava/util/ArrayList;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 120
    const/16 v18, 0x0

    .line 121
    .local v18, "wasAdd":Z
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    move-object/from16 v19, v0

    invoke-static/range {v19 .. v19}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->access$000(Lcom/vkontakte/android/fragments/messages/DialogsFragment;)Ljava/util/ArrayList;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/util/ArrayList;->size()I

    move-result v19

    move/from16 v0, v19

    if-ge v8, v0, :cond_6

    .line 122
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    move-object/from16 v19, v0

    invoke-static/range {v19 .. v19}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->access$000(Lcom/vkontakte/android/fragments/messages/DialogsFragment;)Ljava/util/ArrayList;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Lcom/vkontakte/android/DialogEntry;

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/vkontakte/android/DialogEntry;->lastMessage:Lcom/vkontakte/android/Message;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget v0, v0, Lcom/vkontakte/android/Message;->time:I

    move/from16 v19, v0

    iget-object v0, v4, Lcom/vkontakte/android/DialogEntry;->lastMessage:Lcom/vkontakte/android/Message;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    iget v0, v0, Lcom/vkontakte/android/Message;->time:I

    move/from16 v20, v0

    move/from16 v0, v19

    move/from16 v1, v20

    if-gt v0, v1, :cond_b

    .line 123
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    move-object/from16 v19, v0

    invoke-static/range {v19 .. v19}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->access$000(Lcom/vkontakte/android/fragments/messages/DialogsFragment;)Ljava/util/ArrayList;

    move-result-object v19

    add-int/lit8 v20, v8, -0x1

    const/16 v21, 0x0

    invoke-static/range {v20 .. v21}, Ljava/lang/Math;->max(II)I

    move-result v20

    move-object/from16 v0, v19

    move/from16 v1, v20

    invoke-virtual {v0, v1, v4}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 124
    const/16 v18, 0x1

    .line 128
    :cond_6
    if-nez v18, :cond_7

    .line 129
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    move-object/from16 v19, v0

    invoke-static/range {v19 .. v19}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->access$000(Lcom/vkontakte/android/fragments/messages/DialogsFragment;)Ljava/util/ArrayList;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 132
    .end local v8    # "i":I
    .end local v18    # "wasAdd":Z
    :cond_7
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    move-object/from16 v19, v0

    invoke-static/range {v19 .. v19}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->access$200(Lcom/vkontakte/android/fragments/messages/DialogsFragment;)V

    .line 133
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    move-object/from16 v19, v0

    invoke-static/range {v19 .. v19}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->access$100(Lcom/vkontakte/android/fragments/messages/DialogsFragment;)V

    .line 134
    const/4 v7, 0x1

    .line 138
    .end local v4    # "e":Lcom/vkontakte/android/DialogEntry;
    :cond_8
    if-nez v7, :cond_9

    .line 139
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-static {v0, v11, v1}, Lcom/vkontakte/android/fragments/messages/DialogsFragment$1$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/fragments/messages/DialogsFragment$1;Lcom/vkontakte/android/Message;Landroid/content/Intent;)Lcom/vkontakte/android/data/Messages$GetUnreadCountCallback;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-static {v14, v0}, Lcom/vkontakte/android/data/Messages;->getUnreadCount(ILcom/vkontakte/android/data/Messages$GetUnreadCountCallback;)V

    .line 179
    .end local v7    # "found":Z
    .end local v10    # "j":I
    .end local v11    # "msg":Lcom/vkontakte/android/Message;
    .end local v14    # "peer":I
    :cond_9
    const-string/jumbo v19, "com.vkontakte.android.UPDATE_MESSAGE"

    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_d

    .line 180
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    move-object/from16 v19, v0

    invoke-static/range {v19 .. v19}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->access$000(Lcom/vkontakte/android/fragments/messages/DialogsFragment;)Ljava/util/ArrayList;

    move-result-object v19

    if-eqz v19, :cond_0

    .line 183
    const-string/jumbo v19, "message"

    move-object/from16 v0, p2

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v11

    check-cast v11, Lcom/vkontakte/android/Message;

    .line 184
    .restart local v11    # "msg":Lcom/vkontakte/android/Message;
    const-string/jumbo v19, "peer_id"

    const/16 v20, 0x0

    move-object/from16 v0, p2

    move-object/from16 v1, v19

    move/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v14

    .line 185
    .restart local v14    # "peer":I
    const/4 v10, 0x0

    .restart local v10    # "j":I
    :goto_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    move-object/from16 v19, v0

    invoke-static/range {v19 .. v19}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->access$000(Lcom/vkontakte/android/fragments/messages/DialogsFragment;)Ljava/util/ArrayList;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/util/ArrayList;->size()I

    move-result v19

    move/from16 v0, v19

    if-ge v10, v0, :cond_d

    .line 186
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    move-object/from16 v19, v0

    invoke-static/range {v19 .. v19}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->access$000(Lcom/vkontakte/android/fragments/messages/DialogsFragment;)Ljava/util/ArrayList;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vkontakte/android/DialogEntry;

    .line 187
    .restart local v4    # "e":Lcom/vkontakte/android/DialogEntry;
    iget-object v0, v4, Lcom/vkontakte/android/DialogEntry;->profile:Lcom/vkontakte/android/UserProfile;

    move-object/from16 v19, v0

    if-eqz v19, :cond_a

    iget-object v0, v4, Lcom/vkontakte/android/DialogEntry;->lastMessage:Lcom/vkontakte/android/Message;

    move-object/from16 v19, v0

    if-nez v19, :cond_c

    .line 185
    :cond_a
    add-int/lit8 v10, v10, 0x1

    goto :goto_3

    .line 121
    .restart local v7    # "found":Z
    .restart local v8    # "i":I
    .restart local v18    # "wasAdd":Z
    :cond_b
    add-int/lit8 v8, v8, 0x1

    goto/16 :goto_2

    .line 190
    .end local v7    # "found":Z
    .end local v8    # "i":I
    .end local v18    # "wasAdd":Z
    :cond_c
    iget-object v0, v4, Lcom/vkontakte/android/DialogEntry;->profile:Lcom/vkontakte/android/UserProfile;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget v0, v0, Lcom/vkontakte/android/UserProfile;->uid:I

    move/from16 v19, v0

    move/from16 v0, v19

    if-ne v0, v14, :cond_a

    iget-object v0, v4, Lcom/vkontakte/android/DialogEntry;->lastMessage:Lcom/vkontakte/android/Message;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget v0, v0, Lcom/vkontakte/android/Message;->id:I

    move/from16 v19, v0

    iget v0, v11, Lcom/vkontakte/android/Message;->id:I

    move/from16 v20, v0

    move/from16 v0, v19

    move/from16 v1, v20

    if-ne v0, v1, :cond_a

    .line 191
    iput-object v11, v4, Lcom/vkontakte/android/DialogEntry;->lastMessage:Lcom/vkontakte/android/Message;

    .line 192
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    move-object/from16 v19, v0

    invoke-static/range {v19 .. v19}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->access$100(Lcom/vkontakte/android/fragments/messages/DialogsFragment;)V

    goto/16 :goto_0

    .line 198
    .end local v4    # "e":Lcom/vkontakte/android/DialogEntry;
    .end local v10    # "j":I
    .end local v11    # "msg":Lcom/vkontakte/android/Message;
    .end local v14    # "peer":I
    :cond_d
    const-string/jumbo v19, "com.vkontakte.android.MESSAGE_RSTATE_CHANGED"

    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_10

    .line 199
    const-string/jumbo v19, "msg_id"

    const/16 v20, 0x0

    move-object/from16 v0, p2

    move-object/from16 v1, v19

    move/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v11

    .line 200
    .local v11, "msg":I
    const-string/jumbo v19, "read_state"

    const/16 v20, 0x0

    move-object/from16 v0, p2

    move-object/from16 v1, v19

    move/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v16

    .line 201
    .local v16, "state":Z
    const-string/jumbo v19, "le"

    move-object/from16 v0, p2

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_13

    .line 202
    const-string/jumbo v19, "peer_id"

    const/16 v20, 0x0

    move-object/from16 v0, p2

    move-object/from16 v1, v19

    move/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v14

    .line 203
    .restart local v14    # "peer":I
    const-string/jumbo v19, "in"

    const/16 v20, 0x0

    move-object/from16 v0, p2

    move-object/from16 v1, v19

    move/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v9

    .line 204
    .local v9, "in":Z
    const/4 v12, 0x0

    .line 205
    .local v12, "needUpdate":Z
    const/4 v8, 0x0

    .restart local v8    # "i":I
    :goto_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    move-object/from16 v19, v0

    invoke-static/range {v19 .. v19}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->access$000(Lcom/vkontakte/android/fragments/messages/DialogsFragment;)Ljava/util/ArrayList;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/util/ArrayList;->size()I

    move-result v19

    move/from16 v0, v19

    if-ge v8, v0, :cond_f

    .line 206
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    move-object/from16 v19, v0

    invoke-static/range {v19 .. v19}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->access$000(Lcom/vkontakte/android/fragments/messages/DialogsFragment;)Ljava/util/ArrayList;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vkontakte/android/DialogEntry;

    .line 207
    .restart local v4    # "e":Lcom/vkontakte/android/DialogEntry;
    iget-object v0, v4, Lcom/vkontakte/android/DialogEntry;->lastMessage:Lcom/vkontakte/android/Message;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget v0, v0, Lcom/vkontakte/android/Message;->peer:I

    move/from16 v19, v0

    move/from16 v0, v19

    if-ne v0, v14, :cond_e

    iget-object v0, v4, Lcom/vkontakte/android/DialogEntry;->lastMessage:Lcom/vkontakte/android/Message;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget v0, v0, Lcom/vkontakte/android/Message;->id:I

    move/from16 v19, v0

    move/from16 v0, v19

    if-gt v0, v11, :cond_e

    iget-object v0, v4, Lcom/vkontakte/android/DialogEntry;->lastMessage:Lcom/vkontakte/android/Message;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-boolean v0, v0, Lcom/vkontakte/android/Message;->out:Z

    move/from16 v19, v0

    move/from16 v0, v19

    if-eq v0, v9, :cond_e

    .line 208
    iget-object v0, v4, Lcom/vkontakte/android/DialogEntry;->lastMessage:Lcom/vkontakte/android/Message;

    move-object/from16 v19, v0

    move/from16 v0, v16

    move-object/from16 v1, v19

    iput-boolean v0, v1, Lcom/vkontakte/android/Message;->readState:Z

    .line 209
    const/16 v19, 0x0

    move/from16 v0, v19

    iput v0, v4, Lcom/vkontakte/android/DialogEntry;->unreadCount:I

    .line 210
    const/4 v12, 0x1

    .line 205
    :cond_e
    add-int/lit8 v8, v8, 0x1

    goto :goto_4

    .line 213
    .end local v4    # "e":Lcom/vkontakte/android/DialogEntry;
    :cond_f
    if-eqz v12, :cond_10

    .line 214
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    move-object/from16 v19, v0

    invoke-static/range {v19 .. v19}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->access$100(Lcom/vkontakte/android/fragments/messages/DialogsFragment;)V

    .line 227
    .end local v8    # "i":I
    .end local v9    # "in":Z
    .end local v11    # "msg":I
    .end local v12    # "needUpdate":Z
    .end local v14    # "peer":I
    .end local v16    # "state":Z
    :cond_10
    :goto_5
    const-string/jumbo v19, "com.vkontakte.android.REFRESH_DIALOGS"

    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_15

    .line 228
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    move-object/from16 v19, v0

    const/16 v20, 0x1

    invoke-virtual/range {v19 .. v20}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->loadData(Z)V

    .line 281
    :cond_11
    :goto_6
    const-string/jumbo v19, "com.vkontakte.android.TYPING"

    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_1f

    .line 282
    const-string/jumbo v19, "uid"

    const/16 v20, 0x0

    move-object/from16 v0, p2

    move-object/from16 v1, v19

    move/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v15

    .line 284
    .local v15, "peerId":I
    const/4 v8, 0x0

    .restart local v8    # "i":I
    :goto_7
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    move-object/from16 v19, v0

    invoke-static/range {v19 .. v19}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->access$000(Lcom/vkontakte/android/fragments/messages/DialogsFragment;)Ljava/util/ArrayList;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/util/ArrayList;->size()I

    move-result v19

    move/from16 v0, v19

    if-ge v8, v0, :cond_1f

    .line 285
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    move-object/from16 v19, v0

    invoke-static/range {v19 .. v19}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->access$000(Lcom/vkontakte/android/fragments/messages/DialogsFragment;)Ljava/util/ArrayList;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vkontakte/android/DialogEntry;

    .line 286
    .restart local v4    # "e":Lcom/vkontakte/android/DialogEntry;
    iget-object v0, v4, Lcom/vkontakte/android/DialogEntry;->lastMessage:Lcom/vkontakte/android/Message;

    move-object/from16 v19, v0

    if-eqz v19, :cond_12

    iget-object v0, v4, Lcom/vkontakte/android/DialogEntry;->lastMessage:Lcom/vkontakte/android/Message;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget v0, v0, Lcom/vkontakte/android/Message;->peer:I

    move/from16 v19, v0

    move/from16 v0, v19

    if-ne v0, v15, :cond_12

    .line 287
    move-object v5, v4

    .line 288
    .local v5, "entry":Lcom/vkontakte/android/DialogEntry;
    sget-boolean v19, Lcom/vkontakte/android/LongPollService;->longPollRunning:Z

    if-eqz v19, :cond_12

    sget-object v19, Lcom/vkontakte/android/Global;->longPoll:Lcom/vkontakte/android/LongPollService;

    if-eqz v19, :cond_12

    .line 290
    :try_start_0
    sget-object v19, Lcom/vkontakte/android/Global;->longPoll:Lcom/vkontakte/android/LongPollService;

    move-object/from16 v0, v19

    invoke-virtual {v0, v15}, Lcom/vkontakte/android/LongPollService;->getTypings(I)Ljava/util/List;

    move-result-object v19

    move-object/from16 v0, p0

    invoke-static {v0, v5}, Lcom/vkontakte/android/fragments/messages/DialogsFragment$1$$Lambda$3;->lambdaFactory$(Lcom/vkontakte/android/fragments/messages/DialogsFragment$1;Lcom/vkontakte/android/DialogEntry;)Lcom/vkontakte/android/data/Friends$GetUsersCallback;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Lcom/vkontakte/android/data/Friends;->getUsers(Ljava/util/Collection;Lcom/vkontakte/android/data/Friends$GetUsersCallback;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 284
    .end local v5    # "entry":Lcom/vkontakte/android/DialogEntry;
    :cond_12
    :goto_8
    add-int/lit8 v8, v8, 0x1

    goto :goto_7

    .line 217
    .end local v4    # "e":Lcom/vkontakte/android/DialogEntry;
    .end local v8    # "i":I
    .end local v15    # "peerId":I
    .restart local v11    # "msg":I
    .restart local v16    # "state":Z
    :cond_13
    const/4 v8, 0x0

    .restart local v8    # "i":I
    :goto_9
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    move-object/from16 v19, v0

    invoke-static/range {v19 .. v19}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->access$000(Lcom/vkontakte/android/fragments/messages/DialogsFragment;)Ljava/util/ArrayList;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/util/ArrayList;->size()I

    move-result v19

    move/from16 v0, v19

    if-ge v8, v0, :cond_10

    .line 218
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    move-object/from16 v19, v0

    invoke-static/range {v19 .. v19}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->access$000(Lcom/vkontakte/android/fragments/messages/DialogsFragment;)Ljava/util/ArrayList;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vkontakte/android/DialogEntry;

    .line 219
    .restart local v4    # "e":Lcom/vkontakte/android/DialogEntry;
    iget-object v0, v4, Lcom/vkontakte/android/DialogEntry;->lastMessage:Lcom/vkontakte/android/Message;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget v0, v0, Lcom/vkontakte/android/Message;->id:I

    move/from16 v19, v0

    move/from16 v0, v19

    if-ne v0, v11, :cond_14

    .line 220
    iget-object v0, v4, Lcom/vkontakte/android/DialogEntry;->lastMessage:Lcom/vkontakte/android/Message;

    move-object/from16 v19, v0

    move/from16 v0, v16

    move-object/from16 v1, v19

    iput-boolean v0, v1, Lcom/vkontakte/android/Message;->readState:Z

    .line 221
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    move-object/from16 v19, v0

    invoke-static/range {v19 .. v19}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->access$100(Lcom/vkontakte/android/fragments/messages/DialogsFragment;)V

    goto/16 :goto_5

    .line 217
    :cond_14
    add-int/lit8 v8, v8, 0x1

    goto :goto_9

    .line 229
    .end local v4    # "e":Lcom/vkontakte/android/DialogEntry;
    .end local v8    # "i":I
    .end local v11    # "msg":I
    .end local v16    # "state":Z
    :cond_15
    const-string/jumbo v19, "com.vkontakte.android.USER_PRESENCE"

    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_17

    .line 230
    const-string/jumbo v19, "uid"

    const/16 v20, 0x0

    move-object/from16 v0, p2

    move-object/from16 v1, v19

    move/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v17

    .line 231
    .local v17, "uid":I
    const-string/jumbo v19, "online"

    const/16 v20, 0x0

    move-object/from16 v0, p2

    move-object/from16 v1, v19

    move/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v13

    .line 232
    .local v13, "online":I
    const/4 v8, 0x0

    .restart local v8    # "i":I
    :goto_a
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    move-object/from16 v19, v0

    invoke-static/range {v19 .. v19}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->access$000(Lcom/vkontakte/android/fragments/messages/DialogsFragment;)Ljava/util/ArrayList;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/util/ArrayList;->size()I

    move-result v19

    move/from16 v0, v19

    if-ge v8, v0, :cond_11

    .line 233
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    move-object/from16 v19, v0

    invoke-static/range {v19 .. v19}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->access$000(Lcom/vkontakte/android/fragments/messages/DialogsFragment;)Ljava/util/ArrayList;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vkontakte/android/DialogEntry;

    .line 234
    .restart local v4    # "e":Lcom/vkontakte/android/DialogEntry;
    iget-object v0, v4, Lcom/vkontakte/android/DialogEntry;->profile:Lcom/vkontakte/android/UserProfile;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget v0, v0, Lcom/vkontakte/android/UserProfile;->uid:I

    move/from16 v19, v0

    move/from16 v0, v19

    move/from16 v1, v17

    if-ne v0, v1, :cond_16

    .line 235
    iget-object v0, v4, Lcom/vkontakte/android/DialogEntry;->profile:Lcom/vkontakte/android/UserProfile;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iput v13, v0, Lcom/vkontakte/android/UserProfile;->online:I

    .line 236
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    move-object/from16 v19, v0

    invoke-static/range {v19 .. v19}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->access$100(Lcom/vkontakte/android/fragments/messages/DialogsFragment;)V

    .line 232
    :cond_16
    add-int/lit8 v8, v8, 0x1

    goto :goto_a

    .line 239
    .end local v4    # "e":Lcom/vkontakte/android/DialogEntry;
    .end local v8    # "i":I
    .end local v13    # "online":I
    .end local v17    # "uid":I
    :cond_17
    const-string/jumbo v19, "com.vkontakte.android.CHAT_CHANGED"

    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_19

    .line 240
    const-string/jumbo v19, "id"

    const/16 v20, 0x0

    move-object/from16 v0, p2

    move-object/from16 v1, v19

    move/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v3

    .line 241
    .local v3, "cid":I
    const/4 v8, 0x0

    .restart local v8    # "i":I
    :goto_b
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    move-object/from16 v19, v0

    invoke-static/range {v19 .. v19}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->access$000(Lcom/vkontakte/android/fragments/messages/DialogsFragment;)Ljava/util/ArrayList;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/util/ArrayList;->size()I

    move-result v19

    move/from16 v0, v19

    if-ge v8, v0, :cond_11

    .line 242
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    move-object/from16 v19, v0

    invoke-static/range {v19 .. v19}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->access$000(Lcom/vkontakte/android/fragments/messages/DialogsFragment;)Ljava/util/ArrayList;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vkontakte/android/DialogEntry;

    .line 243
    .restart local v4    # "e":Lcom/vkontakte/android/DialogEntry;
    iget-object v0, v4, Lcom/vkontakte/android/DialogEntry;->lastMessage:Lcom/vkontakte/android/Message;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget v0, v0, Lcom/vkontakte/android/Message;->peer:I

    move/from16 v19, v0

    const v20, 0x77359400

    add-int v20, v20, v3

    move/from16 v0, v19

    move/from16 v1, v20

    if-ne v0, v1, :cond_18

    .line 244
    move-object/from16 v0, p0

    invoke-static {v0, v4}, Lcom/vkontakte/android/fragments/messages/DialogsFragment$1$$Lambda$2;->lambdaFactory$(Lcom/vkontakte/android/fragments/messages/DialogsFragment$1;Lcom/vkontakte/android/DialogEntry;)Lcom/vkontakte/android/data/Messages$GetChatUsersCallback;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-static {v3, v0}, Lcom/vkontakte/android/data/Messages;->getChatUsers(ILcom/vkontakte/android/data/Messages$GetChatUsersCallback;)V

    goto/16 :goto_6

    .line 241
    :cond_18
    add-int/lit8 v8, v8, 0x1

    goto :goto_b

    .line 254
    .end local v3    # "cid":I
    .end local v4    # "e":Lcom/vkontakte/android/DialogEntry;
    .end local v8    # "i":I
    :cond_19
    const-string/jumbo v19, "com.vkontakte.android.DIALOG_CHANGED"

    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_1b

    .line 255
    const-string/jumbo v19, "id"

    const/16 v20, 0x0

    move-object/from16 v0, p2

    move-object/from16 v1, v19

    move/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v3

    .line 256
    .restart local v3    # "cid":I
    const/4 v8, 0x0

    .restart local v8    # "i":I
    :goto_c
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    move-object/from16 v19, v0

    invoke-static/range {v19 .. v19}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->access$000(Lcom/vkontakte/android/fragments/messages/DialogsFragment;)Ljava/util/ArrayList;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/util/ArrayList;->size()I

    move-result v19

    move/from16 v0, v19

    if-ge v8, v0, :cond_11

    .line 257
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    move-object/from16 v19, v0

    invoke-static/range {v19 .. v19}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->access$000(Lcom/vkontakte/android/fragments/messages/DialogsFragment;)Ljava/util/ArrayList;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vkontakte/android/DialogEntry;

    .line 258
    .restart local v4    # "e":Lcom/vkontakte/android/DialogEntry;
    iget-object v0, v4, Lcom/vkontakte/android/DialogEntry;->lastMessage:Lcom/vkontakte/android/Message;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget v0, v0, Lcom/vkontakte/android/Message;->peer:I

    move/from16 v19, v0

    move/from16 v0, v19

    if-ne v0, v3, :cond_1a

    .line 259
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    move-object/from16 v19, v0

    const/16 v20, 0x1

    invoke-static/range {v19 .. v20}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->access$300(Lcom/vkontakte/android/fragments/messages/DialogsFragment;Z)V

    goto/16 :goto_6

    .line 256
    :cond_1a
    add-int/lit8 v8, v8, 0x1

    goto :goto_c

    .line 263
    .end local v3    # "cid":I
    .end local v4    # "e":Lcom/vkontakte/android/DialogEntry;
    .end local v8    # "i":I
    :cond_1b
    const-string/jumbo v19, "com.vkontakte.android.MUTE_CHANGED"

    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_1c

    .line 264
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    move-object/from16 v19, v0

    const/16 v20, 0x1

    invoke-static/range {v19 .. v20}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->access$300(Lcom/vkontakte/android/fragments/messages/DialogsFragment;Z)V

    goto/16 :goto_6

    .line 265
    :cond_1c
    const-string/jumbo v19, "com.vkontakte.android.COMMUNITY_MESSAGES_BLOCK_CHANGED"

    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_11

    .line 266
    const-string/jumbo v19, "id"

    const/16 v20, 0x0

    move-object/from16 v0, p2

    move-object/from16 v1, v19

    move/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v3

    .line 267
    .restart local v3    # "cid":I
    const/4 v8, 0x0

    .restart local v8    # "i":I
    :goto_d
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    move-object/from16 v19, v0

    invoke-static/range {v19 .. v19}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->access$000(Lcom/vkontakte/android/fragments/messages/DialogsFragment;)Ljava/util/ArrayList;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/util/ArrayList;->size()I

    move-result v19

    move/from16 v0, v19

    if-ge v8, v0, :cond_11

    .line 268
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    move-object/from16 v19, v0

    invoke-static/range {v19 .. v19}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->access$000(Lcom/vkontakte/android/fragments/messages/DialogsFragment;)Ljava/util/ArrayList;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vkontakte/android/DialogEntry;

    .line 269
    .restart local v4    # "e":Lcom/vkontakte/android/DialogEntry;
    iget-object v0, v4, Lcom/vkontakte/android/DialogEntry;->lastMessage:Lcom/vkontakte/android/Message;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget v0, v0, Lcom/vkontakte/android/Message;->peer:I

    move/from16 v19, v0

    move/from16 v0, v19

    if-ne v0, v3, :cond_1e

    .line 270
    iget-object v0, v4, Lcom/vkontakte/android/DialogEntry;->profile:Lcom/vkontakte/android/UserProfile;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v6, v0, Lcom/vkontakte/android/UserProfile;->extra:Landroid/os/Bundle;

    .line 271
    .local v6, "extra":Landroid/os/Bundle;
    if-nez v6, :cond_1d

    .line 272
    new-instance v6, Landroid/os/Bundle;

    .end local v6    # "extra":Landroid/os/Bundle;
    invoke-direct {v6}, Landroid/os/Bundle;-><init>()V

    .line 274
    .restart local v6    # "extra":Landroid/os/Bundle;
    :cond_1d
    const-string/jumbo v19, "is_messages_blocked"

    const-string/jumbo v20, "is_messages_blocked"

    const/16 v21, 0x0

    move-object/from16 v0, p2

    move-object/from16 v1, v20

    move/from16 v2, v21

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v20

    move-object/from16 v0, v19

    move/from16 v1, v20

    invoke-virtual {v6, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 275
    iget-object v0, v4, Lcom/vkontakte/android/DialogEntry;->profile:Lcom/vkontakte/android/UserProfile;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iput-object v6, v0, Lcom/vkontakte/android/UserProfile;->extra:Landroid/os/Bundle;

    .line 276
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    move-object/from16 v19, v0

    const/16 v20, 0x1

    invoke-static/range {v19 .. v20}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->access$300(Lcom/vkontakte/android/fragments/messages/DialogsFragment;Z)V

    goto/16 :goto_6

    .line 267
    .end local v6    # "extra":Landroid/os/Bundle;
    :cond_1e
    add-int/lit8 v8, v8, 0x1

    goto :goto_d

    .line 306
    .end local v3    # "cid":I
    .end local v4    # "e":Lcom/vkontakte/android/DialogEntry;
    .end local v8    # "i":I
    :cond_1f
    const-string/jumbo v19, "com.vkontakte.android.STATE_CHANGED"

    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_0

    .line 307
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    move-object/from16 v19, v0

    const-string/jumbo v20, "state"

    const/16 v21, 0x0

    move-object/from16 v0, p2

    move-object/from16 v1, v20

    move/from16 v2, v21

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v20

    invoke-static/range {v19 .. v20}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->access$400(Lcom/vkontakte/android/fragments/messages/DialogsFragment;I)V

    goto/16 :goto_0

    .line 300
    .restart local v4    # "e":Lcom/vkontakte/android/DialogEntry;
    .restart local v5    # "entry":Lcom/vkontakte/android/DialogEntry;
    .restart local v8    # "i":I
    .restart local v15    # "peerId":I
    :catch_0
    move-exception v19

    goto/16 :goto_8
.end method
