.class Lcom/vkontakte/android/activities/BaseVideoActivity$4;
.super Lcom/vkontakte/android/api/SimpleCallback;
.source "BaseVideoActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/activities/BaseVideoActivity;->addVideo(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/SimpleCallback",
        "<",
        "Ljava/lang/Integer;",
        ">;"
    }
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
    .line 317
    iput-object p1, p0, Lcom/vkontakte/android/activities/BaseVideoActivity$4;->this$0:Lcom/vkontakte/android/activities/BaseVideoActivity;

    iput-boolean p3, p0, Lcom/vkontakte/android/activities/BaseVideoActivity$4;->val$completed:Z

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/SimpleCallback;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 2
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 332
    invoke-super {p0, p1}, Lcom/vkontakte/android/api/SimpleCallback;->fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V

    .line 333
    iget-boolean v0, p0, Lcom/vkontakte/android/activities/BaseVideoActivity$4;->val$completed:Z

    if-nez v0, :cond_0

    .line 334
    iget-object v0, p0, Lcom/vkontakte/android/activities/BaseVideoActivity$4;->this$0:Lcom/vkontakte/android/activities/BaseVideoActivity;

    const/16 v1, 0x3e8

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/activities/BaseVideoActivity;->hideUIDelayed(I)V

    .line 336
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/activities/BaseVideoActivity$4;->this$0:Lcom/vkontakte/android/activities/BaseVideoActivity;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vkontakte/android/activities/BaseVideoActivity;->access$402(Lcom/vkontakte/android/activities/BaseVideoActivity;Z)Z

    .line 337
    return-void
.end method

.method public success(Ljava/lang/Integer;)V
    .locals 5
    .param p1, "vid"    # Ljava/lang/Integer;

    .prologue
    const/4 v4, 0x0

    .line 320
    iget-object v0, p0, Lcom/vkontakte/android/activities/BaseVideoActivity$4;->this$0:Lcom/vkontakte/android/activities/BaseVideoActivity;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    iput v1, v0, Lcom/vkontakte/android/activities/BaseVideoActivity;->addedID:I

    .line 321
    iget-object v0, p0, Lcom/vkontakte/android/activities/BaseVideoActivity$4;->this$0:Lcom/vkontakte/android/activities/BaseVideoActivity;

    invoke-virtual {v0}, Lcom/vkontakte/android/activities/BaseVideoActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f08074f

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    iget-object v3, p0, Lcom/vkontakte/android/activities/BaseVideoActivity$4;->this$0:Lcom/vkontakte/android/activities/BaseVideoActivity;

    invoke-static {v3}, Lcom/vkontakte/android/activities/BaseVideoActivity;->access$000(Lcom/vkontakte/android/activities/BaseVideoActivity;)Lcom/vkontakte/android/api/VideoFile;

    move-result-object v3

    iget-object v3, v3, Lcom/vkontakte/android/api/VideoFile;->title:Ljava/lang/String;

    aput-object v3, v2, v4

    invoke-virtual {v0, v1, v2}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/vk/core/util/ToastUtils;->showToast(Ljava/lang/String;)V

    .line 322
    iget-object v0, p0, Lcom/vkontakte/android/activities/BaseVideoActivity$4;->this$0:Lcom/vkontakte/android/activities/BaseVideoActivity;

    invoke-virtual {v0}, Lcom/vkontakte/android/activities/BaseVideoActivity;->invalidateOptionsMenu()V

    .line 323
    iget-object v0, p0, Lcom/vkontakte/android/activities/BaseVideoActivity$4;->this$0:Lcom/vkontakte/android/activities/BaseVideoActivity;

    invoke-virtual {v0}, Lcom/vkontakte/android/activities/BaseVideoActivity;->onAddedStateChanged()V

    .line 324
    iget-boolean v0, p0, Lcom/vkontakte/android/activities/BaseVideoActivity$4;->val$completed:Z

    if-nez v0, :cond_0

    .line 325
    iget-object v0, p0, Lcom/vkontakte/android/activities/BaseVideoActivity$4;->this$0:Lcom/vkontakte/android/activities/BaseVideoActivity;

    const/16 v1, 0x3e8

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/activities/BaseVideoActivity;->hideUIDelayed(I)V

    .line 327
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/activities/BaseVideoActivity$4;->this$0:Lcom/vkontakte/android/activities/BaseVideoActivity;

    invoke-static {v0, v4}, Lcom/vkontakte/android/activities/BaseVideoActivity;->access$402(Lcom/vkontakte/android/activities/BaseVideoActivity;Z)Z

    .line 328
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 317
    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/activities/BaseVideoActivity$4;->success(Ljava/lang/Integer;)V

    return-void
.end method
