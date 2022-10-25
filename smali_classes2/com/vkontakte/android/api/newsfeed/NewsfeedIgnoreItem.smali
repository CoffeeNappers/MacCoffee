.class public Lcom/vkontakte/android/api/newsfeed/NewsfeedIgnoreItem;
.super Lcom/vkontakte/android/api/ResultlessAPIRequest;
.source "NewsfeedIgnoreItem.java"


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/NewsEntry;Ljava/lang/String;)V
    .locals 2
    .param p1, "e"    # Lcom/vkontakte/android/NewsEntry;
    .param p2, "refer"    # Ljava/lang/String;

    .prologue
    .line 10
    const-string/jumbo v0, "newsfeed.ignoreItem"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/api/ResultlessAPIRequest;-><init>(Ljava/lang/String;)V

    .line 11
    const-string/jumbo v0, "owner_id"

    iget v1, p1, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/newsfeed/NewsfeedIgnoreItem;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 12
    const-string/jumbo v0, "item_id"

    iget v1, p1, Lcom/vkontakte/android/NewsEntry;->postID:I

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/newsfeed/NewsfeedIgnoreItem;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 13
    invoke-virtual {p1}, Lcom/vkontakte/android/NewsEntry;->hasTrackCode()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 14
    const-string/jumbo v0, "track_code"

    invoke-virtual {p1}, Lcom/vkontakte/android/NewsEntry;->getTrackCode()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/newsfeed/NewsfeedIgnoreItem;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 16
    :cond_0
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 17
    const-string/jumbo v0, "ref"

    invoke-virtual {p0, v0, p2}, Lcom/vkontakte/android/api/newsfeed/NewsfeedIgnoreItem;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 19
    :cond_1
    const/16 v0, 0x100

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/NewsEntry;->flag(I)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 20
    const-string/jumbo v0, "type"

    const-string/jumbo v1, "profilephoto"

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/newsfeed/NewsfeedIgnoreItem;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 41
    :goto_0
    return-void

    .line 22
    :cond_2
    iget v0, p1, Lcom/vkontakte/android/NewsEntry;->type:I

    sparse-switch v0, :sswitch_data_0

    .line 25
    const-string/jumbo v0, "type"

    const-string/jumbo v1, "wall"

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/newsfeed/NewsfeedIgnoreItem;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    goto :goto_0

    .line 28
    :sswitch_0
    const-string/jumbo v0, "type"

    const-string/jumbo v1, "tag"

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/newsfeed/NewsfeedIgnoreItem;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    goto :goto_0

    .line 31
    :sswitch_1
    const-string/jumbo v0, "type"

    const-string/jumbo v1, "photo"

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/newsfeed/NewsfeedIgnoreItem;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    goto :goto_0

    .line 34
    :sswitch_2
    const-string/jumbo v0, "type"

    const-string/jumbo v1, "video"

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/newsfeed/NewsfeedIgnoreItem;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    goto :goto_0

    .line 37
    :sswitch_3
    const-string/jumbo v0, "type"

    const-string/jumbo v1, "audio"

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/api/newsfeed/NewsfeedIgnoreItem;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    goto :goto_0

    .line 22
    nop

    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_1
        0x2 -> :sswitch_2
        0x7 -> :sswitch_0
        0xa -> :sswitch_3
    .end sparse-switch
.end method

.method public static canIgnore(Lcom/vkontakte/android/NewsEntry;)Z
    .locals 3
    .param p0, "e"    # Lcom/vkontakte/android/NewsEntry;

    .prologue
    const/4 v0, 0x1

    .line 44
    const/16 v1, 0x100

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/NewsEntry;->flag(I)Z

    move-result v1

    if-nez v1, :cond_0

    iget v1, p0, Lcom/vkontakte/android/NewsEntry;->type:I

    if-eqz v1, :cond_0

    iget v1, p0, Lcom/vkontakte/android/NewsEntry;->type:I

    const/4 v2, 0x7

    if-eq v1, v2, :cond_0

    iget v1, p0, Lcom/vkontakte/android/NewsEntry;->type:I

    if-eq v1, v0, :cond_0

    iget v1, p0, Lcom/vkontakte/android/NewsEntry;->type:I

    const/4 v2, 0x2

    if-eq v1, v2, :cond_0

    iget v1, p0, Lcom/vkontakte/android/NewsEntry;->type:I

    const/16 v2, 0xa

    if-ne v1, v2, :cond_1

    :cond_0
    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method
