.class public Lcom/vkontakte/android/fragments/groups/GroupsFragment;
.super Lcom/vkontakte/android/fragments/VkTabbedLoaderFragment;
.source "GroupsFragment.java"


# instance fields
.field private addItem:Landroid/view/MenuItem;

.field private allGroups:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/api/Group;",
            ">;"
        }
    .end annotation
.end field

.field private currentReq:Lcom/vkontakte/android/api/VKAPIRequest;

.field private events:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/api/Group;",
            ">;"
        }
    .end annotation
.end field

.field private eventsView:Lcom/vkontakte/android/fragments/groups/EventsFragment;

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

.field private groupsView:Lcom/vkontakte/android/fragments/groups/AllGroupsFragment;

.field private mHasInvitesTab:Z

.field private mInvitesCount:I

.field private mTabsCreated:Z

.field private receiver:Landroid/content/BroadcastReceiver;

.field private requestsView:Lcom/vkontakte/android/fragments/groups/GroupInvitesFragment;

.field private searchView:Lcom/vkontakte/android/ui/SearchViewWrapper;

.field private searching:Z

.field private select:Z

.field private showAdmined:Z

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


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 53
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/VkTabbedLoaderFragment;-><init>()V

    .line 43
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->uid:I

    .line 44
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->allGroups:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->groups:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->events:Ljava/util/ArrayList;

    .line 46
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->titles:Ljava/util/ArrayList;

    .line 47
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->fragments:Ljava/util/ArrayList;

    .line 50
    invoke-static {}, Lcom/vkontakte/android/LongPollService;->getNumGroupInvitations()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->mInvitesCount:I

    .line 57
    new-instance v0, Lcom/vkontakte/android/fragments/groups/GroupsFragment$1;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/groups/GroupsFragment$1;-><init>(Lcom/vkontakte/android/fragments/groups/GroupsFragment;)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->receiver:Landroid/content/BroadcastReceiver;

    .line 83
    iput-boolean v1, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->searching:Z

    .line 221
    iput-boolean v1, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->mHasInvitesTab:Z

    .line 54
    invoke-virtual {p0, v1}, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->setTabsAutoLoad(Z)V

    .line 55
    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/fragments/groups/GroupsFragment;)I
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/groups/GroupsFragment;

    .prologue
    .line 38
    iget v0, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->mInvitesCount:I

    return v0
.end method

.method static synthetic access$002(Lcom/vkontakte/android/fragments/groups/GroupsFragment;I)I
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/groups/GroupsFragment;
    .param p1, "x1"    # I

    .prologue
    .line 38
    iput p1, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->mInvitesCount:I

    return p1
.end method

