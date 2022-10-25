.class public abstract Lcom/vkontakte/android/data/Parser;
.super Ljava/lang/Object;
.source "Parser.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 17
    .local p0, "this":Lcom/vkontakte/android/data/Parser;, "Lcom/vkontakte/android/data/Parser<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static parseArray(Lorg/json/JSONObject;Ljava/lang/String;Lcom/vkontakte/android/data/Parser;)Ljava/util/ArrayList;
    .locals 7
    .param p0, "jObject"    # Lorg/json/JSONObject;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "key"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lorg/json/JSONObject;",
            "Ljava/lang/String;",
            "Lcom/vkontakte/android/data/Parser",
            "<TT;>;)",
            "Ljava/util/ArrayList",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 22
    .local p2, "parser":Lcom/vkontakte/android/data/Parser;, "Lcom/vkontakte/android/data/Parser<TT;>;"
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v3

    .line 23
    .local v3, "jArray":Lorg/json/JSONArray;
    if-eqz v3, :cond_1

    .line 24
    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v5

    .line 26
    .local v5, "size":I
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, v5}, Ljava/util/ArrayList;-><init>(I)V

    .line 27
    .local v0, "arrayList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<TT;>;"
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v5, :cond_2

    .line 28
    invoke-virtual {v3, v2}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v4

    .line 29
    .local v4, "jItem":Lorg/json/JSONObject;
    if-eqz v4, :cond_0

    .line 31
    :try_start_0
    invoke-virtual {p2, v4}, Lcom/vkontakte/android/data/Parser;->parse(Lorg/json/JSONObject;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 27
    :cond_0
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 32
    :catch_0
    move-exception v1

    .line 33
    .local v1, "e":Ljava/lang/Exception;
    const/4 v6, 0x0

    new-array v6, v6, [Ljava/lang/Object;

    invoke-static {v1, v6}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto :goto_1

    .line 39
    .end local v0    # "arrayList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<TT;>;"
    .end local v1    # "e":Ljava/lang/Exception;
    .end local v2    # "i":I
    .end local v4    # "jItem":Lorg/json/JSONObject;
    .end local v5    # "size":I
    :cond_1
    const/4 v0, 0x0

    :cond_2
    return-object v0
.end method


# virtual methods
.method public abstract parse(Lorg/json/JSONObject;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONObject;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation
.end method
