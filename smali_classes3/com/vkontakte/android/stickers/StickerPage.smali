.class Lcom/vkontakte/android/stickers/StickerPage;
.super Lcom/vkontakte/android/stickers/StickersViewPage;
.source "StickerPage.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/stickers/StickerPage$Adapter;,
        Lcom/vkontakte/android/stickers/StickerPage$HeaderHolder;,
        Lcom/vkontakte/android/stickers/StickerPage$StickerHolder;
    }
.end annotation


# instance fields
.field private mAdapter:Lcom/vkontakte/android/stickers/StickerPage$Adapter;

.field private mContentView:Lcom/vkontakte/android/stickers/WindowRecyclerView;

.field private mData:Lcom/vkontakte/android/data/orm/StickerStockItem;

.field private mListener:Landroid/support/v7/widget/RecyclerView$OnScrollListener;

.field private final mPurchaseManager:Lcom/vkontakte/android/data/PurchasesManager;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/data/PurchasesManager",
            "<",
            "Lcom/vkontakte/android/data/orm/StickerStockItem;",
            ">;"
        }
    .end annotation
.end field

.field private mSelector:Lcom/vkontakte/android/stickers/StickersView$Listener;

.field private mViewToUrlProjection:Lcom/vkontakte/android/stickers/WindowRecyclerView$Callback;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/data/orm/StickerStockItem;Lcom/vkontakte/android/data/PurchasesManager;)V
    .locals 1
    .param p1, "data"    # Lcom/vkontakte/android/data/orm/StickerStockItem;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vkontakte/android/data/orm/StickerStockItem;",
            "Lcom/vkontakte/android/data/PurchasesManager",
            "<",
            "Lcom/vkontakte/android/data/orm/StickerStockItem;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 56
    .local p2, "manager":Lcom/vkontakte/android/data/PurchasesManager;, "Lcom/vkontakte/android/data/PurchasesManager<Lcom/vkontakte/android/data/orm/StickerStockItem;>;"
    invoke-direct {p0}, Lcom/vkontakte/android/stickers/StickersViewPage;-><init>()V

    .line 45
    new-instance v0, Lcom/vkontakte/android/stickers/StickerPage$1;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/stickers/StickerPage$1;-><init>(Lcom/vkontakte/android/stickers/StickerPage;)V

    iput-object v0, p0, Lcom/vkontakte/android/stickers/StickerPage;->mViewToUrlProjection:Lcom/vkontakte/android/stickers/WindowRecyclerView$Callback;

    .line 57
    iput-object p1, p0, Lcom/vkontakte/android/stickers/StickerPage;->mData:Lcom/vkontakte/android/data/orm/StickerStockItem;

    .line 58
    iput-object p2, p0, Lcom/vkontakte/android/stickers/StickerPage;->mPurchaseManager:Lcom/vkontakte/android/data/PurchasesManager;

    .line 59
    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/stickers/StickerPage;)Lcom/vkontakte/android/data/orm/StickerStockItem;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/stickers/StickerPage;

    .prologue
    .line 35
    iget-object v0, p0, Lcom/vkontakte/android/stickers/StickerPage;->mData:Lcom/vkontakte/android/data/orm/StickerStockItem;

    return-object v0
.end method

