.class public Lcom/vk/music/dto/PlaylistLink;
.super Lcom/vkontakte/android/utils/Serializer$SerializableAdapter;
.source "PlaylistLink.java"


# static fields
.field public static final CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/utils/Serializer$Creator",
            "<",
            "Lcom/vk/music/dto/PlaylistLink;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final accessKey:Ljava/lang/String;

.field public final id:I

.field public final ownerId:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 44
    new-instance v0, Lcom/vk/music/dto/PlaylistLink$1;

    invoke-direct {v0}, Lcom/vk/music/dto/PlaylistLink$1;-><init>()V

    sput-object v0, Lcom/vk/music/dto/PlaylistLink;->CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;

    return-void
.end method

.method public constructor <init>(II)V
    .locals 1
    .param p1, "id"    # I
    .param p2, "ownerId"    # I

    .prologue
    .line 31
    invoke-direct {p0}, Lcom/vkontakte/android/utils/Serializer$SerializableAdapter;-><init>()V

    .line 32
    iput p1, p0, Lcom/vk/music/dto/PlaylistLink;->id:I

    .line 33
    iput p2, p0, Lcom/vk/music/dto/PlaylistLink;->ownerId:I

    .line 34
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vk/music/dto/PlaylistLink;->accessKey:Ljava/lang/String;

    .line 35
    return-void
.end method

.method protected constructor <init>(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 1
    .param p1, "s"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 25
    invoke-direct {p0}, Lcom/vkontakte/android/utils/Serializer$SerializableAdapter;-><init>()V

    .line 26
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vk/music/dto/PlaylistLink;->id:I

    .line 27
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vk/music/dto/PlaylistLink;->ownerId:I

    .line 28
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/music/dto/PlaylistLink;->accessKey:Ljava/lang/String;

    .line 29
    return-void
.end method

.method public constructor <init>(Lorg/json/JSONObject;)V
    .locals 1
    .param p1, "jLink"    # Lorg/json/JSONObject;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 19
    invoke-direct {p0}, Lcom/vkontakte/android/utils/Serializer$SerializableAdapter;-><init>()V

    .line 20
    const-string/jumbo v0, "playlist_id"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/vk/music/dto/PlaylistLink;->id:I

    .line 21
    const-string/jumbo v0, "owner_id"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/vk/music/dto/PlaylistLink;->ownerId:I

    .line 22
    const-string/jumbo v0, "access_key"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/music/dto/PlaylistLink;->accessKey:Ljava/lang/String;

    .line 23
    return-void
.end method


# virtual methods
.method public serializeTo(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 1
    .param p1, "s"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 39
    iget v0, p0, Lcom/vk/music/dto/PlaylistLink;->id:I

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 40
    iget v0, p0, Lcom/vk/music/dto/PlaylistLink;->ownerId:I

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 41
    iget-object v0, p0, Lcom/vk/music/dto/PlaylistLink;->accessKey:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 42
    return-void
.end method
