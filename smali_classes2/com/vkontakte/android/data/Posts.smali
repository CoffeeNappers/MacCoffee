.class public Lcom/vkontakte/android/data/Posts;
.super Ljava/lang/Object;
.source "Posts.java"


# static fields
.field public static final ACTION_NEW_POST_BROADCAST:Ljava/lang/String; = "com.vkontakte.android.NEW_POST_ADDED"

.field public static final ACTION_POST_DELETED_BROADCAST:Ljava/lang/String; = "com.vkontakte.android.POST_DELETED"

.field public static final ACTION_POST_REPLACED_BROADCAST:Ljava/lang/String; = "com.vkontakte.android.POST_REPLACED"

.field public static final ACTION_POST_UPDATED_BROADCAST:Ljava/lang/String; = "com.vkontakte.android.POST_UPDATED"

.field public static final ACTION_RELOAD_FEED:Ljava/lang/String; = "com.vkontakte.android.RELOAD_FEED"

.field public static final ACTION_RELOAD_PROFILE:Ljava/lang/String; = "com.vkontakte.android.RELOAD_PROFILE"

.field public static final ACTION_SUGGESTED_POST_PUBLISHED_BROADCAST:Ljava/lang/String; = "com.vkontakte.android.POST_DELETED"

.field public static final ACTION_USER_NAME_CHANGED:Ljava/lang/String; = "com.vkontakte.android.USER_NAME_CHANGED"

.field public static final ACTION_USER_PHOTO_CHANGED:Ljava/lang/String; = "com.vkontakte.android.USER_PHOTO_CHANGED"

.field public static feed:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/NewsEntry;",
            ">;"
        }
    .end annotation
.end field

.field public static feedClearForNew:Z

.field public static feedFrom:Ljava/lang/String;

.field public static feedItem:I

.field public static feedItemOffset:I

.field public static feedOffset:I

.field private static liking:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field public static newNews:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/NewsEntry;",
            ">;"
        }
    .end annotation
.end field

.field public static newNewsFrom:Ljava/lang/String;

