.class public final Lcom/vk/music/fragment/MusicFragment;
.super Lcom/vk/music/fragment/DelegatingFragment;
.source "MusicFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/music/fragment/MusicFragment$Builder;
    }
.end annotation


# static fields
.field private static final ARG_CATALOG_BLOCK:Ljava/lang/String; = "catalogBlock"

.field private static final ARG_OWNER_ID:Ljava/lang/String; = "ownerId"

.field private static final ARG_OWNER_IMAGE:Ljava/lang/String; = "ownerImage"

.field private static final ARG_OWNER_NAME_FULL:Ljava/lang/String; = "ownerNameFull"

.field private static final ARG_OWNER_NAME_GEN:Ljava/lang/String; = "ownerNameGen"

.field private static final ARG_SECTION:Ljava/lang/String; = "section"

.field private static final SECTION_RECOMMENDED:I = 0x1


# instance fields
.field private smallPlayerHelper:Lcom/vk/music/utils/SmallPlayerHelper;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 23
    invoke-direct {p0}, Lcom/vk/music/fragment/DelegatingFragment;-><init>()V

    .line 34
    new-instance v0, Lcom/vk/music/utils/SmallPlayerHelper;

    invoke-direct {v0}, Lcom/vk/music/utils/SmallPlayerHelper;-><init>()V

    iput-object v0, p0, Lcom/vk/music/fragment/MusicFragment;->smallPlayerHelper:Lcom/vk/music/utils/SmallPlayerHelper;

    return-void
.end method


