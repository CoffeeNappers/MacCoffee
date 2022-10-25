.class public Lcom/vkontakte/android/fragments/photos/NewPhotoTagsFragment;
.super Lcom/vkontakte/android/fragments/photos/PhotoListFragment;
.source "NewPhotoTagsFragment.java"


# instance fields
.field private profiles:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 22
    const/16 v0, 0x32

    invoke-direct {p0, v0}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;-><init>(I)V

    .line 19
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/photos/NewPhotoTagsFragment;->profiles:Landroid/util/SparseArray;

    .line 23
    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/fragments/photos/NewPhotoTagsFragment;)Landroid/util/SparseArray;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/photos/NewPhotoTagsFragment;

    .prologue
    .line 17
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/NewPhotoTagsFragment;->profiles:Landroid/util/SparseArray;

    return-object v0
.end method


# virtual methods
.method protected doLoadData(II)V
    .locals 2
    .param p1, "offset"    # I
    .param p2, "count"    # I

    .prologue
    .line 27
    new-instance v0, Lcom/vkontakte/android/api/photos/PhotosGetNewTags;

    invoke-direct {v0, p1, p2}, Lcom/vkontakte/android/api/photos/PhotosGetNewTags;-><init>(II)V

    new-instance v1, Lcom/vkontakte/android/fragments/photos/NewPhotoTagsFragment$1;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/fragments/photos/NewPhotoTagsFragment$1;-><init>(Lcom/vkontakte/android/fragments/photos/NewPhotoTagsFragment;)V

    .line 28
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/photos/PhotosGetNewTags;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 38
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/photos/NewPhotoTagsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 39
    return-void
.end method

