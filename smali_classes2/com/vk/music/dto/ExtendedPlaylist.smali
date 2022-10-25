.class public Lcom/vk/music/dto/ExtendedPlaylist;
.super Lcom/vkontakte/android/utils/Serializer$SerializableAdapter;
.source "ExtendedPlaylist.java"


# static fields
.field public static final CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/utils/Serializer$Creator",
            "<",
            "Lcom/vk/music/dto/ExtendedPlaylist;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final playlist:Lcom/vk/music/dto/Playlist;

.field public final subtitle:Ljava/lang/String;

.field public final title:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 33
    new-instance v0, Lcom/vk/music/dto/ExtendedPlaylist$1;

    invoke-direct {v0}, Lcom/vk/music/dto/ExtendedPlaylist$1;-><init>()V

    sput-object v0, Lcom/vk/music/dto/ExtendedPlaylist;->CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;

    return-void
.end method

.method public constructor <init>(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 1
    .param p1, "s"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 20
    invoke-direct {p0}, Lcom/vkontakte/android/utils/Serializer$SerializableAdapter;-><init>()V

    .line 21
    const-class v0, Lcom/vk/music/dto/Playlist;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->readSerializable(Ljava/lang/ClassLoader;)Lcom/vkontakte/android/utils/Serializer$Serializable;

    move-result-object v0

    check-cast v0, Lcom/vk/music/dto/Playlist;

    iput-object v0, p0, Lcom/vk/music/dto/ExtendedPlaylist;->playlist:Lcom/vk/music/dto/Playlist;

    .line 22
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/music/dto/ExtendedPlaylist;->title:Ljava/lang/String;

    .line 23
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/music/dto/ExtendedPlaylist;->subtitle:Ljava/lang/String;

    .line 24
    return-void
.end method

.method public constructor <init>(Lorg/json/JSONObject;)V
    .locals 2
    .param p1, "object"    # Lorg/json/JSONObject;

    .prologue
    .line 12
    invoke-direct {p0}, Lcom/vkontakte/android/utils/Serializer$SerializableAdapter;-><init>()V

    .line 13
    new-instance v0, Lcom/vk/music/dto/Playlist;

    const-string/jumbo v1, "playlist"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vk/music/dto/Playlist;-><init>(Lorg/json/JSONObject;)V

    iput-object v0, p0, Lcom/vk/music/dto/ExtendedPlaylist;->playlist:Lcom/vk/music/dto/Playlist;

    .line 14
    const-string/jumbo v0, "title"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/music/dto/ExtendedPlaylist;->title:Ljava/lang/String;

    .line 15
    const-string/jumbo v0, "subtitle"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/music/dto/ExtendedPlaylist;->subtitle:Ljava/lang/String;

    .line 16
    return-void
.end method


# virtual methods
.method public serializeTo(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 1
    .param p1, "s"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 28
    iget-object v0, p0, Lcom/vk/music/dto/ExtendedPlaylist;->playlist:Lcom/vk/music/dto/Playlist;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeSerializable(Lcom/vkontakte/android/utils/Serializer$Serializable;)V

    .line 29
    iget-object v0, p0, Lcom/vk/music/dto/ExtendedPlaylist;->title:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 30
    iget-object v0, p0, Lcom/vk/music/dto/ExtendedPlaylist;->subtitle:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 31
    return-void
.end method
