.class public final Lcom/my/tracker/models/events/g;
.super Lcom/my/tracker/models/events/a;
.source "ReferrerEvent.java"


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Long;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 37
    const-string/jumbo v0, "install_referrer"

    invoke-direct {p0, v0, p4}, Lcom/my/tracker/models/events/a;-><init>(Ljava/lang/String;Ljava/util/List;)V

    .line 39
    if-eqz p1, :cond_0

    invoke-virtual {p0, p1}, Lcom/my/tracker/models/events/g;->b(Ljava/lang/String;)V

    .line 40
    :cond_0
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 42
    new-instance v0, Lcom/my/tracker/utils/b$b;

    invoke-direct {v0, p3}, Lcom/my/tracker/utils/b$b;-><init>(Ljava/lang/String;)V

    .line 43
    const-string/jumbo v1, "installer"

    invoke-virtual {v0, v1, p2}, Lcom/my/tracker/utils/b$b;->a(Ljava/lang/String;Ljava/lang/String;)Lcom/my/tracker/utils/b$b;

    .line 44
    invoke-virtual {v0}, Lcom/my/tracker/utils/b$b;->toString()Ljava/lang/String;

    move-result-object p3

    .line 46
    :cond_1
    invoke-static {p3}, Lcom/my/tracker/utils/b;->a(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 47
    invoke-virtual {p0, p3}, Lcom/my/tracker/models/events/g;->c(Ljava/lang/String;)V

    .line 48
    :cond_2
    return-void
.end method


# virtual methods
.method public final k()Lorg/json/JSONObject;
    .locals 4

    .prologue
    .line 55
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 58
    :try_start_0
    const-string/jumbo v1, "type"

    invoke-virtual {p0}, Lcom/my/tracker/models/events/g;->a()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 59
    const-string/jumbo v1, "timestamp"

    invoke-virtual {p0}, Lcom/my/tracker/models/events/g;->g()J

    move-result-wide v2

    invoke-virtual {v0, v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 60
    invoke-virtual {p0}, Lcom/my/tracker/models/events/g;->c()Ljava/lang/String;

    move-result-object v1

    .line 61
    if-eqz v1, :cond_0

    const-string/jumbo v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 62
    const-string/jumbo v1, "referrer"

    invoke-virtual {p0}, Lcom/my/tracker/models/events/g;->c()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 63
    :cond_0
    new-instance v1, Lcom/my/tracker/utils/b$a;

    .line 64
    invoke-virtual {p0}, Lcom/my/tracker/models/events/g;->e()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/my/tracker/utils/b$a;-><init>(Ljava/lang/String;)V

    .line 65
    const-string/jumbo v2, "installer"

    const-string/jumbo v3, "installer"

    .line 66
    invoke-virtual {v1, v3}, Lcom/my/tracker/utils/b$a;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 65
    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->putOpt(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 71
    :goto_0
    return-object v0

    :catch_0
    move-exception v1

    goto :goto_0
.end method
