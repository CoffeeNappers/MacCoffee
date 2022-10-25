.class public Lcom/vk/stories/view/StoryCircleImageView;
.super Lcom/vk/imageloader/view/VKCircleImageView;
.source "StoryCircleImageView.java"


# static fields
.field private static final BORDER:I

.field public static final BORDER_DEGREES:Landroid/util/Property;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Property",
            "<",
            "Lcom/vk/stories/view/StoryCircleImageView;",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field private static final animatedUploadIds:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private animator:Landroid/animation/ObjectAnimator;

.field private borderBitmap:Landroid/graphics/Bitmap;

.field private final dst:Landroid/graphics/RectF;

.field private failBorderDrawable:Landroid/graphics/drawable/Drawable;

.field private hasNewStories:Z

.field private final m:Landroid/graphics/Matrix;

.field private final oval:Landroid/graphics/RectF;

.field private paint:Landroid/graphics/Paint;

.field private selectionAmount:F

.field private final src:Landroid/graphics/RectF;

.field private uploadFailed:Z


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 30
    new-instance v0, Lcom/vk/stories/view/StoryCircleImageView$1;

    const-class v1, Ljava/lang/Float;

    const-string/jumbo v2, "borderDegrees"

    invoke-direct {v0, v1, v2}, Lcom/vk/stories/view/StoryCircleImageView$1;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    sput-object v0, Lcom/vk/stories/view/StoryCircleImageView;->BORDER_DEGREES:Landroid/util/Property;

    .line 42
    const/4 v0, 0x2

    invoke-static {v0}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v0

    sput v0, Lcom/vk/stories/view/StoryCircleImageView;->BORDER:I

    .line 44
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    sput-object v0, Lcom/vk/stories/view/StoryCircleImageView;->animatedUploadIds:Ljava/util/HashSet;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 63
    invoke-direct {p0, p1}, Lcom/vk/imageloader/view/VKCircleImageView;-><init>(Landroid/content/Context;)V

    .line 49
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/vk/stories/view/StoryCircleImageView;->paint:Landroid/graphics/Paint;

    .line 51
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/vk/stories/view/StoryCircleImageView;->m:Landroid/graphics/Matrix;

    .line 52
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/vk/stories/view/StoryCircleImageView;->src:Landroid/graphics/RectF;

    .line 53
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/vk/stories/view/StoryCircleImageView;->dst:Landroid/graphics/RectF;

    .line 54
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/vk/stories/view/StoryCircleImageView;->oval:Landroid/graphics/RectF;

    .line 60
    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lcom/vk/stories/view/StoryCircleImageView;->selectionAmount:F

    .line 64
    invoke-direct {p0}, Lcom/vk/stories/view/StoryCircleImageView;->init()V

    .line 65
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 68
    invoke-direct {p0, p1, p2}, Lcom/vk/imageloader/view/VKCircleImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 49
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/vk/stories/view/StoryCircleImageView;->paint:Landroid/graphics/Paint;

    .line 51
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/vk/stories/view/StoryCircleImageView;->m:Landroid/graphics/Matrix;

    .line 52
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/vk/stories/view/StoryCircleImageView;->src:Landroid/graphics/RectF;

    .line 53
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/vk/stories/view/StoryCircleImageView;->dst:Landroid/graphics/RectF;

    .line 54
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/vk/stories/view/StoryCircleImageView;->oval:Landroid/graphics/RectF;

    .line 60
    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lcom/vk/stories/view/StoryCircleImageView;->selectionAmount:F

    .line 69
    invoke-direct {p0}, Lcom/vk/stories/view/StoryCircleImageView;->init()V

    .line 70
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    .line 73
    invoke-direct {p0, p1, p2, p3}, Lcom/vk/imageloader/view/VKCircleImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 49
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/vk/stories/view/StoryCircleImageView;->paint:Landroid/graphics/Paint;

    .line 51
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/vk/stories/view/StoryCircleImageView;->m:Landroid/graphics/Matrix;

    .line 52
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/vk/stories/view/StoryCircleImageView;->src:Landroid/graphics/RectF;

    .line 53
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/vk/stories/view/StoryCircleImageView;->dst:Landroid/graphics/RectF;

    .line 54
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/vk/stories/view/StoryCircleImageView;->oval:Landroid/graphics/RectF;

    .line 60
    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lcom/vk/stories/view/StoryCircleImageView;->selectionAmount:F

    .line 74
    invoke-direct {p0}, Lcom/vk/stories/view/StoryCircleImageView;->init()V

    .line 75
    return-void
