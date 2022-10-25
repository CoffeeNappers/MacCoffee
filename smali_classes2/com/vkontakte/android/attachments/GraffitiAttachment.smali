.class public Lcom/vkontakte/android/attachments/GraffitiAttachment;
.super Lcom/vkontakte/android/attachments/Attachment;
.source "GraffitiAttachment.java"

# interfaces
.implements Lcom/vkontakte/android/attachments/ImageAttachment;


# static fields
.field public static final CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/utils/Serializer$Creator",
            "<",
            "Lcom/vkontakte/android/attachments/GraffitiAttachment;",
            ">;"
        }
    .end annotation
.end field

.field public static final GRAFFITI_SIZE:I

.field private static final docToLocalFileMap:Lcom/vkontakte/android/cache/LruCache;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/cache/LruCache",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public access_key:Ljava/lang/String;

.field public height:I

.field public id:I

.field public ownerId:I

.field public url:Ljava/lang/String;

.field public width:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 25
    new-instance v0, Lcom/vkontakte/android/cache/LruCache;

    const/16 v1, 0xa

    invoke-direct {v0, v1}, Lcom/vkontakte/android/cache/LruCache;-><init>(I)V

    sput-object v0, Lcom/vkontakte/android/attachments/GraffitiAttachment;->docToLocalFileMap:Lcom/vkontakte/android/cache/LruCache;

    .line 38
    invoke-static {}, Lcom/vk/core/util/Screen;->realWidth()I

    move-result v0

    int-to-float v0, v0

    const v1, 0x3f333333    # 0.7f

    mul-float/2addr v0, v1

    float-to-int v0, v0

    sput v0, Lcom/vkontakte/android/attachments/GraffitiAttachment;->GRAFFITI_SIZE:I

    .line 75
    new-instance v0, Lcom/vkontakte/android/attachments/GraffitiAttachment$1;

    invoke-direct {v0}, Lcom/vkontakte/android/attachments/GraffitiAttachment$1;-><init>()V

    sput-object v0, Lcom/vkontakte/android/attachments/GraffitiAttachment;->CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 46
    invoke-direct {p0}, Lcom/vkontakte/android/attachments/Attachment;-><init>()V

    .line 47
    return-void
.end method

.method public constructor <init>(IILjava/lang/String;IILjava/lang/String;)V
    .locals 0
    .param p1, "id"    # I
    .param p2, "ownerId"    # I
    .param p3, "url"    # Ljava/lang/String;
    .param p4, "width"    # I
    .param p5, "height"    # I
    .param p6, "access_key"    # Ljava/lang/String;

    .prologue
    .line 57
    invoke-direct {p0}, Lcom/vkontakte/android/attachments/Attachment;-><init>()V

    .line 58
    iput p1, p0, Lcom/vkontakte/android/attachments/GraffitiAttachment;->id:I

    .line 59
    iput p2, p0, Lcom/vkontakte/android/attachments/GraffitiAttachment;->ownerId:I

    .line 60
    iput-object p3, p0, Lcom/vkontakte/android/attachments/GraffitiAttachment;->url:Ljava/lang/String;

    .line 61
    iput p4, p0, Lcom/vkontakte/android/attachments/GraffitiAttachment;->width:I

    .line 62
    iput p5, p0, Lcom/vkontakte/android/attachments/GraffitiAttachment;->height:I

    .line 63
    iput-object p6, p0, Lcom/vkontakte/android/attachments/GraffitiAttachment;->access_key:Ljava/lang/String;

    .line 64
    return-void
.end method

.method public constructor <init>(Lcom/vkontakte/android/api/Document;)V
    .locals 7
    .param p1, "doc"    # Lcom/vkontakte/android/api/Document;

    .prologue
    .line 50
    iget v1, p1, Lcom/vkontakte/android/api/Document;->did:I

    iget v2, p1, Lcom/vkontakte/android/api/Document;->oid:I

    iget-object v3, p1, Lcom/vkontakte/android/api/Document;->url:Ljava/lang/String;

    iget v4, p1, Lcom/vkontakte/android/api/Document;->width:I

    iget v5, p1, Lcom/vkontakte/android/api/Document;->height:I

    iget-object v6, p1, Lcom/vkontakte/android/api/Document;->access_key:Ljava/lang/String;

    move-object v0, p0

    invoke-direct/range {v0 .. v6}, Lcom/vkontakte/android/attachments/GraffitiAttachment;-><init>(IILjava/lang/String;IILjava/lang/String;)V

    .line 55
    return-void
.end method

