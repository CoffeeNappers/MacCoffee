.class Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;
.super Ljava/lang/Object;
.source "ProfileFragment.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnPreDrawListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/ProfileFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "ParallaxPreDrawListener"
.end annotation


# instance fields
.field _list:Landroid/view/View;

.field buttonsView:Landroid/view/View;

.field coverView:Landroid/view/View;

.field interpolator:Landroid/view/animation/Interpolator;

.field interpolator2:Landroid/view/animation/Interpolator;

.field lastTextAlpha:I

.field lastToolbarAlpha:I

.field overlay:Landroid/view/View;

.field profileTitle:Landroid/widget/TextView;

.field profile_last_seen:Landroid/view/View;

.field profile_photo_icon:Landroid/view/View;

.field final synthetic this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

.field toolbarTitle:Landroid/widget/TextView;

.field visible:Z


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/ProfileFragment;)V
    .locals 3
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/ProfileFragment;

    .prologue
    const/16 v2, 0xff

    const/high16 v1, 0x40000000    # 2.0f

    .line 4529
    iput-object p1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4530
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->visible:Z

    .line 4531
    iput v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->lastTextAlpha:I

    .line 4532
    iput v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->lastToolbarAlpha:I

    .line 4536
    new-instance v0, Landroid/view/animation/AccelerateInterpolator;

    invoke-direct {v0, v1}, Landroid/view/animation/AccelerateInterpolator;-><init>(F)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->interpolator:Landroid/view/animation/Interpolator;

    .line 4537
    new-instance v0, Landroid/view/animation/DecelerateInterpolator;

    invoke-direct {v0, v1}, Landroid/view/animation/DecelerateInterpolator;-><init>(F)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->interpolator2:Landroid/view/animation/Interpolator;

    return-void
.end method


# virtual methods
.method public cleanOldView()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 4540
    iput-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->overlay:Landroid/view/View;

    .line 4541
    iput-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->buttonsView:Landroid/view/View;

    .line 4542
    iput-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->coverView:Landroid/view/View;

    .line 4543
    iput-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->toolbarTitle:Landroid/widget/TextView;

    .line 4544
    iput-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->profileTitle:Landroid/widget/TextView;

    .line 4545
    iput-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->profile_last_seen:Landroid/view/View;

    .line 4546
    iput-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->profile_photo_icon:Landroid/view/View;

    .line 4547
    return-void
.end method

.method public getToolbarAlpha()I
    .locals 1

    .prologue
    .line 4695
    iget v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->lastToolbarAlpha:I

    return v0
.end method

.method getToolbarTitle()Landroid/widget/TextView;
    .locals 2

    .prologue
    .line 4678
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->toolbarTitle:Landroid/widget/TextView;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getToolbar()Landroid/support/v7/widget/Toolbar;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 4679
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getToolbar()Landroid/support/v7/widget/Toolbar;

    move-result-object v0

    const v1, 0x7f10043b

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/Toolbar;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->toolbarTitle:Landroid/widget/TextView;

    .line 4681
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->toolbarTitle:Landroid/widget/TextView;

    return-object v0
.end method

.method public getToolbarTitleTextAlpha()I
    .locals 1

    .prologue
    .line 4708
    iget v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->lastTextAlpha:I

    return v0
.end method

.method hideToolbar()V
    .locals 2

    .prologue
    .line 4550
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getToolbar()Landroid/support/v7/widget/Toolbar;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 4551
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getToolbar()Landroid/support/v7/widget/Toolbar;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->getToolbar()Landroid/support/v7/widget/Toolbar;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v7/widget/Toolbar;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/Toolbar;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 4552
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->setToolbarAlpha(I)V

    .line 4554
    :cond_0
    return-void
.end method

