.class Lcom/vkontakte/android/AudioMessagePlayerService$2;
.super Ljava/lang/Object;
.source "AudioMessagePlayerService.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/AudioMessagePlayerService;->checkPlayerQueue()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/AudioMessagePlayerService;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/AudioMessagePlayerService;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/AudioMessagePlayerService;

    .prologue
    .line 350
    iput-object p1, p0, Lcom/vkontakte/android/AudioMessagePlayerService$2;->this$0:Lcom/vkontakte/android/AudioMessagePlayerService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 15

    .prologue
    const/4 v10, -0x1

    const/4 v14, 0x1

    .line 353
    iget-object v7, p0, Lcom/vkontakte/android/AudioMessagePlayerService$2;->this$0:Lcom/vkontakte/android/AudioMessagePlayerService;

    invoke-static {v7}, Lcom/vkontakte/android/AudioMessagePlayerService;->access$900(Lcom/vkontakte/android/AudioMessagePlayerService;)Ljava/lang/Object;

    move-result-object v11

    monitor-enter v11

    .line 354
    :try_start_0
    invoke-static {}, Lcom/vkontakte/android/AudioMessagePlayerService;->access$1000()Landroid/media/AudioTrack;

    move-result-object v7

    if-eqz v7, :cond_0

    invoke-static {}, Lcom/vkontakte/android/AudioMessagePlayerService;->access$1000()Landroid/media/AudioTrack;

    move-result-object v7

    invoke-virtual {v7}, Landroid/media/AudioTrack;->getPlayState()I

    move-result v7

    const/4 v12, 0x3

    if-eq v7, v12, :cond_2

    .line 355
    :cond_0
    monitor-exit v11

    .line 405
    :cond_1
    :goto_0
    return-void

    .line 357
    :cond_2
    monitor-exit v11
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 358
    const/4 v2, 0x0

    .line 359
    .local v2, "buffer":Lcom/vkontakte/android/AudioMessagePlayerService$AudioBuffer;
    iget-object v7, p0, Lcom/vkontakte/android/AudioMessagePlayerService$2;->this$0:Lcom/vkontakte/android/AudioMessagePlayerService;

    invoke-static {v7}, Lcom/vkontakte/android/AudioMessagePlayerService;->access$1100(Lcom/vkontakte/android/AudioMessagePlayerService;)Ljava/lang/Object;

    move-result-object v11

    monitor-enter v11

    .line 360
    :try_start_1
    iget-object v7, p0, Lcom/vkontakte/android/AudioMessagePlayerService$2;->this$0:Lcom/vkontakte/android/AudioMessagePlayerService;

    invoke-static {v7}, Lcom/vkontakte/android/AudioMessagePlayerService;->access$1200(Lcom/vkontakte/android/AudioMessagePlayerService;)Ljava/util/List;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/List;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_3

    .line 361
    iget-object v7, p0, Lcom/vkontakte/android/AudioMessagePlayerService$2;->this$0:Lcom/vkontakte/android/AudioMessagePlayerService;

    invoke-static {v7}, Lcom/vkontakte/android/AudioMessagePlayerService;->access$1200(Lcom/vkontakte/android/AudioMessagePlayerService;)Ljava/util/List;

    move-result-object v7

    const/4 v12, 0x0

    invoke-interface {v7, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    move-object v0, v7

    check-cast v0, Lcom/vkontakte/android/AudioMessagePlayerService$AudioBuffer;

    move-object v2, v0

    .line 362
    iget-object v7, p0, Lcom/vkontakte/android/AudioMessagePlayerService$2;->this$0:Lcom/vkontakte/android/AudioMessagePlayerService;

    invoke-static {v7}, Lcom/vkontakte/android/AudioMessagePlayerService;->access$1200(Lcom/vkontakte/android/AudioMessagePlayerService;)Ljava/util/List;

    move-result-object v7

    const/4 v12, 0x0

    invoke-interface {v7, v12}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 364
    :cond_3
    monitor-exit v11
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 366
    if-eqz v2, :cond_6

    .line 367
    const/4 v3, 0x0

    .line 369
    .local v3, "count":I
    :try_start_2
    invoke-static {}, Lcom/vkontakte/android/AudioMessagePlayerService;->access$1000()Landroid/media/AudioTrack;

    move-result-object v7

    iget-object v11, v2, Lcom/vkontakte/android/AudioMessagePlayerService$AudioBuffer;->bufferBytes:[B

    const/4 v12, 0x0

    iget v13, v2, Lcom/vkontakte/android/AudioMessagePlayerService$AudioBuffer;->size:I

    invoke-virtual {v7, v11, v12, v13}, Landroid/media/AudioTrack;->write([BII)I
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    move-result v3

    .line 373
    :goto_1
    iget-object v7, p0, Lcom/vkontakte/android/AudioMessagePlayerService$2;->this$0:Lcom/vkontakte/android/AudioMessagePlayerService;

    invoke-static {v7}, Lcom/vkontakte/android/AudioMessagePlayerService;->access$1308(Lcom/vkontakte/android/AudioMessagePlayerService;)I

    .line 375
    if-lez v3, :cond_5

    .line 376
    iget-wide v8, v2, Lcom/vkontakte/android/AudioMessagePlayerService$AudioBuffer;->pcmOffset:J

    .line 377
    .local v8, "pcm":J
    iget v7, v2, Lcom/vkontakte/android/AudioMessagePlayerService$AudioBuffer;->finished:I

    if-ne v7, v14, :cond_9

    move v6, v3

    .line 378
    .local v6, "marker":I
    :goto_2
    iget-object v7, p0, Lcom/vkontakte/android/AudioMessagePlayerService$2;->this$0:Lcom/vkontakte/android/AudioMessagePlayerService;

    invoke-static {v7}, Lcom/vkontakte/android/AudioMessagePlayerService;->access$1300(Lcom/vkontakte/android/AudioMessagePlayerService;)I

    move-result v5

    .line 379
    .local v5, "finalBuffersWrite":I
    iget-object v7, p0, Lcom/vkontakte/android/AudioMessagePlayerService$2;->this$0:Lcom/vkontakte/android/AudioMessagePlayerService;

    invoke-static {v7, v8, v9}, Lcom/vkontakte/android/AudioMessagePlayerService;->access$1402(Lcom/vkontakte/android/AudioMessagePlayerService;J)J

    .line 380
    if-eq v6, v10, :cond_5

    .line 381
    invoke-static {}, Lcom/vkontakte/android/AudioMessagePlayerService;->access$1000()Landroid/media/AudioTrack;

    move-result-object v7

    if-eqz v7, :cond_4

    .line 382
    invoke-static {}, Lcom/vkontakte/android/AudioMessagePlayerService;->access$1000()Landroid/media/AudioTrack;

    move-result-object v7

    invoke-virtual {v7, v14}, Landroid/media/AudioTrack;->setNotificationMarkerPosition(I)I

    .line 384
    :cond_4
    if-ne v5, v14, :cond_5

    .line 385
    iget-object v7, p0, Lcom/vkontakte/android/AudioMessagePlayerService$2;->this$0:Lcom/vkontakte/android/AudioMessagePlayerService;

    invoke-static {v7}, Lcom/vkontakte/android/AudioMessagePlayerService;->access$400(Lcom/vkontakte/android/AudioMessagePlayerService;)V

    .line 386
    iget-object v7, p0, Lcom/vkontakte/android/AudioMessagePlayerService$2;->this$0:Lcom/vkontakte/android/AudioMessagePlayerService;

    invoke-static {v7}, Lcom/vkontakte/android/AudioMessagePlayerService;->access$600(Lcom/vkontakte/android/AudioMessagePlayerService;)V

    .line 387
    iget-object v7, p0, Lcom/vkontakte/android/AudioMessagePlayerService$2;->this$0:Lcom/vkontakte/android/AudioMessagePlayerService;

    invoke-static {v7}, Lcom/vkontakte/android/AudioMessagePlayerService;->access$800(Lcom/vkontakte/android/AudioMessagePlayerService;)V

    .line 392
    .end local v5    # "finalBuffersWrite":I
    .end local v6    # "marker":I
    .end local v8    # "pcm":J
    :cond_5
    iget v7, v2, Lcom/vkontakte/android/AudioMessagePlayerService$AudioBuffer;->finished:I

    if-eq v7, v14, :cond_6

    .line 393
    iget-object v7, p0, Lcom/vkontakte/android/AudioMessagePlayerService$2;->this$0:Lcom/vkontakte/android/AudioMessagePlayerService;

    invoke-static {v7}, Lcom/vkontakte/android/AudioMessagePlayerService;->access$1500(Lcom/vkontakte/android/AudioMessagePlayerService;)V

    .line 396
    .end local v3    # "count":I
    :cond_6
    if-eqz v2, :cond_7

    iget v7, v2, Lcom/vkontakte/android/AudioMessagePlayerService$AudioBuffer;->finished:I

    if-eq v7, v14, :cond_8

    .line 397
    :cond_7
    iget-object v7, p0, Lcom/vkontakte/android/AudioMessagePlayerService$2;->this$0:Lcom/vkontakte/android/AudioMessagePlayerService;

    invoke-static {v7}, Lcom/vkontakte/android/AudioMessagePlayerService;->access$1600(Lcom/vkontakte/android/AudioMessagePlayerService;)V

    .line 400
    :cond_8
    if-eqz v2, :cond_1

    .line 401
    iget-object v7, p0, Lcom/vkontakte/android/AudioMessagePlayerService$2;->this$0:Lcom/vkontakte/android/AudioMessagePlayerService;

    invoke-static {v7}, Lcom/vkontakte/android/AudioMessagePlayerService;->access$1100(Lcom/vkontakte/android/AudioMessagePlayerService;)Ljava/lang/Object;

    move-result-object v10

    monitor-enter v10

    .line 402
    :try_start_3
    iget-object v7, p0, Lcom/vkontakte/android/AudioMessagePlayerService$2;->this$0:Lcom/vkontakte/android/AudioMessagePlayerService;

    invoke-static {v7}, Lcom/vkontakte/android/AudioMessagePlayerService;->access$1700(Lcom/vkontakte/android/AudioMessagePlayerService;)Ljava/util/List;

    move-result-object v7

    invoke-interface {v7, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 403
    monitor-exit v10

    goto/16 :goto_0

    :catchall_0
    move-exception v7

    monitor-exit v10
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v7

    .line 357
    .end local v2    # "buffer":Lcom/vkontakte/android/AudioMessagePlayerService$AudioBuffer;
    :catchall_1
    move-exception v7

    :try_start_4
    monitor-exit v11
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    throw v7

    .line 364
    .restart local v2    # "buffer":Lcom/vkontakte/android/AudioMessagePlayerService$AudioBuffer;
    :catchall_2
    move-exception v7

    :try_start_5
    monitor-exit v11
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    throw v7

    .line 370
    .restart local v3    # "count":I
    :catch_0
    move-exception v4

    .line 371
    .local v4, "e":Ljava/lang/Exception;
    const-string/jumbo v7, "AudioMessagePlayerService"

    const-string/jumbo v11, "Failure on write opus buffer"

    invoke-static {v7, v11, v4}, Lcom/vkontakte/android/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1

    .end local v4    # "e":Ljava/lang/Exception;
    .restart local v8    # "pcm":J
    :cond_9
    move v6, v10

    .line 377
    goto :goto_2
.end method
