.class Lcom/vkontakte/android/fragments/videos/AddedVideosFragment$1;
.super Landroid/content/BroadcastReceiver;
.source "AddedVideosFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/videos/AddedVideosFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/videos/AddedVideosFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/videos/AddedVideosFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/videos/AddedVideosFragment;

    .prologue
    .line 41
    iput-object p1, p0, Lcom/vkontakte/android/fragments/videos/AddedVideosFragment$1;->this$0:Lcom/vkontakte/android/fragments/videos/AddedVideosFragment;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method synthetic lambda$null$0(Ljava/util/ArrayList;Lcom/vkontakte/android/api/VideoFile;)V
    .locals 2
    .param p1, "users"    # Ljava/util/ArrayList;
    .param p2, "video"    # Lcom/vkontakte/android/api/VideoFile;

    .prologue
    const/4 v1, 0x0

    .line 60
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_0

    .line 61
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/UserProfile;

    iget-object v0, v0, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    iput-object v0, p2, Lcom/vkontakte/android/api/VideoFile;->ownerName:Ljava/lang/String;

    .line 62
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/UserProfile;

    iget-object v0, v0, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    iput-object v0, p2, Lcom/vkontakte/android/api/VideoFile;->ownerPhoto:Ljava/lang/String;

    .line 64
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/videos/AddedVideosFragment$1;->this$0:Lcom/vkontakte/android/fragments/videos/AddedVideosFragment;

    invoke-virtual {v0, p2}, Lcom/vkontakte/android/fragments/videos/AddedVideosFragment;->prepend(Lcom/vkontakte/android/api/VideoFile;)V

    .line 65
    return-void
.end method

.method synthetic lambda$onReceive$1(Lcom/vkontakte/android/api/VideoFile;Ljava/util/ArrayList;)V
    .locals 2
    .param p1, "video"    # Lcom/vkontakte/android/api/VideoFile;
    .param p2, "users"    # Ljava/util/ArrayList;

    .prologue
    .line 57
    iget-object v1, p0, Lcom/vkontakte/android/fragments/videos/AddedVideosFragment$1;->this$0:Lcom/vkontakte/android/fragments/videos/AddedVideosFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/videos/AddedVideosFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 58
    .local v0, "activity":Landroid/app/Activity;
    if-eqz v0, :cond_0

    .line 59
    invoke-static {p0, p2, p1}, Lcom/vkontakte/android/fragments/videos/AddedVideosFragment$1$$Lambda$2;->lambdaFactory$(Lcom/vkontakte/android/fragments/videos/AddedVideosFragment$1;Ljava/util/ArrayList;Lcom/vkontakte/android/api/VideoFile;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 67
    :cond_0
    return-void
.end method

.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 44
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v5

    const/4 v2, -0x1

    invoke-virtual {v5}, Ljava/lang/String;->hashCode()I

    move-result v6

    sparse-switch v6, :sswitch_data_0

    :cond_0
    :goto_0
    packed-switch v2, :pswitch_data_0

    .line 73
    :cond_1
    :goto_1
    return-void

    .line 44
    :sswitch_0
    const-string/jumbo v6, "com.vkontakte.android.VIDEO_ADDED"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    move v2, v3

    goto :goto_0

    :sswitch_1
    const-string/jumbo v6, "com.vkontakte.android.UPLOAD_DONE"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    move v2, v4

    goto :goto_0

    .line 46
    :pswitch_0
    iget-object v2, p0, Lcom/vkontakte/android/fragments/videos/AddedVideosFragment$1;->this$0:Lcom/vkontakte/android/fragments/videos/AddedVideosFragment;

    invoke-virtual {v2}, Lcom/vkontakte/android/fragments/videos/AddedVideosFragment;->getOwnerID()I

    move-result v2

    invoke-static {v2}, Lcom/vkontakte/android/auth/VKAccountManager;->isCurrentUser(I)Z

    move-result v2

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/vkontakte/android/fragments/videos/AddedVideosFragment$1;->this$0:Lcom/vkontakte/android/fragments/videos/AddedVideosFragment;

    iget-boolean v2, v2, Lcom/vkontakte/android/fragments/videos/AddedVideosFragment;->loaded:Z

    if-eqz v2, :cond_1

    .line 47
    iget-object v2, p0, Lcom/vkontakte/android/fragments/videos/AddedVideosFragment$1;->this$0:Lcom/vkontakte/android/fragments/videos/AddedVideosFragment;

    invoke-static {p2}, Lcom/vkontakte/android/fragments/videos/Videos;->extractVideo(Landroid/content/Intent;)Lcom/vkontakte/android/api/VideoFile;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/fragments/videos/AddedVideosFragment;->prepend(Lcom/vkontakte/android/api/VideoFile;)V

    goto :goto_1

    .line 52
    :pswitch_1
    const-string/jumbo v2, "result"

    invoke-virtual {p2, v2}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    .line 53
    .local v0, "o":Landroid/os/Parcelable;
    instance-of v2, v0, Lcom/vkontakte/android/api/VideoFile;

    if-eqz v2, :cond_1

    move-object v1, v0

    .line 54
    check-cast v1, Lcom/vkontakte/android/api/VideoFile;

    .line 55
    .local v1, "video":Lcom/vkontakte/android/api/VideoFile;
    iget v2, v1, Lcom/vkontakte/android/api/VideoFile;->oid:I

    iget-object v5, p0, Lcom/vkontakte/android/fragments/videos/AddedVideosFragment$1;->this$0:Lcom/vkontakte/android/fragments/videos/AddedVideosFragment;

    invoke-virtual {v5}, Lcom/vkontakte/android/fragments/videos/AddedVideosFragment;->getOwnerID()I

    move-result v5

    if-ne v2, v5, :cond_1

    iget-object v2, p0, Lcom/vkontakte/android/fragments/videos/AddedVideosFragment$1;->this$0:Lcom/vkontakte/android/fragments/videos/AddedVideosFragment;

    iget-boolean v2, v2, Lcom/vkontakte/android/fragments/videos/AddedVideosFragment;->loaded:Z

    if-eqz v2, :cond_1

    .line 56
    new-array v2, v4, [Ljava/lang/Integer;

    iget v4, v1, Lcom/vkontakte/android/api/VideoFile;->oid:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-static {p0, v1}, Lcom/vkontakte/android/fragments/videos/AddedVideosFragment$1$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/fragments/videos/AddedVideosFragment$1;Lcom/vkontakte/android/api/VideoFile;)Lcom/vkontakte/android/data/Friends$GetUsersCallback;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/vkontakte/android/data/Friends;->getUsers(Ljava/util/Collection;Lcom/vkontakte/android/data/Friends$GetUsersCallback;)V

    goto :goto_1

    .line 44
    :sswitch_data_0
    .sparse-switch
        -0x704adf63 -> :sswitch_0
        0x48be93a1 -> :sswitch_1
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
