.class Lcom/vkontakte/android/api/audio/AudioGetSearchTrends$1;
.super Lcom/vkontakte/android/data/Parser;
.source "AudioGetSearchTrends.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/api/audio/AudioGetSearchTrends;->parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/data/VKList;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/data/Parser",
        "<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/api/audio/AudioGetSearchTrends;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/api/audio/AudioGetSearchTrends;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/api/audio/AudioGetSearchTrends;

    .prologue
    .line 35
    iput-object p1, p0, Lcom/vkontakte/android/api/audio/AudioGetSearchTrends$1;->this$0:Lcom/vkontakte/android/api/audio/AudioGetSearchTrends;

    invoke-direct {p0}, Lcom/vkontakte/android/data/Parser;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic parse(Lorg/json/JSONObject;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 35
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/api/audio/AudioGetSearchTrends$1;->parse(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public parse(Lorg/json/JSONObject;)Ljava/lang/String;
    .locals 1
    .param p1, "o"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 38
    const-string/jumbo v0, "name"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
