.class public Lcom/vk/imageloader/view/VKImageView;
.super Lcom/vk/imageloader/view/GenericVKImageView;
.source "VKImageView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/imageloader/view/VKImageView$ReflectionHolder;
    }
.end annotation


# static fields
.field private static final MAX_RETRIES:I = 0x3

.field public static final ROTATE_OPTIONS:Lcom/facebook/imagepipeline/common/RotationOptions;


# instance fields
.field private controllerBuilder:Lcom/facebook/drawee/backends/pipeline/PipelineDraweeControllerBuilder;

.field private highResPostPostprocessor:Lcom/facebook/imagepipeline/request/BasePostprocessor;

.field private imageHeight:I

.field private imageWidth:I

.field private lowResPostPostprocessor:Lcom/facebook/imagepipeline/request/BasePostprocessor;

.field private onLoadCallback:Lcom/vk/imageloader/OnLoadCallback;

.field private postprocessor:Lcom/facebook/imagepipeline/request/BasePostprocessor;

.field private retriesCount:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 30
    invoke-static {}, Lcom/facebook/imagepipeline/common/RotationOptions;->autoRotate()Lcom/facebook/imagepipeline/common/RotationOptions;

    move-result-object v0

    sput-object v0, Lcom/vk/imageloader/view/VKImageView;->ROTATE_OPTIONS:Lcom/facebook/imagepipeline/common/RotationOptions;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 44
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/vk/imageloader/view/VKImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 45
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 48
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/vk/imageloader/view/VKImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 49
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    .line 52
    invoke-direct {p0, p1, p2, p3}, Lcom/vk/imageloader/view/GenericVKImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 41
    const/4 v0, 0x0

    iput v0, p0, Lcom/vk/imageloader/view/VKImageView;->retriesCount:I

    .line 53
    invoke-direct {p0}, Lcom/vk/imageloader/view/VKImageView;->init()V

    .line 54
    return-void
.end method

.method static synthetic access$000(Lcom/vk/imageloader/view/VKImageView;)I
    .locals 1
    .param p0, "x0"    # Lcom/vk/imageloader/view/VKImageView;

    .prologue
    .line 28
    iget v0, p0, Lcom/vk/imageloader/view/VKImageView;->imageWidth:I

    return v0
.end method

.method static synthetic access$002(Lcom/vk/imageloader/view/VKImageView;I)I
    .locals 0
    .param p0, "x0"    # Lcom/vk/imageloader/view/VKImageView;
    .param p1, "x1"    # I

    .prologue
    .line 28
    iput p1, p0, Lcom/vk/imageloader/view/VKImageView;->imageWidth:I

    return p1
.end method

.method static synthetic access$100(Lcom/vk/imageloader/view/VKImageView;)I
    .locals 1
    .param p0, "x0"    # Lcom/vk/imageloader/view/VKImageView;

    .prologue
    .line 28
    iget v0, p0, Lcom/vk/imageloader/view/VKImageView;->imageHeight:I

    return v0
.end method

.method static synthetic access$102(Lcom/vk/imageloader/view/VKImageView;I)I
    .locals 0
    .param p0, "x0"    # Lcom/vk/imageloader/view/VKImageView;
    .param p1, "x1"    # I

    .prologue
    .line 28
    iput p1, p0, Lcom/vk/imageloader/view/VKImageView;->imageHeight:I

    return p1
.end method

.method static synthetic access$200(Lcom/vk/imageloader/view/VKImageView;)Lcom/vk/imageloader/OnLoadCallback;
    .locals 1
    .param p0, "x0"    # Lcom/vk/imageloader/view/VKImageView;

    .prologue
    .line 28
    iget-object v0, p0, Lcom/vk/imageloader/view/VKImageView;->onLoadCallback:Lcom/vk/imageloader/OnLoadCallback;

    return-object v0
.end method

.method static synthetic access$300(Lcom/vk/imageloader/view/VKImageView;)I
    .locals 1
    .param p0, "x0"    # Lcom/vk/imageloader/view/VKImageView;

    .prologue
    .line 28
    iget v0, p0, Lcom/vk/imageloader/view/VKImageView;->retriesCount:I

    return v0
