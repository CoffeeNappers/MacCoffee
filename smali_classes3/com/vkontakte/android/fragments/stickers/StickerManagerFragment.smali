.class public Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;
.super Lcom/vkontakte/android/fragments/base/GridFragment;
.source "StickerManagerFragment.java"

# interfaces
.implements Lcom/vkontakte/android/fragments/BackListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$DragController;,
        Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$Holder;,
        Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$SettingHolder;,
        Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$Adapter;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/fragments/base/GridFragment",
        "<",
        "Lcom/vkontakte/android/data/orm/StickerStockItem;",
        ">;",
        "Lcom/vkontakte/android/fragments/BackListener;"
    }
.end annotation


# instance fields
.field final mActive:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/data/orm/StickerStockItem;",
            ">;"
        }
    .end annotation
.end field

.field final mDecoration:Lcom/vkontakte/android/ui/recyclerview/BottomDividerDecoration;

.field final mInactive:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/data/orm/StickerStockItem;",
            ">;"
        }
    .end annotation
.end field

.field mPhotoSize:I

.field mReorderReq:Lcom/vkontakte/android/api/VKAPIRequest;


# direct methods
.method public constructor <init>()V
    .locals 5

    .prologue
    .line 63
    const/16 v0, 0x1e

    invoke-direct {p0, v0}, Lcom/vkontakte/android/fragments/base/GridFragment;-><init>(I)V

    .line 57
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;->mActive:Ljava/util/List;

    .line 58
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;->mInactive:Ljava/util/List;

    .line 59
    new-instance v1, Lcom/vkontakte/android/ui/recyclerview/BottomDividerDecoration;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;->getAdapter()Lcom/vkontakte/android/fragments/base/GridFragment$GridAdapter;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/ui/recyclerview/BottomDividerDecoration$Provider;

    const/4 v2, 0x1

    const/high16 v3, 0x3f000000    # 0.5f

    invoke-static {v3}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v2

    const/high16 v3, 0xf000000

    const/high16 v4, 0x41000000    # 8.0f

    invoke-static {v4}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v4

    invoke-direct {v1, v0, v2, v3, v4}, Lcom/vkontakte/android/ui/recyclerview/BottomDividerDecoration;-><init>(Lcom/vkontakte/android/ui/recyclerview/BottomDividerDecoration$Provider;III)V

    iput-object v1, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;->mDecoration:Lcom/vkontakte/android/ui/recyclerview/BottomDividerDecoration;

    .line 64
    const v0, 0x7f03023c

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;->setLayout(I)V

    .line 65
    return-void
.end method

.method static synthetic access$202(Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;Lme/grishka/appkit/api/APIRequest;)Lme/grishka/appkit/api/APIRequest;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;
    .param p1, "x1"    # Lme/grishka/appkit/api/APIRequest;

    .prologue
    .line 46
    iput-object p1, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;->currentRequest:Lme/grishka/appkit/api/APIRequest;

    return-object p1
.end method

