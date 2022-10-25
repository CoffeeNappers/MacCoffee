.class public Lcom/vkontakte/android/fragments/LeaderboardFragment;
.super Landroid/support/design/widget/BottomSheetDialogFragment;
.source "LeaderboardFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/fragments/LeaderboardFragment$ViewHolder;,
        Lcom/vkontakte/android/fragments/LeaderboardFragment$HeaderHolder;,
        Lcom/vkontakte/android/fragments/LeaderboardFragment$Adapter;,
        Lcom/vkontakte/android/fragments/LeaderboardFragment$OnDismissedListener;
    }
.end annotation


# static fields
.field public static final ARG_LEADERBOARD_DATA:Ljava/lang/String; = "leaderboard_data"


# instance fields
.field public dismissedListener:Lcom/vkontakte/android/fragments/LeaderboardFragment$OnDismissedListener;

.field private leaderboardData:Lcom/vkontakte/android/api/apps/AppsGetGameLeaderboard$LeaderboardData;

.field private leaderboardList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/data/GameLeaderboard;",
            ">;"
        }
    .end annotation
.end field

.field private mBottomSheetBehaviorCallback:Landroid/support/design/widget/BottomSheetBehavior$BottomSheetCallback;

.field private usableRecyclerView:Lme/grishka/appkit/views/UsableRecyclerView;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 42
    invoke-direct {p0}, Landroid/support/design/widget/BottomSheetDialogFragment;-><init>()V

    .line 59
    new-instance v0, Lcom/vkontakte/android/fragments/LeaderboardFragment$1;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/LeaderboardFragment$1;-><init>(Lcom/vkontakte/android/fragments/LeaderboardFragment;)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/LeaderboardFragment;->mBottomSheetBehaviorCallback:Landroid/support/design/widget/BottomSheetBehavior$BottomSheetCallback;

    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/fragments/LeaderboardFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/LeaderboardFragment;

    .prologue
    .line 42
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/LeaderboardFragment;->handleDismissed()V

    return-void
.end method

.method static synthetic access$100(Lcom/vkontakte/android/fragments/LeaderboardFragment;)Lcom/vkontakte/android/api/apps/AppsGetGameLeaderboard$LeaderboardData;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/LeaderboardFragment;

    .prologue
    .line 42
    iget-object v0, p0, Lcom/vkontakte/android/fragments/LeaderboardFragment;->leaderboardData:Lcom/vkontakte/android/api/apps/AppsGetGameLeaderboard$LeaderboardData;

    return-object v0
.end method

