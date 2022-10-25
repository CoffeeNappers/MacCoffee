.class Lcom/vkontakte/android/activities/VideoPlayerActivity$14;
.super Ljava/lang/Object;
.source "VideoPlayerActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/activities/VideoPlayerActivity;->onPlayerReady(Lcom/vkontakte/android/media/AbsVideoPlayer;II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

.field final synthetic val$height:I

.field final synthetic val$width:I


# direct methods
.method constructor <init>(Lcom/vkontakte/android/activities/VideoPlayerActivity;II)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/activities/VideoPlayerActivity;

    .prologue
    .line 467
    iput-object p1, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$14;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    iput p2, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$14;->val$width:I

    iput p3, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$14;->val$height:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 470
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$14;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    iget-object v0, v0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->texView:Lcom/vkontakte/android/ui/widget/VideoTextureView;

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/widget/VideoTextureView;->setAlpha(F)V

    .line 471
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$14;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    iget-object v0, v0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->texView:Lcom/vkontakte/android/ui/widget/VideoTextureView;

    iget v1, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$14;->val$width:I

    iget v2, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$14;->val$height:I

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/ui/widget/VideoTextureView;->setVideoSize(II)V

    .line 472
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$14;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    invoke-virtual {v0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->updateTextureViewScale()V

    .line 473
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$14;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    iget-object v0, v0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->progress:Landroid/widget/ProgressBar;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 474
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$14;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->setBottomPanelVisible(Z)V

    .line 475
    return-void
.end method
