.class Lcom/vkontakte/android/media/audio/AudioMessageUtils$StartRecordRunnable;
.super Ljava/lang/Object;
.source "AudioMessageUtils.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/media/audio/AudioMessageUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "StartRecordRunnable"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/media/audio/AudioMessageUtils;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/media/audio/AudioMessageUtils;)V
    .locals 0

    .prologue
    .line 332
    iput-object p1, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils$StartRecordRunnable;->this$0:Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/media/audio/AudioMessageUtils;Lcom/vkontakte/android/media/audio/AudioMessageUtils$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/media/audio/AudioMessageUtils;
    .param p2, "x1"    # Lcom/vkontakte/android/media/audio/AudioMessageUtils$1;

    .prologue
    .line 332
    invoke-direct {p0, p1}, Lcom/vkontakte/android/media/audio/AudioMessageUtils$StartRecordRunnable;-><init>(Lcom/vkontakte/android/media/audio/AudioMessageUtils;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 15

    .prologue
    const/4 v14, 0x0

    const/4 v13, 0x2

    const/4 v12, 0x1

    .line 336
    :try_start_0
    sget-object v8, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->CACHE_DIR:Ljava/io/File;

    .line 337
    .local v8, "outputFolder":Ljava/io/File;
    iget-object v0, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils$StartRecordRunnable;->this$0:Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    new-instance v1, Ljava/io/File;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "audio_message_"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    const-wide/16 v10, 0x3e8

    div-long/2addr v4, v10

    invoke-virtual {v2, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, ".ogg"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v8, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-static {v0, v1}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->access$302(Lcom/vkontakte/android/media/audio/AudioMessageUtils;Ljava/io/File;)Ljava/io/File;

    .line 338
    invoke-virtual {v8}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_0

    .line 339
    invoke-virtual {v8}, Ljava/io/File;->mkdirs()Z

    .line 342
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils$StartRecordRunnable;->this$0:Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    invoke-static {v0}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->access$300(Lcom/vkontakte/android/media/audio/AudioMessageUtils;)Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/vk/medianative/MediaNative;->nativeAudioStartRecord(Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_1

    .line 343
    iget-object v0, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils$StartRecordRunnable;->this$0:Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    invoke-static {v0}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->access$400(Lcom/vkontakte/android/media/audio/AudioMessageUtils;)V

    .line 344
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    const-string/jumbo v2, "AudioMessageUtils"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string/jumbo v2, "Audio record start native error"

    aput-object v2, v0, v1

    invoke-static {v0}, Lcom/vkontakte/android/utils/L;->e([Ljava/lang/Object;)V

    .line 370
    .end local v8    # "outputFolder":Ljava/io/File;
    :goto_0
    return-void

    .line 346
    .restart local v8    # "outputFolder":Ljava/io/File;
    :cond_1
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    const-string/jumbo v2, "AudioMessageUtils"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string/jumbo v2, "Audio record start"

    aput-object v2, v0, v1

    invoke-static {v0}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    .line 347
    iget-object v9, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils$StartRecordRunnable;->this$0:Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    new-instance v0, Landroid/media/AudioRecord;

    const/4 v1, 0x1

    const/16 v2, 0x3e80

    const/16 v3, 0x10

    const/4 v4, 0x2

    iget-object v5, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils$StartRecordRunnable;->this$0:Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    .line 348
    invoke-static {v5}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->access$600(Lcom/vkontakte/android/media/audio/AudioMessageUtils;)I

    move-result v5

    mul-int/lit8 v5, v5, 0xa

    invoke-direct/range {v0 .. v5}, Landroid/media/AudioRecord;-><init>(IIIII)V

    .line 347
    invoke-static {v9, v0}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->access$502(Lcom/vkontakte/android/media/audio/AudioMessageUtils;Landroid/media/AudioRecord;)Landroid/media/AudioRecord;

    .line 349
    iget-object v0, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils$StartRecordRunnable;->this$0:Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    const-wide/16 v2, 0x0

    invoke-static {v0, v2, v3}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->access$702(Lcom/vkontakte/android/media/audio/AudioMessageUtils;J)J

    .line 350
    iget-object v0, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils$StartRecordRunnable;->this$0:Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    const-wide/16 v2, 0x0

    invoke-static {v0, v2, v3}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->access$802(Lcom/vkontakte/android/media/audio/AudioMessageUtils;J)J

    .line 351
    iget-object v0, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils$StartRecordRunnable;->this$0:Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    invoke-static {v0}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->access$900(Lcom/vkontakte/android/media/audio/AudioMessageUtils;)Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 352
    iget-object v0, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils$StartRecordRunnable;->this$0:Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    invoke-static {v0}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->access$500(Lcom/vkontakte/android/media/audio/AudioMessageUtils;)Landroid/media/AudioRecord;

    move-result-object v0

    invoke-virtual {v0}, Landroid/media/AudioRecord;->startRecording()V

    .line 353
    iget-object v0, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils$StartRecordRunnable;->this$0:Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    invoke-static {v0}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->access$1100(Lcom/vkontakte/android/media/audio/AudioMessageUtils;)Lcom/vkontakte/android/utils/DispatchQueue;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils$StartRecordRunnable;->this$0:Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    invoke-static {v1}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->access$1000(Lcom/vkontakte/android/media/audio/AudioMessageUtils;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/utils/DispatchQueue;->postRunnable(Ljava/lang/Runnable;)V

    .line 354
    iget-object v0, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils$StartRecordRunnable;->this$0:Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    invoke-static {v0}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->access$1200(Lcom/vkontakte/android/media/audio/AudioMessageUtils;)V

    .line 355
    invoke-static {}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->access$1300()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 357
    .end local v8    # "outputFolder":Ljava/io/File;
    :catch_0
    move-exception v6

    .line 358
    .local v6, "e":Ljava/lang/Exception;
    new-array v0, v13, [Ljava/lang/Object;

    const-string/jumbo v1, "AudioMessageUtils"

    aput-object v1, v0, v14

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Audio record failure "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v6}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v12

    invoke-static {v0}, Lcom/vkontakte/android/utils/L;->e([Ljava/lang/Object;)V

    .line 359
    invoke-static {}, Lcom/vk/medianative/MediaNative;->nativeAudioStopRecord()V

    .line 360
    iget-object v0, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils$StartRecordRunnable;->this$0:Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    invoke-virtual {v0}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->deleteCurrentRecord()V

    .line 362
    :try_start_1
    iget-object v0, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils$StartRecordRunnable;->this$0:Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    invoke-static {v0}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->access$500(Lcom/vkontakte/android/media/audio/AudioMessageUtils;)Landroid/media/AudioRecord;

    move-result-object v0

    invoke-virtual {v0}, Landroid/media/AudioRecord;->release()V

    .line 363
    iget-object v0, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils$StartRecordRunnable;->this$0:Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->access$502(Lcom/vkontakte/android/media/audio/AudioMessageUtils;Landroid/media/AudioRecord;)Landroid/media/AudioRecord;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 367
    :goto_1
    iget-object v0, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils$StartRecordRunnable;->this$0:Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    invoke-static {v0}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->access$400(Lcom/vkontakte/android/media/audio/AudioMessageUtils;)V

    .line 368
    iget-object v0, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils$StartRecordRunnable;->this$0:Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    invoke-static {v0}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->access$1400(Lcom/vkontakte/android/media/audio/AudioMessageUtils;)V

    goto/16 :goto_0

    .line 364
    :catch_1
    move-exception v7

    .line 365
    .local v7, "e2":Ljava/lang/Exception;
    new-array v0, v13, [Ljava/lang/Object;

    const-string/jumbo v1, "AudioMessageUtils"

    aput-object v1, v0, v14

    invoke-virtual {v7}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v12

    invoke-static {v0}, Lcom/vkontakte/android/utils/L;->e([Ljava/lang/Object;)V

    goto :goto_1
.end method
