.class final Lcom/vkontakte/android/attachments/SnippetAttachment$1;
.super Lcom/vkontakte/android/utils/Serializer$CreatorAdapter;
.source "SnippetAttachment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/attachments/SnippetAttachment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/utils/Serializer$CreatorAdapter",
        "<",
        "Lcom/vkontakte/android/attachments/SnippetAttachment;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 251
    invoke-direct {p0}, Lcom/vkontakte/android/utils/Serializer$CreatorAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public createFromSerializer(Lcom/vkontakte/android/utils/Serializer;)Lcom/vkontakte/android/attachments/SnippetAttachment;
    .locals 14
    .param p1, "is"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    const/4 v7, 0x1

    .line 254
    const-class v0, Lcom/vkontakte/android/Photo;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->readSerializable(Ljava/lang/ClassLoader;)Lcom/vkontakte/android/utils/Serializer$Serializable;

    move-result-object v6

    check-cast v6, Lcom/vkontakte/android/Photo;

    .line 255
    .local v6, "photo":Lcom/vkontakte/android/Photo;
    new-instance v0, Lcom/vkontakte/android/attachments/SnippetAttachment;

    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v4

    .line 256
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v8

    if-ne v8, v7, :cond_0

    :goto_0
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readFloat()F

    move-result v10

    .line 257
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v11

    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v12

    const-class v13, Lcom/vkontakte/android/api/ButtonAction;

    invoke-virtual {v13}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v13

    invoke-virtual {p1, v13}, Lcom/vkontakte/android/utils/Serializer;->readSerializable(Ljava/lang/ClassLoader;)Lcom/vkontakte/android/utils/Serializer$Serializable;

    move-result-object v13

    check-cast v13, Lcom/vkontakte/android/api/ButtonAction;

    invoke-direct/range {v0 .. v13}, Lcom/vkontakte/android/attachments/SnippetAttachment;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/vkontakte/android/Photo;ZLjava/lang/String;Ljava/lang/String;FILjava/lang/String;Lcom/vkontakte/android/api/ButtonAction;)V

    return-object v0

    .line 256
    :cond_0
    const/4 v7, 0x0

    goto :goto_0
.end method

.method public bridge synthetic createFromSerializer(Lcom/vkontakte/android/utils/Serializer;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 251
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/attachments/SnippetAttachment$1;->createFromSerializer(Lcom/vkontakte/android/utils/Serializer;)Lcom/vkontakte/android/attachments/SnippetAttachment;

    move-result-object v0

    return-object v0
.end method

.method public newArray(I)[Lcom/vkontakte/android/attachments/SnippetAttachment;
    .locals 1
    .param p1, "size"    # I

    .prologue
    .line 261
    new-array v0, p1, [Lcom/vkontakte/android/attachments/SnippetAttachment;

    return-object v0
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .locals 1

    .prologue
    .line 251
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/attachments/SnippetAttachment$1;->newArray(I)[Lcom/vkontakte/android/attachments/SnippetAttachment;

    move-result-object v0

    return-object v0
.end method
