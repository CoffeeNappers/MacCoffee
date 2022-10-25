.class public Lcom/vkontakte/android/api/VideoFile;
.super Lcom/vkontakte/android/utils/Serializer$SerializableAdapter;
.source "VideoFile.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/api/VideoFile$LiveStatus;
    }
.end annotation


# static fields
.field public static final CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/utils/Serializer$Creator",
            "<",
            "Lcom/vkontakte/android/api/VideoFile;",
            ">;"
        }
    .end annotation
.end field

.field public static final LIVE_FAILED:I = 0x4

.field public static final LIVE_FINISHED:I = 0x3

.field public static final LIVE_STARTED:I = 0x2

.field public static final LIVE_UPCOMING:I = 0x5

.field public static final LIVE_WAITING:I = 0x1


# instance fields
.field public accessKey:Ljava/lang/String;

.field public canAdd:Z

.field public canComment:Z

.field public canEdit:Z

.field public canRepost:Z

.field public comments:I

.field public contentRestricted:Z

.field public date:I

.field public descr:Ljava/lang/String;

.field public displayableTitle:Ljava/lang/CharSequence;

.field public duration:I

.field public firstFrame130:Ljava/lang/String;

.field public firstFrame320:Ljava/lang/String;

.field public firstFrame800:Ljava/lang/String;

.field private flv:Z

.field public height:I

.field public liked:Z

.field public likes:I

.field public live:Z

.field public liveStatus:I

.field public noAutoplay:Z

.field public oid:I

.field public ownerName:Ljava/lang/String;

.field public ownerPhoto:Ljava/lang/String;

.field public platform:Ljava/lang/String;

.field public privacy:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/data/PrivacySetting$PrivacyRule;",
            ">;"
        }
    .end annotation
.end field

.field public privacyComment:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/data/PrivacySetting$PrivacyRule;",
            ">;"
        }
    .end annotation
.end field

.field public processing:Z

.field public repeat:Z

.field public reposted:Z

.field public reposts:I

.field public seekToMs:J

.field public title:Ljava/lang/String;

.field public url1080:Ljava/lang/String;

.field public url240:Ljava/lang/String;

.field public url360:Ljava/lang/String;

.field public url480:Ljava/lang/String;

.field public url720:Ljava/lang/String;

.field public urlBigThumb:Ljava/lang/String;

.field public urlEmbed:Ljava/lang/String;

.field public urlExternal:Ljava/lang/String;

.field public urlHls:Ljava/lang/String;

.field public urlThumb:Ljava/lang/String;

.field public vid:I

.field public views:I

.field public width:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 320
    new-instance v0, Lcom/vkontakte/android/api/VideoFile$1;

    invoke-direct {v0}, Lcom/vkontakte/android/api/VideoFile$1;-><init>()V

    sput-object v0, Lcom/vkontakte/android/api/VideoFile;->CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 89
    invoke-direct {p0}, Lcom/vkontakte/android/utils/Serializer$SerializableAdapter;-><init>()V

    .line 83
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/api/VideoFile;->privacy:Ljava/util/List;

    .line 84
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/api/VideoFile;->privacyComment:Ljava/util/List;

    .line 91
    return-void
.end method

