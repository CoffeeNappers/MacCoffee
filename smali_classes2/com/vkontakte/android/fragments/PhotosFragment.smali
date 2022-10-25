.class public Lcom/vkontakte/android/fragments/PhotosFragment;
.super Lcom/vkontakte/android/fragments/VKTabbedFragment;
.source "PhotosFragment.java"

# interfaces
.implements Lcom/vk/attachpicker/SupportExternalToolbarContainer;


# instance fields
.field private allPhotosFragment:Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

.field private newsFragment:Lcom/vkontakte/android/fragments/PhotoNewsFragment;

.field private photosFragment:Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;

.field private uid:I

.field private userPhotosFragment:Lcom/vkontakte/android/fragments/photos/PhotoListFragment;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 53
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/VKTabbedFragment;-><init>()V

    .line 55
    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/fragments/PhotosFragment;)I
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/PhotosFragment;

    .prologue
    .line 42
    iget v0, p0, Lcom/vkontakte/android/fragments/PhotosFragment;->uid:I

    return v0
.end method

.method static synthetic access$100(Lcom/vkontakte/android/fragments/PhotosFragment;)Lcom/vkontakte/android/fragments/photos/PhotoListFragment;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/PhotosFragment;

    .prologue
    .line 42
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PhotosFragment;->userPhotosFragment:Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    return-object v0
.end method

.method static synthetic access$102(Lcom/vkontakte/android/fragments/PhotosFragment;Lcom/vkontakte/android/fragments/photos/PhotoListFragment;)Lcom/vkontakte/android/fragments/photos/PhotoListFragment;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/PhotosFragment;
    .param p1, "x1"    # Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    .prologue
    .line 42
    iput-object p1, p0, Lcom/vkontakte/android/fragments/PhotosFragment;->userPhotosFragment:Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    return-object p1
.end method

.method private isInContextOfAttachActivity()Z
    .locals 1

    .prologue
    .line 50
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PhotosFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    instance-of v0, v0, Lcom/vk/attachpicker/AttachActivity;

    return v0
.end method


# virtual methods
.method protected canGoBack()Z
    .locals 1

    .prologue
    .line 170
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/PhotosFragment;->isInContextOfAttachActivity()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 171
    const/4 v0, 0x0

    .line 173
    :goto_0
    return v0

    :cond_0
    invoke-super {p0}, Lcom/vkontakte/android/fragments/VKTabbedFragment;->canGoBack()Z

    move-result v0

    goto :goto_0
.end method

