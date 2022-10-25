.class Lcom/vkontakte/android/attachments/DocumentAttachment$3;
.super Lcom/vkontakte/android/background/AsyncTask;
.source "DocumentAttachment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/attachments/DocumentAttachment;->start(Z)V
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

.field final synthetic this$0:Lcom/vkontakte/android/attachments/DocumentAttachment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/attachments/DocumentAttachment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/attachments/DocumentAttachment;

    .prologue
    .line 361
    iput-object p1, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$3;->this$0:Lcom/vkontakte/android/attachments/DocumentAttachment;

    invoke-direct {p0}, Lcom/vkontakte/android/background/AsyncTask;-><init>()V

    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/String;)Lcom/vkontakte/android/ui/animation/MovieDrawable;
    .locals 25
    .param p1, "args"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 374
    const/16 v22, 0x0

    aget-object v19, p1, v22

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/vkontakte/android/attachments/DocumentAttachment$3;->mUrl:Ljava/lang/String;

    .line 375
    .local v19, "url":Ljava/lang/String;
    const/16 v22, 0x1

    aget-object v6, p1, v22

    .line 376
    .local v6, "documentId":Ljava/lang/String;
    invoke-static {}, Lcom/vkontakte/android/attachments/DocumentAttachment;->access$100()Lcom/vkontakte/android/cache/Gifs;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-virtual {v0, v6}, Lcom/vkontakte/android/cache/Gifs;->get(Ljava/lang/String;)Lcom/vkontakte/android/cache/FileLruCache$Entry;

    move-result-object v8

    .line 377
    .local v8, "entry":Lcom/vkontakte/android/cache/FileLruCache$Entry;
    if-nez v8, :cond_5

    .line 381
    invoke-static {}, Lcom/vk/core/network/Network;->getDefaultClient()Lokhttp3/OkHttpClient;

    move-result-object v22

    new-instance v23, Lokhttp3/Request$Builder;

    invoke-direct/range {v23 .. v23}, Lokhttp3/Request$Builder;-><init>()V

    .line 382
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

    .line 383
    .local v15, "response":Lokhttp3/Response;
    invoke-virtual {v15}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object v2

    .line 384
    .local v2, "body":Lokhttp3/ResponseBody;
    invoke-virtual {v2}, Lokhttp3/ResponseBody;->contentLength()J

    move-result-wide v4

    .line 385
    .local v4, "contentLength":J
    invoke-virtual {v15}, Lokhttp3/Response;->code()I

    move-result v16

    .line 386
    .local v16, "responseCode":I
    div-int/lit8 v17, v16, 0x64

    .line 387
    .local v17, "shortCode":I
    const-wide/32 v22, 0x3200000

    cmp-long v22, v4, v22

    if-lez v22, :cond_0

    .line 388
    new-instance v22, Ljava/io/IOException;

    const-string/jumbo v23, "File is too big"

    invoke-direct/range {v22 .. v23}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v22

    .line 390
    :cond_0
    const-wide/16 v22, 0x0

    cmp-long v22, v4, v22

    if-gez v22, :cond_1

    .line 391
    new-instance v22, Ljava/io/IOException;

    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v24, "Content-length is "

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, v23

    invoke-virtual {v0, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    invoke-direct/range {v22 .. v23}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v22

    .line 393
    :cond_1
    const/16 v22, 0x1

    move/from16 v0, v17

    move/from16 v1, v22

    if-eq v0, v1, :cond_2

    const/16 v22, 0x2

    move/from16 v0, v17

    move/from16 v1, v22

    if-eq v0, v1, :cond_2

    const/16 v22, 0x3

    move/from16 v0, v17

    move/from16 v1, v22

    if-eq v0, v1, :cond_2

    .line 394
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

    .line 397
    :cond_2
    invoke-static {}, Lcom/vkontakte/android/attachments/DocumentAttachment;->access$100()Lcom/vkontakte/android/cache/Gifs;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-virtual {v0, v6}, Lcom/vkontakte/android/cache/Gifs;->insert(Ljava/lang/String;)Lcom/vkontakte/android/cache/FileLruCache$Editor;

    move-result-object v7

    .line 398
    .local v7, "editor":Lcom/vkontakte/android/cache/FileLruCache$Editor;
    invoke-virtual {v7}, Lcom/vkontakte/android/cache/FileLruCache$Editor;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v11

    .line 399
    .local v11, "out":Ljava/io/OutputStream;
    invoke-virtual {v2}, Lokhttp3/ResponseBody;->byteStream()Ljava/io/InputStream;

    move-result-object v9

    .line 400
    .local v9, "in":Ljava/io/InputStream;
    const/16 v22, 0x400

    move/from16 v0, v22

    new-array v3, v0, [B

    .line 402
    .local v3, "buffer":[B
    const-wide/16 v20, 0x0

    .line 403
    .local v20, "transferred":D
    const/4 v10, 0x0

    .line 404
    .local v10, "lastSentProgress":I
    :cond_3
    :goto_0
    invoke-virtual {v9, v3}, Ljava/io/InputStream;->read([B)I

    move-result v14

    .local v14, "read":I
    if-lez v14, :cond_4

    .line 405
    const/16 v22, 0x0

    move/from16 v0, v22

    invoke-virtual {v11, v3, v0, v14}, Ljava/io/OutputStream;->write([BII)V

    .line 406
    int-to-double v0, v14

    move-wide/from16 v22, v0

    add-double v20, v20, v22

    .line 407
    long-to-double v0, v4

    move-wide/from16 v22, v0

    div-double v12, v20, v22

    .line 408
    .local v12, "normalizedProgress":D
    const-wide/high16 v22, 0x4059000000000000L    # 100.0

    mul-double v22, v22, v12

    move-wide/from16 v0, v22

    double-to-int v0, v0

    move/from16 v18, v0

    .line 409
    .local v18, "signedProgress":I
    move/from16 v0, v18

    if-eq v0, v10, :cond_3

    .line 410
    move/from16 v10, v18

    .line 411
    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v22

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/attachments/DocumentAttachment$3;->publishProgress(Ljava/lang/Object;)V

    goto :goto_0

    .line 414
    .end local v12    # "normalizedProgress":D
    .end local v18    # "signedProgress":I
    :cond_4
    invoke-virtual {v9}, Ljava/io/InputStream;->close()V

    .line 415
    invoke-virtual {v11}, Ljava/io/OutputStream;->close()V

    .line 416
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/attachments/DocumentAttachment$3;->isCanceled()Z

    move-result v22

    if-nez v22, :cond_6

    .line 417
    invoke-virtual {v7}, Lcom/vkontakte/android/cache/FileLruCache$Editor;->commit()Lcom/vkontakte/android/cache/FileLruCache$Entry;

    move-result-object v8

    .line 422
    .end local v2    # "body":Lokhttp3/ResponseBody;
    .end local v3    # "buffer":[B
    .end local v4    # "contentLength":J
    .end local v7    # "editor":Lcom/vkontakte/android/cache/FileLruCache$Editor;
    .end local v9    # "in":Ljava/io/InputStream;
    .end local v10    # "lastSentProgress":I
    .end local v11    # "out":Ljava/io/OutputStream;
    .end local v14    # "read":I
    .end local v15    # "response":Lokhttp3/Response;
    .end local v16    # "responseCode":I
    .end local v17    # "shortCode":I
    .end local v20    # "transferred":D
    :cond_5
    new-instance v22, Lcom/vkontakte/android/ui/animation/MovieDrawable;

    iget-object v0, v8, Lcom/vkontakte/android/cache/FileLruCache$Entry;->file:Ljava/io/File;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v23

    invoke-direct/range {v22 .. v23}, Lcom/vkontakte/android/ui/animation/MovieDrawable;-><init>(Ljava/lang/String;)V

    return-object v22

    .line 419
    .restart local v2    # "body":Lokhttp3/ResponseBody;
    .restart local v3    # "buffer":[B
    .restart local v4    # "contentLength":J
    .restart local v7    # "editor":Lcom/vkontakte/android/cache/FileLruCache$Editor;
    .restart local v9    # "in":Ljava/io/InputStream;
    .restart local v10    # "lastSentProgress":I
    .restart local v11    # "out":Ljava/io/OutputStream;
    .restart local v14    # "read":I
    .restart local v15    # "response":Lokhttp3/Response;
    .restart local v16    # "responseCode":I
    .restart local v17    # "shortCode":I
    .restart local v20    # "transferred":D
    :cond_6
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
    .line 361
    check-cast p1, [Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/attachments/DocumentAttachment$3;->doInBackground([Ljava/lang/String;)Lcom/vkontakte/android/ui/animation/MovieDrawable;

    move-result-object v0

    return-object v0
.end method

.method synthetic lambda$onPostExecute$0(Lcom/vkontakte/android/ui/animation/MovieDrawable;)V
    .locals 3
    .param p1, "drawable"    # Lcom/vkontakte/android/ui/animation/MovieDrawable;

    .prologue
    .line 444
    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$3;->this$0:Lcom/vkontakte/android/attachments/DocumentAttachment;

    invoke-static {v0}, Lcom/vkontakte/android/attachments/DocumentAttachment;->access$000(Lcom/vkontakte/android/attachments/DocumentAttachment;)Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 445
    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$3;->this$0:Lcom/vkontakte/android/attachments/DocumentAttachment;

    invoke-static {v0}, Lcom/vkontakte/android/attachments/DocumentAttachment;->access$000(Lcom/vkontakte/android/attachments/DocumentAttachment;)Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->showDone()V

    .line 446
    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$3;->this$0:Lcom/vkontakte/android/attachments/DocumentAttachment;

    invoke-static {v0}, Lcom/vkontakte/android/attachments/DocumentAttachment;->access$000(Lcom/vkontakte/android/attachments/DocumentAttachment;)Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;

    move-result-object v0

    iget-object v0, v0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->mImageView:Lcom/vk/imageloader/view/VKImageView;

    invoke-virtual {v0, p1}, Lcom/vk/imageloader/view/VKImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 448
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$3;->this$0:Lcom/vkontakte/android/attachments/DocumentAttachment;

    invoke-virtual {v0}, Lcom/vkontakte/android/attachments/DocumentAttachment;->canAutoPlay()Z

    move-result v0

    if-nez v0, :cond_2

    .line 449
    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$3;->this$0:Lcom/vkontakte/android/attachments/DocumentAttachment;

    iget-boolean v0, v0, Lcom/vkontakte/android/attachments/DocumentAttachment;->wasPlayed:Z

    if-nez v0, :cond_1

    .line 450
    invoke-static {}, Lcom/vkontakte/android/attachments/DocumentAttachment;->access$100()Lcom/vkontakte/android/cache/Gifs;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$3;->this$0:Lcom/vkontakte/android/attachments/DocumentAttachment;

    iget v1, v1, Lcom/vkontakte/android/attachments/DocumentAttachment;->did:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/cache/Gifs;->trackPlayEvent(IZ)V

    .line 452
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$3;->this$0:Lcom/vkontakte/android/attachments/DocumentAttachment;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/vkontakte/android/attachments/DocumentAttachment;->wasPlayed:Z

    .line 454
    :cond_2
    return-void
.end method

.method protected onError(Ljava/lang/Throwable;)V
    .locals 2
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 469
    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$3;->this$0:Lcom/vkontakte/android/attachments/DocumentAttachment;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/vkontakte/android/attachments/DocumentAttachment;->access$202(Lcom/vkontakte/android/attachments/DocumentAttachment;Z)Z

    .line 473
    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$3;->this$0:Lcom/vkontakte/android/attachments/DocumentAttachment;

    invoke-static {v0}, Lcom/vkontakte/android/attachments/DocumentAttachment;->access$000(Lcom/vkontakte/android/attachments/DocumentAttachment;)Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 474
    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$3;->this$0:Lcom/vkontakte/android/attachments/DocumentAttachment;

    invoke-static {v0}, Lcom/vkontakte/android/attachments/DocumentAttachment;->access$000(Lcom/vkontakte/android/attachments/DocumentAttachment;)Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->showError()V

    .line 476
    :cond_0
    return-void
.end method

.method protected onPostExecute(Lcom/vkontakte/android/ui/animation/MovieDrawable;)V
    .locals 3
    .param p1, "movieDrawable"    # Lcom/vkontakte/android/ui/animation/MovieDrawable;

    .prologue
    const/4 v2, 0x1

    .line 434
    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$3;->this$0:Lcom/vkontakte/android/attachments/DocumentAttachment;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vkontakte/android/attachments/DocumentAttachment;->access$202(Lcom/vkontakte/android/attachments/DocumentAttachment;Z)Z

    .line 435
    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$3;->this$0:Lcom/vkontakte/android/attachments/DocumentAttachment;

    invoke-static {v0, v2}, Lcom/vkontakte/android/attachments/DocumentAttachment;->access$302(Lcom/vkontakte/android/attachments/DocumentAttachment;Z)Z

    .line 436
    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$3;->this$0:Lcom/vkontakte/android/attachments/DocumentAttachment;

    invoke-static {v0}, Lcom/vkontakte/android/attachments/DocumentAttachment;->access$000(Lcom/vkontakte/android/attachments/DocumentAttachment;)Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 437
    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$3;->this$0:Lcom/vkontakte/android/attachments/DocumentAttachment;

    invoke-static {v0}, Lcom/vkontakte/android/attachments/DocumentAttachment;->access$000(Lcom/vkontakte/android/attachments/DocumentAttachment;)Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->showDone()V

    .line 439
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$3;->this$0:Lcom/vkontakte/android/attachments/DocumentAttachment;

    invoke-static {v0}, Lcom/vkontakte/android/attachments/DocumentAttachment;->access$400(Lcom/vkontakte/android/attachments/DocumentAttachment;)Lcom/vkontakte/android/ui/animation/MovieDrawable;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 440
    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$3;->this$0:Lcom/vkontakte/android/attachments/DocumentAttachment;

    invoke-static {v0}, Lcom/vkontakte/android/attachments/DocumentAttachment;->access$400(Lcom/vkontakte/android/attachments/DocumentAttachment;)Lcom/vkontakte/android/ui/animation/MovieDrawable;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/animation/MovieDrawable;->recycle()V

    .line 442
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$3;->this$0:Lcom/vkontakte/android/attachments/DocumentAttachment;

    invoke-static {v0, p1}, Lcom/vkontakte/android/attachments/DocumentAttachment;->access$402(Lcom/vkontakte/android/attachments/DocumentAttachment;Lcom/vkontakte/android/ui/animation/MovieDrawable;)Lcom/vkontakte/android/ui/animation/MovieDrawable;

    .line 443
    invoke-static {p0}, Lcom/vkontakte/android/attachments/DocumentAttachment$3$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/attachments/DocumentAttachment$3;)Lcom/vkontakte/android/functions/VoidF1;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/ui/animation/MovieDrawable;->setReadyCallback(Lcom/vkontakte/android/functions/VoidF1;)V

    .line 455
    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$3;->this$0:Lcom/vkontakte/android/attachments/DocumentAttachment;

    invoke-virtual {v0}, Lcom/vkontakte/android/attachments/DocumentAttachment;->canAutoPlay()Z

    move-result v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$3;->this$0:Lcom/vkontakte/android/attachments/DocumentAttachment;

    invoke-static {v0}, Lcom/vkontakte/android/attachments/DocumentAttachment;->access$500(Lcom/vkontakte/android/attachments/DocumentAttachment;)Lcom/vkontakte/android/media/AutoPlay$Listener;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 456
    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$3;->this$0:Lcom/vkontakte/android/attachments/DocumentAttachment;

    invoke-static {v0}, Lcom/vkontakte/android/attachments/DocumentAttachment;->access$600(Lcom/vkontakte/android/attachments/DocumentAttachment;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 457
    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$3;->this$0:Lcom/vkontakte/android/attachments/DocumentAttachment;

    invoke-static {v0}, Lcom/vkontakte/android/attachments/DocumentAttachment;->access$500(Lcom/vkontakte/android/attachments/DocumentAttachment;)Lcom/vkontakte/android/media/AutoPlay$Listener;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$3;->this$0:Lcom/vkontakte/android/attachments/DocumentAttachment;

    invoke-interface {v0, v1}, Lcom/vkontakte/android/media/AutoPlay$Listener;->onReady(Lcom/vkontakte/android/media/AutoPlay;)V

    .line 465
    :goto_0
    return-void

    .line 459
    :cond_2
    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$3;->this$0:Lcom/vkontakte/android/attachments/DocumentAttachment;

    invoke-static {v0}, Lcom/vkontakte/android/attachments/DocumentAttachment;->access$500(Lcom/vkontakte/android/attachments/DocumentAttachment;)Lcom/vkontakte/android/media/AutoPlay$Listener;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$3;->this$0:Lcom/vkontakte/android/attachments/DocumentAttachment;

    invoke-interface {v0, v1}, Lcom/vkontakte/android/media/AutoPlay$Listener;->playPrepared(Lcom/vkontakte/android/media/AutoPlay;)V

    goto :goto_0

    .line 462
    :cond_3
    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$3;->this$0:Lcom/vkontakte/android/attachments/DocumentAttachment;

    invoke-static {v0, v2}, Lcom/vkontakte/android/attachments/DocumentAttachment;->access$702(Lcom/vkontakte/android/attachments/DocumentAttachment;Z)Z

    .line 463
    invoke-virtual {p1}, Lcom/vkontakte/android/ui/animation/MovieDrawable;->start()V

    goto :goto_0
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 361
    check-cast p1, Lcom/vkontakte/android/ui/animation/MovieDrawable;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/attachments/DocumentAttachment$3;->onPostExecute(Lcom/vkontakte/android/ui/animation/MovieDrawable;)V

    return-void
.end method

.method protected onPreExecute()V
    .locals 1

    .prologue
    .line 366
    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$3;->this$0:Lcom/vkontakte/android/attachments/DocumentAttachment;

    iget-boolean v0, v0, Lcom/vkontakte/android/attachments/DocumentAttachment;->wasPlayed:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$3;->this$0:Lcom/vkontakte/android/attachments/DocumentAttachment;

    invoke-static {v0}, Lcom/vkontakte/android/attachments/DocumentAttachment;->access$000(Lcom/vkontakte/android/attachments/DocumentAttachment;)Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 367
    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$3;->this$0:Lcom/vkontakte/android/attachments/DocumentAttachment;

    invoke-static {v0}, Lcom/vkontakte/android/attachments/DocumentAttachment;->access$000(Lcom/vkontakte/android/attachments/DocumentAttachment;)Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->showProgress()V

    .line 369
    :cond_0
    return-void
.end method

.method protected onProgressUpdate(Ljava/lang/Integer;)V
    .locals 2
    .param p1, "progress"    # Ljava/lang/Integer;

    .prologue
    .line 427
    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$3;->this$0:Lcom/vkontakte/android/attachments/DocumentAttachment;

    invoke-static {v0}, Lcom/vkontakte/android/attachments/DocumentAttachment;->access$000(Lcom/vkontakte/android/attachments/DocumentAttachment;)Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 428
    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$3;->this$0:Lcom/vkontakte/android/attachments/DocumentAttachment;

    invoke-static {v0}, Lcom/vkontakte/android/attachments/DocumentAttachment;->access$000(Lcom/vkontakte/android/attachments/DocumentAttachment;)Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->setProgress(I)V

    .line 430
    :cond_0
    return-void
.end method

.method protected bridge synthetic onProgressUpdate(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 361
    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/attachments/DocumentAttachment$3;->onProgressUpdate(Ljava/lang/Integer;)V

    return-void
.end method
