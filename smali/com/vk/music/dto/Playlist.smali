.class public final Lcom/vk/music/dto/Playlist;
.super Lcom/vkontakte/android/utils/Serializer$SerializableAdapter;
.source "Playlist.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/music/dto/Playlist$Type;
    }
.end annotation


# static fields
.field public static final CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/utils/Serializer$Creator",
            "<",
            "Lcom/vk/music/dto/Playlist;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE_ALBUM:I = 0x1

.field public static final TYPE_PLAYLIST:I = 0x0

.field public static final TYPE_SAVED:I = 0x2


# instance fields
.field public accessKey:Ljava/lang/String;

.field public artists:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/vk/music/dto/Artist;",
            ">;"
        }
    .end annotation
.end field

.field public audioCount:I

.field public createTime:J

.field public description:Ljava/lang/String;

.field public followed:Lcom/vk/music/dto/PlaylistLink;

.field public followersCount:I

.field public following:Z

.field public genres:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/vk/music/dto/Genre;",
            ">;"
        }
    .end annotation
.end field

.field public id:I

.field public listeningsCount:I

.field public original:Lcom/vk/music/dto/PlaylistLink;

.field public ownerId:I

.field public photo:Lcom/vk/music/dto/Thumb;

.field public thumbs:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/vk/music/dto/Thumb;",
            ">;"
        }
    .end annotation
.end field

.field public title:Ljava/lang/String;

.field public type:I

.field public updateTime:J

.field public year:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 251
    new-instance v0, Lcom/vk/music/dto/Playlist$1;

    invoke-direct {v0}, Lcom/vk/music/dto/Playlist$1;-><init>()V

    sput-object v0, Lcom/vk/music/dto/Playlist;->CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;

    return-void
.end method

.method public constructor <init>(Lcom/vk/music/dto/Playlist;)V
    .locals 2
    .param p1, "playlist"    # Lcom/vk/music/dto/Playlist;

    .prologue
    .line 124
    invoke-direct {p0}, Lcom/vkontakte/android/utils/Serializer$SerializableAdapter;-><init>()V

    .line 125
    iget v0, p1, Lcom/vk/music/dto/Playlist;->id:I

    iput v0, p0, Lcom/vk/music/dto/Playlist;->id:I

    .line 126
    iget v0, p1, Lcom/vk/music/dto/Playlist;->ownerId:I

    iput v0, p0, Lcom/vk/music/dto/Playlist;->ownerId:I

    .line 127
    iget v0, p1, Lcom/vk/music/dto/Playlist;->type:I

    iput v0, p0, Lcom/vk/music/dto/Playlist;->type:I

    .line 128
    iget-object v0, p1, Lcom/vk/music/dto/Playlist;->original:Lcom/vk/music/dto/PlaylistLink;

    iput-object v0, p0, Lcom/vk/music/dto/Playlist;->original:Lcom/vk/music/dto/PlaylistLink;

    .line 129
    iget-object v0, p1, Lcom/vk/music/dto/Playlist;->followed:Lcom/vk/music/dto/PlaylistLink;

    iput-object v0, p0, Lcom/vk/music/dto/Playlist;->followed:Lcom/vk/music/dto/PlaylistLink;

    .line 130
    iget-object v0, p1, Lcom/vk/music/dto/Playlist;->title:Ljava/lang/String;

    iput-object v0, p0, Lcom/vk/music/dto/Playlist;->title:Ljava/lang/String;

    .line 131
    iget-object v0, p1, Lcom/vk/music/dto/Playlist;->description:Ljava/lang/String;

    iput-object v0, p0, Lcom/vk/music/dto/Playlist;->description:Ljava/lang/String;

    .line 132
    iget v0, p1, Lcom/vk/music/dto/Playlist;->year:I

    iput v0, p0, Lcom/vk/music/dto/Playlist;->year:I

    .line 133
    iget-object v0, p1, Lcom/vk/music/dto/Playlist;->photo:Lcom/vk/music/dto/Thumb;

    iput-object v0, p0, Lcom/vk/music/dto/Playlist;->photo:Lcom/vk/music/dto/Thumb;

    .line 134
    iget-object v0, p1, Lcom/vk/music/dto/Playlist;->genres:Ljava/util/List;

    iput-object v0, p0, Lcom/vk/music/dto/Playlist;->genres:Ljava/util/List;

    .line 135
    iget-object v0, p1, Lcom/vk/music/dto/Playlist;->artists:Ljava/util/List;

    iput-object v0, p0, Lcom/vk/music/dto/Playlist;->artists:Ljava/util/List;

    .line 136
    iget-object v0, p1, Lcom/vk/music/dto/Playlist;->thumbs:Ljava/util/List;

    iput-object v0, p0, Lcom/vk/music/dto/Playlist;->thumbs:Ljava/util/List;

    .line 137
    iget-boolean v0, p1, Lcom/vk/music/dto/Playlist;->following:Z

    iput-boolean v0, p0, Lcom/vk/music/dto/Playlist;->following:Z

    .line 138
    iget v0, p1, Lcom/vk/music/dto/Playlist;->listeningsCount:I

    iput v0, p0, Lcom/vk/music/dto/Playlist;->listeningsCount:I

    .line 139
    iget v0, p1, Lcom/vk/music/dto/Playlist;->followersCount:I

    iput v0, p0, Lcom/vk/music/dto/Playlist;->followersCount:I

    .line 140
    iget v0, p1, Lcom/vk/music/dto/Playlist;->audioCount:I

    iput v0, p0, Lcom/vk/music/dto/Playlist;->audioCount:I

    .line 141
    iget-wide v0, p1, Lcom/vk/music/dto/Playlist;->createTime:J

    iput-wide v0, p0, Lcom/vk/music/dto/Playlist;->createTime:J

    .line 142
    iget-wide v0, p1, Lcom/vk/music/dto/Playlist;->updateTime:J

    iput-wide v0, p0, Lcom/vk/music/dto/Playlist;->updateTime:J

    .line 143
    iget-object v0, p1, Lcom/vk/music/dto/Playlist;->accessKey:Ljava/lang/String;

    iput-object v0, p0, Lcom/vk/music/dto/Playlist;->accessKey:Ljava/lang/String;

    .line 144
    return-void
