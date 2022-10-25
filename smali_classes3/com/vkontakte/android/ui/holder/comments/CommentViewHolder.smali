.class public Lcom/vkontakte/android/ui/holder/comments/CommentViewHolder;
.super Lcom/vkontakte/android/ui/holder/comments/AbsCommentViewHolder;
.source "CommentViewHolder.java"

# interfaces
.implements Lme/grishka/appkit/views/UsableRecyclerView$Clickable;
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/ui/holder/comments/CommentViewHolder$CommentViewHolderListener;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T::",
        "Lcom/vkontakte/android/Comment;",
        ">",
        "Lcom/vkontakte/android/ui/holder/comments/AbsCommentViewHolder",
        "<TT;>;",
        "Lme/grishka/appkit/views/UsableRecyclerView$Clickable;",
        "Landroid/view/View$OnClickListener;"
    }
.end annotation


# instance fields
.field private attachContainer:Landroid/view/ViewGroup;

.field private date:Landroid/widget/TextView;

.field private final holderListener:Lcom/vkontakte/android/ui/holder/comments/CommentViewHolder$CommentViewHolderListener;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/ui/holder/comments/CommentViewHolder$CommentViewHolderListener",
            "<TT;>;"
        }
    .end annotation
.end field

.field private likes:Landroid/widget/TextView;

.field private name:Landroid/widget/TextView;

.field private photo:Lcom/vk/imageloader/view/VKImageView;

.field private reply:Landroid/widget/ImageView;

