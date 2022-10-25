.class Lcom/vkontakte/android/ui/GifView$AnimationRunner;
.super Ljava/lang/Object;
.source "GifView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/ui/GifView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "AnimationRunner"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/ui/GifView;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/ui/GifView;)V
    .locals 0

    .prologue
    .line 228
    iput-object p1, p0, Lcom/vkontakte/android/ui/GifView$AnimationRunner;->this$0:Lcom/vkontakte/android/ui/GifView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/ui/GifView;Lcom/vkontakte/android/ui/GifView$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/ui/GifView;
    .param p2, "x1"    # Lcom/vkontakte/android/ui/GifView$1;

    .prologue
    .line 228
    invoke-direct {p0, p1}, Lcom/vkontakte/android/ui/GifView$AnimationRunner;-><init>(Lcom/vkontakte/android/ui/GifView;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 55

    .prologue
    .line 231
    const/16 v4, 0x2b

    :try_start_0
    new-array v0, v4, [B

    move-object/from16 v48, v0

    fill-array-data v48, :array_0

    .line 232
    .local v48, "transpGif":[B
    const/4 v4, 0x0

    move-object/from16 v0, v48

    array-length v6, v0

    move-object/from16 v0, v48

    invoke-static {v0, v4, v6}, Landroid/graphics/BitmapFactory;->decodeByteArray([BII)Landroid/graphics/Bitmap;

    move-result-object v50

    .line 233
    .local v50, "transpTest":Landroid/graphics/Bitmap;
    const/4 v4, 0x0

    const/4 v6, 0x0

    move-object/from16 v0, v50

    invoke-virtual {v0, v4, v6}, Landroid/graphics/Bitmap;->getPixel(II)I

    move-result v4

    const/high16 v6, -0x1000000

    and-int/2addr v4, v6

    if-eqz v4, :cond_3

    const/16 v51, 0x1

    .line 234
    .local v51, "useAlphaHack":Z
    :goto_0
    if-eqz v51, :cond_0

    .line 235
    const-string/jumbo v4, "vk"

    const-string/jumbo v6, "Enabling gif alpha hack - Google, please fix this ASAP!"

    invoke-static {v4, v6}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 237
    :cond_0
    :goto_1
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/ui/GifView$AnimationRunner;->this$0:Lcom/vkontakte/android/ui/GifView;

    invoke-static {v4}, Lcom/vkontakte/android/ui/GifView;->access$700(Lcom/vkontakte/android/ui/GifView;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 238
    const-wide/16 v38, 0x0

    .local v38, "nextDelay":J
    const-wide/16 v44, 0x0

    .line 239
    .local v44, "t":J
    new-instance v20, Landroid/graphics/Paint;

    invoke-direct/range {v20 .. v20}, Landroid/graphics/Paint;-><init>()V

    .line 240
    .local v20, "clearPaint":Landroid/graphics/Paint;
    const/4 v4, -0x1

    move-object/from16 v0, v20

    invoke-virtual {v0, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 242
    new-instance v41, Ljava/io/DataInputStream;

    new-instance v4, Lcom/vkontakte/android/ui/GifView$SyncedInputStream;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/vkontakte/android/ui/GifView$AnimationRunner;->this$0:Lcom/vkontakte/android/ui/GifView;

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/vkontakte/android/ui/GifView$AnimationRunner;->this$0:Lcom/vkontakte/android/ui/GifView;

    invoke-static {v7}, Lcom/vkontakte/android/ui/GifView;->access$800(Lcom/vkontakte/android/ui/GifView;)Ljava/io/InputStream;

    move-result-object v7

    invoke-direct {v4, v6, v7}, Lcom/vkontakte/android/ui/GifView$SyncedInputStream;-><init>(Lcom/vkontakte/android/ui/GifView;Ljava/io/InputStream;)V

    move-object/from16 v0, v41

    invoke-direct {v0, v4}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    .line 243
    .local v41, "s":Ljava/io/DataInputStream;
    const/4 v4, 0x6

    new-array v0, v4, [B

    move-object/from16 v42, v0

    .line 244
    .local v42, "sig":[B
    invoke-virtual/range {v41 .. v42}, Ljava/io/DataInputStream;->readFully([B)V

    .line 245
    const/4 v4, 0x0

    aget-byte v4, v42, v4

    const/16 v6, 0x47

    if-ne v4, v6, :cond_1

    const/4 v4, 0x1

    aget-byte v4, v42, v4

    const/16 v6, 0x49

    if-ne v4, v6, :cond_1

    const/4 v4, 0x2

    aget-byte v4, v42, v4

    const/16 v6, 0x46

    if-ne v4, v6, :cond_1

    const/4 v4, 0x3

    aget-byte v4, v42, v4

    const/16 v6, 0x38

    if-eq v4, v6, :cond_4

    .line 246
    :cond_1
    invoke-virtual/range {v41 .. v41}, Ljava/io/DataInputStream;->close()V

    .line 247
    new-instance v4, Ljava/io/IOException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "Incorrect GIF signature "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    new-instance v7, Ljava/lang/String;

    move-object/from16 v0, v42

    invoke-direct {v7, v0}, Ljava/lang/String;-><init>([B)V

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v6}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 445
    .end local v20    # "clearPaint":Landroid/graphics/Paint;
    .end local v38    # "nextDelay":J
    .end local v41    # "s":Ljava/io/DataInputStream;
    .end local v42    # "sig":[B
    .end local v44    # "t":J
    .end local v48    # "transpGif":[B
    .end local v50    # "transpTest":Landroid/graphics/Bitmap;
    .end local v51    # "useAlphaHack":Z
    :catch_0
    move-exception v53

    .line 446
    .local v53, "x":Ljava/lang/Throwable;
    const-string/jumbo v4, "vk"

    move-object/from16 v0, v53

    invoke-static {v4, v0}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 447
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/ui/GifView$AnimationRunner;->this$0:Lcom/vkontakte/android/ui/GifView;

    const/4 v6, 0x1

    invoke-static {v4, v6}, Lcom/vkontakte/android/ui/GifView;->access$502(Lcom/vkontakte/android/ui/GifView;Z)Z

    .line 448
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/ui/GifView$AnimationRunner;->this$0:Lcom/vkontakte/android/ui/GifView;

    invoke-virtual {v4}, Lcom/vkontakte/android/ui/GifView;->postInvalidate()V

    .line 449
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/ui/GifView$AnimationRunner;->this$0:Lcom/vkontakte/android/ui/GifView;

    invoke-static {v4}, Lcom/vkontakte/android/ui/GifView;->access$100(Lcom/vkontakte/android/ui/GifView;)Lcom/vkontakte/android/ui/GifView$ProgressCallback;

    move-result-object v4

    if-eqz v4, :cond_2

    .line 450
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/ui/GifView$AnimationRunner;->this$0:Lcom/vkontakte/android/ui/GifView;

    invoke-static {v4}, Lcom/vkontakte/android/ui/GifView;->access$100(Lcom/vkontakte/android/ui/GifView;)Lcom/vkontakte/android/ui/GifView$ProgressCallback;

    move-result-object v4

    invoke-interface {v4}, Lcom/vkontakte/android/ui/GifView$ProgressCallback;->hideProgressBar()V

    .line 454
    .end local v53    # "x":Ljava/lang/Throwable;
    :cond_2
    :try_start_1
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/ui/GifView$AnimationRunner;->this$0:Lcom/vkontakte/android/ui/GifView;

    invoke-static {v4}, Lcom/vkontakte/android/ui/GifView;->access$800(Lcom/vkontakte/android/ui/GifView;)Ljava/io/InputStream;

    move-result-object v4

    invoke-virtual {v4}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 464
    :goto_2
    return-void

    .line 233
    .restart local v48    # "transpGif":[B
    .restart local v50    # "transpTest":Landroid/graphics/Bitmap;
    :cond_3
    const/16 v51, 0x0

    goto/16 :goto_0

    .line 249
    .restart local v20    # "clearPaint":Landroid/graphics/Paint;
    .restart local v38    # "nextDelay":J
    .restart local v41    # "s":Ljava/io/DataInputStream;
    .restart local v42    # "sig":[B
    .restart local v44    # "t":J
    .restart local v51    # "useAlphaHack":Z
    :cond_4
    :try_start_2
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/ui/GifView$AnimationRunner;->this$0:Lcom/vkontakte/android/ui/GifView;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/vkontakte/android/ui/GifView$AnimationRunner;->this$0:Lcom/vkontakte/android/ui/GifView;

    move-object/from16 v0, v41

    invoke-static {v6, v0}, Lcom/vkontakte/android/ui/GifView;->access$1000(Lcom/vkontakte/android/ui/GifView;Ljava/io/InputStream;)I

    move-result v6

    invoke-static {v4, v6}, Lcom/vkontakte/android/ui/GifView;->access$902(Lcom/vkontakte/android/ui/GifView;I)I

    .line 250
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/ui/GifView$AnimationRunner;->this$0:Lcom/vkontakte/android/ui/GifView;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/vkontakte/android/ui/GifView$AnimationRunner;->this$0:Lcom/vkontakte/android/ui/GifView;

    move-object/from16 v0, v41

    invoke-static {v6, v0}, Lcom/vkontakte/android/ui/GifView;->access$1000(Lcom/vkontakte/android/ui/GifView;Ljava/io/InputStream;)I

    move-result v6

    invoke-static {v4, v6}, Lcom/vkontakte/android/ui/GifView;->access$1102(Lcom/vkontakte/android/ui/GifView;I)I

    .line 251
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/ui/GifView$AnimationRunner;->this$0:Lcom/vkontakte/android/ui/GifView;

    invoke-static {v4}, Lcom/vkontakte/android/ui/GifView;->access$200(Lcom/vkontakte/android/ui/GifView;)Z

    move-result v4

    if-nez v4, :cond_5

    .line 252
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/ui/GifView$AnimationRunner;->this$0:Lcom/vkontakte/android/ui/GifView;

    const/4 v6, 0x1

    invoke-static {v4, v6}, Lcom/vkontakte/android/ui/GifView;->access$302(Lcom/vkontakte/android/ui/GifView;Z)Z

    .line 253
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/ui/GifView$AnimationRunner;->this$0:Lcom/vkontakte/android/ui/GifView;

    invoke-static {v4}, Lcom/vkontakte/android/ui/GifView;->access$400(Lcom/vkontakte/android/ui/GifView;)Ljava/lang/Object;

    move-result-object v6

    monitor-enter v6
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_0

    .line 255
    :try_start_3
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/ui/GifView$AnimationRunner;->this$0:Lcom/vkontakte/android/ui/GifView;

    invoke-static {v4}, Lcom/vkontakte/android/ui/GifView;->access$400(Lcom/vkontakte/android/ui/GifView;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->wait()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_4
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 258
    :goto_3
    :try_start_4
    monitor-exit v6
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 260
    :cond_5
    :try_start_5
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/ui/GifView$AnimationRunner;->this$0:Lcom/vkontakte/android/ui/GifView;

    invoke-virtual {v4}, Lcom/vkontakte/android/ui/GifView;->getContext()Landroid/content/Context;

    move-result-object v4

    const-string/jumbo v6, "activity"

    invoke-virtual {v4, v6}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/app/ActivityManager;

    invoke-virtual {v4}, Landroid/app/ActivityManager;->getMemoryClass()I

    move-result v4

    const/16 v6, 0x20

    if-le v4, v6, :cond_7

    const/16 v33, 0x5dc

    .line 261
    .local v33, "lim":I
    :goto_4
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/ui/GifView$AnimationRunner;->this$0:Lcom/vkontakte/android/ui/GifView;

    invoke-static {v4}, Lcom/vkontakte/android/ui/GifView;->access$900(Lcom/vkontakte/android/ui/GifView;)I

    move-result v4

    move/from16 v0, v33

    if-gt v4, v0, :cond_6

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/ui/GifView$AnimationRunner;->this$0:Lcom/vkontakte/android/ui/GifView;

    invoke-static {v4}, Lcom/vkontakte/android/ui/GifView;->access$1100(Lcom/vkontakte/android/ui/GifView;)I

    move-result v4

    move/from16 v0, v33

    if-le v4, v0, :cond_8

    .line 262
    :cond_6
    new-instance v4, Ljava/io/IOException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "Too big: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/vkontakte/android/ui/GifView$AnimationRunner;->this$0:Lcom/vkontakte/android/ui/GifView;

    invoke-static {v7}, Lcom/vkontakte/android/ui/GifView;->access$900(Lcom/vkontakte/android/ui/GifView;)I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, "x"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/vkontakte/android/ui/GifView$AnimationRunner;->this$0:Lcom/vkontakte/android/ui/GifView;

    invoke-static {v7}, Lcom/vkontakte/android/ui/GifView;->access$1100(Lcom/vkontakte/android/ui/GifView;)I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v6}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4
    :try_end_5
    .catch Ljava/lang/Throwable; {:try_start_5 .. :try_end_5} :catch_0

    .line 258
    .end local v33    # "lim":I
    :catchall_0
    move-exception v4

    :try_start_6
    monitor-exit v6
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    :try_start_7
    throw v4

    .line 260
    :cond_7
    const/16 v33, 0x320

    goto :goto_4

    .line 264
    .restart local v33    # "lim":I
    :cond_8
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/ui/GifView$AnimationRunner;->this$0:Lcom/vkontakte/android/ui/GifView;

    new-instance v6, Lcom/vkontakte/android/ui/GifView$AnimationRunner$1;

    move-object/from16 v0, p0

    invoke-direct {v6, v0}, Lcom/vkontakte/android/ui/GifView$AnimationRunner$1;-><init>(Lcom/vkontakte/android/ui/GifView$AnimationRunner;)V

    invoke-virtual {v4, v6}, Lcom/vkontakte/android/ui/GifView;->post(Ljava/lang/Runnable;)Z

    .line 269
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/ui/GifView$AnimationRunner;->this$0:Lcom/vkontakte/android/ui/GifView;

    invoke-static {v4}, Lcom/vkontakte/android/ui/GifView;->access$1200(Lcom/vkontakte/android/ui/GifView;)Landroid/graphics/Bitmap;

    move-result-object v4

    if-nez v4, :cond_9

    .line 270
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/ui/GifView$AnimationRunner;->this$0:Lcom/vkontakte/android/ui/GifView;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/vkontakte/android/ui/GifView$AnimationRunner;->this$0:Lcom/vkontakte/android/ui/GifView;

    invoke-static {v6}, Lcom/vkontakte/android/ui/GifView;->access$900(Lcom/vkontakte/android/ui/GifView;)I

    move-result v6

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/vkontakte/android/ui/GifView$AnimationRunner;->this$0:Lcom/vkontakte/android/ui/GifView;

    invoke-static {v7}, Lcom/vkontakte/android/ui/GifView;->access$1100(Lcom/vkontakte/android/ui/GifView;)I

    move-result v7

    sget-object v8, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v6, v7, v8}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v6

    invoke-static {v4, v6}, Lcom/vkontakte/android/ui/GifView;->access$1202(Lcom/vkontakte/android/ui/GifView;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    .line 272
    :cond_9
    new-instance v18, Landroid/graphics/Canvas;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/ui/GifView$AnimationRunner;->this$0:Lcom/vkontakte/android/ui/GifView;

    invoke-static {v4}, Lcom/vkontakte/android/ui/GifView;->access$1200(Lcom/vkontakte/android/ui/GifView;)Landroid/graphics/Bitmap;

    move-result-object v4

    move-object/from16 v0, v18

    invoke-direct {v0, v4}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 273
    .local v18, "canvas":Landroid/graphics/Canvas;
    invoke-virtual/range {v41 .. v41}, Ljava/io/DataInputStream;->read()I

    move-result v24

    .line 274
    .local v24, "flags":I
    invoke-virtual/range {v41 .. v41}, Ljava/io/DataInputStream;->read()I

    move-result v15

    .line 275
    .local v15, "bgColorIndex":I
    invoke-virtual/range {v41 .. v41}, Ljava/io/DataInputStream;->read()I

    .line 276
    const/16 v26, 0x0

    .line 278
    .local v26, "globalPal":[B
    move/from16 v0, v24

    and-int/lit16 v4, v0, 0x80

    if-lez v4, :cond_a

    .line 279
    const/4 v4, 0x1

    and-int/lit8 v6, v24, 0x7

    add-int/lit8 v6, v6, 0x1

    shl-int v43, v4, v6

    .line 281
    .local v43, "size":I
    mul-int/lit8 v4, v43, 0x3

    new-array v0, v4, [B

    move-object/from16 v26, v0

    .line 282
    move-object/from16 v0, v41

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Ljava/io/DataInputStream;->readFully([B)V

    .line 284
    .end local v43    # "size":I
    :cond_a
    if-eqz v26, :cond_e

    mul-int/lit8 v4, v15, 0x3

    aget-byte v4, v26, v4

    and-int/lit16 v4, v4, 0xff

    shl-int/lit8 v4, v4, 0x10

    mul-int/lit8 v6, v15, 0x3

    add-int/lit8 v6, v6, 0x1

    aget-byte v6, v26, v6

    and-int/lit16 v6, v6, 0xff

    shl-int/lit8 v6, v6, 0x8

    or-int/2addr v4, v6

    mul-int/lit8 v6, v15, 0x3

    add-int/lit8 v6, v6, 0x2

    aget-byte v6, v26, v6

    and-int/lit16 v6, v6, 0xff

    or-int/2addr v4, v6

    const/high16 v6, -0x1000000

    or-int v14, v4, v6

    .line 285
    .local v14, "bgColor":I
    :goto_5
    move-object/from16 v0, v20

    invoke-virtual {v0, v14}, Landroid/graphics/Paint;->setColor(I)V

    .line 286
    const-wide/16 v22, 0x64

    .line 287
    .local v22, "delay":J
    const/16 v47, -0x1

    .line 288
    .local v47, "transpColor":I
    const/16 v19, 0x0

    .line 289
    .local v19, "clearBg":Z
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v44

    .line 290
    const/16 v36, 0x0

    .line 291
    .local v36, "n":I
    :cond_b
    :goto_6
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/ui/GifView$AnimationRunner;->this$0:Lcom/vkontakte/android/ui/GifView;

    invoke-static {v4}, Lcom/vkontakte/android/ui/GifView;->access$700(Lcom/vkontakte/android/ui/GifView;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 292
    invoke-virtual/range {v41 .. v41}, Ljava/io/DataInputStream;->read()I

    move-result v17

    .line 293
    .local v17, "c":I
    const/16 v4, 0x21

    move/from16 v0, v17

    if-ne v0, v4, :cond_13

    .line 294
    invoke-virtual/range {v41 .. v41}, Ljava/io/DataInputStream;->read()I

    move-result v54

    .line 296
    .local v54, "xtype":I
    const/16 v4, 0xf9

    move/from16 v0, v54

    if-ne v0, v4, :cond_10

    .line 297
    invoke-virtual/range {v41 .. v41}, Ljava/io/DataInputStream;->read()I

    .line 298
    invoke-virtual/range {v41 .. v41}, Ljava/io/DataInputStream;->read()I

    move-result v32

    .line 300
    .local v32, "lflags":I
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/ui/GifView$AnimationRunner;->this$0:Lcom/vkontakte/android/ui/GifView;

    move-object/from16 v0, v41

    invoke-static {v4, v0}, Lcom/vkontakte/android/ui/GifView;->access$1000(Lcom/vkontakte/android/ui/GifView;Ljava/io/InputStream;)I

    move-result v4

    mul-int/lit8 v4, v4, 0xa

    int-to-long v0, v4

    move-wide/from16 v22, v0

    .line 301
    const-wide/16 v6, 0x1e

    cmp-long v4, v22, v6

    if-gez v4, :cond_c

    .line 302
    const-wide/16 v22, 0x64

    .line 305
    :cond_c
    invoke-virtual/range {v41 .. v41}, Ljava/io/DataInputStream;->read()I

    move-result v47

    .line 306
    and-int/lit8 v4, v32, 0x1

    if-nez v4, :cond_d

    .line 307
    const/16 v47, -0x1

    .line 309
    :cond_d
    shr-int/lit8 v4, v32, 0x2

    const/4 v6, 0x2

    if-ne v4, v6, :cond_f

    const/16 v19, 0x1

    .line 311
    :goto_7
    invoke-virtual/range {v41 .. v41}, Ljava/io/DataInputStream;->read()I

    goto :goto_6

    .line 284
    .end local v14    # "bgColor":I
    .end local v17    # "c":I
    .end local v19    # "clearBg":Z
    .end local v22    # "delay":J
    .end local v32    # "lflags":I
    .end local v36    # "n":I
    .end local v47    # "transpColor":I
    .end local v54    # "xtype":I
    :cond_e
    const/high16 v14, -0x1000000

    goto :goto_5

    .line 309
    .restart local v14    # "bgColor":I
    .restart local v17    # "c":I
    .restart local v19    # "clearBg":Z
    .restart local v22    # "delay":J
    .restart local v32    # "lflags":I
    .restart local v36    # "n":I
    .restart local v47    # "transpColor":I
    .restart local v54    # "xtype":I
    :cond_f
    const/16 v19, 0x0

    goto :goto_7

    .line 312
    .end local v32    # "lflags":I
    :cond_10
    const/16 v4, 0xff

    move/from16 v0, v54

    if-ne v0, v4, :cond_12

    .line 313
    invoke-virtual/range {v41 .. v41}, Ljava/io/DataInputStream;->read()I

    .line 314
    const/16 v4, 0x8

    new-array v12, v4, [B

    .line 315
    .local v12, "_appid":[B
    move-object/from16 v0, v41

    invoke-virtual {v0, v12}, Ljava/io/DataInputStream;->read([B)I

    .line 316
    new-instance v13, Ljava/lang/String;

    invoke-direct {v13, v12}, Ljava/lang/String;-><init>([B)V

    .line 318
    .local v13, "appid":Ljava/lang/String;
    const-wide/16 v6, 0x3

    move-object/from16 v0, v41

    invoke-virtual {v0, v6, v7}, Ljava/io/DataInputStream;->skip(J)J

    .line 319
    const-string/jumbo v4, "NETSCAPE"

    invoke-virtual {v4, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_11

    .line 320
    invoke-virtual/range {v41 .. v41}, Ljava/io/DataInputStream;->read()I

    .line 321
    invoke-virtual/range {v41 .. v41}, Ljava/io/DataInputStream;->read()I

    .line 322
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/ui/GifView$AnimationRunner;->this$0:Lcom/vkontakte/android/ui/GifView;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/vkontakte/android/ui/GifView$AnimationRunner;->this$0:Lcom/vkontakte/android/ui/GifView;

    move-object/from16 v0, v41

    invoke-static {v6, v0}, Lcom/vkontakte/android/ui/GifView;->access$1000(Lcom/vkontakte/android/ui/GifView;Ljava/io/InputStream;)I

    move-result v6

    invoke-static {v4, v6}, Lcom/vkontakte/android/ui/GifView;->access$1302(Lcom/vkontakte/android/ui/GifView;I)I

    .line 323
    invoke-virtual/range {v41 .. v41}, Ljava/io/DataInputStream;->read()I

    goto/16 :goto_6

    .line 325
    :cond_11
    invoke-virtual/range {v41 .. v41}, Ljava/io/DataInputStream;->read()I

    move-result v30

    .line 326
    .local v30, "l":I
    :goto_8
    if-lez v30, :cond_b

    .line 327
    move/from16 v0, v30

    int-to-long v6, v0

    move-object/from16 v0, v41

    invoke-virtual {v0, v6, v7}, Ljava/io/DataInputStream;->skip(J)J

    .line 328
    invoke-virtual/range {v41 .. v41}, Ljava/io/DataInputStream;->read()I

    move-result v30

    goto :goto_8

    .line 332
    .end local v12    # "_appid":[B
    .end local v13    # "appid":Ljava/lang/String;
    .end local v30    # "l":I
    :cond_12
    invoke-virtual/range {v41 .. v41}, Ljava/io/DataInputStream;->read()I

    move-result v30

    .line 333
    .restart local v30    # "l":I
    :goto_9
    if-lez v30, :cond_b

    .line 334
    move/from16 v0, v30

    int-to-long v6, v0

    move-object/from16 v0, v41

    invoke-virtual {v0, v6, v7}, Ljava/io/DataInputStream;->skip(J)J

    .line 335
    invoke-virtual/range {v41 .. v41}, Ljava/io/DataInputStream;->read()I

    move-result v30

    goto :goto_9

    .line 338
    .end local v30    # "l":I
    .end local v54    # "xtype":I
    :cond_13
    const/16 v4, 0x2c

    move/from16 v0, v17

    if-ne v0, v4, :cond_21

    .line 340
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/ui/GifView$AnimationRunner;->this$0:Lcom/vkontakte/android/ui/GifView;

    move-object/from16 v0, v41

    invoke-static {v4, v0}, Lcom/vkontakte/android/ui/GifView;->access$1000(Lcom/vkontakte/android/ui/GifView;Ljava/io/InputStream;)I

    move-result v31

    .line 341
    .local v31, "left":I
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/ui/GifView$AnimationRunner;->this$0:Lcom/vkontakte/android/ui/GifView;

    move-object/from16 v0, v41

    invoke-static {v4, v0}, Lcom/vkontakte/android/ui/GifView;->access$1000(Lcom/vkontakte/android/ui/GifView;Ljava/io/InputStream;)I

    move-result v46

    .line 342
    .local v46, "top":I
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/ui/GifView$AnimationRunner;->this$0:Lcom/vkontakte/android/ui/GifView;

    move-object/from16 v0, v41

    invoke-static {v4, v0}, Lcom/vkontakte/android/ui/GifView;->access$1000(Lcom/vkontakte/android/ui/GifView;Ljava/io/InputStream;)I

    move-result v52

    .line 343
    .local v52, "width":I
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/ui/GifView$AnimationRunner;->this$0:Lcom/vkontakte/android/ui/GifView;

    move-object/from16 v0, v41

    invoke-static {v4, v0}, Lcom/vkontakte/android/ui/GifView;->access$1000(Lcom/vkontakte/android/ui/GifView;Ljava/io/InputStream;)I

    move-result v27

    .line 345
    .local v27, "height":I
    invoke-virtual/range {v41 .. v41}, Ljava/io/DataInputStream;->read()I

    move-result v32

    .line 347
    .restart local v32    # "lflags":I
    and-int/lit8 v4, v32, 0x40

    if-lez v4, :cond_15

    const/16 v29, 0x1

    .line 348
    .local v29, "interlaced":Z
    :goto_a
    const/16 v34, 0x0

    .line 349
    .local v34, "localPal":[B
    move/from16 v0, v32

    and-int/lit16 v4, v0, 0x80

    if-lez v4, :cond_14

    .line 350
    const/4 v4, 0x1

    and-int/lit8 v6, v32, 0x7

    add-int/lit8 v6, v6, 0x1

    shl-int v43, v4, v6

    .line 351
    .restart local v43    # "size":I
    mul-int/lit8 v4, v43, 0x3

    new-array v0, v4, [B

    move-object/from16 v34, v0

    .line 353
    const/4 v4, 0x0

    move-object/from16 v0, v34

    array-length v6, v0

    move-object/from16 v0, v41

    move-object/from16 v1, v34

    invoke-virtual {v0, v1, v4, v6}, Ljava/io/DataInputStream;->readFully([BII)V

    .line 355
    .end local v43    # "size":I
    :cond_14
    new-instance v16, Ljava/io/ByteArrayOutputStream;

    invoke-direct/range {v16 .. v16}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 356
    .local v16, "buf":Ljava/io/ByteArrayOutputStream;
    const-string/jumbo v4, "GIF89a"

    invoke-virtual {v4}, Ljava/lang/String;->getBytes()[B

    move-result-object v4

    move-object/from16 v0, v16

    invoke-virtual {v0, v4}, Ljava/io/ByteArrayOutputStream;->write([B)V

    .line 357
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/ui/GifView$AnimationRunner;->this$0:Lcom/vkontakte/android/ui/GifView;

    move-object/from16 v0, v16

    move/from16 v1, v52

    invoke-static {v4, v0, v1}, Lcom/vkontakte/android/ui/GifView;->access$1400(Lcom/vkontakte/android/ui/GifView;Ljava/io/OutputStream;I)V

    .line 358
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/ui/GifView$AnimationRunner;->this$0:Lcom/vkontakte/android/ui/GifView;

    move-object/from16 v0, v16

    move/from16 v1, v27

    invoke-static {v4, v0, v1}, Lcom/vkontakte/android/ui/GifView;->access$1400(Lcom/vkontakte/android/ui/GifView;Ljava/io/OutputStream;I)V

    .line 359
    if-eqz v34, :cond_16

    and-int/lit8 v4, v32, 0x7

    :goto_b
    or-int/lit16 v4, v4, 0xf0

    move-object/from16 v0, v16

    invoke-virtual {v0, v4}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 360
    move-object/from16 v0, v16

    invoke-virtual {v0, v15}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 361
    const/4 v4, 0x0

    move-object/from16 v0, v16

    invoke-virtual {v0, v4}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 363
    if-eqz v34, :cond_17

    move-object/from16 v4, v34

    :goto_c
    move-object/from16 v0, v16

    invoke-virtual {v0, v4}, Ljava/io/ByteArrayOutputStream;->write([B)V

    .line 364
    const/16 v4, 0x21

    move-object/from16 v0, v16

    invoke-virtual {v0, v4}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 365
    const/16 v4, 0xf9

    move-object/from16 v0, v16

    invoke-virtual {v0, v4}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 366
    const/4 v4, 0x4

    move-object/from16 v0, v16

    invoke-virtual {v0, v4}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 367
    if-ltz v47, :cond_18

    const/4 v4, 0x1

    :goto_d
    move-object/from16 v0, v16

    invoke-virtual {v0, v4}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 368
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/ui/GifView$AnimationRunner;->this$0:Lcom/vkontakte/android/ui/GifView;

    const/4 v6, 0x0

    move-object/from16 v0, v16

    invoke-static {v4, v0, v6}, Lcom/vkontakte/android/ui/GifView;->access$1400(Lcom/vkontakte/android/ui/GifView;Ljava/io/OutputStream;I)V

    .line 369
    move-object/from16 v0, v16

    move/from16 v1, v47

    invoke-virtual {v0, v1}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 370
    const/4 v4, 0x0

    move-object/from16 v0, v16

    invoke-virtual {v0, v4}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 371
    const/16 v4, 0x2c

    move-object/from16 v0, v16

    invoke-virtual {v0, v4}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 372
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/ui/GifView$AnimationRunner;->this$0:Lcom/vkontakte/android/ui/GifView;

    const/4 v6, 0x0

    move-object/from16 v0, v16

    invoke-static {v4, v0, v6}, Lcom/vkontakte/android/ui/GifView;->access$1400(Lcom/vkontakte/android/ui/GifView;Ljava/io/OutputStream;I)V

    .line 373
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/ui/GifView$AnimationRunner;->this$0:Lcom/vkontakte/android/ui/GifView;

    const/4 v6, 0x0

    move-object/from16 v0, v16

    invoke-static {v4, v0, v6}, Lcom/vkontakte/android/ui/GifView;->access$1400(Lcom/vkontakte/android/ui/GifView;Ljava/io/OutputStream;I)V

    .line 374
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/ui/GifView$AnimationRunner;->this$0:Lcom/vkontakte/android/ui/GifView;

    move-object/from16 v0, v16

    move/from16 v1, v52

    invoke-static {v4, v0, v1}, Lcom/vkontakte/android/ui/GifView;->access$1400(Lcom/vkontakte/android/ui/GifView;Ljava/io/OutputStream;I)V

    .line 375
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/ui/GifView$AnimationRunner;->this$0:Lcom/vkontakte/android/ui/GifView;

    move-object/from16 v0, v16

    move/from16 v1, v27

    invoke-static {v4, v0, v1}, Lcom/vkontakte/android/ui/GifView;->access$1400(Lcom/vkontakte/android/ui/GifView;Ljava/io/OutputStream;I)V

    .line 376
    if-eqz v29, :cond_19

    const/16 v4, 0x40

    :goto_e
    move-object/from16 v0, v16

    invoke-virtual {v0, v4}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 377
    invoke-virtual/range {v41 .. v41}, Ljava/io/DataInputStream;->read()I

    move-result v35

    .line 378
    .local v35, "mc":I
    move-object/from16 v0, v16

    move/from16 v1, v35

    invoke-virtual {v0, v1}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 379
    invoke-virtual/range {v41 .. v41}, Ljava/io/DataInputStream;->read()I

    move-result v30

    .line 380
    .restart local v30    # "l":I
    move-object/from16 v0, v16

    move/from16 v1, v30

    invoke-virtual {v0, v1}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 381
    const/16 v4, 0xff

    new-array v0, v4, [B

    move-object/from16 v21, v0

    .line 382
    .local v21, "db":[B
    :goto_f
    if-lez v30, :cond_1a

    .line 383
    const/4 v4, 0x0

    move-object/from16 v0, v41

    move-object/from16 v1, v21

    move/from16 v2, v30

    invoke-virtual {v0, v1, v4, v2}, Ljava/io/DataInputStream;->readFully([BII)V

    .line 384
    const/4 v4, 0x0

    move-object/from16 v0, v16

    move-object/from16 v1, v21

    move/from16 v2, v30

    invoke-virtual {v0, v1, v4, v2}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    .line 385
    invoke-virtual/range {v41 .. v41}, Ljava/io/DataInputStream;->read()I

    move-result v30

    .line 386
    move-object/from16 v0, v16

    move/from16 v1, v30

    invoke-virtual {v0, v1}, Ljava/io/ByteArrayOutputStream;->write(I)V

    goto :goto_f

    .line 347
    .end local v16    # "buf":Ljava/io/ByteArrayOutputStream;
    .end local v21    # "db":[B
    .end local v29    # "interlaced":Z
    .end local v30    # "l":I
    .end local v34    # "localPal":[B
    .end local v35    # "mc":I
    :cond_15
    const/16 v29, 0x0

    goto/16 :goto_a

    .line 359
    .restart local v16    # "buf":Ljava/io/ByteArrayOutputStream;
    .restart local v29    # "interlaced":Z
    .restart local v34    # "localPal":[B
    :cond_16
    and-int/lit8 v4, v24, 0x7

    goto/16 :goto_b

    :cond_17
    move-object/from16 v4, v26

    .line 363
    goto/16 :goto_c

    .line 367
    :cond_18
    const/4 v4, 0x0

    goto/16 :goto_d

    .line 376
    :cond_19
    const/4 v4, 0x0

    goto :goto_e

    .line 388
    .restart local v21    # "db":[B
    .restart local v30    # "l":I
    .restart local v35    # "mc":I
    :cond_1a
    const/16 v4, 0x3b

    move-object/from16 v0, v16

    invoke-virtual {v0, v4}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 389
    new-instance v37, Landroid/graphics/BitmapFactory$Options;

    invoke-direct/range {v37 .. v37}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 390
    .local v37, "opts":Landroid/graphics/BitmapFactory$Options;
    sget-object v4, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    move-object/from16 v0, v37

    iput-object v4, v0, Landroid/graphics/BitmapFactory$Options;->inPreferredConfig:Landroid/graphics/Bitmap$Config;

    .line 391
    new-instance v25, Lcom/vkontakte/android/ui/GifView$Frame;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/ui/GifView$AnimationRunner;->this$0:Lcom/vkontakte/android/ui/GifView;

    const/4 v6, 0x0

    move-object/from16 v0, v25

    invoke-direct {v0, v4, v6}, Lcom/vkontakte/android/ui/GifView$Frame;-><init>(Lcom/vkontakte/android/ui/GifView;Lcom/vkontakte/android/ui/GifView$1;)V

    .line 392
    .local v25, "frame":Lcom/vkontakte/android/ui/GifView$Frame;
    invoke-virtual/range {v16 .. v16}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v4

    const/4 v6, 0x0

    invoke-virtual/range {v16 .. v16}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v7

    move-object/from16 v0, v37

    invoke-static {v4, v6, v7, v0}, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v4

    move-object/from16 v0, v25

    iput-object v4, v0, Lcom/vkontakte/android/ui/GifView$Frame;->image:Landroid/graphics/Bitmap;

    .line 393
    move/from16 v0, v31

    move-object/from16 v1, v25

    iput v0, v1, Lcom/vkontakte/android/ui/GifView$Frame;->x:I

    .line 394
    move/from16 v0, v46

    move-object/from16 v1, v25

    iput v0, v1, Lcom/vkontakte/android/ui/GifView$Frame;->y:I

    .line 395
    move-wide/from16 v0, v22

    move-object/from16 v2, v25

    iput-wide v0, v2, Lcom/vkontakte/android/ui/GifView$Frame;->delay:J

    .line 396
    move/from16 v0, v19

    move-object/from16 v1, v25

    iput-boolean v0, v1, Lcom/vkontakte/android/ui/GifView$Frame;->clear:Z

    .line 398
    if-eqz v51, :cond_1e

    if-ltz v47, :cond_1e

    if-nez v19, :cond_1e

    .line 399
    move-object/from16 v0, v25

    iget-object v4, v0, Lcom/vkontakte/android/ui/GifView$Frame;->image:Landroid/graphics/Bitmap;

    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v4

    move-object/from16 v0, v25

    iget-object v6, v0, Lcom/vkontakte/android/ui/GifView$Frame;->image:Landroid/graphics/Bitmap;

    invoke-virtual {v6}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v6

    mul-int/2addr v4, v6

    new-array v5, v4, [I

    .line 400
    .local v5, "pixels":[I
    move-object/from16 v0, v25

    iget-object v4, v0, Lcom/vkontakte/android/ui/GifView$Frame;->image:Landroid/graphics/Bitmap;

    const/4 v6, 0x0

    move-object/from16 v0, v25

    iget-object v7, v0, Lcom/vkontakte/android/ui/GifView$Frame;->image:Landroid/graphics/Bitmap;

    invoke-virtual {v7}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v7

    const/4 v8, 0x0

    const/4 v9, 0x0

    move-object/from16 v0, v25

    iget-object v10, v0, Lcom/vkontakte/android/ui/GifView$Frame;->image:Landroid/graphics/Bitmap;

    invoke-virtual {v10}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v10

    move-object/from16 v0, v25

    iget-object v11, v0, Lcom/vkontakte/android/ui/GifView$Frame;->image:Landroid/graphics/Bitmap;

    invoke-virtual {v11}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v11

    invoke-virtual/range {v4 .. v11}, Landroid/graphics/Bitmap;->getPixels([IIIIIII)V

    .line 401
    if-nez v34, :cond_1c

    move-object/from16 v40, v26

    .line 402
    .local v40, "pal":[B
    :goto_10
    const/16 v49, 0x0

    .line 403
    .local v49, "transpRGB":I
    move-object/from16 v0, v40

    array-length v4, v0

    div-int/lit8 v4, v4, 0x3

    move/from16 v0, v47

    if-ge v0, v4, :cond_1e

    .line 404
    mul-int/lit8 v4, v47, 0x3

    aget-byte v4, v40, v4

    and-int/lit16 v4, v4, 0xff

    shl-int/lit8 v4, v4, 0x10

    mul-int/lit8 v6, v47, 0x3

    add-int/lit8 v6, v6, 0x1

    aget-byte v6, v40, v6

    and-int/lit16 v6, v6, 0xff

    shl-int/lit8 v6, v6, 0x8

    or-int/2addr v4, v6

    mul-int/lit8 v6, v47, 0x3

    add-int/lit8 v6, v6, 0x2

    aget-byte v6, v40, v6

    and-int/lit16 v6, v6, 0xff

    or-int/2addr v4, v6

    const/high16 v6, -0x1000000

    or-int v49, v4, v6

    .line 405
    const/16 v28, 0x0

    .local v28, "i":I
    :goto_11
    array-length v4, v5

    move/from16 v0, v28

    if-ge v0, v4, :cond_1d

    .line 406
    aget v4, v5, v28

    move/from16 v0, v49

    if-ne v4, v0, :cond_1b

    .line 407
    const/4 v4, 0x0

    aput v4, v5, v28

    .line 405
    :cond_1b
    add-int/lit8 v28, v28, 0x1

    goto :goto_11

    .end local v28    # "i":I
    .end local v40    # "pal":[B
    .end local v49    # "transpRGB":I
    :cond_1c
    move-object/from16 v40, v34

    .line 401
    goto :goto_10

    .line 411
    .restart local v28    # "i":I
    .restart local v40    # "pal":[B
    .restart local v49    # "transpRGB":I
    :cond_1d
    move-object/from16 v0, v25

    iget-object v4, v0, Lcom/vkontakte/android/ui/GifView$Frame;->image:Landroid/graphics/Bitmap;

    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v4

    move-object/from16 v0, v25

    iget-object v6, v0, Lcom/vkontakte/android/ui/GifView$Frame;->image:Landroid/graphics/Bitmap;

    invoke-virtual {v6}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v6

    sget-object v7, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v5, v4, v6, v7}, Landroid/graphics/Bitmap;->createBitmap([IIILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v4

    move-object/from16 v0, v25

    iput-object v4, v0, Lcom/vkontakte/android/ui/GifView$Frame;->image:Landroid/graphics/Bitmap;
    :try_end_7
    .catch Ljava/lang/Throwable; {:try_start_7 .. :try_end_7} :catch_0

    .line 416
    .end local v5    # "pixels":[I
    .end local v28    # "i":I
    .end local v40    # "pal":[B
    .end local v49    # "transpRGB":I
    :cond_1e
    const-wide/16 v6, 0x0

    cmp-long v4, v22, v6

    if-lez v4, :cond_1f

    .line 418
    const-wide/16 v6, 0x0

    :try_start_8
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    sub-long v8, v8, v44

    sub-long v8, v22, v8

    invoke-static {v6, v7, v8, v9}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Thread;->sleep(J)V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_3
    .catch Ljava/lang/Throwable; {:try_start_8 .. :try_end_8} :catch_0

    .line 422
    :cond_1f
    :goto_12
    :try_start_9
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v44

    .line 425
    move-object/from16 v0, v25

    iget-boolean v4, v0, Lcom/vkontakte/android/ui/GifView$Frame;->clear:Z

    if-eqz v4, :cond_20

    .line 426
    new-instance v4, Landroid/graphics/Rect;

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual/range {v18 .. v18}, Landroid/graphics/Canvas;->getWidth()I

    move-result v8

    invoke-virtual/range {v18 .. v18}, Landroid/graphics/Canvas;->getHeight()I

    move-result v9

    invoke-direct {v4, v6, v7, v8, v9}, Landroid/graphics/Rect;-><init>(IIII)V

    move-object/from16 v0, v18

    move-object/from16 v1, v20

    invoke-virtual {v0, v4, v1}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/Rect;Landroid/graphics/Paint;)V
    :try_end_9
    .catch Ljava/lang/Throwable; {:try_start_9 .. :try_end_9} :catch_0

    .line 431
    :cond_20
    :try_start_a
    move-object/from16 v0, v25

    iget-object v4, v0, Lcom/vkontakte/android/ui/GifView$Frame;->image:Landroid/graphics/Bitmap;

    move-object/from16 v0, v25

    iget v6, v0, Lcom/vkontakte/android/ui/GifView$Frame;->x:I

    int-to-float v6, v6

    move-object/from16 v0, v25

    iget v7, v0, Lcom/vkontakte/android/ui/GifView$Frame;->y:I

    int-to-float v7, v7

    const/4 v8, 0x0

    move-object/from16 v0, v18

    invoke-virtual {v0, v4, v6, v7, v8}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_2
    .catch Ljava/lang/Throwable; {:try_start_a .. :try_end_a} :catch_0

    .line 434
    :goto_13
    :try_start_b
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/ui/GifView$AnimationRunner;->this$0:Lcom/vkontakte/android/ui/GifView;

    invoke-virtual {v4}, Lcom/vkontakte/android/ui/GifView;->postInvalidate()V

    .line 435
    move-object/from16 v0, v25

    iget-wide v0, v0, Lcom/vkontakte/android/ui/GifView$Frame;->delay:J

    move-wide/from16 v38, v0

    .line 436
    add-int/lit8 v36, v36, 0x1

    .line 437
    goto/16 :goto_6

    .end local v16    # "buf":Ljava/io/ByteArrayOutputStream;
    .end local v21    # "db":[B
    .end local v25    # "frame":Lcom/vkontakte/android/ui/GifView$Frame;
    .end local v27    # "height":I
    .end local v29    # "interlaced":Z
    .end local v30    # "l":I
    .end local v31    # "left":I
    .end local v32    # "lflags":I
    .end local v34    # "localPal":[B
    .end local v35    # "mc":I
    .end local v37    # "opts":Landroid/graphics/BitmapFactory$Options;
    .end local v46    # "top":I
    .end local v52    # "width":I
    :cond_21
    const/16 v4, 0x3b

    move/from16 v0, v17

    if-ne v0, v4, :cond_b

    .line 439
    const/16 v36, 0x0

    .line 440
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/ui/GifView$AnimationRunner;->this$0:Lcom/vkontakte/android/ui/GifView;

    invoke-static {v4}, Lcom/vkontakte/android/ui/GifView;->access$800(Lcom/vkontakte/android/ui/GifView;)Ljava/io/InputStream;

    move-result-object v4

    check-cast v4, Ljava/io/FileInputStream;

    invoke-virtual {v4}, Ljava/io/FileInputStream;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v4

    const-wide/16 v6, 0x0

    invoke-virtual {v4, v6, v7}, Ljava/nio/channels/FileChannel;->position(J)Ljava/nio/channels/FileChannel;
    :try_end_b
    .catch Ljava/lang/Throwable; {:try_start_b .. :try_end_b} :catch_0

    goto/16 :goto_1

    .line 455
    .end local v14    # "bgColor":I
    .end local v15    # "bgColorIndex":I
    .end local v17    # "c":I
    .end local v18    # "canvas":Landroid/graphics/Canvas;
    .end local v19    # "clearBg":Z
    .end local v20    # "clearPaint":Landroid/graphics/Paint;
    .end local v22    # "delay":J
    .end local v24    # "flags":I
    .end local v26    # "globalPal":[B
    .end local v33    # "lim":I
    .end local v36    # "n":I
    .end local v38    # "nextDelay":J
    .end local v41    # "s":Ljava/io/DataInputStream;
    .end local v42    # "sig":[B
    .end local v44    # "t":J
    .end local v47    # "transpColor":I
    .end local v48    # "transpGif":[B
    .end local v50    # "transpTest":Landroid/graphics/Bitmap;
    .end local v51    # "useAlphaHack":Z
    :catch_1
    move-exception v4

    goto/16 :goto_2

    .line 432
    .restart local v14    # "bgColor":I
    .restart local v15    # "bgColorIndex":I
    .restart local v16    # "buf":Ljava/io/ByteArrayOutputStream;
    .restart local v17    # "c":I
    .restart local v18    # "canvas":Landroid/graphics/Canvas;
    .restart local v19    # "clearBg":Z
    .restart local v20    # "clearPaint":Landroid/graphics/Paint;
    .restart local v21    # "db":[B
    .restart local v22    # "delay":J
    .restart local v24    # "flags":I
    .restart local v25    # "frame":Lcom/vkontakte/android/ui/GifView$Frame;
    .restart local v26    # "globalPal":[B
    .restart local v27    # "height":I
    .restart local v29    # "interlaced":Z
    .restart local v30    # "l":I
    .restart local v31    # "left":I
    .restart local v32    # "lflags":I
    .restart local v33    # "lim":I
    .restart local v34    # "localPal":[B
    .restart local v35    # "mc":I
    .restart local v36    # "n":I
    .restart local v37    # "opts":Landroid/graphics/BitmapFactory$Options;
    .restart local v38    # "nextDelay":J
    .restart local v41    # "s":Ljava/io/DataInputStream;
    .restart local v42    # "sig":[B
    .restart local v44    # "t":J
    .restart local v46    # "top":I
    .restart local v47    # "transpColor":I
    .restart local v48    # "transpGif":[B
    .restart local v50    # "transpTest":Landroid/graphics/Bitmap;
    .restart local v51    # "useAlphaHack":Z
    .restart local v52    # "width":I
    :catch_2
    move-exception v4

    goto :goto_13

    .line 419
    :catch_3
    move-exception v4

    goto :goto_12

    .line 256
    .end local v14    # "bgColor":I
    .end local v15    # "bgColorIndex":I
    .end local v16    # "buf":Ljava/io/ByteArrayOutputStream;
    .end local v17    # "c":I
    .end local v18    # "canvas":Landroid/graphics/Canvas;
    .end local v19    # "clearBg":Z
    .end local v21    # "db":[B
    .end local v22    # "delay":J
    .end local v24    # "flags":I
    .end local v25    # "frame":Lcom/vkontakte/android/ui/GifView$Frame;
    .end local v26    # "globalPal":[B
    .end local v27    # "height":I
    .end local v29    # "interlaced":Z
    .end local v30    # "l":I
    .end local v31    # "left":I
    .end local v32    # "lflags":I
    .end local v33    # "lim":I
    .end local v34    # "localPal":[B
    .end local v35    # "mc":I
    .end local v36    # "n":I
    .end local v37    # "opts":Landroid/graphics/BitmapFactory$Options;
    .end local v46    # "top":I
    .end local v47    # "transpColor":I
    .end local v52    # "width":I
    :catch_4
    move-exception v4

    goto/16 :goto_3

    .line 231
    :array_0
    .array-data 1
        0x47t
        0x49t
        0x46t
        0x38t
        0x39t
        0x61t
        0x1t
        0x0t
        0x1t
        0x0t
        -0x80t
        0x0t
        0x0t
        -0x1t
        -0x1t
        -0x1t
        0x0t
        0x0t
        0x0t
        0x21t
        -0x7t
        0x4t
        0x1t
        0x0t
        0x0t
        0x0t
        0x0t
        0x2ct
        0x0t
        0x0t
        0x0t
        0x0t
        0x1t
        0x0t
        0x1t
        0x0t
        0x0t
        0x2t
        0x2t
        0x44t
        0x1t
        0x0t
        0x3bt
    .end array-data
.end method
