.class Lcom/vkontakte/android/fragments/feedback/NotificationsFragment$NotificationsAdapter;
.super Lcom/vkontakte/android/fragments/base/GridFragment$GridAdapter;
.source "NotificationsFragment.java"

# interfaces
.implements Lcom/vkontakte/android/ui/recyclerview/CardItemDecoration$Provider;
.implements Lme/grishka/appkit/views/DividerItemDecoration$Provider;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "NotificationsAdapter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/fragments/base/GridFragment",
        "<",
        "Lcom/vkontakte/android/api/models/Notification;",
        ">.GridAdapter<",
        "Lcom/vkontakte/android/ui/holder/RecyclerHolder;",
        ">;",
        "Lcom/vkontakte/android/ui/recyclerview/CardItemDecoration$Provider;",
        "Lme/grishka/appkit/views/DividerItemDecoration$Provider;"
    }
.end annotation


# static fields
.field public static final TYPE_COMMENT:I = 0xf

.field public static final TYPE_GROUP:I = 0xe

.field public static final TYPE_HEADER:I = 0xd

.field public static final TYPE_POST:I = 0x10

.field public static final TYPE_USERS:I = 0x11


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;)V
    .locals 1

    .prologue
    .line 401
    iput-object p1, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment$NotificationsAdapter;->this$0:Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;

    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/base/GridFragment$GridAdapter;-><init>(Lcom/vkontakte/android/fragments/base/GridFragment;)V

    .line 402
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment$NotificationsAdapter;->setHasStableIds(Z)V

    .line 403
    return-void
.end method


# virtual methods
.method public getBlockType(I)I
    .locals 2
    .param p1, "position"    # I

    .prologue
    const/4 v0, 0x1

    .line 580
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment$NotificationsAdapter;->getItemCount()I

    move-result v1

    if-ge p1, v1, :cond_0

    if-gez p1, :cond_1

    .line 590
    :cond_0
    :goto_0
    return v0

    .line 583
    :cond_1
    iget-object v1, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment$NotificationsAdapter;->this$0:Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->access$2400(Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;)Z

    move-result v1

    if-nez v1, :cond_2

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment$NotificationsAdapter;->getItemCount()I

    move-result v1

    add-int/lit8 v1, v1, -0x2

    if-eq p1, v1, :cond_0

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment$NotificationsAdapter;->getItemCount()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    if-eq p1, v1, :cond_0

    .line 586
    :cond_2
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment$NotificationsAdapter;->getItemViewType(I)I

    move-result v1

    packed-switch v1, :pswitch_data_0

    goto :goto_0

    .line 588
    :pswitch_0
    const/4 v0, 0x2

    goto :goto_0

    .line 586
    :pswitch_data_0
    .packed-switch 0xd
        :pswitch_0
    .end packed-switch
.end method