.field private text:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/view/ViewGroup;Lcom/vkontakte/android/ui/holder/comments/CommentViewHolder$CommentViewHolderListener;)V
    .locals 6
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/ViewGroup;",
            "Lcom/vkontakte/android/ui/holder/comments/CommentViewHolder$CommentViewHolderListener",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 51
    .local p0, "this":Lcom/vkontakte/android/ui/holder/comments/CommentViewHolder;, "Lcom/vkontakte/android/ui/holder/comments/CommentViewHolder<TT;>;"
    .local p2, "holderListener":Lcom/vkontakte/android/ui/holder/comments/CommentViewHolder$CommentViewHolderListener;, "Lcom/vkontakte/android/ui/holder/comments/CommentViewHolder$CommentViewHolderListener<TT;>;"
    const v1, 0x7f030237

    invoke-direct {p0, v1, p1}, Lcom/vkontakte/android/ui/holder/comments/AbsCommentViewHolder;-><init>(ILandroid/view/ViewGroup;)V

    .line 52
    iput-object p2, p0, Lcom/vkontakte/android/ui/holder/comments/CommentViewHolder;->holderListener:Lcom/vkontakte/android/ui/holder/comments/CommentViewHolder$CommentViewHolderListener;

    .line 53
    const v1, 0x7f10059e

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/ui/holder/comments/CommentViewHolder;->$(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/vk/imageloader/view/VKImageView;

    iput-object v1, p0, Lcom/vkontakte/android/ui/holder/comments/CommentViewHolder;->photo:Lcom/vk/imageloader/view/VKImageView;

    invoke-virtual {v1, p0}, Lcom/vk/imageloader/view/VKImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 54
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/comments/CommentViewHolder;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    const-string/jumbo v2, "fontSize"

    const-string/jumbo v3, "0"

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    .line 55
    .local v0, "k":I
    const v1, 0x7f10027b

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/ui/holder/comments/CommentViewHolder;->$(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/vkontakte/android/ui/holder/comments/CommentViewHolder;->text:Landroid/widget/TextView;

    .line 56
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/comments/CommentViewHolder;->text:Landroid/widget/TextView;

    const/4 v2, 0x1

    const/high16 v3, 0x41800000    # 16.0f

    int-to-float v4, v0

    const/high16 v5, 0x40000000    # 2.0f

    mul-float/2addr v4, v5

    add-float/2addr v3, v4

    invoke-virtual {v1, v2, v3}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 57
    const v1, 0x7f100407

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/ui/holder/comments/CommentViewHolder;->$(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/vkontakte/android/ui/holder/comments/CommentViewHolder;->name:Landroid/widget/TextView;

    .line 58
    const v1, 0x7f100402

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/ui/holder/comments/CommentViewHolder;->$(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/vkontakte/android/ui/holder/comments/CommentViewHolder;->likes:Landroid/widget/TextView;

    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 59
    const v1, 0x7f100408

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/ui/holder/comments/CommentViewHolder;->$(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/vkontakte/android/ui/holder/comments/CommentViewHolder;->date:Landroid/widget/TextView;

    .line 60
    const v1, 0x7f10059f

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/ui/holder/comments/CommentViewHolder;->$(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    iput-object v1, p0, Lcom/vkontakte/android/ui/holder/comments/CommentViewHolder;->attachContainer:Landroid/view/ViewGroup;

    .line 61
    const v1, 0x7f1005a0

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/ui/holder/comments/CommentViewHolder;->$(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    iput-object v1, p0, Lcom/vkontakte/android/ui/holder/comments/CommentViewHolder;->reply:Landroid/widget/ImageView;

    invoke-virtual {v1, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 91
    return-void
.end method

.method private canShowLongDate()Z
    .locals 2

    .prologue
    .line 114
    .local p0, "this":Lcom/vkontakte/android/ui/holder/comments/CommentViewHolder;, "Lcom/vkontakte/android/ui/holder/comments/CommentViewHolder<TT;>;"
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/comments/CommentViewHolder;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/vk/core/util/Screen;->isTablet(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 115
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/comments/CommentViewHolder;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/comments/CommentViewHolder;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v1, v1, Landroid/util/DisplayMetrics;->heightPixels:I

    if-le v0, v1, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public onBind(Lcom/vkontakte/android/Comment;)V
    .locals 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/vkontakte/android/ui/holder/comments/CommentViewHolder;, "Lcom/vkontakte/android/ui/holder/comments/CommentViewHolder<TT;>;"
    .local p1, "comment":Lcom/vkontakte/android/Comment;, "TT;"
    const/16 v10, 0xa0

    const/16 v7, 0x8

    const/4 v5, 0x1

    const/4 v12, 0x0

    const/4 v6, 0x0

    .line 120
    iget-object v4, p0, Lcom/vkontakte/android/ui/holder/comments/CommentViewHolder;->itemView:Landroid/view/View;

    const v8, 0x7f100082

    invoke-virtual {v4, v8}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_0

    .line 121
    iget-object v8, p0, Lcom/vkontakte/android/ui/holder/comments/CommentViewHolder;->itemView:Landroid/view/View;

    iget-object v4, p0, Lcom/vkontakte/android/ui/holder/comments/CommentViewHolder;->itemView:Landroid/view/View;

    const v9, 0x7f100082

    invoke-virtual {v4, v9}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Runnable;

    invoke-virtual {v8, v4}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 123
    :cond_0
    iget-object v4, p0, Lcom/vkontakte/android/ui/holder/comments/CommentViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v4, v12}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 124
    iget-object v4, p0, Lcom/vkontakte/android/ui/holder/comments/CommentViewHolder;->photo:Lcom/vk/imageloader/view/VKImageView;

    invoke-interface {p1}, Lcom/vkontakte/android/Comment;->getUserPhoto()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v4, v8}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    .line 125
    iget-object v4, p0, Lcom/vkontakte/android/ui/holder/comments/CommentViewHolder;->text:Landroid/widget/TextView;

    invoke-interface {p1}, Lcom/vkontakte/android/Comment;->getDisplayableText()Ljava/lang/CharSequence;

    move-result-object v8

    invoke-virtual {v4, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 127
    new-instance v3, Landroid/text/SpannableStringBuilder;

    invoke-interface {p1}, Lcom/vkontakte/android/Comment;->getUserName()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 128
    .local v3, "titleSSB":Landroid/text/SpannableStringBuilder;
    invoke-interface {p1}, Lcom/vkontakte/android/Comment;->isAuthorVerified()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 129
    invoke-virtual {v3, v10}, Landroid/text/SpannableStringBuilder;->append(C)Landroid/text/SpannableStringBuilder;

    .line 130
    invoke-virtual {v3, v10}, Landroid/text/SpannableStringBuilder;->append(C)Landroid/text/SpannableStringBuilder;

    .line 131
    new-instance v4, Lcom/vkontakte/android/ui/drawables/CenteredImageSpan;

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/comments/CommentViewHolder;->getContext()Landroid/content/Context;

    move-result-object v8

    const v9, 0x7f0202ce

    invoke-direct {v4, v8, v9}, Lcom/vkontakte/android/ui/drawables/CenteredImageSpan;-><init>(Landroid/content/Context;I)V

    invoke-virtual {v3}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v8

    add-int/lit8 v8, v8, -0x1

    invoke-virtual {v3}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v9

    invoke-virtual {v3, v4, v8, v9, v6}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 133
    :cond_1
    iget-object v4, p0, Lcom/vkontakte/android/ui/holder/comments/CommentViewHolder;->name:Landroid/widget/TextView;

    invoke-virtual {v4, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 135
    invoke-interface {p1}, Lcom/vkontakte/android/Comment;->getResponseName()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_5

    .line 136
    iget-object v8, p0, Lcom/vkontakte/android/ui/holder/comments/CommentViewHolder;->date:Landroid/widget/TextView;

    const v9, 0x7f08015c

    const/4 v4, 0x2

    new-array v10, v4, [Ljava/lang/Object;

    invoke-interface {p1}, Lcom/vkontakte/android/Comment;->getTime()I

    move-result v11

    invoke-direct {p0}, Lcom/vkontakte/android/ui/holder/comments/CommentViewHolder;->canShowLongDate()Z

    move-result v4

    if-nez v4, :cond_4

    move v4, v5

    :goto_0
    invoke-static {v11, v4}, Lcom/vkontakte/android/TimeUtils;->langDate(IZ)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v10, v6

    invoke-interface {p1}, Lcom/vkontakte/android/Comment;->getResponseName()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v10, v5

    invoke-virtual {p0, v9, v10}, Lcom/vkontakte/android/ui/holder/comments/CommentViewHolder;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v8, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 148
    :goto_1
    iget-object v5, p0, Lcom/vkontakte/android/ui/holder/comments/CommentViewHolder;->text:Landroid/widget/TextView;

    invoke-interface {p1}, Lcom/vkontakte/android/Comment;->getDisplayableText()Ljava/lang/CharSequence;

    move-result-object v4

    invoke-interface {v4}, Ljava/lang/CharSequence;->length()I

    move-result v4

    if-lez v4, :cond_7

    move v4, v6

    :goto_2
    invoke-virtual {v5, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 150
    iget-object v5, p0, Lcom/vkontakte/android/ui/holder/comments/CommentViewHolder;->likes:Landroid/widget/TextView;

    invoke-interface {p1}, Lcom/vkontakte/android/Comment;->getNumLikes()I

    move-result v4

    if-lez v4, :cond_8

    new-instance v4, Lcom/vkontakte/android/ui/drawable/RecoloredDrawable;

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/comments/CommentViewHolder;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v9, 0x7f020191

    .line 151
    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v8

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/comments/CommentViewHolder;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    const v10, 0x7f0f0128

    invoke-virtual {v9, v10}, Landroid/content/res/Resources;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v9

    invoke-direct {v4, v8, v9}, Lcom/vkontakte/android/ui/drawable/RecoloredDrawable;-><init>(Landroid/graphics/drawable/Drawable;Landroid/content/res/ColorStateList;)V

    .line 150
    :goto_3
    invoke-virtual {v5, v4, v12, v12, v12}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 153
    iget-object v4, p0, Lcom/vkontakte/android/ui/holder/comments/CommentViewHolder;->likes:Landroid/widget/TextView;

    invoke-interface {p1}, Lcom/vkontakte/android/Comment;->isLiked()Z

    move-result v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setSelected(Z)V

    .line 154
    iget-object v5, p0, Lcom/vkontakte/android/ui/holder/comments/CommentViewHolder;->likes:Landroid/widget/TextView;

    invoke-interface {p1}, Lcom/vkontakte/android/Comment;->getNumLikes()I

    move-result v4

    if-lez v4, :cond_9

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {p1}, Lcom/vkontakte/android/Comment;->getNumLikes()I

    move-result v8

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v8, ""

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    :goto_4
    invoke-virtual {v5, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 156
    iget-object v4, p0, Lcom/vkontakte/android/ui/holder/comments/CommentViewHolder;->attachContainer:Landroid/view/ViewGroup;

    invoke-virtual {v4}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 157
    invoke-interface {p1}, Lcom/vkontakte/android/Comment;->getAttachments()Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-lez v4, :cond_a

    .line 158
    iget-object v4, p0, Lcom/vkontakte/android/ui/holder/comments/CommentViewHolder;->attachContainer:Landroid/view/ViewGroup;

    invoke-virtual {v4, v6}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 159
    iget-object v4, p0, Lcom/vkontakte/android/ui/holder/comments/CommentViewHolder;->attachContainer:Landroid/view/ViewGroup;

    invoke-interface {p1}, Lcom/vkontakte/android/Comment;->getAttachments()Ljava/util/ArrayList;

    move-result-object v5

    const v6, 0x7f10059f

    invoke-static {v4, v5, v12, v6}, Lcom/vkontakte/android/NewsItemView;->addAttachments(Landroid/view/View;Ljava/util/ArrayList;Lcom/vkontakte/android/NewsEntry;I)V

    .line 160
    invoke-interface {p1}, Lcom/vkontakte/android/Comment;->getAttachments()Ljava/util/ArrayList;

    move-result-object v1

    .line 161
    .local v1, "attachments":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/attachments/Attachment;>;"
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_5
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ge v2, v4, :cond_b

    .line 162
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/attachments/Attachment;

    .line 163
    .local v0, "att":Lcom/vkontakte/android/attachments/Attachment;
    instance-of v4, v0, Lcom/vkontakte/android/attachments/ImageAttachment;

    if-eqz v4, :cond_2

    move-object v4, v0

    .line 164
    check-cast v4, Lcom/vkontakte/android/attachments/ImageAttachment;

    iget-object v5, p0, Lcom/vkontakte/android/ui/holder/comments/CommentViewHolder;->attachContainer:Landroid/view/ViewGroup;

    invoke-virtual {v5, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    invoke-interface {v4, v5}, Lcom/vkontakte/android/attachments/ImageAttachment;->bind(Landroid/view/View;)V

    .line 166
    :cond_2
    instance-of v4, v0, Lcom/vkontakte/android/attachments/StickerAttachment;

    if-eqz v4, :cond_3

    .line 167
    check-cast v0, Lcom/vkontakte/android/attachments/StickerAttachment;

    .end local v0    # "att":Lcom/vkontakte/android/attachments/Attachment;
    iget-object v4, p0, Lcom/vkontakte/android/ui/holder/comments/CommentViewHolder;->holderListener:Lcom/vkontakte/android/ui/holder/comments/CommentViewHolder$CommentViewHolderListener;

    invoke-virtual {v0, v4}, Lcom/vkontakte/android/attachments/StickerAttachment;->setCallback(Lcom/vkontakte/android/attachments/StickerAttachment$Callback;)V

    .line 161
    :cond_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_5

    .end local v1    # "attachments":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/attachments/Attachment;>;"
    .end local v2    # "i":I
    :cond_4
    move v4, v6

    .line 136
    goto/16 :goto_0

    .line 138
    :cond_5
    iget-object v4, p0, Lcom/vkontakte/android/ui/holder/comments/CommentViewHolder;->date:Landroid/widget/TextView;

    invoke-interface {p1}, Lcom/vkontakte/android/Comment;->getTime()I

    move-result v8

    invoke-direct {p0}, Lcom/vkontakte/android/ui/holder/comments/CommentViewHolder;->canShowLongDate()Z

    move-result v9

    if-nez v9, :cond_6

    :goto_6
    invoke-static {v8, v5}, Lcom/vkontakte/android/TimeUtils;->langDate(IZ)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_1

    :cond_6
    move v5, v6

    goto :goto_6

    :cond_7
    move v4, v7

    .line 148
    goto/16 :goto_2

    .line 152
    :cond_8
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/comments/CommentViewHolder;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v8, 0x7f020191

    invoke-virtual {v4, v8}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    goto/16 :goto_3

    .line 154
    :cond_9
    const-string/jumbo v4, ""

    goto :goto_4

    .line 171
    :cond_a
    iget-object v4, p0, Lcom/vkontakte/android/ui/holder/comments/CommentViewHolder;->attachContainer:Landroid/view/ViewGroup;

    invoke-virtual {v4, v7}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 173
    :cond_b
    return-void
.end method

.method public bridge synthetic onBind(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 32
    .local p0, "this":Lcom/vkontakte/android/ui/holder/comments/CommentViewHolder;, "Lcom/vkontakte/android/ui/holder/comments/CommentViewHolder<TT;>;"
    check-cast p1, Lcom/vkontakte/android/Comment;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/ui/holder/comments/CommentViewHolder;->onBind(Lcom/vkontakte/android/Comment;)V

    return-void
.end method

.method public onClick()V
    .locals 2

    .prologue
    .line 177
    .local p0, "this":Lcom/vkontakte/android/ui/holder/comments/CommentViewHolder;, "Lcom/vkontakte/android/ui/holder/comments/CommentViewHolder<TT;>;"
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/comments/CommentViewHolder;->holderListener:Lcom/vkontakte/android/ui/holder/comments/CommentViewHolder$CommentViewHolderListener;

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/comments/CommentViewHolder;->getItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/Comment;

    invoke-interface {v1, v0}, Lcom/vkontakte/android/ui/holder/comments/CommentViewHolder$CommentViewHolderListener;->showCommentActions(Lcom/vkontakte/android/Comment;)V

    .line 178
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 100
    .local p0, "this":Lcom/vkontakte/android/ui/holder/comments/CommentViewHolder;, "Lcom/vkontakte/android/ui/holder/comments/CommentViewHolder<TT;>;"
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    sparse-switch v0, :sswitch_data_0

    .line 111
    :goto_0
    return-void

    .line 102
    :sswitch_0
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/comments/CommentViewHolder;->holderListener:Lcom/vkontakte/android/ui/holder/comments/CommentViewHolder$CommentViewHolderListener;

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/comments/CommentViewHolder;->getItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/Comment;

    invoke-interface {v1, v0}, Lcom/vkontakte/android/ui/holder/comments/CommentViewHolder$CommentViewHolderListener;->likeComment(Lcom/vkontakte/android/Comment;)V

    goto :goto_0

    .line 105
    :sswitch_1
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/comments/CommentViewHolder;->holderListener:Lcom/vkontakte/android/ui/holder/comments/CommentViewHolder$CommentViewHolderListener;

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/comments/CommentViewHolder;->getItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/Comment;

    invoke-interface {v1, v0}, Lcom/vkontakte/android/ui/holder/comments/CommentViewHolder$CommentViewHolderListener;->replyToComment(Lcom/vkontakte/android/Comment;)V

    goto :goto_0

    .line 108
    :sswitch_2
    new-instance v1, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/comments/CommentViewHolder;->getItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/Comment;

    invoke-interface {v0}, Lcom/vkontakte/android/Comment;->getUid()I

    move-result v0

    invoke-direct {v1, v0}, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;-><init>(I)V

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/comments/CommentViewHolder;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;->go(Landroid/content/Context;)Z

    goto :goto_0

    .line 100
    nop

    :sswitch_data_0
    .sparse-switch
        0x7f100402 -> :sswitch_0
        0x7f10059e -> :sswitch_2
        0x7f1005a0 -> :sswitch_1
    .end sparse-switch
.end method

.method public setCanReply(Z)Lcom/vkontakte/android/ui/holder/comments/CommentViewHolder;
    .locals 2
    .param p1, "canReply"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)",
            "Lcom/vkontakte/android/ui/holder/comments/CommentViewHolder",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 94
    .local p0, "this":Lcom/vkontakte/android/ui/holder/comments/CommentViewHolder;, "Lcom/vkontakte/android/ui/holder/comments/CommentViewHolder<TT;>;"
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/comments/CommentViewHolder;->reply:Landroid/widget/ImageView;

    if-eqz p1, :cond_0

    const/4 v0, 0x0

    :goto_0
    invoke-static {v1, v0}, Lcom/vkontakte/android/ViewUtils;->setVisibility(Landroid/view/View;I)V

    .line 95
    return-object p0

    .line 94
    :cond_0
    const/16 v0, 0x8

    goto :goto_0
.end method
