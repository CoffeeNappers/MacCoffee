.class public final Lcom/vk/music/formatter/PlaylistFormatter;
.super Ljava/lang/Object;
.source "PlaylistFormatter.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static formatArtists(Lcom/vk/core/util/Resourcer;Ljava/util/List;)Ljava/lang/CharSequence;
    .locals 2
    .param p0, "resourcer"    # Lcom/vk/core/util/Resourcer;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ljava/util/List;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vk/core/util/Resourcer;",
            "Ljava/util/List",
            "<",
            "Lcom/vk/music/dto/Artist;",
            ">;)",
            "Ljava/lang/CharSequence;"
        }
    .end annotation

    .prologue
    .line 63
    .local p1, "artists":Ljava/util/List;, "Ljava/util/List<Lcom/vk/music/dto/Artist;>;"
    if-eqz p1, :cond_0

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    if-nez v0, :cond_1

    .line 64
    :cond_0
    const-string/jumbo v0, ""

    .line 70
    :goto_0
    return-object v0

    .line 67
    :cond_1
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x1

    if-le v0, v1, :cond_2

    .line 68
    const v0, 0x7f0803c8

    invoke-virtual {p0, v0}, Lcom/vk/core/util/Resourcer;->str(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 70
    :cond_2
    const/4 v0, 0x0

    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/music/dto/Artist;

    iget-object v0, v0, Lcom/vk/music/dto/Artist;->name:Ljava/lang/String;

    goto :goto_0
.end method

.method public static formatGenreYear(Lcom/vk/core/util/Resourcer;Ljava/util/List;I)Ljava/lang/CharSequence;
    .locals 7
    .param p0, "resourcer"    # Lcom/vk/core/util/Resourcer;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ljava/util/List;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p2, "year"    # I
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vk/core/util/Resourcer;",
            "Ljava/util/List",
            "<",
            "Lcom/vk/music/dto/Genre;",
            ">;I)",
            "Ljava/lang/CharSequence;"
        }
    .end annotation

    .prologue
    .local p1, "genres":Ljava/util/List;, "Ljava/util/List<Lcom/vk/music/dto/Genre;>;"
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 34
    if-eqz p1, :cond_0

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v5

    if-nez v5, :cond_2

    .line 35
    :cond_0
    const-string/jumbo v0, ""

    .line 47
    :cond_1
    :goto_0
    return-object v0

    .line 38
    :cond_2
    invoke-static {p1}, Lcom/vk/music/formatter/PlaylistFormatter;->formatGenres(Ljava/util/List;)Ljava/lang/String;

    move-result-object v0

    .line 39
    .local v0, "formattedGenres":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_3

    move v1, v3

    .local v1, "hasGenre":Z
    :goto_1
    if-eqz p2, :cond_4

    move v2, v3

    .line 40
    .local v2, "hasYear":Z
    :goto_2
    if-eqz v1, :cond_5

    if-eqz v2, :cond_5

    .line 41
    const v5, 0x7f0803ab

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    aput-object v0, v6, v4

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v6, v3

    invoke-virtual {p0, v5, v6}, Lcom/vk/core/util/Resourcer;->str(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .end local v1    # "hasGenre":Z
    .end local v2    # "hasYear":Z
    :cond_3
    move v1, v4

    .line 39
    goto :goto_1

    .restart local v1    # "hasGenre":Z
    :cond_4
    move v2, v4

    goto :goto_2

    .line 42
    .restart local v2    # "hasYear":Z
    :cond_5
    if-nez v1, :cond_1

    .line 44
    if-eqz v2, :cond_6

    .line 45
    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 47
    :cond_6
    const-string/jumbo v0, ""

    goto :goto_0
.end method

.method private static formatGenres(Ljava/util/List;)Ljava/lang/String;
    .locals 4
    .param p0    # Ljava/util/List;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/vk/music/dto/Genre;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 52
    .local p0, "genres":Ljava/util/List;, "Ljava/util/List<Lcom/vk/music/dto/Genre;>;"
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 53
    .local v0, "filtered":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vk/music/dto/Genre;

    .line 54
    .local v1, "genre":Lcom/vk/music/dto/Genre;
    if-eqz v1, :cond_0

    iget-object v3, v1, Lcom/vk/music/dto/Genre;->name:Ljava/lang/String;

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 55
    iget-object v3, v1, Lcom/vk/music/dto/Genre;->name:Ljava/lang/String;

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 58
    .end local v1    # "genre":Lcom/vk/music/dto/Genre;
    :cond_1
    const-string/jumbo v2, ", "

    invoke-static {v2, v0}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public static formatListenings(Lcom/vk/core/util/Resourcer;I)Ljava/lang/CharSequence;
    .locals 5
    .param p0, "resourcer"    # Lcom/vk/core/util/Resourcer;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "listenings"    # I
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    const/16 v0, 0x3e8

    .line 76
    if-nez p1, :cond_0

    .line 77
    const-string/jumbo v0, ""

    .line 80
    :goto_0
    return-object v0

    :cond_0
    const v1, 0x7f0d002a

    if-ge p1, v0, :cond_1

    move v0, p1

    :cond_1
    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    .line 83
    invoke-static {p1}, Lcom/vkontakte/android/Global;->formatNumber(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    .line 80
    invoke-virtual {p0, v1, v0, v2}, Lcom/vk/core/util/Resourcer;->pluralArg(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public static formatListeningsUpdateTime(Lcom/vk/core/util/Resourcer;IJ)Ljava/lang/CharSequence;
    .locals 6
    .param p0, "resourcer"    # Lcom/vk/core/util/Resourcer;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "listenings"    # I
    .param p2, "updateTime"    # J
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 116
    invoke-static {p0, p1}, Lcom/vk/music/formatter/PlaylistFormatter;->formatListenings(Lcom/vk/core/util/Resourcer;I)Ljava/lang/CharSequence;

    move-result-object v0

    .line 117
    .local v0, "listeningsFormatted":Ljava/lang/CharSequence;
    invoke-static {p0, p2, p3}, Lcom/vk/music/formatter/PlaylistFormatter;->formatUpdateTime(Lcom/vk/core/util/Resourcer;J)Ljava/lang/CharSequence;

    move-result-object v1

    .line 118
    .local v1, "updateTimeFormatted":Ljava/lang/CharSequence;
    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    move-result v2

    if-nez v2, :cond_0

    .line 123
    .end local v1    # "updateTimeFormatted":Ljava/lang/CharSequence;
    :goto_0
    return-object v1

    .line 120
    .restart local v1    # "updateTimeFormatted":Ljava/lang/CharSequence;
    :cond_0
    invoke-interface {v1}, Ljava/lang/CharSequence;->length()I

    move-result v2

    if-nez v2, :cond_1

    move-object v1, v0

    .line 121
    goto :goto_0

    .line 123
    :cond_1
    const v2, 0x7f0803ab

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v0, v3, v4

    const/4 v4, 0x1

    aput-object v1, v3, v4

    invoke-virtual {p0, v2, v3}, Lcom/vk/core/util/Resourcer;->str(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method public static formatTotalSongsDuration(Lcom/vk/core/util/Resourcer;IJ)Ljava/lang/CharSequence;
    .locals 6
    .param p0, "resourcer"    # Lcom/vk/core/util/Resourcer;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "songs"    # I
    .param p2, "seconds"    # J
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    const v4, 0x7f0d0031

    .line 129
    invoke-static {p0, p2, p3}, Lcom/vk/music/formatter/DurationFormatter;->formatDuration(Lcom/vk/core/util/Resourcer;J)Ljava/lang/CharSequence;

    move-result-object v0

    .line 130
    .local v0, "durationFormatted":Ljava/lang/CharSequence;
    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    move-result v1

    if-nez v1, :cond_0

    .line 131
    invoke-virtual {p0, v4, p1}, Lcom/vk/core/util/Resourcer;->pluralArg(II)Ljava/lang/String;

    move-result-object v1

    .line 133
    :goto_0
    return-object v1

    :cond_0
    const v1, 0x7f0803ab

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-virtual {p0, v4, p1}, Lcom/vk/core/util/Resourcer;->pluralArg(II)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x1

    aput-object v0, v2, v3

    invoke-virtual {p0, v1, v2}, Lcom/vk/core/util/Resourcer;->str(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method public static formatUpdateTime(Lcom/vk/core/util/Resourcer;J)Ljava/lang/CharSequence;
    .locals 7
    .param p0, "resourcer"    # Lcom/vk/core/util/Resourcer;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "updateTime"    # J
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 89
    const-wide/16 v2, 0x0

    cmp-long v2, p1, v2

    if-nez v2, :cond_0

    .line 90
    const-string/jumbo v2, ""

    .line 110
    :goto_0
    return-object v2

    .line 93
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    const-wide/16 v4, 0x3e8

    div-long/2addr v2, v4

    sub-long v0, v2, p1

    .line 95
    .local v0, "diff":J
    sget-object v2, Lcom/vk/music/formatter/Duration;->MINUTE:Lcom/vk/music/formatter/Duration;

    invoke-virtual {v2, v0, v1}, Lcom/vk/music/formatter/Duration;->isGreaterThan(J)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 96
    const v2, 0x7f0803ec

    invoke-virtual {p0, v2}, Lcom/vk/core/util/Resourcer;->str(I)Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    .line 99
    :cond_1
    sget-object v2, Lcom/vk/music/formatter/Duration;->HOUR:Lcom/vk/music/formatter/Duration;

    invoke-virtual {v2, v0, v1}, Lcom/vk/music/formatter/Duration;->isGreaterThan(J)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 100
    const v2, 0x7f0d002d

    sget-object v3, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v3, v0, v1}, Ljava/util/concurrent/TimeUnit;->toMinutes(J)J

    move-result-wide v4

    long-to-int v3, v4

    invoke-virtual {p0, v2, v3}, Lcom/vk/core/util/Resourcer;->pluralArg(II)Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    .line 101
    :cond_2
    sget-object v2, Lcom/vk/music/formatter/Duration;->DAY:Lcom/vk/music/formatter/Duration;

    invoke-virtual {v2, v0, v1}, Lcom/vk/music/formatter/Duration;->isGreaterThan(J)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 102
    const v2, 0x7f0d002c

    sget-object v3, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v3, v0, v1}, Ljava/util/concurrent/TimeUnit;->toHours(J)J

    move-result-wide v4

    long-to-int v3, v4

    invoke-virtual {p0, v2, v3}, Lcom/vk/core/util/Resourcer;->pluralArg(II)Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    .line 103
    :cond_3
    sget-object v2, Lcom/vk/music/formatter/Duration;->WEEK:Lcom/vk/music/formatter/Duration;

    invoke-virtual {v2, v0, v1}, Lcom/vk/music/formatter/Duration;->isGreaterThan(J)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 104
    const v2, 0x7f0d002b

    sget-object v3, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v3, v0, v1}, Ljava/util/concurrent/TimeUnit;->toDays(J)J

    move-result-wide v4

    long-to-int v3, v4

    invoke-virtual {p0, v2, v3}, Lcom/vk/core/util/Resourcer;->pluralArg(II)Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    .line 105
    :cond_4
    sget-object v2, Lcom/vk/music/formatter/Duration;->MONTH:Lcom/vk/music/formatter/Duration;

    invoke-virtual {v2, v0, v1}, Lcom/vk/music/formatter/Duration;->isGreaterThan(J)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 106
    const v2, 0x7f0d002f

    sget-object v3, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v3, v0, v1}, Ljava/util/concurrent/TimeUnit;->toDays(J)J

    move-result-wide v4

    long-to-int v3, v4

    div-int/lit8 v3, v3, 0x7

    invoke-virtual {p0, v2, v3}, Lcom/vk/core/util/Resourcer;->pluralArg(II)Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    .line 107
    :cond_5
    sget-object v2, Lcom/vk/music/formatter/Duration;->YEAR:Lcom/vk/music/formatter/Duration;

    invoke-virtual {v2, v0, v1}, Lcom/vk/music/formatter/Duration;->isGreaterThan(J)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 108
    const v2, 0x7f0d002e

    sget-object v3, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v3, v0, v1}, Ljava/util/concurrent/TimeUnit;->toDays(J)J

    move-result-wide v4

    long-to-int v3, v4

    div-int/lit8 v3, v3, 0x1e

    invoke-virtual {p0, v2, v3}, Lcom/vk/core/util/Resourcer;->pluralArg(II)Ljava/lang/String;

    move-result-object v2

    goto/16 :goto_0

    .line 110
    :cond_6
    const v2, 0x7f0d0030

    sget-object v3, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v3, v0, v1}, Ljava/util/concurrent/TimeUnit;->toDays(J)J

    move-result-wide v4

    long-to-int v3, v4

    div-int/lit16 v3, v3, 0x16d

    invoke-virtual {p0, v2, v3}, Lcom/vk/core/util/Resourcer;->pluralArg(II)Ljava/lang/String;

    move-result-object v2

    goto/16 :goto_0
.end method
