.class public Lcom/vk/camera/camera1/FocusOverlayManager;
.super Ljava/lang/Object;
.source "FocusOverlayManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/camera/camera1/FocusOverlayManager$MainHandler;,
        Lcom/vk/camera/camera1/FocusOverlayManager$Listener;
    }
.end annotation


# static fields
.field private static final RESET_TOUCH_FOCUS:I = 0x0

.field private static final RESET_TOUCH_FOCUS_DELAY:I = 0xbb8

.field private static final STATE_FAIL:I = 0x4

.field private static final STATE_FOCUSING:I = 0x1

.field private static final STATE_FOCUSING_SNAP_ON_FINISH:I = 0x2

.field private static final STATE_IDLE:I = 0x0

.field private static final STATE_SUCCESS:I = 0x3

.field private static final TAG:Ljava/lang/String; = "CAM_FocusManager"


# instance fields
.field private mAeAwbLock:Z

.field private mDisplayOrientation:I

.field private mFocusArea:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private mFocusAreaSupported:Z

.field private mFocusMode:Ljava/lang/String;

.field private mFocusViewCallback:Lcom/vk/camera/camera1/FocusViewCallback;

.field private mHandler:Landroid/os/Handler;

.field mListener:Lcom/vk/camera/camera1/FocusOverlayManager$Listener;

.field private mLockAeAwbNeeded:Z

.field private mMatrix:Landroid/graphics/Matrix;

.field private mMeteringArea:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private mMeteringAreaSupported:Z

.field private mMirror:Z

.field private mOverrideFocusMode:Ljava/lang/String;

.field private mParameters:Landroid/hardware/Camera$Parameters;

.field private mPreviewHeight:I

.field private mPreviewWidth:I

.field private mState:I


