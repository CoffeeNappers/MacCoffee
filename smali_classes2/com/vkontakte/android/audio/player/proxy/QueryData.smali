.class Lcom/vkontakte/android/audio/player/proxy/QueryData;
.super Ljava/lang/Object;
.source "QueryData.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/audio/player/proxy/QueryData$LineReader;,
        Lcom/vkontakte/android/audio/player/proxy/QueryData$Range;
    }
.end annotation


# instance fields
.field public final headers:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public final httpVersion:Ljava/lang/String;

.field public final method:Ljava/lang/String;

.field public final parameters:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public final path:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;Ljava/util/Map;)V
    .locals 0
    .param p1, "method"    # Ljava/lang/String;
    .param p2, "path"    # Ljava/lang/String;
    .param p4, "httpVersion"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 24
    .local p3, "parameters":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .local p5, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    iput-object p1, p0, Lcom/vkontakte/android/audio/player/proxy/QueryData;->method:Ljava/lang/String;

    .line 26
    iput-object p2, p0, Lcom/vkontakte/android/audio/player/proxy/QueryData;->path:Ljava/lang/String;

    .line 27
    iput-object p3, p0, Lcom/vkontakte/android/audio/player/proxy/QueryData;->parameters:Ljava/util/Map;

    .line 28
    iput-object p4, p0, Lcom/vkontakte/android/audio/player/proxy/QueryData;->httpVersion:Ljava/lang/String;

    .line 29
    iput-object p5, p0, Lcom/vkontakte/android/audio/player/proxy/QueryData;->headers:Ljava/util/Map;

    .line 30
    return-void
.end method

