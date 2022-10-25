.class final Lcom/vkontakte/android/attachments/ShitAttachment$1;
.super Lcom/vkontakte/android/utils/Serializer$CreatorAdapter;
.source "ShitAttachment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/attachments/ShitAttachment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/utils/Serializer$CreatorAdapter",
        "<",
        "Lcom/vkontakte/android/attachments/ShitAttachment;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 150
    invoke-direct {p0}, Lcom/vkontakte/android/utils/Serializer$CreatorAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public createFromSerializer(Lcom/vkontakte/android/utils/Serializer;)Lcom/vkontakte/android/attachments/ShitAttachment;
    .locals 22
    .param p1, "is"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 153
    new-instance v2, Lcom/vkontakte/android/attachments/ShitAttachment;

    invoke-virtual/range {p1 .. p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual/range {p1 .. p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual/range {p1 .. p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual/range {p1 .. p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v6

    .line 154
    invoke-virtual/range {p1 .. p1}, Lcom/vkontakte/android/utils/Serializer;->readFloat()F

    move-result v7

    invoke-virtual/range {p1 .. p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual/range {p1 .. p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v9

    const-class v10, Lcom/vkontakte/android/statistics/StatisticUrl;

    invoke-virtual {v10}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v10

    move-object/from16 v0, p1

    invoke-virtual {v0, v10}, Lcom/vkontakte/android/utils/Serializer;->readSerializable(Ljava/lang/ClassLoader;)Lcom/vkontakte/android/utils/Serializer$Serializable;

    move-result-object v10

    check-cast v10, Lcom/vkontakte/android/statistics/StatisticUrl;

    invoke-virtual/range {p1 .. p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v11

    .line 155
    invoke-virtual/range {p1 .. p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual/range {p1 .. p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v13

    invoke-virtual/range {p1 .. p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual/range {p1 .. p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual/range {p1 .. p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v16

    invoke-virtual/range {p1 .. p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v17

    .line 156
    invoke-virtual/range {p1 .. p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {p1 .. p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v19

    invoke-direct/range {v2 .. v19}, Lcom/vkontakte/android/attachments/ShitAttachment;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;FLjava/lang/String;Ljava/lang/String;Lcom/vkontakte/android/statistics/StatisticUrl;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 157
    .local v2, "ad":Lcom/vkontakte/android/attachments/ShitAttachment;
    const-class v3, Lcom/vkontakte/android/attachments/PhotoAttachment;

    invoke-virtual {v3}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v3

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Lcom/vkontakte/android/utils/Serializer;->readSerializable(Ljava/lang/ClassLoader;)Lcom/vkontakte/android/utils/Serializer$Serializable;

    move-result-object v3

    check-cast v3, Lcom/vkontakte/android/attachments/PhotoAttachment;

    iput-object v3, v2, Lcom/vkontakte/android/attachments/ShitAttachment;->photo:Lcom/vkontakte/android/attachments/PhotoAttachment;

    .line 159
    invoke-virtual/range {p1 .. p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v20

    .line 160
    .local v20, "c":I
    const/16 v21, 0x0

    .local v21, "i":I
    :goto_0
    move/from16 v0, v21

    move/from16 v1, v20

    if-ge v0, v1, :cond_0

    .line 161
    iget-object v3, v2, Lcom/vkontakte/android/attachments/ShitAttachment;->cards:Ljava/util/ArrayList;

    const-class v4, Lcom/vkontakte/android/attachments/ShitAttachment$Card;

    invoke-virtual {v4}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v4

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Lcom/vkontakte/android/utils/Serializer;->readSerializable(Ljava/lang/ClassLoader;)Lcom/vkontakte/android/utils/Serializer$Serializable;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 160
    add-int/lit8 v21, v21, 0x1

    goto :goto_0

    .line 164
    :cond_0
    iget-object v3, v2, Lcom/vkontakte/android/attachments/ShitAttachment;->statistics:Lcom/vkontakte/android/statistics/Statistic$StatisticHelper;

    move-object/from16 v0, p1

    invoke-virtual {v3, v0}, Lcom/vkontakte/android/statistics/Statistic$StatisticHelper;->readFromSerializer(Lcom/vkontakte/android/utils/Serializer;)V

    .line 165
    const-class v3, Lcom/vkontakte/android/attachments/VideoAttachment;

    invoke-virtual {v3}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v3

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Lcom/vkontakte/android/utils/Serializer;->readSerializable(Ljava/lang/ClassLoader;)Lcom/vkontakte/android/utils/Serializer$Serializable;

    move-result-object v3

    check-cast v3, Lcom/vkontakte/android/attachments/VideoAttachment;

    iput-object v3, v2, Lcom/vkontakte/android/attachments/ShitAttachment;->video:Lcom/vkontakte/android/attachments/VideoAttachment;

    .line 167
    return-object v2
.end method

.method public bridge synthetic createFromSerializer(Lcom/vkontakte/android/utils/Serializer;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 150
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/attachments/ShitAttachment$1;->createFromSerializer(Lcom/vkontakte/android/utils/Serializer;)Lcom/vkontakte/android/attachments/ShitAttachment;

    move-result-object v0

    return-object v0
.end method

.method public newArray(I)[Lcom/vkontakte/android/attachments/ShitAttachment;
    .locals 1
    .param p1, "size"    # I

    .prologue
    .line 171
    new-array v0, p1, [Lcom/vkontakte/android/attachments/ShitAttachment;

    return-object v0
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .locals 1

    .prologue
    .line 150
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/attachments/ShitAttachment$1;->newArray(I)[Lcom/vkontakte/android/attachments/ShitAttachment;

    move-result-object v0

    return-object v0
.end method
