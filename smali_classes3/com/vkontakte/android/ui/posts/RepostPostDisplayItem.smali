.class public Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem;
.super Lcom/vkontakte/android/ui/posts/PostDisplayItem;
.source "RepostPostDisplayItem.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem$ViewHolder;
    }
.end annotation


# instance fields
.field private clickListener:Landroid/view/View$OnClickListener;

.field public origID:I

.field private post:Lcom/vkontakte/android/NewsEntry;

.field public repostType:I

.field public time:I

.field public uid:I

.field public userName:Ljava/lang/String;

.field public userPhoto:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/NewsEntry;Ljava/lang/String;Ljava/lang/String;IIIILcom/vkontakte/android/NewsEntry;)V
    .locals 1
    .param p1, "entry"    # Lcom/vkontakte/android/NewsEntry;
    .param p2, "_userName"    # Ljava/lang/String;
    .param p3, "_userPhoto"    # Ljava/lang/String;
    .param p4, "_uid"    # I
    .param p5, "_time"    # I
    .param p6, "_origID"    # I
    .param p7, "_repostType"    # I
    .param p8, "_post"    # Lcom/vkontakte/android/NewsEntry;

    .prologue
    .line 74
    invoke-direct {p0, p1}, Lcom/vkontakte/android/ui/posts/PostDisplayItem;-><init>(Lcom/vkontakte/android/NewsEntry;)V

    .line 30
    new-instance v0, Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem$1;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem$1;-><init>(Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem;)V

    iput-object v0, p0, Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem;->clickListener:Landroid/view/View$OnClickListener;

    .line 75
    iput-object p2, p0, Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem;->userName:Ljava/lang/String;

    .line 76
    iput-object p3, p0, Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem;->userPhoto:Ljava/lang/String;

    .line 77
    iput p4, p0, Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem;->uid:I

    .line 78
    iput p5, p0, Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem;->time:I

    .line 79
    iput p6, p0, Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem;->origID:I

    .line 80
    iput p7, p0, Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem;->repostType:I

    .line 81
    iput-object p8, p0, Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    .line 82
    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/Photo;Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/NewsEntry;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/Photo;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Ljava/lang/String;

    .prologue
    .line 25
    invoke-static {p0, p1, p2}, Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem;->getPhotoAsPost(Lcom/vkontakte/android/Photo;Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v0

    return-object v0
.end method

.method public static createView(Landroid/content/Context;)Landroid/view/View;
    .locals 4
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    const/4 v3, 0x0

    .line 95
    const v2, 0x7f030165

    invoke-static {p0, v2, v3}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    .line 96
    .local v1, "view":Landroid/view/View;
    new-instance v0, Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem$ViewHolder;

    invoke-direct {v0, v3}, Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem$ViewHolder;-><init>(Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem$1;)V

    .line 97
    .local v0, "holder":Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem$ViewHolder;
    const v2, 0x7f100411

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, v0, Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem$ViewHolder;->name:Landroid/widget/TextView;

    .line 98
    const v2, 0x7f100412

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, v0, Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem$ViewHolder;->time:Landroid/widget/TextView;

    .line 99
    const v2, 0x7f10040f

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/vk/imageloader/view/VKImageView;

    iput-object v2, v0, Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem$ViewHolder;->photo:Lcom/vk/imageloader/view/VKImageView;

    .line 100
    const v2, 0x7f100410

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    iput-object v2, v0, Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem$ViewHolder;->button:Landroid/view/View;

    .line 101
    invoke-virtual {v1, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 102
    return-object v1
.end method

.method private static getPhotoAsPost(Lcom/vkontakte/android/Photo;Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/NewsEntry;
    .locals 11
    .param p0, "photo"    # Lcom/vkontakte/android/Photo;
    .param p1, "userName"    # Ljava/lang/String;
    .param p2, "userPhoto"    # Ljava/lang/String;

    .prologue
    const-wide v4, -0x3f3e6c0000000000L    # -9000.0

    .line 146
    new-instance v0, Lcom/vkontakte/android/NewsEntry;

    invoke-direct {v0}, Lcom/vkontakte/android/NewsEntry;-><init>()V

    .line 147
    .local v0, "e":Lcom/vkontakte/android/NewsEntry;
    const/4 v2, 0x1

    iput v2, v0, Lcom/vkontakte/android/NewsEntry;->type:I

    .line 148
    iget v2, p0, Lcom/vkontakte/android/Photo;->id:I

    iput v2, v0, Lcom/vkontakte/android/NewsEntry;->postID:I

    .line 149
    iget v2, p0, Lcom/vkontakte/android/Photo;->ownerID:I

    iput v2, v0, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    .line 150
    iget v2, p0, Lcom/vkontakte/android/Photo;->userID:I

    iput v2, v0, Lcom/vkontakte/android/NewsEntry;->userID:I

    .line 151
    iget-object v2, v0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    new-instance v3, Lcom/vkontakte/android/attachments/PhotoAttachment;

    invoke-direct {v3, p0}, Lcom/vkontakte/android/attachments/PhotoAttachment;-><init>(Lcom/vkontakte/android/Photo;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 152
    iget v2, p0, Lcom/vkontakte/android/Photo;->date:I

    iput v2, v0, Lcom/vkontakte/android/NewsEntry;->time:I

    .line 153
    iget v2, p0, Lcom/vkontakte/android/Photo;->nLikes:I

    iput v2, v0, Lcom/vkontakte/android/NewsEntry;->numLikes:I

    .line 154
    iget v2, p0, Lcom/vkontakte/android/Photo;->nReposts:I

    iput v2, v0, Lcom/vkontakte/android/NewsEntry;->numRetweets:I

    .line 155
    iget v2, p0, Lcom/vkontakte/android/Photo;->nComments:I

    iput v2, v0, Lcom/vkontakte/android/NewsEntry;->numComments:I

    .line 156
    iput-object p1, v0, Lcom/vkontakte/android/NewsEntry;->userName:Ljava/lang/String;

    .line 157
    iput-object p2, v0, Lcom/vkontakte/android/NewsEntry;->userPhotoURL:Ljava/lang/String;

    .line 158
    iget-wide v2, p0, Lcom/vkontakte/android/Photo;->lat:D

    cmpl-double v2, v2, v4

    if-eqz v2, :cond_0

    iget-wide v2, p0, Lcom/vkontakte/android/Photo;->lon:D

    cmpl-double v2, v2, v4

    if-eqz v2, :cond_0

    .line 159
    new-instance v1, Lcom/vkontakte/android/attachments/GeoAttachment;

    iget-wide v2, p0, Lcom/vkontakte/android/Photo;->lat:D

    iget-wide v4, p0, Lcom/vkontakte/android/Photo;->lon:D

    const-string/jumbo v6, ""

    iget-object v7, p0, Lcom/vkontakte/android/Photo;->geoAddress:Ljava/lang/String;

    const/16 v8, -0x2328

    const/4 v9, 0x0

    const/4 v10, 0x0

    invoke-direct/range {v1 .. v10}, Lcom/vkontakte/android/attachments/GeoAttachment;-><init>(DDLjava/lang/String;Ljava/lang/String;ILjava/lang/String;I)V

    .line 160
    .local v1, "geo":Lcom/vkontakte/android/attachments/GeoAttachment;
    iget-object v2, v0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 162
    .end local v1    # "geo":Lcom/vkontakte/android/attachments/GeoAttachment;
    :cond_0
    const/16 v2, 0x8

    iget-boolean v3, p0, Lcom/vkontakte/android/Photo;->isLiked:Z

    invoke-virtual {v0, v2, v3}, Lcom/vkontakte/android/NewsEntry;->flag(IZ)V

    .line 163
    const/4 v2, 0x2

    iget-boolean v3, p0, Lcom/vkontakte/android/Photo;->canComment:Z

    invoke-virtual {v0, v2, v3}, Lcom/vkontakte/android/NewsEntry;->flag(IZ)V

    .line 164
    return-object v0
.end method


# virtual methods
.method public getImageCount()I
    .locals 1

    .prologue
    .line 91
    const/4 v0, 0x1

    return v0
.end method

.method public getImageURL(I)Ljava/lang/String;
    .locals 1
    .param p1, "image"    # I

    .prologue
    .line 142
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem;->userPhoto:Ljava/lang/String;

    return-object v0
.end method

.method public getType()I
    .locals 1

    .prologue
    .line 86
    const/4 v0, 0x3

    return v0
.end method

.method public onBindView(Landroid/view/View;)V
    .locals 13
    .param p1, "view"    # Landroid/view/View;

    .prologue
    const/4 v12, 0x5

    const/4 v11, 0x1

    const/4 v8, 0x0

    .line 107
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem$ViewHolder;

    .line 108
    .local v2, "holder":Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem$ViewHolder;
    iget-object v7, v2, Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem$ViewHolder;->name:Landroid/widget/TextView;

    iget-object v9, p0, Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem;->userName:Ljava/lang/String;

    invoke-virtual {v7, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 109
    iget-object v7, v2, Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem$ViewHolder;->button:Landroid/view/View;

    iget-object v9, p0, Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem;->clickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v7, v9}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 110
    iget-object v7, v2, Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem$ViewHolder;->photo:Lcom/vk/imageloader/view/VKImageView;

    invoke-virtual {p0, v8}, Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem;->getImageURL(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v9}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    .line 111
    iget-object v9, v2, Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem$ViewHolder;->photo:Lcom/vk/imageloader/view/VKImageView;

    iget v7, p0, Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem;->uid:I

    if-lez v7, :cond_5

    const v7, 0x7f02039b

    :goto_0
    invoke-virtual {v9, v7}, Lcom/vk/imageloader/view/VKImageView;->setPlaceholderImage(I)V

    .line 112
    const/4 v6, 0x0

    .line 113
    .local v6, "type":Ljava/lang/String;
    iget v7, p0, Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem;->repostType:I

    if-ne v7, v11, :cond_0

    .line 114
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, ", "

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    const v10, 0x7f0804a2

    invoke-virtual {v9, v10}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 116
    :cond_0
    iget v7, p0, Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem;->repostType:I

    const/4 v9, 0x2

    if-ne v7, v9, :cond_1

    .line 117
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, ", "

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    const v10, 0x7f08074b

    invoke-virtual {v9, v10}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 119
    :cond_1
    iget v7, p0, Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem;->repostType:I

    if-ne v7, v12, :cond_2

    .line 120
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, " "

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    const v10, 0x7f080471

    invoke-virtual {v9, v10}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 123
    :cond_2
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    iget v9, p0, Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem;->time:I

    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/vkontakte/android/TimeUtils;->langDateRelative(ILandroid/content/res/Resources;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    if-nez v6, :cond_3

    const-string/jumbo v6, ""

    .end local v6    # "type":Ljava/lang/String;
    :cond_3
    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 125
    .local v3, "infoHtml":Ljava/lang/CharSequence;
    iget-object v7, p0, Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    if-nez v7, :cond_6

    move v4, v8

    .line 126
    .local v4, "platformIconResId":I
    :goto_1
    iget-object v7, p0, Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    if-eqz v7, :cond_4

    if-eqz v4, :cond_4

    iget v7, p0, Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem;->repostType:I

    if-eq v7, v12, :cond_4

    .line 127
    new-instance v0, Landroid/text/SpannableStringBuilder;

    invoke-direct {v0, v3}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 128
    .local v0, "bldr":Landroid/text/SpannableStringBuilder;
    invoke-static {}, Landroid/text/Spannable$Factory;->getInstance()Landroid/text/Spannable$Factory;

    move-result-object v7

    const-string/jumbo v9, "F"

    invoke-virtual {v7, v9}, Landroid/text/Spannable$Factory;->newSpannable(Ljava/lang/CharSequence;)Landroid/text/Spannable;

    move-result-object v5

    .line 129
    .local v5, "sp":Landroid/text/Spannable;
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    invoke-virtual {v7, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 130
    .local v1, "d":Landroid/graphics/drawable/Drawable;
    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v7

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v9

    invoke-virtual {v1, v8, v8, v7, v9}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 131
    new-instance v7, Landroid/text/style/ImageSpan;

    invoke-direct {v7, v1, v8}, Landroid/text/style/ImageSpan;-><init>(Landroid/graphics/drawable/Drawable;I)V

    invoke-interface {v5, v7, v8, v11, v8}, Landroid/text/Spannable;->setSpan(Ljava/lang/Object;III)V

    .line 132
    const-string/jumbo v7, " "

    invoke-virtual {v0, v7}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 133
    invoke-virtual {v0, v5}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 134
    move-object v3, v0

    .line 137
    .end local v0    # "bldr":Landroid/text/SpannableStringBuilder;
    .end local v1    # "d":Landroid/graphics/drawable/Drawable;
    .end local v5    # "sp":Landroid/text/Spannable;
    :cond_4
    iget-object v7, v2, Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem$ViewHolder;->time:Landroid/widget/TextView;

    invoke-virtual {v7, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 138
    return-void

    .line 111
    .end local v3    # "infoHtml":Ljava/lang/CharSequence;
    .end local v4    # "platformIconResId":I
    :cond_5
    const v7, 0x7f02038e

    goto/16 :goto_0

    .line 125
    .restart local v3    # "infoHtml":Ljava/lang/CharSequence;
    :cond_6
    iget-object v7, p0, Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    invoke-virtual {v7}, Lcom/vkontakte/android/NewsEntry;->getPlatformIconResource()I

    move-result v4

    goto :goto_1
.end method
