.class public final Lcom/my/tracker/models/events/d;
.super Lcom/my/tracker/models/events/a;
.source "InstallEvent.java"


# direct methods
.method public constructor <init>(JLjava/lang/String;Ljava/lang/String;Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Long;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 40
    const-string/jumbo v0, "install"

    invoke-direct {p0, v0, p5}, Lcom/my/tracker/models/events/a;-><init>(Ljava/lang/String;Ljava/util/List;)V

    .line 41
    invoke-static {p1, p2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/my/tracker/models/events/d;->b(Ljava/lang/String;)V

    .line 43
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 45
    new-instance v0, Lcom/my/tracker/utils/b$b;

    invoke-direct {v0, p4}, Lcom/my/tracker/utils/b$b;-><init>(Ljava/lang/String;)V

    .line 46
    const-string/jumbo v1, "installer"

    invoke-virtual {v0, v1, p3}, Lcom/my/tracker/utils/b$b;->a(Ljava/lang/String;Ljava/lang/String;)Lcom/my/tracker/utils/b$b;

    .line 47
    invoke-virtual {v0}, Lcom/my/tracker/utils/b$b;->toString()Ljava/lang/String;

    move-result-object p4

    .line 49
    :cond_0
    invoke-static {p4}, Lcom/my/tracker/utils/b;->a(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 50
    invoke-virtual {p0, p4}, Lcom/my/tracker/models/events/d;->c(Ljava/lang/String;)V

    .line 51
    :cond_1
    return-void
.end method


# virtual methods
.method public final k()Lorg/json/JSONObject;
    .locals 4

    .prologue
    .line 58
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 61
    :try_start_0
    const-string/jumbo v1, "type"

    invoke-virtual {p0}, Lcom/my/tracker/models/events/d;->a()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 62
    const-string/jumbo v1, "timestamp"

    invoke-virtual {p0}, Lcom/my/tracker/models/events/d;->g()J

    move-result-wide v2

    invoke-virtual {v0, v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 63
    invoke-virtual {p0}, Lcom/my/tracker/models/events/d;->c()Ljava/lang/String;

    move-result-object v1

    .line 64
    if-eqz v1, :cond_0

    const-string/jumbo v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 65
    const-string/jumbo v1, "first_install_time"

    invoke-virtual {p0}, Lcom/my/tracker/models/events/d;->c()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 66
    :cond_0
    new-instance v1, Lcom/my/tracker/utils/b$a;

    .line 67
    invoke-virtual {p0}, Lcom/my/tracker/models/events/d;->e()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/my/tracker/utils/b$a;-><init>(Ljava/lang/String;)V

    .line 68
    const-string/jumbo v2, "installer"

    const-string/jumbo v3, "installer"

    .line 69
    invoke-virtual {v1, v3}, Lcom/my/tracker/utils/b$a;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 68
    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->putOpt(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 74
    :goto_0
    return-object v0

    :catch_0
    move-exception v1

    goto :goto_0
.end method