.method static synthetic access$100(Lcom/vkontakte/android/fragments/groups/GroupsFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/groups/GroupsFragment;

    .prologue
    .line 38
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->updateTabs()V

    return-void
.end method

.method static synthetic access$1000(Lcom/vkontakte/android/fragments/groups/GroupsFragment;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/groups/GroupsFragment;

    .prologue
    .line 38
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->isTablet:Z

    return v0
.end method

.method static synthetic access$1100(Lcom/vkontakte/android/fragments/groups/GroupsFragment;)Landroid/view/ViewGroup;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/groups/GroupsFragment;

    .prologue
    .line 38
    iget-object v0, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->contentView:Landroid/view/ViewGroup;

    return-object v0
.end method

.method static synthetic access$1200(Lcom/vkontakte/android/fragments/groups/GroupsFragment;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/groups/GroupsFragment;

    .prologue
    .line 38
    iget-object v0, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->progress:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$1302(Lcom/vkontakte/android/fragments/groups/GroupsFragment;Lcom/vkontakte/android/api/VKAPIRequest;)Lcom/vkontakte/android/api/VKAPIRequest;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/groups/GroupsFragment;
    .param p1, "x1"    # Lcom/vkontakte/android/api/VKAPIRequest;

    .prologue
    .line 38
    iput-object p1, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->currentReq:Lcom/vkontakte/android/api/VKAPIRequest;

    return-object p1
.end method

.method static synthetic access$1400(Lcom/vkontakte/android/fragments/groups/GroupsFragment;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/groups/GroupsFragment;

    .prologue
    .line 38
    iget-object v0, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->errorView:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$1500(Lcom/vkontakte/android/fragments/groups/GroupsFragment;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/groups/GroupsFragment;

    .prologue
    .line 38
    iget-object v0, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->progress:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$200(Lcom/vkontakte/android/fragments/groups/GroupsFragment;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/groups/GroupsFragment;

    .prologue
    .line 38
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->searching:Z

    return v0
.end method

.method static synthetic access$202(Lcom/vkontakte/android/fragments/groups/GroupsFragment;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/groups/GroupsFragment;
    .param p1, "x1"    # Z

    .prologue
    .line 38
    iput-boolean p1, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->searching:Z

    return p1
.end method

.method static synthetic access$300(Lcom/vkontakte/android/fragments/groups/GroupsFragment;)Lcom/vkontakte/android/fragments/groups/AllGroupsFragment;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/groups/GroupsFragment;

    .prologue
    .line 38
    iget-object v0, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->groupsView:Lcom/vkontakte/android/fragments/groups/AllGroupsFragment;

    return-object v0
.end method

.method static synthetic access$400(Lcom/vkontakte/android/fragments/groups/GroupsFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/groups/GroupsFragment;

    .prologue
    .line 38
    iget-object v0, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->allGroups:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$500(Lcom/vkontakte/android/fragments/groups/GroupsFragment;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/groups/GroupsFragment;

    .prologue
    .line 38
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->showAdmined:Z

    return v0
.end method

.method static synthetic access$600(Lcom/vkontakte/android/fragments/groups/GroupsFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/groups/GroupsFragment;

    .prologue
    .line 38
    iget-object v0, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->groups:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$700(Lcom/vkontakte/android/fragments/groups/GroupsFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/groups/GroupsFragment;

    .prologue
    .line 38
    iget-object v0, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->events:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$800(Lcom/vkontakte/android/fragments/groups/GroupsFragment;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/groups/GroupsFragment;

    .prologue
    .line 38
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->isTablet:Z

    return v0
.end method

.method static synthetic access$900(Lcom/vkontakte/android/fragments/groups/GroupsFragment;)Lcom/vkontakte/android/fragments/groups/EventsFragment;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/groups/GroupsFragment;

    .prologue
    .line 38
    iget-object v0, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->eventsView:Lcom/vkontakte/android/fragments/groups/EventsFragment;

    return-object v0
.end method

.method private showCreateGroupDialog()V
    .locals 3

    .prologue
    .line 217
    new-instance v0, Lcom/vkontakte/android/CreateGroupDialog;

    invoke-direct {v0}, Lcom/vkontakte/android/CreateGroupDialog;-><init>()V

    .line 218
    .local v0, "dialog":Lcom/vkontakte/android/CreateGroupDialog;
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/CreateGroupDialog;->show(Landroid/app/FragmentManager;Ljava/lang/String;)V

    .line 219
    return-void
.end method

.method private updateTabs()V
    .locals 10

    .prologue
    const v9, 0x7f0d0020

    const v8, 0x7f0d001e

    const v7, 0x7f0d000b

    const/4 v6, 0x0

    const/4 v5, 0x1

    .line 224
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    if-nez v0, :cond_1

    .line 249
    :cond_0
    :goto_0
    return-void

    .line 227
    :cond_1
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->mTabsCreated:Z

    if-nez v0, :cond_3

    .line 228
    iput-boolean v5, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->mTabsCreated:Z

    .line 229
    iget-object v0, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->titles:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 230
    iget-object v0, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->fragments:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 231
    iget-object v0, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->titles:Ljava/util/ArrayList;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->groups:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    new-array v3, v5, [Ljava/lang/Object;

    iget-object v4, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->groups:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v6

    invoke-virtual {v1, v9, v2, v3}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 232
    iget-object v0, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->fragments:Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->groupsView:Lcom/vkontakte/android/fragments/groups/AllGroupsFragment;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 233
    iget-object v0, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->titles:Ljava/util/ArrayList;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->events:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    new-array v3, v5, [Ljava/lang/Object;

    iget-object v4, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->events:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v6

    invoke-virtual {v1, v7, v2, v3}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 234
    iget-object v0, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->fragments:Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->eventsView:Lcom/vkontakte/android/fragments/groups/EventsFragment;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 235
    iget v0, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->mInvitesCount:I

    if-lez v0, :cond_2

    iget v0, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->uid:I

    invoke-static {v0}, Lcom/vkontakte/android/auth/VKAccountManager;->isCurrentUser(I)Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->requestsView:Lcom/vkontakte/android/fragments/groups/GroupInvitesFragment;

    if-eqz v0, :cond_2

    .line 236
    iget-object v0, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->titles:Ljava/util/ArrayList;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    iget v2, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->mInvitesCount:I

    new-array v3, v5, [Ljava/lang/Object;

    iget v4, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->mInvitesCount:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v6

    invoke-virtual {v1, v8, v2, v3}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 237
    iget-object v0, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->fragments:Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->requestsView:Lcom/vkontakte/android/fragments/groups/GroupInvitesFragment;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 238
    iput-boolean v5, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->mHasInvitesTab:Z

    .line 240
    :cond_2
    iget-object v0, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->fragments:Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->titles:Ljava/util/ArrayList;

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->setTabs(Ljava/util/List;Ljava/util/List;)V

    goto/16 :goto_0

    .line 242
    :cond_3
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->groups:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    new-array v2, v5, [Ljava/lang/Object;

    iget-object v3, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->groups:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v6

    invoke-virtual {v0, v9, v1, v2}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v6, v0}, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->setTabTitle(ILjava/lang/CharSequence;)V

    .line 243
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->events:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    new-array v2, v5, [Ljava/lang/Object;

    iget-object v3, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->events:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v6

    invoke-virtual {v0, v7, v1, v2}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v5, v0}, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->setTabTitle(ILjava/lang/CharSequence;)V

    .line 245
    iget v0, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->mInvitesCount:I

    if-ltz v0, :cond_0

    iget v0, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->uid:I

    invoke-static {v0}, Lcom/vkontakte/android/auth/VKAccountManager;->isCurrentUser(I)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->requestsView:Lcom/vkontakte/android/fragments/groups/GroupInvitesFragment;

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->mHasInvitesTab:Z

    if-eqz v0, :cond_0

    .line 246
    const/4 v0, 0x2

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    iget v2, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->mInvitesCount:I

    new-array v3, v5, [Ljava/lang/Object;

    iget v4, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->mInvitesCount:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v6

    invoke-virtual {v1, v8, v2, v3}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->setTabTitle(ILjava/lang/CharSequence;)V

    goto/16 :goto_0
.end method


# virtual methods
.method protected doLoadData()V
    .locals 4

    .prologue
    .line 253
    iget v2, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->uid:I

    invoke-static {v2}, Lcom/vkontakte/android/auth/VKAccountManager;->isCurrentUser(I)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 254
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v2

    const-string/jumbo v3, "_from_menu"

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->allGroups:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-nez v2, :cond_0

    const-wide/16 v0, 0xb4

    .line 255
    .local v0, "when":J
    :goto_0
    new-instance v2, Lcom/vkontakte/android/fragments/groups/GroupsFragment$3;

    invoke-direct {v2, p0, v0, v1}, Lcom/vkontakte/android/fragments/groups/GroupsFragment$3;-><init>(Lcom/vkontakte/android/fragments/groups/GroupsFragment;J)V

    .line 284
    invoke-virtual {v2}, Lcom/vkontakte/android/fragments/groups/GroupsFragment$3;->start()V

    .line 322
    .end local v0    # "when":J
    :goto_1
    return-void

    .line 254
    :cond_0
    const-wide/16 v0, 0x0

    goto :goto_0

    .line 286
    :cond_1
    iget-object v2, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->contentView:Landroid/view/ViewGroup;

    const/4 v3, 0x4

    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 287
    iget-object v2, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->progress:Landroid/view/View;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    .line 288
    new-instance v2, Lcom/vkontakte/android/api/groups/GroupsGet;

    iget v3, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->uid:I

    invoke-direct {v2, v3}, Lcom/vkontakte/android/api/groups/GroupsGet;-><init>(I)V

    new-instance v3, Lcom/vkontakte/android/fragments/groups/GroupsFragment$4;

    invoke-direct {v3, p0}, Lcom/vkontakte/android/fragments/groups/GroupsFragment$4;-><init>(Lcom/vkontakte/android/fragments/groups/GroupsFragment;)V

    .line 289
    invoke-virtual {v2, v3}, Lcom/vkontakte/android/api/groups/GroupsGet;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v2

    iget-object v3, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->contentView:Landroid/view/ViewGroup;

    .line 320
    invoke-virtual {v2, v3}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/view/View;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v2

    iput-object v2, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->currentReq:Lcom/vkontakte/android/api/VKAPIRequest;

    goto :goto_1
.end method

.method public hasNavigationDrawer()Z
    .locals 1

    .prologue
    .line 182
    const/4 v0, 0x1

    return v0
.end method

.method synthetic lambda$onViewCreated$0(Lcom/vkontakte/android/api/Group;)V
    .locals 3
    .param p1, "group"    # Lcom/vkontakte/android/api/Group;

    .prologue
    .line 167
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 168
    .local v0, "result":Landroid/content/Intent;
    const-string/jumbo v1, "gid"

    iget v2, p1, Lcom/vkontakte/android/api/Group;->id:I

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 169
    const-string/jumbo v1, "name"

    iget-object v2, p1, Lcom/vkontakte/android/api/Group;->name:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 170
    const-string/jumbo v1, "photo"

    iget-object v2, p1, Lcom/vkontakte/android/api/Group;->photo:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 171
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const/4 v2, -0x1

    invoke-virtual {v1, v2, v0}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 172
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->finish()V

    .line 173
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 5
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 92
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/VkTabbedLoaderFragment;->onCreate(Landroid/os/Bundle;)V

    .line 93
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    const-string/jumbo v2, "select"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v1

    iput-boolean v1, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->select:Z

    .line 94
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    const-string/jumbo v2, "uid"

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v3

    invoke-virtual {v3}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v3

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v1

    iput v1, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->uid:I

    .line 95
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    const-string/jumbo v2, "admin_only"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v1

    iput-boolean v1, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->showAdmined:Z

    .line 96
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    const-string/jumbo v2, "global_search"

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->global_search:Z

    .line 97
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "groups?id="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->uid:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/vkontakte/android/ActivityUtils;->setBeamLink(Landroid/app/Activity;Ljava/lang/String;)V

    .line 98
    iget v1, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->uid:I

    if-eqz v1, :cond_0

    iget v1, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->uid:I

    invoke-static {v1}, Lcom/vkontakte/android/auth/VKAccountManager;->isCurrentUser(I)Z

    move-result v1

    if-eqz v1, :cond_1

    :cond_0
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    const-string/jumbo v2, "admin_only"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 99
    :cond_1
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    const-string/jumbo v2, "title"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 100
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    const-string/jumbo v2, "title"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getCharSequence(Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->setTitle(Ljava/lang/CharSequence;)V

    .line 105
    :cond_2
    :goto_0
    iget v1, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->uid:I

    if-eqz v1, :cond_3

    iget v1, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->uid:I

    invoke-static {v1}, Lcom/vkontakte/android/auth/VKAccountManager;->isCurrentUser(I)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 106
    :cond_3
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 107
    .local v0, "filter":Landroid/content/IntentFilter;
    const-string/jumbo v1, "com.vkontakte.android.GROUP_LIST_CHANGED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 108
    const-string/jumbo v1, "com.vkontakte.android.GROUP_INVITES_CHANGED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 109
    sget-object v1, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->receiver:Landroid/content/BroadcastReceiver;

    const-string/jumbo v3, "com.vkontakte.android.permission.ACCESS_DATA"

    const/4 v4, 0x0

    invoke-virtual {v1, v2, v0, v3, v4}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;)Landroid/content/Intent;

    .line 111
    .end local v0    # "filter":Landroid/content/IntentFilter;
    :cond_4
    return-void

    .line 102
    :cond_5
    const v1, 0x7f0802fd

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->setTitle(I)V

    goto :goto_0
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V
    .locals 4
    .param p1, "menu"    # Landroid/view/Menu;
    .param p2, "inflater"    # Landroid/view/MenuInflater;

    .prologue
    const/4 v3, 0x0

    .line 194
    if-eqz p1, :cond_2

    .line 195
    iget-object v1, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->searchView:Lcom/vkontakte/android/ui/SearchViewWrapper;

    if-eqz v1, :cond_0

    iget-boolean v1, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->loaded:Z

    if-eqz v1, :cond_0

    .line 196
    iget-object v1, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->searchView:Lcom/vkontakte/android/ui/SearchViewWrapper;

    invoke-virtual {v1, p1}, Lcom/vkontakte/android/ui/SearchViewWrapper;->onCreateOptionsMenu(Landroid/view/Menu;)V

    .line 198
    :cond_0
    iget-boolean v1, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->select:Z

    if-nez v1, :cond_1

    iget v1, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->uid:I

    invoke-static {v1}, Lcom/vkontakte/android/auth/VKAccountManager;->isCurrentUser(I)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 199
    const v1, 0x7f1000b0

    const v2, 0x7f0800a1

    invoke-interface {p1, v3, v1, v3, v2}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    move-result-object v0

    .line 200
    .local v0, "add":Landroid/view/MenuItem;
    const/4 v1, 0x2

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setShowAsAction(I)V

    .line 201
    iput-object v0, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->addItem:Landroid/view/MenuItem;

    .line 202
    const v1, 0x7f02015f

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    .line 204
    .end local v0    # "add":Landroid/view/MenuItem;
    :cond_1
    invoke-super {p0, p1, p2}, Lcom/vkontakte/android/fragments/VkTabbedLoaderFragment;->onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V

    .line 206
    :cond_2
    return-void
.end method

.method public onDestroy()V
    .locals 2

    .prologue
    .line 325
    invoke-super {p0}, Lcom/vkontakte/android/fragments/VkTabbedLoaderFragment;->onDestroy()V

    .line 327
    :try_start_0
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->receiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 330
    :goto_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->currentReq:Lcom/vkontakte/android/api/VKAPIRequest;

    if-eqz v0, :cond_0

    .line 331
    iget-object v0, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->currentReq:Lcom/vkontakte/android/api/VKAPIRequest;

    invoke-virtual {v0}, Lcom/vkontakte/android/api/VKAPIRequest;->cancel()V

    .line 333
    :cond_0
    return-void

    .line 328
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 2
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 210
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f1000b0

    if-ne v0, v1, :cond_0

    .line 211
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->showCreateGroupDialog()V

    .line 213
    :cond_0
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/VkTabbedLoaderFragment;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    return v0
.end method

.method public onRefresh()V
    .locals 0

    .prologue
    .line 338
    return-void
.end method

.method protected onSpinnerItemSelected(I)Z
    .locals 2
    .param p1, "position"    # I

    .prologue
    const/4 v1, 0x1

    .line 187
    if-ne p1, v1, :cond_0

    move v0, v1

    :goto_0
    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->showAdmined:Z

    .line 188
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->doLoadData()V

    .line 189
    return v1

    .line 187
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 5
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 115
    invoke-super {p0, p1, p2}, Lcom/vkontakte/android/fragments/VkTabbedLoaderFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 116
    iget v2, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->uid:I

    invoke-static {v2}, Lcom/vkontakte/android/fragments/groups/AllGroupsFragment;->newInstance(I)Lcom/vkontakte/android/fragments/groups/AllGroupsFragment;

    move-result-object v2

    iput-object v2, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->groupsView:Lcom/vkontakte/android/fragments/groups/AllGroupsFragment;

    .line 117
    iget v2, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->uid:I

    invoke-static {v2}, Lcom/vkontakte/android/fragments/groups/EventsFragment;->newInstance(I)Lcom/vkontakte/android/fragments/groups/EventsFragment;

    move-result-object v2

    iput-object v2, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->eventsView:Lcom/vkontakte/android/fragments/groups/EventsFragment;

    .line 119
    iget-object v2, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->groupsView:Lcom/vkontakte/android/fragments/groups/AllGroupsFragment;

    iget-boolean v3, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->global_search:Z

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/fragments/groups/AllGroupsFragment;->setGlobalSearch(Z)V

    .line 121
    iget v2, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->uid:I

    invoke-static {v2}, Lcom/vkontakte/android/auth/VKAccountManager;->isCurrentUser(I)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 122
    new-instance v2, Lcom/vkontakte/android/fragments/groups/GroupInvitesFragment;

    invoke-direct {v2}, Lcom/vkontakte/android/fragments/groups/GroupInvitesFragment;-><init>()V

    iput-object v2, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->requestsView:Lcom/vkontakte/android/fragments/groups/GroupInvitesFragment;

    .line 124
    :cond_0
    iget v2, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->uid:I

    if-eqz v2, :cond_1

    iget v2, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->uid:I

    invoke-static {v2}, Lcom/vkontakte/android/auth/VKAccountManager;->isCurrentUser(I)Z

    move-result v2

    if-eqz v2, :cond_4

    :cond_1
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v2

    const-string/jumbo v3, "admin_only"

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_4

    .line 125
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 126
    .local v1, "titles":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const v2, 0x7f0802fd

    invoke-virtual {p0, v2}, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 127
    const v2, 0x7f0802ff

    invoke-virtual {p0, v2}, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 128
    invoke-virtual {p0, v1}, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->setSpinnerItems(Ljava/util/List;)V

    .line 132
    .end local v1    # "titles":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :goto_0
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->updateTabs()V

    .line 134
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v2

    const-string/jumbo v3, "tab"

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 135
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v2

    const-string/jumbo v3, "tab"

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {p0, v2}, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->setPagerCurrentItem(I)V

    .line 138
    :cond_2
    new-instance v2, Lcom/vkontakte/android/ui/SearchViewWrapper;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    new-instance v4, Lcom/vkontakte/android/fragments/groups/GroupsFragment$2;

    invoke-direct {v4, p0}, Lcom/vkontakte/android/fragments/groups/GroupsFragment$2;-><init>(Lcom/vkontakte/android/fragments/groups/GroupsFragment;)V

    invoke-direct {v2, v3, v4}, Lcom/vkontakte/android/ui/SearchViewWrapper;-><init>(Landroid/app/Activity;Lcom/vkontakte/android/ui/SearchViewWrapper$SearchListener;)V

    iput-object v2, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->searchView:Lcom/vkontakte/android/ui/SearchViewWrapper;

    .line 163
    const/4 v2, 0x1

    invoke-virtual {p0, v2}, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->setHasOptionsMenu(Z)V

    .line 165
    iget-boolean v2, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->select:Z

    if-eqz v2, :cond_3

    .line 166
    invoke-static {p0}, Lcom/vkontakte/android/fragments/groups/GroupsFragment$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/fragments/groups/GroupsFragment;)Lcom/vkontakte/android/functions/VoidF1;

    move-result-object v0

    .line 174
    .local v0, "listener":Lcom/vkontakte/android/functions/VoidF1;, "Lcom/vkontakte/android/functions/VoidF1<Lcom/vkontakte/android/api/Group;>;"
    iget-object v2, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->groupsView:Lcom/vkontakte/android/fragments/groups/AllGroupsFragment;

    invoke-virtual {v2, v0}, Lcom/vkontakte/android/fragments/groups/AllGroupsFragment;->setSelectionListener(Lcom/vkontakte/android/functions/VoidF1;)Lcom/vkontakte/android/fragments/groups/AllGroupsFragment;

    .line 175
    iget-object v2, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->eventsView:Lcom/vkontakte/android/fragments/groups/EventsFragment;

    invoke-virtual {v2, v0}, Lcom/vkontakte/android/fragments/groups/EventsFragment;->setSelectionListener(Lcom/vkontakte/android/functions/VoidF1;)Lcom/vkontakte/android/fragments/groups/EventsFragment;

    .line 177
    .end local v0    # "listener":Lcom/vkontakte/android/functions/VoidF1;, "Lcom/vkontakte/android/functions/VoidF1<Lcom/vkontakte/android/api/Group;>;"
    :cond_3
    return-void

    .line 130
    :cond_4
    const/4 v2, 0x0

    invoke-virtual {p0, v2}, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->onSpinnerItemSelected(I)Z

    goto :goto_0
.end method
