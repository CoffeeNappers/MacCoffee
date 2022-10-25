.class public Lcom/vkontakte/android/api/widget/WidgetTable;
.super Lcom/vkontakte/android/api/widget/Widget;
.source "WidgetTable.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/api/widget/WidgetTable$Row;,
        Lcom/vkontakte/android/api/widget/WidgetTable$RowItem;,
        Lcom/vkontakte/android/api/widget/WidgetTable$HeadRowItem;
    }
.end annotation


# static fields
.field public static final CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/utils/Serializer$Creator",
            "<",
            "Lcom/vkontakte/android/api/widget/WidgetTable;",
            ">;"
        }
    .end annotation
.end field

.field private static final MAX_COLUMNS:I = 0x6

.field private static final MAX_ROWS:I = 0xa


# instance fields
.field private final body:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/api/widget/WidgetTable$Row;",
            ">;"
        }
    .end annotation
.end field

.field private final head:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/api/widget/WidgetTable$HeadRowItem;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 252
    new-instance v0, Lcom/vkontakte/android/api/widget/WidgetTable$1;

    invoke-direct {v0}, Lcom/vkontakte/android/api/widget/WidgetTable$1;-><init>()V

    sput-object v0, Lcom/vkontakte/android/api/widget/WidgetTable;->CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;

    return-void
.end method

.method public constructor <init>(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 1
    .param p1, "serializer"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 43
    invoke-direct {p0, p1}, Lcom/vkontakte/android/api/widget/Widget;-><init>(Lcom/vkontakte/android/utils/Serializer;)V

    .line 44
    sget-object v0, Lcom/vkontakte/android/api/widget/WidgetTable$HeadRowItem;->CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->createTypedArrayList(Lcom/vkontakte/android/utils/Serializer$Creator;)Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/api/widget/WidgetTable;->head:Ljava/util/List;

    .line 45
    sget-object v0, Lcom/vkontakte/android/api/widget/WidgetTable$Row;->CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->createTypedArrayList(Lcom/vkontakte/android/utils/Serializer$Creator;)Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/api/widget/WidgetTable;->body:Ljava/util/List;

    .line 46
    return-void
.end method

.method public constructor <init>(Lorg/json/JSONObject;)V
    .locals 7
    .param p1, "response"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 26
    invoke-direct {p0, p1}, Lcom/vkontakte/android/api/widget/Widget;-><init>(Lorg/json/JSONObject;)V

    .line 27
    const-string/jumbo v4, "data"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    .line 28
    .local v1, "data":Lorg/json/JSONObject;
    const-string/jumbo v4, "head"

    invoke-virtual {v1, v4}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v2

    .line 29
    .local v2, "head":Lorg/json/JSONArray;
    const-string/jumbo v4, "body"

    invoke-virtual {v1, v4}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    .line 31
    .local v0, "body":Lorg/json/JSONArray;
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    iput-object v4, p0, Lcom/vkontakte/android/api/widget/WidgetTable;->head:Ljava/util/List;

    .line 32
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    if-eqz v2, :cond_0

    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v4

    if-ge v3, v4, :cond_0

    const/4 v4, 0x6

    if-ge v3, v4, :cond_0

    .line 33
    iget-object v4, p0, Lcom/vkontakte/android/api/widget/WidgetTable;->head:Ljava/util/List;

    new-instance v5, Lcom/vkontakte/android/api/widget/WidgetTable$HeadRowItem;

    invoke-virtual {v2, v3}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v6

    invoke-direct {v5, v6}, Lcom/vkontakte/android/api/widget/WidgetTable$HeadRowItem;-><init>(Lorg/json/JSONObject;)V

    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 32
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 36
    :cond_0
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    iput-object v4, p0, Lcom/vkontakte/android/api/widget/WidgetTable;->body:Ljava/util/List;

    .line 37
    const/4 v3, 0x0

    :goto_1
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v4

    if-ge v3, v4, :cond_1

    const/16 v4, 0xa

    if-ge v3, v4, :cond_1

    .line 38
    iget-object v4, p0, Lcom/vkontakte/android/api/widget/WidgetTable;->body:Ljava/util/List;

    new-instance v5, Lcom/vkontakte/android/api/widget/WidgetTable$Row;

    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->getJSONArray(I)Lorg/json/JSONArray;

    move-result-object v6

    invoke-direct {v5, v6}, Lcom/vkontakte/android/api/widget/WidgetTable$Row;-><init>(Lorg/json/JSONArray;)V

    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 37
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 40
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
    .line 101
    new-instance v0, Lcom/vkontakte/android/ui/widget/WidgetTableView;

    invoke-direct {v0, p1}, Lcom/vkontakte/android/ui/widget/WidgetTableView;-><init>(Landroid/content/Context;)V

    return-object v0
.end method

.method public getBody()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/api/widget/WidgetTable$Row;",
            ">;"
        }
    .end annotation

    .prologue
    .line 60
    iget-object v0, p0, Lcom/vkontakte/android/api/widget/WidgetTable;->body:Ljava/util/List;

    return-object v0
