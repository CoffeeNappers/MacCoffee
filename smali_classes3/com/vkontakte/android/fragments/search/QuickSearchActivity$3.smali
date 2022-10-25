.class Lcom/vkontakte/android/fragments/search/QuickSearchActivity$3;
.super Ljava/lang/Object;
.source "QuickSearchActivity.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnPreDrawListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/search/QuickSearchActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/search/QuickSearchActivity;

.field final synthetic val$screenWidth:F


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/search/QuickSearchActivity;F)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/search/QuickSearchActivity;

    .prologue
    .line 152
    iput-object p1, p0, Lcom/vkontakte/android/fragments/search/QuickSearchActivity$3;->this$0:Lcom/vkontakte/android/fragments/search/QuickSearchActivity;

    iput p2, p0, Lcom/vkontakte/android/fragments/search/QuickSearchActivity$3;->val$screenWidth:F

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPreDraw()Z
    .locals 6

    .prologue
    .line 155
    iget-object v1, p0, Lcom/vkontakte/android/fragments/search/QuickSearchActivity$3;->this$0:Lcom/vkontakte/android/fragments/search/QuickSearchActivity;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/search/QuickSearchActivity;->access$100(Lcom/vkontakte/android/fragments/search/QuickSearchActivity;)Landroid/view/View;

    move-result-object v1

    const/4 v2, 0x2

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/view/View;->setLayerType(ILandroid/graphics/Paint;)V

    .line 156
    iget-object v1, p0, Lcom/vkontakte/android/fragments/search/QuickSearchActivity$3;->this$0:Lcom/vkontakte/android/fragments/search/QuickSearchActivity;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/search/QuickSearchActivity;->access$100(Lcom/vkontakte/android/fragments/search/QuickSearchActivity;)Landroid/view/View;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/fragments/search/QuickSearchActivity$3;->this$0:Lcom/vkontakte/android/fragments/search/QuickSearchActivity;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/search/QuickSearchActivity;->access$200(Lcom/vkontakte/android/fragments/search/QuickSearchActivity;)I

    move-result v2

    iget-object v3, p0, Lcom/vkontakte/android/fragments/search/QuickSearchActivity$3;->this$0:Lcom/vkontakte/android/fragments/search/QuickSearchActivity;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/search/QuickSearchActivity;->access$300(Lcom/vkontakte/android/fragments/search/QuickSearchActivity;)I

    move-result v3

    iget-object v4, p0, Lcom/vkontakte/android/fragments/search/QuickSearchActivity$3;->this$0:Lcom/vkontakte/android/fragments/search/QuickSearchActivity;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/search/QuickSearchActivity;->access$400(Lcom/vkontakte/android/fragments/search/QuickSearchActivity;)I

    move-result v4

    int-to-float v4, v4

    iget v5, p0, Lcom/vkontakte/android/fragments/search/QuickSearchActivity$3;->val$screenWidth:F

    invoke-static {v1, v2, v3, v4, v5}, Lcom/vkontakte/android/ui/animation/ViewAnimationUtils;->createCircularReveal(Landroid/view/View;IIFF)Landroid/animation/Animator;

    move-result-object v0

    .line 157
    .local v0, "animation":Landroid/animation/Animator;
    const-wide/16 v2, 0x12c

    invoke-virtual {v0, v2, v3}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 158
    iget-object v1, p0, Lcom/vkontakte/android/fragments/search/QuickSearchActivity$3;->this$0:Lcom/vkontakte/android/fragments/search/QuickSearchActivity;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/search/QuickSearchActivity;->access$500(Lcom/vkontakte/android/fragments/search/QuickSearchActivity;)Landroid/animation/TimeInterpolator;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 159
    invoke-virtual {v0}, Landroid/animation/Animator;->start()V

    .line 160
    new-instance v1, Lcom/vkontakte/android/fragments/search/QuickSearchActivity$3$1;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/fragments/search/QuickSearchActivity$3$1;-><init>(Lcom/vkontakte/android/fragments/search/QuickSearchActivity$3;)V

    invoke-virtual {v0, v1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 167
    iget-object v1, p0, Lcom/vkontakte/android/fragments/search/QuickSearchActivity$3;->this$0:Lcom/vkontakte/android/fragments/search/QuickSearchActivity;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/search/QuickSearchActivity;->access$100(Lcom/vkontakte/android/fragments/search/QuickSearchActivity;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v1

    invoke-virtual {v1, p0}, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 168
    const/4 v1, 0x1

    return v1
.end method
