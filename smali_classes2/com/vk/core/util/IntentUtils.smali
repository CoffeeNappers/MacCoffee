.class public Lcom/vk/core/util/IntentUtils;
.super Ljava/lang/Object;
.source "IntentUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/core/util/IntentUtils$ResolveCallback;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Ljava/io/File;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Ljava/io/File;

    .prologue
    .line 27
    invoke-static {p0}, Lcom/vk/core/util/IntentUtils;->getImageMimeType(Ljava/io/File;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$100(Ljava/io/File;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Ljava/io/File;

    .prologue
    .line 27
    invoke-static {p0}, Lcom/vk/core/util/IntentUtils;->getVideoMimeType(Ljava/io/File;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$200(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;
    .locals 1
    .param p0, "x0"    # Ljava/io/File;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 27
    invoke-static {p0, p1}, Lcom/vk/core/util/IntentUtils;->renameByMimeType(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method private static checkIsMedia(Landroid/app/Activity;Ljava/io/File;Lcom/vk/core/util/IntentUtils$ResolveCallback;)V
    .locals 3
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "file"    # Ljava/io/File;
    .param p2, "resolveCallback"    # Lcom/vk/core/util/IntentUtils$ResolveCallback;

    .prologue
    .line 198
    new-instance v0, Lcom/vk/core/util/IntentUtils$1;

    invoke-direct {v0, p0, p2, p1}, Lcom/vk/core/util/IntentUtils$1;-><init>(Landroid/app/Activity;Lcom/vk/core/util/IntentUtils$ResolveCallback;Ljava/io/File;)V

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/io/File;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    .line 229
    invoke-virtual {v0, v1}, Lcom/vk/core/util/IntentUtils$1;->execPool([Ljava/lang/Object;)Lcom/vk/attachpicker/util/AsyncTask;

    .line 230
    return-void
.end method

.method public static dispatchImageIntent(Landroid/app/Activity;I)V
    .locals 2
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "requestCode"    # I

    .prologue
    .line 30
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 31
    .local v0, "intent":Landroid/content/Intent;
    const-string/jumbo v1, "image/*"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 32
    const-string/jumbo v1, "android.intent.action.GET_CONTENT"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 34
    :try_start_0
    const-string/jumbo v1, "Select Picture"

    invoke-static {v0, v1}, Landroid/content/Intent;->createChooser(Landroid/content/Intent;Ljava/lang/CharSequence;)Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {p0, v1, p1}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 38
    :goto_0
    return-void

    .line 35
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method public static dispatchImageIntent(Landroid/app/Fragment;I)V
    .locals 2
    .param p0, "fragment"    # Landroid/app/Fragment;
    .param p1, "requestCode"    # I

    .prologue
    .line 41
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 42
    .local v0, "intent":Landroid/content/Intent;
    const-string/jumbo v1, "image/*"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 43
    const-string/jumbo v1, "android.intent.action.GET_CONTENT"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 44
    const-string/jumbo v1, "Select Picture"

    invoke-static {v0, v1}, Landroid/content/Intent;->createChooser(Landroid/content/Intent;Ljava/lang/CharSequence;)Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {p0, v1, p1}, Landroid/app/Fragment;->startActivityForResult(Landroid/content/Intent;I)V

    .line 45
    return-void
.end method

.method public static dispatchVideoIntent(Landroid/app/Fragment;I)V
    .locals 2
    .param p0, "fragment"    # Landroid/app/Fragment;
    .param p1, "requestCode"    # I

    .prologue
    .line 48
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 49
    .local v0, "intent":Landroid/content/Intent;
    const-string/jumbo v1, "video/*"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 50
    const-string/jumbo v1, "android.intent.action.GET_CONTENT"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 51
    const-string/jumbo v1, "Select Video"

    invoke-static {v0, v1}, Landroid/content/Intent;->createChooser(Landroid/content/Intent;Ljava/lang/CharSequence;)Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {p0, v1, p1}, Landroid/app/Fragment;->startActivityForResult(Landroid/content/Intent;I)V

    .line 52
    return-void
.end method

.method private static downloadUri(Landroid/app/Activity;Landroid/net/Uri;Lcom/vk/core/util/IntentUtils$ResolveCallback;)V
    .locals 3
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "selectedUri"    # Landroid/net/Uri;
    .param p2, "resolveCallback"    # Lcom/vk/core/util/IntentUtils$ResolveCallback;

    .prologue
    .line 233
    new-instance v0, Lcom/vk/core/util/IntentUtils$2;

    invoke-direct {v0, p0, p2, p1}, Lcom/vk/core/util/IntentUtils$2;-><init>(Landroid/app/Activity;Lcom/vk/core/util/IntentUtils$ResolveCallback;Landroid/net/Uri;)V

    const/4 v1, 0x1

    new-array v1, v1, [Landroid/net/Uri;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    .line 313
    invoke-virtual {v0, v1}, Lcom/vk/core/util/IntentUtils$2;->execPool([Ljava/lang/Object;)Lcom/vk/attachpicker/util/AsyncTask;

    .line 314
    return-void
.end method

.method public static getDataColumn(Landroid/content/Context;Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;
    .locals 10
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "selection"    # Ljava/lang/String;
    .param p3, "selectionArgs"    # [Ljava/lang/String;

    .prologue
    const/4 v9, 0x0

    .line 152
    const/4 v8, 0x0

    .line 153
    .local v8, "cursor":Landroid/database/Cursor;
    const-string/jumbo v6, "_data"

    .line 154
    .local v6, "column":Ljava/lang/String;
    const/4 v0, 0x1

    new-array v2, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string/jumbo v1, "_data"

    aput-object v1, v2, v0

    .line 159
    .local v2, "projection":[Ljava/lang/String;
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const/4 v5, 0x0

    move-object v1, p1

    move-object v3, p2

    move-object v4, p3

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8

    .line 161
    if-eqz v8, :cond_1

    invoke-interface {v8}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 162
    const-string/jumbo v0, "_data"

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v7

    .line 163
    .local v7, "column_index":I
    invoke-interface {v8, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    .line 166
    if-eqz v8, :cond_0

    .line 167
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    .line 169
    .end local v7    # "column_index":I
    :cond_0
    :goto_0
    return-object v0

    .line 166
    :cond_1
    if-eqz v8, :cond_2

    .line 167
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    :cond_2
    move-object v0, v9

    .line 169
    goto :goto_0

    .line 166
    :catchall_0
    move-exception v0

    if-eqz v8, :cond_3

    .line 167
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    :cond_3
    throw v0
.end method

.method private static getImageMimeType(Ljava/io/File;)Ljava/lang/String;
    .locals 5
    .param p0, "file"    # Ljava/io/File;

    .prologue
    const/4 v2, 0x0

    const/4 v4, -0x1

    .line 318
    :try_start_0
    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 319
    .local v0, "options":Landroid/graphics/BitmapFactory$Options;
    const/4 v3, 0x1

    iput-boolean v3, v0, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 320
    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3, v0}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 321
    iget v3, v0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    if-eq v3, v4, :cond_0

    iget v3, v0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    if-eq v3, v4, :cond_0

    .line 322
    iget-object v2, v0, Landroid/graphics/BitmapFactory$Options;->outMimeType:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 327
    .end local v0    # "options":Landroid/graphics/BitmapFactory$Options;
    :cond_0
    :goto_0
    return-object v2

    .line 326
    :catch_0
    move-exception v1

    .line 327
    .local v1, "t":Ljava/lang/Throwable;
    goto :goto_0
.end method

.method public static getPathFromUri(Landroid/content/Context;Landroid/net/Uri;)Ljava/lang/String;
    .locals 14
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "uri"    # Landroid/net/Uri;

    .prologue
    const/4 v4, 0x1

    const/4 v10, 0x0

    const/4 v9, 0x0

    .line 76
    :try_start_0
    sget v11, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v12, 0x13

    if-lt v11, v12, :cond_1

    .line 79
    .local v4, "isKitKat":Z
    :goto_0
    if-eqz v4, :cond_7

    invoke-static {p0, p1}, Landroid/provider/DocumentsContract;->isDocumentUri(Landroid/content/Context;Landroid/net/Uri;)Z

    move-result v10

    if-eqz v10, :cond_7

    .line 81
    invoke-static {p1}, Lcom/vk/core/util/IntentUtils;->isExternalStorageDocument(Landroid/net/Uri;)Z

    move-result v10

    if-eqz v10, :cond_2

    .line 82
    invoke-static {p1}, Landroid/provider/DocumentsContract;->getDocumentId(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v1

    .line 83
    .local v1, "docId":Ljava/lang/String;
    const-string/jumbo v10, ":"

    invoke-virtual {v1, v10}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v7

    .line 84
    .local v7, "split":[Ljava/lang/String;
    const/4 v10, 0x0

    aget-object v8, v7, v10

    .line 86
    .local v8, "type":Ljava/lang/String;
    const-string/jumbo v10, "primary"

    invoke-virtual {v10, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_0

    .line 87
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string/jumbo v11, "/"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const/4 v11, 0x1

    aget-object v11, v7, v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 135
    .end local v1    # "docId":Ljava/lang/String;
    .end local v4    # "isKitKat":Z
    .end local v7    # "split":[Ljava/lang/String;
    .end local v8    # "type":Ljava/lang/String;
    :cond_0
    :goto_1
    return-object v9

    :cond_1
    move v4, v10

    .line 76
    goto :goto_0

    .line 93
    .restart local v4    # "isKitKat":Z
    :cond_2
    invoke-static {p1}, Lcom/vk/core/util/IntentUtils;->isDownloadsDocument(Landroid/net/Uri;)Z

    move-result v10

    if-eqz v10, :cond_3

    .line 95
    invoke-static {p1}, Landroid/provider/DocumentsContract;->getDocumentId(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v3

    .line 96
    .local v3, "id":Ljava/lang/String;
    const-string/jumbo v10, "content://downloads/public_downloads"

    .line 97
    invoke-static {v10}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v10

    invoke-static {v3}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/Long;->longValue()J

    move-result-wide v12

    .line 96
    invoke-static {v10, v12, v13}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v0

    .line 99
    .local v0, "contentUri":Landroid/net/Uri;
    const/4 v10, 0x0

    const/4 v11, 0x0

    invoke-static {p0, v0, v10, v11}, Lcom/vk/core/util/IntentUtils;->getDataColumn(Landroid/content/Context;Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    goto :goto_1

    .line 102
    .end local v0    # "contentUri":Landroid/net/Uri;
    .end local v3    # "id":Ljava/lang/String;
    :cond_3
    invoke-static {p1}, Lcom/vk/core/util/IntentUtils;->isMediaDocument(Landroid/net/Uri;)Z

    move-result v10

    if-eqz v10, :cond_0

    .line 103
    invoke-static {p1}, Landroid/provider/DocumentsContract;->getDocumentId(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v1

    .line 104
    .restart local v1    # "docId":Ljava/lang/String;
    const-string/jumbo v10, ":"

    invoke-virtual {v1, v10}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v7

    .line 105
    .restart local v7    # "split":[Ljava/lang/String;
    const/4 v10, 0x0

    aget-object v8, v7, v10

    .line 107
    .restart local v8    # "type":Ljava/lang/String;
    const/4 v0, 0x0

    .line 108
    .restart local v0    # "contentUri":Landroid/net/Uri;
    const-string/jumbo v10, "image"

    invoke-virtual {v10, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_5

    .line 109
    sget-object v0, Landroid/provider/MediaStore$Images$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    .line 116
    :cond_4
    :goto_2
    const-string/jumbo v5, "_id=?"

    .line 117
    .local v5, "selection":Ljava/lang/String;
    const/4 v10, 0x1

    new-array v6, v10, [Ljava/lang/String;

    const/4 v10, 0x0

    const/4 v11, 0x1

    aget-object v11, v7, v11

    aput-object v11, v6, v10

    .line 121
    .local v6, "selectionArgs":[Ljava/lang/String;
    const-string/jumbo v10, "_id=?"

    invoke-static {p0, v0, v10, v6}, Lcom/vk/core/util/IntentUtils;->getDataColumn(Landroid/content/Context;Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    goto :goto_1

    .line 110
    .end local v5    # "selection":Ljava/lang/String;
    .end local v6    # "selectionArgs":[Ljava/lang/String;
    :cond_5
    const-string/jumbo v10, "video"

    invoke-virtual {v10, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_6

    .line 111
    sget-object v0, Landroid/provider/MediaStore$Video$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    goto :goto_2

    .line 112
    :cond_6
    const-string/jumbo v10, "audio"

    invoke-virtual {v10, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_4

    .line 113
    sget-object v0, Landroid/provider/MediaStore$Audio$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    goto :goto_2

    .line 125
    .end local v0    # "contentUri":Landroid/net/Uri;
    .end local v1    # "docId":Ljava/lang/String;
    .end local v7    # "split":[Ljava/lang/String;
    .end local v8    # "type":Ljava/lang/String;
    :cond_7
    const-string/jumbo v10, "content"

    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_8

    .line 126
    const/4 v10, 0x0

    const/4 v11, 0x0

    invoke-static {p0, p1, v10, v11}, Lcom/vk/core/util/IntentUtils;->getDataColumn(Landroid/content/Context;Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    goto/16 :goto_1

    .line 129
    :cond_8
    const-string/jumbo v10, "file"

    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_0

    .line 130
    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v9

    goto/16 :goto_1

    .line 134
    .end local v4    # "isKitKat":Z
    :catch_0
    move-exception v2

    .line 135
    .local v2, "e":Ljava/lang/Exception;
    goto/16 :goto_1
.end method

.method private static getVideoMimeType(Ljava/io/File;)Ljava/lang/String;
    .locals 8
    .param p0, "file"    # Ljava/io/File;

    .prologue
    const/4 v3, 0x0

    .line 333
    :try_start_0
    new-instance v1, Landroid/media/MediaMetadataRetriever;

    invoke-direct {v1}, Landroid/media/MediaMetadataRetriever;-><init>()V

    .line 334
    .local v1, "m":Landroid/media/MediaMetadataRetriever;
    invoke-static {p0}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v4

    invoke-virtual {v4}, Landroid/net/Uri;->getEncodedPath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Landroid/media/MediaMetadataRetriever;->setDataSource(Ljava/lang/String;)V

    .line 335
    const/16 v4, 0x9

    invoke-virtual {v1, v4}, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;

    move-result-object v0

    .line 336
    .local v0, "duration":Ljava/lang/String;
    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v4

    const-wide/16 v6, 0x0

    cmp-long v4, v4, v6

    if-lez v4, :cond_0

    const/16 v4, 0xc

    .line 337
    invoke-virtual {v1, v4}, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 340
    .end local v0    # "duration":Ljava/lang/String;
    .end local v1    # "m":Landroid/media/MediaMetadataRetriever;
    :cond_0
    :goto_0
    return-object v3

    .line 339
    :catch_0
    move-exception v2

    .line 340
    .local v2, "t":Ljava/lang/Throwable;
    goto :goto_0
.end method

.method public static handleResult(Landroid/app/Activity;Landroid/content/Intent;Lcom/vk/core/util/IntentUtils$ResolveCallback;)V
    .locals 3
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "result"    # Landroid/content/Intent;
    .param p2, "resolveCallback"    # Lcom/vk/core/util/IntentUtils$ResolveCallback;

    .prologue
    .line 55
    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v1

    .line 56
    .local v1, "selectedImageUri":Landroid/net/Uri;
    invoke-static {p0, v1}, Lcom/vk/core/util/IntentUtils;->getPathFromUri(Landroid/content/Context;Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v0

    .line 57
    .local v0, "path":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 58
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {p0, v2, p2}, Lcom/vk/core/util/IntentUtils;->checkIsMedia(Landroid/app/Activity;Ljava/io/File;Lcom/vk/core/util/IntentUtils$ResolveCallback;)V

    .line 62
    :goto_0
    return-void

    .line 60
    :cond_0
    invoke-static {p0, v1, p2}, Lcom/vk/core/util/IntentUtils;->downloadUri(Landroid/app/Activity;Landroid/net/Uri;Lcom/vk/core/util/IntentUtils$ResolveCallback;)V

    goto :goto_0
.end method

.method public static isDownloadsDocument(Landroid/net/Uri;)Z
    .locals 2
    .param p0, "uri"    # Landroid/net/Uri;

    .prologue
    .line 186
    const-string/jumbo v0, "com.android.providers.downloads.documents"

    invoke-virtual {p0}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public static isExternalStorageDocument(Landroid/net/Uri;)Z
    .locals 2
    .param p0, "uri"    # Landroid/net/Uri;

    .prologue
    .line 178
    const-string/jumbo v0, "com.android.externalstorage.documents"

    invoke-virtual {p0}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public static isMediaDocument(Landroid/net/Uri;)Z
    .locals 2
    .param p0, "uri"    # Landroid/net/Uri;

    .prologue
    .line 194
    const-string/jumbo v0, "com.android.providers.media.documents"

    invoke-virtual {p0}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method private static renameByMimeType(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;
    .locals 8
    .param p0, "file"    # Ljava/io/File;
    .param p1, "mimeType"    # Ljava/lang/String;

    .prologue
    .line 345
    const-string/jumbo v5, "/"

    invoke-virtual {p1, v5}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v5

    add-int/lit8 v5, v5, 0x1

    invoke-virtual {p1, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 346
    .local v0, "ext":Ljava/lang/String;
    invoke-virtual {p0}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v4

    .line 347
    .local v4, "path":Ljava/lang/String;
    invoke-virtual {p0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v1

    .line 348
    .local v1, "name":Ljava/lang/String;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v6, 0x0

    const-string/jumbo v7, "."

    invoke-virtual {v1, v7}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v7

    invoke-virtual {v1, v6, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const/16 v6, 0x2e

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 349
    .local v3, "newName":Ljava/lang/String;
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v4, v3}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 350
    .local v2, "newFile":Ljava/io/File;
    invoke-virtual {p0, v2}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 353
    .end local v2    # "newFile":Ljava/io/File;
    :goto_0
    return-object v2

    .restart local v2    # "newFile":Ljava/io/File;
    :cond_0
    move-object v2, p0

    goto :goto_0
.end method
