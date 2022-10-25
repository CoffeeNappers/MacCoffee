.class public final Lcom/my/target/core/async/a;
.super Ljava/lang/Object;
.source "Sender.java"


# static fields
.field public static a:Z

.field private static b:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 26
    const/4 v0, 0x1

    sput-boolean v0, Lcom/my/target/core/async/a;->a:Z

    return-void
.end method

.method public static a(Lcom/my/target/core/models/k;Landroid/content/Context;)V
    .locals 3

    .prologue
    .line 62
    instance-of v0, p0, Lcom/my/target/core/models/i;

    if-eqz v0, :cond_0

    .line 63
    invoke-virtual {p0}, Lcom/my/target/core/models/k;->d()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Lcom/my/target/core/models/k;->c()Ljava/lang/String;

    move-result-object v1

    check-cast p0, Lcom/my/target/core/models/i;

    invoke-virtual {p0}, Lcom/my/target/core/models/i;->a()F

    move-result v2

    invoke-static {v0, v1, v2, p1}, Lcom/my/target/core/async/a;->a(Ljava/lang/String;Ljava/lang/String;FLandroid/content/Context;)V

    .line 65
    :goto_0
    return-void

    .line 64
    :cond_0
    invoke-virtual {p0}, Lcom/my/target/core/models/k;->d()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Lcom/my/target/core/models/k;->c()Ljava/lang/String;

    move-result-object v1

    const/high16 v2, -0x40800000    # -1.0f

    invoke-static {v0, v1, v2, p1}, Lcom/my/target/core/async/a;->a(Ljava/lang/String;Ljava/lang/String;FLandroid/content/Context;)V

    goto :goto_0
.end method

.method public static a(Ljava/lang/String;Landroid/content/Context;)V
    .locals 2

    .prologue
    .line 57
    const/4 v0, 0x0

    const/high16 v1, -0x40800000    # -1.0f

    invoke-static {p0, v0, v1, p1}, Lcom/my/target/core/async/a;->a(Ljava/lang/String;Ljava/lang/String;FLandroid/content/Context;)V

    .line 58
    return-void
.end method

.method private static a(Ljava/lang/String;Ljava/lang/String;FLandroid/content/Context;)V
    .locals 3

    .prologue
    .line 42
    :try_start_0
    const-string/jumbo v0, "UTF-8"

    invoke-static {p0, v0}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object p0

    .line 47
    :goto_0
    if-eqz p0, :cond_1

    invoke-static {p0}, Landroid/webkit/URLUtil;->isNetworkUrl(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 49
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "add stat type: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const/high16 v0, -0x40800000    # -1.0f

    cmpl-float v0, p2, v0

    if-nez v0, :cond_0

    const-string/jumbo v0, ""

    :goto_1
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, " url: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    .line 50
    invoke-static {p0, p3}, Lcom/my/target/core/factories/b;->a(Ljava/lang/String;Landroid/content/Context;)Lcom/my/target/core/async/commands/b;

    move-result-object v0

    invoke-interface {v0}, Lcom/my/target/core/async/commands/b;->b()V

    .line 53
    :goto_2
    return-void

    .line 45
    :catch_0
    move-exception v0

    :goto_3
    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    goto :goto_0

    .line 49
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v2, " value: "

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    .line 52
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "invalid stat url: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    goto :goto_2

    .line 45
    :catch_1
    move-exception v0

    goto :goto_3
.end method

.method public static a(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Landroid/content/Context;)V
    .locals 7

    .prologue
    .line 104
    sget-boolean v0, Lcom/my/target/core/async/a;->a:Z

    if-nez v0, :cond_0

    .line 108
    :goto_0
    return-void

    .line 105
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "add log message level: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    .line 106
    const/4 v4, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move-object v3, p3

    move-object v5, p4

    move-object v6, p5

    invoke-static/range {v0 .. v6}, Lcom/my/target/core/factories/b;->a(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/Throwable;Ljava/lang/String;Landroid/content/Context;)Lcom/my/target/core/async/commands/b;

    move-result-object v0

    .line 107
    invoke-interface {v0}, Lcom/my/target/core/async/commands/b;->b()V

    goto :goto_0
.end method

.method public static a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)V
    .locals 8

    .prologue
    const/4 v4, 0x0

    const/16 v2, 0x28

    .line 84
    const-string/jumbo v0, "add log message level: 40"

    invoke-static {v0}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    .line 86
    sget-wide v0, Lcom/my/target/core/async/a;->b:J

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    cmp-long v0, v0, v6

    if-gez v0, :cond_0

    .line 88
    const-string/jumbo v0, " with data"

    .line 89
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 90
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    move-object v1, p1

    move-object v5, p3

    move-object v6, p4

    move-object v7, p5

    invoke-static/range {v0 .. v7}, Lcom/my/target/core/factories/b;->a(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/Throwable;Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)Lcom/my/target/core/async/commands/b;

    move-result-object v0

    .line 92
    invoke-interface {v0}, Lcom/my/target/core/async/commands/b;->b()V

    .line 93
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    const-wide/32 v2, 0x5265c00

    add-long/2addr v0, v2

    sput-wide v0, Lcom/my/target/core/async/a;->b:J

    .line 99
    :goto_0
    return-void

    :cond_0
    move-object v0, p0

    move-object v1, p1

    move-object v3, p2

    move-object v5, p4

    move-object v6, p5

    .line 96
    invoke-static/range {v0 .. v6}, Lcom/my/target/core/factories/b;->a(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/Throwable;Ljava/lang/String;Landroid/content/Context;)Lcom/my/target/core/async/commands/b;

    move-result-object v0

    .line 97
    invoke-interface {v0}, Lcom/my/target/core/async/commands/b;->b()V

    goto :goto_0
