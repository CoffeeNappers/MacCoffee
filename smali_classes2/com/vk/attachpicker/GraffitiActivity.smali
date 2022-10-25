.class public Lcom/vk/attachpicker/GraffitiActivity;
.super Lcom/vkontakte/android/VKActivity;
.source "GraffitiActivity.java"


# static fields
.field private static final SIZE:I = 0x2d0


# instance fields
.field private colorSelectorView:Lcom/vk/attachpicker/widget/ColorSelectorView;

.field private drawingCancel:Landroid/view/View;

.field private drawingContainer:Landroid/widget/FrameLayout;

.field private drawingEraser:Landroid/widget/ImageView;

.field private drawingSend:Landroid/view/View;

.field private drawingUndo:Landroid/view/View;

.field private drawingView:Lcom/vk/attachpicker/drawing/DrawingView;

.field private drawingWidthButton:Landroid/widget/ImageView;

.field private final exitLock:Lcom/vk/core/util/TimeoutLock;

.field private graffitiAvatar:Ljava/lang/String;

.field private graffitiBitmap:Landroid/graphics/Bitmap;

.field private graffitiContainer:Landroid/view/View;

.field private graffitiTitle:Ljava/lang/String;

.field private imagePreview:Lcom/vk/imageloader/view/VKImageView;

.field private innerUserContainer:Landroid/widget/LinearLayout;

.field private lastOrientation:I

.field private final orientationChangeHandler:Landroid/os/Handler;

.field private final orientationChangeRunnable:Ljava/lang/Runnable;

.field private orientationEventListener:Landroid/view/OrientationEventListener;

.field private preview:Landroid/view/View;

.field private resultContainer:Lcom/vk/attachpicker/widget/RotateLayout;

.field private sendButton:Landroid/widget/TextView;

.field private userAvatar:Landroid/widget/ImageView;

.field private userContainer:Landroid/widget/FrameLayout;

.field private userName:Landroid/widget/TextView;


# direct methods
.method public constructor <init>()V
    .locals 4

    .prologue
    .line 43
    invoke-direct {p0}, Lcom/vkontakte/android/VKActivity;-><init>()V

    .line 47
    new-instance v0, Lcom/vk/core/util/TimeoutLock;

    const-wide/16 v2, 0x12c

    invoke-direct {v0, v2, v3}, Lcom/vk/core/util/TimeoutLock;-><init>(J)V

    iput-object v0, p0, Lcom/vk/attachpicker/GraffitiActivity;->exitLock:Lcom/vk/core/util/TimeoutLock;

    .line 54
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/vk/attachpicker/GraffitiActivity;->orientationChangeHandler:Landroid/os/Handler;

    .line 55
    invoke-static {p0}, Lcom/vk/attachpicker/GraffitiActivity$$Lambda$1;->lambdaFactory$(Lcom/vk/attachpicker/GraffitiActivity;)Ljava/lang/Runnable;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/attachpicker/GraffitiActivity;->orientationChangeRunnable:Ljava/lang/Runnable;

    return-void
.end method

.method static synthetic access$000(Lcom/vk/attachpicker/GraffitiActivity;I)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/attachpicker/GraffitiActivity;
    .param p1, "x1"    # I

    .prologue
    .line 43
    invoke-direct {p0, p1}, Lcom/vk/attachpicker/GraffitiActivity;->onOrientationEvent(I)V

    return-void
.end method

.method static synthetic access$100(Lcom/vk/attachpicker/GraffitiActivity;)Lcom/vk/attachpicker/drawing/DrawingView;
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/GraffitiActivity;

    .prologue
    .line 43
    iget-object v0, p0, Lcom/vk/attachpicker/GraffitiActivity;->drawingView:Lcom/vk/attachpicker/drawing/DrawingView;

    return-object v0
.end method

.method static synthetic access$200(Lcom/vk/attachpicker/GraffitiActivity;II)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/attachpicker/GraffitiActivity;
    .param p1, "x1"    # I
    .param p2, "x2"    # I

    .prologue
    .line 43
    invoke-direct {p0, p1, p2}, Lcom/vk/attachpicker/GraffitiActivity;->setEraserModeDisabled(II)V

    return-void
.end method

