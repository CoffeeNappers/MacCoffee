.class public final Lcom/my/target/core/parsers/rb/a;
.super Ljava/lang/Object;
.source "RBAbstractParser.java"


# direct methods
.method static a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;DZ)D
    .locals 5

    .prologue
    .line 173
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 177
    :try_start_0
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v0

    .line 178
    const-wide/16 v2, 0x0

    cmpg-double v2, v0, v2

    if-gez v2, :cond_1

    .line 180
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "Parsing negative double in field \'"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\', Operation: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p2, Lcom/my/target/core/parsers/a$a;->d:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", Unit: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p2, Lcom/my/target/core/parsers/a$a;->e:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 182
    const-string/jumbo v1, "JSONException"

    invoke-static {v0, p2, v1}, Lcom/my/target/core/parsers/a;->a(Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 210
    :cond_0
    :goto_0
    return-wide p3

    :cond_1
    move-wide p3, v0

    .line 185
    goto :goto_0

    .line 186
    :catch_0
    move-exception v0

    .line 189
    new-instance v1, Ljava/lang/StringBuilder;

    const-string/jumbo v2, "JSON Exception in field \'"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "\', Operation: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p2, Lcom/my/target/core/parsers/a$a;->d:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ", Unit: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p2, Lcom/my/target/core/parsers/a$a;->e:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 192
    if-eqz p5, :cond_0

    .line 194
    const-string/jumbo v2, "JSONException"

    invoke-static {v1, p2, v0, v2}, Lcom/my/target/core/parsers/a;->a(Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/Exception;Ljava/lang/String;)V

    goto :goto_0

    .line 201
    :cond_2
    if-eqz p5, :cond_0

    .line 203
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "Didn\'t found required field \'"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\', Operation: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p2, Lcom/my/target/core/parsers/a$a;->d:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", Unit: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p2, Lcom/my/target/core/parsers/a$a;->e:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 205
    const/4 v1, 0x0

    const-string/jumbo v2, "Required field absence"

    invoke-static {v0, p2, v1, v2}, Lcom/my/target/core/parsers/a;->a(Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/Exception;Ljava/lang/String;)V

    goto :goto_0
.end method

.method static a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;I)I
    .locals 4

    .prologue
    .line 293
    .line 294
    const-string/jumbo v1, ""

    .line 297
    :try_start_0
    const-string/jumbo v0, ""

    const/4 v2, 0x0

    invoke-static {p0, p1, p2, v0, v2}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v1

    .line 298
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 313
    :goto_0
    return p3

    .line 304
    :cond_0
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result p3

    goto :goto_0

    .line 305
    :catch_0
    move-exception v0

    .line 307
    new-instance v2, Ljava/lang/StringBuilder;

    const-string/jumbo v3, "Unable to parse color: \'"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "\', value: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ", Operation: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p2, Lcom/my/target/core/parsers/a$a;->d:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ", Unit: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p2, Lcom/my/target/core/parsers/a$a;->e:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 310
    const-string/jumbo v2, "Color parse error"

    invoke-static {v1, p2, v0, v2}, Lcom/my/target/core/parsers/a;->a(Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/Exception;Ljava/lang/String;)V

    goto :goto_0
.end method

