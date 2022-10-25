.class public Lcom/vk/emoji/EmojiKeyboardView;
.super Landroid/widget/FrameLayout;
.source "EmojiKeyboardView.java"


# instance fields
.field private adapter:Lcom/vk/emoji/EmojiAdapter;

.field private emojiKeyboardListener:Lcom/vk/emoji/EmojiKeyboardListener;

.field private emojisRecyclerView:Lcom/vk/emoji/EmojiRecyclerView;

.field private fastScroller:Lcom/vk/emoji/FastScroller;

.field private headersTypeface:Landroid/graphics/Typeface;

.field private onScrollListener:Landroid/support/v7/widget/RecyclerView$OnScrollListener;

.field private final recentStore:Lcom/vk/emoji/RecentItemStore;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 5
    .param p1, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 28
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 16
    new-instance v0, Lcom/vk/emoji/RecentItemStore;

    invoke-virtual {p0}, Lcom/vk/emoji/EmojiKeyboardView;->getContext()Landroid/content/Context;

    move-result-object v1

    const-string/jumbo v2, "recents_v3"

    const/16 v3, 0x32

    const/4 v4, 0x1

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/vk/emoji/RecentItemStore;-><init>(Landroid/content/Context;Ljava/lang/String;IZ)V

    iput-object v0, p0, Lcom/vk/emoji/EmojiKeyboardView;->recentStore:Lcom/vk/emoji/RecentItemStore;

    .line 29
    invoke-direct {p0, p1}, Lcom/vk/emoji/EmojiKeyboardView;->init(Landroid/content/Context;)V

    .line 30
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 5
    .param p1, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "attrs"    # Landroid/util/AttributeSet;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 33
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 16
    new-instance v0, Lcom/vk/emoji/RecentItemStore;

    invoke-virtual {p0}, Lcom/vk/emoji/EmojiKeyboardView;->getContext()Landroid/content/Context;

    move-result-object v1

    const-string/jumbo v2, "recents_v3"

    const/16 v3, 0x32

    const/4 v4, 0x1

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/vk/emoji/RecentItemStore;-><init>(Landroid/content/Context;Ljava/lang/String;IZ)V

    iput-object v0, p0, Lcom/vk/emoji/EmojiKeyboardView;->recentStore:Lcom/vk/emoji/RecentItemStore;

    .line 34
    invoke-direct {p0, p1}, Lcom/vk/emoji/EmojiKeyboardView;->init(Landroid/content/Context;)V

    .line 35
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 5
    .param p1, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "attrs"    # Landroid/util/AttributeSet;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p3, "defStyleAttr"    # I
        .annotation build Landroid/support/annotation/AttrRes;
        .end annotation
    .end param

    .prologue
    .line 38
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 16
    new-instance v0, Lcom/vk/emoji/RecentItemStore;

    invoke-virtual {p0}, Lcom/vk/emoji/EmojiKeyboardView;->getContext()Landroid/content/Context;

    move-result-object v1

    const-string/jumbo v2, "recents_v3"

    const/16 v3, 0x32

    const/4 v4, 0x1

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/vk/emoji/RecentItemStore;-><init>(Landroid/content/Context;Ljava/lang/String;IZ)V

    iput-object v0, p0, Lcom/vk/emoji/EmojiKeyboardView;->recentStore:Lcom/vk/emoji/RecentItemStore;

    .line 39
    invoke-direct {p0, p1}, Lcom/vk/emoji/EmojiKeyboardView;->init(Landroid/content/Context;)V

    .line 40
    return-void
.end method

.method static synthetic access$000(Lcom/vk/emoji/EmojiKeyboardView;)Lcom/vk/emoji/EmojiAdapter;
    .locals 1
    .param p0, "x0"    # Lcom/vk/emoji/EmojiKeyboardView;

    .prologue
    .line 14
    iget-object v0, p0, Lcom/vk/emoji/EmojiKeyboardView;->adapter:Lcom/vk/emoji/EmojiAdapter;

    return-object v0
.end method

