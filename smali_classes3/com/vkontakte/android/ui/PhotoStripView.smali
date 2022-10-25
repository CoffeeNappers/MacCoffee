.class public Lcom/vkontakte/android/ui/PhotoStripView;
.super Lcom/vk/imageloader/view/VKMultiImageView;
.source "PhotoStripView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/ui/PhotoStripView$OnPhotoClickListener;
    }
.end annotation


# instance fields
.field private alpha:Landroid/util/SparseIntArray;

.field private gListener:Landroid/view/GestureDetector$SimpleOnGestureListener;

.field private gestureDetector:Landroid/view/GestureDetector;

.field private listener:Lcom/vkontakte/android/ui/PhotoStripView$OnPhotoClickListener;

.field private moreIcon:Landroid/graphics/drawable/Drawable;

.field private offset:F

.field private overlap:F

.field private overlapShape:Landroid/graphics/Path;

.field private padding:I

.field private showMoreIcon:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 47
    invoke-direct {p0, p1}, Lcom/vk/imageloader/view/VKMultiImageView;-><init>(Landroid/content/Context;)V

    .line 24
    new-instance v0, Landroid/util/SparseIntArray;

    invoke-direct {v0}, Landroid/util/SparseIntArray;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/ui/PhotoStripView;->alpha:Landroid/util/SparseIntArray;

    .line 25
    const/high16 v0, 0x40400000    # 3.0f

    invoke-static {v0}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/ui/PhotoStripView;->padding:I

    .line 26
    new-instance v0, Lcom/vkontakte/android/ui/PhotoStripView$1;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/ui/PhotoStripView$1;-><init>(Lcom/vkontakte/android/ui/PhotoStripView;)V

    iput-object v0, p0, Lcom/vkontakte/android/ui/PhotoStripView;->gListener:Landroid/view/GestureDetector$SimpleOnGestureListener;

    .line 40
    const/4 v0, 0x0

    iput v0, p0, Lcom/vkontakte/android/ui/PhotoStripView;->offset:F

    .line 42
    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lcom/vkontakte/android/ui/PhotoStripView;->overlap:F

    .line 43
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/ui/PhotoStripView;->showMoreIcon:Z

    .line 48
    invoke-direct {p0}, Lcom/vkontakte/android/ui/PhotoStripView;->init()V

    .line 49
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 52
    invoke-direct {p0, p1, p2}, Lcom/vk/imageloader/view/VKMultiImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 24
    new-instance v0, Landroid/util/SparseIntArray;

    invoke-direct {v0}, Landroid/util/SparseIntArray;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/ui/PhotoStripView;->alpha:Landroid/util/SparseIntArray;

    .line 25
    const/high16 v0, 0x40400000    # 3.0f

    invoke-static {v0}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/ui/PhotoStripView;->padding:I

    .line 26
    new-instance v0, Lcom/vkontakte/android/ui/PhotoStripView$1;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/ui/PhotoStripView$1;-><init>(Lcom/vkontakte/android/ui/PhotoStripView;)V

    iput-object v0, p0, Lcom/vkontakte/android/ui/PhotoStripView;->gListener:Landroid/view/GestureDetector$SimpleOnGestureListener;

    .line 40
    const/4 v0, 0x0

    iput v0, p0, Lcom/vkontakte/android/ui/PhotoStripView;->offset:F

    .line 42
    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lcom/vkontakte/android/ui/PhotoStripView;->overlap:F

    .line 43
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/ui/PhotoStripView;->showMoreIcon:Z

    .line 53
    invoke-direct {p0}, Lcom/vkontakte/android/ui/PhotoStripView;->init()V

    .line 54
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    .line 57
    invoke-direct {p0, p1, p2, p3}, Lcom/vk/imageloader/view/VKMultiImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 24
    new-instance v0, Landroid/util/SparseIntArray;

    invoke-direct {v0}, Landroid/util/SparseIntArray;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/ui/PhotoStripView;->alpha:Landroid/util/SparseIntArray;

    .line 25
    const/high16 v0, 0x40400000    # 3.0f

    invoke-static {v0}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/ui/PhotoStripView;->padding:I

    .line 26
    new-instance v0, Lcom/vkontakte/android/ui/PhotoStripView$1;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/ui/PhotoStripView$1;-><init>(Lcom/vkontakte/android/ui/PhotoStripView;)V

    iput-object v0, p0, Lcom/vkontakte/android/ui/PhotoStripView;->gListener:Landroid/view/GestureDetector$SimpleOnGestureListener;

    .line 40
    const/4 v0, 0x0

    iput v0, p0, Lcom/vkontakte/android/ui/PhotoStripView;->offset:F

    .line 42
    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lcom/vkontakte/android/ui/PhotoStripView;->overlap:F

    .line 43
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/ui/PhotoStripView;->showMoreIcon:Z

    .line 58
    invoke-direct {p0}, Lcom/vkontakte/android/ui/PhotoStripView;->init()V

    .line 59
    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/ui/PhotoStripView;)I
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/PhotoStripView;

    .prologue
    .line 22
    iget v0, p0, Lcom/vkontakte/android/ui/PhotoStripView;->padding:I

    return v0
