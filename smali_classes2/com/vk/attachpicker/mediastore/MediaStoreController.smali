.class public Lcom/vk/attachpicker/mediastore/MediaStoreController;
.super Ljava/lang/Object;
.source "MediaStoreController.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/attachpicker/mediastore/MediaStoreController$MediaStoreMediaEntryCallback;,
        Lcom/vk/attachpicker/mediastore/MediaStoreController$MediaStoreCallback;
    }
.end annotation


# static fields
.field public static final MEDIA_TYPE_PHOTO:I = 0xde

.field public static final MEDIA_TYPE_PHOTO_AND_VIDEO:I = 0x6f

.field public static final MEDIA_TYPE_VIDEO:I = 0x14d

.field private static final PHOTOS_PROJECTION:[Ljava/lang/String;

.field private static final TAG:Ljava/lang/String; = "MediaStoreUtils"

.field private static final VIDEO_PROJECTION:[Ljava/lang/String;

.field private static final cameraFolder:Ljava/lang/String;

.field private static final descDateComparator:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator",
            "<",
            "Lcom/vk/attachpicker/mediastore/MediaStoreEntry;",
            ">;"
        }
    .end annotation
.end field

.field private static lastLoadedPhoto:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vk/attachpicker/mediastore/AlbumEntry;",
            ">;"
        }
    .end annotation
.end field

.field private static lastLoadedPhotoVideo:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vk/attachpicker/mediastore/AlbumEntry;",
            ">;"
        }
    .end annotation
.end field

.field private static lastLoadedVideo:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vk/attachpicker/mediastore/AlbumEntry;",
            ">;"
        }
    .end annotation
.end field

.field private static final mediaStoreExecutor:Ljava/util/concurrent/ExecutorService;

