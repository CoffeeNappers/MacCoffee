.class public Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;
.super Lcom/vkontakte/android/fragments/photos/SectionedPhotoListFragment;
.source "PhotosOfMeFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment$ShowAllButtonViewHolder;,
        Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment$ShowAllButtonAdapter;
    }
.end annotation


# instance fields
.field private allPhotos:Lcom/vkontakte/android/fragments/photos/SectionedPhotoListFragment$Section;

.field private newCount:I

.field private newPhotos:Lcom/vkontakte/android/fragments/photos/SectionedPhotoListFragment$Section;

.field private newTags:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/TaggedPhoto;",
            ">;"
        }
    .end annotation
.end field

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
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 40
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/photos/SectionedPhotoListFragment;-><init>()V

    .line 37
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;->newTags:Ljava/util/ArrayList;

    .line 38
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;->profiles:Landroid/util/SparseArray;

    .line 41
    new-instance v0, Lcom/vkontakte/android/fragments/photos/SectionedPhotoListFragment$Section;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/photos/SectionedPhotoListFragment$Section;-><init>(Lcom/vkontakte/android/fragments/photos/SectionedPhotoListFragment;)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;->newPhotos:Lcom/vkontakte/android/fragments/photos/SectionedPhotoListFragment$Section;

    .line 42
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;->newPhotos:Lcom/vkontakte/android/fragments/photos/SectionedPhotoListFragment$Section;

    sget-object v1, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const v2, 0x7f080427

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/vkontakte/android/fragments/photos/SectionedPhotoListFragment$Section;->title:Ljava/lang/String;

    .line 43
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;->newPhotos:Lcom/vkontakte/android/fragments/photos/SectionedPhotoListFragment$Section;

    new-instance v1, Lcom/vkontakte/android/fragments/photos/SectionedPhotoListFragment$SectionHeaderAdapter;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;->newPhotos:Lcom/vkontakte/android/fragments/photos/SectionedPhotoListFragment$Section;

    iget-object v2, v2, Lcom/vkontakte/android/fragments/photos/SectionedPhotoListFragment$Section;->title:Ljava/lang/String;

    invoke-direct {v1, p0, v2}, Lcom/vkontakte/android/fragments/photos/SectionedPhotoListFragment$SectionHeaderAdapter;-><init>(Lcom/vkontakte/android/fragments/photos/SectionedPhotoListFragment;Ljava/lang/String;)V

    iput-object v1, v0, Lcom/vkontakte/android/fragments/photos/SectionedPhotoListFragment$Section;->headerAdapter:Lcom/vkontakte/android/fragments/photos/SectionedPhotoListFragment$SectionHeaderAdapter;

    .line 44
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;->newPhotos:Lcom/vkontakte/android/fragments/photos/SectionedPhotoListFragment$Section;

    iput v3, v0, Lcom/vkontakte/android/fragments/photos/SectionedPhotoListFragment$Section;->start:I

    .line 45
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;->newPhotos:Lcom/vkontakte/android/fragments/photos/SectionedPhotoListFragment$Section;

    new-instance v1, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoAdapter;

    invoke-direct {v1, p0, v3, v3}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoAdapter;-><init>(Lcom/vkontakte/android/fragments/photos/PhotoListFragment;II)V

    iput-object v1, v0, Lcom/vkontakte/android/fragments/photos/SectionedPhotoListFragment$Section;->adapter:Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoAdapter;

    .line 47
    new-instance v0, Lcom/vkontakte/android/fragments/photos/SectionedPhotoListFragment$Section;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/photos/SectionedPhotoListFragment$Section;-><init>(Lcom/vkontakte/android/fragments/photos/SectionedPhotoListFragment;)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;->allPhotos:Lcom/vkontakte/android/fragments/photos/SectionedPhotoListFragment$Section;

    .line 48
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;->allPhotos:Lcom/vkontakte/android/fragments/photos/SectionedPhotoListFragment$Section;

    sget-object v1, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const v2, 0x7f080742

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/vkontakte/android/fragments/photos/SectionedPhotoListFragment$Section;->title:Ljava/lang/String;

    .line 49
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;->allPhotos:Lcom/vkontakte/android/fragments/photos/SectionedPhotoListFragment$Section;

    new-instance v1, Lcom/vkontakte/android/fragments/photos/SectionedPhotoListFragment$SectionHeaderAdapter;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;->allPhotos:Lcom/vkontakte/android/fragments/photos/SectionedPhotoListFragment$Section;

    iget-object v2, v2, Lcom/vkontakte/android/fragments/photos/SectionedPhotoListFragment$Section;->title:Ljava/lang/String;

    invoke-direct {v1, p0, v2}, Lcom/vkontakte/android/fragments/photos/SectionedPhotoListFragment$SectionHeaderAdapter;-><init>(Lcom/vkontakte/android/fragments/photos/SectionedPhotoListFragment;Ljava/lang/String;)V

    iput-object v1, v0, Lcom/vkontakte/android/fragments/photos/SectionedPhotoListFragment$Section;->headerAdapter:Lcom/vkontakte/android/fragments/photos/SectionedPhotoListFragment$SectionHeaderAdapter;

    .line 50
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;->allPhotos:Lcom/vkontakte/android/fragments/photos/SectionedPhotoListFragment$Section;

    iput v3, v0, Lcom/vkontakte/android/fragments/photos/SectionedPhotoListFragment$Section;->start:I

    .line 51
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;->allPhotos:Lcom/vkontakte/android/fragments/photos/SectionedPhotoListFragment$Section;

    new-instance v1, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoAdapter;

    const v2, 0x7fffffff

    invoke-direct {v1, p0, v3, v2}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoAdapter;-><init>(Lcom/vkontakte/android/fragments/photos/PhotoListFragment;II)V

    iput-object v1, v0, Lcom/vkontakte/android/fragments/photos/SectionedPhotoListFragment$Section;->adapter:Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoAdapter;

    .line 53
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;->sections:Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;->newPhotos:Lcom/vkontakte/android/fragments/photos/SectionedPhotoListFragment$Section;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 54
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;->sections:Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;->allPhotos:Lcom/vkontakte/android/fragments/photos/SectionedPhotoListFragment$Section;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 55
    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;

    .prologue
    .line 33
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$100(Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;

    .prologue
    .line 33
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;->refreshing:Z

    return v0
.end method

.method static synthetic access$202(Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;I)I
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;
    .param p1, "x1"    # I

    .prologue
    .line 33
    iput p1, p0, Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;->newCount:I

    return p1
.end method

.method static synthetic access$300(Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;

    .prologue
    .line 33
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;->newTags:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$400(Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;)Landroid/util/SparseArray;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;

    .prologue
    .line 33
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;->profiles:Landroid/util/SparseArray;

    return-object v0
.end method

.method static synthetic access$500(Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;

    .prologue
    .line 33
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$600(Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;)Lcom/vkontakte/android/fragments/photos/SectionedPhotoListFragment$Section;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;

    .prologue
    .line 33
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;->allPhotos:Lcom/vkontakte/android/fragments/photos/SectionedPhotoListFragment$Section;

    return-object v0
.end method

.method static synthetic access$700(Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;)Lcom/vkontakte/android/fragments/photos/SectionedPhotoListFragment$Section;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;

    .prologue
    .line 33
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;->newPhotos:Lcom/vkontakte/android/fragments/photos/SectionedPhotoListFragment$Section;

    return-object v0
.end method

.method static synthetic access$900(Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;)Lme/grishka/appkit/views/UsableRecyclerView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;

    .prologue
    .line 33
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    return-object v0
.end method


# virtual methods
.method protected doLoadData(II)V
    .locals 2
    .param p1, "offset"    # I
    .param p2, "count"    # I

    .prologue
    .line 59
    const/4 v0, 0x0

    iget-boolean v1, p0, Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;->refreshing:Z

    if-eqz v1, :cond_0

    .end local p1    # "offset":I
    :goto_0
    invoke-static {v0, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    .line 60
    .restart local p1    # "offset":I
    new-instance v0, Lcom/vkontakte/android/api/photos/PhotosGetUserPhotosAndNewTags;

    invoke-direct {v0, p1, p2}, Lcom/vkontakte/android/api/photos/PhotosGetUserPhotosAndNewTags;-><init>(II)V

    new-instance v1, Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment$1;

    invoke-direct {v1, p0, p0}, Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment$1;-><init>(Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;Landroid/app/Fragment;)V

    .line 61
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/photos/PhotosGetUserPhotosAndNewTags;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 85
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;->currentRequest:Lme/grishka/appkit/api/APIRequest;

    .line 86
    return-void

    .line 59
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;->newTags:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    sub-int/2addr p1, v1

    goto :goto_0
.end method

.method public getPhotoBounds(ILandroid/graphics/Rect;Landroid/graphics/Rect;)V
    .locals 1
    .param p1, "index"    # I
    .param p2, "outRect"    # Landroid/graphics/Rect;
    .param p3, "outClip"    # Landroid/graphics/Rect;

    .prologue
    .line 154
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;->newTags:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/2addr v0, p1

    invoke-super {p0, v0, p2, p3}, Lcom/vkontakte/android/fragments/photos/SectionedPhotoListFragment;->getPhotoBounds(ILandroid/graphics/Rect;Landroid/graphics/Rect;)V

    .line 155
    return-void
.end method

.method public onAppendItems(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/Photo;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 90
    .local p1, "items":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/Photo;>;"
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/photos/SectionedPhotoListFragment;->onAppendItems(Ljava/util/List;)V

    .line 91
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;->adapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    invoke-virtual {v0}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->removeAllAdapters()V

    .line 92
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;->showAlbumHeader:Z

    if-eqz v0, :cond_0

    .line 93
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;->adapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    new-instance v1, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$HeaderAdapter;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$HeaderAdapter;-><init>(Lcom/vkontakte/android/fragments/photos/PhotoListFragment;)V

    invoke-virtual {v0, v1}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->addAdapter(Lme/grishka/appkit/views/UsableRecyclerView$Adapter;)V

    .line 95
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;->newTags:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_2

    .line 96
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;->adapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;->newPhotos:Lcom/vkontakte/android/fragments/photos/SectionedPhotoListFragment$Section;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/photos/SectionedPhotoListFragment$Section;->headerAdapter:Lcom/vkontakte/android/fragments/photos/SectionedPhotoListFragment$SectionHeaderAdapter;

    invoke-virtual {v0, v1}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->addAdapter(Lme/grishka/appkit/views/UsableRecyclerView$Adapter;)V

    .line 97
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;->adapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;->newPhotos:Lcom/vkontakte/android/fragments/photos/SectionedPhotoListFragment$Section;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/photos/SectionedPhotoListFragment$Section;->adapter:Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoAdapter;

    invoke-virtual {v0, v1}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->addAdapter(Lme/grishka/appkit/views/UsableRecyclerView$Adapter;)V

    .line 98
    iget v0, p0, Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;->newCount:I

    iget-object v1, p0, Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;->newTags:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-le v0, v1, :cond_1

    .line 99
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;->adapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    new-instance v1, Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment$ShowAllButtonAdapter;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment$ShowAllButtonAdapter;-><init>(Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment$1;)V

    invoke-virtual {v0, v1}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->addAdapter(Lme/grishka/appkit/views/UsableRecyclerView$Adapter;)V

    .line 101
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;->adapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;->allPhotos:Lcom/vkontakte/android/fragments/photos/SectionedPhotoListFragment$Section;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/photos/SectionedPhotoListFragment$Section;->headerAdapter:Lcom/vkontakte/android/fragments/photos/SectionedPhotoListFragment$SectionHeaderAdapter;

    invoke-virtual {v0, v1}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->addAdapter(Lme/grishka/appkit/views/UsableRecyclerView$Adapter;)V

    .line 103
    :cond_2
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;->adapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;->allPhotos:Lcom/vkontakte/android/fragments/photos/SectionedPhotoListFragment$Section;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/photos/SectionedPhotoListFragment$Section;->adapter:Lcom/vkontakte/android/fragments/photos/PhotoListFragment$PhotoAdapter;

    invoke-virtual {v0, v1}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->addAdapter(Lme/grishka/appkit/views/UsableRecyclerView$Adapter;)V

    .line 104
    return-void
.end method

.method protected onPhotoRemoved()V
    .locals 0

    .prologue
    .line 159
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;->refresh()V

    .line 160
    return-void
.end method

.method protected openPhoto(Lcom/vkontakte/android/Photo;)V
    .locals 13
    .param p1, "photo"    # Lcom/vkontakte/android/Photo;

    .prologue
    const-wide v4, -0x3f3e6c0000000000L    # -9000.0

    .line 107
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v2

    const-string/jumbo v3, "select"

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 108
    new-instance v11, Landroid/content/Intent;

    invoke-direct {v11}, Landroid/content/Intent;-><init>()V

    .line 109
    .local v11, "intent":Landroid/content/Intent;
    const-string/jumbo v2, "photo"

    invoke-virtual {v11, v2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 110
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    const/4 v3, -0x1

    invoke-virtual {v2, v3, v11}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 111
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->finish()V

    .line 150
    .end local v11    # "intent":Landroid/content/Intent;
    :goto_0
    return-void

    .line 114
    :cond_0
    instance-of v2, p1, Lcom/vkontakte/android/TaggedPhoto;

    if-eqz v2, :cond_3

    move-object v12, p1

    .line 115
    check-cast v12, Lcom/vkontakte/android/TaggedPhoto;

    .line 116
    .local v12, "tp":Lcom/vkontakte/android/TaggedPhoto;
    iget-object v2, p0, Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;->profiles:Landroid/util/SparseArray;

    iget v3, v12, Lcom/vkontakte/android/TaggedPhoto;->ownerID:I

    invoke-virtual {v2, v3}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/UserProfile;

    iput-object v2, v12, Lcom/vkontakte/android/TaggedPhoto;->user:Lcom/vkontakte/android/UserProfile;

    .line 117
    new-instance v0, Lcom/vkontakte/android/NewsEntry;

    invoke-direct {v0}, Lcom/vkontakte/android/NewsEntry;-><init>()V

    .line 118
    .local v0, "e":Lcom/vkontakte/android/NewsEntry;
    const/4 v2, 0x1

    iput v2, v0, Lcom/vkontakte/android/NewsEntry;->type:I

    .line 119
    iget v2, v12, Lcom/vkontakte/android/TaggedPhoto;->id:I

    iput v2, v0, Lcom/vkontakte/android/NewsEntry;->postID:I

    .line 120
    iget v2, v12, Lcom/vkontakte/android/TaggedPhoto;->ownerID:I

    iput v2, v0, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    .line 121
    iget v2, v12, Lcom/vkontakte/android/TaggedPhoto;->userID:I

    iput v2, v0, Lcom/vkontakte/android/NewsEntry;->userID:I

    .line 122
    iget-object v2, v0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    new-instance v3, Lcom/vkontakte/android/attachments/PhotoAttachment;

    invoke-direct {v3, v12}, Lcom/vkontakte/android/attachments/PhotoAttachment;-><init>(Lcom/vkontakte/android/Photo;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 126
    iget v2, v12, Lcom/vkontakte/android/TaggedPhoto;->date:I

    iput v2, v0, Lcom/vkontakte/android/NewsEntry;->time:I

    .line 127
    iget v2, v12, Lcom/vkontakte/android/TaggedPhoto;->nLikes:I

    iput v2, v0, Lcom/vkontakte/android/NewsEntry;->numLikes:I

    .line 128
    iget v2, v12, Lcom/vkontakte/android/TaggedPhoto;->nReposts:I

    iput v2, v0, Lcom/vkontakte/android/NewsEntry;->numRetweets:I

    .line 129
    iget v2, v12, Lcom/vkontakte/android/TaggedPhoto;->nComments:I

    iput v2, v0, Lcom/vkontakte/android/NewsEntry;->numComments:I

    .line 130
    iget-object v2, v12, Lcom/vkontakte/android/TaggedPhoto;->user:Lcom/vkontakte/android/UserProfile;

    if-eqz v2, :cond_1

    .line 131
    iget-object v2, v12, Lcom/vkontakte/android/TaggedPhoto;->user:Lcom/vkontakte/android/UserProfile;

    iget-object v2, v2, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    iput-object v2, v0, Lcom/vkontakte/android/NewsEntry;->userName:Ljava/lang/String;

    .line 132
    iget-object v2, v12, Lcom/vkontakte/android/TaggedPhoto;->user:Lcom/vkontakte/android/UserProfile;

    iget-object v2, v2, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    iput-object v2, v0, Lcom/vkontakte/android/NewsEntry;->userPhotoURL:Ljava/lang/String;

    .line 134
    :cond_1
    iget-wide v2, v12, Lcom/vkontakte/android/TaggedPhoto;->lat:D

    cmpl-double v2, v2, v4

    if-eqz v2, :cond_2

    iget-wide v2, v12, Lcom/vkontakte/android/TaggedPhoto;->lon:D

    cmpl-double v2, v2, v4

    if-eqz v2, :cond_2

    .line 135
    new-instance v1, Lcom/vkontakte/android/attachments/GeoAttachment;

    iget-wide v2, v12, Lcom/vkontakte/android/TaggedPhoto;->lat:D

    iget-wide v4, v12, Lcom/vkontakte/android/TaggedPhoto;->lon:D

    const-string/jumbo v6, ""

    iget-object v7, v12, Lcom/vkontakte/android/TaggedPhoto;->geoAddress:Ljava/lang/String;

    const/16 v8, -0x2328

    const/4 v9, 0x0

    const/4 v10, 0x0

    invoke-direct/range {v1 .. v10}, Lcom/vkontakte/android/attachments/GeoAttachment;-><init>(DDLjava/lang/String;Ljava/lang/String;ILjava/lang/String;I)V

    .line 136
    .local v1, "geo":Lcom/vkontakte/android/attachments/GeoAttachment;
    iget-object v2, v0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 138
    .end local v1    # "geo":Lcom/vkontakte/android/attachments/GeoAttachment;
    :cond_2
    const/16 v2, 0x8

    iget-boolean v3, v12, Lcom/vkontakte/android/TaggedPhoto;->isLiked:Z

    invoke-virtual {v0, v2, v3}, Lcom/vkontakte/android/NewsEntry;->flag(IZ)V

    .line 139
    const/4 v2, 0x2

    iget-boolean v3, v12, Lcom/vkontakte/android/TaggedPhoto;->canComment:Z

    invoke-virtual {v0, v2, v3}, Lcom/vkontakte/android/NewsEntry;->flag(IZ)V

    .line 141
    new-instance v3, Lcom/vkontakte/android/fragments/PostViewFragment$Builder;

    invoke-direct {v3, v0}, Lcom/vkontakte/android/fragments/PostViewFragment$Builder;-><init>(Lcom/vkontakte/android/NewsEntry;)V

    iget-object v2, p0, Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;->profiles:Landroid/util/SparseArray;

    iget v4, v12, Lcom/vkontakte/android/TaggedPhoto;->tagPlacerID:I

    invoke-virtual {v2, v4}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/UserProfile;

    invoke-virtual {v3, v2}, Lcom/vkontakte/android/fragments/PostViewFragment$Builder;->setPlacerProfile(Lcom/vkontakte/android/UserProfile;)Lcom/vkontakte/android/fragments/PostViewFragment$Builder;

    move-result-object v2

    iget v3, v12, Lcom/vkontakte/android/TaggedPhoto;->tagID:I

    .line 142
    invoke-virtual {v2, v3}, Lcom/vkontakte/android/fragments/PostViewFragment$Builder;->setTagId(I)Lcom/vkontakte/android/fragments/PostViewFragment$Builder;

    move-result-object v2

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/fragments/PostViewFragment$Builder;->go(Landroid/content/Context;)Z

    goto/16 :goto_0

    .line 145
    .end local v0    # "e":Lcom/vkontakte/android/NewsEntry;
    .end local v12    # "tp":Lcom/vkontakte/android/TaggedPhoto;
    :cond_3
    new-instance v2, Lcom/vkontakte/android/PhotoViewer;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    iget-object v4, p0, Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;->data:Ljava/util/ArrayList;

    iget-object v5, p0, Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;->newTags:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    iget-object v6, p0, Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;->data:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    invoke-virtual {v4, v5, v6}, Ljava/util/ArrayList;->subList(II)Ljava/util/List;

    move-result-object v4

    iget-object v5, p0, Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;->data:Ljava/util/ArrayList;

    invoke-virtual {v5, p1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v5

    iget-object v6, p0, Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;->newTags:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    sub-int/2addr v5, v6

    invoke-direct {v2, v3, v4, v5, p0}, Lcom/vkontakte/android/PhotoViewer;-><init>(Landroid/app/Activity;Ljava/util/List;ILcom/vkontakte/android/PhotoViewer$PhotoViewerCallback;)V

    iput-object v2, p0, Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;->viewer:Lcom/vkontakte/android/PhotoViewer;

    .line 146
    iget-object v2, p0, Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;->viewer:Lcom/vkontakte/android/PhotoViewer;

    iget-object v3, p0, Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;->album:Lcom/vkontakte/android/api/PhotoAlbum;

    iget-object v3, v3, Lcom/vkontakte/android/api/PhotoAlbum;->title:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/PhotoViewer;->setTitle(Ljava/lang/String;)V

    .line 147
    iget-object v2, p0, Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;->viewer:Lcom/vkontakte/android/PhotoViewer;

    iget-object v3, p0, Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;->album:Lcom/vkontakte/android/api/PhotoAlbum;

    iget v3, v3, Lcom/vkontakte/android/api/PhotoAlbum;->numPhotos:I

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/PhotoViewer;->setDisplayTotal(I)V

    .line 148
    iget-object v2, p0, Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;->viewer:Lcom/vkontakte/android/PhotoViewer;

    iget-object v3, p0, Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;->album:Lcom/vkontakte/android/api/PhotoAlbum;

    iget v3, v3, Lcom/vkontakte/android/api/PhotoAlbum;->oid:I

    iget-object v4, p0, Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;->album:Lcom/vkontakte/android/api/PhotoAlbum;

    iget v4, v4, Lcom/vkontakte/android/api/PhotoAlbum;->id:I

    invoke-virtual {v2, v3, v4}, Lcom/vkontakte/android/PhotoViewer;->setAlbumIDs(II)V

    .line 149
    iget-object v2, p0, Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;->viewer:Lcom/vkontakte/android/PhotoViewer;

    invoke-virtual {v2}, Lcom/vkontakte/android/PhotoViewer;->show()V

    goto/16 :goto_0
.end method
