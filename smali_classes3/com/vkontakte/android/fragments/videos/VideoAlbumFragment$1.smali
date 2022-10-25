.class Lcom/vkontakte/android/fragments/videos/VideoAlbumFragment$1;
.super Landroid/content/BroadcastReceiver;
.source "VideoAlbumFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/videos/VideoAlbumFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/videos/VideoAlbumFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/videos/VideoAlbumFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/videos/VideoAlbumFragment;

    .prologue
    .line 29
    iput-object p1, p0, Lcom/vkontakte/android/fragments/videos/VideoAlbumFragment$1;->this$0:Lcom/vkontakte/android/fragments/videos/VideoAlbumFragment;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v5, 0x0

    .line 32
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v6

    const/4 v4, -0x1

    invoke-virtual {v6}, Ljava/lang/String;->hashCode()I

    move-result v7

    packed-switch v7, :pswitch_data_0

    :cond_0
    :goto_0
    packed-switch v4, :pswitch_data_1

    .line 49
    :cond_1
    :goto_1
    return-void

    .line 32
    :pswitch_0
    const-string/jumbo v7, "com.vkontakte.android.VIDEO_MOVED"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    move v4, v5

    goto :goto_0

    .line 34
    :pswitch_1
    invoke-static {p2}, Lcom/vkontakte/android/fragments/videos/Videos;->extractVideo(Landroid/content/Intent;)Lcom/vkontakte/android/api/VideoFile;

    move-result-object v3

    .line 35
    .local v3, "video":Lcom/vkontakte/android/api/VideoFile;
    const-string/jumbo v4, "target_id"

    invoke-virtual {p2, v4, v5}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    .line 36
    .local v2, "targetId":I
    const-string/jumbo v4, "add"

    invoke-virtual {p2, v4}, Landroid/content/Intent;->getIntArrayExtra(Ljava/lang/String;)[I

    move-result-object v0

    .line 37
    .local v0, "add":[I
    const-string/jumbo v4, "remove"

    invoke-virtual {p2, v4}, Landroid/content/Intent;->getIntArrayExtra(Ljava/lang/String;)[I

    move-result-object v1

    .line 38
    .local v1, "remove":[I
    iget-object v4, p0, Lcom/vkontakte/android/fragments/videos/VideoAlbumFragment$1;->this$0:Lcom/vkontakte/android/fragments/videos/VideoAlbumFragment;

    invoke-virtual {v4}, Lcom/vkontakte/android/fragments/videos/VideoAlbumFragment;->getOwnerID()I

    move-result v4

    if-ne v2, v4, :cond_1

    .line 39
    iget-object v4, p0, Lcom/vkontakte/android/fragments/videos/VideoAlbumFragment$1;->this$0:Lcom/vkontakte/android/fragments/videos/VideoAlbumFragment;

    iget v4, v4, Lcom/vkontakte/android/fragments/videos/VideoAlbumFragment;->mAlbumId:I

    invoke-static {v1, v4}, Lcom/vkontakte/android/functions/Functions;->contains([II)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 40
    iget-object v4, p0, Lcom/vkontakte/android/fragments/videos/VideoAlbumFragment$1;->this$0:Lcom/vkontakte/android/fragments/videos/VideoAlbumFragment;

    iget v5, v3, Lcom/vkontakte/android/api/VideoFile;->oid:I

    iget v6, v3, Lcom/vkontakte/android/api/VideoFile;->vid:I

    invoke-virtual {v4, v5, v6}, Lcom/vkontakte/android/fragments/videos/VideoAlbumFragment;->removeItem(II)V

    .line 42
    :cond_2
    iget-object v4, p0, Lcom/vkontakte/android/fragments/videos/VideoAlbumFragment$1;->this$0:Lcom/vkontakte/android/fragments/videos/VideoAlbumFragment;

    iget v4, v4, Lcom/vkontakte/android/fragments/videos/VideoAlbumFragment;->mAlbumId:I

    invoke-static {v0, v4}, Lcom/vkontakte/android/functions/Functions;->contains([II)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 43
    iget-object v4, p0, Lcom/vkontakte/android/fragments/videos/VideoAlbumFragment$1;->this$0:Lcom/vkontakte/android/fragments/videos/VideoAlbumFragment;

    invoke-virtual {v4, v3}, Lcom/vkontakte/android/fragments/videos/VideoAlbumFragment;->prepend(Lcom/vkontakte/android/api/VideoFile;)V

    goto :goto_1

    .line 32
    :pswitch_data_0
    .packed-switch -0x6f9c81b0
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_1
    .end packed-switch
.end method
