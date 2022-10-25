.class public Lcom/vkontakte/android/ui/drawables/DotsLoadingDrawable;
.super Landroid/graphics/drawable/Drawable;
.source "DotsLoadingDrawable.java"

# interfaces
.implements Landroid/graphics/drawable/Animatable;


# static fields
.field static final DOTS_X:[I

.field static final HEIGHT:I

.field static final RADIUS:I

.field static final TIME:I = 0x1f4

.field static final WIDTH:I


# instance fields
.field paint:Landroid/graphics/Paint;

.field started:Z


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    const/high16 v2, 0x40400000    # 3.0f

    .line 16
    invoke-static {v2}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v0

    sput v0, Lcom/vkontakte/android/ui/drawables/DotsLoadingDrawable;->RADIUS:I

    .line 17
    sget v0, Lcom/vkontakte/android/ui/drawables/DotsLoadingDrawable;->RADIUS:I

    shl-int/lit8 v0, v0, 0x1

    sput v0, Lcom/vkontakte/android/ui/drawables/DotsLoadingDrawable;->HEIGHT:I

    .line 18
    const/high16 v0, 0x41d40000    # 26.5f

    invoke-static {v0}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v0

    sput v0, Lcom/vkontakte/android/ui/drawables/DotsLoadingDrawable;->WIDTH:I

    .line 21
    const/4 v0, 0x3

    new-array v0, v0, [I

    const/4 v1, 0x0

    .line 22
    invoke-static {v2}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v2

    aput v2, v0, v1

    const/4 v1, 0x1

    const/high16 v2, 0x41500000    # 13.0f

    .line 23
    invoke-static {v2}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v2

    aput v2, v0, v1

    const/4 v1, 0x2

    const/high16 v2, 0x41b80000    # 23.0f

    .line 24
    invoke-static {v2}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v2

    aput v2, v0, v1

    sput-object v0, Lcom/vkontakte/android/ui/drawables/DotsLoadingDrawable;->DOTS_X:[I

    .line 21
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    .line 32
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 28
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/vkontakte/android/ui/drawables/DotsLoadingDrawable;->paint:Landroid/graphics/Paint;

    .line 30
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/ui/drawables/DotsLoadingDrawable;->started:Z

    .line 33
    iget-object v0, p0, Lcom/vkontakte/android/ui/drawables/DotsLoadingDrawable;->paint:Landroid/graphics/Paint;

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 34
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/drawables/DotsLoadingDrawable;->start()V

    .line 35
    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .locals 10
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const/4 v9, 0x2

    const/4 v8, 0x1

    .line 56
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/drawables/DotsLoadingDrawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v7

    .line 57
    .local v7, "bounds":Landroid/graphics/Rect;
    iget v0, v7, Landroid/graphics/Rect;->top:I

    invoke-virtual {v7}, Landroid/graphics/Rect;->height()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    add-int v3, v0, v1

    .line 58
    .local v3, "y":I
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v4

    .line 59
    .local v4, "time":J
    iget v0, v7, Landroid/graphics/Rect;->left:I

    sget-object v1, Lcom/vkontakte/android/ui/drawables/DotsLoadingDrawable;->DOTS_X:[I

    const/4 v2, 0x0

    aget v1, v1, v2

    add-int v2, v0, v1

    const/4 v6, 0x3

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v6}, Lcom/vkontakte/android/ui/drawables/DotsLoadingDrawable;->drawCircle(Landroid/graphics/Canvas;IIJI)V

    .line 60
    iget v0, v7, Landroid/graphics/Rect;->left:I

    sget-object v1, Lcom/vkontakte/android/ui/drawables/DotsLoadingDrawable;->DOTS_X:[I

    aget v1, v1, v8

    add-int v2, v0, v1

    move-object v0, p0

    move-object v1, p1

    move v6, v9

    invoke-virtual/range {v0 .. v6}, Lcom/vkontakte/android/ui/drawables/DotsLoadingDrawable;->drawCircle(Landroid/graphics/Canvas;IIJI)V

    .line 61
    iget v0, v7, Landroid/graphics/Rect;->left:I

    sget-object v1, Lcom/vkontakte/android/ui/drawables/DotsLoadingDrawable;->DOTS_X:[I

    aget v1, v1, v9

    add-int v2, v0, v1

    move-object v0, p0

    move-object v1, p1

    move v6, v8

    invoke-virtual/range {v0 .. v6}, Lcom/vkontakte/android/ui/drawables/DotsLoadingDrawable;->drawCircle(Landroid/graphics/Canvas;IIJI)V

    .line 62
    iget-boolean v0, p0, Lcom/vkontakte/android/ui/drawables/DotsLoadingDrawable;->started:Z

    if-eqz v0, :cond_0

    .line 63
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/drawables/DotsLoadingDrawable;->invalidateSelf()V

    .line 65
    :cond_0
    return-void
.end method

.method drawCircle(Landroid/graphics/Canvas;IIJI)V
    .locals 8
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "x"    # I
    .param p3, "y"    # I
    .param p4, "time"    # J
    .param p6, "which"    # I

    .prologue
    .line 68
    const/16 v1, 0x7d

    .line 69
    .local v1, "step":I
    mul-int/lit8 v3, p6, 0x7d

    int-to-long v4, v3

    add-long/2addr v4, p4

    const-wide/16 v6, 0x1f4

    rem-long/2addr v4, v6

    long-to-float v2, v4

    .line 70
    .local v2, "timeDiff":F
    const/high16 v3, 0x3f800000    # 1.0f

    const/high16 v4, 0x43fa0000    # 500.0f

    div-float v4, v2, v4

    sub-float v0, v3, v4

    .line 71
    .local v0, "percent":F
    iget-object v3, p0, Lcom/vkontakte/android/ui/drawables/DotsLoadingDrawable;->paint:Landroid/graphics/Paint;

    const/high16 v4, 0x43260000    # 166.0f

    mul-float/2addr v4, v0

    float-to-int v4, v4

    add-int/lit8 v4, v4, 0x59

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 72
    int-to-float v3, p2

    int-to-float v4, p3

    sget v5, Lcom/vkontakte/android/ui/drawables/DotsLoadingDrawable;->RADIUS:I

    int-to-float v5, v5

    iget-object v6, p0, Lcom/vkontakte/android/ui/drawables/DotsLoadingDrawable;->paint:Landroid/graphics/Paint;

    invoke-virtual {p1, v3, v4, v5, v6}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 73
    return-void
.end method

.method public getIntrinsicHeight()I
    .locals 1

    .prologue
    .line 97
    sget v0, Lcom/vkontakte/android/ui/drawables/DotsLoadingDrawable;->HEIGHT:I

    return v0
.end method

.method public getIntrinsicWidth()I
    .locals 1

    .prologue
    .line 92
    sget v0, Lcom/vkontakte/android/ui/drawables/DotsLoadingDrawable;->WIDTH:I

    return v0
.end method

.method public getOpacity()I
    .locals 1

    .prologue
    .line 87
    const/4 v0, 0x0

    return v0
.end method

.method public isRunning()Z
    .locals 1

    .prologue
    .line 51
    iget-boolean v0, p0, Lcom/vkontakte/android/ui/drawables/DotsLoadingDrawable;->started:Z

    return v0
.end method

.method public setAlpha(I)V
    .locals 0
    .param p1, "alpha"    # I

    .prologue
    .line 78
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 0
    .param p1, "cf"    # Landroid/graphics/ColorFilter;

    .prologue
    .line 83
    return-void
.end method

.method public start()V
    .locals 4

    .prologue
    .line 39
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/ui/drawables/DotsLoadingDrawable;->started:Z

    .line 40
    invoke-static {p0}, Lcom/vkontakte/android/ui/drawables/DotsLoadingDrawable$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/ui/drawables/DotsLoadingDrawable;)Ljava/lang/Runnable;

    move-result-object v0

    const-wide/16 v2, 0x0

    invoke-virtual {p0, v0, v2, v3}, Lcom/vkontakte/android/ui/drawables/DotsLoadingDrawable;->scheduleSelf(Ljava/lang/Runnable;J)V

    .line 41
    return-void
.end method

.method public stop()V
    .locals 1

    .prologue
    .line 45
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/ui/drawables/DotsLoadingDrawable;->started:Z

    .line 46
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/drawables/DotsLoadingDrawable;->invalidateSelf()V

    .line 47
    return-void
.end method