.end method

.method static synthetic access$308(Lcom/vk/imageloader/view/VKImageView;)I
    .locals 2
    .param p0, "x0"    # Lcom/vk/imageloader/view/VKImageView;

    .prologue
    .line 28
    iget v0, p0, Lcom/vk/imageloader/view/VKImageView;->retriesCount:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/vk/imageloader/view/VKImageView;->retriesCount:I

    return v0
.end method

.method private init()V
    .locals 1

    .prologue
    .line 57
    invoke-virtual {p0}, Lcom/vk/imageloader/view/VKImageView;->isInEditMode()Z

    move-result v0

    if-nez v0, :cond_0

    .line 58
    invoke-static {}, Lcom/facebook/drawee/backends/pipeline/Fresco;->newDraweeControllerBuilder()Lcom/facebook/drawee/backends/pipeline/PipelineDraweeControllerBuilder;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/imageloader/view/VKImageView;->controllerBuilder:Lcom/facebook/drawee/backends/pipeline/PipelineDraweeControllerBuilder;

    .line 60
    :cond_0
    return-void
.end method

.method private static setSizeToRequest(Lcom/facebook/imagepipeline/request/ImageRequestBuilder;Lcom/vk/imageloader/ImageSize;)V
    .locals 3
    .param p0, "imageRequestBuilder"    # Lcom/facebook/imagepipeline/request/ImageRequestBuilder;
    .param p1, "size"    # Lcom/vk/imageloader/ImageSize;

    .prologue
    .line 265
    if-eqz p0, :cond_0

    if-eqz p1, :cond_0

    .line 266
    new-instance v0, Lcom/facebook/imagepipeline/common/ResizeOptions;

    invoke-virtual {p1}, Lcom/vk/imageloader/ImageSize;->getPixelsSize()I

    move-result v1

    invoke-virtual {p1}, Lcom/vk/imageloader/ImageSize;->getPixelsSize()I

    move-result v2

    invoke-direct {v0, v1, v2}, Lcom/facebook/imagepipeline/common/ResizeOptions;-><init>(II)V

    invoke-virtual {p0, v0}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->setResizeOptions(Lcom/facebook/imagepipeline/common/ResizeOptions;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 268
    :cond_0
    return-void
.end method


# virtual methods
.method protected buildHierarchy(Lcom/facebook/drawee/generic/GenericDraweeHierarchyBuilder;)V
    .locals 1
    .param p1, "builder"    # Lcom/facebook/drawee/generic/GenericDraweeHierarchyBuilder;

    .prologue
    .line 64
    const/16 v0, 0x4b

    invoke-virtual {p1, v0}, Lcom/facebook/drawee/generic/GenericDraweeHierarchyBuilder;->setFadeDuration(I)Lcom/facebook/drawee/generic/GenericDraweeHierarchyBuilder;

    .line 65
    return-void
.end method

.method public cancel()V
    .locals 1

    .prologue
    .line 124
    invoke-virtual {p0}, Lcom/vk/imageloader/view/VKImageView;->hasImage()Z

    move-result v0

    if-nez v0, :cond_0

    .line 125
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/vk/imageloader/view/VKImageView;->setController(Lcom/facebook/drawee/interfaces/DraweeController;)V

    .line 127
    :cond_0
    return-void
.end method

.method public clear()V
    .locals 1

    .prologue
    .line 120
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/vk/imageloader/view/VKImageView;->setController(Lcom/facebook/drawee/interfaces/DraweeController;)V

    .line 121
    return-void
.end method

.method protected customizeControllerBuilder(Lcom/facebook/drawee/interfaces/SimpleDraweeControllerBuilder;)Lcom/facebook/drawee/interfaces/SimpleDraweeControllerBuilder;
    .locals 0
    .param p1, "builder"    # Lcom/facebook/drawee/interfaces/SimpleDraweeControllerBuilder;

    .prologue
    .line 68
    return-object p1
.end method

.method public getImageAspectRatio()F
    .locals 2

    .prologue
    .line 112
    invoke-virtual {p0}, Lcom/vk/imageloader/view/VKImageView;->hasImage()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 113
    invoke-virtual {p0}, Lcom/vk/imageloader/view/VKImageView;->getImageWidth()I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p0}, Lcom/vk/imageloader/view/VKImageView;->getImageHeight()I

    move-result v1

    int-to-float v1, v1

    div-float/2addr v0, v1

    .line 115
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getImageHeight()I
    .locals 1

    .prologue
    .line 102
    invoke-virtual {p0}, Lcom/vk/imageloader/view/VKImageView;->getController()Lcom/facebook/drawee/interfaces/DraweeController;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 103
    iget v0, p0, Lcom/vk/imageloader/view/VKImageView;->imageHeight:I

    .line 107
    :goto_0
    return v0

    .line 104
    :cond_0
    invoke-virtual {p0}, Lcom/vk/imageloader/view/VKImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 105
    invoke-virtual {p0}, Lcom/vk/imageloader/view/VKImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v0

    goto :goto_0

    .line 107
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getImageWidth()I
    .locals 1

    .prologue
    .line 92
    invoke-virtual {p0}, Lcom/vk/imageloader/view/VKImageView;->getController()Lcom/facebook/drawee/interfaces/DraweeController;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 93
    iget v0, p0, Lcom/vk/imageloader/view/VKImageView;->imageWidth:I

    .line 97
    :goto_0
    return v0

    .line 94
    :cond_0
    invoke-virtual {p0}, Lcom/vk/imageloader/view/VKImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 95
    invoke-virtual {p0}, Lcom/vk/imageloader/view/VKImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v0

    goto :goto_0

    .line 97
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public hasImage()Z
    .locals 1

    .prologue
    .line 88
    invoke-virtual {p0}, Lcom/vk/imageloader/view/VKImageView;->getImageWidth()I

    move-result v0

    if-lez v0, :cond_0

    invoke-virtual {p0}, Lcom/vk/imageloader/view/VKImageView;->getImageHeight()I

    move-result v0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public load(Landroid/net/Uri;Lcom/vk/imageloader/ImageSize;)V
    .locals 2
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "size"    # Lcom/vk/imageloader/ImageSize;

    .prologue
    .line 157
    if-nez p1, :cond_0

    .line 164
    :goto_0
    return-void

    .line 161
    :cond_0
    invoke-static {p1}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->newBuilderWithSource(Landroid/net/Uri;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    move-result-object v0

    .line 162
    .local v0, "imageRequestBuilder":Lcom/facebook/imagepipeline/request/ImageRequestBuilder;
    invoke-static {v0, p2}, Lcom/vk/imageloader/view/VKImageView;->setSizeToRequest(Lcom/facebook/imagepipeline/request/ImageRequestBuilder;Lcom/vk/imageloader/ImageSize;)V

    .line 163
    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/vk/imageloader/view/VKImageView;->proccessImageRequest(Lcom/facebook/imagepipeline/request/ImageRequestBuilder;Lcom/facebook/imagepipeline/request/ImageRequestBuilder;)V

    goto :goto_0
.end method

.method public load(Landroid/net/Uri;Lcom/vk/imageloader/ImageSize;Landroid/net/Uri;Lcom/vk/imageloader/ImageSize;)V
    .locals 2
    .param p1, "thumnailUri"    # Landroid/net/Uri;
    .param p2, "thumbnailSize"    # Lcom/vk/imageloader/ImageSize;
    .param p3, "bigSizeUri"    # Landroid/net/Uri;
    .param p4, "bigSize"    # Lcom/vk/imageloader/ImageSize;

    .prologue
    .line 181
    if-eqz p1, :cond_0

    if-nez p3, :cond_1

    .line 192
    :cond_0
    :goto_0
    return-void

    .line 185
    :cond_1
    invoke-static {p1}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->newBuilderWithSource(Landroid/net/Uri;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    move-result-object v1

    .line 186
    .local v1, "thumbnailRequestBuilder":Lcom/facebook/imagepipeline/request/ImageRequestBuilder;
    invoke-static {v1, p2}, Lcom/vk/imageloader/view/VKImageView;->setSizeToRequest(Lcom/facebook/imagepipeline/request/ImageRequestBuilder;Lcom/vk/imageloader/ImageSize;)V

    .line 188
    invoke-static {p3}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->newBuilderWithSource(Landroid/net/Uri;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    move-result-object v0

    .line 189
    .local v0, "bigRequestBuilder":Lcom/facebook/imagepipeline/request/ImageRequestBuilder;
    invoke-static {v0, p4}, Lcom/vk/imageloader/view/VKImageView;->setSizeToRequest(Lcom/facebook/imagepipeline/request/ImageRequestBuilder;Lcom/vk/imageloader/ImageSize;)V

    .line 191
    invoke-virtual {p0, v0, v1}, Lcom/vk/imageloader/view/VKImageView;->proccessImageRequest(Lcom/facebook/imagepipeline/request/ImageRequestBuilder;Lcom/facebook/imagepipeline/request/ImageRequestBuilder;)V

    goto :goto_0
.end method

.method public load(Landroid/net/Uri;Lcom/vk/imageloader/ImageSize;Lcom/vk/imageloader/ImageSize;)V
    .locals 2
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "thumbnailSize"    # Lcom/vk/imageloader/ImageSize;
    .param p3, "bigSize"    # Lcom/vk/imageloader/ImageSize;

    .prologue
    .line 167
    if-nez p1, :cond_0

    .line 178
    :goto_0
    return-void

    .line 171
    :cond_0
    invoke-static {p1}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->newBuilderWithSource(Landroid/net/Uri;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    move-result-object v1

    .line 172
    .local v1, "thumbnailRequestBuilder":Lcom/facebook/imagepipeline/request/ImageRequestBuilder;
    invoke-static {v1, p2}, Lcom/vk/imageloader/view/VKImageView;->setSizeToRequest(Lcom/facebook/imagepipeline/request/ImageRequestBuilder;Lcom/vk/imageloader/ImageSize;)V

    .line 174
    invoke-static {p1}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->newBuilderWithSource(Landroid/net/Uri;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    move-result-object v0

    .line 175
    .local v0, "bigRequestBuilder":Lcom/facebook/imagepipeline/request/ImageRequestBuilder;
    invoke-static {v0, p3}, Lcom/vk/imageloader/view/VKImageView;->setSizeToRequest(Lcom/facebook/imagepipeline/request/ImageRequestBuilder;Lcom/vk/imageloader/ImageSize;)V

    .line 177
    invoke-virtual {p0, v0, v1}, Lcom/vk/imageloader/view/VKImageView;->proccessImageRequest(Lcom/facebook/imagepipeline/request/ImageRequestBuilder;Lcom/facebook/imagepipeline/request/ImageRequestBuilder;)V

    goto :goto_0
.end method

.method public load(Ljava/lang/String;)V
    .locals 1
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 140
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;Lcom/vk/imageloader/ImageSize;)V

    .line 141
    return-void
.end method

.method public load(Ljava/lang/String;Lcom/vk/imageloader/ImageSize;)V
    .locals 2
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "size"    # Lcom/vk/imageloader/ImageSize;

    .prologue
    .line 144
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 154
    :goto_0
    return-void

    .line 148
    :cond_0
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-static {v1}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->newBuilderWithSource(Landroid/net/Uri;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    move-result-object v0

    .line 149
    .local v0, "imageRequestBuilder":Lcom/facebook/imagepipeline/request/ImageRequestBuilder;
    invoke-static {p1}, Lcom/vk/imageloader/VKImageLoader;->shouldUsePersistentCache(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 150
    sget-object v1, Lcom/facebook/imagepipeline/request/ImageRequest$CacheChoice;->SMALL:Lcom/facebook/imagepipeline/request/ImageRequest$CacheChoice;

    invoke-virtual {v0, v1}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->setCacheChoice(Lcom/facebook/imagepipeline/request/ImageRequest$CacheChoice;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 152
    :cond_1
    invoke-static {v0, p2}, Lcom/vk/imageloader/view/VKImageView;->setSizeToRequest(Lcom/facebook/imagepipeline/request/ImageRequestBuilder;Lcom/vk/imageloader/ImageSize;)V

    .line 153
    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/vk/imageloader/view/VKImageView;->proccessImageRequest(Lcom/facebook/imagepipeline/request/ImageRequestBuilder;Lcom/facebook/imagepipeline/request/ImageRequestBuilder;)V

    goto :goto_0
.end method

.method public loadResource(I)V
    .locals 1
    .param p1, "resId"    # I

    .prologue
    .line 130
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/vk/imageloader/view/VKImageView;->loadResource(ILcom/vk/imageloader/ImageSize;)V

    .line 131
    return-void
.end method

.method public loadResource(ILcom/vk/imageloader/ImageSize;)V
    .locals 2
    .param p1, "resId"    # I
    .param p2, "size"    # Lcom/vk/imageloader/ImageSize;

    .prologue
    .line 134
    invoke-static {p1}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->newBuilderWithResourceId(I)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    move-result-object v0

    .line 135
    .local v0, "imageRequestBuilder":Lcom/facebook/imagepipeline/request/ImageRequestBuilder;
    invoke-static {v0, p2}, Lcom/vk/imageloader/view/VKImageView;->setSizeToRequest(Lcom/facebook/imagepipeline/request/ImageRequestBuilder;Lcom/vk/imageloader/ImageSize;)V

    .line 136
    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/vk/imageloader/view/VKImageView;->proccessImageRequest(Lcom/facebook/imagepipeline/request/ImageRequestBuilder;Lcom/facebook/imagepipeline/request/ImageRequestBuilder;)V

    .line 137
    return-void
.end method

.method protected proccessImageRequest(Lcom/facebook/imagepipeline/request/ImageRequestBuilder;Lcom/facebook/imagepipeline/request/ImageRequestBuilder;)V
    .locals 3
    .param p1, "imageRequestBuilder"    # Lcom/facebook/imagepipeline/request/ImageRequestBuilder;
    .param p2, "lowResImageRequestBuilder"    # Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .prologue
    .line 195
    sget-object v2, Lcom/vk/imageloader/view/VKImageView;->ROTATE_OPTIONS:Lcom/facebook/imagepipeline/common/RotationOptions;

    invoke-virtual {p1, v2}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->setRotationOptions(Lcom/facebook/imagepipeline/common/RotationOptions;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 196
    if-eqz p2, :cond_0

    .line 197
    sget-object v2, Lcom/vk/imageloader/view/VKImageView;->ROTATE_OPTIONS:Lcom/facebook/imagepipeline/common/RotationOptions;

    invoke-virtual {p2, v2}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->setRotationOptions(Lcom/facebook/imagepipeline/common/RotationOptions;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 199
    :cond_0
    iget-object v2, p0, Lcom/vk/imageloader/view/VKImageView;->postprocessor:Lcom/facebook/imagepipeline/request/BasePostprocessor;

    if-eqz v2, :cond_3

    .line 200
    iget-object v2, p0, Lcom/vk/imageloader/view/VKImageView;->postprocessor:Lcom/facebook/imagepipeline/request/BasePostprocessor;

    invoke-virtual {p1, v2}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->setPostprocessor(Lcom/facebook/imagepipeline/request/Postprocessor;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 201
    if-eqz p2, :cond_1

    .line 202
    iget-object v2, p0, Lcom/vk/imageloader/view/VKImageView;->postprocessor:Lcom/facebook/imagepipeline/request/BasePostprocessor;

    invoke-virtual {p2, v2}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->setPostprocessor(Lcom/facebook/imagepipeline/request/Postprocessor;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 213
    :cond_1
    :goto_0
    iget-object v2, p0, Lcom/vk/imageloader/view/VKImageView;->controllerBuilder:Lcom/facebook/drawee/backends/pipeline/PipelineDraweeControllerBuilder;

    invoke-virtual {v2}, Lcom/facebook/drawee/backends/pipeline/PipelineDraweeControllerBuilder;->reset()Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;

    move-result-object v0

    check-cast v0, Lcom/facebook/drawee/backends/pipeline/PipelineDraweeControllerBuilder;

    .line 214
    .local v0, "builder":Lcom/facebook/drawee/backends/pipeline/PipelineDraweeControllerBuilder;
    invoke-virtual {p1}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->build()Lcom/facebook/imagepipeline/request/ImageRequest;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/facebook/drawee/backends/pipeline/PipelineDraweeControllerBuilder;->setImageRequest(Ljava/lang/Object;)Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;

    .line 215
    if-eqz p2, :cond_2

    .line 216
    invoke-virtual {p2}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->build()Lcom/facebook/imagepipeline/request/ImageRequest;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/facebook/drawee/backends/pipeline/PipelineDraweeControllerBuilder;->setLowResImageRequest(Ljava/lang/Object;)Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;

    .line 217
    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Lcom/facebook/drawee/backends/pipeline/PipelineDraweeControllerBuilder;->setRetainImageOnFailure(Z)Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;

    .line 219
    :cond_2
    invoke-virtual {p0}, Lcom/vk/imageloader/view/VKImageView;->getController()Lcom/facebook/drawee/interfaces/DraweeController;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/facebook/drawee/backends/pipeline/PipelineDraweeControllerBuilder;->setOldController(Lcom/facebook/drawee/interfaces/DraweeController;)Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;

    .line 220
    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Lcom/facebook/drawee/backends/pipeline/PipelineDraweeControllerBuilder;->setCallerContext(Ljava/lang/Object;)Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;

    .line 221
    new-instance v2, Lcom/vk/imageloader/view/VKImageView$1;

    invoke-direct {v2, p0}, Lcom/vk/imageloader/view/VKImageView$1;-><init>(Lcom/vk/imageloader/view/VKImageView;)V

    invoke-virtual {v0, v2}, Lcom/facebook/drawee/backends/pipeline/PipelineDraweeControllerBuilder;->setControllerListener(Lcom/facebook/drawee/controller/ControllerListener;)Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;

    .line 250
    invoke-virtual {p0, v0}, Lcom/vk/imageloader/view/VKImageView;->customizeControllerBuilder(Lcom/facebook/drawee/interfaces/SimpleDraweeControllerBuilder;)Lcom/facebook/drawee/interfaces/SimpleDraweeControllerBuilder;

    move-result-object v2

    invoke-interface {v2}, Lcom/facebook/drawee/interfaces/SimpleDraweeControllerBuilder;->build()Lcom/facebook/drawee/interfaces/DraweeController;

    move-result-object v1

    .line 251
    .local v1, "controller":Lcom/facebook/drawee/interfaces/DraweeController;
    invoke-virtual {p0, v1}, Lcom/vk/imageloader/view/VKImageView;->setController(Lcom/facebook/drawee/interfaces/DraweeController;)V

    .line 253
    const/4 v2, 0x0

    iput v2, p0, Lcom/vk/imageloader/view/VKImageView;->retriesCount:I

    .line 254
    return-void

    .line 204
    .end local v0    # "builder":Lcom/facebook/drawee/backends/pipeline/PipelineDraweeControllerBuilder;
    .end local v1    # "controller":Lcom/facebook/drawee/interfaces/DraweeController;
    :cond_3
    iget-object v2, p0, Lcom/vk/imageloader/view/VKImageView;->lowResPostPostprocessor:Lcom/facebook/imagepipeline/request/BasePostprocessor;

    if-nez v2, :cond_4

    iget-object v2, p0, Lcom/vk/imageloader/view/VKImageView;->highResPostPostprocessor:Lcom/facebook/imagepipeline/request/BasePostprocessor;

    if-eqz v2, :cond_1

    .line 205
    :cond_4
    if-eqz p1, :cond_5

    iget-object v2, p0, Lcom/vk/imageloader/view/VKImageView;->highResPostPostprocessor:Lcom/facebook/imagepipeline/request/BasePostprocessor;

    if-eqz v2, :cond_5

    .line 206
    iget-object v2, p0, Lcom/vk/imageloader/view/VKImageView;->highResPostPostprocessor:Lcom/facebook/imagepipeline/request/BasePostprocessor;

    invoke-virtual {p1, v2}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->setPostprocessor(Lcom/facebook/imagepipeline/request/Postprocessor;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 208
    :cond_5
    if-eqz p2, :cond_1

    if-eqz p2, :cond_1

    .line 209
    iget-object v2, p0, Lcom/vk/imageloader/view/VKImageView;->lowResPostPostprocessor:Lcom/facebook/imagepipeline/request/BasePostprocessor;

    invoke-virtual {p2, v2}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->setPostprocessor(Lcom/facebook/imagepipeline/request/Postprocessor;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    goto :goto_0
.end method

.method public retryImageRequest()V
    .locals 2

    .prologue
    .line 257
    invoke-virtual {p0}, Lcom/vk/imageloader/view/VKImageView;->getController()Lcom/facebook/drawee/interfaces/DraweeController;

    move-result-object v0

    .line 258
    .local v0, "controller":Lcom/facebook/drawee/interfaces/DraweeController;
    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/vk/imageloader/view/VKImageView;->hasImage()Z

    move-result v1

    if-nez v1, :cond_0

    .line 259
    invoke-virtual {p0}, Lcom/vk/imageloader/view/VKImageView;->getHierarchy()Lcom/facebook/drawee/interfaces/DraweeHierarchy;

    move-result-object v1

    check-cast v1, Lcom/facebook/drawee/generic/GenericDraweeHierarchy;

    invoke-virtual {v1}, Lcom/facebook/drawee/generic/GenericDraweeHierarchy;->reset()V

    .line 260
    invoke-static {v0}, Lcom/vk/imageloader/view/VKImageView$ReflectionHolder;->submitRequest(Lcom/facebook/drawee/interfaces/DraweeController;)V

    .line 262
    :cond_0
    return-void
.end method

.method public setOnLoadCallback(Lcom/vk/imageloader/OnLoadCallback;)V
    .locals 0
    .param p1, "onLoadCallback"    # Lcom/vk/imageloader/OnLoadCallback;

    .prologue
    .line 72
    iput-object p1, p0, Lcom/vk/imageloader/view/VKImageView;->onLoadCallback:Lcom/vk/imageloader/OnLoadCallback;

    .line 73
    return-void
.end method

.method public setPostprocessor(Lcom/facebook/imagepipeline/request/BasePostprocessor;)V
    .locals 1
    .param p1, "postprocessor"    # Lcom/facebook/imagepipeline/request/BasePostprocessor;

    .prologue
    const/4 v0, 0x0

    .line 76
    iput-object p1, p0, Lcom/vk/imageloader/view/VKImageView;->postprocessor:Lcom/facebook/imagepipeline/request/BasePostprocessor;

    .line 77
    iput-object v0, p0, Lcom/vk/imageloader/view/VKImageView;->lowResPostPostprocessor:Lcom/facebook/imagepipeline/request/BasePostprocessor;

    .line 78
    iput-object v0, p0, Lcom/vk/imageloader/view/VKImageView;->highResPostPostprocessor:Lcom/facebook/imagepipeline/request/BasePostprocessor;

    .line 79
    return-void
.end method

.method public setPostprocessor(Lcom/facebook/imagepipeline/request/BasePostprocessor;Lcom/facebook/imagepipeline/request/BasePostprocessor;)V
    .locals 1
    .param p1, "lowResPostPostprocessor"    # Lcom/facebook/imagepipeline/request/BasePostprocessor;
    .param p2, "highResPostPostprocessor"    # Lcom/facebook/imagepipeline/request/BasePostprocessor;

    .prologue
    .line 82
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vk/imageloader/view/VKImageView;->postprocessor:Lcom/facebook/imagepipeline/request/BasePostprocessor;

    .line 83
    iput-object p1, p0, Lcom/vk/imageloader/view/VKImageView;->lowResPostPostprocessor:Lcom/facebook/imagepipeline/request/BasePostprocessor;

    .line 84
    iput-object p2, p0, Lcom/vk/imageloader/view/VKImageView;->highResPostPostprocessor:Lcom/facebook/imagepipeline/request/BasePostprocessor;

    .line 85
    return-void
.end method
