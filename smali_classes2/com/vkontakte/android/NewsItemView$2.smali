.class final Lcom/vkontakte/android/NewsItemView$2;
.super Lcom/vkontakte/android/PhotoViewer$PhotoViewerCallbackAdapter;
.source "NewsItemView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/NewsItemView;->openPhotoList(ILandroid/view/View;Ljava/util/ArrayList;Lcom/vkontakte/android/NewsEntry;Landroid/view/View;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$container:Landroid/view/View;


# direct methods
.method constructor <init>(Landroid/view/View;)V
    .locals 0

    .prologue
    .line 115
    iput-object p1, p0, Lcom/vkontakte/android/NewsItemView$2;->val$container:Landroid/view/View;

    invoke-direct {p0}, Lcom/vkontakte/android/PhotoViewer$PhotoViewerCallbackAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public getPhotoBounds(ILandroid/graphics/Rect;Landroid/graphics/Rect;)V
    .locals 9
    .param p1, "index"    # I
    .param p2, "outRect"    # Landroid/graphics/Rect;
    .param p3, "outClip"    # Landroid/graphics/Rect;

    .prologue
    const/4 v8, 0x1

    const/4 v6, 0x0

    .line 118
    iget-object v4, p0, Lcom/vkontakte/android/NewsItemView$2;->val$container:Landroid/view/View;

    check-cast v4, Landroid/view/ViewGroup;

    invoke-virtual {v4, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    .line 119
    .local v3, "v":Landroid/view/View;
    if-nez v3, :cond_1

    .line 133
    :cond_0
    :goto_0
    return-void

    .line 122
    :cond_1
    const/4 v4, 0x2

    new-array v1, v4, [I

    fill-array-data v1, :array_0

    .line 123
    .local v1, "loc":[I
    invoke-virtual {v3, v1}, Landroid/view/View;->getLocationInWindow([I)V

    .line 124
    aget v4, v1, v6

    aget v5, v1, v8

    aget v6, v1, v6

    invoke-virtual {v3}, Landroid/view/View;->getWidth()I

    move-result v7

    add-int/2addr v6, v7

    aget v7, v1, v8

    invoke-virtual {v3}, Landroid/view/View;->getHeight()I

    move-result v8

    add-int/2addr v7, v8

    invoke-virtual {p2, v4, v5, v6, v7}, Landroid/graphics/Rect;->set(IIII)V

    .line 125
    invoke-virtual {v3}, Landroid/view/View;->getRootView()Landroid/view/View;

    move-result-object v4

    const v5, 0x7f10018a

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 126
    .local v0, "list":Landroid/view/View;
    invoke-static {v3, v0}, Lme/grishka/appkit/utils/V;->getViewOffset(Landroid/view/View;Landroid/view/View;)Landroid/graphics/Point;

    move-result-object v2

    .line 127
    .local v2, "offset":Landroid/graphics/Point;
    iget v4, v2, Landroid/graphics/Point;->y:I

    if-gez v4, :cond_2

    .line 128
    iget v4, v2, Landroid/graphics/Point;->y:I

    neg-int v4, v4

    iput v4, p3, Landroid/graphics/Rect;->top:I

    .line 130
    :cond_2
    iget v4, v2, Landroid/graphics/Point;->y:I

    invoke-virtual {v3}, Landroid/view/View;->getHeight()I

    move-result v5

    add-int/2addr v4, v5

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v5

    if-le v4, v5, :cond_0

    .line 131
    iget v4, v2, Landroid/graphics/Point;->y:I

    invoke-virtual {v3}, Landroid/view/View;->getHeight()I

    move-result v5

    add-int/2addr v4, v5

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v5

    sub-int/2addr v4, v5

    iput v4, p3, Landroid/graphics/Rect;->bottom:I

    goto :goto_0

    .line 122
    nop

    :array_0
    .array-data 4
        0x0
        0x0
    .end array-data
.end method

.method public onDismissed()V
    .locals 3

    .prologue
    .line 137
    iget-object v0, p0, Lcom/vkontakte/android/NewsItemView$2;->val$container:Landroid/view/View;

    const v1, 0x7f100067

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 138
    return-void
.end method