.end method

.method private constructor <init>(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 3
    .param p1, "in"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 146
    invoke-direct {p0}, Lcom/vkontakte/android/utils/Serializer$SerializableAdapter;-><init>()V

    .line 147
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vk/music/dto/Playlist;->id:I

    .line 148
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vk/music/dto/Playlist;->ownerId:I

    .line 150
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readByte()B

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 153
    :pswitch_0
    iput v1, p0, Lcom/vk/music/dto/Playlist;->type:I

    .line 163
    :goto_0
    const-class v0, Lcom/vk/music/dto/PlaylistLink;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->readSerializable(Ljava/lang/ClassLoader;)Lcom/vkontakte/android/utils/Serializer$Serializable;

    move-result-object v0

    check-cast v0, Lcom/vk/music/dto/PlaylistLink;

    iput-object v0, p0, Lcom/vk/music/dto/Playlist;->original:Lcom/vk/music/dto/PlaylistLink;

    .line 164
    const-class v0, Lcom/vk/music/dto/PlaylistLink;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->readSerializable(Ljava/lang/ClassLoader;)Lcom/vkontakte/android/utils/Serializer$Serializable;

    move-result-object v0

    check-cast v0, Lcom/vk/music/dto/PlaylistLink;

    iput-object v0, p0, Lcom/vk/music/dto/Playlist;->followed:Lcom/vk/music/dto/PlaylistLink;

    .line 165
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/music/dto/Playlist;->title:Ljava/lang/String;

    .line 166
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/music/dto/Playlist;->description:Ljava/lang/String;

    .line 167
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vk/music/dto/Playlist;->year:I

    .line 168
    const-class v0, Lcom/vk/music/dto/Thumb;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->readSerializable(Ljava/lang/ClassLoader;)Lcom/vkontakte/android/utils/Serializer$Serializable;

    move-result-object v0

    check-cast v0, Lcom/vk/music/dto/Thumb;

    iput-object v0, p0, Lcom/vk/music/dto/Playlist;->photo:Lcom/vk/music/dto/Thumb;

    .line 169
    sget-object v0, Lcom/vk/music/dto/Genre;->CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->createTypedArrayList(Lcom/vkontakte/android/utils/Serializer$Creator;)Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/music/dto/Playlist;->genres:Ljava/util/List;

    .line 170
    sget-object v0, Lcom/vk/music/dto/Artist;->CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->createTypedArrayList(Lcom/vkontakte/android/utils/Serializer$Creator;)Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/music/dto/Playlist;->artists:Ljava/util/List;

    .line 171
    sget-object v0, Lcom/vk/music/dto/Thumb;->CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->createTypedArrayList(Lcom/vkontakte/android/utils/Serializer$Creator;)Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/music/dto/Playlist;->thumbs:Ljava/util/List;

    .line 172
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readByte()B

    move-result v0

    if-ne v0, v1, :cond_0

    move v0, v1

    :goto_1
    iput-boolean v0, p0, Lcom/vk/music/dto/Playlist;->following:Z

    .line 173
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vk/music/dto/Playlist;->listeningsCount:I

    .line 174
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vk/music/dto/Playlist;->followersCount:I

    .line 175
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vk/music/dto/Playlist;->audioCount:I

    .line 176
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readLong()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/vk/music/dto/Playlist;->createTime:J

    .line 177
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readLong()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/vk/music/dto/Playlist;->updateTime:J

    .line 178
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/music/dto/Playlist;->accessKey:Ljava/lang/String;

    .line 179
    return-void

    .line 156
    :pswitch_1
    iput v2, p0, Lcom/vk/music/dto/Playlist;->type:I

    goto/16 :goto_0

    .line 159
    :pswitch_2
    const/4 v0, 0x2

    iput v0, p0, Lcom/vk/music/dto/Playlist;->type:I

    goto/16 :goto_0

    :cond_0
    move v0, v2

    .line 172
    goto :goto_1

    .line 150
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/utils/Serializer;Lcom/vk/music/dto/Playlist$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/utils/Serializer;
    .param p2, "x1"    # Lcom/vk/music/dto/Playlist$1;

    .prologue
    .line 21
    invoke-direct {p0, p1}, Lcom/vk/music/dto/Playlist;-><init>(Lcom/vkontakte/android/utils/Serializer;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .param p1, "title"    # Ljava/lang/String;
    .param p2, "ownerId"    # I
    .param p3, "type"    # I

    .prologue
    .line 59
    invoke-direct {p0}, Lcom/vkontakte/android/utils/Serializer$SerializableAdapter;-><init>()V

    .line 60
    iput-object p1, p0, Lcom/vk/music/dto/Playlist;->title:Ljava/lang/String;

    .line 61
    iput p2, p0, Lcom/vk/music/dto/Playlist;->ownerId:I

    .line 62
    iput p3, p0, Lcom/vk/music/dto/Playlist;->type:I

    .line 63
    return-void
.end method

.method public constructor <init>(Lorg/json/JSONObject;)V
    .locals 8
    .param p1, "jPlaylist"    # Lorg/json/JSONObject;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    const/4 v5, 0x1

    .line 65
    invoke-direct {p0}, Lcom/vkontakte/android/utils/Serializer$SerializableAdapter;-><init>()V

    .line 66
    const-string/jumbo v6, "id"

    invoke-virtual {p1, v6}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v6

    iput v6, p0, Lcom/vk/music/dto/Playlist;->id:I

    .line 67
    const-string/jumbo v6, "owner_id"

    invoke-virtual {p1, v6}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v6

    iput v6, p0, Lcom/vk/music/dto/Playlist;->ownerId:I

    .line 68
    const-string/jumbo v6, "type"

    invoke-virtual {p1, v6}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v6

    if-ne v6, v5, :cond_3

    :goto_0
    iput v5, p0, Lcom/vk/music/dto/Playlist;->type:I

    .line 69
    const-string/jumbo v5, "original"

    invoke-virtual {p1, v5}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 70
    new-instance v5, Lcom/vk/music/dto/PlaylistLink;

    const-string/jumbo v6, "original"

    invoke-virtual {p1, v6}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v6

    invoke-direct {v5, v6}, Lcom/vk/music/dto/PlaylistLink;-><init>(Lorg/json/JSONObject;)V

    iput-object v5, p0, Lcom/vk/music/dto/Playlist;->original:Lcom/vk/music/dto/PlaylistLink;

    .line 72
    :cond_0
    const-string/jumbo v5, "followed"

    invoke-virtual {p1, v5}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 73
    new-instance v5, Lcom/vk/music/dto/PlaylistLink;

    const-string/jumbo v6, "followed"

    invoke-virtual {p1, v6}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v6

    invoke-direct {v5, v6}, Lcom/vk/music/dto/PlaylistLink;-><init>(Lorg/json/JSONObject;)V

    iput-object v5, p0, Lcom/vk/music/dto/Playlist;->followed:Lcom/vk/music/dto/PlaylistLink;

    .line 75
    :cond_1
    const-string/jumbo v5, "title"

    invoke-virtual {p1, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lcom/vk/music/dto/Playlist;->title:Ljava/lang/String;

    .line 76
    const-string/jumbo v5, "description"

    invoke-virtual {p1, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lcom/vk/music/dto/Playlist;->description:Ljava/lang/String;

    .line 77
    const-string/jumbo v5, "year"

    invoke-virtual {p1, v5}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v5

    iput v5, p0, Lcom/vk/music/dto/Playlist;->year:I

    .line 78
    const-string/jumbo v5, "photo"

    invoke-virtual {p1, v5}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 79
    new-instance v5, Lcom/vk/music/dto/Thumb;

    const-string/jumbo v6, "photo"

    invoke-virtual {p1, v6}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v6

    invoke-direct {v5, v6}, Lcom/vk/music/dto/Thumb;-><init>(Lorg/json/JSONObject;)V

    iput-object v5, p0, Lcom/vk/music/dto/Playlist;->photo:Lcom/vk/music/dto/Thumb;

    .line 81
    :cond_2
    const-string/jumbo v5, "genres"

    invoke-virtual {p1, v5}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 82
    const-string/jumbo v5, "genres"

    invoke-virtual {p1, v5}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v2

    .line 83
    .local v2, "jGenres":Lorg/json/JSONArray;
    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v4

    .line 84
    .local v4, "length":I
    if-lez v4, :cond_4

    .line 85
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5, v4}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v5, p0, Lcom/vk/music/dto/Playlist;->genres:Ljava/util/List;

    .line 86
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    if-ge v0, v4, :cond_4

    .line 87
    iget-object v5, p0, Lcom/vk/music/dto/Playlist;->genres:Ljava/util/List;

    new-instance v6, Lcom/vk/music/dto/Genre;

    invoke-virtual {v2, v0}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v7

    invoke-direct {v6, v7}, Lcom/vk/music/dto/Genre;-><init>(Lorg/json/JSONObject;)V

    invoke-interface {v5, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 86
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 68
    .end local v0    # "i":I
    .end local v2    # "jGenres":Lorg/json/JSONArray;
    .end local v4    # "length":I
    :cond_3
    const/4 v5, 0x0

    goto/16 :goto_0

    .line 91
    :cond_4
    const-string/jumbo v5, "artists"

    invoke-virtual {p1, v5}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_5

    .line 92
    const-string/jumbo v5, "artists"

    invoke-virtual {p1, v5}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    .line 93
    .local v1, "jArtists":Lorg/json/JSONArray;
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v4

    .line 94
    .restart local v4    # "length":I
    if-lez v4, :cond_5

    .line 95
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5, v4}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v5, p0, Lcom/vk/music/dto/Playlist;->artists:Ljava/util/List;

    .line 96
    const/4 v0, 0x0

    .restart local v0    # "i":I
    :goto_2
    if-ge v0, v4, :cond_5

    .line 97
    iget-object v5, p0, Lcom/vk/music/dto/Playlist;->artists:Ljava/util/List;

    new-instance v6, Lcom/vk/music/dto/Artist;

    invoke-virtual {v1, v0}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v7

    invoke-direct {v6, v7}, Lcom/vk/music/dto/Artist;-><init>(Lorg/json/JSONObject;)V

    invoke-interface {v5, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 96
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 101
    .end local v0    # "i":I
    .end local v1    # "jArtists":Lorg/json/JSONArray;
    .end local v4    # "length":I
    :cond_5
    const-string/jumbo v5, "thumbs"

    invoke-virtual {p1, v5}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_6

    .line 102
    const-string/jumbo v5, "thumbs"

    invoke-virtual {p1, v5}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v3

    .line 103
    .local v3, "jThumb":Lorg/json/JSONArray;
    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v4

    .line 104
    .restart local v4    # "length":I
    if-lez v4, :cond_6

    .line 105
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5, v4}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v5, p0, Lcom/vk/music/dto/Playlist;->thumbs:Ljava/util/List;

    .line 106
    const/4 v0, 0x0

    .restart local v0    # "i":I
    :goto_3
    if-ge v0, v4, :cond_6

    .line 107
    iget-object v5, p0, Lcom/vk/music/dto/Playlist;->thumbs:Ljava/util/List;

    new-instance v6, Lcom/vk/music/dto/Thumb;

    invoke-virtual {v3, v0}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v7

    invoke-direct {v6, v7}, Lcom/vk/music/dto/Thumb;-><init>(Lorg/json/JSONObject;)V

    invoke-interface {v5, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 106
    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    .line 112
    .end local v0    # "i":I
    .end local v3    # "jThumb":Lorg/json/JSONArray;
    .end local v4    # "length":I
    :cond_6
    const-string/jumbo v5, "is_following"

    invoke-virtual {p1, v5}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v5

    iput-boolean v5, p0, Lcom/vk/music/dto/Playlist;->following:Z

    .line 114
    const-string/jumbo v5, "plays"

    invoke-virtual {p1, v5}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v5

    iput v5, p0, Lcom/vk/music/dto/Playlist;->listeningsCount:I

    .line 115
    const-string/jumbo v5, "followers"

    invoke-virtual {p1, v5}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v5

    iput v5, p0, Lcom/vk/music/dto/Playlist;->followersCount:I

    .line 116
    const-string/jumbo v5, "count"

    invoke-virtual {p1, v5}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v5

    iput v5, p0, Lcom/vk/music/dto/Playlist;->audioCount:I

    .line 118
    const-string/jumbo v5, "create_time"

    invoke-virtual {p1, v5}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    move-result-wide v6

    iput-wide v6, p0, Lcom/vk/music/dto/Playlist;->createTime:J

    .line 119
    const-string/jumbo v5, "update_time"

    invoke-virtual {p1, v5}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    move-result-wide v6

    iput-wide v6, p0, Lcom/vk/music/dto/Playlist;->updateTime:J

    .line 121
    const-string/jumbo v5, "access_key"

    invoke-virtual {p1, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lcom/vk/music/dto/Playlist;->accessKey:Ljava/lang/String;

    .line 122
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 224
    if-ne p0, p1, :cond_1

    .line 229
    :cond_0
    :goto_0
    return v1

    .line 225
    :cond_1
    if-eqz p1, :cond_2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_3

    :cond_2
    move v1, v2

    goto :goto_0

    :cond_3
    move-object v0, p1

    .line 227
    check-cast v0, Lcom/vk/music/dto/Playlist;

    .line 229
    .local v0, "playlist":Lcom/vk/music/dto/Playlist;
    iget v3, p0, Lcom/vk/music/dto/Playlist;->id:I

    iget v4, v0, Lcom/vk/music/dto/Playlist;->id:I

    if-eq v3, v4, :cond_0

    move v1, v2

    goto :goto_0
.end method

.method public getOriginalPlaylist()Lcom/vk/music/dto/Playlist;
    .locals 4
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 206
    iget-object v1, p0, Lcom/vk/music/dto/Playlist;->original:Lcom/vk/music/dto/PlaylistLink;

    if-nez v1, :cond_0

    .line 218
    .end local p0    # "this":Lcom/vk/music/dto/Playlist;
    :goto_0
    return-object p0

    .line 209
    .restart local p0    # "this":Lcom/vk/music/dto/Playlist;
    :cond_0
    new-instance v0, Lcom/vk/music/dto/Playlist;

    invoke-direct {v0, p0}, Lcom/vk/music/dto/Playlist;-><init>(Lcom/vk/music/dto/Playlist;)V

    .line 210
    .local v0, "original":Lcom/vk/music/dto/Playlist;
    iget-object v1, p0, Lcom/vk/music/dto/Playlist;->original:Lcom/vk/music/dto/PlaylistLink;

    iget v1, v1, Lcom/vk/music/dto/PlaylistLink;->id:I

    iput v1, v0, Lcom/vk/music/dto/Playlist;->id:I

    .line 211
    iget-object v1, p0, Lcom/vk/music/dto/Playlist;->original:Lcom/vk/music/dto/PlaylistLink;

    iget v1, v1, Lcom/vk/music/dto/PlaylistLink;->ownerId:I

    iput v1, v0, Lcom/vk/music/dto/Playlist;->ownerId:I

    .line 212
    iget-object v1, p0, Lcom/vk/music/dto/Playlist;->original:Lcom/vk/music/dto/PlaylistLink;

    iget-object v1, v1, Lcom/vk/music/dto/PlaylistLink;->accessKey:Ljava/lang/String;

    iput-object v1, v0, Lcom/vk/music/dto/Playlist;->accessKey:Ljava/lang/String;

    .line 213
    const/4 v1, 0x0

    iput-object v1, v0, Lcom/vk/music/dto/Playlist;->original:Lcom/vk/music/dto/PlaylistLink;

    .line 214
    iget v1, p0, Lcom/vk/music/dto/Playlist;->ownerId:I

    invoke-static {v1}, Lcom/vkontakte/android/auth/VKAccountManager;->isCurrentUser(I)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 215
    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/vk/music/dto/Playlist;->following:Z

    .line 216
    new-instance v1, Lcom/vk/music/dto/PlaylistLink;

    iget v2, p0, Lcom/vk/music/dto/Playlist;->id:I

    iget v3, p0, Lcom/vk/music/dto/Playlist;->ownerId:I

    invoke-direct {v1, v2, v3}, Lcom/vk/music/dto/PlaylistLink;-><init>(II)V

    iput-object v1, v0, Lcom/vk/music/dto/Playlist;->followed:Lcom/vk/music/dto/PlaylistLink;

    :cond_1
    move-object p0, v0

    .line 218
    goto :goto_0
.end method

.method public getPid()J
    .locals 6

    .prologue
    .line 248
    iget v0, p0, Lcom/vk/music/dto/Playlist;->ownerId:I

    int-to-long v0, v0

    const/16 v2, 0x20

    shl-long/2addr v0, v2

    iget v2, p0, Lcom/vk/music/dto/Playlist;->id:I

    int-to-long v2, v2

    const-wide/32 v4, 0xfffff

    and-long/2addr v2, v4

    or-long/2addr v0, v2

    return-wide v0
.end method

.method public hashCode()I
    .locals 1

    .prologue
    .line 234
    iget v0, p0, Lcom/vk/music/dto/Playlist;->id:I

    return v0
.end method

.method public serializeTo(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 2
    .param p1, "s"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 183
    iget v0, p0, Lcom/vk/music/dto/Playlist;->id:I

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 184
    iget v0, p0, Lcom/vk/music/dto/Playlist;->ownerId:I

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 185
    iget v0, p0, Lcom/vk/music/dto/Playlist;->type:I

    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeByte(B)V

    .line 186
    iget-object v0, p0, Lcom/vk/music/dto/Playlist;->original:Lcom/vk/music/dto/PlaylistLink;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeSerializable(Lcom/vkontakte/android/utils/Serializer$Serializable;)V

    .line 187
    iget-object v0, p0, Lcom/vk/music/dto/Playlist;->followed:Lcom/vk/music/dto/PlaylistLink;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeSerializable(Lcom/vkontakte/android/utils/Serializer$Serializable;)V

    .line 188
    iget-object v0, p0, Lcom/vk/music/dto/Playlist;->title:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 189
    iget-object v0, p0, Lcom/vk/music/dto/Playlist;->description:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 190
    iget v0, p0, Lcom/vk/music/dto/Playlist;->year:I

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 191
    iget-object v0, p0, Lcom/vk/music/dto/Playlist;->photo:Lcom/vk/music/dto/Thumb;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeSerializable(Lcom/vkontakte/android/utils/Serializer$Serializable;)V

    .line 192
    iget-object v0, p0, Lcom/vk/music/dto/Playlist;->genres:Ljava/util/List;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeTypedList(Ljava/util/List;)V

    .line 193
    iget-object v0, p0, Lcom/vk/music/dto/Playlist;->artists:Ljava/util/List;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeTypedList(Ljava/util/List;)V

    .line 194
    iget-object v0, p0, Lcom/vk/music/dto/Playlist;->thumbs:Ljava/util/List;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeTypedList(Ljava/util/List;)V

    .line 195
    iget-boolean v0, p0, Lcom/vk/music/dto/Playlist;->following:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeByte(B)V

    .line 196
    iget v0, p0, Lcom/vk/music/dto/Playlist;->listeningsCount:I

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 197
    iget v0, p0, Lcom/vk/music/dto/Playlist;->followersCount:I

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 198
    iget v0, p0, Lcom/vk/music/dto/Playlist;->audioCount:I

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 199
    iget-wide v0, p0, Lcom/vk/music/dto/Playlist;->createTime:J

    invoke-virtual {p1, v0, v1}, Lcom/vkontakte/android/utils/Serializer;->writeLong(J)V

    .line 200
    iget-wide v0, p0, Lcom/vk/music/dto/Playlist;->updateTime:J

    invoke-virtual {p1, v0, v1}, Lcom/vkontakte/android/utils/Serializer;->writeLong(J)V

    .line 201
    iget-object v0, p0, Lcom/vk/music/dto/Playlist;->accessKey:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 202
    return-void

    .line 195
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 239
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "Playlist{id="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/vk/music/dto/Playlist;->id:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", title=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/vk/music/dto/Playlist;->title:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x27

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", audioCount="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/vk/music/dto/Playlist;->audioCount:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", ownerId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/vk/music/dto/Playlist;->ownerId:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
