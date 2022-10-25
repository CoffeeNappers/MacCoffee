.class Lcom/facebook/imagepipeline/producers/MediaVariationsIndexDatabase$2;
.super Ljava/lang/Object;
.source "MediaVariationsIndexDatabase.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/facebook/imagepipeline/producers/MediaVariationsIndexDatabase;->saveCachedVariant(Ljava/lang/String;Lcom/facebook/cache/common/CacheKey;Lcom/facebook/imagepipeline/image/EncodedImage;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/facebook/imagepipeline/producers/MediaVariationsIndexDatabase;

.field final synthetic val$cacheKey:Lcom/facebook/cache/common/CacheKey;

.field final synthetic val$encodedImage:Lcom/facebook/imagepipeline/image/EncodedImage;

.field final synthetic val$mediaId:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/facebook/imagepipeline/producers/MediaVariationsIndexDatabase;Ljava/lang/String;Lcom/facebook/imagepipeline/image/EncodedImage;Lcom/facebook/cache/common/CacheKey;)V
    .locals 0
    .param p1, "this$0"    # Lcom/facebook/imagepipeline/producers/MediaVariationsIndexDatabase;

    .prologue
    .line 130
    iput-object p1, p0, Lcom/facebook/imagepipeline/producers/MediaVariationsIndexDatabase$2;->this$0:Lcom/facebook/imagepipeline/producers/MediaVariationsIndexDatabase;

    iput-object p2, p0, Lcom/facebook/imagepipeline/producers/MediaVariationsIndexDatabase$2;->val$mediaId:Ljava/lang/String;

    iput-object p3, p0, Lcom/facebook/imagepipeline/producers/MediaVariationsIndexDatabase$2;->val$encodedImage:Lcom/facebook/imagepipeline/image/EncodedImage;

    iput-object p4, p0, Lcom/facebook/imagepipeline/producers/MediaVariationsIndexDatabase$2;->val$cacheKey:Lcom/facebook/cache/common/CacheKey;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    .prologue
    .line 133
    iget-object v3, p0, Lcom/facebook/imagepipeline/producers/MediaVariationsIndexDatabase$2;->this$0:Lcom/facebook/imagepipeline/producers/MediaVariationsIndexDatabase;

    invoke-static {v3}, Lcom/facebook/imagepipeline/producers/MediaVariationsIndexDatabase;->access$200(Lcom/facebook/imagepipeline/producers/MediaVariationsIndexDatabase;)Lcom/facebook/imagepipeline/producers/MediaVariationsIndexDatabase$LazyIndexDbOpenHelper;

    move-result-object v3

    invoke-virtual {v3}, Lcom/facebook/imagepipeline/producers/MediaVariationsIndexDatabase$LazyIndexDbOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    .line 135
    .local v1, "db":Landroid/database/sqlite/SQLiteDatabase;
    :try_start_0
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 137
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 138
    .local v0, "contentValues":Landroid/content/ContentValues;
    const-string/jumbo v3, "media_id"

    iget-object v4, p0, Lcom/facebook/imagepipeline/producers/MediaVariationsIndexDatabase$2;->val$mediaId:Ljava/lang/String;

    invoke-virtual {v0, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 139
    const-string/jumbo v3, "width"

    iget-object v4, p0, Lcom/facebook/imagepipeline/producers/MediaVariationsIndexDatabase$2;->val$encodedImage:Lcom/facebook/imagepipeline/image/EncodedImage;

    invoke-virtual {v4}, Lcom/facebook/imagepipeline/image/EncodedImage;->getWidth()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 140
    const-string/jumbo v3, "height"

    iget-object v4, p0, Lcom/facebook/imagepipeline/producers/MediaVariationsIndexDatabase$2;->val$encodedImage:Lcom/facebook/imagepipeline/image/EncodedImage;

    invoke-virtual {v4}, Lcom/facebook/imagepipeline/image/EncodedImage;->getHeight()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 141
    const-string/jumbo v3, "cache_key"

    iget-object v4, p0, Lcom/facebook/imagepipeline/producers/MediaVariationsIndexDatabase$2;->val$cacheKey:Lcom/facebook/cache/common/CacheKey;

    invoke-interface {v4}, Lcom/facebook/cache/common/CacheKey;->getUriString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 142
    const-string/jumbo v3, "resource_id"

    iget-object v4, p0, Lcom/facebook/imagepipeline/producers/MediaVariationsIndexDatabase$2;->val$cacheKey:Lcom/facebook/cache/common/CacheKey;

    .line 143
    invoke-static {v4}, Lcom/facebook/cache/common/CacheKeyUtil;->getFirstResourceId(Lcom/facebook/cache/common/CacheKey;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 145
    const-string/jumbo v3, "media_variations_index"

    const/4 v4, 0x0

    invoke-virtual {v1, v3, v4, v0}, Landroid/database/sqlite/SQLiteDatabase;->insertOrThrow(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    .line 147
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 151
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 153
    .end local v0    # "contentValues":Landroid/content/ContentValues;
    :goto_0
    return-void

    .line 148
    :catch_0
    move-exception v2

    .line 149
    .local v2, "x":Ljava/lang/Exception;
    :try_start_1
    invoke-static {}, Lcom/facebook/imagepipeline/producers/MediaVariationsIndexDatabase;->access$300()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "Error writing for %s"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    iget-object v7, p0, Lcom/facebook/imagepipeline/producers/MediaVariationsIndexDatabase$2;->val$mediaId:Ljava/lang/String;

    aput-object v7, v5, v6

    invoke-static {v3, v2, v4, v5}, Lcom/facebook/common/logging/FLog;->e(Ljava/lang/String;Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 151
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    goto :goto_0

    .end local v2    # "x":Ljava/lang/Exception;
    :catchall_0
    move-exception v3

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw v3
.end method
