.class Lcom/vkontakte/android/activities/VideoPlayerActivity$21;
.super Landroid/animation/AnimatorListenerAdapter;
.source "VideoPlayerActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/activities/VideoPlayerActivity;->resize()V
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
    .line 1009
    iput-object p1, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$21;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 2
    .param p1, "animation"    # Landroid/animation/Animator;

    .prologue
    .line 1012
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$21;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    const/4 v1, 0x0

    iput-object v1, v0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->resizeAnim:Landroid/animation/Animator;

    .line 1013
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$21;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    const/16 v1, 0xbb8

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->hideUIDelayed(I)V

    .line 1014
    return-void
.end method
