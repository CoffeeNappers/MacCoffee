.class final Lcom/vkontakte/android/attachments/PhotoAttachment$1;
.super Lcom/vkontakte/android/utils/Serializer$CreatorAdapter;
.source "PhotoAttachment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/attachments/PhotoAttachment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/utils/Serializer$CreatorAdapter",
        "<",
        "Lcom/vkontakte/android/attachments/PhotoAttachment;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 128
    invoke-direct {p0}, Lcom/vkontakte/android/utils/Serializer$CreatorAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public createFromSerializer(Lcom/vkontakte/android/utils/Serializer;)Lcom/vkontakte/android/attachments/PhotoAttachment;
    .locals 16
    .param p1, "in"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 131
    invoke-virtual/range {p1 .. p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v15

    .line 132
    .local v15, "nImgs":I
    new-array v1, v15, [Lcom/vkontakte/android/attachments/PhotoAttachment$Image;

    .line 133
    .local v1, "imgs":[Lcom/vkontakte/android/attachments/PhotoAttachment$Image;
    const/4 v14, 0x0

    .local v14, "i":I
    :goto_0
    if-ge v14, v15, :cond_0

    .line 134
    new-instance v0, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;

    invoke-virtual/range {p1 .. p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v2

    int-to-char v2, v2

    invoke-virtual/range {p1 .. p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual/range {p1 .. p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v4

    invoke-virtual/range {p1 .. p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v5

    invoke-direct {v0, v2, v3, v4, v5}, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;-><init>(CLjava/lang/String;II)V

    aput-object v0, v1, v14

    .line 133
    add-int/lit8 v14, v14, 0x1

    goto :goto_0

    .line 136
    :cond_0
    new-instance v0, Lcom/vkontakte/android/attachments/PhotoAttachment;

    invoke-virtual/range {p1 .. p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v2

    invoke-virtual/range {p1 .. p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v3

    invoke-virtual/range {p1 .. p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v4

    invoke-virtual/range {p1 .. p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual/range {p1 .. p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v6

    invoke-virtual/range {p1 .. p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v7

    invoke-virtual/range {p1 .. p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual/range {p1 .. p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v9

    invoke-virtual/range {p1 .. p1}, Lcom/vkontakte/android/utils/Serializer;->readDouble()D

    move-result-wide v10

    invoke-virtual/range {p1 .. p1}, Lcom/vkontakte/android/utils/Serializer;->readDouble()D

    move-result-wide v12

    invoke-direct/range {v0 .. v13}, Lcom/vkontakte/android/attachments/PhotoAttachment;-><init>([Lcom/vkontakte/android/attachments/PhotoAttachment$Image;IIILjava/lang/String;IILjava/lang/String;IDD)V

    return-object v0
.end method

.method public bridge synthetic createFromSerializer(Lcom/vkontakte/android/utils/Serializer;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 128
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/attachments/PhotoAttachment$1;->createFromSerializer(Lcom/vkontakte/android/utils/Serializer;)Lcom/vkontakte/android/attachments/PhotoAttachment;

    move-result-object v0

    return-object v0
.end method

.method public newArray(I)[Lcom/vkontakte/android/attachments/PhotoAttachment;
    .locals 1
    .param p1, "size"    # I

    .prologue
    .line 140
    new-array v0, p1, [Lcom/vkontakte/android/attachments/PhotoAttachment;

    return-object v0
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .locals 1

    .prologue
    .line 128
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/attachments/PhotoAttachment$1;->newArray(I)[Lcom/vkontakte/android/attachments/PhotoAttachment;

    move-result-object v0

    return-object v0
.end method
