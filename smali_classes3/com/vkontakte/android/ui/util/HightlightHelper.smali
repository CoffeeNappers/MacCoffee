.class public Lcom/vkontakte/android/ui/util/HightlightHelper;
.super Ljava/lang/Object;
.source "HightlightHelper.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static highlight(Landroid/view/View;)V
    .locals 12
    .param p0, "itemView"    # Landroid/view/View;

    .prologue
    const/4 v11, 0x1

    const v10, 0x7f100082

    .line 18
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    move-result v1

    .line 19
    .local v1, "pLeft":I
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    move-result v3

    .line 20
    .local v3, "pTop":I
    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    move-result v2

    .line 21
    .local v2, "pRight":I
    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    move-result v0

    .line 22
    .local v0, "pBottom":I
    new-instance v5, Landroid/graphics/drawable/TransitionDrawable;

    const/4 v6, 0x2

    new-array v6, v6, [Landroid/graphics/drawable/Drawable;

    const/4 v7, 0x0

    new-instance v8, Landroid/graphics/drawable/ColorDrawable;

    const v9, -0xf0a04

    invoke-direct {v8, v9}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    aput-object v8, v6, v7

    new-instance v7, Landroid/graphics/drawable/ColorDrawable;

    const v8, 0x8fa9c7

    invoke-direct {v7, v8}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    aput-object v7, v6, v11

    invoke-direct {v5, v6}, Landroid/graphics/drawable/TransitionDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    .line 23
    .local v5, "td":Landroid/graphics/drawable/TransitionDrawable;
    invoke-virtual {p0, v5}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 24
    invoke-virtual {p0, v1, v3, v2, v0}, Landroid/view/View;->setPadding(IIII)V

    .line 25
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 26
    invoke-virtual {v5, v11}, Landroid/graphics/drawable/TransitionDrawable;->setCrossFadeEnabled(Z)V

    .line 27
    invoke-virtual {p0, v10}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v6

    if-eqz v6, :cond_0

    .line 28
    invoke-virtual {p0, v10}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Runnable;

    invoke-virtual {p0, v6}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 30
    :cond_0
    invoke-static {v5, p0}, Lcom/vkontakte/android/ui/util/HightlightHelper$$Lambda$1;->lambdaFactory$(Landroid/graphics/drawable/TransitionDrawable;Landroid/view/View;)Ljava/lang/Runnable;

    move-result-object v4

    .line 34
    .local v4, "r":Ljava/lang/Runnable;
    invoke-virtual {p0, v10, v4}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 35
    const-wide/16 v6, 0x7d0

    invoke-virtual {p0, v4, v6, v7}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 36
    return-void
.end method

.method static synthetic lambda$highlight$0(Landroid/graphics/drawable/TransitionDrawable;Landroid/view/View;)V
    .locals 2
    .param p0, "td"    # Landroid/graphics/drawable/TransitionDrawable;
    .param p1, "itemView"    # Landroid/view/View;

    .prologue
    .line 31
    const/16 v0, 0x190

    invoke-virtual {p0, v0}, Landroid/graphics/drawable/TransitionDrawable;->startTransition(I)V

    .line 32
    const v0, 0x7f100082

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 33
    return-void
.end method
