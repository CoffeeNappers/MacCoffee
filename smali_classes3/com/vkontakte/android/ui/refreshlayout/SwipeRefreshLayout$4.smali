.class Lcom/vkontakte/android/ui/refreshlayout/SwipeRefreshLayout$4;
.super Landroid/view/animation/Animation;
.source "SwipeRefreshLayout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/ui/refreshlayout/SwipeRefreshLayout;->startAlphaAnimation(II)Landroid/view/animation/Animation;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/ui/refreshlayout/SwipeRefreshLayout;

.field final synthetic val$endingAlpha:I

.field final synthetic val$startingAlpha:I


# direct methods
.method constructor <init>(Lcom/vkontakte/android/ui/refreshlayout/SwipeRefreshLayout;II)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/ui/refreshlayout/SwipeRefreshLayout;

    .prologue
    .line 465
    iput-object p1, p0, Lcom/vkontakte/android/ui/refreshlayout/SwipeRefreshLayout$4;->this$0:Lcom/vkontakte/android/ui/refreshlayout/SwipeRefreshLayout;

    iput p2, p0, Lcom/vkontakte/android/ui/refreshlayout/SwipeRefreshLayout$4;->val$startingAlpha:I

    iput p3, p0, Lcom/vkontakte/android/ui/refreshlayout/SwipeRefreshLayout$4;->val$endingAlpha:I

    invoke-direct {p0}, Landroid/view/animation/Animation;-><init>()V

    return-void
.end method


# virtual methods
.method public applyTransformation(FLandroid/view/animation/Transformation;)V
    .locals 4
    .param p1, "interpolatedTime"    # F
    .param p2, "t"    # Landroid/view/animation/Transformation;

    .prologue
    .line 468
    iget-object v0, p0, Lcom/vkontakte/android/ui/refreshlayout/SwipeRefreshLayout$4;->this$0:Lcom/vkontakte/android/ui/refreshlayout/SwipeRefreshLayout;

    invoke-static {v0}, Lcom/vkontakte/android/ui/refreshlayout/SwipeRefreshLayout;->access$100(Lcom/vkontakte/android/ui/refreshlayout/SwipeRefreshLayout;)Lcom/vkontakte/android/ui/refreshlayout/MaterialProgressDrawable;

    move-result-object v0

    iget v1, p0, Lcom/vkontakte/android/ui/refreshlayout/SwipeRefreshLayout$4;->val$startingAlpha:I

    int-to-float v1, v1

    iget v2, p0, Lcom/vkontakte/android/ui/refreshlayout/SwipeRefreshLayout$4;->val$endingAlpha:I

    iget v3, p0, Lcom/vkontakte/android/ui/refreshlayout/SwipeRefreshLayout$4;->val$startingAlpha:I

    sub-int/2addr v2, v3

    int-to-float v2, v2

    mul-float/2addr v2, p1

    add-float/2addr v1, v2

    float-to-int v1, v1

    .line 469
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/refreshlayout/MaterialProgressDrawable;->setAlpha(I)V

    .line 471
    return-void
.end method
