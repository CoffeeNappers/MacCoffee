.class public abstract Lcom/vkontakte/android/fragments/PostListFragment;
.super Lcom/vkontakte/android/fragments/CardRecyclerFragment;
.source "PostListFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/fragments/PostListFragment$ExpandTextClickListener;,
        Lcom/vkontakte/android/fragments/PostListFragment$PostDisplayItemViewHolder;,
        Lcom/vkontakte/android/fragments/PostListFragment$NewsAdapter;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/fragments/CardRecyclerFragment",
        "<",
        "Lcom/vkontakte/android/NewsEntry;",
        ">;"
    }
.end annotation


# static fields
.field private static final SPA_REQUEST_CODE:I = 0x4d2


# instance fields
.field protected adapter:Lme/grishka/appkit/views/UsableRecyclerView$Adapter;

.field private final autoPlayItems:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Lcom/vkontakte/android/media/AutoPlay;",
            ">;"
        }
    .end annotation
.end field

.field private interpolator:Lcom/vkontakte/android/ui/CubicBezierInterpolator;

.field protected items:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/ui/posts/PostDisplayItem;",
            ">;"
        }
    .end annotation
.end field

.field lastCenterOwnerId:I

.field lastCenterPostId:I

.field lastTrackCode:Ljava/lang/String;

.field protected menuClickListener:Landroid/view/View$OnClickListener;

.field private newsEntryToBeRemovedAfterReport:Lcom/vkontakte/android/NewsEntry;

.field protected offset:I

.field private receiver:Landroid/content/BroadcastReceiver;

.field private runningAnims:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/animation/Animator;",
            ">;"
        }
    .end annotation
.end field

.field startTime:J

.field private viewHelper:Lcom/vkontakte/android/media/VideoRecyclerViewHelper;


# direct methods
.method public constructor <init>()V
    .locals 11

    .prologue
    const/4 v10, 0x0

    .line 152
    const/16 v0, 0xa

    invoke-direct {p0, v0}, Lcom/vkontakte/android/fragments/CardRecyclerFragment;-><init>(I)V

    .line 98
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/PostListFragment;->items:Ljava/util/ArrayList;

    .line 100
    new-instance v1, Lcom/vkontakte/android/ui/CubicBezierInterpolator;

    const-wide/16 v2, 0x0

    const-wide v4, 0x3fe1eb851eb851ecL    # 0.56

    const-wide v6, 0x3fe2e147ae147ae1L    # 0.59

    const-wide/high16 v8, 0x3ff0000000000000L    # 1.0

    invoke-direct/range {v1 .. v9}, Lcom/vkontakte/android/ui/CubicBezierInterpolator;-><init>(DDDD)V

    iput-object v1, p0, Lcom/vkontakte/android/fragments/PostListFragment;->interpolator:Lcom/vkontakte/android/ui/CubicBezierInterpolator;

    .line 101
    invoke-static {p0}, Lcom/vkontakte/android/fragments/PostListFragment$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/fragments/PostListFragment;)Landroid/view/View$OnClickListener;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/PostListFragment;->menuClickListener:Landroid/view/View$OnClickListener;

    .line 102
    iput v10, p0, Lcom/vkontakte/android/fragments/PostListFragment;->offset:I

    .line 106
    new-instance v0, Lcom/vkontakte/android/fragments/PostListFragment$1;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/PostListFragment$1;-><init>(Lcom/vkontakte/android/fragments/PostListFragment;)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/PostListFragment;->receiver:Landroid/content/BroadcastReceiver;

    .line 147
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/PostListFragment;->runningAnims:Ljava/util/ArrayList;

    .line 148
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/PostListFragment;->autoPlayItems:Landroid/util/SparseArray;

    .line 289
    iput v10, p0, Lcom/vkontakte/android/fragments/PostListFragment;->lastCenterOwnerId:I

    .line 290
    iput v10, p0, Lcom/vkontakte/android/fragments/PostListFragment;->lastCenterPostId:I

    .line 291
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/PostListFragment;->lastTrackCode:Ljava/lang/String;

    .line 292
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/vkontakte/android/fragments/PostListFragment;->startTime:J

    .line 153
    return-void
.end method

