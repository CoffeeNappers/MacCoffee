.class public Lcom/vkontakte/android/attachments/StickerAttachment;
.super Lcom/vkontakte/android/attachments/Attachment;
.source "StickerAttachment.java"

# interfaces
.implements Lcom/vkontakte/android/attachments/ImageAttachment;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/attachments/StickerAttachment$Callback;
    }
.end annotation


# static fields
.field public static final CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/utils/Serializer$Creator",
            "<",
            "Lcom/vkontakte/android/attachments/StickerAttachment;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private callback:Lcom/vkontakte/android/attachments/StickerAttachment$Callback;

.field public height:I

.field public id:I

.field public images:[Ljava/lang/String;

.field public packID:I

.field public stickerReferrer:Ljava/lang/String;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public width:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 56
    new-instance v0, Lcom/vkontakte/android/attachments/StickerAttachment$1;

    invoke-direct {v0}, Lcom/vkontakte/android/attachments/StickerAttachment$1;-><init>()V

    sput-object v0, Lcom/vkontakte/android/attachments/StickerAttachment;->CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 36
    invoke-direct {p0}, Lcom/vkontakte/android/attachments/Attachment;-><init>()V

    .line 38
    return-void
.end method

.method public constructor <init>(I[Ljava/lang/String;III)V
    .locals 0
    .param p1, "_id"    # I
    .param p2, "_images"    # [Ljava/lang/String;
    .param p3, "_width"    # I
    .param p4, "_height"    # I
    .param p5, "pack"    # I

    .prologue
    .line 40
    invoke-direct {p0}, Lcom/vkontakte/android/attachments/Attachment;-><init>()V

    .line 41
    iput p1, p0, Lcom/vkontakte/android/attachments/StickerAttachment;->id:I

    .line 42
    iput-object p2, p0, Lcom/vkontakte/android/attachments/StickerAttachment;->images:[Ljava/lang/String;

    .line 43
    iput p3, p0, Lcom/vkontakte/android/attachments/StickerAttachment;->width:I

    .line 44
    iput p4, p0, Lcom/vkontakte/android/attachments/StickerAttachment;->height:I

    .line 45
    iput p5, p0, Lcom/vkontakte/android/attachments/StickerAttachment;->packID:I

    .line 46
    return-void
.end method

.method public constructor <init>(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 1
    .param p1, "in"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 48
    invoke-direct {p0}, Lcom/vkontakte/android/attachments/Attachment;-><init>()V

    .line 49
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/attachments/StickerAttachment;->id:I

    .line 50
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->createStringArray()[Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/attachments/StickerAttachment;->images:[Ljava/lang/String;

    .line 51
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/attachments/StickerAttachment;->width:I

    .line 52
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/attachments/StickerAttachment;->height:I

    .line 53
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/attachments/StickerAttachment;->packID:I

    .line 54
    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/attachments/StickerAttachment;)Lcom/vkontakte/android/attachments/StickerAttachment$Callback;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/attachments/StickerAttachment;

    .prologue
    .line 25
    iget-object v0, p0, Lcom/vkontakte/android/attachments/StickerAttachment;->callback:Lcom/vkontakte/android/attachments/StickerAttachment$Callback;

    return-object v0
.end method

.method private getUrl()Ljava/lang/String;
    .locals 4

    .prologue
    .line 148
    invoke-static {}, Lcom/vkontakte/android/stickers/Stickers;->get()Lcom/vkontakte/android/stickers/Stickers;

    move-result-object v2

    iget v3, p0, Lcom/vkontakte/android/attachments/StickerAttachment;->packID:I

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/stickers/Stickers;->getById(I)Lcom/vkontakte/android/data/orm/StickerStockItem;

    move-result-object v0

    .line 149
    .local v0, "item":Lcom/vkontakte/android/data/orm/StickerStockItem;
    if-eqz v0, :cond_0

    .line 150
    iget v2, p0, Lcom/vkontakte/android/attachments/StickerAttachment;->id:I

    invoke-virtual {v0, v2}, Lcom/vkontakte/android/data/orm/StickerStockItem;->getServerStickerViewURL(I)Ljava/lang/String;

    move-result-object v2

    .line 153
    :goto_0
    return-object v2

    .line 152
    :cond_0
    sget v2, Lcom/vkontakte/android/Global;->displayDensity:F

    const/high16 v3, 0x3f800000    # 1.0f

    cmpl-float v2, v2, v3

    if-lez v2, :cond_1

    const/4 v1, 0x2

    .line 153
    .local v1, "stickerSize":I
    :goto_1
    iget-object v2, p0, Lcom/vkontakte/android/attachments/StickerAttachment;->images:[Ljava/lang/String;

    aget-object v2, v2, v1

    goto :goto_0

    .line 152
    .end local v1    # "stickerSize":I
    :cond_1
    const/4 v1, 0x1

    goto :goto_1
.end method


# virtual methods
.method public bind(Landroid/view/View;)V
    .locals 1
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 144
    check-cast p1, Lcom/vk/imageloader/view/VKImageView;

    .end local p1    # "view":Landroid/view/View;
    invoke-virtual {p0}, Lcom/vkontakte/android/attachments/StickerAttachment;->getImageURL()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    .line 145
    return-void
.end method

.method public getFullView(Landroid/content/Context;)Landroid/view/View;
    .locals 8
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/high16 v7, 0x41000000    # 8.0f

    .line 82
    new-instance v1, Lcom/vk/imageloader/view/VKImageView;

    invoke-direct {v1, p1}, Lcom/vk/imageloader/view/VKImageView;-><init>(Landroid/content/Context;)V

    .line 84
    .local v1, "iv":Lcom/vk/imageloader/view/VKImageView;
    iget v4, p0, Lcom/vkontakte/android/attachments/StickerAttachment;->width:I

    .line 85
    .local v4, "width":I
    iget v0, p0, Lcom/vkontakte/android/attachments/StickerAttachment;->height:I

    .line 87
    .local v0, "height":I
    if-eqz v4, :cond_0

    if-nez v0, :cond_1

    .line 88
    :cond_0
    sget v0, Lcom/vkontakte/android/stickers/StickersConfig;->STICKER_SIZE:I

    move v4, v0

    .line 93
    :cond_1
    if-le v4, v0, :cond_2

    .line 94
    sget v3, Lcom/vkontakte/android/stickers/StickersConfig;->STICKER_SIZE:I

    .line 95
    .local v3, "resultWidth":I
    mul-int v5, v3, v0

    int-to-float v5, v5

    int-to-float v6, v4

    div-float/2addr v5, v6

    float-to-int v2, v5

    .line 100
    .local v2, "resultHeight":I
    :goto_0
    invoke-static {v7}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v5

    add-int/2addr v5, v2

    invoke-virtual {v1, v3, v5}, Lcom/vk/imageloader/view/VKImageView;->setFixedSize(II)V

    .line 101
    const v5, 0x7f0203c7

    invoke-virtual {v1, v5}, Lcom/vk/imageloader/view/VKImageView;->setPlaceholderImage(I)V

    .line 102
    sget-object v5, Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;->FIT_START:Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;

    invoke-virtual {v1, v5}, Lcom/vk/imageloader/view/VKImageView;->setActualScaleType(Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;)V

    .line 103
    sget v5, Lcom/vkontakte/android/stickers/StickersConfig;->STICKER_SIZE:I

    invoke-virtual {v1, v5}, Lcom/vk/imageloader/view/VKImageView;->setMaxWidth(I)V

    .line 104
    sget v5, Lcom/vkontakte/android/stickers/StickersConfig;->STICKER_SIZE:I

    invoke-static {v7}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v6

    add-int/2addr v5, v6

    invoke-virtual {v1, v5}, Lcom/vk/imageloader/view/VKImageView;->setMaxHeight(I)V

    .line 105
    new-instance v5, Lcom/vkontakte/android/attachments/StickerAttachment$2;

    invoke-direct {v5, p0, p1}, Lcom/vkontakte/android/attachments/StickerAttachment$2;-><init>(Lcom/vkontakte/android/attachments/StickerAttachment;Landroid/content/Context;)V

    invoke-virtual {v1, v5}, Lcom/vk/imageloader/view/VKImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 123
    return-object v1

    .line 97
    .end local v2    # "resultHeight":I
    .end local v3    # "resultWidth":I
    :cond_2
    sget v2, Lcom/vkontakte/android/stickers/StickersConfig;->STICKER_SIZE:I

    .line 98
    .restart local v2    # "resultHeight":I
    mul-int v5, v2, v4

    int-to-float v5, v5

    int-to-float v6, v0

    div-float/2addr v5, v6

    float-to-int v3, v5

    .restart local v3    # "resultWidth":I
    goto :goto_0
.end method

.method public getImageURL()Ljava/lang/String;
    .locals 1

    .prologue
    .line 139
    invoke-direct {p0}, Lcom/vkontakte/android/attachments/StickerAttachment;->getUrl()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getViewForList(Landroid/content/Context;Landroid/view/View;)Landroid/view/View;
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "reuse"    # Landroid/view/View;

    .prologue
    .line 134
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/attachments/StickerAttachment;->getFullView(Landroid/content/Context;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public overrideLayoutParams()Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;
    .locals 1

    .prologue
    .line 129
    const/4 v0, 0x0

    return-object v0
.end method

.method public serializeTo(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 1
    .param p1, "p"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 73
    iget v0, p0, Lcom/vkontakte/android/attachments/StickerAttachment;->id:I

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 74
    iget-object v0, p0, Lcom/vkontakte/android/attachments/StickerAttachment;->images:[Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeStringArray([Ljava/lang/String;)V

    .line 75
    iget v0, p0, Lcom/vkontakte/android/attachments/StickerAttachment;->width:I

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 76
    iget v0, p0, Lcom/vkontakte/android/attachments/StickerAttachment;->height:I

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 77
    iget v0, p0, Lcom/vkontakte/android/attachments/StickerAttachment;->packID:I

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 78
    return-void
.end method

.method public setCallback(Lcom/vkontakte/android/attachments/StickerAttachment$Callback;)V
    .locals 0
    .param p1, "c"    # Lcom/vkontakte/android/attachments/StickerAttachment$Callback;

    .prologue
    .line 68
    iput-object p1, p0, Lcom/vkontakte/android/attachments/StickerAttachment;->callback:Lcom/vkontakte/android/attachments/StickerAttachment$Callback;

    .line 69
    return-void
.end method
