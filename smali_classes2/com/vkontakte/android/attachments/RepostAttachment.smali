.class public Lcom/vkontakte/android/attachments/RepostAttachment;
.super Lcom/vkontakte/android/attachments/Attachment;
.source "RepostAttachment.java"

# interfaces
.implements Lcom/vkontakte/android/attachments/ImageAttachment;


# static fields
.field public static final CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/utils/Serializer$Creator",
            "<",
            "Lcom/vkontakte/android/attachments/RepostAttachment;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public name:Ljava/lang/String;

.field public ownerID:I

.field public photo:Ljava/lang/String;

.field public postID:I

.field public time:I

.field public type:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 44
    new-instance v0, Lcom/vkontakte/android/attachments/RepostAttachment$1;

    invoke-direct {v0}, Lcom/vkontakte/android/attachments/RepostAttachment$1;-><init>()V

    sput-object v0, Lcom/vkontakte/android/attachments/RepostAttachment;->CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;

    return-void
.end method

.method public constructor <init>(IIILjava/lang/String;Ljava/lang/String;I)V
    .locals 0
    .param p1, "_ownerID"    # I
    .param p2, "_postID"    # I
    .param p3, "_time"    # I
    .param p4, "_name"    # Ljava/lang/String;
    .param p5, "_photo"    # Ljava/lang/String;
    .param p6, "_type"    # I

    .prologue
    .line 25
    invoke-direct {p0}, Lcom/vkontakte/android/attachments/Attachment;-><init>()V

    .line 26
    iput p1, p0, Lcom/vkontakte/android/attachments/RepostAttachment;->ownerID:I

    .line 27
    iput p3, p0, Lcom/vkontakte/android/attachments/RepostAttachment;->time:I

    .line 28
    iput-object p4, p0, Lcom/vkontakte/android/attachments/RepostAttachment;->name:Ljava/lang/String;

    .line 29
    iput-object p5, p0, Lcom/vkontakte/android/attachments/RepostAttachment;->photo:Ljava/lang/String;

    .line 30
    iput p2, p0, Lcom/vkontakte/android/attachments/RepostAttachment;->postID:I

    .line 31
    iput p6, p0, Lcom/vkontakte/android/attachments/RepostAttachment;->type:I

    .line 33
    return-void
.end method

.method public constructor <init>(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 1
    .param p1, "p"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 35
    invoke-direct {p0}, Lcom/vkontakte/android/attachments/Attachment;-><init>()V

    .line 36
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/attachments/RepostAttachment;->ownerID:I

    .line 37
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/attachments/RepostAttachment;->postID:I

    .line 38
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/attachments/RepostAttachment;->time:I

    .line 39
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/attachments/RepostAttachment;->name:Ljava/lang/String;

    .line 40
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/attachments/RepostAttachment;->photo:Ljava/lang/String;

    .line 41
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/attachments/RepostAttachment;->type:I

    .line 42
    return-void
.end method


# virtual methods
.method public bind(Landroid/view/View;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 72
    const v1, 0x7f1005a4

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/imageloader/view/VKImageView;

    .line 73
    .local v0, "imageView":Lcom/vk/imageloader/view/VKImageView;
    iget v1, p0, Lcom/vkontakte/android/attachments/RepostAttachment;->ownerID:I

    if-gez v1, :cond_0

    const v1, 0x7f02013d

    :goto_0
    invoke-virtual {v0, v1}, Lcom/vk/imageloader/view/VKImageView;->setPlaceholderImage(I)V

    .line 74
    invoke-virtual {p0}, Lcom/vkontakte/android/attachments/RepostAttachment;->getImageURL()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    .line 75
    return-void

    .line 73
    :cond_0
    const v1, 0x7f0203d3

    goto :goto_0
.end method

.method public getFullView(Landroid/content/Context;)Landroid/view/View;
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 79
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/vkontakte/android/attachments/RepostAttachment;->getViewForList(Landroid/content/Context;Landroid/view/View;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public getImageURL()Ljava/lang/String;
    .locals 1

    .prologue
    .line 67
    iget-object v0, p0, Lcom/vkontakte/android/attachments/RepostAttachment;->photo:Ljava/lang/String;

    return-object v0
.end method

.method public getViewForList(Landroid/content/Context;Landroid/view/View;)Landroid/view/View;
    .locals 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "reuse"    # Landroid/view/View;

    .prologue
    const/4 v6, 0x0

    .line 84
    const-string/jumbo v1, "repost"

    invoke-static {p1, v1}, Lcom/vkontakte/android/attachments/RepostAttachment;->getReusableView(Landroid/content/Context;Ljava/lang/String;)Landroid/view/View;

    move-result-object v0

    .line 85
    .local v0, "v":Landroid/view/View;
    const v1, 0x7f1005a2

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iget-object v2, p0, Lcom/vkontakte/android/attachments/RepostAttachment;->name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 86
    const v1, 0x7f1005a5

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget v3, p0, Lcom/vkontakte/android/attachments/RepostAttachment;->time:I

    invoke-static {v3}, Lcom/vkontakte/android/TimeUtils;->langDate(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v2, p0, Lcom/vkontakte/android/attachments/RepostAttachment;->type:I

    if-nez v2, :cond_0

    const-string/jumbo v2, ""

    :goto_0
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 87
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 88
    invoke-static {p0}, Lcom/vkontakte/android/attachments/RepostAttachment$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/attachments/RepostAttachment;)Landroid/view/View$OnClickListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 92
    invoke-virtual {v0, v6}, Landroid/view/View;->setFocusable(Z)V

    .line 93
    invoke-virtual {v0, v6}, Landroid/view/View;->setFocusableInTouchMode(Z)V

    .line 94
    return-object v0

    .line 86
    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, " "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f080471

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_0
.end method

.method synthetic lambda$getViewForList$0(Landroid/view/View;)V
    .locals 4
    .param p1, "v1"    # Landroid/view/View;

    .prologue
    .line 89
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v1, "android.intent.action.VIEW"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "vkontakte://vk.com/wall"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/vkontakte/android/attachments/RepostAttachment;->ownerID:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "_"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/vkontakte/android/attachments/RepostAttachment;->postID:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 90
    .local v0, "intent":Landroid/content/Intent;
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 91
    return-void
.end method

.method public overrideLayoutParams()Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;
    .locals 1

    .prologue
    .line 105
    const/4 v0, 0x0

    return-object v0
.end method

.method public serializeTo(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 1
    .param p1, "p"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 57
    iget v0, p0, Lcom/vkontakte/android/attachments/RepostAttachment;->ownerID:I

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 58
    iget v0, p0, Lcom/vkontakte/android/attachments/RepostAttachment;->postID:I

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 59
    iget v0, p0, Lcom/vkontakte/android/attachments/RepostAttachment;->time:I

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 60
    iget-object v0, p0, Lcom/vkontakte/android/attachments/RepostAttachment;->name:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 61
    iget-object v0, p0, Lcom/vkontakte/android/attachments/RepostAttachment;->photo:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 62
    iget v0, p0, Lcom/vkontakte/android/attachments/RepostAttachment;->type:I

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 63
    return-void
.end method
