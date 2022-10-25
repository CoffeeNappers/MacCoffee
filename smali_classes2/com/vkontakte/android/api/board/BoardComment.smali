.class public Lcom/vkontakte/android/api/board/BoardComment;
.super Ljava/lang/Object;
.source "BoardComment.java"

# interfaces
.implements Lcom/vkontakte/android/data/ServerKeys;
.implements Lcom/vkontakte/android/Comment;
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/vkontakte/android/api/board/BoardComment;",
            ">;"
        }
    .end annotation
.end field

.field static final PATTERN_REPLY:Ljava/util/regex/Pattern;

.field static final STRING_PATTERN_REPLY:Ljava/lang/String; = "\\[((id|club)[0-9]+)(?::bp[-_0-9]+)?\\|([^\\]]+)\\]"

.field static final ptn1:Ljava/util/regex/Pattern;

.field static final ptn2:Ljava/util/regex/Pattern;

.field static final ptn3:Ljava/util/regex/Pattern;

.field static final ptn4:Ljava/util/regex/Pattern;

.field static final ptn5:Ljava/util/regex/Pattern;


# instance fields
.field public final attachments:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/attachments/Attachment;",
            ">;"
        }
    .end annotation
.end field

.field public canLike:Z

.field public displayableText:Ljava/lang/CharSequence;

.field public final id:I

.field public isLiked:Z

.field public likesCount:I

.field public final linkTitles:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public final linkUrls:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public offset:I

.field public final ownerId:I

.field public final replyToCommentID:I

.field public final respToName:Ljava/lang/String;

.field public text:Ljava/lang/String;

.field public final time:I

.field public final uid:I

.field public final userName:Ljava/lang/String;

.field public final userPhoto:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 36
    const-string/jumbo v0, "\\[((id|club)[0-9]+)(?::bp[-_0-9]+)?\\|([^\\]]+)\\]"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/vkontakte/android/api/board/BoardComment;->PATTERN_REPLY:Ljava/util/regex/Pattern;

    .line 38
    const-string/jumbo v0, "((?:(?:http|https)://)?[a-zA-Z\u0430-\u044f\u0410-\u042f0-9-]+\\.[a-zA-Z\u0430-\u044f\u0410-\u042f]{2,4}[a-zA-Z/?\\.=#%&-_]+)"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/vkontakte/android/api/board/BoardComment;->ptn1:Ljava/util/regex/Pattern;

    .line 39
    const-string/jumbo v0, "\\[id(\\d+):bp\\-(\\d+)_(\\d+)\\|([^\\]]+)\\]"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/vkontakte/android/api/board/BoardComment;->ptn2:Ljava/util/regex/Pattern;

    .line 40
    const-string/jumbo v0, "\\[club(\\d+):bp\\-(\\d+)_(\\d+)\\|([^\\]]+)\\]"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/vkontakte/android/api/board/BoardComment;->ptn3:Ljava/util/regex/Pattern;

    .line 41
    const-string/jumbo v0, "\\[id(\\d+)\\|([^\\]]+)\\]"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/vkontakte/android/api/board/BoardComment;->ptn4:Ljava/util/regex/Pattern;

    .line 42
    const-string/jumbo v0, "\\[club(\\d+)\\|([^\\]]+)\\]"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/vkontakte/android/api/board/BoardComment;->ptn5:Ljava/util/regex/Pattern;

    .line 338
    new-instance v0, Lcom/vkontakte/android/api/board/BoardComment$1;

    invoke-direct {v0}, Lcom/vkontakte/android/api/board/BoardComment$1;-><init>()V

    sput-object v0, Lcom/vkontakte/android/api/board/BoardComment;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;IIIILjava/lang/String;I)V
    .locals 2
    .param p1, "id"    # I
    .param p2, "text"    # Ljava/lang/String;
    .param p3, "userName"    # Ljava/lang/String;
    .param p4, "userPhoto"    # Ljava/lang/String;
    .param p5, "uid"    # I
    .param p6, "time"    # I
    .param p7, "offset"    # I
    .param p8, "ownerId"    # I
    .param p9, "replyToUser"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p10, "replyToComment"    # I

    .prologue
    const/4 v1, 0x0

    .line 72
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/api/board/BoardComment;->attachments:Ljava/util/ArrayList;

    .line 52
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/api/board/BoardComment;->linkTitles:Ljava/util/ArrayList;

    .line 53
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/api/board/BoardComment;->linkUrls:Ljava/util/ArrayList;

    .line 57
    iput v1, p0, Lcom/vkontakte/android/api/board/BoardComment;->likesCount:I

    .line 58
    iput-boolean v1, p0, Lcom/vkontakte/android/api/board/BoardComment;->isLiked:Z

    .line 59
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/api/board/BoardComment;->canLike:Z

    .line 73
    iput p8, p0, Lcom/vkontakte/android/api/board/BoardComment;->ownerId:I

    .line 74
    iput p1, p0, Lcom/vkontakte/android/api/board/BoardComment;->id:I

    .line 75
    iput-object p2, p0, Lcom/vkontakte/android/api/board/BoardComment;->text:Ljava/lang/String;

    .line 76
    iput-object p3, p0, Lcom/vkontakte/android/api/board/BoardComment;->userName:Ljava/lang/String;

    .line 77
    iput-object p4, p0, Lcom/vkontakte/android/api/board/BoardComment;->userPhoto:Ljava/lang/String;

    .line 78
    iput p5, p0, Lcom/vkontakte/android/api/board/BoardComment;->uid:I

    .line 79
    iput p6, p0, Lcom/vkontakte/android/api/board/BoardComment;->time:I

    .line 80
    iput p7, p0, Lcom/vkontakte/android/api/board/BoardComment;->offset:I

    .line 81
    iput-object p9, p0, Lcom/vkontakte/android/api/board/BoardComment;->respToName:Ljava/lang/String;

    .line 82
    iput p10, p0, Lcom/vkontakte/android/api/board/BoardComment;->replyToCommentID:I

    .line 83
    invoke-virtual {p0}, Lcom/vkontakte/android/api/board/BoardComment;->processLinksAndEmoji()V

    .line 84
    return-void
