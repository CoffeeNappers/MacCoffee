.class public final Lcom/vkontakte/android/api/audio/AudioGetHints;
.super Lcom/vkontakte/android/api/VKAPIRequest;
.source "AudioGetHints.java"


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
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "query"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 23
    const-string/jumbo v0, "audio.getHints"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    .line 24
    const-string/jumbo v0, "q"

    invoke-virtual {p0, v0, p1}, Lcom/vkontakte/android/api/audio/AudioGetHints;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 25
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
    .line 29
    sget-object v1, Lcom/vkontakte/android/api/audio/AudioGetHints;->parserRef:Ljava/lang/ref/WeakReference;

    if-eqz v1, :cond_1

    sget-object v1, Lcom/vkontakte/android/api/audio/AudioGetHints;->parserRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/data/Parser;

    move-object v0, v1

    .line 30
    .local v0, "parser":Lcom/vkontakte/android/data/Parser;, "Lcom/vkontakte/android/data/Parser<Ljava/lang/String;>;"
    :goto_0
    if-nez v0, :cond_0

    .line 31
    new-instance v0, Lcom/vkontakte/android/api/audio/AudioGetHints$1;

    .end local v0    # "parser":Lcom/vkontakte/android/data/Parser;, "Lcom/vkontakte/android/data/Parser<Ljava/lang/String;>;"
    invoke-direct {v0, p0}, Lcom/vkontakte/android/api/audio/AudioGetHints$1;-><init>(Lcom/vkontakte/android/api/audio/AudioGetHints;)V

    .line 37
    .restart local v0    # "parser":Lcom/vkontakte/android/data/Parser;, "Lcom/vkontakte/android/data/Parser<Ljava/lang/String;>;"
    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-direct {v1, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v1, Lcom/vkontakte/android/api/audio/AudioGetHints;->parserRef:Ljava/lang/ref/WeakReference;

    .line 39
    :cond_0
    new-instance v1, Lcom/vkontakte/android/data/VKList;

    const-string/jumbo v2, "response"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lcom/vkontakte/android/data/VKList;-><init>(Lorg/json/JSONObject;Lcom/vkontakte/android/data/Parser;)V

    return-object v1

    .line 29
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
    .line 18
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/api/audio/AudioGetHints;->parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/data/VKList;

    move-result-object v0

    return-object v0
.end method
