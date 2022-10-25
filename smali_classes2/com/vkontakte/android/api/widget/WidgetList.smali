.class public Lcom/vkontakte/android/api/widget/WidgetList;
.super Lcom/vkontakte/android/api/widget/Widget;
.source "WidgetList.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/api/widget/WidgetList$Item;
    }
.end annotation


# static fields
.field public static final CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/utils/Serializer$Creator",
            "<",
            "Lcom/vkontakte/android/api/widget/WidgetList;",
            ">;"
        }
    .end annotation
.end field

.field private static final MAX_ITEMS_COUNT_WITHOUT_TEXT:I = 0x6

.field private static final MAX_ITEMS_COUNT_WITH_TEXT:I = 0x3


# instance fields
.field private final items:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/api/widget/WidgetList$Item;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 193
    new-instance v0, Lcom/vkontakte/android/api/widget/WidgetList$1;

    invoke-direct {v0}, Lcom/vkontakte/android/api/widget/WidgetList$1;-><init>()V

    sput-object v0, Lcom/vkontakte/android/api/widget/WidgetList;->CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;

    return-void
.end method

.method public constructor <init>(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 1
    .param p1, "serializer"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 46
    invoke-direct {p0, p1}, Lcom/vkontakte/android/api/widget/Widget;-><init>(Lcom/vkontakte/android/utils/Serializer;)V

    .line 47
    sget-object v0, Lcom/vkontakte/android/api/widget/WidgetList$Item;->CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->createTypedArrayList(Lcom/vkontakte/android/utils/Serializer$Creator;)Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/api/widget/WidgetList;->items:Ljava/util/List;

    .line 48
    return-void
.end method

.method public constructor <init>(Lorg/json/JSONObject;)V
    .locals 8
    .param p1, "response"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 28
    invoke-direct {p0, p1}, Lcom/vkontakte/android/api/widget/Widget;-><init>(Lorg/json/JSONObject;)V

    .line 29
    const-string/jumbo v5, "data"

    invoke-virtual {p1, v5}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 30
    .local v0, "data":Lorg/json/JSONObject;
    const-string/jumbo v5, "rows"

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v4

    .line 31
    .local v4, "rows":Lorg/json/JSONArray;
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    iput-object v5, p0, Lcom/vkontakte/android/api/widget/WidgetList;->items:Ljava/util/List;

    .line 32
    const/4 v3, 0x6

    .line 33
    .local v3, "maxSize":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v5

    if-ge v1, v5, :cond_1

    if-ge v1, v3, :cond_1

    .line 34
    new-instance v2, Lcom/vkontakte/android/api/widget/WidgetList$Item;

    invoke-virtual {v4, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v5

    invoke-direct {v2, v5}, Lcom/vkontakte/android/api/widget/WidgetList$Item;-><init>(Lorg/json/JSONObject;)V

    .line 35
    .local v2, "item":Lcom/vkontakte/android/api/widget/WidgetList$Item;
    invoke-virtual {v2}, Lcom/vkontakte/android/api/widget/WidgetList$Item;->hasText()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 36
    const/4 v3, 0x3

    .line 38
    :cond_0
    iget-object v5, p0, Lcom/vkontakte/android/api/widget/WidgetList;->items:Ljava/util/List;

    invoke-interface {v5, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 33
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 40
    .end local v2    # "item":Lcom/vkontakte/android/api/widget/WidgetList$Item;
    :cond_1
    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v5

    if-le v5, v3, :cond_2

    .line 41
    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    const-string/jumbo v7, "WidgetList"

    aput-object v7, v5, v6

    const/4 v6, 0x1

    const-string/jumbo v7, "Widget has more rows than expected"

    aput-object v7, v5, v6

    invoke-static {v5}, Lcom/vkontakte/android/utils/L;->w([Ljava/lang/Object;)V

    .line 43
    :cond_2
    return-void
.end method


# virtual methods
.method public createContentView(Landroid/content/Context;)Landroid/view/View;
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 59
    new-instance v0, Lcom/vkontakte/android/ui/widget/WidgetListView;

    invoke-direct {v0, p1}, Lcom/vkontakte/android/ui/widget/WidgetListView;-><init>(Landroid/content/Context;)V

    return-object v0
.end method

.method public getItems()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/api/widget/WidgetList$Item;",
            ">;"
        }
    .end annotation

    .prologue
    .line 63
    iget-object v0, p0, Lcom/vkontakte/android/api/widget/WidgetList;->items:Ljava/util/List;

    return-object v0
.end method

.method public serializeTo(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 1
    .param p1, "serializer"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 52
    invoke-super {p0, p1}, Lcom/vkontakte/android/api/widget/Widget;->serializeTo(Lcom/vkontakte/android/utils/Serializer;)V

    .line 53
    iget-object v0, p0, Lcom/vkontakte/android/api/widget/WidgetList;->items:Ljava/util/List;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeTypedList(Ljava/util/List;)V

    .line 54
    return-void
.end method