.end method

.method public constructor <init>(Landroid/os/Parcel;)V
    .locals 7
    .param p1, "parcel"    # Landroid/os/Parcel;

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 283
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/vkontakte/android/api/board/BoardComment;->attachments:Ljava/util/ArrayList;

    .line 52
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/vkontakte/android/api/board/BoardComment;->linkTitles:Ljava/util/ArrayList;

    .line 53
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/vkontakte/android/api/board/BoardComment;->linkUrls:Ljava/util/ArrayList;

    .line 57
    iput v3, p0, Lcom/vkontakte/android/api/board/BoardComment;->likesCount:I

    .line 58
    iput-boolean v3, p0, Lcom/vkontakte/android/api/board/BoardComment;->isLiked:Z

    .line 59
    iput-boolean v2, p0, Lcom/vkontakte/android/api/board/BoardComment;->canLike:Z

    .line 284
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    iput v1, p0, Lcom/vkontakte/android/api/board/BoardComment;->id:I

    .line 285
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/api/board/BoardComment;->text:Ljava/lang/String;

    .line 286
    invoke-virtual {p0}, Lcom/vkontakte/android/api/board/BoardComment;->processLinksAndEmoji()V

    .line 288
    const-class v1, Lcom/vkontakte/android/attachments/Attachment;

    invoke-virtual {v1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/os/Parcel;->readParcelableArray(Ljava/lang/ClassLoader;)[Landroid/os/Parcelable;

    move-result-object v4

    array-length v5, v4

    move v1, v3

    :goto_0
    if-ge v1, v5, :cond_0

    aget-object v0, v4, v1

    .line 289
    .local v0, "parcelable":Landroid/os/Parcelable;
    iget-object v6, p0, Lcom/vkontakte/android/api/board/BoardComment;->attachments:Ljava/util/ArrayList;

    check-cast v0, Lcom/vkontakte/android/attachments/Attachment;

    .end local v0    # "parcelable":Landroid/os/Parcelable;
    invoke-virtual {v6, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 288
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 292
    :cond_0
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/api/board/BoardComment;->userName:Ljava/lang/String;

    .line 293
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/api/board/BoardComment;->userPhoto:Ljava/lang/String;

    .line 294
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    iput v1, p0, Lcom/vkontakte/android/api/board/BoardComment;->uid:I

    .line 295
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    iput v1, p0, Lcom/vkontakte/android/api/board/BoardComment;->time:I

    .line 296
    iget-object v1, p0, Lcom/vkontakte/android/api/board/BoardComment;->linkTitles:Ljava/util/ArrayList;

    invoke-virtual {p1, v1}, Landroid/os/Parcel;->readStringList(Ljava/util/List;)V

    .line 297
    iget-object v1, p0, Lcom/vkontakte/android/api/board/BoardComment;->linkUrls:Ljava/util/ArrayList;

    invoke-virtual {p1, v1}, Landroid/os/Parcel;->readStringList(Ljava/util/List;)V

    .line 298
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    iput v1, p0, Lcom/vkontakte/android/api/board/BoardComment;->offset:I

    .line 299
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    iput v1, p0, Lcom/vkontakte/android/api/board/BoardComment;->ownerId:I

    .line 300
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    iput v1, p0, Lcom/vkontakte/android/api/board/BoardComment;->likesCount:I

    .line 301
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v1

    if-eqz v1, :cond_1

    move v1, v2

    :goto_1
    iput-boolean v1, p0, Lcom/vkontakte/android/api/board/BoardComment;->isLiked:Z

    .line 302
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v1

    if-eqz v1, :cond_2

    :goto_2
    iput-boolean v2, p0, Lcom/vkontakte/android/api/board/BoardComment;->canLike:Z

    .line 303
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/api/board/BoardComment;->respToName:Ljava/lang/String;

    .line 304
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    iput v1, p0, Lcom/vkontakte/android/api/board/BoardComment;->replyToCommentID:I

    .line 305
    return-void

    :cond_1
    move v1, v3

    .line 301
    goto :goto_1

    :cond_2
    move v2, v3

    .line 302
    goto :goto_2
.end method

.method public constructor <init>(Lorg/json/JSONObject;Landroid/util/SparseArray;Landroid/util/SparseArray;IILandroid/util/SparseArray;)V
    .locals 9
    .param p1, "jc"    # Lorg/json/JSONObject;
    .param p4, "offset"    # I
    .param p5, "ownerId"    # I
    .param p6    # Landroid/util/SparseArray;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
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
            ">;II",
            "Landroid/util/SparseArray",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 86
    .local p2, "names":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    .local p3, "photos":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    .local p6, "names_dat":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    iput-object v7, p0, Lcom/vkontakte/android/api/board/BoardComment;->attachments:Ljava/util/ArrayList;

    .line 52
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    iput-object v7, p0, Lcom/vkontakte/android/api/board/BoardComment;->linkTitles:Ljava/util/ArrayList;

    .line 53
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    iput-object v7, p0, Lcom/vkontakte/android/api/board/BoardComment;->linkUrls:Ljava/util/ArrayList;

    .line 57
    const/4 v7, 0x0

    iput v7, p0, Lcom/vkontakte/android/api/board/BoardComment;->likesCount:I

    .line 58
    const/4 v7, 0x0

    iput-boolean v7, p0, Lcom/vkontakte/android/api/board/BoardComment;->isLiked:Z

    .line 59
    const/4 v7, 0x1

    iput-boolean v7, p0, Lcom/vkontakte/android/api/board/BoardComment;->canLike:Z

    .line 87
    iput p5, p0, Lcom/vkontakte/android/api/board/BoardComment;->ownerId:I

    .line 88
    const-string/jumbo v7, "id"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v7

    iput v7, p0, Lcom/vkontakte/android/api/board/BoardComment;->id:I

    .line 89
    const-string/jumbo v7, "from_id"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v7

    iput v7, p0, Lcom/vkontakte/android/api/board/BoardComment;->uid:I

    .line 90
    const-string/jumbo v7, "text"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 91
    .local v6, "text":Ljava/lang/String;
    const-string/jumbo v7, "date"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v7

    iput v7, p0, Lcom/vkontakte/android/api/board/BoardComment;->time:I

    .line 92
    iget v7, p0, Lcom/vkontakte/android/api/board/BoardComment;->uid:I

    invoke-virtual {p2, v7}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    iput-object v7, p0, Lcom/vkontakte/android/api/board/BoardComment;->userName:Ljava/lang/String;

    .line 93
    iget v7, p0, Lcom/vkontakte/android/api/board/BoardComment;->uid:I

    invoke-virtual {p3, v7}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    iput-object v7, p0, Lcom/vkontakte/android/api/board/BoardComment;->userPhoto:Ljava/lang/String;

    .line 95
    const-string/jumbo v7, "reply_to_user"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 96
    const-string/jumbo v7, "reply_to_user"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v1

    .line 97
    .local v1, "id":I
    if-gez v1, :cond_0

    .line 98
    sget-object v7, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const v8, 0x7f080150

    invoke-virtual {v7, v8}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/vkontakte/android/api/board/BoardComment;->respToName:Ljava/lang/String;

    .line 107
    .end local v1    # "id":I
    :goto_0
    const-string/jumbo v7, "reply_to_comment"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v7

    iput v7, p0, Lcom/vkontakte/android/api/board/BoardComment;->replyToCommentID:I

    .line 109
    const-string/jumbo v7, "attachments"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 110
    const-string/jumbo v7, "attachments"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    .line 111
    .local v0, "atts":Lorg/json/JSONArray;
    const/4 v2, 0x0

    .local v2, "j":I
    :goto_1
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v7

    if-ge v2, v7, :cond_3

    .line 112
    iget-object v7, p0, Lcom/vkontakte/android/api/board/BoardComment;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v0, v2}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v8

    invoke-static {v8, p2, p3}, Lcom/vkontakte/android/attachments/Attachment;->parse(Lorg/json/JSONObject;Landroid/util/SparseArray;Landroid/util/SparseArray;)Lcom/vkontakte/android/attachments/Attachment;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 111
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 99
    .end local v0    # "atts":Lorg/json/JSONArray;
    .end local v2    # "j":I
    .restart local v1    # "id":I
    :cond_0
    if-eqz p6, :cond_1

    .line 100
    invoke-virtual {p6, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    iput-object v7, p0, Lcom/vkontakte/android/api/board/BoardComment;->respToName:Ljava/lang/String;

    goto :goto_0

    .line 102
    :cond_1
    const/4 v7, 0x0

    iput-object v7, p0, Lcom/vkontakte/android/api/board/BoardComment;->respToName:Ljava/lang/String;

    goto :goto_0

    .line 105
    .end local v1    # "id":I
    :cond_2
    const/4 v7, 0x0

    iput-object v7, p0, Lcom/vkontakte/android/api/board/BoardComment;->respToName:Ljava/lang/String;

    goto :goto_0

    .line 115
    :cond_3
    iget-object v7, p0, Lcom/vkontakte/android/api/board/BoardComment;->attachments:Ljava/util/ArrayList;

    invoke-static {v7}, Lcom/vkontakte/android/attachments/Attachment;->sort(Ljava/util/List;)V

    .line 116
    sget-object v7, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-virtual {v7}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    invoke-virtual {v7}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v4

    .line 117
    .local v4, "metrics":Landroid/util/DisplayMetrics;
    iget v7, v4, Landroid/util/DisplayMetrics;->widthPixels:I

    iget v8, v4, Landroid/util/DisplayMetrics;->heightPixels:I

    invoke-static {v7, v8}, Ljava/lang/Math;->min(II)I

    move-result v7

    const/high16 v8, 0x42be0000    # 95.0f

    invoke-static {v8}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v8

    sub-int v5, v7, v8

    .line 118
    .local v5, "tSize":I
    const/16 v7, 0x25c

    invoke-static {v5, v7}, Ljava/lang/Math;->min(II)I

    move-result v5

    .line 119
    int-to-float v7, v5

    const v8, 0x3f2a7efa    # 0.666f

    mul-float/2addr v7, v8

    float-to-int v7, v7

    iget-object v8, p0, Lcom/vkontakte/android/api/board/BoardComment;->attachments:Ljava/util/ArrayList;

    invoke-static {v5, v7, v8}, Lcom/vkontakte/android/ZhukovLayout;->processThumbs(IILjava/util/List;)V

    .line 121
    const-string/jumbo v7, "likes"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_4

    .line 122
    const-string/jumbo v7, "likes"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    .line 123
    .local v3, "likesObj":Lorg/json/JSONObject;
    const-string/jumbo v7, "count"

    iget v8, p0, Lcom/vkontakte/android/api/board/BoardComment;->likesCount:I

    invoke-virtual {v3, v7, v8}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v7

    iput v7, p0, Lcom/vkontakte/android/api/board/BoardComment;->likesCount:I

    .line 124
    const-string/jumbo v7, "user_likes"

    const/4 v8, 0x0

    invoke-virtual {v3, v7, v8}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v7

    if-eqz v7, :cond_5

    const/4 v7, 0x1

    :goto_2
    iput-boolean v7, p0, Lcom/vkontakte/android/api/board/BoardComment;->isLiked:Z

    .line 125
    const-string/jumbo v7, "can_like"

    const/4 v8, 0x1

    invoke-virtual {v3, v7, v8}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v7

    if-eqz v7, :cond_6

    const/4 v7, 0x1

    :goto_3
    iput-boolean v7, p0, Lcom/vkontakte/android/api/board/BoardComment;->canLike:Z

    .line 128
    .end local v3    # "likesObj":Lorg/json/JSONObject;
    :cond_4
    iput-object v6, p0, Lcom/vkontakte/android/api/board/BoardComment;->text:Ljava/lang/String;

    .line 129
    invoke-virtual {p0}, Lcom/vkontakte/android/api/board/BoardComment;->processLinksAndEmoji()V

    .line 130
    iput p4, p0, Lcom/vkontakte/android/api/board/BoardComment;->offset:I

    .line 131
    return-void

    .line 124
    .restart local v3    # "likesObj":Lorg/json/JSONObject;
    :cond_5
    const/4 v7, 0x0

    goto :goto_2

    .line 125
    :cond_6
    const/4 v7, 0x0

    goto :goto_3
.end method

.method public static createNewComment(IILjava/util/List;Ljava/lang/String;Z)Lcom/vkontakte/android/api/board/BoardComment;
    .locals 7
    .param p0, "groupId"    # I
    .param p1, "commentId"    # I
    .param p3, "text"    # Ljava/lang/String;
    .param p4, "fromGroup"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/attachments/Attachment;",
            ">;",
            "Ljava/lang/String;",
            "Z)",
            "Lcom/vkontakte/android/api/board/BoardComment;"
        }
    .end annotation

    .prologue
    .line 349
    .local p2, "atts":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/attachments/Attachment;>;"
    const/4 v5, 0x0

    const/4 v6, 0x0

    move v0, p0

    move v1, p1

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    invoke-static/range {v0 .. v6}, Lcom/vkontakte/android/api/board/BoardComment;->createNewComment(IILjava/util/List;Ljava/lang/String;ZLjava/lang/String;I)Lcom/vkontakte/android/api/board/BoardComment;

    move-result-object v0

    return-object v0
.end method

.method public static createNewComment(IILjava/util/List;Ljava/lang/String;ZLjava/lang/String;I)Lcom/vkontakte/android/api/board/BoardComment;
    .locals 18
    .param p0, "groupId"    # I
    .param p1, "commentId"    # I
    .param p3, "text"    # Ljava/lang/String;
    .param p4, "fromGroup"    # Z
    .param p5, "replyToUser"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p6, "replyToComment"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/attachments/Attachment;",
            ">;",
            "Ljava/lang/String;",
            "Z",
            "Ljava/lang/String;",
            "I)",
            "Lcom/vkontakte/android/api/board/BoardComment;"
        }
    .end annotation

    .prologue
    .line 353
    .local p2, "atts":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/attachments/Attachment;>;"
    const-string/jumbo v2, "((?:(?:http|https)://)?[a-zA-Z\u0430-\u044f\u0410-\u042f0-9-]+\\.[a-zA-Z\u0430-\u044f\u0410-\u042f]{2,4}[a-zA-Z/?\\.=#%&-_]+)"

    invoke-static {v2}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v16

    .line 354
    .local v16, "ptn1":Ljava/util/regex/Pattern;
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v12

    .line 359
    .local v12, "account":Lcom/vkontakte/android/auth/VKAccount;
    if-eqz p4, :cond_1

    .line 360
    move/from16 v0, p0

    neg-int v6, v0

    .line 361
    .local v6, "uid":I
    invoke-static/range {p0 .. p0}, Lcom/vkontakte/android/data/Groups;->getById(I)Lcom/vkontakte/android/api/Group;

    move-result-object v13

    .line 362
    .local v13, "g":Lcom/vkontakte/android/api/Group;
    if-eqz v13, :cond_0

    .line 363
    iget-object v4, v13, Lcom/vkontakte/android/api/Group;->name:Ljava/lang/String;

    .line 364
    .local v4, "name":Ljava/lang/String;
    iget-object v5, v13, Lcom/vkontakte/android/api/Group;->photo:Ljava/lang/String;

    .line 375
    .end local v13    # "g":Lcom/vkontakte/android/api/Group;
    .local v5, "photo":Ljava/lang/String;
    :goto_0
    new-instance v1, Lcom/vkontakte/android/api/board/BoardComment;

    invoke-static {}, Lcom/vkontakte/android/TimeUtils;->getCurrentTime()I

    move-result v7

    const/4 v8, 0x0

    move/from16 v2, p1

    move-object/from16 v3, p3

    move/from16 v9, p0

    move-object/from16 v10, p5

    move/from16 v11, p6

    invoke-direct/range {v1 .. v11}, Lcom/vkontakte/android/api/board/BoardComment;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;IIIILjava/lang/String;I)V

    .line 376
    .local v1, "comment":Lcom/vkontakte/android/api/board/BoardComment;
    invoke-virtual {v1}, Lcom/vkontakte/android/api/board/BoardComment;->processLinksAndEmoji()V

    .line 377
    iget-object v2, v1, Lcom/vkontakte/android/api/board/BoardComment;->attachments:Ljava/util/ArrayList;

    move-object/from16 v0, p2

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 378
    sget-object v2, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v15

    .line 379
    .local v15, "metrics":Landroid/util/DisplayMetrics;
    iget v2, v15, Landroid/util/DisplayMetrics;->widthPixels:I

    iget v3, v15, Landroid/util/DisplayMetrics;->heightPixels:I

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v2

    const/high16 v3, 0x42be0000    # 95.0f

    invoke-static {v3}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v3

    sub-int v17, v2, v3

    .line 380
    .local v17, "tSize":I
    const/16 v2, 0x25c

    move/from16 v0, v17

    invoke-static {v0, v2}, Ljava/lang/Math;->min(II)I

    move-result v17

    .line 381
    move/from16 v0, v17

    int-to-float v2, v0

    const v3, 0x3f2a7efa    # 0.666f

    mul-float/2addr v2, v3

    float-to-int v2, v2

    iget-object v3, v1, Lcom/vkontakte/android/api/board/BoardComment;->attachments:Ljava/util/ArrayList;

    move/from16 v0, v17

    invoke-static {v0, v2, v3}, Lcom/vkontakte/android/ZhukovLayout;->processThumbs(IILjava/util/List;)V

    .line 382
    iget-object v2, v1, Lcom/vkontakte/android/api/board/BoardComment;->text:Ljava/lang/String;

    move-object/from16 v0, v16

    invoke-virtual {v0, v2}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v14

    .line 383
    .local v14, "matcher":Ljava/util/regex/Matcher;
    :goto_1
    invoke-virtual {v14}, Ljava/util/regex/Matcher;->find()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 384
    iget-object v2, v1, Lcom/vkontakte/android/api/board/BoardComment;->linkUrls:Ljava/util/ArrayList;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "vklink://view/?"

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v14}, Ljava/util/regex/Matcher;->group()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 385
    iget-object v2, v1, Lcom/vkontakte/android/api/board/BoardComment;->linkTitles:Ljava/util/ArrayList;

    invoke-virtual {v14}, Ljava/util/regex/Matcher;->group()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 366
    .end local v1    # "comment":Lcom/vkontakte/android/api/board/BoardComment;
    .end local v4    # "name":Ljava/lang/String;
    .end local v5    # "photo":Ljava/lang/String;
    .end local v14    # "matcher":Ljava/util/regex/Matcher;
    .end local v15    # "metrics":Landroid/util/DisplayMetrics;
    .end local v17    # "tSize":I
    .restart local v13    # "g":Lcom/vkontakte/android/api/Group;
    :cond_0
    const-string/jumbo v4, "DELETED"

    .line 367
    .restart local v4    # "name":Ljava/lang/String;
    const/4 v5, 0x0

    .restart local v5    # "photo":Ljava/lang/String;
    goto/16 :goto_0

    .line 370
    .end local v4    # "name":Ljava/lang/String;
    .end local v5    # "photo":Ljava/lang/String;
    .end local v6    # "uid":I
    .end local v13    # "g":Lcom/vkontakte/android/api/Group;
    :cond_1
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v6

    .line 371
    .restart local v6    # "uid":I
    invoke-virtual {v12}, Lcom/vkontakte/android/auth/VKAccount;->getName()Ljava/lang/String;

    move-result-object v4

    .line 372
    .restart local v4    # "name":Ljava/lang/String;
    invoke-virtual {v12}, Lcom/vkontakte/android/auth/VKAccount;->getPhoto()Ljava/lang/String;

    move-result-object v5

    .restart local v5    # "photo":Ljava/lang/String;
    goto/16 :goto_0

    .line 387
    .restart local v1    # "comment":Lcom/vkontakte/android/api/board/BoardComment;
    .restart local v14    # "matcher":Ljava/util/regex/Matcher;
    .restart local v15    # "metrics":Landroid/util/DisplayMetrics;
    .restart local v17    # "tSize":I
    :cond_2
    return-object v1