# direct methods
.method public constructor <init>(Landroid/hardware/Camera$Parameters;Lcom/vk/camera/camera1/FocusOverlayManager$Listener;ZLandroid/os/Looper;)V
    .locals 1
    .param p1, "parameters"    # Landroid/hardware/Camera$Parameters;
    .param p2, "listener"    # Lcom/vk/camera/camera1/FocusOverlayManager$Listener;
    .param p3, "mirror"    # Z
    .param p4, "looper"    # Landroid/os/Looper;

    .prologue
    .line 94
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    const/4 v0, 0x0

    iput v0, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mState:I

    .line 95
    new-instance v0, Lcom/vk/camera/camera1/FocusOverlayManager$MainHandler;

    invoke-direct {v0, p0, p4}, Lcom/vk/camera/camera1/FocusOverlayManager$MainHandler;-><init>(Lcom/vk/camera/camera1/FocusOverlayManager;Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mHandler:Landroid/os/Handler;

    .line 96
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mMatrix:Landroid/graphics/Matrix;

    .line 97
    invoke-virtual {p0, p1}, Lcom/vk/camera/camera1/FocusOverlayManager;->setParameters(Landroid/hardware/Camera$Parameters;)V

    .line 98
    iput-object p2, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mListener:Lcom/vk/camera/camera1/FocusOverlayManager$Listener;

    .line 99
    invoke-virtual {p0, p3}, Lcom/vk/camera/camera1/FocusOverlayManager;->setMirror(Z)V

    .line 100
    return-void
.end method

.method static synthetic access$000(Lcom/vk/camera/camera1/FocusOverlayManager;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/camera/camera1/FocusOverlayManager;

    .prologue
    .line 30
    invoke-direct {p0}, Lcom/vk/camera/camera1/FocusOverlayManager;->cancelAutoFocus()V

    return-void
.end method

.method private autoFocus()V
    .locals 2

    .prologue
    .line 344
    const-string/jumbo v0, "CAM_FocusManager"

    const-string/jumbo v1, "Start autofocus."

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 345
    iget-object v0, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mListener:Lcom/vk/camera/camera1/FocusOverlayManager$Listener;

    invoke-interface {v0}, Lcom/vk/camera/camera1/FocusOverlayManager$Listener;->autoFocus()V

    .line 346
    const/4 v0, 0x1

    iput v0, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mState:I

    .line 349
    invoke-virtual {p0}, Lcom/vk/camera/camera1/FocusOverlayManager;->updateFocusUI()V

    .line 350
    iget-object v0, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 351
    return-void
.end method

.method private calculateTapArea(IIFIIIILandroid/graphics/Rect;)V
    .locals 10
    .param p1, "focusWidth"    # I
    .param p2, "focusHeight"    # I
    .param p3, "areaMultiple"    # F
    .param p4, "x"    # I
    .param p5, "y"    # I
    .param p6, "previewWidth"    # I
    .param p7, "previewHeight"    # I
    .param p8, "rect"    # Landroid/graphics/Rect;

    .prologue
    .line 444
    int-to-float v6, p1

    mul-float/2addr v6, p3

    float-to-int v2, v6

    .line 445
    .local v2, "areaWidth":I
    int-to-float v6, p2

    mul-float/2addr v6, p3

    float-to-int v1, v6

    .line 446
    .local v1, "areaHeight":I
    div-int/lit8 v6, v2, 0x2

    sub-int v6, p4, v6

    const/4 v7, 0x0

    sub-int v8, p6, v2

    invoke-static {v6, v7, v8}, Lcom/vk/camera/camera1/CameraUtils;->clamp(III)I

    move-result v3

    .line 447
    .local v3, "left":I
    div-int/lit8 v6, v1, 0x2

    sub-int v6, p5, v6

    const/4 v7, 0x0

    sub-int v8, p7, v1

    invoke-static {v6, v7, v8}, Lcom/vk/camera/camera1/CameraUtils;->clamp(III)I

    move-result v5

    .line 449
    .local v5, "top":I
    new-instance v4, Landroid/graphics/RectF;

    int-to-float v6, v3

    int-to-float v7, v5

    add-int v8, v3, v2

    int-to-float v8, v8

    add-int v9, v5, v1

    int-to-float v9, v9

    invoke-direct {v4, v6, v7, v8, v9}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 450
    .local v4, "rectF":Landroid/graphics/RectF;
    iget-object v6, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v6, v4}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 451
    move-object/from16 v0, p8

    invoke-static {v4, v0}, Lcom/vk/camera/camera1/CameraUtils;->rectFToRect(Landroid/graphics/RectF;Landroid/graphics/Rect;)V

    .line 452
    return-void
.end method

.method private cancelAutoFocus()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 354
    const-string/jumbo v0, "CAM_FocusManager"

    const-string/jumbo v1, "Cancel autofocus."

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 359
    invoke-virtual {p0}, Lcom/vk/camera/camera1/FocusOverlayManager;->resetTouchFocus()V

    .line 360
    iget-object v0, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mListener:Lcom/vk/camera/camera1/FocusOverlayManager$Listener;

    invoke-interface {v0}, Lcom/vk/camera/camera1/FocusOverlayManager$Listener;->cancelAutoFocus()V

    .line 361
    iput v2, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mState:I

    .line 362
    invoke-virtual {p0}, Lcom/vk/camera/camera1/FocusOverlayManager;->updateFocusUI()V

    .line 363
    iget-object v0, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v2}, Landroid/os/Handler;->removeMessages(I)V

    .line 364
    return-void
.end method

.method private capture()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 367
    iget-object v0, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mListener:Lcom/vk/camera/camera1/FocusOverlayManager$Listener;

    invoke-interface {v0}, Lcom/vk/camera/camera1/FocusOverlayManager$Listener;->capture()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 368
    iput v1, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mState:I

    .line 369
    iget-object v0, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 371
    :cond_0
    return-void
.end method

