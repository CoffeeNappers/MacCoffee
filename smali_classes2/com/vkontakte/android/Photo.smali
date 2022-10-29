.class public Lcom/vkontakte/android/Photo;
.super Lcom/vkontakte/android/utils/Serializer$SerializableAdapter;
.source "Photo.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/Photo$Image;
    }
.end annotation


# static fields
.field public static final CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/utils/Serializer$Creator",
            "<",
            "Lcom/vkontakte/android/Photo;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public accessKey:Ljava/lang/String;

.field public albumID:I

.field public canComment:Z

.field public canRepost:Z

.field public comments:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/NewsComment;",
            ">;"
        }
    .end annotation
.end field

.field public date:I

.field public descr:Ljava/lang/String;

.field public fullURL:Ljava/lang/String;

.field public geoAddress:Ljava/lang/String;

.field public hidden:Z

.field public id:I

.field public infoLoaded:Z

.field public isLiked:Z

.field public lat:D

.field public transient loadingAddress:Z

.field public lon:D

.field public nComments:I

.field public nLikes:I

.field public nReposts:I

.field public nTags:I

.field public ownerID:I

.field public postID:I

.field public realOffset:I

.field public sizes:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/Photo$Image;",
            ">;"
        }
    .end annotation
.end field

.field public tags:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/PhotoTag;",
            ">;"
        }
    .end annotation
.end field

.field public thumbURL:Ljava/lang/String;

.field public user:Lcom/vkontakte/android/UserProfile;

.field public userID:I

.field public viewBounds:Landroid/graphics/Rect;

.field public viewClipTop:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 208
    new-instance v0, Lcom/vkontakte/android/Photo$1;

    invoke-direct {v0}, Lcom/vkontakte/android/Photo$1;-><init>()V

    sput-object v0, Lcom/vkontakte/android/Photo;->CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;

    return-void
.end method

.method public constructor <init>()V
    .locals 4

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    const-wide v2, -0x3f3e6c0000000000L    # -9000.0

    .line 52
    invoke-direct {p0}, Lcom/vkontakte/android/utils/Serializer$SerializableAdapter;-><init>()V

    .line 29
    iput-boolean v1, p0, Lcom/vkontakte/android/Photo;->infoLoaded:Z

    .line 31
    iput-boolean v0, p0, Lcom/vkontakte/android/Photo;->canComment:Z

    .line 32
    iput-boolean v0, p0, Lcom/vkontakte/android/Photo;->canRepost:Z

    .line 38
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/Photo;->tags:Ljava/util/ArrayList;

    .line 39
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/Photo;->sizes:Ljava/util/ArrayList;

    .line 40
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/Photo;->comments:Ljava/util/ArrayList;

    .line 41
    iput-wide v2, p0, Lcom/vkontakte/android/Photo;->lat:D

    iput-wide v2, p0, Lcom/vkontakte/android/Photo;->lon:D

    .line 45
    iput-boolean v1, p0, Lcom/vkontakte/android/Photo;->loadingAddress:Z

    .line 50
    const/4 v0, -0x1

    iput v0, p0, Lcom/vkontakte/android/Photo;->realOffset:I

    .line 53
    return-void
.end method

