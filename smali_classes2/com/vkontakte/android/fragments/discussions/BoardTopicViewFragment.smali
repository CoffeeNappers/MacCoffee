.class public Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;
.super Lcom/vkontakte/android/fragments/VKToolbarFragment;
.source "BoardTopicViewFragment.java"

# interfaces
.implements Lcom/vkontakte/android/ui/PaginationView$Listener;
.implements Lcom/vkontakte/android/api/board/BoardCommentsLoader$BoardCommentsLoaderListener;
.implements Lcom/vkontakte/android/ui/holder/comments/CommentViewHolder$CommentViewHolderListener;
.implements Lcom/vkontakte/android/fragments/BackListener;
.implements Lcom/vkontakte/android/stickers/StickersView$Listener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$CommentsAdapter;,
        Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$PollAdapter;,
        Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$PollViewHolder;,
        Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/fragments/VKToolbarFragment;",
        "Lcom/vkontakte/android/ui/PaginationView$Listener;",
        "Lcom/vkontakte/android/api/board/BoardCommentsLoader$BoardCommentsLoaderListener;",
        "Lcom/vkontakte/android/ui/holder/comments/CommentViewHolder$CommentViewHolderListener",
        "<",
        "Lcom/vkontakte/android/api/board/BoardComment;",
        ">;",
        "Lcom/vkontakte/android/fragments/BackListener;",
        "Lcom/vkontakte/android/stickers/StickersView$Listener;"
    }
.end annotation


# static fields
.field private static final COUNT_OF_PAGE:I = 0x14

.field private static final EDIT_COMMENT_REQUEST:I = 0x10e9


# instance fields
.field bigProgress:Landroid/view/View;

.field bigProgressVisibility:I

.field commentBar:Lcom/vkontakte/android/ui/WriteBar;

.field commentsAdapter:Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$CommentsAdapter;

.field commentsLoader:Lcom/vkontakte/android/api/board/BoardCommentsLoader;

.field createHint:Landroid/view/View;

.field keyboardPopup:Lcom/vkontakte/android/stickers/KeyboardPopup;

.field layoutManager:Landroid/support/v7/widget/LinearLayoutManager;

.field paginationView:Lcom/vkontakte/android/ui/PaginationView;

.field pollAdapter:Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$PollAdapter;

.field replyFromGroup:Z

.field replyTo:I

.field replyToName:Ljava/lang/String;

.field replyToUid:I

.field sendingComment:Z

