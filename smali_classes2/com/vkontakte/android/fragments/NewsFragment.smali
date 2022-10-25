.class public Lcom/vkontakte/android/fragments/NewsFragment;
.super Lcom/vkontakte/android/fragments/PostListFragment;
.source "NewsFragment.java"

# interfaces
.implements Lme/grishka/appkit/views/NavigationSpinner$DropDownWidthHelper;
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/fragments/NewsFragment$StoriesHeaderAdapter;,
        Lcom/vkontakte/android/fragments/NewsFragment$StoriesHeaderHolder;,
        Lcom/vkontakte/android/fragments/NewsFragment$HeaderAdapter;,
        Lcom/vkontakte/android/fragments/NewsFragment$HeaderHolder;,
        Lcom/vkontakte/android/fragments/NewsFragment$StoriesAdapter;,
        Lcom/vkontakte/android/fragments/NewsFragment$StoriesHolder;,
        Lcom/vkontakte/android/fragments/NewsFragment$StoriesListInvalidateListener;,
        Lcom/vkontakte/android/fragments/NewsFragment$StoryMarkAsSeenListener;
    }
.end annotation


# static fields
.field private static listIDStatic:I


# instance fields
.field private clearForNew:Z

.field private currentButtonAnim:Landroid/animation/Animator;

.field private firstNav:Z

.field private forceNewData:Z

.field private from:Ljava/lang/String;

.field private headerAdapter:Lcom/vkontakte/android/fragments/NewsFragment$HeaderAdapter;

.field private isFirstNav:Z

.field private lastOwnerId:I

.field private lastPosition:I

.field private lastPostId:I

.field private lastPreloadTime:J

.field private listID:I

.field private loadingHeaders:[Landroid/view/View;

.field private navAdapter:Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter;

.field private needScrollToTop:Z

.field private needSetSelection:Z

.field private newFrom:Ljava/lang/String;

.field private newNews:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/NewsEntry;",
            ">;"
        }
    .end annotation
.end field

.field private newNewsReq:Lcom/vkontakte/android/api/VKAPIRequest;

.field private newPostsBtn:Landroid/view/View;

.field private newPostsButtonPendingVisibility:Z

.field private newPostsHideBoundary:I

.field private newPostsHideThreshold:I

.field private previousListIDStatic:I

.field private receiver:Landroid/content/BroadcastReceiver;

.field private reloadByTime:Z

.field private storiesHeaderAdapter:Lcom/vkontakte/android/fragments/NewsFragment$StoriesHeaderAdapter;

.field private final storiesListInvalidateListener:Lcom/vkontakte/android/fragments/NewsFragment$StoriesListInvalidateListener;

.field private final storyUpdateListener:Lcom/vkontakte/android/fragments/NewsFragment$StoryMarkAsSeenListener;

.field private wasResumed:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 96
    const/4 v0, 0x0

    sput v0, Lcom/vkontakte/android/fragments/NewsFragment;->listIDStatic:I

    return-void
.end method