.field public static preloadedFeed:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/NewsEntry;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 85
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/vkontakte/android/data/Posts;->feed:Ljava/util/List;

    .line 86
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/vkontakte/android/data/Posts;->preloadedFeed:Ljava/util/List;

    .line 87
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/vkontakte/android/data/Posts;->newNews:Ljava/util/List;

    .line 92
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/vkontakte/android/data/Posts;->liking:Ljava/util/ArrayList;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 73
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000()Ljava/util/ArrayList;
    .locals 1

    .prologue
    .line 73
    sget-object v0, Lcom/vkontakte/android/data/Posts;->liking:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$100(Lcom/vkontakte/android/NewsEntry;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/NewsEntry;

    .prologue
    .line 73
    invoke-static {p0}, Lcom/vkontakte/android/data/Posts;->broadcastPostUpdate(Lcom/vkontakte/android/NewsEntry;)V

    return-void
.end method

.method private static broadcastPostUpdate(Lcom/vkontakte/android/NewsEntry;)V
    .locals 8
    .param p0, "post"    # Lcom/vkontakte/android/NewsEntry;

    .prologue
    const/16 v5, 0x8

    const/4 v6, 0x4

    .line 594
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v1, "com.vkontakte.android.POST_UPDATED"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string/jumbo v1, "post_id"

    iget v2, p0, Lcom/vkontakte/android/NewsEntry;->postID:I

    .line 595
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    move-result-object v0

    const-string/jumbo v1, "owner_id"

    iget v2, p0, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    .line 596
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    move-result-object v0

    const-string/jumbo v1, "post_type"

    iget v2, p0, Lcom/vkontakte/android/NewsEntry;->type:I

    .line 597
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    move-result-object v0

    const-string/jumbo v1, "comments"

    iget v2, p0, Lcom/vkontakte/android/NewsEntry;->numComments:I

    .line 598
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    move-result-object v0

    const-string/jumbo v1, "retweets"

    iget v2, p0, Lcom/vkontakte/android/NewsEntry;->numRetweets:I

    .line 599
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    move-result-object v0

    const-string/jumbo v1, "likes"

    iget v2, p0, Lcom/vkontakte/android/NewsEntry;->numLikes:I

    .line 600
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    move-result-object v0

    const-string/jumbo v1, "liked"

    .line 601
    invoke-virtual {p0, v5}, Lcom/vkontakte/android/NewsEntry;->flag(I)Z

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    move-result-object v0

    const-string/jumbo v1, "retweeted"

    .line 602
    invoke-virtual {p0, v6}, Lcom/vkontakte/android/NewsEntry;->flag(I)Z

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    move-result-object v7

    .line 603
    .local v7, "intent":Landroid/content/Intent;
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const-string/jumbo v1, "com.vkontakte.android.permission.ACCESS_DATA"

    invoke-virtual {v0, v7, v1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 604
    iget v0, p0, Lcom/vkontakte/android/NewsEntry;->type:I

    if-nez v0, :cond_0

    .line 605
    iget v0, p0, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    iget v1, p0, Lcom/vkontakte/android/NewsEntry;->postID:I

    iget v2, p0, Lcom/vkontakte/android/NewsEntry;->numLikes:I

    iget v3, p0, Lcom/vkontakte/android/NewsEntry;->numComments:I

    iget v4, p0, Lcom/vkontakte/android/NewsEntry;->numRetweets:I

    invoke-virtual {p0, v5}, Lcom/vkontakte/android/NewsEntry;->flag(I)Z

    move-result v5

    invoke-virtual {p0, v6}, Lcom/vkontakte/android/NewsEntry;->flag(I)Z

    move-result v6

    invoke-static/range {v0 .. v6}, Lcom/vkontakte/android/cache/NewsfeedCache;->update(IIIIIZZ)V

    .line 607
    :cond_0
    return-void
.end method

.method public static buildAttachItems(Ljava/util/List;Lcom/vkontakte/android/NewsEntry;Ljava/lang/String;ZILcom/vkontakte/android/data/PostInteract;)Ljava/util/List;
    .locals 40
    .param p1, "e"    # Lcom/vkontakte/android/NewsEntry;
    .param p2, "referer"    # Ljava/lang/String;
    .param p3, "fromList"    # Z
    .param p4, "listPos"    # I
    .param p5, "postInteract"    # Lcom/vkontakte/android/data/PostInteract;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/attachments/Attachment;",
            ">;",
            "Lcom/vkontakte/android/NewsEntry;",
            "Ljava/lang/String;",
            "ZI",
            "Lcom/vkontakte/android/data/PostInteract;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/ui/posts/PostDisplayItem;",
            ">;"
        }
    .end annotation

    .prologue
    .line 150
    .local p0, "attachments":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/attachments/Attachment;>;"
    move-object/from16 v0, p1

    iget v0, v0, Lcom/vkontakte/android/NewsEntry;->postID:I

    move/from16 v34, v0

    .line 151
    .local v34, "postID":I
    move-object/from16 v0, p1

    iget v0, v0, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    move/from16 v31, v0

    .line 153
    .local v31, "ownerID":I
    new-instance v36, Ljava/util/ArrayList;

    invoke-direct/range {v36 .. v36}, Ljava/util/ArrayList;-><init>()V

    .line 154
    .local v36, "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/ui/posts/PostDisplayItem;>;"
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 155
    .local v5, "tAtts":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/attachments/ThumbAttachment;>;"
    new-instance v21, Ljava/util/ArrayList;

    invoke-direct/range {v21 .. v21}, Ljava/util/ArrayList;-><init>()V

    .line 156
    .local v21, "audios":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/attachments/AudioAttachment;>;"
    new-instance v28, Ljava/util/ArrayList;

    invoke-direct/range {v28 .. v28}, Ljava/util/ArrayList;-><init>()V

    .line 157
    .local v28, "markets":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/attachments/Attachment;>;"
    new-instance v27, Ljava/util/ArrayList;

    invoke-direct/range {v27 .. v27}, Ljava/util/ArrayList;-><init>()V

    .line 158
    .local v27, "marketAlbums":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/attachments/Attachment;>;"
    const/16 v20, 0x0

    .line 159
    .local v20, "audioPlaylists":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/attachments/Attachment;>;"
    new-instance v29, Ljava/util/ArrayList;

    invoke-direct/range {v29 .. v29}, Ljava/util/ArrayList;-><init>()V

    .line 160
    .local v29, "other":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/attachments/Attachment;>;"
    new-instance v30, Ljava/util/ArrayList;

    invoke-direct/range {v30 .. v30}, Ljava/util/ArrayList;-><init>()V

    .line 161
    .local v30, "other2":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/attachments/Attachment;>;"
    new-instance v22, Ljava/util/ArrayList;

    invoke-direct/range {v22 .. v22}, Ljava/util/ArrayList;-><init>()V

    .line 162
    .local v22, "common":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/attachments/Attachment;>;"
    new-instance v37, Ljava/util/ArrayList;

    invoke-direct/range {v37 .. v37}, Ljava/util/ArrayList;-><init>()V

    .line 163
    .local v37, "sig":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/attachments/Attachment;>;"
    const/16 v35, 0x0

    .line 164
    .local v35, "repost":Lcom/vkontakte/android/attachments/RepostAttachment;
    const/16 v23, 0x0

    .line 165
    .local v23, "docCount":I
    const/16 v25, 0x0

    .line 166
    .local v25, "lastDocument":Lcom/vkontakte/android/attachments/DocumentAttachment;
    const/16 v39, 0x0

    .line 167
    .local v39, "videoCount":I
    const/16 v26, 0x0

    .line 168
    .local v26, "lastVideo":Lcom/vkontakte/android/attachments/VideoAttachment;
    invoke-interface/range {p0 .. p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_0
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_20

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Lcom/vkontakte/android/attachments/Attachment;

    .line 169
    .local v19, "att":Lcom/vkontakte/android/attachments/Attachment;
    if-eqz v19, :cond_0

    .line 172
    move-object/from16 v0, v19

    instance-of v3, v0, Lcom/vkontakte/android/attachments/VideoAttachment;

    if-eqz v3, :cond_3

    move-object/from16 v26, v19

    .line 173
    check-cast v26, Lcom/vkontakte/android/attachments/VideoAttachment;

    .line 174
    add-int/lit8 v39, v39, 0x1

    .line 180
    :cond_1
    :goto_1
    move-object/from16 v0, v19

    instance-of v3, v0, Lcom/vkontakte/android/attachments/MarketAlbumAttachment;

    if-eqz v3, :cond_4

    .line 181
    move-object/from16 v0, v27

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 235
    :cond_2
    :goto_2
    move-object/from16 v0, v19

    instance-of v3, v0, Lcom/vkontakte/android/attachments/LinkAttachment;

    if-eqz v3, :cond_1e

    .line 236
    check-cast v19, Lcom/vkontakte/android/attachments/LinkAttachment;

    .end local v19    # "att":Lcom/vkontakte/android/attachments/Attachment;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "post?"

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move/from16 v0, v31

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const/16 v7, 0x5f

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    move/from16 v0, v34

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, v19

    iput-object v3, v0, Lcom/vkontakte/android/attachments/LinkAttachment;->referWiki:Ljava/lang/String;

    goto :goto_0

    .line 175
    .restart local v19    # "att":Lcom/vkontakte/android/attachments/Attachment;
    :cond_3
    move-object/from16 v0, v19

    instance-of v3, v0, Lcom/vkontakte/android/attachments/ShitAttachment;

    if-eqz v3, :cond_1

    move-object/from16 v3, v19

    check-cast v3, Lcom/vkontakte/android/attachments/ShitAttachment;

    iget-object v3, v3, Lcom/vkontakte/android/attachments/ShitAttachment;->video:Lcom/vkontakte/android/attachments/VideoAttachment;

    if-eqz v3, :cond_1

    move-object/from16 v3, v19

    .line 176
    check-cast v3, Lcom/vkontakte/android/attachments/ShitAttachment;

    iget-object v0, v3, Lcom/vkontakte/android/attachments/ShitAttachment;->video:Lcom/vkontakte/android/attachments/VideoAttachment;

    move-object/from16 v26, v0

    .line 177
    add-int/lit8 v39, v39, 0x1

    goto :goto_1

    .line 182
    :cond_4
    move-object/from16 v0, v19

    instance-of v3, v0, Lcom/vkontakte/android/attachments/ThumbAttachment;

    if-eqz v3, :cond_5

    move-object/from16 v3, v19

    .line 183
    check-cast v3, Lcom/vkontakte/android/attachments/ThumbAttachment;

    invoke-virtual {v5, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 184
    :cond_5
    move-object/from16 v0, v19

    instance-of v3, v0, Lcom/vkontakte/android/attachments/AudioAttachment;

    if-eqz v3, :cond_6

    move-object/from16 v3, v19

    .line 185
    check-cast v3, Lcom/vkontakte/android/attachments/AudioAttachment;

    move-object/from16 v0, v21

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 186
    :cond_6
    move-object/from16 v0, v19

    instance-of v3, v0, Lcom/vkontakte/android/attachments/SignatureLinkAttachment;

    if-eqz v3, :cond_7

    .line 187
    move-object/from16 v0, v37

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 188
    :cond_7
    move-object/from16 v0, v19

    instance-of v3, v0, Lcom/vkontakte/android/attachments/GeoAttachment;

    if-eqz v3, :cond_8

    move-object/from16 v3, v19

    check-cast v3, Lcom/vkontakte/android/attachments/GeoAttachment;

    iget v3, v3, Lcom/vkontakte/android/attachments/GeoAttachment;->style:I

    const/4 v7, 0x1

    if-ne v3, v7, :cond_8

    .line 189
    move-object/from16 v0, v37

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_2

    .line 190
    :cond_8
    move-object/from16 v0, v19

    instance-of v3, v0, Lcom/vkontakte/android/attachments/RepostAttachment;

    if-eqz v3, :cond_9

    move-object/from16 v35, v19

    .line 191
    check-cast v35, Lcom/vkontakte/android/attachments/RepostAttachment;

    goto/16 :goto_2

    .line 192
    :cond_9
    move-object/from16 v0, v19

    instance-of v3, v0, Lcom/vkontakte/android/attachments/PollAttachment;

    if-eqz v3, :cond_a

    .line 193
    move-object/from16 v0, v30

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_2

    .line 194
    :cond_a
    move-object/from16 v0, v19

    instance-of v3, v0, Lcom/vkontakte/android/attachments/MarketAttachment;

    if-eqz v3, :cond_b

    .line 195
    move-object/from16 v0, v28

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_2

    .line 196
    :cond_b
    move-object/from16 v0, v19

    instance-of v3, v0, Lcom/vkontakte/android/attachments/StickerAttachment;

    if-nez v3, :cond_c

    move-object/from16 v0, v19

    instance-of v3, v0, Lcom/vkontakte/android/attachments/GraffitiAttachment;

    if-eqz v3, :cond_d

    .line 197
    :cond_c
    move-object/from16 v0, v29

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_2

    .line 198
    :cond_d
    move-object/from16 v0, v19

    instance-of v3, v0, Lcom/vkontakte/android/attachments/SnippetAttachment;

    if-eqz v3, :cond_e

    move-object/from16 v3, v19

    .line 199
    check-cast v3, Lcom/vkontakte/android/attachments/SnippetAttachment;

    move-object/from16 v0, p5

    invoke-virtual {v3, v0}, Lcom/vkontakte/android/attachments/SnippetAttachment;->setReferData(Lcom/vkontakte/android/data/PostInteract;)V

    .line 200
    move-object/from16 v0, v30

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_2

    .line 201
    :cond_e
    move-object/from16 v0, v19

    instance-of v3, v0, Lcom/vkontakte/android/attachments/GeoAttachment;

    if-eqz v3, :cond_f

    move-object/from16 v3, v19

    check-cast v3, Lcom/vkontakte/android/attachments/GeoAttachment;

    iget v3, v3, Lcom/vkontakte/android/attachments/GeoAttachment;->style:I

    const/4 v7, 0x3

    if-eq v3, v7, :cond_10

    :cond_f
    move-object/from16 v0, v19

    instance-of v3, v0, Lcom/vkontakte/android/attachments/PollAttachment;

    if-eqz v3, :cond_11

    .line 202
    :cond_10
    move-object/from16 v0, v30

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_2

    .line 203
    :cond_11
    move-object/from16 v0, v19

    instance-of v3, v0, Lcom/vkontakte/android/attachments/ShitAttachment;

    if-eqz v3, :cond_12

    move-object/from16 v0, p1

    iget v3, v0, Lcom/vkontakte/android/NewsEntry;->type:I

    const/16 v7, 0xb

    if-ne v3, v7, :cond_0

    if-eqz p3, :cond_0

    .line 205
    :cond_12
    move-object/from16 v0, v19

    instance-of v3, v0, Lcom/vkontakte/android/attachments/ShitAttachment;

    if-eqz v3, :cond_14

    move-object/from16 v0, p1

    iget v3, v0, Lcom/vkontakte/android/NewsEntry;->type:I

    const/16 v7, 0xb

    if-ne v3, v7, :cond_14

    .line 206
    invoke-virtual/range {v36 .. v36}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-nez v3, :cond_2

    move-object/from16 v3, v19

    .line 207
    check-cast v3, Lcom/vkontakte/android/attachments/ShitAttachment;

    iget-object v3, v3, Lcom/vkontakte/android/attachments/ShitAttachment;->cards:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_13

    new-instance v3, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem;

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    move-object/from16 v2, p5

    invoke-direct {v3, v0, v1, v2}, Lcom/vkontakte/android/ui/posts/ShitBlockPostDisplayItem;-><init>(Lcom/vkontakte/android/NewsEntry;Ljava/lang/String;Lcom/vkontakte/android/data/PostInteract;)V

    :goto_3
    move-object/from16 v0, v36

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_2

    :cond_13
    new-instance v3, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem;

    move-object/from16 v0, p1

    invoke-direct {v3, v0}, Lcom/vkontakte/android/ui/posts/GoodsBlockPostDisplayItem;-><init>(Lcom/vkontakte/android/NewsEntry;)V

    goto :goto_3

    .line 209
    :cond_14
    move-object/from16 v0, v19

    instance-of v3, v0, Lcom/vkontakte/android/attachments/DocumentAttachment;

    if-eqz v3, :cond_15

    move-object/from16 v3, v19

    check-cast v3, Lcom/vkontakte/android/attachments/ImageAttachment;

    invoke-interface {v3}, Lcom/vkontakte/android/attachments/ImageAttachment;->getImageURL()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_17

    :cond_15
    move-object/from16 v0, v19

    instance-of v3, v0, Lcom/vkontakte/android/attachments/GeoAttachment;

    if-eqz v3, :cond_16

    move-object/from16 v3, v19

    check-cast v3, Lcom/vkontakte/android/attachments/GeoAttachment;

    iget v3, v3, Lcom/vkontakte/android/attachments/GeoAttachment;->id:I

    if-lez v3, :cond_17

    :cond_16
    move-object/from16 v0, v19

    instance-of v3, v0, Lcom/vkontakte/android/attachments/ShitAttachment;

    if-eqz v3, :cond_18

    .line 210
    :cond_17
    move-object/from16 v0, v29

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 211
    move-object/from16 v0, v19

    instance-of v3, v0, Lcom/vkontakte/android/attachments/DocumentAttachment;

    if-eqz v3, :cond_2

    .line 212
    add-int/lit8 v23, v23, 0x1

    move-object/from16 v25, v19

    .line 213
    check-cast v25, Lcom/vkontakte/android/attachments/DocumentAttachment;

    goto/16 :goto_2

    .line 215
    :cond_18
    move-object/from16 v0, v19

    instance-of v3, v0, Lcom/vkontakte/android/attachments/FriendsRecommAttachment;

    if-eqz v3, :cond_19

    .line 216
    new-instance v7, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem;

    move-object/from16 v3, v19

    check-cast v3, Lcom/vkontakte/android/attachments/FriendsRecommAttachment;

    move-object/from16 v0, p1

    move/from16 v1, p4

    invoke-direct {v7, v3, v0, v1}, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem;-><init>(Lcom/vkontakte/android/attachments/FriendsRecommAttachment;Lcom/vkontakte/android/NewsEntry;I)V

    move-object/from16 v0, v36

    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_2

    .line 217
    :cond_19
    move-object/from16 v0, v19

    instance-of v3, v0, Lcom/vkontakte/android/attachments/AudioPlaylistAttachment;

    if-eqz v3, :cond_1b

    .line 218
    if-nez v20, :cond_1a

    .line 219
    new-instance v20, Ljava/util/ArrayList;

    .end local v20    # "audioPlaylists":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/attachments/Attachment;>;"
    invoke-direct/range {v20 .. v20}, Ljava/util/ArrayList;-><init>()V

    .line 221
    .restart local v20    # "audioPlaylists":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/attachments/Attachment;>;"
    :cond_1a
    move-object/from16 v0, v20

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_2

    .line 222
    :cond_1b
    move-object/from16 v0, v19

    instance-of v3, v0, Lcom/vkontakte/android/attachments/WidgetAttachment;

    if-eqz v3, :cond_1c

    .line 223
    new-instance v3, Lcom/vkontakte/android/ui/posts/WidgetPostDisplayItem;

    move-object/from16 v0, p1

    invoke-direct {v3, v0}, Lcom/vkontakte/android/ui/posts/WidgetPostDisplayItem;-><init>(Lcom/vkontakte/android/NewsEntry;)V

    move-object/from16 v0, v36

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_2

    .line 224
    :cond_1c
    move-object/from16 v0, v19

    instance-of v3, v0, Lcom/vkontakte/android/attachments/PrettyCardAttachment;

    if-eqz v3, :cond_1d

    .line 225
    move-object/from16 v0, p1

    iget-object v3, v0, Lcom/vkontakte/android/NewsEntry;->extra:Landroid/os/Bundle;

    const-string/jumbo v7, "extras_key_ads_1"

    const/4 v8, 0x0

    invoke-virtual {v3, v7, v8}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v17

    .line 226
    .local v17, "adsId1":I
    move-object/from16 v0, p1

    iget-object v3, v0, Lcom/vkontakte/android/NewsEntry;->extra:Landroid/os/Bundle;

    const-string/jumbo v7, "extras_key_ads_2"

    const/4 v8, 0x0

    invoke-virtual {v3, v7, v8}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v18

    .local v18, "adsId2":I
    move-object/from16 v3, v19

    .line 228
    check-cast v3, Lcom/vkontakte/android/attachments/PrettyCardAttachment;

    move-object/from16 v0, p5

    move/from16 v1, v17

    move/from16 v2, v18

    invoke-virtual {v3, v0, v1, v2}, Lcom/vkontakte/android/attachments/PrettyCardAttachment;->setStatisticsData(Lcom/vkontakte/android/data/PostInteract;II)V

    .line 229
    move-object/from16 v0, v30

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_2

    .line 232
    .end local v17    # "adsId1":I
    .end local v18    # "adsId2":I
    :cond_1d
    move-object/from16 v0, v22

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_2

    .line 237
    :cond_1e
    move-object/from16 v0, v19

    instance-of v3, v0, Lcom/vkontakte/android/attachments/SnippetAttachment;

    if-eqz v3, :cond_1f

    .line 238
    check-cast v19, Lcom/vkontakte/android/attachments/SnippetAttachment;

    .end local v19    # "att":Lcom/vkontakte/android/attachments/Attachment;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "post?"

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move/from16 v0, v31

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const/16 v7, 0x5f

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    move/from16 v0, v34

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, v19

    iput-object v3, v0, Lcom/vkontakte/android/attachments/SnippetAttachment;->referWiki:Ljava/lang/String;

    goto/16 :goto_0

    .line 239
    .restart local v19    # "att":Lcom/vkontakte/android/attachments/Attachment;
    :cond_1f
    move-object/from16 v0, v19

    instance-of v3, v0, Lcom/vkontakte/android/attachments/WikiAttachment;

    if-eqz v3, :cond_0

    .line 240
    check-cast v19, Lcom/vkontakte/android/attachments/WikiAttachment;

    .end local v19    # "att":Lcom/vkontakte/android/attachments/Attachment;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "post?"

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move/from16 v0, v31

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const/16 v7, 0x5f

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    move/from16 v0, v34

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, v19

    iput-object v3, v0, Lcom/vkontakte/android/attachments/WikiAttachment;->refer:Ljava/lang/String;

    goto/16 :goto_0

    .line 243
    :cond_20
    const/4 v3, 0x1

    move/from16 v0, v39

    if-ne v0, v3, :cond_21

    if-eqz v26, :cond_21

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v3

    const/4 v4, 0x1

    if-gt v3, v4, :cond_21

    .line 244
    const/4 v3, 0x1

    move-object/from16 v0, v26

    invoke-virtual {v0, v3}, Lcom/vkontakte/android/attachments/VideoAttachment;->setSingle(Z)V

    .line 246
    :cond_21
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-lez v3, :cond_23

    .line 247
    if-nez p3, :cond_22

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v3

    const/4 v4, 0x3

    if-le v3, v4, :cond_27

    .line 248
    :cond_22
    new-instance v3, Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem;

    const/4 v6, 0x0

    const/4 v8, 0x0

    move-object/from16 v4, p1

    move-object/from16 v7, p2

    move-object/from16 v9, p5

    invoke-direct/range {v3 .. v9}, Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem;-><init>(Lcom/vkontakte/android/NewsEntry;Ljava/util/List;ZLjava/lang/String;Ljava/util/List;Lcom/vkontakte/android/data/PostInteract;)V

    move-object/from16 v0, v36

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 265
    :cond_23
    invoke-virtual/range {v27 .. v27}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-lez v3, :cond_24

    .line 266
    new-instance v3, Lcom/vkontakte/android/ui/posts/AttachContainerPostDisplayItem;

    const/4 v4, 0x1

    move-object/from16 v0, p1

    move-object/from16 v1, v27

    move/from16 v2, p3

    invoke-direct {v3, v0, v1, v2, v4}, Lcom/vkontakte/android/ui/posts/AttachContainerPostDisplayItem;-><init>(Lcom/vkontakte/android/NewsEntry;Ljava/util/ArrayList;ZZ)V

    move-object/from16 v0, v36

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 268
    :cond_24
    invoke-virtual/range {v28 .. v28}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-lez v3, :cond_25

    .line 269
    new-instance v3, Lcom/vkontakte/android/ui/posts/AttachContainerPostDisplayItem;

    const/4 v4, 0x1

    move-object/from16 v0, p1

    move-object/from16 v1, v28

    move/from16 v2, p3

    invoke-direct {v3, v0, v1, v2, v4}, Lcom/vkontakte/android/ui/posts/AttachContainerPostDisplayItem;-><init>(Lcom/vkontakte/android/NewsEntry;Ljava/util/ArrayList;ZZ)V

    move-object/from16 v0, v36

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 271
    :cond_25
    if-eqz v20, :cond_26

    invoke-virtual/range {v20 .. v20}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-lez v3, :cond_26

    .line 272
    new-instance v3, Lcom/vkontakte/android/ui/posts/AttachContainerPostDisplayItem;

    const/4 v4, 0x1

    move-object/from16 v0, p1

    move-object/from16 v1, v20

    move/from16 v2, p3

    invoke-direct {v3, v0, v1, v2, v4}, Lcom/vkontakte/android/ui/posts/AttachContainerPostDisplayItem;-><init>(Lcom/vkontakte/android/NewsEntry;Ljava/util/ArrayList;ZZ)V

    move-object/from16 v0, v36

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 274
    :cond_26
    invoke-virtual/range {v21 .. v21}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-lez v3, :cond_2b

    .line 275
    new-instance v33, Ljava/util/ArrayList;

    invoke-direct/range {v33 .. v33}, Ljava/util/ArrayList;-><init>()V

    .line 276
    .local v33, "pl":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/audio/MusicTrack;>;"
    const/16 v24, 0x0

    .local v24, "i":I
    :goto_4
    invoke-virtual/range {v21 .. v21}, Ljava/util/ArrayList;->size()I

    move-result v3

    move/from16 v0, v24

    if-ge v0, v3, :cond_2a

    .line 277
    move-object/from16 v0, v21

    move/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/vkontakte/android/attachments/AudioAttachment;

    iget-object v3, v3, Lcom/vkontakte/android/attachments/AudioAttachment;->musicTrack:Lcom/vkontakte/android/audio/MusicTrack;

    move-object/from16 v0, v33

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 276
    add-int/lit8 v24, v24, 0x1

    goto :goto_4

    .line 250
    .end local v24    # "i":I
    .end local v33    # "pl":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/audio/MusicTrack;>;"
    :cond_27
    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_28
    :goto_5
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_23

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v38

    check-cast v38, Lcom/vkontakte/android/attachments/ThumbAttachment;

    .line 251
    .local v38, "ta":Lcom/vkontakte/android/attachments/ThumbAttachment;
    new-instance v6, Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem;

    invoke-static/range {v38 .. v38}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v8

    const/4 v9, 0x0

    move-object/from16 v7, p1

    move-object/from16 v10, p2

    move-object v11, v5

    move-object/from16 v12, p5

    invoke-direct/range {v6 .. v12}, Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem;-><init>(Lcom/vkontakte/android/NewsEntry;Ljava/util/List;ZLjava/lang/String;Ljava/util/List;Lcom/vkontakte/android/data/PostInteract;)V

    .line 254
    .local v6, "item":Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem;
    move-object/from16 v0, v36

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 255
    move-object/from16 v0, v38

    instance-of v4, v0, Lcom/vkontakte/android/attachments/PhotoAttachment;

    if-eqz v4, :cond_28

    move-object/from16 v32, v38

    .line 256
    check-cast v32, Lcom/vkontakte/android/attachments/PhotoAttachment;

    .line 257
    .local v32, "pa":Lcom/vkontakte/android/attachments/PhotoAttachment;
    move-object/from16 v0, v32

    iget-object v4, v0, Lcom/vkontakte/android/attachments/PhotoAttachment;->descr:Ljava/lang/String;

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_28

    move-object/from16 v0, p1

    iget v4, v0, Lcom/vkontakte/android/NewsEntry;->type:I

    const/4 v7, 0x1

    if-ne v4, v7, :cond_29

    move-object/from16 v0, p1

    iget-object v4, v0, Lcom/vkontakte/android/NewsEntry;->text:Ljava/lang/String;

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_28

    .line 258
    :cond_29
    new-instance v7, Lcom/vkontakte/android/ui/posts/TextPostDisplayItem;

    move-object/from16 v0, p1

    iget v8, v0, Lcom/vkontakte/android/NewsEntry;->postID:I

    move-object/from16 v0, p1

    iget v9, v0, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    move-object/from16 v0, v32

    iget-object v4, v0, Lcom/vkontakte/android/attachments/PhotoAttachment;->descr:Ljava/lang/String;

    const/4 v10, 0x7

    .line 259
    move-object/from16 v0, p5

    invoke-static {v4, v10, v0}, Lcom/vkontakte/android/LinkParser;->parseLinks(Ljava/lang/CharSequence;ILcom/vkontakte/android/data/PostInteract;)Ljava/lang/CharSequence;

    move-result-object v4

    .line 258
    invoke-static {v4}, Lcom/vkontakte/android/Global;->replaceEmoji(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v10

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x1

    move-object/from16 v14, p5

    invoke-direct/range {v7 .. v14}, Lcom/vkontakte/android/ui/posts/TextPostDisplayItem;-><init>(IILjava/lang/CharSequence;Ljava/lang/String;ZZLcom/vkontakte/android/data/PostInteract;)V

    move-object/from16 v0, v36

    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_5

    .line 279
    .end local v6    # "item":Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem;
    .end local v32    # "pa":Lcom/vkontakte/android/attachments/PhotoAttachment;
    .end local v38    # "ta":Lcom/vkontakte/android/attachments/ThumbAttachment;
    .restart local v24    # "i":I
    .restart local v33    # "pl":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/audio/MusicTrack;>;"
    :cond_2a
    const/16 v24, 0x0

    .line 280
    invoke-virtual/range {v21 .. v21}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_6
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2b

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Lcom/vkontakte/android/attachments/AudioAttachment;

    .line 281
    .local v16, "aa":Lcom/vkontakte/android/attachments/AudioAttachment;
    move-object/from16 v0, v33

    move-object/from16 v1, v16

    iput-object v0, v1, Lcom/vkontakte/android/attachments/AudioAttachment;->playlist:Ljava/util/ArrayList;

    .line 282
    move/from16 v0, v24

    move-object/from16 v1, v16

    iput v0, v1, Lcom/vkontakte/android/attachments/AudioAttachment;->playlistPos:I

    .line 283
    move-object/from16 v0, v16

    move-object/from16 v1, p2

    move-object/from16 v2, p5

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/attachments/AudioAttachment;->setReferData(Ljava/lang/String;Lcom/vkontakte/android/data/PostInteract;)V

    .line 284
    new-instance v4, Lcom/vkontakte/android/ui/posts/AudioPostDisplayItem;

    move-object/from16 v0, p1

    move-object/from16 v1, v16

    invoke-direct {v4, v0, v1}, Lcom/vkontakte/android/ui/posts/AudioPostDisplayItem;-><init>(Lcom/vkontakte/android/NewsEntry;Lcom/vkontakte/android/attachments/AudioAttachment;)V

    move-object/from16 v0, v36

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 285
    add-int/lit8 v24, v24, 0x1

    .line 286
    goto :goto_6

    .line 288
    .end local v16    # "aa":Lcom/vkontakte/android/attachments/AudioAttachment;
    .end local v24    # "i":I
    .end local v33    # "pl":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/audio/MusicTrack;>;"
    :cond_2b
    invoke-virtual/range {v29 .. v29}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-lez v3, :cond_2c

    .line 289
    if-eqz v25, :cond_2f

    const/4 v3, 0x1

    move/from16 v0, v23

    if-ne v0, v3, :cond_2f

    .line 290
    const/4 v3, 0x1

    move-object/from16 v0, v25

    iput-boolean v3, v0, Lcom/vkontakte/android/attachments/DocumentAttachment;->isSingle:Z

    .line 291
    new-instance v3, Lcom/vkontakte/android/ui/posts/AttachContainerPostDisplayItem;

    move-object/from16 v0, v25

    iget-object v4, v0, Lcom/vkontakte/android/attachments/DocumentAttachment;->video:Ljava/lang/String;

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    move-object/from16 v0, p1

    move-object/from16 v1, v29

    move/from16 v2, p3

    invoke-direct {v3, v0, v1, v2, v4}, Lcom/vkontakte/android/ui/posts/AttachContainerPostDisplayItem;-><init>(Lcom/vkontakte/android/NewsEntry;Ljava/util/ArrayList;ZZ)V

    move-object/from16 v0, v36

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 296
    :cond_2c
    :goto_7
    invoke-virtual/range {v30 .. v30}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-lez v3, :cond_2d

    .line 297
    new-instance v3, Lcom/vkontakte/android/ui/posts/AttachContainerPostDisplayItem;

    const/4 v4, 0x0

    move-object/from16 v0, p1

    move-object/from16 v1, v30

    move/from16 v2, p3

    invoke-direct {v3, v0, v1, v2, v4}, Lcom/vkontakte/android/ui/posts/AttachContainerPostDisplayItem;-><init>(Lcom/vkontakte/android/NewsEntry;Ljava/util/ArrayList;ZZ)V

    move-object/from16 v0, v36

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 299
    :cond_2d
    invoke-virtual/range {v22 .. v22}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-lez v3, :cond_30

    .line 300
    invoke-virtual/range {v22 .. v22}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_8
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_30

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Lcom/vkontakte/android/attachments/Attachment;

    .line 301
    .local v16, "aa":Lcom/vkontakte/android/attachments/Attachment;
    move-object/from16 v0, v16

    instance-of v3, v0, Lcom/vkontakte/android/attachments/LinkAttachment;

    if-eqz v3, :cond_2e

    move-object/from16 v3, v16

    .line 302
    check-cast v3, Lcom/vkontakte/android/attachments/LinkAttachment;

    move-object/from16 v0, p1

    move-object/from16 v1, p5

    invoke-virtual {v3, v0, v1}, Lcom/vkontakte/android/attachments/LinkAttachment;->setReferrer(Lcom/vkontakte/android/NewsEntry;Lcom/vkontakte/android/data/PostInteract;)V

    .line 304
    :cond_2e
    new-instance v3, Lcom/vkontakte/android/ui/posts/CommonAttachmentPostDisplayItem;

    move-object/from16 v0, p1

    move-object/from16 v1, v16

    invoke-direct {v3, v0, v1}, Lcom/vkontakte/android/ui/posts/CommonAttachmentPostDisplayItem;-><init>(Lcom/vkontakte/android/NewsEntry;Lcom/vkontakte/android/attachments/Attachment;)V

    move-object/from16 v0, v36

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_8

    .line 293
    .end local v16    # "aa":Lcom/vkontakte/android/attachments/Attachment;
    :cond_2f
    new-instance v3, Lcom/vkontakte/android/ui/posts/AttachContainerPostDisplayItem;

    const/4 v4, 0x1

    move-object/from16 v0, p1

    move-object/from16 v1, v29

    move/from16 v2, p3

    invoke-direct {v3, v0, v1, v2, v4}, Lcom/vkontakte/android/ui/posts/AttachContainerPostDisplayItem;-><init>(Lcom/vkontakte/android/NewsEntry;Ljava/util/ArrayList;ZZ)V

    move-object/from16 v0, v36

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_7

    .line 307
    :cond_30
    invoke-virtual/range {v37 .. v37}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-lez v3, :cond_31

    .line 308
    invoke-virtual/range {v37 .. v37}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_9
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_31

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Lcom/vkontakte/android/attachments/Attachment;

    .line 309
    .restart local v19    # "att":Lcom/vkontakte/android/attachments/Attachment;
    new-instance v4, Lcom/vkontakte/android/ui/posts/SignaturePostDisplayItem;

    move-object/from16 v0, p1

    move-object/from16 v1, v19

    invoke-direct {v4, v0, v1}, Lcom/vkontakte/android/ui/posts/SignaturePostDisplayItem;-><init>(Lcom/vkontakte/android/NewsEntry;Lcom/vkontakte/android/attachments/Attachment;)V

    move-object/from16 v0, v36

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_9

    .line 312
    .end local v19    # "att":Lcom/vkontakte/android/attachments/Attachment;
    :cond_31
    if-eqz v35, :cond_32

    .line 313
    new-instance v7, Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem;

    move-object/from16 v0, v35

    iget-object v9, v0, Lcom/vkontakte/android/attachments/RepostAttachment;->name:Ljava/lang/String;

    move-object/from16 v0, v35

    iget-object v10, v0, Lcom/vkontakte/android/attachments/RepostAttachment;->photo:Ljava/lang/String;

    move-object/from16 v0, v35

    iget v11, v0, Lcom/vkontakte/android/attachments/RepostAttachment;->ownerID:I

    move-object/from16 v0, v35

    iget v12, v0, Lcom/vkontakte/android/attachments/RepostAttachment;->time:I

    move-object/from16 v0, v35

    iget v13, v0, Lcom/vkontakte/android/attachments/RepostAttachment;->postID:I

    move-object/from16 v0, v35

    iget v14, v0, Lcom/vkontakte/android/attachments/RepostAttachment;->type:I

    const/4 v15, 0x0

    move-object/from16 v8, p1

    invoke-direct/range {v7 .. v15}, Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem;-><init>(Lcom/vkontakte/android/NewsEntry;Ljava/lang/String;Ljava/lang/String;IIIILcom/vkontakte/android/NewsEntry;)V

    move-object/from16 v0, v36

    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 315
    :cond_32
    return-object v36
.end method

.method public static buildItems(Lcom/vkontakte/android/NewsEntry;ZLjava/lang/String;ZZLandroid/view/View$OnClickListener;ZLjava/lang/String;I)Ljava/util/List;
    .locals 22
    .param p0, "e"    # Lcom/vkontakte/android/NewsEntry;
    .param p1, "photosMode"    # Z
    .param p2, "referer"    # Ljava/lang/String;
    .param p3, "feedbackStyle"    # Z
    .param p4, "canHideFromFeed"    # Z
    .param p5, "menuClickListener"    # Landroid/view/View$OnClickListener;
    .param p6, "fromList"    # Z
    .param p7, "listReferrer"    # Ljava/lang/String;
    .param p8, "listPos"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vkontakte/android/NewsEntry;",
            "Z",
            "Ljava/lang/String;",
            "ZZ",
            "Landroid/view/View$OnClickListener;",
            "Z",
            "Ljava/lang/String;",
            "I)",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/ui/posts/PostDisplayItem;",
            ">;"
        }
    .end annotation

    .prologue
    .line 319
    new-instance v9, Lcom/vkontakte/android/data/PostInteract;

    move-object/from16 v0, p7

    move-object/from16 v1, p0

    invoke-direct {v9, v0, v1}, Lcom/vkontakte/android/data/PostInteract;-><init>(Ljava/lang/String;Lcom/vkontakte/android/NewsEntry;)V

    .line 321
    .local v9, "postInteract":Lcom/vkontakte/android/data/PostInteract;
    new-instance v21, Ljava/util/ArrayList;

    invoke-direct/range {v21 .. v21}, Ljava/util/ArrayList;-><init>()V

    .line 323
    .local v21, "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/ui/posts/PostDisplayItem;>;"
    move-object/from16 v0, p0

    iget v4, v0, Lcom/vkontakte/android/NewsEntry;->type:I

    const/16 v5, 0xf

    if-ne v4, v5, :cond_0

    .line 324
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/NewsEntry;->extra:Landroid/os/Bundle;

    const-string/jumbo v5, "extras_key_user_notification"

    invoke-virtual {v4, v5}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v20

    .line 325
    .local v20, "parcelable":Landroid/os/Parcelable;
    if-eqz v20, :cond_0

    .line 326
    new-instance v4, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery;

    check-cast v20, Lcom/vkontakte/android/data/UserNotification;

    .end local v20    # "parcelable":Landroid/os/Parcelable;
    move-object/from16 v0, v20

    invoke-direct {v4, v0}, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery;-><init>(Lcom/vkontakte/android/data/UserNotification;)V

    move-object/from16 v0, v21

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 330
    :cond_0
    move-object/from16 v0, p0

    iget v4, v0, Lcom/vkontakte/android/NewsEntry;->type:I

    const/16 v5, 0xd

    if-eq v4, v5, :cond_3

    move-object/from16 v0, p0

    iget v4, v0, Lcom/vkontakte/android/NewsEntry;->type:I

    const/16 v5, 0xb

    if-eq v4, v5, :cond_3

    move-object/from16 v0, p0

    iget v4, v0, Lcom/vkontakte/android/NewsEntry;->type:I

    const/16 v5, 0xf

    if-eq v4, v5, :cond_3

    move-object/from16 v0, p0

    iget v4, v0, Lcom/vkontakte/android/NewsEntry;->type:I

    const/16 v5, 0x13

    if-eq v4, v5, :cond_3

    .line 332
    new-instance v3, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;

    move-object/from16 v4, p0

    move/from16 v5, p1

    move/from16 v6, p6

    move-object/from16 v7, p7

    move/from16 v8, p8

    invoke-direct/range {v3 .. v9}, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;-><init>(Lcom/vkontakte/android/NewsEntry;ZZLjava/lang/String;ILcom/vkontakte/android/data/PostInteract;)V

    .line 333
    .local v3, "hdr":Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;
    move-object/from16 v0, p5

    iput-object v0, v3, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->menuClickListener:Landroid/view/View$OnClickListener;

    .line 334
    if-eqz p5, :cond_17

    move-object/from16 v0, p0

    iget v4, v0, Lcom/vkontakte/android/NewsEntry;->type:I

    const/4 v5, 0x6

    if-eq v4, v5, :cond_1

    move-object/from16 v0, p0

    iget v4, v0, Lcom/vkontakte/android/NewsEntry;->type:I

    const/4 v5, 0x7

    if-eq v4, v5, :cond_1

    move-object/from16 v0, p0

    iget v4, v0, Lcom/vkontakte/android/NewsEntry;->type:I

    const/16 v5, 0x9

    if-ne v4, v5, :cond_2

    :cond_1
    if-eqz p4, :cond_17

    move-object/from16 v0, p0

    iget v4, v0, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v5

    invoke-virtual {v5}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v5

    if-eq v4, v5, :cond_17

    :cond_2
    const/4 v4, 0x1

    :goto_0
    iput-boolean v4, v3, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->showMenu:Z

    .line 335
    move-object/from16 v0, v21

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 338
    .end local v3    # "hdr":Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;
    :cond_3
    if-nez p6, :cond_4

    move-object/from16 v0, p0

    iget v4, v0, Lcom/vkontakte/android/NewsEntry;->type:I

    const/4 v5, 0x2

    if-ne v4, v5, :cond_4

    .line 339
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    move-object/from16 v5, p0

    move-object/from16 v6, p2

    move/from16 v7, p6

    move/from16 v8, p8

    invoke-static/range {v4 .. v9}, Lcom/vkontakte/android/data/Posts;->buildAttachItems(Ljava/util/List;Lcom/vkontakte/android/NewsEntry;Ljava/lang/String;ZILcom/vkontakte/android/data/PostInteract;)Ljava/util/List;

    move-result-object v4

    move-object/from16 v0, v21

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 342
    :cond_4
    const/16 v4, 0x20

    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/vkontakte/android/NewsEntry;->flag(I)Z

    move-result v4

    if-eqz v4, :cond_7

    .line 343
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/NewsEntry;->retweetText:Ljava/lang/String;

    if-eqz v4, :cond_5

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/NewsEntry;->retweetText:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_5

    .line 344
    new-instance v10, Lcom/vkontakte/android/ui/posts/TextPostDisplayItem;

    move-object/from16 v0, p0

    iget v11, v0, Lcom/vkontakte/android/NewsEntry;->postID:I

    move-object/from16 v0, p0

    iget v12, v0, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    if-eqz p6, :cond_18

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/vkontakte/android/NewsEntry;->displayableRetweetText:Ljava/lang/CharSequence;

    .line 345
    :goto_1
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/vkontakte/android/NewsEntry;->retweetText:Ljava/lang/String;

    const/4 v15, 0x0

    if-nez p6, :cond_19

    const/16 v16, 0x1

    :goto_2
    move-object/from16 v17, v9

    invoke-direct/range {v10 .. v17}, Lcom/vkontakte/android/ui/posts/TextPostDisplayItem;-><init>(IILjava/lang/CharSequence;Ljava/lang/String;ZZLcom/vkontakte/android/data/PostInteract;)V

    .line 344
    move-object/from16 v0, v21

    invoke-virtual {v0, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 348
    :cond_5
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/NewsEntry;->repostAttachments:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-lez v4, :cond_6

    .line 349
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/NewsEntry;->repostAttachments:Ljava/util/ArrayList;

    move-object/from16 v5, p0

    move-object/from16 v6, p2

    move/from16 v7, p6

    move/from16 v8, p8

    invoke-static/range {v4 .. v9}, Lcom/vkontakte/android/data/Posts;->buildAttachItems(Ljava/util/List;Lcom/vkontakte/android/NewsEntry;Ljava/lang/String;ZILcom/vkontakte/android/data/PostInteract;)Ljava/util/List;

    move-result-object v4

    move-object/from16 v0, v21

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 351
    :cond_6
    new-instance v10, Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem;

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/vkontakte/android/NewsEntry;->retweetUserName:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/vkontakte/android/NewsEntry;->retweetUserPhoto:Ljava/lang/String;

    move-object/from16 v0, p0

    iget v14, v0, Lcom/vkontakte/android/NewsEntry;->retweetUID:I

    move-object/from16 v0, p0

    iget v15, v0, Lcom/vkontakte/android/NewsEntry;->retweetOrigTime:I

    move-object/from16 v0, p0

    iget v0, v0, Lcom/vkontakte/android/NewsEntry;->retweetOrigId:I

    move/from16 v16, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/vkontakte/android/NewsEntry;->retweetType:I

    move/from16 v17, v0

    move-object/from16 v11, p0

    move-object/from16 v18, p0

    invoke-direct/range {v10 .. v18}, Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem;-><init>(Lcom/vkontakte/android/NewsEntry;Ljava/lang/String;Ljava/lang/String;IIIILcom/vkontakte/android/NewsEntry;)V

    move-object/from16 v0, v21

    invoke-virtual {v0, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 354
    :cond_7
    const v4, 0x8000

    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/vkontakte/android/NewsEntry;->flag(I)Z

    move-result v4

    if-eqz v4, :cond_8

    const-string/jumbo v4, "kz"

    invoke-static {}, Lcom/vkontakte/android/Global;->getDeviceLang()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_8

    .line 355
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/NewsEntry;->text:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_1b

    .line 356
    new-instance v10, Lcom/vkontakte/android/ui/posts/TextPostDisplayItem;

    move-object/from16 v0, p0

    iget v11, v0, Lcom/vkontakte/android/NewsEntry;->postID:I

    move-object/from16 v0, p0

    iget v12, v0, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    sget-object v4, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/vkontakte/android/NewsEntry;->f:Z

    if-eqz v4, :cond_1a

    const v4, 0x7f08048e

    .line 357
    :goto_3
    invoke-virtual {v5, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v13

    const/4 v14, 0x0

    const/4 v15, 0x1

    const/16 v16, 0x0

    move-object/from16 v17, v9

    invoke-direct/range {v10 .. v17}, Lcom/vkontakte/android/ui/posts/TextPostDisplayItem;-><init>(IILjava/lang/CharSequence;Ljava/lang/String;ZZLcom/vkontakte/android/data/PostInteract;)V

    .line 356
    move-object/from16 v0, v21

    invoke-virtual {v0, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 365
    :cond_8
    :goto_4
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/NewsEntry;->text:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_9

    if-nez p1, :cond_9

    move-object/from16 v0, p0

    iget v4, v0, Lcom/vkontakte/android/NewsEntry;->type:I

    const/4 v5, 0x4

    if-eq v4, v5, :cond_9

    .line 367
    new-instance v10, Lcom/vkontakte/android/ui/posts/TextPostDisplayItem;

    move-object/from16 v0, p0

    iget v11, v0, Lcom/vkontakte/android/NewsEntry;->postID:I

    move-object/from16 v0, p0

    iget v12, v0, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    if-eqz p6, :cond_1d

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/vkontakte/android/NewsEntry;->displayablePreviewText:Ljava/lang/CharSequence;

    .line 368
    :goto_5
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/vkontakte/android/NewsEntry;->text:Ljava/lang/String;

    const/16 v4, 0x10

    .line 369
    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/vkontakte/android/NewsEntry;->flag(I)Z

    move-result v15

    if-nez p6, :cond_1e

    const/16 v16, 0x1

    :goto_6
    move-object/from16 v17, v9

    invoke-direct/range {v10 .. v17}, Lcom/vkontakte/android/ui/posts/TextPostDisplayItem;-><init>(IILjava/lang/CharSequence;Ljava/lang/String;ZZLcom/vkontakte/android/data/PostInteract;)V

    .line 367
    move-object/from16 v0, v21

    invoke-virtual {v0, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 372
    :cond_9
    const v4, 0x8000

    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/vkontakte/android/NewsEntry;->flag(I)Z

    move-result v4

    if-eqz v4, :cond_a

    const-string/jumbo v4, "kz"

    invoke-static {}, Lcom/vkontakte/android/Global;->getDeviceLang()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_a

    .line 373
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/NewsEntry;->text:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_20

    .line 374
    new-instance v10, Lcom/vkontakte/android/ui/posts/TextPostDisplayItem;

    move-object/from16 v0, p0

    iget v11, v0, Lcom/vkontakte/android/NewsEntry;->postID:I

    move-object/from16 v0, p0

    iget v12, v0, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    sget-object v4, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/vkontakte/android/NewsEntry;->f:Z

    if-eqz v4, :cond_1f

    const v4, 0x7f08048e

    .line 375
    :goto_7
    invoke-virtual {v5, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v13

    const/4 v14, 0x0

    const/4 v15, 0x1

    const/16 v16, 0x0

    move-object/from16 v17, v9

    invoke-direct/range {v10 .. v17}, Lcom/vkontakte/android/ui/posts/TextPostDisplayItem;-><init>(IILjava/lang/CharSequence;Ljava/lang/String;ZZLcom/vkontakte/android/data/PostInteract;)V

    .line 374
    move-object/from16 v0, v21

    invoke-virtual {v0, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 384
    :cond_a
    :goto_8
    if-nez p6, :cond_b

    move-object/from16 v0, p0

    iget v4, v0, Lcom/vkontakte/android/NewsEntry;->type:I

    const/4 v5, 0x2

    if-eq v4, v5, :cond_c

    .line 385
    :cond_b
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    move-object/from16 v5, p0

    move-object/from16 v6, p2

    move/from16 v7, p6

    move/from16 v8, p8

    invoke-static/range {v4 .. v9}, Lcom/vkontakte/android/data/Posts;->buildAttachItems(Ljava/util/List;Lcom/vkontakte/android/NewsEntry;Ljava/lang/String;ZILcom/vkontakte/android/data/PostInteract;)Ljava/util/List;

    move-result-object v4

    move-object/from16 v0, v21

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 388
    :cond_c
    move-object/from16 v0, p0

    iget v4, v0, Lcom/vkontakte/android/NewsEntry;->type:I

    const/4 v5, 0x4

    if-ne v4, v5, :cond_d

    .line 389
    new-instance v4, Lcom/vkontakte/android/ui/posts/CommonAttachmentPostDisplayItem;

    new-instance v5, Lcom/vkontakte/android/attachments/BoardTopicAttachment;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/vkontakte/android/NewsEntry;->text:Ljava/lang/String;

    invoke-direct {v5, v6}, Lcom/vkontakte/android/attachments/BoardTopicAttachment;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p0

    invoke-direct {v4, v0, v5}, Lcom/vkontakte/android/ui/posts/CommonAttachmentPostDisplayItem;-><init>(Lcom/vkontakte/android/NewsEntry;Lcom/vkontakte/android/attachments/Attachment;)V

    move-object/from16 v0, v21

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 416
    :cond_d
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/NewsEntry;->extra:Landroid/os/Bundle;

    const-string/jumbo v5, "extras_key_marked_as_ads"

    const/4 v6, 0x0

    invoke-virtual {v4, v5, v6}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v4

    if-eqz v4, :cond_e

    .line 417
    new-instance v4, Lcom/vkontakte/android/ui/posts/MarkedAsAdsPostDisplayItem;

    move-object/from16 v0, p0

    invoke-direct {v4, v0}, Lcom/vkontakte/android/ui/posts/MarkedAsAdsPostDisplayItem;-><init>(Lcom/vkontakte/android/NewsEntry;)V

    move-object/from16 v0, v21

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 420
    :cond_e
    if-eqz p6, :cond_13

    move-object/from16 v0, p0

    iget v4, v0, Lcom/vkontakte/android/NewsEntry;->type:I

    const/16 v5, 0xd

    if-eq v4, v5, :cond_13

    move-object/from16 v0, p0

    iget v4, v0, Lcom/vkontakte/android/NewsEntry;->type:I

    const/16 v5, 0xf

    if-eq v4, v5, :cond_13

    if-nez p3, :cond_13

    .line 421
    move-object/from16 v0, p0

    iget v4, v0, Lcom/vkontakte/android/NewsEntry;->type:I

    const/4 v5, 0x2

    if-ne v4, v5, :cond_f

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    if-eqz v4, :cond_10

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    const/4 v5, 0x1

    if-ne v4, v5, :cond_10

    :cond_f
    move-object/from16 v0, p0

    iget v4, v0, Lcom/vkontakte/android/NewsEntry;->type:I

    const/4 v5, 0x5

    if-eq v4, v5, :cond_10

    move-object/from16 v0, p0

    iget v4, v0, Lcom/vkontakte/android/NewsEntry;->type:I

    const/4 v5, 0x4

    if-eq v4, v5, :cond_10

    move-object/from16 v0, p0

    iget v4, v0, Lcom/vkontakte/android/NewsEntry;->type:I

    const/16 v5, 0xb

    if-eq v4, v5, :cond_10

    move-object/from16 v0, p0

    iget v4, v0, Lcom/vkontakte/android/NewsEntry;->type:I

    const/16 v5, 0x12

    if-eq v4, v5, :cond_10

    move-object/from16 v0, p0

    iget v4, v0, Lcom/vkontakte/android/NewsEntry;->type:I

    const/4 v5, 0x6

    if-eq v4, v5, :cond_10

    move-object/from16 v0, p0

    iget v4, v0, Lcom/vkontakte/android/NewsEntry;->type:I

    const/4 v5, 0x7

    if-eq v4, v5, :cond_10

    move-object/from16 v0, p0

    iget v4, v0, Lcom/vkontakte/android/NewsEntry;->type:I

    const/16 v5, 0x9

    if-eq v4, v5, :cond_10

    move-object/from16 v0, p0

    iget v4, v0, Lcom/vkontakte/android/NewsEntry;->type:I

    const/16 v5, 0x13

    if-eq v4, v5, :cond_10

    const/16 v4, 0x1000

    .line 430
    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/vkontakte/android/NewsEntry;->flag(I)Z

    move-result v4

    if-nez v4, :cond_10

    const/16 v4, 0x800

    .line 431
    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/vkontakte/android/NewsEntry;->flag(I)Z

    move-result v4

    if-nez v4, :cond_10

    .line 432
    new-instance v5, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;

    move-object/from16 v0, p0

    iget v4, v0, Lcom/vkontakte/android/NewsEntry;->type:I

    const/4 v6, 0x4

    if-eq v4, v6, :cond_22

    const/4 v4, 0x1

    :goto_9
    move-object/from16 v0, p0

    move/from16 v1, p3

    move-object/from16 v2, p7

    invoke-direct {v5, v0, v1, v4, v2}, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;-><init>(Lcom/vkontakte/android/NewsEntry;ZZLjava/lang/String;)V

    move-object/from16 v0, v21

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 433
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/NewsEntry;->activity:Lcom/vkontakte/android/NewsEntry$Activity;

    if-eqz v4, :cond_10

    .line 434
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/NewsEntry;->activity:Lcom/vkontakte/android/NewsEntry$Activity;

    iget v4, v4, Lcom/vkontakte/android/NewsEntry$Activity;->type:I

    if-nez v4, :cond_23

    .line 435
    new-instance v4, Lcom/vkontakte/android/ui/posts/ActivityLikesDisplayItem;

    move-object/from16 v0, p0

    invoke-direct {v4, v0}, Lcom/vkontakte/android/ui/posts/ActivityLikesDisplayItem;-><init>(Lcom/vkontakte/android/NewsEntry;)V

    move-object/from16 v0, v21

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 442
    :cond_10
    :goto_a
    const/16 v4, 0x1000

    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/vkontakte/android/NewsEntry;->flag(I)Z

    move-result v4

    if-eqz v4, :cond_11

    move-object/from16 v0, p0

    iget v4, v0, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    neg-int v4, v4

    invoke-static {v4}, Lcom/vkontakte/android/data/Groups;->getAdminLevel(I)I

    move-result v4

    const/4 v5, 0x2

    if-lt v4, v5, :cond_11

    .line 443
    new-instance v4, Lcom/vkontakte/android/ui/posts/ButtonsPostDisplayItem;

    move-object/from16 v0, p0

    invoke-direct {v4, v0}, Lcom/vkontakte/android/ui/posts/ButtonsPostDisplayItem;-><init>(Lcom/vkontakte/android/NewsEntry;)V

    move-object/from16 v0, v21

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 446
    :cond_11
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/NewsEntry;->lastComment:Ljava/lang/String;

    if-eqz v4, :cond_12

    .line 447
    new-instance v10, Lcom/vkontakte/android/ui/posts/CommentPostDisplayItem;

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/vkontakte/android/NewsEntry;->lastComment:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/vkontakte/android/NewsEntry;->lastCommentUserName:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/vkontakte/android/NewsEntry;->lastCommentUserPhoto:Ljava/lang/String;

    move-object/from16 v0, p0

    iget v15, v0, Lcom/vkontakte/android/NewsEntry;->numComments:I

    move-object/from16 v0, p0

    iget v0, v0, Lcom/vkontakte/android/NewsEntry;->lastCommentTime:I

    move/from16 v16, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/vkontakte/android/NewsEntry;->lastCommentUserID:I

    move/from16 v17, v0

    move-object/from16 v11, p0

    invoke-direct/range {v10 .. v17}, Lcom/vkontakte/android/ui/posts/CommentPostDisplayItem;-><init>(Lcom/vkontakte/android/NewsEntry;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;III)V

    move-object/from16 v0, v21

    invoke-virtual {v0, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 450
    :cond_12
    move-object/from16 v0, p0

    iget v4, v0, Lcom/vkontakte/android/NewsEntry;->type:I

    const/4 v5, 0x5

    if-ne v4, v5, :cond_13

    .line 451
    new-instance v4, Lcom/vkontakte/android/ui/posts/PaddingPostDisplayItem;

    const/high16 v5, 0x41800000    # 16.0f

    invoke-static {v5}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v5

    move-object/from16 v0, p0

    invoke-direct {v4, v0, v5}, Lcom/vkontakte/android/ui/posts/PaddingPostDisplayItem;-><init>(Lcom/vkontakte/android/NewsEntry;I)V

    move-object/from16 v0, v21

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 455
    :cond_13
    invoke-virtual/range {v21 .. v21}, Ljava/util/ArrayList;->size()I

    move-result v4

    const/4 v5, 0x1

    if-ne v4, v5, :cond_24

    .line 456
    const/4 v4, 0x0

    move-object/from16 v0, v21

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vkontakte/android/ui/posts/PostDisplayItem;

    const/4 v5, 0x3

    iput v5, v4, Lcom/vkontakte/android/ui/posts/PostDisplayItem;->bgType:I

    .line 462
    :cond_14
    :goto_b
    move-object/from16 v0, p0

    iget v4, v0, Lcom/vkontakte/android/NewsEntry;->type:I

    const/4 v5, 0x2

    if-ne v4, v5, :cond_15

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    if-eqz v4, :cond_15

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    const/4 v5, 0x1

    if-gt v4, v5, :cond_16

    :cond_15
    move-object/from16 v0, p0

    iget v4, v0, Lcom/vkontakte/android/NewsEntry;->type:I

    const/4 v5, 0x7

    if-eq v4, v5, :cond_16

    move-object/from16 v0, p0

    iget v4, v0, Lcom/vkontakte/android/NewsEntry;->type:I

    const/16 v5, 0xf

    if-eq v4, v5, :cond_16

    move-object/from16 v0, p0

    iget v4, v0, Lcom/vkontakte/android/NewsEntry;->type:I

    const/4 v5, 0x6

    if-eq v4, v5, :cond_16

    move-object/from16 v0, p0

    iget v4, v0, Lcom/vkontakte/android/NewsEntry;->type:I

    const/16 v5, 0x9

    if-eq v4, v5, :cond_16

    move-object/from16 v0, p0

    iget v4, v0, Lcom/vkontakte/android/NewsEntry;->type:I

    const/16 v5, 0xd

    if-ne v4, v5, :cond_25

    .line 468
    :cond_16
    invoke-virtual/range {v21 .. v21}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_c
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_25

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Lcom/vkontakte/android/ui/posts/PostDisplayItem;

    .line 469
    .local v19, "di":Lcom/vkontakte/android/ui/posts/PostDisplayItem;
    const/4 v5, 0x0

    move-object/from16 v0, v19

    iput-boolean v5, v0, Lcom/vkontakte/android/ui/posts/PostDisplayItem;->clickable:Z

    goto :goto_c

    .line 334
    .end local v19    # "di":Lcom/vkontakte/android/ui/posts/PostDisplayItem;
    .restart local v3    # "hdr":Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;
    :cond_17
    const/4 v4, 0x0

    goto/16 :goto_0

    .line 344
    .end local v3    # "hdr":Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;
    :cond_18
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/NewsEntry;->retweetText:Ljava/lang/String;

    const/4 v5, 0x7

    .line 345
    invoke-static {v4, v5, v9}, Lcom/vkontakte/android/LinkParser;->parseLinks(Ljava/lang/CharSequence;ILcom/vkontakte/android/data/PostInteract;)Ljava/lang/CharSequence;

    move-result-object v4

    invoke-static {v4}, Lcom/vkontakte/android/Global;->replaceEmoji(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v13

    goto/16 :goto_1

    :cond_19
    const/16 v16, 0x0

    goto/16 :goto_2

    .line 356
    :cond_1a
    const v4, 0x7f08048f

    goto/16 :goto_3

    .line 360
    :cond_1b
    new-instance v10, Lcom/vkontakte/android/ui/posts/TextPostDisplayItem;

    move-object/from16 v0, p0

    iget v11, v0, Lcom/vkontakte/android/NewsEntry;->postID:I

    move-object/from16 v0, p0

    iget v12, v0, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    sget-object v4, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/vkontakte/android/NewsEntry;->f:Z

    if-eqz v4, :cond_1c

    const v4, 0x7f080490

    .line 361
    :goto_d
    invoke-virtual {v5, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v13

    const/4 v14, 0x0

    const/4 v15, 0x1

    const/16 v16, 0x0

    move-object/from16 v17, v9

    invoke-direct/range {v10 .. v17}, Lcom/vkontakte/android/ui/posts/TextPostDisplayItem;-><init>(IILjava/lang/CharSequence;Ljava/lang/String;ZZLcom/vkontakte/android/data/PostInteract;)V

    .line 360
    move-object/from16 v0, v21

    invoke-virtual {v0, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_4

    :cond_1c
    const v4, 0x7f080491

    goto :goto_d

    .line 367
    :cond_1d
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/NewsEntry;->text:Ljava/lang/String;

    const/4 v5, 0x7

    .line 368
    invoke-static {v4, v5, v9}, Lcom/vkontakte/android/LinkParser;->parseLinks(Ljava/lang/CharSequence;ILcom/vkontakte/android/data/PostInteract;)Ljava/lang/CharSequence;

    move-result-object v4

    invoke-static {v4}, Lcom/vkontakte/android/Global;->replaceEmoji(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v13

    goto/16 :goto_5

    .line 369
    :cond_1e
    const/16 v16, 0x0

    goto/16 :goto_6

    .line 374
    :cond_1f
    const v4, 0x7f08048f

    goto/16 :goto_7

    .line 378
    :cond_20
    new-instance v10, Lcom/vkontakte/android/ui/posts/TextPostDisplayItem;

    move-object/from16 v0, p0

    iget v11, v0, Lcom/vkontakte/android/NewsEntry;->postID:I

    move-object/from16 v0, p0

    iget v12, v0, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    sget-object v4, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/vkontakte/android/NewsEntry;->f:Z

    if-eqz v4, :cond_21

    const v4, 0x7f080490

    .line 379
    :goto_e
    invoke-virtual {v5, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v13

    const/4 v14, 0x0

    const/4 v15, 0x1

    const/16 v16, 0x0

    move-object/from16 v17, v9

    invoke-direct/range {v10 .. v17}, Lcom/vkontakte/android/ui/posts/TextPostDisplayItem;-><init>(IILjava/lang/CharSequence;Ljava/lang/String;ZZLcom/vkontakte/android/data/PostInteract;)V

    .line 378
    move-object/from16 v0, v21

    invoke-virtual {v0, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_8

    :cond_21
    const v4, 0x7f080491

    goto :goto_e

    .line 432
    :cond_22
    const/4 v4, 0x0

    goto/16 :goto_9

    .line 436
    :cond_23
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/NewsEntry;->activity:Lcom/vkontakte/android/NewsEntry$Activity;

    iget v4, v4, Lcom/vkontakte/android/NewsEntry$Activity;->type:I

    const/4 v5, 0x1

    if-ne v4, v5, :cond_10

    .line 437
    new-instance v4, Lcom/vkontakte/android/ui/posts/ActivityCommentDisplayItem;

    move-object/from16 v0, p0

    move-object/from16 v1, p7

    invoke-direct {v4, v0, v1}, Lcom/vkontakte/android/ui/posts/ActivityCommentDisplayItem;-><init>(Lcom/vkontakte/android/NewsEntry;Ljava/lang/String;)V

    move-object/from16 v0, v21

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_a

    .line 457
    :cond_24
    invoke-virtual/range {v21 .. v21}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-lez v4, :cond_14

    .line 458
    const/4 v4, 0x0

    move-object/from16 v0, v21

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vkontakte/android/ui/posts/PostDisplayItem;

    const/4 v5, 0x1

    iput v5, v4, Lcom/vkontakte/android/ui/posts/PostDisplayItem;->bgType:I

    .line 459
    invoke-virtual/range {v21 .. v21}, Ljava/util/ArrayList;->size()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    move-object/from16 v0, v21

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vkontakte/android/ui/posts/PostDisplayItem;

    const/4 v5, 0x2

    iput v5, v4, Lcom/vkontakte/android/ui/posts/PostDisplayItem;->bgType:I

    goto/16 :goto_b

    .line 473
    :cond_25
    invoke-virtual/range {v21 .. v21}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-lez v4, :cond_26

    .line 474
    invoke-virtual/range {v21 .. v21}, Ljava/util/ArrayList;->size()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    move-object/from16 v0, v21

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vkontakte/android/ui/posts/PostDisplayItem;

    invoke-static/range {p0 .. p0}, Lcom/vkontakte/android/data/Analytics;->getOnBindViewForNewsEntry(Lcom/vkontakte/android/NewsEntry;)Lcom/vkontakte/android/ui/posts/PostDisplayItem$OnBindView;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/vkontakte/android/ui/posts/PostDisplayItem;->setOnBindView(Lcom/vkontakte/android/ui/posts/PostDisplayItem$OnBindView;)V

    .line 477
    :cond_26
    return-object v21
.end method

.method public static clear()V
    .locals 1

    .prologue
    .line 101
    sget-object v0, Lcom/vkontakte/android/data/Posts;->feed:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 102
    sget-object v0, Lcom/vkontakte/android/data/Posts;->preloadedFeed:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 103
    sget-object v0, Lcom/vkontakte/android/data/Posts;->newNews:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 104
    return-void
.end method

.method private static copyWithout(Ljava/util/List;II)Ljava/util/List;
    .locals 4
    .param p0    # Ljava/util/List;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "oid"    # I
    .param p2, "pid"    # I
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/NewsEntry;",
            ">;II)",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/NewsEntry;",
            ">;"
        }
    .end annotation

    .prologue
    .line 108
    .local p0, "list":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/NewsEntry;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v3

    invoke-direct {v0, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 109
    .local v0, "buf":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/NewsEntry;>;"
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v3

    if-ge v2, v3, :cond_2

    .line 110
    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/NewsEntry;

    .line 111
    .local v1, "entry":Lcom/vkontakte/android/NewsEntry;
    iget v3, v1, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    if-ne v3, p1, :cond_0

    iget v3, v1, Lcom/vkontakte/android/NewsEntry;->postID:I

    if-eq v3, p1, :cond_1

    .line 112
    :cond_0
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 109
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 115
    .end local v1    # "entry":Lcom/vkontakte/android/NewsEntry;
    :cond_2
    return-object v0
.end method

.method public static deleteFromStaticCache(II)V
    .locals 1
    .param p0, "oid"    # I
    .param p1, "pid"    # I

    .prologue
    .line 95
    sget-object v0, Lcom/vkontakte/android/data/Posts;->feed:Ljava/util/List;

    invoke-static {v0, p0, p1}, Lcom/vkontakte/android/data/Posts;->copyWithout(Ljava/util/List;II)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lcom/vkontakte/android/data/Posts;->feed:Ljava/util/List;

    .line 96
    sget-object v0, Lcom/vkontakte/android/data/Posts;->preloadedFeed:Ljava/util/List;

    invoke-static {v0, p0, p1}, Lcom/vkontakte/android/data/Posts;->copyWithout(Ljava/util/List;II)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lcom/vkontakte/android/data/Posts;->preloadedFeed:Ljava/util/List;

    .line 97
    sget-object v0, Lcom/vkontakte/android/data/Posts;->newNews:Ljava/util/List;

    invoke-static {v0, p0, p1}, Lcom/vkontakte/android/data/Posts;->copyWithout(Ljava/util/List;II)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lcom/vkontakte/android/data/Posts;->newNews:Ljava/util/List;

    .line 98
    return-void
.end method

.method public static deletePost(Lcom/vkontakte/android/NewsEntry;Landroid/content/Context;)V
    .locals 5
    .param p0, "e"    # Lcom/vkontakte/android/NewsEntry;
    .param p1, "act"    # Landroid/content/Context;

    .prologue
    .line 519
    :try_start_0
    new-instance v1, Lcom/vkontakte/android/api/wall/WallDelete;

    iget v2, p0, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    iget v3, p0, Lcom/vkontakte/android/NewsEntry;->postID:I

    iget v4, p0, Lcom/vkontakte/android/NewsEntry;->type:I

    invoke-direct {v1, v2, v3, v4}, Lcom/vkontakte/android/api/wall/WallDelete;-><init>(III)V

    new-instance v2, Lcom/vkontakte/android/data/Posts$3;

    invoke-direct {v2, p1, p0, p1}, Lcom/vkontakte/android/data/Posts$3;-><init>(Landroid/content/Context;Lcom/vkontakte/android/NewsEntry;Landroid/content/Context;)V

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/api/wall/WallDelete;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    .line 529
    invoke-virtual {v1, p1}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 533
    :goto_0
    return-void

    .line 530
    :catch_0
    move-exception v0

    .line 531
    .local v0, "x":Ljava/lang/Exception;
    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public static editRepostComment(Lcom/vkontakte/android/NewsEntry;Ljava/lang/String;Landroid/app/Activity;)V
    .locals 4
    .param p0, "e"    # Lcom/vkontakte/android/NewsEntry;
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "act"    # Landroid/app/Activity;

    .prologue
    .line 481
    new-instance v0, Landroid/widget/EditText;

    invoke-direct {v0, p2}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    .line 482
    .local v0, "edit":Landroid/widget/EditText;
    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 483
    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setLines(I)V

    .line 484
    const/16 v1, 0x30

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setGravity(I)V

    .line 485
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-interface {v1}, Landroid/text/Editable;->length()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setSelection(I)V

    .line 486
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setBackgroundColor(I)V

    .line 487
    new-instance v1, Lcom/vkontakte/android/VKAlertDialog$Builder;

    invoke-direct {v1, p2}, Lcom/vkontakte/android/VKAlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v2, 0x7f0800a4

    .line 488
    invoke-virtual {v1, v2}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 489
    invoke-virtual {v1, v0}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x7f0805d9

    invoke-static {p0, v0, p2}, Lcom/vkontakte/android/data/Posts$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/NewsEntry;Landroid/widget/EditText;Landroid/app/Activity;)Landroid/content/DialogInterface$OnClickListener;

    move-result-object v3

    .line 490
    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x7f08011f

    const/4 v3, 0x0

    .line 491
    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 492
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 493
    return-void
.end method

.method static synthetic lambda$editRepostComment$0(Lcom/vkontakte/android/NewsEntry;Landroid/widget/EditText;Landroid/app/Activity;Landroid/content/DialogInterface;I)V
    .locals 1
    .param p0, "e"    # Lcom/vkontakte/android/NewsEntry;
    .param p1, "edit"    # Landroid/widget/EditText;
    .param p2, "act"    # Landroid/app/Activity;
    .param p3, "dialog"    # Landroid/content/DialogInterface;
    .param p4, "which"    # I

    .prologue
    .line 490
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0, p2}, Lcom/vkontakte/android/data/Posts;->saveRepostComment(Lcom/vkontakte/android/NewsEntry;Ljava/lang/String;Landroid/app/Activity;)V

    return-void
.end method

.method public static like(Lcom/vkontakte/android/NewsEntry;ZLandroid/app/Activity;Ljava/lang/String;)V
    .locals 10
    .param p0, "e"    # Lcom/vkontakte/android/NewsEntry;
    .param p1, "liked"    # Z
    .param p2, "act"    # Landroid/app/Activity;
    .param p3, "referer"    # Ljava/lang/String;

    .prologue
    .line 536
    invoke-static {p2}, Lcom/vkontakte/android/auth/VKAuth;->ensureLoggedIn(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 591
    :cond_0
    :goto_0
    return-void

    .line 540
    :cond_1
    const/16 v0, 0x8

    invoke-virtual {p0, v0, p1}, Lcom/vkontakte/android/NewsEntry;->flag(IZ)V

    .line 541
    iget v0, p0, Lcom/vkontakte/android/NewsEntry;->type:I

    int-to-long v0, v0

    const/16 v4, 0x3c

    shl-long/2addr v0, v4

    iget v4, p0, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    int-to-long v4, v4

    const/16 v6, 0x20

    shl-long/2addr v4, v6

    or-long/2addr v0, v4

    iget v4, p0, Lcom/vkontakte/android/NewsEntry;->postID:I

    int-to-long v4, v4

    or-long v2, v0, v4

    .line 542
    .local v2, "id":J
    if-eqz p1, :cond_2

    .line 543
    iget v0, p0, Lcom/vkontakte/android/NewsEntry;->numLikes:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/vkontakte/android/NewsEntry;->numLikes:I

    .line 547
    :goto_1
    invoke-static {p0}, Lcom/vkontakte/android/data/Posts;->broadcastPostUpdate(Lcom/vkontakte/android/NewsEntry;)V

    .line 548
    sget-object v0, Lcom/vkontakte/android/data/Posts;->liking:Ljava/util/ArrayList;

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 551
    sget-object v0, Lcom/vkontakte/android/data/Posts;->liking:Ljava/util/ArrayList;

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 552
    iget v8, p0, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    .local v8, "lOid":I
    iget v9, p0, Lcom/vkontakte/android/NewsEntry;->postID:I

    .line 553
    .local v9, "lPid":I
    const-string/jumbo v0, ""

    invoke-static {p0, p1, v0}, Lcom/vkontakte/android/api/wall/WallLike;->newsEntry(Lcom/vkontakte/android/NewsEntry;ZLjava/lang/String;)Lcom/vkontakte/android/api/wall/WallLike;

    move-result-object v0

    const-string/jumbo v1, "ref"

    .line 554
    invoke-virtual {v0, v1, p3}, Lcom/vkontakte/android/api/wall/WallLike;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    new-instance v1, Lcom/vkontakte/android/data/Posts$4;

    move-object v4, p0

    move v5, p1

    move-object v6, p2

    move-object v7, p3

    invoke-direct/range {v1 .. v9}, Lcom/vkontakte/android/data/Posts$4;-><init>(JLcom/vkontakte/android/NewsEntry;ZLandroid/app/Activity;Ljava/lang/String;II)V

    .line 555
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 590
    invoke-virtual {v0}, Lcom/vkontakte/android/api/VKAPIRequest;->exec()Lcom/vkontakte/android/api/VKAPIRequest;

    goto :goto_0

    .line 545
    .end local v8    # "lOid":I
    .end local v9    # "lPid":I
    :cond_2
    iget v0, p0, Lcom/vkontakte/android/NewsEntry;->numLikes:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/vkontakte/android/NewsEntry;->numLikes:I

    goto :goto_1
.end method

.method public static publishPostponed(Lcom/vkontakte/android/NewsEntry;Landroid/app/Activity;Ljava/lang/Runnable;)V
    .locals 3
    .param p0, "e"    # Lcom/vkontakte/android/NewsEntry;
    .param p1, "context"    # Landroid/app/Activity;
    .param p2, "runAfter"    # Ljava/lang/Runnable;

    .prologue
    .line 119
    new-instance v0, Lcom/vkontakte/android/api/wall/WallPost;

    iget v1, p0, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    iget v2, p0, Lcom/vkontakte/android/NewsEntry;->postID:I

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/api/wall/WallPost;-><init>(II)V

    new-instance v1, Lcom/vkontakte/android/data/Posts$1;

    invoke-direct {v1, p1, p0, p1, p2}, Lcom/vkontakte/android/data/Posts$1;-><init>(Landroid/content/Context;Lcom/vkontakte/android/NewsEntry;Landroid/app/Activity;Ljava/lang/Runnable;)V

    .line 120
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/wall/WallPost;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 143
    invoke-virtual {v0, p1}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 144
    invoke-virtual {v0, p1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 145
    return-void
.end method

.method private static saveRepostComment(Lcom/vkontakte/android/NewsEntry;Ljava/lang/String;Landroid/app/Activity;)V
    .locals 3
    .param p0, "e"    # Lcom/vkontakte/android/NewsEntry;
    .param p1, "newComment"    # Ljava/lang/String;
    .param p2, "act"    # Landroid/app/Activity;

    .prologue
    .line 496
    new-instance v0, Lcom/vkontakte/android/api/wall/WallEdit;

    iget v1, p0, Lcom/vkontakte/android/NewsEntry;->postID:I

    iget v2, p0, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    invoke-direct {v0, v1, v2, p1}, Lcom/vkontakte/android/api/wall/WallEdit;-><init>(IILjava/lang/String;)V

    new-instance v1, Lcom/vkontakte/android/data/Posts$2;

    invoke-direct {v1, p2, p2, p0, p1}, Lcom/vkontakte/android/data/Posts$2;-><init>(Landroid/content/Context;Landroid/app/Activity;Lcom/vkontakte/android/NewsEntry;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/wall/WallEdit;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 514
    invoke-virtual {v0, p2}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    invoke-virtual {v0, p2}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 515
    return-void
.end method

.method public static toggleFixed(Lcom/vkontakte/android/NewsEntry;Landroid/app/Activity;Ljava/lang/Runnable;)V
    .locals 4
    .param p0, "post"    # Lcom/vkontakte/android/NewsEntry;
    .param p1, "act"    # Landroid/app/Activity;
    .param p2, "runAfter"    # Ljava/lang/Runnable;

    .prologue
    .line 610
    new-instance v1, Lcom/vkontakte/android/api/wall/WallSetFixed;

    iget v2, p0, Lcom/vkontakte/android/NewsEntry;->postID:I

    iget v3, p0, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    const/16 v0, 0x400

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/NewsEntry;->flag(I)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-direct {v1, v2, v3, v0}, Lcom/vkontakte/android/api/wall/WallSetFixed;-><init>(IIZ)V

    new-instance v0, Lcom/vkontakte/android/data/Posts$5;

    invoke-direct {v0, p1, p0, p1, p2}, Lcom/vkontakte/android/data/Posts$5;-><init>(Landroid/content/Context;Lcom/vkontakte/android/NewsEntry;Landroid/app/Activity;Ljava/lang/Runnable;)V

    invoke-virtual {v1, v0}, Lcom/vkontakte/android/api/wall/WallSetFixed;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 621
    invoke-virtual {v0, p1}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 622
    return-void

    .line 610
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
