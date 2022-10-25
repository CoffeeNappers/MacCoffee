.class public Lcom/vkontakte/android/attachments/MoneyTransferAttachment;
.super Lcom/vkontakte/android/attachments/Attachment;
.source "MoneyTransferAttachment.java"

# interfaces
.implements Lcom/vkontakte/android/attachments/ImageAttachment;
.implements Landroid/view/View$OnClickListener;


# static fields
.field public static final CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/utils/Serializer$Creator",
            "<",
            "Lcom/vkontakte/android/attachments/MoneyTransferAttachment;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private buttonText:Ljava/lang/String;

.field private fromId:I

.field private id:I

.field private subtitle:Ljava/lang/String;

.field private title:Ljava/lang/String;

.field private toId:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 108
    new-instance v0, Lcom/vkontakte/android/attachments/MoneyTransferAttachment$1;

    invoke-direct {v0}, Lcom/vkontakte/android/attachments/MoneyTransferAttachment$1;-><init>()V

    sput-object v0, Lcom/vkontakte/android/attachments/MoneyTransferAttachment;->CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;

    return-void
.end method

.method private constructor <init>(IIILjava/lang/String;)V
    .locals 0
    .param p1, "id"    # I
    .param p2, "fromId"    # I
    .param p3, "toId"    # I
    .param p4, "title"    # Ljava/lang/String;

    .prologue
    .line 42
    invoke-direct {p0}, Lcom/vkontakte/android/attachments/Attachment;-><init>()V

    .line 43
    iput p1, p0, Lcom/vkontakte/android/attachments/MoneyTransferAttachment;->id:I

    .line 44
    iput p2, p0, Lcom/vkontakte/android/attachments/MoneyTransferAttachment;->fromId:I

    .line 45
    iput p3, p0, Lcom/vkontakte/android/attachments/MoneyTransferAttachment;->toId:I

    .line 46
    iput-object p4, p0, Lcom/vkontakte/android/attachments/MoneyTransferAttachment;->title:Ljava/lang/String;

    .line 48
    invoke-direct {p0}, Lcom/vkontakte/android/attachments/MoneyTransferAttachment;->init()V

    .line 49
    return-void
.end method

.method synthetic constructor <init>(IIILjava/lang/String;Lcom/vkontakte/android/attachments/MoneyTransferAttachment$1;)V
    .locals 0
    .param p1, "x0"    # I
    .param p2, "x1"    # I
    .param p3, "x2"    # I
    .param p4, "x3"    # Ljava/lang/String;
    .param p5, "x4"    # Lcom/vkontakte/android/attachments/MoneyTransferAttachment$1;

    .prologue
    .line 23
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/vkontakte/android/attachments/MoneyTransferAttachment;-><init>(IIILjava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Lcom/vkontakte/android/MoneyTransfer;)V
    .locals 4
    .param p1, "mt"    # Lcom/vkontakte/android/MoneyTransfer;

    .prologue
    .line 39
    iget v0, p1, Lcom/vkontakte/android/MoneyTransfer;->id:I

    iget v1, p1, Lcom/vkontakte/android/MoneyTransfer;->from_id:I

    iget v2, p1, Lcom/vkontakte/android/MoneyTransfer;->to_id:I

    invoke-virtual {p1}, Lcom/vkontakte/android/MoneyTransfer;->getAmountWithCurrencyFormatted()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v0, v1, v2, v3}, Lcom/vkontakte/android/attachments/MoneyTransferAttachment;-><init>(IIILjava/lang/String;)V

    .line 40
    return-void
.end method

.method private getIsForwarded()Z
    .locals 1

    .prologue
    .line 35
    iget v0, p0, Lcom/vkontakte/android/attachments/MoneyTransferAttachment;->fromId:I

    invoke-static {v0}, Lcom/vkontakte/android/auth/VKAccountManager;->isCurrentUser(I)Z

    move-result v0

    if-nez v0, :cond_0

    iget v0, p0, Lcom/vkontakte/android/attachments/MoneyTransferAttachment;->toId:I

    invoke-static {v0}, Lcom/vkontakte/android/auth/VKAccountManager;->isCurrentUser(I)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private init()V
    .locals 2

    .prologue
    .line 52
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f08036c

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/attachments/MoneyTransferAttachment;->subtitle:Ljava/lang/String;

    .line 53
    invoke-direct {p0}, Lcom/vkontakte/android/attachments/MoneyTransferAttachment;->getIsForwarded()Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f080368

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    :goto_0
    iput-object v0, p0, Lcom/vkontakte/android/attachments/MoneyTransferAttachment;->buttonText:Ljava/lang/String;

    .line 54
    return-void

    .line 53
    :cond_0
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f080378

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method


