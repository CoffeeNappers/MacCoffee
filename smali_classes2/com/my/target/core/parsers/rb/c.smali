.class public Lcom/my/target/core/parsers/rb/c;
.super Ljava/lang/Object;
.source "RBJSONParser.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static a(Lorg/json/JSONObject;Lcom/my/target/core/models/c;Ljava/lang/String;Ljava/util/ArrayList;Landroid/content/Context;Lcom/my/target/core/models/d;)V
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONObject;",
            "Lcom/my/target/core/models/c;",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Landroid/content/Context;",
            "Lcom/my/target/core/models/d;",
            ")V"
        }
    .end annotation

    .prologue
    .line 27
    .line 1093
    const-string/jumbo v0, "html_wrapper"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1095
    const-string/jumbo v0, "html_wrapper"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/my/target/core/models/c;->b(Ljava/lang/String;)V

    .line 1096
    const-string/jumbo v0, "html_wrapper"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->remove(Ljava/lang/String;)Ljava/lang/Object;

    .line 29
    :cond_0
    invoke-virtual {p1, p0}, Lcom/my/target/core/models/c;->a(Lorg/json/JSONObject;)V

    .line 31
    invoke-virtual {p0}, Lorg/json/JSONObject;->names()Lorg/json/JSONArray;

    move-result-object v8

    .line 32
    if-eqz v8, :cond_6

    .line 34
    invoke-virtual {v8}, Lorg/json/JSONArray;->length()I

    move-result v9

    .line 37
    new-instance v4, Lcom/my/target/core/parsers/a$a;

    invoke-direct {v4, p4}, Lcom/my/target/core/parsers/a$a;-><init>(Landroid/content/Context;)V

    .line 40
    invoke-virtual {p1}, Lcom/my/target/core/models/c;->b()Ljava/lang/String;

    move-result-object v0

    iput-object v0, v4, Lcom/my/target/core/parsers/a$a;->b:Ljava/lang/String;

    .line 41
    const-string/jumbo v0, "Parsing"

    iput-object v0, v4, Lcom/my/target/core/parsers/a$a;->d:Ljava/lang/String;

    .line 42
    const-class v0, Lcom/my/target/core/parsers/rb/c;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, v4, Lcom/my/target/core/parsers/a$a;->c:Ljava/lang/String;

    .line 43
    const-string/jumbo v0, "root"

    iput-object v0, v4, Lcom/my/target/core/parsers/a$a;->e:Ljava/lang/String;

    .line 45
    const/4 v0, 0x0

    move v7, v0

    :goto_0
    if-ge v7, v9, :cond_6

    .line 48
    const-string/jumbo v0, "root"

    invoke-static {v7, v8, v0, v4}, Lcom/my/target/core/parsers/rb/a;->b(ILorg/json/JSONArray;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;)Ljava/lang/String;

    move-result-object v0

    .line 49
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_4

    .line 50
    invoke-static {v0}, Lcom/my/target/core/enums/b;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_4

    .line 52
    const/4 v1, 0x0

    .line 53
    if-eqz p2, :cond_2

    .line 56
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 57
    const-string/jumbo v2, "appwall"

    invoke-virtual {p2, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    const-string/jumbo v2, "showcaseApps"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    :cond_1
    const-string/jumbo v2, "showcaseGames"

    .line 58
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    const-string/jumbo v2, "showcase"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 59
    :cond_2
    const/4 v1, 0x1

    .line 61
    :cond_3
    if-eqz v1, :cond_7

    move-object v1, p0

    move-object v2, p1

    move-object v3, p3

    move-object v5, p5

    move-object v6, p2

    .line 64
    invoke-static/range {v0 .. v6}, Lcom/my/target/core/parsers/rb/d;->a(Ljava/lang/String;Lorg/json/JSONObject;Lcom/my/target/core/models/c;Ljava/util/ArrayList;Lcom/my/target/core/parsers/a$a;Lcom/my/target/core/models/d;Ljava/lang/String;)Lcom/my/target/core/models/sections/i;

    move-result-object v1

    .line 73
    if-eqz v1, :cond_5

    .line 75
    invoke-virtual {p1, v1}, Lcom/my/target/core/models/c;->a(Lcom/my/target/core/models/sections/i;)Z

    .line 45
    :cond_4
    add-int/lit8 v0, v7, 0x1

    move v7, v0

    goto :goto_0

    .line 78
    :cond_5
    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->remove(Ljava/lang/String;)Ljava/lang/Object;

    .line 89
    :cond_6
    :goto_1
    return-void

    .line 83
    :cond_7
    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->remove(Ljava/lang/String;)Ljava/lang/Object;

    goto :goto_1
.end method