.method static synthetic access$300(Lcom/vk/attachpicker/GraffitiActivity;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/GraffitiActivity;

    .prologue
    .line 43
    iget-object v0, p0, Lcom/vk/attachpicker/GraffitiActivity;->drawingUndo:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$400(Lcom/vk/attachpicker/GraffitiActivity;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/GraffitiActivity;

    .prologue
    .line 43
    iget-object v0, p0, Lcom/vk/attachpicker/GraffitiActivity;->drawingSend:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$500(Lcom/vk/attachpicker/GraffitiActivity;)Lcom/vk/attachpicker/widget/RotateLayout;
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/GraffitiActivity;

    .prologue
    .line 43
    iget-object v0, p0, Lcom/vk/attachpicker/GraffitiActivity;->resultContainer:Lcom/vk/attachpicker/widget/RotateLayout;

    return-object v0
.end method

.method private handleOrientationChange()V
    .locals 6

    .prologue
    const/4 v5, 0x0

    .line 247
    iget-object v2, p0, Lcom/vk/attachpicker/GraffitiActivity;->resultContainer:Lcom/vk/attachpicker/widget/RotateLayout;

    iget v3, p0, Lcom/vk/attachpicker/GraffitiActivity;->lastOrientation:I

    neg-int v3, v3

    invoke-virtual {v2, v3}, Lcom/vk/attachpicker/widget/RotateLayout;->setAngle(I)V

    .line 249
    iget-object v2, p0, Lcom/vk/attachpicker/GraffitiActivity;->drawingCancel:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v2

    iget v3, p0, Lcom/vk/attachpicker/GraffitiActivity;->lastOrientation:I

    int-to-float v3, v3

    invoke-virtual {v2, v3}, Landroid/view/ViewPropertyAnimator;->rotation(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 250
    iget-object v2, p0, Lcom/vk/attachpicker/GraffitiActivity;->drawingSend:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v2

    iget v3, p0, Lcom/vk/attachpicker/GraffitiActivity;->lastOrientation:I

    int-to-float v3, v3

    invoke-virtual {v2, v3}, Landroid/view/ViewPropertyAnimator;->rotation(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 251
    iget-object v2, p0, Lcom/vk/attachpicker/GraffitiActivity;->drawingWidthButton:Landroid/widget/ImageView;

    invoke-virtual {v2}, Landroid/widget/ImageView;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v2

    iget v3, p0, Lcom/vk/attachpicker/GraffitiActivity;->lastOrientation:I

    int-to-float v3, v3

    invoke-virtual {v2, v3}, Landroid/view/ViewPropertyAnimator;->rotation(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 252
    iget-object v2, p0, Lcom/vk/attachpicker/GraffitiActivity;->drawingUndo:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v2

    iget v3, p0, Lcom/vk/attachpicker/GraffitiActivity;->lastOrientation:I

    int-to-float v3, v3

    invoke-virtual {v2, v3}, Landroid/view/ViewPropertyAnimator;->rotation(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 253
    iget-object v2, p0, Lcom/vk/attachpicker/GraffitiActivity;->drawingEraser:Landroid/widget/ImageView;

    invoke-virtual {v2}, Landroid/widget/ImageView;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v2

    iget v3, p0, Lcom/vk/attachpicker/GraffitiActivity;->lastOrientation:I

    int-to-float v3, v3

    invoke-virtual {v2, v3}, Landroid/view/ViewPropertyAnimator;->rotation(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 255
    iget-object v2, p0, Lcom/vk/attachpicker/GraffitiActivity;->userAvatar:Landroid/widget/ImageView;

    invoke-virtual {v2}, Landroid/widget/ImageView;->getWidth()I

    move-result v2

    if-lez v2, :cond_0

    iget-object v2, p0, Lcom/vk/attachpicker/GraffitiActivity;->userName:Landroid/widget/TextView;

    invoke-virtual {v2}, Landroid/widget/TextView;->getWidth()I

    move-result v2

    if-lez v2, :cond_0

    .line 257
    iget v2, p0, Lcom/vk/attachpicker/GraffitiActivity;->lastOrientation:I

    rem-int/lit16 v2, v2, 0xb4

    if-nez v2, :cond_1

    .line 258
    iget-object v2, p0, Lcom/vk/attachpicker/GraffitiActivity;->userAvatar:Landroid/widget/ImageView;

    invoke-virtual {v2}, Landroid/widget/ImageView;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v2

    iget v3, p0, Lcom/vk/attachpicker/GraffitiActivity;->lastOrientation:I

    int-to-float v3, v3

    .line 259
    invoke-virtual {v2, v3}, Landroid/view/ViewPropertyAnimator;->rotation(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v2

    .line 260
    invoke-virtual {v2, v5}, Landroid/view/ViewPropertyAnimator;->translationX(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v2

    .line 261
    invoke-virtual {v2}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 262
    iget-object v2, p0, Lcom/vk/attachpicker/GraffitiActivity;->userName:Landroid/widget/TextView;

    invoke-virtual {v2}, Landroid/widget/TextView;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v2

    .line 263
    invoke-virtual {v2, v5}, Landroid/view/ViewPropertyAnimator;->translationX(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v2

    const/high16 v3, 0x3f800000    # 1.0f

    .line 264
    invoke-virtual {v2, v3}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v2

    .line 265
    invoke-virtual {v2}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 280
    :cond_0
    :goto_0
    return-void

    .line 267
    :cond_1
    iget-object v2, p0, Lcom/vk/attachpicker/GraffitiActivity;->innerUserContainer:Landroid/widget/LinearLayout;

    invoke-virtual {v2}, Landroid/widget/LinearLayout;->getWidth()I

    move-result v2

    div-int/lit8 v2, v2, 0x2

    iget-object v3, p0, Lcom/vk/attachpicker/GraffitiActivity;->userAvatar:Landroid/widget/ImageView;

    invoke-virtual {v3}, Landroid/widget/ImageView;->getLeft()I

    move-result v3

    iget-object v4, p0, Lcom/vk/attachpicker/GraffitiActivity;->userAvatar:Landroid/widget/ImageView;

    invoke-virtual {v4}, Landroid/widget/ImageView;->getWidth()I

    move-result v4

    div-int/lit8 v4, v4, 0x2

    add-int/2addr v3, v4

    sub-int/2addr v2, v3

    int-to-float v0, v2

    .line 268
    .local v0, "avatarTranslation":F
    iget-object v2, p0, Lcom/vk/attachpicker/GraffitiActivity;->innerUserContainer:Landroid/widget/LinearLayout;

    invoke-virtual {v2}, Landroid/widget/LinearLayout;->getWidth()I

    move-result v2

    div-int/lit8 v2, v2, 0x2

    iget-object v3, p0, Lcom/vk/attachpicker/GraffitiActivity;->userName:Landroid/widget/TextView;

    invoke-virtual {v3}, Landroid/widget/TextView;->getLeft()I

    move-result v3

    iget-object v4, p0, Lcom/vk/attachpicker/GraffitiActivity;->userName:Landroid/widget/TextView;

    invoke-virtual {v4}, Landroid/widget/TextView;->getWidth()I

    move-result v4

    div-int/lit8 v4, v4, 0x2

    add-int/2addr v3, v4

    sub-int/2addr v2, v3

    int-to-float v1, v2

    .line 270
    .local v1, "nameTranslation":F
    iget-object v2, p0, Lcom/vk/attachpicker/GraffitiActivity;->userAvatar:Landroid/widget/ImageView;

    invoke-virtual {v2}, Landroid/widget/ImageView;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v2

    iget v3, p0, Lcom/vk/attachpicker/GraffitiActivity;->lastOrientation:I

    int-to-float v3, v3

    .line 271
    invoke-virtual {v2, v3}, Landroid/view/ViewPropertyAnimator;->rotation(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v2

    .line 272
    invoke-virtual {v2, v0}, Landroid/view/ViewPropertyAnimator;->translationX(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v2

    .line 273
    invoke-virtual {v2}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 274
    iget-object v2, p0, Lcom/vk/attachpicker/GraffitiActivity;->userName:Landroid/widget/TextView;

    invoke-virtual {v2}, Landroid/widget/TextView;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v2

    .line 275
    invoke-virtual {v2, v1}, Landroid/view/ViewPropertyAnimator;->translationX(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v2

    .line 276
    invoke-virtual {v2, v5}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v2

    .line 277
    invoke-virtual {v2}, Landroid/view/ViewPropertyAnimator;->start()V

    goto :goto_0
.end method

.method static synthetic lambda$finish$14(Landroid/content/DialogInterface;I)V
    .locals 0
    .param p0, "dialog"    # Landroid/content/DialogInterface;
    .param p1, "which"    # I

    .prologue
    .line 405
    invoke-interface {p0}, Landroid/content/DialogInterface;->dismiss()V

    return-void
.end method

.method static synthetic lambda$onCreate$11(Ljava/lang/Throwable;)V
    .locals 0
    .param p0, "throwable"    # Ljava/lang/Throwable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 197
    return-void
.end method

.method static synthetic lambda$onCreate$7(Landroid/view/View;)V
    .locals 0
    .param p0, "v"    # Landroid/view/View;

    .prologue
    .line 182
    return-void
.end method

.method private onOrientationEvent(I)V
    .locals 6
    .param p1, "deg"    # I

    .prologue
    .line 223
    invoke-static {p0}, Lcom/vkontakte/android/ViewUtils;->getDeviceDegreesInPortraitMode(Landroid/content/Context;)I

    move-result v2

    sub-int/2addr p1, v2

    .line 224
    if-ltz p1, :cond_2

    .line 225
    rem-int/lit8 v1, p1, 0x5a

    .line 227
    .local v1, "tmpDeg":I
    const/16 v2, 0x2d

    if-ge v1, v2, :cond_3

    .line 228
    sub-int v0, p1, v1

    .line 232
    .local v0, "realDeg":I
    :goto_0
    rem-int/lit16 v0, v0, 0x168

    .line 233
    const/16 v2, 0xb4

    if-le v0, v2, :cond_0

    .line 234
    add-int/lit16 v0, v0, -0x168

    .line 236
    :cond_0
    mul-int/lit8 v0, v0, -0x1

    .line 238
    iget v2, p0, Lcom/vk/attachpicker/GraffitiActivity;->lastOrientation:I

    if-eq v0, v2, :cond_1

    .line 239
    iget-object v2, p0, Lcom/vk/attachpicker/GraffitiActivity;->orientationChangeHandler:Landroid/os/Handler;

    iget-object v3, p0, Lcom/vk/attachpicker/GraffitiActivity;->orientationChangeRunnable:Ljava/lang/Runnable;

    invoke-virtual {v2, v3}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 240
    iget-object v2, p0, Lcom/vk/attachpicker/GraffitiActivity;->orientationChangeHandler:Landroid/os/Handler;

    iget-object v3, p0, Lcom/vk/attachpicker/GraffitiActivity;->orientationChangeRunnable:Ljava/lang/Runnable;

    const-wide/16 v4, 0x12c

    invoke-virtual {v2, v3, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 242
    :cond_1
    iput v0, p0, Lcom/vk/attachpicker/GraffitiActivity;->lastOrientation:I

    .line 244
    .end local v0    # "realDeg":I
    .end local v1    # "tmpDeg":I
    :cond_2
    return-void

    .line 230
    .restart local v1    # "tmpDeg":I
    :cond_3
    add-int/lit8 v2, p1, 0x5a

    sub-int v0, v2, v1

    .restart local v0    # "realDeg":I
    goto :goto_0
.end method

.method private setEraserModeDisabled(II)V
    .locals 2
    .param p1, "brushType"    # I
    .param p2, "color"    # I

    .prologue
    .line 217
    iget-object v0, p0, Lcom/vk/attachpicker/GraffitiActivity;->drawingView:Lcom/vk/attachpicker/drawing/DrawingView;

    invoke-virtual {v0, p1}, Lcom/vk/attachpicker/drawing/DrawingView;->setBrushType(I)V

    .line 218
    iget-object v0, p0, Lcom/vk/attachpicker/GraffitiActivity;->colorSelectorView:Lcom/vk/attachpicker/widget/ColorSelectorView;

    invoke-virtual {v0, p2}, Lcom/vk/attachpicker/widget/ColorSelectorView;->setSelectedColor(I)V

    .line 219
    iget-object v0, p0, Lcom/vk/attachpicker/GraffitiActivity;->drawingEraser:Landroid/widget/ImageView;

    const v1, 0x7f0f00ba

    invoke-static {p0, v1}, Landroid/support/v4/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setColorFilter(I)V

    .line 220
    return-void
.end method

.method private setEraserModeEnabled()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 211
    iget-object v0, p0, Lcom/vk/attachpicker/GraffitiActivity;->drawingView:Lcom/vk/attachpicker/drawing/DrawingView;

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/drawing/DrawingView;->setBrushType(I)V

    .line 212
    iget-object v0, p0, Lcom/vk/attachpicker/GraffitiActivity;->colorSelectorView:Lcom/vk/attachpicker/widget/ColorSelectorView;

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/widget/ColorSelectorView;->setSelectedColor(I)V

    .line 213
    iget-object v0, p0, Lcom/vk/attachpicker/GraffitiActivity;->drawingEraser:Landroid/widget/ImageView;

    const v1, 0x7f0f00b6

    invoke-static {p0, v1}, Landroid/support/v4/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setColorFilter(I)V

    .line 214
    return-void
.end method

.method private setResultAndFinish()V
    .locals 13

    .prologue
    const/4 v12, 0x0

    .line 348
    iget-object v0, p0, Lcom/vk/attachpicker/GraffitiActivity;->graffitiBitmap:Landroid/graphics/Bitmap;

    if-nez v0, :cond_0

    .line 369
    :goto_0
    return-void

    .line 353
    :cond_0
    :try_start_0
    invoke-static {}, Lcom/vk/core/util/FileUtils;->getTempGraffitiFile()Ljava/io/File;

    move-result-object v9

    .line 354
    .local v9, "output":Ljava/io/File;
    new-instance v8, Ljava/io/FileOutputStream;

    invoke-direct {v8, v9}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 355
    .local v8, "fos":Ljava/io/FileOutputStream;
    iget-object v0, p0, Lcom/vk/attachpicker/GraffitiActivity;->graffitiBitmap:Landroid/graphics/Bitmap;

    sget-object v1, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v2, 0x64

    invoke-virtual {v0, v1, v2, v8}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 356
    invoke-virtual {v8}, Ljava/io/FileOutputStream;->close()V

    .line 358
    invoke-static {v9}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v0

    invoke-static {v0}, Lcom/vk/imageloader/VKImageLoader;->prefetchToMemory(Landroid/net/Uri;)V

    .line 360
    new-instance v10, Landroid/content/Intent;

    invoke-direct {v10}, Landroid/content/Intent;-><init>()V

    .line 361
    .local v10, "result":Landroid/content/Intent;
    const-string/jumbo v11, "result_new_graffiti"

    new-instance v0, Lcom/vkontakte/android/attachments/PendingGraffitiAttachment;

    .line 362
    invoke-static {}, Lcom/vkontakte/android/upload/Upload;->getNewID()I

    move-result v1

    const/4 v2, 0x0

    invoke-virtual {v9}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/vk/attachpicker/GraffitiActivity;->graffitiBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v4

    iget-object v5, p0, Lcom/vk/attachpicker/GraffitiActivity;->graffitiBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v5}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v5

    const/4 v6, 0x0

    invoke-direct/range {v0 .. v6}, Lcom/vkontakte/android/attachments/PendingGraffitiAttachment;-><init>(IILjava/lang/String;IILjava/lang/String;)V

    .line 361
    invoke-virtual {v10, v11, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 364
    const/4 v0, -0x1

    invoke-virtual {p0, v0, v10}, Lcom/vk/attachpicker/GraffitiActivity;->setResult(ILandroid/content/Intent;)V

    .line 365
    invoke-super {p0}, Lcom/vkontakte/android/VKActivity;->finish()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 366
    .end local v8    # "fos":Ljava/io/FileOutputStream;
    .end local v9    # "output":Ljava/io/File;
    .end local v10    # "result":Landroid/content/Intent;
    :catch_0
    move-exception v7

    .line 367
    .local v7, "e":Ljava/lang/Exception;
    const v0, 0x7f0804d0

    invoke-static {p0, v0, v12}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_0
.end method

.method private showResult()V
    .locals 19

    .prologue
    .line 283
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/vk/attachpicker/GraffitiActivity;->drawingView:Lcom/vk/attachpicker/drawing/DrawingView;

    invoke-virtual {v15}, Lcom/vk/attachpicker/drawing/DrawingView;->isDefault()Z

    move-result v15

    if-eqz v15, :cond_0

    .line 345
    :goto_0
    return-void

    .line 287
    :cond_0
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/vk/attachpicker/GraffitiActivity;->drawingView:Lcom/vk/attachpicker/drawing/DrawingView;

    invoke-virtual {v15}, Lcom/vk/attachpicker/drawing/DrawingView;->getMeasuredWidth()I

    move-result v15

    int-to-float v14, v15

    .line 288
    .local v14, "w":F
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/vk/attachpicker/GraffitiActivity;->drawingView:Lcom/vk/attachpicker/drawing/DrawingView;

    invoke-virtual {v15}, Lcom/vk/attachpicker/drawing/DrawingView;->getMeasuredHeight()I

    move-result v15

    int-to-float v11, v15

    .line 289
    .local v11, "h":F
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/vk/attachpicker/GraffitiActivity;->drawingView:Lcom/vk/attachpicker/drawing/DrawingView;

    invoke-virtual {v15}, Lcom/vk/attachpicker/drawing/DrawingView;->getDrawingStateCopy()Lcom/vk/attachpicker/drawing/DrawingState;

    move-result-object v5

    .line 291
    .local v5, "ds":Lcom/vk/attachpicker/drawing/DrawingState;
    invoke-virtual {v5}, Lcom/vk/attachpicker/drawing/DrawingState;->getMergedPath()Landroid/graphics/Path;

    move-result-object v12

    .line 292
    .local v12, "mergedPath":Landroid/graphics/Path;
    new-instance v2, Landroid/graphics/RectF;

    invoke-direct {v2}, Landroid/graphics/RectF;-><init>()V

    .line 293
    .local v2, "bounds":Landroid/graphics/RectF;
    const/4 v15, 0x1

    invoke-virtual {v12, v2, v15}, Landroid/graphics/Path;->computeBounds(Landroid/graphics/RectF;Z)V

    .line 295
    invoke-virtual {v5}, Lcom/vk/attachpicker/drawing/DrawingState;->getMaxBrushWidth()F

    move-result v15

    const/high16 v16, 0x40000000    # 2.0f

    div-float v15, v15, v16

    const/16 v16, 0x1

    invoke-static/range {v16 .. v16}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v16

    move/from16 v0, v16

    int-to-float v0, v0

    move/from16 v16, v0

    add-float v15, v15, v16

    float-to-int v13, v15

    .line 296
    .local v13, "p":I
    iget v15, v2, Landroid/graphics/RectF;->left:F

    int-to-float v0, v13

    move/from16 v16, v0

    sub-float v15, v15, v16

    iput v15, v2, Landroid/graphics/RectF;->left:F

    .line 297
    iget v15, v2, Landroid/graphics/RectF;->top:F

    int-to-float v0, v13

    move/from16 v16, v0

    sub-float v15, v15, v16

    iput v15, v2, Landroid/graphics/RectF;->top:F

    .line 298
    iget v15, v2, Landroid/graphics/RectF;->right:F

    int-to-float v0, v13

    move/from16 v16, v0

    add-float v15, v15, v16

    iput v15, v2, Landroid/graphics/RectF;->right:F

    .line 299
    iget v15, v2, Landroid/graphics/RectF;->bottom:F

    int-to-float v0, v13

    move/from16 v16, v0

    add-float v15, v15, v16

    iput v15, v2, Landroid/graphics/RectF;->bottom:F

    .line 300
    iget v15, v2, Landroid/graphics/RectF;->left:F

    const/16 v16, 0x0

    cmpg-float v15, v15, v16

    if-gez v15, :cond_1

    .line 301
    const/4 v15, 0x0

    iput v15, v2, Landroid/graphics/RectF;->left:F

    .line 303
    :cond_1
    iget v15, v2, Landroid/graphics/RectF;->top:F

    const/16 v16, 0x0

    cmpg-float v15, v15, v16

    if-gez v15, :cond_2

    .line 304
    const/4 v15, 0x0

    iput v15, v2, Landroid/graphics/RectF;->top:F

    .line 306
    :cond_2
    iget v15, v2, Landroid/graphics/RectF;->right:F

    cmpl-float v15, v15, v14

    if-lez v15, :cond_3

    .line 307
    iput v14, v2, Landroid/graphics/RectF;->right:F

    .line 309
    :cond_3
    iget v15, v2, Landroid/graphics/RectF;->bottom:F

    cmpl-float v15, v15, v11

    if-lez v15, :cond_4

    .line 310
    iput v11, v2, Landroid/graphics/RectF;->bottom:F

    .line 313
    :cond_4
    iget v15, v2, Landroid/graphics/RectF;->left:F

    neg-float v15, v15

    iget v0, v2, Landroid/graphics/RectF;->top:F

    move/from16 v16, v0

    move/from16 v0, v16

    neg-float v0, v0

    move/from16 v16, v0

    move/from16 v0, v16

    invoke-virtual {v5, v15, v0}, Lcom/vk/attachpicker/drawing/DrawingState;->postTranslate(FF)V

    .line 315
    invoke-virtual {v2}, Landroid/graphics/RectF;->width()F

    move-result v10

    .line 316
    .local v10, "graffitiWidth":F
    invoke-virtual {v2}, Landroid/graphics/RectF;->height()F

    move-result v8

    .line 317
    .local v8, "graffitiHeigth":F
    const/high16 v15, 0x40000000    # 2.0f

    invoke-virtual {v2}, Landroid/graphics/RectF;->width()F

    move-result v16

    div-float v16, v14, v16

    invoke-virtual {v2}, Landroid/graphics/RectF;->height()F

    move-result v17

    div-float v17, v11, v17

    invoke-static/range {v16 .. v17}, Ljava/lang/Math;->min(FF)F

    move-result v16

    invoke-static/range {v15 .. v16}, Ljava/lang/Math;->min(FF)F

    move-result v9

    .line 318
    .local v9, "graffitiScale":F
    mul-float/2addr v10, v9

    .line 319
    mul-float/2addr v8, v9

    .line 320
    const/high16 v15, 0x44340000    # 720.0f

    cmpl-float v15, v10, v15

    if-gtz v15, :cond_5

    const/high16 v15, 0x44340000    # 720.0f

    cmpl-float v15, v8, v15

    if-lez v15, :cond_6

    .line 321
    :cond_5
    const/high16 v15, 0x44340000    # 720.0f

    invoke-static {v10, v8}, Ljava/lang/Math;->max(FF)F

    move-result v16

    div-float v3, v15, v16

    .line 322
    .local v3, "downscale":F
    mul-float/2addr v9, v3

    .line 323
    mul-float/2addr v10, v3

    .line 324
    mul-float/2addr v8, v3

    .line 326
    .end local v3    # "downscale":F
    :cond_6
    float-to-int v7, v10

    .line 327
    .local v7, "finalWidth":I
    float-to-int v6, v8

    .line 329
    .local v6, "finalHeight":I
    const/4 v15, 0x0

    const/16 v16, 0x0

    move/from16 v0, v16

    invoke-virtual {v5, v9, v15, v0}, Lcom/vk/attachpicker/drawing/DrawingState;->postScale(FFF)V

    .line 331
    sget-object v15, Landroid/graphics/Bitmap$Config;->ARGB_4444:Landroid/graphics/Bitmap$Config;

    invoke-static {v7, v6, v15}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v15

    move-object/from16 v0, p0

    iput-object v15, v0, Lcom/vk/attachpicker/GraffitiActivity;->graffitiBitmap:Landroid/graphics/Bitmap;

    .line 332
    new-instance v4, Lcom/vk/attachpicker/drawing/DrawingCanvas;

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/vk/attachpicker/GraffitiActivity;->graffitiBitmap:Landroid/graphics/Bitmap;

    invoke-direct {v4, v15}, Lcom/vk/attachpicker/drawing/DrawingCanvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 333
    .local v4, "drawingCanvas":Lcom/vk/attachpicker/drawing/DrawingCanvas;
    invoke-virtual {v4, v5}, Lcom/vk/attachpicker/drawing/DrawingCanvas;->draw(Lcom/vk/attachpicker/drawing/DrawingState;)V

    .line 335
    move-object/from16 v0, p0

    iget v15, v0, Lcom/vk/attachpicker/GraffitiActivity;->lastOrientation:I

    if-eqz v15, :cond_7

    .line 336
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/vk/attachpicker/GraffitiActivity;->graffitiBitmap:Landroid/graphics/Bitmap;

    move-object/from16 v0, p0

    iget v0, v0, Lcom/vk/attachpicker/GraffitiActivity;->lastOrientation:I

    move/from16 v16, v0

    move/from16 v0, v16

    neg-int v0, v0

    move/from16 v16, v0

    const/16 v17, 0x0

    invoke-static/range {v15 .. v17}, Lcom/vk/attachpicker/util/BitmapUtils;->rotateBitmap(Landroid/graphics/Bitmap;IZ)Landroid/graphics/Bitmap;

    move-result-object v15

    move-object/from16 v0, p0

    iput-object v15, v0, Lcom/vk/attachpicker/GraffitiActivity;->graffitiBitmap:Landroid/graphics/Bitmap;

    .line 339
    :cond_7
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/vk/attachpicker/GraffitiActivity;->imagePreview:Lcom/vk/imageloader/view/VKImageView;

    const v16, 0x3fe66666    # 1.8f

    const v17, 0x3f4ccccd    # 0.8f

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/GraffitiActivity;->graffitiBitmap:Landroid/graphics/Bitmap;

    move-object/from16 v18, v0

    invoke-static/range {v18 .. v18}, Lcom/vk/attachpicker/util/BitmapUtils;->getAspectRatio(Landroid/graphics/Bitmap;)F

    move-result v18

    invoke-static/range {v17 .. v18}, Ljava/lang/Math;->max(FF)F

    move-result v17

    invoke-static/range {v16 .. v17}, Ljava/lang/Math;->min(FF)F

    move-result v16

    invoke-virtual/range {v15 .. v16}, Lcom/vk/imageloader/view/VKImageView;->setAspectRatio(F)V

    .line 340
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/vk/attachpicker/GraffitiActivity;->imagePreview:Lcom/vk/imageloader/view/VKImageView;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/GraffitiActivity;->graffitiBitmap:Landroid/graphics/Bitmap;

    move-object/from16 v16, v0

    invoke-virtual/range {v15 .. v16}, Lcom/vk/imageloader/view/VKImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 342
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/vk/attachpicker/GraffitiActivity;->resultContainer:Lcom/vk/attachpicker/widget/RotateLayout;

    const/16 v16, 0x0

    invoke-virtual/range {v15 .. v16}, Lcom/vk/attachpicker/widget/RotateLayout;->setAlpha(F)V

    .line 343
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/vk/attachpicker/GraffitiActivity;->resultContainer:Lcom/vk/attachpicker/widget/RotateLayout;

    const/16 v16, 0x0

    invoke-virtual/range {v15 .. v16}, Lcom/vk/attachpicker/widget/RotateLayout;->setVisibility(I)V

    .line 344
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/vk/attachpicker/GraffitiActivity;->resultContainer:Lcom/vk/attachpicker/widget/RotateLayout;

    invoke-virtual {v15}, Lcom/vk/attachpicker/widget/RotateLayout;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v15

    const/high16 v16, 0x3f800000    # 1.0f

    invoke-virtual/range {v15 .. v16}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v15

    const/16 v16, 0x0

    invoke-virtual/range {v15 .. v16}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    move-result-object v15

    const-wide/16 v16, 0xc8

    invoke-virtual/range {v15 .. v17}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v15

    invoke-virtual {v15}, Landroid/view/ViewPropertyAnimator;->start()V

    goto/16 :goto_0
.end method


# virtual methods
.method public finish()V
    .locals 4

    .prologue
    .line 385
    iget-object v1, p0, Lcom/vk/attachpicker/GraffitiActivity;->exitLock:Lcom/vk/core/util/TimeoutLock;

    invoke-virtual {v1}, Lcom/vk/core/util/TimeoutLock;->isLocked()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 411
    :goto_0
    return-void

    .line 388
    :cond_0
    iget-object v1, p0, Lcom/vk/attachpicker/GraffitiActivity;->exitLock:Lcom/vk/core/util/TimeoutLock;

    invoke-virtual {v1}, Lcom/vk/core/util/TimeoutLock;->lock()V

    .line 390
    iget-object v1, p0, Lcom/vk/attachpicker/GraffitiActivity;->resultContainer:Lcom/vk/attachpicker/widget/RotateLayout;

    invoke-virtual {v1}, Lcom/vk/attachpicker/widget/RotateLayout;->getVisibility()I

    move-result v1

    if-nez v1, :cond_1

    .line 391
    iget-object v1, p0, Lcom/vk/attachpicker/GraffitiActivity;->resultContainer:Lcom/vk/attachpicker/widget/RotateLayout;

    invoke-virtual {v1}, Lcom/vk/attachpicker/widget/RotateLayout;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    new-instance v2, Lcom/vk/attachpicker/GraffitiActivity$5;

    invoke-direct {v2, p0}, Lcom/vk/attachpicker/GraffitiActivity$5;-><init>(Lcom/vk/attachpicker/GraffitiActivity;)V

    invoke-virtual {v1, v2}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    const-wide/16 v2, 0xc8

    .line 396
    invoke-virtual {v1, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/ViewPropertyAnimator;->start()V

    goto :goto_0

    .line 398
    :cond_1
    iget-object v1, p0, Lcom/vk/attachpicker/GraffitiActivity;->drawingView:Lcom/vk/attachpicker/drawing/DrawingView;

    invoke-virtual {v1}, Lcom/vk/attachpicker/drawing/DrawingView;->isDefault()Z

    move-result v1

    if-nez v1, :cond_2

    .line 399
    new-instance v0, Lcom/vkontakte/android/VKAlertDialog$Builder;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/VKAlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 400
    .local v0, "builder":Lcom/vkontakte/android/VKAlertDialog$Builder;
    const v1, 0x7f080176

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    .line 401
    const v1, 0x7f0804cb

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    .line 402
    const v1, 0x7f0804f4

    invoke-static {p0}, Lcom/vk/attachpicker/GraffitiActivity$$Lambda$14;->lambdaFactory$(Lcom/vk/attachpicker/GraffitiActivity;)Landroid/content/DialogInterface$OnClickListener;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 405
    const v1, 0x7f0804d6

    invoke-static {}, Lcom/vk/attachpicker/GraffitiActivity$$Lambda$15;->lambdaFactory$()Landroid/content/DialogInterface$OnClickListener;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 406
    invoke-virtual {v0}, Lcom/vkontakte/android/VKAlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto :goto_0

    .line 408
    .end local v0    # "builder":Lcom/vkontakte/android/VKAlertDialog$Builder;
    :cond_2
    invoke-super {p0}, Lcom/vkontakte/android/VKActivity;->finish()V

    goto :goto_0
.end method

.method synthetic lambda$finish$13(Landroid/content/DialogInterface;I)V
    .locals 0
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 403
    invoke-super {p0}, Lcom/vkontakte/android/VKActivity;->finish()V

    .line 404
    return-void
.end method

.method synthetic lambda$new$0()V
    .locals 0

    .prologue
    .line 55
    invoke-direct {p0}, Lcom/vk/attachpicker/GraffitiActivity;->handleOrientationChange()V

    return-void
.end method

.method synthetic lambda$onCreate$1(Landroid/view/View;)V
    .locals 0
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 109
    invoke-direct {p0}, Lcom/vk/attachpicker/GraffitiActivity;->setEraserModeEnabled()V

    .line 110
    return-void
.end method

.method synthetic lambda$onCreate$10(Landroid/graphics/Bitmap;)V
    .locals 1
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 196
    iget-object v0, p0, Lcom/vk/attachpicker/GraffitiActivity;->userAvatar:Landroid/widget/ImageView;

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    return-void
.end method

.method synthetic lambda$onCreate$12()V
    .locals 2

    .prologue
    .line 201
    iget-object v0, p0, Lcom/vk/attachpicker/GraffitiActivity;->drawingContainer:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    iget-object v1, p0, Lcom/vk/attachpicker/GraffitiActivity;->userContainer:Landroid/widget/FrameLayout;

    invoke-virtual {v1}, Landroid/widget/FrameLayout;->getMeasuredHeight()I

    move-result v1

    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 202
    iget-object v0, p0, Lcom/vk/attachpicker/GraffitiActivity;->drawingContainer:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->requestLayout()V

    .line 203
    return-void
.end method

.method synthetic lambda$onCreate$2(Landroid/view/View;)V
    .locals 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 113
    iget-object v0, p0, Lcom/vk/attachpicker/GraffitiActivity;->drawingWidthButton:Landroid/widget/ImageView;

    iget-object v1, p0, Lcom/vk/attachpicker/GraffitiActivity;->colorSelectorView:Lcom/vk/attachpicker/widget/ColorSelectorView;

    .line 114
    invoke-virtual {v1}, Lcom/vk/attachpicker/widget/ColorSelectorView;->getSelectedColor()I

    move-result v1

    iget-object v2, p0, Lcom/vk/attachpicker/GraffitiActivity;->drawingView:Lcom/vk/attachpicker/drawing/DrawingView;

    .line 115
    invoke-virtual {v2}, Lcom/vk/attachpicker/drawing/DrawingView;->getWidthMultiplier()F

    move-result v2

    invoke-static {v2}, Lcom/vk/attachpicker/drawing/DrawingState;->findIntIndex(F)I

    move-result v2

    new-instance v3, Lcom/vk/attachpicker/GraffitiActivity$2;

    invoke-direct {v3, p0}, Lcom/vk/attachpicker/GraffitiActivity$2;-><init>(Lcom/vk/attachpicker/GraffitiActivity;)V

    .line 113
    invoke-static {v0, v1, v2, v3}, Lcom/vk/attachpicker/widget/WidthSelectorView;->show(Landroid/view/View;IILcom/vk/attachpicker/widget/WidthSelectorView$OnWidthSelectedListener;)V

    .line 122
    return-void
.end method

.method synthetic lambda$onCreate$3(Landroid/view/View;)V
    .locals 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 142
    iget-object v0, p0, Lcom/vk/attachpicker/GraffitiActivity;->drawingView:Lcom/vk/attachpicker/drawing/DrawingView;

    invoke-virtual {v0}, Lcom/vk/attachpicker/drawing/DrawingView;->undo()V

    .line 143
    iget-object v3, p0, Lcom/vk/attachpicker/GraffitiActivity;->drawingUndo:Landroid/view/View;

    iget-object v0, p0, Lcom/vk/attachpicker/GraffitiActivity;->drawingView:Lcom/vk/attachpicker/drawing/DrawingView;

    invoke-virtual {v0}, Lcom/vk/attachpicker/drawing/DrawingView;->getHistorySize()I

    move-result v0

    if-lez v0, :cond_0

    move v0, v1

    :goto_0
    invoke-virtual {v3, v0}, Landroid/view/View;->setEnabled(Z)V

    .line 144
    iget-object v0, p0, Lcom/vk/attachpicker/GraffitiActivity;->drawingSend:Landroid/view/View;

    iget-object v3, p0, Lcom/vk/attachpicker/GraffitiActivity;->drawingView:Lcom/vk/attachpicker/drawing/DrawingView;

    invoke-virtual {v3}, Lcom/vk/attachpicker/drawing/DrawingView;->getHistorySize()I

    move-result v3

    if-lez v3, :cond_1

    :goto_1
    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 145
    return-void

    :cond_0
    move v0, v2

    .line 143
    goto :goto_0

    :cond_1
    move v1, v2

    .line 144
    goto :goto_1
.end method

.method synthetic lambda$onCreate$4(Landroid/view/View;)Z
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const/4 v1, 0x0

    .line 147
    iget-object v0, p0, Lcom/vk/attachpicker/GraffitiActivity;->drawingView:Lcom/vk/attachpicker/drawing/DrawingView;

    invoke-virtual {v0}, Lcom/vk/attachpicker/drawing/DrawingView;->clear()V

    .line 148
    iget-object v0, p0, Lcom/vk/attachpicker/GraffitiActivity;->drawingUndo:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 149
    iget-object v0, p0, Lcom/vk/attachpicker/GraffitiActivity;->drawingSend:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 150
    const/4 v0, 0x1

    return v0
.end method

.method synthetic lambda$onCreate$5(Landroid/view/View;)V
    .locals 0
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 167
    invoke-virtual {p0}, Lcom/vk/attachpicker/GraffitiActivity;->finish()V

    return-void
.end method

.method synthetic lambda$onCreate$6(Landroid/view/View;)V
    .locals 0
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 168
    invoke-direct {p0}, Lcom/vk/attachpicker/GraffitiActivity;->showResult()V

    return-void
.end method

.method synthetic lambda$onCreate$8(Landroid/view/View;)V
    .locals 0
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 183
    invoke-virtual {p0}, Lcom/vk/attachpicker/GraffitiActivity;->finish()V

    return-void
.end method

.method synthetic lambda$onCreate$9(Landroid/view/View;)V
    .locals 0
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 184
    invoke-direct {p0}, Lcom/vk/attachpicker/GraffitiActivity;->setResultAndFinish()V

    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    const/4 v3, 0x0

    .line 81
    invoke-super {p0, p1}, Lcom/vkontakte/android/VKActivity;->onCreate(Landroid/os/Bundle;)V

    .line 82
    const v0, 0x7f03018e

    invoke-virtual {p0, v0}, Lcom/vk/attachpicker/GraffitiActivity;->setContentView(I)V

    .line 84
    invoke-virtual {p0}, Lcom/vk/attachpicker/GraffitiActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string/jumbo v1, "graffiti_title"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/attachpicker/GraffitiActivity;->graffitiTitle:Ljava/lang/String;

    .line 85
    invoke-virtual {p0}, Lcom/vk/attachpicker/GraffitiActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string/jumbo v1, "graffiti_avatar"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/attachpicker/GraffitiActivity;->graffitiAvatar:Ljava/lang/String;

    .line 87
    new-instance v0, Lcom/vk/attachpicker/GraffitiActivity$1;

    invoke-direct {v0, p0, p0}, Lcom/vk/attachpicker/GraffitiActivity$1;-><init>(Lcom/vk/attachpicker/GraffitiActivity;Landroid/content/Context;)V

    iput-object v0, p0, Lcom/vk/attachpicker/GraffitiActivity;->orientationEventListener:Landroid/view/OrientationEventListener;

    .line 95
    const v0, 0x7f10045a

    invoke-virtual {p0, v0}, Lcom/vk/attachpicker/GraffitiActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    iput-object v0, p0, Lcom/vk/attachpicker/GraffitiActivity;->drawingContainer:Landroid/widget/FrameLayout;

    .line 97
    const v0, 0x7f100154

    invoke-virtual {p0, v0}, Lcom/vk/attachpicker/GraffitiActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/attachpicker/drawing/DrawingView;

    iput-object v0, p0, Lcom/vk/attachpicker/GraffitiActivity;->drawingView:Lcom/vk/attachpicker/drawing/DrawingView;

    .line 98
    iget-object v0, p0, Lcom/vk/attachpicker/GraffitiActivity;->drawingView:Lcom/vk/attachpicker/drawing/DrawingView;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/drawing/DrawingView;->setTouchEnabled(Z)V

    .line 99
    iget-object v0, p0, Lcom/vk/attachpicker/GraffitiActivity;->drawingView:Lcom/vk/attachpicker/drawing/DrawingView;

    invoke-virtual {v0, v3}, Lcom/vk/attachpicker/drawing/DrawingView;->setFixTouchPosition(Z)V

    .line 101
    const v0, 0x7f10017b

    invoke-virtual {p0, v0}, Lcom/vk/attachpicker/GraffitiActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/attachpicker/widget/ColorSelectorView;

    iput-object v0, p0, Lcom/vk/attachpicker/GraffitiActivity;->colorSelectorView:Lcom/vk/attachpicker/widget/ColorSelectorView;

    .line 102
    const v0, 0x7f10017c

    invoke-virtual {p0, v0}, Lcom/vk/attachpicker/GraffitiActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/vk/attachpicker/GraffitiActivity;->drawingWidthButton:Landroid/widget/ImageView;

    .line 103
    const v0, 0x7f10045c

    invoke-virtual {p0, v0}, Lcom/vk/attachpicker/GraffitiActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/attachpicker/GraffitiActivity;->drawingCancel:Landroid/view/View;

    .line 104
    const v0, 0x7f100337

    invoke-virtual {p0, v0}, Lcom/vk/attachpicker/GraffitiActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/attachpicker/GraffitiActivity;->drawingSend:Landroid/view/View;

    .line 105
    const v0, 0x7f100177

    invoke-virtual {p0, v0}, Lcom/vk/attachpicker/GraffitiActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/attachpicker/GraffitiActivity;->drawingUndo:Landroid/view/View;

    .line 106
    const v0, 0x7f10045d

    invoke-virtual {p0, v0}, Lcom/vk/attachpicker/GraffitiActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/vk/attachpicker/GraffitiActivity;->drawingEraser:Landroid/widget/ImageView;

    .line 108
    iget-object v0, p0, Lcom/vk/attachpicker/GraffitiActivity;->drawingEraser:Landroid/widget/ImageView;

    invoke-static {p0}, Lcom/vk/attachpicker/GraffitiActivity$$Lambda$2;->lambdaFactory$(Lcom/vk/attachpicker/GraffitiActivity;)Landroid/view/View$OnClickListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 112
    iget-object v0, p0, Lcom/vk/attachpicker/GraffitiActivity;->drawingWidthButton:Landroid/widget/ImageView;

    invoke-static {p0}, Lcom/vk/attachpicker/GraffitiActivity$$Lambda$3;->lambdaFactory$(Lcom/vk/attachpicker/GraffitiActivity;)Landroid/view/View$OnClickListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 124
    iget-object v0, p0, Lcom/vk/attachpicker/GraffitiActivity;->colorSelectorView:Lcom/vk/attachpicker/widget/ColorSelectorView;

    new-instance v1, Lcom/vk/attachpicker/GraffitiActivity$3;

    invoke-direct {v1, p0}, Lcom/vk/attachpicker/GraffitiActivity$3;-><init>(Lcom/vk/attachpicker/GraffitiActivity;)V

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/widget/ColorSelectorView;->setOnColorSelectedListener(Lcom/vk/attachpicker/widget/ColorSelectorView$OnColorSelectedListener;)V

    .line 141
    iget-object v0, p0, Lcom/vk/attachpicker/GraffitiActivity;->drawingUndo:Landroid/view/View;

    invoke-static {p0}, Lcom/vk/attachpicker/GraffitiActivity$$Lambda$4;->lambdaFactory$(Lcom/vk/attachpicker/GraffitiActivity;)Landroid/view/View$OnClickListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 146
    iget-object v0, p0, Lcom/vk/attachpicker/GraffitiActivity;->drawingUndo:Landroid/view/View;

    invoke-static {p0}, Lcom/vk/attachpicker/GraffitiActivity$$Lambda$5;->lambdaFactory$(Lcom/vk/attachpicker/GraffitiActivity;)Landroid/view/View$OnLongClickListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 152
    iget-object v0, p0, Lcom/vk/attachpicker/GraffitiActivity;->drawingView:Lcom/vk/attachpicker/drawing/DrawingView;

    new-instance v1, Lcom/vk/attachpicker/GraffitiActivity$4;

    invoke-direct {v1, p0}, Lcom/vk/attachpicker/GraffitiActivity$4;-><init>(Lcom/vk/attachpicker/GraffitiActivity;)V

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/drawing/DrawingView;->setOnMotionEventListener(Lcom/vk/attachpicker/drawing/DrawingView$OnMotionEventListener;)V

    .line 164
    iget-object v0, p0, Lcom/vk/attachpicker/GraffitiActivity;->drawingUndo:Landroid/view/View;

    invoke-virtual {v0, v3}, Landroid/view/View;->setEnabled(Z)V

    .line 165
    iget-object v0, p0, Lcom/vk/attachpicker/GraffitiActivity;->drawingSend:Landroid/view/View;

    invoke-virtual {v0, v3}, Landroid/view/View;->setEnabled(Z)V

    .line 167
    iget-object v0, p0, Lcom/vk/attachpicker/GraffitiActivity;->drawingCancel:Landroid/view/View;

    invoke-static {p0}, Lcom/vk/attachpicker/GraffitiActivity$$Lambda$6;->lambdaFactory$(Lcom/vk/attachpicker/GraffitiActivity;)Landroid/view/View$OnClickListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 168
    iget-object v0, p0, Lcom/vk/attachpicker/GraffitiActivity;->drawingSend:Landroid/view/View;

    invoke-static {p0}, Lcom/vk/attachpicker/GraffitiActivity$$Lambda$7;->lambdaFactory$(Lcom/vk/attachpicker/GraffitiActivity;)Landroid/view/View$OnClickListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 171
    const v0, 0x7f10045e

    invoke-virtual {p0, v0}, Lcom/vk/attachpicker/GraffitiActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/attachpicker/widget/RotateLayout;

    iput-object v0, p0, Lcom/vk/attachpicker/GraffitiActivity;->resultContainer:Lcom/vk/attachpicker/widget/RotateLayout;

    .line 172
    const v0, 0x7f100474

    invoke-virtual {p0, v0}, Lcom/vk/attachpicker/GraffitiActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/attachpicker/GraffitiActivity;->preview:Landroid/view/View;

    .line 173
    const v0, 0x7f100475

    invoke-virtual {p0, v0}, Lcom/vk/attachpicker/GraffitiActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/attachpicker/GraffitiActivity;->graffitiContainer:Landroid/view/View;

    .line 174
    const v0, 0x7f100476

    invoke-virtual {p0, v0}, Lcom/vk/attachpicker/GraffitiActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/imageloader/view/VKImageView;

    iput-object v0, p0, Lcom/vk/attachpicker/GraffitiActivity;->imagePreview:Lcom/vk/imageloader/view/VKImageView;

    .line 175
    const v0, 0x7f100477

    invoke-virtual {p0, v0}, Lcom/vk/attachpicker/GraffitiActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vk/attachpicker/GraffitiActivity;->sendButton:Landroid/widget/TextView;

    .line 176
    iget-object v0, p0, Lcom/vk/attachpicker/GraffitiActivity;->resultContainer:Lcom/vk/attachpicker/widget/RotateLayout;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/widget/RotateLayout;->setVisibility(I)V

    .line 177
    iget-object v0, p0, Lcom/vk/attachpicker/GraffitiActivity;->resultContainer:Lcom/vk/attachpicker/widget/RotateLayout;

    const/high16 v1, 0x66000000

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/widget/RotateLayout;->setBackgroundColor(I)V

    .line 178
    iget-object v0, p0, Lcom/vk/attachpicker/GraffitiActivity;->preview:Landroid/view/View;

    invoke-virtual {v0, v3}, Landroid/view/View;->setBackgroundColor(I)V

    .line 180
    iget-object v0, p0, Lcom/vk/attachpicker/GraffitiActivity;->imagePreview:Lcom/vk/imageloader/view/VKImageView;

    invoke-static {}, Lcom/vk/core/util/Screen;->realWidth()I

    move-result v1

    const/16 v2, 0x80

    invoke-static {v2}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v2

    sub-int/2addr v1, v2

    invoke-virtual {v0, v1}, Lcom/vk/imageloader/view/VKImageView;->setMaxHeight(I)V

    .line 181
    iget-object v0, p0, Lcom/vk/attachpicker/GraffitiActivity;->imagePreview:Lcom/vk/imageloader/view/VKImageView;

    invoke-static {}, Lcom/vk/core/util/Screen;->realWidth()I

    move-result v1

    const/16 v2, 0x20

    invoke-static {v2}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v2

    sub-int/2addr v1, v2

    invoke-virtual {v0, v1}, Lcom/vk/imageloader/view/VKImageView;->setMaxWidth(I)V

    .line 182
    iget-object v0, p0, Lcom/vk/attachpicker/GraffitiActivity;->imagePreview:Lcom/vk/imageloader/view/VKImageView;

    invoke-static {}, Lcom/vk/attachpicker/GraffitiActivity$$Lambda$8;->lambdaFactory$()Landroid/view/View$OnClickListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/imageloader/view/VKImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 183
    iget-object v0, p0, Lcom/vk/attachpicker/GraffitiActivity;->preview:Landroid/view/View;

    invoke-static {p0}, Lcom/vk/attachpicker/GraffitiActivity$$Lambda$9;->lambdaFactory$(Lcom/vk/attachpicker/GraffitiActivity;)Landroid/view/View$OnClickListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 184
    iget-object v0, p0, Lcom/vk/attachpicker/GraffitiActivity;->sendButton:Landroid/widget/TextView;

    invoke-static {p0}, Lcom/vk/attachpicker/GraffitiActivity$$Lambda$10;->lambdaFactory$(Lcom/vk/attachpicker/GraffitiActivity;)Landroid/view/View$OnClickListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 187
    const v0, 0x7f100458

    invoke-virtual {p0, v0}, Lcom/vk/attachpicker/GraffitiActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    iput-object v0, p0, Lcom/vk/attachpicker/GraffitiActivity;->userContainer:Landroid/widget/FrameLayout;

    .line 188
    const v0, 0x7f100459

    invoke-virtual {p0, v0}, Lcom/vk/attachpicker/GraffitiActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/vk/attachpicker/GraffitiActivity;->innerUserContainer:Landroid/widget/LinearLayout;

    .line 189
    iget-object v0, p0, Lcom/vk/attachpicker/GraffitiActivity;->innerUserContainer:Landroid/widget/LinearLayout;

    const v1, 0x7f100190

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/vk/attachpicker/GraffitiActivity;->userAvatar:Landroid/widget/ImageView;

    .line 190
    iget-object v0, p0, Lcom/vk/attachpicker/GraffitiActivity;->innerUserContainer:Landroid/widget/LinearLayout;

    const v1, 0x7f100393

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vk/attachpicker/GraffitiActivity;->userName:Landroid/widget/TextView;

    .line 192
    iget-object v0, p0, Lcom/vk/attachpicker/GraffitiActivity;->graffitiTitle:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 193
    iget-object v0, p0, Lcom/vk/attachpicker/GraffitiActivity;->graffitiAvatar:Ljava/lang/String;

    invoke-static {v0}, Lcom/vk/imageloader/VKImageLoader;->getCircleBitmap(Ljava/lang/String;)Lio/reactivex/Observable;

    move-result-object v0

    .line 194
    invoke-static {}, Lio/reactivex/schedulers/Schedulers;->io()Lio/reactivex/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/reactivex/Observable;->subscribeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object v0

    .line 195
    invoke-static {}, Lio/reactivex/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/reactivex/Observable;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object v0

    invoke-static {p0}, Lcom/vk/attachpicker/GraffitiActivity$$Lambda$11;->lambdaFactory$(Lcom/vk/attachpicker/GraffitiActivity;)Lio/reactivex/functions/Consumer;

    move-result-object v1

    invoke-static {}, Lcom/vk/attachpicker/GraffitiActivity$$Lambda$12;->lambdaFactory$()Lio/reactivex/functions/Consumer;

    move-result-object v2

    .line 196
    invoke-virtual {v0, v1, v2}, Lio/reactivex/Observable;->subscribe(Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;

    .line 199
    iget-object v0, p0, Lcom/vk/attachpicker/GraffitiActivity;->userName:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/vk/attachpicker/GraffitiActivity;->graffitiTitle:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 200
    iget-object v0, p0, Lcom/vk/attachpicker/GraffitiActivity;->userContainer:Landroid/widget/FrameLayout;

    invoke-static {p0}, Lcom/vk/attachpicker/GraffitiActivity$$Lambda$13;->lambdaFactory$(Lcom/vk/attachpicker/GraffitiActivity;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vk/attachpicker/util/Utils;->runOnPreDraw(Landroid/view/View;Ljava/lang/Runnable;)V

    .line 208
    :goto_0
    return-void

    .line 205
    :cond_0
    iget-object v0, p0, Lcom/vk/attachpicker/GraffitiActivity;->drawingContainer:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    iput v3, v0, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 206
    iget-object v0, p0, Lcom/vk/attachpicker/GraffitiActivity;->userContainer:Landroid/widget/FrameLayout;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setVisibility(I)V

    goto :goto_0
.end method

.method public onPause()V
    .locals 1

    .prologue
    .line 379
    invoke-super {p0}, Lcom/vkontakte/android/VKActivity;->onPause()V

    .line 380
    iget-object v0, p0, Lcom/vk/attachpicker/GraffitiActivity;->orientationEventListener:Landroid/view/OrientationEventListener;

    invoke-virtual {v0}, Landroid/view/OrientationEventListener;->disable()V

    .line 381
    return-void
.end method

.method public onResume()V
    .locals 1

    .prologue
    .line 373
    invoke-super {p0}, Lcom/vkontakte/android/VKActivity;->onResume()V

    .line 374
    iget-object v0, p0, Lcom/vk/attachpicker/GraffitiActivity;->orientationEventListener:Landroid/view/OrientationEventListener;

    invoke-virtual {v0}, Landroid/view/OrientationEventListener;->enable()V

    .line 375
    return-void
.end method
