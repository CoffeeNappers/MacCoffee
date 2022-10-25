.class public Lcom/vk/attachpicker/screen/AvatarAreaSelectionScreen;
.super Lcom/vk/core/simplescreen/BaseScreen;
.source "AvatarAreaSelectionScreen.java"


# instance fields
.field private bottomPanel:Lcom/vk/attachpicker/widget/EditorBottomPanel;

.field private final buttonLock:Lcom/vk/core/util/TimeoutLock;

.field private controlsEnabled:Z

.field private cropView:Lcom/vk/attachpicker/crop/CropImageView;

.field private croppedBitmap:Landroid/graphics/Bitmap;

.field private currentTask:Lio/reactivex/disposables/Disposable;

.field private final entry:Lcom/vk/attachpicker/mediastore/MediaStoreEntry;

.field private progressView:Lcom/vk/attachpicker/widget/ContextProgressView;


# direct methods
.method public constructor <init>(Landroid/graphics/Bitmap;)V
    .locals 4
    .param p1, "croppedBitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 55
    invoke-direct {p0}, Lcom/vk/core/simplescreen/BaseScreen;-><init>()V

    .line 39
    new-instance v0, Lcom/vk/core/util/TimeoutLock;

    const-wide/16 v2, 0x3e8

    invoke-direct {v0, v2, v3}, Lcom/vk/core/util/TimeoutLock;-><init>(J)V

    iput-object v0, p0, Lcom/vk/attachpicker/screen/AvatarAreaSelectionScreen;->buttonLock:Lcom/vk/core/util/TimeoutLock;

    .line 45
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vk/attachpicker/screen/AvatarAreaSelectionScreen;->controlsEnabled:Z

    .line 56
    iput-object p1, p0, Lcom/vk/attachpicker/screen/AvatarAreaSelectionScreen;->croppedBitmap:Landroid/graphics/Bitmap;

    .line 57
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vk/attachpicker/screen/AvatarAreaSelectionScreen;->entry:Lcom/vk/attachpicker/mediastore/MediaStoreEntry;

    .line 58
    return-void
.end method

.method public constructor <init>(Lcom/vk/attachpicker/mediastore/MediaStoreEntry;)V
    .locals 4
    .param p1, "entry"    # Lcom/vk/attachpicker/mediastore/MediaStoreEntry;

    .prologue
    .line 50
    invoke-direct {p0}, Lcom/vk/core/simplescreen/BaseScreen;-><init>()V

    .line 39
    new-instance v0, Lcom/vk/core/util/TimeoutLock;

    const-wide/16 v2, 0x3e8

    invoke-direct {v0, v2, v3}, Lcom/vk/core/util/TimeoutLock;-><init>(J)V

    iput-object v0, p0, Lcom/vk/attachpicker/screen/AvatarAreaSelectionScreen;->buttonLock:Lcom/vk/core/util/TimeoutLock;

    .line 45
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vk/attachpicker/screen/AvatarAreaSelectionScreen;->controlsEnabled:Z

    .line 51
    iput-object p1, p0, Lcom/vk/attachpicker/screen/AvatarAreaSelectionScreen;->entry:Lcom/vk/attachpicker/mediastore/MediaStoreEntry;

    .line 52
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vk/attachpicker/screen/AvatarAreaSelectionScreen;->croppedBitmap:Landroid/graphics/Bitmap;

    .line 53
    return-void
.end method

.method private checkButtonLock()Z
    .locals 1

    .prologue
    .line 200
    iget-object v0, p0, Lcom/vk/attachpicker/screen/AvatarAreaSelectionScreen;->buttonLock:Lcom/vk/core/util/TimeoutLock;

    invoke-virtual {v0}, Lcom/vk/core/util/TimeoutLock;->isLocked()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 201
    const/4 v0, 0x1

    .line 204
    :goto_0
    return v0

    .line 203
    :cond_0
    iget-object v0, p0, Lcom/vk/attachpicker/screen/AvatarAreaSelectionScreen;->buttonLock:Lcom/vk/core/util/TimeoutLock;

    invoke-virtual {v0}, Lcom/vk/core/util/TimeoutLock;->lock()V

    .line 204
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private div(FF)F
    .locals 2
    .param p1, "a"    # F
    .param p2, "b"    # F

    .prologue
    const/4 v0, 0x0

    .line 61
    cmpl-float v1, p2, v0

    if-nez v1, :cond_0

    .line 64
    :goto_0
    return v0

    :cond_0
    div-float v0, p1, p2

    goto :goto_0
