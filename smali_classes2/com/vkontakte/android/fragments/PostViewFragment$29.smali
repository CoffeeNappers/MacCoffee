.class Lcom/vkontakte/android/fragments/PostViewFragment$29;
.super Lcom/vkontakte/android/api/SimpleCallback;
.source "PostViewFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/PostViewFragment;->sendComment(Ljava/lang/String;Ljava/util/List;Z)V
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
.field final synthetic this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

.field final synthetic val$atts:Ljava/util/List;

.field final synthetic val$clearCommentBar:Z

.field final synthetic val$txt:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/PostViewFragment;Landroid/content/Context;ZLjava/lang/String;Ljava/util/List;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/PostViewFragment;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 1548
    iput-object p1, p0, Lcom/vkontakte/android/fragments/PostViewFragment$29;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    iput-boolean p3, p0, Lcom/vkontakte/android/fragments/PostViewFragment$29;->val$clearCommentBar:Z

    iput-object p4, p0, Lcom/vkontakte/android/fragments/PostViewFragment$29;->val$txt:Ljava/lang/String;

    iput-object p5, p0, Lcom/vkontakte/android/fragments/PostViewFragment$29;->val$atts:Ljava/util/List;

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/SimpleCallback;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 1
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 1657
    invoke-super {p0, p1}, Lcom/vkontakte/android/api/SimpleCallback;->fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V

    .line 1658
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment$29;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$1900(Lcom/vkontakte/android/fragments/PostViewFragment;)I

    move-result v0

    if-eqz v0, :cond_0

    .line 1661
    invoke-static {}, Lcom/vk/sharing/target/GroupsForCommentsImpersonation;->getInstance()Lcom/vk/sharing/target/GroupsForCommentsImpersonation;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/sharing/target/GroupsForCommentsImpersonation;->resetCache()V

    .line 1663
    :cond_0
    return-void
.end method

