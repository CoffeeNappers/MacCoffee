.class public Lcom/vkontakte/android/ui/CardItemDecorator;
.super Landroid/support/v7/widget/RecyclerView$ItemDecoration;
.source "CardItemDecorator.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/ui/CardItemDecorator$Provider;
    }
.end annotation


# static fields
.field public static final BACKGROUND_COLOR:I = -0x141210

.field public static final BOTTOM:I = 0x4

.field public static final FIRST_ROW:I = 0x20

.field public static final LAST_ROW:I = 0x40

.field public static final LEFT:I = 0x8

.field public static final MIDDLE:I = 0x1

.field public static final NONE:I = 0x0

.field public static final RIGHT:I = 0x10

.field public static final TOP:I = 0x2


# instance fields
.field private bgPaint:Landroid/graphics/Paint;

.field private firstCardOffset:I

.field private fullWidth:Z

.field private final mDrawable:Lcom/vkontakte/android/ui/cardview/CardDrawable;

.field private final mManager:Landroid/support/v7/widget/RecyclerView$LayoutManager;

.field private final mProvider:Lcom/vkontakte/android/ui/CardItemDecorator$Provider;

.field private marginBottom:I

.field private marginLeft:I

.field private marginRight:I

.field private marginTop:I

.field private paddingAfter:I

.field private paddingBefore:I

.field private paddingFirst:I

.field private paddingLast:I

.field private sortedChildren:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field private tmpRect:Landroid/graphics/Rect;

.field private viewComparator:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator",
            "<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/res/Resources;Lcom/vkontakte/android/ui/CardItemDecorator$Provider;Landroid/support/v7/widget/RecyclerView$LayoutManager;Z)V
    .locals 3
    .param p1, "resources"    # Landroid/content/res/Resources;
    .param p2, "provider"    # Lcom/vkontakte/android/ui/CardItemDecorator$Provider;
    .param p3, "manager"    # Landroid/support/v7/widget/RecyclerView$LayoutManager;
    .param p4, "fullWidth"    # Z

    .prologue
    const/4 v1, 0x0

    .line 66
    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$ItemDecoration;-><init>()V

    .line 42
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/ui/CardItemDecorator;->tmpRect:Landroid/graphics/Rect;

    .line 43
    iput-boolean v1, p0, Lcom/vkontakte/android/ui/CardItemDecorator;->fullWidth:Z

    .line 45
    iput v1, p0, Lcom/vkontakte/android/ui/CardItemDecorator;->firstCardOffset:I

    .line 47
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/ui/CardItemDecorator;->sortedChildren:Ljava/util/ArrayList;

    .line 48
    new-instance v0, Lcom/vkontakte/android/ui/CardItemDecorator$1;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/ui/CardItemDecorator$1;-><init>(Lcom/vkontakte/android/ui/CardItemDecorator;)V

    iput-object v0, p0, Lcom/vkontakte/android/ui/CardItemDecorator;->viewComparator:Ljava/util/Comparator;

    .line 67
    if-eqz p2, :cond_0

    .line 68
    iput-object p2, p0, Lcom/vkontakte/android/ui/CardItemDecorator;->mProvider:Lcom/vkontakte/android/ui/CardItemDecorator$Provider;

    .line 72
    iput-object p3, p0, Lcom/vkontakte/android/ui/CardItemDecorator;->mManager:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    .line 73
    new-instance v0, Lcom/vkontakte/android/ui/cardview/CardDrawable;

    const/4 v1, -0x1

    const/high16 v2, 0x40000000    # 2.0f

    invoke-static {v2}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v2

    int-to-float v2, v2

    iput-boolean p4, p0, Lcom/vkontakte/android/ui/CardItemDecorator;->fullWidth:Z

    invoke-direct {v0, p1, v1, v2, p4}, Lcom/vkontakte/android/ui/cardview/CardDrawable;-><init>(Landroid/content/res/Resources;IFZ)V

    iput-object v0, p0, Lcom/vkontakte/android/ui/CardItemDecorator;->mDrawable:Lcom/vkontakte/android/ui/cardview/CardDrawable;

    .line 74
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/ui/CardItemDecorator;->bgPaint:Landroid/graphics/Paint;

    .line 75
    iget-object v0, p0, Lcom/vkontakte/android/ui/CardItemDecorator;->bgPaint:Landroid/graphics/Paint;

    const v1, -0x141210

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 76
    return-void

    .line 70
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "provider must be not null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public constructor <init>(Landroid/support/v7/widget/RecyclerView;Lcom/vkontakte/android/ui/CardItemDecorator$Provider;Z)V
    .locals 2
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;
    .param p2, "provider"    # Lcom/vkontakte/android/ui/CardItemDecorator$Provider;
    .param p3, "fullWidth"    # Z

    .prologue
    .line 59
    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView;->getLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v1

    invoke-direct {p0, v0, p2, v1, p3}, Lcom/vkontakte/android/ui/CardItemDecorator;-><init>(Landroid/content/res/Resources;Lcom/vkontakte/android/ui/CardItemDecorator$Provider;Landroid/support/v7/widget/RecyclerView$LayoutManager;Z)V

    .line 60
    return-void
.end method

.method public constructor <init>(Landroid/support/v7/widget/RecyclerView;Z)V
    .locals 1
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;
    .param p2, "fullWidth"    # Z

    .prologue
    .line 63
    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/ui/CardItemDecorator$Provider;

    invoke-direct {p0, p1, v0, p2}, Lcom/vkontakte/android/ui/CardItemDecorator;-><init>(Landroid/support/v7/widget/RecyclerView;Lcom/vkontakte/android/ui/CardItemDecorator$Provider;Z)V

    .line 64
    return-void
.end method

