.class Lcom/vkontakte/android/activities/VideoPlayerActivity$18;
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
    .line 878
    iput-object p1, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$18;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 2
    .param p1, "animation"    # Landroid/animation/Animator;

    .prologue
    const/4 v1, 0x4

    .line 881
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$18;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    iget-object v0, v0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->toolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/Toolbar;->setVisibility(I)V

    .line 882
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$18;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    iget-object v0, v0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->controlBar:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 883
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$18;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    iget-object v0, v0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->playButton:Landroid/widget/ImageView;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 884
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$18;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    iget-object v0, v0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->insetsView:Lcom/vkontakte/android/activities/VideoPlayerActivity$ScrimInsetsView;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/activities/VideoPlayerActivity$ScrimInsetsView;->setVisibility(I)V

    .line 885
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$18;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    iget-object v0, v0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->bottomPanel:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 886
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$18;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    iget-object v0, v0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->playButton:Landroid/widget/ImageView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setClickable(Z)V

    .line 887
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$18;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    const/4 v1, 0x0

    iput-object v1, v0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->visibilityAnim:Landroid/animation/Animator;

    .line 888
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$18;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    iget-object v0, v0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->qualityMenu:Landroid/support/v7/widget/PopupMenu;

    invoke-static {v0}, Lcom/vkontakte/android/ViewUtils;->dismissDialogSafety(Landroid/support/v7/widget/PopupMenu;)V

    .line 889
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$18;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    iget-object v0, v0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->addMenu:Landroid/support/v7/widget/PopupMenu;

    invoke-static {v0}, Lcom/vkontakte/android/ViewUtils;->dismissDialogSafety(Landroid/support/v7/widget/PopupMenu;)V

    .line 890
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$18;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    iget-object v0, v0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->toolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {v0}, Landroid/support/v7/widget/Toolbar;->dismissPopupMenus()V

    .line 891
    return-void
.end method
