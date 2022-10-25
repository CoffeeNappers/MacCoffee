.class final Lcom/vkontakte/android/attachments/SignatureLinkAttachment$1;
.super Lcom/vkontakte/android/utils/Serializer$CreatorAdapter;
.source "SignatureLinkAttachment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/attachments/SignatureLinkAttachment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/utils/Serializer$CreatorAdapter",
        "<",
        "Lcom/vkontakte/android/attachments/SignatureLinkAttachment;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 39
    invoke-direct {p0}, Lcom/vkontakte/android/utils/Serializer$CreatorAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public createFromSerializer(Lcom/vkontakte/android/utils/Serializer;)Lcom/vkontakte/android/attachments/SignatureLinkAttachment;
    .locals 3
    .param p1, "in"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 42
    new-instance v0, Lcom/vkontakte/android/attachments/SignatureLinkAttachment;

    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/attachments/SignatureLinkAttachment;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public bridge synthetic createFromSerializer(Lcom/vkontakte/android/utils/Serializer;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 39
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/attachments/SignatureLinkAttachment$1;->createFromSerializer(Lcom/vkontakte/android/utils/Serializer;)Lcom/vkontakte/android/attachments/SignatureLinkAttachment;

    move-result-object v0

    return-object v0
.end method

.method public newArray(I)[Lcom/vkontakte/android/attachments/SignatureLinkAttachment;
    .locals 1
    .param p1, "size"    # I

    .prologue
    .line 46
    new-array v0, p1, [Lcom/vkontakte/android/attachments/SignatureLinkAttachment;

    return-object v0
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .locals 1

    .prologue
    .line 39
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/attachments/SignatureLinkAttachment$1;->newArray(I)[Lcom/vkontakte/android/attachments/SignatureLinkAttachment;

    move-result-object v0

    return-object v0
.end method
