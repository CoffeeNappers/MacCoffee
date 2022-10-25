.class final Lcom/vkontakte/android/attachments/MoneyTransferAttachment$1;
.super Lcom/vkontakte/android/utils/Serializer$CreatorAdapter;
.source "MoneyTransferAttachment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/attachments/MoneyTransferAttachment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/utils/Serializer$CreatorAdapter",
        "<",
        "Lcom/vkontakte/android/attachments/MoneyTransferAttachment;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 108
    invoke-direct {p0}, Lcom/vkontakte/android/utils/Serializer$CreatorAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public createFromSerializer(Lcom/vkontakte/android/utils/Serializer;)Lcom/vkontakte/android/attachments/MoneyTransferAttachment;
    .locals 6
    .param p1, "s"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 111
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v1

    .line 112
    .local v1, "id":I
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v2

    .line 113
    .local v2, "fromId":I
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v3

    .line 114
    .local v3, "toId":I
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v4

    .line 115
    .local v4, "title":Ljava/lang/String;
    new-instance v0, Lcom/vkontakte/android/attachments/MoneyTransferAttachment;

    const/4 v5, 0x0

    invoke-direct/range {v0 .. v5}, Lcom/vkontakte/android/attachments/MoneyTransferAttachment;-><init>(IIILjava/lang/String;Lcom/vkontakte/android/attachments/MoneyTransferAttachment$1;)V

    return-object v0
.end method

.method public bridge synthetic createFromSerializer(Lcom/vkontakte/android/utils/Serializer;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 108
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/attachments/MoneyTransferAttachment$1;->createFromSerializer(Lcom/vkontakte/android/utils/Serializer;)Lcom/vkontakte/android/attachments/MoneyTransferAttachment;

    move-result-object v0

    return-object v0
.end method

.method public newArray(I)[Lcom/vkontakte/android/attachments/MoneyTransferAttachment;
    .locals 1
    .param p1, "i"    # I

    .prologue
    .line 120
    new-array v0, p1, [Lcom/vkontakte/android/attachments/MoneyTransferAttachment;

    return-object v0
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .locals 1

    .prologue
    .line 108
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/attachments/MoneyTransferAttachment$1;->newArray(I)[Lcom/vkontakte/android/attachments/MoneyTransferAttachment;

    move-result-object v0

    return-object v0
.end method
