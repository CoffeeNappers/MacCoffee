.class public Lcom/vkontakte/android/attachments/SnippetAttachment;
.super Lcom/vkontakte/android/attachments/Attachment;
.source "SnippetAttachment.java"

# interfaces
.implements Lcom/vkontakte/android/attachments/ImageAttachment;
.implements Landroid/view/View$OnClickListener;


# static fields
.field public static final CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/utils/Serializer$Creator",
            "<",
            "Lcom/vkontakte/android/attachments/SnippetAttachment;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private button:Ljava/lang/String;

.field private buttonAction:Lcom/vkontakte/android/api/ButtonAction;

.field private buttonLink:Ljava/lang/String;

.field public forceSmall:Z

.field private isBig:Z

.field private isProduct:Z

.field private lastPhotoWidth:I

.field public link:Ljava/lang/String;

.field public photo:Lcom/vkontakte/android/Photo;

.field private transient postInteract:Lcom/vkontakte/android/data/PostInteract;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public previewPage:Ljava/lang/String;

.field private rating:F

.field public referWiki:Ljava/lang/String;

.field private reviewCount:I

.field private subsubtitle:Ljava/lang/String;

.field private subtitle:Ljava/lang/String;

.field public target:Ljava/lang/String;

.field public title:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 251
    new-instance v0, Lcom/vkontakte/android/attachments/SnippetAttachment$1;

    invoke-direct {v0}, Lcom/vkontakte/android/attachments/SnippetAttachment$1;-><init>()V

    sput-object v0, Lcom/vkontakte/android/attachments/SnippetAttachment;->CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/vkontakte/android/Photo;ZLjava/lang/String;Ljava/lang/String;FILjava/lang/String;Lcom/vkontakte/android/api/ButtonAction;)V
    .locals 1
    .param p1, "title"    # Ljava/lang/String;
    .param p2, "subtitle"    # Ljava/lang/String;
    .param p3, "subsubtitle"    # Ljava/lang/String;
    .param p4, "link"    # Ljava/lang/String;
    .param p5, "target"    # Ljava/lang/String;
    .param p6, "photo"    # Lcom/vkontakte/android/Photo;
    .param p7, "isProduct"    # Z
    .param p8, "button"    # Ljava/lang/String;
    .param p9, "buttonLink"    # Ljava/lang/String;
    .param p10, "rating"    # F
    .param p11, "reviewCount"    # I
    .param p12, "previewPage"    # Ljava/lang/String;
    .param p13, "buttonAction"    # Lcom/vkontakte/android/api/ButtonAction;

    .prologue
    .line 64
    invoke-direct {p0}, Lcom/vkontakte/android/attachments/Attachment;-><init>()V

    .line 51
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/attachments/SnippetAttachment;->forceSmall:Z

    .line 65
    iput-object p1, p0, Lcom/vkontakte/android/attachments/SnippetAttachment;->title:Ljava/lang/String;

    .line 66
    iput-object p2, p0, Lcom/vkontakte/android/attachments/SnippetAttachment;->subtitle:Ljava/lang/String;

    .line 67
    iput-object p3, p0, Lcom/vkontakte/android/attachments/SnippetAttachment;->subsubtitle:Ljava/lang/String;

    .line 68
    iput-object p6, p0, Lcom/vkontakte/android/attachments/SnippetAttachment;->photo:Lcom/vkontakte/android/Photo;

    .line 69
    iput-object p4, p0, Lcom/vkontakte/android/attachments/SnippetAttachment;->link:Ljava/lang/String;

    .line 70
    iput-object p5, p0, Lcom/vkontakte/android/attachments/SnippetAttachment;->target:Ljava/lang/String;

    .line 71
    iput-boolean p7, p0, Lcom/vkontakte/android/attachments/SnippetAttachment;->isProduct:Z

    .line 72
    iput-object p8, p0, Lcom/vkontakte/android/attachments/SnippetAttachment;->button:Ljava/lang/String;

    .line 73
    iput-object p9, p0, Lcom/vkontakte/android/attachments/SnippetAttachment;->buttonLink:Ljava/lang/String;

    .line 74
    iput p10, p0, Lcom/vkontakte/android/attachments/SnippetAttachment;->rating:F

    .line 75
    iput p11, p0, Lcom/vkontakte/android/attachments/SnippetAttachment;->reviewCount:I

    .line 76
    iput-object p12, p0, Lcom/vkontakte/android/attachments/SnippetAttachment;->previewPage:Ljava/lang/String;

    .line 77
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 78
    invoke-static {p4}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/attachments/SnippetAttachment;->subsubtitle:Ljava/lang/String;

    .line 80
    :cond_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 81
    iput-object p4, p0, Lcom/vkontakte/android/attachments/SnippetAttachment;->title:Ljava/lang/String;

    .line 83
    :cond_1
    if-eqz p13, :cond_2

    invoke-virtual {p13}, Lcom/vkontakte/android/api/ButtonAction;->isValidAction()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 84
    iput-object p13, p0, Lcom/vkontakte/android/attachments/SnippetAttachment;->buttonAction:Lcom/vkontakte/android/api/ButtonAction;

    .line 86
    :cond_2
    return-void
