.class public Lcom/vkontakte/android/fragments/friends/FriendsListFragment;
.super Lcom/vkontakte/android/fragments/base/SegmenterFragment;
.source "FriendsListFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/fragments/friends/FriendsListFragment$Adapter;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lcom/vkontakte/android/UserProfile;",
        ">",
        "Lcom/vkontakte/android/fragments/base/SegmenterFragment",
        "<",
        "Lcom/vkontakte/android/UserProfile;",
        ">;"
    }
.end annotation


# static fields
.field public static final ACTION_REQUESTS_UPDATED:Ljava/lang/String; = "com.vkontakte.android.REQUESTS_UPDATED"

.field private static final FAST_TRACK_MIN_COUNT:I = 0x14

.field private static final MIN_INCOMING_COUNT_FOR_REQUEST:I = 0x5

.field protected static final SORT_FIRST:I = 0x1

.field protected static final SORT_HINTS:I = 0x0

.field protected static final SORT_LAST:I = 0x2


# instance fields
.field private bottomDividerDecoration:Lcom/vkontakte/android/ui/recyclerview/BottomDividerDecoration;

.field private clearOnDestroyAction:Z

.field private fastScroller:Lcom/vkontakte/android/ui/recyclerview/FastScroller;

.field private mAcceptListener:Lcom/vkontakte/android/functions/VoidF2Int;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/functions/VoidF2Int",
            "<",
            "Lcom/vkontakte/android/RequestUserProfile;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private mActionMode:Landroid/view/ActionMode;

.field private mActionModeCallback:Landroid/view/ActionMode$Callback;

.field private mBuildImportant:Z

.field private mBuildIndex:Z

.field private mCheckListener:Lcom/vkontakte/android/functions/VoidF1Bool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/functions/VoidF1Bool",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;"
        }
    .end annotation
.end field

.field private mClickListener:Lcom/vkontakte/android/functions/VoidF1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/functions/VoidF1",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;"
        }
    .end annotation
.end field

.field private mFastScrollerVisibility:Z

.field private mGlobalSearchEnabled:Z

.field private final mIndexer:Lcom/vkontakte/android/ui/util/AlphabetSegmenter;

.field private mMultiselectListener:Lcom/vkontakte/android/functions/VoidF1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/functions/VoidF1",
            "<",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;>;"
        }
    .end annotation
.end field

.field private mProfileListener:Lcom/vkontakte/android/functions/VoidF1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/functions/VoidF1",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;"
        }
    .end annotation
.end field

.field private final mSearchIndexer:Lcom/vkontakte/android/ui/util/SearchSegmenter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/ui/util/SearchSegmenter",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;"
        }
    .end annotation
.end field

.field private mSearchMode:Z

.field private mSearchView:Lcom/vkontakte/android/ui/SearchViewWrapper;

.field private mSelectedUsers:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;"
        }
    .end annotation
.end field

.field private mSelectionListener:Lcom/vkontakte/android/functions/VoidF1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/functions/VoidF1",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;"
        }
    .end annotation
.end field

.field private primaryMenuItem:Landroid/view/MenuItem;

.field private receiver:Landroid/content/BroadcastReceiver;

.field private requestUsers:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/RequestUserProfile;",
            ">;"
        }
    .end annotation
.end field

.field private searchExpanded:Z

.field private sortPref:I

.field private suggestUsers:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/RequestUserProfile;",
            ">;"
        }
    .end annotation
.end field

.field private totalIn:I

.field private totalRequests:I

.field private totalSuggest:I