.method static synthetic access$300(Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;Ljava/util/List;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;
    .param p1, "x1"    # Ljava/util/List;
    .param p2, "x2"    # Z

    .prologue
    .line 46
    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;->onDataLoaded(Ljava/util/List;Z)V

    return-void
.end method

.method static synthetic access$400(Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;)Lme/grishka/appkit/views/UsableRecyclerView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;

    .prologue
    .line 46
    iget-object v0, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    return-object v0
.end method

.method static synthetic access$500(Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;)Lcom/vkontakte/android/fragments/base/GridFragment$GridAdapter;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;

    .prologue
    .line 46
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;->getAdapter()Lcom/vkontakte/android/fragments/base/GridFragment$GridAdapter;

    move-result-object v0

    return-object v0
.end method

.method private refreshAutoSuggestStickersIfNeeded()V
    .locals 2

    .prologue
    .line 104
    invoke-static {}, Lcom/vkontakte/android/stickers/Stickers;->get()Lcom/vkontakte/android/stickers/Stickers;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/stickers/Stickers;->reloadAutoSuggestDictionaryIfNeeded(Z)V

    .line 105
    return-void
.end method

.method public static start(Landroid/app/Activity;)V
    .locals 4
    .param p0, "activity"    # Landroid/app/Activity;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 49
    new-instance v1, Lcom/vkontakte/android/navigation/Navigator;

    const-class v2, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;

    new-instance v3, Lcom/vkontakte/android/TabletDialogActivity$Builder;

    invoke-direct {v3}, Lcom/vkontakte/android/TabletDialogActivity$Builder;-><init>()V

    .line 51
    invoke-static {p0}, Lcom/vk/core/util/Screen;->isTablet(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    const v0, 0x7f0f005e

    :goto_0
    invoke-virtual {v3, v0}, Lcom/vkontakte/android/TabletDialogActivity$Builder;->windowBackgroundResource(I)Lcom/vkontakte/android/TabletDialogActivity$Builder;

    move-result-object v0

    const/high16 v3, 0x44230000    # 652.0f

    .line 52
    invoke-static {v3}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v3

    invoke-virtual {v0, v3}, Lcom/vkontakte/android/TabletDialogActivity$Builder;->setMaxWidth(I)Lcom/vkontakte/android/TabletDialogActivity$Builder;

    move-result-object v0

    invoke-direct {v1, v2, v0}, Lcom/vkontakte/android/navigation/Navigator;-><init>(Ljava/lang/Class;Lcom/vkontakte/android/navigation/Navigator$ActivityNavigator;)V

    .line 53
    invoke-virtual {v1, p0}, Lcom/vkontakte/android/navigation/Navigator;->go(Landroid/content/Context;)Z

    .line 54
    return-void

    .line 51
    :cond_0
    const v0, 0x106000b

    goto :goto_0
.end method


# virtual methods
.method protected bridge synthetic createAdapter()Lcom/vkontakte/android/fragments/base/GridFragment$GridAdapter;
    .locals 1

    .prologue
    .line 46
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;->createAdapter()Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$Adapter;

    move-result-object v0

    return-object v0
.end method

.method protected createAdapter()Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$Adapter;
    .locals 2

    .prologue
    .line 124
    new-instance v0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$Adapter;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$Adapter;-><init>(Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$1;)V

    return-object v0
.end method

.method protected doLoadData(II)V
    .locals 2
    .param p1, "offset"    # I
    .param p2, "count"    # I

    .prologue
    .line 129
    new-instance v0, Lcom/vkontakte/android/api/store/StoreGetPurchases;

    invoke-direct {v0}, Lcom/vkontakte/android/api/store/StoreGetPurchases;-><init>()V

    new-instance v1, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$1;

    invoke-direct {v1, p0, p0}, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$1;-><init>(Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;Landroid/app/Fragment;)V

    .line 130
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/store/StoreGetPurchases;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 149
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;->currentRequest:Lme/grishka/appkit/api/APIRequest;

    .line 150
    return-void
.end method

.method protected getColumnsCount()I
    .locals 1

    .prologue
    .line 119
    const/4 v0, 0x1

    return v0
.end method

.method listActivePositionToCollectionIndex(I)I
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 450
    iget-object v0, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;->mActive:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sub-int v0, p1, v0

    return v0

    :cond_0
    const/4 v0, 0x2

    goto :goto_0
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "state"    # Landroid/os/Bundle;

    .prologue
    .line 109
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/base/GridFragment;->onActivityCreated(Landroid/os/Bundle;)V

    .line 110
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;->loaded:Z

    if-nez v0, :cond_0

    .line 111
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;->loadData()V

    .line 115
    :goto_0
    return-void

    .line 113
    :cond_0
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;->dataLoaded()V

    goto :goto_0
.end method

.method public onBackPressed()Z
    .locals 1

    .prologue
    .line 99
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;->refreshAutoSuggestStickersIfNeeded()V

    .line 100
    const/4 v0, 0x0

    return v0
.end method

.method public onCancel(Landroid/content/DialogInterface;)V
    .locals 0
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 87
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/base/GridFragment;->onCancel(Landroid/content/DialogInterface;)V

    .line 88
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;->refreshAutoSuggestStickersIfNeeded()V

    .line 89
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 69
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/base/GridFragment;->onCreate(Landroid/os/Bundle;)V

    .line 70
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;->setHasOptionsMenu(Z)V

    .line 71
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;->setRefreshEnabled(Z)V

    .line 72
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f090144

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;->mPhotoSize:I

    .line 73
    return-void
.end method

.method protected onCreateCardDecorator()Lcom/vkontakte/android/ui/recyclerview/CardItemDecoration;
    .locals 7

    .prologue
    const/4 v3, 0x0

    .line 154
    iget-boolean v4, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;->isTablet:Z

    if-eqz v4, :cond_1

    const/high16 v4, 0x42400000    # 48.0f

    invoke-static {v4}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v0

    .line 155
    .local v0, "listPadding":I
    :goto_0
    const/high16 v4, 0x41000000    # 8.0f

    invoke-static {v4}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v2

    .line 156
    .local v2, "paddingY":I
    iget-boolean v4, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;->isTablet:Z

    if-eqz v4, :cond_2

    const/high16 v4, 0x41800000    # 16.0f

    invoke-static {v4}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v1

    .line 158
    .local v1, "paddingX":I
    :goto_1
    iget-object v4, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;->mDecoration:Lcom/vkontakte/android/ui/recyclerview/BottomDividerDecoration;

    sub-int v5, v0, v1

    sub-int v6, v0, v1

    invoke-virtual {v4, v5, v6}, Lcom/vkontakte/android/ui/recyclerview/BottomDividerDecoration;->setPadding(II)Lcom/vkontakte/android/ui/recyclerview/BottomDividerDecoration;

    .line 159
    iget-object v4, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v4, v0, v2, v0, v3}, Lme/grishka/appkit/views/UsableRecyclerView;->setPadding(IIII)V

    .line 160
    new-instance v4, Lcom/vkontakte/android/ui/recyclerview/CardItemDecoration;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;->getAdapter()Lcom/vkontakte/android/fragments/base/GridFragment$GridAdapter;

    move-result-object v5

    iget-boolean v6, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;->isTablet:Z

    if-nez v6, :cond_0

    const/4 v3, 0x1

    :cond_0
    invoke-direct {v4, v5, v3}, Lcom/vkontakte/android/ui/recyclerview/CardItemDecoration;-><init>(Lcom/vkontakte/android/ui/recyclerview/CardItemDecoration$Provider;Z)V

    invoke-virtual {v4, v1, v2, v1, v2}, Lcom/vkontakte/android/ui/recyclerview/CardItemDecoration;->setPadding(IIII)Lcom/vkontakte/android/ui/recyclerview/CardItemDecoration;

    move-result-object v3

    const/high16 v4, 0x41700000    # 15.0f

    invoke-static {v4}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v4

    invoke-virtual {v3, v4}, Lcom/vkontakte/android/ui/recyclerview/CardItemDecoration;->setCardsSpacing(I)Lcom/vkontakte/android/ui/recyclerview/CardItemDecoration;

    move-result-object v3

    return-object v3

    .end local v0    # "listPadding":I
    .end local v1    # "paddingX":I
    .end local v2    # "paddingY":I
    :cond_1
    move v0, v3

    .line 154
    goto :goto_0

    .restart local v0    # "listPadding":I
    .restart local v2    # "paddingY":I
    :cond_2
    move v1, v3

    .line 156
    goto :goto_1
.end method

.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 0
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 93
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/base/GridFragment;->onDismiss(Landroid/content/DialogInterface;)V

    .line 94
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;->refreshAutoSuggestStickersIfNeeded()V

    .line 95
    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 3
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 77
    invoke-super {p0, p1, p2}, Lcom/vkontakte/android/fragments/base/GridFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 78
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;->getToolbar()Landroid/support/v7/widget/Toolbar;

    move-result-object v0

    const v1, 0x7f02014f

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/Toolbar;->setNavigationIcon(I)V

    .line 79
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;->getToolbar()Landroid/support/v7/widget/Toolbar;

    move-result-object v1

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    check-cast v0, Landroid/view/View$OnClickListener;

    invoke-virtual {v1, v0}, Landroid/support/v7/widget/Toolbar;->setNavigationOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 80
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;->getToolbar()Landroid/support/v7/widget/Toolbar;

    move-result-object v0

    const v1, 0x7f080411

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/Toolbar;->setTitle(I)V

    .line 81
    new-instance v0, Landroid/support/v7/widget/helper/ItemTouchHelper;

    new-instance v1, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$DragController;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$DragController;-><init>(Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$1;)V

    invoke-direct {v0, v1}, Landroid/support/v7/widget/helper/ItemTouchHelper;-><init>(Landroid/support/v7/widget/helper/ItemTouchHelper$Callback;)V

    iget-object v1, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/helper/ItemTouchHelper;->attachToRecyclerView(Landroid/support/v7/widget/RecyclerView;)V

    .line 82
    iget-object v0, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;->mDecoration:Lcom/vkontakte/android/ui/recyclerview/BottomDividerDecoration;

    invoke-virtual {v0, v1}, Lme/grishka/appkit/views/UsableRecyclerView;->addItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    .line 83
    return-void
.end method

.method sendReorder(II)V
    .locals 6
    .param p1, "prevListPosition"    # I
    .param p2, "listPosition"    # I

    .prologue
    const/4 v0, -0x1

    .line 184
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;->listActivePositionToCollectionIndex(I)I

    move-result v3

    .line 185
    .local v3, "prevPosition":I
    invoke-virtual {p0, p2}, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;->listActivePositionToCollectionIndex(I)I

    move-result v2

    .line 186
    .local v2, "position":I
    add-int/lit8 v4, v2, 0x1

    iget-object v5, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;->mActive:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    if-ge v4, v5, :cond_1

    iget-object v4, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;->mActive:Ljava/util/List;

    add-int/lit8 v5, v2, 0x1

    invoke-interface {v4, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vkontakte/android/data/orm/StickerStockItem;

    iget v1, v4, Lcom/vkontakte/android/data/orm/StickerStockItem;->id:I

    .line 187
    .local v1, "beforeId":I
    :goto_0
    add-int/lit8 v4, v2, -0x1

    if-ltz v4, :cond_0

    iget-object v4, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;->mActive:Ljava/util/List;

    add-int/lit8 v5, v2, -0x1

    invoke-interface {v4, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vkontakte/android/data/orm/StickerStockItem;

    iget v0, v4, Lcom/vkontakte/android/data/orm/StickerStockItem;->id:I

    .line 189
    .local v0, "afterId":I
    :cond_0
    new-instance v5, Lcom/vkontakte/android/api/store/StoreReorderProducts;

    iget-object v4, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;->mActive:Ljava/util/List;

    invoke-interface {v4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vkontakte/android/data/orm/StickerStockItem;

    iget v4, v4, Lcom/vkontakte/android/data/orm/StickerStockItem;->id:I

    invoke-direct {v5, v4, v1, v0}, Lcom/vkontakte/android/api/store/StoreReorderProducts;-><init>(III)V

    new-instance v4, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$3;

    invoke-direct {v4, p0, p0, v2, v3}, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$3;-><init>(Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;Landroid/app/Fragment;II)V

    .line 190
    invoke-virtual {v5, v4}, Lcom/vkontakte/android/api/store/StoreReorderProducts;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v4

    .line 208
    invoke-virtual {v4}, Lcom/vkontakte/android/api/VKAPIRequest;->exec()Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v4

    iput-object v4, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;->mReorderReq:Lcom/vkontakte/android/api/VKAPIRequest;

    .line 209
    return-void

    .end local v0    # "afterId":I
    .end local v1    # "beforeId":I
    :cond_1
    move v1, v0

    .line 186
    goto :goto_0
.end method

.method setActiveState(Lcom/vkontakte/android/data/orm/StickerStockItem;Z)V
    .locals 2
    .param p1, "item"    # Lcom/vkontakte/android/data/orm/StickerStockItem;
    .param p2, "activate"    # Z

    .prologue
    .line 164
    new-instance v0, Lcom/vkontakte/android/api/store/StoreSetActive;

    iget v1, p1, Lcom/vkontakte/android/data/orm/StickerStockItem;->id:I

    invoke-direct {v0, v1, p2}, Lcom/vkontakte/android/api/store/StoreSetActive;-><init>(IZ)V

    new-instance v1, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$2;

    invoke-direct {v1, p0, p0, p1, p2}, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$2;-><init>(Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;Landroid/app/Fragment;Lcom/vkontakte/android/data/orm/StickerStockItem;Z)V

    .line 165
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/store/StoreSetActive;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 179
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 180
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 181
    return-void
.end method