.method static a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;IZ)I
    .locals 3

    .prologue
    .line 128
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 132
    :try_start_0
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v0

    .line 133
    if-gez v0, :cond_1

    .line 135
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "Parsing negative integer in field \'"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\', Operation: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p2, Lcom/my/target/core/parsers/a$a;->d:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", Unit: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p2, Lcom/my/target/core/parsers/a$a;->e:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 137
    const-string/jumbo v1, "JSONException"

    invoke-static {v0, p2, v1}, Lcom/my/target/core/parsers/a;->a(Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 165
    :cond_0
    :goto_0
    return p3

    :cond_1
    move p3, v0

    .line 140
    goto :goto_0

    .line 141
    :catch_0
    move-exception v0

    .line 144
    new-instance v1, Ljava/lang/StringBuilder;

    const-string/jumbo v2, "JSON Exception in field \'"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "\', Operation: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p2, Lcom/my/target/core/parsers/a$a;->d:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ", Unit: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p2, Lcom/my/target/core/parsers/a$a;->e:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 147
    if-eqz p4, :cond_0

    .line 149
    const-string/jumbo v2, "JSONException"

    invoke-static {v1, p2, v0, v2}, Lcom/my/target/core/parsers/a;->a(Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/Exception;Ljava/lang/String;)V

    goto :goto_0

    .line 156
    :cond_2
    if-eqz p4, :cond_0

    .line 158
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "Didn\'t found required field \'"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\', Operation: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p2, Lcom/my/target/core/parsers/a$a;->d:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", Unit: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p2, Lcom/my/target/core/parsers/a$a;->e:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 160
    const/4 v1, 0x0

    const-string/jumbo v2, "Required field absence"

    invoke-static {v0, p2, v1, v2}, Lcom/my/target/core/parsers/a;->a(Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/Exception;Ljava/lang/String;)V

    goto :goto_0
.end method

.method static a(Lcom/my/target/core/models/sections/i;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;)Lcom/my/target/core/models/sections/h;
    .locals 4

    .prologue
    .line 324
    const/4 v0, 0x0

    .line 328
    :try_start_0
    check-cast p0, Lcom/my/target/core/models/sections/h;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 340
    :goto_0
    return-object p0

    .line 329
    :catch_0
    move-exception v1

    .line 331
    new-instance v2, Ljava/lang/StringBuilder;

    const-string/jumbo v3, "Unable to cast to native section field \'"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "\', Operation: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p2, Lcom/my/target/core/parsers/a$a;->d:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, ", Unit: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p2, Lcom/my/target/core/parsers/a$a;->e:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 336
    const-string/jumbo v3, "Class cast exception"

    invoke-static {v2, p2, v1, v3}, Lcom/my/target/core/parsers/a;->a(Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/Exception;Ljava/lang/String;)V

    move-object p0, v0

    goto :goto_0
.end method

.method static a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;)Lcom/my/target/nativeads/models/ImageData;
    .locals 5

    .prologue
    const/4 v3, 0x0

    .line 533
    const/4 v0, 0x0

    .line 534
    const-string/jumbo v1, ""

    invoke-static {p0, p1, p4, v1, v3}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v1

    .line 536
    invoke-static {p0, p2, p4, v3, v3}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;IZ)I

    move-result v2

    .line 538
    invoke-static {p0, p3, p4, v3, v3}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;IZ)I

    move-result v3

    .line 540
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 542
    new-instance v0, Lcom/my/target/nativeads/models/ImageData;

    invoke-direct {v0, v1, v3, v2}, Lcom/my/target/nativeads/models/ImageData;-><init>(Ljava/lang/String;II)V

    .line 544
    :cond_0
    return-object v0
.end method

