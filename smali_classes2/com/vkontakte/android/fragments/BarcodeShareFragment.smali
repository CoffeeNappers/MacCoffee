.class public Lcom/vkontakte/android/fragments/BarcodeShareFragment;
.super Landroid/app/DialogFragment;
.source "BarcodeShareFragment.java"

# interfaces
.implements Lcom/vkontakte/android/barcode/DecodeResultListener;
.implements Landroid/view/TextureView$SurfaceTextureListener;


# instance fields
.field private camera:Landroid/hardware/Camera;

.field private decodeRunnable:Lcom/vkontakte/android/barcode/DecodeRunnable;

.field private dismissListener:Landroid/content/DialogInterface$OnDismissListener;

.field private hasSurface:Z

.field private view:Landroid/view/View;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 51
    invoke-direct {p0}, Landroid/app/DialogFragment;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/fragments/BarcodeShareFragment;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/BarcodeShareFragment;

    .prologue
    .line 51
    iget-object v0, p0, Lcom/vkontakte/android/fragments/BarcodeShareFragment;->view:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$100(Lcom/vkontakte/android/fragments/BarcodeShareFragment;)Landroid/hardware/Camera;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/BarcodeShareFragment;

    .prologue
    .line 51
    iget-object v0, p0, Lcom/vkontakte/android/fragments/BarcodeShareFragment;->camera:Landroid/hardware/Camera;

    return-object v0
.end method