.method private init(Landroid/content/Context;)V
    .locals 6
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 43
    const v0, -0xf0e0e

    invoke-virtual {p0, v0}, Lcom/vk/emoji/EmojiKeyboardView;->setBackgroundColor(I)V

    .line 44
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    sget v1, Lcom/vk/emoji/R$layout;->emoji_keyboard_view:I

    invoke-virtual {v0, v1, p0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 45
    sget v0, Lcom/vk/emoji/R$id;->fast_scroller:I

    invoke-virtual {p0, v0}, Lcom/vk/emoji/EmojiKeyboardView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/emoji/FastScroller;

    iput-object v0, p0, Lcom/vk/emoji/EmojiKeyboardView;->fastScroller:Lcom/vk/emoji/FastScroller;

    .line 46
    sget v0, Lcom/vk/emoji/R$id;->rv_emoji:I

    invoke-virtual {p0, v0}, Lcom/vk/emoji/EmojiKeyboardView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/emoji/EmojiRecyclerView;

    iput-object v0, p0, Lcom/vk/emoji/EmojiKeyboardView;->emojisRecyclerView:Lcom/vk/emoji/EmojiRecyclerView;

    .line 48
    new-instance v0, Lcom/vk/emoji/EmojiAdapter;

    iget-object v2, p0, Lcom/vk/emoji/EmojiKeyboardView;->emojisRecyclerView:Lcom/vk/emoji/EmojiRecyclerView;

    iget-object v3, p0, Lcom/vk/emoji/EmojiKeyboardView;->recentStore:Lcom/vk/emoji/RecentItemStore;

    iget-object v4, p0, Lcom/vk/emoji/EmojiKeyboardView;->emojiKeyboardListener:Lcom/vk/emoji/EmojiKeyboardListener;

    iget-object v5, p0, Lcom/vk/emoji/EmojiKeyboardView;->headersTypeface:Landroid/graphics/Typeface;

    move-object v1, p1

    invoke-direct/range {v0 .. v5}, Lcom/vk/emoji/EmojiAdapter;-><init>(Landroid/content/Context;Lcom/vk/emoji/EmojiRecyclerView;Lcom/vk/emoji/RecentItemStore;Lcom/vk/emoji/EmojiKeyboardListener;Landroid/graphics/Typeface;)V

    iput-object v0, p0, Lcom/vk/emoji/EmojiKeyboardView;->adapter:Lcom/vk/emoji/EmojiAdapter;

    .line 49
    iget-object v0, p0, Lcom/vk/emoji/EmojiKeyboardView;->emojisRecyclerView:Lcom/vk/emoji/EmojiRecyclerView;

    iget-object v1, p0, Lcom/vk/emoji/EmojiKeyboardView;->adapter:Lcom/vk/emoji/EmojiAdapter;

    invoke-virtual {v0, v1}, Lcom/vk/emoji/EmojiRecyclerView;->setHeaderInfoProvider(Lcom/vk/emoji/EmojiRecyclerView$HeaderInfoProvider;)V

    .line 50
    iget-object v0, p0, Lcom/vk/emoji/EmojiKeyboardView;->emojisRecyclerView:Lcom/vk/emoji/EmojiRecyclerView;

    new-instance v1, Landroid/support/v7/widget/GridLayoutManager;

    const/4 v2, 0x1

    invoke-direct {v1, p1, v2}, Landroid/support/v7/widget/GridLayoutManager;-><init>(Landroid/content/Context;I)V

    invoke-virtual {v0, v1}, Lcom/vk/emoji/EmojiRecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    .line 51
    iget-object v0, p0, Lcom/vk/emoji/EmojiKeyboardView;->emojisRecyclerView:Lcom/vk/emoji/EmojiRecyclerView;

    iget-object v1, p0, Lcom/vk/emoji/EmojiKeyboardView;->adapter:Lcom/vk/emoji/EmojiAdapter;

    invoke-virtual {v0, v1}, Lcom/vk/emoji/EmojiRecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 52
    iget-object v0, p0, Lcom/vk/emoji/EmojiKeyboardView;->onScrollListener:Landroid/support/v7/widget/RecyclerView$OnScrollListener;

    if-eqz v0, :cond_0

    .line 53
    iget-object v0, p0, Lcom/vk/emoji/EmojiKeyboardView;->emojisRecyclerView:Lcom/vk/emoji/EmojiRecyclerView;

    iget-object v1, p0, Lcom/vk/emoji/EmojiKeyboardView;->onScrollListener:Landroid/support/v7/widget/RecyclerView$OnScrollListener;

    invoke-virtual {v0, v1}, Lcom/vk/emoji/EmojiRecyclerView;->addOnScrollListener(Landroid/support/v7/widget/RecyclerView$OnScrollListener;)V

    .line 55
    :cond_0
    iget-object v0, p0, Lcom/vk/emoji/EmojiKeyboardView;->emojisRecyclerView:Lcom/vk/emoji/EmojiRecyclerView;

    new-instance v1, Lcom/vk/emoji/EmojiKeyboardView$1;

    invoke-direct {v1, p0}, Lcom/vk/emoji/EmojiKeyboardView$1;-><init>(Lcom/vk/emoji/EmojiKeyboardView;)V

    invoke-virtual {v0, v1}, Lcom/vk/emoji/EmojiRecyclerView;->setOnSpanCountChangeListener(Lcom/vk/emoji/EmojiRecyclerView$OnSpanCountChangeListener;)V

    .line 63
    iget-object v0, p0, Lcom/vk/emoji/EmojiKeyboardView;->fastScroller:Lcom/vk/emoji/FastScroller;

    iget-object v1, p0, Lcom/vk/emoji/EmojiKeyboardView;->emojisRecyclerView:Lcom/vk/emoji/EmojiRecyclerView;

    iget-object v2, p0, Lcom/vk/emoji/EmojiKeyboardView;->adapter:Lcom/vk/emoji/EmojiAdapter;

    invoke-virtual {v0, v1, v2}, Lcom/vk/emoji/FastScroller;->setRecyclerView(Landroid/support/v7/widget/RecyclerView;Lcom/vk/emoji/ScrollPositionProvider;)V

    .line 64
    return-void
.end method


# virtual methods
.method public getFastScroller()Lcom/vk/emoji/FastScroller;
    .locals 1

    .prologue
    .line 99
    iget-object v0, p0, Lcom/vk/emoji/EmojiKeyboardView;->fastScroller:Lcom/vk/emoji/FastScroller;

    return-object v0
.end method

.method public setEmojiKeyboardListener(Lcom/vk/emoji/EmojiKeyboardListener;)V
    .locals 1
    .param p1, "emojiKeyboardListener"    # Lcom/vk/emoji/EmojiKeyboardListener;

    .prologue
    .line 84
    iput-object p1, p0, Lcom/vk/emoji/EmojiKeyboardView;->emojiKeyboardListener:Lcom/vk/emoji/EmojiKeyboardListener;

    .line 85
    iget-object v0, p0, Lcom/vk/emoji/EmojiKeyboardView;->adapter:Lcom/vk/emoji/EmojiAdapter;

    invoke-virtual {v0, p1}, Lcom/vk/emoji/EmojiAdapter;->setEmojiKeyboardListener(Lcom/vk/emoji/EmojiKeyboardListener;)V

    .line 86
    return-void
.end method

.method public setFastScrollBarColor(I)V
    .locals 1
    .param p1, "color"    # I

    .prologue
    .line 67
    iget-object v0, p0, Lcom/vk/emoji/EmojiKeyboardView;->fastScroller:Lcom/vk/emoji/FastScroller;

    invoke-virtual {v0, p1}, Lcom/vk/emoji/FastScroller;->setTrackColor(I)V

    .line 68
    return-void
.end method

.method public setFastScrollHandleColor(I)V
    .locals 1
    .param p1, "color"    # I

    .prologue
    .line 71
    iget-object v0, p0, Lcom/vk/emoji/EmojiKeyboardView;->fastScroller:Lcom/vk/emoji/FastScroller;

    invoke-virtual {v0, p1}, Lcom/vk/emoji/FastScroller;->setHandleColor(I)V

    .line 72
    return-void
.end method

.method public setFastScrollPaddingTopAndBottom(II)V
    .locals 2
    .param p1, "paddingTop"    # I
    .param p2, "paddingBottom"    # I

    .prologue
    const/4 v1, 0x0

    .line 75
    iget-object v0, p0, Lcom/vk/emoji/EmojiKeyboardView;->fastScroller:Lcom/vk/emoji/FastScroller;

    invoke-virtual {v0, v1, p1, v1, p2}, Lcom/vk/emoji/FastScroller;->setPadding(IIII)V

    .line 76
    return-void
.end method

.method public setHeadersTypeface(Landroid/graphics/Typeface;)V
    .locals 1
    .param p1, "headersTypeface"    # Landroid/graphics/Typeface;

    .prologue
    .line 79
    iput-object p1, p0, Lcom/vk/emoji/EmojiKeyboardView;->headersTypeface:Landroid/graphics/Typeface;

    .line 80
    iget-object v0, p0, Lcom/vk/emoji/EmojiKeyboardView;->adapter:Lcom/vk/emoji/EmojiAdapter;

    invoke-virtual {v0, p1}, Lcom/vk/emoji/EmojiAdapter;->setHeadersTypeface(Landroid/graphics/Typeface;)V

    .line 81
    return-void
.end method

.method public setOnScrollListener(Landroid/support/v7/widget/RecyclerView$OnScrollListener;)V
    .locals 2
    .param p1, "listener"    # Landroid/support/v7/widget/RecyclerView$OnScrollListener;

    .prologue
    .line 89
    iget-object v0, p0, Lcom/vk/emoji/EmojiKeyboardView;->emojisRecyclerView:Lcom/vk/emoji/EmojiRecyclerView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vk/emoji/EmojiKeyboardView;->onScrollListener:Landroid/support/v7/widget/RecyclerView$OnScrollListener;

    if-eqz v0, :cond_0

    .line 90
    iget-object v0, p0, Lcom/vk/emoji/EmojiKeyboardView;->emojisRecyclerView:Lcom/vk/emoji/EmojiRecyclerView;

    iget-object v1, p0, Lcom/vk/emoji/EmojiKeyboardView;->onScrollListener:Landroid/support/v7/widget/RecyclerView$OnScrollListener;

    invoke-virtual {v0, v1}, Lcom/vk/emoji/EmojiRecyclerView;->removeOnScrollListener(Landroid/support/v7/widget/RecyclerView$OnScrollListener;)V

    .line 92
    :cond_0
    iget-object v0, p0, Lcom/vk/emoji/EmojiKeyboardView;->emojisRecyclerView:Lcom/vk/emoji/EmojiRecyclerView;

    if-eqz v0, :cond_1

    .line 93
    iget-object v0, p0, Lcom/vk/emoji/EmojiKeyboardView;->emojisRecyclerView:Lcom/vk/emoji/EmojiRecyclerView;

    invoke-virtual {v0, p1}, Lcom/vk/emoji/EmojiRecyclerView;->addOnScrollListener(Landroid/support/v7/widget/RecyclerView$OnScrollListener;)V

    .line 95
    :cond_1
    iput-object p1, p0, Lcom/vk/emoji/EmojiKeyboardView;->onScrollListener:Landroid/support/v7/widget/RecyclerView$OnScrollListener;

    .line 96
    return-void
.end method

.method public updateRecents()V
    .locals 1

    .prologue
    .line 103
    iget-object v0, p0, Lcom/vk/emoji/EmojiKeyboardView;->adapter:Lcom/vk/emoji/EmojiAdapter;

    if-eqz v0, :cond_0

    .line 104
    iget-object v0, p0, Lcom/vk/emoji/EmojiKeyboardView;->adapter:Lcom/vk/emoji/EmojiAdapter;

    invoke-virtual {v0}, Lcom/vk/emoji/EmojiAdapter;->updateRecents()V

    .line 106
    :cond_0
    return-void
.end method
