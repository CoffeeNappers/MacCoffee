.class public final Lcom/my/target/core/parsers/rb/e;
.super Ljava/lang/Object;
.source "RBSettingsParser.java"


# direct methods
.method private static a(Lcom/my/target/core/models/l;Lorg/json/JSONObject;Lcom/my/target/core/parsers/a$a;)V
    .locals 7

    .prologue
    const/4 v6, 0x0

    .line 330
    const-string/jumbo v0, "Parsing video params"

    iput-object v0, p2, Lcom/my/target/core/parsers/a$a;->d:Ljava/lang/String;

    .line 332
    const-string/jumbo v0, "allowClose"

    .line 334
    invoke-virtual {p0}, Lcom/my/target/core/models/l;->a()Z

    move-result v1

    .line 333
    invoke-static {p1, v0, p2, v1}, Lcom/my/target/core/parsers/rb/a;->b(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Z)Z

    move-result v0

    .line 332
    invoke-virtual {p0, v0}, Lcom/my/target/core/models/l;->a(Z)V

    .line 335
    const-string/jumbo v2, "allowCloseDelay"

    .line 337
    invoke-virtual {p0}, Lcom/my/target/core/models/l;->b()F

    move-result v0

    float-to-double v4, v0

    move-object v1, p1

    move-object v3, p2

    .line 336
    invoke-static/range {v1 .. v6}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;DZ)D

    move-result-wide v0

    double-to-float v0, v0

    .line 335
    invoke-virtual {p0, v0}, Lcom/my/target/core/models/l;->a(F)V

    .line 338
    const-string/jumbo v0, "connectionTimeout"

    const/16 v1, 0xa

    .line 339
    invoke-static {p1, v0, p2, v1, v6}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;IZ)I

    move-result v0

    .line 338
    invoke-virtual {p0, v0}, Lcom/my/target/core/models/l;->a(I)V

    .line 342
    const-string/jumbo v0, "maxBannersShow"

    .line 345
    invoke-virtual {p0}, Lcom/my/target/core/models/l;->d()I

    move-result v1

    .line 342
    invoke-static {p1, v0, p2, v1, v6}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;IZ)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/my/target/core/models/l;->b(I)V

    .line 347
    return-void
.end method

