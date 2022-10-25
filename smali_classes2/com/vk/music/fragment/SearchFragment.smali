.class public final Lcom/vk/music/fragment/SearchFragment;
.super Lcom/vk/music/fragment/DelegatingFragment;
.source "SearchFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/music/fragment/SearchFragment$Builder;
    }
.end annotation


# static fields
.field private static final ARG_OPEN_ARTIST_PAGE:Ljava/lang/String; = "SearchFragment.arg.openArtistsPage"

.field private static final ARG_OPEN_RESULTS:Ljava/lang/String; = "SearchFragment.arg.openResults"

.field private static final ARG_QUERY:Ljava/lang/String; = "SearchFragment.arg.query"


# instance fields
.field private smallPlayerHelper:Lcom/vk/music/utils/SmallPlayerHelper;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 19
    invoke-direct {p0}, Lcom/vk/music/fragment/DelegatingFragment;-><init>()V

    .line 47
    new-instance v0, Lcom/vk/music/utils/SmallPlayerHelper;

    invoke-direct {v0}, Lcom/vk/music/utils/SmallPlayerHelper;-><init>()V

    iput-object v0, p0, Lcom/vk/music/fragment/SearchFragment;->smallPlayerHelper:Lcom/vk/music/utils/SmallPlayerHelper;

    return-void
.end method


# virtual methods
.method protected createDelegate()Lcom/vk/music/fragment/FragmentDelegate;
    .locals 9
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 64
    new-instance v0, Lcom/vk/music/fragment/FragmentDelegateActiveModel;

    invoke-static {p0}, Lcom/vk/music/fragment/SearchFragment$$Lambda$1;->lambdaFactory$(Lcom/vk/music/fragment/SearchFragment;)Lcom/vk/music/fragment/FragmentDelegateActiveModel$ViewCreator;

    move-result-object v1

    const/4 v2, 0x1

    new-array v2, v2, [Lcom/vk/music/model/ActiveModel;

    const/4 v3, 0x0

    new-instance v4, Lcom/vk/music/model/SearchModel;

    .line 67
    invoke-virtual {p0}, Lcom/vk/music/fragment/SearchFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v5

    const-string/jumbo v6, "SearchFragment.arg.query"

    invoke-virtual {v5, v6}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 68
    invoke-virtual {p0}, Lcom/vk/music/fragment/SearchFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v6

    const-string/jumbo v7, "SearchFragment.arg.openResults"

    invoke-virtual {v6, v7}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v6

    .line 69
    invoke-virtual {p0}, Lcom/vk/music/fragment/SearchFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v7

    const-string/jumbo v8, "SearchFragment.arg.openArtistsPage"

    invoke-virtual {v7, v8}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v7

    invoke-direct {v4, v5, v6, v7}, Lcom/vk/music/model/SearchModel;-><init>(Ljava/lang/String;ZZ)V

    aput-object v4, v2, v3

    invoke-direct {v0, v1, v2}, Lcom/vk/music/fragment/FragmentDelegateActiveModel;-><init>(Lcom/vk/music/fragment/FragmentDelegateActiveModel$ViewCreator;[Lcom/vk/music/model/ActiveModel;)V

    return-object v0
.end method

.method synthetic lambda$createDelegate$0(Lcom/vk/music/fragment/FragmentDelegateActiveModel;)Landroid/view/View;
    .locals 3
    .param p1, "fd"    # Lcom/vk/music/fragment/FragmentDelegateActiveModel;

    .prologue
    .line 65
    new-instance v1, Lcom/vk/music/view/SearchContainer;

    invoke-virtual {p0}, Lcom/vk/music/fragment/SearchFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/vk/music/fragment/FragmentDelegateActiveModel;->model(I)Lcom/vk/music/model/ActiveModel;

    move-result-object v0

    check-cast v0, Lcom/vk/music/model/SearchModel;

    invoke-direct {v1, v2, v0}, Lcom/vk/music/view/SearchContainer;-><init>(Landroid/content/Context;Lcom/vk/music/model/SearchModel;)V

    return-object v1
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
    .line 52
    iget-object v0, p0, Lcom/vk/music/fragment/SearchFragment;->smallPlayerHelper:Lcom/vk/music/utils/SmallPlayerHelper;

    invoke-super {p0, p1, p2, p3}, Lcom/vk/music/fragment/DelegatingFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/music/utils/SmallPlayerHelper;->onCreateView(Landroid/view/View;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public onDestroyView()V
    .locals 1

    .prologue
    .line 57
    iget-object v0, p0, Lcom/vk/music/fragment/SearchFragment;->smallPlayerHelper:Lcom/vk/music/utils/SmallPlayerHelper;

    invoke-virtual {v0}, Lcom/vk/music/utils/SmallPlayerHelper;->onDestroyView()V

    .line 58
    invoke-super {p0}, Lcom/vk/music/fragment/DelegatingFragment;->onDestroyView()V

    .line 59
    return-void
.end method
