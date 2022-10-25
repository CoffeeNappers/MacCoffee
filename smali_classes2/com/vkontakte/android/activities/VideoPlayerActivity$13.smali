.class Lcom/vkontakte/android/activities/VideoPlayerActivity$13;
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


# direct methods
.method constructor <init>(Lcom/vkontakte/android/activities/VideoPlayerActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/activities/VideoPlayerActivity;

    .prologue
    .line 452
    iput-object p1, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$13;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 455
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$13;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    iget-object v1, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$13;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    invoke-static {v1}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->access$500(Lcom/vkontakte/android/activities/VideoPlayerActivity;)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->updateTimings(I)V

    .line 456
    return-void
.end method