.end method


# virtual methods
.method public canEdit()Z
    .locals 5

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 263
    iget v3, p0, Lcom/vkontakte/android/api/board/BoardComment;->uid:I

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v4

    invoke-virtual {v4}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v4

    if-ne v3, v4, :cond_0

    move v0, v1

    .line 264
    .local v0, "canEdit":Z
    :goto_0
    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/vkontakte/android/api/board/BoardComment;->containsGraffiti()Z

    move-result v3

    if-nez v3, :cond_1

    :goto_1
    return v1

    .end local v0    # "canEdit":Z
    :cond_0
    move v0, v2

    .line 263
    goto :goto_0

    .restart local v0    # "canEdit":Z
    :cond_1
    move v1, v2

    .line 264
    goto :goto_1
.end method

.method public containsGraffiti()Z
    .locals 3

    .prologue
    .line 269
    iget-object v2, p0, Lcom/vkontakte/android/api/board/BoardComment;->attachments:Ljava/util/ArrayList;

    if-eqz v2, :cond_1

    .line 270
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v2, p0, Lcom/vkontakte/android/api/board/BoardComment;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 271
    iget-object v2, p0, Lcom/vkontakte/android/api/board/BoardComment;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/attachments/Attachment;

    .line 272
    .local v0, "att":Lcom/vkontakte/android/attachments/Attachment;
    instance-of v2, v0, Lcom/vkontakte/android/attachments/GraffitiAttachment;

    if-eqz v2, :cond_0

    .line 273
    const/4 v2, 0x1

    .line 277
    .end local v0    # "att":Lcom/vkontakte/android/attachments/Attachment;
    .end local v1    # "i":I
    :goto_1
    return v2

    .line 270
    .restart local v0    # "att":Lcom/vkontakte/android/attachments/Attachment;
    .restart local v1    # "i":I
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 277
    .end local v0    # "att":Lcom/vkontakte/android/attachments/Attachment;
    .end local v1    # "i":I
    :cond_1
    const/4 v2, 0x0

    goto :goto_1
