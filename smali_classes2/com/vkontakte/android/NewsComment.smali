.class public Lcom/vkontakte/android/NewsComment;
.super Ljava/lang/Object;
.source "NewsComment.java"

# interfaces
.implements Landroid/os/Parcelable;
.implements Lcom/vkontakte/android/Comment;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/vkontakte/android/NewsComment;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public attachments:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/attachments/Attachment;",
            ">;"
        }
    .end annotation
.end field

.field public canDelete:Z

.field public canEdit:Z

.field public cid:I

.field public cnum:I

.field public displayableText:Ljava/lang/CharSequence;

.field public isAuthorVerified:Z

.field public isBanned:Z

.field public isDeleted:Z

.field public isLiked:Z

.field public isReported:Z

.field public numLikes:I

.field public replyToCommentID:I

.field public respToName:Ljava/lang/String;

.field public text:Ljava/lang/String;

.field public time:I

.field public uid:I

.field public userName:Ljava/lang/String;

.field public userPhoto:Ljava/lang/String;

.field public userRName:Ljava/lang/String;

.field public userWName:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 138
    new-instance v0, Lcom/vkontakte/android/NewsComment$1;

    invoke-direct {v0}, Lcom/vkontakte/android/NewsComment$1;-><init>()V

    sput-object v0, Lcom/vkontakte/android/NewsComment;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/NewsComment;->attachments:Ljava/util/ArrayList;

    .line 50
    return-void
.end method

.method public constructor <init>(Landroid/os/Parcel;)V
    .locals 3
    .param p1, "p"    # Landroid/os/Parcel;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/NewsComment;->attachments:Ljava/util/ArrayList;

    .line 53
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/NewsComment;->text:Ljava/lang/String;

    .line 54
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/NewsComment;->userName:Ljava/lang/String;

    .line 55
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/NewsComment;->userRName:Ljava/lang/String;

    .line 56
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/NewsComment;->userWName:Ljava/lang/String;

    .line 57
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/NewsComment;->time:I

    .line 58
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/NewsComment;->respToName:Ljava/lang/String;

    .line 59
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/NewsComment;->userPhoto:Ljava/lang/String;

    .line 60
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/NewsComment;->cid:I

    .line 61
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/NewsComment;->uid:I

    .line 62
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/NewsComment;->cnum:I

    .line 63
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/NewsComment;->replyToCommentID:I

    .line 64
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    if-eqz v0, :cond_0

    move v0, v1

    :goto_0
    iput-boolean v0, p0, Lcom/vkontakte/android/NewsComment;->canDelete:Z

    .line 65
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/NewsComment;->numLikes:I

    .line 66
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    if-eqz v0, :cond_1

    move v0, v1

    :goto_1
    iput-boolean v0, p0, Lcom/vkontakte/android/NewsComment;->isLiked:Z

    .line 67
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    if-eqz v0, :cond_2

    :goto_2
    iput-boolean v1, p0, Lcom/vkontakte/android/NewsComment;->isDeleted:Z

    .line 68
    return-void

    :cond_0
    move v0, v2

    .line 64
    goto :goto_0

    :cond_1
    move v0, v2

    .line 66
    goto :goto_1

    :cond_2
    move v1, v2

    .line 67
    goto :goto_2
.end method

