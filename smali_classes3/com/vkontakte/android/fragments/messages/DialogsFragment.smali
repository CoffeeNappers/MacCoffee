.class public Lcom/vkontakte/android/fragments/messages/DialogsFragment;
.super Lcom/vkontakte/android/fragments/VKToolbarFragment;
.source "DialogsFragment.java"

# interfaces
.implements Lcom/vkontakte/android/fragments/BackListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/fragments/messages/DialogsFragment$SelectionListener;,
        Lcom/vkontakte/android/fragments/messages/DialogsFragment$DialogsAdapter;,
        Lcom/vkontakte/android/fragments/messages/DialogsFragment$Builder;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z

.field private static final REQ_CREATE_CHAT:I = 0x143

.field private static final REQ_SELECT_USER:I = 0x141

.field private static final REQ_SELECT_USERS:I = 0x142

.field private static final TEXTS:[I


# instance fields
.field private adapter:Lcom/vkontakte/android/fragments/messages/DialogsFragment$DialogsAdapter;

.field private contentWrap:Landroid/widget/FrameLayout;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private dataLoading:Z

.field private displayItems:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/DialogEntry;",
            ">;"
        }
    .end annotation
.end field

.field private dlgs:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/DialogEntry;",
            ">;"
        }
    .end annotation
.end field

.field private emptyView:Landroid/view/View;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private error:Lcom/vkontakte/android/ui/ErrorViewHelper;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private floatingActionButton:Landroid/support/design/widget/FloatingActionButton;

.field private footerView:Lcom/vkontakte/android/ui/LoadMoreFooterView;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private isSearchExpanded:Z

.field private list:Lme/grishka/appkit/views/UsableRecyclerView;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private moreAvailable:Z

.field private progress:Landroid/widget/ProgressBar;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private receiver:Landroid/content/BroadcastReceiver;

.field public searchQuery:Ljava/lang/String;

.field private searchResults:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/DialogEntry;",
            ">;"
        }
    .end annotation
.end field

.field private searchView:Lcom/vkontakte/android/ui/SearchViewWrapper;

.field public selListener:Lcom/vkontakte/android/fragments/messages/DialogsFragment$SelectionListener;

.field private selectedTempUsers:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;"
        }
    .end annotation
.end field

.field private suggester:Lcom/vkontakte/android/ui/MessagesSearchSuggestionsPopup;

.field private title:Ljava/lang/CharSequence;

