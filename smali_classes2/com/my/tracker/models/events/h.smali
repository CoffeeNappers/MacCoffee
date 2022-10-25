.class public final Lcom/my/tracker/models/events/h;
.super Lcom/my/tracker/models/events/a;
.source "SessionEvent.java"


# instance fields
.field private final a:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<[",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 39
    const-string/jumbo v0, "session"

    invoke-direct {p0, v0}, Lcom/my/tracker/models/events/a;-><init>(Ljava/lang/String;)V

    .line 40
    invoke-virtual {p0}, Lcom/my/tracker/models/events/h;->g()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lcom/my/tracker/models/events/h;->b(J)V

    .line 41
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/my/tracker/models/events/h;->a:Ljava/util/ArrayList;

    .line 42
    return-void
.end method

.method public constructor <init>(JJ)V
    .locals 1

    .prologue
    .line 46
    const-string/jumbo v0, "session"

    invoke-direct {p0, v0}, Lcom/my/tracker/models/events/a;-><init>(Ljava/lang/String;)V

    .line 47
    invoke-virtual {p0, p1, p2}, Lcom/my/tracker/models/events/h;->b(J)V

    .line 48
    invoke-virtual {p0, p3, p4}, Lcom/my/tracker/models/events/h;->a(J)V

    .line 49
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/my/tracker/models/events/h;->a:Ljava/util/ArrayList;

    .line 50
    return-void
.end method


# virtual methods
.method public final a([Ljava/lang/Long;)V
    .locals 1

    .prologue
    .line 90
    iget-object v0, p0, Lcom/my/tracker/models/events/h;->a:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 91
    return-void
.end method

.method public final k()Lorg/json/JSONObject;
    .locals 6

    .prologue
    .line 57
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 60
    :try_start_0
    const-string/jumbo v0, "type"

    invoke-virtual {p0}, Lcom/my/tracker/models/events/h;->a()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 61
    new-instance v2, Lorg/json/JSONArray;

    invoke-direct {v2}, Lorg/json/JSONArray;-><init>()V

    .line 63
    iget-object v0, p0, Lcom/my/tracker/models/events/h;->a:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/Long;

    .line 65
    new-instance v4, Lorg/json/JSONArray;

    invoke-direct {v4}, Lorg/json/JSONArray;-><init>()V

    .line 66
    const/4 v5, 0x0

    aget-object v5, v0, v5

    invoke-virtual {v4, v5}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 67
    const/4 v5, 0x1

    aget-object v0, v0, v5

    invoke-virtual {v4, v0}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 68
    invoke-virtual {v2, v4}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_0

    :catch_0
    move-exception v0

    .line 85
    :cond_0
    :goto_1
    return-object v1

    .line 70
    :cond_1
    const-string/jumbo v0, "timestamps"

    invoke-virtual {v1, v0, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 71
    invoke-virtual {p0}, Lcom/my/tracker/models/events/h;->h()J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v0, v2, v4

    if-lez v0, :cond_2

    .line 73
    const-string/jumbo v0, "timestamps_skipped"

    invoke-virtual {p0}, Lcom/my/tracker/models/events/h;->h()J

    move-result-wide v2

    invoke-virtual {v1, v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 75
    :cond_2
    invoke-virtual {p0}, Lcom/my/tracker/models/events/h;->e()Ljava/lang/String;

    move-result-object v0

    .line 76
    if-eqz v0, :cond_0

    const-string/jumbo v2, ""

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 78
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 79
    const-string/jumbo v0, "params"

    invoke-virtual {v1, v0, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1
.end method
