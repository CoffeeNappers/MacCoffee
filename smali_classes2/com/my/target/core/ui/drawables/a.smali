.class public final Lcom/my/target/core/ui/drawables/a;
.super Landroid/graphics/drawable/Drawable;
.source "StarsDrawable.java"


# static fields
.field private static a:F

.field private static b:Landroid/graphics/Rect;

.field private static c:Landroid/graphics/Rect;

.field private static d:Z

.field private static e:Landroid/graphics/Bitmap;


# instance fields
.field private f:F

.field private final g:F

.field private h:F

.field private i:I

.field private j:I

.field private k:I

.field private l:I

.field private m:I

.field private n:I

.field private o:Z

.field private p:F

.field private q:F

.field private r:F


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 21
    const/4 v0, 0x0

    sput-boolean v0, Lcom/my/target/core/ui/drawables/a;->d:Z

    return-void
.end method

.method public constructor <init>(F)V
    .locals 5

    .prologue
    const/16 v4, 0x18

    const/16 v3, 0x1a

    const/16 v1, 0xd

    const/4 v2, 0x0

    .line 42
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 43
    iput p1, p0, Lcom/my/target/core/ui/drawables/a;->g:F

    .line 45
    sget-boolean v0, Lcom/my/target/core/ui/drawables/a;->d:Z

    if-nez v0, :cond_0

    .line 1070
    invoke-direct {p0}, Lcom/my/target/core/ui/drawables/a;->b()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1072
    new-instance v0, Landroid/graphics/Rect;

    const/16 v1, 0x34

    invoke-direct {v0, v3, v2, v1, v4}, Landroid/graphics/Rect;-><init>(IIII)V

    sput-object v0, Lcom/my/target/core/ui/drawables/a;->b:Landroid/graphics/Rect;

    .line 1073
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0, v2, v2, v3, v4}, Landroid/graphics/Rect;-><init>(IIII)V

    sput-object v0, Lcom/my/target/core/ui/drawables/a;->c:Landroid/graphics/Rect;

    .line 1074
    const v0, 0x3f8aaaab

    sput v0, Lcom/my/target/core/ui/drawables/a;->a:F

    .line 1083
    :goto_0
    invoke-direct {p0}, Lcom/my/target/core/ui/drawables/a;->b()Z

    move-result v0

    if-eqz v0, :cond_2

    const-string/jumbo v0, "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"

    :goto_1
    invoke-static {v0, v2}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v0

    .line 1084
    array-length v1, v0

    invoke-static {v0, v2, v1}, Landroid/graphics/BitmapFactory;->decodeByteArray([BII)Landroid/graphics/Bitmap;

    move-result-object v0

    sput-object v0, Lcom/my/target/core/ui/drawables/a;->e:Landroid/graphics/Bitmap;

    .line 1086
    const/4 v0, 0x1

    sput-boolean v0, Lcom/my/target/core/ui/drawables/a;->d:Z

    .line 48
    :cond_0
    invoke-direct {p0}, Lcom/my/target/core/ui/drawables/a;->a()V

    .line 49
    return-void

    .line 1078
    :cond_1
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0, v1, v2, v3, v1}, Landroid/graphics/Rect;-><init>(IIII)V

    sput-object v0, Lcom/my/target/core/ui/drawables/a;->b:Landroid/graphics/Rect;

    .line 1079
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0, v2, v2, v1, v1}, Landroid/graphics/Rect;-><init>(IIII)V

    sput-object v0, Lcom/my/target/core/ui/drawables/a;->c:Landroid/graphics/Rect;

    .line 1080
    const/high16 v0, 0x3f800000    # 1.0f

    sput v0, Lcom/my/target/core/ui/drawables/a;->a:F

    goto :goto_0

    .line 1083
    :cond_2
    const-string/jumbo v0, "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"

    goto :goto_1
.end method