.method static a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/String;Z)Ljava/lang/String;
    .locals 3

    .prologue
    const/4 v0, 0x0

    .line 41
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 45
    :try_start_0
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    .line 46
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 48
    if-eqz p4, :cond_1

    .line 50
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "Empty string required field \'"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\', Operation: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p2, Lcom/my/target/core/parsers/a$a;->d:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", Unit: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p2, Lcom/my/target/core/parsers/a$a;->e:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 52
    const/4 v1, 0x0

    const-string/jumbo v2, "Required field absence"

    invoke-static {v0, p2, v1, v2}, Lcom/my/target/core/parsers/a;->a(Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/Exception;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 81
    :cond_0
    :goto_0
    return-object p3

    :cond_1
    move-object p3, v0

    .line 55
    goto :goto_0

    .line 58
    :catch_0
    move-exception v0

    .line 60
    new-instance v1, Ljava/lang/StringBuilder;

    const-string/jumbo v2, "JSON Exception in field "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ", Operation: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p2, Lcom/my/target/core/parsers/a$a;->d:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ", Unit: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p2, Lcom/my/target/core/parsers/a$a;->e:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 63
    if-eqz p4, :cond_0

    .line 65
    const-string/jumbo v2, "JSONException"

    invoke-static {v1, p2, v0, v2}, Lcom/my/target/core/parsers/a;->a(Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/Exception;Ljava/lang/String;)V

    goto :goto_0

    .line 72
    :cond_2
    if-eqz p4, :cond_0

    .line 74
    new-instance v1, Ljava/lang/StringBuilder;

    const-string/jumbo v2, "No required field \'"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "\', Operation: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p2, Lcom/my/target/core/parsers/a$a;->d:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ", Unit: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p2, Lcom/my/target/core/parsers/a$a;->e:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 76
    const-string/jumbo v2, "Required field absence"

    invoke-static {v1, p2, v0, v2}, Lcom/my/target/core/parsers/a;->a(Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/Exception;Ljava/lang/String;)V

    goto :goto_0
.end method

.method static a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;)Lorg/json/JSONArray;
    .locals 3

    .prologue
    const/4 v0, 0x0

    .line 255
    .line 257
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 261
    :try_start_0
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 286
    :cond_0
    :goto_0
    return-object v0

    .line 265
    :catch_0
    move-exception v1

    new-instance v1, Ljava/lang/StringBuilder;

    const-string/jumbo v2, "JSON Exception in field \'"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "\', Operation: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p2, Lcom/my/target/core/parsers/a$a;->d:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ", Unit: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p2, Lcom/my/target/core/parsers/a$a;->e:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0
.end method

.method static a(ILorg/json/JSONArray;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;)Lorg/json/JSONObject;
    .locals 3

    .prologue
    .line 485
    const/4 v0, 0x0

    .line 489
    :try_start_0
    invoke-virtual {p1, p0}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 496
    :goto_0
    return-object v0

    .line 492
    :catch_0
    move-exception v1

    new-instance v1, Ljava/lang/StringBuilder;

    const-string/jumbo v2, "Unable to get JSONObject from JSONArray \'"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 493
    const-string/jumbo v2, "JSONException"

    invoke-static {v1, p3, v2}, Lcom/my/target/core/parsers/a;->a(Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/String;)V

    goto :goto_0
.end method

.method static a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Z)Lorg/json/JSONObject;
    .locals 4

    .prologue
    const/4 v0, 0x0

    .line 89
    .line 91
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 95
    :try_start_0
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 120
    :cond_0
    :goto_0
    return-object v0

    .line 96
    :catch_0
    move-exception v1

    .line 99
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "  field: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, ", Operation: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p2, Lcom/my/target/core/parsers/a$a;->d:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, ", Unit: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p2, Lcom/my/target/core/parsers/a$a;->e:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 102
    if-eqz p3, :cond_0

    .line 104
    const-string/jumbo v3, "JSONException"

    invoke-static {v2, p2, v1, v3}, Lcom/my/target/core/parsers/a;->a(Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/Exception;Ljava/lang/String;)V

    goto :goto_0

    .line 111
    :cond_1
    if-eqz p3, :cond_0

    .line 113
    new-instance v1, Ljava/lang/StringBuilder;

    const-string/jumbo v2, "Didn\'t found required field \'"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "\', Operation: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p2, Lcom/my/target/core/parsers/a$a;->d:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ", Unit: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p2, Lcom/my/target/core/parsers/a$a;->e:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 115
    const-string/jumbo v2, "Required field absence"

    invoke-static {v1, p2, v0, v2}, Lcom/my/target/core/parsers/a;->a(Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/Exception;Ljava/lang/String;)V

    goto :goto_0
.end method

.method static b(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;)F
    .locals 8

    .prologue
    const-wide/16 v4, 0x0

    .line 520
    const/4 v6, 0x0

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    invoke-static/range {v1 .. v6}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;DZ)D

    move-result-wide v0

    double-to-float v0, v0

    .line 521
    float-to-double v2, v0

    const-wide/high16 v6, 0x4014000000000000L    # 5.0

    cmpl-double v1, v2, v6

    if-gtz v1, :cond_0

    float-to-double v2, v0

    cmpg-double v1, v2, v4

    if-gez v1, :cond_1

    .line 523
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    const-string/jumbo v2, "Native Banner parse error: rating \'"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "\' is out of bounds [0, 5]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, "Out of bounds rating"

    invoke-static {v1, p2, v2}, Lcom/my/target/core/parsers/a;->a(Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/String;)V

    .line 526
    :cond_1
    return v0