.end method

.method private initUi()V
    .locals 6

    .prologue
    .line 170
    iget-object v0, p0, Lcom/vk/attachpicker/screen/AvatarAreaSelectionScreen;->progressView:Lcom/vk/attachpicker/widget/ContextProgressView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/widget/ContextProgressView;->setVisibility(I)V

    .line 172
    new-instance v2, Lcom/vk/attachpicker/crop/GeometryState;

    iget-object v0, p0, Lcom/vk/attachpicker/screen/AvatarAreaSelectionScreen;->croppedBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    int-to-float v0, v0

    iget-object v1, p0, Lcom/vk/attachpicker/screen/AvatarAreaSelectionScreen;->croppedBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    int-to-float v1, v1

    invoke-direct {v2, v0, v1}, Lcom/vk/attachpicker/crop/GeometryState;-><init>(FF)V

    .line 173
    .local v2, "geometryState":Lcom/vk/attachpicker/crop/GeometryState;
    invoke-virtual {v2}, Lcom/vk/attachpicker/crop/GeometryState;->resetTransformationMatrix()V

    .line 174
    iget-object v0, p0, Lcom/vk/attachpicker/screen/AvatarAreaSelectionScreen;->cropView:Lcom/vk/attachpicker/crop/CropImageView;

    iget-object v1, p0, Lcom/vk/attachpicker/screen/AvatarAreaSelectionScreen;->croppedBitmap:Landroid/graphics/Bitmap;

    sget-object v3, Lcom/vk/attachpicker/crop/CropAspectRatio;->CROP_SQUARE:Lcom/vk/attachpicker/crop/CropAspectRatio;

    const/4 v4, 0x1

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Lcom/vk/attachpicker/crop/CropImageView;->setBitmap(Landroid/graphics/Bitmap;Lcom/vk/attachpicker/crop/GeometryState;Lcom/vk/attachpicker/crop/CropAspectRatio;ZZ)V

    .line 175
    return-void
.end method

