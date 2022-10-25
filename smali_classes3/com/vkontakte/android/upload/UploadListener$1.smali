.class Lcom/vkontakte/android/upload/UploadListener$1;
.super Landroid/content/BroadcastReceiver;
.source "UploadListener.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/upload/UploadListener;->createBroadcastReceiver(I)Landroid/content/BroadcastReceiver;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/upload/UploadListener;

.field final synthetic val$targetId:I


# direct methods
.method constructor <init>(Lcom/vkontakte/android/upload/UploadListener;I)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/upload/UploadListener;

    .prologue
    .line 44
    iput-object p1, p0, Lcom/vkontakte/android/upload/UploadListener$1;->this$0:Lcom/vkontakte/android/upload/UploadListener;

    iput p2, p0, Lcom/vkontakte/android/upload/UploadListener$1;->val$targetId:I

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v7, 0x0

    const/4 v6, 0x0

    .line 48
    const-string/jumbo v4, "id"

    invoke-virtual {p2, v4, v6}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    .line 49
    .local v1, "id":I
    iget v4, p0, Lcom/vkontakte/android/upload/UploadListener$1;->val$targetId:I

    if-eq v1, v4, :cond_1

    .line 82
    :cond_0
    :goto_0
    return-void

    .line 53
    :cond_1
    const-string/jumbo v4, "com.vkontakte.android.UPLOAD_PROGRESS"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 54
    const-string/jumbo v4, "done"

    invoke-virtual {p2, v4, v6}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    .line 55
    .local v0, "done":I
    const-string/jumbo v4, "total"

    invoke-virtual {p2, v4, v6}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v3

    .line 56
    .local v3, "total":I
    iget-object v4, p0, Lcom/vkontakte/android/upload/UploadListener$1;->this$0:Lcom/vkontakte/android/upload/UploadListener;

    invoke-static {v4}, Lcom/vkontakte/android/upload/UploadListener;->access$000(Lcom/vkontakte/android/upload/UploadListener;)Lcom/vkontakte/android/upload/UploadListener$UploadListenerCallback;

    move-result-object v4

    if-eqz v4, :cond_0

    .line 57
    iget-object v4, p0, Lcom/vkontakte/android/upload/UploadListener$1;->this$0:Lcom/vkontakte/android/upload/UploadListener;

    invoke-static {v4}, Lcom/vkontakte/android/upload/UploadListener;->access$000(Lcom/vkontakte/android/upload/UploadListener;)Lcom/vkontakte/android/upload/UploadListener$UploadListenerCallback;

    move-result-object v4

    iget v5, p0, Lcom/vkontakte/android/upload/UploadListener$1;->val$targetId:I

    invoke-interface {v4, v5, v0, v3}, Lcom/vkontakte/android/upload/UploadListener$UploadListenerCallback;->onProgress(III)V

    goto :goto_0

    .line 60
    .end local v0    # "done":I
    .end local v3    # "total":I
    :cond_2
    const-string/jumbo v4, "com.vkontakte.android.UPLOAD_DONE"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_5

    .line 61
    iget-object v4, p0, Lcom/vkontakte/android/upload/UploadListener$1;->this$0:Lcom/vkontakte/android/upload/UploadListener;

    invoke-static {v4}, Lcom/vkontakte/android/upload/UploadListener;->access$000(Lcom/vkontakte/android/upload/UploadListener;)Lcom/vkontakte/android/upload/UploadListener$UploadListenerCallback;

    move-result-object v4

    if-eqz v4, :cond_3

    .line 62
    const-string/jumbo v4, "result"

    invoke-virtual {p2, v4}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v2

    .line 63
    .local v2, "o":Landroid/os/Parcelable;
    instance-of v4, v2, Lcom/vkontakte/android/attachments/Attachment;

    if-eqz v4, :cond_4

    .line 64
    iget-object v4, p0, Lcom/vkontakte/android/upload/UploadListener$1;->this$0:Lcom/vkontakte/android/upload/UploadListener;

    invoke-static {v4}, Lcom/vkontakte/android/upload/UploadListener;->access$000(Lcom/vkontakte/android/upload/UploadListener;)Lcom/vkontakte/android/upload/UploadListener$UploadListenerCallback;

    move-result-object v4

    check-cast v2, Lcom/vkontakte/android/attachments/Attachment;

    .end local v2    # "o":Landroid/os/Parcelable;
    invoke-interface {v4, v1, v2}, Lcom/vkontakte/android/upload/UploadListener$UploadListenerCallback;->onDone(ILcom/vkontakte/android/attachments/Attachment;)V

    .line 69
    :cond_3
    :goto_1
    iget-object v4, p0, Lcom/vkontakte/android/upload/UploadListener$1;->this$0:Lcom/vkontakte/android/upload/UploadListener;

    invoke-virtual {v4}, Lcom/vkontakte/android/upload/UploadListener;->stopListener()V

    goto :goto_0

    .line 66
    .restart local v2    # "o":Landroid/os/Parcelable;
    :cond_4
    iget-object v4, p0, Lcom/vkontakte/android/upload/UploadListener$1;->this$0:Lcom/vkontakte/android/upload/UploadListener;

    invoke-static {v4}, Lcom/vkontakte/android/upload/UploadListener;->access$000(Lcom/vkontakte/android/upload/UploadListener;)Lcom/vkontakte/android/upload/UploadListener$UploadListenerCallback;

    move-result-object v4

    invoke-interface {v4, v1, v7}, Lcom/vkontakte/android/upload/UploadListener$UploadListenerCallback;->onDone(ILcom/vkontakte/android/attachments/Attachment;)V

    goto :goto_1

    .line 71
    .end local v2    # "o":Landroid/os/Parcelable;
    :cond_5
    const-string/jumbo v4, "com.vkontakte.android.UPLOAD_FAILED"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 72
    iget-object v4, p0, Lcom/vkontakte/android/upload/UploadListener$1;->this$0:Lcom/vkontakte/android/upload/UploadListener;

    invoke-static {v4}, Lcom/vkontakte/android/upload/UploadListener;->access$000(Lcom/vkontakte/android/upload/UploadListener;)Lcom/vkontakte/android/upload/UploadListener$UploadListenerCallback;

    move-result-object v4

    if-eqz v4, :cond_6

    .line 73
    const-string/jumbo v4, "result"

    invoke-virtual {p2, v4}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v2

    .line 74
    .restart local v2    # "o":Landroid/os/Parcelable;
    instance-of v4, v2, Lcom/vkontakte/android/attachments/Attachment;

    if-eqz v4, :cond_7

    .line 75
    iget-object v4, p0, Lcom/vkontakte/android/upload/UploadListener$1;->this$0:Lcom/vkontakte/android/upload/UploadListener;

    invoke-static {v4}, Lcom/vkontakte/android/upload/UploadListener;->access$000(Lcom/vkontakte/android/upload/UploadListener;)Lcom/vkontakte/android/upload/UploadListener$UploadListenerCallback;

    move-result-object v4

    check-cast v2, Lcom/vkontakte/android/attachments/Attachment;

    .end local v2    # "o":Landroid/os/Parcelable;
    invoke-interface {v4, v1, v2}, Lcom/vkontakte/android/upload/UploadListener$UploadListenerCallback;->onFailed(ILcom/vkontakte/android/attachments/Attachment;)V

    .line 80
    :cond_6
    :goto_2
    iget-object v4, p0, Lcom/vkontakte/android/upload/UploadListener$1;->this$0:Lcom/vkontakte/android/upload/UploadListener;

    invoke-virtual {v4}, Lcom/vkontakte/android/upload/UploadListener;->stopListener()V

    goto/16 :goto_0

    .line 77
    .restart local v2    # "o":Landroid/os/Parcelable;
    :cond_7
    iget-object v4, p0, Lcom/vkontakte/android/upload/UploadListener$1;->this$0:Lcom/vkontakte/android/upload/UploadListener;

    invoke-static {v4}, Lcom/vkontakte/android/upload/UploadListener;->access$000(Lcom/vkontakte/android/upload/UploadListener;)Lcom/vkontakte/android/upload/UploadListener$UploadListenerCallback;

    move-result-object v4

    invoke-interface {v4, v1, v7}, Lcom/vkontakte/android/upload/UploadListener$UploadListenerCallback;->onFailed(ILcom/vkontakte/android/attachments/Attachment;)V

    goto :goto_2
.end method
