.class Lcom/vkontakte/android/activities/BaseVideoActivity$1;
.super Landroid/content/BroadcastReceiver;
.source "BaseVideoActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/activities/BaseVideoActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/activities/BaseVideoActivity;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/activities/BaseVideoActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/activities/BaseVideoActivity;

    .prologue
    .line 73
    iput-object p1, p0, Lcom/vkontakte/android/activities/BaseVideoActivity$1;->this$0:Lcom/vkontakte/android/activities/BaseVideoActivity;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v4, 0x0

    .line 76
    iget-object v2, p0, Lcom/vkontakte/android/activities/BaseVideoActivity$1;->this$0:Lcom/vkontakte/android/activities/BaseVideoActivity;

    invoke-static {v2}, Lcom/vkontakte/android/activities/BaseVideoActivity;->access$000(Lcom/vkontakte/android/activities/BaseVideoActivity;)Lcom/vkontakte/android/api/VideoFile;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 77
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 78
    .local v0, "action":Ljava/lang/String;
    const-string/jumbo v2, "com.vkontakte.android.POST_UPDATED"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    iget-object v2, p0, Lcom/vkontakte/android/activities/BaseVideoActivity$1;->this$0:Lcom/vkontakte/android/activities/BaseVideoActivity;

    .line 79
    invoke-static {v2}, Lcom/vkontakte/android/activities/BaseVideoActivity;->access$000(Lcom/vkontakte/android/activities/BaseVideoActivity;)Lcom/vkontakte/android/api/VideoFile;

    move-result-object v2

    iget v2, v2, Lcom/vkontakte/android/api/VideoFile;->oid:I

    const-string/jumbo v3, "owner_id"

    invoke-virtual {p2, v3, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v3

    if-ne v2, v3, :cond_3

    iget-object v2, p0, Lcom/vkontakte/android/activities/BaseVideoActivity$1;->this$0:Lcom/vkontakte/android/activities/BaseVideoActivity;

    .line 80
    invoke-static {v2}, Lcom/vkontakte/android/activities/BaseVideoActivity;->access$000(Lcom/vkontakte/android/activities/BaseVideoActivity;)Lcom/vkontakte/android/api/VideoFile;

    move-result-object v2

    iget v2, v2, Lcom/vkontakte/android/api/VideoFile;->vid:I

    const-string/jumbo v3, "post_id"

    invoke-virtual {p2, v3, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v3

    if-ne v2, v3, :cond_3

    const/4 v2, 0x2

    const-string/jumbo v3, "post_type"

    .line 81
    invoke-virtual {p2, v3, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v3

    if-ne v2, v3, :cond_3

    .line 82
    const-string/jumbo v2, "liked"

    invoke-virtual {p2, v2, v4}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v1

    .line 83
    .local v1, "liked":Z
    iget-object v2, p0, Lcom/vkontakte/android/activities/BaseVideoActivity$1;->this$0:Lcom/vkontakte/android/activities/BaseVideoActivity;

    invoke-static {v2}, Lcom/vkontakte/android/activities/BaseVideoActivity;->access$000(Lcom/vkontakte/android/activities/BaseVideoActivity;)Lcom/vkontakte/android/api/VideoFile;

    move-result-object v2

    iget-boolean v2, v2, Lcom/vkontakte/android/api/VideoFile;->liked:Z

    if-eq v1, v2, :cond_1

    .line 84
    iget-object v2, p0, Lcom/vkontakte/android/activities/BaseVideoActivity$1;->this$0:Lcom/vkontakte/android/activities/BaseVideoActivity;

    invoke-static {v2}, Lcom/vkontakte/android/activities/BaseVideoActivity;->access$000(Lcom/vkontakte/android/activities/BaseVideoActivity;)Lcom/vkontakte/android/api/VideoFile;

    move-result-object v2

    iput-boolean v1, v2, Lcom/vkontakte/android/api/VideoFile;->liked:Z

    .line 85
    iget-object v2, p0, Lcom/vkontakte/android/activities/BaseVideoActivity$1;->this$0:Lcom/vkontakte/android/activities/BaseVideoActivity;

    invoke-static {v2}, Lcom/vkontakte/android/activities/BaseVideoActivity;->access$000(Lcom/vkontakte/android/activities/BaseVideoActivity;)Lcom/vkontakte/android/api/VideoFile;

    move-result-object v3

    iget v4, v3, Lcom/vkontakte/android/api/VideoFile;->likes:I

    iget-object v2, p0, Lcom/vkontakte/android/activities/BaseVideoActivity$1;->this$0:Lcom/vkontakte/android/activities/BaseVideoActivity;

    invoke-static {v2}, Lcom/vkontakte/android/activities/BaseVideoActivity;->access$000(Lcom/vkontakte/android/activities/BaseVideoActivity;)Lcom/vkontakte/android/api/VideoFile;

    move-result-object v2

    iget-boolean v2, v2, Lcom/vkontakte/android/api/VideoFile;->liked:Z

    if-eqz v2, :cond_2

    const/4 v2, 0x1

    :goto_0
    add-int/2addr v2, v4

    iput v2, v3, Lcom/vkontakte/android/api/VideoFile;->likes:I

    .line 86
    iget-object v2, p0, Lcom/vkontakte/android/activities/BaseVideoActivity$1;->this$0:Lcom/vkontakte/android/activities/BaseVideoActivity;

    invoke-static {v2}, Lcom/vkontakte/android/activities/BaseVideoActivity;->access$100(Lcom/vkontakte/android/activities/BaseVideoActivity;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 87
    iget-object v2, p0, Lcom/vkontakte/android/activities/BaseVideoActivity$1;->this$0:Lcom/vkontakte/android/activities/BaseVideoActivity;

    invoke-static {v2}, Lcom/vkontakte/android/activities/BaseVideoActivity;->access$100(Lcom/vkontakte/android/activities/BaseVideoActivity;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v2

    iget-object v3, p0, Lcom/vkontakte/android/activities/BaseVideoActivity$1;->this$0:Lcom/vkontakte/android/activities/BaseVideoActivity;

    invoke-static {v3}, Lcom/vkontakte/android/activities/BaseVideoActivity;->access$000(Lcom/vkontakte/android/activities/BaseVideoActivity;)Lcom/vkontakte/android/api/VideoFile;

    move-result-object v3

    iget v3, v3, Lcom/vkontakte/android/api/VideoFile;->likes:I

    iput v3, v2, Lcom/vkontakte/android/NewsEntry;->numLikes:I

    .line 88
    iget-object v2, p0, Lcom/vkontakte/android/activities/BaseVideoActivity$1;->this$0:Lcom/vkontakte/android/activities/BaseVideoActivity;

    invoke-static {v2}, Lcom/vkontakte/android/activities/BaseVideoActivity;->access$100(Lcom/vkontakte/android/activities/BaseVideoActivity;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v2

    const/16 v3, 0x8

    iget-object v4, p0, Lcom/vkontakte/android/activities/BaseVideoActivity$1;->this$0:Lcom/vkontakte/android/activities/BaseVideoActivity;

    invoke-static {v4}, Lcom/vkontakte/android/activities/BaseVideoActivity;->access$000(Lcom/vkontakte/android/activities/BaseVideoActivity;)Lcom/vkontakte/android/api/VideoFile;

    move-result-object v4

    iget-boolean v4, v4, Lcom/vkontakte/android/api/VideoFile;->liked:Z

    invoke-virtual {v2, v3, v4}, Lcom/vkontakte/android/NewsEntry;->flag(IZ)V

    .line 90
    :cond_0
    iget-object v2, p0, Lcom/vkontakte/android/activities/BaseVideoActivity$1;->this$0:Lcom/vkontakte/android/activities/BaseVideoActivity;

    invoke-virtual {v2}, Lcom/vkontakte/android/activities/BaseVideoActivity;->onLikeStateChanged()V

    .line 91
    iget-object v2, p0, Lcom/vkontakte/android/activities/BaseVideoActivity$1;->this$0:Lcom/vkontakte/android/activities/BaseVideoActivity;

    invoke-virtual {v2}, Lcom/vkontakte/android/activities/BaseVideoActivity;->invalidateOptionsMenu()V

    .line 92
    iget-object v2, p0, Lcom/vkontakte/android/activities/BaseVideoActivity$1;->this$0:Lcom/vkontakte/android/activities/BaseVideoActivity;

    iget-object v3, p0, Lcom/vkontakte/android/activities/BaseVideoActivity$1;->this$0:Lcom/vkontakte/android/activities/BaseVideoActivity;

    invoke-static {v3}, Lcom/vkontakte/android/activities/BaseVideoActivity;->access$000(Lcom/vkontakte/android/activities/BaseVideoActivity;)Lcom/vkontakte/android/api/VideoFile;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/activities/BaseVideoActivity;->bindInfo(Lcom/vkontakte/android/api/VideoFile;)V

    .line 98
    .end local v0    # "action":Ljava/lang/String;
    .end local v1    # "liked":Z
    :cond_1
    :goto_1
    return-void

    .line 85
    .restart local v0    # "action":Ljava/lang/String;
    .restart local v1    # "liked":Z
    :cond_2
    const/4 v2, -0x1

    goto :goto_0

    .line 94
    .end local v1    # "liked":Z
    :cond_3
    const-string/jumbo v2, "com.vkontakte.android.VIDEO_MOVED"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 95
    iget-object v2, p0, Lcom/vkontakte/android/activities/BaseVideoActivity$1;->this$0:Lcom/vkontakte/android/activities/BaseVideoActivity;

    invoke-static {v2}, Lcom/vkontakte/android/activities/BaseVideoActivity;->access$200(Lcom/vkontakte/android/activities/BaseVideoActivity;)V

    goto :goto_1
.end method
