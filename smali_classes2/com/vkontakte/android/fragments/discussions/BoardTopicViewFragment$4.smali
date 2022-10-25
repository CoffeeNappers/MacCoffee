.class Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$4;
.super Lcom/vkontakte/android/api/SimpleCallback;
.source "BoardTopicViewFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->sendComment(Ljava/lang/String;Ljava/util/List;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/SimpleCallback",
        "<",
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;

.field final synthetic val$activity:Landroid/app/Activity;

.field final synthetic val$atts:Ljava/util/List;

.field final synthetic val$clearCommentBar:Z

.field final synthetic val$fromGroup:Z

.field final synthetic val$text:Ljava/lang/String;

.field final synthetic val$txt:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;Landroid/app/Fragment;Ljava/lang/String;ZLjava/lang/String;Landroid/app/Activity;Ljava/util/List;Z)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;
    .param p2, "fragment"    # Landroid/app/Fragment;

    .prologue
    .line 551
    iput-object p1, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$4;->this$0:Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;

    iput-object p3, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$4;->val$text:Ljava/lang/String;

    iput-boolean p4, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$4;->val$clearCommentBar:Z

    iput-object p5, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$4;->val$txt:Ljava/lang/String;

    iput-object p6, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$4;->val$activity:Landroid/app/Activity;

    iput-object p7, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$4;->val$atts:Ljava/util/List;

    iput-boolean p8, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$4;->val$fromGroup:Z

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/SimpleCallback;-><init>(Landroid/app/Fragment;)V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 2
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 584
    invoke-super {p0, p1}, Lcom/vkontakte/android/api/SimpleCallback;->fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V

    .line 585
    iget-object v0, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$4;->this$0:Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;

    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->sendingComment:Z

    .line 586
    return-void
.end method

.method public success(Ljava/lang/Integer;)V
    .locals 10
    .param p1, "cid"    # Ljava/lang/Integer;

    .prologue
    const/4 v9, -0x1

    const/4 v8, 0x0

    .line 554
    iget-object v0, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$4;->val$text:Ljava/lang/String;

    .line 555
    .local v0, "textLocal":Ljava/lang/String;
    iget-boolean v1, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$4;->val$clearCommentBar:Z

    if-eqz v1, :cond_1

    .line 556
    iget-object v1, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$4;->this$0:Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;

    iget v1, v1, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->replyTo:I

    if-lez v1, :cond_0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$4;->val$txt:Ljava/lang/String;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$4;->val$txt:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$4;->this$0:Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;

    iget-object v3, v3, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->replyToName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, ","

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 557
    iget-object v1, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$4;->val$txt:Ljava/lang/String;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$4;->this$0:Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;

    iget-object v2, v2, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->replyToName:Ljava/lang/String;

    iget-object v3, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$4;->this$0:Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;

    iget-object v4, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$4;->this$0:Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;

    iget v4, v4, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->replyToUid:I

    iget-object v5, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$4;->this$0:Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;

    iget-object v5, v5, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->replyToName:Ljava/lang/String;

    iget-object v6, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$4;->this$0:Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;

    invoke-static {v6}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->access$300(Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;)I

    move-result v6

    iget-object v7, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$4;->this$0:Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;

    iget v7, v7, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->replyTo:I

    invoke-virtual {v3, v4, v5, v6, v7}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->createReplyLink(ILjava/lang/String;II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 559
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$4;->this$0:Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->commentBar:Lcom/vkontakte/android/ui/WriteBar;

    const-string/jumbo v2, ""

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/ui/WriteBar;->setText(Ljava/lang/CharSequence;)V

    .line 560
    iget-object v1, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$4;->this$0:Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->commentBar:Lcom/vkontakte/android/ui/WriteBar;

    invoke-virtual {v1}, Lcom/vkontakte/android/ui/WriteBar;->clearAttachments()V

    .line 561
    iget-object v1, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$4;->this$0:Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;

    iput-boolean v8, v1, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->replyFromGroup:Z

    .line 562
    iget-object v1, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$4;->this$0:Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;

    iput v9, v1, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->replyTo:I

    .line 564
    :cond_1
    iget-object v1, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$4;->this$0:Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->access$400(Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;)I

    move-result v1

    if-ne v1, v9, :cond_2

    .line 565
    iget-object v1, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$4;->this$0:Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->createHint:Landroid/view/View;

    const/16 v2, 0x8

    invoke-static {v1, v2}, Lcom/vkontakte/android/ViewUtils;->setVisibility(Landroid/view/View;I)V

    .line 566
    iget-object v1, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$4;->this$0:Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    const-string/jumbo v2, "id"

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 567
    iget-object v1, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$4;->this$0:Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;

    iput-boolean v8, v1, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->sendingComment:Z

    .line 568
    iget-object v1, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$4;->this$0:Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->commentsLoader:Lcom/vkontakte/android/api/board/BoardCommentsLoader;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->setTopicId(I)V

    .line 569
    iget-object v1, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$4;->this$0:Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->commentsLoader:Lcom/vkontakte/android/api/board/BoardCommentsLoader;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$4;->val$activity:Landroid/app/Activity;

    invoke-virtual {v1, v8, v2}, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->init(ILandroid/content/Context;)V

    .line 580
    :goto_0
    return-void

    .line 572
    :cond_2
    iget-object v1, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$4;->this$0:Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->commentsLoader:Lcom/vkontakte/android/api/board/BoardCommentsLoader;

    invoke-virtual {v1}, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->isEndOfListLoaded()Z

    move-result v1

    if-nez v1, :cond_3

    .line 573
    iget-object v1, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$4;->this$0:Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const v2, 0x7f08011b

    invoke-static {v1, v2, v8}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 574
    iget-object v1, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$4;->this$0:Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;

    iput-boolean v8, v1, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->sendingComment:Z

    goto :goto_0

    .line 577
    :cond_3
    iget-object v1, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$4;->this$0:Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->commentsLoader:Lcom/vkontakte/android/api/board/BoardCommentsLoader;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$4;->this$0:Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->access$300(Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;)I

    move-result v2

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v3

    iget-object v4, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$4;->val$atts:Ljava/util/List;

    iget-boolean v5, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$4;->val$fromGroup:Z

    invoke-static {v2, v3, v4, v0, v5}, Lcom/vkontakte/android/api/board/BoardComment;->createNewComment(IILjava/util/List;Ljava/lang/String;Z)Lcom/vkontakte/android/api/board/BoardComment;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->insertComment(Lcom/vkontakte/android/api/board/BoardComment;)V

    .line 579
    iget-object v1, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$4;->this$0:Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;

    iput-boolean v8, v1, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->sendingComment:Z

    goto :goto_0
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 551
    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$4;->success(Ljava/lang/Integer;)V

    return-void
.end method