.end method

.method public getColumnsCount()I
    .locals 2

    .prologue
    const/4 v0, 0x0

    .line 91
    iget-object v1, p0, Lcom/vkontakte/android/api/widget/WidgetTable;->body:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 94
    :goto_0
    return v0

    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/api/widget/WidgetTable;->body:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/api/widget/WidgetTable$Row;

    invoke-virtual {v0}, Lcom/vkontakte/android/api/widget/WidgetTable$Row;->getItems()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    goto :goto_0
.end method

.method public getHead()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/api/widget/WidgetTable$HeadRowItem;",
            ">;"
        }
    .end annotation

    .prologue
    .line 56
    iget-object v0, p0, Lcom/vkontakte/android/api/widget/WidgetTable;->head:Ljava/util/List;

    return-object v0
.end method

.method public hasHeader()Z
    .locals 3

    .prologue
    .line 64
    iget-object v1, p0, Lcom/vkontakte/android/api/widget/WidgetTable;->head:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/api/widget/WidgetTable$HeadRowItem;

    .line 65
    .local v0, "item":Lcom/vkontakte/android/api/widget/WidgetTable$HeadRowItem;
    invoke-virtual {v0}, Lcom/vkontakte/android/api/widget/WidgetTable$HeadRowItem;->getText()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 66
    const/4 v1, 0x1

    .line 69
    .end local v0    # "item":Lcom/vkontakte/android/api/widget/WidgetTable$HeadRowItem;
    :goto_0
    return v1

    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public hasIcons()Z
    .locals 3

    .prologue
    .line 82
    iget-object v1, p0, Lcom/vkontakte/android/api/widget/WidgetTable;->body:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/api/widget/WidgetTable$Row;

    .line 83
    .local v0, "row":Lcom/vkontakte/android/api/widget/WidgetTable$Row;
    invoke-virtual {v0}, Lcom/vkontakte/android/api/widget/WidgetTable$Row;->hasIcon()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 84
    const/4 v1, 0x1

    .line 87
    .end local v0    # "row":Lcom/vkontakte/android/api/widget/WidgetTable$Row;
    :goto_0
    return v1

    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public hasWeights()Z
    .locals 4

    .prologue
    .line 73
    iget-object v1, p0, Lcom/vkontakte/android/api/widget/WidgetTable;->head:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/api/widget/WidgetTable$HeadRowItem;

    .line 74
    .local v0, "item":Lcom/vkontakte/android/api/widget/WidgetTable$HeadRowItem;
    invoke-static {v0}, Lcom/vkontakte/android/api/widget/WidgetTable$HeadRowItem;->access$000(Lcom/vkontakte/android/api/widget/WidgetTable$HeadRowItem;)F

    move-result v2

    const/4 v3, 0x0

    cmpl-float v2, v2, v3

    if-lez v2, :cond_0

    .line 75
    const/4 v1, 0x1

    .line 78
    .end local v0    # "item":Lcom/vkontakte/android/api/widget/WidgetTable$HeadRowItem;
    :goto_0
    return v1

    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public serializeTo(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 1
    .param p1, "s"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 50
    invoke-super {p0, p1}, Lcom/vkontakte/android/api/widget/Widget;->serializeTo(Lcom/vkontakte/android/utils/Serializer;)V

    .line 51
    iget-object v0, p0, Lcom/vkontakte/android/api/widget/WidgetTable;->head:Ljava/util/List;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeTypedList(Ljava/util/List;)V

    .line 52
    iget-object v0, p0, Lcom/vkontakte/android/api/widget/WidgetTable;->body:Ljava/util/List;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeTypedList(Ljava/util/List;)V

    .line 53
    return-void
.end method
