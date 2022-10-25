.class Lcom/vkontakte/android/fragments/search/QuickSearchActivity$4;
.super Ljava/lang/Object;
.source "QuickSearchActivity.java"

# interfaces
.implements Landroid/animation/Animator$AnimatorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/search/QuickSearchActivity;->finish()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/search/QuickSearchActivity;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/search/QuickSearchActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/search/QuickSearchActivity;

    .prologue
    .line 219
    iput-object p1, p0, Lcom/vkontakte/android/fragments/search/QuickSearchActivity$4;->this$0:Lcom/vkontakte/android/fragments/search/QuickSearchActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 3
    .param p1, "animation"    # Landroid/animation/Animator;

    .prologue
    const/4 v2, 0x0

    .line 235
    iget-object v0, p0, Lcom/vkontakte/android/fragments/search/QuickSearchActivity$4;->this$0:Lcom/vkontakte/android/fragments/search/QuickSearchActivity;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/search/QuickSearchActivity;->access$100(Lcom/vkontakte/android/fragments/search/QuickSearchActivity;)Landroid/view/View;

    move-result-object v0

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 236
    iget-object v0, p0, Lcom/vkontakte/android/fragments/search/QuickSearchActivity$4;->this$0:Lcom/vkontakte/android/fragments/search/QuickSearchActivity;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/search/QuickSearchActivity;->access$701(Lcom/vkontakte/android/fragments/search/QuickSearchActivity;)V

    .line 237
    iget-object v0, p0, Lcom/vkontakte/android/fragments/search/QuickSearchActivity$4;->this$0:Lcom/vkontakte/android/fragments/search/QuickSearchActivity;

    invoke-virtual {v0, v2, v2}, Lcom/vkontakte/android/fragments/search/QuickSearchActivity;->overridePendingTransition(II)V

    .line 238
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 3
    .param p1, "animation"    # Landroid/animation/Animator;

    .prologue
    const/4 v2, 0x0

    .line 227
    iget-object v0, p0, Lcom/vkontakte/android/fragments/search/QuickSearchActivity$4;->this$0:Lcom/vkontakte/android/fragments/search/QuickSearchActivity;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/search/QuickSearchActivity;->access$100(Lcom/vkontakte/android/fragments/search/QuickSearchActivity;)Landroid/view/View;

    move-result-object v0

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 228
    iget-object v0, p0, Lcom/vkontakte/android/fragments/search/QuickSearchActivity$4;->this$0:Lcom/vkontakte/android/fragments/search/QuickSearchActivity;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/search/QuickSearchActivity;->access$601(Lcom/vkontakte/android/fragments/search/QuickSearchActivity;)V

    .line 229
    iget-object v0, p0, Lcom/vkontakte/android/fragments/search/QuickSearchActivity$4;->this$0:Lcom/vkontakte/android/fragments/search/QuickSearchActivity;

    invoke-virtual {v0, v2, v2}, Lcom/vkontakte/android/fragments/search/QuickSearchActivity;->overridePendingTransition(II)V

    .line 230
    iget-object v0, p0, Lcom/vkontakte/android/fragments/search/QuickSearchActivity$4;->this$0:Lcom/vkontakte/android/fragments/search/QuickSearchActivity;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/search/QuickSearchActivity;->access$100(Lcom/vkontakte/android/fragments/search/QuickSearchActivity;)Landroid/view/View;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v2, v1}, Landroid/view/View;->setLayerType(ILandroid/graphics/Paint;)V

    .line 231
    return-void
.end method

.method public onAnimationRepeat(Landroid/animation/Animator;)V
    .locals 0
    .param p1, "animation"    # Landroid/animation/Animator;

    .prologue
    .line 243
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 0
    .param p1, "animation"    # Landroid/animation/Animator;

    .prologue
    .line 223
    return-void
.end method
