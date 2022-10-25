.class public Lcom/vk/music/dto/Section;
.super Lcom/vkontakte/android/utils/Serializer$SerializableAdapter;
.source "Section.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/music/dto/Section$Type;
    }
.end annotation


# static fields
.field public static final CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/utils/Serializer$Creator",
            "<",
            "Lcom/vk/music/dto/Section;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final audios:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;"
        }
    .end annotation
.end field

.field public final count:I

.field public final extendedPlaylists:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vk/music/dto/ExtendedPlaylist;",
            ">;"
        }
    .end annotation
.end field

.field public final id:I

.field public final playlists:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vk/music/dto/Playlist;",
            ">;"
        }
    .end annotation
.end field

.field public final profiles:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;"
        }
    .end annotation
.end field

.field public final source:Ljava/lang/String;

.field public final subtitle:Ljava/lang/String;

.field public final thumbs:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vk/music/dto/Thumb;",
            ">;"
        }
    .end annotation
.end field

.field public final title:Ljava/lang/String;

.field public final type:Lcom/vk/music/dto/Section$Type;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 165
    new-instance v0, Lcom/vk/music/dto/Section$1;

    invoke-direct {v0}, Lcom/vk/music/dto/Section$1;-><init>()V

    sput-object v0, Lcom/vk/music/dto/Section;->CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;

    return-void
.end method

