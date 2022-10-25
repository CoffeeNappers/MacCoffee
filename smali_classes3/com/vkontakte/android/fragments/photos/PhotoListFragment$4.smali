.class Lcom/vkontakte/android/fragments/photos/PhotoListFragment$4;
.super Ljava/lang/Object;
.source "PhotoListFragment.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnPreDrawListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private _list:Landroid/view/View;

.field private currentAnim:Landroid/animation/Animator;

.field private interpolator:Landroid/view/animation/Interpolator;

.field private lastTextAlpha:I

.field final synthetic this$0:Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

.field private visible:Z


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/photos/PhotoListFragment;)V
    .locals 1
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    .prologue
    .line 250
    iput-object p1, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$4;->this$0:Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 251
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$4;->visible:Z

    .line 252
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$4;->currentAnim:Landroid/animation/Animator;

    .line 253
    const/16 v0, 0xff

    iput v0, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$4;->lastTextAlpha:I

    .line 255
    new-instance v0, Landroid/view/animation/DecelerateInterpolator;

    invoke-direct {v0}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$4;->interpolator:Landroid/view/animation/Interpolator;

    return-void
.end method

.method static synthetic access$1802(Lcom/vkontakte/android/fragments/photos/PhotoListFragment$4;Landroid/animation/Animator;)Landroid/animation/Animator;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/photos/PhotoListFragment$4;
    .param p1, "x1"    # Landroid/animation/Animator;

    .prologue
    .line 250
    iput-object p1, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$4;->currentAnim:Landroid/animation/Animator;

    return-object p1
.end method


# virtual methods
.method public getToolbarTitleTextAlpha()I
    .locals 1

    .prologue
    .line 312
    iget v0, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$4;->lastTextAlpha:I

    return v0
.end method

