.class public Lcom/vk/attachpicker/editor/ImageState;
.super Ljava/lang/Object;
.source "ImageState.java"


# static fields
.field public static final PREVIEW_WIDTH:F


# instance fields
.field private autoEnhanceValue:F

.field private autoFixedBitmap:Landroid/graphics/Bitmap;

.field private autoFixedGeometryState:Lcom/vk/attachpicker/crop/GeometryState;

.field private bigBitmap:Landroid/graphics/Bitmap;

.field private croppedBitmap:Landroid/graphics/Bitmap;

.field private croppedGeometryState:Lcom/vk/attachpicker/crop/GeometryState;

.field private final entry:Lcom/vk/attachpicker/mediastore/MediaStoreEntry;

.field private final file:Ljava/io/File;

.field private geometryState:Lcom/vk/attachpicker/crop/GeometryState;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 21
    const/16 v0, 0x438

    invoke-static {}, Lcom/vk/core/util/Screen;->realWidth()I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    int-to-float v0, v0

    sput v0, Lcom/vk/attachpicker/editor/ImageState;->PREVIEW_WIDTH:F

    return-void
.end method

.method public constructor <init>(Lcom/vk/attachpicker/mediastore/MediaStoreEntry;)V
    .locals 1
    .param p1, "entry"    # Lcom/vk/attachpicker/mediastore/MediaStoreEntry;

    .prologue
    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    iput-object p1, p0, Lcom/vk/attachpicker/editor/ImageState;->entry:Lcom/vk/attachpicker/mediastore/MediaStoreEntry;

    .line 39
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vk/attachpicker/editor/ImageState;->file:Ljava/io/File;

    .line 40
    return-void
.end method

.method public constructor <init>(Ljava/io/File;)V
    .locals 1
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    iput-object p1, p0, Lcom/vk/attachpicker/editor/ImageState;->file:Ljava/io/File;

    .line 44
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vk/attachpicker/editor/ImageState;->entry:Lcom/vk/attachpicker/mediastore/MediaStoreEntry;

    .line 45
    return-void
.end method

.method private stubCropAreaProvider(I)Lcom/vk/attachpicker/crop/CropAreaProvider;
    .locals 2
    .param p1, "targetWidth"    # I

    .prologue
    .line 130
    iget-object v0, p0, Lcom/vk/attachpicker/editor/ImageState;->geometryState:Lcom/vk/attachpicker/crop/GeometryState;

    int-to-float v1, p1

    .line 131
    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/crop/GeometryState;->getHeightForWidth(F)F

    move-result v0

    float-to-int v0, v0

    .line 130
    invoke-static {p1, v0}, Lcom/vk/attachpicker/crop/CropUtils;->createCropAreaProvider(II)Lcom/vk/attachpicker/crop/CropAreaProvider;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public getAutoEnhanceValue()F
    .locals 1

    .prologue
    .line 122
    iget v0, p0, Lcom/vk/attachpicker/editor/ImageState;->autoEnhanceValue:F

    return v0
.end method

