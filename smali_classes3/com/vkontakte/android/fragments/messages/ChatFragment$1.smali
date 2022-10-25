.class Lcom/vkontakte/android/fragments/messages/ChatFragment$1;
.super Landroid/content/BroadcastReceiver;
.source "ChatFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/messages/ChatFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/messages/ChatFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/messages/ChatFragment;

    .prologue
    .line 327
    iput-object p1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 53
    .param p1, "arg0"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 330
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-virtual/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getActivity()Landroid/app/Activity;

    move-result-object v49

    if-nez v49, :cond_1

    .line 799
    :cond_0
    :goto_0
    return-void

    .line 333
    :cond_1
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v49

    if-nez v49, :cond_6

    const-string/jumbo v49, ""

    :goto_1
    const/16 v50, -0x1

    invoke-virtual/range {v49 .. v49}, Ljava/lang/String;->hashCode()I

    move-result v51

    sparse-switch v51, :sswitch_data_0

    :cond_2
    move/from16 v49, v50

    :goto_2
    packed-switch v49, :pswitch_data_0

    goto :goto_0

    .line 335
    :pswitch_0
    const-string/jumbo v49, "msg_id"

    const/16 v50, 0x0

    move-object/from16 v0, p2

    move-object/from16 v1, v49

    move/from16 v2, v50

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v29

    .line 336
    .local v29, "mid":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$000(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;

    move-result-object v49

    invoke-virtual/range {v49 .. v49}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v49

    :cond_3
    invoke-interface/range {v49 .. v49}, Ljava/util/Iterator;->hasNext()Z

    move-result v50

    if-eqz v50, :cond_4

    invoke-interface/range {v49 .. v49}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v30

    check-cast v30, Lcom/vkontakte/android/Message;

    .line 337
    .local v30, "msg":Lcom/vkontakte/android/Message;
    move-object/from16 v0, v30

    iget v0, v0, Lcom/vkontakte/android/Message;->id:I

    move/from16 v50, v0

    move/from16 v0, v50

    move/from16 v1, v29

    if-ne v0, v1, :cond_3

    .line 338
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$000(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;

    move-result-object v49

    move-object/from16 v0, v49

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 342
    .end local v30    # "msg":Lcom/vkontakte/android/Message;
    :cond_4
    new-instance v43, Ljava/util/ArrayList;

    invoke-direct/range {v43 .. v43}, Ljava/util/ArrayList;-><init>()V

    .line 343
    .local v43, "toRemove":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/ui/holder/messages/MessageListItem;>;"
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$100(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;

    move-result-object v49

    invoke-virtual/range {v49 .. v49}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v49

    :cond_5
    :goto_3
    invoke-interface/range {v49 .. v49}, Ljava/util/Iterator;->hasNext()Z

    move-result v50

    if-eqz v50, :cond_7

    invoke-interface/range {v49 .. v49}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;

    .line 344
    .local v20, "item":Lcom/vkontakte/android/ui/holder/messages/MessageListItem;
    move-object/from16 v0, v20

    iget v0, v0, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->msgId:I

    move/from16 v50, v0

    move/from16 v0, v50

    move/from16 v1, v29

    if-ne v0, v1, :cond_5

    .line 345
    move-object/from16 v0, v43

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_3

    .line 333
    .end local v20    # "item":Lcom/vkontakte/android/ui/holder/messages/MessageListItem;
    .end local v29    # "mid":I
    .end local v43    # "toRemove":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/ui/holder/messages/MessageListItem;>;"
    :cond_6
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v49

    goto/16 :goto_1

    :sswitch_0
    const-string/jumbo v51, "com.vkontakte.android.MESSAGE_DELETED"

    move-object/from16 v0, v49

    move-object/from16 v1, v51

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v49

    if-eqz v49, :cond_2

    const/16 v49, 0x0

    goto/16 :goto_2

    :sswitch_1
    const-string/jumbo v51, "com.vkontakte.android.MESSAGE_RSTATE_CHANGED"

    move-object/from16 v0, v49

    move-object/from16 v1, v51

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v49

    if-eqz v49, :cond_2

    const/16 v49, 0x1

    goto/16 :goto_2

    :sswitch_2
    const-string/jumbo v51, "com.vkontakte.android.MUTE_CHANGED"

    move-object/from16 v0, v49

    move-object/from16 v1, v51

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v49

    if-eqz v49, :cond_2

    const/16 v49, 0x2

    goto/16 :goto_2

    :sswitch_3
    const-string/jumbo v51, "com.vkontakte.android.COMMUNITY_MESSAGES_BLOCK_CHANGED"

    move-object/from16 v0, v49

    move-object/from16 v1, v51

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v49

    if-eqz v49, :cond_2

    const/16 v49, 0x3

    goto/16 :goto_2

    :sswitch_4
    const-string/jumbo v51, "com.vkontakte.android.DIALOG_CHANGED"

    move-object/from16 v0, v49

    move-object/from16 v1, v51

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v49

    if-eqz v49, :cond_2

    const/16 v49, 0x4

    goto/16 :goto_2

    :sswitch_5
    const-string/jumbo v51, "com.vkontakte.android.CHAT_CHANGED"

    move-object/from16 v0, v49

    move-object/from16 v1, v51

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v49

    if-eqz v49, :cond_2

    const/16 v49, 0x5

    goto/16 :goto_2

    :sswitch_6
    const-string/jumbo v51, "com.vkontakte.android.NEW_MESSAGE"

    move-object/from16 v0, v49

    move-object/from16 v1, v51

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v49

    if-eqz v49, :cond_2

    const/16 v49, 0x6

    goto/16 :goto_2

    :sswitch_7
    const-string/jumbo v51, "com.vkontakte.android.UPDATE_MESSAGE"

    move-object/from16 v0, v49

    move-object/from16 v1, v51

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v49

    if-eqz v49, :cond_2

    const/16 v49, 0x7

    goto/16 :goto_2

    :sswitch_8
    const-string/jumbo v51, "com.vkontakte.android.TYPING"

    move-object/from16 v0, v49

    move-object/from16 v1, v51

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v49

    if-eqz v49, :cond_2

    const/16 v49, 0x8

    goto/16 :goto_2

    :sswitch_9
    const-string/jumbo v51, "com.vkontakte.android.USER_PRESENCE"

    move-object/from16 v0, v49

    move-object/from16 v1, v51

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v49

    if-eqz v49, :cond_2

    const/16 v49, 0x9

    goto/16 :goto_2

    :sswitch_a
    const-string/jumbo v51, "com.vkontakte.android.MESSAGE_ID_CHANGED"

    move-object/from16 v0, v49

    move-object/from16 v1, v51

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v49

    if-eqz v49, :cond_2

    const/16 v49, 0xa

    goto/16 :goto_2

    :sswitch_b
    const-string/jumbo v51, "com.vkontakte.android.UPLOAD_DONE"

    move-object/from16 v0, v49

    move-object/from16 v1, v51

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v49

    if-eqz v49, :cond_2

    const/16 v49, 0xb

    goto/16 :goto_2

    :sswitch_c
    const-string/jumbo v51, "com.vkontakte.android.MESSAGE_SEND_FAILED"

    move-object/from16 v0, v49

    move-object/from16 v1, v51

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v49

    if-eqz v49, :cond_2

    const/16 v49, 0xc

    goto/16 :goto_2

    :sswitch_d
    const-string/jumbo v51, "com.vkontakte.android.REFRESH_DIALOGS"

    move-object/from16 v0, v49

    move-object/from16 v1, v51

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v49

    if-eqz v49, :cond_2

    const/16 v49, 0xd

    goto/16 :goto_2

    :sswitch_e
    const-string/jumbo v51, "com.vkontakte.android.actions.AUDIO_MESSAGE_DONE"

    move-object/from16 v0, v49

    move-object/from16 v1, v51

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v49

    if-eqz v49, :cond_2

    const/16 v49, 0xe

    goto/16 :goto_2

    .line 348
    .restart local v29    # "mid":I
    .restart local v43    # "toRemove":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/ui/holder/messages/MessageListItem;>;"
    :cond_7
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$100(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;

    move-result-object v49

    move-object/from16 v0, v49

    move-object/from16 v1, v43

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->removeAll(Ljava/util/Collection;)Z

    .line 349
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$100(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;

    move-result-object v49

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/ui/holder/messages/MessageListItemHelper;->fixTimes(Ljava/util/List;)I

    .line 350
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$200(Lcom/vkontakte/android/fragments/messages/ChatFragment;)V

    goto/16 :goto_0

    .line 354
    .end local v29    # "mid":I
    .end local v43    # "toRemove":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/ui/holder/messages/MessageListItem;>;"
    :pswitch_1
    const-string/jumbo v49, "msg_id"

    const/16 v50, 0x0

    move-object/from16 v0, p2

    move-object/from16 v1, v49

    move/from16 v2, v50

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v29

    .line 355
    .restart local v29    # "mid":I
    const-string/jumbo v49, "read_state"

    const/16 v50, 0x0

    move-object/from16 v0, p2

    move-object/from16 v1, v49

    move/from16 v2, v50

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v42

    .line 356
    .local v42, "state":Z
    const-string/jumbo v49, "le"

    move-object/from16 v0, p2

    move-object/from16 v1, v49

    invoke-virtual {v0, v1}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v49

    if-eqz v49, :cond_d

    .line 357
    const-string/jumbo v49, "in"

    const/16 v50, 0x0

    move-object/from16 v0, p2

    move-object/from16 v1, v49

    move/from16 v2, v50

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v16

    .line 358
    .local v16, "in":Z
    const-string/jumbo v49, "peer_id"

    const/16 v50, 0x0

    move-object/from16 v0, p2

    move-object/from16 v1, v49

    move/from16 v2, v50

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v37

    .line 359
    .local v37, "peer":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$300(Lcom/vkontakte/android/fragments/messages/ChatFragment;)I

    move-result v49

    move/from16 v0, v37

    move/from16 v1, v49

    if-ne v0, v1, :cond_0

    .line 362
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$000(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;

    move-result-object v49

    invoke-virtual/range {v49 .. v49}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v49

    :cond_8
    :goto_4
    invoke-interface/range {v49 .. v49}, Ljava/util/Iterator;->hasNext()Z

    move-result v50

    if-eqz v50, :cond_9

    invoke-interface/range {v49 .. v49}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v26

    check-cast v26, Lcom/vkontakte/android/Message;

    .line 363
    .local v26, "m":Lcom/vkontakte/android/Message;
    move-object/from16 v0, v26

    iget v0, v0, Lcom/vkontakte/android/Message;->id:I

    move/from16 v50, v0

    move/from16 v0, v50

    move/from16 v1, v29

    if-gt v0, v1, :cond_8

    move-object/from16 v0, v26

    iget-boolean v0, v0, Lcom/vkontakte/android/Message;->out:Z

    move/from16 v50, v0

    move/from16 v0, v50

    move/from16 v1, v16

    if-eq v0, v1, :cond_8

    .line 364
    move/from16 v0, v42

    move-object/from16 v1, v26

    iput-boolean v0, v1, Lcom/vkontakte/android/Message;->readState:Z

    goto :goto_4

    .line 367
    .end local v26    # "m":Lcom/vkontakte/android/Message;
    :cond_9
    const/4 v14, 0x0

    .local v14, "i":I
    :goto_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$100(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;

    move-result-object v49

    invoke-virtual/range {v49 .. v49}, Ljava/util/ArrayList;->size()I

    move-result v49

    move/from16 v0, v49

    if-ge v14, v0, :cond_0

    .line 368
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$100(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;

    move-result-object v49

    move-object/from16 v0, v49

    invoke-virtual {v0, v14}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;

    .line 369
    .restart local v20    # "item":Lcom/vkontakte/android/ui/holder/messages/MessageListItem;
    move-object/from16 v0, v20

    iget v0, v0, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->msgId:I

    move/from16 v49, v0

    move/from16 v0, v49

    move/from16 v1, v29

    if-gt v0, v1, :cond_b

    move-object/from16 v0, v20

    iget-boolean v0, v0, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->isOut:Z

    move/from16 v49, v0

    move/from16 v0, v49

    move/from16 v1, v16

    if-eq v0, v1, :cond_b

    move-object/from16 v0, v20

    iget-boolean v0, v0, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->isFailed:Z

    move/from16 v49, v0

    if-nez v49, :cond_b

    .line 370
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$400(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Lcom/vkontakte/android/ui/widget/ChatRecyclerView;

    move-result-object v49

    if-nez v49, :cond_c

    const/16 v47, 0x0

    .line 372
    .local v47, "viewHolder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    :goto_6
    move-object/from16 v0, v47

    instance-of v0, v0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;

    move/from16 v49, v0

    if-eqz v49, :cond_a

    .line 373
    check-cast v47, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;

    .end local v47    # "viewHolder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    move-object/from16 v0, v47

    move/from16 v1, v42

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->setReadState(Z)V

    .line 375
    :cond_a
    move/from16 v0, v42

    move-object/from16 v1, v20

    iput-boolean v0, v1, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->readState:Z

    .line 367
    :cond_b
    add-int/lit8 v14, v14, 0x1

    goto :goto_5

    .line 370
    :cond_c
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    .line 371
    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$400(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Lcom/vkontakte/android/ui/widget/ChatRecyclerView;

    move-result-object v49

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v50, v0

    invoke-static/range {v50 .. v50}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$500(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Lcom/vkontakte/android/ui/adapters/MessagesAdapter;

    move-result-object v50

    invoke-virtual/range {v50 .. v50}, Lcom/vkontakte/android/ui/adapters/MessagesAdapter;->getHeaderViewsCount()I

    move-result v50

    add-int v50, v50, v14

    invoke-virtual/range {v49 .. v50}, Lcom/vkontakte/android/ui/widget/ChatRecyclerView;->findViewHolderForAdapterPosition(I)Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;

    move-result-object v47

    goto :goto_6

    .line 379
    .end local v14    # "i":I
    .end local v16    # "in":Z
    .end local v20    # "item":Lcom/vkontakte/android/ui/holder/messages/MessageListItem;
    .end local v37    # "peer":I
    :cond_d
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$000(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;

    move-result-object v49

    invoke-virtual/range {v49 .. v49}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v49

    :cond_e
    :goto_7
    invoke-interface/range {v49 .. v49}, Ljava/util/Iterator;->hasNext()Z

    move-result v50

    if-eqz v50, :cond_f

    invoke-interface/range {v49 .. v49}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v26

    check-cast v26, Lcom/vkontakte/android/Message;

    .line 380
    .restart local v26    # "m":Lcom/vkontakte/android/Message;
    move-object/from16 v0, v26

    iget v0, v0, Lcom/vkontakte/android/Message;->id:I

    move/from16 v50, v0

    move/from16 v0, v50

    move/from16 v1, v29

    if-ne v0, v1, :cond_e

    .line 381
    move/from16 v0, v42

    move-object/from16 v1, v26

    iput-boolean v0, v1, Lcom/vkontakte/android/Message;->readState:Z

    goto :goto_7

    .line 384
    .end local v26    # "m":Lcom/vkontakte/android/Message;
    :cond_f
    const/4 v14, 0x0

    .restart local v14    # "i":I
    :goto_8
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$100(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;

    move-result-object v49

    invoke-virtual/range {v49 .. v49}, Ljava/util/ArrayList;->size()I

    move-result v49

    move/from16 v0, v49

    if-ge v14, v0, :cond_0

    .line 385
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$100(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;

    move-result-object v49

    move-object/from16 v0, v49

    invoke-virtual {v0, v14}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;

    .line 386
    .restart local v20    # "item":Lcom/vkontakte/android/ui/holder/messages/MessageListItem;
    move-object/from16 v0, v20

    iget v0, v0, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->msgId:I

    move/from16 v49, v0

    move/from16 v0, v49

    move/from16 v1, v29

    if-ne v0, v1, :cond_10

    .line 387
    move/from16 v0, v42

    move-object/from16 v1, v20

    iput-boolean v0, v1, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->readState:Z

    .line 388
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$400(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Lcom/vkontakte/android/ui/widget/ChatRecyclerView;

    move-result-object v49

    if-nez v49, :cond_11

    const/16 v47, 0x0

    .line 390
    .restart local v47    # "viewHolder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    :goto_9
    move-object/from16 v0, v47

    instance-of v0, v0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;

    move/from16 v49, v0

    if-eqz v49, :cond_10

    .line 391
    check-cast v47, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;

    .end local v47    # "viewHolder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    move-object/from16 v0, v47

    move/from16 v1, v42

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->setReadState(Z)V

    .line 384
    :cond_10
    add-int/lit8 v14, v14, 0x1

    goto :goto_8

    .line 388
    :cond_11
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    .line 389
    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$400(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Lcom/vkontakte/android/ui/widget/ChatRecyclerView;

    move-result-object v49

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v50, v0

    invoke-static/range {v50 .. v50}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$500(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Lcom/vkontakte/android/ui/adapters/MessagesAdapter;

    move-result-object v50

    invoke-virtual/range {v50 .. v50}, Lcom/vkontakte/android/ui/adapters/MessagesAdapter;->getHeaderViewsCount()I

    move-result v50

    add-int v50, v50, v14

    invoke-virtual/range {v49 .. v50}, Lcom/vkontakte/android/ui/widget/ChatRecyclerView;->findViewHolderForAdapterPosition(I)Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;

    move-result-object v47

    goto :goto_9

    .line 399
    .end local v14    # "i":I
    .end local v20    # "item":Lcom/vkontakte/android/ui/holder/messages/MessageListItem;
    .end local v29    # "mid":I
    .end local v42    # "state":Z
    :pswitch_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v50, v0

    invoke-static/range {v50 .. v50}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$600(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/lang/CharSequence;

    move-result-object v50

    invoke-virtual/range {v49 .. v50}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->setTitle(Ljava/lang/CharSequence;)V

    goto/16 :goto_0

    .line 402
    :pswitch_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    const/16 v50, 0x1

    invoke-static/range {v49 .. v50}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$700(Lcom/vkontakte/android/fragments/messages/ChatFragment;Z)V

    goto/16 :goto_0

    .line 405
    :pswitch_4
    const-string/jumbo v49, "id"

    const/16 v50, 0x0

    move-object/from16 v0, p2

    move-object/from16 v1, v49

    move/from16 v2, v50

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v49

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v50, v0

    invoke-static/range {v50 .. v50}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$300(Lcom/vkontakte/android/fragments/messages/ChatFragment;)I

    move-result v50

    move/from16 v0, v49

    move/from16 v1, v50

    if-ne v0, v1, :cond_0

    .line 406
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v50, v0

    invoke-static/range {v50 .. v50}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$600(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/lang/CharSequence;

    move-result-object v50

    invoke-virtual/range {v49 .. v50}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->setTitle(Ljava/lang/CharSequence;)V

    goto/16 :goto_0

    .line 410
    :pswitch_5
    const-string/jumbo v49, "id"

    const/16 v50, 0x0

    move-object/from16 v0, p2

    move-object/from16 v1, v49

    move/from16 v2, v50

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v49

    const v50, 0x77359400

    add-int v49, v49, v50

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v50, v0

    invoke-static/range {v50 .. v50}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$300(Lcom/vkontakte/android/fragments/messages/ChatFragment;)I

    move-result v50

    move/from16 v0, v49

    move/from16 v1, v50

    if-ne v0, v1, :cond_0

    .line 411
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    const/16 v50, 0x0

    invoke-static/range {v49 .. v50}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$800(Lcom/vkontakte/android/fragments/messages/ChatFragment;Z)V

    goto/16 :goto_0

    .line 415
    :pswitch_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$900(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Z

    move-result v49

    if-eqz v49, :cond_12

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$000(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;

    move-result-object v49

    invoke-virtual/range {v49 .. v49}, Ljava/util/ArrayList;->size()I

    move-result v49

    if-eqz v49, :cond_0

    .line 418
    :cond_12
    const-string/jumbo v49, "peer_id"

    const/16 v50, 0x0

    move-object/from16 v0, p2

    move-object/from16 v1, v49

    move/from16 v2, v50

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v49

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v50, v0

    invoke-static/range {v50 .. v50}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$300(Lcom/vkontakte/android/fragments/messages/ChatFragment;)I

    move-result v50

    move/from16 v0, v49

    move/from16 v1, v50

    if-ne v0, v1, :cond_0

    .line 419
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$1000(Lcom/vkontakte/android/fragments/messages/ChatFragment;)I

    move-result v49

    if-lez v49, :cond_13

    .line 420
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$1008(Lcom/vkontakte/android/fragments/messages/ChatFragment;)I

    goto/16 :goto_0

    .line 423
    :cond_13
    const-string/jumbo v49, "message"

    move-object/from16 v0, p2

    move-object/from16 v1, v49

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v26

    check-cast v26, Lcom/vkontakte/android/Message;

    .line 424
    .restart local v26    # "m":Lcom/vkontakte/android/Message;
    move-object/from16 v0, v26

    iget-object v0, v0, Lcom/vkontakte/android/Message;->extras:Landroid/os/Bundle;

    move-object/from16 v49, v0

    const-string/jumbo v50, "action_mid"

    invoke-virtual/range {v49 .. v50}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v49

    if-eqz v49, :cond_14

    .line 425
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$1100(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Landroid/util/SparseArray;

    move-result-object v49

    move-object/from16 v0, v26

    iget-object v0, v0, Lcom/vkontakte/android/Message;->extras:Landroid/os/Bundle;

    move-object/from16 v50, v0

    const-string/jumbo v51, "action_mid"

    const/16 v52, 0x0

    invoke-virtual/range {v50 .. v52}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v50

    const-string/jumbo v51, "action_user_name_acc"

    move-object/from16 v0, p2

    move-object/from16 v1, v51

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v51

    invoke-virtual/range {v49 .. v51}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 427
    :cond_14
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$000(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;

    move-result-object v49

    invoke-virtual/range {v49 .. v49}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v49

    :cond_15
    invoke-interface/range {v49 .. v49}, Ljava/util/Iterator;->hasNext()Z

    move-result v50

    if-eqz v50, :cond_16

    invoke-interface/range {v49 .. v49}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v30

    check-cast v30, Lcom/vkontakte/android/Message;

    .line 428
    .restart local v30    # "msg":Lcom/vkontakte/android/Message;
    move-object/from16 v0, v30

    iget v0, v0, Lcom/vkontakte/android/Message;->id:I

    move/from16 v50, v0

    move-object/from16 v0, v26

    iget v0, v0, Lcom/vkontakte/android/Message;->id:I

    move/from16 v51, v0

    move/from16 v0, v50

    move/from16 v1, v51

    if-ne v0, v1, :cond_15

    .line 429
    move-object/from16 v0, v26

    iget v0, v0, Lcom/vkontakte/android/Message;->time:I

    move/from16 v49, v0

    move/from16 v0, v49

    move-object/from16 v1, v30

    iput v0, v1, Lcom/vkontakte/android/Message;->time:I

    goto/16 :goto_0

    .line 433
    .end local v30    # "msg":Lcom/vkontakte/android/Message;
    :cond_16
    const/16 v18, -0x1

    .line 434
    .local v18, "insertAt":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$000(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;

    move-result-object v49

    invoke-virtual/range {v49 .. v49}, Ljava/util/ArrayList;->size()I

    move-result v49

    if-nez v49, :cond_1a

    .line 435
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$000(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;

    move-result-object v49

    move-object/from16 v0, v49

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 460
    :cond_17
    :goto_a
    new-instance v13, Ljava/util/HashSet;

    invoke-direct {v13}, Ljava/util/HashSet;-><init>()V

    .line 461
    .local v13, "fwdUidSet":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    const/16 v49, -0x1

    move/from16 v0, v18

    move/from16 v1, v49

    if-ne v0, v1, :cond_22

    .line 462
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$100(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;

    move-result-object v49

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v50, v0

    invoke-static/range {v26 .. v26}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v51

    move-object/from16 v0, v50

    move-object/from16 v1, v51

    invoke-static {v0, v1, v13}, Lcom/vkontakte/android/ui/holder/messages/MessageListItemHelper;->buildItems(Lcom/vkontakte/android/ui/holder/messages/MessageListItemHelper$MessageListItemHelperProvider;Ljava/util/List;Ljava/util/Set;)Ljava/util/ArrayList;

    move-result-object v50

    invoke-virtual/range {v49 .. v50}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 463
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$100(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;

    move-result-object v49

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/ui/holder/messages/MessageListItemHelper;->fixTimes(Ljava/util/List;)I

    .line 469
    :goto_b
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$400(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Lcom/vkontakte/android/ui/widget/ChatRecyclerView;

    move-result-object v49

    if-nez v49, :cond_23

    const/16 v24, 0x0

    .line 470
    .local v24, "lm":Landroid/support/v7/widget/RecyclerView$LayoutManager;
    :goto_c
    move-object/from16 v0, v24

    instance-of v0, v0, Landroid/support/v7/widget/LinearLayoutManager;

    move/from16 v49, v0

    if-eqz v49, :cond_18

    .line 471
    check-cast v24, Landroid/support/v7/widget/LinearLayoutManager;

    .end local v24    # "lm":Landroid/support/v7/widget/RecyclerView$LayoutManager;
    invoke-virtual/range {v24 .. v24}, Landroid/support/v7/widget/LinearLayoutManager;->findLastCompletelyVisibleItemPosition()I

    move-result v23

    .line 472
    .local v23, "lastPosition":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$100(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;

    move-result-object v49

    invoke-virtual/range {v49 .. v49}, Ljava/util/ArrayList;->size()I

    move-result v49

    add-int/lit8 v49, v49, -0x2

    move/from16 v0, v23

    move/from16 v1, v49

    if-lt v0, v1, :cond_24

    .line 473
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$400(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Lcom/vkontakte/android/ui/widget/ChatRecyclerView;

    move-result-object v49

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v50, v0

    invoke-static/range {v50 .. v50}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$100(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;

    move-result-object v50

    invoke-virtual/range {v50 .. v50}, Ljava/util/ArrayList;->size()I

    move-result v50

    invoke-virtual/range {v49 .. v50}, Lcom/vkontakte/android/ui/widget/ChatRecyclerView;->scrollToPosition(I)V

    .line 479
    .end local v23    # "lastPosition":I
    :cond_18
    :goto_d
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$200(Lcom/vkontakte/android/fragments/messages/ChatFragment;)V

    .line 480
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$1300(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Z

    move-result v49

    if-eqz v49, :cond_19

    .line 481
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$1400(Lcom/vkontakte/android/fragments/messages/ChatFragment;)V

    .line 483
    :cond_19
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    move-object/from16 v0, v49

    invoke-static {v0, v13}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$1500(Lcom/vkontakte/android/fragments/messages/ChatFragment;Ljava/util/Collection;)V

    .line 484
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$400(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Lcom/vkontakte/android/ui/widget/ChatRecyclerView;

    move-result-object v49

    if-eqz v49, :cond_0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$400(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Lcom/vkontakte/android/ui/widget/ChatRecyclerView;

    move-result-object v49

    move-object/from16 v0, v49

    iget-object v0, v0, Lcom/vkontakte/android/ui/widget/ChatRecyclerView;->delegate:Lcom/vkontakte/android/ui/widget/VKRecyclerView$VKRecyclerViewDelegate;

    move-object/from16 v49, v0

    invoke-virtual/range {v49 .. v49}, Lcom/vkontakte/android/ui/widget/VKRecyclerView$VKRecyclerViewDelegate;->getLastVisiblePosition()I

    move-result v49

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v50, v0

    .line 485
    invoke-static/range {v50 .. v50}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$400(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Lcom/vkontakte/android/ui/widget/ChatRecyclerView;

    move-result-object v50

    invoke-virtual/range {v50 .. v50}, Lcom/vkontakte/android/ui/widget/ChatRecyclerView;->getCount()I

    move-result v50

    add-int/lit8 v50, v50, -0x1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v51, v0

    invoke-static/range {v51 .. v51}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$500(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Lcom/vkontakte/android/ui/adapters/MessagesAdapter;

    move-result-object v51

    invoke-virtual/range {v51 .. v51}, Lcom/vkontakte/android/ui/adapters/MessagesAdapter;->getFooterViewsCount()I

    move-result v51

    sub-int v50, v50, v51

    move/from16 v0, v49

    move/from16 v1, v50

    if-lt v0, v1, :cond_0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$1600(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Z

    move-result v49

    if-eqz v49, :cond_0

    .line 486
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$1700(Lcom/vkontakte/android/fragments/messages/ChatFragment;)V

    goto/16 :goto_0

    .line 437
    .end local v13    # "fwdUidSet":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    :cond_1a
    move-object/from16 v0, v26

    iget v0, v0, Lcom/vkontakte/android/Message;->id:I

    move/from16 v49, v0

    if-ltz v49, :cond_1c

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    .line 438
    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$000(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;

    move-result-object v49

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v50, v0

    invoke-static/range {v50 .. v50}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$000(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;

    move-result-object v50

    invoke-virtual/range {v50 .. v50}, Ljava/util/ArrayList;->size()I

    move-result v50

    add-int/lit8 v50, v50, -0x1

    invoke-virtual/range {v49 .. v50}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v49

    check-cast v49, Lcom/vkontakte/android/Message;

    move-object/from16 v0, v49

    iget v0, v0, Lcom/vkontakte/android/Message;->id:I

    move/from16 v49, v0

    move-object/from16 v0, v26

    iget v0, v0, Lcom/vkontakte/android/Message;->id:I

    move/from16 v50, v0

    move/from16 v0, v49

    move/from16 v1, v50

    if-ge v0, v1, :cond_1b

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$000(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;

    move-result-object v49

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v50, v0

    invoke-static/range {v50 .. v50}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$000(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;

    move-result-object v50

    invoke-virtual/range {v50 .. v50}, Ljava/util/ArrayList;->size()I

    move-result v50

    add-int/lit8 v50, v50, -0x1

    invoke-virtual/range {v49 .. v50}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v49

    check-cast v49, Lcom/vkontakte/android/Message;

    move-object/from16 v0, v49

    iget v0, v0, Lcom/vkontakte/android/Message;->id:I

    move/from16 v49, v0

    if-gtz v49, :cond_1c

    :cond_1b
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    .line 439
    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$000(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;

    move-result-object v49

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v50, v0

    invoke-static/range {v50 .. v50}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$000(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;

    move-result-object v50

    invoke-virtual/range {v50 .. v50}, Ljava/util/ArrayList;->size()I

    move-result v50

    add-int/lit8 v50, v50, -0x1

    invoke-virtual/range {v49 .. v50}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v49

    check-cast v49, Lcom/vkontakte/android/Message;

    move-object/from16 v0, v49

    iget v0, v0, Lcom/vkontakte/android/Message;->time:I

    move/from16 v49, v0

    move-object/from16 v0, v26

    iget v0, v0, Lcom/vkontakte/android/Message;->time:I

    move/from16 v50, v0

    move/from16 v0, v49

    move/from16 v1, v50

    if-ge v0, v1, :cond_1d

    .line 440
    :cond_1c
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$000(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;

    move-result-object v49

    move-object/from16 v0, v49

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_a

    .line 442
    :cond_1d
    const v40, 0x7fffffff

    .line 443
    .local v40, "prevID":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$000(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;

    move-result-object v49

    invoke-virtual/range {v49 .. v49}, Ljava/util/ArrayList;->size()I

    move-result v49

    add-int/lit8 v14, v49, -0x1

    .restart local v14    # "i":I
    :goto_e
    if-ltz v14, :cond_17

    .line 444
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$000(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;

    move-result-object v49

    move-object/from16 v0, v49

    invoke-virtual {v0, v14}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v24

    check-cast v24, Lcom/vkontakte/android/Message;

    .line 445
    .local v24, "lm":Lcom/vkontakte/android/Message;
    move-object/from16 v0, v26

    iget v0, v0, Lcom/vkontakte/android/Message;->id:I

    move/from16 v49, v0

    move/from16 v0, v49

    move/from16 v1, v40

    if-lt v0, v1, :cond_20

    move-object/from16 v0, v24

    iget v0, v0, Lcom/vkontakte/android/Message;->id:I

    move/from16 v49, v0

    if-lez v49, :cond_1e

    move-object/from16 v0, v24

    iget v0, v0, Lcom/vkontakte/android/Message;->id:I

    move/from16 v49, v0

    :goto_f
    move-object/from16 v0, v26

    iget v0, v0, Lcom/vkontakte/android/Message;->id:I

    move/from16 v50, v0

    move/from16 v0, v49

    move/from16 v1, v50

    if-gt v0, v1, :cond_20

    .line 446
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$000(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;

    move-result-object v49

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v50, v0

    invoke-static/range {v50 .. v50}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$000(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;

    move-result-object v50

    invoke-virtual/range {v50 .. v50}, Ljava/util/ArrayList;->size()I

    move-result v50

    add-int/lit8 v50, v50, -0x1

    add-int/lit8 v51, v14, 0x2

    invoke-static/range {v50 .. v51}, Ljava/lang/Math;->min(II)I

    move-result v50

    invoke-virtual/range {v49 .. v50}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v49

    check-cast v49, Lcom/vkontakte/android/Message;

    move-object/from16 v0, v49

    iget v4, v0, Lcom/vkontakte/android/Message;->id:I

    .line 447
    .local v4, "afterID":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$000(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;

    move-result-object v49

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v50, v0

    invoke-static/range {v50 .. v50}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$000(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;

    move-result-object v50

    invoke-virtual/range {v50 .. v50}, Ljava/util/ArrayList;->size()I

    move-result v50

    add-int/lit8 v50, v50, -0x1

    add-int/lit8 v51, v14, 0x2

    invoke-static/range {v50 .. v51}, Ljava/lang/Math;->min(II)I

    move-result v50

    move-object/from16 v0, v49

    move/from16 v1, v50

    move-object/from16 v2, v26

    invoke-virtual {v0, v1, v2}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 448
    const/16 v22, 0x0

    .local v22, "j":I
    :goto_10
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$100(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;

    move-result-object v49

    invoke-virtual/range {v49 .. v49}, Ljava/util/ArrayList;->size()I

    move-result v49

    move/from16 v0, v22

    move/from16 v1, v49

    if-ge v0, v1, :cond_17

    .line 449
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$100(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;

    move-result-object v49

    move-object/from16 v0, v49

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v49

    check-cast v49, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;

    move-object/from16 v0, v49

    iget v0, v0, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->msgId:I

    move/from16 v49, v0

    move/from16 v0, v49

    if-ne v0, v4, :cond_1f

    .line 450
    move/from16 v18, v22

    .line 451
    goto/16 :goto_a

    .line 445
    .end local v4    # "afterID":I
    .end local v22    # "j":I
    :cond_1e
    const v49, 0x7fffffff

    goto/16 :goto_f

    .line 448
    .restart local v4    # "afterID":I
    .restart local v22    # "j":I
    :cond_1f
    add-int/lit8 v22, v22, 0x1

    goto :goto_10

    .line 456
    .end local v4    # "afterID":I
    .end local v22    # "j":I
    :cond_20
    move-object/from16 v0, v24

    iget v0, v0, Lcom/vkontakte/android/Message;->id:I

    move/from16 v49, v0

    if-lez v49, :cond_21

    move-object/from16 v0, v24

    iget v0, v0, Lcom/vkontakte/android/Message;->id:I

    move/from16 v40, v0

    .line 443
    :goto_11
    add-int/lit8 v14, v14, -0x1

    goto/16 :goto_e

    .line 456
    :cond_21
    const v40, 0x7fffffff

    goto :goto_11

    .line 465
    .end local v14    # "i":I
    .end local v24    # "lm":Lcom/vkontakte/android/Message;
    .end local v40    # "prevID":I
    .restart local v13    # "fwdUidSet":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    :cond_22
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$100(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;

    move-result-object v49

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v50, v0

    invoke-static/range {v26 .. v26}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v51

    move-object/from16 v0, v50

    move-object/from16 v1, v51

    invoke-static {v0, v1, v13}, Lcom/vkontakte/android/ui/holder/messages/MessageListItemHelper;->buildItems(Lcom/vkontakte/android/ui/holder/messages/MessageListItemHelper$MessageListItemHelperProvider;Ljava/util/List;Ljava/util/Set;)Ljava/util/ArrayList;

    move-result-object v50

    move-object/from16 v0, v49

    move/from16 v1, v18

    move-object/from16 v2, v50

    invoke-virtual {v0, v1, v2}, Ljava/util/ArrayList;->addAll(ILjava/util/Collection;)Z

    .line 466
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$100(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;

    move-result-object v49

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/ui/holder/messages/MessageListItemHelper;->fixTimes(Ljava/util/List;)I

    goto/16 :goto_b

    .line 469
    :cond_23
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$400(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Lcom/vkontakte/android/ui/widget/ChatRecyclerView;

    move-result-object v49

    invoke-virtual/range {v49 .. v49}, Lcom/vkontakte/android/ui/widget/ChatRecyclerView;->getLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v24

    goto/16 :goto_c

    .line 475
    .restart local v23    # "lastPosition":I
    :cond_24
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$1200(Lcom/vkontakte/android/fragments/messages/ChatFragment;)V

    goto/16 :goto_d

    .line 493
    .end local v13    # "fwdUidSet":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    .end local v18    # "insertAt":I
    .end local v23    # "lastPosition":I
    .end local v26    # "m":Lcom/vkontakte/android/Message;
    :pswitch_7
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$900(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Z

    move-result v49

    if-nez v49, :cond_0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$000(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;

    move-result-object v49

    invoke-virtual/range {v49 .. v49}, Ljava/util/ArrayList;->size()I

    move-result v49

    if-eqz v49, :cond_0

    .line 496
    const-string/jumbo v49, "peer_id"

    const/16 v50, 0x0

    move-object/from16 v0, p2

    move-object/from16 v1, v49

    move/from16 v2, v50

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v49

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v50, v0

    invoke-static/range {v50 .. v50}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$300(Lcom/vkontakte/android/fragments/messages/ChatFragment;)I

    move-result v50

    move/from16 v0, v49

    move/from16 v1, v50

    if-ne v0, v1, :cond_0

    .line 497
    const-string/jumbo v49, "message"

    move-object/from16 v0, p2

    move-object/from16 v1, v49

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v26

    check-cast v26, Lcom/vkontakte/android/Message;

    .line 498
    .restart local v26    # "m":Lcom/vkontakte/android/Message;
    move-object/from16 v0, v26

    iget-object v0, v0, Lcom/vkontakte/android/Message;->extras:Landroid/os/Bundle;

    move-object/from16 v49, v0

    const-string/jumbo v50, "action_mid"

    invoke-virtual/range {v49 .. v50}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v49

    if-eqz v49, :cond_25

    .line 499
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$1100(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Landroid/util/SparseArray;

    move-result-object v49

    move-object/from16 v0, v26

    iget-object v0, v0, Lcom/vkontakte/android/Message;->extras:Landroid/os/Bundle;

    move-object/from16 v50, v0

    const-string/jumbo v51, "action_mid"

    const/16 v52, 0x0

    invoke-virtual/range {v50 .. v52}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v50

    const-string/jumbo v51, "action_user_name_acc"

    move-object/from16 v0, p2

    move-object/from16 v1, v51

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v51

    invoke-virtual/range {v49 .. v51}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 502
    :cond_25
    new-instance v45, Ljava/util/ArrayList;

    invoke-direct/range {v45 .. v45}, Ljava/util/ArrayList;-><init>()V

    .line 503
    .local v45, "toRemoveMsg":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/Message;>;"
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$000(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;

    move-result-object v49

    invoke-virtual/range {v49 .. v49}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v49

    :cond_26
    invoke-interface/range {v49 .. v49}, Ljava/util/Iterator;->hasNext()Z

    move-result v50

    if-eqz v50, :cond_27

    invoke-interface/range {v49 .. v49}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v30

    check-cast v30, Lcom/vkontakte/android/Message;

    .line 504
    .restart local v30    # "msg":Lcom/vkontakte/android/Message;
    move-object/from16 v0, v30

    iget v0, v0, Lcom/vkontakte/android/Message;->id:I

    move/from16 v50, v0

    move-object/from16 v0, v26

    iget v0, v0, Lcom/vkontakte/android/Message;->id:I

    move/from16 v51, v0

    move/from16 v0, v50

    move/from16 v1, v51

    if-ne v0, v1, :cond_26

    .line 505
    move-object/from16 v0, v45

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 509
    .end local v30    # "msg":Lcom/vkontakte/android/Message;
    :cond_27
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$000(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;

    move-result-object v49

    move-object/from16 v0, v49

    move-object/from16 v1, v45

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->removeAll(Ljava/util/Collection;)Z

    .line 511
    new-instance v44, Ljava/util/ArrayList;

    invoke-direct/range {v44 .. v44}, Ljava/util/ArrayList;-><init>()V

    .line 512
    .local v44, "toRemoveItem":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/ui/holder/messages/MessageListItem;>;"
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$100(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;

    move-result-object v49

    invoke-virtual/range {v49 .. v49}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v49

    :cond_28
    :goto_12
    invoke-interface/range {v49 .. v49}, Ljava/util/Iterator;->hasNext()Z

    move-result v50

    if-eqz v50, :cond_29

    invoke-interface/range {v49 .. v49}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;

    .line 513
    .restart local v20    # "item":Lcom/vkontakte/android/ui/holder/messages/MessageListItem;
    move-object/from16 v0, v20

    iget v0, v0, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->msgId:I

    move/from16 v50, v0

    move-object/from16 v0, v26

    iget v0, v0, Lcom/vkontakte/android/Message;->id:I

    move/from16 v51, v0

    move/from16 v0, v50

    move/from16 v1, v51

    if-ne v0, v1, :cond_28

    .line 514
    move-object/from16 v0, v44

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_12

    .line 517
    .end local v20    # "item":Lcom/vkontakte/android/ui/holder/messages/MessageListItem;
    :cond_29
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$100(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;

    move-result-object v49

    move-object/from16 v0, v49

    move-object/from16 v1, v44

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->removeAll(Ljava/util/Collection;)Z

    .line 519
    invoke-virtual/range {v45 .. v45}, Ljava/util/ArrayList;->size()I

    move-result v49

    if-gtz v49, :cond_2a

    invoke-virtual/range {v44 .. v44}, Ljava/util/ArrayList;->size()I

    move-result v49

    if-lez v49, :cond_2c

    :cond_2a
    const/16 v19, 0x1

    .line 520
    .local v19, "isFound":Z
    :goto_13
    if-eqz v19, :cond_0

    .line 521
    const/16 v18, -0x1

    .line 522
    .restart local v18    # "insertAt":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$000(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;

    move-result-object v49

    invoke-virtual/range {v49 .. v49}, Ljava/util/ArrayList;->size()I

    move-result v49

    if-lez v49, :cond_2b

    .line 523
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$000(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;

    move-result-object v49

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v50, v0

    invoke-static/range {v50 .. v50}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$000(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;

    move-result-object v50

    invoke-virtual/range {v50 .. v50}, Ljava/util/ArrayList;->size()I

    move-result v50

    add-int/lit8 v50, v50, -0x1

    invoke-virtual/range {v49 .. v50}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v25

    check-cast v25, Lcom/vkontakte/android/Message;

    .line 524
    .local v25, "lmx":Lcom/vkontakte/android/Message;
    move-object/from16 v0, v26

    iget v0, v0, Lcom/vkontakte/android/Message;->id:I

    move/from16 v49, v0

    if-lez v49, :cond_2d

    move-object/from16 v0, v25

    iget v0, v0, Lcom/vkontakte/android/Message;->id:I

    move/from16 v49, v0

    if-lez v49, :cond_2d

    move-object/from16 v0, v25

    iget v0, v0, Lcom/vkontakte/android/Message;->id:I

    move/from16 v49, v0

    move-object/from16 v0, v26

    iget v0, v0, Lcom/vkontakte/android/Message;->id:I

    move/from16 v50, v0

    move/from16 v0, v49

    move/from16 v1, v50

    if-gt v0, v1, :cond_2d

    .line 525
    const/16 v18, -0x1

    .line 526
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$000(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;

    move-result-object v49

    move-object/from16 v0, v49

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 548
    .end local v25    # "lmx":Lcom/vkontakte/android/Message;
    :cond_2b
    :goto_14
    new-instance v13, Ljava/util/HashSet;

    invoke-direct {v13}, Ljava/util/HashSet;-><init>()V

    .line 549
    .restart local v13    # "fwdUidSet":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    if-gez v18, :cond_34

    .line 550
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$100(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;

    move-result-object v49

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v50, v0

    invoke-static/range {v26 .. v26}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v51

    move-object/from16 v0, v50

    move-object/from16 v1, v51

    invoke-static {v0, v1, v13}, Lcom/vkontakte/android/ui/holder/messages/MessageListItemHelper;->buildItems(Lcom/vkontakte/android/ui/holder/messages/MessageListItemHelper$MessageListItemHelperProvider;Ljava/util/List;Ljava/util/Set;)Ljava/util/ArrayList;

    move-result-object v50

    invoke-virtual/range {v49 .. v50}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 551
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$100(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;

    move-result-object v49

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/ui/holder/messages/MessageListItemHelper;->fixTimes(Ljava/util/List;)I

    .line 556
    :goto_15
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$200(Lcom/vkontakte/android/fragments/messages/ChatFragment;)V

    .line 557
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    move-object/from16 v0, v49

    invoke-static {v0, v13}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$1500(Lcom/vkontakte/android/fragments/messages/ChatFragment;Ljava/util/Collection;)V

    goto/16 :goto_0

    .line 519
    .end local v13    # "fwdUidSet":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    .end local v18    # "insertAt":I
    .end local v19    # "isFound":Z
    :cond_2c
    const/16 v19, 0x0

    goto/16 :goto_13

    .line 528
    .restart local v18    # "insertAt":I
    .restart local v19    # "isFound":Z
    .restart local v25    # "lmx":Lcom/vkontakte/android/Message;
    :cond_2d
    const v40, 0x7fffffff

    .line 529
    .restart local v40    # "prevID":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$000(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;

    move-result-object v49

    invoke-virtual/range {v49 .. v49}, Ljava/util/ArrayList;->size()I

    move-result v49

    add-int/lit8 v14, v49, -0x1

    .restart local v14    # "i":I
    :goto_16
    if-ltz v14, :cond_2b

    .line 530
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$000(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;

    move-result-object v49

    move-object/from16 v0, v49

    invoke-virtual {v0, v14}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v24

    check-cast v24, Lcom/vkontakte/android/Message;

    .line 531
    .restart local v24    # "lm":Lcom/vkontakte/android/Message;
    move-object/from16 v0, v26

    iget v0, v0, Lcom/vkontakte/android/Message;->id:I

    move/from16 v49, v0

    move/from16 v0, v49

    move/from16 v1, v40

    if-lt v0, v1, :cond_32

    move-object/from16 v0, v24

    iget v0, v0, Lcom/vkontakte/android/Message;->id:I

    move/from16 v49, v0

    if-lez v49, :cond_2e

    move-object/from16 v0, v24

    iget v0, v0, Lcom/vkontakte/android/Message;->id:I

    move/from16 v49, v0

    :goto_17
    move-object/from16 v0, v26

    iget v0, v0, Lcom/vkontakte/android/Message;->id:I

    move/from16 v50, v0

    move/from16 v0, v49

    move/from16 v1, v50

    if-gt v0, v1, :cond_32

    .line 532
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$000(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;

    move-result-object v49

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v50, v0

    invoke-static/range {v50 .. v50}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$000(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;

    move-result-object v50

    invoke-virtual/range {v50 .. v50}, Ljava/util/ArrayList;->size()I

    move-result v50

    add-int/lit8 v50, v50, -0x1

    add-int/lit8 v51, v14, 0x2

    invoke-static/range {v50 .. v51}, Ljava/lang/Math;->min(II)I

    move-result v50

    invoke-virtual/range {v49 .. v50}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v49

    check-cast v49, Lcom/vkontakte/android/Message;

    move-object/from16 v0, v49

    iget v4, v0, Lcom/vkontakte/android/Message;->id:I

    .line 533
    .restart local v4    # "afterID":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$000(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;

    move-result-object v49

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v50, v0

    invoke-static/range {v50 .. v50}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$000(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;

    move-result-object v50

    invoke-virtual/range {v50 .. v50}, Ljava/util/ArrayList;->size()I

    move-result v50

    add-int/lit8 v50, v50, -0x1

    add-int/lit8 v51, v14, 0x2

    invoke-static/range {v50 .. v51}, Ljava/lang/Math;->min(II)I

    move-result v50

    move-object/from16 v0, v49

    move/from16 v1, v50

    move-object/from16 v2, v26

    invoke-virtual {v0, v1, v2}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 534
    const/16 v22, 0x0

    .restart local v22    # "j":I
    :goto_18
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$100(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;

    move-result-object v49

    invoke-virtual/range {v49 .. v49}, Ljava/util/ArrayList;->size()I

    move-result v49

    move/from16 v0, v22

    move/from16 v1, v49

    if-ge v0, v1, :cond_2b

    .line 535
    if-lez v22, :cond_2f

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$100(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;

    move-result-object v49

    add-int/lit8 v50, v22, -0x1

    invoke-virtual/range {v49 .. v50}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v49

    check-cast v49, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;

    invoke-virtual/range {v49 .. v49}, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->isTime()Z

    move-result v49

    if-eqz v49, :cond_2f

    const/16 v41, 0x1

    .line 536
    .local v41, "prevIsDate":Z
    :goto_19
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$100(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;

    move-result-object v49

    move-object/from16 v0, v49

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v49

    check-cast v49, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;

    move-object/from16 v0, v49

    iget v0, v0, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->msgId:I

    move/from16 v49, v0

    move/from16 v0, v49

    if-ne v0, v4, :cond_31

    .line 537
    if-eqz v41, :cond_30

    const/16 v49, 0x1

    :goto_1a
    sub-int v18, v22, v49

    .line 538
    goto/16 :goto_14

    .line 531
    .end local v4    # "afterID":I
    .end local v22    # "j":I
    .end local v41    # "prevIsDate":Z
    :cond_2e
    const v49, 0x7fffffff

    goto/16 :goto_17

    .line 535
    .restart local v4    # "afterID":I
    .restart local v22    # "j":I
    :cond_2f
    const/16 v41, 0x0

    goto :goto_19

    .line 537
    .restart local v41    # "prevIsDate":Z
    :cond_30
    const/16 v49, 0x0

    goto :goto_1a

    .line 534
    :cond_31
    add-int/lit8 v22, v22, 0x1

    goto :goto_18

    .line 543
    .end local v4    # "afterID":I
    .end local v22    # "j":I
    .end local v41    # "prevIsDate":Z
    :cond_32
    move-object/from16 v0, v24

    iget v0, v0, Lcom/vkontakte/android/Message;->id:I

    move/from16 v49, v0

    if-lez v49, :cond_33

    move-object/from16 v0, v24

    iget v0, v0, Lcom/vkontakte/android/Message;->id:I

    move/from16 v40, v0

    .line 529
    :goto_1b
    add-int/lit8 v14, v14, -0x1

    goto/16 :goto_16

    .line 543
    :cond_33
    const v40, 0x7fffffff

    goto :goto_1b

    .line 553
    .end local v14    # "i":I
    .end local v24    # "lm":Lcom/vkontakte/android/Message;
    .end local v25    # "lmx":Lcom/vkontakte/android/Message;
    .end local v40    # "prevID":I
    .restart local v13    # "fwdUidSet":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    :cond_34
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$100(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;

    move-result-object v49

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v50, v0

    invoke-static/range {v26 .. v26}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v51

    move-object/from16 v0, v50

    move-object/from16 v1, v51

    invoke-static {v0, v1, v13}, Lcom/vkontakte/android/ui/holder/messages/MessageListItemHelper;->buildItems(Lcom/vkontakte/android/ui/holder/messages/MessageListItemHelper$MessageListItemHelperProvider;Ljava/util/List;Ljava/util/Set;)Ljava/util/ArrayList;

    move-result-object v50

    move-object/from16 v0, v49

    move/from16 v1, v18

    move-object/from16 v2, v50

    invoke-virtual {v0, v1, v2}, Ljava/util/ArrayList;->addAll(ILjava/util/Collection;)Z

    .line 554
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$100(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;

    move-result-object v49

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/ui/holder/messages/MessageListItemHelper;->fixTimes(Ljava/util/List;)I

    goto/16 :goto_15

    .line 564
    .end local v13    # "fwdUidSet":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    .end local v18    # "insertAt":I
    .end local v19    # "isFound":Z
    .end local v26    # "m":Lcom/vkontakte/android/Message;
    .end local v44    # "toRemoveItem":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/ui/holder/messages/MessageListItem;>;"
    .end local v45    # "toRemoveMsg":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/Message;>;"
    :pswitch_8
    const-string/jumbo v49, "uid"

    const/16 v50, 0x0

    move-object/from16 v0, p2

    move-object/from16 v1, v49

    move/from16 v2, v50

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v46

    .line 565
    .local v46, "uid":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$300(Lcom/vkontakte/android/fragments/messages/ChatFragment;)I

    move-result v49

    move/from16 v0, v46

    move/from16 v1, v49

    if-ne v0, v1, :cond_0

    .line 566
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$300(Lcom/vkontakte/android/fragments/messages/ChatFragment;)I

    move-result v49

    const v50, 0x77359400

    move/from16 v0, v49

    move/from16 v1, v50

    if-ge v0, v1, :cond_37

    .line 567
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$300(Lcom/vkontakte/android/fragments/messages/ChatFragment;)I

    move-result v46

    .line 571
    :goto_1c
    const-string/jumbo v49, "stop"

    const/16 v50, 0x0

    move-object/from16 v0, p2

    move-object/from16 v1, v49

    move/from16 v2, v50

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v49

    if-nez v49, :cond_38

    .line 572
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$1800(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;

    move-result-object v49

    invoke-static/range {v46 .. v46}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v50

    invoke-virtual/range {v49 .. v50}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v49

    if-nez v49, :cond_35

    .line 573
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$1800(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;

    move-result-object v49

    invoke-static/range {v46 .. v46}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v50

    invoke-virtual/range {v49 .. v50}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 578
    :cond_35
    :goto_1d
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$1900(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Landroid/util/SparseArray;

    move-result-object v49

    move-object/from16 v0, v49

    move/from16 v1, v46

    invoke-static {v0, v1}, Lcom/vkontakte/android/utils/Utils;->containsKey(Landroid/util/SparseArray;I)Z

    move-result v49

    if-nez v49, :cond_36

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$1900(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Landroid/util/SparseArray;

    move-result-object v49

    invoke-virtual/range {v49 .. v49}, Landroid/util/SparseArray;->size()I

    move-result v49

    if-lez v49, :cond_36

    .line 579
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    const/16 v50, 0x1

    invoke-static/range {v49 .. v50}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$800(Lcom/vkontakte/android/fragments/messages/ChatFragment;Z)V

    .line 581
    :cond_36
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$2000(Lcom/vkontakte/android/fragments/messages/ChatFragment;)V

    goto/16 :goto_0

    .line 569
    :cond_37
    const-string/jumbo v49, "user"

    const/16 v50, 0x0

    move-object/from16 v0, p2

    move-object/from16 v1, v49

    move/from16 v2, v50

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v46

    goto :goto_1c

    .line 576
    :cond_38
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$1800(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;

    move-result-object v49

    invoke-static/range {v46 .. v46}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v50

    invoke-virtual/range {v49 .. v50}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    goto :goto_1d

    .line 586
    .end local v46    # "uid":I
    :pswitch_9
    const-string/jumbo v49, "uid"

    const/16 v50, 0x0

    move-object/from16 v0, p2

    move-object/from16 v1, v49

    move/from16 v2, v50

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v46

    .line 587
    .restart local v46    # "uid":I
    const-string/jumbo v49, "online"

    const/16 v50, 0x0

    move-object/from16 v0, p2

    move-object/from16 v1, v49

    move/from16 v2, v50

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v36

    .line 588
    .local v36, "online":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$300(Lcom/vkontakte/android/fragments/messages/ChatFragment;)I

    move-result v49

    move/from16 v0, v46

    move/from16 v1, v49

    if-ne v0, v1, :cond_0

    .line 589
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    move-object/from16 v0, v49

    move/from16 v1, v36

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$2100(Lcom/vkontakte/android/fragments/messages/ChatFragment;I)V

    goto/16 :goto_0

    .line 594
    .end local v36    # "online":I
    .end local v46    # "uid":I
    :pswitch_a
    const-string/jumbo v49, "oldID"

    const/16 v50, 0x0

    move-object/from16 v0, p2

    move-object/from16 v1, v49

    move/from16 v2, v50

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v29

    .line 595
    .restart local v29    # "mid":I
    const-string/jumbo v49, "newID"

    const/16 v50, 0x0

    move-object/from16 v0, p2

    move-object/from16 v1, v49

    move/from16 v2, v50

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v35

    .line 596
    .local v35, "nid":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$000(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;

    move-result-object v49

    invoke-virtual/range {v49 .. v49}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v49

    :cond_39
    invoke-interface/range {v49 .. v49}, Ljava/util/Iterator;->hasNext()Z

    move-result v50

    if-eqz v50, :cond_3a

    invoke-interface/range {v49 .. v49}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v26

    check-cast v26, Lcom/vkontakte/android/Message;

    .line 597
    .restart local v26    # "m":Lcom/vkontakte/android/Message;
    move-object/from16 v0, v26

    iget v0, v0, Lcom/vkontakte/android/Message;->id:I

    move/from16 v50, v0

    move/from16 v0, v50

    move/from16 v1, v29

    if-ne v0, v1, :cond_39

    .line 598
    const-string/jumbo v49, "vk"

    new-instance v50, Ljava/lang/StringBuilder;

    invoke-direct/range {v50 .. v50}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v51, "set msg id "

    invoke-virtual/range {v50 .. v51}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v50

    move-object/from16 v0, v50

    move/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v50

    const-string/jumbo v51, " -> "

    invoke-virtual/range {v50 .. v51}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v50

    move-object/from16 v0, v50

    move/from16 v1, v35

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v50

    invoke-virtual/range {v50 .. v50}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v50

    invoke-static/range {v49 .. v50}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 599
    move/from16 v0, v35

    move-object/from16 v1, v26

    iput v0, v1, Lcom/vkontakte/android/Message;->id:I

    .line 600
    invoke-static {}, Lcom/vkontakte/android/TimeUtils;->getCurrentTime()I

    move-result v49

    move/from16 v0, v49

    move-object/from16 v1, v26

    iput v0, v1, Lcom/vkontakte/android/Message;->time:I

    .line 604
    .end local v26    # "m":Lcom/vkontakte/android/Message;
    :cond_3a
    new-instance v32, Ljava/util/ArrayList;

    invoke-direct/range {v32 .. v32}, Ljava/util/ArrayList;-><init>()V

    .line 605
    .local v32, "msgItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/ui/holder/messages/MessageListItem;>;"
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$100(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;

    move-result-object v49

    invoke-virtual/range {v49 .. v49}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v49

    :cond_3b
    :goto_1e
    invoke-interface/range {v49 .. v49}, Ljava/util/Iterator;->hasNext()Z

    move-result v50

    if-eqz v50, :cond_3c

    invoke-interface/range {v49 .. v49}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;

    .line 606
    .restart local v20    # "item":Lcom/vkontakte/android/ui/holder/messages/MessageListItem;
    move-object/from16 v0, v20

    iget v0, v0, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->msgId:I

    move/from16 v50, v0

    move/from16 v0, v50

    move/from16 v1, v29

    if-ne v0, v1, :cond_3b

    .line 607
    move/from16 v0, v35

    move-object/from16 v1, v20

    iput v0, v1, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->msgId:I

    .line 608
    const/16 v50, 0x1

    move-object/from16 v0, v20

    move/from16 v1, v50

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->updateHolder(Z)V

    .line 609
    move-object/from16 v0, v32

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1e

    .line 613
    .end local v20    # "item":Lcom/vkontakte/android/ui/holder/messages/MessageListItem;
    :cond_3c
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$100(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;

    move-result-object v49

    move-object/from16 v0, v49

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->removeAll(Ljava/util/Collection;)Z

    .line 614
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$100(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;

    move-result-object v49

    move-object/from16 v0, v49

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 616
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$200(Lcom/vkontakte/android/fragments/messages/ChatFragment;)V

    .line 618
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$300(Lcom/vkontakte/android/fragments/messages/ChatFragment;)I

    move-result v49

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/auth/VKAccountManager;->isCurrentUser(I)Z

    move-result v49

    if-eqz v49, :cond_3d

    .line 619
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    const/16 v50, 0x0

    invoke-virtual/range {v49 .. v50}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->showTyping(Z)V

    .line 621
    :cond_3d
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$1400(Lcom/vkontakte/android/fragments/messages/ChatFragment;)V

    goto/16 :goto_0

    .line 625
    .end local v29    # "mid":I
    .end local v32    # "msgItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/ui/holder/messages/MessageListItem;>;"
    .end local v35    # "nid":I
    :pswitch_b
    const-string/jumbo v49, "id"

    const/16 v50, 0x0

    move-object/from16 v0, p2

    move-object/from16 v1, v49

    move/from16 v2, v50

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v15

    .line 626
    .local v15, "id":I
    const/16 v33, 0x0

    .line 627
    .local v33, "needUpdate":Z
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$100(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;

    move-result-object v49

    invoke-virtual/range {v49 .. v49}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v50

    :cond_3e
    :goto_1f
    invoke-interface/range {v50 .. v50}, Ljava/util/Iterator;->hasNext()Z

    move-result v49

    if-eqz v49, :cond_42

    invoke-interface/range {v50 .. v50}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;

    .line 628
    .restart local v20    # "item":Lcom/vkontakte/android/ui/holder/messages/MessageListItem;
    const/4 v14, 0x0

    .restart local v14    # "i":I
    :goto_20
    invoke-virtual/range {v20 .. v20}, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->getOrCreateAttachments()Ljava/util/List;

    move-result-object v49

    invoke-interface/range {v49 .. v49}, Ljava/util/List;->size()I

    move-result v49

    move/from16 v0, v49

    if-ge v14, v0, :cond_3e

    .line 629
    invoke-virtual/range {v20 .. v20}, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->getOrCreateAttachments()Ljava/util/List;

    move-result-object v49

    move-object/from16 v0, v49

    invoke-interface {v0, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/vkontakte/android/attachments/Attachment;

    .line 630
    .local v3, "a":Lcom/vkontakte/android/attachments/Attachment;
    instance-of v0, v3, Lcom/vkontakte/android/attachments/PendingAttachment;

    move/from16 v49, v0

    if-eqz v49, :cond_41

    move-object/from16 v49, v3

    check-cast v49, Lcom/vkontakte/android/attachments/PendingAttachment;

    invoke-interface/range {v49 .. v49}, Lcom/vkontakte/android/attachments/PendingAttachment;->getUploadId()I

    move-result v49

    move/from16 v0, v49

    if-ne v0, v15, :cond_41

    .line 632
    instance-of v0, v3, Lcom/vkontakte/android/attachments/PendingVideoAttachment;

    move/from16 v49, v0

    if-eqz v49, :cond_3f

    .line 633
    new-instance v38, Lcom/vkontakte/android/attachments/VideoAttachment;

    const-string/jumbo v49, "result"

    move-object/from16 v0, p2

    move-object/from16 v1, v49

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v49

    check-cast v49, Lcom/vkontakte/android/api/VideoFile;

    move-object/from16 v0, v38

    move-object/from16 v1, v49

    invoke-direct {v0, v1}, Lcom/vkontakte/android/attachments/VideoAttachment;-><init>(Lcom/vkontakte/android/api/VideoFile;)V

    .line 639
    .local v38, "pendingAttachment":Lcom/vkontakte/android/attachments/Attachment;
    :goto_21
    move-object/from16 v0, v20

    move-object/from16 v1, v38

    invoke-virtual {v0, v14, v1}, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->setAttachment(ILcom/vkontakte/android/attachments/Attachment;)V

    .line 640
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    move-object/from16 v0, v20

    move-object/from16 v1, v49

    invoke-static {v0, v1}, Lcom/vkontakte/android/ui/holder/messages/MessageListItemHelper;->processZhukovLayout(Lcom/vkontakte/android/ui/holder/messages/MessageListItem;Lcom/vkontakte/android/ui/holder/messages/MessageListItemHelper$MessageListItemHelperProvider;)V

    .line 641
    const/16 v33, 0x1

    .line 642
    goto :goto_1f

    .line 634
    .end local v38    # "pendingAttachment":Lcom/vkontakte/android/attachments/Attachment;
    :cond_3f
    instance-of v0, v3, Lcom/vkontakte/android/attachments/PendingAudioAttachment;

    move/from16 v49, v0

    if-eqz v49, :cond_40

    .line 635
    new-instance v38, Lcom/vkontakte/android/attachments/AudioAttachment;

    const-string/jumbo v49, "result"

    move-object/from16 v0, p2

    move-object/from16 v1, v49

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v49

    check-cast v49, Lcom/vkontakte/android/audio/MusicTrack;

    move-object/from16 v0, v38

    move-object/from16 v1, v49

    invoke-direct {v0, v1}, Lcom/vkontakte/android/attachments/AudioAttachment;-><init>(Lcom/vkontakte/android/audio/MusicTrack;)V

    .restart local v38    # "pendingAttachment":Lcom/vkontakte/android/attachments/Attachment;
    goto :goto_21

    .line 637
    .end local v38    # "pendingAttachment":Lcom/vkontakte/android/attachments/Attachment;
    :cond_40
    const-string/jumbo v49, "result"

    move-object/from16 v0, p2

    move-object/from16 v1, v49

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v38

    check-cast v38, Lcom/vkontakte/android/attachments/Attachment;

    .restart local v38    # "pendingAttachment":Lcom/vkontakte/android/attachments/Attachment;
    goto :goto_21

    .line 628
    .end local v38    # "pendingAttachment":Lcom/vkontakte/android/attachments/Attachment;
    :cond_41
    add-int/lit8 v14, v14, 0x1

    goto/16 :goto_20

    .line 646
    .end local v3    # "a":Lcom/vkontakte/android/attachments/Attachment;
    .end local v14    # "i":I
    .end local v20    # "item":Lcom/vkontakte/android/ui/holder/messages/MessageListItem;
    :cond_42
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$000(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;

    move-result-object v49

    invoke-virtual/range {v49 .. v49}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v50

    :cond_43
    invoke-interface/range {v50 .. v50}, Ljava/util/Iterator;->hasNext()Z

    move-result v49

    if-eqz v49, :cond_45

    invoke-interface/range {v50 .. v50}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v26

    check-cast v26, Lcom/vkontakte/android/Message;

    .line 647
    .restart local v26    # "m":Lcom/vkontakte/android/Message;
    const/4 v14, 0x0

    .restart local v14    # "i":I
    :goto_22
    move-object/from16 v0, v26

    iget-object v0, v0, Lcom/vkontakte/android/Message;->attachments:Ljava/util/List;

    move-object/from16 v49, v0

    invoke-interface/range {v49 .. v49}, Ljava/util/List;->size()I

    move-result v49

    move/from16 v0, v49

    if-ge v14, v0, :cond_44

    .line 648
    move-object/from16 v0, v26

    iget-object v0, v0, Lcom/vkontakte/android/Message;->attachments:Ljava/util/List;

    move-object/from16 v49, v0

    move-object/from16 v0, v49

    invoke-interface {v0, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/vkontakte/android/attachments/Attachment;

    .line 649
    .restart local v3    # "a":Lcom/vkontakte/android/attachments/Attachment;
    instance-of v0, v3, Lcom/vkontakte/android/attachments/PendingAttachment;

    move/from16 v49, v0

    if-eqz v49, :cond_48

    move-object/from16 v49, v3

    check-cast v49, Lcom/vkontakte/android/attachments/PendingAttachment;

    invoke-interface/range {v49 .. v49}, Lcom/vkontakte/android/attachments/PendingAttachment;->getUploadId()I

    move-result v49

    move/from16 v0, v49

    if-ne v0, v15, :cond_48

    .line 651
    instance-of v0, v3, Lcom/vkontakte/android/attachments/PendingVideoAttachment;

    move/from16 v49, v0

    if-eqz v49, :cond_46

    .line 652
    new-instance v38, Lcom/vkontakte/android/attachments/VideoAttachment;

    const-string/jumbo v49, "result"

    move-object/from16 v0, p2

    move-object/from16 v1, v49

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v49

    check-cast v49, Lcom/vkontakte/android/api/VideoFile;

    move-object/from16 v0, v38

    move-object/from16 v1, v49

    invoke-direct {v0, v1}, Lcom/vkontakte/android/attachments/VideoAttachment;-><init>(Lcom/vkontakte/android/api/VideoFile;)V

    .line 658
    .restart local v38    # "pendingAttachment":Lcom/vkontakte/android/attachments/Attachment;
    :goto_23
    move-object/from16 v0, v26

    iget-object v0, v0, Lcom/vkontakte/android/Message;->attachments:Ljava/util/List;

    move-object/from16 v49, v0

    move-object/from16 v0, v49

    move-object/from16 v1, v38

    invoke-interface {v0, v14, v1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 659
    move-object/from16 v0, v26

    iget-object v0, v0, Lcom/vkontakte/android/Message;->attachments:Ljava/util/List;

    move-object/from16 v49, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v51, v0

    move-object/from16 v0, v49

    move-object/from16 v1, v51

    invoke-static {v0, v1}, Lcom/vkontakte/android/ui/holder/messages/MessageListItemHelper;->processZhukovLayout(Ljava/util/List;Lcom/vkontakte/android/ui/holder/messages/MessageListItemHelper$MessageListItemHelperProvider;)V

    .line 660
    const/16 v33, 0x1

    .line 664
    .end local v3    # "a":Lcom/vkontakte/android/attachments/Attachment;
    .end local v38    # "pendingAttachment":Lcom/vkontakte/android/attachments/Attachment;
    :cond_44
    if-eqz v33, :cond_43

    .line 668
    .end local v14    # "i":I
    .end local v26    # "m":Lcom/vkontakte/android/Message;
    :cond_45
    if-eqz v33, :cond_0

    .line 669
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$200(Lcom/vkontakte/android/fragments/messages/ChatFragment;)V

    goto/16 :goto_0

    .line 653
    .restart local v3    # "a":Lcom/vkontakte/android/attachments/Attachment;
    .restart local v14    # "i":I
    .restart local v26    # "m":Lcom/vkontakte/android/Message;
    :cond_46
    instance-of v0, v3, Lcom/vkontakte/android/attachments/PendingAudioAttachment;

    move/from16 v49, v0

    if-eqz v49, :cond_47

    .line 654
    new-instance v38, Lcom/vkontakte/android/attachments/AudioAttachment;

    const-string/jumbo v49, "result"

    move-object/from16 v0, p2

    move-object/from16 v1, v49

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v49

    check-cast v49, Lcom/vkontakte/android/audio/MusicTrack;

    move-object/from16 v0, v38

    move-object/from16 v1, v49

    invoke-direct {v0, v1}, Lcom/vkontakte/android/attachments/AudioAttachment;-><init>(Lcom/vkontakte/android/audio/MusicTrack;)V

    .restart local v38    # "pendingAttachment":Lcom/vkontakte/android/attachments/Attachment;
    goto :goto_23

    .line 656
    .end local v38    # "pendingAttachment":Lcom/vkontakte/android/attachments/Attachment;
    :cond_47
    const-string/jumbo v49, "result"

    move-object/from16 v0, p2

    move-object/from16 v1, v49

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v38

    check-cast v38, Lcom/vkontakte/android/attachments/Attachment;

    .restart local v38    # "pendingAttachment":Lcom/vkontakte/android/attachments/Attachment;
    goto :goto_23

    .line 647
    .end local v38    # "pendingAttachment":Lcom/vkontakte/android/attachments/Attachment;
    :cond_48
    add-int/lit8 v14, v14, 0x1

    goto/16 :goto_22

    .line 674
    .end local v3    # "a":Lcom/vkontakte/android/attachments/Attachment;
    .end local v14    # "i":I
    .end local v15    # "id":I
    .end local v26    # "m":Lcom/vkontakte/android/Message;
    .end local v33    # "needUpdate":Z
    :pswitch_c
    const-string/jumbo v49, "id"

    const/16 v50, 0x0

    move-object/from16 v0, p2

    move-object/from16 v1, v49

    move/from16 v2, v50

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v15

    .line 675
    .restart local v15    # "id":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$000(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;

    move-result-object v49

    invoke-virtual/range {v49 .. v49}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v49

    :cond_49
    invoke-interface/range {v49 .. v49}, Ljava/util/Iterator;->hasNext()Z

    move-result v50

    if-eqz v50, :cond_4a

    invoke-interface/range {v49 .. v49}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v26

    check-cast v26, Lcom/vkontakte/android/Message;

    .line 676
    .restart local v26    # "m":Lcom/vkontakte/android/Message;
    move-object/from16 v0, v26

    iget v0, v0, Lcom/vkontakte/android/Message;->id:I

    move/from16 v50, v0

    move/from16 v0, v50

    if-ne v0, v15, :cond_49

    .line 677
    const/16 v49, 0x1

    move/from16 v0, v49

    move-object/from16 v1, v26

    iput-boolean v0, v1, Lcom/vkontakte/android/Message;->sendFailed:Z

    .line 681
    .end local v26    # "m":Lcom/vkontakte/android/Message;
    :cond_4a
    const/4 v14, 0x0

    .restart local v14    # "i":I
    :goto_24
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$100(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;

    move-result-object v49

    invoke-virtual/range {v49 .. v49}, Ljava/util/ArrayList;->size()I

    move-result v49

    move/from16 v0, v49

    if-ge v14, v0, :cond_0

    .line 682
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$100(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;

    move-result-object v49

    move-object/from16 v0, v49

    invoke-virtual {v0, v14}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;

    .line 683
    .restart local v20    # "item":Lcom/vkontakte/android/ui/holder/messages/MessageListItem;
    move-object/from16 v0, v20

    iget v0, v0, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->msgId:I

    move/from16 v49, v0

    move/from16 v0, v49

    if-ne v0, v15, :cond_4e

    move-object/from16 v0, v20

    iget v0, v0, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->type:I

    move/from16 v49, v0

    const/16 v50, 0x1

    move/from16 v0, v49

    move/from16 v1, v50

    if-eq v0, v1, :cond_4b

    move-object/from16 v0, v20

    iget v0, v0, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->type:I

    move/from16 v49, v0

    const/16 v50, 0x4

    move/from16 v0, v49

    move/from16 v1, v50

    if-ne v0, v1, :cond_4e

    .line 684
    :cond_4b
    const-string/jumbo v49, "privacy"

    const/16 v50, 0x0

    move-object/from16 v0, p2

    move-object/from16 v1, v49

    move/from16 v2, v50

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v49

    if-nez v49, :cond_4c

    .line 685
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-virtual/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getActivity()Landroid/app/Activity;

    move-result-object v49

    const v50, 0x7f080394

    const/16 v51, 0x0

    invoke-static/range {v49 .. v51}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v49

    invoke-virtual/range {v49 .. v49}, Landroid/widget/Toast;->show()V

    .line 690
    :goto_25
    const/16 v49, 0x1

    move/from16 v0, v49

    move-object/from16 v1, v20

    iput-boolean v0, v1, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->isFailed:Z

    .line 692
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$400(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Lcom/vkontakte/android/ui/widget/ChatRecyclerView;

    move-result-object v49

    if-nez v49, :cond_4d

    const/16 v47, 0x0

    .line 693
    .restart local v47    # "viewHolder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    :goto_26
    move-object/from16 v0, v47

    instance-of v0, v0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;

    move/from16 v49, v0

    if-eqz v49, :cond_0

    .line 694
    check-cast v47, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;

    .end local v47    # "viewHolder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    invoke-virtual/range {v47 .. v47}, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;->showFailed()V

    goto/16 :goto_0

    .line 687
    :cond_4c
    new-instance v49, Lcom/vkontakte/android/VKAlertDialog$Builder;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v50, v0

    invoke-virtual/range {v50 .. v50}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getActivity()Landroid/app/Activity;

    move-result-object v50

    invoke-direct/range {v49 .. v50}, Lcom/vkontakte/android/VKAlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v50, 0x7f080399

    invoke-virtual/range {v49 .. v50}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v49

    const v50, 0x7f080398

    .line 688
    invoke-virtual/range {v49 .. v50}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v49

    const v50, 0x7f080479

    const/16 v51, 0x0

    invoke-virtual/range {v49 .. v51}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v49

    invoke-virtual/range {v49 .. v49}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto :goto_25

    .line 692
    :cond_4d
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$400(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Lcom/vkontakte/android/ui/widget/ChatRecyclerView;

    move-result-object v49

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v50, v0

    invoke-static/range {v50 .. v50}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$500(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Lcom/vkontakte/android/ui/adapters/MessagesAdapter;

    move-result-object v50

    invoke-virtual/range {v50 .. v50}, Lcom/vkontakte/android/ui/adapters/MessagesAdapter;->getHeaderViewsCount()I

    move-result v50

    add-int v50, v50, v14

    invoke-virtual/range {v49 .. v50}, Lcom/vkontakte/android/ui/widget/ChatRecyclerView;->findViewHolderForAdapterPosition(I)Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;

    move-result-object v47

    goto :goto_26

    .line 681
    :cond_4e
    add-int/lit8 v14, v14, 0x1

    goto/16 :goto_24

    .line 702
    .end local v14    # "i":I
    .end local v15    # "id":I
    .end local v20    # "item":Lcom/vkontakte/android/ui/holder/messages/MessageListItem;
    :pswitch_d
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$300(Lcom/vkontakte/android/fragments/messages/ChatFragment;)I

    move-result v49

    const v50, 0x77359400

    move/from16 v0, v49

    move/from16 v1, v50

    if-le v0, v1, :cond_4f

    .line 703
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    const/16 v50, 0x0

    invoke-static/range {v49 .. v50}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$800(Lcom/vkontakte/android/fragments/messages/ChatFragment;Z)V

    .line 705
    :cond_4f
    const-string/jumbo v49, "no_refresh_chat"

    move-object/from16 v0, p2

    move-object/from16 v1, v49

    invoke-virtual {v0, v1}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v49

    if-nez v49, :cond_0

    .line 708
    const-string/jumbo v49, "reload_chats"

    move-object/from16 v0, p2

    move-object/from16 v1, v49

    invoke-virtual {v0, v1}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v49

    if-eqz v49, :cond_56

    .line 709
    const-string/jumbo v49, "reload_chats"

    move-object/from16 v0, p2

    move-object/from16 v1, v49

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getIntegerArrayListExtra(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v7

    .line 710
    .local v7, "cids":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    const/4 v12, 0x0

    .line 711
    .local v12, "found":Z
    invoke-virtual {v7}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v50

    :cond_50
    invoke-interface/range {v50 .. v50}, Ljava/util/Iterator;->hasNext()Z

    move-result v49

    if-eqz v49, :cond_51

    invoke-interface/range {v50 .. v50}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v49

    check-cast v49, Ljava/lang/Integer;

    invoke-virtual/range {v49 .. v49}, Ljava/lang/Integer;->intValue()I

    move-result v6

    .line 712
    .local v6, "cid":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$300(Lcom/vkontakte/android/fragments/messages/ChatFragment;)I

    move-result v49

    move/from16 v0, v49

    if-ne v6, v0, :cond_50

    .line 713
    const/4 v12, 0x1

    .line 717
    .end local v6    # "cid":I
    :cond_51
    if-nez v12, :cond_56

    .line 718
    const-string/jumbo v49, "marked_as_read"

    move-object/from16 v0, p2

    move-object/from16 v1, v49

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getIntegerArrayListExtra(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v27

    .line 719
    .local v27, "markedAsRead":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    const-string/jumbo v49, "marked_as_unread"

    move-object/from16 v0, p2

    move-object/from16 v1, v49

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getIntegerArrayListExtra(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v28

    .line 720
    .local v28, "markedAsUnread":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    const-string/jumbo v49, "deleted"

    move-object/from16 v0, p2

    move-object/from16 v1, v49

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getIntegerArrayListExtra(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v10

    .line 721
    .local v10, "deleted":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$000(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;

    move-result-object v49

    invoke-virtual/range {v49 .. v49}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v21

    .line 722
    .local v21, "itr":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/vkontakte/android/Message;>;"
    :cond_52
    :goto_27
    invoke-interface/range {v21 .. v21}, Ljava/util/Iterator;->hasNext()Z

    move-result v49

    if-eqz v49, :cond_55

    .line 723
    invoke-interface/range {v21 .. v21}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v26

    check-cast v26, Lcom/vkontakte/android/Message;

    .line 724
    .restart local v26    # "m":Lcom/vkontakte/android/Message;
    move-object/from16 v0, v26

    iget v0, v0, Lcom/vkontakte/android/Message;->id:I

    move/from16 v49, v0

    invoke-static/range {v49 .. v49}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v49

    move-object/from16 v0, v49

    invoke-virtual {v10, v0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v49

    if-eqz v49, :cond_53

    .line 725
    invoke-interface/range {v21 .. v21}, Ljava/util/Iterator;->remove()V

    goto :goto_27

    .line 728
    :cond_53
    move-object/from16 v0, v26

    iget v0, v0, Lcom/vkontakte/android/Message;->id:I

    move/from16 v49, v0

    invoke-static/range {v49 .. v49}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v49

    move-object/from16 v0, v27

    move-object/from16 v1, v49

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v49

    if-eqz v49, :cond_54

    .line 729
    const/16 v49, 0x1

    move/from16 v0, v49

    move-object/from16 v1, v26

    iput-boolean v0, v1, Lcom/vkontakte/android/Message;->readState:Z

    .line 731
    :cond_54
    move-object/from16 v0, v26

    iget v0, v0, Lcom/vkontakte/android/Message;->id:I

    move/from16 v49, v0

    invoke-static/range {v49 .. v49}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v49

    move-object/from16 v0, v28

    move-object/from16 v1, v49

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v49

    if-eqz v49, :cond_52

    .line 732
    const/16 v49, 0x0

    move/from16 v0, v49

    move-object/from16 v1, v26

    iput-boolean v0, v1, Lcom/vkontakte/android/Message;->readState:Z

    goto :goto_27

    .line 735
    .end local v26    # "m":Lcom/vkontakte/android/Message;
    :cond_55
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$2200(Lcom/vkontakte/android/fragments/messages/ChatFragment;)V

    .line 736
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$200(Lcom/vkontakte/android/fragments/messages/ChatFragment;)V

    goto/16 :goto_0

    .line 740
    .end local v7    # "cids":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    .end local v10    # "deleted":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    .end local v12    # "found":Z
    .end local v21    # "itr":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/vkontakte/android/Message;>;"
    .end local v27    # "markedAsRead":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    .end local v28    # "markedAsUnread":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    :cond_56
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    const/16 v50, 0x0

    invoke-static/range {v49 .. v50}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$2302(Lcom/vkontakte/android/fragments/messages/ChatFragment;Z)Z

    .line 741
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$000(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;

    move-result-object v49

    invoke-virtual/range {v49 .. v49}, Ljava/util/ArrayList;->clear()V

    .line 742
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$100(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;

    move-result-object v49

    invoke-virtual/range {v49 .. v49}, Ljava/util/ArrayList;->clear()V

    .line 743
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$2400(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;

    move-result-object v49

    invoke-virtual/range {v49 .. v49}, Ljava/util/ArrayList;->clear()V

    .line 744
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$2500(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;

    move-result-object v49

    invoke-virtual/range {v49 .. v49}, Ljava/util/ArrayList;->clear()V

    .line 745
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    const/16 v50, 0x0

    invoke-static/range {v49 .. v50}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$2602(Lcom/vkontakte/android/fragments/messages/ChatFragment;Z)Z

    .line 746
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$200(Lcom/vkontakte/android/fragments/messages/ChatFragment;)V

    .line 747
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$2700(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Landroid/widget/ProgressBar;

    move-result-object v49

    const/16 v50, 0x0

    invoke-static/range {v49 .. v50}, Lcom/vkontakte/android/ViewUtils;->setVisibility(Landroid/view/View;I)V

    .line 748
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$2800(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Lcom/vkontakte/android/ui/widget/MessagesTimesList;

    move-result-object v49

    const/16 v50, 0x8

    invoke-static/range {v49 .. v50}, Lcom/vkontakte/android/ViewUtils;->setVisibility(Landroid/view/View;I)V

    .line 749
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    const/16 v50, 0x1

    invoke-static/range {v49 .. v50}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$2900(Lcom/vkontakte/android/fragments/messages/ChatFragment;Z)V

    goto/16 :goto_0

    .line 753
    :pswitch_e
    const-string/jumbo v49, "did"

    const/16 v50, 0x0

    move-object/from16 v0, p2

    move-object/from16 v1, v49

    move/from16 v2, v50

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v11

    .line 754
    .local v11, "did":I
    const-string/jumbo v49, "msg_id"

    const/16 v50, 0x0

    move-object/from16 v0, p2

    move-object/from16 v1, v49

    move/from16 v2, v50

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v31

    .line 755
    .local v31, "msgId":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    move-object/from16 v0, v49

    move/from16 v1, v31

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$3000(Lcom/vkontakte/android/fragments/messages/ChatFragment;I)Landroid/support/v4/util/Pair;

    move-result-object v9

    .line 756
    .local v9, "current":Landroid/support/v4/util/Pair;, "Landroid/support/v4/util/Pair<Lcom/vkontakte/android/Message;Ljava/lang/Integer;>;"
    if-eqz v9, :cond_0

    .line 757
    iget-object v8, v9, Landroid/support/v4/util/Pair;->first:Ljava/lang/Object;

    check-cast v8, Lcom/vkontakte/android/Message;

    .line 758
    .local v8, "curMsg":Lcom/vkontakte/android/Message;
    iget-object v0, v9, Landroid/support/v4/util/Pair;->second:Ljava/lang/Object;

    move-object/from16 v49, v0

    check-cast v49, Ljava/lang/Integer;

    invoke-virtual/range {v49 .. v49}, Ljava/lang/Integer;->intValue()I

    move-result v17

    .line 759
    .local v17, "index":I
    if-eqz v8, :cond_0

    .line 760
    iget-object v0, v8, Lcom/vkontakte/android/Message;->fwdMessages:Ljava/util/List;

    move-object/from16 v49, v0

    invoke-interface/range {v49 .. v49}, Ljava/util/List;->isEmpty()Z

    move-result v49

    if-eqz v49, :cond_58

    .line 761
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$000(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;

    move-result-object v49

    invoke-virtual/range {v49 .. v49}, Ljava/util/ArrayList;->size()I

    move-result v49

    add-int/lit8 v50, v17, 0x1

    move/from16 v0, v49

    move/from16 v1, v50

    if-le v0, v1, :cond_5d

    .line 762
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-static/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$000(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;

    move-result-object v49

    add-int/lit8 v50, v17, 0x1

    invoke-virtual/range {v49 .. v50}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v34

    check-cast v34, Lcom/vkontakte/android/Message;

    .line 763
    .local v34, "nextMsg":Lcom/vkontakte/android/Message;
    if-eqz v34, :cond_5d

    .line 764
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    move-object/from16 v0, v49

    move-object/from16 v1, v34

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$3100(Lcom/vkontakte/android/fragments/messages/ChatFragment;Lcom/vkontakte/android/Message;)Z

    move-result v49

    if-eqz v49, :cond_5d

    move-object/from16 v0, v34

    invoke-static {v8, v0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$3200(Lcom/vkontakte/android/Message;Lcom/vkontakte/android/Message;)Z

    move-result v49

    if-nez v49, :cond_5d

    .line 765
    move-object/from16 v0, v34

    iget-object v0, v0, Lcom/vkontakte/android/Message;->attachments:Ljava/util/List;

    move-object/from16 v49, v0

    invoke-interface/range {v49 .. v49}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v49

    :cond_57
    invoke-interface/range {v49 .. v49}, Ljava/util/Iterator;->hasNext()Z

    move-result v50

    if-eqz v50, :cond_5d

    invoke-interface/range {v49 .. v49}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/vkontakte/android/attachments/Attachment;

    .line 766
    .local v5, "att":Lcom/vkontakte/android/attachments/Attachment;
    instance-of v0, v5, Lcom/vkontakte/android/attachments/AudioMessageAttachment;

    move/from16 v50, v0

    if-eqz v50, :cond_57

    .line 767
    check-cast v5, Lcom/vkontakte/android/attachments/AudioMessageAttachment;

    .end local v5    # "att":Lcom/vkontakte/android/attachments/Attachment;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-virtual/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getContext()Landroid/content/Context;

    move-result-object v49

    move-object/from16 v0, v49

    invoke-virtual {v5, v0}, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->play(Landroid/content/Context;)V

    goto/16 :goto_0

    .line 775
    .end local v34    # "nextMsg":Lcom/vkontakte/android/Message;
    :cond_58
    const/16 v39, 0x0

    .line 776
    .local v39, "playNext":Z
    iget-object v0, v8, Lcom/vkontakte/android/Message;->fwdMessages:Ljava/util/List;

    move-object/from16 v49, v0

    invoke-interface/range {v49 .. v49}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v49

    :cond_59
    :goto_28
    invoke-interface/range {v49 .. v49}, Ljava/util/Iterator;->hasNext()Z

    move-result v50

    if-eqz v50, :cond_5d

    invoke-interface/range {v49 .. v49}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v30

    check-cast v30, Lcom/vkontakte/android/Message$FwdMessage;

    .line 777
    .local v30, "msg":Lcom/vkontakte/android/Message$FwdMessage;
    move-object/from16 v0, v30

    iget-object v0, v0, Lcom/vkontakte/android/Message$FwdMessage;->attachments:Ljava/util/List;

    move-object/from16 v50, v0

    invoke-interface/range {v50 .. v50}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v50

    :cond_5a
    invoke-interface/range {v50 .. v50}, Ljava/util/Iterator;->hasNext()Z

    move-result v51

    if-eqz v51, :cond_59

    invoke-interface/range {v50 .. v50}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/vkontakte/android/attachments/Attachment;

    .line 778
    .restart local v5    # "att":Lcom/vkontakte/android/attachments/Attachment;
    instance-of v0, v5, Lcom/vkontakte/android/attachments/AudioMessageAttachment;

    move/from16 v51, v0

    if-eqz v51, :cond_5c

    move-object/from16 v48, v5

    .line 779
    check-cast v48, Lcom/vkontakte/android/attachments/AudioMessageAttachment;

    .line 780
    .local v48, "voice":Lcom/vkontakte/android/attachments/AudioMessageAttachment;
    move-object/from16 v0, v48

    iget v0, v0, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->did:I

    move/from16 v51, v0

    move/from16 v0, v51

    if-ne v0, v11, :cond_5b

    .line 781
    const/16 v39, 0x1

    .line 782
    goto :goto_28

    .line 783
    :cond_5b
    if-eqz v39, :cond_5a

    .line 784
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    move-object/from16 v49, v0

    invoke-virtual/range {v49 .. v49}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getContext()Landroid/content/Context;

    move-result-object v49

    invoke-virtual/range {v48 .. v49}, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->play(Landroid/content/Context;)V

    goto/16 :goto_0

    .line 787
    .end local v48    # "voice":Lcom/vkontakte/android/attachments/AudioMessageAttachment;
    :cond_5c
    if-eqz v39, :cond_5a

    goto/16 :goto_0

    .line 793
    .end local v5    # "att":Lcom/vkontakte/android/attachments/Attachment;
    .end local v30    # "msg":Lcom/vkontakte/android/Message$FwdMessage;
    .end local v39    # "playNext":Z
    :cond_5d
    invoke-static {}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->getInstance()Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    move-result-object v49

    invoke-virtual/range {v49 .. v49}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->startRecordingIfFromSpeaker()V

    goto/16 :goto_0

    .line 333
    nop

    :sswitch_data_0
    .sparse-switch
        -0x7a1c0cb0 -> :sswitch_9
        -0x70047d58 -> :sswitch_d
        -0x67bab9a4 -> :sswitch_4
        -0x4b9ff8f9 -> :sswitch_a
        -0x2c4e4bd4 -> :sswitch_5
        -0xea28fca -> :sswitch_8
        -0xb4f8be3 -> :sswitch_c
        -0x9fe29bc -> :sswitch_3
        0x103688c9 -> :sswitch_6
        0x21b021ed -> :sswitch_2
        0x22c0a493 -> :sswitch_e
        0x2f6c05cb -> :sswitch_1
        0x48be93a1 -> :sswitch_b
        0x68fe87c2 -> :sswitch_0
        0x789c0e30 -> :sswitch_7
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
        :pswitch_7
        :pswitch_8
        :pswitch_9
        :pswitch_a
        :pswitch_b
        :pswitch_c
        :pswitch_d
        :pswitch_e
    .end packed-switch
.end method
