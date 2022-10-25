.class public Lcom/vkontakte/android/api/widget/WidgetTable$RowItem;
.super Lcom/vkontakte/android/utils/Serializer$SerializableAdapter;
.source "WidgetTable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/api/widget/WidgetTable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "RowItem"
.end annotation


# static fields
.field public static final CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/utils/Serializer$Creator",
            "<",
            "Lcom/vkontakte/android/api/widget/WidgetTable$RowItem;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final icon:Lcom/vk/core/common/Image;

.field private final text:Ljava/lang/String;

.field private final url:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 200
    new-instance v0, Lcom/vkontakte/android/api/widget/WidgetTable$RowItem$1;

    invoke-direct {v0}, Lcom/vkontakte/android/api/widget/WidgetTable$RowItem$1;-><init>()V

    sput-object v0, Lcom/vkontakte/android/api/widget/WidgetTable$RowItem;->CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;

    return-void
.end method

.method public constructor <init>(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 1
    .param p1, "s"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 171
    invoke-direct {p0}, Lcom/vkontakte/android/utils/Serializer$SerializableAdapter;-><init>()V

    .line 172
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/api/widget/WidgetTable$RowItem;->text:Ljava/lang/String;

    .line 173
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/api/widget/WidgetTable$RowItem;->url:Ljava/lang/String;

    .line 174
    const-class v0, Lcom/vk/core/common/Image;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->readSerializable(Ljava/lang/ClassLoader;)Lcom/vkontakte/android/utils/Serializer$Serializable;

    move-result-object v0

    check-cast v0, Lcom/vk/core/common/Image;

    iput-object v0, p0, Lcom/vkontakte/android/api/widget/WidgetTable$RowItem;->icon:Lcom/vk/core/common/Image;

    .line 175
    return-void
.end method

.method public constructor <init>(Lorg/json/JSONObject;)V
    .locals 4
    .param p1, "data"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 163
    invoke-direct {p0}, Lcom/vkontakte/android/utils/Serializer$SerializableAdapter;-><init>()V

    .line 164
    const-string/jumbo v2, "text"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/vkontakte/android/api/widget/WidgetTable$RowItem;->text:Ljava/lang/String;

    .line 165
    const-string/jumbo v2, "icon"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    .line 166
    .local v1, "icons":Lorg/json/JSONArray;
    const-string/jumbo v2, "action"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 167
    .local v0, "action":Lorg/json/JSONObject;
    if-nez v0, :cond_0

    move-object v2, v3

    :goto_0
    iput-object v2, p0, Lcom/vkontakte/android/api/widget/WidgetTable$RowItem;->url:Ljava/lang/String;

    .line 168
    if-nez v1, :cond_1

    :goto_1
    iput-object v3, p0, Lcom/vkontakte/android/api/widget/WidgetTable$RowItem;->icon:Lcom/vk/core/common/Image;

    .line 169
    return-void

    .line 167
    :cond_0
    const-string/jumbo v2, "url"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    .line 168
    :cond_1
    new-instance v3, Lcom/vk/core/common/Image;

    invoke-direct {v3, v1}, Lcom/vk/core/common/Image;-><init>(Lorg/json/JSONArray;)V

    goto :goto_1
.end method


# virtual methods
.method public getIcon()Lcom/vk/core/common/Image;
    .locals 1

    .prologue
    .line 186
    iget-object v0, p0, Lcom/vkontakte/android/api/widget/WidgetTable$RowItem;->icon:Lcom/vk/core/common/Image;

    return-object v0
.end method

.method public getText()Ljava/lang/String;
    .locals 1

    .prologue
    .line 178
    iget-object v0, p0, Lcom/vkontakte/android/api/widget/WidgetTable$RowItem;->text:Ljava/lang/String;

    return-object v0
.end method

.method public getUrl()Ljava/lang/String;
    .locals 1

    .prologue
    .line 182
    iget-object v0, p0, Lcom/vkontakte/android/api/widget/WidgetTable$RowItem;->url:Ljava/lang/String;

    return-object v0
.end method

.method public hasIcon()Z
    .locals 1

    .prologue
    .line 190
    iget-object v0, p0, Lcom/vkontakte/android/api/widget/WidgetTable$RowItem;->icon:Lcom/vk/core/common/Image;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/api/widget/WidgetTable$RowItem;->icon:Lcom/vk/core/common/Image;

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
    .line 195
    iget-object v0, p0, Lcom/vkontakte/android/api/widget/WidgetTable$RowItem;->text:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 196
    iget-object v0, p0, Lcom/vkontakte/android/api/widget/WidgetTable$RowItem;->url:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 197
    iget-object v0, p0, Lcom/vkontakte/android/api/widget/WidgetTable$RowItem;->icon:Lcom/vk/core/common/Image;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeSerializable(Lcom/vkontakte/android/utils/Serializer$Serializable;)V

    .line 198
    return-void
.end method