.method protected openPhoto(Lcom/vkontakte/android/Photo;)V
    .locals 12
    .param p1, "photo"    # Lcom/vkontakte/android/Photo;

    .prologue
    const-wide v4, -0x3f3e6c0000000000L    # -9000.0

    .line 43
    move-object v11, p1

    check-cast v11, Lcom/vkontakte/android/TaggedPhoto;

    .line 44
    .local v11, "tp":Lcom/vkontakte/android/TaggedPhoto;
    iget-object v2, p0, Lcom/vkontakte/android/fragments/photos/NewPhotoTagsFragment;->profiles:Landroid/util/SparseArray;

    iget v3, v11, Lcom/vkontakte/android/TaggedPhoto;->ownerID:I

    invoke-virtual {v2, v3}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/UserProfile;

    iput-object v2, v11, Lcom/vkontakte/android/TaggedPhoto;->user:Lcom/vkontakte/android/UserProfile;

    .line 45
    new-instance v0, Lcom/vkontakte/android/NewsEntry;

    invoke-direct {v0}, Lcom/vkontakte/android/NewsEntry;-><init>()V

    .line 46
    .local v0, "e":Lcom/vkontakte/android/NewsEntry;
    const/4 v2, 0x1

    iput v2, v0, Lcom/vkontakte/android/NewsEntry;->type:I

    .line 47
    iget v2, v11, Lcom/vkontakte/android/TaggedPhoto;->id:I

    iput v2, v0, Lcom/vkontakte/android/NewsEntry;->postID:I

    .line 48
    iget v2, v11, Lcom/vkontakte/android/TaggedPhoto;->ownerID:I

    iput v2, v0, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    .line 49
    iget v2, v11, Lcom/vkontakte/android/TaggedPhoto;->userID:I

    iput v2, v0, Lcom/vkontakte/android/NewsEntry;->userID:I

    .line 50
    iget-object v2, v0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    new-instance v3, Lcom/vkontakte/android/attachments/PhotoAttachment;

    invoke-direct {v3, v11}, Lcom/vkontakte/android/attachments/PhotoAttachment;-><init>(Lcom/vkontakte/android/Photo;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 54
    iget v2, v11, Lcom/vkontakte/android/TaggedPhoto;->date:I

    iput v2, v0, Lcom/vkontakte/android/NewsEntry;->time:I

    .line 55
    iget v2, v11, Lcom/vkontakte/android/TaggedPhoto;->nLikes:I

    iput v2, v0, Lcom/vkontakte/android/NewsEntry;->numLikes:I

    .line 56
    iget v2, v11, Lcom/vkontakte/android/TaggedPhoto;->nReposts:I

    iput v2, v0, Lcom/vkontakte/android/NewsEntry;->numRetweets:I

    .line 57
    iget v2, v11, Lcom/vkontakte/android/TaggedPhoto;->nComments:I

    iput v2, v0, Lcom/vkontakte/android/NewsEntry;->numComments:I

    .line 58
    iget-object v2, v11, Lcom/vkontakte/android/TaggedPhoto;->user:Lcom/vkontakte/android/UserProfile;

    if-eqz v2, :cond_0

    .line 59
    iget-object v2, v11, Lcom/vkontakte/android/TaggedPhoto;->user:Lcom/vkontakte/android/UserProfile;

    iget-object v2, v2, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    iput-object v2, v0, Lcom/vkontakte/android/NewsEntry;->userName:Ljava/lang/String;

    .line 60
    iget-object v2, v11, Lcom/vkontakte/android/TaggedPhoto;->user:Lcom/vkontakte/android/UserProfile;

    iget-object v2, v2, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    iput-object v2, v0, Lcom/vkontakte/android/NewsEntry;->userPhotoURL:Ljava/lang/String;

    .line 62
    :cond_0
    iget-wide v2, v11, Lcom/vkontakte/android/TaggedPhoto;->lat:D

    cmpl-double v2, v2, v4

    if-eqz v2, :cond_1

    iget-wide v2, v11, Lcom/vkontakte/android/TaggedPhoto;->lon:D

    cmpl-double v2, v2, v4

    if-eqz v2, :cond_1

    .line 63
    new-instance v1, Lcom/vkontakte/android/attachments/GeoAttachment;

    iget-wide v2, v11, Lcom/vkontakte/android/TaggedPhoto;->lat:D

    iget-wide v4, v11, Lcom/vkontakte/android/TaggedPhoto;->lon:D

    const-string/jumbo v6, ""

    iget-object v7, v11, Lcom/vkontakte/android/TaggedPhoto;->geoAddress:Ljava/lang/String;

    const/16 v8, -0x2328

    const/4 v9, 0x0

    const/4 v10, 0x0

    invoke-direct/range {v1 .. v10}, Lcom/vkontakte/android/attachments/GeoAttachment;-><init>(DDLjava/lang/String;Ljava/lang/String;ILjava/lang/String;I)V

    .line 64
    .local v1, "geo":Lcom/vkontakte/android/attachments/GeoAttachment;
    iget-object v2, v0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 66
    .end local v1    # "geo":Lcom/vkontakte/android/attachments/GeoAttachment;
    :cond_1
    const/16 v2, 0x8

    iget-boolean v3, v11, Lcom/vkontakte/android/TaggedPhoto;->isLiked:Z

    invoke-virtual {v0, v2, v3}, Lcom/vkontakte/android/NewsEntry;->flag(IZ)V

    .line 67
    const/4 v2, 0x2

    iget-boolean v3, v11, Lcom/vkontakte/android/TaggedPhoto;->canComment:Z

    invoke-virtual {v0, v2, v3}, Lcom/vkontakte/android/NewsEntry;->flag(IZ)V

    .line 69
    new-instance v3, Lcom/vkontakte/android/fragments/PostViewFragment$Builder;

    invoke-direct {v3, v0}, Lcom/vkontakte/android/fragments/PostViewFragment$Builder;-><init>(Lcom/vkontakte/android/NewsEntry;)V

    iget-object v2, p0, Lcom/vkontakte/android/fragments/photos/NewPhotoTagsFragment;->profiles:Landroid/util/SparseArray;

    iget v4, v11, Lcom/vkontakte/android/TaggedPhoto;->tagPlacerID:I

    invoke-virtual {v2, v4}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/UserProfile;

    invoke-virtual {v3, v2}, Lcom/vkontakte/android/fragments/PostViewFragment$Builder;->setPlacerProfile(Lcom/vkontakte/android/UserProfile;)Lcom/vkontakte/android/fragments/PostViewFragment$Builder;

    move-result-object v2

    iget v3, v11, Lcom/vkontakte/android/TaggedPhoto;->tagID:I

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/fragments/PostViewFragment$Builder;->setTagId(I)Lcom/vkontakte/android/fragments/PostViewFragment$Builder;

    move-result-object v2

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/photos/NewPhotoTagsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/fragments/PostViewFragment$Builder;->go(Landroid/content/Context;)Z

    .line 70
    return-void
.end method
