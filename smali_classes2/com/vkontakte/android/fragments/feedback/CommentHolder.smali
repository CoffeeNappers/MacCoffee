.class Lcom/vkontakte/android/fragments/feedback/CommentHolder;
.super Lcom/vkontakte/android/ui/holder/RecyclerHolder;
.source "CommentHolder.java"

# interfaces
.implements Lme/grishka/appkit/views/UsableRecyclerView$Clickable;
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
        "<",
        "Lcom/vkontakte/android/api/models/Notification;",
        ">;",
        "Lme/grishka/appkit/views/UsableRecyclerView$Clickable;",
        "Landroid/view/View$OnClickListener;"
    }
.end annotation


# static fields
.field private static final EMPTY_STRING:Ljava/lang/String; = ""

.field private static final TAG_POST_URL:I


# instance fields
.field private final info:Landroid/widget/TextView;

.field private mNewsAction:Lcom/vkontakte/android/functions/VoidF1Int;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/functions/VoidF1Int",
            "<",
            "Lcom/vkontakte/android/api/models/Notification;",
            ">;"
        }
    .end annotation
.end field

.field private mUsersAction:Lcom/vkontakte/android/functions/VoidF1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/functions/VoidF1",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;"
        }
    .end annotation
.end field

.field private final photo:Lcom/vk/imageloader/view/VKImageView;

.field private final postPhoto:Lcom/vk/imageloader/view/VKImageView;

.field private final subtitle:Landroid/widget/TextView;

.field private final title:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/view/ViewGroup;)V
    .locals 1
    .param p1, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 49
    const v0, 0x7f030185

    invoke-direct {p0, v0, p1}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;-><init>(ILandroid/view/ViewGroup;)V

    .line 50
    const v0, 0x7f100128

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/feedback/CommentHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/feedback/CommentHolder;->title:Landroid/widget/TextView;

    .line 51
    const v0, 0x7f10019c

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/feedback/CommentHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/feedback/CommentHolder;->subtitle:Landroid/widget/TextView;

    .line 52
    const v0, 0x7f1002b1

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/feedback/CommentHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/feedback/CommentHolder;->info:Landroid/widget/TextView;

    .line 53
    const v0, 0x7f1001e8

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/feedback/CommentHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/imageloader/view/VKImageView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/feedback/CommentHolder;->photo:Lcom/vk/imageloader/view/VKImageView;

    .line 54
    const v0, 0x7f10043a

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/feedback/CommentHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/imageloader/view/VKImageView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/feedback/CommentHolder;->postPhoto:Lcom/vk/imageloader/view/VKImageView;

    .line 56
    iget-object v0, p0, Lcom/vkontakte/android/fragments/feedback/CommentHolder;->photo:Lcom/vk/imageloader/view/VKImageView;

    invoke-virtual {v0, p0}, Lcom/vk/imageloader/view/VKImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 57
    return-void
.end method