.field private static final uiHandler:Landroid/os/Handler;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 32
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Lcom/vk/attachpicker/mediastore/MediaStoreController;->mediaStoreExecutor:Ljava/util/concurrent/ExecutorService;

    .line 33
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Lcom/vk/attachpicker/mediastore/MediaStoreController;->uiHandler:Landroid/os/Handler;

    .line 39
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Landroid/os/Environment;->DIRECTORY_DCIM:Ljava/lang/String;

    invoke-static {v1}, Landroid/os/Environment;->getExternalStoragePublicDirectory(Ljava/lang/String;)Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "/Camera/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/vk/attachpicker/mediastore/MediaStoreController;->cameraFolder:Ljava/lang/String;

    .line 40
    invoke-static {}, Lcom/vk/attachpicker/mediastore/MediaStoreController$$Lambda$3;->lambdaFactory$()Ljava/util/Comparator;

    move-result-object v0

    sput-object v0, Lcom/vk/attachpicker/mediastore/MediaStoreController;->descDateComparator:Ljava/util/Comparator;

    .line 50
    const/4 v0, 0x6

    new-array v0, v0, [Ljava/lang/String;

    const-string/jumbo v1, "_id"

    aput-object v1, v0, v3

    const-string/jumbo v1, "bucket_id"

    aput-object v1, v0, v4

    const-string/jumbo v1, "bucket_display_name"

    aput-object v1, v0, v5

    const-string/jumbo v1, "_data"

    aput-object v1, v0, v6

    const-string/jumbo v1, "datetaken"

    aput-object v1, v0, v7

    const/4 v1, 0x5

    const-string/jumbo v2, "orientation"

    aput-object v2, v0, v1

    sput-object v0, Lcom/vk/attachpicker/mediastore/MediaStoreController;->PHOTOS_PROJECTION:[Ljava/lang/String;

    .line 59
    const/4 v0, 0x6

    new-array v0, v0, [Ljava/lang/String;

    const-string/jumbo v1, "_id"

    aput-object v1, v0, v3

    const-string/jumbo v1, "datetaken"

    aput-object v1, v0, v4

    const-string/jumbo v1, "_data"

    aput-object v1, v0, v5

    const-string/jumbo v1, "duration"

    aput-object v1, v0, v6

    const-string/jumbo v1, "bucket_display_name"

    aput-object v1, v0, v7

    const/4 v1, 0x5

    const-string/jumbo v2, "bucket_id"

    aput-object v2, v0, v1

    sput-object v0, Lcom/vk/attachpicker/mediastore/MediaStoreController;->VIDEO_PROJECTION:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static filterLastNMilliseconds(Ljava/util/ArrayList;J)Ljava/util/ArrayList;
    .locals 11
    .param p1, "lastNMilliseconds"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vk/attachpicker/mediastore/AlbumEntry;",
            ">;J)",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vk/attachpicker/mediastore/AlbumEntry;",
            ">;"
        }
    .end annotation

    .prologue
    .line 259
    .local p0, "albumEntries":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/attachpicker/mediastore/AlbumEntry;>;"
    const-wide/16 v4, 0x0

    cmp-long v4, p1, v4

    if-gtz v4, :cond_0

    .line 289
    .end local p0    # "albumEntries":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/attachpicker/mediastore/AlbumEntry;>;"
    :goto_0
    return-object p0

    .line 263
    .restart local p0    # "albumEntries":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/attachpicker/mediastore/AlbumEntry;>;"
    :cond_0
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 265
    .local v3, "newAlbums":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/attachpicker/mediastore/AlbumEntry;>;"
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_1
    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_4

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/attachpicker/mediastore/AlbumEntry;

    .line 266
    .local v0, "a":Lcom/vk/attachpicker/mediastore/AlbumEntry;
    invoke-virtual {v0}, Lcom/vk/attachpicker/mediastore/AlbumEntry;->getBucketImages()Ljava/util/ArrayList;

    move-result-object v5

    if-eqz v5, :cond_1

    invoke-virtual {v0}, Lcom/vk/attachpicker/mediastore/AlbumEntry;->getBucketImages()Ljava/util/ArrayList;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-lez v5, :cond_1

    .line 268
    const/4 v2, 0x0

    .line 270
    .local v2, "newAlbum":Lcom/vk/attachpicker/mediastore/AlbumEntry;
    invoke-virtual {v0}, Lcom/vk/attachpicker/mediastore/AlbumEntry;->getBucketImages()Ljava/util/ArrayList;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_2
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_3

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vk/attachpicker/mediastore/MediaStoreEntry;

    .line 271
    .local v1, "e":Lcom/vk/attachpicker/mediastore/MediaStoreEntry;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    iget-wide v8, v1, Lcom/vk/attachpicker/mediastore/MediaStoreEntry;->dateTaken:J

    sub-long/2addr v6, v8

    cmp-long v6, v6, p1

    if-gez v6, :cond_3

    .line 272
    if-nez v2, :cond_2

    .line 273
    new-instance v2, Lcom/vk/attachpicker/mediastore/AlbumEntry;

    .end local v2    # "newAlbum":Lcom/vk/attachpicker/mediastore/AlbumEntry;
    invoke-virtual {v0}, Lcom/vk/attachpicker/mediastore/AlbumEntry;->getId()I

    move-result v6

    invoke-virtual {v0}, Lcom/vk/attachpicker/mediastore/AlbumEntry;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v2, v6, v7}, Lcom/vk/attachpicker/mediastore/AlbumEntry;-><init>(ILjava/lang/String;)V

    .line 274
    .restart local v2    # "newAlbum":Lcom/vk/attachpicker/mediastore/AlbumEntry;
    invoke-virtual {v0}, Lcom/vk/attachpicker/mediastore/AlbumEntry;->isCameraBucket()Z

    move-result v6

    invoke-virtual {v2, v6}, Lcom/vk/attachpicker/mediastore/AlbumEntry;->setCameraBucket(Z)V

    .line 275
    invoke-virtual {v0}, Lcom/vk/attachpicker/mediastore/AlbumEntry;->getMediaStoreEntry()Lcom/vk/attachpicker/mediastore/MediaStoreEntry;

    move-result-object v6

    invoke-virtual {v2, v6}, Lcom/vk/attachpicker/mediastore/AlbumEntry;->setMediaStoreEntry(Lcom/vk/attachpicker/mediastore/MediaStoreEntry;)V

    .line 277
    :cond_2
    invoke-virtual {v2, v1}, Lcom/vk/attachpicker/mediastore/AlbumEntry;->addImage(Lcom/vk/attachpicker/mediastore/MediaStoreEntry;)V

    goto :goto_2

    .line 283
    .end local v1    # "e":Lcom/vk/attachpicker/mediastore/MediaStoreEntry;
    :cond_3
    if-eqz v2, :cond_1

    .line 284
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .end local v0    # "a":Lcom/vk/attachpicker/mediastore/AlbumEntry;
    .end local v2    # "newAlbum":Lcom/vk/attachpicker/mediastore/AlbumEntry;
    :cond_4
    move-object p0, v3

    .line 289
    goto :goto_0
.end method

.method private static findCameraBucket(Ljava/util/ArrayList;)Lcom/vk/attachpicker/mediastore/AlbumEntry;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vk/attachpicker/mediastore/AlbumEntry;",
            ">;)",
            "Lcom/vk/attachpicker/mediastore/AlbumEntry;"
        }
    .end annotation

    .prologue
    .local p0, "buckets":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/attachpicker/mediastore/AlbumEntry;>;"
    const/4 v1, 0x0

    .line 71
    if-nez p0, :cond_0

    move-object v0, v1

    .line 79
    :goto_0
    return-object v0

    .line 74
    :cond_0
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/attachpicker/mediastore/AlbumEntry;

    .line 75
    .local v0, "e":Lcom/vk/attachpicker/mediastore/AlbumEntry;
    invoke-virtual {v0}, Lcom/vk/attachpicker/mediastore/AlbumEntry;->isCameraBucket()Z

    move-result v3

    if-eqz v3, :cond_1

    goto :goto_0

    .end local v0    # "e":Lcom/vk/attachpicker/mediastore/AlbumEntry;
    :cond_2
    move-object v0, v1

    .line 79
    goto :goto_0
.end method

