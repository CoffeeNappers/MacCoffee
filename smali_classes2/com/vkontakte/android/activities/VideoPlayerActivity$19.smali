.class Lcom/vkontakte/android/activities/VideoPlayerActivity$19;
.super Ljava/lang/Object;
.source "VideoPlayerActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/activities/VideoPlayerActivity;->setKeepScreenOn(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

.field final synthetic val$keepScreenOn:Z


# direct methods
.method constructor <init>(Lcom/vkontakte/android/activities/VideoPlayerActivity;Z)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/activities/VideoPlayerActivity;

    .prologue
    .line 936
    iput-object p1, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$19;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    iput-boolean p2, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$19;->val$keepScreenOn:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    const/16 v1, 0x80

    .line 939
    iget-boolean v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$19;->val$keepScreenOn:Z

    if-eqz v0, :cond_0

    .line 940
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$19;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    invoke-virtual {v0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    .line 944
    :goto_0
    return-void

    .line 942
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$19;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    invoke-virtual {v0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/Window;->clearFlags(I)V

    goto :goto_0
.end method
