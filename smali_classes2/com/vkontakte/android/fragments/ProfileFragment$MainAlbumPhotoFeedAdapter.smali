.class Lcom/vkontakte/android/fragments/ProfileFragment$MainAlbumPhotoFeedAdapter;
.super Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedAdapter;
.source "ProfileFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/ProfileFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MainAlbumPhotoFeedAdapter"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/ProfileFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/ProfileFragment;Ljava/util/List;Lme/grishka/appkit/views/UsableRecyclerView;)V
    .locals 0
    .param p3, "list"    # Lme/grishka/appkit/views/UsableRecyclerView;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/Photo;",
            ">;",
            "Lme/grishka/appkit/views/UsableRecyclerView;",
            ")V"
        }
    .end annotation

    .prologue
    .line 4181
    .local p2, "initialList":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/Photo;>;"
    iput-object p1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$MainAlbumPhotoFeedAdapter;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    .line 4182
    invoke-direct {p0, p1, p2, p3}, Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedAdapter;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;Ljava/util/List;Lme/grishka/appkit/views/UsableRecyclerView;)V

    .line 4183
    return-void
.end method

.method static synthetic access$8202(Lcom/vkontakte/android/fragments/ProfileFragment$MainAlbumPhotoFeedAdapter;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileFragment$MainAlbumPhotoFeedAdapter;
    .param p1, "x1"    # Z

    .prologue
    .line 4179
    iput-boolean p1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$MainAlbumPhotoFeedAdapter;->dataLoading:Z

    return p1
.end method

.method static synthetic access$8300(Lcom/vkontakte/android/fragments/ProfileFragment$MainAlbumPhotoFeedAdapter;)Lme/grishka/appkit/utils/Preloader;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileFragment$MainAlbumPhotoFeedAdapter;

    .prologue
    .line 4179
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$MainAlbumPhotoFeedAdapter;->preloader:Lme/grishka/appkit/utils/Preloader;

    return-object v0
.end method

.method static synthetic access$8400(Lcom/vkontakte/android/fragments/ProfileFragment$MainAlbumPhotoFeedAdapter;)Lme/grishka/appkit/utils/Preloader;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileFragment$MainAlbumPhotoFeedAdapter;

    .prologue
    .line 4179
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$MainAlbumPhotoFeedAdapter;->preloader:Lme/grishka/appkit/utils/Preloader;

    return-object v0
.end method

.method static synthetic access$8500(Lcom/vkontakte/android/fragments/ProfileFragment$MainAlbumPhotoFeedAdapter;)Lme/grishka/appkit/utils/Preloader;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileFragment$MainAlbumPhotoFeedAdapter;

    .prologue
    .line 4179
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$MainAlbumPhotoFeedAdapter;->preloader:Lme/grishka/appkit/utils/Preloader;

    return-object v0
.end method

.method static synthetic access$8602(Lcom/vkontakte/android/fragments/ProfileFragment$MainAlbumPhotoFeedAdapter;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileFragment$MainAlbumPhotoFeedAdapter;
    .param p1, "x1"    # Z

    .prologue
    .line 4179
    iput-boolean p1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$MainAlbumPhotoFeedAdapter;->dataLoading:Z

    return p1
.end method


# virtual methods
.method public loadData(II)V
    .locals 3
    .param p1, "offset"    # I
    .param p2, "count"    # I

    .prologue
    .line 4187
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$MainAlbumPhotoFeedAdapter;->dataLoading:Z

    .line 4188
    new-instance v0, Lcom/vkontakte/android/api/photos/PhotosGet;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$MainAlbumPhotoFeedAdapter;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$100(Lcom/vkontakte/android/fragments/ProfileFragment;)I

    move-result v1

    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment$MainAlbumPhotoFeedAdapter;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$000(Lcom/vkontakte/android/fragments/ProfileFragment;)Lcom/vkontakte/android/api/ExtendedUserProfile;

    move-result-object v2

    iget-object v2, v2, Lcom/vkontakte/android/api/ExtendedUserProfile;->mainAlbum:Lcom/vkontakte/android/api/PhotoAlbum;

    iget v2, v2, Lcom/vkontakte/android/api/PhotoAlbum;->id:I

    invoke-direct {v0, v1, v2, p1, p2}, Lcom/vkontakte/android/api/photos/PhotosGet;-><init>(IIII)V

    new-instance v1, Lcom/vkontakte/android/fragments/ProfileFragment$MainAlbumPhotoFeedAdapter$1;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/fragments/ProfileFragment$MainAlbumPhotoFeedAdapter$1;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment$MainAlbumPhotoFeedAdapter;)V

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/photos/PhotosGet;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$MainAlbumPhotoFeedAdapter;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    .line 4199
    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 4200
    return-void
.end method
