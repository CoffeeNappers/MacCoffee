.class public final Lcom/my/tracker/builders/a;
.super Ljava/lang/Object;
.source "JSONBuilder.java"


# instance fields
.field private a:Lorg/json/JSONObject;

.field private b:Lorg/json/JSONObject;

.field private c:Lorg/json/JSONObject;

.field private d:Lorg/json/JSONObject;

.field private e:Lorg/json/JSONObject;

.field private f:Lorg/json/JSONObject;

.field private g:Lorg/json/JSONArray;

.field private h:Lorg/json/JSONArray;

.field private i:Lorg/json/JSONObject;

.field private j:Lorg/json/JSONObject;

.field private k:Lorg/json/JSONArray;


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    .line 70
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    iput-object v0, p0, Lcom/my/tracker/builders/a;->a:Lorg/json/JSONObject;

    .line 53
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    iput-object v0, p0, Lcom/my/tracker/builders/a;->b:Lorg/json/JSONObject;

    .line 54
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    iput-object v0, p0, Lcom/my/tracker/builders/a;->c:Lorg/json/JSONObject;

    .line 55
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    iput-object v0, p0, Lcom/my/tracker/builders/a;->d:Lorg/json/JSONObject;

    .line 56
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    iput-object v0, p0, Lcom/my/tracker/builders/a;->e:Lorg/json/JSONObject;

    .line 57
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    iput-object v0, p0, Lcom/my/tracker/builders/a;->f:Lorg/json/JSONObject;

    .line 58
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    iput-object v0, p0, Lcom/my/tracker/builders/a;->g:Lorg/json/JSONArray;

    .line 59
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    iput-object v0, p0, Lcom/my/tracker/builders/a;->h:Lorg/json/JSONArray;

    .line 60
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    iput-object v0, p0, Lcom/my/tracker/builders/a;->i:Lorg/json/JSONObject;

    .line 61
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    iput-object v0, p0, Lcom/my/tracker/builders/a;->j:Lorg/json/JSONObject;

    .line 73
    :try_start_0
    iget-object v0, p0, Lcom/my/tracker/builders/a;->a:Lorg/json/JSONObject;

    const-string/jumbo v1, "mytracker_ver"

    const-string/jumbo v2, "1.3.8"

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 74
    iget-object v0, p0, Lcom/my/tracker/builders/a;->a:Lorg/json/JSONObject;

    const-string/jumbo v1, "app"

    iget-object v2, p0, Lcom/my/tracker/builders/a;->b:Lorg/json/JSONObject;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 75
    iget-object v0, p0, Lcom/my/tracker/builders/a;->a:Lorg/json/JSONObject;

    const-string/jumbo v1, "user"

    iget-object v2, p0, Lcom/my/tracker/builders/a;->c:Lorg/json/JSONObject;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 76
    iget-object v0, p0, Lcom/my/tracker/builders/a;->a:Lorg/json/JSONObject;

    const-string/jumbo v1, "device"

    iget-object v2, p0, Lcom/my/tracker/builders/a;->d:Lorg/json/JSONObject;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 77
    iget-object v0, p0, Lcom/my/tracker/builders/a;->a:Lorg/json/JSONObject;

    const-string/jumbo v1, "network"

    iget-object v2, p0, Lcom/my/tracker/builders/a;->e:Lorg/json/JSONObject;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 78
    iget-object v0, p0, Lcom/my/tracker/builders/a;->a:Lorg/json/JSONObject;

    const-string/jumbo v1, "location"

    iget-object v2, p0, Lcom/my/tracker/builders/a;->f:Lorg/json/JSONObject;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 79
    iget-object v0, p0, Lcom/my/tracker/builders/a;->a:Lorg/json/JSONObject;

    const-string/jumbo v1, "events"

    iget-object v2, p0, Lcom/my/tracker/builders/a;->g:Lorg/json/JSONArray;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 80
    iget-object v0, p0, Lcom/my/tracker/builders/a;->a:Lorg/json/JSONObject;

    const-string/jumbo v1, "custom_events"

    iget-object v2, p0, Lcom/my/tracker/builders/a;->h:Lorg/json/JSONArray;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 81
    iget-object v0, p0, Lcom/my/tracker/builders/a;->a:Lorg/json/JSONObject;

    const-string/jumbo v1, "environment"

    iget-object v2, p0, Lcom/my/tracker/builders/a;->i:Lorg/json/JSONObject;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 87
    :goto_0
    return-void

    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method private static a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 1

    .prologue
    .line 353
    :try_start_0
    invoke-virtual {p0, p1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 358
    :goto_0
    return-void

    :catch_0
    move-exception v0

    goto :goto_0
.end method


# virtual methods
.method public final a()V
    .locals 3

    .prologue
    .line 412
    iget-object v0, p0, Lcom/my/tracker/builders/a;->j:Lorg/json/JSONObject;

    const-string/jumbo v1, "location_enabled"

    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/my/tracker/builders/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    .line 413
    iget-object v0, p0, Lcom/my/tracker/builders/a;->j:Lorg/json/JSONObject;

    invoke-virtual {v0}, Lorg/json/JSONObject;->names()Lorg/json/JSONArray;

    move-result-object v0

    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v0

    if-lez v0, :cond_0

    iget-object v0, p0, Lcom/my/tracker/builders/a;->a:Lorg/json/JSONObject;

    const-string/jumbo v1, "settings"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 417
    :try_start_0
    iget-object v0, p0, Lcom/my/tracker/builders/a;->a:Lorg/json/JSONObject;

    const-string/jumbo v1, "settings"

    iget-object v2, p0, Lcom/my/tracker/builders/a;->j:Lorg/json/JSONObject;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 422
    :cond_0
    :goto_0
    return-void

    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public final a(F)V
    .locals 3

    .prologue
    .line 190
    iget-object v0, p0, Lcom/my/tracker/builders/a;->d:Lorg/json/JSONObject;

    const-string/jumbo v1, "density"

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/my/tracker/builders/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    .line 191
    return-void
.end method

.method public final a(I)V
    .locals 3

    .prologue
    .line 175
    iget-object v0, p0, Lcom/my/tracker/builders/a;->d:Lorg/json/JSONObject;

    const-string/jumbo v1, "w"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/my/tracker/builders/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    .line 176
    return-void
.end method

.method public final a(J)V
    .locals 3

    .prologue
    .line 99
    iget-object v0, p0, Lcom/my/tracker/builders/a;->a:Lorg/json/JSONObject;

    const-string/jumbo v1, "timestamp_base"

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/my/tracker/builders/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    .line 100
    return-void
.end method

.method public final a(Landroid/location/Location;Ljava/lang/String;)V
    .locals 6

    .prologue
    .line 251
    if-nez p1, :cond_1

    .line 264
    :cond_0
    :goto_0
    return-void

    .line 254
    :cond_1
    :try_start_0
    iget-object v0, p0, Lcom/my/tracker/builders/a;->f:Lorg/json/JSONObject;

    const-string/jumbo v1, "lon"

    invoke-virtual {p1}, Landroid/location/Location;->getLongitude()D

    move-result-wide v2

    invoke-virtual {v0, v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    .line 255
    iget-object v0, p0, Lcom/my/tracker/builders/a;->f:Lorg/json/JSONObject;

    const-string/jumbo v1, "lat"

    invoke-virtual {p1}, Landroid/location/Location;->getLatitude()D

    move-result-wide v2

    invoke-virtual {v0, v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    .line 256
    iget-object v0, p0, Lcom/my/tracker/builders/a;->f:Lorg/json/JSONObject;

    const-string/jumbo v1, "accuracy"

    invoke-virtual {p1}, Landroid/location/Location;->getAccuracy()F

    move-result v2

    float-to-double v2, v2

    invoke-virtual {v0, v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    .line 257
    iget-object v0, p0, Lcom/my/tracker/builders/a;->f:Lorg/json/JSONObject;

    const-string/jumbo v1, "speed"

    invoke-virtual {p1}, Landroid/location/Location;->getSpeed()F

    move-result v2

    float-to-double v2, v2

    invoke-virtual {v0, v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    .line 258
    iget-object v0, p0, Lcom/my/tracker/builders/a;->f:Lorg/json/JSONObject;

    const-string/jumbo v1, "timestamp"

    invoke-virtual {p1}, Landroid/location/Location;->getTime()J

    move-result-wide v2

    const-wide/16 v4, 0x3e8

    div-long/2addr v2, v4

    invoke-virtual {v0, v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 259
    if-eqz p2, :cond_0

    iget-object v0, p0, Lcom/my/tracker/builders/a;->f:Lorg/json/JSONObject;

    const-string/jumbo v1, "location_provider"

    invoke-virtual {v0, v1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 264
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public final a(Lcom/my/tracker/models/events/c;)V
    .locals 2

    .prologue
    .line 317
    invoke-interface {p1}, Lcom/my/tracker/models/events/c;->a()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "custom"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/my/tracker/builders/a;->h:Lorg/json/JSONArray;

    invoke-interface {p1}, Lcom/my/tracker/models/events/c;->k()Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 319
    :goto_0
    return-void

    .line 318
    :cond_0
    iget-object v0, p0, Lcom/my/tracker/builders/a;->g:Lorg/json/JSONArray;

    invoke-interface {p1}, Lcom/my/tracker/models/events/c;->k()Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_0
.end method

.method public final a(Lcom/my/tracker/providers/d$b;Lcom/my/tracker/providers/d$d;Ljava/util/ArrayList;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/my/tracker/providers/d$b;",
            "Lcom/my/tracker/providers/d$d;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/my/tracker/providers/d$d;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 364
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 365
    if-eqz p1, :cond_0

    .line 367
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    .line 368
    iget-object v2, p1, Lcom/my/tracker/providers/d$b;->a:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 369
    iget v2, p1, Lcom/my/tracker/providers/d$b;->b:I

    invoke-virtual {v1, v2}, Lorg/json/JSONArray;->put(I)Lorg/json/JSONArray;

    .line 370
    iget v2, p1, Lcom/my/tracker/providers/d$b;->c:I

    invoke-virtual {v1, v2}, Lorg/json/JSONArray;->put(I)Lorg/json/JSONArray;

    .line 371
    iget v2, p1, Lcom/my/tracker/providers/d$b;->e:I

    invoke-virtual {v1, v2}, Lorg/json/JSONArray;->put(I)Lorg/json/JSONArray;

    .line 372
    iget v2, p1, Lcom/my/tracker/providers/d$b;->f:I

    invoke-virtual {v1, v2}, Lorg/json/JSONArray;->put(I)Lorg/json/JSONArray;

    .line 373
    const-string/jumbo v2, "current"

    invoke-static {v0, v2, v1}, Lcom/my/tracker/builders/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    .line 375
    iget-object v1, p0, Lcom/my/tracker/builders/a;->i:Lorg/json/JSONObject;

    const-string/jumbo v2, "cell"

    invoke-static {v1, v2, v0}, Lcom/my/tracker/builders/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    .line 378
    :cond_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 379
    if-eqz p2, :cond_1

    .line 381
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    .line 382
    iget-object v2, p2, Lcom/my/tracker/providers/d$d;->b:Ljava/lang/String;

    invoke-virtual {v0, v2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 383
    iget-object v2, p2, Lcom/my/tracker/providers/d$d;->a:Ljava/lang/String;

    invoke-virtual {v0, v2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 384
    iget v2, p2, Lcom/my/tracker/providers/d$d;->c:I

    invoke-virtual {v0, v2}, Lorg/json/JSONArray;->put(I)Lorg/json/JSONArray;

    .line 385
    iget v2, p2, Lcom/my/tracker/providers/d$d;->d:I

    invoke-virtual {v0, v2}, Lorg/json/JSONArray;->put(I)Lorg/json/JSONArray;

    .line 386
    iget v2, p2, Lcom/my/tracker/providers/d$d;->e:I

    invoke-virtual {v0, v2}, Lorg/json/JSONArray;->put(I)Lorg/json/JSONArray;

    .line 387
    const-string/jumbo v2, "current"

    invoke-static {v1, v2, v0}, Lcom/my/tracker/builders/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    .line 390
    :cond_1
    if-eqz p3, :cond_3

    invoke-virtual {p3}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_3

    .line 392
    new-instance v2, Lorg/json/JSONArray;

    invoke-direct {v2}, Lorg/json/JSONArray;-><init>()V

    .line 393
    invoke-virtual {p3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/my/tracker/providers/d$d;

    .line 395
    new-instance v4, Lorg/json/JSONArray;

    invoke-direct {v4}, Lorg/json/JSONArray;-><init>()V

    .line 396
    iget-object v5, v0, Lcom/my/tracker/providers/d$d;->b:Ljava/lang/String;

    invoke-virtual {v4, v5}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 397
    iget-object v5, v0, Lcom/my/tracker/providers/d$d;->a:Ljava/lang/String;

    invoke-virtual {v4, v5}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 398
    iget v0, v0, Lcom/my/tracker/providers/d$d;->f:I

    invoke-virtual {v4, v0}, Lorg/json/JSONArray;->put(I)Lorg/json/JSONArray;

    .line 399
    invoke-virtual {v2, v4}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_0

    .line 402
    :cond_2
    const-string/jumbo v0, "around"

    invoke-static {v1, v0, v2}, Lcom/my/tracker/builders/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    .line 404
    :cond_3
    if-nez p2, :cond_4

    if-eqz p3, :cond_5

    invoke-virtual {p3}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_5

    .line 406
    :cond_4
    iget-object v0, p0, Lcom/my/tracker/builders/a;->i:Lorg/json/JSONObject;

    const-string/jumbo v2, "wifi"

    invoke-static {v0, v2, v1}, Lcom/my/tracker/builders/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    .line 408
    :cond_5
    return-void
.end method

.method public final a(Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 94
    iget-object v0, p0, Lcom/my/tracker/builders/a;->a:Lorg/json/JSONObject;

    const-string/jumbo v1, "app_id"

    invoke-static {v0, v1, p1}, Lcom/my/tracker/builders/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    .line 95
    return-void
.end method

.method public final a(Ljava/lang/String;I)V
    .locals 3

    .prologue
    .line 124
    iget-object v0, p0, Lcom/my/tracker/builders/a;->d:Lorg/json/JSONObject;

    const-string/jumbo v1, "advertising_id"

    invoke-static {v0, v1, p1}, Lcom/my/tracker/builders/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    .line 125
    iget-object v0, p0, Lcom/my/tracker/builders/a;->d:Lorg/json/JSONObject;

    const-string/jumbo v1, "advertising_tracking_enabled"

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/my/tracker/builders/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    .line 126
    return-void
.end method

.method public final a(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 215
    iget-object v0, p0, Lcom/my/tracker/builders/a;->e:Lorg/json/JSONObject;

    const-string/jumbo v1, "connection"

    invoke-static {v0, v1, p1}, Lcom/my/tracker/builders/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    .line 216
    iget-object v0, p0, Lcom/my/tracker/builders/a;->e:Lorg/json/JSONObject;

    const-string/jumbo v1, "connection_type"

    invoke-static {v0, v1, p2}, Lcom/my/tracker/builders/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    .line 217
    return-void
.end method

.method public final a(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/my/tracker/models/events/c;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 308
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/my/tracker/models/events/c;

    .line 310
    invoke-interface {v0}, Lcom/my/tracker/models/events/c;->a()Ljava/lang/String;

    move-result-object v2

    const-string/jumbo v3, "custom"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/my/tracker/builders/a;->h:Lorg/json/JSONArray;

    invoke-interface {v0}, Lcom/my/tracker/models/events/c;->k()Lorg/json/JSONObject;

    move-result-object v0

    invoke-virtual {v2, v0}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_0

    .line 311
    :cond_0
    iget-object v2, p0, Lcom/my/tracker/builders/a;->g:Lorg/json/JSONArray;

    invoke-interface {v0}, Lcom/my/tracker/models/events/c;->k()Lorg/json/JSONObject;

    move-result-object v0

    invoke-virtual {v2, v0}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_0

    .line 313
    :cond_1
    return-void
.end method

.method public final a([Ljava/lang/String;)V
    .locals 4

    .prologue
    .line 273
    iget-object v0, p0, Lcom/my/tracker/builders/a;->c:Lorg/json/JSONObject;

    const-string/jumbo v1, "email"

    new-instance v2, Lorg/json/JSONArray;

    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/json/JSONArray;-><init>(Ljava/util/Collection;)V

    invoke-static {v0, v1, v2}, Lcom/my/tracker/builders/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    .line 274
    return-void
.end method

.method public final b()V
    .locals 3

    .prologue
    .line 426
    iget-object v0, p0, Lcom/my/tracker/builders/a;->j:Lorg/json/JSONObject;

    const-string/jumbo v1, "launch_enabled"

    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/my/tracker/builders/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    .line 427
    iget-object v0, p0, Lcom/my/tracker/builders/a;->j:Lorg/json/JSONObject;

    invoke-virtual {v0}, Lorg/json/JSONObject;->names()Lorg/json/JSONArray;

    move-result-object v0

    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v0

    if-lez v0, :cond_0

    iget-object v0, p0, Lcom/my/tracker/builders/a;->a:Lorg/json/JSONObject;

    const-string/jumbo v1, "settings"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 431
    :try_start_0
    iget-object v0, p0, Lcom/my/tracker/builders/a;->a:Lorg/json/JSONObject;

    const-string/jumbo v1, "settings"

    iget-object v2, p0, Lcom/my/tracker/builders/a;->j:Lorg/json/JSONObject;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 436
    :cond_0
    :goto_0
    return-void

    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public final b(I)V
    .locals 3

    .prologue
    .line 180
    iget-object v0, p0, Lcom/my/tracker/builders/a;->d:Lorg/json/JSONObject;

    const-string/jumbo v1, "h"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/my/tracker/builders/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    .line 181
    return-void
.end method

.method public final b(J)V
    .locals 3

    .prologue
    .line 104
    iget-object v0, p0, Lcom/my/tracker/builders/a;->a:Lorg/json/JSONObject;

    const-string/jumbo v1, "timestamp_send"

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/my/tracker/builders/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    .line 105
    return-void
.end method

.method public final b(Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 114
    iget-object v0, p0, Lcom/my/tracker/builders/a;->d:Lorg/json/JSONObject;

    const-string/jumbo v1, "device_id"

    invoke-static {v0, v1, p1}, Lcom/my/tracker/builders/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    .line 115
    return-void
.end method

.method public final b(Ljava/util/List;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/my/tracker/providers/b$a;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 325
    :try_start_0
    iget-object v0, p0, Lcom/my/tracker/builders/a;->k:Lorg/json/JSONArray;

    if-nez v0, :cond_0

    .line 327
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    iput-object v0, p0, Lcom/my/tracker/builders/a;->k:Lorg/json/JSONArray;

    .line 328
    iget-object v0, p0, Lcom/my/tracker/builders/a;->a:Lorg/json/JSONObject;

    const-string/jumbo v1, "apps"

    iget-object v2, p0, Lcom/my/tracker/builders/a;->k:Lorg/json/JSONArray;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 330
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/my/tracker/providers/b$a;

    .line 332
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 333
    const-string/jumbo v3, "bundle"

    iget-object v4, v0, Lcom/my/tracker/providers/b$a;->a:Ljava/lang/String;

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 334
    iget-wide v4, v0, Lcom/my/tracker/providers/b$a;->b:J

    const-wide/16 v6, 0x0

    cmp-long v3, v4, v6

    if-lez v3, :cond_1

    const-string/jumbo v3, "first_install_time"

    iget-wide v4, v0, Lcom/my/tracker/providers/b$a;->b:J

    invoke-virtual {v2, v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 335
    :cond_1
    iget-object v0, p0, Lcom/my/tracker/builders/a;->k:Lorg/json/JSONArray;

    invoke-virtual {v0, v2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 341
    :catch_0
    move-exception v0

    :cond_2
    return-void
.end method

.method public final b([Ljava/lang/String;)V
    .locals 4

    .prologue
    .line 278
    iget-object v0, p0, Lcom/my/tracker/builders/a;->c:Lorg/json/JSONObject;

    const-string/jumbo v1, "ok_id"

    new-instance v2, Lorg/json/JSONArray;

    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/json/JSONArray;-><init>(Ljava/util/Collection;)V

    invoke-static {v0, v1, v2}, Lcom/my/tracker/builders/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    .line 279
    return-void
.end method

.method public final c()V
    .locals 3

    .prologue
    .line 440
    iget-object v0, p0, Lcom/my/tracker/builders/a;->j:Lorg/json/JSONObject;

    const-string/jumbo v1, "environment_enabled"

    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/my/tracker/builders/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    .line 441
    iget-object v0, p0, Lcom/my/tracker/builders/a;->j:Lorg/json/JSONObject;

    invoke-virtual {v0}, Lorg/json/JSONObject;->names()Lorg/json/JSONArray;

    move-result-object v0

    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v0

    if-lez v0, :cond_0

    iget-object v0, p0, Lcom/my/tracker/builders/a;->a:Lorg/json/JSONObject;

    const-string/jumbo v1, "settings"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 445
    :try_start_0
    iget-object v0, p0, Lcom/my/tracker/builders/a;->a:Lorg/json/JSONObject;

    const-string/jumbo v1, "settings"

    iget-object v2, p0, Lcom/my/tracker/builders/a;->j:Lorg/json/JSONObject;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 450
    :cond_0
    :goto_0
    return-void

    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public final c(I)V
    .locals 3

    .prologue
    .line 185
    iget-object v0, p0, Lcom/my/tracker/builders/a;->d:Lorg/json/JSONObject;

    const-string/jumbo v1, "dpi"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/my/tracker/builders/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    .line 186
    return-void
.end method

.method public final c(J)V
    .locals 3

    .prologue
    .line 109
    iget-object v0, p0, Lcom/my/tracker/builders/a;->a:Lorg/json/JSONObject;

    const-string/jumbo v1, "custom_events_skipped"

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/my/tracker/builders/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    .line 110
    return-void
.end method

.method public final c(Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 119
    iget-object v0, p0, Lcom/my/tracker/builders/a;->d:Lorg/json/JSONObject;

    const-string/jumbo v1, "android_id"

    invoke-static {v0, v1, p1}, Lcom/my/tracker/builders/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    .line 120
    return-void
.end method

.method public final c([Ljava/lang/String;)V
    .locals 4

    .prologue
    .line 283
    iget-object v0, p0, Lcom/my/tracker/builders/a;->c:Lorg/json/JSONObject;

    const-string/jumbo v1, "vk_id"

    new-instance v2, Lorg/json/JSONArray;

    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/json/JSONArray;-><init>(Ljava/util/Collection;)V

    invoke-static {v0, v1, v2}, Lcom/my/tracker/builders/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    .line 284
    return-void
.end method

.method public final d(I)V
    .locals 3

    .prologue
    .line 221
    iget-object v0, p0, Lcom/my/tracker/builders/a;->e:Lorg/json/JSONObject;

    const-string/jumbo v1, "bluetooth_enabled"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/my/tracker/builders/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    .line 222
    return-void
.end method

.method public final d(Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 130
    iget-object v0, p0, Lcom/my/tracker/builders/a;->d:Lorg/json/JSONObject;

    const-string/jumbo v1, "mrgs_device_id"

    invoke-static {v0, v1, p1}, Lcom/my/tracker/builders/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    .line 131
    return-void
.end method

.method public final d([Ljava/lang/String;)V
    .locals 4

    .prologue
    .line 288
    iget-object v0, p0, Lcom/my/tracker/builders/a;->c:Lorg/json/JSONObject;

    const-string/jumbo v1, "icq_id"

    new-instance v2, Lorg/json/JSONArray;

    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/json/JSONArray;-><init>(Ljava/util/Collection;)V

    invoke-static {v0, v1, v2}, Lcom/my/tracker/builders/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    .line 289
    return-void
.end method

.method public final e(I)V
    .locals 3

    .prologue
    .line 298
    iget-object v0, p0, Lcom/my/tracker/builders/a;->c:Lorg/json/JSONObject;

    const-string/jumbo v1, "a"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/my/tracker/builders/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    .line 299
    return-void
.end method

.method public final e(Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 135
    iget-object v0, p0, Lcom/my/tracker/builders/a;->d:Lorg/json/JSONObject;

    const-string/jumbo v1, "device"

    invoke-static {v0, v1, p1}, Lcom/my/tracker/builders/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    .line 136
    return-void
.end method

.method public final e([Ljava/lang/String;)V
    .locals 4

    .prologue
    .line 293
    iget-object v0, p0, Lcom/my/tracker/builders/a;->c:Lorg/json/JSONObject;

    const-string/jumbo v1, "custom_user_id"

    new-instance v2, Lorg/json/JSONArray;

    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/json/JSONArray;-><init>(Ljava/util/Collection;)V

    invoke-static {v0, v1, v2}, Lcom/my/tracker/builders/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    .line 294
    return-void
.end method

.method public final f(I)V
    .locals 3

    .prologue
    .line 303
    iget-object v0, p0, Lcom/my/tracker/builders/a;->c:Lorg/json/JSONObject;

    const-string/jumbo v1, "g"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/my/tracker/builders/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    .line 304
    return-void
.end method

.method public final f(Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 140
    iget-object v0, p0, Lcom/my/tracker/builders/a;->d:Lorg/json/JSONObject;

    const-string/jumbo v1, "os"

    invoke-static {v0, v1, p1}, Lcom/my/tracker/builders/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    .line 141
    return-void
.end method

.method public final g(I)V
    .locals 3

    .prologue
    .line 454
    iget-object v0, p0, Lcom/my/tracker/builders/a;->j:Lorg/json/JSONObject;

    const-string/jumbo v1, "session_timeout"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/my/tracker/builders/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    .line 455
    iget-object v0, p0, Lcom/my/tracker/builders/a;->j:Lorg/json/JSONObject;

    invoke-virtual {v0}, Lorg/json/JSONObject;->names()Lorg/json/JSONArray;

    move-result-object v0

    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v0

    if-lez v0, :cond_0

    iget-object v0, p0, Lcom/my/tracker/builders/a;->a:Lorg/json/JSONObject;

    const-string/jumbo v1, "settings"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 459
    :try_start_0
    iget-object v0, p0, Lcom/my/tracker/builders/a;->a:Lorg/json/JSONObject;

    const-string/jumbo v1, "settings"

    iget-object v2, p0, Lcom/my/tracker/builders/a;->j:Lorg/json/JSONObject;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 464
    :cond_0
    :goto_0
    return-void

    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public final g(Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 145
    iget-object v0, p0, Lcom/my/tracker/builders/a;->d:Lorg/json/JSONObject;

    const-string/jumbo v1, "manufacture"

    invoke-static {v0, v1, p1}, Lcom/my/tracker/builders/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    .line 146
    return-void
.end method

.method public final h(Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 150
    iget-object v0, p0, Lcom/my/tracker/builders/a;->d:Lorg/json/JSONObject;

    const-string/jumbo v1, "mac"

    invoke-static {v0, v1, p1}, Lcom/my/tracker/builders/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    .line 151
    return-void
.end method

.method public final i(Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 155
    iget-object v0, p0, Lcom/my/tracker/builders/a;->d:Lorg/json/JSONObject;

    const-string/jumbo v1, "osver"

    invoke-static {v0, v1, p1}, Lcom/my/tracker/builders/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    .line 156
    return-void
.end method

.method public final j(Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 160
    iget-object v0, p0, Lcom/my/tracker/builders/a;->d:Lorg/json/JSONObject;

    const-string/jumbo v1, "lang"

    invoke-static {v0, v1, p1}, Lcom/my/tracker/builders/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    .line 161
    return-void
.end method

.method public final k(Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 165
    iget-object v0, p0, Lcom/my/tracker/builders/a;->d:Lorg/json/JSONObject;

    const-string/jumbo v1, "timezone"

    invoke-static {v0, v1, p1}, Lcom/my/tracker/builders/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    .line 166
    return-void
.end method

.method public final l(Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 170
    iget-object v0, p0, Lcom/my/tracker/builders/a;->d:Lorg/json/JSONObject;

    const-string/jumbo v1, "euname"

    invoke-static {v0, v1, p1}, Lcom/my/tracker/builders/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    .line 171
    return-void
.end method

.method public final m(Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 195
    iget-object v0, p0, Lcom/my/tracker/builders/a;->e:Lorg/json/JSONObject;

    const-string/jumbo v1, "sim_loc"

    invoke-static {v0, v1, p1}, Lcom/my/tracker/builders/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    .line 196
    return-void
.end method

.method public final n(Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 200
    iget-object v0, p0, Lcom/my/tracker/builders/a;->e:Lorg/json/JSONObject;

    const-string/jumbo v1, "operator_id"

    invoke-static {v0, v1, p1}, Lcom/my/tracker/builders/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    .line 201
    return-void
.end method

.method public final o(Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 205
    iget-object v0, p0, Lcom/my/tracker/builders/a;->e:Lorg/json/JSONObject;

    const-string/jumbo v1, "operator_name"

    invoke-static {v0, v1, p1}, Lcom/my/tracker/builders/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    .line 206
    return-void
.end method

.method public final p(Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 210
    iget-object v0, p0, Lcom/my/tracker/builders/a;->e:Lorg/json/JSONObject;

    const-string/jumbo v1, "sim_operator_id"

    invoke-static {v0, v1, p1}, Lcom/my/tracker/builders/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    .line 211
    return-void
.end method

.method public final q(Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 226
    iget-object v0, p0, Lcom/my/tracker/builders/a;->b:Lorg/json/JSONObject;

    const-string/jumbo v1, "app"

    invoke-static {v0, v1, p1}, Lcom/my/tracker/builders/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    .line 227
    return-void
.end method

.method public final r(Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 231
    iget-object v0, p0, Lcom/my/tracker/builders/a;->b:Lorg/json/JSONObject;

    const-string/jumbo v1, "appver"

    invoke-static {v0, v1, p1}, Lcom/my/tracker/builders/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    .line 232
    return-void
.end method

.method public final s(Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 236
    iget-object v0, p0, Lcom/my/tracker/builders/a;->b:Lorg/json/JSONObject;

    const-string/jumbo v1, "appbuild"

    invoke-static {v0, v1, p1}, Lcom/my/tracker/builders/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    .line 237
    return-void
.end method

.method public final t(Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 241
    iget-object v0, p0, Lcom/my/tracker/builders/a;->b:Lorg/json/JSONObject;

    const-string/jumbo v1, "app_lang"

    invoke-static {v0, v1, p1}, Lcom/my/tracker/builders/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    .line 242
    return-void
.end method

.method public final toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 346
    iget-object v0, p0, Lcom/my/tracker/builders/a;->a:Lorg/json/JSONObject;

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final u(Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 246
    iget-object v0, p0, Lcom/my/tracker/builders/a;->b:Lorg/json/JSONObject;

    const-string/jumbo v1, "mrgs_app_id"

    invoke-static {v0, v1, p1}, Lcom/my/tracker/builders/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    .line 247
    return-void
.end method

.method public final v(Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 268
    iget-object v0, p0, Lcom/my/tracker/builders/a;->c:Lorg/json/JSONObject;

    const-string/jumbo v1, "mrgs_user_id"

    invoke-static {v0, v1, p1}, Lcom/my/tracker/builders/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/Object;)V

    .line 269
    return-void
.end method