.method public static read(Ljava/nio/channels/SocketChannel;I)Lcom/vkontakte/android/audio/player/proxy/QueryData;
    .locals 22
    .param p0, "socket"    # Ljava/nio/channels/SocketChannel;
    .param p1, "client"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 33
    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/Object;

    const/16 v20, 0x0

    const-string/jumbo v21, "Reading query data"

    aput-object v21, v2, v20

    const/16 v20, 0x1

    const-string/jumbo v21, "client"

    aput-object v21, v2, v20

    const/16 v20, 0x2

    invoke-static/range {p1 .. p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v21

    aput-object v21, v2, v20

    invoke-static {v2}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    .line 35
    new-instance v16, Lcom/vkontakte/android/audio/player/proxy/QueryData$LineReader;

    move-object/from16 v0, v16

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/vkontakte/android/audio/player/proxy/QueryData$LineReader;-><init>(Ljava/nio/channels/SocketChannel;)V

    .line 39
    .local v16, "reader":Lcom/vkontakte/android/audio/player/proxy/QueryData$LineReader;
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    .line 42
    .local v5, "parameters":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-virtual/range {v16 .. v16}, Lcom/vkontakte/android/audio/player/proxy/QueryData$LineReader;->readLine()Ljava/lang/String;

    move-result-object v10

    .line 43
    .local v10, "line":Ljava/lang/String;
    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/Object;

    const/16 v20, 0x0

    const-string/jumbo v21, "Query line"

    aput-object v21, v2, v20

    const/16 v20, 0x1

    const-string/jumbo v21, "line"

    aput-object v21, v2, v20

    const/16 v20, 0x2

    aput-object v10, v2, v20

    invoke-static {v2}, Lcom/vkontakte/android/utils/L;->v([Ljava/lang/Object;)V

    .line 45
    if-nez v10, :cond_0

    .line 46
    new-instance v2, Ljava/io/IOException;

    const-string/jumbo v20, "Empty first line"

    move-object/from16 v0, v20

    invoke-direct {v2, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 48
    :cond_0
    const-string/jumbo v2, " "

    const/16 v20, -0x1

    move/from16 v0, v20

    invoke-virtual {v10, v2, v0}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v15

    .line 49
    .local v15, "parts":[Ljava/lang/String;
    array-length v2, v15

    const/16 v20, 0x3

    move/from16 v0, v20

    if-ge v2, v0, :cond_1

    .line 50
    new-instance v2, Ljava/io/IOException;

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v21, "Malformed first line: "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-direct {v2, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 51
    :cond_1
    const/4 v2, 0x0

    aget-object v3, v15, v2

    .line 56
    .local v3, "method":Ljava/lang/String;
    const/4 v2, 0x1

    :try_start_0
    aget-object v2, v15, v2

    const-string/jumbo v20, "UTF-8"

    move-object/from16 v0, v20

    invoke-static {v2, v0}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v18

    .line 60
    .local v18, "str":Ljava/lang/String;
    const/16 v2, 0x3f

    move-object/from16 v0, v18

    invoke-virtual {v0, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v17

    .line 61
    .local v17, "separator":I
    if-gez v17, :cond_3

    .line 62
    move-object/from16 v4, v18

    .line 80
    .local v4, "path":Ljava/lang/String;
    :cond_2
    const/4 v2, 0x2

    aget-object v6, v15, v2

    .line 83
    .local v6, "httpVersion":Ljava/lang/String;
    new-instance v7, Ljava/util/HashMap;

    invoke-direct {v7}, Ljava/util/HashMap;-><init>()V

    .line 86
    .local v7, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :goto_0
    invoke-virtual/range {v16 .. v16}, Lcom/vkontakte/android/audio/player/proxy/QueryData$LineReader;->readLine()Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_6

    .line 87
    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/Object;

    const/16 v20, 0x0

    const-string/jumbo v21, "Header line"

    aput-object v21, v2, v20

    const/16 v20, 0x1

    const-string/jumbo v21, "line"

    aput-object v21, v2, v20

    const/16 v20, 0x2

    aput-object v10, v2, v20

    invoke-static {v2}, Lcom/vkontakte/android/utils/L;->v([Ljava/lang/Object;)V

    .line 88
    const/16 v2, 0x3a

    invoke-virtual {v10, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v8

    .line 89
    .local v8, "delimiter":I
    if-gez v8, :cond_5

    .line 90
    new-instance v2, Ljava/io/IOException;

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v21, "No \':\' symbol in header line: "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-direct {v2, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 57
    .end local v4    # "path":Ljava/lang/String;
    .end local v6    # "httpVersion":Ljava/lang/String;
    .end local v7    # "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v8    # "delimiter":I
    .end local v17    # "separator":I
    .end local v18    # "str":Ljava/lang/String;
    :catch_0
    move-exception v9

    .line 58
    .local v9, "e":Ljava/io/UnsupportedEncodingException;
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2, v9}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v2

    .line 64
    .end local v9    # "e":Ljava/io/UnsupportedEncodingException;
    .restart local v17    # "separator":I
    .restart local v18    # "str":Ljava/lang/String;
    :cond_3
    const/4 v2, 0x0

    move-object/from16 v0, v18

    move/from16 v1, v17

    invoke-virtual {v0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    .line 65
    .restart local v4    # "path":Ljava/lang/String;
    add-int/lit8 v2, v17, 0x1

    move-object/from16 v0, v18

    invoke-virtual {v0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v14

    .line 66
    .local v14, "params":Ljava/lang/String;
    invoke-virtual {v14}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_2

    .line 67
    const-string/jumbo v2, "&"

    invoke-virtual {v14, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v13

    .line 68
    .local v13, "namesAndValues":[Ljava/lang/String;
    array-length v0, v13

    move/from16 v20, v0

    const/4 v2, 0x0

    :goto_1
    move/from16 v0, v20

    if-ge v2, v0, :cond_2

    aget-object v12, v13, v2

    .line 69
    .local v12, "nameAndValue":Ljava/lang/String;
    const/16 v21, 0x3d

    move/from16 v0, v21

    invoke-virtual {v12, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v8

    .line 70
    .restart local v8    # "delimiter":I
    if-gez v8, :cond_4

    .line 71
    new-instance v2, Ljava/io/IOException;

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v21, "No \'=\' symbol in query parameter: "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-direct {v2, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 72
    :cond_4
    const/16 v21, 0x0

    move/from16 v0, v21

    invoke-virtual {v12, v0, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v11

    .line 73
    .local v11, "name":Ljava/lang/String;
    add-int/lit8 v21, v8, 0x1

    move/from16 v0, v21

    invoke-virtual {v12, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v19

    .line 74
    .local v19, "value":Ljava/lang/String;
    move-object/from16 v0, v19

    invoke-interface {v5, v11, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 68
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 91
    .end local v11    # "name":Ljava/lang/String;
    .end local v12    # "nameAndValue":Ljava/lang/String;
    .end local v13    # "namesAndValues":[Ljava/lang/String;
    .end local v14    # "params":Ljava/lang/String;
    .end local v19    # "value":Ljava/lang/String;
    .restart local v6    # "httpVersion":Ljava/lang/String;
    .restart local v7    # "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_5
    const/4 v2, 0x0

    invoke-virtual {v10, v2, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v11

    .line 92
    .restart local v11    # "name":Ljava/lang/String;
    add-int/lit8 v2, v8, 0x1

    invoke-virtual {v10, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v19

    .line 93
    .restart local v19    # "value":Ljava/lang/String;
    move-object/from16 v0, v19

    invoke-interface {v7, v11, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_0

    .line 97
    .end local v8    # "delimiter":I
    .end local v11    # "name":Ljava/lang/String;
    .end local v19    # "value":Ljava/lang/String;
    :cond_6
    new-instance v2, Lcom/vkontakte/android/audio/player/proxy/QueryData;

    invoke-direct/range {v2 .. v7}, Lcom/vkontakte/android/audio/player/proxy/QueryData;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;Ljava/util/Map;)V

    return-object v2
.end method


# virtual methods
.method public getRange()Lcom/vkontakte/android/audio/player/proxy/QueryData$Range;
    .locals 12

    .prologue
    .line 101
    iget-object v9, p0, Lcom/vkontakte/android/audio/player/proxy/QueryData;->headers:Ljava/util/Map;

    const-string/jumbo v10, "Range"

    invoke-interface {v9, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 102
    .local v5, "rangeHeader":Ljava/lang/String;
    if-eqz v5, :cond_5

    .line 103
    const-wide/16 v0, -0x1

    .line 104
    .local v0, "from":J
    const-wide/16 v10, -0x1

    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    .line 106
    .local v7, "to":Ljava/lang/Long;
    const/16 v9, 0x2f

    invoke-virtual {v5, v9}, Ljava/lang/String;->indexOf(I)I

    move-result v3

    .line 107
    .local v3, "indexOfSlash":I
    if-ltz v3, :cond_0

    .line 108
    const/4 v9, 0x0

    invoke-virtual {v5, v9, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    .line 109
    :cond_0
    const-string/jumbo v9, "="

    const/4 v10, -0x1

    invoke-virtual {v5, v9, v10}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v4

    .line 110
    .local v4, "parts":[Ljava/lang/String;
    array-length v9, v4

    const/4 v10, 0x2

    if-ne v9, v10, :cond_2

    .line 111
    const-string/jumbo v9, "bytes"

    const/4 v10, 0x0

    aget-object v10, v4, v10

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_2

    .line 112
    const/4 v9, 0x1

    aget-object v9, v4, v9

    const-string/jumbo v10, "-"

    const/4 v11, -0x1

    invoke-virtual {v9, v10, v11}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v6

    .line 113
    .local v6, "ranges":[Ljava/lang/String;
    array-length v9, v6

    const/4 v10, 0x2

    if-ne v9, v10, :cond_2

    .line 114
    const/4 v9, 0x0

    aget-object v9, v6, v9

    invoke-static {v9}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    .line 115
    .local v2, "fromEmpty":Z
    const/4 v9, 0x1

    aget-object v9, v6, v9

    invoke-static {v9}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    .line 117
    .local v8, "toEmpty":Z
    if-eqz v2, :cond_1

    if-nez v8, :cond_2

    .line 119
    :cond_1
    if-eqz v2, :cond_3

    const-wide/16 v0, 0x0

    .line 125
    :goto_0
    if-eqz v8, :cond_4

    const/4 v7, 0x0

    .line 134
    .end local v2    # "fromEmpty":Z
    .end local v6    # "ranges":[Ljava/lang/String;
    .end local v8    # "toEmpty":Z
    :cond_2
    :goto_1
    new-instance v9, Lcom/vkontakte/android/audio/player/proxy/QueryData$Range;

    invoke-direct {v9, v0, v1, v7}, Lcom/vkontakte/android/audio/player/proxy/QueryData$Range;-><init>(JLjava/lang/Long;)V

    .line 137
    .end local v0    # "from":J
    .end local v3    # "indexOfSlash":I
    .end local v4    # "parts":[Ljava/lang/String;
    .end local v7    # "to":Ljava/lang/Long;
    :goto_2
    return-object v9

    .line 119
    .restart local v0    # "from":J
    .restart local v2    # "fromEmpty":Z
    .restart local v3    # "indexOfSlash":I
    .restart local v4    # "parts":[Ljava/lang/String;
    .restart local v6    # "ranges":[Ljava/lang/String;
    .restart local v7    # "to":Ljava/lang/Long;
    .restart local v8    # "toEmpty":Z
    :cond_3
    const/4 v9, 0x0

    :try_start_0
    aget-object v9, v6, v9

    invoke-static {v9}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-wide v0

    goto :goto_0

    .line 125
    :cond_4
    const/4 v9, 0x1

    :try_start_1
    aget-object v9, v6, v9

    invoke-static {v9}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v10

    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v7

    goto :goto_1

    .line 137
    .end local v0    # "from":J
    .end local v2    # "fromEmpty":Z
    .end local v3    # "indexOfSlash":I
    .end local v4    # "parts":[Ljava/lang/String;
    .end local v6    # "ranges":[Ljava/lang/String;
    .end local v7    # "to":Ljava/lang/Long;
    .end local v8    # "toEmpty":Z
    :cond_5
    const/4 v9, 0x0

    goto :goto_2

    .line 126
    .restart local v0    # "from":J
    .restart local v2    # "fromEmpty":Z
    .restart local v3    # "indexOfSlash":I
    .restart local v4    # "parts":[Ljava/lang/String;
    .restart local v6    # "ranges":[Ljava/lang/String;
    .restart local v7    # "to":Ljava/lang/Long;
    .restart local v8    # "toEmpty":Z
    :catch_0
    move-exception v9

    goto :goto_1

    .line 120
    :catch_1
    move-exception v9

    goto :goto_0
.end method
