.class Lcom/vkontakte/android/upload/UploadUtils$KitKatPathResolver;
.super Lcom/vkontakte/android/upload/UploadUtils$BasePathResolver;
.source "UploadUtils.java"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x13
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/upload/UploadUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "KitKatPathResolver"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    .prologue
    .line 180
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/vkontakte/android/upload/UploadUtils$BasePathResolver;-><init>(Lcom/vkontakte/android/upload/UploadUtils$1;)V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/upload/UploadUtils$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/upload/UploadUtils$1;

    .prologue
    .line 180
    invoke-direct {p0}, Lcom/vkontakte/android/upload/UploadUtils$KitKatPathResolver;-><init>()V

    return-void
.end method

.method static isDownloadsDocument(Landroid/net/Uri;)Z
    .locals 2
    .param p0, "uri"    # Landroid/net/Uri;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 195
    const-string/jumbo v0, "com.android.providers.downloads.documents"

    invoke-virtual {p0}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method static isExternalStorageDocument(Landroid/net/Uri;)Z
    .locals 2
    .param p0, "uri"    # Landroid/net/Uri;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 187
    const-string/jumbo v0, "com.android.externalstorage.documents"

    invoke-virtual {p0}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method static isMediaDocument(Landroid/net/Uri;)Z
    .locals 2
    .param p0, "uri"    # Landroid/net/Uri;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 203
    const-string/jumbo v0, "com.android.providers.media.documents"

    invoke-virtual {p0}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method