.method public constructor <init>(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 3
    .param p1, "p"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 93
    invoke-direct {p0}, Lcom/vkontakte/android/utils/Serializer$SerializableAdapter;-><init>()V

    .line 83
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/api/VideoFile;->privacy:Ljava/util/List;

    .line 84
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/api/VideoFile;->privacyComment:Ljava/util/List;

    .line 94
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/api/VideoFile;->oid:I

    .line 95
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/api/VideoFile;->vid:I

    .line 96
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/api/VideoFile;->duration:I

    .line 97
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/api/VideoFile;->url240:Ljava/lang/String;

    .line 98
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/api/VideoFile;->url360:Ljava/lang/String;

    .line 99
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/api/VideoFile;->url480:Ljava/lang/String;

    .line 100
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/api/VideoFile;->url720:Ljava/lang/String;

    .line 101
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/api/VideoFile;->url1080:Ljava/lang/String;

    .line 102
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/api/VideoFile;->urlHls:Ljava/lang/String;

    .line 103
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/api/VideoFile;->urlExternal:Ljava/lang/String;

    .line 104
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/api/VideoFile;->urlEmbed:Ljava/lang/String;

    .line 105
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/api/VideoFile;->urlThumb:Ljava/lang/String;

    .line 106
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/api/VideoFile;->urlBigThumb:Ljava/lang/String;

    .line 107
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/api/VideoFile;->title:Ljava/lang/String;

    .line 108
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/api/VideoFile;->descr:Ljava/lang/String;

    .line 109
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/api/VideoFile;->platform:Ljava/lang/String;

    .line 110
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/api/VideoFile;->date:I

    .line 111
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/api/VideoFile;->views:I

    .line 112
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/api/VideoFile;->ownerName:Ljava/lang/String;

    .line 113
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/api/VideoFile;->ownerPhoto:Ljava/lang/String;

    .line 114
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/api/VideoFile;->accessKey:Ljava/lang/String;

    .line 115
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/api/VideoFile;->likes:I

    .line 116
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/api/VideoFile;->comments:I

    .line 117
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/api/VideoFile;->reposts:I

    .line 118
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v0

    if-ne v0, v1, :cond_0

    move v0, v1

    :goto_0
    iput-boolean v0, p0, Lcom/vkontakte/android/api/VideoFile;->liked:Z

    .line 119
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v0

    if-ne v0, v1, :cond_1

    move v0, v1

    :goto_1
    iput-boolean v0, p0, Lcom/vkontakte/android/api/VideoFile;->reposted:Z

    .line 120
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v0

    if-ne v0, v1, :cond_2

    move v0, v1

    :goto_2
    iput-boolean v0, p0, Lcom/vkontakte/android/api/VideoFile;->live:Z

    .line 121
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v0

    if-ne v0, v1, :cond_3

    move v0, v1

    :goto_3
    iput-boolean v0, p0, Lcom/vkontakte/android/api/VideoFile;->repeat:Z

    .line 122
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v0

    if-ne v0, v1, :cond_4

    move v0, v1

    :goto_4
    iput-boolean v0, p0, Lcom/vkontakte/android/api/VideoFile;->canComment:Z

    .line 123
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v0

    if-ne v0, v1, :cond_5

    move v0, v1

    :goto_5
    iput-boolean v0, p0, Lcom/vkontakte/android/api/VideoFile;->canEdit:Z

    .line 124
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v0

    if-ne v0, v1, :cond_6

    move v0, v1

    :goto_6
    iput-boolean v0, p0, Lcom/vkontakte/android/api/VideoFile;->canRepost:Z

    .line 125
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v0

    if-ne v0, v1, :cond_7

    move v0, v1

    :goto_7
    iput-boolean v0, p0, Lcom/vkontakte/android/api/VideoFile;->canAdd:Z

    .line 126
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v0

    if-ne v0, v1, :cond_8

    move v0, v1

    :goto_8
    iput-boolean v0, p0, Lcom/vkontakte/android/api/VideoFile;->flv:Z

    .line 127
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v0

    if-ne v0, v1, :cond_9

    move v0, v1

    :goto_9
    iput-boolean v0, p0, Lcom/vkontakte/android/api/VideoFile;->noAutoplay:Z

    .line 128
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v0

    if-ne v0, v1, :cond_a

    move v0, v1

    :goto_a
    iput-boolean v0, p0, Lcom/vkontakte/android/api/VideoFile;->contentRestricted:Z

    .line 129
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v0

    if-ne v0, v1, :cond_b

    :goto_b
    iput-boolean v1, p0, Lcom/vkontakte/android/api/VideoFile;->processing:Z

    .line 130
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/api/VideoFile;->width:I

    .line 131
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/api/VideoFile;->height:I

    .line 132
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/api/VideoFile;->firstFrame130:Ljava/lang/String;

    .line 133
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/api/VideoFile;->firstFrame320:Ljava/lang/String;

    .line 134
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/api/VideoFile;->firstFrame800:Ljava/lang/String;

    .line 136
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/api/VideoFile;->liveStatus:I

    .line 137
    iget-object v0, p0, Lcom/vkontakte/android/api/VideoFile;->privacy:Ljava/util/List;

    const-class v1, Lcom/vkontakte/android/data/PrivacySetting$PrivacyRule;

    invoke-static {p1, v0, v1}, Lcom/vkontakte/android/SystemUtils;->readSerializerSerializableList(Lcom/vkontakte/android/utils/Serializer;Ljava/util/List;Ljava/lang/Class;)V

    .line 138
    iget-object v0, p0, Lcom/vkontakte/android/api/VideoFile;->privacyComment:Ljava/util/List;

    const-class v1, Lcom/vkontakte/android/data/PrivacySetting$PrivacyRule;

    invoke-static {p1, v0, v1}, Lcom/vkontakte/android/SystemUtils;->readSerializerSerializableList(Lcom/vkontakte/android/utils/Serializer;Ljava/util/List;Ljava/lang/Class;)V

    .line 139
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readLong()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/vkontakte/android/api/VideoFile;->seekToMs:J

    .line 141
    iget-object v0, p0, Lcom/vkontakte/android/api/VideoFile;->title:Ljava/lang/String;

    invoke-static {v0}, Lcom/vkontakte/android/Global;->replaceEmoji(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/api/VideoFile;->displayableTitle:Ljava/lang/CharSequence;

    .line 142
    return-void

    :cond_0
    move v0, v2

    .line 118
    goto/16 :goto_0

    :cond_1
    move v0, v2

    .line 119
    goto/16 :goto_1

    :cond_2
    move v0, v2

    .line 120
    goto/16 :goto_2

    :cond_3
    move v0, v2

    .line 121
    goto/16 :goto_3

    :cond_4
    move v0, v2

    .line 122
    goto/16 :goto_4

    :cond_5
    move v0, v2

    .line 123
    goto/16 :goto_5

    :cond_6
    move v0, v2

    .line 124
    goto/16 :goto_6

    :cond_7
    move v0, v2

    .line 125
    goto :goto_7

    :cond_8
    move v0, v2

    .line 126
    goto :goto_8

    :cond_9
    move v0, v2

    .line 127
    goto :goto_9

    :cond_a
    move v0, v2

    .line 128
    goto :goto_a

    :cond_b
    move v1, v2

    .line 129
    goto :goto_b
.end method

.method public constructor <init>(Lorg/json/JSONObject;)V
    .locals 11
    .param p1, "jv"    # Lorg/json/JSONObject;

    .prologue
    .line 144
    invoke-direct {p0}, Lcom/vkontakte/android/utils/Serializer$SerializableAdapter;-><init>()V

    .line 83
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    iput-object v7, p0, Lcom/vkontakte/android/api/VideoFile;->privacy:Ljava/util/List;

    .line 84
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    iput-object v7, p0, Lcom/vkontakte/android/api/VideoFile;->privacyComment:Ljava/util/List;

    .line 146
    :try_start_0
    const-string/jumbo v7, "video_id"

    const-string/jumbo v8, "id"

    const-string/jumbo v9, "vid"

    invoke-virtual {p1, v9}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v9

    invoke-virtual {p1, v8, v9}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v8

    invoke-virtual {p1, v7, v8}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v7

    iput v7, p0, Lcom/vkontakte/android/api/VideoFile;->vid:I

    .line 147
    const-string/jumbo v7, "owner_id"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v7

    iput v7, p0, Lcom/vkontakte/android/api/VideoFile;->oid:I

    .line 148
    const-string/jumbo v7, "title"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/vkontakte/android/api/VideoFile;->title:Ljava/lang/String;

    .line 149
    const-string/jumbo v7, "description"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/vkontakte/android/api/VideoFile;->descr:Ljava/lang/String;

    .line 150
    const-string/jumbo v7, "duration"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v7

    iput v7, p0, Lcom/vkontakte/android/api/VideoFile;->duration:I

    .line 151
    const-string/jumbo v7, "content_restricted"

    const/4 v8, 0x0

    invoke-virtual {p1, v7, v8}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v7

    const/4 v8, 0x1

    if-ne v7, v8, :cond_7

    const/4 v7, 0x1

    :goto_0
    iput-boolean v7, p0, Lcom/vkontakte/android/api/VideoFile;->contentRestricted:Z

    .line 152
    const-string/jumbo v7, "photo_130"

    const-string/jumbo v8, "thumb"

    const-string/jumbo v9, "image"

    invoke-virtual {p1, v9}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p1, v8, v9}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p1, v7, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/vkontakte/android/api/VideoFile;->urlThumb:Ljava/lang/String;

    .line 153
    const-string/jumbo v7, "photo_800"

    const-string/jumbo v8, "photo_640"

    const-string/jumbo v9, "photo_320"

    const-string/jumbo v10, "image_medium"

    invoke-virtual {p1, v10}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {p1, v9, v10}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p1, v8, v9}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p1, v7, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/vkontakte/android/api/VideoFile;->urlBigThumb:Ljava/lang/String;

    .line 154
    const-string/jumbo v7, "date"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v7

    iput v7, p0, Lcom/vkontakte/android/api/VideoFile;->date:I

    .line 155
    const-string/jumbo v7, "views"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v7

    iput v7, p0, Lcom/vkontakte/android/api/VideoFile;->views:I

    .line 156
    const-string/jumbo v7, "live"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v7

    const/4 v8, 0x1

    if-ne v7, v8, :cond_8

    const/4 v7, 0x1

    :goto_1
    iput-boolean v7, p0, Lcom/vkontakte/android/api/VideoFile;->live:Z

    .line 157
    const-string/jumbo v7, "files"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 158
    .local v0, "files":Lorg/json/JSONObject;
    if-eqz v0, :cond_e

    .line 159
    const-string/jumbo v7, "mp4_240"

    const-string/jumbo v8, "src"

    invoke-virtual {v0, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0, v7, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/vkontakte/android/api/VideoFile;->url240:Ljava/lang/String;

    .line 160
    const-string/jumbo v7, "mp4_360"

    invoke-virtual {v0, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/vkontakte/android/api/VideoFile;->url360:Ljava/lang/String;

    .line 161
    const-string/jumbo v7, "mp4_480"

    invoke-virtual {v0, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/vkontakte/android/api/VideoFile;->url480:Ljava/lang/String;

    .line 162
    const-string/jumbo v7, "mp4_720"

    invoke-virtual {v0, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/vkontakte/android/api/VideoFile;->url720:Ljava/lang/String;

    .line 163
    const-string/jumbo v7, "mp4_1080"

    invoke-virtual {v0, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/vkontakte/android/api/VideoFile;->url1080:Ljava/lang/String;

    .line 164
    const-string/jumbo v7, "external"

    invoke-virtual {v0, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/vkontakte/android/api/VideoFile;->urlExternal:Ljava/lang/String;

    .line 165
    const-string/jumbo v7, "hls"

    const-string/jumbo v8, "live"

    invoke-virtual {v0, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0, v7, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/vkontakte/android/api/VideoFile;->urlHls:Ljava/lang/String;

    .line 166
    iget-object v7, p0, Lcom/vkontakte/android/api/VideoFile;->urlHls:Ljava/lang/String;

    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_0

    .line 167
    iget-object v7, p0, Lcom/vkontakte/android/api/VideoFile;->urlHls:Ljava/lang/String;

    invoke-static {v7}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v5

    .line 168
    .local v5, "uri":Landroid/net/Uri;
    if-eqz v5, :cond_0

    .line 169
    invoke-virtual {v5}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v3

    .line 170
    .local v3, "lastPathSegment":Ljava/lang/String;
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_0

    .line 171
    const-string/jumbo v7, ".720.mp4"

    invoke-virtual {v3, v7}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_9

    .line 172
    iget-object v7, p0, Lcom/vkontakte/android/api/VideoFile;->urlHls:Ljava/lang/String;

    iput-object v7, p0, Lcom/vkontakte/android/api/VideoFile;->url720:Ljava/lang/String;

    .line 173
    const/4 v7, 0x0

    iput-object v7, p0, Lcom/vkontakte/android/api/VideoFile;->urlHls:Ljava/lang/String;

    .line 190
    .end local v3    # "lastPathSegment":Ljava/lang/String;
    .end local v5    # "uri":Landroid/net/Uri;
    :cond_0
    :goto_2
    const-string/jumbo v7, "flv_320"

    const-string/jumbo v8, "flv_240"

    invoke-virtual {v0, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0, v7, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_d

    iget-object v7, p0, Lcom/vkontakte/android/api/VideoFile;->urlHls:Ljava/lang/String;

    .line 191
    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_d

    iget-object v7, p0, Lcom/vkontakte/android/api/VideoFile;->url360:Ljava/lang/String;

    .line 192
    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_d

    iget-object v7, p0, Lcom/vkontakte/android/api/VideoFile;->url480:Ljava/lang/String;

    .line 193
    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_d

    iget-object v7, p0, Lcom/vkontakte/android/api/VideoFile;->url720:Ljava/lang/String;

    .line 194
    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_d

    iget-object v7, p0, Lcom/vkontakte/android/api/VideoFile;->url1080:Ljava/lang/String;

    .line 195
    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_d

    const/4 v7, 0x1

    :goto_3
    iput-boolean v7, p0, Lcom/vkontakte/android/api/VideoFile;->flv:Z

    .line 199
    :goto_4
    const-string/jumbo v7, "platform"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/vkontakte/android/api/VideoFile;->platform:Ljava/lang/String;

    .line 204
    const-string/jumbo v7, "player"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/vkontakte/android/api/VideoFile;->urlEmbed:Ljava/lang/String;

    .line 205
    const-string/jumbo v7, "likes"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 206
    const-string/jumbo v7, "likes"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v7

    const-string/jumbo v8, "count"

    invoke-virtual {v7, v8}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v7

    iput v7, p0, Lcom/vkontakte/android/api/VideoFile;->likes:I

    .line 207
    const-string/jumbo v7, "likes"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v7

    const-string/jumbo v8, "user_likes"

    invoke-virtual {v7, v8}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v7

    const/4 v8, 0x1

    if-ne v7, v8, :cond_f

    const/4 v7, 0x1

    :goto_5
    iput-boolean v7, p0, Lcom/vkontakte/android/api/VideoFile;->liked:Z

    .line 209
    :cond_1
    const-string/jumbo v7, "reposts"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 210
    const-string/jumbo v7, "reposts"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v7

    const-string/jumbo v8, "count"

    invoke-virtual {v7, v8}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v7

    iput v7, p0, Lcom/vkontakte/android/api/VideoFile;->reposts:I

    .line 211
    const-string/jumbo v7, "reposts"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v7

    const-string/jumbo v8, "user_reposted"

    invoke-virtual {v7, v8}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v7

    const/4 v8, 0x1

    if-ne v7, v8, :cond_10

    const/4 v7, 0x1

    :goto_6
    iput-boolean v7, p0, Lcom/vkontakte/android/api/VideoFile;->reposted:Z

    .line 213
    :cond_2
    const-string/jumbo v7, "comments"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v7

    iput v7, p0, Lcom/vkontakte/android/api/VideoFile;->comments:I

    .line 214
    const-string/jumbo v7, "repeat"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v7

    const/4 v8, 0x1

    if-ne v7, v8, :cond_11

    const/4 v7, 0x1

    :goto_7
    iput-boolean v7, p0, Lcom/vkontakte/android/api/VideoFile;->repeat:Z

    .line 215
    const-string/jumbo v7, "access_key"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/vkontakte/android/api/VideoFile;->accessKey:Ljava/lang/String;

    .line 217
    const-string/jumbo v7, "privacy_view"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    .line 218
    .local v1, "jpriv":Lorg/json/JSONArray;
    if-eqz v1, :cond_3

    .line 219
    iget-object v7, p0, Lcom/vkontakte/android/api/VideoFile;->privacy:Ljava/util/List;

    invoke-static {v1}, Lcom/vkontakte/android/data/PrivacySetting;->parseApiValue(Lorg/json/JSONArray;)Ljava/util/List;

    move-result-object v8

    invoke-interface {v7, v8}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 222
    :cond_3
    const-string/jumbo v7, "privacy_comment"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v2

    .line 223
    .local v2, "jprivc":Lorg/json/JSONArray;
    if-eqz v2, :cond_4

    .line 224
    iget-object v7, p0, Lcom/vkontakte/android/api/VideoFile;->privacyComment:Ljava/util/List;

    invoke-static {v2}, Lcom/vkontakte/android/data/PrivacySetting;->parseApiValue(Lorg/json/JSONArray;)Ljava/util/List;

    move-result-object v8

    invoke-interface {v7, v8}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 227
    :cond_4
    const-string/jumbo v7, "can_comment"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v7

    const/4 v8, 0x1

    if-ne v7, v8, :cond_12

    const/4 v7, 0x1

    :goto_8
    iput-boolean v7, p0, Lcom/vkontakte/android/api/VideoFile;->canComment:Z

    .line 228
    const-string/jumbo v7, "can_edit"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v7

    const/4 v8, 0x1

    if-ne v7, v8, :cond_13

    const/4 v7, 0x1

    :goto_9
    iput-boolean v7, p0, Lcom/vkontakte/android/api/VideoFile;->canEdit:Z

    .line 229
    const-string/jumbo v7, "can_repost"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v7

    const/4 v8, 0x1

    if-ne v7, v8, :cond_14

    const/4 v7, 0x1

    :goto_a
    iput-boolean v7, p0, Lcom/vkontakte/android/api/VideoFile;->canRepost:Z

    .line 230
    const-string/jumbo v7, "is_private"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v7

    if-nez v7, :cond_15

    const/4 v7, 0x1

    :goto_b
    iput-boolean v7, p0, Lcom/vkontakte/android/api/VideoFile;->canAdd:Z

    .line 232
    const-string/jumbo v7, "processing"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v7

    const/4 v8, 0x1

    if-ne v7, v8, :cond_16

    const/4 v7, 0x1

    :goto_c
    iput-boolean v7, p0, Lcom/vkontakte/android/api/VideoFile;->processing:Z

    .line 233
    const-string/jumbo v7, "live"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v7

    const/4 v8, 0x1

    if-ne v7, v8, :cond_17

    const/4 v7, 0x1

    :goto_d
    iput-boolean v7, p0, Lcom/vkontakte/android/api/VideoFile;->live:Z

    .line 234
    const-string/jumbo v7, "no_autoplay"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v7

    const/4 v8, 0x1

    if-ne v7, v8, :cond_18

    const/4 v7, 0x1

    :goto_e
    iput-boolean v7, p0, Lcom/vkontakte/android/api/VideoFile;->noAutoplay:Z

    .line 235
    const-string/jumbo v7, "width"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v7

    iput v7, p0, Lcom/vkontakte/android/api/VideoFile;->width:I

    .line 236
    const-string/jumbo v7, "height"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v7

    iput v7, p0, Lcom/vkontakte/android/api/VideoFile;->height:I

    .line 237
    const-string/jumbo v7, "first_frame_130"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/vkontakte/android/api/VideoFile;->firstFrame130:Ljava/lang/String;

    .line 238
    const-string/jumbo v7, "first_frame_320"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/vkontakte/android/api/VideoFile;->firstFrame320:Ljava/lang/String;

    .line 239
    const-string/jumbo v7, "first_frame_800"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/vkontakte/android/api/VideoFile;->firstFrame800:Ljava/lang/String;

    .line 240
    const-string/jumbo v7, "live_status"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 241
    .local v4, "liveStatus":Ljava/lang/String;
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_19

    .line 242
    const/4 v7, -0x1

    invoke-virtual {v4}, Ljava/lang/String;->hashCode()I

    move-result v8

    sparse-switch v8, :sswitch_data_0

    :cond_5
    :goto_f
    packed-switch v7, :pswitch_data_0

    .line 265
    :cond_6
    :goto_10
    iget-object v7, p0, Lcom/vkontakte/android/api/VideoFile;->title:Ljava/lang/String;

    invoke-static {v7}, Lcom/vkontakte/android/Global;->replaceEmoji(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v7

    iput-object v7, p0, Lcom/vkontakte/android/api/VideoFile;->displayableTitle:Ljava/lang/CharSequence;

    .line 269
    .end local v0    # "files":Lorg/json/JSONObject;
    .end local v1    # "jpriv":Lorg/json/JSONArray;
    .end local v2    # "jprivc":Lorg/json/JSONArray;
    .end local v4    # "liveStatus":Ljava/lang/String;
    :goto_11
    return-void

    .line 151
    :cond_7
    const/4 v7, 0x0

    goto/16 :goto_0

    .line 156
    :cond_8
    const/4 v7, 0x0

    goto/16 :goto_1

    .line 174
    .restart local v0    # "files":Lorg/json/JSONObject;
    .restart local v3    # "lastPathSegment":Ljava/lang/String;
    .restart local v5    # "uri":Landroid/net/Uri;
    :cond_9
    const-string/jumbo v7, ".1080.mp4"

    invoke-virtual {v3, v7}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_a

    .line 175
    iget-object v7, p0, Lcom/vkontakte/android/api/VideoFile;->urlHls:Ljava/lang/String;

    iput-object v7, p0, Lcom/vkontakte/android/api/VideoFile;->url1080:Ljava/lang/String;

    .line 176
    const/4 v7, 0x0

    iput-object v7, p0, Lcom/vkontakte/android/api/VideoFile;->urlHls:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_2

    .line 266
    .end local v0    # "files":Lorg/json/JSONObject;
    .end local v3    # "lastPathSegment":Ljava/lang/String;
    .end local v5    # "uri":Landroid/net/Uri;
    :catch_0
    move-exception v6

    .line 267
    .local v6, "x":Ljava/lang/Exception;
    const-string/jumbo v7, "vk"

    invoke-static {v7, v6}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_11

    .line 177
    .end local v6    # "x":Ljava/lang/Exception;
    .restart local v0    # "files":Lorg/json/JSONObject;
    .restart local v3    # "lastPathSegment":Ljava/lang/String;
    .restart local v5    # "uri":Landroid/net/Uri;
    :cond_a
    :try_start_1
    const-string/jumbo v7, ".360.mp4"

    invoke-virtual {v3, v7}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_b

    .line 178
    iget-object v7, p0, Lcom/vkontakte/android/api/VideoFile;->urlHls:Ljava/lang/String;

    iput-object v7, p0, Lcom/vkontakte/android/api/VideoFile;->url360:Ljava/lang/String;

    .line 179
    const/4 v7, 0x0

    iput-object v7, p0, Lcom/vkontakte/android/api/VideoFile;->urlHls:Ljava/lang/String;

    goto/16 :goto_2

    .line 180
    :cond_b
    const-string/jumbo v7, ".240.mp4"

    invoke-virtual {v3, v7}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_c

    .line 181
    iget-object v7, p0, Lcom/vkontakte/android/api/VideoFile;->urlHls:Ljava/lang/String;

    iput-object v7, p0, Lcom/vkontakte/android/api/VideoFile;->url240:Ljava/lang/String;

    .line 182
    const/4 v7, 0x0

    iput-object v7, p0, Lcom/vkontakte/android/api/VideoFile;->urlHls:Ljava/lang/String;

    goto/16 :goto_2

    .line 183
    :cond_c
    const-string/jumbo v7, ".480.mp4"

    invoke-virtual {v3, v7}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 184
    iget-object v7, p0, Lcom/vkontakte/android/api/VideoFile;->urlHls:Ljava/lang/String;

    iput-object v7, p0, Lcom/vkontakte/android/api/VideoFile;->url480:Ljava/lang/String;

    .line 185
    const/4 v7, 0x0

    iput-object v7, p0, Lcom/vkontakte/android/api/VideoFile;->urlHls:Ljava/lang/String;

    goto/16 :goto_2

    .line 195
    .end local v3    # "lastPathSegment":Ljava/lang/String;
    .end local v5    # "uri":Landroid/net/Uri;
    :cond_d
    const/4 v7, 0x0

    goto/16 :goto_3

    .line 197
    :cond_e
    const-string/jumbo v7, "player"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/vkontakte/android/api/VideoFile;->urlExternal:Ljava/lang/String;

    goto/16 :goto_4

    .line 207
    :cond_f
    const/4 v7, 0x0

    goto/16 :goto_5

    .line 211
    :cond_10
    const/4 v7, 0x0

    goto/16 :goto_6

    .line 214
    :cond_11
    const/4 v7, 0x0

    goto/16 :goto_7

    .line 227
    .restart local v1    # "jpriv":Lorg/json/JSONArray;
    .restart local v2    # "jprivc":Lorg/json/JSONArray;
    :cond_12
    const/4 v7, 0x0

    goto/16 :goto_8

    .line 228
    :cond_13
    const/4 v7, 0x0

    goto/16 :goto_9

    .line 229
    :cond_14
    const/4 v7, 0x0

    goto/16 :goto_a

    .line 230
    :cond_15
    const/4 v7, 0x0

    goto/16 :goto_b

    .line 232
    :cond_16
    const/4 v7, 0x0

    goto/16 :goto_c

    .line 233
    :cond_17
    const/4 v7, 0x0

    goto/16 :goto_d

    .line 234
    :cond_18
    const/4 v7, 0x0

    goto/16 :goto_e

    .line 242
    .restart local v4    # "liveStatus":Ljava/lang/String;
    :sswitch_0
    const-string/jumbo v8, "waiting"

    invoke-virtual {v4, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_5

    const/4 v7, 0x0

    goto/16 :goto_f

    :sswitch_1
    const-string/jumbo v8, "started"

    invoke-virtual {v4, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_5

    const/4 v7, 0x1

    goto/16 :goto_f

    :sswitch_2
    const-string/jumbo v8, "finished"

    invoke-virtual {v4, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_5

    const/4 v7, 0x2

    goto/16 :goto_f

    :sswitch_3
    const-string/jumbo v8, "failed"

    invoke-virtual {v4, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_5

    const/4 v7, 0x3

    goto/16 :goto_f

    :sswitch_4
    const-string/jumbo v8, "upcoming"

    invoke-virtual {v4, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_5

    const/4 v7, 0x4

    goto/16 :goto_f

    .line 244
    :pswitch_0
    const/4 v7, 0x1

    iput v7, p0, Lcom/vkontakte/android/api/VideoFile;->liveStatus:I

    goto/16 :goto_10

    .line 247
    :pswitch_1
    const/4 v7, 0x2

    iput v7, p0, Lcom/vkontakte/android/api/VideoFile;->liveStatus:I

    goto/16 :goto_10

    .line 250
    :pswitch_2
    const/4 v7, 0x3

    iput v7, p0, Lcom/vkontakte/android/api/VideoFile;->liveStatus:I

    goto/16 :goto_10

    .line 253
    :pswitch_3
    const/4 v7, 0x4

    iput v7, p0, Lcom/vkontakte/android/api/VideoFile;->liveStatus:I

    goto/16 :goto_10

    .line 256
    :pswitch_4
    const/4 v7, 0x5

    iput v7, p0, Lcom/vkontakte/android/api/VideoFile;->liveStatus:I

    goto/16 :goto_10

    .line 260
    :cond_19
    const-string/jumbo v7, "upcoming"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v7

    const/4 v8, 0x1

    if-ne v7, v8, :cond_6

    .line 261
    const/4 v7, 0x5

    iput v7, p0, Lcom/vkontakte/android/api/VideoFile;->liveStatus:I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_10

    .line 242
    :sswitch_data_0
    .sparse-switch
        -0x7114bf7f -> :sswitch_1
        -0x4c696bc3 -> :sswitch_3
        -0x28273f8e -> :sswitch_2
        0x4289964d -> :sswitch_0
        0x4de2891c -> :sswitch_4
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method


# virtual methods
.method public convertToPost()Lcom/vkontakte/android/NewsEntry;
    .locals 3

    .prologue
    .line 333
    new-instance v0, Lcom/vkontakte/android/NewsEntry;

    invoke-direct {v0}, Lcom/vkontakte/android/NewsEntry;-><init>()V

    .line 334
    .local v0, "post":Lcom/vkontakte/android/NewsEntry;
    iget-object v1, v0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    new-instance v2, Lcom/vkontakte/android/attachments/VideoAttachment;

    invoke-direct {v2, p0}, Lcom/vkontakte/android/attachments/VideoAttachment;-><init>(Lcom/vkontakte/android/api/VideoFile;)V

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 335
    iget v1, p0, Lcom/vkontakte/android/api/VideoFile;->oid:I

    iput v1, v0, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    iput v1, v0, Lcom/vkontakte/android/NewsEntry;->userID:I

    .line 336
    iget v1, p0, Lcom/vkontakte/android/api/VideoFile;->vid:I

    iput v1, v0, Lcom/vkontakte/android/NewsEntry;->postID:I

    .line 337
    const/4 v1, 0x2

    iput v1, v0, Lcom/vkontakte/android/NewsEntry;->type:I

    .line 338
    iget-object v1, p0, Lcom/vkontakte/android/api/VideoFile;->descr:Ljava/lang/String;

    iput-object v1, v0, Lcom/vkontakte/android/NewsEntry;->text:Ljava/lang/String;

    .line 339
    iget v1, p0, Lcom/vkontakte/android/api/VideoFile;->date:I

    iput v1, v0, Lcom/vkontakte/android/NewsEntry;->time:I

    .line 340
    iget v1, p0, Lcom/vkontakte/android/api/VideoFile;->reposts:I

    iput v1, v0, Lcom/vkontakte/android/NewsEntry;->numRetweets:I

    .line 341
    iget-object v1, p0, Lcom/vkontakte/android/api/VideoFile;->ownerName:Ljava/lang/String;

    iput-object v1, v0, Lcom/vkontakte/android/NewsEntry;->userName:Ljava/lang/String;

    .line 342
    iget-object v1, p0, Lcom/vkontakte/android/api/VideoFile;->ownerPhoto:Ljava/lang/String;

    iput-object v1, v0, Lcom/vkontakte/android/NewsEntry;->userPhotoURL:Ljava/lang/String;

    .line 343
    iget-boolean v1, p0, Lcom/vkontakte/android/api/VideoFile;->canComment:Z

    if-nez v1, :cond_0

    iget v1, p0, Lcom/vkontakte/android/api/VideoFile;->oid:I

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v2

    if-ne v1, v2, :cond_1

    .line 344
    :cond_0
    iget v1, v0, Lcom/vkontakte/android/NewsEntry;->flags:I

    or-int/lit8 v1, v1, 0x2

    iput v1, v0, Lcom/vkontakte/android/NewsEntry;->flags:I

    .line 346
    :cond_1
    iget-boolean v1, p0, Lcom/vkontakte/android/api/VideoFile;->liked:Z

    if-eqz v1, :cond_2

    .line 347
    iget v1, v0, Lcom/vkontakte/android/NewsEntry;->flags:I

    or-int/lit8 v1, v1, 0x8

    iput v1, v0, Lcom/vkontakte/android/NewsEntry;->flags:I

    .line 349
    :cond_2
    iget-boolean v1, p0, Lcom/vkontakte/android/api/VideoFile;->canRepost:Z

    if-eqz v1, :cond_3

    .line 350
    iget v1, v0, Lcom/vkontakte/android/NewsEntry;->flags:I

    or-int/lit8 v1, v1, 0x1

    iput v1, v0, Lcom/vkontakte/android/NewsEntry;->flags:I

    .line 352
    :cond_3
    iget v1, p0, Lcom/vkontakte/android/api/VideoFile;->likes:I

    iput v1, v0, Lcom/vkontakte/android/NewsEntry;->numLikes:I

    .line 353
    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 358
    if-ne p0, p1, :cond_1

    .line 365
    :cond_0
    :goto_0
    return v1

    .line 361
    :cond_1
    if-eqz p1, :cond_2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_3

    :cond_2
    move v1, v2

    .line 362
    goto :goto_0

    :cond_3
    move-object v0, p1

    .line 364
    check-cast v0, Lcom/vkontakte/android/api/VideoFile;

    .line 365
    .local v0, "videoFile":Lcom/vkontakte/android/api/VideoFile;
    iget v3, p0, Lcom/vkontakte/android/api/VideoFile;->oid:I

    iget v4, v0, Lcom/vkontakte/android/api/VideoFile;->oid:I

    if-ne v3, v4, :cond_4

    iget v3, p0, Lcom/vkontakte/android/api/VideoFile;->vid:I

    iget v4, v0, Lcom/vkontakte/android/api/VideoFile;->vid:I

    if-eq v3, v4, :cond_0

    :cond_4
    move v1, v2

    goto :goto_0
.end method

.method public getFirstFrame()Ljava/lang/String;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 411
    iget-object v0, p0, Lcom/vkontakte/android/api/VideoFile;->firstFrame800:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 412
    iget-object v0, p0, Lcom/vkontakte/android/api/VideoFile;->firstFrame800:Ljava/lang/String;

    .line 420
    :goto_0
    return-object v0

    .line 414
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/api/VideoFile;->firstFrame320:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 415
    iget-object v0, p0, Lcom/vkontakte/android/api/VideoFile;->firstFrame320:Ljava/lang/String;

    goto :goto_0

    .line 417
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/api/VideoFile;->firstFrame130:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 418
    iget-object v0, p0, Lcom/vkontakte/android/api/VideoFile;->firstFrame130:Ljava/lang/String;

    goto :goto_0

    .line 420
    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getTitle()Ljava/lang/CharSequence;
    .locals 1

    .prologue
    .line 402
    iget-object v0, p0, Lcom/vkontakte/android/api/VideoFile;->displayableTitle:Ljava/lang/CharSequence;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 403
    iget-object v0, p0, Lcom/vkontakte/android/api/VideoFile;->displayableTitle:Ljava/lang/CharSequence;

    .line 405
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/api/VideoFile;->title:Ljava/lang/String;

    goto :goto_0
.end method

.method public hashCode()I
    .locals 3

    .prologue
    .line 371
    iget v0, p0, Lcom/vkontakte/android/api/VideoFile;->oid:I

    .line 372
    .local v0, "result":I
    mul-int/lit8 v1, v0, 0x1f

    iget v2, p0, Lcom/vkontakte/android/api/VideoFile;->vid:I

    add-int v0, v1, v2

    .line 373
    return v0
.end method

.method public isExternal()Z
    .locals 1

    .prologue
    .line 390
    iget-object v0, p0, Lcom/vkontakte/android/api/VideoFile;->url240:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/api/VideoFile;->url360:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/api/VideoFile;->url480:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/api/VideoFile;->url720:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/api/VideoFile;->url1080:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/api/VideoFile;->urlHls:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/api/VideoFile;->urlExternal:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isFlv()Z
    .locals 1

    .prologue
    .line 386
    iget-boolean v0, p0, Lcom/vkontakte/android/api/VideoFile;->flv:Z

    return v0
.end method

.method public isHLSSupported()Z
    .locals 2

    .prologue
    .line 382
    iget-object v0, p0, Lcom/vkontakte/android/api/VideoFile;->urlHls:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-lt v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isLive()Z
    .locals 2

    .prologue
    .line 394
    iget-boolean v0, p0, Lcom/vkontakte/android/api/VideoFile;->live:Z

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/vkontakte/android/api/VideoFile;->liveStatus:I

    const/4 v1, 0x3

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isLiveUpcoming()Z
    .locals 3

    .prologue
    const/4 v0, 0x1

    .line 398
    iget-boolean v1, p0, Lcom/vkontakte/android/api/VideoFile;->live:Z

    if-eqz v1, :cond_1

    iget v1, p0, Lcom/vkontakte/android/api/VideoFile;->liveStatus:I

    const/4 v2, 0x5

    if-eq v1, v2, :cond_0

    iget v1, p0, Lcom/vkontakte/android/api/VideoFile;->liveStatus:I

    if-ne v1, v0, :cond_1

    :cond_0
    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public serializeTo(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 3
    .param p1, "p"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 273
    iget v0, p0, Lcom/vkontakte/android/api/VideoFile;->oid:I

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 274
    iget v0, p0, Lcom/vkontakte/android/api/VideoFile;->vid:I

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 275
    iget v0, p0, Lcom/vkontakte/android/api/VideoFile;->duration:I

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 276
    iget-object v0, p0, Lcom/vkontakte/android/api/VideoFile;->url240:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 277
    iget-object v0, p0, Lcom/vkontakte/android/api/VideoFile;->url360:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 278
    iget-object v0, p0, Lcom/vkontakte/android/api/VideoFile;->url480:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 279
    iget-object v0, p0, Lcom/vkontakte/android/api/VideoFile;->url720:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 280
    iget-object v0, p0, Lcom/vkontakte/android/api/VideoFile;->url1080:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 281
    iget-object v0, p0, Lcom/vkontakte/android/api/VideoFile;->urlHls:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 282
    iget-object v0, p0, Lcom/vkontakte/android/api/VideoFile;->urlExternal:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 283
    iget-object v0, p0, Lcom/vkontakte/android/api/VideoFile;->urlEmbed:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 284
    iget-object v0, p0, Lcom/vkontakte/android/api/VideoFile;->urlThumb:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 285
    iget-object v0, p0, Lcom/vkontakte/android/api/VideoFile;->urlBigThumb:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 286
    iget-object v0, p0, Lcom/vkontakte/android/api/VideoFile;->title:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 287
    iget-object v0, p0, Lcom/vkontakte/android/api/VideoFile;->descr:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 288
    iget-object v0, p0, Lcom/vkontakte/android/api/VideoFile;->platform:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 289
    iget v0, p0, Lcom/vkontakte/android/api/VideoFile;->date:I

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 290
    iget v0, p0, Lcom/vkontakte/android/api/VideoFile;->views:I

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 291
    iget-object v0, p0, Lcom/vkontakte/android/api/VideoFile;->ownerName:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 292
    iget-object v0, p0, Lcom/vkontakte/android/api/VideoFile;->ownerPhoto:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 293
    iget-object v0, p0, Lcom/vkontakte/android/api/VideoFile;->accessKey:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 294
    iget v0, p0, Lcom/vkontakte/android/api/VideoFile;->likes:I

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 295
    iget v0, p0, Lcom/vkontakte/android/api/VideoFile;->comments:I

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 296
    iget v0, p0, Lcom/vkontakte/android/api/VideoFile;->reposts:I

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 297
    iget-boolean v0, p0, Lcom/vkontakte/android/api/VideoFile;->liked:Z

    if-eqz v0, :cond_0

    move v0, v1

    :goto_0
    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 298
    iget-boolean v0, p0, Lcom/vkontakte/android/api/VideoFile;->reposted:Z

    if-eqz v0, :cond_1

    move v0, v1

    :goto_1
    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 299
    iget-boolean v0, p0, Lcom/vkontakte/android/api/VideoFile;->live:Z

    if-eqz v0, :cond_2

    move v0, v1

    :goto_2
    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 300
    iget-boolean v0, p0, Lcom/vkontakte/android/api/VideoFile;->repeat:Z

    if-eqz v0, :cond_3

    move v0, v1

    :goto_3
    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 301
    iget-boolean v0, p0, Lcom/vkontakte/android/api/VideoFile;->canComment:Z

    if-eqz v0, :cond_4

    move v0, v1

    :goto_4
    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 302
    iget-boolean v0, p0, Lcom/vkontakte/android/api/VideoFile;->canEdit:Z

    if-eqz v0, :cond_5

    move v0, v1

    :goto_5
    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 303
    iget-boolean v0, p0, Lcom/vkontakte/android/api/VideoFile;->canRepost:Z

    if-eqz v0, :cond_6

    move v0, v1

    :goto_6
    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 304
    iget-boolean v0, p0, Lcom/vkontakte/android/api/VideoFile;->canAdd:Z

    if-eqz v0, :cond_7

    move v0, v1

    :goto_7
    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 305
    iget-boolean v0, p0, Lcom/vkontakte/android/api/VideoFile;->flv:Z

    if-eqz v0, :cond_8

    move v0, v1

    :goto_8
    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 306
    iget-boolean v0, p0, Lcom/vkontakte/android/api/VideoFile;->noAutoplay:Z

    if-eqz v0, :cond_9

    move v0, v1

    :goto_9
    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 307
    iget-boolean v0, p0, Lcom/vkontakte/android/api/VideoFile;->contentRestricted:Z

    if-eqz v0, :cond_a

    move v0, v1

    :goto_a
    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 308
    iget-boolean v0, p0, Lcom/vkontakte/android/api/VideoFile;->processing:Z

    if-eqz v0, :cond_b

    :goto_b
    invoke-virtual {p1, v1}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 309
    iget v0, p0, Lcom/vkontakte/android/api/VideoFile;->width:I

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 310
    iget v0, p0, Lcom/vkontakte/android/api/VideoFile;->height:I

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 311
    iget-object v0, p0, Lcom/vkontakte/android/api/VideoFile;->firstFrame130:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 312
    iget-object v0, p0, Lcom/vkontakte/android/api/VideoFile;->firstFrame320:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 313
    iget-object v0, p0, Lcom/vkontakte/android/api/VideoFile;->firstFrame800:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 314
    iget v0, p0, Lcom/vkontakte/android/api/VideoFile;->liveStatus:I

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 315
    iget-object v0, p0, Lcom/vkontakte/android/api/VideoFile;->privacy:Ljava/util/List;

    invoke-static {p1, v0}, Lcom/vkontakte/android/SystemUtils;->writeSerializerSerializableList(Lcom/vkontakte/android/utils/Serializer;Ljava/util/List;)V

    .line 316
    iget-object v0, p0, Lcom/vkontakte/android/api/VideoFile;->privacyComment:Ljava/util/List;

    invoke-static {p1, v0}, Lcom/vkontakte/android/SystemUtils;->writeSerializerSerializableList(Lcom/vkontakte/android/utils/Serializer;Ljava/util/List;)V

    .line 317
    iget-wide v0, p0, Lcom/vkontakte/android/api/VideoFile;->seekToMs:J

    invoke-virtual {p1, v0, v1}, Lcom/vkontakte/android/utils/Serializer;->writeLong(J)V

    .line 318
    return-void

    :cond_0
    move v0, v2

    .line 297
    goto/16 :goto_0

    :cond_1
    move v0, v2

    .line 298
    goto/16 :goto_1

    :cond_2
    move v0, v2

    .line 299
    goto :goto_2

    :cond_3
    move v0, v2

    .line 300
    goto :goto_3

    :cond_4
    move v0, v2

    .line 301
    goto :goto_4

    :cond_5
    move v0, v2

    .line 302
    goto :goto_5

    :cond_6
    move v0, v2

    .line 303
    goto :goto_6

    :cond_7
    move v0, v2

    .line 304
    goto :goto_7

    :cond_8
    move v0, v2

    .line 305
    goto :goto_8

    :cond_9
    move v0, v2

    .line 306
    goto :goto_9

    :cond_a
    move v0, v2

    .line 307
    goto :goto_a

    :cond_b
    move v1, v2

    .line 308
    goto :goto_b
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 378
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "video"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/vkontakte/android/api/VideoFile;->oid:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/vkontakte/android/api/VideoFile;->vid:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v0, p0, Lcom/vkontakte/android/api/VideoFile;->accessKey:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "_"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, p0, Lcom/vkontakte/android/api/VideoFile;->accessKey:Ljava/lang/String;

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
