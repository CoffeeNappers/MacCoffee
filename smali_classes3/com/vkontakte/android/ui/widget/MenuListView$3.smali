.class Lcom/vkontakte/android/ui/widget/MenuListView$3;
.super Landroid/support/v7/widget/RecyclerView$OnScrollListener;
.source "MenuListView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/ui/widget/MenuListView;->init()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/ui/widget/MenuListView;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/ui/widget/MenuListView;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/ui/widget/MenuListView;

    .prologue
    .line 328
    iput-object p1, p0, Lcom/vkontakte/android/ui/widget/MenuListView$3;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$OnScrollListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onScrolled(Landroid/support/v7/widget/RecyclerView;II)V
    .locals 5
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;
    .param p2, "dx"    # I
    .param p3, "dy"    # I

    .prologue
    .line 332
    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView;->getLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v2

    check-cast v2, Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {v2}, Landroid/support/v7/widget/LinearLayoutManager;->findFirstVisibleItemPosition()I

    move-result v2

    if-nez v2, :cond_1

    .line 333
    iget-object v2, p0, Lcom/vkontakte/android/ui/widget/MenuListView$3;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    iget-object v2, v2, Lcom/vkontakte/android/ui/widget/MenuListView;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lme/grishka/appkit/views/UsableRecyclerView;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getTop()I

    move-result v1

    .line 334
    .local v1, "top":I
    if-ltz v1, :cond_0

    .line 335
    const/4 v0, 0x0

    .line 341
    .end local v1    # "top":I
    .local v0, "alpha":I
    :goto_0
    iget-object v2, p0, Lcom/vkontakte/android/ui/widget/MenuListView$3;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v2}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$900(Lcom/vkontakte/android/ui/widget/MenuListView;)Landroid/view/ViewGroup;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/ViewGroup;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 342
    return-void

    .line 337
    .end local v0    # "alpha":I
    .restart local v1    # "top":I
    :cond_0
    const/high16 v2, 0x3f800000    # 1.0f

    neg-int v3, v1

    int-to-float v3, v3

    const/high16 v4, 0x41a00000    # 20.0f

    invoke-static {v4}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v4

    int-to-float v4, v4

    div-float/2addr v3, v4

    invoke-static {v2, v3}, Ljava/lang/Math;->min(FF)F

    move-result v2

    const/high16 v3, 0x437f0000    # 255.0f

    mul-float/2addr v2, v3

    float-to-int v0, v2

    .restart local v0    # "alpha":I
    goto :goto_0

    .line 339
    .end local v0    # "alpha":I
    .end local v1    # "top":I
    :cond_1
    const/16 v0, 0xff

    .restart local v0    # "alpha":I
    goto :goto_0
.end method