# virtual methods
.method resolveContentName(Landroid/net/Uri;)Ljava/lang/String;
    .locals 11
    .param p1, "uri"    # Landroid/net/Uri;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    const/4 v10, 0x0

    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 260
    sget-object v7, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-static {v7, p1}, Landroid/provider/DocumentsContract;->isDocumentUri(Landroid/content/Context;Landroid/net/Uri;)Z

    move-result v7

    if-eqz v7, :cond_7

    .line 261
    invoke-static {p1}, Lcom/vkontakte/android/upload/UploadUtils$KitKatPathResolver;->isExternalStorageDocument(Landroid/net/Uri;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 263
    invoke-static {p1}, Landroid/provider/DocumentsContract;->getDocumentId(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v1

    .line 264
    .local v1, "docId":Ljava/lang/String;
    const-string/jumbo v7, ":"

    invoke-virtual {v1, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    .line 265
    .local v5, "split":[Ljava/lang/String;
    aget-object v6, v5, v8

    .line 267
    .local v6, "type":Ljava/lang/String;
    const-string/jumbo v7, "primary"

    invoke-virtual {v7, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 268
    aget-object v7, v5, v9

    .line 304
    .end local v1    # "docId":Ljava/lang/String;
    .end local v5    # "split":[Ljava/lang/String;
    .end local v6    # "type":Ljava/lang/String;
    :goto_0
    return-object v7

    .line 271
    .restart local v1    # "docId":Ljava/lang/String;
    .restart local v5    # "split":[Ljava/lang/String;
    .restart local v6    # "type":Ljava/lang/String;
    :cond_0
    const-string/jumbo v7, "unknown"

    goto :goto_0

    .line 273
    .end local v1    # "docId":Ljava/lang/String;
    .end local v5    # "split":[Ljava/lang/String;
    .end local v6    # "type":Ljava/lang/String;
    :cond_1
    invoke-static {p1}, Lcom/vkontakte/android/upload/UploadUtils$KitKatPathResolver;->isDownloadsDocument(Landroid/net/Uri;)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 275
    invoke-static {p1}, Landroid/provider/DocumentsContract;->getDocumentId(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v2

    .line 276
    .local v2, "id":Ljava/lang/String;
    const-string/jumbo v7, "content://downloads/public_downloads"

    invoke-static {v7}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v7

    invoke-static {v2}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v8

    invoke-static {v7, v8, v9}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v0

    .line 278
    .local v0, "contentUri":Landroid/net/Uri;
    const-string/jumbo v7, "_display_name"

    invoke-static {v0, v7, v10, v10}, Lcom/vkontakte/android/upload/UploadUtils$KitKatPathResolver;->getColumnValue(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    goto :goto_0

    .line 279
    .end local v0    # "contentUri":Landroid/net/Uri;
    .end local v2    # "id":Ljava/lang/String;
    :cond_2
    invoke-static {p1}, Lcom/vkontakte/android/upload/UploadUtils$KitKatPathResolver;->isMediaDocument(Landroid/net/Uri;)Z

    move-result v7

    if-eqz v7, :cond_6

    .line 281
    invoke-static {p1}, Landroid/provider/DocumentsContract;->getDocumentId(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v1

    .line 282
    .restart local v1    # "docId":Ljava/lang/String;
    const-string/jumbo v7, ":"

    invoke-virtual {v1, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    .line 283
    .restart local v5    # "split":[Ljava/lang/String;
    aget-object v6, v5, v8

    .line 286
    .restart local v6    # "type":Ljava/lang/String;
    const-string/jumbo v7, "image"

    invoke-virtual {v7, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 287
    sget-object v0, Landroid/provider/MediaStore$Images$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    .line 296
    .restart local v0    # "contentUri":Landroid/net/Uri;
    :goto_1
    const-string/jumbo v3, "_id=?"

    .line 297
    .local v3, "selection":Ljava/lang/String;
    new-array v4, v9, [Ljava/lang/String;

    aget-object v7, v5, v9

    aput-object v7, v4, v8

    .line 299
    .local v4, "selectionArgs":[Ljava/lang/String;
    const-string/jumbo v7, "_display_name"

    const-string/jumbo v8, "_id=?"

    invoke-static {v0, v7, v8, v4}, Lcom/vkontakte/android/upload/UploadUtils$KitKatPathResolver;->getColumnValue(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    goto :goto_0

    .line 288
    .end local v0    # "contentUri":Landroid/net/Uri;
    .end local v3    # "selection":Ljava/lang/String;
    .end local v4    # "selectionArgs":[Ljava/lang/String;
    :cond_3
    const-string/jumbo v7, "video"

    invoke-virtual {v7, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_4

    .line 289
    sget-object v0, Landroid/provider/MediaStore$Video$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    .restart local v0    # "contentUri":Landroid/net/Uri;
    goto :goto_1

    .line 290
    .end local v0    # "contentUri":Landroid/net/Uri;
    :cond_4
    const-string/jumbo v7, "audio"

    invoke-virtual {v7, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_5

    .line 291
    sget-object v0, Landroid/provider/MediaStore$Audio$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    .restart local v0    # "contentUri":Landroid/net/Uri;
    goto :goto_1

    .line 293
    .end local v0    # "contentUri":Landroid/net/Uri;
    :cond_5
    const-string/jumbo v7, "unknown"

    goto :goto_0

    .line 301
    .end local v1    # "docId":Ljava/lang/String;
    .end local v5    # "split":[Ljava/lang/String;
    .end local v6    # "type":Ljava/lang/String;
    :cond_6
    const-string/jumbo v7, "unknown"

    goto :goto_0

    .line 304
    :cond_7
    invoke-super {p0, p1}, Lcom/vkontakte/android/upload/UploadUtils$BasePathResolver;->resolveContentName(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v7

    goto :goto_0
.end method

.method public resolvePath(Landroid/net/Uri;)Ljava/lang/String;
    .locals 11
    .param p1, "uri"    # Landroid/net/Uri;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    const/4 v10, 0x0

    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 209
    sget-object v7, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-static {v7, p1}, Landroid/provider/DocumentsContract;->isDocumentUri(Landroid/content/Context;Landroid/net/Uri;)Z

    move-result v7

    if-eqz v7, :cond_7

    .line 210
    invoke-static {p1}, Lcom/vkontakte/android/upload/UploadUtils$KitKatPathResolver;->isExternalStorageDocument(Landroid/net/Uri;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 212
    invoke-static {p1}, Landroid/provider/DocumentsContract;->getDocumentId(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v1

    .line 213
    .local v1, "docId":Ljava/lang/String;
    const-string/jumbo v7, ":"

    invoke-virtual {v1, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    .line 214
    .local v5, "split":[Ljava/lang/String;
    aget-object v6, v5, v8

    .line 216
    .local v6, "type":Ljava/lang/String;
    const-string/jumbo v7, "primary"

    invoke-virtual {v7, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 217
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v8, "/"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    aget-object v8, v5, v9

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 253
    .end local v1    # "docId":Ljava/lang/String;
    .end local v5    # "split":[Ljava/lang/String;
    .end local v6    # "type":Ljava/lang/String;
    :goto_0
    return-object v7

    .line 220
    .restart local v1    # "docId":Ljava/lang/String;
    .restart local v5    # "split":[Ljava/lang/String;
    .restart local v6    # "type":Ljava/lang/String;
    :cond_0
    const-string/jumbo v7, "unknown"

    goto :goto_0

    .line 222
    .end local v1    # "docId":Ljava/lang/String;
    .end local v5    # "split":[Ljava/lang/String;
    .end local v6    # "type":Ljava/lang/String;
    :cond_1
    invoke-static {p1}, Lcom/vkontakte/android/upload/UploadUtils$KitKatPathResolver;->isDownloadsDocument(Landroid/net/Uri;)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 224
    invoke-static {p1}, Landroid/provider/DocumentsContract;->getDocumentId(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v2

    .line 225
    .local v2, "id":Ljava/lang/String;
    const-string/jumbo v7, "content://downloads/public_downloads"

    invoke-static {v7}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v7

    invoke-static {v2}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v8

    invoke-static {v7, v8, v9}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v0

    .line 227
    .local v0, "contentUri":Landroid/net/Uri;
    const-string/jumbo v7, "_data"

    invoke-static {v0, v7, v10, v10}, Lcom/vkontakte/android/upload/UploadUtils$KitKatPathResolver;->getColumnValue(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    goto :goto_0

    .line 228
    .end local v0    # "contentUri":Landroid/net/Uri;
    .end local v2    # "id":Ljava/lang/String;
    :cond_2
    invoke-static {p1}, Lcom/vkontakte/android/upload/UploadUtils$KitKatPathResolver;->isMediaDocument(Landroid/net/Uri;)Z

    move-result v7

    if-eqz v7, :cond_6

    .line 230
    invoke-static {p1}, Landroid/provider/DocumentsContract;->getDocumentId(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v1

    .line 231
    .restart local v1    # "docId":Ljava/lang/String;
    const-string/jumbo v7, ":"

    invoke-virtual {v1, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    .line 232
    .restart local v5    # "split":[Ljava/lang/String;
    aget-object v6, v5, v8

    .line 235
    .restart local v6    # "type":Ljava/lang/String;
    const-string/jumbo v7, "image"

    invoke-virtual {v7, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 236
    sget-object v0, Landroid/provider/MediaStore$Images$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    .line 245
    .restart local v0    # "contentUri":Landroid/net/Uri;
    :goto_1
    const-string/jumbo v3, "_id=?"

    .line 246
    .local v3, "selection":Ljava/lang/String;
    new-array v4, v9, [Ljava/lang/String;

    aget-object v7, v5, v9

    aput-object v7, v4, v8

    .line 248
    .local v4, "selectionArgs":[Ljava/lang/String;
    const-string/jumbo v7, "_data"

    const-string/jumbo v8, "_id=?"

    invoke-static {v0, v7, v8, v4}, Lcom/vkontakte/android/upload/UploadUtils$KitKatPathResolver;->getColumnValue(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    goto :goto_0

    .line 237
    .end local v0    # "contentUri":Landroid/net/Uri;
    .end local v3    # "selection":Ljava/lang/String;
    .end local v4    # "selectionArgs":[Ljava/lang/String;
    :cond_3
    const-string/jumbo v7, "video"

    invoke-virtual {v7, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_4

    .line 238
    sget-object v0, Landroid/provider/MediaStore$Video$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    .restart local v0    # "contentUri":Landroid/net/Uri;
    goto :goto_1

    .line 239
    .end local v0    # "contentUri":Landroid/net/Uri;
    :cond_4
    const-string/jumbo v7, "audio"

    invoke-virtual {v7, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_5

    .line 240
    sget-object v0, Landroid/provider/MediaStore$Audio$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    .restart local v0    # "contentUri":Landroid/net/Uri;
    goto :goto_1

    .line 242
    .end local v0    # "contentUri":Landroid/net/Uri;
    :cond_5
    const-string/jumbo v7, "unknown"

    goto :goto_0

    .line 250
    .end local v1    # "docId":Ljava/lang/String;
    .end local v5    # "split":[Ljava/lang/String;
    .end local v6    # "type":Ljava/lang/String;
    :cond_6
    const-string/jumbo v7, "unknown"

    goto :goto_0

    .line 253
    :cond_7
    invoke-super {p0, p1}, Lcom/vkontakte/android/upload/UploadUtils$BasePathResolver;->resolvePath(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v7

    goto :goto_0
.end method
