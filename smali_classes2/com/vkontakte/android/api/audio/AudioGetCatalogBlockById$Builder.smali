.class public Lcom/vkontakte/android/api/audio/AudioGetCatalogBlockById$Builder;
.super Ljava/lang/Object;
.source "AudioGetCatalogBlockById.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/api/audio/AudioGetCatalogBlockById;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field final blockId:I

.field final count:I

.field final offset:I

.field shuffle:Z


# direct methods
.method public constructor <init>(III)V
    .locals 1
    .param p1, "blockId"    # I
    .param p2, "offset"    # I
    .param p3, "count"    # I

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/api/audio/AudioGetCatalogBlockById$Builder;->shuffle:Z

    .line 25
    iput p1, p0, Lcom/vkontakte/android/api/audio/AudioGetCatalogBlockById$Builder;->blockId:I

    .line 26
    iput p2, p0, Lcom/vkontakte/android/api/audio/AudioGetCatalogBlockById$Builder;->offset:I

    .line 27
    iput p3, p0, Lcom/vkontakte/android/api/audio/AudioGetCatalogBlockById$Builder;->count:I

    .line 28
    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/api/audio/AudioGetCatalogBlockById$Builder;Lorg/json/JSONObject;)Lcom/vk/music/dto/Section;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/api/audio/AudioGetCatalogBlockById$Builder;
    .param p1, "x1"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 19
    invoke-direct {p0, p1}, Lcom/vkontakte/android/api/audio/AudioGetCatalogBlockById$Builder;->parseSection(Lorg/json/JSONObject;)Lcom/vk/music/dto/Section;

    move-result-object v0

    return-object v0
.end method

