.class Lcom/vk/sharing/SharingService$RepostWallJobHandler;
.super Lcom/vk/sharing/SharingService$JobHandler;
.source "SharingService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/sharing/SharingService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "RepostWallJobHandler"
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 274
    invoke-direct {p0}, Lcom/vk/sharing/SharingService$JobHandler;-><init>()V

    return-void
.end method

.method private doWallPostSync(ILcom/vk/sharing/attachment/AttachmentInfo;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 5
    .param p1, "ownerId"    # I
    .param p2, "info"    # Lcom/vk/sharing/attachment/AttachmentInfo;
    .param p3, "text"    # Ljava/lang/String;
    .param p4, "trackCode"    # Ljava/lang/String;

    .prologue
    .line 313
    new-instance v2, Lcom/vkontakte/android/api/VKAPIRequest;

    const-string/jumbo v3, "execute.wallPost"

    invoke-direct {v2, v3}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    const-string/jumbo v3, "owner_id"

    .line 314
    invoke-virtual {v2, v3, p1}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v2

    const-string/jumbo v3, "from_group"

    const/4 v4, 0x1

    .line 315
    invoke-virtual {v2, v3, v4}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v2

    const-string/jumbo v3, "attachments"

    .line 316
    invoke-static {p2}, Lcom/vk/sharing/attachment/Attachments;->toString(Lcom/vk/sharing/attachment/AttachmentInfo;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v2

    const-string/jumbo v3, "message"

    .line 317
    invoke-virtual {v2, v3, p3}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v2

    new-instance v3, Lcom/vk/sharing/SharingService$RepostWallJobHandler$1;

    invoke-direct {v3, p0}, Lcom/vk/sharing/SharingService$RepostWallJobHandler$1;-><init>(Lcom/vk/sharing/SharingService$RepostWallJobHandler;)V

    .line 318
    invoke-virtual {v2, v3}, Lcom/vkontakte/android/api/VKAPIRequest;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 329
    .local v0, "request":Lcom/vkontakte/android/api/VKAPIRequest;, "Lcom/vkontakte/android/api/VKAPIRequest<Lorg/json/JSONObject;>;"
    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 330
    const-string/jumbo v2, "track_code"

    invoke-virtual {v0, v2, p4}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 332
    :cond_0
    invoke-virtual {v0}, Lcom/vkontakte/android/api/VKAPIRequest;->execSync()Z

    move-result v1

    .line 334
    .local v1, "result":Z
    return v1
.end method

.method private doWallRepostSync(ILcom/vk/sharing/attachment/AttachmentInfo;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 7
    .param p1, "ownerId"    # I
    .param p2, "info"    # Lcom/vk/sharing/attachment/AttachmentInfo;
    .param p3, "text"    # Ljava/lang/String;
    .param p4, "referrer"    # Ljava/lang/String;
    .param p5, "trackCode"    # Ljava/lang/String;

    .prologue
    .line 342
    new-instance v0, Lcom/vkontakte/android/api/wall/WallRepost;

    invoke-static {p2}, Lcom/vk/sharing/attachment/Attachments;->toString(Lcom/vk/sharing/attachment/AttachmentInfo;)Ljava/lang/String;

    move-result-object v1

    move v2, p1

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-direct/range {v0 .. v5}, Lcom/vkontakte/android/api/wall/WallRepost;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    new-instance v1, Lcom/vk/sharing/SharingService$RepostWallJobHandler$2;

    invoke-direct {v1, p0, p2}, Lcom/vk/sharing/SharingService$RepostWallJobHandler$2;-><init>(Lcom/vk/sharing/SharingService$RepostWallJobHandler;Lcom/vk/sharing/attachment/AttachmentInfo;)V

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/wall/WallRepost;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 364
    invoke-virtual {v0}, Lcom/vkontakte/android/api/VKAPIRequest;->execSync()Z

    move-result v6

    .line 367
    .local v6, "result":Z
    return v6
.end method


# virtual methods
.method getGroupId(Landroid/content/Intent;)I
    .locals 1
    .param p1, "intent"    # Landroid/content/Intent;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 382
    const/4 v0, 0x0

    return v0
.end method

.method liked()Z
    .locals 1

    .prologue
    .line 386
    const/4 v0, 0x1

    return v0
.end method

.method onFailed()V
    .locals 1

    .prologue
    .line 373
    const v0, 0x7f08067b

    invoke-static {v0}, Lcom/vk/core/util/ToastUtils;->showToast(I)V

    .line 374
    return-void
.end method

.method public final onHandle(Landroid/content/Intent;)Z
    .locals 10
    .param p1, "intent"    # Landroid/content/Intent;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 278
    const-string/jumbo v0, "attachment_info"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v2

    check-cast v2, Lcom/vk/sharing/attachment/AttachmentInfo;

    .line 279
    .local v2, "info":Lcom/vk/sharing/attachment/AttachmentInfo;
    const-string/jumbo v0, "text"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 280
    .local v3, "text":Ljava/lang/String;
    const-string/jumbo v0, "referer"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 281
    .local v4, "referer":Ljava/lang/String;
    invoke-virtual {v2}, Lcom/vk/sharing/attachment/AttachmentInfo;->getData()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v9, "trackCode"

    invoke-virtual {v0, v9}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 283
    .local v5, "trackCode":Ljava/lang/String;
    const/4 v6, 0x0

    .line 285
    .local v6, "result":Z
    invoke-virtual {p0, p1}, Lcom/vk/sharing/SharingService$RepostWallJobHandler;->getGroupId(Landroid/content/Intent;)I

    move-result v0

    neg-int v1, v0

    .line 287
    .local v1, "ownerId":I
    invoke-virtual {v2}, Lcom/vk/sharing/attachment/AttachmentInfo;->getType()I

    move-result v0

    const/16 v9, 0xa

    if-ne v0, v9, :cond_0

    .line 290
    invoke-direct {p0, v1, v2, v3, v5}, Lcom/vk/sharing/SharingService$RepostWallJobHandler;->doWallPostSync(ILcom/vk/sharing/attachment/AttachmentInfo;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v6

    .line 296
    :goto_0
    if-eqz v6, :cond_1

    const/4 v0, 0x2

    invoke-virtual {v2}, Lcom/vk/sharing/attachment/AttachmentInfo;->getType()I

    move-result v9

    if-ne v0, v9, :cond_1

    .line 297
    invoke-virtual {v2}, Lcom/vk/sharing/attachment/AttachmentInfo;->getData()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v9, "stats"

    invoke-virtual {v0, v9}, Landroid/os/Bundle;->getParcelableArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v8

    .line 298
    .local v8, "stats":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/statistics/Statistic;>;"
    if-eqz v8, :cond_1

    .line 299
    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/vkontakte/android/statistics/Statistic;

    .line 300
    .local v7, "stat":Lcom/vkontakte/android/statistics/Statistic;
    const-string/jumbo v9, "share_post"

    invoke-static {v7, v9}, Lcom/vkontakte/android/data/Analytics;->sendPromoActionByType(Lcom/vkontakte/android/statistics/Statistic;Ljava/lang/String;)V

    goto :goto_1

    .end local v7    # "stat":Lcom/vkontakte/android/statistics/Statistic;
    .end local v8    # "stats":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/statistics/Statistic;>;"
    :cond_0
    move-object v0, p0

    .line 293
    invoke-direct/range {v0 .. v5}, Lcom/vk/sharing/SharingService$RepostWallJobHandler;->doWallRepostSync(ILcom/vk/sharing/attachment/AttachmentInfo;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v6

    goto :goto_0

    .line 305
    :cond_1
    return v6
.end method

.method onSuccess()V
    .locals 1

    .prologue
    .line 378
    const v0, 0x7f08067d

    invoke-static {v0}, Lcom/vk/core/util/ToastUtils;->showToast(I)V

    .line 379
    return-void
.end method

.method reposted()Z
    .locals 1

    .prologue
    .line 390
    const/4 v0, 0x1

    return v0
.end method
