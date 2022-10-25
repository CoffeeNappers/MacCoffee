.class final Lcom/vkontakte/android/attachments/ShitAttachment$Card$1;
.super Lcom/vkontakte/android/utils/Serializer$CreatorAdapter;
.source "ShitAttachment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/attachments/ShitAttachment$Card;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/utils/Serializer$CreatorAdapter",
        "<",
        "Lcom/vkontakte/android/attachments/ShitAttachment$Card;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 235
    invoke-direct {p0}, Lcom/vkontakte/android/utils/Serializer$CreatorAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public createFromSerializer(Lcom/vkontakte/android/utils/Serializer;)Lcom/vkontakte/android/attachments/ShitAttachment$Card;
    .locals 2
    .param p1, "is"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 239
    new-instance v0, Lcom/vkontakte/android/attachments/ShitAttachment$Card;

    invoke-direct {v0}, Lcom/vkontakte/android/attachments/ShitAttachment$Card;-><init>()V

    .line 240
    .local v0, "card":Lcom/vkontakte/android/attachments/ShitAttachment$Card;
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/vkontakte/android/attachments/ShitAttachment$Card;->link:Ljava/lang/String;

    .line 241
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/vkontakte/android/attachments/ShitAttachment$Card;->title:Ljava/lang/String;

    .line 242
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/vkontakte/android/attachments/ShitAttachment$Card;->deepLink:Ljava/lang/String;

    .line 243
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/vkontakte/android/attachments/ShitAttachment$Card;->appPackage:Ljava/lang/String;

    .line 244
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/vkontakte/android/attachments/ShitAttachment$Card;->description:Ljava/lang/String;

    .line 245
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/vkontakte/android/attachments/ShitAttachment$Card;->followers:Ljava/lang/String;

    .line 246
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/vkontakte/android/attachments/ShitAttachment$Card;->buttonText:Ljava/lang/String;

    .line 247
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/vkontakte/android/attachments/ShitAttachment$Card;->buttonTextInstalled:Ljava/lang/String;

    .line 248
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readFloat()F

    move-result v1

    iput v1, v0, Lcom/vkontakte/android/attachments/ShitAttachment$Card;->rating:F

    .line 249
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v1

    iput v1, v0, Lcom/vkontakte/android/attachments/ShitAttachment$Card;->linkTarget:I

    .line 250
    const-class v1, Lcom/vkontakte/android/attachments/PhotoAttachment;

    invoke-virtual {v1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    invoke-virtual {p1, v1}, Lcom/vkontakte/android/utils/Serializer;->readSerializable(Ljava/lang/ClassLoader;)Lcom/vkontakte/android/utils/Serializer$Serializable;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/attachments/PhotoAttachment;

    iput-object v1, v0, Lcom/vkontakte/android/attachments/ShitAttachment$Card;->photo:Lcom/vkontakte/android/attachments/PhotoAttachment;

    .line 252
    iget-object v1, v0, Lcom/vkontakte/android/attachments/ShitAttachment$Card;->statistics:Lcom/vkontakte/android/statistics/Statistic$StatisticHelper;

    invoke-virtual {v1, p1}, Lcom/vkontakte/android/statistics/Statistic$StatisticHelper;->readFromSerializer(Lcom/vkontakte/android/utils/Serializer;)V

    .line 254
    invoke-virtual {v0}, Lcom/vkontakte/android/attachments/ShitAttachment$Card;->updateInstallationState()V

    .line 255
    return-object v0
.end method

.method public bridge synthetic createFromSerializer(Lcom/vkontakte/android/utils/Serializer;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 235
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/attachments/ShitAttachment$Card$1;->createFromSerializer(Lcom/vkontakte/android/utils/Serializer;)Lcom/vkontakte/android/attachments/ShitAttachment$Card;

    move-result-object v0

    return-object v0
.end method

.method public newArray(I)[Lcom/vkontakte/android/attachments/ShitAttachment$Card;
    .locals 1
    .param p1, "size"    # I

    .prologue
    .line 260
    new-array v0, p1, [Lcom/vkontakte/android/attachments/ShitAttachment$Card;

    return-object v0
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .locals 1

    .prologue
    .line 235
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/attachments/ShitAttachment$Card$1;->newArray(I)[Lcom/vkontakte/android/attachments/ShitAttachment$Card;

    move-result-object v0

    return-object v0
.end method