.method public constructor <init>(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 1
    .param p1, "in"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 66
    invoke-direct {p0}, Lcom/vkontakte/android/attachments/Attachment;-><init>()V

    .line 67
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/attachments/GraffitiAttachment;->id:I

    .line 68
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/attachments/GraffitiAttachment;->ownerId:I

    .line 69
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/attachments/GraffitiAttachment;->url:Ljava/lang/String;

    .line 70
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/attachments/GraffitiAttachment;->width:I

    .line 71
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/attachments/GraffitiAttachment;->height:I

    .line 72
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/attachments/GraffitiAttachment;->access_key:Ljava/lang/String;

    .line 73
    return-void
.end method

.method public static get(II)Ljava/lang/String;
    .locals 3
    .param p0, "id"    # I
    .param p1, "ownerId"    # I

    .prologue
    .line 35
    sget-object v0, Lcom/vkontakte/android/attachments/GraffitiAttachment;->docToLocalFileMap:Lcom/vkontakte/android/cache/LruCache;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/cache/LruCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method static synthetic lambda$getFullView$0(Landroid/view/View;)V
    .locals 0
    .param p0, "v"    # Landroid/view/View;

    .prologue
    .line 133
    return-void
.end method

.method public static put(IILjava/lang/String;)V
    .locals 3
    .param p0, "id"    # I
    .param p1, "ownerId"    # I
    .param p2, "path"    # Ljava/lang/String;

    .prologue
    .line 28
    const-string/jumbo v0, "file://"

    invoke-virtual {p2, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 29
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "file://"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 31
    :cond_0
    sget-object v0, Lcom/vkontakte/android/attachments/GraffitiAttachment;->docToLocalFileMap:Lcom/vkontakte/android/cache/LruCache;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, p2}, Lcom/vkontakte/android/cache/LruCache;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 32
    return-void
.end method


# virtual methods
.method public bind(Landroid/view/View;)V
    .locals 5
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 155
    iget v1, p0, Lcom/vkontakte/android/attachments/GraffitiAttachment;->id:I

    iget v2, p0, Lcom/vkontakte/android/attachments/GraffitiAttachment;->ownerId:I

    invoke-static {v1, v2}, Lcom/vkontakte/android/attachments/GraffitiAttachment;->get(II)Ljava/lang/String;

    move-result-object v0

    .line 156
    .local v0, "local":Ljava/lang/String;
    if-nez v0, :cond_0

    .line 157
    check-cast p1, Lcom/vk/imageloader/view/VKImageView;

    .end local p1    # "view":Landroid/view/View;
    iget-object v1, p0, Lcom/vkontakte/android/attachments/GraffitiAttachment;->url:Ljava/lang/String;

    sget-object v2, Lcom/vk/imageloader/ImageSize;->MID:Lcom/vk/imageloader/ImageSize;

    invoke-virtual {p1, v1, v2}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;Lcom/vk/imageloader/ImageSize;)V

    .line 161
    :goto_0
    return-void

    .line 159
    .restart local p1    # "view":Landroid/view/View;
    :cond_0
    check-cast p1, Lcom/vk/imageloader/view/VKImageView;

    .end local p1    # "view":Landroid/view/View;
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    sget-object v2, Lcom/vk/imageloader/ImageSize;->MID:Lcom/vk/imageloader/ImageSize;

    iget-object v3, p0, Lcom/vkontakte/android/attachments/GraffitiAttachment;->url:Ljava/lang/String;

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    sget-object v4, Lcom/vk/imageloader/ImageSize;->MID:Lcom/vk/imageloader/ImageSize;

    invoke-virtual {p1, v1, v2, v3, v4}, Lcom/vk/imageloader/view/VKImageView;->load(Landroid/net/Uri;Lcom/vk/imageloader/ImageSize;Landroid/net/Uri;Lcom/vk/imageloader/ImageSize;)V

    goto :goto_0
.end method