.method static synthetic access$100(Lcom/vkontakte/android/stickers/StickerPage;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/stickers/StickerPage;

    .prologue
    .line 35
    invoke-direct {p0}, Lcom/vkontakte/android/stickers/StickerPage;->showHeader()Z

    move-result v0

    return v0
.end method

.method static synthetic access$200(Lcom/vkontakte/android/stickers/StickerPage;)Lcom/vkontakte/android/data/PurchasesManager;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/stickers/StickerPage;

    .prologue
    .line 35
    iget-object v0, p0, Lcom/vkontakte/android/stickers/StickerPage;->mPurchaseManager:Lcom/vkontakte/android/data/PurchasesManager;

    return-object v0
.end method

.method static synthetic access$300(Lcom/vkontakte/android/stickers/StickerPage;)Lcom/vkontakte/android/stickers/StickersView$Listener;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/stickers/StickerPage;

    .prologue
    .line 35
    iget-object v0, p0, Lcom/vkontakte/android/stickers/StickerPage;->mSelector:Lcom/vkontakte/android/stickers/StickersView$Listener;

    return-object v0
.end method

.method private showHeader()Z
    .locals 1

    .prologue
    .line 146
    iget-object v0, p0, Lcom/vkontakte/android/stickers/StickerPage;->mData:Lcom/vkontakte/android/data/orm/StickerStockItem;

    iget-boolean v0, v0, Lcom/vkontakte/android/data/orm/StickerStockItem;->purchased:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method attachToScroll(Landroid/support/v7/widget/RecyclerView$OnScrollListener;)Lcom/vkontakte/android/stickers/StickerPage;
    .locals 0
    .param p1, "l"    # Landroid/support/v7/widget/RecyclerView$OnScrollListener;

    .prologue
    .line 62
    iput-object p1, p0, Lcom/vkontakte/android/stickers/StickerPage;->mListener:Landroid/support/v7/widget/RecyclerView$OnScrollListener;

    .line 63
    return-object p0
.end method

.method getIconURL()Ljava/lang/String;
    .locals 1

    .prologue
    .line 109
    iget-object v0, p0, Lcom/vkontakte/android/stickers/StickerPage;->mData:Lcom/vkontakte/android/data/orm/StickerStockItem;

    invoke-virtual {v0}, Lcom/vkontakte/android/data/orm/StickerStockItem;->getServerIconURL()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method getId()I
    .locals 1

    .prologue
    .line 135
    iget-object v0, p0, Lcom/vkontakte/android/stickers/StickerPage;->mData:Lcom/vkontakte/android/data/orm/StickerStockItem;

    iget v0, v0, Lcom/vkontakte/android/data/orm/StickerStockItem;->id:I

    return v0
.end method

.method getServerBackgroundURL()Ljava/lang/String;
    .locals 1

    .prologue
    .line 114
    iget-object v0, p0, Lcom/vkontakte/android/stickers/StickerPage;->mData:Lcom/vkontakte/android/data/orm/StickerStockItem;

    invoke-virtual {v0}, Lcom/vkontakte/android/data/orm/StickerStockItem;->getServerBackgroundURL()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method getTitleDrawable()Landroid/graphics/drawable/Drawable;
    .locals 1

    .prologue
    .line 103
    const/4 v0, 0x0

    return-object v0
.end method

.method getView(Landroid/content/Context;)Landroid/view/View;
    .locals 7
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v4, 0x0

    const/4 v0, 0x1

    .line 73
    iget-object v3, p0, Lcom/vkontakte/android/stickers/StickerPage;->mContentView:Lcom/vkontakte/android/stickers/WindowRecyclerView;

    if-nez v3, :cond_0

    .line 74
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v3

    const v5, 0x7f030202

    const/4 v6, 0x0

    invoke-virtual {v3, v5, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v3

    check-cast v3, Lcom/vkontakte/android/stickers/WindowRecyclerView;

    iput-object v3, p0, Lcom/vkontakte/android/stickers/StickerPage;->mContentView:Lcom/vkontakte/android/stickers/WindowRecyclerView;

    .line 76
    iget-object v3, p0, Lcom/vkontakte/android/stickers/StickerPage;->mContentView:Lcom/vkontakte/android/stickers/WindowRecyclerView;

    iget-object v5, p0, Lcom/vkontakte/android/stickers/StickerPage;->mViewToUrlProjection:Lcom/vkontakte/android/stickers/WindowRecyclerView$Callback;

    invoke-virtual {v3, v5}, Lcom/vkontakte/android/stickers/WindowRecyclerView;->init(Lcom/vkontakte/android/stickers/WindowRecyclerView$Callback;)V

    .line 77
    iget-object v3, p0, Lcom/vkontakte/android/stickers/StickerPage;->mContentView:Lcom/vkontakte/android/stickers/WindowRecyclerView;

    invoke-virtual {v3, v0}, Lcom/vkontakte/android/stickers/WindowRecyclerView;->setHasFixedSize(Z)V

    .line 78
    iget-object v3, p0, Lcom/vkontakte/android/stickers/StickerPage;->mContentView:Lcom/vkontakte/android/stickers/WindowRecyclerView;

    iget-object v5, p0, Lcom/vkontakte/android/stickers/StickerPage;->mListener:Landroid/support/v7/widget/RecyclerView$OnScrollListener;

    invoke-virtual {v3, v5}, Lcom/vkontakte/android/stickers/WindowRecyclerView;->addOnScrollListener(Landroid/support/v7/widget/RecyclerView$OnScrollListener;)V

    .line 79
    iget-object v3, p0, Lcom/vkontakte/android/stickers/StickerPage;->mContentView:Lcom/vkontakte/android/stickers/WindowRecyclerView;

    invoke-virtual {v3, v0}, Lcom/vkontakte/android/stickers/WindowRecyclerView;->setVerticalScrollBarEnabled(Z)V

    .line 81
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v3

    iget v3, v3, Landroid/content/res/Configuration;->orientation:I

    const/4 v5, 0x2

    if-ne v3, v5, :cond_1

    .line 82
    .local v0, "mLandscape":Z
    :goto_0
    if-eqz v0, :cond_2

    sget v2, Lcom/vkontakte/android/stickers/StickersConfig;->KEYBOARD_COLUMNS_COUNT_LANDSCAPE:I

    .line 84
    .local v2, "spanCount":I
    :goto_1
    new-instance v1, Landroid/support/v7/widget/GridLayoutManager;

    iget-object v3, p0, Lcom/vkontakte/android/stickers/StickerPage;->mContentView:Lcom/vkontakte/android/stickers/WindowRecyclerView;

    invoke-virtual {v3}, Lcom/vkontakte/android/stickers/WindowRecyclerView;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v1, v3, v2}, Landroid/support/v7/widget/GridLayoutManager;-><init>(Landroid/content/Context;I)V

    .line 85
    .local v1, "mLayoutManager":Landroid/support/v7/widget/GridLayoutManager;
    new-instance v3, Lcom/vkontakte/android/stickers/StickerPage$2;

    invoke-direct {v3, p0, v2}, Lcom/vkontakte/android/stickers/StickerPage$2;-><init>(Lcom/vkontakte/android/stickers/StickerPage;I)V

    invoke-virtual {v1, v3}, Landroid/support/v7/widget/GridLayoutManager;->setSpanSizeLookup(Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;)V

    .line 94
    iget-object v3, p0, Lcom/vkontakte/android/stickers/StickerPage;->mContentView:Lcom/vkontakte/android/stickers/WindowRecyclerView;

    invoke-virtual {v3, v4}, Lcom/vkontakte/android/stickers/WindowRecyclerView;->setClipToPadding(Z)V

    .line 95
    iget-object v3, p0, Lcom/vkontakte/android/stickers/StickerPage;->mContentView:Lcom/vkontakte/android/stickers/WindowRecyclerView;

    invoke-virtual {v3, v1}, Lcom/vkontakte/android/stickers/WindowRecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    .line 96
    iget-object v3, p0, Lcom/vkontakte/android/stickers/StickerPage;->mContentView:Lcom/vkontakte/android/stickers/WindowRecyclerView;

    new-instance v4, Lcom/vkontakte/android/stickers/StickerPage$Adapter;

    invoke-direct {v4, p0}, Lcom/vkontakte/android/stickers/StickerPage$Adapter;-><init>(Lcom/vkontakte/android/stickers/StickerPage;)V

    iput-object v4, p0, Lcom/vkontakte/android/stickers/StickerPage;->mAdapter:Lcom/vkontakte/android/stickers/StickerPage$Adapter;

    invoke-virtual {v3, v4}, Lcom/vkontakte/android/stickers/WindowRecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 98
    .end local v0    # "mLandscape":Z
    .end local v1    # "mLayoutManager":Landroid/support/v7/widget/GridLayoutManager;
    .end local v2    # "spanCount":I
    :cond_0
    iget-object v3, p0, Lcom/vkontakte/android/stickers/StickerPage;->mContentView:Lcom/vkontakte/android/stickers/WindowRecyclerView;

    return-object v3

    :cond_1
    move v0, v4

    .line 81
    goto :goto_0

    .line 82
    .restart local v0    # "mLandscape":Z
    :cond_2
    const/4 v2, 0x4

    goto :goto_1
.end method

.method listener(Lcom/vkontakte/android/stickers/StickersView$Listener;)Lcom/vkontakte/android/stickers/StickerPage;
    .locals 0
    .param p1, "l"    # Lcom/vkontakte/android/stickers/StickersView$Listener;

    .prologue
    .line 67
    iput-object p1, p0, Lcom/vkontakte/android/stickers/StickerPage;->mSelector:Lcom/vkontakte/android/stickers/StickersView$Listener;

    .line 68
    return-object p0
.end method

.method onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 1
    .param p1, "newConfig"    # Landroid/content/res/Configuration;

    .prologue
    .line 124
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/stickers/StickerPage;->mContentView:Lcom/vkontakte/android/stickers/WindowRecyclerView;

    .line 125
    return-void
.end method

.method releaseView()V
    .locals 1

    .prologue
    .line 119
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/stickers/StickerPage;->mContentView:Lcom/vkontakte/android/stickers/WindowRecyclerView;

    .line 120
    return-void
.end method

.method reload()V
    .locals 1

    .prologue
    .line 140
    iget-object v0, p0, Lcom/vkontakte/android/stickers/StickerPage;->mAdapter:Lcom/vkontakte/android/stickers/StickerPage$Adapter;

    if-eqz v0, :cond_0

    .line 141
    iget-object v0, p0, Lcom/vkontakte/android/stickers/StickerPage;->mAdapter:Lcom/vkontakte/android/stickers/StickerPage$Adapter;

    invoke-virtual {v0}, Lcom/vkontakte/android/stickers/StickerPage$Adapter;->notifyDataSetChanged()V

    .line 143
    :cond_0
    return-void
.end method

.method reload(Lcom/vkontakte/android/data/orm/StickerStockItem;)V
    .locals 0
    .param p1, "item"    # Lcom/vkontakte/android/data/orm/StickerStockItem;

    .prologue
    .line 129
    iput-object p1, p0, Lcom/vkontakte/android/stickers/StickerPage;->mData:Lcom/vkontakte/android/data/orm/StickerStockItem;

    .line 130
    invoke-virtual {p0}, Lcom/vkontakte/android/stickers/StickerPage;->reload()V

    .line 131
    return-void
.end method
