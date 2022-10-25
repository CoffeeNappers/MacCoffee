.class public Lcom/vkontakte/android/api/widget/WidgetTable$HeadRowItem;
.super Lcom/vkontakte/android/utils/Serializer$SerializableAdapter;
.source "WidgetTable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/api/widget/WidgetTable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "HeadRowItem"
.end annotation


# static fields
.field public static final ALIGN_CENTER:Ljava/lang/String; = "center"

.field public static final ALIGN_LEFT:Ljava/lang/String; = "left"

.field public static final ALIGN_RIGHT:Ljava/lang/String; = "right"

.field public static final CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/utils/Serializer$Creator",
            "<",
            "Lcom/vkontakte/android/api/widget/WidgetTable$HeadRowItem;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final align:Ljava/lang/String;

.field private final text:Ljava/lang/String;

.field private final weight:F


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 145
    new-instance v0, Lcom/vkontakte/android/api/widget/WidgetTable$HeadRowItem$1;

    invoke-direct {v0}, Lcom/vkontakte/android/api/widget/WidgetTable$HeadRowItem$1;-><init>()V

    sput-object v0, Lcom/vkontakte/android/api/widget/WidgetTable$HeadRowItem;->CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;

    return-void
.end method

.method public constructor <init>(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 1
    .param p1, "s"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 120
    invoke-direct {p0}, Lcom/vkontakte/android/utils/Serializer$SerializableAdapter;-><init>()V

    .line 121
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/api/widget/WidgetTable$HeadRowItem;->text:Ljava/lang/String;

    .line 122
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/api/widget/WidgetTable$HeadRowItem;->align:Ljava/lang/String;

    .line 123
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readFloat()F

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/api/widget/WidgetTable$HeadRowItem;->weight:F

    .line 124
    return-void
.end method

.method public constructor <init>(Lorg/json/JSONObject;)V
    .locals 4
    .param p1, "data"    # Lorg/json/JSONObject;

    .prologue
    .line 114
    invoke-direct {p0}, Lcom/vkontakte/android/utils/Serializer$SerializableAdapter;-><init>()V

    .line 115
    const-string/jumbo v0, "text"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/api/widget/WidgetTable$HeadRowItem;->text:Ljava/lang/String;

    .line 116
    const-string/jumbo v0, "align"

    const-string/jumbo v1, "left"

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/api/widget/WidgetTable$HeadRowItem;->align:Ljava/lang/String;

    .line 117
    const-string/jumbo v0, "weight"

    const-wide/16 v2, 0x0

    invoke-virtual {p1, v0, v2, v3}, Lorg/json/JSONObject;->optDouble(Ljava/lang/String;D)D

    move-result-wide v0

    double-to-float v0, v0

    iput v0, p0, Lcom/vkontakte/android/api/widget/WidgetTable$HeadRowItem;->weight:F

    .line 118
    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/api/widget/WidgetTable$HeadRowItem;)F
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/api/widget/WidgetTable$HeadRowItem;

    .prologue
    .line 105
    iget v0, p0, Lcom/vkontakte/android/api/widget/WidgetTable$HeadRowItem;->weight:F

    return v0
.end method


# virtual methods
.method public getAlign()Ljava/lang/String;
    .locals 1

    .prologue
    .line 131
    iget-object v0, p0, Lcom/vkontakte/android/api/widget/WidgetTable$HeadRowItem;->align:Ljava/lang/String;

    return-object v0
.end method

.method public getText()Ljava/lang/String;
    .locals 1

    .prologue
    .line 127
    iget-object v0, p0, Lcom/vkontakte/android/api/widget/WidgetTable$HeadRowItem;->text:Ljava/lang/String;

    return-object v0
.end method

.method public getWeight()F
    .locals 1

    .prologue
    .line 135
    iget v0, p0, Lcom/vkontakte/android/api/widget/WidgetTable$HeadRowItem;->weight:F

    return v0
.end method

.method public serializeTo(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 1
    .param p1, "s"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 140
    iget-object v0, p0, Lcom/vkontakte/android/api/widget/WidgetTable$HeadRowItem;->text:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 141
    iget-object v0, p0, Lcom/vkontakte/android/api/widget/WidgetTable$HeadRowItem;->align:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 142
    iget v0, p0, Lcom/vkontakte/android/api/widget/WidgetTable$HeadRowItem;->weight:F

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeFloat(F)V

    .line 143
    return-void
.end method