.method public getImageCountForItem(I)I
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 517
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment$NotificationsAdapter;->getItemViewType(I)I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 541
    :pswitch_0
    const/4 v0, 0x0

    :goto_0
    return v0

    .line 519
    :pswitch_1
    iget-object v0, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment$NotificationsAdapter;->this$0:Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->access$1900(Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/api/models/Notification;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/feedback/UsersHolder;->getImagesCount(Lcom/vkontakte/android/api/models/Notification;)I

    move-result v0

    goto :goto_0

    .line 522
    :pswitch_2
    iget-object v0, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment$NotificationsAdapter;->this$0:Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->access$2000(Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/api/models/Notification;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/feedback/CommentHolder;->getImagesCount(Lcom/vkontakte/android/api/models/Notification;)I

    move-result v0

    goto :goto_0

    .line 536
    :pswitch_3
    iget-object v0, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment$NotificationsAdapter;->this$0:Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->access$2100(Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/api/models/Notification;

    iget-object v0, v0, Lcom/vkontakte/android/api/models/Notification;->item:Lcom/vkontakte/android/ui/posts/PostDisplayItem;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/posts/PostDisplayItem;->getImageCount()I

    move-result v0

    goto :goto_0

    .line 517
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_2
        :pswitch_3
        :pswitch_1
    .end packed-switch
.end method

.method public getImageURL(II)Ljava/lang/String;
    .locals 2
    .param p1, "position"    # I
    .param p2, "image"    # I

    .prologue
    .line 548
    iget-object v1, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment$NotificationsAdapter;->this$0:Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->access$2200(Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/api/models/Notification;

    .line 549
    .local v0, "entry":Lcom/vkontakte/android/api/models/Notification;
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment$NotificationsAdapter;->getItemViewType(I)I

    move-result v1

    packed-switch v1, :pswitch_data_0

    .line 573
    :pswitch_0
    const/4 v1, 0x0

    :goto_0
    return-object v1

    .line 551
    :pswitch_1
    invoke-static {v0, p2}, Lcom/vkontakte/android/fragments/feedback/CommentHolder;->getImageURL(Lcom/vkontakte/android/api/models/Notification;I)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 554
    :pswitch_2
    invoke-static {v0, p2}, Lcom/vkontakte/android/fragments/feedback/UsersHolder;->getImageURL(Lcom/vkontakte/android/api/models/Notification;I)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 568
    :pswitch_3
    iget-object v1, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment$NotificationsAdapter;->this$0:Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->access$2300(Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/api/models/Notification;

    iget-object v1, v1, Lcom/vkontakte/android/api/models/Notification;->item:Lcom/vkontakte/android/ui/posts/PostDisplayItem;

    invoke-virtual {v1, p2}, Lcom/vkontakte/android/ui/posts/PostDisplayItem;->getImageURL(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 549
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_3
        :pswitch_2
    .end packed-switch
.end method

.method public getItemCount()I
    .locals 1

    .prologue
    .line 492
    iget-object v0, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment$NotificationsAdapter;->this$0:Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->access$1600(Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public getItemId(I)J
    .locals 2
    .param p1, "position"    # I

    .prologue
    .line 620
    iget-object v0, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment$NotificationsAdapter;->this$0:Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->access$2700(Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/api/models/Notification;

    iget v0, v0, Lcom/vkontakte/android/api/models/Notification;->id:I

    mul-int/lit8 v1, v0, 0x7

    iget-object v0, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment$NotificationsAdapter;->this$0:Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->access$2800(Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/api/models/Notification;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x5

    add-int/2addr v0, v1

    int-to-long v0, v0

    return-wide v0
.end method

.method public getItemViewType(I)I
    .locals 2
    .param p1, "position"    # I

    .prologue
    .line 497
    sget-object v1, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment$2;->$SwitchMap$com$vkontakte$android$api$models$Notification$FeedbackType:[I

    iget-object v0, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment$NotificationsAdapter;->this$0:Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->access$1700(Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/api/models/Notification;

    iget-object v0, v0, Lcom/vkontakte/android/api/models/Notification;->type:Lcom/vkontakte/android/api/models/Notification$Type;

    iget-object v0, v0, Lcom/vkontakte/android/api/models/Notification$Type;->feedbackType:Lcom/vkontakte/android/api/models/Notification$FeedbackType;

    invoke-virtual {v0}, Lcom/vkontakte/android/api/models/Notification$FeedbackType;->ordinal()I

    move-result v0

    aget v0, v1, v0

    packed-switch v0, :pswitch_data_0

    .line 511
    const/4 v0, 0x5

    :goto_0
    return v0

    .line 501
    :pswitch_0
    const/16 v0, 0x11

    goto :goto_0

    .line 503
    :pswitch_1
    iget-object v0, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment$NotificationsAdapter;->this$0:Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->access$1800(Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/api/models/Notification;

    iget-object v0, v0, Lcom/vkontakte/android/api/models/Notification;->item:Lcom/vkontakte/android/ui/posts/PostDisplayItem;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/posts/PostDisplayItem;->getType()I

    move-result v0

    goto :goto_0

    .line 505
    :pswitch_2
    const/16 v0, 0xf

    goto :goto_0

    .line 507
    :pswitch_3
    const/16 v0, 0xd

    goto :goto_0

    .line 509
    :pswitch_4
    const/16 v0, 0xe

    goto :goto_0

    .line 497
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method

.method public needDrawDividerAfter(I)Z
    .locals 7
    .param p1, "position"    # I

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x1

    .line 596
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment$NotificationsAdapter;->getBlockType(I)I

    move-result v3

    if-ne v3, v4, :cond_2

    .line 597
    iget-object v3, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment$NotificationsAdapter;->this$0:Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->access$2500(Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;)Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/api/models/Notification;

    .line 599
    .local v1, "item":Lcom/vkontakte/android/api/models/Notification;
    iget-object v3, v1, Lcom/vkontakte/android/api/models/Notification;->type:Lcom/vkontakte/android/api/models/Notification$Type;

    iget-object v0, v3, Lcom/vkontakte/android/api/models/Notification$Type;->feedbackType:Lcom/vkontakte/android/api/models/Notification$FeedbackType;

    .line 601
    .local v0, "feedbackType":Lcom/vkontakte/android/api/models/Notification$FeedbackType;
    sget-object v3, Lcom/vkontakte/android/api/models/Notification$FeedbackType;->Header:Lcom/vkontakte/android/api/models/Notification$FeedbackType;

    if-eq v0, v3, :cond_2

    .line 602
    sget-object v3, Lcom/vkontakte/android/api/models/Notification$FeedbackType;->Post:Lcom/vkontakte/android/api/models/Notification$FeedbackType;

    if-ne v0, v3, :cond_1

    add-int/lit8 v3, p1, 0x1

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment$NotificationsAdapter;->getItemCount()I

    move-result v6

    if-ge v3, v6, :cond_1

    .line 603
    iget-object v3, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment$NotificationsAdapter;->this$0:Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->access$2600(Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;)Ljava/util/ArrayList;

    move-result-object v3

    add-int/lit8 v6, p1, 0x1

    invoke-virtual {v3, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/vkontakte/android/api/models/Notification;

    iget-object v2, v3, Lcom/vkontakte/android/api/models/Notification;->item:Lcom/vkontakte/android/ui/posts/PostDisplayItem;

    .line 604
    .local v2, "next":Lcom/vkontakte/android/ui/posts/PostDisplayItem;
    if-eqz v2, :cond_1

    .line 605
    iget v3, v2, Lcom/vkontakte/android/ui/posts/PostDisplayItem;->postID:I

    iget-object v6, v1, Lcom/vkontakte/android/api/models/Notification;->item:Lcom/vkontakte/android/ui/posts/PostDisplayItem;

    iget v6, v6, Lcom/vkontakte/android/ui/posts/PostDisplayItem;->postID:I

    if-eq v3, v6, :cond_0

    move v3, v4

    .line 615
    .end local v0    # "feedbackType":Lcom/vkontakte/android/api/models/Notification$FeedbackType;
    .end local v1    # "item":Lcom/vkontakte/android/api/models/Notification;
    .end local v2    # "next":Lcom/vkontakte/android/ui/posts/PostDisplayItem;
    :goto_0
    return v3

    .restart local v0    # "feedbackType":Lcom/vkontakte/android/api/models/Notification$FeedbackType;
    .restart local v1    # "item":Lcom/vkontakte/android/api/models/Notification;
    .restart local v2    # "next":Lcom/vkontakte/android/ui/posts/PostDisplayItem;
    :cond_0
    move v3, v5

    .line 605
    goto :goto_0

    .end local v2    # "next":Lcom/vkontakte/android/ui/posts/PostDisplayItem;
    :cond_1
    move v3, v4

    .line 608
    goto :goto_0

    .end local v0    # "feedbackType":Lcom/vkontakte/android/api/models/Notification$FeedbackType;
    .end local v1    # "item":Lcom/vkontakte/android/api/models/Notification;
    :cond_2
    move v3, v5

    .line 615
    goto :goto_0
.end method

.method public bridge synthetic onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    .prologue
    .line 393
    check-cast p1, Lcom/vkontakte/android/ui/holder/RecyclerHolder;

    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment$NotificationsAdapter;->onBindViewHolder(Lcom/vkontakte/android/ui/holder/RecyclerHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/vkontakte/android/ui/holder/RecyclerHolder;I)V
    .locals 2
    .param p1, "holder"    # Lcom/vkontakte/android/ui/holder/RecyclerHolder;
    .param p2, "position"    # I

    .prologue
    .line 454
    invoke-virtual {p0, p2}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment$NotificationsAdapter;->getItemViewType(I)I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 488
    .end local p1    # "holder":Lcom/vkontakte/android/ui/holder/RecyclerHolder;
    :goto_0
    :pswitch_0
    return-void

    .line 456
    .restart local p1    # "holder":Lcom/vkontakte/android/ui/holder/RecyclerHolder;
    :pswitch_1
    check-cast p1, Lcom/vkontakte/android/fragments/feedback/CommentHolder;

    .end local p1    # "holder":Lcom/vkontakte/android/ui/holder/RecyclerHolder;
    iget-object v0, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment$NotificationsAdapter;->this$0:Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->access$1000(Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/fragments/feedback/CommentHolder;->bind(Ljava/lang/Object;)V

    goto :goto_0

    .line 460
    .restart local p1    # "holder":Lcom/vkontakte/android/ui/holder/RecyclerHolder;
    :pswitch_2
    check-cast p1, Lcom/vkontakte/android/fragments/feedback/UsersHolder;

    .end local p1    # "holder":Lcom/vkontakte/android/ui/holder/RecyclerHolder;
    iget-object v0, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment$NotificationsAdapter;->this$0:Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->access$1100(Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/fragments/feedback/UsersHolder;->bind(Ljava/lang/Object;)V

    goto :goto_0

    .line 464
    .restart local p1    # "holder":Lcom/vkontakte/android/ui/holder/RecyclerHolder;
    :pswitch_3
    check-cast p1, Lcom/vkontakte/android/ui/holder/HeaderHolder;

    .end local p1    # "holder":Lcom/vkontakte/android/ui/holder/RecyclerHolder;
    iget-object v0, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment$NotificationsAdapter;->this$0:Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->access$1200(Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/api/models/Notification;

    invoke-virtual {v0}, Lcom/vkontakte/android/api/models/Notification;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/ui/holder/HeaderHolder;->bind(Ljava/lang/Object;)V

    goto :goto_0

    .line 468
    .restart local p1    # "holder":Lcom/vkontakte/android/ui/holder/RecyclerHolder;
    :pswitch_4
    check-cast p1, Lcom/vkontakte/android/fragments/feedback/GroupedHolder;

    .end local p1    # "holder":Lcom/vkontakte/android/ui/holder/RecyclerHolder;
    iget-object v0, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment$NotificationsAdapter;->this$0:Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->access$1300(Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/fragments/feedback/GroupedHolder;->bind(Ljava/lang/Object;)V

    goto :goto_0

    .line 483
    .restart local p1    # "holder":Lcom/vkontakte/android/ui/holder/RecyclerHolder;
    :pswitch_5
    iget-object v0, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment$NotificationsAdapter;->this$0:Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->access$1400(Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/api/models/Notification;

    iget-object v0, v0, Lcom/vkontakte/android/api/models/Notification;->item:Lcom/vkontakte/android/ui/posts/PostDisplayItem;

    iget-object v1, p1, Lcom/vkontakte/android/ui/holder/RecyclerHolder;->itemView:Landroid/view/View;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/posts/PostDisplayItem;->bindView(Landroid/view/View;)V

    .line 484
    check-cast p1, Lcom/vkontakte/android/fragments/feedback/TempPostHolder;

    .end local p1    # "holder":Lcom/vkontakte/android/ui/holder/RecyclerHolder;
    iget-object v0, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment$NotificationsAdapter;->this$0:Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->access$1500(Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/fragments/feedback/TempPostHolder;->bind(Ljava/lang/Object;)V

    goto :goto_0

    .line 454
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_0
        :pswitch_0
        :pswitch_3
        :pswitch_4
        :pswitch_1
        :pswitch_5
        :pswitch_2
    .end packed-switch
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 1

    .prologue
    .line 393
    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment$NotificationsAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/vkontakte/android/ui/holder/RecyclerHolder;

    move-result-object v0

    return-object v0
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/vkontakte/android/ui/holder/RecyclerHolder;
    .locals 3
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # I

    .prologue
    .line 407
    packed-switch p2, :pswitch_data_0

    .line 447
    :pswitch_0
    const/4 v0, 0x0

    :goto_0
    return-object v0

    .line 409
    :pswitch_1
    new-instance v0, Lcom/vkontakte/android/fragments/feedback/CommentHolder;

    invoke-direct {v0, p1}, Lcom/vkontakte/android/fragments/feedback/CommentHolder;-><init>(Landroid/view/ViewGroup;)V

    iget-object v1, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment$NotificationsAdapter;->this$0:Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->access$700(Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;)Lcom/vkontakte/android/functions/VoidF1;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment$NotificationsAdapter;->this$0:Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->access$800(Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;)Lcom/vkontakte/android/functions/VoidF1Int;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/fragments/feedback/CommentHolder;->attach(Lcom/vkontakte/android/functions/VoidF1;Lcom/vkontakte/android/functions/VoidF1Int;)Lcom/vkontakte/android/fragments/feedback/CommentHolder;

    move-result-object v0

    goto :goto_0

    .line 412
    :pswitch_2
    new-instance v0, Lcom/vkontakte/android/ui/holder/HeaderHolder;

    invoke-direct {v0, p1}, Lcom/vkontakte/android/ui/holder/HeaderHolder;-><init>(Landroid/view/ViewGroup;)V

    goto :goto_0

    .line 415
    :pswitch_3
    new-instance v0, Lcom/vkontakte/android/fragments/feedback/UsersHolder;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment$NotificationsAdapter;->this$0:Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->access$900(Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;)[[[Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, p1, v1}, Lcom/vkontakte/android/fragments/feedback/UsersHolder;-><init>(Landroid/view/ViewGroup;[[[Ljava/lang/String;)V

    iget-object v1, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment$NotificationsAdapter;->this$0:Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->access$700(Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;)Lcom/vkontakte/android/functions/VoidF1;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment$NotificationsAdapter;->this$0:Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->access$800(Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;)Lcom/vkontakte/android/functions/VoidF1Int;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/fragments/feedback/UsersHolder;->attach(Lcom/vkontakte/android/functions/VoidF1;Lcom/vkontakte/android/functions/VoidF1Int;)Lcom/vkontakte/android/fragments/feedback/UsersHolder;

    move-result-object v0

    goto :goto_0

    .line 417
    :pswitch_4
    new-instance v0, Lcom/vkontakte/android/fragments/feedback/GroupedHolder;

    invoke-direct {v0, p1}, Lcom/vkontakte/android/fragments/feedback/GroupedHolder;-><init>(Landroid/view/ViewGroup;)V

    iget-object v1, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment$NotificationsAdapter;->this$0:Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->access$800(Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;)Lcom/vkontakte/android/functions/VoidF1Int;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/feedback/GroupedHolder;->attach(Lcom/vkontakte/android/functions/VoidF1Int;)Lcom/vkontakte/android/fragments/feedback/GroupedHolder;

    move-result-object v0

    goto :goto_0

    .line 419
    :pswitch_5
    new-instance v0, Lcom/vkontakte/android/fragments/feedback/TempPostHolder;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment$NotificationsAdapter;->this$0:Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-static {v1}, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->createView(Landroid/content/Context;)Landroid/view/View;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vkontakte/android/fragments/feedback/TempPostHolder;-><init>(Landroid/view/View;)V

    goto :goto_0

    .line 421
    :pswitch_6
    new-instance v0, Lcom/vkontakte/android/fragments/feedback/TempPostHolder;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment$NotificationsAdapter;->this$0:Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-static {v1}, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->createViewAd(Landroid/content/Context;)Landroid/view/View;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vkontakte/android/fragments/feedback/TempPostHolder;-><init>(Landroid/view/View;)V

    goto :goto_0

    .line 423
    :pswitch_7
    new-instance v0, Lcom/vkontakte/android/fragments/feedback/TempPostHolder;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment$NotificationsAdapter;->this$0:Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-static {v1}, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->createView(Landroid/content/Context;)Landroid/view/View;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vkontakte/android/fragments/feedback/TempPostHolder;-><init>(Landroid/view/View;)V

    goto :goto_0

    .line 425
    :pswitch_8
    new-instance v0, Lcom/vkontakte/android/fragments/feedback/TempPostHolder;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment$NotificationsAdapter;->this$0:Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-static {v1}, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;->createView(Landroid/content/Context;)Landroid/view/View;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vkontakte/android/fragments/feedback/TempPostHolder;-><init>(Landroid/view/View;)V

    goto/16 :goto_0

    .line 427
    :pswitch_9
    new-instance v0, Lcom/vkontakte/android/fragments/feedback/TempPostHolder;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment$NotificationsAdapter;->this$0:Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {v1, v2}, Lcom/vkontakte/android/ui/posts/TextPostDisplayItem;->createView(Landroid/content/Context;Z)Landroid/view/View;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vkontakte/android/fragments/feedback/TempPostHolder;-><init>(Landroid/view/View;)V

    goto/16 :goto_0

    .line 429
    :pswitch_a
    new-instance v0, Lcom/vkontakte/android/fragments/feedback/TempPostHolder;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment$NotificationsAdapter;->this$0:Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-static {v1}, Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem;->createView(Landroid/content/Context;)Landroid/view/View;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vkontakte/android/fragments/feedback/TempPostHolder;-><init>(Landroid/view/View;)V

    goto/16 :goto_0

    .line 431
    :pswitch_b
    new-instance v0, Lcom/vkontakte/android/fragments/feedback/TempPostHolder;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment$NotificationsAdapter;->this$0:Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-static {v1}, Lcom/vkontakte/android/ui/posts/CommentPostDisplayItem;->createView(Landroid/content/Context;)Landroid/view/View;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vkontakte/android/fragments/feedback/TempPostHolder;-><init>(Landroid/view/View;)V

    goto/16 :goto_0

    .line 433
    :pswitch_c
    new-instance v0, Lcom/vkontakte/android/fragments/feedback/TempPostHolder;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment$NotificationsAdapter;->this$0:Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-static {v1}, Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem;->createView(Landroid/content/Context;)Landroid/view/View;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vkontakte/android/fragments/feedback/TempPostHolder;-><init>(Landroid/view/View;)V

    goto/16 :goto_0

    .line 435
    :pswitch_d
    new-instance v0, Lcom/vkontakte/android/fragments/feedback/TempPostHolder;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment$NotificationsAdapter;->this$0:Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-static {v1}, Lcom/vkontakte/android/ui/posts/AudioPostDisplayItem;->createView(Landroid/content/Context;)Landroid/view/View;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vkontakte/android/fragments/feedback/TempPostHolder;-><init>(Landroid/view/View;)V

    goto/16 :goto_0

    .line 437
    :pswitch_e
    new-instance v0, Lcom/vkontakte/android/fragments/feedback/TempPostHolder;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment$NotificationsAdapter;->this$0:Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-static {v1}, Lcom/vkontakte/android/ui/posts/CommonAttachmentPostDisplayItem;->createView(Landroid/content/Context;)Landroid/view/View;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vkontakte/android/fragments/feedback/TempPostHolder;-><init>(Landroid/view/View;)V

    goto/16 :goto_0

    .line 439
    :pswitch_f
    new-instance v0, Lcom/vkontakte/android/fragments/feedback/TempPostHolder;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment$NotificationsAdapter;->this$0:Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-static {v1}, Lcom/vkontakte/android/ui/posts/SignaturePostDisplayItem;->createView(Landroid/content/Context;)Landroid/view/View;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vkontakte/android/fragments/feedback/TempPostHolder;-><init>(Landroid/view/View;)V

    goto/16 :goto_0

    .line 441
    :pswitch_10
    new-instance v0, Lcom/vkontakte/android/fragments/feedback/TempPostHolder;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment$NotificationsAdapter;->this$0:Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-static {v1}, Lcom/vkontakte/android/ui/posts/AttachContainerPostDisplayItem;->createView(Landroid/content/Context;)Landroid/view/View;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vkontakte/android/fragments/feedback/TempPostHolder;-><init>(Landroid/view/View;)V

    goto/16 :goto_0

    .line 443
    :pswitch_11
    new-instance v0, Lcom/vkontakte/android/fragments/feedback/TempPostHolder;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment$NotificationsAdapter;->this$0:Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-static {v1}, Lcom/vkontakte/android/ui/posts/ButtonsPostDisplayItem;->createView(Landroid/content/Context;)Landroid/view/View;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vkontakte/android/fragments/feedback/TempPostHolder;-><init>(Landroid/view/View;)V

    goto/16 :goto_0

    .line 445
    :pswitch_12
    new-instance v0, Lcom/vkontakte/android/fragments/feedback/TempPostHolder;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment$NotificationsAdapter;->this$0:Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/feedback/NotificationsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-static {v1}, Lcom/vkontakte/android/ui/posts/MarkedAsAdsPostDisplayItem;->createView(Landroid/content/Context;)Landroid/view/View;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vkontakte/android/fragments/feedback/TempPostHolder;-><init>(Landroid/view/View;)V

    goto/16 :goto_0

    .line 407
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_5
        :pswitch_8
        :pswitch_9
        :pswitch_a
        :pswitch_b
        :pswitch_c
        :pswitch_d
        :pswitch_e
        :pswitch_f
        :pswitch_10
        :pswitch_11
        :pswitch_0
        :pswitch_6
        :pswitch_2
        :pswitch_4
        :pswitch_1
        :pswitch_0
        :pswitch_3
        :pswitch_0
        :pswitch_0
        :pswitch_7
        :pswitch_12
    .end packed-switch
.end method
