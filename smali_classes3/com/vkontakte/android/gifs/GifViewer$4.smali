.class Lcom/vkontakte/android/gifs/GifViewer$4;
.super Lcom/vkontakte/android/background/AsyncTask;
.source "GifViewer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/gifs/GifViewer;->obtainData()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/background/AsyncTask",
        "<",
        "Ljava/lang/String;",
        "Ljava/lang/Integer;",
        "Lcom/vkontakte/android/ui/animation/MovieDrawable;",
        ">;"
    }
.end annotation


# instance fields
.field mUrl:Ljava/lang/String;

.field final synthetic this$0:Lcom/vkontakte/android/gifs/GifViewer;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/gifs/GifViewer;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/gifs/GifViewer;

    .prologue
    .line 440
    iput-object p1, p0, Lcom/vkontakte/android/gifs/GifViewer$4;->this$0:Lcom/vkontakte/android/gifs/GifViewer;

    invoke-direct {p0}, Lcom/vkontakte/android/background/AsyncTask;-><init>()V

    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/String;)Lcom/vkontakte/android/ui/animation/MovieDrawable;
    .locals 26
    .param p1, "args"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 454
    const/16 v22, 0x0

    aget-object v19, p1, v22

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/vkontakte/android/gifs/GifViewer$4;->mUrl:Ljava/lang/String;

    .line 455
    .local v19, "url":Ljava/lang/String;
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v23, "doc"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/gifs/GifViewer$4;->this$0:Lcom/vkontakte/android/gifs/GifViewer;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    iget v0, v0, Lcom/vkontakte/android/gifs/GifViewer;->mOwnerId:I

    move/from16 v23, v0

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string/jumbo v23, "_"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/gifs/GifViewer$4;->this$0:Lcom/vkontakte/android/gifs/GifViewer;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    iget v0, v0, Lcom/vkontakte/android/gifs/GifViewer;->mDocumentId:I

    move/from16 v23, v0

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/gifs/GifViewer$4;->this$0:Lcom/vkontakte/android/gifs/GifViewer;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    iget-object v0, v0, Lcom/vkontakte/android/gifs/GifViewer;->mAccessKey:Ljava/lang/String;

    move-object/from16 v22, v0

    if-eqz v22, :cond_0

    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v24, 0x5f

    move-object/from16 v0, v22

    move/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/gifs/GifViewer$4;->this$0:Lcom/vkontakte/android/gifs/GifViewer;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    iget-object v0, v0, Lcom/vkontakte/android/gifs/GifViewer;->mAccessKey:Ljava/lang/String;

    move-object/from16 v24, v0

    move-object/from16 v0, v22

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    :goto_0
    move-object/from16 v0, v23

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/gifs/GifViewer$4;->this$0:Lcom/vkontakte/android/gifs/GifViewer;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    iget-boolean v0, v0, Lcom/vkontakte/android/gifs/GifViewer;->ignoreCache:Z

    move/from16 v22, v0

    if-eqz v22, :cond_1

    const-string/jumbo v22, "_nocache"

    :goto_1
    move-object/from16 v0, v23

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 456
    .local v4, "cacheKey":Ljava/lang/String;
    sget-object v22, Lcom/vkontakte/android/gifs/GifViewer;->sGifs:Lcom/vkontakte/android/cache/Gifs;

    move-object/from16 v0, v22

    invoke-virtual {v0, v4}, Lcom/vkontakte/android/cache/Gifs;->get(Ljava/lang/String;)Lcom/vkontakte/android/cache/FileLruCache$Entry;

    move-result-object v8

    .line 457
    .local v8, "entry":Lcom/vkontakte/android/cache/FileLruCache$Entry;
    if-nez v8, :cond_7

    .line 465
    invoke-static {}, Lcom/vk/core/network/Network;->getDefaultClient()Lokhttp3/OkHttpClient;

    move-result-object v22

    new-instance v23, Lokhttp3/Request$Builder;

    invoke-direct/range {v23 .. v23}, Lokhttp3/Request$Builder;-><init>()V

    move-object/from16 v0, v23

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lokhttp3/Request$Builder;->url(Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Lokhttp3/Request$Builder;->get()Lokhttp3/Request$Builder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Lokhttp3/OkHttpClient;->newCall(Lokhttp3/Request;)Lokhttp3/Call;

    move-result-object v22

    invoke-interface/range {v22 .. v22}, Lokhttp3/Call;->execute()Lokhttp3/Response;

    move-result-object v15

    .line 466
    .local v15, "response":Lokhttp3/Response;
    invoke-virtual {v15}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object v2

    .line 467
    .local v2, "body":Lokhttp3/ResponseBody;
    invoke-virtual {v2}, Lokhttp3/ResponseBody;->contentLength()J

    move-result-wide v6

    .line 468
    .local v6, "contentLength":J
    invoke-virtual {v15}, Lokhttp3/Response;->code()I

    move-result v16

    .line 469
    .local v16, "responseCode":I
    div-int/lit8 v17, v16, 0x64

    .line 470
    .local v17, "shortCode":I
    const-wide/32 v22, 0x3200000

    cmp-long v22, v6, v22

    if-lez v22, :cond_2

    .line 471
    new-instance v22, Ljava/io/IOException;

    const-string/jumbo v23, "File is too big"

    invoke-direct/range {v22 .. v23}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v22

    .line 455
    .end local v2    # "body":Lokhttp3/ResponseBody;
    .end local v4    # "cacheKey":Ljava/lang/String;
    .end local v6    # "contentLength":J
    .end local v8    # "entry":Lcom/vkontakte/android/cache/FileLruCache$Entry;
    .end local v15    # "response":Lokhttp3/Response;
    .end local v16    # "responseCode":I
    .end local v17    # "shortCode":I
    :cond_0
    const-string/jumbo v22, ""

    goto :goto_0

    :cond_1
    const-string/jumbo v22, ""

    goto :goto_1

    .line 473
    .restart local v2    # "body":Lokhttp3/ResponseBody;
    .restart local v4    # "cacheKey":Ljava/lang/String;
    .restart local v6    # "contentLength":J
    .restart local v8    # "entry":Lcom/vkontakte/android/cache/FileLruCache$Entry;
    .restart local v15    # "response":Lokhttp3/Response;
    .restart local v16    # "responseCode":I
    .restart local v17    # "shortCode":I
    :cond_2
    const-wide/16 v22, 0x0

    cmp-long v22, v6, v22

    if-gez v22, :cond_3

    .line 474
    new-instance v22, Ljava/io/IOException;

    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v24, "Content-length is "

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, v23

    invoke-virtual {v0, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    invoke-direct/range {v22 .. v23}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v22

    .line 476
    :cond_3
    const/16 v22, 0x1

    move/from16 v0, v17

    move/from16 v1, v22

    if-eq v0, v1, :cond_4

    const/16 v22, 0x2

    move/from16 v0, v17

    move/from16 v1, v22

    if-eq v0, v1, :cond_4

    const/16 v22, 0x3

    move/from16 v0, v17

    move/from16 v1, v22

    if-eq v0, v1, :cond_4

    .line 477
    new-instance v22, Ljava/io/IOException;

    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v24, "Invalid response code "

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, v23

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    invoke-direct/range {v22 .. v23}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v22

    .line 480
    :cond_4
    sget-object v22, Lcom/vkontakte/android/gifs/GifViewer;->sGifs:Lcom/vkontakte/android/cache/Gifs;

    move-object/from16 v0, v22

    invoke-virtual {v0, v4}, Lcom/vkontakte/android/cache/Gifs;->insert(Ljava/lang/String;)Lcom/vkontakte/android/cache/FileLruCache$Editor;

    move-result-object v5

    .line 481
    .local v5, "editor":Lcom/vkontakte/android/cache/FileLruCache$Editor;
    invoke-virtual {v5}, Lcom/vkontakte/android/cache/FileLruCache$Editor;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v11

    .line 482
    .local v11, "out":Ljava/io/OutputStream;
    invoke-virtual {v2}, Lokhttp3/ResponseBody;->byteStream()Ljava/io/InputStream;

    move-result-object v9

    .line 483
    .local v9, "in":Ljava/io/InputStream;
    const/16 v22, 0x800

    move/from16 v0, v22

    new-array v3, v0, [B

    .line 485
    .local v3, "buffer":[B
    const-wide/16 v20, 0x0

    .line 486
    .local v20, "transferred":D
    const/16 v10, -0x80

    .line 487
    .local v10, "lastSentProgress":I
    :cond_5
    :goto_2
    invoke-virtual {v9, v3}, Ljava/io/InputStream;->read([B)I

    move-result v14

    .local v14, "read":I
    if-lez v14, :cond_6

    .line 488
    const/16 v22, 0x0

    move/from16 v0, v22

    invoke-virtual {v11, v3, v0, v14}, Ljava/io/OutputStream;->write([BII)V

    .line 489
    int-to-double v0, v14

    move-wide/from16 v22, v0

    add-double v20, v20, v22

    .line 490
    long-to-double v0, v6

    move-wide/from16 v22, v0

    div-double v12, v20, v22

    .line 491
    .local v12, "normalizedProgress":D
    const-wide v22, 0x406fe00000000000L    # 255.0

    mul-double v22, v22, v12

    const-wide v24, 0x405fc00000000000L    # 127.0

    sub-double v22, v22, v24

    move-wide/from16 v0, v22

    double-to-int v0, v0

    move/from16 v18, v0

    .line 492
    .local v18, "signedProgress":I
    sub-int v22, v18, v10

    const/16 v23, 0x2

    move/from16 v0, v22

    move/from16 v1, v23

    if-le v0, v1, :cond_5

    .line 493
    move/from16 v10, v18

    .line 494
    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v22

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/gifs/GifViewer$4;->publishProgress(Ljava/lang/Object;)V

    goto :goto_2

    .line 497
    .end local v12    # "normalizedProgress":D
    .end local v18    # "signedProgress":I
    :cond_6
    invoke-virtual {v11}, Ljava/io/OutputStream;->flush()V

    .line 498
    invoke-virtual {v11}, Ljava/io/OutputStream;->close()V

    .line 499
    invoke-virtual {v9}, Ljava/io/InputStream;->close()V

    .line 501
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/gifs/GifViewer$4;->isCanceled()Z

    move-result v22

    if-nez v22, :cond_8

    .line 502
    invoke-virtual {v5}, Lcom/vkontakte/android/cache/FileLruCache$Editor;->commit()Lcom/vkontakte/android/cache/FileLruCache$Entry;

    move-result-object v8

    .line 507
    .end local v2    # "body":Lokhttp3/ResponseBody;
    .end local v3    # "buffer":[B
    .end local v5    # "editor":Lcom/vkontakte/android/cache/FileLruCache$Editor;
    .end local v6    # "contentLength":J
    .end local v9    # "in":Ljava/io/InputStream;
    .end local v10    # "lastSentProgress":I
    .end local v11    # "out":Ljava/io/OutputStream;
    .end local v14    # "read":I
    .end local v15    # "response":Lokhttp3/Response;
    .end local v16    # "responseCode":I
    .end local v17    # "shortCode":I
    .end local v20    # "transferred":D
    :cond_7
    new-instance v22, Lcom/vkontakte/android/ui/animation/MovieDrawable;

    iget-object v0, v8, Lcom/vkontakte/android/cache/FileLruCache$Entry;->file:Ljava/io/File;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v23

    invoke-direct/range {v22 .. v23}, Lcom/vkontakte/android/ui/animation/MovieDrawable;-><init>(Ljava/lang/String;)V

    return-object v22

    .line 504
    .restart local v2    # "body":Lokhttp3/ResponseBody;
    .restart local v3    # "buffer":[B
    .restart local v5    # "editor":Lcom/vkontakte/android/cache/FileLruCache$Editor;
    .restart local v6    # "contentLength":J
    .restart local v9    # "in":Ljava/io/InputStream;
    .restart local v10    # "lastSentProgress":I
    .restart local v11    # "out":Ljava/io/OutputStream;
    .restart local v14    # "read":I
    .restart local v15    # "response":Lokhttp3/Response;
    .restart local v16    # "responseCode":I
    .restart local v17    # "shortCode":I
    .restart local v20    # "transferred":D
    :cond_8
    new-instance v22, Ljava/lang/InterruptedException;

    invoke-direct/range {v22 .. v22}, Ljava/lang/InterruptedException;-><init>()V

    throw v22
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 440
    check-cast p1, [Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/gifs/GifViewer$4;->doInBackground([Ljava/lang/String;)Lcom/vkontakte/android/ui/animation/MovieDrawable;

    move-result-object v0

    return-object v0
.end method

.method synthetic lambda$onPostExecute$0(Lcom/vkontakte/android/ui/animation/MovieDrawable;)V
    .locals 3
    .param p1, "drawable"    # Lcom/vkontakte/android/ui/animation/MovieDrawable;

    .prologue
    .line 527
    iget-object v0, p0, Lcom/vkontakte/android/gifs/GifViewer$4;->this$0:Lcom/vkontakte/android/gifs/GifViewer;

    iget-object v0, v0, Lcom/vkontakte/android/gifs/GifViewer;->mImageView:Lcom/vkontakte/android/ui/widget/RatioImageView;

    invoke-virtual {p1}, Lcom/vkontakte/android/ui/animation/MovieDrawable;->getIntrinsicHeight()I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {p1}, Lcom/vkontakte/android/ui/animation/MovieDrawable;->getIntrinsicWidth()I

    move-result v2

    int-to-float v2, v2

    div-float/2addr v1, v2

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/widget/RatioImageView;->setImageRatio(F)V

    .line 528
    iget-object v0, p0, Lcom/vkontakte/android/gifs/GifViewer$4;->this$0:Lcom/vkontakte/android/gifs/GifViewer;

    iget-object v0, v0, Lcom/vkontakte/android/gifs/GifViewer;->mImageView:Lcom/vkontakte/android/ui/widget/RatioImageView;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/ui/widget/RatioImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 529
    sget-object v0, Lcom/vkontakte/android/gifs/GifViewer;->sGifs:Lcom/vkontakte/android/cache/Gifs;

    iget-object v1, p0, Lcom/vkontakte/android/gifs/GifViewer$4;->this$0:Lcom/vkontakte/android/gifs/GifViewer;

    iget v1, v1, Lcom/vkontakte/android/gifs/GifViewer;->mDocumentId:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/cache/Gifs;->trackPlayEvent(IZ)V

    .line 530
    iget-object v0, p0, Lcom/vkontakte/android/gifs/GifViewer$4;->this$0:Lcom/vkontakte/android/gifs/GifViewer;

    invoke-virtual {v0}, Lcom/vkontakte/android/gifs/GifViewer;->invalidateMenu()V

    .line 531
    return-void
.end method

.method protected onError(Ljava/lang/Throwable;)V
    .locals 2
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 541
    iget-object v0, p0, Lcom/vkontakte/android/gifs/GifViewer$4;->this$0:Lcom/vkontakte/android/gifs/GifViewer;

    iget-object v0, v0, Lcom/vkontakte/android/gifs/GifViewer;->mProgress:Lcom/vkontakte/android/ui/CircularProgressBar;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/CircularProgressBar;->setVisibility(I)V

    .line 542
    iget-object v0, p0, Lcom/vkontakte/android/gifs/GifViewer$4;->this$0:Lcom/vkontakte/android/gifs/GifViewer;

    iget-object v0, v0, Lcom/vkontakte/android/gifs/GifViewer;->mImageView:Lcom/vkontakte/android/ui/widget/RatioImageView;

    const/high16 v1, -0x78000000

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/widget/RatioImageView;->setColorFilter(I)V

    .line 543
    iget-object v0, p0, Lcom/vkontakte/android/gifs/GifViewer$4;->this$0:Lcom/vkontakte/android/gifs/GifViewer;

    iget-object v0, v0, Lcom/vkontakte/android/gifs/GifViewer;->mErrorLayout:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 544
    return-void
.end method

.method protected onPostExecute(Lcom/vkontakte/android/ui/animation/MovieDrawable;)V
    .locals 2
    .param p1, "movieDrawable"    # Lcom/vkontakte/android/ui/animation/MovieDrawable;

    .prologue
    const/16 v1, 0x8

    .line 519
    iget-object v0, p0, Lcom/vkontakte/android/gifs/GifViewer$4;->this$0:Lcom/vkontakte/android/gifs/GifViewer;

    iget-object v0, v0, Lcom/vkontakte/android/gifs/GifViewer;->mProgress:Lcom/vkontakte/android/ui/CircularProgressBar;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/CircularProgressBar;->setVisibility(I)V

    .line 520
    iget-object v0, p0, Lcom/vkontakte/android/gifs/GifViewer$4;->this$0:Lcom/vkontakte/android/gifs/GifViewer;

    iget-object v0, v0, Lcom/vkontakte/android/gifs/GifViewer;->mErrorLayout:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 521
    iget-object v0, p0, Lcom/vkontakte/android/gifs/GifViewer$4;->this$0:Lcom/vkontakte/android/gifs/GifViewer;

    iget-object v0, v0, Lcom/vkontakte/android/gifs/GifViewer;->mImageView:Lcom/vkontakte/android/ui/widget/RatioImageView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/widget/RatioImageView;->setColorFilter(Landroid/graphics/ColorFilter;)V

    .line 522
    iget-object v0, p0, Lcom/vkontakte/android/gifs/GifViewer$4;->this$0:Lcom/vkontakte/android/gifs/GifViewer;

    iget-object v0, v0, Lcom/vkontakte/android/gifs/GifViewer;->mDrawable:Lcom/vkontakte/android/ui/animation/MovieDrawable;

    if-eqz v0, :cond_0

    .line 523
    iget-object v0, p0, Lcom/vkontakte/android/gifs/GifViewer$4;->this$0:Lcom/vkontakte/android/gifs/GifViewer;

    iget-object v0, v0, Lcom/vkontakte/android/gifs/GifViewer;->mDrawable:Lcom/vkontakte/android/ui/animation/MovieDrawable;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/animation/MovieDrawable;->recycle()V

    .line 525
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/gifs/GifViewer$4;->this$0:Lcom/vkontakte/android/gifs/GifViewer;

    iput-object p1, v0, Lcom/vkontakte/android/gifs/GifViewer;->mDrawable:Lcom/vkontakte/android/ui/animation/MovieDrawable;

    .line 526
    iget-object v0, p0, Lcom/vkontakte/android/gifs/GifViewer$4;->this$0:Lcom/vkontakte/android/gifs/GifViewer;

    iget-object v0, v0, Lcom/vkontakte/android/gifs/GifViewer;->mDrawable:Lcom/vkontakte/android/ui/animation/MovieDrawable;

    invoke-static {p0}, Lcom/vkontakte/android/gifs/GifViewer$4$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/gifs/GifViewer$4;)Lcom/vkontakte/android/functions/VoidF1;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/animation/MovieDrawable;->setReadyCallback(Lcom/vkontakte/android/functions/VoidF1;)V

    .line 532
    iget-object v0, p0, Lcom/vkontakte/android/gifs/GifViewer$4;->this$0:Lcom/vkontakte/android/gifs/GifViewer;

    iget-object v0, v0, Lcom/vkontakte/android/gifs/GifViewer;->mDrawable:Lcom/vkontakte/android/ui/animation/MovieDrawable;

    iget-object v1, p0, Lcom/vkontakte/android/gifs/GifViewer$4;->this$0:Lcom/vkontakte/android/gifs/GifViewer;

    iget v1, v1, Lcom/vkontakte/android/gifs/GifViewer;->mPosition:I

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/animation/MovieDrawable;->seek(I)V

    .line 533
    iget-object v0, p0, Lcom/vkontakte/android/gifs/GifViewer$4;->this$0:Lcom/vkontakte/android/gifs/GifViewer;

    iget-object v0, v0, Lcom/vkontakte/android/gifs/GifViewer;->mDrawable:Lcom/vkontakte/android/ui/animation/MovieDrawable;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/animation/MovieDrawable;->start()V

    .line 534
    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 440
    check-cast p1, Lcom/vkontakte/android/ui/animation/MovieDrawable;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/gifs/GifViewer$4;->onPostExecute(Lcom/vkontakte/android/ui/animation/MovieDrawable;)V

    return-void
.end method

.method protected onPreExecute()V
    .locals 4

    .prologue
    .line 446
    iget-object v0, p0, Lcom/vkontakte/android/gifs/GifViewer$4;->this$0:Lcom/vkontakte/android/gifs/GifViewer;

    iget-object v0, v0, Lcom/vkontakte/android/gifs/GifViewer;->mProgress:Lcom/vkontakte/android/ui/CircularProgressBar;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/CircularProgressBar;->setVisibility(I)V

    .line 447
    iget-object v0, p0, Lcom/vkontakte/android/gifs/GifViewer$4;->this$0:Lcom/vkontakte/android/gifs/GifViewer;

    iget-object v0, v0, Lcom/vkontakte/android/gifs/GifViewer;->mProgress:Lcom/vkontakte/android/ui/CircularProgressBar;

    const-wide/16 v2, 0x0

    invoke-virtual {v0, v2, v3}, Lcom/vkontakte/android/ui/CircularProgressBar;->setProgress(D)V

    .line 448
    iget-object v0, p0, Lcom/vkontakte/android/gifs/GifViewer$4;->this$0:Lcom/vkontakte/android/gifs/GifViewer;

    iget-object v0, v0, Lcom/vkontakte/android/gifs/GifViewer;->mErrorLayout:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 449
    return-void
.end method

.method protected onProgressUpdate(Ljava/lang/Integer;)V
    .locals 6
    .param p1, "integer"    # Ljava/lang/Integer;

    .prologue
    .line 512
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v4

    add-int/lit8 v4, v4, 0x7f

    int-to-double v2, v4

    .line 513
    .local v2, "unsignedProgress":D
    const-wide/high16 v4, 0x4070000000000000L    # 256.0

    div-double v0, v2, v4

    .line 514
    .local v0, "normalizedProgress":D
    iget-object v4, p0, Lcom/vkontakte/android/gifs/GifViewer$4;->this$0:Lcom/vkontakte/android/gifs/GifViewer;

    iget-object v4, v4, Lcom/vkontakte/android/gifs/GifViewer;->mProgress:Lcom/vkontakte/android/ui/CircularProgressBar;

    invoke-virtual {v4, v0, v1}, Lcom/vkontakte/android/ui/CircularProgressBar;->setProgress(D)V

    .line 515
    return-void
.end method

.method protected bridge synthetic onProgressUpdate(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 440
    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/gifs/GifViewer$4;->onProgressUpdate(Ljava/lang/Integer;)V

    return-void
.end method
