.class public Lcom/vkontakte/android/api/widget/WidgetMatch;
.super Lcom/vkontakte/android/api/widget/Widget;
.source "WidgetMatch.java"


# static fields
.field public static final CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/utils/Serializer$Creator",
            "<",
            "Lcom/vkontakte/android/api/widget/WidgetMatch;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final match:Lcom/vkontakte/android/api/widget/Match;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 43
    new-instance v0, Lcom/vkontakte/android/api/widget/WidgetMatch$1;

    invoke-direct {v0}, Lcom/vkontakte/android/api/widget/WidgetMatch$1;-><init>()V

    sput-object v0, Lcom/vkontakte/android/api/widget/WidgetMatch;->CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;

    return-void
.end method

.method constructor <init>(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 1
    .param p1, "serializer"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 22
    invoke-direct {p0, p1}, Lcom/vkontakte/android/api/widget/Widget;-><init>(Lcom/vkontakte/android/utils/Serializer;)V

    .line 23
    const-class v0, Lcom/vkontakte/android/api/widget/Match;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->readSerializable(Ljava/lang/ClassLoader;)Lcom/vkontakte/android/utils/Serializer$Serializable;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/api/widget/Match;

    iput-object v0, p0, Lcom/vkontakte/android/api/widget/WidgetMatch;->match:Lcom/vkontakte/android/api/widget/Match;

    .line 24
    return-void
.end method

.method constructor <init>(Lorg/json/JSONObject;)V
    .locals 3
    .param p1, "response"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 16
    invoke-direct {p0, p1}, Lcom/vkontakte/android/api/widget/Widget;-><init>(Lorg/json/JSONObject;)V

    .line 17
    const-string/jumbo v1, "data"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 18
    .local v0, "data":Lorg/json/JSONObject;
    new-instance v1, Lcom/vkontakte/android/api/widget/Match;

    const-string/jumbo v2, "match"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/vkontakte/android/api/widget/Match;-><init>(Lorg/json/JSONObject;)V

    iput-object v1, p0, Lcom/vkontakte/android/api/widget/WidgetMatch;->match:Lcom/vkontakte/android/api/widget/Match;

    .line 19
    return-void
.end method


# virtual methods
.method public createContentView(Landroid/content/Context;)Landroid/view/View;
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 39
    new-instance v0, Lcom/vkontakte/android/ui/widget/WidgetMatchView;

    invoke-direct {v0, p1}, Lcom/vkontakte/android/ui/widget/WidgetMatchView;-><init>(Landroid/content/Context;)V

    return-object v0
.end method

.method public getMatch()Lcom/vkontakte/android/api/widget/Match;
    .locals 1

    .prologue
    .line 33
    iget-object v0, p0, Lcom/vkontakte/android/api/widget/WidgetMatch;->match:Lcom/vkontakte/android/api/widget/Match;

    return-object v0
.end method

.method public serializeTo(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 1
    .param p1, "s"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 28
    invoke-super {p0, p1}, Lcom/vkontakte/android/api/widget/Widget;->serializeTo(Lcom/vkontakte/android/utils/Serializer;)V

    .line 29
    iget-object v0, p0, Lcom/vkontakte/android/api/widget/WidgetMatch;->match:Lcom/vkontakte/android/api/widget/Match;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeSerializable(Lcom/vkontakte/android/utils/Serializer$Serializable;)V

    .line 30
    return-void
.end method