.end method

.method private removeRelLayoutRules(Landroid/widget/RelativeLayout$LayoutParams;I)Landroid/widget/RelativeLayout$LayoutParams;
    .locals 5
    .param p1, "params"    # Landroid/widget/RelativeLayout$LayoutParams;
    .param p2, "ruleToRemove"    # I

    .prologue
    .line 94
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x11

    if-lt v3, v4, :cond_0

    .line 95
    invoke-virtual {p1, p2}, Landroid/widget/RelativeLayout$LayoutParams;->removeRule(I)V

    .line 109
    .end local p1    # "params":Landroid/widget/RelativeLayout$LayoutParams;
    :goto_0
    return-object p1

    .line 98
    .restart local p1    # "params":Landroid/widget/RelativeLayout$LayoutParams;
    :cond_0
    invoke-virtual {p1}, Landroid/widget/RelativeLayout$LayoutParams;->getRules()[I

    move-result-object v2

    .line 99
    .local v2, "rules":[I
    new-instance v1, Landroid/widget/RelativeLayout$LayoutParams;

    iget v3, p1, Landroid/widget/RelativeLayout$LayoutParams;->width:I

    iget v4, p1, Landroid/widget/RelativeLayout$LayoutParams;->height:I

    invoke-direct {v1, v3, v4}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 100
    .local v1, "res":Landroid/widget/RelativeLayout$LayoutParams;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v3, v2

    if-ge v0, v3, :cond_3

    .line 101
    aget v3, v2, v0

    if-nez v3, :cond_2

    .line 100
    :cond_1
    :goto_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 104
    :cond_2
    if-eq p2, v0, :cond_1

    .line 107
    aget v3, v2, v0

    invoke-virtual {v1, v0, v3}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    goto :goto_2

    :cond_3
    move-object p1, v1

    .line 109
    goto :goto_0
.end method


# virtual methods
.method public bind(Landroid/view/View;)V
    .locals 3
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 284
    const v1, 0x7f1001e4

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/imageloader/view/VKSnippetImageView;

    .line 285
    .local v0, "imageView":Lcom/vk/imageloader/view/VKSnippetImageView;
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f010013

    invoke-static {v1, v2}, Lcom/vkontakte/android/ViewUtils;->getBoolFromTheme(Landroid/content/Context;I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 286
    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Lcom/vk/imageloader/view/VKSnippetImageView;->setType(I)V

    .line 288
    const v1, 0x7f02006b

    invoke-virtual {v0, v1}, Lcom/vk/imageloader/view/VKSnippetImageView;->setPlaceholderImage(I)V

    .line 293
    :goto_0
    invoke-virtual {p0}, Lcom/vkontakte/android/attachments/SnippetAttachment;->getImageURL()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/imageloader/view/VKSnippetImageView;->load(Ljava/lang/String;)V

    .line 294
    return-void

    .line 290
    :cond_0
    iget-boolean v1, p0, Lcom/vkontakte/android/attachments/SnippetAttachment;->isBig:Z

    if-eqz v1, :cond_1

    const/4 v1, 0x1

    :goto_1
    invoke-virtual {v0, v1}, Lcom/vk/imageloader/view/VKSnippetImageView;->setType(I)V

    .line 291
    iget-boolean v1, p0, Lcom/vkontakte/android/attachments/SnippetAttachment;->isBig:Z

    if-eqz v1, :cond_2

    const v1, 0x7f020393

    :goto_2
    invoke-virtual {v0, v1}, Lcom/vk/imageloader/view/VKSnippetImageView;->setPlaceholderImage(I)V

    goto :goto_0

    .line 290
    :cond_1
    const/4 v1, 0x0

    goto :goto_1

    .line 291
    :cond_2
    const v1, 0x7f020394

    goto :goto_2
.end method

.method public getFullView(Landroid/content/Context;)Landroid/view/View;
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 90
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/vkontakte/android/attachments/SnippetAttachment;->getViewForList(Landroid/content/Context;Landroid/view/View;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public getImageURL()Ljava/lang/String;
    .locals 7

    .prologue
    .line 267
    iget-object v4, p0, Lcom/vkontakte/android/attachments/SnippetAttachment;->photo:Lcom/vkontakte/android/Photo;

    iget-object v4, v4, Lcom/vkontakte/android/Photo;->sizes:Ljava/util/ArrayList;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/Photo$Image;

    .line 268
    .local v0, "closest":Lcom/vkontakte/android/Photo$Image;
    const v1, 0x7fffffff

    .line 269
    .local v1, "closestDiff":I
    iget-object v4, p0, Lcom/vkontakte/android/attachments/SnippetAttachment;->photo:Lcom/vkontakte/android/Photo;

    iget-object v4, v4, Lcom/vkontakte/android/Photo;->sizes:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_0
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/vkontakte/android/Photo$Image;

    .line 270
    .local v3, "img":Lcom/vkontakte/android/Photo$Image;
    iget v5, v3, Lcom/vkontakte/android/Photo$Image;->width:I

    const/16 v6, 0x25c

    if-gt v5, v6, :cond_0

    .line 273
    iget v5, p0, Lcom/vkontakte/android/attachments/SnippetAttachment;->lastPhotoWidth:I

    iget v6, v3, Lcom/vkontakte/android/Photo$Image;->width:I

    sub-int/2addr v5, v6

    invoke-static {v5}, Ljava/lang/Math;->abs(I)I

    move-result v2

    .line 274
    .local v2, "diff":I
    if-ge v2, v1, :cond_0

    .line 275
    move v1, v2

    .line 276
    move-object v0, v3

    goto :goto_0

    .line 279
    .end local v2    # "diff":I
    .end local v3    # "img":Lcom/vkontakte/android/Photo$Image;
    :cond_1
    iget-object v4, v0, Lcom/vkontakte/android/Photo$Image;->url:Ljava/lang/String;

    return-object v4
.end method

.method public getViewForList(Landroid/content/Context;Landroid/view/View;)Landroid/view/View;
    .locals 14
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "reuse"    # Landroid/view/View;

    .prologue
    .line 115
    const v10, 0x7f010013

    invoke-static {p1, v10}, Lcom/vkontakte/android/ViewUtils;->getBoolFromTheme(Landroid/content/Context;I)Z

    move-result v4

    .line 116
    .local v4, "isMessagesSnippet":Z
    if-nez v4, :cond_4

    iget-boolean v10, p0, Lcom/vkontakte/android/attachments/SnippetAttachment;->forceSmall:Z

    if-nez v10, :cond_4

    iget-object v10, p0, Lcom/vkontakte/android/attachments/SnippetAttachment;->photo:Lcom/vkontakte/android/Photo;

    const/16 v11, 0x6c

    const/16 v12, 0x78

    invoke-virtual {v10, v11, v12}, Lcom/vkontakte/android/Photo;->getImage(CC)Lcom/vkontakte/android/Photo$Image;

    move-result-object v10

    if-eqz v10, :cond_4

    iget-object v10, p0, Lcom/vkontakte/android/attachments/SnippetAttachment;->photo:Lcom/vkontakte/android/Photo;

    const/16 v11, 0x6c

    const/16 v12, 0x78

    invoke-virtual {v10, v11, v12}, Lcom/vkontakte/android/Photo;->getImage(CC)Lcom/vkontakte/android/Photo$Image;

    move-result-object v10

    iget v10, v10, Lcom/vkontakte/android/Photo$Image;->width:I

    const/16 v11, 0x219

    if-lt v10, v11, :cond_4

    iget-object v10, p0, Lcom/vkontakte/android/attachments/SnippetAttachment;->photo:Lcom/vkontakte/android/Photo;

    const/16 v11, 0x6c

    const/16 v12, 0x78

    invoke-virtual {v10, v11, v12}, Lcom/vkontakte/android/Photo;->getImage(CC)Lcom/vkontakte/android/Photo$Image;

    move-result-object v10

    iget v10, v10, Lcom/vkontakte/android/Photo$Image;->height:I

    const/16 v11, 0xf0

    if-lt v10, v11, :cond_4

    .line 117
    const/4 v10, 0x1

    iput-boolean v10, p0, Lcom/vkontakte/android/attachments/SnippetAttachment;->isBig:Z

    .line 118
    const v10, 0x7f030053

    const/4 v11, 0x0

    invoke-static {p1, v10, v11}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v9

    .line 119
    .local v9, "v":Landroid/view/View;
    new-instance v7, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;

    invoke-direct {v7}, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;-><init>()V

    .line 120
    .local v7, "lp":Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;
    iget-object v10, p0, Lcom/vkontakte/android/attachments/SnippetAttachment;->photo:Lcom/vkontakte/android/Photo;

    const/16 v11, 0x6c

    const/16 v12, 0x78

    invoke-virtual {v10, v11, v12}, Lcom/vkontakte/android/Photo;->getImage(CC)Lcom/vkontakte/android/Photo$Image;

    move-result-object v2

    .line 121
    .local v2, "img":Lcom/vkontakte/android/Photo$Image;
    invoke-static {}, Lcom/vkontakte/android/NewsEntry;->getMaxThumbsWidth()I

    move-result v10

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    const v12, 0x7f090028

    invoke-virtual {v11, v12}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v11

    mul-int/lit8 v11, v11, 0x2

    sub-int/2addr v10, v11

    iput v10, v7, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;->width:I

    .line 122
    iget v10, v7, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;->width:I

    const/high16 v11, 0x41000000    # 8.0f

    invoke-static {v11}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v11

    mul-int/lit8 v11, v11, 0x2

    sub-int/2addr v10, v11

    int-to-float v10, v10

    iget v11, v2, Lcom/vkontakte/android/Photo$Image;->height:I

    int-to-float v11, v11

    iget v12, v2, Lcom/vkontakte/android/Photo$Image;->width:I

    int-to-float v12, v12

    div-float/2addr v11, v12

    mul-float/2addr v10, v11

    invoke-static {v10}, Ljava/lang/Math;->round(F)I

    move-result v3

    .line 124
    .local v3, "imgScaledHeight":I
    const/4 v10, -0x2

    iput v10, v7, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;->height:I

    .line 125
    const/4 v10, 0x1

    iput-boolean v10, v7, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;->center:Z

    .line 126
    invoke-virtual {v9, v7}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 127
    const v10, 0x7f1001e4

    invoke-virtual {v9, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v10

    new-instance v11, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v12, -0x1

    invoke-direct {v11, v12, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v10, v11}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 128
    const v10, 0x7f1001dc

    invoke-virtual {v9, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/widget/TextView;

    const/4 v11, 0x2

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 129
    const v10, 0x7f1001dc

    invoke-virtual {v9, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/widget/TextView;

    invoke-virtual {v10}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    move-result-object v10

    iget-object v11, p0, Lcom/vkontakte/android/attachments/SnippetAttachment;->title:Ljava/lang/String;

    invoke-virtual {v10, v11}, Landroid/text/TextPaint;->measureText(Ljava/lang/String;)F

    move-result v8

    .line 130
    .local v8, "tw":F
    iget v10, v7, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;->width:I

    const/high16 v11, 0x41400000    # 12.0f

    invoke-static {v11}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v11

    mul-int/lit8 v11, v11, 0x2

    sub-int/2addr v10, v11

    int-to-float v10, v10

    cmpl-float v10, v8, v10

    if-lez v10, :cond_1

    iget-boolean v10, p0, Lcom/vkontakte/android/attachments/SnippetAttachment;->isProduct:Z

    if-nez v10, :cond_1

    .line 131
    const v10, 0x7f1001dd

    invoke-virtual {v9, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v10

    const/16 v11, 0x8

    invoke-virtual {v10, v11}, Landroid/view/View;->setVisibility(I)V

    .line 135
    :goto_0
    iget v10, v7, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;->width:I

    const/high16 v11, 0x41000000    # 8.0f

    invoke-static {v11}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v11

    mul-int/lit8 v11, v11, 0x2

    sub-int/2addr v10, v11

    iput v10, p0, Lcom/vkontakte/android/attachments/SnippetAttachment;->lastPhotoWidth:I

    .line 136
    iget-object v10, p0, Lcom/vkontakte/android/attachments/SnippetAttachment;->button:Ljava/lang/String;

    invoke-static {v10}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v10

    if-nez v10, :cond_0

    .line 137
    const v10, 0x7f1001e7

    invoke-virtual {v9, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 138
    .local v0, "btn":Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    check-cast v5, Landroid/widget/RelativeLayout$LayoutParams;

    .line 139
    .local v5, "l":Landroid/widget/RelativeLayout$LayoutParams;
    const v10, 0x7f1001dc

    invoke-virtual {v9, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v10

    invoke-virtual {v10}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v6

    check-cast v6, Landroid/widget/RelativeLayout$LayoutParams;

    .line 140
    .local v6, "l2":Landroid/widget/RelativeLayout$LayoutParams;
    iget-boolean v10, p0, Lcom/vkontakte/android/attachments/SnippetAttachment;->isProduct:Z

    if-eqz v10, :cond_3

    .line 141
    const/16 v10, 0xf

    invoke-direct {p0, v5, v10}, Lcom/vkontakte/android/attachments/SnippetAttachment;->removeRelLayoutRules(Landroid/widget/RelativeLayout$LayoutParams;I)Landroid/widget/RelativeLayout$LayoutParams;

    move-result-object v5

    .line 142
    const/16 v10, 0x8

    const v11, 0x7f1001e6

    invoke-virtual {v5, v10, v11}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 143
    const/4 v10, 0x0

    invoke-direct {p0, v6, v10}, Lcom/vkontakte/android/attachments/SnippetAttachment;->removeRelLayoutRules(Landroid/widget/RelativeLayout$LayoutParams;I)Landroid/widget/RelativeLayout$LayoutParams;

    move-result-object v6

    .line 149
    :goto_1
    invoke-virtual {v0, v5}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 150
    const v10, 0x7f1001dc

    invoke-virtual {v9, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v10

    invoke-virtual {v10, v6}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 175
    .end local v0    # "btn":Landroid/view/View;
    .end local v2    # "img":Lcom/vkontakte/android/Photo$Image;
    .end local v3    # "imgScaledHeight":I
    .end local v5    # "l":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v6    # "l2":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v8    # "tw":F
    :cond_0
    :goto_2
    const v10, 0x7f1001dc

    invoke-virtual {v9, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/widget/TextView;

    iget-object v11, p0, Lcom/vkontakte/android/attachments/SnippetAttachment;->title:Ljava/lang/String;

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 176
    const v10, 0x7f1001dd

    invoke-virtual {v9, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/widget/TextView;

    iget-object v11, p0, Lcom/vkontakte/android/attachments/SnippetAttachment;->subtitle:Ljava/lang/String;

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 177
    const v10, 0x7f1001e6

    invoke-virtual {v9, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/widget/TextView;

    iget-object v11, p0, Lcom/vkontakte/android/attachments/SnippetAttachment;->subsubtitle:Ljava/lang/String;

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 178
    iget-object v10, p0, Lcom/vkontakte/android/attachments/SnippetAttachment;->button:Ljava/lang/String;

    invoke-static {v10}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v10

    if-eqz v10, :cond_a

    .line 179
    const v10, 0x7f1001e7

    invoke-virtual {v9, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v10

    const/16 v11, 0x8

    invoke-virtual {v10, v11}, Landroid/view/View;->setVisibility(I)V

    .line 184
    :goto_3
    invoke-virtual {v9, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 185
    const v10, 0x7f1001e7

    invoke-virtual {v9, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v10

    invoke-virtual {v10, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 186
    iget v10, p0, Lcom/vkontakte/android/attachments/SnippetAttachment;->rating:F

    const/4 v11, 0x0

    cmpl-float v10, v10, v11

    if-lez v10, :cond_b

    .line 187
    const v10, 0x7f1001fa

    invoke-virtual {v9, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v10

    const/4 v11, 0x0

    invoke-virtual {v10, v11}, Landroid/view/View;->setVisibility(I)V

    .line 188
    const v10, 0x7f1001fa

    invoke-virtual {v9, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v10

    check-cast v10, Lcom/vkontakte/android/ui/RatingView;

    iget v11, p0, Lcom/vkontakte/android/attachments/SnippetAttachment;->rating:F

    invoke-virtual {v10, v11}, Lcom/vkontakte/android/ui/RatingView;->setRating(F)V

    .line 189
    const v10, 0x7f1001fb

    invoke-virtual {v9, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v10

    const/4 v11, 0x0

    invoke-virtual {v10, v11}, Landroid/view/View;->setVisibility(I)V

    .line 190
    const v10, 0x7f1001fb

    invoke-virtual {v9, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/widget/TextView;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v12, "("

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    iget v12, p0, Lcom/vkontakte/android/attachments/SnippetAttachment;->reviewCount:I

    invoke-static {v12}, Lcom/vkontakte/android/Global;->formatBigNumber(I)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string/jumbo v12, ")"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 195
    :goto_4
    return-object v9

    .line 133
    .restart local v2    # "img":Lcom/vkontakte/android/Photo$Image;
    .restart local v3    # "imgScaledHeight":I
    .restart local v8    # "tw":F
    :cond_1
    const v10, 0x7f1001dd

    invoke-virtual {v9, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v11

    iget-object v10, p0, Lcom/vkontakte/android/attachments/SnippetAttachment;->subtitle:Ljava/lang/String;

    invoke-static {v10}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v10

    if-eqz v10, :cond_2

    const/16 v10, 0x8

    :goto_5
    invoke-virtual {v11, v10}, Landroid/view/View;->setVisibility(I)V

    goto/16 :goto_0

    :cond_2
    const/4 v10, 0x0

    goto :goto_5

    .line 145
    .restart local v0    # "btn":Landroid/view/View;
    .restart local v5    # "l":Landroid/widget/RelativeLayout$LayoutParams;
    .restart local v6    # "l2":Landroid/widget/RelativeLayout$LayoutParams;
    :cond_3
    const/16 v10, 0x8

    invoke-direct {p0, v5, v10}, Lcom/vkontakte/android/attachments/SnippetAttachment;->removeRelLayoutRules(Landroid/widget/RelativeLayout$LayoutParams;I)Landroid/widget/RelativeLayout$LayoutParams;

    move-result-object v5

    .line 146
    const/16 v10, 0xf

    invoke-virtual {v5, v10}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 147
    const/4 v10, 0x0

    const v11, 0x7f1001e7

    invoke-virtual {v6, v10, v11}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    goto/16 :goto_1

    .line 153
    .end local v0    # "btn":Landroid/view/View;
    .end local v2    # "img":Lcom/vkontakte/android/Photo$Image;
    .end local v3    # "imgScaledHeight":I
    .end local v5    # "l":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v6    # "l2":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v7    # "lp":Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;
    .end local v8    # "tw":F
    .end local v9    # "v":Landroid/view/View;
    :cond_4
    if-eqz v4, :cond_7

    const v10, 0x7f030055

    :goto_6
    const/4 v11, 0x0

    invoke-static {p1, v10, v11}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v9

    .line 155
    .restart local v9    # "v":Landroid/view/View;
    iget-boolean v10, p0, Lcom/vkontakte/android/attachments/SnippetAttachment;->forceSmall:Z

    if-eqz v10, :cond_5

    .line 156
    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    invoke-virtual {v9, v10, v11, v12, v13}, Landroid/view/View;->setPadding(IIII)V

    .line 158
    :cond_5
    if-eqz v4, :cond_6

    .line 159
    const v10, 0x7f1001e5

    invoke-virtual {v9, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v10

    const/high16 v11, 0x42a00000    # 80.0f

    invoke-static {v11}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v11

    invoke-virtual {v10, v11}, Landroid/view/View;->setMinimumHeight(I)V

    .line 160
    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    invoke-virtual {v9, v10, v11, v12, v13}, Landroid/view/View;->setPadding(IIII)V

    .line 161
    const v10, 0x7f1001e4

    invoke-virtual {v9, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/vk/imageloader/view/VKSnippetImageView;

    .line 162
    .local v1, "imageView":Lcom/vk/imageloader/view/VKSnippetImageView;
    const/4 v10, 0x0

    invoke-virtual {v1, v10}, Lcom/vk/imageloader/view/VKSnippetImageView;->setBorderColor(I)V

    .line 163
    const/4 v10, 0x0

    invoke-virtual {v1, v10}, Lcom/vk/imageloader/view/VKSnippetImageView;->setBorderWidth(F)V

    .line 164
    const/4 v10, 0x2

    invoke-virtual {v1, v10}, Lcom/vk/imageloader/view/VKSnippetImageView;->setType(I)V

    .line 165
    const v10, 0x7f02006b

    invoke-virtual {v1, v10}, Lcom/vk/imageloader/view/VKSnippetImageView;->setPlaceholderImage(I)V

    .line 167
    .end local v1    # "imageView":Lcom/vk/imageloader/view/VKSnippetImageView;
    :cond_6
    new-instance v7, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;

    invoke-direct {v7}, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;-><init>()V

    .line 168
    .restart local v7    # "lp":Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;
    const/4 v10, -0x1

    iput v10, v7, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;->width:I

    .line 169
    const/4 v10, -0x2

    iput v10, v7, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;->height:I

    .line 170
    const/4 v10, 0x1

    iput-boolean v10, v7, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;->center:Z

    .line 171
    invoke-virtual {v9, v7}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 172
    if-eqz v4, :cond_8

    const/high16 v10, 0x42a00000    # 80.0f

    :goto_7
    invoke-static {v10}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v10

    iput v10, p0, Lcom/vkontakte/android/attachments/SnippetAttachment;->lastPhotoWidth:I

    .line 173
    const v10, 0x7f1001dd

    invoke-virtual {v9, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v11

    iget-object v10, p0, Lcom/vkontakte/android/attachments/SnippetAttachment;->subtitle:Ljava/lang/String;

    invoke-static {v10}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v10

    if-eqz v10, :cond_9

    const/16 v10, 0x8

    :goto_8
    invoke-virtual {v11, v10}, Landroid/view/View;->setVisibility(I)V

    goto/16 :goto_2

    .line 153
    .end local v7    # "lp":Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;
    .end local v9    # "v":Landroid/view/View;
    :cond_7
    const v10, 0x7f030054

    goto :goto_6

    .line 172
    .restart local v7    # "lp":Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;
    .restart local v9    # "v":Landroid/view/View;
    :cond_8
    const/high16 v10, 0x42e40000    # 114.0f

    goto :goto_7

    .line 173
    :cond_9
    const/4 v10, 0x0

    goto :goto_8

    .line 181
    :cond_a
    const v10, 0x7f1001e7

    invoke-virtual {v9, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v10

    const/4 v11, 0x0

    invoke-virtual {v10, v11}, Landroid/view/View;->setVisibility(I)V

    .line 182
    const v10, 0x7f1001e7

    invoke-virtual {v9, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/widget/TextView;

    iget-object v11, p0, Lcom/vkontakte/android/attachments/SnippetAttachment;->button:Ljava/lang/String;

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_3

    .line 192
    :cond_b
    const v10, 0x7f1001fa

    invoke-virtual {v9, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v10

    const/16 v11, 0x8

    invoke-virtual {v10, v11}, Landroid/view/View;->setVisibility(I)V

    .line 193
    const v10, 0x7f1001fb

    invoke-virtual {v9, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v10

    const/16 v11, 0x8

    invoke-virtual {v10, v11}, Landroid/view/View;->setVisibility(I)V

    goto/16 :goto_4
.end method

.method public isStory()Z
    .locals 2

    .prologue
    .line 227
    iget-object v0, p0, Lcom/vkontakte/android/attachments/SnippetAttachment;->link:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 228
    iget-object v0, p0, Lcom/vkontakte/android/attachments/SnippetAttachment;->link:Ljava/lang/String;

    const-string/jumbo v1, "https://vk.com/story"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    .line 230
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const v2, 0x7f1001e7

    const/4 v3, 0x1

    .line 200
    iget-object v1, p0, Lcom/vkontakte/android/attachments/SnippetAttachment;->previewPage:Ljava/lang/String;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/vkontakte/android/attachments/SnippetAttachment;->previewPage:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_1

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v1

    if-eq v1, v2, :cond_1

    .line 201
    iget-object v1, p0, Lcom/vkontakte/android/attachments/SnippetAttachment;->previewPage:Ljava/lang/String;

    const-string/jumbo v2, "_"

    invoke-virtual {v1, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 202
    .local v0, "sp":[Ljava/lang/String;
    new-instance v1, Lcom/vkontakte/android/fragments/WikiViewFragment$Builder;

    invoke-direct {v1}, Lcom/vkontakte/android/fragments/WikiViewFragment$Builder;-><init>()V

    const/4 v2, 0x0

    aget-object v2, v0, v2

    .line 203
    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/fragments/WikiViewFragment$Builder;->setOid(I)Lcom/vkontakte/android/fragments/WikiViewFragment$Builder;

    move-result-object v1

    aget-object v2, v0, v3

    .line 204
    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/fragments/WikiViewFragment$Builder;->setPid(I)Lcom/vkontakte/android/fragments/WikiViewFragment$Builder;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/attachments/SnippetAttachment;->referWiki:Ljava/lang/String;

    .line 205
    invoke-virtual {v1, v2}, Lcom/vkontakte/android/fragments/WikiViewFragment$Builder;->setRefer(Ljava/lang/String;)Lcom/vkontakte/android/fragments/WikiViewFragment$Builder;

    move-result-object v1

    .line 206
    invoke-virtual {v1, v3}, Lcom/vkontakte/android/fragments/WikiViewFragment$Builder;->setSite(Z)Lcom/vkontakte/android/fragments/WikiViewFragment$Builder;

    move-result-object v1

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/fragments/WikiViewFragment$Builder;->go(Landroid/content/Context;)Z

    .line 224
    .end local v0    # "sp":[Ljava/lang/String;
    :cond_0
    :goto_0
    return-void

    .line 208
    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v1

    if-ne v1, v2, :cond_4

    .line 209
    iget-object v1, p0, Lcom/vkontakte/android/attachments/SnippetAttachment;->postInteract:Lcom/vkontakte/android/data/PostInteract;

    if-eqz v1, :cond_2

    .line 210
    iget-object v1, p0, Lcom/vkontakte/android/attachments/SnippetAttachment;->postInteract:Lcom/vkontakte/android/data/PostInteract;

    iget-object v2, p0, Lcom/vkontakte/android/attachments/SnippetAttachment;->link:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/data/PostInteract;->setLink(Ljava/lang/String;)Lcom/vkontakte/android/data/PostInteract;

    move-result-object v1

    sget-object v2, Lcom/vkontakte/android/data/PostInteract$Type;->snippet_button_action:Lcom/vkontakte/android/data/PostInteract$Type;

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/data/PostInteract;->sendNow(Lcom/vkontakte/android/data/PostInteract$Type;)V

    .line 212
    :cond_2
    iget-object v1, p0, Lcom/vkontakte/android/attachments/SnippetAttachment;->buttonAction:Lcom/vkontakte/android/api/ButtonAction;

    if-eqz v1, :cond_3

    .line 213
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/attachments/SnippetAttachment;->buttonAction:Lcom/vkontakte/android/api/ButtonAction;

    iget-object v3, p0, Lcom/vkontakte/android/attachments/SnippetAttachment;->postInteract:Lcom/vkontakte/android/data/PostInteract;

    invoke-static {v1, v2, v3}, Lcom/vkontakte/android/utils/AdsUtil;->onActionButtonClick(Landroid/content/Context;Lcom/vkontakte/android/api/ButtonAction;Lcom/vkontakte/android/data/PostInteract;)V

    goto :goto_0

    .line 214
    :cond_3
    iget-object v1, p0, Lcom/vkontakte/android/attachments/SnippetAttachment;->buttonLink:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 215
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/attachments/SnippetAttachment;->buttonLink:Ljava/lang/String;

    iget-object v3, p0, Lcom/vkontakte/android/attachments/SnippetAttachment;->target:Ljava/lang/String;

    invoke-static {v1, v2, v3}, Lcom/vkontakte/android/utils/LinkUtils;->processLink(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 218
    :cond_4
    iget-object v1, p0, Lcom/vkontakte/android/attachments/SnippetAttachment;->postInteract:Lcom/vkontakte/android/data/PostInteract;

    if-eqz v1, :cond_5

    .line 219
    iget-object v1, p0, Lcom/vkontakte/android/attachments/SnippetAttachment;->postInteract:Lcom/vkontakte/android/data/PostInteract;

    iget-object v2, p0, Lcom/vkontakte/android/attachments/SnippetAttachment;->link:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/data/PostInteract;->setLink(Ljava/lang/String;)Lcom/vkontakte/android/data/PostInteract;

    move-result-object v1

    sget-object v2, Lcom/vkontakte/android/data/PostInteract$Type;->snippet_action:Lcom/vkontakte/android/data/PostInteract$Type;

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/data/PostInteract;->sendNow(Lcom/vkontakte/android/data/PostInteract$Type;)V

    .line 221
    :cond_5
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/attachments/SnippetAttachment;->link:Ljava/lang/String;

    iget-object v3, p0, Lcom/vkontakte/android/attachments/SnippetAttachment;->target:Ljava/lang/String;

    invoke-static {v1, v2, v3}, Lcom/vkontakte/android/utils/LinkUtils;->processLink(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public serializeTo(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 1
    .param p1, "s"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 236
    iget-object v0, p0, Lcom/vkontakte/android/attachments/SnippetAttachment;->photo:Lcom/vkontakte/android/Photo;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeSerializable(Lcom/vkontakte/android/utils/Serializer$Serializable;)V

    .line 237
    iget-object v0, p0, Lcom/vkontakte/android/attachments/SnippetAttachment;->title:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 238
    iget-object v0, p0, Lcom/vkontakte/android/attachments/SnippetAttachment;->subtitle:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 239
    iget-object v0, p0, Lcom/vkontakte/android/attachments/SnippetAttachment;->subsubtitle:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 240
    iget-object v0, p0, Lcom/vkontakte/android/attachments/SnippetAttachment;->link:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 241
    iget-object v0, p0, Lcom/vkontakte/android/attachments/SnippetAttachment;->target:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 242
    iget-boolean v0, p0, Lcom/vkontakte/android/attachments/SnippetAttachment;->isProduct:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 243
    iget-object v0, p0, Lcom/vkontakte/android/attachments/SnippetAttachment;->button:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 244
    iget-object v0, p0, Lcom/vkontakte/android/attachments/SnippetAttachment;->buttonLink:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 245
    iget v0, p0, Lcom/vkontakte/android/attachments/SnippetAttachment;->rating:F

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeFloat(F)V

    .line 246
    iget v0, p0, Lcom/vkontakte/android/attachments/SnippetAttachment;->reviewCount:I

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 247
    iget-object v0, p0, Lcom/vkontakte/android/attachments/SnippetAttachment;->previewPage:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 248
    iget-object v0, p0, Lcom/vkontakte/android/attachments/SnippetAttachment;->buttonAction:Lcom/vkontakte/android/api/ButtonAction;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeSerializable(Lcom/vkontakte/android/utils/Serializer$Serializable;)V

    .line 249
    return-void

    .line 242
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setReferData(Lcom/vkontakte/android/data/PostInteract;)V
    .locals 0
    .param p1, "postInteract"    # Lcom/vkontakte/android/data/PostInteract;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 59
    iput-object p1, p0, Lcom/vkontakte/android/attachments/SnippetAttachment;->postInteract:Lcom/vkontakte/android/data/PostInteract;

    .line 60
    return-void
.end method
