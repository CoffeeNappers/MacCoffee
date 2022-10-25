.class public final Lcom/vk/music/formatter/DurationFormatter;
.super Ljava/lang/Object;
.source "DurationFormatter.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static formatDuration(Lcom/vk/core/util/Resourcer;J)Ljava/lang/CharSequence;
    .locals 9
    .param p0, "resourcer"    # Lcom/vk/core/util/Resourcer;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "seconds"    # J
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    const v8, 0x7f0d0029

    .line 23
    const/4 v0, 0x0

    .line 24
    .local v0, "durationFormatted":Ljava/lang/String;
    sget-object v3, Lcom/vk/music/formatter/Duration;->HOUR:Lcom/vk/music/formatter/Duration;

    invoke-virtual {v3}, Lcom/vk/music/formatter/Duration;->seconds()J

    move-result-wide v4

    div-long v4, p1, v4

    long-to-int v1, v4

    .line 26
    .local v1, "hours":I
    if-lez v1, :cond_2

    .line 27
    int-to-long v4, v1

    sget-object v3, Lcom/vk/music/formatter/Duration;->HOUR:Lcom/vk/music/formatter/Duration;

    invoke-virtual {v3}, Lcom/vk/music/formatter/Duration;->seconds()J

    move-result-wide v6

    mul-long/2addr v4, v6

    sub-long v4, p1, v4

    sget-object v3, Lcom/vk/music/formatter/Duration;->MINUTE:Lcom/vk/music/formatter/Duration;

    invoke-virtual {v3}, Lcom/vk/music/formatter/Duration;->seconds()J

    move-result-wide v6

    div-long/2addr v4, v6

    long-to-int v2, v4

    .line 28
    .local v2, "minutes":I
    const v3, 0x7f0d0028

    invoke-virtual {p0, v3, v1}, Lcom/vk/core/util/Resourcer;->pluralArg(II)Ljava/lang/String;

    move-result-object v0

    .line 29
    if-lez v2, :cond_0

    .line 30
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, " "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0, v8, v2}, Lcom/vk/core/util/Resourcer;->pluralArg(II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 39
    :cond_0
    :goto_0
    if-nez v0, :cond_1

    .line 40
    const-string/jumbo v0, ""

    .line 42
    .end local v0    # "durationFormatted":Ljava/lang/String;
    :cond_1
    return-object v0

    .line 33
    .end local v2    # "minutes":I
    .restart local v0    # "durationFormatted":Ljava/lang/String;
    :cond_2
    sget-object v3, Lcom/vk/music/formatter/Duration;->MINUTE:Lcom/vk/music/formatter/Duration;

    invoke-virtual {v3}, Lcom/vk/music/formatter/Duration;->seconds()J

    move-result-wide v4

    div-long v4, p1, v4

    long-to-int v2, v4

    .line 34
    .restart local v2    # "minutes":I
    if-lez v2, :cond_0

    .line 35
    invoke-virtual {p0, v8, v2}, Lcom/vk/core/util/Resourcer;->pluralArg(II)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public static formatDurationShort(J)Ljava/lang/CharSequence;
    .locals 14
    .param p0, "seconds"    # J
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    const/4 v12, 0x2

    const/4 v11, 0x1

    const/4 v10, 0x0

    .line 48
    const/4 v0, 0x0

    .line 50
    .local v0, "durationFormatted":Ljava/lang/String;
    sget-object v4, Lcom/vk/music/formatter/Duration;->HOUR:Lcom/vk/music/formatter/Duration;

    invoke-virtual {v4}, Lcom/vk/music/formatter/Duration;->seconds()J

    move-result-wide v4

    div-long v4, p0, v4

    long-to-int v1, v4

    .line 53
    .local v1, "hours":I
    if-lez v1, :cond_2

    .line 54
    int-to-long v4, v1

    sget-object v6, Lcom/vk/music/formatter/Duration;->HOUR:Lcom/vk/music/formatter/Duration;

    invoke-virtual {v6}, Lcom/vk/music/formatter/Duration;->seconds()J

    move-result-wide v6

    mul-long/2addr v4, v6

    sub-long v4, p0, v4

    sget-object v6, Lcom/vk/music/formatter/Duration;->MINUTE:Lcom/vk/music/formatter/Duration;

    invoke-virtual {v6}, Lcom/vk/music/formatter/Duration;->seconds()J

    move-result-wide v6

    div-long/2addr v4, v6

    long-to-int v2, v4

    .line 55
    .local v2, "minutes":I
    int-to-long v4, v1

    sget-object v6, Lcom/vk/music/formatter/Duration;->HOUR:Lcom/vk/music/formatter/Duration;

    invoke-virtual {v6}, Lcom/vk/music/formatter/Duration;->seconds()J

    move-result-wide v6

    mul-long/2addr v4, v6

    sub-long v4, p0, v4

    int-to-long v6, v2

    sget-object v8, Lcom/vk/music/formatter/Duration;->MINUTE:Lcom/vk/music/formatter/Duration;

    invoke-virtual {v8}, Lcom/vk/music/formatter/Duration;->seconds()J

    move-result-wide v8

    mul-long/2addr v6, v8

    sub-long/2addr v4, v6

    long-to-int v3, v4

    .line 56
    .local v3, "secs":I
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v4

    const-string/jumbo v5, "%02d:%02d:%02d"

    const/4 v6, 0x3

    new-array v6, v6, [Ljava/lang/Object;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v10

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v11

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v12

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 65
    :cond_0
    :goto_0
    if-nez v0, :cond_1

    .line 66
    const-string/jumbo v0, ""

    .line 68
    .end local v0    # "durationFormatted":Ljava/lang/String;
    :cond_1
    return-object v0

    .line 58
    .end local v2    # "minutes":I
    .end local v3    # "secs":I
    .restart local v0    # "durationFormatted":Ljava/lang/String;
    :cond_2
    sget-object v4, Lcom/vk/music/formatter/Duration;->MINUTE:Lcom/vk/music/formatter/Duration;

    invoke-virtual {v4}, Lcom/vk/music/formatter/Duration;->seconds()J

    move-result-wide v4

    div-long v4, p0, v4

    long-to-int v2, v4

    .line 59
    .restart local v2    # "minutes":I
    int-to-long v4, v2

    sget-object v6, Lcom/vk/music/formatter/Duration;->MINUTE:Lcom/vk/music/formatter/Duration;

    invoke-virtual {v6}, Lcom/vk/music/formatter/Duration;->seconds()J

    move-result-wide v6

    mul-long/2addr v4, v6

    sub-long v4, p0, v4

    long-to-int v3, v4

    .line 60
    .restart local v3    # "secs":I
    if-lez v2, :cond_0

    .line 61
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v4

    const-string/jumbo v5, "%02d:%02d"

    new-array v6, v12, [Ljava/lang/Object;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v10

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v11

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method
