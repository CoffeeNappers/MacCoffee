.class public final Lcom/my/tracker/models/events/j;
.super Lcom/my/tracker/models/events/a;
.source "UpdateEvent.java"


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
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
    .line 41
    const-string/jumbo v0, "update"

    invoke-direct {p0, v0, p5}, Lcom/my/tracker/models/events/a;-><init>(Ljava/lang/String;Ljava/util/List;)V

    .line 42
    if-eqz p1, :cond_0

    invoke-virtual {p0, p1}, Lcom/my/tracker/models/events/j;->b(Ljava/lang/String;)V

    .line 43
    :cond_0
    if-eqz p2, :cond_1

    invoke-virtual {p0, p2}, Lcom/my/tracker/models/events/j;->a(Ljava/lang/String;)V

    .line 44
    :cond_1
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 46
    new-instance v0, Lcom/my/tracker/utils/b$b;

    invoke-direct {v0, p4}, Lcom/my/tracker/utils/b$b;-><init>(Ljava/lang/String;)V

    .line 47
    const-string/jumbo v1, "installer"

    invoke-virtual {v0, v1, p3}, Lcom/my/tracker/utils/b$b;->a(Ljava/lang/String;Ljava/lang/String;)Lcom/my/tracker/utils/b$b;

    .line 48
    invoke-virtual {v0}, Lcom/my/tracker/utils/b$b;->toString()Ljava/lang/String;

    move-result-object p4

    .line 50
    :cond_2
    invoke-static {p4}, Lcom/my/tracker/utils/b;->a(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_3

    .line 51
    invoke-virtual {p0, p4}, Lcom/my/tracker/models/events/j;->c(Ljava/lang/String;)V

    .line 52
    :cond_3
    return-void
.end method


# virtual methods
.method public final k()Lorg/json/JSONObject;
    .locals 4

    .prologue
    .line 59
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 62
    :try_start_0
    const-string/jumbo v1, "type"

    invoke-virtual {p0}, Lcom/my/tracker/models/events/j;->a()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 63
    const-string/jumbo v1, "timestamp"

    invoke-virtual {p0}, Lcom/my/tracker/models/events/j;->g()J

    move-result-wide v2

    invoke-virtual {v0, v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 64
    invoke-virtual {p0}, Lcom/my/tracker/models/events/j;->c()Ljava/lang/String;

    move-result-object v1

    .line 65
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 66
    const-string/jumbo v2, "appbuild"

    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 67
    :cond_0
    invoke-virtual {p0}, Lcom/my/tracker/models/events/j;->b()Ljava/lang/String;

    move-result-object v1

    .line 68
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 69
    const-string/jumbo v2, "appver"

    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 70
    :cond_1
    new-instance v1, Lcom/my/tracker/utils/b$a;

    .line 71
    invoke-virtual {p0}, Lcom/my/tracker/models/events/j;->e()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/my/tracker/utils/b$a;-><init>(Ljava/lang/String;)V

    .line 72
    const-string/jumbo v2, "installer"

    const-string/jumbo v3, "installer"

    .line 73
    invoke-virtual {v1, v3}, Lcom/my/tracker/utils/b$a;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 72
    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->putOpt(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 78
    :goto_0
    return-object v0

    :catch_0
    move-exception v1

    goto :goto_0
.end method
