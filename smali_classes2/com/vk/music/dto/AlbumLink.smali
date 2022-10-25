.class public final Lcom/vk/music/dto/AlbumLink;
.super Lcom/vkontakte/android/utils/Serializer$SerializableAdapter;
.source "AlbumLink.java"


# static fields
.field public static final CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/utils/Serializer$Creator",
            "<",
            "Lcom/vk/music/dto/AlbumLink;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final accessKey:Ljava/lang/String;

.field public final id:I

.field public final ownerId:I

.field public final thumb:Lcom/vk/music/dto/Thumb;

.field public final title:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 50
    new-instance v0, Lcom/vk/music/dto/AlbumLink$1;

    invoke-direct {v0}, Lcom/vk/music/dto/AlbumLink$1;-><init>()V

    sput-object v0, Lcom/vk/music/dto/AlbumLink;->CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;

    return-void
.end method

.method private constructor <init>(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 1
    .param p1, "s"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 33
    invoke-direct {p0}, Lcom/vkontakte/android/utils/Serializer$SerializableAdapter;-><init>()V

    .line 34
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vk/music/dto/AlbumLink;->id:I

    .line 35
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vk/music/dto/AlbumLink;->ownerId:I

    .line 36
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/music/dto/AlbumLink;->accessKey:Ljava/lang/String;

    .line 37
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/music/dto/AlbumLink;->title:Ljava/lang/String;

    .line 38
    const-class v0, Lcom/vk/music/dto/Thumb;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->readSerializable(Ljava/lang/ClassLoader;)Lcom/vkontakte/android/utils/Serializer$Serializable;

    move-result-object v0

    check-cast v0, Lcom/vk/music/dto/Thumb;

    iput-object v0, p0, Lcom/vk/music/dto/AlbumLink;->thumb:Lcom/vk/music/dto/Thumb;

    .line 39
    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/utils/Serializer;Lcom/vk/music/dto/AlbumLink$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/utils/Serializer;
    .param p2, "x1"    # Lcom/vk/music/dto/AlbumLink$1;

    .prologue
    .line 13
    invoke-direct {p0, p1}, Lcom/vk/music/dto/AlbumLink;-><init>(Lcom/vkontakte/android/utils/Serializer;)V

    return-void
.end method

.method public constructor <init>(Lorg/json/JSONObject;)V
    .locals 2
    .param p1, "jLink"    # Lorg/json/JSONObject;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 21
    invoke-direct {p0}, Lcom/vkontakte/android/utils/Serializer$SerializableAdapter;-><init>()V

    .line 22
    const-string/jumbo v0, "id"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/vk/music/dto/AlbumLink;->id:I

    .line 23
    const-string/jumbo v0, "owner_id"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/vk/music/dto/AlbumLink;->ownerId:I

    .line 24
    const-string/jumbo v0, "access_key"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/music/dto/AlbumLink;->accessKey:Ljava/lang/String;

    .line 25
    const-string/jumbo v0, "title"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/music/dto/AlbumLink;->title:Ljava/lang/String;

    .line 26
    const-string/jumbo v0, "thumb"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 27
    new-instance v0, Lcom/vk/music/dto/Thumb;

    const-string/jumbo v1, "thumb"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vk/music/dto/Thumb;-><init>(Lorg/json/JSONObject;)V

    iput-object v0, p0, Lcom/vk/music/dto/AlbumLink;->thumb:Lcom/vk/music/dto/Thumb;

    .line 31
    :goto_0
    return-void

    .line 29
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vk/music/dto/AlbumLink;->thumb:Lcom/vk/music/dto/Thumb;

    goto :goto_0
.end method


# virtual methods
.method public serializeTo(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 1
    .param p1, "s"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 43
    iget v0, p0, Lcom/vk/music/dto/AlbumLink;->id:I

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 44
    iget v0, p0, Lcom/vk/music/dto/AlbumLink;->ownerId:I

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 45
    iget-object v0, p0, Lcom/vk/music/dto/AlbumLink;->accessKey:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 46
    iget-object v0, p0, Lcom/vk/music/dto/AlbumLink;->title:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 47
    iget-object v0, p0, Lcom/vk/music/dto/AlbumLink;->thumb:Lcom/vk/music/dto/Thumb;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeSerializable(Lcom/vkontakte/android/utils/Serializer$Serializable;)V

    .line 48
    return-void
.end method
