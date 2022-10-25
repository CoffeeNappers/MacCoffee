.class public Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;
.super Lcom/vkontakte/android/fragments/base/GridFragment;
.source "FriendsImportFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;,
        Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$ImportHolder;,
        Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$UserHolder;,
        Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Adapter;,
        Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/fragments/base/GridFragment",
        "<",
        "Lcom/vkontakte/android/UserProfile;",
        ">;"
    }
.end annotation


# instance fields
.field final legacy:Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;

.field mImportServices:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/fragments/friends/importer/BaseImporter;",
            ">;"
        }
    .end annotation
.end field

.field startFrom:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 86
    const/16 v0, 0x14

    invoke-direct {p0, v0}, Lcom/vkontakte/android/fragments/base/GridFragment;-><init>(I)V

    .line 83
    new-instance v0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;

    invoke-direct {v0, p0, v1}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;-><init>(Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$1;)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;->legacy:Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;

    .line 157
    iput-object v1, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;->startFrom:Ljava/lang/String;

    .line 87
    return-void
.end method

.method static synthetic access$1000(Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;

    .prologue
    .line 80
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$1100(Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;

    .prologue
    .line 80
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$1200(Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;

    .prologue
    .line 80
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$200(Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;Ljava/util/List;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;
    .param p1, "x1"    # Ljava/util/List;
    .param p2, "x2"    # Z

    .prologue
    .line 80
    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;->onDataLoaded(Ljava/util/List;Z)V

    return-void
.end method

.method static synthetic access$300(Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;

    .prologue
    .line 80
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$400(Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;)Lcom/vkontakte/android/fragments/base/GridFragment$GridAdapter;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;

    .prologue
    .line 80
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;->getAdapter()Lcom/vkontakte/android/fragments/base/GridFragment$GridAdapter;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$600(Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;

    .prologue
    .line 80
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$700(Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;

    .prologue
    .line 80
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$800(Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;

    .prologue
    .line 80
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$900(Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;

    .prologue
    .line 80
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method


# virtual methods
.method addFriend(Lcom/vkontakte/android/UserProfile;I)V
    .locals 2
    .param p1, "user"    # Lcom/vkontakte/android/UserProfile;
    .param p2, "position"    # I

    .prologue
    .line 179
    iget v0, p1, Lcom/vkontakte/android/UserProfile;->uid:I

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vkontakte/android/api/friends/FriendsAdd;->createFriendsAddAndSendAllStats(ILjava/lang/String;)Lcom/vkontakte/android/api/friends/FriendsAdd;

    move-result-object v0

    .line 180
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/friends/FriendsAdd;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    new-instance v1, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$2;

    invoke-direct {v1, p0, p0, p1, p2}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$2;-><init>(Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;Landroid/app/Fragment;Lcom/vkontakte/android/UserProfile;I)V

    .line 181
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 189
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 190
    return-void
.end method

.method protected createAdapter()Lcom/vkontakte/android/fragments/base/GridFragment$GridAdapter;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vkontakte/android/fragments/base/GridFragment",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">.GridAdapter<",
            "Lcom/vkontakte/android/ui/holder/RecyclerHolder;",
            ">;"
        }
    .end annotation

    .prologue
    .line 145
    new-instance v0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Adapter;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Adapter;-><init>(Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$1;)V

    .line 146
    .local v0, "adapter":Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Adapter;
    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;->setSpanSizeLoockuper(Lcom/vkontakte/android/functions/IntFIntInt;)V

    .line 147
    return-object v0
.end method

.method protected doLoadData(II)V
    .locals 2
    .param p1, "offset"    # I
    .param p2, "count"    # I

    .prologue
    .line 161
    if-nez p1, :cond_0

    .line 162
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;->startFrom:Ljava/lang/String;

    .line 164
    :cond_0
    new-instance v0, Lcom/vkontakte/android/api/friends/FriendsGetRecommendations;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;->startFrom:Ljava/lang/String;

    invoke-direct {v0, v1, p2}, Lcom/vkontakte/android/api/friends/FriendsGetRecommendations;-><init>(Ljava/lang/String;I)V

    new-instance v1, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$1;

    invoke-direct {v1, p0, p0}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$1;-><init>(Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;Landroid/app/Fragment;)V

    .line 165
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/friends/FriendsGetRecommendations;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 171
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 172
    return-void
.end method

.method protected getColumnsCount()I
    .locals 4

    .prologue
    .line 152
    iget-object v2, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v2}, Lme/grishka/appkit/views/UsableRecyclerView;->getWidth()I

    move-result v2

    iget-object v3, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v3}, Lme/grishka/appkit/views/UsableRecyclerView;->getPaddingLeft()I

    move-result v3

    sub-int/2addr v2, v3

    iget-object v3, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v3}, Lme/grishka/appkit/views/UsableRecyclerView;->getPaddingRight()I

    move-result v3

    sub-int v1, v2, v3

    .line 153
    .local v1, "listWidth":I
    const/high16 v2, 0x43340000    # 180.0f

    invoke-static {v2}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v0

    .line 154
    .local v0, "columnWidth":I
    div-int v2, v1, v0

    const/4 v3, 0x2

    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v2

    return v2
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 135
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/base/GridFragment;->onActivityCreated(Landroid/os/Bundle;)V

    .line 136
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;->loaded:Z

    if-nez v0, :cond_0

    .line 137
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;->loadData()V

    .line 141
    :goto_0
    return-void

    .line 139
    :cond_0
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;->dataLoaded()V

    goto :goto_0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 1
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 235
    invoke-super {p0, p1, p2, p3}, Lcom/vkontakte/android/fragments/base/GridFragment;->onActivityResult(IILandroid/content/Intent;)V

    .line 236
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;->legacy:Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;

    invoke-virtual {v0, p1, p2, p3}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;->onActivityResult(IILandroid/content/Intent;)V

    .line 237
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 103
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/base/GridFragment;->onCreate(Landroid/os/Bundle;)V

    .line 104
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;->legacy:Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;->onCreated()V

    .line 105
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;->setRefreshEnabled(Z)V

    .line 106
    return-void
.end method

.method protected onCreateCardDecorator()Lcom/vkontakte/android/ui/recyclerview/CardItemDecoration;
    .locals 9

    .prologue
    const/4 v4, 0x0

    const/high16 v8, 0x41000000    # 8.0f

    .line 117
    new-instance v5, Lcom/vkontakte/android/ui/recyclerview/CardItemDecoration;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;->getAdapter()Lcom/vkontakte/android/fragments/base/GridFragment$GridAdapter;

    move-result-object v6

    iget-boolean v3, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;->isTablet:Z

    if-nez v3, :cond_0

    const/4 v3, 0x1

    :goto_0
    invoke-direct {v5, v6, v3}, Lcom/vkontakte/android/ui/recyclerview/CardItemDecoration;-><init>(Lcom/vkontakte/android/ui/recyclerview/CardItemDecoration$Provider;Z)V

    const/high16 v3, 0x41800000    # 16.0f

    invoke-static {v3}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v3

    invoke-virtual {v5, v3}, Lcom/vkontakte/android/ui/recyclerview/CardItemDecoration;->setCardsSpacing(I)Lcom/vkontakte/android/ui/recyclerview/CardItemDecoration;

    move-result-object v0

    .line 119
    .local v0, "decorator":Lcom/vkontakte/android/ui/recyclerview/CardItemDecoration;
    iget v3, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;->scrW:I

    const/16 v5, 0x258

    if-lt v3, v5, :cond_1

    .line 120
    const/high16 v3, 0x41400000    # 12.0f

    invoke-static {v3}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v2

    .line 126
    .local v2, "padding":I
    :goto_1
    iget v3, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;->scrW:I

    const/16 v5, 0x39c

    if-lt v3, v5, :cond_2

    const/16 v3, 0x10

    iget v5, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;->scrW:I

    add-int/lit16 v5, v5, -0x348

    add-int/lit8 v5, v5, -0x54

    div-int/lit8 v5, v5, 0x2

    invoke-static {v3, v5}, Ljava/lang/Math;->max(II)I

    move-result v3

    int-to-float v3, v3

    invoke-static {v3}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v1

    .line 127
    .local v1, "margin":I
    :goto_2
    iget-object v3, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    add-int v5, v1, v2

    invoke-static {v8}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v6

    add-int v7, v1, v2

    invoke-virtual {v3, v5, v6, v7, v2}, Lme/grishka/appkit/views/UsableRecyclerView;->setPadding(IIII)V

    .line 128
    invoke-static {v8}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v3

    invoke-virtual {v0, v2, v4, v2, v3}, Lcom/vkontakte/android/ui/recyclerview/CardItemDecoration;->setPadding(IIII)Lcom/vkontakte/android/ui/recyclerview/CardItemDecoration;

    .line 129
    return-object v0

    .end local v0    # "decorator":Lcom/vkontakte/android/ui/recyclerview/CardItemDecoration;
    .end local v1    # "margin":I
    .end local v2    # "padding":I
    :cond_0
    move v3, v4

    .line 117
    goto :goto_0

    .line 122
    .restart local v0    # "decorator":Lcom/vkontakte/android/ui/recyclerview/CardItemDecoration;
    :cond_1
    invoke-static {v8}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v2

    .restart local v2    # "padding":I
    goto :goto_1

    :cond_2
    move v1, v4

    .line 126
    goto :goto_2
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 1
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 110
    invoke-super {p0, p1, p2}, Lcom/vkontakte/android/fragments/base/GridFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 111
    const v0, 0x7f08021b

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;->setTitle(I)V

    .line 112
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;->updateItems()V

    .line 113
    return-void
.end method

.method openProfile(Lcom/vkontakte/android/UserProfile;)V
    .locals 2
    .param p1, "profile"    # Lcom/vkontakte/android/UserProfile;

    .prologue
    .line 175
    new-instance v0, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;

    iget v1, p1, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-direct {v0, v1}, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;-><init>(I)V

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;->go(Landroid/content/Context;)Z

    .line 176
    return-void
.end method

.method updateItems()V
    .locals 6

    .prologue
    .line 193
    new-instance v0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$3;

    const v2, 0x7f0201c8

    const v3, 0x7f0806e2

    iget-object v1, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;->legacy:Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;->access$500(Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;->data:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-nez v1, :cond_0

    const v1, 0x7f080438

    :goto_0
    invoke-direct {v0, p0, v2, v3, v1}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$3;-><init>(Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;III)V

    .line 200
    .local v0, "contactsImporter":Lcom/vkontakte/android/fragments/friends/importer/BaseImporter;
    iget-object v1, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;->mImportServices:Ljava/util/List;

    if-nez v1, :cond_1

    .line 201
    new-instance v1, Ljava/util/ArrayList;

    const/4 v2, 0x5

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v1, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;->mImportServices:Ljava/util/List;

    .line 202
    iget-object v1, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;->mImportServices:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 203
    iget-object v1, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;->mImportServices:Ljava/util/List;

    new-instance v2, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$4;

    const v3, 0x7f0201ca

    const v4, 0x7f0806e8

    const v5, 0x7f0806e9

    invoke-direct {v2, p0, v3, v4, v5}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$4;-><init>(Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;III)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 209
    iget-object v1, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;->mImportServices:Ljava/util/List;

    new-instance v2, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$5;

    const v3, 0x7f0201c9

    const v4, 0x7f0806e6

    const v5, 0x7f0806e7

    invoke-direct {v2, p0, v3, v4, v5}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$5;-><init>(Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;III)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 215
    iget-object v1, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;->mImportServices:Ljava/util/List;

    new-instance v2, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$6;

    const v3, 0x7f0201cc

    const v4, 0x7f0806e4

    const v5, 0x7f0806e5

    invoke-direct {v2, p0, v3, v4, v5}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$6;-><init>(Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;III)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 221
    iget-object v1, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;->mImportServices:Ljava/util/List;

    new-instance v2, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$7;

    const v3, 0x7f0201cb

    const v4, 0x7f0806ec

    const v5, 0x7f0806ed

    invoke-direct {v2, p0, v3, v4, v5}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$7;-><init>(Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;III)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 230
    :goto_1
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;->updateList()V

    .line 231
    return-void

    .line 193
    .end local v0    # "contactsImporter":Lcom/vkontakte/android/fragments/friends/importer/BaseImporter;
    :cond_0
    const v1, 0x7f0806e3

    goto :goto_0

    .line 228
    .restart local v0    # "contactsImporter":Lcom/vkontakte/android/fragments/friends/importer/BaseImporter;
    :cond_1
    iget-object v1, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;->mImportServices:Ljava/util/List;

    const/4 v2, 0x0

    invoke-interface {v1, v2, v0}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    goto :goto_1
.end method