.method public declared-synchronized getAutoFixedBitmap()Landroid/graphics/Bitmap;
    .locals 3

    .prologue
    .line 95
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lcom/vk/attachpicker/editor/ImageState;->getCroppedBitmap()Landroid/graphics/Bitmap;

    .line 96
    iget-object v0, p0, Lcom/vk/attachpicker/editor/ImageState;->autoFixedGeometryState:Lcom/vk/attachpicker/crop/GeometryState;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vk/attachpicker/editor/ImageState;->autoFixedBitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vk/attachpicker/editor/ImageState;->autoFixedBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/vk/attachpicker/editor/ImageState;->autoFixedGeometryState:Lcom/vk/attachpicker/crop/GeometryState;

    iget-object v1, p0, Lcom/vk/attachpicker/editor/ImageState;->geometryState:Lcom/vk/attachpicker/crop/GeometryState;

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/crop/GeometryState;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 97
    :cond_0
    iget-object v0, p0, Lcom/vk/attachpicker/editor/ImageState;->croppedBitmap:Landroid/graphics/Bitmap;

    sget-object v1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Bitmap;->copy(Landroid/graphics/Bitmap$Config;Z)Landroid/graphics/Bitmap;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/attachpicker/editor/ImageState;->autoFixedBitmap:Landroid/graphics/Bitmap;

    .line 98
    iget-object v0, p0, Lcom/vk/attachpicker/editor/ImageState;->autoFixedBitmap:Landroid/graphics/Bitmap;

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-static {v0, v1}, Lcom/vk/attachpicker/jni/Native;->enhanceBitmap(Landroid/graphics/Bitmap;F)V

    .line 99
    iget-object v0, p0, Lcom/vk/attachpicker/editor/ImageState;->autoFixedBitmap:Landroid/graphics/Bitmap;

    invoke-static {v0}, Lcom/vk/attachpicker/jni/Native;->flipVerticallyBitmap(Landroid/graphics/Bitmap;)V

    .line 101
    new-instance v0, Lcom/vk/attachpicker/crop/GeometryState;

    iget-object v1, p0, Lcom/vk/attachpicker/editor/ImageState;->autoFixedBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    int-to-float v1, v1

    iget-object v2, p0, Lcom/vk/attachpicker/editor/ImageState;->autoFixedBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    int-to-float v2, v2

    invoke-direct {v0, v1, v2}, Lcom/vk/attachpicker/crop/GeometryState;-><init>(FF)V

    iput-object v0, p0, Lcom/vk/attachpicker/editor/ImageState;->autoFixedGeometryState:Lcom/vk/attachpicker/crop/GeometryState;

    .line 102
    iget-object v0, p0, Lcom/vk/attachpicker/editor/ImageState;->autoFixedGeometryState:Lcom/vk/attachpicker/crop/GeometryState;

    iget-object v1, p0, Lcom/vk/attachpicker/editor/ImageState;->geometryState:Lcom/vk/attachpicker/crop/GeometryState;

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/crop/GeometryState;->set(Lcom/vk/attachpicker/crop/GeometryState;)V

    .line 104
    :cond_1
    iget-object v0, p0, Lcom/vk/attachpicker/editor/ImageState;->autoFixedBitmap:Landroid/graphics/Bitmap;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    .line 95
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getBigBitmap()Landroid/graphics/Bitmap;
    .locals 3

    .prologue
    .line 63
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/vk/attachpicker/editor/ImageState;->bigBitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vk/attachpicker/editor/ImageState;->bigBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 64
    :cond_0
    invoke-static {}, Ljava/lang/System;->gc()V

    .line 66
    iget-object v0, p0, Lcom/vk/attachpicker/editor/ImageState;->bigBitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/vk/attachpicker/editor/ImageState;->bigBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 67
    :cond_1
    iget-object v0, p0, Lcom/vk/attachpicker/editor/ImageState;->file:Ljava/io/File;

    if-eqz v0, :cond_4

    .line 68
    iget-object v0, p0, Lcom/vk/attachpicker/editor/ImageState;->file:Ljava/io/File;

    invoke-static {v0}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v0

    invoke-static {v0}, Lcom/vk/imageloader/VKImageLoader;->getVeryBigBitmap(Landroid/net/Uri;)Lio/reactivex/Observable;

    move-result-object v0

    invoke-static {v0}, Lcom/vk/core/util/RxUtil;->blockingGetWithNull(Lio/reactivex/Observable;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Bitmap;

    iput-object v0, p0, Lcom/vk/attachpicker/editor/ImageState;->bigBitmap:Landroid/graphics/Bitmap;

    .line 73
    :cond_2
    :goto_0
    new-instance v0, Lcom/vk/attachpicker/crop/GeometryState;

    iget-object v1, p0, Lcom/vk/attachpicker/editor/ImageState;->bigBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    int-to-float v1, v1

    iget-object v2, p0, Lcom/vk/attachpicker/editor/ImageState;->bigBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    int-to-float v2, v2

    invoke-direct {v0, v1, v2}, Lcom/vk/attachpicker/crop/GeometryState;-><init>(FF)V

    iput-object v0, p0, Lcom/vk/attachpicker/editor/ImageState;->geometryState:Lcom/vk/attachpicker/crop/GeometryState;

    .line 74
    iget-object v0, p0, Lcom/vk/attachpicker/editor/ImageState;->geometryState:Lcom/vk/attachpicker/crop/GeometryState;

    invoke-virtual {v0}, Lcom/vk/attachpicker/crop/GeometryState;->resetTransformationMatrix()V

    .line 76
    :cond_3
    iget-object v0, p0, Lcom/vk/attachpicker/editor/ImageState;->bigBitmap:Landroid/graphics/Bitmap;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    .line 70
    :cond_4
    :try_start_1
    iget-object v0, p0, Lcom/vk/attachpicker/editor/ImageState;->entry:Lcom/vk/attachpicker/mediastore/MediaStoreEntry;

    iget-object v0, v0, Lcom/vk/attachpicker/mediastore/MediaStoreEntry;->path:Landroid/net/Uri;

    invoke-static {v0}, Lcom/vk/imageloader/VKImageLoader;->getVeryBigBitmap(Landroid/net/Uri;)Lio/reactivex/Observable;

    move-result-object v0

    invoke-static {v0}, Lcom/vk/core/util/RxUtil;->blockingGetWithNull(Lio/reactivex/Observable;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Bitmap;

    iput-object v0, p0, Lcom/vk/attachpicker/editor/ImageState;->bigBitmap:Landroid/graphics/Bitmap;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 63
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getCroppedBitmap()Landroid/graphics/Bitmap;
    .locals 4

    .prologue
    .line 80
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lcom/vk/attachpicker/editor/ImageState;->getBigBitmap()Landroid/graphics/Bitmap;

    .line 81
    iget-object v0, p0, Lcom/vk/attachpicker/editor/ImageState;->croppedGeometryState:Lcom/vk/attachpicker/crop/GeometryState;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vk/attachpicker/editor/ImageState;->croppedBitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vk/attachpicker/editor/ImageState;->croppedBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/vk/attachpicker/editor/ImageState;->croppedGeometryState:Lcom/vk/attachpicker/crop/GeometryState;

    iget-object v1, p0, Lcom/vk/attachpicker/editor/ImageState;->geometryState:Lcom/vk/attachpicker/crop/GeometryState;

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/crop/GeometryState;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 82
    :cond_0
    iget-object v0, p0, Lcom/vk/attachpicker/editor/ImageState;->bigBitmap:Landroid/graphics/Bitmap;

    sget v1, Lcom/vk/attachpicker/editor/ImageState;->PREVIEW_WIDTH:F

    float-to-int v1, v1

    .line 83
    invoke-direct {p0, v1}, Lcom/vk/attachpicker/editor/ImageState;->stubCropAreaProvider(I)Lcom/vk/attachpicker/crop/CropAreaProvider;

    move-result-object v1

    iget-object v2, p0, Lcom/vk/attachpicker/editor/ImageState;->geometryState:Lcom/vk/attachpicker/crop/GeometryState;

    .line 84
    invoke-virtual {v2}, Lcom/vk/attachpicker/crop/GeometryState;->getTransformationMatrix()Landroid/graphics/Matrix;

    move-result-object v2

    sget v3, Lcom/vk/attachpicker/editor/ImageState;->PREVIEW_WIDTH:F

    float-to-int v3, v3

    .line 82
    invoke-static {v0, v1, v2, v3}, Lcom/vk/attachpicker/crop/CropUtils;->applySquareMatrixFixed(Landroid/graphics/Bitmap;Lcom/vk/attachpicker/crop/CropAreaProvider;Landroid/graphics/Matrix;I)Landroid/graphics/Bitmap;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/attachpicker/editor/ImageState;->croppedBitmap:Landroid/graphics/Bitmap;

    .line 87
    new-instance v0, Lcom/vk/attachpicker/crop/GeometryState;

    iget-object v1, p0, Lcom/vk/attachpicker/editor/ImageState;->croppedBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    int-to-float v1, v1

    iget-object v2, p0, Lcom/vk/attachpicker/editor/ImageState;->croppedBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    int-to-float v2, v2

    invoke-direct {v0, v1, v2}, Lcom/vk/attachpicker/crop/GeometryState;-><init>(FF)V

    iput-object v0, p0, Lcom/vk/attachpicker/editor/ImageState;->croppedGeometryState:Lcom/vk/attachpicker/crop/GeometryState;

    .line 88
    iget-object v0, p0, Lcom/vk/attachpicker/editor/ImageState;->croppedGeometryState:Lcom/vk/attachpicker/crop/GeometryState;

    iget-object v1, p0, Lcom/vk/attachpicker/editor/ImageState;->geometryState:Lcom/vk/attachpicker/crop/GeometryState;

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/crop/GeometryState;->set(Lcom/vk/attachpicker/crop/GeometryState;)V

    .line 91
    :cond_1
    iget-object v0, p0, Lcom/vk/attachpicker/editor/ImageState;->croppedBitmap:Landroid/graphics/Bitmap;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    .line 80
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getCroppedBitmap(I)Landroid/graphics/Bitmap;
    .locals 6
    .param p1, "targetWidth"    # I

    .prologue
    .line 108
    invoke-virtual {p0}, Lcom/vk/attachpicker/editor/ImageState;->getBigBitmap()Landroid/graphics/Bitmap;

    .line 109
    iget-object v1, p0, Lcom/vk/attachpicker/editor/ImageState;->bigBitmap:Landroid/graphics/Bitmap;

    .line 110
    invoke-direct {p0, p1}, Lcom/vk/attachpicker/editor/ImageState;->stubCropAreaProvider(I)Lcom/vk/attachpicker/crop/CropAreaProvider;

    move-result-object v2

    iget-object v3, p0, Lcom/vk/attachpicker/editor/ImageState;->geometryState:Lcom/vk/attachpicker/crop/GeometryState;

    .line 111
    invoke-virtual {v3}, Lcom/vk/attachpicker/crop/GeometryState;->getTransformationMatrix()Landroid/graphics/Matrix;

    move-result-object v3

    sget v4, Lcom/vk/attachpicker/editor/ImageState;->PREVIEW_WIDTH:F

    int-to-float v5, p1

    invoke-static {v3, v4, v5}, Lcom/vk/attachpicker/crop/CropUtils;->createScaleMatrix(Landroid/graphics/Matrix;FF)Landroid/graphics/Matrix;

    move-result-object v3

    sget v4, Lcom/vk/attachpicker/editor/ImageState;->PREVIEW_WIDTH:F

    float-to-int v4, v4

    .line 109
    invoke-static {v1, v2, v3, v4}, Lcom/vk/attachpicker/crop/CropUtils;->applySquareMatrixFixed(Landroid/graphics/Bitmap;Lcom/vk/attachpicker/crop/CropAreaProvider;Landroid/graphics/Matrix;I)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 114
    .local v0, "bigCroppedBitmap":Landroid/graphics/Bitmap;
    return-object v0
.end method

.method public getCroppedBitmapAspectRatio()F
    .locals 1

    .prologue
    .line 118
    invoke-virtual {p0}, Lcom/vk/attachpicker/editor/ImageState;->getCroppedBitmap()Landroid/graphics/Bitmap;

    move-result-object v0

    invoke-static {v0}, Lcom/vk/attachpicker/util/BitmapUtils;->getAspectRatio(Landroid/graphics/Bitmap;)F

    move-result v0

    return v0
.end method

.method public getCroppedBitmapMatrix(Landroid/graphics/RectF;)Landroid/graphics/Matrix;
    .locals 3
    .param p1, "drawingRect"    # Landroid/graphics/RectF;

    .prologue
    .line 59
    iget-object v0, p0, Lcom/vk/attachpicker/editor/ImageState;->geometryState:Lcom/vk/attachpicker/crop/GeometryState;

    invoke-virtual {v0}, Lcom/vk/attachpicker/crop/GeometryState;->getTransformationMatrix()Landroid/graphics/Matrix;

    move-result-object v0

    sget v1, Lcom/vk/attachpicker/editor/ImageState;->PREVIEW_WIDTH:F

    invoke-static {}, Lcom/vk/core/util/Screen;->realWidth()I

    move-result v2

    int-to-float v2, v2

    invoke-static {v0, v1, v2, p1}, Lcom/vk/attachpicker/crop/CropUtils;->createDrawingMatrix(Landroid/graphics/Matrix;FFLandroid/graphics/RectF;)Landroid/graphics/Matrix;

    move-result-object v0

    return-object v0
.end method

.method public getGeometryState()Lcom/vk/attachpicker/crop/GeometryState;
    .locals 1

    .prologue
    .line 48
    iget-object v0, p0, Lcom/vk/attachpicker/editor/ImageState;->geometryState:Lcom/vk/attachpicker/crop/GeometryState;

    return-object v0
.end method

.method public setAutoEnhanceValue(F)V
    .locals 0
    .param p1, "autoEnhanceValue"    # F

    .prologue
    .line 126
    iput p1, p0, Lcom/vk/attachpicker/editor/ImageState;->autoEnhanceValue:F

    .line 127
    return-void
.end method

.method public setGeometryState(Lcom/vk/attachpicker/crop/GeometryState;)V
    .locals 3
    .param p1, "geometryState"    # Lcom/vk/attachpicker/crop/GeometryState;

    .prologue
    .line 52
    iget-object v0, p0, Lcom/vk/attachpicker/editor/ImageState;->geometryState:Lcom/vk/attachpicker/crop/GeometryState;

    if-nez v0, :cond_0

    .line 53
    new-instance v0, Lcom/vk/attachpicker/crop/GeometryState;

    invoke-virtual {p1}, Lcom/vk/attachpicker/crop/GeometryState;->getWidth()F

    move-result v1

    invoke-virtual {p1}, Lcom/vk/attachpicker/crop/GeometryState;->getHeight()F

    move-result v2

    invoke-direct {v0, v1, v2}, Lcom/vk/attachpicker/crop/GeometryState;-><init>(FF)V

    iput-object v0, p0, Lcom/vk/attachpicker/editor/ImageState;->geometryState:Lcom/vk/attachpicker/crop/GeometryState;

    .line 55
    :cond_0
    iget-object v0, p0, Lcom/vk/attachpicker/editor/ImageState;->geometryState:Lcom/vk/attachpicker/crop/GeometryState;

    invoke-virtual {v0, p1}, Lcom/vk/attachpicker/crop/GeometryState;->set(Lcom/vk/attachpicker/crop/GeometryState;)V

    .line 56
    return-void
.end method
