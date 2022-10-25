.class public Lcom/vk/core/util/AndroidBug5497Workaround;
.super Ljava/lang/Object;
.source "AndroidBug5497Workaround.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# instance fields
.field private frameLayoutParams:Landroid/widget/FrameLayout$LayoutParams;

.field private mChildOfContent:Landroid/view/View;

.field private usableHeightPrevious:I


# direct methods
.method private constructor <init>(Landroid/widget/FrameLayout;)V
    .locals 1
    .param p1, "content"    # Landroid/widget/FrameLayout;

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    iput-object p1, p0, Lcom/vk/core/util/AndroidBug5497Workaround;->mChildOfContent:Landroid/view/View;

    .line 31
    iget-object v0, p0, Lcom/vk/core/util/AndroidBug5497Workaround;->mChildOfContent:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 32
    iget-object v0, p0, Lcom/vk/core/util/AndroidBug5497Workaround;->mChildOfContent:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    iput-object v0, p0, Lcom/vk/core/util/AndroidBug5497Workaround;->frameLayoutParams:Landroid/widget/FrameLayout$LayoutParams;

    .line 33
    return-void
.end method

.method public static assist(Landroid/app/Activity;)Lcom/vk/core/util/AndroidBug5497Workaround;
    .locals 3
    .param p0, "activity"    # Landroid/app/Activity;

    .prologue
    .line 16
    new-instance v1, Lcom/vk/core/util/AndroidBug5497Workaround;

    const v0, 0x1020002

    .line 17
    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    invoke-direct {v1, v0}, Lcom/vk/core/util/AndroidBug5497Workaround;-><init>(Landroid/widget/FrameLayout;)V

    return-object v1
.end method

.method public static assist(Landroid/widget/FrameLayout;)Lcom/vk/core/util/AndroidBug5497Workaround;
    .locals 1
    .param p0, "parentLayout"    # Landroid/widget/FrameLayout;

    .prologue
    .line 22
    new-instance v0, Lcom/vk/core/util/AndroidBug5497Workaround;

    invoke-direct {v0, p0}, Lcom/vk/core/util/AndroidBug5497Workaround;-><init>(Landroid/widget/FrameLayout;)V

    return-object v0
.end method

.method private computeUsableHeight()I
    .locals 3

    .prologue
    .line 45
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 46
    .local v0, "r":Landroid/graphics/Rect;
    iget-object v1, p0, Lcom/vk/core/util/AndroidBug5497Workaround;->mChildOfContent:Landroid/view/View;

    invoke-virtual {v1, v0}, Landroid/view/View;->getWindowVisibleDisplayFrame(Landroid/graphics/Rect;)V

    .line 47
    iget v1, v0, Landroid/graphics/Rect;->bottom:I

    iget v2, v0, Landroid/graphics/Rect;->top:I

    sub-int/2addr v1, v2

    return v1
.end method

.method private possiblyResizeChildOfContent()V
    .locals 2

    .prologue
    .line 36
    invoke-direct {p0}, Lcom/vk/core/util/AndroidBug5497Workaround;->computeUsableHeight()I

    move-result v0

    .line 37
    .local v0, "usableHeightNow":I
    iget v1, p0, Lcom/vk/core/util/AndroidBug5497Workaround;->usableHeightPrevious:I

    if-eq v0, v1, :cond_0

    .line 38
    iget-object v1, p0, Lcom/vk/core/util/AndroidBug5497Workaround;->frameLayoutParams:Landroid/widget/FrameLayout$LayoutParams;

    iput v0, v1, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 39
    iput v0, p0, Lcom/vk/core/util/AndroidBug5497Workaround;->usableHeightPrevious:I

    .line 40
    iget-object v1, p0, Lcom/vk/core/util/AndroidBug5497Workaround;->mChildOfContent:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->requestLayout()V

    .line 42
    :cond_0
    return-void
.end method


# virtual methods
.method public destroy()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 51
    iget-object v0, p0, Lcom/vk/core/util/AndroidBug5497Workaround;->mChildOfContent:Landroid/view/View;

    if-eqz v0, :cond_0

    .line 52
    iget-object v0, p0, Lcom/vk/core/util/AndroidBug5497Workaround;->mChildOfContent:Landroid/view/View;

    invoke-static {v0, p0}, Lcom/vk/core/util/CompatUtils;->removeOnGlobalLayoutListener(Landroid/view/View;Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 54
    :cond_0
    iput-object v1, p0, Lcom/vk/core/util/AndroidBug5497Workaround;->mChildOfContent:Landroid/view/View;

    .line 55
    iput-object v1, p0, Lcom/vk/core/util/AndroidBug5497Workaround;->frameLayoutParams:Landroid/widget/FrameLayout$LayoutParams;

    .line 56
    return-void
.end method

.method public onGlobalLayout()V
    .locals 0

    .prologue
    .line 60
    invoke-direct {p0}, Lcom/vk/core/util/AndroidBug5497Workaround;->possiblyResizeChildOfContent()V

    .line 61
    return-void
.end method
