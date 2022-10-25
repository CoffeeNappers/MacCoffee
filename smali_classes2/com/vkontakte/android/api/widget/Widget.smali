.class public abstract Lcom/vkontakte/android/api/widget/Widget;
.super Lcom/vkontakte/android/utils/Serializer$SerializableAdapter;
.source "Widget.java"


# static fields
.field private static final TYPE_COMPACT_LIST:I = 0x5

.field private static final TYPE_COVER_LIST:I = 0x6

.field private static final TYPE_LIST:I = 0x2

.field private static final TYPE_MATCH:I = 0x7

.field private static final TYPE_MATCHES:I = 0x8

.field private static final TYPE_TABLE:I = 0x3

.field private static final TYPE_TEXT:I = 0x1

.field private static final TYPE_TILES:I = 0x4


# instance fields
.field private final more:Ljava/lang/String;

.field private final moreUrl:Ljava/lang/String;

.field private final title:Ljava/lang/String;

.field private final titleCounter:Ljava/lang/Integer;

.field private final titleUrl:Ljava/lang/String;

.field private final type:I


# direct methods
.method constructor <init>(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 2
    .param p1, "serializer"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 71
    invoke-direct {p0}, Lcom/vkontakte/android/utils/Serializer$SerializableAdapter;-><init>()V

    .line 72
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v1

    iput v1, p0, Lcom/vkontakte/android/api/widget/Widget;->type:I

    .line 73
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/api/widget/Widget;->title:Ljava/lang/String;

    .line 74
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/api/widget/Widget;->titleUrl:Ljava/lang/String;

    .line 75
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/api/widget/Widget;->more:Ljava/lang/String;

    .line 76
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/api/widget/Widget;->moreUrl:Ljava/lang/String;

    .line 77
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    .line 78
    .local v0, "value":Ljava/lang/String;
    if-nez v0, :cond_0

    const/4 v1, 0x0

    :goto_0
    iput-object v1, p0, Lcom/vkontakte/android/api/widget/Widget;->titleCounter:Ljava/lang/Integer;

    .line 79
    return-void

    .line 78
    :cond_0
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v1

    goto :goto_0
.end method

.method constructor <init>(Lorg/json/JSONObject;)V
    .locals 5
    .param p1, "response"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 59
    invoke-direct {p0}, Lcom/vkontakte/android/utils/Serializer$SerializableAdapter;-><init>()V

    .line 60
    const-string/jumbo v3, "data"

    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 61
    .local v0, "data":Lorg/json/JSONObject;
    const-string/jumbo v3, "more_action"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    .line 62
    .local v1, "moreAction":Lorg/json/JSONObject;
    const-string/jumbo v3, "title_action"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    .line 63
    .local v2, "titleAction":Lorg/json/JSONObject;
    const-string/jumbo v3, "title_counter"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    const-string/jumbo v3, "title_counter"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    :goto_0
    iput-object v3, p0, Lcom/vkontakte/android/api/widget/Widget;->titleCounter:Ljava/lang/Integer;

    .line 64
    if-nez v1, :cond_1

    move-object v3, v4

    :goto_1
    iput-object v3, p0, Lcom/vkontakte/android/api/widget/Widget;->moreUrl:Ljava/lang/String;

    .line 65
    if-nez v2, :cond_2

    :goto_2
    iput-object v4, p0, Lcom/vkontakte/android/api/widget/Widget;->titleUrl:Ljava/lang/String;

    .line 66
    const-string/jumbo v3, "title"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/vkontakte/android/api/widget/Widget;->title:Ljava/lang/String;

    .line 67
    const-string/jumbo v3, "more"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/vkontakte/android/api/widget/Widget;->more:Ljava/lang/String;

    .line 68
    const-string/jumbo v3, "type"

    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    iput v3, p0, Lcom/vkontakte/android/api/widget/Widget;->type:I

    .line 69
    return-void

    :cond_0
    move-object v3, v4

    .line 63
    goto :goto_0

    .line 64
    :cond_1
    const-string/jumbo v3, "url"

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    goto :goto_1

    .line 65
    :cond_2
    const-string/jumbo v3, "url"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    goto :goto_2
.end method

.method public static create(Lorg/json/JSONObject;)Lcom/vkontakte/android/api/widget/Widget;
    .locals 10
    .param p0, "response"    # Lorg/json/JSONObject;

    .prologue
    const/4 v3, 0x0

    const/4 v9, 0x2

    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 32
    :try_start_0
    const-string/jumbo v2, "type"

    invoke-virtual {p0, v2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v1

    .line 33
    .local v1, "type":I
    packed-switch v1, :pswitch_data_0

    .line 50
    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v4, 0x0

    const-string/jumbo v5, "Widget"

    aput-object v5, v2, v4

    const/4 v4, 0x1

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "Widget type is not supported: type = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v2, v4

    invoke-static {v2}, Lcom/vkontakte/android/utils/L;->e([Ljava/lang/Object;)V

    move-object v2, v3

    .line 55
    .end local v1    # "type":I
    :goto_0
    return-object v2

    .line 35
    .restart local v1    # "type":I
    :pswitch_0
    new-instance v2, Lcom/vkontakte/android/api/widget/WidgetText;

    invoke-direct {v2, p0}, Lcom/vkontakte/android/api/widget/WidgetText;-><init>(Lorg/json/JSONObject;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 53
    .end local v1    # "type":I
    :catch_0
    move-exception v0

    .line 54
    .local v0, "e":Lorg/json/JSONException;
    new-array v2, v9, [Ljava/lang/Object;

    const-string/jumbo v4, "Widget"

    aput-object v4, v2, v7

    aput-object v0, v2, v8

    invoke-static {v2}, Lcom/vkontakte/android/utils/L;->e([Ljava/lang/Object;)V

    move-object v2, v3

    .line 55
    goto :goto_0

    .line 38
    .end local v0    # "e":Lorg/json/JSONException;
    .restart local v1    # "type":I
    :pswitch_1
    :try_start_1
    new-instance v2, Lcom/vkontakte/android/api/widget/WidgetList;

    invoke-direct {v2, p0}, Lcom/vkontakte/android/api/widget/WidgetList;-><init>(Lorg/json/JSONObject;)V

    goto :goto_0

    .line 40
    :pswitch_2
    new-instance v2, Lcom/vkontakte/android/api/widget/WidgetTable;

    invoke-direct {v2, p0}, Lcom/vkontakte/android/api/widget/WidgetTable;-><init>(Lorg/json/JSONObject;)V

    goto :goto_0

    .line 42
    :pswitch_3
    new-instance v2, Lcom/vkontakte/android/api/widget/WidgetTiles;

    invoke-direct {v2, p0}, Lcom/vkontakte/android/api/widget/WidgetTiles;-><init>(Lorg/json/JSONObject;)V

    goto :goto_0

    .line 44
    :pswitch_4
    new-instance v2, Lcom/vkontakte/android/api/widget/WidgetCoverList;

    invoke-direct {v2, p0}, Lcom/vkontakte/android/api/widget/WidgetCoverList;-><init>(Lorg/json/JSONObject;)V

    goto :goto_0

    .line 46
    :pswitch_5
    new-instance v2, Lcom/vkontakte/android/api/widget/WidgetMatch;

    invoke-direct {v2, p0}, Lcom/vkontakte/android/api/widget/WidgetMatch;-><init>(Lorg/json/JSONObject;)V

    goto :goto_0

    .line 48
    :pswitch_6
    new-instance v2, Lcom/vkontakte/android/api/widget/WidgetMatches;

    invoke-direct {v2, p0}, Lcom/vkontakte/android/api/widget/WidgetMatches;-><init>(Lorg/json/JSONObject;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 33
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_1
        :pswitch_4
        :pswitch_5
        :pswitch_6
    .end packed-switch
.end method


# virtual methods
.method public abstract createContentView(Landroid/content/Context;)Landroid/view/View;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end method

.method public getMore()Ljava/lang/String;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 101
    iget-object v0, p0, Lcom/vkontakte/android/api/widget/Widget;->more:Ljava/lang/String;

    return-object v0
.end method

.method public getMoreUrl()Ljava/lang/String;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 106
    iget-object v0, p0, Lcom/vkontakte/android/api/widget/Widget;->moreUrl:Ljava/lang/String;

    return-object v0
.end method

.method public getTitle()Ljava/lang/String;
    .locals 1

    .prologue
    .line 86
    iget-object v0, p0, Lcom/vkontakte/android/api/widget/Widget;->title:Ljava/lang/String;

    return-object v0
.end method

.method public getTitleCounter()Ljava/lang/Integer;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 91
    iget-object v0, p0, Lcom/vkontakte/android/api/widget/Widget;->titleCounter:Ljava/lang/Integer;

    return-object v0
.end method

.method public getTitleUrl()Ljava/lang/String;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 96
    iget-object v0, p0, Lcom/vkontakte/android/api/widget/Widget;->titleUrl:Ljava/lang/String;

    return-object v0
.end method

.method public getType()I
    .locals 1

    .prologue
    .line 82
    iget v0, p0, Lcom/vkontakte/android/api/widget/Widget;->type:I

    return v0
.end method

.method public serializeTo(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 1
    .param p1, "s"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 114
    iget v0, p0, Lcom/vkontakte/android/api/widget/Widget;->type:I

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 115
    iget-object v0, p0, Lcom/vkontakte/android/api/widget/Widget;->title:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 116
    iget-object v0, p0, Lcom/vkontakte/android/api/widget/Widget;->titleUrl:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 117
    iget-object v0, p0, Lcom/vkontakte/android/api/widget/Widget;->more:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 118
    iget-object v0, p0, Lcom/vkontakte/android/api/widget/Widget;->moreUrl:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 119
    iget-object v0, p0, Lcom/vkontakte/android/api/widget/Widget;->titleCounter:Ljava/lang/Integer;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 120
    return-void

    .line 119
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/api/widget/Widget;->titleCounter:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method
