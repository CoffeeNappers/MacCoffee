.class public Lcom/vkontakte/android/ui/widget/MenuListView;
.super Landroid/widget/FrameLayout;
.source "MenuListView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/ui/widget/MenuListView$MenuItem;,
        Lcom/vkontakte/android/ui/widget/MenuListView$Listener;,
        Lcom/vkontakte/android/ui/widget/MenuListView$BirthdayViewHolder;,
        Lcom/vkontakte/android/ui/widget/MenuListView$DividerViewHolder;,
        Lcom/vkontakte/android/ui/widget/MenuListView$PaddingViewHolder;,
        Lcom/vkontakte/android/ui/widget/MenuListView$UserViewHolder;,
        Lcom/vkontakte/android/ui/widget/MenuListView$SectionViewHolder;,
        Lcom/vkontakte/android/ui/widget/MenuListView$ItemViewHolder;,
        Lcom/vkontakte/android/ui/widget/MenuListView$HeaderViewHolder;,
        Lcom/vkontakte/android/ui/widget/MenuListView$MenuAdapter;
    }
.end annotation


# static fields
.field public static lastInstance:Lcom/vkontakte/android/ui/widget/MenuListView;

.field private static reminderText:Ljava/lang/CharSequence;


# instance fields
.field private adapter:Lcom/vkontakte/android/ui/widget/MenuListView$MenuAdapter;

.field private audioProgress:Landroid/widget/ProgressBar;

.field private birthdayUsers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;"
        }
    .end annotation
.end field

.field private currentItem:I

.field private expansion:F

.field private friends:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;"
        }
    .end annotation
.end field

.field private groups:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/api/Group;",
            ">;"
        }
    .end annotation
.end field

.field private headerViewHolder:Lcom/vkontakte/android/ui/widget/MenuListView$HeaderViewHolder;

.field private iconsRes:[I

.field private final isTablet:Z

.field public itemPadding:I

.field private items:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/ui/widget/MenuListView$MenuItem;",
            ">;"
        }
    .end annotation
.end field

.field private lastState:Lcom/vkontakte/android/audio/player/PlayerState;

.field public list:Lme/grishka/appkit/views/UsableRecyclerView;

.field private listSelector:Lcom/vkontakte/android/ui/drawable/PaddingDrawable;

.field private listener:Lcom/vkontakte/android/ui/widget/MenuListView$Listener;

.field private navDelegate:Lcom/vkontakte/android/ui/navigation/NavigationDelegate;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field

.field private playerListener:Lcom/vkontakte/android/audio/player/PlayerListener;

.field private playerView:Landroid/view/View;

.field private prevExpansion:F

.field private prevStatusBarHeight:I

.field private receiver:Landroid/content/BroadcastReceiver;

.field private statusBarHeight:I

.field private tabletNavIcon:Landroid/view/ViewGroup;

.field private trackImageView:Lcom/vk/music/view/ThumbsImageView;

.field private userName:Ljava/lang/String;

.field private userPhoto:Ljava/lang/String;

