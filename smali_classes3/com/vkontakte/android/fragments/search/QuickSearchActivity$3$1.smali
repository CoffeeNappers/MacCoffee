.class Lcom/vkontakte/android/fragments/search/QuickSearchActivity$3$1;
.super Landroid/animation/AnimatorListenerAdapter;
.source "QuickSearchActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/search/QuickSearchActivity$3;->onPreDraw()Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/vkontakte/android/fragments/search/QuickSearchActivity$3;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/search/QuickSearchActivity$3;)V
    .locals 0
    .param p1, "this$1"    # Lcom/vkontakte/android/fragments/search/QuickSearchActivity$3;

    .prologue
    .line 160
    iput-object p1, p0, Lcom/vkontakte/android/fragments/search/QuickSearchActivity$3$1;->this$1:Lcom/vkontakte/android/fragments/search/QuickSearchActivity$3;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 3
    .param p1, "animation"    # Landroid/animation/Animator;

    .prologue
    .line 163
    iget-object v0, p0, Lcom/vkontakte/android/fragments/search/QuickSearchActivity$3$1;->this$1:Lcom/vkontakte/android/fragments/search/QuickSearchActivity$3;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/search/QuickSearchActivity$3;->this$0:Lcom/vkontakte/android/fragments/search/QuickSearchActivity;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/search/QuickSearchActivity;->access$100(Lcom/vkontakte/android/fragments/search/QuickSearchActivity;)Landroid/view/View;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/View;->setLayerType(ILandroid/graphics/Paint;)V

    .line 164
    return-void
.end method