.method public constructor <init>()V
    .locals 4

    .prologue
    const/4 v3, -0x1

    const/4 v2, 0x0

    .line 89
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/PostListFragment;-><init>()V

    .line 91
    new-instance v0, Lcom/vkontakte/android/fragments/NewsFragment$StoryMarkAsSeenListener;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/NewsFragment$StoryMarkAsSeenListener;-><init>(Lcom/vkontakte/android/fragments/NewsFragment;)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->storyUpdateListener:Lcom/vkontakte/android/fragments/NewsFragment$StoryMarkAsSeenListener;

    .line 92
    new-instance v0, Lcom/vkontakte/android/fragments/NewsFragment$StoriesListInvalidateListener;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/NewsFragment$StoriesListInvalidateListener;-><init>(Lcom/vkontakte/android/fragments/NewsFragment;)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->storiesListInvalidateListener:Lcom/vkontakte/android/fragments/NewsFragment$StoriesListInvalidateListener;

    .line 103
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->newNews:Ljava/util/List;

    .line 104
    iput-boolean v2, p0, Lcom/vkontakte/android/fragments/NewsFragment;->needSetSelection:Z

    .line 106
    const/4 v0, 0x2

    new-array v0, v0, [Landroid/view/View;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->loadingHeaders:[Landroid/view/View;

    .line 107
    iput v3, p0, Lcom/vkontakte/android/fragments/NewsFragment;->newPostsHideBoundary:I

    const/4 v0, 0x3

    iput v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->newPostsHideThreshold:I

    .line 108
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->lastPreloadTime:J

    .line 109
    iput-boolean v2, p0, Lcom/vkontakte/android/fragments/NewsFragment;->clearForNew:Z

    .line 112
    iput-boolean v2, p0, Lcom/vkontakte/android/fragments/NewsFragment;->newPostsButtonPendingVisibility:Z

    .line 113
    iput-boolean v2, p0, Lcom/vkontakte/android/fragments/NewsFragment;->forceNewData:Z

    .line 114
    iput v3, p0, Lcom/vkontakte/android/fragments/NewsFragment;->lastPosition:I

    .line 115
    iput v3, p0, Lcom/vkontakte/android/fragments/NewsFragment;->lastPostId:I

    .line 116
    iput v3, p0, Lcom/vkontakte/android/fragments/NewsFragment;->lastOwnerId:I

    .line 117
    iput-boolean v2, p0, Lcom/vkontakte/android/fragments/NewsFragment;->needScrollToTop:Z

    .line 118
    iput-boolean v2, p0, Lcom/vkontakte/android/fragments/NewsFragment;->wasResumed:Z

    .line 119
    iput-boolean v2, p0, Lcom/vkontakte/android/fragments/NewsFragment;->isFirstNav:Z

    .line 132
    new-instance v0, Lcom/vkontakte/android/fragments/NewsFragment$1;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/NewsFragment$1;-><init>(Lcom/vkontakte/android/fragments/NewsFragment;)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->receiver:Landroid/content/BroadcastReceiver;

    .line 280
    iput-boolean v2, p0, Lcom/vkontakte/android/fragments/NewsFragment;->reloadByTime:Z

    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/fragments/NewsFragment;)Lme/grishka/appkit/views/UsableRecyclerView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/NewsFragment;

    .prologue
    .line 89
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    return-object v0
.end method

.method static synthetic access$100(Lcom/vkontakte/android/fragments/NewsFragment;)Lme/grishka/appkit/views/UsableRecyclerView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/NewsFragment;

    .prologue
    .line 89
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    return-object v0
.end method

.method static synthetic access$1000(Lcom/vkontakte/android/fragments/NewsFragment;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/NewsFragment;
    .param p1, "x1"    # Z

    .prologue
    .line 89
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/NewsFragment;->setNewPostsBtnVisible(Z)V

    return-void
.end method

.method static synthetic access$1102(Lcom/vkontakte/android/fragments/NewsFragment;Landroid/animation/Animator;)Landroid/animation/Animator;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/NewsFragment;
    .param p1, "x1"    # Landroid/animation/Animator;

    .prologue
    .line 89
    iput-object p1, p0, Lcom/vkontakte/android/fragments/NewsFragment;->currentButtonAnim:Landroid/animation/Animator;

    return-object p1
.end method

.method static synthetic access$1200(Lcom/vkontakte/android/fragments/NewsFragment;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/NewsFragment;

    .prologue
    .line 89
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->newPostsBtn:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$1300(Lcom/vkontakte/android/fragments/NewsFragment;Lcom/vk/stories/model/GetStoriesResponse;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/NewsFragment;
    .param p1, "x1"    # Lcom/vk/stories/model/GetStoriesResponse;

    .prologue
    .line 89
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/NewsFragment;->onStoriesLoaded(Lcom/vk/stories/model/GetStoriesResponse;)V

    return-void
.end method

.method static synthetic access$1402(Lcom/vkontakte/android/fragments/NewsFragment;Lcom/vkontakte/android/api/VKAPIRequest;)Lcom/vkontakte/android/api/VKAPIRequest;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/NewsFragment;
    .param p1, "x1"    # Lcom/vkontakte/android/api/VKAPIRequest;

    .prologue
    .line 89
    iput-object p1, p0, Lcom/vkontakte/android/fragments/NewsFragment;->newNewsReq:Lcom/vkontakte/android/api/VKAPIRequest;

    return-object p1
.end method

.method static synthetic access$1502(Lcom/vkontakte/android/fragments/NewsFragment;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/NewsFragment;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 89
    iput-object p1, p0, Lcom/vkontakte/android/fragments/NewsFragment;->newFrom:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$1600(Lcom/vkontakte/android/fragments/NewsFragment;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/NewsFragment;

    .prologue
    .line 89
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->newNews:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$1700(Lcom/vkontakte/android/fragments/NewsFragment;Ljava/util/List;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/NewsFragment;
    .param p1, "x1"    # Ljava/util/List;
    .param p2, "x2"    # Z

    .prologue
    .line 89
    invoke-direct {p0, p1, p2}, Lcom/vkontakte/android/fragments/NewsFragment;->fillSpinnerAdapter(Ljava/util/List;Z)V

    return-void
.end method

.method static synthetic access$1800(Lcom/vkontakte/android/fragments/NewsFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/NewsFragment;

    .prologue
    .line 89
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$1900(Lcom/vkontakte/android/fragments/NewsFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/NewsFragment;

    .prologue
    .line 89
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$200(Lcom/vkontakte/android/fragments/NewsFragment;)Lme/grishka/appkit/views/UsableRecyclerView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/NewsFragment;

    .prologue
    .line 89
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    return-object v0
.end method

.method static synthetic access$2000(Lcom/vkontakte/android/fragments/NewsFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/NewsFragment;

    .prologue
    .line 89
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$2100(Lcom/vkontakte/android/fragments/NewsFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/NewsFragment;

    .prologue
    .line 89
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$2200(Lcom/vkontakte/android/fragments/NewsFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/NewsFragment;

    .prologue
    .line 89
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$2300(Lcom/vkontakte/android/fragments/NewsFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/NewsFragment;

    .prologue
    .line 89
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$2400(Lcom/vkontakte/android/fragments/NewsFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/NewsFragment;

    .prologue
    .line 89
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$2500(Lcom/vkontakte/android/fragments/NewsFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/NewsFragment;

    .prologue
    .line 89
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$2600(Lcom/vkontakte/android/fragments/NewsFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/NewsFragment;

    .prologue
    .line 89
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$2700(Lcom/vkontakte/android/fragments/NewsFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/NewsFragment;

    .prologue
    .line 89
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$2800(Lcom/vkontakte/android/fragments/NewsFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/NewsFragment;

    .prologue
    .line 89
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$2900(Lcom/vkontakte/android/fragments/NewsFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/NewsFragment;

    .prologue
    .line 89
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$300(Lcom/vkontakte/android/fragments/NewsFragment;)I
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/NewsFragment;

    .prologue
    .line 89
    iget v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->lastPosition:I

    return v0
.end method

.method static synthetic access$3000(Lcom/vkontakte/android/fragments/NewsFragment;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/NewsFragment;
    .param p1, "x1"    # Z

    .prologue
    .line 89
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/NewsFragment;->showNew(Z)V

    return-void
.end method

.method static synthetic access$302(Lcom/vkontakte/android/fragments/NewsFragment;I)I
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/NewsFragment;
    .param p1, "x1"    # I

    .prologue
    .line 89
    iput p1, p0, Lcom/vkontakte/android/fragments/NewsFragment;->lastPosition:I

    return p1
.end method

.method static synthetic access$3100(Lcom/vkontakte/android/fragments/NewsFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/NewsFragment;

    .prologue
    .line 89
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$3200(Lcom/vkontakte/android/fragments/NewsFragment;)Lme/grishka/appkit/views/UsableRecyclerView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/NewsFragment;

    .prologue
    .line 89
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    return-object v0
.end method

.method static synthetic access$3302(Lcom/vkontakte/android/fragments/NewsFragment;J)J
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/NewsFragment;
    .param p1, "x1"    # J

    .prologue
    .line 89
    iput-wide p1, p0, Lcom/vkontakte/android/fragments/NewsFragment;->lastPreloadTime:J

    return-wide p1
.end method

.method static synthetic access$3400(Lcom/vkontakte/android/fragments/NewsFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/NewsFragment;

    .prologue
    .line 89
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/NewsFragment;->updateNewPostsBtn()V

    return-void
.end method

.method static synthetic access$3500(Lcom/vkontakte/android/fragments/NewsFragment;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/NewsFragment;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 89
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/NewsFragment;->setFrom(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$3600(Lcom/vkontakte/android/fragments/NewsFragment;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/NewsFragment;

    .prologue
    .line 89
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/NewsFragment;->getFrom()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$3700(Lcom/vkontakte/android/fragments/NewsFragment;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/NewsFragment;

    .prologue
    .line 89
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->needScrollToTop:Z

    return v0
.end method

.method static synthetic access$3702(Lcom/vkontakte/android/fragments/NewsFragment;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/NewsFragment;
    .param p1, "x1"    # Z

    .prologue
    .line 89
    iput-boolean p1, p0, Lcom/vkontakte/android/fragments/NewsFragment;->needScrollToTop:Z

    return p1
.end method

.method static synthetic access$3800(Lcom/vkontakte/android/fragments/NewsFragment;)Lme/grishka/appkit/views/UsableRecyclerView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/NewsFragment;

    .prologue
    .line 89
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    return-object v0
.end method

.method static synthetic access$3900(Lcom/vkontakte/android/fragments/NewsFragment;)Lme/grishka/appkit/views/UsableRecyclerView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/NewsFragment;

    .prologue
    .line 89
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    return-object v0
.end method

.method static synthetic access$4000(Lcom/vkontakte/android/fragments/NewsFragment;)Lcom/vkontakte/android/fragments/NewsFragment$StoriesHeaderAdapter;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/NewsFragment;

    .prologue
    .line 89
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->storiesHeaderAdapter:Lcom/vkontakte/android/fragments/NewsFragment$StoriesHeaderAdapter;

    return-object v0
.end method

.method static synthetic access$402(Lcom/vkontakte/android/fragments/NewsFragment;I)I
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/NewsFragment;
    .param p1, "x1"    # I

    .prologue
    .line 89
    iput p1, p0, Lcom/vkontakte/android/fragments/NewsFragment;->lastPostId:I

    return p1
.end method

.method static synthetic access$4300(Lcom/vkontakte/android/fragments/NewsFragment;)Lme/grishka/appkit/views/UsableRecyclerView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/NewsFragment;

    .prologue
    .line 89
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    return-object v0
.end method

.method static synthetic access$4400(Lcom/vkontakte/android/fragments/NewsFragment;)Lme/grishka/appkit/views/UsableRecyclerView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/NewsFragment;

    .prologue
    .line 89
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    return-object v0
.end method

.method static synthetic access$4500(Lcom/vkontakte/android/fragments/NewsFragment;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/NewsFragment;

    .prologue
    .line 89
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->isTablet:Z

    return v0
.end method

.method static synthetic access$4600(Lcom/vkontakte/android/fragments/NewsFragment;)I
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/NewsFragment;

    .prologue
    .line 89
    iget v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->listID:I

    return v0
.end method

.method static synthetic access$4700(Lcom/vkontakte/android/fragments/NewsFragment;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/NewsFragment;

    .prologue
    .line 89
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->isTablet:Z

    return v0
.end method

.method static synthetic access$502(Lcom/vkontakte/android/fragments/NewsFragment;I)I
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/NewsFragment;
    .param p1, "x1"    # I

    .prologue
    .line 89
    iput p1, p0, Lcom/vkontakte/android/fragments/NewsFragment;->lastOwnerId:I

    return p1
.end method

.method static synthetic access$600(Lcom/vkontakte/android/fragments/NewsFragment;)Lme/grishka/appkit/views/UsableRecyclerView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/NewsFragment;

    .prologue
    .line 89
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    return-object v0
.end method

.method static synthetic access$700(Lcom/vkontakte/android/fragments/NewsFragment;)I
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/NewsFragment;

    .prologue
    .line 89
    iget v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->newPostsHideBoundary:I

    return v0
.end method

.method static synthetic access$702(Lcom/vkontakte/android/fragments/NewsFragment;I)I
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/NewsFragment;
    .param p1, "x1"    # I

    .prologue
    .line 89
    iput p1, p0, Lcom/vkontakte/android/fragments/NewsFragment;->newPostsHideBoundary:I

    return p1
.end method

.method static synthetic access$800(Lcom/vkontakte/android/fragments/NewsFragment;)I
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/NewsFragment;

    .prologue
    .line 89
    iget v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->newPostsHideThreshold:I

    return v0
.end method

.method static synthetic access$900(Lcom/vkontakte/android/fragments/NewsFragment;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/NewsFragment;

    .prologue
    .line 89
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->clearForNew:Z

    return v0
.end method

.method static synthetic access$902(Lcom/vkontakte/android/fragments/NewsFragment;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/NewsFragment;
    .param p1, "x1"    # Z

    .prologue
    .line 89
    iput-boolean p1, p0, Lcom/vkontakte/android/fragments/NewsFragment;->clearForNew:Z

    return p1
.end method

.method static synthetic access$lambda$0(Lcom/vkontakte/android/fragments/NewsFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/vkontakte/android/fragments/NewsFragment;->updateNewPostsBtn()V

    return-void
.end method

.method private fillSpinnerAdapter(Ljava/util/List;Z)V
    .locals 14
    .param p1    # Ljava/util/List;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p2, "isStartFromInteresting"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/NewsfeedList;",
            ">;Z)V"
        }
    .end annotation

    .prologue
    .line 400
    .local p1, "lists":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/NewsfeedList;>;"
    if-eqz p1, :cond_0

    .line 401
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->navAdapter:Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter;->clear()V

    .line 403
    :cond_0
    sget-object v6, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    .line 404
    .local v6, "context":Landroid/content/Context;
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->navAdapter:Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter;->getCount()I

    move-result v0

    if-nez v0, :cond_2

    .line 405
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->navAdapter:Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter;

    new-instance v1, Lcom/vkontakte/android/NewsfeedList;

    const/4 v2, 0x0

    const v3, 0x7f080431

    invoke-virtual {v6, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lcom/vkontakte/android/NewsfeedList;-><init>(ILjava/lang/String;)V

    const v2, 0x7f0201f2

    const v3, 0x7f0806b7

    .line 406
    invoke-virtual {v6, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    move/from16 v4, p2

    move-object v5, p0

    .line 405
    invoke-virtual/range {v0 .. v5}, Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter;->add(Lcom/vkontakte/android/NewsfeedList;ILjava/lang/String;ZLandroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 407
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->navAdapter:Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter;

    new-instance v1, Lcom/vkontakte/android/NewsfeedList;

    const/4 v2, -0x1

    const v3, 0x7f080592

    invoke-virtual {v6, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lcom/vkontakte/android/NewsfeedList;-><init>(ILjava/lang/String;)V

    const v2, 0x7f020288

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter;->add(Lcom/vkontakte/android/NewsfeedList;I)V

    .line 410
    const/4 v0, 0x3

    new-array v12, v0, [Z

    fill-array-data v12, :array_0

    .line 411
    .local v12, "sectionEnables":[Z
    const/4 v0, 0x3

    new-array v13, v0, [I

    fill-array-data v13, :array_1

    .line 412
    .local v13, "strRes":[I
    const/4 v0, 0x3

    new-array v7, v0, [I

    fill-array-data v7, :array_2

    .line 413
    .local v7, "drawRes":[I
    const/4 v0, 0x3

    new-array v9, v0, [I

    fill-array-data v9, :array_3

    .line 415
    .local v9, "ids":[I
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_0
    array-length v0, v12

    if-ge v8, v0, :cond_2

    .line 416
    aget-boolean v0, v12, v8

    if-eqz v0, :cond_1

    .line 417
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->navAdapter:Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter;

    new-instance v1, Lcom/vkontakte/android/NewsfeedList;

    aget v2, v9, v8

    aget v3, v13, v8

    invoke-virtual {v6, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lcom/vkontakte/android/NewsfeedList;-><init>(ILjava/lang/String;)V

    aget v2, v7, v8

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter;->add(Lcom/vkontakte/android/NewsfeedList;I)V

    .line 415
    :cond_1
    add-int/lit8 v8, v8, 0x1

    goto :goto_0

    .line 421
    .end local v7    # "drawRes":[I
    .end local v8    # "i":I
    .end local v9    # "ids":[I
    .end local v12    # "sectionEnables":[Z
    .end local v13    # "strRes":[I
    :cond_2
    const/4 v8, 0x0

    .restart local v8    # "i":I
    :goto_1
    if-eqz p1, :cond_6

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    if-ge v8, v0, :cond_6

    .line 422
    invoke-interface {p1, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/vkontakte/android/NewsfeedList;

    .line 423
    .local v11, "item":Lcom/vkontakte/android/NewsfeedList;
    invoke-virtual {v11}, Lcom/vkontakte/android/NewsfeedList;->isPromoList()Z

    move-result v10

    .line 424
    .local v10, "isPromo":Z
    invoke-virtual {v11}, Lcom/vkontakte/android/NewsfeedList;->getId()I

    move-result v0

    if-gtz v0, :cond_3

    if-eqz v10, :cond_4

    .line 425
    :cond_3
    iget-object v1, p0, Lcom/vkontakte/android/fragments/NewsFragment;->navAdapter:Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter;

    if-eqz v10, :cond_5

    const v0, 0x7f0201c7

    :goto_2
    invoke-virtual {v1, v11, v0}, Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter;->add(Lcom/vkontakte/android/NewsfeedList;I)V

    .line 421
    :cond_4
    add-int/lit8 v8, v8, 0x1

    goto :goto_1

    .line 425
    :cond_5
    const v0, 0x7f0201da

    goto :goto_2

    .line 429
    .end local v10    # "isPromo":Z
    .end local v11    # "item":Lcom/vkontakte/android/NewsfeedList;
    :cond_6
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->navigationSpinner:Landroid/widget/Spinner;

    if-eqz v0, :cond_8

    .line 430
    const/4 v8, 0x0

    :goto_3
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->navAdapter:Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter;->getCount()I

    move-result v0

    if-ge v8, v0, :cond_8

    .line 431
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->navAdapter:Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter;

    invoke-virtual {v0, v8}, Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter$Item;

    .line 432
    .local v11, "item":Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter$Item;
    if-eqz v11, :cond_7

    iget-object v0, v11, Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter$Item;->listItem:Lcom/vkontakte/android/NewsfeedList;

    invoke-virtual {v0}, Lcom/vkontakte/android/NewsfeedList;->getId()I

    move-result v0

    iget v1, p0, Lcom/vkontakte/android/fragments/NewsFragment;->listID:I

    if-ne v0, v1, :cond_7

    .line 433
    invoke-virtual {p0, v8}, Lcom/vkontakte/android/fragments/NewsFragment;->setSelectedNavigationItem(I)V

    .line 430
    :cond_7
    add-int/lit8 v8, v8, 0x1

    goto :goto_3

    .line 437
    .end local v11    # "item":Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter$Item;
    :cond_8
    return-void

    .line 410
    :array_0
    .array-data 1
        0x1t
        0x1t
        0x1t
    .end array-data

    .line 411
    :array_1
    .array-data 4
        0x7f08023b
        0x7f0804b0
        0x7f08076e
    .end array-data

    .line 412
    :array_2
    .array-data 4
        0x7f0201ed
        0x7f0201f5
        0x7f0201f9
    .end array-data

    .line 413
    :array_3
    .array-data 4
        -0x2
        -0x4
        -0x5
    .end array-data
.end method

.method private getFrom()Ljava/lang/String;
    .locals 1

    .prologue
    .line 129
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->from:Ljava/lang/String;

    return-object v0
.end method

.method public static getNewsfeedAwayTime()I
    .locals 8

    .prologue
    const-wide/16 v6, 0x0

    .line 1170
    sget-object v2, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    const-string/jumbo v3, "newsfeed_last_opened"

    invoke-interface {v2, v3, v6, v7}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    .line 1171
    .local v0, "lastTime":J
    cmp-long v2, v0, v6

    if-lez v2, :cond_0

    .line 1172
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    sub-long/2addr v2, v0

    long-to-int v2, v2

    div-int/lit16 v2, v2, 0x3e8

    .line 1174
    :goto_0
    return v2

    :cond_0
    const/4 v2, -0x1

    goto :goto_0
.end method

.method private getPromoIdByRedirect()Ljava/lang/String;
    .locals 3

    .prologue
    .line 1196
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/NewsFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    .line 1197
    .local v0, "args":Landroid/os/Bundle;
    if-nez v0, :cond_0

    .line 1198
    const/4 v1, 0x0

    .line 1202
    :goto_0
    return-object v1

    .line 1200
    :cond_0
    const-string/jumbo v2, "feed_id"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 1201
    .local v1, "promoId":Ljava/lang/String;
    const-string/jumbo v2, "feed_id"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private initLastValuesIfNeed(Ljava/util/ArrayList;)V
    .locals 2
    .param p1    # Ljava/util/ArrayList;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/NewsEntry;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 1005
    .local p1, "e":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/NewsEntry;>;"
    iget v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->lastPosition:I

    if-gez v0, :cond_1

    iget v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->lastPostId:I

    if-gez v0, :cond_1

    iget v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->lastOwnerId:I

    if-gez v0, :cond_1

    .line 1006
    if-nez p1, :cond_0

    .line 1007
    invoke-static {}, Lcom/vkontakte/android/cache/NewsfeedCache;->get()Ljava/util/ArrayList;

    move-result-object p1

    .line 1009
    :cond_0
    invoke-static {}, Lcom/vkontakte/android/cache/NewsfeedCache;->getFirstShowedIndex()I

    move-result v0

    sput v0, Lcom/vkontakte/android/data/Posts;->feedItem:I

    iput v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->lastPosition:I

    .line 1010
    invoke-static {}, Lcom/vkontakte/android/cache/NewsfeedCache;->getFirstShowedOffset()I

    move-result v0

    sput v0, Lcom/vkontakte/android/data/Posts;->feedItemOffset:I

    .line 1011
    iget v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->lastPosition:I

    if-ltz v0, :cond_1

    if-eqz p1, :cond_1

    iget v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->lastPosition:I

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 1012
    iget v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->lastPosition:I

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/NewsEntry;

    iget v0, v0, Lcom/vkontakte/android/NewsEntry;->postID:I

    iput v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->lastPostId:I

    .line 1013
    iget v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->lastPosition:I

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/NewsEntry;

    iget v0, v0, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    iput v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->lastOwnerId:I

    .line 1016
    :cond_1
    return-void
.end method

.method static synthetic lambda$showNew$6(Ljava/util/ArrayList;)V
    .locals 0
    .param p0, "forCache"    # Ljava/util/ArrayList;

    .prologue
    .line 692
    invoke-static {p0}, Lcom/vkontakte/android/cache/NewsfeedCache;->replace(Ljava/util/List;)V

    return-void
.end method

.method private loadStoriesSync()V
    .locals 1

    .prologue
    .line 1207
    invoke-static {}, Lcom/vk/stories/StoriesController;->getCachedStories()Lcom/vk/stories/model/GetStoriesResponse;

    move-result-object v0

    .line 1208
    .local v0, "r":Lcom/vk/stories/model/GetStoriesResponse;
    invoke-direct {p0, v0}, Lcom/vkontakte/android/fragments/NewsFragment;->setStoriesResponse(Lcom/vk/stories/model/GetStoriesResponse;)V

    .line 1209
    return-void
.end method

.method public static onLogout()V
    .locals 1

    .prologue
    .line 162
    const/4 v0, 0x0

    sput v0, Lcom/vkontakte/android/fragments/NewsFragment;->listIDStatic:I

    .line 163
    return-void
.end method

.method private onStoriesLoaded(Lcom/vk/stories/model/GetStoriesResponse;)V
    .locals 1
    .param p1, "storiesResponse"    # Lcom/vk/stories/model/GetStoriesResponse;

    .prologue
    .line 1212
    if-nez p1, :cond_0

    .line 1217
    :goto_0
    return-void

    .line 1215
    :cond_0
    iget-object v0, p1, Lcom/vk/stories/model/GetStoriesResponse;->originalJsonObject:Lorg/json/JSONObject;

    invoke-static {v0}, Lcom/vk/stories/StoriesController;->setCachedStories(Lorg/json/JSONObject;)V

    .line 1216
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/NewsFragment;->setStoriesResponse(Lcom/vk/stories/model/GetStoriesResponse;)V

    goto :goto_0
.end method

.method private preloadIfNeed()V
    .locals 6

    .prologue
    .line 355
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iget-wide v4, p0, Lcom/vkontakte/android/fragments/NewsFragment;->lastPreloadTime:J

    sub-long/2addr v2, v4

    const-wide/32 v4, 0xea60

    cmp-long v1, v2, v4

    if-lez v1, :cond_1

    iget v1, p0, Lcom/vkontakte/android/fragments/NewsFragment;->listID:I

    const/4 v2, -0x1

    if-eq v1, v2, :cond_1

    const/4 v0, 0x1

    .line 356
    .local v0, "needPreload":Z
    :goto_0
    if-eqz v0, :cond_0

    .line 357
    invoke-static {p0}, Lcom/vkontakte/android/fragments/NewsFragment$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/fragments/NewsFragment;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-static {v1}, Lcom/vkontakte/android/data/Analytics;->updateDeviceID(Ljava/lang/Runnable;)V

    .line 367
    :cond_0
    return-void

    .line 355
    .end local v0    # "needPreload":Z
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static resetListIdIfNeed(Z)V
    .locals 10
    .param p0, "forseUpdate"    # Z

    .prologue
    const/4 v5, 0x0

    .line 166
    sget-object v6, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const/4 v7, 0x0

    invoke-virtual {v6, v7, v5}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 167
    .local v1, "sharedPreferences":Landroid/content/SharedPreferences;
    invoke-static {}, Lcom/vkontakte/android/cache/NewsfeedCache;->isNewsfeedTop()Z

    move-result v0

    .line 168
    .local v0, "isTop":Z
    const-string/jumbo v6, "feed_last_unload"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    invoke-interface {v1, v6, v8, v9}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v2

    .line 169
    .local v2, "lastUnload":J
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    sub-long/2addr v6, v2

    invoke-static {v0, v5}, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet;->getRefreshTimeout(ZI)J

    move-result-wide v8

    cmp-long v6, v6, v8

    if-lez v6, :cond_2

    .line 170
    invoke-static {}, Lcom/vkontakte/android/NetworkStateReceiver;->isConnected()Z

    move-result v6

    if-eqz v6, :cond_2

    const/4 v4, 0x1

    .line 171
    .local v4, "updateByTime":Z
    :goto_0
    if-nez v4, :cond_0

    if-eqz p0, :cond_1

    .line 172
    :cond_0
    sput v5, Lcom/vkontakte/android/fragments/NewsFragment;->listIDStatic:I

    .line 174
    :cond_1
    return-void

    .end local v4    # "updateByTime":Z
    :cond_2
    move v4, v5

    .line 170
    goto :goto_0
.end method

.method private setFrom(Ljava/lang/String;)V
    .locals 2
    .param p1, "from"    # Ljava/lang/String;

    .prologue
    .line 122
    if-eqz p1, :cond_0

    .line 123
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->preloader:Lme/grishka/appkit/utils/Preloader;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lme/grishka/appkit/utils/Preloader;->setMoreAvailable(Z)V

    .line 125
    :cond_0
    iput-object p1, p0, Lcom/vkontakte/android/fragments/NewsFragment;->from:Ljava/lang/String;

    .line 126
    return-void
.end method

.method private setNewPostsBtnVisible(Z)V
    .locals 6
    .param p1, "visible"    # Z

    .prologue
    const/4 v5, 0x1

    const/4 v3, 0x0

    const/4 v4, 0x0

    .line 629
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->newPostsButtonPendingVisibility:Z

    if-ne v0, p1, :cond_0

    .line 665
    :goto_0
    return-void

    .line 632
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->currentButtonAnim:Landroid/animation/Animator;

    if-eqz v0, :cond_1

    .line 633
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->currentButtonAnim:Landroid/animation/Animator;

    invoke-virtual {v0}, Landroid/animation/Animator;->cancel()V

    .line 634
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->currentButtonAnim:Landroid/animation/Animator;

    .line 636
    :cond_1
    iput-boolean p1, p0, Lcom/vkontakte/android/fragments/NewsFragment;->newPostsButtonPendingVisibility:Z

    .line 637
    if-eqz p1, :cond_3

    .line 638
    const-string/jumbo v0, "user_action"

    invoke-static {v0}, Lcom/vkontakte/android/data/Analytics;->track(Ljava/lang/String;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v0

    const-string/jumbo v1, "action_type"

    const-string/jumbo v2, "fresh_news"

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->addParam(Ljava/lang/String;Ljava/lang/Object;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v0

    const-string/jumbo v1, "action_param"

    const-string/jumbo v2, "show"

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->addParam(Ljava/lang/String;Ljava/lang/Object;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->commit()Lcom/vkontakte/android/data/Analytics$EventBuilder;

    .line 640
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->newPostsBtn:Landroid/view/View;

    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    .line 641
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->newPostsBtn:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getTranslationY()F

    move-result v0

    cmpl-float v0, v0, v3

    if-nez v0, :cond_2

    .line 642
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->newPostsBtn:Landroid/view/View;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/NewsFragment;->newPostsBtn:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getBottom()I

    move-result v1

    neg-int v1, v1

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationY(F)V

    .line 644
    :cond_2
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->newPostsBtn:Landroid/view/View;

    const-string/jumbo v1, "translationY"

    new-array v2, v5, [F

    aput v3, v2, v4

    invoke-static {v0, v1, v2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v0

    const-wide/16 v2, 0x190

    invoke-virtual {v0, v2, v3}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->currentButtonAnim:Landroid/animation/Animator;

    .line 645
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->currentButtonAnim:Landroid/animation/Animator;

    new-instance v1, Landroid/view/animation/OvershootInterpolator;

    invoke-direct {v1}, Landroid/view/animation/OvershootInterpolator;-><init>()V

    invoke-virtual {v0, v1}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 646
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->currentButtonAnim:Landroid/animation/Animator;

    new-instance v1, Lcom/vkontakte/android/fragments/NewsFragment$3;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/fragments/NewsFragment$3;-><init>(Lcom/vkontakte/android/fragments/NewsFragment;)V

    invoke-virtual {v0, v1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 652
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->currentButtonAnim:Landroid/animation/Animator;

    invoke-virtual {v0}, Landroid/animation/Animator;->start()V

    goto :goto_0

    .line 654
    :cond_3
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->newPostsBtn:Landroid/view/View;

    const-string/jumbo v1, "translationY"

    new-array v2, v5, [F

    iget-object v3, p0, Lcom/vkontakte/android/fragments/NewsFragment;->newPostsBtn:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getBottom()I

    move-result v3

    neg-int v3, v3

    int-to-float v3, v3

    aput v3, v2, v4

    invoke-static {v0, v1, v2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v0

    const-wide/16 v2, 0xc8

    invoke-virtual {v0, v2, v3}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->currentButtonAnim:Landroid/animation/Animator;

    .line 655
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->currentButtonAnim:Landroid/animation/Animator;

    new-instance v1, Landroid/view/animation/AccelerateInterpolator;

    invoke-direct {v1}, Landroid/view/animation/AccelerateInterpolator;-><init>()V

    invoke-virtual {v0, v1}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 656
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->currentButtonAnim:Landroid/animation/Animator;

    new-instance v1, Lcom/vkontakte/android/fragments/NewsFragment$4;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/fragments/NewsFragment$4;-><init>(Lcom/vkontakte/android/fragments/NewsFragment;)V

    invoke-virtual {v0, v1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 663
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->currentButtonAnim:Landroid/animation/Animator;

    invoke-virtual {v0}, Landroid/animation/Animator;->start()V

    goto/16 :goto_0
.end method

.method private setStoriesResponse(Lcom/vk/stories/model/GetStoriesResponse;)V
    .locals 2
    .param p1, "storiesResponse"    # Lcom/vk/stories/model/GetStoriesResponse;

    .prologue
    .line 1220
    if-nez p1, :cond_0

    .line 1221
    new-instance p1, Lcom/vk/stories/model/GetStoriesResponse;

    .end local p1    # "storiesResponse":Lcom/vk/stories/model/GetStoriesResponse;
    const/4 v1, 0x0

    invoke-direct {p1, v1}, Lcom/vk/stories/model/GetStoriesResponse;-><init>(Lorg/json/JSONObject;)V

    .line 1223
    .restart local p1    # "storiesResponse":Lcom/vk/stories/model/GetStoriesResponse;
    :cond_0
    iget-object v1, p1, Lcom/vk/stories/model/GetStoriesResponse;->storiesResponse:Ljava/util/ArrayList;

    if-eqz v1, :cond_1

    .line 1224
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 1225
    .local v0, "loadedStories":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/stories/model/StoriesContainer;>;"
    iget-object v1, p1, Lcom/vk/stories/model/GetStoriesResponse;->storiesResponse:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 1226
    invoke-static {v0}, Lcom/vk/stories/StoriesController;->postProcessDisplayStoryList(Ljava/util/ArrayList;)Ljava/util/ArrayList;

    move-result-object v0

    .line 1228
    iget-object v1, p1, Lcom/vk/stories/model/GetStoriesResponse;->storiesResponse:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    .line 1229
    iget-object v1, p1, Lcom/vk/stories/model/GetStoriesResponse;->storiesResponse:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 1231
    .end local v0    # "loadedStories":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/stories/model/StoriesContainer;>;"
    :cond_1
    iget-object v1, p0, Lcom/vkontakte/android/fragments/NewsFragment;->storiesHeaderAdapter:Lcom/vkontakte/android/fragments/NewsFragment$StoriesHeaderAdapter;

    invoke-virtual {v1, p1}, Lcom/vkontakte/android/fragments/NewsFragment$StoriesHeaderAdapter;->setGetStoriesResponse(Lcom/vk/stories/model/GetStoriesResponse;)V

    .line 1232
    return-void
.end method

.method private showNew(Z)V
    .locals 10
    .param p1, "fromButton"    # Z

    .prologue
    const/4 v9, 0x1

    const/4 v8, 0x0

    const/4 v7, -0x1

    const/16 v6, 0xa

    .line 668
    const-string/jumbo v1, "user_action"

    invoke-static {v1}, Lcom/vkontakte/android/data/Analytics;->track(Ljava/lang/String;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v1

    const-string/jumbo v2, "action_type"

    const-string/jumbo v3, "feed_load_new"

    invoke-virtual {v1, v2, v3}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->addParam(Ljava/lang/String;Ljava/lang/Object;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v1

    const-string/jumbo v2, "action_param"

    const-string/jumbo v3, "click"

    invoke-virtual {v1, v2, v3}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->addParam(Ljava/lang/String;Ljava/lang/Object;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->commit()Lcom/vkontakte/android/data/Analytics$EventBuilder;

    .line 669
    iget-boolean v1, p0, Lcom/vkontakte/android/fragments/NewsFragment;->clearForNew:Z

    if-eqz v1, :cond_0

    iget-wide v2, p0, Lcom/vkontakte/android/fragments/NewsFragment;->lastPreloadTime:J

    const-wide/16 v4, 0x0

    cmp-long v1, v2, v4

    if-lez v1, :cond_0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iget-wide v4, p0, Lcom/vkontakte/android/fragments/NewsFragment;->lastPreloadTime:J

    sub-long/2addr v2, v4

    const-wide/16 v4, 0x7530

    cmp-long v1, v2, v4

    if-lez v1, :cond_0

    .line 670
    invoke-static {}, Lcom/vkontakte/android/cache/NewsfeedCache;->isNewsfeedTop()Z

    move-result v1

    if-nez v1, :cond_0

    .line 671
    iget v1, p0, Lcom/vkontakte/android/fragments/NewsFragment;->listID:I

    invoke-virtual {p0, v1, v9}, Lcom/vkontakte/android/fragments/NewsFragment;->setList(IZ)Z

    .line 704
    :goto_0
    return-void

    .line 672
    :cond_0
    iget-boolean v1, p0, Lcom/vkontakte/android/fragments/NewsFragment;->clearForNew:Z

    if-eqz v1, :cond_3

    .line 673
    iget-object v1, p0, Lcom/vkontakte/android/fragments/NewsFragment;->newNews:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-nez v1, :cond_1

    .line 674
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/NewsFragment;->updateNewPostsBtn()V

    goto :goto_0

    .line 676
    :cond_1
    iget-object v1, p0, Lcom/vkontakte/android/fragments/NewsFragment;->data:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    .line 677
    iget-object v1, p0, Lcom/vkontakte/android/fragments/NewsFragment;->preloadedData:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    .line 678
    iget-object v1, p0, Lcom/vkontakte/android/fragments/NewsFragment;->items:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    .line 679
    iget-object v1, p0, Lcom/vkontakte/android/fragments/NewsFragment;->data:Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/NewsFragment;->newNews:Ljava/util/List;

    iget-object v3, p0, Lcom/vkontakte/android/fragments/NewsFragment;->newNews:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    invoke-static {v6, v3}, Ljava/lang/Math;->min(II)I

    move-result v3

    invoke-interface {v2, v8, v3}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 680
    iget-object v1, p0, Lcom/vkontakte/android/fragments/NewsFragment;->data:Ljava/util/ArrayList;

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/fragments/NewsFragment;->onAppendItems(Ljava/util/List;)V

    .line 681
    iget-object v1, p0, Lcom/vkontakte/android/fragments/NewsFragment;->newNews:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-le v1, v6, :cond_2

    .line 682
    iget-object v1, p0, Lcom/vkontakte/android/fragments/NewsFragment;->preloadedData:Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/NewsFragment;->newNews:Ljava/util/List;

    iget-object v3, p0, Lcom/vkontakte/android/fragments/NewsFragment;->newNews:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    invoke-interface {v2, v6, v3}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 684
    :cond_2
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/NewsFragment;->updateList()V

    .line 685
    iget-object v1, p0, Lcom/vkontakte/android/fragments/NewsFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-static {p0}, Lcom/vkontakte/android/fragments/NewsFragment$$Lambda$5;->lambdaFactory$(Lcom/vkontakte/android/fragments/NewsFragment;)Ljava/lang/Runnable;

    move-result-object v2

    const-wide/16 v4, 0xc8

    invoke-virtual {v1, v2, v4, v5}, Lme/grishka/appkit/views/UsableRecyclerView;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 688
    iget-object v1, p0, Lcom/vkontakte/android/fragments/NewsFragment;->newFrom:Ljava/lang/String;

    invoke-static {v1}, Lcom/vkontakte/android/cache/NewsfeedCache;->saveFrom(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/vkontakte/android/fragments/NewsFragment;->setFrom(Ljava/lang/String;)V

    .line 689
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 690
    .local v0, "forCache":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/NewsEntry;>;"
    iget-object v1, p0, Lcom/vkontakte/android/fragments/NewsFragment;->newNews:Ljava/util/List;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 691
    iget-object v1, p0, Lcom/vkontakte/android/fragments/NewsFragment;->newNews:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 692
    new-instance v1, Ljava/lang/Thread;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/NewsFragment$$Lambda$6;->lambdaFactory$(Ljava/util/ArrayList;)Ljava/lang/Runnable;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 693
    iput v7, p0, Lcom/vkontakte/android/fragments/NewsFragment;->newPostsHideBoundary:I

    .line 694
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/NewsFragment;->updateNewPostsBtn()V

    goto/16 :goto_0

    .line 697
    .end local v0    # "forCache":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/NewsEntry;>;"
    :cond_3
    iget-object v1, p0, Lcom/vkontakte/android/fragments/NewsFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v1, v8}, Lme/grishka/appkit/views/UsableRecyclerView;->scrollToPosition(I)V

    .line 698
    iput v7, p0, Lcom/vkontakte/android/fragments/NewsFragment;->newPostsHideBoundary:I

    .line 699
    if-eqz p1, :cond_4

    .line 700
    iput-boolean v9, p0, Lcom/vkontakte/android/fragments/NewsFragment;->newPostsButtonPendingVisibility:Z

    .line 702
    :cond_4
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/NewsFragment;->updateNewPostsBtn()V

    goto/16 :goto_0
.end method

.method private syncLoadingHeaderState()V
    .locals 6

    .prologue
    const/4 v2, 0x0

    .line 518
    iget-object v3, p0, Lcom/vkontakte/android/fragments/NewsFragment;->loadingHeaders:[Landroid/view/View;

    array-length v4, v3

    move v1, v2

    :goto_0
    if-ge v1, v4, :cond_1

    aget-object v0, v3, v1

    .line 519
    .local v0, "loadingHeader":Landroid/view/View;
    if-eqz v0, :cond_0

    .line 520
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v5

    sparse-switch v5, :sswitch_data_0

    .line 518
    :cond_0
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 523
    :sswitch_0
    iget v5, p0, Lcom/vkontakte/android/fragments/NewsFragment;->listID:I

    if-nez v5, :cond_0

    .line 524
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    goto :goto_1

    .line 528
    :sswitch_1
    iget v5, p0, Lcom/vkontakte/android/fragments/NewsFragment;->listID:I

    if-eqz v5, :cond_0

    .line 529
    const/16 v5, 0x8

    invoke-virtual {v0, v5}, Landroid/view/View;->setVisibility(I)V

    goto :goto_1

    .line 535
    .end local v0    # "loadingHeader":Landroid/view/View;
    :cond_1
    return-void

    .line 520
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_1
        0x4 -> :sswitch_0
        0x8 -> :sswitch_0
    .end sparse-switch
.end method

.method private updateEmptyLabel()V
    .locals 4

    .prologue
    const v3, 0x7f08021b

    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 203
    iget v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->listID:I

    packed-switch v0, :pswitch_data_0

    .line 224
    const v0, 0x7f08044c

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/NewsFragment;->setEmptyText(I)V

    .line 225
    invoke-virtual {p0, v2}, Lcom/vkontakte/android/fragments/NewsFragment;->setEmptyButtonVisible(Z)V

    .line 228
    :goto_0
    return-void

    .line 205
    :pswitch_0
    const v0, 0x7f080448

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/NewsFragment;->setEmptyText(I)V

    .line 206
    invoke-virtual {p0, v3}, Lcom/vkontakte/android/fragments/NewsFragment;->setEmptyButtonText(I)V

    .line 207
    invoke-virtual {p0, v1}, Lcom/vkontakte/android/fragments/NewsFragment;->setEmptyButtonVisible(Z)V

    goto :goto_0

    .line 210
    :pswitch_1
    const v0, 0x7f08044e

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/NewsFragment;->setEmptyText(I)V

    .line 211
    invoke-virtual {p0, v2}, Lcom/vkontakte/android/fragments/NewsFragment;->setEmptyButtonVisible(Z)V

    goto :goto_0

    .line 214
    :pswitch_2
    const v0, 0x7f08044a

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/NewsFragment;->setEmptyText(I)V

    .line 215
    invoke-virtual {p0, v3}, Lcom/vkontakte/android/fragments/NewsFragment;->setEmptyButtonText(I)V

    .line 216
    invoke-virtual {p0, v1}, Lcom/vkontakte/android/fragments/NewsFragment;->setEmptyButtonVisible(Z)V

    goto :goto_0

    .line 219
    :pswitch_3
    const v0, 0x7f08044b

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/NewsFragment;->setEmptyText(I)V

    .line 220
    const v0, 0x7f0801ed

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/NewsFragment;->setEmptyButtonText(I)V

    .line 221
    invoke-virtual {p0, v1}, Lcom/vkontakte/android/fragments/NewsFragment;->setEmptyButtonVisible(Z)V

    goto :goto_0

    .line 203
    :pswitch_data_0
    .packed-switch -0x3
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private updateNewPostsBtn()V
    .locals 6

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 616
    iget-object v4, p0, Lcom/vkontakte/android/fragments/NewsFragment;->newPostsBtn:Landroid/view/View;

    if-nez v4, :cond_1

    .line 626
    :cond_0
    :goto_0
    return-void

    .line 619
    :cond_1
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->newPostsButtonPendingVisibility:Z

    .line 620
    .local v0, "curState":Z
    iget-object v4, p0, Lcom/vkontakte/android/fragments/NewsFragment;->newNews:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    if-gtz v4, :cond_2

    iget v4, p0, Lcom/vkontakte/android/fragments/NewsFragment;->newPostsHideBoundary:I

    const/4 v5, -0x1

    if-eq v4, v5, :cond_3

    :cond_2
    move v1, v3

    .line 621
    .local v1, "newState":Z
    :goto_1
    if-eq v0, v1, :cond_0

    .line 624
    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    aput-object v4, v3, v2

    invoke-static {v3}, Lcom/vkontakte/android/utils/L;->e([Ljava/lang/Object;)V

    .line 625
    invoke-direct {p0, v1}, Lcom/vkontakte/android/fragments/NewsFragment;->setNewPostsBtnVisible(Z)V

    goto :goto_0

    .end local v1    # "newState":Z
    :cond_3
    move v1, v2

    .line 620
    goto :goto_1
.end method


# virtual methods
.method protected canAddPost(Lcom/vkontakte/android/NewsEntry;)Z
    .locals 4
    .param p1, "post"    # Lcom/vkontakte/android/NewsEntry;

    .prologue
    const/4 v0, 0x0

    .line 272
    invoke-static {}, Lcom/vkontakte/android/cache/NewsfeedCache;->isNewsfeedTop()Z

    move-result v1

    if-eqz v1, :cond_1

    iget v1, p0, Lcom/vkontakte/android/fragments/NewsFragment;->listID:I

    if-nez v1, :cond_1

    .line 273
    const-wide/16 v2, 0x0

    iput-wide v2, p0, Lcom/vkontakte/android/fragments/NewsFragment;->lastPreloadTime:J

    .line 276
    :cond_0
    :goto_0
    return v0

    :cond_1
    iget v1, p1, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    iget v2, p1, Lcom/vkontakte/android/NewsEntry;->userID:I

    if-ne v1, v2, :cond_0

    iget v1, p0, Lcom/vkontakte/android/fragments/NewsFragment;->listID:I

    if-nez v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0
.end method

.method protected canHideFromFeed()Z
    .locals 2

    .prologue
    .line 566
    iget v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->listID:I

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->listID:I

    const/4 v1, -0x2

    if-eq v0, v1, :cond_0

    iget v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->listID:I

    const/4 v1, -0x3

    if-eq v0, v1, :cond_0

    iget v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->listID:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected canHideNotInterestingFromFeed(Lcom/vkontakte/android/NewsEntry;)Z
    .locals 1
    .param p1, "entry"    # Lcom/vkontakte/android/NewsEntry;

    .prologue
    .line 574
    invoke-static {p1}, Lcom/vkontakte/android/api/newsfeed/NewsfeedIgnoreItem;->canIgnore(Lcom/vkontakte/android/NewsEntry;)Z

    move-result v0

    return v0
.end method

.method protected cancelLoading()V
    .locals 1

    .prologue
    .line 1115
    invoke-super {p0}, Lcom/vkontakte/android/fragments/PostListFragment;->cancelLoading()V

    .line 1116
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->newNewsReq:Lcom/vkontakte/android/api/VKAPIRequest;

    if-eqz v0, :cond_0

    .line 1117
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->newNewsReq:Lcom/vkontakte/android/api/VKAPIRequest;

    invoke-virtual {v0}, Lcom/vkontakte/android/api/VKAPIRequest;->cancel()V

    .line 1118
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->newNewsReq:Lcom/vkontakte/android/api/VKAPIRequest;

    .line 1120
    :cond_0
    return-void
.end method

.method protected convertItemsIndexToReal(I)I
    .locals 4
    .param p1, "index"    # I

    .prologue
    const/4 v1, 0x0

    .line 1660
    iget-object v2, p0, Lcom/vkontakte/android/fragments/NewsFragment;->storiesHeaderAdapter:Lcom/vkontakte/android/fragments/NewsFragment$StoriesHeaderAdapter;

    if-nez v2, :cond_1

    move v0, v1

    .line 1661
    .local v0, "storiesCount":I
    :goto_0
    add-int v2, p1, v0

    iget v3, p0, Lcom/vkontakte/android/fragments/NewsFragment;->listID:I

    if-nez v3, :cond_0

    const/4 v1, 0x1

    :cond_0
    add-int/2addr v1, v2

    return v1

    .line 1660
    .end local v0    # "storiesCount":I
    :cond_1
    iget-object v2, p0, Lcom/vkontakte/android/fragments/NewsFragment;->storiesHeaderAdapter:Lcom/vkontakte/android/fragments/NewsFragment$StoriesHeaderAdapter;

    invoke-virtual {v2}, Lcom/vkontakte/android/fragments/NewsFragment$StoriesHeaderAdapter;->getItemCount()I

    move-result v0

    goto :goto_0
.end method

.method protected doLoadData(II)V
    .locals 14
    .param p1, "offset"    # I
    .param p2, "count"    # I

    .prologue
    .line 1021
    if-nez p1, :cond_2

    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->refreshing:Z

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->data:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-nez v0, :cond_2

    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->forceNewData:Z

    if-nez v0, :cond_2

    .line 1022
    sget-object v0, Lcom/vkontakte/android/data/Posts;->feed:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_1

    .line 1023
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->data:Ljava/util/ArrayList;

    sget-object v1, Lcom/vkontakte/android/data/Posts;->feed:Ljava/util/List;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 1024
    sget-object v0, Lcom/vkontakte/android/data/Posts;->feed:Ljava/util/List;

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/NewsFragment;->onAppendItems(Ljava/util/List;)V

    .line 1025
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->preloadedData:Ljava/util/ArrayList;

    sget-object v1, Lcom/vkontakte/android/data/Posts;->preloadedFeed:Ljava/util/List;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 1026
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/NewsFragment;->updateList()V

    .line 1027
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->loaded:Z

    .line 1028
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->preloader:Lme/grishka/appkit/utils/Preloader;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lme/grishka/appkit/utils/Preloader;->setMoreAvailable(Z)V

    .line 1029
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->dataLoading:Z

    .line 1030
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/NewsFragment;->showContent()V

    .line 1031
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    if-eqz v0, :cond_0

    .line 1032
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v0}, Lme/grishka/appkit/views/UsableRecyclerView;->getLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/LinearLayoutManager;

    sget v1, Lcom/vkontakte/android/data/Posts;->feedItem:I

    sget v2, Lcom/vkontakte/android/data/Posts;->feedItemOffset:I

    invoke-virtual {v0, v1, v2}, Landroid/support/v7/widget/LinearLayoutManager;->scrollToPositionWithOffset(II)V

    .line 1036
    :goto_0
    sget-object v0, Lcom/vkontakte/android/data/Posts;->feedFrom:Ljava/lang/String;

    invoke-static {v0}, Lcom/vkontakte/android/cache/NewsfeedCache;->saveFrom(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/vkontakte/android/fragments/NewsFragment;->setFrom(Ljava/lang/String;)V

    .line 1037
    sget-object v0, Lcom/vkontakte/android/data/Posts;->newNews:Ljava/util/List;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->newNews:Ljava/util/List;

    .line 1038
    sget-object v0, Lcom/vkontakte/android/data/Posts;->newNewsFrom:Ljava/lang/String;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->newFrom:Ljava/lang/String;

    .line 1039
    sget-boolean v0, Lcom/vkontakte/android/data/Posts;->feedClearForNew:Z

    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->clearForNew:Z

    .line 1040
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/NewsFragment;->preloadIfNeed()V

    .line 1111
    :goto_1
    return-void

    .line 1034
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->needSetSelection:Z

    goto :goto_0

    .line 1042
    :cond_1
    invoke-static {}, Lcom/vkontakte/android/cache/NewsfeedCache;->hasEntries()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1044
    new-instance v0, Ljava/lang/Thread;

    invoke-static {p0}, Lcom/vkontakte/android/fragments/NewsFragment$$Lambda$8;->lambdaFactory$(Lcom/vkontakte/android/fragments/NewsFragment;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 1066
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    goto :goto_1

    .line 1070
    :cond_2
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->forceNewData:Z

    .line 1071
    iget v12, p0, Lcom/vkontakte/android/fragments/NewsFragment;->listID:I

    .line 1072
    .local v12, "listId":I
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/NewsFragment;->getPromoIdByRedirect()Ljava/lang/String;

    move-result-object v13

    .line 1073
    .local v13, "promoId":Ljava/lang/String;
    new-instance v0, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet;

    if-nez p1, :cond_3

    const-string/jumbo v1, "0"

    :goto_2
    iget v3, p0, Lcom/vkontakte/android/fragments/NewsFragment;->listID:I

    if-nez v13, :cond_4

    iget-object v2, p0, Lcom/vkontakte/android/fragments/NewsFragment;->navAdapter:Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter;

    .line 1074
    invoke-virtual {v2, v12}, Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter;->getPromoId(I)Ljava/lang/String;

    move-result-object v4

    .line 1075
    :goto_3
    invoke-static {}, Lcom/vkontakte/android/cache/NewsfeedCache;->isNewsfeedTop()Z

    move-result v2

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    iget v6, p0, Lcom/vkontakte/android/fragments/NewsFragment;->lastPosition:I

    iget v7, p0, Lcom/vkontakte/android/fragments/NewsFragment;->lastOwnerId:I

    iget v8, p0, Lcom/vkontakte/android/fragments/NewsFragment;->lastPostId:I

    invoke-static {}, Lcom/vkontakte/android/fragments/NewsFragment;->getNewsfeedAwayTime()I

    move-result v9

    if-nez p1, :cond_5

    const/4 v10, 0x1

    .line 1076
    :goto_4
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/NewsFragment;->getListReferrer()Ljava/lang/String;

    move-result-object v11

    move/from16 v2, p2

    invoke-direct/range {v0 .. v11}, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet;-><init>(Ljava/lang/String;IILjava/lang/String;Ljava/lang/Boolean;IIIIZLjava/lang/String;)V

    new-instance v1, Lcom/vkontakte/android/fragments/NewsFragment$6;

    invoke-direct {v1, p0, p0, p1, v12}, Lcom/vkontakte/android/fragments/NewsFragment$6;-><init>(Lcom/vkontakte/android/fragments/NewsFragment;Landroid/app/Fragment;II)V

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 1110
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/NewsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->currentRequest:Lme/grishka/appkit/api/APIRequest;

    goto :goto_1

    .line 1073
    :cond_3
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/NewsFragment;->getFrom()Ljava/lang/String;

    move-result-object v1

    goto :goto_2

    :cond_4
    move-object v4, v13

    .line 1074
    goto :goto_3

    .line 1075
    :cond_5
    const/4 v10, 0x0

    goto :goto_4
.end method

.method protected bridge synthetic getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;
    .locals 1

    .prologue
    .line 89
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/NewsFragment;->getAdapter()Lme/grishka/appkit/views/UsableRecyclerView$Adapter;

    move-result-object v0

    return-object v0
.end method

.method protected getAdapter()Lme/grishka/appkit/views/UsableRecyclerView$Adapter;
    .locals 4

    .prologue
    .line 1180
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->storiesHeaderAdapter:Lcom/vkontakte/android/fragments/NewsFragment$StoriesHeaderAdapter;

    if-nez v0, :cond_0

    .line 1181
    new-instance v0, Lcom/vkontakte/android/fragments/NewsFragment$StoriesHeaderAdapter;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/NewsFragment$StoriesHeaderAdapter;-><init>(Lcom/vkontakte/android/fragments/NewsFragment;)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->storiesHeaderAdapter:Lcom/vkontakte/android/fragments/NewsFragment$StoriesHeaderAdapter;

    .line 1182
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/NewsFragment;->loadStoriesSync()V

    .line 1184
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->headerAdapter:Lcom/vkontakte/android/fragments/NewsFragment$HeaderAdapter;

    if-nez v0, :cond_1

    .line 1185
    new-instance v0, Lcom/vkontakte/android/fragments/NewsFragment$HeaderAdapter;

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vkontakte/android/auth/VKAccount;->getPhoto()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/vkontakte/android/fragments/NewsFragment$HeaderAdapter;-><init>(Lcom/vkontakte/android/fragments/NewsFragment;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->headerAdapter:Lcom/vkontakte/android/fragments/NewsFragment$HeaderAdapter;

    .line 1187
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->adapter:Lme/grishka/appkit/views/UsableRecyclerView$Adapter;

    if-nez v0, :cond_2

    new-instance v0, Lcom/vkontakte/android/ui/adapters/CardMergeAdapter;

    const/4 v1, 0x3

    new-array v1, v1, [Lme/grishka/appkit/views/UsableRecyclerView$Adapter;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/vkontakte/android/fragments/NewsFragment;->headerAdapter:Lcom/vkontakte/android/fragments/NewsFragment$HeaderAdapter;

    aput-object v3, v1, v2

    const/4 v2, 0x1

    iget-object v3, p0, Lcom/vkontakte/android/fragments/NewsFragment;->storiesHeaderAdapter:Lcom/vkontakte/android/fragments/NewsFragment$StoriesHeaderAdapter;

    aput-object v3, v1, v2

    const/4 v2, 0x2

    new-instance v3, Lcom/vkontakte/android/fragments/PostListFragment$NewsAdapter;

    invoke-direct {v3, p0}, Lcom/vkontakte/android/fragments/PostListFragment$NewsAdapter;-><init>(Lcom/vkontakte/android/fragments/PostListFragment;)V

    aput-object v3, v1, v2

    invoke-direct {v0, v1}, Lcom/vkontakte/android/ui/adapters/CardMergeAdapter;-><init>([Lme/grishka/appkit/views/UsableRecyclerView$Adapter;)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->adapter:Lme/grishka/appkit/views/UsableRecyclerView$Adapter;

    :goto_0
    return-object v0

    :cond_2
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->adapter:Lme/grishka/appkit/views/UsableRecyclerView$Adapter;

    goto :goto_0
.end method

.method public getDropDownWidth(Lme/grishka/appkit/views/NavigationSpinner;III)I
    .locals 2
    .param p1, "spinner"    # Lme/grishka/appkit/views/NavigationSpinner;
    .param p2, "defaultWidth"    # I
    .param p3, "screenWidth"    # I
    .param p4, "left"    # I

    .prologue
    .line 153
    invoke-virtual {p1}, Lme/grishka/appkit/views/NavigationSpinner;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    instance-of v0, v0, Landroid/view/View;

    if-eqz v0, :cond_0

    .line 154
    const/high16 v0, 0x43a00000    # 320.0f

    invoke-static {v0}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v0

    if-lt p3, v0, :cond_0

    .line 155
    const/high16 v0, 0x43f00000    # 480.0f

    invoke-static {v0}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v0

    invoke-static {p3, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    invoke-static {p4}, Ljava/lang/Math;->abs(I)I

    move-result v1

    sub-int/2addr v0, v1

    const/high16 v1, 0x41800000    # 16.0f

    invoke-static {v1}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v1

    sub-int p2, v0, v1

    .line 158
    .end local p2    # "defaultWidth":I
    :cond_0
    return p2
.end method

.method public getList()I
    .locals 1

    .prologue
    .line 244
    iget v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->listID:I

    return v0
.end method

.method protected getListReferrer()Ljava/lang/String;
    .locals 2

    .prologue
    .line 254
    iget v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->listID:I

    packed-switch v0, :pswitch_data_0

    .line 266
    :pswitch_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "feed_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/vkontakte/android/fragments/NewsFragment;->listID:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    .line 256
    :pswitch_1
    invoke-static {}, Lcom/vkontakte/android/cache/NewsfeedCache;->isNewsfeedTop()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string/jumbo v0, "feed_top"

    goto :goto_0

    :cond_0
    const-string/jumbo v0, "feed_recent"

    goto :goto_0

    .line 258
    :pswitch_2
    const-string/jumbo v0, "feed_recommendations"

    goto :goto_0

    .line 260
    :pswitch_3
    const-string/jumbo v0, "feed_friends"

    goto :goto_0

    .line 262
    :pswitch_4
    const-string/jumbo v0, "feed_groups"

    goto :goto_0

    .line 264
    :pswitch_5
    const-string/jumbo v0, "feed_videos"

    goto :goto_0

    .line 254
    :pswitch_data_0
    .packed-switch -0x5
        :pswitch_5
        :pswitch_0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method protected getPostsOffset()I
    .locals 2

    .prologue
    .line 1192
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->headerAdapter:Lcom/vkontakte/android/fragments/NewsFragment$HeaderAdapter;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/NewsFragment$HeaderAdapter;->getItemCount()I

    move-result v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/NewsFragment;->storiesHeaderAdapter:Lcom/vkontakte/android/fragments/NewsFragment$StoriesHeaderAdapter;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/NewsFragment$StoriesHeaderAdapter;->getItemCount()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method protected getReferer()Ljava/lang/String;
    .locals 1

    .prologue
    .line 249
    const-string/jumbo v0, "news"

    return-object v0
.end method

.method synthetic lambda$doLoadData$8()V
    .locals 5

    .prologue
    .line 1045
    invoke-static {}, Lcom/vkontakte/android/cache/NewsfeedCache;->get()Ljava/util/ArrayList;

    move-result-object v1

    .line 1046
    .local v1, "e":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/NewsEntry;>;"
    invoke-static {}, Lcom/vkontakte/android/cache/NewsfeedCache;->getLists()Ljava/util/ArrayList;

    move-result-object v3

    .line 1047
    .local v3, "newsfeedLists":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/NewsfeedList;>;"
    invoke-static {}, Lcom/vkontakte/android/cache/NewsfeedCache;->isNewsfeedTop()Z

    move-result v2

    .line 1048
    .local v2, "isStartFromInteresting":Z
    invoke-static {}, Lcom/vkontakte/android/cache/NewsfeedCache;->getFrom()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Lcom/vkontakte/android/fragments/NewsFragment;->setFrom(Ljava/lang/String;)V

    .line 1049
    invoke-static {}, Lcom/vkontakte/android/cache/NewsfeedCache;->getFirstShowedIndex()I

    move-result v4

    sput v4, Lcom/vkontakte/android/data/Posts;->feedItem:I

    .line 1050
    invoke-static {}, Lcom/vkontakte/android/cache/NewsfeedCache;->getFirstShowedOffset()I

    move-result v4

    sput v4, Lcom/vkontakte/android/data/Posts;->feedItemOffset:I

    .line 1051
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/NewsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 1052
    .local v0, "activity":Landroid/app/Activity;
    if-nez v0, :cond_0

    .line 1066
    :goto_0
    return-void

    .line 1055
    :cond_0
    invoke-static {p0, v3, v2, v1}, Lcom/vkontakte/android/fragments/NewsFragment$$Lambda$9;->lambdaFactory$(Lcom/vkontakte/android/fragments/NewsFragment;Ljava/util/ArrayList;ZLjava/util/ArrayList;)Ljava/lang/Runnable;

    move-result-object v4

    invoke-virtual {v0, v4}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method synthetic lambda$null$2(Ljava/util/ArrayList;Z)V
    .locals 0
    .param p1, "newsfeedLists"    # Ljava/util/ArrayList;
    .param p2, "isStartFromInteresting"    # Z

    .prologue
    .line 463
    invoke-direct {p0, p1, p2}, Lcom/vkontakte/android/fragments/NewsFragment;->fillSpinnerAdapter(Ljava/util/List;Z)V

    return-void
.end method

.method synthetic lambda$null$7(Ljava/util/ArrayList;ZLjava/util/ArrayList;)V
    .locals 3
    .param p1, "newsfeedLists"    # Ljava/util/ArrayList;
    .param p2, "isStartFromInteresting"    # Z
    .param p3, "e"    # Ljava/util/ArrayList;

    .prologue
    const/4 v1, 0x1

    .line 1056
    invoke-direct {p0, p1, p2}, Lcom/vkontakte/android/fragments/NewsFragment;->fillSpinnerAdapter(Ljava/util/List;Z)V

    .line 1057
    invoke-virtual {p0, p3, v1}, Lcom/vkontakte/android/fragments/NewsFragment;->onDataLoaded(Ljava/util/List;Z)V

    .line 1059
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    if-eqz v0, :cond_0

    .line 1060
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v0}, Lme/grishka/appkit/views/UsableRecyclerView;->getLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/LinearLayoutManager;

    sget v1, Lcom/vkontakte/android/data/Posts;->feedItem:I

    sget v2, Lcom/vkontakte/android/data/Posts;->feedItemOffset:I

    invoke-virtual {v0, v1, v2}, Landroid/support/v7/widget/LinearLayoutManager;->scrollToPositionWithOffset(II)V

    .line 1064
    :goto_0
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/NewsFragment;->preloadIfNeed()V

    .line 1065
    return-void

    .line 1062
    :cond_0
    iput-boolean v1, p0, Lcom/vkontakte/android/fragments/NewsFragment;->needSetSelection:Z

    goto :goto_0
.end method

.method synthetic lambda$onCreateView$4(Landroid/view/View;)V
    .locals 3
    .param p1, "v1"    # Landroid/view/View;

    .prologue
    .line 556
    const-string/jumbo v0, "user_action"

    invoke-static {v0}, Lcom/vkontakte/android/data/Analytics;->track(Ljava/lang/String;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v0

    const-string/jumbo v1, "action_type"

    const-string/jumbo v2, "fresh_news"

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->addParam(Ljava/lang/String;Ljava/lang/Object;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v0

    const-string/jumbo v1, "action_param"

    const-string/jumbo v2, "click"

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->addParam(Ljava/lang/String;Ljava/lang/Object;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->commit()Lcom/vkontakte/android/data/Analytics$EventBuilder;

    .line 557
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/vkontakte/android/fragments/NewsFragment;->showNew(Z)V

    .line 558
    return-void
.end method

.method synthetic lambda$onViewCreated$1(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 444
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    if-eqz v0, :cond_0

    .line 445
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lme/grishka/appkit/views/UsableRecyclerView;->scrollToPosition(I)V

    .line 447
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->storiesHeaderAdapter:Lcom/vkontakte/android/fragments/NewsFragment$StoriesHeaderAdapter;

    if-eqz v0, :cond_1

    .line 448
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->storiesHeaderAdapter:Lcom/vkontakte/android/fragments/NewsFragment$StoriesHeaderAdapter;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/NewsFragment$StoriesHeaderAdapter;->scrollToBegin()V

    .line 450
    :cond_1
    return-void
.end method

.method synthetic lambda$onViewCreated$3()V
    .locals 4

    .prologue
    .line 459
    invoke-static {}, Lcom/vkontakte/android/cache/NewsfeedCache;->getLists()Ljava/util/ArrayList;

    move-result-object v2

    .line 460
    .local v2, "newsfeedLists":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/NewsfeedList;>;"
    invoke-static {}, Lcom/vkontakte/android/cache/NewsfeedCache;->isNewsfeedTop()Z

    move-result v1

    .line 461
    .local v1, "isStartFromInteresting":Z
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/NewsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 462
    .local v0, "activity":Landroid/app/Activity;
    if-eqz v0, :cond_0

    .line 463
    invoke-static {p0, v2, v1}, Lcom/vkontakte/android/fragments/NewsFragment$$Lambda$10;->lambdaFactory$(Lcom/vkontakte/android/fragments/NewsFragment;Ljava/util/ArrayList;Z)Ljava/lang/Runnable;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 465
    :cond_0
    return-void
.end method

.method synthetic lambda$preloadIfNeed$0()V
    .locals 2

    .prologue
    .line 358
    invoke-static {}, Lcom/vkontakte/android/cache/NewsfeedCache;->hasEntries()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 361
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/NewsFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/NewsFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "owner_id"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 362
    :cond_0
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/vkontakte/android/fragments/NewsFragment;->initLastValuesIfNeed(Ljava/util/ArrayList;)V

    .line 363
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/NewsFragment;->preloadNew()V

    .line 365
    :cond_1
    return-void
.end method

.method synthetic lambda$showNew$5()V
    .locals 2

    .prologue
    .line 686
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lme/grishka/appkit/views/UsableRecyclerView;->scrollToPosition(I)V

    .line 687
    :cond_0
    return-void
.end method

.method public onAttach(Landroid/app/Activity;)V
    .locals 13
    .param p1, "act"    # Landroid/app/Activity;

    .prologue
    .line 284
    sget-object v8, Lcom/vkontakte/android/fragments/market/GoodFragment$Builder$Source;->feed:Lcom/vkontakte/android/fragments/market/GoodFragment$Builder$Source;

    invoke-static {v8}, Lcom/vkontakte/android/attachments/MarketAttachment;->setLastSource(Lcom/vkontakte/android/fragments/market/GoodFragment$Builder$Source;)V

    .line 285
    const/4 v8, 0x1

    iput-boolean v8, p0, Lcom/vkontakte/android/fragments/NewsFragment;->firstNav:Z

    .line 287
    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-virtual {p1, v8, v9}, Landroid/app/Activity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v6

    .line 289
    .local v6, "sharedPreferences":Landroid/content/SharedPreferences;
    const-string/jumbo v8, "temp_redirect_state"

    const/4 v9, 0x0

    invoke-interface {v6, v8, v9}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v5

    .line 290
    .local v5, "reloadByTempRedirect":Z
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/NewsFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v8

    if-eqz v8, :cond_6

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/NewsFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v8

    const-string/jumbo v9, "list_id"

    invoke-virtual {v8, v9}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_6

    const/4 v4, 0x1

    .line 291
    .local v4, "redirectNav":Z
    :goto_0
    if-eqz v4, :cond_7

    .line 292
    sget v8, Lcom/vkontakte/android/fragments/NewsFragment;->listIDStatic:I

    iput v8, p0, Lcom/vkontakte/android/fragments/NewsFragment;->previousListIDStatic:I

    .line 293
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/NewsFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v8

    const-string/jumbo v9, "list_id"

    invoke-virtual {v8, v9}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v8

    sput v8, Lcom/vkontakte/android/fragments/NewsFragment;->listIDStatic:I

    .line 297
    :goto_1
    invoke-interface {v6}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v8

    const-string/jumbo v9, "temp_redirect_state"

    invoke-interface {v8, v9, v4}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v8

    invoke-interface {v8}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 299
    if-nez v5, :cond_0

    invoke-static {}, Lcom/vkontakte/android/NetworkStateReceiver;->isConnected()Z

    move-result v8

    if-eqz v8, :cond_8

    sget v8, Lcom/vkontakte/android/fragments/NewsFragment;->listIDStatic:I

    iget v9, p0, Lcom/vkontakte/android/fragments/NewsFragment;->listID:I

    if-eq v8, v9, :cond_8

    :cond_0
    const/4 v1, 0x1

    .line 300
    .local v1, "needReloadList":Z
    :goto_2
    if-eqz v1, :cond_1

    .line 301
    sget v8, Lcom/vkontakte/android/fragments/NewsFragment;->listIDStatic:I

    iput v8, p0, Lcom/vkontakte/android/fragments/NewsFragment;->listID:I

    .line 302
    invoke-static {}, Lcom/vkontakte/android/cache/NewsfeedCache;->clear()V

    .line 303
    invoke-static {}, Lcom/vkontakte/android/data/Posts;->clear()V

    .line 304
    if-nez v4, :cond_1

    .line 305
    invoke-interface {v6}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v8

    const-string/jumbo v9, "feed_list"

    iget v10, p0, Lcom/vkontakte/android/fragments/NewsFragment;->listID:I

    invoke-interface {v8, v9, v10}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v8

    invoke-interface {v8}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 308
    :cond_1
    iget-object v8, p0, Lcom/vkontakte/android/fragments/NewsFragment;->emptyView:Landroid/view/View;

    if-eqz v8, :cond_2

    .line 309
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/NewsFragment;->updateEmptyLabel()V

    .line 311
    :cond_2
    const/4 v8, 0x1

    invoke-virtual {p0, v8}, Lcom/vkontakte/android/fragments/NewsFragment;->setHasOptionsMenu(Z)V

    .line 313
    invoke-static {}, Lcom/vkontakte/android/cache/NewsfeedCache;->isNewsfeedTop()Z

    move-result v0

    .line 314
    .local v0, "isTop":Z
    const-string/jumbo v8, "feed_last_unload"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v10

    invoke-interface {v6, v8, v10, v11}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v2

    .line 315
    .local v2, "lastUnload":J
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    sub-long/2addr v8, v2

    iget v10, p0, Lcom/vkontakte/android/fragments/NewsFragment;->listID:I

    invoke-static {v0, v10}, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet;->getRefreshTimeout(ZI)J

    move-result-wide v10

    cmp-long v8, v8, v10

    if-lez v8, :cond_9

    .line 316
    invoke-static {}, Lcom/vkontakte/android/NetworkStateReceiver;->isConnected()Z

    move-result v8

    if-eqz v8, :cond_9

    const/4 v7, 0x1

    .line 318
    .local v7, "updateByTime":Z
    :goto_3
    if-nez v1, :cond_3

    if-eqz v7, :cond_4

    .line 319
    :cond_3
    const/4 v8, 0x1

    iput-boolean v8, p0, Lcom/vkontakte/android/fragments/NewsFragment;->forceNewData:Z

    .line 320
    const/4 v8, 0x1

    iput-boolean v8, p0, Lcom/vkontakte/android/fragments/NewsFragment;->needSetSelection:Z

    .line 321
    const/4 v8, 0x1

    iput-boolean v8, p0, Lcom/vkontakte/android/fragments/NewsFragment;->reloadByTime:Z

    .line 322
    const/4 v8, 0x0

    invoke-static {v8}, Lcom/vkontakte/android/cache/NewsfeedCache;->saveFirstShowedIndex(I)I

    move-result v8

    sput v8, Lcom/vkontakte/android/data/Posts;->feedItem:I

    .line 323
    const/4 v8, 0x0

    invoke-static {v8}, Lcom/vkontakte/android/cache/NewsfeedCache;->saveFirstShowedOffset(I)I

    move-result v8

    sput v8, Lcom/vkontakte/android/data/Posts;->feedItemOffset:I

    .line 326
    :cond_4
    iget-object v8, p0, Lcom/vkontakte/android/fragments/NewsFragment;->navAdapter:Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter;

    if-nez v8, :cond_5

    .line 327
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/NewsFragment;->onCreateNavigationSpinnerAdapter()Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter;

    move-result-object v8

    iput-object v8, p0, Lcom/vkontakte/android/fragments/NewsFragment;->navAdapter:Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter;

    .line 330
    :cond_5
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/PostListFragment;->onAttach(Landroid/app/Activity;)V

    .line 332
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/NewsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v8

    iget-object v9, p0, Lcom/vkontakte/android/fragments/NewsFragment;->receiver:Landroid/content/BroadcastReceiver;

    new-instance v10, Landroid/content/IntentFilter;

    const-string/jumbo v11, "com.vkontakte.android.USER_NOTIFICATIONS_ENABLE_TOP_NEWSFEED"

    invoke-direct {v10, v11}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    const-string/jumbo v11, "com.vkontakte.android.permission.ACCESS_DATA"

    const/4 v12, 0x0

    invoke-virtual {v8, v9, v10, v11, v12}, Landroid/app/Activity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;)Landroid/content/Intent;

    .line 334
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/NewsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v8

    iget-object v9, p0, Lcom/vkontakte/android/fragments/NewsFragment;->receiver:Landroid/content/BroadcastReceiver;

    new-instance v10, Landroid/content/IntentFilter;

    const-string/jumbo v11, "com.vkontakte.android.USER_NOTIFICATIONS_HIDE_USER_NOTIFICATION"

    invoke-direct {v10, v11}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    const-string/jumbo v11, "com.vkontakte.android.permission.ACCESS_DATA"

    const/4 v12, 0x0

    invoke-virtual {v8, v9, v10, v11, v12}, Landroid/app/Activity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;)Landroid/content/Intent;

    .line 336
    return-void

    .line 290
    .end local v0    # "isTop":Z
    .end local v1    # "needReloadList":Z
    .end local v2    # "lastUnload":J
    .end local v4    # "redirectNav":Z
    .end local v7    # "updateByTime":Z
    :cond_6
    const/4 v4, 0x0

    goto/16 :goto_0

    .line 295
    .restart local v4    # "redirectNav":Z
    :cond_7
    const-string/jumbo v8, "feed_list"

    const/4 v9, 0x0

    invoke-interface {v6, v8, v9}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v8

    iput v8, p0, Lcom/vkontakte/android/fragments/NewsFragment;->listID:I

    goto/16 :goto_1

    .line 299
    :cond_8
    const/4 v1, 0x0

    goto/16 :goto_2

    .line 316
    .restart local v0    # "isTop":Z
    .restart local v1    # "needReloadList":Z
    .restart local v2    # "lastUnload":J
    :cond_9
    const/4 v7, 0x0

    goto :goto_3
.end method

.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 2
    .param p1, "buttonView"    # Landroid/widget/CompoundButton;
    .param p2, "isChecked"    # Z

    .prologue
    const/4 v1, 0x1

    .line 394
    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-static {v0}, Lcom/vkontakte/android/cache/NewsfeedCache;->setNewsfeedTop(Ljava/lang/Boolean;)V

    .line 395
    invoke-static {v1}, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet;->setStartFromInterestingPending(Z)V

    .line 396
    const/4 v0, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/fragments/NewsFragment;->setList(IZ)Z

    .line 397
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 3
    .param p1, "state"    # Landroid/os/Bundle;

    .prologue
    const/4 v1, 0x0

    .line 708
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/PostListFragment;->onCreate(Landroid/os/Bundle;)V

    .line 709
    if-nez p1, :cond_1

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/NewsFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/NewsFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v2, "_from_left_menu"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    const/4 v0, 0x1

    :goto_0
    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->isFirstNav:Z

    .line 710
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->isFirstNav:Z

    if-eqz v0, :cond_0

    .line 711
    sput v1, Lcom/vkontakte/android/data/Posts;->feedItemOffset:I

    sput v1, Lcom/vkontakte/android/data/Posts;->feedItem:I

    .line 712
    invoke-static {v1}, Lcom/vkontakte/android/cache/NewsfeedCache;->saveFirstShowedIndex(I)I

    .line 713
    invoke-static {v1}, Lcom/vkontakte/android/cache/NewsfeedCache;->saveFirstShowedOffset(I)I

    .line 716
    :cond_0
    invoke-static {}, Lcom/vk/stories/StoriesController;->notificationCenter()Lcom/vk/attachpicker/events/NotificationCenter;

    move-result-object v0

    const/16 v1, 0x64

    iget-object v2, p0, Lcom/vkontakte/android/fragments/NewsFragment;->storyUpdateListener:Lcom/vkontakte/android/fragments/NewsFragment$StoryMarkAsSeenListener;

    invoke-virtual {v0, v1, v2}, Lcom/vk/attachpicker/events/NotificationCenter;->addListener(ILcom/vk/attachpicker/events/NotificationListener;)V

    .line 717
    invoke-static {}, Lcom/vk/stories/StoriesController;->notificationCenter()Lcom/vk/attachpicker/events/NotificationCenter;

    move-result-object v0

    const/16 v1, 0x65

    iget-object v2, p0, Lcom/vkontakte/android/fragments/NewsFragment;->storiesListInvalidateListener:Lcom/vkontakte/android/fragments/NewsFragment$StoriesListInvalidateListener;

    invoke-virtual {v0, v1, v2}, Lcom/vk/attachpicker/events/NotificationCenter;->addListener(ILcom/vk/attachpicker/events/NotificationListener;)V

    .line 718
    return-void

    :cond_1
    move v0, v1

    .line 709
    goto :goto_0
.end method

.method protected onCreateNavigationSpinner(Landroid/view/LayoutInflater;)Landroid/widget/Spinner;
    .locals 4
    .param p1, "inflater"    # Landroid/view/LayoutInflater;

    .prologue
    const/4 v3, 0x0

    .line 1164
    const v1, 0x7f03015a

    const/4 v2, 0x0

    invoke-virtual {p1, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Spinner;

    .line 1165
    .local v0, "spinner":Landroid/widget/Spinner;
    const/high16 v1, -0x3db80000    # -50.0f

    invoke-static {v1}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v1

    invoke-virtual {v0, v1, v3, v3, v3}, Landroid/widget/Spinner;->setPadding(IIII)V

    .line 1166
    return-object v0
.end method

.method protected bridge synthetic onCreateNavigationSpinnerAdapter()Landroid/widget/ArrayAdapter;
    .locals 1

    .prologue
    .line 89
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/NewsFragment;->onCreateNavigationSpinnerAdapter()Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter;

    move-result-object v0

    return-object v0
.end method

.method protected onCreateNavigationSpinnerAdapter()Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter;
    .locals 2

    .prologue
    .line 1159
    new-instance v0, Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/NewsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter;-><init>(Landroid/content/Context;)V

    return-object v0
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V
    .locals 1
    .param p1, "menu"    # Landroid/view/Menu;
    .param p2, "inflater"    # Landroid/view/MenuInflater;

    .prologue
    .line 604
    const v0, 0x7f110009

    invoke-virtual {p2, v0, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 605
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 5
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "parent"    # Landroid/view/ViewGroup;
    .param p3, "state"    # Landroid/os/Bundle;

    .prologue
    const/4 v4, 0x0

    .line 545
    invoke-super {p0, p1, p2, p3}, Lcom/vkontakte/android/fragments/PostListFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    move-result-object v0

    .line 546
    .local v0, "v":Landroid/view/View;
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/NewsFragment;->updateEmptyLabel()V

    .line 547
    iget-boolean v1, p0, Lcom/vkontakte/android/fragments/NewsFragment;->needSetSelection:Z

    if-eqz v1, :cond_0

    .line 548
    iput-boolean v4, p0, Lcom/vkontakte/android/fragments/NewsFragment;->needSetSelection:Z

    .line 549
    iget-object v1, p0, Lcom/vkontakte/android/fragments/NewsFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v1}, Lme/grishka/appkit/views/UsableRecyclerView;->getLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v1

    check-cast v1, Landroid/support/v7/widget/LinearLayoutManager;

    sget v2, Lcom/vkontakte/android/data/Posts;->feedItem:I

    sget v3, Lcom/vkontakte/android/data/Posts;->feedItemOffset:I

    invoke-virtual {v1, v2, v3}, Landroid/support/v7/widget/LinearLayoutManager;->scrollToPositionWithOffset(II)V

    .line 552
    :cond_0
    const v1, 0x7f03015e

    invoke-virtual {p1, v1, p2, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/fragments/NewsFragment;->newPostsBtn:Landroid/view/View;

    .line 553
    iget-object v1, p0, Lcom/vkontakte/android/fragments/NewsFragment;->newPostsBtn:Landroid/view/View;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 554
    iget-object v1, p0, Lcom/vkontakte/android/fragments/NewsFragment;->newPostsBtn:Landroid/view/View;

    const v2, 0x1020019

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/ui/OverlayTextView;

    const v2, 0x7f020145

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/ui/OverlayTextView;->setOverlay(I)V

    .line 555
    iget-object v1, p0, Lcom/vkontakte/android/fragments/NewsFragment;->newPostsBtn:Landroid/view/View;

    invoke-static {p0}, Lcom/vkontakte/android/fragments/NewsFragment$$Lambda$4;->lambdaFactory$(Lcom/vkontakte/android/fragments/NewsFragment;)Landroid/view/View$OnClickListener;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 559
    iget-object v1, p0, Lcom/vkontakte/android/fragments/NewsFragment;->contentWrap:Landroid/view/ViewGroup;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/NewsFragment;->newPostsBtn:Landroid/view/View;

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 560
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/NewsFragment;->updateNewPostsBtn()V

    .line 562
    return-object v0
.end method

.method public onDestroy()V
    .locals 2

    .prologue
    .line 722
    invoke-static {}, Lcom/vk/stories/StoriesController;->notificationCenter()Lcom/vk/attachpicker/events/NotificationCenter;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/NewsFragment;->storyUpdateListener:Lcom/vkontakte/android/fragments/NewsFragment$StoryMarkAsSeenListener;

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/events/NotificationCenter;->removeListener(Lcom/vk/attachpicker/events/NotificationListener;)V

    .line 723
    invoke-static {}, Lcom/vk/stories/StoriesController;->notificationCenter()Lcom/vk/attachpicker/events/NotificationCenter;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/NewsFragment;->storiesListInvalidateListener:Lcom/vkontakte/android/fragments/NewsFragment$StoriesListInvalidateListener;

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/events/NotificationCenter;->removeListener(Lcom/vk/attachpicker/events/NotificationListener;)V

    .line 725
    invoke-super {p0}, Lcom/vkontakte/android/fragments/PostListFragment;->onDestroy()V

    .line 726
    return-void
.end method

.method public onDestroyView()V
    .locals 6

    .prologue
    const/4 v3, 0x0

    const/4 v5, 0x0

    .line 579
    iget-object v2, p0, Lcom/vkontakte/android/fragments/NewsFragment;->items:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/ui/posts/PostDisplayItem;

    .line 580
    .local v1, "item":Lcom/vkontakte/android/ui/posts/PostDisplayItem;
    instance-of v4, v1, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;

    if-eqz v4, :cond_0

    .line 581
    check-cast v1, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;

    .end local v1    # "item":Lcom/vkontakte/android/ui/posts/PostDisplayItem;
    iput-object v5, v1, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;->menuClickListener:Landroid/view/View$OnClickListener;

    goto :goto_0

    .line 584
    :cond_1
    sget-object v2, Lcom/vkontakte/android/data/Posts;->feed:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->clear()V

    .line 585
    sget-object v2, Lcom/vkontakte/android/data/Posts;->feed:Ljava/util/List;

    iget-object v4, p0, Lcom/vkontakte/android/fragments/NewsFragment;->data:Ljava/util/ArrayList;

    invoke-interface {v2, v4}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 586
    sget-object v2, Lcom/vkontakte/android/data/Posts;->preloadedFeed:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->clear()V

    .line 587
    sget-object v2, Lcom/vkontakte/android/data/Posts;->preloadedFeed:Ljava/util/List;

    iget-object v4, p0, Lcom/vkontakte/android/fragments/NewsFragment;->preloadedData:Ljava/util/ArrayList;

    invoke-interface {v2, v4}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 588
    iget-object v2, p0, Lcom/vkontakte/android/fragments/NewsFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v2}, Lme/grishka/appkit/views/UsableRecyclerView;->getLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v2

    check-cast v2, Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {v2}, Landroid/support/v7/widget/LinearLayoutManager;->findFirstVisibleItemPosition()I

    move-result v2

    invoke-static {v2}, Lcom/vkontakte/android/cache/NewsfeedCache;->saveFirstShowedIndex(I)I

    move-result v2

    sput v2, Lcom/vkontakte/android/data/Posts;->feedItem:I

    .line 589
    iget-object v2, p0, Lcom/vkontakte/android/fragments/NewsFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v2}, Lme/grishka/appkit/views/UsableRecyclerView;->getChildCount()I

    move-result v2

    if-lez v2, :cond_2

    iget-object v2, p0, Lcom/vkontakte/android/fragments/NewsFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v2, v3}, Lme/grishka/appkit/views/UsableRecyclerView;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getTop()I

    move-result v2

    :goto_1
    invoke-static {v2}, Lcom/vkontakte/android/cache/NewsfeedCache;->saveFirstShowedOffset(I)I

    move-result v2

    sput v2, Lcom/vkontakte/android/data/Posts;->feedItemOffset:I

    .line 590
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/NewsFragment;->getFrom()Ljava/lang/String;

    move-result-object v2

    sput-object v2, Lcom/vkontakte/android/data/Posts;->feedFrom:Ljava/lang/String;

    .line 591
    iget-object v2, p0, Lcom/vkontakte/android/fragments/NewsFragment;->newNews:Ljava/util/List;

    sput-object v2, Lcom/vkontakte/android/data/Posts;->newNews:Ljava/util/List;

    .line 592
    iget-object v2, p0, Lcom/vkontakte/android/fragments/NewsFragment;->newFrom:Ljava/lang/String;

    sput-object v2, Lcom/vkontakte/android/data/Posts;->newNewsFrom:Ljava/lang/String;

    .line 593
    iget-boolean v2, p0, Lcom/vkontakte/android/fragments/NewsFragment;->clearForNew:Z

    sput-boolean v2, Lcom/vkontakte/android/data/Posts;->feedClearForNew:Z

    .line 595
    iput-object v5, p0, Lcom/vkontakte/android/fragments/NewsFragment;->newPostsBtn:Landroid/view/View;

    .line 596
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_2
    iget-object v2, p0, Lcom/vkontakte/android/fragments/NewsFragment;->loadingHeaders:[Landroid/view/View;

    array-length v2, v2

    if-ge v0, v2, :cond_3

    .line 597
    iget-object v2, p0, Lcom/vkontakte/android/fragments/NewsFragment;->loadingHeaders:[Landroid/view/View;

    aput-object v5, v2, v0

    .line 596
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .end local v0    # "i":I
    :cond_2
    move v2, v3

    .line 589
    goto :goto_1

    .line 600
    .restart local v0    # "i":I
    :cond_3
    invoke-super {p0}, Lcom/vkontakte/android/fragments/PostListFragment;->onDestroyView()V

    .line 601
    return-void
.end method

.method public onDetach()V
    .locals 3

    .prologue
    .line 371
    invoke-super {p0}, Lcom/vkontakte/android/fragments/PostListFragment;->onDetach()V

    .line 373
    :try_start_0
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/NewsFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/NewsFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    const-string/jumbo v2, "list_id"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 374
    iget v1, p0, Lcom/vkontakte/android/fragments/NewsFragment;->previousListIDStatic:I

    sput v1, Lcom/vkontakte/android/fragments/NewsFragment;->listIDStatic:I

    .line 376
    :cond_0
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/NewsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/fragments/NewsFragment;->receiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v1, v2}, Landroid/app/Activity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 380
    :goto_0
    return-void

    .line 377
    :catch_0
    move-exception v0

    .line 378
    .local v0, "e":Ljava/lang/Exception;
    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto :goto_0
.end method

.method protected onEmptyViewBtnClick()V
    .locals 3

    .prologue
    .line 232
    iget v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->listID:I

    packed-switch v0, :pswitch_data_0

    .line 241
    :goto_0
    :pswitch_0
    return-void

    .line 235
    :pswitch_1
    const-class v0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;

    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/NewsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/vkontakte/android/navigation/Navigate;->to(Ljava/lang/Class;Landroid/os/Bundle;Landroid/content/Context;)V

    goto :goto_0

    .line 238
    :pswitch_2
    const-class v0, Lcom/vkontakte/android/fragments/SuggestionsRecommendationsFragment;

    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/NewsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/vkontakte/android/navigation/Navigate;->to(Ljava/lang/Class;Landroid/os/Bundle;Landroid/content/Context;)V

    goto :goto_0

    .line 232
    :pswitch_data_0
    .packed-switch -0x3
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public onError(Lme/grishka/appkit/api/ErrorResponse;)V
    .locals 0
    .param p1, "error"    # Lme/grishka/appkit/api/ErrorResponse;

    .prologue
    .line 513
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/NewsFragment;->syncLoadingHeaderState()V

    .line 514
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/PostListFragment;->onError(Lme/grishka/appkit/api/ErrorResponse;)V

    .line 515
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 3
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 608
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f10007f

    if-ne v0, v1, :cond_0

    .line 609
    const-class v0, Lcom/vkontakte/android/fragments/NewsSearchFragment;

    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/NewsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/vkontakte/android/navigation/Navigate;->to(Ljava/lang/Class;Landroid/os/Bundle;Landroid/content/Context;)V

    .line 610
    const/4 v0, 0x1

    .line 612
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onPause()V
    .locals 4

    .prologue
    const/4 v2, 0x0

    .line 384
    invoke-super {p0}, Lcom/vkontakte/android/fragments/PostListFragment;->onPause()V

    .line 385
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->isFirstNav:Z

    if-eqz v0, :cond_0

    .line 386
    iput-boolean v2, p0, Lcom/vkontakte/android/fragments/NewsFragment;->isFirstNav:Z

    .line 388
    :cond_0
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/NewsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Lcom/vkontakte/android/media/VideoPools;->onPause(Landroid/app/Activity;)V

    .line 389
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/NewsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/Activity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string/jumbo v1, "newsfeed_last_opened"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-interface {v0, v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 390
    return-void
.end method

.method public onRefresh()V
    .locals 1

    .prologue
    .line 1124
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->newNewsReq:Lcom/vkontakte/android/api/VKAPIRequest;

    if-eqz v0, :cond_0

    .line 1125
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->newNewsReq:Lcom/vkontakte/android/api/VKAPIRequest;

    invoke-virtual {v0}, Lcom/vkontakte/android/api/VKAPIRequest;->cancel()V

    .line 1126
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->newNewsReq:Lcom/vkontakte/android/api/VKAPIRequest;

    .line 1128
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->newNews:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 1129
    const/4 v0, -0x1

    iput v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->newPostsHideBoundary:I

    .line 1130
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/NewsFragment;->updateNewPostsBtn()V

    .line 1131
    invoke-super {p0}, Lcom/vkontakte/android/fragments/PostListFragment;->onRefresh()V

    .line 1132
    return-void
.end method

.method public onResume()V
    .locals 10

    .prologue
    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 340
    invoke-super {p0}, Lcom/vkontakte/android/fragments/PostListFragment;->onResume()V

    .line 341
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/NewsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-static {v1}, Lcom/vkontakte/android/media/VideoPools;->onResume(Landroid/app/Activity;)V

    .line 342
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/NewsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const/4 v4, 0x0

    invoke-virtual {v1, v4, v8}, Landroid/app/Activity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    const-string/jumbo v4, "feed_last_unload"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    invoke-interface {v1, v4, v6, v7}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v2

    .line 343
    .local v2, "lastUnload":J
    invoke-static {}, Lcom/vkontakte/android/cache/NewsfeedCache;->isNewsfeedTop()Z

    move-result v0

    .line 344
    .local v0, "isTop":Z
    iget-boolean v1, p0, Lcom/vkontakte/android/fragments/NewsFragment;->reloadByTime:Z

    if-nez v1, :cond_1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    sub-long/2addr v4, v2

    iget v1, p0, Lcom/vkontakte/android/fragments/NewsFragment;->listID:I

    invoke-static {v0, v1}, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet;->getRefreshTimeout(ZI)J

    move-result-wide v6

    cmp-long v1, v4, v6

    if-lez v1, :cond_1

    .line 345
    invoke-static {}, Lcom/vkontakte/android/NetworkStateReceiver;->isConnected()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 346
    iget v1, p0, Lcom/vkontakte/android/fragments/NewsFragment;->listID:I

    invoke-virtual {p0, v1, v9}, Lcom/vkontakte/android/fragments/NewsFragment;->setList(IZ)Z

    .line 350
    :cond_0
    :goto_0
    iput-boolean v9, p0, Lcom/vkontakte/android/fragments/NewsFragment;->wasResumed:Z

    .line 351
    iput-boolean v8, p0, Lcom/vkontakte/android/fragments/NewsFragment;->reloadByTime:Z

    .line 352
    return-void

    .line 347
    :cond_1
    iget-boolean v1, p0, Lcom/vkontakte/android/fragments/NewsFragment;->wasResumed:Z

    if-eqz v1, :cond_0

    .line 348
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/NewsFragment;->preloadIfNeed()V

    goto :goto_0
.end method

.method protected onSpinnerItemSelected(I)Z
    .locals 5
    .param p1, "position"    # I

    .prologue
    const/4 v2, 0x0

    .line 1136
    iget-boolean v3, p0, Lcom/vkontakte/android/fragments/NewsFragment;->firstNav:Z

    if-eqz v3, :cond_1

    .line 1137
    iput-boolean v2, p0, Lcom/vkontakte/android/fragments/NewsFragment;->firstNav:Z

    .line 1154
    :cond_0
    :goto_0
    return v2

    .line 1140
    :cond_1
    iget-object v3, p0, Lcom/vkontakte/android/fragments/NewsFragment;->navAdapter:Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter;

    if-eqz v3, :cond_3

    .line 1141
    iget-object v3, p0, Lcom/vkontakte/android/fragments/NewsFragment;->navAdapter:Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter;

    invoke-virtual {v3, p1}, Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter;->setSelectedItem(I)V

    .line 1143
    iget-object v3, p0, Lcom/vkontakte/android/fragments/NewsFragment;->navAdapter:Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter;

    invoke-virtual {v3, p1}, Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter$Item;

    .line 1144
    .local v1, "item":Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter$Item;
    if-eqz v1, :cond_0

    .line 1147
    iget-object v3, v1, Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter$Item;->listItem:Lcom/vkontakte/android/NewsfeedList;

    invoke-virtual {v3}, Lcom/vkontakte/android/NewsfeedList;->getId()I

    move-result v0

    .line 1148
    .local v0, "id":I
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/NewsFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v3

    if-eqz v3, :cond_2

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/NewsFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v3

    const-string/jumbo v4, "list_id"

    invoke-virtual {v3, v4}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_2

    .line 1149
    sput v0, Lcom/vkontakte/android/fragments/NewsFragment;->listIDStatic:I

    .line 1150
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/NewsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v3, v4, v2}, Landroid/app/Activity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    const-string/jumbo v3, "feed_list"

    invoke-interface {v2, v3, v0}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 1152
    :cond_2
    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/NewsFragment;->setList(I)Z

    .line 1154
    .end local v0    # "id":I
    .end local v1    # "item":Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter$Item;
    :cond_3
    const/4 v2, 0x1

    goto :goto_0
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 5
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 441
    invoke-super {p0, p1, p2}, Lcom/vkontakte/android/fragments/PostListFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 442
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/NewsFragment;->getToolbar()Landroid/support/v7/widget/Toolbar;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 443
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/NewsFragment;->getToolbar()Landroid/support/v7/widget/Toolbar;

    move-result-object v2

    invoke-static {p0}, Lcom/vkontakte/android/fragments/NewsFragment$$Lambda$2;->lambdaFactory$(Lcom/vkontakte/android/fragments/NewsFragment;)Landroid/view/View$OnClickListener;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/support/v7/widget/Toolbar;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 453
    :cond_0
    iget-object v2, p0, Lcom/vkontakte/android/fragments/NewsFragment;->navAdapter:Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter;

    invoke-virtual {p0, v2}, Lcom/vkontakte/android/fragments/NewsFragment;->setSpinnerAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 455
    iget-object v2, p0, Lcom/vkontakte/android/fragments/NewsFragment;->navigationSpinner:Landroid/widget/Spinner;

    instance-of v2, v2, Lme/grishka/appkit/views/NavigationSpinner;

    if-eqz v2, :cond_1

    .line 456
    iget-object v2, p0, Lcom/vkontakte/android/fragments/NewsFragment;->navigationSpinner:Landroid/widget/Spinner;

    check-cast v2, Lme/grishka/appkit/views/NavigationSpinner;

    invoke-virtual {v2, p0}, Lme/grishka/appkit/views/NavigationSpinner;->setDropDownWidthHelper(Lme/grishka/appkit/views/NavigationSpinner$DropDownWidthHelper;)V

    .line 458
    :cond_1
    new-instance v2, Ljava/lang/Thread;

    invoke-static {p0}, Lcom/vkontakte/android/fragments/NewsFragment$$Lambda$3;->lambdaFactory$(Lcom/vkontakte/android/fragments/NewsFragment;)Ljava/lang/Runnable;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 465
    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    .line 466
    iget-object v2, p0, Lcom/vkontakte/android/fragments/NewsFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    new-instance v3, Lcom/vkontakte/android/fragments/NewsFragment$2;

    invoke-direct {v3, p0}, Lcom/vkontakte/android/fragments/NewsFragment$2;-><init>(Lcom/vkontakte/android/fragments/NewsFragment;)V

    invoke-virtual {v2, v3}, Lme/grishka/appkit/views/UsableRecyclerView;->addOnScrollListener(Landroid/support/v7/widget/RecyclerView$OnScrollListener;)V

    .line 496
    iget-object v2, p0, Lcom/vkontakte/android/fragments/NewsFragment;->contentView:Landroid/view/ViewGroup;

    const v3, 0x7f100043

    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    .line 497
    .local v1, "loaderContent":Landroid/view/ViewGroup;
    iget-object v2, p0, Lcom/vkontakte/android/fragments/NewsFragment;->loadingHeaders:[Landroid/view/View;

    const/4 v3, 0x0

    new-instance v4, Lcom/vkontakte/android/fragments/NewsFragment$HeaderHolder;

    invoke-direct {v4, p0, v1}, Lcom/vkontakte/android/fragments/NewsFragment$HeaderHolder;-><init>(Lcom/vkontakte/android/fragments/NewsFragment;Landroid/view/ViewGroup;)V

    iget-object v4, v4, Lcom/vkontakte/android/fragments/NewsFragment$HeaderHolder;->itemView:Landroid/view/View;

    aput-object v4, v2, v3

    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 499
    iget-object v2, p0, Lcom/vkontakte/android/fragments/NewsFragment;->contentView:Landroid/view/ViewGroup;

    const v3, 0x7f10001b

    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    .line 500
    .local v0, "errorContent":Landroid/view/ViewGroup;
    iget-object v2, p0, Lcom/vkontakte/android/fragments/NewsFragment;->loadingHeaders:[Landroid/view/View;

    const/4 v3, 0x1

    new-instance v4, Lcom/vkontakte/android/fragments/NewsFragment$HeaderHolder;

    invoke-direct {v4, p0, v0}, Lcom/vkontakte/android/fragments/NewsFragment$HeaderHolder;-><init>(Lcom/vkontakte/android/fragments/NewsFragment;Landroid/view/ViewGroup;)V

    iget-object v4, v4, Lcom/vkontakte/android/fragments/NewsFragment$HeaderHolder;->itemView:Landroid/view/View;

    aput-object v4, v2, v3

    invoke-virtual {v0, v4}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 502
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/NewsFragment;->syncLoadingHeaderState()V

    .line 503
    return-void
.end method

.method public preloadNew()V
    .locals 25

    .prologue
    .line 729
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/NewsFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    move-object/from16 v22, v0

    .line 730
    .local v22, "list":Lme/grishka/appkit/views/UsableRecyclerView;
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/fragments/NewsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v15

    .line 731
    .local v15, "act":Landroid/app/Activity;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/fragments/NewsFragment;->errorView:Landroid/view/View;

    if-eqz v3, :cond_1

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/fragments/NewsFragment;->errorView:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getVisibility()I

    move-result v3

    if-nez v3, :cond_1

    .line 1002
    :cond_0
    :goto_0
    return-void

    .line 734
    :cond_1
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/vkontakte/android/fragments/NewsFragment;->refreshing:Z

    if-nez v3, :cond_0

    .line 737
    if-eqz v15, :cond_0

    if-eqz v22, :cond_0

    .line 740
    invoke-static/range {p0 .. p0}, Lcom/vkontakte/android/fragments/NewsFragment$$Lambda$7;->lambdaFactory$(Lcom/vkontakte/android/fragments/NewsFragment;)Ljava/lang/Runnable;

    move-result-object v3

    invoke-virtual {v15, v3}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 741
    const/16 v16, -0x1

    .line 742
    .local v16, "currentPos":I
    const/16 v18, 0x0

    .line 743
    .local v18, "firstPostID":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/fragments/NewsFragment;->data:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-lez v3, :cond_4

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/fragments/NewsFragment;->data:Ljava/util/ArrayList;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v17, v3

    .line 744
    .local v17, "first":Lcom/vkontakte/android/NewsEntry;
    :goto_1
    if-eqz v17, :cond_2

    .line 745
    move-object/from16 v0, v17

    iget v3, v0, Lcom/vkontakte/android/NewsEntry;->type:I

    sparse-switch v3, :sswitch_data_0

    .line 761
    :cond_2
    :goto_2
    invoke-virtual/range {v22 .. v22}, Lme/grishka/appkit/views/UsableRecyclerView;->getChildCount()I

    move-result v3

    if-lez v3, :cond_3

    .line 762
    const/4 v3, 0x0

    move-object/from16 v0, v22

    invoke-virtual {v0, v3}, Lme/grishka/appkit/views/UsableRecyclerView;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    move-object/from16 v0, v22

    invoke-virtual {v0, v3}, Lme/grishka/appkit/views/UsableRecyclerView;->getChildViewHolder(Landroid/view/View;)Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;

    move-result-object v19

    .line 763
    .local v19, "holder":Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;
    if-eqz v19, :cond_3

    move-object/from16 v0, v19

    instance-of v3, v0, Lcom/vkontakte/android/fragments/PostListFragment$PostDisplayItemViewHolder;

    if-eqz v3, :cond_3

    .line 764
    check-cast v19, Lcom/vkontakte/android/fragments/PostListFragment$PostDisplayItemViewHolder;

    .end local v19    # "holder":Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;
    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/vkontakte/android/fragments/PostListFragment$PostDisplayItemViewHolder;->item:Lcom/vkontakte/android/ui/posts/PostDisplayItem;

    move-object/from16 v21, v0

    .line 765
    .local v21, "item":Lcom/vkontakte/android/ui/posts/PostDisplayItem;
    const/16 v20, 0x0

    .local v20, "i":I
    :goto_3
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/fragments/NewsFragment;->data:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    move/from16 v0, v20

    if-ge v0, v3, :cond_3

    .line 766
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/fragments/NewsFragment;->data:Ljava/util/ArrayList;

    move/from16 v0, v20

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/vkontakte/android/NewsEntry;

    iget v3, v3, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    move-object/from16 v0, v21

    iget v4, v0, Lcom/vkontakte/android/ui/posts/PostDisplayItem;->postOwnerID:I

    if-ne v3, v4, :cond_5

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/fragments/NewsFragment;->data:Ljava/util/ArrayList;

    move/from16 v0, v20

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/vkontakte/android/NewsEntry;

    iget v3, v3, Lcom/vkontakte/android/NewsEntry;->postID:I

    move-object/from16 v0, v21

    iget v4, v0, Lcom/vkontakte/android/ui/posts/PostDisplayItem;->postID:I

    if-ne v3, v4, :cond_5

    .line 767
    move/from16 v16, v20

    .line 773
    .end local v20    # "i":I
    .end local v21    # "item":Lcom/vkontakte/android/ui/posts/PostDisplayItem;
    :cond_3
    move-object/from16 v0, p0

    iget v0, v0, Lcom/vkontakte/android/fragments/NewsFragment;->listID:I

    move/from16 v23, v0

    .line 774
    .local v23, "listId":I
    invoke-direct/range {p0 .. p0}, Lcom/vkontakte/android/fragments/NewsFragment;->getPromoIdByRedirect()Ljava/lang/String;

    move-result-object v24

    .line 775
    .local v24, "promoId":Ljava/lang/String;
    new-instance v3, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet;

    const-string/jumbo v4, ""

    invoke-static {}, Lcom/vkontakte/android/cache/NewsfeedCache;->isNewsfeedTop()Z

    move-result v5

    if-eqz v5, :cond_6

    const/16 v5, 0x14

    :goto_4
    move-object/from16 v0, p0

    iget v6, v0, Lcom/vkontakte/android/fragments/NewsFragment;->listID:I

    if-nez v24, :cond_7

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/vkontakte/android/fragments/NewsFragment;->navAdapter:Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter;

    .line 776
    move/from16 v0, v23

    invoke-virtual {v7, v0}, Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter;->getPromoId(I)Ljava/lang/String;

    move-result-object v7

    .line 777
    :goto_5
    invoke-static {}, Lcom/vkontakte/android/cache/NewsfeedCache;->isNewsfeedTop()Z

    move-result v8

    invoke-static {v8}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v8

    move-object/from16 v0, p0

    iget v9, v0, Lcom/vkontakte/android/fragments/NewsFragment;->lastPosition:I

    move-object/from16 v0, p0

    iget v10, v0, Lcom/vkontakte/android/fragments/NewsFragment;->lastOwnerId:I

    move-object/from16 v0, p0

    iget v11, v0, Lcom/vkontakte/android/fragments/NewsFragment;->lastPostId:I

    .line 778
    invoke-static {}, Lcom/vkontakte/android/fragments/NewsFragment;->getNewsfeedAwayTime()I

    move-result v12

    const/4 v13, 0x0

    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/fragments/NewsFragment;->getListReferrer()Ljava/lang/String;

    move-result-object v14

    invoke-direct/range {v3 .. v14}, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet;-><init>(Ljava/lang/String;IILjava/lang/String;Ljava/lang/Boolean;IIIIZLjava/lang/String;)V

    const-string/jumbo v4, "current_first_post"

    .line 779
    move-object/from16 v0, v18

    invoke-virtual {v3, v4, v0}, Lcom/vkontakte/android/api/newsfeed/NewsfeedGet;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v3

    const-string/jumbo v4, "current_pos"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    move/from16 v0, v16

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, ""

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 780
    invoke-virtual {v3, v4, v5}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v3

    new-instance v4, Lcom/vkontakte/android/fragments/NewsFragment$5;

    move-object/from16 v0, p0

    move/from16 v1, v23

    move-object/from16 v2, v22

    invoke-direct {v4, v0, v1, v2}, Lcom/vkontakte/android/fragments/NewsFragment$5;-><init>(Lcom/vkontakte/android/fragments/NewsFragment;ILme/grishka/appkit/views/UsableRecyclerView;)V

    .line 781
    invoke-virtual {v3, v4}, Lcom/vkontakte/android/api/VKAPIRequest;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v3

    .line 1000
    invoke-virtual {v3, v15}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v3

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/vkontakte/android/fragments/NewsFragment;->newNewsReq:Lcom/vkontakte/android/api/VKAPIRequest;

    goto/16 :goto_0

    .line 743
    .end local v17    # "first":Lcom/vkontakte/android/NewsEntry;
    .end local v23    # "listId":I
    .end local v24    # "promoId":Ljava/lang/String;
    :cond_4
    const/16 v17, 0x0

    goto/16 :goto_1

    .line 748
    .restart local v17    # "first":Lcom/vkontakte/android/NewsEntry;
    :sswitch_0
    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string/jumbo v4, "wall%d_%d"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    move-object/from16 v0, v17

    iget v7, v0, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x1

    move-object/from16 v0, v17

    iget v7, v0, Lcom/vkontakte/android/NewsEntry;->postID:I

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v3, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v18

    .line 749
    goto/16 :goto_2

    .line 751
    :sswitch_1
    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string/jumbo v4, "photo%d_%d"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    move-object/from16 v0, v17

    iget v7, v0, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x1

    move-object/from16 v0, v17

    iget v7, v0, Lcom/vkontakte/android/NewsEntry;->postID:I

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v3, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v18

    .line 752
    goto/16 :goto_2

    .line 754
    :sswitch_2
    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string/jumbo v4, "addedphoto%d"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    move-object/from16 v0, v17

    iget v7, v0, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v3, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v18

    .line 755
    goto/16 :goto_2

    .line 757
    :sswitch_3
    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string/jumbo v4, "taggedphoto%d"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    move-object/from16 v0, v17

    iget v7, v0, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v3, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v18

    goto/16 :goto_2

    .line 765
    .restart local v20    # "i":I
    .restart local v21    # "item":Lcom/vkontakte/android/ui/posts/PostDisplayItem;
    :cond_5
    add-int/lit8 v20, v20, 0x1

    goto/16 :goto_3

    .line 775
    .end local v20    # "i":I
    .end local v21    # "item":Lcom/vkontakte/android/ui/posts/PostDisplayItem;
    .restart local v23    # "listId":I
    .restart local v24    # "promoId":Ljava/lang/String;
    :cond_6
    const/16 v5, 0x19

    goto/16 :goto_4

    :cond_7
    move-object/from16 v7, v24

    .line 776
    goto/16 :goto_5

    .line 745
    nop

    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0x1 -> :sswitch_1
        0x6 -> :sswitch_2
        0x7 -> :sswitch_3
        0xc -> :sswitch_0
    .end sparse-switch
.end method

.method public setList(I)Z
    .locals 1
    .param p1, "id"    # I

    .prologue
    .line 177
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/vkontakte/android/fragments/NewsFragment;->setList(IZ)Z

    move-result v0

    return v0
.end method

.method public setList(IZ)Z
    .locals 2
    .param p1, "id"    # I
    .param p2, "force"    # Z

    .prologue
    const/4 v0, 0x1

    .line 181
    iget v1, p0, Lcom/vkontakte/android/fragments/NewsFragment;->listID:I

    if-ne p1, v1, :cond_1

    if-nez p2, :cond_1

    .line 182
    const/4 v0, 0x0

    .line 199
    :cond_0
    :goto_0
    return v0

    .line 184
    :cond_1
    const/16 v1, -0x2328

    if-eq p1, v1, :cond_2

    .line 185
    iput p1, p0, Lcom/vkontakte/android/fragments/NewsFragment;->listID:I

    .line 187
    :cond_2
    iget-object v1, p0, Lcom/vkontakte/android/fragments/NewsFragment;->data:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    .line 188
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/NewsFragment;->cancelLoading()V

    .line 189
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/NewsFragment;->showProgress()V

    .line 190
    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->refreshing:Z

    .line 191
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/NewsFragment;->loadData()V

    .line 192
    iget-object v1, p0, Lcom/vkontakte/android/fragments/NewsFragment;->newNews:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 193
    const/4 v1, -0x1

    iput v1, p0, Lcom/vkontakte/android/fragments/NewsFragment;->newPostsHideBoundary:I

    .line 194
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/NewsFragment;->updateNewPostsBtn()V

    .line 195
    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->needScrollToTop:Z

    .line 196
    iget-object v1, p0, Lcom/vkontakte/android/fragments/NewsFragment;->emptyView:Landroid/view/View;

    if-eqz v1, :cond_0

    .line 197
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/NewsFragment;->updateEmptyLabel()V

    goto :goto_0
.end method

.method protected setSelectedNavigationItem(I)V
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 539
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/PostListFragment;->setSelectedNavigationItem(I)V

    .line 540
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment;->navAdapter:Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/ui/adapters/NewsSpinnerAdapter;->setSelectedItem(I)V

    .line 541
    return-void
.end method

.method protected showProgress()V
    .locals 0

    .prologue
    .line 507
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/NewsFragment;->syncLoadingHeaderState()V

    .line 508
    invoke-super {p0}, Lcom/vkontakte/android/fragments/PostListFragment;->showProgress()V

    .line 509
    return-void
.end method