.field stickersView:Lcom/vkontakte/android/stickers/StickersView;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, -0x1

    .line 76
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/VKToolbarFragment;-><init>()V

    .line 146
    new-instance v0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$CommentsAdapter;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$CommentsAdapter;-><init>(Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->commentsAdapter:Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$CommentsAdapter;

    .line 147
    new-instance v0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$PollAdapter;

    invoke-direct {v0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$PollAdapter;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->pollAdapter:Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$PollAdapter;

    .line 155
    const/16 v0, 0x8

    iput v0, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->bigProgressVisibility:I

    .line 157
    iput v1, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->replyTo:I

    iput v1, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->replyToUid:I

    .line 158
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->replyToName:Ljava/lang/String;

    .line 161
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->sendingComment:Z

    return-void
.end method

.method static synthetic access$200(Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;Lcom/vkontakte/android/attachments/Attachment;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;
    .param p1, "x1"    # Lcom/vkontakte/android/attachments/Attachment;

    .prologue
    .line 76
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->sendAttachmentComment(Lcom/vkontakte/android/attachments/Attachment;)V

    return-void
.end method

.method static synthetic access$300(Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;)I
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;

    .prologue
    .line 76
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->getGroupId()I

    move-result v0

    return v0
.end method

.method static synthetic access$400(Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;)I
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;

    .prologue
    .line 76
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->getTopicId()I

    move-result v0

    return v0
.end method

.method static synthetic access$500(Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;

    .prologue
    .line 76
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->canWrite()Z

    move-result v0

    return v0
.end method

.method private canWrite()Z
    .locals 3

    .prologue
    const/4 v0, 0x0

    .line 232
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    const-string/jumbo v2, "is_closed"

    invoke-virtual {v1, v2, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-nez v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method private deleteComment(Lcom/vkontakte/android/api/board/BoardComment;)V
    .locals 5
    .param p1, "comment"    # Lcom/vkontakte/android/api/board/BoardComment;

    .prologue
    .line 635
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 636
    .local v0, "activity":Landroid/app/Activity;
    if-eqz v0, :cond_0

    .line 637
    new-instance v1, Lcom/vkontakte/android/api/board/BoardDeleteComment;

    invoke-direct {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->getGroupId()I

    move-result v2

    invoke-direct {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->getTopicId()I

    move-result v3

    iget v4, p1, Lcom/vkontakte/android/api/board/BoardComment;->id:I

    invoke-direct {v1, v2, v3, v4}, Lcom/vkontakte/android/api/board/BoardDeleteComment;-><init>(III)V

    new-instance v2, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$5;

    invoke-direct {v2, p0, p0, p1}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$5;-><init>(Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;Landroid/app/Fragment;Lcom/vkontakte/android/api/board/BoardComment;)V

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/api/board/BoardDeleteComment;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    .line 642
    invoke-virtual {v1, v0}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 644
    :cond_0
    return-void
.end method

.method private editComment(Lcom/vkontakte/android/api/board/BoardComment;)V
    .locals 3
    .param p1, "comm"    # Lcom/vkontakte/android/api/board/BoardComment;

    .prologue
    .line 631
    new-instance v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;

    invoke-direct {v0}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;-><init>()V

    invoke-direct {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->getTopicId()I

    move-result v1

    invoke-direct {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->getGroupId()I

    move-result v2

    invoke-virtual {v0, p1, v1, v2}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;->setBoardComment(Lcom/vkontakte/android/api/board/BoardComment;II)Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;

    move-result-object v0

    const/16 v1, 0x10e9

    invoke-virtual {v0, p0, v1}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;->forResult(Landroid/app/Fragment;I)Z

    .line 632
    return-void
.end method

.method private getCommentsCount()I
    .locals 3

    .prologue
    .line 181
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    invoke-static {}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$Builder;->access$000()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method private getGroupId()I
    .locals 3

    .prologue
    .line 164
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "group_id"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method private getStartOffset()I
    .locals 4

    .prologue
    const/4 v1, 0x0

    .line 172
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->isShowLastComment()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 173
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->getCommentsCount()I

    move-result v2

    add-int/lit8 v0, v2, -0x14

    .line 174
    .local v0, "offsetForLastComment":I
    if-ltz v0, :cond_0

    .line 176
    .end local v0    # "offsetForLastComment":I
    :goto_0
    return v0

    .restart local v0    # "offsetForLastComment":I
    :cond_0
    move v0, v1

    .line 174
    goto :goto_0

    .line 176
    .end local v0    # "offsetForLastComment":I
    :cond_1
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v2

    const-string/jumbo v3, "offset"

    invoke-virtual {v2, v3, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    goto :goto_0
.end method

.method private getTopicId()I
    .locals 2

    .prologue
    .line 168
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "id"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method private isShowLastComment()Z
    .locals 3

    .prologue
    .line 185
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    invoke-static {}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$Builder;->access$100()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method static synthetic lambda$sendPendingAttachmentComment$6(Lcom/vkontakte/android/upload/UploadTask;Lcom/vkontakte/android/upload/UploadListener;Landroid/content/DialogInterface;)V
    .locals 1
    .param p0, "task"    # Lcom/vkontakte/android/upload/UploadTask;
    .param p1, "uploadListener"    # Lcom/vkontakte/android/upload/UploadListener;
    .param p2, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 402
    invoke-virtual {p0}, Lcom/vkontakte/android/upload/UploadTask;->getID()I

    move-result v0

    invoke-static {v0}, Lcom/vkontakte/android/upload/Upload;->cancel(I)V

    .line 403
    invoke-virtual {p1}, Lcom/vkontakte/android/upload/UploadListener;->stopListener()V

    .line 404
    return-void
.end method

.method private sendAttachmentComment(Lcom/vkontakte/android/attachments/Attachment;)V
    .locals 3
    .param p1, "att"    # Lcom/vkontakte/android/attachments/Attachment;

    .prologue
    .line 366
    const-string/jumbo v0, ""

    invoke-static {p1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    const/4 v2, 0x0

    invoke-direct {p0, v0, v1, v2}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->sendComment(Ljava/lang/String;Ljava/util/List;Z)V

    .line 367
    return-void
.end method

.method private sendComment()V
    .locals 3

    .prologue
    const/4 v2, 0x1

    .line 525
    iget-boolean v1, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->sendingComment:Z

    if-eqz v1, :cond_1

    .line 536
    :cond_0
    :goto_0
    return-void

    .line 528
    :cond_1
    iput-boolean v2, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->sendingComment:Z

    .line 530
    iget-object v1, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->commentBar:Lcom/vkontakte/android/ui/WriteBar;

    invoke-virtual {v1}, Lcom/vkontakte/android/ui/WriteBar;->getText()Ljava/lang/String;

    move-result-object v0

    .line 532
    .local v0, "txt":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_2

    iget-object v1, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->commentBar:Lcom/vkontakte/android/ui/WriteBar;

    invoke-virtual {v1}, Lcom/vkontakte/android/ui/WriteBar;->getAttachments()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-eqz v1, :cond_0

    .line 535
    :cond_2
    iget-object v1, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->commentBar:Lcom/vkontakte/android/ui/WriteBar;

    invoke-virtual {v1}, Lcom/vkontakte/android/ui/WriteBar;->getAttachments()Ljava/util/ArrayList;

    move-result-object v1

    invoke-direct {p0, v0, v1, v2}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->sendComment(Ljava/lang/String;Ljava/util/List;Z)V

    goto :goto_0
.end method

.method private sendComment(Ljava/lang/String;Ljava/util/List;Z)V
    .locals 17
    .param p1, "txt"    # Ljava/lang/String;
    .param p3, "clearCommentBar"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/attachments/Attachment;",
            ">;Z)V"
        }
    .end annotation

    .prologue
    .line 539
    .local p2, "atts":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/attachments/Attachment;>;"
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v14

    .line 540
    .local v14, "activity":Landroid/app/Activity;
    if-nez v14, :cond_0

    .line 588
    :goto_0
    return-void

    .line 543
    :cond_0
    move-object/from16 v0, p0

    iget-boolean v7, v0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->replyFromGroup:Z

    .line 545
    .local v7, "fromGroup":Z
    if-eqz p3, :cond_1

    move-object/from16 v0, p0

    iget v1, v0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->replyTo:I

    if-lez v1, :cond_1

    if-eqz p1, :cond_1

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->replyToName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    move-object/from16 v0, p1

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 546
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->replyToName:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "[post"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, p0

    iget v3, v0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->replyTo:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "|"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->replyToName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "]"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p1

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 550
    .local v4, "text":Ljava/lang/String;
    :goto_1
    new-instance v1, Lcom/vkontakte/android/api/board/BoardAddComment;

    invoke-direct/range {p0 .. p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->getGroupId()I

    move-result v2

    invoke-direct/range {p0 .. p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->getTopicId()I

    move-result v3

    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v5

    const-string/jumbo v6, "title"

    invoke-virtual {v5, v6}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    move-object/from16 v5, p2

    invoke-direct/range {v1 .. v7}, Lcom/vkontakte/android/api/board/BoardAddComment;-><init>(IILjava/lang/String;Ljava/util/List;Ljava/lang/String;Z)V

    new-instance v8, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$4;

    move-object/from16 v9, p0

    move-object/from16 v10, p0

    move-object v11, v4

    move/from16 v12, p3

    move-object/from16 v13, p1

    move-object/from16 v15, p2

    move/from16 v16, v7

    invoke-direct/range {v8 .. v16}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$4;-><init>(Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;Landroid/app/Fragment;Ljava/lang/String;ZLjava/lang/String;Landroid/app/Activity;Ljava/util/List;Z)V

    .line 551
    invoke-virtual {v1, v8}, Lcom/vkontakte/android/api/board/BoardAddComment;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    .line 587
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    invoke-virtual {v1, v14}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    goto/16 :goto_0

    .line 548
    .end local v4    # "text":Ljava/lang/String;
    :cond_1
    move-object/from16 v4, p1

    .restart local v4    # "text":Ljava/lang/String;
    goto :goto_1
.end method

.method private sendPendingAttachmentComment(Lcom/vkontakte/android/attachments/PendingAttachment;)V
    .locals 5
    .param p1, "att"    # Lcom/vkontakte/android/attachments/PendingAttachment;

    .prologue
    .line 370
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    if-nez v3, :cond_0

    .line 409
    :goto_0
    return-void

    .line 374
    :cond_0
    new-instance v0, Landroid/app/ProgressDialog;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-direct {v0, v3}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    .line 375
    .local v0, "progress":Landroid/app/ProgressDialog;
    const v3, 0x7f08033d

    invoke-virtual {p0, v3}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 376
    const/4 v3, 0x1

    invoke-virtual {v0, v3}, Landroid/app/ProgressDialog;->setCancelable(Z)V

    .line 377
    const/4 v3, 0x0

    invoke-virtual {v0, v3}, Landroid/app/ProgressDialog;->setCanceledOnTouchOutside(Z)V

    .line 378
    invoke-virtual {v0}, Landroid/app/ProgressDialog;->show()V

    .line 380
    new-instance v2, Lcom/vkontakte/android/upload/UploadListener;

    invoke-interface {p1}, Lcom/vkontakte/android/attachments/PendingAttachment;->getUploadId()I

    move-result v3

    new-instance v4, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$2;

    invoke-direct {v4, p0, v0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$2;-><init>(Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;Landroid/app/ProgressDialog;)V

    invoke-direct {v2, v3, v4}, Lcom/vkontakte/android/upload/UploadListener;-><init>(ILcom/vkontakte/android/upload/UploadListener$UploadListenerCallback;)V

    .line 400
    .local v2, "uploadListener":Lcom/vkontakte/android/upload/UploadListener;
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-interface {p1, v3}, Lcom/vkontakte/android/attachments/PendingAttachment;->createUploadTask(Landroid/content/Context;)Lcom/vkontakte/android/upload/UploadTask;

    move-result-object v1

    .line 401
    .local v1, "task":Lcom/vkontakte/android/upload/UploadTask;
    invoke-static {v1, v2}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$$Lambda$6;->lambdaFactory$(Lcom/vkontakte/android/upload/UploadTask;Lcom/vkontakte/android/upload/UploadListener;)Landroid/content/DialogInterface$OnCancelListener;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/app/ProgressDialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    .line 405
    invoke-virtual {v2}, Lcom/vkontakte/android/upload/UploadListener;->startListener()V

    .line 407
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-static {v3, v1}, Lcom/vkontakte/android/upload/Upload;->start(Landroid/content/Context;Lcom/vkontakte/android/upload/UploadTask;)V

    goto :goto_0
.end method

.method private waitAndSendComment()V
    .locals 4

    .prologue
    .line 483
    new-instance v2, Landroid/app/ProgressDialog;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    .line 484
    .local v2, "progress":Landroid/app/ProgressDialog;
    const v3, 0x7f08033d

    invoke-virtual {p0, v3}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 485
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/app/ProgressDialog;->setCancelable(Z)V

    .line 486
    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/app/ProgressDialog;->setCanceledOnTouchOutside(Z)V

    .line 487
    invoke-virtual {v2}, Landroid/app/ProgressDialog;->show()V

    .line 488
    invoke-static {p0, v2}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$$Lambda$8;->lambdaFactory$(Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;Landroid/app/ProgressDialog;)Ljava/lang/Runnable;

    move-result-object v0

    .line 492
    .local v0, "onDone":Ljava/lang/Runnable;
    invoke-static {p0, v2}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$$Lambda$9;->lambdaFactory$(Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;Landroid/app/ProgressDialog;)Ljava/lang/Runnable;

    move-result-object v1

    .line 496
    .local v1, "onFailed":Ljava/lang/Runnable;
    iget-object v3, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->commentBar:Lcom/vkontakte/android/ui/WriteBar;

    invoke-virtual {v3, v0, v1}, Lcom/vkontakte/android/ui/WriteBar;->waitForUploads(Ljava/lang/Runnable;Ljava/lang/Runnable;)V

    .line 497
    return-void
.end method


# virtual methods
.method createReplyLink(ILjava/lang/String;II)Ljava/lang/String;
    .locals 3
    .param p1, "id"    # I
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "groupId"    # I
    .param p4, "replyTo"    # I

    .prologue
    .line 591
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    if-lez p1, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "id"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_0
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ":bp-"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "|"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "club"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    neg-int v2, p1

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method fillPageCount()V
    .locals 7

    .prologue
    const/16 v6, 0x8

    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 744
    iget-object v2, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->commentsLoader:Lcom/vkontakte/android/api/board/BoardCommentsLoader;

    invoke-virtual {v2}, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->getTotal()I

    move-result v1

    .line 745
    .local v1, "total":I
    iget-object v2, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->paginationView:Lcom/vkontakte/android/ui/PaginationView;

    if-eqz v2, :cond_3

    if-ltz v1, :cond_3

    .line 746
    div-int/lit8 v5, v1, 0x14

    rem-int/lit8 v2, v1, 0x14

    if-lez v2, :cond_1

    move v2, v3

    :goto_0
    add-int v0, v5, v2

    .line 747
    .local v0, "pageCount":I
    iget-object v2, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->paginationView:Lcom/vkontakte/android/ui/PaginationView;

    invoke-virtual {v2, v0}, Lcom/vkontakte/android/ui/PaginationView;->setPageCount(I)V

    .line 748
    if-gt v0, v3, :cond_2

    .line 749
    iget-object v2, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->paginationView:Lcom/vkontakte/android/ui/PaginationView;

    invoke-virtual {v2, v6}, Lcom/vkontakte/android/ui/PaginationView;->setVisibility(I)V

    .line 756
    .end local v0    # "pageCount":I
    :cond_0
    :goto_1
    return-void

    :cond_1
    move v2, v4

    .line 746
    goto :goto_0

    .line 750
    .restart local v0    # "pageCount":I
    :cond_2
    iget-object v2, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->paginationView:Lcom/vkontakte/android/ui/PaginationView;

    invoke-virtual {v2}, Lcom/vkontakte/android/ui/PaginationView;->getVisibility()I

    move-result v2

    if-eqz v2, :cond_0

    .line 751
    iget-object v2, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->paginationView:Lcom/vkontakte/android/ui/PaginationView;

    invoke-static {v2, v4}, Lme/grishka/appkit/utils/V;->setVisibilityAnimated(Landroid/view/View;I)V

    goto :goto_1

    .line 754
    .end local v0    # "pageCount":I
    :cond_3
    iget-object v2, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->paginationView:Lcom/vkontakte/android/ui/PaginationView;

    invoke-static {v2, v6}, Lcom/vkontakte/android/ViewUtils;->setVisibility(Landroid/view/View;I)V

    goto :goto_1
.end method

.method public hideEmojiPopup()V
    .locals 1

    .prologue
    .line 680
    iget-object v0, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->keyboardPopup:Lcom/vkontakte/android/stickers/KeyboardPopup;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->keyboardPopup:Lcom/vkontakte/android/stickers/KeyboardPopup;

    invoke-virtual {v0}, Lcom/vkontakte/android/stickers/KeyboardPopup;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 681
    iget-object v0, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->keyboardPopup:Lcom/vkontakte/android/stickers/KeyboardPopup;

    invoke-virtual {v0}, Lcom/vkontakte/android/stickers/KeyboardPopup;->hide()V

    .line 683
    :cond_0
    return-void
.end method

.method synthetic lambda$null$3(Landroid/view/MenuItem;)Z
    .locals 2
    .param p1, "menuItem"    # Landroid/view/MenuItem;

    .prologue
    const/4 v1, 0x1

    .line 333
    iput-boolean v1, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->replyFromGroup:Z

    .line 334
    iget-object v0, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->commentBar:Lcom/vkontakte/android/ui/WriteBar;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/WriteBar;->isUploading()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 335
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->waitAndSendComment()V

    .line 339
    :goto_0
    return v1

    .line 337
    :cond_0
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->sendComment()V

    goto :goto_0
.end method

.method synthetic lambda$onCreateContentView$0(Landroid/view/View;IIIIIIII)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;
    .param p2, "left"    # I
    .param p3, "top"    # I
    .param p4, "right"    # I
    .param p5, "bottom"    # I
    .param p6, "oldLeft"    # I
    .param p7, "oldTop"    # I
    .param p8, "oldRight"    # I
    .param p9, "oldBottom"    # I

    .prologue
    .line 288
    if-ne p2, p6, :cond_0

    if-ne p4, p8, :cond_0

    if-ne p3, p7, :cond_0

    if-eq p5, p9, :cond_1

    .line 289
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->keyboardPopup:Lcom/vkontakte/android/stickers/KeyboardPopup;

    invoke-virtual {v0}, Lcom/vkontakte/android/stickers/KeyboardPopup;->notifyLayoutHasChanged()V

    .line 291
    :cond_1
    return-void
.end method

.method synthetic lambda$onCreateContentView$1(Lcom/vkontakte/android/attachments/GraffitiAttachment;)V
    .locals 1
    .param p1, "graffiti"    # Lcom/vkontakte/android/attachments/GraffitiAttachment;

    .prologue
    .line 308
    instance-of v0, p1, Lcom/vkontakte/android/attachments/PendingAttachment;

    if-eqz v0, :cond_0

    .line 309
    check-cast p1, Lcom/vkontakte/android/attachments/PendingAttachment;

    .end local p1    # "graffiti":Lcom/vkontakte/android/attachments/GraffitiAttachment;
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->sendPendingAttachmentComment(Lcom/vkontakte/android/attachments/PendingAttachment;)V

    .line 313
    :goto_0
    return-void

    .line 311
    .restart local p1    # "graffiti":Lcom/vkontakte/android/attachments/GraffitiAttachment;
    :cond_0
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->sendAttachmentComment(Lcom/vkontakte/android/attachments/Attachment;)V

    goto :goto_0
.end method

.method synthetic lambda$onCreateContentView$2(Landroid/view/View;ILandroid/view/KeyEvent;)Z
    .locals 3
    .param p1, "v"    # Landroid/view/View;
    .param p2, "keyCode"    # I
    .param p3, "event"    # Landroid/view/KeyEvent;

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 317
    const/4 v2, 0x4

    if-ne p2, v2, :cond_1

    iget-object v2, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->keyboardPopup:Lcom/vkontakte/android/stickers/KeyboardPopup;

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->keyboardPopup:Lcom/vkontakte/android/stickers/KeyboardPopup;

    invoke-virtual {v2}, Lcom/vkontakte/android/stickers/KeyboardPopup;->isShowing()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 318
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result v2

    if-ne v2, v0, :cond_0

    .line 319
    iget-object v2, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->keyboardPopup:Lcom/vkontakte/android/stickers/KeyboardPopup;

    invoke-virtual {v2, v1}, Lcom/vkontakte/android/stickers/KeyboardPopup;->show(Z)V

    .line 323
    :cond_0
    :goto_0
    return v0

    :cond_1
    move v0, v1

    goto :goto_0
.end method

.method synthetic lambda$onCreateContentView$4(Landroid/view/View;)Z
    .locals 4
    .param p1, "view1"    # Landroid/view/View;

    .prologue
    .line 327
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->getGroupId()I

    move-result v1

    invoke-static {v1}, Lcom/vkontakte/android/data/Groups;->getAdminLevel(I)I

    move-result v1

    const/4 v2, 0x2

    if-ge v1, v2, :cond_0

    .line 328
    const/4 v1, 0x0

    .line 342
    :goto_0
    return v1

    .line 330
    :cond_0
    new-instance v0, Landroid/widget/PopupMenu;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->commentBar:Lcom/vkontakte/android/ui/WriteBar;

    const v3, 0x7f1005cc

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/ui/WriteBar;->findViewById(I)Landroid/view/View;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/widget/PopupMenu;-><init>(Landroid/content/Context;Landroid/view/View;)V

    .line 331
    .local v0, "menu":Landroid/widget/PopupMenu;
    invoke-virtual {v0}, Landroid/widget/PopupMenu;->getMenu()Landroid/view/Menu;

    move-result-object v1

    const v2, 0x7f0805bb

    invoke-interface {v1, v2}, Landroid/view/Menu;->add(I)Landroid/view/MenuItem;

    .line 332
    invoke-static {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$$Lambda$11;->lambdaFactory$(Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;)Landroid/widget/PopupMenu$OnMenuItemClickListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/PopupMenu;->setOnMenuItemClickListener(Landroid/widget/PopupMenu$OnMenuItemClickListener;)V

    .line 341
    invoke-virtual {v0}, Landroid/widget/PopupMenu;->show()V

    .line 342
    const/4 v1, 0x1

    goto :goto_0
.end method

.method synthetic lambda$onCreateContentView$5(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 346
    iget-object v0, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->commentBar:Lcom/vkontakte/android/ui/WriteBar;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/WriteBar;->isUploading()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 347
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->waitAndSendComment()V

    .line 351
    :goto_0
    return-void

    .line 349
    :cond_0
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->sendComment()V

    goto :goto_0
.end method

.method synthetic lambda$onPageSelected$7(Landroid/widget/EditText;Landroid/content/DialogInterface;I)V
    .locals 2
    .param p1, "edit"    # Landroid/widget/EditText;
    .param p2, "dialog"    # Landroid/content/DialogInterface;
    .param p3, "which"    # I

    .prologue
    .line 437
    :try_start_0
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    .line 438
    .local v0, "n":I
    if-lez v0, :cond_0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->paginationView:Lcom/vkontakte/android/ui/PaginationView;

    invoke-virtual {v1}, Lcom/vkontakte/android/ui/PaginationView;->getPageCount()I

    move-result v1

    if-gt v0, v1, :cond_0

    .line 439
    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->onPageSelected(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 444
    .end local v0    # "n":I
    :cond_0
    :goto_0
    return-void

    .line 441
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method synthetic lambda$showCommentActions$10(Lcom/vkontakte/android/api/board/BoardComment;Landroid/content/DialogInterface;I)V
    .locals 5
    .param p1, "comment"    # Lcom/vkontakte/android/api/board/BoardComment;
    .param p2, "dialog"    # Landroid/content/DialogInterface;
    .param p3, "which"    # I

    .prologue
    .line 608
    iget-object v2, p1, Lcom/vkontakte/android/api/board/BoardComment;->linkUrls:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge p3, v2, :cond_0

    .line 609
    new-instance v1, Landroid/content/Intent;

    const-string/jumbo v3, "android.intent.action.VIEW"

    iget-object v2, p1, Lcom/vkontakte/android/api/board/BoardComment;->linkUrls:Ljava/util/ArrayList;

    invoke-virtual {v2, p3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-direct {v1, v3, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 610
    .local v1, "intent":Landroid/content/Intent;
    invoke-virtual {p0, v1}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->startActivity(Landroid/content/Intent;)V

    .line 627
    .end local v1    # "intent":Landroid/content/Intent;
    :goto_0
    return-void

    .line 612
    :cond_0
    iget-object v2, p1, Lcom/vkontakte/android/api/board/BoardComment;->linkUrls:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    sub-int/2addr p3, v2

    .line 613
    packed-switch p3, :pswitch_data_0

    goto :goto_0

    .line 615
    :pswitch_0
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    const-string/jumbo v3, "clipboard"

    invoke-virtual {v2, v3}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/text/ClipboardManager;

    .line 616
    .local v0, "clipboard":Landroid/text/ClipboardManager;
    iget-object v2, p1, Lcom/vkontakte/android/api/board/BoardComment;->text:Ljava/lang/String;

    invoke-virtual {v0, v2}, Landroid/text/ClipboardManager;->setText(Ljava/lang/CharSequence;)V

    .line 617
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    const v3, 0x7f080703

    const/4 v4, 0x0

    invoke-static {v2, v3, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 620
    .end local v0    # "clipboard":Landroid/text/ClipboardManager;
    :pswitch_1
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->deleteComment(Lcom/vkontakte/android/api/board/BoardComment;)V

    goto :goto_0

    .line 623
    :pswitch_2
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->editComment(Lcom/vkontakte/android/api/board/BoardComment;)V

    goto :goto_0

    .line 613
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method synthetic lambda$waitAndSendComment$8(Landroid/app/ProgressDialog;)V
    .locals 0
    .param p1, "progress"    # Landroid/app/ProgressDialog;

    .prologue
    .line 489
    invoke-static {p1}, Lcom/vkontakte/android/ViewUtils;->dismissDialogSafety(Landroid/app/Dialog;)V

    .line 490
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->sendComment()V

    .line 491
    return-void
.end method

.method synthetic lambda$waitAndSendComment$9(Landroid/app/ProgressDialog;)V
    .locals 3
    .param p1, "progress"    # Landroid/app/ProgressDialog;

    .prologue
    .line 493
    invoke-static {p1}, Lcom/vkontakte/android/ViewUtils;->dismissDialogSafety(Landroid/app/Dialog;)V

    .line 494
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const v1, 0x7f0801f9

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 495
    return-void
.end method

.method public bridge synthetic likeComment(Lcom/vkontakte/android/Comment;)V
    .locals 0

    .prologue
    .line 76
    check-cast p1, Lcom/vkontakte/android/api/board/BoardComment;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->likeComment(Lcom/vkontakte/android/api/board/BoardComment;)V

    return-void
.end method

.method public likeComment(Lcom/vkontakte/android/api/board/BoardComment;)V
    .locals 7
    .param p1, "comm"    # Lcom/vkontakte/android/api/board/BoardComment;

    .prologue
    const/4 v3, 0x1

    .line 451
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 452
    .local v0, "activity":Landroid/app/Activity;
    if-nez v0, :cond_0

    .line 480
    :goto_0
    return-void

    .line 455
    :cond_0
    new-instance v2, Lcom/vkontakte/android/api/board/BoardCommentLike;

    invoke-virtual {p1}, Lcom/vkontakte/android/api/board/BoardComment;->isLiked()Z

    move-result v4

    iget v5, p1, Lcom/vkontakte/android/api/board/BoardComment;->ownerId:I

    invoke-virtual {p1}, Lcom/vkontakte/android/api/board/BoardComment;->getId()I

    move-result v6

    invoke-direct {v2, v4, v5, v6}, Lcom/vkontakte/android/api/board/BoardCommentLike;-><init>(ZII)V

    new-instance v4, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$3;

    invoke-direct {v4, p0, p1}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$3;-><init>(Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;Lcom/vkontakte/android/api/board/BoardComment;)V

    .line 456
    invoke-virtual {v2, v4}, Lcom/vkontakte/android/api/board/BoardCommentLike;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    .line 475
    .local v1, "request":Lcom/vkontakte/android/api/VKAPIRequest;
    iget v4, p1, Lcom/vkontakte/android/api/board/BoardComment;->likesCount:I

    iget-boolean v2, p1, Lcom/vkontakte/android/api/board/BoardComment;->isLiked:Z

    if-eqz v2, :cond_1

    const/4 v2, -0x1

    :goto_1
    add-int/2addr v2, v4

    iput v2, p1, Lcom/vkontakte/android/api/board/BoardComment;->likesCount:I

    .line 476
    iget-boolean v2, p1, Lcom/vkontakte/android/api/board/BoardComment;->isLiked:Z

    if-nez v2, :cond_2

    :goto_2
    iput-boolean v3, p1, Lcom/vkontakte/android/api/board/BoardComment;->isLiked:Z

    .line 477
    iget-object v2, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->commentsAdapter:Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$CommentsAdapter;

    invoke-virtual {v2}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$CommentsAdapter;->notifyDataSetChanged()V

    .line 479
    invoke-virtual {v1, v0}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    goto :goto_0

    :cond_1
    move v2, v3

    .line 475
    goto :goto_1

    .line 476
    :cond_2
    const/4 v3, 0x0

    goto :goto_2
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 7
    .param p1, "reqCode"    # I
    .param p2, "resCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 500
    invoke-super {p0, p1, p2, p3}, Lcom/vkontakte/android/fragments/VKToolbarFragment;->onActivityResult(IILandroid/content/Intent;)V

    .line 501
    const/16 v4, 0x10e9

    if-ne p1, v4, :cond_2

    const/4 v4, -0x1

    if-ne p2, v4, :cond_2

    .line 502
    const-string/jumbo v4, "comment"

    invoke-virtual {p3, v4}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/api/board/BoardComment;

    .line 503
    .local v0, "ce":Lcom/vkontakte/android/api/board/BoardComment;
    iget-object v4, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->commentsAdapter:Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$CommentsAdapter;

    iget-object v4, v4, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$CommentsAdapter;->comments:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/api/board/BoardComment;

    .line 504
    .local v1, "comm":Lcom/vkontakte/android/api/board/BoardComment;
    iget v5, v1, Lcom/vkontakte/android/api/board/BoardComment;->id:I

    iget v6, v0, Lcom/vkontakte/android/api/board/BoardComment;->id:I

    if-ne v5, v6, :cond_0

    .line 505
    iget-object v4, v0, Lcom/vkontakte/android/api/board/BoardComment;->text:Ljava/lang/String;

    iput-object v4, v1, Lcom/vkontakte/android/api/board/BoardComment;->text:Ljava/lang/String;

    .line 506
    iget-object v4, v1, Lcom/vkontakte/android/api/board/BoardComment;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->clear()V

    .line 507
    iget-object v4, v1, Lcom/vkontakte/android/api/board/BoardComment;->attachments:Ljava/util/ArrayList;

    iget-object v5, v0, Lcom/vkontakte/android/api/board/BoardComment;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 508
    invoke-virtual {v1}, Lcom/vkontakte/android/api/board/BoardComment;->processLinksAndEmoji()V

    .line 509
    sget-object v4, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    .line 510
    .local v2, "metrics":Landroid/util/DisplayMetrics;
    iget v4, v2, Landroid/util/DisplayMetrics;->widthPixels:I

    iget v5, v2, Landroid/util/DisplayMetrics;->heightPixels:I

    invoke-static {v4, v5}, Ljava/lang/Math;->min(II)I

    move-result v4

    const/high16 v5, 0x42be0000    # 95.0f

    invoke-static {v5}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v5

    sub-int v3, v4, v5

    .line 511
    .local v3, "tSize":I
    const/16 v4, 0x25c

    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v3

    .line 512
    int-to-float v4, v3

    const v5, 0x3f2a7efa    # 0.666f

    mul-float/2addr v4, v5

    float-to-int v4, v4

    iget-object v5, v1, Lcom/vkontakte/android/api/board/BoardComment;->attachments:Ljava/util/ArrayList;

    invoke-static {v3, v4, v5}, Lcom/vkontakte/android/ZhukovLayout;->processThumbs(IILjava/util/List;)V

    .line 513
    iget-object v4, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->commentsAdapter:Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$CommentsAdapter;

    invoke-virtual {v4}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$CommentsAdapter;->notifyDataSetChanged()V

    .line 522
    .end local v0    # "ce":Lcom/vkontakte/android/api/board/BoardComment;
    .end local v1    # "comm":Lcom/vkontakte/android/api/board/BoardComment;
    .end local v2    # "metrics":Landroid/util/DisplayMetrics;
    .end local v3    # "tSize":I
    :cond_1
    :goto_0
    return-void

    .line 518
    :cond_2
    const/16 v4, 0x2710

    if-le p1, v4, :cond_1

    .line 519
    iget-object v4, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->commentBar:Lcom/vkontakte/android/ui/WriteBar;

    invoke-virtual {v4, p1, p2, p3}, Lcom/vkontakte/android/ui/WriteBar;->onActivityResult(IILandroid/content/Intent;)V

    goto :goto_0
.end method

.method public onAttach(Landroid/app/Activity;)V
    .locals 2
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 190
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/VKToolbarFragment;->onAttach(Landroid/app/Activity;)V

    .line 191
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "title"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 192
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "title"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->setTitle(Ljava/lang/CharSequence;)V

    .line 194
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "topic-"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-direct {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->getGroupId()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-direct {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->getTopicId()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/vkontakte/android/ActivityUtils;->setBeamLink(Landroid/app/Activity;Ljava/lang/String;)V

    .line 195
    return-void
.end method

.method public onBackPressed()Z
    .locals 1

    .prologue
    .line 687
    iget-object v0, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->keyboardPopup:Lcom/vkontakte/android/stickers/KeyboardPopup;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->keyboardPopup:Lcom/vkontakte/android/stickers/KeyboardPopup;

    invoke-virtual {v0}, Lcom/vkontakte/android/stickers/KeyboardPopup;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 688
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->hideEmojiPopup()V

    .line 689
    const/4 v0, 0x1

    .line 691
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onBackspace()V
    .locals 4

    .prologue
    .line 106
    iget-object v0, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->commentBar:Lcom/vkontakte/android/ui/WriteBar;

    const v1, 0x7f1005c7

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/WriteBar;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v1, Landroid/view/KeyEvent;

    const/4 v2, 0x0

    const/16 v3, 0x43

    invoke-direct {v1, v2, v3}, Landroid/view/KeyEvent;-><init>(II)V

    invoke-virtual {v0, v1}, Landroid/view/View;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    .line 107
    return-void
.end method

.method public onCommentLoaded(IIZLjava/util/List;)V
    .locals 5
    .param p1, "from"    # I
    .param p2, "count"    # I
    .param p3, "isTop"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IIZ",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/api/board/BoardComment;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p4, "allLoadedData":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/api/board/BoardComment;>;"
    const/4 v4, 0x1

    .line 696
    if-eqz p3, :cond_1

    .line 697
    iget-object v3, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->layoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {v3}, Landroid/support/v7/widget/LinearLayoutManager;->findFirstVisibleItemPosition()I

    move-result v1

    .line 698
    .local v1, "firstPosition":I
    iget-object v3, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->layoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {v3, v1}, Landroid/support/v7/widget/LinearLayoutManager;->findViewByPosition(I)Landroid/view/View;

    move-result-object v2

    .line 699
    .local v2, "view":Landroid/view/View;
    if-nez v2, :cond_0

    const/4 v0, 0x0

    .line 700
    .local v0, "dy":I
    :goto_0
    add-int/2addr v1, p2

    .line 701
    iget-object v3, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->commentsAdapter:Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$CommentsAdapter;

    invoke-virtual {v3, p4, v4}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$CommentsAdapter;->setData(Ljava/util/List;Z)V

    .line 702
    iget-object v3, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->layoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {v3, v1, v0}, Landroid/support/v7/widget/LinearLayoutManager;->scrollToPositionWithOffset(II)V

    .line 706
    .end local v0    # "dy":I
    .end local v1    # "firstPosition":I
    .end local v2    # "view":Landroid/view/View;
    :goto_1
    return-void

    .line 699
    .restart local v1    # "firstPosition":I
    .restart local v2    # "view":Landroid/view/View;
    :cond_0
    invoke-virtual {v2}, Landroid/view/View;->getTop()I

    move-result v0

    goto :goto_0

    .line 704
    .end local v1    # "firstPosition":I
    .end local v2    # "view":Landroid/view/View;
    :cond_1
    iget-object v3, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->commentsAdapter:Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$CommentsAdapter;

    invoke-virtual {v3, p4, v4}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$CommentsAdapter;->setData(Ljava/util/List;Z)V

    goto :goto_1
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 2
    .param p1, "cfg"    # Landroid/content/res/Configuration;

    .prologue
    .line 199
    iget-object v0, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->keyboardPopup:Lcom/vkontakte/android/stickers/KeyboardPopup;

    if-eqz v0, :cond_0

    .line 200
    iget-object v0, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->keyboardPopup:Lcom/vkontakte/android/stickers/KeyboardPopup;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/stickers/KeyboardPopup;->show(Z)V

    .line 201
    iget-object v0, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->keyboardPopup:Lcom/vkontakte/android/stickers/KeyboardPopup;

    invoke-virtual {v0}, Lcom/vkontakte/android/stickers/KeyboardPopup;->notifyLayoutHasChanged()V

    .line 202
    iget-object v0, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->stickersView:Lcom/vkontakte/android/stickers/StickersView;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/stickers/StickersView;->dispatchConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 204
    :cond_0
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 6
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 208
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/VKToolbarFragment;->onCreate(Landroid/os/Bundle;)V

    .line 209
    new-instance v0, Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/support/v7/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->layoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    .line 210
    new-instance v0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;

    invoke-direct {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->getGroupId()I

    move-result v1

    invoke-direct {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->getTopicId()I

    move-result v2

    const/16 v3, 0x14

    invoke-direct {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->isShowLastComment()Z

    move-result v5

    move-object v4, p0

    invoke-direct/range {v0 .. v5}, Lcom/vkontakte/android/api/board/BoardCommentsLoader;-><init>(IIILcom/vkontakte/android/api/board/BoardCommentsLoader$BoardCommentsLoaderListener;Z)V

    .line 211
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->getStartOffset()I

    move-result v1

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->show(ILandroid/content/Context;)Lcom/vkontakte/android/api/board/BoardCommentsLoader;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->commentsLoader:Lcom/vkontakte/android/api/board/BoardCommentsLoader;

    .line 212
    return-void
.end method

.method public onCreateContentView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 9
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 237
    const v4, 0x7f0300a2

    invoke-virtual {p1, v4, p2, v7}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v3

    .line 240
    .local v3, "view":Landroid/view/View;
    const v4, 0x7f1002a6

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    iput-object v4, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->bigProgress:Landroid/view/View;

    .line 241
    iget-object v4, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->bigProgress:Landroid/view/View;

    iget v5, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->bigProgressVisibility:I

    invoke-virtual {v4, v5}, Landroid/view/View;->setVisibility(I)V

    .line 243
    const v4, 0x7f1002a7

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    iput-object v4, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->createHint:Landroid/view/View;

    .line 244
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->getTopicId()I

    move-result v4

    const/4 v5, -0x1

    if-ne v4, v5, :cond_0

    .line 245
    iget-object v4, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->createHint:Landroid/view/View;

    invoke-virtual {v4, v7}, Landroid/view/View;->setVisibility(I)V

    .line 248
    :cond_0
    const v4, 0x7f10018a

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lme/grishka/appkit/views/UsableRecyclerView;

    .line 249
    .local v2, "list":Lme/grishka/appkit/views/UsableRecyclerView;
    iget-object v4, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->layoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {v2, v4}, Lme/grishka/appkit/views/UsableRecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    .line 250
    new-instance v1, Lme/grishka/appkit/views/DividerItemDecoration;

    new-instance v4, Landroid/graphics/drawable/ColorDrawable;

    const/high16 v5, 0x26000000

    invoke-direct {v4, v5}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    const/high16 v5, 0x3f000000    # 0.5f

    invoke-static {v5}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v5

    invoke-direct {v1, v4, v5}, Lme/grishka/appkit/views/DividerItemDecoration;-><init>(Landroid/graphics/drawable/Drawable;I)V

    .line 251
    .local v1, "dividers":Lme/grishka/appkit/views/DividerItemDecoration;
    invoke-virtual {v2, v1}, Lme/grishka/appkit/views/UsableRecyclerView;->addItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    .line 254
    new-instance v0, Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    invoke-direct {v0}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;-><init>()V

    .line 255
    .local v0, "adapter":Lme/grishka/appkit/utils/MergeRecyclerAdapter;
    iget-object v4, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->pollAdapter:Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$PollAdapter;

    invoke-virtual {v0, v4}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->addAdapter(Lme/grishka/appkit/views/UsableRecyclerView$Adapter;)V

    .line 256
    iget-object v4, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->commentsAdapter:Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$CommentsAdapter;

    invoke-virtual {v0, v4}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->addAdapter(Lme/grishka/appkit/views/UsableRecyclerView$Adapter;)V

    .line 258
    invoke-virtual {v2, v0}, Lme/grishka/appkit/views/UsableRecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 260
    new-instance v4, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$1;

    invoke-direct {v4, p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$1;-><init>(Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;)V

    invoke-virtual {v2, v4}, Lme/grishka/appkit/views/UsableRecyclerView;->setListener(Lme/grishka/appkit/views/UsableRecyclerView$Listener;)V

    .line 287
    invoke-static {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;)Landroid/view/View$OnLayoutChangeListener;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/view/View;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    .line 293
    const v4, 0x7f1002a5

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/vkontakte/android/ui/WriteBar;

    iput-object v4, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->commentBar:Lcom/vkontakte/android/ui/WriteBar;

    .line 295
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->canWrite()Z

    move-result v4

    if-nez v4, :cond_1

    .line 296
    iget-object v4, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->commentBar:Lcom/vkontakte/android/ui/WriteBar;

    const/16 v5, 0x8

    invoke-virtual {v4, v5}, Lcom/vkontakte/android/ui/WriteBar;->setVisibility(I)V

    .line 299
    :cond_1
    new-instance v4, Lcom/vkontakte/android/stickers/StickersView;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v5

    invoke-direct {v4, v5, p0}, Lcom/vkontakte/android/stickers/StickersView;-><init>(Landroid/content/Context;Lcom/vkontakte/android/stickers/StickersView$Listener;)V

    iput-object v4, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->stickersView:Lcom/vkontakte/android/stickers/StickersView;

    .line 300
    new-instance v4, Lcom/vkontakte/android/stickers/KeyboardPopup;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v5

    iget-object v6, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->stickersView:Lcom/vkontakte/android/stickers/StickersView;

    invoke-direct {v4, v5, v3, v6}, Lcom/vkontakte/android/stickers/KeyboardPopup;-><init>(Landroid/app/Activity;Landroid/view/View;Landroid/view/View;)V

    iput-object v4, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->keyboardPopup:Lcom/vkontakte/android/stickers/KeyboardPopup;

    .line 301
    iget-object v4, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->keyboardPopup:Lcom/vkontakte/android/stickers/KeyboardPopup;

    iget-object v5, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->commentBar:Lcom/vkontakte/android/ui/WriteBar;

    invoke-virtual {v5}, Lcom/vkontakte/android/ui/WriteBar;->getAnchor()Landroid/view/View;

    move-result-object v5

    const v6, -0x14110e

    invoke-virtual {v4, v5, v6}, Lcom/vkontakte/android/stickers/KeyboardPopup;->attachToAnchor(Landroid/view/View;I)V

    .line 302
    iget-object v4, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->keyboardPopup:Lcom/vkontakte/android/stickers/KeyboardPopup;

    iget-object v5, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->commentBar:Lcom/vkontakte/android/ui/WriteBar;

    invoke-virtual {v4, v5}, Lcom/vkontakte/android/stickers/KeyboardPopup;->setOnVisibilityChangedListener(Lcom/vkontakte/android/stickers/KeyboardPopup$OnVisibilityChangedListener;)V

    .line 304
    iget-object v4, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->commentBar:Lcom/vkontakte/android/ui/WriteBar;

    invoke-virtual {v4, p0}, Lcom/vkontakte/android/ui/WriteBar;->setAutoSuggestPopupListener(Lcom/vkontakte/android/stickers/StickersView$Listener;)V

    .line 306
    iget-object v4, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->commentBar:Lcom/vkontakte/android/ui/WriteBar;

    invoke-virtual {v4, v8}, Lcom/vkontakte/android/ui/WriteBar;->setGraffitiAllowed(Z)V

    .line 307
    iget-object v4, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->commentBar:Lcom/vkontakte/android/ui/WriteBar;

    invoke-static {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$$Lambda$2;->lambdaFactory$(Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;)Lcom/vkontakte/android/ui/WriteBar$GraffitiSender;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/vkontakte/android/ui/WriteBar;->setGraffitiSender(Lcom/vkontakte/android/ui/WriteBar$GraffitiSender;)V

    .line 315
    iget-object v4, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->commentBar:Lcom/vkontakte/android/ui/WriteBar;

    iget-object v5, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->keyboardPopup:Lcom/vkontakte/android/stickers/KeyboardPopup;

    invoke-virtual {v4, v5}, Lcom/vkontakte/android/ui/WriteBar;->setKeyboardPopup(Lcom/vkontakte/android/stickers/KeyboardPopup;)V

    .line 316
    iget-object v4, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->commentBar:Lcom/vkontakte/android/ui/WriteBar;

    const v5, 0x7f1005c7

    invoke-virtual {v4, v5}, Lcom/vkontakte/android/ui/WriteBar;->findViewById(I)Landroid/view/View;

    move-result-object v4

    invoke-static {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$$Lambda$3;->lambdaFactory$(Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;)Landroid/view/View$OnKeyListener;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/view/View;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    .line 326
    iget-object v4, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->commentBar:Lcom/vkontakte/android/ui/WriteBar;

    const v5, 0x7f1005cc

    invoke-virtual {v4, v5}, Lcom/vkontakte/android/ui/WriteBar;->findViewById(I)Landroid/view/View;

    move-result-object v4

    invoke-static {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$$Lambda$4;->lambdaFactory$(Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;)Landroid/view/View$OnLongClickListener;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 345
    iget-object v4, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->commentBar:Lcom/vkontakte/android/ui/WriteBar;

    invoke-static {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$$Lambda$5;->lambdaFactory$(Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;)Landroid/view/View$OnClickListener;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/vkontakte/android/ui/WriteBar;->setOnSendClickListener(Landroid/view/View$OnClickListener;)V

    .line 353
    iget-object v4, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->commentBar:Lcom/vkontakte/android/ui/WriteBar;

    invoke-virtual {v4, p0}, Lcom/vkontakte/android/ui/WriteBar;->setFragment(Landroid/app/Fragment;)V

    .line 354
    iget-object v4, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->commentBar:Lcom/vkontakte/android/ui/WriteBar;

    invoke-direct {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->getGroupId()I

    move-result v5

    neg-int v5, v5

    invoke-virtual {v4, v8, v5}, Lcom/vkontakte/android/ui/WriteBar;->setUploadType(ZI)V

    .line 355
    iget-object v4, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->commentBar:Lcom/vkontakte/android/ui/WriteBar;

    const/16 v5, 0xa

    invoke-virtual {v4, v5, v7}, Lcom/vkontakte/android/ui/WriteBar;->setAttachLimits(IZ)V

    .line 357
    const v4, 0x7f1002a9

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/vkontakte/android/ui/PaginationView;

    iput-object v4, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->paginationView:Lcom/vkontakte/android/ui/PaginationView;

    .line 358
    iget-object v4, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->paginationView:Lcom/vkontakte/android/ui/PaginationView;

    invoke-virtual {v4, p0}, Lcom/vkontakte/android/ui/PaginationView;->setListener(Lcom/vkontakte/android/ui/PaginationView$Listener;)V

    .line 360
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->fillPageCount()V

    .line 362
    return-object v3
.end method

.method public onDestroy()V
    .locals 1

    .prologue
    .line 227
    invoke-super {p0}, Lcom/vkontakte/android/fragments/VKToolbarFragment;->onDestroy()V

    .line 228
    iget-object v0, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->commentsLoader:Lcom/vkontakte/android/api/board/BoardCommentsLoader;

    invoke-virtual {v0}, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->cancel()V

    .line 229
    return-void
.end method

.method public onDestroyView()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 216
    invoke-super {p0}, Lcom/vkontakte/android/fragments/VKToolbarFragment;->onDestroyView()V

    .line 217
    iput-object v0, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->commentBar:Lcom/vkontakte/android/ui/WriteBar;

    .line 218
    iput-object v0, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->paginationView:Lcom/vkontakte/android/ui/PaginationView;

    .line 219
    iput-object v0, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->keyboardPopup:Lcom/vkontakte/android/stickers/KeyboardPopup;

    .line 220
    iput-object v0, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->stickersView:Lcom/vkontakte/android/stickers/StickersView;

    .line 221
    iput-object v0, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->bigProgress:Landroid/view/View;

    .line 222
    iput-object v0, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->createHint:Landroid/view/View;

    .line 223
    return-void
.end method

.method public onEmojiSelected(Ljava/lang/String;)V
    .locals 4
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 97
    iget-object v2, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->commentBar:Lcom/vkontakte/android/ui/WriteBar;

    const v3, 0x7f1005c7

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/ui/WriteBar;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    .line 98
    .local v0, "edit":Landroid/widget/EditText;
    invoke-virtual {v0}, Landroid/widget/EditText;->getSelectionEnd()I

    move-result v1

    .line 99
    .local v1, "pos":I
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-interface {v2, v1, p1}, Landroid/text/Editable;->insert(ILjava/lang/CharSequence;)Landroid/text/Editable;

    .line 100
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    add-int/2addr v1, v2

    .line 101
    invoke-virtual {v0, v1, v1}, Landroid/widget/EditText;->setSelection(II)V

    .line 102
    return-void
.end method

.method public onFinishLoading(IZ)V
    .locals 2
    .param p1, "currentDataSize"    # I
    .param p2, "isTop"    # Z

    .prologue
    .line 726
    iget-object v0, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->bigProgress:Landroid/view/View;

    const/16 v1, 0x8

    iput v1, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->bigProgressVisibility:I

    invoke-static {v0, v1}, Lcom/vkontakte/android/ViewUtils;->setVisibility(Landroid/view/View;I)V

    .line 727
    return-void
.end method

.method public onItemDeleted(ILjava/util/List;)V
    .locals 2
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/api/board/BoardComment;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 715
    .local p2, "allLoadedData":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/api/board/BoardComment;>;"
    iget-object v0, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->commentsAdapter:Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$CommentsAdapter;

    const/4 v1, 0x0

    invoke-virtual {v0, p2, v1}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$CommentsAdapter;->setData(Ljava/util/List;Z)V

    .line 716
    iget-object v0, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->commentsAdapter:Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$CommentsAdapter;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$CommentsAdapter;->notifyItemRemoved(I)V

    .line 717
    return-void
.end method

.method public onPageSelected(I)V
    .locals 10
    .param p1, "num"    # I

    .prologue
    const/4 v9, 0x0

    const/4 v8, 0x1

    .line 413
    new-array v4, v8, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v9

    invoke-static {v4}, Lcom/vkontakte/android/utils/L;->e([Ljava/lang/Object;)V

    .line 414
    if-lez p1, :cond_0

    .line 415
    iget-object v4, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->paginationView:Lcom/vkontakte/android/ui/PaginationView;

    invoke-virtual {v4, p1}, Lcom/vkontakte/android/ui/PaginationView;->setCurrentPage(I)V

    .line 416
    add-int/lit8 v4, p1, -0x1

    mul-int/lit8 v4, v4, 0x14

    invoke-virtual {p0, v4}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->showOffset(I)V

    .line 447
    :goto_0
    return-void

    .line 418
    :cond_0
    new-instance v3, Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-direct {v3, v4}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 419
    .local v3, "tv":Landroid/widget/TextView;
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f080492

    new-array v6, v8, [Ljava/lang/Object;

    iget-object v7, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->paginationView:Lcom/vkontakte/android/ui/PaginationView;

    invoke-virtual {v7}, Lcom/vkontakte/android/ui/PaginationView;->getPageCount()I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v9

    invoke-virtual {v4, v5, v6}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 421
    new-instance v0, Landroid/widget/EditText;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-direct {v0, v4}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    .line 422
    .local v0, "edit":Landroid/widget/EditText;
    const/16 v4, 0x2000

    invoke-virtual {v0, v4}, Landroid/widget/EditText;->setInputType(I)V

    .line 423
    const/high16 v4, 0x43480000    # 200.0f

    invoke-static {v4}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v4

    invoke-virtual {v0, v4}, Landroid/widget/EditText;->setWidth(I)V

    .line 424
    iget-object v4, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->paginationView:Lcom/vkontakte/android/ui/PaginationView;

    invoke-virtual {v4}, Lcom/vkontakte/android/ui/PaginationView;->getCurrentPage()I

    move-result v4

    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 425
    const/4 v4, 0x2

    invoke-virtual {v0, v4}, Landroid/widget/EditText;->setInputType(I)V

    .line 426
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v4

    invoke-interface {v4}, Landroid/text/Editable;->length()I

    move-result v4

    invoke-virtual {v0, v4}, Landroid/widget/EditText;->setSelection(I)V

    .line 428
    new-instance v1, Landroid/widget/LinearLayout;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-direct {v1, v4}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 429
    .local v1, "ll":Landroid/widget/LinearLayout;
    invoke-virtual {v1, v8}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 430
    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 431
    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 432
    const/high16 v4, 0x41200000    # 10.0f

    invoke-static {v4}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v2

    .line 433
    .local v2, "padding":I
    invoke-virtual {v1, v2, v2, v2, v2}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 435
    new-instance v4, Lcom/vkontakte/android/VKAlertDialog$Builder;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v5

    invoke-direct {v4, v5}, Lcom/vkontakte/android/VKAlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v5, 0x7f080328

    invoke-virtual {v4, v5}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    invoke-virtual {v4, v1}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    const v5, 0x7f080479

    invoke-static {p0, v0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$$Lambda$7;->lambdaFactory$(Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;Landroid/widget/EditText;)Landroid/content/DialogInterface$OnClickListener;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    const v5, 0x7f08011f

    const/4 v6, 0x0

    .line 444
    invoke-virtual {v4, v5, v6}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    invoke-virtual {v4}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 445
    invoke-static {v0}, Lcom/vk/core/util/KeyboardUtils;->showKeyboard(Landroid/view/View;)V

    goto/16 :goto_0
.end method

.method public onStartLoading(IZ)V
    .locals 2
    .param p1, "currentDataSize"    # I
    .param p2, "isTop"    # Z

    .prologue
    .line 721
    iget-object v1, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->bigProgress:Landroid/view/View;

    if-nez p1, :cond_0

    const/4 v0, 0x0

    :goto_0
    iput v0, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->bigProgressVisibility:I

    invoke-static {v1, v0}, Lcom/vkontakte/android/ViewUtils;->setVisibility(Landroid/view/View;I)V

    .line 722
    return-void

    .line 721
    :cond_0
    const/16 v0, 0x8

    goto :goto_0
.end method

.method public onStartReload()V
    .locals 3

    .prologue
    .line 731
    iget-object v0, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->commentsAdapter:Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$CommentsAdapter;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$CommentsAdapter;->setData(Ljava/util/List;Z)V

    .line 732
    return-void
.end method

.method public onStickerSelected(IILjava/lang/String;Ljava/lang/String;)V
    .locals 7
    .param p1, "packId"    # I
    .param p2, "stickerId"    # I
    .param p3, "url"    # Ljava/lang/String;
    .param p4, "stickerReferrer"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 86
    new-instance v0, Lcom/vkontakte/android/attachments/StickerAttachment;

    invoke-direct {v0}, Lcom/vkontakte/android/attachments/StickerAttachment;-><init>()V

    .line 87
    .local v0, "att":Lcom/vkontakte/android/attachments/StickerAttachment;
    iput p2, v0, Lcom/vkontakte/android/attachments/StickerAttachment;->id:I

    .line 88
    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/String;

    aput-object p3, v1, v4

    aput-object v2, v1, v5

    aput-object v2, v1, v6

    iput-object v1, v0, Lcom/vkontakte/android/attachments/StickerAttachment;->images:[Ljava/lang/String;

    .line 89
    iget-object v1, v0, Lcom/vkontakte/android/attachments/StickerAttachment;->images:[Ljava/lang/String;

    iget-object v2, v0, Lcom/vkontakte/android/attachments/StickerAttachment;->images:[Ljava/lang/String;

    iget-object v3, v0, Lcom/vkontakte/android/attachments/StickerAttachment;->images:[Ljava/lang/String;

    aget-object v3, v3, v4

    aput-object v3, v2, v6

    aput-object v3, v1, v5

    .line 90
    iput p1, v0, Lcom/vkontakte/android/attachments/StickerAttachment;->packID:I

    .line 91
    iput-object p4, v0, Lcom/vkontakte/android/attachments/StickerAttachment;->stickerReferrer:Ljava/lang/String;

    .line 92
    invoke-direct {p0, v0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->sendAttachmentComment(Lcom/vkontakte/android/attachments/Attachment;)V

    .line 93
    return-void
.end method

.method public openStickerKeyboard(I)V
    .locals 3
    .param p1, "pack"    # I

    .prologue
    .line 673
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "is_closed"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_0

    .line 674
    iget-object v0, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->keyboardPopup:Lcom/vkontakte/android/stickers/KeyboardPopup;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/stickers/KeyboardPopup;->show(Z)V

    .line 675
    iget-object v0, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->stickersView:Lcom/vkontakte/android/stickers/StickersView;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/stickers/StickersView;->openPack(I)V

    .line 677
    :cond_0
    return-void
.end method

.method public bridge synthetic replyToComment(Lcom/vkontakte/android/Comment;)V
    .locals 0

    .prologue
    .line 76
    check-cast p1, Lcom/vkontakte/android/api/board/BoardComment;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->replyToComment(Lcom/vkontakte/android/api/board/BoardComment;)V

    return-void
.end method

.method public replyToComment(Lcom/vkontakte/android/api/board/BoardComment;)V
    .locals 1
    .param p1, "comment"    # Lcom/vkontakte/android/api/board/BoardComment;

    .prologue
    .line 648
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->replyToComment(Lcom/vkontakte/android/api/board/BoardComment;Z)V

    .line 649
    return-void
.end method

.method public replyToComment(Lcom/vkontakte/android/api/board/BoardComment;Z)V
    .locals 4
    .param p1, "comment"    # Lcom/vkontakte/android/api/board/BoardComment;
    .param p2, "fromGroup"    # Z

    .prologue
    const/4 v3, 0x0

    .line 652
    invoke-virtual {p1}, Lcom/vkontakte/android/api/board/BoardComment;->getId()I

    move-result v1

    iput v1, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->replyTo:I

    .line 653
    iget v1, p1, Lcom/vkontakte/android/api/board/BoardComment;->uid:I

    iput v1, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->replyToUid:I

    .line 654
    iget-object v1, p1, Lcom/vkontakte/android/api/board/BoardComment;->userName:Ljava/lang/String;

    const-string/jumbo v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    aget-object v1, v1, v3

    iput-object v1, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->replyToName:Ljava/lang/String;

    .line 655
    iput-boolean p2, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->replyFromGroup:Z

    .line 656
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    const-string/jumbo v2, "is_closed"

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-nez v1, :cond_1

    .line 657
    iget-object v1, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->commentBar:Lcom/vkontakte/android/ui/WriteBar;

    invoke-virtual {v1}, Lcom/vkontakte/android/ui/WriteBar;->isTextEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 658
    iget-object v1, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->commentBar:Lcom/vkontakte/android/ui/WriteBar;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->replyToName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, ", "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/ui/WriteBar;->setText(Ljava/lang/CharSequence;)V

    .line 660
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->commentBar:Lcom/vkontakte/android/ui/WriteBar;

    invoke-virtual {v1}, Lcom/vkontakte/android/ui/WriteBar;->focus()V

    .line 661
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const-string/jumbo v2, "input_method"

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 662
    .local v0, "imm":Landroid/view/inputmethod/InputMethodManager;
    iget-object v1, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->commentBar:Lcom/vkontakte/android/ui/WriteBar;

    const v2, 0x7f1005c7

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/ui/WriteBar;->findViewById(I)Landroid/view/View;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/view/inputmethod/InputMethodManager;->showSoftInput(Landroid/view/View;I)Z

    .line 664
    .end local v0    # "imm":Landroid/view/inputmethod/InputMethodManager;
    :cond_1
    return-void
.end method

.method public scrollToPosition(IZ)V
    .locals 3
    .param p1, "position"    # I
    .param p2, "smooth"    # Z

    .prologue
    const/4 v2, 0x0

    .line 736
    if-eqz p2, :cond_0

    .line 737
    iget-object v0, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->layoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->pollAdapter:Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$PollAdapter;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$PollAdapter;->getItemCount()I

    move-result v1

    add-int/2addr v1, p1

    invoke-virtual {v0, v1, v2}, Landroid/support/v7/widget/LinearLayoutManager;->scrollToPositionWithOffset(II)V

    .line 741
    :goto_0
    return-void

    .line 739
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->layoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->pollAdapter:Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$PollAdapter;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$PollAdapter;->getItemCount()I

    move-result v1

    add-int/2addr v1, p1

    invoke-virtual {v0, v1, v2}, Landroid/support/v7/widget/LinearLayoutManager;->scrollToPositionWithOffset(II)V

    goto :goto_0
.end method

.method public bridge synthetic showCommentActions(Lcom/vkontakte/android/Comment;)V
    .locals 0

    .prologue
    .line 76
    check-cast p1, Lcom/vkontakte/android/api/board/BoardComment;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->showCommentActions(Lcom/vkontakte/android/api/board/BoardComment;)V

    return-void
.end method

.method public showCommentActions(Lcom/vkontakte/android/api/board/BoardComment;)V
    .locals 4
    .param p1, "comment"    # Lcom/vkontakte/android/api/board/BoardComment;

    .prologue
    .line 596
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 598
    .local v0, "options":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    iget-object v1, p1, Lcom/vkontakte/android/api/board/BoardComment;->linkTitles:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 599
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f080185

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 600
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    const-string/jumbo v2, "is_admin"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-nez v1, :cond_0

    iget v1, p1, Lcom/vkontakte/android/api/board/BoardComment;->uid:I

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v2

    if-ne v1, v2, :cond_1

    :cond_0
    iget v1, p1, Lcom/vkontakte/android/api/board/BoardComment;->offset:I

    if-eqz v1, :cond_1

    .line 601
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f08019c

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 602
    invoke-virtual {p1}, Lcom/vkontakte/android/api/board/BoardComment;->containsGraffiti()Z

    move-result v1

    if-nez v1, :cond_1

    .line 603
    const v1, 0x7f0801c7

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 607
    :cond_1
    new-instance v2, Lcom/vkontakte/android/VKAlertDialog$Builder;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v2, v1}, Lcom/vkontakte/android/VKAlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    new-array v1, v1, [Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/CharSequence;

    invoke-static {p0, p1}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$$Lambda$10;->lambdaFactory$(Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;Lcom/vkontakte/android/api/board/BoardComment;)Landroid/content/DialogInterface$OnClickListener;

    move-result-object v3

    invoke-virtual {v2, v1, v3}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 627
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 628
    return-void
.end method

.method public showOffset(I)V
    .locals 2
    .param p1, "offset"    # I

    .prologue
    .line 759
    iget-object v0, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->commentsLoader:Lcom/vkontakte/android/api/board/BoardCommentsLoader;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->show(ILandroid/content/Context;)Lcom/vkontakte/android/api/board/BoardCommentsLoader;

    .line 760
    return-void
.end method

.method public updatePool(Lcom/vkontakte/android/attachments/PollAttachment;)V
    .locals 1
    .param p1, "pollAttachment"    # Lcom/vkontakte/android/attachments/PollAttachment;

    .prologue
    .line 668
    iget-object v0, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->pollAdapter:Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$PollAdapter;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$PollAdapter;->setPollAttachment(Lcom/vkontakte/android/attachments/PollAttachment;)V

    .line 669
    return-void
.end method

.method public updateTotal(I)V
    .locals 0
    .param p1, "total"    # I

    .prologue
    .line 710
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->fillPageCount()V

    .line 711
    return-void
.end method