.end method

.method private cancelCurrentAnimator()V
    .locals 1

    .prologue
    .line 207
    iget-object v0, p0, Lcom/vk/stories/view/StoryCircleImageView;->animator:Landroid/animation/ObjectAnimator;

    if-eqz v0, :cond_0

    .line 208
    iget-object v0, p0, Lcom/vk/stories/view/StoryCircleImageView;->animator:Landroid/animation/ObjectAnimator;

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->cancel()V

    .line 209
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vk/stories/view/StoryCircleImageView;->animator:Landroid/animation/ObjectAnimator;

    .line 211
    :cond_0
    return-void
.end method

.method private init()V
    .locals 3

    .prologue
    .line 84
    sget v1, Lcom/vk/stories/view/StoryCircleImageView;->BORDER:I

    mul-int/lit8 v0, v1, 0x2

    .line 85
    .local v0, "b2":I
    invoke-virtual {p0, v0, v0, v0, v0}, Lcom/vk/stories/view/StoryCircleImageView;->setPadding(IIII)V

    .line 88
    invoke-virtual {p0}, Lcom/vk/stories/view/StoryCircleImageView;->getContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f0200bc

    invoke-static {v1, v2}, Landroid/support/v4/content/ContextCompat;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    iput-object v1, p0, Lcom/vk/stories/view/StoryCircleImageView;->failBorderDrawable:Landroid/graphics/drawable/Drawable;

    .line 89
    invoke-virtual {p0}, Lcom/vk/stories/view/StoryCircleImageView;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0200bd

    invoke-static {v1, v2}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v1

    iput-object v1, p0, Lcom/vk/stories/view/StoryCircleImageView;->borderBitmap:Landroid/graphics/Bitmap;

    .line 90
    return-void
.end method

.method private setHasNewStories(ZZ)V
    .locals 1
    .param p1, "hasNewStories"    # Z
    .param p2, "animate"    # Z

    .prologue
    .line 174
    invoke-direct {p0}, Lcom/vk/stories/view/StoryCircleImageView;->cancelCurrentAnimator()V

    .line 175
    iput-boolean p1, p0, Lcom/vk/stories/view/StoryCircleImageView;->hasNewStories:Z

    .line 176
    if-nez p2, :cond_0

    .line 177
    const/high16 v0, 0x3f800000    # 1.0f

    invoke-virtual {p0, v0}, Lcom/vk/stories/view/StoryCircleImageView;->setSelectionAmount(F)V

    .line 181
    :goto_0
    return-void

    .line 179
    :cond_0
    invoke-direct {p0}, Lcom/vk/stories/view/StoryCircleImageView;->startBorderAnimator()V

    goto :goto_0
.end method

.method private setUploadFailed(Z)V
    .locals 0
    .param p1, "uploadFailed"    # Z

    .prologue
    .line 184
    iput-boolean p1, p0, Lcom/vk/stories/view/StoryCircleImageView;->uploadFailed:Z

    .line 185
    invoke-virtual {p0}, Lcom/vk/stories/view/StoryCircleImageView;->invalidate()V

    .line 186
    return-void
.end method