.method public static findPhoto(Landroid/net/Uri;Lcom/vk/attachpicker/mediastore/MediaStoreController$MediaStoreMediaEntryCallback;)V
    .locals 2
    .param p0, "uri"    # Landroid/net/Uri;
    .param p1, "entryCallback"    # Lcom/vk/attachpicker/mediastore/MediaStoreController$MediaStoreMediaEntryCallback;

    .prologue
    .line 155
    const/16 v0, 0xde

    new-instance v1, Lcom/vk/attachpicker/mediastore/MediaStoreController$1;

    invoke-direct {v1, p1, p0}, Lcom/vk/attachpicker/mediastore/MediaStoreController$1;-><init>(Lcom/vk/attachpicker/mediastore/MediaStoreController$MediaStoreMediaEntryCallback;Landroid/net/Uri;)V

    invoke-static {v0, v1}, Lcom/vk/attachpicker/mediastore/MediaStoreController;->load(ILcom/vk/attachpicker/mediastore/MediaStoreController$MediaStoreCallback;)V

    .line 172
    return-void
.end method

.method static synthetic lambda$load$2(IJLcom/vk/attachpicker/mediastore/MediaStoreController$MediaStoreCallback;)V
    .locals 5
    .param p0, "mediaType"    # I
    .param p1, "lastNMilliseconds"    # J
    .param p3, "callback"    # Lcom/vk/attachpicker/mediastore/MediaStoreController$MediaStoreCallback;

    .prologue
    .line 298
    invoke-static {p0, p1, p2}, Lcom/vk/attachpicker/mediastore/MediaStoreController;->loadMediaStore(IJ)Ljava/util/ArrayList;

    move-result-object v1

    .line 299
    .local v1, "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/attachpicker/mediastore/AlbumEntry;>;"
    invoke-static {v1, p1, p2}, Lcom/vk/attachpicker/mediastore/MediaStoreController;->filterLastNMilliseconds(Ljava/util/ArrayList;J)Ljava/util/ArrayList;

    move-result-object v0

    .line 301
    .local v0, "filteredResult":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/attachpicker/mediastore/AlbumEntry;>;"
    sget-object v2, Lcom/vk/attachpicker/mediastore/MediaStoreController;->uiHandler:Landroid/os/Handler;

    invoke-static {p0, v1, p3, v0}, Lcom/vk/attachpicker/mediastore/MediaStoreController$$Lambda$2;->lambdaFactory$(ILjava/util/ArrayList;Lcom/vk/attachpicker/mediastore/MediaStoreController$MediaStoreCallback;Ljava/util/ArrayList;)Ljava/lang/Runnable;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 311
    return-void
.end method

.method static synthetic lambda$null$1(ILjava/util/ArrayList;Lcom/vk/attachpicker/mediastore/MediaStoreController$MediaStoreCallback;Ljava/util/ArrayList;)V
    .locals 1
    .param p0, "mediaType"    # I
    .param p1, "result"    # Ljava/util/ArrayList;
    .param p2, "callback"    # Lcom/vk/attachpicker/mediastore/MediaStoreController$MediaStoreCallback;
    .param p3, "filteredResult"    # Ljava/util/ArrayList;

    .prologue
    .line 302
    const/16 v0, 0x6f

    if-ne p0, v0, :cond_1

    .line 303
    sput-object p1, Lcom/vk/attachpicker/mediastore/MediaStoreController;->lastLoadedPhotoVideo:Ljava/util/ArrayList;

    .line 309
    :cond_0
    :goto_0
    invoke-interface {p2, p3}, Lcom/vk/attachpicker/mediastore/MediaStoreController$MediaStoreCallback;->onLoaded(Ljava/util/ArrayList;)V

    .line 310
    return-void

    .line 304
    :cond_1
    const/16 v0, 0xde

    if-ne p0, v0, :cond_2

    .line 305
    sput-object p1, Lcom/vk/attachpicker/mediastore/MediaStoreController;->lastLoadedPhoto:Ljava/util/ArrayList;

    goto :goto_0

    .line 306
    :cond_2
    const/16 v0, 0x14d

    if-ne p0, v0, :cond_0

    .line 307
    sput-object p1, Lcom/vk/attachpicker/mediastore/MediaStoreController;->lastLoadedVideo:Ljava/util/ArrayList;

    goto :goto_0
.end method

