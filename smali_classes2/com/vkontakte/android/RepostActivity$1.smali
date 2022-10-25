.class Lcom/vkontakte/android/RepostActivity$1;
.super Lcom/vkontakte/android/api/SimpleCallback;
.source "RepostActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/RepostActivity;->doRepostWithComment(ILjava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/SimpleCallback",
        "<",
        "Lcom/vkontakte/android/api/wall/WallRepost$Result;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/RepostActivity;

.field final synthetic val$comment:Ljava/lang/String;

.field final synthetic val$gid:I


# direct methods
.method constructor <init>(Lcom/vkontakte/android/RepostActivity;Landroid/content/Context;ILjava/lang/String;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/RepostActivity;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 218
    iput-object p1, p0, Lcom/vkontakte/android/RepostActivity$1;->this$0:Lcom/vkontakte/android/RepostActivity;

    iput p3, p0, Lcom/vkontakte/android/RepostActivity$1;->val$gid:I

    iput-object p4, p0, Lcom/vkontakte/android/RepostActivity$1;->val$comment:Ljava/lang/String;

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/SimpleCallback;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 1
    .param p1, "err"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 282
    invoke-super {p0, p1}, Lcom/vkontakte/android/api/SimpleCallback;->fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V

    .line 283
    iget-object v0, p0, Lcom/vkontakte/android/RepostActivity$1;->this$0:Lcom/vkontakte/android/RepostActivity;

    invoke-virtual {v0}, Lcom/vkontakte/android/RepostActivity;->finish()V

    .line 284
    return-void
.end method

.method public success(Lcom/vkontakte/android/api/wall/WallRepost$Result;)V
    .locals 11
    .param p1, "res"    # Lcom/vkontakte/android/api/wall/WallRepost$Result;

    .prologue
    const/4 v6, 0x0

    .line 221
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v7

    .line 222
    .local v7, "account":Lcom/vkontakte/android/auth/VKAccount;
    new-instance v9, Lcom/vkontakte/android/NewsEntry;

    iget-object v0, p0, Lcom/vkontakte/android/RepostActivity$1;->this$0:Lcom/vkontakte/android/RepostActivity;

    invoke-static {v0}, Lcom/vkontakte/android/RepostActivity;->access$000(Lcom/vkontakte/android/RepostActivity;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v0

    invoke-direct {v9, v0}, Lcom/vkontakte/android/NewsEntry;-><init>(Lcom/vkontakte/android/NewsEntry;)V

    .line 223
    .local v9, "newPost":Lcom/vkontakte/android/NewsEntry;
    iget v0, p0, Lcom/vkontakte/android/RepostActivity$1;->val$gid:I

    if-nez v0, :cond_0

    .line 224
    iget-object v0, p0, Lcom/vkontakte/android/RepostActivity$1;->this$0:Lcom/vkontakte/android/RepostActivity;

    invoke-static {v0}, Lcom/vkontakte/android/RepostActivity;->access$000(Lcom/vkontakte/android/RepostActivity;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v0

    iget v1, v0, Lcom/vkontakte/android/NewsEntry;->flags:I

    or-int/lit8 v1, v1, 0xc

    iput v1, v0, Lcom/vkontakte/android/NewsEntry;->flags:I

    .line 226
    :cond_0
    iget v0, p1, Lcom/vkontakte/android/api/wall/WallRepost$Result;->postID:I

    iput v0, v9, Lcom/vkontakte/android/NewsEntry;->postID:I

    .line 227
    invoke-static {}, Lcom/vkontakte/android/TimeUtils;->getCurrentTime()I

    move-result v0

    iput v0, v9, Lcom/vkontakte/android/NewsEntry;->time:I

    .line 228
    iget v0, p0, Lcom/vkontakte/android/RepostActivity$1;->val$gid:I

    if-eqz v0, :cond_4

    iget v0, p0, Lcom/vkontakte/android/RepostActivity$1;->val$gid:I

    neg-int v0, v0

    :goto_0
    iput v0, v9, Lcom/vkontakte/android/NewsEntry;->userID:I

    iput v0, v9, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    .line 229
    iget v0, p0, Lcom/vkontakte/android/RepostActivity$1;->val$gid:I

    if-nez v0, :cond_5

    invoke-virtual {v7}, Lcom/vkontakte/android/auth/VKAccount;->getName()Ljava/lang/String;

    move-result-object v0

    :goto_1
    iput-object v0, v9, Lcom/vkontakte/android/NewsEntry;->userName:Ljava/lang/String;

    .line 230
    iget v0, p0, Lcom/vkontakte/android/RepostActivity$1;->val$gid:I

    if-nez v0, :cond_6

    invoke-virtual {v7}, Lcom/vkontakte/android/auth/VKAccount;->getPhoto()Ljava/lang/String;

    move-result-object v0

    :goto_2
    iput-object v0, v9, Lcom/vkontakte/android/NewsEntry;->userPhotoURL:Ljava/lang/String;

    .line 231
    iget-object v0, p0, Lcom/vkontakte/android/RepostActivity$1;->val$comment:Ljava/lang/String;

    iput-object v0, v9, Lcom/vkontakte/android/NewsEntry;->retweetText:Ljava/lang/String;

    .line 232
    iget-object v0, p0, Lcom/vkontakte/android/RepostActivity$1;->this$0:Lcom/vkontakte/android/RepostActivity;

    invoke-static {v0}, Lcom/vkontakte/android/RepostActivity;->access$000(Lcom/vkontakte/android/RepostActivity;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v0

    iget v0, v0, Lcom/vkontakte/android/NewsEntry;->type:I

    iput v0, v9, Lcom/vkontakte/android/NewsEntry;->retweetType:I

    .line 233
    iput v6, v9, Lcom/vkontakte/android/NewsEntry;->numLikes:I

    .line 234
    iput v6, v9, Lcom/vkontakte/android/NewsEntry;->numRetweets:I

    .line 235
    iget v0, v9, Lcom/vkontakte/android/NewsEntry;->flags:I

    and-int/lit8 v0, v0, -0xd

    iput v0, v9, Lcom/vkontakte/android/NewsEntry;->flags:I

    .line 236
    iget v0, v9, Lcom/vkontakte/android/NewsEntry;->flags:I

    or-int/lit16 v0, v0, 0xa2

    iput v0, v9, Lcom/vkontakte/android/NewsEntry;->flags:I

    .line 237
    iget-object v0, p0, Lcom/vkontakte/android/RepostActivity$1;->this$0:Lcom/vkontakte/android/RepostActivity;

    invoke-static {v0}, Lcom/vkontakte/android/RepostActivity;->access$000(Lcom/vkontakte/android/RepostActivity;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v0

    iget-object v0, v0, Lcom/vkontakte/android/NewsEntry;->retweetText:Ljava/lang/String;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/vkontakte/android/RepostActivity$1;->this$0:Lcom/vkontakte/android/RepostActivity;

    invoke-static {v0}, Lcom/vkontakte/android/RepostActivity;->access$000(Lcom/vkontakte/android/RepostActivity;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v0

    iget-object v0, v0, Lcom/vkontakte/android/NewsEntry;->retweetText:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-gtz v0, :cond_2

    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/RepostActivity$1;->this$0:Lcom/vkontakte/android/RepostActivity;

    invoke-static {v0}, Lcom/vkontakte/android/RepostActivity;->access$000(Lcom/vkontakte/android/RepostActivity;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v0

    iget-object v0, v0, Lcom/vkontakte/android/NewsEntry;->repostAttachments:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_7

    .line 238
    :cond_2
    iget-object v0, p0, Lcom/vkontakte/android/RepostActivity$1;->this$0:Lcom/vkontakte/android/RepostActivity;

    invoke-static {v0}, Lcom/vkontakte/android/RepostActivity;->access$000(Lcom/vkontakte/android/RepostActivity;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v0

    iget-object v0, v0, Lcom/vkontakte/android/NewsEntry;->retweetText:Ljava/lang/String;

    iput-object v0, v9, Lcom/vkontakte/android/NewsEntry;->text:Ljava/lang/String;

    .line 239
    iget-object v0, p0, Lcom/vkontakte/android/RepostActivity$1;->this$0:Lcom/vkontakte/android/RepostActivity;

    invoke-static {v0}, Lcom/vkontakte/android/RepostActivity;->access$000(Lcom/vkontakte/android/RepostActivity;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v0

    iget-object v0, v0, Lcom/vkontakte/android/NewsEntry;->repostAttachments:Ljava/util/ArrayList;

    iput-object v0, v9, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    .line 240
    iget-object v0, v9, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_3

    iget-object v0, v9, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    iget-object v1, v9, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    instance-of v0, v0, Lcom/vkontakte/android/attachments/RepostAttachment;

    if-eqz v0, :cond_3

    .line 241
    iget-object v0, v9, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    iget-object v1, v9, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 243
    :cond_3
    iget-object v10, v9, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    new-instance v0, Lcom/vkontakte/android/attachments/RepostAttachment;

    iget-object v1, p0, Lcom/vkontakte/android/RepostActivity$1;->this$0:Lcom/vkontakte/android/RepostActivity;

    invoke-static {v1}, Lcom/vkontakte/android/RepostActivity;->access$000(Lcom/vkontakte/android/RepostActivity;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v1

    iget v1, v1, Lcom/vkontakte/android/NewsEntry;->retweetUID:I

    iget-object v2, p0, Lcom/vkontakte/android/RepostActivity$1;->this$0:Lcom/vkontakte/android/RepostActivity;

    invoke-static {v2}, Lcom/vkontakte/android/RepostActivity;->access$000(Lcom/vkontakte/android/RepostActivity;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v2

    iget v2, v2, Lcom/vkontakte/android/NewsEntry;->retweetOrigId:I

    iget-object v3, p0, Lcom/vkontakte/android/RepostActivity$1;->this$0:Lcom/vkontakte/android/RepostActivity;

    invoke-static {v3}, Lcom/vkontakte/android/RepostActivity;->access$000(Lcom/vkontakte/android/RepostActivity;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v3

    iget v3, v3, Lcom/vkontakte/android/NewsEntry;->retweetOrigTime:I

    iget-object v4, p0, Lcom/vkontakte/android/RepostActivity$1;->this$0:Lcom/vkontakte/android/RepostActivity;

    invoke-static {v4}, Lcom/vkontakte/android/RepostActivity;->access$000(Lcom/vkontakte/android/RepostActivity;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v4

    iget-object v4, v4, Lcom/vkontakte/android/NewsEntry;->retweetUserName:Ljava/lang/String;

    iget-object v5, p0, Lcom/vkontakte/android/RepostActivity$1;->this$0:Lcom/vkontakte/android/RepostActivity;

    invoke-static {v5}, Lcom/vkontakte/android/RepostActivity;->access$000(Lcom/vkontakte/android/RepostActivity;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v5

    iget-object v5, v5, Lcom/vkontakte/android/NewsEntry;->retweetUserPhoto:Ljava/lang/String;

    invoke-direct/range {v0 .. v6}, Lcom/vkontakte/android/attachments/RepostAttachment;-><init>(IIILjava/lang/String;Ljava/lang/String;I)V

    invoke-virtual {v10, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 244
    iget-object v0, p0, Lcom/vkontakte/android/RepostActivity$1;->this$0:Lcom/vkontakte/android/RepostActivity;

    invoke-static {v0}, Lcom/vkontakte/android/RepostActivity;->access$000(Lcom/vkontakte/android/RepostActivity;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v0

    iget v0, v0, Lcom/vkontakte/android/NewsEntry;->postID:I

    iput v0, v9, Lcom/vkontakte/android/NewsEntry;->retweetOrigId:I

    .line 245
    iget-object v0, p0, Lcom/vkontakte/android/RepostActivity$1;->this$0:Lcom/vkontakte/android/RepostActivity;

    invoke-static {v0}, Lcom/vkontakte/android/RepostActivity;->access$000(Lcom/vkontakte/android/RepostActivity;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v0

    iget v0, v0, Lcom/vkontakte/android/NewsEntry;->time:I

    iput v0, v9, Lcom/vkontakte/android/NewsEntry;->retweetOrigTime:I

    .line 246
    iget-object v0, p0, Lcom/vkontakte/android/RepostActivity$1;->this$0:Lcom/vkontakte/android/RepostActivity;

    invoke-static {v0}, Lcom/vkontakte/android/RepostActivity;->access$000(Lcom/vkontakte/android/RepostActivity;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v0

    iget v0, v0, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    iput v0, v9, Lcom/vkontakte/android/NewsEntry;->retweetUID:I

    .line 247
    iget-object v0, p0, Lcom/vkontakte/android/RepostActivity$1;->this$0:Lcom/vkontakte/android/RepostActivity;

    invoke-static {v0}, Lcom/vkontakte/android/RepostActivity;->access$000(Lcom/vkontakte/android/RepostActivity;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v0

    iget-object v0, v0, Lcom/vkontakte/android/NewsEntry;->userName:Ljava/lang/String;

    iput-object v0, v9, Lcom/vkontakte/android/NewsEntry;->retweetUserName:Ljava/lang/String;

    .line 248
    iget-object v0, p0, Lcom/vkontakte/android/RepostActivity$1;->this$0:Lcom/vkontakte/android/RepostActivity;

    invoke-static {v0}, Lcom/vkontakte/android/RepostActivity;->access$000(Lcom/vkontakte/android/RepostActivity;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v0

    iget-object v0, v0, Lcom/vkontakte/android/NewsEntry;->userPhotoURL:Ljava/lang/String;

    iput-object v0, v9, Lcom/vkontakte/android/NewsEntry;->retweetUserPhoto:Ljava/lang/String;

    .line 264
    :goto_3
    invoke-static {v9}, Lcom/vkontakte/android/cache/NewsfeedCache;->addToTop(Lcom/vkontakte/android/NewsEntry;)V

    .line 265
    new-instance v8, Landroid/content/Intent;

    const-string/jumbo v0, "com.vkontakte.android.NEW_POST_ADDED"

    invoke-direct {v8, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 266
    .local v8, "intent":Landroid/content/Intent;
    const-string/jumbo v0, "entry"

    invoke-virtual {v8, v0, v9}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 267
    iget-object v0, p0, Lcom/vkontakte/android/RepostActivity$1;->this$0:Lcom/vkontakte/android/RepostActivity;

    const-string/jumbo v1, "com.vkontakte.android.permission.ACCESS_DATA"

    invoke-virtual {v0, v8, v1}, Lcom/vkontakte/android/RepostActivity;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 268
    iget v0, p0, Lcom/vkontakte/android/RepostActivity$1;->val$gid:I

    if-nez v0, :cond_9

    .line 269
    iget-object v0, p0, Lcom/vkontakte/android/RepostActivity$1;->this$0:Lcom/vkontakte/android/RepostActivity;

    const v1, 0x7f0805ce

    invoke-static {v0, v1, v6}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 273
    :goto_4
    iget-object v0, p0, Lcom/vkontakte/android/RepostActivity$1;->this$0:Lcom/vkontakte/android/RepostActivity;

    invoke-static {v0}, Lcom/vkontakte/android/RepostActivity;->access$000(Lcom/vkontakte/android/RepostActivity;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v0

    iget v1, p1, Lcom/vkontakte/android/api/wall/WallRepost$Result;->retweets:I

    iput v1, v0, Lcom/vkontakte/android/NewsEntry;->numRetweets:I

    .line 274
    iget-object v0, p0, Lcom/vkontakte/android/RepostActivity$1;->this$0:Lcom/vkontakte/android/RepostActivity;

    invoke-static {v0}, Lcom/vkontakte/android/RepostActivity;->access$000(Lcom/vkontakte/android/RepostActivity;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v0

    iget v1, p1, Lcom/vkontakte/android/api/wall/WallRepost$Result;->likes:I

    iput v1, v0, Lcom/vkontakte/android/NewsEntry;->numLikes:I

    .line 275
    iget-object v0, p0, Lcom/vkontakte/android/RepostActivity$1;->this$0:Lcom/vkontakte/android/RepostActivity;

    invoke-static {v0}, Lcom/vkontakte/android/RepostActivity;->access$000(Lcom/vkontakte/android/RepostActivity;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v0

    const-string/jumbo v1, "share_post"

    invoke-static {v0, v1}, Lcom/vkontakte/android/data/Analytics;->sendPromoPostActionByType(Lcom/vkontakte/android/NewsEntry;Ljava/lang/String;)V

    .line 276
    iget-object v0, p0, Lcom/vkontakte/android/RepostActivity$1;->this$0:Lcom/vkontakte/android/RepostActivity;

    invoke-static {v0}, Lcom/vkontakte/android/RepostActivity;->access$300(Lcom/vkontakte/android/RepostActivity;)V

    .line 277
    iget-object v0, p0, Lcom/vkontakte/android/RepostActivity$1;->this$0:Lcom/vkontakte/android/RepostActivity;

    invoke-virtual {v0}, Lcom/vkontakte/android/RepostActivity;->finish()V

    .line 278
    return-void

    .line 228
    .end local v8    # "intent":Landroid/content/Intent;
    :cond_4
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v0

    goto/16 :goto_0

    .line 229
    :cond_5
    iget-object v0, p0, Lcom/vkontakte/android/RepostActivity$1;->this$0:Lcom/vkontakte/android/RepostActivity;

    invoke-static {v0}, Lcom/vkontakte/android/RepostActivity;->access$100(Lcom/vkontakte/android/RepostActivity;)Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_1

    .line 230
    :cond_6
    iget-object v0, p0, Lcom/vkontakte/android/RepostActivity$1;->this$0:Lcom/vkontakte/android/RepostActivity;

    invoke-static {v0}, Lcom/vkontakte/android/RepostActivity;->access$200(Lcom/vkontakte/android/RepostActivity;)Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_2

    .line 250
    :cond_7
    iget-object v0, p0, Lcom/vkontakte/android/RepostActivity$1;->this$0:Lcom/vkontakte/android/RepostActivity;

    invoke-static {v0}, Lcom/vkontakte/android/RepostActivity;->access$000(Lcom/vkontakte/android/RepostActivity;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v0

    const/16 v1, 0x20

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/NewsEntry;->flag(I)Z

    move-result v0

    if-eqz v0, :cond_8

    .line 251
    iget-object v0, p0, Lcom/vkontakte/android/RepostActivity$1;->this$0:Lcom/vkontakte/android/RepostActivity;

    invoke-static {v0}, Lcom/vkontakte/android/RepostActivity;->access$000(Lcom/vkontakte/android/RepostActivity;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v0

    iget v0, v0, Lcom/vkontakte/android/NewsEntry;->retweetOrigId:I

    iput v0, v9, Lcom/vkontakte/android/NewsEntry;->retweetOrigId:I

    .line 252
    iget-object v0, p0, Lcom/vkontakte/android/RepostActivity$1;->this$0:Lcom/vkontakte/android/RepostActivity;

    invoke-static {v0}, Lcom/vkontakte/android/RepostActivity;->access$000(Lcom/vkontakte/android/RepostActivity;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v0

    iget v0, v0, Lcom/vkontakte/android/NewsEntry;->retweetOrigTime:I

    iput v0, v9, Lcom/vkontakte/android/NewsEntry;->retweetOrigTime:I

    .line 253
    iget-object v0, p0, Lcom/vkontakte/android/RepostActivity$1;->this$0:Lcom/vkontakte/android/RepostActivity;

    invoke-static {v0}, Lcom/vkontakte/android/RepostActivity;->access$000(Lcom/vkontakte/android/RepostActivity;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v0

    iget v0, v0, Lcom/vkontakte/android/NewsEntry;->retweetUID:I

    iput v0, v9, Lcom/vkontakte/android/NewsEntry;->retweetUID:I

    .line 254
    iget-object v0, p0, Lcom/vkontakte/android/RepostActivity$1;->this$0:Lcom/vkontakte/android/RepostActivity;

    invoke-static {v0}, Lcom/vkontakte/android/RepostActivity;->access$000(Lcom/vkontakte/android/RepostActivity;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v0

    iget-object v0, v0, Lcom/vkontakte/android/NewsEntry;->retweetUserName:Ljava/lang/String;

    iput-object v0, v9, Lcom/vkontakte/android/NewsEntry;->retweetUserName:Ljava/lang/String;

    .line 255
    iget-object v0, p0, Lcom/vkontakte/android/RepostActivity$1;->this$0:Lcom/vkontakte/android/RepostActivity;

    invoke-static {v0}, Lcom/vkontakte/android/RepostActivity;->access$000(Lcom/vkontakte/android/RepostActivity;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v0

    iget-object v0, v0, Lcom/vkontakte/android/NewsEntry;->retweetUserPhoto:Ljava/lang/String;

    iput-object v0, v9, Lcom/vkontakte/android/NewsEntry;->retweetUserPhoto:Ljava/lang/String;

    goto/16 :goto_3

    .line 257
    :cond_8
    iget-object v0, p0, Lcom/vkontakte/android/RepostActivity$1;->this$0:Lcom/vkontakte/android/RepostActivity;

    invoke-static {v0}, Lcom/vkontakte/android/RepostActivity;->access$000(Lcom/vkontakte/android/RepostActivity;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v0

    iget v0, v0, Lcom/vkontakte/android/NewsEntry;->postID:I

    iput v0, v9, Lcom/vkontakte/android/NewsEntry;->retweetOrigId:I

    .line 258
    iget-object v0, p0, Lcom/vkontakte/android/RepostActivity$1;->this$0:Lcom/vkontakte/android/RepostActivity;

    invoke-static {v0}, Lcom/vkontakte/android/RepostActivity;->access$000(Lcom/vkontakte/android/RepostActivity;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v0

    iget v0, v0, Lcom/vkontakte/android/NewsEntry;->time:I

    iput v0, v9, Lcom/vkontakte/android/NewsEntry;->retweetOrigTime:I

    .line 259
    iget-object v0, p0, Lcom/vkontakte/android/RepostActivity$1;->this$0:Lcom/vkontakte/android/RepostActivity;

    invoke-static {v0}, Lcom/vkontakte/android/RepostActivity;->access$000(Lcom/vkontakte/android/RepostActivity;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v0

    iget v0, v0, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    iput v0, v9, Lcom/vkontakte/android/NewsEntry;->retweetUID:I

    .line 260
    iget-object v0, p0, Lcom/vkontakte/android/RepostActivity$1;->this$0:Lcom/vkontakte/android/RepostActivity;

    invoke-static {v0}, Lcom/vkontakte/android/RepostActivity;->access$000(Lcom/vkontakte/android/RepostActivity;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v0

    iget-object v0, v0, Lcom/vkontakte/android/NewsEntry;->userName:Ljava/lang/String;

    iput-object v0, v9, Lcom/vkontakte/android/NewsEntry;->retweetUserName:Ljava/lang/String;

    .line 261
    iget-object v0, p0, Lcom/vkontakte/android/RepostActivity$1;->this$0:Lcom/vkontakte/android/RepostActivity;

    invoke-static {v0}, Lcom/vkontakte/android/RepostActivity;->access$000(Lcom/vkontakte/android/RepostActivity;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v0

    iget-object v0, v0, Lcom/vkontakte/android/NewsEntry;->userPhotoURL:Ljava/lang/String;

    iput-object v0, v9, Lcom/vkontakte/android/NewsEntry;->retweetUserPhoto:Ljava/lang/String;

    goto/16 :goto_3

    .line 271
    .restart local v8    # "intent":Landroid/content/Intent;
    :cond_9
    iget-object v0, p0, Lcom/vkontakte/android/RepostActivity$1;->this$0:Lcom/vkontakte/android/RepostActivity;

    const v1, 0x7f0805cd

    invoke-static {v0, v1, v6}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto/16 :goto_4
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 218
    check-cast p1, Lcom/vkontakte/android/api/wall/WallRepost$Result;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/RepostActivity$1;->success(Lcom/vkontakte/android/api/wall/WallRepost$Result;)V

    return-void
.end method
