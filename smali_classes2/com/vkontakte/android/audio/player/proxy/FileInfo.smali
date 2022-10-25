.class public Lcom/vkontakte/android/audio/player/proxy/FileInfo;
.super Ljava/lang/Object;
.source "FileInfo.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/audio/player/proxy/FileInfo$Part;
    }
.end annotation


# instance fields
.field private mContentLength:J

.field private mContentType:Ljava/lang/String;

.field private final mFile:Ljava/io/File;

.field public final mRanges:Lcom/vkontakte/android/utils/RangesList;


# direct methods
.method public constructor <init>(Ljava/io/File;)V
    .locals 4
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    new-instance v0, Lcom/vkontakte/android/utils/RangesList;

    invoke-direct {v0}, Lcom/vkontakte/android/utils/RangesList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/audio/player/proxy/FileInfo;->mRanges:Lcom/vkontakte/android/utils/RangesList;

    .line 24
    new-instance v0, Ljava/io/File;

    invoke-virtual {p1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, ".info"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/vkontakte/android/audio/player/proxy/FileInfo;->mFile:Ljava/io/File;

    .line 25
    return-void
.end method

.method private clear()V
    .locals 2

    .prologue
    .line 175
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/vkontakte/android/audio/player/proxy/FileInfo;->mContentLength:J

    .line 176
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/audio/player/proxy/FileInfo;->mContentType:Ljava/lang/String;

    .line 177
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/proxy/FileInfo;->mRanges:Lcom/vkontakte/android/utils/RangesList;

    invoke-virtual {v0}, Lcom/vkontakte/android/utils/RangesList;->clear()V

    .line 178
    return-void
.end method


# virtual methods
.method public addRange(JJ)V
    .locals 1
    .param p1, "from"    # J
    .param p3, "to"    # J

    .prologue
    .line 86
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/proxy/FileInfo;->mRanges:Lcom/vkontakte/android/utils/RangesList;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/vkontakte/android/utils/RangesList;->add(JJ)V

    .line 87
    return-void
.end method

.method public delete()V
    .locals 1

    .prologue
    .line 125
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/proxy/FileInfo;->mFile:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 126
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/proxy/FileInfo;->clear()V

    .line 127
    return-void
.end method

.method public getContentLength()J
    .locals 2

    .prologue
    .line 47
    iget-wide v0, p0, Lcom/vkontakte/android/audio/player/proxy/FileInfo;->mContentLength:J

    return-wide v0
.end method

.method public getContentType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 69
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/proxy/FileInfo;->mContentType:Ljava/lang/String;

    return-object v0
.end method

.method public getFromFirstRanges()J
    .locals 4

    .prologue
    .line 55
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/proxy/FileInfo;->mRanges:Lcom/vkontakte/android/utils/RangesList;

    invoke-virtual {v1}, Lcom/vkontakte/android/utils/RangesList;->getFirst()Lcom/vkontakte/android/utils/RangesList$Entry;

    move-result-object v0

    .line 56
    .local v0, "firstEntry":Lcom/vkontakte/android/utils/RangesList$Entry;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/vkontakte/android/utils/RangesList$Entry;->from()J

    move-result-wide v2

    :goto_0
    return-wide v2

    :cond_0
    const-wide/16 v2, 0x0

    goto :goto_0
.end method

.method public getToFirstRanges()J
    .locals 4

    .prologue
    .line 60
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/proxy/FileInfo;->mRanges:Lcom/vkontakte/android/utils/RangesList;

    invoke-virtual {v1}, Lcom/vkontakte/android/utils/RangesList;->getFirst()Lcom/vkontakte/android/utils/RangesList$Entry;

    move-result-object v0

    .line 61
    .local v0, "firstEntry":Lcom/vkontakte/android/utils/RangesList$Entry;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/vkontakte/android/utils/RangesList$Entry;->to()J

    move-result-wide v2

    :goto_0
    return-wide v2

    :cond_0
    const-wide/16 v2, 0x0

    goto :goto_0
.end method

.method public isCountRangesIsOne()Z
    .locals 1

    .prologue
    .line 51
    iget-object v0, p0, Lcom/vkontakte/android/audio/player/proxy/FileInfo;->mRanges:Lcom/vkontakte/android/utils/RangesList;

    invoke-virtual {v0}, Lcom/vkontakte/android/utils/RangesList;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public isWithingRanges(J)Z
    .locals 3
    .param p1, "position"    # J

    .prologue
    .line 77
    iget-object v1, p0, Lcom/vkontakte/android/audio/player/proxy/FileInfo;->mRanges:Lcom/vkontakte/android/utils/RangesList;

    invoke-virtual {v1}, Lcom/vkontakte/android/utils/RangesList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/utils/RangesList$Entry;

    .line 78
    .local v0, "range":Lcom/vkontakte/android/utils/RangesList$Entry;
    invoke-virtual {v0, p1, p2}, Lcom/vkontakte/android/utils/RangesList$Entry;->contains(J)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 79
    const/4 v1, 0x1

    .line 82
    .end local v0    # "range":Lcom/vkontakte/android/utils/RangesList$Entry;
    :goto_0
    return v1

    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public load()V
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 90
    new-instance v3, Ljava/io/DataInputStream;

    new-instance v5, Ljava/io/FileInputStream;

    iget-object v8, p0, Lcom/vkontakte/android/audio/player/proxy/FileInfo;->mFile:Ljava/io/File;

    invoke-direct {v5, v8}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v3, v5}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    .line 92
    .local v3, "in":Ljava/io/DataInputStream;
    :try_start_0
    invoke-virtual {v3}, Ljava/io/DataInputStream;->readLong()J

    move-result-wide v8

    iput-wide v8, p0, Lcom/vkontakte/android/audio/player/proxy/FileInfo;->mContentLength:J

    .line 93
    invoke-virtual {v3}, Ljava/io/DataInputStream;->readBoolean()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 94
    invoke-virtual {v3}, Ljava/io/DataInputStream;->readUTF()Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lcom/vkontakte/android/audio/player/proxy/FileInfo;->mContentType:Ljava/lang/String;

    .line 95
    :cond_0
    invoke-virtual {v3}, Ljava/io/DataInputStream;->readInt()I

    move-result v4

    .line 96
    .local v4, "rangeCount":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v4, :cond_1

    .line 97
    invoke-virtual {v3}, Ljava/io/DataInputStream;->readLong()J

    move-result-wide v0

    .line 98
    .local v0, "from":J
    invoke-virtual {v3}, Ljava/io/DataInputStream;->readLong()J

    move-result-wide v6

    .line 99
    .local v6, "to":J
    iget-object v5, p0, Lcom/vkontakte/android/audio/player/proxy/FileInfo;->mRanges:Lcom/vkontakte/android/utils/RangesList;

    invoke-virtual {v5, v0, v1, v6, v7}, Lcom/vkontakte/android/utils/RangesList;->add(JJ)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 96
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 102
    .end local v0    # "from":J
    .end local v6    # "to":J
    :cond_1
    invoke-static {v3}, Lcom/vkontakte/android/audio/utils/Utils;->closeCloseable(Ljava/io/Closeable;)V

    .line 104
    return-void

    .line 102
    .end local v2    # "i":I
    .end local v4    # "rangeCount":I
    :catchall_0
    move-exception v5

    invoke-static {v3}, Lcom/vkontakte/android/audio/utils/Utils;->closeCloseable(Ljava/io/Closeable;)V

    throw v5
