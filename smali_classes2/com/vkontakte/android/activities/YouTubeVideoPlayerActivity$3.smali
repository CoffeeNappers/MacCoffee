.class Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity$3;
.super Landroid/animation/AnimatorListenerAdapter;
.source "YouTubeVideoPlayerActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->setUIVisibility(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;

    .prologue
    .line 204
    iput-object p1, p0, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity$3;->this$0:Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 2
    .param p1, "animation"    # Landroid/animation/Animator;

    .prologue
    const/4 v1, 0x4

    .line 207
    iget-object v0, p0, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity$3;->this$0:Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;

    iget-object v0, v0, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->toolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/Toolbar;->setVisibility(I)V

    .line 208
    iget-object v0, p0, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity$3;->this$0:Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;

    iget-object v0, v0, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->bottomPanel:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 209
    iget-object v0, p0, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity$3;->this$0:Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->access$502(Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 210
    iget-object v0, p0, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity$3;->this$0:Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;

    iget-object v0, v0, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->addMenu:Landroid/support/v7/widget/PopupMenu;

    invoke-static {v0}, Lcom/vkontakte/android/ViewUtils;->dismissDialogSafety(Landroid/support/v7/widget/PopupMenu;)V

    .line 211
    iget-object v0, p0, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity$3;->this$0:Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;

    iget-object v0, v0, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->toolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {v0}, Landroid/support/v7/widget/Toolbar;->dismissPopupMenus()V

    .line 212
    return-void
.end method
