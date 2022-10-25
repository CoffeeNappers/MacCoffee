.class public final Lcom/vkontakte/android/data/LikeInfo;
.super Lcom/vkontakte/android/utils/Serializer$SerializableAdapter;
.source "LikeInfo.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/data/LikeInfo$BoolData;,
        Lcom/vkontakte/android/data/LikeInfo$StrData;,
        Lcom/vkontakte/android/data/LikeInfo$Type;
    }
.end annotation


# static fields
.field public static final CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/utils/Serializer$Creator",
            "<",
            "Lcom/vkontakte/android/data/LikeInfo;",
            ">;"
        }
    .end annotation
.end field

.field public static final DATA_FIRST_NAME:Ljava/lang/String; = "firstName"

.field public static final DATA_FIRST_NAME_DAT:Ljava/lang/String; = "firstNameDat"

.field public static final DATA_FRIEND:Ljava/lang/String; = "friend"

.field public static final DATA_LAST_NAME:Ljava/lang/String; = "lastName"

.field public static final DATA_LAST_NAME_DAT:Ljava/lang/String; = "lastNameDat"

.field public static final DATA_MALE:Ljava/lang/String; = "male"

.field public static final DATA_NAME:Ljava/lang/String; = "name"

.field public static final DATA_PHOTO:Ljava/lang/String; = "photo"

.field public static final TYPE_EVENT:I = 0x4

.field public static final TYPE_GROUP:I = 0x2

.field public static final TYPE_PAGE:I = 0x3

.field public static final TYPE_PROFILE:I = 0x1


# instance fields
.field private final data:Landroid/os/Bundle;

.field public final type:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 161
    new-instance v0, Lcom/vkontakte/android/data/LikeInfo$1;

    invoke-direct {v0}, Lcom/vkontakte/android/data/LikeInfo$1;-><init>()V

    sput-object v0, Lcom/vkontakte/android/data/LikeInfo;->CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;

    return-void
.end method

.method private constructor <init>(ILandroid/os/Bundle;)V
    .locals 0
    .param p1, "type"    # I
    .param p2, "data"    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 57
    invoke-direct {p0}, Lcom/vkontakte/android/utils/Serializer$SerializableAdapter;-><init>()V

    .line 58
    iput p1, p0, Lcom/vkontakte/android/data/LikeInfo;->type:I

    .line 59
    iput-object p2, p0, Lcom/vkontakte/android/data/LikeInfo;->data:Landroid/os/Bundle;

    .line 60
    return-void
.end method