# direct methods
.method public constructor <init>()V
    .locals 7

    .prologue
    .local p0, "this":Lcom/vkontakte/android/fragments/friends/FriendsListFragment;, "Lcom/vkontakte/android/fragments/friends/FriendsListFragment<TT;>;"
    const/4 v6, 0x0

    const/4 v5, 0x1

    .line 161
    const v1, 0x7fffffff

    invoke-direct {p0, v1}, Lcom/vkontakte/android/fragments/base/SegmenterFragment;-><init>(I)V

    .line 70
    invoke-static {p0}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;)Lcom/vkontakte/android/functions/VoidF1;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->mProfileListener:Lcom/vkontakte/android/functions/VoidF1;

    .line 71
    invoke-static {p0}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$$Lambda$2;->lambdaFactory$(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;)Lcom/vkontakte/android/functions/VoidF2Int;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->mAcceptListener:Lcom/vkontakte/android/functions/VoidF2Int;

    .line 72
    new-instance v1, Lcom/vkontakte/android/ui/util/AlphabetSegmenter;

    invoke-direct {v1}, Lcom/vkontakte/android/ui/util/AlphabetSegmenter;-><init>()V

    iput-object v1, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->mIndexer:Lcom/vkontakte/android/ui/util/AlphabetSegmenter;

    .line 73
    new-instance v1, Lcom/vkontakte/android/ui/util/SearchSegmenter;

    new-instance v2, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$1;

    invoke-direct {v2, p0}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$1;-><init>(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;)V

    invoke-static {}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$$Lambda$3;->lambdaFactory$()Lcom/vkontakte/android/ui/util/SearchSegmenter$Generator;

    move-result-object v3

    const/16 v4, 0x32

    invoke-direct {v1, v2, v3, v4}, Lcom/vkontakte/android/ui/util/SearchSegmenter;-><init>(Lcom/vkontakte/android/fragments/friends/SearchIndexer$Provider;Lcom/vkontakte/android/ui/util/SearchSegmenter$Generator;I)V

    sget-object v2, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const v3, 0x7f0805e5

    .line 88
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/ui/util/SearchSegmenter;->setGlobalTitle(Ljava/lang/CharSequence;)Lcom/vkontakte/android/ui/util/SearchSegmenter;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->mSearchIndexer:Lcom/vkontakte/android/ui/util/SearchSegmenter;

    .line 96
    iput-boolean v6, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->mFastScrollerVisibility:Z

    .line 101
    iput-boolean v5, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->mGlobalSearchEnabled:Z

    .line 102
    iput-boolean v5, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->clearOnDestroyAction:Z

    .line 112
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->requestUsers:Ljava/util/ArrayList;

    .line 113
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->suggestUsers:Ljava/util/ArrayList;

    .line 116
    new-instance v1, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$2;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$2;-><init>(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;)V

    iput-object v1, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->receiver:Landroid/content/BroadcastReceiver;

    .line 134
    invoke-static {p0}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$$Lambda$4;->lambdaFactory$(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;)Lcom/vkontakte/android/functions/VoidF1;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->mClickListener:Lcom/vkontakte/android/functions/VoidF1;

    .line 141
    invoke-static {p0}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$$Lambda$5;->lambdaFactory$(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;)Lcom/vkontakte/android/functions/VoidF1Bool;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->mCheckListener:Lcom/vkontakte/android/functions/VoidF1Bool;

    .line 162
    const v1, 0x7f0300ab

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->setListLayoutId(I)V

    .line 163
    sget-object v1, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-static {v1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    const-string/jumbo v2, "friendsOrderNew"

    const-string/jumbo v3, "firstname"

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 164
    .local v0, "pref":Ljava/lang/String;
    const-string/jumbo v1, "hints"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 165
    iput v6, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->sortPref:I

    .line 171
    :cond_0
    :goto_0
    return-void

    .line 166
    :cond_1
    const-string/jumbo v1, "firstname"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 167
    iput v5, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->sortPref:I

    goto :goto_0

    .line 168
    :cond_2
    const-string/jumbo v1, "lastname"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 169
    const/4 v1, 0x2

    iput v1, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->sortPref:I

    goto :goto_0
.end method

.method static synthetic access$000(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/friends/FriendsListFragment;
    .param p1, "x1"    # Z

    .prologue
    .line 61
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->loadRequestUsers(Z)V

    return-void
.end method

.method static synthetic access$1000(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    .prologue
    .line 61
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->canShowRequests()Z

    move-result v0

    return v0
.end method

.method static synthetic access$102(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;Landroid/view/ActionMode$Callback;)Landroid/view/ActionMode$Callback;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/friends/FriendsListFragment;
    .param p1, "x1"    # Landroid/view/ActionMode$Callback;

    .prologue
    .line 61
    iput-object p1, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->mActionModeCallback:Landroid/view/ActionMode$Callback;

    return-object p1
.end method

.method static synthetic access$1100(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    .prologue
    .line 61
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->requestUsers:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$1200(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;)I
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    .prologue
    .line 61
    iget v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->totalRequests:I

    return v0
.end method

.method static synthetic access$1300(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;II)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/friends/FriendsListFragment;
    .param p1, "x1"    # I
    .param p2, "x2"    # I

    .prologue
    .line 61
    invoke-direct {p0, p1, p2}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->sendBroadcastUpdated(II)V

    return-void
.end method

.method static synthetic access$1400(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    .prologue
    .line 61
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->suggestUsers:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$1500(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    .prologue
    .line 61
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->updateData()V

    return-void
.end method

.method static synthetic access$1600(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;)I
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    .prologue
    .line 61
    iget v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->totalSuggest:I

    return v0
.end method

.method static synthetic access$1602(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;I)I
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/friends/FriendsListFragment;
    .param p1, "x1"    # I

    .prologue
    .line 61
    iput p1, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->totalSuggest:I

    return p1
.end method

.method static synthetic access$1700(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;)I
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    .prologue
    .line 61
    iget v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->totalIn:I

    return v0
.end method

.method static synthetic access$1702(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;I)I
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/friends/FriendsListFragment;
    .param p1, "x1"    # I

    .prologue
    .line 61
    iput p1, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->totalIn:I

    return p1
.end method

.method static synthetic access$1802(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;Lme/grishka/appkit/api/APIRequest;)Lme/grishka/appkit/api/APIRequest;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/friends/FriendsListFragment;
    .param p1, "x1"    # Lme/grishka/appkit/api/APIRequest;

    .prologue
    .line 61
    iput-object p1, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->currentRequest:Lme/grishka/appkit/api/APIRequest;

    return-object p1
.end method

.method static synthetic access$1900(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    .prologue
    .line 61
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->mSearchMode:Z

    return v0
.end method

.method static synthetic access$200(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;)Landroid/view/ActionMode;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    .prologue
    .line 61
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->mActionMode:Landroid/view/ActionMode;

    return-object v0
.end method

.method static synthetic access$2000(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;)Lcom/vkontakte/android/functions/VoidF1;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    .prologue
    .line 61
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->mProfileListener:Lcom/vkontakte/android/functions/VoidF1;

    return-object v0
.end method

.method static synthetic access$202(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;Landroid/view/ActionMode;)Landroid/view/ActionMode;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/friends/FriendsListFragment;
    .param p1, "x1"    # Landroid/view/ActionMode;

    .prologue
    .line 61
    iput-object p1, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->mActionMode:Landroid/view/ActionMode;

    return-object p1
.end method

.method static synthetic access$2100(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;)Lcom/vkontakte/android/functions/VoidF2Int;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    .prologue
    .line 61
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->mAcceptListener:Lcom/vkontakte/android/functions/VoidF2Int;

    return-object v0
.end method

.method static synthetic access$2200(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;)Lcom/vkontakte/android/functions/VoidF1Bool;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    .prologue
    .line 61
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->mCheckListener:Lcom/vkontakte/android/functions/VoidF1Bool;

    return-object v0
.end method

.method static synthetic access$2300(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;)Lcom/vkontakte/android/functions/VoidF1;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    .prologue
    .line 61
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->mClickListener:Lcom/vkontakte/android/functions/VoidF1;

    return-object v0
.end method

.method static synthetic access$2400(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    .prologue
    .line 61
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->mBuildImportant:Z

    return v0
.end method

.method static synthetic access$2500(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    .prologue
    .line 61
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->mBuildIndex:Z

    return v0
.end method

.method static synthetic access$2600(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    .prologue
    .line 61
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->isTablet:Z

    return v0
.end method

.method static synthetic access$2700(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;)I
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    .prologue
    .line 61
    iget v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->scrW:I

    return v0
.end method

.method static synthetic access$300(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;)Landroid/util/SparseArray;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    .prologue
    .line 61
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->mSelectedUsers:Landroid/util/SparseArray;

    return-object v0
.end method

.method static synthetic access$400(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;)Lcom/vkontakte/android/functions/VoidF1;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    .prologue
    .line 61
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->mMultiselectListener:Lcom/vkontakte/android/functions/VoidF1;

    return-object v0
.end method

.method static synthetic access$500(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    .prologue
    .line 61
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->releaseSelected()Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$600(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;)Lcom/vkontakte/android/ui/SearchViewWrapper;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    .prologue
    .line 61
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->mSearchView:Lcom/vkontakte/android/ui/SearchViewWrapper;

    return-object v0
.end method

.method static synthetic access$700(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    .prologue
    .line 61
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->clearOnDestroyAction:Z

    return v0
.end method

.method static synthetic access$702(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/friends/FriendsListFragment;
    .param p1, "x1"    # Z

    .prologue
    .line 61
    iput-boolean p1, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->clearOnDestroyAction:Z

    return p1
.end method

.method static synthetic access$800(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;)Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/friends/FriendsListFragment;

    .prologue
    .line 61
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->getAdapter()Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$lambda$0(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->updateActionMode()V

    return-void
.end method

.method private canShowRequests()Z
    .locals 1

    .prologue
    .line 569
    .local p0, "this":Lcom/vkontakte/android/fragments/friends/FriendsListFragment;, "Lcom/vkontakte/android/fragments/friends/FriendsListFragment<TT;>;"
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->requestUsers:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->suggestUsers:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

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

.method private loadRequestUsers(Z)V
    .locals 3
    .param p1, "suggests"    # Z

    .prologue
    .local p0, "this":Lcom/vkontakte/android/fragments/friends/FriendsListFragment;, "Lcom/vkontakte/android/fragments/friends/FriendsListFragment<TT;>;"
    const/4 v2, 0x0

    .line 612
    new-instance v0, Lcom/vkontakte/android/api/friends/FriendsGetRequests;

    const/16 v1, 0xa

    invoke-direct {v0, v2, v1, p1, v2}, Lcom/vkontakte/android/api/friends/FriendsGetRequests;-><init>(IIZZ)V

    new-instance v1, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$5;

    invoke-direct {v1, p0, p1}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$5;-><init>(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;Z)V

    .line 613
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/friends/FriendsGetRequests;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 635
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->currentRequest:Lme/grishka/appkit/api/APIRequest;

    .line 636
    return-void
.end method

.method private releaseSelected()Ljava/util/ArrayList;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;"
        }
    .end annotation

    .prologue
    .line 544
    .local p0, "this":Lcom/vkontakte/android/fragments/friends/FriendsListFragment;, "Lcom/vkontakte/android/fragments/friends/FriendsListFragment<TT;>;"
    new-instance v1, Ljava/util/ArrayList;

    iget-object v3, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->mSelectedUsers:Landroid/util/SparseArray;

    invoke-virtual {v3}, Landroid/util/SparseArray;->size()I

    move-result v3

    invoke-direct {v1, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 545
    .local v1, "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v3, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->mSelectedUsers:Landroid/util/SparseArray;

    invoke-virtual {v3}, Landroid/util/SparseArray;->size()I

    move-result v3

    if-ge v0, v3, :cond_0

    .line 546
    iget-object v3, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->mSelectedUsers:Landroid/util/SparseArray;

    invoke-virtual {v3, v0}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/UserProfile;

    .line 547
    .local v2, "userProfile":Lcom/vkontakte/android/UserProfile;
    const/4 v3, 0x0

    iput-boolean v3, v2, Lcom/vkontakte/android/UserProfile;->isSelected:Z

    .line 548
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 545
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 550
    .end local v2    # "userProfile":Lcom/vkontakte/android/UserProfile;
    :cond_0
    iget-object v3, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->mSelectedUsers:Landroid/util/SparseArray;

    invoke-virtual {v3}, Landroid/util/SparseArray;->clear()V

    .line 551
    return-object v1
.end method

.method private restoreSelection(Landroid/os/Bundle;)Z
    .locals 8
    .param p1, "savedData"    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .local p0, "this":Lcom/vkontakte/android/fragments/friends/FriendsListFragment;, "Lcom/vkontakte/android/fragments/friends/FriendsListFragment<TT;>;"
    const/4 v5, 0x0

    const/4 v4, 0x1

    .line 260
    if-eqz p1, :cond_4

    .line 261
    const-string/jumbo v6, "selectedUsers"

    invoke-virtual {p1, v6}, Landroid/os/Bundle;->getIntArray(Ljava/lang/String;)[I

    move-result-object v3

    .line 262
    .local v3, "selectedUsers":[I
    if-eqz v3, :cond_4

    .line 263
    iget-object v6, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->mSelectedUsers:Landroid/util/SparseArray;

    if-nez v6, :cond_0

    .line 264
    new-instance v6, Landroid/util/SparseArray;

    array-length v7, v3

    invoke-direct {v6, v7}, Landroid/util/SparseArray;-><init>(I)V

    iput-object v6, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->mSelectedUsers:Landroid/util/SparseArray;

    .line 266
    :cond_0
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v6, v3

    if-ge v0, v6, :cond_3

    .line 267
    const/4 v1, 0x0

    .local v1, "j":I
    :goto_1
    iget-object v6, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->data:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-ge v1, v6, :cond_1

    .line 268
    iget-object v6, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->data:Ljava/util/ArrayList;

    invoke-virtual {v6, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/UserProfile;

    .line 269
    .local v2, "profile":Lcom/vkontakte/android/UserProfile;
    iget v6, v2, Lcom/vkontakte/android/UserProfile;->uid:I

    aget v7, v3, v0

    if-ne v6, v7, :cond_2

    .line 270
    iput-boolean v4, v2, Lcom/vkontakte/android/UserProfile;->isSelected:Z

    .line 271
    iget-object v6, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->mSelectedUsers:Landroid/util/SparseArray;

    iget v7, v2, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-virtual {v6, v7, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 266
    .end local v2    # "profile":Lcom/vkontakte/android/UserProfile;
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 267
    .restart local v2    # "profile":Lcom/vkontakte/android/UserProfile;
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 276
    .end local v1    # "j":I
    .end local v2    # "profile":Lcom/vkontakte/android/UserProfile;
    :cond_3
    iget-object v6, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->mSelectedUsers:Landroid/util/SparseArray;

    invoke-virtual {v6}, Landroid/util/SparseArray;->size()I

    move-result v6

    if-lez v6, :cond_4

    .line 277
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->updateList()V

    .line 278
    iget-object v6, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->mCheckListener:Lcom/vkontakte/android/functions/VoidF1Bool;

    iget-object v7, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->mSelectedUsers:Landroid/util/SparseArray;

    invoke-virtual {v7, v5}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v5

    invoke-interface {v6, v5, v4}, Lcom/vkontakte/android/functions/VoidF1Bool;->f(Ljava/lang/Object;Z)V

    .line 283
    .end local v0    # "i":I
    .end local v3    # "selectedUsers":[I
    :goto_2
    return v4

    :cond_4
    move v4, v5

    goto :goto_2
.end method

.method private sendBroadcastUpdated(II)V
    .locals 3
    .param p1, "newIn"    # I
    .param p2, "newSuggest"    # I

    .prologue
    .line 639
    .local p0, "this":Lcom/vkontakte/android/fragments/friends/FriendsListFragment;, "Lcom/vkontakte/android/fragments/friends/FriendsListFragment<TT;>;"
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v1, "com.vkontakte.android.REQUESTS_UPDATED"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 640
    .local v0, "intent":Landroid/content/Intent;
    const-string/jumbo v1, "in"

    iget-object v2, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->requestUsers:Ljava/util/ArrayList;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putParcelableArrayListExtra(Ljava/lang/String;Ljava/util/ArrayList;)Landroid/content/Intent;

    .line 641
    const-string/jumbo v1, "suggest"

    iget-object v2, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->suggestUsers:Ljava/util/ArrayList;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putParcelableArrayListExtra(Ljava/lang/String;Ljava/util/ArrayList;)Landroid/content/Intent;

    .line 642
    const-string/jumbo v1, "count_in"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 643
    const-string/jumbo v1, "count_suggest"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 644
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    const-string/jumbo v2, "com.vkontakte.android.permission.ACCESS_DATA"

    invoke-virtual {v1, v0, v2}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 645
    return-void
.end method

.method private setFastScrollerVisibility(Z)V
    .locals 5
    .param p1, "visible"    # Z

    .prologue
    .local p0, "this":Lcom/vkontakte/android/fragments/friends/FriendsListFragment;, "Lcom/vkontakte/android/fragments/friends/FriendsListFragment<TT;>;"
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 344
    iput-boolean p1, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->mFastScrollerVisibility:Z

    .line 345
    iget-object v3, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->data:Ljava/util/ArrayList;

    if-eqz v3, :cond_2

    iget-object v3, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->data:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    const/16 v4, 0x14

    if-lt v3, v4, :cond_2

    move v0, v1

    .line 346
    .local v0, "enoughData":Z
    :goto_0
    iget-object v3, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->fastScroller:Lcom/vkontakte/android/ui/recyclerview/FastScroller;

    if-eqz v3, :cond_0

    .line 347
    iget-object v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->fastScroller:Lcom/vkontakte/android/ui/recyclerview/FastScroller;

    if-eqz v0, :cond_3

    if-eqz p1, :cond_3

    move v3, v2

    :goto_1
    invoke-virtual {v4, v3}, Lcom/vkontakte/android/ui/recyclerview/FastScroller;->setVisibility(I)V

    .line 349
    :cond_0
    iget-object v3, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    if-eqz v3, :cond_1

    .line 350
    iget-object v3, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    if-eqz v0, :cond_4

    if-nez p1, :cond_4

    :goto_2
    invoke-virtual {v3, v1}, Lme/grishka/appkit/views/UsableRecyclerView;->setVerticalScrollBarEnabled(Z)V

    .line 352
    :cond_1
    return-void

    .end local v0    # "enoughData":Z
    :cond_2
    move v0, v2

    .line 345
    goto :goto_0

    .line 347
    .restart local v0    # "enoughData":Z
    :cond_3
    const/16 v3, 0x8

    goto :goto_1

    :cond_4
    move v1, v2

    .line 350
    goto :goto_2
.end method

.method private updateActionMode()V
    .locals 6

    .prologue
    .line 287
    .local p0, "this":Lcom/vkontakte/android/fragments/friends/FriendsListFragment;, "Lcom/vkontakte/android/fragments/friends/FriendsListFragment<TT;>;"
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->mSelectedUsers:Landroid/util/SparseArray;

    invoke-virtual {v0}, Landroid/util/SparseArray;->size()I

    move-result v0

    if-lez v0, :cond_3

    .line 288
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->mActionMode:Landroid/view/ActionMode;

    if-nez v0, :cond_2

    .line 289
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->mActionModeCallback:Landroid/view/ActionMode$Callback;

    if-nez v0, :cond_0

    .line 290
    new-instance v0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$3;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$3;-><init>(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->mActionModeCallback:Landroid/view/ActionMode$Callback;

    .line 333
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->mActionModeCallback:Landroid/view/ActionMode$Callback;

    invoke-virtual {v0, v1}, Lme/grishka/appkit/views/UsableRecyclerView;->startActionMode(Landroid/view/ActionMode$Callback;)Landroid/view/ActionMode;

    .line 341
    :cond_1
    :goto_0
    return-void

    .line 335
    :cond_2
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->mActionMode:Landroid/view/ActionMode;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0805f6

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    iget-object v5, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->mSelectedUsers:Landroid/util/SparseArray;

    invoke-virtual {v5}, Landroid/util/SparseArray;->size()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-virtual {v1, v2, v3}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/ActionMode;->setTitle(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 337
    :cond_3
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->mActionMode:Landroid/view/ActionMode;

    if-eqz v0, :cond_1

    .line 338
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->mActionMode:Landroid/view/ActionMode;

    invoke-virtual {v0}, Landroid/view/ActionMode;->finish()V

    .line 339
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->updatePrimaryMenuItem()V

    goto :goto_0
.end method

.method private updateData()V
    .locals 6

    .prologue
    .local p0, "this":Lcom/vkontakte/android/fragments/friends/FriendsListFragment;, "Lcom/vkontakte/android/fragments/friends/FriendsListFragment<TT;>;"
    const/4 v4, 0x0

    .line 422
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->mIndexer:Lcom/vkontakte/android/ui/util/AlphabetSegmenter;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/util/AlphabetSegmenter;->clear()V

    .line 423
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->requestUsers:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_4

    .line 424
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->mIndexer:Lcom/vkontakte/android/ui/util/AlphabetSegmenter;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->requestUsers:Ljava/util/ArrayList;

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    sget-object v2, Lcom/vkontakte/android/ui/util/AlphabetSegmenter;->IMPORTANT_SECTION_TITLE:Ljava/lang/CharSequence;

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/ui/util/AlphabetSegmenter;->addSection(Ljava/util/List;Ljava/lang/CharSequence;)V

    .line 428
    :cond_0
    :goto_0
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->mBuildIndex:Z

    if-nez v0, :cond_1

    invoke-direct {p0}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->canShowRequests()Z

    move-result v0

    if-nez v0, :cond_5

    .line 429
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->mIndexer:Lcom/vkontakte/android/ui/util/AlphabetSegmenter;

    new-instance v1, Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->data:Ljava/util/ArrayList;

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-static {p0}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$$Lambda$6;->lambdaFactory$(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;)Ljava/util/Comparator;

    move-result-object v2

    invoke-static {p0}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$$Lambda$7;->lambdaFactory$(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;)Lcom/vkontakte/android/ui/util/AlphabetSegmenter$Converter;

    move-result-object v3

    iget-boolean v5, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->mBuildImportant:Z

    if-eqz v5, :cond_2

    iget-object v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->data:Ljava/util/ArrayList;

    .line 441
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    const/4 v5, 0x5

    invoke-static {v4, v5}, Ljava/lang/Math;->min(II)I

    move-result v4

    :cond_2
    iget-boolean v5, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->mBuildIndex:Z

    .line 429
    invoke-virtual/range {v0 .. v5}, Lcom/vkontakte/android/ui/util/AlphabetSegmenter;->bind(Ljava/util/List;Ljava/util/Comparator;Lcom/vkontakte/android/ui/util/AlphabetSegmenter$Converter;IZ)V

    .line 446
    :goto_1
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->mSearchIndexer:Lcom/vkontakte/android/ui/util/SearchSegmenter;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/util/SearchSegmenter;->clear()V

    .line 447
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->mSearchIndexer:Lcom/vkontakte/android/ui/util/SearchSegmenter;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->data:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/util/SearchSegmenter;->bind(Ljava/util/List;)V

    .line 449
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->mBuildIndex:Z

    invoke-direct {p0, v0}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->setFastScrollerVisibility(Z)V

    .line 450
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->loaded:Z

    .line 452
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    if-eqz v0, :cond_3

    .line 453
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->updateDecorator()V

    .line 454
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->updateList()V

    .line 455
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->dataLoaded()V

    .line 456
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->refreshDone()V

    .line 458
    :cond_3
    return-void

    .line 425
    :cond_4
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->suggestUsers:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 426
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->mIndexer:Lcom/vkontakte/android/ui/util/AlphabetSegmenter;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->suggestUsers:Ljava/util/ArrayList;

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    sget-object v2, Lcom/vkontakte/android/ui/util/AlphabetSegmenter;->IMPORTANT_SECTION_TITLE:Ljava/lang/CharSequence;

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/ui/util/AlphabetSegmenter;->addSection(Ljava/util/List;Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 443
    :cond_5
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->mIndexer:Lcom/vkontakte/android/ui/util/AlphabetSegmenter;

    new-instance v1, Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->data:Ljava/util/ArrayList;

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    const-string/jumbo v2, ""

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/ui/util/AlphabetSegmenter;->addSection(Ljava/util/List;Ljava/lang/CharSequence;)V

    goto :goto_1
.end method

.method private updatePrimaryMenuItem()V
    .locals 3

    .prologue
    .line 561
    .local p0, "this":Lcom/vkontakte/android/fragments/friends/FriendsListFragment;, "Lcom/vkontakte/android/fragments/friends/FriendsListFragment<TT;>;"
    iget-object v1, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->primaryMenuItem:Landroid/view/MenuItem;

    if-eqz v1, :cond_0

    .line 562
    iget-object v1, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->mSelectedUsers:Landroid/util/SparseArray;

    invoke-virtual {v1}, Landroid/util/SparseArray;->size()I

    move-result v1

    if-lez v1, :cond_1

    const/4 v0, 0x1

    .line 563
    .local v0, "enabled":Z
    :goto_0
    iget-object v1, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->primaryMenuItem:Landroid/view/MenuItem;

    invoke-interface {v1, v0}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    .line 564
    iget-object v1, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->primaryMenuItem:Landroid/view/MenuItem;

    invoke-interface {v1}, Landroid/view/MenuItem;->getIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    if-eqz v0, :cond_2

    const/16 v1, 0xff

    :goto_1
    invoke-virtual {v2, v1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 566
    .end local v0    # "enabled":Z
    :cond_0
    return-void

    .line 562
    :cond_1
    const/4 v0, 0x0

    goto :goto_0

    .line 564
    .restart local v0    # "enabled":Z
    :cond_2
    const/16 v1, 0x64

    goto :goto_1
.end method

.method private updateSearchViewActionButton()V
    .locals 2

    .prologue
    .line 555
    .local p0, "this":Lcom/vkontakte/android/fragments/friends/FriendsListFragment;, "Lcom/vkontakte/android/fragments/friends/FriendsListFragment<TT;>;"
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->mSearchView:Lcom/vkontakte/android/ui/SearchViewWrapper;

    if-eqz v0, :cond_0

    .line 556
    iget-object v1, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->mSearchView:Lcom/vkontakte/android/ui/SearchViewWrapper;

    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->mSelectedUsers:Landroid/util/SparseArray;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->mSelectedUsers:Landroid/util/SparseArray;

    invoke-virtual {v0}, Landroid/util/SparseArray;->size()I

    move-result v0

    if-lez v0, :cond_1

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {v1, v0}, Lcom/vkontakte/android/ui/SearchViewWrapper;->setOnActionEnabled(Z)V

    .line 558
    :cond_0
    return-void

    .line 556
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public accept(Lcom/vkontakte/android/RequestUserProfile;ZI)V
    .locals 8
    .param p1, "request"    # Lcom/vkontakte/android/RequestUserProfile;
    .param p2, "agree"    # Z
    .param p3, "position"    # I

    .prologue
    .line 573
    .local p0, "this":Lcom/vkontakte/android/fragments/friends/FriendsListFragment;, "Lcom/vkontakte/android/fragments/friends/FriendsListFragment<TT;>;"
    invoke-static {}, Lcom/vkontakte/android/LongPollService;->getNumFriendRequests()I

    move-result v5

    .line 574
    .local v5, "curNumFriendRequests":I
    invoke-static {}, Lcom/vkontakte/android/LongPollService;->getNumFriendSuggestions()I

    move-result v6

    .line 575
    .local v6, "curNumFriendSuggestions":I
    if-eqz p2, :cond_0

    iget v0, p1, Lcom/vkontakte/android/RequestUserProfile;->uid:I

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vkontakte/android/api/friends/FriendsAdd;->createFriendsAddAndSendAllStats(ILjava/lang/String;)Lcom/vkontakte/android/api/friends/FriendsAdd;

    move-result-object v0

    .line 576
    :goto_0
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v7

    new-instance v0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$4;

    move-object v1, p0

    move-object v2, p0

    move-object v3, p1

    move v4, p2

    invoke-direct/range {v0 .. v6}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$4;-><init>(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;Landroid/app/Fragment;Lcom/vkontakte/android/RequestUserProfile;ZII)V

    .line 577
    invoke-virtual {v7, v0}, Lcom/vkontakte/android/api/VKAPIRequest;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 608
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 609
    return-void

    .line 575
    :cond_0
    new-instance v0, Lcom/vkontakte/android/api/friends/FriendsDelete;

    iget v1, p1, Lcom/vkontakte/android/RequestUserProfile;->uid:I

    invoke-direct {v0, v1}, Lcom/vkontakte/android/api/friends/FriendsDelete;-><init>(I)V

    goto :goto_0
.end method

.method protected createAdapter()Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vkontakte/android/fragments/base/SegmenterFragment",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">.GridAdapter<",
            "Lcom/vkontakte/android/UserProfile;",
            "*>;"
        }
    .end annotation

    .prologue
    .line 362
    .local p0, "this":Lcom/vkontakte/android/fragments/friends/FriendsListFragment;, "Lcom/vkontakte/android/fragments/friends/FriendsListFragment<TT;>;"
    new-instance v0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$Adapter;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$Adapter;-><init>(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;Lcom/vkontakte/android/fragments/friends/FriendsListFragment$1;)V

    return-object v0
.end method

.method protected doLoadData(II)V
    .locals 2
    .param p1, "offset"    # I
    .param p2, "count"    # I

    .prologue
    .line 356
    .local p0, "this":Lcom/vkontakte/android/fragments/friends/FriendsListFragment;, "Lcom/vkontakte/android/fragments/friends/FriendsListFragment<TT;>;"
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->preloader:Lme/grishka/appkit/utils/Preloader;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lme/grishka/appkit/utils/Preloader;->setMoreAvailable(Z)V

    .line 357
    const/4 v0, 0x1

    invoke-static {v0}, Lcom/vkontakte/android/data/Friends;->reload(Z)V

    .line 358
    return-void
.end method

.method protected getColumnsCount()I
    .locals 4

    .prologue
    .line 378
    .local p0, "this":Lcom/vkontakte/android/fragments/friends/FriendsListFragment;, "Lcom/vkontakte/android/fragments/friends/FriendsListFragment<TT;>;"
    iget-object v2, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v2}, Lme/grishka/appkit/views/UsableRecyclerView;->getWidth()I

    move-result v2

    iget-object v3, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v3}, Lme/grishka/appkit/views/UsableRecyclerView;->getPaddingLeft()I

    move-result v3

    sub-int/2addr v2, v3

    iget-object v3, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v3}, Lme/grishka/appkit/views/UsableRecyclerView;->getPaddingRight()I

    move-result v3

    sub-int v1, v2, v3

    .line 379
    .local v1, "listWidth":I
    iget v2, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->scrW:I

    const/16 v3, 0x258

    if-lt v2, v3, :cond_1

    iget-boolean v2, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->isTablet:Z

    if-eqz v2, :cond_0

    const/high16 v2, 0x43200000    # 160.0f

    invoke-static {v2}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v0

    .line 380
    .local v0, "columnWidth":I
    :goto_0
    div-int v2, v1, v0

    return v2

    .line 379
    .end local v0    # "columnWidth":I
    :cond_0
    const/high16 v2, 0x43870000    # 270.0f

    invoke-static {v2}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v0

    goto :goto_0

    :cond_1
    move v0, v1

    goto :goto_0
.end method

.method protected getColumnsCount(I)I
    .locals 4
    .param p1, "position"    # I

    .prologue
    .line 367
    .local p0, "this":Lcom/vkontakte/android/fragments/friends/FriendsListFragment;, "Lcom/vkontakte/android/fragments/friends/FriendsListFragment<TT;>;"
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->getAdapter()Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;

    move-result-object v2

    invoke-virtual {v2, p1}, Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;->getItemViewType(I)I

    move-result v1

    .line 368
    .local v1, "type":I
    iget-boolean v2, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->isTablet:Z

    if-eqz v2, :cond_1

    const/4 v2, 0x3

    if-eq v1, v2, :cond_0

    const/4 v2, 0x4

    if-ne v1, v2, :cond_1

    .line 369
    :cond_0
    iget-object v2, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v2}, Lme/grishka/appkit/views/UsableRecyclerView;->getWidth()I

    move-result v2

    iget-object v3, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v3}, Lme/grishka/appkit/views/UsableRecyclerView;->getPaddingLeft()I

    move-result v3

    sub-int/2addr v2, v3

    iget-object v3, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v3}, Lme/grishka/appkit/views/UsableRecyclerView;->getPaddingRight()I

    move-result v3

    sub-int v0, v2, v3

    .line 370
    .local v0, "listWidth":I
    const/high16 v2, 0x43870000    # 270.0f

    invoke-static {v2}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v2

    div-int v2, v0, v2

    .line 372
    .end local v0    # "listWidth":I
    :goto_0
    return v2

    :cond_1
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->getColumnsCount()I

    move-result v2

    goto :goto_0
.end method

.method protected getSegmenter()Lcom/vkontakte/android/ui/util/Segmenter;
    .locals 1

    .prologue
    .line 227
    .local p0, "this":Lcom/vkontakte/android/fragments/friends/FriendsListFragment;, "Lcom/vkontakte/android/fragments/friends/FriendsListFragment<TT;>;"
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->mSearchMode:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->mSearchIndexer:Lcom/vkontakte/android/ui/util/SearchSegmenter;

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->mIndexer:Lcom/vkontakte/android/ui/util/AlphabetSegmenter;

    goto :goto_0
.end method

.method synthetic lambda$new$0(Lcom/vkontakte/android/UserProfile;)V
    .locals 1
    .param p1, "profile"    # Lcom/vkontakte/android/UserProfile;

    .prologue
    .line 135
    .local p0, "this":Lcom/vkontakte/android/fragments/friends/FriendsListFragment;, "Lcom/vkontakte/android/fragments/friends/FriendsListFragment<TT;>;"
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->mSelectionListener:Lcom/vkontakte/android/functions/VoidF1;

    if-eqz v0, :cond_0

    .line 136
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->mSelectionListener:Lcom/vkontakte/android/functions/VoidF1;

    invoke-interface {v0, p1}, Lcom/vkontakte/android/functions/VoidF1;->f(Ljava/lang/Object;)V

    .line 140
    :goto_0
    return-void

    .line 138
    :cond_0
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->openUserDetails(Lcom/vkontakte/android/UserProfile;)V

    goto :goto_0
.end method

.method synthetic lambda$new$1(Lcom/vkontakte/android/UserProfile;Z)V
    .locals 2
    .param p1, "profile"    # Lcom/vkontakte/android/UserProfile;
    .param p2, "checked"    # Z

    .prologue
    .line 142
    .local p0, "this":Lcom/vkontakte/android/fragments/friends/FriendsListFragment;, "Lcom/vkontakte/android/fragments/friends/FriendsListFragment<TT;>;"
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->mMultiselectListener:Lcom/vkontakte/android/functions/VoidF1;

    if-eqz v0, :cond_2

    .line 143
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->mSelectedUsers:Landroid/util/SparseArray;

    if-nez v0, :cond_0

    .line 144
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->mSelectedUsers:Landroid/util/SparseArray;

    .line 146
    :cond_0
    if-eqz p2, :cond_3

    .line 147
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->mSelectedUsers:Landroid/util/SparseArray;

    iget v1, p1, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-virtual {v0, v1, p1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 151
    :goto_0
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->searchExpanded:Z

    if-nez v0, :cond_1

    .line 152
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->updateActionMode()V

    .line 154
    :cond_1
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->updateSearchViewActionButton()V

    .line 155
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->getAdapter()Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;->notifyDataSetChanged()V

    .line 157
    :cond_2
    return-void

    .line 149
    :cond_3
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->mSelectedUsers:Landroid/util/SparseArray;

    iget v1, p1, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->remove(I)V

    goto :goto_0
.end method

.method synthetic lambda$scrollToTop$4()V
    .locals 2

    .prologue
    .line 467
    .local p0, "this":Lcom/vkontakte/android/fragments/friends/FriendsListFragment;, "Lcom/vkontakte/android/fragments/friends/FriendsListFragment<TT;>;"
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    if-eqz v0, :cond_0

    .line 468
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lme/grishka/appkit/views/UsableRecyclerView;->scrollToPosition(I)V

    .line 470
    :cond_0
    return-void
.end method

.method synthetic lambda$setSearchView$5(Landroid/view/View;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 513
    .local p0, "this":Lcom/vkontakte/android/fragments/friends/FriendsListFragment;, "Lcom/vkontakte/android/fragments/friends/FriendsListFragment<TT;>;"
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->mMultiselectListener:Lcom/vkontakte/android/functions/VoidF1;

    if-eqz v0, :cond_0

    .line 514
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->mMultiselectListener:Lcom/vkontakte/android/functions/VoidF1;

    invoke-direct {p0}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->releaseSelected()Ljava/util/ArrayList;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/vkontakte/android/functions/VoidF1;->f(Ljava/lang/Object;)V

    .line 516
    :cond_0
    return-void
.end method

.method synthetic lambda$setSearchView$6(Z)V
    .locals 4
    .param p1, "expanded"    # Z

    .prologue
    .line 518
    .local p0, "this":Lcom/vkontakte/android/fragments/friends/FriendsListFragment;, "Lcom/vkontakte/android/fragments/friends/FriendsListFragment<TT;>;"
    if-nez p1, :cond_1

    const/4 v0, 0x1

    :goto_0
    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->clearOnDestroyAction:Z

    .line 519
    iput-boolean p1, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->searchExpanded:Z

    .line 520
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->updateSearchViewActionButton()V

    .line 521
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->mSelectedUsers:Landroid/util/SparseArray;

    if-eqz v0, :cond_0

    .line 522
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->updatePrimaryMenuItem()V

    .line 523
    if-eqz p1, :cond_2

    .line 524
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->getAdapter()Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;->notifyDataSetChanged()V

    .line 529
    :cond_0
    :goto_1
    return-void

    .line 518
    :cond_1
    const/4 v0, 0x0

    goto :goto_0

    .line 526
    :cond_2
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-static {p0}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$$Lambda$11;->lambdaFactory$(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;)Ljava/lang/Runnable;

    move-result-object v1

    const-wide/16 v2, 0x64

    invoke-virtual {v0, v1, v2, v3}, Lme/grishka/appkit/views/UsableRecyclerView;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_1
.end method

.method synthetic lambda$updateData$2(Lcom/vkontakte/android/UserProfile;Lcom/vkontakte/android/UserProfile;)I
    .locals 4
    .param p1, "lhs"    # Lcom/vkontakte/android/UserProfile;
    .param p2, "rhs"    # Lcom/vkontakte/android/UserProfile;

    .prologue
    .local p0, "this":Lcom/vkontakte/android/fragments/friends/FriendsListFragment;, "Lcom/vkontakte/android/fragments/friends/FriendsListFragment<TT;>;"
    const/16 v3, 0x20

    .line 430
    iget v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->sortPref:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 431
    iget-object v0, p1, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    iget-object v1, p2, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    .line 433
    :goto_0
    return v0

    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p1, Lcom/vkontakte/android/UserProfile;->lastName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p1, Lcom/vkontakte/android/UserProfile;->firstName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p2, Lcom/vkontakte/android/UserProfile;->lastName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p2, Lcom/vkontakte/android/UserProfile;->firstName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    goto :goto_0
.end method

.method synthetic lambda$updateData$3(Lcom/vkontakte/android/UserProfile;)C
    .locals 4
    .param p1, "from"    # Lcom/vkontakte/android/UserProfile;

    .prologue
    .local p0, "this":Lcom/vkontakte/android/fragments/friends/FriendsListFragment;, "Lcom/vkontakte/android/fragments/friends/FriendsListFragment<TT;>;"
    const/16 v0, 0x20

    const/4 v3, 0x0

    .line 436
    iget v1, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->sortPref:I

    const/4 v2, 0x2

    if-ne v1, v2, :cond_1

    .line 437
    iget-object v1, p1, Lcom/vkontakte/android/UserProfile;->lastName:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    :goto_0
    invoke-static {v0}, Ljava/lang/Character;->toUpperCase(C)C

    move-result v0

    .line 439
    :goto_1
    return v0

    .line 437
    :cond_0
    iget-object v0, p1, Lcom/vkontakte/android/UserProfile;->lastName:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v0

    goto :goto_0

    .line 439
    :cond_1
    iget-object v1, p1, Lcom/vkontakte/android/UserProfile;->firstName:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_2

    :goto_2
    invoke-static {v0}, Ljava/lang/Character;->toUpperCase(C)C

    move-result v0

    goto :goto_1

    :cond_2
    iget-object v0, p1, Lcom/vkontakte/android/UserProfile;->firstName:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v0

    goto :goto_2
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 7
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 175
    .local p0, "this":Lcom/vkontakte/android/fragments/friends/FriendsListFragment;, "Lcom/vkontakte/android/fragments/friends/FriendsListFragment<TT;>;"
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/base/SegmenterFragment;->onCreate(Landroid/os/Bundle;)V

    .line 176
    const/4 v3, 0x1

    invoke-virtual {p0, v3}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->setRefreshEnabled(Z)V

    .line 177
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v3

    const-string/jumbo v4, "uid"

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v5

    invoke-virtual {v5}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v5

    invoke-virtual {v3, v4, v5}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v1

    .line 178
    .local v1, "uid":I
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v3

    const-string/jumbo v4, "listen_updates"

    invoke-virtual {v3, v4}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v2

    .line 179
    .local v2, "updates":Z
    if-eqz v2, :cond_1

    if-eqz v1, :cond_0

    invoke-static {v1}, Lcom/vkontakte/android/auth/VKAccountManager;->isCurrentUser(I)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 180
    :cond_0
    new-instance v0, Landroid/content/IntentFilter;

    const-string/jumbo v3, "com.vkontakte.android.FRIEND_REQUESTS_CHANGED"

    invoke-direct {v0, v3}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 181
    .local v0, "filter":Landroid/content/IntentFilter;
    sget-object v3, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    iget-object v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->receiver:Landroid/content/BroadcastReceiver;

    const-string/jumbo v5, "com.vkontakte.android.permission.ACCESS_DATA"

    const/4 v6, 0x0

    invoke-virtual {v3, v4, v0, v5, v6}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;)Landroid/content/Intent;

    .line 183
    .end local v0    # "filter":Landroid/content/IntentFilter;
    :cond_1
    return-void
.end method

.method protected onCreateCardDecorator()Lcom/vkontakte/android/ui/recyclerview/CardItemDecoration;
    .locals 11

    .prologue
    .local p0, "this":Lcom/vkontakte/android/fragments/friends/FriendsListFragment;, "Lcom/vkontakte/android/fragments/friends/FriendsListFragment<TT;>;"
    const/4 v4, 0x0

    const/4 v5, 0x1

    const/4 v6, 0x0

    const/high16 v10, 0x41000000    # 8.0f

    .line 196
    iget-object v7, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    if-nez v7, :cond_0

    move-object v0, v4

    .line 221
    :goto_0
    return-object v0

    .line 198
    :cond_0
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->canShowRequests()Z

    move-result v7

    if-eqz v7, :cond_5

    .line 199
    new-instance v7, Lcom/vkontakte/android/ui/recyclerview/CardItemDecoration;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->getAdapter()Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;

    move-result-object v8

    iget-boolean v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->isTablet:Z

    if-nez v4, :cond_2

    move v4, v5

    :goto_1
    invoke-direct {v7, v8, v4}, Lcom/vkontakte/android/ui/recyclerview/CardItemDecoration;-><init>(Lcom/vkontakte/android/ui/recyclerview/CardItemDecoration$Provider;Z)V

    const/high16 v4, 0x41800000    # 16.0f

    invoke-static {v4}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v4

    invoke-virtual {v7, v4}, Lcom/vkontakte/android/ui/recyclerview/CardItemDecoration;->setCardsSpacing(I)Lcom/vkontakte/android/ui/recyclerview/CardItemDecoration;

    move-result-object v0

    .line 201
    .local v0, "decorator":Lcom/vkontakte/android/ui/recyclerview/CardItemDecoration;
    iget-boolean v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->isTablet:Z

    if-eqz v4, :cond_3

    iget v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->scrW:I

    const/16 v7, 0x258

    if-lt v4, v7, :cond_3

    .line 202
    const/high16 v4, 0x41400000    # 12.0f

    invoke-static {v4}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v2

    .line 207
    .local v2, "padding":I
    :goto_2
    iget v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->scrW:I

    const/16 v7, 0x39c

    if-lt v4, v7, :cond_4

    const/16 v4, 0x10

    iget v7, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->scrW:I

    add-int/lit16 v7, v7, -0x348

    add-int/lit8 v7, v7, -0x54

    div-int/lit8 v7, v7, 0x2

    invoke-static {v4, v7}, Ljava/lang/Math;->max(II)I

    move-result v4

    int-to-float v4, v4

    invoke-static {v4}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v1

    .line 208
    .local v1, "margin":I
    :goto_3
    iget-object v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    add-int v7, v1, v2

    invoke-static {v10}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v8

    add-int v9, v1, v2

    invoke-virtual {v4, v7, v8, v9, v2}, Lme/grishka/appkit/views/UsableRecyclerView;->setPadding(IIII)V

    .line 209
    iget-object v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->bottomDividerDecoration:Lcom/vkontakte/android/ui/recyclerview/BottomDividerDecoration;

    if-nez v4, :cond_1

    .line 210
    new-instance v4, Lcom/vkontakte/android/ui/recyclerview/BottomDividerDecoration;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->getAdapter()Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;

    move-result-object v7

    const/high16 v8, 0x3f000000    # 0.5f

    invoke-static {v8}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v8

    invoke-static {v5, v8}, Ljava/lang/Math;->max(II)I

    move-result v5

    const/high16 v8, 0xf000000

    invoke-static {v10}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v9

    invoke-direct {v4, v7, v5, v8, v9}, Lcom/vkontakte/android/ui/recyclerview/BottomDividerDecoration;-><init>(Lcom/vkontakte/android/ui/recyclerview/BottomDividerDecoration$Provider;III)V

    iput-object v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->bottomDividerDecoration:Lcom/vkontakte/android/ui/recyclerview/BottomDividerDecoration;

    .line 211
    iget-object v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    iget-object v5, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->bottomDividerDecoration:Lcom/vkontakte/android/ui/recyclerview/BottomDividerDecoration;

    invoke-virtual {v4, v5}, Lme/grishka/appkit/views/UsableRecyclerView;->addItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    .line 213
    :cond_1
    iget-object v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->bottomDividerDecoration:Lcom/vkontakte/android/ui/recyclerview/BottomDividerDecoration;

    invoke-virtual {v4, v1, v1}, Lcom/vkontakte/android/ui/recyclerview/BottomDividerDecoration;->setPadding(II)Lcom/vkontakte/android/ui/recyclerview/BottomDividerDecoration;

    .line 214
    invoke-static {v10}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v4

    invoke-virtual {v0, v2, v6, v2, v4}, Lcom/vkontakte/android/ui/recyclerview/CardItemDecoration;->setPadding(IIII)Lcom/vkontakte/android/ui/recyclerview/CardItemDecoration;

    goto/16 :goto_0

    .end local v0    # "decorator":Lcom/vkontakte/android/ui/recyclerview/CardItemDecoration;
    .end local v1    # "margin":I
    .end local v2    # "padding":I
    :cond_2
    move v4, v6

    .line 199
    goto :goto_1

    .line 204
    .restart local v0    # "decorator":Lcom/vkontakte/android/ui/recyclerview/CardItemDecoration;
    :cond_3
    const/4 v2, 0x0

    .restart local v2    # "padding":I
    goto :goto_2

    :cond_4
    move v1, v6

    .line 207
    goto :goto_3

    .line 217
    .end local v0    # "decorator":Lcom/vkontakte/android/ui/recyclerview/CardItemDecoration;
    .end local v2    # "padding":I
    :cond_5
    new-instance v0, Lcom/vkontakte/android/ui/recyclerview/CardItemDecoration;

    iget-boolean v7, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->isTablet:Z

    if-nez v7, :cond_6

    :goto_4
    invoke-direct {v0, v4, v5}, Lcom/vkontakte/android/ui/recyclerview/CardItemDecoration;-><init>(Lcom/vkontakte/android/ui/recyclerview/CardItemDecoration$Provider;Z)V

    .line 218
    .restart local v0    # "decorator":Lcom/vkontakte/android/ui/recyclerview/CardItemDecoration;
    invoke-static {v10}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v3

    .line 219
    .local v3, "paddingTop":I
    iget-object v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    iget v5, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->margin:I

    iget v6, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->padding:I

    add-int/2addr v5, v6

    iget v6, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->margin:I

    iget v7, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->padding:I

    add-int/2addr v6, v7

    iget v7, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->padding:I

    invoke-virtual {v4, v5, v3, v6, v7}, Lme/grishka/appkit/views/UsableRecyclerView;->setPadding(IIII)V

    .line 220
    iget v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->padding:I

    iget v5, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->padding:I

    iget v6, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->padding:I

    invoke-virtual {v0, v4, v3, v5, v6}, Lcom/vkontakte/android/ui/recyclerview/CardItemDecoration;->setPadding(IIII)Lcom/vkontakte/android/ui/recyclerview/CardItemDecoration;

    goto/16 :goto_0

    .end local v0    # "decorator":Lcom/vkontakte/android/ui/recyclerview/CardItemDecoration;
    .end local v3    # "paddingTop":I
    :cond_6
    move v5, v6

    .line 217
    goto :goto_4
.end method

.method public onDestroy()V
    .locals 2

    .prologue
    .line 187
    .local p0, "this":Lcom/vkontakte/android/fragments/friends/FriendsListFragment;, "Lcom/vkontakte/android/fragments/friends/FriendsListFragment<TT;>;"
    invoke-super {p0}, Lcom/vkontakte/android/fragments/base/SegmenterFragment;->onDestroy()V

    .line 189
    :try_start_0
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->receiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 192
    :goto_0
    return-void

    .line 190
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 3
    .param p1, "state"    # Landroid/os/Bundle;

    .prologue
    .line 249
    .local p0, "this":Lcom/vkontakte/android/fragments/friends/FriendsListFragment;, "Lcom/vkontakte/android/fragments/friends/FriendsListFragment<TT;>;"
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/base/SegmenterFragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 250
    iget-object v2, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->mSelectedUsers:Landroid/util/SparseArray;

    if-eqz v2, :cond_1

    .line 251
    iget-object v2, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->mSelectedUsers:Landroid/util/SparseArray;

    invoke-virtual {v2}, Landroid/util/SparseArray;->size()I

    move-result v2

    new-array v1, v2, [I

    .line 252
    .local v1, "selectedUsers":[I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v2, v1

    if-ge v0, v2, :cond_0

    .line 253
    iget-object v2, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->mSelectedUsers:Landroid/util/SparseArray;

    invoke-virtual {v2, v0}, Landroid/util/SparseArray;->keyAt(I)I

    move-result v2

    aput v2, v1, v0

    .line 252
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 255
    :cond_0
    const-string/jumbo v2, "selectedUsers"

    invoke-virtual {p1, v2, v1}, Landroid/os/Bundle;->putIntArray(Ljava/lang/String;[I)V

    .line 257
    .end local v0    # "i":I
    .end local v1    # "selectedUsers":[I
    :cond_1
    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 3
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 232
    .local p0, "this":Lcom/vkontakte/android/fragments/friends/FriendsListFragment;, "Lcom/vkontakte/android/fragments/friends/FriendsListFragment<TT;>;"
    invoke-super {p0, p1, p2}, Lcom/vkontakte/android/fragments/base/SegmenterFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 233
    const v0, 0x7f100290

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/ui/recyclerview/FastScroller;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->fastScroller:Lcom/vkontakte/android/ui/recyclerview/FastScroller;

    .line 234
    iget-object v1, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->fastScroller:Lcom/vkontakte/android/ui/recyclerview/FastScroller;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    const v0, 0x7f1002b8

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v1, v2, v0}, Lcom/vkontakte/android/ui/recyclerview/FastScroller;->setup(Landroid/support/v7/widget/RecyclerView;Landroid/widget/TextView;)V

    .line 235
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->mSearchIndexer:Lcom/vkontakte/android/ui/util/SearchSegmenter;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/util/SearchSegmenter;->attach(Landroid/support/v7/widget/RecyclerView;)V

    .line 236
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->updateList()V

    .line 237
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->loaded:Z

    if-eqz v0, :cond_0

    .line 238
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->dataLoaded()V

    .line 240
    :cond_0
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->mFastScrollerVisibility:Z

    invoke-direct {p0, v0}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->setFastScrollerVisibility(Z)V

    .line 241
    invoke-direct {p0, p2}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->restoreSelection(Landroid/os/Bundle;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 242
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->restoreSelection(Landroid/os/Bundle;)Z

    .line 244
    :cond_1
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->updateDecorator()V

    .line 245
    return-void
.end method

.method public openUserDetails(Lcom/vkontakte/android/UserProfile;)V
    .locals 2
    .param p1, "profile"    # Lcom/vkontakte/android/UserProfile;

    .prologue
    .line 497
    .local p0, "this":Lcom/vkontakte/android/fragments/friends/FriendsListFragment;, "Lcom/vkontakte/android/fragments/friends/FriendsListFragment<TT;>;"
    new-instance v0, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;

    iget v1, p1, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-direct {v0, v1}, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;-><init>(I)V

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;->go(Landroid/content/Context;)Z

    .line 498
    return-void
.end method

.method public scrollToTop()V
    .locals 4

    .prologue
    .line 466
    .local p0, "this":Lcom/vkontakte/android/fragments/friends/FriendsListFragment;, "Lcom/vkontakte/android/fragments/friends/FriendsListFragment<TT;>;"
    invoke-static {p0}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$$Lambda$8;->lambdaFactory$(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;)Ljava/lang/Runnable;

    move-result-object v0

    const-wide/16 v2, 0x64

    invoke-static {v0, v2, v3}, Lcom/vkontakte/android/ViewUtils;->postDelayed(Ljava/lang/Runnable;J)V

    .line 471
    return-void
.end method

.method public setData(Ljava/util/List;Ljava/util/List;Ljava/util/List;ZZ)V
    .locals 8
    .param p4, "buildIndex"    # Z
    .param p5, "createImportantSection"    # Z
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
            ">;ZZ)V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/vkontakte/android/fragments/friends/FriendsListFragment;, "Lcom/vkontakte/android/fragments/friends/FriendsListFragment<TT;>;"
    .local p1, "data":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/UserProfile;>;"
    .local p2, "requestUsers":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/RequestUserProfile;>;"
    .local p3, "suggestUsers":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/RequestUserProfile;>;"
    const/4 v4, 0x0

    const/4 v5, 0x1

    .line 389
    iput-boolean v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->mSearchMode:Z

    .line 390
    iput-boolean p5, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->mBuildImportant:Z

    .line 391
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v6

    if-le v6, v5, :cond_0

    if-eqz p4, :cond_0

    iget v6, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->sortPref:I

    if-eqz v6, :cond_0

    move v4, v5

    :cond_0
    iput-boolean v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->mBuildIndex:Z

    .line 393
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 394
    .local v1, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/vkontakte/android/UserProfile;>;"
    :cond_1
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 395
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/UserProfile;

    .line 396
    .local v0, "_profile":Lcom/vkontakte/android/UserProfile;
    if-nez v0, :cond_1

    .line 397
    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    goto :goto_0

    .line 401
    .end local v0    # "_profile":Lcom/vkontakte/android/UserProfile;
    :cond_2
    iget-object v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->requestUsers:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->clear()V

    .line 402
    iget-object v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->suggestUsers:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->clear()V

    .line 403
    iget-object v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->requestUsers:Ljava/util/ArrayList;

    invoke-virtual {v4, p2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 404
    iget-object v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->suggestUsers:Ljava/util/ArrayList;

    invoke-virtual {v4, p3}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 406
    iget-object v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->data:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->clear()V

    .line 407
    iget-object v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->data:Ljava/util/ArrayList;

    invoke-virtual {v4, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 408
    iget-object v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->mSelectedUsers:Landroid/util/SparseArray;

    if-eqz v4, :cond_4

    iget-object v4, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->mSelectedUsers:Landroid/util/SparseArray;

    invoke-virtual {v4}, Landroid/util/SparseArray;->size()I

    move-result v4

    if-lez v4, :cond_4

    .line 409
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_3
    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_4

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/vkontakte/android/UserProfile;

    .line 410
    .local v3, "userProfile":Lcom/vkontakte/android/UserProfile;
    iget-object v6, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->mSelectedUsers:Landroid/util/SparseArray;

    iget v7, v3, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-virtual {v6, v7}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/UserProfile;

    .line 411
    .local v2, "selectedUser":Lcom/vkontakte/android/UserProfile;
    if-eqz v2, :cond_3

    .line 412
    iput-boolean v5, v3, Lcom/vkontakte/android/UserProfile;->isSelected:Z

    .line 413
    iget-object v6, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->mSelectedUsers:Landroid/util/SparseArray;

    iget v7, v3, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-virtual {v6, v7, v3}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto :goto_1

    .line 418
    .end local v2    # "selectedUser":Lcom/vkontakte/android/UserProfile;
    .end local v3    # "userProfile":Lcom/vkontakte/android/UserProfile;
    :cond_4
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->updateData()V

    .line 419
    return-void
.end method

.method public setData(Ljava/util/List;ZZ)V
    .locals 6
    .param p2, "buildIndex"    # Z
    .param p3, "createImportantSection"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;ZZ)V"
        }
    .end annotation

    .prologue
    .line 384
    .local p0, "this":Lcom/vkontakte/android/fragments/friends/FriendsListFragment;, "Lcom/vkontakte/android/fragments/friends/FriendsListFragment<TT;>;"
    .local p1, "data":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/UserProfile;>;"
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v2

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v3

    move-object v0, p0

    move-object v1, p1

    move v4, p2

    move v5, p3

    invoke-virtual/range {v0 .. v5}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->setData(Ljava/util/List;Ljava/util/List;Ljava/util/List;ZZ)V

    .line 385
    return-void
.end method

.method public setGlobalSearch(Z)V
    .locals 0
    .param p1, "enabled"    # Z

    .prologue
    .line 501
    .local p0, "this":Lcom/vkontakte/android/fragments/friends/FriendsListFragment;, "Lcom/vkontakte/android/fragments/friends/FriendsListFragment<TT;>;"
    iput-boolean p1, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->mGlobalSearchEnabled:Z

    .line 502
    return-void
.end method

.method public setMultiselectListener(Lcom/vkontakte/android/functions/VoidF1;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vkontakte/android/functions/VoidF1",
            "<",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;>;)V"
        }
    .end annotation

    .prologue
    .line 505
    .local p0, "this":Lcom/vkontakte/android/fragments/friends/FriendsListFragment;, "Lcom/vkontakte/android/fragments/friends/FriendsListFragment<TT;>;"
    .local p1, "multiselectListener":Lcom/vkontakte/android/functions/VoidF1;, "Lcom/vkontakte/android/functions/VoidF1<Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;>;"
    iput-object p1, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->mMultiselectListener:Lcom/vkontakte/android/functions/VoidF1;

    .line 506
    return-void
.end method

.method public setPrimaryMenuItem(Landroid/view/MenuItem;)V
    .locals 0
    .param p1, "primaryMenuItem"    # Landroid/view/MenuItem;

    .prologue
    .line 533
    .local p0, "this":Lcom/vkontakte/android/fragments/friends/FriendsListFragment;, "Lcom/vkontakte/android/fragments/friends/FriendsListFragment<TT;>;"
    iput-object p1, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->primaryMenuItem:Landroid/view/MenuItem;

    .line 534
    return-void
.end method

.method public setSearchView(Lcom/vkontakte/android/ui/SearchViewWrapper;)V
    .locals 2
    .param p1, "searchView"    # Lcom/vkontakte/android/ui/SearchViewWrapper;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .local p0, "this":Lcom/vkontakte/android/fragments/friends/FriendsListFragment;, "Lcom/vkontakte/android/fragments/friends/FriendsListFragment<TT;>;"
    const/4 v1, 0x1

    .line 509
    iput-object p1, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->mSearchView:Lcom/vkontakte/android/ui/SearchViewWrapper;

    .line 510
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->mSearchView:Lcom/vkontakte/android/ui/SearchViewWrapper;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/SearchViewWrapper;->setShowVoiceOnEmpty(Z)V

    .line 511
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->mSearchView:Lcom/vkontakte/android/ui/SearchViewWrapper;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/SearchViewWrapper;->setOnActionVisible(Z)V

    .line 512
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->mSearchView:Lcom/vkontakte/android/ui/SearchViewWrapper;

    invoke-static {p0}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$$Lambda$9;->lambdaFactory$(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;)Landroid/view/View$OnClickListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/SearchViewWrapper;->setOnActionClickListener(Landroid/view/View$OnClickListener;)V

    .line 517
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->mSearchView:Lcom/vkontakte/android/ui/SearchViewWrapper;

    invoke-static {p0}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment$$Lambda$10;->lambdaFactory$(Lcom/vkontakte/android/fragments/friends/FriendsListFragment;)Lcom/vkontakte/android/ui/SearchViewWrapper$ViewStateListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/SearchViewWrapper;->setStateListener(Lcom/vkontakte/android/ui/SearchViewWrapper$ViewStateListener;)V

    .line 530
    return-void
.end method

.method public setSelectionListener(Lcom/vkontakte/android/functions/VoidF1;)Lcom/vkontakte/android/fragments/friends/FriendsListFragment;
    .locals 0
    .param p1    # Lcom/vkontakte/android/functions/VoidF1;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vkontakte/android/functions/VoidF1",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;)",
            "Lcom/vkontakte/android/fragments/friends/FriendsListFragment;"
        }
    .end annotation

    .prologue
    .line 461
    .local p0, "this":Lcom/vkontakte/android/fragments/friends/FriendsListFragment;, "Lcom/vkontakte/android/fragments/friends/FriendsListFragment<TT;>;"
    .local p1, "l":Lcom/vkontakte/android/functions/VoidF1;, "Lcom/vkontakte/android/functions/VoidF1<Lcom/vkontakte/android/UserProfile;>;"
    iput-object p1, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->mSelectionListener:Lcom/vkontakte/android/functions/VoidF1;

    .line 462
    return-object p0
.end method

.method public setTotalRequests(I)V
    .locals 2
    .param p1, "count"    # I

    .prologue
    .line 537
    .local p0, "this":Lcom/vkontakte/android/fragments/friends/FriendsListFragment;, "Lcom/vkontakte/android/fragments/friends/FriendsListFragment<TT;>;"
    iput p1, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->totalRequests:I

    .line 538
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->isAdded()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->canShowRequests()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->mSearchMode:Z

    if-nez v0, :cond_0

    .line 539
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->getAdapter()Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;->notifyItemChanged(I)V

    .line 541
    :cond_0
    return-void
.end method

.method public updateFilter(Ljava/lang/String;)V
    .locals 3
    .param p1, "query"    # Ljava/lang/String;

    .prologue
    .local p0, "this":Lcom/vkontakte/android/fragments/friends/FriendsListFragment;, "Lcom/vkontakte/android/fragments/friends/FriendsListFragment<TT;>;"
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 474
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 475
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->mSearchMode:Z

    if-nez v0, :cond_0

    .line 476
    iput-boolean v2, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->mSearchMode:Z

    .line 477
    invoke-virtual {p0, v1}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->setRefreshEnabled(Z)V

    .line 478
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->updateDecorator()V

    .line 479
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->updateList()V

    .line 480
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->updateSearchViewActionButton()V

    .line 481
    invoke-direct {p0, v1}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->setFastScrollerVisibility(Z)V

    .line 483
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->mSearchIndexer:Lcom/vkontakte/android/ui/util/SearchSegmenter;

    iget-boolean v1, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->mGlobalSearchEnabled:Z

    invoke-virtual {v0, p1, v1}, Lcom/vkontakte/android/ui/util/SearchSegmenter;->search(Ljava/lang/String;Z)V

    .line 494
    :cond_1
    :goto_0
    return-void

    .line 485
    :cond_2
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->mSearchMode:Z

    if-eqz v0, :cond_1

    .line 486
    iput-boolean v1, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->mSearchMode:Z

    .line 487
    invoke-virtual {p0, v2}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->setRefreshEnabled(Z)V

    .line 488
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->updateDecorator()V

    .line 489
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->updateList()V

    .line 490
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->updateSearchViewActionButton()V

    .line 491
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->mBuildIndex:Z

    invoke-direct {p0, v0}, Lcom/vkontakte/android/fragments/friends/FriendsListFragment;->setFastScrollerVisibility(Z)V

    goto :goto_0
.end method
