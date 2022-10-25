.class public Lcom/vkontakte/android/audio/MusicTrack;
.super Lcom/vkontakte/android/audio/database/DataObject;
.source "MusicTrack.java"

# interfaces
.implements Landroid/os/Parcelable;
.implements Lcom/vkontakte/android/utils/Serializer$Serializable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/audio/MusicTrack$MusicTrackProvider;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/audio/database/DataObject",
        "<",
        "Lcom/vkontakte/android/audio/MusicTrack;",
        ">;",
        "Landroid/os/Parcelable;",
        "Lcom/vkontakte/android/utils/Serializer$Serializable;"
    }
.end annotation


# static fields
.field protected static final COLUMNS:[Ljava/lang/String;

.field private static final COLUMN_AID:Ljava/lang/String; = "aid"

.field private static final COLUMN_ARTIST:Ljava/lang/String; = "artist"

.field private static final COLUMN_DURATION:Ljava/lang/String; = "duration"

.field private static final COLUMN_LYRICS_ID:Ljava/lang/String; = "lyrics_id"

.field private static final COLUMN_LYRICS_TEXT:Ljava/lang/String; = "lyrics_text"

.field private static final COLUMN_OID:Ljava/lang/String; = "oid"

.field private static final COLUMN_PLAY_LIST_ID:Ljava/lang/String; = "playlist_id"

.field public static final COLUMN_RESTRICTION:Ljava/lang/String; = "restriction"

.field private static final COLUMN_TITLE:Ljava/lang/String; = "title"

.field private static final COLUMN_URL:Ljava/lang/String; = "url"

.field public static final CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/utils/Serializer$Creator",
            "<",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;"
        }
    .end annotation
.end field

.field private static final INDEX_AID:I

.field private static final INDEX_ARTIST:I

.field private static final INDEX_DURATION:I

.field private static final INDEX_LYRICS_ID:I

.field private static final INDEX_LYRICS_TEXT:I

.field private static final INDEX_OID:I

.field private static final INDEX_PLAY_LIST_ID:I

.field private static final INDEX_RESTRICTION:I

.field private static final INDEX_TITLE:I

.field private static final INDEX_URL:I

.field public static final RESTRICTION_LOCATION:I = 0x2

.field public static final RESTRICTION_NONE:I = 0x0

.field public static final RESTRICTION_WITHDRAWN:I = 0x1


# instance fields
.field public accessKey:Ljava/lang/String;

.field public aid:I

.field public album:Lcom/vk/music/dto/AlbumLink;

.field public artist:Ljava/lang/String;

.field public duration:I

.field public durationS:Ljava/lang/String;

.field private fileSize:I

.field public fromAttachment:Z

.field public lyricsID:I

.field public lyricsText:Ljava/lang/String;

.field protected mid:Ljava/lang/String;

.field public oid:I

.field public playlistId:Ljava/lang/String;

.field private restrictionTypeD:I

.field public title:Ljava/lang/String;