.end method

.method static synthetic access$100(Lcom/vkontakte/android/ui/PhotoStripView;)Lcom/facebook/drawee/view/MultiDraweeHolder;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/PhotoStripView;

    .prologue
    .line 22
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoStripView;->draweeHolder:Lcom/facebook/drawee/view/MultiDraweeHolder;

    return-object v0
.end method

.method static synthetic access$200(Lcom/vkontakte/android/ui/PhotoStripView;)Lcom/vkontakte/android/ui/PhotoStripView$OnPhotoClickListener;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/PhotoStripView;

    .prologue
    .line 22
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoStripView;->listener:Lcom/vkontakte/android/ui/PhotoStripView$OnPhotoClickListener;

    return-object v0
.end method

.method private init()V
    .locals 3

    .prologue
    .line 62
    new-instance v0, Landroid/view/GestureDetector;

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/PhotoStripView;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/ui/PhotoStripView;->gListener:Landroid/view/GestureDetector$SimpleOnGestureListener;

    invoke-direct {v0, v1, v2}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    iput-object v0, p0, Lcom/vkontakte/android/ui/PhotoStripView;->gestureDetector:Landroid/view/GestureDetector;

    .line 63
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/ui/PhotoStripView;->overlapShape:Landroid/graphics/Path;

    .line 64
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/PhotoStripView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f02024c

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/ui/PhotoStripView;->moreIcon:Landroid/graphics/drawable/Drawable;

    .line 65
    invoke-static {}, Lcom/vkontakte/android/utils/OsUtil;->isAtLeastJB_MR2()Z

    move-result v0

    if-nez v0, :cond_0

    .line 66
    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/ui/PhotoStripView;->setLayerType(ILandroid/graphics/Paint;)V

    .line 68
    :cond_0
    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 1

    .prologue
    .line 249
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoStripView;->draweeHolder:Lcom/facebook/drawee/view/MultiDraweeHolder;

    invoke-virtual {v0}, Lcom/facebook/drawee/view/MultiDraweeHolder;->size()I

    move-result v0

    return v0
.end method

.method public getOffset()F
    .locals 1

    .prologue
    .line 122
    iget v0, p0, Lcom/vkontakte/android/ui/PhotoStripView;->offset:F

    return v0
.end method

.method public load(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 81
    .local p1, "urls":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v0, -0x1

    invoke-virtual {p0, p1, v0}, Lcom/vkontakte/android/ui/PhotoStripView;->load(Ljava/util/List;I)V

    .line 82
    return-void
.end method

.method public load(Ljava/util/List;I)V
    .locals 3
    .param p2, "maxCount"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;I)V"
        }
    .end annotation

    .prologue
    .line 104
    .local p1, "urls":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-ltz p2, :cond_0

    .line 105
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    invoke-static {v2, p2}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 110
    .local v0, "count":I
    :goto_0
    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/PhotoStripView;->setCount(I)V

    .line 111
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    if-ge v1, v0, :cond_1

    .line 112
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {p0, v1, v2}, Lcom/vkontakte/android/ui/PhotoStripView;->load(ILjava/lang/String;)V

    .line 111
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 107
    .end local v0    # "count":I
    .end local v1    # "i":I
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    .restart local v0    # "count":I
    goto :goto_0

    .line 114
    .restart local v1    # "i":I
    :cond_1
    return-void
