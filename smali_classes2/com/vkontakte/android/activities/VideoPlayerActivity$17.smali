.class Lcom/vkontakte/android/activities/VideoPlayerActivity$17;
.super Landroid/animation/AnimatorListenerAdapter;
.source "VideoPlayerActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/activities/VideoPlayerActivity;->setUIVisibility(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/activities/VideoPlayerActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/activities/VideoPlayerActivity;

    .prologue
    .line 848
    iput-object p1, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$17;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 2
    .param p1, "animation"    # Landroid/animation/Animator;

    .prologue
    .line 861
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$17;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    const/4 v1, 0x0

    iput-object v1, v0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->visibilityAnim:Landroid/animation/Animator;

    .line 862
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 4
    .param p1, "animation"    # Landroid/animation/Animator;

    .prologue
    const/16 v2, 0x8

    const/4 v1, 0x0

    .line 851
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$17;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    iget-object v0, v0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->toolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/Toolbar;->setVisibility(I)V

    .line 852
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$17;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    iget-object v0, v0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->insetsView:Lcom/vkontakte/android/activities/VideoPlayerActivity$ScrimInsetsView;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/activities/VideoPlayerActivity$ScrimInsetsView;->setVisibility(I)V

    .line 853
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$17;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    iget-object v3, v0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->controlBar:Landroid/view/View;

    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$17;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    invoke-virtual {v0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->isInShitMode()Z

    move-result v0

    if-nez v0, :cond_3

    move v0, v1

    :goto_0
    invoke-virtual {v3, v0}, Landroid/view/View;->setVisibility(I)V

    .line 854
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$17;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    iget-object v0, v0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->bottomPanel:Landroid/view/View;

    iget-object v3, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$17;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    iget-boolean v3, v3, Lcom/vkontakte/android/activities/VideoPlayerActivity;->landscape:Z

    if-nez v3, :cond_0

    iget-object v3, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$17;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    invoke-virtual {v3}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->isInShitMode()Z

    move-result v3

    if-eqz v3, :cond_4

    :cond_0
    :goto_1
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 855
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$17;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    iget-object v0, v0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->playButton:Landroid/widget/ImageView;

    iget-object v2, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$17;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    invoke-static {v2}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->access$100(Lcom/vkontakte/android/activities/VideoPlayerActivity;)Z

    move-result v2

    if-nez v2, :cond_1

    iget-object v2, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$17;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    invoke-static {v2}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->access$600(Lcom/vkontakte/android/activities/VideoPlayerActivity;)Z

    move-result v2

    if-eqz v2, :cond_2

    :cond_1
    const/4 v1, 0x4

    :cond_2
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 856
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$17;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    iget-object v0, v0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->playButton:Landroid/widget/ImageView;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setClickable(Z)V

    .line 857
    return-void

    :cond_3
    move v0, v2

    .line 853
    goto :goto_0

    :cond_4
    move v2, v1

    .line 854
    goto :goto_1
.end method
