.class public Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;
.super Landroid/app/Fragment;
.source "StoreTabFragment.java"

# interfaces
.implements Lcom/vkontakte/android/ui/ActivityResulter;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/fragments/stickers/StoreTabFragment$Adapter;
    }
.end annotation


# instance fields
.field private mActionListener:Landroid/view/View$OnClickListener;

.field private mData:Lcom/vkontakte/android/api/store/StoreGetCatalog$Section;

.field private mHeaderScrollOffset:I

.field private mInitialPadding:I

.field private mManager:Lcom/vkontakte/android/data/PurchasesManager;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/data/PurchasesManager",
            "<",
            "Lcom/vkontakte/android/data/orm/StickerStockItem;",
            ">;"
        }
    .end annotation
.end field

.field private mReceiver:Landroid/content/BroadcastReceiver;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 38
    invoke-direct {p0}, Landroid/app/Fragment;-><init>()V

    .line 46
    new-instance v0, Lcom/vkontakte/android/fragments/stickers/StoreTabFragment$1;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/stickers/StoreTabFragment$1;-><init>(Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;->mActionListener:Landroid/view/View$OnClickListener;

    .line 60
    new-instance v0, Lcom/vkontakte/android/fragments/stickers/StoreTabFragment$2;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/stickers/StoreTabFragment$2;-><init>(Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;->mReceiver:Landroid/content/BroadcastReceiver;

    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;)Lcom/vkontakte/android/data/PurchasesManager;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;

    .prologue
    .line 38
    iget-object v0, p0, Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;->mManager:Lcom/vkontakte/android/data/PurchasesManager;

    return-object v0
.end method

.method static synthetic access$100(Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;)Lcom/vkontakte/android/api/store/StoreGetCatalog$Section;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;

    .prologue
    .line 38
    iget-object v0, p0, Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;->mData:Lcom/vkontakte/android/api/store/StoreGetCatalog$Section;

    return-object v0
.end method

.method static synthetic access$200(Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;)I
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;

    .prologue
    .line 38
    iget v0, p0, Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;->mHeaderScrollOffset:I

    return v0
.end method

.method static synthetic access$202(Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;I)I
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;
    .param p1, "x1"    # I

    .prologue
    .line 38
    iput p1, p0, Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;->mHeaderScrollOffset:I

    return p1
.end method

.method static synthetic access$300(Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;)I
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;

    .prologue
    .line 38
    iget v0, p0, Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;->mInitialPadding:I

    return v0
.end method

.method static synthetic access$500(Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;)Landroid/view/View$OnClickListener;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;

    .prologue
    .line 38
    iget-object v0, p0, Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;->mActionListener:Landroid/view/View$OnClickListener;

    return-object v0
.end method


# virtual methods
.method getHeaderScrollOffset()I
    .locals 1

    .prologue
    .line 203
    iget v0, p0, Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;->mHeaderScrollOffset:I

    return v0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 1
    .param p1, "reqCode"    # I
    .param p2, "resCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 172
    invoke-super {p0, p1, p2, p3}, Landroid/app/Fragment;->onActivityResult(IILandroid/content/Intent;)V

    .line 173
    iget-object v0, p0, Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;->mManager:Lcom/vkontakte/android/data/PurchasesManager;

    if-eqz v0, :cond_0

    .line 174
    iget-object v0, p0, Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;->mManager:Lcom/vkontakte/android/data/PurchasesManager;

    invoke-virtual {v0, p1, p2, p3}, Lcom/vkontakte/android/data/PurchasesManager;->onActivityResult(IILandroid/content/Intent;)V

    .line 176
    :cond_0
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 3
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 108
    invoke-super {p0, p1}, Landroid/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    .line 109
    const/high16 v0, 0x41400000    # 12.0f

    invoke-static {v0}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v0

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f090148

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    add-int/2addr v0, v1

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f090149

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    add-int/2addr v0, v1

    iput v0, p0, Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;->mInitialPadding:I

    .line 110
    new-instance v0, Lcom/vkontakte/android/data/PurchasesManager;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/data/PurchasesManager;-><init>(Landroid/app/Fragment;)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;->mManager:Lcom/vkontakte/android/data/PurchasesManager;

    .line 111
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/ui/ResulterProvider;

    invoke-interface {v0, p0}, Lcom/vkontakte/android/ui/ResulterProvider;->registerActivityResult(Lcom/vkontakte/android/ui/ActivityResulter;)V

    .line 112
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 10
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    const/4 v9, 0x0

    const/4 v8, 0x2

    const/4 v6, 0x0

    .line 117
    invoke-virtual {p1}, Landroid/view/LayoutInflater;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-static {v5}, Lcom/vk/core/util/Screen;->isTablet(Landroid/content/Context;)Z

    move-result v2

    .line 118
    .local v2, "isTablet":Z
    new-instance v3, Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;->getActivity()Landroid/app/Activity;

    move-result-object v5

    invoke-direct {v3, v5}, Lme/grishka/appkit/views/UsableRecyclerView;-><init>(Landroid/content/Context;)V

    .line 119
    .local v3, "list":Landroid/support/v7/widget/RecyclerView;
    if-eqz v2, :cond_0

    new-instance v5, Landroid/support/v7/widget/GridLayoutManager;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;->getActivity()Landroid/app/Activity;

    move-result-object v7

    invoke-direct {v5, v7, v8}, Landroid/support/v7/widget/GridLayoutManager;-><init>(Landroid/content/Context;I)V

    :goto_0
    invoke-virtual {v3, v5}, Landroid/support/v7/widget/RecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    .line 120
    invoke-virtual {v3, v6}, Landroid/support/v7/widget/RecyclerView;->setClipToPadding(Z)V

    .line 121
    new-instance v5, Lcom/vkontakte/android/fragments/stickers/StoreTabFragment$3;

    invoke-direct {v5, p0}, Lcom/vkontakte/android/fragments/stickers/StoreTabFragment$3;-><init>(Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;)V

    invoke-virtual {v3, v5}, Landroid/support/v7/widget/RecyclerView;->addOnScrollListener(Landroid/support/v7/widget/RecyclerView$OnScrollListener;)V

    .line 138
    new-instance v0, Lcom/vkontakte/android/fragments/stickers/StoreTabFragment$Adapter;

    invoke-direct {v0, p0, v9}, Lcom/vkontakte/android/fragments/stickers/StoreTabFragment$Adapter;-><init>(Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;Lcom/vkontakte/android/fragments/stickers/StoreTabFragment$1;)V

    .line 140
    .local v0, "adapter":Lcom/vkontakte/android/fragments/stickers/StoreTabFragment$Adapter;
    if-eqz v2, :cond_2

    .line 141
    new-instance v5, Lcom/vkontakte/android/ui/recyclerview/FitGridItemDecoration;

    invoke-direct {v5}, Lcom/vkontakte/android/ui/recyclerview/FitGridItemDecoration;-><init>()V

    const/high16 v7, 0x41400000    # 12.0f

    invoke-static {v7}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v7

    invoke-virtual {v5, v8, v7}, Lcom/vkontakte/android/ui/recyclerview/FitGridItemDecoration;->set(II)Lcom/vkontakte/android/ui/recyclerview/FitGridItemDecoration;

    move-result-object v5

    invoke-virtual {v3, v5}, Landroid/support/v7/widget/RecyclerView;->addItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    .line 143
    new-instance v1, Lcom/vkontakte/android/ui/recyclerview/CardItemDecoration;

    invoke-direct {v1, v0, v6}, Lcom/vkontakte/android/ui/recyclerview/CardItemDecoration;-><init>(Lcom/vkontakte/android/ui/recyclerview/CardItemDecoration$Provider;Z)V

    .line 144
    .local v1, "decorator":Lcom/vkontakte/android/ui/recyclerview/CardItemDecoration;
    if-eqz v2, :cond_1

    const/high16 v5, 0x41c00000    # 24.0f

    invoke-static {v5}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v4

    .line 145
    .local v4, "paddingX":I
    :goto_1
    iget v5, p0, Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;->mInitialPadding:I

    invoke-virtual {v3, v4, v5, v4, v6}, Landroid/support/v7/widget/RecyclerView;->setPadding(IIII)V

    .line 146
    const/high16 v5, 0x41500000    # 13.0f

    invoke-static {v5}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v5

    invoke-virtual {v1, v5}, Lcom/vkontakte/android/ui/recyclerview/CardItemDecoration;->setCardsSpacing(I)Lcom/vkontakte/android/ui/recyclerview/CardItemDecoration;

    .line 147
    invoke-virtual {v1, v6}, Lcom/vkontakte/android/ui/recyclerview/CardItemDecoration;->clipToPadding(Z)Lcom/vkontakte/android/ui/recyclerview/CardItemDecoration;

    .line 148
    invoke-virtual {v1, v6}, Lcom/vkontakte/android/ui/recyclerview/CardItemDecoration;->setBackgroundColor(I)Lcom/vkontakte/android/ui/recyclerview/CardItemDecoration;

    .line 149
    invoke-virtual {v3, v1}, Landroid/support/v7/widget/RecyclerView;->addItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    .line 155
    .end local v1    # "decorator":Lcom/vkontakte/android/ui/recyclerview/CardItemDecoration;
    .end local v4    # "paddingX":I
    :goto_2
    invoke-virtual {v3, v0}, Landroid/support/v7/widget/RecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 156
    return-object v3

    .line 119
    .end local v0    # "adapter":Lcom/vkontakte/android/fragments/stickers/StoreTabFragment$Adapter;
    :cond_0
    new-instance v5, Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;->getActivity()Landroid/app/Activity;

    move-result-object v7

    invoke-direct {v5, v7}, Landroid/support/v7/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    goto :goto_0

    .restart local v0    # "adapter":Lcom/vkontakte/android/fragments/stickers/StoreTabFragment$Adapter;
    .restart local v1    # "decorator":Lcom/vkontakte/android/ui/recyclerview/CardItemDecoration;
    :cond_1
    move v4, v6

    .line 144
    goto :goto_1

    .line 151
    .end local v1    # "decorator":Lcom/vkontakte/android/ui/recyclerview/CardItemDecoration;
    :cond_2
    new-instance v5, Lcom/vkontakte/android/ui/recyclerview/BottomDividerDecoration;

    const/4 v7, 0x1

    const/high16 v8, 0x3f000000    # 0.5f

    invoke-static {v8}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v8

    invoke-static {v7, v8}, Ljava/lang/Math;->max(II)I

    move-result v7

    const/high16 v8, 0x26000000

    invoke-direct {v5, v9, v7, v8, v6}, Lcom/vkontakte/android/ui/recyclerview/BottomDividerDecoration;-><init>(Lcom/vkontakte/android/ui/recyclerview/BottomDividerDecoration$Provider;III)V

    const/high16 v7, 0x42b80000    # 92.0f

    invoke-static {v7}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v7

    invoke-virtual {v5, v7, v6}, Lcom/vkontakte/android/ui/recyclerview/BottomDividerDecoration;->setPadding(II)Lcom/vkontakte/android/ui/recyclerview/BottomDividerDecoration;

    move-result-object v5

    invoke-virtual {v3, v5}, Landroid/support/v7/widget/RecyclerView;->addItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    .line 152
    iget v5, p0, Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;->mInitialPadding:I

    invoke-virtual {v3, v6, v5, v6, v6}, Landroid/support/v7/widget/RecyclerView;->setPadding(IIII)V

    goto :goto_2
.end method

.method public onDetach()V
    .locals 1

    .prologue
    .line 186
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/ui/ResulterProvider;

    invoke-interface {v0, p0}, Lcom/vkontakte/android/ui/ResulterProvider;->unregisterActivityResult(Lcom/vkontakte/android/ui/ActivityResulter;)V

    .line 187
    invoke-super {p0}, Landroid/app/Fragment;->onDetach()V

    .line 188
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 0
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 192
    if-eqz p1, :cond_0

    .line 193
    invoke-super {p0, p1}, Landroid/app/Fragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 195
    :cond_0
    return-void
.end method

.method public onStart()V
    .locals 5

    .prologue
    .line 162
    invoke-super {p0}, Landroid/app/Fragment;->onStart()V

    .line 163
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 164
    .local v0, "filter":Landroid/content/IntentFilter;
    const-string/jumbo v1, "com.vkontakte.android.STICKERS_UPDATED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 165
    const-string/jumbo v1, "com.vkontakte.android.STICKERS_DOWNLOAD_PROGRESS"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 166
    const-string/jumbo v1, "com.vkontakte.android.STICKERS_RELOADED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 167
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;->mReceiver:Landroid/content/BroadcastReceiver;

    const-string/jumbo v3, "com.vkontakte.android.permission.ACCESS_DATA"

    const/4 v4, 0x0

    invoke-virtual {v1, v2, v0, v3, v4}, Landroid/app/Activity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;)Landroid/content/Intent;

    .line 168
    return-void
.end method

.method public onStop()V
    .locals 2

    .prologue
    .line 180
    invoke-super {p0}, Landroid/app/Fragment;->onStop()V

    .line 181
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/app/Activity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 182
    return-void
.end method

.method setData(Lcom/vkontakte/android/api/store/StoreGetCatalog$Section;)Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;
    .locals 0
    .param p1, "section"    # Lcom/vkontakte/android/api/store/StoreGetCatalog$Section;

    .prologue
    .line 198
    iput-object p1, p0, Lcom/vkontakte/android/fragments/stickers/StoreTabFragment;->mData:Lcom/vkontakte/android/api/store/StoreGetCatalog$Section;

    .line 199
    return-object p0
.end method