.end method

.method public load([Ljava/lang/String;)V
    .locals 1
    .param p1, "urls"    # [Ljava/lang/String;

    .prologue
    .line 85
    const/4 v0, -0x1

    invoke-virtual {p0, p1, v0}, Lcom/vkontakte/android/ui/PhotoStripView;->load([Ljava/lang/String;I)V

    .line 86
    return-void
.end method

.method public load([Ljava/lang/String;I)V
    .locals 3
    .param p1, "urls"    # [Ljava/lang/String;
    .param p2, "maxCount"    # I

    .prologue
    .line 90
    if-ltz p2, :cond_0

    .line 91
    array-length v2, p1

    invoke-static {v2, p2}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 96
    .local v0, "count":I
    :goto_0
    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/PhotoStripView;->setCount(I)V

    .line 97
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    if-ge v1, v0, :cond_1

    .line 98
    aget-object v2, p1, v1

    invoke-virtual {p0, v1, v2}, Lcom/vkontakte/android/ui/PhotoStripView;->load(ILjava/lang/String;)V

    .line 97
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 93
    .end local v0    # "count":I
    .end local v1    # "i":I
    :cond_0
    array-length v0, p1

    .restart local v0    # "count":I
    goto :goto_0

    .line 100
    .restart local v1    # "i":I
    :cond_1
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 12
    .param p1, "c"    # Landroid/graphics/Canvas;

    .prologue
    const/4 v11, 0x0

    const/high16 v10, 0x3f800000    # 1.0f

    const/4 v7, 0x0

    .line 208
    invoke-super {p0, p1}, Lcom/vk/imageloader/view/VKMultiImageView;->onDraw(Landroid/graphics/Canvas;)V

    .line 209
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/PhotoStripView;->getHeight()I

    move-result v3

    .line 210
    .local v3, "size":I
    iget v6, p0, Lcom/vkontakte/android/ui/PhotoStripView;->padding:I

    add-int v4, v3, v6

    .line 211
    .local v4, "sizePadding":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/PhotoStripView;->size()I

    move-result v6

    if-ge v1, v6, :cond_1

    .line 212
    mul-int v6, v4, v1

    iget v8, p0, Lcom/vkontakte/android/ui/PhotoStripView;->offset:F

    int-to-float v9, v4

    mul-float/2addr v8, v9

    invoke-static {v8}, Ljava/lang/Math;->round(F)I

    move-result v8

    sub-int v5, v6, v8

    .line 213
    .local v5, "x":I
    if-lez v1, :cond_0

    iget v6, p0, Lcom/vkontakte/android/ui/PhotoStripView;->overlap:F

    cmpg-float v6, v6, v10

    if-gez v6, :cond_0

    .line 214
    int-to-float v6, v5

    int-to-float v8, v3

    iget v9, p0, Lcom/vkontakte/android/ui/PhotoStripView;->overlap:F

    sub-float v9, v10, v9

    mul-float/2addr v8, v9

    int-to-float v9, v1

    mul-float/2addr v8, v9

    sub-float/2addr v6, v8

    float-to-int v5, v6

    .line 216
    :cond_0
    add-int v8, v5, v3

    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    move-result v9

    iget-boolean v6, p0, Lcom/vkontakte/android/ui/PhotoStripView;->showMoreIcon:Z

    if-eqz v6, :cond_4

    move v6, v4

    :goto_1
    sub-int v6, v9, v6

    if-le v8, v6, :cond_5

    .line 237
    .end local v5    # "x":I
    :cond_1
    iget-boolean v6, p0, Lcom/vkontakte/android/ui/PhotoStripView;->showMoreIcon:Z

    if-eqz v6, :cond_3

    .line 238
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    move-result v6

    div-int/2addr v6, v4

    add-int/lit8 v2, v6, -0x1

    .line 239
    .local v2, "maxIndex":I
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/PhotoStripView;->getCount()I

    move-result v6

    invoke-static {v2, v6}, Ljava/lang/Math;->min(II)I

    move-result v6

    mul-int/2addr v6, v4

    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    move-result v8

    sub-int/2addr v8, v3

    invoke-static {v6, v8}, Ljava/lang/Math;->min(II)I

    move-result v5

    .line 240
    .restart local v5    # "x":I
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/PhotoStripView;->getCount()I

    move-result v6

    if-le v2, v6, :cond_2

    .line 241
    iget v6, p0, Lcom/vkontakte/android/ui/PhotoStripView;->offset:F

    int-to-float v8, v4

    mul-float/2addr v6, v8

    invoke-static {v6}, Ljava/lang/Math;->round(F)I

    move-result v6

    sub-int/2addr v5, v6

    .line 243
    :cond_2
    iget-object v6, p0, Lcom/vkontakte/android/ui/PhotoStripView;->moreIcon:Landroid/graphics/drawable/Drawable;

    add-int v8, v5, v3

    invoke-virtual {v6, v5, v7, v8, v3}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 244
    iget-object v6, p0, Lcom/vkontakte/android/ui/PhotoStripView;->moreIcon:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v6, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 246
    .end local v2    # "maxIndex":I
    .end local v5    # "x":I
    :cond_3
    return-void

    .restart local v5    # "x":I
    :cond_4
    move v6, v7

    .line 216
    goto :goto_1

    .line 219
    :cond_5
    iget-object v6, p0, Lcom/vkontakte/android/ui/PhotoStripView;->draweeHolder:Lcom/facebook/drawee/view/MultiDraweeHolder;

    invoke-virtual {v6, v1}, Lcom/facebook/drawee/view/MultiDraweeHolder;->get(I)Lcom/facebook/drawee/view/DraweeHolder;

    move-result-object v6

    invoke-virtual {v6}, Lcom/facebook/drawee/view/DraweeHolder;->getTopLevelDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 220
    .local v0, "d":Landroid/graphics/drawable/Drawable;
    if-eqz v0, :cond_7

    .line 221
    iget-object v6, p0, Lcom/vkontakte/android/ui/PhotoStripView;->alpha:Landroid/util/SparseIntArray;

    const/16 v8, 0xff

    invoke-virtual {v6, v1, v8}, Landroid/util/SparseIntArray;->get(II)I

    move-result v6

    invoke-virtual {v0, v6}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 222
    iget v6, p0, Lcom/vkontakte/android/ui/PhotoStripView;->overlap:F

    cmpl-float v6, v6, v10

    if-eqz v6, :cond_6

    if-nez v1, :cond_8

    .line 223
    :cond_6
    int-to-float v6, v5

    invoke-static {v6}, Ljava/lang/Math;->round(F)I

    move-result v6

    add-int v8, v5, v3

    int-to-float v8, v8

    invoke-static {v8}, Ljava/lang/Math;->round(F)I

    move-result v8

    invoke-virtual {v0, v6, v7, v8, v3}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 224
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 211
    :cond_7
    :goto_2
    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_0

    .line 226
    :cond_8
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 227
    iget-object v6, p0, Lcom/vkontakte/android/ui/PhotoStripView;->overlapShape:Landroid/graphics/Path;

    int-to-float v8, v5

    invoke-virtual {v6, v8, v11}, Landroid/graphics/Path;->offset(FF)V

    .line 228
    iget-object v6, p0, Lcom/vkontakte/android/ui/PhotoStripView;->overlapShape:Landroid/graphics/Path;

    invoke-virtual {p1, v6}, Landroid/graphics/Canvas;->clipPath(Landroid/graphics/Path;)Z

    .line 229
    int-to-float v6, v5

    invoke-static {v6}, Ljava/lang/Math;->round(F)I

    move-result v6

    add-int v8, v5, v3

    int-to-float v8, v8

    invoke-static {v8}, Ljava/lang/Math;->round(F)I

    move-result v8

    invoke-virtual {v0, v6, v7, v8, v3}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 230
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 231
    iget-object v6, p0, Lcom/vkontakte/android/ui/PhotoStripView;->overlapShape:Landroid/graphics/Path;

    neg-int v8, v5

    int-to-float v8, v8

    invoke-virtual {v6, v8, v11}, Landroid/graphics/Path;->offset(FF)V

    .line 232
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    goto :goto_2
.end method

.method protected onMeasure(II)V
    .locals 7
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    .line 182
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v0

    .line 183
    .local v0, "h":I
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v1

    .line 184
    .local v1, "w":I
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v3

    const/high16 v4, 0x40000000    # 2.0f

    if-ne v3, v4, :cond_0

    .line 185
    invoke-virtual {p0, v1, v0}, Lcom/vkontakte/android/ui/PhotoStripView;->setMeasuredDimension(II)V

    .line 198
    :goto_0
    return-void

    .line 186
    :cond_0
    iget v3, p0, Lcom/vkontakte/android/ui/PhotoStripView;->overlap:F

    const/high16 v4, 0x3f800000    # 1.0f

    cmpg-float v3, v3, v4

    if-gez v3, :cond_3

    .line 187
    const/4 v2, 0x0

    .line 188
    .local v2, "ww":I
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/PhotoStripView;->getCount()I

    move-result v3

    if-lez v3, :cond_1

    .line 189
    iget v3, p0, Lcom/vkontakte/android/ui/PhotoStripView;->padding:I

    add-int/2addr v3, v0

    add-int/2addr v2, v3

    .line 191
    :cond_1
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/PhotoStripView;->getCount()I

    move-result v3

    const/4 v4, 0x1

    if-le v3, v4, :cond_2

    .line 192
    int-to-float v3, v2

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/PhotoStripView;->getCount()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    mul-int/2addr v4, v0

    int-to-float v4, v4

    iget v5, p0, Lcom/vkontakte/android/ui/PhotoStripView;->overlap:F

    mul-float/2addr v4, v5

    iget v5, p0, Lcom/vkontakte/android/ui/PhotoStripView;->padding:I

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/PhotoStripView;->getCount()I

    move-result v6

    add-int/lit8 v6, v6, -0x2

    mul-int/2addr v5, v6

    int-to-float v5, v5

    add-float/2addr v4, v5

    add-float/2addr v3, v4

    float-to-int v2, v3

    .line 194
    :cond_2
    invoke-virtual {p0, v2, v0}, Lcom/vkontakte/android/ui/PhotoStripView;->setMeasuredDimension(II)V

    goto :goto_0

    .line 196
    .end local v2    # "ww":I
    :cond_3
    iget v3, p0, Lcom/vkontakte/android/ui/PhotoStripView;->padding:I

    add-int/2addr v3, v0

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/PhotoStripView;->getCount()I

    move-result v4

    mul-int/2addr v3, v4

    invoke-virtual {p0, v3, v0}, Lcom/vkontakte/android/ui/PhotoStripView;->setMeasuredDimension(II)V

    goto :goto_0
.end method

.method protected onSizeChanged(IIII)V
    .locals 1
    .param p1, "w"    # I
    .param p2, "h"    # I
    .param p3, "oldw"    # I
    .param p4, "oldh"    # I

    .prologue
    .line 202
    invoke-super {p0, p1, p2, p3, p4}, Lcom/vk/imageloader/view/VKMultiImageView;->onSizeChanged(IIII)V

    .line 203
    iget v0, p0, Lcom/vkontakte/android/ui/PhotoStripView;->overlap:F

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/PhotoStripView;->setOverlapOffset(F)V

    .line 204
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 2
    .param p1, "ev"    # Landroid/view/MotionEvent;

    .prologue
    .line 126
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoStripView;->listener:Lcom/vkontakte/android/ui/PhotoStripView$OnPhotoClickListener;

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/vkontakte/android/ui/PhotoStripView;->overlap:F

    const/high16 v1, 0x3f800000    # 1.0f

    cmpl-float v0, v0, v1

    if-nez v0, :cond_0

    .line 127
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoStripView;->gestureDetector:Landroid/view/GestureDetector;

    invoke-virtual {v0, p1}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 128
    const/4 v0, 0x1

    .line 130
    :goto_0
    return v0

    :cond_0
    invoke-super {p0, p1}, Lcom/vk/imageloader/view/VKMultiImageView;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    goto :goto_0
.end method

.method public setBitmapAlpha(II)V
    .locals 1
    .param p1, "index"    # I
    .param p2, "alpha"    # I

    .prologue
    .line 172
    const/16 v0, 0xff

    if-ne p2, v0, :cond_0

    .line 173
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoStripView;->alpha:Landroid/util/SparseIntArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseIntArray;->delete(I)V

    .line 177
    :goto_0
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/PhotoStripView;->invalidate()V

    .line 178
    return-void

    .line 175
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/ui/PhotoStripView;->alpha:Landroid/util/SparseIntArray;

    invoke-virtual {v0, p1, p2}, Landroid/util/SparseIntArray;->append(II)V

    goto :goto_0
.end method

.method public setCount(I)V
    .locals 4
    .param p1, "count"    # I

    .prologue
    .line 71
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/PhotoStripView;->reset()V

    .line 72
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, p1, :cond_0

    .line 73
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/PhotoStripView;->addImage()V

    .line 74
    iget-object v1, p0, Lcom/vkontakte/android/ui/PhotoStripView;->draweeHolder:Lcom/facebook/drawee/view/MultiDraweeHolder;

    invoke-virtual {v1, v0}, Lcom/facebook/drawee/view/MultiDraweeHolder;->get(I)Lcom/facebook/drawee/view/DraweeHolder;

    move-result-object v1

    invoke-virtual {v1}, Lcom/facebook/drawee/view/DraweeHolder;->getHierarchy()Lcom/facebook/drawee/interfaces/DraweeHierarchy;

    move-result-object v1

    check-cast v1, Lcom/facebook/drawee/generic/GenericDraweeHierarchy;

    invoke-static {}, Lcom/facebook/drawee/generic/RoundingParams;->asCircle()Lcom/facebook/drawee/generic/RoundingParams;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/facebook/drawee/generic/GenericDraweeHierarchy;->setRoundingParams(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 75
    iget-object v1, p0, Lcom/vkontakte/android/ui/PhotoStripView;->draweeHolder:Lcom/facebook/drawee/view/MultiDraweeHolder;

    invoke-virtual {v1, v0}, Lcom/facebook/drawee/view/MultiDraweeHolder;->get(I)Lcom/facebook/drawee/view/DraweeHolder;

    move-result-object v1

    invoke-virtual {v1}, Lcom/facebook/drawee/view/DraweeHolder;->getHierarchy()Lcom/facebook/drawee/interfaces/DraweeHierarchy;

    move-result-object v1

    check-cast v1, Lcom/facebook/drawee/generic/GenericDraweeHierarchy;

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/PhotoStripView;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f02039b

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/facebook/drawee/generic/GenericDraweeHierarchy;->setPlaceholderImage(Landroid/graphics/drawable/Drawable;)V

    .line 72
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 77
    :cond_0
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/PhotoStripView;->requestLayout()V

    .line 78
    return-void
.end method

.method public setListener(Lcom/vkontakte/android/ui/PhotoStripView$OnPhotoClickListener;)V
    .locals 0
    .param p1, "l"    # Lcom/vkontakte/android/ui/PhotoStripView$OnPhotoClickListener;

    .prologue
    .line 134
    iput-object p1, p0, Lcom/vkontakte/android/ui/PhotoStripView;->listener:Lcom/vkontakte/android/ui/PhotoStripView$OnPhotoClickListener;

    .line 135
    return-void
.end method

.method public setOffset(F)V
    .locals 0
    .param p1, "offset"    # F

    .prologue
    .line 117
    iput p1, p0, Lcom/vkontakte/android/ui/PhotoStripView;->offset:F

    .line 118
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/PhotoStripView;->invalidate()V

    .line 119
    return-void
.end method

.method public setOverlapOffset(F)V
    .locals 11
    .param p1, "overlap"    # F

    .prologue
    const/high16 v9, 0x3f800000    # 1.0f

    const/high16 v10, 0x3f000000    # 0.5f

    .line 143
    iput p1, p0, Lcom/vkontakte/android/ui/PhotoStripView;->overlap:F

    .line 144
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/PhotoStripView;->getHeight()I

    move-result v6

    .line 145
    .local v6, "size":I
    iget-object v7, p0, Lcom/vkontakte/android/ui/PhotoStripView;->overlapShape:Landroid/graphics/Path;

    invoke-virtual {v7}, Landroid/graphics/Path;->reset()V

    .line 146
    iget-object v7, p0, Lcom/vkontakte/android/ui/PhotoStripView;->overlapShape:Landroid/graphics/Path;

    sget-object v8, Landroid/graphics/Path$FillType;->EVEN_ODD:Landroid/graphics/Path$FillType;

    invoke-virtual {v7, v8}, Landroid/graphics/Path;->setFillType(Landroid/graphics/Path$FillType;)V

    .line 148
    cmpl-float v7, p1, v9

    if-nez v7, :cond_0

    .line 164
    :goto_0
    return-void

    .line 154
    :cond_0
    div-int/lit8 v7, v6, 0x2

    int-to-float v4, v7

    .local v4, "r":F
    div-int/lit8 v7, v6, 0x2

    iget v8, p0, Lcom/vkontakte/android/ui/PhotoStripView;->padding:I

    div-int/lit8 v8, v8, 0x2

    add-int/2addr v7, v8

    int-to-float v5, v7

    .line 155
    .local v5, "s":F
    div-int/lit8 v7, v6, 0x2

    int-to-float v0, v7

    .local v0, "a":F
    div-int/lit8 v7, v6, 0x2

    int-to-float v1, v7

    .local v1, "b":F
    neg-float v7, v5

    const/high16 v8, 0x40000000    # 2.0f

    mul-float/2addr v8, v5

    sub-float/2addr v9, p1

    mul-float/2addr v8, v9

    add-float v2, v7, v8

    .local v2, "c":F
    div-int/lit8 v7, v6, 0x2

    int-to-float v3, v7

    .line 161
    .local v3, "d":F
    iget-object v7, p0, Lcom/vkontakte/android/ui/PhotoStripView;->overlapShape:Landroid/graphics/Path;

    add-float v8, v4, v10

    sget-object v9, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    invoke-virtual {v7, v0, v1, v8, v9}, Landroid/graphics/Path;->addCircle(FFFLandroid/graphics/Path$Direction;)V

    .line 162
    iget-object v7, p0, Lcom/vkontakte/android/ui/PhotoStripView;->overlapShape:Landroid/graphics/Path;

    add-float v8, v5, v10

    sget-object v9, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    invoke-virtual {v7, v2, v3, v8, v9}, Landroid/graphics/Path;->addCircle(FFFLandroid/graphics/Path$Direction;)V

    .line 163
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/PhotoStripView;->invalidate()V

    goto :goto_0
.end method

.method public setPadding(I)V
    .locals 0
    .param p1, "padding"    # I

    .prologue
    .line 138
    iput p1, p0, Lcom/vkontakte/android/ui/PhotoStripView;->padding:I

    .line 139
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/PhotoStripView;->invalidate()V

    .line 140
    return-void
.end method

.method public setShowMoreIcon(Z)V
    .locals 0
    .param p1, "show"    # Z

    .prologue
    .line 167
    iput-boolean p1, p0, Lcom/vkontakte/android/ui/PhotoStripView;->showMoreIcon:Z

    .line 168
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/PhotoStripView;->invalidate()V

    .line 169
    return-void
.end method
