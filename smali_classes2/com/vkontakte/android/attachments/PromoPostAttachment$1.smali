.class final Lcom/vkontakte/android/attachments/PromoPostAttachment$1;
.super Lcom/vkontakte/android/utils/Serializer$CreatorAdapter;
.source "PromoPostAttachment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/attachments/PromoPostAttachment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/utils/Serializer$CreatorAdapter",
        "<",
        "Lcom/vkontakte/android/attachments/PromoPostAttachment;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 13
    invoke-direct {p0}, Lcom/vkontakte/android/utils/Serializer$CreatorAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public createFromSerializer(Lcom/vkontakte/android/utils/Serializer;)Lcom/vkontakte/android/attachments/PromoPostAttachment;
    .locals 4
    .param p1, "in"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 16
    const-class v1, Lcom/vkontakte/android/NewsEntry;

    invoke-virtual {v1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    invoke-virtual {p1, v1}, Lcom/vkontakte/android/utils/Serializer;->readSerializable(Ljava/lang/ClassLoader;)Lcom/vkontakte/android/utils/Serializer$Serializable;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/NewsEntry;

    .line 17
    .local v0, "post":Lcom/vkontakte/android/NewsEntry;
    const-string/jumbo v1, "vk"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "read from parcel "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    new-instance v1, Lcom/vkontakte/android/attachments/PromoPostAttachment;

    invoke-direct {v1, v0}, Lcom/vkontakte/android/attachments/PromoPostAttachment;-><init>(Lcom/vkontakte/android/NewsEntry;)V

    return-object v1
.end method

.method public bridge synthetic createFromSerializer(Lcom/vkontakte/android/utils/Serializer;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 13
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/attachments/PromoPostAttachment$1;->createFromSerializer(Lcom/vkontakte/android/utils/Serializer;)Lcom/vkontakte/android/attachments/PromoPostAttachment;

    move-result-object v0

    return-object v0
.end method

.method public newArray(I)[Lcom/vkontakte/android/attachments/PromoPostAttachment;
    .locals 1
    .param p1, "size"    # I

    .prologue
    .line 22
    new-array v0, p1, [Lcom/vkontakte/android/attachments/PromoPostAttachment;

    return-object v0
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .locals 1

    .prologue
    .line 13
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/attachments/PromoPostAttachment$1;->newArray(I)[Lcom/vkontakte/android/attachments/PromoPostAttachment;

    move-result-object v0

    return-object v0
.end method
