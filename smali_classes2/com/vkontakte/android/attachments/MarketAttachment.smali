.class public Lcom/vkontakte/android/attachments/MarketAttachment;
.super Lcom/vkontakte/android/attachments/Attachment;
.source "MarketAttachment.java"

# interfaces
.implements Lcom/vkontakte/android/attachments/ImageAttachment;


# static fields
.field public static final CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/utils/Serializer$Creator",
            "<",
            "Lcom/vkontakte/android/attachments/MarketAttachment;",
            ">;"
        }
    .end annotation
.end field

.field private static lastSource:Lcom/vkontakte/android/fragments/market/GoodFragment$Builder$Source;


# instance fields
.field public final canEdit:Z

.field public final good:Lcom/vkontakte/android/data/Good;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 22
    sget-object v0, Lcom/vkontakte/android/fragments/market/GoodFragment$Builder$Source;->link:Lcom/vkontakte/android/fragments/market/GoodFragment$Builder$Source;

    sput-object v0, Lcom/vkontakte/android/attachments/MarketAttachment;->lastSource:Lcom/vkontakte/android/fragments/market/GoodFragment$Builder$Source;

    .line 82
    new-instance v0, Lcom/vkontakte/android/attachments/MarketAttachment$1;

    invoke-direct {v0}, Lcom/vkontakte/android/attachments/MarketAttachment$1;-><init>()V

    sput-object v0, Lcom/vkontakte/android/attachments/MarketAttachment;->CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;

    return-void
.end method

.method public constructor <init>(Lcom/vkontakte/android/data/Good;)V
    .locals 1
    .param p1, "good"    # Lcom/vkontakte/android/data/Good;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 34
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lcom/vkontakte/android/attachments/MarketAttachment;-><init>(Lcom/vkontakte/android/data/Good;Z)V

    .line 35
    return-void
.end method

.method public constructor <init>(Lcom/vkontakte/android/data/Good;Z)V
    .locals 0
    .param p1, "good"    # Lcom/vkontakte/android/data/Good;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "canEdit"    # Z

    .prologue
    .line 37
    invoke-direct {p0}, Lcom/vkontakte/android/attachments/Attachment;-><init>()V

    .line 38
    iput-object p1, p0, Lcom/vkontakte/android/attachments/MarketAttachment;->good:Lcom/vkontakte/android/data/Good;

    .line 39
    iput-boolean p2, p0, Lcom/vkontakte/android/attachments/MarketAttachment;->canEdit:Z

    .line 40
    return-void
.end method

.method public static setLastSource(Lcom/vkontakte/android/fragments/market/GoodFragment$Builder$Source;)V
    .locals 0
    .param p0, "source"    # Lcom/vkontakte/android/fragments/market/GoodFragment$Builder$Source;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 26
    sput-object p0, Lcom/vkontakte/android/attachments/MarketAttachment;->lastSource:Lcom/vkontakte/android/fragments/market/GoodFragment$Builder$Source;

    .line 27
    return-void
.end method