.end method

.method public describeContents()I
    .locals 1

    .prologue
    .line 335
    const/4 v0, 0x0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 2
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 191
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    move-result v0

    invoke-virtual {p0}, Lcom/vkontakte/android/api/board/BoardComment;->hashCode()I

    move-result v1

    if-eq v0, v1, :cond_1

    :cond_0
    instance-of v0, p1, Lcom/vkontakte/android/api/board/BoardComment;

    if-eqz v0, :cond_2

    check-cast p1, Lcom/vkontakte/android/api/board/BoardComment;

    .end local p1    # "o":Ljava/lang/Object;
    iget v0, p1, Lcom/vkontakte/android/api/board/BoardComment;->id:I

    iget v1, p0, Lcom/vkontakte/android/api/board/BoardComment;->id:I

    if-ne v0, v1, :cond_2

    :cond_1
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_2
    const/4 v0, 0x0

    goto :goto_0
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
    .line 198
    iget-object v0, p0, Lcom/vkontakte/android/api/board/BoardComment;->attachments:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getDisplayableText()Ljava/lang/CharSequence;
    .locals 1

    .prologue
    .line 213
    iget-object v0, p0, Lcom/vkontakte/android/api/board/BoardComment;->displayableText:Ljava/lang/CharSequence;

    return-object v0