# virtual methods
.method protected createDelegate()Lcom/vk/music/fragment/FragmentDelegate;
    .locals 10
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 86
    invoke-virtual {p0}, Lcom/vk/music/fragment/MusicFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v4

    const-string/jumbo v5, "catalogBlock"

    invoke-virtual {v4, v5}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 87
    invoke-virtual {p0}, Lcom/vk/music/fragment/MusicFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v4

    const-string/jumbo v5, "catalogBlock"

    invoke-virtual {v4, v5}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Lcom/vk/music/dto/Section;

    .line 88
    .local v1, "section":Lcom/vk/music/dto/Section;
    new-instance v4, Lcom/vk/music/fragment/FragmentDelegateActiveModel;

    invoke-static {p0}, Lcom/vk/music/fragment/MusicFragment$$Lambda$1;->lambdaFactory$(Lcom/vk/music/fragment/MusicFragment;)Lcom/vk/music/fragment/FragmentDelegateActiveModel$ViewCreator;

    move-result-object v5

    new-array v2, v2, [Lcom/vk/music/model/ActiveModel;

    new-instance v6, Lcom/vk/music/model/MusicModelCatalogBlock;

    invoke-direct {v6, v1}, Lcom/vk/music/model/MusicModelCatalogBlock;-><init>(Lcom/vk/music/dto/Section;)V

    aput-object v6, v2, v3

    invoke-direct {v4, v5, v2}, Lcom/vk/music/fragment/FragmentDelegateActiveModel;-><init>(Lcom/vk/music/fragment/FragmentDelegateActiveModel$ViewCreator;[Lcom/vk/music/model/ActiveModel;)V

    move-object v2, v4

    .line 105
    .end local v1    # "section":Lcom/vk/music/dto/Section;
    :goto_0
    return-object v2

    .line 93
    :cond_0
    invoke-virtual {p0}, Lcom/vk/music/fragment/MusicFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v4

    const-string/jumbo v5, "ownerId"

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v6

    invoke-virtual {v6}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v6

    invoke-virtual {v4, v5, v6}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    .line 94
    .local v0, "ownerId":I
    invoke-static {v0}, Lcom/vkontakte/android/auth/VKAccountManager;->isCurrentUser(I)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 95
    new-instance v4, Lcom/vk/music/fragment/FragmentDelegateActiveModel;

    invoke-static {p0}, Lcom/vk/music/fragment/MusicFragment$$Lambda$2;->lambdaFactory$(Lcom/vk/music/fragment/MusicFragment;)Lcom/vk/music/fragment/FragmentDelegateActiveModel$ViewCreator;

    move-result-object v5

    new-array v6, v2, [Lcom/vk/music/model/ActiveModel;

    new-instance v7, Lcom/vk/music/model/TabbedMusicModel;

    .line 97
    invoke-virtual {p0}, Lcom/vk/music/fragment/MusicFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v8

    const-string/jumbo v9, "section"

    invoke-virtual {v8, v9, v3}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v8

    if-ne v8, v2, :cond_1

    :goto_1
    invoke-direct {v7, v2}, Lcom/vk/music/model/TabbedMusicModel;-><init>(Z)V

    aput-object v7, v6, v3

    invoke-direct {v4, v5, v6}, Lcom/vk/music/fragment/FragmentDelegateActiveModel;-><init>(Lcom/vk/music/fragment/FragmentDelegateActiveModel$ViewCreator;[Lcom/vk/music/model/ActiveModel;)V

    move-object v2, v4

    goto :goto_0

    :cond_1
    move v2, v3

    goto :goto_1

    .line 100
    :cond_2
    new-instance v4, Lcom/vk/music/fragment/FragmentDelegateActiveModel;

    invoke-static {p0}, Lcom/vk/music/fragment/MusicFragment$$Lambda$3;->lambdaFactory$(Lcom/vk/music/fragment/MusicFragment;)Lcom/vk/music/fragment/FragmentDelegateActiveModel$ViewCreator;

    move-result-object v5

    new-array v2, v2, [Lcom/vk/music/model/ActiveModel;

    new-instance v6, Lcom/vk/music/model/MusicModelImpl;

    .line 104
    invoke-virtual {p0}, Lcom/vk/music/fragment/MusicFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v7

    const-string/jumbo v8, "ownerNameFull"

    invoke-virtual {v7, v8}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 105
    invoke-virtual {p0}, Lcom/vk/music/fragment/MusicFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v8

    const-string/jumbo v9, "ownerImage"

    invoke-virtual {v8, v9}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v6, v0, v7, v8}, Lcom/vk/music/model/MusicModelImpl;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    aput-object v6, v2, v3

    invoke-direct {v4, v5, v2}, Lcom/vk/music/fragment/FragmentDelegateActiveModel;-><init>(Lcom/vk/music/fragment/FragmentDelegateActiveModel$ViewCreator;[Lcom/vk/music/model/ActiveModel;)V

    move-object v2, v4

    goto :goto_0
.end method

.method synthetic lambda$createDelegate$0(Lcom/vk/music/fragment/FragmentDelegateActiveModel;)Landroid/view/View;
    .locals 3
    .param p1, "fd"    # Lcom/vk/music/fragment/FragmentDelegateActiveModel;

    .prologue
    .line 89
    new-instance v1, Lcom/vk/music/view/ToolbarMusicContainer;

    invoke-virtual {p0}, Lcom/vk/music/fragment/MusicFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/vk/music/fragment/FragmentDelegateActiveModel;->model(I)Lcom/vk/music/model/ActiveModel;

    move-result-object v0

    check-cast v0, Lcom/vk/music/model/MusicModel;

    invoke-direct {v1, v2, v0}, Lcom/vk/music/view/ToolbarMusicContainer;-><init>(Landroid/content/Context;Lcom/vk/music/model/MusicModel;)V

    return-object v1
.end method

.method synthetic lambda$createDelegate$1(Lcom/vk/music/fragment/FragmentDelegateActiveModel;)Landroid/view/View;
    .locals 3
    .param p1, "fd"    # Lcom/vk/music/fragment/FragmentDelegateActiveModel;

    .prologue
    .line 96
    new-instance v1, Lcom/vk/music/view/TabbedMusicContainer;

    invoke-virtual {p0}, Lcom/vk/music/fragment/MusicFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/vk/music/fragment/FragmentDelegateActiveModel;->model(I)Lcom/vk/music/model/ActiveModel;

    move-result-object v0

    check-cast v0, Lcom/vk/music/model/TabbedMusicModel;

    invoke-direct {v1, v2, v0}, Lcom/vk/music/view/TabbedMusicContainer;-><init>(Landroid/content/Context;Lcom/vk/music/model/TabbedMusicModel;)V

    return-object v1
.end method

.method synthetic lambda$createDelegate$2(Lcom/vk/music/fragment/FragmentDelegateActiveModel;)Landroid/view/View;
    .locals 3
    .param p1, "fd"    # Lcom/vk/music/fragment/FragmentDelegateActiveModel;

    .prologue
    .line 101
    new-instance v1, Lcom/vk/music/view/ToolbarMusicContainer;

    invoke-virtual {p0}, Lcom/vk/music/fragment/MusicFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/vk/music/fragment/FragmentDelegateActiveModel;->model(I)Lcom/vk/music/model/ActiveModel;

    move-result-object v0

    check-cast v0, Lcom/vk/music/model/MusicModel;

    invoke-direct {v1, v2, v0}, Lcom/vk/music/view/ToolbarMusicContainer;-><init>(Landroid/content/Context;Lcom/vk/music/model/MusicModel;)V

    return-object v1
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 5
    .param p1, "b"    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 75
    invoke-super {p0, p1}, Lcom/vk/music/fragment/DelegatingFragment;->onCreate(Landroid/os/Bundle;)V

    .line 76
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vkontakte/android/auth/VKAccount;->isMusicIntroWasShowed()Z

    move-result v2

    if-nez v2, :cond_1

    const/4 v0, 0x1

    .line 77
    .local v0, "needShowMusicPromo":Z
    :goto_0
    invoke-virtual {p0}, Lcom/vk/music/fragment/MusicFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v2

    const-string/jumbo v3, "ownerId"

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v4

    invoke-virtual {v4}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v4

    invoke-virtual {v2, v3, v4}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v1

    .line 78
    .local v1, "ownerId":I
    if-eqz v0, :cond_0

    invoke-static {v1}, Lcom/vkontakte/android/auth/VKAccountManager;->isCurrentUser(I)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 79
    new-instance v2, Lcom/vk/music/fragment/MusicPromoFragment$Builder;

    invoke-direct {v2}, Lcom/vk/music/fragment/MusicPromoFragment$Builder;-><init>()V

    invoke-virtual {p0}, Lcom/vk/music/fragment/MusicFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/vk/music/fragment/MusicPromoFragment$Builder;->go(Landroid/content/Context;)Z

    .line 81
    :cond_0
    return-void

    .line 76
    .end local v0    # "needShowMusicPromo":Z
    .end local v1    # "ownerId":I
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
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
    .line 115
    iget-object v0, p0, Lcom/vk/music/fragment/MusicFragment;->smallPlayerHelper:Lcom/vk/music/utils/SmallPlayerHelper;

    invoke-super {p0, p1, p2, p3}, Lcom/vk/music/fragment/DelegatingFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/music/utils/SmallPlayerHelper;->onCreateView(Landroid/view/View;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public onDestroyView()V
    .locals 1

    .prologue
    .line 120
    iget-object v0, p0, Lcom/vk/music/fragment/MusicFragment;->smallPlayerHelper:Lcom/vk/music/utils/SmallPlayerHelper;

    invoke-virtual {v0}, Lcom/vk/music/utils/SmallPlayerHelper;->onDestroyView()V

    .line 121
    invoke-super {p0}, Lcom/vk/music/fragment/DelegatingFragment;->onDestroyView()V

    .line 122
    return-void
.end method