.end method

.method public save()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 107
    new-instance v0, Ljava/io/DataOutputStream;

    new-instance v2, Ljava/io/FileOutputStream;

    iget-object v3, p0, Lcom/vkontakte/android/audio/player/proxy/FileInfo;->mFile:Ljava/io/File;

    invoke-direct {v2, v3}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v0, v2}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 109
    .local v0, "out":Ljava/io/DataOutputStream;
    :try_start_0
    iget-wide v2, p0, Lcom/vkontakte/android/audio/player/proxy/FileInfo;->mContentLength:J

    invoke-virtual {v0, v2, v3}, Ljava/io/DataOutputStream;->writeLong(J)V

    .line 110
    iget-object v2, p0, Lcom/vkontakte/android/audio/player/proxy/FileInfo;->mContentType:Ljava/lang/String;

    if-eqz v2, :cond_1

    const/4 v2, 0x1

    :goto_0
    invoke-virtual {v0, v2}, Ljava/io/DataOutputStream;->writeBoolean(Z)V

    .line 111
    iget-object v2, p0, Lcom/vkontakte/android/audio/player/proxy/FileInfo;->mContentType:Ljava/lang/String;

    if-eqz v2, :cond_0

    .line 112
    iget-object v2, p0, Lcom/vkontakte/android/audio/player/proxy/FileInfo;->mContentType:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/io/DataOutputStream;->writeUTF(Ljava/lang/String;)V

    .line 113
    :cond_0
    iget-object v2, p0, Lcom/vkontakte/android/audio/player/proxy/FileInfo;->mRanges:Lcom/vkontakte/android/utils/RangesList;

    invoke-virtual {v2}, Lcom/vkontakte/android/utils/RangesList;->size()I

    move-result v2

    invoke-virtual {v0, v2}, Ljava/io/DataOutputStream;->writeInt(I)V

    .line 114
    iget-object v2, p0, Lcom/vkontakte/android/audio/player/proxy/FileInfo;->mRanges:Lcom/vkontakte/android/utils/RangesList;

    invoke-virtual {v2}, Lcom/vkontakte/android/utils/RangesList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/utils/RangesList$Entry;

    .line 115
    .local v1, "range":Lcom/vkontakte/android/utils/RangesList$Entry;
    invoke-virtual {v1}, Lcom/vkontakte/android/utils/RangesList$Entry;->from()J

    move-result-wide v4

    invoke-virtual {v0, v4, v5}, Ljava/io/DataOutputStream;->writeLong(J)V

    .line 116
    invoke-virtual {v1}, Lcom/vkontakte/android/utils/RangesList$Entry;->to()J

    move-result-wide v4

    invoke-virtual {v0, v4, v5}, Ljava/io/DataOutputStream;->writeLong(J)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    .line 119
    .end local v1    # "range":Lcom/vkontakte/android/utils/RangesList$Entry;
    :catchall_0
    move-exception v2

    invoke-static {v0}, Lcom/vkontakte/android/audio/utils/Utils;->closeCloseable(Ljava/io/Closeable;)V

    throw v2

    .line 110
    :cond_1
    const/4 v2, 0x0

    goto :goto_0

    .line 119
    :cond_2
    invoke-static {v0}, Lcom/vkontakte/android/audio/utils/Utils;->closeCloseable(Ljava/io/Closeable;)V

    .line 121
    return-void