.method private constructor <init>(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 1
    .param p1, "in"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 134
    invoke-direct {p0}, Lcom/vkontakte/android/utils/Serializer$SerializableAdapter;-><init>()V

    .line 135
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vk/music/dto/Section;->id:I

    .line 136
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/vk/music/dto/Section$Type;->access$000(Ljava/lang/String;)Lcom/vk/music/dto/Section$Type;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/music/dto/Section;->type:Lcom/vk/music/dto/Section$Type;

    .line 137
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/music/dto/Section;->title:Ljava/lang/String;

    .line 138
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/music/dto/Section;->subtitle:Ljava/lang/String;

    .line 139
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vk/music/dto/Section;->count:I

    .line 140
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/music/dto/Section;->source:Ljava/lang/String;

    .line 142
    sget-object v0, Lcom/vk/music/dto/Playlist;->CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->createTypedArrayList(Lcom/vkontakte/android/utils/Serializer$Creator;)Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/music/dto/Section;->playlists:Ljava/util/ArrayList;

    .line 143
    sget-object v0, Lcom/vk/music/dto/ExtendedPlaylist;->CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->createTypedArrayList(Lcom/vkontakte/android/utils/Serializer$Creator;)Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/music/dto/Section;->extendedPlaylists:Ljava/util/ArrayList;

    .line 144
    sget-object v0, Lcom/vkontakte/android/audio/MusicTrack;->CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->createTypedArrayList(Lcom/vkontakte/android/utils/Serializer$Creator;)Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/music/dto/Section;->audios:Ljava/util/ArrayList;

    .line 145
    sget-object v0, Lcom/vkontakte/android/UserProfile;->CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->createTypedArrayList(Lcom/vkontakte/android/utils/Serializer$Creator;)Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/music/dto/Section;->profiles:Ljava/util/ArrayList;

    .line 146
    sget-object v0, Lcom/vk/music/dto/Thumb;->CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->createTypedArrayList(Lcom/vkontakte/android/utils/Serializer$Creator;)Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/music/dto/Section;->thumbs:Ljava/util/ArrayList;

    .line 147
    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/utils/Serializer;Lcom/vk/music/dto/Section$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/utils/Serializer;
    .param p2, "x1"    # Lcom/vk/music/dto/Section$1;

    .prologue
    .line 18
    invoke-direct {p0, p1}, Lcom/vk/music/dto/Section;-><init>(Lcom/vkontakte/android/utils/Serializer;)V

    return-void
.end method

.method public constructor <init>(Lorg/json/JSONObject;)V
    .locals 3
    .param p1, "jSection"    # Lorg/json/JSONObject;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 47
    invoke-direct {p0}, Lcom/vkontakte/android/utils/Serializer$SerializableAdapter;-><init>()V

    .line 48
    const-string/jumbo v0, "id"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/vk/music/dto/Section;->id:I

    .line 49
    const-string/jumbo v0, "type"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/vk/music/dto/Section$Type;->access$000(Ljava/lang/String;)Lcom/vk/music/dto/Section$Type;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/music/dto/Section;->type:Lcom/vk/music/dto/Section$Type;

    .line 50
    const-string/jumbo v0, "title"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/music/dto/Section;->title:Ljava/lang/String;

    .line 51
    const-string/jumbo v0, "subtitle"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/music/dto/Section;->subtitle:Ljava/lang/String;

    .line 52
    const-string/jumbo v0, "count"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/vk/music/dto/Section;->count:I

    .line 53
    const-string/jumbo v0, "source"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/music/dto/Section;->source:Ljava/lang/String;

    .line 55
    const-string/jumbo v0, "playlists"

    new-instance v1, Lcom/vkontakte/android/data/VKList$ReflectionParser;

    const-class v2, Lcom/vk/music/dto/Playlist;

    invoke-direct {v1, v2}, Lcom/vkontakte/android/data/VKList$ReflectionParser;-><init>(Ljava/lang/Class;)V

    invoke-static {p1, v0, v1}, Lcom/vkontakte/android/data/Parser;->parseArray(Lorg/json/JSONObject;Ljava/lang/String;Lcom/vkontakte/android/data/Parser;)Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/music/dto/Section;->playlists:Ljava/util/ArrayList;

    .line 56
    const-string/jumbo v0, "audios"

    new-instance v1, Lcom/vkontakte/android/data/VKList$ReflectionParser;

    const-class v2, Lcom/vkontakte/android/audio/MusicTrack;

    invoke-direct {v1, v2}, Lcom/vkontakte/android/data/VKList$ReflectionParser;-><init>(Ljava/lang/Class;)V

    invoke-static {p1, v0, v1}, Lcom/vkontakte/android/data/Parser;->parseArray(Lorg/json/JSONObject;Ljava/lang/String;Lcom/vkontakte/android/data/Parser;)Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/music/dto/Section;->audios:Ljava/util/ArrayList;

    .line 57
    const-string/jumbo v0, "thumbs"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    invoke-static {v0}, Lcom/vk/music/dto/Section;->parseThumbs(Lorg/json/JSONArray;)Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/music/dto/Section;->thumbs:Ljava/util/ArrayList;

    .line 58
    const-string/jumbo v0, "extended_playlists"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    invoke-static {v0}, Lcom/vk/music/dto/Section;->parseExtendedPlaylist(Lorg/json/JSONArray;)Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/music/dto/Section;->extendedPlaylists:Ljava/util/ArrayList;

    .line 60
    sget-object v0, Lcom/vk/music/dto/Section$2;->$SwitchMap$com$vk$music$dto$Section$Type:[I

    iget-object v1, p0, Lcom/vk/music/dto/Section;->type:Lcom/vk/music/dto/Section$Type;

    invoke-virtual {v1}, Lcom/vk/music/dto/Section$Type;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 67
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vk/music/dto/Section;->profiles:Ljava/util/ArrayList;

    .line 70
    :goto_0
    return-void

    .line 64
    :pswitch_0
    iget-object v0, p0, Lcom/vk/music/dto/Section;->type:Lcom/vk/music/dto/Section$Type;

    invoke-virtual {v0}, Lcom/vk/music/dto/Section$Type;->name()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    invoke-static {v0}, Lcom/vk/music/dto/Section;->parseUserProfiles(Lorg/json/JSONArray;)Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/music/dto/Section;->profiles:Ljava/util/ArrayList;

    goto :goto_0

    .line 60
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method private static parseExtendedPlaylist(Lorg/json/JSONArray;)Ljava/util/ArrayList;
    .locals 5
    .param p0, "jArray"    # Lorg/json/JSONArray;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONArray;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vk/music/dto/ExtendedPlaylist;",
            ">;"
        }
    .end annotation

    .prologue
    .line 75
    if-eqz p0, :cond_1

    .line 76
    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v3

    .line 77
    .local v3, "size":I
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 78
    .local v0, "extendedPlaylists":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/music/dto/ExtendedPlaylist;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v3, :cond_2

    .line 79
    invoke-virtual {p0, v1}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    .line 80
    .local v2, "object":Lorg/json/JSONObject;
    if-eqz v2, :cond_0

    .line 81
    new-instance v4, Lcom/vk/music/dto/ExtendedPlaylist;

    invoke-direct {v4, v2}, Lcom/vk/music/dto/ExtendedPlaylist;-><init>(Lorg/json/JSONObject;)V

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 78
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 86
    .end local v0    # "extendedPlaylists":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/music/dto/ExtendedPlaylist;>;"
    .end local v1    # "i":I
    .end local v2    # "object":Lorg/json/JSONObject;
    .end local v3    # "size":I
    :cond_1
    const/4 v0, 0x0

    :cond_2
    return-object v0
.end method

.method private static parseThumbs(Lorg/json/JSONArray;)Ljava/util/ArrayList;
    .locals 5
    .param p0, "jArray"    # Lorg/json/JSONArray;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONArray;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vk/music/dto/Thumb;",
            ">;"
        }
    .end annotation

    .prologue
    .line 91
    if-eqz p0, :cond_1

    .line 92
    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v2

    .line 93
    .local v2, "size":I
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 94
    .local v3, "thumbs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/music/dto/Thumb;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, v2, :cond_2

    .line 95
    invoke-virtual {p0, v0}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v1

    .line 96
    .local v1, "object":Lorg/json/JSONObject;
    if-eqz v1, :cond_0

    .line 97
    new-instance v4, Lcom/vk/music/dto/Thumb;

    invoke-direct {v4, v1}, Lcom/vk/music/dto/Thumb;-><init>(Lorg/json/JSONObject;)V

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 94
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 102
    .end local v0    # "i":I
    .end local v1    # "object":Lorg/json/JSONObject;
    .end local v2    # "size":I
    .end local v3    # "thumbs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/music/dto/Thumb;>;"
    :cond_1
    const/4 v3, 0x0

    :cond_2
    return-object v3