.method public constructor <init>(Lcom/vkontakte/android/attachments/PhotoAttachment;)V
    .locals 9
    .param p1, "att"    # Lcom/vkontakte/android/attachments/PhotoAttachment;

    .prologue
    const/4 v5, 0x1

    const/4 v8, 0x0

    const-wide v6, -0x3f3e6c0000000000L    # -9000.0

    .line 90
    invoke-direct {p0}, Lcom/vkontakte/android/utils/Serializer$SerializableAdapter;-><init>()V

    .line 29
    iput-boolean v8, p0, Lcom/vkontakte/android/Photo;->infoLoaded:Z

    .line 31
    iput-boolean v5, p0, Lcom/vkontakte/android/Photo;->canComment:Z

    .line 32
    iput-boolean v5, p0, Lcom/vkontakte/android/Photo;->canRepost:Z

    .line 38
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    iput-object v5, p0, Lcom/vkontakte/android/Photo;->tags:Ljava/util/ArrayList;

    .line 39
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    iput-object v5, p0, Lcom/vkontakte/android/Photo;->sizes:Ljava/util/ArrayList;

    .line 40
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    iput-object v5, p0, Lcom/vkontakte/android/Photo;->comments:Ljava/util/ArrayList;

    .line 41
    iput-wide v6, p0, Lcom/vkontakte/android/Photo;->lat:D

    iput-wide v6, p0, Lcom/vkontakte/android/Photo;->lon:D

    .line 45
    iput-boolean v8, p0, Lcom/vkontakte/android/Photo;->loadingAddress:Z

    .line 50
    const/4 v5, -0x1

    iput v5, p0, Lcom/vkontakte/android/Photo;->realOffset:I

    .line 91
    iget-object v5, p1, Lcom/vkontakte/android/attachments/PhotoAttachment;->srcBig:Ljava/lang/String;

    iput-object v5, p0, Lcom/vkontakte/android/Photo;->fullURL:Ljava/lang/String;

    .line 92
    invoke-virtual {p1}, Lcom/vkontakte/android/attachments/PhotoAttachment;->getThumbURL()Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lcom/vkontakte/android/Photo;->thumbURL:Ljava/lang/String;

    .line 93
    iget v5, p1, Lcom/vkontakte/android/attachments/PhotoAttachment;->aid:I

    iput v5, p0, Lcom/vkontakte/android/Photo;->albumID:I

    .line 94
    iget v5, p1, Lcom/vkontakte/android/attachments/PhotoAttachment;->pid:I

    iput v5, p0, Lcom/vkontakte/android/Photo;->id:I

    .line 95
    iget v5, p1, Lcom/vkontakte/android/attachments/PhotoAttachment;->oid:I

    iput v5, p0, Lcom/vkontakte/android/Photo;->ownerID:I

    .line 96
    iget v5, p1, Lcom/vkontakte/android/attachments/PhotoAttachment;->uid:I

    iput v5, p0, Lcom/vkontakte/android/Photo;->userID:I

    .line 97
    iget v5, p1, Lcom/vkontakte/android/attachments/PhotoAttachment;->date:I

    iput v5, p0, Lcom/vkontakte/android/Photo;->date:I

    .line 98
    iget-object v5, p1, Lcom/vkontakte/android/attachments/PhotoAttachment;->descr:Ljava/lang/String;

    iput-object v5, p0, Lcom/vkontakte/android/Photo;->descr:Ljava/lang/String;

    .line 99
    iget-object v5, p1, Lcom/vkontakte/android/attachments/PhotoAttachment;->accessKey:Ljava/lang/String;

    iput-object v5, p0, Lcom/vkontakte/android/Photo;->accessKey:Ljava/lang/String;

    .line 100
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    iput-object v5, p0, Lcom/vkontakte/android/Photo;->sizes:Ljava/util/ArrayList;

    .line 101
    iget-object v4, p1, Lcom/vkontakte/android/attachments/PhotoAttachment;->images:Ljava/util/HashMap;

    .line 102
    .local v4, "sizes":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lcom/vkontakte/android/attachments/PhotoAttachment$Image;>;"
    invoke-virtual {v4}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v2

    .line 103
    .local v2, "keys":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 104
    .local v1, "k":Ljava/lang/String;
    invoke-virtual {v4, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;

    .line 105
    .local v0, "im":Lcom/vkontakte/android/attachments/PhotoAttachment$Image;
    new-instance v3, Lcom/vkontakte/android/Photo$Image;

    invoke-direct {v3}, Lcom/vkontakte/android/Photo$Image;-><init>()V

    .line 106
    .local v3, "p":Lcom/vkontakte/android/Photo$Image;
    iget v6, v0, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;->height:I

    iput v6, v3, Lcom/vkontakte/android/Photo$Image;->height:I

    .line 107
    iget v6, v0, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;->width:I

    iput v6, v3, Lcom/vkontakte/android/Photo$Image;->width:I

    .line 108
    iget-char v6, v0, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;->type:C

    iput-char v6, v3, Lcom/vkontakte/android/Photo$Image;->type:C

    .line 109
    iget-object v6, v0, Lcom/vkontakte/android/attachments/PhotoAttachment$Image;->url:Ljava/lang/String;

    iput-object v6, v3, Lcom/vkontakte/android/Photo$Image;->url:Ljava/lang/String;

    .line 110
    iget-object v6, p0, Lcom/vkontakte/android/Photo;->sizes:Ljava/util/ArrayList;

    invoke-virtual {v6, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 112
    .end local v0    # "im":Lcom/vkontakte/android/attachments/PhotoAttachment$Image;
    .end local v1    # "k":Ljava/lang/String;
    .end local v3    # "p":Lcom/vkontakte/android/Photo$Image;
    :cond_0
    iget v5, p1, Lcom/vkontakte/android/attachments/PhotoAttachment;->postID:I

    iput v5, p0, Lcom/vkontakte/android/Photo;->postID:I

    .line 113
    iget-wide v6, p1, Lcom/vkontakte/android/attachments/PhotoAttachment;->lat:D

    iput-wide v6, p0, Lcom/vkontakte/android/Photo;->lat:D

    .line 114
    iget-wide v6, p1, Lcom/vkontakte/android/attachments/PhotoAttachment;->lon:D

    iput-wide v6, p0, Lcom/vkontakte/android/Photo;->lon:D

    .line 115
    return-void
.end method

.method public constructor <init>(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 7
    .param p1, "p"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    const-wide v4, -0x3f3e6c0000000000L    # -9000.0

    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 55
    invoke-direct {p0}, Lcom/vkontakte/android/utils/Serializer$SerializableAdapter;-><init>()V

    .line 29
    iput-boolean v2, p0, Lcom/vkontakte/android/Photo;->infoLoaded:Z

    .line 31
    iput-boolean v1, p0, Lcom/vkontakte/android/Photo;->canComment:Z

    .line 32
    iput-boolean v1, p0, Lcom/vkontakte/android/Photo;->canRepost:Z

    .line 38
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/Photo;->tags:Ljava/util/ArrayList;

    .line 39
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/Photo;->sizes:Ljava/util/ArrayList;

    .line 40
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/Photo;->comments:Ljava/util/ArrayList;

    .line 41
    iput-wide v4, p0, Lcom/vkontakte/android/Photo;->lat:D

    iput-wide v4, p0, Lcom/vkontakte/android/Photo;->lon:D

    .line 45
    iput-boolean v2, p0, Lcom/vkontakte/android/Photo;->loadingAddress:Z

    .line 50
    const/4 v0, -0x1

    iput v0, p0, Lcom/vkontakte/android/Photo;->realOffset:I

    .line 56
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/Photo;->id:I

    .line 57
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/Photo;->albumID:I

    .line 58
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/Photo;->ownerID:I

    .line 59
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/Photo;->userID:I

    .line 60
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/Photo;->date:I

    .line 61
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/Photo;->nLikes:I

    .line 62
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/Photo;->nReposts:I

    .line 63
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/Photo;->nComments:I

    .line 64
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/Photo;->nTags:I

    .line 65
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v0

    if-ne v0, v1, :cond_0

    move v0, v1

    :goto_0
    iput-boolean v0, p0, Lcom/vkontakte/android/Photo;->infoLoaded:Z

    .line 66
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v0

    if-ne v0, v1, :cond_1

    move v0, v1

    :goto_1
    iput-boolean v0, p0, Lcom/vkontakte/android/Photo;->isLiked:Z

    .line 67
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v0

    if-ne v0, v1, :cond_2

    move v0, v1

    :goto_2
    iput-boolean v0, p0, Lcom/vkontakte/android/Photo;->canComment:Z

    .line 68
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readByte()B

    move-result v0

    if-ne v0, v1, :cond_3

    move v0, v1

    :goto_3
    iput-boolean v0, p0, Lcom/vkontakte/android/Photo;->canRepost:Z

    .line 69
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/Photo;->thumbURL:Ljava/lang/String;

    .line 70
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/Photo;->fullURL:Ljava/lang/String;

    .line 71
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/Photo;->geoAddress:Ljava/lang/String;

    .line 72
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/Photo;->descr:Ljava/lang/String;

    .line 73
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readDouble()D

    move-result-wide v4

    iput-wide v4, p0, Lcom/vkontakte/android/Photo;->lat:D

    .line 74
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readDouble()D

    move-result-wide v4

    iput-wide v4, p0, Lcom/vkontakte/android/Photo;->lon:D

    .line 75
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/Photo;->accessKey:Ljava/lang/String;

    .line 77
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readByte()B

    move-result v0

    if-eqz v0, :cond_4

    .line 78
    new-instance v0, Landroid/graphics/Rect;

    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v3

    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v4

    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v5

    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v6

    invoke-direct {v0, v3, v4, v5, v6}, Landroid/graphics/Rect;-><init>(IIII)V

    iput-object v0, p0, Lcom/vkontakte/android/Photo;->viewBounds:Landroid/graphics/Rect;

    .line 83
    :goto_4
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/Photo;->viewClipTop:I

    .line 84
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/Photo;->postID:I

    .line 85
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readByte()B

    move-result v0

    if-ne v0, v1, :cond_5

    :goto_5
    iput-boolean v1, p0, Lcom/vkontakte/android/Photo;->hidden:Z

    .line 86
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/Photo;->deserializeImages(Ljava/lang/String;)V

    .line 87
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/Photo;->realOffset:I

    .line 88
    return-void

    :cond_0
    move v0, v2

    .line 65
    goto/16 :goto_0

    :cond_1
    move v0, v2

    .line 66
    goto/16 :goto_1

    :cond_2
    move v0, v2

    .line 67
    goto :goto_2

    :cond_3
    move v0, v2

    .line 68
    goto :goto_3

    .line 80
    :cond_4
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/Photo;->viewBounds:Landroid/graphics/Rect;

    goto :goto_4

    :cond_5
    move v1, v2

    .line 85
    goto :goto_5
.end method

.method public constructor <init>(Lorg/json/JSONObject;)V
    .locals 11
    .param p1, "obj"    # Lorg/json/JSONObject;

    .prologue
    const/4 v10, -0x1

    const-wide v8, -0x3f3e6c0000000000L    # -9000.0

    const/4 v6, 0x0

    const/4 v5, 0x1

    .line 117
    invoke-direct {p0}, Lcom/vkontakte/android/utils/Serializer$SerializableAdapter;-><init>()V

    .line 29
    iput-boolean v6, p0, Lcom/vkontakte/android/Photo;->infoLoaded:Z

    .line 31
    iput-boolean v5, p0, Lcom/vkontakte/android/Photo;->canComment:Z

    .line 32
    iput-boolean v5, p0, Lcom/vkontakte/android/Photo;->canRepost:Z

    .line 38
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    iput-object v7, p0, Lcom/vkontakte/android/Photo;->tags:Ljava/util/ArrayList;

    .line 39
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    iput-object v7, p0, Lcom/vkontakte/android/Photo;->sizes:Ljava/util/ArrayList;

    .line 40
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    iput-object v7, p0, Lcom/vkontakte/android/Photo;->comments:Ljava/util/ArrayList;

    .line 41
    iput-wide v8, p0, Lcom/vkontakte/android/Photo;->lat:D

    iput-wide v8, p0, Lcom/vkontakte/android/Photo;->lon:D

    .line 45
    iput-boolean v6, p0, Lcom/vkontakte/android/Photo;->loadingAddress:Z

    .line 50
    iput v10, p0, Lcom/vkontakte/android/Photo;->realOffset:I

    .line 119
    :try_start_0
    const-string/jumbo v7, "id"

    const-string/jumbo v8, "pid"

    invoke-virtual {p1, v8}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v8

    invoke-virtual {p1, v7, v8}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v7

    iput v7, p0, Lcom/vkontakte/android/Photo;->id:I

    .line 120
    const-string/jumbo v7, "owner_id"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v7

    iput v7, p0, Lcom/vkontakte/android/Photo;->ownerID:I

    .line 121
    const-string/jumbo v7, "album_id"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v7

    iput v7, p0, Lcom/vkontakte/android/Photo;->albumID:I

    .line 122
    const-string/jumbo v7, "user_id"

    iget v8, p0, Lcom/vkontakte/android/Photo;->ownerID:I

    invoke-virtual {p1, v7, v8}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v7

    iput v7, p0, Lcom/vkontakte/android/Photo;->userID:I

    .line 123
    iget v7, p0, Lcom/vkontakte/android/Photo;->userID:I

    const/16 v8, 0x64

    if-ne v7, v8, :cond_0

    .line 124
    iget v7, p0, Lcom/vkontakte/android/Photo;->ownerID:I

    iput v7, p0, Lcom/vkontakte/android/Photo;->userID:I

    .line 126
    :cond_0
    const-string/jumbo v7, "text"

    const-string/jumbo v8, ""

    invoke-virtual {p1, v7, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/vkontakte/android/Photo;->descr:Ljava/lang/String;

    .line 127
    const-string/jumbo v7, "access_key"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/vkontakte/android/Photo;->accessKey:Ljava/lang/String;

    .line 128
    const-string/jumbo v7, "date"

    const-string/jumbo v8, "created"

    invoke-virtual {p1, v8}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v8

    invoke-virtual {p1, v7, v8}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v7

    iput v7, p0, Lcom/vkontakte/android/Photo;->date:I

    .line 129
    const-string/jumbo v7, "comments"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_1

    const-string/jumbo v7, "tags"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 130
    const/4 v7, 0x1

    iput-boolean v7, p0, Lcom/vkontakte/android/Photo;->infoLoaded:Z

    .line 131
    const-string/jumbo v7, "comments"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v7

    const-string/jumbo v8, "count"

    invoke-virtual {v7, v8}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v7

    iput v7, p0, Lcom/vkontakte/android/Photo;->nComments:I

    .line 132
    const-string/jumbo v7, "tags"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v7

    const-string/jumbo v8, "count"

    invoke-virtual {v7, v8}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v7

    iput v7, p0, Lcom/vkontakte/android/Photo;->nTags:I

    .line 134
    :cond_1
    const-string/jumbo v7, "likes"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 135
    const-string/jumbo v7, "likes"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v7

    const-string/jumbo v8, "count"

    invoke-virtual {v7, v8}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v7

    iput v7, p0, Lcom/vkontakte/android/Photo;->nLikes:I

    .line 136
    const-string/jumbo v7, "likes"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v7

    const-string/jumbo v8, "user_likes"

    invoke-virtual {v7, v8}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v7

    if-ne v7, v5, :cond_4

    move v7, v5

    :goto_0
    iput-boolean v7, p0, Lcom/vkontakte/android/Photo;->isLiked:Z

    .line 138
    :cond_2
    const-string/jumbo v7, "reposts"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 139
    const-string/jumbo v7, "reposts"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v7

    const-string/jumbo v8, "count"

    invoke-virtual {v7, v8}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v7

    iput v7, p0, Lcom/vkontakte/android/Photo;->nReposts:I

    .line 141
    :cond_3
    const-string/jumbo v7, "can_comment"

    const/4 v8, 0x1

    invoke-virtual {p1, v7, v8}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v7

    if-ne v7, v5, :cond_5

    move v7, v5

    :goto_1
    iput-boolean v7, p0, Lcom/vkontakte/android/Photo;->canComment:Z

    .line 142
    const-string/jumbo v7, "can_repost"

    const/4 v8, 0x1

    invoke-virtual {p1, v7, v8}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v7

    if-ne v7, v5, :cond_6

    move v7, v5

    :goto_2
    iput-boolean v7, p0, Lcom/vkontakte/android/Photo;->canRepost:Z

    .line 143
    const-string/jumbo v7, "sizes"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_7

    .line 144
    const-string/jumbo v7, "sizes"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v3

    .line 145
    .local v3, "sizes":Lorg/json/JSONArray;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_3
    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v7

    if-ge v0, v7, :cond_7

    .line 146
    invoke-virtual {v3, v0}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    .line 147
    .local v2, "size":Lorg/json/JSONObject;
    new-instance v1, Lcom/vkontakte/android/Photo$Image;

    invoke-direct {v1}, Lcom/vkontakte/android/Photo$Image;-><init>()V

    .line 148
    .local v1, "img":Lcom/vkontakte/android/Photo$Image;
    const-string/jumbo v7, "height"

    invoke-virtual {v2, v7}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v7

    iput v7, v1, Lcom/vkontakte/android/Photo$Image;->height:I

    .line 149
    const-string/jumbo v7, "width"

    invoke-virtual {v2, v7}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v7

    iput v7, v1, Lcom/vkontakte/android/Photo$Image;->width:I

    .line 150
    const-string/jumbo v7, "type"

    invoke-virtual {v2, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const/4 v8, 0x0

    invoke-virtual {v7, v8}, Ljava/lang/String;->charAt(I)C

    move-result v7

    iput-char v7, v1, Lcom/vkontakte/android/Photo$Image;->type:C

    .line 127
    const-string v7, "src"

    invoke-virtual {v2, v7}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_128

    const-string v7, "src"

    :goto_123
    invoke-virtual {v2, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    goto :goto_12b

    :cond_128
    const-string v7, "url"

    goto :goto_123

    :goto_12b
    iput-object v7, v1, Lcom/vkontakte/android/Photo$Image;->url:Ljava/lang/String;

    .line 128
    iget-object v7, p0, Lcom/vkontakte/android/Photo;->sizes:Ljava/util/ArrayList;

    invoke-virtual {v7, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    
    .line 145
    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    .end local v0    # "i":I
    .end local v1    # "img":Lcom/vkontakte/android/Photo$Image;
    .end local v2    # "size":Lorg/json/JSONObject;
    .end local v3    # "sizes":Lorg/json/JSONArray;
    :cond_4
    move v7, v6

    .line 136
    goto/16 :goto_0

    :cond_5
    move v7, v6

    .line 141
    goto :goto_1

    :cond_6
    move v7, v6

    .line 142
    goto :goto_2

    .line 155
    :cond_7
    const-string/jumbo v7, "lat"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_8

    const-string/jumbo v7, "long"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_8

    .line 156
    const-string/jumbo v7, "lat"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v8

    iput-wide v8, p0, Lcom/vkontakte/android/Photo;->lat:D

    .line 157
    const-string/jumbo v7, "long"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v8

    iput-wide v8, p0, Lcom/vkontakte/android/Photo;->lon:D

    .line 159
    :cond_8
    const-string/jumbo v7, "access_key"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/vkontakte/android/Photo;->accessKey:Ljava/lang/String;

    .line 160
    const-string/jumbo v7, "post_id"

    invoke-virtual {p1, v7}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v7

    iput v7, p0, Lcom/vkontakte/android/Photo;->postID:I

    .line 161
    const-string/jumbo v7, "hidden"

    const/4 v8, 0x0

    invoke-virtual {p1, v7, v8}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v7

    if-ne v7, v5, :cond_9

    :goto_4
    iput-boolean v5, p0, Lcom/vkontakte/android/Photo;->hidden:Z

    .line 162
    const-string/jumbo v5, "real_offset"

    const/4 v6, -0x1

    invoke-virtual {p1, v5, v6}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v5

    iput v5, p0, Lcom/vkontakte/android/Photo;->realOffset:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 166
    :goto_5
    return-void

    :cond_9
    move v5, v6

    .line 161
    goto :goto_4

    .line 163
    :catch_0
    move-exception v4

    .line 164
    .local v4, "x":Ljava/lang/Exception;
    const-string/jumbo v5, "vk"

    const-string/jumbo v6, "Error parsing photo!"

    invoke-static {v5, v6, v4}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_5
.end method


# virtual methods
.method public deserializeImages(Ljava/lang/String;)V
    .locals 12
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    const/4 v8, 0x0

    .line 300
    :try_start_0
    const-string/jumbo v7, "\\$"

    invoke-virtual {p1, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    .line 301
    .local v5, "ss":[Ljava/lang/String;
    const/4 v3, 0x0

    .local v3, "srcX":Ljava/lang/String;
    const/4 v4, 0x0

    .line 302
    .local v4, "srcY":Ljava/lang/String;
    array-length v9, v5

    move v7, v8

    :goto_0
    if-ge v7, v9, :cond_3

    aget-object v1, v5, v7

    .line 303
    .local v1, "p":Ljava/lang/String;
    const-string/jumbo v10, "\\^"

    invoke-virtual {v1, v10}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 304
    .local v2, "pp":[Ljava/lang/String;
    new-instance v0, Lcom/vkontakte/android/Photo$Image;

    invoke-direct {v0}, Lcom/vkontakte/android/Photo$Image;-><init>()V

    .line 305
    .local v0, "im":Lcom/vkontakte/android/Photo$Image;
    const/4 v10, 0x0

    aget-object v10, v2, v10

    const/4 v11, 0x0

    invoke-virtual {v10, v11}, Ljava/lang/String;->charAt(I)C

    move-result v10

    iput-char v10, v0, Lcom/vkontakte/android/Photo$Image;->type:C

    .line 306
    const/4 v10, 0x1

    aget-object v10, v2, v10

    iput-object v10, v0, Lcom/vkontakte/android/Photo$Image;->url:Ljava/lang/String;

    .line 307
    const/4 v10, 0x2

    aget-object v10, v2, v10

    invoke-static {v10}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v10

    iput v10, v0, Lcom/vkontakte/android/Photo$Image;->width:I

    .line 308
    const/4 v10, 0x3

    aget-object v10, v2, v10

    invoke-static {v10}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v10

    iput v10, v0, Lcom/vkontakte/android/Photo$Image;->height:I

    .line 309
    iget-object v10, p0, Lcom/vkontakte/android/Photo;->sizes:Ljava/util/ArrayList;

    invoke-virtual {v10, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 310
    iget-char v10, v0, Lcom/vkontakte/android/Photo$Image;->type:C

    const/16 v11, 0x6d

    if-ne v10, v11, :cond_0

    .line 311
    iget-object v10, v0, Lcom/vkontakte/android/Photo$Image;->url:Ljava/lang/String;

    iput-object v10, p0, Lcom/vkontakte/android/Photo;->thumbURL:Ljava/lang/String;

    .line 313
    :cond_0
    iget-char v10, v0, Lcom/vkontakte/android/Photo$Image;->type:C

    const/16 v11, 0x78

    if-ne v10, v11, :cond_1

    .line 314
    iget-object v3, v0, Lcom/vkontakte/android/Photo$Image;->url:Ljava/lang/String;

    .line 316
    :cond_1
    iget-char v10, v0, Lcom/vkontakte/android/Photo$Image;->type:C

    const/16 v11, 0x79

    if-ne v10, v11, :cond_2

    .line 317
    iget-object v4, v0, Lcom/vkontakte/android/Photo$Image;->url:Ljava/lang/String;

    .line 302
    :cond_2
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 320
    .end local v0    # "im":Lcom/vkontakte/android/Photo$Image;
    .end local v1    # "p":Ljava/lang/String;
    .end local v2    # "pp":[Ljava/lang/String;
    :cond_3
    sget v7, Lcom/vkontakte/android/Global;->displayDensity:F

    const/high16 v9, 0x3f800000    # 1.0f

    cmpl-float v7, v7, v9

    if-gtz v7, :cond_4

    invoke-static {}, Lcom/vk/core/util/Screen;->isTablet()Z

    move-result v7

    if-eqz v7, :cond_6

    .line 321
    :cond_4
    if-eqz v4, :cond_5

    .end local v4    # "srcY":Ljava/lang/String;
    :goto_1
    iput-object v4, p0, Lcom/vkontakte/android/Photo;->fullURL:Ljava/lang/String;

    .line 328
    .end local v3    # "srcX":Ljava/lang/String;
    .end local v5    # "ss":[Ljava/lang/String;
    :goto_2
    return-void

    .restart local v3    # "srcX":Ljava/lang/String;
    .restart local v4    # "srcY":Ljava/lang/String;
    .restart local v5    # "ss":[Ljava/lang/String;
    :cond_5
    move-object v4, v3

    .line 321
    goto :goto_1

    .line 323
    :cond_6
    iput-object v3, p0, Lcom/vkontakte/android/Photo;->fullURL:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    .line 325
    .end local v3    # "srcX":Ljava/lang/String;
    .end local v4    # "srcY":Ljava/lang/String;
    .end local v5    # "ss":[Ljava/lang/String;
    :catch_0
    move-exception v6

    .line 326
    .local v6, "x":Ljava/lang/Exception;
    new-array v7, v8, [Ljava/lang/Object;

    invoke-static {v6, v7}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto :goto_2
.end method

.method public getImage(C)Lcom/vkontakte/android/Photo$Image;
    .locals 3
    .param p1, "s"    # C

    .prologue
    .line 256
    iget-object v1, p0, Lcom/vkontakte/android/Photo;->sizes:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/Photo$Image;

    .line 257
    .local v0, "im":Lcom/vkontakte/android/Photo$Image;
    iget-char v2, v0, Lcom/vkontakte/android/Photo$Image;->type:C

    if-ne v2, p1, :cond_0

    .line 269
    .end local v0    # "im":Lcom/vkontakte/android/Photo$Image;
    :goto_0
    return-object v0

    .line 261
    :cond_1
    const/16 v1, 0x73

    if-eq p1, v1, :cond_2

    const/16 v1, 0x6d

    if-eq p1, v1, :cond_2

    const/16 v1, 0x78

    if-ne p1, v1, :cond_3

    .line 262
    :cond_2
    new-instance v0, Lcom/vkontakte/android/Photo$Image;

    invoke-direct {v0}, Lcom/vkontakte/android/Photo$Image;-><init>()V

    .line 263
    .restart local v0    # "im":Lcom/vkontakte/android/Photo$Image;
    iput-char p1, v0, Lcom/vkontakte/android/Photo$Image;->type:C

    .line 264
    const/4 v1, 0x1

    iput v1, v0, Lcom/vkontakte/android/Photo$Image;->height:I

    iput v1, v0, Lcom/vkontakte/android/Photo$Image;->width:I

    .line 265
    const-string/jumbo v1, ""

    iput-object v1, v0, Lcom/vkontakte/android/Photo$Image;->url:Ljava/lang/String;

    goto :goto_0

    .line 269
    .end local v0    # "im":Lcom/vkontakte/android/Photo$Image;
    :cond_3
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getImage(CC)Lcom/vkontakte/android/Photo$Image;
    .locals 1
    .param p1, "s"    # C
    .param p2, "fallback"    # C

    .prologue
    .line 283
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/Photo;->getImage(C)Lcom/vkontakte/android/Photo$Image;

    move-result-object v0

    .line 284
    .local v0, "im":Lcom/vkontakte/android/Photo$Image;
    if-eqz v0, :cond_0

    .line 287
    .end local v0    # "im":Lcom/vkontakte/android/Photo$Image;
    :goto_0
    return-object v0

    .restart local v0    # "im":Lcom/vkontakte/android/Photo$Image;
    :cond_0
    invoke-virtual {p0, p2}, Lcom/vkontakte/android/Photo;->getImage(C)Lcom/vkontakte/android/Photo$Image;

    move-result-object v0

    goto :goto_0
.end method

.method public getImage([C)Lcom/vkontakte/android/Photo$Image;
    .locals 4
    .param p1, "sizes"    # [C

    .prologue
    .line 273
    array-length v3, p1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v3, :cond_1

    aget-char v0, p1, v2

    .line 274
    .local v0, "c":C
    invoke-virtual {p0, v0}, Lcom/vkontakte/android/Photo;->getImage(C)Lcom/vkontakte/android/Photo$Image;

    move-result-object v1

    .line 275
    .local v1, "im":Lcom/vkontakte/android/Photo$Image;
    if-eqz v1, :cond_0

    .line 279
    .end local v0    # "c":C
    .end local v1    # "im":Lcom/vkontakte/android/Photo$Image;
    :goto_1
    return-object v1

    .line 273
    .restart local v0    # "c":C
    .restart local v1    # "im":Lcom/vkontakte/android/Photo$Image;
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 279
    .end local v0    # "c":C
    .end local v1    # "im":Lcom/vkontakte/android/Photo$Image;
    :cond_1
    const/4 v1, 0x0

    goto :goto_1
.end method

.method public getImageByHeight(I)Lcom/vkontakte/android/Photo$Image;
    .locals 6
    .param p1, "height"    # I

    .prologue
    .line 243
    const v1, 0x7fffffff

    .line 244
    .local v1, "dif":I
    const/4 v0, 0x0

    .line 245
    .local v0, "bestImage":Lcom/vkontakte/android/Photo$Image;
    iget-object v4, p0, Lcom/vkontakte/android/Photo;->sizes:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_0
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/Photo$Image;

    .line 246
    .local v2, "image":Lcom/vkontakte/android/Photo$Image;
    iget v5, v2, Lcom/vkontakte/android/Photo$Image;->height:I

    sub-int/2addr v5, p1

    invoke-static {v5}, Ljava/lang/Math;->abs(I)I

    move-result v3

    .line 247
    .local v3, "newDif":I
    if-ge v3, v1, :cond_0

    iget v5, v2, Lcom/vkontakte/android/Photo$Image;->height:I

    if-lt v5, p1, :cond_0

    .line 248
    move-object v0, v2

    .line 249
    move v1, v3

    goto :goto_0

    .line 252
    .end local v2    # "image":Lcom/vkontakte/android/Photo$Image;
    .end local v3    # "newDif":I
    :cond_1
    if-nez v0, :cond_2

    const/16 v4, 0x6d

    invoke-virtual {p0, v4}, Lcom/vkontakte/android/Photo;->getImage(C)Lcom/vkontakte/android/Photo$Image;

    move-result-object v0

    .end local v0    # "bestImage":Lcom/vkontakte/android/Photo$Image;
    :cond_2
    return-object v0
.end method

.method public getImageByWidth(I)Lcom/vkontakte/android/Photo$Image;
    .locals 6
    .param p1, "width"    # I

    .prologue
    .line 230
    const v1, 0x7fffffff

    .line 231
    .local v1, "dif":I
    const/4 v0, 0x0

    .line 232
    .local v0, "bestImage":Lcom/vkontakte/android/Photo$Image;
    iget-object v4, p0, Lcom/vkontakte/android/Photo;->sizes:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_0
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/Photo$Image;

    .line 233
    .local v2, "image":Lcom/vkontakte/android/Photo$Image;
    iget v5, v2, Lcom/vkontakte/android/Photo$Image;->width:I

    sub-int/2addr v5, p1

    invoke-static {v5}, Ljava/lang/Math;->abs(I)I

    move-result v3

    .line 234
    .local v3, "newDif":I
    if-ge v3, v1, :cond_0

    iget-object v5, v2, Lcom/vkontakte/android/Photo$Image;->url:Ljava/lang/String;

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 235
    move-object v0, v2

    .line 236
    move v1, v3

    goto :goto_0

    .line 239
    .end local v2    # "image":Lcom/vkontakte/android/Photo$Image;
    .end local v3    # "newDif":I
    :cond_1
    if-nez v0, :cond_2

    const/16 v4, 0x6d

    invoke-virtual {p0, v4}, Lcom/vkontakte/android/Photo;->getImage(C)Lcom/vkontakte/android/Photo$Image;

    move-result-object v0

    .end local v0    # "bestImage":Lcom/vkontakte/android/Photo$Image;
    :cond_2
    return-object v0
.end method

.method public serializeImages()Ljava/lang/String;
    .locals 5

    .prologue
    .line 291
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 292
    .local v1, "ss":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    iget-object v2, p0, Lcom/vkontakte/android/Photo;->sizes:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/Photo$Image;

    .line 293
    .local v0, "im":Lcom/vkontakte/android/Photo$Image;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-char v4, v0, Lcom/vkontakte/android/Photo$Image;->type:C

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "^"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, v0, Lcom/vkontakte/android/Photo$Image;->url:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "^"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, v0, Lcom/vkontakte/android/Photo$Image;->width:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "^"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, v0, Lcom/vkontakte/android/Photo$Image;->height:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 295
    .end local v0    # "im":Lcom/vkontakte/android/Photo$Image;
    :cond_0
    const-string/jumbo v2, "$"

    invoke-static {v2, v1}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public serializeTo(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 6
    .param p1, "p"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 170
    iget v0, p0, Lcom/vkontakte/android/Photo;->id:I

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 171
    iget v0, p0, Lcom/vkontakte/android/Photo;->albumID:I

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 172
    iget v0, p0, Lcom/vkontakte/android/Photo;->ownerID:I

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 173
    iget v0, p0, Lcom/vkontakte/android/Photo;->userID:I

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 174
    iget v0, p0, Lcom/vkontakte/android/Photo;->date:I

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 175
    iget v0, p0, Lcom/vkontakte/android/Photo;->nLikes:I

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 176
    iget v0, p0, Lcom/vkontakte/android/Photo;->nReposts:I

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 177
    iget v0, p0, Lcom/vkontakte/android/Photo;->nComments:I

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 178
    iget v0, p0, Lcom/vkontakte/android/Photo;->nTags:I

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 179
    iget-boolean v0, p0, Lcom/vkontakte/android/Photo;->infoLoaded:Z

    if-eqz v0, :cond_0

    move v0, v1

    :goto_0
    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 180
    iget-boolean v0, p0, Lcom/vkontakte/android/Photo;->isLiked:Z

    if-eqz v0, :cond_1

    move v0, v1

    :goto_1
    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 181
    iget-boolean v0, p0, Lcom/vkontakte/android/Photo;->canComment:Z

    if-eqz v0, :cond_2

    move v0, v1

    :goto_2
    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 182
    iget-boolean v0, p0, Lcom/vkontakte/android/Photo;->canRepost:Z

    if-eqz v0, :cond_3

    move v0, v1

    :goto_3
    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeByte(B)V

    .line 183
    iget-object v0, p0, Lcom/vkontakte/android/Photo;->thumbURL:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 184
    iget-object v0, p0, Lcom/vkontakte/android/Photo;->fullURL:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 185
    iget-object v0, p0, Lcom/vkontakte/android/Photo;->geoAddress:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 186
    iget-object v0, p0, Lcom/vkontakte/android/Photo;->descr:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 187
    iget-wide v4, p0, Lcom/vkontakte/android/Photo;->lat:D

    invoke-virtual {p1, v4, v5}, Lcom/vkontakte/android/utils/Serializer;->writeDouble(D)V

    .line 188
    iget-wide v4, p0, Lcom/vkontakte/android/Photo;->lon:D

    invoke-virtual {p1, v4, v5}, Lcom/vkontakte/android/utils/Serializer;->writeDouble(D)V

    .line 189
    iget-object v0, p0, Lcom/vkontakte/android/Photo;->accessKey:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 191
    iget-object v0, p0, Lcom/vkontakte/android/Photo;->viewBounds:Landroid/graphics/Rect;

    if-nez v0, :cond_4

    .line 192
    invoke-virtual {p1, v2}, Lcom/vkontakte/android/utils/Serializer;->writeByte(B)V

    .line 201
    :goto_4
    iget v0, p0, Lcom/vkontakte/android/Photo;->viewClipTop:I

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 202
    iget v0, p0, Lcom/vkontakte/android/Photo;->postID:I

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 203
    iget-boolean v0, p0, Lcom/vkontakte/android/Photo;->hidden:Z

    if-eqz v0, :cond_5

    :goto_5
    int-to-byte v0, v1

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeByte(B)V

    .line 204
    invoke-virtual {p0}, Lcom/vkontakte/android/Photo;->serializeImages()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 205
    iget v0, p0, Lcom/vkontakte/android/Photo;->realOffset:I

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 206
    return-void

    :cond_0
    move v0, v2

    .line 179
    goto :goto_0

    :cond_1
    move v0, v2

    .line 180
    goto :goto_1

    :cond_2
    move v0, v2

    .line 181
    goto :goto_2

    :cond_3
    move v0, v2

    .line 182
    goto :goto_3

    .line 194
    :cond_4
    invoke-virtual {p1, v1}, Lcom/vkontakte/android/utils/Serializer;->writeByte(B)V

    .line 195
    iget-object v0, p0, Lcom/vkontakte/android/Photo;->viewBounds:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->left:I

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 196
    iget-object v0, p0, Lcom/vkontakte/android/Photo;->viewBounds:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->top:I

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 197
    iget-object v0, p0, Lcom/vkontakte/android/Photo;->viewBounds:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->right:I

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 198
    iget-object v0, p0, Lcom/vkontakte/android/Photo;->viewBounds:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->bottom:I

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    goto :goto_4

    :cond_5
    move v1, v2

    .line 203
    goto :goto_5
.end method
