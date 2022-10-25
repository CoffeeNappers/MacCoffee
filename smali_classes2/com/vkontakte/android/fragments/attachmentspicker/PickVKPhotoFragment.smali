.class public Lcom/vkontakte/android/fragments/attachmentspicker/PickVKPhotoFragment;
.super Lme/grishka/appkit/fragments/ContainerFragment;
.source "PickVKPhotoFragment.java"

# interfaces
.implements Lcom/vk/attachpicker/SupportExternalToolbarContainer;


# static fields
.field private static final INNER_FRAGMENT_TAG:Ljava/lang/String; = "INNER_PHOTO_FRAGMENT"


# instance fields
.field private albumsFragment:Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;

.field private allPhotosFragment:Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

.field private currentPos:I

.field private needRecreateInnerFragment:Z

.field private spinnerItemsData:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/CharSequence;",
            ">;"
        }
    .end annotation
.end field

.field private userPhotosFragment:Lcom/vkontakte/android/fragments/photos/PhotoListFragment;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 34
    invoke-direct {p0}, Lme/grishka/appkit/fragments/ContainerFragment;-><init>()V

    .line 43
    const/4 v0, -0x1

    iput v0, p0, Lcom/vkontakte/android/fragments/attachmentspicker/PickVKPhotoFragment;->currentPos:I

    .line 45
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/attachmentspicker/PickVKPhotoFragment;->needRecreateInnerFragment:Z

    return-void
.end method


# virtual methods
.method public getAlbumsFragment()Landroid/app/Fragment;
    .locals 4

    .prologue
    const/4 v3, 0x1

    .line 207
    iget-object v1, p0, Lcom/vkontakte/android/fragments/attachmentspicker/PickVKPhotoFragment;->albumsFragment:Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;

    if-nez v1, :cond_0

    .line 208
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 209
    .local v0, "args":Landroid/os/Bundle;
    new-instance v1, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;

    invoke-direct {v1}, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;-><init>()V

    iput-object v1, p0, Lcom/vkontakte/android/fragments/attachmentspicker/PickVKPhotoFragment;->albumsFragment:Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;

    .line 210
    const-string/jumbo v1, "uid"

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 211
    const-string/jumbo v1, "no_title"

    invoke-virtual {v0, v1, v3}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 212
    const-string/jumbo v1, "need_system"

    invoke-virtual {v0, v1, v3}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 214
    const-string/jumbo v1, "select"

    invoke-virtual {v0, v1, v3}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 215
    const-string/jumbo v1, "__is_tab"

    invoke-virtual {v0, v1, v3}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 216
    iget-object v1, p0, Lcom/vkontakte/android/fragments/attachmentspicker/PickVKPhotoFragment;->albumsFragment:Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;

    invoke-virtual {v1, v0}, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;->setArguments(Landroid/os/Bundle;)V

    .line 217
    iget-object v1, p0, Lcom/vkontakte/android/fragments/attachmentspicker/PickVKPhotoFragment;->albumsFragment:Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;->disableRefresh()V

    .line 218
    iget-object v1, p0, Lcom/vkontakte/android/fragments/attachmentspicker/PickVKPhotoFragment;->albumsFragment:Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;->loadData()V

    .line 220
    .end local v0    # "args":Landroid/os/Bundle;
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/fragments/attachmentspicker/PickVKPhotoFragment;->albumsFragment:Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;

    return-object v1
.end method

