.class Lcom/vkontakte/android/fragments/SignupProfileFragment$4;
.super Ljava/lang/Object;
.source "SignupProfileFragment.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/SignupProfileFragment;->updatePhoto()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/SignupProfileFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/SignupProfileFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/SignupProfileFragment;

    .prologue
    .line 224
    iput-object p1, p0, Lcom/vkontakte/android/fragments/SignupProfileFragment$4;->this$0:Lcom/vkontakte/android/fragments/SignupProfileFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method synthetic lambda$run$0(Landroid/graphics/Bitmap;)V
    .locals 3
    .param p1, "bmp"    # Landroid/graphics/Bitmap;

    .prologue
    .line 342
    const-string/jumbo v0, "vk"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Set thumb "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 343
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SignupProfileFragment$4;->this$0:Lcom/vkontakte/android/fragments/SignupProfileFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/SignupProfileFragment;->access$1000(Lcom/vkontakte/android/fragments/SignupProfileFragment;)Landroid/view/View;

    move-result-object v0

    if-nez v0, :cond_0

    .line 348
    :goto_0
    return-void

    .line 346
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SignupProfileFragment$4;->this$0:Lcom/vkontakte/android/fragments/SignupProfileFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/SignupProfileFragment;->access$1000(Lcom/vkontakte/android/fragments/SignupProfileFragment;)Landroid/view/View;

    move-result-object v0

    const v1, 0x7f10053b

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 347
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SignupProfileFragment$4;->this$0:Lcom/vkontakte/android/fragments/SignupProfileFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/SignupProfileFragment;->access$1000(Lcom/vkontakte/android/fragments/SignupProfileFragment;)Landroid/view/View;

    move-result-object v0

    const v1, 0x7f10053a

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    goto :goto_0
.end method