.method private drawBackground(Landroid/graphics/Canvas;Landroid/graphics/Rect;II)V
    .locals 11
    .param p1, "c"    # Landroid/graphics/Canvas;
    .param p2, "bounds"    # Landroid/graphics/Rect;
    .param p3, "padBefore"    # I
    .param p4, "padAfter"    # I

    .prologue
    const/4 v1, 0x0

    const/4 v10, 0x0

    const/high16 v9, 0x40000000    # 2.0f

    .line 218
    iget v0, p2, Landroid/graphics/Rect;->bottom:I

    iget v2, p2, Landroid/graphics/Rect;->top:I

    if-ge v0, v2, :cond_0

    .line 220
    :try_start_0
    new-instance v0, Ljava/lang/Exception;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "bad bounds "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/vkontakte/android/ui/CardItemDecorator;->tmpRect:Landroid/graphics/Rect;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 221
    :catch_0
    move-exception v8

    .line 222
    .local v8, "x":Ljava/lang/Exception;
    const-string/jumbo v0, "vk"

    invoke-static {v0, v8}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 225
    .end local v8    # "x":Ljava/lang/Exception;
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/ui/CardItemDecorator;->mDrawable:Lcom/vkontakte/android/ui/cardview/CardDrawable;

    iget-object v2, p0, Lcom/vkontakte/android/ui/CardItemDecorator;->tmpRect:Landroid/graphics/Rect;

    invoke-virtual {v0, v2}, Lcom/vkontakte/android/ui/cardview/CardDrawable;->getPadding(Landroid/graphics/Rect;)Z

    .line 226
    iget-object v0, p0, Lcom/vkontakte/android/ui/CardItemDecorator;->tmpRect:Landroid/graphics/Rect;

    iget v2, v0, Landroid/graphics/Rect;->top:I

    add-int/2addr v2, p3

    iput v2, v0, Landroid/graphics/Rect;->top:I

    .line 227
    iget-object v0, p0, Lcom/vkontakte/android/ui/CardItemDecorator;->tmpRect:Landroid/graphics/Rect;

    iget v2, v0, Landroid/graphics/Rect;->bottom:I

    add-int/2addr v2, p4

    iput v2, v0, Landroid/graphics/Rect;->bottom:I

    .line 229
    iget-object v0, p0, Lcom/vkontakte/android/ui/CardItemDecorator;->tmpRect:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->left:I

    if-lez v0, :cond_1

    .line 230
    iget v0, p2, Landroid/graphics/Rect;->top:I

    iget-object v2, p0, Lcom/vkontakte/android/ui/CardItemDecorator;->tmpRect:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->top:I

    add-int/2addr v0, v2

    int-to-float v2, v0

    iget v0, p2, Landroid/graphics/Rect;->left:I

    iget-object v3, p0, Lcom/vkontakte/android/ui/CardItemDecorator;->tmpRect:Landroid/graphics/Rect;

    iget v3, v3, Landroid/graphics/Rect;->left:I

    add-int/2addr v0, v3

    int-to-float v3, v0

    iget v0, p2, Landroid/graphics/Rect;->bottom:I

    iget-object v4, p0, Lcom/vkontakte/android/ui/CardItemDecorator;->tmpRect:Landroid/graphics/Rect;

    iget v4, v4, Landroid/graphics/Rect;->bottom:I

    sub-int/2addr v0, v4

    int-to-float v4, v0

    iget-object v5, p0, Lcom/vkontakte/android/ui/CardItemDecorator;->bgPaint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 231
    iget v0, p2, Landroid/graphics/Rect;->left:I

    iget-object v2, p0, Lcom/vkontakte/android/ui/CardItemDecorator;->tmpRect:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->left:I

    add-int/2addr v0, v2

    int-to-float v3, v0

    iget v0, p2, Landroid/graphics/Rect;->top:I

    iget-object v2, p0, Lcom/vkontakte/android/ui/CardItemDecorator;->tmpRect:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->top:I

    add-int/2addr v0, v2

    invoke-static {v10, p3}, Ljava/lang/Math;->min(II)I

    move-result v2

    sub-int/2addr v0, v2

    int-to-float v4, v0

    iget v0, p2, Landroid/graphics/Rect;->left:I

    iget-object v2, p0, Lcom/vkontakte/android/ui/CardItemDecorator;->tmpRect:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->left:I

    add-int/2addr v0, v2

    invoke-static {v9}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v2

    add-int/2addr v0, v2

    int-to-float v5, v0

    iget v0, p2, Landroid/graphics/Rect;->top:I

    iget-object v2, p0, Lcom/vkontakte/android/ui/CardItemDecorator;->tmpRect:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->top:I

    add-int/2addr v0, v2

    invoke-static {v10, p3}, Ljava/lang/Math;->min(II)I

    move-result v2

    sub-int/2addr v0, v2

    invoke-static {v9}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v2

    add-int/2addr v0, v2

    int-to-float v6, v0

    iget-object v7, p0, Lcom/vkontakte/android/ui/CardItemDecorator;->bgPaint:Landroid/graphics/Paint;

    move-object v2, p1

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 232
    iget v0, p2, Landroid/graphics/Rect;->left:I

    iget-object v2, p0, Lcom/vkontakte/android/ui/CardItemDecorator;->tmpRect:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->left:I

    add-int/2addr v0, v2

    int-to-float v3, v0

    iget v0, p2, Landroid/graphics/Rect;->bottom:I

    iget-object v2, p0, Lcom/vkontakte/android/ui/CardItemDecorator;->tmpRect:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->bottom:I

    sub-int/2addr v0, v2

    invoke-static {v9}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v2

    sub-int/2addr v0, v2

    int-to-float v4, v0

    iget v0, p2, Landroid/graphics/Rect;->left:I

    iget-object v2, p0, Lcom/vkontakte/android/ui/CardItemDecorator;->tmpRect:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->left:I

    add-int/2addr v0, v2

    invoke-static {v9}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v2

    add-int/2addr v0, v2

    int-to-float v5, v0

    iget v0, p2, Landroid/graphics/Rect;->bottom:I

    iget-object v2, p0, Lcom/vkontakte/android/ui/CardItemDecorator;->tmpRect:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->bottom:I

    sub-int/2addr v0, v2

    int-to-float v6, v0

    iget-object v7, p0, Lcom/vkontakte/android/ui/CardItemDecorator;->bgPaint:Landroid/graphics/Paint;

    move-object v2, p1

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 234
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/ui/CardItemDecorator;->tmpRect:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->right:I

    if-lez v0, :cond_2

    .line 235
    iget v0, p2, Landroid/graphics/Rect;->right:I

    iget-object v2, p0, Lcom/vkontakte/android/ui/CardItemDecorator;->tmpRect:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->left:I

    sub-int/2addr v0, v2

    int-to-float v3, v0

    iget v0, p2, Landroid/graphics/Rect;->top:I

    iget-object v2, p0, Lcom/vkontakte/android/ui/CardItemDecorator;->tmpRect:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->top:I

    add-int/2addr v0, v2

    int-to-float v4, v0

    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    move-result v0

    int-to-float v5, v0

    iget v0, p2, Landroid/graphics/Rect;->bottom:I

    iget-object v2, p0, Lcom/vkontakte/android/ui/CardItemDecorator;->tmpRect:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->bottom:I

    sub-int/2addr v0, v2

    int-to-float v6, v0

    iget-object v7, p0, Lcom/vkontakte/android/ui/CardItemDecorator;->bgPaint:Landroid/graphics/Paint;

    move-object v2, p1

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 236
    iget v0, p2, Landroid/graphics/Rect;->right:I

    iget-object v2, p0, Lcom/vkontakte/android/ui/CardItemDecorator;->tmpRect:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->right:I

    sub-int/2addr v0, v2

    invoke-static {v9}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v2

    sub-int/2addr v0, v2

    int-to-float v3, v0

    iget v0, p2, Landroid/graphics/Rect;->top:I

    iget-object v2, p0, Lcom/vkontakte/android/ui/CardItemDecorator;->tmpRect:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->top:I

    add-int/2addr v0, v2

    invoke-static {v10, p3}, Ljava/lang/Math;->min(II)I

    move-result v2

    sub-int/2addr v0, v2

    int-to-float v4, v0

    iget v0, p2, Landroid/graphics/Rect;->right:I

    iget-object v2, p0, Lcom/vkontakte/android/ui/CardItemDecorator;->tmpRect:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->right:I

    sub-int/2addr v0, v2

    int-to-float v5, v0

    iget v0, p2, Landroid/graphics/Rect;->top:I

    iget-object v2, p0, Lcom/vkontakte/android/ui/CardItemDecorator;->tmpRect:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->top:I

    add-int/2addr v0, v2

    invoke-static {v10, p3}, Ljava/lang/Math;->min(II)I

    move-result v2

    sub-int/2addr v0, v2

    invoke-static {v9}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v2

    add-int/2addr v0, v2

    int-to-float v6, v0

    iget-object v7, p0, Lcom/vkontakte/android/ui/CardItemDecorator;->bgPaint:Landroid/graphics/Paint;

    move-object v2, p1

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 237
    iget v0, p2, Landroid/graphics/Rect;->right:I

    iget-object v2, p0, Lcom/vkontakte/android/ui/CardItemDecorator;->tmpRect:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->right:I

    sub-int/2addr v0, v2

    invoke-static {v9}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v2

    sub-int/2addr v0, v2

    int-to-float v3, v0

    iget v0, p2, Landroid/graphics/Rect;->bottom:I

    iget-object v2, p0, Lcom/vkontakte/android/ui/CardItemDecorator;->tmpRect:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->bottom:I

    sub-int/2addr v0, v2

    invoke-static {v9}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v2

    sub-int/2addr v0, v2

    int-to-float v4, v0

    iget v0, p2, Landroid/graphics/Rect;->right:I

    iget-object v2, p0, Lcom/vkontakte/android/ui/CardItemDecorator;->tmpRect:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->right:I

    sub-int/2addr v0, v2

    int-to-float v5, v0

    iget v0, p2, Landroid/graphics/Rect;->bottom:I

    iget-object v2, p0, Lcom/vkontakte/android/ui/CardItemDecorator;->tmpRect:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->bottom:I

    sub-int/2addr v0, v2

    int-to-float v6, v0

    iget-object v7, p0, Lcom/vkontakte/android/ui/CardItemDecorator;->bgPaint:Landroid/graphics/Paint;

    move-object v2, p1

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 239
    :cond_2
    iget-object v0, p0, Lcom/vkontakte/android/ui/CardItemDecorator;->tmpRect:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->top:I

    if-lez v0, :cond_3

    iget v0, p2, Landroid/graphics/Rect;->top:I

    iget-object v2, p0, Lcom/vkontakte/android/ui/CardItemDecorator;->tmpRect:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->top:I

    neg-int v2, v2

    if-le v0, v2, :cond_3

    .line 240
    iget v0, p2, Landroid/graphics/Rect;->top:I

    sub-int/2addr v0, p3

    int-to-float v2, v0

    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    move-result v0

    int-to-float v3, v0

    iget v0, p2, Landroid/graphics/Rect;->top:I

    iget-object v4, p0, Lcom/vkontakte/android/ui/CardItemDecorator;->tmpRect:Landroid/graphics/Rect;

    iget v4, v4, Landroid/graphics/Rect;->top:I

    add-int/2addr v0, v4

    invoke-static {v10, p3}, Ljava/lang/Math;->min(II)I

    move-result v4

    sub-int/2addr v0, v4

    int-to-float v4, v0

    iget-object v5, p0, Lcom/vkontakte/android/ui/CardItemDecorator;->bgPaint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 242
    :cond_3
    iget-object v0, p0, Lcom/vkontakte/android/ui/CardItemDecorator;->tmpRect:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->bottom:I

    if-lez v0, :cond_4

    iget v0, p2, Landroid/graphics/Rect;->bottom:I

    invoke-virtual {p1}, Landroid/graphics/Canvas;->getHeight()I

    move-result v2

    if-ge v0, v2, :cond_4

    .line 243
    iget v0, p2, Landroid/graphics/Rect;->bottom:I

    iget-object v2, p0, Lcom/vkontakte/android/ui/CardItemDecorator;->tmpRect:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->bottom:I

    sub-int/2addr v0, v2

    int-to-float v2, v0

    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    move-result v0

    int-to-float v3, v0

    iget v0, p2, Landroid/graphics/Rect;->bottom:I

    add-int/2addr v0, p4

    int-to-float v4, v0

    iget-object v5, p0, Lcom/vkontakte/android/ui/CardItemDecorator;->bgPaint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 245
    :cond_4
    return-void
