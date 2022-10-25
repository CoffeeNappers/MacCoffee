.class public Lcom/vkontakte/android/api/widget/WidgetCoverList$Item;
.super Lcom/vkontakte/android/utils/Serializer$SerializableAdapter;
.source "WidgetCoverList.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/api/widget/WidgetCoverList;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Item"
.end annotation


# static fields
.field public static final CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/utils/Serializer$Creator",
            "<",
            "Lcom/vkontakte/android/api/widget/WidgetCoverList$Item;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final button:Ljava/lang/String;

.field private final buttonTarget:Ljava/lang/String;

.field private final buttonUrl:Ljava/lang/String;

.field private final cover:Lcom/vk/core/common/Image;

.field private final description:Ljava/lang/String;

.field private final target:Ljava/lang/String;

.field private final title:Ljava/lang/String;

.field private final url:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 143
    new-instance v0, Lcom/vkontakte/android/api/widget/WidgetCoverList$Item$1;

    invoke-direct {v0}, Lcom/vkontakte/android/api/widget/WidgetCoverList$Item$1;-><init>()V

    sput-object v0, Lcom/vkontakte/android/api/widget/WidgetCoverList$Item;->CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;

    return-void
.end method

.method public constructor <init>(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 1
    .param p1, "serializer"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 86
    invoke-direct {p0}, Lcom/vkontakte/android/utils/Serializer$SerializableAdapter;-><init>()V

    .line 87
    const-class v0, Lcom/vk/core/common/Image;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->readSerializable(Ljava/lang/ClassLoader;)Lcom/vkontakte/android/utils/Serializer$Serializable;

    move-result-object v0

    check-cast v0, Lcom/vk/core/common/Image;

    iput-object v0, p0, Lcom/vkontakte/android/api/widget/WidgetCoverList$Item;->cover:Lcom/vk/core/common/Image;

    .line 88
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/api/widget/WidgetCoverList$Item;->title:Ljava/lang/String;

    .line 89
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/api/widget/WidgetCoverList$Item;->url:Ljava/lang/String;

    .line 90
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/api/widget/WidgetCoverList$Item;->target:Ljava/lang/String;

    .line 91
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/api/widget/WidgetCoverList$Item;->button:Ljava/lang/String;

    .line 92
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/api/widget/WidgetCoverList$Item;->buttonUrl:Ljava/lang/String;

    .line 93
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/api/widget/WidgetCoverList$Item;->buttonTarget:Ljava/lang/String;

    .line 94
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/api/widget/WidgetCoverList$Item;->description:Ljava/lang/String;

    .line 95
    return-void
.end method

.method public constructor <init>(Lorg/json/JSONObject;)V
    .locals 5
    .param p1, "data"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 71
    invoke-direct {p0}, Lcom/vkontakte/android/utils/Serializer$SerializableAdapter;-><init>()V

    .line 72
    const-string/jumbo v3, "action"

    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 73
    .local v0, "action":Lorg/json/JSONObject;
    const-string/jumbo v3, "button_action"

    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    .line 74
    .local v1, "buttonAction":Lorg/json/JSONObject;
    const-string/jumbo v3, "cover"

    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v2

    .line 76
    .local v2, "covers":Lorg/json/JSONArray;
    if-nez v2, :cond_0

    move-object v3, v4

    :goto_0
    iput-object v3, p0, Lcom/vkontakte/android/api/widget/WidgetCoverList$Item;->cover:Lcom/vk/core/common/Image;

    .line 77
    const-string/jumbo v3, "title"

    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/vkontakte/android/api/widget/WidgetCoverList$Item;->title:Ljava/lang/String;

    .line 78
    if-nez v0, :cond_1

    move-object v3, v4

    :goto_1
    iput-object v3, p0, Lcom/vkontakte/android/api/widget/WidgetCoverList$Item;->url:Ljava/lang/String;

    .line 79
    if-nez v0, :cond_2

    move-object v3, v4

    :goto_2
    iput-object v3, p0, Lcom/vkontakte/android/api/widget/WidgetCoverList$Item;->target:Ljava/lang/String;

    .line 80
    const-string/jumbo v3, "button"

    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/vkontakte/android/api/widget/WidgetCoverList$Item;->button:Ljava/lang/String;

    .line 81
    if-nez v1, :cond_3

    move-object v3, v4

    :goto_3
    iput-object v3, p0, Lcom/vkontakte/android/api/widget/WidgetCoverList$Item;->buttonUrl:Ljava/lang/String;

    .line 82
    if-nez v1, :cond_4

    :goto_4
    iput-object v4, p0, Lcom/vkontakte/android/api/widget/WidgetCoverList$Item;->buttonTarget:Ljava/lang/String;

    .line 83
    const-string/jumbo v3, "descr"

    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/vkontakte/android/api/widget/WidgetCoverList$Item;->description:Ljava/lang/String;

    .line 84
    return-void

    .line 76
    :cond_0
    new-instance v3, Lcom/vk/core/common/Image;

    invoke-direct {v3, v2}, Lcom/vk/core/common/Image;-><init>(Lorg/json/JSONArray;)V

    goto :goto_0

    .line 78
    :cond_1
    const-string/jumbo v3, "url"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    goto :goto_1

    .line 79
    :cond_2
    const-string/jumbo v3, "target"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    goto :goto_2

    .line 81
    :cond_3
    const-string/jumbo v3, "url"

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    goto :goto_3

    .line 82
    :cond_4
    const-string/jumbo v3, "target"

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    goto :goto_4
.end method


# virtual methods
.method public getButton()Ljava/lang/String;
    .locals 1

    .prologue
    .line 127
    iget-object v0, p0, Lcom/vkontakte/android/api/widget/WidgetCoverList$Item;->button:Ljava/lang/String;

    return-object v0
.end method

.method public getButtonTarget()Ljava/lang/String;
    .locals 1

    .prologue
    .line 135
    iget-object v0, p0, Lcom/vkontakte/android/api/widget/WidgetCoverList$Item;->buttonTarget:Ljava/lang/String;

    return-object v0
.end method

.method public getButtonUrl()Ljava/lang/String;
    .locals 1

    .prologue
    .line 131
    iget-object v0, p0, Lcom/vkontakte/android/api/widget/WidgetCoverList$Item;->buttonUrl:Ljava/lang/String;

    return-object v0
.end method

.method public getCover(I)Lcom/vk/core/common/ImageSize;
    .locals 1
    .param p1, "width"    # I
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 111
    iget-object v0, p0, Lcom/vkontakte/android/api/widget/WidgetCoverList$Item;->cover:Lcom/vk/core/common/Image;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/api/widget/WidgetCoverList$Item;->cover:Lcom/vk/core/common/Image;

    invoke-virtual {v0, p1}, Lcom/vk/core/common/Image;->getImageByWidth(I)Lcom/vk/core/common/ImageSize;

    move-result-object v0

    goto :goto_0
.end method

.method public getDescription()Ljava/lang/String;
    .locals 1

    .prologue
    .line 139
    iget-object v0, p0, Lcom/vkontakte/android/api/widget/WidgetCoverList$Item;->description:Ljava/lang/String;

    return-object v0
.end method

.method public getTarget()Ljava/lang/String;
    .locals 1

    .prologue
    .line 123
    iget-object v0, p0, Lcom/vkontakte/android/api/widget/WidgetCoverList$Item;->target:Ljava/lang/String;

    return-object v0
.end method

.method public getTitle()Ljava/lang/String;
    .locals 1

    .prologue
    .line 115
    iget-object v0, p0, Lcom/vkontakte/android/api/widget/WidgetCoverList$Item;->title:Ljava/lang/String;

    return-object v0
.end method

.method public getUrl()Ljava/lang/String;
    .locals 1

    .prologue
    .line 119
    iget-object v0, p0, Lcom/vkontakte/android/api/widget/WidgetCoverList$Item;->url:Ljava/lang/String;

    return-object v0
.end method

.method public serializeTo(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 1
    .param p1, "serializer"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 99
    iget-object v0, p0, Lcom/vkontakte/android/api/widget/WidgetCoverList$Item;->cover:Lcom/vk/core/common/Image;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeSerializable(Lcom/vkontakte/android/utils/Serializer$Serializable;)V

    .line 100
    iget-object v0, p0, Lcom/vkontakte/android/api/widget/WidgetCoverList$Item;->title:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 101
    iget-object v0, p0, Lcom/vkontakte/android/api/widget/WidgetCoverList$Item;->url:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 102
    iget-object v0, p0, Lcom/vkontakte/android/api/widget/WidgetCoverList$Item;->target:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 103
    iget-object v0, p0, Lcom/vkontakte/android/api/widget/WidgetCoverList$Item;->button:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 104
    iget-object v0, p0, Lcom/vkontakte/android/api/widget/WidgetCoverList$Item;->buttonUrl:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 105
    iget-object v0, p0, Lcom/vkontakte/android/api/widget/WidgetCoverList$Item;->buttonTarget:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 106
    iget-object v0, p0, Lcom/vkontakte/android/api/widget/WidgetCoverList$Item;->description:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 107
    return-void
.end method