.end method

.method public getId()I
    .locals 1

    .prologue
    .line 238
    iget v0, p0, Lcom/vkontakte/android/api/board/BoardComment;->id:I

    return v0
.end method

.method public getNumLikes()I
    .locals 1

    .prologue
    .line 228
    iget v0, p0, Lcom/vkontakte/android/api/board/BoardComment;->likesCount:I

    return v0
.end method

.method public getResponseName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 243
    iget-object v0, p0, Lcom/vkontakte/android/api/board/BoardComment;->respToName:Ljava/lang/String;

    return-object v0
.end method

.method public getTime()I
    .locals 1

    .prologue
    .line 218
    iget v0, p0, Lcom/vkontakte/android/api/board/BoardComment;->time:I

    return v0
.end method

.method public getUid()I
    .locals 1

    .prologue
    .line 223
    iget v0, p0, Lcom/vkontakte/android/api/board/BoardComment;->uid:I

    return v0
.end method

.method public getUserName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 208
    iget-object v0, p0, Lcom/vkontakte/android/api/board/BoardComment;->userName:Ljava/lang/String;

    return-object v0
.end method

.method public getUserPhoto()Ljava/lang/String;
    .locals 1

    .prologue
    .line 203
    iget-object v0, p0, Lcom/vkontakte/android/api/board/BoardComment;->userPhoto:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 1

    .prologue
    .line 186
    iget v0, p0, Lcom/vkontakte/android/api/board/BoardComment;->id:I

    return v0
