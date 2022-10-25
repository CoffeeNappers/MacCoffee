.class public Lcom/vkontakte/android/fragments/friends/FriendsFragment;
.super Lcom/vkontakte/android/fragments/VkTabbedLoaderFragment;
.source "FriendsFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/fragments/friends/FriendsFragment$TabAdapter;,
        Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;
    }
.end annotation


# static fields
.field private static final FRIENDS_FOLDER_ALL:I = 0x0

.field private static final FRIENDS_FOLDER_BIRTHDAY:I = 0x1

.field private static final FRIENDS_FOLDER_REQUEST:I = 0x2

.field private static final MODE_BIRTHDAY:I = 0x1

.field private static final MODE_FRIENDS:I = 0x0

.field private static final MODE_REQUESTS:I = 0x2

.field private static final MODE_UNDEFINED:I = -0x1


# instance fields
.field private addItem:Landroid/view/MenuItem;

.field private allFriends:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;"
        }
    .end annotation
.end field

.field private allFriendsView:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

.field private birthdaysFragment:Lcom/vkontakte/android/fragments/gifts/BirthdaysFragment;

.field private currentMode:I

.field private currentPosition:I

.field private disable_spinner:Z

.field private fActionButton:Landroid/support/design/widget/FloatingActionButton;

.field private folders:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/data/Friends$Folder;",
            ">;"
        }
    .end annotation
.end field

.field private fragments:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/app/Fragment;",
            ">;"
        }
    .end annotation
.end field

.field private global_search:Z

.field private inRequestsCount:I

.field private inRequestsView:Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;

.field private loadRequestsFromCache:Z

.field private mAdmin:Z

.field private mRequestsAdded:Z

.field private mSelectedUsers:[I

.field private multiselect:Z

.field private mutual:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;"
        }
    .end annotation
.end field

.field private mutualView:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

.field private onlineFriends:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;"
        }
    .end annotation
.end field

.field private onlineFriendsView:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

.field private outRequestsCount:I

.field private outRequestsView:Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;

.field private receiver:Landroid/content/BroadcastReceiver;

.field private requestUsers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/RequestUserProfile;",
            ">;"
        }
    .end annotation
.end field

.field private searchEnabled:Z

.field private searchView:Lcom/vkontakte/android/ui/SearchViewWrapper;

.field private searching:Z

.field private select:Z

.field private suggestUsers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/RequestUserProfile;",
            ">;"
        }
    .end annotation
.end field

.field private suggestsCount:I

.field private suggestsView:Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;

.field private titles:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/CharSequence;",
            ">;"
        }
    .end annotation
.end field

.field private uid:I

.field private updatedByBroadcast:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 219
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/VkTabbedLoaderFragment;-><init>()V

    .line 117
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->mutual:Ljava/util/ArrayList;

    .line 118
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->allFriends:Ljava/util/ArrayList;

    .line 119
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->onlineFriends:Ljava/util/ArrayList;

    .line 120
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->folders:Ljava/util/ArrayList;

    .line 121
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->titles:Ljava/util/ArrayList;

    .line 122
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->fragments:Ljava/util/ArrayList;

    .line 123
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->requestUsers:Ljava/util/List;

    .line 124
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->suggestUsers:Ljava/util/List;

    .line 125
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->uid:I

    .line 126
    invoke-static {}, Lcom/vkontakte/android/LongPollService;->getNumFriendSuggestions()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->suggestsCount:I

    .line 130
    const/4 v0, -0x1

    iput v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->currentMode:I

    .line 138
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->loadRequestsFromCache:Z

    .line 147
    new-instance v0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$1;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/friends/FriendsFragment$1;-><init>(Lcom/vkontakte/android/fragments/friends/FriendsFragment;)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->receiver:Landroid/content/BroadcastReceiver;

    .line 220
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->setTabsAutoLoad(Z)V

    .line 221
    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/fragments/friends/FriendsFragment;)I
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    .prologue
    .line 48
    iget v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->uid:I

    return v0
.end method

