.class Lcom/vkontakte/android/media/audio/AudioMessageUtils$RecordingRunnable;
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
    name = "RecordingRunnable"
.end annotation


# instance fields
.field private lastUpdate:J

.field final synthetic this$0:Lcom/vkontakte/android/media/audio/AudioMessageUtils;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/media/audio/AudioMessageUtils;)V
    .locals 0

    .prologue
    .line 373
    iput-object p1, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils$RecordingRunnable;->this$0:Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/media/audio/AudioMessageUtils;Lcom/vkontakte/android/media/audio/AudioMessageUtils$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/media/audio/AudioMessageUtils;
    .param p2, "x1"    # Lcom/vkontakte/android/media/audio/AudioMessageUtils$1;

    .prologue
    .line 373
    invoke-direct {p0, p1}, Lcom/vkontakte/android/media/audio/AudioMessageUtils$RecordingRunnable;-><init>(Lcom/vkontakte/android/media/audio/AudioMessageUtils;)V

    return-void
.end method

.method private encode(Ljava/nio/ByteBuffer;Z)V
    .locals 2
    .param p1, "finalBuffer"    # Ljava/nio/ByteBuffer;
    .param p2, "flush"    # Z

    .prologue
    .line 451
    iget-object v0, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils$RecordingRunnable;->this$0:Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    invoke-static {v0}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->access$2100(Lcom/vkontakte/android/media/audio/AudioMessageUtils;)Lcom/vkontakte/android/utils/DispatchQueue;

    move-result-object v0

    invoke-static {p0, p1, p2}, Lcom/vkontakte/android/media/audio/AudioMessageUtils$RecordingRunnable$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/media/audio/AudioMessageUtils$RecordingRunnable;Ljava/nio/ByteBuffer;Z)Ljava/lang/Runnable;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/utils/DispatchQueue;->postRunnable(Ljava/lang/Runnable;)V

    .line 471
    return-void
.end method