.method public onPreDraw()Z
    .locals 10

    .prologue
    const/4 v9, 0x1

    const/4 v4, 0x0

    .line 259
    iget-object v3, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$4;->_list:Landroid/view/View;

    if-nez v3, :cond_0

    .line 260
    iget-object v3, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$4;->this$0:Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->access$1100(Lcom/vkontakte/android/fragments/photos/PhotoListFragment;)Lme/grishka/appkit/views/UsableRecyclerView;

    move-result-object v3

    iput-object v3, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$4;->_list:Landroid/view/View;

    .line 262
    :cond_0
    iget-object v3, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$4;->this$0:Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->access$1200(Lcom/vkontakte/android/fragments/photos/PhotoListFragment;)Lme/grishka/appkit/views/UsableRecyclerView;

    move-result-object v3

    if-nez v3, :cond_2

    .line 263
    iget-object v3, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$4;->_list:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v3

    invoke-virtual {v3, p0}, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 300
    :cond_1
    :goto_0
    return v9

    .line 266
    :cond_2
    iget-object v3, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$4;->this$0:Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->access$1300(Lcom/vkontakte/android/fragments/photos/PhotoListFragment;)Lme/grishka/appkit/views/UsableRecyclerView;

    move-result-object v3

    invoke-virtual {v3}, Lme/grishka/appkit/views/UsableRecyclerView;->getChildCount()I

    move-result v3

    if-lez v3, :cond_1

    .line 268
    iget-object v3, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$4;->this$0:Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->access$1400(Lcom/vkontakte/android/fragments/photos/PhotoListFragment;)Lme/grishka/appkit/views/UsableRecyclerView;

    move-result-object v3

    invoke-virtual {v3}, Lme/grishka/appkit/views/UsableRecyclerView;->getChildCount()I

    move-result v3

    if-lez v3, :cond_4

    iget-object v3, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$4;->this$0:Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->access$1600(Lcom/vkontakte/android/fragments/photos/PhotoListFragment;)Lme/grishka/appkit/views/UsableRecyclerView;

    move-result-object v3

    iget-object v5, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$4;->this$0:Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    invoke-static {v5}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->access$1500(Lcom/vkontakte/android/fragments/photos/PhotoListFragment;)Lme/grishka/appkit/views/UsableRecyclerView;

    move-result-object v5

    invoke-virtual {v5, v4}, Lme/grishka/appkit/views/UsableRecyclerView;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    invoke-virtual {v3, v5}, Lme/grishka/appkit/views/UsableRecyclerView;->getChildAdapterPosition(Landroid/view/View;)I

    move-result v3

    if-nez v3, :cond_4

    iget-object v3, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$4;->this$0:Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->access$1700(Lcom/vkontakte/android/fragments/photos/PhotoListFragment;)Lme/grishka/appkit/views/UsableRecyclerView;

    move-result-object v3

    invoke-virtual {v3, v4}, Lme/grishka/appkit/views/UsableRecyclerView;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/View;->getTop()I

    move-result v3

    const/high16 v5, -0x3db80000    # -50.0f

    invoke-static {v5}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v5

    if-le v3, v5, :cond_4

    .line 269
    const/4 v1, 0x0

    .line 273
    .local v1, "newVisible":Z
    :goto_1
    iget-boolean v3, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$4;->visible:Z

    if-eq v1, v3, :cond_1

    .line 274
    iput-boolean v1, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$4;->visible:Z

    .line 275
    iget-object v3, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$4;->currentAnim:Landroid/animation/Animator;

    if-eqz v3, :cond_3

    .line 276
    iget-object v3, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$4;->currentAnim:Landroid/animation/Animator;

    invoke-virtual {v3}, Landroid/animation/Animator;->cancel()V

    .line 277
    const/4 v3, 0x0

    iput-object v3, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$4;->currentAnim:Landroid/animation/Animator;

    .line 279
    :cond_3
    new-instance v2, Landroid/animation/AnimatorSet;

    invoke-direct {v2}, Landroid/animation/AnimatorSet;-><init>()V

    .line 280
    .local v2, "set":Landroid/animation/AnimatorSet;
    const-string/jumbo v5, "toolbarTitleTextAlpha"

    new-array v6, v9, [I

    iget-boolean v3, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$4;->visible:Z

    if-eqz v3, :cond_5

    const/16 v3, 0xff

    :goto_2
    aput v3, v6, v4

    invoke-static {p0, v5, v6}, Landroid/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Ljava/lang/String;[I)Landroid/animation/ObjectAnimator;

    move-result-object v0

    .line 281
    .local v0, "alpha":Landroid/animation/ObjectAnimator;
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0x15

    if-lt v3, v5, :cond_7

    .line 282
    const/4 v3, 0x2

    new-array v5, v3, [Landroid/animation/Animator;

    aput-object v0, v5, v4

    iget-object v3, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$4;->this$0:Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    .line 284
    invoke-virtual {v3}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->getToolbar()Landroid/support/v7/widget/Toolbar;

    move-result-object v6

    const-string/jumbo v7, "elevation"

    new-array v8, v9, [F

    iget-boolean v3, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$4;->visible:Z

    if-eqz v3, :cond_6

    const/high16 v3, 0x40400000    # 3.0f

    invoke-static {v3}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v3

    int-to-float v3, v3

    :goto_3
    aput v3, v8, v4

    invoke-static {v6, v7, v8}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v3

    aput-object v3, v5, v9

    .line 282
    invoke-virtual {v2, v5}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 289
    :goto_4
    const-wide/16 v4, 0xc8

    invoke-virtual {v2, v4, v5}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 290
    new-instance v3, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$4$1;

    invoke-direct {v3, p0}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$4$1;-><init>(Lcom/vkontakte/android/fragments/photos/PhotoListFragment$4;)V

    invoke-virtual {v2, v3}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 296
    iput-object v2, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$4;->currentAnim:Landroid/animation/Animator;

    .line 297
    invoke-virtual {v2}, Landroid/animation/AnimatorSet;->start()V

    goto/16 :goto_0

    .line 271
    .end local v0    # "alpha":Landroid/animation/ObjectAnimator;
    .end local v1    # "newVisible":Z
    .end local v2    # "set":Landroid/animation/AnimatorSet;
    :cond_4
    const/4 v1, 0x1

    .restart local v1    # "newVisible":Z
    goto :goto_1

    .restart local v2    # "set":Landroid/animation/AnimatorSet;
    :cond_5
    move v3, v4

    .line 280
    goto :goto_2

    .line 284
    .restart local v0    # "alpha":Landroid/animation/ObjectAnimator;
    :cond_6
    const/4 v3, 0x0

    goto :goto_3

    .line 287
    :cond_7
    new-array v3, v9, [Landroid/animation/Animator;

    aput-object v0, v3, v4

    invoke-virtual {v2, v3}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    goto :goto_4
.end method

.method public setToolbarTitleTextAlpha(I)V
    .locals 4
    .param p1, "alpha"    # I

    .prologue
    .line 304
    iget-object v1, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$4;->this$0:Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->getToolbar()Landroid/support/v7/widget/Toolbar;

    move-result-object v0

    .line 305
    .local v0, "toolbar":Landroid/support/v7/widget/Toolbar;
    if-eqz v0, :cond_0

    .line 306
    iget-object v1, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$4;->this$0:Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->getToolbar()Landroid/support/v7/widget/Toolbar;

    move-result-object v1

    shl-int/lit8 v2, p1, 0x18

    const v3, 0x6c737a

    or-int/2addr v2, v3

    invoke-virtual {v1, v2}, Landroid/support/v7/widget/Toolbar;->setTitleTextColor(I)V

    .line 308
    :cond_0
    iput p1, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$4;->lastTextAlpha:I

    .line 309
    return-void
.end method
