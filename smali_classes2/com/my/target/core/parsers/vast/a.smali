.class public final Lcom/my/target/core/parsers/vast/a;
.super Ljava/lang/Object;
.source "VASTConverter.java"


# direct methods
.method private static a(Ljava/lang/String;Lcom/my/target/core/parsers/a$a;)F
    .locals 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NumberFormatException;
        }
    .end annotation

    .prologue
    const-wide/16 v12, 0x3e8

    const-wide/16 v10, 0x3c

    .line 419
    const-wide/16 v2, 0x0

    .line 424
    const/high16 v0, -0x40800000    # -1.0f

    .line 428
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    .line 430
    const-string/jumbo v4, "."

    invoke-virtual {p0, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 432
    const-string/jumbo v1, "."

    invoke-virtual {p0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    .line 433
    const-string/jumbo v2, "."

    invoke-virtual {p0, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    add-int/lit8 v2, v2, 0x1

    invoke-virtual {p0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    .line 434
    invoke-static {v2}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v2

    .line 437
    :cond_0
    const-string/jumbo v4, ":"

    .line 438
    invoke-virtual {p0, v4}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v4

    add-int/lit8 v4, v4, 0x1

    invoke-virtual {p0, v4, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 439
    invoke-static {v1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v4

    .line 441
    const-string/jumbo v1, ":"

    .line 442
    invoke-virtual {p0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    const-string/jumbo v6, ":"

    invoke-virtual {p0, v6}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v6

    invoke-virtual {p0, v1, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 443
    invoke-static {v1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v6

    .line 445
    const/4 v1, 0x0

    const-string/jumbo v8, ":"

    invoke-virtual {p0, v8}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v8

    invoke-virtual {p0, v1, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 446
    invoke-static {v1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v8

    .line 448
    mul-long/2addr v4, v12

    add-long/2addr v2, v4

    mul-long v4, v6, v10

    mul-long/2addr v4, v12

    add-long/2addr v2, v4

    mul-long v4, v8, v10

    mul-long/2addr v4, v10

    mul-long/2addr v4, v12

    add-long/2addr v2, v4

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    .line 451
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v0

    long-to-float v0, v0

    const/high16 v1, 0x447a0000    # 1000.0f

    div-float/2addr v0, v1

    .line 460
    :goto_0
    return v0

    .line 454
    :catch_0
    move-exception v1

    new-instance v1, Ljava/lang/StringBuilder;

    const-string/jumbo v2, "Failed to convert ISO time string "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    .line 455
    new-instance v1, Ljava/lang/StringBuilder;

    const-string/jumbo v2, "Failed to convert ISO time string: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, "Time format convert exception"

    invoke-static {v1, p1, v2}, Lcom/my/target/core/parsers/a;->b(Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/String;)V

    goto :goto_0
.end method

.method private static a(Ljava/lang/String;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;)Lcom/my/target/core/models/i;
    .locals 3

    .prologue
    .line 469
    new-instance v0, Lcom/my/target/core/models/i;

    const-string/jumbo v1, "playheadReachedValue"

    invoke-direct {v0, v1, p1}, Lcom/my/target/core/models/i;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 471
    invoke-static {p0, p2}, Lcom/my/target/core/parsers/vast/a;->a(Ljava/lang/String;Lcom/my/target/core/parsers/a$a;)F

    move-result v1

    .line 473
    const/4 v2, 0x0

    cmpl-float v2, v1, v2

    if-ltz v2, :cond_0

    .line 474
    invoke-virtual {v0, v1}, Lcom/my/target/core/models/i;->a(F)V

    .line 478
    :goto_0
    return-object v0

    .line 476
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static a(Ljava/lang/String;Ljava/lang/String;F)Lcom/my/target/core/models/k;
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 58
    const-string/jumbo v0, "start"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 60
    new-instance v0, Lcom/my/target/core/models/k;

    const-string/jumbo v1, "playbackStarted"

    invoke-direct {v0, v1, p1}, Lcom/my/target/core/models/k;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 129
    :goto_0
    return-object v0

    .line 61
    :cond_0
    const-string/jumbo v0, "firstQuartile"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 63
    new-instance v0, Lcom/my/target/core/models/i;

    const-string/jumbo v1, "playheadReachedValue"

    invoke-direct {v0, v1, p1}, Lcom/my/target/core/models/i;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 64
    cmpl-float v1, p2, v2

    if-lez v1, :cond_1

    const/high16 v1, 0x3e800000    # 0.25f

    mul-float/2addr v1, p2

    invoke-virtual {v0, v1}, Lcom/my/target/core/models/i;->a(F)V

    goto :goto_0

    .line 67
    :cond_1
    const/high16 v1, 0x41c80000    # 25.0f

    invoke-virtual {v0, v1}, Lcom/my/target/core/models/i;->b(F)V

    goto :goto_0

    .line 70
    :cond_2
    const-string/jumbo v0, "midpoint"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 72
    new-instance v0, Lcom/my/target/core/models/i;

    const-string/jumbo v1, "playheadReachedValue"

    invoke-direct {v0, v1, p1}, Lcom/my/target/core/models/i;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 73
    cmpl-float v1, p2, v2

    if-lez v1, :cond_3

    const/high16 v1, 0x3f000000    # 0.5f

    mul-float/2addr v1, p2

    invoke-virtual {v0, v1}, Lcom/my/target/core/models/i;->a(F)V

    goto :goto_0

    .line 76
    :cond_3
    const/high16 v1, 0x42480000    # 50.0f

    invoke-virtual {v0, v1}, Lcom/my/target/core/models/i;->b(F)V

    goto :goto_0

    .line 79
    :cond_4
    const-string/jumbo v0, "thirdQuartile"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 81
    new-instance v0, Lcom/my/target/core/models/i;

    const-string/jumbo v1, "playheadReachedValue"

    invoke-direct {v0, v1, p1}, Lcom/my/target/core/models/i;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 82
    cmpl-float v1, p2, v2

    if-lez v1, :cond_5

    const/high16 v1, 0x3f400000    # 0.75f

    mul-float/2addr v1, p2

    invoke-virtual {v0, v1}, Lcom/my/target/core/models/i;->a(F)V

    goto :goto_0

    .line 85
    :cond_5
    const/high16 v1, 0x42960000    # 75.0f

    invoke-virtual {v0, v1}, Lcom/my/target/core/models/i;->b(F)V

    goto :goto_0

    .line 88
    :cond_6
    const-string/jumbo v0, "complete"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_8

    .line 90
    new-instance v0, Lcom/my/target/core/models/i;

    const-string/jumbo v1, "playheadReachedValue"

    invoke-direct {v0, v1, p1}, Lcom/my/target/core/models/i;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 91
    cmpl-float v1, p2, v2

    if-lez v1, :cond_7

    invoke-virtual {v0, p2}, Lcom/my/target/core/models/i;->a(F)V

    goto :goto_0

    .line 94
    :cond_7
    const/high16 v1, 0x42c80000    # 100.0f

    invoke-virtual {v0, v1}, Lcom/my/target/core/models/i;->b(F)V

    goto/16 :goto_0

    .line 97
    :cond_8
    const-string/jumbo v0, "creativeView"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_9

    .line 99
    new-instance v0, Lcom/my/target/core/models/k;

    const-string/jumbo v1, "playbackStarted"

    invoke-direct {v0, v1, p1}, Lcom/my/target/core/models/k;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 100
    :cond_9
    const-string/jumbo v0, "mute"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_a

    .line 102
    new-instance v0, Lcom/my/target/core/models/k;

    const-string/jumbo v1, "volumeOff"

    invoke-direct {v0, v1, p1}, Lcom/my/target/core/models/k;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 103
    :cond_a
    const-string/jumbo v0, "unmute"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_b

    .line 105
    new-instance v0, Lcom/my/target/core/models/k;

    const-string/jumbo v1, "volumeOn"

    invoke-direct {v0, v1, p1}, Lcom/my/target/core/models/k;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 106
    :cond_b
    const-string/jumbo v0, "pause"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_c

    .line 108
    new-instance v0, Lcom/my/target/core/models/k;

    const-string/jumbo v1, "playbackPaused"

    invoke-direct {v0, v1, p1}, Lcom/my/target/core/models/k;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 109
    :cond_c
    const-string/jumbo v0, "resume"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_d

    .line 111
    new-instance v0, Lcom/my/target/core/models/k;

    const-string/jumbo v1, "playbackResumed"

    invoke-direct {v0, v1, p1}, Lcom/my/target/core/models/k;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 112
    :cond_d
    const-string/jumbo v0, "fullscreen"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_e

    .line 114
    new-instance v0, Lcom/my/target/core/models/k;

    const-string/jumbo v1, "fullscreenOn"

    invoke-direct {v0, v1, p1}, Lcom/my/target/core/models/k;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 115
    :cond_e
    const-string/jumbo v0, "exitFullscreen"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_f

    .line 117
    new-instance v0, Lcom/my/target/core/models/k;

    const-string/jumbo v1, "fullscreenOff"

    invoke-direct {v0, v1, p1}, Lcom/my/target/core/models/k;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 118
    :cond_f
    const-string/jumbo v0, "skip"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_10

    .line 120
    new-instance v0, Lcom/my/target/core/models/k;

    const-string/jumbo v1, "closedByUser"

    invoke-direct {v0, v1, p1}, Lcom/my/target/core/models/k;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 121
    :cond_10
    const-string/jumbo v0, "error"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_11

    .line 123
    new-instance v0, Lcom/my/target/core/models/k;

    const-string/jumbo v1, "error"

    invoke-direct {v0, v1, p1}, Lcom/my/target/core/models/k;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 124
    :cond_11
    const-string/jumbo v0, "ClickTracking"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_12

    .line 126
    new-instance v0, Lcom/my/target/core/models/k;

    const-string/jumbo v1, "click"

    invoke-direct {v0, v1, p1}, Lcom/my/target/core/models/k;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 129
    :cond_12
    const/4 v0, 0x0

    goto/16 :goto_0
.end method

.method public static a(Lcom/my/target/core/models/c;Lcom/my/target/core/parsers/vast/c;Lcom/my/target/core/a;Lcom/my/target/core/models/d;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;)Lcom/my/target/core/models/sections/i;
    .locals 16

    .prologue
    .line 235
    invoke-virtual/range {p2 .. p2}, Lcom/my/target/core/a;->c()Ljava/lang/String;

    move-result-object v2

    const-string/jumbo v3, "instreamaudioads"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_d

    .line 237
    const/4 v2, 0x0

    .line 238
    const-string/jumbo v3, "instreamaudioads"

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lcom/my/target/core/models/c;->c(Ljava/lang/String;)Lcom/my/target/core/models/sections/i;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 240
    const-string/jumbo v3, "instreamaudioads"

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lcom/my/target/core/models/c;->c(Ljava/lang/String;)Lcom/my/target/core/models/sections/i;

    move-result-object v3

    .line 241
    instance-of v4, v3, Lcom/my/target/core/models/sections/g;

    if-eqz v4, :cond_1f

    move-object v2, v3

    .line 243
    check-cast v2, Lcom/my/target/core/models/sections/g;

    .line 245
    move-object/from16 v0, p4

    invoke-virtual {v2, v0}, Lcom/my/target/core/models/sections/g;->c(Ljava/lang/String;)Lcom/my/target/core/models/sections/c;

    move-result-object v2

    move-object v6, v2

    move-object v5, v3

    .line 259
    :goto_0
    if-eqz v6, :cond_c

    .line 261
    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/my/target/core/parsers/vast/c;->b:Ljava/util/ArrayList;

    move-object/from16 v0, p1

    iget-object v7, v0, Lcom/my/target/core/parsers/vast/c;->c:Ljava/util/ArrayList;

    move-object/from16 v0, p1

    iget-object v8, v0, Lcom/my/target/core/parsers/vast/c;->d:Ljava/lang/String;

    .line 1141
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :cond_0
    :goto_1
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_b

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/my/target/core/parsers/vast/b;

    .line 1144
    iget-object v4, v2, Lcom/my/target/core/parsers/vast/b;->d:Ljava/util/ArrayList;

    .line 1207
    if-eqz v4, :cond_2

    invoke-virtual {v4}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_2

    .line 1209
    const/4 v3, 0x0

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/my/target/core/parsers/vast/b$a;

    .line 1210
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v10

    const/4 v11, 0x1

    if-le v10, v11, :cond_3

    iget-object v10, v3, Lcom/my/target/core/parsers/vast/b$a;->b:Ljava/lang/String;

    const-string/jumbo v11, "mp3"

    invoke-virtual {v10, v11}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v10

    if-nez v10, :cond_3

    .line 1212
    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v10

    move-object v4, v3

    :goto_2
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1e

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/my/target/core/parsers/vast/b$a;

    .line 1214
    iget-object v11, v3, Lcom/my/target/core/parsers/vast/b$a;->b:Ljava/lang/String;

    const-string/jumbo v12, "mp3"

    invoke-virtual {v11, v12}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v11

    if-eqz v11, :cond_1d

    :goto_3
    move-object v4, v3

    .line 1218
    goto :goto_2

    .line 249
    :cond_1
    const-string/jumbo v3, "instreamaudioads"

    const/4 v4, 0x0

    invoke-static {v3, v4}, Lcom/my/target/core/factories/e;->a(Ljava/lang/String;I)Lcom/my/target/core/models/sections/i;

    move-result-object v3

    .line 250
    if-eqz v3, :cond_1f

    .line 252
    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lcom/my/target/core/models/c;->a(Lcom/my/target/core/models/sections/i;)Z

    move-object v2, v3

    .line 253
    check-cast v2, Lcom/my/target/core/models/sections/g;

    .line 255
    move-object/from16 v0, p4

    invoke-virtual {v2, v0}, Lcom/my/target/core/models/sections/g;->c(Ljava/lang/String;)Lcom/my/target/core/models/sections/c;

    move-result-object v2

    move-object v6, v2

    move-object v5, v3

    goto :goto_0

    .line 1222
    :cond_2
    const/4 v3, 0x0

    .line 1146
    :cond_3
    :goto_4
    iget-object v4, v2, Lcom/my/target/core/parsers/vast/b;->a:Ljava/lang/String;

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 1148
    iget-object v4, v2, Lcom/my/target/core/parsers/vast/b;->c:Ljava/lang/String;

    move-object/from16 v0, p5

    invoke-static {v4, v0}, Lcom/my/target/core/parsers/vast/a;->a(Ljava/lang/String;Lcom/my/target/core/parsers/a$a;)F

    move-result v10

    .line 1149
    const/4 v4, 0x0

    cmpg-float v4, v10, v4

    if-lez v4, :cond_0

    .line 1151
    const/4 v4, 0x0

    .line 1153
    if-eqz v3, :cond_1c

    .line 1155
    new-instance v4, Lcom/my/target/core/models/e;

    iget-object v11, v3, Lcom/my/target/core/parsers/vast/b$a;->a:Ljava/lang/String;

    invoke-direct {v4, v11}, Lcom/my/target/core/models/e;-><init>(Ljava/lang/String;)V

    .line 1156
    iget v3, v3, Lcom/my/target/core/parsers/vast/b$a;->e:I

    invoke-virtual {v4, v3}, Lcom/my/target/core/models/e;->a(I)V

    move-object v3, v4

    .line 1158
    :goto_5
    if-eqz v3, :cond_0

    .line 1160
    iget-object v4, v2, Lcom/my/target/core/parsers/vast/b;->a:Ljava/lang/String;

    .line 1161
    invoke-static {v4}, Lcom/my/target/core/factories/a;->b(Ljava/lang/String;)Lcom/my/target/core/models/banners/c;

    move-result-object v11

    .line 1162
    invoke-virtual {v11, v3}, Lcom/my/target/core/models/banners/c;->a(Lcom/my/target/core/models/e;)V

    .line 1164
    invoke-virtual {v11, v10}, Lcom/my/target/core/models/banners/c;->a(F)V

    .line 1165
    invoke-virtual {v11, v8}, Lcom/my/target/core/models/banners/c;->setCtaText(Ljava/lang/String;)V

    .line 1166
    iget-object v3, v2, Lcom/my/target/core/parsers/vast/b;->g:Ljava/lang/String;

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_4

    .line 1167
    iget-object v3, v2, Lcom/my/target/core/parsers/vast/b;->g:Ljava/lang/String;

    invoke-static {v3}, Lcom/my/target/core/parsers/vast/a;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v11, v3}, Lcom/my/target/core/models/banners/c;->setTrackingLink(Ljava/lang/String;)V

    .line 1169
    :cond_4
    iget-object v3, v2, Lcom/my/target/core/parsers/vast/b;->f:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :cond_5
    :goto_6
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_6

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/util/Pair;

    .line 1171
    iget-object v4, v3, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v4, Ljava/lang/String;

    iget-object v3, v3, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v3, Ljava/lang/String;

    .line 1172
    invoke-static {v4, v3, v10}, Lcom/my/target/core/parsers/vast/a;->a(Ljava/lang/String;Ljava/lang/String;F)Lcom/my/target/core/models/k;

    move-result-object v3

    .line 1175
    if-eqz v3, :cond_5

    .line 1176
    invoke-virtual {v11, v3}, Lcom/my/target/core/models/banners/c;->addStat(Lcom/my/target/core/models/k;)Z

    goto :goto_6

    .line 1179
    :cond_6
    iget-object v2, v2, Lcom/my/target/core/parsers/vast/b;->e:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_7
    :goto_7
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_8

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/util/Pair;

    .line 1181
    iget-object v3, v2, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v3, Ljava/lang/String;

    iget-object v2, v2, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v2, Ljava/lang/String;

    .line 1182
    move-object/from16 v0, p5

    invoke-static {v3, v2, v0}, Lcom/my/target/core/parsers/vast/a;->a(Ljava/lang/String;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;)Lcom/my/target/core/models/i;

    move-result-object v2

    .line 1185
    if-eqz v2, :cond_7

    .line 1186
    invoke-virtual {v11, v2}, Lcom/my/target/core/models/banners/c;->addStat(Lcom/my/target/core/models/k;)Z

    goto :goto_7

    .line 1190
    :cond_8
    invoke-virtual/range {p3 .. p3}, Lcom/my/target/core/models/d;->a()Ljava/util/ArrayList;

    move-result-object v2

    invoke-static {v2, v10}, Lcom/my/target/core/parsers/vast/a;->a(Ljava/util/ArrayList;F)Ljava/util/ArrayList;

    move-result-object v2

    .line 1192
    invoke-virtual {v11, v2}, Lcom/my/target/core/models/banners/c;->addStats(Ljava/util/ArrayList;)V

    .line 1194
    invoke-virtual/range {p3 .. p3}, Lcom/my/target/core/models/d;->b()Ljava/util/ArrayList;

    move-result-object v2

    if-eqz v2, :cond_9

    .line 1195
    invoke-virtual/range {p3 .. p3}, Lcom/my/target/core/models/d;->b()Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v11, v2}, Lcom/my/target/core/models/banners/c;->b(Ljava/util/ArrayList;)V

    .line 1196
    :cond_9
    if-eqz v7, :cond_a

    .line 1197
    invoke-virtual {v11, v7}, Lcom/my/target/core/models/banners/c;->b(Ljava/util/ArrayList;)V

    .line 1199
    :cond_a
    invoke-virtual {v6, v11}, Lcom/my/target/core/models/sections/c;->a(Lcom/my/target/core/models/banners/d;)Z

    goto/16 :goto_1

    .line 267
    :cond_b
    invoke-virtual/range {p3 .. p3}, Lcom/my/target/core/models/d;->j()Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v6, v2}, Lcom/my/target/core/models/sections/c;->a(Ljava/util/List;)V

    .line 268
    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/my/target/core/parsers/vast/c;->a:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_8
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_c

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 270
    new-instance v4, Lcom/my/target/core/models/k;

    const-string/jumbo v7, "impression"

    invoke-direct {v4, v7, v2}, Lcom/my/target/core/models/k;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v6, v4}, Lcom/my/target/core/models/sections/c;->a(Lcom/my/target/core/models/k;)Z

    goto :goto_8

    :cond_c
    move-object v2, v5

    .line 311
    :goto_9
    return-object v2

    .line 275
    :cond_d
    const/4 v2, 0x0

    .line 276
    const-string/jumbo v3, "instreamads"

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lcom/my/target/core/models/c;->c(Ljava/lang/String;)Lcom/my/target/core/models/sections/i;

    move-result-object v3

    if-eqz v3, :cond_13

    .line 278
    const-string/jumbo v3, "instreamads"

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lcom/my/target/core/models/c;->c(Ljava/lang/String;)Lcom/my/target/core/models/sections/i;

    move-result-object v3

    .line 279
    instance-of v4, v3, Lcom/my/target/core/models/sections/f;

    if-eqz v4, :cond_1b

    move-object v2, v3

    .line 281
    check-cast v2, Lcom/my/target/core/models/sections/f;

    .line 283
    move-object/from16 v0, p4

    invoke-virtual {v2, v0}, Lcom/my/target/core/models/sections/f;->c(Ljava/lang/String;)Lcom/my/target/core/models/sections/k;

    move-result-object v2

    move-object v6, v2

    move-object v5, v3

    .line 296
    :goto_a
    if-eqz v6, :cond_1a

    .line 298
    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/my/target/core/parsers/vast/c;->b:Ljava/util/ArrayList;

    move-object/from16 v0, p1

    iget-object v7, v0, Lcom/my/target/core/parsers/vast/c;->d:Ljava/lang/String;

    .line 1322
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :cond_e
    :goto_b
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_19

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/my/target/core/parsers/vast/b;

    .line 1324
    iget-object v3, v2, Lcom/my/target/core/parsers/vast/b;->a:Ljava/lang/String;

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_e

    .line 1325
    iget-object v3, v2, Lcom/my/target/core/parsers/vast/b;->a:Ljava/lang/String;

    .line 1326
    invoke-static {v3}, Lcom/my/target/core/factories/a;->a(Ljava/lang/String;)Lcom/my/target/core/models/banners/m;

    move-result-object v9

    .line 1328
    iget-object v3, v2, Lcom/my/target/core/parsers/vast/b;->c:Ljava/lang/String;

    move-object/from16 v0, p5

    invoke-static {v3, v0}, Lcom/my/target/core/parsers/vast/a;->a(Ljava/lang/String;Lcom/my/target/core/parsers/a$a;)F

    move-result v10

    .line 1329
    const/4 v3, 0x0

    cmpg-float v3, v10, v3

    if-lez v3, :cond_e

    .line 1330
    invoke-virtual {v9, v10}, Lcom/my/target/core/models/banners/m;->c(F)V

    .line 1331
    invoke-virtual {v9, v7}, Lcom/my/target/core/models/banners/m;->setCtaText(Ljava/lang/String;)V

    .line 1332
    iget-object v3, v2, Lcom/my/target/core/parsers/vast/b;->g:Ljava/lang/String;

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_f

    .line 1333
    iget-object v3, v2, Lcom/my/target/core/parsers/vast/b;->g:Ljava/lang/String;

    invoke-static {v3}, Lcom/my/target/core/parsers/vast/a;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v9, v3}, Lcom/my/target/core/models/banners/m;->setTrackingLink(Ljava/lang/String;)V

    .line 1335
    :cond_f
    iget-object v3, v2, Lcom/my/target/core/parsers/vast/b;->b:Ljava/lang/String;

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_11

    .line 1337
    const/4 v3, 0x1

    invoke-virtual {v9, v3}, Lcom/my/target/core/models/banners/m;->d(Z)V

    .line 1338
    const/high16 v3, -0x40800000    # -1.0f

    .line 1339
    iget-object v4, v2, Lcom/my/target/core/parsers/vast/b;->b:Ljava/lang/String;

    const-string/jumbo v11, "%"

    invoke-virtual {v4, v11}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_14

    .line 1341
    iget-object v3, v2, Lcom/my/target/core/parsers/vast/b;->b:Ljava/lang/String;

    const/4 v4, 0x0

    iget-object v11, v2, Lcom/my/target/core/parsers/vast/b;->b:Ljava/lang/String;

    .line 1342
    invoke-virtual {v11}, Ljava/lang/String;->length()I

    move-result v11

    add-int/lit8 v11, v11, -0x1

    .line 1341
    invoke-virtual {v3, v4, v11}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    .line 1343
    new-instance v4, Ljava/lang/StringBuilder;

    const-string/jumbo v11, "Linear skipoffset is "

    invoke-direct {v4, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v11, v2, Lcom/my/target/core/parsers/vast/b;->b:Ljava/lang/String;

    invoke-virtual {v4, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v11, " [%]"

    invoke-virtual {v4, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    .line 1345
    float-to-double v12, v10

    const-wide/high16 v14, 0x4059000000000000L    # 100.0

    div-double/2addr v12, v14

    int-to-double v14, v3

    mul-double/2addr v12, v14

    double-to-float v3, v12

    .line 1352
    :cond_10
    :goto_c
    const/4 v4, 0x0

    cmpl-float v4, v3, v4

    if-lez v4, :cond_11

    .line 1353
    invoke-virtual {v9, v3}, Lcom/my/target/core/models/banners/m;->d(F)V

    .line 1356
    :cond_11
    iget-object v3, v2, Lcom/my/target/core/parsers/vast/b;->f:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :cond_12
    :goto_d
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_15

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/util/Pair;

    .line 1358
    iget-object v4, v3, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v4, Ljava/lang/String;

    iget-object v3, v3, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v3, Ljava/lang/String;

    .line 1359
    invoke-static {v4, v3, v10}, Lcom/my/target/core/parsers/vast/a;->a(Ljava/lang/String;Ljava/lang/String;F)Lcom/my/target/core/models/k;

    move-result-object v3

    .line 1362
    if-eqz v3, :cond_12

    .line 1363
    invoke-virtual {v9, v3}, Lcom/my/target/core/models/banners/m;->addStat(Lcom/my/target/core/models/k;)Z

    goto :goto_d

    .line 287
    :cond_13
    const-string/jumbo v3, "instreamads"

    const/4 v4, 0x0

    invoke-static {v3, v4}, Lcom/my/target/core/factories/e;->a(Ljava/lang/String;I)Lcom/my/target/core/models/sections/i;

    move-result-object v3

    .line 288
    if-eqz v3, :cond_1b

    .line 290
    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lcom/my/target/core/models/c;->a(Lcom/my/target/core/models/sections/i;)Z

    move-object v2, v3

    .line 291
    check-cast v2, Lcom/my/target/core/models/sections/f;

    .line 293
    move-object/from16 v0, p4

    invoke-virtual {v2, v0}, Lcom/my/target/core/models/sections/f;->c(Ljava/lang/String;)Lcom/my/target/core/models/sections/k;

    move-result-object v2

    move-object v6, v2

    move-object v5, v3

    goto/16 :goto_a

    .line 1346
    :cond_14
    iget-object v4, v2, Lcom/my/target/core/parsers/vast/b;->b:Ljava/lang/String;

    if-eqz v4, :cond_10

    iget-object v4, v2, Lcom/my/target/core/parsers/vast/b;->b:Ljava/lang/String;

    const-string/jumbo v11, ":"

    .line 1347
    invoke-virtual {v4, v11}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_10

    .line 1349
    iget-object v3, v2, Lcom/my/target/core/parsers/vast/b;->b:Ljava/lang/String;

    move-object/from16 v0, p5

    invoke-static {v3, v0}, Lcom/my/target/core/parsers/vast/a;->a(Ljava/lang/String;Lcom/my/target/core/parsers/a$a;)F

    move-result v3

    goto :goto_c

    .line 1366
    :cond_15
    iget-object v3, v2, Lcom/my/target/core/parsers/vast/b;->e:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :cond_16
    :goto_e
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_17

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/util/Pair;

    .line 1368
    iget-object v4, v3, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v4, Ljava/lang/String;

    iget-object v3, v3, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v3, Ljava/lang/String;

    .line 1369
    move-object/from16 v0, p5

    invoke-static {v4, v3, v0}, Lcom/my/target/core/parsers/vast/a;->a(Ljava/lang/String;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;)Lcom/my/target/core/models/i;

    move-result-object v3

    .line 1372
    if-eqz v3, :cond_16

    .line 1373
    invoke-virtual {v9, v3}, Lcom/my/target/core/models/banners/m;->addStat(Lcom/my/target/core/models/k;)Z

    goto :goto_e

    .line 1377
    :cond_17
    invoke-virtual/range {p3 .. p3}, Lcom/my/target/core/models/d;->a()Ljava/util/ArrayList;

    move-result-object v3

    invoke-static {v3, v10}, Lcom/my/target/core/parsers/vast/a;->a(Ljava/util/ArrayList;F)Ljava/util/ArrayList;

    move-result-object v3

    .line 1379
    invoke-virtual {v9, v3}, Lcom/my/target/core/models/banners/m;->addStats(Ljava/util/ArrayList;)V

    .line 1381
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 1382
    iget-object v2, v2, Lcom/my/target/core/parsers/vast/b;->d:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_f
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_18

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/my/target/core/parsers/vast/b$a;

    .line 1384
    new-instance v10, Lcom/my/target/nativeads/models/VideoData;

    iget-object v11, v2, Lcom/my/target/core/parsers/vast/b$a;->a:Ljava/lang/String;

    invoke-direct {v10, v11}, Lcom/my/target/nativeads/models/VideoData;-><init>(Ljava/lang/String;)V

    .line 1385
    iget v11, v2, Lcom/my/target/core/parsers/vast/b$a;->c:I

    invoke-virtual {v10, v11}, Lcom/my/target/nativeads/models/VideoData;->setWidth(I)V

    .line 1386
    iget v11, v2, Lcom/my/target/core/parsers/vast/b$a;->d:I

    invoke-virtual {v10, v11}, Lcom/my/target/nativeads/models/VideoData;->setHeight(I)V

    .line 1387
    iget v2, v2, Lcom/my/target/core/parsers/vast/b$a;->e:I

    invoke-virtual {v10, v2}, Lcom/my/target/nativeads/models/VideoData;->setBitrate(I)V

    .line 1388
    invoke-virtual {v3, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_f

    .line 1390
    :cond_18
    invoke-virtual {v3}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_e

    .line 1391
    invoke-virtual {v9, v3}, Lcom/my/target/core/models/banners/m;->a(Ljava/util/List;)V

    .line 1392
    invoke-virtual {v6, v9}, Lcom/my/target/core/models/sections/k;->a(Lcom/my/target/core/models/banners/d;)Z

    goto/16 :goto_b

    .line 303
    :cond_19
    invoke-virtual/range {p3 .. p3}, Lcom/my/target/core/models/d;->j()Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v6, v2}, Lcom/my/target/core/models/sections/k;->a(Ljava/util/List;)V

    .line 304
    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/my/target/core/parsers/vast/c;->a:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_10
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1a

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 306
    new-instance v4, Lcom/my/target/core/models/k;

    const-string/jumbo v7, "impression"

    invoke-direct {v4, v7, v2}, Lcom/my/target/core/models/k;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v6, v4}, Lcom/my/target/core/models/sections/k;->a(Lcom/my/target/core/models/k;)Z

    goto :goto_10

    :cond_1a
    move-object v2, v5

    goto/16 :goto_9

    :cond_1b
    move-object v6, v2

    move-object v5, v3

    goto/16 :goto_a

    :cond_1c
    move-object v3, v4

    goto/16 :goto_5

    :cond_1d
    move-object v3, v4

    goto/16 :goto_3

    :cond_1e
    move-object v3, v4

    goto/16 :goto_4

    :cond_1f
    move-object v6, v2

    move-object v5, v3

    goto/16 :goto_0
.end method

.method public static a(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .prologue
    .line 51
    const-string/jumbo v0, "&amp;"

    const-string/jumbo v1, "&"

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "&lt;"

    const-string/jumbo v2, "<"

    .line 52
    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "&gt;"

    const-string/jumbo v2, ">"

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 51
    return-object v0
.end method

.method private static a(Ljava/util/ArrayList;F)Ljava/util/ArrayList;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/my/target/core/models/k;",
            ">;F)",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/my/target/core/models/k;",
            ">;"
        }
    .end annotation

    .prologue
    .line 399
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/my/target/core/models/k;

    .line 401
    const-string/jumbo v1, "playheadReachedValue"

    invoke-virtual {v0}, Lcom/my/target/core/models/k;->c()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    move-object v1, v0

    .line 403
    check-cast v1, Lcom/my/target/core/models/i;

    invoke-virtual {v1}, Lcom/my/target/core/models/i;->b()F

    move-result v1

    .line 404
    const/4 v3, 0x0

    cmpl-float v3, v1, v3

    if-lez v3, :cond_0

    .line 406
    check-cast v0, Lcom/my/target/core/models/i;

    float-to-double v4, p1

    const-wide/high16 v6, 0x4059000000000000L    # 100.0

    div-double/2addr v4, v6

    float-to-double v6, v1

    mul-double/2addr v4, v6

    double-to-float v1, v4

    invoke-virtual {v0, v1}, Lcom/my/target/core/models/i;->a(F)V

    goto :goto_0

    .line 411
    :cond_1
    return-object p0
.end method