.method public onPreDraw()Z
    .locals 14

    .prologue
    .line 4566
    iget-object v10, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v10}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$1600(Lcom/vkontakte/android/fragments/ProfileFragment;)I

    move-result v10

    if-eqz v10, :cond_1

    iget-object v10, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v10}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$100(Lcom/vkontakte/android/fragments/ProfileFragment;)I

    move-result v10

    if-lez v10, :cond_1

    .line 4567
    const/4 v10, 0x0

    iput-object v10, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->overlay:Landroid/view/View;

    .line 4568
    iget-boolean v10, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->visible:Z

    if-nez v10, :cond_0

    .line 4569
    const/16 v10, 0xff

    invoke-virtual {p0, v10}, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->setToolbarTitleTextAlpha(I)V

    .line 4570
    const/4 v10, 0x1

    iput-boolean v10, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->visible:Z

    .line 4571
    iget-object v10, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-virtual {v10}, Lcom/vkontakte/android/fragments/ProfileFragment;->getToolbar()Landroid/support/v7/widget/Toolbar;

    move-result-object v10

    invoke-virtual {v10}, Landroid/support/v7/widget/Toolbar;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v10

    const/16 v11, 0xff

    invoke-virtual {v10, v11}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 4572
    iget-object v10, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v10}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$9000(Lcom/vkontakte/android/fragments/ProfileFragment;)Landroid/view/View;

    move-result-object v10

    const/high16 v11, 0x3f800000    # 1.0f

    invoke-virtual {v10, v11}, Landroid/view/View;->setAlpha(F)V

    .line 4574
    :cond_0
    const/4 v10, 0x1

    .line 4674
    :goto_0
    return v10

    .line 4576
    :cond_1
    iget-object v10, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->_list:Landroid/view/View;

    if-nez v10, :cond_2

    .line 4577
    iget-object v10, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v10}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$9100(Lcom/vkontakte/android/fragments/ProfileFragment;)Lme/grishka/appkit/views/UsableRecyclerView;

    move-result-object v10

    iput-object v10, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->_list:Landroid/view/View;

    .line 4579
    :cond_2
    iget-object v10, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v10}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$9200(Lcom/vkontakte/android/fragments/ProfileFragment;)Lme/grishka/appkit/views/UsableRecyclerView;

    move-result-object v10

    if-nez v10, :cond_4

    .line 4580
    iget-object v10, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->_list:Landroid/view/View;

    if-eqz v10, :cond_3

    iget-object v10, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->_list:Landroid/view/View;

    invoke-virtual {v10}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v10

    if-eqz v10, :cond_3

    .line 4581
    iget-object v10, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->_list:Landroid/view/View;

    invoke-virtual {v10}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v10

    invoke-virtual {v10, p0}, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 4583
    :cond_3
    const/4 v10, 0x1

    goto :goto_0

    .line 4585
    :cond_4
    iget-object v10, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->overlay:Landroid/view/View;

    if-nez v10, :cond_5

    .line 4586
    iget-object v10, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v10}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$3000(Lcom/vkontakte/android/fragments/ProfileFragment;)Landroid/view/View;

    move-result-object v10

    const v11, 0x7f1004f3

    invoke-virtual {v10, v11}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v10

    iput-object v10, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->overlay:Landroid/view/View;

    .line 4588
    :cond_5
    iget-object v10, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->buttonsView:Landroid/view/View;

    if-nez v10, :cond_6

    .line 4589
    iget-object v10, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v10}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$3000(Lcom/vkontakte/android/fragments/ProfileFragment;)Landroid/view/View;

    move-result-object v10

    const v11, 0x7f1004f5

    invoke-virtual {v10, v11}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v10

    iput-object v10, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->buttonsView:Landroid/view/View;

    .line 4591
    :cond_6
    iget-object v10, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->coverView:Landroid/view/View;

    if-nez v10, :cond_7

    iget-object v10, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v10}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$100(Lcom/vkontakte/android/fragments/ProfileFragment;)I

    move-result v10

    if-gez v10, :cond_7

    .line 4592
    iget-object v10, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v10}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$3000(Lcom/vkontakte/android/fragments/ProfileFragment;)Landroid/view/View;

    move-result-object v10

    const v11, 0x7f1004f9

    invoke-virtual {v10, v11}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v10

    iput-object v10, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->coverView:Landroid/view/View;

    .line 4594
    :cond_7
    iget-object v10, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->toolbarTitle:Landroid/widget/TextView;

    if-nez v10, :cond_8

    .line 4595
    iget-object v10, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-virtual {v10}, Lcom/vkontakte/android/fragments/ProfileFragment;->getToolbar()Landroid/support/v7/widget/Toolbar;

    move-result-object v10

    const v11, 0x7f10043b

    invoke-virtual {v10, v11}, Landroid/support/v7/widget/Toolbar;->findViewById(I)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/widget/TextView;

    iput-object v10, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->toolbarTitle:Landroid/widget/TextView;

    .line 4597
    :cond_8
    iget-object v10, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->profileTitle:Landroid/widget/TextView;

    if-nez v10, :cond_9

    .line 4598
    iget-object v10, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v10}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$3000(Lcom/vkontakte/android/fragments/ProfileFragment;)Landroid/view/View;

    move-result-object v10

    const v11, 0x7f1004f4

    invoke-virtual {v10, v11}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/widget/TextView;

    iput-object v10, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->profileTitle:Landroid/widget/TextView;

    .line 4600
    :cond_9
    iget-object v10, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->profile_last_seen:Landroid/view/View;

    if-nez v10, :cond_a

    .line 4601
    iget-object v10, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v10}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$3000(Lcom/vkontakte/android/fragments/ProfileFragment;)Landroid/view/View;

    move-result-object v10

    const v11, 0x7f1004f1

    invoke-virtual {v10, v11}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v10

    iput-object v10, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->profile_last_seen:Landroid/view/View;

    .line 4603
    :cond_a
    iget-object v10, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->profile_photo_icon:Landroid/view/View;

    if-nez v10, :cond_b

    .line 4604
    iget-object v10, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v10}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$3000(Lcom/vkontakte/android/fragments/ProfileFragment;)Landroid/view/View;

    move-result-object v10

    const v11, 0x7f1004f2

    invoke-virtual {v10, v11}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v10

    iput-object v10, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->profile_photo_icon:Landroid/view/View;

    .line 4606
    :cond_b
    iget-object v10, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v10}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$9300(Lcom/vkontakte/android/fragments/ProfileFragment;)Lme/grishka/appkit/views/UsableRecyclerView;

    move-result-object v10

    invoke-virtual {v10}, Lme/grishka/appkit/views/UsableRecyclerView;->getChildCount()I

    move-result v10

    if-lez v10, :cond_1e

    .line 4608
    iget-object v10, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v10}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$100(Lcom/vkontakte/android/fragments/ProfileFragment;)I

    move-result v10

    if-lez v10, :cond_13

    iget-object v10, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->buttonsView:Landroid/view/View;

    invoke-virtual {v10}, Landroid/view/View;->getVisibility()I

    move-result v10

    if-nez v10, :cond_13

    iget-object v10, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->buttonsView:Landroid/view/View;

    invoke-virtual {v10}, Landroid/view/View;->getHeight()I

    move-result v10

    :goto_1
    iget-object v11, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-virtual {v11}, Lcom/vkontakte/android/fragments/ProfileFragment;->getToolbar()Landroid/support/v7/widget/Toolbar;

    move-result-object v11

    invoke-virtual {v11}, Landroid/support/v7/widget/Toolbar;->getHeight()I

    move-result v11

    add-int/2addr v10, v11

    iget-object v11, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v11}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$9000(Lcom/vkontakte/android/fragments/ProfileFragment;)Landroid/view/View;

    move-result-object v11

    invoke-virtual {v11}, Landroid/view/View;->getHeight()I

    move-result v11

    add-int v7, v10, v11

    .line 4609
    .local v7, "toolbarOffset":I
    iget-object v10, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->coverView:Landroid/view/View;

    if-eqz v10, :cond_15

    iget-object v10, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->coverView:Landroid/view/View;

    invoke-virtual {v10}, Landroid/view/View;->getVisibility()I

    move-result v10

    if-nez v10, :cond_15

    .line 4610
    iget-object v10, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v10}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$9500(Lcom/vkontakte/android/fragments/ProfileFragment;)Lme/grishka/appkit/views/UsableRecyclerView;

    move-result-object v10

    iget-object v11, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v11}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$9400(Lcom/vkontakte/android/fragments/ProfileFragment;)Lme/grishka/appkit/views/UsableRecyclerView;

    move-result-object v11

    const/4 v12, 0x0

    invoke-virtual {v11, v12}, Lme/grishka/appkit/views/UsableRecyclerView;->getChildAt(I)Landroid/view/View;

    move-result-object v11

    invoke-virtual {v10, v11}, Lme/grishka/appkit/views/UsableRecyclerView;->getChildAdapterPosition(Landroid/view/View;)I

    move-result v10

    if-nez v10, :cond_c

    iget-object v10, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v10}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$9600(Lcom/vkontakte/android/fragments/ProfileFragment;)Lme/grishka/appkit/views/UsableRecyclerView;

    move-result-object v10

    const/4 v11, 0x0

    invoke-virtual {v10, v11}, Lme/grishka/appkit/views/UsableRecyclerView;->getChildAt(I)Landroid/view/View;

    move-result-object v10

    invoke-virtual {v10}, Landroid/view/View;->getTop()I

    move-result v10

    iget-object v11, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->coverView:Landroid/view/View;

    invoke-virtual {v11}, Landroid/view/View;->getBottom()I

    move-result v11

    add-int/2addr v10, v11

    if-gt v10, v7, :cond_14

    :cond_c
    const/4 v3, 0x1

    .line 4614
    .local v3, "newVisible":Z
    :goto_2
    iget-boolean v10, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->visible:Z

    if-eq v3, v10, :cond_d

    .line 4615
    iput-boolean v3, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->visible:Z

    .line 4616
    iget-object v10, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-virtual {v10}, Lcom/vkontakte/android/fragments/ProfileFragment;->getToolbar()Landroid/support/v7/widget/Toolbar;

    move-result-object v10

    invoke-virtual {v10}, Landroid/support/v7/widget/Toolbar;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v11

    iget-boolean v10, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->visible:Z

    if-eqz v10, :cond_18

    const/16 v10, 0xff

    :goto_3
    invoke-virtual {v11, v10}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 4617
    iget-object v10, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v10}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$9000(Lcom/vkontakte/android/fragments/ProfileFragment;)Landroid/view/View;

    move-result-object v11

    iget-boolean v10, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->visible:Z

    if-eqz v10, :cond_19

    const/high16 v10, 0x3f800000    # 1.0f

    :goto_4
    invoke-virtual {v11, v10}, Landroid/view/View;->setAlpha(F)V

    .line 4618
    const/16 v10, 0xff

    invoke-virtual {p0, v10}, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->setToolbarTitleTextAlpha(I)V

    .line 4620
    :cond_d
    iget-object v10, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v10}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$10100(Lcom/vkontakte/android/fragments/ProfileFragment;)Lme/grishka/appkit/views/UsableRecyclerView;

    move-result-object v10

    iget-object v11, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v11}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$10000(Lcom/vkontakte/android/fragments/ProfileFragment;)Lme/grishka/appkit/views/UsableRecyclerView;

    move-result-object v11

    const/4 v12, 0x0

    invoke-virtual {v11, v12}, Lme/grishka/appkit/views/UsableRecyclerView;->getChildAt(I)Landroid/view/View;

    move-result-object v11

    invoke-virtual {v10, v11}, Lme/grishka/appkit/views/UsableRecyclerView;->getChildAdapterPosition(Landroid/view/View;)I

    move-result v10

    if-nez v10, :cond_1d

    .line 4621
    iget-object v10, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v10}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$10200(Lcom/vkontakte/android/fragments/ProfileFragment;)Lme/grishka/appkit/views/UsableRecyclerView;

    move-result-object v10

    const/4 v11, 0x0

    invoke-virtual {v10, v11}, Lme/grishka/appkit/views/UsableRecyclerView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 4622
    .local v1, "head":Landroid/view/View;
    invoke-virtual {v1}, Landroid/view/View;->getTop()I

    move-result v10

    neg-int v10, v10

    int-to-float v11, v10

    iget-object v10, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->coverView:Landroid/view/View;

    if-eqz v10, :cond_e

    iget-object v10, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->coverView:Landroid/view/View;

    .line 4623
    invoke-virtual {v10}, Landroid/view/View;->getVisibility()I

    move-result v10

    if-eqz v10, :cond_1a

    .line 4624
    :cond_e
    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    move-result v10

    :goto_5
    sub-int/2addr v10, v7

    int-to-float v10, v10

    div-float v9, v11, v10

    .line 4625
    .local v9, "visiblePart":F
    iget-object v10, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->overlay:Landroid/view/View;

    if-eqz v10, :cond_f

    .line 4626
    iget-object v10, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->overlay:Landroid/view/View;

    iget-object v11, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->interpolator:Landroid/view/animation/Interpolator;

    const/4 v12, 0x0

    invoke-static {v12, v9}, Ljava/lang/Math;->max(FF)F

    move-result v12

    invoke-interface {v11, v12}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    move-result v11

    invoke-virtual {v10, v11}, Landroid/view/View;->setAlpha(F)V

    .line 4628
    :cond_f
    iget-object v10, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->toolbarTitle:Landroid/widget/TextView;

    if-eqz v10, :cond_12

    iget-object v10, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->profileTitle:Landroid/widget/TextView;

    if-eqz v10, :cond_12

    iget-object v10, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->overlay:Landroid/view/View;

    if-eqz v10, :cond_12

    .line 4629
    iget-object v10, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v10}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$100(Lcom/vkontakte/android/fragments/ProfileFragment;)I

    move-result v10

    if-lez v10, :cond_1c

    .line 4630
    invoke-static {}, Lcom/vkontakte/android/ViewUtils;->getStatusBarHeight()I

    move-result v10

    iget-object v11, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->toolbarTitle:Landroid/widget/TextView;

    invoke-virtual {v11}, Landroid/widget/TextView;->getBottom()I

    move-result v11

    add-int v8, v10, v11

    .line 4631
    .local v8, "toolbarTitleBottom":I
    iget-object v10, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->interpolator2:Landroid/view/animation/Interpolator;

    const/high16 v11, 0x3f800000    # 1.0f

    sub-float/2addr v11, v9

    invoke-interface {v10, v11}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    move-result v4

    .line 4633
    .local v4, "percent":F
    const/high16 v10, 0x3f800000    # 1.0f

    sub-float/2addr v10, v9

    float-to-double v10, v10

    const-wide/high16 v12, 0x4008000000000000L    # 3.0

    invoke-static {v10, v11, v12, v13}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v10

    double-to-float v0, v10

    .line 4634
    .local v0, "alphaOnlineAndCamera":F
    iget-object v10, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->profile_last_seen:Landroid/view/View;

    if-eqz v10, :cond_10

    .line 4635
    iget-object v10, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->profile_last_seen:Landroid/view/View;

    invoke-virtual {v10, v0}, Landroid/view/View;->setAlpha(F)V

    .line 4637
    :cond_10
    iget-object v10, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->profile_photo_icon:Landroid/view/View;

    if-eqz v10, :cond_11

    .line 4638
    iget-object v10, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->profile_photo_icon:Landroid/view/View;

    invoke-virtual {v10, v0}, Landroid/view/View;->setAlpha(F)V

    .line 4641
    :cond_11
    const/high16 v10, 0x40400000    # 3.0f

    add-float/2addr v10, v4

    const/high16 v11, 0x40800000    # 4.0f

    div-float v5, v10, v11

    .line 4643
    .local v5, "scale":F
    iget-object v10, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->profileTitle:Landroid/widget/TextView;

    invoke-virtual {v10, v5}, Landroid/widget/TextView;->setScaleY(F)V

    .line 4644
    iget-object v10, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->profileTitle:Landroid/widget/TextView;

    invoke-virtual {v10, v5}, Landroid/widget/TextView;->setScaleX(F)V

    .line 4646
    iget-object v10, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->profileTitle:Landroid/widget/TextView;

    const/high16 v11, 0x3f800000    # 1.0f

    sub-float/2addr v11, v4

    iget-object v12, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->toolbarTitle:Landroid/widget/TextView;

    .line 4647
    invoke-virtual {v12}, Landroid/widget/TextView;->getLeft()I

    move-result v12

    int-to-float v12, v12

    iget-object v13, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->profileTitle:Landroid/widget/TextView;

    invoke-virtual {v13}, Landroid/widget/TextView;->getPaddingLeft()I

    move-result v13

    int-to-float v13, v13

    mul-float/2addr v13, v5

    sub-float/2addr v12, v13

    mul-float/2addr v11, v12

    iget-object v12, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->profileTitle:Landroid/widget/TextView;

    .line 4648
    invoke-virtual {v12}, Landroid/widget/TextView;->getWidth()I

    move-result v12

    int-to-float v12, v12

    const/high16 v13, 0x3f800000    # 1.0f

    sub-float/2addr v13, v5

    mul-float/2addr v12, v13

    const/high16 v13, 0x40000000    # 2.0f

    div-float/2addr v12, v13

    sub-float/2addr v11, v12

    .line 4646
    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setTranslationX(F)V

    .line 4649
    iget-object v10, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->profileTitle:Landroid/widget/TextView;

    iget-object v11, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->profileTitle:Landroid/widget/TextView;

    invoke-virtual {v11}, Landroid/widget/TextView;->getHeight()I

    move-result v11

    int-to-float v11, v11

    const/high16 v12, 0x3f800000    # 1.0f

    sub-float/2addr v12, v5

    mul-float/2addr v11, v12

    const/high16 v12, 0x40000000    # 2.0f

    div-float/2addr v11, v12

    iget-object v12, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->overlay:Landroid/view/View;

    .line 4650
    invoke-virtual {v12}, Landroid/view/View;->getHeight()I

    move-result v12

    iget-object v13, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->profileTitle:Landroid/widget/TextView;

    invoke-virtual {v13}, Landroid/widget/TextView;->getBottom()I

    move-result v13

    sub-int/2addr v12, v13

    sub-int/2addr v12, v8

    int-to-float v12, v12

    const/high16 v13, 0x3f800000    # 1.0f

    sub-float/2addr v13, v4

    mul-float/2addr v12, v13

    mul-float/2addr v12, v5

    sub-float/2addr v11, v12

    .line 4649
    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setTranslationY(F)V

    .line 4652
    const/4 v10, 0x0

    cmpl-float v10, v4, v10

    if-lez v10, :cond_1b

    .line 4653
    const/4 v10, 0x0

    invoke-virtual {p0, v10}, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->setToolbarTitleTextAlpha(I)V

    .line 4654
    iget-object v10, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->profileTitle:Landroid/widget/TextView;

    const/4 v11, 0x0

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setVisibility(I)V

    .line 4674
    .end local v0    # "alphaOnlineAndCamera":F
    .end local v1    # "head":Landroid/view/View;
    .end local v3    # "newVisible":Z
    .end local v4    # "percent":F
    .end local v5    # "scale":F
    .end local v7    # "toolbarOffset":I
    .end local v8    # "toolbarTitleBottom":I
    .end local v9    # "visiblePart":F
    :cond_12
    :goto_6
    const/4 v10, 0x1

    goto/16 :goto_0

    .line 4608
    :cond_13
    const/4 v10, 0x0

    goto/16 :goto_1

    .line 4610
    .restart local v7    # "toolbarOffset":I
    :cond_14
    const/4 v3, 0x0

    goto/16 :goto_2

    .line 4612
    :cond_15
    iget-object v10, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v10}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$9800(Lcom/vkontakte/android/fragments/ProfileFragment;)Lme/grishka/appkit/views/UsableRecyclerView;

    move-result-object v10

    iget-object v11, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v11}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$9700(Lcom/vkontakte/android/fragments/ProfileFragment;)Lme/grishka/appkit/views/UsableRecyclerView;

    move-result-object v11

    const/4 v12, 0x0

    invoke-virtual {v11, v12}, Lme/grishka/appkit/views/UsableRecyclerView;->getChildAt(I)Landroid/view/View;

    move-result-object v11

    invoke-virtual {v10, v11}, Lme/grishka/appkit/views/UsableRecyclerView;->getChildAdapterPosition(Landroid/view/View;)I

    move-result v10

    if-nez v10, :cond_16

    iget-object v10, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v10}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$9900(Lcom/vkontakte/android/fragments/ProfileFragment;)Lme/grishka/appkit/views/UsableRecyclerView;

    move-result-object v10

    const/4 v11, 0x0

    invoke-virtual {v10, v11}, Lme/grishka/appkit/views/UsableRecyclerView;->getChildAt(I)Landroid/view/View;

    move-result-object v10

    invoke-virtual {v10}, Landroid/view/View;->getBottom()I

    move-result v10

    if-gt v10, v7, :cond_17

    :cond_16
    const/4 v3, 0x1

    .restart local v3    # "newVisible":Z
    :goto_7
    goto/16 :goto_2

    .end local v3    # "newVisible":Z
    :cond_17
    const/4 v3, 0x0

    goto :goto_7

    .line 4616
    .restart local v3    # "newVisible":Z
    :cond_18
    const/4 v10, 0x0

    goto/16 :goto_3

    .line 4617
    :cond_19
    const/4 v10, 0x0

    goto/16 :goto_4

    .line 4624
    .restart local v1    # "head":Landroid/view/View;
    :cond_1a
    iget-object v10, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->coverView:Landroid/view/View;

    invoke-virtual {v10}, Landroid/view/View;->getHeight()I

    move-result v10

    goto/16 :goto_5

    .line 4656
    .restart local v0    # "alphaOnlineAndCamera":F
    .restart local v4    # "percent":F
    .restart local v5    # "scale":F
    .restart local v8    # "toolbarTitleBottom":I
    .restart local v9    # "visiblePart":F
    :cond_1b
    const/16 v10, 0xff

    invoke-virtual {p0, v10}, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->setToolbarTitleTextAlpha(I)V

    .line 4657
    iget-object v10, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->profileTitle:Landroid/widget/TextView;

    const/4 v11, 0x4

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_6

    .line 4659
    .end local v0    # "alphaOnlineAndCamera":F
    .end local v4    # "percent":F
    .end local v5    # "scale":F
    .end local v8    # "toolbarTitleBottom":I
    :cond_1c
    iget-object v10, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->coverView:Landroid/view/View;

    if-eqz v10, :cond_12

    .line 4660
    iget-object v10, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->profileTitle:Landroid/widget/TextView;

    invoke-virtual {v10}, Landroid/widget/TextView;->getTop()I

    move-result v11

    iget-object v10, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->profileTitle:Landroid/widget/TextView;

    .line 4661
    invoke-virtual {v10}, Landroid/widget/TextView;->getParent()Landroid/view/ViewParent;

    move-result-object v10

    check-cast v10, Landroid/view/View;

    invoke-virtual {v10}, Landroid/view/View;->getTop()I

    move-result v10

    add-int/2addr v11, v10

    iget-object v10, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->profileTitle:Landroid/widget/TextView;

    .line 4662
    invoke-virtual {v10}, Landroid/widget/TextView;->getParent()Landroid/view/ViewParent;

    move-result-object v10

    invoke-interface {v10}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    move-result-object v10

    check-cast v10, Landroid/view/View;

    invoke-virtual {v10}, Landroid/view/View;->getTop()I

    move-result v10

    add-int/2addr v10, v11

    .line 4663
    invoke-virtual {v1}, Landroid/view/View;->getTop()I

    move-result v11

    add-int v6, v10, v11

    .line 4664
    .local v6, "titleTop":I
    iget-object v10, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-virtual {v10}, Lcom/vkontakte/android/fragments/ProfileFragment;->getToolbar()Landroid/support/v7/widget/Toolbar;

    move-result-object v10

    invoke-virtual {v10}, Landroid/support/v7/widget/Toolbar;->getHeight()I

    move-result v10

    iget-object v11, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-virtual {v11}, Lcom/vkontakte/android/fragments/ProfileFragment;->getToolbar()Landroid/support/v7/widget/Toolbar;

    move-result-object v11

    invoke-virtual {v11}, Landroid/support/v7/widget/Toolbar;->getHeight()I

    move-result v11

    iget-object v12, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->toolbarTitle:Landroid/widget/TextView;

    invoke-virtual {v12}, Landroid/widget/TextView;->getHeight()I

    move-result v12

    sub-int/2addr v11, v12

    div-int/lit8 v11, v11, 0x2

    sub-int v2, v10, v11

    .line 4665
    .local v2, "maxTranslation":I
    iget-object v10, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->toolbarTitle:Landroid/widget/TextView;

    const/4 v11, 0x0

    iget-object v12, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-virtual {v12}, Lcom/vkontakte/android/fragments/ProfileFragment;->getToolbar()Landroid/support/v7/widget/Toolbar;

    move-result-object v12

    invoke-virtual {v12}, Landroid/support/v7/widget/Toolbar;->getBottom()I

    move-result v12

    sub-int v12, v2, v12

    add-int/2addr v12, v6

    invoke-static {v11, v12}, Ljava/lang/Math;->max(II)I

    move-result v11

    int-to-float v11, v11

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setTranslationY(F)V

    goto/16 :goto_6

    .line 4668
    .end local v1    # "head":Landroid/view/View;
    .end local v2    # "maxTranslation":I
    .end local v6    # "titleTop":I
    .end local v9    # "visiblePart":F
    :cond_1d
    iget-object v10, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->toolbarTitle:Landroid/widget/TextView;

    if-eqz v10, :cond_12

    iget-object v10, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->toolbarTitle:Landroid/widget/TextView;

    invoke-virtual {v10}, Landroid/widget/TextView;->getTranslationY()F

    move-result v10

    const/4 v11, 0x0

    cmpl-float v10, v10, v11

    if-eqz v10, :cond_12

    .line 4669
    iget-object v10, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->toolbarTitle:Landroid/widget/TextView;

    const/4 v11, 0x0

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setTranslationY(F)V

    goto/16 :goto_6

    .line 4672
    .end local v3    # "newVisible":Z
    .end local v7    # "toolbarOffset":I
    :cond_1e
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->hideToolbar()V

    goto/16 :goto_6