.method public hasNavigationDrawer()Z
    .locals 1

    .prologue
    .line 178
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/PhotosFragment;->isInContextOfAttachActivity()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 179
    const/4 v0, 0x0

    .line 180
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public onAttach(Landroid/app/Activity;)V
    .locals 14
    .param p1, "act"    # Landroid/app/Activity;

    .prologue
    const v13, 0x7f0804b1

    const/4 v8, 0x1

    const/4 v9, 0x0

    .line 58
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/VKTabbedFragment;->onAttach(Landroid/app/Activity;)V

    .line 60
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PhotosFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v7

    const-string/jumbo v10, "uid"

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v11

    invoke-virtual {v11}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v11

    invoke-virtual {v7, v10, v11}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v7

    iput v7, p0, Lcom/vkontakte/android/fragments/PhotosFragment;->uid:I

    .line 61
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v10, "albums"

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget v10, p0, Lcom/vkontakte/android/fragments/PhotosFragment;->uid:I

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {p1, v7}, Lcom/vkontakte/android/ActivityUtils;->setBeamLink(Landroid/app/Activity;Ljava/lang/String;)V

    .line 63
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PhotosFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v7

    const-string/jumbo v10, "title"

    invoke-virtual {v7, v10}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_4

    .line 64
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PhotosFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v7

    const-string/jumbo v10, "title"

    invoke-virtual {v7, v10}, Landroid/os/Bundle;->getCharSequence(Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object v7

    invoke-virtual {p0, v7}, Lcom/vkontakte/android/fragments/PhotosFragment;->setTitle(Ljava/lang/CharSequence;)V

    .line 69
    :goto_0
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 70
    .local v4, "tabs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/app/Fragment;>;"
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 72
    .local v5, "titles":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/CharSequence;>;"
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PhotosFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v7

    const-string/jumbo v10, "show_friends_feed"

    invoke-virtual {v7, v10}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 73
    new-instance v7, Lcom/vkontakte/android/fragments/PhotoNewsFragment;

    invoke-direct {v7}, Lcom/vkontakte/android/fragments/PhotoNewsFragment;-><init>()V

    iput-object v7, p0, Lcom/vkontakte/android/fragments/PhotosFragment;->newsFragment:Lcom/vkontakte/android/fragments/PhotoNewsFragment;

    .line 74
    iget-object v7, p0, Lcom/vkontakte/android/fragments/PhotosFragment;->newsFragment:Lcom/vkontakte/android/fragments/PhotoNewsFragment;

    invoke-virtual {v4, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 75
    const v7, 0x7f08023b

    invoke-virtual {p0, v7}, Lcom/vkontakte/android/fragments/PhotosFragment;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 78
    :cond_0
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 80
    .local v1, "args":Landroid/os/Bundle;
    new-instance v0, Lcom/vkontakte/android/api/PhotoAlbum;

    invoke-direct {v0}, Lcom/vkontakte/android/api/PhotoAlbum;-><init>()V

    .line 81
    .local v0, "allPhotos":Lcom/vkontakte/android/api/PhotoAlbum;
    const v7, 0x7f0800ca

    invoke-virtual {p0, v7}, Lcom/vkontakte/android/fragments/PhotosFragment;->getString(I)Ljava/lang/String;

    move-result-object v7

    iput-object v7, v0, Lcom/vkontakte/android/api/PhotoAlbum;->title:Ljava/lang/String;

    .line 82
    const/16 v7, -0x232a

    iput v7, v0, Lcom/vkontakte/android/api/PhotoAlbum;->id:I

    .line 83
    iget v7, p0, Lcom/vkontakte/android/fragments/PhotosFragment;->uid:I

    iput v7, v0, Lcom/vkontakte/android/api/PhotoAlbum;->oid:I

    .line 84
    new-instance v7, Lcom/vkontakte/android/fragments/photos/YearSectionedPhotoListFragment;

    invoke-direct {v7}, Lcom/vkontakte/android/fragments/photos/YearSectionedPhotoListFragment;-><init>()V

    iput-object v7, p0, Lcom/vkontakte/android/fragments/PhotosFragment;->allPhotosFragment:Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    .line 85
    const-string/jumbo v7, "album"

    invoke-virtual {v1, v7, v0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 86
    const-string/jumbo v7, "no_album_header"

    invoke-virtual {v1, v7, v8}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 87
    const-string/jumbo v10, "autoload"

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PhotosFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v7

    const-string/jumbo v11, "show_friends_feed"

    invoke-virtual {v7, v11}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_5

    move v7, v8

    :goto_1
    invoke-virtual {v1, v10, v7}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 88
    const-string/jumbo v7, "select"

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PhotosFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v10

    const-string/jumbo v11, "select"

    invoke-virtual {v10, v11}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v10

    invoke-virtual {v1, v7, v10}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 89
    iget-object v7, p0, Lcom/vkontakte/android/fragments/PhotosFragment;->allPhotosFragment:Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    invoke-virtual {v7, v1}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->setArguments(Landroid/os/Bundle;)V

    .line 90
    iget-object v7, p0, Lcom/vkontakte/android/fragments/PhotosFragment;->allPhotosFragment:Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    invoke-virtual {v4, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 91
    const v7, 0x7f0800cb

    invoke-virtual {p0, v7}, Lcom/vkontakte/android/fragments/PhotosFragment;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 93
    new-instance v1, Landroid/os/Bundle;

    .end local v1    # "args":Landroid/os/Bundle;
    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 94
    .restart local v1    # "args":Landroid/os/Bundle;
    new-instance v7, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;

    invoke-direct {v7}, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;-><init>()V

    iput-object v7, p0, Lcom/vkontakte/android/fragments/PhotosFragment;->photosFragment:Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;

    .line 95
    const-string/jumbo v7, "uid"

    iget v10, p0, Lcom/vkontakte/android/fragments/PhotosFragment;->uid:I

    invoke-virtual {v1, v7, v10}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 96
    const-string/jumbo v7, "no_title"

    invoke-virtual {v1, v7, v8}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 97
    const-string/jumbo v7, "need_system"

    invoke-virtual {v1, v7, v8}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 98
    const-string/jumbo v7, "select"

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PhotosFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v10

    const-string/jumbo v11, "select"

    invoke-virtual {v10, v11}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v10

    invoke-virtual {v1, v7, v10}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 99
    iget-object v7, p0, Lcom/vkontakte/android/fragments/PhotosFragment;->photosFragment:Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;

    invoke-virtual {v7, v1}, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;->setArguments(Landroid/os/Bundle;)V

    .line 100
    iget-object v7, p0, Lcom/vkontakte/android/fragments/PhotosFragment;->photosFragment:Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;

    invoke-virtual {v4, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 101
    const v7, 0x7f0800c7

    invoke-virtual {p0, v7}, Lcom/vkontakte/android/fragments/PhotosFragment;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 103
    iget v7, p0, Lcom/vkontakte/android/fragments/PhotosFragment;->uid:I

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v10

    invoke-virtual {v10}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v10

    if-eq v7, v10, :cond_1

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PhotosFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v7

    const-string/jumbo v10, "can_view_user_photos"

    invoke-virtual {v7, v10}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_a

    .line 104
    :cond_1
    iget v7, p0, Lcom/vkontakte/android/fragments/PhotosFragment;->uid:I

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v10

    invoke-virtual {v10}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v10

    if-eq v7, v10, :cond_2

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PhotosFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v7

    const-string/jumbo v10, "can_view_user_photos"

    invoke-virtual {v7, v10}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 105
    :cond_2
    new-instance v6, Lcom/vkontakte/android/api/PhotoAlbum;

    invoke-direct {v6}, Lcom/vkontakte/android/api/PhotoAlbum;-><init>()V

    .line 106
    .local v6, "userPhotos":Lcom/vkontakte/android/api/PhotoAlbum;
    iget v7, p0, Lcom/vkontakte/android/fragments/PhotosFragment;->uid:I

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v10

    invoke-virtual {v10}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v10

    if-ne v7, v10, :cond_6

    const v7, 0x7f080742

    invoke-virtual {p0, v7}, Lcom/vkontakte/android/fragments/PhotosFragment;->getString(I)Ljava/lang/String;

    move-result-object v7

    :goto_2
    iput-object v7, v6, Lcom/vkontakte/android/api/PhotoAlbum;->title:Ljava/lang/String;

    .line 107
    const/16 v7, -0x2328

    iput v7, v6, Lcom/vkontakte/android/api/PhotoAlbum;->id:I

    .line 108
    iget v7, p0, Lcom/vkontakte/android/fragments/PhotosFragment;->uid:I

    iput v7, v6, Lcom/vkontakte/android/api/PhotoAlbum;->oid:I

    .line 109
    new-instance v1, Landroid/os/Bundle;

    .end local v1    # "args":Landroid/os/Bundle;
    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 110
    .restart local v1    # "args":Landroid/os/Bundle;
    const-string/jumbo v7, "album"

    invoke-virtual {v1, v7, v6}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 111
    const-string/jumbo v7, "no_album_header"

    invoke-virtual {v1, v7, v8}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 112
    const-string/jumbo v7, "select"

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PhotosFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v10

    const-string/jumbo v11, "select"

    invoke-virtual {v10, v11}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v10

    invoke-virtual {v1, v7, v10}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 113
    iget v7, p0, Lcom/vkontakte/android/fragments/PhotosFragment;->uid:I

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v10

    invoke-virtual {v10}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v10

    if-ne v7, v10, :cond_7

    new-instance v7, Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;

    invoke-direct {v7}, Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;-><init>()V

    :goto_3
    iput-object v7, p0, Lcom/vkontakte/android/fragments/PhotosFragment;->userPhotosFragment:Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    .line 114
    iget-object v7, p0, Lcom/vkontakte/android/fragments/PhotosFragment;->userPhotosFragment:Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    invoke-virtual {v7, v1}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->setArguments(Landroid/os/Bundle;)V

    .line 115
    iget-object v7, p0, Lcom/vkontakte/android/fragments/PhotosFragment;->userPhotosFragment:Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    invoke-virtual {v4, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 116
    iget v7, p0, Lcom/vkontakte/android/fragments/PhotosFragment;->uid:I

    invoke-static {v7}, Lcom/vkontakte/android/auth/VKAccountManager;->isCurrentUser(I)Z

    move-result v7

    if-eqz v7, :cond_9

    .line 117
    invoke-static {}, Lcom/vkontakte/android/LongPollService;->getNumPhotosMarks()I

    move-result v7

    if-lez v7, :cond_8

    .line 118
    new-instance v3, Landroid/text/SpannableStringBuilder;

    invoke-virtual {p0, v13}, Lcom/vkontakte/android/fragments/PhotosFragment;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v3, v7}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 119
    .local v3, "ssb":Landroid/text/SpannableStringBuilder;
    const-string/jumbo v7, " "

    invoke-virtual {v3, v7}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 120
    new-instance v2, Landroid/text/SpannableString;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/vkontakte/android/LongPollService;->getNumPhotosMarks()I

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v8, ""

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v2, v7}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 121
    .local v2, "ss":Landroid/text/SpannableString;
    new-instance v7, Lcom/vkontakte/android/ui/BadgeSpan;

    invoke-direct {v7}, Lcom/vkontakte/android/ui/BadgeSpan;-><init>()V

    invoke-virtual {v2}, Landroid/text/SpannableString;->length()I

    move-result v8

    invoke-virtual {v2, v7, v9, v8, v9}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 122
    invoke-virtual {v3, v2}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 123
    invoke-virtual {v5, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 165
    .end local v2    # "ss":Landroid/text/SpannableString;
    .end local v3    # "ssb":Landroid/text/SpannableStringBuilder;
    .end local v6    # "userPhotos":Lcom/vkontakte/android/api/PhotoAlbum;
    :cond_3
    :goto_4
    invoke-virtual {p0, v4, v5}, Lcom/vkontakte/android/fragments/PhotosFragment;->setTabs(Ljava/util/List;Ljava/util/List;)V

    .line 166
    return-void

    .line 66
    .end local v0    # "allPhotos":Lcom/vkontakte/android/api/PhotoAlbum;
    .end local v1    # "args":Landroid/os/Bundle;
    .end local v4    # "tabs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/app/Fragment;>;"
    .end local v5    # "titles":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/CharSequence;>;"
    :cond_4
    const v7, 0x7f0804b0

    invoke-virtual {p0, v7}, Lcom/vkontakte/android/fragments/PhotosFragment;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0, v7}, Lcom/vkontakte/android/fragments/PhotosFragment;->setTitle(Ljava/lang/CharSequence;)V

    goto/16 :goto_0

    .restart local v0    # "allPhotos":Lcom/vkontakte/android/api/PhotoAlbum;
    .restart local v1    # "args":Landroid/os/Bundle;
    .restart local v4    # "tabs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/app/Fragment;>;"
    .restart local v5    # "titles":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/CharSequence;>;"
    :cond_5
    move v7, v9

    .line 87
    goto/16 :goto_1

    .line 106
    .restart local v6    # "userPhotos":Lcom/vkontakte/android/api/PhotoAlbum;
    :cond_6
    const v7, 0x7f080741

    new-array v10, v8, [Ljava/lang/Object;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PhotosFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v11

    const-string/jumbo v12, "user_name_ins"

    invoke-virtual {v11, v12}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    aput-object v11, v10, v9

    invoke-virtual {p0, v7, v10}, Lcom/vkontakte/android/fragments/PhotosFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    goto/16 :goto_2

    .line 113
    :cond_7
    new-instance v7, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    invoke-direct {v7}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;-><init>()V

    goto/16 :goto_3

    .line 125
    :cond_8
    invoke-virtual {p0, v13}, Lcom/vkontakte/android/fragments/PhotosFragment;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_4

    .line 128
    :cond_9
    const v7, 0x7f0804b2

    new-array v8, v8, [Ljava/lang/Object;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PhotosFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v10

    const-string/jumbo v11, "user_name_ins"

    invoke-virtual {v10, v11}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-virtual {p0, v7, v8}, Lcom/vkontakte/android/fragments/PhotosFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_4

    .line 131
    .end local v6    # "userPhotos":Lcom/vkontakte/android/api/PhotoAlbum;
    :cond_a
    iget v7, p0, Lcom/vkontakte/android/fragments/PhotosFragment;->uid:I

    if-lez v7, :cond_3

    .line 132
    new-instance v7, Lcom/vkontakte/android/api/photos/PhotosGetUserPhotos;

    iget v8, p0, Lcom/vkontakte/android/fragments/PhotosFragment;->uid:I

    invoke-direct {v7, v8, v9, v9}, Lcom/vkontakte/android/api/photos/PhotosGetUserPhotos;-><init>(III)V

    new-instance v8, Lcom/vkontakte/android/fragments/PhotosFragment$1;

    invoke-direct {v8, p0, v4, v5}, Lcom/vkontakte/android/fragments/PhotosFragment$1;-><init>(Lcom/vkontakte/android/fragments/PhotosFragment;Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    .line 133
    invoke-virtual {v7, v8}, Lcom/vkontakte/android/api/photos/PhotosGetUserPhotos;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v7

    .line 162
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PhotosFragment;->getActivity()Landroid/app/Activity;

    move-result-object v8

    invoke-virtual {v7, v8}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    goto :goto_4
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 10
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const v7, 0x7f0f0018

    const/16 v9, 0x8

    const/4 v6, -0x1

    const/4 v8, 0x0

    .line 185
    invoke-super {p0, p1, p2}, Lcom/vkontakte/android/fragments/VKTabbedFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 187
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/PhotosFragment;->isInContextOfAttachActivity()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 188
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PhotosFragment;->getToolbar()Landroid/support/v7/widget/Toolbar;

    move-result-object v5

    invoke-virtual {v5, v9}, Landroid/support/v7/widget/Toolbar;->setVisibility(I)V

    .line 189
    invoke-virtual {p1, v6}, Landroid/view/View;->setBackgroundColor(I)V

    .line 190
    iget-object v5, p0, Lcom/vkontakte/android/fragments/PhotosFragment;->allPhotosFragment:Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    invoke-virtual {v5}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->disableRefresh()V

    .line 191
    iget-object v5, p0, Lcom/vkontakte/android/fragments/PhotosFragment;->userPhotosFragment:Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    invoke-virtual {v5}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->disableRefresh()V

    .line 192
    iget-object v5, p0, Lcom/vkontakte/android/fragments/PhotosFragment;->photosFragment:Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;

    invoke-virtual {v5}, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;->disableRefresh()V

    .line 194
    const v5, 0x7f1001ad

    invoke-virtual {p1, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/support/design/widget/TabLayout;

    .line 196
    .local v3, "tabLayout":Landroid/support/design/widget/TabLayout;
    invoke-virtual {v3, v6}, Landroid/support/design/widget/TabLayout;->setBackgroundColor(I)V

    .line 197
    const-string/jumbo v5, "#B9CDE3"

    invoke-static {v5}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v5

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PhotosFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getColor(I)I

    move-result v6

    invoke-virtual {v3, v5, v6}, Landroid/support/design/widget/TabLayout;->setTabTextColors(II)V

    .line 198
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PhotosFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5, v7}, Landroid/content/res/Resources;->getColor(I)I

    move-result v5

    invoke-virtual {v3, v5}, Landroid/support/design/widget/TabLayout;->setSelectedTabIndicatorColor(I)V

    .line 204
    .end local v3    # "tabLayout":Landroid/support/design/widget/TabLayout;
    :cond_0
    iget v5, p0, Lcom/vkontakte/android/fragments/PhotosFragment;->uid:I

    invoke-static {v5}, Lcom/vkontakte/android/auth/VKAccountManager;->isCurrentUser(I)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 206
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PhotosFragment;->getTabView()Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/support/design/widget/TabLayout;

    .line 207
    .local v4, "tl":Landroid/support/design/widget/TabLayout;
    invoke-virtual {v4}, Landroid/support/design/widget/TabLayout;->getTabCount()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    invoke-virtual {v4, v5}, Landroid/support/design/widget/TabLayout;->getTabAt(I)Landroid/support/design/widget/TabLayout$Tab;

    move-result-object v2

    .line 208
    .local v2, "tab":Landroid/support/design/widget/TabLayout$Tab;
    invoke-virtual {v4}, Landroid/support/design/widget/TabLayout;->getContext()Landroid/content/Context;

    move-result-object v5

    const v6, 0x7f030085

    const/4 v7, 0x0

    invoke-static {v5, v6, v7}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 209
    .local v0, "customView":Landroid/widget/TextView;
    const v5, 0x1020014

    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setId(I)V

    .line 210
    invoke-virtual {v4}, Landroid/support/design/widget/TabLayout;->getContext()Landroid/content/Context;

    move-result-object v5

    const/4 v6, 0x1

    new-array v6, v6, [I

    aput v9, v6, v8

    invoke-virtual {v5, v6}, Landroid/content/Context;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    move-result-object v1

    .line 211
    .local v1, "ta":Landroid/content/res/TypedArray;
    invoke-virtual {v4}, Landroid/support/design/widget/TabLayout;->getContext()Landroid/content/Context;

    move-result-object v5

    const v6, 0x7f0b01d0

    invoke-virtual {v1, v8, v6}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v6

    invoke-virtual {v0, v5, v6}, Landroid/widget/TextView;->setTextAppearance(Landroid/content/Context;I)V

    .line 212
    sget v5, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v6, 0x15

    if-ge v5, v6, :cond_1

    .line 213
    sget-object v5, Lcom/vkontakte/android/ui/Font;->Medium:Lcom/vkontakte/android/ui/Font;

    iget-object v5, v5, Lcom/vkontakte/android/ui/Font;->typeface:Landroid/graphics/Typeface;

    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 215
    :cond_1
    invoke-virtual {v4}, Landroid/support/design/widget/TabLayout;->getTabTextColors()Landroid/content/res/ColorStateList;

    move-result-object v5

    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 216
    invoke-virtual {v1}, Landroid/content/res/TypedArray;->recycle()V

    .line 217
    invoke-virtual {v0, v8}, Landroid/widget/TextView;->setAllCaps(Z)V

    .line 218
    invoke-virtual {v2, v0}, Landroid/support/design/widget/TabLayout$Tab;->setCustomView(Landroid/view/View;)Landroid/support/design/widget/TabLayout$Tab;

    .line 220
    .end local v0    # "customView":Landroid/widget/TextView;
    .end local v1    # "ta":Landroid/content/res/TypedArray;
    .end local v2    # "tab":Landroid/support/design/widget/TabLayout$Tab;
    .end local v4    # "tl":Landroid/support/design/widget/TabLayout;
    :cond_2
    return-void
.end method

.method public provideToolbar(Landroid/content/Context;)Landroid/view/ViewGroup;
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 224
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PhotosFragment;->getToolbar()Landroid/support/v7/widget/Toolbar;

    move-result-object v0

    return-object v0
.end method
