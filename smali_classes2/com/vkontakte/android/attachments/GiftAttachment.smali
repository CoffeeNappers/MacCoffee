.class public Lcom/vkontakte/android/attachments/GiftAttachment;
.super Lcom/vkontakte/android/attachments/Attachment;
.source "GiftAttachment.java"

# interfaces
.implements Lcom/vkontakte/android/attachments/ImageAttachment;


# static fields
.field public static final CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/utils/Serializer$Creator",
            "<",
            "Lcom/vkontakte/android/attachments/GiftAttachment;",
            ">;"
        }
    .end annotation
.end field

.field private static final SIZE:I = 0x160


# instance fields
.field private callback:Lcom/vkontakte/android/attachments/StickerAttachment$Callback;

.field public id:I

.field public images:[Ljava/lang/String;

.field public packID:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 49
    new-instance v0, Lcom/vkontakte/android/attachments/GiftAttachment$1;

    invoke-direct {v0}, Lcom/vkontakte/android/attachments/GiftAttachment$1;-><init>()V

    sput-object v0, Lcom/vkontakte/android/attachments/GiftAttachment;->CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 33
    invoke-direct {p0}, Lcom/vkontakte/android/attachments/Attachment;-><init>()V

    .line 35
    return-void
.end method

.method public constructor <init>(I[Ljava/lang/String;I)V
    .locals 0
    .param p1, "_id"    # I
    .param p2, "_images"    # [Ljava/lang/String;
    .param p3, "pack"    # I

    .prologue
    .line 37
    invoke-direct {p0}, Lcom/vkontakte/android/attachments/Attachment;-><init>()V

    .line 38
    iput p1, p0, Lcom/vkontakte/android/attachments/GiftAttachment;->id:I

    .line 39
    iput-object p2, p0, Lcom/vkontakte/android/attachments/GiftAttachment;->images:[Ljava/lang/String;

    .line 40
    iput p3, p0, Lcom/vkontakte/android/attachments/GiftAttachment;->packID:I

    .line 41
    return-void
.end method

.method public constructor <init>(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 1
    .param p1, "in"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 43
    invoke-direct {p0}, Lcom/vkontakte/android/attachments/Attachment;-><init>()V

    .line 44
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/attachments/GiftAttachment;->id:I

    .line 45
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->createStringArray()[Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/attachments/GiftAttachment;->images:[Ljava/lang/String;

    .line 46
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/attachments/GiftAttachment;->packID:I

    .line 47
    return-void
.end method


# virtual methods
.method public bind(Landroid/view/View;)V
    .locals 1
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 133
    check-cast p1, Lcom/vk/imageloader/view/VKImageView;

    .end local p1    # "view":Landroid/view/View;
    invoke-virtual {p0}, Lcom/vkontakte/android/attachments/GiftAttachment;->getImageURL()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    .line 134
    return-void
.end method

.method public getFullView(Landroid/content/Context;)Landroid/view/View;
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 77
    new-instance v0, Lcom/vkontakte/android/attachments/GiftAttachment$2;

    invoke-direct {v0, p0, p1}, Lcom/vkontakte/android/attachments/GiftAttachment$2;-><init>(Lcom/vkontakte/android/attachments/GiftAttachment;Landroid/content/Context;)V

    .line 82
    .local v0, "iv":Lcom/vk/imageloader/view/VKImageView;
    const v1, 0x7f0203c7

    invoke-virtual {v0, v1}, Lcom/vk/imageloader/view/VKImageView;->setPlaceholderImage(I)V

    .line 83
    sget-object v1, Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;->FIT_START:Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;

    invoke-virtual {v0, v1}, Lcom/vk/imageloader/view/VKImageView;->setActualScaleType(Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;)V

    .line 84
    iget v1, p0, Lcom/vkontakte/android/attachments/GiftAttachment;->packID:I

    if-eqz v1, :cond_0

    .line 85
    invoke-static {p0, p1}, Lcom/vkontakte/android/attachments/GiftAttachment$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/attachments/GiftAttachment;Landroid/content/Context;)Landroid/view/View$OnClickListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/imageloader/view/VKImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 108
    :goto_0
    return-object v0

    .line 99
    :cond_0
    new-instance v1, Lcom/vkontakte/android/attachments/GiftAttachment$3;

    invoke-direct {v1, p0, p1}, Lcom/vkontakte/android/attachments/GiftAttachment$3;-><init>(Lcom/vkontakte/android/attachments/GiftAttachment;Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Lcom/vk/imageloader/view/VKImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_0
.end method

.method public getImageURL()Ljava/lang/String;
    .locals 3

    .prologue
    .line 127
    sget v1, Lcom/vkontakte/android/Global;->displayDensity:F

    const/high16 v2, 0x3f800000    # 1.0f

    cmpl-float v1, v1, v2

    if-lez v1, :cond_0

    const/4 v0, 0x2

    .line 128
    .local v0, "stickerSize":I
    :goto_0
    iget-object v1, p0, Lcom/vkontakte/android/attachments/GiftAttachment;->images:[Ljava/lang/String;

    aget-object v1, v1, v0

    return-object v1

    .line 127
    .end local v0    # "stickerSize":I
    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public getViewForList(Landroid/content/Context;Landroid/view/View;)Landroid/view/View;
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "reuse"    # Landroid/view/View;

    .prologue
    .line 122
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/attachments/GiftAttachment;->getFullView(Landroid/content/Context;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public hasPackId()Z
    .locals 1

    .prologue
    .line 72
    iget v0, p0, Lcom/vkontakte/android/attachments/GiftAttachment;->packID:I

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method synthetic lambda$getFullView$0(Landroid/content/Context;Landroid/view/View;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "v"    # Landroid/view/View;

    .prologue
    .line 86
    invoke-static {}, Lcom/vkontakte/android/stickers/Stickers;->get()Lcom/vkontakte/android/stickers/Stickers;

    move-result-object v1

    iget v2, p0, Lcom/vkontakte/android/attachments/GiftAttachment;->packID:I

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/stickers/Stickers;->getById(I)Lcom/vkontakte/android/data/orm/StickerStockItem;

    move-result-object v0

    .line 87
    .local v0, "item":Lcom/vkontakte/android/data/orm/StickerStockItem;
    if-eqz v0, :cond_1

    iget-boolean v1, v0, Lcom/vkontakte/android/data/orm/StickerStockItem;->active:Z

    if-nez v1, :cond_0

    iget-boolean v1, v0, Lcom/vkontakte/android/data/orm/StickerStockItem;->promoted:Z

    if-eqz v1, :cond_1

    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/attachments/GiftAttachment;->callback:Lcom/vkontakte/android/attachments/StickerAttachment$Callback;

    if-eqz v1, :cond_1

    .line 88
    iget-object v1, p0, Lcom/vkontakte/android/attachments/GiftAttachment;->callback:Lcom/vkontakte/android/attachments/StickerAttachment$Callback;

    iget v2, p0, Lcom/vkontakte/android/attachments/GiftAttachment;->packID:I

    invoke-interface {v1, v2}, Lcom/vkontakte/android/attachments/StickerAttachment$Callback;->openStickerKeyboard(I)V

    .line 97
    :goto_0
    return-void

    .line 90
    :cond_1
    if-nez v0, :cond_2

    .line 91
    iget v1, p0, Lcom/vkontakte/android/attachments/GiftAttachment;->packID:I

    const-string/jumbo v2, "message"

    invoke-static {v1, v2, p1}, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;->show(ILjava/lang/String;Landroid/content/Context;)V

    goto :goto_0

    .line 93
    :cond_2
    const-string/jumbo v1, "message"

    iput-object v1, v0, Lcom/vkontakte/android/data/orm/StickerStockItem;->referrer:Ljava/lang/String;

    .line 94
    invoke-static {v0, p1}, Lcom/vkontakte/android/fragments/stickers/StickersDetailsFragment;->show(Lcom/vkontakte/android/data/orm/StickerStockItem;Landroid/content/Context;)V

    goto :goto_0
.end method

.method public overrideLayoutParams()Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;
    .locals 1

    .prologue
    .line 117
    const/4 v0, 0x0

    return-object v0
.end method

.method public serializeTo(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 1
    .param p1, "s"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 66
    iget v0, p0, Lcom/vkontakte/android/attachments/GiftAttachment;->id:I

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 67
    iget-object v0, p0, Lcom/vkontakte/android/attachments/GiftAttachment;->images:[Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeStringArray([Ljava/lang/String;)V

    .line 68
    iget v0, p0, Lcom/vkontakte/android/attachments/GiftAttachment;->packID:I

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 69
    return-void
.end method

.method public setCallback(Lcom/vkontakte/android/attachments/StickerAttachment$Callback;)V
    .locals 0
    .param p1, "c"    # Lcom/vkontakte/android/attachments/StickerAttachment$Callback;

    .prologue
    .line 61
    iput-object p1, p0, Lcom/vkontakte/android/attachments/GiftAttachment;->callback:Lcom/vkontakte/android/attachments/StickerAttachment$Callback;

    .line 62
    return-void
.end method