.end method

.method public static a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;Ljava/lang/String;Landroid/content/Context;)V
    .locals 7

    .prologue
    .line 113
    sget-boolean v0, Lcom/my/target/core/async/a;->a:Z

    if-nez v0, :cond_0

    .line 117
    :goto_0
    return-void

    .line 114
    :cond_0
    const-string/jumbo v0, "add log message level: 50"

    invoke-static {v0}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    .line 115
    const/16 v2, 0x32

    const/4 v3, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v4, p2

    move-object v5, p3

    move-object v6, p4

    invoke-static/range {v0 .. v6}, Lcom/my/target/core/factories/b;->a(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/Throwable;Ljava/lang/String;Landroid/content/Context;)Lcom/my/target/core/async/commands/b;

    move-result-object v0

    .line 116
    invoke-interface {v0}, Lcom/my/target/core/async/commands/b;->b()V

    goto :goto_0
.end method

.method public static a(Ljava/util/List;Landroid/content/Context;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Landroid/content/Context;",
            ")V"
        }
    .end annotation

    .prologue
    .line 77
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0, p1}, Lcom/my/target/core/async/a;->a(Ljava/lang/String;Landroid/content/Context;)V

    goto :goto_0

    .line 78
    :cond_0
    return-void
.end method

.method public static a(Ljava/util/List;Ljava/lang/String;Landroid/content/Context;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/my/target/core/models/k;",
            ">;",
            "Ljava/lang/String;",
            "Landroid/content/Context;",
            ")V"
        }
    .end annotation

    .prologue
    .line 69
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/my/target/core/models/k;

    .line 71
    invoke-virtual {v0}, Lcom/my/target/core/models/k;->c()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {v0}, Lcom/my/target/core/models/k;->d()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Lcom/my/target/core/models/k;->c()Ljava/lang/String;

    move-result-object v0

    const/high16 v3, -0x40800000    # -1.0f

    invoke-static {v2, v0, v3, p2}, Lcom/my/target/core/async/a;->a(Ljava/lang/String;Ljava/lang/String;FLandroid/content/Context;)V

    goto :goto_0

    .line 73
    :cond_1
    return-void
.end method