.end method

.method static b(Lcom/my/target/core/models/sections/i;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;)Lcom/my/target/core/models/sections/f;
    .locals 4

    .prologue
    .line 347
    const/4 v0, 0x0

    .line 351
    :try_start_0
    check-cast p0, Lcom/my/target/core/models/sections/f;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 363
    :goto_0
    return-object p0

    .line 352
    :catch_0
    move-exception v1

    .line 354
    new-instance v2, Ljava/lang/StringBuilder;

    const-string/jumbo v3, "Unable to cast to instream section field \'"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "\', Operation: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p2, Lcom/my/target/core/parsers/a$a;->d:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, ", Unit: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p2, Lcom/my/target/core/parsers/a$a;->e:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 359
    const-string/jumbo v3, "Class cast exception"

    invoke-static {v2, p2, v1, v3}, Lcom/my/target/core/parsers/a;->a(Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/Exception;Ljava/lang/String;)V

    move-object p0, v0

    goto :goto_0
.end method

.method static b(ILorg/json/JSONArray;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;)Ljava/lang/String;
    .locals 3

    .prologue
    .line 503
    const/4 v0, 0x0

    .line 507
    :try_start_0
    invoke-virtual {p1, p0}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 514
    :goto_0
    return-object v0

    .line 510
    :catch_0
    move-exception v1

    new-instance v1, Ljava/lang/StringBuilder;

    const-string/jumbo v2, "Unable to get String from JSONArray "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 511
    const-string/jumbo v2, "JSONException"

    invoke-static {v1, p3, v2}, Lcom/my/target/core/parsers/a;->a(Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/String;)V

    goto :goto_0
.end method

.method static b(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Z)Z
    .locals 2

    .prologue
    .line 218
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 222
    :try_start_0
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result p3

    .line 247
    :cond_0
    :goto_0
    return p3

    .line 226
    :catch_0
    move-exception v0

    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "JSON Exception in field \'"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\', Operation: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p2, Lcom/my/target/core/parsers/a$a;->d:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", Unit: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p2, Lcom/my/target/core/parsers/a$a;->e:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0
.end method

.method static c(Lcom/my/target/core/models/sections/i;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;)Lcom/my/target/core/models/sections/j;
    .locals 4

    .prologue
    .line 370
    const/4 v0, 0x0

    .line 373
    :try_start_0
    check-cast p0, Lcom/my/target/core/models/sections/j;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 385
    :goto_0
    return-object p0

    .line 374
    :catch_0
    move-exception v1

    .line 376
    new-instance v2, Ljava/lang/StringBuilder;

    const-string/jumbo v3, "Unable to cast to standard section field \'"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "\', Operation: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p2, Lcom/my/target/core/parsers/a$a;->d:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, ", Unit: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p2, Lcom/my/target/core/parsers/a$a;->e:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 381
    const-string/jumbo v3, "Class cast exception"

    invoke-static {v2, p2, v1, v3}, Lcom/my/target/core/parsers/a;->a(Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/Exception;Ljava/lang/String;)V

    move-object p0, v0

    goto :goto_0
.end method

