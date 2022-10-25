.class public final Lcom/my/tracker/models/events/i;
.super Lcom/my/tracker/models/events/a;
.source "StandardEvent.java"


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 6

    .prologue
    .line 40
    const/4 v3, 0x0

    const-wide/16 v4, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    invoke-direct/range {v0 .. v5}, Lcom/my/tracker/models/events/i;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;J)V

    .line 41
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;J)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Long;",
            ">;J)V"
        }
    .end annotation

    .prologue
    .line 45
    invoke-direct {p0, p1, p3}, Lcom/my/tracker/models/events/a;-><init>(Ljava/lang/String;Ljava/util/List;)V

    .line 46
    invoke-virtual {p0, p4, p5}, Lcom/my/tracker/models/events/i;->a(J)V

    .line 47
    if-eqz p2, :cond_0

    invoke-virtual {p0, p2}, Lcom/my/tracker/models/events/i;->c(Ljava/lang/String;)V

    .line 48
    :cond_0
    return-void
.end method


# virtual methods
.method public final k()Lorg/json/JSONObject;
    .locals 6

    .prologue
    .line 55
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 58
    :try_start_0
    const-string/jumbo v1, "type"

    invoke-virtual {p0}, Lcom/my/tracker/models/events/i;->a()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 59
    const-string/jumbo v1, "timestamps"

    new-instance v2, Lorg/json/JSONArray;

    invoke-virtual {p0}, Lcom/my/tracker/models/events/i;->f()Ljava/util/List;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/json/JSONArray;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 60
    invoke-virtual {p0}, Lcom/my/tracker/models/events/i;->h()J

    move-result-wide v2

    .line 61
    const-wide/16 v4, 0x0

    cmp-long v1, v2, v4

    if-lez v1, :cond_0

    const-string/jumbo v1, "timestamps_skipped"

    invoke-virtual {v0, v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 62
    :cond_0
    invoke-virtual {p0}, Lcom/my/tracker/models/events/i;->e()Ljava/lang/String;

    move-result-object v1

    .line 63
    if-eqz v1, :cond_1

    const-string/jumbo v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 65
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 66
    const-string/jumbo v1, "params"

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 72
    :cond_1
    :goto_0
    return-object v0

    :catch_0
    move-exception v1

    goto :goto_0
.end method
