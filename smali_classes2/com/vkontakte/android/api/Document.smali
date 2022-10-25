.class public Lcom/vkontakte/android/api/Document;
.super Ljava/lang/Object;
.source "Document.java"

# interfaces
.implements Landroid/os/Parcelable;
.implements Lcom/vkontakte/android/api/BaseDocument;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/vkontakte/android/api/Document;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public access_key:Ljava/lang/String;

.field public date:I

.field public did:I

.field public duration:I

.field public ext:Ljava/lang/String;

.field public height:I

.field public linkMp3:Ljava/lang/String;

.field public linkOgg:Ljava/lang/String;

.field public oid:I

.field public size:I

.field public thumb:Ljava/lang/String;

.field public title:Ljava/lang/String;

.field public url:Ljava/lang/String;

.field public video:Ljava/lang/String;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public waveform:[B

.field public width:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 165
    new-instance v0, Lcom/vkontakte/android/api/Document$1;

    invoke-direct {v0}, Lcom/vkontakte/android/api/Document$1;-><init>()V

    sput-object v0, Lcom/vkontakte/android/api/Document;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    return-void
.end method

.method public constructor <init>(Landroid/os/Parcel;)V
    .locals 1
    .param p1, "s"    # Landroid/os/Parcel;

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/api/Document;->did:I

    .line 30
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/api/Document;->oid:I

    .line 31
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/api/Document;->size:I

    .line 32
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/api/Document;->url:Ljava/lang/String;

    .line 33
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/api/Document;->title:Ljava/lang/String;

    .line 34
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/api/Document;->ext:Ljava/lang/String;

    .line 35
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/api/Document;->thumb:Ljava/lang/String;

    .line 36
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/api/Document;->date:I

    .line 37
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/api/Document;->video:Ljava/lang/String;

    .line 38
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/api/Document;->width:I

    .line 39
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/api/Document;->height:I

    .line 40
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/api/Document;->access_key:Ljava/lang/String;

    .line 44
    return-void
.end method

.method public constructor <init>(Lorg/json/JSONObject;)V
    .locals 14
    .param p1, "j"    # Lorg/json/JSONObject;

    .prologue
    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    :try_start_0
    const-string/jumbo v11, "id"

    const-string/jumbo v12, "did"

    invoke-virtual {p1, v12}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v12

    invoke-virtual {p1, v11, v12}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v11

    iput v11, p0, Lcom/vkontakte/android/api/Document;->did:I

    .line 49
    const-string/jumbo v11, "owner_id"

    invoke-virtual {p1, v11}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v11

    iput v11, p0, Lcom/vkontakte/android/api/Document;->oid:I

    .line 50
    const-string/jumbo v11, "title"

    invoke-virtual {p1, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    iput-object v11, p0, Lcom/vkontakte/android/api/Document;->title:Ljava/lang/String;

    .line 51
    const-string/jumbo v11, "size"

    invoke-virtual {p1, v11}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v11

    iput v11, p0, Lcom/vkontakte/android/api/Document;->size:I

    .line 52
    const-string/jumbo v11, "ext"

    invoke-virtual {p1, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    iput-object v11, p0, Lcom/vkontakte/android/api/Document;->ext:Ljava/lang/String;

    .line 53
    const-string/jumbo v11, "url"

    invoke-virtual {p1, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    iput-object v11, p0, Lcom/vkontakte/android/api/Document;->url:Ljava/lang/String;

    .line 54
    const-string/jumbo v11, "access_key"

    invoke-virtual {p1, v11}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    iput-object v11, p0, Lcom/vkontakte/android/api/Document;->access_key:Ljava/lang/String;

    .line 55
    const-string/jumbo v11, "preview"

    invoke-virtual {p1, v11}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    .line 56
    .local v4, "preview":Lorg/json/JSONObject;
    if-eqz v4, :cond_5

    .line 58
    const-string/jumbo v11, "video"

    invoke-virtual {v4, v11}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v8

    .line 59
    .local v8, "video":Lorg/json/JSONObject;
    if-eqz v8, :cond_3

    .line 60
    const-string/jumbo v11, "src"

    invoke-virtual {v8, v11}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    iput-object v11, p0, Lcom/vkontakte/android/api/Document;->video:Ljava/lang/String;

    .line 64
    const-string/jumbo v11, "width"

    invoke-virtual {v8, v11}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v11

    iput v11, p0, Lcom/vkontakte/android/api/Document;->width:I

    .line 65
    const-string/jumbo v11, "height"

    invoke-virtual {v8, v11}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v11

    iput v11, p0, Lcom/vkontakte/android/api/Document;->height:I

    .line 66
    const-string/jumbo v5, "o"

    .line 71
    .local v5, "requiredSize":Ljava/lang/String;
    :goto_0
    const-string/jumbo v11, "graffiti"

    invoke-virtual {v4, v11}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    .line 72
    .local v1, "graffiti":Lorg/json/JSONObject;
    if-eqz v1, :cond_0

    .line 73
    const-string/jumbo v11, "width"

    invoke-virtual {v1, v11}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v11

    iput v11, p0, Lcom/vkontakte/android/api/Document;->width:I

    .line 74
    const-string/jumbo v11, "height"

    invoke-virtual {v1, v11}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v11

    iput v11, p0, Lcom/vkontakte/android/api/Document;->height:I

    .line 75
    const-string/jumbo v5, "o"

    .line 78
    :cond_0
    const-string/jumbo v11, "photo"

    invoke-virtual {v4, v11}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    .line 79
    .local v3, "photo":Lorg/json/JSONObject;
    if-eqz v3, :cond_2

    .line 80
    const-string/jumbo v11, "sizes"

    invoke-virtual {v3, v11}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v7

    .line 81
    .local v7, "sizes":Lorg/json/JSONArray;
    if-eqz v7, :cond_2

    .line 82
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    invoke-virtual {v7}, Lorg/json/JSONArray;->length()I

    move-result v11

    if-ge v2, v11, :cond_2

    .line 83
    invoke-virtual {v7, v2}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v6

    .line 84
    .local v6, "size":Lorg/json/JSONObject;
    const-string/jumbo v11, "type"

    invoke-virtual {v6, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v5, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_4

    .line 85
    const-string/jumbo v11, "src"

    invoke-virtual {v6, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    iput-object v11, p0, Lcom/vkontakte/android/api/Document;->thumb:Ljava/lang/String;

    .line 86
    iget v11, p0, Lcom/vkontakte/android/api/Document;->width:I

    if-nez v11, :cond_1

    .line 87
    const-string/jumbo v11, "width"

    invoke-virtual {v6, v11}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v11

    iput v11, p0, Lcom/vkontakte/android/api/Document;->width:I

    .line 89
    :cond_1
    iget v11, p0, Lcom/vkontakte/android/api/Document;->height:I

    if-nez v11, :cond_2

    .line 90
    const-string/jumbo v11, "height"

    invoke-virtual {v6, v11}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v11

    iput v11, p0, Lcom/vkontakte/android/api/Document;->height:I

    .line 99
    .end local v2    # "i":I
    .end local v6    # "size":Lorg/json/JSONObject;
    .end local v7    # "sizes":Lorg/json/JSONArray;
    :cond_2
    const-string/jumbo v11, "audio_msg"

    invoke-virtual {v4, v11}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 100
    .local v0, "audio":Lorg/json/JSONObject;
    if-eqz v0, :cond_5

    .line 101
    const-string/jumbo v11, "link_ogg"

    invoke-virtual {v0, v11}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    iput-object v11, p0, Lcom/vkontakte/android/api/Document;->linkOgg:Ljava/lang/String;

    .line 102
    const-string/jumbo v11, "link_mp3"

    invoke-virtual {v0, v11}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    iput-object v11, p0, Lcom/vkontakte/android/api/Document;->linkMp3:Ljava/lang/String;

    .line 103
    const-string/jumbo v11, "duration"

    invoke-virtual {v0, v11}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v11

    iput v11, p0, Lcom/vkontakte/android/api/Document;->duration:I

    .line 104
    const-string/jumbo v11, "waveform"

    invoke-virtual {v0, v11}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v9

    .line 105
    .local v9, "wave":Lorg/json/JSONArray;
    if-eqz v9, :cond_5

    .line 106
    invoke-virtual {v9}, Lorg/json/JSONArray;->length()I

    move-result v11

    new-array v11, v11, [B

    iput-object v11, p0, Lcom/vkontakte/android/api/Document;->waveform:[B

    .line 107
    const/4 v2, 0x0

    .restart local v2    # "i":I
    :goto_2
    invoke-virtual {v9}, Lorg/json/JSONArray;->length()I

    move-result v11

    if-ge v2, v11, :cond_5

    .line 108
    iget-object v11, p0, Lcom/vkontakte/android/api/Document;->waveform:[B

    invoke-virtual {v9, v2}, Lorg/json/JSONArray;->optInt(I)I

    move-result v12

    int-to-byte v12, v12

    aput-byte v12, v11, v2

    .line 107
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 68
    .end local v0    # "audio":Lorg/json/JSONObject;
    .end local v1    # "graffiti":Lorg/json/JSONObject;
    .end local v2    # "i":I
    .end local v3    # "photo":Lorg/json/JSONObject;
    .end local v5    # "requiredSize":Ljava/lang/String;
    .end local v9    # "wave":Lorg/json/JSONArray;
    :cond_3
    const-string/jumbo v5, "m"

    .restart local v5    # "requiredSize":Ljava/lang/String;
    goto/16 :goto_0

    .line 82
    .restart local v1    # "graffiti":Lorg/json/JSONObject;
    .restart local v2    # "i":I
    .restart local v3    # "photo":Lorg/json/JSONObject;
    .restart local v6    # "size":Lorg/json/JSONObject;
    .restart local v7    # "sizes":Lorg/json/JSONArray;
    :cond_4
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_1

    .line 113
    .end local v1    # "graffiti":Lorg/json/JSONObject;
    .end local v2    # "i":I
    .end local v3    # "photo":Lorg/json/JSONObject;
    .end local v5    # "requiredSize":Ljava/lang/String;
    .end local v6    # "size":Lorg/json/JSONObject;
    .end local v7    # "sizes":Lorg/json/JSONArray;
    .end local v8    # "video":Lorg/json/JSONObject;
    :cond_5
    const-string/jumbo v11, "gift"

    invoke-virtual {p1, v11}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_6

    .line 114
    iget-object v11, p0, Lcom/vkontakte/android/api/Document;->url:Ljava/lang/String;

    iput-object v11, p0, Lcom/vkontakte/android/api/Document;->thumb:Ljava/lang/String;

    .line 115
    const/4 v11, 0x0

    iput-object v11, p0, Lcom/vkontakte/android/api/Document;->url:Ljava/lang/String;

    .line 116
    sget-object v11, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-virtual {v11}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    const v12, 0x7f080284

    invoke-virtual {v11, v12}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v11

    iput-object v11, p0, Lcom/vkontakte/android/api/Document;->title:Ljava/lang/String;

    .line 118
    :cond_6
    const-string/jumbo v11, "date"

    invoke-virtual {p1, v11}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v11

    iput v11, p0, Lcom/vkontakte/android/api/Document;->date:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 122
    .end local v4    # "preview":Lorg/json/JSONObject;
    :goto_3
    return-void

    .line 119
    :catch_0
    move-exception v10

    .line 120
    .local v10, "x":Ljava/lang/Exception;
    const/4 v11, 0x2

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    const-string/jumbo v13, "Error parsing doc"

    aput-object v13, v11, v12

    const/4 v12, 0x1

    aput-object v10, v11, v12

    invoke-static {v11}, Lcom/vkontakte/android/utils/L;->e([Ljava/lang/Object;)V

    goto :goto_3
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .prologue
    .line 146
    const/4 v0, 0x0

    return v0
.end method

.method public getDate()I
    .locals 1

    .prologue
    .line 141
    iget v0, p0, Lcom/vkontakte/android/api/Document;->date:I

    return v0
.end method

.method public getExt()Ljava/lang/String;
    .locals 1

    .prologue
    .line 131
    iget-object v0, p0, Lcom/vkontakte/android/api/Document;->ext:Ljava/lang/String;

    return-object v0
.end method

.method public getSize()I
    .locals 1

    .prologue
    .line 136
    iget v0, p0, Lcom/vkontakte/android/api/Document;->size:I

    return v0
.end method

.method public getTitle()Ljava/lang/String;
    .locals 1

    .prologue
    .line 126
    iget-object v0, p0, Lcom/vkontakte/android/api/Document;->title:Ljava/lang/String;

    return-object v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 151
    iget v0, p0, Lcom/vkontakte/android/api/Document;->did:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 152
    iget v0, p0, Lcom/vkontakte/android/api/Document;->oid:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 153
    iget v0, p0, Lcom/vkontakte/android/api/Document;->size:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 154
    iget-object v0, p0, Lcom/vkontakte/android/api/Document;->url:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 155
    iget-object v0, p0, Lcom/vkontakte/android/api/Document;->title:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 156
    iget-object v0, p0, Lcom/vkontakte/android/api/Document;->ext:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 157
    iget-object v0, p0, Lcom/vkontakte/android/api/Document;->thumb:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 158
    iget v0, p0, Lcom/vkontakte/android/api/Document;->date:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 159
    iget-object v0, p0, Lcom/vkontakte/android/api/Document;->video:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 160
    iget v0, p0, Lcom/vkontakte/android/api/Document;->width:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 161
    iget v0, p0, Lcom/vkontakte/android/api/Document;->height:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 162
    iget-object v0, p0, Lcom/vkontakte/android/api/Document;->access_key:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 163
    return-void
.end method
