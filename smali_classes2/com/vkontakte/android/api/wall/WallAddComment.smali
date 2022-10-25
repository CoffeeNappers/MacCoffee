.class public Lcom/vkontakte/android/api/wall/WallAddComment;
.super Lcom/vkontakte/android/api/VKAPIRequest;
.source "WallAddComment.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/VKAPIRequest",
        "<",
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# static fields
.field private static final methods:[Ljava/lang/String;


# instance fields
.field type:I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 18
    const/4 v0, 0x5

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string/jumbo v2, "wall.addComment"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string/jumbo v2, "photos.createComment"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string/jumbo v2, "video.createComment"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const/4 v2, 0x0

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string/jumbo v2, "board.addComment"

    aput-object v2, v0, v1

    sput-object v0, Lcom/vkontakte/android/api/wall/WallAddComment;->methods:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/vkontakte/android/NewsEntry;Ljava/lang/String;ILjava/util/List;Ljava/lang/String;ILjava/lang/String;)V
    .locals 8
    .param p1, "entry"    # Lcom/vkontakte/android/NewsEntry;
    .param p2, "text"    # Ljava/lang/String;
    .param p3, "replyTo"    # I
    .param p5, "accessKey"    # Ljava/lang/String;
    .param p6, "fromGroupId"    # I
    .param p7, "refer"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vkontakte/android/NewsEntry;",
            "Ljava/lang/String;",
            "I",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/attachments/Attachment;",
            ">;",
            "Ljava/lang/String;",
            "I",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 25
    .local p4, "attachments":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/attachments/Attachment;>;"
    sget-object v3, Lcom/vkontakte/android/api/wall/WallAddComment;->methods:[Ljava/lang/String;

    iget v4, p1, Lcom/vkontakte/android/NewsEntry;->type:I

    aget-object v3, v3, v4

    invoke-direct {p0, v3}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    .line 27
    iget v1, p1, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    .line 28
    .local v1, "ownerID":I
    iget v2, p1, Lcom/vkontakte/android/NewsEntry;->postID:I

    .line 29
    .local v2, "postID":I
    iget v3, p1, Lcom/vkontakte/android/NewsEntry;->type:I

    iput v3, p0, Lcom/vkontakte/android/api/wall/WallAddComment;->type:I

    .line 31
    const-string/jumbo v3, "ref"

    invoke-virtual {p0, v3, p7}, Lcom/vkontakte/android/api/wall/WallAddComment;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 33
    invoke-virtual {p1}, Lcom/vkontakte/android/NewsEntry;->hasTrackCode()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 34
    const-string/jumbo v3, "track_code"

    invoke-virtual {p1}, Lcom/vkontakte/android/NewsEntry;->getTrackCode()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v3, v4}, Lcom/vkontakte/android/api/wall/WallAddComment;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 37
    :cond_0
    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    sget-object v5, Lcom/vkontakte/android/api/wall/WallAddComment;->methods:[Ljava/lang/String;

    iget v6, p0, Lcom/vkontakte/android/api/wall/WallAddComment;->type:I

    aget-object v5, v5, v6

    aput-object v5, v3, v4

    const/4 v4, 0x1

    aput-object p7, v3, v4

    invoke-static {v3}, Lcom/vkontakte/android/utils/L;->d([Ljava/lang/Object;)V

    .line 39
    const/4 v3, -0x1

    if-ne p3, v3, :cond_1

    .line 40
    const/4 p3, 0x0

    .line 43
    :cond_1
    invoke-interface {p4}, Ljava/util/List;->size()I

    move-result v3

    if-lez v3, :cond_2

    const/4 v3, 0x0

    invoke-interface {p4, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    instance-of v3, v3, Lcom/vkontakte/android/attachments/StickerAttachment;

    if-eqz v3, :cond_2

    .line 44
    const/4 v3, 0x0

    invoke-interface {p4, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/attachments/StickerAttachment;

    .line 45
    .local v0, "att":Lcom/vkontakte/android/attachments/StickerAttachment;
    new-instance p4, Ljava/util/ArrayList;

    .end local p4    # "attachments":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/attachments/Attachment;>;"
    invoke-direct {p4}, Ljava/util/ArrayList;-><init>()V

    .line 46
    .restart local p4    # "attachments":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/attachments/Attachment;>;"
    const-string/jumbo v3, "sticker_id"

    iget v4, v0, Lcom/vkontakte/android/attachments/StickerAttachment;->id:I

    invoke-virtual {p0, v3, v4}, Lcom/vkontakte/android/api/wall/WallAddComment;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 47
    iget-object v3, v0, Lcom/vkontakte/android/attachments/StickerAttachment;->stickerReferrer:Ljava/lang/String;

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_2

    .line 48
    const-string/jumbo v3, "sticker_referrer"

    iget-object v4, v0, Lcom/vkontakte/android/attachments/StickerAttachment;->stickerReferrer:Ljava/lang/String;

    invoke-virtual {p0, v3, v4}, Lcom/vkontakte/android/api/wall/WallAddComment;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 52
    .end local v0    # "att":Lcom/vkontakte/android/attachments/StickerAttachment;
    :cond_2
    iget v3, p0, Lcom/vkontakte/android/api/wall/WallAddComment;->type:I

    if-nez v3, :cond_3

    .line 53
    const-string/jumbo v3, "owner_id"

    invoke-virtual {p0, v3, v1}, Lcom/vkontakte/android/api/wall/WallAddComment;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v3

    const-string/jumbo v4, "post_id"

    invoke-virtual {v3, v4, v2}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v3

    const-string/jumbo v4, "text"

    invoke-virtual {v3, v4, p2}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v3

    const-string/jumbo v4, "reply_to_comment"

    invoke-virtual {v3, v4, p3}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v3

    const-string/jumbo v4, "attachments"

    const-string/jumbo v5, ","

    invoke-static {v5, p4}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 56
    :cond_3
    iget v3, p0, Lcom/vkontakte/android/api/wall/WallAddComment;->type:I

    const/4 v4, 0x1

    if-ne v3, v4, :cond_4

    .line 57
    const-string/jumbo v3, "owner_id"

    invoke-virtual {p0, v3, v1}, Lcom/vkontakte/android/api/wall/WallAddComment;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v3

    const-string/jumbo v4, "photo_id"

    invoke-virtual {v3, v4, v2}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v3

    const-string/jumbo v4, "message"

    invoke-virtual {v3, v4, p2}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v3

    const-string/jumbo v4, "reply_to_comment"

    invoke-virtual {v3, v4, p3}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v3

    const-string/jumbo v4, "attachments"

    const-string/jumbo v5, ","

    invoke-static {v5, p4}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 60
    :cond_4
    iget v3, p0, Lcom/vkontakte/android/api/wall/WallAddComment;->type:I

    const/4 v4, 0x2

    if-ne v3, v4, :cond_5

    .line 61
    const-string/jumbo v3, "owner_id"

    invoke-virtual {p0, v3, v1}, Lcom/vkontakte/android/api/wall/WallAddComment;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v3

    const-string/jumbo v4, "video_id"

    invoke-virtual {v3, v4, v2}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v3

    const-string/jumbo v4, "message"

    invoke-virtual {v3, v4, p2}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v3

    const-string/jumbo v4, "reply_to_comment"

    invoke-virtual {v3, v4, p3}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v3

    const-string/jumbo v4, "attachments"

    const-string/jumbo v5, ","

    invoke-static {v5, p4}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 64
    :cond_5
    iget v3, p0, Lcom/vkontakte/android/api/wall/WallAddComment;->type:I

    const/4 v4, 0x4

    if-ne v3, v4, :cond_6

    .line 65
    const-string/jumbo v3, "group_id"

    neg-int v4, v1

    invoke-virtual {p0, v3, v4}, Lcom/vkontakte/android/api/wall/WallAddComment;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v3

    const-string/jumbo v4, "topic_id"

    invoke-virtual {v3, v4, v2}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v3

    const-string/jumbo v4, "text"

    const-string/jumbo v5, "\\[id(\\d+)\\|([^\\]]+)\\]"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "[post"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, "|$2]"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p2, v5, v6}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v3

    const-string/jumbo v4, "attachments"

    const-string/jumbo v5, ","

    invoke-static {v5, p4}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 68
    :cond_6
    if-eqz p5, :cond_7

    .line 69
    const-string/jumbo v3, "access_key"

    invoke-virtual {p0, v3, p5}, Lcom/vkontakte/android/api/wall/WallAddComment;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 72
    :cond_7
    if-eqz p6, :cond_8

    .line 74
    iget v3, p0, Lcom/vkontakte/android/api/wall/WallAddComment;->type:I

    if-nez v3, :cond_9

    .line 75
    const-string/jumbo v3, "from_group"

    invoke-virtual {p0, v3, p6}, Lcom/vkontakte/android/api/wall/WallAddComment;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 81
    :cond_8
    :goto_0
    return-void

    .line 78
    :cond_9
    const-string/jumbo v3, "from_group"

    const/4 v4, 0x1

    invoke-virtual {p0, v3, v4}, Lcom/vkontakte/android/api/wall/WallAddComment;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    goto :goto_0
.end method


# virtual methods
.method public parse(Lorg/json/JSONObject;)Ljava/lang/Integer;
    .locals 3
    .param p1, "o"    # Lorg/json/JSONObject;

    .prologue
    .line 85
    :try_start_0
    iget-object v1, p0, Lcom/vkontakte/android/api/wall/WallAddComment;->callback:Lcom/vkontakte/android/api/Callback;

    if-eqz v1, :cond_3

    .line 86
    iget v1, p0, Lcom/vkontakte/android/api/wall/WallAddComment;->type:I

    if-nez v1, :cond_0

    .line 87
    const-string/jumbo v1, "response"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    const-string/jumbo v2, "comment_id"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 102
    :goto_0
    return-object v1

    .line 89
    :cond_0
    iget v1, p0, Lcom/vkontakte/android/api/wall/WallAddComment;->type:I

    const/4 v2, 0x1

    if-ne v1, v2, :cond_1

    .line 90
    const-string/jumbo v1, "response"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    goto :goto_0

    .line 92
    :cond_1
    iget v1, p0, Lcom/vkontakte/android/api/wall/WallAddComment;->type:I

    const/4 v2, 0x2

    if-ne v1, v2, :cond_2

    .line 93
    const-string/jumbo v1, "response"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    goto :goto_0

    .line 95
    :cond_2
    iget v1, p0, Lcom/vkontakte/android/api/wall/WallAddComment;->type:I

    const/4 v2, 0x4

    if-ne v1, v2, :cond_3

    .line 96
    const-string/jumbo v1, "response"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    goto :goto_0

    .line 99
    :catch_0
    move-exception v0

    .line 100
    .local v0, "x":Ljava/lang/Exception;
    const-string/jumbo v1, "vk"

    invoke-static {v1, v0}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 102
    .end local v0    # "x":Ljava/lang/Exception;
    :cond_3
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public bridge synthetic parse(Lorg/json/JSONObject;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 17
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/api/wall/WallAddComment;->parse(Lorg/json/JSONObject;)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method