.method private startBorderAnimator()V
    .locals 4

    .prologue
    .line 198
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/vk/stories/view/StoryCircleImageView;->setSelectionAmount(F)V

    .line 199
    sget-object v0, Lcom/vk/stories/view/StoryCircleImageView;->BORDER_DEGREES:Landroid/util/Property;

    const/4 v1, 0x2

    new-array v1, v1, [F

    fill-array-data v1, :array_0

    invoke-static {p0, v0, v1}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/stories/view/StoryCircleImageView;->animator:Landroid/animation/ObjectAnimator;

    .line 200
    iget-object v0, p0, Lcom/vk/stories/view/StoryCircleImageView;->animator:Landroid/animation/ObjectAnimator;

    sget-object v1, Lcom/vk/core/util/AnimationUtils;->decelerateInterpolator2:Landroid/view/animation/DecelerateInterpolator;

    invoke-virtual {v0, v1}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 201
    iget-object v0, p0, Lcom/vk/stories/view/StoryCircleImageView;->animator:Landroid/animation/ObjectAnimator;

    const-wide/16 v2, 0x258

    invoke-virtual {v0, v2, v3}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 202
    iget-object v0, p0, Lcom/vk/stories/view/StoryCircleImageView;->animator:Landroid/animation/ObjectAnimator;

    const-wide/16 v2, 0x320

    invoke-virtual {v0, v2, v3}, Landroid/animation/ObjectAnimator;->setStartDelay(J)V

    .line 203
    iget-object v0, p0, Lcom/vk/stories/view/StoryCircleImageView;->animator:Landroid/animation/ObjectAnimator;

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    .line 204
    return-void

    .line 199
    nop

    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method


# virtual methods
.method protected buildHierarchy(Lcom/facebook/drawee/generic/GenericDraweeHierarchyBuilder;)V
    .locals 1
    .param p1, "builder"    # Lcom/facebook/drawee/generic/GenericDraweeHierarchyBuilder;

    .prologue
    .line 79
    invoke-super {p0, p1}, Lcom/vk/imageloader/view/VKCircleImageView;->buildHierarchy(Lcom/facebook/drawee/generic/GenericDraweeHierarchyBuilder;)V

    .line 80
    const/high16 v0, 0x3f800000    # 1.0f

    invoke-virtual {p1, v0}, Lcom/facebook/drawee/generic/GenericDraweeHierarchyBuilder;->setDesiredAspectRatio(F)Lcom/facebook/drawee/generic/GenericDraweeHierarchyBuilder;

    .line 81
    return-void
.end method

.method public getSelectionAmount()F
    .locals 1

    .prologue
    .line 189
    iget v0, p0, Lcom/vk/stories/view/StoryCircleImageView;->selectionAmount:F

    return v0
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 6
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 109
    invoke-super {p0, p1}, Lcom/vk/imageloader/view/VKCircleImageView;->onDraw(Landroid/graphics/Canvas;)V

    .line 114
    iget-boolean v0, p0, Lcom/vk/stories/view/StoryCircleImageView;->uploadFailed:Z

    if-eqz v0, :cond_1

    .line 115
    iget-object v0, p0, Lcom/vk/stories/view/StoryCircleImageView;->failBorderDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 119
    :cond_0
    :goto_0
    return-void

    .line 116
    :cond_1
    iget-boolean v0, p0, Lcom/vk/stories/view/StoryCircleImageView;->hasNewStories:Z

    if-eqz v0, :cond_0

    .line 117
    iget-object v1, p0, Lcom/vk/stories/view/StoryCircleImageView;->oval:Landroid/graphics/RectF;

    const/high16 v2, -0x3d4c0000    # -90.0f

    const/high16 v0, 0x43b40000    # 360.0f

    iget v3, p0, Lcom/vk/stories/view/StoryCircleImageView;->selectionAmount:F

    mul-float/2addr v3, v0

    const/4 v4, 0x1

    iget-object v5, p0, Lcom/vk/stories/view/StoryCircleImageView;->paint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    goto :goto_0
.end method

.method protected onSizeChanged(IIII)V
    .locals 5
    .param p1, "w"    # I
    .param p2, "h"    # I
    .param p3, "oldw"    # I
    .param p4, "oldh"    # I

    .prologue
    const/4 v2, 0x0

    const/4 v4, 0x0

    .line 94
    invoke-super {p0, p1, p2, p3, p4}, Lcom/vk/imageloader/view/VKCircleImageView;->onSizeChanged(IIII)V

    .line 96
    iget-object v1, p0, Lcom/vk/stories/view/StoryCircleImageView;->failBorderDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1, v2, v2, p1, p2}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 98
    iget-object v1, p0, Lcom/vk/stories/view/StoryCircleImageView;->src:Landroid/graphics/RectF;

    iget-object v2, p0, Lcom/vk/stories/view/StoryCircleImageView;->borderBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    int-to-float v2, v2

    iget-object v3, p0, Lcom/vk/stories/view/StoryCircleImageView;->borderBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {v1, v4, v4, v2, v3}, Landroid/graphics/RectF;->set(FFFF)V

    .line 99
    iget-object v1, p0, Lcom/vk/stories/view/StoryCircleImageView;->dst:Landroid/graphics/RectF;

    int-to-float v2, p1

    int-to-float v3, p2

    invoke-virtual {v1, v4, v4, v2, v3}, Landroid/graphics/RectF;->set(FFFF)V

    .line 100
    iget-object v1, p0, Lcom/vk/stories/view/StoryCircleImageView;->m:Landroid/graphics/Matrix;

    iget-object v2, p0, Lcom/vk/stories/view/StoryCircleImageView;->src:Landroid/graphics/RectF;

    iget-object v3, p0, Lcom/vk/stories/view/StoryCircleImageView;->dst:Landroid/graphics/RectF;

    sget-object v4, Landroid/graphics/Matrix$ScaleToFit;->CENTER:Landroid/graphics/Matrix$ScaleToFit;

    invoke-virtual {v1, v2, v3, v4}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    .line 101
    new-instance v0, Landroid/graphics/BitmapShader;

    iget-object v1, p0, Lcom/vk/stories/view/StoryCircleImageView;->borderBitmap:Landroid/graphics/Bitmap;

    sget-object v2, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    sget-object v3, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    invoke-direct {v0, v1, v2, v3}, Landroid/graphics/BitmapShader;-><init>(Landroid/graphics/Bitmap;Landroid/graphics/Shader$TileMode;Landroid/graphics/Shader$TileMode;)V

    .line 102
    .local v0, "shader":Landroid/graphics/Shader;
    iget-object v1, p0, Lcom/vk/stories/view/StoryCircleImageView;->m:Landroid/graphics/Matrix;

    invoke-virtual {v0, v1}, Landroid/graphics/Shader;->setLocalMatrix(Landroid/graphics/Matrix;)V

    .line 103
    iget-object v1, p0, Lcom/vk/stories/view/StoryCircleImageView;->paint:Landroid/graphics/Paint;

    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 104
    iget-object v1, p0, Lcom/vk/stories/view/StoryCircleImageView;->m:Landroid/graphics/Matrix;

    iget-object v2, p0, Lcom/vk/stories/view/StoryCircleImageView;->oval:Landroid/graphics/RectF;

    iget-object v3, p0, Lcom/vk/stories/view/StoryCircleImageView;->src:Landroid/graphics/RectF;

    invoke-virtual {v1, v2, v3}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;Landroid/graphics/RectF;)Z

    .line 105
    return-void
