.class public final Lcom/vk/music/graphics/PlayingDrawable;
.super Landroid/graphics/drawable/Drawable;
.source "PlayingDrawable.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/music/graphics/PlayingDrawable$ResourceBuilder;,
        Lcom/vk/music/graphics/PlayingDrawable$Builder;
    }
.end annotation


# static fields
.field private static final UPDATE_INTERVAL:J = 0x96L


# instance fields
.field private final accelerate:Landroid/view/animation/AccelerateInterpolator;

.field private animating:Z

.field private final count:I

.field private final decelerate:Landroid/view/animation/DecelerateInterpolator;

.field private final gapWidth:I

.field private final height:I

.field private final interpolators:[Landroid/animation/TimeInterpolator;

.field private final nextVals:[F

.field private final paint:Landroid/graphics/Paint;

.field private final prevVals:[F

.field private final random:Ljava/util/Random;

.field private final rect:Landroid/graphics/RectF;

.field private rectCornerRadius:I

.field private final rectHeight:I

.field private final rectMinHeight:I

.field private final rectWidth:I

.field private final shaderCanvas:Landroid/graphics/Canvas;

.field private final shaderPaint:Landroid/graphics/Paint;

.field private startTime:J

.field private final width:I


# direct methods
.method private constructor <init>(Lcom/vk/music/graphics/PlayingDrawable$Builder;)V
    .locals 5
    .param p1, "builder"    # Lcom/vk/music/graphics/PlayingDrawable$Builder;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    const/4 v4, 0x1

    .line 155
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 150
    const-wide/16 v2, 0x0

    iput-wide v2, p0, Lcom/vk/music/graphics/PlayingDrawable;->startTime:J

    .line 156
    invoke-static {p1}, Lcom/vk/music/graphics/PlayingDrawable$Builder;->access$100(Lcom/vk/music/graphics/PlayingDrawable$Builder;)I

    move-result v1

    iput v1, p0, Lcom/vk/music/graphics/PlayingDrawable;->count:I

    .line 157
    invoke-static {p1}, Lcom/vk/music/graphics/PlayingDrawable$Builder;->access$200(Lcom/vk/music/graphics/PlayingDrawable$Builder;)I

    move-result v1

    iput v1, p0, Lcom/vk/music/graphics/PlayingDrawable;->rectWidth:I

    .line 158
    invoke-static {p1}, Lcom/vk/music/graphics/PlayingDrawable$Builder;->access$300(Lcom/vk/music/graphics/PlayingDrawable$Builder;)I

    move-result v1

    iput v1, p0, Lcom/vk/music/graphics/PlayingDrawable;->rectHeight:I

    .line 159
    invoke-static {p1}, Lcom/vk/music/graphics/PlayingDrawable$Builder;->access$400(Lcom/vk/music/graphics/PlayingDrawable$Builder;)I

    move-result v1

    iput v1, p0, Lcom/vk/music/graphics/PlayingDrawable;->rectMinHeight:I

    .line 160
    iget v1, p0, Lcom/vk/music/graphics/PlayingDrawable;->rectMinHeight:I

    iget v2, p0, Lcom/vk/music/graphics/PlayingDrawable;->rectHeight:I

    if-le v1, v2, :cond_0

    .line 161
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "rectMinHeight = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/vk/music/graphics/PlayingDrawable;->rectMinHeight:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, " must not be greater than rectHeight = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/vk/music/graphics/PlayingDrawable;->rectHeight:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 163
    :cond_0
    invoke-static {p1}, Lcom/vk/music/graphics/PlayingDrawable$Builder;->access$500(Lcom/vk/music/graphics/PlayingDrawable$Builder;)I

    move-result v1

    iput v1, p0, Lcom/vk/music/graphics/PlayingDrawable;->gapWidth:I

    .line 164
    invoke-static {p1}, Lcom/vk/music/graphics/PlayingDrawable$Builder;->access$600(Lcom/vk/music/graphics/PlayingDrawable$Builder;)I

    move-result v1

    iput v1, p0, Lcom/vk/music/graphics/PlayingDrawable;->rectCornerRadius:I

    .line 166
    iget v1, p0, Lcom/vk/music/graphics/PlayingDrawable;->count:I

    iget v2, p0, Lcom/vk/music/graphics/PlayingDrawable;->rectWidth:I

    iget v3, p0, Lcom/vk/music/graphics/PlayingDrawable;->gapWidth:I

    add-int/2addr v2, v3

    mul-int/2addr v1, v2

    iget v2, p0, Lcom/vk/music/graphics/PlayingDrawable;->gapWidth:I

    sub-int/2addr v1, v2

    iput v1, p0, Lcom/vk/music/graphics/PlayingDrawable;->width:I

    .line 167
    iget v1, p0, Lcom/vk/music/graphics/PlayingDrawable;->rectHeight:I

    iput v1, p0, Lcom/vk/music/graphics/PlayingDrawable;->height:I

    .line 169
    iget v1, p0, Lcom/vk/music/graphics/PlayingDrawable;->width:I

    iget v2, p0, Lcom/vk/music/graphics/PlayingDrawable;->height:I

    sget-object v3, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v1, v2, v3}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 170
    .local v0, "shaderBitmap":Landroid/graphics/Bitmap;
    new-instance v1, Landroid/graphics/Canvas;

    invoke-direct {v1, v0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    iput-object v1, p0, Lcom/vk/music/graphics/PlayingDrawable;->shaderCanvas:Landroid/graphics/Canvas;

    .line 171
    new-instance v1, Landroid/graphics/RectF;

    invoke-direct {v1}, Landroid/graphics/RectF;-><init>()V

    iput-object v1, p0, Lcom/vk/music/graphics/PlayingDrawable;->rect:Landroid/graphics/RectF;

    .line 172
    new-instance v1, Ljava/util/Random;

    invoke-direct {v1}, Ljava/util/Random;-><init>()V

    iput-object v1, p0, Lcom/vk/music/graphics/PlayingDrawable;->random:Ljava/util/Random;

    .line 174
    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1, v4}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v1, p0, Lcom/vk/music/graphics/PlayingDrawable;->shaderPaint:Landroid/graphics/Paint;

    .line 175
    iget-object v1, p0, Lcom/vk/music/graphics/PlayingDrawable;->shaderPaint:Landroid/graphics/Paint;

    invoke-static {p1}, Lcom/vk/music/graphics/PlayingDrawable$Builder;->access$700(Lcom/vk/music/graphics/PlayingDrawable$Builder;)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 177
    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1, v4}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v1, p0, Lcom/vk/music/graphics/PlayingDrawable;->paint:Landroid/graphics/Paint;

    .line 178
    iget-object v1, p0, Lcom/vk/music/graphics/PlayingDrawable;->paint:Landroid/graphics/Paint;

    new-instance v2, Landroid/graphics/BitmapShader;

    sget-object v3, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    sget-object v4, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    invoke-direct {v2, v0, v3, v4}, Landroid/graphics/BitmapShader;-><init>(Landroid/graphics/Bitmap;Landroid/graphics/Shader$TileMode;Landroid/graphics/Shader$TileMode;)V

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 180
    iget v1, p0, Lcom/vk/music/graphics/PlayingDrawable;->count:I

    new-array v1, v1, [F

    iput-object v1, p0, Lcom/vk/music/graphics/PlayingDrawable;->prevVals:[F

    .line 181
    iget v1, p0, Lcom/vk/music/graphics/PlayingDrawable;->count:I

    new-array v1, v1, [F

    iput-object v1, p0, Lcom/vk/music/graphics/PlayingDrawable;->nextVals:[F

    .line 182
    iget v1, p0, Lcom/vk/music/graphics/PlayingDrawable;->count:I

    new-array v1, v1, [Landroid/animation/TimeInterpolator;

    iput-object v1, p0, Lcom/vk/music/graphics/PlayingDrawable;->interpolators:[Landroid/animation/TimeInterpolator;

    .line 184
    new-instance v1, Landroid/view/animation/DecelerateInterpolator;

    invoke-direct {v1}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    iput-object v1, p0, Lcom/vk/music/graphics/PlayingDrawable;->decelerate:Landroid/view/animation/DecelerateInterpolator;

    .line 185
    new-instance v1, Landroid/view/animation/AccelerateInterpolator;

    invoke-direct {v1}, Landroid/view/animation/AccelerateInterpolator;-><init>()V

    iput-object v1, p0, Lcom/vk/music/graphics/PlayingDrawable;->accelerate:Landroid/view/animation/AccelerateInterpolator;

    .line 186
    return-void
.end method

.method synthetic constructor <init>(Lcom/vk/music/graphics/PlayingDrawable$Builder;Lcom/vk/music/graphics/PlayingDrawable$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vk/music/graphics/PlayingDrawable$Builder;
    .param p2, "x1"    # Lcom/vk/music/graphics/PlayingDrawable$1;

    .prologue
    .line 31
    invoke-direct {p0, p1}, Lcom/vk/music/graphics/PlayingDrawable;-><init>(Lcom/vk/music/graphics/PlayingDrawable$Builder;)V

    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .locals 14
    .param p1, "canvas"    # Landroid/graphics/Canvas;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 190
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    .line 191
    .local v6, "sysTime":J
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 192
    invoke-virtual {p0}, Lcom/vk/music/graphics/PlayingDrawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    .line 193
    .local v0, "bounds":Landroid/graphics/Rect;
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v8

    iget v9, p0, Lcom/vk/music/graphics/PlayingDrawable;->width:I

    sub-int/2addr v8, v9

    div-int/lit8 v8, v8, 0x2

    int-to-float v8, v8

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v9

    iget v10, p0, Lcom/vk/music/graphics/PlayingDrawable;->height:I

    sub-int/2addr v9, v10

    div-int/lit8 v9, v9, 0x2

    int-to-float v9, v9

    invoke-virtual {p1, v8, v9}, Landroid/graphics/Canvas;->translate(FF)V

    .line 194
    iget-wide v8, p0, Lcom/vk/music/graphics/PlayingDrawable;->startTime:J

    sub-long v8, v6, v8

    const-wide/16 v10, 0x96

    cmp-long v8, v8, v10

    if-lez v8, :cond_2

    .line 195
    iput-wide v6, p0, Lcom/vk/music/graphics/PlayingDrawable;->startTime:J

    .line 196
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget v8, p0, Lcom/vk/music/graphics/PlayingDrawable;->count:I

    if-ge v1, v8, :cond_2

    .line 197
    iget-object v8, p0, Lcom/vk/music/graphics/PlayingDrawable;->prevVals:[F

    iget-object v9, p0, Lcom/vk/music/graphics/PlayingDrawable;->nextVals:[F

    aget v9, v9, v1

    aput v9, v8, v1

    .line 198
    iget-boolean v8, p0, Lcom/vk/music/graphics/PlayingDrawable;->animating:Z

    if-eqz v8, :cond_0

    .line 199
    iget-object v8, p0, Lcom/vk/music/graphics/PlayingDrawable;->nextVals:[F

    iget-object v9, p0, Lcom/vk/music/graphics/PlayingDrawable;->random:Ljava/util/Random;

    const v10, 0xf4240

    invoke-virtual {v9, v10}, Ljava/util/Random;->nextInt(I)I

    move-result v9

    int-to-double v10, v9

    invoke-static {v10, v11}, Ljava/lang/Math;->cbrt(D)D

    move-result-wide v10

    const-wide/high16 v12, 0x4059000000000000L    # 100.0

    div-double/2addr v10, v12

    double-to-float v9, v10

    aput v9, v8, v1

    .line 203
    :goto_1
    iget-object v9, p0, Lcom/vk/music/graphics/PlayingDrawable;->interpolators:[Landroid/animation/TimeInterpolator;

    iget-object v8, p0, Lcom/vk/music/graphics/PlayingDrawable;->nextVals:[F

    aget v8, v8, v1

    iget-object v10, p0, Lcom/vk/music/graphics/PlayingDrawable;->prevVals:[F

    aget v10, v10, v1

    cmpl-float v8, v8, v10

    if-lez v8, :cond_1

    iget-object v8, p0, Lcom/vk/music/graphics/PlayingDrawable;->accelerate:Landroid/view/animation/AccelerateInterpolator;

    :goto_2
    aput-object v8, v9, v1

    .line 196
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 201
    :cond_0
    iget-object v8, p0, Lcom/vk/music/graphics/PlayingDrawable;->nextVals:[F

    const/4 v9, 0x0

    aput v9, v8, v1

    goto :goto_1

    .line 203
    :cond_1
    iget-object v8, p0, Lcom/vk/music/graphics/PlayingDrawable;->decelerate:Landroid/view/animation/DecelerateInterpolator;

    goto :goto_2

    .line 206
    .end local v1    # "i":I
    :cond_2
    iget-wide v8, p0, Lcom/vk/music/graphics/PlayingDrawable;->startTime:J

    sub-long v8, v6, v8

    long-to-float v8, v8

    const/high16 v9, 0x43160000    # 150.0f

    div-float v5, v8, v9

    .line 207
    .local v5, "t":F
    const/4 v4, 0x0

    .line 208
    .local v4, "s":F
    iget-object v8, p0, Lcom/vk/music/graphics/PlayingDrawable;->shaderCanvas:Landroid/graphics/Canvas;

    const/4 v9, 0x0

    sget-object v10, Landroid/graphics/PorterDuff$Mode;->CLEAR:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v8, v9, v10}, Landroid/graphics/Canvas;->drawColor(ILandroid/graphics/PorterDuff$Mode;)V

    .line 209
    const/4 v1, 0x0

    .restart local v1    # "i":I
    :goto_3
    iget v8, p0, Lcom/vk/music/graphics/PlayingDrawable;->count:I

    if-ge v1, v8, :cond_3

    .line 210
    iget-object v8, p0, Lcom/vk/music/graphics/PlayingDrawable;->prevVals:[F

    aget v8, v8, v1

    add-float/2addr v4, v8

    .line 211
    iget-object v8, p0, Lcom/vk/music/graphics/PlayingDrawable;->prevVals:[F

    aget v8, v8, v1

    iget-object v9, p0, Lcom/vk/music/graphics/PlayingDrawable;->nextVals:[F

    aget v9, v9, v1

    iget-object v10, p0, Lcom/vk/music/graphics/PlayingDrawable;->prevVals:[F

    aget v10, v10, v1

    sub-float/2addr v9, v10

    iget-object v10, p0, Lcom/vk/music/graphics/PlayingDrawable;->interpolators:[Landroid/animation/TimeInterpolator;

    aget-object v10, v10, v1

    .line 212
    invoke-interface {v10, v5}, Landroid/animation/TimeInterpolator;->getInterpolation(F)F

    move-result v10

    mul-float/2addr v9, v10

    add-float/2addr v8, v9

    iget v9, p0, Lcom/vk/music/graphics/PlayingDrawable;->rectHeight:I

    int-to-float v9, v9

    mul-float/2addr v8, v9

    invoke-static {v8}, Ljava/lang/Math;->round(F)I

    move-result v8

    iget v9, p0, Lcom/vk/music/graphics/PlayingDrawable;->rectWidth:I

    .line 211
    invoke-static {v8, v9}, Ljava/lang/Math;->max(II)I

    move-result v3

    .line 214
    .local v3, "rectH":I
    iget v8, p0, Lcom/vk/music/graphics/PlayingDrawable;->rectWidth:I

    iget v9, p0, Lcom/vk/music/graphics/PlayingDrawable;->gapWidth:I

    add-int/2addr v8, v9

    mul-int/2addr v8, v1

    int-to-float v2, v8

    .line 215
    .local v2, "left":F
    iget-object v8, p0, Lcom/vk/music/graphics/PlayingDrawable;->rect:Landroid/graphics/RectF;

    iget v9, p0, Lcom/vk/music/graphics/PlayingDrawable;->rectHeight:I

    sub-int/2addr v9, v3

    int-to-float v9, v9

    iget v10, p0, Lcom/vk/music/graphics/PlayingDrawable;->rectWidth:I

    int-to-float v10, v10

    add-float/2addr v10, v2

    iget v11, p0, Lcom/vk/music/graphics/PlayingDrawable;->rectHeight:I

    int-to-float v11, v11

    invoke-virtual {v8, v2, v9, v10, v11}, Landroid/graphics/RectF;->set(FFFF)V

    .line 216
    iget-object v8, p0, Lcom/vk/music/graphics/PlayingDrawable;->shaderCanvas:Landroid/graphics/Canvas;

    iget-object v9, p0, Lcom/vk/music/graphics/PlayingDrawable;->rect:Landroid/graphics/RectF;

    iget v10, p0, Lcom/vk/music/graphics/PlayingDrawable;->rectCornerRadius:I

    int-to-float v10, v10

    iget v11, p0, Lcom/vk/music/graphics/PlayingDrawable;->rectCornerRadius:I

    int-to-float v11, v11

    iget-object v12, p0, Lcom/vk/music/graphics/PlayingDrawable;->shaderPaint:Landroid/graphics/Paint;

    invoke-virtual {v8, v9, v10, v11, v12}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 209
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    .line 218
    .end local v2    # "left":F
    .end local v3    # "rectH":I
    :cond_3
    iget-object v8, p0, Lcom/vk/music/graphics/PlayingDrawable;->rect:Landroid/graphics/RectF;

    const/4 v9, 0x0

    const/4 v10, 0x0

    iget v11, p0, Lcom/vk/music/graphics/PlayingDrawable;->width:I

    int-to-float v11, v11

    iget v12, p0, Lcom/vk/music/graphics/PlayingDrawable;->height:I

    int-to-float v12, v12

    invoke-virtual {v8, v9, v10, v11, v12}, Landroid/graphics/RectF;->set(FFFF)V

    .line 219
    iget-object v8, p0, Lcom/vk/music/graphics/PlayingDrawable;->rect:Landroid/graphics/RectF;

    iget-object v9, p0, Lcom/vk/music/graphics/PlayingDrawable;->paint:Landroid/graphics/Paint;

    invoke-virtual {p1, v8, v9}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 220
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 222
    const/4 v8, 0x0

    cmpl-float v8, v4, v8

    if-nez v8, :cond_4

    iget-boolean v8, p0, Lcom/vk/music/graphics/PlayingDrawable;->animating:Z

    if-eqz v8, :cond_5

    .line 223
    :cond_4
    invoke-virtual {p0}, Lcom/vk/music/graphics/PlayingDrawable;->invalidateSelf()V

    .line 225
    :cond_5
    return-void
.end method

.method public getOpacity()I
    .locals 1

    .prologue
    .line 239
    const/4 v0, -0x1

    return v0
.end method

.method public isStateful()Z
    .locals 1

    .prologue
    .line 244
    const/4 v0, 0x1

    return v0
.end method

.method protected onStateChange([I)Z
    .locals 7
    .param p1, "state"    # [I

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 249
    iget-boolean v0, p0, Lcom/vk/music/graphics/PlayingDrawable;->animating:Z

    .line 250
    .local v0, "oldValue":Z
    iput-boolean v3, p0, Lcom/vk/music/graphics/PlayingDrawable;->animating:Z

    .line 251
    array-length v5, p1

    move v4, v3

    :goto_0
    if-ge v4, v5, :cond_0

    aget v1, p1, v4

    .line 252
    .local v1, "s":I
    const v6, 0x10102fe

    if-ne v1, v6, :cond_1

    .line 253
    iput-boolean v2, p0, Lcom/vk/music/graphics/PlayingDrawable;->animating:Z

    .line 258
    .end local v1    # "s":I
    :cond_0
    iget-boolean v4, p0, Lcom/vk/music/graphics/PlayingDrawable;->animating:Z

    if-ne v0, v4, :cond_2

    :goto_1
    return v2

    .line 251
    .restart local v1    # "s":I
    :cond_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .end local v1    # "s":I
    :cond_2
    move v2, v3

    .line 258
    goto :goto_1
.end method

.method public setAlpha(I)V
    .locals 1
    .param p1, "alpha"    # I

    .prologue
    .line 229
    iget-object v0, p0, Lcom/vk/music/graphics/PlayingDrawable;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 230
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 1
    .param p1, "colorFilter"    # Landroid/graphics/ColorFilter;

    .prologue
    .line 234
    iget-object v0, p0, Lcom/vk/music/graphics/PlayingDrawable;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 235
    return-void
.end method
