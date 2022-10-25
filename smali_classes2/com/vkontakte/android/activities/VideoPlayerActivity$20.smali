.class Lcom/vkontakte/android/activities/VideoPlayerActivity$20;
.super Ljava/lang/Object;
.source "VideoPlayerActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/activities/VideoPlayerActivity;->updatePlayButton()V
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
    .line 949
    iput-object p1, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$20;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 952
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$20;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    iget-object v1, v0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->playButton:Landroid/widget/ImageView;

    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$20;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    iget-boolean v0, v0, Lcom/vkontakte/android/activities/VideoPlayerActivity;->playing:Z

    if-nez v0, :cond_0

    const v0, 0x7f020243

    :goto_0
    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 953
    return-void

    .line 952
    :cond_0
    const v0, 0x7f020233

    goto :goto_0
.end method