# virtual methods
.method public bind(Landroid/view/View;)V
    .locals 3
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 105
    const v1, 0x7f1001e4

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/imageloader/view/VKSnippetImageView;

    .line 106
    .local v0, "imageView":Lcom/vk/imageloader/view/VKSnippetImageView;
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f010013

    invoke-static {v1, v2}, Lcom/vkontakte/android/ViewUtils;->getBoolFromTheme(Landroid/content/Context;I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 107
    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Lcom/vk/imageloader/view/VKSnippetImageView;->setType(I)V

    .line 108
    const v1, 0x7f02006b

    invoke-virtual {v0, v1}, Lcom/vk/imageloader/view/VKSnippetImageView;->setPlaceholderImage(I)V

    .line 113
    :goto_0
    invoke-virtual {p0}, Lcom/vkontakte/android/attachments/MarketAttachment;->getImageURL()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/imageloader/view/VKSnippetImageView;->load(Ljava/lang/String;)V

    .line 114
    return-void

    .line 110
    :cond_0
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/vk/imageloader/view/VKSnippetImageView;->setType(I)V

    .line 111
    const v1, 0x7f020394

    invoke-virtual {v0, v1}, Lcom/vk/imageloader/view/VKSnippetImageView;->setPlaceholderImage(I)V

    goto :goto_0
.end method

.method public getFullView(Landroid/content/Context;)Landroid/view/View;
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 44
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/vkontakte/android/attachments/MarketAttachment;->getViewForList(Landroid/content/Context;Landroid/view/View;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public getImageURL()Ljava/lang/String;
    .locals 1

    .prologue
    .line 100
    iget-object v0, p0, Lcom/vkontakte/android/attachments/MarketAttachment;->good:Lcom/vkontakte/android/data/Good;

    iget-object v0, v0, Lcom/vkontakte/android/data/Good;->thumb_photo:Ljava/lang/String;

    return-object v0
.end method

.method public getViewForList(Landroid/content/Context;Landroid/view/View;)Landroid/view/View;
    .locals 10
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "reuse"    # Landroid/view/View;

    .prologue
    const v9, 0x7f1001e7

    const v8, 0x7f1001dd

    const/16 v5, 0x8

    const/4 v6, 0x0

    .line 49
    const v4, 0x7f010013

    invoke-static {p1, v4}, Lcom/vkontakte/android/ViewUtils;->getBoolFromTheme(Landroid/content/Context;I)Z

    move-result v0

    .line 50
    .local v0, "isMessagesSnippet":Z
    if-nez p2, :cond_1

    if-eqz v0, :cond_0

    const v4, 0x7f030055

    :goto_0
    const/4 v7, 0x0

    invoke-static {p1, v4, v7}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v3

    .line 52
    .local v3, "v":Landroid/view/View;
    :goto_1
    invoke-virtual {v3, v6, v6, v6, v6}, Landroid/view/View;->setPadding(IIII)V

    .line 53
    const v4, 0x7f1001e5

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    if-eqz v0, :cond_2

    const/high16 v4, 0x42a00000    # 80.0f

    invoke-static {v4}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v4

    :goto_2
    invoke-virtual {v7, v4}, Landroid/view/View;->setMinimumHeight(I)V

    .line 54
    new-instance v2, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;

    invoke-direct {v2}, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;-><init>()V

    .line 55
    .local v2, "lp":Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;
    const/4 v4, -0x1

    iput v4, v2, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;->width:I

    .line 56
    const/4 v4, -0x2

    iput v4, v2, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;->height:I

    .line 57
    const/4 v4, 0x1

    iput-boolean v4, v2, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;->center:Z

    .line 58
    invoke-virtual {v3, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 59
    invoke-virtual {v3, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    iget-object v4, p0, Lcom/vkontakte/android/attachments/MarketAttachment;->good:Lcom/vkontakte/android/data/Good;

    iget-object v4, v4, Lcom/vkontakte/android/data/Good;->price_text:Ljava/lang/String;

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_3

    move v4, v5

    :goto_3
    invoke-virtual {v7, v4}, Landroid/view/View;->setVisibility(I)V

    .line 60
    const v4, 0x7f1001dc

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    iget-object v6, p0, Lcom/vkontakte/android/attachments/MarketAttachment;->good:Lcom/vkontakte/android/data/Good;

    iget-object v6, v6, Lcom/vkontakte/android/data/Good;->title:Ljava/lang/String;

    invoke-virtual {v4, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 61
    invoke-virtual {v3, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    iget-object v6, p0, Lcom/vkontakte/android/attachments/MarketAttachment;->good:Lcom/vkontakte/android/data/Good;

    iget-object v6, v6, Lcom/vkontakte/android/data/Good;->price_text:Ljava/lang/String;

    invoke-virtual {v4, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 62
    const v4, 0x7f1001e6

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    const v6, 0x7f080298

    invoke-virtual {v4, v6}, Landroid/widget/TextView;->setText(I)V

    .line 63
    invoke-virtual {v3, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    invoke-virtual {v4, v5}, Landroid/view/View;->setVisibility(I)V

    .line 64
    invoke-static {p0, v3}, Lcom/vkontakte/android/attachments/MarketAttachment$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/attachments/MarketAttachment;Landroid/view/View;)Landroid/view/View$OnClickListener;

    move-result-object v1

    .line 65
    .local v1, "l":Landroid/view/View$OnClickListener;
    invoke-virtual {v3, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 66
    invoke-virtual {v3, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    invoke-virtual {v4, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 67
    const v4, 0x7f1001fa

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    invoke-virtual {v4, v5}, Landroid/view/View;->setVisibility(I)V

    .line 68
    const v4, 0x7f1001fb

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    invoke-virtual {v4, v5}, Landroid/view/View;->setVisibility(I)V

    .line 69
    return-object v3

    .line 50
    .end local v1    # "l":Landroid/view/View$OnClickListener;
    .end local v2    # "lp":Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;
    .end local v3    # "v":Landroid/view/View;
    :cond_0
    const v4, 0x7f030054

    goto/16 :goto_0

    :cond_1
    move-object v3, p2

    goto/16 :goto_1

    .line 53
    .restart local v3    # "v":Landroid/view/View;
    :cond_2
    const/high16 v4, 0x42e40000    # 114.0f

    invoke-static {v4}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v4

    goto/16 :goto_2

    .restart local v2    # "lp":Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;
    :cond_3
    move v4, v6

    .line 59
    goto :goto_3
.end method

.method synthetic lambda$getViewForList$0(Landroid/view/View;Landroid/view/View;)V
    .locals 4
    .param p1, "v"    # Landroid/view/View;
    .param p2, "v1"    # Landroid/view/View;

    .prologue
    .line 64
    new-instance v0, Lcom/vkontakte/android/fragments/market/GoodFragment$Builder;

    sget-object v1, Lcom/vkontakte/android/attachments/MarketAttachment;->lastSource:Lcom/vkontakte/android/fragments/market/GoodFragment$Builder$Source;

    iget-object v2, p0, Lcom/vkontakte/android/attachments/MarketAttachment;->good:Lcom/vkontakte/android/data/Good;

    iget v2, v2, Lcom/vkontakte/android/data/Good;->owner_id:I

    iget-object v3, p0, Lcom/vkontakte/android/attachments/MarketAttachment;->good:Lcom/vkontakte/android/data/Good;

    iget v3, v3, Lcom/vkontakte/android/data/Good;->id:I

    invoke-direct {v0, v1, v2, v3}, Lcom/vkontakte/android/fragments/market/GoodFragment$Builder;-><init>(Lcom/vkontakte/android/fragments/market/GoodFragment$Builder$Source;II)V

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/market/GoodFragment$Builder;->go(Landroid/content/Context;)Z

    return-void
.end method

.method public serializeTo(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 1
    .param p1, "s"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 74
    iget-object v0, p0, Lcom/vkontakte/android/attachments/MarketAttachment;->good:Lcom/vkontakte/android/data/Good;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeSerializable(Lcom/vkontakte/android/utils/Serializer$Serializable;)V

    .line 75
    iget-boolean v0, p0, Lcom/vkontakte/android/attachments/MarketAttachment;->canEdit:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeByte(B)V

    .line 76
    return-void

    .line 75
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 79
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "market"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/attachments/MarketAttachment;->good:Lcom/vkontakte/android/data/Good;

    iget v1, v1, Lcom/vkontakte/android/data/Good;->owner_id:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/attachments/MarketAttachment;->good:Lcom/vkontakte/android/data/Good;

    iget v1, v1, Lcom/vkontakte/android/data/Good;->id:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