.method static synthetic lambda$static$0(Lcom/vk/attachpicker/mediastore/MediaStoreEntry;Lcom/vk/attachpicker/mediastore/MediaStoreEntry;)I
    .locals 4
    .param p0, "lhs"    # Lcom/vk/attachpicker/mediastore/MediaStoreEntry;
    .param p1, "rhs"    # Lcom/vk/attachpicker/mediastore/MediaStoreEntry;

    .prologue
    .line 41
    iget-wide v0, p0, Lcom/vk/attachpicker/mediastore/MediaStoreEntry;->dateTaken:J

    iget-wide v2, p1, Lcom/vk/attachpicker/mediastore/MediaStoreEntry;->dateTaken:J

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    .line 42
    const/4 v0, -0x1

    .line 46
    :goto_0
    return v0

    .line 43
    :cond_0
    iget-wide v0, p0, Lcom/vk/attachpicker/mediastore/MediaStoreEntry;->dateTaken:J

    iget-wide v2, p1, Lcom/vk/attachpicker/mediastore/MediaStoreEntry;->dateTaken:J

    cmp-long v0, v0, v2

    if-gez v0, :cond_1

    .line 44
    const/4 v0, 0x1

    goto :goto_0

    .line 46
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static lastLoadedPhoto()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vk/attachpicker/mediastore/AlbumEntry;",
            ">;"
        }
    .end annotation

    .prologue
    .line 319
    sget-object v0, Lcom/vk/attachpicker/mediastore/MediaStoreController;->lastLoadedPhoto:Ljava/util/ArrayList;

    return-object v0
.end method

.method public static lastLoadedPhotoVideo()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vk/attachpicker/mediastore/AlbumEntry;",
            ">;"
        }
    .end annotation

    .prologue
    .line 315
    sget-object v0, Lcom/vk/attachpicker/mediastore/MediaStoreController;->lastLoadedPhotoVideo:Ljava/util/ArrayList;

    return-object v0
.end method

.method public static lastLoadedVideo()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vk/attachpicker/mediastore/AlbumEntry;",
            ">;"
        }
    .end annotation

    .prologue
    .line 323
    sget-object v0, Lcom/vk/attachpicker/mediastore/MediaStoreController;->lastLoadedVideo:Ljava/util/ArrayList;

    return-object v0
.end method