.method static synthetic access$100(Lcom/vkontakte/android/fragments/friends/FriendsFragment;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    .prologue
    .line 48
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->disable_spinner:Z

    return v0
.end method

.method static synthetic access$1000(Lcom/vkontakte/android/fragments/friends/FriendsFragment;I)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/friends/FriendsFragment;
    .param p1, "x1"    # I

    .prologue
    .line 48
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->updateTabs(I)V

    return-void
.end method

.method static synthetic access$1100(Lcom/vkontakte/android/fragments/friends/FriendsFragment;)I
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    .prologue
    .line 48
    iget v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->outRequestsCount:I

    return v0
.end method

.method static synthetic access$1102(Lcom/vkontakte/android/fragments/friends/FriendsFragment;I)I
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/friends/FriendsFragment;
    .param p1, "x1"    # I

    .prologue
    .line 48
    iput p1, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->outRequestsCount:I

    return p1
.end method

.method static synthetic access$1200(Lcom/vkontakte/android/fragments/friends/FriendsFragment;)I
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    .prologue
    .line 48
    iget v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->suggestsCount:I

    return v0
.end method

.method static synthetic access$1202(Lcom/vkontakte/android/fragments/friends/FriendsFragment;I)I
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/friends/FriendsFragment;
    .param p1, "x1"    # I

    .prologue
    .line 48
    iput p1, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->suggestsCount:I

    return p1
.end method

.method static synthetic access$1300(Lcom/vkontakte/android/fragments/friends/FriendsFragment;)Lcom/vkontakte/android/fragments/friends/FriendsListFragment;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    .prologue
    .line 48
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->allFriendsView:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    return-object v0
.end method

.method static synthetic access$1400(Lcom/vkontakte/android/fragments/friends/FriendsFragment;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    .prologue
    .line 48
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->multiselect:Z

    return v0
.end method

.method static synthetic access$1500(Lcom/vkontakte/android/fragments/friends/FriendsFragment;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    .prologue
    .line 48
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->select:Z

    return v0
.end method

.method static synthetic access$1600(Lcom/vkontakte/android/fragments/friends/FriendsFragment;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    .prologue
    .line 48
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->requestUsers:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$1700(Lcom/vkontakte/android/fragments/friends/FriendsFragment;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    .prologue
    .line 48
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->suggestUsers:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$1800(Lcom/vkontakte/android/fragments/friends/FriendsFragment;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    .prologue
    .line 48
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->searching:Z

    return v0
.end method

.method static synthetic access$1802(Lcom/vkontakte/android/fragments/friends/FriendsFragment;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/friends/FriendsFragment;
    .param p1, "x1"    # Z

    .prologue
    .line 48
    iput-boolean p1, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->searching:Z

    return p1
.end method

.method static synthetic access$1900(Lcom/vkontakte/android/fragments/friends/FriendsFragment;)Lcom/vkontakte/android/fragments/friends/FriendsListFragment;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    .prologue
    .line 48
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->getCurrentFragment()Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$200(Lcom/vkontakte/android/fragments/friends/FriendsFragment;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    .prologue
    .line 48
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->loadRequestsFromCache:Z

    return v0
.end method

.method static synthetic access$2000(Lcom/vkontakte/android/fragments/friends/FriendsFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    .prologue
    .line 48
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->mutual:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$202(Lcom/vkontakte/android/fragments/friends/FriendsFragment;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/friends/FriendsFragment;
    .param p1, "x1"    # Z

    .prologue
    .line 48
    iput-boolean p1, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->loadRequestsFromCache:Z

    return p1
.end method

.method static synthetic access$2100(Lcom/vkontakte/android/fragments/friends/FriendsFragment;)Lcom/vkontakte/android/fragments/friends/FriendsListFragment;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    .prologue
    .line 48
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->mutualView:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    return-object v0
.end method

.method static synthetic access$2200(Lcom/vkontakte/android/fragments/friends/FriendsFragment;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    .prologue
    .line 48
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->errorView:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$2300(Lcom/vkontakte/android/fragments/friends/FriendsFragment;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    .prologue
    .line 48
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->progress:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$2402(Lcom/vkontakte/android/fragments/friends/FriendsFragment;Lme/grishka/appkit/api/APIRequest;)Lme/grishka/appkit/api/APIRequest;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/friends/FriendsFragment;
    .param p1, "x1"    # Lme/grishka/appkit/api/APIRequest;

    .prologue
    .line 48
    iput-object p1, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->currentRequest:Lme/grishka/appkit/api/APIRequest;

    return-object p1
.end method

.method static synthetic access$2500(Lcom/vkontakte/android/fragments/friends/FriendsFragment;I)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/friends/FriendsFragment;
    .param p1, "x1"    # I

    .prologue
    .line 48
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->selectSpinnerGroup(I)V

    return-void
.end method

.method static synthetic access$2602(Lcom/vkontakte/android/fragments/friends/FriendsFragment;Lme/grishka/appkit/api/APIRequest;)Lme/grishka/appkit/api/APIRequest;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/friends/FriendsFragment;
    .param p1, "x1"    # Lme/grishka/appkit/api/APIRequest;

    .prologue
    .line 48
    iput-object p1, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->currentRequest:Lme/grishka/appkit/api/APIRequest;

    return-object p1
.end method

.method static synthetic access$2700(Lcom/vkontakte/android/fragments/friends/FriendsFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    .prologue
    .line 48
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->fragments:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$2800(Lcom/vkontakte/android/fragments/friends/FriendsFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    .prologue
    .line 48
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->titles:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$302(Lcom/vkontakte/android/fragments/friends/FriendsFragment;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/friends/FriendsFragment;
    .param p1, "x1"    # Z

    .prologue
    .line 48
    iput-boolean p1, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->updatedByBroadcast:Z

    return p1
.end method

.method static synthetic access$400(Lcom/vkontakte/android/fragments/friends/FriendsFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    .prologue
    .line 48
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->allFriends:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$500(Lcom/vkontakte/android/fragments/friends/FriendsFragment;Ljava/util/List;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/friends/FriendsFragment;
    .param p1, "x1"    # Ljava/util/List;
    .param p2, "x2"    # Z

    .prologue
    .line 48
    invoke-direct {p0, p1, p2}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->loadRequestUsers(Ljava/util/List;Z)V

    return-void
.end method

.method static synthetic access$600(Lcom/vkontakte/android/fragments/friends/FriendsFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    .prologue
    .line 48
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->updateSpinner()V

    return-void
.end method

.method static synthetic access$700(Lcom/vkontakte/android/fragments/friends/FriendsFragment;)I
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    .prologue
    .line 48
    iget v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->currentPosition:I

    return v0
.end method

.method static synthetic access$800(Lcom/vkontakte/android/fragments/friends/FriendsFragment;)I
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    .prologue
    .line 48
    iget v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->currentMode:I

    return v0
.end method

.method static synthetic access$900(Lcom/vkontakte/android/fragments/friends/FriendsFragment;)I
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    .prologue
    .line 48
    iget v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->inRequestsCount:I

    return v0
.end method

.method static synthetic access$902(Lcom/vkontakte/android/fragments/friends/FriendsFragment;I)I
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/friends/FriendsFragment;
    .param p1, "x1"    # I

    .prologue
    .line 48
    iput p1, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->inRequestsCount:I

    return p1
.end method

.method static synthetic access$lambda$0(Lcom/vkontakte/android/fragments/friends/FriendsFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->updateData()V

    return-void
.end method

.method private static createSystemFolders(Landroid/content/Context;)Ljava/util/List;
    .locals 5
    .param p0, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/data/Friends$Folder;",
            ">;"
        }
    .end annotation

    .prologue
    .line 729
    new-instance v0, Lcom/vkontakte/android/data/Friends$Folder;

    invoke-direct {v0}, Lcom/vkontakte/android/data/Friends$Folder;-><init>()V

    .line 730
    .local v0, "all":Lcom/vkontakte/android/data/Friends$Folder;
    const/4 v4, 0x0

    iput v4, v0, Lcom/vkontakte/android/data/Friends$Folder;->id:I

    .line 731
    const v4, 0x7f08023b

    invoke-virtual {p0, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v0, Lcom/vkontakte/android/data/Friends$Folder;->name:Ljava/lang/String;

    .line 732
    new-instance v1, Lcom/vkontakte/android/data/Friends$Folder;

    invoke-direct {v1}, Lcom/vkontakte/android/data/Friends$Folder;-><init>()V

    .line 733
    .local v1, "birthday":Lcom/vkontakte/android/data/Friends$Folder;
    const/4 v4, 0x1

    iput v4, v1, Lcom/vkontakte/android/data/Friends$Folder;->id:I

    .line 734
    const v4, 0x7f080111

    invoke-virtual {p0, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v1, Lcom/vkontakte/android/data/Friends$Folder;->name:Ljava/lang/String;

    .line 735
    new-instance v2, Lcom/vkontakte/android/data/Friends$Folder;

    invoke-direct {v2}, Lcom/vkontakte/android/data/Friends$Folder;-><init>()V

    .line 736
    .local v2, "requests":Lcom/vkontakte/android/data/Friends$Folder;
    const/4 v4, 0x2

    iput v4, v2, Lcom/vkontakte/android/data/Friends$Folder;->id:I

    .line 737
    const v4, 0x7f08022b

    invoke-virtual {p0, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v2, Lcom/vkontakte/android/data/Friends$Folder;->name:Ljava/lang/String;

    .line 739
    new-instance v3, Ljava/util/ArrayList;

    const/4 v4, 0x3

    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(I)V

    .line 740
    .local v3, "result":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/data/Friends$Folder;>;"
    invoke-interface {v3, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 741
    invoke-interface {v3, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 742
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 743
    return-object v3
.end method

.method private getCurrentFragment()Lcom/vkontakte/android/fragments/friends/FriendsListFragment;
    .locals 2

    .prologue
    .line 698
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->getPagerCurrentItem()I

    move-result v1

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->getTabAt(I)Landroid/app/Fragment;

    move-result-object v0

    .line 699
    .local v0, "fragment":Landroid/app/Fragment;
    instance-of v1, v0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    if-eqz v1, :cond_0

    .line 700
    check-cast v0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    .line 702
    .end local v0    # "fragment":Landroid/app/Fragment;
    :goto_0
    return-object v0

    .restart local v0    # "fragment":Landroid/app/Fragment;
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private getTabTitle(III)Ljava/lang/String;
    .locals 4
    .param p1, "value"    # I
    .param p2, "titleZeroResId"    # I
    .param p3, "titleResId"    # I

    .prologue
    .line 544
    if-nez p1, :cond_0

    .line 545
    invoke-virtual {p0, p2}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 547
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-virtual {v0, p3, p1, v1}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method private hideFloatingActionButton(Z)V
    .locals 3
    .param p1, "animated"    # Z

    .prologue
    .line 718
    iget-object v1, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->fActionButton:Landroid/support/design/widget/FloatingActionButton;

    invoke-virtual {v1}, Landroid/support/design/widget/FloatingActionButton;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;

    .line 719
    .local v0, "params":Landroid/support/design/widget/CoordinatorLayout$LayoutParams;
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->setBehavior(Landroid/support/design/widget/CoordinatorLayout$Behavior;)V

    .line 720
    iget-object v1, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->fActionButton:Landroid/support/design/widget/FloatingActionButton;

    invoke-virtual {v1}, Landroid/support/design/widget/FloatingActionButton;->requestLayout()V

    .line 721
    if-eqz p1, :cond_0

    .line 722
    iget-object v1, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->fActionButton:Landroid/support/design/widget/FloatingActionButton;

    invoke-virtual {v1}, Landroid/support/design/widget/FloatingActionButton;->hide()V

    .line 726
    :goto_0
    return-void

    .line 724
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->fActionButton:Landroid/support/design/widget/FloatingActionButton;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/support/design/widget/FloatingActionButton;->setVisibility(I)V

    goto :goto_0
.end method

.method private initTabs(IIIIZ)V
    .locals 6
    .param p1, "fTab"    # I
    .param p2, "sTab"    # I
    .param p3, "tTab"    # I
    .param p4, "mode"    # I
    .param p5, "selectFirstPage"    # Z

    .prologue
    const/4 v5, 0x0

    .line 452
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->titles:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 453
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->fragments:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 454
    packed-switch p4, :pswitch_data_0

    .line 487
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->fragments:Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->titles:Ljava/util/ArrayList;

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->setTabs(Ljava/util/List;Ljava/util/List;)V

    .line 488
    if-eqz p5, :cond_1

    .line 489
    invoke-virtual {p0, v5}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->setPagerCurrentItem(I)V

    .line 491
    :cond_1
    return-void

    .line 456
    :pswitch_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->titles:Ljava/util/ArrayList;

    const v1, 0x7f08023b

    const v2, 0x7f0d000d

    invoke-direct {p0, p1, v1, v2}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->getTabTitle(III)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 457
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->fragments:Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->allFriendsView:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 458
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->onlineFriendsView:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    if-eqz v0, :cond_2

    .line 459
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->titles:Ljava/util/ArrayList;

    const v1, 0x7f080243

    const v2, 0x7f0d000e

    invoke-direct {p0, p2, v1, v2}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->getTabTitle(III)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 460
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->fragments:Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->onlineFriendsView:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 462
    :cond_2
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->mutualView:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->uid:I

    invoke-static {v0}, Lcom/vkontakte/android/auth/VKAccountManager;->isCurrentUser(I)Z

    move-result v0

    if-nez v0, :cond_0

    .line 463
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->titles:Ljava/util/ArrayList;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0d000c

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v5

    invoke-virtual {v1, v2, p3, v3}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 464
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->fragments:Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->mutualView:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 468
    :pswitch_1
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->fragments:Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->birthdaysFragment:Lcom/vkontakte/android/fragments/gifts/BirthdaysFragment;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 469
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->titles:Ljava/util/ArrayList;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f080111

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 472
    :pswitch_2
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->fragments:Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->inRequestsView:Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 473
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->fragments:Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->outRequestsView:Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 474
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->titles:Ljava/util/ArrayList;

    const v1, 0x7f080248

    const v2, 0x7f0d0010

    invoke-direct {p0, p1, v1, v2}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->getTabTitle(III)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 475
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->titles:Ljava/util/ArrayList;

    const v1, 0x7f080249

    const v2, 0x7f0d0011

    invoke-direct {p0, p2, v1, v2}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->getTabTitle(III)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 476
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->inRequestsView:Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;->setCounter(I)V

    .line 477
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->outRequestsView:Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;

    invoke-virtual {v0, p2}, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;->setCounter(I)V

    .line 478
    iget v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->suggestsCount:I

    if-lez v0, :cond_0

    .line 479
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->fragments:Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->suggestsView:Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 480
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->titles:Ljava/util/ArrayList;

    const v1, 0x7f08024a

    const v2, 0x7f0d0012

    invoke-direct {p0, p3, v1, v2}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->getTabTitle(III)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 481
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->suggestsView:Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;

    invoke-virtual {v0, p3}, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;->setCounter(I)V

    goto/16 :goto_0

    .line 454
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method private loadRequestUsers(Ljava/util/List;Z)V
    .locals 6
    .param p2, "suggests"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;Z)V"
        }
    .end annotation

    .prologue
    .local p1, "friends":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/UserProfile;>;"
    const/4 v1, 0x0

    .line 624
    new-instance v0, Lcom/vkontakte/android/api/friends/FriendsGetRequests;

    const/16 v2, 0xa

    iget-boolean v5, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->loadRequestsFromCache:Z

    move v3, p2

    move v4, v1

    invoke-direct/range {v0 .. v5}, Lcom/vkontakte/android/api/friends/FriendsGetRequests;-><init>(IIZZZ)V

    new-instance v1, Lcom/vkontakte/android/fragments/friends/FriendsFragment$4;

    invoke-direct {v1, p0, p2, p1}, Lcom/vkontakte/android/fragments/friends/FriendsFragment$4;-><init>(Lcom/vkontakte/android/fragments/friends/FriendsFragment;ZLjava/util/List;)V

    .line 625
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/friends/FriendsGetRequests;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 656
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->currentRequest:Lme/grishka/appkit/api/APIRequest;

    .line 657
    return-void
.end method

.method private scrollTop(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;)V
    .locals 0
    .param p1, "fragment"    # Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    .prologue
    .line 692
    if-eqz p1, :cond_0

    .line 693
    invoke-virtual {p1}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->scrollToTop()V

    .line 695
    :cond_0
    return-void
.end method

.method private selectSpinnerGroup(I)V
    .locals 9
    .param p1, "position"    # I

    .prologue
    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 408
    iput-boolean v7, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->updatedByBroadcast:Z

    .line 409
    iget-object v6, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->folders:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-le v6, p1, :cond_1

    if-ltz p1, :cond_1

    iget-object v6, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->folders:Ljava/util/ArrayList;

    invoke-virtual {v6, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/vkontakte/android/data/Friends$Folder;

    iget v0, v6, Lcom/vkontakte/android/data/Friends$Folder;->id:I

    .line 410
    .local v0, "currentId":I
    :goto_0
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 411
    .local v5, "users":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/UserProfile;>;"
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 412
    .local v3, "online":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/UserProfile;>;"
    shl-int v2, v8, v0

    .line 413
    .local v2, "listBit":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    iget-object v6, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->allFriends:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-ge v1, v6, :cond_2

    .line 414
    iget-object v6, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->allFriends:Ljava/util/ArrayList;

    invoke-virtual {v6, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vkontakte/android/UserProfile;

    .line 415
    .local v4, "p":Lcom/vkontakte/android/UserProfile;
    iget v6, v4, Lcom/vkontakte/android/UserProfile;->country:I

    and-int/2addr v6, v2

    if-lez v6, :cond_0

    .line 416
    invoke-interface {v5, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 417
    iget v6, v4, Lcom/vkontakte/android/UserProfile;->online:I

    if-eqz v6, :cond_0

    .line 418
    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 413
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .end local v0    # "currentId":I
    .end local v1    # "i":I
    .end local v2    # "listBit":I
    .end local v3    # "online":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/UserProfile;>;"
    .end local v4    # "p":Lcom/vkontakte/android/UserProfile;
    .end local v5    # "users":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/UserProfile;>;"
    :cond_1
    move v0, v7

    .line 409
    goto :goto_0

    .line 422
    .restart local v0    # "currentId":I
    .restart local v1    # "i":I
    .restart local v2    # "listBit":I
    .restart local v3    # "online":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/UserProfile;>;"
    .restart local v5    # "users":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/UserProfile;>;"
    :cond_2
    iget-object v6, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->allFriendsView:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    invoke-virtual {v6, v5, v8, v7}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->setData(Ljava/util/List;ZZ)V

    .line 423
    iget-object v6, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->onlineFriendsView:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    if-eqz v6, :cond_3

    .line 424
    iget-object v6, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->onlineFriendsView:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    invoke-virtual {v6, v3, v7, v7}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->setData(Ljava/util/List;ZZ)V

    .line 426
    :cond_3
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v6

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v8

    invoke-direct {p0, v6, v8, v7, v7}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->updateTabs(IIII)V

    .line 427
    return-void
.end method

.method private showFloatingActionButton(Z)V
    .locals 3
    .param p1, "animated"    # Z

    .prologue
    .line 707
    iget-object v1, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->fActionButton:Landroid/support/design/widget/FloatingActionButton;

    invoke-virtual {v1}, Landroid/support/design/widget/FloatingActionButton;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;

    .line 708
    .local v0, "params":Landroid/support/design/widget/CoordinatorLayout$LayoutParams;
    new-instance v1, Lcom/vkontakte/android/ui/widget/ScrollAwareFABBehavior;

    invoke-direct {v1}, Lcom/vkontakte/android/ui/widget/ScrollAwareFABBehavior;-><init>()V

    invoke-virtual {v0, v1}, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->setBehavior(Landroid/support/design/widget/CoordinatorLayout$Behavior;)V

    .line 709
    iget-object v1, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->fActionButton:Landroid/support/design/widget/FloatingActionButton;

    invoke-virtual {v1}, Landroid/support/design/widget/FloatingActionButton;->requestLayout()V

    .line 710
    if-eqz p1, :cond_0

    .line 711
    iget-object v1, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->fActionButton:Landroid/support/design/widget/FloatingActionButton;

    invoke-virtual {v1}, Landroid/support/design/widget/FloatingActionButton;->show()V

    .line 715
    :goto_0
    return-void

    .line 713
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->fActionButton:Landroid/support/design/widget/FloatingActionButton;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/support/design/widget/FloatingActionButton;->setVisibility(I)V

    goto :goto_0
.end method

.method private updateData()V
    .locals 3

    .prologue
    .line 610
    iget-object v1, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->allFriends:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    .line 611
    iget-object v1, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->allFriends:Ljava/util/ArrayList;

    invoke-static {v1}, Lcom/vkontakte/android/data/Friends;->getFriends(Ljava/util/ArrayList;)V

    .line 612
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->allFriends:Ljava/util/ArrayList;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 613
    .local v0, "friends":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/UserProfile;>;"
    iget-boolean v1, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->multiselect:Z

    if-nez v1, :cond_1

    iget-boolean v1, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->select:Z

    if-nez v1, :cond_1

    .line 614
    iget-boolean v1, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->loadRequestsFromCache:Z

    if-nez v1, :cond_0

    .line 615
    iget-object v1, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->requestUsers:Ljava/util/List;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->suggestUsers:Ljava/util/List;

    invoke-virtual {p0, v0, v1, v2}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->setData(Ljava/util/List;Ljava/util/List;Ljava/util/List;)V

    .line 617
    :cond_0
    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->loadRequestUsers(Ljava/util/List;Z)V

    .line 621
    :goto_0
    return-void

    .line 619
    :cond_1
    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->setData(Ljava/util/List;)V

    goto :goto_0
.end method

.method private updateSpinner()V
    .locals 4

    .prologue
    .line 679
    iget-object v2, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->folders:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v1

    .line 680
    .local v1, "lastFoldersCount":I
    iget-object v2, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->folders:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V

    .line 681
    iget-object v2, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->titles:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V

    .line 682
    iget-object v2, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->folders:Ljava/util/ArrayList;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->createSystemFolders(Landroid/content/Context;)Ljava/util/List;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 683
    iget-object v2, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->folders:Ljava/util/ArrayList;

    invoke-static {v2}, Lcom/vkontakte/android/data/Friends;->getLists(Ljava/util/List;)V

    .line 684
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v2, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->folders:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v0, v2, :cond_0

    .line 685
    iget-object v3, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->titles:Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->folders:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/data/Friends$Folder;

    iget-object v2, v2, Lcom/vkontakte/android/data/Friends$Folder;->name:Ljava/lang/String;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 684
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 687
    :cond_0
    iget-object v2, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->titles:Ljava/util/ArrayList;

    invoke-virtual {p0, v2}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->setSpinnerItems(Ljava/util/List;)V

    .line 688
    iget-object v2, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->folders:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ne v2, v1, :cond_1

    iget v2, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->currentPosition:I

    :goto_1
    invoke-virtual {p0, v2}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->setSelectedNavigationItem(I)V

    .line 689
    return-void

    .line 688
    :cond_1
    const/4 v2, 0x0

    goto :goto_1
.end method

.method private updateTabs(I)V
    .locals 3
    .param p1, "mode"    # I

    .prologue
    .line 494
    packed-switch p1, :pswitch_data_0

    .line 504
    :goto_0
    :pswitch_0
    return-void

    .line 496
    :pswitch_1
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->allFriends:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->onlineFriends:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x0

    invoke-direct {p0, v0, v1, v2, p1}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->updateTabs(IIII)V

    goto :goto_0

    .line 499
    :pswitch_2
    iget v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->inRequestsCount:I

    iget v1, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->outRequestsCount:I

    iget v2, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->suggestsCount:I

    invoke-direct {p0, v0, v1, v2, p1}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->updateTabs(IIII)V

    goto :goto_0

    .line 494
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method private updateTabs(IIII)V
    .locals 8
    .param p1, "fTab"    # I
    .param p2, "sTab"    # I
    .param p3, "tTab"    # I
    .param p4, "mode"    # I

    .prologue
    const/4 v4, 0x2

    const/4 v7, 0x1

    const/4 v5, 0x0

    .line 507
    iget v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->currentMode:I

    if-ne v0, p4, :cond_5

    .line 508
    packed-switch p4, :pswitch_data_0

    .line 541
    :cond_0
    :goto_0
    :pswitch_0
    return-void

    .line 510
    :pswitch_1
    const v0, 0x7f08023b

    const v1, 0x7f0d000d

    invoke-direct {p0, p1, v0, v1}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->getTabTitle(III)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v5, v0}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->setTabTitle(ILjava/lang/CharSequence;)V

    .line 511
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->allFriendsView:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    iget v1, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->inRequestsCount:I

    iget v2, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->suggestsCount:I

    add-int/2addr v1, v2

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->setTotalRequests(I)V

    .line 512
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->onlineFriendsView:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    if-eqz v0, :cond_1

    .line 513
    const v0, 0x7f080243

    const v1, 0x7f0d000e

    invoke-direct {p0, p2, v0, v1}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->getTabTitle(III)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v7, v0}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->setTabTitle(ILjava/lang/CharSequence;)V

    .line 515
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->mutualView:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->uid:I

    invoke-static {v0}, Lcom/vkontakte/android/auth/VKAccountManager;->isCurrentUser(I)Z

    move-result v0

    if-nez v0, :cond_0

    .line 516
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->mutual:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v6

    .line 517
    .local v6, "mutual":I
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0d000c

    new-array v2, v7, [Ljava/lang/Object;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v5

    invoke-virtual {v0, v1, v6, v2}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v4, v0}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->setTabTitle(ILjava/lang/CharSequence;)V

    goto :goto_0

    .line 521
    .end local v6    # "mutual":I
    :pswitch_2
    if-nez p3, :cond_2

    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->suggestsView:Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;

    if-nez v0, :cond_3

    :cond_2
    if-lez p3, :cond_4

    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->suggestsView:Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;

    if-nez v0, :cond_4

    .line 522
    :cond_3
    iget v1, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->inRequestsCount:I

    iget v2, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->outRequestsCount:I

    iget v3, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->suggestsCount:I

    move-object v0, p0

    move v4, p4

    invoke-direct/range {v0 .. v5}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->initTabs(IIIIZ)V

    goto :goto_0

    .line 524
    :cond_4
    const v0, 0x7f080248

    const v1, 0x7f0d0010

    invoke-direct {p0, p1, v0, v1}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->getTabTitle(III)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v5, v0}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->setTabTitle(ILjava/lang/CharSequence;)V

    .line 525
    const v0, 0x7f080249

    const v1, 0x7f0d0011

    invoke-direct {p0, p2, v0, v1}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->getTabTitle(III)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v7, v0}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->setTabTitle(ILjava/lang/CharSequence;)V

    .line 526
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->inRequestsView:Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;->setCounter(I)V

    .line 527
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->outRequestsView:Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;

    invoke-virtual {v0, p2}, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;->setCounter(I)V

    .line 528
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->suggestsView:Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;

    if-eqz v0, :cond_0

    .line 529
    const v0, 0x7f08024a

    const v1, 0x7f0d0012

    invoke-direct {p0, p3, v0, v1}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->getTabTitle(III)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v4, v0}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->setTabTitle(ILjava/lang/CharSequence;)V

    .line 530
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->suggestsView:Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;

    invoke-virtual {v0, p3}, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;->setCounter(I)V

    goto/16 :goto_0

    :cond_5
    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, v7

    .line 538
    invoke-direct/range {v0 .. v5}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->initTabs(IIIIZ)V

    .line 539
    iput p4, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->currentMode:I

    goto/16 :goto_0

    .line 508
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method


# virtual methods
.method public createPagerAdapter()Landroid/support/v4/view/PagerAdapter;
    .locals 1

    .prologue
    .line 675
    new-instance v0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$TabAdapter;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/friends/FriendsFragment$TabAdapter;-><init>(Lcom/vkontakte/android/fragments/friends/FriendsFragment;)V

    return-object v0
.end method

.method protected doLoadData()V
    .locals 5

    .prologue
    .line 577
    iget v2, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->uid:I

    invoke-static {v2}, Lcom/vkontakte/android/auth/VKAccountManager;->isCurrentUser(I)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 578
    const-wide/16 v0, 0x0

    .line 579
    .local v0, "when":J
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v2

    const-string/jumbo v3, "_from_menu"

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->allFriends:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-nez v2, :cond_0

    .line 580
    const-wide/16 v0, 0xb4

    .line 582
    :cond_0
    invoke-static {p0}, Lcom/vkontakte/android/fragments/friends/FriendsFragment$$Lambda$5;->lambdaFactory$(Lcom/vkontakte/android/fragments/friends/FriendsFragment;)Ljava/lang/Runnable;

    move-result-object v2

    invoke-static {v2, v0, v1}, Lcom/vkontakte/android/functions/Functions;->postDelayed(Ljava/lang/Runnable;J)V

    .line 607
    .end local v0    # "when":J
    :goto_0
    return-void

    .line 584
    :cond_1
    new-instance v2, Lcom/vkontakte/android/api/friends/FriendsGet;

    iget v3, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->uid:I

    const/4 v4, 0x1

    invoke-direct {v2, v3, v4}, Lcom/vkontakte/android/api/friends/FriendsGet;-><init>(IZ)V

    new-instance v3, Lcom/vkontakte/android/fragments/friends/FriendsFragment$3;

    invoke-direct {v3, p0}, Lcom/vkontakte/android/fragments/friends/FriendsFragment$3;-><init>(Lcom/vkontakte/android/fragments/friends/FriendsFragment;)V

    .line 585
    invoke-virtual {v2, v3}, Lcom/vkontakte/android/api/friends/FriendsGet;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v2

    iget-object v3, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->contentView:Landroid/view/ViewGroup;

    .line 605
    invoke-virtual {v2, v3}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/view/View;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v2

    iput-object v2, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->currentRequest:Lme/grishka/appkit/api/APIRequest;

    goto :goto_0
.end method

.method public hasNavigationDrawer()Z
    .locals 1

    .prologue
    .line 372
    const/4 v0, 0x1

    return v0
.end method

.method synthetic lambda$onViewCreated$0(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 261
    const-class v0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;

    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/vkontakte/android/navigation/Navigate;->to(Ljava/lang/Class;Landroid/os/Bundle;Landroid/content/Context;)V

    return-void
.end method

.method synthetic lambda$onViewCreated$1(Z)V
    .locals 1
    .param p1, "expanded"    # Z

    .prologue
    .line 334
    if-eqz p1, :cond_0

    .line 335
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->hideFloatingActionButton(Z)V

    .line 339
    :goto_0
    return-void

    .line 337
    :cond_0
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->showFloatingActionButton(Z)V

    goto :goto_0
.end method

.method synthetic lambda$onViewCreated$2(Lcom/vkontakte/android/UserProfile;)V
    .locals 3
    .param p1, "user"    # Lcom/vkontakte/android/UserProfile;

    .prologue
    .line 345
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 346
    .local v0, "result":Landroid/content/Intent;
    const-string/jumbo v1, "uid"

    iget v2, p1, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 347
    const-string/jumbo v1, "name"

    iget-object v2, p1, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 348
    const-string/jumbo v1, "photo"

    iget-object v2, p1, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 349
    const-string/jumbo v1, "user"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 350
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const/4 v2, -0x1

    invoke-virtual {v1, v2, v0}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 351
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->finish()V

    .line 352
    return-void
.end method

.method synthetic lambda$onViewCreated$3(Ljava/util/ArrayList;)V
    .locals 3
    .param p1, "users"    # Ljava/util/ArrayList;

    .prologue
    .line 360
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 361
    .local v0, "result":Landroid/content/Intent;
    const-string/jumbo v1, "result"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putParcelableArrayListExtra(Ljava/lang/String;Ljava/util/ArrayList;)Landroid/content/Intent;

    .line 362
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const/4 v2, -0x1

    invoke-virtual {v1, v2, v0}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 363
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->finish()V

    .line 364
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 5
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v1, 0x1

    .line 225
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/VkTabbedLoaderFragment;->onCreate(Landroid/os/Bundle;)V

    .line 226
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v2

    const-string/jumbo v3, "select"

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v2

    iput-boolean v2, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->select:Z

    .line 227
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v2

    const-string/jumbo v3, "multiselect"

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v2

    iput-boolean v2, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->multiselect:Z

    .line 228
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v2

    const-string/jumbo v3, "global_search"

    invoke-virtual {v2, v3, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    iput-boolean v2, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->global_search:Z

    .line 229
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v2

    const-string/jumbo v3, "search_enabled"

    invoke-virtual {v2, v3, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    iput-boolean v2, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->searchEnabled:Z

    .line 230
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v2

    const-string/jumbo v3, "disable_spinner"

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v2

    iput-boolean v2, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->disable_spinner:Z

    .line 231
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v2

    const-string/jumbo v3, "uid"

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v4

    invoke-virtual {v4}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v4

    invoke-virtual {v2, v3, v4}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v2

    iput v2, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->uid:I

    .line 232
    iget v2, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->uid:I

    if-eqz v2, :cond_0

    iget v2, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->uid:I

    invoke-static {v2}, Lcom/vkontakte/android/auth/VKAccountManager;->isCurrentUser(I)Z

    move-result v2

    if-eqz v2, :cond_3

    :cond_0
    :goto_0
    iput-boolean v1, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->mAdmin:Z

    .line 233
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    const-string/jumbo v2, "selectedUsers"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getIntArray(Ljava/lang/String;)[I

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->mSelectedUsers:[I

    .line 234
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "friends?id="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->uid:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/vkontakte/android/ActivityUtils;->setBeamLink(Landroid/app/Activity;Ljava/lang/String;)V

    .line 235
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    const-string/jumbo v2, "title"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 236
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    const-string/jumbo v2, "title"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getCharSequence(Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->setTitle(Ljava/lang/CharSequence;)V

    .line 240
    :goto_1
    iget v1, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->uid:I

    if-eqz v1, :cond_1

    iget v1, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->uid:I

    invoke-static {v1}, Lcom/vkontakte/android/auth/VKAccountManager;->isCurrentUser(I)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 241
    :cond_1
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 242
    .local v0, "filter":Landroid/content/IntentFilter;
    const-string/jumbo v1, "com.vkontakte.android.FRIEND_LIST_CHANGED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 243
    const-string/jumbo v1, "com.vkontakte.android.FRIEND_COUNTER_CHANGED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 244
    const-string/jumbo v1, "com.vkontakte.android.FRIEND_REQUESTS_CHANGED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 245
    const-string/jumbo v1, "com.vkontakte.android.REQUESTS_UPDATED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 246
    sget-object v1, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->receiver:Landroid/content/BroadcastReceiver;

    const-string/jumbo v3, "com.vkontakte.android.permission.ACCESS_DATA"

    const/4 v4, 0x0

    invoke-virtual {v1, v2, v0, v3, v4}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;)Landroid/content/Intent;

    .line 248
    .end local v0    # "filter":Landroid/content/IntentFilter;
    :cond_2
    return-void

    .line 232
    :cond_3
    const/4 v1, 0x0

    goto :goto_0

    .line 238
    :cond_4
    const v1, 0x7f08023b

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->setTitle(I)V

    goto :goto_1
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V
    .locals 6
    .param p1, "menu"    # Landroid/view/Menu;
    .param p2, "inflater"    # Landroid/view/MenuInflater;

    .prologue
    const v5, 0x102000c

    const/4 v4, 0x0

    .line 431
    if-eqz p1, :cond_1

    .line 432
    iget-object v2, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->searchView:Lcom/vkontakte/android/ui/SearchViewWrapper;

    if-eqz v2, :cond_0

    iget-boolean v2, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->searchEnabled:Z

    if-eqz v2, :cond_0

    iget-boolean v2, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->loaded:Z

    if-eqz v2, :cond_0

    invoke-direct {p0}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->getCurrentFragment()Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 433
    iget-object v2, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->searchView:Lcom/vkontakte/android/ui/SearchViewWrapper;

    invoke-virtual {v2, p1}, Lcom/vkontakte/android/ui/SearchViewWrapper;->onCreateOptionsMenu(Landroid/view/Menu;)V

    .line 434
    iget-boolean v2, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->multiselect:Z

    if-eqz v2, :cond_0

    .line 435
    const/4 v2, 0x1

    const v3, 0x7f0801c5

    invoke-interface {p1, v4, v5, v2, v3}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    .line 436
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f020184

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 437
    .local v0, "drawable":Landroid/graphics/drawable/Drawable;
    invoke-interface {p1, v5}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v1

    .line 438
    .local v1, "primaryItem":Landroid/view/MenuItem;
    const/4 v2, 0x2

    invoke-interface {v1, v2}, Landroid/view/MenuItem;->setShowAsAction(I)V

    .line 439
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-interface {v1, v2}, Landroid/view/MenuItem;->setIcon(Landroid/graphics/drawable/Drawable;)Landroid/view/MenuItem;

    .line 440
    invoke-interface {v1}, Landroid/view/MenuItem;->getIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    const/16 v3, 0x64

    invoke-virtual {v2, v3}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 441
    invoke-interface {v1, v4}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    .line 442
    iget-object v2, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->allFriendsView:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    if-eqz v2, :cond_0

    .line 443
    iget-object v2, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->allFriendsView:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    invoke-virtual {v2, v1}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->setPrimaryMenuItem(Landroid/view/MenuItem;)V

    .line 447
    .end local v0    # "drawable":Landroid/graphics/drawable/Drawable;
    .end local v1    # "primaryItem":Landroid/view/MenuItem;
    :cond_0
    invoke-super {p0, p1, p2}, Lcom/vkontakte/android/fragments/VkTabbedLoaderFragment;->onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V

    .line 449
    :cond_1
    return-void
.end method

.method public onDestroy()V
    .locals 2

    .prologue
    .line 661
    invoke-super {p0}, Lcom/vkontakte/android/fragments/VkTabbedLoaderFragment;->onDestroy()V

    .line 663
    :try_start_0
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->receiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 666
    :goto_0
    return-void

    .line 664
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public onPageSelected(I)V
    .locals 1
    .param p1, "pos"    # I

    .prologue
    .line 252
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/vk/core/util/KeyboardUtils;->hideKeyboard(Landroid/content/Context;)V

    .line 253
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->invalidateOptionsMenu()V

    .line 254
    return-void
.end method

.method public onRefresh()V
    .locals 0

    .prologue
    .line 671
    return-void
.end method

.method protected onSpinnerItemSelected(I)Z
    .locals 5
    .param p1, "position"    # I

    .prologue
    const/4 v1, 0x0

    const/4 v4, 0x1

    .line 377
    iget v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->currentPosition:I

    if-eq v0, p1, :cond_0

    .line 378
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->allFriendsView:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    invoke-direct {p0, v0}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->scrollTop(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;)V

    .line 379
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->onlineFriendsView:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    invoke-direct {p0, v0}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->scrollTop(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;)V

    .line 380
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->mutualView:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    invoke-direct {p0, v0}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->scrollTop(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;)V

    .line 382
    :cond_0
    iput p1, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->currentPosition:I

    .line 383
    packed-switch p1, :pswitch_data_0

    .line 402
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->selectSpinnerGroup(I)V

    .line 403
    :cond_1
    :goto_0
    return v4

    .line 385
    :pswitch_0
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->updatedByBroadcast:Z

    if-eqz v0, :cond_2

    .line 386
    iput-boolean v1, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->updatedByBroadcast:Z

    goto :goto_0

    .line 388
    :cond_2
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->doLoadData()V

    goto :goto_0

    .line 392
    :pswitch_1
    iget v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->uid:I

    invoke-static {v0}, Lcom/vkontakte/android/auth/VKAccountManager;->isCurrentUser(I)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->birthdaysFragment:Lcom/vkontakte/android/fragments/gifts/BirthdaysFragment;

    if-eqz v0, :cond_1

    .line 393
    invoke-direct {p0, v1, v1, v1, v4}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->updateTabs(IIII)V

    goto :goto_0

    .line 397
    :pswitch_2
    iget v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->uid:I

    invoke-static {v0}, Lcom/vkontakte/android/auth/VKAccountManager;->isCurrentUser(I)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->inRequestsView:Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->outRequestsView:Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;

    if-eqz v0, :cond_1

    .line 398
    iget v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->inRequestsCount:I

    iget v1, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->outRequestsCount:I

    iget v2, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->suggestsCount:I

    const/4 v3, 0x2

    invoke-direct {p0, v0, v1, v2, v3}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->updateTabs(IIII)V

    goto :goto_0

    .line 383
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 8
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v6, 0x0

    const/4 v5, 0x1

    .line 258
    invoke-super {p0, p1, p2}, Lcom/vkontakte/android/fragments/VkTabbedLoaderFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 259
    iget-boolean v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->mAdmin:Z

    if-eqz v4, :cond_0

    iget-boolean v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->select:Z

    if-nez v4, :cond_0

    iget-boolean v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->multiselect:Z

    if-nez v4, :cond_0

    .line 260
    iget-object v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->contentView:Landroid/view/ViewGroup;

    const v7, 0x7f1001af

    invoke-virtual {v4, v7}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/support/design/widget/FloatingActionButton;

    iput-object v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->fActionButton:Landroid/support/design/widget/FloatingActionButton;

    .line 261
    iget-object v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->fActionButton:Landroid/support/design/widget/FloatingActionButton;

    invoke-static {p0}, Lcom/vkontakte/android/fragments/friends/FriendsFragment$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/fragments/friends/FriendsFragment;)Landroid/view/View$OnClickListener;

    move-result-object v7

    invoke-virtual {v4, v7}, Landroid/support/design/widget/FloatingActionButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 262
    iget-object v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->fActionButton:Landroid/support/design/widget/FloatingActionButton;

    const v7, 0x7f02015f

    invoke-virtual {v4, v7}, Landroid/support/design/widget/FloatingActionButton;->setImageResource(I)V

    .line 263
    invoke-direct {p0, v6}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->showFloatingActionButton(Z)V

    .line 266
    :cond_0
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 267
    .local v1, "bundle":Landroid/os/Bundle;
    const-string/jumbo v4, "uid"

    iget v7, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->uid:I

    invoke-virtual {v1, v4, v7}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 268
    const-string/jumbo v7, "listen_updates"

    iget-boolean v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->select:Z

    if-nez v4, :cond_a

    iget-boolean v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->multiselect:Z

    if-nez v4, :cond_a

    move v4, v5

    :goto_0
    invoke-virtual {v1, v7, v4}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 269
    new-instance v4, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    invoke-direct {v4}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;-><init>()V

    iput-object v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->allFriendsView:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    .line 270
    iget-object v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->allFriendsView:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    invoke-virtual {v4, v1}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->setArguments(Landroid/os/Bundle;)V

    .line 271
    iget-object v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->allFriendsView:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    iget-boolean v7, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->global_search:Z

    invoke-virtual {v4, v7}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->setGlobalSearch(Z)V

    .line 273
    iget-object v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->mSelectedUsers:[I

    if-eqz v4, :cond_1

    .line 274
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 275
    .local v0, "args":Landroid/os/Bundle;
    const-string/jumbo v4, "selectedUsers"

    iget-object v7, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->mSelectedUsers:[I

    invoke-virtual {v0, v4, v7}, Landroid/os/Bundle;->putIntArray(Ljava/lang/String;[I)V

    .line 276
    iget-object v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->allFriendsView:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    invoke-virtual {v4, v0}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->setArguments(Landroid/os/Bundle;)V

    .line 279
    .end local v0    # "args":Landroid/os/Bundle;
    :cond_1
    iget-boolean v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->multiselect:Z

    if-nez v4, :cond_2

    .line 280
    new-instance v4, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    invoke-direct {v4}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;-><init>()V

    iput-object v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->onlineFriendsView:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    .line 281
    iget-object v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->onlineFriendsView:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    iget-boolean v7, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->global_search:Z

    invoke-virtual {v4, v7}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->setGlobalSearch(Z)V

    .line 284
    :cond_2
    iget-boolean v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->select:Z

    if-nez v4, :cond_3

    iget-boolean v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->mAdmin:Z

    if-nez v4, :cond_3

    .line 285
    new-instance v4, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    invoke-direct {v4}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;-><init>()V

    iput-object v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->mutualView:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    .line 288
    :cond_3
    iget v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->uid:I

    invoke-static {v4}, Lcom/vkontakte/android/auth/VKAccountManager;->isCurrentUser(I)Z

    move-result v4

    if-eqz v4, :cond_4

    iget-boolean v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->select:Z

    if-nez v4, :cond_4

    iget-boolean v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->multiselect:Z

    if-nez v4, :cond_4

    .line 289
    new-instance v4, Lcom/vkontakte/android/fragments/gifts/BirthdaysFragment;

    invoke-direct {v4}, Lcom/vkontakte/android/fragments/gifts/BirthdaysFragment;-><init>()V

    iput-object v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->birthdaysFragment:Lcom/vkontakte/android/fragments/gifts/BirthdaysFragment;

    .line 290
    new-instance v4, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;

    invoke-direct {v4}, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;-><init>()V

    iput-object v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->inRequestsView:Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;

    .line 291
    new-instance v4, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;

    invoke-direct {v4}, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;-><init>()V

    iput-object v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->outRequestsView:Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;

    .line 292
    new-instance v4, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;

    invoke-direct {v4}, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;-><init>()V

    iput-object v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->suggestsView:Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;

    .line 293
    new-instance v1, Landroid/os/Bundle;

    .end local v1    # "bundle":Landroid/os/Bundle;
    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 294
    .restart local v1    # "bundle":Landroid/os/Bundle;
    const-string/jumbo v4, "out"

    invoke-virtual {v1, v4, v5}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 295
    iget-object v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->outRequestsView:Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;

    invoke-virtual {v4, v1}, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;->setArguments(Landroid/os/Bundle;)V

    .line 296
    new-instance v1, Landroid/os/Bundle;

    .end local v1    # "bundle":Landroid/os/Bundle;
    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 297
    .restart local v1    # "bundle":Landroid/os/Bundle;
    const-string/jumbo v4, "suggests"

    invoke-virtual {v1, v4, v5}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 298
    iget-object v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->suggestsView:Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;

    invoke-virtual {v4, v1}, Lcom/vkontakte/android/fragments/friends/FriendRequestsFragment;->setArguments(Landroid/os/Bundle;)V

    .line 300
    :cond_4
    iget v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->uid:I

    if-eqz v4, :cond_5

    iget v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->uid:I

    invoke-static {v4}, Lcom/vkontakte/android/auth/VKAccountManager;->isCurrentUser(I)Z

    move-result v4

    if-eqz v4, :cond_b

    :cond_5
    iget-boolean v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->disable_spinner:Z

    if-nez v4, :cond_b

    .line 301
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->updateSpinner()V

    .line 305
    :goto_1
    invoke-direct {p0, v6}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->updateTabs(I)V

    .line 307
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v4

    const-string/jumbo v6, "tab"

    invoke-virtual {v4, v6}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 308
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v4

    const-string/jumbo v6, "tab"

    invoke-virtual {v4, v6}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v4

    invoke-virtual {p0, v4}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->setPagerCurrentItem(I)V

    .line 311
    :cond_6
    new-instance v4, Lcom/vkontakte/android/ui/SearchViewWrapper;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v6

    new-instance v7, Lcom/vkontakte/android/fragments/friends/FriendsFragment$2;

    invoke-direct {v7, p0}, Lcom/vkontakte/android/fragments/friends/FriendsFragment$2;-><init>(Lcom/vkontakte/android/fragments/friends/FriendsFragment;)V

    invoke-direct {v4, v6, v7}, Lcom/vkontakte/android/ui/SearchViewWrapper;-><init>(Landroid/app/Activity;Lcom/vkontakte/android/ui/SearchViewWrapper$SearchListener;)V

    iput-object v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->searchView:Lcom/vkontakte/android/ui/SearchViewWrapper;

    .line 332
    iget-object v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->fActionButton:Landroid/support/design/widget/FloatingActionButton;

    if-eqz v4, :cond_7

    .line 333
    iget-object v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->searchView:Lcom/vkontakte/android/ui/SearchViewWrapper;

    invoke-static {p0}, Lcom/vkontakte/android/fragments/friends/FriendsFragment$$Lambda$2;->lambdaFactory$(Lcom/vkontakte/android/fragments/friends/FriendsFragment;)Lcom/vkontakte/android/ui/SearchViewWrapper$ViewStateListener;

    move-result-object v6

    invoke-virtual {v4, v6}, Lcom/vkontakte/android/ui/SearchViewWrapper;->setStateListener(Lcom/vkontakte/android/ui/SearchViewWrapper$ViewStateListener;)V

    .line 341
    :cond_7
    invoke-virtual {p0, v5}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->setHasOptionsMenu(Z)V

    .line 343
    iget-boolean v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->select:Z

    if-eqz v4, :cond_8

    .line 344
    invoke-static {p0}, Lcom/vkontakte/android/fragments/friends/FriendsFragment$$Lambda$3;->lambdaFactory$(Lcom/vkontakte/android/fragments/friends/FriendsFragment;)Lcom/vkontakte/android/functions/VoidF1;

    move-result-object v2

    .line 353
    .local v2, "listener":Lcom/vkontakte/android/functions/VoidF1;, "Lcom/vkontakte/android/functions/VoidF1<Lcom/vkontakte/android/UserProfile;>;"
    iget-object v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->allFriendsView:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    invoke-virtual {v4, v2}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->setSelectionListener(Lcom/vkontakte/android/functions/VoidF1;)Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    .line 354
    iget-object v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->onlineFriendsView:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    if-eqz v4, :cond_8

    .line 355
    iget-object v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->onlineFriendsView:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    invoke-virtual {v4, v2}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->setSelectionListener(Lcom/vkontakte/android/functions/VoidF1;)Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    .line 358
    .end local v2    # "listener":Lcom/vkontakte/android/functions/VoidF1;, "Lcom/vkontakte/android/functions/VoidF1<Lcom/vkontakte/android/UserProfile;>;"
    :cond_8
    iget-boolean v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->multiselect:Z

    if-eqz v4, :cond_9

    .line 359
    invoke-static {p0}, Lcom/vkontakte/android/fragments/friends/FriendsFragment$$Lambda$4;->lambdaFactory$(Lcom/vkontakte/android/fragments/friends/FriendsFragment;)Lcom/vkontakte/android/functions/VoidF1;

    move-result-object v3

    .line 365
    .local v3, "listener":Lcom/vkontakte/android/functions/VoidF1;, "Lcom/vkontakte/android/functions/VoidF1<Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;>;"
    iget-object v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->allFriendsView:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    invoke-virtual {v4, v3}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->setMultiselectListener(Lcom/vkontakte/android/functions/VoidF1;)V

    .line 366
    iget-object v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->allFriendsView:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    iget-object v5, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->searchView:Lcom/vkontakte/android/ui/SearchViewWrapper;

    invoke-virtual {v4, v5}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->setSearchView(Lcom/vkontakte/android/ui/SearchViewWrapper;)V

    .line 368
    .end local v3    # "listener":Lcom/vkontakte/android/functions/VoidF1;, "Lcom/vkontakte/android/functions/VoidF1<Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;>;"
    :cond_9
    return-void

    :cond_a
    move v4, v6

    .line 268
    goto/16 :goto_0

    .line 303
    :cond_b
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->loadData()V

    goto :goto_1
.end method

.method public setData(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 552
    .local p1, "friends":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/UserProfile;>;"
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v1

    invoke-virtual {p0, p1, v0, v1}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->setData(Ljava/util/List;Ljava/util/List;Ljava/util/List;)V

    .line 553
    return-void
.end method

.method public setData(Ljava/util/List;Ljava/util/List;Ljava/util/List;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/RequestUserProfile;",
            ">;",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/RequestUserProfile;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, "friends":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/UserProfile;>;"
    .local p2, "requests":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/RequestUserProfile;>;"
    .local p3, "suggests":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/RequestUserProfile;>;"
    const/4 v7, 0x0

    .line 556
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->allFriends:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 557
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->onlineFriends:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 559
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->allFriends:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 560
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->allFriends:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/vkontakte/android/UserProfile;

    .line 561
    .local v6, "profile":Lcom/vkontakte/android/UserProfile;
    iget v1, v6, Lcom/vkontakte/android/UserProfile;->online:I

    if-eqz v1, :cond_0

    .line 562
    iget-object v1, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->onlineFriends:Ljava/util/ArrayList;

    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 565
    .end local v6    # "profile":Lcom/vkontakte/android/UserProfile;
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->allFriendsView:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    iget v1, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->inRequestsCount:I

    iget v2, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->suggestsCount:I

    add-int/2addr v1, v2

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->setTotalRequests(I)V

    .line 566
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->allFriendsView:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->allFriends:Ljava/util/ArrayList;

    const/4 v4, 0x1

    iget-boolean v5, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->mAdmin:Z

    move-object v2, p2

    move-object v3, p3

    invoke-virtual/range {v0 .. v5}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->setData(Ljava/util/List;Ljava/util/List;Ljava/util/List;ZZ)V

    .line 567
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->onlineFriendsView:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    if-eqz v0, :cond_2

    .line 568
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->onlineFriendsView:Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->onlineFriends:Ljava/util/ArrayList;

    invoke-virtual {v0, v1, v7, v7}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->setData(Ljava/util/List;ZZ)V

    .line 570
    :cond_2
    invoke-direct {p0, v7}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->updateTabs(I)V

    .line 571
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->dataLoaded()V

    .line 572
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->invalidateOptionsMenu()V

    .line 573
    return-void
.end method
