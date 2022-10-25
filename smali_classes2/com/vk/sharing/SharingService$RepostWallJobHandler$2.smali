.class Lcom/vk/sharing/SharingService$RepostWallJobHandler$2;
.super Ljava/lang/Object;
.source "SharingService.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/sharing/SharingService$RepostWallJobHandler;->doWallRepostSync(ILcom/vk/sharing/attachment/AttachmentInfo;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vkontakte/android/api/Callback",
        "<",
        "Lcom/vkontakte/android/api/wall/WallRepost$Result;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/sharing/SharingService$RepostWallJobHandler;

.field final synthetic val$info:Lcom/vk/sharing/attachment/AttachmentInfo;


# direct methods
.method constructor <init>(Lcom/vk/sharing/SharingService$RepostWallJobHandler;Lcom/vk/sharing/attachment/AttachmentInfo;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/sharing/SharingService$RepostWallJobHandler;

    .prologue
    .line 342
    iput-object p1, p0, Lcom/vk/sharing/SharingService$RepostWallJobHandler$2;->this$0:Lcom/vk/sharing/SharingService$RepostWallJobHandler;

    iput-object p2, p0, Lcom/vk/sharing/SharingService$RepostWallJobHandler$2;->val$info:Lcom/vk/sharing/attachment/AttachmentInfo;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 2
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 361
    const-string/jumbo v0, "vk"

    invoke-virtual {p1}, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 362
    return-void
.end method

.method public success(Lcom/vkontakte/android/api/wall/WallRepost$Result;)V
    .locals 10
    .param p1, "result"    # Lcom/vkontakte/android/api/wall/WallRepost$Result;

    .prologue
    .line 345
    const-string/jumbo v3, "vk"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "reposted successfully: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget v9, p1, Lcom/vkontakte/android/api/wall/WallRepost$Result;->postID:I

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v3, v8}, Lcom/vkontakte/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 346
    iget-object v3, p0, Lcom/vk/sharing/SharingService$RepostWallJobHandler$2;->val$info:Lcom/vk/sharing/attachment/AttachmentInfo;

    invoke-virtual {v3}, Lcom/vk/sharing/attachment/AttachmentInfo;->getMediaId()I

    move-result v1

    .local v1, "postId":I
    iget-object v3, p0, Lcom/vk/sharing/SharingService$RepostWallJobHandler$2;->val$info:Lcom/vk/sharing/attachment/AttachmentInfo;

    invoke-virtual {v3}, Lcom/vk/sharing/attachment/AttachmentInfo;->getOwnerId()I

    move-result v0

    .local v0, "ownerId":I
    iget v2, p1, Lcom/vkontakte/android/api/wall/WallRepost$Result;->likes:I

    .local v2, "likes":I
    iget v4, p1, Lcom/vkontakte/android/api/wall/WallRepost$Result;->retweets:I

    .line 347
    .local v4, "reposts":I
    iget-object v3, p0, Lcom/vk/sharing/SharingService$RepostWallJobHandler$2;->this$0:Lcom/vk/sharing/SharingService$RepostWallJobHandler;

    invoke-virtual {v3}, Lcom/vk/sharing/SharingService$RepostWallJobHandler;->liked()Z

    move-result v5

    .local v5, "liked":Z
    iget-object v3, p0, Lcom/vk/sharing/SharingService$RepostWallJobHandler$2;->this$0:Lcom/vk/sharing/SharingService$RepostWallJobHandler;

    invoke-virtual {v3}, Lcom/vk/sharing/SharingService$RepostWallJobHandler;->reposted()Z

    move-result v6

    .line 348
    .local v6, "reposted":Z
    new-instance v3, Landroid/content/Intent;

    const-string/jumbo v8, "com.vkontakte.android.POST_UPDATED"

    invoke-direct {v3, v8}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string/jumbo v8, "post_id"

    .line 349
    invoke-virtual {v3, v8, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    move-result-object v3

    const-string/jumbo v8, "owner_id"

    .line 350
    invoke-virtual {v3, v8, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    move-result-object v3

    const-string/jumbo v8, "retweets"

    .line 351
    invoke-virtual {v3, v8, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    move-result-object v3

    const-string/jumbo v8, "likes"

    .line 352
    invoke-virtual {v3, v8, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    move-result-object v3

    const-string/jumbo v8, "liked"

    .line 353
    invoke-virtual {v3, v8, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    move-result-object v3

    const-string/jumbo v8, "retweeted"

    .line 354
    invoke-virtual {v3, v8, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    move-result-object v7

    .line 355
    .local v7, "intent":Landroid/content/Intent;
    sget-object v3, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const-string/jumbo v8, "com.vkontakte.android.permission.ACCESS_DATA"

    invoke-virtual {v3, v7, v8}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 356
    const/4 v3, -0x1

    invoke-static/range {v0 .. v6}, Lcom/vkontakte/android/cache/NewsfeedCache;->update(IIIIIZZ)V

    .line 357
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 342
    check-cast p1, Lcom/vkontakte/android/api/wall/WallRepost$Result;

    invoke-virtual {p0, p1}, Lcom/vk/sharing/SharingService$RepostWallJobHandler$2;->success(Lcom/vkontakte/android/api/wall/WallRepost$Result;)V

    return-void
.end method
