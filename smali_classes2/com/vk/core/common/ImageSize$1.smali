.class final Lcom/vk/core/common/ImageSize$1;
.super Lcom/vkontakte/android/utils/Serializer$CreatorAdapter;
.source "ImageSize.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/core/common/ImageSize;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/utils/Serializer$CreatorAdapter",
        "<",
        "Lcom/vk/core/common/ImageSize;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 62
    invoke-direct {p0}, Lcom/vkontakte/android/utils/Serializer$CreatorAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public createFromSerializer(Lcom/vkontakte/android/utils/Serializer;)Lcom/vk/core/common/ImageSize;
    .locals 1
    .param p1, "in"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 65
    new-instance v0, Lcom/vk/core/common/ImageSize;

    invoke-direct {v0, p1}, Lcom/vk/core/common/ImageSize;-><init>(Lcom/vkontakte/android/utils/Serializer;)V

    return-object v0
.end method

.method public bridge synthetic createFromSerializer(Lcom/vkontakte/android/utils/Serializer;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 62
    invoke-virtual {p0, p1}, Lcom/vk/core/common/ImageSize$1;->createFromSerializer(Lcom/vkontakte/android/utils/Serializer;)Lcom/vk/core/common/ImageSize;

    move-result-object v0

    return-object v0
.end method

.method public newArray(I)[Lcom/vk/core/common/ImageSize;
    .locals 1
    .param p1, "size"    # I

    .prologue
    .line 69
    new-array v0, p1, [Lcom/vk/core/common/ImageSize;

    return-object v0
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .locals 1

    .prologue
    .line 62
    invoke-virtual {p0, p1}, Lcom/vk/core/common/ImageSize$1;->newArray(I)[Lcom/vk/core/common/ImageSize;

    move-result-object v0

    return-object v0
.end method
