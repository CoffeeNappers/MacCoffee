.class Lcom/vkontakte/android/fragments/videos/VideoAddHelper$1$2$1;
.super Lcom/vkontakte/android/api/ResultlessCallback;
.source "VideoAddHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/videos/VideoAddHelper$1$2;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lcom/vkontakte/android/fragments/videos/VideoAddHelper$1$2;

.field final synthetic val$add:Ljava/util/ArrayList;

.field final synthetic val$remove:Ljava/util/ArrayList;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/videos/VideoAddHelper$1$2;Landroid/content/Context;Ljava/util/ArrayList;Ljava/util/ArrayList;)V
    .locals 0
    .param p1, "this$2"    # Lcom/vkontakte/android/fragments/videos/VideoAddHelper$1$2;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 93
    iput-object p1, p0, Lcom/vkontakte/android/fragments/videos/VideoAddHelper$1$2$1;->this$2:Lcom/vkontakte/android/fragments/videos/VideoAddHelper$1$2;

    iput-object p3, p0, Lcom/vkontakte/android/fragments/videos/VideoAddHelper$1$2$1;->val$add:Ljava/util/ArrayList;

    iput-object p4, p0, Lcom/vkontakte/android/fragments/videos/VideoAddHelper$1$2$1;->val$remove:Ljava/util/ArrayList;

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/ResultlessCallback;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public success()V
    .locals 6

    .prologue
    .line 96
    iget-object v1, p0, Lcom/vkontakte/android/fragments/videos/VideoAddHelper$1$2$1;->this$2:Lcom/vkontakte/android/fragments/videos/VideoAddHelper$1$2;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/videos/VideoAddHelper$1$2;->val$dlg:Landroid/app/AlertDialog;

    invoke-static {v1}, Lcom/vkontakte/android/ViewUtils;->dismissDialogSafety(Landroid/app/Dialog;)V

    .line 97
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v1, "com.vkontakte.android.RELOAD_VIDEO_ALBUMS"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 98
    .local v0, "intent":Landroid/content/Intent;
    const-string/jumbo v1, "target_id"

    iget-object v2, p0, Lcom/vkontakte/android/fragments/videos/VideoAddHelper$1$2$1;->this$2:Lcom/vkontakte/android/fragments/videos/VideoAddHelper$1$2;

    iget-object v2, v2, Lcom/vkontakte/android/fragments/videos/VideoAddHelper$1$2;->this$1:Lcom/vkontakte/android/fragments/videos/VideoAddHelper$1;

    iget v2, v2, Lcom/vkontakte/android/fragments/videos/VideoAddHelper$1;->val$targetID:I

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 99
    iget-object v1, p0, Lcom/vkontakte/android/fragments/videos/VideoAddHelper$1$2$1;->this$2:Lcom/vkontakte/android/fragments/videos/VideoAddHelper$1$2;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/videos/VideoAddHelper$1$2;->this$1:Lcom/vkontakte/android/fragments/videos/VideoAddHelper$1;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/videos/VideoAddHelper$1;->this$0:Lcom/vkontakte/android/fragments/videos/VideoAddHelper;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/videos/VideoAddHelper;->access$000(Lcom/vkontakte/android/fragments/videos/VideoAddHelper;)Landroid/content/Context;

    move-result-object v1

    const-string/jumbo v2, "com.vkontakte.android.permission.ACCESS_DATA"

    invoke-virtual {v1, v0, v2}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 100
    iget-object v1, p0, Lcom/vkontakte/android/fragments/videos/VideoAddHelper$1$2$1;->this$2:Lcom/vkontakte/android/fragments/videos/VideoAddHelper$1$2;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/videos/VideoAddHelper$1$2;->this$1:Lcom/vkontakte/android/fragments/videos/VideoAddHelper$1;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/videos/VideoAddHelper$1;->this$0:Lcom/vkontakte/android/fragments/videos/VideoAddHelper;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/videos/VideoAddHelper;->access$000(Lcom/vkontakte/android/fragments/videos/VideoAddHelper;)Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f08074f

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    iget-object v5, p0, Lcom/vkontakte/android/fragments/videos/VideoAddHelper$1$2$1;->this$2:Lcom/vkontakte/android/fragments/videos/VideoAddHelper$1$2;

    iget-object v5, v5, Lcom/vkontakte/android/fragments/videos/VideoAddHelper$1$2;->this$1:Lcom/vkontakte/android/fragments/videos/VideoAddHelper$1;

    iget-object v5, v5, Lcom/vkontakte/android/fragments/videos/VideoAddHelper$1;->val$video:Lcom/vkontakte/android/api/VideoFile;

    iget-object v5, v5, Lcom/vkontakte/android/api/VideoFile;->title:Ljava/lang/String;

    aput-object v5, v3, v4

    .line 101
    invoke-virtual {v1, v2, v3}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 100
    invoke-static {v1}, Lcom/vk/core/util/ToastUtils;->showToast(Ljava/lang/String;)V

    .line 102
    iget-object v1, p0, Lcom/vkontakte/android/fragments/videos/VideoAddHelper$1$2$1;->this$2:Lcom/vkontakte/android/fragments/videos/VideoAddHelper$1$2;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/videos/VideoAddHelper$1$2;->this$1:Lcom/vkontakte/android/fragments/videos/VideoAddHelper$1;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/videos/VideoAddHelper$1;->this$0:Lcom/vkontakte/android/fragments/videos/VideoAddHelper;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/videos/VideoAddHelper;->access$000(Lcom/vkontakte/android/fragments/videos/VideoAddHelper;)Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/fragments/videos/VideoAddHelper$1$2$1;->this$2:Lcom/vkontakte/android/fragments/videos/VideoAddHelper$1$2;

    iget-object v2, v2, Lcom/vkontakte/android/fragments/videos/VideoAddHelper$1$2;->this$1:Lcom/vkontakte/android/fragments/videos/VideoAddHelper$1;

    iget-object v2, v2, Lcom/vkontakte/android/fragments/videos/VideoAddHelper$1;->val$video:Lcom/vkontakte/android/api/VideoFile;

    iget-object v3, p0, Lcom/vkontakte/android/fragments/videos/VideoAddHelper$1$2$1;->this$2:Lcom/vkontakte/android/fragments/videos/VideoAddHelper$1$2;

    iget-object v3, v3, Lcom/vkontakte/android/fragments/videos/VideoAddHelper$1$2;->this$1:Lcom/vkontakte/android/fragments/videos/VideoAddHelper$1;

    iget v3, v3, Lcom/vkontakte/android/fragments/videos/VideoAddHelper$1;->val$targetID:I

    iget-object v4, p0, Lcom/vkontakte/android/fragments/videos/VideoAddHelper$1$2$1;->val$add:Ljava/util/ArrayList;

    iget-object v5, p0, Lcom/vkontakte/android/fragments/videos/VideoAddHelper$1$2$1;->val$remove:Ljava/util/ArrayList;

    invoke-static {v1, v2, v3, v4, v5}, Lcom/vkontakte/android/fragments/videos/Videos;->notifyVideoMoved(Landroid/content/Context;Lcom/vkontakte/android/api/VideoFile;ILjava/util/List;Ljava/util/List;)V

    .line 103
    return-void
.end method
