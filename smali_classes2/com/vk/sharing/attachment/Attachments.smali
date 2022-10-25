.class public final Lcom/vk/sharing/attachment/Attachments;
.super Ljava/lang/Object;
.source "Attachments.java"


# static fields
.field private static final VK_HOST:Ljava/lang/String; = "https://vk.com/"


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static createInfo(Lcom/vk/music/dto/Playlist;Ljava/lang/String;)Lcom/vk/sharing/attachment/AttachmentInfo;
    .locals 5
    .param p0, "playlist"    # Lcom/vk/music/dto/Playlist;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "ref"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 153
    iget-object v1, p0, Lcom/vk/music/dto/Playlist;->photo:Lcom/vk/music/dto/Thumb;

    if-eqz v1, :cond_0

    .line 154
    const/4 v1, 0x1

    new-array v1, v1, [Lcom/vk/music/dto/Thumb;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/vk/music/dto/Playlist;->photo:Lcom/vk/music/dto/Thumb;

    aput-object v3, v1, v2

    invoke-static {v1}, Lcom/vk/core/util/CollectionUtils;->arrayOf([Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v0

    .line 160
    .local v0, "thumbs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/music/dto/Thumb;>;"
    :goto_0
    const/16 v1, 0xa

    iget v2, p0, Lcom/vk/music/dto/Playlist;->ownerId:I

    iget v3, p0, Lcom/vk/music/dto/Playlist;->id:I

    iget-object v4, p0, Lcom/vk/music/dto/Playlist;->accessKey:Ljava/lang/String;

    invoke-static {v1, p1, v2, v3, v4}, Lcom/vk/sharing/attachment/Attachments;->prepareInfoBuilder(ILjava/lang/String;IILjava/lang/String;)Lcom/vk/sharing/attachment/AttachmentInfo$Builder;

    move-result-object v1

    const-string/jumbo v2, "thumbs"

    .line 161
    invoke-virtual {v1, v2, v0}, Lcom/vk/sharing/attachment/AttachmentInfo$Builder;->put(Ljava/lang/String;Ljava/util/ArrayList;)Lcom/vk/sharing/attachment/AttachmentInfo$Builder;

    move-result-object v1

    const-string/jumbo v2, "title"

    iget-object v3, p0, Lcom/vk/music/dto/Playlist;->title:Ljava/lang/String;

    .line 162
    invoke-virtual {v1, v2, v3}, Lcom/vk/sharing/attachment/AttachmentInfo$Builder;->put(Ljava/lang/String;Ljava/lang/String;)Lcom/vk/sharing/attachment/AttachmentInfo$Builder;

    move-result-object v1

    .line 163
    invoke-virtual {v1}, Lcom/vk/sharing/attachment/AttachmentInfo$Builder;->build()Lcom/vk/sharing/attachment/AttachmentInfo;

    move-result-object v1

    return-object v1

    .line 155
    .end local v0    # "thumbs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/music/dto/Thumb;>;"
    :cond_0
    iget-object v1, p0, Lcom/vk/music/dto/Playlist;->thumbs:Ljava/util/List;

    if-eqz v1, :cond_1

    .line 156
    iget-object v1, p0, Lcom/vk/music/dto/Playlist;->thumbs:Ljava/util/List;

    invoke-static {v1}, Lcom/vk/core/util/CollectionUtils;->arrayOf(Ljava/util/Collection;)Ljava/util/ArrayList;

    move-result-object v0

    .restart local v0    # "thumbs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/music/dto/Thumb;>;"
    goto :goto_0

    .line 158
    .end local v0    # "thumbs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/music/dto/Thumb;>;"
    :cond_1
    const/4 v0, 0x0

    .restart local v0    # "thumbs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/music/dto/Thumb;>;"
    goto :goto_0
.end method

.method public static createInfo(Lcom/vkontakte/android/NewsEntry;Lcom/vkontakte/android/NewsComment;Ljava/lang/String;)Lcom/vk/sharing/attachment/AttachmentInfo;
    .locals 4
    .param p0, "entry"    # Lcom/vkontakte/android/NewsEntry;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "comment"    # Lcom/vkontakte/android/NewsComment;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "ref"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 86
    const/4 v0, 0x3

    iget v1, p0, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    iget v2, p1, Lcom/vkontakte/android/NewsComment;->cid:I

    const/4 v3, 0x0

    invoke-static {v0, p2, v1, v2, v3}, Lcom/vk/sharing/attachment/Attachments;->prepareInfoBuilder(ILjava/lang/String;IILjava/lang/String;)Lcom/vk/sharing/attachment/AttachmentInfo$Builder;

    move-result-object v0

    const-string/jumbo v1, "postId"

    iget v2, p0, Lcom/vkontakte/android/NewsEntry;->postID:I

    .line 87
    invoke-virtual {v0, v1, v2}, Lcom/vk/sharing/attachment/AttachmentInfo$Builder;->put(Ljava/lang/String;I)Lcom/vk/sharing/attachment/AttachmentInfo$Builder;

    move-result-object v0

    const-string/jumbo v1, "authorName"

    iget-object v2, p1, Lcom/vkontakte/android/NewsComment;->userName:Ljava/lang/String;

    .line 88
    invoke-virtual {v0, v1, v2}, Lcom/vk/sharing/attachment/AttachmentInfo$Builder;->put(Ljava/lang/String;Ljava/lang/String;)Lcom/vk/sharing/attachment/AttachmentInfo$Builder;

    move-result-object v0

    const-string/jumbo v1, "authorPhotoUrl"

    iget-object v2, p1, Lcom/vkontakte/android/NewsComment;->userPhoto:Ljava/lang/String;

    .line 89
    invoke-virtual {v0, v1, v2}, Lcom/vk/sharing/attachment/AttachmentInfo$Builder;->put(Ljava/lang/String;Ljava/lang/String;)Lcom/vk/sharing/attachment/AttachmentInfo$Builder;

    move-result-object v0

    const-string/jumbo v1, "trackCode"

    .line 90
    invoke-virtual {p0}, Lcom/vkontakte/android/NewsEntry;->getTrackCode()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/vk/sharing/attachment/AttachmentInfo$Builder;->put(Ljava/lang/String;Ljava/lang/String;)Lcom/vk/sharing/attachment/AttachmentInfo$Builder;

    move-result-object v0

    .line 91
    invoke-virtual {v0}, Lcom/vk/sharing/attachment/AttachmentInfo$Builder;->build()Lcom/vk/sharing/attachment/AttachmentInfo;

    move-result-object v0

    return-object v0
.end method

.method public static createInfo(Lcom/vkontakte/android/NewsEntry;Ljava/lang/String;)Lcom/vk/sharing/attachment/AttachmentInfo;
    .locals 6
    .param p0, "entry"    # Lcom/vkontakte/android/NewsEntry;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "ref"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x0

    .line 51
    iget v2, p0, Lcom/vkontakte/android/NewsEntry;->type:I

    sparse-switch v2, :sswitch_data_0

    .line 76
    const/4 v2, 0x1

    iget v3, p0, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    iget v4, p0, Lcom/vkontakte/android/NewsEntry;->postID:I

    invoke-static {v2, p1, v3, v4, v5}, Lcom/vk/sharing/attachment/Attachments;->prepareInfoBuilder(ILjava/lang/String;IILjava/lang/String;)Lcom/vk/sharing/attachment/AttachmentInfo$Builder;

    move-result-object v2

    const-string/jumbo v3, "authorName"

    iget-object v4, p0, Lcom/vkontakte/android/NewsEntry;->userName:Ljava/lang/String;

    .line 77
    invoke-virtual {v2, v3, v4}, Lcom/vk/sharing/attachment/AttachmentInfo$Builder;->put(Ljava/lang/String;Ljava/lang/String;)Lcom/vk/sharing/attachment/AttachmentInfo$Builder;

    move-result-object v2

    const-string/jumbo v3, "authorPhotoUrl"

    iget-object v4, p0, Lcom/vkontakte/android/NewsEntry;->userPhotoURL:Ljava/lang/String;

    .line 78
    invoke-virtual {v2, v3, v4}, Lcom/vk/sharing/attachment/AttachmentInfo$Builder;->put(Ljava/lang/String;Ljava/lang/String;)Lcom/vk/sharing/attachment/AttachmentInfo$Builder;

    move-result-object v2

    const-string/jumbo v3, "trackCode"

    .line 79
    invoke-virtual {p0}, Lcom/vkontakte/android/NewsEntry;->getTrackCode()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lcom/vk/sharing/attachment/AttachmentInfo$Builder;->put(Ljava/lang/String;Ljava/lang/String;)Lcom/vk/sharing/attachment/AttachmentInfo$Builder;

    move-result-object v2

    .line 80
    invoke-virtual {v2}, Lcom/vk/sharing/attachment/AttachmentInfo$Builder;->build()Lcom/vk/sharing/attachment/AttachmentInfo;

    move-result-object v2

    :goto_0
    return-object v2

    .line 53
    :sswitch_0
    new-instance v3, Lcom/vkontakte/android/Photo;

    iget-object v2, p0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/attachments/PhotoAttachment;

    invoke-direct {v3, v2}, Lcom/vkontakte/android/Photo;-><init>(Lcom/vkontakte/android/attachments/PhotoAttachment;)V

    invoke-static {v3, p1}, Lcom/vk/sharing/attachment/Attachments;->createInfo(Lcom/vkontakte/android/Photo;Ljava/lang/String;)Lcom/vk/sharing/attachment/AttachmentInfo;

    move-result-object v2

    goto :goto_0

    .line 55
    :sswitch_1
    iget-object v2, p0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/attachments/VideoAttachment;

    iget-object v2, v2, Lcom/vkontakte/android/attachments/VideoAttachment;->video:Lcom/vkontakte/android/api/VideoFile;

    invoke-static {v2, p1}, Lcom/vk/sharing/attachment/Attachments;->createInfo(Lcom/vkontakte/android/api/VideoFile;Ljava/lang/String;)Lcom/vk/sharing/attachment/AttachmentInfo;

    move-result-object v2

    goto :goto_0

    .line 57
    :sswitch_2
    iget-object v2, p0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/attachments/MarketAttachment;

    iget-object v2, v2, Lcom/vkontakte/android/attachments/MarketAttachment;->good:Lcom/vkontakte/android/data/Good;

    invoke-static {v2, p1}, Lcom/vk/sharing/attachment/Attachments;->createInfo(Lcom/vkontakte/android/data/Good;Ljava/lang/String;)Lcom/vk/sharing/attachment/AttachmentInfo;

    move-result-object v2

    goto :goto_0

    .line 59
    :sswitch_3
    iget-object v2, p0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/attachments/AudioAttachment;

    iget-object v2, v2, Lcom/vkontakte/android/attachments/AudioAttachment;->musicTrack:Lcom/vkontakte/android/audio/MusicTrack;

    invoke-static {v2, p1}, Lcom/vk/sharing/attachment/Attachments;->createInfo(Lcom/vkontakte/android/audio/MusicTrack;Ljava/lang/String;)Lcom/vk/sharing/attachment/AttachmentInfo;

    move-result-object v2

    goto :goto_0

    .line 61
    :sswitch_4
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 62
    .local v1, "stats":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/statistics/Statistic;>;"
    iget-object v2, p0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    if-eqz v2, :cond_1

    .line 63
    iget-object v2, p0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/attachments/Attachment;

    .line 64
    .local v0, "attachment":Lcom/vkontakte/android/attachments/Attachment;
    instance-of v3, v0, Lcom/vkontakte/android/statistics/Statistic;

    if-eqz v3, :cond_0

    .line 65
    check-cast v0, Lcom/vkontakte/android/statistics/Statistic;

    .end local v0    # "attachment":Lcom/vkontakte/android/attachments/Attachment;
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 69
    :cond_1
    const/4 v2, 0x2

    iget v3, p0, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    iget v4, p0, Lcom/vkontakte/android/NewsEntry;->postID:I

    invoke-static {v2, p1, v3, v4, v5}, Lcom/vk/sharing/attachment/Attachments;->prepareInfoBuilder(ILjava/lang/String;IILjava/lang/String;)Lcom/vk/sharing/attachment/AttachmentInfo$Builder;

    move-result-object v2

    const-string/jumbo v3, "authorName"

    iget-object v4, p0, Lcom/vkontakte/android/NewsEntry;->userName:Ljava/lang/String;

    .line 70
    invoke-virtual {v2, v3, v4}, Lcom/vk/sharing/attachment/AttachmentInfo$Builder;->put(Ljava/lang/String;Ljava/lang/String;)Lcom/vk/sharing/attachment/AttachmentInfo$Builder;

    move-result-object v2

    const-string/jumbo v3, "authorPhotoUrl"

    iget-object v4, p0, Lcom/vkontakte/android/NewsEntry;->userPhotoURL:Ljava/lang/String;

    .line 71
    invoke-virtual {v2, v3, v4}, Lcom/vk/sharing/attachment/AttachmentInfo$Builder;->put(Ljava/lang/String;Ljava/lang/String;)Lcom/vk/sharing/attachment/AttachmentInfo$Builder;

    move-result-object v2

    const-string/jumbo v3, "stats"

    .line 72
    invoke-virtual {v2, v3, v1}, Lcom/vk/sharing/attachment/AttachmentInfo$Builder;->put(Ljava/lang/String;Ljava/util/ArrayList;)Lcom/vk/sharing/attachment/AttachmentInfo$Builder;

    move-result-object v2

    const-string/jumbo v3, "trackCode"

    .line 73
    invoke-virtual {p0}, Lcom/vkontakte/android/NewsEntry;->getTrackCode()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lcom/vk/sharing/attachment/AttachmentInfo$Builder;->put(Ljava/lang/String;Ljava/lang/String;)Lcom/vk/sharing/attachment/AttachmentInfo$Builder;

    move-result-object v2

    .line 74
    invoke-virtual {v2}, Lcom/vk/sharing/attachment/AttachmentInfo$Builder;->build()Lcom/vk/sharing/attachment/AttachmentInfo;

    move-result-object v2

    goto/16 :goto_0

    .line 51
    nop

    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_0
        0x2 -> :sswitch_1
        0xa -> :sswitch_3
        0xc -> :sswitch_4
        0x12 -> :sswitch_2
    .end sparse-switch
.end method

.method public static createInfo(Lcom/vkontakte/android/Photo;Ljava/lang/String;)Lcom/vk/sharing/attachment/AttachmentInfo;
    .locals 5
    .param p0, "photo"    # Lcom/vkontakte/android/Photo;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "ref"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 106
    iget-object v1, p0, Lcom/vkontakte/android/Photo;->thumbURL:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 107
    iget-object v0, p0, Lcom/vkontakte/android/Photo;->thumbURL:Ljava/lang/String;

    .line 111
    .local v0, "thumbUrl":Ljava/lang/String;
    :goto_0
    const/4 v1, 0x5

    iget v2, p0, Lcom/vkontakte/android/Photo;->ownerID:I

    iget v3, p0, Lcom/vkontakte/android/Photo;->id:I

    iget-object v4, p0, Lcom/vkontakte/android/Photo;->accessKey:Ljava/lang/String;

    invoke-static {v1, p1, v2, v3, v4}, Lcom/vk/sharing/attachment/Attachments;->prepareInfoBuilder(ILjava/lang/String;IILjava/lang/String;)Lcom/vk/sharing/attachment/AttachmentInfo$Builder;

    move-result-object v1

    const-string/jumbo v2, "thumbUrl"

    .line 112
    invoke-virtual {v1, v2, v0}, Lcom/vk/sharing/attachment/AttachmentInfo$Builder;->put(Ljava/lang/String;Ljava/lang/String;)Lcom/vk/sharing/attachment/AttachmentInfo$Builder;

    move-result-object v1

    .line 113
    invoke-virtual {v1}, Lcom/vk/sharing/attachment/AttachmentInfo$Builder;->build()Lcom/vk/sharing/attachment/AttachmentInfo;

    move-result-object v1

    return-object v1

    .line 109
    .end local v0    # "thumbUrl":Ljava/lang/String;
    :cond_0
    const/16 v1, 0x6d

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/Photo;->getImage(C)Lcom/vkontakte/android/Photo$Image;

    move-result-object v1

    iget-object v0, v1, Lcom/vkontakte/android/Photo$Image;->url:Ljava/lang/String;

    .restart local v0    # "thumbUrl":Ljava/lang/String;
    goto :goto_0
.end method

.method public static createInfo(Lcom/vkontakte/android/api/Document;Ljava/lang/String;)Lcom/vk/sharing/attachment/AttachmentInfo;
    .locals 4
    .param p0, "document"    # Lcom/vkontakte/android/api/Document;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "ref"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 126
    const/16 v0, 0x8

    iget v1, p0, Lcom/vkontakte/android/api/Document;->oid:I

    iget v2, p0, Lcom/vkontakte/android/api/Document;->did:I

    iget-object v3, p0, Lcom/vkontakte/android/api/Document;->access_key:Ljava/lang/String;

    invoke-static {v0, p1, v1, v2, v3}, Lcom/vk/sharing/attachment/Attachments;->prepareInfoBuilder(ILjava/lang/String;IILjava/lang/String;)Lcom/vk/sharing/attachment/AttachmentInfo$Builder;

    move-result-object v0

    const-string/jumbo v1, "thumbUrl"

    iget-object v2, p0, Lcom/vkontakte/android/api/Document;->thumb:Ljava/lang/String;

    .line 127
    invoke-virtual {v0, v1, v2}, Lcom/vk/sharing/attachment/AttachmentInfo$Builder;->put(Ljava/lang/String;Ljava/lang/String;)Lcom/vk/sharing/attachment/AttachmentInfo$Builder;

    move-result-object v0

    const-string/jumbo v1, "extension"

    iget-object v2, p0, Lcom/vkontakte/android/api/Document;->ext:Ljava/lang/String;

    .line 128
    invoke-virtual {v0, v1, v2}, Lcom/vk/sharing/attachment/AttachmentInfo$Builder;->put(Ljava/lang/String;Ljava/lang/String;)Lcom/vk/sharing/attachment/AttachmentInfo$Builder;

    move-result-object v0

    const-string/jumbo v1, "size"

    iget v2, p0, Lcom/vkontakte/android/api/Document;->size:I

    .line 129
    invoke-virtual {v0, v1, v2}, Lcom/vk/sharing/attachment/AttachmentInfo$Builder;->put(Ljava/lang/String;I)Lcom/vk/sharing/attachment/AttachmentInfo$Builder;

    move-result-object v0

    .line 130
    invoke-virtual {v0}, Lcom/vk/sharing/attachment/AttachmentInfo$Builder;->build()Lcom/vk/sharing/attachment/AttachmentInfo;

    move-result-object v0

    return-object v0
.end method

.method public static createInfo(Lcom/vkontakte/android/api/VideoFile;Ljava/lang/String;)Lcom/vk/sharing/attachment/AttachmentInfo;
    .locals 4
    .param p0, "video"    # Lcom/vkontakte/android/api/VideoFile;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "ref"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 118
    const/4 v0, 0x6

    iget v1, p0, Lcom/vkontakte/android/api/VideoFile;->oid:I

    iget v2, p0, Lcom/vkontakte/android/api/VideoFile;->vid:I

    iget-object v3, p0, Lcom/vkontakte/android/api/VideoFile;->accessKey:Ljava/lang/String;

    invoke-static {v0, p1, v1, v2, v3}, Lcom/vk/sharing/attachment/Attachments;->prepareInfoBuilder(ILjava/lang/String;IILjava/lang/String;)Lcom/vk/sharing/attachment/AttachmentInfo$Builder;

    move-result-object v0

    const-string/jumbo v1, "thumbUrl"

    iget-object v2, p0, Lcom/vkontakte/android/api/VideoFile;->urlThumb:Ljava/lang/String;

    .line 119
    invoke-virtual {v0, v1, v2}, Lcom/vk/sharing/attachment/AttachmentInfo$Builder;->put(Ljava/lang/String;Ljava/lang/String;)Lcom/vk/sharing/attachment/AttachmentInfo$Builder;

    move-result-object v0

    const-string/jumbo v1, "duration"

    iget v2, p0, Lcom/vkontakte/android/api/VideoFile;->duration:I

    .line 120
    invoke-virtual {v0, v1, v2}, Lcom/vk/sharing/attachment/AttachmentInfo$Builder;->put(Ljava/lang/String;I)Lcom/vk/sharing/attachment/AttachmentInfo$Builder;

    move-result-object v0

    .line 121
    invoke-virtual {v0}, Lcom/vk/sharing/attachment/AttachmentInfo$Builder;->build()Lcom/vk/sharing/attachment/AttachmentInfo;

    move-result-object v0

    return-object v0
.end method

.method public static createInfo(Lcom/vkontakte/android/audio/MusicTrack;Ljava/lang/String;)Lcom/vk/sharing/attachment/AttachmentInfo;
    .locals 4
    .param p0, "track"    # Lcom/vkontakte/android/audio/MusicTrack;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "ref"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 96
    const/4 v0, 0x4

    iget v1, p0, Lcom/vkontakte/android/audio/MusicTrack;->oid:I

    iget v2, p0, Lcom/vkontakte/android/audio/MusicTrack;->aid:I

    iget-object v3, p0, Lcom/vkontakte/android/audio/MusicTrack;->accessKey:Ljava/lang/String;

    invoke-static {v0, p1, v1, v2, v3}, Lcom/vk/sharing/attachment/Attachments;->prepareInfoBuilder(ILjava/lang/String;IILjava/lang/String;)Lcom/vk/sharing/attachment/AttachmentInfo$Builder;

    move-result-object v0

    const-string/jumbo v1, "thumb"

    .line 97
    invoke-virtual {p0}, Lcom/vkontakte/android/audio/MusicTrack;->getThumb()Lcom/vk/music/dto/Thumb;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/vk/sharing/attachment/AttachmentInfo$Builder;->put(Ljava/lang/String;Landroid/os/Parcelable;)Lcom/vk/sharing/attachment/AttachmentInfo$Builder;

    move-result-object v0

    const-string/jumbo v1, "title"

    iget-object v2, p0, Lcom/vkontakte/android/audio/MusicTrack;->title:Ljava/lang/String;

    .line 98
    invoke-virtual {v0, v1, v2}, Lcom/vk/sharing/attachment/AttachmentInfo$Builder;->put(Ljava/lang/String;Ljava/lang/String;)Lcom/vk/sharing/attachment/AttachmentInfo$Builder;

    move-result-object v0

    const-string/jumbo v1, "artist"

    iget-object v2, p0, Lcom/vkontakte/android/audio/MusicTrack;->artist:Ljava/lang/String;

    .line 99
    invoke-virtual {v0, v1, v2}, Lcom/vk/sharing/attachment/AttachmentInfo$Builder;->put(Ljava/lang/String;Ljava/lang/String;)Lcom/vk/sharing/attachment/AttachmentInfo$Builder;

    move-result-object v0

    .line 100
    invoke-virtual {v0}, Lcom/vk/sharing/attachment/AttachmentInfo$Builder;->build()Lcom/vk/sharing/attachment/AttachmentInfo;

    move-result-object v0

    return-object v0
.end method

.method public static createInfo(Lcom/vkontakte/android/data/Good;Ljava/lang/String;)Lcom/vk/sharing/attachment/AttachmentInfo;
    .locals 4
    .param p0, "good"    # Lcom/vkontakte/android/data/Good;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "ref"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 135
    const/4 v0, 0x7

    iget v1, p0, Lcom/vkontakte/android/data/Good;->owner_id:I

    iget v2, p0, Lcom/vkontakte/android/data/Good;->id:I

    const/4 v3, 0x0

    invoke-static {v0, p1, v1, v2, v3}, Lcom/vk/sharing/attachment/Attachments;->prepareInfoBuilder(ILjava/lang/String;IILjava/lang/String;)Lcom/vk/sharing/attachment/AttachmentInfo$Builder;

    move-result-object v0

    const-string/jumbo v1, "thumbUrl"

    iget-object v2, p0, Lcom/vkontakte/android/data/Good;->thumb_photo:Ljava/lang/String;

    .line 136
    invoke-virtual {v0, v1, v2}, Lcom/vk/sharing/attachment/AttachmentInfo$Builder;->put(Ljava/lang/String;Ljava/lang/String;)Lcom/vk/sharing/attachment/AttachmentInfo$Builder;

    move-result-object v0

    const-string/jumbo v1, "title"

    iget-object v2, p0, Lcom/vkontakte/android/data/Good;->title:Ljava/lang/String;

    .line 137
    invoke-virtual {v0, v1, v2}, Lcom/vk/sharing/attachment/AttachmentInfo$Builder;->put(Ljava/lang/String;Ljava/lang/String;)Lcom/vk/sharing/attachment/AttachmentInfo$Builder;

    move-result-object v0

    const-string/jumbo v1, "cost"

    iget-object v2, p0, Lcom/vkontakte/android/data/Good;->price_text:Ljava/lang/String;

    .line 138
    invoke-virtual {v0, v1, v2}, Lcom/vk/sharing/attachment/AttachmentInfo$Builder;->put(Ljava/lang/String;Ljava/lang/String;)Lcom/vk/sharing/attachment/AttachmentInfo$Builder;

    move-result-object v0

    .line 139
    invoke-virtual {v0}, Lcom/vk/sharing/attachment/AttachmentInfo$Builder;->build()Lcom/vk/sharing/attachment/AttachmentInfo;

    move-result-object v0

    return-object v0
.end method

.method public static createInfo(Ljava/lang/String;Ljava/lang/String;Lcom/vk/stories/model/StoryEntry;Ljava/lang/String;)Lcom/vk/sharing/attachment/AttachmentInfo;
    .locals 4
    .param p0, "name"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p1, "photo"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p2, "story"    # Lcom/vk/stories/model/StoryEntry;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "ref"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 144
    const/16 v0, 0x9

    iget v1, p2, Lcom/vk/stories/model/StoryEntry;->ownerId:I

    iget v2, p2, Lcom/vk/stories/model/StoryEntry;->id:I

    iget-object v3, p2, Lcom/vk/stories/model/StoryEntry;->accessKey:Ljava/lang/String;

    invoke-static {v0, p3, v1, v2, v3}, Lcom/vk/sharing/attachment/Attachments;->prepareInfoBuilder(ILjava/lang/String;IILjava/lang/String;)Lcom/vk/sharing/attachment/AttachmentInfo$Builder;

    move-result-object v0

    const-string/jumbo v1, "authorName"

    .line 145
    invoke-virtual {v0, v1, p0}, Lcom/vk/sharing/attachment/AttachmentInfo$Builder;->put(Ljava/lang/String;Ljava/lang/String;)Lcom/vk/sharing/attachment/AttachmentInfo$Builder;

    move-result-object v0

    const-string/jumbo v1, "authorPhotoUrl"

    .line 146
    invoke-virtual {v0, v1, p1}, Lcom/vk/sharing/attachment/AttachmentInfo$Builder;->put(Ljava/lang/String;Ljava/lang/String;)Lcom/vk/sharing/attachment/AttachmentInfo$Builder;

    move-result-object v0

    .line 147
    invoke-virtual {v0}, Lcom/vk/sharing/attachment/AttachmentInfo$Builder;->build()Lcom/vk/sharing/attachment/AttachmentInfo;

    move-result-object v0

    return-object v0
.end method

.method public static createLink(Lcom/vk/sharing/attachment/AttachmentInfo;)Ljava/lang/String;
    .locals 4
    .param p0, "info"    # Lcom/vk/sharing/attachment/AttachmentInfo;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 182
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "https://vk.com/"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 183
    .local v0, "sb":Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Lcom/vk/sharing/attachment/AttachmentInfo;->getType()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    .line 216
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Unsupported type:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lcom/vk/sharing/attachment/AttachmentInfo;->getType()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 185
    :pswitch_0
    const-string/jumbo v1, "audio"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/vk/sharing/attachment/AttachmentInfo;->getOwnerId()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/vk/sharing/attachment/AttachmentInfo;->getMediaId()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 219
    :goto_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 188
    :pswitch_1
    const-string/jumbo v1, "doc"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/vk/sharing/attachment/AttachmentInfo;->getOwnerId()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/vk/sharing/attachment/AttachmentInfo;->getMediaId()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 191
    :pswitch_2
    const-string/jumbo v1, "market"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/vk/sharing/attachment/AttachmentInfo;->getOwnerId()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "?w=product"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/vk/sharing/attachment/AttachmentInfo;->getOwnerId()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/vk/sharing/attachment/AttachmentInfo;->getMediaId()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 194
    :pswitch_3
    const-string/jumbo v1, "photo"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/vk/sharing/attachment/AttachmentInfo;->getOwnerId()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/vk/sharing/attachment/AttachmentInfo;->getMediaId()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 197
    :pswitch_4
    const-string/jumbo v1, "story"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/vk/sharing/attachment/AttachmentInfo;->getOwnerId()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/vk/sharing/attachment/AttachmentInfo;->getMediaId()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    goto/16 :goto_0

    .line 200
    :pswitch_5
    const-string/jumbo v1, "video"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/vk/sharing/attachment/AttachmentInfo;->getOwnerId()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/vk/sharing/attachment/AttachmentInfo;->getMediaId()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    goto/16 :goto_0

    .line 203
    :pswitch_6
    const-string/jumbo v1, "wall"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/vk/sharing/attachment/AttachmentInfo;->getOwnerId()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/vk/sharing/attachment/AttachmentInfo;->getMediaId()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    goto/16 :goto_0

    .line 206
    :pswitch_7
    const-string/jumbo v1, "wall"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/vk/sharing/attachment/AttachmentInfo;->getOwnerId()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/vk/sharing/attachment/AttachmentInfo;->getData()Landroid/os/Bundle;

    move-result-object v2

    const-string/jumbo v3, "postId"

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "?reply="

    .line 207
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/vk/sharing/attachment/AttachmentInfo;->getMediaId()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    goto/16 :goto_0

    .line 210
    :pswitch_8
    const-string/jumbo v1, "wall"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/vk/sharing/attachment/AttachmentInfo;->getOwnerId()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/vk/sharing/attachment/AttachmentInfo;->getMediaId()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    goto/16 :goto_0

    .line 213
    :pswitch_9
    const-string/jumbo v1, "playlist"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/vk/sharing/attachment/AttachmentInfo;->getOwnerId()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/vk/sharing/attachment/AttachmentInfo;->getMediaId()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    goto/16 :goto_0

    .line 183
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_8
        :pswitch_6
        :pswitch_7
        :pswitch_0
        :pswitch_3
        :pswitch_5
        :pswitch_2
        :pswitch_1
        :pswitch_4
        :pswitch_9
    .end packed-switch
.end method

.method public static createViewHolder(Lcom/vk/sharing/attachment/AttachmentInfo;)Lcom/vk/sharing/attachment/AttachmentViewHolder;
    .locals 3
    .param p0, "info"    # Lcom/vk/sharing/attachment/AttachmentInfo;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 269
    invoke-virtual {p0}, Lcom/vk/sharing/attachment/AttachmentInfo;->getType()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 291
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Unsupported type:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/vk/sharing/attachment/AttachmentInfo;->getType()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 271
    :pswitch_0
    new-instance v0, Lcom/vk/sharing/attachment/AudioAttachmentViewHolder;

    invoke-virtual {p0}, Lcom/vk/sharing/attachment/AttachmentInfo;->getData()Landroid/os/Bundle;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vk/sharing/attachment/AudioAttachmentViewHolder;-><init>(Landroid/os/Bundle;)V

    .line 289
    :goto_0
    return-object v0

    .line 273
    :pswitch_1
    new-instance v0, Lcom/vk/sharing/attachment/DocumentAttachmentViewHolder;

    invoke-virtual {p0}, Lcom/vk/sharing/attachment/AttachmentInfo;->getData()Landroid/os/Bundle;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vk/sharing/attachment/DocumentAttachmentViewHolder;-><init>(Landroid/os/Bundle;)V

    goto :goto_0

    .line 275
    :pswitch_2
    new-instance v0, Lcom/vk/sharing/attachment/MarketAttachmentViewHolder;

    invoke-virtual {p0}, Lcom/vk/sharing/attachment/AttachmentInfo;->getData()Landroid/os/Bundle;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vk/sharing/attachment/MarketAttachmentViewHolder;-><init>(Landroid/os/Bundle;)V

    goto :goto_0

    .line 277
    :pswitch_3
    new-instance v0, Lcom/vk/sharing/attachment/PhotoAttachmentViewHolder;

    invoke-virtual {p0}, Lcom/vk/sharing/attachment/AttachmentInfo;->getData()Landroid/os/Bundle;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vk/sharing/attachment/PhotoAttachmentViewHolder;-><init>(Landroid/os/Bundle;)V

    goto :goto_0

    .line 279
    :pswitch_4
    new-instance v0, Lcom/vk/sharing/attachment/AuthorAttachmentViewHolder;

    invoke-virtual {p0}, Lcom/vk/sharing/attachment/AttachmentInfo;->getData()Landroid/os/Bundle;

    move-result-object v1

    const v2, 0x7f080681

    invoke-direct {v0, v1, v2}, Lcom/vk/sharing/attachment/AuthorAttachmentViewHolder;-><init>(Landroid/os/Bundle;I)V

    goto :goto_0

    .line 281
    :pswitch_5
    new-instance v0, Lcom/vk/sharing/attachment/VideoAttachmentViewHolder;

    invoke-virtual {p0}, Lcom/vk/sharing/attachment/AttachmentInfo;->getData()Landroid/os/Bundle;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vk/sharing/attachment/VideoAttachmentViewHolder;-><init>(Landroid/os/Bundle;)V

    goto :goto_0

    .line 283
    :pswitch_6
    new-instance v0, Lcom/vk/sharing/attachment/AuthorAttachmentViewHolder;

    invoke-virtual {p0}, Lcom/vk/sharing/attachment/AttachmentInfo;->getData()Landroid/os/Bundle;

    move-result-object v1

    const v2, 0x7f08066f

    invoke-direct {v0, v1, v2}, Lcom/vk/sharing/attachment/AuthorAttachmentViewHolder;-><init>(Landroid/os/Bundle;I)V

    goto :goto_0

    .line 285
    :pswitch_7
    new-instance v0, Lcom/vk/sharing/attachment/AuthorAttachmentViewHolder;

    invoke-virtual {p0}, Lcom/vk/sharing/attachment/AttachmentInfo;->getData()Landroid/os/Bundle;

    move-result-object v1

    const v2, 0x7f08067f

    invoke-direct {v0, v1, v2}, Lcom/vk/sharing/attachment/AuthorAttachmentViewHolder;-><init>(Landroid/os/Bundle;I)V

    goto :goto_0

    .line 287
    :pswitch_8
    new-instance v0, Lcom/vk/sharing/attachment/AuthorAttachmentViewHolder;

    invoke-virtual {p0}, Lcom/vk/sharing/attachment/AttachmentInfo;->getData()Landroid/os/Bundle;

    move-result-object v1

    const v2, 0x7f08067e

    invoke-direct {v0, v1, v2}, Lcom/vk/sharing/attachment/AuthorAttachmentViewHolder;-><init>(Landroid/os/Bundle;I)V

    goto :goto_0

    .line 289
    :pswitch_9
    new-instance v0, Lcom/vk/sharing/attachment/PlaylistAttachmentViewHolder;

    invoke-virtual {p0}, Lcom/vk/sharing/attachment/AttachmentInfo;->getData()Landroid/os/Bundle;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vk/sharing/attachment/PlaylistAttachmentViewHolder;-><init>(Landroid/os/Bundle;)V

    goto :goto_0

    .line 269
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_8
        :pswitch_6
        :pswitch_7
        :pswitch_0
        :pswitch_3
        :pswitch_5
        :pswitch_2
        :pswitch_1
        :pswitch_4
        :pswitch_9
    .end packed-switch
.end method

.method private static defaultStringRepresentation(Lcom/vk/sharing/attachment/AttachmentInfo;)Ljava/lang/String;
    .locals 3
    .param p0, "info"    # Lcom/vk/sharing/attachment/AttachmentInfo;

    .prologue
    .line 296
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/vk/sharing/attachment/AttachmentInfo;->getOwnerId()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/vk/sharing/attachment/AttachmentInfo;->getMediaId()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/vk/sharing/attachment/AttachmentInfo;->getAccessKey()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "_"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/vk/sharing/attachment/AttachmentInfo;->getAccessKey()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_0
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    const-string/jumbo v0, ""

    goto :goto_0
.end method

.method private static prepareInfoBuilder(ILjava/lang/String;IILjava/lang/String;)Lcom/vk/sharing/attachment/AttachmentInfo$Builder;
    .locals 2
    .param p0, "type"    # I
    .param p1, "ref"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "ownerId"    # I
    .param p3, "mediaId"    # I
    .param p4, "accessKey"    # Ljava/lang/String;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 168
    new-instance v1, Lcom/vk/sharing/attachment/AttachmentInfo$Builder;

    invoke-direct {v1, p0, p1}, Lcom/vk/sharing/attachment/AttachmentInfo$Builder;-><init>(ILjava/lang/String;)V

    invoke-virtual {v1, p2}, Lcom/vk/sharing/attachment/AttachmentInfo$Builder;->ownerId(I)Lcom/vk/sharing/attachment/AttachmentInfo$Builder;

    move-result-object v1

    invoke-virtual {v1, p3}, Lcom/vk/sharing/attachment/AttachmentInfo$Builder;->mediaId(I)Lcom/vk/sharing/attachment/AttachmentInfo$Builder;

    move-result-object v0

    .line 169
    .local v0, "info":Lcom/vk/sharing/attachment/AttachmentInfo$Builder;
    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 170
    invoke-virtual {v0, p4}, Lcom/vk/sharing/attachment/AttachmentInfo$Builder;->accessKey(Ljava/lang/String;)Lcom/vk/sharing/attachment/AttachmentInfo$Builder;

    .line 172
    :cond_0
    return-object v0
.end method

.method public static toString(Lcom/vk/sharing/attachment/AttachmentInfo;)Ljava/lang/String;
    .locals 4
    .param p0, "info"    # Lcom/vk/sharing/attachment/AttachmentInfo;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 229
    if-nez p0, :cond_0

    .line 230
    const-string/jumbo v1, ""

    .line 259
    :goto_0
    return-object v1

    .line 234
    :cond_0
    invoke-virtual {p0}, Lcom/vk/sharing/attachment/AttachmentInfo;->getType()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    .line 257
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Unsupported type:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lcom/vk/sharing/attachment/AttachmentInfo;->getType()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 236
    :pswitch_0
    const-string/jumbo v0, "audio"

    .line 259
    .local v0, "type":Ljava/lang/String;
    :goto_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {p0}, Lcom/vk/sharing/attachment/Attachments;->defaultStringRepresentation(Lcom/vk/sharing/attachment/AttachmentInfo;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 238
    .end local v0    # "type":Ljava/lang/String;
    :pswitch_1
    const-string/jumbo v0, "doc"

    .restart local v0    # "type":Ljava/lang/String;
    goto :goto_1

    .line 240
    .end local v0    # "type":Ljava/lang/String;
    :pswitch_2
    const-string/jumbo v0, "market"

    .restart local v0    # "type":Ljava/lang/String;
    goto :goto_1

    .line 242
    .end local v0    # "type":Ljava/lang/String;
    :pswitch_3
    const-string/jumbo v0, "photo"

    .restart local v0    # "type":Ljava/lang/String;
    goto :goto_1

    .line 244
    .end local v0    # "type":Ljava/lang/String;
    :pswitch_4
    const-string/jumbo v0, "story"

    .restart local v0    # "type":Ljava/lang/String;
    goto :goto_1

    .line 246
    .end local v0    # "type":Ljava/lang/String;
    :pswitch_5
    const-string/jumbo v0, "video"

    .restart local v0    # "type":Ljava/lang/String;
    goto :goto_1

    .line 248
    .end local v0    # "type":Ljava/lang/String;
    :pswitch_6
    const-string/jumbo v0, "wall_ads"

    .restart local v0    # "type":Ljava/lang/String;
    goto :goto_1

    .line 251
    .end local v0    # "type":Ljava/lang/String;
    :pswitch_7
    const-string/jumbo v0, "wall"

    .restart local v0    # "type":Ljava/lang/String;
    goto :goto_1

    .line 253
    .end local v0    # "type":Ljava/lang/String;
    :pswitch_8
    const-string/jumbo v0, "wall"

    .restart local v0    # "type":Ljava/lang/String;
    goto :goto_1

    .line 255
    .end local v0    # "type":Ljava/lang/String;
    :pswitch_9
    const-string/jumbo v0, "audio_playlist"

    .restart local v0    # "type":Ljava/lang/String;
    goto :goto_1

    .line 234
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_8
        :pswitch_6
        :pswitch_7
        :pswitch_0
        :pswitch_3
        :pswitch_5
        :pswitch_2
        :pswitch_1
        :pswitch_4
        :pswitch_9
    .end packed-switch
.end method