# virtual methods
.method synthetic lambda$encode$1(Ljava/nio/ByteBuffer;Z)V
    .locals 6
    .param p1, "finalBuffer"    # Ljava/nio/ByteBuffer;
    .param p2, "flush"    # Z

    .prologue
    .line 452
    :cond_0
    :goto_0
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v1

    if-eqz v1, :cond_5

    .line 453
    const/4 v0, -0x1

    .line 454
    .local v0, "bufferLimit":I
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v1

    iget-object v2, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils$RecordingRunnable;->this$0:Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    invoke-static {v2}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->access$900(Lcom/vkontakte/android/media/audio/AudioMessageUtils;)Ljava/nio/ByteBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v2

    if-le v1, v2, :cond_1

    .line 455
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->limit()I

    move-result v0

    .line 456
    iget-object v1, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils$RecordingRunnable;->this$0:Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    invoke-static {v1}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->access$900(Lcom/vkontakte/android/media/audio/AudioMessageUtils;)Ljava/nio/ByteBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v1

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->position()I

    move-result v2

    add-int/2addr v1, v2

    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 458
    :cond_1
    iget-object v1, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils$RecordingRunnable;->this$0:Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    invoke-static {v1}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->access$900(Lcom/vkontakte/android/media/audio/AudioMessageUtils;)Ljava/nio/ByteBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 459
    iget-object v1, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils$RecordingRunnable;->this$0:Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    invoke-static {v1}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->access$900(Lcom/vkontakte/android/media/audio/AudioMessageUtils;)Ljava/nio/ByteBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->position()I

    move-result v1

    iget-object v2, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils$RecordingRunnable;->this$0:Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    invoke-static {v2}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->access$900(Lcom/vkontakte/android/media/audio/AudioMessageUtils;)Ljava/nio/ByteBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->limit()I

    move-result v2

    if-eq v1, v2, :cond_2

    if-eqz p2, :cond_3

    .line 460
    :cond_2
    iget-object v1, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils$RecordingRunnable;->this$0:Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    invoke-static {v1}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->access$900(Lcom/vkontakte/android/media/audio/AudioMessageUtils;)Ljava/nio/ByteBuffer;

    move-result-object v2

    if-eqz p2, :cond_4

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->position()I

    move-result v1

    :goto_1
    invoke-static {v2, v1}, Lcom/vk/medianative/MediaNative;->nativeAudioWriteFrame(Ljava/nio/ByteBuffer;I)I

    move-result v1

    if-eqz v1, :cond_3

    .line 461
    iget-object v1, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils$RecordingRunnable;->this$0:Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    invoke-static {v1}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->access$900(Lcom/vkontakte/android/media/audio/AudioMessageUtils;)Ljava/nio/ByteBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 462
    iget-object v1, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils$RecordingRunnable;->this$0:Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    iget-object v2, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils$RecordingRunnable;->this$0:Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    invoke-static {v2}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->access$800(Lcom/vkontakte/android/media/audio/AudioMessageUtils;)J

    move-result-wide v2

    iget-object v4, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils$RecordingRunnable;->this$0:Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    invoke-static {v4}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->access$900(Lcom/vkontakte/android/media/audio/AudioMessageUtils;)Ljava/nio/ByteBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->limit()I

    move-result v4

    div-int/lit8 v4, v4, 0x2

    div-int/lit8 v4, v4, 0x10

    int-to-long v4, v4

    add-long/2addr v2, v4

    invoke-static {v1, v2, v3}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->access$802(Lcom/vkontakte/android/media/audio/AudioMessageUtils;J)J

    .line 465
    :cond_3
    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    .line 466
    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    goto/16 :goto_0

    .line 460
    :cond_4
    iget-object v1, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils$RecordingRunnable;->this$0:Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    invoke-static {v1}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->access$900(Lcom/vkontakte/android/media/audio/AudioMessageUtils;)Ljava/nio/ByteBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->limit()I

    move-result v1

    goto :goto_1

    .line 469
    .end local v0    # "bufferLimit":I
    :cond_5
    iget-object v1, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils$RecordingRunnable;->this$0:Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    invoke-static {v1}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->access$1100(Lcom/vkontakte/android/media/audio/AudioMessageUtils;)Lcom/vkontakte/android/utils/DispatchQueue;

    move-result-object v1

    invoke-static {p0, p1}, Lcom/vkontakte/android/media/audio/AudioMessageUtils$RecordingRunnable$$Lambda$2;->lambdaFactory$(Lcom/vkontakte/android/media/audio/AudioMessageUtils$RecordingRunnable;Ljava/nio/ByteBuffer;)Ljava/lang/Runnable;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/utils/DispatchQueue;->postRunnable(Ljava/lang/Runnable;)V

    .line 470
    return-void
.end method

