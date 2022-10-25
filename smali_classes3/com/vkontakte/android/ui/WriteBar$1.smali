.class Lcom/vkontakte/android/ui/WriteBar$1;
.super Landroid/content/BroadcastReceiver;
.source "WriteBar.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/ui/WriteBar;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/ui/WriteBar;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/ui/WriteBar;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/ui/WriteBar;

    .prologue
    .line 146
    iput-object p1, p0, Lcom/vkontakte/android/ui/WriteBar$1;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method synthetic lambda$onReceive$0()V
    .locals 1

    .prologue
    .line 162
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar$1;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    invoke-static {v0}, Lcom/vkontakte/android/ui/WriteBar;->access$500(Lcom/vkontakte/android/ui/WriteBar;)V

    return-void
.end method

.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 20
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 149
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_2

    const-string/jumbo v3, ""

    :goto_0
    const/4 v4, -0x1

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v5

    sparse-switch v5, :sswitch_data_0

    :cond_0
    move v3, v4

    :goto_1
    packed-switch v3, :pswitch_data_0

    .line 230
    :cond_1
    :goto_2
    return-void

    .line 149
    :cond_2
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v3

    goto :goto_0

    :sswitch_0
    const-string/jumbo v5, "com.vkontakte.android.STICKERS_NUM_UPDATES"

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    const/4 v3, 0x0

    goto :goto_1

    :sswitch_1
    const-string/jumbo v5, "com.vkontakte.android.AUDIO_MESSAGE_CANCEL"

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    const/4 v3, 0x1

    goto :goto_1

    :sswitch_2
    const-string/jumbo v5, "com.vkontakte.android.AUDIO_MESSAGE_ERROR"

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    const/4 v3, 0x2

    goto :goto_1

    :sswitch_3
    const-string/jumbo v5, "com.vkontakte.android.AUDIO_MESSAGE_DONE"

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    const/4 v3, 0x3

    goto :goto_1

    :sswitch_4
    const-string/jumbo v5, "com.vkontakte.android.AUDIO_MESSAGE_UPDATE"

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    const/4 v3, 0x4

    goto :goto_1

    :sswitch_5
    const-string/jumbo v5, "com.vkontakte.android.actions.AUDIO_MESSAGE_UPDATE"

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    const/4 v3, 0x5

    goto :goto_1

    :sswitch_6
    const-string/jumbo v5, "com.vkontakte.android.actions.AUDIO_MESSAGE_DONE"

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    const/4 v3, 0x6

    goto :goto_1

    .line 151
    :pswitch_0
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/ui/WriteBar$1;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    invoke-static {v3}, Lcom/vkontakte/android/ui/WriteBar;->access$100(Lcom/vkontakte/android/ui/WriteBar;)Landroid/widget/ImageView;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 152
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/ui/WriteBar$1;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    invoke-static {v3}, Lcom/vkontakte/android/ui/WriteBar;->access$100(Lcom/vkontakte/android/ui/WriteBar;)Landroid/widget/ImageView;

    move-result-object v4

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/ui/WriteBar$1;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    invoke-static {v3}, Lcom/vkontakte/android/ui/WriteBar;->access$200(Lcom/vkontakte/android/ui/WriteBar;)Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-static {}, Lcom/vkontakte/android/stickers/Stickers;->get()Lcom/vkontakte/android/stickers/Stickers;

    move-result-object v3

    invoke-virtual {v3}, Lcom/vkontakte/android/stickers/Stickers;->getGlobalPromotions()I

    move-result v3

    if-lez v3, :cond_3

    const/4 v3, 0x0

    :goto_3
    invoke-virtual {v4, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_2

    :cond_3
    const/16 v3, 0x8

    goto :goto_3

    .line 156
    :pswitch_1
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/ui/WriteBar$1;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    invoke-static {v3}, Lcom/vkontakte/android/ui/WriteBar;->access$300(Lcom/vkontakte/android/ui/WriteBar;)Lcom/vkontakte/android/ui/AttachmentsEditorView;

    move-result-object v3

    if-eqz v3, :cond_1

    const-string/jumbo v3, "peerId"

    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/ui/WriteBar$1;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    invoke-static {v4}, Lcom/vkontakte/android/ui/WriteBar;->access$400(Lcom/vkontakte/android/ui/WriteBar;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 157
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/ui/WriteBar$1;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    invoke-static {v3}, Lcom/vkontakte/android/ui/WriteBar;->access$500(Lcom/vkontakte/android/ui/WriteBar;)V

    goto/16 :goto_2

    .line 161
    :pswitch_2
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/ui/WriteBar$1;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    invoke-static {v3}, Lcom/vkontakte/android/ui/WriteBar;->access$300(Lcom/vkontakte/android/ui/WriteBar;)Lcom/vkontakte/android/ui/AttachmentsEditorView;

    move-result-object v3

    if-eqz v3, :cond_1

    const-string/jumbo v3, "peerId"

    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/ui/WriteBar$1;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    invoke-static {v4}, Lcom/vkontakte/android/ui/WriteBar;->access$400(Lcom/vkontakte/android/ui/WriteBar;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 162
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/ui/WriteBar$1;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    invoke-static/range {p0 .. p0}, Lcom/vkontakte/android/ui/WriteBar$1$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/ui/WriteBar$1;)Ljava/lang/Runnable;

    move-result-object v4

    const-wide/16 v6, 0x12c

    invoke-virtual {v3, v4, v6, v7}, Lcom/vkontakte/android/ui/WriteBar;->postDelayed(Ljava/lang/Runnable;J)Z

    goto/16 :goto_2

    .line 167
    :pswitch_3
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/ui/WriteBar$1;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    invoke-static {v3}, Lcom/vkontakte/android/ui/WriteBar;->access$300(Lcom/vkontakte/android/ui/WriteBar;)Lcom/vkontakte/android/ui/AttachmentsEditorView;

    move-result-object v3

    if-eqz v3, :cond_1

    const-string/jumbo v3, "peerId"

    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/ui/WriteBar$1;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    invoke-static {v4}, Lcom/vkontakte/android/ui/WriteBar;->access$400(Lcom/vkontakte/android/ui/WriteBar;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 168
    const-string/jumbo v3, "file"

    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v15

    check-cast v15, Ljava/io/File;

    .line 169
    .local v15, "file":Ljava/io/File;
    const-string/jumbo v3, "duration"

    const/4 v4, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v3, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v9

    .line 170
    .local v9, "duration":I
    const-string/jumbo v3, "waveform"

    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Landroid/content/Intent;->getByteArrayExtra(Ljava/lang/String;)[B

    move-result-object v10

    .line 171
    .local v10, "waveform":[B
    new-instance v3, Landroid/net/Uri$Builder;

    invoke-direct {v3}, Landroid/net/Uri$Builder;-><init>()V

    const-string/jumbo v4, "file"

    invoke-virtual {v3, v4}, Landroid/net/Uri$Builder;->scheme(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v3

    invoke-virtual {v15}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/net/Uri$Builder;->path(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v3

    invoke-virtual {v3}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v3

    invoke-virtual {v3}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v17

    .line 172
    .local v17, "path":Ljava/lang/String;
    const-string/jumbo v3, "\\."

    move-object/from16 v0, v17

    invoke-virtual {v0, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v14

    .line 173
    .local v14, "ext":[Ljava/lang/String;
    new-instance v2, Lcom/vkontakte/android/attachments/PendingAudioMessageAttachment;

    invoke-virtual {v15}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v3

    .line 174
    invoke-virtual {v15}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v15}, Ljava/io/File;->length()J

    move-result-wide v6

    long-to-int v5, v6

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v6

    invoke-virtual {v6}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v6

    .line 175
    invoke-static {}, Lcom/vkontakte/android/upload/Upload;->getNewID()I

    move-result v7

    array-length v8, v14

    add-int/lit8 v8, v8, -0x1

    aget-object v8, v14, v8

    invoke-direct/range {v2 .. v10}, Lcom/vkontakte/android/attachments/PendingAudioMessageAttachment;-><init>(Ljava/lang/String;Ljava/lang/String;IIILjava/lang/String;I[B)V

    .line 177
    .local v2, "attachment":Lcom/vkontakte/android/attachments/PendingAudioMessageAttachment;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/ui/WriteBar$1;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    invoke-static {v3}, Lcom/vkontakte/android/ui/WriteBar;->access$600(Lcom/vkontakte/android/ui/WriteBar;)Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    move-result-object v3

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/ui/WriteBar$1;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    iget v4, v4, Lcom/vkontakte/android/ui/WriteBar;->peerId:I

    invoke-virtual {v3, v4, v2}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->addPendingRecord(ILcom/vkontakte/android/attachments/PendingAudioMessageAttachment;)V

    .line 178
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/ui/WriteBar$1;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    invoke-static {v3}, Lcom/vkontakte/android/ui/WriteBar;->access$700(Lcom/vkontakte/android/ui/WriteBar;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 179
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/ui/WriteBar$1;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    invoke-static {v3}, Lcom/vkontakte/android/ui/WriteBar;->access$300(Lcom/vkontakte/android/ui/WriteBar;)Lcom/vkontakte/android/ui/AttachmentsEditorView;

    move-result-object v3

    invoke-virtual {v3, v2}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->addHidden(Lcom/vkontakte/android/attachments/Attachment;)V

    .line 181
    :cond_4
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/ui/WriteBar$1;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    invoke-static {v3}, Lcom/vkontakte/android/ui/WriteBar;->access$800(Lcom/vkontakte/android/ui/WriteBar;)Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->setAmplitude(Ljava/lang/Double;)V

    .line 182
    const-string/jumbo v3, "send"

    const/4 v4, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v3, v4}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 183
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/ui/WriteBar$1;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    invoke-static {v3}, Lcom/vkontakte/android/ui/WriteBar;->access$900(Lcom/vkontakte/android/ui/WriteBar;)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/View;->performClick()Z

    .line 184
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/ui/WriteBar$1;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    invoke-static {v3}, Lcom/vkontakte/android/ui/WriteBar;->access$500(Lcom/vkontakte/android/ui/WriteBar;)V

    goto/16 :goto_2

    .line 185
    :cond_5
    const-string/jumbo v3, "show_waveform"

    const/4 v4, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v3, v4}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v3

    if-eqz v3, :cond_6

    .line 186
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/ui/WriteBar$1;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    const/4 v4, 0x1

    invoke-static {v3, v4}, Lcom/vkontakte/android/ui/WriteBar;->access$1000(Lcom/vkontakte/android/ui/WriteBar;Z)V

    .line 187
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/ui/WriteBar$1;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    invoke-static {v3, v9}, Lcom/vkontakte/android/ui/WriteBar;->access$1100(Lcom/vkontakte/android/ui/WriteBar;I)V

    .line 188
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/ui/WriteBar$1;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    invoke-static {v3}, Lcom/vkontakte/android/ui/WriteBar;->access$1200(Lcom/vkontakte/android/ui/WriteBar;)Lcom/vkontakte/android/ui/widget/WaveformView;

    move-result-object v3

    invoke-virtual {v3, v10}, Lcom/vkontakte/android/ui/widget/WaveformView;->setWaveform([B)V

    goto/16 :goto_2

    .line 190
    :cond_6
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/ui/WriteBar$1;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    invoke-static {v3}, Lcom/vkontakte/android/ui/WriteBar;->access$1300(Lcom/vkontakte/android/ui/WriteBar;)Landroid/view/View;

    move-result-object v3

    const/16 v4, 0x8

    invoke-virtual {v3, v4}, Landroid/view/View;->setVisibility(I)V

    goto/16 :goto_2

    .line 195
    .end local v2    # "attachment":Lcom/vkontakte/android/attachments/PendingAudioMessageAttachment;
    .end local v9    # "duration":I
    .end local v10    # "waveform":[B
    .end local v14    # "ext":[Ljava/lang/String;
    .end local v15    # "file":Ljava/io/File;
    .end local v17    # "path":Ljava/lang/String;
    :pswitch_4
    const-string/jumbo v3, "peerId"

    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/ui/WriteBar$1;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    invoke-static {v4}, Lcom/vkontakte/android/ui/WriteBar;->access$400(Lcom/vkontakte/android/ui/WriteBar;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 196
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/ui/WriteBar$1;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    const-string/jumbo v4, "duration"

    const/4 v5, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v4, v5}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v4

    invoke-static {v3, v4}, Lcom/vkontakte/android/ui/WriteBar;->access$1100(Lcom/vkontakte/android/ui/WriteBar;I)V

    .line 197
    const-string/jumbo v3, "amplitude"

    const-wide/16 v4, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v3, v4, v5}, Landroid/content/Intent;->getDoubleExtra(Ljava/lang/String;D)D

    move-result-wide v12

    .line 198
    .local v12, "amplitude":D
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/ui/WriteBar$1;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    invoke-static {v3}, Lcom/vkontakte/android/ui/WriteBar;->access$800(Lcom/vkontakte/android/ui/WriteBar;)Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;

    move-result-object v3

    invoke-static {v12, v13}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->setAmplitude(Ljava/lang/Double;)V

    goto/16 :goto_2

    .line 202
    .end local v12    # "amplitude":D
    :pswitch_5
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/ui/WriteBar$1;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    invoke-static {v3}, Lcom/vkontakte/android/ui/WriteBar;->access$600(Lcom/vkontakte/android/ui/WriteBar;)Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    move-result-object v3

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/ui/WriteBar$1;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    iget v4, v4, Lcom/vkontakte/android/ui/WriteBar;->peerId:I

    invoke-virtual {v3, v4}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->getPendingRecord(I)Lcom/vkontakte/android/attachments/PendingAudioMessageAttachment;

    move-result-object v2

    .line 203
    .restart local v2    # "attachment":Lcom/vkontakte/android/attachments/PendingAudioMessageAttachment;
    if-eqz v2, :cond_1

    .line 204
    iget v0, v2, Lcom/vkontakte/android/attachments/PendingAudioMessageAttachment;->oid:I

    move/from16 v16, v0

    .line 205
    .local v16, "oid":I
    iget v11, v2, Lcom/vkontakte/android/attachments/PendingAudioMessageAttachment;->did:I

    .line 206
    .local v11, "did":I
    const-string/jumbo v3, "oid"

    const/4 v4, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v3, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v3

    move/from16 v0, v16

    if-ne v3, v0, :cond_1

    const-string/jumbo v3, "did"

    const/4 v4, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v3, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v3

    if-ne v3, v11, :cond_1

    .line 207
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/ui/WriteBar$1;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    const-string/jumbo v4, "position"

    const/4 v5, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v4, v5}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v4

    invoke-static {v3, v4}, Lcom/vkontakte/android/ui/WriteBar;->access$1100(Lcom/vkontakte/android/ui/WriteBar;I)V

    .line 208
    const-string/jumbo v3, "progress"

    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_7

    const-string/jumbo v3, "progress"

    const/4 v4, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v3, v4}, Landroid/content/Intent;->getFloatExtra(Ljava/lang/String;F)F

    move-result v3

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v19

    .line 209
    .local v19, "progress":Ljava/lang/Float;
    :goto_4
    const-string/jumbo v3, "playing"

    const/4 v4, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v3, v4}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v18

    .line 210
    .local v18, "playing":Z
    move/from16 v0, v18

    invoke-virtual {v2, v0}, Lcom/vkontakte/android/attachments/PendingAudioMessageAttachment;->setPlaying(Z)V

    .line 211
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/ui/WriteBar$1;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    invoke-static {v3}, Lcom/vkontakte/android/ui/WriteBar;->access$1200(Lcom/vkontakte/android/ui/WriteBar;)Lcom/vkontakte/android/ui/widget/WaveformView;

    move-result-object v3

    move-object/from16 v0, v19

    invoke-virtual {v3, v0}, Lcom/vkontakte/android/ui/widget/WaveformView;->setProgress(Ljava/lang/Float;)V

    .line 212
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/ui/WriteBar$1;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    if-nez v18, :cond_8

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/ui/WriteBar$1;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    invoke-static {v3}, Lcom/vkontakte/android/ui/WriteBar;->access$1400(Lcom/vkontakte/android/ui/WriteBar;)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/View;->getVisibility()I

    move-result v3

    if-nez v3, :cond_8

    const/4 v3, 0x1

    :goto_5
    invoke-static {v4, v3}, Lcom/vkontakte/android/ui/WriteBar;->access$1500(Lcom/vkontakte/android/ui/WriteBar;Z)V

    goto/16 :goto_2

    .line 208
    .end local v18    # "playing":Z
    .end local v19    # "progress":Ljava/lang/Float;
    :cond_7
    const/16 v19, 0x0

    goto :goto_4

    .line 212
    .restart local v18    # "playing":Z
    .restart local v19    # "progress":Ljava/lang/Float;
    :cond_8
    const/4 v3, 0x0

    goto :goto_5

    .line 218
    .end local v2    # "attachment":Lcom/vkontakte/android/attachments/PendingAudioMessageAttachment;
    .end local v11    # "did":I
    .end local v16    # "oid":I
    .end local v18    # "playing":Z
    .end local v19    # "progress":Ljava/lang/Float;
    :pswitch_6
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/ui/WriteBar$1;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    invoke-static {v3}, Lcom/vkontakte/android/ui/WriteBar;->access$600(Lcom/vkontakte/android/ui/WriteBar;)Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    move-result-object v3

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/ui/WriteBar$1;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    iget v4, v4, Lcom/vkontakte/android/ui/WriteBar;->peerId:I

    invoke-virtual {v3, v4}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->getPendingRecord(I)Lcom/vkontakte/android/attachments/PendingAudioMessageAttachment;

    move-result-object v2

    .line 219
    .restart local v2    # "attachment":Lcom/vkontakte/android/attachments/PendingAudioMessageAttachment;
    if-eqz v2, :cond_1

    .line 220
    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/attachments/PendingAudioMessageAttachment;->setPlaying(Z)V

    .line 221
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/ui/WriteBar$1;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    invoke-virtual {v2}, Lcom/vkontakte/android/attachments/PendingAudioMessageAttachment;->getDuration()I

    move-result v4

    invoke-static {v3, v4}, Lcom/vkontakte/android/ui/WriteBar;->access$1100(Lcom/vkontakte/android/ui/WriteBar;I)V

    .line 222
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/ui/WriteBar$1;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    invoke-static {v3}, Lcom/vkontakte/android/ui/WriteBar;->access$1200(Lcom/vkontakte/android/ui/WriteBar;)Lcom/vkontakte/android/ui/widget/WaveformView;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lcom/vkontakte/android/ui/widget/WaveformView;->setProgress(Ljava/lang/Float;)V

    .line 223
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/ui/WriteBar$1;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    const/4 v4, 0x1

    invoke-static {v3, v4}, Lcom/vkontakte/android/ui/WriteBar;->access$1500(Lcom/vkontakte/android/ui/WriteBar;Z)V

    goto/16 :goto_2

    .line 149
    :sswitch_data_0
    .sparse-switch
        -0x7e9fd0fe -> :sswitch_3
        -0x6dca4a66 -> :sswitch_5
        -0x5869aa06 -> :sswitch_1
        -0x554ac998 -> :sswitch_2
        -0x38e39fb7 -> :sswitch_4
        0x22c0a493 -> :sswitch_6
        0x7981d567 -> :sswitch_0
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
