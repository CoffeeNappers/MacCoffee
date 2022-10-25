.class public Lcom/vkontakte/android/fragments/ProfileFragment;
.super Lcom/vkontakte/android/fragments/PostListFragment;
.source "ProfileFragment.java"

# interfaces
.implements Lcom/vkontakte/android/fragments/FitSystemWindowsFragment;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;,
        Lcom/vkontakte/android/fragments/ProfileFragment$ProfilePhotoViewerCallback;,
        Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;,
        Lcom/vkontakte/android/fragments/ProfileFragment$VideoFeedViewHolder;,
        Lcom/vkontakte/android/fragments/ProfileFragment$VideoFeedAdapter;,
        Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedViewHolder;,
        Lcom/vkontakte/android/fragments/ProfileFragment$GoodViewHolder;,
        Lcom/vkontakte/android/fragments/ProfileFragment$MainAlbumPhotoFeedAdapter;,
        Lcom/vkontakte/android/fragments/ProfileFragment$AllPhotosPhotoFeedAdapter;,
        Lcom/vkontakte/android/fragments/ProfileFragment$GoodsAdapter;,
        Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedAdapter;,
        Lcom/vkontakte/android/fragments/ProfileFragment$AudioViewHolder;,
        Lcom/vkontakte/android/fragments/ProfileFragment$BoardTopicViewHolder;,
        Lcom/vkontakte/android/fragments/ProfileFragment$ContentTitleViewHolder;,
        Lcom/vkontakte/android/fragments/ProfileFragment$OverviewInfoViewHolder;,
        Lcom/vkontakte/android/fragments/ProfileFragment$WidgetViewHolder;,
        Lcom/vkontakte/android/fragments/ProfileFragment$HeaderViewHolder;,
        Lcom/vkontakte/android/fragments/ProfileFragment$ButtonViewHolder;,
        Lcom/vkontakte/android/fragments/ProfileFragment$ViewViewHolder;,
        Lcom/vkontakte/android/fragments/ProfileFragment$AudioInfoItem;,
        Lcom/vkontakte/android/fragments/ProfileFragment$BoardTopicInfoItem;,
        Lcom/vkontakte/android/fragments/ProfileFragment$ButtonItem;,
        Lcom/vkontakte/android/fragments/ProfileFragment$ContentTitleInfoItem;,
        Lcom/vkontakte/android/fragments/ProfileFragment$OverviewInfoItem;,
        Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;,
        Lcom/vkontakte/android/fragments/ProfileFragment$InfoItem;,
        Lcom/vkontakte/android/fragments/ProfileFragment$CardMergeAdapter;,
        Lcom/vkontakte/android/fragments/ProfileFragment$ProfileInfoAdapter;,
        Lcom/vkontakte/android/fragments/ProfileFragment$Builder;
    }
.end annotation


# static fields
.field private static final AVA_RESULT:I = 0xf3d

.field private static final EDIT_RESULT:I = 0xf3e

.field private static final INVITE_RESULT:I = 0xf3f

.field private static final LAYOUT_TYPE_NORMAL:I = 0x0

.field private static final LAYOUT_TYPE_WIDE:I = 0x1

.field private static final LAYOUT_TYPE_XWIDE:I = 0x2


# instance fields
.field private audioLoadReq:Lme/grishka/appkit/api/APIRequest;

.field private audioPlaylist:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;"
        }
    .end annotation
.end field

.field private btnClickListener:Landroid/view/View$OnClickListener;

.field private final counterClickListener:Landroid/view/View$OnClickListener;

.field private countersWrap:Landroid/widget/LinearLayout;

.field private detailsItems:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;",
            ">;"
        }
    .end annotation
.end field

.field private emptyText:Landroid/widget/TextView;

.field private emptyViewItem:Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;

.field private fixedPostId:I

.field private googleApiClient:Lcom/google/android/gms/common/api/GoogleApiClient;

.field private headerView:Landroid/view/View;

.field private indexingAppUri:Landroid/net/Uri;

.field private indexingWebUri:Landroid/net/Uri;

.field private infoAdapter:Lcom/vkontakte/android/fragments/ProfileFragment$ProfileInfoAdapter;

.field private infoItems:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/fragments/ProfileFragment$InfoItem;",
            ">;"
        }
    .end annotation
.end field

.field private layoutType:I

.field private nextFrom:Ljava/lang/String;

.field private ownerOnly:Z

.field parallaxPreDrawListener:Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;

.field private pendingAudioId:I

.field private photoViewer:Lcom/vkontakte/android/PhotoViewer;

.field private postponedView:Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;

.field private profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

.field private profileAdapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

.field private receiver:Landroid/content/BroadcastReceiver;

.field private selector:Landroid/view/View;

.field private selectorItem:Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;

.field private showExtended:Z

.field private statusBarBgView:Landroid/view/View;

.field private final storyMarkAsSeenListener:Lcom/vk/attachpicker/events/NotificationListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vk/attachpicker/events/NotificationListener",
            "<",
            "Lcom/vk/stories/model/StoryEntry;",
            ">;"
        }
    .end annotation
.end field

.field private suggestsView:Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;

.field private totalPosts:I

.field private uid:I


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 393
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/PostListFragment;-><init>()V

    .line 222
    iput-boolean v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->showExtended:Z

    .line 223
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->infoItems:Ljava/util/ArrayList;

    .line 224
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->detailsItems:Ljava/util/ArrayList;

    .line 227
    iput-boolean v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->ownerOnly:Z

    .line 236
    iput v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->layoutType:I

    .line 238
    iput-object v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->audioPlaylist:Ljava/util/ArrayList;

    .line 245
    iput-object v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->nextFrom:Ljava/lang/String;

    .line 247
    new-instance v0, Lcom/vkontakte/android/fragments/ProfileFragment$1;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/ProfileFragment$1;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->storyMarkAsSeenListener:Lcom/vk/attachpicker/events/NotificationListener;

    .line 272
    new-instance v0, Lcom/vkontakte/android/fragments/ProfileFragment$2;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/ProfileFragment$2;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->receiver:Landroid/content/BroadcastReceiver;

    .line 290
    new-instance v0, Lcom/vkontakte/android/fragments/ProfileFragment$3;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/ProfileFragment$3;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->counterClickListener:Landroid/view/View$OnClickListener;

    .line 297
    new-instance v0, Lcom/vkontakte/android/fragments/ProfileFragment$4;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/ProfileFragment$4;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->btnClickListener:Landroid/view/View$OnClickListener;

    .line 4712
    new-instance v0, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->parallaxPreDrawListener:Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;

    .line 395
    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/fragments/ProfileFragment;)Lcom/vkontakte/android/api/ExtendedUserProfile;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileFragment;

    .prologue
    .line 189
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    return-object v0
.end method

.method static synthetic access$002(Lcom/vkontakte/android/fragments/ProfileFragment;Lcom/vkontakte/android/api/ExtendedUserProfile;)Lcom/vkontakte/android/api/ExtendedUserProfile;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileFragment;
    .param p1, "x1"    # Lcom/vkontakte/android/api/ExtendedUserProfile;

    .prologue
    .line 189
    iput-object p1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    return-object p1
.end method

.method static synthetic access$100(Lcom/vkontakte/android/fragments/ProfileFragment;)I
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileFragment;

    .prologue
    .line 189
    iget v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    return v0
.end method

.method static synthetic access$1000(Lcom/vkontakte/android/fragments/ProfileFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileFragment;

    .prologue
    .line 189
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->leaveGroup()V

    return-void
.end method

.method static synthetic access$10000(Lcom/vkontakte/android/fragments/ProfileFragment;)Lme/grishka/appkit/views/UsableRecyclerView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileFragment;

    .prologue
    .line 189
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    return-object v0
.end method

.method static synthetic access$10100(Lcom/vkontakte/android/fragments/ProfileFragment;)Lme/grishka/appkit/views/UsableRecyclerView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileFragment;

    .prologue
    .line 189
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    return-object v0
.end method

.method static synthetic access$10200(Lcom/vkontakte/android/fragments/ProfileFragment;)Lme/grishka/appkit/views/UsableRecyclerView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileFragment;

    .prologue
    .line 189
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    return-object v0
.end method

.method static synthetic access$1100(Lcom/vkontakte/android/fragments/ProfileFragment;Landroid/view/View;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileFragment;
    .param p1, "x1"    # Landroid/view/View;

    .prologue
    .line 189
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/ProfileFragment;->showChangeEventDecisionOptions(Landroid/view/View;)V

    return-void
.end method

.method static synthetic access$1200(Lcom/vkontakte/android/fragments/ProfileFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileFragment;

    .prologue
    .line 189
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->editFriendLists()V

    return-void
.end method

.method static synthetic access$1300(Lcom/vkontakte/android/fragments/ProfileFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileFragment;

    .prologue
    .line 189
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->removeFriend()V

    return-void
.end method

.method static synthetic access$1400(Lcom/vkontakte/android/fragments/ProfileFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileFragment;

    .prologue
    .line 189
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->toggleNewsHidden()V

    return-void
.end method

.method static synthetic access$1500(Lcom/vkontakte/android/fragments/ProfileFragment;)Lcom/vkontakte/android/fragments/ProfileFragment$ProfileInfoAdapter;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileFragment;

    .prologue
    .line 189
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->infoAdapter:Lcom/vkontakte/android/fragments/ProfileFragment$ProfileInfoAdapter;

    return-object v0
.end method

.method static synthetic access$1600(Lcom/vkontakte/android/fragments/ProfileFragment;)I
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileFragment;

    .prologue
    .line 189
    iget v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->layoutType:I

    return v0
.end method

.method static synthetic access$1700(Lcom/vkontakte/android/fragments/ProfileFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileFragment;

    .prologue
    .line 189
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->infoItems:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$200(Lcom/vkontakte/android/fragments/ProfileFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileFragment;

    .prologue
    .line 189
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->refresh()V

    return-void
.end method

.method static synthetic access$2000(Lcom/vkontakte/android/fragments/ProfileFragment;)Lme/grishka/appkit/views/UsableRecyclerView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileFragment;

    .prologue
    .line 189
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    return-object v0
.end method

.method static synthetic access$2100(Lcom/vkontakte/android/fragments/ProfileFragment;)Landroid/view/ViewGroup;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileFragment;

    .prologue
    .line 189
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->contentWrap:Landroid/view/ViewGroup;

    return-object v0
.end method

.method static synthetic access$2200(Lcom/vkontakte/android/fragments/ProfileFragment;)Lme/grishka/appkit/views/UsableRecyclerView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileFragment;

    .prologue
    .line 189
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    return-object v0
.end method

.method static synthetic access$2300(Lcom/vkontakte/android/fragments/ProfileFragment;)Landroid/view/ViewGroup;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileFragment;

    .prologue
    .line 189
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->contentWrap:Landroid/view/ViewGroup;

    return-object v0
.end method

.method static synthetic access$2400(Lcom/vkontakte/android/fragments/ProfileFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileFragment;

    .prologue
    .line 189
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->updateHeaderItems()V

    return-void
.end method

.method static synthetic access$2500(Lcom/vkontakte/android/fragments/ProfileFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileFragment;

    .prologue
    .line 189
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->sendAppIndexing()V

    return-void
.end method

.method static synthetic access$2600(Lcom/vkontakte/android/fragments/ProfileFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileFragment;

    .prologue
    .line 189
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->addParallaxEffect()V

    return-void
.end method

.method static synthetic access$2702(Lcom/vkontakte/android/fragments/ProfileFragment;Lme/grishka/appkit/api/APIRequest;)Lme/grishka/appkit/api/APIRequest;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileFragment;
    .param p1, "x1"    # Lme/grishka/appkit/api/APIRequest;

    .prologue
    .line 189
    iput-object p1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->currentRequest:Lme/grishka/appkit/api/APIRequest;

    return-object p1
.end method

.method static synthetic access$2800(Lcom/vkontakte/android/fragments/ProfileFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileFragment;

    .prologue
    .line 189
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->showContent()V

    return-void
.end method

.method static synthetic access$2900(Lcom/vkontakte/android/fragments/ProfileFragment;II)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileFragment;
    .param p1, "x1"    # I
    .param p2, "x2"    # I

    .prologue
    .line 189
    invoke-direct {p0, p1, p2}, Lcom/vkontakte/android/fragments/ProfileFragment;->loadWall(II)V

    return-void
.end method

.method static synthetic access$300(Lcom/vkontakte/android/fragments/ProfileFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileFragment;

    .prologue
    .line 189
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->refresh()V

    return-void
.end method

.method static synthetic access$3000(Lcom/vkontakte/android/fragments/ProfileFragment;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileFragment;

    .prologue
    .line 189
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->headerView:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$3100(Lcom/vkontakte/android/fragments/ProfileFragment;Ljava/lang/CharSequence;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileFragment;
    .param p1, "x1"    # Ljava/lang/CharSequence;

    .prologue
    .line 189
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/ProfileFragment;->showStatusEditDlg(Ljava/lang/CharSequence;)V

    return-void
.end method

.method static synthetic access$3200(Lcom/vkontakte/android/fragments/ProfileFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileFragment;

    .prologue
    .line 189
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->updateButtons()V

    return-void
.end method

.method static synthetic access$3300(Lcom/vkontakte/android/fragments/ProfileFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileFragment;

    .prologue
    .line 189
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->refresh()V

    return-void
.end method

.method static synthetic access$3400(Lcom/vkontakte/android/fragments/ProfileFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileFragment;

    .prologue
    .line 189
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->refresh()V

    return-void
.end method

.method static synthetic access$3500(Lcom/vkontakte/android/fragments/ProfileFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileFragment;

    .prologue
    .line 189
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->updatePostsButtons()V

    return-void
.end method

.method static synthetic access$3600(Lcom/vkontakte/android/fragments/ProfileFragment;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileFragment;

    .prologue
    .line 189
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->refreshing:Z

    return v0
.end method

.method static synthetic access$3700(Lcom/vkontakte/android/fragments/ProfileFragment;)I
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileFragment;

    .prologue
    .line 189
    iget v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->fixedPostId:I

    return v0
.end method

.method static synthetic access$3702(Lcom/vkontakte/android/fragments/ProfileFragment;I)I
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileFragment;
    .param p1, "x1"    # I

    .prologue
    .line 189
    iput p1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->fixedPostId:I

    return p1
.end method

.method static synthetic access$3800(Lcom/vkontakte/android/fragments/ProfileFragment;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileFragment;

    .prologue
    .line 189
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->content:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$3900(Lcom/vkontakte/android/fragments/ProfileFragment;)Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileFragment;

    .prologue
    .line 189
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->emptyViewItem:Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;

    return-object v0
.end method

.method static synthetic access$400(Lcom/vkontakte/android/fragments/ProfileFragment;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileFragment;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 189
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/ProfileFragment;->openOwnerContent(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$4000(Lcom/vkontakte/android/fragments/ProfileFragment;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileFragment;

    .prologue
    .line 189
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->emptyText:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$4100(Lcom/vkontakte/android/fragments/ProfileFragment;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileFragment;

    .prologue
    .line 189
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->selector:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$4200(Lcom/vkontakte/android/fragments/ProfileFragment;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileFragment;

    .prologue
    .line 189
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->refreshing:Z

    return v0
.end method

.method static synthetic access$4300(Lcom/vkontakte/android/fragments/ProfileFragment;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileFragment;

    .prologue
    .line 189
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->ownerOnly:Z

    return v0
.end method

.method static synthetic access$4400(Lcom/vkontakte/android/fragments/ProfileFragment;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileFragment;

    .prologue
    .line 189
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->refreshing:Z

    return v0
.end method

.method static synthetic access$4500(Lcom/vkontakte/android/fragments/ProfileFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileFragment;

    .prologue
    .line 189
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$4600(Lcom/vkontakte/android/fragments/ProfileFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileFragment;

    .prologue
    .line 189
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->preloadedData:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$4702(Lcom/vkontakte/android/fragments/ProfileFragment;I)I
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileFragment;
    .param p1, "x1"    # I

    .prologue
    .line 189
    iput p1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->totalPosts:I

    return p1
.end method

.method static synthetic access$4800(Lcom/vkontakte/android/fragments/ProfileFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileFragment;

    .prologue
    .line 189
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->updatePostCount()V

    return-void
.end method

.method static synthetic access$4902(Lcom/vkontakte/android/fragments/ProfileFragment;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileFragment;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 189
    iput-object p1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->nextFrom:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$500(Lcom/vkontakte/android/fragments/ProfileFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileFragment;

    .prologue
    .line 189
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->showNewPost()V

    return-void
.end method

.method static synthetic access$5002(Lcom/vkontakte/android/fragments/ProfileFragment;Lme/grishka/appkit/api/APIRequest;)Lme/grishka/appkit/api/APIRequest;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileFragment;
    .param p1, "x1"    # Lme/grishka/appkit/api/APIRequest;

    .prologue
    .line 189
    iput-object p1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->currentRequest:Lme/grishka/appkit/api/APIRequest;

    return-object p1
.end method

.method static synthetic access$5100(Lcom/vkontakte/android/fragments/ProfileFragment;)Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileFragment;

    .prologue
    .line 189
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->selectorItem:Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;

    return-object v0
.end method

.method static synthetic access$5200(Lcom/vkontakte/android/fragments/ProfileFragment;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileFragment;
    .param p1, "x1"    # Z

    .prologue
    .line 189
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/ProfileFragment;->setRefreshEnabled(Z)V

    return-void
.end method

.method static synthetic access$5302(Lcom/vkontakte/android/fragments/ProfileFragment;Lme/grishka/appkit/api/APIRequest;)Lme/grishka/appkit/api/APIRequest;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileFragment;
    .param p1, "x1"    # Lme/grishka/appkit/api/APIRequest;

    .prologue
    .line 189
    iput-object p1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->audioLoadReq:Lme/grishka/appkit/api/APIRequest;

    return-object p1
.end method

.method static synthetic access$5400(Lcom/vkontakte/android/fragments/ProfileFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileFragment;

    .prologue
    .line 189
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->audioPlaylist:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$5402(Lcom/vkontakte/android/fragments/ProfileFragment;Ljava/util/ArrayList;)Ljava/util/ArrayList;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileFragment;
    .param p1, "x1"    # Ljava/util/ArrayList;

    .prologue
    .line 189
    iput-object p1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->audioPlaylist:Ljava/util/ArrayList;

    return-object p1
.end method

.method static synthetic access$5500(Lcom/vkontakte/android/fragments/ProfileFragment;)I
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileFragment;

    .prologue
    .line 189
    iget v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->pendingAudioId:I

    return v0
.end method

.method static synthetic access$5502(Lcom/vkontakte/android/fragments/ProfileFragment;I)I
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileFragment;
    .param p1, "x1"    # I

    .prologue
    .line 189
    iput p1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->pendingAudioId:I

    return p1
.end method

.method static synthetic access$5600(Lcom/vkontakte/android/fragments/ProfileFragment;I)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileFragment;
    .param p1, "x1"    # I

    .prologue
    .line 189
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/ProfileFragment;->playAudio(I)V

    return-void
.end method

.method static synthetic access$5700(Lcom/vkontakte/android/fragments/ProfileFragment;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileFragment;

    .prologue
    .line 189
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->isEnableGroupParallaxEffect()Z

    move-result v0

    return v0
.end method

.method static synthetic access$5900(Lcom/vkontakte/android/fragments/ProfileFragment;)Landroid/view/ViewGroup;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileFragment;

    .prologue
    .line 189
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->contentView:Landroid/view/ViewGroup;

    return-object v0
.end method

.method static synthetic access$600(Lcom/vkontakte/android/fragments/ProfileFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileFragment;

    .prologue
    .line 189
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->addFriend()V

    return-void
.end method

.method static synthetic access$6000(Lcom/vkontakte/android/fragments/ProfileFragment;)Landroid/view/ViewGroup;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileFragment;

    .prologue
    .line 189
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->contentView:Landroid/view/ViewGroup;

    return-object v0
.end method

.method static synthetic access$6200(Lcom/vkontakte/android/fragments/ProfileFragment;)Landroid/view/ViewGroup;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileFragment;

    .prologue
    .line 189
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->contentView:Landroid/view/ViewGroup;

    return-object v0
.end method

.method static synthetic access$6300(Lcom/vkontakte/android/fragments/ProfileFragment;)Lme/grishka/appkit/views/UsableRecyclerView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileFragment;

    .prologue
    .line 189
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    return-object v0
.end method

.method static synthetic access$6400(Lcom/vkontakte/android/fragments/ProfileFragment;)Lme/grishka/appkit/views/UsableRecyclerView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileFragment;

    .prologue
    .line 189
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    return-object v0
.end method

.method static synthetic access$6500(Lcom/vkontakte/android/fragments/ProfileFragment;)Lme/grishka/appkit/views/UsableRecyclerView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileFragment;

    .prologue
    .line 189
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    return-object v0
.end method

.method static synthetic access$6600(Lcom/vkontakte/android/fragments/ProfileFragment;I)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileFragment;
    .param p1, "x1"    # I

    .prologue
    .line 189
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/ProfileFragment;->loadPlaylistAndPlay(I)V

    return-void
.end method

.method static synthetic access$6700(Lcom/vkontakte/android/fragments/ProfileFragment;)Lcom/vkontakte/android/PhotoViewer;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileFragment;

    .prologue
    .line 189
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->photoViewer:Lcom/vkontakte/android/PhotoViewer;

    return-object v0
.end method

.method static synthetic access$6702(Lcom/vkontakte/android/fragments/ProfileFragment;Lcom/vkontakte/android/PhotoViewer;)Lcom/vkontakte/android/PhotoViewer;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileFragment;
    .param p1, "x1"    # Lcom/vkontakte/android/PhotoViewer;

    .prologue
    .line 189
    iput-object p1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->photoViewer:Lcom/vkontakte/android/PhotoViewer;

    return-object p1
.end method

.method static synthetic access$700(Lcom/vkontakte/android/fragments/ProfileFragment;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileFragment;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 189
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/ProfileFragment;->doAddFriend(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$7000(Lcom/vkontakte/android/fragments/ProfileFragment;)Landroid/view/ViewGroup;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileFragment;

    .prologue
    .line 189
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->contentView:Landroid/view/ViewGroup;

    return-object v0
.end method

.method static synthetic access$7600(Lcom/vkontakte/android/fragments/ProfileFragment;)Landroid/view/ViewGroup;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileFragment;

    .prologue
    .line 189
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->contentView:Landroid/view/ViewGroup;

    return-object v0
.end method

.method static synthetic access$800(Lcom/vkontakte/android/fragments/ProfileFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileFragment;

    .prologue
    .line 189
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->doRemoveFriend()V

    return-void
.end method

.method static synthetic access$900(Lcom/vkontakte/android/fragments/ProfileFragment;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileFragment;
    .param p1, "x1"    # Z

    .prologue
    .line 189
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/ProfileFragment;->joinGroup(Z)V

    return-void
.end method

.method static synthetic access$9000(Lcom/vkontakte/android/fragments/ProfileFragment;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileFragment;

    .prologue
    .line 189
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->statusBarBgView:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$9100(Lcom/vkontakte/android/fragments/ProfileFragment;)Lme/grishka/appkit/views/UsableRecyclerView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileFragment;

    .prologue
    .line 189
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    return-object v0
.end method

.method static synthetic access$9200(Lcom/vkontakte/android/fragments/ProfileFragment;)Lme/grishka/appkit/views/UsableRecyclerView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileFragment;

    .prologue
    .line 189
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    return-object v0
.end method

.method static synthetic access$9300(Lcom/vkontakte/android/fragments/ProfileFragment;)Lme/grishka/appkit/views/UsableRecyclerView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileFragment;

    .prologue
    .line 189
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    return-object v0
.end method

.method static synthetic access$9400(Lcom/vkontakte/android/fragments/ProfileFragment;)Lme/grishka/appkit/views/UsableRecyclerView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileFragment;

    .prologue
    .line 189
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    return-object v0
.end method

.method static synthetic access$9500(Lcom/vkontakte/android/fragments/ProfileFragment;)Lme/grishka/appkit/views/UsableRecyclerView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileFragment;

    .prologue
    .line 189
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    return-object v0
.end method

.method static synthetic access$9600(Lcom/vkontakte/android/fragments/ProfileFragment;)Lme/grishka/appkit/views/UsableRecyclerView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileFragment;

    .prologue
    .line 189
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    return-object v0
.end method

.method static synthetic access$9700(Lcom/vkontakte/android/fragments/ProfileFragment;)Lme/grishka/appkit/views/UsableRecyclerView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileFragment;

    .prologue
    .line 189
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    return-object v0
.end method

.method static synthetic access$9800(Lcom/vkontakte/android/fragments/ProfileFragment;)Lme/grishka/appkit/views/UsableRecyclerView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileFragment;

    .prologue
    .line 189
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    return-object v0
.end method

.method static synthetic access$9900(Lcom/vkontakte/android/fragments/ProfileFragment;)Lme/grishka/appkit/views/UsableRecyclerView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/ProfileFragment;

    .prologue
    .line 189
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    return-object v0
.end method

.method static synthetic access$lambda$0(Lcom/vkontakte/android/fragments/ProfileFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->openAudioStatus()V

    return-void
.end method

.method private addButtonsItem()V
    .locals 5

    .prologue
    .line 2669
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v2

    if-gtz v2, :cond_0

    .line 2685
    :goto_0
    return-void

    .line 2672
    :cond_0
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    const v3, 0x7f0301d9

    const/4 v4, 0x0

    invoke-static {v2, v3, v4}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 2673
    .local v0, "btns":Landroid/view/View;
    new-instance v1, Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;

    invoke-direct {v1, p0, v0}, Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;Landroid/view/View;)V

    .line 2674
    .local v1, "btnsItem":Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;
    const/4 v2, 0x6

    iput v2, v1, Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;->backgroundType:I

    .line 2675
    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->infoItems:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2676
    const v2, 0x7f1004fc

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    invoke-static {p0}, Lcom/vkontakte/android/fragments/ProfileFragment$$Lambda$33;->lambdaFactory$(Lcom/vkontakte/android/fragments/ProfileFragment;)Landroid/view/View$OnClickListener;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 2677
    const v2, 0x7f1004fe

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    invoke-static {p0}, Lcom/vkontakte/android/fragments/ProfileFragment$$Lambda$34;->lambdaFactory$(Lcom/vkontakte/android/fragments/ProfileFragment;)Landroid/view/View$OnClickListener;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_0
.end method

.method private addFriend()V
    .locals 9

    .prologue
    const/4 v8, 0x0

    .line 2834
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-boolean v1, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->canSendFriendRequest:Z

    if-eqz v1, :cond_1

    .line 2835
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const v2, 0x7f030022

    invoke-static {v1, v2, v8}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 2836
    .local v0, "alertView":Landroid/view/View;
    const v1, 0x7f100197

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v2, v2, Lcom/vkontakte/android/api/ExtendedUserProfile;->profile:Lcom/vkontakte/android/UserProfile;

    iget-boolean v2, v2, Lcom/vkontakte/android/UserProfile;->f:Z

    if-eqz v2, :cond_0

    const v2, 0x7f0800af

    :goto_0
    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v7, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v7, v7, Lcom/vkontakte/android/api/ExtendedUserProfile;->profile:Lcom/vkontakte/android/UserProfile;

    iget-object v7, v7, Lcom/vkontakte/android/UserProfile;->firstName:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, " "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v7, v7, Lcom/vkontakte/android/api/ExtendedUserProfile;->profile:Lcom/vkontakte/android/UserProfile;

    iget-object v7, v7, Lcom/vkontakte/android/UserProfile;->lastName:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-virtual {v3, v2, v4}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 2837
    new-instance v1, Lcom/vkontakte/android/VKAlertDialog$Builder;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/vkontakte/android/VKAlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v2, 0x7f080540

    .line 2838
    invoke-virtual {v1, v2}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 2839
    invoke-virtual {v1, v0}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x7f080479

    invoke-static {p0, v0}, Lcom/vkontakte/android/fragments/ProfileFragment$$Lambda$37;->lambdaFactory$(Lcom/vkontakte/android/fragments/ProfileFragment;Landroid/view/View;)Landroid/content/DialogInterface$OnClickListener;

    move-result-object v3

    .line 2840
    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x7f08011f

    .line 2844
    invoke-virtual {v1, v2, v8}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 2845
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 2849
    .end local v0    # "alertView":Landroid/view/View;
    :goto_1
    return-void

    .line 2836
    .restart local v0    # "alertView":Landroid/view/View;
    :cond_0
    const v2, 0x7f0800b0

    goto :goto_0

    .line 2847
    .end local v0    # "alertView":Landroid/view/View;
    :cond_1
    invoke-direct {p0, v8}, Lcom/vkontakte/android/fragments/ProfileFragment;->doAddFriend(Ljava/lang/String;)V

    goto :goto_1
.end method

.method private addParallaxEffect()V
    .locals 2

    .prologue
    .line 487
    iget v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    if-gtz v0, :cond_0

    invoke-direct {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->isEnableGroupParallaxEffect()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 488
    :cond_0
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getToolbar()Landroid/support/v7/widget/Toolbar;

    move-result-object v0

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getToolbar()Landroid/support/v7/widget/Toolbar;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v7/widget/Toolbar;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/Toolbar;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 489
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v0}, Lme/grishka/appkit/views/UsableRecyclerView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->parallaxPreDrawListener:Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;

    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 490
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v0}, Lme/grishka/appkit/views/UsableRecyclerView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->parallaxPreDrawListener:Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;

    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 492
    :cond_1
    return-void
.end method

.method private addPostsButton(Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;)V
    .locals 3
    .param p1, "item"    # Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;

    .prologue
    .line 2720
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->infoItems:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_0

    .line 2721
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->infoItems:Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->infoItems:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/fragments/ProfileFragment$InfoItem;

    .line 2722
    .local v0, "last":Lcom/vkontakte/android/fragments/ProfileFragment$InfoItem;
    instance-of v1, v0, Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/ProfileFragment$InfoItem;->getType()I

    move-result v1

    const v2, 0x7f100500

    if-ne v1, v2, :cond_0

    .line 2723
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->infoItems:Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->infoItems:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {v1, v2, p1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 2728
    .end local v0    # "last":Lcom/vkontakte/android/fragments/ProfileFragment$InfoItem;
    :goto_0
    return-void

    .line 2727
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->infoItems:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method private addToFavorites()V
    .locals 3

    .prologue
    .line 3116
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 3117
    .local v0, "activity":Landroid/app/Activity;
    iget v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    if-lez v1, :cond_0

    new-instance v1, Lcom/vkontakte/android/api/fave/FaveAddUser;

    iget v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    invoke-direct {v1, v2}, Lcom/vkontakte/android/api/fave/FaveAddUser;-><init>(I)V

    :goto_0
    new-instance v2, Lcom/vkontakte/android/fragments/ProfileFragment$29;

    invoke-direct {v2, p0, v0, v0}, Lcom/vkontakte/android/fragments/ProfileFragment$29;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;Landroid/content/Context;Landroid/app/Activity;)V

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/api/VKAPIRequest;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    .line 3126
    invoke-virtual {v1, v0}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 3127
    return-void

    .line 3117
    :cond_0
    new-instance v1, Lcom/vkontakte/android/api/fave/FaveAddGroup;

    iget v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    invoke-static {v2}, Ljava/lang/Math;->abs(I)I

    move-result v2

    invoke-direct {v1, v2}, Lcom/vkontakte/android/api/fave/FaveAddGroup;-><init>(I)V

    goto :goto_0
.end method

.method private applyLayout()V
    .locals 3

    .prologue
    .line 666
    const/4 v0, 0x0

    .line 667
    .local v0, "res":I
    iget v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->layoutType:I

    packed-switch v1, :pswitch_data_0

    .line 676
    :goto_0
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {v1, v0, v2}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->headerView:Landroid/view/View;

    .line 677
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->parallaxPreDrawListener:Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->cleanOldView()V

    .line 678
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->headerView:Landroid/view/View;

    const v2, 0x7f1004ee

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-static {p0}, Lcom/vkontakte/android/fragments/ProfileFragment$$Lambda$3;->lambdaFactory$(Lcom/vkontakte/android/fragments/ProfileFragment;)Landroid/view/View$OnClickListener;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 685
    iget v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v2

    if-eq v1, v2, :cond_0

    iget v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    if-gez v1, :cond_1

    iget v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    neg-int v1, v1

    invoke-static {v1}, Lcom/vkontakte/android/data/Groups;->isGroupAdmin(I)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 686
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->headerView:Landroid/view/View;

    invoke-static {p0}, Lcom/vkontakte/android/fragments/ProfileFragment$$Lambda$4;->lambdaFactory$(Lcom/vkontakte/android/fragments/ProfileFragment;)Landroid/view/View$OnLongClickListener;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 691
    :cond_1
    iget v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    if-lez v1, :cond_2

    .line 692
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v1}, Lme/grishka/appkit/views/UsableRecyclerView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v1

    new-instance v2, Lcom/vkontakte/android/fragments/ProfileFragment$7;

    invoke-direct {v2, p0}, Lcom/vkontakte/android/fragments/ProfileFragment$7;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;)V

    invoke-virtual {v1, v2}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 702
    iget v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->layoutType:I

    if-nez v1, :cond_2

    .line 703
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->headerView:Landroid/view/View;

    new-instance v2, Lcom/vkontakte/android/fragments/ProfileFragment$8;

    invoke-direct {v2, p0}, Lcom/vkontakte/android/fragments/ProfileFragment$8;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;)V

    invoke-virtual {v1, v2}, Landroid/view/View;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    .line 724
    :cond_2
    return-void

    .line 669
    :pswitch_0
    iget v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    if-lez v1, :cond_3

    const v0, 0x7f0301d1

    .line 670
    :goto_1
    goto :goto_0

    .line 669
    :cond_3
    const v0, 0x7f0301d2

    goto :goto_1

    .line 673
    :pswitch_1
    iget v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    if-lez v1, :cond_4

    const v0, 0x7f0301d4

    :goto_2
    goto :goto_0

    :cond_4
    const v0, 0x7f0301d3

    goto :goto_2

    .line 667
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_1
    .end packed-switch
.end method

.method private buildInfoItems()V
    .locals 74

    .prologue
    .line 1750
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->infoItems:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->clear()V

    .line 1751
    const/16 v30, 0x0

    .line 1752
    .local v30, "expandItem":Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;
    move-object/from16 v0, p0

    iget v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    if-lez v4, :cond_d

    move-object/from16 v0, p0

    iget v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->layoutType:I

    if-nez v4, :cond_d

    .line 1753
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->infoItems:Ljava/util/ArrayList;

    new-instance v5, Lcom/vkontakte/android/fragments/ProfileFragment$13;

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->headerView:Landroid/view/View;

    move-object/from16 v0, p0

    invoke-direct {v5, v0, v8}, Lcom/vkontakte/android/fragments/ProfileFragment$13;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;Landroid/view/View;)V

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1769
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    invoke-virtual {v4}, Lcom/vkontakte/android/api/ExtendedUserProfile;->isDeactivated()Z

    move-result v4

    if-eqz v4, :cond_9

    .line 1770
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->headerView:Landroid/view/View;

    const v5, 0x7f1004ee

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/vk/imageloader/view/VKImageView;

    const v5, 0x7f020114

    invoke-virtual {v4, v5}, Lcom/vk/imageloader/view/VKImageView;->setPlaceholderImage(I)V

    .line 1771
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->headerView:Landroid/view/View;

    const v5, 0x7f1004ef

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 1772
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->headerView:Landroid/view/View;

    const v5, 0x7f1004f0

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 1885
    :cond_0
    :goto_0
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    invoke-virtual {v4}, Lcom/vkontakte/android/api/ExtendedUserProfile;->isDeactivated()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 1886
    const/16 v43, 0x0

    .line 1887
    .local v43, "msg":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->deactivated:Lcom/vkontakte/android/api/ExtendedUserProfile$Deactivated;

    sget-object v5, Lcom/vkontakte/android/api/ExtendedUserProfile$Deactivated;->Deleted:Lcom/vkontakte/android/api/ExtendedUserProfile$Deactivated;

    if-ne v4, v5, :cond_16

    .line 1888
    move-object/from16 v0, p0

    iget v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    if-lez v4, :cond_15

    const v4, 0x7f08055f

    :goto_1
    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/vkontakte/android/fragments/ProfileFragment;->getString(I)Ljava/lang/String;

    move-result-object v43

    .line 1892
    :cond_1
    :goto_2
    invoke-static/range {v43 .. v43}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_2

    .line 1893
    move-object/from16 v0, p0

    move-object/from16 v1, v43

    invoke-direct {v0, v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->createTextItem(Ljava/lang/CharSequence;)Landroid/view/View;

    move-result-object v68

    .line 1894
    .local v68, "view":Landroid/view/View;
    new-instance v69, Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;

    move-object/from16 v0, v69

    move-object/from16 v1, p0

    move-object/from16 v2, v68

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;Landroid/view/View;)V

    .line 1895
    .local v69, "vii":Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;
    const/4 v4, 0x4

    move-object/from16 v0, v69

    iput v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;->backgroundType:I

    .line 1896
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->infoItems:Ljava/util/ArrayList;

    move-object/from16 v0, v69

    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1900
    .end local v43    # "msg":Ljava/lang/String;
    .end local v68    # "view":Landroid/view/View;
    .end local v69    # "vii":Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;
    :cond_2
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->ban:Lcom/vkontakte/android/api/ExtendedUserProfile$BanInfo;

    if-eqz v4, :cond_3

    move-object/from16 v0, p0

    iget v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    if-lez v4, :cond_3

    .line 1901
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->profile:Lcom/vkontakte/android/UserProfile;

    iget-boolean v4, v4, Lcom/vkontakte/android/UserProfile;->f:Z

    if-eqz v4, :cond_18

    const v4, 0x7f080115

    :goto_3
    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v8, 0x0

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v9, v9, Lcom/vkontakte/android/api/ExtendedUserProfile;->profile:Lcom/vkontakte/android/UserProfile;

    iget-object v9, v9, Lcom/vkontakte/android/UserProfile;->firstName:Ljava/lang/String;

    aput-object v9, v5, v8

    move-object/from16 v0, p0

    invoke-virtual {v0, v4, v5}, Lcom/vkontakte/android/fragments/ProfileFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/vkontakte/android/fragments/ProfileFragment;->createTextItem(Ljava/lang/CharSequence;)Landroid/view/View;

    move-result-object v68

    .line 1902
    .restart local v68    # "view":Landroid/view/View;
    new-instance v69, Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;

    move-object/from16 v0, v69

    move-object/from16 v1, p0

    move-object/from16 v2, v68

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;Landroid/view/View;)V

    .line 1903
    .restart local v69    # "vii":Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;
    const/4 v4, 0x4

    move-object/from16 v0, v69

    iput v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;->backgroundType:I

    .line 1904
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->infoItems:Ljava/util/ArrayList;

    move-object/from16 v0, v69

    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1907
    .end local v68    # "view":Landroid/view/View;
    .end local v69    # "vii":Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;
    :cond_3
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->activity:Ljava/lang/String;

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_4

    move-object/from16 v0, p0

    iget v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    if-gtz v4, :cond_5

    :cond_4
    move-object/from16 v0, p0

    iget v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v5

    invoke-virtual {v5}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v5

    if-eq v4, v5, :cond_5

    move-object/from16 v0, p0

    iget v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    if-gez v4, :cond_7

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->adminLevel:I

    const/4 v5, 0x2

    if-lt v4, v5, :cond_7

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    invoke-virtual {v4}, Lcom/vkontakte/android/api/ExtendedUserProfile;->isDeactivated()Z

    move-result v4

    if-nez v4, :cond_7

    .line 1908
    :cond_5
    new-instance v62, Lcom/vkontakte/android/fragments/ProfileFragment$OverviewInfoItem;

    const v5, 0x7f020262

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->activity:Ljava/lang/String;

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_19

    const v4, 0x7f080126

    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/vkontakte/android/fragments/ProfileFragment;->getString(I)Ljava/lang/String;

    move-result-object v4

    :goto_4
    const/4 v8, 0x0

    move-object/from16 v0, v62

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v5, v4, v8}, Lcom/vkontakte/android/fragments/ProfileFragment$OverviewInfoItem;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;ILjava/lang/CharSequence;Ljava/lang/Runnable;)V

    .line 1909
    .local v62, "status":Lcom/vkontakte/android/fragments/ProfileFragment$OverviewInfoItem;
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->audioStatus:Lcom/vkontakte/android/audio/MusicTrack;

    if-eqz v4, :cond_1a

    .line 1910
    invoke-static/range {p0 .. p0}, Lcom/vkontakte/android/fragments/ProfileFragment$$Lambda$13;->lambdaFactory$(Lcom/vkontakte/android/fragments/ProfileFragment;)Ljava/lang/Runnable;

    move-result-object v4

    move-object/from16 v0, v62

    iput-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment$OverviewInfoItem;->onClick:Ljava/lang/Runnable;

    .line 1914
    :cond_6
    :goto_5
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->infoItems:Ljava/util/ArrayList;

    move-object/from16 v0, v62

    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1917
    .end local v62    # "status":Lcom/vkontakte/android/fragments/ProfileFragment$OverviewInfoItem;
    :cond_7
    move-object/from16 v0, p0

    iget v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    if-lez v4, :cond_27

    .line 1918
    const-string/jumbo v4, "friends"

    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/vkontakte/android/fragments/ProfileFragment;->hasDisplayField(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1e

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->counters:Ljava/util/HashMap;

    const-string/jumbo v5, "friends"

    invoke-virtual {v4, v5}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1e

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    const-string/jumbo v5, "friends"

    invoke-virtual {v4, v5}, Lcom/vkontakte/android/api/ExtendedUserProfile;->getCounter(Ljava/lang/String;)I

    move-result v4

    if-lez v4, :cond_1e

    .line 1919
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    const-string/jumbo v5, "friends"

    invoke-virtual {v4, v5}, Lcom/vkontakte/android/api/ExtendedUserProfile;->getCounter(Ljava/lang/String;)I

    move-result v45

    .line 1920
    .local v45, "numFriends":I
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->counters:Ljava/util/HashMap;

    const-string/jumbo v5, "mutual_friends"

    invoke-virtual {v4, v5}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1c

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    const-string/jumbo v5, "mutual_friends"

    invoke-virtual {v4, v5}, Lcom/vkontakte/android/api/ExtendedUserProfile;->getCounter(Ljava/lang/String;)I

    move-result v46

    .line 1921
    .local v46, "numMutual":I
    :goto_6
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f0d0051

    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    invoke-static/range {v45 .. v45}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v8, v9

    move/from16 v0, v45

    invoke-virtual {v4, v5, v0, v8}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v63

    .line 1922
    .local v63, "text":Ljava/lang/String;
    if-lez v46, :cond_8

    .line 1923
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v63

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, " \u2022 "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v8, 0x7f0d0055

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    invoke-static/range {v46 .. v46}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v9, v10

    move/from16 v0, v46

    invoke-virtual {v5, v8, v0, v9}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v63

    .line 1925
    :cond_8
    new-instance v32, Lcom/vkontakte/android/fragments/ProfileFragment$OverviewInfoItem;

    const v4, 0x7f02025a

    invoke-static/range {v63 .. v63}, Lcom/vkontakte/android/TextFormatter;->processString(Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object v5

    invoke-static/range {p0 .. p0}, Lcom/vkontakte/android/fragments/ProfileFragment$$Lambda$15;->lambdaFactory$(Lcom/vkontakte/android/fragments/ProfileFragment;)Ljava/lang/Runnable;

    move-result-object v8

    move-object/from16 v0, v32

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v4, v5, v8}, Lcom/vkontakte/android/fragments/ProfileFragment$OverviewInfoItem;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;ILjava/lang/CharSequence;Ljava/lang/Runnable;)V

    .line 1927
    .local v32, "friendsItem":Lcom/vkontakte/android/fragments/ProfileFragment$OverviewInfoItem;
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->friends:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-lez v4, :cond_1d

    .line 1928
    const/16 v36, 0x0

    .local v36, "i":I
    :goto_7
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->friends:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    const/4 v5, 0x3

    invoke-static {v4, v5}, Ljava/lang/Math;->min(II)I

    move-result v4

    move/from16 v0, v36

    if-ge v0, v4, :cond_1d

    .line 1929
    move-object/from16 v0, v32

    iget-object v5, v0, Lcom/vkontakte/android/fragments/ProfileFragment$OverviewInfoItem;->photos:Ljava/util/ArrayList;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->friends:Ljava/util/ArrayList;

    move/from16 v0, v36

    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vkontakte/android/UserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1928
    add-int/lit8 v36, v36, 0x1

    goto :goto_7

    .line 1773
    .end local v32    # "friendsItem":Lcom/vkontakte/android/fragments/ProfileFragment$OverviewInfoItem;
    .end local v36    # "i":I
    .end local v45    # "numFriends":I
    .end local v46    # "numMutual":I
    .end local v63    # "text":Ljava/lang/String;
    :cond_9
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-boolean v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->hasPhoto:Z

    if-nez v4, :cond_b

    .line 1774
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->headerView:Landroid/view/View;

    const v5, 0x7f1004ee

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/vk/imageloader/view/VKImageView;

    move-object/from16 v0, p0

    iget v5, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    if-lez v5, :cond_a

    const v5, 0x7f02031f

    :goto_8
    invoke-virtual {v4, v5}, Lcom/vk/imageloader/view/VKImageView;->setPlaceholderImage(I)V

    .line 1775
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->headerView:Landroid/view/View;

    const v5, 0x7f1004ef

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 1776
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->headerView:Landroid/view/View;

    const v5, 0x7f1004f0

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_0

    .line 1774
    :cond_a
    const v5, 0x7f02031d

    goto :goto_8

    .line 1778
    :cond_b
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->headerView:Landroid/view/View;

    const v5, 0x7f1004ee

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/vk/imageloader/view/VKImageView;

    move-object/from16 v0, p0

    iget v5, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    if-lez v5, :cond_c

    const v5, 0x7f02031f

    :goto_9
    invoke-virtual {v4, v5}, Lcom/vk/imageloader/view/VKImageView;->setPlaceholderImage(I)V

    .line 1779
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->headerView:Landroid/view/View;

    const v5, 0x7f1004ef

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    const v5, 0x7f0203b8

    invoke-virtual {v4, v5}, Landroid/view/View;->setBackgroundResource(I)V

    .line 1780
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->headerView:Landroid/view/View;

    const v5, 0x7f1004f0

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    const v5, 0x7f0203b3

    invoke-virtual {v4, v5}, Landroid/view/View;->setBackgroundResource(I)V

    goto/16 :goto_0

    .line 1778
    :cond_c
    const v5, 0x7f02031d

    goto :goto_9

    .line 1783
    :cond_d
    new-instance v40, Lcom/vkontakte/android/fragments/ProfileFragment$14;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->headerView:Landroid/view/View;

    move-object/from16 v0, v40

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v4}, Lcom/vkontakte/android/fragments/ProfileFragment$14;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;Landroid/view/View;)V

    .line 1824
    .local v40, "item":Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    invoke-virtual {v4}, Lcom/vkontakte/android/api/ExtendedUserProfile;->isDeactivated()Z

    move-result v4

    if-eqz v4, :cond_e

    .line 1825
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->headerView:Landroid/view/View;

    const v5, 0x7f1004ee

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/vk/imageloader/view/VKImageView;

    const v5, 0x7f020115

    invoke-virtual {v4, v5}, Lcom/vk/imageloader/view/VKImageView;->setPlaceholderImage(I)V

    .line 1829
    :goto_a
    move-object/from16 v0, p0

    iget v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->layoutType:I

    const/4 v5, 0x1

    if-ne v4, v5, :cond_10

    const/4 v4, 0x1

    :goto_b
    move-object/from16 v0, v40

    iput-boolean v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;->dividerAfter:Z

    .line 1830
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->infoItems:Ljava/util/ArrayList;

    move-object/from16 v0, v40

    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1832
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->invitedBy:Lcom/vkontakte/android/UserProfile;

    if-eqz v4, :cond_0

    .line 1833
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v4

    const v5, 0x7f0301d0

    const/4 v8, 0x0

    invoke-static {v4, v5, v8}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v39

    .line 1834
    .local v39, "inviterView":Landroid/view/View;
    const v4, 0x7f1001c3

    move-object/from16 v0, v39

    invoke-virtual {v0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget v5, v5, Lcom/vkontakte/android/api/ExtendedUserProfile;->groupType:I

    if-nez v5, :cond_12

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v5, v5, Lcom/vkontakte/android/api/ExtendedUserProfile;->invitedBy:Lcom/vkontakte/android/UserProfile;

    iget-boolean v5, v5, Lcom/vkontakte/android/UserProfile;->f:Z

    if-eqz v5, :cond_11

    const v5, 0x7f0802d4

    :goto_c
    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v11, "[id"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v11, v11, Lcom/vkontakte/android/api/ExtendedUserProfile;->invitedBy:Lcom/vkontakte/android/UserProfile;

    iget v11, v11, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string/jumbo v11, "|"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v11, v11, Lcom/vkontakte/android/api/ExtendedUserProfile;->invitedBy:Lcom/vkontakte/android/UserProfile;

    iget-object v11, v11, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string/jumbo v11, "]"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    aput-object v10, v8, v9

    move-object/from16 v0, p0

    invoke-virtual {v0, v5, v8}, Lcom/vkontakte/android/fragments/ProfileFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    const/4 v8, 0x2

    invoke-static {v5, v8}, Lcom/vkontakte/android/LinkParser;->parseLinks(Ljava/lang/CharSequence;I)Ljava/lang/CharSequence;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1840
    const v4, 0x7f1004c5

    move-object/from16 v0, v39

    invoke-virtual {v0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget v5, v5, Lcom/vkontakte/android/api/ExtendedUserProfile;->groupType:I

    if-nez v5, :cond_14

    const v5, 0x7f0802cb

    :goto_d
    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(I)V

    .line 1841
    const v4, 0x7f1004c5

    move-object/from16 v0, v39

    invoke-virtual {v0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    invoke-static/range {p0 .. p0}, Lcom/vkontakte/android/fragments/ProfileFragment$$Lambda$11;->lambdaFactory$(Lcom/vkontakte/android/fragments/ProfileFragment;)Landroid/view/View$OnClickListener;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1855
    const v4, 0x7f1004c6

    move-object/from16 v0, v39

    invoke-virtual {v0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    invoke-static/range {p0 .. p0}, Lcom/vkontakte/android/fragments/ProfileFragment$$Lambda$12;->lambdaFactory$(Lcom/vkontakte/android/fragments/ProfileFragment;)Landroid/view/View$OnClickListener;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1856
    new-instance v38, Lcom/vkontakte/android/fragments/ProfileFragment$15;

    move-object/from16 v0, v38

    move-object/from16 v1, p0

    move-object/from16 v2, v39

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/fragments/ProfileFragment$15;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;Landroid/view/View;)V

    .line 1879
    .local v38, "inv":Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->infoItems:Ljava/util/ArrayList;

    move-object/from16 v0, v38

    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1880
    const/4 v4, 0x0

    move-object/from16 v0, v40

    iput-boolean v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;->dividerAfter:Z

    .line 1881
    const/4 v4, 0x1

    move-object/from16 v0, v38

    iput-boolean v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;->dividerAfter:Z

    goto/16 :goto_0

    .line 1827
    .end local v38    # "inv":Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;
    .end local v39    # "inviterView":Landroid/view/View;
    :cond_e
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->headerView:Landroid/view/View;

    const v5, 0x7f1004ee

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/vk/imageloader/view/VKImageView;

    move-object/from16 v0, p0

    iget v5, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    if-lez v5, :cond_f

    const v5, 0x7f020320

    :goto_e
    invoke-virtual {v4, v5}, Lcom/vk/imageloader/view/VKImageView;->setPlaceholderImage(I)V

    goto/16 :goto_a

    :cond_f
    const v5, 0x7f02031e

    goto :goto_e

    .line 1829
    :cond_10
    const/4 v4, 0x0

    goto/16 :goto_b

    .line 1834
    .restart local v39    # "inviterView":Landroid/view/View;
    :cond_11
    const v5, 0x7f0802d5

    goto/16 :goto_c

    :cond_12
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v5, v5, Lcom/vkontakte/android/api/ExtendedUserProfile;->invitedBy:Lcom/vkontakte/android/UserProfile;

    iget-boolean v5, v5, Lcom/vkontakte/android/UserProfile;->f:Z

    if-eqz v5, :cond_13

    const v5, 0x7f0802d2

    goto/16 :goto_c

    :cond_13
    const v5, 0x7f0802d3

    goto/16 :goto_c

    .line 1840
    :cond_14
    const v5, 0x7f0802ce

    goto/16 :goto_d

    .line 1888
    .end local v39    # "inviterView":Landroid/view/View;
    .end local v40    # "item":Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;
    .restart local v43    # "msg":Ljava/lang/String;
    :cond_15
    const v4, 0x7f0802c8

    goto/16 :goto_1

    .line 1889
    :cond_16
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->deactivated:Lcom/vkontakte/android/api/ExtendedUserProfile$Deactivated;

    sget-object v5, Lcom/vkontakte/android/api/ExtendedUserProfile$Deactivated;->Banned:Lcom/vkontakte/android/api/ExtendedUserProfile$Deactivated;

    if-ne v4, v5, :cond_1

    .line 1890
    move-object/from16 v0, p0

    iget v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    if-lez v4, :cond_17

    const v4, 0x7f08055e

    :goto_f
    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/vkontakte/android/fragments/ProfileFragment;->getString(I)Ljava/lang/String;

    move-result-object v43

    goto/16 :goto_2

    :cond_17
    const v4, 0x7f0802c7

    goto :goto_f

    .line 1901
    .end local v43    # "msg":Ljava/lang/String;
    :cond_18
    const v4, 0x7f080117

    goto/16 :goto_3

    .line 1908
    :cond_19
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-static {v4}, Lcom/vk/emoji/Emoji;->instance(Landroid/content/Context;)Lcom/vk/emoji/Emoji;

    move-result-object v4

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v8, v8, Lcom/vkontakte/android/api/ExtendedUserProfile;->activity:Ljava/lang/String;

    invoke-virtual {v4, v8}, Lcom/vk/emoji/Emoji;->replaceEmoji(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v4

    goto/16 :goto_4

    .line 1911
    .restart local v62    # "status":Lcom/vkontakte/android/fragments/ProfileFragment$OverviewInfoItem;
    :cond_1a
    move-object/from16 v0, p0

    iget v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v5

    invoke-virtual {v5}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v5

    if-eq v4, v5, :cond_1b

    move-object/from16 v0, p0

    iget v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    if-gez v4, :cond_6

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->adminLevel:I

    const/4 v5, 0x2

    if-lt v4, v5, :cond_6

    .line 1912
    :cond_1b
    invoke-static/range {p0 .. p0}, Lcom/vkontakte/android/fragments/ProfileFragment$$Lambda$14;->lambdaFactory$(Lcom/vkontakte/android/fragments/ProfileFragment;)Ljava/lang/Runnable;

    move-result-object v4

    move-object/from16 v0, v62

    iput-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment$OverviewInfoItem;->onClick:Ljava/lang/Runnable;

    goto/16 :goto_5

    .line 1920
    .end local v62    # "status":Lcom/vkontakte/android/fragments/ProfileFragment$OverviewInfoItem;
    .restart local v45    # "numFriends":I
    :cond_1c
    const/16 v46, 0x0

    goto/16 :goto_6

    .line 1932
    .restart local v32    # "friendsItem":Lcom/vkontakte/android/fragments/ProfileFragment$OverviewInfoItem;
    .restart local v46    # "numMutual":I
    .restart local v63    # "text":Ljava/lang/String;
    :cond_1d
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->infoItems:Ljava/util/ArrayList;

    move-object/from16 v0, v32

    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1935
    .end local v32    # "friendsItem":Lcom/vkontakte/android/fragments/ProfileFragment$OverviewInfoItem;
    .end local v45    # "numFriends":I
    .end local v46    # "numMutual":I
    .end local v63    # "text":Ljava/lang/String;
    :cond_1e
    const-string/jumbo v4, "followers"

    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/vkontakte/android/fragments/ProfileFragment;->hasDisplayField(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1f

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->counters:Ljava/util/HashMap;

    const-string/jumbo v5, "followers"

    invoke-virtual {v4, v5}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1f

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    const-string/jumbo v5, "followers"

    invoke-virtual {v4, v5}, Lcom/vkontakte/android/api/ExtendedUserProfile;->getCounter(Ljava/lang/String;)I

    move-result v4

    if-lez v4, :cond_1f

    .line 1936
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    const-string/jumbo v5, "followers"

    invoke-virtual {v4, v5}, Lcom/vkontakte/android/api/ExtendedUserProfile;->getCounter(Ljava/lang/String;)I

    move-result v44

    .line 1937
    .local v44, "numFollowers":I
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->infoItems:Ljava/util/ArrayList;

    new-instance v5, Lcom/vkontakte/android/fragments/ProfileFragment$OverviewInfoItem;

    const v8, 0x7f020259

    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    const v10, 0x7f0d0050

    const/4 v11, 0x1

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v13, 0x0

    invoke-static/range {v44 .. v44}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v11, v13

    move/from16 v0, v44

    invoke-virtual {v9, v10, v0, v11}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Lcom/vkontakte/android/TextFormatter;->processString(Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object v9

    invoke-static/range {p0 .. p0}, Lcom/vkontakte/android/fragments/ProfileFragment$$Lambda$16;->lambdaFactory$(Lcom/vkontakte/android/fragments/ProfileFragment;)Ljava/lang/Runnable;

    move-result-object v10

    move-object/from16 v0, p0

    invoke-direct {v5, v0, v8, v9, v10}, Lcom/vkontakte/android/fragments/ProfileFragment$OverviewInfoItem;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;ILjava/lang/CharSequence;Ljava/lang/Runnable;)V

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1946
    .end local v44    # "numFollowers":I
    :cond_1f
    const-string/jumbo v4, "city"

    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/vkontakte/android/fragments/ProfileFragment;->hasDisplayField(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_20

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->city:Ljava/lang/String;

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_20

    .line 1947
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->infoItems:Ljava/util/ArrayList;

    new-instance v5, Lcom/vkontakte/android/fragments/ProfileFragment$OverviewInfoItem;

    const v8, 0x7f02025b

    const v9, 0x7f080567

    const/4 v10, 0x1

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v13, v13, Lcom/vkontakte/android/api/ExtendedUserProfile;->city:Ljava/lang/String;

    aput-object v13, v10, v11

    move-object/from16 v0, p0

    invoke-virtual {v0, v9, v10}, Lcom/vkontakte/android/fragments/ProfileFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    const/4 v10, 0x0

    move-object/from16 v0, p0

    invoke-direct {v5, v0, v8, v9, v10}, Lcom/vkontakte/android/fragments/ProfileFragment$OverviewInfoItem;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;ILjava/lang/CharSequence;Ljava/lang/Runnable;)V

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1950
    :cond_20
    const-string/jumbo v4, "work"

    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/vkontakte/android/fragments/ProfileFragment;->hasDisplayField(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_25

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->career:Ljava/util/ArrayList;

    if-eqz v4, :cond_25

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->career:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-lez v4, :cond_25

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->career:Ljava/util/ArrayList;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v5, v5, Lcom/vkontakte/android/api/ExtendedUserProfile;->career:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vkontakte/android/api/ExtendedUserProfile$Employer;

    iget v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile$Employer;->yearTo:I

    if-nez v4, :cond_25

    .line 1951
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->career:Ljava/util/ArrayList;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v5, v5, Lcom/vkontakte/android/api/ExtendedUserProfile;->career:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v28

    check-cast v28, Lcom/vkontakte/android/api/ExtendedUserProfile$Employer;

    .line 1952
    .local v28, "e":Lcom/vkontakte/android/api/ExtendedUserProfile$Employer;
    new-instance v25, Lcom/vkontakte/android/fragments/ProfileFragment$OverviewInfoItem;

    const v5, 0x7f020268

    const v8, 0x7f080585

    const/4 v4, 0x1

    new-array v9, v4, [Ljava/lang/Object;

    const/4 v10, 0x0

    move-object/from16 v0, v28

    iget-object v4, v0, Lcom/vkontakte/android/api/ExtendedUserProfile$Employer;->group:Lcom/vkontakte/android/api/Group;

    if-eqz v4, :cond_24

    move-object/from16 v0, v28

    iget-object v4, v0, Lcom/vkontakte/android/api/ExtendedUserProfile$Employer;->group:Lcom/vkontakte/android/api/Group;

    iget-object v4, v4, Lcom/vkontakte/android/api/Group;->name:Ljava/lang/String;

    :goto_10
    aput-object v4, v9, v10

    move-object/from16 v0, p0

    invoke-virtual {v0, v8, v9}, Lcom/vkontakte/android/fragments/ProfileFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    const/4 v8, 0x0

    move-object/from16 v0, v25

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v5, v4, v8}, Lcom/vkontakte/android/fragments/ProfileFragment$OverviewInfoItem;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;ILjava/lang/CharSequence;Ljava/lang/Runnable;)V

    .line 1953
    .local v25, "careerItem":Lcom/vkontakte/android/fragments/ProfileFragment$OverviewInfoItem;
    move-object/from16 v0, v28

    iget-object v4, v0, Lcom/vkontakte/android/api/ExtendedUserProfile$Employer;->group:Lcom/vkontakte/android/api/Group;

    if-eqz v4, :cond_21

    .line 1954
    move-object/from16 v0, v25

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment$OverviewInfoItem;->photos:Ljava/util/ArrayList;

    move-object/from16 v0, v28

    iget-object v5, v0, Lcom/vkontakte/android/api/ExtendedUserProfile$Employer;->group:Lcom/vkontakte/android/api/Group;

    iget-object v5, v5, Lcom/vkontakte/android/api/Group;->photo:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1955
    move-object/from16 v0, p0

    move-object/from16 v1, v28

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/ProfileFragment$$Lambda$17;->lambdaFactory$(Lcom/vkontakte/android/fragments/ProfileFragment;Lcom/vkontakte/android/api/ExtendedUserProfile$Employer;)Ljava/lang/Runnable;

    move-result-object v4

    move-object/from16 v0, v25

    iput-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment$OverviewInfoItem;->onClick:Ljava/lang/Runnable;

    .line 1961
    :cond_21
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->infoItems:Ljava/util/ArrayList;

    move-object/from16 v0, v25

    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1971
    .end local v25    # "careerItem":Lcom/vkontakte/android/fragments/ProfileFragment$OverviewInfoItem;
    .end local v28    # "e":Lcom/vkontakte/android/api/ExtendedUserProfile$Employer;
    :cond_22
    :goto_11
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v4

    const v5, 0x7f0301dc

    const/4 v8, 0x0

    invoke-static {v4, v5, v8}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v29

    .line 1972
    .local v29, "expandInfoView":Landroid/view/View;
    const v4, 0x7f1001c3

    move-object/from16 v0, v29

    invoke-virtual {v0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    invoke-static/range {p0 .. p0}, Lcom/vkontakte/android/fragments/ProfileFragment$$Lambda$18;->lambdaFactory$(Lcom/vkontakte/android/fragments/ProfileFragment;)Landroid/view/View$OnClickListener;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1974
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    invoke-virtual {v4}, Lcom/vkontakte/android/api/ExtendedUserProfile;->isDeactivated()Z

    move-result v4

    if-nez v4, :cond_23

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->ban:Lcom/vkontakte/android/api/ExtendedUserProfile$BanInfo;

    if-nez v4, :cond_23

    .line 1975
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->infoItems:Ljava/util/ArrayList;

    new-instance v30, Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;

    .end local v30    # "expandItem":Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;
    move-object/from16 v0, v30

    move-object/from16 v1, p0

    move-object/from16 v2, v29

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;Landroid/view/View;)V

    .restart local v30    # "expandItem":Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;
    move-object/from16 v0, v30

    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2061
    :cond_23
    :goto_12
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->infoItems:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_13
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_33

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v40

    check-cast v40, Lcom/vkontakte/android/fragments/ProfileFragment$InfoItem;

    .line 2062
    .local v40, "item":Lcom/vkontakte/android/fragments/ProfileFragment$InfoItem;
    const/4 v5, 0x1

    move-object/from16 v0, v40

    iput v5, v0, Lcom/vkontakte/android/fragments/ProfileFragment$InfoItem;->backgroundType:I

    goto :goto_13

    .line 1952
    .end local v29    # "expandInfoView":Landroid/view/View;
    .end local v40    # "item":Lcom/vkontakte/android/fragments/ProfileFragment$InfoItem;
    .restart local v28    # "e":Lcom/vkontakte/android/api/ExtendedUserProfile$Employer;
    :cond_24
    move-object/from16 v0, v28

    iget-object v4, v0, Lcom/vkontakte/android/api/ExtendedUserProfile$Employer;->title:Ljava/lang/String;

    goto/16 :goto_10

    .line 1962
    .end local v28    # "e":Lcom/vkontakte/android/api/ExtendedUserProfile$Employer;
    :cond_25
    const-string/jumbo v4, "education"

    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/vkontakte/android/fragments/ProfileFragment;->hasDisplayField(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_22

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->universities:Ljava/util/ArrayList;

    if-eqz v4, :cond_22

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->universities:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-lez v4, :cond_22

    .line 1963
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->universities:Ljava/util/ArrayList;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v5, v5, Lcom/vkontakte/android/api/ExtendedUserProfile;->universities:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v66

    check-cast v66, Lcom/vkontakte/android/api/ExtendedUserProfile$University;

    .line 1964
    .local v66, "u":Lcom/vkontakte/android/api/ExtendedUserProfile$University;
    move-object/from16 v0, v66

    iget-object v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile$University;->name:Ljava/lang/String;

    move-object/from16 v63, v0

    .line 1965
    .restart local v63    # "text":Ljava/lang/String;
    move-object/from16 v0, v66

    iget v4, v0, Lcom/vkontakte/android/api/ExtendedUserProfile$University;->graduation:I

    if-lez v4, :cond_26

    .line 1966
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v63

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, " \'%02d"

    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    move-object/from16 v0, v66

    iget v10, v0, Lcom/vkontakte/android/api/ExtendedUserProfile$University;->graduation:I

    rem-int/lit8 v10, v10, 0x64

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-static {v5, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v63

    .line 1968
    :cond_26
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->infoItems:Ljava/util/ArrayList;

    new-instance v5, Lcom/vkontakte/android/fragments/ProfileFragment$OverviewInfoItem;

    const v8, 0x7f020263

    const/4 v9, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v63

    invoke-direct {v5, v0, v8, v1, v9}, Lcom/vkontakte/android/fragments/ProfileFragment$OverviewInfoItem;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;ILjava/lang/CharSequence;Ljava/lang/Runnable;)V

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_11

    .line 1981
    .end local v63    # "text":Ljava/lang/String;
    .end local v66    # "u":Lcom/vkontakte/android/api/ExtendedUserProfile$University;
    :cond_27
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->groupType:I

    const/4 v5, 0x1

    if-ne v4, v5, :cond_2a

    .line 1982
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->eventStartTime:I

    if-lez v4, :cond_28

    .line 1984
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->eventStartTime:I

    invoke-static {}, Lcom/vkontakte/android/TimeUtils;->getCurrentTime()I

    move-result v5

    if-le v4, v5, :cond_2c

    .line 1985
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->eventStartTime:I

    invoke-static {v4}, Lcom/vkontakte/android/TimeUtils;->langDate(I)Ljava/lang/String;

    move-result-object v63

    .line 1989
    .restart local v63    # "text":Ljava/lang/String;
    :goto_14
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->infoItems:Ljava/util/ArrayList;

    new-instance v5, Lcom/vkontakte/android/fragments/ProfileFragment$OverviewInfoItem;

    const v8, 0x7f0201aa

    const/4 v9, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v63

    invoke-direct {v5, v0, v8, v1, v9}, Lcom/vkontakte/android/fragments/ProfileFragment$OverviewInfoItem;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;ILjava/lang/CharSequence;Ljava/lang/Runnable;)V

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1991
    .end local v63    # "text":Ljava/lang/String;
    :cond_28
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->city:Ljava/lang/String;

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_2a

    .line 1992
    const/16 v48, 0x0

    .line 1993
    .local v48, "onclick":Ljava/lang/Runnable;
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-wide v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->lat:D

    const-wide v8, -0x3f3e6c0000000000L    # -9000.0

    cmpl-double v4, v4, v8

    if-eqz v4, :cond_29

    .line 1994
    invoke-static/range {p0 .. p0}, Lcom/vkontakte/android/fragments/ProfileFragment$$Lambda$19;->lambdaFactory$(Lcom/vkontakte/android/fragments/ProfileFragment;)Ljava/lang/Runnable;

    move-result-object v48

    .line 1996
    :cond_29
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->infoItems:Ljava/util/ArrayList;

    new-instance v5, Lcom/vkontakte/android/fragments/ProfileFragment$OverviewInfoItem;

    const v8, 0x7f0201a9

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v9, v9, Lcom/vkontakte/android/api/ExtendedUserProfile;->city:Ljava/lang/String;

    move-object/from16 v0, p0

    move-object/from16 v1, v48

    invoke-direct {v5, v0, v8, v9, v1}, Lcom/vkontakte/android/fragments/ProfileFragment$OverviewInfoItem;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;ILjava/lang/CharSequence;Ljava/lang/Runnable;)V

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1999
    .end local v48    # "onclick":Ljava/lang/Runnable;
    :cond_2a
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    const-string/jumbo v5, "members"

    invoke-virtual {v4, v5}, Lcom/vkontakte/android/api/ExtendedUserProfile;->getCounter(Ljava/lang/String;)I

    move-result v4

    if-lez v4, :cond_2f

    .line 2000
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    const-string/jumbo v5, "members"

    invoke-virtual {v4, v5}, Lcom/vkontakte/android/api/ExtendedUserProfile;->getCounter(Ljava/lang/String;)I

    move-result v45

    .line 2001
    .restart local v45    # "numFriends":I
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->counters:Ljava/util/HashMap;

    const-string/jumbo v5, "friends_members"

    invoke-virtual {v4, v5}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2d

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    const-string/jumbo v5, "friends_members"

    invoke-virtual {v4, v5}, Lcom/vkontakte/android/api/ExtendedUserProfile;->getCounter(Ljava/lang/String;)I

    move-result v46

    .line 2002
    .restart local v46    # "numMutual":I
    :goto_15
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f0d0054

    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    invoke-static/range {v45 .. v45}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v8, v9

    move/from16 v0, v45

    invoke-virtual {v4, v5, v0, v8}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v63

    .line 2003
    .restart local v63    # "text":Ljava/lang/String;
    if-lez v46, :cond_2b

    .line 2004
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v63

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v8, 0x7f0d0051

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    invoke-static/range {v46 .. v46}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v9, v10

    move/from16 v0, v46

    invoke-virtual {v5, v8, v0, v9}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v63

    .line 2006
    :cond_2b
    new-instance v32, Lcom/vkontakte/android/fragments/ProfileFragment$OverviewInfoItem;

    const v4, 0x7f02025a

    invoke-static/range {v63 .. v63}, Lcom/vkontakte/android/TextFormatter;->processString(Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object v5

    new-instance v8, Lcom/vkontakte/android/fragments/ProfileFragment$16;

    move-object/from16 v0, p0

    invoke-direct {v8, v0}, Lcom/vkontakte/android/fragments/ProfileFragment$16;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;)V

    move-object/from16 v0, v32

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v4, v5, v8}, Lcom/vkontakte/android/fragments/ProfileFragment$OverviewInfoItem;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;ILjava/lang/CharSequence;Ljava/lang/Runnable;)V

    .line 2017
    .restart local v32    # "friendsItem":Lcom/vkontakte/android/fragments/ProfileFragment$OverviewInfoItem;
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->friends:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-lez v4, :cond_2e

    .line 2018
    const/16 v36, 0x0

    .restart local v36    # "i":I
    :goto_16
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->friends:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    const/4 v5, 0x3

    invoke-static {v4, v5}, Ljava/lang/Math;->min(II)I

    move-result v4

    move/from16 v0, v36

    if-ge v0, v4, :cond_2e

    .line 2019
    move-object/from16 v0, v32

    iget-object v5, v0, Lcom/vkontakte/android/fragments/ProfileFragment$OverviewInfoItem;->photos:Ljava/util/ArrayList;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->friends:Ljava/util/ArrayList;

    move/from16 v0, v36

    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vkontakte/android/UserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2018
    add-int/lit8 v36, v36, 0x1

    goto :goto_16

    .line 1987
    .end local v32    # "friendsItem":Lcom/vkontakte/android/fragments/ProfileFragment$OverviewInfoItem;
    .end local v36    # "i":I
    .end local v45    # "numFriends":I
    .end local v46    # "numMutual":I
    .end local v63    # "text":Ljava/lang/String;
    :cond_2c
    const v4, 0x7f080552

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v8, 0x0

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget v9, v9, Lcom/vkontakte/android/api/ExtendedUserProfile;->eventStartTime:I

    invoke-static {v9}, Lcom/vkontakte/android/TimeUtils;->langDate(I)Ljava/lang/String;

    move-result-object v9

    aput-object v9, v5, v8

    move-object/from16 v0, p0

    invoke-virtual {v0, v4, v5}, Lcom/vkontakte/android/fragments/ProfileFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v63

    .restart local v63    # "text":Ljava/lang/String;
    goto/16 :goto_14

    .line 2001
    .end local v63    # "text":Ljava/lang/String;
    .restart local v45    # "numFriends":I
    :cond_2d
    const/16 v46, 0x0

    goto/16 :goto_15

    .line 2022
    .restart local v32    # "friendsItem":Lcom/vkontakte/android/fragments/ProfileFragment$OverviewInfoItem;
    .restart local v46    # "numMutual":I
    .restart local v63    # "text":Ljava/lang/String;
    :cond_2e
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->infoItems:Ljava/util/ArrayList;

    move-object/from16 v0, v32

    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2025
    .end local v32    # "friendsItem":Lcom/vkontakte/android/fragments/ProfileFragment$OverviewInfoItem;
    .end local v45    # "numFriends":I
    .end local v46    # "numMutual":I
    .end local v63    # "text":Ljava/lang/String;
    :cond_2f
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->about:Ljava/lang/String;

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_30

    .line 2026
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->infoItems:Ljava/util/ArrayList;

    new-instance v5, Lcom/vkontakte/android/fragments/ProfileFragment$OverviewInfoItem;

    const v8, 0x7f020252

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v9, v9, Lcom/vkontakte/android/api/ExtendedUserProfile;->about:Ljava/lang/String;

    invoke-static {v9}, Lcom/vkontakte/android/LinkParser;->stripMentions(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Lcom/vkontakte/android/Global;->replaceEmoji(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v9

    const/4 v10, 0x0

    move-object/from16 v0, p0

    invoke-direct {v5, v0, v8, v9, v10}, Lcom/vkontakte/android/fragments/ProfileFragment$OverviewInfoItem;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;ILjava/lang/CharSequence;Ljava/lang/Runnable;)V

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2029
    :cond_30
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v4

    const v5, 0x7f0301dc

    const/4 v8, 0x0

    invoke-static {v4, v5, v8}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v29

    .line 2030
    .restart local v29    # "expandInfoView":Landroid/view/View;
    const v4, 0x7f1001c3

    move-object/from16 v0, v29

    invoke-virtual {v0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    invoke-static/range {p0 .. p0}, Lcom/vkontakte/android/fragments/ProfileFragment$$Lambda$20;->lambdaFactory$(Lcom/vkontakte/android/fragments/ProfileFragment;)Landroid/view/View$OnClickListener;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 2032
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    invoke-virtual {v4}, Lcom/vkontakte/android/api/ExtendedUserProfile;->isDeactivated()Z

    move-result v4

    if-nez v4, :cond_31

    .line 2033
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->infoItems:Ljava/util/ArrayList;

    new-instance v30, Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;

    .end local v30    # "expandItem":Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;
    move-object/from16 v0, v30

    move-object/from16 v1, p0

    move-object/from16 v2, v29

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;Landroid/view/View;)V

    .restart local v30    # "expandItem":Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;
    move-object/from16 v0, v30

    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2036
    :cond_31
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->mobilePhone:Ljava/lang/String;

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_32

    .line 2037
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v4

    const v5, 0x7f0301dc

    const/4 v8, 0x0

    invoke-static {v4, v5, v8}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v73

    .line 2038
    .local v73, "wikiView":Landroid/view/View;
    const v4, 0x7f10007a

    move-object/from16 v0, v73

    invoke-virtual {v0, v4}, Landroid/view/View;->setId(I)V

    .line 2039
    const v4, 0x7f1001c3

    move-object/from16 v0, v73

    invoke-virtual {v0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v5, v5, Lcom/vkontakte/android/api/ExtendedUserProfile;->mobilePhone:Ljava/lang/String;

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 2040
    const v4, 0x7f1001c3

    move-object/from16 v0, v73

    invoke-virtual {v0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    const v5, 0x7f020267

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    invoke-virtual {v4, v5, v8, v9, v10}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 2041
    const v4, 0x7f1001c3

    move-object/from16 v0, v73

    invoke-virtual {v0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    invoke-static/range {p0 .. p0}, Lcom/vkontakte/android/fragments/ProfileFragment$$Lambda$21;->lambdaFactory$(Lcom/vkontakte/android/fragments/ProfileFragment;)Landroid/view/View$OnClickListener;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 2043
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->infoItems:Ljava/util/ArrayList;

    new-instance v5, Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;

    move-object/from16 v0, p0

    move-object/from16 v1, v73

    invoke-direct {v5, v0, v1}, Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;Landroid/view/View;)V

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2046
    .end local v73    # "wikiView":Landroid/view/View;
    :cond_32
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->website:Ljava/lang/String;

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_23

    .line 2047
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v4

    const v5, 0x7f0301dc

    const/4 v8, 0x0

    invoke-static {v4, v5, v8}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v70

    .line 2048
    .local v70, "websiteView":Landroid/view/View;
    const v4, 0x7f100078

    move-object/from16 v0, v70

    invoke-virtual {v0, v4}, Landroid/view/View;->setId(I)V

    .line 2049
    const v4, 0x7f1001c3

    move-object/from16 v0, v70

    invoke-virtual {v0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v5, v5, Lcom/vkontakte/android/api/ExtendedUserProfile;->website:Ljava/lang/String;

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 2050
    const v4, 0x7f1001c3

    move-object/from16 v0, v70

    invoke-virtual {v0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    const v5, 0x7f02025c

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    invoke-virtual {v4, v5, v8, v9, v10}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 2051
    const v4, 0x7f1001c3

    move-object/from16 v0, v70

    invoke-virtual {v0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    invoke-static/range {p0 .. p0}, Lcom/vkontakte/android/fragments/ProfileFragment$$Lambda$22;->lambdaFactory$(Lcom/vkontakte/android/fragments/ProfileFragment;)Landroid/view/View$OnClickListener;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 2058
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->infoItems:Ljava/util/ArrayList;

    new-instance v5, Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;

    move-object/from16 v0, p0

    move-object/from16 v1, v70

    invoke-direct {v5, v0, v1}, Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;Landroid/view/View;)V

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_12

    .line 2064
    .end local v70    # "websiteView":Landroid/view/View;
    :cond_33
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->infoItems:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    const/4 v5, 0x1

    if-ne v4, v5, :cond_54

    .line 2065
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->infoItems:Ljava/util/ArrayList;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vkontakte/android/fragments/ProfileFragment$InfoItem;

    const/4 v5, 0x6

    iput v5, v4, Lcom/vkontakte/android/fragments/ProfileFragment$InfoItem;->backgroundType:I

    .line 2070
    :goto_17
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->detailsItems:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->clear()V

    .line 2071
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->activity:Ljava/lang/String;

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_34

    .line 2072
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->detailsItems:Ljava/util/ArrayList;

    new-instance v5, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;

    const v8, 0x7f0806bc

    move-object/from16 v0, p0

    invoke-virtual {v0, v8}, Lcom/vkontakte/android/fragments/ProfileFragment;->getString(I)Ljava/lang/String;

    move-result-object v8

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v9, v9, Lcom/vkontakte/android/api/ExtendedUserProfile;->activity:Ljava/lang/String;

    invoke-direct {v5, v8, v9}, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2073
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->detailsItems:Ljava/util/ArrayList;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;

    const/4 v5, 0x6

    iput v5, v4, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;->bgType:I

    .line 2075
    :cond_34
    move-object/from16 v0, p0

    iget v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    if-lez v4, :cond_89

    .line 2076
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->bDay:I

    if-lez v4, :cond_35

    .line 2078
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->bYear:I

    if-lez v4, :cond_55

    .line 2079
    const-string/jumbo v4, "%d %s %d"

    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v8, 0x0

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget v9, v9, Lcom/vkontakte/android/api/ExtendedUserProfile;->bDay:I

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v5, v8

    const/4 v8, 0x1

    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    const v10, 0x7f0c0016

    invoke-virtual {v9, v10}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v9

    const/16 v10, 0xb

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget v11, v11, Lcom/vkontakte/android/api/ExtendedUserProfile;->bMonth:I

    add-int/lit8 v11, v11, -0x1

    invoke-static {v10, v11}, Ljava/lang/Math;->min(II)I

    move-result v10

    aget-object v9, v9, v10

    aput-object v9, v5, v8

    const/4 v8, 0x2

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget v9, v9, Lcom/vkontakte/android/api/ExtendedUserProfile;->bYear:I

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v5, v8

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v21

    .line 2083
    .local v21, "bd":Ljava/lang/String;
    :goto_18
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->detailsItems:Ljava/util/ArrayList;

    new-instance v5, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;

    const v8, 0x7f080542

    move-object/from16 v0, p0

    invoke-virtual {v0, v8}, Lcom/vkontakte/android/fragments/ProfileFragment;->getString(I)Ljava/lang/String;

    move-result-object v8

    move-object/from16 v0, v21

    invoke-direct {v5, v8, v0}, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2085
    .end local v21    # "bd":Ljava/lang/String;
    :cond_35
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->hometown:Ljava/lang/String;

    if-eqz v4, :cond_36

    .line 2086
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->detailsItems:Ljava/util/ArrayList;

    new-instance v5, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;

    const v8, 0x7f08055c

    move-object/from16 v0, p0

    invoke-virtual {v0, v8}, Lcom/vkontakte/android/fragments/ProfileFragment;->getString(I)Ljava/lang/String;

    move-result-object v8

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v9, v9, Lcom/vkontakte/android/api/ExtendedUserProfile;->hometown:Ljava/lang/String;

    invoke-direct {v5, v8, v9}, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2088
    :cond_36
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->relation:I

    if-lez v4, :cond_37

    .line 2089
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->relation:I

    int-to-long v4, v4

    invoke-static {v4, v5}, Lcom/vkontakte/android/Relation;->getRelationsById(J)Lcom/vkontakte/android/Relation;

    move-result-object v59

    .line 2091
    .local v59, "relation":Lcom/vkontakte/android/Relation;
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->relationPartner:I

    if-lez v4, :cond_57

    .line 2092
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getContext()Landroid/content/Context;

    move-result-object v5

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->profile:Lcom/vkontakte/android/UserProfile;

    iget-boolean v4, v4, Lcom/vkontakte/android/UserProfile;->f:Z

    if-nez v4, :cond_56

    const/4 v4, 0x1

    :goto_19
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "[id"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget v9, v9, Lcom/vkontakte/android/api/ExtendedUserProfile;->relationPartner:I

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v9, "|"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v9, v9, Lcom/vkontakte/android/api/ExtendedUserProfile;->relationPartnerName:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v9, "]"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    move-object/from16 v0, v59

    invoke-virtual {v0, v5, v4, v8}, Lcom/vkontakte/android/Relation;->getName(Landroid/content/Context;ZLjava/lang/String;)Ljava/lang/String;

    move-result-object v58

    .line 2096
    .local v58, "rel":Ljava/lang/String;
    :goto_1a
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->detailsItems:Ljava/util/ArrayList;

    new-instance v8, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;

    const v4, 0x7f08056e

    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/vkontakte/android/fragments/ProfileFragment;->getString(I)Ljava/lang/String;

    move-result-object v9

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->relationPartner:I

    if-lez v4, :cond_59

    new-instance v4, Landroid/content/Intent;

    const-string/jumbo v10, "android.intent.action.VIEW"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v13, "vkontakte://profile/"

    invoke-virtual {v11, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget v13, v13, Lcom/vkontakte/android/api/ExtendedUserProfile;->relationPartner:I

    invoke-virtual {v11, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v11

    invoke-direct {v4, v10, v11}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    :goto_1b
    move-object/from16 v0, v58

    invoke-direct {v8, v9, v0, v4}, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;-><init>(Ljava/lang/String;Ljava/lang/String;Landroid/content/Intent;)V

    invoke-virtual {v5, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2098
    .end local v58    # "rel":Ljava/lang/String;
    .end local v59    # "relation":Lcom/vkontakte/android/Relation;
    :cond_37
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->langs:Ljava/lang/String;

    if-eqz v4, :cond_38

    .line 2099
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->detailsItems:Ljava/util/ArrayList;

    new-instance v5, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;

    const v8, 0x7f08049b

    move-object/from16 v0, p0

    invoke-virtual {v0, v8}, Lcom/vkontakte/android/fragments/ProfileFragment;->getString(I)Ljava/lang/String;

    move-result-object v8

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v9, v9, Lcom/vkontakte/android/api/ExtendedUserProfile;->langs:Ljava/lang/String;

    invoke-direct {v5, v8, v9}, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2101
    :cond_38
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->relativesGrandparent:[Lcom/vkontakte/android/UserProfile;

    invoke-static {v4}, Lcom/vkontakte/android/utils/Utils;->isEmptyArray([Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_39

    .line 2102
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->detailsItems:Ljava/util/ArrayList;

    new-instance v8, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->relativesGrandparent:[Lcom/vkontakte/android/UserProfile;

    array-length v4, v4

    const/4 v9, 0x1

    if-le v4, v9, :cond_5a

    const v4, 0x7f08055b

    :goto_1c
    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/vkontakte/android/fragments/ProfileFragment;->getString(I)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v9, v9, Lcom/vkontakte/android/api/ExtendedUserProfile;->relativesGrandparent:[Lcom/vkontakte/android/UserProfile;

    .line 2104
    move-object/from16 v0, p0

    invoke-direct {v0, v9}, Lcom/vkontakte/android/fragments/ProfileFragment;->generateRelativesString([Lcom/vkontakte/android/UserProfile;)Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v4, v9}, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 2102
    invoke-virtual {v5, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2107
    :cond_39
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->relativesParents:[Lcom/vkontakte/android/UserProfile;

    invoke-static {v4}, Lcom/vkontakte/android/utils/Utils;->isEmptyArray([Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_3a

    .line 2108
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->detailsItems:Ljava/util/ArrayList;

    new-instance v8, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->relativesParents:[Lcom/vkontakte/android/UserProfile;

    array-length v4, v4

    const/4 v9, 0x1

    if-le v4, v9, :cond_5c

    const v4, 0x7f08056c

    :goto_1d
    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/vkontakte/android/fragments/ProfileFragment;->getString(I)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v9, v9, Lcom/vkontakte/android/api/ExtendedUserProfile;->relativesParents:[Lcom/vkontakte/android/UserProfile;

    .line 2110
    move-object/from16 v0, p0

    invoke-direct {v0, v9}, Lcom/vkontakte/android/fragments/ProfileFragment;->generateRelativesString([Lcom/vkontakte/android/UserProfile;)Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v4, v9}, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 2108
    invoke-virtual {v5, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2113
    :cond_3a
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->relativesSibling:[Lcom/vkontakte/android/UserProfile;

    invoke-static {v4}, Lcom/vkontakte/android/utils/Utils;->isEmptyArray([Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_3b

    .line 2114
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->detailsItems:Ljava/util/ArrayList;

    new-instance v8, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->relativesSibling:[Lcom/vkontakte/android/UserProfile;

    array-length v4, v4

    const/4 v9, 0x1

    if-le v4, v9, :cond_5e

    const v4, 0x7f08057c

    :goto_1e
    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/vkontakte/android/fragments/ProfileFragment;->getString(I)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v9, v9, Lcom/vkontakte/android/api/ExtendedUserProfile;->relativesSibling:[Lcom/vkontakte/android/UserProfile;

    .line 2116
    move-object/from16 v0, p0

    invoke-direct {v0, v9}, Lcom/vkontakte/android/fragments/ProfileFragment;->generateRelativesString([Lcom/vkontakte/android/UserProfile;)Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v4, v9}, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 2114
    invoke-virtual {v5, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2119
    :cond_3b
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->relativesChild:[Lcom/vkontakte/android/UserProfile;

    invoke-static {v4}, Lcom/vkontakte/android/utils/Utils;->isEmptyArray([Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_3c

    .line 2120
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->detailsItems:Ljava/util/ArrayList;

    new-instance v8, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->relativesChild:[Lcom/vkontakte/android/UserProfile;

    array-length v4, v4

    const/4 v9, 0x1

    if-le v4, v9, :cond_60

    const v4, 0x7f08054c

    :goto_1f
    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/vkontakte/android/fragments/ProfileFragment;->getString(I)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v9, v9, Lcom/vkontakte/android/api/ExtendedUserProfile;->relativesChild:[Lcom/vkontakte/android/UserProfile;

    .line 2122
    move-object/from16 v0, p0

    invoke-direct {v0, v9}, Lcom/vkontakte/android/fragments/ProfileFragment;->generateRelativesString([Lcom/vkontakte/android/UserProfile;)Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v4, v9}, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 2120
    invoke-virtual {v5, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2125
    :cond_3c
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->relativesGrandchild:[Lcom/vkontakte/android/UserProfile;

    invoke-static {v4}, Lcom/vkontakte/android/utils/Utils;->isEmptyArray([Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_3d

    .line 2126
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->detailsItems:Ljava/util/ArrayList;

    new-instance v8, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->relativesGrandchild:[Lcom/vkontakte/android/UserProfile;

    array-length v4, v4

    const/4 v9, 0x1

    if-le v4, v9, :cond_62

    const v4, 0x7f08055a

    :goto_20
    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/vkontakte/android/fragments/ProfileFragment;->getString(I)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v9, v9, Lcom/vkontakte/android/api/ExtendedUserProfile;->relativesGrandchild:[Lcom/vkontakte/android/UserProfile;

    .line 2128
    move-object/from16 v0, p0

    invoke-direct {v0, v9}, Lcom/vkontakte/android/fragments/ProfileFragment;->generateRelativesString([Lcom/vkontakte/android/UserProfile;)Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v4, v9}, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 2126
    invoke-virtual {v5, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2131
    :cond_3d
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->city:Ljava/lang/String;

    if-nez v4, :cond_3e

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->mobilePhone:Ljava/lang/String;

    if-nez v4, :cond_3e

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->homePhone:Ljava/lang/String;

    if-nez v4, :cond_3e

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->skype:Ljava/lang/String;

    if-nez v4, :cond_3e

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->instagram:Ljava/lang/String;

    if-nez v4, :cond_3e

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->twitter:Ljava/lang/String;

    if-nez v4, :cond_3e

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->facebookName:Ljava/lang/String;

    if-nez v4, :cond_3e

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->livejournal:Ljava/lang/String;

    if-nez v4, :cond_3e

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->website:Ljava/lang/String;

    if-eqz v4, :cond_48

    .line 2132
    :cond_3e
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->detailsItems:Ljava/util/ArrayList;

    new-instance v4, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;

    const v5, 0x7f080560

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/vkontakte/android/fragments/ProfileFragment;->getString(I)Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x1

    const/4 v9, 0x0

    const/4 v10, 0x0

    invoke-direct/range {v4 .. v10}, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLandroid/content/Intent;Ljava/lang/String;)V

    invoke-virtual {v11, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2133
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->city:Ljava/lang/String;

    if-eqz v4, :cond_3f

    .line 2134
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->detailsItems:Ljava/util/ArrayList;

    new-instance v5, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;

    const v8, 0x7f08054d

    move-object/from16 v0, p0

    invoke-virtual {v0, v8}, Lcom/vkontakte/android/fragments/ProfileFragment;->getString(I)Ljava/lang/String;

    move-result-object v8

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v9, v9, Lcom/vkontakte/android/api/ExtendedUserProfile;->city:Ljava/lang/String;

    const/4 v10, 0x0

    invoke-direct {v5, v8, v9, v10}, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;-><init>(Ljava/lang/String;Ljava/lang/String;Landroid/content/Intent;)V

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2136
    :cond_3f
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->mobilePhone:Ljava/lang/String;

    if-eqz v4, :cond_40

    .line 2137
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->detailsItems:Ljava/util/ArrayList;

    new-instance v5, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;

    const v8, 0x7f080569

    move-object/from16 v0, p0

    invoke-virtual {v0, v8}, Lcom/vkontakte/android/fragments/ProfileFragment;->getString(I)Ljava/lang/String;

    move-result-object v8

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v9, v9, Lcom/vkontakte/android/api/ExtendedUserProfile;->mobilePhone:Ljava/lang/String;

    new-instance v10, Landroid/content/Intent;

    const-string/jumbo v11, "android.intent.action.VIEW"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v14, "tel:"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v14, v14, Lcom/vkontakte/android/api/ExtendedUserProfile;->mobilePhone:Ljava/lang/String;

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v13

    invoke-direct {v10, v11, v13}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-direct {v5, v8, v9, v10}, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;-><init>(Ljava/lang/String;Ljava/lang/String;Landroid/content/Intent;)V

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2139
    :cond_40
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->homePhone:Ljava/lang/String;

    if-eqz v4, :cond_41

    .line 2140
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->detailsItems:Ljava/util/ArrayList;

    new-instance v5, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;

    const v8, 0x7f08055d

    move-object/from16 v0, p0

    invoke-virtual {v0, v8}, Lcom/vkontakte/android/fragments/ProfileFragment;->getString(I)Ljava/lang/String;

    move-result-object v8

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v9, v9, Lcom/vkontakte/android/api/ExtendedUserProfile;->homePhone:Ljava/lang/String;

    new-instance v10, Landroid/content/Intent;

    const-string/jumbo v11, "android.intent.action.VIEW"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v14, "tel:"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v14, v14, Lcom/vkontakte/android/api/ExtendedUserProfile;->homePhone:Ljava/lang/String;

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v13

    invoke-direct {v10, v11, v13}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-direct {v5, v8, v9, v10}, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;-><init>(Ljava/lang/String;Ljava/lang/String;Landroid/content/Intent;)V

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2142
    :cond_41
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->skype:Ljava/lang/String;

    if-eqz v4, :cond_42

    .line 2143
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->detailsItems:Ljava/util/ArrayList;

    new-instance v5, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;

    const v8, 0x7f08057d

    move-object/from16 v0, p0

    invoke-virtual {v0, v8}, Lcom/vkontakte/android/fragments/ProfileFragment;->getString(I)Ljava/lang/String;

    move-result-object v8

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v9, v9, Lcom/vkontakte/android/api/ExtendedUserProfile;->skype:Ljava/lang/String;

    new-instance v10, Landroid/content/Intent;

    const-string/jumbo v11, "android.intent.action.VIEW"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v14, "skype:"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v14, v14, Lcom/vkontakte/android/api/ExtendedUserProfile;->skype:Ljava/lang/String;

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string/jumbo v14, "?call"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v13

    invoke-direct {v10, v11, v13}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-direct {v5, v8, v9, v10}, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;-><init>(Ljava/lang/String;Ljava/lang/String;Landroid/content/Intent;)V

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2145
    :cond_42
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->instagram:Ljava/lang/String;

    if-eqz v4, :cond_43

    .line 2146
    new-instance v37, Landroid/content/Intent;

    const-string/jumbo v4, "android.intent.action.VIEW"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "http://instagram.com/_u/"

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v8, v8, Lcom/vkontakte/android/api/ExtendedUserProfile;->instagram:Ljava/lang/String;

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v5

    move-object/from16 v0, v37

    invoke-direct {v0, v4, v5}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 2147
    .local v37, "intent":Landroid/content/Intent;
    const-string/jumbo v4, "com.instagram.android"

    move-object/from16 v0, v37

    invoke-virtual {v0, v4}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 2148
    new-instance v40, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;

    const v4, 0x7f080564

    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/vkontakte/android/fragments/ProfileFragment;->getString(I)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v5, v5, Lcom/vkontakte/android/api/ExtendedUserProfile;->instagram:Ljava/lang/String;

    move-object/from16 v0, v40

    move-object/from16 v1, v37

    invoke-direct {v0, v4, v5, v1}, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;-><init>(Ljava/lang/String;Ljava/lang/String;Landroid/content/Intent;)V

    .line 2149
    .local v40, "item":Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;
    new-instance v4, Landroid/content/Intent;

    const-string/jumbo v5, "android.intent.action.VIEW"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "http://instagram.com/"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v9, v9, Lcom/vkontakte/android/api/ExtendedUserProfile;->instagram:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v8

    invoke-direct {v4, v5, v8}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    move-object/from16 v0, v40

    iput-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;->fallbackIntent:Landroid/content/Intent;

    .line 2150
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->detailsItems:Ljava/util/ArrayList;

    move-object/from16 v0, v40

    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2152
    .end local v37    # "intent":Landroid/content/Intent;
    .end local v40    # "item":Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;
    :cond_43
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->twitter:Ljava/lang/String;

    if-eqz v4, :cond_44

    .line 2153
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->detailsItems:Ljava/util/ArrayList;

    new-instance v5, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;

    const v8, 0x7f080582

    move-object/from16 v0, p0

    invoke-virtual {v0, v8}, Lcom/vkontakte/android/fragments/ProfileFragment;->getString(I)Ljava/lang/String;

    move-result-object v8

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v9, v9, Lcom/vkontakte/android/api/ExtendedUserProfile;->twitter:Ljava/lang/String;

    new-instance v10, Landroid/content/Intent;

    const-string/jumbo v11, "android.intent.action.VIEW"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v14, "http://twitter.com/"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v14, v14, Lcom/vkontakte/android/api/ExtendedUserProfile;->twitter:Ljava/lang/String;

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v13

    invoke-direct {v10, v11, v13}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-direct {v5, v8, v9, v10}, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;-><init>(Ljava/lang/String;Ljava/lang/String;Landroid/content/Intent;)V

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2155
    :cond_44
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->facebookName:Ljava/lang/String;

    if-eqz v4, :cond_45

    .line 2156
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->detailsItems:Ljava/util/ArrayList;

    new-instance v5, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;

    const v8, 0x7f080554

    move-object/from16 v0, p0

    invoke-virtual {v0, v8}, Lcom/vkontakte/android/fragments/ProfileFragment;->getString(I)Ljava/lang/String;

    move-result-object v8

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v9, v9, Lcom/vkontakte/android/api/ExtendedUserProfile;->facebookName:Ljava/lang/String;

    new-instance v10, Landroid/content/Intent;

    const-string/jumbo v11, "android.intent.action.VIEW"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v14, "http://facebook.com/profile.php?id="

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-wide v14, v14, Lcom/vkontakte/android/api/ExtendedUserProfile;->facebookId:J

    invoke-virtual {v13, v14, v15}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v13

    invoke-direct {v10, v11, v13}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-direct {v5, v8, v9, v10}, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;-><init>(Ljava/lang/String;Ljava/lang/String;Landroid/content/Intent;)V

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2158
    :cond_45
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->website:Ljava/lang/String;

    if-eqz v4, :cond_47

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->website:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_47

    .line 2159
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v0, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->website:Ljava/lang/String;

    move-object/from16 v61, v0

    .line 2160
    .local v61, "site":Ljava/lang/String;
    const-string/jumbo v4, "http://"

    move-object/from16 v0, v61

    invoke-virtual {v0, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_46

    const-string/jumbo v4, "https://"

    move-object/from16 v0, v61

    invoke-virtual {v0, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_46

    .line 2161
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "http://"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, v61

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v61

    .line 2163
    :cond_46
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->detailsItems:Ljava/util/ArrayList;

    new-instance v5, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;

    const v8, 0x7f0802f4

    move-object/from16 v0, p0

    invoke-virtual {v0, v8}, Lcom/vkontakte/android/fragments/ProfileFragment;->getString(I)Ljava/lang/String;

    move-result-object v8

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v9, v9, Lcom/vkontakte/android/api/ExtendedUserProfile;->website:Ljava/lang/String;

    new-instance v10, Landroid/content/Intent;

    const-string/jumbo v11, "android.intent.action.VIEW"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v14, "vklink://view/?"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    move-object/from16 v0, v61

    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v13

    invoke-direct {v10, v11, v13}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-direct {v5, v8, v9, v10}, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;-><init>(Ljava/lang/String;Ljava/lang/String;Landroid/content/Intent;)V

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2165
    .end local v61    # "site":Ljava/lang/String;
    :cond_47
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->livejournal:Ljava/lang/String;

    if-eqz v4, :cond_48

    .line 2166
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->detailsItems:Ljava/util/ArrayList;

    new-instance v5, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;

    const v8, 0x7f080566

    move-object/from16 v0, p0

    invoke-virtual {v0, v8}, Lcom/vkontakte/android/fragments/ProfileFragment;->getString(I)Ljava/lang/String;

    move-result-object v8

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v9, v9, Lcom/vkontakte/android/api/ExtendedUserProfile;->livejournal:Ljava/lang/String;

    new-instance v10, Landroid/content/Intent;

    const-string/jumbo v11, "android.intent.action.VIEW"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v14, "http://"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v14, v14, Lcom/vkontakte/android/api/ExtendedUserProfile;->livejournal:Ljava/lang/String;

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string/jumbo v14, ".livejournal.com/"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v13

    invoke-direct {v10, v11, v13}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-direct {v5, v8, v9, v10}, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;-><init>(Ljava/lang/String;Ljava/lang/String;Landroid/content/Intent;)V

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2169
    :cond_48
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->schools:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-gtz v4, :cond_49

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->universities:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-lez v4, :cond_6a

    .line 2170
    :cond_49
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->detailsItems:Ljava/util/ArrayList;

    new-instance v4, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;

    const v5, 0x7f080561

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/vkontakte/android/fragments/ProfileFragment;->getString(I)Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x1

    const/4 v9, 0x0

    const/4 v10, 0x0

    invoke-direct/range {v4 .. v10}, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLandroid/content/Intent;Ljava/lang/String;)V

    invoke-virtual {v11, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2171
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->schools:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :cond_4a
    :goto_21
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_65

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v60

    check-cast v60, Lcom/vkontakte/android/api/ExtendedUserProfile$School;

    .line 2172
    .local v60, "s":Lcom/vkontakte/android/api/ExtendedUserProfile$School;
    if-eqz v60, :cond_4a

    move-object/from16 v0, v60

    iget-object v4, v0, Lcom/vkontakte/android/api/ExtendedUserProfile$School;->name:Ljava/lang/String;

    if-eqz v4, :cond_4a

    .line 2175
    move-object/from16 v0, v60

    iget-object v6, v0, Lcom/vkontakte/android/api/ExtendedUserProfile$School;->name:Ljava/lang/String;

    .line 2176
    .local v6, "title":Ljava/lang/String;
    move-object/from16 v0, v60

    iget v4, v0, Lcom/vkontakte/android/api/ExtendedUserProfile$School;->graduation:I

    if-lez v4, :cond_4b

    .line 2177
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, " \'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "%02d"

    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    move-object/from16 v0, v60

    iget v10, v0, Lcom/vkontakte/android/api/ExtendedUserProfile$School;->graduation:I

    rem-int/lit8 v10, v10, 0x64

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-static {v5, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 2179
    :cond_4b
    move-object/from16 v0, v60

    iget-object v4, v0, Lcom/vkontakte/android/api/ExtendedUserProfile$School;->city:Ljava/lang/String;

    if-eqz v4, :cond_64

    move-object/from16 v0, v60

    iget-object v7, v0, Lcom/vkontakte/android/api/ExtendedUserProfile$School;->city:Ljava/lang/String;

    .line 2180
    .local v7, "subtitle":Ljava/lang/String;
    :goto_22
    move-object/from16 v0, v60

    iget v4, v0, Lcom/vkontakte/android/api/ExtendedUserProfile$School;->from:I

    if-gtz v4, :cond_4c

    move-object/from16 v0, v60

    iget v4, v0, Lcom/vkontakte/android/api/ExtendedUserProfile$School;->to:I

    if-lez v4, :cond_4d

    :cond_4c
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_4d

    .line 2181
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, ", "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 2183
    :cond_4d
    move-object/from16 v0, v60

    iget v4, v0, Lcom/vkontakte/android/api/ExtendedUserProfile$School;->from:I

    if-lez v4, :cond_4e

    .line 2184
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, v60

    iget v5, v0, Lcom/vkontakte/android/api/ExtendedUserProfile$School;->from:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 2186
    :cond_4e
    move-object/from16 v0, v60

    iget v4, v0, Lcom/vkontakte/android/api/ExtendedUserProfile$School;->from:I

    if-lez v4, :cond_4f

    move-object/from16 v0, v60

    iget v4, v0, Lcom/vkontakte/android/api/ExtendedUserProfile$School;->to:I

    if-lez v4, :cond_4f

    .line 2187
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "-"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 2189
    :cond_4f
    move-object/from16 v0, v60

    iget v4, v0, Lcom/vkontakte/android/api/ExtendedUserProfile$School;->to:I

    if-lez v4, :cond_50

    .line 2190
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, v60

    iget v5, v0, Lcom/vkontakte/android/api/ExtendedUserProfile$School;->to:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 2192
    :cond_50
    move-object/from16 v0, v60

    iget-object v4, v0, Lcom/vkontakte/android/api/ExtendedUserProfile$School;->className:Ljava/lang/String;

    if-eqz v4, :cond_51

    move-object/from16 v0, v60

    iget-object v4, v0, Lcom/vkontakte/android/api/ExtendedUserProfile$School;->className:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_51

    .line 2193
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, " ("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, v60

    iget-object v5, v0, Lcom/vkontakte/android/api/ExtendedUserProfile$School;->className:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, ")"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 2195
    :cond_51
    invoke-virtual {v7}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v7

    .line 2196
    move-object/from16 v0, v60

    iget-object v4, v0, Lcom/vkontakte/android/api/ExtendedUserProfile$School;->speciality:Ljava/lang/String;

    if-eqz v4, :cond_53

    .line 2197
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_52

    .line 2198
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 2200
    :cond_52
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, v60

    iget-object v5, v0, Lcom/vkontakte/android/api/ExtendedUserProfile$School;->speciality:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 2202
    :cond_53
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->detailsItems:Ljava/util/ArrayList;

    new-instance v4, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;

    move-object/from16 v0, v60

    iget-object v5, v0, Lcom/vkontakte/android/api/ExtendedUserProfile$School;->type:Ljava/lang/String;

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    invoke-direct/range {v4 .. v10}, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLandroid/content/Intent;Ljava/lang/String;)V

    invoke-virtual {v13, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_21

    .line 2067
    .end local v6    # "title":Ljava/lang/String;
    .end local v7    # "subtitle":Ljava/lang/String;
    .end local v60    # "s":Lcom/vkontakte/android/api/ExtendedUserProfile$School;
    :cond_54
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->infoItems:Ljava/util/ArrayList;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vkontakte/android/fragments/ProfileFragment$InfoItem;

    const/4 v5, 0x2

    iput v5, v4, Lcom/vkontakte/android/fragments/ProfileFragment$InfoItem;->backgroundType:I

    .line 2068
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->infoItems:Ljava/util/ArrayList;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->infoItems:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vkontakte/android/fragments/ProfileFragment$InfoItem;

    const/4 v5, 0x4

    iput v5, v4, Lcom/vkontakte/android/fragments/ProfileFragment$InfoItem;->backgroundType:I

    goto/16 :goto_17

    .line 2081
    :cond_55
    const-string/jumbo v4, "%d %s"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v8, 0x0

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget v9, v9, Lcom/vkontakte/android/api/ExtendedUserProfile;->bDay:I

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v5, v8

    const/4 v8, 0x1

    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    const v10, 0x7f0c0016

    invoke-virtual {v9, v10}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v9

    const/16 v10, 0xb

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget v11, v11, Lcom/vkontakte/android/api/ExtendedUserProfile;->bMonth:I

    add-int/lit8 v11, v11, -0x1

    invoke-static {v10, v11}, Ljava/lang/Math;->min(II)I

    move-result v10

    aget-object v9, v9, v10

    aput-object v9, v5, v8

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v21

    .restart local v21    # "bd":Ljava/lang/String;
    goto/16 :goto_18

    .line 2092
    .end local v21    # "bd":Ljava/lang/String;
    .restart local v59    # "relation":Lcom/vkontakte/android/Relation;
    :cond_56
    const/4 v4, 0x0

    goto/16 :goto_19

    .line 2094
    :cond_57
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getContext()Landroid/content/Context;

    move-result-object v5

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->profile:Lcom/vkontakte/android/UserProfile;

    iget-boolean v4, v4, Lcom/vkontakte/android/UserProfile;->f:Z

    if-nez v4, :cond_58

    const/4 v4, 0x1

    :goto_23
    move-object/from16 v0, v59

    invoke-virtual {v0, v5, v4}, Lcom/vkontakte/android/Relation;->getName(Landroid/content/Context;Z)Ljava/lang/String;

    move-result-object v58

    .restart local v58    # "rel":Ljava/lang/String;
    goto/16 :goto_1a

    .end local v58    # "rel":Ljava/lang/String;
    :cond_58
    const/4 v4, 0x0

    goto :goto_23

    .line 2096
    .restart local v58    # "rel":Ljava/lang/String;
    :cond_59
    const/4 v4, 0x0

    goto/16 :goto_1b

    .line 2102
    .end local v58    # "rel":Ljava/lang/String;
    .end local v59    # "relation":Lcom/vkontakte/android/Relation;
    :cond_5a
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->relativesGrandparent:[Lcom/vkontakte/android/UserProfile;

    const/4 v9, 0x0

    aget-object v4, v4, v9

    iget-boolean v4, v4, Lcom/vkontakte/android/UserProfile;->f:Z

    if-eqz v4, :cond_5b

    const v4, 0x7f080573

    goto/16 :goto_1c

    :cond_5b
    const v4, 0x7f080574

    goto/16 :goto_1c

    .line 2108
    :cond_5c
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->relativesParents:[Lcom/vkontakte/android/UserProfile;

    const/4 v9, 0x0

    aget-object v4, v4, v9

    iget-boolean v4, v4, Lcom/vkontakte/android/UserProfile;->f:Z

    if-eqz v4, :cond_5d

    const v4, 0x7f080575

    goto/16 :goto_1d

    :cond_5d
    const v4, 0x7f080576

    goto/16 :goto_1d

    .line 2114
    :cond_5e
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->relativesSibling:[Lcom/vkontakte/android/UserProfile;

    const/4 v9, 0x0

    aget-object v4, v4, v9

    iget-boolean v4, v4, Lcom/vkontakte/android/UserProfile;->f:Z

    if-eqz v4, :cond_5f

    const v4, 0x7f080577

    goto/16 :goto_1e

    :cond_5f
    const v4, 0x7f080578

    goto/16 :goto_1e

    .line 2120
    :cond_60
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->relativesChild:[Lcom/vkontakte/android/UserProfile;

    const/4 v9, 0x0

    aget-object v4, v4, v9

    iget-boolean v4, v4, Lcom/vkontakte/android/UserProfile;->f:Z

    if-eqz v4, :cond_61

    const v4, 0x7f08056f

    goto/16 :goto_1f

    :cond_61
    const v4, 0x7f080570

    goto/16 :goto_1f

    .line 2126
    :cond_62
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->relativesGrandchild:[Lcom/vkontakte/android/UserProfile;

    const/4 v9, 0x0

    aget-object v4, v4, v9

    iget-boolean v4, v4, Lcom/vkontakte/android/UserProfile;->f:Z

    if-eqz v4, :cond_63

    const v4, 0x7f080571

    goto/16 :goto_20

    :cond_63
    const v4, 0x7f080572

    goto/16 :goto_20

    .line 2179
    .restart local v6    # "title":Ljava/lang/String;
    .restart local v60    # "s":Lcom/vkontakte/android/api/ExtendedUserProfile$School;
    :cond_64
    const-string/jumbo v7, ""

    goto/16 :goto_22

    .line 2204
    .end local v6    # "title":Ljava/lang/String;
    .end local v60    # "s":Lcom/vkontakte/android/api/ExtendedUserProfile$School;
    :cond_65
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->universities:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :goto_24
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_6a

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v66

    check-cast v66, Lcom/vkontakte/android/api/ExtendedUserProfile$University;

    .line 2205
    .restart local v66    # "u":Lcom/vkontakte/android/api/ExtendedUserProfile$University;
    move-object/from16 v0, v66

    iget-object v6, v0, Lcom/vkontakte/android/api/ExtendedUserProfile$University;->name:Ljava/lang/String;

    .line 2206
    .restart local v6    # "title":Ljava/lang/String;
    move-object/from16 v0, v66

    iget v4, v0, Lcom/vkontakte/android/api/ExtendedUserProfile$University;->graduation:I

    if-lez v4, :cond_66

    .line 2207
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, " \'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "%02d"

    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    move-object/from16 v0, v66

    iget v10, v0, Lcom/vkontakte/android/api/ExtendedUserProfile$University;->graduation:I

    rem-int/lit8 v10, v10, 0x64

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-static {v5, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 2209
    :cond_66
    const-string/jumbo v7, ""

    .line 2210
    .restart local v7    # "subtitle":Ljava/lang/String;
    move-object/from16 v0, v66

    iget-object v4, v0, Lcom/vkontakte/android/api/ExtendedUserProfile$University;->faculty:Ljava/lang/String;

    if-eqz v4, :cond_67

    .line 2211
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, v66

    iget-object v5, v0, Lcom/vkontakte/android/api/ExtendedUserProfile$University;->faculty:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 2213
    :cond_67
    move-object/from16 v0, v66

    iget-object v4, v0, Lcom/vkontakte/android/api/ExtendedUserProfile$University;->chair:Ljava/lang/String;

    if-eqz v4, :cond_69

    .line 2214
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_68

    .line 2215
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 2217
    :cond_68
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, v66

    iget-object v5, v0, Lcom/vkontakte/android/api/ExtendedUserProfile$University;->chair:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 2219
    :cond_69
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->detailsItems:Ljava/util/ArrayList;

    new-instance v4, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;

    const v5, 0x7f080583

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/vkontakte/android/fragments/ProfileFragment;->getString(I)Ljava/lang/String;

    move-result-object v5

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    invoke-direct/range {v4 .. v10}, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLandroid/content/Intent;Ljava/lang/String;)V

    invoke-virtual {v13, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_24

    .line 2222
    .end local v6    # "title":Ljava/lang/String;
    .end local v7    # "subtitle":Ljava/lang/String;
    .end local v66    # "u":Lcom/vkontakte/android/api/ExtendedUserProfile$University;
    :cond_6a
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->career:Ljava/util/ArrayList;

    if-eqz v4, :cond_73

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->career:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-lez v4, :cond_73

    .line 2223
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->detailsItems:Ljava/util/ArrayList;

    new-instance v8, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;

    const v5, 0x7f080123

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/vkontakte/android/fragments/ProfileFragment;->getString(I)Ljava/lang/String;

    move-result-object v9

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x1

    const/4 v13, 0x0

    const/4 v14, 0x0

    invoke-direct/range {v8 .. v14}, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLandroid/content/Intent;Ljava/lang/String;)V

    invoke-virtual {v4, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2224
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->career:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_25
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_73

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v28

    check-cast v28, Lcom/vkontakte/android/api/ExtendedUserProfile$Employer;

    .line 2225
    .restart local v28    # "e":Lcom/vkontakte/android/api/ExtendedUserProfile$Employer;
    new-instance v40, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;

    const/4 v5, 0x0

    move-object/from16 v0, v28

    iget-object v8, v0, Lcom/vkontakte/android/api/ExtendedUserProfile$Employer;->title:Ljava/lang/String;

    move-object/from16 v0, v40

    invoke-direct {v0, v5, v8}, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 2226
    .restart local v40    # "item":Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;
    const-string/jumbo v5, ""

    move-object/from16 v0, v40

    iput-object v5, v0, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;->subtitle:Ljava/lang/String;

    .line 2227
    move-object/from16 v0, v28

    iget-object v5, v0, Lcom/vkontakte/android/api/ExtendedUserProfile$Employer;->city:Ljava/lang/String;

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_6c

    .line 2228
    move-object/from16 v0, v28

    iget-object v5, v0, Lcom/vkontakte/android/api/ExtendedUserProfile$Employer;->city:Ljava/lang/String;

    move-object/from16 v0, v40

    iput-object v5, v0, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;->subtitle:Ljava/lang/String;

    .line 2229
    move-object/from16 v0, v28

    iget v5, v0, Lcom/vkontakte/android/api/ExtendedUserProfile$Employer;->yearFrom:I

    if-gtz v5, :cond_6b

    move-object/from16 v0, v28

    iget v5, v0, Lcom/vkontakte/android/api/ExtendedUserProfile$Employer;->yearTo:I

    if-lez v5, :cond_6c

    .line 2230
    :cond_6b
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v40

    iget-object v8, v0, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;->subtitle:Ljava/lang/String;

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v8, ", "

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v40

    iput-object v5, v0, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;->subtitle:Ljava/lang/String;

    .line 2233
    :cond_6c
    move-object/from16 v0, v28

    iget v5, v0, Lcom/vkontakte/android/api/ExtendedUserProfile$Employer;->yearFrom:I

    if-lez v5, :cond_71

    move-object/from16 v0, v28

    iget v5, v0, Lcom/vkontakte/android/api/ExtendedUserProfile$Employer;->yearTo:I

    if-lez v5, :cond_71

    .line 2234
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v40

    iget-object v8, v0, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;->subtitle:Ljava/lang/String;

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const v8, 0x7f08054a

    const/4 v9, 0x2

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    move-object/from16 v0, v28

    iget v11, v0, Lcom/vkontakte/android/api/ExtendedUserProfile$Employer;->yearFrom:I

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v9, v10

    const/4 v10, 0x1

    move-object/from16 v0, v28

    iget v11, v0, Lcom/vkontakte/android/api/ExtendedUserProfile$Employer;->yearTo:I

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v9, v10

    move-object/from16 v0, p0

    invoke-virtual {v0, v8, v9}, Lcom/vkontakte/android/fragments/ProfileFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v40

    iput-object v5, v0, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;->subtitle:Ljava/lang/String;

    .line 2240
    :cond_6d
    :goto_26
    move-object/from16 v0, v28

    iget-object v5, v0, Lcom/vkontakte/android/api/ExtendedUserProfile$Employer;->position:Ljava/lang/String;

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_6f

    .line 2241
    move-object/from16 v0, v40

    iget-object v5, v0, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;->subtitle:Ljava/lang/String;

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_6e

    .line 2242
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v40

    iget-object v8, v0, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;->subtitle:Ljava/lang/String;

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v8, "\n"

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v40

    iput-object v5, v0, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;->subtitle:Ljava/lang/String;

    .line 2244
    :cond_6e
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v40

    iget-object v8, v0, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;->subtitle:Ljava/lang/String;

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, v28

    iget-object v8, v0, Lcom/vkontakte/android/api/ExtendedUserProfile$Employer;->position:Ljava/lang/String;

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v40

    iput-object v5, v0, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;->subtitle:Ljava/lang/String;

    .line 2246
    :cond_6f
    move-object/from16 v0, v28

    iget-object v5, v0, Lcom/vkontakte/android/api/ExtendedUserProfile$Employer;->group:Lcom/vkontakte/android/api/Group;

    if-eqz v5, :cond_70

    .line 2247
    move-object/from16 v0, v28

    iget-object v5, v0, Lcom/vkontakte/android/api/ExtendedUserProfile$Employer;->group:Lcom/vkontakte/android/api/Group;

    iget-object v5, v5, Lcom/vkontakte/android/api/Group;->photo:Ljava/lang/String;

    move-object/from16 v0, v40

    iput-object v5, v0, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;->image:Ljava/lang/String;

    .line 2248
    new-instance v5, Landroid/content/Intent;

    const-string/jumbo v8, "android.intent.action.VIEW"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v10, "vkontakte://profile/-"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    move-object/from16 v0, v28

    iget-object v10, v0, Lcom/vkontakte/android/api/ExtendedUserProfile$Employer;->group:Lcom/vkontakte/android/api/Group;

    iget v10, v10, Lcom/vkontakte/android/api/Group;->id:I

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v9

    invoke-direct {v5, v8, v9}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    move-object/from16 v0, v40

    iput-object v5, v0, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;->intent:Landroid/content/Intent;

    .line 2249
    move-object/from16 v0, v28

    iget-object v5, v0, Lcom/vkontakte/android/api/ExtendedUserProfile$Employer;->group:Lcom/vkontakte/android/api/Group;

    iget-object v5, v5, Lcom/vkontakte/android/api/Group;->name:Ljava/lang/String;

    move-object/from16 v0, v40

    iput-object v5, v0, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;->content:Ljava/lang/String;

    .line 2251
    :cond_70
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->detailsItems:Ljava/util/ArrayList;

    move-object/from16 v0, v40

    invoke-virtual {v5, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_25

    .line 2235
    :cond_71
    move-object/from16 v0, v28

    iget v5, v0, Lcom/vkontakte/android/api/ExtendedUserProfile$Employer;->yearFrom:I

    if-lez v5, :cond_72

    .line 2236
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v40

    iget-object v8, v0, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;->subtitle:Ljava/lang/String;

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const v8, 0x7f080549

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    move-object/from16 v0, v28

    iget v11, v0, Lcom/vkontakte/android/api/ExtendedUserProfile$Employer;->yearFrom:I

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v9, v10

    move-object/from16 v0, p0

    invoke-virtual {v0, v8, v9}, Lcom/vkontakte/android/fragments/ProfileFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v40

    iput-object v5, v0, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;->subtitle:Ljava/lang/String;

    goto/16 :goto_26

    .line 2237
    :cond_72
    move-object/from16 v0, v28

    iget v5, v0, Lcom/vkontakte/android/api/ExtendedUserProfile$Employer;->yearTo:I

    if-lez v5, :cond_6d

    .line 2238
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v40

    iget-object v8, v0, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;->subtitle:Ljava/lang/String;

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const v8, 0x7f08054b

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    move-object/from16 v0, v28

    iget v11, v0, Lcom/vkontakte/android/api/ExtendedUserProfile$Employer;->yearTo:I

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v9, v10

    move-object/from16 v0, p0

    invoke-virtual {v0, v8, v9}, Lcom/vkontakte/android/fragments/ProfileFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v40

    iput-object v5, v0, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;->subtitle:Ljava/lang/String;

    goto/16 :goto_26

    .line 2254
    .end local v28    # "e":Lcom/vkontakte/android/api/ExtendedUserProfile$Employer;
    .end local v40    # "item":Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;
    :cond_73
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->religion:Ljava/lang/String;

    if-eqz v4, :cond_74

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->religion:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    if-gtz v4, :cond_76

    :cond_74
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->inspiredBy:Ljava/lang/String;

    if-eqz v4, :cond_75

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->inspiredBy:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    if-gtz v4, :cond_76

    :cond_75
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->political:I

    if-gtz v4, :cond_76

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->lifeMain:I

    if-gtz v4, :cond_76

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->peopleMain:I

    if-gtz v4, :cond_76

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->smoking:I

    if-gtz v4, :cond_76

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->alcohol:I

    if-lez v4, :cond_7d

    .line 2255
    :cond_76
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->detailsItems:Ljava/util/ArrayList;

    new-instance v8, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;

    const v5, 0x7f080498

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/vkontakte/android/fragments/ProfileFragment;->getString(I)Ljava/lang/String;

    move-result-object v9

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x1

    const/4 v13, 0x0

    const/4 v14, 0x0

    invoke-direct/range {v8 .. v14}, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLandroid/content/Intent;Ljava/lang/String;)V

    invoke-virtual {v4, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2256
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->political:I

    if-lez v4, :cond_77

    .line 2257
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f0c0026

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v51

    .line 2258
    .local v51, "opts":[Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->political:I

    add-int/lit8 v4, v4, -0x1

    move-object/from16 v0, v51

    array-length v5, v0

    if-ge v4, v5, :cond_77

    .line 2259
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->detailsItems:Ljava/util/ArrayList;

    new-instance v5, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;

    const v8, 0x7f08049e

    move-object/from16 v0, p0

    invoke-virtual {v0, v8}, Lcom/vkontakte/android/fragments/ProfileFragment;->getString(I)Ljava/lang/String;

    move-result-object v8

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget v9, v9, Lcom/vkontakte/android/api/ExtendedUserProfile;->political:I

    add-int/lit8 v9, v9, -0x1

    aget-object v9, v51, v9

    invoke-direct {v5, v8, v9}, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2262
    .end local v51    # "opts":[Ljava/lang/String;
    :cond_77
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->religion:Ljava/lang/String;

    if-eqz v4, :cond_78

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->religion:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_78

    .line 2263
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->detailsItems:Ljava/util/ArrayList;

    new-instance v5, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;

    const v8, 0x7f08049f

    move-object/from16 v0, p0

    invoke-virtual {v0, v8}, Lcom/vkontakte/android/fragments/ProfileFragment;->getString(I)Ljava/lang/String;

    move-result-object v8

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v9, v9, Lcom/vkontakte/android/api/ExtendedUserProfile;->religion:Ljava/lang/String;

    invoke-direct {v5, v8, v9}, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2265
    :cond_78
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->lifeMain:I

    if-lez v4, :cond_79

    .line 2266
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f0c0024

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v51

    .line 2267
    .restart local v51    # "opts":[Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->lifeMain:I

    add-int/lit8 v4, v4, -0x1

    move-object/from16 v0, v51

    array-length v5, v0

    if-ge v4, v5, :cond_79

    .line 2268
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->detailsItems:Ljava/util/ArrayList;

    new-instance v5, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;

    const v8, 0x7f08049c

    move-object/from16 v0, p0

    invoke-virtual {v0, v8}, Lcom/vkontakte/android/fragments/ProfileFragment;->getString(I)Ljava/lang/String;

    move-result-object v8

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget v9, v9, Lcom/vkontakte/android/api/ExtendedUserProfile;->lifeMain:I

    add-int/lit8 v9, v9, -0x1

    aget-object v9, v51, v9

    invoke-direct {v5, v8, v9}, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2271
    .end local v51    # "opts":[Ljava/lang/String;
    :cond_79
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->peopleMain:I

    if-lez v4, :cond_7a

    .line 2272
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f0c0025

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v51

    .line 2273
    .restart local v51    # "opts":[Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->peopleMain:I

    add-int/lit8 v4, v4, -0x1

    move-object/from16 v0, v51

    array-length v5, v0

    if-ge v4, v5, :cond_7a

    .line 2274
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->detailsItems:Ljava/util/ArrayList;

    new-instance v5, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;

    const v8, 0x7f08049d

    move-object/from16 v0, p0

    invoke-virtual {v0, v8}, Lcom/vkontakte/android/fragments/ProfileFragment;->getString(I)Ljava/lang/String;

    move-result-object v8

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget v9, v9, Lcom/vkontakte/android/api/ExtendedUserProfile;->peopleMain:I

    add-int/lit8 v9, v9, -0x1

    aget-object v9, v51, v9

    invoke-direct {v5, v8, v9}, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2277
    .end local v51    # "opts":[Ljava/lang/String;
    :cond_7a
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->smoking:I

    if-lez v4, :cond_7b

    .line 2278
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f0c0027

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v51

    .line 2279
    .restart local v51    # "opts":[Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->smoking:I

    add-int/lit8 v4, v4, -0x1

    move-object/from16 v0, v51

    array-length v5, v0

    if-ge v4, v5, :cond_7b

    .line 2280
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->detailsItems:Ljava/util/ArrayList;

    new-instance v5, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;

    const v8, 0x7f0804a0

    move-object/from16 v0, p0

    invoke-virtual {v0, v8}, Lcom/vkontakte/android/fragments/ProfileFragment;->getString(I)Ljava/lang/String;

    move-result-object v8

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget v9, v9, Lcom/vkontakte/android/api/ExtendedUserProfile;->smoking:I

    add-int/lit8 v9, v9, -0x1

    aget-object v9, v51, v9

    invoke-direct {v5, v8, v9}, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2283
    .end local v51    # "opts":[Ljava/lang/String;
    :cond_7b
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->alcohol:I

    if-lez v4, :cond_7c

    .line 2284
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f0c0027

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v51

    .line 2285
    .restart local v51    # "opts":[Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->alcohol:I

    add-int/lit8 v4, v4, -0x1

    move-object/from16 v0, v51

    array-length v5, v0

    if-ge v4, v5, :cond_7c

    .line 2286
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->detailsItems:Ljava/util/ArrayList;

    new-instance v5, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;

    const v8, 0x7f080499

    move-object/from16 v0, p0

    invoke-virtual {v0, v8}, Lcom/vkontakte/android/fragments/ProfileFragment;->getString(I)Ljava/lang/String;

    move-result-object v8

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget v9, v9, Lcom/vkontakte/android/api/ExtendedUserProfile;->alcohol:I

    add-int/lit8 v9, v9, -0x1

    aget-object v9, v51, v9

    invoke-direct {v5, v8, v9}, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2289
    .end local v51    # "opts":[Ljava/lang/String;
    :cond_7c
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->inspiredBy:Ljava/lang/String;

    if-eqz v4, :cond_7d

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->inspiredBy:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_7d

    .line 2290
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->detailsItems:Ljava/util/ArrayList;

    new-instance v5, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;

    const v8, 0x7f08049a

    move-object/from16 v0, p0

    invoke-virtual {v0, v8}, Lcom/vkontakte/android/fragments/ProfileFragment;->getString(I)Ljava/lang/String;

    move-result-object v8

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v9, v9, Lcom/vkontakte/android/api/ExtendedUserProfile;->inspiredBy:Ljava/lang/String;

    invoke-direct {v5, v8, v9}, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2293
    :cond_7d
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->activities:Ljava/lang/String;

    if-nez v4, :cond_7e

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->interests:Ljava/lang/String;

    if-nez v4, :cond_7e

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->music:Ljava/lang/String;

    if-nez v4, :cond_7e

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->movies:Ljava/lang/String;

    if-nez v4, :cond_7e

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->tv:Ljava/lang/String;

    if-nez v4, :cond_7e

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->books:Ljava/lang/String;

    if-nez v4, :cond_7e

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->games:Ljava/lang/String;

    if-nez v4, :cond_7e

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->quotations:Ljava/lang/String;

    if-nez v4, :cond_7e

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->about:Ljava/lang/String;

    if-eqz v4, :cond_87

    .line 2294
    :cond_7e
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->detailsItems:Ljava/util/ArrayList;

    new-instance v8, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;

    const v5, 0x7f080562

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/vkontakte/android/fragments/ProfileFragment;->getString(I)Ljava/lang/String;

    move-result-object v9

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x1

    const/4 v13, 0x0

    const/4 v14, 0x0

    invoke-direct/range {v8 .. v14}, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLandroid/content/Intent;Ljava/lang/String;)V

    invoke-virtual {v4, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2295
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->activities:Ljava/lang/String;

    if-eqz v4, :cond_7f

    .line 2296
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->detailsItems:Ljava/util/ArrayList;

    new-instance v5, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;

    const v8, 0x7f08056b

    move-object/from16 v0, p0

    invoke-virtual {v0, v8}, Lcom/vkontakte/android/fragments/ProfileFragment;->getString(I)Ljava/lang/String;

    move-result-object v8

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v9, v9, Lcom/vkontakte/android/api/ExtendedUserProfile;->activities:Ljava/lang/String;

    invoke-direct {v5, v8, v9}, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2298
    :cond_7f
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->interests:Ljava/lang/String;

    if-eqz v4, :cond_80

    .line 2299
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->detailsItems:Ljava/util/ArrayList;

    new-instance v5, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;

    const v8, 0x7f080565

    move-object/from16 v0, p0

    invoke-virtual {v0, v8}, Lcom/vkontakte/android/fragments/ProfileFragment;->getString(I)Ljava/lang/String;

    move-result-object v8

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v9, v9, Lcom/vkontakte/android/api/ExtendedUserProfile;->interests:Ljava/lang/String;

    invoke-direct {v5, v8, v9}, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2301
    :cond_80
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->music:Ljava/lang/String;

    if-eqz v4, :cond_81

    .line 2302
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->detailsItems:Ljava/util/ArrayList;

    new-instance v5, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;

    const v8, 0x7f08056a

    move-object/from16 v0, p0

    invoke-virtual {v0, v8}, Lcom/vkontakte/android/fragments/ProfileFragment;->getString(I)Ljava/lang/String;

    move-result-object v8

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v9, v9, Lcom/vkontakte/android/api/ExtendedUserProfile;->music:Ljava/lang/String;

    invoke-direct {v5, v8, v9}, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2304
    :cond_81
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->movies:Ljava/lang/String;

    if-eqz v4, :cond_82

    .line 2305
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->detailsItems:Ljava/util/ArrayList;

    new-instance v5, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;

    const v8, 0x7f080568

    move-object/from16 v0, p0

    invoke-virtual {v0, v8}, Lcom/vkontakte/android/fragments/ProfileFragment;->getString(I)Ljava/lang/String;

    move-result-object v8

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v9, v9, Lcom/vkontakte/android/api/ExtendedUserProfile;->movies:Ljava/lang/String;

    invoke-direct {v5, v8, v9}, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2307
    :cond_82
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->tv:Ljava/lang/String;

    if-eqz v4, :cond_83

    .line 2308
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->detailsItems:Ljava/util/ArrayList;

    new-instance v5, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;

    const v8, 0x7f080581

    move-object/from16 v0, p0

    invoke-virtual {v0, v8}, Lcom/vkontakte/android/fragments/ProfileFragment;->getString(I)Ljava/lang/String;

    move-result-object v8

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v9, v9, Lcom/vkontakte/android/api/ExtendedUserProfile;->tv:Ljava/lang/String;

    invoke-direct {v5, v8, v9}, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2310
    :cond_83
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->books:Ljava/lang/String;

    if-eqz v4, :cond_84

    .line 2311
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->detailsItems:Ljava/util/ArrayList;

    new-instance v5, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;

    const v8, 0x7f080544

    move-object/from16 v0, p0

    invoke-virtual {v0, v8}, Lcom/vkontakte/android/fragments/ProfileFragment;->getString(I)Ljava/lang/String;

    move-result-object v8

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v9, v9, Lcom/vkontakte/android/api/ExtendedUserProfile;->books:Ljava/lang/String;

    invoke-direct {v5, v8, v9}, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2313
    :cond_84
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->games:Ljava/lang/String;

    if-eqz v4, :cond_85

    .line 2314
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->detailsItems:Ljava/util/ArrayList;

    new-instance v5, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;

    const v8, 0x7f080557

    move-object/from16 v0, p0

    invoke-virtual {v0, v8}, Lcom/vkontakte/android/fragments/ProfileFragment;->getString(I)Ljava/lang/String;

    move-result-object v8

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v9, v9, Lcom/vkontakte/android/api/ExtendedUserProfile;->games:Ljava/lang/String;

    invoke-direct {v5, v8, v9}, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2316
    :cond_85
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->quotations:Ljava/lang/String;

    if-eqz v4, :cond_86

    .line 2317
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->detailsItems:Ljava/util/ArrayList;

    new-instance v5, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;

    const v8, 0x7f08056d

    move-object/from16 v0, p0

    invoke-virtual {v0, v8}, Lcom/vkontakte/android/fragments/ProfileFragment;->getString(I)Ljava/lang/String;

    move-result-object v8

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v9, v9, Lcom/vkontakte/android/api/ExtendedUserProfile;->quotations:Ljava/lang/String;

    invoke-direct {v5, v8, v9}, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2319
    :cond_86
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->about:Ljava/lang/String;

    if-eqz v4, :cond_87

    .line 2320
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->detailsItems:Ljava/util/ArrayList;

    new-instance v5, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;

    const v8, 0x7f08053f

    move-object/from16 v0, p0

    invoke-virtual {v0, v8}, Lcom/vkontakte/android/fragments/ProfileFragment;->getString(I)Ljava/lang/String;

    move-result-object v8

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v9, v9, Lcom/vkontakte/android/api/ExtendedUserProfile;->about:Ljava/lang/String;

    invoke-direct {v5, v8, v9}, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2396
    :cond_87
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->detailsItems:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_a3

    .line 2397
    const/16 v36, 0x0

    .restart local v36    # "i":I
    :goto_27
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->detailsItems:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    move/from16 v0, v36

    if-ge v0, v4, :cond_9b

    .line 2398
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->detailsItems:Ljava/util/ArrayList;

    move/from16 v0, v36

    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;

    iget-boolean v4, v4, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;->isHeader:Z

    if-eqz v4, :cond_88

    .line 2399
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->detailsItems:Ljava/util/ArrayList;

    move/from16 v0, v36

    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;

    const/4 v5, 0x2

    iput v5, v4, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;->bgType:I

    .line 2400
    if-lez v36, :cond_88

    .line 2401
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->detailsItems:Ljava/util/ArrayList;

    add-int/lit8 v5, v36, -0x1

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v57

    check-cast v57, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;

    .line 2402
    .local v57, "prev":Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;
    move-object/from16 v0, v57

    iget v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;->bgType:I

    and-int/lit8 v4, v4, 0x2

    const/4 v5, 0x2

    if-ne v4, v5, :cond_9a

    .line 2403
    move-object/from16 v0, v57

    iget v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;->bgType:I

    or-int/lit8 v4, v4, 0x4

    move-object/from16 v0, v57

    iput v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;->bgType:I

    .line 2397
    .end local v57    # "prev":Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;
    :cond_88
    :goto_28
    add-int/lit8 v36, v36, 0x1

    goto :goto_27

    .line 2341
    .end local v36    # "i":I
    :cond_89
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->about:Ljava/lang/String;

    if-eqz v4, :cond_8a

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->about:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_8a

    .line 2342
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->detailsItems:Ljava/util/ArrayList;

    new-instance v5, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;

    const v8, 0x7f0802bb

    move-object/from16 v0, p0

    invoke-virtual {v0, v8}, Lcom/vkontakte/android/fragments/ProfileFragment;->getString(I)Ljava/lang/String;

    move-result-object v8

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v9, v9, Lcom/vkontakte/android/api/ExtendedUserProfile;->about:Ljava/lang/String;

    const/4 v10, 0x0

    invoke-direct {v5, v8, v9, v10}, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;-><init>(Ljava/lang/String;Ljava/lang/String;Landroid/content/Intent;)V

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2344
    :cond_8a
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->website:Ljava/lang/String;

    if-eqz v4, :cond_8b

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->website:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_8b

    .line 2345
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->detailsItems:Ljava/util/ArrayList;

    new-instance v5, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;

    const v8, 0x7f0802f4

    move-object/from16 v0, p0

    invoke-virtual {v0, v8}, Lcom/vkontakte/android/fragments/ProfileFragment;->getString(I)Ljava/lang/String;

    move-result-object v8

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v9, v9, Lcom/vkontakte/android/api/ExtendedUserProfile;->website:Ljava/lang/String;

    new-instance v10, Landroid/content/Intent;

    const-string/jumbo v11, "android.intent.action.VIEW"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v14, "vklink://view/?"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v14, v14, Lcom/vkontakte/android/api/ExtendedUserProfile;->website:Ljava/lang/String;

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v13

    invoke-direct {v10, v11, v13}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-direct {v5, v8, v9, v10}, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;-><init>(Ljava/lang/String;Ljava/lang/String;Landroid/content/Intent;)V

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2347
    :cond_8b
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->eventStartTime:I

    if-lez v4, :cond_8c

    .line 2348
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->detailsItems:Ljava/util/ArrayList;

    new-instance v5, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;

    const v8, 0x7f0802f5

    move-object/from16 v0, p0

    invoke-virtual {v0, v8}, Lcom/vkontakte/android/fragments/ProfileFragment;->getString(I)Ljava/lang/String;

    move-result-object v8

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget v9, v9, Lcom/vkontakte/android/api/ExtendedUserProfile;->eventStartTime:I

    invoke-static {v9}, Lcom/vkontakte/android/TimeUtils;->langDate(I)Ljava/lang/String;

    move-result-object v9

    const/4 v10, 0x0

    invoke-direct {v5, v8, v9, v10}, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;-><init>(Ljava/lang/String;Ljava/lang/String;Landroid/content/Intent;)V

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2350
    :cond_8c
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->eventEndTime:I

    if-lez v4, :cond_8d

    .line 2351
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->detailsItems:Ljava/util/ArrayList;

    new-instance v5, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;

    const v8, 0x7f0802c1

    move-object/from16 v0, p0

    invoke-virtual {v0, v8}, Lcom/vkontakte/android/fragments/ProfileFragment;->getString(I)Ljava/lang/String;

    move-result-object v8

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget v9, v9, Lcom/vkontakte/android/api/ExtendedUserProfile;->eventEndTime:I

    invoke-static {v9}, Lcom/vkontakte/android/TimeUtils;->langDate(I)Ljava/lang/String;

    move-result-object v9

    const/4 v10, 0x0

    invoke-direct {v5, v8, v9, v10}, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;-><init>(Ljava/lang/String;Ljava/lang/String;Landroid/content/Intent;)V

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2353
    :cond_8d
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->city:Ljava/lang/String;

    if-eqz v4, :cond_8e

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->city:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_8e

    .line 2354
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->detailsItems:Ljava/util/ArrayList;

    new-instance v8, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->groupType:I

    const/4 v9, 0x1

    if-ne v4, v9, :cond_8f

    const v4, 0x7f0802c5

    :goto_29
    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/vkontakte/android/fragments/ProfileFragment;->getString(I)Ljava/lang/String;

    move-result-object v9

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v10, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->city:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-wide v14, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->lat:D

    const-wide v16, -0x3f3e6c0000000000L    # -9000.0

    cmpl-double v4, v14, v16

    if-eqz v4, :cond_90

    new-instance v4, Landroid/content/Intent;

    const-string/jumbo v11, "android.intent.action.VIEW"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v14, "geo:"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-wide v14, v14, Lcom/vkontakte/android/api/ExtendedUserProfile;->lat:D

    invoke-virtual {v13, v14, v15}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string/jumbo v14, ","

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-wide v14, v14, Lcom/vkontakte/android/api/ExtendedUserProfile;->lon:D

    invoke-virtual {v13, v14, v15}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string/jumbo v14, "?q="

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-wide v14, v14, Lcom/vkontakte/android/api/ExtendedUserProfile;->lat:D

    invoke-virtual {v13, v14, v15}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string/jumbo v14, ","

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-wide v14, v14, Lcom/vkontakte/android/api/ExtendedUserProfile;->lon:D

    invoke-virtual {v13, v14, v15}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    .line 2355
    invoke-static {v13}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v13

    invoke-direct {v4, v11, v13}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    :goto_2a
    invoke-direct {v8, v9, v10, v4}, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;-><init>(Ljava/lang/String;Ljava/lang/String;Landroid/content/Intent;)V

    .line 2354
    invoke-virtual {v5, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2358
    :cond_8e
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->links:Ljava/util/ArrayList;

    if-eqz v4, :cond_91

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->links:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-lez v4, :cond_91

    .line 2359
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->detailsItems:Ljava/util/ArrayList;

    new-instance v8, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;

    const v5, 0x7f0802dc

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/vkontakte/android/fragments/ProfileFragment;->getString(I)Ljava/lang/String;

    move-result-object v9

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x1

    const/4 v13, 0x0

    const/4 v14, 0x0

    invoke-direct/range {v8 .. v14}, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLandroid/content/Intent;Ljava/lang/String;)V

    invoke-virtual {v4, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2360
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->links:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_2b
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_91

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v41

    check-cast v41, Lcom/vkontakte/android/api/ExtendedUserProfile$Link;

    .line 2361
    .local v41, "link":Lcom/vkontakte/android/api/ExtendedUserProfile$Link;
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->detailsItems:Ljava/util/ArrayList;

    new-instance v8, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;

    const/4 v9, 0x0

    move-object/from16 v0, v41

    iget-object v10, v0, Lcom/vkontakte/android/api/ExtendedUserProfile$Link;->title:Ljava/lang/String;

    move-object/from16 v0, v41

    iget-object v11, v0, Lcom/vkontakte/android/api/ExtendedUserProfile$Link;->subtitle:Ljava/lang/String;

    const/4 v12, 0x0

    new-instance v13, Landroid/content/Intent;

    const-string/jumbo v14, "android.intent.action.VIEW"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v16, "vklink://view/?"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    move-object/from16 v0, v41

    iget-object v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile$Link;->url:Ljava/lang/String;

    move-object/from16 v16, v0

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v15}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v15

    invoke-direct {v13, v14, v15}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    move-object/from16 v0, v41

    iget-object v14, v0, Lcom/vkontakte/android/api/ExtendedUserProfile$Link;->photo:Ljava/lang/String;

    invoke-direct/range {v8 .. v14}, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLandroid/content/Intent;Ljava/lang/String;)V

    invoke-virtual {v5, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2b

    .line 2354
    .end local v41    # "link":Lcom/vkontakte/android/api/ExtendedUserProfile$Link;
    :cond_8f
    const v4, 0x7f0802e6

    goto/16 :goto_29

    .line 2355
    :cond_90
    const/4 v4, 0x0

    goto/16 :goto_2a

    .line 2365
    :cond_91
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->contacts:Ljava/util/ArrayList;

    if-eqz v4, :cond_87

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->contacts:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-lez v4, :cond_87

    .line 2366
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->detailsItems:Ljava/util/ArrayList;

    new-instance v8, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;

    const v5, 0x7f0802b8

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/vkontakte/android/fragments/ProfileFragment;->getString(I)Ljava/lang/String;

    move-result-object v9

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x1

    const/4 v13, 0x0

    const/4 v14, 0x0

    invoke-direct/range {v8 .. v14}, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLandroid/content/Intent;Ljava/lang/String;)V

    invoke-virtual {v4, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2367
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->contacts:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_2c
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_87

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v26

    check-cast v26, Lcom/vkontakte/android/api/ExtendedUserProfile$Contact;

    .line 2368
    .local v26, "contact":Lcom/vkontakte/android/api/ExtendedUserProfile$Contact;
    move-object/from16 v0, v26

    iget-object v4, v0, Lcom/vkontakte/android/api/ExtendedUserProfile$Contact;->user:Lcom/vkontakte/android/UserProfile;

    if-eqz v4, :cond_99

    .line 2369
    move-object/from16 v0, v26

    iget-object v4, v0, Lcom/vkontakte/android/api/ExtendedUserProfile$Contact;->phone:Ljava/lang/String;

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_93

    const/16 v35, 0x1

    .line 2370
    .local v35, "hasPhone":Z
    :goto_2d
    move-object/from16 v0, v26

    iget-object v4, v0, Lcom/vkontakte/android/api/ExtendedUserProfile$Contact;->email:Ljava/lang/String;

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_94

    const/16 v34, 0x1

    .line 2372
    .local v34, "hasEmail":Z
    :goto_2e
    if-nez v35, :cond_92

    if-eqz v34, :cond_98

    .line 2373
    :cond_92
    if-eqz v35, :cond_96

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v26

    iget-object v8, v0, Lcom/vkontakte/android/api/ExtendedUserProfile$Contact;->phone:Ljava/lang/String;

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    if-eqz v34, :cond_95

    const-string/jumbo v4, "\n"

    :goto_2f
    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    .line 2374
    .local v12, "contacts":Ljava/lang/String;
    :goto_30
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    if-eqz v34, :cond_97

    move-object/from16 v0, v26

    iget-object v4, v0, Lcom/vkontakte/android/api/ExtendedUserProfile$Contact;->email:Ljava/lang/String;

    :goto_31
    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    .line 2378
    :goto_32
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->detailsItems:Ljava/util/ArrayList;

    new-instance v8, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;

    const/4 v9, 0x0

    move-object/from16 v0, v26

    iget-object v10, v0, Lcom/vkontakte/android/api/ExtendedUserProfile$Contact;->user:Lcom/vkontakte/android/UserProfile;

    iget-object v10, v10, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    move-object/from16 v0, v26

    iget-object v11, v0, Lcom/vkontakte/android/api/ExtendedUserProfile$Contact;->title:Ljava/lang/String;

    const/4 v13, 0x0

    new-instance v14, Landroid/content/Intent;

    const-string/jumbo v15, "android.intent.action.VIEW"

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v17, "vkontakte://profile/"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v26

    iget-object v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile$Contact;->user:Lcom/vkontakte/android/UserProfile;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget v0, v0, Lcom/vkontakte/android/UserProfile;->uid:I

    move/from16 v17, v0

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    .line 2379
    invoke-static/range {v16 .. v16}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v16

    invoke-direct/range {v14 .. v16}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    move-object/from16 v0, v26

    iget-object v15, v0, Lcom/vkontakte/android/api/ExtendedUserProfile$Contact;->user:Lcom/vkontakte/android/UserProfile;

    iget-object v15, v15, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    invoke-direct/range {v8 .. v15}, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLandroid/content/Intent;Ljava/lang/String;)V

    .line 2378
    invoke-virtual {v4, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_2c

    .line 2369
    .end local v12    # "contacts":Ljava/lang/String;
    .end local v34    # "hasEmail":Z
    .end local v35    # "hasPhone":Z
    :cond_93
    const/16 v35, 0x0

    goto/16 :goto_2d

    .line 2370
    .restart local v35    # "hasPhone":Z
    :cond_94
    const/16 v34, 0x0

    goto/16 :goto_2e

    .line 2373
    .restart local v34    # "hasEmail":Z
    :cond_95
    const-string/jumbo v4, ""

    goto :goto_2f

    :cond_96
    const-string/jumbo v12, ""

    goto :goto_30

    .line 2374
    .restart local v12    # "contacts":Ljava/lang/String;
    :cond_97
    const-string/jumbo v4, ""

    goto :goto_31

    .line 2376
    .end local v12    # "contacts":Ljava/lang/String;
    :cond_98
    const/4 v12, 0x0

    .restart local v12    # "contacts":Ljava/lang/String;
    goto :goto_32

    .line 2381
    .end local v12    # "contacts":Ljava/lang/String;
    .end local v34    # "hasEmail":Z
    .end local v35    # "hasPhone":Z
    :cond_99
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->detailsItems:Ljava/util/ArrayList;

    new-instance v13, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;

    const/4 v14, 0x0

    move-object/from16 v0, v26

    iget-object v15, v0, Lcom/vkontakte/android/api/ExtendedUserProfile$Contact;->email:Ljava/lang/String;

    move-object/from16 v0, v26

    iget-object v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile$Contact;->title:Ljava/lang/String;

    move-object/from16 v16, v0

    const/16 v17, 0x0

    new-instance v18, Landroid/content/Intent;

    const-string/jumbo v8, "android.intent.action.VIEW"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v10, "mailto:"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    move-object/from16 v0, v26

    iget-object v10, v0, Lcom/vkontakte/android/api/ExtendedUserProfile$Contact;->email:Ljava/lang/String;

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v9

    move-object/from16 v0, v18

    invoke-direct {v0, v8, v9}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    const-string/jumbo v19, "http://vk.com/images/contact_50.gif"

    invoke-direct/range {v13 .. v19}, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLandroid/content/Intent;Ljava/lang/String;)V

    invoke-virtual {v4, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_2c

    .line 2405
    .end local v26    # "contact":Lcom/vkontakte/android/api/ExtendedUserProfile$Contact;
    .restart local v36    # "i":I
    .restart local v57    # "prev":Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;
    :cond_9a
    const/4 v4, 0x4

    move-object/from16 v0, v57

    iput v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;->bgType:I

    goto/16 :goto_28

    .line 2410
    .end local v57    # "prev":Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;
    :cond_9b
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->detailsItems:Ljava/util/ArrayList;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->detailsItems:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v57

    check-cast v57, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;

    .line 2411
    .restart local v57    # "prev":Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;
    move-object/from16 v0, v57

    iget v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;->bgType:I

    and-int/lit8 v4, v4, 0x2

    const/4 v5, 0x2

    if-ne v4, v5, :cond_a2

    .line 2412
    move-object/from16 v0, v57

    iget v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;->bgType:I

    or-int/lit8 v4, v4, 0x4

    move-object/from16 v0, v57

    iput v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;->bgType:I

    .line 2427
    .end local v36    # "i":I
    .end local v57    # "prev":Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;
    :cond_9c
    :goto_33
    const/16 v54, 0x0

    .line 2429
    .local v54, "photosItem":Lcom/vkontakte/android/fragments/ProfileFragment$InfoItem;
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-boolean v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->canPost:Z

    if-eqz v4, :cond_9d

    move-object/from16 v0, p0

    iget v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v5

    invoke-virtual {v5}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v5

    if-ne v4, v5, :cond_9d

    .line 2430
    invoke-direct/range {p0 .. p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->addButtonsItem()V

    .line 2433
    :cond_9d
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->buttonAppId:I

    if-eqz v4, :cond_9e

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->buttonTitle:Ljava/lang/String;

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_9e

    .line 2434
    new-instance v24, Lcom/vkontakte/android/fragments/ProfileFragment$ButtonItem;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->buttonAppId:I

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v5, v5, Lcom/vkontakte/android/api/ExtendedUserProfile;->buttonTitle:Ljava/lang/String;

    move-object/from16 v0, v24

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v4, v5}, Lcom/vkontakte/android/fragments/ProfileFragment$ButtonItem;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;ILjava/lang/String;)V

    .line 2435
    .local v24, "buttonItem":Lcom/vkontakte/android/fragments/ProfileFragment$ButtonItem;
    const/4 v4, 0x6

    move-object/from16 v0, v24

    iput v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment$ButtonItem;->backgroundType:I

    .line 2436
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->infoItems:Ljava/util/ArrayList;

    move-object/from16 v0, v24

    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2439
    .end local v24    # "buttonItem":Lcom/vkontakte/android/fragments/ProfileFragment$ButtonItem;
    :cond_9e
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->counters:Ljava/util/HashMap;

    const-string/jumbo v5, "market"

    invoke-virtual {v4, v5}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_9f

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    const-string/jumbo v5, "market"

    invoke-virtual {v4, v5}, Lcom/vkontakte/android/api/ExtendedUserProfile;->getCounter(Ljava/lang/String;)I

    move-result v4

    if-lez v4, :cond_9f

    const/4 v4, 0x5

    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/vkontakte/android/fragments/ProfileFragment;->canShowMainSection(I)Z

    move-result v4

    if-eqz v4, :cond_9f

    .line 2440
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    const-string/jumbo v5, "market"

    invoke-virtual {v4, v5}, Lcom/vkontakte/android/api/ExtendedUserProfile;->getCounter(Ljava/lang/String;)I

    move-result v47

    .line 2441
    .local v47, "numPhotos":I
    invoke-static/range {p0 .. p0}, Lcom/vkontakte/android/fragments/ProfileFragment$$Lambda$23;->lambdaFactory$(Lcom/vkontakte/android/fragments/ProfileFragment;)Ljava/lang/Runnable;

    move-result-object v50

    .line 2442
    .local v50, "openMarket":Ljava/lang/Runnable;
    new-instance v64, Lcom/vkontakte/android/fragments/ProfileFragment$ContentTitleInfoItem;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const v5, 0x7f08029c

    .line 2443
    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/vkontakte/android/fragments/ProfileFragment;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "  /cFF909499"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {}, Ljava/text/NumberFormat;->getInstance()Ljava/text/NumberFormat;

    move-result-object v5

    move/from16 v0, v47

    int-to-long v8, v0

    invoke-virtual {v5, v8, v9}, Ljava/text/NumberFormat;->format(J)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "/e"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 2442
    invoke-static {v4}, Lcom/vkontakte/android/TextFormatter;->processString(Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object v4

    move-object/from16 v0, v64

    move-object/from16 v1, p0

    move-object/from16 v2, v50

    invoke-direct {v0, v1, v4, v2}, Lcom/vkontakte/android/fragments/ProfileFragment$ContentTitleInfoItem;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;Ljava/lang/CharSequence;Ljava/lang/Runnable;)V

    .line 2444
    .local v64, "titleItem":Lcom/vkontakte/android/fragments/ProfileFragment$ContentTitleInfoItem;
    move-object/from16 v0, v50

    move-object/from16 v1, v64

    iput-object v0, v1, Lcom/vkontakte/android/fragments/ProfileFragment$ContentTitleInfoItem;->onButtonClick:Ljava/lang/Runnable;

    .line 2445
    const/4 v4, 0x2

    move-object/from16 v0, v64

    iput v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment$ContentTitleInfoItem;->backgroundType:I

    .line 2446
    const v4, 0x7f08068a

    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/vkontakte/android/fragments/ProfileFragment;->getString(I)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, v64

    iput-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment$ContentTitleInfoItem;->buttonText:Ljava/lang/String;

    .line 2447
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->infoItems:Ljava/util/ArrayList;

    move-object/from16 v0, v64

    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2448
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v4

    const v5, 0x7f0301d5

    const/4 v8, 0x0

    invoke-static {v4, v5, v8}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v42

    check-cast v42, Lme/grishka/appkit/views/UsableRecyclerView;

    .line 2449
    .local v42, "marketView":Lme/grishka/appkit/views/UsableRecyclerView;
    new-instance v33, Lcom/vkontakte/android/fragments/ProfileFragment$GoodsAdapter;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->goods:Lcom/vkontakte/android/data/VKList;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget v5, v5, Lcom/vkontakte/android/api/ExtendedUserProfile;->marketMainAlbumId:I

    move-object/from16 v0, v33

    move-object/from16 v1, p0

    move-object/from16 v2, v42

    invoke-direct {v0, v1, v4, v2, v5}, Lcom/vkontakte/android/fragments/ProfileFragment$GoodsAdapter;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;Ljava/util/List;Lme/grishka/appkit/views/UsableRecyclerView;I)V

    .line 2450
    .local v33, "goodsAdapter":Lcom/vkontakte/android/fragments/ProfileFragment$GoodsAdapter;
    new-instance v4, Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v5

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-direct {v4, v5, v8, v9}, Landroid/support/v7/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    move-object/from16 v0, v42

    invoke-virtual {v0, v4}, Lme/grishka/appkit/views/UsableRecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    .line 2451
    move-object/from16 v0, v42

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Lme/grishka/appkit/views/UsableRecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 2452
    const/4 v4, 0x0

    move-object/from16 v0, v42

    invoke-virtual {v0, v4}, Lme/grishka/appkit/views/UsableRecyclerView;->setClipToPadding(Z)V

    .line 2453
    new-instance v4, Lcom/vkontakte/android/fragments/ProfileFragment$17;

    move-object/from16 v0, p0

    invoke-direct {v4, v0}, Lcom/vkontakte/android/fragments/ProfileFragment$17;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;)V

    move-object/from16 v0, v42

    invoke-virtual {v0, v4}, Lme/grishka/appkit/views/UsableRecyclerView;->addItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    .line 2461
    new-instance v54, Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;

    .end local v54    # "photosItem":Lcom/vkontakte/android/fragments/ProfileFragment$InfoItem;
    move-object/from16 v0, v54

    move-object/from16 v1, p0

    move-object/from16 v2, v42

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;Landroid/view/View;)V

    .line 2462
    .restart local v54    # "photosItem":Lcom/vkontakte/android/fragments/ProfileFragment$InfoItem;
    const/4 v4, 0x4

    move-object/from16 v0, v54

    iput v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment$InfoItem;->backgroundType:I

    .line 2463
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->infoItems:Ljava/util/ArrayList;

    move-object/from16 v0, v54

    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2465
    .end local v33    # "goodsAdapter":Lcom/vkontakte/android/fragments/ProfileFragment$GoodsAdapter;
    .end local v42    # "marketView":Lme/grishka/appkit/views/UsableRecyclerView;
    .end local v47    # "numPhotos":I
    .end local v50    # "openMarket":Ljava/lang/Runnable;
    .end local v64    # "titleItem":Lcom/vkontakte/android/fragments/ProfileFragment$ContentTitleInfoItem;
    :cond_9f
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->counters:Ljava/util/HashMap;

    const-string/jumbo v5, "photos"

    invoke-virtual {v4, v5}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_a0

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    const-string/jumbo v5, "photos"

    invoke-virtual {v4, v5}, Lcom/vkontakte/android/api/ExtendedUserProfile;->getCounter(Ljava/lang/String;)I

    move-result v4

    if-lez v4, :cond_a0

    const/4 v4, 0x1

    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/vkontakte/android/fragments/ProfileFragment;->canShowMainSection(I)Z

    move-result v4

    if-eqz v4, :cond_a0

    .line 2466
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    const-string/jumbo v5, "photos"

    invoke-virtual {v4, v5}, Lcom/vkontakte/android/api/ExtendedUserProfile;->getCounter(Ljava/lang/String;)I

    move-result v47

    .line 2467
    .restart local v47    # "numPhotos":I
    invoke-static/range {p0 .. p0}, Lcom/vkontakte/android/fragments/ProfileFragment$$Lambda$24;->lambdaFactory$(Lcom/vkontakte/android/fragments/ProfileFragment;)Ljava/lang/Runnable;

    move-result-object v49

    .line 2469
    .local v49, "openAlbums":Ljava/lang/Runnable;
    move-object/from16 v0, p0

    iget v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    if-lez v4, :cond_a5

    .line 2470
    new-instance v64, Lcom/vkontakte/android/fragments/ProfileFragment$ContentTitleInfoItem;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const v5, 0x7f080550

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/vkontakte/android/fragments/ProfileFragment;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "  /cFF909499"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {}, Ljava/text/NumberFormat;->getInstance()Ljava/text/NumberFormat;

    move-result-object v5

    move/from16 v0, v47

    int-to-long v8, v0

    invoke-virtual {v5, v8, v9}, Ljava/text/NumberFormat;->format(J)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "/e"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/vkontakte/android/TextFormatter;->processString(Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object v4

    move-object/from16 v0, v64

    move-object/from16 v1, p0

    move-object/from16 v2, v49

    invoke-direct {v0, v1, v4, v2}, Lcom/vkontakte/android/fragments/ProfileFragment$ContentTitleInfoItem;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;Ljava/lang/CharSequence;Ljava/lang/Runnable;)V

    .line 2476
    .restart local v64    # "titleItem":Lcom/vkontakte/android/fragments/ProfileFragment$ContentTitleInfoItem;
    :goto_34
    const/4 v4, 0x2

    move-object/from16 v0, v64

    iput v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment$ContentTitleInfoItem;->backgroundType:I

    .line 2477
    const v4, 0x7f0800c8

    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/vkontakte/android/fragments/ProfileFragment;->getString(I)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, v64

    iput-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment$ContentTitleInfoItem;->buttonText:Ljava/lang/String;

    .line 2478
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->infoItems:Ljava/util/ArrayList;

    move-object/from16 v0, v64

    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2479
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v4

    const v5, 0x7f0301d7

    const/4 v8, 0x0

    invoke-static {v4, v5, v8}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v53

    check-cast v53, Lme/grishka/appkit/views/UsableRecyclerView;

    .line 2480
    .local v53, "photoFeedView":Lme/grishka/appkit/views/UsableRecyclerView;
    move-object/from16 v0, p0

    iget v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    if-gez v4, :cond_a6

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->mainAlbum:Lcom/vkontakte/android/api/PhotoAlbum;

    if-eqz v4, :cond_a6

    new-instance v52, Lcom/vkontakte/android/fragments/ProfileFragment$MainAlbumPhotoFeedAdapter;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->photos:Lcom/vkontakte/android/data/VKList;

    move-object/from16 v0, v52

    move-object/from16 v1, p0

    move-object/from16 v2, v53

    invoke-direct {v0, v1, v4, v2}, Lcom/vkontakte/android/fragments/ProfileFragment$MainAlbumPhotoFeedAdapter;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;Ljava/util/List;Lme/grishka/appkit/views/UsableRecyclerView;)V

    .line 2483
    .local v52, "photoFeedAdapter":Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedAdapter;
    :goto_35
    new-instance v4, Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v5

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-direct {v4, v5, v8, v9}, Landroid/support/v7/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    move-object/from16 v0, v53

    invoke-virtual {v0, v4}, Lme/grishka/appkit/views/UsableRecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    .line 2484
    move-object/from16 v0, v53

    move-object/from16 v1, v52

    invoke-virtual {v0, v1}, Lme/grishka/appkit/views/UsableRecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 2485
    const/4 v4, 0x0

    move-object/from16 v0, v53

    invoke-virtual {v0, v4}, Lme/grishka/appkit/views/UsableRecyclerView;->setClipToPadding(Z)V

    .line 2486
    new-instance v4, Lcom/vkontakte/android/fragments/ProfileFragment$18;

    move-object/from16 v0, p0

    invoke-direct {v4, v0}, Lcom/vkontakte/android/fragments/ProfileFragment$18;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;)V

    move-object/from16 v0, v53

    invoke-virtual {v0, v4}, Lme/grishka/appkit/views/UsableRecyclerView;->addItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    .line 2494
    new-instance v54, Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;

    .end local v54    # "photosItem":Lcom/vkontakte/android/fragments/ProfileFragment$InfoItem;
    move-object/from16 v0, v54

    move-object/from16 v1, p0

    move-object/from16 v2, v53

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;Landroid/view/View;)V

    .line 2495
    .restart local v54    # "photosItem":Lcom/vkontakte/android/fragments/ProfileFragment$InfoItem;
    const/4 v4, 0x4

    move-object/from16 v0, v54

    iput v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment$InfoItem;->backgroundType:I

    .line 2496
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->infoItems:Ljava/util/ArrayList;

    move-object/from16 v0, v54

    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2497
    new-instance v4, Landroid/support/v7/widget/RecyclerView$LayoutParams;

    const/4 v5, -0x1

    const/high16 v8, 0x42f00000    # 120.0f

    invoke-static {v8}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v8

    invoke-direct {v4, v5, v8}, Landroid/support/v7/widget/RecyclerView$LayoutParams;-><init>(II)V

    move-object/from16 v0, v53

    invoke-virtual {v0, v4}, Lme/grishka/appkit/views/UsableRecyclerView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 2499
    .end local v47    # "numPhotos":I
    .end local v49    # "openAlbums":Ljava/lang/Runnable;
    .end local v52    # "photoFeedAdapter":Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedAdapter;
    .end local v53    # "photoFeedView":Lme/grishka/appkit/views/UsableRecyclerView;
    .end local v64    # "titleItem":Lcom/vkontakte/android/fragments/ProfileFragment$ContentTitleInfoItem;
    :cond_a0
    const/4 v4, 0x4

    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/vkontakte/android/fragments/ProfileFragment;->canShowMainSection(I)Z

    move-result v4

    if-eqz v4, :cond_a1

    .line 2500
    new-instance v64, Lcom/vkontakte/android/fragments/ProfileFragment$ContentTitleInfoItem;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const v5, 0x7f08076e

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/vkontakte/android/fragments/ProfileFragment;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "  /cFF909499"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {}, Ljava/text/NumberFormat;->getInstance()Ljava/text/NumberFormat;

    move-result-object v5

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    const-string/jumbo v9, "videos"

    invoke-virtual {v8, v9}, Lcom/vkontakte/android/api/ExtendedUserProfile;->getCounter(Ljava/lang/String;)I

    move-result v8

    int-to-long v8, v8

    invoke-virtual {v5, v8, v9}, Ljava/text/NumberFormat;->format(J)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "/e"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/vkontakte/android/TextFormatter;->processString(Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object v4

    invoke-static/range {p0 .. p0}, Lcom/vkontakte/android/fragments/ProfileFragment$$Lambda$26;->lambdaFactory$(Lcom/vkontakte/android/fragments/ProfileFragment;)Ljava/lang/Runnable;

    move-result-object v5

    move-object/from16 v0, v64

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v4, v5}, Lcom/vkontakte/android/fragments/ProfileFragment$ContentTitleInfoItem;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;Ljava/lang/CharSequence;Ljava/lang/Runnable;)V

    .line 2502
    .restart local v64    # "titleItem":Lcom/vkontakte/android/fragments/ProfileFragment$ContentTitleInfoItem;
    const/4 v4, 0x2

    move-object/from16 v0, v64

    iput v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment$ContentTitleInfoItem;->backgroundType:I

    .line 2503
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->infoItems:Ljava/util/ArrayList;

    move-object/from16 v0, v64

    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2504
    new-instance v52, Lcom/vkontakte/android/fragments/ProfileFragment$VideoFeedAdapter;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->videos:Ljava/util/ArrayList;

    move-object/from16 v0, v52

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v4}, Lcom/vkontakte/android/fragments/ProfileFragment$VideoFeedAdapter;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;Ljava/util/List;)V

    .line 2505
    .local v52, "photoFeedAdapter":Lcom/vkontakte/android/fragments/ProfileFragment$VideoFeedAdapter;
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v4

    const v5, 0x7f0301d7

    const/4 v8, 0x0

    invoke-static {v4, v5, v8}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v31

    check-cast v31, Lme/grishka/appkit/views/UsableRecyclerView;

    .line 2506
    .local v31, "feedView":Lme/grishka/appkit/views/UsableRecyclerView;
    new-instance v4, Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v5

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-direct {v4, v5, v8, v9}, Landroid/support/v7/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    move-object/from16 v0, v31

    invoke-virtual {v0, v4}, Lme/grishka/appkit/views/UsableRecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    .line 2507
    move-object/from16 v0, v31

    move-object/from16 v1, v52

    invoke-virtual {v0, v1}, Lme/grishka/appkit/views/UsableRecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 2508
    const/4 v4, 0x1

    move-object/from16 v0, v31

    invoke-virtual {v0, v4}, Lme/grishka/appkit/views/UsableRecyclerView;->setDrawSelectorOnTop(Z)V

    .line 2509
    const/4 v4, 0x0

    move-object/from16 v0, v31

    invoke-virtual {v0, v4}, Lme/grishka/appkit/views/UsableRecyclerView;->setClipToPadding(Z)V

    .line 2510
    new-instance v4, Lcom/vkontakte/android/fragments/ProfileFragment$19;

    move-object/from16 v0, p0

    invoke-direct {v4, v0}, Lcom/vkontakte/android/fragments/ProfileFragment$19;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;)V

    move-object/from16 v0, v31

    invoke-virtual {v0, v4}, Lme/grishka/appkit/views/UsableRecyclerView;->addItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    .line 2518
    new-instance v54, Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;

    .end local v54    # "photosItem":Lcom/vkontakte/android/fragments/ProfileFragment$InfoItem;
    move-object/from16 v0, v54

    move-object/from16 v1, p0

    move-object/from16 v2, v31

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;Landroid/view/View;)V

    .line 2519
    .restart local v54    # "photosItem":Lcom/vkontakte/android/fragments/ProfileFragment$InfoItem;
    const/4 v4, 0x4

    move-object/from16 v0, v54

    iput v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment$InfoItem;->backgroundType:I

    .line 2520
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->infoItems:Ljava/util/ArrayList;

    move-object/from16 v0, v54

    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2521
    new-instance v4, Landroid/support/v7/widget/RecyclerView$LayoutParams;

    const/4 v5, -0x1

    const/high16 v8, 0x43200000    # 160.0f

    invoke-static {v8}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v8

    invoke-direct {v4, v5, v8}, Landroid/support/v7/widget/RecyclerView$LayoutParams;-><init>(II)V

    move-object/from16 v0, v31

    invoke-virtual {v0, v4}, Lme/grishka/appkit/views/UsableRecyclerView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 2523
    .end local v31    # "feedView":Lme/grishka/appkit/views/UsableRecyclerView;
    .end local v52    # "photoFeedAdapter":Lcom/vkontakte/android/fragments/ProfileFragment$VideoFeedAdapter;
    .end local v64    # "titleItem":Lcom/vkontakte/android/fragments/ProfileFragment$ContentTitleInfoItem;
    :cond_a1
    const/4 v4, 0x2

    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/vkontakte/android/fragments/ProfileFragment;->canShowMainSection(I)Z

    move-result v4

    if-eqz v4, :cond_a8

    .line 2524
    new-instance v64, Lcom/vkontakte/android/fragments/ProfileFragment$ContentTitleInfoItem;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const v5, 0x7f080717

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/vkontakte/android/fragments/ProfileFragment;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "  /cFF909499"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {}, Ljava/text/NumberFormat;->getInstance()Ljava/text/NumberFormat;

    move-result-object v5

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    const-string/jumbo v9, "topics"

    invoke-virtual {v8, v9}, Lcom/vkontakte/android/api/ExtendedUserProfile;->getCounter(Ljava/lang/String;)I

    move-result v8

    int-to-long v8, v8

    invoke-virtual {v5, v8, v9}, Ljava/text/NumberFormat;->format(J)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "/e"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/vkontakte/android/TextFormatter;->processString(Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object v4

    invoke-static/range {p0 .. p0}, Lcom/vkontakte/android/fragments/ProfileFragment$$Lambda$27;->lambdaFactory$(Lcom/vkontakte/android/fragments/ProfileFragment;)Ljava/lang/Runnable;

    move-result-object v5

    move-object/from16 v0, v64

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v4, v5}, Lcom/vkontakte/android/fragments/ProfileFragment$ContentTitleInfoItem;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;Ljava/lang/CharSequence;Ljava/lang/Runnable;)V

    .line 2526
    .restart local v64    # "titleItem":Lcom/vkontakte/android/fragments/ProfileFragment$ContentTitleInfoItem;
    const/4 v4, 0x2

    move-object/from16 v0, v64

    iput v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment$ContentTitleInfoItem;->backgroundType:I

    .line 2527
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->infoItems:Ljava/util/ArrayList;

    move-object/from16 v0, v64

    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2528
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->topics:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_36
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_a7

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v65

    check-cast v65, Lcom/vkontakte/android/api/BoardTopic;

    .line 2529
    .local v65, "topic":Lcom/vkontakte/android/api/BoardTopic;
    new-instance v40, Lcom/vkontakte/android/fragments/ProfileFragment$BoardTopicInfoItem;

    move-object/from16 v0, v40

    move-object/from16 v1, p0

    move-object/from16 v2, v65

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/fragments/ProfileFragment$BoardTopicInfoItem;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;Lcom/vkontakte/android/api/BoardTopic;)V

    .line 2530
    .local v40, "item":Lcom/vkontakte/android/fragments/ProfileFragment$BoardTopicInfoItem;
    const/4 v5, 0x1

    move-object/from16 v0, v40

    iput v5, v0, Lcom/vkontakte/android/fragments/ProfileFragment$BoardTopicInfoItem;->backgroundType:I

    .line 2531
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->infoItems:Ljava/util/ArrayList;

    move-object/from16 v0, v40

    invoke-virtual {v5, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2532
    move-object/from16 v54, v40

    .line 2533
    goto :goto_36

    .line 2414
    .end local v40    # "item":Lcom/vkontakte/android/fragments/ProfileFragment$BoardTopicInfoItem;
    .end local v54    # "photosItem":Lcom/vkontakte/android/fragments/ProfileFragment$InfoItem;
    .end local v64    # "titleItem":Lcom/vkontakte/android/fragments/ProfileFragment$ContentTitleInfoItem;
    .end local v65    # "topic":Lcom/vkontakte/android/api/BoardTopic;
    .restart local v36    # "i":I
    .restart local v57    # "prev":Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;
    :cond_a2
    const/4 v4, 0x4

    move-object/from16 v0, v57

    iput v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;->bgType:I

    goto/16 :goto_33

    .line 2417
    .end local v36    # "i":I
    .end local v57    # "prev":Lcom/vkontakte/android/fragments/ProfileFragment$DetailsItem;
    :cond_a3
    if-eqz v30, :cond_9c

    .line 2418
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->infoItems:Ljava/util/ArrayList;

    move-object/from16 v0, v30

    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 2419
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->infoItems:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    const/4 v5, 0x1

    if-ne v4, v5, :cond_a4

    .line 2420
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->infoItems:Ljava/util/ArrayList;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vkontakte/android/fragments/ProfileFragment$InfoItem;

    const/4 v5, 0x6

    iput v5, v4, Lcom/vkontakte/android/fragments/ProfileFragment$InfoItem;->backgroundType:I

    goto/16 :goto_33

    .line 2421
    :cond_a4
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->infoItems:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    const/4 v5, 0x1

    if-le v4, v5, :cond_9c

    .line 2422
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->infoItems:Ljava/util/ArrayList;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->infoItems:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vkontakte/android/fragments/ProfileFragment$InfoItem;

    const/4 v5, 0x4

    iput v5, v4, Lcom/vkontakte/android/fragments/ProfileFragment$InfoItem;->backgroundType:I

    goto/16 :goto_33

    .line 2472
    .restart local v47    # "numPhotos":I
    .restart local v49    # "openAlbums":Ljava/lang/Runnable;
    .restart local v54    # "photosItem":Lcom/vkontakte/android/fragments/ProfileFragment$InfoItem;
    :cond_a5
    new-instance v64, Lcom/vkontakte/android/fragments/ProfileFragment$ContentTitleInfoItem;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v5, v5, Lcom/vkontakte/android/api/ExtendedUserProfile;->mainAlbum:Lcom/vkontakte/android/api/PhotoAlbum;

    iget-object v5, v5, Lcom/vkontakte/android/api/PhotoAlbum;->title:Ljava/lang/String;

    invoke-static {v5}, Lcom/vkontakte/android/TextFormatter;->escape(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "  /cFF909499"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {}, Ljava/text/NumberFormat;->getInstance()Ljava/text/NumberFormat;

    move-result-object v5

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v8, v8, Lcom/vkontakte/android/api/ExtendedUserProfile;->mainAlbum:Lcom/vkontakte/android/api/PhotoAlbum;

    iget v8, v8, Lcom/vkontakte/android/api/PhotoAlbum;->numPhotos:I

    int-to-long v8, v8

    invoke-virtual {v5, v8, v9}, Ljava/text/NumberFormat;->format(J)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "/e"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/vkontakte/android/TextFormatter;->processString(Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object v4

    invoke-static/range {p0 .. p0}, Lcom/vkontakte/android/fragments/ProfileFragment$$Lambda$25;->lambdaFactory$(Lcom/vkontakte/android/fragments/ProfileFragment;)Ljava/lang/Runnable;

    move-result-object v5

    move-object/from16 v0, v64

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v4, v5}, Lcom/vkontakte/android/fragments/ProfileFragment$ContentTitleInfoItem;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;Ljava/lang/CharSequence;Ljava/lang/Runnable;)V

    .line 2474
    .restart local v64    # "titleItem":Lcom/vkontakte/android/fragments/ProfileFragment$ContentTitleInfoItem;
    move-object/from16 v0, v49

    move-object/from16 v1, v64

    iput-object v0, v1, Lcom/vkontakte/android/fragments/ProfileFragment$ContentTitleInfoItem;->onButtonClick:Ljava/lang/Runnable;

    goto/16 :goto_34

    .line 2480
    .restart local v53    # "photoFeedView":Lme/grishka/appkit/views/UsableRecyclerView;
    :cond_a6
    new-instance v52, Lcom/vkontakte/android/fragments/ProfileFragment$AllPhotosPhotoFeedAdapter;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->photos:Lcom/vkontakte/android/data/VKList;

    move-object/from16 v0, v52

    move-object/from16 v1, p0

    move-object/from16 v2, v53

    invoke-direct {v0, v1, v4, v2}, Lcom/vkontakte/android/fragments/ProfileFragment$AllPhotosPhotoFeedAdapter;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;Ljava/util/List;Lme/grishka/appkit/views/UsableRecyclerView;)V

    goto/16 :goto_35

    .line 2534
    .end local v47    # "numPhotos":I
    .end local v49    # "openAlbums":Ljava/lang/Runnable;
    .end local v53    # "photoFeedView":Lme/grishka/appkit/views/UsableRecyclerView;
    :cond_a7
    if-eqz v54, :cond_a8

    .line 2535
    const/4 v4, 0x4

    move-object/from16 v0, v54

    iput v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment$InfoItem;->backgroundType:I

    .line 2538
    .end local v64    # "titleItem":Lcom/vkontakte/android/fragments/ProfileFragment$ContentTitleInfoItem;
    :cond_a8
    const/4 v4, 0x3

    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/vkontakte/android/fragments/ProfileFragment;->canShowMainSection(I)Z

    move-result v4

    if-eqz v4, :cond_ab

    .line 2539
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->playlists:Ljava/util/ArrayList;

    if-eqz v4, :cond_a9

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->playlists:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_b8

    .line 2540
    :cond_a9
    new-instance v64, Lcom/vkontakte/android/fragments/ProfileFragment$ContentTitleInfoItem;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const v5, 0x7f08039c

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/vkontakte/android/fragments/ProfileFragment;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "  /cFF909499"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 2541
    invoke-static {}, Ljava/text/NumberFormat;->getInstance()Ljava/text/NumberFormat;

    move-result-object v5

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    const-string/jumbo v9, "audios"

    invoke-virtual {v8, v9}, Lcom/vkontakte/android/api/ExtendedUserProfile;->getCounter(Ljava/lang/String;)I

    move-result v8

    int-to-long v8, v8

    invoke-virtual {v5, v8, v9}, Ljava/text/NumberFormat;->format(J)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "/e"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 2540
    invoke-static {v4}, Lcom/vkontakte/android/TextFormatter;->processString(Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object v4

    invoke-static/range {p0 .. p0}, Lcom/vkontakte/android/fragments/ProfileFragment$$Lambda$28;->lambdaFactory$(Lcom/vkontakte/android/fragments/ProfileFragment;)Ljava/lang/Runnable;

    move-result-object v5

    move-object/from16 v0, v64

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v4, v5}, Lcom/vkontakte/android/fragments/ProfileFragment$ContentTitleInfoItem;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;Ljava/lang/CharSequence;Ljava/lang/Runnable;)V

    .line 2543
    .restart local v64    # "titleItem":Lcom/vkontakte/android/fragments/ProfileFragment$ContentTitleInfoItem;
    const/4 v4, 0x2

    move-object/from16 v0, v64

    iput v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment$ContentTitleInfoItem;->backgroundType:I

    .line 2544
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->infoItems:Ljava/util/ArrayList;

    move-object/from16 v0, v64

    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2545
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->audios:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_37
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_aa

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Lcom/vkontakte/android/audio/MusicTrack;

    .line 2546
    .local v20, "audio":Lcom/vkontakte/android/audio/MusicTrack;
    new-instance v40, Lcom/vkontakte/android/fragments/ProfileFragment$AudioInfoItem;

    move-object/from16 v0, v40

    move-object/from16 v1, p0

    move-object/from16 v2, v20

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/fragments/ProfileFragment$AudioInfoItem;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;Lcom/vkontakte/android/audio/MusicTrack;)V

    .line 2547
    .local v40, "item":Lcom/vkontakte/android/fragments/ProfileFragment$AudioInfoItem;
    const/4 v5, 0x1

    move-object/from16 v0, v40

    iput v5, v0, Lcom/vkontakte/android/fragments/ProfileFragment$AudioInfoItem;->backgroundType:I

    .line 2548
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->infoItems:Ljava/util/ArrayList;

    move-object/from16 v0, v40

    invoke-virtual {v5, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2549
    move-object/from16 v54, v40

    .line 2550
    goto :goto_37

    .line 2551
    .end local v20    # "audio":Lcom/vkontakte/android/audio/MusicTrack;
    .end local v40    # "item":Lcom/vkontakte/android/fragments/ProfileFragment$AudioInfoItem;
    :cond_aa
    if-eqz v54, :cond_ab

    .line 2552
    const/4 v4, 0x4

    move-object/from16 v0, v54

    iput v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment$InfoItem;->backgroundType:I

    .line 2582
    .end local v64    # "titleItem":Lcom/vkontakte/android/fragments/ProfileFragment$ContentTitleInfoItem;
    :cond_ab
    :goto_38
    new-instance v4, Landroid/widget/LinearLayout;

    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v5

    invoke-direct {v4, v5}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->countersWrap:Landroid/widget/LinearLayout;

    .line 2583
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->countersWrap:Landroid/widget/LinearLayout;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 2584
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->countersWrap:Landroid/widget/LinearLayout;

    const/high16 v5, 0x41000000    # 8.0f

    invoke-static {v5}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v5

    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v9, 0x7f090028

    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v8

    add-int/2addr v5, v8

    const/high16 v8, 0x41000000    # 8.0f

    .line 2585
    invoke-static {v8}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v8

    const/high16 v9, 0x41000000    # 8.0f

    invoke-static {v9}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v9

    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    const v11, 0x7f090028

    invoke-virtual {v10, v11}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v10

    add-int/2addr v9, v10

    const/high16 v10, 0x41400000    # 12.0f

    invoke-static {v10}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v10

    .line 2584
    invoke-virtual {v4, v5, v8, v9, v10}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 2586
    new-instance v27, Landroid/widget/HorizontalScrollView;

    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v4

    move-object/from16 v0, v27

    invoke-direct {v0, v4}, Landroid/widget/HorizontalScrollView;-><init>(Landroid/content/Context;)V

    .line 2587
    .local v27, "countersScroll":Landroid/widget/HorizontalScrollView;
    const v4, 0x7f10006f

    move-object/from16 v0, v27

    invoke-virtual {v0, v4}, Landroid/widget/HorizontalScrollView;->setId(I)V

    .line 2588
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->countersWrap:Landroid/widget/LinearLayout;

    move-object/from16 v0, v27

    invoke-virtual {v0, v4}, Landroid/widget/HorizontalScrollView;->addView(Landroid/view/View;)V

    .line 2589
    const/4 v4, 0x0

    move-object/from16 v0, v27

    invoke-virtual {v0, v4}, Landroid/widget/HorizontalScrollView;->setHorizontalScrollBarEnabled(Z)V

    .line 2590
    new-instance v69, Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;

    move-object/from16 v0, v69

    move-object/from16 v1, p0

    move-object/from16 v2, v27

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;Landroid/view/View;)V

    .line 2591
    .restart local v69    # "vii":Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;
    const/4 v4, 0x4

    move-object/from16 v0, v69

    iput v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;->backgroundType:I

    .line 2592
    move-object/from16 v0, v69

    iget v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;->backgroundType:I

    or-int/lit8 v4, v4, 0x2

    move-object/from16 v0, v69

    iput v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;->backgroundType:I

    .line 2594
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    invoke-virtual {v4}, Lcom/vkontakte/android/api/ExtendedUserProfile;->hasWidget()Z

    move-result v4

    if-eqz v4, :cond_b9

    .line 2595
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->widget:Lcom/vkontakte/android/api/widget/Widget;

    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/vkontakte/android/api/widget/Widget;->createContentView(Landroid/content/Context;)Landroid/view/View;

    move-result-object v72

    .line 2596
    .local v72, "widgetView":Landroid/view/View;
    const v4, 0x7f100079

    move-object/from16 v0, v72

    invoke-virtual {v0, v4}, Landroid/view/View;->setId(I)V

    .line 2597
    new-instance v71, Lcom/vkontakte/android/fragments/ProfileFragment$20;

    move-object/from16 v0, v71

    move-object/from16 v1, p0

    move-object/from16 v2, v72

    move-object/from16 v3, v72

    invoke-direct {v0, v1, v2, v3}, Lcom/vkontakte/android/fragments/ProfileFragment$20;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;Landroid/view/View;Landroid/view/View;)V

    .line 2608
    .local v71, "widgetItem":Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;
    const/4 v4, 0x4

    move-object/from16 v0, v71

    iput v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;->backgroundType:I

    .line 2609
    move-object/from16 v0, v71

    iget v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;->backgroundType:I

    or-int/lit8 v4, v4, 0x2

    move-object/from16 v0, v71

    iput v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;->backgroundType:I

    .line 2610
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->infoItems:Ljava/util/ArrayList;

    move-object/from16 v0, v71

    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2619
    .end local v71    # "widgetItem":Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;
    .end local v72    # "widgetView":Landroid/view/View;
    :cond_ac
    :goto_39
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-boolean v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->canPost:Z

    if-eqz v4, :cond_ad

    move-object/from16 v0, p0

    iget v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v5

    invoke-virtual {v5}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v5

    if-eq v4, v5, :cond_ad

    .line 2620
    invoke-direct/range {p0 .. p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->addButtonsItem()V

    .line 2623
    :cond_ad
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v4

    invoke-virtual {v4}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v4

    if-lez v4, :cond_ae

    move-object/from16 v0, p0

    iget v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    if-gez v4, :cond_ae

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->groupType:I

    const/4 v5, 0x2

    if-ne v4, v5, :cond_ae

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-boolean v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->canPost:Z

    if-nez v4, :cond_ae

    .line 2624
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v4

    const v5, 0x7f0301d9

    const/4 v8, 0x0

    invoke-static {v4, v5, v8}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v22

    .line 2625
    .local v22, "btns":Landroid/view/View;
    new-instance v23, Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;

    move-object/from16 v0, v23

    move-object/from16 v1, p0

    move-object/from16 v2, v22

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;Landroid/view/View;)V

    .line 2626
    .local v23, "btnsItem":Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;
    const/4 v4, 0x6

    move-object/from16 v0, v23

    iput v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;->backgroundType:I

    .line 2627
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->infoItems:Ljava/util/ArrayList;

    move-object/from16 v0, v23

    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2628
    const v4, 0x7f1004fd

    move-object/from16 v0, v22

    invoke-virtual {v0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    const v5, 0x7f080580

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(I)V

    .line 2629
    const v4, 0x7f1004fc

    move-object/from16 v0, v22

    invoke-virtual {v0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    invoke-static/range {p0 .. p0}, Lcom/vkontakte/android/fragments/ProfileFragment$$Lambda$32;->lambdaFactory$(Lcom/vkontakte/android/fragments/ProfileFragment;)Landroid/view/View$OnClickListener;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 2630
    const v4, 0x7f1004fe

    move-object/from16 v0, v22

    invoke-virtual {v0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    const/16 v5, 0x8

    invoke-virtual {v4, v5}, Landroid/view/View;->setVisibility(I)V

    .line 2633
    .end local v22    # "btns":Landroid/view/View;
    .end local v23    # "btnsItem":Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;
    :cond_ae
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->ban:Lcom/vkontakte/android/api/ExtendedUserProfile$BanInfo;

    if-eqz v4, :cond_b5

    move-object/from16 v0, p0

    iget v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    if-gez v4, :cond_b5

    .line 2634
    new-instance v63, Ljava/lang/StringBuilder;

    const v4, 0x7f080116

    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/vkontakte/android/fragments/ProfileFragment;->getString(I)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, v63

    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 2635
    .local v63, "text":Ljava/lang/StringBuilder;
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->ban:Lcom/vkontakte/android/api/ExtendedUserProfile$BanInfo;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile$BanInfo;->comment:Ljava/lang/String;

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_af

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->ban:Lcom/vkontakte/android/api/ExtendedUserProfile$BanInfo;

    iget v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile$BanInfo;->endTime:I

    if-nez v4, :cond_af

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->ban:Lcom/vkontakte/android/api/ExtendedUserProfile$BanInfo;

    iget v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile$BanInfo;->reason:I

    if-eqz v4, :cond_b4

    .line 2636
    :cond_af
    const-string/jumbo v4, "\n\n"

    move-object/from16 v0, v63

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2637
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->ban:Lcom/vkontakte/android/api/ExtendedUserProfile$BanInfo;

    iget v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile$BanInfo;->reason:I

    if-eqz v4, :cond_b0

    .line 2638
    const-string/jumbo v4, "/m"

    move-object/from16 v0, v63

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const v5, 0x7f0802ad

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/vkontakte/android/fragments/ProfileFragment;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, ":/e "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v8, 0x7f0c000c

    invoke-virtual {v5, v8}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v8, v8, Lcom/vkontakte/android/api/ExtendedUserProfile;->ban:Lcom/vkontakte/android/api/ExtendedUserProfile$BanInfo;

    iget v8, v8, Lcom/vkontakte/android/api/ExtendedUserProfile$BanInfo;->reason:I

    aget-object v5, v5, v8

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2640
    :cond_b0
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->ban:Lcom/vkontakte/android/api/ExtendedUserProfile$BanInfo;

    iget v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile$BanInfo;->endTime:I

    if-eqz v4, :cond_b2

    .line 2641
    invoke-virtual/range {v63 .. v63}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    move-object/from16 v0, v63

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v4

    const/16 v5, 0xa

    if-eq v4, v5, :cond_b1

    .line 2642
    const/16 v4, 0xa

    move-object/from16 v0, v63

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 2644
    :cond_b1
    const-string/jumbo v4, "/m"

    move-object/from16 v0, v63

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const v5, 0x7f0802aa

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/vkontakte/android/fragments/ProfileFragment;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, ":/e "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v5, v5, Lcom/vkontakte/android/api/ExtendedUserProfile;->ban:Lcom/vkontakte/android/api/ExtendedUserProfile$BanInfo;

    iget v5, v5, Lcom/vkontakte/android/api/ExtendedUserProfile$BanInfo;->endTime:I

    invoke-static {v5}, Lcom/vkontakte/android/TimeUtils;->langDate(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2646
    :cond_b2
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->ban:Lcom/vkontakte/android/api/ExtendedUserProfile$BanInfo;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile$BanInfo;->comment:Ljava/lang/String;

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_b4

    .line 2647
    invoke-virtual/range {v63 .. v63}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    move-object/from16 v0, v63

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v4

    const/16 v5, 0xa

    if-eq v4, v5, :cond_b3

    .line 2648
    const/16 v4, 0xa

    move-object/from16 v0, v63

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 2650
    :cond_b3
    const-string/jumbo v4, "/m"

    move-object/from16 v0, v63

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const v5, 0x7f0802a7

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/vkontakte/android/fragments/ProfileFragment;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, ":/e "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v5, v5, Lcom/vkontakte/android/api/ExtendedUserProfile;->ban:Lcom/vkontakte/android/api/ExtendedUserProfile$BanInfo;

    iget-object v5, v5, Lcom/vkontakte/android/api/ExtendedUserProfile$BanInfo;->comment:Ljava/lang/String;

    invoke-static {v5}, Lcom/vkontakte/android/TextFormatter;->escape(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2653
    :cond_b4
    invoke-virtual/range {v63 .. v63}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/vkontakte/android/TextFormatter;->processString(Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object v4

    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/vkontakte/android/fragments/ProfileFragment;->createTextItem(Ljava/lang/CharSequence;)Landroid/view/View;

    move-result-object v68

    .line 2654
    .restart local v68    # "view":Landroid/view/View;
    new-instance v67, Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;

    move-object/from16 v0, v67

    move-object/from16 v1, p0

    move-object/from16 v2, v68

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;Landroid/view/View;)V

    .line 2655
    .local v67, "vi":Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;
    const/4 v4, 0x6

    move-object/from16 v0, v67

    iput v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;->backgroundType:I

    .line 2656
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->infoItems:Ljava/util/ArrayList;

    move-object/from16 v0, v67

    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2659
    .end local v63    # "text":Ljava/lang/StringBuilder;
    .end local v67    # "vi":Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;
    .end local v68    # "view":Landroid/view/View;
    :cond_b5
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->ban:Lcom/vkontakte/android/api/ExtendedUserProfile$BanInfo;

    if-eqz v4, :cond_b6

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->ban:Lcom/vkontakte/android/api/ExtendedUserProfile$BanInfo;

    iget v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile$BanInfo;->endTime:I

    if-lez v4, :cond_b7

    :cond_b6
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    invoke-virtual {v4}, Lcom/vkontakte/android/api/ExtendedUserProfile;->isDeactivated()Z

    move-result v4

    if-nez v4, :cond_b7

    .line 2660
    new-instance v4, Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->selector:Landroid/view/View;

    move-object/from16 v0, p0

    invoke-direct {v4, v0, v5}, Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;Landroid/view/View;)V

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->selectorItem:Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;

    .line 2661
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->selectorItem:Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;

    const/4 v5, 0x2

    iput v5, v4, Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;->backgroundType:I

    .line 2662
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->infoItems:Ljava/util/ArrayList;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->selectorItem:Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2665
    :cond_b7
    invoke-direct/range {p0 .. p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->updatePostsButtons()V

    .line 2666
    return-void

    .line 2555
    .end local v27    # "countersScroll":Landroid/widget/HorizontalScrollView;
    .end local v69    # "vii":Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;
    :cond_b8
    new-instance v64, Lcom/vkontakte/android/fragments/ProfileFragment$ContentTitleInfoItem;

    const v4, 0x7f08039c

    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/vkontakte/android/fragments/ProfileFragment;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/vkontakte/android/TextFormatter;->processString(Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object v4

    invoke-static/range {p0 .. p0}, Lcom/vkontakte/android/fragments/ProfileFragment$$Lambda$29;->lambdaFactory$(Lcom/vkontakte/android/fragments/ProfileFragment;)Ljava/lang/Runnable;

    move-result-object v5

    move-object/from16 v0, v64

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v4, v5}, Lcom/vkontakte/android/fragments/ProfileFragment$ContentTitleInfoItem;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;Ljava/lang/CharSequence;Ljava/lang/Runnable;)V

    .line 2557
    .restart local v64    # "titleItem":Lcom/vkontakte/android/fragments/ProfileFragment$ContentTitleInfoItem;
    const/4 v4, 0x2

    move-object/from16 v0, v64

    iput v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment$ContentTitleInfoItem;->backgroundType:I

    .line 2558
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->infoItems:Ljava/util/ArrayList;

    move-object/from16 v0, v64

    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2560
    new-instance v4, Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v5

    invoke-virtual {v5}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v5

    invoke-direct {v4, v5}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;-><init>(Landroid/view/LayoutInflater;)V

    const v5, 0x7f030142

    .line 2561
    invoke-virtual {v4, v5}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->layout(I)Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    move-result-object v4

    new-instance v5, Lcom/vk/music/view/adapter/HorizontalPlaylistBinder;

    invoke-direct {v5}, Lcom/vk/music/view/adapter/HorizontalPlaylistBinder;-><init>()V

    .line 2562
    invoke-virtual {v4, v5}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->binder(Lcom/vk/music/view/adapter/ItemViewHolder$Binder;)Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    move-result-object v4

    invoke-static {}, Lcom/vkontakte/android/fragments/ProfileFragment$$Lambda$30;->lambdaFactory$()Lcom/vk/music/view/adapter/ItemViewHolder$ClickListener;

    move-result-object v5

    .line 2563
    invoke-virtual {v4, v5}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->registerClickListener(Lcom/vk/music/view/adapter/ItemViewHolder$ClickListener;)Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    move-result-object v4

    invoke-static {}, Lcom/vkontakte/android/fragments/ProfileFragment$$Lambda$31;->lambdaFactory$()Lcom/vk/music/view/adapter/IdResolver;

    move-result-object v5

    .line 2565
    invoke-virtual {v4, v5}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->resolver(Lcom/vk/music/view/adapter/IdResolver;)Lcom/vk/music/view/adapter/ItemAdapter$Builder;

    move-result-object v4

    .line 2566
    invoke-virtual {v4}, Lcom/vk/music/view/adapter/ItemAdapter$Builder;->build()Lcom/vk/music/view/adapter/ItemAdapter;

    move-result-object v56

    .line 2567
    .local v56, "playlistsAdapter":Lcom/vk/music/view/adapter/ItemAdapter;, "Lcom/vk/music/view/adapter/ItemAdapter<Lcom/vk/music/dto/Playlist;>;"
    const/4 v4, 0x1

    move-object/from16 v0, v56

    invoke-virtual {v0, v4}, Lcom/vk/music/view/adapter/ItemAdapter;->setHasStableIds(Z)V

    .line 2569
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v4

    const v5, 0x7f0301d8

    const/4 v8, 0x0

    invoke-static {v4, v5, v8}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v55

    check-cast v55, Landroid/support/v7/widget/RecyclerView;

    .line 2570
    .local v55, "playlistRecyclerView":Landroid/support/v7/widget/RecyclerView;
    const/4 v4, 0x1

    move-object/from16 v0, v55

    invoke-virtual {v0, v4}, Landroid/support/v7/widget/RecyclerView;->setHasFixedSize(Z)V

    .line 2571
    new-instance v4, Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v5

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-direct {v4, v5, v8, v9}, Landroid/support/v7/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    move-object/from16 v0, v55

    invoke-virtual {v0, v4}, Landroid/support/v7/widget/RecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    .line 2572
    invoke-virtual/range {v55 .. v56}, Landroid/support/v7/widget/RecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 2573
    const/4 v4, 0x0

    move-object/from16 v0, v55

    invoke-virtual {v0, v4}, Landroid/support/v7/widget/RecyclerView;->setNestedScrollingEnabled(Z)V

    .line 2575
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->playlists:Ljava/util/ArrayList;

    move-object/from16 v0, v56

    invoke-virtual {v0, v4}, Lcom/vk/music/view/adapter/ItemAdapter;->setItems(Ljava/util/Collection;)V

    .line 2577
    new-instance v54, Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;

    .end local v54    # "photosItem":Lcom/vkontakte/android/fragments/ProfileFragment$InfoItem;
    move-object/from16 v0, v54

    move-object/from16 v1, p0

    move-object/from16 v2, v55

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;Landroid/view/View;)V

    .line 2578
    .restart local v54    # "photosItem":Lcom/vkontakte/android/fragments/ProfileFragment$InfoItem;
    const/4 v4, 0x4

    move-object/from16 v0, v54

    iput v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment$InfoItem;->backgroundType:I

    .line 2579
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->infoItems:Ljava/util/ArrayList;

    move-object/from16 v0, v54

    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_38

    .line 2611
    .end local v55    # "playlistRecyclerView":Landroid/support/v7/widget/RecyclerView;
    .end local v56    # "playlistsAdapter":Lcom/vk/music/view/adapter/ItemAdapter;, "Lcom/vk/music/view/adapter/ItemAdapter<Lcom/vk/music/dto/Playlist;>;"
    .end local v64    # "titleItem":Lcom/vkontakte/android/fragments/ProfileFragment$ContentTitleInfoItem;
    .restart local v27    # "countersScroll":Landroid/widget/HorizontalScrollView;
    .restart local v69    # "vii":Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;
    :cond_b9
    invoke-direct/range {p0 .. p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->updateCounters()Z

    move-result v4

    if-eqz v4, :cond_ba

    .line 2612
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->infoItems:Ljava/util/ArrayList;

    move-object/from16 v0, v69

    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_39

    .line 2614
    :cond_ba
    if-eqz v54, :cond_ac

    .line 2615
    const/4 v4, 0x4

    move-object/from16 v0, v54

    iput v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment$InfoItem;->backgroundType:I

    goto/16 :goto_39
.end method

.method private canShowMainSection(I)Z
    .locals 4
    .param p1, "section"    # I

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 2688
    if-ne p1, v0, :cond_2

    iget v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    if-lez v2, :cond_2

    .line 2689
    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-boolean v2, v2, Lcom/vkontakte/android/api/ExtendedUserProfile;->allPhotosAreHidden:Z

    if-nez v2, :cond_1

    .line 2706
    :cond_0
    :goto_0
    return v0

    :cond_1
    move v0, v1

    .line 2689
    goto :goto_0

    .line 2691
    :cond_2
    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget v2, v2, Lcom/vkontakte/android/api/ExtendedUserProfile;->mainSection:I

    if-ne v2, p1, :cond_3

    iget v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    if-gtz v2, :cond_3

    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    invoke-virtual {v2}, Lcom/vkontakte/android/api/ExtendedUserProfile;->hasWidget()Z

    move-result v2

    if-eqz v2, :cond_4

    :cond_3
    move v0, v1

    .line 2692
    goto :goto_0

    .line 2694
    :cond_4
    packed-switch p1, :pswitch_data_0

    move v0, v1

    .line 2706
    goto :goto_0

    .line 2696
    :pswitch_0
    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    const-string/jumbo v3, "audios"

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/api/ExtendedUserProfile;->getCounter(Ljava/lang/String;)I

    move-result v2

    if-gtz v2, :cond_0

    move v0, v1

    goto :goto_0

    .line 2698
    :pswitch_1
    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    const-string/jumbo v3, "topics"

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/api/ExtendedUserProfile;->getCounter(Ljava/lang/String;)I

    move-result v2

    if-gtz v2, :cond_0

    move v0, v1

    goto :goto_0

    .line 2700
    :pswitch_2
    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    const-string/jumbo v3, "photos"

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/api/ExtendedUserProfile;->getCounter(Ljava/lang/String;)I

    move-result v2

    if-gtz v2, :cond_0

    move v0, v1

    goto :goto_0

    .line 2702
    :pswitch_3
    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    const-string/jumbo v3, "videos"

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/api/ExtendedUserProfile;->getCounter(Ljava/lang/String;)I

    move-result v2

    if-gtz v2, :cond_0

    move v0, v1

    goto :goto_0

    .line 2704
    :pswitch_4
    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    const-string/jumbo v3, "market"

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/api/ExtendedUserProfile;->getCounter(Ljava/lang/String;)I

    move-result v2

    if-gtz v2, :cond_0

    move v0, v1

    goto :goto_0

    .line 2694
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method

.method private copyLink()V
    .locals 4

    .prologue
    .line 3144
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    if-nez v1, :cond_0

    .line 3150
    :goto_0
    return-void

    .line 3147
    :cond_0
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const-string/jumbo v2, "clipboard"

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/text/ClipboardManager;

    .line 3148
    .local v0, "cm":Landroid/text/ClipboardManager;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "https://vk.com/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v2, v2, Lcom/vkontakte/android/api/ExtendedUserProfile;->screenName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/text/ClipboardManager;->setText(Ljava/lang/CharSequence;)V

    .line 3149
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const v2, 0x7f080339

    const/4 v3, 0x0

    invoke-static {v1, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    goto :goto_0
.end method

.method private createBackgroundImageView(Ljava/lang/String;I)Landroid/view/View;
    .locals 6
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "placeholderResId"    # I

    .prologue
    const/high16 v5, 0x40000000    # 2.0f

    .line 1315
    new-instance v0, Lcom/vk/imageloader/view/VKImageView;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vk/imageloader/view/VKImageView;-><init>(Landroid/content/Context;)V

    .line 1316
    .local v0, "imageView":Lcom/vk/imageloader/view/VKImageView;
    invoke-virtual {v0}, Lcom/vk/imageloader/view/VKImageView;->getHierarchy()Lcom/facebook/drawee/interfaces/DraweeHierarchy;

    move-result-object v1

    check-cast v1, Lcom/facebook/drawee/generic/GenericDraweeHierarchy;

    invoke-static {v5}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v2

    int-to-float v2, v2

    invoke-static {v5}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v3

    int-to-float v3, v3

    invoke-static {v5}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v4

    int-to-float v4, v4

    invoke-static {v5}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v5

    int-to-float v5, v5

    invoke-static {v2, v3, v4, v5}, Lcom/facebook/drawee/generic/RoundingParams;->fromCornersRadii(FFFF)Lcom/facebook/drawee/generic/RoundingParams;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/facebook/drawee/generic/GenericDraweeHierarchy;->setRoundingParams(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 1317
    invoke-virtual {v0, p2}, Lcom/vk/imageloader/view/VKImageView;->setPlaceholderImage(I)V

    .line 1318
    invoke-virtual {v0, p1}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    .line 1319
    return-object v0
.end method

.method private createBackgroundLayerImageView(Ljava/util/List;)Landroid/view/View;
    .locals 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Landroid/view/View;"
        }
    .end annotation

    .prologue
    .line 1332
    .local p1, "_images":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    new-instance v1, Lcom/vk/imageloader/view/VKLayerImageView;

    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    const/4 v4, 0x6

    invoke-direct {v1, v3, v4}, Lcom/vk/imageloader/view/VKLayerImageView;-><init>(Landroid/content/Context;I)V

    .line 1333
    .local v1, "layerImageView":Lcom/vk/imageloader/view/VKLayerImageView;
    const v3, -0x191715

    invoke-virtual {v1, v3}, Lcom/vk/imageloader/view/VKLayerImageView;->setLayerPlaceholders(I)V

    .line 1335
    new-instance v13, Ljava/util/ArrayList;

    invoke-direct {v13}, Ljava/util/ArrayList;-><init>()V

    .line 1336
    .local v13, "images":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    move-object/from16 v0, p1

    invoke-virtual {v13, v0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 1337
    :goto_0
    invoke-virtual {v13}, Ljava/util/ArrayList;->size()I

    move-result v3

    const/4 v4, 0x6

    if-ge v3, v4, :cond_0

    .line 1338
    const/4 v3, 0x0

    invoke-virtual {v13, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 1341
    :cond_0
    const/high16 v3, 0x42280000    # 42.0f

    invoke-static {v3}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v15

    .line 1342
    .local v15, "photoSize":I
    const/high16 v3, 0x40000000    # 2.0f

    invoke-static {v3}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v14

    .line 1343
    .local v14, "padding":I
    add-int v6, v15, v14

    .line 1344
    .local v6, "sizeWithPad":I
    const/4 v2, 0x0

    .local v2, "j":I
    :goto_1
    invoke-virtual {v13}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v2, v3, :cond_8

    .line 1345
    packed-switch v2, :pswitch_data_0

    .line 1365
    :goto_2
    invoke-virtual {v13, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_3

    .line 1366
    if-eqz v2, :cond_1

    const/4 v3, 0x2

    if-eq v2, v3, :cond_1

    const/4 v3, 0x3

    if-eq v2, v3, :cond_1

    const/4 v3, 0x5

    if-ne v2, v3, :cond_7

    .line 1367
    :cond_1
    if-nez v2, :cond_4

    .line 1368
    const/high16 v3, 0x40000000    # 2.0f

    invoke-static {v3}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v9

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    move-object v7, v1

    move v8, v2

    invoke-virtual/range {v7 .. v12}, Lcom/vk/imageloader/view/VKLayerImageView;->setLayerCorners(IIIII)V

    .line 1379
    :cond_2
    :goto_3
    invoke-virtual {v13, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Lcom/vk/imageloader/view/VKLayerImageView;->load(ILjava/lang/String;)V

    .line 1344
    :cond_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 1347
    :pswitch_0
    const/4 v3, 0x0

    const/4 v4, 0x0

    mul-int/lit8 v5, v6, 0x2

    invoke-virtual/range {v1 .. v6}, Lcom/vk/imageloader/view/VKLayerImageView;->setLayerInset(IIIII)V

    goto :goto_2

    .line 1350
    :pswitch_1
    const/4 v4, 0x0

    move v3, v6

    move v5, v6

    invoke-virtual/range {v1 .. v6}, Lcom/vk/imageloader/view/VKLayerImageView;->setLayerInset(IIIII)V

    goto :goto_2

    .line 1353
    :pswitch_2
    mul-int/lit8 v3, v6, 0x2

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v1 .. v6}, Lcom/vk/imageloader/view/VKLayerImageView;->setLayerInset(IIIII)V

    goto :goto_2

    .line 1356
    :pswitch_3
    const/4 v5, 0x0

    mul-int/lit8 v7, v6, 0x2

    const/4 v8, 0x0

    move-object v3, v1

    move v4, v2

    invoke-virtual/range {v3 .. v8}, Lcom/vk/imageloader/view/VKLayerImageView;->setLayerInset(IIIII)V

    goto :goto_2

    .line 1359
    :pswitch_4
    const/4 v9, 0x0

    move-object v4, v1

    move v5, v2

    move v7, v6

    move v8, v6

    invoke-virtual/range {v4 .. v9}, Lcom/vk/imageloader/view/VKLayerImageView;->setLayerInset(IIIII)V

    goto :goto_2

    .line 1362
    :pswitch_5
    mul-int/lit8 v5, v6, 0x2

    const/4 v7, 0x0

    const/4 v8, 0x0

    move-object v3, v1

    move v4, v2

    invoke-virtual/range {v3 .. v8}, Lcom/vk/imageloader/view/VKLayerImageView;->setLayerInset(IIIII)V

    goto :goto_2

    .line 1369
    :cond_4
    const/4 v3, 0x2

    if-ne v2, v3, :cond_5

    .line 1370
    const/4 v9, 0x0

    const/high16 v3, 0x40000000    # 2.0f

    invoke-static {v3}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v10

    const/4 v11, 0x0

    const/4 v12, 0x0

    move-object v7, v1

    move v8, v2

    invoke-virtual/range {v7 .. v12}, Lcom/vk/imageloader/view/VKLayerImageView;->setLayerCorners(IIIII)V

    goto :goto_3

    .line 1371
    :cond_5
    const/4 v3, 0x3

    if-ne v2, v3, :cond_6

    .line 1372
    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/high16 v3, 0x40000000    # 2.0f

    invoke-static {v3}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v12

    move-object v7, v1

    move v8, v2

    invoke-virtual/range {v7 .. v12}, Lcom/vk/imageloader/view/VKLayerImageView;->setLayerCorners(IIIII)V

    goto :goto_3

    .line 1373
    :cond_6
    const/4 v3, 0x5

    if-ne v2, v3, :cond_2

    .line 1374
    const/4 v9, 0x0

    const/4 v10, 0x0

    const/high16 v3, 0x40000000    # 2.0f

    invoke-static {v3}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v11

    const/4 v12, 0x0

    move-object v7, v1

    move v8, v2

    invoke-virtual/range {v7 .. v12}, Lcom/vk/imageloader/view/VKLayerImageView;->setLayerCorners(IIIII)V

    goto :goto_3

    .line 1377
    :cond_7
    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    move-object v7, v1

    move v8, v2

    invoke-virtual/range {v7 .. v12}, Lcom/vk/imageloader/view/VKLayerImageView;->setLayerCorners(IIIII)V

    goto :goto_3

    .line 1383
    :cond_8
    return-object v1

    .line 1345
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
    .end packed-switch
.end method

.method private createPlaceholderView(I)Landroid/view/View;
    .locals 4
    .param p1, "icon"    # I
        .annotation build Landroid/support/annotation/DrawableRes;
        .end annotation
    .end param

    .prologue
    .line 1309
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const v2, 0x7f0301cb

    const/4 v3, 0x0

    invoke-static {v1, v2, v3}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 1310
    .local v0, "view":Landroid/view/View;
    const v1, 0x7f1004d3

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    invoke-virtual {v1, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 1311
    return-object v0
.end method

.method private createStoriesBackgroundImageView(Ljava/lang/String;I)Landroid/view/View;
    .locals 6
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "placeholderResId"    # I

    .prologue
    const/high16 v5, 0x40000000    # 2.0f

    .line 1323
    new-instance v0, Lcom/vk/imageloader/view/VKImageView;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vk/imageloader/view/VKImageView;-><init>(Landroid/content/Context;)V

    .line 1324
    .local v0, "imageView":Lcom/vk/imageloader/view/VKImageView;
    invoke-virtual {v0}, Lcom/vk/imageloader/view/VKImageView;->getHierarchy()Lcom/facebook/drawee/interfaces/DraweeHierarchy;

    move-result-object v1

    check-cast v1, Lcom/facebook/drawee/generic/GenericDraweeHierarchy;

    invoke-static {v5}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v2

    int-to-float v2, v2

    invoke-static {v5}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v3

    int-to-float v3, v3

    invoke-static {v5}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v4

    int-to-float v4, v4

    invoke-static {v5}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v5

    int-to-float v5, v5

    invoke-static {v2, v3, v4, v5}, Lcom/facebook/drawee/generic/RoundingParams;->fromCornersRadii(FFFF)Lcom/facebook/drawee/generic/RoundingParams;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/facebook/drawee/generic/GenericDraweeHierarchy;->setRoundingParams(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 1325
    new-instance v1, Lcom/vk/imageloader/transform/StoriesProfileButtonTransform;

    invoke-direct {v1}, Lcom/vk/imageloader/transform/StoriesProfileButtonTransform;-><init>()V

    invoke-virtual {v0, v1}, Lcom/vk/imageloader/view/VKImageView;->setPostprocessor(Lcom/facebook/imagepipeline/request/BasePostprocessor;)V

    .line 1326
    invoke-virtual {v0, p2}, Lcom/vk/imageloader/view/VKImageView;->setPlaceholderImage(I)V

    .line 1327
    invoke-virtual {v0, p1}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    .line 1328
    return-object v0
.end method

.method private createTextItem(Ljava/lang/CharSequence;)Landroid/view/View;
    .locals 6
    .param p1, "text"    # Ljava/lang/CharSequence;

    .prologue
    const v5, 0x7f090027

    const/high16 v4, 0x42000000    # 32.0f

    .line 1721
    new-instance v0, Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 1722
    .local v0, "view":Landroid/widget/TextView;
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1723
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v5}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v1

    invoke-static {v4}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v2

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3, v5}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v3

    invoke-static {v4}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v4

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 1724
    const/4 v1, 0x1

    const/high16 v2, 0x41600000    # 14.0f

    invoke-virtual {v0, v1, v2}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 1725
    const v1, -0x938c86

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 1726
    const/high16 v1, 0x40000000    # 2.0f

    invoke-static {v1}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v1

    int-to-float v1, v1

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1, v2}, Landroid/widget/TextView;->setLineSpacing(FF)V

    .line 1727
    return-object v0
.end method

.method private createTextThumbView(Ljava/lang/String;Ljava/lang/String;I)Landroid/view/View;
    .locals 4
    .param p1, "title"    # Ljava/lang/String;
    .param p2, "subtitle"    # Ljava/lang/String;
    .param p3, "icon"    # I
        .annotation build Landroid/support/annotation/DrawableRes;
        .end annotation
    .end param

    .prologue
    .line 1301
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const v2, 0x7f0301cc

    const/4 v3, 0x0

    invoke-static {v1, v2, v3}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 1302
    .local v0, "view":Landroid/view/View;
    const v1, 0x7f1004d4

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1303
    const v1, 0x7f1004d5

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    invoke-virtual {v1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1304
    const v1, 0x7f1004d3

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    invoke-virtual {v1, p3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 1305
    return-object v0
.end method

.method private deletePhoto()V
    .locals 3

    .prologue
    .line 1003
    new-instance v0, Lcom/vkontakte/android/api/photos/PhotosDeleteAvatar;

    iget v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    invoke-direct {v0, v1}, Lcom/vkontakte/android/api/photos/PhotosDeleteAvatar;-><init>(I)V

    new-instance v1, Lcom/vkontakte/android/fragments/ProfileFragment$10;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-direct {v1, p0, v2}, Lcom/vkontakte/android/fragments/ProfileFragment$10;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/photos/PhotosDeleteAvatar;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 1013
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 1014
    return-void
.end method

.method private doAddFriend(Ljava/lang/String;)V
    .locals 2
    .param p1, "msg"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 2852
    iget v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    invoke-static {v0, p1}, Lcom/vkontakte/android/api/friends/FriendsAdd;->createFriendsAddAndSendAllStats(ILjava/lang/String;)Lcom/vkontakte/android/api/friends/FriendsAdd;

    move-result-object v0

    new-instance v1, Lcom/vkontakte/android/fragments/ProfileFragment$22;

    invoke-direct {v1, p0, p1}, Lcom/vkontakte/android/fragments/ProfileFragment$22;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/friends/FriendsAdd;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 2919
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 2920
    return-void
.end method

.method private doLeaveGroup()V
    .locals 3

    .prologue
    .line 3092
    new-instance v1, Lcom/vkontakte/android/api/groups/GroupsLeave;

    iget v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    neg-int v0, v0

    invoke-direct {v1, v0}, Lcom/vkontakte/android/api/groups/GroupsLeave;-><init>(I)V

    new-instance v2, Lcom/vkontakte/android/fragments/ProfileFragment$28;

    const/4 v0, 0x0

    check-cast v0, Landroid/app/Activity;

    invoke-direct {v2, p0, v0}, Lcom/vkontakte/android/fragments/ProfileFragment$28;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;Landroid/content/Context;)V

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/api/groups/GroupsLeave;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 3112
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 3113
    return-void
.end method

.method private doRemoveFriend()V
    .locals 2

    .prologue
    .line 2967
    new-instance v0, Lcom/vkontakte/android/api/friends/FriendsDelete;

    iget v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    invoke-direct {v0, v1}, Lcom/vkontakte/android/api/friends/FriendsDelete;-><init>(I)V

    new-instance v1, Lcom/vkontakte/android/fragments/ProfileFragment$24;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/fragments/ProfileFragment$24;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;)V

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/friends/FriendsDelete;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 2996
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 2997
    return-void
.end method

.method private doToggleBlacklist()V
    .locals 4

    .prologue
    .line 3202
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 3203
    .local v0, "activity":Landroid/app/Activity;
    new-instance v2, Lcom/vkontakte/android/api/account/AccountBanUser;

    iget v3, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-boolean v1, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->blacklisted:Z

    if-nez v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    invoke-direct {v2, v3, v1}, Lcom/vkontakte/android/api/account/AccountBanUser;-><init>(IZ)V

    new-instance v1, Lcom/vkontakte/android/fragments/ProfileFragment$33;

    invoke-direct {v1, p0, p0, v0}, Lcom/vkontakte/android/fragments/ProfileFragment$33;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;Landroid/app/Fragment;Landroid/app/Activity;)V

    invoke-virtual {v2, v1}, Lcom/vkontakte/android/api/account/AccountBanUser;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    .line 3212
    invoke-virtual {v1, v0}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 3213
    return-void

    .line 3203
    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private editFriendLists()V
    .locals 8

    .prologue
    const/4 v6, 0x1

    .line 3020
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 3021
    .local v3, "lists":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/data/Friends$Folder;>;"
    invoke-static {v3}, Lcom/vkontakte/android/data/Friends;->getLists(Ljava/util/List;)V

    .line 3022
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v5

    new-array v2, v5, [Ljava/lang/String;

    .line 3023
    .local v2, "items":[Ljava/lang/String;
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v5

    new-array v0, v5, [Z

    .line 3024
    .local v0, "checked":[Z
    iget v5, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    invoke-static {v5}, Lcom/vkontakte/android/data/Friends;->get(I)Lcom/vkontakte/android/UserProfile;

    move-result-object v4

    .line 3025
    .local v4, "p":Lcom/vkontakte/android/UserProfile;
    if-nez v4, :cond_0

    .line 3056
    :goto_0
    return-void

    .line 3028
    :cond_0
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    array-length v5, v2

    if-ge v1, v5, :cond_2

    .line 3029
    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/vkontakte/android/data/Friends$Folder;

    iget-object v5, v5, Lcom/vkontakte/android/data/Friends$Folder;->name:Ljava/lang/String;

    aput-object v5, v2, v1

    .line 3030
    iget v7, v4, Lcom/vkontakte/android/UserProfile;->country:I

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/vkontakte/android/data/Friends$Folder;

    iget v5, v5, Lcom/vkontakte/android/data/Friends$Folder;->id:I

    shl-int v5, v6, v5

    and-int/2addr v5, v7

    if-lez v5, :cond_1

    move v5, v6

    :goto_2
    aput-boolean v5, v0, v1

    .line 3028
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 3030
    :cond_1
    const/4 v5, 0x0

    goto :goto_2

    .line 3032
    :cond_2
    new-instance v5, Lcom/vkontakte/android/VKAlertDialog$Builder;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v6

    invoke-direct {v5, v6}, Lcom/vkontakte/android/VKAlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v6, 0x7f0801dc

    .line 3033
    invoke-virtual {v5, v6}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v5

    invoke-static {v0}, Lcom/vkontakte/android/fragments/ProfileFragment$$Lambda$39;->lambdaFactory$([Z)Landroid/content/DialogInterface$OnMultiChoiceClickListener;

    move-result-object v6

    .line 3034
    invoke-virtual {v5, v2, v0, v6}, Landroid/app/AlertDialog$Builder;->setMultiChoiceItems([Ljava/lang/CharSequence;[ZLandroid/content/DialogInterface$OnMultiChoiceClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v5

    const v6, 0x7f080479

    invoke-static {p0, v0, v3, v4}, Lcom/vkontakte/android/fragments/ProfileFragment$$Lambda$40;->lambdaFactory$(Lcom/vkontakte/android/fragments/ProfileFragment;[ZLjava/util/ArrayList;Lcom/vkontakte/android/UserProfile;)Landroid/content/DialogInterface$OnClickListener;

    move-result-object v7

    .line 3035
    invoke-virtual {v5, v6, v7}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v5

    const v6, 0x7f08011f

    const/4 v7, 0x0

    .line 3053
    invoke-virtual {v5, v6, v7}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v5

    .line 3054
    invoke-virtual {v5}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto :goto_0
.end method

.method private generateRelativesString([Lcom/vkontakte/android/UserProfile;)Ljava/lang/String;
    .locals 7
    .param p1, "users"    # [Lcom/vkontakte/android/UserProfile;

    .prologue
    const/4 v3, 0x0

    .line 1731
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 1732
    .local v0, "parts":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    array-length v4, p1

    move v2, v3

    :goto_0
    if-ge v2, v4, :cond_1

    aget-object v1, p1, v2

    .line 1733
    .local v1, "u":Lcom/vkontakte/android/UserProfile;
    iget v5, v1, Lcom/vkontakte/android/UserProfile;->uid:I

    if-lez v5, :cond_0

    .line 1734
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "[id"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v6, v1, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, "|"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, v1, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, "]"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1732
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1736
    :cond_0
    iget-object v5, v1, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 1739
    .end local v1    # "u":Lcom/vkontakte/android/UserProfile;
    :cond_1
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v4, 0x2

    if-ne v2, v4, :cond_2

    .line 1740
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const v3, 0x7f080474

    invoke-virtual {p0, v3}, Lcom/vkontakte/android/fragments/ProfileFragment;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 1742
    :goto_2
    return-object v2

    :cond_2
    const-string/jumbo v2, ", "

    invoke-static {v2, v0}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v2

    goto :goto_2
.end method

.method public static getNameGen(Landroid/content/Context;Lcom/vkontakte/android/api/ExtendedUserProfile;)Ljava/lang/String;
    .locals 2
    .param p0, "ctx"    # Landroid/content/Context;
    .param p1, "profile"    # Lcom/vkontakte/android/api/ExtendedUserProfile;

    .prologue
    .line 918
    invoke-static {p0}, Lcom/vk/core/util/Screen;->isTablet(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 919
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p1, Lcom/vkontakte/android/api/ExtendedUserProfile;->firstNameGen:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p1, Lcom/vkontakte/android/api/ExtendedUserProfile;->lastNameGen:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 921
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p1, Lcom/vkontakte/android/api/ExtendedUserProfile;->firstNameGen:Ljava/lang/String;

    goto :goto_0
.end method

.method private hasDisplayField(Ljava/lang/String;)Z
    .locals 1
    .param p1, "field"    # Ljava/lang/String;

    .prologue
    .line 1746
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->displayFields:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->displayFields:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private isEnableGroupParallaxEffect()Z
    .locals 1

    .prologue
    .line 495
    iget v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    if-gez v0, :cond_0

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->isTabletDecorator()Z

    move-result v0

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->isTablet:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private joinGroup(Z)V
    .locals 3
    .param p1, "sure"    # Z

    .prologue
    .line 2923
    iget v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    neg-int v1, v0

    if-nez p1, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-static {v1, v0}, Lcom/vkontakte/android/api/groups/GroupsJoin;->createGroupsJoinAndSendAllStats(IZ)Lcom/vkontakte/android/api/groups/GroupsJoin;

    move-result-object v1

    new-instance v2, Lcom/vkontakte/android/fragments/ProfileFragment$23;

    const/4 v0, 0x0

    check-cast v0, Landroid/app/Activity;

    invoke-direct {v2, p0, v0, p1}, Lcom/vkontakte/android/fragments/ProfileFragment$23;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;Landroid/content/Context;Z)V

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/api/groups/GroupsJoin;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 2950
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 2951
    return-void

    .line 2923
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method static synthetic lambda$buildInfoItems$29(Landroid/view/View;Lcom/vk/music/dto/Playlist;I)V
    .locals 2
    .param p0, "v"    # Landroid/view/View;
    .param p1, "playlist"    # Lcom/vk/music/dto/Playlist;
    .param p2, "position"    # I

    .prologue
    .line 2564
    new-instance v0, Lcom/vk/music/fragment/PlaylistFragment$Builder;

    invoke-direct {v0, p1}, Lcom/vk/music/fragment/PlaylistFragment$Builder;-><init>(Lcom/vk/music/dto/Playlist;)V

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/music/fragment/PlaylistFragment$Builder;->go(Landroid/content/Context;)Z

    return-void
.end method

.method static synthetic lambda$buildInfoItems$30(Lcom/vk/music/dto/Playlist;)J
    .locals 2
    .param p0, "playlist"    # Lcom/vk/music/dto/Playlist;

    .prologue
    .line 2565
    iget v0, p0, Lcom/vk/music/dto/Playlist;->id:I

    int-to-long v0, v0

    return-wide v0
.end method

.method static synthetic lambda$editFriendLists$38([ZLandroid/content/DialogInterface;IZ)V
    .locals 0
    .param p0, "checked"    # [Z
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I
    .param p3, "isChecked"    # Z

    .prologue
    .line 3034
    aput-boolean p3, p0, p2

    return-void
.end method

.method private leaveGroup()V
    .locals 3

    .prologue
    .line 3077
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->groupAccess:I

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->friendStatus:I

    const/4 v1, 0x4

    if-ne v0, v1, :cond_1

    .line 3078
    :cond_0
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->doLeaveGroup()V

    .line 3089
    :goto_0
    return-void

    .line 3081
    :cond_1
    new-instance v0, Lcom/vkontakte/android/VKAlertDialog$Builder;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vkontakte/android/VKAlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x7f08032c

    .line 3082
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f08032b

    .line 3083
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f080798

    invoke-static {p0}, Lcom/vkontakte/android/fragments/ProfileFragment$$Lambda$42;->lambdaFactory$(Lcom/vkontakte/android/fragments/ProfileFragment;)Landroid/content/DialogInterface$OnClickListener;

    move-result-object v2

    .line 3084
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f080433

    const/4 v2, 0x0

    .line 3087
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 3088
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto :goto_0
.end method

.method private loadPlaylistAndPlay(I)V
    .locals 3
    .param p1, "aid"    # I

    .prologue
    .line 3441
    iput p1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->pendingAudioId:I

    .line 3442
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->audioLoadReq:Lme/grishka/appkit/api/APIRequest;

    if-eqz v0, :cond_0

    .line 3462
    :goto_0
    return-void

    .line 3445
    :cond_0
    new-instance v0, Lcom/vkontakte/android/api/audio/AudioGet;

    iget v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    invoke-direct {v0, v1}, Lcom/vkontakte/android/api/audio/AudioGet;-><init>(I)V

    new-instance v1, Lcom/vkontakte/android/fragments/ProfileFragment$35;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-direct {v1, p0, v2}, Lcom/vkontakte/android/fragments/ProfileFragment$35;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/audio/AudioGet;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 3461
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->audioLoadReq:Lme/grishka/appkit/api/APIRequest;

    goto :goto_0
.end method

.method private loadWall(II)V
    .locals 7
    .param p1, "_offset"    # I
    .param p2, "count"    # I

    .prologue
    .line 3216
    if-lez p1, :cond_0

    .line 3217
    iget p1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->offset:I

    .line 3222
    :goto_0
    move v6, p1

    .line 3224
    .local v6, "offset":I
    new-instance v0, Lcom/vkontakte/android/api/wall/WallGet;

    iget v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->nextFrom:Ljava/lang/String;

    iget-boolean v4, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->ownerOnly:Z

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getListReferrer()Ljava/lang/String;

    move-result-object v5

    move v3, p2

    invoke-direct/range {v0 .. v5}, Lcom/vkontakte/android/api/wall/WallGet;-><init>(ILjava/lang/String;IZLjava/lang/String;)V

    new-instance v1, Lcom/vkontakte/android/fragments/ProfileFragment$34;

    invoke-direct {v1, p0, p0, v6, p2}, Lcom/vkontakte/android/fragments/ProfileFragment$34;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;Landroid/app/Fragment;II)V

    .line 3225
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/wall/WallGet;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 3349
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->currentRequest:Lme/grishka/appkit/api/APIRequest;

    .line 3350
    return-void

    .line 3219
    .end local v6    # "offset":I
    :cond_0
    const/4 v0, 0x0

    iput v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->offset:I

    .line 3220
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->nextFrom:Ljava/lang/String;

    goto :goto_0
.end method

.method private openAudioStatus()V
    .locals 3

    .prologue
    .line 2771
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-static {v1}, Lcom/vkontakte/android/auth/VKAuth;->ensureLoggedIn(Landroid/content/Context;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 2779
    :cond_0
    :goto_0
    return-void

    .line 2774
    :cond_1
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->audioStatus:Lcom/vkontakte/android/audio/MusicTrack;

    .line 2775
    .local v0, "musicTrack":Lcom/vkontakte/android/audio/MusicTrack;
    if-eqz v0, :cond_0

    .line 2776
    iget v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    if-lez v1, :cond_2

    sget-object v1, Lcom/vkontakte/android/audio/player/PlayerRefer;->status_user:Lcom/vkontakte/android/audio/player/PlayerRefer;

    :goto_1
    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Lcom/vkontakte/android/audio/AudioFacade;->playTrack(Lcom/vkontakte/android/audio/MusicTrack;Lcom/vkontakte/android/audio/player/PlayerRefer;Z)V

    .line 2777
    invoke-static {}, Lcom/vkontakte/android/audio/AudioFacade;->showPlayer()V

    goto :goto_0

    .line 2776
    :cond_2
    sget-object v1, Lcom/vkontakte/android/audio/player/PlayerRefer;->status_group:Lcom/vkontakte/android/audio/player/PlayerRefer;

    goto :goto_1
.end method

.method private openInBrowser()V
    .locals 4

    .prologue
    .line 3153
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v1, "android.intent.action.VIEW"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "https://m.vk.com/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v3, v3, Lcom/vkontakte/android/api/ExtendedUserProfile;->screenName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/ProfileFragment;->startActivity(Landroid/content/Intent;)V

    .line 3154
    return-void
.end method

.method private openOwnerContent(Ljava/lang/String;)V
    .locals 10
    .param p1, "act"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x1

    .line 925
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 926
    .local v0, "activity":Landroid/app/Activity;
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    const/4 v5, -0x1

    invoke-virtual {v6}, Ljava/lang/String;->hashCode()I

    move-result v7

    sparse-switch v7, :sswitch_data_0

    :cond_0
    :goto_0
    packed-switch v5, :pswitch_data_0

    .line 1000
    :cond_1
    :goto_1
    return-void

    .line 926
    :sswitch_0
    const-string/jumbo v7, "stories"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    move v5, v4

    goto :goto_0

    :sswitch_1
    const-string/jumbo v7, "photos"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    move v5, v3

    goto :goto_0

    :sswitch_2
    const-string/jumbo v7, "market"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    const/4 v5, 0x2

    goto :goto_0

    :sswitch_3
    const-string/jumbo v7, "mutual_friends"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    const/4 v5, 0x3

    goto :goto_0

    :sswitch_4
    const-string/jumbo v7, "videos"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    const/4 v5, 0x4

    goto :goto_0

    :sswitch_5
    const-string/jumbo v7, "audios"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    const/4 v5, 0x5

    goto :goto_0

    :sswitch_6
    const-string/jumbo v7, "groups"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    const/4 v5, 0x6

    goto :goto_0

    :sswitch_7
    const-string/jumbo v7, "topics"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    const/4 v5, 0x7

    goto :goto_0

    :sswitch_8
    const-string/jumbo v7, "members"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    const/16 v5, 0x8

    goto :goto_0

    :sswitch_9
    const-string/jumbo v7, "docs"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    const/16 v5, 0x9

    goto :goto_0

    :sswitch_a
    const-string/jumbo v7, "subscriptions"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    const/16 v5, 0xa

    goto :goto_0

    :sswitch_b
    const-string/jumbo v7, "gifts"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    const/16 v5, 0xb

    goto/16 :goto_0

    .line 928
    :pswitch_0
    new-instance v2, Landroid/content/Intent;

    const-class v3, Lcom/vk/stories/StoryViewActivity;

    invoke-direct {v2, v0, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 929
    .local v2, "intent":Landroid/content/Intent;
    const-string/jumbo v3, "get_stories_response"

    iget-object v4, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->storiesResponse:Lcom/vk/stories/model/GetStoriesResponse;

    iget-object v4, v4, Lcom/vk/stories/model/GetStoriesResponse;->storiesResponse:Ljava/util/ArrayList;

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 930
    const-string/jumbo v3, "source_type"

    sget-object v4, Lcom/vk/stories/StoriesController$SourceType;->PROFILE:Lcom/vk/stories/StoriesController$SourceType;

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 931
    invoke-virtual {p0, v2}, Lcom/vkontakte/android/fragments/ProfileFragment;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_1

    .line 934
    .end local v2    # "intent":Landroid/content/Intent;
    :pswitch_1
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 935
    .local v1, "args":Landroid/os/Bundle;
    const-string/jumbo v5, "uid"

    iget v6, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    invoke-virtual {v1, v5, v6}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 936
    const-string/jumbo v5, "need_system"

    invoke-virtual {v1, v5, v3}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 937
    const-string/jumbo v5, "user_name_ins"

    iget-object v6, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v6, v6, Lcom/vkontakte/android/api/ExtendedUserProfile;->firstNameIns:Ljava/lang/String;

    invoke-virtual {v1, v5, v6}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 938
    const-string/jumbo v5, "can_view_user_photos"

    iget v6, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    if-lez v6, :cond_2

    iget-object v6, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v6, v6, Lcom/vkontakte/android/api/ExtendedUserProfile;->counters:Ljava/util/HashMap;

    const-string/jumbo v7, "user_photos"

    invoke-virtual {v6, v7}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    iget-object v6, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    const-string/jumbo v7, "user_photos"

    .line 939
    invoke-virtual {v6, v7}, Lcom/vkontakte/android/api/ExtendedUserProfile;->getCounter(Ljava/lang/String;)I

    move-result v6

    if-lez v6, :cond_2

    .line 938
    :goto_2
    invoke-virtual {v1, v5, v3}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 940
    const-class v3, Lcom/vkontakte/android/fragments/PhotosFragment;

    invoke-static {v3, v1, v0}, Lcom/vkontakte/android/navigation/Navigate;->to(Ljava/lang/Class;Landroid/os/Bundle;Landroid/content/Context;)V

    goto/16 :goto_1

    :cond_2
    move v3, v4

    .line 939
    goto :goto_2

    .line 943
    .end local v1    # "args":Landroid/os/Bundle;
    :pswitch_2
    new-instance v3, Lcom/vkontakte/android/fragments/market/MarketFragment$Builder;

    iget v4, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    invoke-direct {v3, v4}, Lcom/vkontakte/android/fragments/market/MarketFragment$Builder;-><init>(I)V

    invoke-virtual {v3, v0}, Lcom/vkontakte/android/fragments/market/MarketFragment$Builder;->go(Landroid/content/Context;)Z

    goto/16 :goto_1

    .line 946
    :pswitch_3
    new-instance v5, Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;

    invoke-direct {v5}, Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;-><init>()V

    iget v6, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    invoke-virtual {v5, v6}, Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;->setUid(I)Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;

    move-result-object v5

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const v7, 0x7f080242

    new-array v8, v3, [Ljava/lang/Object;

    iget-object v9, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    .line 947
    invoke-static {v0, v9}, Lcom/vkontakte/android/fragments/ProfileFragment;->getNameGen(Landroid/content/Context;Lcom/vkontakte/android/api/ExtendedUserProfile;)Ljava/lang/String;

    move-result-object v9

    aput-object v9, v8, v4

    .line 946
    invoke-virtual {v6, v7, v8}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v5, v4}, Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;->setTitle(Ljava/lang/String;)Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;

    move-result-object v4

    .line 947
    invoke-virtual {v4, v3}, Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;->setMutual(Z)Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;

    move-result-object v3

    invoke-virtual {v3, v0}, Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;->go(Landroid/content/Context;)Z

    goto/16 :goto_1

    .line 950
    :pswitch_4
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 951
    .restart local v1    # "args":Landroid/os/Bundle;
    const-string/jumbo v5, "uid"

    iget v6, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    invoke-virtual {v1, v5, v6}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 952
    const-string/jumbo v5, "can_upload_video"

    iget-object v6, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-boolean v6, v6, Lcom/vkontakte/android/api/ExtendedUserProfile;->canUploadVideo:Z

    invoke-virtual {v1, v5, v6}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 953
    iget-object v5, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v5, v5, Lcom/vkontakte/android/api/ExtendedUserProfile;->profile:Lcom/vkontakte/android/UserProfile;

    iget v5, v5, Lcom/vkontakte/android/UserProfile;->uid:I

    if-lez v5, :cond_3

    .line 954
    const-string/jumbo v5, "username_ins"

    iget-object v6, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v6, v6, Lcom/vkontakte/android/api/ExtendedUserProfile;->firstNameIns:Ljava/lang/String;

    invoke-virtual {v1, v5, v6}, Landroid/os/Bundle;->putCharSequence(Ljava/lang/String;Ljava/lang/CharSequence;)V

    .line 956
    :cond_3
    const-string/jumbo v5, "title"

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const v7, 0x7f08076f

    new-array v8, v3, [Ljava/lang/Object;

    iget v3, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    if-lez v3, :cond_5

    iget-object v3, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    invoke-static {v0, v3}, Lcom/vkontakte/android/fragments/ProfileFragment;->getNameGen(Landroid/content/Context;Lcom/vkontakte/android/api/ExtendedUserProfile;)Ljava/lang/String;

    move-result-object v3

    :goto_3
    aput-object v3, v8, v4

    invoke-virtual {v6, v7, v8}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v5, v3}, Landroid/os/Bundle;->putCharSequence(Ljava/lang/String;Ljava/lang/CharSequence;)V

    .line 957
    iget v3, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    if-gez v3, :cond_4

    .line 958
    const-string/jumbo v3, "groupName"

    iget-object v4, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->profile:Lcom/vkontakte/android/UserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    invoke-virtual {v1, v3, v4}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 959
    const-string/jumbo v3, "groupPhoto"

    iget-object v4, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->profile:Lcom/vkontakte/android/UserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    invoke-virtual {v1, v3, v4}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 961
    :cond_4
    const-class v3, Lcom/vkontakte/android/fragments/videos/VideosFragment;

    invoke-static {v3, v1, v0}, Lcom/vkontakte/android/navigation/Navigate;->to(Ljava/lang/Class;Landroid/os/Bundle;Landroid/content/Context;)V

    goto/16 :goto_1

    .line 956
    :cond_5
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v9, 0x7f0802ed

    invoke-virtual {v3, v9}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    goto :goto_3

    .line 964
    .end local v1    # "args":Landroid/os/Bundle;
    :pswitch_5
    invoke-static {v0}, Lcom/vkontakte/android/auth/VKAuth;->ensureLoggedIn(Landroid/content/Context;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 965
    new-instance v3, Lcom/vk/music/fragment/MusicFragment$Builder;

    invoke-direct {v3}, Lcom/vk/music/fragment/MusicFragment$Builder;-><init>()V

    iget v4, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    invoke-virtual {v3, v4}, Lcom/vk/music/fragment/MusicFragment$Builder;->ownerId(I)Lcom/vk/music/fragment/MusicFragment$Builder;

    move-result-object v3

    iget-object v4, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->profile:Lcom/vkontakte/android/UserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lcom/vk/music/fragment/MusicFragment$Builder;->setOwnerNameFull(Ljava/lang/String;)Lcom/vk/music/fragment/MusicFragment$Builder;

    move-result-object v3

    invoke-virtual {v3, v0}, Lcom/vk/music/fragment/MusicFragment$Builder;->go(Landroid/content/Context;)Z

    goto/16 :goto_1

    .line 969
    :pswitch_6
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 970
    .restart local v1    # "args":Landroid/os/Bundle;
    const-string/jumbo v5, "uid"

    iget v6, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    invoke-virtual {v1, v5, v6}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 971
    const-string/jumbo v5, "title"

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const v7, 0x7f080300

    new-array v3, v3, [Ljava/lang/Object;

    iget-object v8, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    invoke-static {v0, v8}, Lcom/vkontakte/android/fragments/ProfileFragment;->getNameGen(Landroid/content/Context;Lcom/vkontakte/android/api/ExtendedUserProfile;)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v3, v4

    invoke-virtual {v6, v7, v3}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v5, v3}, Landroid/os/Bundle;->putCharSequence(Ljava/lang/String;Ljava/lang/CharSequence;)V

    .line 972
    const-class v3, Lcom/vkontakte/android/fragments/groups/GroupsFragment;

    invoke-static {v3, v1, v0}, Lcom/vkontakte/android/navigation/Navigate;->to(Ljava/lang/Class;Landroid/os/Bundle;Landroid/content/Context;)V

    goto/16 :goto_1

    .line 975
    .end local v1    # "args":Landroid/os/Bundle;
    :pswitch_7
    new-instance v3, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment$Builder;

    iget v4, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    neg-int v4, v4

    invoke-direct {v3, v4}, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment$Builder;-><init>(I)V

    invoke-virtual {v3, p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment$Builder;->go(Landroid/app/Fragment;)Z

    goto/16 :goto_1

    .line 978
    :pswitch_8
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 979
    .restart local v1    # "args":Landroid/os/Bundle;
    const-string/jumbo v3, "gid"

    iget v4, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    neg-int v4, v4

    invoke-virtual {v1, v3, v4}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 980
    const-string/jumbo v3, "title"

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f0802e1

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Landroid/os/Bundle;->putCharSequence(Ljava/lang/String;Ljava/lang/CharSequence;)V

    .line 981
    const-string/jumbo v3, "type"

    iget-object v4, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->groupType:I

    invoke-virtual {v1, v3, v4}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 982
    const-class v3, Lcom/vkontakte/android/fragments/GroupMembersFragment;

    invoke-static {v3, v1, v0}, Lcom/vkontakte/android/navigation/Navigate;->to(Ljava/lang/Class;Landroid/os/Bundle;Landroid/content/Context;)V

    goto/16 :goto_1

    .line 985
    .end local v1    # "args":Landroid/os/Bundle;
    :pswitch_9
    new-instance v3, Lcom/vkontakte/android/fragments/documents/DocumentsFragmentBuilder;

    invoke-direct {v3}, Lcom/vkontakte/android/fragments/documents/DocumentsFragmentBuilder;-><init>()V

    iget v4, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    invoke-virtual {v3, v4}, Lcom/vkontakte/android/fragments/documents/DocumentsFragmentBuilder;->setOwnerId(I)Lcom/vkontakte/android/fragments/documents/DocumentsFragmentBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Lcom/vkontakte/android/fragments/documents/DocumentsFragmentBuilder;->go(Landroid/content/Context;)Z

    goto/16 :goto_1

    .line 988
    :pswitch_a
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 989
    .restart local v1    # "args":Landroid/os/Bundle;
    const-string/jumbo v3, "uid"

    iget v4, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    invoke-virtual {v1, v3, v4}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 990
    const-string/jumbo v3, "title"

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f08057f

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Landroid/os/Bundle;->putCharSequence(Ljava/lang/String;Ljava/lang/CharSequence;)V

    .line 991
    const-class v3, Lcom/vkontakte/android/fragments/userlist/SubscriptionsUserListFragment;

    invoke-static {v3, v1, v0}, Lcom/vkontakte/android/navigation/Navigate;->to(Ljava/lang/Class;Landroid/os/Bundle;Landroid/content/Context;)V

    goto/16 :goto_1

    .line 994
    .end local v1    # "args":Landroid/os/Bundle;
    :pswitch_b
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 995
    .restart local v1    # "args":Landroid/os/Bundle;
    const-string/jumbo v5, "user"

    iget-object v6, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v6, v6, Lcom/vkontakte/android/api/ExtendedUserProfile;->profile:Lcom/vkontakte/android/UserProfile;

    invoke-virtual {v1, v5, v6}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 996
    const-string/jumbo v5, "title"

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const v7, 0x7f080292

    new-array v3, v3, [Ljava/lang/Object;

    iget-object v8, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    invoke-static {v0, v8}, Lcom/vkontakte/android/fragments/ProfileFragment;->getNameGen(Landroid/content/Context;Lcom/vkontakte/android/api/ExtendedUserProfile;)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v3, v4

    invoke-virtual {v6, v7, v3}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v5, v3}, Landroid/os/Bundle;->putCharSequence(Ljava/lang/String;Ljava/lang/CharSequence;)V

    .line 997
    const-class v3, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;

    invoke-static {v3, v1, v0}, Lcom/vkontakte/android/navigation/Navigate;->to(Ljava/lang/Class;Landroid/os/Bundle;Landroid/content/Context;)V

    goto/16 :goto_1

    .line 926
    nop

    :sswitch_data_0
    .sparse-switch
        -0x704f9fad -> :sswitch_0
        -0x53da20a3 -> :sswitch_5
        -0x49c2262c -> :sswitch_6
        -0x40736bc4 -> :sswitch_2
        -0x3af3777f -> :sswitch_1
        -0x33bd26dc -> :sswitch_7
        -0x30ad84a8 -> :sswitch_4
        0x2f223b -> :sswitch_9
        0x5dcbd43 -> :sswitch_b
        0x388ec919 -> :sswitch_8
        0x3bd3146a -> :sswitch_3
        0x7674caf6 -> :sswitch_a
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_8
        :pswitch_9
        :pswitch_a
        :pswitch_b
    .end packed-switch
.end method

.method private openWallSearch()V
    .locals 3

    .prologue
    .line 837
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 838
    .local v0, "args":Landroid/os/Bundle;
    const-string/jumbo v1, "owner"

    iget v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 839
    const-string/jumbo v2, "owner_name_gen"

    iget v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    if-gez v1, :cond_0

    const v1, 0x7f0802ed

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    :goto_0
    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 840
    const-class v1, Lcom/vkontakte/android/fragments/NewsSearchFragment;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-static {v1, v0, v2}, Lcom/vkontakte/android/navigation/Navigate;->to(Ljava/lang/Class;Landroid/os/Bundle;Landroid/content/Context;)V

    .line 841
    return-void

    .line 839
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v1, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->firstNameGen:Ljava/lang/String;

    goto :goto_0
.end method

.method private playAudio(I)V
    .locals 5
    .param p1, "aid"    # I

    .prologue
    .line 3465
    const/4 v1, -0x1

    .line 3466
    .local v1, "pos":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v3, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->audioPlaylist:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v0, v3, :cond_0

    .line 3467
    iget-object v3, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->audioPlaylist:Ljava/util/ArrayList;

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/vkontakte/android/audio/MusicTrack;

    iget v3, v3, Lcom/vkontakte/android/audio/MusicTrack;->aid:I

    if-ne v3, p1, :cond_1

    .line 3468
    move v1, v0

    .line 3472
    :cond_0
    const/4 v3, -0x1

    if-ne v1, v3, :cond_2

    .line 3484
    :goto_1
    return-void

    .line 3466
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 3476
    :cond_2
    iget v3, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    invoke-static {v3}, Lcom/vkontakte/android/auth/VKAccountManager;->isCurrentUser(I)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 3477
    sget-object v2, Lcom/vkontakte/android/audio/player/PlayerRefer;->audios_my:Lcom/vkontakte/android/audio/player/PlayerRefer;

    .line 3483
    .local v2, "refer":Lcom/vkontakte/android/audio/player/PlayerRefer;
    :goto_2
    iget-object v3, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->audioPlaylist:Ljava/util/ArrayList;

    const/4 v4, 0x1

    invoke-static {v3, v1, v2, v4}, Lcom/vkontakte/android/audio/AudioFacade;->playTracks(Ljava/util/Collection;ILcom/vkontakte/android/audio/player/PlayerRefer;Z)V

    goto :goto_1

    .line 3478
    .end local v2    # "refer":Lcom/vkontakte/android/audio/player/PlayerRefer;
    :cond_3
    iget v3, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    if-ltz v3, :cond_4

    .line 3479
    sget-object v2, Lcom/vkontakte/android/audio/player/PlayerRefer;->audios_user:Lcom/vkontakte/android/audio/player/PlayerRefer;

    .restart local v2    # "refer":Lcom/vkontakte/android/audio/player/PlayerRefer;
    goto :goto_2

    .line 3481
    .end local v2    # "refer":Lcom/vkontakte/android/audio/player/PlayerRefer;
    :cond_4
    sget-object v2, Lcom/vkontakte/android/audio/player/PlayerRefer;->audios_group:Lcom/vkontakte/android/audio/player/PlayerRefer;

    .restart local v2    # "refer":Lcom/vkontakte/android/audio/player/PlayerRefer;
    goto :goto_2
.end method

.method private removeFriend()V
    .locals 7

    .prologue
    .line 2954
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->friendStatus:I

    const/4 v1, 0x3

    if-eq v0, v1, :cond_0

    .line 2955
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->doRemoveFriend()V

    .line 2964
    :goto_0
    return-void

    .line 2958
    :cond_0
    new-instance v0, Lcom/vkontakte/android/VKAlertDialog$Builder;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vkontakte/android/VKAlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x7f0801a4

    .line 2959
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 2960
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0801a5

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v6, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v6, v6, Lcom/vkontakte/android/api/ExtendedUserProfile;->firstNameAcc:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, " "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v6, v6, Lcom/vkontakte/android/api/ExtendedUserProfile;->lastNameAcc:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-virtual {v1, v2, v3}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f080798

    invoke-static {p0}, Lcom/vkontakte/android/fragments/ProfileFragment$$Lambda$38;->lambdaFactory$(Lcom/vkontakte/android/fragments/ProfileFragment;)Landroid/content/DialogInterface$OnClickListener;

    move-result-object v2

    .line 2961
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f080433

    const/4 v2, 0x0

    .line 2962
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 2963
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto :goto_0
.end method

.method private removeFromFavorites()V
    .locals 3

    .prologue
    .line 3130
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 3131
    .local v0, "activity":Landroid/app/Activity;
    iget v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    if-lez v1, :cond_0

    new-instance v1, Lcom/vkontakte/android/api/fave/FaveRemoveUser;

    iget v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    invoke-direct {v1, v2}, Lcom/vkontakte/android/api/fave/FaveRemoveUser;-><init>(I)V

    :goto_0
    new-instance v2, Lcom/vkontakte/android/fragments/ProfileFragment$30;

    invoke-direct {v2, p0, v0, v0}, Lcom/vkontakte/android/fragments/ProfileFragment$30;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;Landroid/content/Context;Landroid/app/Activity;)V

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/api/VKAPIRequest;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    .line 3140
    invoke-virtual {v1, v0}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 3141
    return-void

    .line 3131
    :cond_0
    new-instance v1, Lcom/vkontakte/android/api/fave/FaveRemoveGroup;

    iget v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    invoke-static {v2}, Ljava/lang/Math;->abs(I)I

    move-result v2

    invoke-direct {v1, v2}, Lcom/vkontakte/android/api/fave/FaveRemoveGroup;-><init>(I)V

    goto :goto_0
.end method

.method private sendAppIndexing()V
    .locals 9

    .prologue
    .line 3353
    iget v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    if-gez v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->groupAccess:I

    if-eqz v0, :cond_0

    .line 3389
    :goto_0
    return-void

    .line 3356
    :cond_0
    new-instance v0, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;-><init>(Landroid/content/Context;)V

    sget-object v1, Lcom/google/android/gms/appindexing/AppIndex;->APP_INDEX_API:Lcom/google/android/gms/common/api/Api;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;->addApi(Lcom/google/android/gms/common/api/Api;)Lcom/google/android/gms/common/api/GoogleApiClient$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;->build()Lcom/google/android/gms/common/api/GoogleApiClient;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->googleApiClient:Lcom/google/android/gms/common/api/GoogleApiClient;

    .line 3357
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->googleApiClient:Lcom/google/android/gms/common/api/GoogleApiClient;

    invoke-virtual {v0}, Lcom/google/android/gms/common/api/GoogleApiClient;->connect()V

    .line 3359
    const-string/jumbo v0, "android-app://com.vkontakte.android/vkontakte/m.vk.com/"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v7

    .line 3360
    .local v7, "appBaseUri":Landroid/net/Uri;
    const-string/jumbo v0, "https://vk.com/"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v8

    .line 3362
    .local v8, "webBaseUri":Landroid/net/Uri;
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 3385
    .local v6, "links":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/google/android/gms/appindexing/AppIndexApi$AppIndexingLink;>;"
    iget v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    if-gez v0, :cond_1

    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->profile:Lcom/vkontakte/android/UserProfile;

    iget-object v4, v0, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    .line 3386
    .local v4, "title":Ljava/lang/String;
    :goto_1
    invoke-virtual {v7}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v1, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->screenName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->indexingAppUri:Landroid/net/Uri;

    .line 3387
    invoke-virtual {v8}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v1, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->screenName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->indexingWebUri:Landroid/net/Uri;

    .line 3388
    sget-object v0, Lcom/google/android/gms/appindexing/AppIndex;->AppIndexApi:Lcom/google/android/gms/appindexing/AppIndexApi;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->googleApiClient:Lcom/google/android/gms/common/api/GoogleApiClient;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    iget-object v3, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->indexingAppUri:Landroid/net/Uri;

    iget-object v5, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->indexingWebUri:Landroid/net/Uri;

    invoke-interface/range {v0 .. v6}, Lcom/google/android/gms/appindexing/AppIndexApi;->view(Lcom/google/android/gms/common/api/GoogleApiClient;Landroid/app/Activity;Landroid/net/Uri;Ljava/lang/String;Landroid/net/Uri;Ljava/util/List;)Lcom/google/android/gms/common/api/PendingResult;

    goto :goto_0

    .line 3385
    .end local v4    # "title":Ljava/lang/String;
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v1, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->profile:Lcom/vkontakte/android/UserProfile;

    iget-object v1, v1, Lcom/vkontakte/android/UserProfile;->firstName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v1, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->profile:Lcom/vkontakte/android/UserProfile;

    iget-object v1, v1, Lcom/vkontakte/android/UserProfile;->lastName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_1
.end method

.method private sendGift()V
    .locals 2

    .prologue
    .line 833
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v1, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->profile:Lcom/vkontakte/android/UserProfile;

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->start(Landroid/app/Activity;Lcom/vkontakte/android/UserProfile;)V

    .line 834
    return-void
.end method

.method private setStatus(Ljava/lang/String;)V
    .locals 3
    .param p1, "status"    # Ljava/lang/String;

    .prologue
    .line 2809
    new-instance v1, Lcom/vkontakte/android/api/status/StatusSet;

    iget v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    if-gez v0, :cond_0

    iget v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    neg-int v0, v0

    :goto_0
    invoke-direct {v1, p1, v0}, Lcom/vkontakte/android/api/status/StatusSet;-><init>(Ljava/lang/String;I)V

    new-instance v0, Lcom/vkontakte/android/fragments/ProfileFragment$21;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-direct {v0, p0, v2, p1}, Lcom/vkontakte/android/fragments/ProfileFragment$21;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;Landroid/content/Context;Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Lcom/vkontakte/android/api/status/StatusSet;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 2830
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 2831
    return-void

    .line 2809
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private showChangeEventDecisionOptions(Landroid/view/View;)V
    .locals 6
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const/4 v5, 0x2

    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 3059
    new-instance v0, Landroid/widget/PopupMenu;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Landroid/widget/PopupMenu;-><init>(Landroid/content/Context;Landroid/view/View;)V

    .line 3060
    .local v0, "pm":Landroid/widget/PopupMenu;
    invoke-virtual {v0}, Landroid/widget/PopupMenu;->getMenu()Landroid/view/Menu;

    move-result-object v1

    const v2, 0x7f0802c3

    invoke-interface {v1, v4, v3, v4, v2}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    .line 3061
    invoke-virtual {v0}, Landroid/widget/PopupMenu;->getMenu()Landroid/view/Menu;

    move-result-object v1

    const v2, 0x7f0802c4

    invoke-interface {v1, v4, v5, v4, v2}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    .line 3062
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget v1, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->friendStatus:I

    if-eq v1, v3, :cond_0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget v1, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->friendStatus:I

    if-ne v1, v5, :cond_1

    .line 3063
    :cond_0
    invoke-virtual {v0}, Landroid/widget/PopupMenu;->getMenu()Landroid/view/Menu;

    move-result-object v1

    const/4 v2, 0x3

    const v3, 0x7f08032c

    invoke-interface {v1, v4, v2, v4, v3}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    .line 3065
    :cond_1
    invoke-static {p0}, Lcom/vkontakte/android/fragments/ProfileFragment$$Lambda$41;->lambdaFactory$(Lcom/vkontakte/android/fragments/ProfileFragment;)Landroid/widget/PopupMenu$OnMenuItemClickListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/PopupMenu;->setOnMenuItemClickListener(Landroid/widget/PopupMenu$OnMenuItemClickListener;)V

    .line 3073
    invoke-virtual {v0}, Landroid/widget/PopupMenu;->show()V

    .line 3074
    return-void
.end method

.method private showNewPost()V
    .locals 6

    .prologue
    const/4 v5, 0x2

    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 2758
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-static {v1}, Lcom/vkontakte/android/auth/VKAuth;->ensureLoggedIn(Landroid/content/Context;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 2768
    :goto_0
    return-void

    .line 2762
    :cond_0
    new-instance v1, Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;

    invoke-direct {v1}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;-><init>()V

    iget v4, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    invoke-virtual {v1, v4}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;->uid(I)Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;

    move-result-object v4

    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-boolean v1, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->canPost:Z

    if-nez v1, :cond_4

    iget v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    if-gez v1, :cond_4

    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget v1, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->adminLevel:I

    if-ge v1, v5, :cond_4

    move v1, v2

    :goto_1
    invoke-virtual {v4, v1}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;->suggest(Z)Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;

    move-result-object v0

    .line 2763
    .local v0, "fragment":Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;
    iget v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    if-gez v1, :cond_3

    .line 2764
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v1, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->profile:Lcom/vkontakte/android/UserProfile;

    iget-object v1, v1, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    iget-object v4, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->profile:Lcom/vkontakte/android/UserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    invoke-virtual {v0, v1, v4}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;->attachGroup(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;

    move-result-object v1

    iget-object v4, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->groupType:I

    if-eq v4, v5, :cond_1

    iget-object v4, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-boolean v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->canSeeAllPosts:Z

    if-nez v4, :cond_2

    :cond_1
    move v3, v2

    .line 2765
    :cond_2
    invoke-virtual {v1, v3}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;->isPublic(Z)Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;

    .line 2767
    :cond_3
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;->go(Landroid/content/Context;)Z

    goto :goto_0

    .end local v0    # "fragment":Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;
    :cond_4
    move v1, v3

    .line 2762
    goto :goto_1
.end method

.method private showStatusEditDlg(Ljava/lang/CharSequence;)V
    .locals 8
    .param p1, "text"    # Ljava/lang/CharSequence;

    .prologue
    const/high16 v7, 0x41800000    # 16.0f

    const/4 v6, 0x0

    .line 2782
    new-instance v1, Landroid/widget/EditText;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-direct {v1, v3}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    .line 2783
    .local v1, "ed":Landroid/widget/EditText;
    const/4 v3, 0x4

    invoke-virtual {v1, v3}, Landroid/widget/EditText;->setLines(I)V

    .line 2784
    const/16 v3, 0x33

    invoke-virtual {v1, v3}, Landroid/widget/EditText;->setGravity(I)V

    .line 2785
    invoke-virtual {v1, p1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 2786
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v3

    invoke-virtual {v1, v3}, Landroid/widget/EditText;->setSelection(I)V

    .line 2787
    const/4 v3, 0x1

    new-array v3, v3, [Landroid/text/InputFilter;

    new-instance v4, Landroid/text/InputFilter$LengthFilter;

    const/16 v5, 0x8c

    invoke-direct {v4, v5}, Landroid/text/InputFilter$LengthFilter;-><init>(I)V

    aput-object v4, v3, v6

    invoke-virtual {v1, v3}, Landroid/widget/EditText;->setFilters([Landroid/text/InputFilter;)V

    .line 2788
    new-instance v2, Landroid/widget/FrameLayout;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2789
    .local v2, "fl":Landroid/widget/FrameLayout;
    invoke-virtual {v2, v1}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 2790
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x15

    if-lt v3, v4, :cond_0

    .line 2791
    invoke-static {v7}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v3

    invoke-static {v7}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v4

    invoke-virtual {v2, v3, v6, v4, v6}, Landroid/widget/FrameLayout;->setPadding(IIII)V

    .line 2793
    :cond_0
    new-instance v3, Lcom/vkontakte/android/VKAlertDialog$Builder;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/vkontakte/android/VKAlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v4, 0x7f0806bc

    .line 2794
    invoke-virtual {v3, v4}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    .line 2795
    invoke-virtual {v3, v2}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    const v4, 0x7f0805d9

    invoke-static {p0, v1}, Lcom/vkontakte/android/fragments/ProfileFragment$$Lambda$35;->lambdaFactory$(Lcom/vkontakte/android/fragments/ProfileFragment;Landroid/widget/EditText;)Landroid/content/DialogInterface$OnClickListener;

    move-result-object v5

    .line 2796
    invoke-virtual {v3, v4, v5}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    const v4, 0x7f08011f

    const/4 v5, 0x0

    .line 2799
    invoke-virtual {v3, v4, v5}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    .line 2800
    invoke-virtual {v3}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 2801
    .local v0, "dlg":Landroid/app/AlertDialog;
    invoke-static {p0, v1}, Lcom/vkontakte/android/fragments/ProfileFragment$$Lambda$36;->lambdaFactory$(Lcom/vkontakte/android/fragments/ProfileFragment;Landroid/widget/EditText;)Landroid/content/DialogInterface$OnShowListener;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/app/AlertDialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    .line 2805
    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    .line 2806
    return-void
.end method

.method private switchOwnerOnly(Z)V
    .locals 4
    .param p1, "owner"    # Z

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 1705
    iget-boolean v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->ownerOnly:Z

    if-eq p1, v2, :cond_0

    iget-boolean v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->dataLoading:Z

    if-eqz v2, :cond_1

    .line 1718
    :cond_0
    :goto_0
    return-void

    .line 1708
    :cond_1
    iput-boolean p1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->ownerOnly:Z

    .line 1709
    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->refreshing:Z

    .line 1710
    iget v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->itemsPerPage:I

    mul-int/lit8 v2, v2, 0x2

    invoke-direct {p0, v1, v2}, Lcom/vkontakte/android/fragments/ProfileFragment;->loadWall(II)V

    .line 1711
    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->selector:Landroid/view/View;

    const v3, 0x7f100501

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    if-nez p1, :cond_2

    :goto_1
    invoke-virtual {v2, v0}, Landroid/view/View;->setSelected(Z)V

    .line 1712
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->selector:Landroid/view/View;

    const v2, 0x7f100502

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/view/View;->setSelected(Z)V

    .line 1713
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->selector:Landroid/view/View;

    const v2, 0x7f100503

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const/4 v2, 0x4

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 1714
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->selector:Landroid/view/View;

    const v2, 0x7f100504

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0

    :cond_2
    move v0, v1

    .line 1711
    goto :goto_1
.end method

.method private toggleBlacklist()V
    .locals 7

    .prologue
    .line 3157
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-boolean v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->blacklisted:Z

    if-eqz v0, :cond_0

    .line 3158
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->doToggleBlacklist()V

    .line 3169
    :goto_0
    return-void

    .line 3160
    :cond_0
    new-instance v0, Lcom/vkontakte/android/VKAlertDialog$Builder;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vkontakte/android/VKAlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 3161
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f080178

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v6, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v6, v6, Lcom/vkontakte/android/api/ExtendedUserProfile;->firstNameAcc:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, " "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v6, v6, Lcom/vkontakte/android/api/ExtendedUserProfile;->lastNameAcc:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-virtual {v1, v2, v3}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f080176

    .line 3162
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f080798

    invoke-static {p0}, Lcom/vkontakte/android/fragments/ProfileFragment$$Lambda$43;->lambdaFactory$(Lcom/vkontakte/android/fragments/ProfileFragment;)Landroid/content/DialogInterface$OnClickListener;

    move-result-object v2

    .line 3163
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f080433

    const/4 v2, 0x0

    .line 3166
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 3167
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto :goto_0
.end method

.method private toggleExtendedInfo()V
    .locals 1

    .prologue
    .line 2752
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->showExtended:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->showExtended:Z

    .line 2754
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->infoAdapter:Lcom/vkontakte/android/fragments/ProfileFragment$ProfileInfoAdapter;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/ProfileFragment$ProfileInfoAdapter;->notifyDataSetChanged()V

    .line 2755
    return-void

    .line 2752
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private toggleLiveSubscription()V
    .locals 4

    .prologue
    .line 3186
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 3187
    .local v0, "activity":Landroid/app/Activity;
    new-instance v2, Lcom/vkontakte/android/api/video/VideoLiveSubscribe;

    iget v3, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-boolean v1, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->isLiveSubscribed:Z

    if-nez v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    invoke-direct {v2, v3, v1}, Lcom/vkontakte/android/api/video/VideoLiveSubscribe;-><init>(IZ)V

    new-instance v1, Lcom/vkontakte/android/fragments/ProfileFragment$32;

    invoke-direct {v1, p0, v0, v0}, Lcom/vkontakte/android/fragments/ProfileFragment$32;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;Landroid/content/Context;Landroid/app/Activity;)V

    invoke-virtual {v2, v1}, Lcom/vkontakte/android/api/video/VideoLiveSubscribe;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    .line 3198
    invoke-virtual {v1, v0}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 3199
    return-void

    .line 3187
    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private toggleNewsHidden()V
    .locals 4

    .prologue
    .line 3000
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-boolean v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->isHiddenFromFeed:Z

    if-eqz v0, :cond_0

    .line 3001
    new-instance v0, Lcom/vkontakte/android/api/newsfeed/NewsfeedDeleteBan;

    iget v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    invoke-direct {v0, v1}, Lcom/vkontakte/android/api/newsfeed/NewsfeedDeleteBan;-><init>(I)V

    new-instance v1, Lcom/vkontakte/android/fragments/ProfileFragment$25;

    invoke-direct {v1, p0, p0}, Lcom/vkontakte/android/fragments/ProfileFragment$25;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;Landroid/app/Fragment;)V

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/newsfeed/NewsfeedDeleteBan;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 3007
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 3017
    :goto_0
    return-void

    .line 3009
    :cond_0
    new-instance v0, Lcom/vkontakte/android/api/newsfeed/NewsfeedAddBan;

    iget v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getListReferrer()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-direct {v0, v1, v2, v3}, Lcom/vkontakte/android/api/newsfeed/NewsfeedAddBan;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    new-instance v1, Lcom/vkontakte/android/fragments/ProfileFragment$26;

    invoke-direct {v1, p0, p0}, Lcom/vkontakte/android/fragments/ProfileFragment$26;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;Landroid/app/Fragment;)V

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/newsfeed/NewsfeedAddBan;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 3015
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    goto :goto_0
.end method

.method private togglePostSubscription()V
    .locals 4

    .prologue
    .line 3172
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 3173
    .local v0, "activity":Landroid/app/Activity;
    new-instance v2, Lcom/vkontakte/android/api/wall/WallSubscribe;

    iget v3, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-boolean v1, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->isSubscribed:Z

    if-nez v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    invoke-direct {v2, v3, v1}, Lcom/vkontakte/android/api/wall/WallSubscribe;-><init>(IZ)V

    new-instance v1, Lcom/vkontakte/android/fragments/ProfileFragment$31;

    invoke-direct {v1, p0, v0, v0}, Lcom/vkontakte/android/fragments/ProfileFragment$31;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;Landroid/content/Context;Landroid/app/Activity;)V

    invoke-virtual {v2, v1}, Lcom/vkontakte/android/api/wall/WallSubscribe;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    .line 3182
    invoke-virtual {v1, v0}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 3183
    return-void

    .line 3173
    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private updateButtons()V
    .locals 14

    .prologue
    const/16 v13, 0x2710

    const/4 v12, 0x2

    const/4 v11, 0x1

    const/16 v10, 0x8

    const/4 v9, 0x0

    .line 1167
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->invalidateOptionsMenu()V

    .line 1168
    iget-object v7, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->headerView:Landroid/view/View;

    const v8, 0x7f1004f6

    invoke-virtual {v7, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    .line 1169
    .local v1, "btn1":Landroid/widget/Button;
    iget-object v7, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->headerView:Landroid/view/View;

    const v8, 0x7f1004f7

    invoke-virtual {v7, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Button;

    .line 1170
    .local v2, "btn2":Landroid/widget/Button;
    iget-object v7, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->headerView:Landroid/view/View;

    const v8, 0x7f1004f8

    invoke-virtual {v7, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/Button;

    .line 1171
    .local v3, "btn3":Landroid/widget/Button;
    iget-object v7, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->btnClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v1, v7}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1172
    iget-object v7, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->btnClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v2, v7}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1173
    iget-object v7, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->btnClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v3, v7}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1174
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v7

    invoke-virtual {v7}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v7

    if-eqz v7, :cond_0

    iget-object v7, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget v7, v7, Lcom/vkontakte/android/api/ExtendedUserProfile;->friendStatus:I

    const/4 v8, -0x1

    if-eq v7, v8, :cond_0

    iget-object v7, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    invoke-virtual {v7}, Lcom/vkontakte/android/api/ExtendedUserProfile;->isDeactivated()Z

    move-result v7

    if-nez v7, :cond_0

    iget v7, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v8

    invoke-virtual {v8}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v8

    if-eq v7, v8, :cond_0

    iget v7, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    if-gez v7, :cond_2

    iget-object v7, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget v7, v7, Lcom/vkontakte/android/api/ExtendedUserProfile;->friendStatus:I

    const/4 v8, 0x5

    if-ne v7, v8, :cond_2

    iget-object v7, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-boolean v7, v7, Lcom/vkontakte/android/api/ExtendedUserProfile;->canWrite:Z

    if-nez v7, :cond_2

    .line 1175
    :cond_0
    iget-object v7, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->headerView:Landroid/view/View;

    const v8, 0x7f1004f5

    invoke-virtual {v7, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    invoke-virtual {v7, v10}, Landroid/view/View;->setVisibility(I)V

    .line 1298
    :cond_1
    :goto_0
    return-void

    .line 1178
    :cond_2
    iget-object v7, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->headerView:Landroid/view/View;

    const v8, 0x7f1004f5

    invoke-virtual {v7, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    invoke-virtual {v7, v9}, Landroid/view/View;->setVisibility(I)V

    .line 1179
    iget v7, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    if-lez v7, :cond_3

    .line 1180
    iget v7, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v8

    invoke-virtual {v8}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v8

    if-ne v7, v8, :cond_5

    .line 1181
    invoke-virtual {v1, v10}, Landroid/widget/Button;->setVisibility(I)V

    .line 1182
    invoke-virtual {v2, v10}, Landroid/widget/Button;->setVisibility(I)V

    .line 1183
    invoke-virtual {v3, v9}, Landroid/widget/Button;->setVisibility(I)V

    .line 1184
    const v7, 0x7f0801da

    invoke-virtual {v3, v7}, Landroid/widget/Button;->setText(I)V

    .line 1185
    const-string/jumbo v7, "edit"

    invoke-virtual {v3, v7}, Landroid/widget/Button;->setTag(Ljava/lang/Object;)V

    .line 1224
    :cond_3
    :goto_1
    iget v7, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    if-gez v7, :cond_1

    .line 1225
    iget-object v7, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-boolean v7, v7, Lcom/vkontakte/android/api/ExtendedUserProfile;->canWrite:Z

    if-eqz v7, :cond_9

    .line 1226
    const v7, 0x7f08035b

    invoke-virtual {v1, v7}, Landroid/widget/Button;->setText(I)V

    .line 1227
    const-string/jumbo v7, "message"

    invoke-virtual {v1, v7}, Landroid/widget/Button;->setTag(Ljava/lang/Object;)V

    .line 1231
    :goto_2
    iget-object v7, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget v7, v7, Lcom/vkontakte/android/api/ExtendedUserProfile;->friendStatus:I

    if-nez v7, :cond_e

    .line 1232
    invoke-virtual {v3, v10}, Landroid/widget/Button;->setVisibility(I)V

    .line 1233
    invoke-virtual {v2, v9}, Landroid/widget/Button;->setVisibility(I)V

    .line 1234
    iget-object v7, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget v7, v7, Lcom/vkontakte/android/api/ExtendedUserProfile;->groupAccess:I

    if-eq v7, v12, :cond_4

    iget-object v7, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget v7, v7, Lcom/vkontakte/android/api/ExtendedUserProfile;->groupType:I

    if-ne v7, v11, :cond_a

    iget-object v7, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget v7, v7, Lcom/vkontakte/android/api/ExtendedUserProfile;->groupAccess:I

    if-ne v7, v11, :cond_a

    .line 1235
    :cond_4
    invoke-virtual {v2, v10}, Landroid/widget/Button;->setVisibility(I)V

    goto :goto_0

    .line 1187
    :cond_5
    const v7, 0x7f08035b

    invoke-virtual {v1, v7}, Landroid/widget/Button;->setText(I)V

    .line 1188
    iget-object v7, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-boolean v7, v7, Lcom/vkontakte/android/api/ExtendedUserProfile;->canWrite:Z

    invoke-virtual {v1, v7}, Landroid/widget/Button;->setEnabled(Z)V

    .line 1189
    const-string/jumbo v7, "message"

    invoke-virtual {v1, v7}, Landroid/widget/Button;->setTag(Ljava/lang/Object;)V

    .line 1190
    invoke-virtual {v1, v9}, Landroid/widget/Button;->setVisibility(I)V

    .line 1191
    iget-object v7, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget v7, v7, Lcom/vkontakte/android/api/ExtendedUserProfile;->friendStatus:I

    if-nez v7, :cond_7

    .line 1192
    invoke-virtual {v3, v10}, Landroid/widget/Button;->setVisibility(I)V

    .line 1193
    invoke-virtual {v2, v9}, Landroid/widget/Button;->setVisibility(I)V

    .line 1194
    iget-object v7, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-boolean v7, v7, Lcom/vkontakte/android/api/ExtendedUserProfile;->canSendFriendRequest:Z

    if-eqz v7, :cond_6

    const v7, 0x7f080540

    :goto_3
    invoke-virtual {v2, v7}, Landroid/widget/Button;->setText(I)V

    .line 1195
    const-string/jumbo v7, "add"

    invoke-virtual {v2, v7}, Landroid/widget/Button;->setTag(Ljava/lang/Object;)V

    goto :goto_1

    .line 1194
    :cond_6
    const v7, 0x7f08057e

    goto :goto_3

    .line 1197
    :cond_7
    invoke-virtual {v2, v10}, Landroid/widget/Button;->setVisibility(I)V

    .line 1198
    invoke-virtual {v3, v9}, Landroid/widget/Button;->setVisibility(I)V

    .line 1199
    const-string/jumbo v7, "options"

    invoke-virtual {v3, v7}, Landroid/widget/Button;->setTag(Ljava/lang/Object;)V

    .line 1200
    const-string/jumbo v6, ""

    .line 1201
    .local v6, "text":Ljava/lang/String;
    iget-object v7, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget v7, v7, Lcom/vkontakte/android/api/ExtendedUserProfile;->friendStatus:I

    packed-switch v7, :pswitch_data_0

    .line 1212
    :goto_4
    new-instance v0, Landroid/text/SpannableStringBuilder;

    invoke-direct {v0, v6}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 1213
    .local v0, "bldr":Landroid/text/SpannableStringBuilder;
    invoke-static {}, Landroid/text/Spannable$Factory;->getInstance()Landroid/text/Spannable$Factory;

    move-result-object v7

    const-string/jumbo v8, "F"

    invoke-virtual {v7, v8}, Landroid/text/Spannable$Factory;->newSpannable(Ljava/lang/CharSequence;)Landroid/text/Spannable;

    move-result-object v5

    .line 1214
    .local v5, "sp":Landroid/text/Spannable;
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    const v8, 0x7f020254

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    .line 1215
    .local v4, "d":Landroid/graphics/drawable/Drawable;
    invoke-virtual {v4}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v7

    invoke-virtual {v4}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v8

    invoke-virtual {v4, v9, v9, v7, v8}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 1216
    invoke-virtual {v4, v13}, Landroid/graphics/drawable/Drawable;->setLevel(I)Z

    .line 1217
    new-instance v7, Landroid/text/style/ImageSpan;

    invoke-direct {v7, v4, v11}, Landroid/text/style/ImageSpan;-><init>(Landroid/graphics/drawable/Drawable;I)V

    invoke-interface {v5, v7, v9, v11, v9}, Landroid/text/Spannable;->setSpan(Ljava/lang/Object;III)V

    .line 1218
    const-string/jumbo v7, " "

    invoke-virtual {v0, v7}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 1219
    invoke-virtual {v0, v5}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 1220
    invoke-virtual {v3, v0}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_1

    .line 1203
    .end local v0    # "bldr":Landroid/text/SpannableStringBuilder;
    .end local v4    # "d":Landroid/graphics/drawable/Drawable;
    .end local v5    # "sp":Landroid/text/Spannable;
    :pswitch_0
    const v7, 0x7f080545

    invoke-virtual {p0, v7}, Lcom/vkontakte/android/fragments/ProfileFragment;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 1204
    goto :goto_4

    .line 1206
    :pswitch_1
    iget-object v7, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-boolean v7, v7, Lcom/vkontakte/android/api/ExtendedUserProfile;->canSendFriendRequest:Z

    if-eqz v7, :cond_8

    const v7, 0x7f080547

    :goto_5
    invoke-virtual {p0, v7}, Lcom/vkontakte/android/fragments/ProfileFragment;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 1207
    goto :goto_4

    .line 1206
    :cond_8
    const v7, 0x7f080548

    goto :goto_5

    .line 1209
    :pswitch_2
    const v7, 0x7f080546

    invoke-virtual {p0, v7}, Lcom/vkontakte/android/fragments/ProfileFragment;->getString(I)Ljava/lang/String;

    move-result-object v6

    goto :goto_4

    .line 1229
    .end local v6    # "text":Ljava/lang/String;
    :cond_9
    invoke-virtual {v1, v10}, Landroid/widget/Button;->setVisibility(I)V

    goto/16 :goto_2

    .line 1236
    :cond_a
    iget-object v7, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget v7, v7, Lcom/vkontakte/android/api/ExtendedUserProfile;->groupType:I

    if-nez v7, :cond_c

    .line 1237
    iget-object v7, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget v7, v7, Lcom/vkontakte/android/api/ExtendedUserProfile;->groupAccess:I

    if-nez v7, :cond_b

    const v7, 0x7f080324

    :goto_6
    invoke-virtual {v2, v7}, Landroid/widget/Button;->setText(I)V

    .line 1238
    const-string/jumbo v7, "join"

    invoke-virtual {v2, v7}, Landroid/widget/Button;->setTag(Ljava/lang/Object;)V

    goto/16 :goto_0

    .line 1237
    :cond_b
    const v7, 0x7f080325

    goto :goto_6

    .line 1239
    :cond_c
    iget-object v7, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget v7, v7, Lcom/vkontakte/android/api/ExtendedUserProfile;->groupType:I

    if-ne v7, v11, :cond_d

    .line 1240
    const v7, 0x7f080323

    invoke-virtual {v2, v7}, Landroid/widget/Button;->setText(I)V

    .line 1241
    const-string/jumbo v7, "event_options"

    invoke-virtual {v2, v7}, Landroid/widget/Button;->setTag(Ljava/lang/Object;)V

    goto/16 :goto_0

    .line 1242
    :cond_d
    iget-object v7, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget v7, v7, Lcom/vkontakte/android/api/ExtendedUserProfile;->groupType:I

    if-ne v7, v12, :cond_1

    .line 1243
    const v7, 0x7f080326

    invoke-virtual {v2, v7}, Landroid/widget/Button;->setText(I)V

    .line 1244
    const-string/jumbo v7, "join"

    invoke-virtual {v2, v7}, Landroid/widget/Button;->setTag(Ljava/lang/Object;)V

    goto/16 :goto_0

    .line 1246
    :cond_e
    iget-object v7, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget v7, v7, Lcom/vkontakte/android/api/ExtendedUserProfile;->friendStatus:I

    if-eq v7, v11, :cond_f

    iget-object v7, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget v7, v7, Lcom/vkontakte/android/api/ExtendedUserProfile;->friendStatus:I

    if-ne v7, v12, :cond_15

    .line 1247
    :cond_f
    invoke-virtual {v2, v10}, Landroid/widget/Button;->setVisibility(I)V

    .line 1248
    invoke-virtual {v3, v9}, Landroid/widget/Button;->setVisibility(I)V

    .line 1249
    const-string/jumbo v6, ""

    .line 1250
    .restart local v6    # "text":Ljava/lang/String;
    iget-object v7, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget v7, v7, Lcom/vkontakte/android/api/ExtendedUserProfile;->groupType:I

    if-nez v7, :cond_11

    .line 1251
    const v7, 0x7f0802d7

    invoke-virtual {p0, v7}, Lcom/vkontakte/android/fragments/ProfileFragment;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 1257
    :cond_10
    :goto_7
    new-instance v0, Landroid/text/SpannableStringBuilder;

    invoke-direct {v0, v6}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 1258
    .restart local v0    # "bldr":Landroid/text/SpannableStringBuilder;
    invoke-static {}, Landroid/text/Spannable$Factory;->getInstance()Landroid/text/Spannable$Factory;

    move-result-object v7

    const-string/jumbo v8, "F"

    invoke-virtual {v7, v8}, Landroid/text/Spannable$Factory;->newSpannable(Ljava/lang/CharSequence;)Landroid/text/Spannable;

    move-result-object v5

    .line 1259
    .restart local v5    # "sp":Landroid/text/Spannable;
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    const v8, 0x7f020254

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    .line 1260
    .restart local v4    # "d":Landroid/graphics/drawable/Drawable;
    invoke-virtual {v4}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v7

    invoke-virtual {v4}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v8

    invoke-virtual {v4, v9, v9, v7, v8}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 1261
    invoke-virtual {v4, v13}, Landroid/graphics/drawable/Drawable;->setLevel(I)Z

    .line 1262
    new-instance v7, Landroid/text/style/ImageSpan;

    invoke-direct {v7, v4, v11}, Landroid/text/style/ImageSpan;-><init>(Landroid/graphics/drawable/Drawable;I)V

    invoke-interface {v5, v7, v9, v11, v9}, Landroid/text/Spannable;->setSpan(Ljava/lang/Object;III)V

    .line 1263
    const-string/jumbo v7, " "

    invoke-virtual {v0, v7}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 1264
    invoke-virtual {v0, v5}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 1265
    invoke-virtual {v3, v0}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 1266
    const-string/jumbo v7, "options"

    invoke-virtual {v3, v7}, Landroid/widget/Button;->setTag(Ljava/lang/Object;)V

    goto/16 :goto_0

    .line 1252
    .end local v0    # "bldr":Landroid/text/SpannableStringBuilder;
    .end local v4    # "d":Landroid/graphics/drawable/Drawable;
    .end local v5    # "sp":Landroid/text/Spannable;
    :cond_11
    iget-object v7, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget v7, v7, Lcom/vkontakte/android/api/ExtendedUserProfile;->groupType:I

    if-ne v7, v11, :cond_14

    .line 1253
    iget-object v7, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget v7, v7, Lcom/vkontakte/android/api/ExtendedUserProfile;->eventStartTime:I

    invoke-static {}, Lcom/vkontakte/android/TimeUtils;->getCurrentTime()I

    move-result v8

    if-le v7, v8, :cond_13

    iget-object v7, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget v7, v7, Lcom/vkontakte/android/api/ExtendedUserProfile;->friendStatus:I

    if-ne v7, v12, :cond_12

    const v7, 0x7f080205

    :goto_8
    invoke-virtual {p0, v7}, Lcom/vkontakte/android/fragments/ProfileFragment;->getString(I)Ljava/lang/String;

    move-result-object v6

    goto :goto_7

    :cond_12
    const v7, 0x7f080204

    goto :goto_8

    :cond_13
    const v7, 0x7f0802d7

    goto :goto_8

    .line 1254
    :cond_14
    iget-object v7, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget v7, v7, Lcom/vkontakte/android/api/ExtendedUserProfile;->groupType:I

    if-ne v7, v12, :cond_10

    .line 1255
    const v7, 0x7f080548

    invoke-virtual {p0, v7}, Lcom/vkontakte/android/fragments/ProfileFragment;->getString(I)Ljava/lang/String;

    move-result-object v6

    goto :goto_7

    .line 1267
    .end local v6    # "text":Ljava/lang/String;
    :cond_15
    iget-object v7, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget v7, v7, Lcom/vkontakte/android/api/ExtendedUserProfile;->friendStatus:I

    const/4 v8, 0x4

    if-ne v7, v8, :cond_16

    .line 1268
    invoke-virtual {v2, v10}, Landroid/widget/Button;->setVisibility(I)V

    .line 1269
    invoke-virtual {v3, v9}, Landroid/widget/Button;->setVisibility(I)V

    .line 1270
    const v7, 0x7f0802ef

    invoke-virtual {p0, v7}, Lcom/vkontakte/android/fragments/ProfileFragment;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 1271
    .restart local v6    # "text":Ljava/lang/String;
    new-instance v0, Landroid/text/SpannableStringBuilder;

    invoke-direct {v0, v6}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 1272
    .restart local v0    # "bldr":Landroid/text/SpannableStringBuilder;
    invoke-static {}, Landroid/text/Spannable$Factory;->getInstance()Landroid/text/Spannable$Factory;

    move-result-object v7

    const-string/jumbo v8, "F"

    invoke-virtual {v7, v8}, Landroid/text/Spannable$Factory;->newSpannable(Ljava/lang/CharSequence;)Landroid/text/Spannable;

    move-result-object v5

    .line 1273
    .restart local v5    # "sp":Landroid/text/Spannable;
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    const v8, 0x7f020254

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    .line 1274
    .restart local v4    # "d":Landroid/graphics/drawable/Drawable;
    invoke-virtual {v4}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v7

    invoke-virtual {v4}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v8

    invoke-virtual {v4, v9, v9, v7, v8}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 1275
    invoke-virtual {v4, v13}, Landroid/graphics/drawable/Drawable;->setLevel(I)Z

    .line 1276
    new-instance v7, Landroid/text/style/ImageSpan;

    invoke-direct {v7, v4, v11}, Landroid/text/style/ImageSpan;-><init>(Landroid/graphics/drawable/Drawable;I)V

    invoke-interface {v5, v7, v9, v11, v9}, Landroid/text/Spannable;->setSpan(Ljava/lang/Object;III)V

    .line 1277
    const-string/jumbo v7, " "

    invoke-virtual {v0, v7}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 1278
    invoke-virtual {v0, v5}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 1279
    invoke-virtual {v3, v0}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 1280
    const-string/jumbo v7, "options"

    invoke-virtual {v3, v7}, Landroid/widget/Button;->setTag(Ljava/lang/Object;)V

    goto/16 :goto_0

    .line 1281
    .end local v0    # "bldr":Landroid/text/SpannableStringBuilder;
    .end local v4    # "d":Landroid/graphics/drawable/Drawable;
    .end local v5    # "sp":Landroid/text/Spannable;
    .end local v6    # "text":Ljava/lang/String;
    :cond_16
    iget-object v7, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget v7, v7, Lcom/vkontakte/android/api/ExtendedUserProfile;->friendStatus:I

    const/4 v8, 0x5

    if-ne v7, v8, :cond_1

    .line 1282
    invoke-virtual {v2, v10}, Landroid/widget/Button;->setVisibility(I)V

    .line 1283
    invoke-virtual {v3, v10}, Landroid/widget/Button;->setVisibility(I)V

    goto/16 :goto_0

    .line 1201
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_2
        :pswitch_0
    .end packed-switch
.end method

.method private updateCounters()Z
    .locals 31

    .prologue
    .line 1387
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->countersWrap:Landroid/widget/LinearLayout;

    if-eqz v4, :cond_0

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    if-eqz v4, :cond_0

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->counters:Ljava/util/HashMap;

    if-nez v4, :cond_1

    .line 1388
    :cond_0
    const/4 v4, 0x0

    .line 1623
    :goto_0
    return v4

    .line 1390
    :cond_1
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->countersWrap:Landroid/widget/LinearLayout;

    invoke-virtual {v4}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 1393
    move-object/from16 v0, p0

    iget v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    if-eqz v4, :cond_2

    move-object/from16 v0, p0

    iget v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v5

    invoke-virtual {v5}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v5

    if-ne v4, v5, :cond_b

    .line 1394
    :cond_2
    const/16 v4, 0x8

    new-array v15, v4, [Ljava/lang/String;

    const/4 v4, 0x0

    const-string/jumbo v5, "stories"

    aput-object v5, v15, v4

    const/4 v4, 0x1

    const-string/jumbo v5, "photos"

    aput-object v5, v15, v4

    const/4 v4, 0x2

    const-string/jumbo v5, "videos"

    aput-object v5, v15, v4

    const/4 v4, 0x3

    const-string/jumbo v5, "audios"

    aput-object v5, v15, v4

    const/4 v4, 0x4

    const-string/jumbo v5, "subscriptions"

    aput-object v5, v15, v4

    const/4 v4, 0x5

    const-string/jumbo v5, "groups"

    aput-object v5, v15, v4

    const/4 v4, 0x6

    const-string/jumbo v5, "docs"

    aput-object v5, v15, v4

    const/4 v4, 0x7

    const-string/jumbo v5, "gifts"

    aput-object v5, v15, v4

    .line 1395
    .local v15, "cntrs":[Ljava/lang/String;
    const/16 v4, 0x8

    new-array v0, v4, [I

    move-object/from16 v28, v0

    fill-array-data v28, :array_0

    .line 1403
    .local v28, "titleRes":[I
    :goto_1
    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    const-string/jumbo v7, "members"

    aput-object v7, v4, v5

    invoke-static {v4}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v16

    .line 1404
    .local v16, "countersToHide":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->countersWrap:Landroid/widget/LinearLayout;

    move-object/from16 v17, v0

    .line 1405
    .local v17, "curLayout":Landroid/widget/LinearLayout;
    invoke-static {}, Ljava/text/NumberFormat;->getIntegerInstance()Ljava/text/NumberFormat;

    move-result-object v24

    .line 1406
    .local v24, "nf":Ljava/text/NumberFormat;
    const/16 v22, 0x0

    .local v22, "i":I
    :goto_2
    array-length v4, v15

    move/from16 v0, v22

    if-ge v0, v4, :cond_21

    .line 1407
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    aget-object v5, v15, v22

    invoke-virtual {v4, v5}, Lcom/vkontakte/android/api/ExtendedUserProfile;->hasCounter(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_a

    .line 1409
    aget-object v5, v15, v22

    const/4 v4, -0x1

    invoke-virtual {v5}, Ljava/lang/String;->hashCode()I

    move-result v7

    sparse-switch v7, :sswitch_data_0

    :cond_3
    :goto_3
    packed-switch v4, :pswitch_data_0

    .line 1442
    :cond_4
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    aget-object v5, v15, v22

    invoke-virtual {v4, v5}, Lcom/vkontakte/android/api/ExtendedUserProfile;->getCounter(Ljava/lang/String;)I

    move-result v4

    if-gtz v4, :cond_5

    move-object/from16 v0, p0

    iget v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    if-gez v4, :cond_a

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->adminLevel:I

    const/4 v5, 0x2

    if-lt v4, v5, :cond_a

    aget-object v4, v15, v22

    move-object/from16 v0, v16

    invoke-interface {v0, v4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_a

    .line 1443
    :cond_5
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-virtual {v4}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v4

    const v5, 0x7f0301ca

    const/4 v7, 0x0

    move-object/from16 v0, v17

    invoke-virtual {v4, v5, v0, v7}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v14

    .line 1445
    .local v14, "cntr":Landroid/view/View;
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    aget-object v5, v15, v22

    invoke-virtual {v4, v5}, Lcom/vkontakte/android/api/ExtendedUserProfile;->getCounter(Ljava/lang/String;)I

    move-result v13

    .line 1446
    .local v13, "c":I
    aget v4, v28, v22

    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/vkontakte/android/fragments/ProfileFragment;->getString(I)Ljava/lang/String;

    move-result-object v27

    .line 1447
    .local v27, "title":Ljava/lang/String;
    if-lez v13, :cond_6

    .line 1448
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v27

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "  /cFF909499"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const v4, 0x1869f

    if-le v13, v4, :cond_d

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    div-int/lit16 v7, v13, 0x3e8

    int-to-long v8, v7

    move-object/from16 v0, v24

    invoke-virtual {v0, v8, v9}, Ljava/text/NumberFormat;->format(J)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v7, "K"

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    :goto_4
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "/e"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    .line 1451
    :cond_6
    const v4, 0x7f1004d1

    invoke-virtual {v14, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    invoke-static/range {v27 .. v27}, Lcom/vkontakte/android/TextFormatter;->processString(Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1453
    aget-object v4, v15, v22

    invoke-virtual {v14, v4}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 1454
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->counterClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v14, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1455
    aget-object v5, v15, v22

    const/4 v4, -0x1

    invoke-virtual {v5}, Ljava/lang/String;->hashCode()I

    move-result v7

    sparse-switch v7, :sswitch_data_1

    :cond_7
    :goto_5
    packed-switch v4, :pswitch_data_1

    .line 1481
    :goto_6
    const v4, 0x7f1004d2

    invoke-virtual {v14, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v21

    check-cast v21, Landroid/widget/FrameLayout;

    .line 1482
    .local v21, "fl":Landroid/widget/FrameLayout;
    aget-object v5, v15, v22

    const/4 v4, -0x1

    invoke-virtual {v5}, Ljava/lang/String;->hashCode()I

    move-result v7

    sparse-switch v7, :sswitch_data_2

    :cond_8
    :goto_7
    packed-switch v4, :pswitch_data_2

    .line 1619
    :cond_9
    :goto_8
    move-object/from16 v0, v17

    invoke-virtual {v0, v14}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 1406
    .end local v13    # "c":I
    .end local v14    # "cntr":Landroid/view/View;
    .end local v21    # "fl":Landroid/widget/FrameLayout;
    .end local v27    # "title":Ljava/lang/String;
    :cond_a
    :goto_9
    add-int/lit8 v22, v22, 0x1

    goto/16 :goto_2

    .line 1396
    .end local v15    # "cntrs":[Ljava/lang/String;
    .end local v16    # "countersToHide":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v17    # "curLayout":Landroid/widget/LinearLayout;
    .end local v22    # "i":I
    .end local v24    # "nf":Ljava/text/NumberFormat;
    .end local v28    # "titleRes":[I
    :cond_b
    move-object/from16 v0, p0

    iget v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    if-gez v4, :cond_c

    .line 1397
    const/4 v4, 0x6

    new-array v15, v4, [Ljava/lang/String;

    const/4 v4, 0x0

    const-string/jumbo v5, "market"

    aput-object v5, v15, v4

    const/4 v4, 0x1

    const-string/jumbo v5, "photos"

    aput-object v5, v15, v4

    const/4 v4, 0x2

    const-string/jumbo v5, "topics"

    aput-object v5, v15, v4

    const/4 v4, 0x3

    const-string/jumbo v5, "docs"

    aput-object v5, v15, v4

    const/4 v4, 0x4

    const-string/jumbo v5, "videos"

    aput-object v5, v15, v4

    const/4 v4, 0x5

    const-string/jumbo v5, "audios"

    aput-object v5, v15, v4

    .line 1398
    .restart local v15    # "cntrs":[Ljava/lang/String;
    const/4 v4, 0x6

    new-array v0, v4, [I

    move-object/from16 v28, v0

    fill-array-data v28, :array_1

    .restart local v28    # "titleRes":[I
    goto/16 :goto_1

    .line 1400
    .end local v15    # "cntrs":[Ljava/lang/String;
    .end local v28    # "titleRes":[I
    :cond_c
    const/4 v4, 0x7

    new-array v15, v4, [Ljava/lang/String;

    const/4 v4, 0x0

    const-string/jumbo v5, "stories"

    aput-object v5, v15, v4

    const/4 v4, 0x1

    const-string/jumbo v5, "photos"

    aput-object v5, v15, v4

    const/4 v4, 0x2

    const-string/jumbo v5, "videos"

    aput-object v5, v15, v4

    const/4 v4, 0x3

    const-string/jumbo v5, "audios"

    aput-object v5, v15, v4

    const/4 v4, 0x4

    const-string/jumbo v5, "subscriptions"

    aput-object v5, v15, v4

    const/4 v4, 0x5

    const-string/jumbo v5, "groups"

    aput-object v5, v15, v4

    const/4 v4, 0x6

    const-string/jumbo v5, "gifts"

    aput-object v5, v15, v4

    .line 1401
    .restart local v15    # "cntrs":[Ljava/lang/String;
    const/4 v4, 0x7

    new-array v0, v4, [I

    move-object/from16 v28, v0

    fill-array-data v28, :array_2

    .restart local v28    # "titleRes":[I
    goto/16 :goto_1

    .line 1409
    .restart local v16    # "countersToHide":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .restart local v17    # "curLayout":Landroid/widget/LinearLayout;
    .restart local v22    # "i":I
    .restart local v24    # "nf":Ljava/text/NumberFormat;
    :sswitch_0
    const-string/jumbo v7, "photos"

    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    const/4 v4, 0x0

    goto/16 :goto_3

    :sswitch_1
    const-string/jumbo v7, "topics"

    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    const/4 v4, 0x1

    goto/16 :goto_3

    :sswitch_2
    const-string/jumbo v7, "audios"

    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    const/4 v4, 0x2

    goto/16 :goto_3

    :sswitch_3
    const-string/jumbo v7, "videos"

    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    const/4 v4, 0x3

    goto/16 :goto_3

    :sswitch_4
    const-string/jumbo v7, "market"

    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    const/4 v4, 0x4

    goto/16 :goto_3

    :sswitch_5
    const-string/jumbo v7, "stories"

    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    const/4 v4, 0x5

    goto/16 :goto_3

    .line 1411
    :pswitch_0
    const/4 v4, 0x1

    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/vkontakte/android/fragments/ProfileFragment;->canShowMainSection(I)Z

    move-result v4

    if-eqz v4, :cond_4

    goto/16 :goto_9

    .line 1416
    :pswitch_1
    const/4 v4, 0x2

    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/vkontakte/android/fragments/ProfileFragment;->canShowMainSection(I)Z

    move-result v4

    if-eqz v4, :cond_4

    goto/16 :goto_9

    .line 1421
    :pswitch_2
    const/4 v4, 0x3

    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/vkontakte/android/fragments/ProfileFragment;->canShowMainSection(I)Z

    move-result v4

    if-eqz v4, :cond_4

    goto/16 :goto_9

    .line 1426
    :pswitch_3
    const/4 v4, 0x4

    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/vkontakte/android/fragments/ProfileFragment;->canShowMainSection(I)Z

    move-result v4

    if-eqz v4, :cond_4

    goto/16 :goto_9

    .line 1431
    :pswitch_4
    const/4 v4, 0x5

    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/vkontakte/android/fragments/ProfileFragment;->canShowMainSection(I)Z

    move-result v4

    if-eqz v4, :cond_4

    goto/16 :goto_9

    .line 1436
    :pswitch_5
    const/4 v4, 0x6

    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/vkontakte/android/fragments/ProfileFragment;->canShowMainSection(I)Z

    move-result v4

    if-eqz v4, :cond_4

    goto/16 :goto_9

    .line 1448
    .restart local v13    # "c":I
    .restart local v14    # "cntr":Landroid/view/View;
    .restart local v27    # "title":Ljava/lang/String;
    :cond_d
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    int-to-long v8, v13

    move-object/from16 v0, v24

    invoke-virtual {v0, v8, v9}, Ljava/text/NumberFormat;->format(J)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v7, ""

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    goto/16 :goto_4

    .line 1455
    :sswitch_6
    const-string/jumbo v7, "friends"

    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_7

    const/4 v4, 0x0

    goto/16 :goto_5

    :sswitch_7
    const-string/jumbo v7, "photos"

    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_7

    const/4 v4, 0x1

    goto/16 :goto_5

    :sswitch_8
    const-string/jumbo v7, "market"

    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_7

    const/4 v4, 0x2

    goto/16 :goto_5

    :sswitch_9
    const-string/jumbo v7, "videos"

    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_7

    const/4 v4, 0x3

    goto/16 :goto_5

    :sswitch_a
    const-string/jumbo v7, "topics"

    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_7

    const/4 v4, 0x4

    goto/16 :goto_5

    :sswitch_b
    const-string/jumbo v7, "docs"

    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_7

    const/4 v4, 0x5

    goto/16 :goto_5

    :sswitch_c
    const-string/jumbo v7, "gifts"

    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_7

    const/4 v4, 0x6

    goto/16 :goto_5

    :sswitch_d
    const-string/jumbo v7, "stories"

    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_7

    const/4 v4, 0x7

    goto/16 :goto_5

    .line 1457
    :pswitch_6
    const v4, 0x7f100071

    invoke-virtual {v14, v4}, Landroid/view/View;->setId(I)V

    goto/16 :goto_6

    .line 1460
    :pswitch_7
    const v4, 0x7f100074

    invoke-virtual {v14, v4}, Landroid/view/View;->setId(I)V

    goto/16 :goto_6

    .line 1463
    :pswitch_8
    const v4, 0x7f100073

    invoke-virtual {v14, v4}, Landroid/view/View;->setId(I)V

    goto/16 :goto_6

    .line 1466
    :pswitch_9
    const v4, 0x7f100077

    invoke-virtual {v14, v4}, Landroid/view/View;->setId(I)V

    goto/16 :goto_6

    .line 1469
    :pswitch_a
    const v4, 0x7f100076

    invoke-virtual {v14, v4}, Landroid/view/View;->setId(I)V

    goto/16 :goto_6

    .line 1472
    :pswitch_b
    const v4, 0x7f100070

    invoke-virtual {v14, v4}, Landroid/view/View;->setId(I)V

    goto/16 :goto_6

    .line 1475
    :pswitch_c
    const v4, 0x7f100072

    invoke-virtual {v14, v4}, Landroid/view/View;->setId(I)V

    goto/16 :goto_6

    .line 1478
    :pswitch_d
    const v4, 0x7f100075

    invoke-virtual {v14, v4}, Landroid/view/View;->setId(I)V

    goto/16 :goto_6

    .line 1482
    .restart local v21    # "fl":Landroid/widget/FrameLayout;
    :sswitch_e
    const-string/jumbo v7, "audios"

    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_8

    const/4 v4, 0x0

    goto/16 :goto_7

    :sswitch_f
    const-string/jumbo v7, "topics"

    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_8

    const/4 v4, 0x1

    goto/16 :goto_7

    :sswitch_10
    const-string/jumbo v7, "docs"

    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_8

    const/4 v4, 0x2

    goto/16 :goto_7

    :sswitch_11
    const-string/jumbo v7, "videos"

    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_8

    const/4 v4, 0x3

    goto/16 :goto_7

    :sswitch_12
    const-string/jumbo v7, "photos"

    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_8

    const/4 v4, 0x4

    goto/16 :goto_7

    :sswitch_13
    const-string/jumbo v7, "market"

    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_8

    const/4 v4, 0x5

    goto/16 :goto_7

    :sswitch_14
    const-string/jumbo v7, "gifts"

    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_8

    const/4 v4, 0x6

    goto/16 :goto_7

    :sswitch_15
    const-string/jumbo v7, "subscriptions"

    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_8

    const/4 v4, 0x7

    goto/16 :goto_7

    :sswitch_16
    const-string/jumbo v7, "groups"

    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_8

    const/16 v4, 0x8

    goto/16 :goto_7

    :sswitch_17
    const-string/jumbo v7, "stories"

    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_8

    const/16 v4, 0x9

    goto/16 :goto_7

    .line 1484
    :pswitch_e
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->audios:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-lez v4, :cond_e

    .line 1485
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->audios:Ljava/util/ArrayList;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Lcom/vkontakte/android/audio/MusicTrack;

    .line 1486
    .local v20, "file":Lcom/vkontakte/android/audio/MusicTrack;
    move-object/from16 v0, v20

    iget-object v4, v0, Lcom/vkontakte/android/audio/MusicTrack;->artist:Ljava/lang/String;

    move-object/from16 v0, v20

    iget-object v5, v0, Lcom/vkontakte/android/audio/MusicTrack;->title:Ljava/lang/String;

    const v7, 0x7f020255

    move-object/from16 v0, p0

    invoke-direct {v0, v4, v5, v7}, Lcom/vkontakte/android/fragments/ProfileFragment;->createTextThumbView(Ljava/lang/String;Ljava/lang/String;I)Landroid/view/View;

    move-result-object v4

    move-object/from16 v0, v21

    invoke-virtual {v0, v4}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    goto/16 :goto_8

    .line 1488
    .end local v20    # "file":Lcom/vkontakte/android/audio/MusicTrack;
    :cond_e
    const v4, 0x7f020253

    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/vkontakte/android/fragments/ProfileFragment;->createPlaceholderView(I)Landroid/view/View;

    move-result-object v4

    move-object/from16 v0, v21

    invoke-virtual {v0, v4}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    goto/16 :goto_8

    .line 1493
    :pswitch_f
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->topics:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-lez v4, :cond_f

    .line 1494
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->topics:Ljava/util/ArrayList;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v29

    check-cast v29, Lcom/vkontakte/android/api/BoardTopic;

    .line 1495
    .local v29, "topic":Lcom/vkontakte/android/api/BoardTopic;
    move-object/from16 v0, v29

    iget-object v4, v0, Lcom/vkontakte/android/api/BoardTopic;->title:Ljava/lang/String;

    move-object/from16 v0, v29

    iget v5, v0, Lcom/vkontakte/android/api/BoardTopic;->updated:I

    invoke-static {v5}, Lcom/vkontakte/android/TimeUtils;->langDate(I)Ljava/lang/String;

    move-result-object v5

    const v7, 0x7f020257

    move-object/from16 v0, p0

    invoke-direct {v0, v4, v5, v7}, Lcom/vkontakte/android/fragments/ProfileFragment;->createTextThumbView(Ljava/lang/String;Ljava/lang/String;I)Landroid/view/View;

    move-result-object v4

    move-object/from16 v0, v21

    invoke-virtual {v0, v4}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    goto/16 :goto_8

    .line 1497
    .end local v29    # "topic":Lcom/vkontakte/android/api/BoardTopic;
    :cond_f
    const v4, 0x7f020264

    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/vkontakte/android/fragments/ProfileFragment;->createPlaceholderView(I)Landroid/view/View;

    move-result-object v4

    move-object/from16 v0, v21

    invoke-virtual {v0, v4}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    goto/16 :goto_8

    .line 1502
    :pswitch_10
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->docs:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-lez v4, :cond_10

    .line 1503
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->docs:Ljava/util/ArrayList;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Lcom/vkontakte/android/api/Document;

    .line 1504
    .local v18, "doc":Lcom/vkontakte/android/api/Document;
    move-object/from16 v0, v18

    iget-object v4, v0, Lcom/vkontakte/android/api/Document;->title:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v18

    iget-object v7, v0, Lcom/vkontakte/android/api/Document;->ext:Ljava/lang/String;

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v7, ", "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, v18

    iget v7, v0, Lcom/vkontakte/android/api/Document;->size:I

    int-to-long v8, v7

    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    invoke-static {v8, v9, v7}, Lcom/vkontakte/android/Global;->langFileSize(JLandroid/content/res/Resources;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    const v7, 0x7f020256

    move-object/from16 v0, p0

    invoke-direct {v0, v4, v5, v7}, Lcom/vkontakte/android/fragments/ProfileFragment;->createTextThumbView(Ljava/lang/String;Ljava/lang/String;I)Landroid/view/View;

    move-result-object v4

    move-object/from16 v0, v21

    invoke-virtual {v0, v4}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    goto/16 :goto_8

    .line 1506
    .end local v18    # "doc":Lcom/vkontakte/android/api/Document;
    :cond_10
    const v4, 0x7f020258

    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/vkontakte/android/fragments/ProfileFragment;->createPlaceholderView(I)Landroid/view/View;

    move-result-object v4

    move-object/from16 v0, v21

    invoke-virtual {v0, v4}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    goto/16 :goto_8

    .line 1511
    :pswitch_11
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->videos:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-lez v4, :cond_11

    .line 1512
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f020172

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    move-object/from16 v0, v21

    invoke-virtual {v0, v4}, Landroid/widget/FrameLayout;->setForeground(Landroid/graphics/drawable/Drawable;)V

    .line 1513
    const/16 v4, 0x11

    move-object/from16 v0, v21

    invoke-virtual {v0, v4}, Landroid/widget/FrameLayout;->setForegroundGravity(I)V

    .line 1514
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->videos:Ljava/util/ArrayList;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vkontakte/android/api/VideoFile;

    iget-object v4, v4, Lcom/vkontakte/android/api/VideoFile;->urlThumb:Ljava/lang/String;

    const v5, 0x7f02039f

    move-object/from16 v0, p0

    invoke-direct {v0, v4, v5}, Lcom/vkontakte/android/fragments/ProfileFragment;->createBackgroundImageView(Ljava/lang/String;I)Landroid/view/View;

    move-result-object v4

    move-object/from16 v0, v21

    invoke-virtual {v0, v4}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    goto/16 :goto_8

    .line 1516
    :cond_11
    const v4, 0x7f020266

    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/vkontakte/android/fragments/ProfileFragment;->createPlaceholderView(I)Landroid/view/View;

    move-result-object v4

    move-object/from16 v0, v21

    invoke-virtual {v0, v4}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    goto/16 :goto_8

    .line 1521
    :pswitch_12
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->photos:Lcom/vkontakte/android/data/VKList;

    invoke-virtual {v4}, Lcom/vkontakte/android/data/VKList;->size()I

    move-result v4

    if-lez v4, :cond_14

    .line 1522
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->photos:Lcom/vkontakte/android/data/VKList;

    const/4 v5, 0x0

    .line 1523
    invoke-virtual {v4, v5}, Lcom/vkontakte/android/data/VKList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vkontakte/android/Photo;

    sget v5, Lcom/vkontakte/android/Global;->displayDensity:F

    const/high16 v7, 0x3f800000    # 1.0f

    cmpl-float v5, v5, v7

    if-lez v5, :cond_13

    sget v5, Lcom/vkontakte/android/Global;->displayDensity:F

    const/high16 v7, 0x40000000    # 2.0f

    cmpl-float v5, v5, v7

    if-lez v5, :cond_12

    const/16 v5, 0x70

    :goto_a
    const/16 v7, 0x6d

    invoke-virtual {v4, v5, v7}, Lcom/vkontakte/android/Photo;->getImage(CC)Lcom/vkontakte/android/Photo$Image;

    move-result-object v4

    iget-object v4, v4, Lcom/vkontakte/android/Photo$Image;->url:Ljava/lang/String;

    const v5, 0x7f02039f

    .line 1522
    move-object/from16 v0, p0

    invoke-direct {v0, v4, v5}, Lcom/vkontakte/android/fragments/ProfileFragment;->createBackgroundImageView(Ljava/lang/String;I)Landroid/view/View;

    move-result-object v4

    move-object/from16 v0, v21

    invoke-virtual {v0, v4}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    goto/16 :goto_8

    .line 1523
    :cond_12
    const/16 v5, 0x6f

    goto :goto_a

    :cond_13
    const/16 v5, 0x6d

    goto :goto_a

    .line 1526
    :cond_14
    const v4, 0x7f02025f

    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/vkontakte/android/fragments/ProfileFragment;->createPlaceholderView(I)Landroid/view/View;

    move-result-object v4

    move-object/from16 v0, v21

    invoke-virtual {v0, v4}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    goto/16 :goto_8

    .line 1531
    :pswitch_13
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->goods:Lcom/vkontakte/android/data/VKList;

    invoke-virtual {v4}, Lcom/vkontakte/android/data/VKList;->size()I

    move-result v4

    if-lez v4, :cond_9

    .line 1532
    new-instance v23, Ljava/util/ArrayList;

    invoke-direct/range {v23 .. v23}, Ljava/util/ArrayList;-><init>()V

    .line 1533
    .local v23, "images":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const/4 v3, 0x0

    .local v3, "j":I
    :goto_b
    const/4 v4, 0x6

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v5, v5, Lcom/vkontakte/android/api/ExtendedUserProfile;->goods:Lcom/vkontakte/android/data/VKList;

    invoke-virtual {v5}, Lcom/vkontakte/android/data/VKList;->size()I

    move-result v5

    invoke-static {v4, v5}, Ljava/lang/Math;->min(II)I

    move-result v4

    if-ge v3, v4, :cond_15

    .line 1535
    :try_start_0
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->goods:Lcom/vkontakte/android/data/VKList;

    invoke-virtual {v4, v3}, Lcom/vkontakte/android/data/VKList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vkontakte/android/data/Good;

    iget-object v4, v4, Lcom/vkontakte/android/data/Good;->photos:[Lcom/vkontakte/android/Photo;

    const/4 v5, 0x0

    aget-object v4, v4, v5

    const/high16 v5, 0x42280000    # 42.0f

    invoke-static {v5}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v5

    invoke-virtual {v4, v5}, Lcom/vkontakte/android/Photo;->getImageByWidth(I)Lcom/vkontakte/android/Photo$Image;

    move-result-object v4

    iget-object v4, v4, Lcom/vkontakte/android/Photo$Image;->url:Ljava/lang/String;

    move-object/from16 v0, v23

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1533
    :goto_c
    add-int/lit8 v3, v3, 0x1

    goto :goto_b

    .line 1536
    :catch_0
    move-exception v19

    .line 1537
    .local v19, "e":Ljava/lang/Exception;
    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Object;

    move-object/from16 v0, v19

    invoke-static {v0, v4}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto :goto_c

    .line 1540
    .end local v19    # "e":Ljava/lang/Exception;
    :cond_15
    move-object/from16 v0, p0

    move-object/from16 v1, v23

    invoke-direct {v0, v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->createBackgroundLayerImageView(Ljava/util/List;)Landroid/view/View;

    move-result-object v4

    move-object/from16 v0, v21

    invoke-virtual {v0, v4}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    goto/16 :goto_8

    .line 1545
    .end local v3    # "j":I
    .end local v23    # "images":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :pswitch_14
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    if-eqz v4, :cond_1d

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->gifts:Lcom/vkontakte/android/data/VKList;

    if-eqz v4, :cond_1d

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->gifts:Lcom/vkontakte/android/data/VKList;

    invoke-virtual {v4}, Lcom/vkontakte/android/data/VKList;->size()I

    move-result v4

    if-lez v4, :cond_1d

    .line 1546
    new-instance v2, Lcom/vk/imageloader/view/VKLayerImageView;

    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v4

    const/4 v5, 0x3

    invoke-direct {v2, v4, v5}, Lcom/vk/imageloader/view/VKLayerImageView;-><init>(Landroid/content/Context;I)V

    .line 1547
    .local v2, "layerImageView":Lcom/vk/imageloader/view/VKLayerImageView;
    const v4, -0x191715

    invoke-virtual {v2, v4}, Lcom/vk/imageloader/view/VKLayerImageView;->setLayerPlaceholders(I)V

    .line 1549
    new-instance v23, Ljava/util/ArrayList;

    invoke-direct/range {v23 .. v23}, Ljava/util/ArrayList;-><init>()V

    .line 1550
    .restart local v23    # "images":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const/4 v3, 0x0

    .restart local v3    # "j":I
    :goto_d
    const/4 v4, 0x3

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v5, v5, Lcom/vkontakte/android/api/ExtendedUserProfile;->gifts:Lcom/vkontakte/android/data/VKList;

    invoke-virtual {v5}, Lcom/vkontakte/android/data/VKList;->size()I

    move-result v5

    invoke-static {v4, v5}, Ljava/lang/Math;->min(II)I

    move-result v4

    if-ge v3, v4, :cond_16

    .line 1551
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->gifts:Lcom/vkontakte/android/data/VKList;

    invoke-virtual {v4, v3}, Lcom/vkontakte/android/data/VKList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vkontakte/android/api/models/GiftItem;

    iget-object v4, v4, Lcom/vkontakte/android/api/models/GiftItem;->gift:Lcom/vkontakte/android/api/models/Gift;

    iget-object v4, v4, Lcom/vkontakte/android/api/models/Gift;->thumb_96:Ljava/lang/String;

    move-object/from16 v0, v23

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1550
    add-int/lit8 v3, v3, 0x1

    goto :goto_d

    .line 1553
    :cond_16
    :goto_e
    invoke-virtual/range {v23 .. v23}, Ljava/util/ArrayList;->size()I

    move-result v4

    const/4 v5, 0x3

    if-ge v4, v5, :cond_17

    .line 1554
    const/4 v4, 0x0

    move-object/from16 v0, v23

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_e

    .line 1556
    :cond_17
    const/high16 v4, 0x42280000    # 42.0f

    invoke-static {v4}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v26

    .line 1557
    .local v26, "photoSize":I
    const/high16 v4, 0x40000000    # 2.0f

    invoke-static {v4}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v25

    .line 1558
    .local v25, "padding":I
    add-int v6, v26, v25

    .line 1559
    .local v6, "sizeWithPad":I
    const/high16 v4, 0x43020000    # 130.0f

    invoke-static {v4}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v30

    .line 1561
    .local v30, "width":I
    const/4 v3, 0x0

    :goto_f
    invoke-virtual/range {v23 .. v23}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ge v3, v4, :cond_1c

    .line 1562
    packed-switch v3, :pswitch_data_3

    .line 1573
    :goto_10
    move-object/from16 v0, v23

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_19

    .line 1574
    if-nez v3, :cond_1a

    .line 1575
    const/high16 v4, 0x40000000    # 2.0f

    invoke-static {v4}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v9

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/high16 v4, 0x40000000    # 2.0f

    invoke-static {v4}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v12

    move-object v7, v2

    move v8, v3

    invoke-virtual/range {v7 .. v12}, Lcom/vk/imageloader/view/VKLayerImageView;->setLayerCorners(IIIII)V

    .line 1581
    :cond_18
    :goto_11
    move-object/from16 v0, v23

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v2, v3, v4}, Lcom/vk/imageloader/view/VKLayerImageView;->load(ILjava/lang/String;)V

    .line 1561
    :cond_19
    add-int/lit8 v3, v3, 0x1

    goto :goto_f

    .line 1564
    :pswitch_15
    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v7, 0x0

    invoke-virtual/range {v2 .. v7}, Lcom/vk/imageloader/view/VKLayerImageView;->setLayerInset(IIIII)V

    goto :goto_10

    .line 1567
    :pswitch_16
    sub-int v9, v30, v26

    const/4 v10, 0x0

    const/4 v11, 0x0

    move-object v7, v2

    move v8, v3

    move v12, v6

    invoke-virtual/range {v7 .. v12}, Lcom/vk/imageloader/view/VKLayerImageView;->setLayerInset(IIIII)V

    goto :goto_10

    .line 1570
    :pswitch_17
    sub-int v9, v30, v26

    const/4 v11, 0x0

    const/4 v12, 0x0

    move-object v7, v2

    move v8, v3

    move v10, v6

    invoke-virtual/range {v7 .. v12}, Lcom/vk/imageloader/view/VKLayerImageView;->setLayerInset(IIIII)V

    goto :goto_10

    .line 1576
    :cond_1a
    const/4 v4, 0x1

    if-ne v3, v4, :cond_1b

    .line 1577
    const/4 v9, 0x0

    const/high16 v4, 0x40000000    # 2.0f

    invoke-static {v4}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v10

    const/4 v11, 0x0

    const/4 v12, 0x0

    move-object v7, v2

    move v8, v3

    invoke-virtual/range {v7 .. v12}, Lcom/vk/imageloader/view/VKLayerImageView;->setLayerCorners(IIIII)V

    goto :goto_11

    .line 1578
    :cond_1b
    const/4 v4, 0x2

    if-ne v3, v4, :cond_18

    .line 1579
    const/4 v9, 0x0

    const/4 v10, 0x0

    const/high16 v4, 0x40000000    # 2.0f

    invoke-static {v4}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v11

    const/4 v12, 0x0

    move-object v7, v2

    move v8, v3

    invoke-virtual/range {v7 .. v12}, Lcom/vk/imageloader/view/VKLayerImageView;->setLayerCorners(IIIII)V

    goto :goto_11

    .line 1585
    :cond_1c
    move-object/from16 v0, v21

    invoke-virtual {v0, v2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    goto/16 :goto_8

    .line 1589
    .end local v2    # "layerImageView":Lcom/vk/imageloader/view/VKLayerImageView;
    .end local v3    # "j":I
    .end local v6    # "sizeWithPad":I
    .end local v23    # "images":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v25    # "padding":I
    .end local v26    # "photoSize":I
    .end local v30    # "width":I
    :cond_1d
    :pswitch_18
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->subscriptions:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-lez v4, :cond_9

    .line 1590
    new-instance v23, Ljava/util/ArrayList;

    invoke-direct/range {v23 .. v23}, Ljava/util/ArrayList;-><init>()V

    .line 1591
    .restart local v23    # "images":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const/4 v3, 0x0

    .restart local v3    # "j":I
    :goto_12
    const/4 v4, 0x6

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v5, v5, Lcom/vkontakte/android/api/ExtendedUserProfile;->subscriptions:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    invoke-static {v4, v5}, Ljava/lang/Math;->min(II)I

    move-result v4

    if-ge v3, v4, :cond_1e

    .line 1592
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->subscriptions:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vkontakte/android/UserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    move-object/from16 v0, v23

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1591
    add-int/lit8 v3, v3, 0x1

    goto :goto_12

    .line 1594
    :cond_1e
    move-object/from16 v0, p0

    move-object/from16 v1, v23

    invoke-direct {v0, v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->createBackgroundLayerImageView(Ljava/util/List;)Landroid/view/View;

    move-result-object v4

    move-object/from16 v0, v21

    invoke-virtual {v0, v4}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    goto/16 :goto_8

    .line 1598
    .end local v3    # "j":I
    .end local v23    # "images":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :pswitch_19
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->groups:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-lez v4, :cond_9

    .line 1599
    new-instance v23, Ljava/util/ArrayList;

    invoke-direct/range {v23 .. v23}, Ljava/util/ArrayList;-><init>()V

    .line 1600
    .restart local v23    # "images":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const/4 v3, 0x0

    .restart local v3    # "j":I
    :goto_13
    const/4 v4, 0x6

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v5, v5, Lcom/vkontakte/android/api/ExtendedUserProfile;->groups:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    invoke-static {v4, v5}, Ljava/lang/Math;->min(II)I

    move-result v4

    if-ge v3, v4, :cond_1f

    .line 1601
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->groups:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vkontakte/android/api/Group;

    iget-object v4, v4, Lcom/vkontakte/android/api/Group;->photo:Ljava/lang/String;

    move-object/from16 v0, v23

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1600
    add-int/lit8 v3, v3, 0x1

    goto :goto_13

    .line 1603
    :cond_1f
    move-object/from16 v0, p0

    move-object/from16 v1, v23

    invoke-direct {v0, v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->createBackgroundLayerImageView(Ljava/util/List;)Landroid/view/View;

    move-result-object v4

    move-object/from16 v0, v21

    invoke-virtual {v0, v4}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    goto/16 :goto_8

    .line 1607
    .end local v3    # "j":I
    .end local v23    # "images":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :pswitch_1a
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    invoke-virtual {v4}, Lcom/vkontakte/android/api/ExtendedUserProfile;->hasValidStories()Z

    move-result v4

    if-eqz v4, :cond_20

    .line 1608
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f0202ae

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    move-object/from16 v0, v21

    invoke-virtual {v0, v4}, Landroid/widget/FrameLayout;->setForeground(Landroid/graphics/drawable/Drawable;)V

    .line 1609
    const/16 v4, 0x11

    move-object/from16 v0, v21

    invoke-virtual {v0, v4}, Landroid/widget/FrameLayout;->setForegroundGravity(I)V

    .line 1610
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->storiesResponse:Lcom/vk/stories/model/GetStoriesResponse;

    iget-object v4, v4, Lcom/vk/stories/model/GetStoriesResponse;->storiesResponse:Ljava/util/ArrayList;

    const/4 v5, 0x0

    .line 1611
    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vk/stories/model/StoriesContainer;

    invoke-virtual {v4}, Lcom/vk/stories/model/StoriesContainer;->getStartStory()Lcom/vk/stories/model/StoryEntry;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Lcom/vk/stories/model/StoryEntry;->getImageSmall(Z)Ljava/lang/String;

    move-result-object v4

    const v5, 0x7f02039f

    .line 1610
    move-object/from16 v0, p0

    invoke-direct {v0, v4, v5}, Lcom/vkontakte/android/fragments/ProfileFragment;->createStoriesBackgroundImageView(Ljava/lang/String;I)Landroid/view/View;

    move-result-object v4

    move-object/from16 v0, v21

    invoke-virtual {v0, v4}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    goto/16 :goto_8

    .line 1614
    :cond_20
    const v4, 0x7f02025f

    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/vkontakte/android/fragments/ProfileFragment;->createPlaceholderView(I)Landroid/view/View;

    move-result-object v4

    move-object/from16 v0, v21

    invoke-virtual {v0, v4}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    goto/16 :goto_8

    .line 1623
    .end local v13    # "c":I
    .end local v14    # "cntr":Landroid/view/View;
    .end local v21    # "fl":Landroid/widget/FrameLayout;
    .end local v27    # "title":Ljava/lang/String;
    :cond_21
    invoke-virtual/range {v17 .. v17}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v4

    if-lez v4, :cond_22

    const/4 v4, 0x1

    goto/16 :goto_0

    :cond_22
    const/4 v4, 0x0

    goto/16 :goto_0

    .line 1395
    nop

    :array_0
    .array-data 4
        0x7f0806c9
        0x7f0804b0
        0x7f080551
        0x7f08054e
        0x7f08057f
        0x7f0802fd
        0x7f0801bd
        0x7f08028c
    .end array-data

    .line 1409
    :sswitch_data_0
    .sparse-switch
        -0x704f9fad -> :sswitch_5
        -0x53da20a3 -> :sswitch_2
        -0x40736bc4 -> :sswitch_4
        -0x3af3777f -> :sswitch_0
        -0x33bd26dc -> :sswitch_1
        -0x30ad84a8 -> :sswitch_3
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
    .end packed-switch

    .line 1455
    :sswitch_data_1
    .sparse-switch
        -0x704f9fad -> :sswitch_d
        -0x40736bc4 -> :sswitch_8
        -0x3af3777f -> :sswitch_7
        -0x33bd26dc -> :sswitch_a
        -0x30ad84a8 -> :sswitch_9
        -0x23c4b66b -> :sswitch_6
        0x2f223b -> :sswitch_b
        0x5dcbd43 -> :sswitch_c
    .end sparse-switch

    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_6
        :pswitch_7
        :pswitch_8
        :pswitch_9
        :pswitch_a
        :pswitch_b
        :pswitch_c
        :pswitch_d
    .end packed-switch

    .line 1482
    :sswitch_data_2
    .sparse-switch
        -0x704f9fad -> :sswitch_17
        -0x53da20a3 -> :sswitch_e
        -0x49c2262c -> :sswitch_16
        -0x40736bc4 -> :sswitch_13
        -0x3af3777f -> :sswitch_12
        -0x33bd26dc -> :sswitch_f
        -0x30ad84a8 -> :sswitch_11
        0x2f223b -> :sswitch_10
        0x5dcbd43 -> :sswitch_14
        0x7674caf6 -> :sswitch_15
    .end sparse-switch

    :pswitch_data_2
    .packed-switch 0x0
        :pswitch_e
        :pswitch_f
        :pswitch_10
        :pswitch_11
        :pswitch_12
        :pswitch_13
        :pswitch_14
        :pswitch_18
        :pswitch_19
        :pswitch_1a
    .end packed-switch

    .line 1398
    :array_1
    .array-data 4
        0x7f08029c
        0x7f0804b0
        0x7f080717
        0x7f0801bd
        0x7f080551
        0x7f08054e
    .end array-data

    .line 1401
    :array_2
    .array-data 4
        0x7f0806c9
        0x7f0804b0
        0x7f080551
        0x7f08054e
        0x7f08057f
        0x7f0802fd
        0x7f08028c
    .end array-data

    .line 1562
    :pswitch_data_3
    .packed-switch 0x0
        :pswitch_15
        :pswitch_16
        :pswitch_17
    .end packed-switch
.end method

.method private updateHeaderItems()V
    .locals 10

    .prologue
    const v9, 0x7f100501

    const/16 v2, 0x8

    const v8, 0x7f100502

    const/4 v3, 0x1

    const/4 v1, 0x0

    .line 1074
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    if-nez v0, :cond_1

    .line 1121
    :cond_0
    :goto_0
    return-void

    .line 1078
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->bigPhoto:Ljava/lang/String;

    const-string/jumbo v4, "gif"

    invoke-virtual {v0, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    iget v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v4

    invoke-virtual {v4}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v4

    if-eq v0, v4, :cond_3

    iget v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    if-gez v0, :cond_2

    iget v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    neg-int v0, v0

    invoke-static {v0}, Lcom/vkontakte/android/data/Groups;->isGroupAdmin(I)Z

    move-result v0

    if-nez v0, :cond_3

    .line 1079
    :cond_2
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->headerView:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 1082
    :cond_3
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->headerView:Landroid/view/View;

    const v4, 0x7f1004f9

    invoke-virtual {v0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    invoke-virtual {v0}, Lcom/vkontakte/android/api/ExtendedUserProfile;->hasCover()Z

    move-result v0

    if-eqz v0, :cond_6

    move v0, v1

    :goto_1
    invoke-static {v4, v0}, Lcom/vkontakte/android/ViewUtils;->setVisibility(Landroid/view/View;I)V

    .line 1083
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->headerView:Landroid/view/View;

    const v4, 0x7f1004ef

    invoke-virtual {v0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    invoke-virtual {v0}, Lcom/vkontakte/android/api/ExtendedUserProfile;->hasCover()Z

    move-result v0

    if-eqz v0, :cond_7

    move v0, v1

    :goto_2
    invoke-static {v4, v0}, Lcom/vkontakte/android/ViewUtils;->setVisibility(Landroid/view/View;I)V

    .line 1084
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->updateContentParalaxPadding()V

    .line 1086
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-boolean v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->showAllPosts:Z

    if-nez v0, :cond_8

    iget v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    if-lez v0, :cond_8

    move v0, v3

    :goto_3
    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->ownerOnly:Z

    .line 1087
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->selector:Landroid/view/View;

    invoke-virtual {v0, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->ownerOnly:Z

    if-nez v0, :cond_9

    move v0, v3

    :goto_4
    invoke-virtual {v4, v0}, Landroid/view/View;->setSelected(Z)V

    .line 1088
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->selector:Landroid/view/View;

    invoke-virtual {v0, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iget-boolean v4, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->ownerOnly:Z

    invoke-virtual {v0, v4}, Landroid/view/View;->setSelected(Z)V

    .line 1090
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->updateHeaderView()V

    .line 1091
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->buildInfoItems()V

    .line 1092
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->updateButtons()V

    .line 1094
    iget v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    if-lez v0, :cond_a

    .line 1095
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->selector:Landroid/view/View;

    invoke-virtual {v0, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f080785

    new-array v3, v3, [Ljava/lang/Object;

    iget-object v6, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v6, v6, Lcom/vkontakte/android/api/ExtendedUserProfile;->firstNameGen:Ljava/lang/String;

    aput-object v6, v3, v1

    invoke-virtual {v4, v5, v3}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1099
    :goto_5
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-boolean v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->canSeeAllPosts:Z

    if-eqz v0, :cond_4

    iget v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    if-gez v0, :cond_5

    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->groupType:I

    const/4 v3, 0x2

    if-ne v0, v3, :cond_5

    .line 1100
    :cond_4
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->selector:Landroid/view/View;

    invoke-virtual {v0, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 1101
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->selector:Landroid/view/View;

    invoke-virtual {v0, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/View;->setSelected(Z)V

    .line 1102
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->selector:Landroid/view/View;

    invoke-virtual {v0, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 1105
    :cond_5
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    invoke-virtual {v0}, Lcom/vkontakte/android/api/ExtendedUserProfile;->isDeactivated()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1106
    sget-object v0, Lcom/vkontakte/android/fragments/ProfileFragment$36;->$SwitchMap$com$vkontakte$android$api$ExtendedUserProfile$Deactivated:[I

    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v2, v2, Lcom/vkontakte/android/api/ExtendedUserProfile;->deactivated:Lcom/vkontakte/android/api/ExtendedUserProfile$Deactivated;

    invoke-virtual {v2}, Lcom/vkontakte/android/api/ExtendedUserProfile$Deactivated;->ordinal()I

    move-result v2

    aget v0, v0, v2

    packed-switch v0, :pswitch_data_0

    .line 1113
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->emptyText:Landroid/widget/TextView;

    const v2, 0x7f08055f

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(I)V

    .line 1118
    :goto_6
    invoke-virtual {p0, v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->setRefreshEnabled(Z)V

    .line 1119
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->updateList()V

    goto/16 :goto_0

    :cond_6
    move v0, v2

    .line 1082
    goto/16 :goto_1

    :cond_7
    move v0, v2

    .line 1083
    goto/16 :goto_2

    :cond_8
    move v0, v1

    .line 1086
    goto/16 :goto_3

    :cond_9
    move v0, v1

    .line 1087
    goto/16 :goto_4

    .line 1097
    :cond_a
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->selector:Landroid/view/View;

    invoke-virtual {v0, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f080785

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const v7, 0x7f0802ed

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v3, v1

    invoke-virtual {v4, v5, v3}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_5

    .line 1108
    :pswitch_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->emptyText:Landroid/widget/TextView;

    const v2, 0x7f08055e

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(I)V

    goto :goto_6

    .line 1106
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method

.method private updateHeaderView()V
    .locals 15

    .prologue
    const v6, 0x7f0202ce

    const v14, 0x7f0201d6

    const v13, 0x7f1004f1

    const/4 v12, 0x1

    const/4 v7, 0x0

    .line 1627
    iget v8, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    if-lez v8, :cond_9

    .line 1628
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v9, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v9, v9, Lcom/vkontakte/android/api/ExtendedUserProfile;->profile:Lcom/vkontakte/android/UserProfile;

    iget-object v9, v9, Lcom/vkontakte/android/UserProfile;->firstName:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v9, " "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v9, v9, Lcom/vkontakte/android/api/ExtendedUserProfile;->profile:Lcom/vkontakte/android/UserProfile;

    iget-object v9, v9, Lcom/vkontakte/android/UserProfile;->lastName:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 1629
    .local v2, "name":Ljava/lang/CharSequence;
    iget-object v8, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-boolean v8, v8, Lcom/vkontakte/android/api/ExtendedUserProfile;->verified:Z

    if-eqz v8, :cond_1

    .line 1630
    new-instance v0, Landroid/text/SpannableStringBuilder;

    invoke-direct {v0, v2}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 1631
    .local v0, "bldr":Landroid/text/SpannableStringBuilder;
    invoke-static {}, Landroid/text/Spannable$Factory;->getInstance()Landroid/text/Spannable$Factory;

    move-result-object v8

    const-string/jumbo v9, "F"

    invoke-virtual {v8, v9}, Landroid/text/Spannable$Factory;->newSpannable(Ljava/lang/CharSequence;)Landroid/text/Spannable;

    move-result-object v5

    .line 1632
    .local v5, "sp":Landroid/text/Spannable;
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    iget v9, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    if-lez v9, :cond_0

    iget v9, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->layoutType:I

    if-nez v9, :cond_0

    const v6, 0x7f020265

    :cond_0
    invoke-virtual {v8, v6}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 1633
    .local v1, "d":Landroid/graphics/drawable/Drawable;
    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v6

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v8

    invoke-virtual {v1, v7, v7, v6, v8}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 1634
    new-instance v6, Landroid/text/style/ImageSpan;

    invoke-direct {v6, v1, v12}, Landroid/text/style/ImageSpan;-><init>(Landroid/graphics/drawable/Drawable;I)V

    invoke-interface {v5, v6, v7, v12, v7}, Landroid/text/Spannable;->setSpan(Ljava/lang/Object;III)V

    .line 1635
    const-string/jumbo v6, "\u00a0"

    invoke-virtual {v0, v6}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 1636
    invoke-virtual {v0, v5}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 1637
    move-object v2, v0

    .line 1639
    .end local v0    # "bldr":Landroid/text/SpannableStringBuilder;
    .end local v1    # "d":Landroid/graphics/drawable/Drawable;
    .end local v5    # "sp":Landroid/text/Spannable;
    :cond_1
    iget-object v6, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->headerView:Landroid/view/View;

    const v8, 0x7f1004f4

    invoke-virtual {v6, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    invoke-virtual {v6, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1640
    iget v6, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->layoutType:I

    if-nez v6, :cond_2

    .line 1641
    iget-object v6, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->headerView:Landroid/view/View;

    const v8, 0x7f1004f2

    invoke-virtual {v6, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    iget v6, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v9

    invoke-virtual {v9}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v9

    if-ne v6, v9, :cond_4

    move v6, v7

    :goto_0
    invoke-virtual {v8, v6}, Landroid/view/View;->setVisibility(I)V

    .line 1643
    :cond_2
    iget-object v6, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v6, v6, Lcom/vkontakte/android/api/ExtendedUserProfile;->profile:Lcom/vkontakte/android/UserProfile;

    iget v6, v6, Lcom/vkontakte/android/UserProfile;->online:I

    if-lez v6, :cond_5

    .line 1644
    const v6, 0x7f08047d

    invoke-virtual {p0, v6}, Lcom/vkontakte/android/fragments/ProfileFragment;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 1645
    .local v3, "online":Ljava/lang/CharSequence;
    iget-object v6, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v6, v6, Lcom/vkontakte/android/api/ExtendedUserProfile;->profile:Lcom/vkontakte/android/UserProfile;

    iget v6, v6, Lcom/vkontakte/android/UserProfile;->online:I

    if-eq v6, v12, :cond_3

    .line 1646
    new-instance v0, Landroid/text/SpannableStringBuilder;

    invoke-direct {v0, v3}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 1647
    .restart local v0    # "bldr":Landroid/text/SpannableStringBuilder;
    invoke-static {}, Landroid/text/Spannable$Factory;->getInstance()Landroid/text/Spannable$Factory;

    move-result-object v6

    const-string/jumbo v8, "F"

    invoke-virtual {v6, v8}, Landroid/text/Spannable$Factory;->newSpannable(Ljava/lang/CharSequence;)Landroid/text/Spannable;

    move-result-object v5

    .line 1648
    .restart local v5    # "sp":Landroid/text/Spannable;
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    invoke-virtual {v6, v14}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 1649
    .restart local v1    # "d":Landroid/graphics/drawable/Drawable;
    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v6

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v8

    invoke-virtual {v1, v7, v7, v6, v8}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 1650
    new-instance v6, Landroid/text/style/ImageSpan;

    invoke-direct {v6, v1, v12}, Landroid/text/style/ImageSpan;-><init>(Landroid/graphics/drawable/Drawable;I)V

    invoke-interface {v5, v6, v7, v12, v7}, Landroid/text/Spannable;->setSpan(Ljava/lang/Object;III)V

    .line 1651
    const-string/jumbo v6, "\u00a0"

    invoke-virtual {v0, v6}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 1652
    invoke-virtual {v0, v5}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 1653
    move-object v3, v0

    .line 1655
    .end local v0    # "bldr":Landroid/text/SpannableStringBuilder;
    .end local v1    # "d":Landroid/graphics/drawable/Drawable;
    .end local v5    # "sp":Landroid/text/Spannable;
    :cond_3
    iget-object v6, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->headerView:Landroid/view/View;

    invoke-virtual {v6, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    invoke-virtual {v6, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1656
    iget-object v6, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->headerView:Landroid/view/View;

    invoke-virtual {v6, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    invoke-virtual {v6, v7}, Landroid/view/View;->setVisibility(I)V

    .line 1701
    .end local v3    # "online":Ljava/lang/CharSequence;
    :goto_1
    iget-object v6, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->headerView:Landroid/view/View;

    invoke-virtual {v6, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    invoke-virtual {v6, v12}, Landroid/view/View;->setSelected(Z)V

    .line 1702
    return-void

    .line 1641
    :cond_4
    const/16 v6, 0x8

    goto :goto_0

    .line 1657
    :cond_5
    iget-object v6, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget v6, v6, Lcom/vkontakte/android/api/ExtendedUserProfile;->lastSeen:I

    if-lez v6, :cond_8

    .line 1658
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    iget-object v6, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v6, v6, Lcom/vkontakte/android/api/ExtendedUserProfile;->profile:Lcom/vkontakte/android/UserProfile;

    iget-boolean v6, v6, Lcom/vkontakte/android/UserProfile;->f:Z

    if-eqz v6, :cond_7

    const v6, 0x7f080329

    :goto_2
    new-array v9, v12, [Ljava/lang/Object;

    iget-object v10, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget v10, v10, Lcom/vkontakte/android/api/ExtendedUserProfile;->lastSeen:I

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    invoke-static {v10, v11}, Lcom/vkontakte/android/TimeUtils;->langDateRelative(ILandroid/content/res/Resources;)Ljava/lang/String;

    move-result-object v10

    aput-object v10, v9, v7

    invoke-virtual {v8, v6, v9}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    .line 1659
    .restart local v3    # "online":Ljava/lang/CharSequence;
    iget-object v6, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-boolean v6, v6, Lcom/vkontakte/android/api/ExtendedUserProfile;->lastSeenMobile:Z

    if-eqz v6, :cond_6

    .line 1660
    new-instance v0, Landroid/text/SpannableStringBuilder;

    invoke-direct {v0, v3}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 1661
    .restart local v0    # "bldr":Landroid/text/SpannableStringBuilder;
    invoke-static {}, Landroid/text/Spannable$Factory;->getInstance()Landroid/text/Spannable$Factory;

    move-result-object v6

    const-string/jumbo v8, "F"

    invoke-virtual {v6, v8}, Landroid/text/Spannable$Factory;->newSpannable(Ljava/lang/CharSequence;)Landroid/text/Spannable;

    move-result-object v5

    .line 1662
    .restart local v5    # "sp":Landroid/text/Spannable;
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    invoke-virtual {v6, v14}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 1663
    .restart local v1    # "d":Landroid/graphics/drawable/Drawable;
    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v6

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v8

    invoke-virtual {v1, v7, v7, v6, v8}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 1664
    new-instance v6, Landroid/text/style/ImageSpan;

    invoke-direct {v6, v1, v12}, Landroid/text/style/ImageSpan;-><init>(Landroid/graphics/drawable/Drawable;I)V

    invoke-interface {v5, v6, v7, v12, v7}, Landroid/text/Spannable;->setSpan(Ljava/lang/Object;III)V

    .line 1665
    const-string/jumbo v6, "\u00a0"

    invoke-virtual {v0, v6}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 1666
    invoke-virtual {v0, v5}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 1667
    move-object v3, v0

    .line 1669
    .end local v0    # "bldr":Landroid/text/SpannableStringBuilder;
    .end local v1    # "d":Landroid/graphics/drawable/Drawable;
    .end local v5    # "sp":Landroid/text/Spannable;
    :cond_6
    iget-object v6, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->headerView:Landroid/view/View;

    invoke-virtual {v6, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    invoke-virtual {v6, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1670
    iget-object v6, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->headerView:Landroid/view/View;

    invoke-virtual {v6, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    invoke-virtual {v6, v7}, Landroid/view/View;->setVisibility(I)V

    goto/16 :goto_1

    .line 1658
    .end local v3    # "online":Ljava/lang/CharSequence;
    :cond_7
    const v6, 0x7f08032a

    goto :goto_2

    .line 1672
    :cond_8
    iget-object v6, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->headerView:Landroid/view/View;

    invoke-virtual {v6, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    const-string/jumbo v7, ""

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1673
    iget-object v6, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->headerView:Landroid/view/View;

    invoke-virtual {v6, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    const/4 v7, 0x4

    invoke-virtual {v6, v7}, Landroid/view/View;->setVisibility(I)V

    goto/16 :goto_1

    .line 1676
    .end local v2    # "name":Ljava/lang/CharSequence;
    :cond_9
    iget-object v8, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v8, v8, Lcom/vkontakte/android/api/ExtendedUserProfile;->profile:Lcom/vkontakte/android/UserProfile;

    iget-object v2, v8, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    .line 1677
    .restart local v2    # "name":Ljava/lang/CharSequence;
    iget-object v8, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-boolean v8, v8, Lcom/vkontakte/android/api/ExtendedUserProfile;->verified:Z

    if-eqz v8, :cond_a

    .line 1678
    new-instance v0, Landroid/text/SpannableStringBuilder;

    invoke-direct {v0, v2}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 1679
    .restart local v0    # "bldr":Landroid/text/SpannableStringBuilder;
    invoke-static {}, Landroid/text/Spannable$Factory;->getInstance()Landroid/text/Spannable$Factory;

    move-result-object v8

    const-string/jumbo v9, "F"

    invoke-virtual {v8, v9}, Landroid/text/Spannable$Factory;->newSpannable(Ljava/lang/CharSequence;)Landroid/text/Spannable;

    move-result-object v5

    .line 1680
    .restart local v5    # "sp":Landroid/text/Spannable;
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    invoke-virtual {v8, v6}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 1681
    .restart local v1    # "d":Landroid/graphics/drawable/Drawable;
    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v6

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v8

    invoke-virtual {v1, v7, v7, v6, v8}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 1682
    new-instance v6, Landroid/text/style/ImageSpan;

    invoke-direct {v6, v1, v12}, Landroid/text/style/ImageSpan;-><init>(Landroid/graphics/drawable/Drawable;I)V

    invoke-interface {v5, v6, v7, v12, v7}, Landroid/text/Spannable;->setSpan(Ljava/lang/Object;III)V

    .line 1683
    const-string/jumbo v6, "\u00a0"

    invoke-virtual {v0, v6}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 1684
    invoke-virtual {v0, v5}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 1685
    move-object v2, v0

    .line 1687
    .end local v0    # "bldr":Landroid/text/SpannableStringBuilder;
    .end local v1    # "d":Landroid/graphics/drawable/Drawable;
    .end local v5    # "sp":Landroid/text/Spannable;
    :cond_a
    iget-object v6, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->headerView:Landroid/view/View;

    const v7, 0x7f1004f4

    invoke-virtual {v6, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    .line 1688
    .local v4, "profileName":Landroid/widget/TextView;
    invoke-virtual {v4, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1689
    iget-object v6, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->headerView:Landroid/view/View;

    invoke-virtual {v6, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v7

    invoke-static {v7}, Lcom/vk/emoji/Emoji;->instance(Landroid/content/Context;)Lcom/vk/emoji/Emoji;

    move-result-object v7

    iget-object v8, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v8, v8, Lcom/vkontakte/android/api/ExtendedUserProfile;->activity:Ljava/lang/String;

    invoke-virtual {v7, v8}, Lcom/vk/emoji/Emoji;->replaceEmoji(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_1
.end method

.method private updateLayoutType(Landroid/content/res/Configuration;)V
    .locals 3
    .param p1, "cfg"    # Landroid/content/res/Configuration;

    .prologue
    const/4 v2, 0x0

    .line 654
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->isTablet:Z

    if-nez v0, :cond_0

    iget v0, p1, Landroid/content/res/Configuration;->screenWidthDp:I

    iget v1, p1, Landroid/content/res/Configuration;->screenHeightDp:I

    if-gt v0, v1, :cond_0

    .line 655
    iput v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->layoutType:I

    .line 663
    :goto_0
    return-void

    .line 656
    :cond_0
    iget v0, p1, Landroid/content/res/Configuration;->screenWidthDp:I

    const/16 v1, 0x280

    if-le v0, v1, :cond_1

    .line 657
    const/4 v0, 0x2

    iput v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->layoutType:I

    goto :goto_0

    .line 658
    :cond_1
    iget v0, p1, Landroid/content/res/Configuration;->screenWidthDp:I

    const/16 v1, 0x1e0

    if-le v0, v1, :cond_2

    .line 659
    const/4 v0, 0x1

    iput v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->layoutType:I

    goto :goto_0

    .line 661
    :cond_2
    iput v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->layoutType:I

    goto :goto_0
.end method

.method private updatePostCount()V
    .locals 7

    .prologue
    const v1, 0x7f100501

    .line 3417
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->selector:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->isEnabled()Z

    move-result v0

    if-nez v0, :cond_0

    .line 3418
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->selector:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0d004c

    iget v3, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->totalPosts:I

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    iget v6, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->totalPosts:I

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-virtual {v1, v2, v3, v4}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 3420
    :cond_0
    return-void
.end method

.method private updatePostsButtons()V
    .locals 8

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 2731
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->infoItems:Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->postponedView:Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 2732
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->infoItems:Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->suggestsView:Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 2733
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->postponedCount:I

    if-lez v0, :cond_0

    .line 2734
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->postponedView:Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;->view:Landroid/view/View;

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0d004b

    iget-object v3, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget v3, v3, Lcom/vkontakte/android/api/ExtendedUserProfile;->postponedCount:I

    new-array v4, v7, [Ljava/lang/Object;

    iget-object v5, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget v5, v5, Lcom/vkontakte/android/api/ExtendedUserProfile;->postponedCount:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v6

    invoke-virtual {v1, v2, v3, v4}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/vkontakte/android/TextFormatter;->processString(Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 2735
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->postponedView:Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;

    invoke-direct {p0, v0}, Lcom/vkontakte/android/fragments/ProfileFragment;->addPostsButton(Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;)V

    .line 2737
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->suggestedCount:I

    if-lez v0, :cond_1

    .line 2738
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->suggestsView:Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;->view:Landroid/view/View;

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-boolean v1, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->canPost:Z

    if-eqz v1, :cond_2

    const v1, 0x7f0d005c

    :goto_0
    iget-object v3, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget v3, v3, Lcom/vkontakte/android/api/ExtendedUserProfile;->suggestedCount:I

    new-array v4, v7, [Ljava/lang/Object;

    iget-object v5, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget v5, v5, Lcom/vkontakte/android/api/ExtendedUserProfile;->suggestedCount:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v6

    invoke-virtual {v2, v1, v3, v4}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/vkontakte/android/TextFormatter;->processString(Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 2739
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->suggestsView:Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;

    invoke-direct {p0, v0}, Lcom/vkontakte/android/fragments/ProfileFragment;->addPostsButton(Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;)V

    .line 2741
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->postponedCount:I

    if-lez v0, :cond_3

    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->suggestedCount:I

    if-lez v0, :cond_3

    .line 2742
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->postponedView:Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;

    iput-boolean v7, v0, Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;->dividerAfter:Z

    .line 2743
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->postponedView:Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;

    const/4 v1, 0x2

    iput v1, v0, Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;->backgroundType:I

    .line 2744
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->suggestsView:Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;

    const/4 v1, 0x4

    iput v1, v0, Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;->backgroundType:I

    .line 2749
    :goto_1
    return-void

    .line 2738
    :cond_2
    const v1, 0x7f0d005d

    goto :goto_0

    .line 2746
    :cond_3
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->postponedView:Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;

    iput-boolean v6, v0, Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;->dividerAfter:Z

    .line 2747
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->postponedView:Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->suggestsView:Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;

    const/4 v2, 0x6

    iput v2, v1, Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;->backgroundType:I

    iput v2, v0, Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;->backgroundType:I

    goto :goto_1
.end method


# virtual methods
.method protected canAddPost(Lcom/vkontakte/android/NewsEntry;)Z
    .locals 4
    .param p1, "post"    # Lcom/vkontakte/android/NewsEntry;

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 573
    iget v2, p1, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    iget v3, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    if-ne v2, v3, :cond_0

    .line 574
    const/16 v2, 0x800

    invoke-virtual {p1, v2}, Lcom/vkontakte/android/NewsEntry;->flag(I)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 575
    invoke-virtual {p0, v1, v0}, Lcom/vkontakte/android/fragments/ProfileFragment;->updatePostsButtons(II)V

    .line 587
    :cond_0
    :goto_0
    return v0

    .line 578
    :cond_1
    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-boolean v2, v2, Lcom/vkontakte/android/api/ExtendedUserProfile;->canPost:Z

    if-nez v2, :cond_2

    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget v2, v2, Lcom/vkontakte/android/api/ExtendedUserProfile;->adminLevel:I

    const/4 v3, 0x2

    if-ge v2, v3, :cond_2

    .line 579
    const-string/jumbo v2, "vk"

    const-string/jumbo v3, "1"

    invoke-static {v2, v3}, Lcom/vkontakte/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 580
    const/16 v2, 0x1000

    invoke-virtual {p1, v2}, Lcom/vkontakte/android/NewsEntry;->flag(I)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 581
    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->updatePostsButtons(II)V

    goto :goto_0

    :cond_2
    move v0, v1

    .line 585
    goto :goto_0
.end method

.method protected doLoadData(II)V
    .locals 1
    .param p1, "offset"    # I
    .param p2, "count"    # I

    .prologue
    .line 1046
    if-eqz p1, :cond_0

    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->refreshing:Z

    if-eqz v0, :cond_1

    .line 1047
    :cond_0
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->refreshing:Z

    invoke-virtual {p0, v0, p2}, Lcom/vkontakte/android/fragments/ProfileFragment;->loadInitial(ZI)V

    .line 1051
    :goto_0
    return-void

    .line 1049
    :cond_1
    invoke-direct {p0, p1, p2}, Lcom/vkontakte/android/fragments/ProfileFragment;->loadWall(II)V

    goto :goto_0
.end method

.method public editGroup()V
    .locals 3

    .prologue
    .line 863
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 864
    .local v0, "args":Landroid/os/Bundle;
    const-string/jumbo v1, "level"

    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget v2, v2, Lcom/vkontakte/android/api/ExtendedUserProfile;->adminLevel:I

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 865
    const-string/jumbo v1, "title"

    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v2, v2, Lcom/vkontakte/android/api/ExtendedUserProfile;->profile:Lcom/vkontakte/android/UserProfile;

    iget-object v2, v2, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 866
    const-string/jumbo v1, "id"

    iget v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    neg-int v2, v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 867
    const-string/jumbo v1, "type"

    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget v2, v2, Lcom/vkontakte/android/api/ExtendedUserProfile;->groupType:I

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 868
    const-string/jumbo v1, "access"

    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget v2, v2, Lcom/vkontakte/android/api/ExtendedUserProfile;->groupAccess:I

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 869
    const-class v1, Lcom/vkontakte/android/fragments/groupadmin/GroupAdminFragment;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-static {v1, v0, v2}, Lcom/vkontakte/android/navigation/Navigate;->to(Ljava/lang/Class;Landroid/os/Bundle;Landroid/content/Context;)V

    .line 870
    return-void
.end method

.method public editProfile()V
    .locals 3

    .prologue
    .line 859
    new-instance v0, Lcom/vkontakte/android/navigation/Navigator;

    const-class v1, Lcom/vkontakte/android/fragments/ProfileEditFragment;

    new-instance v2, Landroid/os/Bundle;

    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/navigation/Navigator;-><init>(Ljava/lang/Class;Landroid/os/Bundle;)V

    const/16 v1, 0xf3e

    invoke-virtual {v0, p0, v1}, Lcom/vkontakte/android/navigation/Navigator;->forResult(Landroid/app/Fragment;I)Z

    .line 860
    return-void
.end method

.method public fitSystemWindows(Landroid/graphics/Rect;)Z
    .locals 3
    .param p1, "insets"    # Landroid/graphics/Rect;

    .prologue
    const/4 v1, 0x0

    .line 3424
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getToolbar()Landroid/support/v7/widget/Toolbar;

    move-result-object v2

    invoke-virtual {v2}, Landroid/support/v7/widget/Toolbar;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 3425
    .local v0, "lp":Landroid/view/ViewGroup$MarginLayoutParams;
    iget v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->layoutType:I

    if-eqz v2, :cond_1

    iget v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    if-lez v2, :cond_1

    .line 3426
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 3427
    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->statusBarBgView:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    iput v1, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 3428
    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->contentView:Landroid/view/ViewGroup;

    invoke-virtual {v2}, Landroid/view/ViewGroup;->requestLayout()V

    .line 3437
    :cond_0
    :goto_0
    return v1

    .line 3431
    :cond_1
    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->contentView:Landroid/view/ViewGroup;

    if-eqz v2, :cond_0

    .line 3434
    iget v1, p1, Landroid/graphics/Rect;->top:I

    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 3435
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->statusBarBgView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    iget v2, p1, Landroid/graphics/Rect;->top:I

    iput v2, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 3436
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->contentView:Landroid/view/ViewGroup;

    invoke-virtual {v1}, Landroid/view/ViewGroup;->requestLayout()V

    .line 3437
    const/4 v1, 0x1

    goto :goto_0
.end method

.method protected bridge synthetic getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;
    .locals 1

    .prologue
    .line 189
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getAdapter()Lme/grishka/appkit/views/UsableRecyclerView$Adapter;

    move-result-object v0

    return-object v0
.end method

.method protected getAdapter()Lme/grishka/appkit/views/UsableRecyclerView$Adapter;
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 563
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profileAdapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    if-nez v0, :cond_0

    .line 564
    new-instance v0, Lcom/vkontakte/android/fragments/ProfileFragment$CardMergeAdapter;

    invoke-direct {v0, p0, v2}, Lcom/vkontakte/android/fragments/ProfileFragment$CardMergeAdapter;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;Lcom/vkontakte/android/fragments/ProfileFragment$1;)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profileAdapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    .line 565
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profileAdapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    new-instance v1, Lcom/vkontakte/android/fragments/ProfileFragment$ProfileInfoAdapter;

    invoke-direct {v1, p0, v2}, Lcom/vkontakte/android/fragments/ProfileFragment$ProfileInfoAdapter;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;Lcom/vkontakte/android/fragments/ProfileFragment$1;)V

    iput-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->infoAdapter:Lcom/vkontakte/android/fragments/ProfileFragment$ProfileInfoAdapter;

    invoke-virtual {v0, v1}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->addAdapter(Lme/grishka/appkit/views/UsableRecyclerView$Adapter;)V

    .line 566
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profileAdapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    invoke-super {p0}, Lcom/vkontakte/android/fragments/PostListFragment;->getAdapter()Lme/grishka/appkit/views/UsableRecyclerView$Adapter;

    move-result-object v1

    invoke-virtual {v0, v1}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->addAdapter(Lme/grishka/appkit/views/UsableRecyclerView$Adapter;)V

    .line 568
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profileAdapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    return-object v0
.end method

.method public getHeaderImageUrl()Ljava/lang/String;
    .locals 3

    .prologue
    const/16 v2, 0x78

    .line 3819
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    if-lez v0, :cond_1

    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    invoke-virtual {v0}, Lcom/vkontakte/android/api/ExtendedUserProfile;->isDeactivated()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 3820
    :cond_0
    const/4 v0, 0x0

    .line 3828
    :goto_0
    return-object v0

    .line 3822
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->photo:Lcom/vkontakte/android/Photo;

    if-nez v0, :cond_2

    .line 3823
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->bigPhoto:Ljava/lang/String;

    goto :goto_0

    .line 3825
    :cond_2
    sget v0, Lcom/vkontakte/android/Global;->displayDensity:F

    const/high16 v1, 0x40000000    # 2.0f

    cmpl-float v0, v0, v1

    if-lez v0, :cond_3

    .line 3826
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->photo:Lcom/vkontakte/android/Photo;

    const/16 v1, 0x79

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/Photo;->getImage(CC)Lcom/vkontakte/android/Photo$Image;

    move-result-object v0

    iget-object v0, v0, Lcom/vkontakte/android/Photo$Image;->url:Ljava/lang/String;

    goto :goto_0

    .line 3828
    :cond_3
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->photo:Lcom/vkontakte/android/Photo;

    invoke-virtual {v0, v2}, Lcom/vkontakte/android/Photo;->getImage(C)Lcom/vkontakte/android/Photo$Image;

    move-result-object v0

    iget-object v0, v0, Lcom/vkontakte/android/Photo$Image;->url:Ljava/lang/String;

    goto :goto_0
.end method

.method protected getListReferrer()Ljava/lang/String;
    .locals 2

    .prologue
    .line 1041
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    if-gez v0, :cond_0

    const-string/jumbo v0, "club"

    :goto_0
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    const-string/jumbo v0, "profile"

    goto :goto_0
.end method

.method protected getPostsOffset()I
    .locals 1

    .prologue
    .line 3392
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->infoAdapter:Lcom/vkontakte/android/fragments/ProfileFragment$ProfileInfoAdapter;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/ProfileFragment$ProfileInfoAdapter;->getItemCount()I

    move-result v0

    return v0
.end method

.method protected getReferer()Ljava/lang/String;
    .locals 1

    .prologue
    .line 1036
    iget v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    if-lez v0, :cond_0

    const-string/jumbo v0, "wall_user"

    :goto_0
    return-object v0

    :cond_0
    const-string/jumbo v0, "wall_group"

    goto :goto_0
.end method

.method public inviteToGroup()V
    .locals 2

    .prologue
    .line 873
    new-instance v0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;

    invoke-direct {v0}, Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;-><init>()V

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;->setSelect()Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;

    move-result-object v0

    const/16 v1, 0xf3f

    invoke-virtual {v0, p0, v1}, Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;->forResult(Landroid/app/Fragment;I)Z

    .line 874
    return-void
.end method

.method synthetic lambda$addButtonsItem$32(Landroid/view/View;)V
    .locals 0
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 2676
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->showNewPost()V

    return-void
.end method

.method synthetic lambda$addButtonsItem$33(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 2678
    new-instance v0, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const-class v2, Lcom/vkontakte/android/PostPhotoActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 2679
    .local v0, "intent":Landroid/content/Intent;
    iget v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v2

    if-eq v1, v2, :cond_0

    .line 2680
    const-string/jumbo v1, "option"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 2682
    :cond_0
    const-string/jumbo v1, "uid"

    iget v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 2683
    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/ProfileFragment;->startActivity(Landroid/content/Intent;)V

    .line 2684
    return-void
.end method

.method synthetic lambda$addFriend$36(Landroid/view/View;Landroid/content/DialogInterface;I)V
    .locals 2
    .param p1, "alertView"    # Landroid/view/View;
    .param p2, "dialog"    # Landroid/content/DialogInterface;
    .param p3, "which"    # I

    .prologue
    .line 2841
    const v1, 0x7f100198

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    .line 2842
    .local v0, "msg":Ljava/lang/String;
    invoke-direct {p0, v0}, Lcom/vkontakte/android/fragments/ProfileFragment;->doAddFriend(Ljava/lang/String;)V

    .line 2843
    return-void
.end method

.method synthetic lambda$applyLayout$2(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 679
    iget v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v1

    if-eq v0, v1, :cond_0

    iget v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    if-gez v0, :cond_1

    iget v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    neg-int v0, v0

    invoke-static {v0}, Lcom/vkontakte/android/data/Groups;->isGroupAdmin(I)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 680
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-boolean v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->hasPhoto:Z

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/ProfileFragment;->showUpdatePhotoDlg(Z)V

    .line 684
    :goto_0
    return-void

    .line 682
    :cond_1
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->openProfilePhotos()V

    goto :goto_0
.end method

.method synthetic lambda$applyLayout$3(Landroid/view/View;)Z
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 687
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->openProfilePhotos()V

    .line 688
    const/4 v0, 0x1

    return v0
.end method

.method synthetic lambda$buildInfoItems$11(Landroid/view/View;)V
    .locals 5
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 1842
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget v1, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->groupType:I

    if-ne v1, v4, :cond_0

    .line 1843
    new-instance v0, Landroid/widget/PopupMenu;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Landroid/widget/PopupMenu;-><init>(Landroid/content/Context;Landroid/view/View;)V

    .line 1844
    .local v0, "pm":Landroid/widget/PopupMenu;
    invoke-virtual {v0}, Landroid/widget/PopupMenu;->getMenu()Landroid/view/Menu;

    move-result-object v1

    const v2, 0x7f0802c3

    invoke-interface {v1, v3, v3, v3, v2}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    .line 1845
    invoke-virtual {v0}, Landroid/widget/PopupMenu;->getMenu()Landroid/view/Menu;

    move-result-object v1

    const v2, 0x7f0802c4

    invoke-interface {v1, v3, v4, v3, v2}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    .line 1846
    invoke-static {p0}, Lcom/vkontakte/android/fragments/ProfileFragment$$Lambda$44;->lambdaFactory$(Lcom/vkontakte/android/fragments/ProfileFragment;)Landroid/widget/PopupMenu$OnMenuItemClickListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/PopupMenu;->setOnMenuItemClickListener(Landroid/widget/PopupMenu$OnMenuItemClickListener;)V

    .line 1850
    invoke-virtual {v0}, Landroid/widget/PopupMenu;->show()V

    .line 1854
    .end local v0    # "pm":Landroid/widget/PopupMenu;
    :goto_0
    return-void

    .line 1852
    :cond_0
    invoke-direct {p0, v4}, Lcom/vkontakte/android/fragments/ProfileFragment;->joinGroup(Z)V

    goto :goto_0
.end method

.method synthetic lambda$buildInfoItems$12(Landroid/view/View;)V
    .locals 0
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 1855
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->leaveGroup()V

    return-void
.end method

.method synthetic lambda$buildInfoItems$13()V
    .locals 1

    .prologue
    .line 1912
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->activity:Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/vkontakte/android/fragments/ProfileFragment;->showStatusEditDlg(Ljava/lang/CharSequence;)V

    return-void
.end method

.method synthetic lambda$buildInfoItems$14()V
    .locals 6

    .prologue
    .line 1926
    new-instance v0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;

    invoke-direct {v0}, Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;-><init>()V

    iget v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;->setUid(I)Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f080242

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    iget-object v5, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v5, v5, Lcom/vkontakte/android/api/ExtendedUserProfile;->firstNameGen:Ljava/lang/String;

    aput-object v5, v3, v4

    invoke-virtual {v1, v2, v3}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;->setTitle(Ljava/lang/String;)Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;->go(Landroid/content/Context;)Z

    return-void
.end method

.method synthetic lambda$buildInfoItems$15()V
    .locals 7

    .prologue
    .line 1939
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 1940
    .local v0, "args":Landroid/os/Bundle;
    const-string/jumbo v1, "uid"

    iget v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 1941
    const-string/jumbo v1, "title"

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f08021f

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    iget-object v6, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v6, v6, Lcom/vkontakte/android/api/ExtendedUserProfile;->firstNameGen:Ljava/lang/String;

    aput-object v6, v4, v5

    invoke-virtual {v2, v3, v4}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putCharSequence(Ljava/lang/String;Ljava/lang/CharSequence;)V

    .line 1942
    const-class v1, Lcom/vkontakte/android/fragments/userlist/FollowersListFragment;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-static {v1, v0, v2}, Lcom/vkontakte/android/navigation/Navigate;->to(Ljava/lang/Class;Landroid/os/Bundle;Landroid/content/Context;)V

    .line 1943
    return-void
.end method

.method synthetic lambda$buildInfoItems$16(Lcom/vkontakte/android/api/ExtendedUserProfile$Employer;)V
    .locals 3
    .param p1, "e"    # Lcom/vkontakte/android/api/ExtendedUserProfile$Employer;

    .prologue
    .line 1956
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 1957
    .local v0, "args":Landroid/os/Bundle;
    const-string/jumbo v1, "id"

    iget-object v2, p1, Lcom/vkontakte/android/api/ExtendedUserProfile$Employer;->group:Lcom/vkontakte/android/api/Group;

    iget v2, v2, Lcom/vkontakte/android/api/Group;->id:I

    neg-int v2, v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 1958
    const-class v1, Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-static {v1, v0, v2}, Lcom/vkontakte/android/navigation/Navigate;->to(Ljava/lang/Class;Landroid/os/Bundle;Landroid/content/Context;)V

    .line 1959
    return-void
.end method

.method synthetic lambda$buildInfoItems$17(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 1973
    new-instance v0, Lcom/vkontakte/android/fragments/ProfileDetailsFragment$Builder;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->detailsItems:Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v2, v2, Lcom/vkontakte/android/api/ExtendedUserProfile;->profile:Lcom/vkontakte/android/UserProfile;

    iget-object v2, v2, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/fragments/ProfileDetailsFragment$Builder;-><init>(Ljava/util/ArrayList;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/ProfileDetailsFragment$Builder;->go(Landroid/content/Context;)Z

    return-void
.end method

.method synthetic lambda$buildInfoItems$18()V
    .locals 6

    .prologue
    .line 1994
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v1, "android.intent.action.VIEW"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "geo:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-wide v4, v3, Lcom/vkontakte/android/api/ExtendedUserProfile;->lat:D

    invoke-virtual {v2, v4, v5}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, ","

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-wide v4, v3, Lcom/vkontakte/android/api/ExtendedUserProfile;->lon:D

    invoke-virtual {v2, v4, v5}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "?q="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-wide v4, v3, Lcom/vkontakte/android/api/ExtendedUserProfile;->lat:D

    invoke-virtual {v2, v4, v5}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, ","

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-wide v4, v3, Lcom/vkontakte/android/api/ExtendedUserProfile;->lon:D

    invoke-virtual {v2, v4, v5}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/ProfileFragment;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method synthetic lambda$buildInfoItems$19(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 2031
    new-instance v0, Lcom/vkontakte/android/fragments/ProfileDetailsFragment$Builder;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->detailsItems:Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v2, v2, Lcom/vkontakte/android/api/ExtendedUserProfile;->profile:Lcom/vkontakte/android/UserProfile;

    iget-object v2, v2, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/fragments/ProfileDetailsFragment$Builder;-><init>(Ljava/util/ArrayList;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/ProfileDetailsFragment$Builder;->go(Landroid/content/Context;)Z

    return-void
.end method

.method synthetic lambda$buildInfoItems$20(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 2041
    new-instance v0, Lcom/vkontakte/android/fragments/WikiViewFragment$Builder;

    invoke-direct {v0}, Lcom/vkontakte/android/fragments/WikiViewFragment$Builder;-><init>()V

    iget v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    .line 2042
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/WikiViewFragment$Builder;->setOid(I)Lcom/vkontakte/android/fragments/WikiViewFragment$Builder;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v1, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->mobilePhone:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/WikiViewFragment$Builder;->setTitle(Ljava/lang/String;)Lcom/vkontakte/android/fragments/WikiViewFragment$Builder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/WikiViewFragment$Builder;->go(Landroid/content/Context;)Z

    .line 2041
    return-void
.end method

.method synthetic lambda$buildInfoItems$21(Landroid/view/View;)V
    .locals 5
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 2052
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v0, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->website:Ljava/lang/String;

    .line 2053
    .local v0, "site":Ljava/lang/String;
    const-string/jumbo v1, "http://"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string/jumbo v1, "https://"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 2054
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "http://"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 2056
    :cond_0
    new-instance v1, Landroid/content/Intent;

    const-string/jumbo v2, "android.intent.action.VIEW"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "vklink://view/?"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->startActivity(Landroid/content/Intent;)V

    .line 2057
    return-void
.end method

.method synthetic lambda$buildInfoItems$22()V
    .locals 1

    .prologue
    .line 2441
    const-string/jumbo v0, "market"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/fragments/ProfileFragment;->openOwnerContent(Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$buildInfoItems$23()V
    .locals 1

    .prologue
    .line 2467
    const-string/jumbo v0, "photos"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/fragments/ProfileFragment;->openOwnerContent(Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$buildInfoItems$24()V
    .locals 2

    .prologue
    .line 2473
    new-instance v0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$Builder;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v1, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->mainAlbum:Lcom/vkontakte/android/api/PhotoAlbum;

    invoke-direct {v0, v1}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$Builder;-><init>(Lcom/vkontakte/android/api/PhotoAlbum;)V

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$Builder;->go(Landroid/content/Context;)Z

    return-void
.end method

.method synthetic lambda$buildInfoItems$25()V
    .locals 1

    .prologue
    .line 2501
    const-string/jumbo v0, "videos"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/fragments/ProfileFragment;->openOwnerContent(Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$buildInfoItems$26()V
    .locals 1

    .prologue
    .line 2525
    const-string/jumbo v0, "topics"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/fragments/ProfileFragment;->openOwnerContent(Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$buildInfoItems$27()V
    .locals 1

    .prologue
    .line 2542
    const-string/jumbo v0, "audios"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/fragments/ProfileFragment;->openOwnerContent(Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$buildInfoItems$28()V
    .locals 1

    .prologue
    .line 2556
    const-string/jumbo v0, "audios"

    invoke-direct {p0, v0}, Lcom/vkontakte/android/fragments/ProfileFragment;->openOwnerContent(Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$buildInfoItems$31(Landroid/view/View;)V
    .locals 0
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 2629
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->showNewPost()V

    return-void
.end method

.method synthetic lambda$editFriendLists$39([ZLjava/util/ArrayList;Lcom/vkontakte/android/UserProfile;Landroid/content/DialogInterface;I)V
    .locals 7
    .param p1, "checked"    # [Z
    .param p2, "lists"    # Ljava/util/ArrayList;
    .param p3, "p"    # Lcom/vkontakte/android/UserProfile;
    .param p4, "dialog"    # Landroid/content/DialogInterface;
    .param p5, "which"    # I

    .prologue
    .line 3036
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 3037
    .local v2, "ids":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const/4 v0, 0x0

    .line 3038
    .local v0, "_newMask":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v4, p1

    if-ge v1, v4, :cond_1

    .line 3039
    aget-boolean v4, p1, v1

    if-eqz v4, :cond_0

    .line 3040
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vkontakte/android/data/Friends$Folder;

    iget v4, v4, Lcom/vkontakte/android/data/Friends$Folder;->id:I

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, ""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 3041
    const/4 v5, 0x1

    invoke-virtual {p2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vkontakte/android/data/Friends$Folder;

    iget v4, v4, Lcom/vkontakte/android/data/Friends$Folder;->id:I

    shl-int v4, v5, v4

    or-int/2addr v0, v4

    .line 3038
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 3044
    :cond_1
    move v3, v0

    .line 3045
    .local v3, "newMask":I
    new-instance v4, Lcom/vkontakte/android/api/friends/FriendsEdit;

    iget v5, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    const-string/jumbo v6, ","

    invoke-static {v6, v2}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v5, v6}, Lcom/vkontakte/android/api/friends/FriendsEdit;-><init>(ILjava/lang/String;)V

    new-instance v5, Lcom/vkontakte/android/fragments/ProfileFragment$27;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v6

    invoke-direct {v5, p0, v6, p3, v3}, Lcom/vkontakte/android/fragments/ProfileFragment$27;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;Landroid/content/Context;Lcom/vkontakte/android/UserProfile;I)V

    invoke-virtual {v4, v5}, Lcom/vkontakte/android/api/friends/FriendsEdit;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v4

    .line 3051
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v4

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 3052
    return-void
.end method

.method synthetic lambda$leaveGroup$41(Landroid/content/DialogInterface;I)V
    .locals 0
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 3085
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->doLeaveGroup()V

    .line 3086
    return-void
.end method

.method synthetic lambda$null$10(Landroid/view/MenuItem;)Z
    .locals 2
    .param p1, "item1"    # Landroid/view/MenuItem;

    .prologue
    const/4 v1, 0x1

    .line 1847
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    if-nez v0, :cond_0

    move v0, v1

    :goto_0
    invoke-direct {p0, v0}, Lcom/vkontakte/android/fragments/ProfileFragment;->joinGroup(Z)V

    .line 1848
    return v1

    .line 1847
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method synthetic lambda$onActivityResult$9(Landroid/content/DialogInterface;I)V
    .locals 0
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 894
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->deletePhoto()V

    return-void
.end method

.method synthetic lambda$onCreateView$4(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 791
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/vkontakte/android/fragments/ProfileFragment;->switchOwnerOnly(Z)V

    return-void
.end method

.method synthetic lambda$onCreateView$5(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 792
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/vkontakte/android/fragments/ProfileFragment;->switchOwnerOnly(Z)V

    return-void
.end method

.method synthetic lambda$onCreateView$6(Landroid/view/View;)V
    .locals 0
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 793
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->openWallSearch()V

    return-void
.end method

.method synthetic lambda$onCreateView$7(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 810
    new-instance v0, Lcom/vkontakte/android/fragments/PostponedPostListFragment$Builder;

    iget v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    invoke-direct {v0, v1}, Lcom/vkontakte/android/fragments/PostponedPostListFragment$Builder;-><init>(I)V

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/PostponedPostListFragment$Builder;->go(Landroid/content/Context;)Z

    return-void
.end method

.method synthetic lambda$onCreateView$8(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 811
    new-instance v0, Lcom/vkontakte/android/fragments/SuggestedPostListFragment$Builder;

    iget v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    invoke-direct {v0, v1}, Lcom/vkontakte/android/fragments/SuggestedPostListFragment$Builder;-><init>(I)V

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/SuggestedPostListFragment$Builder;->go(Landroid/content/Context;)Z

    return-void
.end method

.method synthetic lambda$onViewCreated$0(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 441
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    if-eqz v0, :cond_0

    .line 442
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lme/grishka/appkit/views/UsableRecyclerView;->scrollToPosition(I)V

    .line 444
    :cond_0
    return-void
.end method

.method synthetic lambda$onViewCreated$1(I)Z
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 482
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->infoItems:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge p1, v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->infoItems:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/fragments/ProfileFragment$InfoItem;

    iget-boolean v0, v0, Lcom/vkontakte/android/fragments/ProfileFragment$InfoItem;->dividerAfter:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method synthetic lambda$removeFriend$37(Landroid/content/DialogInterface;I)V
    .locals 0
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 2961
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->doRemoveFriend()V

    return-void
.end method

.method synthetic lambda$showChangeEventDecisionOptions$40(Landroid/view/MenuItem;)Z
    .locals 3
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    const/4 v1, 0x1

    .line 3066
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const/4 v2, 0x3

    if-ne v0, v2, :cond_0

    .line 3067
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->leaveGroup()V

    .line 3071
    :goto_0
    return v1

    .line 3070
    :cond_0
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    if-ne v0, v1, :cond_1

    move v0, v1

    :goto_1
    invoke-direct {p0, v0}, Lcom/vkontakte/android/fragments/ProfileFragment;->joinGroup(Z)V

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    goto :goto_1
.end method

.method synthetic lambda$showStatusEditDlg$34(Landroid/widget/EditText;Landroid/content/DialogInterface;I)V
    .locals 1
    .param p1, "ed"    # Landroid/widget/EditText;
    .param p2, "dialog"    # Landroid/content/DialogInterface;
    .param p3, "which"    # I

    .prologue
    .line 2797
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/vkontakte/android/fragments/ProfileFragment;->setStatus(Ljava/lang/String;)V

    .line 2798
    return-void
.end method

.method synthetic lambda$showStatusEditDlg$35(Landroid/widget/EditText;Landroid/content/DialogInterface;)V
    .locals 3
    .param p1, "ed"    # Landroid/widget/EditText;
    .param p2, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 2802
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const-string/jumbo v2, "input_method"

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 2803
    .local v0, "imm":Landroid/view/inputmethod/InputMethodManager;
    const/4 v1, 0x1

    invoke-virtual {v0, p1, v1}, Landroid/view/inputmethod/InputMethodManager;->showSoftInput(Landroid/view/View;I)Z

    .line 2804
    return-void
.end method

.method synthetic lambda$toggleBlacklist$42(Landroid/content/DialogInterface;I)V
    .locals 0
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 3164
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->doToggleBlacklist()V

    .line 3165
    return-void
.end method

.method public loadInitial(ZI)V
    .locals 4
    .param p1, "refresh"    # Z
    .param p2, "count"    # I

    .prologue
    const/16 v3, 0x19

    .line 1124
    new-instance v1, Lcom/vkontakte/android/api/users/GetFullProfile;

    iget v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    const/16 v2, 0xf

    invoke-direct {v1, v0, v3, v3, v2}, Lcom/vkontakte/android/api/users/GetFullProfile;-><init>(IIII)V

    const-string/jumbo v2, "source"

    .line 1125
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v3, "referrer"

    invoke-virtual {v0, v3}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v3, "referrer"

    invoke-virtual {v0, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_0
    invoke-virtual {v1, v2, v0}, Lcom/vkontakte/android/api/users/GetFullProfile;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    new-instance v1, Lcom/vkontakte/android/fragments/ProfileFragment$12;

    invoke-direct {v1, p0, p0, p2}, Lcom/vkontakte/android/fragments/ProfileFragment$12;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;Landroid/app/Fragment;I)V

    .line 1126
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 1163
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->currentRequest:Lme/grishka/appkit/api/APIRequest;

    .line 1164
    return-void

    .line 1125
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 12
    .param p1, "reqCode"    # I
    .param p2, "resCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 878
    const/16 v0, 0xf3d

    if-ne p1, v0, :cond_0

    const/4 v0, -0x1

    if-ne p2, v0, :cond_0

    .line 879
    const-string/jumbo v0, "cropLeft"

    const/4 v1, 0x0

    invoke-virtual {p3, v0, v1}, Landroid/content/Intent;->getFloatExtra(Ljava/lang/String;F)F

    move-result v5

    .line 880
    .local v5, "cropLeft":F
    const-string/jumbo v0, "cropTop"

    const/4 v1, 0x0

    invoke-virtual {p3, v0, v1}, Landroid/content/Intent;->getFloatExtra(Ljava/lang/String;F)F

    move-result v6

    .line 881
    .local v6, "cropTop":F
    const-string/jumbo v0, "cropRight"

    const/4 v1, 0x0

    invoke-virtual {p3, v0, v1}, Landroid/content/Intent;->getFloatExtra(Ljava/lang/String;F)F

    move-result v7

    .line 882
    .local v7, "cropRight":F
    const-string/jumbo v0, "cropBottom"

    const/4 v1, 0x0

    invoke-virtual {p3, v0, v1}, Landroid/content/Intent;->getFloatExtra(Ljava/lang/String;F)F

    move-result v8

    .line 883
    .local v8, "cropBottom":F
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v11

    new-instance v0, Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const-string/jumbo v2, "file"

    invoke-virtual {p3, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iget v3, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    const/4 v4, 0x1

    invoke-direct/range {v0 .. v8}, Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;-><init>(Landroid/content/Context;Ljava/lang/String;IZFFFF)V

    invoke-static {v11, v0}, Lcom/vkontakte/android/upload/Upload;->start(Landroid/content/Context;Lcom/vkontakte/android/upload/UploadTask;)V

    .line 885
    .end local v5    # "cropLeft":F
    .end local v6    # "cropTop":F
    .end local v7    # "cropRight":F
    .end local v8    # "cropBottom":F
    :cond_0
    const/16 v0, 0xf3d

    if-ne p1, v0, :cond_2

    const/4 v0, 0x1

    if-ne p2, v0, :cond_2

    .line 886
    const-string/jumbo v0, "option"

    const/4 v1, 0x0

    invoke-virtual {p3, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v9

    .line 887
    .local v9, "idx":I
    if-nez v9, :cond_1

    .line 888
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->openProfilePhotos()V

    .line 890
    :cond_1
    const/4 v0, 0x1

    if-ne v9, v0, :cond_2

    .line 891
    new-instance v0, Lcom/vkontakte/android/VKAlertDialog$Builder;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vkontakte/android/VKAlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x7f080176

    .line 892
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f0801aa

    .line 893
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f080798

    invoke-static {p0}, Lcom/vkontakte/android/fragments/ProfileFragment$$Lambda$10;->lambdaFactory$(Lcom/vkontakte/android/fragments/ProfileFragment;)Landroid/content/DialogInterface$OnClickListener;

    move-result-object v2

    .line 894
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f080433

    const/4 v2, 0x0

    .line 895
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 896
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 899
    .end local v9    # "idx":I
    :cond_2
    const/16 v0, 0xf3e

    if-ne p1, v0, :cond_3

    const/4 v0, -0x1

    if-ne p2, v0, :cond_3

    .line 900
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const v1, 0x7f080579

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 902
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->refresh()V

    .line 904
    :cond_3
    const/16 v0, 0xf3f

    if-ne p1, v0, :cond_4

    const/4 v0, -0x1

    if-ne p2, v0, :cond_4

    .line 905
    const-string/jumbo v0, "user"

    invoke-virtual {p3, v0}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v10

    check-cast v10, Lcom/vkontakte/android/UserProfile;

    .line 906
    .local v10, "p":Lcom/vkontakte/android/UserProfile;
    new-instance v0, Lcom/vkontakte/android/api/groups/GroupsInvite;

    iget v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    neg-int v1, v1

    iget v2, v10, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/api/groups/GroupsInvite;-><init>(II)V

    new-instance v1, Lcom/vkontakte/android/fragments/ProfileFragment$9;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-direct {v1, p0, v2}, Lcom/vkontakte/android/fragments/ProfileFragment$9;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/groups/GroupsInvite;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 913
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 915
    .end local v10    # "p":Lcom/vkontakte/android/UserProfile;
    :cond_4
    return-void
.end method

.method public onAttach(Landroid/app/Activity;)V
    .locals 5
    .param p1, "act"    # Landroid/app/Activity;

    .prologue
    .line 418
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    const-string/jumbo v2, "id"

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v3

    invoke-virtual {v3}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v3

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v1

    iput v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    .line 419
    iget v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    if-nez v1, :cond_0

    .line 420
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v1

    iput v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    .line 422
    :cond_0
    const v1, 0x7f030187

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->setLayout(I)V

    .line 423
    iget v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    if-lez v1, :cond_1

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "id"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    :goto_0
    invoke-static {p1, v1}, Lcom/vkontakte/android/ActivityUtils;->setBeamLink(Landroid/app/Activity;Ljava/lang/String;)V

    .line 424
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->setHasOptionsMenu(Z)V

    .line 426
    const-string/jumbo v1, " "

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->setTitle(Ljava/lang/CharSequence;)V

    .line 428
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/PostListFragment;->onAttach(Landroid/app/Activity;)V

    .line 430
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 431
    .local v0, "filter":Landroid/content/IntentFilter;
    const-string/jumbo v1, "com.vkontakte.android.USER_PHOTO_CHANGED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 432
    const-string/jumbo v1, "com.vkontakte.android.RELOAD_PROFILE"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 433
    sget-object v1, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->receiver:Landroid/content/BroadcastReceiver;

    const-string/jumbo v3, "com.vkontakte.android.permission.ACCESS_DATA"

    const/4 v4, 0x0

    invoke-virtual {v1, v2, v0, v3, v4}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;)Landroid/content/Intent;

    .line 434
    return-void

    .line 423
    .end local v0    # "filter":Landroid/content/IntentFilter;
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "club"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 5
    .param p1, "cfg"    # Landroid/content/res/Configuration;

    .prologue
    .line 631
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/PostListFragment;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 633
    const/4 v2, 0x0

    .local v2, "pos":I
    const/4 v1, 0x0

    .line 634
    .local v1, "offset":I
    iget-object v3, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v3}, Lme/grishka/appkit/views/UsableRecyclerView;->getChildCount()I

    move-result v3

    if-lez v3, :cond_0

    .line 635
    iget-object v3, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lme/grishka/appkit/views/UsableRecyclerView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 636
    .local v0, "c":Landroid/view/View;
    iget-object v3, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v3, v0}, Lme/grishka/appkit/views/UsableRecyclerView;->getChildAdapterPosition(Landroid/view/View;)I

    move-result v2

    .line 637
    invoke-virtual {v0}, Landroid/view/View;->getTop()I

    move-result v1

    .line 640
    .end local v0    # "c":Landroid/view/View;
    :cond_0
    iget-object v3, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    iget-object v4, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->headerView:Landroid/view/View;

    invoke-virtual {v3, v4}, Lme/grishka/appkit/views/UsableRecyclerView;->removeView(Landroid/view/View;)V

    .line 641
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/ProfileFragment;->updateLayoutType(Landroid/content/res/Configuration;)V

    .line 642
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->applyLayout()V

    .line 643
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->updateHeaderItems()V

    .line 645
    iget-object v3, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v3}, Lme/grishka/appkit/views/UsableRecyclerView;->getRecycledViewPool()Landroid/support/v7/widget/RecyclerView$RecycledViewPool;

    move-result-object v3

    invoke-virtual {v3}, Landroid/support/v7/widget/RecyclerView$RecycledViewPool;->clear()V

    .line 646
    iget-object v3, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->onCreateLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v4

    invoke-virtual {v3, v4}, Lme/grishka/appkit/views/UsableRecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    .line 647
    iget-object v3, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v3}, Lme/grishka/appkit/views/UsableRecyclerView;->getLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v3

    check-cast v3, Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {v3, v2, v1}, Landroid/support/v7/widget/LinearLayoutManager;->scrollToPositionWithOffset(II)V

    .line 649
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->updateContentParalaxPadding()V

    .line 650
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 3
    .param p1, "state"    # Landroid/os/Bundle;

    .prologue
    .line 398
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/PostListFragment;->onCreate(Landroid/os/Bundle;)V

    .line 399
    invoke-static {}, Lcom/vk/stories/StoriesController;->notificationCenter()Lcom/vk/attachpicker/events/NotificationCenter;

    move-result-object v0

    const/16 v1, 0x64

    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->storyMarkAsSeenListener:Lcom/vk/attachpicker/events/NotificationListener;

    invoke-virtual {v0, v1, v2}, Lcom/vk/attachpicker/events/NotificationCenter;->addListener(ILcom/vk/attachpicker/events/NotificationListener;)V

    .line 400
    return-void
.end method

.method protected onCreateCardDecorator()Lcom/vkontakte/android/ui/CardItemDecorator;
    .locals 8

    .prologue
    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 499
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    invoke-virtual {v6}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v6

    iget v3, v6, Landroid/content/res/Configuration;->screenWidthDp:I

    .line 500
    .local v3, "scrW":I
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->isTabletDecorator()Z

    move-result v6

    if-eqz v6, :cond_0

    iget-boolean v6, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->isTablet:Z

    if-eqz v6, :cond_0

    move v1, v4

    .line 501
    .local v1, "isTablet":Z
    :goto_0
    new-instance v0, Lcom/vkontakte/android/ui/CardItemDecorator;

    iget-object v6, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    if-nez v1, :cond_1

    :goto_1
    invoke-direct {v0, v6, v4}, Lcom/vkontakte/android/ui/CardItemDecorator;-><init>(Landroid/support/v7/widget/RecyclerView;Z)V

    .line 502
    .local v0, "decorator":Lcom/vkontakte/android/ui/CardItemDecorator;
    const/high16 v4, 0x40000000    # 2.0f

    invoke-static {v4}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v4

    const/high16 v6, 0x40400000    # 3.0f

    invoke-static {v6}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v6

    const/high16 v7, -0x40000000    # -2.0f

    invoke-static {v7}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v7

    invoke-virtual {v0, v4, v6, v7, v5}, Lcom/vkontakte/android/ui/CardItemDecorator;->setPadding(IIII)V

    .line 503
    if-eqz v1, :cond_2

    const/16 v4, 0x10

    add-int/lit16 v6, v3, -0x348

    add-int/lit8 v6, v6, -0x54

    div-int/lit8 v6, v6, 0x2

    invoke-static {v4, v6}, Ljava/lang/Math;->max(II)I

    move-result v4

    int-to-float v4, v4

    invoke-static {v4}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v2

    .line 504
    .local v2, "pad":I
    :goto_2
    iget-object v4, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v4, v2, v5, v2, v5}, Lme/grishka/appkit/views/UsableRecyclerView;->setPadding(IIII)V

    .line 505
    return-object v0

    .end local v0    # "decorator":Lcom/vkontakte/android/ui/CardItemDecorator;
    .end local v1    # "isTablet":Z
    .end local v2    # "pad":I
    :cond_0
    move v1, v5

    .line 500
    goto :goto_0

    .restart local v1    # "isTablet":Z
    :cond_1
    move v4, v5

    .line 501
    goto :goto_1

    .restart local v0    # "decorator":Lcom/vkontakte/android/ui/CardItemDecorator;
    :cond_2
    move v2, v5

    .line 503
    goto :goto_2
.end method

.method protected onCreateLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;
    .locals 3

    .prologue
    .line 520
    iget v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->layoutType:I

    const/4 v2, 0x1

    if-lt v1, v2, :cond_0

    .line 521
    new-instance v0, Landroid/support/v7/widget/GridLayoutManager;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Landroid/support/v7/widget/GridLayoutManager;-><init>(Landroid/content/Context;I)V

    .line 522
    .local v0, "glm":Landroid/support/v7/widget/GridLayoutManager;
    new-instance v1, Lcom/vkontakte/android/fragments/ProfileFragment$6;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/fragments/ProfileFragment$6;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;)V

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/GridLayoutManager;->setSpanSizeLookup(Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;)V

    .line 546
    .end local v0    # "glm":Landroid/support/v7/widget/GridLayoutManager;
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/support/v7/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    goto :goto_0
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V
    .locals 8
    .param p1, "menu"    # Landroid/view/Menu;
    .param p2, "inflater"    # Landroid/view/MenuInflater;

    .prologue
    const v7, 0x7f1005fb

    const v6, 0x7f1005f7

    const v5, 0x7f1005f6

    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 592
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    if-nez v0, :cond_1

    .line 627
    :cond_0
    :goto_0
    return-void

    .line 595
    :cond_1
    const v0, 0x7f11000e

    invoke-virtual {p2, v0, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 596
    const v0, 0x7f10052e

    invoke-interface {p1, v0}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v3

    iget v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v4

    invoke-virtual {v4}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v4

    if-ne v0, v4, :cond_4

    move v0, v1

    :goto_1
    invoke-interface {v3, v0}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 597
    const v0, 0x7f1005f9

    invoke-interface {p1, v0}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v3

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v0

    iget v4, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    if-eq v0, v4, :cond_5

    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-boolean v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->isFavorite:Z

    if-nez v0, :cond_5

    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    invoke-virtual {v0}, Lcom/vkontakte/android/api/ExtendedUserProfile;->isDeactivated()Z

    move-result v0

    if-nez v0, :cond_5

    move v0, v1

    :goto_2
    invoke-interface {v3, v0}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 598
    const v0, 0x7f1005fc

    invoke-interface {p1, v0}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v3

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v0

    iget v4, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    if-eq v0, v4, :cond_6

    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-boolean v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->isFavorite:Z

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    invoke-virtual {v0}, Lcom/vkontakte/android/api/ExtendedUserProfile;->isDeactivated()Z

    move-result v0

    if-nez v0, :cond_6

    move v0, v1

    :goto_3
    invoke-interface {v3, v0}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 599
    const v0, 0x7f1001d2

    invoke-interface {p1, v0}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v3

    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    invoke-virtual {v0}, Lcom/vkontakte/android/api/ExtendedUserProfile;->isDeactivated()Z

    move-result v0

    if-nez v0, :cond_7

    iget v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v4

    invoke-virtual {v4}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v4

    if-eq v0, v4, :cond_7

    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->ban:Lcom/vkontakte/android/api/ExtendedUserProfile$BanInfo;

    if-nez v0, :cond_7

    move v0, v1

    :goto_4
    invoke-interface {v3, v0}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 600
    const v0, 0x7f1001d2

    invoke-interface {p1, v0}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v3

    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-boolean v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->isSubscribed:Z

    if-eqz v0, :cond_8

    const v0, 0x7f080722

    :goto_5
    invoke-interface {v3, v0}, Landroid/view/MenuItem;->setTitle(I)Landroid/view/MenuItem;

    .line 601
    const v0, 0x7f1005f8

    invoke-interface {p1, v0}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v3

    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-boolean v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->isLiveEnabled:Z

    if-eqz v0, :cond_9

    iget v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v4

    invoke-virtual {v4}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v4

    if-eq v0, v4, :cond_9

    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->ban:Lcom/vkontakte/android/api/ExtendedUserProfile$BanInfo;

    if-nez v0, :cond_9

    move v0, v1

    :goto_6
    invoke-interface {v3, v0}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 602
    const v0, 0x7f1005f8

    invoke-interface {p1, v0}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v3

    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-boolean v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->isLiveSubscribed:Z

    if-eqz v0, :cond_a

    const v0, 0x7f0802fb

    :goto_7
    invoke-interface {v3, v0}, Landroid/view/MenuItem;->setTitle(I)Landroid/view/MenuItem;

    .line 603
    const v0, 0x7f10037f

    invoke-interface {p1, v0}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v3

    iget v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    if-lez v0, :cond_b

    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    invoke-virtual {v0}, Lcom/vkontakte/android/api/ExtendedUserProfile;->isDeactivated()Z

    move-result v0

    if-nez v0, :cond_b

    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->ban:Lcom/vkontakte/android/api/ExtendedUserProfile$BanInfo;

    if-nez v0, :cond_b

    iget v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v4

    invoke-virtual {v4}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v4

    if-eq v0, v4, :cond_b

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v0

    if-lez v0, :cond_b

    move v0, v1

    :goto_8
    invoke-interface {v3, v0}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 604
    iget v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    if-lez v0, :cond_d

    .line 605
    iget v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v1

    if-eq v0, v1, :cond_2

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v0

    if-nez v0, :cond_3

    .line 606
    :cond_2
    invoke-interface {p1, v7}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    invoke-interface {v0, v2}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 608
    :cond_3
    invoke-interface {p1, v7}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v1

    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-boolean v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->blacklisted:Z

    if-eqz v0, :cond_c

    const v0, 0x7f08071d

    :goto_9
    invoke-interface {v1, v0}, Landroid/view/MenuItem;->setTitle(I)Landroid/view/MenuItem;

    .line 609
    invoke-interface {p1, v6}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    invoke-interface {v0, v2}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 610
    invoke-interface {p1, v5}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    invoke-interface {v0, v2}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 611
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    invoke-virtual {v0}, Lcom/vkontakte/android/api/ExtendedUserProfile;->isDeactivated()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->friendStatus:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    .line 612
    const v0, 0x7f1005e8

    const v1, 0x7f0801a4

    invoke-interface {p1, v2, v0, v2, v1}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    goto/16 :goto_0

    :cond_4
    move v0, v2

    .line 596
    goto/16 :goto_1

    :cond_5
    move v0, v2

    .line 597
    goto/16 :goto_2

    :cond_6
    move v0, v2

    .line 598
    goto/16 :goto_3

    :cond_7
    move v0, v2

    .line 599
    goto/16 :goto_4

    .line 600
    :cond_8
    const v0, 0x7f0806db

    goto/16 :goto_5

    :cond_9
    move v0, v2

    .line 601
    goto/16 :goto_6

    .line 602
    :cond_a
    const v0, 0x7f0802fc

    goto/16 :goto_7

    :cond_b
    move v0, v2

    .line 603
    goto :goto_8

    .line 608
    :cond_c
    const v0, 0x7f080118

    goto :goto_9

    .line 615
    :cond_d
    invoke-interface {p1, v7}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    invoke-interface {v0, v2}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 616
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    invoke-virtual {v0}, Lcom/vkontakte/android/api/ExtendedUserProfile;->isDeactivated()Z

    move-result v0

    if-nez v0, :cond_11

    .line 617
    invoke-interface {p1, v6}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v3

    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->adminLevel:I

    if-lez v0, :cond_f

    move v0, v1

    :goto_a
    invoke-interface {v3, v0}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 618
    invoke-interface {p1, v5}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    iget-object v3, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget v3, v3, Lcom/vkontakte/android/api/ExtendedUserProfile;->groupType:I

    const/4 v4, 0x2

    if-eq v3, v4, :cond_10

    iget-object v3, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget v3, v3, Lcom/vkontakte/android/api/ExtendedUserProfile;->groupAccess:I

    if-eqz v3, :cond_e

    iget-object v3, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget v3, v3, Lcom/vkontakte/android/api/ExtendedUserProfile;->adminLevel:I

    if-lt v3, v1, :cond_10

    :cond_e
    :goto_b
    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    goto/16 :goto_0

    :cond_f
    move v0, v2

    .line 617
    goto :goto_a

    :cond_10
    move v1, v2

    .line 618
    goto :goto_b

    .line 620
    :cond_11
    invoke-interface {p1, v6}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    invoke-interface {v0, v2}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 621
    invoke-interface {p1, v5}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    invoke-interface {v0, v2}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 622
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->friendStatus:I

    if-ne v0, v1, :cond_0

    .line 623
    const v0, 0x7f1005e8

    const v1, 0x7f08032c

    invoke-interface {p1, v2, v0, v2, v1}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    goto/16 :goto_0
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 8
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const v3, 0x7f100501

    const v7, 0x7f0301da

    const/high16 v5, 0x42000000    # 32.0f

    const/high16 v4, 0x41800000    # 16.0f

    const/4 v6, 0x0

    .line 787
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->updateLayoutType(Landroid/content/res/Configuration;)V

    .line 788
    invoke-super {p0, p1, p2, p3}, Lcom/vkontakte/android/fragments/PostListFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    move-result-object v0

    .line 790
    .local v0, "view":Landroid/view/View;
    const v1, 0x7f0301de

    invoke-virtual {p1, v1, p2, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->selector:Landroid/view/View;

    .line 791
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->selector:Landroid/view/View;

    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-static {p0}, Lcom/vkontakte/android/fragments/ProfileFragment$$Lambda$5;->lambdaFactory$(Lcom/vkontakte/android/fragments/ProfileFragment;)Landroid/view/View$OnClickListener;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 792
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->selector:Landroid/view/View;

    const v2, 0x7f100502

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-static {p0}, Lcom/vkontakte/android/fragments/ProfileFragment$$Lambda$6;->lambdaFactory$(Lcom/vkontakte/android/fragments/ProfileFragment;)Landroid/view/View$OnClickListener;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 793
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->selector:Landroid/view/View;

    const v2, 0x7f100503

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-static {p0}, Lcom/vkontakte/android/fragments/ProfileFragment$$Lambda$7;->lambdaFactory$(Lcom/vkontakte/android/fragments/ProfileFragment;)Landroid/view/View$OnClickListener;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 794
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->selector:Landroid/view/View;

    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/view/View;->setSelected(Z)V

    .line 796
    new-instance v1, Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->emptyText:Landroid/widget/TextView;

    .line 797
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->emptyText:Landroid/widget/TextView;

    const v2, 0x7f080780

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(I)V

    .line 798
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->emptyText:Landroid/widget/TextView;

    const/16 v2, 0x11

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setGravity(I)V

    .line 799
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->emptyText:Landroid/widget/TextView;

    invoke-static {v4}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v2

    invoke-static {v5}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v3

    invoke-static {v4}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v4

    invoke-static {v5}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v5

    invoke-virtual {v1, v2, v3, v4, v5}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 800
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->emptyText:Landroid/widget/TextView;

    const/high16 v2, 0x41880000    # 17.0f

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 801
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->emptyText:Landroid/widget/TextView;

    const v2, -0x5c5c5d

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 802
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->emptyText:Landroid/widget/TextView;

    const v2, 0x7f10019e

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setId(I)V

    .line 803
    new-instance v1, Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->emptyText:Landroid/widget/TextView;

    invoke-direct {v1, p0, v2}, Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;Landroid/view/View;)V

    iput-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->emptyViewItem:Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;

    .line 804
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->emptyViewItem:Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;

    const/4 v2, 0x4

    iput v2, v1, Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;->backgroundType:I

    .line 806
    new-instance v1, Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v2

    iget-object v3, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v2, v7, v3, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v2

    invoke-direct {v1, p0, v2}, Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;Landroid/view/View;)V

    iput-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->postponedView:Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;

    .line 807
    new-instance v1, Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v2

    iget-object v3, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v2, v7, v3, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v2

    invoke-direct {v1, p0, v2}, Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;Landroid/view/View;)V

    iput-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->suggestsView:Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;

    .line 808
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->postponedView:Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;->view:Landroid/view/View;

    const v2, 0x7f10006d

    invoke-virtual {v1, v2}, Landroid/view/View;->setId(I)V

    .line 809
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->suggestsView:Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;->view:Landroid/view/View;

    const v2, 0x7f10006e

    invoke-virtual {v1, v2}, Landroid/view/View;->setId(I)V

    .line 810
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->postponedView:Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;->view:Landroid/view/View;

    invoke-static {p0}, Lcom/vkontakte/android/fragments/ProfileFragment$$Lambda$8;->lambdaFactory$(Lcom/vkontakte/android/fragments/ProfileFragment;)Landroid/view/View$OnClickListener;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 811
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->suggestsView:Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;->view:Landroid/view/View;

    invoke-static {p0}, Lcom/vkontakte/android/fragments/ProfileFragment$$Lambda$9;->lambdaFactory$(Lcom/vkontakte/android/fragments/ProfileFragment;)Landroid/view/View$OnClickListener;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 813
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->contentWrap:Landroid/view/ViewGroup;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->emptyView:Landroid/view/View;

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 815
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->applyLayout()V

    .line 817
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->updateHeaderItems()V

    .line 819
    return-object v0
.end method

.method public onDestroy()V
    .locals 4

    .prologue
    .line 403
    invoke-static {}, Lcom/vk/stories/StoriesController;->notificationCenter()Lcom/vk/attachpicker/events/NotificationCenter;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->storyMarkAsSeenListener:Lcom/vk/attachpicker/events/NotificationListener;

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/events/NotificationCenter;->removeListener(Lcom/vk/attachpicker/events/NotificationListener;)V

    .line 404
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->googleApiClient:Lcom/google/android/gms/common/api/GoogleApiClient;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->indexingAppUri:Landroid/net/Uri;

    if-eqz v0, :cond_0

    .line 405
    sget-object v0, Lcom/google/android/gms/appindexing/AppIndex;->AppIndexApi:Lcom/google/android/gms/appindexing/AppIndexApi;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->googleApiClient:Lcom/google/android/gms/common/api/GoogleApiClient;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    iget-object v3, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->indexingAppUri:Landroid/net/Uri;

    invoke-interface {v0, v1, v2, v3}, Lcom/google/android/gms/appindexing/AppIndexApi;->viewEnd(Lcom/google/android/gms/common/api/GoogleApiClient;Landroid/app/Activity;Landroid/net/Uri;)Lcom/google/android/gms/common/api/PendingResult;

    .line 406
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->googleApiClient:Lcom/google/android/gms/common/api/GoogleApiClient;

    invoke-virtual {v0}, Lcom/google/android/gms/common/api/GoogleApiClient;->disconnect()V

    .line 408
    :cond_0
    invoke-super {p0}, Lcom/vkontakte/android/fragments/PostListFragment;->onDestroy()V

    .line 409
    return-void
.end method

.method public onDestroyView()V
    .locals 1

    .prologue
    .line 413
    invoke-super {p0}, Lcom/vkontakte/android/fragments/PostListFragment;->onDestroyView()V

    .line 414
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->parallaxPreDrawListener:Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->cleanOldView()V

    .line 415
    return-void
.end method

.method public onDetach()V
    .locals 3

    .prologue
    .line 510
    :try_start_0
    sget-object v1, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->receiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v1, v2}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 514
    :goto_0
    invoke-super {p0}, Lcom/vkontakte/android/fragments/PostListFragment;->onDetach()V

    .line 515
    return-void

    .line 511
    :catch_0
    move-exception v0

    .line 512
    .local v0, "x":Ljava/lang/Exception;
    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 1
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 728
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    sparse-switch v0, :sswitch_data_0

    .line 782
    :goto_0
    const/4 v0, 0x1

    return v0

    .line 736
    :sswitch_0
    iget v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    if-lez v0, :cond_0

    .line 737
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->removeFriend()V

    goto :goto_0

    .line 739
    :cond_0
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->leaveGroup()V

    goto :goto_0

    .line 743
    :sswitch_1
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->copyLink()V

    goto :goto_0

    .line 746
    :sswitch_2
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->openInBrowser()V

    goto :goto_0

    .line 749
    :sswitch_3
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->toggleBlacklist()V

    goto :goto_0

    .line 752
    :sswitch_4
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->editProfile()V

    goto :goto_0

    .line 758
    :sswitch_5
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->editGroup()V

    goto :goto_0

    .line 761
    :sswitch_6
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->inviteToGroup()V

    goto :goto_0

    .line 764
    :sswitch_7
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->openWallSearch()V

    goto :goto_0

    .line 767
    :sswitch_8
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->addToFavorites()V

    goto :goto_0

    .line 770
    :sswitch_9
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->removeFromFavorites()V

    goto :goto_0

    .line 773
    :sswitch_a
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->togglePostSubscription()V

    goto :goto_0

    .line 776
    :sswitch_b
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->toggleLiveSubscription()V

    goto :goto_0

    .line 779
    :sswitch_c
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->sendGift()V

    goto :goto_0

    .line 728
    nop

    :sswitch_data_0
    .sparse-switch
        0x7f10000f -> :sswitch_1
        0x7f10007f -> :sswitch_7
        0x7f1001d2 -> :sswitch_a
        0x7f10037f -> :sswitch_c
        0x7f10052e -> :sswitch_4
        0x7f1005e8 -> :sswitch_0
        0x7f1005f6 -> :sswitch_6
        0x7f1005f7 -> :sswitch_5
        0x7f1005f8 -> :sswitch_b
        0x7f1005f9 -> :sswitch_8
        0x7f1005fa -> :sswitch_2
        0x7f1005fb -> :sswitch_3
        0x7f1005fc -> :sswitch_9
    .end sparse-switch
.end method

.method public onPause()V
    .locals 1

    .prologue
    .line 551
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Lcom/vkontakte/android/media/VideoPools;->onPause(Landroid/app/Activity;)V

    .line 552
    invoke-super {p0}, Lcom/vkontakte/android/fragments/PostListFragment;->onPause()V

    .line 553
    return-void
.end method

.method protected onPostDeleted(Lcom/vkontakte/android/NewsEntry;)V
    .locals 3
    .param p1, "post"    # Lcom/vkontakte/android/NewsEntry;

    .prologue
    const/4 v2, 0x0

    const/4 v1, -0x1

    .line 824
    const/16 v0, 0x800

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/NewsEntry;->flag(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 825
    invoke-virtual {p0, v1, v2}, Lcom/vkontakte/android/fragments/ProfileFragment;->updatePostsButtons(II)V

    .line 827
    :cond_0
    const/16 v0, 0x1000

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/NewsEntry;->flag(I)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 828
    invoke-virtual {p0, v2, v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->updatePostsButtons(II)V

    .line 830
    :cond_1
    return-void
.end method

.method public onResume()V
    .locals 1

    .prologue
    .line 557
    invoke-super {p0}, Lcom/vkontakte/android/fragments/PostListFragment;->onResume()V

    .line 558
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Lcom/vkontakte/android/media/VideoPools;->onResume(Landroid/app/Activity;)V

    .line 559
    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 5
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 438
    invoke-super {p0, p1, p2}, Lcom/vkontakte/android/fragments/PostListFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 439
    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->contentView:Landroid/view/ViewGroup;

    const v3, 0x7f10043c

    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v2

    iput-object v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->statusBarBgView:Landroid/view/View;

    .line 440
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getToolbar()Landroid/support/v7/widget/Toolbar;

    move-result-object v2

    invoke-static {p0}, Lcom/vkontakte/android/fragments/ProfileFragment$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/fragments/ProfileFragment;)Landroid/view/View$OnClickListener;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/support/v7/widget/Toolbar;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 446
    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->headerView:Landroid/view/View;

    const v3, 0x7f1004f9

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/vk/imageloader/view/VKImageView;

    .line 447
    .local v1, "vkImageView":Lcom/vk/imageloader/view/VKImageView;
    if-eqz v1, :cond_0

    .line 448
    const/high16 v2, 0x40800000    # 4.0f

    invoke-virtual {v1, v2}, Lcom/vk/imageloader/view/VKImageView;->setMaxAspectRatio(F)V

    .line 451
    :cond_0
    iget v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    if-lez v2, :cond_2

    .line 452
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->addParallaxEffect()V

    .line 459
    :cond_1
    :goto_0
    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v2}, Lme/grishka/appkit/views/UsableRecyclerView;->getRecycledViewPool()Landroid/support/v7/widget/RecyclerView$RecycledViewPool;

    move-result-object v2

    const v3, 0x7f10006f

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/support/v7/widget/RecyclerView$RecycledViewPool;->setMaxRecycledViews(II)V

    .line 461
    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    new-instance v3, Lcom/vkontakte/android/fragments/ProfileFragment$5;

    invoke-direct {v3, p0}, Lcom/vkontakte/android/fragments/ProfileFragment$5;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;)V

    invoke-virtual {v2, v3}, Lme/grishka/appkit/views/UsableRecyclerView;->addItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    .line 480
    new-instance v0, Lme/grishka/appkit/views/DividerItemDecoration;

    new-instance v2, Landroid/graphics/drawable/ColorDrawable;

    const/high16 v3, 0x26000000

    invoke-direct {v2, v3}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    const/high16 v3, 0x3f000000    # 0.5f

    invoke-static {v3}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v3

    invoke-direct {v0, v2, v3}, Lme/grishka/appkit/views/DividerItemDecoration;-><init>(Landroid/graphics/drawable/Drawable;I)V

    .line 481
    .local v0, "dividers":Lme/grishka/appkit/views/DividerItemDecoration;
    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Lme/grishka/appkit/views/DividerItemDecoration;->setUseDecoratedVBounds(Z)V

    .line 482
    invoke-static {p0}, Lcom/vkontakte/android/fragments/ProfileFragment$$Lambda$2;->lambdaFactory$(Lcom/vkontakte/android/fragments/ProfileFragment;)Lme/grishka/appkit/views/DividerItemDecoration$Provider;

    move-result-object v2

    invoke-virtual {v0, v2}, Lme/grishka/appkit/views/DividerItemDecoration;->setProvider(Lme/grishka/appkit/views/DividerItemDecoration$Provider;)Lme/grishka/appkit/views/DividerItemDecoration;

    .line 483
    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v2, v0}, Lme/grishka/appkit/views/UsableRecyclerView;->addItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    .line 484
    return-void

    .line 453
    .end local v0    # "dividers":Lme/grishka/appkit/views/DividerItemDecoration;
    :cond_2
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->isEnableGroupParallaxEffect()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 454
    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->parallaxPreDrawListener:Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;

    invoke-virtual {v2}, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->hideToolbar()V

    goto :goto_0
.end method

.method public openProfilePhotos()V
    .locals 6

    .prologue
    .line 1017
    new-instance v0, Lcom/vkontakte/android/api/photos/PhotosGet;

    iget v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    const/4 v2, -0x6

    const/4 v3, 0x0

    const/16 v4, 0xf

    const/4 v5, 0x1

    invoke-direct/range {v0 .. v5}, Lcom/vkontakte/android/api/photos/PhotosGet;-><init>(IIIIZ)V

    new-instance v1, Lcom/vkontakte/android/fragments/ProfileFragment$11;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-direct {v1, p0, v2}, Lcom/vkontakte/android/fragments/ProfileFragment$11;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/photos/PhotosGet;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 1031
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 1032
    return-void
.end method

.method public prepend(Lcom/vkontakte/android/NewsEntry;)V
    .locals 2
    .param p1, "e"    # Lcom/vkontakte/android/NewsEntry;

    .prologue
    .line 3397
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->infoItems:Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->emptyViewItem:Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 3398
    iget v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->totalPosts:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->totalPosts:I

    .line 3399
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->updatePostCount()V

    .line 3400
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/PostListFragment;->prepend(Lcom/vkontakte/android/NewsEntry;)V

    .line 3401
    return-void
.end method

.method public remove(II)V
    .locals 2
    .param p1, "oid"    # I
    .param p2, "pid"    # I

    .prologue
    .line 3405
    invoke-super {p0, p1, p2}, Lcom/vkontakte/android/fragments/PostListFragment;->remove(II)V

    .line 3406
    iget v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    if-ne p1, v0, :cond_0

    .line 3407
    iget v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->totalPosts:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->totalPosts:I

    .line 3408
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->updatePostCount()V

    .line 3410
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->data:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->infoItems:Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->emptyViewItem:Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 3411
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->infoItems:Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->emptyViewItem:Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 3412
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->updateList()V

    .line 3414
    :cond_1
    return-void
.end method

.method protected setTitle(Ljava/lang/CharSequence;)V
    .locals 4
    .param p1, "title"    # Ljava/lang/CharSequence;

    .prologue
    .line 4716
    const-string/jumbo v2, ""

    invoke-super {p0, v2}, Lcom/vkontakte/android/fragments/PostListFragment;->setTitle(Ljava/lang/CharSequence;)V

    .line 4717
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getView()Landroid/view/View;

    move-result-object v1

    .line 4718
    .local v1, "view":Landroid/view/View;
    if-eqz v1, :cond_0

    .line 4719
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getView()Landroid/view/View;

    move-result-object v2

    const v3, 0x7f10043b

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 4720
    .local v0, "textView":Landroid/widget/TextView;
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 4722
    .end local v0    # "textView":Landroid/widget/TextView;
    :cond_0
    return-void
.end method

.method public setUserPhoto(Ljava/lang/String;)V
    .locals 1
    .param p1, "photo"    # Ljava/lang/String;

    .prologue
    .line 1054
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    if-nez v0, :cond_0

    .line 1060
    :goto_0
    return-void

    .line 1057
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->profile:Lcom/vkontakte/android/UserProfile;

    iput-object p1, v0, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    .line 1058
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iput-object p1, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->bigPhoto:Ljava/lang/String;

    .line 1059
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->updateList()V

    goto :goto_0
.end method

.method public showUpdatePhotoDlg(Z)V
    .locals 5
    .param p1, "havePhotos"    # Z

    .prologue
    const/4 v4, 0x1

    .line 844
    new-instance v1, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    const-class v3, Lcom/vkontakte/android/ImagePickerActivity;

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 845
    .local v1, "intent":Landroid/content/Intent;
    const-string/jumbo v2, "allow_album"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 846
    const-string/jumbo v2, "limit"

    invoke-virtual {v1, v2, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 847
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 848
    .local v0, "acts":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    if-eqz p1, :cond_0

    .line 849
    const v2, 0x7f08047e

    invoke-virtual {p0, v2}, Lcom/vkontakte/android/fragments/ProfileFragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 850
    const v2, 0x7f08019c

    invoke-virtual {p0, v2}, Lcom/vkontakte/android/fragments/ProfileFragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 851
    const-string/jumbo v2, "custom"

    invoke-virtual {v1, v2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 853
    :cond_0
    const-string/jumbo v2, "no_thumbs"

    invoke-virtual {v1, v2, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 854
    const-string/jumbo v2, "force_thumb"

    invoke-virtual {v1, v2, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 855
    const/16 v2, 0xf3d

    invoke-virtual {p0, v1, v2}, Lcom/vkontakte/android/fragments/ProfileFragment;->startActivityForResult(Landroid/content/Intent;I)V

    .line 856
    return-void
.end method

.method public updateContentParalaxPadding()V
    .locals 2

    .prologue
    .line 1063
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->content:Landroid/view/View;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->content:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 1064
    iget v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    if-gez v0, :cond_2

    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    invoke-virtual {v0}, Lcom/vkontakte/android/api/ExtendedUserProfile;->hasCover()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->isEnableGroupParallaxEffect()Z

    move-result v0

    if-nez v0, :cond_2

    .line 1065
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->content:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getToolbar()Landroid/support/v7/widget/Toolbar;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v7/widget/Toolbar;->getBottom()I

    move-result v1

    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 1070
    :cond_1
    :goto_0
    return-void

    .line 1067
    :cond_2
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->content:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    const/4 v1, 0x0

    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    goto :goto_0
.end method

.method public updatePostsButtons(II)V
    .locals 3
    .param p1, "postponed"    # I
    .param p2, "suggested"    # I

    .prologue
    .line 2710
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget v1, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->postponedCount:I

    add-int/2addr v1, p1

    iput v1, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->postponedCount:I

    .line 2711
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget v1, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->suggestedCount:I

    add-int/2addr v1, p2

    iput v1, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->suggestedCount:I

    .line 2712
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->updatePostsButtons()V

    .line 2713
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->updateList()V

    .line 2714
    iget v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->uid:I

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v1

    if-ne v0, v1, :cond_0

    .line 2715
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/Activity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string/jumbo v1, "postponed_count"

    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget v2, v2, Lcom/vkontakte/android/api/ExtendedUserProfile;->postponedCount:I

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 2717
    :cond_0
    return-void
.end method