.end method

.method private getViewBottom(Landroid/view/View;)I
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 214
    iget-object v0, p0, Lcom/vkontakte/android/ui/CardItemDecorator;->mManager:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->getDecoratedBottom(Landroid/view/View;)I

    move-result v0

    invoke-virtual {p1}, Landroid/view/View;->getTranslationY()F

    move-result v1

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method private getViewTop(Landroid/view/View;)I
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 210
    iget-object v0, p0, Lcom/vkontakte/android/ui/CardItemDecorator;->mManager:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->getDecoratedTop(Landroid/view/View;)I

    move-result v0

    invoke-virtual {p1}, Landroid/view/View;->getTranslationY()F

    move-result v1

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method


# virtual methods
.method public getItemOffsets(Landroid/graphics/Rect;Landroid/view/View;Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$State;)V
    .locals 11
    .param p1, "outRect"    # Landroid/graphics/Rect;
    .param p2, "view"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/support/v7/widget/RecyclerView;
    .param p4, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .prologue
    const/4 v10, 0x4

    const/4 v9, 0x2

    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 249
    invoke-virtual {p3, p2}, Landroid/support/v7/widget/RecyclerView;->getChildAdapterPosition(Landroid/view/View;)I

    move-result v1

    .line 250
    .local v1, "pos":I
    invoke-virtual {p3}, Landroid/support/v7/widget/RecyclerView;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v4

    invoke-virtual {v4}, Landroid/support/v7/widget/RecyclerView$Adapter;->getItemCount()I

    move-result v4

    if-lt v1, v4, :cond_1

    .line 251
    invoke-virtual {p1, v7, v7, v7, v7}, Landroid/graphics/Rect;->set(IIII)V

    .line 306
    :cond_0
    :goto_0
    return-void

    .line 254
    :cond_1
    iget-object v4, p0, Lcom/vkontakte/android/ui/CardItemDecorator;->mDrawable:Lcom/vkontakte/android/ui/cardview/CardDrawable;

    invoke-virtual {v4, p1}, Lcom/vkontakte/android/ui/cardview/CardDrawable;->getPadding(Landroid/graphics/Rect;)Z

    .line 255
    iget-object v4, p0, Lcom/vkontakte/android/ui/CardItemDecorator;->mProvider:Lcom/vkontakte/android/ui/CardItemDecorator$Provider;

    invoke-interface {v4, v1}, Lcom/vkontakte/android/ui/CardItemDecorator$Provider;->getBlockType(I)I

    move-result v2

    .line 257
    .local v2, "type":I
    invoke-virtual {p3}, Landroid/support/v7/widget/RecyclerView;->getLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v0

    .line 258
    .local v0, "lm":Landroid/support/v7/widget/RecyclerView$LayoutManager;
    instance-of v4, v0, Landroid/support/v7/widget/GridLayoutManager;

    if-eqz v4, :cond_2

    move-object v4, v0

    check-cast v4, Landroid/support/v7/widget/GridLayoutManager;

    invoke-virtual {v4}, Landroid/support/v7/widget/GridLayoutManager;->getSpanCount()I

    move-result v4

    if-eq v4, v8, :cond_3

    :cond_2
    instance-of v4, v0, Landroid/support/v7/widget/LinearLayoutManager;

    if-eqz v4, :cond_5

    instance-of v4, v0, Landroid/support/v7/widget/GridLayoutManager;

    if-nez v4, :cond_5

    .line 260
    :cond_3
    if-nez v1, :cond_4

    .line 261
    or-int/lit8 v2, v2, 0x20

    .line 263
    :cond_4
    invoke-virtual {p3}, Landroid/support/v7/widget/RecyclerView;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v4

    invoke-virtual {v4}, Landroid/support/v7/widget/RecyclerView$Adapter;->getItemCount()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    if-ne v1, v4, :cond_5

    .line 264
    or-int/lit8 v2, v2, 0x40

    .line 268
    :cond_5
    iget v5, p1, Landroid/graphics/Rect;->top:I

    and-int/lit8 v4, v2, 0x20

    const/16 v6, 0x20

    if-ne v4, v6, :cond_a

    iget v4, p0, Lcom/vkontakte/android/ui/CardItemDecorator;->paddingFirst:I

    :goto_1
    add-int/2addr v4, v5

    iput v4, p1, Landroid/graphics/Rect;->top:I

    .line 269
    iget v5, p1, Landroid/graphics/Rect;->bottom:I

    and-int/lit8 v4, v2, 0x40

    const/16 v6, 0x40

    if-ne v4, v6, :cond_b

    iget v4, p0, Lcom/vkontakte/android/ui/CardItemDecorator;->paddingLast:I

    :goto_2
    add-int/2addr v4, v5

    iput v4, p1, Landroid/graphics/Rect;->bottom:I

    .line 271
    and-int/lit8 v4, v2, 0x6

    const/4 v5, 0x6

    if-ne v4, v5, :cond_c

    .line 281
    :cond_6
    :goto_3
    and-int/lit8 v4, v2, 0x2

    if-ne v4, v9, :cond_7

    .line 282
    iget v4, p1, Landroid/graphics/Rect;->top:I

    iget v5, p0, Lcom/vkontakte/android/ui/CardItemDecorator;->marginTop:I

    add-int/2addr v4, v5

    iput v4, p1, Landroid/graphics/Rect;->top:I

    .line 284
    :cond_7
    and-int/lit8 v4, v2, 0x4

    if-ne v4, v10, :cond_8

    .line 285
    iget v4, p1, Landroid/graphics/Rect;->top:I

    iget v5, p0, Lcom/vkontakte/android/ui/CardItemDecorator;->marginBottom:I

    add-int/2addr v4, v5

    iput v4, p1, Landroid/graphics/Rect;->top:I

    .line 292
    :cond_8
    const/4 v3, 0x0

    .line 293
    .local v3, "was":Z
    and-int/lit8 v4, v2, 0x8

    const/16 v5, 0x8

    if-ne v4, v5, :cond_9

    .line 294
    iput v7, p1, Landroid/graphics/Rect;->right:I

    .line 295
    iget v4, p1, Landroid/graphics/Rect;->left:I

    iget v5, p0, Lcom/vkontakte/android/ui/CardItemDecorator;->marginLeft:I

    add-int/2addr v4, v5

    iput v4, p1, Landroid/graphics/Rect;->left:I

    .line 297
    :cond_9
    and-int/lit8 v4, v2, 0x10

    const/16 v5, 0x10

    if-ne v4, v5, :cond_0

    .line 298
    iput v7, p1, Landroid/graphics/Rect;->left:I

    .line 299
    iget v4, p1, Landroid/graphics/Rect;->right:I

    iget v5, p0, Lcom/vkontakte/android/ui/CardItemDecorator;->marginRight:I

    add-int/2addr v4, v5

    iput v4, p1, Landroid/graphics/Rect;->right:I

    goto/16 :goto_0

    .line 268
    .end local v3    # "was":Z
    :cond_a
    iget v4, p0, Lcom/vkontakte/android/ui/CardItemDecorator;->paddingBefore:I

    goto :goto_1

    .line 269
    :cond_b
    iget v4, p0, Lcom/vkontakte/android/ui/CardItemDecorator;->paddingAfter:I

    goto :goto_2

    .line 273
    :cond_c
    and-int/lit8 v4, v2, 0x2

    if-ne v4, v9, :cond_d

    .line 274
    iput v7, p1, Landroid/graphics/Rect;->bottom:I

    goto :goto_3

    .line 275
    :cond_d
    and-int/lit8 v4, v2, 0x4

    if-ne v4, v10, :cond_e

    .line 276
    iput v7, p1, Landroid/graphics/Rect;->top:I

    goto :goto_3

    .line 277
    :cond_e
    and-int/lit8 v4, v2, 0x1

    if-ne v4, v8, :cond_6

    .line 278
    iput v7, p1, Landroid/graphics/Rect;->bottom:I

    iput v7, p1, Landroid/graphics/Rect;->top:I

    goto :goto_3
