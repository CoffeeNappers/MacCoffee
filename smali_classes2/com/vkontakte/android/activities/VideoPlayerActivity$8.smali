.class Lcom/vkontakte/android/activities/VideoPlayerActivity$8;
.super Ljava/lang/Object;
.source "VideoPlayerActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/activities/VideoPlayerActivity;->createUI(Landroid/os/Bundle;)V
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
    .line 242
    iput-object p1, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$8;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 245
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$8;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    invoke-static {v0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->access$100(Lcom/vkontakte/android/activities/VideoPlayerActivity;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 252
    :cond_0
    :goto_0
    return-void

    .line 248
    :cond_1
    iget-object v1, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$8;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$8;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    invoke-static {v0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->access$200(Lcom/vkontakte/android/activities/VideoPlayerActivity;)Z

    move-result v0

    if-nez v0, :cond_2

    const/4 v0, 0x1

    :goto_1
    invoke-virtual {v1, v0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->setUIVisibility(Z)V

    .line 249
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$8;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    invoke-static {v0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->access$200(Lcom/vkontakte/android/activities/VideoPlayerActivity;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 250
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$8;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    iget-object v1, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$8;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    invoke-virtual {v1}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->getHideDelay()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->hideUIDelayed(I)V

    goto :goto_0

    .line 248
    :cond_2
    const/4 v0, 0x0

    goto :goto_1
.end method