.end method

.method public isAuthorVerified()Z
    .locals 1

    .prologue
    .line 258
    const/4 v0, 0x0

    return v0
.end method

.method public isBanned()Z
    .locals 1

    .prologue
    .line 248
    const/4 v0, 0x0

    return v0
.end method

.method public isLiked()Z
    .locals 1

    .prologue
    .line 233
    iget-boolean v0, p0, Lcom/vkontakte/android/api/board/BoardComment;->isLiked:Z

    return v0
.end method

.method public isReported()Z
    .locals 1

    .prologue
    .line 253
    const/4 v0, 0x0

    return v0
.end method

.method public processLinksAndEmoji()V
    .locals 13

    .prologue
    const/4 v12, 0x4

    const/4 v11, 0x2

    const/4 v10, 0x3

    const/4 v9, 0x0

    const/4 v8, 0x1

    .line 134
    iget-object v5, p0, Lcom/vkontakte/android/api/board/BoardComment;->text:Ljava/lang/String;

    invoke-static {v5}, Lcom/vkontakte/android/LinkParser;->parseLinks(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v5

    invoke-static {v5}, Lcom/vkontakte/android/Global;->replaceEmoji(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v5

    iput-object v5, p0, Lcom/vkontakte/android/api/board/BoardComment;->displayableText:Ljava/lang/CharSequence;

    .line 135
    sget-object v5, Lcom/vkontakte/android/api/board/BoardComment;->ptn2:Ljava/util/regex/Pattern;

    iget-object v6, p0, Lcom/vkontakte/android/api/board/BoardComment;->displayableText:Ljava/lang/CharSequence;

    invoke-virtual {v5, v6}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    .line 136
    .local v0, "matcher":Ljava/util/regex/Matcher;
    :goto_0
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->find()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 137
    iget-object v5, p0, Lcom/vkontakte/android/api/board/BoardComment;->linkUrls:Ljava/util/ArrayList;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "vkontakte://profile/"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v0, v8}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 138
    iget-object v5, p0, Lcom/vkontakte/android/api/board/BoardComment;->linkTitles:Ljava/util/ArrayList;

    invoke-virtual {v0, v12}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 140
    :cond_0
    sget-object v5, Lcom/vkontakte/android/api/board/BoardComment;->ptn3:Ljava/util/regex/Pattern;

    iget-object v6, p0, Lcom/vkontakte/android/api/board/BoardComment;->displayableText:Ljava/lang/CharSequence;

    invoke-virtual {v5, v6}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    .line 141
    :goto_1
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->find()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 142
    iget-object v5, p0, Lcom/vkontakte/android/api/board/BoardComment;->linkUrls:Ljava/util/ArrayList;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "vkontakte://profile/-"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v0, v8}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 143
    iget-object v5, p0, Lcom/vkontakte/android/api/board/BoardComment;->linkTitles:Ljava/util/ArrayList;

    invoke-virtual {v0, v12}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 145
    :cond_1
    sget-object v5, Lcom/vkontakte/android/api/board/BoardComment;->ptn4:Ljava/util/regex/Pattern;

    iget-object v6, p0, Lcom/vkontakte/android/api/board/BoardComment;->displayableText:Ljava/lang/CharSequence;

    invoke-virtual {v5, v6}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    .line 146
    :goto_2
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->find()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 147
    iget-object v5, p0, Lcom/vkontakte/android/api/board/BoardComment;->linkUrls:Ljava/util/ArrayList;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "vkontakte://profile/"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v0, v8}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 148
    iget-object v5, p0, Lcom/vkontakte/android/api/board/BoardComment;->linkTitles:Ljava/util/ArrayList;

    invoke-virtual {v0, v11}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 150
    :cond_2
    sget-object v5, Lcom/vkontakte/android/api/board/BoardComment;->ptn5:Ljava/util/regex/Pattern;

    iget-object v6, p0, Lcom/vkontakte/android/api/board/BoardComment;->displayableText:Ljava/lang/CharSequence;

    invoke-virtual {v5, v6}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    .line 151
    :goto_3
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->find()Z

    move-result v5

    if-eqz v5, :cond_3

    .line 152
    iget-object v5, p0, Lcom/vkontakte/android/api/board/BoardComment;->linkUrls:Ljava/util/ArrayList;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "vkontakte://profile/-"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v0, v8}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 153
    iget-object v5, p0, Lcom/vkontakte/android/api/board/BoardComment;->linkTitles:Ljava/util/ArrayList;

    invoke-virtual {v0, v11}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_3

    .line 155
    :cond_3
    iget-object v5, p0, Lcom/vkontakte/android/api/board/BoardComment;->displayableText:Ljava/lang/CharSequence;

    instance-of v5, v5, Landroid/text/SpannableStringBuilder;

    if-eqz v5, :cond_5

    .line 156
    iget-object v5, p0, Lcom/vkontakte/android/api/board/BoardComment;->displayableText:Ljava/lang/CharSequence;

    check-cast v5, Landroid/text/SpannableStringBuilder;

    iget-object v6, p0, Lcom/vkontakte/android/api/board/BoardComment;->displayableText:Ljava/lang/CharSequence;

    invoke-interface {v6}, Ljava/lang/CharSequence;->length()I

    move-result v6

    add-int/lit8 v6, v6, -0x1

    const-class v7, Lcom/vkontakte/android/LinkSpan;

    invoke-virtual {v5, v9, v6, v7}, Landroid/text/SpannableStringBuilder;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Lcom/vkontakte/android/LinkSpan;

    .line 157
    .local v3, "spans":[Lcom/vkontakte/android/LinkSpan;
    array-length v5, v3

    if-lez v5, :cond_4

    .line 158
    sget-object v5, Lcom/vkontakte/android/api/board/BoardComment;->ptn1:Ljava/util/regex/Pattern;

    aget-object v6, v3, v9

    invoke-virtual {v6}, Lcom/vkontakte/android/LinkSpan;->getLink()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    .line 165
    .end local v3    # "spans":[Lcom/vkontakte/android/LinkSpan;
    :goto_4
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->find()Z

    move-result v5

    if-eqz v5, :cond_6

    .line 166
    iget-object v5, p0, Lcom/vkontakte/android/api/board/BoardComment;->linkUrls:Ljava/util/ArrayList;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "vklink://view/?"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->group()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 167
    iget-object v5, p0, Lcom/vkontakte/android/api/board/BoardComment;->linkTitles:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->group()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_4

    .line 160
    .restart local v3    # "spans":[Lcom/vkontakte/android/LinkSpan;
    :cond_4
    sget-object v5, Lcom/vkontakte/android/api/board/BoardComment;->ptn1:Ljava/util/regex/Pattern;

    iget-object v6, p0, Lcom/vkontakte/android/api/board/BoardComment;->displayableText:Ljava/lang/CharSequence;

    invoke-virtual {v5, v6}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    goto :goto_4

    .line 163
    .end local v3    # "spans":[Lcom/vkontakte/android/LinkSpan;
    :cond_5
    sget-object v5, Lcom/vkontakte/android/api/board/BoardComment;->ptn1:Ljava/util/regex/Pattern;

    iget-object v6, p0, Lcom/vkontakte/android/api/board/BoardComment;->displayableText:Ljava/lang/CharSequence;

    invoke-virtual {v5, v6}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    goto :goto_4

    .line 170
    :cond_6
    new-instance v1, Landroid/text/SpannableStringBuilder;

    iget-object v5, p0, Lcom/vkontakte/android/api/board/BoardComment;->displayableText:Ljava/lang/CharSequence;

    invoke-direct {v1, v5}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 172
    .local v1, "result":Landroid/text/SpannableStringBuilder;
    sget-object v5, Lcom/vkontakte/android/api/board/BoardComment;->PATTERN_REPLY:Ljava/util/regex/Pattern;

    iget-object v6, p0, Lcom/vkontakte/android/api/board/BoardComment;->displayableText:Ljava/lang/CharSequence;

    invoke-virtual {v5, v6}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    .line 173
    const/4 v4, 0x0

    .line 174
    .local v4, "textOffset":I
    :goto_5
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->find()Z

    move-result v5

    if-eqz v5, :cond_7

    .line 175
    new-instance v2, Lcom/vkontakte/android/LinkSpan;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "vkontakte://vk.com/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v0, v8}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    invoke-direct {v2, v5, v6}, Lcom/vkontakte/android/LinkSpan;-><init>(Ljava/lang/String;Lcom/vkontakte/android/data/PostInteract;)V

    .line 176
    .local v2, "span":Lcom/vkontakte/android/LinkSpan;
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->start()I

    move-result v5

    sub-int/2addr v5, v4

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->end()I

    move-result v6

    sub-int/2addr v6, v4

    invoke-virtual {v0, v10}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v1, v5, v6, v7}, Landroid/text/SpannableStringBuilder;->replace(IILjava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    move-result-object v1

    .line 177
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->start()I

    move-result v5

    sub-int/2addr v5, v4

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->start()I

    move-result v6

    sub-int/2addr v6, v4

    invoke-virtual {v0, v10}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v7

    add-int/2addr v6, v7

    invoke-virtual {v1, v2, v5, v6, v9}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 178
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->group()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    invoke-virtual {v0, v10}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    sub-int/2addr v5, v6

    add-int/2addr v4, v5

    .line 179
    goto :goto_5

    .line 181
    .end local v2    # "span":Lcom/vkontakte/android/LinkSpan;
    :cond_7
    invoke-static {v1}, Lcom/vkontakte/android/Global;->replaceEmoji(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v5

    iput-object v5, p0, Lcom/vkontakte/android/api/board/BoardComment;->displayableText:Ljava/lang/CharSequence;

    .line 182
    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 5
    .param p1, "parcel"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 309
    iget v2, p0, Lcom/vkontakte/android/api/board/BoardComment;->id:I

    invoke-virtual {p1, v2}, Landroid/os/Parcel;->writeInt(I)V

    .line 310
    iget-object v2, p0, Lcom/vkontakte/android/api/board/BoardComment;->text:Ljava/lang/String;

    invoke-virtual {p1, v2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 312
    iget-object v2, p0, Lcom/vkontakte/android/api/board/BoardComment;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    new-array v1, v2, [Landroid/os/Parcelable;

    .line 313
    .local v1, "parcelables":[Landroid/os/Parcelable;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v2, p0, Lcom/vkontakte/android/api/board/BoardComment;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v0, v2, :cond_0

    .line 314
    iget-object v2, p0, Lcom/vkontakte/android/api/board/BoardComment;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/os/Parcelable;

    aput-object v2, v1, v0

    .line 313
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 316
    :cond_0
    invoke-virtual {p1, v1, p2}, Landroid/os/Parcel;->writeParcelableArray([Landroid/os/Parcelable;I)V

    .line 318
    iget-object v2, p0, Lcom/vkontakte/android/api/board/BoardComment;->userName:Ljava/lang/String;

    invoke-virtual {p1, v2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 319
    iget-object v2, p0, Lcom/vkontakte/android/api/board/BoardComment;->userPhoto:Ljava/lang/String;

    invoke-virtual {p1, v2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 320
    iget v2, p0, Lcom/vkontakte/android/api/board/BoardComment;->uid:I

    invoke-virtual {p1, v2}, Landroid/os/Parcel;->writeInt(I)V

    .line 321
    iget v2, p0, Lcom/vkontakte/android/api/board/BoardComment;->time:I

    invoke-virtual {p1, v2}, Landroid/os/Parcel;->writeInt(I)V

    .line 322
    iget-object v2, p0, Lcom/vkontakte/android/api/board/BoardComment;->linkTitles:Ljava/util/ArrayList;

    invoke-virtual {p1, v2}, Landroid/os/Parcel;->writeStringList(Ljava/util/List;)V

    .line 323
    iget-object v2, p0, Lcom/vkontakte/android/api/board/BoardComment;->linkUrls:Ljava/util/ArrayList;

    invoke-virtual {p1, v2}, Landroid/os/Parcel;->writeStringList(Ljava/util/List;)V

    .line 324
    iget v2, p0, Lcom/vkontakte/android/api/board/BoardComment;->offset:I

    invoke-virtual {p1, v2}, Landroid/os/Parcel;->writeInt(I)V

    .line 325
    iget v2, p0, Lcom/vkontakte/android/api/board/BoardComment;->ownerId:I

    invoke-virtual {p1, v2}, Landroid/os/Parcel;->writeInt(I)V

    .line 326
    iget v2, p0, Lcom/vkontakte/android/api/board/BoardComment;->likesCount:I

    invoke-virtual {p1, v2}, Landroid/os/Parcel;->writeInt(I)V

    .line 327
    iget-boolean v2, p0, Lcom/vkontakte/android/api/board/BoardComment;->isLiked:Z

    if-eqz v2, :cond_1

    move v2, v3

    :goto_1
    invoke-virtual {p1, v2}, Landroid/os/Parcel;->writeByte(B)V

    .line 328
    iget-boolean v2, p0, Lcom/vkontakte/android/api/board/BoardComment;->canLike:Z

    if-eqz v2, :cond_2

    :goto_2
    invoke-virtual {p1, v3}, Landroid/os/Parcel;->writeByte(B)V

    .line 329
    iget-object v2, p0, Lcom/vkontakte/android/api/board/BoardComment;->respToName:Ljava/lang/String;

    invoke-virtual {p1, v2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 330
    iget v2, p0, Lcom/vkontakte/android/api/board/BoardComment;->replyToCommentID:I

    invoke-virtual {p1, v2}, Landroid/os/Parcel;->writeInt(I)V

    .line 331
    return-void

    :cond_1
    move v2, v4

    .line 327
    goto :goto_1

    :cond_2
    move v3, v4

    .line 328
    goto :goto_2
.end method