.method public success(Ljava/lang/Integer;)V
    .locals 15
    .param p1, "cid"    # Ljava/lang/Integer;

    .prologue
    .line 1551
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment$29;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$3200(Lcom/vkontakte/android/fragments/PostViewFragment;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1552
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment$29;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$200(Lcom/vkontakte/android/fragments/PostViewFragment;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 1553
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment$29;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/PostViewFragment;->updateList()V

    .line 1556
    :cond_0
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment$29;->val$clearCommentBar:Z

    if-eqz v0, :cond_1

    .line 1557
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment$29;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$1100(Lcom/vkontakte/android/fragments/PostViewFragment;)Lcom/vkontakte/android/ui/WriteBar;

    move-result-object v0

    const-string/jumbo v1, ""

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/WriteBar;->setText(Ljava/lang/CharSequence;)V

    .line 1558
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment$29;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$1100(Lcom/vkontakte/android/fragments/PostViewFragment;)Lcom/vkontakte/android/ui/WriteBar;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/WriteBar;->clearAttachments()V

    .line 1560
    :cond_1
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v7

    .line 1561
    .local v7, "account":Lcom/vkontakte/android/auth/VKAccount;
    new-instance v9, Lcom/vkontakte/android/NewsComment;

    invoke-direct {v9}, Lcom/vkontakte/android/NewsComment;-><init>()V

    .line 1562
    .local v9, "comment":Lcom/vkontakte/android/NewsComment;
    invoke-virtual/range {p1 .. p1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iput v0, v9, Lcom/vkontakte/android/NewsComment;->cid:I

    .line 1563
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment$29;->val$txt:Ljava/lang/String;

    const-string/jumbo v1, "\\[(id|club)([\\d]+)\\|([^\\]]+)\\]"

    const-string/jumbo v2, "$3"

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v9, v0}, Lcom/vkontakte/android/NewsComment;->setText(Ljava/lang/String;)V

    .line 1564
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment$29;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$1900(Lcom/vkontakte/android/fragments/PostViewFragment;)I

    move-result v0

    if-eqz v0, :cond_6

    .line 1565
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment$29;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$1900(Lcom/vkontakte/android/fragments/PostViewFragment;)I

    move-result v0

    neg-int v0, v0

    iput v0, v9, Lcom/vkontakte/android/NewsComment;->uid:I

    .line 1566
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment$29;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$1900(Lcom/vkontakte/android/fragments/PostViewFragment;)I

    move-result v0

    invoke-static {v0}, Lcom/vkontakte/android/data/Groups;->getById(I)Lcom/vkontakte/android/api/Group;

    move-result-object v10

    .line 1567
    .local v10, "g":Lcom/vkontakte/android/api/Group;
    if-eqz v10, :cond_5

    .line 1568
    iget-object v0, v10, Lcom/vkontakte/android/api/Group;->name:Ljava/lang/String;

    iput-object v0, v9, Lcom/vkontakte/android/NewsComment;->userName:Ljava/lang/String;

    .line 1569
    iget-object v0, v10, Lcom/vkontakte/android/api/Group;->name:Ljava/lang/String;

    iput-object v0, v9, Lcom/vkontakte/android/NewsComment;->userRName:Ljava/lang/String;

    .line 1570
    iget-object v0, v10, Lcom/vkontakte/android/api/Group;->photo:Ljava/lang/String;

    iput-object v0, v9, Lcom/vkontakte/android/NewsComment;->userPhoto:Ljava/lang/String;

    .line 1571
    iget-boolean v0, v10, Lcom/vkontakte/android/api/Group;->verified:Z

    iput-boolean v0, v9, Lcom/vkontakte/android/NewsComment;->isAuthorVerified:Z

    .line 1582
    .end local v10    # "g":Lcom/vkontakte/android/api/Group;
    :goto_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, v9, Lcom/vkontakte/android/NewsComment;->attachments:Ljava/util/ArrayList;

    .line 1583
    iget-object v0, v9, Lcom/vkontakte/android/NewsComment;->attachments:Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment$29;->val$atts:Ljava/util/List;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 1584
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment$29;->val$atts:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment$29;->val$atts:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    instance-of v0, v0, Lcom/vkontakte/android/attachments/StickerAttachment;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment$29;->val$atts:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    instance-of v0, v0, Lcom/vkontakte/android/attachments/GraffitiAttachment;

    if-nez v0, :cond_3

    .line 1585
    :cond_2
    const/4 v0, 0x1

    iput-boolean v0, v9, Lcom/vkontakte/android/NewsComment;->canEdit:Z

    .line 1588
    :cond_3
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v12

    .line 1589
    .local v12, "metrics":Landroid/util/DisplayMetrics;
    iget v0, v12, Landroid/util/DisplayMetrics;->widthPixels:I

    iget v1, v12, Landroid/util/DisplayMetrics;->heightPixels:I

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    const/high16 v1, 0x42be0000    # 95.0f

    invoke-static {v1}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v1

    sub-int v13, v0, v1

    .line 1590
    .local v13, "tSize":I
    const/16 v0, 0x25c

    invoke-static {v13, v0}, Ljava/lang/Math;->min(II)I

    move-result v13

    .line 1591
    iget-object v0, v9, Lcom/vkontakte/android/NewsComment;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_4
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_7

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/vkontakte/android/attachments/Attachment;

    .line 1592
    .local v8, "att":Lcom/vkontakte/android/attachments/Attachment;
    instance-of v1, v8, Lcom/vkontakte/android/attachments/SnippetAttachment;

    if-eqz v1, :cond_4

    .line 1593
    check-cast v8, Lcom/vkontakte/android/attachments/SnippetAttachment;

    .end local v8    # "att":Lcom/vkontakte/android/attachments/Attachment;
    const/4 v1, 0x1

    iput-boolean v1, v8, Lcom/vkontakte/android/attachments/SnippetAttachment;->forceSmall:Z

    goto :goto_1

    .line 1573
    .end local v12    # "metrics":Landroid/util/DisplayMetrics;
    .end local v13    # "tSize":I
    .restart local v10    # "g":Lcom/vkontakte/android/api/Group;
    :cond_5
    const-string/jumbo v0, "DELETED"

    iput-object v0, v9, Lcom/vkontakte/android/NewsComment;->userName:Ljava/lang/String;

    .line 1574
    const/4 v0, 0x0

    iput-object v0, v9, Lcom/vkontakte/android/NewsComment;->userPhoto:Ljava/lang/String;

    goto :goto_0

    .line 1577
    .end local v10    # "g":Lcom/vkontakte/android/api/Group;
    :cond_6
    invoke-virtual {v7}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v0

    iput v0, v9, Lcom/vkontakte/android/NewsComment;->uid:I

    .line 1578
    invoke-virtual {v7}, Lcom/vkontakte/android/auth/VKAccount;->getName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, v9, Lcom/vkontakte/android/NewsComment;->userName:Ljava/lang/String;

    .line 1579
    invoke-virtual {v7}, Lcom/vkontakte/android/auth/VKAccount;->getPhoto()Ljava/lang/String;

    move-result-object v0

    iput-object v0, v9, Lcom/vkontakte/android/NewsComment;->userPhoto:Ljava/lang/String;

    .line 1580
    invoke-virtual {v7}, Lcom/vkontakte/android/auth/VKAccount;->getIsVerified()Z

    move-result v0

    iput-boolean v0, v9, Lcom/vkontakte/android/NewsComment;->isAuthorVerified:Z

    goto/16 :goto_0

    .line 1596
    .restart local v12    # "metrics":Landroid/util/DisplayMetrics;
    .restart local v13    # "tSize":I
    :cond_7
    int-to-float v0, v13

    const v1, 0x3f2a7efa    # 0.666f

    mul-float/2addr v0, v1

    float-to-int v0, v0

    iget-object v1, v9, Lcom/vkontakte/android/NewsComment;->attachments:Ljava/util/ArrayList;

    invoke-static {v13, v0, v1}, Lcom/vkontakte/android/ZhukovLayout;->processThumbs(IILjava/util/List;)V

    .line 1598
    invoke-static {}, Lcom/vkontakte/android/TimeUtils;->getCurrentTime()I

    move-result v0

    iput v0, v9, Lcom/vkontakte/android/NewsComment;->time:I

    .line 1599
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment$29;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$3300(Lcom/vkontakte/android/fragments/PostViewFragment;)I

    move-result v0

    if-eqz v0, :cond_8

    .line 1600
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment$29;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$3300(Lcom/vkontakte/android/fragments/PostViewFragment;)I

    move-result v0

    iput v0, v9, Lcom/vkontakte/android/NewsComment;->replyToCommentID:I

    .line 1601
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment$29;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$3400(Lcom/vkontakte/android/fragments/PostViewFragment;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v9, Lcom/vkontakte/android/NewsComment;->respToName:Ljava/lang/String;

    .line 1603
    :cond_8
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment$29;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$200(Lcom/vkontakte/android/fragments/PostViewFragment;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1605
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment$29;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$500(Lcom/vkontakte/android/fragments/PostViewFragment;)Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment$29;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$200(Lcom/vkontakte/android/fragments/PostViewFragment;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    iget-object v2, p0, Lcom/vkontakte/android/fragments/PostViewFragment$29;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$2000(Lcom/vkontakte/android/fragments/PostViewFragment;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    add-int/2addr v1, v2

    iget-object v2, p0, Lcom/vkontakte/android/fragments/PostViewFragment$29;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$400(Lcom/vkontakte/android/fragments/PostViewFragment;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    add-int/2addr v1, v2

    invoke-virtual {v0, v1}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->notifyItemInserted(I)V

    .line 1606
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment$29;->val$clearCommentBar:Z

    if-eqz v0, :cond_9

    .line 1608
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment$29;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$1800(Lcom/vkontakte/android/fragments/PostViewFragment;)V

    .line 1610
    :cond_9
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment$29;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$3700(Lcom/vkontakte/android/fragments/PostViewFragment;)Lme/grishka/appkit/views/UsableRecyclerView;

    move-result-object v0

    new-instance v1, Lcom/vkontakte/android/fragments/PostViewFragment$29$1;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/fragments/PostViewFragment$29$1;-><init>(Lcom/vkontakte/android/fragments/PostViewFragment$29;)V

    invoke-virtual {v0, v1}, Lme/grishka/appkit/views/UsableRecyclerView;->post(Ljava/lang/Runnable;)Z

    .line 1633
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment$29;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$000(Lcom/vkontakte/android/fragments/PostViewFragment;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v0

    iget v1, v0, Lcom/vkontakte/android/NewsEntry;->numComments:I

    add-int/lit8 v1, v1, 0x1

    iput v1, v0, Lcom/vkontakte/android/NewsEntry;->numComments:I

    .line 1634
    new-instance v11, Landroid/content/Intent;

    const-string/jumbo v0, "com.vkontakte.android.POST_UPDATED"

    invoke-direct {v11, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1635
    .local v11, "intent":Landroid/content/Intent;
    const-string/jumbo v0, "post_id"

    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment$29;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$000(Lcom/vkontakte/android/fragments/PostViewFragment;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v1

    iget v1, v1, Lcom/vkontakte/android/NewsEntry;->postID:I

    invoke-virtual {v11, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1636
    const-string/jumbo v0, "owner_id"

    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment$29;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$000(Lcom/vkontakte/android/fragments/PostViewFragment;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v1

    iget v1, v1, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    invoke-virtual {v11, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1637
    const-string/jumbo v0, "comments"

    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment$29;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$000(Lcom/vkontakte/android/fragments/PostViewFragment;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v1

    iget v1, v1, Lcom/vkontakte/android/NewsEntry;->numComments:I

    invoke-virtual {v11, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1638
    const-string/jumbo v0, "likes"

    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment$29;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$000(Lcom/vkontakte/android/fragments/PostViewFragment;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v1

    iget v1, v1, Lcom/vkontakte/android/NewsEntry;->numLikes:I

    invoke-virtual {v11, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1639
    const-string/jumbo v0, "liked"

    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment$29;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$000(Lcom/vkontakte/android/fragments/PostViewFragment;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v1

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/NewsEntry;->flag(I)Z

    move-result v1

    invoke-virtual {v11, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 1640
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment$29;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/PostViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const-string/jumbo v1, "com.vkontakte.android.permission.ACCESS_DATA"

    invoke-virtual {v0, v11, v1}, Landroid/app/Activity;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 1641
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment$29;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$000(Lcom/vkontakte/android/fragments/PostViewFragment;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v0

    iget v0, v0, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment$29;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    .line 1642
    invoke-static {v1}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$000(Lcom/vkontakte/android/fragments/PostViewFragment;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v1

    iget v1, v1, Lcom/vkontakte/android/NewsEntry;->postID:I

    iget-object v2, p0, Lcom/vkontakte/android/fragments/PostViewFragment$29;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    .line 1643
    invoke-static {v2}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$000(Lcom/vkontakte/android/fragments/PostViewFragment;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v2

    iget v2, v2, Lcom/vkontakte/android/NewsEntry;->numLikes:I

    iget-object v3, p0, Lcom/vkontakte/android/fragments/PostViewFragment$29;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    .line 1644
    invoke-static {v3}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$000(Lcom/vkontakte/android/fragments/PostViewFragment;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v3

    iget v3, v3, Lcom/vkontakte/android/NewsEntry;->numComments:I

    iget-object v4, p0, Lcom/vkontakte/android/fragments/PostViewFragment$29;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    .line 1645
    invoke-static {v4}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$000(Lcom/vkontakte/android/fragments/PostViewFragment;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v4

    iget v4, v4, Lcom/vkontakte/android/NewsEntry;->numRetweets:I

    iget-object v5, p0, Lcom/vkontakte/android/fragments/PostViewFragment$29;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    .line 1646
    invoke-static {v5}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$000(Lcom/vkontakte/android/fragments/PostViewFragment;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v5

    const/16 v6, 0x8

    invoke-virtual {v5, v6}, Lcom/vkontakte/android/NewsEntry;->flag(I)Z

    move-result v5

    iget-object v6, p0, Lcom/vkontakte/android/fragments/PostViewFragment$29;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    .line 1647
    invoke-static {v6}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$000(Lcom/vkontakte/android/fragments/PostViewFragment;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v6

    const/4 v14, 0x4

    invoke-virtual {v6, v14}, Lcom/vkontakte/android/NewsEntry;->flag(I)Z

    move-result v6

    .line 1641
    invoke-static/range {v0 .. v6}, Lcom/vkontakte/android/cache/NewsfeedCache;->update(IIIIIZZ)V

    .line 1650
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment$29;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$3200(Lcom/vkontakte/android/fragments/PostViewFragment;)Z

    move-result v0

    if-eqz v0, :cond_a

    .line 1651
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment$29;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$300(Lcom/vkontakte/android/fragments/PostViewFragment;)V

    .line 1653
    :cond_a
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 1548
    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/PostViewFragment$29;->success(Ljava/lang/Integer;)V

    return-void
.end method
