.class public Lcom/vkontakte/android/media/ViewedSegments;
.super Ljava/lang/Object;
.source "ViewedSegments.java"


# static fields
.field private static final SAVE_PERIOD:J = 0x2710L


# instance fields
.field private currentRange:Lcom/vkontakte/android/utils/Range;

.field private lastSave:J

.field private lastSessionSent:Z

.field private ownerId:I

.field private final preferences:Landroid/content/SharedPreferences;

.field private referrer:Ljava/lang/String;

.field private videoId:I

.field private final viewedRanges:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/utils/Range;",
            ">;"
        }
    .end annotation
.end field

.field private final viewedSessionHistory:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/media/ViewedSegments;->viewedSessionHistory:Ljava/util/Map;

    .line 22
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/media/ViewedSegments;->viewedRanges:Ljava/util/List;

    .line 32
    const-string/jumbo v0, "video_stats"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/media/ViewedSegments;->preferences:Landroid/content/SharedPreferences;

    .line 33
    return-void
.end method


# virtual methods
.method public closeCurrentRange()V
    .locals 6

    .prologue
    .line 105
    iget-object v2, p0, Lcom/vkontakte/android/media/ViewedSegments;->currentRange:Lcom/vkontakte/android/utils/Range;

    if-eqz v2, :cond_2

    .line 106
    iget-object v2, p0, Lcom/vkontakte/android/media/ViewedSegments;->currentRange:Lcom/vkontakte/android/utils/Range;

    invoke-virtual {v2}, Lcom/vkontakte/android/utils/Range;->getStart()J

    move-result-wide v2

    iget-object v4, p0, Lcom/vkontakte/android/media/ViewedSegments;->currentRange:Lcom/vkontakte/android/utils/Range;

    invoke-virtual {v4}, Lcom/vkontakte/android/utils/Range;->getEnd()J

    move-result-wide v4

    cmp-long v2, v2, v4

    if-eqz v2, :cond_0

    .line 107
    iget-object v2, p0, Lcom/vkontakte/android/media/ViewedSegments;->viewedRanges:Ljava/util/List;

    iget-object v3, p0, Lcom/vkontakte/android/media/ViewedSegments;->currentRange:Lcom/vkontakte/android/utils/Range;

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 109
    :cond_0
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/vkontakte/android/media/ViewedSegments;->currentRange:Lcom/vkontakte/android/utils/Range;

    .line 110
    const-wide/16 v2, 0x0

    iput-wide v2, p0, Lcom/vkontakte/android/media/ViewedSegments;->lastSave:J

    .line 112
    new-instance v1, Ljava/util/LinkedHashSet;

    invoke-direct {v1}, Ljava/util/LinkedHashSet;-><init>()V

    .line 113
    .local v1, "ranges":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    iget-object v2, p0, Lcom/vkontakte/android/media/ViewedSegments;->viewedRanges:Ljava/util/List;

    invoke-static {v2}, Lcom/vkontakte/android/utils/Range;->merge(Ljava/util/List;)Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/utils/Range;

    .line 114
    .local v0, "range":Lcom/vkontakte/android/utils/Range;
    invoke-virtual {v0}, Lcom/vkontakte/android/utils/Range;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 116
    .end local v0    # "range":Lcom/vkontakte/android/utils/Range;
    :cond_1
    iget-object v2, p0, Lcom/vkontakte/android/media/ViewedSegments;->preferences:Landroid/content/SharedPreferences;

    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->clear()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    const-string/jumbo v3, "referrer"

    iget-object v4, p0, Lcom/vkontakte/android/media/ViewedSegments;->referrer:Ljava/lang/String;

    .line 117
    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    const-string/jumbo v3, "video_id"

    iget v4, p0, Lcom/vkontakte/android/media/ViewedSegments;->videoId:I

    .line 118
    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    const-string/jumbo v3, "owner_id"

    iget v4, p0, Lcom/vkontakte/android/media/ViewedSegments;->ownerId:I

    .line 119
    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    const-string/jumbo v3, "ranges"

    .line 120
    invoke-interface {v2, v3, v1}, Landroid/content/SharedPreferences$Editor;->putStringSet(Ljava/lang/String;Ljava/util/Set;)Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    .line 121
    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 123
    .end local v1    # "ranges":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    :cond_2
    return-void
.end method

