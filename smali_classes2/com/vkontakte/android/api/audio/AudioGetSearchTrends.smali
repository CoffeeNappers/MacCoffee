.class public final Lcom/vkontakte/android/api/audio/AudioGetSearchTrends;
.super Lcom/vkontakte/android/api/VKAPIRequest;
.source "AudioGetSearchTrends.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/VKAPIRequest",
        "<",
        "Lcom/vkontakte/android/data/VKList",
        "<",
        "Ljava/lang/String;",
        ">;>;"
    }
.end annotation


# static fields
.field private static parserRef:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/vkontakte/android/data/Parser",
            "<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(I)V
    .locals 1
    .param p1, "count"    # I

    .prologue
    .line 21
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/vkontakte/android/api/audio/AudioGetSearchTrends;-><init>(II)V

    .line 22
    return-void
.end method

.method public constructor <init>(II)V
    .locals 2
    .param p1, "count"    # I
    .param p2, "offset"    # I

    .prologue
    .line 25
    const-string/jumbo v0, "audio.getSearchTrends"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    .line 26
    const-string/jumbo v0, "count"

    invoke-virtual {p0, v0, p1}, Lcom/vkontakte/android/api/audio/AudioGetSearchTrends;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 27
    const-string/jumbo v0, "offset"

    invoke-virtual {p0, v0, p2}, Lcom/vkontakte/android/api/audio/AudioGetSearchTrends;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 28
    const-string/jumbo v0, "need_queries"

    const-string/jumbo v1, "1"

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/audio/AudioGetSearchTrends;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 29
    return-void
.end method


# virtual methods
.method public parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/data/VKList;
    .locals 3
    .param p1, "r"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONObject;",
            ")",
            "Lcom/vkontakte/android/data/VKList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 33
    sget-object v1, Lcom/vkontakte/android/api/audio/AudioGetSearchTrends;->parserRef:Ljava/lang/ref/WeakReference;

    if-eqz v1, :cond_1

    sget-object v1, Lcom/vkontakte/android/api/audio/AudioGetSearchTrends;->parserRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/data/Parser;

    move-object v0, v1

    .line 34
    .local v0, "parser":Lcom/vkontakte/android/data/Parser;, "Lcom/vkontakte/android/data/Parser<Ljava/lang/String;>;"
    :goto_0
    if-nez v0, :cond_0

    .line 35
    new-instance v0, Lcom/vkontakte/android/api/audio/AudioGetSearchTrends$1;

    .end local v0    # "parser":Lcom/vkontakte/android/data/Parser;, "Lcom/vkontakte/android/data/Parser<Ljava/lang/String;>;"
    invoke-direct {v0, p0}, Lcom/vkontakte/android/api/audio/AudioGetSearchTrends$1;-><init>(Lcom/vkontakte/android/api/audio/AudioGetSearchTrends;)V

    .line 41
    .restart local v0    # "parser":Lcom/vkontakte/android/data/Parser;, "Lcom/vkontakte/android/data/Parser<Ljava/lang/String;>;"
    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-direct {v1, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v1, Lcom/vkontakte/android/api/audio/AudioGetSearchTrends;->parserRef:Ljava/lang/ref/WeakReference;

    .line 43
    :cond_0
    new-instance v1, Lcom/vkontakte/android/data/VKList;

    const-string/jumbo v2, "response"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lcom/vkontakte/android/data/VKList;-><init>(Lorg/json/JSONObject;Lcom/vkontakte/android/data/Parser;)V

    return-object v1

    .line 33
    .end local v0    # "parser":Lcom/vkontakte/android/data/Parser;, "Lcom/vkontakte/android/data/Parser<Ljava/lang/String;>;"
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public bridge synthetic parse(Lorg/json/JSONObject;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 16
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/api/audio/AudioGetSearchTrends;->parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/data/VKList;

    move-result-object v0

    return-object v0
.end method