.method public getFullView(Landroid/content/Context;)Landroid/view/View;
    .locals 11
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/high16 v10, 0x41000000    # 8.0f

    .line 103
    new-instance v1, Lcom/vk/imageloader/view/VKImageView;

    invoke-direct {v1, p1}, Lcom/vk/imageloader/view/VKImageView;-><init>(Landroid/content/Context;)V

    .line 104
    .local v1, "iv":Lcom/vk/imageloader/view/VKImageView;
    iget v6, p0, Lcom/vkontakte/android/attachments/GraffitiAttachment;->width:I

    .line 105
    .local v6, "width":I
    iget v0, p0, Lcom/vkontakte/android/attachments/GraffitiAttachment;->height:I

    .line 108
    .local v0, "height":I
    sget v7, Lcom/vkontakte/android/attachments/GraffitiAttachment;->GRAFFITI_SIZE:I

    if-ge v6, v7, :cond_2

    sget v7, Lcom/vkontakte/android/attachments/GraffitiAttachment;->GRAFFITI_SIZE:I

    if-ge v0, v7, :cond_2

    .line 109
    const v7, 0x3fd9999a    # 1.7f

    sget v8, Lcom/vkontakte/android/attachments/GraffitiAttachment;->GRAFFITI_SIZE:I

    int-to-float v8, v8

    invoke-static {v6, v0}, Ljava/lang/Math;->max(II)I

    move-result v9

    int-to-float v9, v9

    div-float/2addr v8, v9

    invoke-static {v7, v8}, Ljava/lang/Math;->min(FF)F

    move-result v4

    .line 110
    .local v4, "scale":F
    invoke-static {v6, v0}, Ljava/lang/Math;->max(II)I

    move-result v7

    int-to-float v7, v7

    mul-float/2addr v7, v4

    float-to-int v5, v7

    .line 115
    .end local v4    # "scale":F
    .local v5, "viewSize":I
    :goto_0
    if-eqz v6, :cond_0

    if-nez v0, :cond_1

    .line 116
    :cond_0
    move v0, v5

    move v6, v5

    .line 121
    :cond_1
    if-le v6, v0, :cond_3

    .line 122
    move v3, v5

    .line 123
    .local v3, "resultWidth":I
    mul-int v7, v3, v0

    int-to-float v7, v7

    int-to-float v8, v6

    div-float/2addr v7, v8

    float-to-int v2, v7

    .line 128
    .local v2, "resultHeight":I
    :goto_1
    invoke-static {v10}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v7

    add-int/2addr v7, v2

    invoke-virtual {v1, v3, v7}, Lcom/vk/imageloader/view/VKImageView;->setFixedSize(II)V

    .line 129
    const v7, 0x7f0203c7

    invoke-virtual {v1, v7}, Lcom/vk/imageloader/view/VKImageView;->setPlaceholderImage(I)V

    .line 130
    sget-object v7, Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;->FIT_START:Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;

    invoke-virtual {v1, v7}, Lcom/vk/imageloader/view/VKImageView;->setActualScaleType(Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;)V

    .line 131
    sget v7, Lcom/vkontakte/android/attachments/GraffitiAttachment;->GRAFFITI_SIZE:I

    invoke-virtual {v1, v7}, Lcom/vk/imageloader/view/VKImageView;->setMaxWidth(I)V

    .line 132
    sget v7, Lcom/vkontakte/android/attachments/GraffitiAttachment;->GRAFFITI_SIZE:I

    invoke-static {v10}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v8

    add-int/2addr v7, v8

    invoke-virtual {v1, v7}, Lcom/vk/imageloader/view/VKImageView;->setMaxHeight(I)V

    .line 133
    invoke-static {}, Lcom/vkontakte/android/attachments/GraffitiAttachment$$Lambda$1;->lambdaFactory$()Landroid/view/View$OnClickListener;

    move-result-object v7

    invoke-virtual {v1, v7}, Lcom/vk/imageloader/view/VKImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 134
    return-object v1

    .line 112
    .end local v2    # "resultHeight":I
    .end local v3    # "resultWidth":I
    .end local v5    # "viewSize":I
    :cond_2
    sget v5, Lcom/vkontakte/android/attachments/GraffitiAttachment;->GRAFFITI_SIZE:I

    .restart local v5    # "viewSize":I
    goto :goto_0

    .line 125
    :cond_3
    move v2, v5

    .line 126
    .restart local v2    # "resultHeight":I
    mul-int v7, v2, v6

    int-to-float v7, v7

    int-to-float v8, v0

    div-float/2addr v7, v8

    float-to-int v3, v7

    .restart local v3    # "resultWidth":I
    goto :goto_1
.end method

.method public getImageURL()Ljava/lang/String;
    .locals 1

    .prologue
    .line 150
    iget-object v0, p0, Lcom/vkontakte/android/attachments/GraffitiAttachment;->url:Ljava/lang/String;

    return-object v0
.end method

.method public getViewForList(Landroid/content/Context;Landroid/view/View;)Landroid/view/View;
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "reuse"    # Landroid/view/View;

    .prologue
    .line 145
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/attachments/GraffitiAttachment;->getFullView(Landroid/content/Context;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public overrideLayoutParams()Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;
    .locals 1

    .prologue
    .line 140
    const/4 v0, 0x0

    return-object v0
.end method

.method public serializeTo(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 1
    .param p1, "p"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 93
    iget v0, p0, Lcom/vkontakte/android/attachments/GraffitiAttachment;->id:I

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 94
    iget v0, p0, Lcom/vkontakte/android/attachments/GraffitiAttachment;->ownerId:I

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 95
    iget-object v0, p0, Lcom/vkontakte/android/attachments/GraffitiAttachment;->url:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 96
    iget v0, p0, Lcom/vkontakte/android/attachments/GraffitiAttachment;->width:I

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 97
    iget v0, p0, Lcom/vkontakte/android/attachments/GraffitiAttachment;->height:I

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 98
    iget-object v0, p0, Lcom/vkontakte/android/attachments/GraffitiAttachment;->access_key:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 99
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 88
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "doc"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/vkontakte/android/attachments/GraffitiAttachment;->ownerId:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/vkontakte/android/attachments/GraffitiAttachment;->id:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v0, p0, Lcom/vkontakte/android/attachments/GraffitiAttachment;->access_key:Ljava/lang/String;

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "_"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, p0, Lcom/vkontakte/android/attachments/GraffitiAttachment;->access_key:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_0
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    const-string/jumbo v0, ""

    goto :goto_0
.end method
