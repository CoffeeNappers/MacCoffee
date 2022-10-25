.class public final Lcom/my/target/core/parsers/rb/f;
.super Ljava/lang/Object;
.source "RBStatsParser.java"


# direct methods
.method static a(Lorg/json/JSONObject;Lcom/my/target/core/parsers/a$a;)Ljava/util/ArrayList;
    .locals 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONObject;",
            "Lcom/my/target/core/parsers/a$a;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/my/target/core/models/k;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v7, 0x0

    const/high16 v13, -0x40800000    # -1.0f

    const-wide/high16 v4, -0x4010000000000000L    # -1.0

    const/4 v6, 0x1

    .line 27
    const-string/jumbo v0, "Parsing banner stats"

    iput-object v0, p1, Lcom/my/target/core/parsers/a$a;->d:Ljava/lang/String;

    .line 29
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 31
    const-string/jumbo v1, "statistics"

    invoke-static {p0, v1, p1}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;)Lorg/json/JSONArray;

    move-result-object v9

    .line 33
    if-nez v9, :cond_1

    .line 95
    :cond_0
    return-object v0

    .line 35
    :cond_1
    invoke-virtual {v9}, Lorg/json/JSONArray;->length()I

    move-result v10

    move v8, v7

    .line 37
    :goto_0
    if-ge v8, v10, :cond_0

    .line 39
    const-string/jumbo v1, "statistics"

    invoke-static {v8, v9, v1, p1}, Lcom/my/target/core/parsers/rb/a;->a(ILorg/json/JSONArray;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;)Lorg/json/JSONObject;

    move-result-object v1

    .line 41
    if-eqz v1, :cond_3

    .line 43
    const-string/jumbo v2, "type"

    const-string/jumbo v3, ""

    invoke-static {v1, v2, p1, v3, v6}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v3

    .line 45
    const-string/jumbo v2, "url"

    const-string/jumbo v11, ""

    invoke-static {v1, v2, p1, v11, v6}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v11

    .line 48
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_3

    invoke-static {v11}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_3

    .line 50
    const/4 v2, -0x1

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v12

    sparse-switch v12, :sswitch_data_0

    :cond_2
    :goto_1
    packed-switch v2, :pswitch_data_0

    .line 88
    new-instance v1, Lcom/my/target/core/models/k;

    invoke-direct {v1, v3, v11}, Lcom/my/target/core/models/k;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 89
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 37
    :cond_3
    :goto_2
    add-int/lit8 v1, v8, 0x1

    move v8, v1

    goto :goto_0

    .line 50
    :sswitch_0
    const-string/jumbo v12, "skip"

    invoke-virtual {v3, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_2

    move v2, v7

    goto :goto_1

    :sswitch_1
    const-string/jumbo v12, "creativeView"

    invoke-virtual {v3, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_2

    move v2, v6

    goto :goto_1

    :sswitch_2
    const-string/jumbo v12, "playheadReachedValue"

    invoke-virtual {v3, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_2

    const/4 v2, 0x2

    goto :goto_1

    .line 54
    :pswitch_0
    new-instance v1, Lcom/my/target/core/models/k;

    const-string/jumbo v2, "closedByUser"

    invoke-direct {v1, v2, v11}, Lcom/my/target/core/models/k;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 55
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 60
    :pswitch_1
    new-instance v1, Lcom/my/target/core/models/k;

    const-string/jumbo v2, "playbackStarted"

    invoke-direct {v1, v2, v11}, Lcom/my/target/core/models/k;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 61
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 65
    :pswitch_2
    new-instance v12, Lcom/my/target/core/models/i;

    invoke-direct {v12, v3, v11}, Lcom/my/target/core/models/i;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 66
    const-string/jumbo v2, "value"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 68
    const-string/jumbo v2, "value"

    move-object v3, p1

    .line 69
    invoke-static/range {v1 .. v6}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;DZ)D

    move-result-wide v2

    double-to-float v1, v2

    .line 72
    cmpl-float v2, v1, v13

    if-eqz v2, :cond_3

    .line 73
    invoke-virtual {v12, v1}, Lcom/my/target/core/models/i;->a(F)V

    .line 84
    :cond_4
    :goto_3
    invoke-virtual {v0, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 74
    :cond_5
    const-string/jumbo v2, "pvalue"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 76
    const-string/jumbo v2, "pvalue"

    move-object v3, p1

    invoke-static/range {v1 .. v6}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;DZ)D

    move-result-wide v2

    double-to-float v1, v2

    .line 81
    cmpl-float v2, v1, v13

    if-eqz v2, :cond_3

    .line 82
    invoke-virtual {v12, v1}, Lcom/my/target/core/models/i;->b(F)V

    goto :goto_3

    .line 50
    :sswitch_data_0
    .sparse-switch
        0x35e57f -> :sswitch_0
        0x69fcaef4 -> :sswitch_1
        0x6a94c473 -> :sswitch_2
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public static b(Lorg/json/JSONObject;Lcom/my/target/core/parsers/a$a;)Ljava/util/ArrayList;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONObject;",
            "Lcom/my/target/core/parsers/a$a;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/my/target/core/models/k;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v8, 0x1

    .line 101
    const-string/jumbo v0, "Parsing service stats"

    iput-object v0, p1, Lcom/my/target/core/parsers/a$a;->d:Ljava/lang/String;

    .line 103
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 105
    const-string/jumbo v1, "serviceStatistics"

    invoke-static {p0, v1, p1}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;)Lorg/json/JSONArray;

    move-result-object v2

    .line 107
    if-nez v2, :cond_1

    .line 126
    :cond_0
    return-object v0

    .line 109
    :cond_1
    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v3

    .line 111
    const/4 v1, 0x0

    :goto_0
    if-ge v1, v3, :cond_0

    .line 113
    const-string/jumbo v4, "statistics"

    invoke-static {v1, v2, v4, p1}, Lcom/my/target/core/parsers/rb/a;->a(ILorg/json/JSONArray;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;)Lorg/json/JSONObject;

    move-result-object v4

    .line 116
    const-string/jumbo v5, "type"

    const-string/jumbo v6, ""

    invoke-static {v4, v5, p1, v6, v8}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v5

    .line 118
    const-string/jumbo v6, "url"

    const-string/jumbo v7, ""

    invoke-static {v4, v6, p1, v7, v8}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v4

    .line 121
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_2

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_2

    .line 122
    new-instance v6, Lcom/my/target/core/models/k;

    invoke-direct {v6, v5, v4}, Lcom/my/target/core/models/k;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 123
    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 111
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method
