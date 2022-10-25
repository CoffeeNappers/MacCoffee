.class final Lcom/vkontakte/android/attachments/GiftAttachment$1;
.super Lcom/vkontakte/android/utils/Serializer$CreatorAdapter;
.source "GiftAttachment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/attachments/GiftAttachment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/utils/Serializer$CreatorAdapter",
        "<",
        "Lcom/vkontakte/android/attachments/GiftAttachment;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 49
    invoke-direct {p0}, Lcom/vkontakte/android/utils/Serializer$CreatorAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public createFromSerializer(Lcom/vkontakte/android/utils/Serializer;)Lcom/vkontakte/android/attachments/GiftAttachment;
    .locals 1
    .param p1, "in"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 52
    new-instance v0, Lcom/vkontakte/android/attachments/GiftAttachment;

    invoke-direct {v0, p1}, Lcom/vkontakte/android/attachments/GiftAttachment;-><init>(Lcom/vkontakte/android/utils/Serializer;)V

    return-object v0
.end method

.method public bridge synthetic createFromSerializer(Lcom/vkontakte/android/utils/Serializer;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 49
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/attachments/GiftAttachment$1;->createFromSerializer(Lcom/vkontakte/android/utils/Serializer;)Lcom/vkontakte/android/attachments/GiftAttachment;

    move-result-object v0

    return-object v0
.end method

.method public newArray(I)[Lcom/vkontakte/android/attachments/GiftAttachment;
    .locals 1
    .param p1, "size"    # I

    .prologue
    .line 56
    new-array v0, p1, [Lcom/vkontakte/android/attachments/GiftAttachment;

    return-object v0
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .locals 1

    .prologue
    .line 49
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/attachments/GiftAttachment$1;->newArray(I)[Lcom/vkontakte/android/attachments/GiftAttachment;

    move-result-object v0

    return-object v0
.end method
