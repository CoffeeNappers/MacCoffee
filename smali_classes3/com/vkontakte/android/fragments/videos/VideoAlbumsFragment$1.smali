.class Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment$1;
.super Landroid/content/BroadcastReceiver;
.source "VideoAlbumsFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment;

    .prologue
    .line 64
    iput-object p1, p0, Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment$1;->this$0:Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v3, 0x0

    .line 67
    const-string/jumbo v1, "com.vkontakte.android.RELOAD_VIDEO_ALBUMS"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 68
    const-string/jumbo v1, "target_id"

    invoke-virtual {p2, v1, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    iget-object v2, p0, Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment$1;->this$0:Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment;

    iget v2, v2, Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment;->mOwnerId:I

    if-ne v1, v2, :cond_0

    .line 69
    iget-object v1, p0, Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment$1;->this$0:Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment;->access$000(Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment;)V

    .line 72
    :cond_0
    const-string/jumbo v1, "com.vkontakte.android.VIDEO_ALBUM_CREATED"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment$1;->this$0:Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment;

    iget-boolean v1, v1, Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment;->loaded:Z

    if-eqz v1, :cond_1

    .line 73
    invoke-static {p2}, Lcom/vkontakte/android/fragments/videos/Videos;->extractAlbum(Landroid/content/Intent;)Lcom/vkontakte/android/api/VideoAlbum;

    move-result-object v0

    .line 74
    .local v0, "album":Lcom/vkontakte/android/api/VideoAlbum;
    if-eqz v0, :cond_1

    iget-object v1, p0, Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment$1;->this$0:Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment;

    iget v1, v1, Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment;->mOwnerId:I

    iget v2, v0, Lcom/vkontakte/android/api/VideoAlbum;->ownerID:I

    if-ne v1, v2, :cond_1

    .line 75
    iget-object v1, p0, Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment$1;->this$0:Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment;->access$100(Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1, v3, v0}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 76
    iget-object v1, p0, Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment$1;->this$0:Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment;->access$200(Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment;)Lcom/vkontakte/android/fragments/base/GridFragment$GridAdapter;

    move-result-object v1

    invoke-virtual {v1, v3}, Lcom/vkontakte/android/fragments/base/GridFragment$GridAdapter;->notifyItemInserted(I)V

    .line 79
    .end local v0    # "album":Lcom/vkontakte/android/api/VideoAlbum;
    :cond_1
    return-void
.end method