.method public getAllPhotosFragment()Lcom/vkontakte/android/fragments/photos/PhotoListFragment;
    .locals 4

    .prologue
    const/4 v3, 0x1

    .line 187
    iget-object v2, p0, Lcom/vkontakte/android/fragments/attachmentspicker/PickVKPhotoFragment;->allPhotosFragment:Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    if-nez v2, :cond_0

    .line 188
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 189
    .local v1, "args":Landroid/os/Bundle;
    new-instance v0, Lcom/vkontakte/android/api/PhotoAlbum;

    invoke-direct {v0}, Lcom/vkontakte/android/api/PhotoAlbum;-><init>()V

    .line 190
    .local v0, "allPhotos":Lcom/vkontakte/android/api/PhotoAlbum;
    const v2, 0x7f0800ca

    invoke-virtual {p0, v2}, Lcom/vkontakte/android/fragments/attachmentspicker/PickVKPhotoFragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lcom/vkontakte/android/api/PhotoAlbum;->title:Ljava/lang/String;

    .line 191
    const/16 v2, -0x232a

    iput v2, v0, Lcom/vkontakte/android/api/PhotoAlbum;->id:I

    .line 192
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v2

    iput v2, v0, Lcom/vkontakte/android/api/PhotoAlbum;->oid:I

    .line 193
    new-instance v2, Lcom/vkontakte/android/fragments/photos/YearSectionedPhotoListFragment;

    invoke-direct {v2}, Lcom/vkontakte/android/fragments/photos/YearSectionedPhotoListFragment;-><init>()V

    iput-object v2, p0, Lcom/vkontakte/android/fragments/attachmentspicker/PickVKPhotoFragment;->allPhotosFragment:Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    .line 194
    const-string/jumbo v2, "album"

    invoke-virtual {v1, v2, v0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 195
    const-string/jumbo v2, "no_album_header"

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 196
    const-string/jumbo v2, "select"

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 197
    const-string/jumbo v2, "autoload"

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 198
    const-string/jumbo v2, "__is_tab"

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 199
    iget-object v2, p0, Lcom/vkontakte/android/fragments/attachmentspicker/PickVKPhotoFragment;->allPhotosFragment:Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    invoke-virtual {v2, v1}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->setArguments(Landroid/os/Bundle;)V

    .line 200
    iget-object v2, p0, Lcom/vkontakte/android/fragments/attachmentspicker/PickVKPhotoFragment;->allPhotosFragment:Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    invoke-virtual {v2}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->disableRefresh()V

    .line 203
    .end local v0    # "allPhotos":Lcom/vkontakte/android/api/PhotoAlbum;
    .end local v1    # "args":Landroid/os/Bundle;
    :cond_0
    iget-object v2, p0, Lcom/vkontakte/android/fragments/attachmentspicker/PickVKPhotoFragment;->allPhotosFragment:Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    return-object v2
.end method

.method public getUserPhotosFragment()Lcom/vkontakte/android/fragments/photos/PhotoListFragment;
    .locals 4

    .prologue
    const/4 v3, 0x1

    .line 224
    iget-object v2, p0, Lcom/vkontakte/android/fragments/attachmentspicker/PickVKPhotoFragment;->userPhotosFragment:Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    if-nez v2, :cond_0

    .line 225
    new-instance v1, Lcom/vkontakte/android/api/PhotoAlbum;

    invoke-direct {v1}, Lcom/vkontakte/android/api/PhotoAlbum;-><init>()V

    .line 226
    .local v1, "userPhotos":Lcom/vkontakte/android/api/PhotoAlbum;
    const v2, 0x7f080742

    invoke-virtual {p0, v2}, Lcom/vkontakte/android/fragments/attachmentspicker/PickVKPhotoFragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/vkontakte/android/api/PhotoAlbum;->title:Ljava/lang/String;

    .line 227
    const/16 v2, -0x2328

    iput v2, v1, Lcom/vkontakte/android/api/PhotoAlbum;->id:I

    .line 228
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v2

    iput v2, v1, Lcom/vkontakte/android/api/PhotoAlbum;->oid:I

    .line 229
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 230
    .local v0, "args":Landroid/os/Bundle;
    const-string/jumbo v2, "album"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 231
    const-string/jumbo v2, "no_album_header"

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 232
    const-string/jumbo v2, "select"

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 233
    const-string/jumbo v2, "__is_tab"

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 234
    new-instance v2, Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;

    invoke-direct {v2}, Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;-><init>()V

    iput-object v2, p0, Lcom/vkontakte/android/fragments/attachmentspicker/PickVKPhotoFragment;->userPhotosFragment:Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    .line 235
    iget-object v2, p0, Lcom/vkontakte/android/fragments/attachmentspicker/PickVKPhotoFragment;->userPhotosFragment:Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    invoke-virtual {v2, v0}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->setArguments(Landroid/os/Bundle;)V

    .line 236
    iget-object v2, p0, Lcom/vkontakte/android/fragments/attachmentspicker/PickVKPhotoFragment;->userPhotosFragment:Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    invoke-virtual {v2}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->disableRefresh()V

    .line 237
    iget-object v2, p0, Lcom/vkontakte/android/fragments/attachmentspicker/PickVKPhotoFragment;->userPhotosFragment:Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    invoke-virtual {v2}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->loadData()V

    .line 239
    .end local v0    # "args":Landroid/os/Bundle;
    .end local v1    # "userPhotos":Lcom/vkontakte/android/api/PhotoAlbum;
    :cond_0
    iget-object v2, p0, Lcom/vkontakte/android/fragments/attachmentspicker/PickVKPhotoFragment;->userPhotosFragment:Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    return-object v2
.end method

.method public onAttach(Landroid/app/Activity;)V
    .locals 2
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 51
    const-string/jumbo v0, "PickVKPhotoFragment"

    const-string/jumbo v1, "onAttach"

    invoke-static {v0, v1}, Lcom/vkontakte/android/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 52
    invoke-super {p0, p1}, Lme/grishka/appkit/fragments/ContainerFragment;->onAttach(Landroid/app/Activity;)V

    .line 54
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/attachmentspicker/PickVKPhotoFragment;->spinnerItemsData:Ljava/util/ArrayList;

    .line 56
    iget-object v0, p0, Lcom/vkontakte/android/fragments/attachmentspicker/PickVKPhotoFragment;->spinnerItemsData:Ljava/util/ArrayList;

    const v1, 0x7f0800cb

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/fragments/attachmentspicker/PickVKPhotoFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 57
    iget-object v0, p0, Lcom/vkontakte/android/fragments/attachmentspicker/PickVKPhotoFragment;->spinnerItemsData:Ljava/util/ArrayList;

    const v1, 0x7f0800c7

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/fragments/attachmentspicker/PickVKPhotoFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 58
    iget-object v0, p0, Lcom/vkontakte/android/fragments/attachmentspicker/PickVKPhotoFragment;->spinnerItemsData:Ljava/util/ArrayList;

    const v1, 0x7f0804b1

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/fragments/attachmentspicker/PickVKPhotoFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 60
    const v0, 0x7f0301ff

    iput v0, p0, Lcom/vkontakte/android/fragments/attachmentspicker/PickVKPhotoFragment;->spinnerViewResourceId:I

    .line 61
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 3
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 147
    const-string/jumbo v1, "PickVKPhotoFragment"

    const-string/jumbo v2, "onCreateView"

    invoke-static {v1, v2}, Lcom/vkontakte/android/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 148
    const v1, 0x7f03002f

    const/4 v2, 0x0

    invoke-virtual {p1, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 149
    .local v0, "content":Landroid/view/View;
    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 151
    return-object v0
.end method

.method public onDestroyView()V
    .locals 3

    .prologue
    .line 131
    invoke-super {p0}, Lme/grishka/appkit/fragments/ContainerFragment;->onDestroyView()V

    .line 135
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/attachmentspicker/PickVKPhotoFragment;->getInnerFragmentManager()Landroid/app/FragmentManager;

    move-result-object v1

    const-string/jumbo v2, "INNER_PHOTO_FRAGMENT"

    invoke-virtual {v1, v2}, Landroid/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/app/Fragment;

    move-result-object v0

    .line 137
    .local v0, "f":Landroid/app/Fragment;
    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/attachmentspicker/PickVKPhotoFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->isFinishing()Z

    move-result v1

    if-nez v1, :cond_0

    .line 138
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/attachmentspicker/PickVKPhotoFragment;->getInnerFragmentManager()Landroid/app/FragmentManager;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/app/FragmentTransaction;->remove(Landroid/app/Fragment;)Landroid/app/FragmentTransaction;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/FragmentTransaction;->commitAllowingStateLoss()I

    .line 141
    :cond_0
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/vkontakte/android/fragments/attachmentspicker/PickVKPhotoFragment;->needRecreateInnerFragment:Z

    .line 143
    return-void
.end method

.method protected onSpinnerItemSelected(I)Z
    .locals 6
    .param p1, "pos"    # I

    .prologue
    const/4 v5, 0x1

    .line 97
    iget-boolean v3, p0, Lcom/vkontakte/android/fragments/attachmentspicker/PickVKPhotoFragment;->needRecreateInnerFragment:Z

    if-nez v3, :cond_0

    iget v3, p0, Lcom/vkontakte/android/fragments/attachmentspicker/PickVKPhotoFragment;->currentPos:I

    if-ne p1, v3, :cond_0

    .line 125
    :goto_0
    return v5

    .line 100
    :cond_0
    const/4 v0, 0x0

    .line 101
    .local v0, "f":Landroid/app/Fragment;
    packed-switch p1, :pswitch_data_0

    .line 113
    :goto_1
    if-eqz v0, :cond_1

    .line 114
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/attachmentspicker/PickVKPhotoFragment;->getInnerFragmentManager()Landroid/app/FragmentManager;

    move-result-object v1

    .line 115
    .local v1, "fm":Landroid/app/FragmentManager;
    invoke-virtual {v1}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object v2

    .line 117
    .local v2, "fragmentTransaction":Landroid/app/FragmentTransaction;
    const v3, 0x7f1001b1

    const-string/jumbo v4, "INNER_PHOTO_FRAGMENT"

    invoke-virtual {v2, v3, v0, v4}, Landroid/app/FragmentTransaction;->replace(ILandroid/app/Fragment;Ljava/lang/String;)Landroid/app/FragmentTransaction;

    .line 118
    invoke-virtual {v2}, Landroid/app/FragmentTransaction;->commit()I

    .line 121
    .end local v1    # "fm":Landroid/app/FragmentManager;
    .end local v2    # "fragmentTransaction":Landroid/app/FragmentTransaction;
    :cond_1
    iput p1, p0, Lcom/vkontakte/android/fragments/attachmentspicker/PickVKPhotoFragment;->currentPos:I

    .line 123
    const/4 v3, 0x0

    iput-boolean v3, p0, Lcom/vkontakte/android/fragments/attachmentspicker/PickVKPhotoFragment;->needRecreateInnerFragment:Z

    goto :goto_0

    .line 103
    :pswitch_0
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/attachmentspicker/PickVKPhotoFragment;->getAllPhotosFragment()Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    move-result-object v0

    .line 104
    goto :goto_1

    .line 106
    :pswitch_1
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/attachmentspicker/PickVKPhotoFragment;->getAlbumsFragment()Landroid/app/Fragment;

    move-result-object v0

    .line 107
    goto :goto_1

    .line 109
    :pswitch_2
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/attachmentspicker/PickVKPhotoFragment;->getUserPhotosFragment()Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    move-result-object v0

    goto :goto_1

    .line 101
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 168
    invoke-super {p0, p1, p2}, Lme/grishka/appkit/fragments/ContainerFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 170
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/attachmentspicker/PickVKPhotoFragment;->getToolbar()Landroid/support/v7/widget/Toolbar;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/Toolbar;->setVisibility(I)V

    .line 172
    iget-object v0, p0, Lcom/vkontakte/android/fragments/attachmentspicker/PickVKPhotoFragment;->spinnerItemsData:Ljava/util/ArrayList;

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/attachmentspicker/PickVKPhotoFragment;->setSpinnerItems(Ljava/util/List;)V

    .line 173
    iget v0, p0, Lcom/vkontakte/android/fragments/attachmentspicker/PickVKPhotoFragment;->currentPos:I

    if-ltz v0, :cond_0

    .line 174
    iget v0, p0, Lcom/vkontakte/android/fragments/attachmentspicker/PickVKPhotoFragment;->currentPos:I

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/attachmentspicker/PickVKPhotoFragment;->setSelectedNavigationItem(I)V

    .line 179
    :goto_0
    return-void

    .line 177
    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/attachmentspicker/PickVKPhotoFragment;->onSpinnerItemSelected(I)Z

    goto :goto_0
.end method

.method public provideToolbar(Landroid/content/Context;)Landroid/view/ViewGroup;
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 183
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/attachmentspicker/PickVKPhotoFragment;->getToolbar()Landroid/support/v7/widget/Toolbar;

    move-result-object v0

    return-object v0
.end method