.method private a()V
    .locals 4

    .prologue
    .line 91
    .line 1188
    iget v0, p0, Lcom/my/target/core/ui/drawables/a;->i:I

    .line 91
    iput v0, p0, Lcom/my/target/core/ui/drawables/a;->k:I

    .line 92
    iget v0, p0, Lcom/my/target/core/ui/drawables/a;->k:I

    int-to-float v0, v0

    sget v1, Lcom/my/target/core/ui/drawables/a;->a:F

    mul-float/2addr v0, v1

    float-to-int v0, v0

    iput v0, p0, Lcom/my/target/core/ui/drawables/a;->j:I

    .line 93
    iget v0, p0, Lcom/my/target/core/ui/drawables/a;->j:I

    int-to-float v0, v0

    iget v1, p0, Lcom/my/target/core/ui/drawables/a;->h:F

    add-float/2addr v0, v1

    float-to-int v0, v0

    iput v0, p0, Lcom/my/target/core/ui/drawables/a;->l:I

    .line 95
    iget v0, p0, Lcom/my/target/core/ui/drawables/a;->f:F

    float-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->floor(D)D

    move-result-wide v0

    double-to-int v0, v0

    iput v0, p0, Lcom/my/target/core/ui/drawables/a;->m:I

    .line 96
    iget v0, p0, Lcom/my/target/core/ui/drawables/a;->f:F

    float-to-double v0, v0

    iget v2, p0, Lcom/my/target/core/ui/drawables/a;->f:F

    float-to-double v2, v2

    invoke-static {v2, v3}, Ljava/lang/Math;->floor(D)D

    move-result-wide v2

    sub-double/2addr v0, v2

    double-to-float v0, v0

    iput v0, p0, Lcom/my/target/core/ui/drawables/a;->p:F

    .line 97
    iget v0, p0, Lcom/my/target/core/ui/drawables/a;->p:F

    iget v1, p0, Lcom/my/target/core/ui/drawables/a;->j:I

    int-to-float v1, v1

    mul-float/2addr v0, v1

    iput v0, p0, Lcom/my/target/core/ui/drawables/a;->q:F

    .line 98
    const/high16 v0, 0x3f800000    # 1.0f

    iget v1, p0, Lcom/my/target/core/ui/drawables/a;->p:F

    sub-float/2addr v0, v1

    iget v1, p0, Lcom/my/target/core/ui/drawables/a;->j:I

    int-to-float v1, v1

    mul-float/2addr v0, v1

    iput v0, p0, Lcom/my/target/core/ui/drawables/a;->r:F

    .line 99
    const/high16 v0, 0x40a00000    # 5.0f

    iget v1, p0, Lcom/my/target/core/ui/drawables/a;->f:F

    sub-float/2addr v0, v1

    float-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->floor(D)D

    move-result-wide v0

    double-to-int v0, v0

    iput v0, p0, Lcom/my/target/core/ui/drawables/a;->n:I

    .line 100
    iget v0, p0, Lcom/my/target/core/ui/drawables/a;->f:F

    iget v1, p0, Lcom/my/target/core/ui/drawables/a;->m:I

    int-to-float v1, v1

    sub-float/2addr v0, v1

    .line 101
    const v1, 0x3e4ccccd    # 0.2f

    cmpl-float v1, v0, v1

    if-ltz v1, :cond_1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/my/target/core/ui/drawables/a;->o:Z

    .line 107
    :cond_0
    :goto_0
    return-void

    .line 104
    :cond_1
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/my/target/core/ui/drawables/a;->o:Z

    .line 105
    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-lez v0, :cond_0

    iget v0, p0, Lcom/my/target/core/ui/drawables/a;->n:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/my/target/core/ui/drawables/a;->n:I

    goto :goto_0
.end method

.method private b()Z
    .locals 2

    .prologue
    .line 183
    iget v0, p0, Lcom/my/target/core/ui/drawables/a;->g:F

    const/high16 v1, 0x3f800000    # 1.0f

    cmpl-float v0, v0, v1

    if-lez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public final a(F)V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 53
    const/high16 v0, 0x40a00000    # 5.0f

    cmpl-float v0, p1, v0

    if-gtz v0, :cond_0

    cmpg-float v0, p1, v2

    if-gez v0, :cond_1

    .line 55
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "Rating is out of bounds: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    .line 56
    iput v2, p0, Lcom/my/target/core/ui/drawables/a;->f:F

    .line 63
    :goto_0
    invoke-direct {p0}, Lcom/my/target/core/ui/drawables/a;->a()V

    .line 64
    return-void

    .line 60
    :cond_1
    iput p1, p0, Lcom/my/target/core/ui/drawables/a;->f:F

    goto :goto_0
.end method

.method public final a(I)V
    .locals 0

    .prologue
    .line 193
    iput p1, p0, Lcom/my/target/core/ui/drawables/a;->i:I

    .line 194
    invoke-direct {p0}, Lcom/my/target/core/ui/drawables/a;->a()V

    .line 195
    return-void
.end method

.method public final b(F)V
    .locals 0

    .prologue
    .line 199
    iput p1, p0, Lcom/my/target/core/ui/drawables/a;->h:F

    .line 200
    invoke-direct {p0}, Lcom/my/target/core/ui/drawables/a;->a()V

    .line 201
    return-void
.end method