.end method

.method public onDraw(Landroid/graphics/Canvas;Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$State;)V
    .locals 19
    .param p1, "c"    # Landroid/graphics/Canvas;
    .param p2, "parent"    # Landroid/support/v7/widget/RecyclerView;
    .param p3, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .prologue
    .line 95
    invoke-super/range {p0 .. p3}, Landroid/support/v7/widget/RecyclerView$ItemDecoration;->onDraw(Landroid/graphics/Canvas;Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$State;)V

    .line 97
    const/high16 v16, -0x80000000

    .line 98
    .local v16, "top":I
    const/high16 v8, -0x80000000

    .line 99
    .local v8, "bottom":I
    invoke-virtual/range {p2 .. p2}, Landroid/support/v7/widget/RecyclerView;->getLeft()I

    move-result v2

    invoke-virtual/range {p2 .. p2}, Landroid/support/v7/widget/RecyclerView;->getPaddingLeft()I

    move-result v3

    add-int v13, v2, v3

    .line 100
    .local v13, "left":I
    invoke-virtual/range {p2 .. p2}, Landroid/support/v7/widget/RecyclerView;->getRight()I

    move-result v2

    invoke-virtual/range {p2 .. p2}, Landroid/support/v7/widget/RecyclerView;->getPaddingRight()I

    move-result v3

    sub-int v15, v2, v3

    .line 101
    .local v15, "right":I
    const/16 v18, 0x0

    .line 102
    .local v18, "typeTop":I
    const/4 v12, 0x0

    .line 104
    .local v12, "lastBottom":I
    const/4 v10, 0x0

    .local v10, "i":I
    :goto_0
    invoke-virtual/range {p2 .. p2}, Landroid/support/v7/widget/RecyclerView;->getChildCount()I

    move-result v2

    if-ge v10, v2, :cond_0

    .line 105
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/ui/CardItemDecorator;->sortedChildren:Ljava/util/ArrayList;

    move-object/from16 v0, p2

    invoke-virtual {v0, v10}, Landroid/support/v7/widget/RecyclerView;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 104
    add-int/lit8 v10, v10, 0x1

    goto :goto_0

    .line 107
    :cond_0
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/ui/CardItemDecorator;->sortedChildren:Ljava/util/ArrayList;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/ui/CardItemDecorator;->viewComparator:Ljava/util/Comparator;

    invoke-static {v2, v3}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 109
    const/4 v10, 0x0

    :goto_1
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/ui/CardItemDecorator;->sortedChildren:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v10, v2, :cond_3

    .line 110
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/ui/CardItemDecorator;->sortedChildren:Ljava/util/ArrayList;

    invoke-virtual {v2, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/view/View;

    .line 111
    .local v9, "child":Landroid/view/View;
    move-object/from16 v0, p2

    invoke-virtual {v0, v9}, Landroid/support/v7/widget/RecyclerView;->getChildAdapterPosition(Landroid/view/View;)I

    move-result v14

    .line 112
    .local v14, "position":I
    if-gez v14, :cond_2

    .line 109
    :cond_1
    :goto_2
    add-int/lit8 v10, v10, 0x1

    goto :goto_1

    .line 116
    :cond_2
    invoke-virtual/range {p2 .. p2}, Landroid/support/v7/widget/RecyclerView;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v2

    invoke-virtual {v2}, Landroid/support/v7/widget/RecyclerView$Adapter;->getItemCount()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    if-ne v14, v2, :cond_5

    const/4 v11, 0x1

    .line 117
    .local v11, "isLastByPosition":Z
    :goto_3
    invoke-virtual/range {p2 .. p2}, Landroid/support/v7/widget/RecyclerView;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v2

    invoke-virtual {v2}, Landroid/support/v7/widget/RecyclerView$Adapter;->getItemCount()I

    move-result v2

    if-lt v14, v2, :cond_6

    .line 118
    const/4 v3, 0x0

    move-object/from16 v0, p0

    invoke-direct {v0, v9}, Lcom/vkontakte/android/ui/CardItemDecorator;->getViewTop(Landroid/view/View;)I

    move-result v2

    int-to-float v4, v2

    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->getWidth()I

    move-result v2

    int-to-float v5, v2

    move-object/from16 v0, p0

    invoke-direct {v0, v9}, Lcom/vkontakte/android/ui/CardItemDecorator;->getViewBottom(Landroid/view/View;)I

    move-result v2

    int-to-float v6, v2

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/vkontakte/android/ui/CardItemDecorator;->bgPaint:Landroid/graphics/Paint;

    move-object/from16 v2, p1

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 203
    .end local v9    # "child":Landroid/view/View;
    .end local v11    # "isLastByPosition":Z
    .end local v14    # "position":I
    :cond_3
    invoke-virtual/range {p2 .. p2}, Landroid/support/v7/widget/RecyclerView;->getHeight()I

    move-result v2

    if-ge v12, v2, :cond_4

    .line 204
    const/4 v3, 0x0

    int-to-float v4, v12

    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->getWidth()I

    move-result v2

    int-to-float v5, v2

    invoke-virtual/range {p2 .. p2}, Landroid/support/v7/widget/RecyclerView;->getHeight()I

    move-result v2

    int-to-float v6, v2

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/vkontakte/android/ui/CardItemDecorator;->bgPaint:Landroid/graphics/Paint;

    move-object/from16 v2, p1

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 206
    :cond_4
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/ui/CardItemDecorator;->sortedChildren:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V

    .line 207
    return-void

    .line 116
    .restart local v9    # "child":Landroid/view/View;
    .restart local v14    # "position":I
    :cond_5
    const/4 v11, 0x0

    goto :goto_3

    .line 121
    .restart local v11    # "isLastByPosition":Z
    :cond_6
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/ui/CardItemDecorator;->mProvider:Lcom/vkontakte/android/ui/CardItemDecorator$Provider;

    invoke-interface {v2, v14}, Lcom/vkontakte/android/ui/CardItemDecorator$Provider;->getBlockType(I)I

    move-result v17

    .line 123
    .local v17, "type":I
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/ui/CardItemDecorator;->mManager:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    instance-of v2, v2, Landroid/support/v7/widget/GridLayoutManager;

    if-eqz v2, :cond_7

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/ui/CardItemDecorator;->mManager:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    check-cast v2, Landroid/support/v7/widget/GridLayoutManager;

    invoke-virtual {v2}, Landroid/support/v7/widget/GridLayoutManager;->getSpanCount()I

    move-result v2

    const/4 v3, 0x1

    if-eq v2, v3, :cond_8

    :cond_7
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/ui/CardItemDecorator;->mManager:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    instance-of v2, v2, Landroid/support/v7/widget/LinearLayoutManager;

    if-eqz v2, :cond_a

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/ui/CardItemDecorator;->mManager:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    instance-of v2, v2, Landroid/support/v7/widget/GridLayoutManager;

    if-nez v2, :cond_a

    .line 125
    :cond_8
    if-nez v14, :cond_9

    .line 126
    or-int/lit8 v17, v17, 0x20

    .line 128
    :cond_9
    invoke-virtual/range {p2 .. p2}, Landroid/support/v7/widget/RecyclerView;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v2

    invoke-virtual {v2}, Landroid/support/v7/widget/RecyclerView$Adapter;->getItemCount()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    if-ne v14, v2, :cond_a

    .line 129
    or-int/lit8 v17, v17, 0x40

    .line 133
    :cond_a
    and-int/lit8 v2, v17, 0x6

    const/4 v3, 0x6

    if-ne v2, v3, :cond_10

    .line 134
    move-object/from16 v0, p0

    invoke-direct {v0, v9}, Lcom/vkontakte/android/ui/CardItemDecorator;->getViewTop(Landroid/view/View;)I

    move-result v16

    .line 135
    and-int/lit8 v2, v17, 0x20

    const/16 v3, 0x20

    if-ne v2, v3, :cond_b

    .line 136
    move-object/from16 v0, p0

    iget v2, v0, Lcom/vkontakte/android/ui/CardItemDecorator;->firstCardOffset:I

    add-int v16, v16, v2

    .line 138
    :cond_b
    move-object/from16 v0, p0

    invoke-direct {v0, v9}, Lcom/vkontakte/android/ui/CardItemDecorator;->getViewBottom(Landroid/view/View;)I

    move-result v8

    move v12, v8

    .line 139
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/ui/CardItemDecorator;->mDrawable:Lcom/vkontakte/android/ui/cardview/CardDrawable;

    and-int/lit8 v2, v17, 0x20

    const/16 v4, 0x20

    if-ne v2, v4, :cond_c

    move-object/from16 v0, p0

    iget v2, v0, Lcom/vkontakte/android/ui/CardItemDecorator;->paddingFirst:I

    :goto_4
    add-int v4, v16, v2

    and-int/lit8 v2, v17, 0x40

    const/16 v5, 0x40

    if-ne v2, v5, :cond_d

    move-object/from16 v0, p0

    iget v2, v0, Lcom/vkontakte/android/ui/CardItemDecorator;->paddingLast:I

    :goto_5
    sub-int v2, v8, v2

    invoke-virtual {v3, v13, v4, v15, v2}, Lcom/vkontakte/android/ui/cardview/CardDrawable;->setBounds(IIII)V

    .line 140
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/ui/CardItemDecorator;->mDrawable:Lcom/vkontakte/android/ui/cardview/CardDrawable;

    invoke-virtual {v2}, Lcom/vkontakte/android/ui/cardview/CardDrawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v4

    and-int/lit8 v2, v17, 0x20

    const/16 v3, 0x20

    if-ne v2, v3, :cond_e

    move-object/from16 v0, p0

    iget v2, v0, Lcom/vkontakte/android/ui/CardItemDecorator;->paddingFirst:I

    move v3, v2

    :goto_6
    and-int/lit8 v2, v17, 0x40

    const/16 v5, 0x40

    if-ne v2, v5, :cond_f

    move-object/from16 v0, p0

    iget v2, v0, Lcom/vkontakte/android/ui/CardItemDecorator;->paddingLast:I

    :goto_7
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v4, v3, v2}, Lcom/vkontakte/android/ui/CardItemDecorator;->drawBackground(Landroid/graphics/Canvas;Landroid/graphics/Rect;II)V

    .line 141
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/ui/CardItemDecorator;->mDrawable:Lcom/vkontakte/android/ui/cardview/CardDrawable;

    move-object/from16 v0, p1

    invoke-virtual {v2, v0}, Lcom/vkontakte/android/ui/cardview/CardDrawable;->draw(Landroid/graphics/Canvas;)V

    .line 142
    const/high16 v16, -0x80000000

    .line 143
    const/high16 v8, -0x80000000

    .line 144
    const/16 v18, 0x0

    goto/16 :goto_2

    .line 139
    :cond_c
    move-object/from16 v0, p0

    iget v2, v0, Lcom/vkontakte/android/ui/CardItemDecorator;->paddingBefore:I

    goto :goto_4

    :cond_d
    move-object/from16 v0, p0

    iget v2, v0, Lcom/vkontakte/android/ui/CardItemDecorator;->paddingAfter:I

    goto :goto_5

    .line 140
    :cond_e
    move-object/from16 v0, p0

    iget v2, v0, Lcom/vkontakte/android/ui/CardItemDecorator;->paddingBefore:I

    move v3, v2

    goto :goto_6

    :cond_f
    move-object/from16 v0, p0

    iget v2, v0, Lcom/vkontakte/android/ui/CardItemDecorator;->paddingAfter:I

    goto :goto_7

    .line 145
    :cond_10
    and-int/lit8 v2, v17, 0x2

    const/4 v3, 0x2

    if-ne v2, v3, :cond_17

    .line 146
    move-object/from16 v0, p0

    invoke-direct {v0, v9}, Lcom/vkontakte/android/ui/CardItemDecorator;->getViewTop(Landroid/view/View;)I

    move-result v16

    .line 147
    move/from16 v18, v17

    .line 148
    and-int/lit8 v2, v18, 0x20

    const/16 v3, 0x20

    if-ne v2, v3, :cond_11

    .line 149
    move-object/from16 v0, p0

    iget v2, v0, Lcom/vkontakte/android/ui/CardItemDecorator;->firstCardOffset:I

    add-int v16, v16, v2

    .line 151
    :cond_11
    invoke-virtual/range {p2 .. p2}, Landroid/support/v7/widget/RecyclerView;->getChildCount()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    if-eq v10, v2, :cond_12

    if-eqz v11, :cond_1

    .line 152
    :cond_12
    move-object/from16 v0, p0

    invoke-direct {v0, v9}, Lcom/vkontakte/android/ui/CardItemDecorator;->getViewBottom(Landroid/view/View;)I

    move-result v2

    const/high16 v3, 0x40000000    # 2.0f

    invoke-static {v3}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v3

    add-int v8, v2, v3

    .line 153
    if-lt v8, v12, :cond_1

    .line 156
    move v12, v8

    .line 157
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/ui/CardItemDecorator;->mDrawable:Lcom/vkontakte/android/ui/cardview/CardDrawable;

    and-int/lit8 v2, v18, 0x20

    const/16 v4, 0x20

    if-ne v2, v4, :cond_13

    move-object/from16 v0, p0

    iget v2, v0, Lcom/vkontakte/android/ui/CardItemDecorator;->paddingFirst:I

    :goto_8
    add-int v4, v16, v2

    and-int/lit8 v2, v17, 0x40

    const/16 v5, 0x40

    if-ne v2, v5, :cond_14

    move-object/from16 v0, p0

    iget v2, v0, Lcom/vkontakte/android/ui/CardItemDecorator;->paddingLast:I

    :goto_9
    sub-int v2, v8, v2

    invoke-virtual {v3, v13, v4, v15, v2}, Lcom/vkontakte/android/ui/cardview/CardDrawable;->setBounds(IIII)V

    .line 158
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/ui/CardItemDecorator;->mDrawable:Lcom/vkontakte/android/ui/cardview/CardDrawable;

    invoke-virtual {v2}, Lcom/vkontakte/android/ui/cardview/CardDrawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v4

    and-int/lit8 v2, v18, 0x20

    const/16 v3, 0x20

    if-ne v2, v3, :cond_15

    move-object/from16 v0, p0

    iget v2, v0, Lcom/vkontakte/android/ui/CardItemDecorator;->paddingFirst:I

    move v3, v2

    :goto_a
    and-int/lit8 v2, v17, 0x40

    const/16 v5, 0x40

    if-ne v2, v5, :cond_16

    move-object/from16 v0, p0

    iget v2, v0, Lcom/vkontakte/android/ui/CardItemDecorator;->paddingLast:I

    :goto_b
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v4, v3, v2}, Lcom/vkontakte/android/ui/CardItemDecorator;->drawBackground(Landroid/graphics/Canvas;Landroid/graphics/Rect;II)V

    .line 159
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/ui/CardItemDecorator;->mDrawable:Lcom/vkontakte/android/ui/cardview/CardDrawable;

    move-object/from16 v0, p1

    invoke-virtual {v2, v0}, Lcom/vkontakte/android/ui/cardview/CardDrawable;->draw(Landroid/graphics/Canvas;)V

    goto/16 :goto_2

    .line 157
    :cond_13
    move-object/from16 v0, p0

    iget v2, v0, Lcom/vkontakte/android/ui/CardItemDecorator;->paddingBefore:I

    goto :goto_8

    :cond_14
    move-object/from16 v0, p0

    iget v2, v0, Lcom/vkontakte/android/ui/CardItemDecorator;->paddingAfter:I

    goto :goto_9

    .line 158
    :cond_15
    move-object/from16 v0, p0

    iget v2, v0, Lcom/vkontakte/android/ui/CardItemDecorator;->paddingBefore:I

    move v3, v2

    goto :goto_a

    :cond_16
    move-object/from16 v0, p0

    iget v2, v0, Lcom/vkontakte/android/ui/CardItemDecorator;->paddingAfter:I

    goto :goto_b

    .line 161
    :cond_17
    and-int/lit8 v2, v17, 0x1

    const/4 v3, 0x1

    if-ne v2, v3, :cond_1e

    .line 162
    const/high16 v2, -0x80000000

    move/from16 v0, v16

    if-ne v0, v2, :cond_18

    .line 163
    move-object/from16 v0, p0

    invoke-direct {v0, v9}, Lcom/vkontakte/android/ui/CardItemDecorator;->getViewTop(Landroid/view/View;)I

    move-result v2

    const/high16 v3, 0x40a00000    # 5.0f

    invoke-static {v3}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v3

    sub-int v16, v2, v3

    .line 165
    :cond_18
    invoke-virtual/range {p2 .. p2}, Landroid/support/v7/widget/RecyclerView;->getChildCount()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    if-eq v10, v2, :cond_19

    if-eqz v11, :cond_1

    .line 166
    :cond_19
    move-object/from16 v0, p0

    invoke-direct {v0, v9}, Lcom/vkontakte/android/ui/CardItemDecorator;->getViewBottom(Landroid/view/View;)I

    move-result v2

    const/high16 v3, 0x40000000    # 2.0f

    invoke-static {v3}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v3

    add-int v8, v2, v3

    .line 167
    if-lt v8, v12, :cond_1

    .line 170
    move v12, v8

    .line 171
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/ui/CardItemDecorator;->mDrawable:Lcom/vkontakte/android/ui/cardview/CardDrawable;

    and-int/lit8 v2, v18, 0x20

    const/16 v4, 0x20

    if-ne v2, v4, :cond_1a

    move-object/from16 v0, p0

    iget v2, v0, Lcom/vkontakte/android/ui/CardItemDecorator;->paddingFirst:I

    :goto_c
    add-int v4, v16, v2

    and-int/lit8 v2, v17, 0x40

    const/16 v5, 0x40

    if-ne v2, v5, :cond_1b

    move-object/from16 v0, p0

    iget v2, v0, Lcom/vkontakte/android/ui/CardItemDecorator;->paddingLast:I

    :goto_d
    sub-int v2, v8, v2

    invoke-virtual {v3, v13, v4, v15, v2}, Lcom/vkontakte/android/ui/cardview/CardDrawable;->setBounds(IIII)V

    .line 172
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/ui/CardItemDecorator;->mDrawable:Lcom/vkontakte/android/ui/cardview/CardDrawable;

    invoke-virtual {v2}, Lcom/vkontakte/android/ui/cardview/CardDrawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v4

    and-int/lit8 v2, v18, 0x20

    const/16 v3, 0x20

    if-ne v2, v3, :cond_1c

    move-object/from16 v0, p0

    iget v2, v0, Lcom/vkontakte/android/ui/CardItemDecorator;->paddingFirst:I

    move v3, v2

    :goto_e
    and-int/lit8 v2, v17, 0x40

    const/16 v5, 0x40

    if-ne v2, v5, :cond_1d

    move-object/from16 v0, p0

    iget v2, v0, Lcom/vkontakte/android/ui/CardItemDecorator;->paddingLast:I

    :goto_f
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v4, v3, v2}, Lcom/vkontakte/android/ui/CardItemDecorator;->drawBackground(Landroid/graphics/Canvas;Landroid/graphics/Rect;II)V

    .line 173
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/ui/CardItemDecorator;->mDrawable:Lcom/vkontakte/android/ui/cardview/CardDrawable;

    move-object/from16 v0, p1

    invoke-virtual {v2, v0}, Lcom/vkontakte/android/ui/cardview/CardDrawable;->draw(Landroid/graphics/Canvas;)V

    goto/16 :goto_2

    .line 171
    :cond_1a
    move-object/from16 v0, p0

    iget v2, v0, Lcom/vkontakte/android/ui/CardItemDecorator;->paddingBefore:I

    goto :goto_c

    :cond_1b
    move-object/from16 v0, p0

    iget v2, v0, Lcom/vkontakte/android/ui/CardItemDecorator;->paddingAfter:I

    goto :goto_d

    .line 172
    :cond_1c
    move-object/from16 v0, p0

    iget v2, v0, Lcom/vkontakte/android/ui/CardItemDecorator;->paddingBefore:I

    move v3, v2

    goto :goto_e

    :cond_1d
    move-object/from16 v0, p0

    iget v2, v0, Lcom/vkontakte/android/ui/CardItemDecorator;->paddingAfter:I

    goto :goto_f

    .line 175
    :cond_1e
    and-int/lit8 v2, v17, 0x4

    const/4 v3, 0x4

    if-ne v2, v3, :cond_25

    .line 176
    const/high16 v2, -0x80000000

    move/from16 v0, v16

    if-ne v0, v2, :cond_1f

    .line 177
    move-object/from16 v0, p0

    invoke-direct {v0, v9}, Lcom/vkontakte/android/ui/CardItemDecorator;->getViewTop(Landroid/view/View;)I

    move-result v16

    .line 179
    :cond_1f
    move-object/from16 v0, p0

    invoke-direct {v0, v9}, Lcom/vkontakte/android/ui/CardItemDecorator;->getViewBottom(Landroid/view/View;)I

    move-result v8

    .line 180
    if-lt v8, v12, :cond_1

    .line 183
    move v12, v8

    .line 184
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/ui/CardItemDecorator;->mDrawable:Lcom/vkontakte/android/ui/cardview/CardDrawable;

    and-int/lit8 v2, v18, 0x20

    const/16 v4, 0x20

    if-ne v2, v4, :cond_21

    move-object/from16 v0, p0

    iget v2, v0, Lcom/vkontakte/android/ui/CardItemDecorator;->paddingFirst:I

    :goto_10
    add-int v4, v16, v2

    and-int/lit8 v2, v17, 0x40

    const/16 v5, 0x40

    if-ne v2, v5, :cond_22

    move-object/from16 v0, p0

    iget v2, v0, Lcom/vkontakte/android/ui/CardItemDecorator;->paddingLast:I

    :goto_11
    sub-int v2, v8, v2

    invoke-virtual {v3, v13, v4, v15, v2}, Lcom/vkontakte/android/ui/cardview/CardDrawable;->setBounds(IIII)V

    .line 185
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/ui/CardItemDecorator;->mDrawable:Lcom/vkontakte/android/ui/cardview/CardDrawable;

    invoke-virtual {v2}, Lcom/vkontakte/android/ui/cardview/CardDrawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v2

    iget v2, v2, Landroid/graphics/Rect;->bottom:I

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/ui/CardItemDecorator;->mDrawable:Lcom/vkontakte/android/ui/cardview/CardDrawable;

    invoke-virtual {v3}, Lcom/vkontakte/android/ui/cardview/CardDrawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v3

    iget v3, v3, Landroid/graphics/Rect;->top:I

    if-le v2, v3, :cond_20

    .line 186
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/ui/CardItemDecorator;->mDrawable:Lcom/vkontakte/android/ui/cardview/CardDrawable;

    invoke-virtual {v2}, Lcom/vkontakte/android/ui/cardview/CardDrawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v4

    and-int/lit8 v2, v18, 0x20

    const/16 v3, 0x20

    if-ne v2, v3, :cond_23

    move-object/from16 v0, p0

    iget v2, v0, Lcom/vkontakte/android/ui/CardItemDecorator;->paddingFirst:I

    move v3, v2

    :goto_12
    and-int/lit8 v2, v17, 0x40

    const/16 v5, 0x40

    if-ne v2, v5, :cond_24

    move-object/from16 v0, p0

    iget v2, v0, Lcom/vkontakte/android/ui/CardItemDecorator;->paddingLast:I

    :goto_13
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v4, v3, v2}, Lcom/vkontakte/android/ui/CardItemDecorator;->drawBackground(Landroid/graphics/Canvas;Landroid/graphics/Rect;II)V

    .line 187
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/ui/CardItemDecorator;->mDrawable:Lcom/vkontakte/android/ui/cardview/CardDrawable;

    move-object/from16 v0, p1

    invoke-virtual {v2, v0}, Lcom/vkontakte/android/ui/cardview/CardDrawable;->draw(Landroid/graphics/Canvas;)V

    .line 189
    :cond_20
    const/high16 v16, -0x80000000

    .line 190
    const/high16 v8, -0x80000000

    .line 191
    const/16 v18, 0x0

    goto/16 :goto_2

    .line 184
    :cond_21
    move-object/from16 v0, p0

    iget v2, v0, Lcom/vkontakte/android/ui/CardItemDecorator;->paddingBefore:I

    goto :goto_10

    :cond_22
    move-object/from16 v0, p0

    iget v2, v0, Lcom/vkontakte/android/ui/CardItemDecorator;->paddingAfter:I

    goto :goto_11

    .line 186
    :cond_23
    move-object/from16 v0, p0

    iget v2, v0, Lcom/vkontakte/android/ui/CardItemDecorator;->paddingBefore:I

    move v3, v2

    goto :goto_12

    :cond_24
    move-object/from16 v0, p0

    iget v2, v0, Lcom/vkontakte/android/ui/CardItemDecorator;->paddingAfter:I

    goto :goto_13

    .line 192
    :cond_25
    if-nez v17, :cond_1

    .line 193
    const/4 v3, 0x0

    move-object/from16 v0, p0

    invoke-direct {v0, v9}, Lcom/vkontakte/android/ui/CardItemDecorator;->getViewTop(Landroid/view/View;)I

    move-result v2

    int-to-float v4, v2

    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->getWidth()I

    move-result v2

    int-to-float v5, v2

    move-object/from16 v0, p0

    invoke-direct {v0, v9}, Lcom/vkontakte/android/ui/CardItemDecorator;->getViewBottom(Landroid/view/View;)I

    move-result v2

    int-to-float v6, v2

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/vkontakte/android/ui/CardItemDecorator;->bgPaint:Landroid/graphics/Paint;

    move-object/from16 v2, p1

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    goto/16 :goto_2
.end method

