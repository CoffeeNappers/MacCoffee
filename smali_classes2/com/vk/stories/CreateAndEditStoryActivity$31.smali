.class Lcom/vk/stories/CreateAndEditStoryActivity$31;
.super Lcom/vk/core/widget/ViewShower;
.source "CreateAndEditStoryActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/stories/CreateAndEditStoryActivity;->initMasksUIPart()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/stories/CreateAndEditStoryActivity;


# direct methods
.method constructor <init>(Lcom/vk/stories/CreateAndEditStoryActivity;Landroid/view/View;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/stories/CreateAndEditStoryActivity;
    .param p2, "targetView"    # Landroid/view/View;

    .prologue
    .line 1204
    iput-object p1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$31;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-direct {p0, p2}, Lcom/vk/core/widget/ViewShower;-><init>(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public createHideAnimator(Landroid/view/View;)Landroid/animation/Animator;
    .locals 5
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 1215
    sget-object v1, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    const/4 v2, 0x1

    new-array v2, v2, [F

    const/4 v3, 0x0

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v4

    int-to-float v4, v4

    aput v4, v2, v3

    invoke-static {p1, v1, v2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v0

    .line 1216
    .local v0, "oa":Landroid/animation/ObjectAnimator;
    const-wide/16 v2, 0xe1

    invoke-virtual {v0, v2, v3}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 1217
    sget-object v1, Lcom/vk/core/util/AnimationUtils;->accelerationCurve:Landroid/support/v4/view/animation/FastOutLinearInInterpolator;

    invoke-virtual {v0, v1}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 1218
    return-object v0
.end method

.method public createShowAnimator(Landroid/view/View;)Landroid/animation/Animator;
    .locals 5
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 1207
    sget-object v1, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    const/4 v2, 0x1

    new-array v2, v2, [F

    const/4 v3, 0x0

    const/4 v4, 0x0

    aput v4, v2, v3

    invoke-static {p1, v1, v2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v0

    .line 1208
    .local v0, "oa":Landroid/animation/ObjectAnimator;
    const-wide/16 v2, 0xe1

    invoke-virtual {v0, v2, v3}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 1209
    sget-object v1, Lcom/vk/core/util/AnimationUtils;->decelerationCurve:Landroid/support/v4/view/animation/LinearOutSlowInInterpolator;

    invoke-virtual {v0, v1}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 1210
    return-object v0
.end method

.method public dropViewState(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 1223
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$31;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-virtual {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0900fd

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v0

    invoke-virtual {p1, v0}, Landroid/view/View;->setTranslationY(F)V

    .line 1224
    return-void
.end method