.method private initCamera(Landroid/graphics/SurfaceTexture;)V
    .locals 6
    .param p1, "texture"    # Landroid/graphics/SurfaceTexture;

    .prologue
    .line 162
    :try_start_0
    iget-object v2, p0, Lcom/vkontakte/android/fragments/BarcodeShareFragment;->camera:Landroid/hardware/Camera;

    if-eqz v2, :cond_0

    .line 163
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string/jumbo v3, "Camera not null on initialization"

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 169
    :catch_0
    move-exception v1

    .line 170
    .local v1, "t":Ljava/lang/Throwable;
    const-string/jumbo v2, "vk"

    const-string/jumbo v3, "Cannot init camera"

    invoke-static {v2, v3, v1}, Lcom/vkontakte/android/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 171
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/BarcodeShareFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    const v3, 0x7f0801f9

    const/4 v4, 0x0

    invoke-static {v2, v3, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    .line 172
    iget-object v2, p0, Lcom/vkontakte/android/fragments/BarcodeShareFragment;->view:Landroid/view/View;

    new-instance v3, Lcom/vkontakte/android/fragments/BarcodeShareFragment$3;

    invoke-direct {v3, p0}, Lcom/vkontakte/android/fragments/BarcodeShareFragment$3;-><init>(Lcom/vkontakte/android/fragments/BarcodeShareFragment;)V

    const-wide/16 v4, 0xfa

    invoke-virtual {v2, v3, v4, v5}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 197
    .end local v1    # "t":Ljava/lang/Throwable;
    :goto_0
    return-void

    .line 165
    :cond_0
    :try_start_1
    invoke-static {}, Landroid/hardware/Camera;->open()Landroid/hardware/Camera;

    move-result-object v2

    iput-object v2, p0, Lcom/vkontakte/android/fragments/BarcodeShareFragment;->camera:Landroid/hardware/Camera;

    .line 166
    iget-object v2, p0, Lcom/vkontakte/android/fragments/BarcodeShareFragment;->camera:Landroid/hardware/Camera;

    if-nez v2, :cond_1

    .line 167
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string/jumbo v3, "Camera is null"

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0

    .line 181
    :cond_1
    iget-object v2, p0, Lcom/vkontakte/android/fragments/BarcodeShareFragment;->camera:Landroid/hardware/Camera;

    invoke-static {v2}, Lcom/vkontakte/android/barcode/CameraConfigurationManager;->configure(Landroid/hardware/Camera;)V

    .line 184
    :try_start_2
    iget-object v2, p0, Lcom/vkontakte/android/fragments/BarcodeShareFragment;->camera:Landroid/hardware/Camera;

    invoke-virtual {v2, p1}, Landroid/hardware/Camera;->setPreviewTexture(Landroid/graphics/SurfaceTexture;)V

    .line 185
    iget-object v2, p0, Lcom/vkontakte/android/fragments/BarcodeShareFragment;->camera:Landroid/hardware/Camera;

    invoke-virtual {v2}, Landroid/hardware/Camera;->startPreview()V

    .line 186
    iget-object v2, p0, Lcom/vkontakte/android/fragments/BarcodeShareFragment;->camera:Landroid/hardware/Camera;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/hardware/Camera;->autoFocus(Landroid/hardware/Camera$AutoFocusCallback;)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    .line 191
    :goto_1
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/BarcodeShareFragment;->updateCameraRotation()V

    .line 193
    new-instance v2, Lcom/vkontakte/android/barcode/DecodeRunnable;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/BarcodeShareFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    iget-object v4, p0, Lcom/vkontakte/android/fragments/BarcodeShareFragment;->camera:Landroid/hardware/Camera;

    invoke-direct {v2, v3, v4, p0}, Lcom/vkontakte/android/barcode/DecodeRunnable;-><init>(Landroid/app/Activity;Landroid/hardware/Camera;Lcom/vkontakte/android/barcode/DecodeResultListener;)V

    iput-object v2, p0, Lcom/vkontakte/android/fragments/BarcodeShareFragment;->decodeRunnable:Lcom/vkontakte/android/barcode/DecodeRunnable;

    .line 194
    new-instance v2, Ljava/lang/Thread;

    iget-object v3, p0, Lcom/vkontakte/android/fragments/BarcodeShareFragment;->decodeRunnable:Lcom/vkontakte/android/barcode/DecodeRunnable;

    invoke-direct {v2, v3}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    .line 195
    iget-object v2, p0, Lcom/vkontakte/android/fragments/BarcodeShareFragment;->decodeRunnable:Lcom/vkontakte/android/barcode/DecodeRunnable;

    invoke-virtual {v2}, Lcom/vkontakte/android/barcode/DecodeRunnable;->startScanning()V

    goto :goto_0

    .line 187
    :catch_1
    move-exception v0

    .line 188
    .local v0, "e":Ljava/io/IOException;
    const-string/jumbo v2, "vk"

    const-string/jumbo v3, "Cannot start preview"

    invoke-static {v2, v3, v0}, Lcom/vkontakte/android/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1
.end method

.method private updateCameraRotation()V
    .locals 11

    .prologue
    const/4 v10, 0x3

    const/4 v9, 0x2

    const/high16 v8, 0x40a00000    # 5.0f

    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 243
    iget-object v4, p0, Lcom/vkontakte/android/fragments/BarcodeShareFragment;->camera:Landroid/hardware/Camera;

    if-nez v4, :cond_0

    .line 309
    :goto_0
    return-void

    .line 246
    :cond_0
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/BarcodeShareFragment;->getActivity()Landroid/app/Activity;

    move-result-object v4

    const-string/jumbo v7, "window"

    invoke-virtual {v4, v7}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/view/WindowManager;

    invoke-interface {v4}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    .line 247
    .local v0, "display":Landroid/view/Display;
    new-instance v3, Landroid/graphics/Point;

    invoke-direct {v3}, Landroid/graphics/Point;-><init>()V

    .line 248
    .local v3, "size":Landroid/graphics/Point;
    invoke-virtual {v0, v3}, Landroid/view/Display;->getSize(Landroid/graphics/Point;)V

    .line 250
    invoke-virtual {v0}, Landroid/view/Display;->getRotation()I

    move-result v4

    if-eqz v4, :cond_1

    invoke-virtual {v0}, Landroid/view/Display;->getRotation()I

    move-result v4

    if-ne v4, v9, :cond_2

    :cond_1
    iget v4, v3, Landroid/graphics/Point;->x:I

    iget v7, v3, Landroid/graphics/Point;->y:I

    if-lt v4, v7, :cond_4

    :cond_2
    invoke-virtual {v0}, Landroid/view/Display;->getRotation()I

    move-result v4

    if-eq v4, v6, :cond_3

    invoke-virtual {v0}, Landroid/view/Display;->getRotation()I

    move-result v4

    if-ne v4, v10, :cond_8

    :cond_3
    iget v4, v3, Landroid/graphics/Point;->x:I

    iget v7, v3, Landroid/graphics/Point;->y:I

    if-le v4, v7, :cond_8

    .line 251
    :cond_4
    invoke-virtual {v0}, Landroid/view/Display;->getRotation()I

    move-result v4

    if-eq v4, v6, :cond_5

    invoke-virtual {v0}, Landroid/view/Display;->getRotation()I

    move-result v4

    if-ne v4, v10, :cond_7

    :cond_5
    move v2, v6

    .line 252
    .local v2, "horizontal":Z
    :goto_1
    invoke-virtual {v0}, Landroid/view/Display;->getRotation()I

    move-result v4

    packed-switch v4, :pswitch_data_0

    .line 283
    :goto_2
    iget-object v4, p0, Lcom/vkontakte/android/fragments/BarcodeShareFragment;->view:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v4

    new-instance v7, Lcom/vkontakte/android/fragments/BarcodeShareFragment$4;

    invoke-direct {v7, p0, v2}, Lcom/vkontakte/android/fragments/BarcodeShareFragment$4;-><init>(Lcom/vkontakte/android/fragments/BarcodeShareFragment;Z)V

    invoke-virtual {v4, v7}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 306
    iget v4, v3, Landroid/graphics/Point;->x:I

    iget v7, v3, Landroid/graphics/Point;->y:I

    if-le v4, v7, :cond_b

    iget-object v4, p0, Lcom/vkontakte/android/fragments/BarcodeShareFragment;->view:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4}, Lcom/vk/core/util/Screen;->isTablet(Landroid/content/Context;)Z

    move-result v4

    if-nez v4, :cond_b

    move v1, v6

    .line 307
    .local v1, "horLayout":Z
    :goto_3
    iget-object v4, p0, Lcom/vkontakte/android/fragments/BarcodeShareFragment;->view:Landroid/view/View;

    check-cast v4, Landroid/widget/LinearLayout;

    if-eqz v1, :cond_6

    move v6, v5

    :cond_6
    invoke-virtual {v4, v6}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 308
    iget-object v7, p0, Lcom/vkontakte/android/fragments/BarcodeShareFragment;->view:Landroid/view/View;

    if-eqz v2, :cond_c

    invoke-static {v8}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v4

    move v6, v4

    :goto_4
    if-eqz v1, :cond_d

    move v4, v5

    :goto_5
    invoke-virtual {v7, v5, v5, v6, v4}, Landroid/view/View;->setPadding(IIII)V

    goto/16 :goto_0

    .end local v1    # "horLayout":Z
    .end local v2    # "horizontal":Z
    :cond_7
    move v2, v5

    .line 251
    goto :goto_1

    .line 254
    .restart local v2    # "horizontal":Z
    :pswitch_0
    iget-object v4, p0, Lcom/vkontakte/android/fragments/BarcodeShareFragment;->camera:Landroid/hardware/Camera;

    const/16 v7, 0x5a

    invoke-virtual {v4, v7}, Landroid/hardware/Camera;->setDisplayOrientation(I)V

    goto :goto_2

    .line 257
    :pswitch_1
    iget-object v4, p0, Lcom/vkontakte/android/fragments/BarcodeShareFragment;->camera:Landroid/hardware/Camera;

    invoke-virtual {v4, v5}, Landroid/hardware/Camera;->setDisplayOrientation(I)V

    goto :goto_2

    .line 260
    :pswitch_2
    iget-object v4, p0, Lcom/vkontakte/android/fragments/BarcodeShareFragment;->camera:Landroid/hardware/Camera;

    const/16 v7, 0x10e

    invoke-virtual {v4, v7}, Landroid/hardware/Camera;->setDisplayOrientation(I)V

    goto :goto_2

    .line 263
    :pswitch_3
    iget-object v4, p0, Lcom/vkontakte/android/fragments/BarcodeShareFragment;->camera:Landroid/hardware/Camera;

    const/16 v7, 0xb4

    invoke-virtual {v4, v7}, Landroid/hardware/Camera;->setDisplayOrientation(I)V

    goto :goto_2

    .line 267
    .end local v2    # "horizontal":Z
    :cond_8
    invoke-virtual {v0}, Landroid/view/Display;->getRotation()I

    move-result v4

    if-eqz v4, :cond_9

    invoke-virtual {v0}, Landroid/view/Display;->getRotation()I

    move-result v4

    if-ne v4, v9, :cond_a

    :cond_9
    move v2, v6

    .line 268
    .restart local v2    # "horizontal":Z
    :goto_6
    invoke-virtual {v0}, Landroid/view/Display;->getRotation()I

    move-result v4

    packed-switch v4, :pswitch_data_1

    goto :goto_2

    .line 270
    :pswitch_4
    iget-object v4, p0, Lcom/vkontakte/android/fragments/BarcodeShareFragment;->camera:Landroid/hardware/Camera;

    invoke-virtual {v4, v5}, Landroid/hardware/Camera;->setDisplayOrientation(I)V

    goto :goto_2

    .end local v2    # "horizontal":Z
    :cond_a
    move v2, v5

    .line 267
    goto :goto_6

    .line 273
    .restart local v2    # "horizontal":Z
    :pswitch_5
    iget-object v4, p0, Lcom/vkontakte/android/fragments/BarcodeShareFragment;->camera:Landroid/hardware/Camera;

    const/16 v7, 0x10e

    invoke-virtual {v4, v7}, Landroid/hardware/Camera;->setDisplayOrientation(I)V

    goto :goto_2

    .line 276
    :pswitch_6
    iget-object v4, p0, Lcom/vkontakte/android/fragments/BarcodeShareFragment;->camera:Landroid/hardware/Camera;

    const/16 v7, 0xb4

    invoke-virtual {v4, v7}, Landroid/hardware/Camera;->setDisplayOrientation(I)V

    goto/16 :goto_2

    .line 279
    :pswitch_7
    iget-object v4, p0, Lcom/vkontakte/android/fragments/BarcodeShareFragment;->camera:Landroid/hardware/Camera;

    const/16 v7, 0x5a

    invoke-virtual {v4, v7}, Landroid/hardware/Camera;->setDisplayOrientation(I)V

    goto/16 :goto_2

    :cond_b
    move v1, v5

    .line 306
    goto :goto_3

    .restart local v1    # "horLayout":Z
    :cond_c
    move v6, v5

    .line 308
    goto :goto_4

    :cond_d
    invoke-static {v8}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v4

    goto :goto_5

    .line 252
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch

    .line 268
    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
    .end packed-switch
