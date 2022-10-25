.class final Lcom/vkontakte/android/attachments/AlbumAttachment$3;
.super Lcom/vkontakte/android/utils/Serializer$CreatorAdapter;
.source "AlbumAttachment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/attachments/AlbumAttachment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/utils/Serializer$CreatorAdapter",
        "<",
        "Lcom/vkontakte/android/attachments/AlbumAttachment;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 125
    invoke-direct {p0}, Lcom/vkontakte/android/utils/Serializer$CreatorAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public createFromSerializer(Lcom/vkontakte/android/utils/Serializer;)Lcom/vkontakte/android/attachments/AlbumAttachment;
    .locals 9
    .param p1, "is"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 128
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v8

    .line 129
    .local v8, "nImgs":I
    new-array v1, v8, [Lcom/vkontakte/android/attachments/PhotoAttachment$Image;

    .line 130
    .local v1, "imgs":[Lcom/vkontakte/android/attachments/PhotoAttachment$Image;
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_0
    if-ge v7, v8, :cond_0

    .line 131
    new-instance v0, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;

    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readChar()C

    move-result v2

    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v4

    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v5

    invoke-direct {v0, v2, v3, v4, v5}, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;-><init>(CLjava/lang/String;II)V

    aput-object v0, v1, v7

    .line 130
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 133
    :cond_0
    new-instance v0, Lcom/vkontakte/android/attachments/AlbumAttachment;

    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v2

    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v3

    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v4

    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v6

    invoke-direct/range {v0 .. v6}, Lcom/vkontakte/android/attachments/AlbumAttachment;-><init>([Lcom/vkontakte/android/attachments/PhotoAttachment$Image;IIILjava/lang/String;I)V

    return-object v0
.end method

.method public bridge synthetic createFromSerializer(Lcom/vkontakte/android/utils/Serializer;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 125
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/attachments/AlbumAttachment$3;->createFromSerializer(Lcom/vkontakte/android/utils/Serializer;)Lcom/vkontakte/android/attachments/AlbumAttachment;

    move-result-object v0

    return-object v0
.end method

.method public newArray(I)[Lcom/vkontakte/android/attachments/AlbumAttachment;
    .locals 1
    .param p1, "size"    # I

    .prologue
    .line 137
    new-array v0, p1, [Lcom/vkontakte/android/attachments/AlbumAttachment;

    return-object v0
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .locals 1

    .prologue
    .line 125
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/attachments/AlbumAttachment$3;->newArray(I)[Lcom/vkontakte/android/attachments/AlbumAttachment;

    move-result-object v0

    return-object v0
.end method