.method private loadImages()V
    .locals 3

    .prologue
    .line 151
    iget-object v0, p0, Lcom/vk/attachpicker/screen/AvatarAreaSelectionScreen;->croppedBitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_1

    .line 152
    invoke-direct {p0}, Lcom/vk/attachpicker/screen/AvatarAreaSelectionScreen;->initUi()V

    .line 167
    :cond_0
    :goto_0
    return-void

    .line 154
    :cond_1
    iget-object v0, p0, Lcom/vk/attachpicker/screen/AvatarAreaSelectionScreen;->currentTask:Lio/reactivex/disposables/Disposable;

    if-nez v0, :cond_0

    .line 157
    iget-object v0, p0, Lcom/vk/attachpicker/screen/AvatarAreaSelectionScreen;->entry:Lcom/vk/attachpicker/mediastore/MediaStoreEntry;

    iget-object v0, v0, Lcom/vk/attachpicker/mediastore/MediaStoreEntry;->path:Landroid/net/Uri;

    invoke-static {v0}, Lcom/vk/imageloader/VKImageLoader;->getVeryBigBitmap(Landroid/net/Uri;)Lio/reactivex/Observable;

    move-result-object v0

    .line 158
    invoke-static {}, Lio/reactivex/schedulers/Schedulers;->io()Lio/reactivex/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/reactivex/Observable;->subscribeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object v0

    .line 159
    invoke-static {}, Lio/reactivex/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/reactivex/Observable;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object v0

    invoke-static {p0}, Lcom/vk/attachpicker/screen/AvatarAreaSelectionScreen$$Lambda$3;->lambdaFactory$(Lcom/vk/attachpicker/screen/AvatarAreaSelectionScreen;)Lio/reactivex/functions/Consumer;

    move-result-object v1

    invoke-static {p0}, Lcom/vk/attachpicker/screen/AvatarAreaSelectionScreen$$Lambda$4;->lambdaFactory$(Lcom/vk/attachpicker/screen/AvatarAreaSelectionScreen;)Lio/reactivex/functions/Consumer;

    move-result-object v2

    .line 160
    invoke-virtual {v0, v1, v2}, Lio/reactivex/Observable;->subscribe(Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/attachpicker/screen/AvatarAreaSelectionScreen;->currentTask:Lio/reactivex/disposables/Disposable;

    goto :goto_0
.end method


# virtual methods
.method public createView(Landroid/view/LayoutInflater;)Landroid/view/View;
    .locals 3
    .param p1, "inflater"    # Landroid/view/LayoutInflater;

    .prologue
    .line 70
    const v1, 0x7f0301a6

    const/4 v2, 0x0

    invoke-virtual {p1, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 72
    .local v0, "view":Landroid/view/View;
    const v1, 0x7f100489

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/vk/attachpicker/crop/CropImageView;

    iput-object v1, p0, Lcom/vk/attachpicker/screen/AvatarAreaSelectionScreen;->cropView:Lcom/vk/attachpicker/crop/CropImageView;

    .line 73
    const v1, 0x7f10048a

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/vk/attachpicker/widget/EditorBottomPanel;

    iput-object v1, p0, Lcom/vk/attachpicker/screen/AvatarAreaSelectionScreen;->bottomPanel:Lcom/vk/attachpicker/widget/EditorBottomPanel;

    .line 74
    const v1, 0x7f100467

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/vk/attachpicker/widget/ContextProgressView;

    iput-object v1, p0, Lcom/vk/attachpicker/screen/AvatarAreaSelectionScreen;->progressView:Lcom/vk/attachpicker/widget/ContextProgressView;

    .line 76
    iget-object v1, p0, Lcom/vk/attachpicker/screen/AvatarAreaSelectionScreen;->bottomPanel:Lcom/vk/attachpicker/widget/EditorBottomPanel;

    invoke-static {p0}, Lcom/vk/attachpicker/screen/AvatarAreaSelectionScreen$$Lambda$1;->lambdaFactory$(Lcom/vk/attachpicker/screen/AvatarAreaSelectionScreen;)Landroid/view/View$OnClickListener;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vk/attachpicker/widget/EditorBottomPanel;->setOnCancelClickListener(Landroid/view/View$OnClickListener;)V

    .line 83
    iget-object v1, p0, Lcom/vk/attachpicker/screen/AvatarAreaSelectionScreen;->bottomPanel:Lcom/vk/attachpicker/widget/EditorBottomPanel;

    invoke-static {p0}, Lcom/vk/attachpicker/screen/AvatarAreaSelectionScreen$$Lambda$2;->lambdaFactory$(Lcom/vk/attachpicker/screen/AvatarAreaSelectionScreen;)Landroid/view/View$OnClickListener;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vk/attachpicker/widget/EditorBottomPanel;->setOnApplyClickListener(Landroid/view/View$OnClickListener;)V

    .line 130
    iget-object v1, p0, Lcom/vk/attachpicker/screen/AvatarAreaSelectionScreen;->cropView:Lcom/vk/attachpicker/crop/CropImageView;

    new-instance v2, Lcom/vk/attachpicker/screen/AvatarAreaSelectionScreen$1;

    invoke-direct {v2, p0}, Lcom/vk/attachpicker/screen/AvatarAreaSelectionScreen$1;-><init>(Lcom/vk/attachpicker/screen/AvatarAreaSelectionScreen;)V

    invoke-virtual {v1, v2}, Lcom/vk/attachpicker/crop/CropImageView;->setDelegate(Lcom/vk/attachpicker/crop/CropImageView$Delegate;)V

    .line 145
    invoke-direct {p0}, Lcom/vk/attachpicker/screen/AvatarAreaSelectionScreen;->loadImages()V

    .line 147
    return-object v0
.end method

.method public finish()V
    .locals 1

    .prologue
    .line 193
    iget-object v0, p0, Lcom/vk/attachpicker/screen/AvatarAreaSelectionScreen;->cropView:Lcom/vk/attachpicker/crop/CropImageView;

    invoke-virtual {v0}, Lcom/vk/attachpicker/crop/CropImageView;->cancelPendingAnimations()V

    .line 194
    iget-object v0, p0, Lcom/vk/attachpicker/screen/AvatarAreaSelectionScreen;->cropView:Lcom/vk/attachpicker/crop/CropImageView;

    invoke-virtual {v0}, Lcom/vk/attachpicker/crop/CropImageView;->disableAll()V

    .line 195
    invoke-super {p0}, Lcom/vk/core/simplescreen/BaseScreen;->finish()V

    .line 196
    return-void
.end method

.method synthetic lambda$createView$0(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 77
    invoke-direct {p0}, Lcom/vk/attachpicker/screen/AvatarAreaSelectionScreen;->checkButtonLock()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 81
    :goto_0
    return-void

    .line 80
    :cond_0
    invoke-virtual {p0}, Lcom/vk/attachpicker/screen/AvatarAreaSelectionScreen;->finish()V

    goto :goto_0
.end method

.method synthetic lambda$createView$1(Landroid/view/View;)V
    .locals 13
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 84
    invoke-direct {p0}, Lcom/vk/attachpicker/screen/AvatarAreaSelectionScreen;->checkButtonLock()Z

    move-result v10

    if-eqz v10, :cond_1

    .line 128
    :cond_0
    :goto_0
    return-void

    .line 88
    :cond_1
    iget-object v10, p0, Lcom/vk/attachpicker/screen/AvatarAreaSelectionScreen;->cropView:Lcom/vk/attachpicker/crop/CropImageView;

    invoke-virtual {v10}, Lcom/vk/attachpicker/crop/CropImageView;->cancelPendingAnimations()V

    .line 90
    invoke-virtual {p0}, Lcom/vk/attachpicker/screen/AvatarAreaSelectionScreen;->getActivity()Landroid/app/Activity;

    move-result-object v1

    .line 91
    .local v1, "a":Landroid/app/Activity;
    if-eqz v1, :cond_0

    .line 97
    :try_start_0
    iget-object v10, p0, Lcom/vk/attachpicker/screen/AvatarAreaSelectionScreen;->cropView:Lcom/vk/attachpicker/crop/CropImageView;

    invoke-virtual {v10}, Lcom/vk/attachpicker/crop/CropImageView;->getCropController()Lcom/vk/attachpicker/crop/CropController;

    move-result-object v10

    invoke-virtual {v10}, Lcom/vk/attachpicker/crop/CropController;->getCropRect()Landroid/graphics/RectF;

    move-result-object v2

    .line 98
    .local v2, "cropRect":Landroid/graphics/RectF;
    iget-object v10, p0, Lcom/vk/attachpicker/screen/AvatarAreaSelectionScreen;->cropView:Lcom/vk/attachpicker/crop/CropImageView;

    invoke-virtual {v10}, Lcom/vk/attachpicker/crop/CropImageView;->getCropController()Lcom/vk/attachpicker/crop/CropController;

    move-result-object v10

    invoke-virtual {v10}, Lcom/vk/attachpicker/crop/CropController;->getImageRect()Landroid/graphics/RectF;

    move-result-object v7

    .line 99
    .local v7, "imageRect":Landroid/graphics/RectF;
    iget v10, v7, Landroid/graphics/RectF;->left:F

    neg-float v3, v10

    .line 100
    .local v3, "deltaX":F
    iget v10, v7, Landroid/graphics/RectF;->top:F

    neg-float v4, v10

    .line 101
    .local v4, "deltaY":F
    iget v10, v2, Landroid/graphics/RectF;->left:F

    add-float/2addr v10, v3

    iput v10, v2, Landroid/graphics/RectF;->left:F

    .line 102
    iget v10, v2, Landroid/graphics/RectF;->top:F

    add-float/2addr v10, v4

    iput v10, v2, Landroid/graphics/RectF;->top:F

    .line 103
    iget v10, v2, Landroid/graphics/RectF;->right:F

    add-float/2addr v10, v3

    iput v10, v2, Landroid/graphics/RectF;->right:F

    .line 104
    iget v10, v2, Landroid/graphics/RectF;->bottom:F

    add-float/2addr v10, v4

    iput v10, v2, Landroid/graphics/RectF;->bottom:F

    .line 105
    iget v10, v7, Landroid/graphics/RectF;->left:F

    add-float/2addr v10, v3

    iput v10, v7, Landroid/graphics/RectF;->left:F

    .line 106
    iget v10, v7, Landroid/graphics/RectF;->top:F

    add-float/2addr v10, v4

    iput v10, v7, Landroid/graphics/RectF;->top:F

    .line 107
    iget v10, v7, Landroid/graphics/RectF;->right:F

    add-float/2addr v10, v3

    iput v10, v7, Landroid/graphics/RectF;->right:F

    .line 108
    iget v10, v7, Landroid/graphics/RectF;->bottom:F

    add-float/2addr v10, v4

    iput v10, v7, Landroid/graphics/RectF;->bottom:F

    .line 111
    iget-object v10, p0, Lcom/vk/attachpicker/screen/AvatarAreaSelectionScreen;->entry:Lcom/vk/attachpicker/mediastore/MediaStoreEntry;

    if-eqz v10, :cond_2

    .line 112
    iget-object v10, p0, Lcom/vk/attachpicker/screen/AvatarAreaSelectionScreen;->entry:Lcom/vk/attachpicker/mediastore/MediaStoreEntry;

    invoke-static {v10}, Lcom/vk/attachpicker/SelectionContext;->packSingleEntry(Lcom/vk/attachpicker/mediastore/MediaStoreEntry;)Landroid/content/Intent;

    move-result-object v9

    .line 120
    .local v9, "resultIntent":Landroid/content/Intent;
    :goto_1
    const-string/jumbo v10, "cropLeft"

    iget v11, v2, Landroid/graphics/RectF;->left:F

    iget v12, v7, Landroid/graphics/RectF;->right:F

    invoke-direct {p0, v11, v12}, Lcom/vk/attachpicker/screen/AvatarAreaSelectionScreen;->div(FF)F

    move-result v11

    invoke-virtual {v9, v10, v11}, Landroid/content/Intent;->putExtra(Ljava/lang/String;F)Landroid/content/Intent;

    .line 121
    const-string/jumbo v10, "cropTop"

    iget v11, v2, Landroid/graphics/RectF;->top:F

    iget v12, v7, Landroid/graphics/RectF;->bottom:F

    invoke-direct {p0, v11, v12}, Lcom/vk/attachpicker/screen/AvatarAreaSelectionScreen;->div(FF)F

    move-result v11

    invoke-virtual {v9, v10, v11}, Landroid/content/Intent;->putExtra(Ljava/lang/String;F)Landroid/content/Intent;

    .line 122
    const-string/jumbo v10, "cropRight"

    iget v11, v2, Landroid/graphics/RectF;->right:F

    iget v12, v7, Landroid/graphics/RectF;->right:F

    invoke-direct {p0, v11, v12}, Lcom/vk/attachpicker/screen/AvatarAreaSelectionScreen;->div(FF)F

    move-result v11

    invoke-virtual {v9, v10, v11}, Landroid/content/Intent;->putExtra(Ljava/lang/String;F)Landroid/content/Intent;

    .line 123
    const-string/jumbo v10, "cropBottom"

    iget v11, v2, Landroid/graphics/RectF;->bottom:F

    iget v12, v7, Landroid/graphics/RectF;->bottom:F

    invoke-direct {p0, v11, v12}, Lcom/vk/attachpicker/screen/AvatarAreaSelectionScreen;->div(FF)F

    move-result v11

    invoke-virtual {v9, v10, v11}, Landroid/content/Intent;->putExtra(Ljava/lang/String;F)Landroid/content/Intent;

    .line 124
    move-object v0, v1

    check-cast v0, Lcom/vk/attachpicker/AttachResulter;

    move-object v10, v0

    invoke-interface {v10, v9}, Lcom/vk/attachpicker/AttachResulter;->setResultAndFinish(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    .line 125
    .end local v2    # "cropRect":Landroid/graphics/RectF;
    .end local v3    # "deltaX":F
    .end local v4    # "deltaY":F
    .end local v7    # "imageRect":Landroid/graphics/RectF;
    .end local v9    # "resultIntent":Landroid/content/Intent;
    :catch_0
    move-exception v5

    .line 126
    .local v5, "e":Ljava/lang/Exception;
    const v10, 0x7f0804df

    const/4 v11, 0x0

    invoke-static {v1, v10, v11}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v10

    invoke-virtual {v10}, Landroid/widget/Toast;->show()V

    goto/16 :goto_0

    .line 114
    .end local v5    # "e":Ljava/lang/Exception;
    .restart local v2    # "cropRect":Landroid/graphics/RectF;
    .restart local v3    # "deltaX":F
    .restart local v4    # "deltaY":F
    .restart local v7    # "imageRect":Landroid/graphics/RectF;
    :cond_2
    :try_start_1
    invoke-static {}, Lcom/vk/core/util/FileUtils;->getPhotoFile()Ljava/io/File;

    move-result-object v8

    .line 115
    .local v8, "resultFile":Ljava/io/File;
    new-instance v6, Ljava/io/FileOutputStream;

    invoke-direct {v6, v8}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 116
    .local v6, "fos":Ljava/io/FileOutputStream;
    iget-object v10, p0, Lcom/vk/attachpicker/screen/AvatarAreaSelectionScreen;->croppedBitmap:Landroid/graphics/Bitmap;

    sget-object v11, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v12, 0x56

    invoke-virtual {v10, v11, v12, v6}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 117
    invoke-static {v8}, Lcom/vk/attachpicker/SelectionContext;->packSinglePhoto(Ljava/io/File;)Landroid/content/Intent;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v9

    .restart local v9    # "resultIntent":Landroid/content/Intent;
    goto :goto_1
.end method

.method synthetic lambda$loadImages$2(Landroid/graphics/Bitmap;)V
    .locals 1
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 161
    iput-object p1, p0, Lcom/vk/attachpicker/screen/AvatarAreaSelectionScreen;->croppedBitmap:Landroid/graphics/Bitmap;

    .line 162
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vk/attachpicker/screen/AvatarAreaSelectionScreen;->currentTask:Lio/reactivex/disposables/Disposable;

    .line 163
    invoke-direct {p0}, Lcom/vk/attachpicker/screen/AvatarAreaSelectionScreen;->initUi()V

    .line 164
    return-void
.end method

.method synthetic lambda$loadImages$3(Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "throwable"    # Ljava/lang/Throwable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 165
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vk/attachpicker/screen/AvatarAreaSelectionScreen;->currentTask:Lio/reactivex/disposables/Disposable;

    return-void
.end method

.method public onBackPressed()Z
    .locals 1

    .prologue
    .line 184
    iget-boolean v0, p0, Lcom/vk/attachpicker/screen/AvatarAreaSelectionScreen;->controlsEnabled:Z

    if-eqz v0, :cond_0

    .line 185
    invoke-super {p0}, Lcom/vk/core/simplescreen/BaseScreen;->onBackPressed()Z

    move-result v0

    .line 187
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public onTopPaddingChanged(I)V
    .locals 2
    .param p1, "topPadding"    # I

    .prologue
    .line 179
    iget-object v0, p0, Lcom/vk/attachpicker/screen/AvatarAreaSelectionScreen;->cropView:Lcom/vk/attachpicker/crop/CropImageView;

    invoke-virtual {v0}, Lcom/vk/attachpicker/crop/CropImageView;->overlayView()Lcom/vk/attachpicker/crop/CropOverlayView;

    move-result-object v0

    sget v1, Lcom/vk/attachpicker/crop/RectCropOverlayView;->SIDE_PADDING:I

    add-int/2addr v1, p1

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/crop/CropOverlayView;->setTopSidePadding(F)V

    .line 180
    return-void
.end method

.method public setControlsEnabled(Z)V
    .locals 0
    .param p1, "enabled"    # Z

    .prologue
    .line 209
    iput-boolean p1, p0, Lcom/vk/attachpicker/screen/AvatarAreaSelectionScreen;->controlsEnabled:Z

    .line 210
    return-void
.end method