.field private userStatus:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 97
    const/4 v0, 0x0

    sput-object v0, Lcom/vkontakte/android/ui/widget/MenuListView;->reminderText:Ljava/lang/CharSequence;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/vkontakte/android/ui/navigation/NavigationDelegate;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "navDelegate"    # Lcom/vkontakte/android/ui/navigation/NavigationDelegate;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 252
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 88
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->items:Ljava/util/ArrayList;

    .line 90
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->groups:Ljava/util/ArrayList;

    .line 91
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->friends:Ljava/util/ArrayList;

    .line 105
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->birthdayUsers:Ljava/util/List;

    .line 106
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->lastState:Lcom/vkontakte/android/audio/player/PlayerState;

    .line 107
    const/4 v0, -0x1

    iput v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->currentItem:I

    .line 109
    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->expansion:F

    .line 111
    const/high16 v0, -0x40800000    # -1.0f

    iput v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->prevExpansion:F

    .line 113
    const/4 v0, 0x0

    iput v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->prevStatusBarHeight:I

    .line 120
    const/16 v0, 0xc

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    iput-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->iconsRes:[I

    .line 135
    new-instance v0, Lcom/vkontakte/android/ui/widget/MenuListView$1;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/ui/widget/MenuListView$1;-><init>(Lcom/vkontakte/android/ui/widget/MenuListView;)V

    iput-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->receiver:Landroid/content/BroadcastReceiver;

    .line 201
    new-instance v0, Lcom/vkontakte/android/ui/widget/MenuListView$2;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/ui/widget/MenuListView$2;-><init>(Lcom/vkontakte/android/ui/widget/MenuListView;)V

    iput-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->playerListener:Lcom/vkontakte/android/audio/player/PlayerListener;

    .line 253
    iput-object p2, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->navDelegate:Lcom/vkontakte/android/ui/navigation/NavigationDelegate;

    .line 254
    invoke-static {p1}, Lcom/vk/core/util/Screen;->isTablet(Landroid/content/Context;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->isTablet:Z

    .line 255
    invoke-direct {p0}, Lcom/vkontakte/android/ui/widget/MenuListView;->init()V

    .line 256
    return-void

    .line 120
    nop

    :array_0
    .array-data 4
        0x7f0201f2
        0x7f0201f3
        0x7f0201f0
        0x7f0201ed
        0x7f0201ec
        0x7f0201f5
        0x7f0201f9
        0x7f0201f1
        0x7f0201ee
        0x7f0201eb
        0x7f0201ef
        0x7f0201f8
    .end array-data
.end method

.method static synthetic access$000(Lcom/vkontakte/android/ui/widget/MenuListView;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/widget/MenuListView;

    .prologue
    .line 86
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->friends:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$100(Lcom/vkontakte/android/ui/widget/MenuListView;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/widget/MenuListView;

    .prologue
    .line 86
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->groups:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$1000(Lcom/vkontakte/android/ui/widget/MenuListView;)Lcom/vkontakte/android/ui/navigation/NavigationDelegate;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/widget/MenuListView;

    .prologue
    .line 86
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->navDelegate:Lcom/vkontakte/android/ui/navigation/NavigationDelegate;

    return-object v0
.end method

.method static synthetic access$1500(Lcom/vkontakte/android/ui/widget/MenuListView;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/widget/MenuListView;

    .prologue
    .line 86
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->items:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$1600(Lcom/vkontakte/android/ui/widget/MenuListView;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/widget/MenuListView;

    .prologue
    .line 86
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->birthdayUsers:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$1700(Lcom/vkontakte/android/ui/widget/MenuListView;)F
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/widget/MenuListView;

    .prologue
    .line 86
    iget v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->expansion:F

    return v0
.end method

.method static synthetic access$1802(Lcom/vkontakte/android/ui/widget/MenuListView;Lcom/vkontakte/android/ui/widget/MenuListView$HeaderViewHolder;)Lcom/vkontakte/android/ui/widget/MenuListView$HeaderViewHolder;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/ui/widget/MenuListView;
    .param p1, "x1"    # Lcom/vkontakte/android/ui/widget/MenuListView$HeaderViewHolder;

    .prologue
    .line 86
    iput-object p1, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->headerViewHolder:Lcom/vkontakte/android/ui/widget/MenuListView$HeaderViewHolder;

    return-object p1
.end method

.method static synthetic access$1900(Lcom/vkontakte/android/ui/widget/MenuListView;)I
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/widget/MenuListView;

    .prologue
    .line 86
    iget v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->statusBarHeight:I

    return v0
.end method

.method static synthetic access$200(Lcom/vkontakte/android/ui/widget/MenuListView;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/widget/MenuListView;

    .prologue
    .line 86
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->userPhoto:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$2000(Lcom/vkontakte/android/ui/widget/MenuListView;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/widget/MenuListView;

    .prologue
    .line 86
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->userStatus:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$202(Lcom/vkontakte/android/ui/widget/MenuListView;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/ui/widget/MenuListView;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 86
    iput-object p1, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->userPhoto:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$2100(Lcom/vkontakte/android/ui/widget/MenuListView;)Lcom/vkontakte/android/ui/widget/MenuListView$Listener;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/widget/MenuListView;

    .prologue
    .line 86
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->listener:Lcom/vkontakte/android/ui/widget/MenuListView$Listener;

    return-object v0
.end method

.method static synthetic access$2200(Lcom/vkontakte/android/ui/widget/MenuListView;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/widget/MenuListView;

    .prologue
    .line 86
    iget-boolean v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->isTablet:Z

    return v0
.end method

.method static synthetic access$2300(Lcom/vkontakte/android/ui/widget/MenuListView;)I
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/widget/MenuListView;

    .prologue
    .line 86
    iget v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->currentItem:I

    return v0
.end method

.method static synthetic access$2400(Lcom/vkontakte/android/ui/widget/MenuListView;)F
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/widget/MenuListView;

    .prologue
    .line 86
    iget v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->prevExpansion:F

    return v0
.end method

.method static synthetic access$2500()Ljava/lang/CharSequence;
    .locals 1

    .prologue
    .line 86
    sget-object v0, Lcom/vkontakte/android/ui/widget/MenuListView;->reminderText:Ljava/lang/CharSequence;

    return-object v0
.end method

.method static synthetic access$300(Lcom/vkontakte/android/ui/widget/MenuListView;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/widget/MenuListView;

    .prologue
    .line 86
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->userName:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$302(Lcom/vkontakte/android/ui/widget/MenuListView;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/ui/widget/MenuListView;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 86
    iput-object p1, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->userName:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$400(Lcom/vkontakte/android/ui/widget/MenuListView;)Landroid/widget/ProgressBar;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/widget/MenuListView;

    .prologue
    .line 86
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->audioProgress:Landroid/widget/ProgressBar;

    return-object v0
.end method

.method static synthetic access$500(Lcom/vkontakte/android/ui/widget/MenuListView;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/widget/MenuListView;

    .prologue
    .line 86
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->playerView:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$600(Lcom/vkontakte/android/ui/widget/MenuListView;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/ui/widget/MenuListView;

    .prologue
    .line 86
    invoke-direct {p0}, Lcom/vkontakte/android/ui/widget/MenuListView;->updateListPadding()V

    return-void
.end method

.method static synthetic access$700(Lcom/vkontakte/android/ui/widget/MenuListView;Lcom/vkontakte/android/audio/MusicTrack;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/ui/widget/MenuListView;
    .param p1, "x1"    # Lcom/vkontakte/android/audio/MusicTrack;

    .prologue
    .line 86
    invoke-direct {p0, p1}, Lcom/vkontakte/android/ui/widget/MenuListView;->updateAudioAlbumArt(Lcom/vkontakte/android/audio/MusicTrack;)V

    return-void
.end method

.method static synthetic access$800(Lcom/vkontakte/android/ui/widget/MenuListView;)Lcom/vkontakte/android/audio/player/PlayerState;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/widget/MenuListView;

    .prologue
    .line 86
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->lastState:Lcom/vkontakte/android/audio/player/PlayerState;

    return-object v0
.end method

.method static synthetic access$802(Lcom/vkontakte/android/ui/widget/MenuListView;Lcom/vkontakte/android/audio/player/PlayerState;)Lcom/vkontakte/android/audio/player/PlayerState;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/ui/widget/MenuListView;
    .param p1, "x1"    # Lcom/vkontakte/android/audio/player/PlayerState;

    .prologue
    .line 86
    iput-object p1, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->lastState:Lcom/vkontakte/android/audio/player/PlayerState;

    return-object p1
.end method

.method static synthetic access$900(Lcom/vkontakte/android/ui/widget/MenuListView;)Landroid/view/ViewGroup;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/widget/MenuListView;

    .prologue
    .line 86
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->tabletNavIcon:Landroid/view/ViewGroup;

    return-object v0
.end method

.method public static getRecommendedWidth(Landroid/content/Context;)I
    .locals 3
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 497
    const/high16 v0, 0x43960000    # 300.0f

    invoke-static {v0}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v0

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v1, v1, Landroid/util/DisplayMetrics;->widthPixels:I

    const/high16 v2, 0x42200000    # 40.0f

    invoke-static {v2}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v2

    sub-int/2addr v1, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    return v0
.end method

.method private init()V
    .locals 14

    .prologue
    .line 259
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/widget/MenuListView;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    const v10, 0x7f0c003d

    invoke-virtual {v9, v10}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v8

    .line 260
    .local v8, "titles":[Ljava/lang/String;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v9, v8

    if-ge v2, v9, :cond_0

    .line 261
    iget-object v9, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->items:Ljava/util/ArrayList;

    new-instance v10, Lcom/vkontakte/android/ui/widget/MenuListView$MenuItem;

    iget-object v11, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->iconsRes:[I

    aget v11, v11, v2

    aget-object v12, v8, v2

    invoke-direct {v10, v11, v2, v12}, Lcom/vkontakte/android/ui/widget/MenuListView$MenuItem;-><init>(IILjava/lang/String;)V

    invoke-virtual {v9, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 260
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 263
    :cond_0
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/widget/MenuListView;->getContext()Landroid/content/Context;

    move-result-object v9

    const v10, 0x7f030108

    const/4 v11, 0x0

    invoke-static {v9, v10, v11}, Lcom/vkontakte/android/ui/widget/MenuListView;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v9

    iput-object v9, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->playerView:Landroid/view/View;

    .line 264
    iget-object v9, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->playerView:Landroid/view/View;

    const v10, 0x7f10039a

    invoke-virtual {v9, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Landroid/widget/ProgressBar;

    iput-object v9, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->audioProgress:Landroid/widget/ProgressBar;

    .line 265
    iget-object v9, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->playerView:Landroid/view/View;

    const v10, 0x7f100396

    invoke-virtual {v9, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Lcom/vk/music/view/ThumbsImageView;

    iput-object v9, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->trackImageView:Lcom/vk/music/view/ThumbsImageView;

    .line 266
    new-instance v9, Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/widget/MenuListView;->getContext()Landroid/content/Context;

    move-result-object v10

    invoke-direct {v9, v10}, Lme/grishka/appkit/views/UsableRecyclerView;-><init>(Landroid/content/Context;)V

    iput-object v9, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    .line 267
    iget-object v9, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    new-instance v10, Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/widget/MenuListView;->getContext()Landroid/content/Context;

    move-result-object v11

    invoke-direct {v10, v11}, Landroid/support/v7/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    invoke-virtual {v9, v10}, Lme/grishka/appkit/views/UsableRecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    .line 268
    iget-object v9, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    new-instance v10, Lcom/vkontakte/android/ui/widget/MenuListView$MenuAdapter;

    invoke-direct {v10, p0}, Lcom/vkontakte/android/ui/widget/MenuListView$MenuAdapter;-><init>(Lcom/vkontakte/android/ui/widget/MenuListView;)V

    iput-object v10, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->adapter:Lcom/vkontakte/android/ui/widget/MenuListView$MenuAdapter;

    invoke-virtual {v9, v10}, Lme/grishka/appkit/views/UsableRecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 269
    iget-object v9, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    const/4 v10, 0x1

    invoke-virtual {v9, v10}, Lme/grishka/appkit/views/UsableRecyclerView;->setHasFixedSize(Z)V

    .line 270
    iget-object v9, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    const v10, 0x7f02013e

    invoke-virtual {v9, v10}, Lme/grishka/appkit/views/UsableRecyclerView;->setSelector(I)V

    .line 271
    iget-boolean v9, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->isTablet:Z

    if-eqz v9, :cond_1

    .line 273
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/widget/MenuListView;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    const v10, 0x7f020126

    invoke-virtual {v9, v10}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v7

    .line 274
    .local v7, "selector":Landroid/graphics/drawable/Drawable;
    new-instance v9, Lcom/vkontakte/android/ui/drawable/PaddingDrawable;

    const/high16 v10, 0x434c0000    # 204.0f

    invoke-static {v10}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v10

    invoke-direct {v9, v7, v10}, Lcom/vkontakte/android/ui/drawable/PaddingDrawable;-><init>(Landroid/graphics/drawable/Drawable;I)V

    iput-object v9, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->listSelector:Lcom/vkontakte/android/ui/drawable/PaddingDrawable;

    .line 275
    iget-object v9, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    iget-object v10, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->listSelector:Lcom/vkontakte/android/ui/drawable/PaddingDrawable;

    invoke-virtual {v9, v10}, Lme/grishka/appkit/views/UsableRecyclerView;->setSelector(Landroid/graphics/drawable/Drawable;)V

    .line 277
    .end local v7    # "selector":Landroid/graphics/drawable/Drawable;
    :cond_1
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/widget/MenuListView;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    iget-boolean v9, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->isTablet:Z

    if-eqz v9, :cond_7

    const v9, 0x7f0f005a

    :goto_1
    invoke-virtual {v10, v9}, Landroid/content/res/Resources;->getColor(I)I

    move-result v9

    invoke-virtual {p0, v9}, Lcom/vkontakte/android/ui/widget/MenuListView;->setBackgroundColor(I)V

    .line 278
    const/4 v9, 0x0

    invoke-virtual {p0, v9}, Lcom/vkontakte/android/ui/widget/MenuListView;->setClipToPadding(Z)V

    .line 280
    iget-boolean v9, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->isTablet:Z

    if-eqz v9, :cond_2

    .line 281
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/widget/MenuListView;->getContext()Landroid/content/Context;

    move-result-object v9

    invoke-static {v9}, Lcom/vkontakte/android/utils/Utils;->castToActivity(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object v1

    .line 282
    .local v1, "activity":Landroid/app/Activity;
    new-instance v9, Landroid/widget/FrameLayout;

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/widget/MenuListView;->getContext()Landroid/content/Context;

    move-result-object v10

    invoke-direct {v9, v10}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iput-object v9, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->tabletNavIcon:Landroid/view/ViewGroup;

    .line 283
    iget-object v10, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->tabletNavIcon:Landroid/view/ViewGroup;

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/widget/MenuListView;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    iget-boolean v9, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->isTablet:Z

    if-eqz v9, :cond_8

    const v9, 0x7f0f005a

    :goto_2
    invoke-virtual {v11, v9}, Landroid/content/res/Resources;->getColor(I)I

    move-result v9

    invoke-virtual {v10, v9}, Landroid/view/ViewGroup;->setBackgroundColor(I)V

    .line 284
    new-instance v3, Landroid/widget/ImageView;

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/widget/MenuListView;->getContext()Landroid/content/Context;

    move-result-object v9

    invoke-direct {v3, v9}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 285
    .local v3, "icon":Landroid/widget/ImageView;
    sget-object v9, Landroid/widget/ImageView$ScaleType;->CENTER:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v3, v9}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 286
    new-instance v10, Lcom/vkontakte/android/ui/drawable/RecoloredDrawable;

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/widget/MenuListView;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    invoke-virtual {v1}, Landroid/app/Activity;->isTaskRoot()Z

    move-result v9

    if-eqz v9, :cond_9

    const v9, 0x7f020156

    :goto_3
    invoke-virtual {v11, v9}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v9

    const v11, -0x5b554f

    invoke-direct {v10, v9, v11}, Lcom/vkontakte/android/ui/drawable/RecoloredDrawable;-><init>(Landroid/graphics/drawable/Drawable;I)V

    invoke-virtual {v3, v10}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 287
    const v9, 0x7f02013e

    invoke-virtual {v3, v9}, Landroid/widget/ImageView;->setBackgroundResource(I)V

    .line 288
    iget-object v9, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->tabletNavIcon:Landroid/view/ViewGroup;

    new-instance v10, Landroid/widget/FrameLayout$LayoutParams;

    const/high16 v11, 0x42600000    # 56.0f

    invoke-static {v11}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v11

    const/high16 v12, 0x42600000    # 56.0f

    invoke-static {v12}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v12

    const/16 v13, 0x11

    invoke-direct {v10, v11, v12, v13}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {v9, v3, v10}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 289
    new-instance v6, Landroid/widget/FrameLayout$LayoutParams;

    const/high16 v9, 0x42a80000    # 84.0f

    invoke-static {v9}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v9

    const/high16 v10, 0x42800000    # 64.0f

    invoke-static {v10}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v10

    const/16 v11, 0x33

    invoke-direct {v6, v9, v10, v11}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    .line 290
    .local v6, "lp":Landroid/widget/FrameLayout$LayoutParams;
    iget-object v9, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->tabletNavIcon:Landroid/view/ViewGroup;

    invoke-virtual {v9, v6}, Landroid/view/ViewGroup;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 291
    invoke-static {p0, v1}, Lcom/vkontakte/android/ui/widget/MenuListView$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/ui/widget/MenuListView;Landroid/app/Activity;)Landroid/view/View$OnClickListener;

    move-result-object v9

    invoke-virtual {v3, v9}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 300
    .end local v1    # "activity":Landroid/app/Activity;
    .end local v3    # "icon":Landroid/widget/ImageView;
    .end local v6    # "lp":Landroid/widget/FrameLayout$LayoutParams;
    :cond_2
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v0

    .line 301
    .local v0, "account":Lcom/vkontakte/android/auth/VKAccount;
    invoke-virtual {v0}, Lcom/vkontakte/android/auth/VKAccount;->getName()Ljava/lang/String;

    move-result-object v9

    iput-object v9, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->userName:Ljava/lang/String;

    .line 302
    invoke-virtual {v0}, Lcom/vkontakte/android/auth/VKAccount;->getPhoto()Ljava/lang/String;

    move-result-object v9

    iput-object v9, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->userPhoto:Ljava/lang/String;

    .line 303
    invoke-virtual {v0}, Lcom/vkontakte/android/auth/VKAccount;->getStatus()Ljava/lang/String;

    move-result-object v9

    iput-object v9, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->userStatus:Ljava/lang/String;

    .line 305
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/widget/MenuListView;->updateBirthdays()V

    .line 306
    iget-object v9, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->playerView:Landroid/view/View;

    const/16 v10, 0x8

    invoke-virtual {v9, v10}, Landroid/view/View;->setVisibility(I)V

    .line 307
    invoke-direct {p0}, Lcom/vkontakte/android/ui/widget/MenuListView;->updateListPadding()V

    .line 308
    iget-object v9, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->playerView:Landroid/view/View;

    const v10, 0x7f100397

    invoke-virtual {v9, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v9

    invoke-static {}, Lcom/vkontakte/android/ui/widget/MenuListView$$Lambda$2;->lambdaFactory$()Landroid/view/View$OnClickListener;

    move-result-object v10

    invoke-virtual {v9, v10}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 310
    iget-object v9, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->playerView:Landroid/view/View;

    const v10, 0x7f100395

    invoke-virtual {v9, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v9

    invoke-static {p0}, Lcom/vkontakte/android/ui/widget/MenuListView$$Lambda$3;->lambdaFactory$(Lcom/vkontakte/android/ui/widget/MenuListView;)Landroid/view/View$OnClickListener;

    move-result-object v10

    invoke-virtual {v9, v10}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 317
    iget-object v9, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->playerView:Landroid/view/View;

    const v10, 0x7f100398

    invoke-virtual {v9, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v9

    const/4 v10, 0x1

    invoke-virtual {v9, v10}, Landroid/view/View;->setSelected(Z)V

    .line 318
    iget-object v9, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->playerView:Landroid/view/View;

    const v10, 0x7f100399

    invoke-virtual {v9, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v9

    const/4 v10, 0x1

    invoke-virtual {v9, v10}, Landroid/view/View;->setSelected(Z)V

    .line 319
    iget-object v9, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    new-instance v10, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v11, -0x1

    const/4 v12, -0x1

    invoke-direct {v10, v11, v12}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v9, v10}, Lme/grishka/appkit/views/UsableRecyclerView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 320
    iget-object v9, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->playerView:Landroid/view/View;

    new-instance v10, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v11, -0x1

    const/4 v12, -0x2

    const/16 v13, 0x50

    invoke-direct {v10, v11, v12, v13}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {v9, v10}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 321
    iget-object v9, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {p0, v9}, Lcom/vkontakte/android/ui/widget/MenuListView;->addView(Landroid/view/View;)V

    .line 322
    iget-object v9, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->playerView:Landroid/view/View;

    invoke-virtual {p0, v9}, Lcom/vkontakte/android/ui/widget/MenuListView;->addView(Landroid/view/View;)V

    .line 323
    iget-object v9, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->tabletNavIcon:Landroid/view/ViewGroup;

    if-eqz v9, :cond_3

    .line 324
    iget-object v9, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->tabletNavIcon:Landroid/view/ViewGroup;

    invoke-virtual {p0, v9}, Lcom/vkontakte/android/ui/widget/MenuListView;->addView(Landroid/view/View;)V

    .line 327
    :cond_3
    iget-boolean v9, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->isTablet:Z

    if-eqz v9, :cond_4

    .line 328
    iget-object v9, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    new-instance v10, Lcom/vkontakte/android/ui/widget/MenuListView$3;

    invoke-direct {v10, p0}, Lcom/vkontakte/android/ui/widget/MenuListView$3;-><init>(Lcom/vkontakte/android/ui/widget/MenuListView;)V

    invoke-virtual {v9, v10}, Lme/grishka/appkit/views/UsableRecyclerView;->addOnScrollListener(Landroid/support/v7/widget/RecyclerView$OnScrollListener;)V

    .line 346
    :cond_4
    new-instance v9, Lcom/vkontakte/android/ui/widget/MenuListView$4;

    invoke-direct {v9, p0}, Lcom/vkontakte/android/ui/widget/MenuListView$4;-><init>(Lcom/vkontakte/android/ui/widget/MenuListView;)V

    invoke-virtual {p0, v9}, Lcom/vkontakte/android/ui/widget/MenuListView;->setListener(Lcom/vkontakte/android/ui/widget/MenuListView$Listener;)V

    .line 453
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/widget/MenuListView;->getContext()Landroid/content/Context;

    move-result-object v9

    invoke-virtual {v9}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v9

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/widget/MenuListView;->getContext()Landroid/content/Context;

    move-result-object v10

    invoke-virtual {v10}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Landroid/content/pm/PackageManager;->getInstallerPackageName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 454
    .local v4, "installer":Ljava/lang/String;
    if-eqz v4, :cond_6

    const-string/jumbo v9, "amazon"

    invoke-virtual {v4, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v9

    if-eqz v9, :cond_6

    .line 455
    iget-object v9, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->items:Ljava/util/ArrayList;

    invoke-virtual {v9}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :cond_5
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_6

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/vkontakte/android/ui/widget/MenuListView$MenuItem;

    .line 456
    .local v5, "item":Lcom/vkontakte/android/ui/widget/MenuListView$MenuItem;
    iget v10, v5, Lcom/vkontakte/android/ui/widget/MenuListView$MenuItem;->index:I

    const/16 v11, 0x9

    if-ne v10, v11, :cond_5

    .line 457
    iget-object v9, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->items:Ljava/util/ArrayList;

    invoke-virtual {v9, v5}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 462
    .end local v5    # "item":Lcom/vkontakte/android/ui/widget/MenuListView$MenuItem;
    :cond_6
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/widget/MenuListView;->getRootView()Landroid/view/View;

    move-result-object v9

    invoke-virtual {v9}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v9

    new-instance v10, Lcom/vkontakte/android/ui/widget/MenuListView$5;

    invoke-direct {v10, p0}, Lcom/vkontakte/android/ui/widget/MenuListView$5;-><init>(Lcom/vkontakte/android/ui/widget/MenuListView;)V

    invoke-virtual {v9, v10}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 482
    return-void

    .line 277
    .end local v0    # "account":Lcom/vkontakte/android/auth/VKAccount;
    .end local v4    # "installer":Ljava/lang/String;
    :cond_7
    const v9, 0x7f0f0059

    goto/16 :goto_1

    .line 283
    .restart local v1    # "activity":Landroid/app/Activity;
    :cond_8
    const v9, 0x7f0f0059

    goto/16 :goto_2

    .line 286
    .restart local v3    # "icon":Landroid/widget/ImageView;
    :cond_9
    const v9, 0x7f02014f

    goto/16 :goto_3
.end method

.method static synthetic lambda$init$1(Landroid/view/View;)V
    .locals 0
    .param p0, "v"    # Landroid/view/View;

    .prologue
    .line 309
    invoke-static {}, Lcom/vkontakte/android/audio/AudioFacade;->toggleResumePause()V

    return-void
.end method

.method private updateAudioAlbumArt(Lcom/vkontakte/android/audio/MusicTrack;)V
    .locals 2
    .param p1, "musicTrack"    # Lcom/vkontakte/android/audio/MusicTrack;

    .prologue
    .line 490
    iget-boolean v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->isTablet:Z

    if-nez v0, :cond_0

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->trackImageView:Lcom/vk/music/view/ThumbsImageView;

    if-nez v0, :cond_1

    .line 494
    :cond_0
    :goto_0
    return-void

    .line 493
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->trackImageView:Lcom/vk/music/view/ThumbsImageView;

    invoke-virtual {p1}, Lcom/vkontakte/android/audio/MusicTrack;->getThumb()Lcom/vk/music/dto/Thumb;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/music/view/ThumbsImageView;->setThumb(Lcom/vk/music/dto/Thumb;)V

    goto :goto_0
.end method

.method private updateListPadding()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 676
    const/4 v0, 0x0

    .line 677
    .local v0, "pad":I
    iget v1, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->expansion:F

    const/4 v2, 0x0

    cmpl-float v1, v1, v2

    if-nez v1, :cond_0

    .line 678
    const/high16 v1, 0x41e00000    # 28.0f

    invoke-static {v1}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v1

    add-int/2addr v0, v1

    .line 680
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->playerView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getVisibility()I

    move-result v1

    if-nez v1, :cond_1

    .line 681
    const/high16 v1, 0x42600000    # 56.0f

    invoke-static {v1}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v1

    add-int/2addr v0, v1

    .line 683
    :cond_1
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v1}, Lme/grishka/appkit/views/UsableRecyclerView;->getPaddingBottom()I

    move-result v1

    if-eq v1, v0, :cond_2

    .line 684
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v1, v3, v3, v3, v0}, Lme/grishka/appkit/views/UsableRecyclerView;->setPadding(IIII)V

    .line 686
    :cond_2
    return-void
.end method


# virtual methods
.method synthetic lambda$init$0(Landroid/app/Activity;Landroid/view/View;)V
    .locals 1
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "view"    # Landroid/view/View;

    .prologue
    .line 292
    invoke-virtual {p1}, Landroid/app/Activity;->isTaskRoot()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 293
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/widget/MenuListView;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/support/v4/widget/SlidingPaneLayout;

    invoke-virtual {v0}, Landroid/support/v4/widget/SlidingPaneLayout;->openPane()Z

    .line 297
    :goto_0
    return-void

    .line 295
    :cond_0
    invoke-virtual {p1}, Landroid/app/Activity;->finish()V

    goto :goto_0
.end method

.method synthetic lambda$init$2(Landroid/view/View;)V
    .locals 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 311
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/widget/MenuListView;->getContext()Landroid/content/Context;

    move-result-object v0

    new-instance v1, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/widget/MenuListView;->getContext()Landroid/content/Context;

    move-result-object v2

    const-class v3, Lcom/vkontakte/android/AudioPlayerActivity;

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 312
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/widget/MenuListView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/vkontakte/android/utils/Utils;->castToActivity(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object v0

    const v1, 0x7f040020

    const v2, 0x7f040018

    invoke-virtual {v0, v1, v2}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 313
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->listener:Lcom/vkontakte/android/ui/widget/MenuListView$Listener;

    if-eqz v0, :cond_0

    .line 314
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->listener:Lcom/vkontakte/android/ui/widget/MenuListView$Listener;

    const/16 v1, -0x14

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Lcom/vkontakte/android/ui/widget/MenuListView$Listener;->onMenuItemSelected(IZ)V

    .line 316
    :cond_0
    return-void
.end method

.method synthetic lambda$null$3(Ljava/lang/CharSequence;)V
    .locals 0
    .param p1, "rtext"    # Ljava/lang/CharSequence;

    .prologue
    .line 546
    sput-object p1, Lcom/vkontakte/android/ui/widget/MenuListView;->reminderText:Ljava/lang/CharSequence;

    .line 547
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/widget/MenuListView;->updateList()V

    .line 548
    return-void
.end method

.method synthetic lambda$onAttachedToWindow$5()V
    .locals 6

    .prologue
    const/4 v5, 0x5

    .line 558
    :try_start_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 559
    .local v0, "friends1":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    invoke-static {v0}, Lcom/vkontakte/android/data/Friends;->getFriends(Ljava/util/ArrayList;)V

    .line 560
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-le v3, v5, :cond_0

    .line 561
    const/4 v3, 0x5

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v4

    invoke-virtual {v0, v3, v4}, Ljava/util/ArrayList;->subList(II)Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->clear()V

    .line 563
    :cond_0
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 564
    .local v1, "groups1":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/api/Group;>;"
    invoke-static {v1}, Lcom/vkontakte/android/data/Groups;->getGroups(Ljava/util/ArrayList;)V

    .line 565
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-le v3, v5, :cond_1

    .line 566
    const/4 v3, 0x5

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v4

    invoke-virtual {v1, v3, v4}, Ljava/util/ArrayList;->subList(II)Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->clear()V

    .line 568
    :cond_1
    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/ui/widget/MenuListView;->update(Ljava/util/List;Ljava/util/List;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 572
    .end local v0    # "friends1":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    .end local v1    # "groups1":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/api/Group;>;"
    :goto_0
    return-void

    .line 569
    :catch_0
    move-exception v2

    .line 570
    .local v2, "x":Ljava/lang/Exception;
    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {v2, v3}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto :goto_0
.end method

.method synthetic lambda$update$6(Ljava/util/List;Ljava/util/List;)V
    .locals 2
    .param p1, "_friends"    # Ljava/util/List;
    .param p2, "_groups"    # Ljava/util/List;

    .prologue
    .line 603
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v0

    .line 604
    .local v0, "account":Lcom/vkontakte/android/auth/VKAccount;
    invoke-virtual {v0}, Lcom/vkontakte/android/auth/VKAccount;->getName()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->userName:Ljava/lang/String;

    .line 605
    invoke-virtual {v0}, Lcom/vkontakte/android/auth/VKAccount;->getPhoto()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->userPhoto:Ljava/lang/String;

    .line 606
    invoke-virtual {v0}, Lcom/vkontakte/android/auth/VKAccount;->getStatus()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->userStatus:Ljava/lang/String;

    .line 607
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->friends:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    .line 608
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->friends:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 609
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->groups:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    .line 610
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->groups:Ljava/util/ArrayList;

    invoke-virtual {v1, p2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 612
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->adapter:Lcom/vkontakte/android/ui/widget/MenuListView$MenuAdapter;

    invoke-virtual {v1}, Lcom/vkontakte/android/ui/widget/MenuListView$MenuAdapter;->notifyDataSetChanged()V

    .line 613
    return-void
.end method

.method synthetic lambda$updateBirthdays$4()V
    .locals 18

    .prologue
    .line 510
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v13

    const-string/jumbo v14, "Update birthdays"

    invoke-virtual {v13, v14}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 511
    const/4 v2, 0x0

    .line 512
    .local v2, "_rtext":Ljava/lang/CharSequence;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v14

    invoke-static {v14, v15}, Lcom/vkontakte/android/cache/Cache;->getBirthdays(J)Ljava/util/ArrayList;

    move-result-object v3

    .line 514
    .local v3, "bdays":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/vkontakte/android/ui/widget/MenuListView;->birthdayUsers:Ljava/util/List;

    invoke-interface {v13}, Ljava/util/List;->clear()V

    .line 515
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v13

    if-lez v13, :cond_5

    .line 517
    const/high16 v13, 0x42200000    # 40.0f

    invoke-static {v13}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v9

    .line 518
    .local v9, "psize":I
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 520
    .local v7, "names":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-instance v4, Ljava/util/Date;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v14

    invoke-direct {v4, v14, v15}, Ljava/util/Date;-><init>(J)V

    .line 521
    .local v4, "date":Ljava/util/Date;
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4}, Ljava/util/Date;->getDate()I

    move-result v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string/jumbo v14, "."

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v4}, Ljava/util/Date;->getMonth()I

    move-result v14

    add-int/lit8 v14, v14, 0x1

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string/jumbo v14, "."

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    .line 522
    .local v11, "today":Ljava/lang/String;
    new-instance v5, Ljava/util/Date;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v14

    const-wide/32 v16, 0x5265c00

    add-long v14, v14, v16

    invoke-direct {v5, v14, v15}, Ljava/util/Date;-><init>(J)V

    .line 523
    .local v5, "date2":Ljava/util/Date;
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5}, Ljava/util/Date;->getDate()I

    move-result v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string/jumbo v14, "."

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v5}, Ljava/util/Date;->getMonth()I

    move-result v14

    add-int/lit8 v14, v14, 0x1

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string/jumbo v14, "."

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    .line 525
    .local v12, "yesterday":Ljava/lang/String;
    const/4 v6, 0x0

    .line 526
    .local v6, "hasToday":Z
    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v13

    :cond_0
    :goto_0
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_4

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/vkontakte/android/UserProfile;

    .line 528
    .local v8, "p":Lcom/vkontakte/android/UserProfile;
    iget-object v14, v8, Lcom/vkontakte/android/UserProfile;->bdate:Ljava/lang/String;

    invoke-virtual {v14, v11}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_1

    .line 529
    const/4 v6, 0x1

    .line 532
    :cond_1
    if-eqz v6, :cond_2

    iget-object v14, v8, Lcom/vkontakte/android/UserProfile;->bdate:Ljava/lang/String;

    invoke-virtual {v14, v11}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v14

    if-nez v14, :cond_3

    :cond_2
    if-nez v6, :cond_0

    .line 533
    :cond_3
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v15, "[id"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    iget v15, v8, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string/jumbo v15, "|"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    iget-object v15, v8, Lcom/vkontakte/android/UserProfile;->university:Ljava/lang/String;

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string/jumbo v15, "]"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v7, v14}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 534
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/vkontakte/android/ui/widget/MenuListView;->birthdayUsers:Ljava/util/List;

    invoke-interface {v14, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 537
    .end local v8    # "p":Lcom/vkontakte/android/UserProfile;
    :cond_4
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/ui/widget/MenuListView;->getContext()Landroid/content/Context;

    move-result-object v13

    invoke-virtual {v13}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v14

    if-eqz v6, :cond_6

    const v13, 0x7f08010d

    :goto_1
    const/4 v15, 0x1

    new-array v15, v15, [Ljava/lang/Object;

    const/16 v16, 0x0

    const-string/jumbo v17, ", "

    move-object/from16 v0, v17

    invoke-static {v0, v7}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v17

    aput-object v17, v15, v16

    invoke-virtual {v14, v13, v15}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    const/4 v14, 0x2

    invoke-static {v13, v14}, Lcom/vkontakte/android/LinkParser;->parseLinks(Ljava/lang/CharSequence;I)Ljava/lang/CharSequence;

    move-result-object v2

    .line 540
    move-object/from16 v0, p0

    iget-boolean v13, v0, Lcom/vkontakte/android/ui/widget/MenuListView;->isTablet:Z

    if-eqz v13, :cond_5

    if-nez v6, :cond_5

    .line 541
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/vkontakte/android/ui/widget/MenuListView;->birthdayUsers:Ljava/util/List;

    invoke-interface {v13}, Ljava/util/List;->clear()V

    .line 544
    .end local v4    # "date":Ljava/util/Date;
    .end local v5    # "date2":Ljava/util/Date;
    .end local v6    # "hasToday":Z
    .end local v7    # "names":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v9    # "psize":I
    .end local v11    # "today":Ljava/lang/String;
    .end local v12    # "yesterday":Ljava/lang/String;
    :cond_5
    move-object v10, v2

    .line 545
    .local v10, "rtext":Ljava/lang/CharSequence;
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/ui/widget/MenuListView;->getContext()Landroid/content/Context;

    move-result-object v13

    invoke-static {v13}, Lcom/vkontakte/android/utils/Utils;->castToActivity(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object v13

    move-object/from16 v0, p0

    invoke-static {v0, v10}, Lcom/vkontakte/android/ui/widget/MenuListView$$Lambda$8;->lambdaFactory$(Lcom/vkontakte/android/ui/widget/MenuListView;Ljava/lang/CharSequence;)Ljava/lang/Runnable;

    move-result-object v14

    invoke-virtual {v13, v14}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 549
    return-void

    .line 537
    .end local v10    # "rtext":Ljava/lang/CharSequence;
    .restart local v4    # "date":Ljava/util/Date;
    .restart local v5    # "date2":Ljava/util/Date;
    .restart local v6    # "hasToday":Z
    .restart local v7    # "names":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .restart local v9    # "psize":I
    .restart local v11    # "today":Ljava/lang/String;
    .restart local v12    # "yesterday":Ljava/lang/String;
    :cond_6
    const v13, 0x7f08010f

    goto :goto_1
.end method

.method synthetic lambda$updateList$7()V
    .locals 1

    .prologue
    .line 619
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->adapter:Lcom/vkontakte/android/ui/widget/MenuListView$MenuAdapter;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/widget/MenuListView$MenuAdapter;->notifyDataSetChanged()V

    .line 620
    return-void
.end method

.method public onApplyWindowInsets(Landroid/view/WindowInsets;)Landroid/view/WindowInsets;
    .locals 4
    .param p1, "insets"    # Landroid/view/WindowInsets;
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 728
    invoke-virtual {p1}, Landroid/view/WindowInsets;->getSystemWindowInsetTop()I

    move-result v1

    iput v1, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->statusBarHeight:I

    .line 729
    iget v1, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->statusBarHeight:I

    iget v2, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->prevStatusBarHeight:I

    if-eq v1, v2, :cond_1

    .line 730
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->tabletNavIcon:Landroid/view/ViewGroup;

    if-eqz v1, :cond_0

    .line 731
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->tabletNavIcon:Landroid/view/ViewGroup;

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 732
    .local v0, "lp":Landroid/widget/FrameLayout$LayoutParams;
    const/high16 v1, 0x42800000    # 64.0f

    invoke-static {v1}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v1

    iget v2, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->statusBarHeight:I

    add-int/2addr v1, v2

    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 733
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->tabletNavIcon:Landroid/view/ViewGroup;

    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 734
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->tabletNavIcon:Landroid/view/ViewGroup;

    iget v2, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->statusBarHeight:I

    invoke-virtual {v1, v3, v2, v3, v3}, Landroid/view/ViewGroup;->setPadding(IIII)V

    .line 735
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->playerView:Landroid/view/View;

    iget v2, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->statusBarHeight:I

    neg-int v2, v2

    int-to-float v2, v2

    invoke-virtual {v1, v2}, Landroid/view/View;->setTranslationY(F)V

    .line 737
    .end local v0    # "lp":Landroid/widget/FrameLayout$LayoutParams;
    :cond_0
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/widget/MenuListView;->updateList()V

    .line 738
    iget v1, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->statusBarHeight:I

    iput v1, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->prevStatusBarHeight:I

    .line 740
    :cond_1
    invoke-virtual {p1}, Landroid/view/WindowInsets;->getSystemWindowInsetBottom()I

    move-result v1

    invoke-virtual {p1, v3, v3, v3, v1}, Landroid/view/WindowInsets;->replaceSystemWindowInsets(IIII)Landroid/view/WindowInsets;

    move-result-object v1

    invoke-super {p0, v1}, Landroid/widget/FrameLayout;->onApplyWindowInsets(Landroid/view/WindowInsets;)Landroid/view/WindowInsets;

    move-result-object v1

    return-object v1
.end method

.method public onAttachedToWindow()V
    .locals 5

    .prologue
    .line 554
    invoke-super {p0}, Landroid/widget/FrameLayout;->onAttachedToWindow()V

    .line 556
    new-instance v1, Ljava/lang/Thread;

    invoke-static {p0}, Lcom/vkontakte/android/ui/widget/MenuListView$$Lambda$5;->lambdaFactory$(Lcom/vkontakte/android/ui/widget/MenuListView;)Ljava/lang/Runnable;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 572
    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 573
    sput-object p0, Lcom/vkontakte/android/ui/widget/MenuListView;->lastInstance:Lcom/vkontakte/android/ui/widget/MenuListView;

    .line 574
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 575
    .local v0, "filter":Landroid/content/IntentFilter;
    const-string/jumbo v1, "com.vkontakte.android.FRIEND_LIST_CHANGED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 576
    const-string/jumbo v1, "com.vkontakte.android.FRIEND_REQUESTS_CHANGED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 577
    const-string/jumbo v1, "com.vkontakte.android.GROUP_LIST_CHANGED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 578
    const-string/jumbo v1, "com.vkontakte.android.USER_PRESENCE"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 579
    const-string/jumbo v1, "com.vkontakte.android.GROUPS_UPDATED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 580
    const-string/jumbo v1, "com.vkontakte.android.COUNTERS_UPDATED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 581
    const-string/jumbo v1, "com.vkontakte.android.USER_PHOTO_CHANGED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 582
    const-string/jumbo v1, "com.vkontakte.android.USER_NAME_CHANGED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 583
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/widget/MenuListView;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->receiver:Landroid/content/BroadcastReceiver;

    const-string/jumbo v3, "com.vkontakte.android.permission.ACCESS_DATA"

    const/4 v4, 0x0

    invoke-virtual {v1, v2, v0, v3, v4}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;)Landroid/content/Intent;

    .line 585
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->playerListener:Lcom/vkontakte/android/audio/player/PlayerListener;

    const/4 v2, 0x1

    invoke-static {v1, v2}, Lcom/vkontakte/android/audio/AudioFacade;->addPlayerListener(Lcom/vkontakte/android/audio/player/PlayerListener;Z)V

    .line 586
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 2

    .prologue
    .line 589
    invoke-super {p0}, Landroid/widget/FrameLayout;->onDetachedFromWindow()V

    .line 590
    const-string/jumbo v0, "vk"

    const-string/jumbo v1, "on detached"

    invoke-static {v0, v1}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 591
    const/4 v0, 0x0

    sput-object v0, Lcom/vkontakte/android/ui/widget/MenuListView;->lastInstance:Lcom/vkontakte/android/ui/widget/MenuListView;

    .line 593
    :try_start_0
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/widget/MenuListView;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->receiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 598
    :goto_0
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->playerListener:Lcom/vkontakte/android/audio/player/PlayerListener;

    invoke-static {v0}, Lcom/vkontakte/android/audio/AudioFacade;->removePlayerListener(Lcom/vkontakte/android/audio/player/PlayerListener;)V

    .line 599
    return-void

    .line 594
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public prepare()V
    .locals 5

    .prologue
    const/4 v4, -0x1

    .line 689
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/widget/MenuListView;->updateUserInfo()V

    .line 690
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/widget/MenuListView;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lcom/vkontakte/android/utils/Utils;->castToActivity(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object v0

    .line 691
    .local v0, "activity":Landroid/app/Activity;
    invoke-virtual {v0}, Landroid/app/Activity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v2

    const v3, 0x7f10002b

    invoke-virtual {v2, v3}, Landroid/app/FragmentManager;->findFragmentById(I)Landroid/app/Fragment;

    move-result-object v1

    .line 692
    .local v1, "fragment":Landroid/app/Fragment;
    if-eqz v1, :cond_0

    invoke-virtual {v0}, Landroid/app/Activity;->isTaskRoot()Z

    move-result v2

    if-nez v2, :cond_1

    .line 693
    :cond_0
    invoke-virtual {p0, v4}, Lcom/vkontakte/android/ui/widget/MenuListView;->setCurrentItem(I)V

    .line 723
    :goto_0
    return-void

    .line 696
    :cond_1
    instance-of v2, v1, Lcom/vkontakte/android/fragments/NewsFragment;

    if-eqz v2, :cond_2

    .line 697
    const/4 v2, 0x1

    invoke-virtual {p0, v2}, Lcom/vkontakte/android/ui/widget/MenuListView;->setCurrentItem(I)V

    goto :goto_0

    .line 698
    :cond_2
    instance-of v2, v1, Lcom/vkontakte/android/fragments/feedback/FeedbackFragment;

    if-eqz v2, :cond_3

    .line 699
    const/4 v2, 0x2

    invoke-virtual {p0, v2}, Lcom/vkontakte/android/ui/widget/MenuListView;->setCurrentItem(I)V

    goto :goto_0

    .line 700
    :cond_3
    instance-of v2, v1, Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    if-eqz v2, :cond_4

    .line 701
    const/4 v2, 0x3

    invoke-virtual {p0, v2}, Lcom/vkontakte/android/ui/widget/MenuListView;->setCurrentItem(I)V

    goto :goto_0

    .line 702
    :cond_4
    instance-of v2, v1, Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    if-eqz v2, :cond_5

    .line 703
    const/4 v2, 0x4

    invoke-virtual {p0, v2}, Lcom/vkontakte/android/ui/widget/MenuListView;->setCurrentItem(I)V

    goto :goto_0

    .line 704
    :cond_5
    instance-of v2, v1, Lcom/vkontakte/android/fragments/groups/GroupsFragment;

    if-eqz v2, :cond_6

    .line 705
    const/4 v2, 0x5

    invoke-virtual {p0, v2}, Lcom/vkontakte/android/ui/widget/MenuListView;->setCurrentItem(I)V

    goto :goto_0

    .line 706
    :cond_6
    instance-of v2, v1, Lcom/vkontakte/android/fragments/PhotosFragment;

    if-eqz v2, :cond_7

    .line 707
    const/4 v2, 0x6

    invoke-virtual {p0, v2}, Lcom/vkontakte/android/ui/widget/MenuListView;->setCurrentItem(I)V

    goto :goto_0

    .line 708
    :cond_7
    instance-of v2, v1, Lcom/vkontakte/android/fragments/videos/VideosFragment;

    if-eqz v2, :cond_8

    .line 709
    const/4 v2, 0x7

    invoke-virtual {p0, v2}, Lcom/vkontakte/android/ui/widget/MenuListView;->setCurrentItem(I)V

    goto :goto_0

    .line 710
    :cond_8
    instance-of v2, v1, Lcom/vk/music/fragment/MusicFragment;

    if-eqz v2, :cond_9

    .line 711
    const/16 v2, 0x8

    invoke-virtual {p0, v2}, Lcom/vkontakte/android/ui/widget/MenuListView;->setCurrentItem(I)V

    goto :goto_0

    .line 712
    :cond_9
    instance-of v2, v1, Lcom/vkontakte/android/fragments/GamesFragment;

    if-eqz v2, :cond_a

    .line 713
    const/16 v2, 0x9

    invoke-virtual {p0, v2}, Lcom/vkontakte/android/ui/widget/MenuListView;->setCurrentItem(I)V

    goto :goto_0

    .line 714
    :cond_a
    instance-of v2, v1, Lcom/vkontakte/android/fragments/fave/FaveFragment;

    if-eqz v2, :cond_b

    .line 715
    const/16 v2, 0xa

    invoke-virtual {p0, v2}, Lcom/vkontakte/android/ui/widget/MenuListView;->setCurrentItem(I)V

    goto :goto_0

    .line 716
    :cond_b
    instance-of v2, v1, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;

    if-eqz v2, :cond_c

    .line 717
    const/16 v2, 0xb

    invoke-virtual {p0, v2}, Lcom/vkontakte/android/ui/widget/MenuListView;->setCurrentItem(I)V

    goto :goto_0

    .line 718
    :cond_c
    instance-of v2, v1, Lcom/vkontakte/android/fragments/SettingsListFragment;

    if-eqz v2, :cond_d

    .line 719
    const/16 v2, 0xc

    invoke-virtual {p0, v2}, Lcom/vkontakte/android/ui/widget/MenuListView;->setCurrentItem(I)V

    goto :goto_0

    .line 721
    :cond_d
    invoke-virtual {p0, v4}, Lcom/vkontakte/android/ui/widget/MenuListView;->setCurrentItem(I)V

    goto :goto_0
.end method

.method public setCurrentItem(I)V
    .locals 1
    .param p1, "item"    # I

    .prologue
    .line 485
    iput p1, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->currentItem:I

    .line 486
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->adapter:Lcom/vkontakte/android/ui/widget/MenuListView$MenuAdapter;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/widget/MenuListView$MenuAdapter;->notifyDataSetChanged()V

    .line 487
    return-void
.end method

.method public setExpansion(F)V
    .locals 14
    .param p1, "exp"    # F

    .prologue
    .line 628
    iget-object v11, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->headerViewHolder:Lcom/vkontakte/android/ui/widget/MenuListView$HeaderViewHolder;

    if-eqz v11, :cond_a

    .line 629
    iget-object v12, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    const/4 v11, 0x0

    cmpl-float v11, p1, v11

    if-nez v11, :cond_4

    const/4 v11, 0x2

    :goto_0
    invoke-virtual {v12, v11}, Lme/grishka/appkit/views/UsableRecyclerView;->setOverScrollMode(I)V

    .line 630
    iput p1, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->expansion:F

    .line 631
    const/4 v3, 0x0

    .line 632
    .local v3, "ignoreZeroOffset":Z
    iget v11, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->expansion:F

    const/4 v12, 0x0

    cmpl-float v11, v11, v12

    if-nez v11, :cond_0

    iget v11, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->prevExpansion:F

    const/4 v12, 0x0

    cmpl-float v11, v11, v12

    if-nez v11, :cond_1

    :cond_0
    iget v11, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->expansion:F

    const/4 v12, 0x0

    cmpl-float v11, v11, v12

    if-eqz v11, :cond_2

    iget v11, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->prevExpansion:F

    const/4 v12, 0x0

    cmpl-float v11, v11, v12

    if-nez v11, :cond_2

    .line 633
    :cond_1
    iget-object v11, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->adapter:Lcom/vkontakte/android/ui/widget/MenuListView$MenuAdapter;

    invoke-virtual {v11}, Lcom/vkontakte/android/ui/widget/MenuListView$MenuAdapter;->notifyDataSetChanged()V

    .line 634
    const/4 v3, 0x1

    .line 638
    :cond_2
    const v11, 0x3f0e38e3

    const v12, 0x3ee38e3a

    mul-float/2addr v12, p1

    add-float v6, v11, v12

    .line 639
    .local v6, "scale":F
    iget-object v11, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->headerViewHolder:Lcom/vkontakte/android/ui/widget/MenuListView$HeaderViewHolder;

    invoke-static {v11}, Lcom/vkontakte/android/ui/widget/MenuListView$HeaderViewHolder;->access$1100(Lcom/vkontakte/android/ui/widget/MenuListView$HeaderViewHolder;)Lcom/vk/imageloader/view/VKImageView;

    move-result-object v11

    invoke-virtual {v11, v6}, Lcom/vk/imageloader/view/VKImageView;->setScaleX(F)V

    .line 640
    iget-object v11, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->headerViewHolder:Lcom/vkontakte/android/ui/widget/MenuListView$HeaderViewHolder;

    invoke-static {v11}, Lcom/vkontakte/android/ui/widget/MenuListView$HeaderViewHolder;->access$1100(Lcom/vkontakte/android/ui/widget/MenuListView$HeaderViewHolder;)Lcom/vk/imageloader/view/VKImageView;

    move-result-object v11

    invoke-virtual {v11, v6}, Lcom/vk/imageloader/view/VKImageView;->setScaleY(F)V

    .line 641
    iget-object v11, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->headerViewHolder:Lcom/vkontakte/android/ui/widget/MenuListView$HeaderViewHolder;

    invoke-static {v11}, Lcom/vkontakte/android/ui/widget/MenuListView$HeaderViewHolder;->access$1100(Lcom/vkontakte/android/ui/widget/MenuListView$HeaderViewHolder;)Lcom/vk/imageloader/view/VKImageView;

    move-result-object v11

    const/high16 v12, 0x42a80000    # 84.0f

    invoke-static {v12}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v12

    int-to-float v12, v12

    const/high16 v13, 0x3f800000    # 1.0f

    sub-float/2addr v13, p1

    mul-float/2addr v12, v13

    invoke-virtual {v11, v12}, Lcom/vk/imageloader/view/VKImageView;->setTranslationY(F)V

    .line 642
    iget-object v11, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    const/high16 v12, 0x41e00000    # 28.0f

    invoke-static {v12}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v12

    int-to-float v12, v12

    const/high16 v13, 0x3f800000    # 1.0f

    sub-float/2addr v13, p1

    mul-float/2addr v12, v13

    invoke-virtual {v11, v12}, Lme/grishka/appkit/views/UsableRecyclerView;->setTranslationY(F)V

    .line 643
    const/4 v11, 0x0

    const/high16 v12, 0x3f000000    # 0.5f

    sub-float v12, p1, v12

    invoke-static {v11, v12}, Ljava/lang/Math;->max(FF)F

    move-result v11

    const/high16 v12, 0x3f000000    # 0.5f

    div-float v5, v11, v12

    .line 644
    .local v5, "nameAlpha":F
    iget-object v11, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->headerViewHolder:Lcom/vkontakte/android/ui/widget/MenuListView$HeaderViewHolder;

    invoke-static {v11}, Lcom/vkontakte/android/ui/widget/MenuListView$HeaderViewHolder;->access$1200(Lcom/vkontakte/android/ui/widget/MenuListView$HeaderViewHolder;)Landroid/widget/TextView;

    move-result-object v11

    invoke-virtual {v11, v5}, Landroid/widget/TextView;->setAlpha(F)V

    .line 645
    iget-object v11, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->headerViewHolder:Lcom/vkontakte/android/ui/widget/MenuListView$HeaderViewHolder;

    invoke-static {v11}, Lcom/vkontakte/android/ui/widget/MenuListView$HeaderViewHolder;->access$1300(Lcom/vkontakte/android/ui/widget/MenuListView$HeaderViewHolder;)Landroid/widget/TextView;

    move-result-object v11

    invoke-virtual {v11, v5}, Landroid/widget/TextView;->setAlpha(F)V

    .line 646
    const/high16 v11, 0x3f800000    # 1.0f

    const/high16 v12, 0x3f800000    # 1.0f

    const v13, 0x3e4ccccd    # 0.2f

    div-float v13, p1, v13

    invoke-static {v12, v13}, Ljava/lang/Math;->min(FF)F

    move-result v12

    sub-float v2, v11, v12

    .line 647
    .local v2, "iconsAlpha":F
    iget-object v11, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->headerViewHolder:Lcom/vkontakte/android/ui/widget/MenuListView$HeaderViewHolder;

    invoke-static {v11}, Lcom/vkontakte/android/ui/widget/MenuListView$HeaderViewHolder;->access$1400(Lcom/vkontakte/android/ui/widget/MenuListView$HeaderViewHolder;)Landroid/widget/ImageView;

    move-result-object v11

    invoke-virtual {v11, v2}, Landroid/widget/ImageView;->setAlpha(F)V

    .line 648
    iget-object v11, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->headerViewHolder:Lcom/vkontakte/android/ui/widget/MenuListView$HeaderViewHolder;

    invoke-static {v11}, Lcom/vkontakte/android/ui/widget/MenuListView$HeaderViewHolder;->access$1400(Lcom/vkontakte/android/ui/widget/MenuListView$HeaderViewHolder;)Landroid/widget/ImageView;

    move-result-object v11

    const/high16 v12, 0x41e00000    # 28.0f

    invoke-static {v12}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v12

    int-to-float v12, v12

    iget-object v13, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v13}, Lme/grishka/appkit/views/UsableRecyclerView;->getTranslationY()F

    move-result v13

    sub-float/2addr v12, v13

    invoke-virtual {v11, v12}, Landroid/widget/ImageView;->setTranslationY(F)V

    .line 649
    iget-object v11, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->headerViewHolder:Lcom/vkontakte/android/ui/widget/MenuListView$HeaderViewHolder;

    invoke-static {v11}, Lcom/vkontakte/android/ui/widget/MenuListView$HeaderViewHolder;->access$1400(Lcom/vkontakte/android/ui/widget/MenuListView$HeaderViewHolder;)Landroid/widget/ImageView;

    move-result-object v12

    const/high16 v11, 0x3f800000    # 1.0f

    cmpl-float v11, p1, v11

    if-nez v11, :cond_5

    const/16 v11, 0x8

    :goto_1
    invoke-virtual {v12, v11}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 650
    iget-object v11, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->tabletNavIcon:Landroid/view/ViewGroup;

    invoke-virtual {v11, v2}, Landroid/view/ViewGroup;->setAlpha(F)V

    .line 651
    invoke-direct {p0}, Lcom/vkontakte/android/ui/widget/MenuListView;->updateListPadding()V

    .line 652
    iget-object v11, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->listSelector:Lcom/vkontakte/android/ui/drawable/PaddingDrawable;

    const/high16 v12, 0x3f800000    # 1.0f

    sub-float/2addr v12, p1

    const v13, 0x461c4000    # 10000.0f

    mul-float/2addr v12, v13

    float-to-int v12, v12

    invoke-virtual {v11, v12}, Lcom/vkontakte/android/ui/drawable/PaddingDrawable;->setLevel(I)Z

    .line 653
    iget-object v11, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->audioProgress:Landroid/widget/ProgressBar;

    const v12, 0x3e9559b4    # 0.2917f

    const v13, 0x3f355326    # 0.7083f

    mul-float/2addr v13, p1

    add-float/2addr v12, v13

    invoke-virtual {v11, v12}, Landroid/widget/ProgressBar;->setScaleX(F)V

    .line 654
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_2
    iget-object v11, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v11}, Lme/grishka/appkit/views/UsableRecyclerView;->getChildCount()I

    move-result v11

    if-ge v1, v11, :cond_9

    .line 655
    iget-object v11, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v11, v1}, Lme/grishka/appkit/views/UsableRecyclerView;->getChildAt(I)Landroid/view/View;

    move-result-object v9

    .line 656
    .local v9, "v":Landroid/view/View;
    iget-object v11, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v11, v9}, Lme/grishka/appkit/views/UsableRecyclerView;->getChildViewHolder(Landroid/view/View;)Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;

    move-result-object v10

    .line 657
    .local v10, "vh":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    instance-of v11, v10, Lcom/vkontakte/android/ui/widget/MenuListView$ItemViewHolder;

    if-eqz v11, :cond_6

    move-object v4, v10

    .line 658
    check-cast v4, Lcom/vkontakte/android/ui/widget/MenuListView$ItemViewHolder;

    .line 659
    .local v4, "ivh":Lcom/vkontakte/android/ui/widget/MenuListView$ItemViewHolder;
    invoke-virtual {v4}, Lcom/vkontakte/android/ui/widget/MenuListView$ItemViewHolder;->applyExpansion()V

    .line 654
    .end local v4    # "ivh":Lcom/vkontakte/android/ui/widget/MenuListView$ItemViewHolder;
    :cond_3
    :goto_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 629
    .end local v1    # "i":I
    .end local v2    # "iconsAlpha":F
    .end local v3    # "ignoreZeroOffset":Z
    .end local v5    # "nameAlpha":F
    .end local v6    # "scale":F
    .end local v9    # "v":Landroid/view/View;
    .end local v10    # "vh":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    :cond_4
    const/4 v11, 0x0

    goto/16 :goto_0

    .line 649
    .restart local v2    # "iconsAlpha":F
    .restart local v3    # "ignoreZeroOffset":Z
    .restart local v5    # "nameAlpha":F
    .restart local v6    # "scale":F
    :cond_5
    const/4 v11, 0x0

    goto :goto_1

    .line 660
    .restart local v1    # "i":I
    .restart local v9    # "v":Landroid/view/View;
    .restart local v10    # "vh":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    :cond_6
    instance-of v11, v10, Lcom/vkontakte/android/ui/widget/MenuListView$UserViewHolder;

    if-eqz v11, :cond_7

    move-object v8, v10

    .line 661
    check-cast v8, Lcom/vkontakte/android/ui/widget/MenuListView$UserViewHolder;

    .line 662
    .local v8, "uvh":Lcom/vkontakte/android/ui/widget/MenuListView$UserViewHolder;
    invoke-virtual {v8, v3}, Lcom/vkontakte/android/ui/widget/MenuListView$UserViewHolder;->applyExpansion(Z)V

    goto :goto_3

    .line 663
    .end local v8    # "uvh":Lcom/vkontakte/android/ui/widget/MenuListView$UserViewHolder;
    :cond_7
    instance-of v11, v10, Lcom/vkontakte/android/ui/widget/MenuListView$SectionViewHolder;

    if-eqz v11, :cond_8

    move-object v7, v10

    .line 664
    check-cast v7, Lcom/vkontakte/android/ui/widget/MenuListView$SectionViewHolder;

    .line 665
    .local v7, "svh":Lcom/vkontakte/android/ui/widget/MenuListView$SectionViewHolder;
    invoke-virtual {v7}, Lcom/vkontakte/android/ui/widget/MenuListView$SectionViewHolder;->applyExpansion()V

    goto :goto_3

    .line 666
    .end local v7    # "svh":Lcom/vkontakte/android/ui/widget/MenuListView$SectionViewHolder;
    :cond_8
    instance-of v11, v10, Lcom/vkontakte/android/ui/widget/MenuListView$BirthdayViewHolder;

    if-eqz v11, :cond_3

    move-object v0, v10

    .line 667
    check-cast v0, Lcom/vkontakte/android/ui/widget/MenuListView$BirthdayViewHolder;

    .line 668
    .local v0, "bvh":Lcom/vkontakte/android/ui/widget/MenuListView$BirthdayViewHolder;
    invoke-virtual {v0}, Lcom/vkontakte/android/ui/widget/MenuListView$BirthdayViewHolder;->applyExpansion()V

    goto :goto_3

    .line 671
    .end local v0    # "bvh":Lcom/vkontakte/android/ui/widget/MenuListView$BirthdayViewHolder;
    .end local v9    # "v":Landroid/view/View;
    .end local v10    # "vh":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    :cond_9
    iget v11, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->expansion:F

    iput v11, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->prevExpansion:F

    .line 673
    .end local v1    # "i":I
    .end local v2    # "iconsAlpha":F
    .end local v3    # "ignoreZeroOffset":Z
    .end local v5    # "nameAlpha":F
    .end local v6    # "scale":F
    :cond_a
    return-void
.end method

.method public setListener(Lcom/vkontakte/android/ui/widget/MenuListView$Listener;)V
    .locals 0
    .param p1, "listener"    # Lcom/vkontakte/android/ui/widget/MenuListView$Listener;

    .prologue
    .line 624
    iput-object p1, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->listener:Lcom/vkontakte/android/ui/widget/MenuListView$Listener;

    .line 625
    return-void
.end method

.method public update(Ljava/util/List;Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/api/Group;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 602
    .local p1, "_friends":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/UserProfile;>;"
    .local p2, "_groups":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/api/Group;>;"
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/widget/MenuListView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/vkontakte/android/utils/Utils;->castToActivity(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object v0

    invoke-static {p0, p1, p2}, Lcom/vkontakte/android/ui/widget/MenuListView$$Lambda$6;->lambdaFactory$(Lcom/vkontakte/android/ui/widget/MenuListView;Ljava/util/List;Ljava/util/List;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 614
    return-void
.end method

.method public updateBirthdays()V
    .locals 2

    .prologue
    .line 509
    new-instance v0, Ljava/lang/Thread;

    invoke-static {p0}, Lcom/vkontakte/android/ui/widget/MenuListView$$Lambda$4;->lambdaFactory$(Lcom/vkontakte/android/ui/widget/MenuListView;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 549
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 550
    return-void
.end method

.method public updateList()V
    .locals 2

    .prologue
    .line 618
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/widget/MenuListView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/vkontakte/android/utils/Utils;->castToActivity(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object v0

    invoke-static {p0}, Lcom/vkontakte/android/ui/widget/MenuListView$$Lambda$7;->lambdaFactory$(Lcom/vkontakte/android/ui/widget/MenuListView;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 621
    return-void
.end method

.method public updateUserInfo()V
    .locals 2

    .prologue
    .line 501
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v0

    .line 502
    .local v0, "account":Lcom/vkontakte/android/auth/VKAccount;
    invoke-virtual {v0}, Lcom/vkontakte/android/auth/VKAccount;->getName()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->userName:Ljava/lang/String;

    .line 503
    invoke-virtual {v0}, Lcom/vkontakte/android/auth/VKAccount;->getPhoto()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->userPhoto:Ljava/lang/String;

    .line 504
    invoke-virtual {v0}, Lcom/vkontakte/android/auth/VKAccount;->getStatus()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/ui/widget/MenuListView;->userStatus:Ljava/lang/String;

    .line 505
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/widget/MenuListView;->updateList()V

    .line 506
    return-void
.end method