.method public constructor <init>(Lorg/json/JSONObject;Landroid/util/SparseArray;Landroid/util/SparseArray;Landroid/util/SparseArray;Ljava/util/ArrayList;)V
    .locals 8
    .param p1, "jc"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONObject;",
            "Landroid/util/SparseArray",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Landroid/util/SparseArray",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Landroid/util/SparseArray",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .local p2, "names":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    .local p3, "photos":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    .local p4, "names_dat":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    .local p5, "verifiedList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    const/4 v6, 0x0

    const/4 v5, 0x1

    .line 70
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    iput-object v4, p0, Lcom/vkontakte/android/NewsComment;->attachments:Ljava/util/ArrayList;

    .line 71
    const-string/jumbo v4, "id"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v4

    iput v4, p0, Lcom/vkontakte/android/NewsComment;->cid:I

    .line 72
    const-string/jumbo v4, "from_id"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v4

    iput v4, p0, Lcom/vkontakte/android/NewsComment;->uid:I

    .line 73
    const-string/jumbo v4, "text"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 75
    .local v3, "txt":Ljava/lang/String;
    invoke-virtual {p0, v3}, Lcom/vkontakte/android/NewsComment;->setText(Ljava/lang/String;)V

    .line 76
    iget v4, p0, Lcom/vkontakte/android/NewsComment;->uid:I

    invoke-virtual {p3, v4}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    iput-object v4, p0, Lcom/vkontakte/android/NewsComment;->userPhoto:Ljava/lang/String;

    .line 77
    iget v4, p0, Lcom/vkontakte/android/NewsComment;->uid:I

    invoke-virtual {p2, v4}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    iput-object v4, p0, Lcom/vkontakte/android/NewsComment;->userName:Ljava/lang/String;

    .line 78
    iget v4, p0, Lcom/vkontakte/android/NewsComment;->uid:I

    invoke-virtual {p4, v4}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    iput-object v4, p0, Lcom/vkontakte/android/NewsComment;->userRName:Ljava/lang/String;

    .line 80
    iget v4, p0, Lcom/vkontakte/android/NewsComment;->uid:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {p5, v4}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v4

    iput-boolean v4, p0, Lcom/vkontakte/android/NewsComment;->isAuthorVerified:Z

    .line 82
    iget-object v4, p0, Lcom/vkontakte/android/NewsComment;->userRName:Ljava/lang/String;

    if-eqz v4, :cond_0

    iget-object v4, p0, Lcom/vkontakte/android/NewsComment;->userRName:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 84
    :cond_0
    iget-object v4, p0, Lcom/vkontakte/android/NewsComment;->userName:Ljava/lang/String;

    iput-object v4, p0, Lcom/vkontakte/android/NewsComment;->userRName:Ljava/lang/String;

    .line 87
    :cond_1
    const-string/jumbo v4, "reply_to_user"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 88
    const-string/jumbo v4, "reply_to_user"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v2

    .line 89
    .local v2, "id":I
    if-gez v2, :cond_4

    .line 90
    sget-object v4, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const v7, 0x7f080150

    invoke-virtual {v4, v7}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/vkontakte/android/NewsComment;->respToName:Ljava/lang/String;

    .line 95
    .end local v2    # "id":I
    :cond_2
    :goto_0
    const-string/jumbo v4, "date"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v4

    iput v4, p0, Lcom/vkontakte/android/NewsComment;->time:I

    .line 96
    const-string/jumbo v4, "can_edit"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v4

    if-ne v4, v5, :cond_5

    move v4, v5

    :goto_1
    iput-boolean v4, p0, Lcom/vkontakte/android/NewsComment;->canEdit:Z

    .line 97
    const-string/jumbo v4, "reply_to_comment"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v4

    iput v4, p0, Lcom/vkontakte/android/NewsComment;->replyToCommentID:I

    .line 99
    const-string/jumbo v4, "likes"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 100
    const-string/jumbo v4, "likes"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    const-string/jumbo v7, "count"

    invoke-virtual {v4, v7}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v4

    iput v4, p0, Lcom/vkontakte/android/NewsComment;->numLikes:I

    .line 101
    const-string/jumbo v4, "likes"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    const-string/jumbo v7, "user_likes"

    invoke-virtual {v4, v7}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v4

    if-ne v4, v5, :cond_6

    :goto_2
    iput-boolean v5, p0, Lcom/vkontakte/android/NewsComment;->isLiked:Z

    .line 104
    :cond_3
    const-string/jumbo v4, "attachments"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_8

    .line 105
    const-string/jumbo v4, "attachments"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    .line 106
    .local v0, "atts":Lorg/json/JSONArray;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_3
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v4

    if-ge v1, v4, :cond_7

    .line 107
    iget-object v4, p0, Lcom/vkontakte/android/NewsComment;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v5

    invoke-static {v5, p2, p3}, Lcom/vkontakte/android/attachments/Attachment;->parse(Lorg/json/JSONObject;Landroid/util/SparseArray;Landroid/util/SparseArray;)Lcom/vkontakte/android/attachments/Attachment;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 106
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    .line 92
    .end local v0    # "atts":Lorg/json/JSONArray;
    .end local v1    # "i":I
    .restart local v2    # "id":I
    :cond_4
    invoke-virtual {p4, v2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    iput-object v4, p0, Lcom/vkontakte/android/NewsComment;->respToName:Ljava/lang/String;

    goto :goto_0

    .end local v2    # "id":I
    :cond_5
    move v4, v6

    .line 96
    goto :goto_1

    :cond_6
    move v5, v6

    .line 101
    goto :goto_2

    .line 109
    .restart local v0    # "atts":Lorg/json/JSONArray;
    .restart local v1    # "i":I
    :cond_7
    iget-object v4, p0, Lcom/vkontakte/android/NewsComment;->attachments:Ljava/util/ArrayList;

    invoke-static {v4}, Lcom/vkontakte/android/attachments/Attachment;->sort(Ljava/util/List;)V

    .line 111
    .end local v0    # "atts":Lorg/json/JSONArray;
    .end local v1    # "i":I
    :cond_8
    return-void
.end method


# virtual methods
.method public canEdit()Z
    .locals 1

    .prologue
    .line 217
    iget-boolean v0, p0, Lcom/vkontakte/android/NewsComment;->canEdit:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/vkontakte/android/NewsComment;->containsGraffiti()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public containsGraffiti()Z
    .locals 3

    .prologue
    .line 225
    iget-object v2, p0, Lcom/vkontakte/android/NewsComment;->attachments:Ljava/util/ArrayList;

    if-eqz v2, :cond_1

    .line 226
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v2, p0, Lcom/vkontakte/android/NewsComment;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 227
    iget-object v2, p0, Lcom/vkontakte/android/NewsComment;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/attachments/Attachment;

    .line 228
    .local v0, "att":Lcom/vkontakte/android/attachments/Attachment;
    instance-of v2, v0, Lcom/vkontakte/android/attachments/GraffitiAttachment;

    if-eqz v2, :cond_0

    .line 229
    const/4 v2, 0x1

    .line 233
    .end local v0    # "att":Lcom/vkontakte/android/attachments/Attachment;
    .end local v1    # "i":I
    :goto_1
    return v2

    .line 226
    .restart local v0    # "att":Lcom/vkontakte/android/attachments/Attachment;
    .restart local v1    # "i":I
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 233
    .end local v0    # "att":Lcom/vkontakte/android/attachments/Attachment;
    .end local v1    # "i":I
    :cond_1
    const/4 v2, 0x0

    goto :goto_1
.end method

.method public describeContents()I
    .locals 1

    .prologue
    .line 150
    const/4 v0, 0x0

    return v0
.end method

.method public getAttachments()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/attachments/Attachment;",
            ">;"
        }
    .end annotation

    .prologue
    .line 157
    iget-object v0, p0, Lcom/vkontakte/android/NewsComment;->attachments:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getDisplayableText()Ljava/lang/CharSequence;
    .locals 1

    .prologue
    .line 172
    iget-object v0, p0, Lcom/vkontakte/android/NewsComment;->displayableText:Ljava/lang/CharSequence;

    return-object v0