.end method

.method public setSelectionAmount(F)V
    .locals 0
    .param p1, "selectionAmount"    # F

    .prologue
    .line 193
    iput p1, p0, Lcom/vk/stories/view/StoryCircleImageView;->selectionAmount:F

    .line 194
    invoke-virtual {p0}, Lcom/vk/stories/view/StoryCircleImageView;->invalidate()V

    .line 195
    return-void
.end method

.method public setStoryContainer(Lcom/vk/stories/model/StoriesContainer;)V
    .locals 6
    .param p1, "container"    # Lcom/vk/stories/model/StoriesContainer;

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 122
    invoke-virtual {p1}, Lcom/vk/stories/model/StoriesContainer;->myStory()Z

    move-result v1

    .line 124
    .local v1, "myStory":Z
    if-eqz p1, :cond_8

    .line 125
    if-eqz v1, :cond_6

    .line 126
    invoke-virtual {p1}, Lcom/vk/stories/model/StoriesContainer;->hasValidStories()Z

    move-result v4

    if-eqz v4, :cond_5

    .line 127
    invoke-virtual {p1}, Lcom/vk/stories/model/StoriesContainer;->getAuthorAvatarUrl()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_0

    .line 128
    invoke-virtual {p1}, Lcom/vk/stories/model/StoriesContainer;->getAuthorAvatarUrl()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Lcom/vk/stories/view/StoryCircleImageView;->load(Ljava/lang/String;)V

    .line 133
    :goto_0
    invoke-virtual {p1}, Lcom/vk/stories/model/StoriesContainer;->hasFailedUploads()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 134
    invoke-direct {p0, v3}, Lcom/vk/stories/view/StoryCircleImageView;->setUploadFailed(Z)V

    .line 135
    invoke-direct {p0, v2, v2}, Lcom/vk/stories/view/StoryCircleImageView;->setHasNewStories(ZZ)V

    .line 171
    :goto_1
    return-void

    .line 130
    :cond_0
    invoke-virtual {p0}, Lcom/vk/stories/view/StoryCircleImageView;->clear()V

    goto :goto_0

    .line 137
    :cond_1
    invoke-direct {p0, v2}, Lcom/vk/stories/view/StoryCircleImageView;->setUploadFailed(Z)V

    .line 138
    invoke-virtual {p1}, Lcom/vk/stories/model/StoriesContainer;->hasNewStories()Z

    move-result v4

    if-eqz v4, :cond_4

    .line 139
    invoke-virtual {p1}, Lcom/vk/stories/model/StoriesContainer;->getLastLocalStory()Lcom/vk/stories/model/StoryEntry;

    move-result-object v0

    .line 140
    .local v0, "lastUploadStory":Lcom/vk/stories/model/StoryEntry;
    if-eqz v0, :cond_3

    .line 141
    sget-object v4, Lcom/vk/stories/view/StoryCircleImageView;->animatedUploadIds:Ljava/util/HashSet;

    iget v5, v0, Lcom/vk/stories/model/StoryEntry;->id:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_2

    move v2, v3

    :cond_2
    invoke-direct {p0, v3, v2}, Lcom/vk/stories/view/StoryCircleImageView;->setHasNewStories(ZZ)V

    .line 142
    sget-object v2, Lcom/vk/stories/view/StoryCircleImageView;->animatedUploadIds:Ljava/util/HashSet;

    iget v3, v0, Lcom/vk/stories/model/StoryEntry;->id:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 144
    :cond_3
    invoke-direct {p0, v3, v2}, Lcom/vk/stories/view/StoryCircleImageView;->setHasNewStories(ZZ)V

    goto :goto_1

    .line 147
    .end local v0    # "lastUploadStory":Lcom/vk/stories/model/StoryEntry;
    :cond_4
    invoke-direct {p0, v2, v2}, Lcom/vk/stories/view/StoryCircleImageView;->setHasNewStories(ZZ)V

    goto :goto_1

    .line 151
    :cond_5
    invoke-virtual {p0}, Lcom/vk/stories/view/StoryCircleImageView;->clear()V

    .line 152
    invoke-direct {p0, v2}, Lcom/vk/stories/view/StoryCircleImageView;->setUploadFailed(Z)V

    .line 153
    invoke-direct {p0, v2, v2}, Lcom/vk/stories/view/StoryCircleImageView;->setHasNewStories(ZZ)V

    goto :goto_1

    .line 156
    :cond_6
    invoke-direct {p0, v2}, Lcom/vk/stories/view/StoryCircleImageView;->setUploadFailed(Z)V

    .line 157
    invoke-virtual {p1}, Lcom/vk/stories/model/StoriesContainer;->hasNewStories()Z

    move-result v3

    invoke-direct {p0, v3, v2}, Lcom/vk/stories/view/StoryCircleImageView;->setHasNewStories(ZZ)V

    .line 159
    invoke-virtual {p1}, Lcom/vk/stories/model/StoriesContainer;->getAuthorAvatarUrl()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_7

    .line 160
    invoke-virtual {p1}, Lcom/vk/stories/model/StoriesContainer;->getAuthorAvatarUrl()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/vk/stories/view/StoryCircleImageView;->load(Ljava/lang/String;)V

    goto :goto_1

    .line 162
    :cond_7
    invoke-virtual {p0}, Lcom/vk/stories/view/StoryCircleImageView;->clear()V

    goto :goto_1

    .line 166
    :cond_8
    invoke-virtual {p0}, Lcom/vk/stories/view/StoryCircleImageView;->clear()V

    .line 167
    invoke-direct {p0, v2, v2}, Lcom/vk/stories/view/StoryCircleImageView;->setHasNewStories(ZZ)V

    .line 168
    invoke-direct {p0, v2}, Lcom/vk/stories/view/StoryCircleImageView;->setUploadFailed(Z)V

    goto :goto_1
.end method
