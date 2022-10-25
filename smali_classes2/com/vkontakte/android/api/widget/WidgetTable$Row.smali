.class public Lcom/vkontakte/android/api/widget/WidgetTable$Row;
.super Lcom/vkontakte/android/utils/Serializer$SerializableAdapter;
.source "WidgetTable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/api/widget/WidgetTable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Row"
.end annotation


# static fields
.field public static final CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/utils/Serializer$Creator",
            "<",
            "Lcom/vkontakte/android/api/widget/WidgetTable$Row;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final items:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/api/widget/WidgetTable$RowItem;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 240
    new-instance v0, Lcom/vkontakte/android/api/widget/WidgetTable$Row$1;

    invoke-direct {v0}, Lcom/vkontakte/android/api/widget/WidgetTable$Row$1;-><init>()V

    sput-object v0, Lcom/vkontakte/android/api/widget/WidgetTable$Row;->CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;

    return-void
.end method

.method public constructor <init>(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 1
    .param p1, "s"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 223
    invoke-direct {p0}, Lcom/vkontakte/android/utils/Serializer$SerializableAdapter;-><init>()V

    .line 224
    sget-object v0, Lcom/vkontakte/android/api/widget/WidgetTable$RowItem;->CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->createTypedArrayList(Lcom/vkontakte/android/utils/Serializer$Creator;)Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/api/widget/WidgetTable$Row;->items:Ljava/util/List;

    .line 225
    return-void
.end method

.method public constructor <init>(Lorg/json/JSONArray;)V
    .locals 4
    .param p1, "row"    # Lorg/json/JSONArray;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 216
    invoke-direct {p0}, Lcom/vkontakte/android/utils/Serializer$SerializableAdapter;-><init>()V

    .line 217
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/vkontakte/android/api/widget/WidgetTable$Row;->items:Ljava/util/List;

    .line 218
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 219
    iget-object v1, p0, Lcom/vkontakte/android/api/widget/WidgetTable$Row;->items:Ljava/util/List;

    new-instance v2, Lcom/vkontakte/android/api/widget/WidgetTable$RowItem;

    invoke-virtual {p1, v0}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/vkontakte/android/api/widget/WidgetTable$RowItem;-><init>(Lorg/json/JSONObject;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 218
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 221
    :cond_0
    return-void
.end method


# virtual methods
.method public getItems()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/api/widget/WidgetTable$RowItem;",
            ">;"
        }
    .end annotation

    .prologue
    .line 228
    iget-object v0, p0, Lcom/vkontakte/android/api/widget/WidgetTable$Row;->items:Ljava/util/List;

    return-object v0
.end method

.method public hasIcon()Z
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 232
    iget-object v0, p0, Lcom/vkontakte/android/api/widget/WidgetTable$Row;->items:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/api/widget/WidgetTable$Row;->items:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/api/widget/WidgetTable$RowItem;

    invoke-virtual {v0}, Lcom/vkontakte/android/api/widget/WidgetTable$RowItem;->hasIcon()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    move v0, v1

    goto :goto_0
.end method

.method public serializeTo(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 1
    .param p1, "s"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 237
    iget-object v0, p0, Lcom/vkontakte/android/api/widget/WidgetTable$Row;->items:Ljava/util/List;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeTypedList(Ljava/util/List;)V

    .line 238
    return-void
.end method