.method private constructor <init>(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 1
    .param p1, "in"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 62
    invoke-direct {p0}, Lcom/vkontakte/android/utils/Serializer$SerializableAdapter;-><init>()V

    .line 64
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/data/LikeInfo;->type:I

    .line 65
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->readBundle(Ljava/lang/ClassLoader;)Landroid/os/Bundle;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/data/LikeInfo;->data:Landroid/os/Bundle;

    .line 66
    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/utils/Serializer;Lcom/vkontakte/android/data/LikeInfo$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/utils/Serializer;
    .param p2, "x1"    # Lcom/vkontakte/android/data/LikeInfo$1;

    .prologue
    .line 23
    invoke-direct {p0, p1}, Lcom/vkontakte/android/data/LikeInfo;-><init>(Lcom/vkontakte/android/utils/Serializer;)V

    return-void
.end method

.method public static parse(Lorg/json/JSONArray;)Ljava/util/List;
    .locals 6
    .param p0, "jLikes"    # Lorg/json/JSONArray;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONArray;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/data/LikeInfo;",
            ">;"
        }
    .end annotation

    .prologue
    .line 85
    if-nez p0, :cond_1

    .line 86
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v3

    .line 107
    :cond_0
    :goto_0
    return-object v3

    .line 89
    :cond_1
    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v2

    .line 90
    .local v2, "length":I
    if-nez v2, :cond_2

    .line 91
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v3

    goto :goto_0

    .line 94
    :cond_2
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 97
    .local v3, "result":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/data/LikeInfo;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    if-ge v0, v2, :cond_0

    .line 98
    invoke-virtual {p0, v0}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v1

    .line 99
    .local v1, "jLikeInfo":Lorg/json/JSONObject;
    if-eqz v1, :cond_3

    const-string/jumbo v4, "type"

    invoke-virtual {v1, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 100
    const-string/jumbo v4, "profile"

    const-string/jumbo v5, "type"

    invoke-virtual {v1, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 101
    invoke-static {v1}, Lcom/vkontakte/android/data/LikeInfo;->parseUser(Lorg/json/JSONObject;)Lcom/vkontakte/android/data/LikeInfo;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 97
    :cond_3
    :goto_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 103
    :cond_4
    invoke-static {v1}, Lcom/vkontakte/android/data/LikeInfo;->parseGroup(Lorg/json/JSONObject;)Lcom/vkontakte/android/data/LikeInfo;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2
.end method

.method private static parseGroup(Lorg/json/JSONObject;)Lcom/vkontakte/android/data/LikeInfo;
    .locals 5
    .param p0, "jLikeInfo"    # Lorg/json/JSONObject;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    const/4 v2, 0x2

    .line 140
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 142
    .local v0, "data":Landroid/os/Bundle;
    const-string/jumbo v1, "photo_50"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 143
    const-string/jumbo v1, "photo"

    const-string/jumbo v3, "photo_50"

    invoke-virtual {p0, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 145
    :cond_0
    const-string/jumbo v1, "name"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 146
    const-string/jumbo v1, "name"

    const-string/jumbo v3, "name"

    invoke-virtual {p0, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 149
    :cond_1
    const-string/jumbo v1, "type"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const/4 v1, -0x1

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v4

    sparse-switch v4, :sswitch_data_0

    :cond_2
    :goto_0
    packed-switch v1, :pswitch_data_0

    .line 157
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Unsupported type: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "type"

    invoke-virtual {p0, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 149
    :sswitch_0
    const-string/jumbo v4, "group"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    const/4 v1, 0x0

    goto :goto_0

    :sswitch_1
    const-string/jumbo v4, "page"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    const/4 v1, 0x1

    goto :goto_0

    :sswitch_2
    const-string/jumbo v4, "event"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    move v1, v2

    goto :goto_0

    .line 151
    :pswitch_0
    new-instance v1, Lcom/vkontakte/android/data/LikeInfo;

    invoke-direct {v1, v2, v0}, Lcom/vkontakte/android/data/LikeInfo;-><init>(ILandroid/os/Bundle;)V

    .line 155
    :goto_1
    return-object v1

    .line 153
    :pswitch_1
    new-instance v1, Lcom/vkontakte/android/data/LikeInfo;

    const/4 v2, 0x3

    invoke-direct {v1, v2, v0}, Lcom/vkontakte/android/data/LikeInfo;-><init>(ILandroid/os/Bundle;)V

    goto :goto_1

    .line 155
    :pswitch_2
    new-instance v1, Lcom/vkontakte/android/data/LikeInfo;

    const/4 v2, 0x4

    invoke-direct {v1, v2, v0}, Lcom/vkontakte/android/data/LikeInfo;-><init>(ILandroid/os/Bundle;)V

    goto :goto_1

    .line 149
    :sswitch_data_0
    .sparse-switch
        0x34628f -> :sswitch_1
        0x5c6729a -> :sswitch_2
        0x5e0f67f -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method private static parseUser(Lorg/json/JSONObject;)Lcom/vkontakte/android/data/LikeInfo;
    .locals 5
    .param p0, "jLikeInfo"    # Lorg/json/JSONObject;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 112
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 114
    .local v0, "data":Landroid/os/Bundle;
    const-string/jumbo v1, "sex"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 115
    const-string/jumbo v4, "male"

    const-string/jumbo v1, "sex"

    invoke-virtual {p0, v1, v3}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v1

    if-ne v1, v2, :cond_8

    move v1, v2

    :goto_0
    invoke-virtual {v0, v4, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 117
    :cond_0
    const-string/jumbo v1, "is_friend"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 118
    const-string/jumbo v1, "friend"

    const-string/jumbo v4, "is_friend"

    invoke-virtual {p0, v4, v3}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v4

    if-ne v4, v2, :cond_1

    move v3, v2

    :cond_1
    invoke-virtual {v0, v1, v3}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 120
    :cond_2
    const-string/jumbo v1, "photo_50"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 121
    const-string/jumbo v1, "photo"

    const-string/jumbo v3, "photo_50"

    invoke-virtual {p0, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 123
    :cond_3
    const-string/jumbo v1, "first_name"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 124
    const-string/jumbo v1, "firstName"

    const-string/jumbo v3, "first_name"

    invoke-virtual {p0, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 126
    :cond_4
    const-string/jumbo v1, "last_name"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 127
    const-string/jumbo v1, "lastName"

    const-string/jumbo v3, "last_name"

    invoke-virtual {p0, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 129
    :cond_5
    const-string/jumbo v1, "first_name_dat"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_6

    .line 130
    const-string/jumbo v1, "firstNameDat"

    const-string/jumbo v3, "first_name_dat"

    invoke-virtual {p0, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 132
    :cond_6
    const-string/jumbo v1, "last_name_dat"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_7

    .line 133
    const-string/jumbo v1, "lastNameDat"

    const-string/jumbo v3, "last_name_dat"

    invoke-virtual {p0, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 135
    :cond_7
    new-instance v1, Lcom/vkontakte/android/data/LikeInfo;

    invoke-direct {v1, v2, v0}, Lcom/vkontakte/android/data/LikeInfo;-><init>(ILandroid/os/Bundle;)V

    return-object v1

    :cond_8
    move v1, v3

    .line 115
    goto/16 :goto_0
.end method


# virtual methods
.method public getBoolean(Ljava/lang/String;)Z
    .locals 1
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 80
    iget-object v0, p0, Lcom/vkontakte/android/data/LikeInfo;->data:Landroid/os/Bundle;

    invoke-virtual {v0, p1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public getString(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 76
    iget-object v0, p0, Lcom/vkontakte/android/data/LikeInfo;->data:Landroid/os/Bundle;

    invoke-virtual {v0, p1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public serializeTo(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 1
    .param p1, "s"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 70
    iget v0, p0, Lcom/vkontakte/android/data/LikeInfo;->type:I

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 71
    iget-object v0, p0, Lcom/vkontakte/android/data/LikeInfo;->data:Landroid/os/Bundle;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeBundle(Landroid/os/Bundle;)V

    .line 72
    return-void
.end method
