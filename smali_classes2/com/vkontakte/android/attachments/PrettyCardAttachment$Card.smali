.class public Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card;
.super Lcom/vkontakte/android/utils/Serializer$SerializableAdapter;
.source "PrettyCardAttachment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/attachments/PrettyCardAttachment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Card"
.end annotation


# static fields
.field public static final CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/utils/Serializer$Creator",
            "<",
            "Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public button:Lcom/vkontakte/android/attachments/PrettyCardAttachment$Button;

.field public cardData:Ljava/lang/String;

.field public id:Ljava/lang/String;

.field public image:Lcom/vk/core/common/Image;

.field private impressionStatistic:Lcom/vkontakte/android/statistics/StatisticPrettyCard;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public linkUrl:Ljava/lang/String;

.field public linkUrlTarget:Ljava/lang/String;

.field public transient postInteract:Lcom/vkontakte/android/data/PostInteract;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public price:Ljava/lang/String;

.field public priceOld:Ljava/lang/String;

.field public title:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 188
    new-instance v0, Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card$1;

    invoke-direct {v0}, Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card$1;-><init>()V

    sput-object v0, Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card;->CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;

    return-void
.end method

.method public constructor <init>(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 1
    .param p1, "is"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 156
    invoke-direct {p0}, Lcom/vkontakte/android/utils/Serializer$SerializableAdapter;-><init>()V

    .line 157
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card;->id:Ljava/lang/String;

    .line 158
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card;->cardData:Ljava/lang/String;

    .line 159
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card;->linkUrlTarget:Ljava/lang/String;

    .line 160
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card;->linkUrl:Ljava/lang/String;

    .line 161
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card;->title:Ljava/lang/String;

    .line 162
    const-class v0, Lcom/vkontakte/android/attachments/PrettyCardAttachment$Button;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->readSerializable(Ljava/lang/ClassLoader;)Lcom/vkontakte/android/utils/Serializer$Serializable;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/attachments/PrettyCardAttachment$Button;

    iput-object v0, p0, Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card;->button:Lcom/vkontakte/android/attachments/PrettyCardAttachment$Button;

    .line 163
    const-class v0, Lcom/vk/core/common/Image;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->readSerializable(Ljava/lang/ClassLoader;)Lcom/vkontakte/android/utils/Serializer$Serializable;

    move-result-object v0

    check-cast v0, Lcom/vk/core/common/Image;

    iput-object v0, p0, Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card;->image:Lcom/vk/core/common/Image;

    .line 164
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card;->price:Ljava/lang/String;

    .line 165
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card;->priceOld:Ljava/lang/String;

    .line 166
    const-class v0, Lcom/vkontakte/android/statistics/StatisticPrettyCard;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->readSerializable(Ljava/lang/ClassLoader;)Lcom/vkontakte/android/utils/Serializer$Serializable;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/statistics/StatisticPrettyCard;

    iput-object v0, p0, Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card;->impressionStatistic:Lcom/vkontakte/android/statistics/StatisticPrettyCard;

    .line 167
    return-void
.end method

.method public constructor <init>(Lorg/json/JSONObject;)V
    .locals 3
    .param p1, "json"    # Lorg/json/JSONObject;

    .prologue
    .line 134
    invoke-direct {p0}, Lcom/vkontakte/android/utils/Serializer$SerializableAdapter;-><init>()V

    .line 135
    const-string/jumbo v1, "card_id"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card;->id:Ljava/lang/String;

    .line 136
    const-string/jumbo v1, "card_data"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card;->cardData:Ljava/lang/String;

    .line 137
    const-string/jumbo v1, "link_url_target"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card;->linkUrlTarget:Ljava/lang/String;

    .line 138
    const-string/jumbo v1, "link_url"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card;->linkUrl:Ljava/lang/String;

    .line 139
    const-string/jumbo v1, "title"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card;->title:Ljava/lang/String;

    .line 141
    const-string/jumbo v1, "button"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 142
    .local v0, "buttonJson":Lorg/json/JSONObject;
    if-eqz v0, :cond_0

    .line 143
    new-instance v1, Lcom/vkontakte/android/attachments/PrettyCardAttachment$Button;

    invoke-direct {v1, v0}, Lcom/vkontakte/android/attachments/PrettyCardAttachment$Button;-><init>(Lorg/json/JSONObject;)V

    iput-object v1, p0, Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card;->button:Lcom/vkontakte/android/attachments/PrettyCardAttachment$Button;

    .line 146
    :cond_0
    const-string/jumbo v1, "price"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card;->price:Ljava/lang/String;

    .line 147
    const-string/jumbo v1, "price_old"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card;->priceOld:Ljava/lang/String;

    .line 150
    :try_start_0
    new-instance v1, Lcom/vk/core/common/Image;

    const-string/jumbo v2, "images"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/vk/core/common/Image;-><init>(Lorg/json/JSONArray;)V

    iput-object v1, p0, Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card;->image:Lcom/vk/core/common/Image;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 154
    :goto_0
    return-void

    .line 151
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method static synthetic access$100(Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card;)Lcom/vkontakte/android/statistics/StatisticPrettyCard;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card;

    .prologue
    .line 116
    iget-object v0, p0, Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card;->impressionStatistic:Lcom/vkontakte/android/statistics/StatisticPrettyCard;

    return-object v0
.end method


# virtual methods
.method public serializeTo(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 1
    .param p1, "s"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 176
    iget-object v0, p0, Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card;->id:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 177
    iget-object v0, p0, Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card;->cardData:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 178
    iget-object v0, p0, Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card;->linkUrlTarget:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 179
    iget-object v0, p0, Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card;->linkUrl:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 180
    iget-object v0, p0, Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card;->title:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 181
    iget-object v0, p0, Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card;->button:Lcom/vkontakte/android/attachments/PrettyCardAttachment$Button;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeSerializable(Lcom/vkontakte/android/utils/Serializer$Serializable;)V

    .line 182
    iget-object v0, p0, Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card;->image:Lcom/vk/core/common/Image;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeSerializable(Lcom/vkontakte/android/utils/Serializer$Serializable;)V

    .line 183
    iget-object v0, p0, Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card;->price:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 184
    iget-object v0, p0, Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card;->priceOld:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 185
    iget-object v0, p0, Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card;->impressionStatistic:Lcom/vkontakte/android/statistics/StatisticPrettyCard;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeSerializable(Lcom/vkontakte/android/utils/Serializer$Serializable;)V

    .line 186
    return-void
.end method

.method public setStatisticsData(Lcom/vkontakte/android/data/PostInteract;II)V
    .locals 6
    .param p1, "postInteract"    # Lcom/vkontakte/android/data/PostInteract;
    .param p2, "adId1"    # I
    .param p3, "adId2"    # I

    .prologue
    .line 170
    iput-object p1, p0, Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card;->postInteract:Lcom/vkontakte/android/data/PostInteract;

    .line 171
    new-instance v0, Lcom/vkontakte/android/statistics/StatisticPrettyCard;

    iget-object v1, p1, Lcom/vkontakte/android/data/PostInteract;->adData:Ljava/lang/String;

    iget-object v2, p0, Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card;->cardData:Ljava/lang/String;

    iget-object v5, p0, Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card;->id:Ljava/lang/String;

    move v3, p2

    move v4, p3

    invoke-direct/range {v0 .. v5}, Lcom/vkontakte/android/statistics/StatisticPrettyCard;-><init>(Ljava/lang/String;Ljava/lang/String;IILjava/lang/String;)V

    iput-object v0, p0, Lcom/vkontakte/android/attachments/PrettyCardAttachment$Card;->impressionStatistic:Lcom/vkontakte/android/statistics/StatisticPrettyCard;

    .line 172
    return-void
.end method
