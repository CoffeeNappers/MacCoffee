.class public Lcom/vkontakte/android/api/video/VideoGetById;
.super Lcom/vkontakte/android/api/VKAPIRequest;
.source "VideoGetById.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/VKAPIRequest",
        "<",
        "Lcom/vkontakte/android/api/VideoFile;",
        ">;"
    }
.end annotation


# instance fields
.field final oid:I

.field private seekToMs:J


# direct methods
.method public constructor <init>(IILjava/lang/String;)V
    .locals 3
    .param p1, "oid"    # I
    .param p2, "vid"    # I
    .param p3, "accessKey"    # Ljava/lang/String;

    .prologue
    .line 16
    const-string/jumbo v0, "execute.getVideoById"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    .line 17
    iput p1, p0, Lcom/vkontakte/android/api/video/VideoGetById;->oid:I

    .line 18
    const-string/jumbo v0, "videos"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/video/VideoGetById;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 19
    const-string/jumbo v0, "oowner_id"

    invoke-virtual {p0, v0, p1}, Lcom/vkontakte/android/api/video/VideoGetById;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 20
    const-string/jumbo v0, "extended"

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/video/VideoGetById;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 21
    const-string/jumbo v0, "fields"

    const-string/jumbo v1, "first_name,last_name,photo_50,photo_100,photo_200,name"

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/video/VideoGetById;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 22
    if-eqz p3, :cond_0

    .line 23
    const-string/jumbo v0, "access_key"

    invoke-virtual {p0, v0, p3}, Lcom/vkontakte/android/api/video/VideoGetById;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 25
    :cond_0
    return-void
.end method


# virtual methods
.method public parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/api/VideoFile;
    .locals 10
    .param p1, "o"    # Lorg/json/JSONObject;

    .prologue
    .line 29
    :try_start_0
    const-string/jumbo v6, "response"

    invoke-virtual {p1, v6}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    .line 30
    .local v3, "response":Lorg/json/JSONObject;
    const-string/jumbo v6, "owner"

    invoke-virtual {v3, v6}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    .line 31
    .local v1, "owner":Lorg/json/JSONObject;
    new-instance v4, Lcom/vkontakte/android/api/VideoFile;

    const-string/jumbo v6, "video"

    invoke-virtual {v3, v6}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v6

    invoke-direct {v4, v6}, Lcom/vkontakte/android/api/VideoFile;-><init>(Lorg/json/JSONObject;)V

    .line 33
    .local v4, "video":Lcom/vkontakte/android/api/VideoFile;
    iget v6, p0, Lcom/vkontakte/android/api/video/VideoGetById;->oid:I

    if-lez v6, :cond_1

    .line 34
    new-instance v2, Lcom/vkontakte/android/UserProfile;

    invoke-direct {v2, v1}, Lcom/vkontakte/android/UserProfile;-><init>(Lorg/json/JSONObject;)V

    .line 35
    .local v2, "profile":Lcom/vkontakte/android/UserProfile;
    iget-object v6, v2, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    iput-object v6, v4, Lcom/vkontakte/android/api/VideoFile;->ownerName:Ljava/lang/String;

    .line 36
    iget-object v6, v2, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    iput-object v6, v4, Lcom/vkontakte/android/api/VideoFile;->ownerPhoto:Ljava/lang/String;

    .line 43
    .end local v2    # "profile":Lcom/vkontakte/android/UserProfile;
    :goto_0
    iget-wide v6, p0, Lcom/vkontakte/android/api/video/VideoGetById;->seekToMs:J

    const-wide/16 v8, 0x0

    cmp-long v6, v6, v8

    if-lez v6, :cond_0

    iget-wide v6, p0, Lcom/vkontakte/android/api/video/VideoGetById;->seekToMs:J

    iget v8, v4, Lcom/vkontakte/android/api/VideoFile;->duration:I

    mul-int/lit16 v8, v8, 0x3e8

    int-to-long v8, v8

    cmp-long v6, v6, v8

    if-gez v6, :cond_0

    .line 44
    iget-wide v6, p0, Lcom/vkontakte/android/api/video/VideoGetById;->seekToMs:J

    iput-wide v6, v4, Lcom/vkontakte/android/api/VideoFile;->seekToMs:J

    .line 50
    .end local v1    # "owner":Lorg/json/JSONObject;
    .end local v3    # "response":Lorg/json/JSONObject;
    .end local v4    # "video":Lcom/vkontakte/android/api/VideoFile;
    :cond_0
    :goto_1
    return-object v4

    .line 38
    .restart local v1    # "owner":Lorg/json/JSONObject;
    .restart local v3    # "response":Lorg/json/JSONObject;
    .restart local v4    # "video":Lcom/vkontakte/android/api/VideoFile;
    :cond_1
    new-instance v0, Lcom/vkontakte/android/api/Group;

    invoke-direct {v0, v1}, Lcom/vkontakte/android/api/Group;-><init>(Lorg/json/JSONObject;)V

    .line 39
    .local v0, "group":Lcom/vkontakte/android/api/Group;
    iget-object v6, v0, Lcom/vkontakte/android/api/Group;->name:Ljava/lang/String;

    iput-object v6, v4, Lcom/vkontakte/android/api/VideoFile;->ownerName:Ljava/lang/String;

    .line 40
    iget-object v6, v0, Lcom/vkontakte/android/api/Group;->photo:Ljava/lang/String;

    iput-object v6, v4, Lcom/vkontakte/android/api/VideoFile;->ownerPhoto:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 47
    .end local v0    # "group":Lcom/vkontakte/android/api/Group;
    .end local v1    # "owner":Lorg/json/JSONObject;
    .end local v3    # "response":Lorg/json/JSONObject;
    .end local v4    # "video":Lcom/vkontakte/android/api/VideoFile;
    :catch_0
    move-exception v5

    .line 48
    .local v5, "x":Ljava/lang/Exception;
    const-string/jumbo v6, "vk"

    invoke-static {v6, v5}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 50
    const/4 v4, 0x0

    goto :goto_1
.end method

.method public bridge synthetic parse(Lorg/json/JSONObject;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 10
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/api/video/VideoGetById;->parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/api/VideoFile;

    move-result-object v0

    return-object v0
.end method

.method public setSeekTo(J)V
    .locals 1
    .param p1, "seekToMs"    # J

    .prologue
    .line 54
    iput-wide p1, p0, Lcom/vkontakte/android/api/video/VideoGetById;->seekToMs:J

    .line 55
    return-void
.end method