.field public url:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    .line 109
    sget-object v0, Lcom/vkontakte/android/audio/database/DataObject;->COLUMNS:[Ljava/lang/String;

    const/16 v1, 0xa

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string/jumbo v3, "artist"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string/jumbo v3, "title"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string/jumbo v3, "duration"

    aput-object v3, v1, v2

    const/4 v2, 0x3

    const-string/jumbo v3, "url"

    aput-object v3, v1, v2

    const/4 v2, 0x4

    const-string/jumbo v3, "aid"

    aput-object v3, v1, v2

    const/4 v2, 0x5

    const-string/jumbo v3, "oid"

    aput-object v3, v1, v2

    const/4 v2, 0x6

    const-string/jumbo v3, "lyrics_id"

    aput-object v3, v1, v2

    const/4 v2, 0x7

    const-string/jumbo v3, "lyrics_text"

    aput-object v3, v1, v2

    const/16 v2, 0x8

    const-string/jumbo v3, "playlist_id"

    aput-object v3, v1, v2

    const/16 v2, 0x9

    const-string/jumbo v3, "restriction"

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Lcom/vkontakte/android/audio/MusicTrack;->concatColumns([Ljava/lang/String;[Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/vkontakte/android/audio/MusicTrack;->COLUMNS:[Ljava/lang/String;

    .line 113
    sget-object v0, Lcom/vkontakte/android/audio/database/DataObject;->COLUMNS:[Ljava/lang/String;

    array-length v0, v0

    sput v0, Lcom/vkontakte/android/audio/MusicTrack;->INDEX_ARTIST:I

    .line 114
    sget v0, Lcom/vkontakte/android/audio/MusicTrack;->INDEX_ARTIST:I

    add-int/lit8 v0, v0, 0x1

    sput v0, Lcom/vkontakte/android/audio/MusicTrack;->INDEX_TITLE:I

    .line 115
    sget v0, Lcom/vkontakte/android/audio/MusicTrack;->INDEX_TITLE:I

    add-int/lit8 v0, v0, 0x1

    sput v0, Lcom/vkontakte/android/audio/MusicTrack;->INDEX_DURATION:I

    .line 116
    sget v0, Lcom/vkontakte/android/audio/MusicTrack;->INDEX_DURATION:I

    add-int/lit8 v0, v0, 0x1

    sput v0, Lcom/vkontakte/android/audio/MusicTrack;->INDEX_URL:I

    .line 117
    sget v0, Lcom/vkontakte/android/audio/MusicTrack;->INDEX_URL:I

    add-int/lit8 v0, v0, 0x1

    sput v0, Lcom/vkontakte/android/audio/MusicTrack;->INDEX_AID:I

    .line 118
    sget v0, Lcom/vkontakte/android/audio/MusicTrack;->INDEX_AID:I

    add-int/lit8 v0, v0, 0x1

    sput v0, Lcom/vkontakte/android/audio/MusicTrack;->INDEX_OID:I

    .line 119
    sget v0, Lcom/vkontakte/android/audio/MusicTrack;->INDEX_OID:I

    add-int/lit8 v0, v0, 0x1

    sput v0, Lcom/vkontakte/android/audio/MusicTrack;->INDEX_LYRICS_ID:I

    .line 120
    sget v0, Lcom/vkontakte/android/audio/MusicTrack;->INDEX_LYRICS_ID:I

    add-int/lit8 v0, v0, 0x1

    sput v0, Lcom/vkontakte/android/audio/MusicTrack;->INDEX_LYRICS_TEXT:I

    .line 121
    sget v0, Lcom/vkontakte/android/audio/MusicTrack;->INDEX_LYRICS_ID:I

    add-int/lit8 v0, v0, 0x1

    sput v0, Lcom/vkontakte/android/audio/MusicTrack;->INDEX_PLAY_LIST_ID:I

    .line 122
    sget v0, Lcom/vkontakte/android/audio/MusicTrack;->INDEX_PLAY_LIST_ID:I

    add-int/lit8 v0, v0, 0x1

    sput v0, Lcom/vkontakte/android/audio/MusicTrack;->INDEX_RESTRICTION:I

    .line 314
    new-instance v0, Lcom/vkontakte/android/audio/MusicTrack$1;

    invoke-direct {v0}, Lcom/vkontakte/android/audio/MusicTrack$1;-><init>()V

    sput-object v0, Lcom/vkontakte/android/audio/MusicTrack;->CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 140
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/vkontakte/android/audio/database/DataObject;-><init>(Lcom/vkontakte/android/audio/database/DataProvider;)V

    .line 43
    const/4 v0, 0x0

    iput v0, p0, Lcom/vkontakte/android/audio/MusicTrack;->restrictionTypeD:I

    .line 141
    return-void
.end method

.method public constructor <init>(IILjava/lang/String;Ljava/lang/String;ILjava/lang/String;)V
    .locals 4
    .param p1, "aid"    # I
    .param p2, "oid"    # I
    .param p3, "artist"    # Ljava/lang/String;
    .param p4, "title"    # Ljava/lang/String;
    .param p5, "duration"    # I
    .param p6, "url"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 144
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/vkontakte/android/audio/database/DataObject;-><init>(Lcom/vkontakte/android/audio/database/DataProvider;)V

    .line 43
    iput v3, p0, Lcom/vkontakte/android/audio/MusicTrack;->restrictionTypeD:I

    .line 145
    iput p1, p0, Lcom/vkontakte/android/audio/MusicTrack;->aid:I

    .line 146
    iput p2, p0, Lcom/vkontakte/android/audio/MusicTrack;->oid:I

    .line 147
    iput-object p3, p0, Lcom/vkontakte/android/audio/MusicTrack;->artist:Ljava/lang/String;

    .line 148
    iput-object p4, p0, Lcom/vkontakte/android/audio/MusicTrack;->title:Ljava/lang/String;

    .line 149
    iput p5, p0, Lcom/vkontakte/android/audio/MusicTrack;->duration:I

    .line 150
    iput-object p6, p0, Lcom/vkontakte/android/audio/MusicTrack;->url:Ljava/lang/String;

    .line 151
    const-string/jumbo v0, "%d:%02d"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    div-int/lit8 v2, p5, 0x3c

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v3

    const/4 v2, 0x1

    rem-int/lit8 v3, p5, 0x3c

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/audio/MusicTrack;->durationS:Ljava/lang/String;

    .line 152
    return-void
.end method

.method protected constructor <init>(Lcom/vkontakte/android/audio/database/DataProvider;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vkontakte/android/audio/database/DataProvider",
            "<+",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 180
    .local p1, "dataProvider":Lcom/vkontakte/android/audio/database/DataProvider;, "Lcom/vkontakte/android/audio/database/DataProvider<+Lcom/vkontakte/android/audio/MusicTrack;>;"
    invoke-direct {p0, p1}, Lcom/vkontakte/android/audio/database/DataObject;-><init>(Lcom/vkontakte/android/audio/database/DataProvider;)V

    .line 43
    const/4 v0, 0x0

    iput v0, p0, Lcom/vkontakte/android/audio/MusicTrack;->restrictionTypeD:I

    .line 181
    return-void
.end method

.method protected constructor <init>(Lcom/vkontakte/android/audio/database/DataProvider;Lcom/vkontakte/android/utils/Serializer;)V
    .locals 2
    .param p2, "in"    # Lcom/vkontakte/android/utils/Serializer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vkontakte/android/audio/database/DataProvider",
            "<+",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;",
            "Lcom/vkontakte/android/utils/Serializer;",
            ")V"
        }
    .end annotation

    .prologue
    .local p1, "dataProvider":Lcom/vkontakte/android/audio/database/DataProvider;, "Lcom/vkontakte/android/audio/database/DataProvider<+Lcom/vkontakte/android/audio/MusicTrack;>;"
    const/4 v0, 0x0

    .line 184
    invoke-direct {p0, p1}, Lcom/vkontakte/android/audio/database/DataObject;-><init>(Lcom/vkontakte/android/audio/database/DataProvider;)V

    .line 43
    iput v0, p0, Lcom/vkontakte/android/audio/MusicTrack;->restrictionTypeD:I

    .line 185
    if-eqz p2, :cond_1

    .line 186
    invoke-virtual {p2}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/audio/MusicTrack;->mid:Ljava/lang/String;

    .line 187
    invoke-virtual {p2}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/audio/MusicTrack;->artist:Ljava/lang/String;

    .line 188
    invoke-virtual {p2}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/audio/MusicTrack;->title:Ljava/lang/String;

    .line 189
    invoke-virtual {p2}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v1

    iput v1, p0, Lcom/vkontakte/android/audio/MusicTrack;->duration:I

    .line 190
    invoke-virtual {p2}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/audio/MusicTrack;->durationS:Ljava/lang/String;

    .line 191
    invoke-virtual {p2}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/audio/MusicTrack;->url:Ljava/lang/String;

    .line 192
    invoke-virtual {p2}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v1

    iput v1, p0, Lcom/vkontakte/android/audio/MusicTrack;->aid:I

    .line 193
    invoke-virtual {p2}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v1

    iput v1, p0, Lcom/vkontakte/android/audio/MusicTrack;->oid:I

    .line 194
    invoke-virtual {p2}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v1

    iput v1, p0, Lcom/vkontakte/android/audio/MusicTrack;->lyricsID:I

    .line 195
    invoke-virtual {p2}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/audio/MusicTrack;->lyricsText:Ljava/lang/String;

    .line 196
    invoke-virtual {p2}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v1

    iput v1, p0, Lcom/vkontakte/android/audio/MusicTrack;->fileSize:I

    .line 197
    invoke-virtual {p2}, Lcom/vkontakte/android/utils/Serializer;->readByte()B

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    iput-boolean v0, p0, Lcom/vkontakte/android/audio/MusicTrack;->fromAttachment:Z

    .line 198
    const-class v0, Lcom/vk/music/dto/AlbumLink;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p2, v0}, Lcom/vkontakte/android/utils/Serializer;->readSerializable(Ljava/lang/ClassLoader;)Lcom/vkontakte/android/utils/Serializer$Serializable;

    move-result-object v0

    check-cast v0, Lcom/vk/music/dto/AlbumLink;

    iput-object v0, p0, Lcom/vkontakte/android/audio/MusicTrack;->album:Lcom/vk/music/dto/AlbumLink;

    .line 199
    invoke-virtual {p2}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/audio/MusicTrack;->accessKey:Ljava/lang/String;

    .line 200
    invoke-virtual {p2}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/audio/MusicTrack;->setRestrictionType(I)V

    .line 202
    :cond_1
    return-void
.end method

.method public constructor <init>(Lorg/json/JSONObject;)V
    .locals 4
    .param p1, "o"    # Lorg/json/JSONObject;

    .prologue
    const/4 v3, 0x0

    .line 160
    const/4 v1, 0x0

    invoke-direct {p0, v1}, Lcom/vkontakte/android/audio/database/DataObject;-><init>(Lcom/vkontakte/android/audio/database/DataProvider;)V

    .line 43
    iput v3, p0, Lcom/vkontakte/android/audio/MusicTrack;->restrictionTypeD:I

    .line 162
    :try_start_0
    const-string/jumbo v1, "id"

    const-string/jumbo v2, "aid"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {p1, v1, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v1

    iput v1, p0, Lcom/vkontakte/android/audio/MusicTrack;->aid:I

    .line 163
    const-string/jumbo v1, "owner_id"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v1

    iput v1, p0, Lcom/vkontakte/android/audio/MusicTrack;->oid:I

    .line 164
    const-string/jumbo v1, "artist"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/audio/MusicTrack;->artist:Ljava/lang/String;

    .line 165
    const-string/jumbo v1, "title"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/audio/MusicTrack;->title:Ljava/lang/String;

    .line 166
    const-string/jumbo v1, "duration"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v1

    iput v1, p0, Lcom/vkontakte/android/audio/MusicTrack;->duration:I

    .line 167
    const-string/jumbo v1, "url"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/audio/MusicTrack;->url:Ljava/lang/String;

    .line 168
    const-string/jumbo v1, "lyrics_id"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v1

    iput v1, p0, Lcom/vkontakte/android/audio/MusicTrack;->lyricsID:I

    .line 169
    const-string/jumbo v1, "album"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 170
    new-instance v1, Lcom/vk/music/dto/AlbumLink;

    const-string/jumbo v2, "album"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/vk/music/dto/AlbumLink;-><init>(Lorg/json/JSONObject;)V

    iput-object v1, p0, Lcom/vkontakte/android/audio/MusicTrack;->album:Lcom/vk/music/dto/AlbumLink;

    .line 172
    :cond_0
    const-string/jumbo v1, "access_key"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/audio/MusicTrack;->accessKey:Ljava/lang/String;

    .line 173
    const-string/jumbo v1, "content_restricted"

    const/4 v2, 0x0

    invoke-virtual {p1, v1, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v1

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/audio/MusicTrack;->setRestrictionType(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 177
    :goto_0
    return-void

    .line 174
    :catch_0
    move-exception v0

    .line 175
    .local v0, "x":Ljava/lang/Exception;
    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const-string/jumbo v2, "Error parsing audio"

    aput-object v2, v1, v3

    const/4 v2, 0x1

    aput-object p1, v1, v2

    invoke-static {v0, v1}, Lcom/vkontakte/android/utils/L;->w(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public constructor <init>(Lorg/json/JSONObject;II)V
    .locals 2
    .param p1, "o"    # Lorg/json/JSONObject;
    .param p2, "ownerId"    # I
    .param p3, "playlistId"    # I

    .prologue
    .line 155
    invoke-direct {p0, p1}, Lcom/vkontakte/android/audio/MusicTrack;-><init>(Lorg/json/JSONObject;)V

    .line 156
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/audio/MusicTrack;->playlistId:Ljava/lang/String;

    .line 157
    return-void
.end method

.method protected static fillTable(Lcom/vkontakte/android/data/db/Table;)Lcom/vkontakte/android/data/db/Table;
    .locals 2
    .param p0, "table"    # Lcom/vkontakte/android/data/db/Table;

    .prologue
    .line 125
    const-string/jumbo v0, "_id"

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/data/db/Table;->withIntegerColumn(Ljava/lang/String;)Lcom/vkontakte/android/data/db/Table$Column;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/data/db/Table$Column;->setPrimaryKey()Lcom/vkontakte/android/data/db/Table$Column;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/data/db/Table$Column;->setAutoincrement()Lcom/vkontakte/android/data/db/Table$Column;

    move-result-object v0

    const-string/jumbo v1, "artist"

    .line 126
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/data/db/Table$Column;->withTextColumn(Ljava/lang/String;)Lcom/vkontakte/android/data/db/Table$Column;

    move-result-object v0

    const-string/jumbo v1, "title"

    .line 127
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/data/db/Table$Column;->withTextColumn(Ljava/lang/String;)Lcom/vkontakte/android/data/db/Table$Column;

    move-result-object v0

    const-string/jumbo v1, "duration"

    .line 128
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/data/db/Table$Column;->withIntegerColumn(Ljava/lang/String;)Lcom/vkontakte/android/data/db/Table$Column;

    move-result-object v0

    const-string/jumbo v1, "url"

    .line 129
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/data/db/Table$Column;->withTextColumn(Ljava/lang/String;)Lcom/vkontakte/android/data/db/Table$Column;

    move-result-object v0

    const-string/jumbo v1, "aid"

    .line 130
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/data/db/Table$Column;->withIntegerColumn(Ljava/lang/String;)Lcom/vkontakte/android/data/db/Table$Column;

    move-result-object v0

    const-string/jumbo v1, "oid"

    .line 131
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/data/db/Table$Column;->withIntegerColumn(Ljava/lang/String;)Lcom/vkontakte/android/data/db/Table$Column;

    move-result-object v0

    const-string/jumbo v1, "lyrics_id"

    .line 132
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/data/db/Table$Column;->withIntegerColumn(Ljava/lang/String;)Lcom/vkontakte/android/data/db/Table$Column;

    move-result-object v0

    const-string/jumbo v1, "lyrics_text"

    .line 133
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/data/db/Table$Column;->withTextColumn(Ljava/lang/String;)Lcom/vkontakte/android/data/db/Table$Column;

    move-result-object v0

    const-string/jumbo v1, "playlist_id"

    .line 134
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/data/db/Table$Column;->withIntegerColumn(Ljava/lang/String;)Lcom/vkontakte/android/data/db/Table$Column;

    move-result-object v0

    const-string/jumbo v1, "restriction"

    .line 135
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/data/db/Table$Column;->withIntegerColumn(Ljava/lang/String;)Lcom/vkontakte/android/data/db/Table$Column;

    .line 136
    return-object p0
.end method

.method static generateMid(II)Ljava/lang/String;
    .locals 2
    .param p0, "oid"    # I
    .param p1, "aid"    # I

    .prologue
    .line 219
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public changeIds(II)V
    .locals 1
    .param p1, "newOid"    # I
    .param p2, "newAid"    # I

    .prologue
    .line 205
    iput p1, p0, Lcom/vkontakte/android/audio/MusicTrack;->oid:I

    .line 206
    iput p2, p0, Lcom/vkontakte/android/audio/MusicTrack;->aid:I

    .line 207
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/audio/MusicTrack;->mid:Ljava/lang/String;

    .line 208
    return-void
.end method

.method protected copyBaseValues(Lcom/vkontakte/android/audio/MusicTrack;)V
    .locals 1
    .param p1, "track"    # Lcom/vkontakte/android/audio/MusicTrack;

    .prologue
    .line 223
    iget-object v0, p1, Lcom/vkontakte/android/audio/MusicTrack;->mid:Ljava/lang/String;

    iput-object v0, p0, Lcom/vkontakte/android/audio/MusicTrack;->mid:Ljava/lang/String;

    .line 224
    iget-object v0, p1, Lcom/vkontakte/android/audio/MusicTrack;->artist:Ljava/lang/String;

    iput-object v0, p0, Lcom/vkontakte/android/audio/MusicTrack;->artist:Ljava/lang/String;

    .line 225
    iget-object v0, p1, Lcom/vkontakte/android/audio/MusicTrack;->title:Ljava/lang/String;

    iput-object v0, p0, Lcom/vkontakte/android/audio/MusicTrack;->title:Ljava/lang/String;

    .line 226
    iget v0, p1, Lcom/vkontakte/android/audio/MusicTrack;->duration:I

    iput v0, p0, Lcom/vkontakte/android/audio/MusicTrack;->duration:I

    .line 227
    iget-object v0, p1, Lcom/vkontakte/android/audio/MusicTrack;->durationS:Ljava/lang/String;

    iput-object v0, p0, Lcom/vkontakte/android/audio/MusicTrack;->durationS:Ljava/lang/String;

    .line 228
    iget-object v0, p1, Lcom/vkontakte/android/audio/MusicTrack;->url:Ljava/lang/String;

    iput-object v0, p0, Lcom/vkontakte/android/audio/MusicTrack;->url:Ljava/lang/String;

    .line 229
    iget v0, p1, Lcom/vkontakte/android/audio/MusicTrack;->aid:I

    iput v0, p0, Lcom/vkontakte/android/audio/MusicTrack;->aid:I

    .line 230
    iget v0, p1, Lcom/vkontakte/android/audio/MusicTrack;->oid:I

    iput v0, p0, Lcom/vkontakte/android/audio/MusicTrack;->oid:I

    .line 231
    iget v0, p1, Lcom/vkontakte/android/audio/MusicTrack;->lyricsID:I

    iput v0, p0, Lcom/vkontakte/android/audio/MusicTrack;->lyricsID:I

    .line 232
    iget-object v0, p1, Lcom/vkontakte/android/audio/MusicTrack;->lyricsText:Ljava/lang/String;

    iput-object v0, p0, Lcom/vkontakte/android/audio/MusicTrack;->lyricsText:Ljava/lang/String;

    .line 233
    iget v0, p1, Lcom/vkontakte/android/audio/MusicTrack;->fileSize:I

    iput v0, p0, Lcom/vkontakte/android/audio/MusicTrack;->fileSize:I

    .line 234
    iget-boolean v0, p1, Lcom/vkontakte/android/audio/MusicTrack;->fromAttachment:Z

    iput-boolean v0, p0, Lcom/vkontakte/android/audio/MusicTrack;->fromAttachment:Z

    .line 235
    iget-object v0, p1, Lcom/vkontakte/android/audio/MusicTrack;->album:Lcom/vk/music/dto/AlbumLink;

    iput-object v0, p0, Lcom/vkontakte/android/audio/MusicTrack;->album:Lcom/vk/music/dto/AlbumLink;

    .line 236
    iget-object v0, p1, Lcom/vkontakte/android/audio/MusicTrack;->accessKey:Ljava/lang/String;

    iput-object v0, p0, Lcom/vkontakte/android/audio/MusicTrack;->accessKey:Ljava/lang/String;

    .line 237
    invoke-virtual {p1}, Lcom/vkontakte/android/audio/MusicTrack;->getRestrictionType()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/audio/MusicTrack;->setRestrictionType(I)V

    .line 238
    return-void
.end method

.method public final describeContents()I
    .locals 1

    .prologue
    .line 328
    const/4 v0, 0x0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 254
    instance-of v2, p1, Lcom/vkontakte/android/audio/MusicTrack;

    if-eqz v2, :cond_0

    move-object v0, p1

    .line 255
    check-cast v0, Lcom/vkontakte/android/audio/MusicTrack;

    .line 256
    .local v0, "f":Lcom/vkontakte/android/audio/MusicTrack;
    iget v2, v0, Lcom/vkontakte/android/audio/MusicTrack;->oid:I

    iget v3, p0, Lcom/vkontakte/android/audio/MusicTrack;->oid:I

    if-ne v2, v3, :cond_0

    iget v2, v0, Lcom/vkontakte/android/audio/MusicTrack;->aid:I

    iget v3, p0, Lcom/vkontakte/android/audio/MusicTrack;->aid:I

    if-ne v2, v3, :cond_0

    const/4 v1, 0x1

    .line 258
    .end local v0    # "f":Lcom/vkontakte/android/audio/MusicTrack;
    :cond_0
    return v1
.end method

.method protected fillContentValues(Landroid/content/ContentValues;)V
    .locals 2
    .param p1, "cv"    # Landroid/content/ContentValues;

    .prologue
    .line 283
    invoke-super {p0, p1}, Lcom/vkontakte/android/audio/database/DataObject;->fillContentValues(Landroid/content/ContentValues;)V

    .line 285
    const-string/jumbo v0, "artist"

    iget-object v1, p0, Lcom/vkontakte/android/audio/MusicTrack;->artist:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 286
    const-string/jumbo v0, "title"

    iget-object v1, p0, Lcom/vkontakte/android/audio/MusicTrack;->title:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 287
    const-string/jumbo v0, "duration"

    iget v1, p0, Lcom/vkontakte/android/audio/MusicTrack;->duration:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 288
    const-string/jumbo v0, "url"

    iget-object v1, p0, Lcom/vkontakte/android/audio/MusicTrack;->url:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 289
    const-string/jumbo v0, "aid"

    iget v1, p0, Lcom/vkontakte/android/audio/MusicTrack;->aid:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 290
    const-string/jumbo v0, "oid"

    iget v1, p0, Lcom/vkontakte/android/audio/MusicTrack;->oid:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 291
    const-string/jumbo v0, "lyrics_id"

    iget v1, p0, Lcom/vkontakte/android/audio/MusicTrack;->lyricsID:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 292
    const-string/jumbo v0, "lyrics_text"

    iget-object v1, p0, Lcom/vkontakte/android/audio/MusicTrack;->lyricsText:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 293
    const-string/jumbo v0, "restriction"

    invoke-virtual {p0}, Lcom/vkontakte/android/audio/MusicTrack;->getRestrictionType()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 294
    return-void
.end method

.method public getActualLink(Z)Ljava/lang/String;
    .locals 2
    .param p1, "forceLoad"    # Z

    .prologue
    .line 246
    if-eqz p1, :cond_0

    :try_start_0
    invoke-virtual {p0}, Lcom/vkontakte/android/audio/MusicTrack;->getMid()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, p0}, Lcom/vkontakte/android/audio/MusicApp;->getActualLink(Ljava/lang/String;Lcom/vkontakte/android/audio/MusicTrack;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/audio/MusicTrack;->url:Ljava/lang/String;

    .line 248
    :goto_0
    return-object v1

    .line 246
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/audio/MusicTrack;->url:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 247
    :catch_0
    move-exception v0

    .line 248
    .local v0, "e":Ljava/lang/Exception;
    iget-object v1, p0, Lcom/vkontakte/android/audio/MusicTrack;->url:Ljava/lang/String;

    goto :goto_0
.end method

.method public getAlbumId()I
    .locals 1

    .prologue
    .line 70
    iget-object v0, p0, Lcom/vkontakte/android/audio/MusicTrack;->album:Lcom/vk/music/dto/AlbumLink;

    if-nez v0, :cond_0

    .line 71
    const/4 v0, 0x0

    .line 74
    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/audio/MusicTrack;->album:Lcom/vk/music/dto/AlbumLink;

    iget v0, v0, Lcom/vk/music/dto/AlbumLink;->id:I

    goto :goto_0
.end method

.method public getMid()Ljava/lang/String;
    .locals 2

    .prologue
    .line 215
    iget-object v0, p0, Lcom/vkontakte/android/audio/MusicTrack;->mid:Ljava/lang/String;

    if-nez v0, :cond_0

    iget v0, p0, Lcom/vkontakte/android/audio/MusicTrack;->oid:I

    iget v1, p0, Lcom/vkontakte/android/audio/MusicTrack;->aid:I

    invoke-static {v0, v1}, Lcom/vkontakte/android/audio/MusicTrack;->generateMid(II)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/audio/MusicTrack;->mid:Ljava/lang/String;

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/audio/MusicTrack;->mid:Ljava/lang/String;

    goto :goto_0
.end method

.method public getMidId()J
    .locals 6

    .prologue
    .line 211
    iget v0, p0, Lcom/vkontakte/android/audio/MusicTrack;->oid:I

    int-to-long v0, v0

    const/16 v2, 0x20

    shl-long/2addr v0, v2

    iget v2, p0, Lcom/vkontakte/android/audio/MusicTrack;->aid:I

    int-to-long v2, v2

    const-wide/32 v4, 0xfffffff

    and-long/2addr v2, v4

    or-long/2addr v0, v2

    return-wide v0
.end method

.method public getRestrictionType()I
    .locals 1

    .prologue
    .line 46
    iget v0, p0, Lcom/vkontakte/android/audio/MusicTrack;->restrictionTypeD:I

    packed-switch v0, :pswitch_data_0

    .line 52
    const/4 v0, 0x0

    iput v0, p0, Lcom/vkontakte/android/audio/MusicTrack;->restrictionTypeD:I

    :goto_0
    return v0

    .line 50
    :pswitch_0
    iget v0, p0, Lcom/vkontakte/android/audio/MusicTrack;->restrictionTypeD:I

    goto :goto_0

    .line 46
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public getSecureUid()Ljava/lang/String;
    .locals 3

    .prologue
    .line 369
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/vkontakte/android/audio/MusicTrack;->getUid()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v0, p0, Lcom/vkontakte/android/audio/MusicTrack;->accessKey:Ljava/lang/String;

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "_"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, p0, Lcom/vkontakte/android/audio/MusicTrack;->accessKey:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_0
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    const-string/jumbo v0, ""

    goto :goto_0
.end method

.method public getThumb()Lcom/vk/music/dto/Thumb;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 79
    iget-object v0, p0, Lcom/vkontakte/android/audio/MusicTrack;->album:Lcom/vk/music/dto/AlbumLink;

    if-nez v0, :cond_0

    .line 80
    const/4 v0, 0x0

    .line 83
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/audio/MusicTrack;->album:Lcom/vk/music/dto/AlbumLink;

    iget-object v0, v0, Lcom/vk/music/dto/AlbumLink;->thumb:Lcom/vk/music/dto/Thumb;

    goto :goto_0
.end method

.method public getThumbUrl(I)Ljava/lang/String;
    .locals 1
    .param p1, "size"    # I
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 88
    iget-object v0, p0, Lcom/vkontakte/android/audio/MusicTrack;->album:Lcom/vk/music/dto/AlbumLink;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/audio/MusicTrack;->album:Lcom/vk/music/dto/AlbumLink;

    iget-object v0, v0, Lcom/vk/music/dto/AlbumLink;->thumb:Lcom/vk/music/dto/Thumb;

    if-nez v0, :cond_1

    .line 89
    :cond_0
    const/4 v0, 0x0

    .line 92
    :goto_0
    return-object v0

    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/audio/MusicTrack;->album:Lcom/vk/music/dto/AlbumLink;

    iget-object v0, v0, Lcom/vk/music/dto/AlbumLink;->thumb:Lcom/vk/music/dto/Thumb;

    invoke-virtual {v0, p1}, Lcom/vk/music/dto/Thumb;->getForSize(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public getUid()Ljava/lang/String;
    .locals 2

    .prologue
    .line 365
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget v1, p0, Lcom/vkontakte/android/audio/MusicTrack;->oid:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/vkontakte/android/audio/MusicTrack;->aid:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getUniqueId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 241
    invoke-virtual {p0}, Lcom/vkontakte/android/audio/MusicTrack;->getMid()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected loadFromCursor(Landroid/database/Cursor;)V
    .locals 4
    .param p1, "cursor"    # Landroid/database/Cursor;

    .prologue
    .line 266
    invoke-super {p0, p1}, Lcom/vkontakte/android/audio/database/DataObject;->loadFromCursor(Landroid/database/Cursor;)V

    .line 268
    sget v0, Lcom/vkontakte/android/audio/MusicTrack;->INDEX_ARTIST:I

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/audio/MusicTrack;->artist:Ljava/lang/String;

    .line 269
    sget v0, Lcom/vkontakte/android/audio/MusicTrack;->INDEX_TITLE:I

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/audio/MusicTrack;->title:Ljava/lang/String;

    .line 270
    sget v0, Lcom/vkontakte/android/audio/MusicTrack;->INDEX_DURATION:I

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/audio/MusicTrack;->duration:I

    .line 271
    sget v0, Lcom/vkontakte/android/audio/MusicTrack;->INDEX_URL:I

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/audio/MusicTrack;->url:Ljava/lang/String;

    .line 272
    sget v0, Lcom/vkontakte/android/audio/MusicTrack;->INDEX_AID:I

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/audio/MusicTrack;->aid:I

    .line 273
    sget v0, Lcom/vkontakte/android/audio/MusicTrack;->INDEX_OID:I

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/audio/MusicTrack;->oid:I

    .line 274
    sget v0, Lcom/vkontakte/android/audio/MusicTrack;->INDEX_LYRICS_ID:I

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/audio/MusicTrack;->lyricsID:I

    .line 275
    sget v0, Lcom/vkontakte/android/audio/MusicTrack;->INDEX_LYRICS_TEXT:I

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/audio/MusicTrack;->lyricsText:Ljava/lang/String;

    .line 276
    sget v0, Lcom/vkontakte/android/audio/MusicTrack;->INDEX_RESTRICTION:I

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/audio/MusicTrack;->setRestrictionType(I)V

    .line 278
    const-string/jumbo v0, "%d:%02d"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget v3, p0, Lcom/vkontakte/android/audio/MusicTrack;->duration:I

    div-int/lit8 v3, v3, 0x3c

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    iget v3, p0, Lcom/vkontakte/android/audio/MusicTrack;->duration:I

    rem-int/lit8 v3, v3, 0x3c

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/audio/MusicTrack;->durationS:Ljava/lang/String;

    .line 279
    return-void
.end method

.method public serializeTo(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 1
    .param p1, "s"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 342
    iget-object v0, p0, Lcom/vkontakte/android/audio/MusicTrack;->mid:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 343
    iget-object v0, p0, Lcom/vkontakte/android/audio/MusicTrack;->artist:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 344
    iget-object v0, p0, Lcom/vkontakte/android/audio/MusicTrack;->title:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 345
    iget v0, p0, Lcom/vkontakte/android/audio/MusicTrack;->duration:I

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 346
    iget-object v0, p0, Lcom/vkontakte/android/audio/MusicTrack;->durationS:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 347
    iget-object v0, p0, Lcom/vkontakte/android/audio/MusicTrack;->url:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 348
    iget v0, p0, Lcom/vkontakte/android/audio/MusicTrack;->aid:I

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 349
    iget v0, p0, Lcom/vkontakte/android/audio/MusicTrack;->oid:I

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 350
    iget v0, p0, Lcom/vkontakte/android/audio/MusicTrack;->lyricsID:I

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 351
    iget-object v0, p0, Lcom/vkontakte/android/audio/MusicTrack;->lyricsText:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 352
    iget v0, p0, Lcom/vkontakte/android/audio/MusicTrack;->fileSize:I

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 353
    iget-boolean v0, p0, Lcom/vkontakte/android/audio/MusicTrack;->fromAttachment:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeByte(B)V

    .line 354
    iget-object v0, p0, Lcom/vkontakte/android/audio/MusicTrack;->album:Lcom/vk/music/dto/AlbumLink;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeSerializable(Lcom/vkontakte/android/utils/Serializer$Serializable;)V

    .line 355
    iget-object v0, p0, Lcom/vkontakte/android/audio/MusicTrack;->accessKey:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 356
    invoke-virtual {p0}, Lcom/vkontakte/android/audio/MusicTrack;->getRestrictionType()I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 357
    return-void

    .line 353
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setRestrictionType(I)V
    .locals 1
    .param p1, "restrictionTypeD"    # I

    .prologue
    .line 57
    packed-switch p1, :pswitch_data_0

    .line 64
    const/4 v0, 0x0

    iput v0, p0, Lcom/vkontakte/android/audio/MusicTrack;->restrictionTypeD:I

    .line 67
    :goto_0
    return-void

    .line 61
    :pswitch_0
    iput p1, p0, Lcom/vkontakte/android/audio/MusicTrack;->restrictionTypeD:I

    goto :goto_0

    .line 57
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 361
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/vkontakte/android/audio/MusicTrack;->artist:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, " - "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/audio/MusicTrack;->title:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final writeToParcel(Landroid/os/Parcel;I)V
    .locals 2
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 334
    :try_start_0
    invoke-static {p1}, Lcom/vkontakte/android/utils/Serializer;->get(Landroid/os/Parcel;)Lcom/vkontakte/android/utils/Serializer;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/audio/MusicTrack;->serializeTo(Lcom/vkontakte/android/utils/Serializer;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 338
    :goto_0
    return-void

    .line 335
    :catch_0
    move-exception v0

    .line 336
    .local v0, "e":Ljava/lang/Exception;
    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto :goto_0
.end method
