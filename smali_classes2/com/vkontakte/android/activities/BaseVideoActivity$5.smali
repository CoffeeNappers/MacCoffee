.class Lcom/vkontakte/android/activities/BaseVideoActivity$5;
.super Lcom/vkontakte/android/api/ResultlessCallback;
.source "BaseVideoActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/activities/BaseVideoActivity;->addVideo(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/activities/BaseVideoActivity;

.field final synthetic val$completed:Z


# direct methods
.method constructor <init>(Lcom/vkontakte/android/activities/BaseVideoActivity;Landroid/content/Context;Z)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/activities/BaseVideoActivity;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 342
    iput-object p1, p0, Lcom/vkontakte/android/activities/BaseVideoActivity$5;->this$0:Lcom/vkontakte/android/activities/BaseVideoActivity;

    iput-boolean p3, p0, Lcom/vkontakte/android/activities/BaseVideoActivity$5;->val$completed:Z

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/ResultlessCallback;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 2
    .param p1, "err"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 356
    invoke-super {p0, p1}, Lcom/vkontakte/android/api/ResultlessCallback;->fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V

    .line 357
    iget-boolean v0, p0, Lcom/vkontakte/android/activities/BaseVideoActivity$5;->val$completed:Z

    if-nez v0, :cond_0

    .line 358
    iget-object v0, p0, Lcom/vkontakte/android/activities/BaseVideoActivity$5;->this$0:Lcom/vkontakte/android/activities/BaseVideoActivity;

    const/16 v1, 0x3e8

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/activities/BaseVideoActivity;->hideUIDelayed(I)V

    .line 360
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/activities/BaseVideoActivity$5;->this$0:Lcom/vkontakte/android/activities/BaseVideoActivity;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vkontakte/android/activities/BaseVideoActivity;->access$402(Lcom/vkontakte/android/activities/BaseVideoActivity;Z)Z

    .line 361
    return-void
.end method

.method public success()V
    .locals 2

    .prologue
    .line 345
    iget-object v0, p0, Lcom/vkontakte/android/activities/BaseVideoActivity$5;->this$0:Lcom/vkontakte/android/activities/BaseVideoActivity;

    invoke-static {v0}, Lcom/vkontakte/android/activities/BaseVideoActivity;->access$200(Lcom/vkontakte/android/activities/BaseVideoActivity;)V

    .line 346
    iget-object v0, p0, Lcom/vkontakte/android/activities/BaseVideoActivity$5;->this$0:Lcom/vkontakte/android/activities/BaseVideoActivity;

    invoke-virtual {v0}, Lcom/vkontakte/android/activities/BaseVideoActivity;->invalidateOptionsMenu()V

    .line 347
    iget-object v0, p0, Lcom/vkontakte/android/activities/BaseVideoActivity$5;->this$0:Lcom/vkontakte/android/activities/BaseVideoActivity;

    invoke-virtual {v0}, Lcom/vkontakte/android/activities/BaseVideoActivity;->onAddedStateChanged()V

    .line 348
    iget-boolean v0, p0, Lcom/vkontakte/android/activities/BaseVideoActivity$5;->val$completed:Z

    if-nez v0, :cond_0

    .line 349
    iget-object v0, p0, Lcom/vkontakte/android/activities/BaseVideoActivity$5;->this$0:Lcom/vkontakte/android/activities/BaseVideoActivity;

    const/16 v1, 0x3e8

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/activities/BaseVideoActivity;->hideUIDelayed(I)V

    .line 351
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/activities/BaseVideoActivity$5;->this$0:Lcom/vkontakte/android/activities/BaseVideoActivity;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vkontakte/android/activities/BaseVideoActivity;->access$402(Lcom/vkontakte/android/activities/BaseVideoActivity;Z)Z

    .line 352
    return-void
.end method