.field private toolbarStatePanel:Landroid/view/View;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private toolbarStatePanelProgress:Landroid/widget/ProgressBar;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private toolbarStatePanelText:Landroid/widget/TextView;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 60
    const-class v0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->$assertionsDisabled:Z

    .line 78
    const/4 v0, 0x4

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->TEXTS:[I

    return-void

    .line 60
    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    .line 78
    :array_0
    .array-data 4
        0x7f0806ba
        0x7f0806bb
        0x7f0806b9
        0x7f0806b8
    .end array-data
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 60
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/VKToolbarFragment;-><init>()V

    .line 81
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->dlgs:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->searchResults:Ljava/util/ArrayList;

    .line 82
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->selectedTempUsers:Ljava/util/ArrayList;

    .line 83
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->dlgs:Ljava/util/ArrayList;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->displayItems:Ljava/util/ArrayList;

    .line 88
    iput-boolean v1, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->dataLoading:Z

    .line 92
    new-instance v0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$1;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/messages/DialogsFragment$1;-><init>(Lcom/vkontakte/android/fragments/messages/DialogsFragment;)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->receiver:Landroid/content/BroadcastReceiver;

    .line 314
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->moreAvailable:Z

    .line 330
    iput-boolean v1, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->isSearchExpanded:Z

    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/fragments/messages/DialogsFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    .prologue
    .line 60
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->dlgs:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$100(Lcom/vkontakte/android/fragments/messages/DialogsFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    .prologue
    .line 60
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->updateList()V

    return-void
.end method

.method static synthetic access$1000(Lcom/vkontakte/android/fragments/messages/DialogsFragment;)Landroid/widget/ProgressBar;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    .prologue
    .line 60
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->progress:Landroid/widget/ProgressBar;

    return-object v0
.end method

.method static synthetic access$1100(Lcom/vkontakte/android/fragments/messages/DialogsFragment;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    .prologue
    .line 60
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->updateMutedStates()Z

    move-result v0

    return v0
.end method

.method static synthetic access$1200(Lcom/vkontakte/android/fragments/messages/DialogsFragment;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    .prologue
    .line 60
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->moreAvailable:Z

    return v0
.end method

.method static synthetic access$1202(Lcom/vkontakte/android/fragments/messages/DialogsFragment;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/messages/DialogsFragment;
    .param p1, "x1"    # Z

    .prologue
    .line 60
    iput-boolean p1, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->moreAvailable:Z

    return p1
.end method

.method static synthetic access$1300(Lcom/vkontakte/android/fragments/messages/DialogsFragment;)Lcom/vkontakte/android/ui/LoadMoreFooterView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    .prologue
    .line 60
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->footerView:Lcom/vkontakte/android/ui/LoadMoreFooterView;

    return-object v0
.end method

.method static synthetic access$1400(Lcom/vkontakte/android/fragments/messages/DialogsFragment;)Landroid/widget/FrameLayout;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    .prologue
    .line 60
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->contentWrap:Landroid/widget/FrameLayout;

    return-object v0
.end method

.method static synthetic access$1500(Lcom/vkontakte/android/fragments/messages/DialogsFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    .prologue
    .line 60
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->updateNonFriendsOnlines()V

    return-void
.end method

.method static synthetic access$1600(Lcom/vkontakte/android/fragments/messages/DialogsFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    .prologue
    .line 60
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->searchResults:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$200(Lcom/vkontakte/android/fragments/messages/DialogsFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    .prologue
    .line 60
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->preventDuplicates()V

    return-void
.end method

.method static synthetic access$300(Lcom/vkontakte/android/fragments/messages/DialogsFragment;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/messages/DialogsFragment;
    .param p1, "x1"    # Z

    .prologue
    .line 60
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->updateList(Z)V

    return-void
.end method

.method static synthetic access$400(Lcom/vkontakte/android/fragments/messages/DialogsFragment;I)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/messages/DialogsFragment;
    .param p1, "x1"    # I

    .prologue
    .line 60
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->updateState(I)V

    return-void
.end method

.method static synthetic access$500(Lcom/vkontakte/android/fragments/messages/DialogsFragment;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    .prologue
    .line 60
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->isSelectMode()Z

    move-result v0

    return v0
.end method

.method static synthetic access$600(Lcom/vkontakte/android/fragments/messages/DialogsFragment;)Lcom/vkontakte/android/ui/MessagesSearchSuggestionsPopup;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    .prologue
    .line 60
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->suggester:Lcom/vkontakte/android/ui/MessagesSearchSuggestionsPopup;

    return-object v0
.end method

.method static synthetic access$700(Lcom/vkontakte/android/fragments/messages/DialogsFragment;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/messages/DialogsFragment;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 60
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->search(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$802(Lcom/vkontakte/android/fragments/messages/DialogsFragment;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/messages/DialogsFragment;
    .param p1, "x1"    # Z

    .prologue
    .line 60
    iput-boolean p1, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->dataLoading:Z

    return p1
.end method

.method static synthetic access$900(Lcom/vkontakte/android/fragments/messages/DialogsFragment;)Lcom/vkontakte/android/ui/ErrorViewHelper;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    .prologue
    .line 60
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->error:Lcom/vkontakte/android/ui/ErrorViewHelper;

    return-object v0
.end method

.method private isSelectMode()Z
    .locals 3

    .prologue
    const/4 v0, 0x0

    .line 333
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    const-string/jumbo v2, "select"

    invoke-virtual {v1, v2, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method static synthetic lambda$createShortcut$9(Lcom/vkontakte/android/DialogEntry;)V
    .locals 2
    .param p0, "e"    # Lcom/vkontakte/android/DialogEntry;

    .prologue
    .line 934
    iget-object v1, p0, Lcom/vkontakte/android/DialogEntry;->profile:Lcom/vkontakte/android/UserProfile;

    invoke-static {v1}, Lcom/vkontakte/android/data/Messages;->getShortcutIntent(Lcom/vkontakte/android/UserProfile;)Landroid/content/Intent;

    move-result-object v0

    .line 935
    .local v0, "intent":Landroid/content/Intent;
    sget-object v1, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-virtual {v1, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 936
    invoke-static {}, Lcom/vkontakte/android/fragments/messages/DialogsFragment$$Lambda$10;->lambdaFactory$()Ljava/lang/Runnable;

    move-result-object v1

    invoke-static {v1}, Lcom/vkontakte/android/ViewUtils;->post(Ljava/lang/Runnable;)V

    .line 940
    return-void
.end method

.method static synthetic lambda$null$8()V
    .locals 3

    .prologue
    .line 937
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    new-instance v1, Landroid/content/Intent;

    const-string/jumbo v2, "android.intent.action.MAIN"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string/jumbo v2, "android.intent.category.HOME"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v1

    const/high16 v2, 0x10000000

    .line 938
    invoke-virtual {v1, v2}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    move-result-object v1

    .line 937
    invoke-virtual {v0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 939
    return-void
.end method

.method static synthetic lambda$onCreateContentView$4(Lcom/vkontakte/android/functions/VoidF1;Landroid/view/View;)V
    .locals 2
    .param p0, "f"    # Lcom/vkontakte/android/functions/VoidF1;
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 470
    new-instance v0, Lcom/vkontakte/android/ui/ListDialog$CreateNewMessageDialog;

    invoke-direct {v0}, Lcom/vkontakte/android/ui/ListDialog$CreateNewMessageDialog;-><init>()V

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1, p1, p0}, Lcom/vkontakte/android/ui/ListDialog$CreateNewMessageDialog;->showNewDialogs(Landroid/content/Context;Landroid/view/View;Lcom/vkontakte/android/functions/VoidF1;)V

    return-void
.end method

.method private preventDuplicates()V
    .locals 4

    .prologue
    .line 944
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 945
    .local v1, "ids":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    iget-object v3, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->dlgs:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "itr":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/vkontakte/android/DialogEntry;>;"
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 946
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/DialogEntry;

    .line 947
    .local v0, "de":Lcom/vkontakte/android/DialogEntry;
    iget-object v3, v0, Lcom/vkontakte/android/DialogEntry;->lastMessage:Lcom/vkontakte/android/Message;

    iget v3, v3, Lcom/vkontakte/android/Message;->peer:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 948
    invoke-interface {v2}, Ljava/util/Iterator;->remove()V

    goto :goto_0

    .line 950
    :cond_0
    iget-object v3, v0, Lcom/vkontakte/android/DialogEntry;->lastMessage:Lcom/vkontakte/android/Message;

    iget v3, v3, Lcom/vkontakte/android/Message;->peer:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 953
    .end local v0    # "de":Lcom/vkontakte/android/DialogEntry;
    :cond_1
    return-void
.end method

.method private search(Ljava/lang/String;)V
    .locals 5
    .param p1, "q"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    const/16 v3, 0x8

    const/4 v2, 0x1

    .line 596
    iput-object p1, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->searchQuery:Ljava/lang/String;

    .line 597
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->error:Lcom/vkontakte/android/ui/ErrorViewHelper;

    invoke-static {v0, v3}, Lcom/vkontakte/android/ui/ErrorViewHelper;->setVisibility(Lcom/vkontakte/android/ui/ErrorViewHelper;I)V

    .line 598
    if-nez p1, :cond_2

    .line 599
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->dlgs:Ljava/util/ArrayList;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->displayItems:Ljava/util/ArrayList;

    .line 600
    iput-boolean v2, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->moreAvailable:Z

    .line 601
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->updateList()V

    .line 602
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->error:Lcom/vkontakte/android/ui/ErrorViewHelper;

    invoke-static {v0, v3}, Lcom/vkontakte/android/ui/ErrorViewHelper;->setVisibility(Lcom/vkontakte/android/ui/ErrorViewHelper;I)V

    .line 603
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->contentWrap:Landroid/widget/FrameLayout;

    invoke-static {v0, v4}, Lcom/vkontakte/android/ViewUtils;->setVisibility(Landroid/view/View;I)V

    .line 604
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->emptyView:Landroid/view/View;

    if-eqz v0, :cond_0

    .line 605
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->emptyView:Landroid/view/View;

    const v1, 0x7f080446

    invoke-static {v0, v1}, Lcom/vkontakte/android/ui/EmptyView;->setText(Landroid/view/View;I)V

    .line 606
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->emptyView:Landroid/view/View;

    invoke-static {v0, v2}, Lcom/vkontakte/android/ui/EmptyView;->setButtonVisible(Landroid/view/View;Z)V

    .line 608
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->dlgs:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-nez v0, :cond_1

    .line 609
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->contentWrap:Landroid/widget/FrameLayout;

    invoke-static {v0, v3}, Lcom/vkontakte/android/ViewUtils;->setVisibility(Landroid/view/View;I)V

    .line 610
    invoke-virtual {p0, v2}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->loadData(Z)V

    .line 624
    :cond_1
    :goto_0
    return-void

    .line 614
    :cond_2
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->emptyView:Landroid/view/View;

    if-eqz v0, :cond_3

    .line 615
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->emptyView:Landroid/view/View;

    const v1, 0x7f08045d

    invoke-static {v0, v1}, Lcom/vkontakte/android/ui/EmptyView;->setText(Landroid/view/View;I)V

    .line 616
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->emptyView:Landroid/view/View;

    invoke-static {v0, v4}, Lcom/vkontakte/android/ui/EmptyView;->setButtonVisible(Landroid/view/View;Z)V

    .line 618
    :cond_3
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->searchResults:Ljava/util/ArrayList;

    .line 619
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->searchResults:Ljava/util/ArrayList;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->displayItems:Ljava/util/ArrayList;

    .line 620
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->updateList()V

    .line 621
    invoke-virtual {p0, v2}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->loadData(Z)V

    .line 622
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->contentWrap:Landroid/widget/FrameLayout;

    invoke-static {v0, v3}, Lcom/vkontakte/android/ViewUtils;->setVisibility(Landroid/view/View;I)V

    .line 623
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->progress:Landroid/widget/ProgressBar;

    invoke-static {v0, v4}, Lcom/vkontakte/android/ViewUtils;->setVisibility(Landroid/view/View;I)V

    goto :goto_0
.end method

.method private updateList()V
    .locals 1

    .prologue
    .line 787
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->updateList(Z)V

    .line 788
    return-void
.end method

.method private updateList(Z)V
    .locals 1
    .param p1, "updateNotificationsSettings"    # Z

    .prologue
    .line 791
    invoke-static {p0, p1}, Lcom/vkontakte/android/fragments/messages/DialogsFragment$$Lambda$7;->lambdaFactory$(Lcom/vkontakte/android/fragments/messages/DialogsFragment;Z)Ljava/lang/Runnable;

    move-result-object v0

    invoke-static {v0}, Lcom/vkontakte/android/ViewUtils;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 805
    return-void
.end method

.method private updateMutedStates()Z
    .locals 3

    .prologue
    .line 580
    const/4 v1, 0x0

    .line 581
    .local v1, "updated":Z
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v2, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->dlgs:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v0, v2, :cond_2

    .line 582
    iget-object v2, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->dlgs:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/DialogEntry;

    invoke-virtual {v2}, Lcom/vkontakte/android/DialogEntry;->updateMutedState()Z

    move-result v2

    if-nez v2, :cond_0

    if-eqz v1, :cond_1

    :cond_0
    const/4 v1, 0x1

    .line 581
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 582
    :cond_1
    const/4 v1, 0x0

    goto :goto_1

    .line 584
    :cond_2
    return v1
.end method

.method private updateNonFriendsOnlines()V
    .locals 5

    .prologue
    .line 756
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 757
    .local v2, "ids":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v3, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->dlgs:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v1, v3, :cond_1

    .line 758
    iget-object v3, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->dlgs:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/DialogEntry;

    .line 759
    .local v0, "dlg":Lcom/vkontakte/android/DialogEntry;
    iget-object v3, v0, Lcom/vkontakte/android/DialogEntry;->profile:Lcom/vkontakte/android/UserProfile;

    iget v3, v3, Lcom/vkontakte/android/UserProfile;->uid:I

    if-lez v3, :cond_0

    iget-object v3, v0, Lcom/vkontakte/android/DialogEntry;->profile:Lcom/vkontakte/android/UserProfile;

    iget v3, v3, Lcom/vkontakte/android/UserProfile;->uid:I

    const v4, 0x77359400

    if-ge v3, v4, :cond_0

    iget-object v3, v0, Lcom/vkontakte/android/DialogEntry;->profile:Lcom/vkontakte/android/UserProfile;

    iget v3, v3, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-static {v3}, Lcom/vkontakte/android/data/Friends;->isFriend(I)Z

    move-result v3

    if-nez v3, :cond_0

    .line 760
    iget-object v3, v0, Lcom/vkontakte/android/DialogEntry;->profile:Lcom/vkontakte/android/UserProfile;

    iget v3, v3, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 757
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 763
    .end local v0    # "dlg":Lcom/vkontakte/android/DialogEntry;
    :cond_1
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-lez v3, :cond_2

    .line 764
    new-instance v3, Lcom/vkontakte/android/api/users/GetOnlines;

    invoke-direct {v3, v2}, Lcom/vkontakte/android/api/users/GetOnlines;-><init>(Ljava/util/List;)V

    new-instance v4, Lcom/vkontakte/android/fragments/messages/DialogsFragment$6;

    invoke-direct {v4, p0}, Lcom/vkontakte/android/fragments/messages/DialogsFragment$6;-><init>(Lcom/vkontakte/android/fragments/messages/DialogsFragment;)V

    invoke-virtual {v3, v4}, Lcom/vkontakte/android/api/users/GetOnlines;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v3

    const/4 v4, 0x1

    .line 775
    invoke-virtual {v3, v4}, Lcom/vkontakte/android/api/VKAPIRequest;->setBackground(Z)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v3

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 777
    :cond_2
    return-void
.end method

.method private updateState(I)V
    .locals 4
    .param p1, "state"    # I

    .prologue
    const/16 v3, 0x8

    const/4 v2, 0x0

    .line 556
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->toolbarStatePanel:Landroid/view/View;

    if-nez v0, :cond_0

    .line 577
    :goto_0
    return-void

    .line 559
    :cond_0
    packed-switch p1, :pswitch_data_0

    goto :goto_0

    .line 563
    :pswitch_0
    const/4 v0, 0x0

    invoke-super {p0, v0}, Lcom/vkontakte/android/fragments/VKToolbarFragment;->setTitle(Ljava/lang/CharSequence;)V

    .line 564
    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->toolbarStatePanelText:Landroid/widget/TextView;

    sget-object v0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->TEXTS:[I

    array-length v0, v0

    if-ge p1, v0, :cond_1

    sget-object v0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->TEXTS:[I

    aget v0, v0, p1

    :goto_1
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-static {v1, v0, v2}, Lcom/vkontakte/android/ViewUtils;->setText(Landroid/widget/TextView;Ljava/lang/Object;Z)V

    .line 565
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->toolbarStatePanelProgress:Landroid/widget/ProgressBar;

    invoke-static {v0, v2}, Lcom/vkontakte/android/ViewUtils;->setVisibility(Landroid/view/View;I)V

    .line 566
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->toolbarStatePanel:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0

    .line 564
    :cond_1
    sget-object v0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->TEXTS:[I

    aget v0, v0, v2

    goto :goto_1

    .line 569
    :pswitch_1
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->toolbarStatePanelText:Landroid/widget/TextView;

    const v1, 0x7f0806b8

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {v0, v1, v2}, Lcom/vkontakte/android/ViewUtils;->setText(Landroid/widget/TextView;Ljava/lang/Object;Z)V

    .line 570
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->toolbarStatePanelProgress:Landroid/widget/ProgressBar;

    invoke-static {v0, v3}, Lcom/vkontakte/android/ViewUtils;->setVisibility(Landroid/view/View;I)V

    .line 571
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->isAdded()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 572
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->title:Ljava/lang/CharSequence;

    invoke-super {p0, v0}, Lcom/vkontakte/android/fragments/VKToolbarFragment;->setTitle(Ljava/lang/CharSequence;)V

    .line 574
    :cond_2
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->toolbarStatePanel:Landroid/view/View;

    invoke-static {v0, v3}, Lcom/vkontakte/android/ViewUtils;->setVisibility(Landroid/view/View;I)V

    goto :goto_0

    .line 559
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method


# virtual methods
.method public allowMessages(Lcom/vkontakte/android/DialogEntry;)V
    .locals 3
    .param p1, "e"    # Lcom/vkontakte/android/DialogEntry;

    .prologue
    .line 901
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p1, Lcom/vkontakte/android/DialogEntry;->profile:Lcom/vkontakte/android/UserProfile;

    iget v1, v1, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    move-result v1

    new-instance v2, Lcom/vkontakte/android/fragments/messages/DialogsFragment$7;

    invoke-direct {v2, p0, p1}, Lcom/vkontakte/android/fragments/messages/DialogsFragment$7;-><init>(Lcom/vkontakte/android/fragments/messages/DialogsFragment;Lcom/vkontakte/android/DialogEntry;)V

    invoke-static {v0, v1, v2}, Lcom/vkontakte/android/utils/ApiMethodsHelper;->allowMessagesFromGroup(Landroid/content/Context;ILcom/vkontakte/android/api/Callback;)V

    .line 910
    return-void
.end method

.method public confirmAndClearHistory(Lcom/vkontakte/android/DialogEntry;)V
    .locals 3
    .param p1, "e"    # Lcom/vkontakte/android/DialogEntry;

    .prologue
    .line 925
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    iget-object v1, p1, Lcom/vkontakte/android/DialogEntry;->profile:Lcom/vkontakte/android/UserProfile;

    iget v1, v1, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-static {p0}, Lcom/vkontakte/android/fragments/messages/DialogsFragment$$Lambda$8;->lambdaFactory$(Lcom/vkontakte/android/fragments/messages/DialogsFragment;)Lcom/vkontakte/android/functions/VoidF2;

    move-result-object v2

    invoke-static {v0, v1, p1, v2}, Lcom/vkontakte/android/utils/ApiMethodsHelper;->clearHistory(Landroid/content/Context;ILjava/lang/Object;Lcom/vkontakte/android/functions/VoidF2;)V

    .line 930
    return-void
.end method

.method public createShortcut(Lcom/vkontakte/android/DialogEntry;)V
    .locals 2
    .param p1, "e"    # Lcom/vkontakte/android/DialogEntry;

    .prologue
    .line 933
    new-instance v0, Ljava/lang/Thread;

    invoke-static {p1}, Lcom/vkontakte/android/fragments/messages/DialogsFragment$$Lambda$9;->lambdaFactory$(Lcom/vkontakte/android/DialogEntry;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 940
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 941
    return-void
.end method

.method public denyMessages(Lcom/vkontakte/android/DialogEntry;)V
    .locals 3
    .param p1, "e"    # Lcom/vkontakte/android/DialogEntry;

    .prologue
    .line 913
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p1, Lcom/vkontakte/android/DialogEntry;->profile:Lcom/vkontakte/android/UserProfile;

    iget v1, v1, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    move-result v1

    new-instance v2, Lcom/vkontakte/android/fragments/messages/DialogsFragment$8;

    invoke-direct {v2, p0, p1}, Lcom/vkontakte/android/fragments/messages/DialogsFragment$8;-><init>(Lcom/vkontakte/android/fragments/messages/DialogsFragment;Lcom/vkontakte/android/DialogEntry;)V

    invoke-static {v0, v1, v2}, Lcom/vkontakte/android/utils/ApiMethodsHelper;->denyMessagesFromGroup(Landroid/content/Context;ILcom/vkontakte/android/api/Callback;)V

    .line 922
    return-void
.end method

.method synthetic lambda$confirmAndClearHistory$7(Ljava/lang/Integer;Lcom/vkontakte/android/DialogEntry;)V
    .locals 1
    .param p1, "uid"    # Ljava/lang/Integer;
    .param p2, "o"    # Lcom/vkontakte/android/DialogEntry;

    .prologue
    .line 926
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->dlgs:Ljava/util/ArrayList;

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 927
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-static {v0}, Lcom/vkontakte/android/data/Messages;->removeDialog(I)V

    .line 928
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->updateList()V

    .line 929
    return-void
.end method

.method synthetic lambda$onCreate$0(Lcom/vkontakte/android/DialogEntry;)V
    .locals 5
    .param p1, "e"    # Lcom/vkontakte/android/DialogEntry;

    .prologue
    .line 355
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const/4 v1, -0x1

    new-instance v2, Landroid/content/Intent;

    invoke-direct {v2}, Landroid/content/Intent;-><init>()V

    const-string/jumbo v3, "profile"

    iget-object v4, p1, Lcom/vkontakte/android/DialogEntry;->profile:Lcom/vkontakte/android/UserProfile;

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 356
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    .line 357
    return-void
.end method

.method synthetic lambda$onCreateContentView$1(Landroid/view/LayoutInflater;Landroid/view/View;)V
    .locals 3
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "v"    # Landroid/view/View;

    .prologue
    .line 422
    new-instance v0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;

    invoke-direct {v0}, Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;-><init>()V

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;->setDisableSpinner()Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;->setGlobalSearch(Z)Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;

    move-result-object v0

    .line 423
    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;->setSelect()Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;

    move-result-object v0

    invoke-virtual {p1}, Landroid/view/LayoutInflater;->getContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f08047f

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;->setTitle(Ljava/lang/String;)Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;

    move-result-object v0

    const/16 v1, 0x141

    invoke-virtual {v0, p0, v1}, Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;->forResult(Landroid/app/Fragment;I)Z

    .line 422
    return-void
.end method

.method synthetic lambda$onCreateContentView$2(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 452
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->error:Lcom/vkontakte/android/ui/ErrorViewHelper;

    const/16 v1, 0x8

    invoke-static {v0, v1}, Lcom/vkontakte/android/ui/ErrorViewHelper;->setVisibility(Lcom/vkontakte/android/ui/ErrorViewHelper;I)V

    .line 453
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->progress:Landroid/widget/ProgressBar;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vkontakte/android/ViewUtils;->setVisibility(Landroid/view/View;I)V

    .line 454
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->loadData(Z)V

    .line 455
    return-void
.end method

.method synthetic lambda$onCreateContentView$3(Landroid/view/LayoutInflater;Ljava/lang/Long;)V
    .locals 5
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "l"    # Ljava/lang/Long;

    .prologue
    const/4 v4, 0x0

    .line 461
    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    const-wide/32 v2, 0x7fffffff

    cmp-long v0, v0, v2

    if-nez v0, :cond_1

    .line 462
    new-instance v0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;

    invoke-direct {v0}, Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;-><init>()V

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;->setDisableSpinner()Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;

    move-result-object v0

    invoke-virtual {v0, v4}, Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;->setGlobalSearch(Z)Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;->setMultiSelect()Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;

    move-result-object v0

    .line 463
    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;->setSelect()Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;

    move-result-object v0

    invoke-virtual {p1}, Landroid/view/LayoutInflater;->getContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f080193

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;->setTitle(Ljava/lang/String;)Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;

    move-result-object v0

    const/16 v1, 0x142

    invoke-virtual {v0, p0, v1}, Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;->forResult(Landroid/app/Fragment;I)Z

    .line 468
    :cond_0
    :goto_0
    return-void

    .line 464
    :cond_1
    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    const-wide/32 v2, -0x80000000

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 465
    new-instance v0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;

    invoke-direct {v0}, Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;-><init>()V

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;->setDisableSpinner()Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;

    move-result-object v0

    invoke-virtual {v0, v4}, Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;->setGlobalSearch(Z)Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;

    move-result-object v0

    .line 466
    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;->setSelect()Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;

    move-result-object v0

    invoke-virtual {p1}, Landroid/view/LayoutInflater;->getContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f08047f

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;->setTitle(Ljava/lang/String;)Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;

    move-result-object v0

    const/16 v1, 0x141

    invoke-virtual {v0, p0, v1}, Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;->forResult(Landroid/app/Fragment;I)Z

    goto :goto_0
.end method

.method synthetic lambda$onCreateContentView$5(Z)V
    .locals 1
    .param p1, "expanded"    # Z

    .prologue
    .line 498
    iput-boolean p1, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->isSearchExpanded:Z

    .line 499
    if-nez p1, :cond_0

    .line 500
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->search(Ljava/lang/String;)V

    .line 502
    :cond_0
    if-eqz p1, :cond_1

    .line 503
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->suggester:Lcom/vkontakte/android/ui/MessagesSearchSuggestionsPopup;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/MessagesSearchSuggestionsPopup;->updateSearchIndex()V

    .line 505
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->floatingActionButton:Landroid/support/design/widget/FloatingActionButton;

    if-eqz v0, :cond_2

    .line 506
    if-eqz p1, :cond_3

    .line 507
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->floatingActionButton:Landroid/support/design/widget/FloatingActionButton;

    invoke-virtual {v0}, Landroid/support/design/widget/FloatingActionButton;->hide()V

    .line 512
    :cond_2
    :goto_0
    return-void

    .line 509
    :cond_3
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->floatingActionButton:Landroid/support/design/widget/FloatingActionButton;

    invoke-virtual {v0}, Landroid/support/design/widget/FloatingActionButton;->show()V

    goto :goto_0
.end method

.method synthetic lambda$updateList$6(Z)V
    .locals 3
    .param p1, "updateNotificationsSettings"    # Z

    .prologue
    .line 792
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->dlgs:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_0

    .line 793
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->error:Lcom/vkontakte/android/ui/ErrorViewHelper;

    const/16 v1, 0x8

    invoke-static {v0, v1}, Lcom/vkontakte/android/ui/ErrorViewHelper;->setVisibility(Lcom/vkontakte/android/ui/ErrorViewHelper;I)V

    .line 796
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->adapter:Lcom/vkontakte/android/fragments/messages/DialogsFragment$DialogsAdapter;

    if-eqz v0, :cond_1

    .line 797
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->adapter:Lcom/vkontakte/android/fragments/messages/DialogsFragment$DialogsAdapter;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->displayItems:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/messages/DialogsFragment$DialogsAdapter;->setData(Ljava/util/ArrayList;)V

    .line 799
    :cond_1
    if-eqz p1, :cond_2

    invoke-direct {p0}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->updateMutedStates()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 800
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->adapter:Lcom/vkontakte/android/fragments/messages/DialogsFragment$DialogsAdapter;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/messages/DialogsFragment$DialogsAdapter;->notifyDataSetChanged()V

    .line 803
    :cond_2
    invoke-static {}, Lcom/vkontakte/android/ShortcutManagerWrapper;->getInstance()Lcom/vkontakte/android/ShortcutManagerWrapper;

    move-result-object v0

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->dlgs:Ljava/util/ArrayList;

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/ShortcutManagerWrapper;->updateShortcuts(Landroid/content/Context;Ljava/util/ArrayList;)V

    .line 804
    return-void
.end method

.method public loadData(Z)V
    .locals 4
    .param p1, "refresh"    # Z

    .prologue
    const/16 v3, 0x14

    const/4 v0, 0x0

    .line 628
    iget-boolean v1, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->dataLoading:Z

    if-eqz v1, :cond_1

    .line 753
    :cond_0
    :goto_0
    return-void

    .line 631
    :cond_1
    iget-boolean v1, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->moreAvailable:Z

    if-nez v1, :cond_2

    if-eqz p1, :cond_0

    .line 634
    :cond_2
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->dataLoading:Z

    .line 635
    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->searchQuery:Ljava/lang/String;

    if-nez v1, :cond_4

    .line 636
    if-eqz p1, :cond_3

    :goto_1
    new-instance v1, Lcom/vkontakte/android/fragments/messages/DialogsFragment$4;

    invoke-direct {v1, p0, p1}, Lcom/vkontakte/android/fragments/messages/DialogsFragment$4;-><init>(Lcom/vkontakte/android/fragments/messages/DialogsFragment;Z)V

    invoke-static {v0, v3, v1}, Lcom/vkontakte/android/data/Messages;->getDialogs(IILcom/vkontakte/android/data/Messages$GetDialogsCallback;)V

    goto :goto_0

    :cond_3
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->dlgs:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    goto :goto_1

    .line 696
    :cond_4
    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->searchQuery:Ljava/lang/String;

    if-eqz p1, :cond_5

    :goto_2
    new-instance v2, Lcom/vkontakte/android/fragments/messages/DialogsFragment$5;

    invoke-direct {v2, p0, p1}, Lcom/vkontakte/android/fragments/messages/DialogsFragment$5;-><init>(Lcom/vkontakte/android/fragments/messages/DialogsFragment;Z)V

    invoke-static {v1, v0, v3, v2}, Lcom/vkontakte/android/data/Messages;->search(Ljava/lang/String;IILcom/vkontakte/android/data/Messages$SearchCallback;)V

    goto :goto_0

    :cond_5
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->searchResults:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    goto :goto_2
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 9
    .param p1, "reqCode"    # I
    .param p2, "resCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    const/4 v8, 0x1

    const/4 v7, 0x0

    const/4 v6, -0x1

    .line 809
    packed-switch p1, :pswitch_data_0

    .line 849
    invoke-super {p0, p1, p2, p3}, Lcom/vkontakte/android/fragments/VKToolbarFragment;->onActivityResult(IILandroid/content/Intent;)V

    .line 852
    :cond_0
    :goto_0
    return-void

    .line 811
    :pswitch_0
    if-eq p2, v6, :cond_0

    .line 812
    iget-object v6, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->selectedTempUsers:Ljava/util/ArrayList;

    if-eqz v6, :cond_2

    .line 813
    iget-object v6, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->selectedTempUsers:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    new-array v4, v6, [I

    .line 814
    .local v4, "users":[I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    array-length v6, v4

    if-ge v2, v6, :cond_1

    .line 815
    iget-object v6, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->selectedTempUsers:Ljava/util/ArrayList;

    invoke-virtual {v6, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/vkontakte/android/UserProfile;

    iget v6, v6, Lcom/vkontakte/android/UserProfile;->uid:I

    aput v6, v4, v2

    .line 814
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 817
    :cond_1
    new-instance v6, Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;

    invoke-direct {v6}, Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;-><init>()V

    invoke-virtual {v6}, Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;->setDisableSpinner()Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;

    move-result-object v6

    invoke-virtual {v6, v7}, Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;->setGlobalSearch(Z)Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;

    move-result-object v6

    .line 818
    invoke-virtual {v6}, Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;->setMultiSelect()Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;

    move-result-object v6

    invoke-virtual {v6, v4}, Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;->setPresetUsers([I)Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;

    move-result-object v6

    invoke-virtual {v6}, Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;->setSelect()Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;

    move-result-object v6

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v7

    const v8, 0x7f080193

    .line 819
    invoke-virtual {v7, v8}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v7

    .line 818
    invoke-virtual {v6, v7}, Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;->setTitle(Ljava/lang/String;)Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;

    move-result-object v6

    const/16 v7, 0x142

    .line 819
    invoke-virtual {v6, p0, v7}, Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;->forResult(Landroid/app/Fragment;I)Z

    .line 821
    .end local v2    # "i":I
    .end local v4    # "users":[I
    :cond_2
    const/4 v6, 0x0

    iput-object v6, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->selectedTempUsers:Ljava/util/ArrayList;

    .line 822
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v6

    const v7, 0x7f04000a

    const v8, 0x7f04000b

    invoke-virtual {v6, v7, v8}, Landroid/app/Activity;->overridePendingTransition(II)V

    goto :goto_0

    .line 826
    :pswitch_1
    if-ne p2, v6, :cond_0

    .line 827
    invoke-virtual {p3}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v1

    .line 828
    .local v1, "b":Landroid/os/Bundle;
    new-instance v6, Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;

    const-string/jumbo v7, "uid"

    invoke-virtual {v1, v7}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v7

    const-string/jumbo v8, "name"

    invoke-virtual {v1, v8}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v6, v7, v8}, Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;-><init>(ILjava/lang/String;)V

    const-string/jumbo v7, "photo"

    invoke-virtual {v1, v7}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;->setPhoto(Ljava/lang/CharSequence;)Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;

    move-result-object v6

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;->go(Landroid/content/Context;)Z

    goto/16 :goto_0

    .line 832
    .end local v1    # "b":Landroid/os/Bundle;
    :pswitch_2
    if-ne p2, v6, :cond_0

    .line 833
    const-string/jumbo v6, "result"

    invoke-virtual {p3, v6}, Landroid/content/Intent;->getParcelableArrayListExtra(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v5

    .line 834
    .local v5, "users":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    if-eqz v5, :cond_0

    invoke-virtual {v5}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_0

    .line 836
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-ne v6, v8, :cond_3

    .line 837
    invoke-virtual {v5, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/vkontakte/android/UserProfile;

    .line 838
    .local v3, "p":Lcom/vkontakte/android/UserProfile;
    new-instance v6, Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;

    iget v7, v3, Lcom/vkontakte/android/UserProfile;->uid:I

    iget-object v8, v3, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    invoke-direct {v6, v7, v8}, Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;-><init>(ILjava/lang/String;)V

    iget-object v7, v3, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    invoke-virtual {v6, v7}, Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;->setPhoto(Ljava/lang/CharSequence;)Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;

    move-result-object v6

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;->go(Landroid/content/Context;)Z

    goto/16 :goto_0

    .line 840
    .end local v3    # "p":Lcom/vkontakte/android/UserProfile;
    :cond_3
    iput-object v5, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->selectedTempUsers:Ljava/util/ArrayList;

    .line 841
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 842
    .local v0, "args":Landroid/os/Bundle;
    const-string/jumbo v6, "users"

    invoke-virtual {v0, v6, v5}, Landroid/os/Bundle;->putParcelableArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 843
    const-string/jumbo v6, "create"

    invoke-virtual {v0, v6, v8}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 844
    new-instance v6, Lcom/vkontakte/android/navigation/Navigator;

    const-class v7, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;

    invoke-direct {v6, v7, v0}, Lcom/vkontakte/android/navigation/Navigator;-><init>(Ljava/lang/Class;Landroid/os/Bundle;)V

    const/16 v7, 0x143

    invoke-virtual {v6, p0, v7}, Lcom/vkontakte/android/navigation/Navigator;->forResult(Landroid/app/Fragment;I)Z

    goto/16 :goto_0

    .line 809
    :pswitch_data_0
    .packed-switch 0x141
        :pswitch_1
        :pswitch_2
        :pswitch_0
    .end packed-switch
.end method

.method public onAttach(Landroid/app/Activity;)V
    .locals 3
    .param p1, "act"    # Landroid/app/Activity;

    .prologue
    .line 537
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/VKToolbarFragment;->onAttach(Landroid/app/Activity;)V

    .line 538
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->isSelectMode()Z

    move-result v1

    if-nez v1, :cond_1

    const v1, 0x7f08035c

    :goto_0
    invoke-virtual {p0, v1}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->setTitle(I)V

    .line 539
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->setHasOptionsMenu(Z)V

    .line 541
    sget-object v1, Lcom/vkontakte/android/Global;->longPoll:Lcom/vkontakte/android/LongPollService;

    if-nez v1, :cond_0

    invoke-static {}, Lcom/vkontakte/android/NetworkStateReceiver;->isConnected()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 542
    new-instance v0, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const-class v2, Lcom/vkontakte/android/LongPollService;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 543
    .local v0, "intent":Landroid/content/Intent;
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/app/Activity;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 545
    .end local v0    # "intent":Landroid/content/Intent;
    :cond_0
    return-void

    .line 538
    :cond_1
    const v1, 0x7f0805f4

    goto :goto_0
.end method

.method public onBackPressed()Z
    .locals 2

    .prologue
    const/4 v0, 0x0

    .line 372
    iget-boolean v1, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->isSearchExpanded:Z

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->searchView:Lcom/vkontakte/android/ui/SearchViewWrapper;

    if-eqz v1, :cond_0

    .line 373
    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->searchView:Lcom/vkontakte/android/ui/SearchViewWrapper;

    invoke-virtual {v1, v0}, Lcom/vkontakte/android/ui/SearchViewWrapper;->setExpanded(Z)V

    .line 374
    const/4 v0, 0x1

    .line 376
    :cond_0
    return v0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 5
    .param p1, "b"    # Landroid/os/Bundle;

    .prologue
    .line 338
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/VKToolbarFragment;->onCreate(Landroid/os/Bundle;)V

    .line 339
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 340
    .local v0, "filter":Landroid/content/IntentFilter;
    const-string/jumbo v1, "com.vkontakte.android.NEW_MESSAGE"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 341
    const-string/jumbo v1, "com.vkontakte.android.UPDATE_MESSAGE"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 342
    const-string/jumbo v1, "com.vkontakte.android.USER_PRESENCE"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 343
    const-string/jumbo v1, "com.vkontakte.android.MESSAGE_RSTATE_CHANGED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 344
    const-string/jumbo v1, "com.vkontakte.android.REFRESH_DIALOGS"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 345
    const-string/jumbo v1, "com.vkontakte.android.CHAT_CHANGED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 346
    const-string/jumbo v1, "com.vkontakte.android.DIALOG_CHANGED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 347
    const-string/jumbo v1, "com.vkontakte.android.MUTE_CHANGED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 348
    const-string/jumbo v1, "com.vkontakte.android.STATE_CHANGED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 349
    const-string/jumbo v1, "com.vkontakte.android.COMMUNITY_MESSAGES_BLOCK_CHANGED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 350
    const-string/jumbo v1, "com.vkontakte.android.TYPING"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 351
    sget-object v1, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->receiver:Landroid/content/BroadcastReceiver;

    const-string/jumbo v3, "com.vkontakte.android.permission.ACCESS_DATA"

    const/4 v4, 0x0

    invoke-virtual {v1, v2, v0, v3, v4}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;)Landroid/content/Intent;

    .line 353
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->isSelectMode()Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->selListener:Lcom/vkontakte/android/fragments/messages/DialogsFragment$SelectionListener;

    if-nez v1, :cond_0

    .line 354
    invoke-static {p0}, Lcom/vkontakte/android/fragments/messages/DialogsFragment$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/fragments/messages/DialogsFragment;)Lcom/vkontakte/android/fragments/messages/DialogsFragment$SelectionListener;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->setListener(Lcom/vkontakte/android/fragments/messages/DialogsFragment$SelectionListener;)V

    .line 359
    :cond_0
    return-void
.end method

.method public onCreateContentView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 9
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v6, 0x1

    const/16 v5, 0x8

    const/4 v4, 0x0

    .line 404
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 406
    .local v0, "act":Landroid/app/Activity;
    const v3, 0x7f0300a1

    invoke-virtual {p1, v3, p2, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    .line 407
    .local v1, "contentView":Landroid/view/ViewGroup;
    const v3, 0x7f10018a

    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Lme/grishka/appkit/views/UsableRecyclerView;

    iput-object v3, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    .line 408
    const v3, 0x7f1002a2

    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/FrameLayout;

    iput-object v3, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->contentWrap:Landroid/widget/FrameLayout;

    .line 409
    const v3, 0x7f1002a4

    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v3

    iput-object v3, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->emptyView:Landroid/view/View;

    .line 410
    const v3, 0x7f100184

    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ProgressBar;

    iput-object v3, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->progress:Landroid/widget/ProgressBar;

    .line 411
    new-instance v3, Lcom/vkontakte/android/ui/ErrorViewHelper;

    const v7, 0x7f10001b

    invoke-virtual {v1, v7}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v7

    invoke-direct {v3, v7}, Lcom/vkontakte/android/ui/ErrorViewHelper;-><init>(Landroid/view/View;)V

    iput-object v3, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->error:Lcom/vkontakte/android/ui/ErrorViewHelper;

    .line 412
    const v3, 0x7f1002a3

    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/support/design/widget/FloatingActionButton;

    iput-object v3, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->floatingActionButton:Landroid/support/design/widget/FloatingActionButton;

    .line 414
    new-instance v3, Lcom/vkontakte/android/ui/LoadMoreFooterView;

    invoke-direct {v3, v0}, Lcom/vkontakte/android/ui/LoadMoreFooterView;-><init>(Landroid/content/Context;)V

    iput-object v3, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->footerView:Lcom/vkontakte/android/ui/LoadMoreFooterView;

    .line 416
    sget-boolean v3, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->$assertionsDisabled:Z

    if-nez v3, :cond_0

    iget-object v3, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->emptyView:Landroid/view/View;

    if-nez v3, :cond_0

    new-instance v3, Ljava/lang/AssertionError;

    invoke-direct {v3}, Ljava/lang/AssertionError;-><init>()V

    throw v3

    .line 418
    :cond_0
    iget-object v3, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->emptyView:Landroid/view/View;

    const v7, 0x7f10019f

    invoke-virtual {v3, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3, v5}, Landroid/view/View;->setVisibility(I)V

    .line 419
    iget-object v3, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->emptyView:Landroid/view/View;

    const v7, 0x7f080446

    invoke-static {v3, v7}, Lcom/vkontakte/android/ui/EmptyView;->setText(Landroid/view/View;I)V

    .line 420
    iget-object v3, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->emptyView:Landroid/view/View;

    const v7, 0x7f080794

    invoke-static {v3, v7}, Lcom/vkontakte/android/ui/EmptyView;->setButtonText(Landroid/view/View;I)V

    .line 421
    iget-object v3, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->emptyView:Landroid/view/View;

    invoke-static {v3, v6}, Lcom/vkontakte/android/ui/EmptyView;->setButtonVisible(Landroid/view/View;Z)V

    .line 422
    iget-object v3, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->emptyView:Landroid/view/View;

    invoke-static {p0, p1}, Lcom/vkontakte/android/fragments/messages/DialogsFragment$$Lambda$2;->lambdaFactory$(Lcom/vkontakte/android/fragments/messages/DialogsFragment;Landroid/view/LayoutInflater;)Landroid/view/View$OnClickListener;

    move-result-object v7

    invoke-static {v3, v7}, Lcom/vkontakte/android/ui/EmptyView;->setOnBtnClickListener(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 424
    sget-boolean v3, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->$assertionsDisabled:Z

    if-nez v3, :cond_1

    iget-object v3, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    if-nez v3, :cond_1

    new-instance v3, Ljava/lang/AssertionError;

    invoke-direct {v3}, Ljava/lang/AssertionError;-><init>()V

    throw v3

    .line 426
    :cond_1
    iget-object v3, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    new-instance v7, Landroid/support/v7/widget/LinearLayoutManager;

    invoke-direct {v7, v0}, Landroid/support/v7/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    invoke-virtual {v3, v7}, Lme/grishka/appkit/views/UsableRecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    .line 427
    iget-object v3, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    new-instance v7, Landroid/support/v7/widget/LinearLayoutManager;

    invoke-direct {v7, v0}, Landroid/support/v7/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    invoke-virtual {v3, v7}, Lme/grishka/appkit/views/UsableRecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    .line 428
    iget-object v3, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    new-instance v7, Lcom/vkontakte/android/fragments/messages/DialogsFragment$DialogsAdapter;

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v8

    invoke-virtual {v8}, Lcom/vkontakte/android/auth/VKAccount;->getPhoto()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8, p0}, Lcom/vkontakte/android/fragments/messages/DialogsFragment$DialogsAdapter;-><init>(Ljava/lang/String;Lcom/vkontakte/android/fragments/messages/DialogsFragment;)V

    iput-object v7, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->adapter:Lcom/vkontakte/android/fragments/messages/DialogsFragment$DialogsAdapter;

    invoke-virtual {v3, v7}, Lme/grishka/appkit/views/UsableRecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 429
    iget-object v3, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    iget-object v7, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->footerView:Lcom/vkontakte/android/ui/LoadMoreFooterView;

    invoke-virtual {v3, v7}, Lme/grishka/appkit/views/UsableRecyclerView;->addFooterView(Landroid/view/View;)V

    .line 430
    iget-object v3, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    const v7, 0x7f02013e

    invoke-virtual {v3, v7}, Lme/grishka/appkit/views/UsableRecyclerView;->setSelector(I)V

    .line 431
    iget-object v3, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    iget-object v7, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->emptyView:Landroid/view/View;

    invoke-virtual {v3, v7}, Lme/grishka/appkit/views/UsableRecyclerView;->setEmptyView(Landroid/view/View;)V

    .line 432
    iget-object v3, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    new-instance v7, Lcom/vkontakte/android/fragments/messages/DialogsFragment$2;

    invoke-direct {v7, p0}, Lcom/vkontakte/android/fragments/messages/DialogsFragment$2;-><init>(Lcom/vkontakte/android/fragments/messages/DialogsFragment;)V

    invoke-virtual {v3, v7}, Lme/grishka/appkit/views/UsableRecyclerView;->setListener(Lme/grishka/appkit/views/UsableRecyclerView$Listener;)V

    .line 449
    sget-boolean v3, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->$assertionsDisabled:Z

    if-nez v3, :cond_2

    iget-object v3, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->error:Lcom/vkontakte/android/ui/ErrorViewHelper;

    if-nez v3, :cond_2

    new-instance v3, Ljava/lang/AssertionError;

    invoke-direct {v3}, Ljava/lang/AssertionError;-><init>()V

    throw v3

    .line 451
    :cond_2
    iget-object v3, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->error:Lcom/vkontakte/android/ui/ErrorViewHelper;

    invoke-static {p0}, Lcom/vkontakte/android/fragments/messages/DialogsFragment$$Lambda$3;->lambdaFactory$(Lcom/vkontakte/android/fragments/messages/DialogsFragment;)Landroid/view/View$OnClickListener;

    move-result-object v7

    invoke-virtual {v3, v7}, Lcom/vkontakte/android/ui/ErrorViewHelper;->setOnRetryListener(Landroid/view/View$OnClickListener;)V

    .line 456
    iget-object v3, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->error:Lcom/vkontakte/android/ui/ErrorViewHelper;

    invoke-virtual {v3, v5}, Lcom/vkontakte/android/ui/ErrorViewHelper;->setVisibility(I)V

    .line 458
    sget-boolean v3, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->$assertionsDisabled:Z

    if-nez v3, :cond_3

    iget-object v3, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->floatingActionButton:Landroid/support/design/widget/FloatingActionButton;

    if-nez v3, :cond_3

    new-instance v3, Ljava/lang/AssertionError;

    invoke-direct {v3}, Ljava/lang/AssertionError;-><init>()V

    throw v3

    .line 460
    :cond_3
    invoke-static {p0, p1}, Lcom/vkontakte/android/fragments/messages/DialogsFragment$$Lambda$4;->lambdaFactory$(Lcom/vkontakte/android/fragments/messages/DialogsFragment;Landroid/view/LayoutInflater;)Lcom/vkontakte/android/functions/VoidF1;

    move-result-object v2

    .line 469
    .local v2, "f":Lcom/vkontakte/android/functions/VoidF1;, "Lcom/vkontakte/android/functions/VoidF1<Ljava/lang/Long;>;"
    iget-object v7, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->floatingActionButton:Landroid/support/design/widget/FloatingActionButton;

    invoke-direct {p0}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->isSelectMode()Z

    move-result v3

    if-nez v3, :cond_5

    move v3, v4

    :goto_0
    invoke-virtual {v7, v3}, Landroid/support/design/widget/FloatingActionButton;->setVisibility(I)V

    .line 470
    iget-object v3, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->floatingActionButton:Landroid/support/design/widget/FloatingActionButton;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/messages/DialogsFragment$$Lambda$5;->lambdaFactory$(Lcom/vkontakte/android/functions/VoidF1;)Landroid/view/View$OnClickListener;

    move-result-object v5

    invoke-virtual {v3, v5}, Landroid/support/design/widget/FloatingActionButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 472
    new-instance v3, Lcom/vkontakte/android/ui/SearchViewWrapper;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v5

    new-instance v7, Lcom/vkontakte/android/fragments/messages/DialogsFragment$3;

    invoke-direct {v7, p0}, Lcom/vkontakte/android/fragments/messages/DialogsFragment$3;-><init>(Lcom/vkontakte/android/fragments/messages/DialogsFragment;)V

    invoke-direct {v3, v5, v7}, Lcom/vkontakte/android/ui/SearchViewWrapper;-><init>(Landroid/app/Activity;Lcom/vkontakte/android/ui/SearchViewWrapper$SearchListener;)V

    iput-object v3, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->searchView:Lcom/vkontakte/android/ui/SearchViewWrapper;

    .line 492
    new-instance v5, Lcom/vkontakte/android/ui/MessagesSearchSuggestionsPopup;

    iget-object v7, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->searchView:Lcom/vkontakte/android/ui/SearchViewWrapper;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v8

    invoke-direct {p0}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->isSelectMode()Z

    move-result v3

    if-nez v3, :cond_6

    move v3, v6

    :goto_1
    invoke-direct {v5, v7, v8, v3}, Lcom/vkontakte/android/ui/MessagesSearchSuggestionsPopup;-><init>(Lcom/vkontakte/android/ui/SearchViewWrapper;Landroid/content/Context;Z)V

    iput-object v5, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->suggester:Lcom/vkontakte/android/ui/MessagesSearchSuggestionsPopup;

    .line 493
    iget-object v3, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->suggester:Lcom/vkontakte/android/ui/MessagesSearchSuggestionsPopup;

    invoke-virtual {v3}, Lcom/vkontakte/android/ui/MessagesSearchSuggestionsPopup;->getView()Landroid/view/View;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 494
    iget-object v3, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->selListener:Lcom/vkontakte/android/fragments/messages/DialogsFragment$SelectionListener;

    if-eqz v3, :cond_4

    .line 495
    iget-object v3, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->suggester:Lcom/vkontakte/android/ui/MessagesSearchSuggestionsPopup;

    iget-object v5, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->selListener:Lcom/vkontakte/android/fragments/messages/DialogsFragment$SelectionListener;

    invoke-virtual {v3, v5}, Lcom/vkontakte/android/ui/MessagesSearchSuggestionsPopup;->setSelectionListener(Lcom/vkontakte/android/fragments/messages/DialogsFragment$SelectionListener;)V

    .line 497
    :cond_4
    iget-object v3, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->searchView:Lcom/vkontakte/android/ui/SearchViewWrapper;

    invoke-static {p0}, Lcom/vkontakte/android/fragments/messages/DialogsFragment$$Lambda$6;->lambdaFactory$(Lcom/vkontakte/android/fragments/messages/DialogsFragment;)Lcom/vkontakte/android/ui/SearchViewWrapper$ViewStateListener;

    move-result-object v5

    invoke-virtual {v3, v5}, Lcom/vkontakte/android/ui/SearchViewWrapper;->setStateListener(Lcom/vkontakte/android/ui/SearchViewWrapper$ViewStateListener;)V

    .line 514
    iget-object v3, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->adapter:Lcom/vkontakte/android/fragments/messages/DialogsFragment$DialogsAdapter;

    iget-object v5, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->displayItems:Ljava/util/ArrayList;

    invoke-virtual {v3, v5}, Lcom/vkontakte/android/fragments/messages/DialogsFragment$DialogsAdapter;->setData(Ljava/util/ArrayList;)V

    .line 515
    invoke-virtual {p0, v4}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->loadData(Z)V

    .line 517
    return-object v1

    :cond_5
    move v3, v5

    .line 469
    goto :goto_0

    :cond_6
    move v3, v4

    .line 492
    goto :goto_1
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V
    .locals 1
    .param p1, "menu"    # Landroid/view/Menu;
    .param p2, "inflater"    # Landroid/view/MenuInflater;

    .prologue
    .line 589
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->searchView:Lcom/vkontakte/android/ui/SearchViewWrapper;

    if-eqz v0, :cond_0

    .line 590
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->searchView:Lcom/vkontakte/android/ui/SearchViewWrapper;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/ui/SearchViewWrapper;->onCreateOptionsMenu(Landroid/view/Menu;)V

    .line 592
    :cond_0
    invoke-super {p0, p1, p2}, Lcom/vkontakte/android/fragments/VKToolbarFragment;->onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V

    .line 593
    return-void
.end method

.method public onDestroy()V
    .locals 2

    .prologue
    .line 363
    invoke-super {p0}, Lcom/vkontakte/android/fragments/VKToolbarFragment;->onDestroy()V

    .line 365
    :try_start_0
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->receiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 368
    :goto_0
    return-void

    .line 366
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public onDestroyView()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 522
    invoke-super {p0}, Lcom/vkontakte/android/fragments/VKToolbarFragment;->onDestroyView()V

    .line 523
    iput-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    .line 524
    iput-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->footerView:Lcom/vkontakte/android/ui/LoadMoreFooterView;

    .line 525
    iput-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->contentWrap:Landroid/widget/FrameLayout;

    .line 526
    iput-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->emptyView:Landroid/view/View;

    .line 527
    iput-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->progress:Landroid/widget/ProgressBar;

    .line 528
    iput-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->error:Lcom/vkontakte/android/ui/ErrorViewHelper;

    .line 529
    iput-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->toolbarStatePanel:Landroid/view/View;

    .line 530
    iput-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->toolbarStatePanelText:Landroid/widget/TextView;

    .line 531
    iput-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->toolbarStatePanelProgress:Landroid/widget/ProgressBar;

    .line 532
    iput-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->floatingActionButton:Landroid/support/design/widget/FloatingActionButton;

    .line 533
    return-void
.end method

.method public onResume()V
    .locals 3

    .prologue
    .line 381
    invoke-super {p0}, Lcom/vkontakte/android/fragments/VKToolbarFragment;->onResume()V

    .line 382
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const-string/jumbo v2, "notification"

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    .line 383
    .local v0, "nm":Landroid/app/NotificationManager;
    const/16 v1, 0xa

    invoke-virtual {v0, v1}, Landroid/app/NotificationManager;->cancel(I)V

    .line 384
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->updateMutedStates()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 385
    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->adapter:Lcom/vkontakte/android/fragments/messages/DialogsFragment$DialogsAdapter;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/messages/DialogsFragment$DialogsAdapter;->notifyDataSetChanged()V

    .line 387
    :cond_0
    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 3
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 391
    invoke-super {p0, p1, p2}, Lcom/vkontakte/android/fragments/VKToolbarFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 392
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f030218

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->toolbarStatePanel:Landroid/view/View;

    .line 393
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->toolbarStatePanel:Landroid/view/View;

    const v1, 0x7f100561

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->toolbarStatePanelText:Landroid/widget/TextView;

    .line 394
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->toolbarStatePanel:Landroid/view/View;

    const v1, 0x7f100562

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ProgressBar;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->toolbarStatePanelProgress:Landroid/widget/ProgressBar;

    .line 395
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->toolbarStatePanelProgress:Landroid/widget/ProgressBar;

    invoke-virtual {v0}, Landroid/widget/ProgressBar;->getIndeterminateDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    const/4 v1, -0x1

    sget-object v2, Landroid/graphics/PorterDuff$Mode;->SRC_ATOP:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v0, v1, v2}, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    .line 397
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->getToolbar()Landroid/support/v7/widget/Toolbar;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->toolbarStatePanel:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/Toolbar;->addView(Landroid/view/View;)V

    .line 399
    invoke-static {}, Lcom/vkontakte/android/LongPollService;->getState()I

    move-result v0

    invoke-direct {p0, v0}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->updateState(I)V

    .line 400
    return-void
.end method

.method public setListener(Lcom/vkontakte/android/fragments/messages/DialogsFragment$SelectionListener;)V
    .locals 1
    .param p1, "l"    # Lcom/vkontakte/android/fragments/messages/DialogsFragment$SelectionListener;

    .prologue
    .line 780
    iput-object p1, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->selListener:Lcom/vkontakte/android/fragments/messages/DialogsFragment$SelectionListener;

    .line 781
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->suggester:Lcom/vkontakte/android/ui/MessagesSearchSuggestionsPopup;

    if-eqz v0, :cond_0

    .line 782
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->suggester:Lcom/vkontakte/android/ui/MessagesSearchSuggestionsPopup;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/ui/MessagesSearchSuggestionsPopup;->setSelectionListener(Lcom/vkontakte/android/fragments/messages/DialogsFragment$SelectionListener;)V

    .line 784
    :cond_0
    return-void
.end method

.method protected setTitle(Ljava/lang/CharSequence;)V
    .locals 2
    .param p1, "title"    # Ljava/lang/CharSequence;

    .prologue
    .line 549
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->toolbarStatePanel:Landroid/view/View;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->toolbarStatePanel:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    const/16 v1, 0x8

    if-ne v0, v1, :cond_1

    .line 550
    :cond_0
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/VKToolbarFragment;->setTitle(Ljava/lang/CharSequence;)V

    .line 552
    :cond_1
    iput-object p1, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->title:Ljava/lang/CharSequence;

    .line 553
    return-void
.end method