.end method

.method public getId()I
    .locals 1

    .prologue
    .line 197
    iget v0, p0, Lcom/vkontakte/android/NewsComment;->cid:I

    return v0
.end method

.method public getNumLikes()I
    .locals 1

    .prologue
    .line 187
    iget v0, p0, Lcom/vkontakte/android/NewsComment;->numLikes:I

    return v0
.end method

.method public getResponseName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 202
    iget-object v0, p0, Lcom/vkontakte/android/NewsComment;->respToName:Ljava/lang/String;

    return-object v0
.end method

.method public getTime()I
    .locals 1

    .prologue
    .line 177
    iget v0, p0, Lcom/vkontakte/android/NewsComment;->time:I

    return v0
.end method

.method public getUid()I
    .locals 1

    .prologue
    .line 182
    iget v0, p0, Lcom/vkontakte/android/NewsComment;->uid:I

    return v0
.end method

.method public getUserName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 167
    iget-object v0, p0, Lcom/vkontakte/android/NewsComment;->userName:Ljava/lang/String;

    return-object v0
.end method

.method public getUserPhoto()Ljava/lang/String;
    .locals 1

    .prologue
    .line 162
    iget-object v0, p0, Lcom/vkontakte/android/NewsComment;->userPhoto:Ljava/lang/String;

    return-object v0
