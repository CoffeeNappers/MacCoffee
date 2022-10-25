.class final Lcom/vk/sharing/view/TargetImageView;
.super Lcom/vk/imageloader/view/VKMultiImageView;
.source "TargetImageView.java"


# static fields
.field private static final BORDER:I

.field private static final DIALOG_SCHEME:Ljava/lang/String; = "vkchatphoto"

.field private static final MAX_IMAGES:I = 0x4

.field private static final PHOTO_PARAMETER:Ljava/lang/String; = "photo"


# instance fields
.field private imageCanvas:Landroid/graphics/Canvas;

.field private imagePaint:Landroid/graphics/Paint;

.field private imageRect:Landroid/graphics/RectF;

.field private imagesToLoad:[Ljava/lang/String;

.field private imagesToLoadCount:I

.field private selectionDrawable:Landroid/graphics/drawable/Drawable;

.field private selectionEndColor:I

.field private selectionPaint:Landroid/graphics/Paint;

.field private selectionRect:Landroid/graphics/RectF;

.field private selectionStartColor:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 41
    const/4 v0, 0x2

    invoke-static {v0}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v0

    sput v0, Lcom/vk/sharing/view/TargetImageView;->BORDER:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 65
    invoke-direct {p0, p1}, Lcom/vk/imageloader/view/VKMultiImageView;-><init>(Landroid/content/Context;)V

    .line 51
    const/4 v0, 0x4

    new-array v0, v0, [Ljava/lang/String;

    iput-object v0, p0, Lcom/vk/sharing/view/TargetImageView;->imagesToLoad:[Ljava/lang/String;

    .line 52
    const/4 v0, 0x0

    iput v0, p0, Lcom/vk/sharing/view/TargetImageView;->imagesToLoadCount:I

    .line 66
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 69
    invoke-direct {p0, p1, p2}, Lcom/vk/imageloader/view/VKMultiImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 51
    const/4 v0, 0x4

    new-array v0, v0, [Ljava/lang/String;

    iput-object v0, p0, Lcom/vk/sharing/view/TargetImageView;->imagesToLoad:[Ljava/lang/String;

    .line 52
    const/4 v0, 0x0

    iput v0, p0, Lcom/vk/sharing/view/TargetImageView;->imagesToLoadCount:I

    .line 70
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    .line 73
    invoke-direct {p0, p1, p2, p3}, Lcom/vk/imageloader/view/VKMultiImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 51
    const/4 v0, 0x4

    new-array v0, v0, [Ljava/lang/String;

    iput-object v0, p0, Lcom/vk/sharing/view/TargetImageView;->imagesToLoad:[Ljava/lang/String;

    .line 52
    const/4 v0, 0x0

    iput v0, p0, Lcom/vk/sharing/view/TargetImageView;->imagesToLoadCount:I

    .line 74
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .prologue
    .line 78
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/vk/imageloader/view/VKMultiImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 51
    const/4 v0, 0x4

    new-array v0, v0, [Ljava/lang/String;

    iput-object v0, p0, Lcom/vk/sharing/view/TargetImageView;->imagesToLoad:[Ljava/lang/String;

    .line 52
    const/4 v0, 0x0

    iput v0, p0, Lcom/vk/sharing/view/TargetImageView;->imagesToLoadCount:I

    .line 79
    return-void
.end method

.method private updateDrawableBounds()V
    .locals 13

    .prologue
    const/4 v12, 0x2

    const/4 v11, 0x1

    const/4 v10, 0x0

    .line 191
    invoke-virtual {p0}, Lcom/vk/sharing/view/TargetImageView;->getPaddingLeft()I

    move-result v4

    .line 192
    .local v4, "l":I
    invoke-virtual {p0}, Lcom/vk/sharing/view/TargetImageView;->getPaddingTop()I

    move-result v5

    .line 193
    .local v5, "t":I
    invoke-virtual {p0}, Lcom/vk/sharing/view/TargetImageView;->getWidth()I

    move-result v8

    sub-int/2addr v8, v4

    invoke-virtual {p0}, Lcom/vk/sharing/view/TargetImageView;->getPaddingRight()I

    move-result v9

    sub-int v6, v8, v9

    .line 194
    .local v6, "w":I
    invoke-virtual {p0}, Lcom/vk/sharing/view/TargetImageView;->getHeight()I

    move-result v8

    sub-int/2addr v8, v5

    invoke-virtual {p0}, Lcom/vk/sharing/view/TargetImageView;->getPaddingBottom()I

    move-result v9

    sub-int v2, v8, v9

    .line 195
    .local v2, "h":I
    div-int/lit8 v7, v6, 0x2

    .line 196
    .local v7, "w2":I
    div-int/lit8 v3, v2, 0x2

    .line 198
    .local v3, "h2":I
    const/4 v1, 0x0

    .line 199
    .local v1, "div":I
    const/4 v0, 0x0

    .line 201
    .local v0, "d2":I
    iget v8, p0, Lcom/vk/sharing/view/TargetImageView;->imagesToLoadCount:I

    packed-switch v8, :pswitch_data_0

    .line 220
    :goto_0
    return-void

    .line 203
    :pswitch_0
    iget-object v8, p0, Lcom/vk/sharing/view/TargetImageView;->draweeHolder:Lcom/facebook/drawee/view/MultiDraweeHolder;

    invoke-virtual {v8, v10}, Lcom/facebook/drawee/view/MultiDraweeHolder;->get(I)Lcom/facebook/drawee/view/DraweeHolder;

    move-result-object v8

    invoke-virtual {v8}, Lcom/facebook/drawee/view/DraweeHolder;->getTopLevelDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v8

    add-int v9, v4, v6

    add-int v10, v5, v2

    invoke-virtual {v8, v4, v5, v9, v10}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    goto :goto_0

    .line 206
    :pswitch_1
    iget-object v8, p0, Lcom/vk/sharing/view/TargetImageView;->draweeHolder:Lcom/facebook/drawee/view/MultiDraweeHolder;

    invoke-virtual {v8, v10}, Lcom/facebook/drawee/view/MultiDraweeHolder;->get(I)Lcom/facebook/drawee/view/DraweeHolder;

    move-result-object v8

    invoke-virtual {v8}, Lcom/facebook/drawee/view/DraweeHolder;->getTopLevelDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v8

    add-int v9, v4, v7

    add-int/lit8 v9, v9, 0x0

    add-int v10, v5, v2

    invoke-virtual {v8, v4, v5, v9, v10}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 207
    iget-object v8, p0, Lcom/vk/sharing/view/TargetImageView;->draweeHolder:Lcom/facebook/drawee/view/MultiDraweeHolder;

    invoke-virtual {v8, v11}, Lcom/facebook/drawee/view/MultiDraweeHolder;->get(I)Lcom/facebook/drawee/view/DraweeHolder;

    move-result-object v8

    invoke-virtual {v8}, Lcom/facebook/drawee/view/DraweeHolder;->getTopLevelDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v8

    add-int v9, v4, v7

    add-int/lit8 v9, v9, 0x0

    add-int v10, v4, v6

    add-int v11, v5, v2

    invoke-virtual {v8, v9, v5, v10, v11}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    goto :goto_0

    .line 210
    :pswitch_2
    iget-object v8, p0, Lcom/vk/sharing/view/TargetImageView;->draweeHolder:Lcom/facebook/drawee/view/MultiDraweeHolder;

    invoke-virtual {v8, v10}, Lcom/facebook/drawee/view/MultiDraweeHolder;->get(I)Lcom/facebook/drawee/view/DraweeHolder;

    move-result-object v8

    invoke-virtual {v8}, Lcom/facebook/drawee/view/DraweeHolder;->getTopLevelDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v8

    add-int v9, v4, v7

    add-int/lit8 v9, v9, 0x0

    add-int v10, v5, v2

    invoke-virtual {v8, v4, v5, v9, v10}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 211
    iget-object v8, p0, Lcom/vk/sharing/view/TargetImageView;->draweeHolder:Lcom/facebook/drawee/view/MultiDraweeHolder;

    invoke-virtual {v8, v11}, Lcom/facebook/drawee/view/MultiDraweeHolder;->get(I)Lcom/facebook/drawee/view/DraweeHolder;

    move-result-object v8

    invoke-virtual {v8}, Lcom/facebook/drawee/view/DraweeHolder;->getTopLevelDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v8

    add-int v9, v4, v7

    add-int/lit8 v9, v9, 0x0

    add-int v10, v4, v6

    add-int v11, v5, v3

    add-int/lit8 v11, v11, 0x0

    invoke-virtual {v8, v9, v5, v10, v11}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 212
    iget-object v8, p0, Lcom/vk/sharing/view/TargetImageView;->draweeHolder:Lcom/facebook/drawee/view/MultiDraweeHolder;

    invoke-virtual {v8, v12}, Lcom/facebook/drawee/view/MultiDraweeHolder;->get(I)Lcom/facebook/drawee/view/DraweeHolder;

    move-result-object v8

    invoke-virtual {v8}, Lcom/facebook/drawee/view/DraweeHolder;->getTopLevelDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v8

    add-int v9, v4, v7

    add-int/lit8 v9, v9, 0x0

    add-int v10, v5, v3

    add-int/lit8 v10, v10, 0x0

    add-int v11, v4, v6

    add-int v12, v5, v2

    invoke-virtual {v8, v9, v10, v11, v12}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    goto :goto_0

    .line 215
    :pswitch_3
    iget-object v8, p0, Lcom/vk/sharing/view/TargetImageView;->draweeHolder:Lcom/facebook/drawee/view/MultiDraweeHolder;

    invoke-virtual {v8, v10}, Lcom/facebook/drawee/view/MultiDraweeHolder;->get(I)Lcom/facebook/drawee/view/DraweeHolder;

    move-result-object v8

    invoke-virtual {v8}, Lcom/facebook/drawee/view/DraweeHolder;->getTopLevelDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v8

    add-int v9, v4, v7

    add-int/lit8 v9, v9, 0x0

    add-int v10, v5, v3

    add-int/lit8 v10, v10, 0x0

    invoke-virtual {v8, v4, v5, v9, v10}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 216
    iget-object v8, p0, Lcom/vk/sharing/view/TargetImageView;->draweeHolder:Lcom/facebook/drawee/view/MultiDraweeHolder;

    invoke-virtual {v8, v11}, Lcom/facebook/drawee/view/MultiDraweeHolder;->get(I)Lcom/facebook/drawee/view/DraweeHolder;

    move-result-object v8

    invoke-virtual {v8}, Lcom/facebook/drawee/view/DraweeHolder;->getTopLevelDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v8

    add-int v9, v5, v3

    add-int/lit8 v9, v9, 0x0

    add-int v10, v4, v7

    add-int/lit8 v10, v10, 0x0

    add-int v11, v5, v2

    invoke-virtual {v8, v4, v9, v10, v11}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 217
    iget-object v8, p0, Lcom/vk/sharing/view/TargetImageView;->draweeHolder:Lcom/facebook/drawee/view/MultiDraweeHolder;

    invoke-virtual {v8, v12}, Lcom/facebook/drawee/view/MultiDraweeHolder;->get(I)Lcom/facebook/drawee/view/DraweeHolder;

    move-result-object v8

    invoke-virtual {v8}, Lcom/facebook/drawee/view/DraweeHolder;->getTopLevelDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v8

    add-int v9, v4, v7

    add-int/lit8 v9, v9, 0x0

    add-int v10, v4, v6

    add-int v11, v5, v3

    add-int/lit8 v11, v11, 0x0

    invoke-virtual {v8, v9, v5, v10, v11}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 218
    iget-object v8, p0, Lcom/vk/sharing/view/TargetImageView;->draweeHolder:Lcom/facebook/drawee/view/MultiDraweeHolder;

    const/4 v9, 0x3

    invoke-virtual {v8, v9}, Lcom/facebook/drawee/view/MultiDraweeHolder;->get(I)Lcom/facebook/drawee/view/DraweeHolder;

    move-result-object v8

    invoke-virtual {v8}, Lcom/facebook/drawee/view/DraweeHolder;->getTopLevelDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v8

    add-int v9, v4, v7

    add-int/lit8 v9, v9, 0x0

    add-int v10, v5, v3

    add-int/lit8 v10, v10, 0x0

    add-int v11, v4, v6

    add-int v12, v5, v2

    invoke-virtual {v8, v9, v10, v11, v12}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    goto/16 :goto_0

    .line 201
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method


# virtual methods
.method protected init(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 6
    .param p1, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "attrs"    # Landroid/util/AttributeSet;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    const/4 v5, 0x0

    .line 83
    invoke-super {p0, p1, p2}, Lcom/vk/imageloader/view/VKMultiImageView;->init(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 84
    sget v3, Lcom/vk/sharing/view/TargetImageView;->BORDER:I

    mul-int/lit8 v2, v3, 0x2

    .line 85
    .local v2, "p":I
    invoke-virtual {p0, v2, v2, v2, v2}, Lcom/vk/sharing/view/TargetImageView;->setPadding(IIII)V

    .line 87
    new-instance v3, Landroid/graphics/RectF;

    invoke-direct {v3}, Landroid/graphics/RectF;-><init>()V

    iput-object v3, p0, Lcom/vk/sharing/view/TargetImageView;->imageRect:Landroid/graphics/RectF;

    .line 88
    new-instance v3, Landroid/graphics/Paint;

    const/4 v4, 0x7

    invoke-direct {v3, v4}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v3, p0, Lcom/vk/sharing/view/TargetImageView;->imagePaint:Landroid/graphics/Paint;

    .line 90
    new-instance v3, Landroid/graphics/RectF;

    invoke-direct {v3}, Landroid/graphics/RectF;-><init>()V

    iput-object v3, p0, Lcom/vk/sharing/view/TargetImageView;->selectionRect:Landroid/graphics/RectF;

    .line 92
    new-instance v3, Landroid/graphics/Paint;

    const/4 v4, 0x1

    invoke-direct {v3, v4}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v3, p0, Lcom/vk/sharing/view/TargetImageView;->selectionPaint:Landroid/graphics/Paint;

    .line 93
    iget-object v3, p0, Lcom/vk/sharing/view/TargetImageView;->selectionPaint:Landroid/graphics/Paint;

    sget v4, Lcom/vk/sharing/view/TargetImageView;->BORDER:I

    int-to-float v4, v4

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 94
    iget-object v3, p0, Lcom/vk/sharing/view/TargetImageView;->selectionPaint:Landroid/graphics/Paint;

    sget-object v4, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 96
    const v3, 0x7f0f003e

    invoke-static {p1, v3}, Landroid/support/v4/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v3

    iput v3, p0, Lcom/vk/sharing/view/TargetImageView;->selectionStartColor:I

    .line 97
    const v3, 0x7f0f003c

    invoke-static {p1, v3}, Landroid/support/v4/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v3

    iput v3, p0, Lcom/vk/sharing/view/TargetImageView;->selectionEndColor:I

    .line 98
    const v3, 0x7f0200d5

    invoke-static {p1, v3}, Landroid/support/v4/content/ContextCompat;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    iput-object v3, p0, Lcom/vk/sharing/view/TargetImageView;->selectionDrawable:Landroid/graphics/drawable/Drawable;

    .line 100
    if-eqz p2, :cond_0

    .line 101
    sget-object v3, Lcom/vkontakte/android/R$styleable;->TargetView:[I

    invoke-virtual {p1, p2, v3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 102
    .local v0, "array":Landroid/content/res/TypedArray;
    invoke-virtual {v0, v5, v5}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v3

    invoke-virtual {p0, v3}, Lcom/vk/sharing/view/TargetImageView;->setSelected(Z)V

    .line 103
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 106
    .end local v0    # "array":Landroid/content/res/TypedArray;
    :cond_0
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    const/4 v3, 0x4

    if-ge v1, v3, :cond_1

    .line 107
    invoke-virtual {p0}, Lcom/vk/sharing/view/TargetImageView;->addImage()V

    .line 108
    iget-object v3, p0, Lcom/vk/sharing/view/TargetImageView;->draweeHolder:Lcom/facebook/drawee/view/MultiDraweeHolder;

    invoke-virtual {v3, v1}, Lcom/facebook/drawee/view/MultiDraweeHolder;->get(I)Lcom/facebook/drawee/view/DraweeHolder;

    move-result-object v3

    invoke-virtual {v3}, Lcom/facebook/drawee/view/DraweeHolder;->getHierarchy()Lcom/facebook/drawee/interfaces/DraweeHierarchy;

    move-result-object v3

    check-cast v3, Lcom/facebook/drawee/generic/GenericDraweeHierarchy;

    const v4, 0x7f0203d3

    invoke-virtual {v3, v4}, Lcom/facebook/drawee/generic/GenericDraweeHierarchy;->setPlaceholderImage(I)V

    .line 106
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 110
    :cond_1
    sget-object v3, Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;->CENTER_CROP:Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;

    invoke-virtual {p0, v3}, Lcom/vk/sharing/view/TargetImageView;->setScaleType(Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;)V

    .line 111
    return-void
.end method

.method public load(Ljava/lang/String;)V
    .locals 7
    .param p1, "url"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 162
    iget-object v3, p0, Lcom/vk/sharing/view/TargetImageView;->imagesToLoad:[Ljava/lang/String;

    const/4 v4, 0x0

    invoke-static {v3, v4}, Ljava/util/Arrays;->fill([Ljava/lang/Object;Ljava/lang/Object;)V

    .line 164
    if-eqz p1, :cond_3

    .line 165
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    .line 166
    .local v2, "uri":Landroid/net/Uri;
    const-string/jumbo v3, "vkchatphoto"

    invoke-virtual {v2}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 168
    iput v5, p0, Lcom/vk/sharing/view/TargetImageView;->imagesToLoadCount:I

    .line 169
    :goto_0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "photo"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Lcom/vk/sharing/view/TargetImageView;->imagesToLoadCount:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .local v1, "imageUrl":Ljava/lang/String;
    if-eqz v1, :cond_1

    .line 170
    iget-object v3, p0, Lcom/vk/sharing/view/TargetImageView;->imagesToLoad:[Ljava/lang/String;

    iget v4, p0, Lcom/vk/sharing/view/TargetImageView;->imagesToLoadCount:I

    add-int/lit8 v5, v4, 0x1

    iput v5, p0, Lcom/vk/sharing/view/TargetImageView;->imagesToLoadCount:I

    aput-object v1, v3, v4

    goto :goto_0

    .line 173
    .end local v1    # "imageUrl":Ljava/lang/String;
    :cond_0
    iget-object v3, p0, Lcom/vk/sharing/view/TargetImageView;->imagesToLoad:[Ljava/lang/String;

    aput-object p1, v3, v5

    .line 174
    iput v6, p0, Lcom/vk/sharing/view/TargetImageView;->imagesToLoadCount:I

    .line 181
    .end local v2    # "uri":Landroid/net/Uri;
    :cond_1
    :goto_1
    invoke-virtual {p0}, Lcom/vk/sharing/view/TargetImageView;->getWidth()I

    move-result v3

    if-eqz v3, :cond_2

    invoke-virtual {p0}, Lcom/vk/sharing/view/TargetImageView;->getHeight()I

    move-result v3

    if-eqz v3, :cond_2

    .line 182
    invoke-direct {p0}, Lcom/vk/sharing/view/TargetImageView;->updateDrawableBounds()V

    .line 185
    :cond_2
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_2
    iget v3, p0, Lcom/vk/sharing/view/TargetImageView;->imagesToLoadCount:I

    if-ge v0, v3, :cond_4

    .line 186
    iget-object v3, p0, Lcom/vk/sharing/view/TargetImageView;->imagesToLoad:[Ljava/lang/String;

    aget-object v3, v3, v0

    invoke-virtual {p0, v0, v3}, Lcom/vk/sharing/view/TargetImageView;->load(ILjava/lang/String;)V

    .line 185
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 177
    .end local v0    # "i":I
    :cond_3
    invoke-virtual {p0}, Lcom/vk/sharing/view/TargetImageView;->clear()V

    .line 178
    iput v6, p0, Lcom/vk/sharing/view/TargetImageView;->imagesToLoadCount:I

    goto :goto_1

    .line 188
    .restart local v0    # "i":I
    :cond_4
    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 6
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 145
    iget-object v2, p0, Lcom/vk/sharing/view/TargetImageView;->imageCanvas:Landroid/graphics/Canvas;

    const/4 v3, 0x0

    sget-object v4, Landroid/graphics/PorterDuff$Mode;->CLEAR:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v2, v3, v4}, Landroid/graphics/Canvas;->drawColor(ILandroid/graphics/PorterDuff$Mode;)V

    .line 146
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget v2, p0, Lcom/vk/sharing/view/TargetImageView;->imagesToLoadCount:I

    if-ge v1, v2, :cond_1

    .line 147
    iget-object v2, p0, Lcom/vk/sharing/view/TargetImageView;->draweeHolder:Lcom/facebook/drawee/view/MultiDraweeHolder;

    invoke-virtual {v2, v1}, Lcom/facebook/drawee/view/MultiDraweeHolder;->get(I)Lcom/facebook/drawee/view/DraweeHolder;

    move-result-object v2

    invoke-virtual {v2}, Lcom/facebook/drawee/view/DraweeHolder;->getTopLevelDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 148
    .local v0, "drawable":Landroid/graphics/drawable/Drawable;
    if-eqz v0, :cond_0

    .line 149
    iget-object v2, p0, Lcom/vk/sharing/view/TargetImageView;->imageCanvas:Landroid/graphics/Canvas;

    invoke-virtual {v0, v2}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 146
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 153
    .end local v0    # "drawable":Landroid/graphics/drawable/Drawable;
    :cond_1
    iget-object v2, p0, Lcom/vk/sharing/view/TargetImageView;->imageRect:Landroid/graphics/RectF;

    iget-object v3, p0, Lcom/vk/sharing/view/TargetImageView;->imagePaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v2, v3}, Landroid/graphics/Canvas;->drawOval(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 155
    invoke-virtual {p0}, Lcom/vk/sharing/view/TargetImageView;->isSelected()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 156
    iget-object v2, p0, Lcom/vk/sharing/view/TargetImageView;->selectionRect:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->centerX()F

    move-result v2

    iget-object v3, p0, Lcom/vk/sharing/view/TargetImageView;->selectionRect:Landroid/graphics/RectF;

    invoke-virtual {v3}, Landroid/graphics/RectF;->centerY()F

    move-result v3

    iget-object v4, p0, Lcom/vk/sharing/view/TargetImageView;->selectionRect:Landroid/graphics/RectF;

    invoke-virtual {v4}, Landroid/graphics/RectF;->width()F

    move-result v4

    const/high16 v5, 0x40000000    # 2.0f

    div-float/2addr v4, v5

    iget-object v5, p0, Lcom/vk/sharing/view/TargetImageView;->selectionPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v2, v3, v4, v5}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 157
    iget-object v2, p0, Lcom/vk/sharing/view/TargetImageView;->selectionDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v2, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 159
    :cond_2
    return-void
.end method

.method protected onSizeChanged(IIII)V
    .locals 19
    .param p1, "w"    # I
    .param p2, "h"    # I
    .param p3, "oldw"    # I
    .param p4, "oldh"    # I

    .prologue
    .line 115
    invoke-super/range {p0 .. p4}, Lcom/vk/imageloader/view/VKMultiImageView;->onSizeChanged(IIII)V

    .line 117
    invoke-virtual/range {p0 .. p0}, Lcom/vk/sharing/view/TargetImageView;->getPaddingLeft()I

    move-result v15

    .line 118
    .local v15, "paddingLeft":I
    invoke-virtual/range {p0 .. p0}, Lcom/vk/sharing/view/TargetImageView;->getPaddingRight()I

    move-result v16

    .line 119
    .local v16, "paddingRight":I
    invoke-virtual/range {p0 .. p0}, Lcom/vk/sharing/view/TargetImageView;->getPaddingTop()I

    move-result v17

    .line 120
    .local v17, "paddingTop":I
    invoke-virtual/range {p0 .. p0}, Lcom/vk/sharing/view/TargetImageView;->getPaddingBottom()I

    move-result v14

    .line 122
    .local v14, "paddingBottom":I
    sub-int v13, p1, v16

    .line 123
    .local v13, "imageWidth":I
    sub-int v12, p2, v14

    .line 124
    .local v12, "imageHeight":I
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vk/sharing/view/TargetImageView;->imageRect:Landroid/graphics/RectF;

    int-to-float v3, v15

    move/from16 v0, v17

    int-to-float v4, v0

    int-to-float v5, v13

    int-to-float v6, v12

    invoke-virtual {v2, v3, v4, v5, v6}, Landroid/graphics/RectF;->set(FFFF)V

    .line 125
    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v13, v12, v2}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v11

    .line 126
    .local v11, "imageBitmap":Landroid/graphics/Bitmap;
    new-instance v2, Landroid/graphics/Canvas;

    invoke-direct {v2, v11}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/vk/sharing/view/TargetImageView;->imageCanvas:Landroid/graphics/Canvas;

    .line 128
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vk/sharing/view/TargetImageView;->imagePaint:Landroid/graphics/Paint;

    new-instance v3, Landroid/graphics/BitmapShader;

    sget-object v4, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    sget-object v5, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    invoke-direct {v3, v11, v4, v5}, Landroid/graphics/BitmapShader;-><init>(Landroid/graphics/Bitmap;Landroid/graphics/Shader$TileMode;Landroid/graphics/Shader$TileMode;)V

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 130
    sget v2, Lcom/vk/sharing/view/TargetImageView;->BORDER:I

    div-int/lit8 v2, v2, 0x2

    int-to-float v10, v2

    .line 131
    .local v10, "border2":F
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vk/sharing/view/TargetImageView;->selectionRect:Landroid/graphics/RectF;

    move/from16 v0, p1

    int-to-float v3, v0

    sub-float/2addr v3, v10

    move/from16 v0, p2

    int-to-float v4, v0

    sub-float/2addr v4, v10

    invoke-virtual {v2, v10, v10, v3, v4}, Landroid/graphics/RectF;->set(FFFF)V

    .line 132
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/sharing/view/TargetImageView;->selectionPaint:Landroid/graphics/Paint;

    move-object/from16 v18, v0

    new-instance v2, Landroid/graphics/LinearGradient;

    div-int/lit8 v3, p1, 0x2

    int-to-float v3, v3

    const/4 v4, 0x0

    div-int/lit8 v5, p1, 0x2

    int-to-float v5, v5

    move/from16 v0, p2

    int-to-float v6, v0

    move-object/from16 v0, p0

    iget v7, v0, Lcom/vk/sharing/view/TargetImageView;->selectionStartColor:I

    move-object/from16 v0, p0

    iget v8, v0, Lcom/vk/sharing/view/TargetImageView;->selectionEndColor:I

    sget-object v9, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    invoke-direct/range {v2 .. v9}, Landroid/graphics/LinearGradient;-><init>(FFFFIILandroid/graphics/Shader$TileMode;)V

    move-object/from16 v0, v18

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 133
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vk/sharing/view/TargetImageView;->selectionDrawable:Landroid/graphics/drawable/Drawable;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vk/sharing/view/TargetImageView;->selectionDrawable:Landroid/graphics/drawable/Drawable;

    .line 134
    invoke-virtual {v3}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v3

    sub-int v3, p1, v3

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vk/sharing/view/TargetImageView;->selectionDrawable:Landroid/graphics/drawable/Drawable;

    .line 135
    invoke-virtual {v4}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v4

    sub-int v4, p2, v4

    .line 133
    move/from16 v0, p1

    move/from16 v1, p2

    invoke-virtual {v2, v3, v4, v0, v1}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 140
    invoke-direct/range {p0 .. p0}, Lcom/vk/sharing/view/TargetImageView;->updateDrawableBounds()V

    .line 141
    return-void
.end method
