.class Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity$2;
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
    .line 180
    iput-object p1, p0, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity$2;->this$0:Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 2
    .param p1, "animation"    # Landroid/animation/Animator;

    .prologue
    .line 189
    iget-object v0, p0, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity$2;->this$0:Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->access$502(Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 190
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 3
    .param p1, "animation"    # Landroid/animation/Animator;

    .prologue
    const/4 v0, 0x0

    .line 183
    iget-object v1, p0, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity$2;->this$0:Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;

    iget-object v1, v1, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->toolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {v1, v0}, Landroid/support/v7/widget/Toolbar;->setVisibility(I)V

    .line 184
    iget-object v1, p0, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity$2;->this$0:Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;

    iget-object v1, v1, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->bottomPanel:Landroid/view/View;

    iget-object v2, p0, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity$2;->this$0:Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;

    iget-boolean v2, v2, Lcom/vkontakte/android/activities/YouTubeVideoPlayerActivity;->landscape:Z

    if-eqz v2, :cond_0

    const/16 v0, 0x8

    :cond_0
    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 185
    return-void
.end method
