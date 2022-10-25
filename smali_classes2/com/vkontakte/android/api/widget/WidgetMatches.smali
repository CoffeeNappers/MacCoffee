.class public Lcom/vkontakte/android/api/widget/WidgetMatches;
.super Lcom/vkontakte/android/api/widget/Widget;
.source "WidgetMatches.java"


# static fields
.field public static final CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/utils/Serializer$Creator",
            "<",
            "Lcom/vkontakte/android/api/widget/WidgetMatches;",
            ">;"
        }
    .end annotation
.end field

.field private static final MAX_ITEMS_COUNT:I = 0x5


# instance fields
.field private final matches:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/api/widget/Match;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 56
    new-instance v0, Lcom/vkontakte/android/api/widget/WidgetMatches$1;

    invoke-direct {v0}, Lcom/vkontakte/android/api/widget/WidgetMatches$1;-><init>()V

    sput-object v0, Lcom/vkontakte/android/api/widget/WidgetMatches;->CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;

    return-void
.end method

.method public constructor <init>(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 1
    .param p1, "serializer"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 35
    invoke-direct {p0, p1}, Lcom/vkontakte/android/api/widget/Widget;-><init>(Lcom/vkontakte/android/utils/Serializer;)V

    .line 36
    sget-object v0, Lcom/vkontakte/android/api/widget/Match;->CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->createTypedArrayList(Lcom/vkontakte/android/utils/Serializer$Creator;)Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/api/widget/WidgetMatches;->matches:Ljava/util/List;

    .line 37
    return-void
.end method

.method constructor <init>(Lorg/json/JSONObject;)V
    .locals 7
    .param p1, "response"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x5

    .line 22
    invoke-direct {p0, p1}, Lcom/vkontakte/android/api/widget/Widget;-><init>(Lorg/json/JSONObject;)V

    .line 23
    const-string/jumbo v3, "data"

    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 24
    .local v0, "data":Lorg/json/JSONObject;
    const-string/jumbo v3, "matches"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v2

    .line 25
    .local v2, "matches":Lorg/json/JSONArray;
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iput-object v3, p0, Lcom/vkontakte/android/api/widget/WidgetMatches;->matches:Ljava/util/List;

    .line 26
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-ge v1, v3, :cond_0

    if-ge v1, v6, :cond_0

    .line 27
    iget-object v3, p0, Lcom/vkontakte/android/api/widget/WidgetMatches;->matches:Ljava/util/List;

    new-instance v4, Lcom/vkontakte/android/api/widget/Match;

    invoke-virtual {v2, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v5

    invoke-direct {v4, v5}, Lcom/vkontakte/android/api/widget/Match;-><init>(Lorg/json/JSONObject;)V

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 26
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 29
    :cond_0
    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-le v3, v6, :cond_1

    .line 30
    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    const-string/jumbo v5, "WidgetMatches"

    aput-object v5, v3, v4

    const/4 v4, 0x1

    const-string/jumbo v5, "Widget has more matches than expected"

    aput-object v5, v3, v4

    invoke-static {v3}, Lcom/vkontakte/android/utils/L;->w([Ljava/lang/Object;)V

    .line 32
    :cond_1
    return-void
.end method


# virtual methods
.method public createContentView(Landroid/content/Context;)Landroid/view/View;
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 52
    new-instance v0, Lcom/vkontakte/android/ui/widget/WidgetMatchesView;

    invoke-direct {v0, p1}, Lcom/vkontakte/android/ui/widget/WidgetMatchesView;-><init>(Landroid/content/Context;)V

    return-object v0
.end method

.method public getMatches()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/api/widget/Match;",
            ">;"
        }
    .end annotation

    .prologue
    .line 46
    iget-object v0, p0, Lcom/vkontakte/android/api/widget/WidgetMatches;->matches:Ljava/util/List;

    return-object v0
.end method

.method public serializeTo(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 1
    .param p1, "s"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 41
    invoke-super {p0, p1}, Lcom/vkontakte/android/api/widget/Widget;->serializeTo(Lcom/vkontakte/android/utils/Serializer;)V

    .line 42
    iget-object v0, p0, Lcom/vkontakte/android/api/widget/WidgetMatches;->matches:Ljava/util/List;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeTypedList(Ljava/util/List;)V

    .line 43
    return-void
.end method