.method public run()V
    .locals 28

    .prologue
    .line 227
    :try_start_0
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/fragments/SignupProfileFragment$4;->this$0:Lcom/vkontakte/android/fragments/SignupProfileFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/SignupProfileFragment;->access$400(Lcom/vkontakte/android/fragments/SignupProfileFragment;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    .line 230
    .local v3, "uri":Landroid/net/Uri;
    const/16 v24, 0x0

    .line 232
    .local v24, "rotation":I
    invoke-virtual {v3}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v2

    const-string/jumbo v6, "file"

    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    invoke-virtual {v3}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v2

    const-string/jumbo v6, "content"

    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 233
    :cond_0
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/fragments/SignupProfileFragment$4;->this$0:Lcom/vkontakte/android/fragments/SignupProfileFragment;

    invoke-virtual {v2}, Lcom/vkontakte/android/fragments/SignupProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string/jumbo v6, "r"

    invoke-virtual {v2, v3, v6}, Landroid/content/ContentResolver;->openFileDescriptor(Landroid/net/Uri;Ljava/lang/String;)Landroid/os/ParcelFileDescriptor;

    move-result-object v18

    .line 234
    .local v18, "fd":Landroid/os/ParcelFileDescriptor;
    invoke-virtual {v3}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v2

    const-string/jumbo v6, "content"

    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    move-result v2

    if-eqz v2, :cond_2

    .line 236
    const/4 v2, 0x1

    :try_start_1
    new-array v4, v2, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string/jumbo v6, "orientation"

    aput-object v6, v4, v2

    .line 237
    .local v4, "projection":[Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/fragments/SignupProfileFragment$4;->this$0:Lcom/vkontakte/android/fragments/SignupProfileFragment;

    invoke-virtual {v2}, Lcom/vkontakte/android/fragments/SignupProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual/range {v2 .. v7}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v15

    .line 238
    .local v15, "c":Landroid/database/Cursor;
    invoke-interface {v15}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 239
    const/4 v2, 0x0

    invoke-interface {v15, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v24

    .line 241
    :cond_1
    const-string/jumbo v2, "vk"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "img rotation is "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move/from16 v0, v24

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v2, v6}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2

    .line 245
    .end local v4    # "projection":[Ljava/lang/String;
    .end local v15    # "c":Landroid/database/Cursor;
    :cond_2
    :goto_0
    :try_start_2
    new-instance v21, Landroid/graphics/BitmapFactory$Options;

    invoke-direct/range {v21 .. v21}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 246
    .local v21, "opts":Landroid/graphics/BitmapFactory$Options;
    const/4 v2, 0x1

    move-object/from16 v0, v21

    iput-boolean v2, v0, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 247
    invoke-virtual/range {v18 .. v18}, Landroid/os/ParcelFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object v2

    const/4 v6, 0x0

    move-object/from16 v0, v21

    invoke-static {v2, v6, v0}, Landroid/graphics/BitmapFactory;->decodeFileDescriptor(Ljava/io/FileDescriptor;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 249
    invoke-virtual {v3}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v2

    const-string/jumbo v6, "file"

    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3

    if-nez v24, :cond_4

    .line 250
    :cond_3
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/fragments/SignupProfileFragment$4;->this$0:Lcom/vkontakte/android/fragments/SignupProfileFragment;

    invoke-static {v2, v3}, Lcom/vkontakte/android/fragments/SignupProfileFragment;->access$500(Lcom/vkontakte/android/fragments/SignupProfileFragment;Landroid/net/Uri;)Ljava/lang/String;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    move-result-object v22

    .line 251
    .local v22, "realPath":Ljava/lang/String;
    if-eqz v22, :cond_4

    .line 253
    :try_start_3
    new-instance v17, Landroid/media/ExifInterface;

    move-object/from16 v0, v17

    move-object/from16 v1, v22

    invoke-direct {v0, v1}, Landroid/media/ExifInterface;-><init>(Ljava/lang/String;)V

    .line 254
    .local v17, "exif":Landroid/media/ExifInterface;
    const-string/jumbo v2, "Orientation"

    const/4 v6, 0x0

    move-object/from16 v0, v17

    invoke-virtual {v0, v2, v6}, Landroid/media/ExifInterface;->getAttributeInt(Ljava/lang/String;I)I

    move-result v20

    .line 255
    .local v20, "o":I
    const-string/jumbo v2, "vk"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "Exif orientation "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move/from16 v0, v20

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v2, v6}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    .line 256
    packed-switch v20, :pswitch_data_0

    .line 285
    .end local v17    # "exif":Landroid/media/ExifInterface;
    .end local v20    # "o":I
    .end local v22    # "realPath":Ljava/lang/String;
    :cond_4
    :goto_1
    :pswitch_0
    sparse-switch v24, :sswitch_data_0

    .line 308
    :try_start_4
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/fragments/SignupProfileFragment$4;->this$0:Lcom/vkontakte/android/fragments/SignupProfileFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/SignupProfileFragment;->access$900(Lcom/vkontakte/android/fragments/SignupProfileFragment;)F

    move-result v19

    .line 309
    .local v19, "left":F
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/fragments/SignupProfileFragment$4;->this$0:Lcom/vkontakte/android/fragments/SignupProfileFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/SignupProfileFragment;->access$600(Lcom/vkontakte/android/fragments/SignupProfileFragment;)F

    move-result v25

    .line 310
    .local v25, "top":F
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/fragments/SignupProfileFragment$4;->this$0:Lcom/vkontakte/android/fragments/SignupProfileFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/SignupProfileFragment;->access$700(Lcom/vkontakte/android/fragments/SignupProfileFragment;)F

    move-result v23

    .line 311
    .local v23, "right":F
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/fragments/SignupProfileFragment$4;->this$0:Lcom/vkontakte/android/fragments/SignupProfileFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/SignupProfileFragment;->access$800(Lcom/vkontakte/android/fragments/SignupProfileFragment;)F

    move-result v13

    .line 315
    .local v13, "bottom":F
    :goto_2
    move-object/from16 v0, v21

    iget v2, v0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    int-to-float v2, v2

    mul-float v2, v2, v19

    float-to-int v2, v2

    int-to-float v0, v2

    move/from16 v19, v0

    .line 316
    move-object/from16 v0, v21

    iget v2, v0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    int-to-float v2, v2

    mul-float v2, v2, v25

    float-to-int v2, v2

    int-to-float v0, v2

    move/from16 v25, v0

    .line 317
    move-object/from16 v0, v21

    iget v2, v0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    int-to-float v2, v2

    mul-float v2, v2, v23

    float-to-int v2, v2

    int-to-float v0, v2

    move/from16 v23, v0

    .line 318
    move-object/from16 v0, v21

    iget v2, v0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    int-to-float v2, v2

    mul-float/2addr v2, v13

    float-to-int v2, v2

    int-to-float v13, v2

    .line 320
    const/high16 v2, 0x42b40000    # 90.0f

    invoke-static {v2}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v26

    .line 321
    .local v26, "ts":I
    sub-float v2, v23, v19

    sub-float v6, v13, v25

    invoke-static {v2, v6}, Ljava/lang/Math;->max(FF)F

    move-result v2

    float-to-int v14, v2

    .line 322
    .local v14, "bs":I
    const/4 v2, 0x0

    move-object/from16 v0, v21

    iput-boolean v2, v0, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 323
    move/from16 v0, v26

    if-le v14, v0, :cond_5

    .line 324
    int-to-float v2, v14

    move/from16 v0, v26

    int-to-float v6, v0

    div-float/2addr v2, v6

    float-to-double v6, v2

    invoke-static {v6, v7}, Ljava/lang/Math;->floor(D)D

    move-result-wide v6

    double-to-int v2, v6

    move-object/from16 v0, v21

    iput v2, v0, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 327
    :cond_5
    invoke-virtual/range {v18 .. v18}, Landroid/os/ParcelFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object v2

    const/4 v6, 0x0

    invoke-static {v2, v6}, Landroid/graphics/BitmapRegionDecoder;->newInstance(Ljava/io/FileDescriptor;Z)Landroid/graphics/BitmapRegionDecoder;

    move-result-object v2

    new-instance v6, Landroid/graphics/Rect;

    move/from16 v0, v19

    float-to-int v7, v0

    move/from16 v0, v25

    float-to-int v8, v0

    move/from16 v0, v23

    float-to-int v9, v0

    float-to-int v11, v13

    invoke-direct {v6, v7, v8, v9, v11}, Landroid/graphics/Rect;-><init>(IIII)V

    move-object/from16 v0, v21

    invoke-virtual {v2, v6, v0}, Landroid/graphics/BitmapRegionDecoder;->decodeRegion(Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v5

    .line 328
    .local v5, "_bmp":Landroid/graphics/Bitmap;
    if-eqz v24, :cond_6

    .line 329
    new-instance v10, Landroid/graphics/Matrix;

    invoke-direct {v10}, Landroid/graphics/Matrix;-><init>()V

    .line 330
    .local v10, "matrix":Landroid/graphics/Matrix;
    move/from16 v0, v24

    int-to-float v2, v0

    invoke-virtual {v10, v2}, Landroid/graphics/Matrix;->preRotate(F)Z

    .line 331
    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual {v5}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v8

    invoke-virtual {v5}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v9

    const/4 v11, 0x0

    invoke-static/range {v5 .. v11}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    move-result-object v5

    .line 333
    .end local v10    # "matrix":Landroid/graphics/Matrix;
    :cond_6
    move-object v12, v5

    .line 334
    .local v12, "bmp":Landroid/graphics/Bitmap;
    invoke-virtual/range {v18 .. v18}, Landroid/os/ParcelFileDescriptor;->close()V

    .line 338
    .end local v5    # "_bmp":Landroid/graphics/Bitmap;
    .end local v13    # "bottom":F
    .end local v14    # "bs":I
    .end local v18    # "fd":Landroid/os/ParcelFileDescriptor;
    .end local v19    # "left":F
    .end local v21    # "opts":Landroid/graphics/BitmapFactory$Options;
    .end local v23    # "right":F
    .end local v25    # "top":F
    .end local v26    # "ts":I
    :goto_3
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/fragments/SignupProfileFragment$4;->this$0:Lcom/vkontakte/android/fragments/SignupProfileFragment;

    invoke-virtual {v2}, Lcom/vkontakte/android/fragments/SignupProfileFragment;->getActivity()Landroid/app/Activity;
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    move-result-object v2

    if-eqz v2, :cond_7

    if-nez v12, :cond_9

    .line 352
    .end local v3    # "uri":Landroid/net/Uri;
    .end local v12    # "bmp":Landroid/graphics/Bitmap;
    .end local v24    # "rotation":I
    :cond_7
    :goto_4
    return-void

    .line 258
    .restart local v3    # "uri":Landroid/net/Uri;
    .restart local v17    # "exif":Landroid/media/ExifInterface;
    .restart local v18    # "fd":Landroid/os/ParcelFileDescriptor;
    .restart local v20    # "o":I
    .restart local v21    # "opts":Landroid/graphics/BitmapFactory$Options;
    .restart local v22    # "realPath":Ljava/lang/String;
    .restart local v24    # "rotation":I
    :pswitch_1
    :try_start_5
    const-string/jumbo v2, "PhotoUpload"

    const-string/jumbo v6, "Exif: 90"

    invoke-static {v2, v6}, Lcom/vkontakte/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 259
    const/16 v24, 0x5a

    .line 261
    goto/16 :goto_1

    .line 263
    :pswitch_2
    const-string/jumbo v2, "PhotoUpload"

    const-string/jumbo v6, "Exif: 180"

    invoke-static {v2, v6}, Lcom/vkontakte/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 264
    const/16 v24, 0xb4

    .line 266
    goto/16 :goto_1

    .line 268
    :pswitch_3
    const-string/jumbo v2, "PhotoUpload"

    const-string/jumbo v6, "Exif: 270"

    invoke-static {v2, v6}, Lcom/vkontakte/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0

    .line 269
    const/16 v24, 0x10e

    goto/16 :goto_1

    .line 273
    .end local v17    # "exif":Landroid/media/ExifInterface;
    .end local v20    # "o":I
    :catch_0
    move-exception v16

    .line 274
    .local v16, "e":Ljava/lang/Exception;
    const/4 v2, 0x0

    :try_start_6
    new-array v2, v2, [Ljava/lang/Object;

    move-object/from16 v0, v16

    invoke-static {v0, v2}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_1

    goto/16 :goto_1

    .line 349
    .end local v3    # "uri":Landroid/net/Uri;
    .end local v16    # "e":Ljava/lang/Exception;
    .end local v18    # "fd":Landroid/os/ParcelFileDescriptor;
    .end local v21    # "opts":Landroid/graphics/BitmapFactory$Options;
    .end local v22    # "realPath":Ljava/lang/String;
    .end local v24    # "rotation":I
    :catch_1
    move-exception v27

    .line 350
    .local v27, "x":Ljava/lang/Exception;
    const-string/jumbo v2, "vk"

    move-object/from16 v0, v27

    invoke-static {v2, v0}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_4

    .line 287
    .end local v27    # "x":Ljava/lang/Exception;
    .restart local v3    # "uri":Landroid/net/Uri;
    .restart local v18    # "fd":Landroid/os/ParcelFileDescriptor;
    .restart local v21    # "opts":Landroid/graphics/BitmapFactory$Options;
    .restart local v24    # "rotation":I
    :sswitch_0
    :try_start_7
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/fragments/SignupProfileFragment$4;->this$0:Lcom/vkontakte/android/fragments/SignupProfileFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/SignupProfileFragment;->access$600(Lcom/vkontakte/android/fragments/SignupProfileFragment;)F

    move-result v19

    .line 288
    .restart local v19    # "left":F
    const/high16 v2, 0x3f800000    # 1.0f

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/vkontakte/android/fragments/SignupProfileFragment$4;->this$0:Lcom/vkontakte/android/fragments/SignupProfileFragment;

    invoke-static {v6}, Lcom/vkontakte/android/fragments/SignupProfileFragment;->access$700(Lcom/vkontakte/android/fragments/SignupProfileFragment;)F

    move-result v6

    sub-float v25, v2, v6

    .line 289
    .restart local v25    # "top":F
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/fragments/SignupProfileFragment$4;->this$0:Lcom/vkontakte/android/fragments/SignupProfileFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/SignupProfileFragment;->access$800(Lcom/vkontakte/android/fragments/SignupProfileFragment;)F

    move-result v23

    .line 290
    .restart local v23    # "right":F
    const/high16 v2, 0x3f800000    # 1.0f

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/vkontakte/android/fragments/SignupProfileFragment$4;->this$0:Lcom/vkontakte/android/fragments/SignupProfileFragment;

    invoke-static {v6}, Lcom/vkontakte/android/fragments/SignupProfileFragment;->access$900(Lcom/vkontakte/android/fragments/SignupProfileFragment;)F

    move-result v6

    sub-float v13, v2, v6

    .line 292
    .restart local v13    # "bottom":F
    goto/16 :goto_2

    .line 294
    .end local v13    # "bottom":F
    .end local v19    # "left":F
    .end local v23    # "right":F
    .end local v25    # "top":F
    :sswitch_1
    const/high16 v2, 0x3f800000    # 1.0f

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/vkontakte/android/fragments/SignupProfileFragment$4;->this$0:Lcom/vkontakte/android/fragments/SignupProfileFragment;

    invoke-static {v6}, Lcom/vkontakte/android/fragments/SignupProfileFragment;->access$800(Lcom/vkontakte/android/fragments/SignupProfileFragment;)F

    move-result v6

    sub-float v25, v2, v6

    .line 295
    .restart local v25    # "top":F
    const/high16 v2, 0x3f800000    # 1.0f

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/vkontakte/android/fragments/SignupProfileFragment$4;->this$0:Lcom/vkontakte/android/fragments/SignupProfileFragment;

    invoke-static {v6}, Lcom/vkontakte/android/fragments/SignupProfileFragment;->access$600(Lcom/vkontakte/android/fragments/SignupProfileFragment;)F

    move-result v6

    sub-float v13, v2, v6

    .line 296
    .restart local v13    # "bottom":F
    const/high16 v2, 0x3f800000    # 1.0f

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/vkontakte/android/fragments/SignupProfileFragment$4;->this$0:Lcom/vkontakte/android/fragments/SignupProfileFragment;

    invoke-static {v6}, Lcom/vkontakte/android/fragments/SignupProfileFragment;->access$700(Lcom/vkontakte/android/fragments/SignupProfileFragment;)F

    move-result v6

    sub-float v19, v2, v6

    .line 297
    .restart local v19    # "left":F
    const/high16 v2, 0x3f800000    # 1.0f

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/vkontakte/android/fragments/SignupProfileFragment$4;->this$0:Lcom/vkontakte/android/fragments/SignupProfileFragment;

    invoke-static {v6}, Lcom/vkontakte/android/fragments/SignupProfileFragment;->access$900(Lcom/vkontakte/android/fragments/SignupProfileFragment;)F

    move-result v6

    sub-float v23, v2, v6

    .line 299
    .restart local v23    # "right":F
    goto/16 :goto_2

    .line 301
    .end local v13    # "bottom":F
    .end local v19    # "left":F
    .end local v23    # "right":F
    .end local v25    # "top":F
    :sswitch_2
    const/high16 v2, 0x3f800000    # 1.0f

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/vkontakte/android/fragments/SignupProfileFragment$4;->this$0:Lcom/vkontakte/android/fragments/SignupProfileFragment;

    invoke-static {v6}, Lcom/vkontakte/android/fragments/SignupProfileFragment;->access$800(Lcom/vkontakte/android/fragments/SignupProfileFragment;)F

    move-result v6

    sub-float v19, v2, v6

    .line 302
    .restart local v19    # "left":F
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/fragments/SignupProfileFragment$4;->this$0:Lcom/vkontakte/android/fragments/SignupProfileFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/SignupProfileFragment;->access$900(Lcom/vkontakte/android/fragments/SignupProfileFragment;)F

    move-result v25

    .line 303
    .restart local v25    # "top":F
    const/high16 v2, 0x3f800000    # 1.0f

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/vkontakte/android/fragments/SignupProfileFragment$4;->this$0:Lcom/vkontakte/android/fragments/SignupProfileFragment;

    invoke-static {v6}, Lcom/vkontakte/android/fragments/SignupProfileFragment;->access$600(Lcom/vkontakte/android/fragments/SignupProfileFragment;)F

    move-result v6

    sub-float v23, v2, v6

    .line 304
    .restart local v23    # "right":F
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/fragments/SignupProfileFragment$4;->this$0:Lcom/vkontakte/android/fragments/SignupProfileFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/SignupProfileFragment;->access$700(Lcom/vkontakte/android/fragments/SignupProfileFragment;)F

    move-result v13

    .line 306
    .restart local v13    # "bottom":F
    goto/16 :goto_2

    .line 336
    .end local v13    # "bottom":F
    .end local v18    # "fd":Landroid/os/ParcelFileDescriptor;
    .end local v19    # "left":F
    .end local v21    # "opts":Landroid/graphics/BitmapFactory$Options;
    .end local v23    # "right":F
    .end local v25    # "top":F
    :cond_8
    const/4 v12, 0x0

    .restart local v12    # "bmp":Landroid/graphics/Bitmap;
    goto/16 :goto_3

    .line 341
    :cond_9
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/fragments/SignupProfileFragment$4;->this$0:Lcom/vkontakte/android/fragments/SignupProfileFragment;

    invoke-virtual {v2}, Lcom/vkontakte/android/fragments/SignupProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    move-object/from16 v0, p0

    invoke-static {v0, v12}, Lcom/vkontakte/android/fragments/SignupProfileFragment$4$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/fragments/SignupProfileFragment$4;Landroid/graphics/Bitmap;)Ljava/lang/Runnable;

    move-result-object v6

    invoke-virtual {v2, v6}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_1

    goto/16 :goto_4

    .line 242
    .end local v12    # "bmp":Landroid/graphics/Bitmap;
    .restart local v18    # "fd":Landroid/os/ParcelFileDescriptor;
    :catch_2
    move-exception v2

    goto/16 :goto_0

    .line 256
    nop

    :pswitch_data_0
    .packed-switch 0x3
        :pswitch_2
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_0
        :pswitch_3
    .end packed-switch

    .line 285
    :sswitch_data_0
    .sparse-switch
        0x5a -> :sswitch_0
        0xb4 -> :sswitch_1
        0x10e -> :sswitch_2
    .end sparse-switch
.end method