.end method

.method public setContentLength(J)V
    .locals 1
    .param p1, "contentLength"    # J

    .prologue
    .line 65
    iput-wide p1, p0, Lcom/vkontakte/android/audio/player/proxy/FileInfo;->mContentLength:J

    .line 66
    return-void
.end method

.method public setContentType(Ljava/lang/String;)V
    .locals 0
    .param p1, "contentType"    # Ljava/lang/String;

    .prologue
    .line 73
    iput-object p1, p0, Lcom/vkontakte/android/audio/player/proxy/FileInfo;->mContentType:Ljava/lang/String;

    .line 74
    return-void
.end method

.method public split(Lcom/vkontakte/android/audio/player/proxy/QueryData$Range;)Ljava/util/List;
    .locals 30
    .param p1, "range"    # Lcom/vkontakte/android/audio/player/proxy/QueryData$Range;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vkontakte/android/audio/player/proxy/QueryData$Range;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/audio/player/proxy/FileInfo$Part;",
            ">;"
        }
    .end annotation

    .prologue
    .line 130
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 131
    .local v2, "parts":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/audio/player/proxy/FileInfo$Part;>;"
    if-nez p1, :cond_1

    const-wide/16 v28, 0x0

    .line 133
    .local v28, "from":J
    :goto_0
    if-eqz p1, :cond_2

    move-object/from16 v0, p1

    iget-object v3, v0, Lcom/vkontakte/android/audio/player/proxy/QueryData$Range;->to:Ljava/lang/Long;

    if-eqz v3, :cond_2

    .line 134
    move-object/from16 v0, p1

    iget-object v3, v0, Lcom/vkontakte/android/audio/player/proxy/QueryData$Range;->to:Ljava/lang/Long;

    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    .line 140
    .local v6, "to":J
    :goto_1
    move-wide/from16 v4, v28

    .line 142
    .local v4, "p":J
    :goto_2
    const-wide/16 v12, -0x1

    .line 143
    .local v12, "downloadedToMax":J
    const-wide v18, 0x7fffffffffffffffL

    .line 144
    .local v18, "notDownloadedFromMin":J
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/audio/player/proxy/FileInfo;->mRanges:Lcom/vkontakte/android/utils/RangesList;

    invoke-virtual {v3}, Lcom/vkontakte/android/utils/RangesList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    :goto_3
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_5

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v27

    check-cast v27, Lcom/vkontakte/android/utils/RangesList$Entry;

    .line 145
    .local v27, "r":Lcom/vkontakte/android/utils/RangesList$Entry;
    move-object/from16 v0, v27

    invoke-virtual {v0, v4, v5}, Lcom/vkontakte/android/utils/RangesList$Entry;->contains(J)Z

    move-result v8

    if-eqz v8, :cond_4

    .line 146
    invoke-virtual/range {v27 .. v27}, Lcom/vkontakte/android/utils/RangesList$Entry;->to()J

    move-result-wide v8

    cmp-long v8, v8, v12

    if-lez v8, :cond_0

    .line 147
    invoke-virtual/range {v27 .. v27}, Lcom/vkontakte/android/utils/RangesList$Entry;->to()J

    move-result-wide v12

    goto :goto_3

    .line 131
    .end local v4    # "p":J
    .end local v6    # "to":J
    .end local v12    # "downloadedToMax":J
    .end local v18    # "notDownloadedFromMin":J
    .end local v27    # "r":Lcom/vkontakte/android/utils/RangesList$Entry;
    .end local v28    # "from":J
    :cond_1
    move-object/from16 v0, p1

    iget-wide v0, v0, Lcom/vkontakte/android/audio/player/proxy/QueryData$Range;->from:J

    move-wide/from16 v28, v0

    goto :goto_0

    .line 135
    .restart local v28    # "from":J
    :cond_2
    move-object/from16 v0, p0

    iget-wide v8, v0, Lcom/vkontakte/android/audio/player/proxy/FileInfo;->mContentLength:J

    const-wide/16 v10, 0x0

    cmp-long v3, v8, v10

    if-lez v3, :cond_3

    .line 136
    move-object/from16 v0, p0

    iget-wide v8, v0, Lcom/vkontakte/android/audio/player/proxy/FileInfo;->mContentLength:J

    const-wide/16 v10, 0x1

    sub-long v6, v8, v10

    .restart local v6    # "to":J
    goto :goto_1

    .line 138
    .end local v6    # "to":J
    :cond_3
    const-wide v6, 0x7fffffffffffffffL

    .restart local v6    # "to":J
    goto :goto_1

    .line 148
    .restart local v4    # "p":J
    .restart local v12    # "downloadedToMax":J
    .restart local v18    # "notDownloadedFromMin":J
    .restart local v27    # "r":Lcom/vkontakte/android/utils/RangesList$Entry;
    :cond_4
    invoke-virtual/range {v27 .. v27}, Lcom/vkontakte/android/utils/RangesList$Entry;->from()J

    move-result-wide v8

    cmp-long v8, v8, v4

    if-lez v8, :cond_0

    invoke-virtual/range {v27 .. v27}, Lcom/vkontakte/android/utils/RangesList$Entry;->from()J

    move-result-wide v8

    cmp-long v8, v8, v18

    if-gez v8, :cond_0

    .line 149
    invoke-virtual/range {v27 .. v27}, Lcom/vkontakte/android/utils/RangesList$Entry;->from()J

    move-result-wide v18

    goto :goto_3

    .line 151
    .end local v27    # "r":Lcom/vkontakte/android/utils/RangesList$Entry;
    :cond_5
    const-wide/16 v8, 0x0

    cmp-long v3, v12, v8

    if-ltz v3, :cond_7

    .line 152
    cmp-long v3, v6, v12

    if-gtz v3, :cond_6

    .line 153
    new-instance v3, Lcom/vkontakte/android/audio/player/proxy/FileInfo$Part;

    const/4 v8, 0x1

    invoke-direct/range {v3 .. v8}, Lcom/vkontakte/android/audio/player/proxy/FileInfo$Part;-><init>(JJZ)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 171
    :goto_4
    return-object v2

    .line 156
    :cond_6
    new-instance v9, Lcom/vkontakte/android/audio/player/proxy/FileInfo$Part;

    const/4 v14, 0x1

    move-wide v10, v4

    invoke-direct/range {v9 .. v14}, Lcom/vkontakte/android/audio/player/proxy/FileInfo$Part;-><init>(JJZ)V

    invoke-virtual {v2, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 157
    const-wide/16 v8, 0x1

    add-long v4, v12, v8

    goto/16 :goto_2

    .line 158
    :cond_7
    const-wide v8, 0x7fffffffffffffffL

    cmp-long v3, v18, v8

    if-gez v3, :cond_9

    .line 159
    cmp-long v3, v6, v12

    if-gtz v3, :cond_8

    .line 160
    new-instance v3, Lcom/vkontakte/android/audio/player/proxy/FileInfo$Part;

    const/4 v8, 0x0

    invoke-direct/range {v3 .. v8}, Lcom/vkontakte/android/audio/player/proxy/FileInfo$Part;-><init>(JJZ)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_4

    .line 163
    :cond_8
    new-instance v15, Lcom/vkontakte/android/audio/player/proxy/FileInfo$Part;

    const/16 v20, 0x0

    move-wide/from16 v16, v4

    invoke-direct/range {v15 .. v20}, Lcom/vkontakte/android/audio/player/proxy/FileInfo$Part;-><init>(JJZ)V

    invoke-virtual {v2, v15}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 164
    const-wide/16 v8, 0x1

    add-long v4, v18, v8

    goto/16 :goto_2

    .line 166
    :cond_9
    new-instance v21, Lcom/vkontakte/android/audio/player/proxy/FileInfo$Part;

    const-wide/16 v24, -0x1

    const/16 v26, 0x0

    move-wide/from16 v22, v4

    invoke-direct/range {v21 .. v26}, Lcom/vkontakte/android/audio/player/proxy/FileInfo$Part;-><init>(JJZ)V

    move-object/from16 v0, v21

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_4
.end method

.method public toString()Ljava/lang/String;
    .locals 8

    .prologue
    .line 29
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 30
    .local v2, "ranges":Ljava/lang/StringBuilder;
    const/16 v3, 0x5b

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 31
    iget-object v3, p0, Lcom/vkontakte/android/audio/player/proxy/FileInfo;->mRanges:Lcom/vkontakte/android/utils/RangesList;

    invoke-virtual {v3}, Lcom/vkontakte/android/utils/RangesList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/vkontakte/android/utils/RangesList$Entry;>;"
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 32
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/utils/RangesList$Entry;

    .line 33
    .local v1, "range":Lcom/vkontakte/android/utils/RangesList$Entry;
    const/16 v3, 0x28

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 34
    invoke-virtual {v1}, Lcom/vkontakte/android/utils/RangesList$Entry;->from()J

    move-result-wide v4

    invoke-virtual {v2, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 35
    const-string/jumbo v3, ", "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    invoke-virtual {v1}, Lcom/vkontakte/android/utils/RangesList$Entry;->to()J

    move-result-wide v4

    invoke-virtual {v2, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 37
    const/16 v3, 0x29

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 38
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 39
    const-string/jumbo v3, ", "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 41
    .end local v1    # "range":Lcom/vkontakte/android/utils/RangesList$Entry;
    :cond_1
    const/16 v3, 0x5d

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 43
    const/4 v3, 0x6

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    const-string/jumbo v5, "contentLength"

    aput-object v5, v3, v4

    const/4 v4, 0x1

    iget-wide v6, p0, Lcom/vkontakte/android/audio/player/proxy/FileInfo;->mContentLength:J

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x2

    const-string/jumbo v5, "contentType"

    aput-object v5, v3, v4

    const/4 v4, 0x3

    iget-object v5, p0, Lcom/vkontakte/android/audio/player/proxy/FileInfo;->mContentType:Ljava/lang/String;

    aput-object v5, v3, v4

    const/4 v4, 0x4

    const-string/jumbo v5, "ranges"

    aput-object v5, v3, v4

    const/4 v4, 0x5

    aput-object v2, v3, v4

    invoke-static {p0, v3}, Lcom/vkontakte/android/audio/utils/Utils;->objectToString(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method
