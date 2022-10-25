.class Lcom/vkontakte/android/fragments/ProfileFragment$AllPhotosPhotoFeedAdapter;
.super Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedAdapter;
.source "ProfileFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/ProfileFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "AllPhotosPhotoFeedAdapter"
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
    .line 4155
    .local p2, "initialList":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/Photo;>;"
    iput-object p1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$AllPhotosPhotoFeedAdapter;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    .line 4156
    invoke-direct {p0, p1, p2, p3}, Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedAdapter;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;Ljava/util/List;Lme/grishka/appkit/views/UsableRecyclerView;)V

    .line 4157
    return-void
.end method

.method static synthetic access$7702(Lcom/vkontakte/android/fragments/ProfileFragment$AllPhotosPhotoFeedAdapter;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileFragment$AllPhotosPhotoFeedAdapter;
    .param p1, "x1"    # Z

    .prologue
    .line 4153
    iput-boolean p1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$AllPhotosPhotoFeedAdapter;->dataLoading:Z

    return p1
.end method

.method static synthetic access$7800(Lcom/vkontakte/android/fragments/ProfileFragment$AllPhotosPhotoFeedAdapter;)Lme/grishka/appkit/utils/Preloader;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileFragment$AllPhotosPhotoFeedAdapter;

    .prologue
    .line 4153
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$AllPhotosPhotoFeedAdapter;->preloader:Lme/grishka/appkit/utils/Preloader;

    return-object v0
.end method

.method static synthetic access$7900(Lcom/vkontakte/android/fragments/ProfileFragment$AllPhotosPhotoFeedAdapter;)Lme/grishka/appkit/utils/Preloader;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileFragment$AllPhotosPhotoFeedAdapter;

    .prologue
    .line 4153
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$AllPhotosPhotoFeedAdapter;->preloader:Lme/grishka/appkit/utils/Preloader;

    return-object v0
.end method

.method static synthetic access$8000(Lcom/vkontakte/android/fragments/ProfileFragment$AllPhotosPhotoFeedAdapter;)Lme/grishka/appkit/utils/Preloader;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileFragment$AllPhotosPhotoFeedAdapter;

    .prologue
    .line 4153
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$AllPhotosPhotoFeedAdapter;->preloader:Lme/grishka/appkit/utils/Preloader;

    return-object v0
.end method

.method static synthetic access$8102(Lcom/vkontakte/android/fragments/ProfileFragment$AllPhotosPhotoFeedAdapter;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileFragment$AllPhotosPhotoFeedAdapter;
    .param p1, "x1"    # Z

    .prologue
    .line 4153
    iput-boolean p1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$AllPhotosPhotoFeedAdapter;->dataLoading:Z

    return p1
.end method


# virtual methods
.method public loadData(II)V
    .locals 2
    .param p1, "offset"    # I
    .param p2, "count"    # I

    .prologue
    .line 4161
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$AllPhotosPhotoFeedAdapter;->dataLoading:Z

    .line 4162
    new-instance v0, Lcom/vkontakte/android/api/photos/PhotosGetAll;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$AllPhotosPhotoFeedAdapter;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$100(Lcom/vkontakte/android/fragments/ProfileFragment;)I

    move-result v1

    invoke-direct {v0, v1, p1, p2}, Lcom/vkontakte/android/api/photos/PhotosGetAll;-><init>(III)V

    new-instance v1, Lcom/vkontakte/android/fragments/ProfileFragment$AllPhotosPhotoFeedAdapter$1;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/fragments/ProfileFragment$AllPhotosPhotoFeedAdapter$1;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment$AllPhotosPhotoFeedAdapter;)V

    .line 4163
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/photos/PhotosGetAll;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$AllPhotosPhotoFeedAdapter;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    .line 4175
    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 4176
    return-void
.end method