.method public constructor <init>(I)V
    .locals 11
    .param p1, "layoutId"    # I

    .prologue
    const/4 v10, 0x0

    .line 156
    const/16 v0, 0xa

    invoke-direct {p0, p1, v0}, Lcom/vkontakte/android/fragments/CardRecyclerFragment;-><init>(II)V

    .line 98
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/PostListFragment;->items:Ljava/util/ArrayList;

    .line 100
    new-instance v1, Lcom/vkontakte/android/ui/CubicBezierInterpolator;

    const-wide/16 v2, 0x0

    const-wide v4, 0x3fe1eb851eb851ecL    # 0.56

    const-wide v6, 0x3fe2e147ae147ae1L    # 0.59

    const-wide/high16 v8, 0x3ff0000000000000L    # 1.0

    invoke-direct/range {v1 .. v9}, Lcom/vkontakte/android/ui/CubicBezierInterpolator;-><init>(DDDD)V

    iput-object v1, p0, Lcom/vkontakte/android/fragments/PostListFragment;->interpolator:Lcom/vkontakte/android/ui/CubicBezierInterpolator;

    .line 101
    invoke-static {p0}, Lcom/vkontakte/android/fragments/PostListFragment$$Lambda$2;->lambdaFactory$(Lcom/vkontakte/android/fragments/PostListFragment;)Landroid/view/View$OnClickListener;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/PostListFragment;->menuClickListener:Landroid/view/View$OnClickListener;

    .line 102
    iput v10, p0, Lcom/vkontakte/android/fragments/PostListFragment;->offset:I

    .line 106
    new-instance v0, Lcom/vkontakte/android/fragments/PostListFragment$1;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/PostListFragment$1;-><init>(Lcom/vkontakte/android/fragments/PostListFragment;)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/PostListFragment;->receiver:Landroid/content/BroadcastReceiver;

    .line 147
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/PostListFragment;->runningAnims:Ljava/util/ArrayList;

    .line 148
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/PostListFragment;->autoPlayItems:Landroid/util/SparseArray;

    .line 289
    iput v10, p0, Lcom/vkontakte/android/fragments/PostListFragment;->lastCenterOwnerId:I

    .line 290
    iput v10, p0, Lcom/vkontakte/android/fragments/PostListFragment;->lastCenterPostId:I

    .line 291
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/PostListFragment;->lastTrackCode:Ljava/lang/String;

    .line 292
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/vkontakte/android/fragments/PostListFragment;->startTime:J

    .line 157
    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/fragments/PostListFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/PostListFragment;

    .prologue
    .line 94
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostListFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$100(Lcom/vkontakte/android/fragments/PostListFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/PostListFragment;

    .prologue
    .line 94
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostListFragment;->preloadedData:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$1000(Lcom/vkontakte/android/fragments/PostListFragment;)Lme/grishka/appkit/views/UsableRecyclerView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/PostListFragment;

    .prologue
    .line 94
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostListFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    return-object v0
.end method

.method static synthetic access$1100(Lcom/vkontakte/android/fragments/PostListFragment;)Lme/grishka/appkit/views/UsableRecyclerView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/PostListFragment;

    .prologue
    .line 94
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostListFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    return-object v0
.end method

.method static synthetic access$1200(Lcom/vkontakte/android/fragments/PostListFragment;)Lme/grishka/appkit/views/UsableRecyclerView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/PostListFragment;

    .prologue
    .line 94
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostListFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    return-object v0
.end method

.method static synthetic access$1300(Lcom/vkontakte/android/fragments/PostListFragment;)Lme/grishka/appkit/views/UsableRecyclerView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/PostListFragment;

    .prologue
    .line 94
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostListFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    return-object v0
.end method

.method static synthetic access$1400(Lcom/vkontakte/android/fragments/PostListFragment;)Lcom/vkontakte/android/ui/CubicBezierInterpolator;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/PostListFragment;

    .prologue
    .line 94
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostListFragment;->interpolator:Lcom/vkontakte/android/ui/CubicBezierInterpolator;

    return-object v0
.end method

.method static synthetic access$1500(Lcom/vkontakte/android/fragments/PostListFragment;)Lme/grishka/appkit/views/UsableRecyclerView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/PostListFragment;

    .prologue
    .line 94
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostListFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    return-object v0
.end method

.method static synthetic access$1600(Lcom/vkontakte/android/fragments/PostListFragment;)Lme/grishka/appkit/views/UsableRecyclerView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/PostListFragment;

    .prologue
    .line 94
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostListFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    return-object v0
.end method

.method static synthetic access$1700(Lcom/vkontakte/android/fragments/PostListFragment;)Lme/grishka/appkit/views/UsableRecyclerView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/PostListFragment;

    .prologue
    .line 94
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostListFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    return-object v0
.end method

.method static synthetic access$1800(Lcom/vkontakte/android/fragments/PostListFragment;)Lcom/vkontakte/android/media/VideoRecyclerViewHelper;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/PostListFragment;

    .prologue
    .line 94
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostListFragment;->viewHelper:Lcom/vkontakte/android/media/VideoRecyclerViewHelper;

    return-object v0
.end method

.method static synthetic access$1900(Lcom/vkontakte/android/fragments/PostListFragment;)Landroid/util/SparseArray;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/PostListFragment;

    .prologue
    .line 94
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostListFragment;->autoPlayItems:Landroid/util/SparseArray;

    return-object v0
.end method

.method static synthetic access$200(Lcom/vkontakte/android/fragments/PostListFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/PostListFragment;

    .prologue
    .line 94
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostListFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$2000(Lcom/vkontakte/android/fragments/PostListFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/PostListFragment;

    .prologue
    .line 94
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostListFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$300(Lcom/vkontakte/android/fragments/PostListFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/PostListFragment;

    .prologue
    .line 94
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostListFragment;->preloadedData:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$401(Lcom/vkontakte/android/fragments/PostListFragment;Ljava/util/List;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/PostListFragment;
    .param p1, "x1"    # Ljava/util/List;
    .param p2, "x2"    # Z

    .prologue
    .line 94
    invoke-super {p0, p1, p2}, Lcom/vkontakte/android/fragments/CardRecyclerFragment;->onDataLoaded(Ljava/util/List;Z)V

    return-void
.end method

.method static synthetic access$500(Lcom/vkontakte/android/fragments/PostListFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/PostListFragment;

    .prologue
    .line 94
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostListFragment;->runningAnims:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$600(Lcom/vkontakte/android/fragments/PostListFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/PostListFragment;

    .prologue
    .line 94
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/PostListFragment;->animateItemsIn()V

    return-void
.end method

.method static synthetic access$700(Lcom/vkontakte/android/fragments/PostListFragment;)Lme/grishka/appkit/views/UsableRecyclerView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/PostListFragment;

    .prologue
    .line 94
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostListFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    return-object v0
.end method

.method static synthetic access$800(Lcom/vkontakte/android/fragments/PostListFragment;)Lme/grishka/appkit/views/UsableRecyclerView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/PostListFragment;

    .prologue
    .line 94
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostListFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    return-object v0
.end method

.method static synthetic access$900(Lcom/vkontakte/android/fragments/PostListFragment;)Lme/grishka/appkit/views/UsableRecyclerView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/PostListFragment;

    .prologue
    .line 94
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostListFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    return-object v0
.end method

.method private animateItemsIn()V
    .locals 2

    .prologue
    .line 920
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostListFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    if-nez v0, :cond_0

    .line 998
    :goto_0
    return-void

    .line 923
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostListFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v0}, Lme/grishka/appkit/views/UsableRecyclerView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    new-instance v1, Lcom/vkontakte/android/fragments/PostListFragment$7;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/fragments/PostListFragment$7;-><init>(Lcom/vkontakte/android/fragments/PostListFragment;)V

    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    goto :goto_0
.end method

.method private attachExpandListeners(Lcom/vkontakte/android/NewsEntry;Ljava/util/List;)Ljava/util/List;
    .locals 8
    .param p1, "entry"    # Lcom/vkontakte/android/NewsEntry;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vkontakte/android/NewsEntry;",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/ui/posts/PostDisplayItem;",
            ">;)",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/ui/posts/PostDisplayItem;",
            ">;"
        }
    .end annotation

    .prologue
    .local p2, "items":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/ui/posts/PostDisplayItem;>;"
    const/4 v7, 0x0

    .line 860
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_0
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/ui/posts/PostDisplayItem;

    .line 861
    .local v0, "item":Lcom/vkontakte/android/ui/posts/PostDisplayItem;
    instance-of v3, v0, Lcom/vkontakte/android/ui/posts/TextPostDisplayItem;

    if-eqz v3, :cond_0

    move-object v2, v0

    .line 862
    check-cast v2, Lcom/vkontakte/android/ui/posts/TextPostDisplayItem;

    .line 863
    .local v2, "text":Lcom/vkontakte/android/ui/posts/TextPostDisplayItem;
    iget-object v3, v2, Lcom/vkontakte/android/ui/posts/TextPostDisplayItem;->text:Ljava/lang/CharSequence;

    instance-of v3, v3, Landroid/text/Spannable;

    if-eqz v3, :cond_0

    .line 864
    iget-object v3, v2, Lcom/vkontakte/android/ui/posts/TextPostDisplayItem;->text:Ljava/lang/CharSequence;

    check-cast v3, Landroid/text/Spannable;

    iget-object v5, v2, Lcom/vkontakte/android/ui/posts/TextPostDisplayItem;->text:Ljava/lang/CharSequence;

    invoke-interface {v5}, Ljava/lang/CharSequence;->length()I

    move-result v5

    const-class v6, Lcom/vkontakte/android/ExpandTextSpan;

    invoke-interface {v3, v7, v5, v6}, Landroid/text/Spannable;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Lcom/vkontakte/android/ExpandTextSpan;

    .line 865
    .local v1, "spans":[Lcom/vkontakte/android/ExpandTextSpan;
    array-length v3, v1

    if-lez v3, :cond_0

    .line 866
    aget-object v3, v1, v7

    new-instance v5, Lcom/vkontakte/android/fragments/PostListFragment$ExpandTextClickListener;

    invoke-direct {v5, p0, p1, v2}, Lcom/vkontakte/android/fragments/PostListFragment$ExpandTextClickListener;-><init>(Lcom/vkontakte/android/fragments/PostListFragment;Lcom/vkontakte/android/NewsEntry;Lcom/vkontakte/android/ui/posts/TextPostDisplayItem;)V

    invoke-virtual {v3, v5}, Lcom/vkontakte/android/ExpandTextSpan;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_0

    .line 871
    .end local v0    # "item":Lcom/vkontakte/android/ui/posts/PostDisplayItem;
    .end local v1    # "spans":[Lcom/vkontakte/android/ExpandTextSpan;
    .end local v2    # "text":Lcom/vkontakte/android/ui/posts/TextPostDisplayItem;
    :cond_1
    return-object p2
.end method

.method private hideNotInteresting(Lcom/vkontakte/android/NewsEntry;)V
    .locals 4
    .param p1, "de"    # Lcom/vkontakte/android/NewsEntry;

    .prologue
    .line 759
    invoke-static {p1}, Lcom/vkontakte/android/api/newsfeed/NewsfeedIgnoreItem;->canIgnore(Lcom/vkontakte/android/NewsEntry;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 760
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostListFragment;->getListReferrer()Ljava/lang/String;

    move-result-object v0

    .line 761
    .local v0, "listReferrer":Ljava/lang/String;
    new-instance v1, Lcom/vkontakte/android/data/PostInteract;

    invoke-direct {v1, v0, p1}, Lcom/vkontakte/android/data/PostInteract;-><init>(Ljava/lang/String;Lcom/vkontakte/android/NewsEntry;)V

    sget-object v2, Lcom/vkontakte/android/data/PostInteract$Type;->hide:Lcom/vkontakte/android/data/PostInteract$Type;

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/data/PostInteract;->commit(Lcom/vkontakte/android/data/PostInteract$Type;)V

    .line 762
    new-instance v1, Lcom/vkontakte/android/api/newsfeed/NewsfeedIgnoreItem;

    invoke-direct {v1, p1, v0}, Lcom/vkontakte/android/api/newsfeed/NewsfeedIgnoreItem;-><init>(Lcom/vkontakte/android/NewsEntry;Ljava/lang/String;)V

    new-instance v2, Lcom/vkontakte/android/fragments/PostListFragment$4;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-direct {v2, p0, v3, p1}, Lcom/vkontakte/android/fragments/PostListFragment$4;-><init>(Lcom/vkontakte/android/fragments/PostListFragment;Landroid/content/Context;Lcom/vkontakte/android/NewsEntry;)V

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/api/newsfeed/NewsfeedIgnoreItem;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    .line 768
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 770
    .end local v0    # "listReferrer":Ljava/lang/String;
    :cond_0
    return-void
.end method

.method private hideSource(Lcom/vkontakte/android/NewsEntry;)V
    .locals 6
    .param p1, "de"    # Lcom/vkontakte/android/NewsEntry;

    .prologue
    const/4 v4, 0x0

    .line 773
    new-instance v2, Lcom/vkontakte/android/data/PostInteract;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostListFragment;->getListReferrer()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, p1}, Lcom/vkontakte/android/data/PostInteract;-><init>(Ljava/lang/String;Lcom/vkontakte/android/NewsEntry;)V

    sget-object v3, Lcom/vkontakte/android/data/PostInteract$Type;->hide:Lcom/vkontakte/android/data/PostInteract$Type;

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/data/PostInteract;->commit(Lcom/vkontakte/android/data/PostInteract$Type;)V

    .line 774
    iget v2, p1, Lcom/vkontakte/android/NewsEntry;->type:I

    const/16 v3, 0xb

    if-eq v2, v3, :cond_0

    iget v2, p1, Lcom/vkontakte/android/NewsEntry;->type:I

    const/16 v3, 0xc

    if-ne v2, v3, :cond_4

    .line 775
    :cond_0
    const/4 v1, 0x0

    .line 776
    .local v1, "data":Ljava/lang/String;
    iget-object v2, p1, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_1
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/attachments/Attachment;

    .line 777
    .local v0, "att":Lcom/vkontakte/android/attachments/Attachment;
    instance-of v3, v0, Lcom/vkontakte/android/attachments/ShitAttachment;

    if-eqz v3, :cond_1

    .line 778
    check-cast v0, Lcom/vkontakte/android/attachments/ShitAttachment;

    .end local v0    # "att":Lcom/vkontakte/android/attachments/Attachment;
    iget-object v1, v0, Lcom/vkontakte/android/attachments/ShitAttachment;->data:Ljava/lang/String;

    goto :goto_0

    .line 781
    :cond_2
    if-eqz v1, :cond_3

    .line 782
    new-instance v2, Lcom/vkontakte/android/api/adsint/AdsintHideAd;

    sget-object v3, Lcom/vkontakte/android/api/adsint/AdsintHideAd$ObjectType;->ad:Lcom/vkontakte/android/api/adsint/AdsintHideAd$ObjectType;

    invoke-direct {v2, v1, v3}, Lcom/vkontakte/android/api/adsint/AdsintHideAd;-><init>(Ljava/lang/String;Lcom/vkontakte/android/api/adsint/AdsintHideAd$ObjectType;)V

    invoke-virtual {v2, v4, v4}, Lcom/vkontakte/android/api/adsint/AdsintHideAd;->persist(Ljava/lang/reflect/Method;Lorg/json/JSONObject;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vkontakte/android/api/VKAPIRequest;->exec()Lcom/vkontakte/android/api/VKAPIRequest;

    .line 783
    iget v2, p1, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    iget v3, p1, Lcom/vkontakte/android/NewsEntry;->postID:I

    invoke-virtual {p0, v2, v3}, Lcom/vkontakte/android/fragments/PostListFragment;->remove(II)V

    .line 816
    .end local v1    # "data":Ljava/lang/String;
    :cond_3
    :goto_1
    return-void

    .line 787
    :cond_4
    new-instance v2, Lcom/vkontakte/android/api/newsfeed/NewsfeedAddBan;

    iget v3, p1, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostListFragment;->getListReferrer()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1}, Lcom/vkontakte/android/NewsEntry;->getTrackCode()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v2, v3, v4, v5}, Lcom/vkontakte/android/api/newsfeed/NewsfeedAddBan;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    new-instance v3, Lcom/vkontakte/android/fragments/PostListFragment$5;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-direct {v3, p0, v4, p1}, Lcom/vkontakte/android/fragments/PostListFragment$5;-><init>(Lcom/vkontakte/android/fragments/PostListFragment;Landroid/content/Context;Lcom/vkontakte/android/NewsEntry;)V

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/api/newsfeed/NewsfeedAddBan;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v2

    .line 815
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v2

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    goto :goto_1
.end method

.method static synthetic lambda$performPostAction$5(Landroid/webkit/WebView;Landroid/content/DialogInterface;)V
    .locals 0
    .param p0, "wv"    # Landroid/webkit/WebView;
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 701
    invoke-virtual {p0}, Landroid/webkit/WebView;->destroy()V

    return-void
.end method

.method private performPostAction(Ljava/lang/String;Lcom/vkontakte/android/NewsEntry;)V
    .locals 12
    .param p1, "act"    # Ljava/lang/String;
    .param p2, "e"    # Lcom/vkontakte/android/NewsEntry;

    .prologue
    .line 590
    const-string/jumbo v7, "instagram"

    invoke-virtual {v7, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 591
    new-instance v7, Landroid/content/Intent;

    const-string/jumbo v8, "android.intent.action.VIEW"

    iget-object v9, p2, Lcom/vkontakte/android/NewsEntry;->extra:Landroid/os/Bundle;

    const-string/jumbo v10, "post_source_url"

    invoke-virtual {v9, v10}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v9

    invoke-direct {v7, v8, v9}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-virtual {p0, v7}, Lcom/vkontakte/android/fragments/PostListFragment;->startActivity(Landroid/content/Intent;)V

    .line 593
    :cond_0
    const-string/jumbo v7, "link"

    invoke-virtual {v7, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 594
    const-string/jumbo v4, "https://vk.com/"

    .line 595
    .local v4, "ln":Ljava/lang/String;
    iget v7, p2, Lcom/vkontakte/android/NewsEntry;->type:I

    const/4 v8, 0x5

    if-ne v7, v8, :cond_8

    .line 596
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v8, "wall"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget v8, p2, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v8, "_"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p2, Lcom/vkontakte/android/NewsEntry;->extra:Landroid/os/Bundle;

    const-string/jumbo v9, "parent_post"

    invoke-virtual {v8, v9}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v8, "?reply="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget v8, p2, Lcom/vkontakte/android/NewsEntry;->postID:I

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 609
    :goto_0
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v7

    const-string/jumbo v8, "clipboard"

    invoke-virtual {v7, v8}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/text/ClipboardManager;

    .line 610
    .local v0, "cm":Landroid/text/ClipboardManager;
    invoke-virtual {v0, v4}, Landroid/text/ClipboardManager;->setText(Ljava/lang/CharSequence;)V

    .line 611
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v7

    const v8, 0x7f080339

    const/4 v9, 0x0

    invoke-static {v7, v8, v9}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v7

    invoke-virtual {v7}, Landroid/widget/Toast;->show()V

    .line 613
    .end local v0    # "cm":Landroid/text/ClipboardManager;
    .end local v4    # "ln":Ljava/lang/String;
    :cond_1
    const-string/jumbo v7, "hide_not_interesting"

    invoke-virtual {v7, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 614
    invoke-direct {p0, p2}, Lcom/vkontakte/android/fragments/PostListFragment;->hideNotInteresting(Lcom/vkontakte/android/NewsEntry;)V

    .line 616
    :cond_2
    const-string/jumbo v7, "hide"

    invoke-virtual {v7, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 617
    invoke-direct {p0, p2}, Lcom/vkontakte/android/fragments/PostListFragment;->hideSource(Lcom/vkontakte/android/NewsEntry;)V

    .line 619
    :cond_3
    const-string/jumbo v7, "orig"

    invoke-virtual {v7, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_6

    .line 620
    const-string/jumbo v5, "wall"

    .line 621
    .local v5, "type":Ljava/lang/String;
    iget v7, p2, Lcom/vkontakte/android/NewsEntry;->retweetType:I

    const/4 v8, 0x1

    if-ne v7, v8, :cond_4

    .line 622
    const-string/jumbo v5, "photo"

    .line 624
    :cond_4
    iget v7, p2, Lcom/vkontakte/android/NewsEntry;->retweetType:I

    const/4 v8, 0x2

    if-ne v7, v8, :cond_5

    .line 625
    const-string/jumbo v5, "video"

    .line 627
    :cond_5
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v7

    new-instance v8, Landroid/content/Intent;

    const-string/jumbo v9, "android.intent.action.VIEW"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v11, "vkontakte://vk.com/"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget v11, p2, Lcom/vkontakte/android/NewsEntry;->retweetUID:I

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string/jumbo v11, "_"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget v11, p2, Lcom/vkontakte/android/NewsEntry;->retweetOrigId:I

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v10

    invoke-direct {v8, v9, v10}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-virtual {v7, v8}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 629
    .end local v5    # "type":Ljava/lang/String;
    :cond_6
    const-string/jumbo v7, "edit"

    invoke-virtual {v7, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_f

    .line 630
    const/16 v7, 0x20

    invoke-virtual {p2, v7}, Lcom/vkontakte/android/NewsEntry;->flag(I)Z

    move-result v7

    if-eqz v7, :cond_e

    .line 631
    iget-object v7, p2, Lcom/vkontakte/android/NewsEntry;->retweetText:Ljava/lang/String;

    invoke-static {v7}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v8

    invoke-static {p2, v7, v8}, Lcom/vkontakte/android/data/Posts;->editRepostComment(Lcom/vkontakte/android/NewsEntry;Ljava/lang/String;Landroid/app/Activity;)V

    .line 703
    :cond_7
    :goto_1
    return-void

    .line 598
    .restart local v4    # "ln":Ljava/lang/String;
    :cond_8
    iget v7, p2, Lcom/vkontakte/android/NewsEntry;->type:I

    if-eqz v7, :cond_9

    iget v7, p2, Lcom/vkontakte/android/NewsEntry;->type:I

    const/16 v8, 0xc

    if-ne v7, v8, :cond_b

    .line 599
    :cond_9
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v8, "wall"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 607
    :cond_a
    :goto_2
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget v8, p2, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v8, "_"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget v8, p2, Lcom/vkontakte/android/NewsEntry;->postID:I

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    goto/16 :goto_0

    .line 600
    :cond_b
    iget v7, p2, Lcom/vkontakte/android/NewsEntry;->type:I

    const/4 v8, 0x2

    if-ne v7, v8, :cond_c

    .line 601
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v8, "video"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_2

    .line 602
    :cond_c
    iget v7, p2, Lcom/vkontakte/android/NewsEntry;->type:I

    const/4 v8, 0x1

    if-ne v7, v8, :cond_d

    .line 603
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v8, "photo"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_2

    .line 604
    :cond_d
    iget v7, p2, Lcom/vkontakte/android/NewsEntry;->type:I

    const/4 v8, 0x4

    if-ne v7, v8, :cond_a

    .line 605
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v8, "topic"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_2

    .line 634
    .end local v4    # "ln":Ljava/lang/String;
    :cond_e
    new-instance v7, Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;

    invoke-direct {v7}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;-><init>()V

    .line 635
    invoke-virtual {v7, p2}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;->attachPost(Lcom/vkontakte/android/NewsEntry;)Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;

    move-result-object v7

    const/16 v8, 0x800

    .line 636
    invoke-virtual {p2, v8}, Lcom/vkontakte/android/NewsEntry;->flag(I)Z

    move-result v8

    invoke-virtual {v7, v8}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;->isPublic(Z)Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;

    move-result-object v7

    .line 637
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v8

    invoke-virtual {v7, v8}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;->go(Landroid/content/Context;)Z

    .line 644
    :cond_f
    const-string/jumbo v7, "del"

    invoke-virtual {v7, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_10

    .line 645
    new-instance v7, Lcom/vkontakte/android/VKAlertDialog$Builder;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v8

    invoke-direct {v7, v8}, Lcom/vkontakte/android/VKAlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v8, 0x7f080176

    .line 646
    invoke-virtual {v7, v8}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v7

    const v8, 0x7f0801a3

    .line 647
    invoke-virtual {v7, v8}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v7

    const v8, 0x7f080798

    invoke-static {p0, p2}, Lcom/vkontakte/android/fragments/PostListFragment$$Lambda$6;->lambdaFactory$(Lcom/vkontakte/android/fragments/PostListFragment;Lcom/vkontakte/android/NewsEntry;)Landroid/content/DialogInterface$OnClickListener;

    move-result-object v9

    .line 648
    invoke-virtual {v7, v8, v9}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v7

    const v8, 0x7f080433

    const/4 v9, 0x0

    .line 651
    invoke-virtual {v7, v8, v9}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v7

    .line 652
    invoke-virtual {v7}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 654
    :cond_10
    const-string/jumbo v7, "report"

    invoke-virtual {v7, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_12

    .line 655
    iget v7, p2, Lcom/vkontakte/android/NewsEntry;->type:I

    const/16 v8, 0xb

    if-eq v7, v8, :cond_11

    iget v7, p2, Lcom/vkontakte/android/NewsEntry;->type:I

    const/16 v8, 0xc

    if-ne v7, v8, :cond_16

    .line 656
    :cond_11
    invoke-direct {p0, p2}, Lcom/vkontakte/android/fragments/PostListFragment;->showReportAdDialog(Lcom/vkontakte/android/NewsEntry;)V

    .line 676
    :cond_12
    :goto_3
    const-string/jumbo v7, "publish"

    invoke-virtual {v7, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_13

    .line 677
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v7

    const/4 v8, 0x0

    invoke-static {p2, v7, v8}, Lcom/vkontakte/android/data/Posts;->publishPostponed(Lcom/vkontakte/android/NewsEntry;Landroid/app/Activity;Ljava/lang/Runnable;)V

    .line 679
    :cond_13
    const-string/jumbo v7, "unsubscribe"

    invoke-virtual {v7, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_14

    .line 680
    new-instance v7, Lcom/vkontakte/android/api/newsfeed/NewsfeedUnsubscribe;

    iget v8, p2, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    iget v9, p2, Lcom/vkontakte/android/NewsEntry;->postID:I

    iget v10, p2, Lcom/vkontakte/android/NewsEntry;->type:I

    invoke-direct {v7, v8, v9, v10}, Lcom/vkontakte/android/api/newsfeed/NewsfeedUnsubscribe;-><init>(III)V

    new-instance v8, Lcom/vkontakte/android/fragments/PostListFragment$3;

    .line 681
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v9

    invoke-direct {v8, p0, v9, p2}, Lcom/vkontakte/android/fragments/PostListFragment$3;-><init>(Lcom/vkontakte/android/fragments/PostListFragment;Landroid/content/Context;Lcom/vkontakte/android/NewsEntry;)V

    invoke-virtual {v7, v8}, Lcom/vkontakte/android/api/newsfeed/NewsfeedUnsubscribe;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v7

    .line 687
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v8

    invoke-virtual {v7, v8}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v7

    .line 688
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v8

    invoke-virtual {v7, v8}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 690
    :cond_14
    const-string/jumbo v7, "fix"

    invoke-virtual {v7, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_15

    .line 691
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v7

    const/4 v8, 0x0

    invoke-static {p2, v7, v8}, Lcom/vkontakte/android/data/Posts;->toggleFixed(Lcom/vkontakte/android/NewsEntry;Landroid/app/Activity;Ljava/lang/Runnable;)V

    .line 693
    :cond_15
    const-string/jumbo v7, "ads_debug"

    invoke-virtual {v7, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_7

    .line 694
    new-instance v6, Landroid/webkit/WebView;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v7

    invoke-direct {v6, v7}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V

    .line 695
    .local v6, "wv":Landroid/webkit/WebView;
    iget-object v7, p2, Lcom/vkontakte/android/NewsEntry;->extra:Landroid/os/Bundle;

    const-string/jumbo v8, "ads_debug"

    invoke-virtual {v7, v8}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string/jumbo v8, "text/html"

    const-string/jumbo v9, "UTF-8"

    invoke-virtual {v6, v7, v8, v9}, Landroid/webkit/WebView;->loadData(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 696
    new-instance v7, Lcom/vkontakte/android/VKAlertDialog$Builder;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v8

    invoke-direct {v7, v8}, Lcom/vkontakte/android/VKAlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string/jumbo v8, "Ads Debug"

    .line 697
    invoke-virtual {v7, v8}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v7

    .line 698
    invoke-virtual {v7, v6}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v7

    const v8, 0x7f080149

    const/4 v9, 0x0

    .line 699
    invoke-virtual {v7, v8, v9}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v7

    .line 700
    invoke-virtual {v7}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    move-result-object v1

    .line 701
    .local v1, "dlg":Landroid/app/AlertDialog;
    invoke-static {v6}, Lcom/vkontakte/android/fragments/PostListFragment$$Lambda$7;->lambdaFactory$(Landroid/webkit/WebView;)Landroid/content/DialogInterface$OnDismissListener;

    move-result-object v7

    invoke-virtual {v1, v7}, Landroid/app/AlertDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    goto/16 :goto_1

    .line 658
    .end local v1    # "dlg":Landroid/app/AlertDialog;
    .end local v6    # "wv":Landroid/webkit/WebView;
    :cond_16
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostListFragment;->getListReferrer()Ljava/lang/String;

    move-result-object v3

    .line 659
    .local v3, "listReferrer":Ljava/lang/String;
    new-instance v2, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v7

    const-class v8, Lcom/vkontakte/android/ReportContentActivity;

    invoke-direct {v2, v7, v8}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 660
    .local v2, "intent":Landroid/content/Intent;
    const-string/jumbo v7, "postInteract"

    new-instance v8, Lcom/vkontakte/android/data/PostInteract;

    invoke-direct {v8, v3, p2}, Lcom/vkontakte/android/data/PostInteract;-><init>(Ljava/lang/String;Lcom/vkontakte/android/NewsEntry;)V

    invoke-virtual {v2, v7, v8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 661
    const-string/jumbo v7, "itemID"

    iget v8, p2, Lcom/vkontakte/android/NewsEntry;->postID:I

    invoke-virtual {v2, v7, v8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 662
    const-string/jumbo v7, "ownerID"

    iget v8, p2, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    invoke-virtual {v2, v7, v8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 663
    const-string/jumbo v7, "trackCode"

    invoke-virtual {p2}, Lcom/vkontakte/android/NewsEntry;->getTrackCode()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v2, v7, v8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 664
    const-string/jumbo v7, "refer"

    invoke-virtual {v2, v7, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 665
    const-string/jumbo v5, "post"

    .line 666
    .restart local v5    # "type":Ljava/lang/String;
    iget v7, p2, Lcom/vkontakte/android/NewsEntry;->type:I

    const/4 v8, 0x1

    if-ne v7, v8, :cond_17

    .line 667
    const-string/jumbo v5, "photo"

    .line 669
    :cond_17
    iget v7, p2, Lcom/vkontakte/android/NewsEntry;->type:I

    const/4 v8, 0x2

    if-ne v7, v8, :cond_18

    .line 670
    const-string/jumbo v5, "video"

    .line 672
    :cond_18
    const-string/jumbo v7, "type"

    invoke-virtual {v2, v7, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 673
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v7

    invoke-virtual {v7, v2}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_3
.end method

.method private showItemOptions(Landroid/view/View;Lcom/vkontakte/android/NewsEntry;)V
    .locals 11
    .param p1, "view"    # Landroid/view/View;
    .param p2, "e"    # Lcom/vkontakte/android/NewsEntry;

    .prologue
    const/16 v10, 0x800

    const/4 v9, 0x0

    const/16 v8, 0xc

    const/4 v7, 0x5

    const/16 v6, 0xb

    .line 517
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v4

    if-nez v4, :cond_0

    .line 587
    :goto_0
    return-void

    .line 520
    :cond_0
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 521
    .local v2, "items":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 522
    .local v0, "acts":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    iget v4, p2, Lcom/vkontakte/android/NewsEntry;->type:I

    const/4 v5, 0x6

    if-eq v4, v5, :cond_2

    iget v4, p2, Lcom/vkontakte/android/NewsEntry;->type:I

    if-eq v4, v7, :cond_2

    iget v4, p2, Lcom/vkontakte/android/NewsEntry;->type:I

    const/4 v5, 0x7

    if-eq v4, v5, :cond_2

    iget v4, p2, Lcom/vkontakte/android/NewsEntry;->type:I

    if-eq v4, v6, :cond_2

    .line 523
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostListFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f080184

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 524
    const-string/jumbo v4, "link"

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 525
    const/16 v4, 0x40

    invoke-virtual {p2, v4}, Lcom/vkontakte/android/NewsEntry;->flag(I)Z

    move-result v4

    if-nez v4, :cond_1

    iget v4, p2, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v5

    invoke-virtual {v5}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v5

    if-eq v4, v5, :cond_1

    iget v4, p2, Lcom/vkontakte/android/NewsEntry;->userID:I

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v5

    invoke-virtual {v5}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v5

    if-ne v4, v5, :cond_2

    .line 526
    :cond_1
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostListFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f08019c

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 527
    const-string/jumbo v4, "del"

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 530
    :cond_2
    iget v4, p2, Lcom/vkontakte/android/NewsEntry;->type:I

    if-ne v4, v7, :cond_3

    iget-object v4, p2, Lcom/vkontakte/android/NewsEntry;->extra:Landroid/os/Bundle;

    const-string/jumbo v5, "parent_post"

    invoke-virtual {v4, v5}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v4

    if-eqz v4, :cond_3

    .line 531
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostListFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f080184

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 532
    const-string/jumbo v4, "link"

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 534
    :cond_3
    invoke-virtual {p0, p2}, Lcom/vkontakte/android/fragments/PostListFragment;->canHideNotInterestingFromFeed(Lcom/vkontakte/android/NewsEntry;)Z

    move-result v4

    if-eqz v4, :cond_4

    iget v4, p2, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v5

    invoke-virtual {v5}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v5

    if-eq v4, v5, :cond_4

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v4

    invoke-virtual {v4}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v4

    if-lez v4, :cond_4

    .line 535
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostListFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f080309

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 536
    const-string/jumbo v4, "hide_not_interesting"

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 538
    :cond_4
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostListFragment;->canHideFromFeed()Z

    move-result v4

    if-eqz v4, :cond_5

    iget v4, p2, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v5

    invoke-virtual {v5}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v5

    if-eq v4, v5, :cond_5

    iget v4, p2, Lcom/vkontakte/android/NewsEntry;->type:I

    if-eq v4, v6, :cond_5

    iget v4, p2, Lcom/vkontakte/android/NewsEntry;->type:I

    if-eq v4, v8, :cond_5

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v4

    invoke-virtual {v4}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v4

    if-lez v4, :cond_5

    .line 539
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostListFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f080307

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 540
    const-string/jumbo v4, "hide"

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 542
    :cond_5
    const/16 v4, 0x20

    invoke-virtual {p2, v4}, Lcom/vkontakte/android/NewsEntry;->flag(I)Z

    move-result v4

    if-eqz v4, :cond_6

    iget v4, p2, Lcom/vkontakte/android/NewsEntry;->retweetOrigTime:I

    if-lez v4, :cond_6

    .line 543
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostListFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f08068f

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 544
    const-string/jumbo v4, "orig"

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 546
    :cond_6
    const/16 v4, 0x80

    invoke-virtual {p2, v4}, Lcom/vkontakte/android/NewsEntry;->flag(I)Z

    move-result v4

    if-eqz v4, :cond_8

    iget v4, p2, Lcom/vkontakte/android/NewsEntry;->type:I

    if-eq v4, v7, :cond_8

    iget v4, p2, Lcom/vkontakte/android/NewsEntry;->time:I

    const v5, 0x15180

    add-int/2addr v4, v5

    invoke-static {}, Lcom/vkontakte/android/TimeUtils;->getCurrentTime()I

    move-result v5

    if-gt v4, v5, :cond_7

    const/16 v4, 0x1000

    invoke-virtual {p2, v4}, Lcom/vkontakte/android/NewsEntry;->flag(I)Z

    move-result v4

    if-eqz v4, :cond_8

    :cond_7
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v4

    invoke-virtual {v4}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v4

    if-lez v4, :cond_8

    .line 547
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostListFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f0801c7

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 548
    const-string/jumbo v4, "edit"

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 550
    :cond_8
    invoke-virtual {p2, v10}, Lcom/vkontakte/android/NewsEntry;->flag(I)Z

    move-result v4

    if-eqz v4, :cond_9

    .line 551
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostListFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f08058a

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 552
    const-string/jumbo v4, "publish"

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 554
    :cond_9
    iget v4, p2, Lcom/vkontakte/android/NewsEntry;->platform:I

    const/16 v5, 0x8

    if-ne v4, v5, :cond_a

    .line 555
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostListFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f080485

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 556
    const-string/jumbo v4, "instagram"

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 558
    :cond_a
    const/high16 v4, 0x10000

    invoke-virtual {p2, v4}, Lcom/vkontakte/android/NewsEntry;->flag(I)Z

    move-result v4

    if-eqz v4, :cond_b

    .line 559
    const/16 v4, 0x400

    invoke-virtual {p2, v4}, Lcom/vkontakte/android/NewsEntry;->flag(I)Z

    move-result v4

    if-eqz v4, :cond_12

    const v4, 0x7f08051f

    invoke-virtual {p0, v4}, Lcom/vkontakte/android/fragments/PostListFragment;->getString(I)Ljava/lang/String;

    move-result-object v4

    :goto_1
    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 560
    const-string/jumbo v4, "fix"

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 562
    :cond_b
    iget v4, p2, Lcom/vkontakte/android/NewsEntry;->type:I

    if-eq v4, v6, :cond_c

    iget v4, p2, Lcom/vkontakte/android/NewsEntry;->type:I

    if-ne v4, v8, :cond_d

    .line 563
    :cond_c
    const v4, 0x7f080306

    invoke-virtual {p0, v4}, Lcom/vkontakte/android/fragments/PostListFragment;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 564
    const-string/jumbo v4, "hide"

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 566
    :cond_d
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v4

    invoke-virtual {v4}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v4

    if-lez v4, :cond_f

    iget v4, p2, Lcom/vkontakte/android/NewsEntry;->userID:I

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v5

    invoke-virtual {v5}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v5

    if-eq v4, v5, :cond_f

    iget v4, p2, Lcom/vkontakte/android/NewsEntry;->type:I

    if-eqz v4, :cond_e

    iget v4, p2, Lcom/vkontakte/android/NewsEntry;->type:I

    const/4 v5, 0x1

    if-eq v4, v5, :cond_e

    iget v4, p2, Lcom/vkontakte/android/NewsEntry;->type:I

    const/4 v5, 0x2

    if-eq v4, v5, :cond_e

    iget v4, p2, Lcom/vkontakte/android/NewsEntry;->type:I

    if-eq v4, v6, :cond_e

    iget v4, p2, Lcom/vkontakte/android/NewsEntry;->type:I

    if-ne v4, v8, :cond_f

    :cond_e
    const/16 v4, 0x1000

    invoke-virtual {p2, v4}, Lcom/vkontakte/android/NewsEntry;->flag(I)Z

    move-result v4

    if-nez v4, :cond_f

    invoke-virtual {p2, v10}, Lcom/vkontakte/android/NewsEntry;->flag(I)Z

    move-result v4

    if-nez v4, :cond_f

    .line 567
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostListFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f0805bd

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 568
    const-string/jumbo v4, "report"

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 570
    :cond_f
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostListFragment;->canUnsubscribe()Z

    move-result v4

    if-eqz v4, :cond_10

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v4

    invoke-virtual {v4}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v4

    if-lez v4, :cond_10

    .line 571
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostListFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f08015d

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 572
    const-string/jumbo v4, "unsubscribe"

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 574
    :cond_10
    iget-object v4, p2, Lcom/vkontakte/android/NewsEntry;->extra:Landroid/os/Bundle;

    if-eqz v4, :cond_11

    iget-object v4, p2, Lcom/vkontakte/android/NewsEntry;->extra:Landroid/os/Bundle;

    const-string/jumbo v5, "ads_debug"

    invoke-virtual {v4, v5}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_11

    .line 575
    const-string/jumbo v4, "Ads Debug"

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 576
    const-string/jumbo v4, "ads_debug"

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 578
    :cond_11
    new-instance v3, Landroid/widget/PopupMenu;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-direct {v3, v4, p1}, Landroid/widget/PopupMenu;-><init>(Landroid/content/Context;Landroid/view/View;)V

    .line 579
    .local v3, "pm":Landroid/widget/PopupMenu;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_2
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ge v1, v4, :cond_13

    .line 580
    invoke-virtual {v3}, Landroid/widget/PopupMenu;->getMenu()Landroid/view/Menu;

    move-result-object v5

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/CharSequence;

    invoke-interface {v5, v9, v1, v9, v4}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    .line 579
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 559
    .end local v1    # "i":I
    .end local v3    # "pm":Landroid/widget/PopupMenu;
    :cond_12
    const v4, 0x7f08050d

    invoke-virtual {p0, v4}, Lcom/vkontakte/android/fragments/PostListFragment;->getString(I)Ljava/lang/String;

    move-result-object v4

    goto/16 :goto_1

    .line 582
    .restart local v1    # "i":I
    .restart local v3    # "pm":Landroid/widget/PopupMenu;
    :cond_13
    invoke-static {p0, v0, p2}, Lcom/vkontakte/android/fragments/PostListFragment$$Lambda$5;->lambdaFactory$(Lcom/vkontakte/android/fragments/PostListFragment;Ljava/util/ArrayList;Lcom/vkontakte/android/NewsEntry;)Landroid/widget/PopupMenu$OnMenuItemClickListener;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/PopupMenu;->setOnMenuItemClickListener(Landroid/widget/PopupMenu$OnMenuItemClickListener;)V

    .line 586
    invoke-virtual {v3}, Landroid/widget/PopupMenu;->show()V

    goto/16 :goto_0
.end method

.method private showReportAdDialog(Lcom/vkontakte/android/NewsEntry;)V
    .locals 5
    .param p1, "e"    # Lcom/vkontakte/android/NewsEntry;

    .prologue
    .line 722
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v2

    iget-boolean v2, v2, Lcom/vkontakte/android/auth/VKAccount;->useWebAppForReportContent:Z

    if-eqz v2, :cond_3

    .line 724
    const/4 v1, 0x0

    .line 725
    .local v1, "data1":Ljava/lang/String;
    iget-object v2, p1, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/attachments/Attachment;

    .line 726
    .local v0, "att":Lcom/vkontakte/android/attachments/Attachment;
    instance-of v3, v0, Lcom/vkontakte/android/attachments/ShitAttachment;

    if-eqz v3, :cond_0

    .line 727
    check-cast v0, Lcom/vkontakte/android/attachments/ShitAttachment;

    .end local v0    # "att":Lcom/vkontakte/android/attachments/Attachment;
    iget-object v1, v0, Lcom/vkontakte/android/attachments/ShitAttachment;->data:Ljava/lang/String;

    goto :goto_0

    .line 731
    :cond_1
    if-eqz v1, :cond_2

    .line 732
    iput-object p1, p0, Lcom/vkontakte/android/fragments/PostListFragment;->newsEntryToBeRemovedAfterReport:Lcom/vkontakte/android/NewsEntry;

    .line 733
    new-instance v2, Lcom/vk/webapp/VKUIWebContainerFragment$Builder;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostListFragment;->getListReferrer()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Lcom/vk/webapp/ReportAppInputData;->getSPAUriForAd(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/vk/webapp/VKUIWebContainerFragment$Builder;-><init>(Ljava/lang/String;)V

    const/16 v3, 0x4d2

    invoke-virtual {v2, p0, v3}, Lcom/vk/webapp/VKUIWebContainerFragment$Builder;->forResult(Landroid/app/Fragment;I)Z

    .line 756
    .end local v1    # "data1":Ljava/lang/String;
    :cond_2
    :goto_1
    return-void

    .line 737
    :cond_3
    new-instance v2, Lcom/vkontakte/android/VKAlertDialog$Builder;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/vkontakte/android/VKAlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v3, 0x7f0805bd

    .line 738
    invoke-virtual {v2, v3}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const/high16 v3, 0x7f0c0000

    invoke-static {p0, p1}, Lcom/vkontakte/android/fragments/PostListFragment$$Lambda$8;->lambdaFactory$(Lcom/vkontakte/android/fragments/PostListFragment;Lcom/vkontakte/android/NewsEntry;)Landroid/content/DialogInterface$OnClickListener;

    move-result-object v4

    .line 739
    invoke-virtual {v2, v3, v4}, Landroid/app/AlertDialog$Builder;->setItems(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    .line 754
    invoke-virtual {v2}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto :goto_1
.end method


# virtual methods
.method protected canAddPost(Lcom/vkontakte/android/NewsEntry;)Z
    .locals 1
    .param p1, "post"    # Lcom/vkontakte/android/NewsEntry;

    .prologue
    .line 398
    const/4 v0, 0x0

    return v0
.end method

.method protected canHideFromFeed()Z
    .locals 1

    .prologue
    .line 374
    const/4 v0, 0x0

    return v0
.end method

.method protected canHideNotInterestingFromFeed(Lcom/vkontakte/android/NewsEntry;)Z
    .locals 1
    .param p1, "entry"    # Lcom/vkontakte/android/NewsEntry;

    .prologue
    .line 378
    const/4 v0, 0x0

    return v0
.end method

.method protected canUnsubscribe()Z
    .locals 1

    .prologue
    .line 390
    const/4 v0, 0x0

    return v0
.end method

.method protected convertItemsIndexToReal(I)I
    .locals 0
    .param p1, "index"    # I

    .prologue
    .line 1206
    return p1
.end method

.method protected bridge synthetic getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;
    .locals 1

    .prologue
    .line 94
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostListFragment;->getAdapter()Lme/grishka/appkit/views/UsableRecyclerView$Adapter;

    move-result-object v0

    return-object v0
.end method

.method protected getAdapter()Lme/grishka/appkit/views/UsableRecyclerView$Adapter;
    .locals 1

    .prologue
    .line 359
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostListFragment;->adapter:Lme/grishka/appkit/views/UsableRecyclerView$Adapter;

    if-nez v0, :cond_0

    .line 360
    new-instance v0, Lcom/vkontakte/android/fragments/PostListFragment$NewsAdapter;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/PostListFragment$NewsAdapter;-><init>(Lcom/vkontakte/android/fragments/PostListFragment;)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/PostListFragment;->adapter:Lme/grishka/appkit/views/UsableRecyclerView$Adapter;

    .line 362
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostListFragment;->adapter:Lme/grishka/appkit/views/UsableRecyclerView$Adapter;

    return-object v0
.end method

.method protected abstract getListReferrer()Ljava/lang/String;
.end method

.method protected getPostsOffset()I
    .locals 1

    .prologue
    .line 366
    const/4 v0, 0x0

    return v0
.end method

.method protected abstract getReferer()Ljava/lang/String;
.end method

.method protected isAutoload()Z
    .locals 2

    .prologue
    .line 195
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostListFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostListFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "no_autoload"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected isFeedbackStyle()Z
    .locals 1

    .prologue
    .line 386
    const/4 v0, 0x0

    return v0
.end method

.method protected isPhotosMode()Z
    .locals 1

    .prologue
    .line 394
    const/4 v0, 0x0

    return v0
.end method

.method synthetic lambda$new$0(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 101
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/NewsEntry;

    invoke-direct {p0, p1, v0}, Lcom/vkontakte/android/fragments/PostListFragment;->showItemOptions(Landroid/view/View;Lcom/vkontakte/android/NewsEntry;)V

    return-void
.end method

.method synthetic lambda$onViewCreated$1(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 220
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostListFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    if-eqz v0, :cond_0

    .line 221
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostListFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lme/grishka/appkit/views/UsableRecyclerView;->scrollToPosition(I)V

    .line 223
    :cond_0
    return-void
.end method

.method synthetic lambda$onViewCreated$2(Landroid/view/View;Landroid/graphics/Rect;)V
    .locals 11
    .param p1, "view1"    # Landroid/view/View;
    .param p2, "outRect"    # Landroid/graphics/Rect;

    .prologue
    .line 228
    iget-object v7, p0, Lcom/vkontakte/android/fragments/PostListFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v7, p1}, Lme/grishka/appkit/views/UsableRecyclerView;->getChildViewHolder(Landroid/view/View;)Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;

    move-result-object v0

    .line 229
    .local v0, "_holder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    instance-of v7, v0, Lcom/vkontakte/android/fragments/PostListFragment$PostDisplayItemViewHolder;

    if-nez v7, :cond_1

    .line 230
    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    move-result v7

    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    move-result v8

    invoke-virtual {p1}, Landroid/view/View;->getRight()I

    move-result v9

    invoke-virtual {p1}, Landroid/view/View;->getBottom()I

    move-result v10

    invoke-virtual {p2, v7, v8, v9, v10}, Landroid/graphics/Rect;->set(IIII)V

    .line 259
    :cond_0
    :goto_0
    return-void

    :cond_1
    move-object v4, v0

    .line 233
    check-cast v4, Lcom/vkontakte/android/fragments/PostListFragment$PostDisplayItemViewHolder;

    .line 234
    .local v4, "holder":Lcom/vkontakte/android/fragments/PostListFragment$PostDisplayItemViewHolder;
    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    move-result v7

    iput v7, p2, Landroid/graphics/Rect;->left:I

    .line 235
    invoke-virtual {p1}, Landroid/view/View;->getRight()I

    move-result v7

    iput v7, p2, Landroid/graphics/Rect;->right:I

    .line 236
    if-eqz v4, :cond_0

    .line 237
    const/4 v1, 0x0

    .line 238
    .local v1, "foundFirst":Z
    const/4 v6, 0x0

    .line 239
    .local v6, "insidePost":Z
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_1
    iget-object v7, p0, Lcom/vkontakte/android/fragments/PostListFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v7}, Lme/grishka/appkit/views/UsableRecyclerView;->getChildCount()I

    move-result v7

    if-ge v5, v7, :cond_6

    .line 240
    iget-object v7, p0, Lcom/vkontakte/android/fragments/PostListFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    iget-object v8, p0, Lcom/vkontakte/android/fragments/PostListFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v8, v5}, Lme/grishka/appkit/views/UsableRecyclerView;->getChildAt(I)Landroid/view/View;

    move-result-object v8

    invoke-virtual {v7, v8}, Lme/grishka/appkit/views/UsableRecyclerView;->getChildViewHolder(Landroid/view/View;)Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;

    move-result-object v3

    .line 241
    .local v3, "hh":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    instance-of v7, v3, Lcom/vkontakte/android/fragments/PostListFragment$PostDisplayItemViewHolder;

    if-nez v7, :cond_3

    .line 239
    :cond_2
    :goto_2
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    :cond_3
    move-object v2, v3

    .line 244
    check-cast v2, Lcom/vkontakte/android/fragments/PostListFragment$PostDisplayItemViewHolder;

    .line 245
    .local v2, "h":Lcom/vkontakte/android/fragments/PostListFragment$PostDisplayItemViewHolder;
    if-nez v1, :cond_4

    iget-object v7, v2, Lcom/vkontakte/android/fragments/PostListFragment$PostDisplayItemViewHolder;->item:Lcom/vkontakte/android/ui/posts/PostDisplayItem;

    iget v7, v7, Lcom/vkontakte/android/ui/posts/PostDisplayItem;->postID:I

    iget-object v8, v4, Lcom/vkontakte/android/fragments/PostListFragment$PostDisplayItemViewHolder;->item:Lcom/vkontakte/android/ui/posts/PostDisplayItem;

    iget v8, v8, Lcom/vkontakte/android/ui/posts/PostDisplayItem;->postID:I

    if-ne v7, v8, :cond_4

    iget-object v7, v2, Lcom/vkontakte/android/fragments/PostListFragment$PostDisplayItemViewHolder;->item:Lcom/vkontakte/android/ui/posts/PostDisplayItem;

    iget v7, v7, Lcom/vkontakte/android/ui/posts/PostDisplayItem;->postOwnerID:I

    iget-object v8, v4, Lcom/vkontakte/android/fragments/PostListFragment$PostDisplayItemViewHolder;->item:Lcom/vkontakte/android/ui/posts/PostDisplayItem;

    iget v8, v8, Lcom/vkontakte/android/ui/posts/PostDisplayItem;->postOwnerID:I

    if-ne v7, v8, :cond_4

    .line 246
    const/4 v1, 0x1

    .line 247
    iget-object v7, p0, Lcom/vkontakte/android/fragments/PostListFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v7, v5}, Lme/grishka/appkit/views/UsableRecyclerView;->getChildAt(I)Landroid/view/View;

    move-result-object v7

    invoke-virtual {v7}, Landroid/view/View;->getTop()I

    move-result v7

    iput v7, p2, Landroid/graphics/Rect;->top:I

    .line 248
    const/4 v6, 0x1

    goto :goto_2

    .line 249
    :cond_4
    if-eqz v6, :cond_2

    iget-object v7, v2, Lcom/vkontakte/android/fragments/PostListFragment$PostDisplayItemViewHolder;->item:Lcom/vkontakte/android/ui/posts/PostDisplayItem;

    iget v7, v7, Lcom/vkontakte/android/ui/posts/PostDisplayItem;->postID:I

    iget-object v8, v4, Lcom/vkontakte/android/fragments/PostListFragment$PostDisplayItemViewHolder;->item:Lcom/vkontakte/android/ui/posts/PostDisplayItem;

    iget v8, v8, Lcom/vkontakte/android/ui/posts/PostDisplayItem;->postID:I

    if-ne v7, v8, :cond_5

    iget-object v7, v2, Lcom/vkontakte/android/fragments/PostListFragment$PostDisplayItemViewHolder;->item:Lcom/vkontakte/android/ui/posts/PostDisplayItem;

    iget v7, v7, Lcom/vkontakte/android/ui/posts/PostDisplayItem;->postOwnerID:I

    iget-object v8, v4, Lcom/vkontakte/android/fragments/PostListFragment$PostDisplayItemViewHolder;->item:Lcom/vkontakte/android/ui/posts/PostDisplayItem;

    iget v8, v8, Lcom/vkontakte/android/ui/posts/PostDisplayItem;->postOwnerID:I

    if-eq v7, v8, :cond_2

    .line 250
    :cond_5
    const/4 v6, 0x0

    .line 251
    iget-object v7, p0, Lcom/vkontakte/android/fragments/PostListFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    add-int/lit8 v8, v5, -0x1

    invoke-virtual {v7, v8}, Lme/grishka/appkit/views/UsableRecyclerView;->getChildAt(I)Landroid/view/View;

    move-result-object v7

    invoke-virtual {v7}, Landroid/view/View;->getBottom()I

    move-result v7

    iput v7, p2, Landroid/graphics/Rect;->bottom:I

    .line 255
    .end local v2    # "h":Lcom/vkontakte/android/fragments/PostListFragment$PostDisplayItemViewHolder;
    .end local v3    # "hh":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    :cond_6
    if-eqz v6, :cond_0

    .line 256
    iget-object v7, p0, Lcom/vkontakte/android/fragments/PostListFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v7}, Lme/grishka/appkit/views/UsableRecyclerView;->getHeight()I

    move-result v7

    iput v7, p2, Landroid/graphics/Rect;->bottom:I

    goto/16 :goto_0
.end method

.method synthetic lambda$performPostAction$4(Lcom/vkontakte/android/NewsEntry;Landroid/content/DialogInterface;I)V
    .locals 1
    .param p1, "e"    # Lcom/vkontakte/android/NewsEntry;
    .param p2, "dialog"    # Landroid/content/DialogInterface;
    .param p3, "which"    # I

    .prologue
    .line 649
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/vkontakte/android/data/Posts;->deletePost(Lcom/vkontakte/android/NewsEntry;Landroid/content/Context;)V

    .line 650
    return-void
.end method

.method synthetic lambda$showItemOptions$3(Ljava/util/ArrayList;Lcom/vkontakte/android/NewsEntry;Landroid/view/MenuItem;)Z
    .locals 1
    .param p1, "acts"    # Ljava/util/ArrayList;
    .param p2, "e"    # Lcom/vkontakte/android/NewsEntry;
    .param p3, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 583
    invoke-interface {p3}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-direct {p0, v0, p2}, Lcom/vkontakte/android/fragments/PostListFragment;->performPostAction(Ljava/lang/String;Lcom/vkontakte/android/NewsEntry;)V

    .line 584
    const/4 v0, 0x1

    return v0
.end method

.method synthetic lambda$showReportAdDialog$6(Lcom/vkontakte/android/NewsEntry;Landroid/content/DialogInterface;I)V
    .locals 6
    .param p1, "e"    # Lcom/vkontakte/android/NewsEntry;
    .param p2, "dialog"    # Landroid/content/DialogInterface;
    .param p3, "which"    # I

    .prologue
    const/4 v5, 0x0

    .line 740
    const/4 v1, 0x0

    .line 741
    .local v1, "data1":Ljava/lang/String;
    iget-object v2, p1, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/attachments/Attachment;

    .line 742
    .local v0, "att":Lcom/vkontakte/android/attachments/Attachment;
    instance-of v3, v0, Lcom/vkontakte/android/attachments/ShitAttachment;

    if-eqz v3, :cond_0

    .line 743
    check-cast v0, Lcom/vkontakte/android/attachments/ShitAttachment;

    .end local v0    # "att":Lcom/vkontakte/android/attachments/Attachment;
    iget-object v1, v0, Lcom/vkontakte/android/attachments/ShitAttachment;->data:Ljava/lang/String;

    goto :goto_0

    .line 747
    :cond_1
    if-eqz v1, :cond_2

    .line 748
    new-instance v2, Lcom/vkontakte/android/data/PostInteract;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostListFragment;->getListReferrer()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, p1}, Lcom/vkontakte/android/data/PostInteract;-><init>(Ljava/lang/String;Lcom/vkontakte/android/NewsEntry;)V

    sget-object v3, Lcom/vkontakte/android/data/PostInteract$Type;->report:Lcom/vkontakte/android/data/PostInteract$Type;

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/data/PostInteract;->commit(Lcom/vkontakte/android/data/PostInteract$Type;)V

    .line 750
    new-instance v2, Lcom/vkontakte/android/api/adsint/AdsintReportAd;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostListFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0c003b

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v3

    aget-object v3, v3, p3

    invoke-direct {v2, v1, v3}, Lcom/vkontakte/android/api/adsint/AdsintReportAd;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v5, v5}, Lcom/vkontakte/android/api/adsint/AdsintReportAd;->persist(Ljava/lang/reflect/Method;Lorg/json/JSONObject;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vkontakte/android/api/VKAPIRequest;->exec()Lcom/vkontakte/android/api/VKAPIRequest;

    .line 751
    iget v2, p1, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    iget v3, p1, Lcom/vkontakte/android/NewsEntry;->postID:I

    invoke-virtual {p0, v2, v3}, Lcom/vkontakte/android/fragments/PostListFragment;->remove(II)V

    .line 752
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    const v3, 0x7f0805be

    const/4 v4, 0x0

    invoke-static {v2, v3, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    .line 754
    :cond_2
    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 2
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 707
    invoke-super {p0, p1, p2, p3}, Lcom/vkontakte/android/fragments/CardRecyclerFragment;->onActivityResult(IILandroid/content/Intent;)V

    .line 709
    const/16 v0, 0x4d2

    if-ne p2, v0, :cond_0

    .line 710
    const/4 v0, -0x1

    if-ne p2, v0, :cond_0

    .line 712
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostListFragment;->newsEntryToBeRemovedAfterReport:Lcom/vkontakte/android/NewsEntry;

    if-eqz v0, :cond_0

    .line 713
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostListFragment;->newsEntryToBeRemovedAfterReport:Lcom/vkontakte/android/NewsEntry;

    iget v0, v0, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostListFragment;->newsEntryToBeRemovedAfterReport:Lcom/vkontakte/android/NewsEntry;

    iget v1, v1, Lcom/vkontakte/android/NewsEntry;->postID:I

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/fragments/PostListFragment;->remove(II)V

    .line 714
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/PostListFragment;->newsEntryToBeRemovedAfterReport:Lcom/vkontakte/android/NewsEntry;

    .line 718
    :cond_0
    return-void
.end method

.method public onAppendItems(Ljava/util/List;)V
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/NewsEntry;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 822
    .local p1, "posts":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/NewsEntry;>;"
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v10

    .line 823
    .local v10, "itr":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/vkontakte/android/NewsEntry;>;"
    :goto_0
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 824
    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/NewsEntry;

    .line 825
    .local v0, "e":Lcom/vkontakte/android/NewsEntry;
    iget v1, v0, Lcom/vkontakte/android/NewsEntry;->type:I

    const/16 v2, 0xb

    if-eq v1, v2, :cond_0

    iget v1, v0, Lcom/vkontakte/android/NewsEntry;->type:I

    const/16 v2, 0xc

    if-ne v1, v2, :cond_3

    .line 826
    :cond_0
    iget v1, v0, Lcom/vkontakte/android/NewsEntry;->retweetOrigTime:I

    if-eqz v1, :cond_1

    iget v1, v0, Lcom/vkontakte/android/NewsEntry;->retweetOrigTime:I

    invoke-static {}, Lcom/vkontakte/android/TimeUtils;->getCurrentTime()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 827
    invoke-interface {v10}, Ljava/util/Iterator;->remove()V

    goto :goto_0

    .line 830
    :cond_1
    iget-object v1, v0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_2
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/vkontakte/android/attachments/Attachment;

    .line 831
    .local v9, "att":Lcom/vkontakte/android/attachments/Attachment;
    instance-of v2, v9, Lcom/vkontakte/android/attachments/ShitAttachment;

    if-eqz v2, :cond_2

    .line 832
    check-cast v9, Lcom/vkontakte/android/attachments/ShitAttachment;

    .end local v9    # "att":Lcom/vkontakte/android/attachments/Attachment;
    invoke-virtual {v9}, Lcom/vkontakte/android/attachments/ShitAttachment;->updateInstallationState()V

    goto :goto_1

    .line 836
    :cond_3
    iget-object v11, p0, Lcom/vkontakte/android/fragments/PostListFragment;->items:Ljava/util/ArrayList;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostListFragment;->isPhotosMode()Z

    move-result v1

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostListFragment;->getReferer()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostListFragment;->isFeedbackStyle()Z

    move-result v3

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostListFragment;->canHideFromFeed()Z

    move-result v4

    iget-object v5, p0, Lcom/vkontakte/android/fragments/PostListFragment;->menuClickListener:Landroid/view/View$OnClickListener;

    const/4 v6, 0x1

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostListFragment;->getListReferrer()Ljava/lang/String;

    move-result-object v7

    const/4 v8, 0x0

    invoke-static/range {v0 .. v8}, Lcom/vkontakte/android/data/Posts;->buildItems(Lcom/vkontakte/android/NewsEntry;ZLjava/lang/String;ZZLandroid/view/View$OnClickListener;ZLjava/lang/String;I)Ljava/util/List;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/vkontakte/android/fragments/PostListFragment;->attachExpandListeners(Lcom/vkontakte/android/NewsEntry;Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    invoke-virtual {v11, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    goto :goto_0

    .line 838
    .end local v0    # "e":Lcom/vkontakte/android/NewsEntry;
    :cond_4
    return-void
.end method

.method public onAttach(Landroid/app/Activity;)V
    .locals 1
    .param p1, "act"    # Landroid/app/Activity;

    .prologue
    .line 184
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/CardRecyclerFragment;->onAttach(Landroid/app/Activity;)V

    .line 185
    sget-object v0, Lcom/vkontakte/android/fragments/market/GoodFragment$Builder$Source;->wall:Lcom/vkontakte/android/fragments/market/GoodFragment$Builder$Source;

    invoke-static {v0}, Lcom/vkontakte/android/attachments/MarketAttachment;->setLastSource(Lcom/vkontakte/android/fragments/market/GoodFragment$Builder$Source;)V

    .line 187
    const v0, 0x7f080452

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/PostListFragment;->setEmptyText(I)V

    .line 189
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostListFragment;->isAutoload()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 190
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostListFragment;->loadData()V

    .line 192
    :cond_0
    return-void
.end method

.method public onClearItems()V
    .locals 1

    .prologue
    .line 877
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostListFragment;->items:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 878
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostListFragment;->updateList()V

    .line 879
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 5
    .param p1, "state"    # Landroid/os/Bundle;

    .prologue
    .line 161
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/CardRecyclerFragment;->onCreate(Landroid/os/Bundle;)V

    .line 162
    new-instance v1, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/vkontakte/android/fragments/PostListFragment;->viewHelper:Lcom/vkontakte/android/media/VideoRecyclerViewHelper;

    .line 163
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 164
    .local v0, "filter":Landroid/content/IntentFilter;
    const-string/jumbo v1, "com.vkontakte.android.NEW_POST_ADDED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 165
    const-string/jumbo v1, "com.vkontakte.android.POST_DELETED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 166
    const-string/jumbo v1, "com.vkontakte.android.POST_UPDATED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 167
    const-string/jumbo v1, "com.vkontakte.android.POST_REPLACED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 168
    const-string/jumbo v1, "com.vkontakte.android.RELOAD_FEED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 169
    sget-object v1, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/PostListFragment;->receiver:Landroid/content/BroadcastReceiver;

    const-string/jumbo v3, "com.vkontakte.android.permission.ACCESS_DATA"

    const/4 v4, 0x0

    invoke-virtual {v1, v2, v0, v3, v4}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;)Landroid/content/Intent;

    .line 170
    return-void
.end method

.method protected onDataLoaded(Ljava/util/List;Z)V
    .locals 10
    .param p2, "more"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/NewsEntry;",
            ">;Z)V"
        }
    .end annotation

    .prologue
    .line 883
    .local p1, "d":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/NewsEntry;>;"
    iget-boolean v7, p0, Lcom/vkontakte/android/fragments/PostListFragment;->refreshing:Z

    if-eqz v7, :cond_4

    .line 884
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 885
    .local v1, "anims":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/animation/Animator;>;"
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    iget-object v7, p0, Lcom/vkontakte/android/fragments/PostListFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v7}, Lme/grishka/appkit/views/UsableRecyclerView;->getChildCount()I

    move-result v7

    if-ge v3, v7, :cond_1

    .line 886
    iget-object v7, p0, Lcom/vkontakte/android/fragments/PostListFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v7, v3}, Lme/grishka/appkit/views/UsableRecyclerView;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 887
    .local v2, "c":Landroid/view/View;
    const v7, 0x7f100084

    invoke-virtual {v2, v7}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 888
    .local v4, "id":Ljava/lang/String;
    if-nez v4, :cond_0

    .line 885
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 891
    :cond_0
    const-string/jumbo v7, "alpha"

    const/4 v8, 0x2

    new-array v8, v8, [F

    fill-array-data v8, :array_0

    invoke-static {v2, v7, v8}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v6

    .line 892
    .local v6, "oa":Landroid/animation/ObjectAnimator;
    new-instance v7, Lcom/vkontakte/android/ui/HardwareLayerAnimatorListener;

    invoke-direct {v7}, Lcom/vkontakte/android/ui/HardwareLayerAnimatorListener;-><init>()V

    invoke-virtual {v6, v7}, Landroid/animation/ObjectAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 893
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 895
    .end local v2    # "c":Landroid/view/View;
    .end local v4    # "id":Ljava/lang/String;
    .end local v6    # "oa":Landroid/animation/ObjectAnimator;
    :cond_1
    new-instance v0, Landroid/animation/AnimatorSet;

    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 896
    .local v0, "anim":Landroid/animation/AnimatorSet;
    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->playTogether(Ljava/util/Collection;)V

    .line 897
    const-wide/16 v8, 0xc8

    invoke-virtual {v0, v8, v9}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 898
    iget-object v7, p0, Lcom/vkontakte/android/fragments/PostListFragment;->runningAnims:Ljava/util/ArrayList;

    invoke-virtual {v7, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 899
    new-instance v7, Lcom/vkontakte/android/fragments/PostListFragment$6;

    invoke-direct {v7, p0, p1, p2}, Lcom/vkontakte/android/fragments/PostListFragment$6;-><init>(Lcom/vkontakte/android/fragments/PostListFragment;Ljava/util/List;Z)V

    invoke-virtual {v0, v7}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 906
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    .line 914
    .end local v0    # "anim":Landroid/animation/AnimatorSet;
    .end local v1    # "anims":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/animation/Animator;>;"
    .end local v3    # "i":I
    :cond_2
    :goto_2
    iget-object v7, p0, Lcom/vkontakte/android/fragments/PostListFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    if-eqz v7, :cond_3

    iget-object v7, p0, Lcom/vkontakte/android/fragments/PostListFragment;->viewHelper:Lcom/vkontakte/android/media/VideoRecyclerViewHelper;

    if-eqz v7, :cond_3

    .line 915
    iget-object v7, p0, Lcom/vkontakte/android/fragments/PostListFragment;->viewHelper:Lcom/vkontakte/android/media/VideoRecyclerViewHelper;

    iget-object v8, p0, Lcom/vkontakte/android/fragments/PostListFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v7, v8}, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->onUpdate(Landroid/support/v7/widget/RecyclerView;)V

    .line 917
    :cond_3
    return-void

    .line 908
    :cond_4
    iget-object v7, p0, Lcom/vkontakte/android/fragments/PostListFragment;->data:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v7

    if-nez v7, :cond_5

    const/4 v5, 0x1

    .line 909
    .local v5, "needAnim":Z
    :goto_3
    invoke-super {p0, p1, p2}, Lcom/vkontakte/android/fragments/CardRecyclerFragment;->onDataLoaded(Ljava/util/List;Z)V

    .line 910
    if-eqz v5, :cond_2

    .line 911
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/PostListFragment;->animateItemsIn()V

    goto :goto_2

    .line 908
    .end local v5    # "needAnim":Z
    :cond_5
    const/4 v5, 0x0

    goto :goto_3

    .line 891
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public onDestroy()V
    .locals 3

    .prologue
    .line 174
    invoke-super {p0}, Lcom/vkontakte/android/fragments/CardRecyclerFragment;->onDestroy()V

    .line 175
    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostListFragment;->viewHelper:Lcom/vkontakte/android/media/VideoRecyclerViewHelper;

    invoke-virtual {v1}, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->onDestroy()V

    .line 177
    :try_start_0
    sget-object v1, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/PostListFragment;->receiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v1, v2}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 181
    :goto_0
    return-void

    .line 178
    :catch_0
    move-exception v0

    .line 179
    .local v0, "x":Ljava/lang/Exception;
    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public onDestroyView()V
    .locals 2

    .prologue
    .line 209
    invoke-super {p0}, Lcom/vkontakte/android/fragments/CardRecyclerFragment;->onDestroyView()V

    .line 210
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostListFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    if-eqz v0, :cond_0

    .line 211
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostListFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostListFragment;->viewHelper:Lcom/vkontakte/android/media/VideoRecyclerViewHelper;

    invoke-virtual {v0, v1}, Lme/grishka/appkit/views/UsableRecyclerView;->removeScrollListener(Landroid/widget/AbsListView$OnScrollListener;)V

    .line 213
    :cond_0
    return-void
.end method

.method public onDetach()V
    .locals 6

    .prologue
    .line 199
    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    move-result-object v2

    const-string/jumbo v3, "action_bar_container"

    const-string/jumbo v4, "id"

    const-string/jumbo v5, "android"

    invoke-virtual {v2, v3, v4, v5}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 200
    .local v0, "abId":I
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    .line 201
    .local v1, "actionBarView":Landroid/view/View;
    if-eqz v1, :cond_0

    .line 202
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 204
    :cond_0
    invoke-super {p0}, Lcom/vkontakte/android/fragments/CardRecyclerFragment;->onDetach()V

    .line 205
    return-void
.end method

.method public onPause()V
    .locals 2

    .prologue
    .line 313
    invoke-super {p0}, Lcom/vkontakte/android/fragments/CardRecyclerFragment;->onPause()V

    .line 314
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostListFragment;->pauseLookingCenterPost()V

    .line 315
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostListFragment;->viewHelper:Lcom/vkontakte/android/media/VideoRecyclerViewHelper;

    if-eqz v0, :cond_0

    .line 316
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostListFragment;->viewHelper:Lcom/vkontakte/android/media/VideoRecyclerViewHelper;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->onPause(Landroid/app/Activity;)V

    .line 318
    :cond_0
    return-void
.end method

.method protected onPostDeleted(Lcom/vkontakte/android/NewsEntry;)V
    .locals 0
    .param p1, "post"    # Lcom/vkontakte/android/NewsEntry;

    .prologue
    .line 371
    return-void
.end method

.method protected onPrependItems(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/NewsEntry;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 842
    .local p1, "posts":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/NewsEntry;>;"
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/vkontakte/android/fragments/PostListFragment;->onPrependItems(Ljava/util/List;I)V

    .line 843
    return-void
.end method

.method protected onPrependItems(Ljava/util/List;I)V
    .locals 11
    .param p2, "positionToAdd"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/NewsEntry;",
            ">;I)V"
        }
    .end annotation

    .prologue
    .local p1, "posts":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/NewsEntry;>;"
    const/4 v8, 0x0

    .line 848
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 849
    .local v9, "tmp":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/ui/posts/PostDisplayItem;>;"
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :goto_0
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/NewsEntry;

    .line 850
    .local v0, "e":Lcom/vkontakte/android/NewsEntry;
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostListFragment;->isPhotosMode()Z

    move-result v1

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostListFragment;->getReferer()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostListFragment;->isFeedbackStyle()Z

    move-result v3

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostListFragment;->canHideFromFeed()Z

    move-result v4

    iget-object v5, p0, Lcom/vkontakte/android/fragments/PostListFragment;->menuClickListener:Landroid/view/View$OnClickListener;

    const/4 v6, 0x1

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostListFragment;->getListReferrer()Ljava/lang/String;

    move-result-object v7

    invoke-static/range {v0 .. v8}, Lcom/vkontakte/android/data/Posts;->buildItems(Lcom/vkontakte/android/NewsEntry;ZLjava/lang/String;ZZLandroid/view/View$OnClickListener;ZLjava/lang/String;I)Ljava/util/List;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/vkontakte/android/fragments/PostListFragment;->attachExpandListeners(Lcom/vkontakte/android/NewsEntry;Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    invoke-virtual {v9, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    goto :goto_0

    .line 852
    .end local v0    # "e":Lcom/vkontakte/android/NewsEntry;
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostListFragment;->items:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lt v1, p2, :cond_1

    .line 853
    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostListFragment;->items:Ljava/util/ArrayList;

    invoke-virtual {v1, p2, v9}, Ljava/util/ArrayList;->addAll(ILjava/util/Collection;)Z

    .line 857
    :goto_1
    return-void

    .line 855
    :cond_1
    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostListFragment;->items:Ljava/util/ArrayList;

    invoke-virtual {v1, v8, v9}, Ljava/util/ArrayList;->addAll(ILjava/util/Collection;)Z

    goto :goto_1
.end method

.method public onResume()V
    .locals 7

    .prologue
    .line 322
    invoke-super {p0}, Lcom/vkontakte/android/fragments/CardRecyclerFragment;->onResume()V

    .line 323
    const/4 v4, 0x0

    invoke-virtual {p0, v4}, Lcom/vkontakte/android/fragments/PostListFragment;->resumeLookingCenterPost(Lcom/vkontakte/android/ui/posts/PostDisplayItem;)V

    .line 324
    iget-object v4, p0, Lcom/vkontakte/android/fragments/PostListFragment;->data:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_0
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/NewsEntry;

    .line 325
    .local v2, "e":Lcom/vkontakte/android/NewsEntry;
    iget v5, v2, Lcom/vkontakte/android/NewsEntry;->type:I

    const/16 v6, 0xc

    if-ne v5, v6, :cond_0

    .line 326
    iget v5, v2, Lcom/vkontakte/android/NewsEntry;->retweetOrigTime:I

    if-eqz v5, :cond_4

    iget v5, v2, Lcom/vkontakte/android/NewsEntry;->retweetOrigTime:I

    invoke-static {}, Lcom/vkontakte/android/TimeUtils;->getCurrentTime()I

    move-result v6

    if-ge v5, v6, :cond_4

    .line 327
    iget v4, v2, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    iget v5, v2, Lcom/vkontakte/android/NewsEntry;->postID:I

    invoke-virtual {p0, v4, v5}, Lcom/vkontakte/android/fragments/PostListFragment;->remove(II)V

    .line 333
    .end local v2    # "e":Lcom/vkontakte/android/NewsEntry;
    :cond_1
    iget-object v4, p0, Lcom/vkontakte/android/fragments/PostListFragment;->data:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_2
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_6

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/NewsEntry;

    .line 334
    .restart local v2    # "e":Lcom/vkontakte/android/NewsEntry;
    iget v5, v2, Lcom/vkontakte/android/NewsEntry;->type:I

    const/16 v6, 0xb

    if-ne v5, v6, :cond_2

    .line 335
    iget-object v5, v2, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .line 336
    .local v3, "itrtr":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/vkontakte/android/attachments/Attachment;>;"
    :cond_3
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_5

    .line 337
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/attachments/Attachment;

    .line 338
    .local v1, "att":Lcom/vkontakte/android/attachments/Attachment;
    instance-of v5, v1, Lcom/vkontakte/android/attachments/ShitAttachment;

    if-eqz v5, :cond_3

    move-object v0, v1

    .line 339
    check-cast v0, Lcom/vkontakte/android/attachments/ShitAttachment;

    .line 340
    .local v0, "a":Lcom/vkontakte/android/attachments/ShitAttachment;
    invoke-virtual {v0}, Lcom/vkontakte/android/attachments/ShitAttachment;->updateInstallationState()V

    .line 341
    iget v5, v0, Lcom/vkontakte/android/attachments/ShitAttachment;->timeToLive:I

    if-eqz v5, :cond_3

    iget v5, v0, Lcom/vkontakte/android/attachments/ShitAttachment;->timeToLive:I

    invoke-static {}, Lcom/vkontakte/android/TimeUtils;->getCurrentTime()I

    move-result v6

    if-ge v5, v6, :cond_3

    .line 342
    invoke-interface {v3}, Ljava/util/Iterator;->remove()V

    goto :goto_1

    .line 330
    .end local v0    # "a":Lcom/vkontakte/android/attachments/ShitAttachment;
    .end local v1    # "att":Lcom/vkontakte/android/attachments/Attachment;
    .end local v3    # "itrtr":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/vkontakte/android/attachments/Attachment;>;"
    :cond_4
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostListFragment;->updateList()V

    goto :goto_0

    .line 346
    .restart local v3    # "itrtr":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/vkontakte/android/attachments/Attachment;>;"
    :cond_5
    iget-object v5, v2, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-nez v5, :cond_2

    .line 347
    iget v4, v2, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    iget v5, v2, Lcom/vkontakte/android/NewsEntry;->postID:I

    invoke-virtual {p0, v4, v5}, Lcom/vkontakte/android/fragments/PostListFragment;->remove(II)V

    .line 352
    .end local v2    # "e":Lcom/vkontakte/android/NewsEntry;
    .end local v3    # "itrtr":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/vkontakte/android/attachments/Attachment;>;"
    :cond_6
    iget-object v4, p0, Lcom/vkontakte/android/fragments/PostListFragment;->viewHelper:Lcom/vkontakte/android/media/VideoRecyclerViewHelper;

    if-eqz v4, :cond_7

    .line 353
    iget-object v4, p0, Lcom/vkontakte/android/fragments/PostListFragment;->viewHelper:Lcom/vkontakte/android/media/VideoRecyclerViewHelper;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->onResume(Landroid/app/Activity;)V

    .line 355
    :cond_7
    return-void
.end method

.method public onScrollStarted()V
    .locals 3

    .prologue
    .line 1002
    invoke-super {p0}, Lcom/vkontakte/android/fragments/CardRecyclerFragment;->onScrollStarted()V

    .line 1003
    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostListFragment;->runningAnims:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_1

    .line 1004
    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostListFragment;->runningAnims:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/animation/Animator;

    .line 1005
    .local v0, "anim":Landroid/animation/Animator;
    invoke-virtual {v0}, Landroid/animation/Animator;->cancel()V

    goto :goto_0

    .line 1007
    .end local v0    # "anim":Landroid/animation/Animator;
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostListFragment;->runningAnims:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    .line 1009
    :cond_1
    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 217
    invoke-super {p0, p1, p2}, Lcom/vkontakte/android/fragments/CardRecyclerFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 218
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostListFragment;->getToolbar()Landroid/support/v7/widget/Toolbar;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 219
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostListFragment;->getToolbar()Landroid/support/v7/widget/Toolbar;

    move-result-object v0

    invoke-static {p0}, Lcom/vkontakte/android/fragments/PostListFragment$$Lambda$3;->lambdaFactory$(Lcom/vkontakte/android/fragments/PostListFragment;)Landroid/view/View$OnClickListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/Toolbar;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 225
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostListFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostListFragment;->viewHelper:Lcom/vkontakte/android/media/VideoRecyclerViewHelper;

    invoke-virtual {v0, v1}, Lme/grishka/appkit/views/UsableRecyclerView;->addScrollListener(Landroid/widget/AbsListView$OnScrollListener;)V

    .line 226
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostListFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lme/grishka/appkit/views/UsableRecyclerView;->setDrawSelectorOnTop(Z)V

    .line 227
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostListFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-static {p0}, Lcom/vkontakte/android/fragments/PostListFragment$$Lambda$4;->lambdaFactory$(Lcom/vkontakte/android/fragments/PostListFragment;)Lme/grishka/appkit/views/UsableRecyclerView$SelectorBoundsProvider;

    move-result-object v1

    invoke-virtual {v0, v1}, Lme/grishka/appkit/views/UsableRecyclerView;->setSelectorBoundsProvider(Lme/grishka/appkit/views/UsableRecyclerView$SelectorBoundsProvider;)V

    .line 260
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostListFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    new-instance v1, Lcom/vkontakte/android/fragments/PostListFragment$2;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/fragments/PostListFragment$2;-><init>(Lcom/vkontakte/android/fragments/PostListFragment;)V

    invoke-virtual {v0, v1}, Lme/grishka/appkit/views/UsableRecyclerView;->addOnScrollListener(Landroid/support/v7/widget/RecyclerView$OnScrollListener;)V

    .line 287
    return-void
.end method

.method public pauseLookingCenterPost()V
    .locals 8

    .prologue
    .line 304
    iget v0, p0, Lcom/vkontakte/android/fragments/PostListFragment;->lastCenterOwnerId:I

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/vkontakte/android/fragments/PostListFragment;->lastCenterPostId:I

    if-eqz v0, :cond_0

    iget-wide v0, p0, Lcom/vkontakte/android/fragments/PostListFragment;->startTime:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    .line 305
    sget-object v0, Lcom/vkontakte/android/data/Analytics;->viewPostTime:Lcom/vkontakte/android/data/Analytics$ViewPostTime;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostListFragment;->getListReferrer()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/fragments/PostListFragment;->lastTrackCode:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget v4, p0, Lcom/vkontakte/android/fragments/PostListFragment;->lastCenterOwnerId:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "_"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Lcom/vkontakte/android/fragments/PostListFragment;->lastCenterPostId:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 307
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    iget-wide v6, p0, Lcom/vkontakte/android/fragments/PostListFragment;->startTime:J

    sub-long/2addr v4, v6

    long-to-int v4, v4

    .line 305
    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/vkontakte/android/data/Analytics$ViewPostTime;->addTime(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    .line 309
    :cond_0
    return-void
.end method

.method public prepend(Lcom/vkontakte/android/NewsEntry;)V
    .locals 13
    .param p1, "e"    # Lcom/vkontakte/android/NewsEntry;

    .prologue
    const/4 v8, 0x0

    .line 430
    const/4 v11, 0x0

    .local v11, "itemPos":I
    const/4 v9, 0x0

    .line 431
    .local v9, "entryPos":I
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostListFragment;->data:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostListFragment;->data:Ljava/util/ArrayList;

    invoke-virtual {v0, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/NewsEntry;

    const/16 v1, 0x400

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/NewsEntry;->flag(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 432
    add-int/lit8 v9, v9, 0x1

    .line 433
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostListFragment;->items:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/vkontakte/android/ui/posts/PostDisplayItem;

    .line 434
    .local v10, "item":Lcom/vkontakte/android/ui/posts/PostDisplayItem;
    iget v2, v10, Lcom/vkontakte/android/ui/posts/PostDisplayItem;->postID:I

    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostListFragment;->data:Ljava/util/ArrayList;

    invoke-virtual {v0, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/NewsEntry;

    iget v0, v0, Lcom/vkontakte/android/NewsEntry;->postID:I

    if-eq v2, v0, :cond_1

    .line 440
    .end local v10    # "item":Lcom/vkontakte/android/ui/posts/PostDisplayItem;
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostListFragment;->data:Ljava/util/ArrayList;

    invoke-virtual {v0, v9, p1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 441
    iget v0, p0, Lcom/vkontakte/android/fragments/PostListFragment;->offset:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/vkontakte/android/fragments/PostListFragment;->offset:I

    .line 442
    iget-object v12, p0, Lcom/vkontakte/android/fragments/PostListFragment;->items:Ljava/util/ArrayList;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostListFragment;->isPhotosMode()Z

    move-result v1

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostListFragment;->getReferer()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostListFragment;->isFeedbackStyle()Z

    move-result v3

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostListFragment;->canHideFromFeed()Z

    move-result v4

    iget-object v5, p0, Lcom/vkontakte/android/fragments/PostListFragment;->menuClickListener:Landroid/view/View$OnClickListener;

    const/4 v6, 0x1

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostListFragment;->getListReferrer()Ljava/lang/String;

    move-result-object v7

    move-object v0, p1

    invoke-static/range {v0 .. v8}, Lcom/vkontakte/android/data/Posts;->buildItems(Lcom/vkontakte/android/NewsEntry;ZLjava/lang/String;ZZLandroid/view/View$OnClickListener;ZLjava/lang/String;I)Ljava/util/List;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lcom/vkontakte/android/fragments/PostListFragment;->attachExpandListeners(Lcom/vkontakte/android/NewsEntry;Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    invoke-virtual {v12, v11, v0}, Ljava/util/ArrayList;->addAll(ILjava/util/Collection;)Z

    .line 443
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostListFragment;->updateList()V

    .line 444
    return-void

    .line 437
    .restart local v10    # "item":Lcom/vkontakte/android/ui/posts/PostDisplayItem;
    :cond_1
    add-int/lit8 v11, v11, 0x1

    .line 438
    goto :goto_0
.end method

.method public remove(II)V
    .locals 5
    .param p1, "oid"    # I
    .param p2, "pid"    # I

    .prologue
    .line 447
    iget-object v3, p0, Lcom/vkontakte/android/fragments/PostListFragment;->items:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 448
    .local v2, "itr":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/vkontakte/android/ui/posts/PostDisplayItem;>;"
    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 449
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/ui/posts/PostDisplayItem;

    .line 450
    .local v1, "item":Lcom/vkontakte/android/ui/posts/PostDisplayItem;
    iget v3, v1, Lcom/vkontakte/android/ui/posts/PostDisplayItem;->postID:I

    if-ne v3, p2, :cond_0

    iget v3, v1, Lcom/vkontakte/android/ui/posts/PostDisplayItem;->postOwnerID:I

    if-ne v3, p1, :cond_0

    .line 451
    invoke-interface {v2}, Ljava/util/Iterator;->remove()V

    goto :goto_0

    .line 454
    .end local v1    # "item":Lcom/vkontakte/android/ui/posts/PostDisplayItem;
    :cond_1
    iget-object v3, p0, Lcom/vkontakte/android/fragments/PostListFragment;->data:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_4

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/NewsEntry;

    .line 455
    .local v0, "e":Lcom/vkontakte/android/NewsEntry;
    if-eqz p1, :cond_3

    iget v4, v0, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    if-ne v4, p1, :cond_2

    :cond_3
    iget v4, v0, Lcom/vkontakte/android/NewsEntry;->postID:I

    if-ne v4, p2, :cond_2

    .line 456
    iget-object v3, p0, Lcom/vkontakte/android/fragments/PostListFragment;->data:Ljava/util/ArrayList;

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 457
    iget v3, p0, Lcom/vkontakte/android/fragments/PostListFragment;->offset:I

    add-int/lit8 v3, v3, -0x1

    iput v3, p0, Lcom/vkontakte/android/fragments/PostListFragment;->offset:I

    .line 462
    .end local v0    # "e":Lcom/vkontakte/android/NewsEntry;
    :cond_4
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostListFragment;->updateList()V

    .line 465
    return-void
.end method

.method public replace(Lcom/vkontakte/android/NewsEntry;)V
    .locals 18
    .param p1, "ne"    # Lcom/vkontakte/android/NewsEntry;

    .prologue
    .line 488
    const/4 v12, 0x0

    .line 489
    .local v12, "i":I
    const/4 v13, -0x1

    .line 490
    .local v13, "insertAt":I
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/fragments/PostListFragment;->items:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v15

    .line 491
    .local v15, "itr":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/vkontakte/android/ui/posts/PostDisplayItem;>;"
    :goto_0
    invoke-interface {v15}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 492
    invoke-interface {v15}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lcom/vkontakte/android/ui/posts/PostDisplayItem;

    .line 493
    .local v14, "item":Lcom/vkontakte/android/ui/posts/PostDisplayItem;
    iget v2, v14, Lcom/vkontakte/android/ui/posts/PostDisplayItem;->postID:I

    move-object/from16 v0, p1

    iget v3, v0, Lcom/vkontakte/android/NewsEntry;->postID:I

    if-ne v2, v3, :cond_1

    iget v2, v14, Lcom/vkontakte/android/ui/posts/PostDisplayItem;->postOwnerID:I

    move-object/from16 v0, p1

    iget v3, v0, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    if-ne v2, v3, :cond_1

    .line 494
    const/4 v2, -0x1

    if-ne v13, v2, :cond_0

    .line 495
    move v13, v12

    .line 497
    :cond_0
    invoke-interface {v15}, Ljava/util/Iterator;->remove()V

    .line 499
    :cond_1
    add-int/lit8 v12, v12, 0x1

    .line 500
    goto :goto_0

    .line 501
    .end local v14    # "item":Lcom/vkontakte/android/ui/posts/PostDisplayItem;
    :cond_2
    const/4 v2, -0x1

    if-ne v13, v2, :cond_3

    .line 514
    :goto_1
    return-void

    .line 504
    :cond_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/PostListFragment;->items:Ljava/util/ArrayList;

    move-object/from16 v16, v0

    const/4 v2, 0x0

    invoke-static {v13, v2}, Ljava/lang/Math;->max(II)I

    move-result v17

    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/fragments/PostListFragment;->isPhotosMode()Z

    move-result v3

    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/fragments/PostListFragment;->getReferer()Ljava/lang/String;

    move-result-object v4

    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/fragments/PostListFragment;->isFeedbackStyle()Z

    move-result v5

    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/fragments/PostListFragment;->canHideFromFeed()Z

    move-result v6

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/vkontakte/android/fragments/PostListFragment;->menuClickListener:Landroid/view/View$OnClickListener;

    const/4 v8, 0x1

    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/fragments/PostListFragment;->getListReferrer()Ljava/lang/String;

    move-result-object v9

    const/4 v10, 0x0

    move-object/from16 v2, p1

    invoke-static/range {v2 .. v10}, Lcom/vkontakte/android/data/Posts;->buildItems(Lcom/vkontakte/android/NewsEntry;ZLjava/lang/String;ZZLandroid/view/View$OnClickListener;ZLjava/lang/String;I)Ljava/util/List;

    move-result-object v2

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/fragments/PostListFragment;->attachExpandListeners(Lcom/vkontakte/android/NewsEntry;Ljava/util/List;)Ljava/util/List;

    move-result-object v2

    move-object/from16 v0, v16

    move/from16 v1, v17

    invoke-virtual {v0, v1, v2}, Ljava/util/ArrayList;->addAll(ILjava/util/Collection;)Z

    .line 505
    const/4 v12, 0x0

    .line 506
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/fragments/PostListFragment;->data:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_5

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/vkontakte/android/NewsEntry;

    .line 507
    .local v11, "e":Lcom/vkontakte/android/NewsEntry;
    move-object/from16 v0, p1

    iget v3, v0, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    if-eqz v3, :cond_4

    iget v3, v11, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    move-object/from16 v0, p1

    iget v4, v0, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    if-ne v3, v4, :cond_6

    :cond_4
    iget v3, v11, Lcom/vkontakte/android/NewsEntry;->postID:I

    move-object/from16 v0, p1

    iget v4, v0, Lcom/vkontakte/android/NewsEntry;->postID:I

    if-ne v3, v4, :cond_6

    .line 508
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/vkontakte/android/fragments/PostListFragment;->data:Ljava/util/ArrayList;

    move-object/from16 v0, p1

    invoke-virtual {v2, v12, v0}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 513
    .end local v11    # "e":Lcom/vkontakte/android/NewsEntry;
    :cond_5
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/fragments/PostListFragment;->updateList()V

    goto :goto_1

    .line 511
    .restart local v11    # "e":Lcom/vkontakte/android/NewsEntry;
    :cond_6
    add-int/lit8 v12, v12, 0x1

    .line 512
    goto :goto_2
.end method

.method public resumeLookingCenterPost(Lcom/vkontakte/android/ui/posts/PostDisplayItem;)V
    .locals 2
    .param p1, "item"    # Lcom/vkontakte/android/ui/posts/PostDisplayItem;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 295
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/vkontakte/android/fragments/PostListFragment;->startTime:J

    .line 296
    if-eqz p1, :cond_0

    .line 297
    iget v0, p1, Lcom/vkontakte/android/ui/posts/PostDisplayItem;->postOwnerID:I

    iput v0, p0, Lcom/vkontakte/android/fragments/PostListFragment;->lastCenterOwnerId:I

    .line 298
    iget v0, p1, Lcom/vkontakte/android/ui/posts/PostDisplayItem;->postID:I

    iput v0, p0, Lcom/vkontakte/android/fragments/PostListFragment;->lastCenterPostId:I

    .line 299
    iget-object v0, p1, Lcom/vkontakte/android/ui/posts/PostDisplayItem;->trackCode:Ljava/lang/String;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/PostListFragment;->lastTrackCode:Ljava/lang/String;

    .line 301
    :cond_0
    return-void
.end method

.method public update(IIIIIZZ)V
    .locals 4
    .param p1, "oid"    # I
    .param p2, "pid"    # I
    .param p3, "likes"    # I
    .param p4, "comments"    # I
    .param p5, "retweets"    # I
    .param p6, "liked"    # Z
    .param p7, "retweeted"    # Z

    .prologue
    const/4 v3, -0x1

    .line 468
    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostListFragment;->data:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_5

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/NewsEntry;

    .line 469
    .local v0, "e":Lcom/vkontakte/android/NewsEntry;
    if-eqz p1, :cond_1

    iget v2, v0, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    if-ne v2, p1, :cond_0

    :cond_1
    iget v2, v0, Lcom/vkontakte/android/NewsEntry;->postID:I

    if-ne v2, p2, :cond_0

    .line 470
    iput p3, v0, Lcom/vkontakte/android/NewsEntry;->numLikes:I

    .line 471
    if-eq p4, v3, :cond_2

    .line 472
    iput p4, v0, Lcom/vkontakte/android/NewsEntry;->numComments:I

    .line 474
    :cond_2
    if-eq p5, v3, :cond_3

    .line 475
    iput p5, v0, Lcom/vkontakte/android/NewsEntry;->numRetweets:I

    .line 477
    :cond_3
    const/16 v1, 0x8

    invoke-virtual {v0, v1, p6}, Lcom/vkontakte/android/NewsEntry;->flag(IZ)V

    .line 478
    if-eq p5, v3, :cond_4

    .line 479
    const/4 v1, 0x4

    invoke-virtual {v0, v1, p7}, Lcom/vkontakte/android/NewsEntry;->flag(IZ)V

    .line 481
    :cond_4
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostListFragment;->updateList()V

    .line 485
    .end local v0    # "e":Lcom/vkontakte/android/NewsEntry;
    :cond_5
    return-void
.end method

.method public updateList()V
    .locals 7

    .prologue
    .line 403
    const/4 v1, 0x0

    .line 404
    .local v1, "i":I
    const/4 v3, 0x0

    .line 405
    .local v3, "index":I
    iget-object v5, p0, Lcom/vkontakte/android/fragments/PostListFragment;->autoPlayItems:Landroid/util/SparseArray;

    invoke-virtual {v5}, Landroid/util/SparseArray;->clear()V

    .line 406
    iget-object v5, p0, Lcom/vkontakte/android/fragments/PostListFragment;->items:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_3

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vkontakte/android/ui/posts/PostDisplayItem;

    .line 407
    .local v4, "item":Lcom/vkontakte/android/ui/posts/PostDisplayItem;
    instance-of v5, v4, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;

    if-eqz v5, :cond_0

    move-object v5, v4

    .line 408
    check-cast v5, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;

    add-int/lit8 v2, v1, 0x1

    .end local v1    # "i":I
    .local v2, "i":I
    iput v1, v5, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->listPosition:I

    move v1, v2

    .line 410
    .end local v2    # "i":I
    .restart local v1    # "i":I
    :cond_0
    instance-of v5, v4, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem;

    if-eqz v5, :cond_1

    move-object v5, v4

    .line 411
    check-cast v5, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem;

    add-int/lit8 v2, v1, 0x1

    .end local v1    # "i":I
    .restart local v2    # "i":I
    iput v1, v5, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem;->listPosition:I

    move v1, v2

    .line 413
    .end local v2    # "i":I
    .restart local v1    # "i":I
    :cond_1
    invoke-virtual {v4}, Lcom/vkontakte/android/ui/posts/PostDisplayItem;->getAutoPlayItem()Lcom/vkontakte/android/media/AutoPlay;

    move-result-object v0

    .line 414
    .local v0, "autoPlay":Lcom/vkontakte/android/media/AutoPlay;
    if-eqz v0, :cond_2

    .line 415
    iget-object v5, p0, Lcom/vkontakte/android/fragments/PostListFragment;->autoPlayItems:Landroid/util/SparseArray;

    invoke-virtual {v5, v3, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 417
    :cond_2
    add-int/lit8 v3, v3, 0x1

    .line 418
    goto :goto_0

    .line 419
    .end local v0    # "autoPlay":Lcom/vkontakte/android/media/AutoPlay;
    .end local v4    # "item":Lcom/vkontakte/android/ui/posts/PostDisplayItem;
    :cond_3
    iget-object v5, p0, Lcom/vkontakte/android/fragments/PostListFragment;->viewHelper:Lcom/vkontakte/android/media/VideoRecyclerViewHelper;

    if-eqz v5, :cond_4

    .line 420
    iget-object v5, p0, Lcom/vkontakte/android/fragments/PostListFragment;->viewHelper:Lcom/vkontakte/android/media/VideoRecyclerViewHelper;

    invoke-virtual {v5}, Lcom/vkontakte/android/media/VideoRecyclerViewHelper;->onListUpdate()V

    .line 422
    :cond_4
    invoke-super {p0}, Lcom/vkontakte/android/fragments/CardRecyclerFragment;->updateList()V

    .line 423
    return-void
.end method

.method protected useFrom()Z
    .locals 1

    .prologue
    .line 382
    const/4 v0, 0x0

    return v0
.end method
