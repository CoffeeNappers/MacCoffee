.class public Lcom/vkontakte/android/ui/holder/DiscussionHolder;
.super Lcom/vkontakte/android/ui/holder/RecyclerHolder;
.source "DiscussionHolder.java"

# interfaces
.implements Lme/grishka/appkit/views/UsableRecyclerView$Clickable;
.implements Lme/grishka/appkit/views/UsableRecyclerView$LongClickable;
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/ui/holder/DiscussionHolder$DiscussionClickable;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
        "<",
        "Lcom/vkontakte/android/api/BoardTopic;",
        ">;",
        "Lme/grishka/appkit/views/UsableRecyclerView$Clickable;",
        "Lme/grishka/appkit/views/UsableRecyclerView$LongClickable;",
        "Landroid/view/View$OnClickListener;"
    }
.end annotation


# instance fields
.field final discussionClickable:Lcom/vkontakte/android/ui/holder/DiscussionHolder$DiscussionClickable;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field topicInfo:Landroid/widget/TextView;

.field topicLName:Landroid/widget/TextView;

.field topicLText:Landroid/widget/TextView;

.field topicLUpdated:Landroid/widget/TextView;

.field topicPhoto:Lcom/vk/imageloader/view/VKImageView;

.field topicTitle:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/vkontakte/android/ui/holder/DiscussionHolder$DiscussionClickable;)V
    .locals 1
    .param p1, "ctx"    # Landroid/content/Context;
    .param p2, "discussionClickable"    # Lcom/vkontakte/android/ui/holder/DiscussionHolder$DiscussionClickable;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 36
    const v0, 0x7f030064

    invoke-direct {p0, v0, p1}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;-><init>(ILandroid/content/Context;)V

    .line 37
    iput-object p2, p0, Lcom/vkontakte/android/ui/holder/DiscussionHolder;->discussionClickable:Lcom/vkontakte/android/ui/holder/DiscussionHolder$DiscussionClickable;

    .line 39
    const v0, 0x7f10024f

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/holder/DiscussionHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/imageloader/view/VKImageView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/holder/DiscussionHolder;->topicPhoto:Lcom/vk/imageloader/view/VKImageView;

    .line 41
    const v0, 0x7f10024b

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/holder/DiscussionHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/holder/DiscussionHolder;->topicTitle:Landroid/widget/TextView;

    .line 42
    const v0, 0x7f10024c

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/holder/DiscussionHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/holder/DiscussionHolder;->topicInfo:Landroid/widget/TextView;

    .line 43
    const v0, 0x7f100250

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/holder/DiscussionHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/holder/DiscussionHolder;->topicLName:Landroid/widget/TextView;

    .line 44
    const v0, 0x7f100251

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/holder/DiscussionHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/holder/DiscussionHolder;->topicLText:Landroid/widget/TextView;

    .line 45
    const v0, 0x7f100252

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/holder/DiscussionHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/holder/DiscussionHolder;->topicLUpdated:Landroid/widget/TextView;

    .line 47
    const v0, 0x7f10024d

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/holder/DiscussionHolder;->$(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 48
    return-void
.end method


# virtual methods
.method public onBind(Lcom/vkontakte/android/api/BoardTopic;)V
    .locals 7
    .param p1, "t"    # Lcom/vkontakte/android/api/BoardTopic;

    .prologue
    .line 63
    iget-object v1, p1, Lcom/vkontakte/android/api/BoardTopic;->updatedBy:Lcom/vkontakte/android/UserProfile;

    if-eqz v1, :cond_1

    .line 64
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/DiscussionHolder;->topicPhoto:Lcom/vk/imageloader/view/VKImageView;

    iget-object v2, p1, Lcom/vkontakte/android/api/BoardTopic;->updatedBy:Lcom/vkontakte/android/UserProfile;

    iget-object v2, v2, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    .line 68
    :goto_0
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/DiscussionHolder;->topicTitle:Landroid/widget/TextView;

    iget-object v2, p1, Lcom/vkontakte/android/api/BoardTopic;->title:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 70
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/DiscussionHolder;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0d005e

    iget v3, p1, Lcom/vkontakte/android/api/BoardTopic;->numComments:I

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    iget v6, p1, Lcom/vkontakte/android/api/BoardTopic;->numComments:I

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-virtual {v1, v2, v3, v4}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 71
    .local v0, "info":Ljava/lang/String;
    iget v1, p1, Lcom/vkontakte/android/api/BoardTopic;->flags:I

    and-int/lit8 v1, v1, 0x1

    if-lez v1, :cond_2

    iget v1, p1, Lcom/vkontakte/android/api/BoardTopic;->flags:I

    and-int/lit8 v1, v1, 0x2

    if-lez v1, :cond_2

    .line 72
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/DiscussionHolder;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f080714

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 79
    :cond_0
    :goto_1
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/DiscussionHolder;->topicInfo:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 80
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/DiscussionHolder;->topicLName:Landroid/widget/TextView;

    iget-object v2, p1, Lcom/vkontakte/android/api/BoardTopic;->updatedBy:Lcom/vkontakte/android/UserProfile;

    iget-object v2, v2, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 81
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/DiscussionHolder;->topicLText:Landroid/widget/TextView;

    iget-object v2, p1, Lcom/vkontakte/android/api/BoardTopic;->lastComment:Ljava/lang/CharSequence;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 82
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/DiscussionHolder;->topicLUpdated:Landroid/widget/TextView;

    iget v2, p1, Lcom/vkontakte/android/api/BoardTopic;->updated:I

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/DiscussionHolder;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/vkontakte/android/TimeUtils;->langDateRelative(ILandroid/content/res/Resources;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 83
    return-void

    .line 66
    .end local v0    # "info":Ljava/lang/String;
    :cond_1
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/DiscussionHolder;->topicPhoto:Lcom/vk/imageloader/view/VKImageView;

    invoke-virtual {v1}, Lcom/vk/imageloader/view/VKImageView;->clear()V

    goto :goto_0

    .line 73
    .restart local v0    # "info":Ljava/lang/String;
    :cond_2
    iget v1, p1, Lcom/vkontakte/android/api/BoardTopic;->flags:I

    and-int/lit8 v1, v1, 0x1

    if-lez v1, :cond_3

    .line 74
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/DiscussionHolder;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f080712

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    .line 75
    :cond_3
    iget v1, p1, Lcom/vkontakte/android/api/BoardTopic;->flags:I

    and-int/lit8 v1, v1, 0x2

    if-lez v1, :cond_0

    .line 76
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/DiscussionHolder;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f080713

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_1
.end method

.method public bridge synthetic onBind(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 15
    check-cast p1, Lcom/vkontakte/android/api/BoardTopic;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/ui/holder/DiscussionHolder;->onBind(Lcom/vkontakte/android/api/BoardTopic;)V

    return-void
.end method

.method public onClick()V
    .locals 3

    .prologue
    .line 89
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/DiscussionHolder;->discussionClickable:Lcom/vkontakte/android/ui/holder/DiscussionHolder$DiscussionClickable;

    if-eqz v0, :cond_0

    .line 90
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/DiscussionHolder;->discussionClickable:Lcom/vkontakte/android/ui/holder/DiscussionHolder$DiscussionClickable;

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/DiscussionHolder;->getItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/api/BoardTopic;

    const/4 v2, 0x0

    invoke-interface {v1, v0, v2}, Lcom/vkontakte/android/ui/holder/DiscussionHolder$DiscussionClickable;->onClick(Lcom/vkontakte/android/api/BoardTopic;Z)V

    .line 92
    :cond_0
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 52
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 59
    :cond_0
    :goto_0
    return-void

    .line 54
    :pswitch_0
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/DiscussionHolder;->discussionClickable:Lcom/vkontakte/android/ui/holder/DiscussionHolder$DiscussionClickable;

    if-eqz v0, :cond_0

    .line 55
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/DiscussionHolder;->discussionClickable:Lcom/vkontakte/android/ui/holder/DiscussionHolder$DiscussionClickable;

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/DiscussionHolder;->getItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/api/BoardTopic;

    const/4 v2, 0x1

    invoke-interface {v1, v0, v2}, Lcom/vkontakte/android/ui/holder/DiscussionHolder$DiscussionClickable;->onClick(Lcom/vkontakte/android/api/BoardTopic;Z)V

    goto :goto_0

    .line 52
    nop

    :pswitch_data_0
    .packed-switch 0x7f10024d
        :pswitch_0
    .end packed-switch
.end method

.method public onLongClick()Z
    .locals 2

    .prologue
    .line 98
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/DiscussionHolder;->discussionClickable:Lcom/vkontakte/android/ui/holder/DiscussionHolder$DiscussionClickable;

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/DiscussionHolder;->discussionClickable:Lcom/vkontakte/android/ui/holder/DiscussionHolder$DiscussionClickable;

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/DiscussionHolder;->getItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/api/BoardTopic;

    invoke-interface {v1, v0}, Lcom/vkontakte/android/ui/holder/DiscussionHolder$DiscussionClickable;->onLongClick(Lcom/vkontakte/android/api/BoardTopic;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
