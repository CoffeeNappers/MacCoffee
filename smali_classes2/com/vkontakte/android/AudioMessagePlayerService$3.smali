.class Lcom/vkontakte/android/AudioMessagePlayerService$3;
.super Ljava/lang/Object;
.source "AudioMessagePlayerService.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/AudioMessagePlayerService;->checkDecoderQueue()V
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
    .line 410
    iput-object p1, p0, Lcom/vkontakte/android/AudioMessagePlayerService$3;->this$0:Lcom/vkontakte/android/AudioMessagePlayerService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 10

    .prologue
    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 413
    iget-object v4, p0, Lcom/vkontakte/android/AudioMessagePlayerService$3;->this$0:Lcom/vkontakte/android/AudioMessagePlayerService;

    invoke-static {v4}, Lcom/vkontakte/android/AudioMessagePlayerService;->access$1800(Lcom/vkontakte/android/AudioMessagePlayerService;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 414
    iget-object v4, p0, Lcom/vkontakte/android/AudioMessagePlayerService$3;->this$0:Lcom/vkontakte/android/AudioMessagePlayerService;

    invoke-static {v4}, Lcom/vkontakte/android/AudioMessagePlayerService;->access$1500(Lcom/vkontakte/android/AudioMessagePlayerService;)V

    .line 457
    :cond_0
    :goto_0
    return-void

    .line 417
    :cond_1
    const/4 v3, 0x0

    .line 419
    .local v3, "was":Z
    :goto_1
    const/4 v2, 0x0

    .line 420
    .local v2, "buffer":Lcom/vkontakte/android/AudioMessagePlayerService$AudioBuffer;
    iget-object v4, p0, Lcom/vkontakte/android/AudioMessagePlayerService$3;->this$0:Lcom/vkontakte/android/AudioMessagePlayerService;

    invoke-static {v4}, Lcom/vkontakte/android/AudioMessagePlayerService;->access$1100(Lcom/vkontakte/android/AudioMessagePlayerService;)Ljava/lang/Object;

    move-result-object v5

    monitor-enter v5

    .line 421
    :try_start_0
    iget-object v4, p0, Lcom/vkontakte/android/AudioMessagePlayerService$3;->this$0:Lcom/vkontakte/android/AudioMessagePlayerService;

    invoke-static {v4}, Lcom/vkontakte/android/AudioMessagePlayerService;->access$1700(Lcom/vkontakte/android/AudioMessagePlayerService;)Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_2

    .line 422
    iget-object v4, p0, Lcom/vkontakte/android/AudioMessagePlayerService$3;->this$0:Lcom/vkontakte/android/AudioMessagePlayerService;

    invoke-static {v4}, Lcom/vkontakte/android/AudioMessagePlayerService;->access$1700(Lcom/vkontakte/android/AudioMessagePlayerService;)Ljava/util/List;

    move-result-object v4

    const/4 v6, 0x0

    invoke-interface {v4, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    move-object v0, v4

    check-cast v0, Lcom/vkontakte/android/AudioMessagePlayerService$AudioBuffer;

    move-object v2, v0

    .line 423
    iget-object v4, p0, Lcom/vkontakte/android/AudioMessagePlayerService$3;->this$0:Lcom/vkontakte/android/AudioMessagePlayerService;

    invoke-static {v4}, Lcom/vkontakte/android/AudioMessagePlayerService;->access$1700(Lcom/vkontakte/android/AudioMessagePlayerService;)Ljava/util/List;

    move-result-object v4

    const/4 v6, 0x0

    invoke-interface {v4, v6}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 425
    :cond_2
    iget-object v4, p0, Lcom/vkontakte/android/AudioMessagePlayerService$3;->this$0:Lcom/vkontakte/android/AudioMessagePlayerService;

    invoke-static {v4}, Lcom/vkontakte/android/AudioMessagePlayerService;->access$1200(Lcom/vkontakte/android/AudioMessagePlayerService;)Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_3

    .line 426
    const/4 v3, 0x1

    .line 428
    :cond_3
    monitor-exit v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 429
    if-eqz v2, :cond_6

    .line 430
    iget-object v4, p0, Lcom/vkontakte/android/AudioMessagePlayerService$3;->this$0:Lcom/vkontakte/android/AudioMessagePlayerService;

    invoke-static {v4}, Lcom/vkontakte/android/AudioMessagePlayerService;->access$2100(Lcom/vkontakte/android/AudioMessagePlayerService;)Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    move-result-object v4

    iget-object v5, v2, Lcom/vkontakte/android/AudioMessagePlayerService$AudioBuffer;->buffer:Ljava/nio/ByteBuffer;

    iget-object v6, p0, Lcom/vkontakte/android/AudioMessagePlayerService$3;->this$0:Lcom/vkontakte/android/AudioMessagePlayerService;

    invoke-static {v6}, Lcom/vkontakte/android/AudioMessagePlayerService;->access$1900(Lcom/vkontakte/android/AudioMessagePlayerService;)I

    move-result v6

    invoke-static {}, Lcom/vkontakte/android/AudioMessagePlayerService;->access$2000()[I

    move-result-object v7

    invoke-virtual {v4, v5, v6, v7}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->readOpusFile(Ljava/nio/ByteBuffer;I[I)V

    .line 431
    invoke-static {}, Lcom/vkontakte/android/AudioMessagePlayerService;->access$2000()[I

    move-result-object v4

    aget v4, v4, v8

    iput v4, v2, Lcom/vkontakte/android/AudioMessagePlayerService$AudioBuffer;->size:I

    .line 432
    invoke-static {}, Lcom/vkontakte/android/AudioMessagePlayerService;->access$2000()[I

    move-result-object v4

    aget v4, v4, v9

    int-to-long v4, v4

    iput-wide v4, v2, Lcom/vkontakte/android/AudioMessagePlayerService$AudioBuffer;->pcmOffset:J

    .line 433
    invoke-static {}, Lcom/vkontakte/android/AudioMessagePlayerService;->access$2000()[I

    move-result-object v4

    const/4 v5, 0x2

    aget v4, v4, v5

    iput v4, v2, Lcom/vkontakte/android/AudioMessagePlayerService$AudioBuffer;->finished:I

    .line 434
    iget v4, v2, Lcom/vkontakte/android/AudioMessagePlayerService$AudioBuffer;->finished:I

    if-ne v4, v9, :cond_4

    .line 435
    iget-object v4, p0, Lcom/vkontakte/android/AudioMessagePlayerService$3;->this$0:Lcom/vkontakte/android/AudioMessagePlayerService;

    invoke-static {v4, v9}, Lcom/vkontakte/android/AudioMessagePlayerService;->access$1802(Lcom/vkontakte/android/AudioMessagePlayerService;Z)Z

    .line 437
    :cond_4
    iget v4, v2, Lcom/vkontakte/android/AudioMessagePlayerService$AudioBuffer;->size:I

    if-eqz v4, :cond_5

    .line 438
    iget-object v4, v2, Lcom/vkontakte/android/AudioMessagePlayerService$AudioBuffer;->buffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 439
    iget-object v4, v2, Lcom/vkontakte/android/AudioMessagePlayerService$AudioBuffer;->buffer:Ljava/nio/ByteBuffer;

    iget-object v5, v2, Lcom/vkontakte/android/AudioMessagePlayerService$AudioBuffer;->bufferBytes:[B

    invoke-virtual {v4, v5}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 440
    iget-object v4, p0, Lcom/vkontakte/android/AudioMessagePlayerService$3;->this$0:Lcom/vkontakte/android/AudioMessagePlayerService;

    invoke-static {v4}, Lcom/vkontakte/android/AudioMessagePlayerService;->access$1100(Lcom/vkontakte/android/AudioMessagePlayerService;)Ljava/lang/Object;

    move-result-object v5

    monitor-enter v5

    .line 441
    :try_start_1
    iget-object v4, p0, Lcom/vkontakte/android/AudioMessagePlayerService$3;->this$0:Lcom/vkontakte/android/AudioMessagePlayerService;

    invoke-static {v4}, Lcom/vkontakte/android/AudioMessagePlayerService;->access$1200(Lcom/vkontakte/android/AudioMessagePlayerService;)Ljava/util/List;

    move-result-object v4

    invoke-interface {v4, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 442
    monitor-exit v5
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 449
    const/4 v3, 0x1

    .line 453
    goto/16 :goto_1

    .line 428
    :catchall_0
    move-exception v4

    :try_start_2
    monitor-exit v5
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v4

    .line 442
    :catchall_1
    move-exception v4

    :try_start_3
    monitor-exit v5
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    throw v4

    .line 444
    :cond_5
    iget-object v4, p0, Lcom/vkontakte/android/AudioMessagePlayerService$3;->this$0:Lcom/vkontakte/android/AudioMessagePlayerService;

    invoke-static {v4}, Lcom/vkontakte/android/AudioMessagePlayerService;->access$1100(Lcom/vkontakte/android/AudioMessagePlayerService;)Ljava/lang/Object;

    move-result-object v5

    monitor-enter v5

    .line 445
    :try_start_4
    iget-object v4, p0, Lcom/vkontakte/android/AudioMessagePlayerService$3;->this$0:Lcom/vkontakte/android/AudioMessagePlayerService;

    invoke-static {v4}, Lcom/vkontakte/android/AudioMessagePlayerService;->access$1700(Lcom/vkontakte/android/AudioMessagePlayerService;)Ljava/util/List;

    move-result-object v4

    invoke-interface {v4, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 446
    monitor-exit v5
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 454
    :cond_6
    if-eqz v3, :cond_0

    .line 455
    iget-object v4, p0, Lcom/vkontakte/android/AudioMessagePlayerService$3;->this$0:Lcom/vkontakte/android/AudioMessagePlayerService;

    invoke-static {v4}, Lcom/vkontakte/android/AudioMessagePlayerService;->access$1500(Lcom/vkontakte/android/AudioMessagePlayerService;)V

    goto/16 :goto_0

    .line 447
    :catchall_2
    move-exception v4

    :try_start_5
    monitor-exit v5
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    throw v4
.end method