.method private initializeFocusAreas(IIIIII)V
    .locals 9
    .param p1, "focusWidth"    # I
    .param p2, "focusHeight"    # I
    .param p3, "x"    # I
    .param p4, "y"    # I
    .param p5, "previewWidth"    # I
    .param p6, "previewHeight"    # I
    .annotation build Landroid/annotation/TargetApi;
        value = 0xe
    .end annotation

    .prologue
    .line 260
    iget-object v0, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mFocusArea:Ljava/util/List;

    if-nez v0, :cond_0

    .line 261
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mFocusArea:Ljava/util/List;

    .line 262
    iget-object v0, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mFocusArea:Ljava/util/List;

    new-instance v1, Landroid/hardware/Camera$Area;

    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Landroid/hardware/Camera$Area;-><init>(Landroid/graphics/Rect;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 266
    :cond_0
    const/high16 v3, 0x3f800000    # 1.0f

    iget-object v0, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mFocusArea:Ljava/util/List;

    const/4 v1, 0x0

    .line 267
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/Camera$Area;

    iget-object v8, v0, Landroid/hardware/Camera$Area;->rect:Landroid/graphics/Rect;

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v4, p3

    move v5, p4

    move v6, p5

    move v7, p6

    .line 266
    invoke-direct/range {v0 .. v8}, Lcom/vk/camera/camera1/FocusOverlayManager;->calculateTapArea(IIFIIIILandroid/graphics/Rect;)V

    .line 268
    return-void
.end method

.method private initializeMeteringAreas(IIIIII)V
    .locals 9
    .param p1, "focusWidth"    # I
    .param p2, "focusHeight"    # I
    .param p3, "x"    # I
    .param p4, "y"    # I
    .param p5, "previewWidth"    # I
    .param p6, "previewHeight"    # I
    .annotation build Landroid/annotation/TargetApi;
        value = 0xe
    .end annotation

    .prologue
    .line 273
    iget-object v0, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mMeteringArea:Ljava/util/List;

    if-nez v0, :cond_0

    .line 274
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mMeteringArea:Ljava/util/List;

    .line 275
    iget-object v0, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mMeteringArea:Ljava/util/List;

    new-instance v1, Landroid/hardware/Camera$Area;

    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Landroid/hardware/Camera$Area;-><init>(Landroid/graphics/Rect;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 281
    :cond_0
    const/high16 v3, 0x3fc00000    # 1.5f

    iget-object v0, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mMeteringArea:Ljava/util/List;

    const/4 v1, 0x0

    .line 282
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/Camera$Area;

    iget-object v8, v0, Landroid/hardware/Camera$Area;->rect:Landroid/graphics/Rect;

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v4, p3

    move v5, p4

    move v6, p5

    move v7, p6

    .line 281
    invoke-direct/range {v0 .. v8}, Lcom/vk/camera/camera1/FocusOverlayManager;->calculateTapArea(IIFIIIILandroid/graphics/Rect;)V

    .line 283
    return-void
.end method

.method private isInitialized()Z
    .locals 1

    .prologue
    .line 103
    iget-object v0, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mMatrix:Landroid/graphics/Matrix;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mFocusViewCallback:Lcom/vk/camera/camera1/FocusViewCallback;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private lockAeAwbIfNeeded()V
    .locals 1

    .prologue
    .line 154
    iget-boolean v0, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mLockAeAwbNeeded:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mAeAwbLock:Z

    if-nez v0, :cond_0

    .line 155
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mAeAwbLock:Z

    .line 156
    iget-object v0, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mListener:Lcom/vk/camera/camera1/FocusOverlayManager$Listener;

    invoke-interface {v0}, Lcom/vk/camera/camera1/FocusOverlayManager$Listener;->setFocusParameters()V

    .line 158
    :cond_0
    return-void
.end method

.method private needAutoFocusCall()Z
    .locals 2

    .prologue
    .line 483
    invoke-virtual {p0}, Lcom/vk/camera/camera1/FocusOverlayManager;->getFocusMode()Ljava/lang/String;

    move-result-object v0

    .line 484
    .local v0, "focusMode":Ljava/lang/String;
    const-string/jumbo v1, "infinity"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string/jumbo v1, "fixed"

    .line 485
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string/jumbo v1, "edof"

    .line 486
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private setMatrix()V
    .locals 5

    .prologue
    .line 142
    iget v1, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mPreviewWidth:I

    if-eqz v1, :cond_0

    iget v1, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mPreviewHeight:I

    if-eqz v1, :cond_0

    .line 143
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    .line 144
    .local v0, "matrix":Landroid/graphics/Matrix;
    iget-boolean v1, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mMirror:Z

    iget v2, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mDisplayOrientation:I

    iget v3, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mPreviewWidth:I

    iget v4, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mPreviewHeight:I

    invoke-static {v0, v1, v2, v3, v4}, Lcom/vk/camera/camera1/CameraUtils;->prepareMatrix(Landroid/graphics/Matrix;ZIII)V

    .line 149
    iget-object v1, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->invert(Landroid/graphics/Matrix;)Z

    .line 151
    .end local v0    # "matrix":Landroid/graphics/Matrix;
    :cond_0
    return-void
.end method

.method private unlockAeAwbIfNeeded()V
    .locals 2

    .prologue
    .line 161
    iget-boolean v0, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mLockAeAwbNeeded:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mAeAwbLock:Z

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mState:I

    const/4 v1, 0x2

    if-eq v0, v1, :cond_0

    .line 162
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mAeAwbLock:Z

    .line 163
    iget-object v0, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mListener:Lcom/vk/camera/camera1/FocusOverlayManager$Listener;

    invoke-interface {v0}, Lcom/vk/camera/camera1/FocusOverlayManager$Listener;->setFocusParameters()V

    .line 165
    :cond_0
    return-void
.end method


# virtual methods
.method public doSnap()V
    .locals 2

    .prologue
    .line 199
    invoke-direct {p0}, Lcom/vk/camera/camera1/FocusOverlayManager;->isInitialized()Z

    move-result v0

    if-nez v0, :cond_1

    .line 218
    :cond_0
    :goto_0
    return-void

    .line 204
    :cond_1
    invoke-direct {p0}, Lcom/vk/camera/camera1/FocusOverlayManager;->needAutoFocusCall()Z

    move-result v0

    if-eqz v0, :cond_2

    iget v0, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mState:I

    const/4 v1, 0x3

    if-eq v0, v1, :cond_2

    iget v0, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mState:I

    const/4 v1, 0x4

    if-ne v0, v1, :cond_3

    .line 205
    :cond_2
    invoke-direct {p0}, Lcom/vk/camera/camera1/FocusOverlayManager;->capture()V

    goto :goto_0

    .line 206
    :cond_3
    iget v0, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mState:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_4

    .line 210
    const/4 v0, 0x2

    iput v0, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mState:I

    goto :goto_0

    .line 211
    :cond_4
    iget v0, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mState:I

    if-nez v0, :cond_0

    .line 216
    invoke-direct {p0}, Lcom/vk/camera/camera1/FocusOverlayManager;->capture()V

    goto :goto_0
.end method

.method public getAeAwbLock()Z
    .locals 1

    .prologue
    .line 479
    iget-boolean v0, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mAeAwbLock:Z

    return v0
.end method

.method public getFocusAreas()Ljava/util/List;
    .locals 1

    .prologue
    .line 398
    iget-object v0, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mFocusArea:Ljava/util/List;

    return-object v0
.end method

.method public getFocusMode()Ljava/lang/String;
    .locals 3

    .prologue
    .line 374
    iget-object v1, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mOverrideFocusMode:Ljava/lang/String;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mOverrideFocusMode:Ljava/lang/String;

    .line 394
    :goto_0
    return-object v1

    .line 375
    :cond_0
    iget-object v1, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mParameters:Landroid/hardware/Camera$Parameters;

    invoke-virtual {v1}, Landroid/hardware/Camera$Parameters;->getSupportedFocusModes()Ljava/util/List;

    move-result-object v0

    .line 377
    .local v0, "supportedFocusModes":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    iget-boolean v1, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mFocusAreaSupported:Z

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mFocusArea:Ljava/util/List;

    if-eqz v1, :cond_2

    .line 379
    const-string/jumbo v1, "auto"

    iput-object v1, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mFocusMode:Ljava/lang/String;

    .line 384
    :goto_1
    iget-object v1, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mFocusMode:Ljava/lang/String;

    invoke-static {v1, v0}, Lcom/vk/camera/camera1/CameraUtils;->isSupported(Ljava/lang/String;Ljava/util/List;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 387
    const-string/jumbo v1, "auto"

    iget-object v2, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mParameters:Landroid/hardware/Camera$Parameters;

    .line 388
    invoke-virtual {v2}, Landroid/hardware/Camera$Parameters;->getSupportedFocusModes()Ljava/util/List;

    move-result-object v2

    .line 387
    invoke-static {v1, v2}, Lcom/vk/camera/camera1/CameraUtils;->isSupported(Ljava/lang/String;Ljava/util/List;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 389
    const-string/jumbo v1, "auto"

    iput-object v1, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mFocusMode:Ljava/lang/String;

    .line 394
    :cond_1
    :goto_2
    iget-object v1, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mFocusMode:Ljava/lang/String;

    goto :goto_0

    .line 382
    :cond_2
    const-string/jumbo v1, "continuous-picture"

    iput-object v1, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mFocusMode:Ljava/lang/String;

    goto :goto_1

    .line 391
    :cond_3
    iget-object v1, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mParameters:Landroid/hardware/Camera$Parameters;

    invoke-virtual {v1}, Landroid/hardware/Camera$Parameters;->getFocusMode()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mFocusMode:Ljava/lang/String;

    goto :goto_2
.end method

.method getFocusState()I
    .locals 1

    .prologue
    .line 455
    iget v0, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mState:I

    return v0
.end method

.method public getMeteringAreas()Ljava/util/List;
    .locals 1

    .prologue
    .line 402
    iget-object v0, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mMeteringArea:Ljava/util/List;

    return-object v0
.end method

.method public isFocusCompleted()Z
    .locals 2

    .prologue
    .line 459
    iget v0, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mState:I

    const/4 v1, 0x3

    if-eq v0, v1, :cond_0

    iget v0, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mState:I

    const/4 v1, 0x4

    if-ne v0, v1, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isFocusingSnapOnFinish()Z
    .locals 2

    .prologue
    .line 463
    iget v0, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mState:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onAutoFocus(ZZ)V
    .locals 4
    .param p1, "focused"    # Z
    .param p2, "shutterButtonPressed"    # Z

    .prologue
    const/4 v3, 0x4

    const/4 v2, 0x3

    .line 221
    iget v0, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mState:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_2

    .line 225
    if-eqz p1, :cond_1

    .line 226
    iput v2, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mState:I

    .line 230
    :goto_0
    invoke-virtual {p0}, Lcom/vk/camera/camera1/FocusOverlayManager;->updateFocusUI()V

    .line 231
    invoke-direct {p0}, Lcom/vk/camera/camera1/FocusOverlayManager;->capture()V

    .line 255
    :cond_0
    :goto_1
    return-void

    .line 228
    :cond_1
    iput v3, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mState:I

    goto :goto_0

    .line 232
    :cond_2
    iget v0, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mState:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_5

    .line 236
    if-eqz p1, :cond_4

    .line 237
    iput v2, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mState:I

    .line 241
    :goto_2
    invoke-virtual {p0}, Lcom/vk/camera/camera1/FocusOverlayManager;->updateFocusUI()V

    .line 244
    iget-object v0, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mFocusArea:Ljava/util/List;

    if-eqz v0, :cond_3

    .line 245
    iget-object v0, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    const-wide/16 v2, 0xbb8

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 247
    :cond_3
    if-eqz p2, :cond_0

    .line 249
    invoke-direct {p0}, Lcom/vk/camera/camera1/FocusOverlayManager;->lockAeAwbIfNeeded()V

    goto :goto_1

    .line 239
    :cond_4
    iput v3, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mState:I

    goto :goto_2

    .line 251
    :cond_5
    iget v0, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mState:I

    if-nez v0, :cond_0

    goto :goto_1
.end method

.method public onCameraReleased()V
    .locals 0

    .prologue
    .line 340
    invoke-virtual {p0}, Lcom/vk/camera/camera1/FocusOverlayManager;->onPreviewStopped()V

    .line 341
    return-void
.end method

.method public onPreviewStarted()V
    .locals 1

    .prologue
    .line 329
    const/4 v0, 0x0

    iput v0, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mState:I

    .line 330
    return-void
.end method

.method public onPreviewStopped()V
    .locals 1

    .prologue
    .line 334
    const/4 v0, 0x0

    iput v0, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mState:I

    .line 335
    invoke-virtual {p0}, Lcom/vk/camera/camera1/FocusOverlayManager;->resetTouchFocus()V

    .line 336
    invoke-virtual {p0}, Lcom/vk/camera/camera1/FocusOverlayManager;->updateFocusUI()V

    .line 337
    return-void
.end method

.method public onShutterDown()V
    .locals 3

    .prologue
    .line 168
    invoke-direct {p0}, Lcom/vk/camera/camera1/FocusOverlayManager;->isInitialized()Z

    move-result v1

    if-nez v1, :cond_1

    .line 180
    :cond_0
    :goto_0
    return-void

    .line 170
    :cond_1
    const/4 v0, 0x0

    .line 171
    .local v0, "autoFocusCalled":Z
    invoke-direct {p0}, Lcom/vk/camera/camera1/FocusOverlayManager;->needAutoFocusCall()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 173
    iget v1, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mState:I

    const/4 v2, 0x3

    if-eq v1, v2, :cond_2

    iget v1, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mState:I

    const/4 v2, 0x4

    if-eq v1, v2, :cond_2

    .line 174
    invoke-direct {p0}, Lcom/vk/camera/camera1/FocusOverlayManager;->autoFocus()V

    .line 175
    const/4 v0, 0x1

    .line 179
    :cond_2
    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/vk/camera/camera1/FocusOverlayManager;->lockAeAwbIfNeeded()V

    goto :goto_0
.end method

.method public onShutterUp()V
    .locals 2

    .prologue
    .line 183
    invoke-direct {p0}, Lcom/vk/camera/camera1/FocusOverlayManager;->isInitialized()Z

    move-result v0

    if-nez v0, :cond_0

    .line 196
    :goto_0
    return-void

    .line 185
    :cond_0
    invoke-direct {p0}, Lcom/vk/camera/camera1/FocusOverlayManager;->needAutoFocusCall()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 187
    iget v0, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mState:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_1

    iget v0, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mState:I

    const/4 v1, 0x3

    if-eq v0, v1, :cond_1

    iget v0, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mState:I

    const/4 v1, 0x4

    if-ne v0, v1, :cond_2

    .line 189
    :cond_1
    invoke-direct {p0}, Lcom/vk/camera/camera1/FocusOverlayManager;->cancelAutoFocus()V

    .line 195
    :cond_2
    invoke-direct {p0}, Lcom/vk/camera/camera1/FocusOverlayManager;->unlockAeAwbIfNeeded()V

    goto :goto_0
.end method

.method public onSingleTapUp(II)V
    .locals 11
    .param p1, "x"    # I
    .param p2, "y"    # I

    .prologue
    const/4 v10, 0x0

    const v4, 0x3d4ccccd    # 0.05f

    .line 286
    invoke-direct {p0}, Lcom/vk/camera/camera1/FocusOverlayManager;->isInitialized()Z

    move-result v0

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mState:I

    const/4 v3, 0x2

    if-ne v0, v3, :cond_1

    .line 326
    :cond_0
    :goto_0
    return-void

    .line 289
    :cond_1
    iget-object v0, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mFocusArea:Ljava/util/List;

    if-eqz v0, :cond_3

    iget v0, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mState:I

    const/4 v3, 0x1

    if-eq v0, v3, :cond_2

    iget v0, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mState:I

    const/4 v3, 0x3

    if-eq v0, v3, :cond_2

    iget v0, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mState:I

    const/4 v3, 0x4

    if-ne v0, v3, :cond_3

    .line 291
    :cond_2
    invoke-direct {p0}, Lcom/vk/camera/camera1/FocusOverlayManager;->cancelAutoFocus()V

    .line 294
    :cond_3
    iget v0, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mPreviewWidth:I

    int-to-float v0, v0

    mul-float/2addr v0, v4

    float-to-int v1, v0

    .line 295
    .local v1, "focusWidth":I
    iget v0, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mPreviewHeight:I

    int-to-float v0, v0

    mul-float/2addr v0, v4

    float-to-int v2, v0

    .line 296
    .local v2, "focusHeight":I
    iget v5, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mPreviewWidth:I

    .line 297
    .local v5, "previewWidth":I
    iget v6, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mPreviewHeight:I

    .line 299
    .local v6, "previewHeight":I
    iget-object v0, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mListener:Lcom/vk/camera/camera1/FocusOverlayManager$Listener;

    invoke-interface {v0, p1, p2}, Lcom/vk/camera/camera1/FocusOverlayManager$Listener;->transformToPreviewCoordinates(II)Landroid/graphics/Point;

    move-result-object v7

    .line 300
    .local v7, "previewCoordinates":Landroid/graphics/Point;
    if-eqz v7, :cond_5

    .line 302
    iget-boolean v0, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mFocusAreaSupported:Z

    if-eqz v0, :cond_4

    .line 303
    iget v3, v7, Landroid/graphics/Point;->x:I

    iget v4, v7, Landroid/graphics/Point;->y:I

    move-object v0, p0

    invoke-direct/range {v0 .. v6}, Lcom/vk/camera/camera1/FocusOverlayManager;->initializeFocusAreas(IIIIII)V

    .line 307
    :cond_4
    iget-boolean v0, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mMeteringAreaSupported:Z

    if-eqz v0, :cond_5

    .line 308
    iget v3, v7, Landroid/graphics/Point;->x:I

    iget v4, v7, Landroid/graphics/Point;->y:I

    move-object v0, p0

    invoke-direct/range {v0 .. v6}, Lcom/vk/camera/camera1/FocusOverlayManager;->initializeMeteringAreas(IIIIII)V

    .line 314
    :cond_5
    iget-object v0, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mFocusViewCallback:Lcom/vk/camera/camera1/FocusViewCallback;

    invoke-interface {v0, p1, p2}, Lcom/vk/camera/camera1/FocusViewCallback;->setFocus(II)V

    .line 317
    iget-object v0, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mListener:Lcom/vk/camera/camera1/FocusOverlayManager$Listener;

    invoke-interface {v0}, Lcom/vk/camera/camera1/FocusOverlayManager$Listener;->setFocusParameters()V

    .line 318
    iget-boolean v0, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mFocusAreaSupported:Z

    if-eqz v0, :cond_6

    .line 319
    invoke-direct {p0}, Lcom/vk/camera/camera1/FocusOverlayManager;->autoFocus()V

    goto :goto_0

    .line 321
    :cond_6
    invoke-virtual {p0}, Lcom/vk/camera/camera1/FocusOverlayManager;->updateFocusUI()V

    .line 323
    iget-object v0, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v10}, Landroid/os/Handler;->removeMessages(I)V

    .line 324
    iget-object v0, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mHandler:Landroid/os/Handler;

    const-wide/16 v8, 0xbb8

    invoke-virtual {v0, v10, v8, v9}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    goto :goto_0
.end method

.method public overrideFocusMode(Ljava/lang/String;)V
    .locals 0
    .param p1, "focusMode"    # Ljava/lang/String;

    .prologue
    .line 471
    iput-object p1, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mOverrideFocusMode:Ljava/lang/String;

    .line 472
    return-void
.end method

.method public removeMessages()V
    .locals 2

    .prologue
    .line 467
    iget-object v0, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 468
    return-void
.end method

.method public resetTouchFocus()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 433
    invoke-direct {p0}, Lcom/vk/camera/camera1/FocusOverlayManager;->isInitialized()Z

    move-result v0

    if-nez v0, :cond_0

    .line 440
    :goto_0
    return-void

    .line 436
    :cond_0
    iget-object v0, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mFocusViewCallback:Lcom/vk/camera/camera1/FocusViewCallback;

    invoke-interface {v0}, Lcom/vk/camera/camera1/FocusViewCallback;->clear()V

    .line 438
    iput-object v1, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mFocusArea:Ljava/util/List;

    .line 439
    iput-object v1, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mMeteringArea:Ljava/util/List;

    goto :goto_0
.end method

.method public setAeAwbLock(Z)V
    .locals 0
    .param p1, "lock"    # Z

    .prologue
    .line 475
    iput-boolean p1, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mAeAwbLock:Z

    .line 476
    return-void
.end method

.method public setDisplayOrientation(I)V
    .locals 0
    .param p1, "displayOrientation"    # I

    .prologue
    .line 137
    iput p1, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mDisplayOrientation:I

    .line 138
    invoke-direct {p0}, Lcom/vk/camera/camera1/FocusOverlayManager;->setMatrix()V

    .line 139
    return-void
.end method

.method public setFocusView(Lcom/vk/camera/camera1/FocusViewCallback;)V
    .locals 0
    .param p1, "mFocusViewCallback"    # Lcom/vk/camera/camera1/FocusViewCallback;

    .prologue
    .line 107
    iput-object p1, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mFocusViewCallback:Lcom/vk/camera/camera1/FocusViewCallback;

    .line 108
    return-void
.end method

.method public setMirror(Z)V
    .locals 0
    .param p1, "mirror"    # Z

    .prologue
    .line 132
    iput-boolean p1, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mMirror:Z

    .line 133
    invoke-direct {p0}, Lcom/vk/camera/camera1/FocusOverlayManager;->setMatrix()V

    .line 134
    return-void
.end method

.method public setParameters(Landroid/hardware/Camera$Parameters;)V
    .locals 1
    .param p1, "parameters"    # Landroid/hardware/Camera$Parameters;

    .prologue
    .line 115
    if-nez p1, :cond_0

    .line 121
    :goto_0
    return-void

    .line 116
    :cond_0
    iput-object p1, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mParameters:Landroid/hardware/Camera$Parameters;

    .line 117
    invoke-static {p1}, Lcom/vk/camera/camera1/CameraUtils;->isFocusAreaSupported(Landroid/hardware/Camera$Parameters;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mFocusAreaSupported:Z

    .line 118
    invoke-static {p1}, Lcom/vk/camera/camera1/CameraUtils;->isMeteringAreaSupported(Landroid/hardware/Camera$Parameters;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mMeteringAreaSupported:Z

    .line 119
    iget-object v0, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mParameters:Landroid/hardware/Camera$Parameters;

    invoke-static {v0}, Lcom/vk/camera/camera1/CameraUtils;->isAutoExposureLockSupported(Landroid/hardware/Camera$Parameters;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mParameters:Landroid/hardware/Camera$Parameters;

    .line 120
    invoke-static {v0}, Lcom/vk/camera/camera1/CameraUtils;->isAutoWhiteBalanceLockSupported(Landroid/hardware/Camera$Parameters;)Z

    move-result v0

    if-eqz v0, :cond_2

    :cond_1
    const/4 v0, 0x1

    :goto_1
    iput-boolean v0, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mLockAeAwbNeeded:Z

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    goto :goto_1
.end method

.method public setPreviewSize(II)V
    .locals 1
    .param p1, "previewWidth"    # I
    .param p2, "previewHeight"    # I

    .prologue
    .line 124
    iget v0, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mPreviewWidth:I

    if-ne v0, p1, :cond_0

    iget v0, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mPreviewHeight:I

    if-eq v0, p2, :cond_1

    .line 125
    :cond_0
    iput p1, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mPreviewWidth:I

    .line 126
    iput p2, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mPreviewHeight:I

    .line 127
    invoke-direct {p0}, Lcom/vk/camera/camera1/FocusOverlayManager;->setMatrix()V

    .line 129
    :cond_1
    return-void
.end method

.method public updateFocusUI()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 406
    invoke-direct {p0}, Lcom/vk/camera/camera1/FocusOverlayManager;->isInitialized()Z

    move-result v0

    if-nez v0, :cond_1

    .line 430
    :cond_0
    :goto_0
    return-void

    .line 409
    :cond_1
    iget v0, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mState:I

    if-nez v0, :cond_3

    .line 410
    iget-object v0, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mFocusArea:Ljava/util/List;

    if-nez v0, :cond_2

    .line 411
    iget-object v0, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mFocusViewCallback:Lcom/vk/camera/camera1/FocusViewCallback;

    invoke-interface {v0}, Lcom/vk/camera/camera1/FocusViewCallback;->clear()V

    goto :goto_0

    .line 416
    :cond_2
    iget-object v0, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mFocusViewCallback:Lcom/vk/camera/camera1/FocusViewCallback;

    invoke-interface {v0}, Lcom/vk/camera/camera1/FocusViewCallback;->showStart()V

    goto :goto_0

    .line 418
    :cond_3
    iget v0, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mState:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_4

    iget v0, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mState:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_5

    .line 419
    :cond_4
    iget-object v0, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mFocusViewCallback:Lcom/vk/camera/camera1/FocusViewCallback;

    invoke-interface {v0}, Lcom/vk/camera/camera1/FocusViewCallback;->showStart()V

    goto :goto_0

    .line 421
    :cond_5
    const-string/jumbo v0, "continuous-picture"

    iget-object v1, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mFocusMode:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 423
    iget-object v0, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mFocusViewCallback:Lcom/vk/camera/camera1/FocusViewCallback;

    invoke-interface {v0, v2}, Lcom/vk/camera/camera1/FocusViewCallback;->showSuccess(Z)V

    goto :goto_0

    .line 424
    :cond_6
    iget v0, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mState:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_7

    .line 425
    iget-object v0, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mFocusViewCallback:Lcom/vk/camera/camera1/FocusViewCallback;

    invoke-interface {v0, v2}, Lcom/vk/camera/camera1/FocusViewCallback;->showSuccess(Z)V

    goto :goto_0

    .line 426
    :cond_7
    iget v0, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mState:I

    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    .line 427
    iget-object v0, p0, Lcom/vk/camera/camera1/FocusOverlayManager;->mFocusViewCallback:Lcom/vk/camera/camera1/FocusViewCallback;

    invoke-interface {v0, v2}, Lcom/vk/camera/camera1/FocusViewCallback;->showFail(Z)V

    goto :goto_0
.end method
