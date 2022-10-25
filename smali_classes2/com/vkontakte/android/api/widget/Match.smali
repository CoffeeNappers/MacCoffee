.class public Lcom/vkontakte/android/api/widget/Match;
.super Lcom/vkontakte/android/utils/Serializer$SerializableAdapter;
.source "Match.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/api/widget/Match$Score;
    }
.end annotation


# static fields
.field public static final CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/utils/Serializer$Creator",
            "<",
            "Lcom/vkontakte/android/api/widget/Match;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final icon:Lcom/vk/core/common/Image;

.field private final liveUrl:Ljava/lang/String;

.field private final score:Lcom/vkontakte/android/api/widget/Match$Score;

.field private final state:Ljava/lang/String;

.field private final teamA:Lcom/vkontakte/android/api/widget/Team;

.field private final teamB:Lcom/vkontakte/android/api/widget/Team;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 139
    new-instance v0, Lcom/vkontakte/android/api/widget/Match$1;

    invoke-direct {v0}, Lcom/vkontakte/android/api/widget/Match$1;-><init>()V

    sput-object v0, Lcom/vkontakte/android/api/widget/Match;->CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;

    return-void
.end method

.method constructor <init>(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 1
    .param p1, "s"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 33
    invoke-direct {p0}, Lcom/vkontakte/android/utils/Serializer$SerializableAdapter;-><init>()V

    .line 34
    const-class v0, Lcom/vkontakte/android/api/widget/Team;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->readSerializable(Ljava/lang/ClassLoader;)Lcom/vkontakte/android/utils/Serializer$Serializable;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/api/widget/Team;

    iput-object v0, p0, Lcom/vkontakte/android/api/widget/Match;->teamA:Lcom/vkontakte/android/api/widget/Team;

    .line 35
    const-class v0, Lcom/vkontakte/android/api/widget/Team;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->readSerializable(Ljava/lang/ClassLoader;)Lcom/vkontakte/android/utils/Serializer$Serializable;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/api/widget/Team;

    iput-object v0, p0, Lcom/vkontakte/android/api/widget/Match;->teamB:Lcom/vkontakte/android/api/widget/Team;

    .line 36
    const-class v0, Lcom/vk/core/common/Image;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->readSerializable(Ljava/lang/ClassLoader;)Lcom/vkontakte/android/utils/Serializer$Serializable;

    move-result-object v0

    check-cast v0, Lcom/vk/core/common/Image;

    iput-object v0, p0, Lcom/vkontakte/android/api/widget/Match;->icon:Lcom/vk/core/common/Image;

    .line 37
    const-class v0, Lcom/vkontakte/android/api/widget/Match$Score;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->readSerializable(Ljava/lang/ClassLoader;)Lcom/vkontakte/android/utils/Serializer$Serializable;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/api/widget/Match$Score;

    iput-object v0, p0, Lcom/vkontakte/android/api/widget/Match;->score:Lcom/vkontakte/android/api/widget/Match$Score;

    .line 38
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/api/widget/Match;->state:Ljava/lang/String;

    .line 39
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/api/widget/Match;->liveUrl:Ljava/lang/String;

    .line 40
    return-void
.end method

.method constructor <init>(Lorg/json/JSONObject;)V
    .locals 5
    .param p1, "match"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 20
    invoke-direct {p0}, Lcom/vkontakte/android/utils/Serializer$SerializableAdapter;-><init>()V

    .line 21
    const-string/jumbo v2, "state"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/vkontakte/android/api/widget/Match;->state:Ljava/lang/String;

    .line 22
    new-instance v2, Lcom/vkontakte/android/api/widget/Match$Score;

    const-string/jumbo v4, "score"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    invoke-direct {v2, v4}, Lcom/vkontakte/android/api/widget/Match$Score;-><init>(Lorg/json/JSONObject;)V

    iput-object v2, p0, Lcom/vkontakte/android/api/widget/Match;->score:Lcom/vkontakte/android/api/widget/Match$Score;

    .line 23
    new-instance v2, Lcom/vkontakte/android/api/widget/Team;

    const-string/jumbo v4, "team_a"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    invoke-direct {v2, v4}, Lcom/vkontakte/android/api/widget/Team;-><init>(Lorg/json/JSONObject;)V

    iput-object v2, p0, Lcom/vkontakte/android/api/widget/Match;->teamA:Lcom/vkontakte/android/api/widget/Team;

    .line 24
    new-instance v2, Lcom/vkontakte/android/api/widget/Team;

    const-string/jumbo v4, "team_b"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    invoke-direct {v2, v4}, Lcom/vkontakte/android/api/widget/Team;-><init>(Lorg/json/JSONObject;)V

    iput-object v2, p0, Lcom/vkontakte/android/api/widget/Match;->teamB:Lcom/vkontakte/android/api/widget/Team;

    .line 26
    const-string/jumbo v2, "icon"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    .line 27
    .local v0, "icons":Lorg/json/JSONArray;
    const-string/jumbo v2, "live_action"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    .line 29
    .local v1, "liveAction":Lorg/json/JSONObject;
    if-nez v0, :cond_0

    move-object v2, v3

    :goto_0
    iput-object v2, p0, Lcom/vkontakte/android/api/widget/Match;->icon:Lcom/vk/core/common/Image;

    .line 30
    if-nez v1, :cond_1

    :goto_1
    iput-object v3, p0, Lcom/vkontakte/android/api/widget/Match;->liveUrl:Ljava/lang/String;

    .line 31
    return-void

    .line 29
    :cond_0
    new-instance v2, Lcom/vk/core/common/Image;

    invoke-direct {v2, v0}, Lcom/vk/core/common/Image;-><init>(Lorg/json/JSONArray;)V

    goto :goto_0

    .line 30
    :cond_1
    const-string/jumbo v2, "url"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    goto :goto_1
.end method


# virtual methods
.method public getIcon(I)Lcom/vk/core/common/ImageSize;
    .locals 1
    .param p1, "width"    # I
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 64
    iget-object v0, p0, Lcom/vkontakte/android/api/widget/Match;->icon:Lcom/vk/core/common/Image;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/api/widget/Match;->icon:Lcom/vk/core/common/Image;

    invoke-virtual {v0, p1}, Lcom/vk/core/common/Image;->getImageByWidth(I)Lcom/vk/core/common/ImageSize;

    move-result-object v0

    goto :goto_0
.end method

.method public getLiveUrl()Ljava/lang/String;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 69
    iget-object v0, p0, Lcom/vkontakte/android/api/widget/Match;->liveUrl:Ljava/lang/String;

    return-object v0
.end method

.method public getScore()Lcom/vkontakte/android/api/widget/Match$Score;
    .locals 1

    .prologue
    .line 51
    iget-object v0, p0, Lcom/vkontakte/android/api/widget/Match;->score:Lcom/vkontakte/android/api/widget/Match$Score;

    return-object v0
.end method

.method public getState()Ljava/lang/String;
    .locals 1

    .prologue
    .line 55
    iget-object v0, p0, Lcom/vkontakte/android/api/widget/Match;->state:Ljava/lang/String;

    return-object v0
.end method

.method public getTeamA()Lcom/vkontakte/android/api/widget/Team;
    .locals 1

    .prologue
    .line 43
    iget-object v0, p0, Lcom/vkontakte/android/api/widget/Match;->teamA:Lcom/vkontakte/android/api/widget/Team;

    return-object v0
.end method

.method public getTeamB()Lcom/vkontakte/android/api/widget/Team;
    .locals 1

    .prologue
    .line 47
    iget-object v0, p0, Lcom/vkontakte/android/api/widget/Match;->teamB:Lcom/vkontakte/android/api/widget/Team;

    return-object v0
.end method

.method public hasIcon()Z
    .locals 1

    .prologue
    .line 59
    iget-object v0, p0, Lcom/vkontakte/android/api/widget/Match;->icon:Lcom/vk/core/common/Image;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/api/widget/Match;->icon:Lcom/vk/core/common/Image;

    invoke-virtual {v0}, Lcom/vk/core/common/Image;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public serializeTo(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 1
    .param p1, "s"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 74
    iget-object v0, p0, Lcom/vkontakte/android/api/widget/Match;->teamA:Lcom/vkontakte/android/api/widget/Team;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeSerializable(Lcom/vkontakte/android/utils/Serializer$Serializable;)V

    .line 75
    iget-object v0, p0, Lcom/vkontakte/android/api/widget/Match;->teamB:Lcom/vkontakte/android/api/widget/Team;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeSerializable(Lcom/vkontakte/android/utils/Serializer$Serializable;)V

    .line 76
    iget-object v0, p0, Lcom/vkontakte/android/api/widget/Match;->icon:Lcom/vk/core/common/Image;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeSerializable(Lcom/vkontakte/android/utils/Serializer$Serializable;)V

    .line 77
    iget-object v0, p0, Lcom/vkontakte/android/api/widget/Match;->score:Lcom/vkontakte/android/api/widget/Match$Score;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeSerializable(Lcom/vkontakte/android/utils/Serializer$Serializable;)V

    .line 78
    iget-object v0, p0, Lcom/vkontakte/android/api/widget/Match;->state:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 79
    iget-object v0, p0, Lcom/vkontakte/android/api/widget/Match;->liveUrl:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 80
    return-void
.end method