.method public setBackgroundColor(I)V
    .locals 1
    .param p1, "color"    # I

    .prologue
    .line 79
    iget-object v0, p0, Lcom/vkontakte/android/ui/CardItemDecorator;->bgPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 80
    return-void
.end method

.method public setFirstCardOffset(I)V
    .locals 0
    .param p1, "offset"    # I

    .prologue
    .line 90
    iput p1, p0, Lcom/vkontakte/android/ui/CardItemDecorator;->firstCardOffset:I

    .line 91
    return-void
.end method

.method public setInnerMargins(IIII)V
    .locals 0
    .param p1, "left"    # I
    .param p2, "top"    # I
    .param p3, "right"    # I
    .param p4, "bottom"    # I

    .prologue
    .line 309
    iput p1, p0, Lcom/vkontakte/android/ui/CardItemDecorator;->marginLeft:I

    .line 310
    iput p3, p0, Lcom/vkontakte/android/ui/CardItemDecorator;->marginRight:I

    .line 311
    iput p2, p0, Lcom/vkontakte/android/ui/CardItemDecorator;->marginTop:I

    .line 312
    iput p4, p0, Lcom/vkontakte/android/ui/CardItemDecorator;->marginBottom:I

    .line 313
    return-void
.end method

.method public setPadding(IIII)V
    .locals 0
    .param p1, "before"    # I
    .param p2, "after"    # I
    .param p3, "first"    # I
    .param p4, "last"    # I

    .prologue
    .line 83
    iput p1, p0, Lcom/vkontakte/android/ui/CardItemDecorator;->paddingBefore:I

    .line 84
    iput p2, p0, Lcom/vkontakte/android/ui/CardItemDecorator;->paddingAfter:I

    .line 85
    iput p3, p0, Lcom/vkontakte/android/ui/CardItemDecorator;->paddingFirst:I

    .line 86
    iput p4, p0, Lcom/vkontakte/android/ui/CardItemDecorator;->paddingLast:I

    .line 87
    return-void
.end method