.end method


# virtual methods
.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 0
    .param p1, "newConfig"    # Landroid/content/res/Configuration;

    .prologue
    .line 156
    invoke-super {p0, p1}, Landroid/app/DialogFragment;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 157
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/BarcodeShareFragment;->updateCameraRotation()V

    .line 158
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 61
    invoke-super {p0, p1}, Landroid/app/DialogFragment;->onCreate(Landroid/os/Bundle;)V

    .line 62
    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/fragments/BarcodeShareFragment;->setStyle(II)V

    .line 63
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 23
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 67
    const v5, 0x7f030063

    const/4 v6, 0x0

    move-object/from16 v0, p1

    invoke-virtual {v0, v5, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v5

    move-object/from16 v0, p0

    iput-object v5, v0, Lcom/vkontakte/android/fragments/BarcodeShareFragment;->view:Landroid/view/View;

    .line 69
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/vkontakte/android/fragments/BarcodeShareFragment;->view:Landroid/view/View;

    new-instance v6, Lcom/vkontakte/android/fragments/BarcodeShareFragment$1;

    move-object/from16 v0, p0

    invoke-direct {v6, v0}, Lcom/vkontakte/android/fragments/BarcodeShareFragment$1;-><init>(Lcom/vkontakte/android/fragments/BarcodeShareFragment;)V

    const-wide/16 v12, 0x7d0

    invoke-virtual {v5, v6, v12, v13}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 79
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/vkontakte/android/fragments/BarcodeShareFragment;->view:Landroid/view/View;

    const v6, 0x7f10024a

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v21

    check-cast v21, Landroid/widget/ImageView;

    .line 81
    .local v21, "myCode":Landroid/widget/ImageView;
    :try_start_0
    new-instance v9, Ljava/util/HashMap;

    invoke-direct {v9}, Ljava/util/HashMap;-><init>()V

    .line 82
    .local v9, "hints":Ljava/util/Map;, "Ljava/util/Map<Lcom/google/zxing/EncodeHintType;Ljava/lang/Object;>;"
    sget-object v5, Lcom/google/zxing/EncodeHintType;->MARGIN:Lcom/google/zxing/EncodeHintType;

    const/4 v6, 0x0

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-interface {v9, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 83
    new-instance v4, Lcom/google/zxing/qrcode/QRCodeWriter;

    invoke-direct {v4}, Lcom/google/zxing/qrcode/QRCodeWriter;-><init>()V

    .line 84
    .local v4, "writer":Lcom/google/zxing/qrcode/QRCodeWriter;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "http://vk.com/id"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v6

    invoke-virtual {v6}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    sget-object v6, Lcom/google/zxing/BarcodeFormat;->QR_CODE:Lcom/google/zxing/BarcodeFormat;

    const/16 v7, 0xb4

    const/16 v8, 0xb4

    invoke-virtual/range {v4 .. v9}, Lcom/google/zxing/qrcode/QRCodeWriter;->encode(Ljava/lang/String;Lcom/google/zxing/BarcodeFormat;IILjava/util/Map;)Lcom/google/zxing/common/BitMatrix;

    move-result-object v20

    .line 85
    .local v20, "matrix":Lcom/google/zxing/common/BitMatrix;
    invoke-virtual/range {v20 .. v20}, Lcom/google/zxing/common/BitMatrix;->getWidth()I

    move-result v5

    invoke-virtual/range {v20 .. v20}, Lcom/google/zxing/common/BitMatrix;->getHeight()I

    move-result v6

    mul-int/2addr v5, v6

    new-array v11, v5, [I

    .line 86
    .local v11, "pixels":[I
    invoke-virtual/range {v20 .. v20}, Lcom/google/zxing/common/BitMatrix;->getWidth()I

    move-result v5

    invoke-virtual/range {v20 .. v20}, Lcom/google/zxing/common/BitMatrix;->getHeight()I

    move-result v6

    sget-object v7, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v5, v6, v7}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v10

    .line 87
    .local v10, "bitmap":Landroid/graphics/Bitmap;
    const/16 v18, 0x0

    .local v18, "i":I
    :goto_0
    invoke-virtual/range {v20 .. v20}, Lcom/google/zxing/common/BitMatrix;->getHeight()I

    move-result v5

    move/from16 v0, v18

    if-ge v0, v5, :cond_2

    .line 88
    const/16 v19, 0x0

    .local v19, "j":I
    :goto_1
    invoke-virtual/range {v20 .. v20}, Lcom/google/zxing/common/BitMatrix;->getWidth()I

    move-result v5

    move/from16 v0, v19

    if-ge v0, v5, :cond_1

    .line 89
    invoke-virtual {v10}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v5

    mul-int v5, v5, v18

    add-int v6, v5, v19

    move-object/from16 v0, v20

    move/from16 v1, v18

    move/from16 v2, v19

    invoke-virtual {v0, v1, v2}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v5

    if-eqz v5, :cond_0

    const/high16 v5, -0x1000000

    :goto_2
    aput v5, v11, v6

    .line 88
    add-int/lit8 v19, v19, 0x1

    goto :goto_1

    .line 89
    :cond_0
    const/4 v5, -0x1

    goto :goto_2

    .line 87
    :cond_1
    add-int/lit8 v18, v18, 0x1

    goto :goto_0

    .line 92
    .end local v19    # "j":I
    :cond_2
    const/4 v12, 0x0

    invoke-virtual/range {v20 .. v20}, Lcom/google/zxing/common/BitMatrix;->getWidth()I

    move-result v13

    const/4 v14, 0x0

    const/4 v15, 0x0

    invoke-virtual/range {v20 .. v20}, Lcom/google/zxing/common/BitMatrix;->getWidth()I

    move-result v16

    invoke-virtual/range {v20 .. v20}, Lcom/google/zxing/common/BitMatrix;->getHeight()I

    move-result v17

    invoke-virtual/range {v10 .. v17}, Landroid/graphics/Bitmap;->setPixels([IIIIIII)V

    .line 93
    move-object/from16 v0, v21

    invoke-virtual {v0, v10}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 98
    .end local v4    # "writer":Lcom/google/zxing/qrcode/QRCodeWriter;
    .end local v9    # "hints":Ljava/util/Map;, "Ljava/util/Map<Lcom/google/zxing/EncodeHintType;Ljava/lang/Object;>;"
    .end local v10    # "bitmap":Landroid/graphics/Bitmap;
    .end local v11    # "pixels":[I
    .end local v18    # "i":I
    .end local v20    # "matrix":Lcom/google/zxing/common/BitMatrix;
    :goto_3
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/vkontakte/android/fragments/BarcodeShareFragment;->view:Landroid/view/View;

    return-object v5

    .line 94
    :catch_0
    move-exception v22

    .line 95
    .local v22, "x":Ljava/lang/Exception;
    const-string/jumbo v5, "vk"

    move-object/from16 v0, v22

    invoke-static {v5, v0}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_3
.end method

.method public onDecodeResult(Lcom/google/zxing/Result;)V
    .locals 5
    .param p1, "result"    # Lcom/google/zxing/Result;

    .prologue
    .line 202
    invoke-virtual {p1}, Lcom/google/zxing/Result;->getText()Ljava/lang/String;

    move-result-object v2

    .line 203
    .local v2, "text":Ljava/lang/String;
    const-string/jumbo v3, "http://vk\\.com/id[0-9]+"

    invoke-virtual {v2, v3}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 204
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/BarcodeShareFragment;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v3

    invoke-virtual {v3}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object v3

    invoke-virtual {v3, p0}, Landroid/app/FragmentTransaction;->remove(Landroid/app/Fragment;)Landroid/app/FragmentTransaction;

    move-result-object v3

    invoke-virtual {v3}, Landroid/app/FragmentTransaction;->commit()I

    .line 205
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/BarcodeShareFragment;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v3

    const-string/jumbo v4, "nearby_dlg"

    invoke-virtual {v3, v4}, Landroid/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/app/Fragment;

    move-result-object v1

    .line 206
    .local v1, "nearby":Landroid/app/Fragment;
    if-eqz v1, :cond_0

    .line 207
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/BarcodeShareFragment;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v3

    invoke-virtual {v3}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object v3

    invoke-virtual {v3, v1}, Landroid/app/FragmentTransaction;->remove(Landroid/app/Fragment;)Landroid/app/FragmentTransaction;

    move-result-object v3

    invoke-virtual {v3}, Landroid/app/FragmentTransaction;->commit()I

    .line 209
    :cond_0
    new-instance v0, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/BarcodeShareFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    const-class v4, Lcom/vkontakte/android/LinkRedirActivity;

    invoke-direct {v0, v3, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 210
    .local v0, "intent":Landroid/content/Intent;
    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 211
    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/BarcodeShareFragment;->startActivity(Landroid/content/Intent;)V

    .line 217
    .end local v0    # "intent":Landroid/content/Intent;
    .end local v1    # "nearby":Landroid/app/Fragment;
    :cond_1
    :goto_0
    return-void

    .line 213
    :cond_2
    iget-object v3, p0, Lcom/vkontakte/android/fragments/BarcodeShareFragment;->decodeRunnable:Lcom/vkontakte/android/barcode/DecodeRunnable;

    if-eqz v3, :cond_1

    .line 214
    iget-object v3, p0, Lcom/vkontakte/android/fragments/BarcodeShareFragment;->decodeRunnable:Lcom/vkontakte/android/barcode/DecodeRunnable;

    invoke-virtual {v3}, Lcom/vkontakte/android/barcode/DecodeRunnable;->startScanning()V

    goto :goto_0
.end method

.method public onDestroyView()V
    .locals 1

    .prologue
    .line 103
    invoke-super {p0}, Landroid/app/DialogFragment;->onDestroyView()V

    .line 104
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/BarcodeShareFragment;->view:Landroid/view/View;

    .line 105
    return-void
.end method

.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 1
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 313
    invoke-super {p0, p1}, Landroid/app/DialogFragment;->onDismiss(Landroid/content/DialogInterface;)V

    .line 314
    iget-object v0, p0, Lcom/vkontakte/android/fragments/BarcodeShareFragment;->dismissListener:Landroid/content/DialogInterface$OnDismissListener;

    if-eqz v0, :cond_0

    .line 315
    iget-object v0, p0, Lcom/vkontakte/android/fragments/BarcodeShareFragment;->dismissListener:Landroid/content/DialogInterface$OnDismissListener;

    invoke-interface {v0, p1}, Landroid/content/DialogInterface$OnDismissListener;->onDismiss(Landroid/content/DialogInterface;)V

    .line 317
    :cond_0
    return-void
.end method

.method public onPause()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 136
    iget-object v1, p0, Lcom/vkontakte/android/fragments/BarcodeShareFragment;->decodeRunnable:Lcom/vkontakte/android/barcode/DecodeRunnable;

    if-eqz v1, :cond_0

    .line 137
    iget-object v1, p0, Lcom/vkontakte/android/fragments/BarcodeShareFragment;->decodeRunnable:Lcom/vkontakte/android/barcode/DecodeRunnable;

    invoke-virtual {v1}, Lcom/vkontakte/android/barcode/DecodeRunnable;->stop()V

    .line 138
    iput-object v3, p0, Lcom/vkontakte/android/fragments/BarcodeShareFragment;->decodeRunnable:Lcom/vkontakte/android/barcode/DecodeRunnable;

    .line 140
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/fragments/BarcodeShareFragment;->camera:Landroid/hardware/Camera;

    if-eqz v1, :cond_1

    .line 141
    iget-object v1, p0, Lcom/vkontakte/android/fragments/BarcodeShareFragment;->camera:Landroid/hardware/Camera;

    invoke-virtual {v1}, Landroid/hardware/Camera;->stopPreview()V

    .line 142
    iget-object v1, p0, Lcom/vkontakte/android/fragments/BarcodeShareFragment;->camera:Landroid/hardware/Camera;

    invoke-virtual {v1}, Landroid/hardware/Camera;->release()V

    .line 143
    iput-object v3, p0, Lcom/vkontakte/android/fragments/BarcodeShareFragment;->camera:Landroid/hardware/Camera;

    .line 149
    :cond_1
    iget-object v1, p0, Lcom/vkontakte/android/fragments/BarcodeShareFragment;->view:Landroid/view/View;

    const v2, 0x7f100248

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/TextureView;

    .line 150
    .local v0, "textureView":Landroid/view/TextureView;
    invoke-virtual {v0, v3}, Landroid/view/TextureView;->setSurfaceTextureListener(Landroid/view/TextureView$SurfaceTextureListener;)V

    .line 151
    invoke-super {p0}, Landroid/app/DialogFragment;->onPause()V

    .line 152
    return-void
.end method

.method public onResume()V
    .locals 5

    .prologue
    const v4, 0x3f800008    # 1.000001f

    .line 109
    invoke-super {p0}, Landroid/app/DialogFragment;->onResume()V

    .line 110
    iget-object v2, p0, Lcom/vkontakte/android/fragments/BarcodeShareFragment;->view:Landroid/view/View;

    const v3, 0x7f100248

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/view/TextureView;

    .line 111
    .local v1, "textureView":Landroid/view/TextureView;
    invoke-virtual {v1, v4}, Landroid/view/TextureView;->setScaleX(F)V

    .line 112
    invoke-virtual {v1, v4}, Landroid/view/TextureView;->setScaleY(F)V

    .line 113
    invoke-virtual {v1}, Landroid/view/TextureView;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    move-result-object v0

    .line 114
    .local v0, "texture":Landroid/graphics/SurfaceTexture;
    new-instance v2, Lcom/vkontakte/android/fragments/BarcodeShareFragment$2;

    invoke-direct {v2, p0}, Lcom/vkontakte/android/fragments/BarcodeShareFragment$2;-><init>(Lcom/vkontakte/android/fragments/BarcodeShareFragment;)V

    invoke-virtual {v1, v2}, Landroid/view/TextureView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 126
    iget-boolean v2, p0, Lcom/vkontakte/android/fragments/BarcodeShareFragment;->hasSurface:Z

    if-eqz v2, :cond_0

    .line 127
    invoke-direct {p0, v0}, Lcom/vkontakte/android/fragments/BarcodeShareFragment;->initCamera(Landroid/graphics/SurfaceTexture;)V

    .line 132
    :goto_0
    return-void

    .line 129
    :cond_0
    invoke-virtual {v1, p0}, Landroid/view/TextureView;->setSurfaceTextureListener(Landroid/view/TextureView$SurfaceTextureListener;)V

    goto :goto_0
.end method

.method public onSurfaceTextureAvailable(Landroid/graphics/SurfaceTexture;II)V
    .locals 2
    .param p1, "surface"    # Landroid/graphics/SurfaceTexture;
    .param p2, "width"    # I
    .param p3, "height"    # I

    .prologue
    .line 220
    const-string/jumbo v0, "vk"

    const-string/jumbo v1, "Surface created"

    invoke-static {v0, v1}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 222
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/BarcodeShareFragment;->hasSurface:Z

    if-nez v0, :cond_0

    .line 223
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/BarcodeShareFragment;->hasSurface:Z

    .line 224
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/BarcodeShareFragment;->initCamera(Landroid/graphics/SurfaceTexture;)V

    .line 226
    :cond_0
    return-void
.end method

.method public onSurfaceTextureDestroyed(Landroid/graphics/SurfaceTexture;)Z
    .locals 1
    .param p1, "surface"    # Landroid/graphics/SurfaceTexture;

    .prologue
    .line 234
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/BarcodeShareFragment;->hasSurface:Z

    .line 235
    const/4 v0, 0x1

    return v0
.end method

.method public onSurfaceTextureSizeChanged(Landroid/graphics/SurfaceTexture;II)V
    .locals 0
    .param p1, "surface"    # Landroid/graphics/SurfaceTexture;
    .param p2, "width"    # I
    .param p3, "height"    # I

    .prologue
    .line 230
    return-void
.end method

.method public onSurfaceTextureUpdated(Landroid/graphics/SurfaceTexture;)V
    .locals 0
    .param p1, "surface"    # Landroid/graphics/SurfaceTexture;

    .prologue
    .line 240
    return-void
.end method

.method public setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V
    .locals 0
    .param p1, "l"    # Landroid/content/DialogInterface$OnDismissListener;

    .prologue
    .line 320
    iput-object p1, p0, Lcom/vkontakte/android/fragments/BarcodeShareFragment;->dismissListener:Landroid/content/DialogInterface$OnDismissListener;

    .line 321
    return-void
.end method