.method public final draw(Landroid/graphics/Canvas;)V
    .locals 8

    .prologue
    const/4 v7, 0x0

    const/4 v1, 0x0

    .line 112
    iget v3, p0, Lcom/my/target/core/ui/drawables/a;->n:I

    move v0, v1

    move v2, v1

    .line 115
    :goto_0
    iget v4, p0, Lcom/my/target/core/ui/drawables/a;->m:I

    if-ge v0, v4, :cond_0

    .line 117
    new-instance v4, Landroid/graphics/Rect;

    iget v5, p0, Lcom/my/target/core/ui/drawables/a;->j:I

    add-int/2addr v5, v2

    iget v6, p0, Lcom/my/target/core/ui/drawables/a;->k:I

    invoke-direct {v4, v2, v1, v5, v6}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 118
    iget v5, p0, Lcom/my/target/core/ui/drawables/a;->l:I

    add-int/2addr v2, v5

    .line 119
    sget-object v5, Lcom/my/target/core/ui/drawables/a;->e:Landroid/graphics/Bitmap;

    sget-object v6, Lcom/my/target/core/ui/drawables/a;->c:Landroid/graphics/Rect;

    invoke-virtual {p1, v5, v6, v4, v7}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 115
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 122
    :cond_0
    iget-boolean v0, p0, Lcom/my/target/core/ui/drawables/a;->o:Z

    if-eqz v0, :cond_1

    .line 124
    new-instance v0, Landroid/graphics/Rect;

    sget-object v4, Lcom/my/target/core/ui/drawables/a;->c:Landroid/graphics/Rect;

    invoke-direct {v0, v4}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    .line 125
    iget v4, v0, Landroid/graphics/Rect;->right:I

    int-to-float v4, v4

    iget v5, p0, Lcom/my/target/core/ui/drawables/a;->p:F

    mul-float/2addr v4, v5

    float-to-int v4, v4

    iput v4, v0, Landroid/graphics/Rect;->right:I

    .line 126
    new-instance v4, Landroid/graphics/Rect;

    int-to-float v5, v2

    iget v6, p0, Lcom/my/target/core/ui/drawables/a;->q:F

    add-float/2addr v5, v6

    float-to-int v5, v5

    iget v6, p0, Lcom/my/target/core/ui/drawables/a;->k:I

    invoke-direct {v4, v2, v1, v5, v6}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 127
    sget-object v5, Lcom/my/target/core/ui/drawables/a;->e:Landroid/graphics/Bitmap;

    invoke-virtual {p1, v5, v0, v4, v7}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 128
    int-to-float v0, v2

    iget v2, p0, Lcom/my/target/core/ui/drawables/a;->q:F

    add-float/2addr v0, v2

    float-to-int v0, v0

    .line 130
    new-instance v2, Landroid/graphics/Rect;

    sget-object v4, Lcom/my/target/core/ui/drawables/a;->b:Landroid/graphics/Rect;

    invoke-direct {v2, v4}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    .line 131
    iget v4, v2, Landroid/graphics/Rect;->left:I

    int-to-float v4, v4

    invoke-virtual {v2}, Landroid/graphics/Rect;->width()I

    move-result v5

    int-to-float v5, v5

    iget v6, p0, Lcom/my/target/core/ui/drawables/a;->p:F

    mul-float/2addr v5, v6

    add-float/2addr v4, v5

    float-to-int v4, v4

    iput v4, v2, Landroid/graphics/Rect;->left:I

    .line 132
    new-instance v4, Landroid/graphics/Rect;

    int-to-float v5, v0

    iget v6, p0, Lcom/my/target/core/ui/drawables/a;->r:F

    add-float/2addr v5, v6

    float-to-int v5, v5

    iget v6, p0, Lcom/my/target/core/ui/drawables/a;->k:I

    invoke-direct {v4, v0, v1, v5, v6}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 133
    sget-object v5, Lcom/my/target/core/ui/drawables/a;->e:Landroid/graphics/Bitmap;

    invoke-virtual {p1, v5, v2, v4, v7}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 134
    int-to-float v0, v0

    iget v2, p0, Lcom/my/target/core/ui/drawables/a;->r:F

    add-float/2addr v0, v2

    float-to-int v0, v0

    .line 135
    int-to-float v0, v0

    iget v2, p0, Lcom/my/target/core/ui/drawables/a;->h:F

    add-float/2addr v0, v2

    float-to-int v2, v0

    :cond_1
    move v0, v1

    .line 139
    :goto_1
    if-ge v0, v3, :cond_2

    .line 141
    new-instance v4, Landroid/graphics/Rect;

    iget v5, p0, Lcom/my/target/core/ui/drawables/a;->j:I

    add-int/2addr v5, v2

    iget v6, p0, Lcom/my/target/core/ui/drawables/a;->k:I

    invoke-direct {v4, v2, v1, v5, v6}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 142
    iget v5, p0, Lcom/my/target/core/ui/drawables/a;->l:I

    add-int/2addr v2, v5

    .line 143
    sget-object v5, Lcom/my/target/core/ui/drawables/a;->e:Landroid/graphics/Bitmap;

    sget-object v6, Lcom/my/target/core/ui/drawables/a;->b:Landroid/graphics/Rect;

    invoke-virtual {p1, v5, v6, v4, v7}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 139
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 146
    :cond_2
    return-void
.end method

.method public final getOpacity()I
    .locals 1

    .prologue
    .line 163
    const/4 v0, 0x0

    return v0
.end method

.method public final setAlpha(I)V
    .locals 0

    .prologue
    .line 152
    return-void
.end method

.method public final setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 0

    .prologue
    .line 158
    return-void
.end method