.method synthetic lambda$null$0(Ljava/nio/ByteBuffer;)V
    .locals 1
    .param p1, "finalBuffer"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 469
    iget-object v0, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils$RecordingRunnable;->this$0:Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    invoke-static {v0}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->access$1500(Lcom/vkontakte/android/media/audio/AudioMessageUtils;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public run()V
    .locals 32

    .prologue
    .line 378
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/media/audio/AudioMessageUtils$RecordingRunnable;->this$0:Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    move-object/from16 v25, v0

    invoke-static/range {v25 .. v25}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->access$500(Lcom/vkontakte/android/media/audio/AudioMessageUtils;)Landroid/media/AudioRecord;

    move-result-object v25

    if-eqz v25, :cond_6

    .line 380
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/media/audio/AudioMessageUtils$RecordingRunnable;->this$0:Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    move-object/from16 v25, v0

    invoke-static/range {v25 .. v25}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->access$1500(Lcom/vkontakte/android/media/audio/AudioMessageUtils;)Ljava/util/List;

    move-result-object v25

    invoke-interface/range {v25 .. v25}, Ljava/util/List;->isEmpty()Z

    move-result v25

    if-eqz v25, :cond_0

    .line 381
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/media/audio/AudioMessageUtils$RecordingRunnable;->this$0:Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    move-object/from16 v25, v0

    invoke-static/range {v25 .. v25}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->access$600(Lcom/vkontakte/android/media/audio/AudioMessageUtils;)I

    move-result v25

    invoke-static/range {v25 .. v25}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v5

    .line 382
    .local v5, "buffer":Ljava/nio/ByteBuffer;
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v25

    move-object/from16 v0, v25

    invoke-virtual {v5, v0}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 387
    :goto_0
    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 388
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/media/audio/AudioMessageUtils$RecordingRunnable;->this$0:Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    move-object/from16 v25, v0

    invoke-static/range {v25 .. v25}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->access$500(Lcom/vkontakte/android/media/audio/AudioMessageUtils;)Landroid/media/AudioRecord;

    move-result-object v25

    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v28

    move-object/from16 v0, v25

    move/from16 v1, v28

    invoke-virtual {v0, v5, v1}, Landroid/media/AudioRecord;->read(Ljava/nio/ByteBuffer;I)I

    move-result v18

    .line 389
    .local v18, "len":I
    if-lez v18, :cond_8

    .line 390
    move/from16 v0, v18

    invoke-virtual {v5, v0}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 391
    const-wide/16 v26, 0x0

    .line 393
    .local v26, "sum":D
    :try_start_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/media/audio/AudioMessageUtils$RecordingRunnable;->this$0:Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    move-object/from16 v25, v0

    invoke-static/range {v25 .. v25}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->access$700(Lcom/vkontakte/android/media/audio/AudioMessageUtils;)J

    move-result-wide v28

    div-int/lit8 v25, v18, 0x2

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v30, v0

    add-long v20, v28, v30

    .line 394
    .local v20, "newSamplesCount":J
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/media/audio/AudioMessageUtils$RecordingRunnable;->this$0:Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    move-object/from16 v25, v0

    invoke-static/range {v25 .. v25}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->access$700(Lcom/vkontakte/android/media/audio/AudioMessageUtils;)J

    move-result-wide v28

    move-wide/from16 v0, v28

    long-to-double v0, v0

    move-wide/from16 v28, v0

    move-wide/from16 v0, v20

    long-to-double v0, v0

    move-wide/from16 v30, v0

    div-double v28, v28, v30

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/media/audio/AudioMessageUtils$RecordingRunnable;->this$0:Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    move-object/from16 v25, v0

    invoke-static/range {v25 .. v25}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->access$1600(Lcom/vkontakte/android/media/audio/AudioMessageUtils;)[S

    move-result-object v25

    move-object/from16 v0, v25

    array-length v0, v0

    move/from16 v25, v0

    move/from16 v0, v25

    int-to-double v0, v0

    move-wide/from16 v30, v0

    mul-double v28, v28, v30

    move-wide/from16 v0, v28

    double-to-int v11, v0

    .line 395
    .local v11, "currentPart":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/media/audio/AudioMessageUtils$RecordingRunnable;->this$0:Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    move-object/from16 v25, v0

    invoke-static/range {v25 .. v25}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->access$1600(Lcom/vkontakte/android/media/audio/AudioMessageUtils;)[S

    move-result-object v25

    move-object/from16 v0, v25

    array-length v0, v0

    move/from16 v25, v0

    sub-int v19, v25, v11

    .line 397
    .local v19, "newPart":I
    if-eqz v11, :cond_1

    .line 398
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/media/audio/AudioMessageUtils$RecordingRunnable;->this$0:Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    move-object/from16 v25, v0

    invoke-static/range {v25 .. v25}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->access$1600(Lcom/vkontakte/android/media/audio/AudioMessageUtils;)[S

    move-result-object v25

    move-object/from16 v0, v25

    array-length v0, v0

    move/from16 v25, v0

    move/from16 v0, v25

    int-to-float v0, v0

    move/from16 v25, v0

    int-to-float v0, v11

    move/from16 v28, v0

    div-float v24, v25, v28

    .line 399
    .local v24, "sampleStep":F
    const/4 v10, 0x0

    .line 400
    .local v10, "currentNum":F
    const/4 v4, 0x0

    .local v4, "a":I
    :goto_1
    if-ge v4, v11, :cond_1

    .line 401
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/media/audio/AudioMessageUtils$RecordingRunnable;->this$0:Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    move-object/from16 v25, v0

    invoke-static/range {v25 .. v25}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->access$1600(Lcom/vkontakte/android/media/audio/AudioMessageUtils;)[S

    move-result-object v25

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/media/audio/AudioMessageUtils$RecordingRunnable;->this$0:Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    move-object/from16 v28, v0

    invoke-static/range {v28 .. v28}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->access$1600(Lcom/vkontakte/android/media/audio/AudioMessageUtils;)[S

    move-result-object v28

    float-to-int v0, v10

    move/from16 v29, v0

    aget-short v28, v28, v29

    aput-short v28, v25, v4
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 402
    add-float v10, v10, v24

    .line 400
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 384
    .end local v4    # "a":I
    .end local v5    # "buffer":Ljava/nio/ByteBuffer;
    .end local v10    # "currentNum":F
    .end local v11    # "currentPart":I
    .end local v18    # "len":I
    .end local v19    # "newPart":I
    .end local v20    # "newSamplesCount":J
    .end local v24    # "sampleStep":F
    .end local v26    # "sum":D
    :cond_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/media/audio/AudioMessageUtils$RecordingRunnable;->this$0:Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    move-object/from16 v25, v0

    invoke-static/range {v25 .. v25}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->access$1500(Lcom/vkontakte/android/media/audio/AudioMessageUtils;)Ljava/util/List;

    move-result-object v25

    const/16 v28, 0x0

    move-object/from16 v0, v25

    move/from16 v1, v28

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/nio/ByteBuffer;

    .line 385
    .restart local v5    # "buffer":Ljava/nio/ByteBuffer;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/media/audio/AudioMessageUtils$RecordingRunnable;->this$0:Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    move-object/from16 v25, v0

    invoke-static/range {v25 .. v25}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->access$1500(Lcom/vkontakte/android/media/audio/AudioMessageUtils;)Ljava/util/List;

    move-result-object v25

    const/16 v28, 0x0

    move-object/from16 v0, v25

    move/from16 v1, v28

    invoke-interface {v0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    goto/16 :goto_0

    .line 405
    .restart local v11    # "currentPart":I
    .restart local v18    # "len":I
    .restart local v19    # "newPart":I
    .restart local v20    # "newSamplesCount":J
    .restart local v26    # "sum":D
    :cond_1
    move v10, v11

    .line 406
    .local v10, "currentNum":I
    const/16 v22, 0x0

    .line 407
    .local v22, "nextNum":F
    move/from16 v0, v18

    int-to-float v0, v0

    move/from16 v25, v0

    const/high16 v28, 0x40000000    # 2.0f

    div-float v25, v25, v28

    move/from16 v0, v19

    int-to-float v0, v0

    move/from16 v28, v0

    div-float v24, v25, v28

    .line 408
    .restart local v24    # "sampleStep":F
    const/16 v16, 0x0

    .local v16, "i":I
    :goto_2
    :try_start_1
    div-int/lit8 v25, v18, 0x2

    move/from16 v0, v16

    move/from16 v1, v25

    if-ge v0, v1, :cond_3

    .line 409
    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v23

    .line 410
    .local v23, "peak":S
    mul-int v25, v23, v23

    move/from16 v0, v25

    int-to-double v0, v0

    move-wide/from16 v28, v0

    add-double v26, v26, v28

    .line 412
    move/from16 v0, v22

    float-to-int v0, v0

    move/from16 v25, v0

    move/from16 v0, v16

    move/from16 v1, v25

    if-ne v0, v1, :cond_2

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/media/audio/AudioMessageUtils$RecordingRunnable;->this$0:Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    move-object/from16 v25, v0

    invoke-static/range {v25 .. v25}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->access$1600(Lcom/vkontakte/android/media/audio/AudioMessageUtils;)[S

    move-result-object v25

    move-object/from16 v0, v25

    array-length v0, v0

    move/from16 v25, v0

    move/from16 v0, v25

    if-ge v10, v0, :cond_2

    .line 413
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/media/audio/AudioMessageUtils$RecordingRunnable;->this$0:Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    move-object/from16 v25, v0

    invoke-static/range {v25 .. v25}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->access$1600(Lcom/vkontakte/android/media/audio/AudioMessageUtils;)[S

    move-result-object v25

    aput-short v23, v25, v10

    .line 414
    add-float v22, v22, v24

    .line 415
    add-int/lit8 v10, v10, 0x1

    .line 408
    :cond_2
    add-int/lit8 v16, v16, 0x1

    goto :goto_2

    .line 418
    .end local v23    # "peak":S
    :cond_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/media/audio/AudioMessageUtils$RecordingRunnable;->this$0:Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    move-wide/from16 v1, v20

    invoke-static {v0, v1, v2}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->access$702(Lcom/vkontakte/android/media/audio/AudioMessageUtils;J)J
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 422
    .end local v10    # "currentNum":I
    .end local v11    # "currentPart":I
    .end local v16    # "i":I
    .end local v19    # "newPart":I
    .end local v20    # "newSamplesCount":J
    .end local v22    # "nextNum":F
    .end local v24    # "sampleStep":F
    :goto_3
    const/16 v25, 0x0

    move/from16 v0, v25

    invoke-virtual {v5, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 423
    move/from16 v0, v18

    int-to-double v0, v0

    move-wide/from16 v28, v0

    div-double v28, v26, v28

    const-wide/high16 v30, 0x4000000000000000L    # 2.0

    div-double v28, v28, v30

    invoke-static/range {v28 .. v29}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v8

    .line 424
    .local v8, "amplitude":D
    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v25

    move/from16 v0, v18

    move/from16 v1, v25

    if-eq v0, v1, :cond_7

    const/4 v15, 0x1

    .line 425
    .local v15, "flush":Z
    :goto_4
    move-object/from16 v0, p0

    invoke-direct {v0, v5, v15}, Lcom/vkontakte/android/media/audio/AudioMessageUtils$RecordingRunnable;->encode(Ljava/nio/ByteBuffer;Z)V

    .line 427
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/media/audio/AudioMessageUtils$RecordingRunnable;->this$0:Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    move-object/from16 v25, v0

    invoke-static/range {v25 .. v25}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->access$1100(Lcom/vkontakte/android/media/audio/AudioMessageUtils;)Lcom/vkontakte/android/utils/DispatchQueue;

    move-result-object v25

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/media/audio/AudioMessageUtils$RecordingRunnable;->this$0:Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    move-object/from16 v28, v0

    invoke-static/range {v28 .. v28}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->access$1000(Lcom/vkontakte/android/media/audio/AudioMessageUtils;)Ljava/lang/Runnable;

    move-result-object v28

    move-object/from16 v0, v25

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/utils/DispatchQueue;->postRunnable(Ljava/lang/Runnable;)V

    .line 429
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v12

    .line 430
    .local v12, "currentTime":J
    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/vkontakte/android/media/audio/AudioMessageUtils$RecordingRunnable;->lastUpdate:J

    move-wide/from16 v28, v0

    sub-long v28, v12, v28

    const-wide/16 v30, 0x11

    cmp-long v25, v28, v30

    if-ltz v25, :cond_5

    .line 431
    move-object/from16 v0, p0

    iput-wide v12, v0, Lcom/vkontakte/android/media/audio/AudioMessageUtils$RecordingRunnable;->lastUpdate:J

    .line 432
    new-instance v17, Landroid/content/Intent;

    invoke-direct/range {v17 .. v17}, Landroid/content/Intent;-><init>()V

    .line 433
    .local v17, "intent":Landroid/content/Intent;
    const-string/jumbo v25, "peerId"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/media/audio/AudioMessageUtils$RecordingRunnable;->this$0:Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    move-object/from16 v28, v0

    invoke-static/range {v28 .. v28}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->access$1700(Lcom/vkontakte/android/media/audio/AudioMessageUtils;)Ljava/lang/String;

    move-result-object v28

    move-object/from16 v0, v17

    move-object/from16 v1, v25

    move-object/from16 v2, v28

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 434
    const-string/jumbo v25, "duration"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/media/audio/AudioMessageUtils$RecordingRunnable;->this$0:Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    move-object/from16 v28, v0

    invoke-static/range {v28 .. v28}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->access$800(Lcom/vkontakte/android/media/audio/AudioMessageUtils;)J

    move-result-wide v28

    const-wide/16 v30, 0x3e8

    div-long v28, v28, v30

    move-wide/from16 v0, v28

    long-to-int v0, v0

    move/from16 v28, v0

    move-object/from16 v0, v17

    move-object/from16 v1, v25

    move/from16 v2, v28

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 435
    invoke-static {v8, v9}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->access$1800(D)D

    move-result-wide v6

    .line 436
    .local v6, "ampDb":D
    const-string/jumbo v25, "amplitude"

    sget-wide v28, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->SILENCE_VALUE:D

    cmpg-double v28, v6, v28

    if-gez v28, :cond_4

    sget-wide v6, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->SILENCE_VALUE:D

    .end local v6    # "ampDb":D
    :cond_4
    move-object/from16 v0, v17

    move-object/from16 v1, v25

    invoke-virtual {v0, v1, v6, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;D)Landroid/content/Intent;

    .line 437
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/media/audio/AudioMessageUtils$RecordingRunnable;->this$0:Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    move-object/from16 v25, v0

    const-string/jumbo v28, "com.vkontakte.android.AUDIO_MESSAGE_UPDATE"

    move-object/from16 v0, v25

    move-object/from16 v1, v28

    move-object/from16 v2, v17

    invoke-static {v0, v1, v2}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->access$1900(Lcom/vkontakte/android/media/audio/AudioMessageUtils;Ljava/lang/String;Landroid/content/Intent;)V

    .line 440
    .end local v17    # "intent":Landroid/content/Intent;
    :cond_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/media/audio/AudioMessageUtils$RecordingRunnable;->this$0:Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    move-object/from16 v25, v0

    invoke-static/range {v25 .. v25}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->access$800(Lcom/vkontakte/android/media/audio/AudioMessageUtils;)J

    move-result-wide v28

    const-wide/32 v30, 0x493e0

    cmp-long v25, v28, v30

    if-ltz v25, :cond_6

    .line 441
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/media/audio/AudioMessageUtils$RecordingRunnable;->this$0:Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    move-object/from16 v25, v0

    invoke-virtual/range {v25 .. v25}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->stopRecording()V

    .line 448
    .end local v5    # "buffer":Ljava/nio/ByteBuffer;
    .end local v8    # "amplitude":D
    .end local v12    # "currentTime":J
    .end local v15    # "flush":Z
    .end local v18    # "len":I
    .end local v26    # "sum":D
    :cond_6
    :goto_5
    return-void

    .line 419
    .restart local v5    # "buffer":Ljava/nio/ByteBuffer;
    .restart local v18    # "len":I
    .restart local v26    # "sum":D
    :catch_0
    move-exception v14

    .line 420
    .local v14, "e":Ljava/lang/Exception;
    const/16 v25, 0x3

    move/from16 v0, v25

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v25, v0

    const/16 v28, 0x0

    const-string/jumbo v29, "AudioMessageUtils"

    aput-object v29, v25, v28

    const/16 v28, 0x1

    const-string/jumbo v29, "Audio record failure"

    aput-object v29, v25, v28

    const/16 v28, 0x2

    aput-object v14, v25, v28

    invoke-static/range {v25 .. v25}, Lcom/vkontakte/android/utils/L;->e([Ljava/lang/Object;)V

    goto/16 :goto_3

    .line 424
    .end local v14    # "e":Ljava/lang/Exception;
    .restart local v8    # "amplitude":D
    :cond_7
    const/4 v15, 0x0

    goto/16 :goto_4

    .line 444
    .end local v8    # "amplitude":D
    .end local v26    # "sum":D
    :cond_8
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/media/audio/AudioMessageUtils$RecordingRunnable;->this$0:Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    move-object/from16 v25, v0

    invoke-static/range {v25 .. v25}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->access$1500(Lcom/vkontakte/android/media/audio/AudioMessageUtils;)Ljava/util/List;

    move-result-object v25

    move-object/from16 v0, v25

    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 445
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/media/audio/AudioMessageUtils$RecordingRunnable;->this$0:Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    move-object/from16 v25, v0

    const/16 v28, 0x0

    const/16 v29, 0x1

    move-object/from16 v0, v25

    move/from16 v1, v28

    move/from16 v2, v29

    invoke-static {v0, v1, v2}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->access$2000(Lcom/vkontakte/android/media/audio/AudioMessageUtils;IZ)V

    goto :goto_5
.end method