.method private fillParams(Lcom/vkontakte/android/api/VKAPIRequest;)V
    .locals 4
    .param p1, "request"    # Lcom/vkontakte/android/api/VKAPIRequest;

    .prologue
    const/4 v1, 0x1

    .line 124
    const-string/jumbo v2, "block_id"

    iget v3, p0, Lcom/vkontakte/android/api/audio/AudioGetCatalogBlockById$Builder;->blockId:I

    invoke-virtual {p1, v2, v3}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 125
    const-string/jumbo v2, "offset"

    iget v3, p0, Lcom/vkontakte/android/api/audio/AudioGetCatalogBlockById$Builder;->offset:I

    invoke-virtual {p1, v2, v3}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 126
    const-string/jumbo v2, "count"

    iget v3, p0, Lcom/vkontakte/android/api/audio/AudioGetCatalogBlockById$Builder;->count:I

    invoke-virtual {p1, v2, v3}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 127
    const-string/jumbo v2, "extended"

    invoke-virtual {p1, v2, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 128
    iget-boolean v2, p0, Lcom/vkontakte/android/api/audio/AudioGetCatalogBlockById$Builder;->shuffle:Z

    if-eqz v2, :cond_1

    .line 129
    const-string/jumbo v2, "shuffle"

    invoke-virtual {p1, v2, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 130
    new-instance v2, Ljava/util/Random;

    invoke-direct {v2}, Ljava/util/Random;-><init>()V

    invoke-virtual {v2}, Ljava/util/Random;->nextInt()I

    move-result v0

    .line 131
    .local v0, "shuffleSeed":I
    const-string/jumbo v2, "shuffle_seed"

    if-nez v0, :cond_0

    move v0, v1

    .end local v0    # "shuffleSeed":I
    :cond_0
    invoke-virtual {p1, v2, v0}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 135
    :goto_0
    return-void

    .line 133
    :cond_1
    const-string/jumbo v1, "shuffle"

    const/4 v2, 0x0

    invoke-virtual {p1, v1, v2}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    goto :goto_0
.end method

.method private parseSection(Lorg/json/JSONObject;)Lcom/vk/music/dto/Section;
    .locals 3
    .param p1, "r"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 138
    new-instance v0, Lcom/vk/music/dto/Section;

    const-string/jumbo v1, "response"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    const-string/jumbo v2, "block"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vk/music/dto/Section;-><init>(Lorg/json/JSONObject;)V

    return-object v0
.end method


# virtual methods
.method public buildAudios()Lcom/vkontakte/android/api/VKAPIRequest;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vkontakte/android/api/VKAPIRequest",
            "<",
            "Lcom/vkontakte/android/data/VKList",
            "<",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 100
    new-instance v0, Lcom/vkontakte/android/api/audio/AudioGetCatalogBlockById$Builder$4;

    const-string/jumbo v1, "audio.getCatalogBlockById"

    invoke-direct {v0, p0, v1}, Lcom/vkontakte/android/api/audio/AudioGetCatalogBlockById$Builder$4;-><init>(Lcom/vkontakte/android/api/audio/AudioGetCatalogBlockById$Builder;Ljava/lang/String;)V

    .line 117
    .local v0, "request":Lcom/vkontakte/android/api/VKAPIRequest;, "Lcom/vkontakte/android/api/VKAPIRequest<Lcom/vkontakte/android/data/VKList<Lcom/vkontakte/android/audio/MusicTrack;>;>;"
    invoke-direct {p0, v0}, Lcom/vkontakte/android/api/audio/AudioGetCatalogBlockById$Builder;->fillParams(Lcom/vkontakte/android/api/VKAPIRequest;)V

    .line 118
    return-object v0
.end method

.method public buildPlaylists()Lcom/vkontakte/android/api/VKAPIRequest;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vkontakte/android/api/VKAPIRequest",
            "<",
            "Lcom/vkontakte/android/data/VKList",
            "<",
            "Lcom/vk/music/dto/Playlist;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 52
    new-instance v0, Lcom/vkontakte/android/api/audio/AudioGetCatalogBlockById$Builder$2;

    const-string/jumbo v1, "audio.getCatalogBlockById"

    invoke-direct {v0, p0, v1}, Lcom/vkontakte/android/api/audio/AudioGetCatalogBlockById$Builder$2;-><init>(Lcom/vkontakte/android/api/audio/AudioGetCatalogBlockById$Builder;Ljava/lang/String;)V

    .line 73
    .local v0, "request":Lcom/vkontakte/android/api/VKAPIRequest;, "Lcom/vkontakte/android/api/VKAPIRequest<Lcom/vkontakte/android/data/VKList<Lcom/vk/music/dto/Playlist;>;>;"
    invoke-direct {p0, v0}, Lcom/vkontakte/android/api/audio/AudioGetCatalogBlockById$Builder;->fillParams(Lcom/vkontakte/android/api/VKAPIRequest;)V

    .line 74
    return-object v0
.end method

.method public buildProfiles()Lcom/vkontakte/android/api/VKAPIRequest;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vkontakte/android/api/VKAPIRequest",
            "<",
            "Lcom/vkontakte/android/data/VKList",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 78
    new-instance v0, Lcom/vkontakte/android/api/audio/AudioGetCatalogBlockById$Builder$3;

    const-string/jumbo v1, "audio.getCatalogBlockById"

    invoke-direct {v0, p0, v1}, Lcom/vkontakte/android/api/audio/AudioGetCatalogBlockById$Builder$3;-><init>(Lcom/vkontakte/android/api/audio/AudioGetCatalogBlockById$Builder;Ljava/lang/String;)V

    .line 95
    .local v0, "request":Lcom/vkontakte/android/api/VKAPIRequest;, "Lcom/vkontakte/android/api/VKAPIRequest<Lcom/vkontakte/android/data/VKList<Lcom/vkontakte/android/UserProfile;>;>;"
    invoke-direct {p0, v0}, Lcom/vkontakte/android/api/audio/AudioGetCatalogBlockById$Builder;->fillParams(Lcom/vkontakte/android/api/VKAPIRequest;)V

    .line 96
    return-object v0
.end method

.method public buildSection()Lcom/vkontakte/android/api/VKAPIRequest;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vkontakte/android/api/VKAPIRequest",
            "<",
            "Lcom/vk/music/dto/Section;",
            ">;"
        }
    .end annotation

    .prologue
    .line 36
    new-instance v0, Lcom/vkontakte/android/api/audio/AudioGetCatalogBlockById$Builder$1;

    const-string/jumbo v1, "audio.getCatalogBlockById"

    invoke-direct {v0, p0, v1}, Lcom/vkontakte/android/api/audio/AudioGetCatalogBlockById$Builder$1;-><init>(Lcom/vkontakte/android/api/audio/AudioGetCatalogBlockById$Builder;Ljava/lang/String;)V

    .line 47
    .local v0, "request":Lcom/vkontakte/android/api/VKAPIRequest;, "Lcom/vkontakte/android/api/VKAPIRequest<Lcom/vk/music/dto/Section;>;"
    invoke-direct {p0, v0}, Lcom/vkontakte/android/api/audio/AudioGetCatalogBlockById$Builder;->fillParams(Lcom/vkontakte/android/api/VKAPIRequest;)V

    .line 48
    return-object v0
.end method

.method public shuffle()Lcom/vkontakte/android/api/audio/AudioGetCatalogBlockById$Builder;
    .locals 1

    .prologue
    .line 31
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/api/audio/AudioGetCatalogBlockById$Builder;->shuffle:Z

    .line 32
    return-object p0
.end method