.method static synthetic access$200(Lcom/vkontakte/android/fragments/LeaderboardFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/LeaderboardFragment;

    .prologue
    .line 42
    iget-object v0, p0, Lcom/vkontakte/android/fragments/LeaderboardFragment;->leaderboardList:Ljava/util/ArrayList;

    return-object v0
.end method

.method private handleDismissed()V
    .locals 1

    .prologue
    .line 81
    iget-object v0, p0, Lcom/vkontakte/android/fragments/LeaderboardFragment;->dismissedListener:Lcom/vkontakte/android/fragments/LeaderboardFragment$OnDismissedListener;

    if-eqz v0, :cond_0

    .line 82
    iget-object v0, p0, Lcom/vkontakte/android/fragments/LeaderboardFragment;->dismissedListener:Lcom/vkontakte/android/fragments/LeaderboardFragment$OnDismissedListener;

    invoke-interface {v0}, Lcom/vkontakte/android/fragments/LeaderboardFragment$OnDismissedListener;->onLeaderboardDismissed()V

    .line 84
    :cond_0
    return-void
.end method

.method private prepareLeaderboardList(Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/data/GameLeaderboard;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 141
    .local p1, "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/data/GameLeaderboard;>;"
    iput-object p1, p0, Lcom/vkontakte/android/fragments/LeaderboardFragment;->leaderboardList:Ljava/util/ArrayList;

    .line 143
    return-void
.end method


# virtual methods
.method public onCancel(Landroid/content/DialogInterface;)V
    .locals 0
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 76
    invoke-super {p0, p1}, Landroid/support/design/widget/BottomSheetDialogFragment;->onCancel(Landroid/content/DialogInterface;)V

    .line 77
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/LeaderboardFragment;->handleDismissed()V

    .line 78
    return-void
.end method

.method public setupDialog(Landroid/app/Dialog;I)V
    .locals 12
    .param p1, "dialog"    # Landroid/app/Dialog;
    .param p2, "style"    # I

    .prologue
    const/4 v11, -0x1

    const/4 v10, 0x0

    .line 88
    invoke-super {p0, p1, p2}, Landroid/support/design/widget/BottomSheetDialogFragment;->setupDialog(Landroid/app/Dialog;I)V

    .line 89
    invoke-virtual {p1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v7

    const/16 v8, 0x400

    invoke-virtual {v7, v8}, Landroid/view/Window;->addFlags(I)V

    .line 90
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/LeaderboardFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v7

    const-string/jumbo v8, "leaderboard_data"

    invoke-virtual {v7, v8}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v7

    check-cast v7, Lcom/vkontakte/android/api/apps/AppsGetGameLeaderboard$LeaderboardData;

    iput-object v7, p0, Lcom/vkontakte/android/fragments/LeaderboardFragment;->leaderboardData:Lcom/vkontakte/android/api/apps/AppsGetGameLeaderboard$LeaderboardData;

    .line 92
    iget-object v7, p0, Lcom/vkontakte/android/fragments/LeaderboardFragment;->leaderboardData:Lcom/vkontakte/android/api/apps/AppsGetGameLeaderboard$LeaderboardData;

    iget-object v7, v7, Lcom/vkontakte/android/api/apps/AppsGetGameLeaderboard$LeaderboardData;->leaderboard:Ljava/util/ArrayList;

    invoke-direct {p0, v7}, Lcom/vkontakte/android/fragments/LeaderboardFragment;->prepareLeaderboardList(Ljava/util/ArrayList;)V

    .line 93
    new-instance v7, Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/LeaderboardFragment;->getContext()Landroid/content/Context;

    move-result-object v8

    invoke-direct {v7, v8}, Lme/grishka/appkit/views/UsableRecyclerView;-><init>(Landroid/content/Context;)V

    iput-object v7, p0, Lcom/vkontakte/android/fragments/LeaderboardFragment;->usableRecyclerView:Lme/grishka/appkit/views/UsableRecyclerView;

    .line 94
    iget-object v7, p0, Lcom/vkontakte/android/fragments/LeaderboardFragment;->usableRecyclerView:Lme/grishka/appkit/views/UsableRecyclerView;

    new-instance v8, Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/LeaderboardFragment;->getContext()Landroid/content/Context;

    move-result-object v9

    invoke-direct {v8, v9}, Landroid/support/v7/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    invoke-virtual {v7, v8}, Lme/grishka/appkit/views/UsableRecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    .line 95
    iget-object v7, p0, Lcom/vkontakte/android/fragments/LeaderboardFragment;->usableRecyclerView:Lme/grishka/appkit/views/UsableRecyclerView;

    new-instance v8, Lcom/vkontakte/android/fragments/LeaderboardFragment$Adapter;

    invoke-direct {v8, p0}, Lcom/vkontakte/android/fragments/LeaderboardFragment$Adapter;-><init>(Lcom/vkontakte/android/fragments/LeaderboardFragment;)V

    invoke-virtual {v7, v8}, Lme/grishka/appkit/views/UsableRecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 97
    new-instance v6, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v6, v11, v11}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 98
    .local v6, "recViewParams":Landroid/widget/FrameLayout$LayoutParams;
    const/16 v7, 0x30

    invoke-static {v7}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v7

    invoke-virtual {v6, v10, v10, v10, v7}, Landroid/widget/FrameLayout$LayoutParams;->setMargins(IIII)V

    .line 100
    iget-object v7, p0, Lcom/vkontakte/android/fragments/LeaderboardFragment;->usableRecyclerView:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {p1, v7, v6}, Landroid/app/Dialog;->setContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 102
    iget-object v7, p0, Lcom/vkontakte/android/fragments/LeaderboardFragment;->usableRecyclerView:Lme/grishka/appkit/views/UsableRecyclerView;

    .line 103
    invoke-virtual {v7}, Lme/grishka/appkit/views/UsableRecyclerView;->getParent()Landroid/view/ViewParent;

    move-result-object v7

    check-cast v7, Landroid/view/View;

    invoke-virtual {v7}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;

    .line 104
    .local v3, "layoutParams":Landroid/support/design/widget/CoordinatorLayout$LayoutParams;
    invoke-virtual {v3}, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->getBehavior()Landroid/support/design/widget/CoordinatorLayout$Behavior;

    move-result-object v0

    .line 106
    .local v0, "behavior":Landroid/support/design/widget/CoordinatorLayout$Behavior;
    if-eqz v0, :cond_0

    instance-of v7, v0, Landroid/support/design/widget/BottomSheetBehavior;

    if-eqz v7, :cond_0

    move-object v7, v0

    .line 107
    check-cast v7, Landroid/support/design/widget/BottomSheetBehavior;

    iget-object v8, p0, Lcom/vkontakte/android/fragments/LeaderboardFragment;->mBottomSheetBehaviorCallback:Landroid/support/design/widget/BottomSheetBehavior$BottomSheetCallback;

    invoke-virtual {v7, v8}, Landroid/support/design/widget/BottomSheetBehavior;->setBottomSheetCallback(Landroid/support/design/widget/BottomSheetBehavior$BottomSheetCallback;)V

    .line 108
    check-cast v0, Landroid/support/design/widget/BottomSheetBehavior;

    .end local v0    # "behavior":Landroid/support/design/widget/CoordinatorLayout$Behavior;
    invoke-static {}, Lcom/vk/core/util/Screen;->height()I

    move-result v7

    int-to-float v7, v7

    const/high16 v8, 0x428c0000    # 70.0f

    mul-float/2addr v7, v8

    const/high16 v8, 0x42c80000    # 100.0f

    div-float/2addr v7, v8

    float-to-int v7, v7

    invoke-virtual {v0, v7}, Landroid/support/design/widget/BottomSheetBehavior;->setPeekHeight(I)V

    .line 112
    :cond_0
    iget-object v7, p0, Lcom/vkontakte/android/fragments/LeaderboardFragment;->usableRecyclerView:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v7}, Lme/grishka/appkit/views/UsableRecyclerView;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    .line 113
    .local v2, "container":Landroid/view/View;
    invoke-virtual {v2, v10}, Landroid/view/View;->setBackgroundColor(I)V

    .line 115
    iget-object v7, p0, Lcom/vkontakte/android/fragments/LeaderboardFragment;->usableRecyclerView:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v7}, Lme/grishka/appkit/views/UsableRecyclerView;->getParent()Landroid/view/ViewParent;

    move-result-object v7

    invoke-interface {v7}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    check-cast v1, Landroid/support/design/widget/CoordinatorLayout;

    .line 117
    .local v1, "cl":Landroid/support/design/widget/CoordinatorLayout;
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/LeaderboardFragment;->getContext()Landroid/content/Context;

    move-result-object v7

    invoke-static {v7}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v7

    const v8, 0x7f0300d4

    invoke-virtual {v7, v8, v1, v10}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v4

    .line 119
    .local v4, "playAgainButton":Landroid/view/View;
    const v7, 0x7f100326

    invoke-virtual {v4, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    .line 120
    .local v5, "playAgainTextView":Landroid/widget/TextView;
    sget v7, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v8, 0x15

    if-lt v7, v8, :cond_1

    .line 121
    const/high16 v7, 0x43480000    # 200.0f

    invoke-virtual {v4, v7}, Landroid/view/View;->setElevation(F)V

    .line 124
    :cond_1
    iget-object v7, p0, Lcom/vkontakte/android/fragments/LeaderboardFragment;->leaderboardList:Ljava/util/ArrayList;

    invoke-virtual {v7, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/vkontakte/android/data/GameLeaderboard;

    iget-boolean v7, v7, Lcom/vkontakte/android/data/GameLeaderboard;->isPoints:Z

    if-eqz v7, :cond_2

    const v7, 0x7f08030f

    invoke-virtual {p0, v7}, Lcom/vkontakte/android/fragments/LeaderboardFragment;->getString(I)Ljava/lang/String;

    move-result-object v7

    :goto_0
    invoke-virtual {v5, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 126
    new-instance v7, Lcom/vkontakte/android/fragments/LeaderboardFragment$2;

    invoke-direct {v7, p0}, Lcom/vkontakte/android/fragments/LeaderboardFragment$2;-><init>(Lcom/vkontakte/android/fragments/LeaderboardFragment;)V

    invoke-virtual {v4, v7}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 134
    invoke-virtual {v1, v4}, Landroid/support/design/widget/CoordinatorLayout;->addView(Landroid/view/View;)V

    .line 135
    return-void

    .line 124
    :cond_2
    const v7, 0x7f08030d

    invoke-virtual {p0, v7}, Lcom/vkontakte/android/fragments/LeaderboardFragment;->getString(I)Ljava/lang/String;

    move-result-object v7

    goto :goto_0
.end method
