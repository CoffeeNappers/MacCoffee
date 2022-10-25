.class public Lcom/my/target/core/parsers/b;
.super Ljava/lang/Object;
.source "ResponseParser.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 188
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 189
    return-void
.end method

.method private static a(Landroid/content/Context;)Ljava/util/ArrayList;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 163
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    .line 164
    const/16 v1, 0x80

    invoke-virtual {v0, v1}, Landroid/content/pm/PackageManager;->getInstalledApplications(I)Ljava/util/List;

    move-result-object v0

    .line 166
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 168
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/pm/ApplicationInfo;

    .line 170
    iget v3, v0, Landroid/content/pm/ApplicationInfo;->flags:I

    and-int/lit8 v3, v3, 0x1

    if-nez v3, :cond_0

    .line 173
    iget-object v0, v0, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 176
    :cond_1
    return-object v1
.end method

.method public static a(Ljava/lang/String;Lcom/my/target/core/models/c;Lcom/my/target/core/a;Lcom/my/target/core/models/d;Landroid/content/Context;)V
    .locals 10

    .prologue
    const/4 v6, 0x0

    .line 45
    if-eqz p0, :cond_6

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    .line 46
    :goto_0
    if-eqz v3, :cond_5

    const-string/jumbo v0, ""

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_5

    .line 1193
    const-string/jumbo v0, "<!doctype html>"

    invoke-virtual {v3, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_0

    .line 1195
    const-string/jumbo v0, "bannersJSON:"

    invoke-virtual {v3, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    .line 1196
    if-ltz v0, :cond_0

    .line 1198
    add-int/lit8 v0, v0, 0xc

    .line 1199
    const-string/jumbo v1, "{"

    invoke-virtual {v3, v1, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v1

    .line 1200
    if-lt v1, v0, :cond_0

    .line 1202
    const-string/jumbo v2, "};"

    invoke-virtual {v3, v2, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v2

    .line 1203
    add-int/lit8 v4, v1, 0x1

    if-lt v2, v4, :cond_0

    .line 1205
    const-string/jumbo v4, "</script>"

    invoke-virtual {v3, v4, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v4

    .line 1206
    if-lt v4, v2, :cond_0

    .line 1208
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v6, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v5, "\'\'};"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v3, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1209
    const-string/jumbo v4, "\""

    const-string/jumbo v5, "\'"

    invoke-virtual {v0, v4, v5}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    .line 1210
    new-instance v4, Ljava/lang/StringBuilder;

    const-string/jumbo v5, "{\"html_wrapper\":\""

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v4, "\","

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {v3, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 50
    :cond_0
    invoke-static {v3}, Lcom/my/target/core/parsers/vast/c;->a(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 52
    const-string/jumbo v0, "Parsing XML..."

    invoke-static {v0}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    .line 2118
    const-string/jumbo v0, "parse VAST"

    invoke-static {v0}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    .line 2119
    new-instance v5, Lcom/my/target/core/parsers/a$a;

    invoke-direct {v5, p4}, Lcom/my/target/core/parsers/a$a;-><init>(Landroid/content/Context;)V

    .line 2120
    const-class v0, Lcom/my/target/core/parsers/vast/c;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, v5, Lcom/my/target/core/parsers/a$a;->f:Ljava/lang/String;

    .line 2121
    const-class v0, Lcom/my/target/core/parsers/b;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, v5, Lcom/my/target/core/parsers/a$a;->c:Ljava/lang/String;

    .line 2122
    invoke-virtual {p1}, Lcom/my/target/core/models/c;->b()Ljava/lang/String;

    move-result-object v0

    iput-object v0, v5, Lcom/my/target/core/parsers/a$a;->b:Ljava/lang/String;

    .line 2123
    const-string/jumbo v0, "Parsing VAST"

    iput-object v0, v5, Lcom/my/target/core/parsers/a$a;->d:Ljava/lang/String;

    .line 2124
    const-string/jumbo v0, "no unit"

    iput-object v0, v5, Lcom/my/target/core/parsers/a$a;->e:Ljava/lang/String;

    .line 2128
    :try_start_0
    invoke-static {v3, p1, p2, p3, v5}, Lcom/my/target/core/parsers/vast/c;->a(Ljava/lang/String;Lcom/my/target/core/models/c;Lcom/my/target/core/a;Lcom/my/target/core/models/d;Lcom/my/target/core/parsers/a$a;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 2144
    :goto_1
    return-void

    .line 2132
    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    .line 2134
    new-instance v1, Ljava/lang/StringBuilder;

    const-string/jumbo v2, "parse VAST error. message: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    .line 2136
    const-string/jumbo v1, "("

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 2138
    const-string/jumbo v1, "("

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v0, v6, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 3082
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", Operation: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, v5, Lcom/my/target/core/parsers/a$a;->d:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", Unit: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, v5, Lcom/my/target/core/parsers/a$a;->e:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 3085
    iget-object v1, v5, Lcom/my/target/core/parsers/a$a;->c:Ljava/lang/String;

    const-string/jumbo v2, "VAST Exception:  Convert to XML error"

    iget-object v4, v5, Lcom/my/target/core/parsers/a$a;->b:Ljava/lang/String;

    iget-object v5, v5, Lcom/my/target/core/parsers/a$a;->a:Landroid/content/Context;

    invoke-static/range {v0 .. v5}, Lcom/my/target/core/async/a;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)V

    goto :goto_1

    .line 57
    :cond_2
    const-string/jumbo v0, "Converting to JSON..."

    invoke-static {v0}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    .line 60
    :try_start_1
    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4, v3}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 61
    const-string/jumbo v0, "done"

    invoke-static {v0}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    .line 62
    invoke-static {v4}, Lcom/my/target/core/parsers/b;->a(Lorg/json/JSONObject;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 3149
    const-string/jumbo v0, "parse json"

    invoke-static {v0}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    .line 3150
    invoke-virtual {p2}, Lcom/my/target/core/a;->c()Ljava/lang/String;

    move-result-object v6

    .line 3151
    invoke-static {p4}, Lcom/my/target/core/parsers/b;->a(Landroid/content/Context;)Ljava/util/ArrayList;

    move-result-object v7

    move-object v5, p1

    move-object v8, p4

    move-object v9, p3

    .line 3150
    invoke-static/range {v4 .. v9}, Lcom/my/target/core/parsers/rb/c;->a(Lorg/json/JSONObject;Lcom/my/target/core/models/c;Ljava/lang/String;Ljava/util/ArrayList;Landroid/content/Context;Lcom/my/target/core/models/d;)V

    .line 3153
    invoke-virtual {p2}, Lcom/my/target/core/a;->e()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 3155
    invoke-virtual {p1}, Lcom/my/target/core/models/c;->h()V

    .line 3158
    :cond_3
    const-string/jumbo v0, "json parsing finished"

    invoke-static {v0}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto/16 :goto_1

    .line 71
    :catch_1
    move-exception v0

    .line 74
    new-instance v1, Ljava/lang/StringBuilder;

    const-string/jumbo v2, "convert to JSON error: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    .line 75
    const-string/jumbo v0, "Convert to JSON error"

    const-class v1, Lcom/my/target/core/parsers/b;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, "JSON Exception: Convert to JSON error"

    .line 77
    invoke-virtual {p1}, Lcom/my/target/core/models/c;->b()Ljava/lang/String;

    move-result-object v4

    move-object v5, p4

    .line 75
    invoke-static/range {v0 .. v5}, Lcom/my/target/core/async/a;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)V

    goto/16 :goto_1

    .line 68
    :cond_4
    :try_start_2
    const-string/jumbo v0, "invalid json version"

    invoke-static {v0}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto/16 :goto_1

    .line 83
    :cond_5
    const-string/jumbo v0, "data is empty"

    invoke-static {v0}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    goto/16 :goto_1

    :cond_6
    move-object v3, p0

    goto/16 :goto_0
.end method

.method private static a(Lorg/json/JSONObject;)Z
    .locals 4

    .prologue
    const/4 v0, 0x0

    .line 92
    :try_start_0
    const-string/jumbo v1, "version"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 93
    new-instance v2, Ljava/lang/StringBuilder;

    const-string/jumbo v3, "json version: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    .line 94
    const-string/jumbo v2, "."

    invoke-virtual {v1, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    .line 95
    if-lez v2, :cond_0

    .line 97
    const/4 v3, 0x0

    invoke-virtual {v1, v3, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v1

    .line 100
    const/16 v2, 0xa

    :try_start_1
    invoke-static {v1, v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    move-result v1

    .line 101
    const/4 v2, 0x2

    if-ne v1, v2, :cond_0

    const/4 v0, 0x1

    .line 110
    :cond_0
    :goto_0
    return v0

    :catch_0
    move-exception v1

    goto :goto_0

    :catch_1
    move-exception v1

    goto :goto_0
.end method