.method public sendLastSessionStats()V
    .locals 13

    .prologue
    const/4 v5, 0x0

    const/4 v12, 0x1

    const/4 v11, 0x0

    .line 36
    iget-boolean v0, p0, Lcom/vkontakte/android/media/ViewedSegments;->lastSessionSent:Z

    if-nez v0, :cond_2

    .line 37
    iput-boolean v12, p0, Lcom/vkontakte/android/media/ViewedSegments;->lastSessionSent:Z

    .line 39
    iget-object v0, p0, Lcom/vkontakte/android/media/ViewedSegments;->preferences:Landroid/content/SharedPreferences;

    const-string/jumbo v1, "current_range"

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/media/ViewedSegments;->preferences:Landroid/content/SharedPreferences;

    const-string/jumbo v1, "ranges"

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 40
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/media/ViewedSegments;->preferences:Landroid/content/SharedPreferences;

    const-string/jumbo v1, "video_id"

    invoke-interface {v0, v1, v11}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v3

    .line 41
    .local v3, "videoId":I
    iget-object v0, p0, Lcom/vkontakte/android/media/ViewedSegments;->preferences:Landroid/content/SharedPreferences;

    const-string/jumbo v1, "owner_id"

    invoke-interface {v0, v1, v11}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v2

    .line 42
    .local v2, "ownerId":I
    iget-object v0, p0, Lcom/vkontakte/android/media/ViewedSegments;->preferences:Landroid/content/SharedPreferences;

    const-string/jumbo v1, "referrer"

    invoke-interface {v0, v1, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 44
    .local v4, "referrer":Ljava/lang/String;
    iget-object v0, p0, Lcom/vkontakte/android/media/ViewedSegments;->preferences:Landroid/content/SharedPreferences;

    const-string/jumbo v1, "current_range"

    invoke-interface {v0, v1, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 45
    .local v6, "currentRange":Ljava/lang/String;
    iget-object v0, p0, Lcom/vkontakte/android/media/ViewedSegments;->preferences:Landroid/content/SharedPreferences;

    const-string/jumbo v1, "ranges"

    invoke-static {}, Ljava/util/Collections;->emptySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v0, v1, v5}, Landroid/content/SharedPreferences;->getStringSet(Ljava/lang/String;Ljava/util/Set;)Ljava/util/Set;

    move-result-object v9

    .line 46
    .local v9, "ranges":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    if-eqz v3, :cond_1

    if-eqz v2, :cond_1

    .line 48
    :try_start_0
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 49
    .local v10, "viewedRanges":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/utils/Range;>;"
    invoke-interface {v9}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    .line 50
    .local v8, "range":Ljava/lang/String;
    new-instance v1, Lcom/vkontakte/android/utils/Range;

    invoke-direct {v1, v8}, Lcom/vkontakte/android/utils/Range;-><init>(Ljava/lang/String;)V

    invoke-interface {v10, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 56
    .end local v8    # "range":Ljava/lang/String;
    .end local v10    # "viewedRanges":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/utils/Range;>;"
    :catch_0
    move-exception v7

    .line 57
    .local v7, "e":Ljava/lang/Exception;
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Object;

    const-string/jumbo v1, "VK"

    aput-object v1, v0, v11

    aput-object v7, v0, v12

    invoke-static {v0}, Lcom/vkontakte/android/utils/L;->e([Ljava/lang/Object;)V

    .line 58
    invoke-static {v7}, Lcom/vk/analytics/Analytics;->logException(Ljava/lang/Throwable;)V

    .line 62
    .end local v7    # "e":Ljava/lang/Exception;
    :cond_1
    :goto_1
    iget-object v0, p0, Lcom/vkontakte/android/media/ViewedSegments;->preferences:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->clear()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 65
    .end local v2    # "ownerId":I
    .end local v3    # "videoId":I
    .end local v4    # "referrer":Ljava/lang/String;
    .end local v6    # "currentRange":Ljava/lang/String;
    .end local v9    # "ranges":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    :cond_2
    return-void

    .line 52
    .restart local v2    # "ownerId":I
    .restart local v3    # "videoId":I
    .restart local v4    # "referrer":Ljava/lang/String;
    .restart local v6    # "currentRange":Ljava/lang/String;
    .restart local v9    # "ranges":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .restart local v10    # "viewedRanges":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/utils/Range;>;"
    :cond_3
    if-eqz v6, :cond_4

    .line 53
    :try_start_1
    new-instance v0, Lcom/vkontakte/android/utils/Range;

    invoke-direct {v0, v6}, Lcom/vkontakte/android/utils/Range;-><init>(Ljava/lang/String;)V

    invoke-interface {v10, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 55
    :cond_4
    new-instance v0, Lcom/vkontakte/android/api/video/VideoViewSegments;

    invoke-static {v10}, Lcom/vkontakte/android/utils/Range;->merge(Ljava/util/List;)Ljava/util/Set;

    move-result-object v1

    const/4 v5, 0x0

    invoke-direct/range {v0 .. v5}, Lcom/vkontakte/android/api/video/VideoViewSegments;-><init>(Ljava/util/Set;IILjava/lang/String;I)V

    invoke-virtual {v0}, Lcom/vkontakte/android/api/video/VideoViewSegments;->exec()Lcom/vkontakte/android/api/VKAPIRequest;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1
.end method

.method public sendViewedRanges()V
    .locals 11

    .prologue
    .line 126
    invoke-virtual {p0}, Lcom/vkontakte/android/media/ViewedSegments;->closeCurrentRange()V

    .line 127
    iget-object v0, p0, Lcom/vkontakte/android/media/ViewedSegments;->viewedRanges:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    .line 128
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget v2, p0, Lcom/vkontakte/android/media/ViewedSegments;->videoId:I

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v2, "_"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v2, p0, Lcom/vkontakte/android/media/ViewedSegments;->ownerId:I

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 129
    .local v6, "id":Ljava/lang/String;
    iget-object v0, p0, Lcom/vkontakte/android/media/ViewedSegments;->viewedSessionHistory:Ljava/util/Map;

    invoke-interface {v0, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/Long;

    .line 130
    .local v10, "viewedLength":Ljava/lang/Long;
    iget-object v0, p0, Lcom/vkontakte/android/media/ViewedSegments;->viewedRanges:Ljava/util/List;

    invoke-static {v0}, Lcom/vkontakte/android/utils/Range;->merge(Ljava/util/List;)Ljava/util/Set;

    move-result-object v7

    .line 131
    .local v7, "merged":Ljava/util/Set;, "Ljava/util/Set<Lcom/vkontakte/android/utils/Range;>;"
    invoke-static {v7}, Lcom/vkontakte/android/utils/Range;->getLength(Ljava/util/Collection;)J

    move-result-wide v8

    .line 132
    .local v8, "length":J
    if-eqz v10, :cond_0

    invoke-virtual {v10}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    cmp-long v0, v8, v2

    if-lez v0, :cond_1

    .line 133
    :cond_0
    new-instance v1, Ljava/util/LinkedHashSet;

    invoke-direct {v1, v7}, Ljava/util/LinkedHashSet;-><init>(Ljava/util/Collection;)V

    .line 134
    .local v1, "ranges":Ljava/util/Set;, "Ljava/util/Set<Lcom/vkontakte/android/utils/Range;>;"
    new-instance v0, Lcom/vkontakte/android/api/video/VideoViewSegments;

    iget v2, p0, Lcom/vkontakte/android/media/ViewedSegments;->ownerId:I

    iget v3, p0, Lcom/vkontakte/android/media/ViewedSegments;->videoId:I

    iget-object v4, p0, Lcom/vkontakte/android/media/ViewedSegments;->referrer:Ljava/lang/String;

    const/4 v5, 0x0

    invoke-direct/range {v0 .. v5}, Lcom/vkontakte/android/api/video/VideoViewSegments;-><init>(Ljava/util/Set;IILjava/lang/String;I)V

    invoke-virtual {v0}, Lcom/vkontakte/android/api/video/VideoViewSegments;->exec()Lcom/vkontakte/android/api/VKAPIRequest;

    .line 135
    iget-object v0, p0, Lcom/vkontakte/android/media/ViewedSegments;->viewedSessionHistory:Ljava/util/Map;

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-interface {v0, v6, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 136
    iget-object v0, p0, Lcom/vkontakte/android/media/ViewedSegments;->viewedRanges:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 137
    iget-object v0, p0, Lcom/vkontakte/android/media/ViewedSegments;->preferences:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->clear()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 140
    .end local v1    # "ranges":Ljava/util/Set;, "Ljava/util/Set<Lcom/vkontakte/android/utils/Range;>;"
    .end local v6    # "id":Ljava/lang/String;
    .end local v7    # "merged":Ljava/util/Set;, "Ljava/util/Set<Lcom/vkontakte/android/utils/Range;>;"
    .end local v8    # "length":J
    .end local v10    # "viewedLength":Ljava/lang/Long;
    :cond_1
    return-void
.end method

.method public setCurrentVideo(IILjava/lang/String;)V
    .locals 2
    .param p1, "videoId"    # I
    .param p2, "ownerId"    # I
    .param p3, "referrer"    # Ljava/lang/String;

    .prologue
    .line 68
    invoke-virtual {p0}, Lcom/vkontakte/android/media/ViewedSegments;->sendLastSessionStats()V

    .line 69
    iput p1, p0, Lcom/vkontakte/android/media/ViewedSegments;->videoId:I

    .line 70
    iput p2, p0, Lcom/vkontakte/android/media/ViewedSegments;->ownerId:I

    .line 71
    iput-object p3, p0, Lcom/vkontakte/android/media/ViewedSegments;->referrer:Ljava/lang/String;

    .line 72
    iget-object v0, p0, Lcom/vkontakte/android/media/ViewedSegments;->viewedRanges:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 73
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/media/ViewedSegments;->currentRange:Lcom/vkontakte/android/utils/Range;

    .line 74
    iget-object v0, p0, Lcom/vkontakte/android/media/ViewedSegments;->preferences:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->clear()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string/jumbo v1, "referrer"

    .line 75
    invoke-interface {v0, v1, p3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string/jumbo v1, "video_id"

    .line 76
    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string/jumbo v1, "owner_id"

    .line 77
    invoke-interface {v0, v1, p2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 78
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 79
    return-void
.end method

.method public updateCurrentRange(I)V
    .locals 8
    .param p1, "sec"    # I

    .prologue
    .line 82
    iget-object v3, p0, Lcom/vkontakte/android/media/ViewedSegments;->currentRange:Lcom/vkontakte/android/utils/Range;

    if-nez v3, :cond_0

    .line 83
    new-instance v3, Lcom/vkontakte/android/utils/Range;

    int-to-long v4, p1

    int-to-long v6, p1

    invoke-direct {v3, v4, v5, v6, v7}, Lcom/vkontakte/android/utils/Range;-><init>(JJ)V

    iput-object v3, p0, Lcom/vkontakte/android/media/ViewedSegments;->currentRange:Lcom/vkontakte/android/utils/Range;

    .line 87
    :goto_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    iget-wide v6, p0, Lcom/vkontakte/android/media/ViewedSegments;->lastSave:J

    sub-long/2addr v4, v6

    const-wide/16 v6, 0x2710

    cmp-long v3, v4, v6

    if-lez v3, :cond_2

    .line 88
    iget-object v0, p0, Lcom/vkontakte/android/media/ViewedSegments;->currentRange:Lcom/vkontakte/android/utils/Range;

    .line 89
    .local v0, "curRange":Lcom/vkontakte/android/utils/Range;
    new-instance v2, Ljava/util/LinkedHashSet;

    invoke-direct {v2}, Ljava/util/LinkedHashSet;-><init>()V

    .line 90
    .local v2, "ranges":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    iget-object v3, p0, Lcom/vkontakte/android/media/ViewedSegments;->viewedRanges:Ljava/util/List;

    invoke-static {v3}, Lcom/vkontakte/android/utils/Range;->merge(Ljava/util/List;)Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/utils/Range;

    .line 91
    .local v1, "range":Lcom/vkontakte/android/utils/Range;
    invoke-virtual {v1}, Lcom/vkontakte/android/utils/Range;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 85
    .end local v0    # "curRange":Lcom/vkontakte/android/utils/Range;
    .end local v1    # "range":Lcom/vkontakte/android/utils/Range;
    .end local v2    # "ranges":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    :cond_0
    iget-object v3, p0, Lcom/vkontakte/android/media/ViewedSegments;->currentRange:Lcom/vkontakte/android/utils/Range;

    int-to-long v4, p1

    invoke-virtual {v3, v4, v5}, Lcom/vkontakte/android/utils/Range;->setEnd(J)V

    goto :goto_0

    .line 93
    .restart local v0    # "curRange":Lcom/vkontakte/android/utils/Range;
    .restart local v2    # "ranges":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    :cond_1
    iget-object v3, p0, Lcom/vkontakte/android/media/ViewedSegments;->preferences:Landroid/content/SharedPreferences;

    invoke-interface {v3}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    invoke-interface {v3}, Landroid/content/SharedPreferences$Editor;->clear()Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    const-string/jumbo v4, "referrer"

    iget-object v5, p0, Lcom/vkontakte/android/media/ViewedSegments;->referrer:Ljava/lang/String;

    .line 94
    invoke-interface {v3, v4, v5}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    const-string/jumbo v4, "video_id"

    iget v5, p0, Lcom/vkontakte/android/media/ViewedSegments;->videoId:I

    .line 95
    invoke-interface {v3, v4, v5}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    const-string/jumbo v4, "owner_id"

    iget v5, p0, Lcom/vkontakte/android/media/ViewedSegments;->ownerId:I

    .line 96
    invoke-interface {v3, v4, v5}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    const-string/jumbo v4, "ranges"

    .line 97
    invoke-interface {v3, v4, v2}, Landroid/content/SharedPreferences$Editor;->putStringSet(Ljava/lang/String;Ljava/util/Set;)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    const-string/jumbo v5, "current_range"

    if-nez v0, :cond_3

    const/4 v3, 0x0

    .line 98
    :goto_2
    invoke-interface {v4, v5, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    .line 99
    invoke-interface {v3}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 100
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    iput-wide v4, p0, Lcom/vkontakte/android/media/ViewedSegments;->lastSave:J

    .line 102
    .end local v0    # "curRange":Lcom/vkontakte/android/utils/Range;
    .end local v2    # "ranges":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    :cond_2
    return-void

    .line 98
    .restart local v0    # "curRange":Lcom/vkontakte/android/utils/Range;
    .restart local v2    # "ranges":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    :cond_3
    invoke-virtual {v0}, Lcom/vkontakte/android/utils/Range;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_2
.end method
