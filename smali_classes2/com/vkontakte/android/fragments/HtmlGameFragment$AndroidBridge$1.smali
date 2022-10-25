.class Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge$1;
.super Ljava/lang/Object;
.source "HtmlGameFragment.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge;->callMethod(Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge;

.field final synthetic val$methodName:Ljava/lang/String;

.field final synthetic val$queryParams:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "this$1"    # Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge;

    .prologue
    .line 173
    iput-object p1, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge$1;->this$1:Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge;

    iput-object p2, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge$1;->val$methodName:Ljava/lang/String;

    iput-object p3, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge$1;->val$queryParams:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 23

    .prologue
    .line 176
    invoke-static {}, Lcom/vkontakte/android/fragments/HtmlGameFragment;->access$000()Ljava/lang/String;

    move-result-object v2

    new-instance v21, Ljava/lang/StringBuilder;

    invoke-direct/range {v21 .. v21}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v22, "methodName = "

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge$1;->val$methodName:Ljava/lang/String;

    move-object/from16 v22, v0

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string/jumbo v22, ", query = "

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge$1;->val$queryParams:Ljava/lang/String;

    move-object/from16 v22, v0

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-static {v2, v0}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 178
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge$1;->this$1:Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge$1;->val$queryParams:Ljava/lang/String;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    invoke-static {v2, v0}, Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge;->access$100(Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge;Ljava/lang/String;)Ljava/util/HashMap;

    move-result-object v15

    .line 180
    .local v15, "paramsMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge$1;->val$methodName:Ljava/lang/String;

    move-object/from16 v21, v0

    const/4 v2, -0x1

    invoke-virtual/range {v21 .. v21}, Ljava/lang/String;->hashCode()I

    move-result v22

    sparse-switch v22, :sswitch_data_0

    :cond_0
    :goto_0
    packed-switch v2, :pswitch_data_0

    .line 259
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v21, "Unknown method passed to callMethod: "

    move-object/from16 v0, v21

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge$1;->val$methodName:Ljava/lang/String;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/vk/core/util/ToastUtils;->showToast(Ljava/lang/String;)V

    .line 263
    :goto_1
    return-void

    .line 180
    :sswitch_0
    const-string/jumbo v22, "showShareBox"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_0

    const/4 v2, 0x0

    goto :goto_0

    :sswitch_1
    const-string/jumbo v22, "showInviteBox"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    :sswitch_2
    const-string/jumbo v22, "showRequestBox"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_0

    const/4 v2, 0x2

    goto :goto_0

    :sswitch_3
    const-string/jumbo v22, "showSettingsBox"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_0

    const/4 v2, 0x3

    goto :goto_0

    :sswitch_4
    const-string/jumbo v22, "showOrderBox"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_0

    const/4 v2, 0x4

    goto :goto_0

    :sswitch_5
    const-string/jumbo v22, "showLeaderboardBox"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_0

    const/4 v2, 0x5

    goto :goto_0

    :sswitch_6
    const-string/jumbo v22, "close"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_0

    const/4 v2, 0x6

    goto :goto_0

    .line 182
    :pswitch_0
    const-string/jumbo v2, "target"

    invoke-virtual {v15, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Ljava/lang/String;

    .line 183
    .local v18, "target":Ljava/lang/String;
    const-string/jumbo v2, "message"

    invoke-virtual {v15, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/String;

    .line 184
    .local v12, "message":Ljava/lang/String;
    const-string/jumbo v2, "attachments"

    invoke-virtual {v15, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    .line 186
    .local v8, "attachments":Ljava/lang/String;
    if-eqz v18, :cond_1

    invoke-virtual/range {v18 .. v18}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 187
    :cond_1
    const-string/jumbo v18, "wall"

    .line 190
    :cond_2
    if-nez v12, :cond_3

    .line 191
    const-string/jumbo v12, ""

    .line 194
    :cond_3
    if-nez v8, :cond_4

    .line 195
    const-string/jumbo v8, ""

    .line 198
    :cond_4
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge$1;->this$1:Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge;

    iget-object v2, v2, Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge;->this$0:Lcom/vkontakte/android/fragments/HtmlGameFragment;

    move-object/from16 v0, v18

    invoke-static {v2, v0, v12, v8}, Lcom/vkontakte/android/fragments/HtmlGameFragment;->access$200(Lcom/vkontakte/android/fragments/HtmlGameFragment;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_1

    .line 201
    .end local v8    # "attachments":Ljava/lang/String;
    .end local v12    # "message":Ljava/lang/String;
    .end local v18    # "target":Ljava/lang/String;
    :pswitch_1
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge$1;->this$1:Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge;

    iget-object v2, v2, Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge;->this$0:Lcom/vkontakte/android/fragments/HtmlGameFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/HtmlGameFragment;->access$300(Lcom/vkontakte/android/fragments/HtmlGameFragment;)V

    goto/16 :goto_1

    .line 204
    :pswitch_2
    const-string/jumbo v2, "message"

    invoke-virtual {v15, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/String;

    .line 205
    .local v13, "msg":Ljava/lang/String;
    const-string/jumbo v2, "uid"

    invoke-virtual {v15, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v19

    .line 206
    .local v19, "uid":I
    const-string/jumbo v2, "requestKey"

    invoke-virtual {v15, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Ljava/lang/String;

    .line 207
    .local v17, "requestKey":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge$1;->this$1:Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge;

    iget-object v2, v2, Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge;->this$0:Lcom/vkontakte/android/fragments/HtmlGameFragment;

    move/from16 v0, v19

    move-object/from16 v1, v17

    invoke-static {v2, v13, v0, v1}, Lcom/vkontakte/android/fragments/HtmlGameFragment;->access$400(Lcom/vkontakte/android/fragments/HtmlGameFragment;Ljava/lang/String;ILjava/lang/String;)V

    goto/16 :goto_1

    .line 210
    .end local v13    # "msg":Ljava/lang/String;
    .end local v17    # "requestKey":Ljava/lang/String;
    .end local v19    # "uid":I
    :pswitch_3
    const-string/jumbo v2, "mask"

    invoke-virtual {v15, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;

    .line 212
    .local v11, "mask":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge$1;->this$1:Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge;

    iget-object v2, v2, Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge;->this$0:Lcom/vkontakte/android/fragments/HtmlGameFragment;

    invoke-virtual {v2, v11}, Lcom/vkontakte/android/fragments/HtmlGameFragment;->tryParseLong(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_5

    .line 213
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v21, "Unexpected format of mask. Mask should be integer: "

    move-object/from16 v0, v21

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/vk/core/util/ToastUtils;->showToast(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 217
    :cond_5
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge$1;->this$1:Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge;

    iget-object v2, v2, Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge;->this$0:Lcom/vkontakte/android/fragments/HtmlGameFragment;

    invoke-static {v2, v11}, Lcom/vkontakte/android/fragments/HtmlGameFragment;->access$500(Lcom/vkontakte/android/fragments/HtmlGameFragment;Ljava/lang/String;)V

    goto/16 :goto_1

    .line 220
    .end local v11    # "mask":Ljava/lang/String;
    :pswitch_4
    const-string/jumbo v2, "type"

    invoke-virtual {v15, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 222
    .local v3, "type":Ljava/lang/String;
    const-string/jumbo v2, "votes"

    invoke-virtual {v15, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Ljava/lang/String;

    .line 223
    .local v20, "votesStr":Ljava/lang/String;
    const/4 v4, 0x0

    .line 224
    .local v4, "votes":I
    if-eqz v20, :cond_6

    invoke-virtual/range {v20 .. v20}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_6

    .line 225
    invoke-static/range {v20 .. v20}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    .line 227
    :cond_6
    const-string/jumbo v2, "offer_id"

    invoke-virtual {v15, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/lang/String;

    .line 228
    .local v14, "offerIdStr":Ljava/lang/String;
    const/4 v5, 0x0

    .line 229
    .local v5, "offerId":I
    if-eqz v14, :cond_7

    invoke-virtual {v14}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_7

    .line 230
    invoke-static {v14}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    .line 233
    :cond_7
    const-string/jumbo v2, "currency"

    invoke-virtual {v15, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    .line 234
    .local v9, "currencyStr":Ljava/lang/String;
    const/4 v6, 0x0

    .line 235
    .local v6, "currencyBool":Z
    if-eqz v9, :cond_8

    const-string/jumbo v2, "1"

    invoke-virtual {v9, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 236
    const/4 v6, 0x1

    .line 239
    :cond_8
    const-string/jumbo v2, "item"

    invoke-virtual {v15, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    .line 241
    .local v7, "item":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge$1;->this$1:Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge;

    iget-object v2, v2, Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge;->this$0:Lcom/vkontakte/android/fragments/HtmlGameFragment;

    invoke-static/range {v2 .. v7}, Lcom/vkontakte/android/fragments/HtmlGameFragment;->access$600(Lcom/vkontakte/android/fragments/HtmlGameFragment;Ljava/lang/String;IIZLjava/lang/String;)V

    goto/16 :goto_1

    .line 245
    .end local v3    # "type":Ljava/lang/String;
    .end local v4    # "votes":I
    .end local v5    # "offerId":I
    .end local v6    # "currencyBool":Z
    .end local v7    # "item":Ljava/lang/String;
    .end local v9    # "currencyStr":Ljava/lang/String;
    .end local v14    # "offerIdStr":Ljava/lang/String;
    .end local v20    # "votesStr":Ljava/lang/String;
    :pswitch_5
    const-string/jumbo v2, "user_result"

    invoke-virtual {v15, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Ljava/lang/String;

    .line 246
    .local v16, "pointsOrLevelStr":Ljava/lang/String;
    const/4 v10, 0x0

    .line 247
    .local v10, "currentPointsOrLevel":I
    if-eqz v16, :cond_9

    invoke-virtual/range {v16 .. v16}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_9

    .line 248
    invoke-static/range {v16 .. v16}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v10

    .line 253
    :goto_2
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge$1;->this$1:Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge;

    iget-object v2, v2, Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge;->this$0:Lcom/vkontakte/android/fragments/HtmlGameFragment;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge$1;->this$1:Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge;->this$0:Lcom/vkontakte/android/fragments/HtmlGameFragment;

    move-object/from16 v21, v0

    invoke-static/range {v21 .. v21}, Lcom/vkontakte/android/fragments/HtmlGameFragment;->access$700(Lcom/vkontakte/android/fragments/HtmlGameFragment;)I

    move-result v21

    move/from16 v0, v21

    invoke-static {v2, v0, v10}, Lcom/vkontakte/android/fragments/HtmlGameFragment;->access$800(Lcom/vkontakte/android/fragments/HtmlGameFragment;II)V

    goto/16 :goto_1

    .line 251
    :cond_9
    const-string/jumbo v2, "Please, pass \'user_result\' to showLeaderboardBox"

    invoke-static {v2}, Lcom/vk/core/util/ToastUtils;->showToast(Ljava/lang/String;)V

    goto :goto_2

    .line 256
    .end local v10    # "currentPointsOrLevel":I
    .end local v16    # "pointsOrLevelStr":Ljava/lang/String;
    :pswitch_6
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge$1;->this$1:Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge;

    iget-object v2, v2, Lcom/vkontakte/android/fragments/HtmlGameFragment$AndroidBridge;->this$0:Lcom/vkontakte/android/fragments/HtmlGameFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/HtmlGameFragment;->access$900(Lcom/vkontakte/android/fragments/HtmlGameFragment;)V

    goto/16 :goto_1

    .line 180
    nop

    :sswitch_data_0
    .sparse-switch
        -0x5f1d5877 -> :sswitch_0
        -0x5793c695 -> :sswitch_5
        0x5a5ddf8 -> :sswitch_6
        0x16c985ba -> :sswitch_4
        0x6139b399 -> :sswitch_2
        0x6876df85 -> :sswitch_1
        0x7a3caf6b -> :sswitch_3
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
    .end packed-switch
.end method
