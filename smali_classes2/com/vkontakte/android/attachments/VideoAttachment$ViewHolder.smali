.class Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;
.super Lcom/vkontakte/android/attachments/AttachmentViewHolder;
.source "VideoAttachment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/attachments/VideoAttachment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ViewHolder"
.end annotation


# instance fields
.field private autoPlayHolder:Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;

.field private final duration:Landroid/widget/TextView;

.field private final durationWrap:Landroid/view/View;

.field private isNewsScreen:Ljava/lang/Boolean;

.field private final playIcon:Landroid/view/View;

.field private final preview:Lcom/vk/imageloader/view/VKImageView;

.field private final subtitle:Landroid/widget/TextView;

.field private final title:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/view/View;Ljava/lang/String;)V
    .locals 1
    .param p1, "view"    # Landroid/view/View;
    .param p2, "tag"    # Ljava/lang/String;

    .prologue
    .line 788
    invoke-direct {p0, p2}, Lcom/vkontakte/android/attachments/AttachmentViewHolder;-><init>(Ljava/lang/String;)V

    .line 789
    const v0, 0x7f1001de

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;->duration:Landroid/widget/TextView;

    .line 790
    const v0, 0x7f1001dd

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;->subtitle:Landroid/widget/TextView;

    .line 791
    const v0, 0x7f1001fd

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/imageloader/view/VKImageView;

    iput-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;->preview:Lcom/vk/imageloader/view/VKImageView;

    .line 792
    const v0, 0x7f1001dc

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;->title:Landroid/widget/TextView;

    .line 793
    const v0, 0x7f1001ff

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;->durationWrap:Landroid/view/View;

    .line 794
    const v0, 0x7f1001fe

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;->playIcon:Landroid/view/View;

    .line 796
    const-string/jumbo v0, "video_single"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string/jumbo v0, "video_ads"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 797
    :cond_0
    new-instance v0, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;

    invoke-direct {v0, p1}, Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;-><init>(Landroid/view/View;)V

    iput-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;->autoPlayHolder:Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;

    .line 799
    :cond_1
    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;)Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;

    .prologue
    .line 776
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;->autoPlayHolder:Lcom/vkontakte/android/attachments/VideoAttachment$AutoPlayHolder;

    return-object v0
.end method

.method static synthetic access$200(Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;)Ljava/lang/Boolean;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;

    .prologue
    .line 776
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;->isNewsScreen:Ljava/lang/Boolean;

    return-object v0
.end method

.method static synthetic access$202(Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;
    .param p1, "x1"    # Ljava/lang/Boolean;

    .prologue
    .line 776
    iput-object p1, p0, Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;->isNewsScreen:Ljava/lang/Boolean;

    return-object p1
.end method

.method static synthetic access$300(Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;

    .prologue
    .line 776
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;->title:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$400(Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;

    .prologue
    .line 776
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;->subtitle:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$500(Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;)Lcom/vk/imageloader/view/VKImageView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;

    .prologue
    .line 776
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;->preview:Lcom/vk/imageloader/view/VKImageView;

    return-object v0
.end method

.method static synthetic access$600(Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;

    .prologue
    .line 776
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;->playIcon:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$700(Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;

    .prologue
    .line 776
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;->durationWrap:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$800(Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;

    .prologue
    .line 776
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;->duration:Landroid/widget/TextView;

    return-object v0
.end method


# virtual methods
.method public isNewsScreen()Z
    .locals 1

    .prologue
    .line 802
    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;->isNewsScreen:Ljava/lang/Boolean;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/attachments/VideoAttachment$ViewHolder;->isNewsScreen:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
