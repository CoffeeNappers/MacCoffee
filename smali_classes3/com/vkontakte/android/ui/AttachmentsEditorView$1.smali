.class Lcom/vkontakte/android/ui/AttachmentsEditorView$1;
.super Landroid/content/BroadcastReceiver;
.source "AttachmentsEditorView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/ui/AttachmentsEditorView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/ui/AttachmentsEditorView;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/ui/AttachmentsEditorView;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/ui/AttachmentsEditorView;

    .prologue
    .line 94
    iput-object p1, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView$1;->this$0:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 16
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 97
    sget-boolean v11, Lcom/vkontakte/android/api/APIController;->API_DEBUG:Z

    if-eqz v11, :cond_0

    .line 98
    const-string/jumbo v11, "vk"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v13, "upload state "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string/jumbo v13, ", id="

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string/jumbo v13, "id"

    const/4 v14, -0x1

    move-object/from16 v0, p2

    invoke-virtual {v0, v13, v14}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 100
    :cond_0
    const-string/jumbo v11, "com.vkontakte.android.UPLOAD_PROGRESS"

    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_4

    .line 101
    const-string/jumbo v11, "id"

    const/4 v12, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v11, v12}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v4

    .line 102
    .local v4, "id":I
    const/4 v3, 0x0

    .line 103
    .local v3, "i":I
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/vkontakte/android/ui/AttachmentsEditorView$1;->this$0:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    invoke-static {v11}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->access$000(Lcom/vkontakte/android/ui/AttachmentsEditorView;)Ljava/util/ArrayList;

    move-result-object v11

    invoke-virtual {v11}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :cond_1
    :goto_0
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_4

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/attachments/Attachment;

    .line 104
    .local v2, "att":Lcom/vkontakte/android/attachments/Attachment;
    instance-of v11, v2, Lcom/vkontakte/android/attachments/PendingAttachment;

    if-eqz v11, :cond_7

    move-object v11, v2

    check-cast v11, Lcom/vkontakte/android/attachments/PendingAttachment;

    invoke-interface {v11}, Lcom/vkontakte/android/attachments/PendingAttachment;->getUploadId()I

    move-result v11

    if-ne v11, v4, :cond_7

    .line 105
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/vkontakte/android/ui/AttachmentsEditorView$1;->this$0:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    invoke-virtual {v11, v2}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v9

    .line 106
    .local v9, "v":Landroid/view/View;
    if-nez v9, :cond_2

    .line 107
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/vkontakte/android/ui/AttachmentsEditorView$1;->this$0:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    invoke-static {v11}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->access$100(Lcom/vkontakte/android/ui/AttachmentsEditorView;)Landroid/widget/LinearLayout;

    move-result-object v11

    invoke-virtual {v11, v3}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v9

    .line 110
    :cond_2
    if-nez v9, :cond_3

    .line 111
    add-int/lit8 v3, v3, 0x1

    .line 112
    goto :goto_0

    .line 115
    :cond_3
    const v11, 0x7f1001eb

    invoke-virtual {v9, v11}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/ProgressBar;

    .line 116
    .local v7, "pb":Landroid/widget/ProgressBar;
    if-eqz v7, :cond_1

    .line 119
    const-string/jumbo v11, "done"

    const/4 v12, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v11, v12}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v11

    invoke-virtual {v7, v11}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 120
    const-string/jumbo v11, "total"

    const/4 v12, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v11, v12}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v11

    invoke-virtual {v7, v11}, Landroid/widget/ProgressBar;->setMax(I)V

    .line 121
    sget-boolean v11, Lcom/vkontakte/android/api/APIController;->API_DEBUG:Z

    if-eqz v11, :cond_4

    .line 122
    const-string/jumbo v11, "vk"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v13, "Upload "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string/jumbo v13, " progress: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string/jumbo v13, "done"

    const/4 v14, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v13, v14}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string/jumbo v13, "/"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string/jumbo v13, "total"

    const/4 v14, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v13, v14}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 129
    .end local v2    # "att":Lcom/vkontakte/android/attachments/Attachment;
    .end local v3    # "i":I
    .end local v4    # "id":I
    .end local v7    # "pb":Landroid/widget/ProgressBar;
    .end local v9    # "v":Landroid/view/View;
    :cond_4
    const-string/jumbo v11, "com.vkontakte.android.UPLOAD_DONE"

    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_b

    .line 130
    const-string/jumbo v11, "id"

    const/4 v12, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v11, v12}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v4

    .line 131
    .restart local v4    # "id":I
    const/4 v3, 0x0

    .line 132
    .restart local v3    # "i":I
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/vkontakte/android/ui/AttachmentsEditorView$1;->this$0:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    invoke-static {v11}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->access$000(Lcom/vkontakte/android/ui/AttachmentsEditorView;)Ljava/util/ArrayList;

    move-result-object v11

    invoke-virtual {v11}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :cond_5
    :goto_1
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_a

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/attachments/Attachment;

    .line 133
    .restart local v2    # "att":Lcom/vkontakte/android/attachments/Attachment;
    instance-of v11, v2, Lcom/vkontakte/android/attachments/PendingAttachment;

    if-eqz v11, :cond_13

    move-object v11, v2

    check-cast v11, Lcom/vkontakte/android/attachments/PendingAttachment;

    invoke-interface {v11}, Lcom/vkontakte/android/attachments/PendingAttachment;->getUploadId()I

    move-result v11

    if-ne v11, v4, :cond_13

    .line 134
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/vkontakte/android/ui/AttachmentsEditorView$1;->this$0:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    invoke-virtual {v11, v2}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v9

    .line 135
    .restart local v9    # "v":Landroid/view/View;
    if-nez v9, :cond_6

    .line 136
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/vkontakte/android/ui/AttachmentsEditorView$1;->this$0:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    invoke-static {v11}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->access$100(Lcom/vkontakte/android/ui/AttachmentsEditorView;)Landroid/widget/LinearLayout;

    move-result-object v11

    invoke-virtual {v11, v3}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v9

    .line 138
    :cond_6
    if-nez v9, :cond_8

    .line 139
    add-int/lit8 v3, v3, 0x1

    .line 140
    goto :goto_1

    .line 126
    .end local v9    # "v":Landroid/view/View;
    :cond_7
    add-int/lit8 v3, v3, 0x1

    .line 127
    goto/16 :goto_0

    .line 142
    .restart local v9    # "v":Landroid/view/View;
    :cond_8
    const v11, 0x7f1001eb

    invoke-virtual {v9, v11}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v11

    if-eqz v11, :cond_5

    .line 145
    const v11, 0x7f1001eb

    invoke-virtual {v9, v11}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v11

    check-cast v11, Landroid/widget/ProgressBar;

    invoke-virtual {v11}, Landroid/widget/ProgressBar;->getProgressDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v8

    .line 146
    .local v8, "pd":Landroid/graphics/drawable/Drawable;
    instance-of v11, v8, Lcom/vkontakte/android/ui/CircularProgressDrawable;

    if-eqz v11, :cond_10

    .line 147
    check-cast v8, Lcom/vkontakte/android/ui/CircularProgressDrawable;

    .end local v8    # "pd":Landroid/graphics/drawable/Drawable;
    invoke-virtual {v8}, Lcom/vkontakte/android/ui/CircularProgressDrawable;->playDoneAnimation()V

    .line 148
    move-object v10, v9

    .line 149
    .local v10, "vv":Landroid/view/View;
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/vkontakte/android/ui/AttachmentsEditorView$1;->this$0:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    new-instance v12, Lcom/vkontakte/android/ui/AttachmentsEditorView$1$1;

    move-object/from16 v0, p0

    invoke-direct {v12, v0, v10}, Lcom/vkontakte/android/ui/AttachmentsEditorView$1$1;-><init>(Lcom/vkontakte/android/ui/AttachmentsEditorView$1;Landroid/view/View;)V

    const-wide/16 v14, 0x28a

    invoke-virtual {v11, v12, v14, v15}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 158
    .end local v10    # "vv":Landroid/view/View;
    :goto_2
    const-string/jumbo v11, "result"

    move-object/from16 v0, p2

    invoke-virtual {v0, v11}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v6

    .line 159
    .local v6, "o":Landroid/os/Parcelable;
    const/4 v5, 0x0

    .line 160
    .local v5, "na":Lcom/vkontakte/android/attachments/Attachment;
    instance-of v11, v6, Lcom/vkontakte/android/attachments/Attachment;

    if-eqz v11, :cond_11

    move-object v5, v6

    .line 161
    check-cast v5, Lcom/vkontakte/android/attachments/Attachment;

    .line 167
    .end local v6    # "o":Landroid/os/Parcelable;
    :cond_9
    :goto_3
    invoke-virtual {v9, v5}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 168
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/vkontakte/android/ui/AttachmentsEditorView$1;->this$0:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    invoke-static {v11}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->access$000(Lcom/vkontakte/android/ui/AttachmentsEditorView;)Ljava/util/ArrayList;

    move-result-object v11

    invoke-virtual {v11, v3, v5}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 169
    sget-boolean v11, Lcom/vkontakte/android/api/APIController;->API_DEBUG:Z

    if-eqz v11, :cond_a

    .line 170
    const-string/jumbo v11, "vk"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v13, "Upload "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string/jumbo v13, " done: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string/jumbo v13, "result"

    move-object/from16 v0, p2

    invoke-virtual {v0, v13}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 176
    .end local v2    # "att":Lcom/vkontakte/android/attachments/Attachment;
    .end local v5    # "na":Lcom/vkontakte/android/attachments/Attachment;
    .end local v9    # "v":Landroid/view/View;
    :cond_a
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/vkontakte/android/ui/AttachmentsEditorView$1;->this$0:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    invoke-virtual {v11}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->isUploading()Z

    move-result v11

    if-nez v11, :cond_b

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/vkontakte/android/ui/AttachmentsEditorView$1;->this$0:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    invoke-static {v11}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->access$200(Lcom/vkontakte/android/ui/AttachmentsEditorView;)Lcom/vkontakte/android/ui/AttachmentsEditorView$Callback;

    move-result-object v11

    if-eqz v11, :cond_b

    .line 177
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/vkontakte/android/ui/AttachmentsEditorView$1;->this$0:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    invoke-static {v11}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->access$200(Lcom/vkontakte/android/ui/AttachmentsEditorView;)Lcom/vkontakte/android/ui/AttachmentsEditorView$Callback;

    move-result-object v11

    invoke-interface {v11}, Lcom/vkontakte/android/ui/AttachmentsEditorView$Callback;->onAllUploadsDone()V

    .line 180
    .end local v3    # "i":I
    .end local v4    # "id":I
    :cond_b
    const-string/jumbo v11, "com.vkontakte.android.UPLOAD_FAILED"

    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_f

    .line 181
    const-string/jumbo v11, "id"

    const/4 v12, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v11, v12}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v4

    .line 182
    .restart local v4    # "id":I
    const/4 v3, 0x0

    .line 183
    .restart local v3    # "i":I
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/vkontakte/android/ui/AttachmentsEditorView$1;->this$0:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    invoke-static {v11}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->access$000(Lcom/vkontakte/android/ui/AttachmentsEditorView;)Ljava/util/ArrayList;

    move-result-object v11

    invoke-virtual {v11}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :cond_c
    :goto_4
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_f

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/attachments/Attachment;

    .line 184
    .restart local v2    # "att":Lcom/vkontakte/android/attachments/Attachment;
    instance-of v11, v2, Lcom/vkontakte/android/attachments/PendingAttachment;

    if-eqz v11, :cond_14

    move-object v11, v2

    check-cast v11, Lcom/vkontakte/android/attachments/PendingAttachment;

    invoke-interface {v11}, Lcom/vkontakte/android/attachments/PendingAttachment;->getUploadId()I

    move-result v11

    if-ne v11, v4, :cond_14

    .line 185
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/vkontakte/android/ui/AttachmentsEditorView$1;->this$0:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    invoke-static {v11}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->access$200(Lcom/vkontakte/android/ui/AttachmentsEditorView;)Lcom/vkontakte/android/ui/AttachmentsEditorView$Callback;

    move-result-object v11

    if-eqz v11, :cond_d

    .line 186
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/vkontakte/android/ui/AttachmentsEditorView$1;->this$0:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    invoke-static {v11}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->access$200(Lcom/vkontakte/android/ui/AttachmentsEditorView;)Lcom/vkontakte/android/ui/AttachmentsEditorView$Callback;

    move-result-object v11

    invoke-interface {v11}, Lcom/vkontakte/android/ui/AttachmentsEditorView$Callback;->onUploadFailed()V

    .line 188
    :cond_d
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/vkontakte/android/ui/AttachmentsEditorView$1;->this$0:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    invoke-virtual {v11, v2}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v9

    .line 189
    .restart local v9    # "v":Landroid/view/View;
    if-nez v9, :cond_e

    .line 190
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/vkontakte/android/ui/AttachmentsEditorView$1;->this$0:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    invoke-static {v11}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->access$100(Lcom/vkontakte/android/ui/AttachmentsEditorView;)Landroid/widget/LinearLayout;

    move-result-object v11

    invoke-virtual {v11, v3}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v9

    .line 192
    :cond_e
    if-eqz v9, :cond_c

    .line 195
    const v11, 0x7f1001eb

    invoke-virtual {v9, v11}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v11

    if-eqz v11, :cond_c

    .line 198
    const v11, 0x7f1001eb

    invoke-virtual {v9, v11}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v11

    const/16 v12, 0x8

    invoke-static {v11, v12}, Lcom/vkontakte/android/ViewUtils;->setVisibilityAnimated(Landroid/view/View;I)V

    .line 199
    const v11, 0x7f1001ec

    invoke-virtual {v9, v11}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v11

    const/4 v12, 0x0

    invoke-static {v11, v12}, Lcom/vkontakte/android/ViewUtils;->setVisibilityAnimated(Landroid/view/View;I)V

    .line 205
    .end local v2    # "att":Lcom/vkontakte/android/attachments/Attachment;
    .end local v3    # "i":I
    .end local v4    # "id":I
    .end local v9    # "v":Landroid/view/View;
    :cond_f
    return-void

    .line 156
    .restart local v2    # "att":Lcom/vkontakte/android/attachments/Attachment;
    .restart local v3    # "i":I
    .restart local v4    # "id":I
    .restart local v8    # "pd":Landroid/graphics/drawable/Drawable;
    .restart local v9    # "v":Landroid/view/View;
    :cond_10
    const v11, 0x7f1001eb

    invoke-virtual {v9, v11}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v11

    const/16 v12, 0x8

    invoke-static {v11, v12}, Lcom/vkontakte/android/ViewUtils;->setVisibilityAnimated(Landroid/view/View;I)V

    goto/16 :goto_2

    .line 162
    .end local v8    # "pd":Landroid/graphics/drawable/Drawable;
    .restart local v5    # "na":Lcom/vkontakte/android/attachments/Attachment;
    .restart local v6    # "o":Landroid/os/Parcelable;
    :cond_11
    instance-of v11, v6, Lcom/vkontakte/android/audio/MusicTrack;

    if-eqz v11, :cond_12

    .line 163
    new-instance v5, Lcom/vkontakte/android/attachments/AudioAttachment;

    .end local v5    # "na":Lcom/vkontakte/android/attachments/Attachment;
    check-cast v6, Lcom/vkontakte/android/audio/MusicTrack;

    .end local v6    # "o":Landroid/os/Parcelable;
    invoke-direct {v5, v6}, Lcom/vkontakte/android/attachments/AudioAttachment;-><init>(Lcom/vkontakte/android/audio/MusicTrack;)V

    .restart local v5    # "na":Lcom/vkontakte/android/attachments/Attachment;
    goto/16 :goto_3

    .line 164
    .restart local v6    # "o":Landroid/os/Parcelable;
    :cond_12
    instance-of v11, v6, Lcom/vkontakte/android/api/VideoFile;

    if-eqz v11, :cond_9

    .line 165
    new-instance v5, Lcom/vkontakte/android/attachments/VideoAttachment;

    .end local v5    # "na":Lcom/vkontakte/android/attachments/Attachment;
    check-cast v6, Lcom/vkontakte/android/api/VideoFile;

    .end local v6    # "o":Landroid/os/Parcelable;
    invoke-direct {v5, v6}, Lcom/vkontakte/android/attachments/VideoAttachment;-><init>(Lcom/vkontakte/android/api/VideoFile;)V

    .restart local v5    # "na":Lcom/vkontakte/android/attachments/Attachment;
    goto/16 :goto_3

    .line 174
    .end local v5    # "na":Lcom/vkontakte/android/attachments/Attachment;
    .end local v9    # "v":Landroid/view/View;
    :cond_13
    add-int/lit8 v3, v3, 0x1

    .line 175
    goto/16 :goto_1

    .line 202
    :cond_14
    add-int/lit8 v3, v3, 0x1

    .line 203
    goto/16 :goto_4
.end method
