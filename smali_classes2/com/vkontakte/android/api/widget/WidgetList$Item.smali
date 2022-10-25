.class public Lcom/vkontakte/android/api/widget/WidgetList$Item;
.super Lcom/vkontakte/android/utils/Serializer$SerializableAdapter;
.source "WidgetList.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/api/widget/WidgetList;
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
            "Lcom/vkontakte/android/api/widget/WidgetList$Item;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final address:Ljava/lang/String;

.field private final button:Ljava/lang/String;

.field private final buttonTarget:Ljava/lang/String;

.field private final buttonUrl:Ljava/lang/String;

.field private final description:Ljava/lang/String;

.field private final icon:Lcom/vk/core/common/Image;

.field private final text:Ljava/lang/String;

.field private final time:Ljava/lang/String;

.field private final title:Ljava/lang/String;

.field private final titleTarget:Ljava/lang/String;

.field private final titleUrl:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 181
    new-instance v0, Lcom/vkontakte/android/api/widget/WidgetList$Item$1;

    invoke-direct {v0}, Lcom/vkontakte/android/api/widget/WidgetList$Item$1;-><init>()V

    sput-object v0, Lcom/vkontakte/android/api/widget/WidgetList$Item;->CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;

    return-void
.end method

.method public constructor <init>(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 1
    .param p1, "serializer"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 98
    invoke-direct {p0}, Lcom/vkontakte/android/utils/Serializer$SerializableAdapter;-><init>()V

    .line 99
    const-class v0, Lcom/vk/core/common/Image;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->readSerializable(Ljava/lang/ClassLoader;)Lcom/vkontakte/android/utils/Serializer$Serializable;

    move-result-object v0

    check-cast v0, Lcom/vk/core/common/Image;

    iput-object v0, p0, Lcom/vkontakte/android/api/widget/WidgetList$Item;->icon:Lcom/vk/core/common/Image;

    .line 100
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/api/widget/WidgetList$Item;->title:Ljava/lang/String;

    .line 101
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/api/widget/WidgetList$Item;->titleUrl:Ljava/lang/String;

    .line 102
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/api/widget/WidgetList$Item;->titleTarget:Ljava/lang/String;

    .line 103
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/api/widget/WidgetList$Item;->button:Ljava/lang/String;

    .line 104
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/api/widget/WidgetList$Item;->buttonUrl:Ljava/lang/String;

    .line 105
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/api/widget/WidgetList$Item;->buttonTarget:Ljava/lang/String;

    .line 106
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/api/widget/WidgetList$Item;->description:Ljava/lang/String;

    .line 107
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/api/widget/WidgetList$Item;->address:Ljava/lang/String;

    .line 108
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/api/widget/WidgetList$Item;->time:Ljava/lang/String;

    .line 109
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/api/widget/WidgetList$Item;->text:Ljava/lang/String;

    .line 110
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

    .line 80
    invoke-direct {p0}, Lcom/vkontakte/android/utils/Serializer$SerializableAdapter;-><init>()V

    .line 81
    const-string/jumbo v3, "title_action"

    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    .line 82
    .local v2, "titleAction":Lorg/json/JSONObject;
    const-string/jumbo v3, "button_action"

    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 83
    .local v0, "buttonAction":Lorg/json/JSONObject;
    const-string/jumbo v3, "icon"

    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    .line 85
    .local v1, "icons":Lorg/json/JSONArray;
    if-nez v1, :cond_0

    move-object v3, v4

    :goto_0
    iput-object v3, p0, Lcom/vkontakte/android/api/widget/WidgetList$Item;->icon:Lcom/vk/core/common/Image;

    .line 86
    const-string/jumbo v3, "title"

    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/vkontakte/android/api/widget/WidgetList$Item;->title:Ljava/lang/String;

    .line 87
    if-nez v2, :cond_1

    move-object v3, v4

    :goto_1
    iput-object v3, p0, Lcom/vkontakte/android/api/widget/WidgetList$Item;->titleUrl:Ljava/lang/String;

    .line 88
    if-nez v2, :cond_2

    move-object v3, v4

    :goto_2
    iput-object v3, p0, Lcom/vkontakte/android/api/widget/WidgetList$Item;->titleTarget:Ljava/lang/String;

    .line 89
    const-string/jumbo v3, "button"

    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/vkontakte/android/api/widget/WidgetList$Item;->button:Ljava/lang/String;

    .line 90
    if-nez v0, :cond_3

    move-object v3, v4

    :goto_3
    iput-object v3, p0, Lcom/vkontakte/android/api/widget/WidgetList$Item;->buttonUrl:Ljava/lang/String;

    .line 91
    if-nez v0, :cond_4

    :goto_4
    iput-object v4, p0, Lcom/vkontakte/android/api/widget/WidgetList$Item;->buttonTarget:Ljava/lang/String;

    .line 92
    const-string/jumbo v3, "descr"

    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/vkontakte/android/api/widget/WidgetList$Item;->description:Ljava/lang/String;

    .line 93
    const-string/jumbo v3, "address"

    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/vkontakte/android/api/widget/WidgetList$Item;->address:Ljava/lang/String;

    .line 94
    const-string/jumbo v3, "time"

    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/vkontakte/android/api/widget/WidgetList$Item;->time:Ljava/lang/String;

    .line 95
    const-string/jumbo v3, "text"

    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/vkontakte/android/api/widget/WidgetList$Item;->text:Ljava/lang/String;

    .line 96
    return-void

    .line 85
    :cond_0
    new-instance v3, Lcom/vk/core/common/Image;

    invoke-direct {v3, v1}, Lcom/vk/core/common/Image;-><init>(Lorg/json/JSONArray;)V

    goto :goto_0

    .line 87
    :cond_1
    const-string/jumbo v3, "url"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    goto :goto_1

    .line 88
    :cond_2
    const-string/jumbo v3, "target"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    goto :goto_2

    .line 90
    :cond_3
    const-string/jumbo v3, "url"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    goto :goto_3

    .line 91
    :cond_4
    const-string/jumbo v3, "target"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    goto :goto_4
.end method


# virtual methods
.method public getAddress()Ljava/lang/String;
    .locals 1

    .prologue
    .line 169
    iget-object v0, p0, Lcom/vkontakte/android/api/widget/WidgetList$Item;->address:Ljava/lang/String;

    return-object v0
.end method

.method public getButton()Ljava/lang/String;
    .locals 1

    .prologue
    .line 153
    iget-object v0, p0, Lcom/vkontakte/android/api/widget/WidgetList$Item;->button:Ljava/lang/String;

    return-object v0
.end method

.method public getButtonTarget()Ljava/lang/String;
    .locals 1

    .prologue
    .line 161
    iget-object v0, p0, Lcom/vkontakte/android/api/widget/WidgetList$Item;->buttonTarget:Ljava/lang/String;

    return-object v0
.end method

.method public getButtonUrl()Ljava/lang/String;
    .locals 1

    .prologue
    .line 157
    iget-object v0, p0, Lcom/vkontakte/android/api/widget/WidgetList$Item;->buttonUrl:Ljava/lang/String;

    return-object v0
.end method

.method public getDescription()Ljava/lang/String;
    .locals 1

    .prologue
    .line 165
    iget-object v0, p0, Lcom/vkontakte/android/api/widget/WidgetList$Item;->description:Ljava/lang/String;

    return-object v0
.end method

.method public getIcon(I)Lcom/vk/core/common/ImageSize;
    .locals 1
    .param p1, "width"    # I
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 137
    iget-object v0, p0, Lcom/vkontakte/android/api/widget/WidgetList$Item;->icon:Lcom/vk/core/common/Image;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/api/widget/WidgetList$Item;->icon:Lcom/vk/core/common/Image;

    invoke-virtual {v0, p1}, Lcom/vk/core/common/Image;->getImageByWidth(I)Lcom/vk/core/common/ImageSize;

    move-result-object v0

    goto :goto_0
.end method

.method public getText()Ljava/lang/String;
    .locals 1

    .prologue
    .line 177
    iget-object v0, p0, Lcom/vkontakte/android/api/widget/WidgetList$Item;->text:Ljava/lang/String;

    return-object v0
.end method

.method public getTime()Ljava/lang/String;
    .locals 1

    .prologue
    .line 173
    iget-object v0, p0, Lcom/vkontakte/android/api/widget/WidgetList$Item;->time:Ljava/lang/String;

    return-object v0
.end method

.method public getTitle()Ljava/lang/String;
    .locals 1

    .prologue
    .line 141
    iget-object v0, p0, Lcom/vkontakte/android/api/widget/WidgetList$Item;->title:Ljava/lang/String;

    return-object v0
.end method

.method public getTitleTarget()Ljava/lang/String;
    .locals 1

    .prologue
    .line 149
    iget-object v0, p0, Lcom/vkontakte/android/api/widget/WidgetList$Item;->titleTarget:Ljava/lang/String;

    return-object v0
.end method

.method public getTitleUrl()Ljava/lang/String;
    .locals 1

    .prologue
    .line 145
    iget-object v0, p0, Lcom/vkontakte/android/api/widget/WidgetList$Item;->titleUrl:Ljava/lang/String;

    return-object v0
.end method

.method public hasIcon()Z
    .locals 1

    .prologue
    .line 128
    iget-object v0, p0, Lcom/vkontakte/android/api/widget/WidgetList$Item;->icon:Lcom/vk/core/common/Image;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/api/widget/WidgetList$Item;->icon:Lcom/vk/core/common/Image;

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

.method public hasText()Z
    .locals 1

    .prologue
    .line 132
    iget-object v0, p0, Lcom/vkontakte/android/api/widget/WidgetList$Item;->text:Ljava/lang/String;

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

.method public serializeTo(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 1
    .param p1, "serializer"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 114
    iget-object v0, p0, Lcom/vkontakte/android/api/widget/WidgetList$Item;->icon:Lcom/vk/core/common/Image;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeSerializable(Lcom/vkontakte/android/utils/Serializer$Serializable;)V

    .line 115
    iget-object v0, p0, Lcom/vkontakte/android/api/widget/WidgetList$Item;->title:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 116
    iget-object v0, p0, Lcom/vkontakte/android/api/widget/WidgetList$Item;->titleUrl:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 117
    iget-object v0, p0, Lcom/vkontakte/android/api/widget/WidgetList$Item;->titleTarget:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 118
    iget-object v0, p0, Lcom/vkontakte/android/api/widget/WidgetList$Item;->button:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 119
    iget-object v0, p0, Lcom/vkontakte/android/api/widget/WidgetList$Item;->buttonUrl:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 120
    iget-object v0, p0, Lcom/vkontakte/android/api/widget/WidgetList$Item;->buttonTarget:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 121
    iget-object v0, p0, Lcom/vkontakte/android/api/widget/WidgetList$Item;->description:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 122
    iget-object v0, p0, Lcom/vkontakte/android/api/widget/WidgetList$Item;->address:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 123
    iget-object v0, p0, Lcom/vkontakte/android/api/widget/WidgetList$Item;->time:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 124
    iget-object v0, p0, Lcom/vkontakte/android/api/widget/WidgetList$Item;->text:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 125
    return-void
.end method
