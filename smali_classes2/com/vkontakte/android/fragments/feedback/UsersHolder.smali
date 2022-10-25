.class public Lcom/vkontakte/android/fragments/feedback/UsersHolder;
.super Lcom/vkontakte/android/ui/holder/RecyclerHolder;
.source "UsersHolder.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Lcom/vkontakte/android/ui/PhotoStripView$OnPhotoClickListener;
.implements Lme/grishka/appkit/views/UsableRecyclerView$Clickable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
        "<",
        "Lcom/vkontakte/android/api/models/Notification;",
        ">;",
        "Landroid/view/View$OnClickListener;",
        "Lcom/vkontakte/android/ui/PhotoStripView$OnPhotoClickListener;",
        "Lme/grishka/appkit/views/UsableRecyclerView$Clickable;"
    }
.end annotation


# static fields
.field private static final EMPTY_STRING:Ljava/lang/String; = ""

.field private static final TAG_POST_URL:I


# instance fields
.field private action:Landroid/widget/ImageView;

.field private final mActions:[[[Ljava/lang/String;

.field private mNewsAction:Lcom/vkontakte/android/functions/VoidF1Int;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/functions/VoidF1Int",
            "<",
            "Lcom/vkontakte/android/api/models/Notification;",
            ">;"
        }
    .end annotation
.end field

.field private mUserAction:Lcom/vkontakte/android/functions/VoidF1;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/functions/VoidF1",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;"
        }
    .end annotation
.end field

.field private photo:Lcom/vk/imageloader/view/VKImageView;

.field private postPhoto:Lcom/vk/imageloader/view/VKImageView;

.field private subtitle:Landroid/widget/TextView;

.field private title:Landroid/widget/TextView;

.field private users:Lcom/vkontakte/android/ui/PhotoStripView;


# direct methods
.method public constructor <init>(Landroid/view/ViewGroup;[[[Ljava/lang/String;)V
    .locals 1
    .param p1, "parent"    # Landroid/view/ViewGroup;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "actions"    # [[[Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 54
    const v0, 0x7f030186

    invoke-direct {p0, v0, p1}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;-><init>(ILandroid/view/ViewGroup;)V

    .line 55
    const v0, 0x7f100128

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/feedback/UsersHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/feedback/UsersHolder;->title:Landroid/widget/TextView;

    .line 56
    const v0, 0x7f10019c

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/feedback/UsersHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/feedback/UsersHolder;->subtitle:Landroid/widget/TextView;

    .line 57
    const v0, 0x7f1001e8

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/feedback/UsersHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/imageloader/view/VKImageView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/feedback/UsersHolder;->photo:Lcom/vk/imageloader/view/VKImageView;

    .line 58
    const v0, 0x7f10043a

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/feedback/UsersHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/imageloader/view/VKImageView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/feedback/UsersHolder;->postPhoto:Lcom/vk/imageloader/view/VKImageView;

    .line 59
    const v0, 0x7f1002b7

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/feedback/UsersHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/feedback/UsersHolder;->action:Landroid/widget/ImageView;

    .line 60
    const v0, 0x7f1002b2

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/feedback/UsersHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/ui/PhotoStripView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/feedback/UsersHolder;->users:Lcom/vkontakte/android/ui/PhotoStripView;

    .line 61
    iput-object p2, p0, Lcom/vkontakte/android/fragments/feedback/UsersHolder;->mActions:[[[Ljava/lang/String;

    .line 63
    iget-object v0, p0, Lcom/vkontakte/android/fragments/feedback/UsersHolder;->photo:Lcom/vk/imageloader/view/VKImageView;

    invoke-virtual {v0, p0}, Lcom/vk/imageloader/view/VKImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 64
    iget-object v0, p0, Lcom/vkontakte/android/fragments/feedback/UsersHolder;->postPhoto:Lcom/vk/imageloader/view/VKImageView;

    invoke-virtual {v0, p0}, Lcom/vk/imageloader/view/VKImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 65
    iget-object v0, p0, Lcom/vkontakte/android/fragments/feedback/UsersHolder;->users:Lcom/vkontakte/android/ui/PhotoStripView;

    invoke-virtual {v0, p0}, Lcom/vkontakte/android/ui/PhotoStripView;->setListener(Lcom/vkontakte/android/ui/PhotoStripView$OnPhotoClickListener;)V

    .line 66
    return-void
.end method

.method public static getImageURL(Lcom/vkontakte/android/api/models/Notification;I)Ljava/lang/String;
    .locals 2
    .param p0, "e"    # Lcom/vkontakte/android/api/models/Notification;
    .param p1, "index"    # I

    .prologue
    .line 249
    const/4 v0, 0x7

    iget-object v1, p0, Lcom/vkontakte/android/api/models/Notification;->feedBackUsers:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    if-ge p1, v0, :cond_0

    .line 250
    iget-object v0, p0, Lcom/vkontakte/android/api/models/Notification;->feedBackUsers:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/UserProfile;

    iget-object v0, v0, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    .line 252
    :goto_0
    return-object v0

    :cond_0
    invoke-static {p0}, Lcom/vkontakte/android/fragments/feedback/UsersHolder;->getPostImageURL(Lcom/vkontakte/android/api/models/Notification;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public static getImagesCount(Lcom/vkontakte/android/api/models/Notification;)I
    .locals 3
    .param p0, "entry"    # Lcom/vkontakte/android/api/models/Notification;

    .prologue
    .line 257
    invoke-static {p0}, Lcom/vkontakte/android/fragments/feedback/UsersHolder;->getPostImageURL(Lcom/vkontakte/android/api/models/Notification;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Lcom/vkontakte/android/api/models/Notification;->feedBackUsers:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x7

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    add-int/2addr v0, v1

    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public static getPostImageURL(Lcom/vkontakte/android/api/models/Notification;)Ljava/lang/String;
    .locals 8
    .param p0, "entry"    # Lcom/vkontakte/android/api/models/Notification;

    .prologue
    const/4 v7, 0x0

    .line 261
    iget-object v5, p0, Lcom/vkontakte/android/api/models/Notification;->type:Lcom/vkontakte/android/api/models/Notification$Type;

    sget-object v6, Lcom/vkontakte/android/api/models/Notification$Type;->MoneyTransferAccepted:Lcom/vkontakte/android/api/models/Notification$Type;

    if-eq v5, v6, :cond_0

    iget-object v5, p0, Lcom/vkontakte/android/api/models/Notification;->type:Lcom/vkontakte/android/api/models/Notification$Type;

    sget-object v6, Lcom/vkontakte/android/api/models/Notification$Type;->MoneyTransferDeclined:Lcom/vkontakte/android/api/models/Notification$Type;

    if-eq v5, v6, :cond_0

    iget-object v5, p0, Lcom/vkontakte/android/api/models/Notification;->type:Lcom/vkontakte/android/api/models/Notification$Type;

    sget-object v6, Lcom/vkontakte/android/api/models/Notification$Type;->MoneyTransferReceived:Lcom/vkontakte/android/api/models/Notification$Type;

    if-ne v5, v6, :cond_2

    .line 264
    :cond_0
    const v5, 0x7f02032d

    invoke-static {v5}, Lcom/vkontakte/android/utils/UriUtil;->resourceToUri(I)Ljava/lang/String;

    move-result-object v4

    .line 287
    :cond_1
    :goto_0
    return-object v4

    .line 267
    :cond_2
    invoke-virtual {p0, v7}, Lcom/vkontakte/android/api/models/Notification;->getTag(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 268
    .local v4, "url":Ljava/lang/String;
    if-nez v4, :cond_1

    .line 269
    const/4 v2, 0x0

    .line 270
    .local v2, "found":Z
    iget-object v5, p0, Lcom/vkontakte/android/api/models/Notification;->parentPost:Lcom/vkontakte/android/NewsEntry;

    if-eqz v5, :cond_3

    .line 271
    iget-object v5, p0, Lcom/vkontakte/android/api/models/Notification;->parentPost:Lcom/vkontakte/android/NewsEntry;

    iget-object v1, v5, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    .line 272
    .local v1, "attachments":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/attachments/Attachment;>;"
    if-eqz v1, :cond_3

    .line 273
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-ge v3, v5, :cond_3

    .line 274
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/attachments/Attachment;

    .line 275
    .local v0, "att":Lcom/vkontakte/android/attachments/Attachment;
    instance-of v5, v0, Lcom/vkontakte/android/attachments/ImageAttachment;

    if-eqz v5, :cond_4

    .line 276
    check-cast v0, Lcom/vkontakte/android/attachments/ImageAttachment;

    .end local v0    # "att":Lcom/vkontakte/android/attachments/Attachment;
    invoke-interface {v0}, Lcom/vkontakte/android/attachments/ImageAttachment;->getImageURL()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v7, v4}, Lcom/vkontakte/android/api/models/Notification;->setTag(ILjava/lang/Object;)V

    .line 277
    const/4 v2, 0x1

    .line 283
    .end local v1    # "attachments":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/attachments/Attachment;>;"
    .end local v3    # "i":I
    :cond_3
    if-nez v2, :cond_1

    .line 284
    const-string/jumbo v4, ""

    invoke-virtual {p0, v7, v4}, Lcom/vkontakte/android/api/models/Notification;->setTag(ILjava/lang/Object;)V

    goto :goto_0

    .line 273
    .restart local v0    # "att":Lcom/vkontakte/android/attachments/Attachment;
    .restart local v1    # "attachments":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/attachments/Attachment;>;"
    .restart local v3    # "i":I
    :cond_4
    add-int/lit8 v3, v3, 0x1

    goto :goto_1
.end method


# virtual methods
.method public attach(Lcom/vkontakte/android/functions/VoidF1;Lcom/vkontakte/android/functions/VoidF1Int;)Lcom/vkontakte/android/fragments/feedback/UsersHolder;
    .locals 0
    .param p1    # Lcom/vkontakte/android/functions/VoidF1;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
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
            "Lcom/vkontakte/android/fragments/feedback/UsersHolder;"
        }
    .end annotation

    .prologue
    .line 70
    .local p1, "userAction":Lcom/vkontakte/android/functions/VoidF1;, "Lcom/vkontakte/android/functions/VoidF1<Lcom/vkontakte/android/UserProfile;>;"
    .local p2, "newsAction":Lcom/vkontakte/android/functions/VoidF1Int;, "Lcom/vkontakte/android/functions/VoidF1Int<Lcom/vkontakte/android/api/models/Notification;>;"
    iput-object p1, p0, Lcom/vkontakte/android/fragments/feedback/UsersHolder;->mUserAction:Lcom/vkontakte/android/functions/VoidF1;

    .line 71
    iput-object p2, p0, Lcom/vkontakte/android/fragments/feedback/UsersHolder;->mNewsAction:Lcom/vkontakte/android/functions/VoidF1Int;

    .line 72
    return-object p0
.end method

.method public onBind(Lcom/vkontakte/android/api/models/Notification;)V
    .locals 24
    .param p1, "entry"    # Lcom/vkontakte/android/api/models/Notification;

    .prologue
    .line 77
    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/vkontakte/android/api/models/Notification;->feedBackUsers:Ljava/util/List;

    move-object/from16 v18, v0

    if-eqz v18, :cond_0

    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/vkontakte/android/api/models/Notification;->feedBackUsers:Ljava/util/List;

    move-object/from16 v18, v0

    invoke-interface/range {v18 .. v18}, Ljava/util/List;->size()I

    move-result v18

    if-lez v18, :cond_0

    .line 78
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/feedback/UsersHolder;->photo:Lcom/vk/imageloader/view/VKImageView;

    move-object/from16 v19, v0

    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/vkontakte/android/api/models/Notification;->feedBackUsers:Ljava/util/List;

    move-object/from16 v18, v0

    const/16 v20, 0x0

    move-object/from16 v0, v18

    move/from16 v1, v20

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Lcom/vkontakte/android/UserProfile;

    move-object/from16 v0, v18

    iget-object v0, v0, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    move-object/from16 v18, v0

    move-object/from16 v0, v19

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    .line 79
    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/vkontakte/android/api/models/Notification;->feedBackUsers:Ljava/util/List;

    move-object/from16 v18, v0

    invoke-interface/range {v18 .. v18}, Ljava/util/List;->size()I

    move-result v18

    const/16 v19, 0x1

    move/from16 v0, v18

    move/from16 v1, v19

    if-le v0, v1, :cond_0

    .line 80
    const/16 v18, 0x6

    const/16 v19, 0x0

    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/vkontakte/android/api/models/Notification;->feedBackUsers:Ljava/util/List;

    move-object/from16 v20, v0

    invoke-interface/range {v20 .. v20}, Ljava/util/List;->size()I

    move-result v20

    add-int/lit8 v20, v20, -0x1

    invoke-static/range {v19 .. v20}, Ljava/lang/Math;->max(II)I

    move-result v19

    invoke-static/range {v18 .. v19}, Ljava/lang/Math;->min(II)I

    move-result v4

    .line 81
    .local v4, "count":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/feedback/UsersHolder;->users:Lcom/vkontakte/android/ui/PhotoStripView;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v0, v4}, Lcom/vkontakte/android/ui/PhotoStripView;->setCount(I)V

    .line 82
    const/4 v6, 0x1

    .local v6, "i":I
    :goto_0
    add-int/lit8 v18, v4, 0x1

    move/from16 v0, v18

    if-ge v6, v0, :cond_0

    .line 83
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/feedback/UsersHolder;->users:Lcom/vkontakte/android/ui/PhotoStripView;

    move-object/from16 v19, v0

    add-int/lit8 v20, v6, -0x1

    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/vkontakte/android/api/models/Notification;->feedBackUsers:Ljava/util/List;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-interface {v0, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Lcom/vkontakte/android/UserProfile;

    move-object/from16 v0, v18

    iget-object v0, v0, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    move-object/from16 v18, v0

    move-object/from16 v0, v19

    move/from16 v1, v20

    move-object/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/ui/PhotoStripView;->load(ILjava/lang/String;)V

    .line 82
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 87
    .end local v4    # "count":I
    .end local v6    # "i":I
    :cond_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/feedback/UsersHolder;->users:Lcom/vkontakte/android/ui/PhotoStripView;

    move-object/from16 v19, v0

    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/vkontakte/android/api/models/Notification;->feedBackUsers:Ljava/util/List;

    move-object/from16 v18, v0

    invoke-interface/range {v18 .. v18}, Ljava/util/List;->size()I

    move-result v18

    const/16 v20, 0x1

    move/from16 v0, v18

    move/from16 v1, v20

    if-le v0, v1, :cond_3

    const/16 v18, 0x0

    :goto_1
    move-object/from16 v0, v19

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/PhotoStripView;->setVisibility(I)V

    .line 88
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/feedback/UsersHolder;->postPhoto:Lcom/vk/imageloader/view/VKImageView;

    move-object/from16 v18, v0

    invoke-static/range {p1 .. p1}, Lcom/vkontakte/android/fragments/feedback/UsersHolder;->getPostImageURL(Lcom/vkontakte/android/api/models/Notification;)Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    .line 91
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/feedback/UsersHolder;->title:Landroid/widget/TextView;

    move-object/from16 v19, v0

    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/vkontakte/android/api/models/Notification;->type:Lcom/vkontakte/android/api/models/Notification$Type;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    iget-object v0, v0, Lcom/vkontakte/android/api/models/Notification$Type;->activity:Lcom/vkontakte/android/api/models/Notification$Activity;

    move-object/from16 v18, v0

    sget-object v20, Lcom/vkontakte/android/api/models/Notification$Activity;->MoneyTransfer:Lcom/vkontakte/android/api/models/Notification$Activity;

    move-object/from16 v0, v18

    move-object/from16 v1, v20

    if-ne v0, v1, :cond_4

    const/16 v18, 0x3

    :goto_2
    move-object/from16 v0, v19

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 93
    invoke-virtual/range {p1 .. p1}, Lcom/vkontakte/android/api/models/Notification;->getTag()Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Landroid/text/SpannableStringBuilder;

    .line 94
    .local v17, "titleText":Landroid/text/SpannableStringBuilder;
    if-nez v17, :cond_13

    .line 98
    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/vkontakte/android/api/models/Notification;->feedBackUsers:Ljava/util/List;

    move-object/from16 v18, v0

    invoke-interface/range {v18 .. v18}, Ljava/util/List;->size()I

    move-result v18

    if-lez v18, :cond_5

    new-instance v17, Landroid/text/SpannableStringBuilder;

    .end local v17    # "titleText":Landroid/text/SpannableStringBuilder;
    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/vkontakte/android/api/models/Notification;->feedBackUsers:Ljava/util/List;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    invoke-interface/range {v18 .. v19}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Lcom/vkontakte/android/UserProfile;

    move-object/from16 v0, v18

    iget-object v0, v0, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    move-object/from16 v18, v0

    invoke-direct/range {v17 .. v18}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 100
    .restart local v17    # "titleText":Landroid/text/SpannableStringBuilder;
    :goto_3
    new-instance v18, Lcom/vkontakte/android/ui/Font$TypefaceSpan;

    sget-object v19, Lcom/vkontakte/android/ui/Font;->Medium:Lcom/vkontakte/android/ui/Font;

    const v20, -0xb88b58

    invoke-direct/range {v18 .. v20}, Lcom/vkontakte/android/ui/Font$TypefaceSpan;-><init>(Lcom/vkontakte/android/ui/Font;I)V

    const/16 v19, 0x0

    invoke-virtual/range {v17 .. v17}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v20

    const/16 v21, 0x0

    invoke-virtual/range {v17 .. v21}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 102
    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/vkontakte/android/api/models/Notification;->feedBackUsers:Ljava/util/List;

    move-object/from16 v18, v0

    invoke-interface/range {v18 .. v18}, Ljava/util/List;->size()I

    move-result v18

    const/16 v19, 0x1

    move/from16 v0, v18

    move/from16 v1, v19

    if-le v0, v1, :cond_1

    .line 103
    const/16 v18, 0x20

    invoke-virtual/range {v17 .. v18}, Landroid/text/SpannableStringBuilder;->append(C)Landroid/text/SpannableStringBuilder;

    .line 104
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/fragments/feedback/UsersHolder;->getResources()Landroid/content/res/Resources;

    move-result-object v18

    const v19, 0x7f0d003a

    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/vkontakte/android/api/models/Notification;->feedBackUsers:Ljava/util/List;

    move-object/from16 v20, v0

    invoke-interface/range {v20 .. v20}, Ljava/util/List;->size()I

    move-result v20

    add-int/lit8 v20, v20, -0x1

    const/16 v21, 0x1

    move/from16 v0, v21

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v21, v0

    const/16 v22, 0x0

    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/vkontakte/android/api/models/Notification;->feedBackUsers:Ljava/util/List;

    move-object/from16 v23, v0

    invoke-interface/range {v23 .. v23}, Ljava/util/List;->size()I

    move-result v23

    add-int/lit8 v23, v23, -0x1

    invoke-static/range {v23 .. v23}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v23

    aput-object v23, v21, v22

    invoke-virtual/range {v18 .. v21}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    .line 105
    .local v12, "moreUsers":Ljava/lang/String;
    const-string/jumbo v18, "<b>"

    move-object/from16 v0, v18

    invoke-virtual {v12, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v14

    .line 106
    .local v14, "start":I
    const-string/jumbo v18, "<b>"

    const-string/jumbo v19, ""

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v12, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v12

    .line 107
    const-string/jumbo v18, "</b>"

    move-object/from16 v0, v18

    invoke-virtual {v12, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v5

    .line 108
    .local v5, "end":I
    const-string/jumbo v18, "</b>"

    const-string/jumbo v19, ""

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v12, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v12

    .line 109
    invoke-virtual/range {v17 .. v17}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v13

    .line 110
    .local v13, "offset":I
    move-object/from16 v0, v17

    invoke-virtual {v0, v12}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 111
    new-instance v18, Lcom/vkontakte/android/ui/Font$TypefaceSpan;

    sget-object v19, Lcom/vkontakte/android/ui/Font;->Medium:Lcom/vkontakte/android/ui/Font;

    invoke-direct/range {v18 .. v19}, Lcom/vkontakte/android/ui/Font$TypefaceSpan;-><init>(Lcom/vkontakte/android/ui/Font;)V

    add-int v19, v14, v13

    add-int v20, v5, v13

    const/16 v21, 0x0

    invoke-virtual/range {v17 .. v21}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 115
    .end local v5    # "end":I
    .end local v12    # "moreUsers":Ljava/lang/String;
    .end local v13    # "offset":I
    .end local v14    # "start":I
    :cond_1
    const/4 v7, 0x0

    .local v7, "index1":I
    const/4 v9, 0x0

    .line 116
    .local v9, "index3":I
    sget-object v18, Lcom/vkontakte/android/fragments/feedback/UsersHolder$1;->$SwitchMap$com$vkontakte$android$api$models$Notification$Activity:[I

    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/vkontakte/android/api/models/Notification;->type:Lcom/vkontakte/android/api/models/Notification$Type;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/vkontakte/android/api/models/Notification$Type;->activity:Lcom/vkontakte/android/api/models/Notification$Activity;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lcom/vkontakte/android/api/models/Notification$Activity;->ordinal()I

    move-result v19

    aget v18, v18, v19

    packed-switch v18, :pswitch_data_0

    .line 140
    :goto_4
    const/4 v10, 0x0

    .line 141
    .local v10, "isFemale":Z
    const/4 v11, 0x0

    .line 142
    .local v11, "isGroup":Z
    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/vkontakte/android/api/models/Notification;->feedBackUsers:Ljava/util/List;

    move-object/from16 v18, v0

    invoke-interface/range {v18 .. v18}, Ljava/util/List;->size()I

    move-result v18

    const/16 v19, 0x1

    move/from16 v0, v18

    move/from16 v1, v19

    if-ne v0, v1, :cond_9

    .line 143
    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/vkontakte/android/api/models/Notification;->feedBackUsers:Ljava/util/List;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    invoke-interface/range {v18 .. v19}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Lcom/vkontakte/android/UserProfile;

    move-object/from16 v0, v18

    iget-boolean v0, v0, Lcom/vkontakte/android/UserProfile;->f:Z

    move/from16 v18, v0

    if-eqz v18, :cond_7

    const/4 v8, 0x1

    .line 144
    .local v8, "index2":I
    :goto_5
    const/16 v18, 0x1

    move/from16 v0, v18

    if-ne v8, v0, :cond_8

    const/4 v10, 0x1

    .line 145
    :goto_6
    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/vkontakte/android/api/models/Notification;->feedBackUsers:Ljava/util/List;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    invoke-interface/range {v18 .. v19}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Lcom/vkontakte/android/UserProfile;

    invoke-virtual/range {v18 .. v18}, Lcom/vkontakte/android/UserProfile;->getIsGroup()Z

    move-result v11

    .line 150
    :goto_7
    sget-object v18, Lcom/vkontakte/android/fragments/feedback/UsersHolder$1;->$SwitchMap$com$vkontakte$android$api$models$Notification$ParentType:[I

    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/vkontakte/android/api/models/Notification;->type:Lcom/vkontakte/android/api/models/Notification$Type;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/vkontakte/android/api/models/Notification$Type;->parentType:Lcom/vkontakte/android/api/models/Notification$ParentType;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lcom/vkontakte/android/api/models/Notification$ParentType;->ordinal()I

    move-result v19

    aget v18, v18, v19

    packed-switch v18, :pswitch_data_1

    .line 165
    :goto_8
    const/16 v18, 0x20

    invoke-virtual/range {v17 .. v18}, Landroid/text/SpannableStringBuilder;->append(C)Landroid/text/SpannableStringBuilder;

    .line 167
    if-ltz v7, :cond_a

    .line 168
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/feedback/UsersHolder;->mActions:[[[Ljava/lang/String;

    move-object/from16 v18, v0

    aget-object v18, v18, v7

    aget-object v18, v18, v8

    aget-object v18, v18, v9

    invoke-virtual/range {v17 .. v18}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 214
    :goto_9
    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/vkontakte/android/api/models/Notification;->link:Ljava/lang/CharSequence;

    move-object/from16 v18, v0

    if-eqz v18, :cond_2

    .line 215
    const/16 v18, 0x20

    invoke-virtual/range {v17 .. v18}, Landroid/text/SpannableStringBuilder;->append(C)Landroid/text/SpannableStringBuilder;

    .line 216
    invoke-virtual/range {v17 .. v17}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v14

    .line 217
    .restart local v14    # "start":I
    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/vkontakte/android/api/models/Notification;->link:Ljava/lang/CharSequence;

    move-object/from16 v18, v0

    invoke-virtual/range {v17 .. v18}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 218
    new-instance v18, Landroid/text/style/ForegroundColorSpan;

    const v19, -0xb88b58

    invoke-direct/range {v18 .. v19}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    invoke-virtual/range {v17 .. v17}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v19

    const/16 v20, 0x21

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    move/from16 v2, v19

    move/from16 v3, v20

    invoke-virtual {v0, v1, v14, v2, v3}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 221
    .end local v14    # "start":I
    :cond_2
    move-object/from16 v0, p1

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/models/Notification;->setTag(Ljava/lang/Object;)V

    .line 242
    .end local v7    # "index1":I
    .end local v8    # "index2":I
    .end local v9    # "index3":I
    .end local v10    # "isFemale":Z
    .end local v11    # "isGroup":Z
    :goto_a
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/feedback/UsersHolder;->title:Landroid/widget/TextView;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 243
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/feedback/UsersHolder;->subtitle:Landroid/widget/TextView;

    move-object/from16 v18, v0

    move-object/from16 v0, p1

    iget v0, v0, Lcom/vkontakte/android/api/models/Notification;->date:I

    move/from16 v19, v0

    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/fragments/feedback/UsersHolder;->getResources()Landroid/content/res/Resources;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Lcom/vkontakte/android/TimeUtils;->langDateRelative(ILandroid/content/res/Resources;)Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 244
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/feedback/UsersHolder;->postPhoto:Lcom/vk/imageloader/view/VKImageView;

    move-object/from16 v19, v0

    invoke-static/range {p1 .. p1}, Lcom/vkontakte/android/fragments/feedback/UsersHolder;->getPostImageURL(Lcom/vkontakte/android/api/models/Notification;)Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v18 .. v18}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v18

    if-eqz v18, :cond_15

    const/16 v18, 0x8

    :goto_b
    move-object/from16 v0, v19

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/vk/imageloader/view/VKImageView;->setVisibility(I)V

    .line 245
    return-void

    .line 87
    .end local v17    # "titleText":Landroid/text/SpannableStringBuilder;
    :cond_3
    const/16 v18, 0x8

    goto/16 :goto_1

    .line 91
    :cond_4
    const/16 v18, 0x2

    goto/16 :goto_2

    .line 98
    .restart local v17    # "titleText":Landroid/text/SpannableStringBuilder;
    :cond_5
    new-instance v17, Landroid/text/SpannableStringBuilder;

    .end local v17    # "titleText":Landroid/text/SpannableStringBuilder;
    invoke-direct/range {v17 .. v17}, Landroid/text/SpannableStringBuilder;-><init>()V

    goto/16 :goto_3

    .line 118
    .restart local v7    # "index1":I
    .restart local v9    # "index3":I
    .restart local v17    # "titleText":Landroid/text/SpannableStringBuilder;
    :pswitch_0
    const/4 v7, 0x0

    .line 119
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/feedback/UsersHolder;->action:Landroid/widget/ImageView;

    move-object/from16 v18, v0

    const v19, 0x7f0201b0

    invoke-virtual/range {v18 .. v19}, Landroid/widget/ImageView;->setImageResource(I)V

    goto/16 :goto_4

    .line 122
    :pswitch_1
    const/4 v7, 0x1

    .line 123
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/feedback/UsersHolder;->action:Landroid/widget/ImageView;

    move-object/from16 v18, v0

    const v19, 0x7f0201b3

    invoke-virtual/range {v18 .. v19}, Landroid/widget/ImageView;->setImageResource(I)V

    goto/16 :goto_4

    .line 126
    :pswitch_2
    const/4 v7, 0x2

    .line 127
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/feedback/UsersHolder;->action:Landroid/widget/ImageView;

    move-object/from16 v18, v0

    const v19, 0x7f0201ae

    invoke-virtual/range {v18 .. v19}, Landroid/widget/ImageView;->setImageResource(I)V

    goto/16 :goto_4

    .line 130
    :pswitch_3
    const/4 v7, 0x3

    .line 131
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/feedback/UsersHolder;->action:Landroid/widget/ImageView;

    move-object/from16 v18, v0

    const v19, 0x7f0201af

    invoke-virtual/range {v18 .. v19}, Landroid/widget/ImageView;->setImageResource(I)V

    goto/16 :goto_4

    .line 134
    :pswitch_4
    const/4 v7, -0x1

    .line 135
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/feedback/UsersHolder;->action:Landroid/widget/ImageView;

    move-object/from16 v19, v0

    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/vkontakte/android/api/models/Notification;->moneyTransfer:Lcom/vkontakte/android/MoneyTransfer;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    iget v0, v0, Lcom/vkontakte/android/MoneyTransfer;->status:I

    move/from16 v18, v0

    const/16 v20, 0x2

    move/from16 v0, v18

    move/from16 v1, v20

    if-ne v0, v1, :cond_6

    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/vkontakte/android/api/models/Notification;->moneyTransfer:Lcom/vkontakte/android/MoneyTransfer;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/vkontakte/android/MoneyTransfer;->isIncoming()Z

    move-result v18

    if-nez v18, :cond_6

    const v18, 0x7f0201b2

    :goto_c
    move-object/from16 v0, v19

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    goto/16 :goto_4

    :cond_6
    const v18, 0x7f0201b1

    goto :goto_c

    .line 143
    .restart local v10    # "isFemale":Z
    .restart local v11    # "isGroup":Z
    :cond_7
    const/4 v8, 0x0

    goto/16 :goto_5

    .line 144
    .restart local v8    # "index2":I
    :cond_8
    const/4 v10, 0x0

    goto/16 :goto_6

    .line 147
    .end local v8    # "index2":I
    :cond_9
    const/4 v8, 0x2

    .restart local v8    # "index2":I
    goto/16 :goto_7

    .line 152
    :pswitch_5
    const/4 v9, 0x0

    .line 153
    goto/16 :goto_8

    .line 155
    :pswitch_6
    const/4 v9, 0x1

    .line 156
    goto/16 :goto_8

    .line 158
    :pswitch_7
    const/4 v9, 0x2

    .line 159
    goto/16 :goto_8

    .line 161
    :pswitch_8
    const/4 v9, 0x3

    goto/16 :goto_8

    .line 172
    :cond_a
    const/16 v16, 0x0

    .line 173
    .local v16, "strId":I
    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/vkontakte/android/api/models/Notification;->moneyTransfer:Lcom/vkontakte/android/MoneyTransfer;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/vkontakte/android/MoneyTransfer;->isIncoming()Z

    move-result v18

    if-eqz v18, :cond_d

    .line 174
    if-eqz v11, :cond_b

    .line 175
    const v16, 0x7f080377

    .line 209
    :goto_d
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/fragments/feedback/UsersHolder;->getResources()Landroid/content/res/Resources;

    move-result-object v18

    const/16 v19, 0x1

    move/from16 v0, v19

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/vkontakte/android/api/models/Notification;->moneyTransfer:Lcom/vkontakte/android/MoneyTransfer;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Lcom/vkontakte/android/MoneyTransfer;->getAmountWithCurrencyFormatted()Ljava/lang/String;

    move-result-object v21

    aput-object v21, v19, v20

    move-object/from16 v0, v18

    move/from16 v1, v16

    move-object/from16 v2, v19

    invoke-virtual {v0, v1, v2}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v15

    .line 211
    .local v15, "str":Ljava/lang/String;
    move-object/from16 v0, v17

    invoke-virtual {v0, v15}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    goto/16 :goto_9

    .line 177
    .end local v15    # "str":Ljava/lang/String;
    :cond_b
    if-eqz v10, :cond_c

    .line 178
    const v16, 0x7f080375

    goto :goto_d

    .line 181
    :cond_c
    const v16, 0x7f080376

    goto :goto_d

    .line 185
    :cond_d
    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/vkontakte/android/api/models/Notification;->moneyTransfer:Lcom/vkontakte/android/MoneyTransfer;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    iget v0, v0, Lcom/vkontakte/android/MoneyTransfer;->status:I

    move/from16 v18, v0

    const/16 v19, 0x2

    move/from16 v0, v18

    move/from16 v1, v19

    if-ne v0, v1, :cond_10

    .line 186
    if-eqz v11, :cond_e

    .line 187
    const v16, 0x7f080374

    goto :goto_d

    .line 189
    :cond_e
    if-eqz v10, :cond_f

    .line 190
    const v16, 0x7f080372

    goto :goto_d

    .line 193
    :cond_f
    const v16, 0x7f080373

    goto :goto_d

    .line 197
    :cond_10
    if-eqz v11, :cond_11

    .line 198
    const v16, 0x7f080371

    goto :goto_d

    .line 200
    :cond_11
    if-eqz v10, :cond_12

    .line 201
    const v16, 0x7f08036f

    goto :goto_d

    .line 204
    :cond_12
    const v16, 0x7f080370

    goto :goto_d

    .line 223
    .end local v7    # "index1":I
    .end local v8    # "index2":I
    .end local v9    # "index3":I
    .end local v10    # "isFemale":Z
    .end local v11    # "isGroup":Z
    .end local v16    # "strId":I
    :cond_13
    sget-object v18, Lcom/vkontakte/android/fragments/feedback/UsersHolder$1;->$SwitchMap$com$vkontakte$android$api$models$Notification$Activity:[I

    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/vkontakte/android/api/models/Notification;->type:Lcom/vkontakte/android/api/models/Notification$Type;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/vkontakte/android/api/models/Notification$Type;->activity:Lcom/vkontakte/android/api/models/Notification$Activity;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lcom/vkontakte/android/api/models/Notification$Activity;->ordinal()I

    move-result v19

    aget v18, v18, v19

    packed-switch v18, :pswitch_data_2

    goto/16 :goto_a

    .line 225
    :pswitch_9
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/feedback/UsersHolder;->action:Landroid/widget/ImageView;

    move-object/from16 v18, v0

    const v19, 0x7f0201b0

    invoke-virtual/range {v18 .. v19}, Landroid/widget/ImageView;->setImageResource(I)V

    goto/16 :goto_a

    .line 228
    :pswitch_a
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/feedback/UsersHolder;->action:Landroid/widget/ImageView;

    move-object/from16 v18, v0

    const v19, 0x7f0201b3

    invoke-virtual/range {v18 .. v19}, Landroid/widget/ImageView;->setImageResource(I)V

    goto/16 :goto_a

    .line 231
    :pswitch_b
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/feedback/UsersHolder;->action:Landroid/widget/ImageView;

    move-object/from16 v18, v0

    const v19, 0x7f0201ae

    invoke-virtual/range {v18 .. v19}, Landroid/widget/ImageView;->setImageResource(I)V

    goto/16 :goto_a

    .line 234
    :pswitch_c
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/feedback/UsersHolder;->action:Landroid/widget/ImageView;

    move-object/from16 v18, v0

    const v19, 0x7f0201af

    invoke-virtual/range {v18 .. v19}, Landroid/widget/ImageView;->setImageResource(I)V

    goto/16 :goto_a

    .line 237
    :pswitch_d
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/feedback/UsersHolder;->action:Landroid/widget/ImageView;

    move-object/from16 v19, v0

    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/vkontakte/android/api/models/Notification;->moneyTransfer:Lcom/vkontakte/android/MoneyTransfer;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    iget v0, v0, Lcom/vkontakte/android/MoneyTransfer;->status:I

    move/from16 v18, v0

    const/16 v20, 0x2

    move/from16 v0, v18

    move/from16 v1, v20

    if-ne v0, v1, :cond_14

    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/vkontakte/android/api/models/Notification;->moneyTransfer:Lcom/vkontakte/android/MoneyTransfer;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/vkontakte/android/MoneyTransfer;->isIncoming()Z

    move-result v18

    if-nez v18, :cond_14

    const v18, 0x7f0201b2

    :goto_e
    move-object/from16 v0, v19

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    goto/16 :goto_a

    :cond_14
    const v18, 0x7f0201b1

    goto :goto_e

    .line 244
    :cond_15
    const/16 v18, 0x0

    goto/16 :goto_b

    .line 116
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch

    .line 150
    :pswitch_data_1
    .packed-switch 0x1
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_8
    .end packed-switch

    .line 223
    :pswitch_data_2
    .packed-switch 0x1
        :pswitch_9
        :pswitch_a
        :pswitch_b
        :pswitch_c
        :pswitch_d
    .end packed-switch
.end method

.method public bridge synthetic onBind(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 35
    check-cast p1, Lcom/vkontakte/android/api/models/Notification;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/feedback/UsersHolder;->onBind(Lcom/vkontakte/android/api/models/Notification;)V

    return-void
.end method

.method public onClick()V
    .locals 3

    .prologue
    .line 314
    iget-object v0, p0, Lcom/vkontakte/android/fragments/feedback/UsersHolder;->mNewsAction:Lcom/vkontakte/android/functions/VoidF1Int;

    if-eqz v0, :cond_0

    .line 315
    iget-object v0, p0, Lcom/vkontakte/android/fragments/feedback/UsersHolder;->mNewsAction:Lcom/vkontakte/android/functions/VoidF1Int;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/feedback/UsersHolder;->getItem()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/feedback/UsersHolder;->getAdapterPosition()I

    move-result v2

    invoke-interface {v0, v1, v2}, Lcom/vkontakte/android/functions/VoidF1Int;->f(Ljava/lang/Object;I)V

    .line 317
    :cond_0
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 292
    iget-object v0, p0, Lcom/vkontakte/android/fragments/feedback/UsersHolder;->photo:Lcom/vk/imageloader/view/VKImageView;

    if-ne p1, v0, :cond_1

    .line 293
    iget-object v0, p0, Lcom/vkontakte/android/fragments/feedback/UsersHolder;->mUserAction:Lcom/vkontakte/android/functions/VoidF1;

    if-eqz v0, :cond_0

    .line 294
    iget-object v1, p0, Lcom/vkontakte/android/fragments/feedback/UsersHolder;->mUserAction:Lcom/vkontakte/android/functions/VoidF1;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/feedback/UsersHolder;->getItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/api/models/Notification;

    iget-object v0, v0, Lcom/vkontakte/android/api/models/Notification;->feedBackUsers:Ljava/util/List;

    const/4 v2, 0x0

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    invoke-interface {v1, v0}, Lcom/vkontakte/android/functions/VoidF1;->f(Ljava/lang/Object;)V

    .line 301
    :cond_0
    :goto_0
    return-void

    .line 297
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/fragments/feedback/UsersHolder;->mNewsAction:Lcom/vkontakte/android/functions/VoidF1Int;

    if-eqz v0, :cond_0

    .line 298
    iget-object v0, p0, Lcom/vkontakte/android/fragments/feedback/UsersHolder;->mNewsAction:Lcom/vkontakte/android/functions/VoidF1Int;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/feedback/UsersHolder;->getItem()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/feedback/UsersHolder;->getAdapterPosition()I

    move-result v2

    invoke-interface {v0, v1, v2}, Lcom/vkontakte/android/functions/VoidF1Int;->f(Ljava/lang/Object;I)V

    goto :goto_0
.end method

.method public onPhotoClick(Lcom/vkontakte/android/ui/PhotoStripView;I)V
    .locals 2
    .param p1, "view"    # Lcom/vkontakte/android/ui/PhotoStripView;
    .param p2, "index"    # I

    .prologue
    .line 305
    iget-object v0, p0, Lcom/vkontakte/android/fragments/feedback/UsersHolder;->users:Lcom/vkontakte/android/ui/PhotoStripView;

    if-ne p1, v0, :cond_0

    .line 306
    iget-object v0, p0, Lcom/vkontakte/android/fragments/feedback/UsersHolder;->mUserAction:Lcom/vkontakte/android/functions/VoidF1;

    if-eqz v0, :cond_0

    .line 307
    iget-object v1, p0, Lcom/vkontakte/android/fragments/feedback/UsersHolder;->mUserAction:Lcom/vkontakte/android/functions/VoidF1;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/feedback/UsersHolder;->getItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/api/models/Notification;

    iget-object v0, v0, Lcom/vkontakte/android/api/models/Notification;->feedBackUsers:Ljava/util/List;

    add-int/lit8 p2, p2, 0x1

    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    invoke-interface {v1, v0}, Lcom/vkontakte/android/functions/VoidF1;->f(Ljava/lang/Object;)V

    .line 310
    :cond_0
    return-void
.end method