.end method

.method public setToolbarAlpha(I)V
    .locals 3
    .param p1, "alpha"    # I

    .prologue
    .line 4685
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getToolbar()Landroid/support/v7/widget/Toolbar;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 4686
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getToolbar()Landroid/support/v7/widget/Toolbar;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v7/widget/Toolbar;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 4687
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->setToolbarTitleTextAlpha(I)V

    .line 4688
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$9000(Lcom/vkontakte/android/fragments/ProfileFragment;)Landroid/view/View;

    move-result-object v0

    int-to-float v1, p1

    const/high16 v2, 0x437f0000    # 255.0f

    div-float/2addr v1, v2

    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 4690
    :cond_0
    iput p1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->lastToolbarAlpha:I

    .line 4691
    return-void
.end method

.method public setToolbarTitleTextAlpha(I)V
    .locals 3
    .param p1, "alpha"    # I

    .prologue
    .line 4699
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->getToolbarTitle()Landroid/widget/TextView;

    move-result-object v0

    .line 4700
    .local v0, "toolbarTitle":Landroid/widget/TextView;
    if-eqz v0, :cond_0

    .line 4701
    shl-int/lit8 v1, p1, 0x18

    const v2, 0xffffff

    or-int/2addr v1, v2

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 4703
    :cond_0
    iput p1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->lastTextAlpha:I

    .line 4704
    return-void
.end method

.method showToolbar(Z)V
    .locals 4
    .param p1, "animate"    # Z

    .prologue
    const/16 v3, 0xff

    .line 4557
    if-eqz p1, :cond_0

    .line 4558
    const-string/jumbo v0, "toolbarAlpha"

    const/4 v1, 0x1

    new-array v1, v1, [I

    const/4 v2, 0x0

    aput v3, v1, v2

    invoke-static {p0, v0, v1}, Landroid/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Ljava/lang/String;[I)Landroid/animation/ObjectAnimator;

    move-result-object v0

    const-wide/16 v2, 0xc8

    invoke-virtual {v0, v2, v3}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    .line 4562
    :goto_0
    return-void

    .line 4560
    :cond_0
    invoke-virtual {p0, v3}, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->setToolbarAlpha(I)V

    goto :goto_0
.end method
