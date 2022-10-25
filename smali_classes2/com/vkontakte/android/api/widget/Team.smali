.class public Lcom/vkontakte/android/api/widget/Team;
.super Lcom/vkontakte/android/utils/Serializer$SerializableAdapter;
.source "Team.java"


# static fields
.field public static final CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/utils/Serializer$Creator",
            "<",
            "Lcom/vkontakte/android/api/widget/Team;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final description:Ljava/lang/String;

.field private final image:Lcom/vk/core/common/Image;

.field private final name:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 56
    new-instance v0, Lcom/vkontakte/android/api/widget/Team$1;

    invoke-direct {v0}, Lcom/vkontakte/android/api/widget/Team$1;-><init>()V

    sput-object v0, Lcom/vkontakte/android/api/widget/Team;->CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;

    return-void
.end method

.method constructor <init>(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 1
    .param p1, "s"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 24
    invoke-direct {p0}, Lcom/vkontakte/android/utils/Serializer$SerializableAdapter;-><init>()V

    .line 25
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/api/widget/Team;->name:Ljava/lang/String;

    .line 26
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/api/widget/Team;->description:Ljava/lang/String;

    .line 27
    const-class v0, Lcom/vk/core/common/Image;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->readSerializable(Ljava/lang/ClassLoader;)Lcom/vkontakte/android/utils/Serializer$Serializable;

    move-result-object v0

    check-cast v0, Lcom/vk/core/common/Image;

    iput-object v0, p0, Lcom/vkontakte/android/api/widget/Team;->image:Lcom/vk/core/common/Image;

    .line 28
    return-void
.end method

.method constructor <init>(Lorg/json/JSONObject;)V
    .locals 2
    .param p1, "team"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 17
    invoke-direct {p0}, Lcom/vkontakte/android/utils/Serializer$SerializableAdapter;-><init>()V

    .line 18
    const-string/jumbo v1, "name"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/api/widget/Team;->name:Ljava/lang/String;

    .line 19
    const-string/jumbo v1, "descr"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/api/widget/Team;->description:Ljava/lang/String;

    .line 20
    const-string/jumbo v1, "icon"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    .line 21
    .local v0, "icons":Lorg/json/JSONArray;
    if-nez v0, :cond_0

    const/4 v1, 0x0

    :goto_0
    iput-object v1, p0, Lcom/vkontakte/android/api/widget/Team;->image:Lcom/vk/core/common/Image;

    .line 22
    return-void

    .line 21
    :cond_0
    new-instance v1, Lcom/vk/core/common/Image;

    invoke-direct {v1, v0}, Lcom/vk/core/common/Image;-><init>(Lorg/json/JSONArray;)V

    goto :goto_0
.end method


# virtual methods
.method public getDescription()Ljava/lang/String;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 36
    iget-object v0, p0, Lcom/vkontakte/android/api/widget/Team;->description:Ljava/lang/String;

    return-object v0
.end method

.method public getImage(I)Lcom/vk/core/common/ImageSize;
    .locals 1
    .param p1, "width"    # I
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 41
    iget-object v0, p0, Lcom/vkontakte/android/api/widget/Team;->image:Lcom/vk/core/common/Image;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/api/widget/Team;->image:Lcom/vk/core/common/Image;

    invoke-virtual {v0, p1}, Lcom/vk/core/common/Image;->getImageByWidth(I)Lcom/vk/core/common/ImageSize;

    move-result-object v0

    goto :goto_0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 31
    iget-object v0, p0, Lcom/vkontakte/android/api/widget/Team;->name:Ljava/lang/String;

    return-object v0
.end method

.method public hasImage()Z
    .locals 1

    .prologue
    .line 45
    iget-object v0, p0, Lcom/vkontakte/android/api/widget/Team;->image:Lcom/vk/core/common/Image;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/api/widget/Team;->image:Lcom/vk/core/common/Image;

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
    .line 50
    iget-object v0, p0, Lcom/vkontakte/android/api/widget/Team;->name:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 51
    iget-object v0, p0, Lcom/vkontakte/android/api/widget/Team;->description:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 52
    iget-object v0, p0, Lcom/vkontakte/android/api/widget/Team;->image:Lcom/vk/core/common/Image;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeSerializable(Lcom/vkontakte/android/utils/Serializer$Serializable;)V

    .line 53
    return-void
.end method