.end method

.method private static parseUserProfiles(Lorg/json/JSONArray;)Ljava/util/ArrayList;
    .locals 9
    .param p0, "jArray"    # Lorg/json/JSONArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONArray;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;"
        }
    .end annotation

    .prologue
    .line 107
    if-eqz p0, :cond_2

    .line 108
    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v5

    .line 109
    .local v5, "size":I
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4, v5}, Ljava/util/ArrayList;-><init>(I)V

    .line 110
    .local v4, "profiles":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v5, :cond_3

    .line 112
    :try_start_0
    invoke-virtual {p0, v1}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    .line 113
    .local v2, "jItem":Lorg/json/JSONObject;
    const-string/jumbo v7, "profile"

    const-string/jumbo v8, "type"

    invoke-virtual {v2, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    .line 115
    .local v6, "users":Z
    new-instance v3, Lcom/vkontakte/android/UserProfile;

    invoke-direct {v3, v2}, Lcom/vkontakte/android/UserProfile;-><init>(Lorg/json/JSONObject;)V

    .line 116
    .local v3, "profile":Lcom/vkontakte/android/UserProfile;
    iget v8, v3, Lcom/vkontakte/android/UserProfile;->uid:I

    if-eqz v6, :cond_1

    const/4 v7, 0x1

    :goto_1
    mul-int/2addr v7, v8

    iput v7, v3, Lcom/vkontakte/android/UserProfile;->uid:I

    .line 117
    iget v7, v3, Lcom/vkontakte/android/UserProfile;->uid:I

    if-gez v7, :cond_0

    .line 118
    invoke-virtual {p0, v1}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v7

    const-string/jumbo v8, "name"

    invoke-virtual {v7, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iput-object v7, v3, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    .line 120
    :cond_0
    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 110
    .end local v2    # "jItem":Lorg/json/JSONObject;
    .end local v3    # "profile":Lcom/vkontakte/android/UserProfile;
    .end local v6    # "users":Z
    :goto_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 116
    .restart local v2    # "jItem":Lorg/json/JSONObject;
    .restart local v3    # "profile":Lcom/vkontakte/android/UserProfile;
    .restart local v6    # "users":Z
    :cond_1
    const/4 v7, -0x1

    goto :goto_1

    .line 121
    .end local v2    # "jItem":Lorg/json/JSONObject;
    .end local v3    # "profile":Lcom/vkontakte/android/UserProfile;
    .end local v6    # "users":Z
    :catch_0
    move-exception v0

    .line 122
    .local v0, "e":Ljava/lang/Exception;
    const/4 v7, 0x0

    new-array v7, v7, [Ljava/lang/Object;

    invoke-static {v0, v7}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto :goto_2

    .line 127
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v1    # "i":I
    .end local v4    # "profiles":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    .end local v5    # "size":I
    :cond_2
    const/4 v4, 0x0

    :cond_3
    return-object v4
.end method


# virtual methods
.method public serializeTo(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 1
    .param p1, "s"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 151
    iget v0, p0, Lcom/vk/music/dto/Section;->id:I

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 152
    iget-object v0, p0, Lcom/vk/music/dto/Section;->type:Lcom/vk/music/dto/Section$Type;

    invoke-virtual {v0}, Lcom/vk/music/dto/Section$Type;->name()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 153
    iget-object v0, p0, Lcom/vk/music/dto/Section;->title:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 154
    iget-object v0, p0, Lcom/vk/music/dto/Section;->subtitle:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 155
    iget v0, p0, Lcom/vk/music/dto/Section;->count:I

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 156
    iget-object v0, p0, Lcom/vk/music/dto/Section;->source:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 158
    iget-object v0, p0, Lcom/vk/music/dto/Section;->playlists:Ljava/util/ArrayList;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeTypedList(Ljava/util/List;)V

    .line 159
    iget-object v0, p0, Lcom/vk/music/dto/Section;->extendedPlaylists:Ljava/util/ArrayList;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeTypedList(Ljava/util/List;)V

    .line 160
    iget-object v0, p0, Lcom/vk/music/dto/Section;->audios:Ljava/util/ArrayList;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeTypedList(Ljava/util/List;)V

    .line 161
    iget-object v0, p0, Lcom/vk/music/dto/Section;->profiles:Ljava/util/ArrayList;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeTypedList(Ljava/util/List;)V

    .line 162
    iget-object v0, p0, Lcom/vk/music/dto/Section;->thumbs:Ljava/util/ArrayList;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeTypedList(Ljava/util/List;)V

    .line 163
    return-void
.end method