.end method

.method public isAuthorVerified()Z
    .locals 1

    .prologue
    .line 221
    iget-boolean v0, p0, Lcom/vkontakte/android/NewsComment;->isAuthorVerified:Z

    return v0
.end method

.method public isBanned()Z
    .locals 1

    .prologue
    .line 207
    iget-boolean v0, p0, Lcom/vkontakte/android/NewsComment;->isBanned:Z

    return v0
.end method

.method public isLiked()Z
    .locals 1

    .prologue
    .line 192
    iget-boolean v0, p0, Lcom/vkontakte/android/NewsComment;->isLiked:Z

    return v0
.end method

.method public isReported()Z
    .locals 1

    .prologue
    .line 212
    iget-boolean v0, p0, Lcom/vkontakte/android/NewsComment;->isReported:Z

    return v0
.end method

.method public setText(Ljava/lang/String;)V
    .locals 1
    .param p1, "t"    # Ljava/lang/String;

    .prologue
    .line 134
    iput-object p1, p0, Lcom/vkontakte/android/NewsComment;->text:Ljava/lang/String;

    .line 135
    iget-object v0, p0, Lcom/vkontakte/android/NewsComment;->text:Ljava/lang/String;

    invoke-static {v0}, Lcom/vkontakte/android/LinkParser;->parseLinks(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-static {v0}, Lcom/vkontakte/android/Global;->replaceEmoji(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/NewsComment;->displayableText:Ljava/lang/CharSequence;

    .line 136
    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 3
    .param p1, "p"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 116
    iget-object v0, p0, Lcom/vkontakte/android/NewsComment;->text:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 117
    iget-object v0, p0, Lcom/vkontakte/android/NewsComment;->userName:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 118
    iget-object v0, p0, Lcom/vkontakte/android/NewsComment;->userRName:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 119
    iget-object v0, p0, Lcom/vkontakte/android/NewsComment;->userWName:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 120
    iget v0, p0, Lcom/vkontakte/android/NewsComment;->time:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 121
    iget-object v0, p0, Lcom/vkontakte/android/NewsComment;->respToName:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 122
    iget-object v0, p0, Lcom/vkontakte/android/NewsComment;->userPhoto:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 123
    iget v0, p0, Lcom/vkontakte/android/NewsComment;->cid:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 124
    iget v0, p0, Lcom/vkontakte/android/NewsComment;->uid:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 125
    iget v0, p0, Lcom/vkontakte/android/NewsComment;->cnum:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 126
    iget v0, p0, Lcom/vkontakte/android/NewsComment;->replyToCommentID:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 127
    iget-boolean v0, p0, Lcom/vkontakte/android/NewsComment;->canDelete:Z

    if-eqz v0, :cond_0

    move v0, v1

    :goto_0
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 128
    iget v0, p0, Lcom/vkontakte/android/NewsComment;->numLikes:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 129
    iget-boolean v0, p0, Lcom/vkontakte/android/NewsComment;->isLiked:Z

    if-eqz v0, :cond_1

    move v0, v1

    :goto_1
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 130
    iget-boolean v0, p0, Lcom/vkontakte/android/NewsComment;->isDeleted:Z

    if-eqz v0, :cond_2

    :goto_2
    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeInt(I)V

    .line 131
    return-void

    :cond_0
    move v0, v2

    .line 127
    goto :goto_0

    :cond_1
    move v0, v2

    .line 129
    goto :goto_1

    :cond_2
    move v1, v2

    .line 130
    goto :goto_2
.end method
