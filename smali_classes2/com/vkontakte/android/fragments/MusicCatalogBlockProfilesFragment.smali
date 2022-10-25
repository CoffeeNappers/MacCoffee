.class public Lcom/vkontakte/android/fragments/MusicCatalogBlockProfilesFragment;
.super Lcom/vkontakte/android/fragments/AbsUserListFragment;
.source "MusicCatalogBlockProfilesFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/fragments/MusicCatalogBlockProfilesFragment$Builder;
    }
.end annotation


# static fields
.field private static final ARG_CATALOG_BLOCK_ID:Ljava/lang/String; = "catalogBlockId"

.field private static final ARG_TITLE:Ljava/lang/String; = "title"


# instance fields
.field private smallPlayerHelper:Lcom/vk/music/utils/SmallPlayerHelper;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 16
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/AbsUserListFragment;-><init>()V

    .line 21
    new-instance v0, Lcom/vk/music/utils/SmallPlayerHelper;

    invoke-direct {v0}, Lcom/vk/music/utils/SmallPlayerHelper;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/MusicCatalogBlockProfilesFragment;->smallPlayerHelper:Lcom/vk/music/utils/SmallPlayerHelper;

    return-void
.end method


# virtual methods
.method protected doLoadData(II)V
    .locals 3
    .param p1, "offset"    # I
    .param p2, "count"    # I

    .prologue
    .line 61
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/MusicCatalogBlockProfilesFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    const-string/jumbo v2, "catalogBlockId"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    .line 62
    .local v0, "blockId":I
    new-instance v1, Lcom/vkontakte/android/api/audio/AudioGetCatalogBlockById$Builder;

    invoke-direct {v1, v0, p1, p2}, Lcom/vkontakte/android/api/audio/AudioGetCatalogBlockById$Builder;-><init>(III)V

    invoke-virtual {v1}, Lcom/vkontakte/android/api/audio/AudioGetCatalogBlockById$Builder;->buildProfiles()Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    new-instance v2, Lcom/vkontakte/android/api/SimpleListCallback;

    invoke-direct {v2, p0}, Lcom/vkontakte/android/api/SimpleListCallback;-><init>(Lme/grishka/appkit/fragments/BaseRecyclerFragment;)V

    .line 63
    invoke-virtual {v1, v2}, Lcom/vkontakte/android/api/VKAPIRequest;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    .line 64
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/MusicCatalogBlockProfilesFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/fragments/MusicCatalogBlockProfilesFragment;->currentRequest:Lme/grishka/appkit/api/APIRequest;

    .line 65
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 2
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 39
    iget-object v0, p0, Lcom/vkontakte/android/fragments/MusicCatalogBlockProfilesFragment;->smallPlayerHelper:Lcom/vk/music/utils/SmallPlayerHelper;

    invoke-super {p0, p1, p2, p3}, Lcom/vkontakte/android/fragments/AbsUserListFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/music/utils/SmallPlayerHelper;->onCreateView(Landroid/view/View;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public onDestroyView()V
    .locals 1

    .prologue
    .line 44
    iget-object v0, p0, Lcom/vkontakte/android/fragments/MusicCatalogBlockProfilesFragment;->smallPlayerHelper:Lcom/vk/music/utils/SmallPlayerHelper;

    invoke-virtual {v0}, Lcom/vk/music/utils/SmallPlayerHelper;->onDestroyView()V

    .line 45
    invoke-super {p0}, Lcom/vkontakte/android/fragments/AbsUserListFragment;->onDestroyView()V

    .line 46
    return-void
.end method

.method public onItemClick(Lcom/vkontakte/android/UserProfile;)V
    .locals 2
    .param p1, "profile"    # Lcom/vkontakte/android/UserProfile;

    .prologue
    .line 56
    new-instance v0, Lcom/vk/music/fragment/MusicFragment$Builder;

    invoke-direct {v0}, Lcom/vk/music/fragment/MusicFragment$Builder;-><init>()V

    iget v1, p1, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-virtual {v0, v1}, Lcom/vk/music/fragment/MusicFragment$Builder;->ownerId(I)Lcom/vk/music/fragment/MusicFragment$Builder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/MusicCatalogBlockProfilesFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/music/fragment/MusicFragment$Builder;->go(Landroid/content/Context;)Z

    .line 57
    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 50
    invoke-super {p0, p1, p2}, Lcom/vkontakte/android/fragments/AbsUserListFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 51
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/MusicCatalogBlockProfilesFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "title"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/MusicCatalogBlockProfilesFragment;->setTitle(Ljava/lang/CharSequence;)V

    .line 52
    return-void
.end method