.method static getImageURL(Lcom/vkontakte/android/api/models/Notification;I)Ljava/lang/String;
    .locals 1
    .param p0, "entry"    # Lcom/vkontakte/android/api/models/Notification;
    .param p1, "position"    # I

    .prologue
    .line 60
    if-nez p1, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/api/models/Notification;->commentUser:Lcom/vkontakte/android/UserProfile;

    iget-object v0, v0, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    :goto_0
    return-object v0

    :cond_0
    invoke-static {p0}, Lcom/vkontakte/android/fragments/feedback/CommentHolder;->getPostImageURL(Lcom/vkontakte/android/api/models/Notification;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public static getImagesCount(Lcom/vkontakte/android/api/models/Notification;)I
    .locals 1
    .param p0, "entry"    # Lcom/vkontakte/android/api/models/Notification;

    .prologue
    .line 120
    invoke-static {p0}, Lcom/vkontakte/android/fragments/feedback/CommentHolder;->getPostImageURL(Lcom/vkontakte/android/api/models/Notification;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x2

    goto :goto_0
.end method

.method public static getPostImageURL(Lcom/vkontakte/android/api/models/Notification;)Ljava/lang/String;
    .locals 7
    .param p0, "entry"    # Lcom/vkontakte/android/api/models/Notification;

    .prologue
    const/4 v6, 0x0

    .line 124
    invoke-virtual {p0, v6}, Lcom/vkontakte/android/api/models/Notification;->getTag(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 125
    .local v4, "url":Ljava/lang/String;
    if-nez v4, :cond_1

    .line 126
    const/4 v2, 0x0

    .line 127
    .local v2, "found":Z
    iget-object v5, p0, Lcom/vkontakte/android/api/models/Notification;->parentPost:Lcom/vkontakte/android/NewsEntry;

    iget-object v1, v5, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    .line 128
    .local v1, "attachments":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/attachments/Attachment;>;"
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-ge v3, v5, :cond_0

    .line 129
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/attachments/Attachment;

    .line 130
    .local v0, "att":Lcom/vkontakte/android/attachments/Attachment;
    instance-of v5, v0, Lcom/vkontakte/android/attachments/ImageAttachment;

    if-eqz v5, :cond_2

    .line 131
    check-cast v0, Lcom/vkontakte/android/attachments/ImageAttachment;

    .end local v0    # "att":Lcom/vkontakte/android/attachments/Attachment;
    invoke-interface {v0}, Lcom/vkontakte/android/attachments/ImageAttachment;->getImageURL()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v6, v4}, Lcom/vkontakte/android/api/models/Notification;->setTag(ILjava/lang/Object;)V

    .line 132
    const/4 v2, 0x1

    .line 136
    :cond_0
    if-nez v2, :cond_1

    .line 137
    const-string/jumbo v4, ""

    invoke-virtual {p0, v6, v4}, Lcom/vkontakte/android/api/models/Notification;->setTag(ILjava/lang/Object;)V

    .line 140
    .end local v1    # "attachments":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/attachments/Attachment;>;"
    .end local v2    # "found":Z
    .end local v3    # "i":I
    :cond_1
    return-object v4

    .line 128
    .restart local v0    # "att":Lcom/vkontakte/android/attachments/Attachment;
    .restart local v1    # "attachments":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/attachments/Attachment;>;"
    .restart local v2    # "found":Z
    .restart local v3    # "i":I
    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0
.end method


# virtual methods
.method public attach(Lcom/vkontakte/android/functions/VoidF1;Lcom/vkontakte/android/functions/VoidF1Int;)Lcom/vkontakte/android/fragments/feedback/CommentHolder;
    .locals 0
    .param p2    # Lcom/vkontakte/android/functions/VoidF1Int;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vkontakte/android/functions/VoidF1",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;",
            "Lcom/vkontakte/android/functions/VoidF1Int",
            "<",
            "Lcom/vkontakte/android/api/models/Notification;",
            ">;)",
            "Lcom/vkontakte/android/fragments/feedback/CommentHolder;"
        }
    .end annotation

    .prologue
    .line 64
    .local p1, "userAction":Lcom/vkontakte/android/functions/VoidF1;, "Lcom/vkontakte/android/functions/VoidF1<Lcom/vkontakte/android/UserProfile;>;"
    .local p2, "newsAction":Lcom/vkontakte/android/functions/VoidF1Int;, "Lcom/vkontakte/android/functions/VoidF1Int<Lcom/vkontakte/android/api/models/Notification;>;"
    iput-object p2, p0, Lcom/vkontakte/android/fragments/feedback/CommentHolder;->mNewsAction:Lcom/vkontakte/android/functions/VoidF1Int;

    .line 65
    iput-object p1, p0, Lcom/vkontakte/android/fragments/feedback/CommentHolder;->mUsersAction:Lcom/vkontakte/android/functions/VoidF1;

    .line 66
    return-object p0
.end method

.method public onBind(Lcom/vkontakte/android/api/models/Notification;)V
    .locals 7
    .param p1, "e"    # Lcom/vkontakte/android/api/models/Notification;

    .prologue
    const/4 v2, 0x0

    const/16 v5, 0x20

    .line 71
    iget-object v3, p0, Lcom/vkontakte/android/fragments/feedback/CommentHolder;->photo:Lcom/vk/imageloader/view/VKImageView;

    iget-object v4, p1, Lcom/vkontakte/android/api/models/Notification;->commentUser:Lcom/vkontakte/android/UserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    .line 72
    iget-object v3, p0, Lcom/vkontakte/android/fragments/feedback/CommentHolder;->postPhoto:Lcom/vk/imageloader/view/VKImageView;

    invoke-static {p1}, Lcom/vkontakte/android/fragments/feedback/CommentHolder;->getPostImageURL(Lcom/vkontakte/android/api/models/Notification;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    .line 73
    iget-object v3, p0, Lcom/vkontakte/android/fragments/feedback/CommentHolder;->title:Landroid/widget/TextView;

    iget-object v4, p1, Lcom/vkontakte/android/api/models/Notification;->commentUser:Lcom/vkontakte/android/UserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 74
    iget-object v3, p0, Lcom/vkontakte/android/fragments/feedback/CommentHolder;->subtitle:Landroid/widget/TextView;

    invoke-virtual {p1}, Lcom/vkontakte/android/api/models/Notification;->getText()Ljava/lang/CharSequence;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 76
    invoke-virtual {p1}, Lcom/vkontakte/android/api/models/Notification;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/text/SpannableStringBuilder;

    .line 77
    .local v0, "infoText":Landroid/text/SpannableStringBuilder;
    if-nez v0, :cond_0

    .line 78
    new-instance v0, Landroid/text/SpannableStringBuilder;

    .end local v0    # "infoText":Landroid/text/SpannableStringBuilder;
    iget v3, p1, Lcom/vkontakte/android/api/models/Notification;->date:I

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/feedback/CommentHolder;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/vkontakte/android/TimeUtils;->langDateRelative(ILandroid/content/res/Resources;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v3}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 79
    .restart local v0    # "infoText":Landroid/text/SpannableStringBuilder;
    invoke-virtual {v0, v5}, Landroid/text/SpannableStringBuilder;->append(C)Landroid/text/SpannableStringBuilder;

    .line 80
    iget-object v3, p1, Lcom/vkontakte/android/api/models/Notification;->link:Ljava/lang/CharSequence;

    if-nez v3, :cond_1

    move v1, v2

    .line 81
    .local v1, "linkLen":I
    :goto_0
    sget-object v3, Lcom/vkontakte/android/fragments/feedback/CommentHolder$1;->$SwitchMap$com$vkontakte$android$api$models$Notification$ParentType:[I

    iget-object v4, p1, Lcom/vkontakte/android/api/models/Notification;->type:Lcom/vkontakte/android/api/models/Notification$Type;

    iget-object v4, v4, Lcom/vkontakte/android/api/models/Notification$Type;->parentType:Lcom/vkontakte/android/api/models/Notification$ParentType;

    invoke-virtual {v4}, Lcom/vkontakte/android/api/models/Notification$ParentType;->ordinal()I

    move-result v4

    aget v3, v3, v4

    packed-switch v3, :pswitch_data_0

    .line 107
    :goto_1
    if-lez v1, :cond_0

    .line 108
    iget-object v3, p1, Lcom/vkontakte/android/api/models/Notification;->link:Ljava/lang/CharSequence;

    invoke-virtual {v0, v3}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 109
    new-instance v3, Landroid/text/style/ForegroundColorSpan;

    const v4, -0xb88b58

    invoke-direct {v3, v4}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 110
    invoke-virtual {v0}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v4

    sub-int/2addr v4, v1

    invoke-virtual {v0}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v5

    const/16 v6, 0x21

    .line 109
    invoke-virtual {v0, v3, v4, v5, v6}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 113
    .end local v1    # "linkLen":I
    :cond_0
    iget-object v3, p0, Lcom/vkontakte/android/fragments/feedback/CommentHolder;->info:Landroid/widget/TextView;

    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 114
    iget-object v3, p0, Lcom/vkontakte/android/fragments/feedback/CommentHolder;->info:Landroid/widget/TextView;

    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 116
    iget-object v3, p0, Lcom/vkontakte/android/fragments/feedback/CommentHolder;->postPhoto:Lcom/vk/imageloader/view/VKImageView;

    invoke-static {p1}, Lcom/vkontakte/android/fragments/feedback/CommentHolder;->getPostImageURL(Lcom/vkontakte/android/api/models/Notification;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_2

    :goto_2
    invoke-virtual {v3, v2}, Lcom/vk/imageloader/view/VKImageView;->setVisibility(I)V

    .line 117
    return-void

    .line 80
    :cond_1
    iget-object v3, p1, Lcom/vkontakte/android/api/models/Notification;->link:Ljava/lang/CharSequence;

    invoke-interface {v3}, Ljava/lang/CharSequence;->length()I

    move-result v1

    goto :goto_0

    .line 83
    .restart local v1    # "linkLen":I
    :pswitch_0
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/feedback/CommentHolder;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f08046f

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 84
    invoke-virtual {v0, v5}, Landroid/text/SpannableStringBuilder;->append(C)Landroid/text/SpannableStringBuilder;

    goto :goto_1

    .line 87
    :pswitch_1
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/feedback/CommentHolder;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f080471

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 88
    invoke-virtual {v0, v5}, Landroid/text/SpannableStringBuilder;->append(C)Landroid/text/SpannableStringBuilder;

    goto :goto_1

    .line 91
    :pswitch_2
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/feedback/CommentHolder;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f080470

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    goto :goto_1

    .line 94
    :pswitch_3
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/feedback/CommentHolder;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f080473

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 95
    invoke-virtual {v0, v5}, Landroid/text/SpannableStringBuilder;->append(C)Landroid/text/SpannableStringBuilder;

    goto/16 :goto_1

    .line 98
    :pswitch_4
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/feedback/CommentHolder;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f08046e

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 99
    invoke-virtual {v0, v5}, Landroid/text/SpannableStringBuilder;->append(C)Landroid/text/SpannableStringBuilder;

    goto/16 :goto_1

    .line 102
    :pswitch_5
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/feedback/CommentHolder;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f080472

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 103
    invoke-virtual {v0, v5}, Landroid/text/SpannableStringBuilder;->append(C)Landroid/text/SpannableStringBuilder;

    goto/16 :goto_1

    .line 116
    .end local v1    # "linkLen":I
    :cond_2
    const/16 v2, 0x8

    goto :goto_2

    .line 81
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
    .end packed-switch
.end method

.method public bridge synthetic onBind(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 34
    check-cast p1, Lcom/vkontakte/android/api/models/Notification;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/feedback/CommentHolder;->onBind(Lcom/vkontakte/android/api/models/Notification;)V

    return-void
.end method

.method public onClick()V
    .locals 3

    .prologue
    .line 145
    iget-object v0, p0, Lcom/vkontakte/android/fragments/feedback/CommentHolder;->mNewsAction:Lcom/vkontakte/android/functions/VoidF1Int;

    if-eqz v0, :cond_0

    .line 146
    iget-object v0, p0, Lcom/vkontakte/android/fragments/feedback/CommentHolder;->mNewsAction:Lcom/vkontakte/android/functions/VoidF1Int;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/feedback/CommentHolder;->getItem()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/feedback/CommentHolder;->getAdapterPosition()I

    move-result v2

    invoke-interface {v0, v1, v2}, Lcom/vkontakte/android/functions/VoidF1Int;->f(Ljava/lang/Object;I)V

    .line 148
    :cond_0
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 152
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/feedback/CommentHolder;->getItem()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/fragments/feedback/CommentHolder;->mUsersAction:Lcom/vkontakte/android/functions/VoidF1;

    if-eqz v0, :cond_0

    .line 153
    iget-object v1, p0, Lcom/vkontakte/android/fragments/feedback/CommentHolder;->mUsersAction:Lcom/vkontakte/android/functions/VoidF1;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/feedback/CommentHolder;->getItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/api/models/Notification;

    iget-object v0, v0, Lcom/vkontakte/android/api/models/Notification;->commentUser:Lcom/vkontakte/android/UserProfile;

    invoke-interface {v1, v0}, Lcom/vkontakte/android/functions/VoidF1;->f(Ljava/lang/Object;)V

    .line 155
    :cond_0
    return-void
.end method