.method public static a(Lcom/my/target/core/models/sections/i;Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;)V
    .locals 9

    .prologue
    const v8, -0x99999a

    const/high16 v1, -0x1000000

    const/4 v7, -0x1

    const/4 v6, 0x1

    const/4 v2, 0x0

    .line 52
    const-string/jumbo v0, "Parsing section settings"

    iput-object v0, p3, Lcom/my/target/core/parsers/a$a;->d:Ljava/lang/String;

    .line 53
    invoke-interface {p0}, Lcom/my/target/core/models/sections/i;->e()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p3, Lcom/my/target/core/parsers/a$a;->e:Ljava/lang/String;

    .line 54
    const-class v0, Lcom/my/target/core/parsers/rb/b;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p3, Lcom/my/target/core/parsers/a$a;->c:Ljava/lang/String;

    .line 56
    const-string/jumbo v0, "advertisingLabel"

    const-string/jumbo v3, ""

    .line 57
    invoke-static {p1, v0, p3, v3, v2}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    .line 56
    invoke-interface {p0, v0}, Lcom/my/target/core/models/sections/i;->a(Ljava/lang/String;)V

    .line 60
    const-string/jumbo v0, "standard"

    invoke-interface {p0}, Lcom/my/target/core/models/sections/i;->a()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 62
    const-string/jumbo v0, "Parsing standard section settings"

    iput-object v0, p3, Lcom/my/target/core/parsers/a$a;->d:Ljava/lang/String;

    .line 64
    invoke-interface {p0}, Lcom/my/target/core/models/sections/i;->e()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0, p3}, Lcom/my/target/core/parsers/rb/a;->c(Lcom/my/target/core/models/sections/i;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;)Lcom/my/target/core/models/sections/j;

    move-result-object v0

    .line 67
    if-nez v0, :cond_1

    .line 297
    :cond_0
    :goto_0
    return-void

    .line 69
    :cond_1
    const-string/jumbo v3, "refreshTime"

    const/16 v4, 0x3c

    .line 70
    invoke-static {p1, v3, p3, v4, v2}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;IZ)I

    move-result v3

    .line 69
    invoke-virtual {v0, v3}, Lcom/my/target/core/models/sections/j;->a(I)V

    .line 73
    const-string/jumbo v3, "hasAdditionalAds"

    .line 74
    invoke-static {p1, v3, p3, v6}, Lcom/my/target/core/parsers/rb/a;->b(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Z)Z

    move-result v3

    .line 73
    invoke-virtual {v0, v3}, Lcom/my/target/core/models/sections/j;->b(Z)V

    .line 77
    const-string/jumbo v3, "loopRotation"

    .line 78
    invoke-static {p1, v3, p3, v6}, Lcom/my/target/core/parsers/rb/a;->b(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Z)Z

    move-result v3

    .line 77
    invoke-virtual {v0, v3}, Lcom/my/target/core/models/sections/j;->c(Z)V

    .line 81
    const-string/jumbo v3, "animationType"

    .line 82
    invoke-static {p1, v3, p3, v6, v2}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;IZ)I

    move-result v3

    .line 81
    invoke-virtual {v0, v3}, Lcom/my/target/core/models/sections/j;->b(I)V

    .line 85
    const-string/jumbo v3, "extendedClickArea"

    invoke-static {p1, v3, p3, v6}, Lcom/my/target/core/parsers/rb/a;->b(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Z)Z

    move-result v3

    invoke-virtual {v0, v3}, Lcom/my/target/core/models/sections/j;->a(Z)V

    .line 89
    const-string/jumbo v3, "view"

    invoke-static {p1, v3, p3, v2}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Z)Lorg/json/JSONObject;

    move-result-object v3

    .line 91
    if-eqz v3, :cond_0

    .line 1355
    const-string/jumbo v4, "Parsing section view settings"

    iput-object v4, p3, Lcom/my/target/core/parsers/a$a;->d:Ljava/lang/String;

    .line 1357
    invoke-virtual {v0}, Lcom/my/target/core/models/sections/j;->i()Lcom/my/target/core/models/j;

    move-result-object v4

    .line 1359
    const-string/jumbo v0, "type"

    const-string/jumbo v5, "html"

    .line 1360
    invoke-static {v3, v0, p3, v5, v2}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    .line 1359
    invoke-virtual {v4, v0}, Lcom/my/target/core/models/j;->a(Ljava/lang/String;)V

    .line 1363
    const-string/jumbo v0, "backgroundColor"

    .line 1364
    invoke-static {v3, v0, p3, v7}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;I)I

    move-result v0

    .line 1363
    invoke-virtual {v4, v0}, Lcom/my/target/core/models/j;->a(I)V

    .line 1367
    const-string/jumbo v0, "backgroundTouchColor"

    const v5, -0x3a1508

    .line 1368
    invoke-static {v3, v0, p3, v5}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;I)I

    move-result v0

    .line 1367
    invoke-virtual {v4, v0}, Lcom/my/target/core/models/j;->b(I)V

    .line 1371
    const-string/jumbo v0, "standard_300x250"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    move v0, v1

    .line 1374
    :goto_1
    const-string/jumbo v5, "titleColor"

    .line 1375
    invoke-static {v3, v5, p3, v0}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;I)I

    move-result v0

    .line 1374
    invoke-virtual {v4, v0}, Lcom/my/target/core/models/j;->c(I)V

    .line 1378
    const-string/jumbo v0, "ageRestrictionsBackgroundColor"

    .line 1379
    invoke-static {v3, v0, p3, v7}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;I)I

    move-result v0

    .line 1378
    invoke-virtual {v4, v0}, Lcom/my/target/core/models/j;->d(I)V

    .line 1383
    const-string/jumbo v0, "ageRestrictionsTextColor"

    .line 1384
    invoke-static {v3, v0, p3, v8}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;I)I

    move-result v0

    .line 1383
    invoke-virtual {v4, v0}, Lcom/my/target/core/models/j;->e(I)V

    .line 1388
    const-string/jumbo v0, "ageRestrictionsBorderColor"

    const v5, -0x4c4c4d

    .line 1389
    invoke-static {v3, v0, p3, v5}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;I)I

    move-result v0

    .line 1388
    invoke-virtual {v4, v0}, Lcom/my/target/core/models/j;->f(I)V

    .line 1393
    const-string/jumbo v0, "descriptionColor"

    .line 1394
    invoke-static {v3, v0, p3, v1}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;I)I

    move-result v0

    .line 1393
    invoke-virtual {v4, v0}, Lcom/my/target/core/models/j;->g(I)V

    .line 1398
    const-string/jumbo v0, "domainColor"

    .line 1399
    invoke-static {v3, v0, p3, v8}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;I)I

    move-result v0

    .line 1398
    invoke-virtual {v4, v0}, Lcom/my/target/core/models/j;->h(I)V

    .line 1403
    const-string/jumbo v0, "votesColor"

    const v1, -0x777778

    .line 1404
    invoke-static {v3, v0, p3, v1}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;I)I

    move-result v0

    .line 1403
    invoke-virtual {v4, v0}, Lcom/my/target/core/models/j;->i(I)V

    .line 1408
    const-string/jumbo v0, "disclaimerColor"

    const v1, -0x777778

    .line 1409
    invoke-static {v3, v0, p3, v1}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;I)I

    move-result v0

    .line 1408
    invoke-virtual {v4, v0}, Lcom/my/target/core/models/j;->j(I)V

    .line 1413
    const-string/jumbo v0, "ctaButtonColor"

    const v1, -0xff5110

    .line 1414
    invoke-static {v3, v0, p3, v1}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;I)I

    move-result v0

    .line 1413
    invoke-virtual {v4, v0}, Lcom/my/target/core/models/j;->k(I)V

    .line 1418
    const-string/jumbo v0, "ctaButtonTouchColor"

    const v1, -0xff8957

    .line 1419
    invoke-static {v3, v0, p3, v1}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;I)I

    move-result v0

    .line 1418
    invoke-virtual {v4, v0}, Lcom/my/target/core/models/j;->l(I)V

    .line 1423
    const-string/jumbo v0, "ctaButtonTextColor"

    .line 1424
    invoke-static {v3, v0, p3, v7}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;I)I

    move-result v0

    .line 1423
    invoke-virtual {v4, v0}, Lcom/my/target/core/models/j;->m(I)V

    .line 1429
    const-string/jumbo v0, "titleBold"

    .line 1430
    invoke-static {v3, v0, p3, v6}, Lcom/my/target/core/parsers/rb/a;->b(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Z)Z

    move-result v0

    .line 1429
    invoke-virtual {v4, v0}, Lcom/my/target/core/models/j;->a(Z)V

    .line 1433
    const-string/jumbo v0, "descriptionBold"

    .line 1434
    invoke-static {v3, v0, p3, v2}, Lcom/my/target/core/parsers/rb/a;->b(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Z)Z

    move-result v0

    .line 1433
    invoke-virtual {v4, v0}, Lcom/my/target/core/models/j;->b(Z)V

    .line 1437
    const-string/jumbo v0, "domainBold"

    .line 1438
    invoke-static {v3, v0, p3, v2}, Lcom/my/target/core/parsers/rb/a;->b(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Z)Z

    move-result v0

    .line 1437
    invoke-virtual {v4, v0}, Lcom/my/target/core/models/j;->c(Z)V

    .line 1441
    const-string/jumbo v0, "votesBold"

    .line 1442
    invoke-static {v3, v0, p3, v2}, Lcom/my/target/core/parsers/rb/a;->b(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Z)Z

    move-result v0

    .line 1441
    invoke-virtual {v4, v0}, Lcom/my/target/core/models/j;->d(Z)V

    .line 1445
    const-string/jumbo v0, "disclaimerBold"

    .line 1446
    invoke-static {v3, v0, p3, v2}, Lcom/my/target/core/parsers/rb/a;->b(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Z)Z

    move-result v0

    .line 1445
    invoke-virtual {v4, v0}, Lcom/my/target/core/models/j;->e(Z)V

    .line 1449
    const-string/jumbo v0, "ctaButtonTextBold"

    .line 1450
    invoke-static {v3, v0, p3, v2}, Lcom/my/target/core/parsers/rb/a;->b(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Z)Z

    move-result v0

    .line 1449
    invoke-virtual {v4, v0}, Lcom/my/target/core/models/j;->f(Z)V

    goto/16 :goto_0

    .line 1371
    :cond_2
    const v0, -0xffab5a

    goto/16 :goto_1

    .line 93
    :cond_3
    const-string/jumbo v0, "instreamads"

    invoke-interface {p0}, Lcom/my/target/core/models/sections/i;->a()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 95
    const-string/jumbo v0, "Parsing video section settings"

    iput-object v0, p3, Lcom/my/target/core/parsers/a$a;->d:Ljava/lang/String;

    .line 98
    invoke-interface {p0}, Lcom/my/target/core/models/sections/i;->e()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0, p3}, Lcom/my/target/core/parsers/rb/a;->b(Lcom/my/target/core/models/sections/i;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;)Lcom/my/target/core/models/sections/f;

    move-result-object v0

    .line 100
    invoke-virtual {v0}, Lcom/my/target/core/models/sections/f;->i()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_4
    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/my/target/core/models/sections/k;

    .line 102
    invoke-virtual {v0}, Lcom/my/target/core/models/sections/k;->e()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 105
    invoke-virtual {v0}, Lcom/my/target/core/models/sections/k;->e()Ljava/lang/String;

    move-result-object v3

    .line 104
    invoke-static {p1, v3, p3, v2}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Z)Lorg/json/JSONObject;

    move-result-object v3

    .line 108
    invoke-virtual {v0}, Lcom/my/target/core/models/sections/k;->k()Lcom/my/target/core/models/l;

    move-result-object v0

    .line 109
    invoke-static {v0, v3, p3}, Lcom/my/target/core/parsers/rb/e;->a(Lcom/my/target/core/models/l;Lorg/json/JSONObject;Lcom/my/target/core/parsers/a$a;)V

    goto :goto_2

    .line 112
    :cond_5
    const-string/jumbo v0, "video"

    invoke-interface {p0}, Lcom/my/target/core/models/sections/i;->a()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 114
    const-string/jumbo v0, "Parsing video section settings"

    iput-object v0, p3, Lcom/my/target/core/parsers/a$a;->d:Ljava/lang/String;

    .line 116
    invoke-interface {p0}, Lcom/my/target/core/models/sections/i;->e()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0, p3}, Lcom/my/target/core/parsers/rb/a;->d(Lcom/my/target/core/models/sections/i;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;)Lcom/my/target/core/models/sections/k;

    move-result-object v0

    .line 118
    if-eqz v0, :cond_0

    .line 120
    invoke-virtual {v0}, Lcom/my/target/core/models/sections/k;->k()Lcom/my/target/core/models/l;

    move-result-object v0

    .line 122
    invoke-static {v0, p1, p3}, Lcom/my/target/core/parsers/rb/e;->a(Lcom/my/target/core/models/l;Lorg/json/JSONObject;Lcom/my/target/core/parsers/a$a;)V

    goto/16 :goto_0

    .line 123
    :cond_6
    const-string/jumbo v0, "fullscreen"

    invoke-interface {p0}, Lcom/my/target/core/models/sections/i;->a()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_a

    .line 125
    const-string/jumbo v0, "Parsing fullscreen section settings"

    iput-object v0, p3, Lcom/my/target/core/parsers/a$a;->d:Ljava/lang/String;

    .line 127
    invoke-interface {p0}, Lcom/my/target/core/models/sections/i;->e()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0, p3}, Lcom/my/target/core/parsers/rb/a;->e(Lcom/my/target/core/models/sections/i;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;)Lcom/my/target/core/models/sections/d;

    move-result-object v0

    .line 130
    if-eqz v0, :cond_0

    .line 132
    const-string/jumbo v1, "close_icon_hd"

    const-string/jumbo v3, ""

    invoke-static {p1, v1, p3, v3, v2}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v1

    .line 134
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_7

    .line 136
    new-instance v3, Lcom/my/target/nativeads/models/ImageData;

    invoke-direct {v3, v1, v2, v2}, Lcom/my/target/nativeads/models/ImageData;-><init>(Ljava/lang/String;II)V

    .line 137
    invoke-virtual {v0, v3}, Lcom/my/target/core/models/sections/d;->a(Lcom/my/target/nativeads/models/ImageData;)V

    .line 140
    :cond_7
    const-string/jumbo v1, "play_icon_hd"

    const-string/jumbo v3, ""

    invoke-static {p1, v1, p3, v3, v2}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v1

    .line 142
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_8

    .line 144
    new-instance v3, Lcom/my/target/nativeads/models/ImageData;

    invoke-direct {v3, v1, v2, v2}, Lcom/my/target/nativeads/models/ImageData;-><init>(Ljava/lang/String;II)V

    .line 145
    invoke-virtual {v0, v3}, Lcom/my/target/core/models/sections/d;->b(Lcom/my/target/nativeads/models/ImageData;)V

    .line 148
    :cond_8
    const-string/jumbo v1, "store_icon_hd"

    const-string/jumbo v3, ""

    invoke-static {p1, v1, p3, v3, v2}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v1

    .line 150
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_9

    .line 152
    new-instance v3, Lcom/my/target/nativeads/models/ImageData;

    invoke-direct {v3, v1, v2, v2}, Lcom/my/target/nativeads/models/ImageData;-><init>(Ljava/lang/String;II)V

    .line 153
    invoke-virtual {v0, v3}, Lcom/my/target/core/models/sections/d;->c(Lcom/my/target/nativeads/models/ImageData;)V

    .line 156
    :cond_9
    const-string/jumbo v1, "extendedClickArea"

    invoke-static {p1, v1, p3, v2}, Lcom/my/target/core/parsers/rb/a;->b(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Z)Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/my/target/core/models/sections/d;->e(Z)V

    .line 159
    const-string/jumbo v1, "closeOnClick"

    invoke-static {p1, v1, p3, v6}, Lcom/my/target/core/parsers/rb/a;->b(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Z)Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/my/target/core/models/sections/d;->d(Z)V

    .line 162
    const-string/jumbo v1, "allowCloseDelay"

    invoke-static {p1, v1, p3, v2, v2}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;IZ)I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Lcom/my/target/core/models/sections/d;->a(F)V

    .line 165
    const-string/jumbo v1, "style"

    invoke-static {p1, v1, p3, v2, v2}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;IZ)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/my/target/core/models/sections/d;->a(I)V

    .line 169
    const-string/jumbo v1, "video"

    invoke-static {p1, v1, p3, v2}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Z)Lorg/json/JSONObject;

    move-result-object v1

    .line 171
    if-eqz v1, :cond_0

    .line 173
    invoke-virtual {v0}, Lcom/my/target/core/models/sections/d;->p()Lcom/my/target/core/models/l;

    move-result-object v3

    const-string/jumbo v4, "allowClose"

    invoke-static {v1, v4, p3, v6}, Lcom/my/target/core/parsers/rb/a;->b(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Z)Z

    move-result v4

    invoke-virtual {v3, v4}, Lcom/my/target/core/models/l;->a(Z)V

    .line 176
    invoke-virtual {v0}, Lcom/my/target/core/models/sections/d;->p()Lcom/my/target/core/models/l;

    move-result-object v3

    const-string/jumbo v4, "allowCloseDelay"

    invoke-static {v1, v4, p3, v2, v2}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;IZ)I

    move-result v4

    int-to-float v4, v4

    invoke-virtual {v3, v4}, Lcom/my/target/core/models/l;->a(F)V

    .line 179
    const-string/jumbo v3, "showPlayerControls"

    invoke-static {v1, v3, p3, v6}, Lcom/my/target/core/parsers/rb/a;->b(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Z)Z

    move-result v3

    invoke-virtual {v0, v3}, Lcom/my/target/core/models/sections/d;->f(Z)V

    .line 182
    const-string/jumbo v3, "replayActionText"

    const-string/jumbo v4, "Replay"

    invoke-static {v1, v3, p3, v4, v2}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/my/target/core/models/sections/d;->d(Ljava/lang/String;)V

    .line 185
    const-string/jumbo v3, "closeActionText"

    const-string/jumbo v4, "Close"

    invoke-static {v1, v3, p3, v4, v2}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/my/target/core/models/sections/d;->c(Ljava/lang/String;)V

    .line 188
    const-string/jumbo v3, "allowBackButton"

    invoke-static {v1, v3, p3, v6}, Lcom/my/target/core/parsers/rb/a;->b(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Z)Z

    move-result v3

    invoke-virtual {v0, v3}, Lcom/my/target/core/models/sections/d;->b(Z)V

    .line 191
    const-string/jumbo v3, "allowReplay"

    invoke-static {v1, v3, p3, v6}, Lcom/my/target/core/parsers/rb/a;->b(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Z)Z

    move-result v3

    invoke-virtual {v0, v3}, Lcom/my/target/core/models/sections/d;->c(Z)V

    .line 194
    const-string/jumbo v3, "automute"

    invoke-static {v1, v3, p3, v2}, Lcom/my/target/core/parsers/rb/a;->b(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Z)Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/my/target/core/models/sections/d;->a(Z)V

    goto/16 :goto_0

    .line 198
    :cond_a
    const-string/jumbo v0, "appwall"

    invoke-interface {p0}, Lcom/my/target/core/models/sections/i;->a()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_b

    .line 200
    const-string/jumbo v0, "Parsing appwall section settings"

    iput-object v0, p3, Lcom/my/target/core/parsers/a$a;->d:Ljava/lang/String;

    .line 202
    invoke-interface {p0}, Lcom/my/target/core/models/sections/i;->e()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0, p3}, Lcom/my/target/core/parsers/rb/a;->g(Lcom/my/target/core/models/sections/i;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;)Lcom/my/target/core/models/sections/b;

    move-result-object v1

    .line 204
    if-eqz v1, :cond_0

    .line 206
    const-string/jumbo v0, "title"

    const-string/jumbo v3, ""

    .line 207
    invoke-static {p1, v0, p3, v3, v2}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    .line 206
    invoke-virtual {v1, v0}, Lcom/my/target/core/models/sections/b;->c(Ljava/lang/String;)V

    .line 209
    const-string/jumbo v0, "icon"

    const-string/jumbo v3, ""

    .line 210
    invoke-static {p1, v0, p3, v3, v2}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    .line 209
    invoke-virtual {v1, v0}, Lcom/my/target/core/models/sections/b;->d(Ljava/lang/String;)V

    .line 212
    const-string/jumbo v0, "icon_hd"

    const-string/jumbo v3, ""

    .line 213
    invoke-static {p1, v0, p3, v3, v2}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    .line 212
    invoke-virtual {v1, v0}, Lcom/my/target/core/models/sections/b;->e(Ljava/lang/String;)V

    .line 215
    const-string/jumbo v0, "bubble_icon"

    const-string/jumbo v3, ""

    .line 216
    invoke-static {p1, v0, p3, v3, v2}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    .line 215
    invoke-virtual {v1, v0}, Lcom/my/target/core/models/sections/b;->f(Ljava/lang/String;)V

    .line 218
    const-string/jumbo v0, "bubble_icon_hd"

    const-string/jumbo v3, ""

    .line 219
    invoke-static {p1, v0, p3, v3, v2}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    .line 218
    invoke-virtual {v1, v0}, Lcom/my/target/core/models/sections/b;->g(Ljava/lang/String;)V

    .line 221
    const-string/jumbo v0, "label_icon"

    const-string/jumbo v3, ""

    .line 222
    invoke-static {p1, v0, p3, v3, v2}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    .line 221
    invoke-virtual {v1, v0}, Lcom/my/target/core/models/sections/b;->h(Ljava/lang/String;)V

    .line 224
    const-string/jumbo v0, "label_icon_hd"

    const-string/jumbo v3, ""

    .line 225
    invoke-static {p1, v0, p3, v3, v2}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    .line 224
    invoke-virtual {v1, v0}, Lcom/my/target/core/models/sections/b;->i(Ljava/lang/String;)V

    .line 227
    const-string/jumbo v0, "goto_app_icon"

    const-string/jumbo v3, ""

    .line 228
    invoke-static {p1, v0, p3, v3, v2}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    .line 227
    invoke-virtual {v1, v0}, Lcom/my/target/core/models/sections/b;->j(Ljava/lang/String;)V

    .line 230
    const-string/jumbo v0, "goto_app_icon_hd"

    const-string/jumbo v3, ""

    .line 231
    invoke-static {p1, v0, p3, v3, v2}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    .line 230
    invoke-virtual {v1, v0}, Lcom/my/target/core/models/sections/b;->k(Ljava/lang/String;)V

    .line 233
    const-string/jumbo v0, "item_highlight_icon"

    const-string/jumbo v3, ""

    .line 234
    invoke-static {p1, v0, p3, v3, v2}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    .line 233
    invoke-virtual {v1, v0}, Lcom/my/target/core/models/sections/b;->l(Ljava/lang/String;)V

    .line 237
    const-string/jumbo v0, "icon_status"

    invoke-static {p1, v0, p3}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;)Lorg/json/JSONArray;

    move-result-object v3

    .line 2302
    const-string/jumbo v0, "Parsing icon statuses"

    iput-object v0, p3, Lcom/my/target/core/parsers/a$a;->d:Ljava/lang/String;

    .line 2304
    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v4

    move v0, v2

    .line 2306
    :goto_3
    if-ge v0, v4, :cond_0

    .line 2308
    const-string/jumbo v5, "icon_status"

    invoke-static {v0, v3, v5, p3}, Lcom/my/target/core/parsers/rb/a;->a(ILorg/json/JSONArray;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;)Lorg/json/JSONObject;

    move-result-object v5

    .line 2311
    const-string/jumbo v6, "value"

    const-string/jumbo v7, ""

    invoke-static {v5, v6, p3, v7, v2}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v6

    .line 2314
    new-instance v7, Lcom/my/target/core/models/g;

    invoke-direct {v7, v6}, Lcom/my/target/core/models/g;-><init>(Ljava/lang/String;)V

    .line 2316
    const-string/jumbo v6, "icon"

    const-string/jumbo v8, ""

    .line 2317
    invoke-static {v5, v6, p3, v8, v2}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v6

    .line 2316
    invoke-virtual {v7, v6}, Lcom/my/target/core/models/g;->a(Ljava/lang/String;)V

    .line 2319
    const-string/jumbo v6, "icon_hd"

    const-string/jumbo v8, ""

    .line 2320
    invoke-static {v5, v6, p3, v8, v2}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v5

    .line 2319
    invoke-virtual {v7, v5}, Lcom/my/target/core/models/g;->b(Ljava/lang/String;)V

    .line 2323
    invoke-virtual {v1, v7}, Lcom/my/target/core/models/sections/b;->a(Lcom/my/target/core/models/g;)Z

    .line 2306
    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    .line 241
    :cond_b
    const-string/jumbo v0, "nativeads"

    invoke-interface {p0}, Lcom/my/target/core/models/sections/i;->a()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_c

    .line 243
    const-string/jumbo v0, "Parsing native section settings"

    iput-object v0, p3, Lcom/my/target/core/parsers/a$a;->d:Ljava/lang/String;

    .line 245
    invoke-interface {p0}, Lcom/my/target/core/models/sections/i;->e()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0, p3}, Lcom/my/target/core/parsers/rb/a;->a(Lcom/my/target/core/models/sections/i;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;)Lcom/my/target/core/models/sections/h;

    move-result-object v0

    .line 248
    if-eqz v0, :cond_0

    .line 250
    const-string/jumbo v1, "video"

    invoke-static {p1, v1, p3, v2}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Z)Lorg/json/JSONObject;

    move-result-object v1

    .line 252
    if-eqz v1, :cond_0

    .line 254
    const-string/jumbo v3, "showPlayerControls"

    invoke-static {v1, v3, p3, v6}, Lcom/my/target/core/parsers/rb/a;->b(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Z)Z

    move-result v3

    invoke-virtual {v0, v3}, Lcom/my/target/core/models/sections/h;->b(Z)V

    .line 257
    const-string/jumbo v3, "replayActionText"

    const-string/jumbo v4, "Replay"

    invoke-static {v1, v3, p3, v4, v2}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/my/target/core/models/sections/h;->d(Ljava/lang/String;)V

    .line 260
    const-string/jumbo v3, "closeActionText"

    const-string/jumbo v4, "Close"

    invoke-static {v1, v3, p3, v4, v2}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/my/target/core/models/sections/h;->c(Ljava/lang/String;)V

    .line 263
    const-string/jumbo v3, "automute"

    invoke-static {v1, v3, p3, v2}, Lcom/my/target/core/parsers/rb/a;->b(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Z)Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/my/target/core/models/sections/h;->a(Z)V

    goto/16 :goto_0

    .line 267
    :cond_c
    const-string/jumbo v0, "fullscreenslider"

    invoke-interface {p0}, Lcom/my/target/core/models/sections/i;->a()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 269
    const-string/jumbo v0, "Parsing fullscreen slider section settings"

    iput-object v0, p3, Lcom/my/target/core/parsers/a$a;->d:Ljava/lang/String;

    .line 271
    invoke-interface {p0}, Lcom/my/target/core/models/sections/i;->e()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0, p3}, Lcom/my/target/core/parsers/rb/a;->f(Lcom/my/target/core/models/sections/i;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;)Lcom/my/target/core/models/sections/e;

    move-result-object v0

    .line 273
    if-eqz v0, :cond_0

    .line 275
    const-string/jumbo v2, "close_icon_hd"

    invoke-static {p1, v2, p3}, Lcom/my/target/core/parsers/rb/a;->c(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;)Lcom/my/target/nativeads/models/ImageData;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/my/target/core/models/sections/e;->a(Lcom/my/target/nativeads/models/ImageData;)V

    .line 278
    const-string/jumbo v2, "backgroundColor"

    const v3, -0xf9c399

    invoke-static {p1, v2, p3, v3}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;I)I

    move-result v2

    .line 283
    or-int/2addr v1, v2

    .line 284
    invoke-virtual {v0, v1}, Lcom/my/target/core/models/sections/e;->b(I)V

    .line 285
    const-string/jumbo v1, "markerColor"

    invoke-static {p1, v1, p3, v7}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;I)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/my/target/core/models/sections/e;->c(I)V

    .line 290
    const-string/jumbo v1, "activeMarkerColor"

    const v2, -0xe0414d

    invoke-static {p1, v1, p3, v2}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;I)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/my/target/core/models/sections/e;->a(I)V

    goto/16 :goto_0
.end method