.method public static load(IJLcom/vk/attachpicker/mediastore/MediaStoreController$MediaStoreCallback;)V
    .locals 3
    .param p0, "mediaType"    # I
    .param p1, "lastNMilliseconds"    # J
    .param p3, "callback"    # Lcom/vk/attachpicker/mediastore/MediaStoreController$MediaStoreCallback;

    .prologue
    .line 297
    sget-object v0, Lcom/vk/attachpicker/mediastore/MediaStoreController;->mediaStoreExecutor:Ljava/util/concurrent/ExecutorService;

    invoke-static {p0, p1, p2, p3}, Lcom/vk/attachpicker/mediastore/MediaStoreController$$Lambda$1;->lambdaFactory$(IJLcom/vk/attachpicker/mediastore/MediaStoreController$MediaStoreCallback;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    .line 312
    return-void
.end method

.method public static load(ILcom/vk/attachpicker/mediastore/MediaStoreController$MediaStoreCallback;)V
    .locals 2
    .param p0, "mediaType"    # I
    .param p1, "callback"    # Lcom/vk/attachpicker/mediastore/MediaStoreController$MediaStoreCallback;

    .prologue
    .line 293
    const-wide/16 v0, 0x0

    invoke-static {p0, v0, v1, p1}, Lcom/vk/attachpicker/mediastore/MediaStoreController;->load(IJLcom/vk/attachpicker/mediastore/MediaStoreController$MediaStoreCallback;)V

    .line 294
    return-void
.end method

.method private static loadMediaStore(IJ)Ljava/util/ArrayList;
    .locals 14
    .param p0, "mediaType"    # I
    .param p1, "onlyLastNMilliseconds"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IJ)",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vk/attachpicker/mediastore/AlbumEntry;",
            ">;"
        }
    .end annotation

    .prologue
    .line 105
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 106
    .local v6, "albumsList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/attachpicker/mediastore/AlbumEntry;>;"
    new-instance v7, Ljava/util/HashMap;

    invoke-direct {v7}, Ljava/util/HashMap;-><init>()V

    .line 109
    .local v7, "albumsMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/Integer;Lcom/vk/attachpicker/mediastore/AlbumEntry;>;"
    const/16 v0, 0xde

    if-ne p0, v0, :cond_5

    .line 110
    const v12, 0x7f0804b9

    .line 116
    .local v12, "titleResId":I
    :goto_0
    new-instance v8, Lcom/vk/attachpicker/mediastore/AlbumEntry;

    const/4 v0, -0x1

    invoke-static {}, Lcom/vk/attachpicker/Picker;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1, v12}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v8, v0, v1}, Lcom/vk/attachpicker/mediastore/AlbumEntry;-><init>(ILjava/lang/String;)V

    .line 117
    .local v8, "allPhotosAlbum":Lcom/vk/attachpicker/mediastore/AlbumEntry;
    invoke-virtual {v6, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 118
    invoke-virtual {v8}, Lcom/vk/attachpicker/mediastore/AlbumEntry;->getId()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v7, v0, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 120
    const/16 v0, 0x6f

    if-eq p0, v0, :cond_0

    const/16 v0, 0xde

    if-ne p0, v0, :cond_1

    .line 121
    :cond_0
    invoke-static {}, Lcom/vk/attachpicker/Picker;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Landroid/provider/MediaStore$Images$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    sget-object v2, Lcom/vk/attachpicker/mediastore/MediaStoreController;->PHOTOS_PROJECTION:[Ljava/lang/String;

    const-string/jumbo v3, ""

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-static/range {v0 .. v5}, Landroid/provider/MediaStore$Images$Media;->query(Landroid/content/ContentResolver;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v11

    .line 122
    .local v11, "photosCursor":Landroid/database/Cursor;
    invoke-static {v11, v6, v7, v8}, Lcom/vk/attachpicker/mediastore/MediaStoreController;->loadPhotos(Landroid/database/Cursor;Ljava/util/ArrayList;Ljava/util/HashMap;Lcom/vk/attachpicker/mediastore/AlbumEntry;)Ljava/util/ArrayList;

    .line 125
    .end local v11    # "photosCursor":Landroid/database/Cursor;
    :cond_1
    const/16 v0, 0x6f

    if-eq p0, v0, :cond_2

    const/16 v0, 0x14d

    if-ne p0, v0, :cond_3

    .line 126
    :cond_2
    invoke-static {}, Lcom/vk/attachpicker/Picker;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Landroid/provider/MediaStore$Video$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    sget-object v2, Lcom/vk/attachpicker/mediastore/MediaStoreController;->VIDEO_PROJECTION:[Ljava/lang/String;

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v13

    .line 127
    .local v13, "videoCursor":Landroid/database/Cursor;
    invoke-static {v13, v6, v7, v8}, Lcom/vk/attachpicker/mediastore/MediaStoreController;->loadVideos(Landroid/database/Cursor;Ljava/util/ArrayList;Ljava/util/HashMap;Lcom/vk/attachpicker/mediastore/AlbumEntry;)Ljava/util/ArrayList;

    .line 130
    .end local v13    # "videoCursor":Landroid/database/Cursor;
    :cond_3
    invoke-virtual {v6}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_4
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_7

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/vk/attachpicker/mediastore/AlbumEntry;

    .line 131
    .local v10, "e":Lcom/vk/attachpicker/mediastore/AlbumEntry;
    invoke-virtual {v10}, Lcom/vk/attachpicker/mediastore/AlbumEntry;->getBucketImages()Ljava/util/ArrayList;

    move-result-object v0

    sget-object v2, Lcom/vk/attachpicker/mediastore/MediaStoreController;->descDateComparator:Ljava/util/Comparator;

    invoke-static {v0, v2}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 132
    invoke-virtual {v10}, Lcom/vk/attachpicker/mediastore/AlbumEntry;->getBucketImages()Ljava/util/ArrayList;

    move-result-object v0

    if-eqz v0, :cond_4

    invoke-virtual {v10}, Lcom/vk/attachpicker/mediastore/AlbumEntry;->getBucketImages()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_4

    .line 133
    invoke-virtual {v10}, Lcom/vk/attachpicker/mediastore/AlbumEntry;->getBucketImages()Ljava/util/ArrayList;

    move-result-object v0

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/attachpicker/mediastore/MediaStoreEntry;

    invoke-virtual {v10, v0}, Lcom/vk/attachpicker/mediastore/AlbumEntry;->setMediaStoreEntry(Lcom/vk/attachpicker/mediastore/MediaStoreEntry;)V

    goto :goto_1

    .line 111
    .end local v8    # "allPhotosAlbum":Lcom/vk/attachpicker/mediastore/AlbumEntry;
    .end local v10    # "e":Lcom/vk/attachpicker/mediastore/AlbumEntry;
    .end local v12    # "titleResId":I
    :cond_5
    const/16 v0, 0x14d

    if-ne p0, v0, :cond_6

    .line 112
    const v12, 0x7f0804bb

    .restart local v12    # "titleResId":I
    goto/16 :goto_0

    .line 114
    .end local v12    # "titleResId":I
    :cond_6
    const v12, 0x7f0804ba

    .restart local v12    # "titleResId":I
    goto/16 :goto_0

    .line 137
    .restart local v8    # "allPhotosAlbum":Lcom/vk/attachpicker/mediastore/AlbumEntry;
    :cond_7
    invoke-virtual {v8}, Lcom/vk/attachpicker/mediastore/AlbumEntry;->getImagesCount()I

    move-result v0

    if-nez v0, :cond_8

    .line 138
    invoke-virtual {v6, v8}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 139
    invoke-virtual {v7, v8}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 143
    :cond_8
    invoke-static {v6}, Lcom/vk/attachpicker/mediastore/MediaStoreController;->findCameraBucket(Ljava/util/ArrayList;)Lcom/vk/attachpicker/mediastore/AlbumEntry;

    move-result-object v9

    .line 144
    .local v9, "cameraAlbum":Lcom/vk/attachpicker/mediastore/AlbumEntry;
    if-eqz v9, :cond_9

    .line 145
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x1

    if-le v0, v1, :cond_9

    .line 146
    invoke-virtual {v6, v9}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 147
    const/4 v0, 0x1

    invoke-virtual {v6, v0, v9}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 151
    :cond_9
    return-object v6
.end method

.method public static loadPhotos(Landroid/database/Cursor;Ljava/util/ArrayList;Ljava/util/HashMap;Lcom/vk/attachpicker/mediastore/AlbumEntry;)Ljava/util/ArrayList;
    .locals 23
    .param p0, "cursor"    # Landroid/database/Cursor;
    .param p3, "allPhotosAlbum"    # Lcom/vk/attachpicker/mediastore/AlbumEntry;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/database/Cursor;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vk/attachpicker/mediastore/AlbumEntry;",
            ">;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Integer;",
            "Lcom/vk/attachpicker/mediastore/AlbumEntry;",
            ">;",
            "Lcom/vk/attachpicker/mediastore/AlbumEntry;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vk/attachpicker/mediastore/AlbumEntry;",
            ">;"
        }
    .end annotation

    .prologue
    .line 175
    .local p1, "albumsList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/attachpicker/mediastore/AlbumEntry;>;"
    .local p2, "albumsMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/Integer;Lcom/vk/attachpicker/mediastore/AlbumEntry;>;"
    if-eqz p0, :cond_2

    .line 177
    const-string/jumbo v4, "_id"

    move-object/from16 v0, p0

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v21

    .line 178
    .local v21, "imageIdColumn":I
    const-string/jumbo v4, "bucket_id"

    move-object/from16 v0, p0

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v15

    .line 179
    .local v15, "bucketIdColumn":I
    const-string/jumbo v4, "bucket_display_name"

    move-object/from16 v0, p0

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v16

    .line 180
    .local v16, "bucketNameColumn":I
    const-string/jumbo v4, "_data"

    move-object/from16 v0, p0

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v17

    .line 181
    .local v17, "dataColumn":I
    const-string/jumbo v4, "datetaken"

    move-object/from16 v0, p0

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v18

    .line 182
    .local v18, "dateColumn":I
    const-string/jumbo v4, "orientation"

    move-object/from16 v0, p0

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v22

    .line 184
    .local v22, "orientationColumn":I
    new-instance v20, Ljava/util/ArrayList;

    invoke-direct/range {v20 .. v20}, Ljava/util/ArrayList;-><init>()V

    .line 186
    .local v20, "entries":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/attachpicker/mediastore/MediaStoreEntry;>;"
    :cond_0
    :goto_0
    invoke-interface/range {p0 .. p0}, Landroid/database/Cursor;->moveToNext()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 188
    :try_start_0
    move-object/from16 v0, p0

    move/from16 v1, v21

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    .line 189
    .local v3, "imageId":I
    move-object/from16 v0, p0

    invoke-interface {v0, v15}, Landroid/database/Cursor;->getInt(I)I

    move-result v12

    .line 190
    .local v12, "bucketId":I
    move-object/from16 v0, p0

    move/from16 v1, v16

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v13

    .line 191
    .local v13, "bucketName":Ljava/lang/String;
    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v14

    .line 192
    .local v14, "path":Ljava/lang/String;
    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v6

    .line 193
    .local v6, "dateTaken":J
    move-object/from16 v0, p0

    move/from16 v1, v22

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v5

    .line 195
    .local v5, "orientation":I
    if-eqz v14, :cond_0

    invoke-virtual {v14}, Ljava/lang/String;->length()I

    move-result v4

    if-eqz v4, :cond_0

    .line 200
    new-instance v2, Lcom/vk/attachpicker/mediastore/MediaStoreEntry;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "file://"

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    invoke-direct/range {v2 .. v7}, Lcom/vk/attachpicker/mediastore/MediaStoreEntry;-><init>(ILandroid/net/Uri;IJ)V

    .local v2, "mediaStoreEntry":Lcom/vk/attachpicker/mediastore/MediaStoreEntry;
    move-object/from16 v8, p1

    move-object/from16 v9, p2

    move-object/from16 v10, p3

    move-object v11, v2

    .line 201
    invoke-static/range {v8 .. v14}, Lcom/vk/attachpicker/mediastore/MediaStoreController;->processMediaStoreItem(Ljava/util/ArrayList;Ljava/util/HashMap;Lcom/vk/attachpicker/mediastore/AlbumEntry;Lcom/vk/attachpicker/mediastore/MediaStoreEntry;ILjava/lang/String;Ljava/lang/String;)V

    .line 202
    move-object/from16 v0, v20

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 203
    .end local v2    # "mediaStoreEntry":Lcom/vk/attachpicker/mediastore/MediaStoreEntry;
    .end local v3    # "imageId":I
    .end local v5    # "orientation":I
    .end local v6    # "dateTaken":J
    .end local v12    # "bucketId":I
    .end local v13    # "bucketName":Ljava/lang/String;
    .end local v14    # "path":Ljava/lang/String;
    :catch_0
    move-exception v19

    .line 204
    .local v19, "e":Ljava/lang/Exception;
    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v8, 0x0

    const-string/jumbo v9, "MediaStoreUtils"

    aput-object v9, v4, v8

    move-object/from16 v0, v19

    invoke-static {v0, v4}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto :goto_0

    .line 208
    .end local v19    # "e":Ljava/lang/Exception;
    :cond_1
    invoke-interface/range {p0 .. p0}, Landroid/database/Cursor;->close()V

    .line 213
    .end local v15    # "bucketIdColumn":I
    .end local v16    # "bucketNameColumn":I
    .end local v17    # "dataColumn":I
    .end local v18    # "dateColumn":I
    .end local v20    # "entries":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/attachpicker/mediastore/MediaStoreEntry;>;"
    .end local v21    # "imageIdColumn":I
    .end local v22    # "orientationColumn":I
    .end local p1    # "albumsList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/attachpicker/mediastore/AlbumEntry;>;"
    :goto_1
    return-object p1

    .restart local p1    # "albumsList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/attachpicker/mediastore/AlbumEntry;>;"
    :cond_2
    new-instance p1, Ljava/util/ArrayList;

    .end local p1    # "albumsList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/attachpicker/mediastore/AlbumEntry;>;"
    invoke-direct/range {p1 .. p1}, Ljava/util/ArrayList;-><init>()V

    goto :goto_1
.end method

.method public static loadVideos(Landroid/database/Cursor;Ljava/util/ArrayList;Ljava/util/HashMap;Lcom/vk/attachpicker/mediastore/AlbumEntry;)Ljava/util/ArrayList;
    .locals 24
    .param p0, "cursor"    # Landroid/database/Cursor;
    .param p3, "allPhotosAlbum"    # Lcom/vk/attachpicker/mediastore/AlbumEntry;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/database/Cursor;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vk/attachpicker/mediastore/AlbumEntry;",
            ">;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Integer;",
            "Lcom/vk/attachpicker/mediastore/AlbumEntry;",
            ">;",
            "Lcom/vk/attachpicker/mediastore/AlbumEntry;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vk/attachpicker/mediastore/AlbumEntry;",
            ">;"
        }
    .end annotation

    .prologue
    .line 217
    .local p1, "albumsList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/attachpicker/mediastore/AlbumEntry;>;"
    .local p2, "albumsMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/Integer;Lcom/vk/attachpicker/mediastore/AlbumEntry;>;"
    if-eqz p0, :cond_3

    .line 219
    const-string/jumbo v5, "_id"

    move-object/from16 v0, p0

    invoke-interface {v0, v5}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v23

    .line 220
    .local v23, "imageIdColumn":I
    const-string/jumbo v5, "bucket_id"

    move-object/from16 v0, p0

    invoke-interface {v0, v5}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    .line 221
    .local v2, "bucketIdColumn":I
    const-string/jumbo v5, "bucket_display_name"

    move-object/from16 v0, p0

    invoke-interface {v0, v5}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v17

    .line 222
    .local v17, "bucketNameColumn":I
    const-string/jumbo v5, "_data"

    move-object/from16 v0, p0

    invoke-interface {v0, v5}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v18

    .line 223
    .local v18, "dataColumn":I
    const-string/jumbo v5, "datetaken"

    move-object/from16 v0, p0

    invoke-interface {v0, v5}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v19

    .line 224
    .local v19, "dateColumn":I
    const-string/jumbo v5, "duration"

    move-object/from16 v0, p0

    invoke-interface {v0, v5}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v20

    .line 226
    .local v20, "durationColumn":I
    new-instance v22, Ljava/util/ArrayList;

    invoke-direct/range {v22 .. v22}, Ljava/util/ArrayList;-><init>()V

    .line 228
    .local v22, "entries":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/attachpicker/mediastore/MediaStoreEntry;>;"
    :cond_0
    :goto_0
    invoke-interface/range {p0 .. p0}, Landroid/database/Cursor;->moveToNext()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 230
    :try_start_0
    move-object/from16 v0, p0

    move/from16 v1, v23

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v4

    .line 231
    .local v4, "imageId":I
    move-object/from16 v0, p0

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v14

    .line 232
    .local v14, "bucketId":I
    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v15

    .line 233
    .local v15, "bucketName":Ljava/lang/String;
    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v16

    .line 234
    .local v16, "path":Ljava/lang/String;
    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v8

    .line 235
    .local v8, "dateTaken":J
    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v6

    .line 237
    .local v6, "duration":J
    if-eqz v16, :cond_0

    invoke-virtual/range {v16 .. v16}, Ljava/lang/String;->length()I

    move-result v5

    if-eqz v5, :cond_0

    const-string/jumbo v5, "mp4"

    move-object/from16 v0, v16

    invoke-virtual {v0, v5}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_1

    const-string/jumbo v5, "3gp"

    move-object/from16 v0, v16

    invoke-virtual {v0, v5}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 242
    :cond_1
    new-instance v3, Lcom/vk/attachpicker/mediastore/MediaStoreEntry;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v10, "file://"

    invoke-virtual {v5, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, v16

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v5

    invoke-direct/range {v3 .. v9}, Lcom/vk/attachpicker/mediastore/MediaStoreEntry;-><init>(ILandroid/net/Uri;JJ)V

    .local v3, "mediaStoreEntry":Lcom/vk/attachpicker/mediastore/MediaStoreEntry;
    move-object/from16 v10, p1

    move-object/from16 v11, p2

    move-object/from16 v12, p3

    move-object v13, v3

    .line 243
    invoke-static/range {v10 .. v16}, Lcom/vk/attachpicker/mediastore/MediaStoreController;->processMediaStoreItem(Ljava/util/ArrayList;Ljava/util/HashMap;Lcom/vk/attachpicker/mediastore/AlbumEntry;Lcom/vk/attachpicker/mediastore/MediaStoreEntry;ILjava/lang/String;Ljava/lang/String;)V

    .line 244
    move-object/from16 v0, v22

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 245
    .end local v3    # "mediaStoreEntry":Lcom/vk/attachpicker/mediastore/MediaStoreEntry;
    .end local v4    # "imageId":I
    .end local v6    # "duration":J
    .end local v8    # "dateTaken":J
    .end local v14    # "bucketId":I
    .end local v15    # "bucketName":Ljava/lang/String;
    .end local v16    # "path":Ljava/lang/String;
    :catch_0
    move-exception v21

    .line 246
    .local v21, "e":Ljava/lang/Exception;
    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v10, 0x0

    const-string/jumbo v11, "MediaStoreUtils"

    aput-object v11, v5, v10

    move-object/from16 v0, v21

    invoke-static {v0, v5}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto/16 :goto_0

    .line 250
    .end local v21    # "e":Ljava/lang/Exception;
    :cond_2
    invoke-interface/range {p0 .. p0}, Landroid/database/Cursor;->close()V

    .line 255
    .end local v2    # "bucketIdColumn":I
    .end local v17    # "bucketNameColumn":I
    .end local v18    # "dataColumn":I
    .end local v19    # "dateColumn":I
    .end local v20    # "durationColumn":I
    .end local v22    # "entries":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/attachpicker/mediastore/MediaStoreEntry;>;"
    .end local v23    # "imageIdColumn":I
    .end local p1    # "albumsList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/attachpicker/mediastore/AlbumEntry;>;"
    :goto_1
    return-object p1

    .restart local p1    # "albumsList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/attachpicker/mediastore/AlbumEntry;>;"
    :cond_3
    new-instance p1, Ljava/util/ArrayList;

    .end local p1    # "albumsList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/attachpicker/mediastore/AlbumEntry;>;"
    invoke-direct/range {p1 .. p1}, Ljava/util/ArrayList;-><init>()V

    goto :goto_1
.end method

.method private static processMediaStoreItem(Ljava/util/ArrayList;Ljava/util/HashMap;Lcom/vk/attachpicker/mediastore/AlbumEntry;Lcom/vk/attachpicker/mediastore/MediaStoreEntry;ILjava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p2, "allPhotosAlbum"    # Lcom/vk/attachpicker/mediastore/AlbumEntry;
    .param p3, "mediaStoreEntry"    # Lcom/vk/attachpicker/mediastore/MediaStoreEntry;
    .param p4, "bucketId"    # I
    .param p5, "bucketName"    # Ljava/lang/String;
    .param p6, "path"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vk/attachpicker/mediastore/AlbumEntry;",
            ">;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Integer;",
            "Lcom/vk/attachpicker/mediastore/AlbumEntry;",
            ">;",
            "Lcom/vk/attachpicker/mediastore/AlbumEntry;",
            "Lcom/vk/attachpicker/mediastore/MediaStoreEntry;",
            "I",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 86
    .local p0, "albumsList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/attachpicker/mediastore/AlbumEntry;>;"
    .local p1, "albumsMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/Integer;Lcom/vk/attachpicker/mediastore/AlbumEntry;>;"
    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 87
    new-instance v0, Lcom/vk/attachpicker/mediastore/AlbumEntry;

    invoke-direct {v0, p4, p5}, Lcom/vk/attachpicker/mediastore/AlbumEntry;-><init>(ILjava/lang/String;)V

    .line 88
    .local v0, "albumEntry":Lcom/vk/attachpicker/mediastore/AlbumEntry;
    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 89
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 92
    sget-object v1, Lcom/vk/attachpicker/mediastore/MediaStoreController;->cameraFolder:Ljava/lang/String;

    invoke-virtual {p6, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 93
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/mediastore/AlbumEntry;->setCameraBucket(Z)V

    .line 97
    .end local v0    # "albumEntry":Lcom/vk/attachpicker/mediastore/AlbumEntry;
    :cond_0
    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/attachpicker/mediastore/AlbumEntry;

    .line 98
    .restart local v0    # "albumEntry":Lcom/vk/attachpicker/mediastore/AlbumEntry;
    invoke-virtual {v0, p3}, Lcom/vk/attachpicker/mediastore/AlbumEntry;->addImage(Lcom/vk/attachpicker/mediastore/MediaStoreEntry;)V

    .line 101
    invoke-virtual {p2, p3}, Lcom/vk/attachpicker/mediastore/AlbumEntry;->addImage(Lcom/vk/attachpicker/mediastore/MediaStoreEntry;)V

    .line 102
    return-void
.end method
