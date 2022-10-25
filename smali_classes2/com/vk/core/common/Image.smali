.class public Lcom/vk/core/common/Image;
.super Ljava/lang/Object;
.source "Image.java"

# interfaces
.implements Lcom/vkontakte/android/utils/Serializer$Serializable;


# static fields
.field public static final CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/utils/Serializer$Creator",
            "<",
            "Lcom/vk/core/common/Image;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final images:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/vk/core/common/ImageSize;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 87
    new-instance v0, Lcom/vk/core/common/Image$1;

    invoke-direct {v0}, Lcom/vk/core/common/Image$1;-><init>()V

    sput-object v0, Lcom/vk/core/common/Image;->CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;

    return-void
.end method

.method public constructor <init>(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 1
    .param p1, "image"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    sget-object v0, Lcom/vk/core/common/ImageSize;->CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->createTypedArrayList(Lcom/vkontakte/android/utils/Serializer$Creator;)Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/core/common/Image;->images:Ljava/util/List;

    .line 29
    return-void
.end method

.method public constructor <init>(Lorg/json/JSONArray;)V
    .locals 4
    .param p1, "data"    # Lorg/json/JSONArray;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lcom/vk/core/common/Image;->images:Ljava/util/List;

    .line 19
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-eqz p1, :cond_1

    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-ge v0, v2, :cond_1

    .line 20
    invoke-virtual {p1, v0}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v1

    .line 21
    .local v1, "size":Lorg/json/JSONObject;
    if-eqz v1, :cond_0

    .line 22
    iget-object v2, p0, Lcom/vk/core/common/Image;->images:Ljava/util/List;

    new-instance v3, Lcom/vk/core/common/ImageSize;

    invoke-direct {v3, v1}, Lcom/vk/core/common/ImageSize;-><init>(Lorg/json/JSONObject;)V

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 19
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 25
    .end local v1    # "size":Lorg/json/JSONObject;
    :cond_1
    return-void
.end method

.method private getImageBySize(IZ)Lcom/vk/core/common/ImageSize;
    .locals 12
    .param p1, "size"    # I
    .param p2, "byWidth"    # Z

    .prologue
    .line 46
    iget-object v8, p0, Lcom/vk/core/common/Image;->images:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v0

    .line 47
    .local v0, "count":I
    if-nez v0, :cond_0

    .line 48
    const/4 v8, 0x0

    .line 67
    :goto_0
    return-object v8

    .line 49
    :cond_0
    const/4 v8, 0x1

    if-ne v0, v8, :cond_1

    .line 50
    iget-object v8, p0, Lcom/vk/core/common/Image;->images:Ljava/util/List;

    const/4 v9, 0x0

    invoke-interface {v8, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/vk/core/common/ImageSize;

    goto :goto_0

    .line 52
    :cond_1
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_1
    add-int/lit8 v8, v0, -0x1

    if-ge v5, v8, :cond_6

    .line 53
    iget-object v8, p0, Lcom/vk/core/common/Image;->images:Ljava/util/List;

    invoke-interface {v8, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/vk/core/common/ImageSize;

    .line 54
    .local v6, "size1":Lcom/vk/core/common/ImageSize;
    iget-object v8, p0, Lcom/vk/core/common/Image;->images:Ljava/util/List;

    add-int/lit8 v9, v5, 0x1

    invoke-interface {v8, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/vk/core/common/ImageSize;

    .line 55
    .local v7, "size2":Lcom/vk/core/common/ImageSize;
    if-eqz p2, :cond_2

    invoke-virtual {v6}, Lcom/vk/core/common/ImageSize;->getWidth()I

    move-result v3

    .line 56
    .local v3, "edge1":I
    :goto_2
    if-eqz p2, :cond_3

    invoke-virtual {v7}, Lcom/vk/core/common/ImageSize;->getWidth()I

    move-result v4

    .line 57
    .local v4, "edge2":I
    :goto_3
    sub-int v8, v3, p1

    invoke-static {v8}, Ljava/lang/Math;->abs(I)I

    move-result v1

    .line 58
    .local v1, "diff1":I
    sub-int v8, v4, p1

    invoke-static {v8}, Ljava/lang/Math;->abs(I)I

    move-result v2

    .line 59
    .local v2, "diff2":I
    if-ge v1, v2, :cond_5

    .line 60
    int-to-float v8, v1

    int-to-float v9, p1

    div-float/2addr v8, v9

    float-to-double v8, v8

    const-wide v10, 0x3fa999999999999aL    # 0.05

    cmpg-double v8, v8, v10

    if-gez v8, :cond_4

    move-object v8, v6

    .line 61
    goto :goto_0

    .line 55
    .end local v1    # "diff1":I
    .end local v2    # "diff2":I
    .end local v3    # "edge1":I
    .end local v4    # "edge2":I
    :cond_2
    invoke-virtual {v6}, Lcom/vk/core/common/ImageSize;->getHeight()I

    move-result v3

    goto :goto_2

    .line 56
    .restart local v3    # "edge1":I
    :cond_3
    invoke-virtual {v7}, Lcom/vk/core/common/ImageSize;->getHeight()I

    move-result v4

    goto :goto_3

    .restart local v1    # "diff1":I
    .restart local v2    # "diff2":I
    .restart local v4    # "edge2":I
    :cond_4
    move-object v8, v7

    .line 63
    goto :goto_0

    .line 52
    :cond_5
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 67
    .end local v1    # "diff1":I
    .end local v2    # "diff2":I
    .end local v3    # "edge1":I
    .end local v4    # "edge2":I
    .end local v6    # "size1":Lcom/vk/core/common/ImageSize;
    .end local v7    # "size2":Lcom/vk/core/common/ImageSize;
    :cond_6
    iget-object v8, p0, Lcom/vk/core/common/Image;->images:Ljava/util/List;

    add-int/lit8 v9, v0, -0x1

    invoke-interface {v8, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/vk/core/common/ImageSize;

    goto :goto_0
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .prologue
    .line 73
    const/4 v0, 0x0

    return v0
.end method

.method public getImageByHeight(I)Lcom/vk/core/common/ImageSize;
    .locals 1
    .param p1, "height"    # I
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 37
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/vk/core/common/Image;->getImageBySize(IZ)Lcom/vk/core/common/ImageSize;

    move-result-object v0

    return-object v0
.end method

.method public getImageByWidth(I)Lcom/vk/core/common/ImageSize;
    .locals 1
    .param p1, "width"    # I
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 42
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lcom/vk/core/common/Image;->getImageBySize(IZ)Lcom/vk/core/common/ImageSize;

    move-result-object v0

    return-object v0
.end method

.method public isEmpty()Z
    .locals 1

    .prologue
    .line 32
    iget-object v0, p0, Lcom/vk/core/common/Image;->images:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public serializeTo(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 1
    .param p1, "s"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 78
    iget-object v0, p0, Lcom/vk/core/common/Image;->images:Ljava/util/List;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeTypedList(Ljava/util/List;)V

    .line 79
    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 83
    iget-object v0, p0, Lcom/vk/core/common/Image;->images:Ljava/util/List;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeTypedList(Ljava/util/List;)V

    .line 84
    return-void
.end method