.method static c(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;)Lcom/my/target/nativeads/models/ImageData;
    .locals 3

    .prologue
    .line 550
    const/4 v0, 0x0

    .line 551
    const-string/jumbo v1, ""

    const/4 v2, 0x0

    invoke-static {p0, p1, p2, v1, v2}, Lcom/my/target/core/parsers/rb/a;->a(Lorg/json/JSONObject;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v1

    .line 553
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 555
    new-instance v0, Lcom/my/target/nativeads/models/ImageData;

    invoke-direct {v0, v1}, Lcom/my/target/nativeads/models/ImageData;-><init>(Ljava/lang/String;)V

    .line 557
    :cond_0
    return-object v0
.end method

.method static d(Lcom/my/target/core/models/sections/i;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;)Lcom/my/target/core/models/sections/k;
    .locals 4

    .prologue
    .line 392
    const/4 v0, 0x0

    .line 395
    :try_start_0
    check-cast p0, Lcom/my/target/core/models/sections/k;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 407
    :goto_0
    return-object p0

    .line 396
    :catch_0
    move-exception v1

    .line 398
    new-instance v2, Ljava/lang/StringBuilder;

    const-string/jumbo v3, "Unable to cast to standard section field \'"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "\', Operation: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p2, Lcom/my/target/core/parsers/a$a;->d:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, ", Unit: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p2, Lcom/my/target/core/parsers/a$a;->e:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 403
    const-string/jumbo v3, "Class cast exception"

    invoke-static {v2, p2, v1, v3}, Lcom/my/target/core/parsers/a;->a(Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/Exception;Ljava/lang/String;)V

    move-object p0, v0

    goto :goto_0
.end method

.method static e(Lcom/my/target/core/models/sections/i;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;)Lcom/my/target/core/models/sections/d;
    .locals 4

    .prologue
    .line 414
    const/4 v0, 0x0

    .line 417
    :try_start_0
    check-cast p0, Lcom/my/target/core/models/sections/d;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 429
    :goto_0
    return-object p0

    .line 418
    :catch_0
    move-exception v1

    .line 420
    new-instance v2, Ljava/lang/StringBuilder;

    const-string/jumbo v3, "Unable to cast to standard section field \'"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "\', Operation: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p2, Lcom/my/target/core/parsers/a$a;->d:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, ", Unit: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p2, Lcom/my/target/core/parsers/a$a;->e:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 425
    const-string/jumbo v3, "Class cast exception"

    invoke-static {v2, p2, v1, v3}, Lcom/my/target/core/parsers/a;->a(Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/Exception;Ljava/lang/String;)V

    move-object p0, v0

    goto :goto_0
.end method

.method static f(Lcom/my/target/core/models/sections/i;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;)Lcom/my/target/core/models/sections/e;
    .locals 4

    .prologue
    .line 441
    const/4 v0, 0x0

    .line 444
    :try_start_0
    check-cast p0, Lcom/my/target/core/models/sections/e;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 456
    :goto_0
    return-object p0

    .line 445
    :catch_0
    move-exception v1

    .line 447
    new-instance v2, Ljava/lang/StringBuilder;

    const-string/jumbo v3, "Unable to cast to standard section field \'"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "\', Operation: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p2, Lcom/my/target/core/parsers/a$a;->d:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, ", Unit: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p2, Lcom/my/target/core/parsers/a$a;->e:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 452
    const-string/jumbo v3, "Class cast exception"

    invoke-static {v2, p2, v1, v3}, Lcom/my/target/core/parsers/a;->a(Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/Exception;Ljava/lang/String;)V

    move-object p0, v0

    goto :goto_0
.end method

.method static g(Lcom/my/target/core/models/sections/i;Ljava/lang/String;Lcom/my/target/core/parsers/a$a;)Lcom/my/target/core/models/sections/b;
    .locals 4

    .prologue
    .line 463
    const/4 v0, 0x0

    .line 466
    :try_start_0
    check-cast p0, Lcom/my/target/core/models/sections/b;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 478
    :goto_0
    return-object p0

    .line 467
    :catch_0
    move-exception v1

    .line 469
    new-instance v2, Ljava/lang/StringBuilder;

    const-string/jumbo v3, "Unable to cast to standard section field \'"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "\', Operation: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p2, Lcom/my/target/core/parsers/a$a;->d:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, ", Unit: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p2, Lcom/my/target/core/parsers/a$a;->e:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 474
    const-string/jumbo v3, "Class cast exception"

    invoke-static {v2, p2, v1, v3}, Lcom/my/target/core/parsers/a;->a(Ljava/lang/String;Lcom/my/target/core/parsers/a$a;Ljava/lang/Exception;Ljava/lang/String;)V

    move-object p0, v0

    goto :goto_0
.end method