# virtual methods
.method public bind(Landroid/view/View;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 87
    const v1, 0x7f1001e4

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/imageloader/view/VKImageView;

    .line 88
    .local v0, "imageView":Lcom/vk/imageloader/view/VKImageView;
    invoke-virtual {p0}, Lcom/vkontakte/android/attachments/MoneyTransferAttachment;->getImageURL()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    .line 89
    return-void
.end method

.method public getFullView(Landroid/content/Context;)Landroid/view/View;
    .locals 8
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const v7, 0x7f1001e7

    const/high16 v4, 0x41000000    # 8.0f

    .line 58
    const v3, 0x7f030050

    const/4 v5, 0x0

    invoke-static {p1, v3, v5}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v2

    .line 59
    .local v2, "v":Landroid/view/View;
    const v3, 0x7f1001e4

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Lcom/vk/imageloader/view/VKSnippetImageView;

    const/4 v5, 0x2

    invoke-virtual {v3, v5}, Lcom/vk/imageloader/view/VKSnippetImageView;->setType(I)V

    .line 61
    const v3, 0x7f1001dc

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iget-object v5, p0, Lcom/vkontakte/android/attachments/MoneyTransferAttachment;->title:Ljava/lang/String;

    invoke-virtual {v3, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 62
    const v3, 0x7f1001dd

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iget-object v5, p0, Lcom/vkontakte/android/attachments/MoneyTransferAttachment;->subtitle:Ljava/lang/String;

    invoke-virtual {v3, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 63
    invoke-virtual {v2, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iget-object v5, p0, Lcom/vkontakte/android/attachments/MoneyTransferAttachment;->buttonText:Ljava/lang/String;

    invoke-virtual {v3, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 65
    const v3, 0x7f1001f3

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    .line 66
    .local v0, "container":Landroid/view/ViewGroup;
    invoke-direct {p0}, Lcom/vkontakte/android/attachments/MoneyTransferAttachment;->getIsForwarded()Z

    move-result v3

    if-eqz v3, :cond_0

    const/4 v1, 0x0

    .line 67
    .local v1, "topLeftPadding":F
    :goto_0
    invoke-static {v1}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v3

    invoke-static {v1}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v5

    invoke-static {v4}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v4

    const/high16 v6, 0x40c00000    # 6.0f

    invoke-static {v6}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v6

    invoke-virtual {v0, v3, v5, v4, v6}, Landroid/view/ViewGroup;->setPadding(IIII)V

    .line 69
    invoke-virtual {v2, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 70
    invoke-virtual {v2, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 72
    return-object v2

    .end local v1    # "topLeftPadding":F
    :cond_0
    move v1, v4

    .line 66
    goto :goto_0
.end method

.method public getImageURL()Ljava/lang/String;
    .locals 1

    .prologue
    .line 82
    const v0, 0x7f02032d

    invoke-static {v0}, Lcom/vkontakte/android/utils/UriUtil;->resourceToUri(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getViewForList(Landroid/content/Context;Landroid/view/View;)Landroid/view/View;
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "reuse"    # Landroid/view/View;

    .prologue
    .line 77
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/attachments/MoneyTransferAttachment;->getFullView(Landroid/content/Context;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 4
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 93
    invoke-direct {p0}, Lcom/vkontakte/android/attachments/MoneyTransferAttachment;->getIsForwarded()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 94
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {}, Lcom/vkontakte/android/MoneyTransfer;->getLandingUrl()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/money/MoneyWebViewFragment;->showTerms(Landroid/content/Context;Ljava/lang/String;)V

    .line 98
    :goto_0
    return-void

    .line 96
    :cond_0
    iget v0, p0, Lcom/vkontakte/android/attachments/MoneyTransferAttachment;->id:I

    iget v1, p0, Lcom/vkontakte/android/attachments/MoneyTransferAttachment;->fromId:I

    iget v2, p0, Lcom/vkontakte/android/attachments/MoneyTransferAttachment;->toId:I

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v0, v1, v2, v3}, Lcom/vkontakte/android/fragments/money/MoneyTransferDetailsFragment;->show(IIILandroid/content/Context;)V

    goto :goto_0
.end method

.method public serializeTo(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 1
    .param p1, "s"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 102
    iget v0, p0, Lcom/vkontakte/android/attachments/MoneyTransferAttachment;->id:I

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 103
    iget v0, p0, Lcom/vkontakte/android/attachments/MoneyTransferAttachment;->fromId:I

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 104
    iget v0, p0, Lcom/vkontakte/android/attachments/MoneyTransferAttachment;->toId:I

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 105
    iget-object v0, p0, Lcom/vkontakte/android/attachments/MoneyTransferAttachment;->title:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 106
    return-void
.end method
