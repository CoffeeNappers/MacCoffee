.class public Lcom/vkontakte/android/fragments/messages/ChatFragment;
.super Lcom/vkontakte/android/fragments/VKToolbarFragment;
.source "ChatFragment.java"

# interfaces
.implements Lcom/vkontakte/android/fragments/BackListener;
.implements Lcom/vkontakte/android/fragments/HomeListener;
.implements Lcom/vkontakte/android/attachments/StickerAttachment$Callback;
.implements Lcom/vkontakte/android/ui/holder/messages/MessageListItemHelper$MessageListItemHelperProvider;
.implements Lcom/vkontakte/android/stickers/StickersView$Listener;
.implements Lcom/vkontakte/android/ui/WriteBar$MentionSuggestionsSupplier;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/fragments/messages/ChatFragment$RoundDrawable;,
        Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z

.field private static final FORWARD_RESULT:I = 0xc8

.field private static final KEY_GROUP:Ljava/lang/String; = "key_group"

.field public static final TWO_E9:I = 0x77359400

.field public static activeInstance:Lcom/vkontakte/android/fragments/messages/ChatFragment;


# instance fields
.field public actionMode:Landroid/view/ActionMode;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private actionModeCallback:Landroid/view/ActionMode$Callback;

.field private adapter:Lcom/vkontakte/android/ui/adapters/MessagesAdapter;

.field private bottomSheetBehavior:Lcom/vk/attachpicker/widget/VkBottomSheetBehavior;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vk/attachpicker/widget/VkBottomSheetBehavior",
            "<",
            "Landroid/support/v7/widget/RecyclerView;",
            ">;"
        }
    .end annotation
.end field

.field public chatUserClickListener:Landroid/view/View$OnClickListener;

.field public chatUserLongClickListener:Landroid/view/View$OnLongClickListener;

.field private chatUsers:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;"
        }
    .end annotation
.end field

.field private contentView:Landroid/widget/LinearLayout;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private coordinatorMentionWrap:Landroid/support/design/widget/CoordinatorLayout;

.field private dataLoading:Z

.field private dataLoadingDown:Z

.field private errorView:Lcom/vkontakte/android/ui/ErrorViewHelper;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private group:Lcom/vkontakte/android/api/Group;

.field private hasSeparator:Z

.field private hideSearchedBgRunnable:Ljava/lang/Runnable;

.field private isActive:Z

.field private volatile isGroupLoading:Z

.field private isShowTyping:Z

.field private items:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/ui/holder/messages/MessageListItem;",
            ">;"
        }
    .end annotation
.end field

.field private jumpToEndBtn:Landroid/view/View;

.field private jumpedToEnd:Z

.field private keyboardVisible:Z

.field private lastTime:I

.field private lastTypingRequest:J

.field private list:Lcom/vkontakte/android/ui/widget/ChatRecyclerView;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private listWrap:Lcom/vkontakte/android/ui/widget/MessagesTimesList;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private loadMoreView:Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;

.field private loadMoreViewBtm:Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;

.field private mKeyboardPopup:Lcom/vkontakte/android/stickers/KeyboardPopup;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private mStickersView:Lcom/vkontakte/android/stickers/StickersView;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private mentionsAdapter:Lcom/vkontakte/android/ui/MentionsAdapter;

.field private mentionsBottomDivider:Landroid/view/View;

.field private mentionsRecyclerView:Lme/grishka/appkit/views/UsableRecyclerView;

.field private messages:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/Message;",
            ">;"
        }
    .end annotation
.end field

.field private messagesToForward:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/Message;",
            ">;"
        }
    .end annotation
.end field

.field private moreAvailable:Z

.field private moreAvailableDown:Z

.field private networkError:Z

.field private offsetFromBottom:I

.field private peer:I

.field private preloadOnReady:Z

.field private preloadOnReadyDown:Z

.field private preloadedMessages:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/Message;",
            ">;"
        }
    .end annotation
.end field

.field private preloadedMessagesDown:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/Message;",
            ">;"
        }
    .end annotation
.end field

.field private preloading:Z

.field private preloadingDown:Z

.field private progress:Landroid/widget/ProgressBar;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private receiver:Landroid/content/BroadcastReceiver;

.field private relayoutThumbsRequested:Z

.field private restoringDraft:Z

.field public searchedMessageId:I

.field private selectedMessages:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/Message;",
            ">;"
        }
    .end annotation
.end field

.field private shouldShowMentions:Z

.field private showChatInfoClickListener:Landroid/view/View$OnClickListener;

.field private subtitle:Ljava/lang/CharSequence;

.field private subtitleTyping:Ljava/lang/CharSequence;

.field timeAnchorPan:Lcom/vkontakte/android/ui/widget/MessageTimeAnchorView;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private titleWithoutIcon:Ljava/lang/CharSequence;

.field private typingInvalidate:Lcom/vkontakte/android/functions/VoidF0;

.field private final typingUsers:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private userNamesAcc:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private usersBuf:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;"
        }
    .end annotation
.end field

.field private writeBar:Lcom/vkontakte/android/ui/WriteBar;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 164
    const-class v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->$assertionsDisabled:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 899
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/VKToolbarFragment;-><init>()V

    .line 264
    iput-boolean v1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->isGroupLoading:Z

    .line 266
    invoke-static {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Lcom/vkontakte/android/functions/VoidF0;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->typingInvalidate:Lcom/vkontakte/android/functions/VoidF0;

    .line 268
    iput v1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->lastTime:I

    .line 269
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->titleWithoutIcon:Ljava/lang/CharSequence;

    .line 273
    iput-boolean v1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->isShowTyping:Z

    .line 285
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->items:Ljava/util/ArrayList;

    .line 286
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->messages:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->preloadedMessages:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->preloadedMessagesDown:Ljava/util/ArrayList;

    .line 290
    iput-boolean v1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->isActive:Z

    .line 291
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->userNamesAcc:Landroid/util/SparseArray;

    .line 292
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->typingUsers:Ljava/util/ArrayList;

    .line 293
    iput-boolean v1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->networkError:Z

    .line 294
    iput v1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->searchedMessageId:I

    .line 295
    invoke-static {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment$$Lambda$2;->lambdaFactory$(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/lang/Runnable;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->hideSearchedBgRunnable:Ljava/lang/Runnable;

    .line 312
    invoke-static {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment$$Lambda$3;->lambdaFactory$(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Landroid/view/View$OnClickListener;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->showChatInfoClickListener:Landroid/view/View$OnClickListener;

    .line 327
    new-instance v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment$1;-><init>(Lcom/vkontakte/android/fragments/messages/ChatFragment;)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->receiver:Landroid/content/BroadcastReceiver;

    .line 801
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->chatUsers:Landroid/util/SparseArray;

    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->usersBuf:Landroid/util/SparseArray;

    .line 802
    invoke-static {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment$$Lambda$4;->lambdaFactory$(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Landroid/view/View$OnClickListener;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->chatUserClickListener:Landroid/view/View$OnClickListener;

    .line 810
    invoke-static {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment$$Lambda$5;->lambdaFactory$(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Landroid/view/View$OnLongClickListener;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->chatUserLongClickListener:Landroid/view/View$OnLongClickListener;

    .line 829
    iput-boolean v1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->keyboardVisible:Z

    .line 830
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->selectedMessages:Ljava/util/ArrayList;

    .line 831
    new-instance v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$2;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment$2;-><init>(Lcom/vkontakte/android/fragments/messages/ChatFragment;)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->actionModeCallback:Landroid/view/ActionMode$Callback;

    .line 878
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->messagesToForward:Ljava/util/ArrayList;

    .line 886
    iput-boolean v1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->dataLoading:Z

    iput-boolean v2, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->moreAvailable:Z

    iput-boolean v1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->preloading:Z

    iput-boolean v1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->preloadOnReady:Z

    .line 887
    iput-boolean v1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->dataLoadingDown:Z

    iput-boolean v2, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->moreAvailableDown:Z

    iput-boolean v1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->preloadingDown:Z

    iput-boolean v1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->preloadOnReadyDown:Z

    .line 888
    iput v1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->offsetFromBottom:I

    .line 889
    iput-boolean v1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->hasSeparator:Z

    .line 891
    iput-boolean v1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->jumpedToEnd:Z

    .line 892
    iput-boolean v1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->relayoutThumbsRequested:Z

    .line 897
    iput-boolean v1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->restoringDraft:Z

    .line 900
    const v0, 0x7f03020a

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->setLayout(I)V

    .line 901
    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/messages/ChatFragment;

    .prologue
    .line 164
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->messages:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$100(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/messages/ChatFragment;

    .prologue
    .line 164
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->items:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$1000(Lcom/vkontakte/android/fragments/messages/ChatFragment;)I
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/messages/ChatFragment;

    .prologue
    .line 164
    iget v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->offsetFromBottom:I

    return v0
.end method

.method static synthetic access$1002(Lcom/vkontakte/android/fragments/messages/ChatFragment;I)I
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/messages/ChatFragment;
    .param p1, "x1"    # I

    .prologue
    .line 164
    iput p1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->offsetFromBottom:I

    return p1
.end method

.method static synthetic access$1008(Lcom/vkontakte/android/fragments/messages/ChatFragment;)I
    .locals 2
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/messages/ChatFragment;

    .prologue
    .line 164
    iget v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->offsetFromBottom:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->offsetFromBottom:I

    return v0
.end method

.method static synthetic access$1100(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Landroid/util/SparseArray;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/messages/ChatFragment;

    .prologue
    .line 164
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->userNamesAcc:Landroid/util/SparseArray;

    return-object v0
.end method

.method static synthetic access$1200(Lcom/vkontakte/android/fragments/messages/ChatFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/messages/ChatFragment;

    .prologue
    .line 164
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->showJumpButton()V

    return-void
.end method

.method static synthetic access$1300(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/messages/ChatFragment;

    .prologue
    .line 164
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->isActive:Z

    return v0
.end method

.method static synthetic access$1400(Lcom/vkontakte/android/fragments/messages/ChatFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/messages/ChatFragment;

    .prologue
    .line 164
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->markAsRead()V

    return-void
.end method

.method static synthetic access$1500(Lcom/vkontakte/android/fragments/messages/ChatFragment;Ljava/util/Collection;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/messages/ChatFragment;
    .param p1, "x1"    # Ljava/util/Collection;

    .prologue
    .line 164
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->loadFwdUsers(Ljava/util/Collection;)V

    return-void
.end method

.method static synthetic access$1600(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/messages/ChatFragment;

    .prologue
    .line 164
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->hasSeparator:Z

    return v0
.end method

.method static synthetic access$1700(Lcom/vkontakte/android/fragments/messages/ChatFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/messages/ChatFragment;

    .prologue
    .line 164
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->removeSeparator()V

    return-void
.end method

.method static synthetic access$1800(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/messages/ChatFragment;

    .prologue
    .line 164
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->typingUsers:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$1900(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Landroid/util/SparseArray;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/messages/ChatFragment;

    .prologue
    .line 164
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->chatUsers:Landroid/util/SparseArray;

    return-object v0
.end method

.method static synthetic access$200(Lcom/vkontakte/android/fragments/messages/ChatFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/messages/ChatFragment;

    .prologue
    .line 164
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->updateList()V

    return-void
.end method

.method static synthetic access$2000(Lcom/vkontakte/android/fragments/messages/ChatFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/messages/ChatFragment;

    .prologue
    .line 164
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->updateTyping()V

    return-void
.end method

.method static synthetic access$2100(Lcom/vkontakte/android/fragments/messages/ChatFragment;I)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/messages/ChatFragment;
    .param p1, "x1"    # I

    .prologue
    .line 164
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->updateOnline(I)V

    return-void
.end method

.method static synthetic access$2200(Lcom/vkontakte/android/fragments/messages/ChatFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/messages/ChatFragment;

    .prologue
    .line 164
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->rebuildItems()V

    return-void
.end method

.method static synthetic access$2300(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/messages/ChatFragment;

    .prologue
    .line 164
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->networkError:Z

    return v0
.end method

.method static synthetic access$2302(Lcom/vkontakte/android/fragments/messages/ChatFragment;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/messages/ChatFragment;
    .param p1, "x1"    # Z

    .prologue
    .line 164
    iput-boolean p1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->networkError:Z

    return p1
.end method

.method static synthetic access$2400(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/messages/ChatFragment;

    .prologue
    .line 164
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->preloadedMessages:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$2500(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/messages/ChatFragment;

    .prologue
    .line 164
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->preloadedMessagesDown:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$2600(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/messages/ChatFragment;

    .prologue
    .line 164
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->jumpedToEnd:Z

    return v0
.end method

.method static synthetic access$2602(Lcom/vkontakte/android/fragments/messages/ChatFragment;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/messages/ChatFragment;
    .param p1, "x1"    # Z

    .prologue
    .line 164
    iput-boolean p1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->jumpedToEnd:Z

    return p1
.end method

.method static synthetic access$2700(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Landroid/widget/ProgressBar;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/messages/ChatFragment;

    .prologue
    .line 164
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->progress:Landroid/widget/ProgressBar;

    return-object v0
.end method

.method static synthetic access$2800(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Lcom/vkontakte/android/ui/widget/MessagesTimesList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/messages/ChatFragment;

    .prologue
    .line 164
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->listWrap:Lcom/vkontakte/android/ui/widget/MessagesTimesList;

    return-object v0
.end method

.method static synthetic access$2900(Lcom/vkontakte/android/fragments/messages/ChatFragment;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/messages/ChatFragment;
    .param p1, "x1"    # Z

    .prologue
    .line 164
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->loadData(Z)V

    return-void
.end method

.method static synthetic access$300(Lcom/vkontakte/android/fragments/messages/ChatFragment;)I
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/messages/ChatFragment;

    .prologue
    .line 164
    iget v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->peer:I

    return v0
.end method

.method static synthetic access$3000(Lcom/vkontakte/android/fragments/messages/ChatFragment;I)Landroid/support/v4/util/Pair;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/messages/ChatFragment;
    .param p1, "x1"    # I

    .prologue
    .line 164
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getMessageAndIndex(I)Landroid/support/v4/util/Pair;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$3100(Lcom/vkontakte/android/fragments/messages/ChatFragment;Lcom/vkontakte/android/Message;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/messages/ChatFragment;
    .param p1, "x1"    # Lcom/vkontakte/android/Message;

    .prologue
    .line 164
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->isAudioMessage(Lcom/vkontakte/android/Message;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$3200(Lcom/vkontakte/android/Message;Lcom/vkontakte/android/Message;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/Message;
    .param p1, "x1"    # Lcom/vkontakte/android/Message;

    .prologue
    .line 164
    invoke-static {p0, p1}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->isTimeStepInterval(Lcom/vkontakte/android/Message;Lcom/vkontakte/android/Message;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$3300(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/messages/ChatFragment;

    .prologue
    .line 164
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->selectedMessages:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$3400(Lcom/vkontakte/android/fragments/messages/ChatFragment;Ljava/util/List;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/messages/ChatFragment;
    .param p1, "x1"    # Ljava/util/List;

    .prologue
    .line 164
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->confirmAndDelete(Ljava/util/List;)V

    return-void
.end method

.method static synthetic access$3500(Lcom/vkontakte/android/fragments/messages/ChatFragment;Ljava/util/ArrayList;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/messages/ChatFragment;
    .param p1, "x1"    # Ljava/util/ArrayList;

    .prologue
    .line 164
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->forward(Ljava/util/ArrayList;)V

    return-void
.end method

.method static synthetic access$3600(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Lcom/vkontakte/android/ui/WriteBar;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/messages/ChatFragment;

    .prologue
    .line 164
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->writeBar:Lcom/vkontakte/android/ui/WriteBar;

    return-object v0
.end method

.method static synthetic access$3700(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Lcom/vkontakte/android/stickers/KeyboardPopup;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/messages/ChatFragment;

    .prologue
    .line 164
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->mKeyboardPopup:Lcom/vkontakte/android/stickers/KeyboardPopup;

    return-object v0
.end method

.method static synthetic access$3800(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/messages/ChatFragment;

    .prologue
    .line 164
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->jumpToEndBtn:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$3900(Lcom/vkontakte/android/fragments/messages/ChatFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/messages/ChatFragment;

    .prologue
    .line 164
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->hideJumpButton()V

    return-void
.end method

.method static synthetic access$400(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Lcom/vkontakte/android/ui/widget/ChatRecyclerView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/messages/ChatFragment;

    .prologue
    .line 164
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->list:Lcom/vkontakte/android/ui/widget/ChatRecyclerView;

    return-object v0
.end method

.method static synthetic access$4000(Lcom/vkontakte/android/fragments/messages/ChatFragment;)I
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/messages/ChatFragment;

    .prologue
    .line 164
    iget v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->lastTime:I

    return v0
.end method

.method static synthetic access$4002(Lcom/vkontakte/android/fragments/messages/ChatFragment;I)I
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/messages/ChatFragment;
    .param p1, "x1"    # I

    .prologue
    .line 164
    iput p1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->lastTime:I

    return p1
.end method

.method static synthetic access$4100(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/messages/ChatFragment;

    .prologue
    .line 164
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->preloading:Z

    return v0
.end method

.method static synthetic access$4102(Lcom/vkontakte/android/fragments/messages/ChatFragment;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/messages/ChatFragment;
    .param p1, "x1"    # Z

    .prologue
    .line 164
    iput-boolean p1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->preloading:Z

    return p1
.end method

.method static synthetic access$4200(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/messages/ChatFragment;

    .prologue
    .line 164
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->moreAvailable:Z

    return v0
.end method

.method static synthetic access$4202(Lcom/vkontakte/android/fragments/messages/ChatFragment;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/messages/ChatFragment;
    .param p1, "x1"    # Z

    .prologue
    .line 164
    iput-boolean p1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->moreAvailable:Z

    return p1
.end method

.method static synthetic access$4300(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/messages/ChatFragment;

    .prologue
    .line 164
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->preloadOnReady:Z

    return v0
.end method

.method static synthetic access$4302(Lcom/vkontakte/android/fragments/messages/ChatFragment;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/messages/ChatFragment;
    .param p1, "x1"    # Z

    .prologue
    .line 164
    iput-boolean p1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->preloadOnReady:Z

    return p1
.end method

.method static synthetic access$4400(Lcom/vkontakte/android/fragments/messages/ChatFragment;Ljava/util/List;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/messages/ChatFragment;
    .param p1, "x1"    # Ljava/util/List;

    .prologue
    .line 164
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->prependMessages(Ljava/util/List;)V

    return-void
.end method

.method static synthetic access$4500(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/messages/ChatFragment;

    .prologue
    .line 164
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->loadMoreView:Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;

    return-object v0
.end method

.method static synthetic access$4600(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/messages/ChatFragment;

    .prologue
    .line 164
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->dataLoadingDown:Z

    return v0
.end method

.method static synthetic access$4602(Lcom/vkontakte/android/fragments/messages/ChatFragment;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/messages/ChatFragment;
    .param p1, "x1"    # Z

    .prologue
    .line 164
    iput-boolean p1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->dataLoadingDown:Z

    return p1
.end method

.method static synthetic access$4700(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/messages/ChatFragment;

    .prologue
    .line 164
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->preloadingDown:Z

    return v0
.end method

.method static synthetic access$4702(Lcom/vkontakte/android/fragments/messages/ChatFragment;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/messages/ChatFragment;
    .param p1, "x1"    # Z

    .prologue
    .line 164
    iput-boolean p1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->preloadingDown:Z

    return p1
.end method

.method static synthetic access$4800(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/messages/ChatFragment;

    .prologue
    .line 164
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->moreAvailableDown:Z

    return v0
.end method

.method static synthetic access$4802(Lcom/vkontakte/android/fragments/messages/ChatFragment;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/messages/ChatFragment;
    .param p1, "x1"    # Z

    .prologue
    .line 164
    iput-boolean p1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->moreAvailableDown:Z

    return p1
.end method

.method static synthetic access$4900(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/messages/ChatFragment;

    .prologue
    .line 164
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->preloadOnReadyDown:Z

    return v0
.end method

.method static synthetic access$4902(Lcom/vkontakte/android/fragments/messages/ChatFragment;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/messages/ChatFragment;
    .param p1, "x1"    # Z

    .prologue
    .line 164
    iput-boolean p1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->preloadOnReadyDown:Z

    return p1
.end method

.method static synthetic access$500(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Lcom/vkontakte/android/ui/adapters/MessagesAdapter;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/messages/ChatFragment;

    .prologue
    .line 164
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->adapter:Lcom/vkontakte/android/ui/adapters/MessagesAdapter;

    return-object v0
.end method

.method static synthetic access$5000(Lcom/vkontakte/android/fragments/messages/ChatFragment;Ljava/util/List;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/messages/ChatFragment;
    .param p1, "x1"    # Ljava/util/List;

    .prologue
    .line 164
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->appendMessages(Ljava/util/List;)V

    return-void
.end method

.method static synthetic access$5100(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/messages/ChatFragment;

    .prologue
    .line 164
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->loadMoreViewBtm:Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;

    return-object v0
.end method

.method static synthetic access$5200(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/messages/ChatFragment;

    .prologue
    .line 164
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->restoringDraft:Z

    return v0
.end method

.method static synthetic access$5300(Lcom/vkontakte/android/fragments/messages/ChatFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/messages/ChatFragment;

    .prologue
    .line 164
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->sendTypingIfNeeded()V

    return-void
.end method

.method static synthetic access$5400(Lcom/vkontakte/android/fragments/messages/ChatFragment;I)Ljava/lang/CharSequence;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/messages/ChatFragment;
    .param p1, "x1"    # I

    .prologue
    .line 164
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getOnlineString(I)Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$5502(Lcom/vkontakte/android/fragments/messages/ChatFragment;Lcom/vkontakte/android/api/Group;)Lcom/vkontakte/android/api/Group;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/messages/ChatFragment;
    .param p1, "x1"    # Lcom/vkontakte/android/api/Group;

    .prologue
    .line 164
    iput-object p1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->group:Lcom/vkontakte/android/api/Group;

    return-object p1
.end method

.method static synthetic access$5600(Lcom/vkontakte/android/fragments/messages/ChatFragment;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/messages/ChatFragment;
    .param p1, "x1"    # Z

    .prologue
    .line 164
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->setEnableWriteBarIfDoesNotHaveSpecialMarketAttachment(Z)V

    return-void
.end method

.method static synthetic access$5702(Lcom/vkontakte/android/fragments/messages/ChatFragment;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/messages/ChatFragment;
    .param p1, "x1"    # Z

    .prologue
    .line 164
    iput-boolean p1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->isGroupLoading:Z

    return p1
.end method

.method static synthetic access$5800(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Lcom/vkontakte/android/ui/ErrorViewHelper;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/messages/ChatFragment;

    .prologue
    .line 164
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->errorView:Lcom/vkontakte/android/ui/ErrorViewHelper;

    return-object v0
.end method

.method static synthetic access$5900(Lcom/vkontakte/android/fragments/messages/ChatFragment;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/messages/ChatFragment;
    .param p1, "x1"    # Z

    .prologue
    .line 164
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->loadDataUp(Z)V

    return-void
.end method

.method static synthetic access$600(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/lang/CharSequence;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/messages/ChatFragment;

    .prologue
    .line 164
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->titleWithoutIcon:Ljava/lang/CharSequence;

    return-object v0
.end method

.method static synthetic access$6000(Lcom/vkontakte/android/fragments/messages/ChatFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/messages/ChatFragment;

    .prologue
    .line 164
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->smoothScrollToBottom()V

    return-void
.end method

.method static synthetic access$6100(Lcom/vkontakte/android/fragments/messages/ChatFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/messages/ChatFragment;

    .prologue
    .line 164
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->loadDataDown()V

    return-void
.end method

.method static synthetic access$6200(Lcom/vkontakte/android/fragments/messages/ChatFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/messages/ChatFragment;

    .prologue
    .line 164
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->relayoutThumbs()V

    return-void
.end method

.method static synthetic access$700(Lcom/vkontakte/android/fragments/messages/ChatFragment;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/messages/ChatFragment;
    .param p1, "x1"    # Z

    .prologue
    .line 164
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->loadGroupInfo(Z)V

    return-void
.end method

.method static synthetic access$800(Lcom/vkontakte/android/fragments/messages/ChatFragment;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/messages/ChatFragment;
    .param p1, "x1"    # Z

    .prologue
    .line 164
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->updateChatUsers(Z)V

    return-void
.end method

.method static synthetic access$900(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/messages/ChatFragment;

    .prologue
    .line 164
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->dataLoading:Z

    return v0
.end method

.method static synthetic access$902(Lcom/vkontakte/android/fragments/messages/ChatFragment;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/messages/ChatFragment;
    .param p1, "x1"    # Z

    .prologue
    .line 164
    iput-boolean p1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->dataLoading:Z

    return p1
.end method

.method static synthetic access$lambda$0(Lcom/vkontakte/android/fragments/messages/ChatFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->hideSearchedMessageBg()V

    return-void
.end method

.method static synthetic access$lambda$1(Lcom/vkontakte/android/fragments/messages/ChatFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->updateChatUsersPhotos()V

    return-void
.end method

.method static synthetic access$lambda$2(Lcom/vkontakte/android/fragments/messages/ChatFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->updateChatUsersPhotos()V

    return-void
.end method

.method private appendMessages(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/Message;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 2784
    .local p1, "msgs":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/Message;>;"
    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->list:Lcom/vkontakte/android/ui/widget/ChatRecyclerView;

    .line 2785
    .local v1, "l":Lcom/vkontakte/android/ui/widget/VKRecyclerView;
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    if-eqz v2, :cond_0

    if-nez v1, :cond_1

    .line 2797
    :cond_0
    :goto_0
    return-void

    .line 2788
    :cond_1
    iget-object v2, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->messages:Ljava/util/ArrayList;

    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 2789
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 2790
    .local v0, "fwdUidSet":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    iget-object v2, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->items:Ljava/util/ArrayList;

    invoke-static {p0, p1, v0}, Lcom/vkontakte/android/ui/holder/messages/MessageListItemHelper;->buildItems(Lcom/vkontakte/android/ui/holder/messages/MessageListItemHelper$MessageListItemHelperProvider;Ljava/util/List;Ljava/util/Set;)Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 2791
    iget-object v2, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->items:Ljava/util/ArrayList;

    invoke-static {v2}, Lcom/vkontakte/android/ui/holder/messages/MessageListItemHelper;->fixTimes(Ljava/util/List;)I

    .line 2792
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->updateList()V

    .line 2793
    invoke-direct {p0, v0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->loadFwdUsers(Ljava/util/Collection;)V

    .line 2794
    iget-boolean v2, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->isActive:Z

    if-eqz v2, :cond_0

    .line 2795
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->markAsRead()V

    goto :goto_0
.end method

.method private confirmAndDelete(Ljava/util/List;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/Message;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, "msgs":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/Message;>;"
    const/4 v6, 0x1

    const/4 v8, 0x0

    .line 2648
    new-instance v0, Lcom/vkontakte/android/VKAlertDialog$Builder;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vkontakte/android/VKAlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x7f0801a9

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f0801a8

    new-array v2, v6, [Ljava/lang/Object;

    .line 2649
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0d0059

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v5

    new-array v6, v6, [Ljava/lang/Object;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v8

    invoke-virtual {v3, v4, v5, v6}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v8

    invoke-virtual {p0, v1, v2}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f080798

    invoke-static {p0, p1}, Lcom/vkontakte/android/fragments/messages/ChatFragment$$Lambda$21;->lambdaFactory$(Lcom/vkontakte/android/fragments/messages/ChatFragment;Ljava/util/List;)Landroid/content/DialogInterface$OnClickListener;

    move-result-object v2

    .line 2650
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f080433

    const/4 v2, 0x0

    .line 2651
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 2652
    return-void
.end method

.method private deleteMessages(Ljava/util/List;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/Message;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 2655
    .local p1, "msgs":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/Message;>;"
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 2656
    .local v2, "mids":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/Message;

    .line 2657
    .local v1, "m":Lcom/vkontakte/android/Message;
    iget v5, v1, Lcom/vkontakte/android/Message;->id:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 2659
    .end local v1    # "m":Lcom/vkontakte/android/Message;
    :cond_0
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->stopPlayAudioMessage(Ljava/util/List;)V

    .line 2660
    const/4 v4, 0x0

    invoke-static {v2, v4}, Lcom/vkontakte/android/data/Messages;->delete(Ljava/util/List;Z)V

    .line 2661
    iget-object v4, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->messages:Ljava/util/ArrayList;

    invoke-virtual {v4, p1}, Ljava/util/ArrayList;->removeAll(Ljava/util/Collection;)Z

    .line 2662
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 2663
    .local v3, "toRemove":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/ui/holder/messages/MessageListItem;>;"
    iget-object v4, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->items:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_1
    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;

    .line 2664
    .local v0, "item":Lcom/vkontakte/android/ui/holder/messages/MessageListItem;
    iget v5, v0, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->msgId:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 2665
    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 2668
    .end local v0    # "item":Lcom/vkontakte/android/ui/holder/messages/MessageListItem;
    :cond_2
    iget-object v4, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->items:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->removeAll(Ljava/util/Collection;)Z

    .line 2669
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->updateList()V

    .line 2670
    return-void
.end method

.method private forward(Ljava/util/ArrayList;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/Message;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 2684
    .local p1, "msgs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/Message;>;"
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->messagesToForward:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 2685
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->messagesToForward:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 2686
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->messagesToForward:Ljava/util/ArrayList;

    invoke-static {}, Lcom/vkontakte/android/fragments/messages/ChatFragment$$Lambda$22;->lambdaFactory$()Ljava/util/Comparator;

    move-result-object v1

    invoke-static {v0, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 2687
    new-instance v0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$Builder;

    invoke-direct {v0}, Lcom/vkontakte/android/fragments/messages/DialogsFragment$Builder;-><init>()V

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/messages/DialogsFragment$Builder;->setSelectMode()Lcom/vkontakte/android/fragments/messages/DialogsFragment$Builder;

    move-result-object v0

    const/16 v1, 0xc8

    invoke-virtual {v0, p0, v1}, Lcom/vkontakte/android/fragments/messages/DialogsFragment$Builder;->forResult(Landroid/app/Fragment;I)Z

    .line 2688
    return-void
.end method

.method private getMessage(I)Lcom/vkontakte/android/Message;
    .locals 3
    .param p1, "id"    # I

    .prologue
    .line 1820
    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->messages:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/Message;

    .line 1821
    .local v0, "m":Lcom/vkontakte/android/Message;
    iget v2, v0, Lcom/vkontakte/android/Message;->id:I

    if-ne v2, p1, :cond_0

    .line 1825
    .end local v0    # "m":Lcom/vkontakte/android/Message;
    :goto_0
    return-object v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private getMessageAndIndex(I)Landroid/support/v4/util/Pair;
    .locals 4
    .param p1, "id"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Landroid/support/v4/util/Pair",
            "<",
            "Lcom/vkontakte/android/Message;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1829
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v2, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->messages:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v0, v2, :cond_1

    .line 1830
    iget-object v2, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->messages:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/Message;

    .line 1831
    .local v1, "m":Lcom/vkontakte/android/Message;
    iget v2, v1, Lcom/vkontakte/android/Message;->id:I

    if-ne v2, p1, :cond_0

    .line 1832
    new-instance v2, Landroid/support/v4/util/Pair;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-direct {v2, v1, v3}, Landroid/support/v4/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 1835
    .end local v1    # "m":Lcom/vkontakte/android/Message;
    :goto_1
    return-object v2

    .line 1829
    .restart local v1    # "m":Lcom/vkontakte/android/Message;
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1835
    .end local v1    # "m":Lcom/vkontakte/android/Message;
    :cond_1
    const/4 v2, 0x0

    goto :goto_1
.end method

.method private getMessageBrokenAttachment(Lcom/vkontakte/android/Message;)Lcom/vkontakte/android/attachments/Attachment;
    .locals 4
    .param p1, "message"    # Lcom/vkontakte/android/Message;

    .prologue
    .line 2577
    iget-object v2, p1, Lcom/vkontakte/android/Message;->attachments:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/attachments/Attachment;

    .line 2578
    .local v0, "attach":Lcom/vkontakte/android/attachments/Attachment;
    instance-of v2, v0, Lcom/vkontakte/android/attachments/PendingAttachment;

    if-eqz v2, :cond_0

    move-object v2, v0

    .line 2579
    check-cast v2, Lcom/vkontakte/android/attachments/PendingAttachment;

    invoke-interface {v2}, Lcom/vkontakte/android/attachments/PendingAttachment;->getUrl()Ljava/lang/String;

    move-result-object v1

    .line 2580
    .local v1, "file":Ljava/lang/String;
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_0

    .line 2585
    .end local v0    # "attach":Lcom/vkontakte/android/attachments/Attachment;
    .end local v1    # "file":Ljava/lang/String;
    :goto_0
    return-object v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private getOnlineString(I)Ljava/lang/CharSequence;
    .locals 8
    .param p1, "online"    # I

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 1620
    if-lez p1, :cond_1

    const v4, 0x7f08047d

    :goto_0
    invoke-virtual {p0, v4}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 1621
    .local v0, "base":Ljava/lang/String;
    if-eqz p1, :cond_0

    if-ne p1, v7, :cond_2

    :cond_0
    move-object v1, v0

    .line 1631
    :goto_1
    return-object v1

    .line 1620
    .end local v0    # "base":Ljava/lang/String;
    :cond_1
    const v4, 0x7f080478

    goto :goto_0

    .line 1624
    .restart local v0    # "base":Ljava/lang/String;
    :cond_2
    new-instance v1, Landroid/text/SpannableStringBuilder;

    invoke-direct {v1, v0}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 1625
    .local v1, "bldr":Landroid/text/SpannableStringBuilder;
    invoke-static {}, Landroid/text/Spannable$Factory;->getInstance()Landroid/text/Spannable$Factory;

    move-result-object v4

    const-string/jumbo v5, "F"

    invoke-virtual {v4, v5}, Landroid/text/Spannable$Factory;->newSpannable(Ljava/lang/CharSequence;)Landroid/text/Spannable;

    move-result-object v3

    .line 1626
    .local v3, "sp":Landroid/text/Spannable;
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f0201d6

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    .line 1627
    .local v2, "d":Landroid/graphics/drawable/Drawable;
    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v4

    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v5

    invoke-virtual {v2, v6, v6, v4, v5}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 1628
    new-instance v4, Landroid/text/style/ImageSpan;

    invoke-direct {v4, v2, v7}, Landroid/text/style/ImageSpan;-><init>(Landroid/graphics/drawable/Drawable;I)V

    invoke-interface {v3, v4, v6, v7, v6}, Landroid/text/Spannable;->setSpan(Ljava/lang/Object;III)V

    .line 1629
    const-string/jumbo v4, "\u00a0"

    invoke-virtual {v1, v4}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 1630
    invoke-virtual {v1, v3}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    goto :goto_1
.end method

.method private hideJumpButton()V
    .locals 8

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 1759
    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->jumpToEndBtn:Landroid/view/View;

    .line 1760
    .local v1, "v":Landroid/view/View;
    if-eqz v1, :cond_0

    .line 1761
    new-instance v0, Landroid/animation/AnimatorSet;

    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 1762
    .local v0, "set":Landroid/animation/AnimatorSet;
    const/4 v2, 0x2

    new-array v2, v2, [Landroid/animation/Animator;

    const-string/jumbo v3, "alpha"

    new-array v4, v7, [F

    const/4 v5, 0x0

    aput v5, v4, v6

    invoke-static {v1, v3, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v3

    aput-object v3, v2, v6

    const-string/jumbo v3, "translationY"

    new-array v4, v7, [F

    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    move-result v5

    div-int/lit8 v5, v5, 0x2

    int-to-float v5, v5

    aput v5, v4, v6

    invoke-static {v1, v3, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v3

    aput-object v3, v2, v7

    invoke-virtual {v0, v2}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 1763
    const-wide/16 v2, 0x12c

    invoke-virtual {v0, v2, v3}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 1764
    new-instance v2, Lcom/vkontakte/android/fragments/messages/ChatFragment$11;

    invoke-direct {v2, p0, v1}, Lcom/vkontakte/android/fragments/messages/ChatFragment$11;-><init>(Lcom/vkontakte/android/fragments/messages/ChatFragment;Landroid/view/View;)V

    invoke-virtual {v0, v2}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 1772
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    .line 1774
    .end local v0    # "set":Landroid/animation/AnimatorSet;
    :cond_0
    return-void
.end method

.method private hideSearchedMessageBg()V
    .locals 2

    .prologue
    .line 1443
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->adapter:Lcom/vkontakte/android/ui/adapters/MessagesAdapter;

    iget v1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->searchedMessageId:I

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/adapters/MessagesAdapter;->setSearchedViewBackgroundColor(I)V

    .line 1444
    const/4 v0, 0x0

    iput v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->searchedMessageId:I

    .line 1445
    return-void
.end method

.method private isAudioMessage(Lcom/vkontakte/android/Message;)Z
    .locals 3
    .param p1, "message"    # Lcom/vkontakte/android/Message;

    .prologue
    .line 2800
    iget-object v1, p1, Lcom/vkontakte/android/Message;->attachments:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/attachments/Attachment;

    .line 2801
    .local v0, "att":Lcom/vkontakte/android/attachments/Attachment;
    instance-of v2, v0, Lcom/vkontakte/android/attachments/AudioMessageAttachment;

    if-eqz v2, :cond_0

    .line 2802
    const/4 v1, 0x1

    .line 2805
    .end local v0    # "att":Lcom/vkontakte/android/attachments/Attachment;
    :goto_0
    return v1

    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private static isTimeStepInterval(Lcom/vkontakte/android/Message;Lcom/vkontakte/android/Message;)Z
    .locals 4
    .param p0, "first"    # Lcom/vkontakte/android/Message;
    .param p1, "second"    # Lcom/vkontakte/android/Message;

    .prologue
    .line 2809
    iget v2, p0, Lcom/vkontakte/android/Message;->time:I

    invoke-static {}, Ljava/util/TimeZone;->getDefault()Ljava/util/TimeZone;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/TimeZone;->getRawOffset()I

    move-result v3

    div-int/lit16 v3, v3, 0x3e8

    add-int v0, v2, v3

    .line 2810
    .local v0, "firstMessageTime":I
    iget v2, p1, Lcom/vkontakte/android/Message;->time:I

    invoke-static {}, Ljava/util/TimeZone;->getDefault()Ljava/util/TimeZone;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/TimeZone;->getRawOffset()I

    move-result v3

    div-int/lit16 v3, v3, 0x3e8

    add-int v1, v2, v3

    .line 2811
    .local v1, "secondMessageTime":I
    sub-int v2, v1, v0

    const/16 v3, 0x1c20

    if-le v2, v3, :cond_0

    const/4 v2, 0x1

    :goto_0
    return v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method private jumpToEnd()V
    .locals 1

    .prologue
    .line 1730
    iget v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->offsetFromBottom:I

    if-nez v0, :cond_1

    .line 1731
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->smoothScrollToBottom()V

    .line 1732
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->hideJumpButton()V

    .line 1738
    :cond_0
    :goto_0
    return-void

    .line 1733
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->jumpToEndBtn:Landroid/view/View;

    if-eqz v0, :cond_0

    .line 1734
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->hideJumpButton()V

    .line 1735
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->loadDataUp(Z)V

    .line 1736
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->jumpedToEnd:Z

    goto :goto_0
.end method

.method static synthetic lambda$forward$22(Lcom/vkontakte/android/Message;Lcom/vkontakte/android/Message;)I
    .locals 2
    .param p0, "lhs"    # Lcom/vkontakte/android/Message;
    .param p1, "rhs"    # Lcom/vkontakte/android/Message;

    .prologue
    .line 2686
    iget v0, p0, Lcom/vkontakte/android/Message;->time:I

    iget v1, p1, Lcom/vkontakte/android/Message;->time:I

    if-le v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, -0x1

    goto :goto_0
.end method

.method static synthetic lambda$setDialogIcon$4(Landroid/support/v7/widget/Toolbar;Landroid/graphics/Bitmap;)V
    .locals 1
    .param p0, "toolbar"    # Landroid/support/v7/widget/Toolbar;
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 957
    new-instance v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$RoundDrawable;

    invoke-direct {v0, p1}, Lcom/vkontakte/android/fragments/messages/ChatFragment$RoundDrawable;-><init>(Landroid/graphics/Bitmap;)V

    invoke-virtual {p0, v0}, Landroid/support/v7/widget/Toolbar;->setLogo(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method static synthetic lambda$setDialogIcon$5(Ljava/lang/Throwable;)V
    .locals 0
    .param p0, "throwable"    # Ljava/lang/Throwable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 958
    return-void
.end method

.method private loadData(Z)V
    .locals 1
    .param p1, "up"    # Z

    .prologue
    .line 1961
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->loadGroupInfo(Z)V

    .line 1962
    if-eqz p1, :cond_0

    .line 1963
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->loadDataUp(Z)V

    .line 1967
    :goto_0
    return-void

    .line 1965
    :cond_0
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->loadDataDown()V

    goto :goto_0
.end method

.method private loadDataDown()V
    .locals 5

    .prologue
    .line 2149
    const/4 v3, 0x1

    iput-boolean v3, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->dataLoadingDown:Z

    .line 2150
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v3

    const-string/jumbo v4, "msg_id"

    invoke-virtual {v3, v4}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v2

    .line 2151
    .local v2, "startMid":I
    iget-boolean v3, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->preloadingDown:Z

    if-eqz v3, :cond_0

    const/16 v0, 0x1e

    .line 2152
    .local v0, "count":I
    :goto_0
    iget v3, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->offsetFromBottom:I

    sub-int v1, v3, v0

    .line 2153
    .local v1, "offset":I
    iget v3, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->peer:I

    new-instance v4, Lcom/vkontakte/android/fragments/messages/ChatFragment$17;

    invoke-direct {v4, p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment$17;-><init>(Lcom/vkontakte/android/fragments/messages/ChatFragment;)V

    invoke-static {v3, v1, v0, v2, v4}, Lcom/vkontakte/android/data/Messages;->getHistory(IIIILcom/vkontakte/android/data/Messages$GetMessagesCallback;)V

    .line 2251
    return-void

    .line 2151
    .end local v0    # "count":I
    .end local v1    # "offset":I
    :cond_0
    const/16 v0, 0x3c

    goto :goto_0
.end method

.method private loadDataUp(Z)V
    .locals 7
    .param p1, "fromUnread"    # Z

    .prologue
    .line 1970
    const/4 v3, 0x1

    iput-boolean v3, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->dataLoading:Z

    .line 1971
    iget-object v3, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->messages:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v1

    .line 1972
    .local v1, "offset":I
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v3

    const-string/jumbo v6, "msg_id"

    invoke-virtual {v3, v6}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v2

    .line 1973
    .local v2, "startMid":I
    iget-boolean v3, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->preloading:Z

    if-eqz v3, :cond_3

    const/16 v0, 0x1e

    .line 1974
    .local v0, "count":I
    :goto_0
    if-nez v1, :cond_4

    if-nez p1, :cond_0

    if-lez v2, :cond_4

    .line 1975
    :cond_0
    if-nez v2, :cond_1

    .line 1976
    const/4 v2, -0x1

    .line 1978
    :cond_1
    const/16 v1, -0x14

    .line 1984
    :cond_2
    :goto_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    .line 1985
    .local v4, "startTime":J
    iget v3, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->peer:I

    new-instance v6, Lcom/vkontakte/android/fragments/messages/ChatFragment$16;

    invoke-direct {v6, p0, p1, v4, v5}, Lcom/vkontakte/android/fragments/messages/ChatFragment$16;-><init>(Lcom/vkontakte/android/fragments/messages/ChatFragment;ZJ)V

    invoke-static {v3, v1, v0, v2, v6}, Lcom/vkontakte/android/data/Messages;->getHistory(IIIILcom/vkontakte/android/data/Messages$GetMessagesCallback;)V

    .line 2146
    return-void

    .line 1973
    .end local v0    # "count":I
    .end local v4    # "startTime":J
    :cond_3
    const/16 v0, 0x3c

    goto :goto_0

    .line 1979
    .restart local v0    # "count":I
    :cond_4
    if-nez p1, :cond_5

    .line 1980
    const/4 v1, 0x0

    goto :goto_1

    .line 1981
    :cond_5
    iget v3, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->offsetFromBottom:I

    if-lez v3, :cond_2

    .line 1982
    iget v3, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->offsetFromBottom:I

    iget-object v6, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->messages:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    add-int v1, v3, v6

    goto :goto_1
.end method

.method private loadFwdUsers(Ljava/util/Collection;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 2691
    .local p1, "uids":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/Integer;>;"
    invoke-static {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment$$Lambda$23;->lambdaFactory$(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Lcom/vkontakte/android/data/Friends$GetUsersCallback;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/vkontakte/android/data/Friends;->getUsers(Ljava/util/Collection;Lcom/vkontakte/android/data/Friends$GetUsersCallback;)V

    .line 2704
    return-void
.end method

.method private loadGroupInfo(Z)V
    .locals 6
    .param p1, "reload"    # Z

    .prologue
    .line 1938
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    const-string/jumbo v2, "id"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    .line 1939
    .local v0, "id":I
    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->group:Lcom/vkontakte/android/api/Group;

    if-eqz v1, :cond_0

    if-eqz p1, :cond_2

    :cond_0
    const-wide v2, -0x3e22329b00000000L    # -2.0E9

    iget v1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->peer:I

    int-to-double v4, v1

    cmpg-double v1, v2, v4

    if-gez v1, :cond_2

    iget v1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->peer:I

    if-gez v1, :cond_2

    iget-boolean v1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->isGroupLoading:Z

    if-nez v1, :cond_2

    .line 1940
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->isGroupLoading:Z

    .line 1941
    if-gez v0, :cond_1

    neg-int v0, v0

    .line 1942
    :cond_1
    new-instance v1, Lcom/vkontakte/android/api/groups/GroupsGetById;

    invoke-direct {v1, v0}, Lcom/vkontakte/android/api/groups/GroupsGetById;-><init>(I)V

    new-instance v2, Lcom/vkontakte/android/fragments/messages/ChatFragment$15;

    invoke-direct {v2, p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment$15;-><init>(Lcom/vkontakte/android/fragments/messages/ChatFragment;)V

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/api/groups/GroupsGetById;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    .line 1956
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 1958
    :cond_2
    return-void
.end method

.method private markAsRead()V
    .locals 4

    .prologue
    .line 2479
    const/4 v1, 0x0

    .line 2480
    .local v1, "last":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v3, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->messages:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v0, v3, :cond_1

    .line 2481
    iget-object v3, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->messages:Ljava/util/ArrayList;

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/Message;

    .line 2482
    .local v2, "msg":Lcom/vkontakte/android/Message;
    iget-boolean v3, v2, Lcom/vkontakte/android/Message;->out:Z

    if-nez v3, :cond_0

    iget-boolean v3, v2, Lcom/vkontakte/android/Message;->readState:Z

    if-nez v3, :cond_0

    iget v3, v2, Lcom/vkontakte/android/Message;->id:I

    if-ge v1, v3, :cond_0

    .line 2483
    iget v1, v2, Lcom/vkontakte/android/Message;->id:I

    .line 2480
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 2486
    .end local v2    # "msg":Lcom/vkontakte/android/Message;
    :cond_1
    if-eqz v1, :cond_2

    .line 2487
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getPeerID()I

    move-result v3

    invoke-static {v3, v1}, Lcom/vkontakte/android/data/Messages;->markAsRead(II)V

    .line 2489
    :cond_2
    return-void
.end method

.method private prependMessages(Ljava/util/List;)V
    .locals 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/Message;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, "msgs":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/Message;>;"
    const/4 v13, 0x3

    const/4 v12, 0x2

    const/4 v11, 0x1

    const/4 v10, 0x0

    .line 2739
    iget-object v6, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->list:Lcom/vkontakte/android/ui/widget/ChatRecyclerView;

    .line 2740
    .local v6, "l":Lcom/vkontakte/android/ui/widget/VKRecyclerView;
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getActivity()Landroid/app/Activity;

    move-result-object v9

    if-eqz v9, :cond_0

    if-nez v6, :cond_1

    .line 2781
    :cond_0
    :goto_0
    return-void

    .line 2743
    :cond_1
    const/4 v5, -0x1

    .line 2744
    .local v5, "itemOffset":I
    iget-object v9, v6, Lcom/vkontakte/android/ui/widget/VKRecyclerView;->delegate:Lcom/vkontakte/android/ui/widget/VKRecyclerView$VKRecyclerViewDelegate;

    invoke-virtual {v9}, Lcom/vkontakte/android/ui/widget/VKRecyclerView$VKRecyclerViewDelegate;->getFirstVisiblePosition()I

    move-result v0

    .line 2745
    .local v0, "firstVisible":I
    if-nez v0, :cond_4

    .line 2746
    invoke-virtual {v6}, Lcom/vkontakte/android/ui/widget/VKRecyclerView;->getChildCount()I

    move-result v9

    if-le v9, v13, :cond_2

    .line 2747
    add-int/lit8 v0, v0, 0x2

    .line 2748
    invoke-virtual {v6, v13}, Lcom/vkontakte/android/ui/widget/VKRecyclerView;->getChildAt(I)Landroid/view/View;

    move-result-object v9

    invoke-virtual {v9}, Landroid/view/View;->getTop()I

    move-result v5

    .line 2761
    :cond_2
    :goto_1
    iget-object v9, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->messages:Ljava/util/ArrayList;

    invoke-virtual {v9, v10, p1}, Ljava/util/ArrayList;->addAll(ILjava/util/Collection;)Z

    .line 2762
    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    .line 2763
    .local v2, "fwdUidSet":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    invoke-static {p0, p1, v2}, Lcom/vkontakte/android/ui/holder/messages/MessageListItemHelper;->buildItems(Lcom/vkontakte/android/ui/holder/messages/MessageListItemHelper$MessageListItemHelperProvider;Ljava/util/List;Ljava/util/Set;)Ljava/util/ArrayList;

    move-result-object v7

    .line 2764
    .local v7, "litems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/ui/holder/messages/MessageListItem;>;"
    iget-object v9, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->items:Ljava/util/ArrayList;

    invoke-virtual {v9, v10, v7}, Ljava/util/ArrayList;->addAll(ILjava/util/Collection;)Z

    .line 2765
    iget-object v9, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->items:Ljava/util/ArrayList;

    invoke-static {v9}, Lcom/vkontakte/android/ui/holder/messages/MessageListItemHelper;->fixTimes(Ljava/util/List;)I

    move-result v8

    .line 2766
    .local v8, "ndates":I
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->updateList()V

    .line 2767
    sub-int/2addr v0, v8

    .line 2768
    const/4 v1, 0x0

    .line 2769
    .local v1, "foundSeparator":Z
    const/4 v3, 0x0

    .line 2770
    .local v3, "i":I
    invoke-virtual {v7}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :goto_2
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_6

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;

    .line 2771
    .local v4, "item":Lcom/vkontakte/android/ui/holder/messages/MessageListItem;
    iget v10, v4, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->type:I

    const/4 v11, 0x6

    if-ne v10, v11, :cond_3

    .line 2772
    const/4 v1, 0x1

    .line 2773
    iget-object v10, v6, Lcom/vkontakte/android/ui/widget/VKRecyclerView;->delegate:Lcom/vkontakte/android/ui/widget/VKRecyclerView$VKRecyclerViewDelegate;

    add-int/lit8 v11, v3, 0x1

    const/high16 v12, 0x42a00000    # 80.0f

    invoke-static {v12}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v12

    invoke-virtual {v10, v11, v12}, Lcom/vkontakte/android/ui/widget/VKRecyclerView$VKRecyclerViewDelegate;->setSelectionFromTop(II)V

    .line 2775
    :cond_3
    add-int/lit8 v3, v3, 0x1

    .line 2776
    goto :goto_2

    .line 2750
    .end local v1    # "foundSeparator":Z
    .end local v2    # "fwdUidSet":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    .end local v3    # "i":I
    .end local v4    # "item":Lcom/vkontakte/android/ui/holder/messages/MessageListItem;
    .end local v7    # "litems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/ui/holder/messages/MessageListItem;>;"
    .end local v8    # "ndates":I
    :cond_4
    if-ne v0, v11, :cond_5

    .line 2751
    invoke-virtual {v6}, Lcom/vkontakte/android/ui/widget/VKRecyclerView;->getChildCount()I

    move-result v9

    if-le v9, v12, :cond_2

    .line 2752
    add-int/lit8 v0, v0, 0x1

    .line 2753
    invoke-virtual {v6, v12}, Lcom/vkontakte/android/ui/widget/VKRecyclerView;->getChildAt(I)Landroid/view/View;

    move-result-object v9

    invoke-virtual {v9}, Landroid/view/View;->getTop()I

    move-result v5

    goto :goto_1

    .line 2756
    :cond_5
    invoke-virtual {v6}, Lcom/vkontakte/android/ui/widget/VKRecyclerView;->getChildCount()I

    move-result v9

    if-le v9, v11, :cond_2

    .line 2757
    invoke-virtual {v6, v10}, Lcom/vkontakte/android/ui/widget/VKRecyclerView;->getChildAt(I)Landroid/view/View;

    move-result-object v9

    invoke-virtual {v9}, Landroid/view/View;->getTop()I

    move-result v5

    goto :goto_1

    .line 2777
    .restart local v1    # "foundSeparator":Z
    .restart local v2    # "fwdUidSet":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    .restart local v3    # "i":I
    .restart local v7    # "litems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/ui/holder/messages/MessageListItem;>;"
    .restart local v8    # "ndates":I
    :cond_6
    if-nez v1, :cond_7

    .line 2778
    iget-object v9, v6, Lcom/vkontakte/android/ui/widget/VKRecyclerView;->delegate:Lcom/vkontakte/android/ui/widget/VKRecyclerView$VKRecyclerViewDelegate;

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v10

    add-int/2addr v10, v0

    add-int/lit8 v10, v10, 0x1

    invoke-virtual {v9, v10, v5}, Lcom/vkontakte/android/ui/widget/VKRecyclerView$VKRecyclerViewDelegate;->setSelectionFromTop(II)V

    .line 2780
    :cond_7
    invoke-direct {p0, v2}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->loadFwdUsers(Ljava/util/Collection;)V

    goto/16 :goto_0
.end method

.method private rebuildItems()V
    .locals 3

    .prologue
    .line 2272
    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->items:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    .line 2273
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 2274
    .local v0, "fwdUidSet":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->items:Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->messages:Ljava/util/ArrayList;

    invoke-static {p0, v2, v0}, Lcom/vkontakte/android/ui/holder/messages/MessageListItemHelper;->buildItems(Lcom/vkontakte/android/ui/holder/messages/MessageListItemHelper$MessageListItemHelperProvider;Ljava/util/List;Ljava/util/Set;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 2275
    invoke-direct {p0, v0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->loadFwdUsers(Ljava/util/Collection;)V

    .line 2276
    return-void
.end method

.method private relayoutThumbs()V
    .locals 7

    .prologue
    const/4 v3, 0x0

    .line 2279
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getContentWidth()I

    move-result v2

    const/high16 v4, 0x43af0000    # 350.0f

    invoke-static {v4}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v4

    invoke-static {v2, v4}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 2280
    .local v1, "sz":I
    iget-object v2, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->items:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;

    .line 2281
    .local v0, "item":Lcom/vkontakte/android/ui/holder/messages/MessageListItem;
    const/high16 v2, 0x42fc0000    # 126.0f

    invoke-static {v2}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v2

    sub-int v2, v1, v2

    iget v5, v0, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->fwdLevel:I

    const/high16 v6, 0x41000000    # 8.0f

    invoke-static {v6}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v6

    mul-int/2addr v5, v6

    sub-int v5, v2, v5

    iget v2, v0, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->fwdLevel:I

    if-nez v2, :cond_0

    move v2, v3

    .line 2282
    :goto_1
    sub-int v2, v5, v2

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->getOrCreateAttachments()Ljava/util/List;

    move-result-object v5

    .line 2281
    invoke-static {v2, v1, v5}, Lcom/vkontakte/android/ZhukovLayout;->processThumbs(IILjava/util/List;)V

    goto :goto_0

    :cond_0
    const/high16 v2, 0x40c00000    # 6.0f

    .line 2282
    invoke-static {v2}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v2

    goto :goto_1

    .line 2284
    .end local v0    # "item":Lcom/vkontakte/android/ui/holder/messages/MessageListItem;
    :cond_1
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->updateList()V

    .line 2285
    iput-boolean v3, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->relayoutThumbsRequested:Z

    .line 2286
    return-void
.end method

.method private removeSeparator()V
    .locals 4

    .prologue
    .line 2312
    iget-object v2, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->items:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 2313
    .local v1, "itr":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/vkontakte/android/ui/holder/messages/MessageListItem;>;"
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 2314
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;

    .line 2315
    .local v0, "item":Lcom/vkontakte/android/ui/holder/messages/MessageListItem;
    iget v2, v0, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->type:I

    const/4 v3, 0x6

    if-ne v2, v3, :cond_0

    .line 2316
    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    .line 2317
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->hasSeparator:Z

    .line 2318
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->updateList()V

    .line 2322
    .end local v0    # "item":Lcom/vkontakte/android/ui/holder/messages/MessageListItem;
    :cond_1
    return-void
.end method

.method private restoreDraft()V
    .locals 10

    .prologue
    const/4 v9, 0x0

    .line 1554
    sget-boolean v7, Lcom/vkontakte/android/fragments/messages/ChatFragment;->$assertionsDisabled:Z

    if-nez v7, :cond_0

    iget-object v7, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->writeBar:Lcom/vkontakte/android/ui/WriteBar;

    if-nez v7, :cond_0

    new-instance v7, Ljava/lang/AssertionError;

    invoke-direct {v7}, Ljava/lang/AssertionError;-><init>()V

    throw v7

    .line 1555
    :cond_0
    iget-object v7, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->writeBar:Lcom/vkontakte/android/ui/WriteBar;

    invoke-virtual {v7}, Lcom/vkontakte/android/ui/WriteBar;->getAttachments()Ljava/util/ArrayList;

    move-result-object v2

    .line 1556
    .local v2, "atts":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/attachments/Attachment;>;"
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v7

    if-gtz v7, :cond_1

    iget-object v7, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->writeBar:Lcom/vkontakte/android/ui/WriteBar;

    invoke-virtual {v7}, Lcom/vkontakte/android/ui/WriteBar;->getText()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v7

    if-lez v7, :cond_2

    .line 1588
    :cond_1
    :goto_0
    return-void

    .line 1559
    :cond_2
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getActivity()Landroid/app/Activity;

    move-result-object v7

    const-string/jumbo v8, "drafts"

    invoke-virtual {v7, v8, v9}, Landroid/app/Activity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v6

    .line 1560
    .local v6, "prefs":Landroid/content/SharedPreferences;
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "text"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget v8, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->peer:I

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v7}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 1563
    iget-object v7, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->writeBar:Lcom/vkontakte/android/ui/WriteBar;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "text"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget v9, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->peer:I

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    const-string/jumbo v9, ""

    invoke-interface {v6, v8, v9}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Lcom/vkontakte/android/ui/WriteBar;->setText(Ljava/lang/CharSequence;)V

    .line 1565
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "mentions"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget v8, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->peer:I

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v7}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 1566
    iget-object v7, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->writeBar:Lcom/vkontakte/android/ui/WriteBar;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "mentions"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget v9, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->peer:I

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    const-string/jumbo v9, ""

    invoke-interface {v6, v8, v9}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Lcom/vkontakte/android/ui/WriteBar;->setMentionsFromSerializedString(Ljava/lang/String;)V

    .line 1569
    :cond_3
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "attach"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget v8, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->peer:I

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v7}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_6

    .line 1571
    :try_start_0
    new-instance v5, Ljava/io/DataInputStream;

    new-instance v7, Ljava/io/ByteArrayInputStream;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "attach"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget v9, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->peer:I

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    const-string/jumbo v9, ""

    invoke-interface {v6, v8, v9}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x0

    invoke-static {v8, v9}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-direct {v5, v7}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    .line 1572
    .local v5, "is":Ljava/io/DataInputStream;
    invoke-virtual {v5}, Ljava/io/DataInputStream;->readInt()I

    move-result v3

    .line 1573
    .local v3, "count":I
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_1
    if-ge v4, v3, :cond_6

    .line 1574
    invoke-static {v5}, Lcom/vkontakte/android/attachments/Attachment;->deserialize(Ljava/io/DataInputStream;)Lcom/vkontakte/android/attachments/Attachment;

    move-result-object v1

    .line 1575
    .local v1, "att":Lcom/vkontakte/android/attachments/Attachment;
    instance-of v7, v1, Lcom/vkontakte/android/attachments/MarketAttachment;

    if-eqz v7, :cond_4

    move-object v0, v1

    check-cast v0, Lcom/vkontakte/android/attachments/MarketAttachment;

    move-object v7, v0

    iget-boolean v7, v7, Lcom/vkontakte/android/attachments/MarketAttachment;->canEdit:Z

    if-eqz v7, :cond_5

    .line 1576
    :cond_4
    iget-object v7, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->writeBar:Lcom/vkontakte/android/ui/WriteBar;

    invoke-virtual {v7, v1}, Lcom/vkontakte/android/ui/WriteBar;->addAttachment(Lcom/vkontakte/android/attachments/Attachment;)V

    .line 1573
    :goto_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 1578
    :cond_5
    iget-object v7, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->writeBar:Lcom/vkontakte/android/ui/WriteBar;

    const/4 v8, 0x0

    invoke-virtual {v7, v8}, Lcom/vkontakte/android/ui/WriteBar;->setText(Ljava/lang/CharSequence;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    .line 1581
    .end local v1    # "att":Lcom/vkontakte/android/attachments/Attachment;
    .end local v3    # "count":I
    .end local v4    # "i":I
    .end local v5    # "is":Ljava/io/DataInputStream;
    :catch_0
    move-exception v7

    .line 1585
    :cond_6
    invoke-interface {v6}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v7

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "text"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget v9, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->peer:I

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v7, v8}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v7

    invoke-interface {v7}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 1586
    invoke-interface {v6}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v7

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "attach"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget v9, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->peer:I

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v7, v8}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v7

    invoke-interface {v7}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 1587
    invoke-interface {v6}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v7

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "mentions"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget v9, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->peer:I

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v7, v8}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v7

    invoke-interface {v7}, Landroid/content/SharedPreferences$Editor;->apply()V

    goto/16 :goto_0
.end method

.method private retryFailed(Lcom/vkontakte/android/Message;)V
    .locals 8
    .param p1, "msg"    # Lcom/vkontakte/android/Message;

    .prologue
    .line 2716
    iget v5, p1, Lcom/vkontakte/android/Message;->id:I

    if-lez v5, :cond_0

    .line 2736
    :goto_0
    return-void

    .line 2719
    :cond_0
    iget-object v5, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->messages:Ljava/util/ArrayList;

    invoke-virtual {v5, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 2720
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 2721
    .local v4, "toRemove":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/ui/holder/messages/MessageListItem;>;"
    iget-object v5, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->items:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_1
    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;

    .line 2722
    .local v2, "item":Lcom/vkontakte/android/ui/holder/messages/MessageListItem;
    iget v6, v2, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->msgId:I

    iget v7, p1, Lcom/vkontakte/android/Message;->id:I

    if-ne v6, v7, :cond_1

    .line 2723
    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 2726
    .end local v2    # "item":Lcom/vkontakte/android/ui/holder/messages/MessageListItem;
    :cond_2
    iget-object v5, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->items:Ljava/util/ArrayList;

    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->removeAll(Ljava/util/Collection;)Z

    .line 2727
    invoke-static {p1}, Lcom/vkontakte/android/data/Messages;->send(Lcom/vkontakte/android/Message;)Lcom/vkontakte/android/Message;

    move-result-object v3

    .line 2728
    .local v3, "m":Lcom/vkontakte/android/Message;
    iget-object v5, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->messages:Ljava/util/ArrayList;

    invoke-virtual {v5, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2729
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 2730
    .local v0, "al":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/Message;>;"
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2731
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 2732
    .local v1, "fwdUidSet":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    iget-object v5, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->items:Ljava/util/ArrayList;

    invoke-static {p0, v0, v1}, Lcom/vkontakte/android/ui/holder/messages/MessageListItemHelper;->buildItems(Lcom/vkontakte/android/ui/holder/messages/MessageListItemHelper$MessageListItemHelperProvider;Ljava/util/List;Ljava/util/Set;)Ljava/util/ArrayList;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 2733
    iget-object v5, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->items:Ljava/util/ArrayList;

    invoke-static {v5}, Lcom/vkontakte/android/ui/holder/messages/MessageListItemHelper;->fixTimes(Ljava/util/List;)I

    .line 2734
    invoke-direct {p0, v1}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->loadFwdUsers(Ljava/util/Collection;)V

    .line 2735
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->updateList()V

    goto :goto_0
.end method

.method private saveDraft()V
    .locals 11

    .prologue
    const/4 v10, 0x0

    .line 1518
    sget-boolean v8, Lcom/vkontakte/android/fragments/messages/ChatFragment;->$assertionsDisabled:Z

    if-nez v8, :cond_0

    iget-object v8, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->writeBar:Lcom/vkontakte/android/ui/WriteBar;

    if-nez v8, :cond_0

    new-instance v8, Ljava/lang/AssertionError;

    invoke-direct {v8}, Ljava/lang/AssertionError;-><init>()V

    throw v8

    .line 1519
    :cond_0
    iget-object v8, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->writeBar:Lcom/vkontakte/android/ui/WriteBar;

    invoke-virtual {v8}, Lcom/vkontakte/android/ui/WriteBar;->getAttachments()Ljava/util/ArrayList;

    move-result-object v1

    .line 1520
    .local v1, "atts":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/attachments/Attachment;>;"
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getActivity()Landroid/app/Activity;

    move-result-object v8

    const-string/jumbo v9, "drafts"

    invoke-virtual {v8, v9, v10}, Landroid/app/Activity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v6

    .line 1521
    .local v6, "prefs":Landroid/content/SharedPreferences;
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v8

    if-nez v8, :cond_1

    iget-object v8, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->writeBar:Lcom/vkontakte/android/ui/WriteBar;

    invoke-virtual {v8}, Lcom/vkontakte/android/ui/WriteBar;->getText()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v8

    if-nez v8, :cond_1

    .line 1522
    invoke-interface {v6}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v8

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v10, "text"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget v10, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->peer:I

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-interface {v8, v9}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v8

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v10, "attach"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget v10, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->peer:I

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-interface {v8, v9}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v8

    invoke-interface {v8}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 1551
    :goto_0
    return-void

    .line 1525
    :cond_1
    const/4 v7, 0x0

    .line 1526
    .local v7, "satts":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v8

    if-lez v8, :cond_2

    .line 1528
    :try_start_0
    new-instance v2, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v2}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 1529
    .local v2, "buf":Ljava/io/ByteArrayOutputStream;
    new-instance v5, Ljava/io/DataOutputStream;

    invoke-direct {v5, v2}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 1530
    .local v5, "os":Ljava/io/DataOutputStream;
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v8

    invoke-virtual {v5, v8}, Ljava/io/DataOutputStream;->writeInt(I)V

    .line 1531
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_1
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_5

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/attachments/Attachment;

    .line 1532
    .local v0, "att":Lcom/vkontakte/android/attachments/Attachment;
    invoke-virtual {v0, v5}, Lcom/vkontakte/android/attachments/Attachment;->serialize(Ljava/io/DataOutputStream;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 1535
    .end local v0    # "att":Lcom/vkontakte/android/attachments/Attachment;
    .end local v2    # "buf":Ljava/io/ByteArrayOutputStream;
    .end local v5    # "os":Ljava/io/DataOutputStream;
    :catch_0
    move-exception v8

    .line 1539
    :cond_2
    :goto_2
    invoke-interface {v6}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v8

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v10, "text"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget v10, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->peer:I

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    iget-object v10, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->writeBar:Lcom/vkontakte/android/ui/WriteBar;

    .line 1540
    invoke-virtual {v10}, Lcom/vkontakte/android/ui/WriteBar;->getText()Ljava/lang/String;

    move-result-object v10

    invoke-interface {v8, v9, v10}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    .line 1542
    .local v3, "ed":Landroid/content/SharedPreferences$Editor;
    iget-object v8, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->writeBar:Lcom/vkontakte/android/ui/WriteBar;

    invoke-virtual {v8}, Lcom/vkontakte/android/ui/WriteBar;->getMentionsForSerialization()Ljava/lang/String;

    move-result-object v4

    .line 1543
    .local v4, "mentions":Ljava/lang/String;
    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_3

    .line 1544
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "mentions"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget v9, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->peer:I

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v3, v8, v4}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 1547
    :cond_3
    if-eqz v7, :cond_4

    .line 1548
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "attach"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget v9, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->peer:I

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v3, v8, v7}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 1550
    :cond_4
    invoke-interface {v3}, Landroid/content/SharedPreferences$Editor;->apply()V

    goto/16 :goto_0

    .line 1534
    .end local v3    # "ed":Landroid/content/SharedPreferences$Editor;
    .end local v4    # "mentions":Ljava/lang/String;
    .restart local v2    # "buf":Ljava/io/ByteArrayOutputStream;
    .restart local v5    # "os":Ljava/io/DataOutputStream;
    :cond_5
    :try_start_1
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v8

    const/4 v9, 0x0

    invoke-static {v8, v9}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v7

    goto :goto_2
.end method

.method private scrollToNewMessage()V
    .locals 4

    .prologue
    .line 1747
    iget-object v2, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->list:Lcom/vkontakte/android/ui/widget/ChatRecyclerView;

    if-nez v2, :cond_1

    const/4 v1, 0x0

    .line 1748
    .local v1, "lm":Landroid/support/v7/widget/RecyclerView$LayoutManager;
    :goto_0
    instance-of v2, v1, Landroid/support/v7/widget/LinearLayoutManager;

    if-eqz v2, :cond_0

    .line 1749
    check-cast v1, Landroid/support/v7/widget/LinearLayoutManager;

    .end local v1    # "lm":Landroid/support/v7/widget/RecyclerView$LayoutManager;
    invoke-virtual {v1}, Landroid/support/v7/widget/LinearLayoutManager;->findLastCompletelyVisibleItemPosition()I

    move-result v0

    .line 1750
    .local v0, "lastPosition":I
    iget-object v2, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->items:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    if-lt v0, v2, :cond_2

    .line 1751
    iget-object v2, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->list:Lcom/vkontakte/android/ui/widget/ChatRecyclerView;

    iget-object v3, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->items:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/ui/widget/ChatRecyclerView;->scrollToPosition(I)V

    .line 1756
    .end local v0    # "lastPosition":I
    :cond_0
    :goto_1
    return-void

    .line 1747
    :cond_1
    iget-object v2, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->list:Lcom/vkontakte/android/ui/widget/ChatRecyclerView;

    invoke-virtual {v2}, Lcom/vkontakte/android/ui/widget/ChatRecyclerView;->getLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v1

    goto :goto_0

    .line 1753
    .restart local v0    # "lastPosition":I
    :cond_2
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->smoothScrollToBottom()V

    goto :goto_1
.end method

.method private sendAttachment(Lcom/vkontakte/android/attachments/Attachment;)V
    .locals 12
    .param p1, "s"    # Lcom/vkontakte/android/attachments/Attachment;

    .prologue
    const/16 v11, 0x8

    const/4 v10, 0x1

    const/4 v4, 0x0

    .line 2407
    sget-boolean v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->$assertionsDisabled:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->errorView:Lcom/vkontakte/android/ui/ErrorViewHelper;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->list:Lcom/vkontakte/android/ui/widget/ChatRecyclerView;

    if-nez v0, :cond_1

    :cond_0
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 2408
    :cond_1
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->dataLoading:Z

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->messages:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-nez v0, :cond_3

    .line 2455
    :cond_2
    :goto_0
    return-void

    .line 2411
    :cond_3
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->errorView:Lcom/vkontakte/android/ui/ErrorViewHelper;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/ErrorViewHelper;->getView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-eqz v0, :cond_2

    .line 2414
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 2415
    .local v2, "atts":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/attachments/Attachment;>;"
    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2417
    const/4 v5, 0x0

    .local v5, "ref":Ljava/lang/String;
    const/4 v6, 0x0

    .line 2418
    .local v6, "refSource":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v7

    .line 2419
    .local v7, "args":Landroid/os/Bundle;
    if-eqz v7, :cond_4

    .line 2420
    const-string/jumbo v0, "ref"

    invoke-virtual {v7, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 2421
    const-string/jumbo v0, "ref_source"

    invoke-virtual {v7, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 2422
    const-string/jumbo v0, "ref"

    invoke-virtual {v7, v0}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    .line 2423
    const-string/jumbo v0, "ref_source"

    invoke-virtual {v7, v0}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    .line 2426
    :cond_4
    iget v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->peer:I

    const-string/jumbo v1, ""

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    invoke-static/range {v0 .. v6}, Lcom/vkontakte/android/data/Messages;->send(ILjava/lang/String;Ljava/util/List;Ljava/util/List;ILjava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/Message;

    move-result-object v9

    .line 2427
    .local v9, "m":Lcom/vkontakte/android/Message;
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->messages:Ljava/util/ArrayList;

    invoke-virtual {v0, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2428
    iget v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->offsetFromBottom:I

    if-eqz v0, :cond_5

    .line 2429
    iput v4, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->offsetFromBottom:I

    .line 2430
    iput-boolean v4, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->moreAvailableDown:Z

    .line 2431
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->messages:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 2432
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->items:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 2433
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->preloadedMessages:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 2434
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->preloadedMessagesDown:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 2435
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->loadMoreView:Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;

    invoke-virtual {v0, v4}, Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;->setVisibilityProgressBar(I)V

    .line 2436
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->loadMoreView:Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;->setVisibilityLoadMoreButton(I)V

    .line 2437
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->loadMoreViewBtm:Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;

    invoke-virtual {v0, v11}, Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;->setVisibilityProgressBar(I)V

    .line 2438
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->loadMoreViewBtm:Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;

    invoke-virtual {v0, v11}, Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;->setVisibilityLoadMoreButton(I)V

    .line 2439
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->hideJumpButton()V

    .line 2440
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->messages:Ljava/util/ArrayList;

    invoke-virtual {v0, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2441
    invoke-direct {p0, v10}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->loadDataUp(Z)V

    .line 2442
    iput-boolean v10, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->jumpedToEnd:Z

    .line 2444
    :cond_5
    new-instance v8, Ljava/util/HashSet;

    invoke-direct {v8}, Ljava/util/HashSet;-><init>()V

    .line 2445
    .local v8, "fwdUidSet":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->items:Ljava/util/ArrayList;

    invoke-static {v9}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-static {p0, v1, v8}, Lcom/vkontakte/android/ui/holder/messages/MessageListItemHelper;->buildItems(Lcom/vkontakte/android/ui/holder/messages/MessageListItemHelper$MessageListItemHelperProvider;Ljava/util/List;Ljava/util/Set;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 2446
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->items:Ljava/util/ArrayList;

    invoke-static {v0}, Lcom/vkontakte/android/ui/holder/messages/MessageListItemHelper;->fixTimes(Ljava/util/List;)I

    .line 2448
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->scrollToNewMessage()V

    .line 2450
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->updateList()V

    .line 2451
    invoke-direct {p0, v8}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->loadFwdUsers(Ljava/util/Collection;)V

    .line 2452
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->hasSeparator:Z

    if-eqz v0, :cond_2

    .line 2453
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->removeSeparator()V

    goto/16 :goto_0
.end method

.method private sendMessage()V
    .locals 15

    .prologue
    .line 2325
    sget-boolean v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->$assertionsDisabled:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->errorView:Lcom/vkontakte/android/ui/ErrorViewHelper;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->writeBar:Lcom/vkontakte/android/ui/WriteBar;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->list:Lcom/vkontakte/android/ui/widget/ChatRecyclerView;

    if-nez v0, :cond_1

    :cond_0
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 2326
    :cond_1
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->dataLoading:Z

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->messages:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-nez v0, :cond_3

    .line 2404
    :cond_2
    :goto_0
    return-void

    .line 2329
    :cond_3
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->errorView:Lcom/vkontakte/android/ui/ErrorViewHelper;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/ErrorViewHelper;->getView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-eqz v0, :cond_2

    .line 2333
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->writeBar:Lcom/vkontakte/android/ui/WriteBar;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/WriteBar;->getAttachments()Ljava/util/ArrayList;

    move-result-object v2

    .line 2334
    .local v2, "atts":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/attachments/Attachment;>;"
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 2335
    .local v3, "fwd":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/Message;>;"
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_4
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_5

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/vkontakte/android/attachments/Attachment;

    .line 2336
    .local v7, "a":Lcom/vkontakte/android/attachments/Attachment;
    instance-of v4, v7, Lcom/vkontakte/android/attachments/FwdMessagesAttachment;

    if-eqz v4, :cond_b

    .line 2337
    invoke-virtual {v2, v7}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 2338
    check-cast v7, Lcom/vkontakte/android/attachments/FwdMessagesAttachment;

    .end local v7    # "a":Lcom/vkontakte/android/attachments/Attachment;
    iget-object v0, v7, Lcom/vkontakte/android/attachments/FwdMessagesAttachment;->msgs:Ljava/util/ArrayList;

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 2351
    :cond_5
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->writeBar:Lcom/vkontakte/android/ui/WriteBar;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/WriteBar;->getAsFormattedString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 2352
    .local v1, "msg":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_6

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-nez v0, :cond_6

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-eqz v0, :cond_2

    .line 2356
    :cond_6
    const/4 v5, 0x0

    .local v5, "ref":Ljava/lang/String;
    const/4 v6, 0x0

    .line 2357
    .local v6, "refSource":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v8

    .line 2358
    .local v8, "args":Landroid/os/Bundle;
    if-eqz v8, :cond_7

    .line 2359
    const-string/jumbo v0, "ref"

    invoke-virtual {v8, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 2360
    const-string/jumbo v0, "ref_source"

    invoke-virtual {v8, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 2361
    const-string/jumbo v0, "ref"

    invoke-virtual {v8, v0}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    .line 2362
    const-string/jumbo v0, "ref_source"

    invoke-virtual {v8, v0}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    .line 2365
    :cond_7
    iget v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->peer:I

    const/4 v4, 0x0

    invoke-static/range {v0 .. v6}, Lcom/vkontakte/android/data/Messages;->send(ILjava/lang/String;Ljava/util/List;Ljava/util/List;ILjava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/Message;

    move-result-object v10

    .line 2367
    .local v10, "m":Lcom/vkontakte/android/Message;
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->messages:Ljava/util/ArrayList;

    invoke-virtual {v0, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2368
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->writeBar:Lcom/vkontakte/android/ui/WriteBar;

    const-string/jumbo v4, ""

    invoke-virtual {v0, v4}, Lcom/vkontakte/android/ui/WriteBar;->setText(Ljava/lang/CharSequence;)V

    .line 2369
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->writeBar:Lcom/vkontakte/android/ui/WriteBar;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/WriteBar;->clearAttachments()V

    .line 2370
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->messagesToForward:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 2371
    const-string/jumbo v0, "vk"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v12, "send msg, offset="

    invoke-virtual {v4, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v12, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->offsetFromBottom:I

    invoke-virtual {v4, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v0, v4}, Lcom/vkontakte/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 2372
    iget v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->offsetFromBottom:I

    if-eqz v0, :cond_8

    .line 2373
    const/4 v0, 0x0

    iput v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->offsetFromBottom:I

    .line 2374
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->moreAvailableDown:Z

    .line 2375
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->messages:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 2376
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->items:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 2377
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->preloadedMessages:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 2378
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->preloadedMessagesDown:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 2379
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->loadMoreView:Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;

    const/4 v4, 0x0

    invoke-virtual {v0, v4}, Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;->setVisibilityProgressBar(I)V

    .line 2380
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->loadMoreView:Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;

    const/4 v4, 0x4

    invoke-virtual {v0, v4}, Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;->setVisibilityLoadMoreButton(I)V

    .line 2381
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->loadMoreViewBtm:Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;

    const/16 v4, 0x8

    invoke-virtual {v0, v4}, Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;->setVisibilityProgressBar(I)V

    .line 2382
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->loadMoreViewBtm:Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;

    const/16 v4, 0x8

    invoke-virtual {v0, v4}, Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;->setVisibilityLoadMoreButton(I)V

    .line 2383
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->hideJumpButton()V

    .line 2384
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->messages:Ljava/util/ArrayList;

    invoke-virtual {v0, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2385
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->loadDataUp(Z)V

    .line 2386
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->jumpedToEnd:Z

    .line 2388
    :cond_8
    new-instance v9, Ljava/util/HashSet;

    invoke-direct {v9}, Ljava/util/HashSet;-><init>()V

    .line 2389
    .local v9, "fwdUidSet":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->items:Ljava/util/ArrayList;

    invoke-static {v10}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    invoke-static {p0, v4, v9}, Lcom/vkontakte/android/ui/holder/messages/MessageListItemHelper;->buildItems(Lcom/vkontakte/android/ui/holder/messages/MessageListItemHelper$MessageListItemHelperProvider;Ljava/util/List;Ljava/util/Set;)Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 2390
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->items:Ljava/util/ArrayList;

    invoke-static {v0}, Lcom/vkontakte/android/ui/holder/messages/MessageListItemHelper;->fixTimes(Ljava/util/List;)I

    .line 2392
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->scrollToNewMessage()V

    .line 2394
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->hasSeparator:Z

    if-eqz v0, :cond_9

    .line 2395
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->removeSeparator()V

    .line 2398
    :cond_9
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->group:Lcom/vkontakte/android/api/Group;

    if-eqz v0, :cond_a

    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->group:Lcom/vkontakte/android/api/Group;

    iget-boolean v0, v0, Lcom/vkontakte/android/api/Group;->messagesBlocked:Z

    if-eqz v0, :cond_a

    .line 2399
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->loadGroupInfo(Z)V

    .line 2402
    :cond_a
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->updateList()V

    .line 2403
    invoke-direct {p0, v9}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->loadFwdUsers(Ljava/util/Collection;)V

    goto/16 :goto_0

    .line 2341
    .end local v1    # "msg":Ljava/lang/String;
    .end local v5    # "ref":Ljava/lang/String;
    .end local v6    # "refSource":Ljava/lang/String;
    .end local v8    # "args":Landroid/os/Bundle;
    .end local v9    # "fwdUidSet":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    .end local v10    # "m":Lcom/vkontakte/android/Message;
    .restart local v7    # "a":Lcom/vkontakte/android/attachments/Attachment;
    :cond_b
    instance-of v4, v7, Lcom/vkontakte/android/attachments/MarketAttachment;

    if-eqz v4, :cond_4

    move-object v11, v7

    .line 2342
    check-cast v11, Lcom/vkontakte/android/attachments/MarketAttachment;

    .line 2343
    .local v11, "marketAttachment":Lcom/vkontakte/android/attachments/MarketAttachment;
    iget-boolean v4, v11, Lcom/vkontakte/android/attachments/MarketAttachment;->canEdit:Z

    if-nez v4, :cond_4

    .line 2344
    const-string/jumbo v4, "market_contact"

    invoke-static {v4}, Lcom/vkontakte/android/data/Analytics;->track(Ljava/lang/String;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v4

    const-string/jumbo v12, "item_id"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v14, v11, Lcom/vkontakte/android/attachments/MarketAttachment;->good:Lcom/vkontakte/android/data/Good;

    iget v14, v14, Lcom/vkontakte/android/data/Good;->owner_id:I

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string/jumbo v14, "_"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    iget-object v14, v11, Lcom/vkontakte/android/attachments/MarketAttachment;->good:Lcom/vkontakte/android/data/Good;

    iget v14, v14, Lcom/vkontakte/android/data/Good;->id:I

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    .line 2345
    invoke-virtual {v4, v12, v13}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->addParam(Ljava/lang/String;Ljava/lang/Object;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v4

    const-string/jumbo v12, "action"

    const-string/jumbo v13, "write"

    .line 2346
    invoke-virtual {v4, v12, v13}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->addParam(Ljava/lang/String;Ljava/lang/Object;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v4

    invoke-virtual {v4}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->commit()Lcom/vkontakte/android/data/Analytics$EventBuilder;

    goto/16 :goto_1
.end method

.method private sendTypingIfNeeded()V
    .locals 4

    .prologue
    .line 2492
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->lastTypingRequest:J

    sub-long/2addr v0, v2

    const-wide/16 v2, 0x1388

    cmp-long v0, v0, v2

    if-ltz v0, :cond_0

    .line 2493
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->lastTypingRequest:J

    .line 2494
    new-instance v0, Lcom/vkontakte/android/api/messages/MessagesSetActivity;

    iget v1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->peer:I

    invoke-direct {v0, v1}, Lcom/vkontakte/android/api/messages/MessagesSetActivity;-><init>(I)V

    invoke-virtual {v0}, Lcom/vkontakte/android/api/messages/MessagesSetActivity;->exec()Lcom/vkontakte/android/api/VKAPIRequest;

    .line 2496
    :cond_0
    return-void
.end method

.method private setDialogIcon(Ljava/lang/CharSequence;)V
    .locals 7
    .param p1, "photoChars"    # Ljava/lang/CharSequence;

    .prologue
    .line 935
    if-nez p1, :cond_2

    const/4 v2, 0x0

    .line 937
    .local v2, "photo":Ljava/lang/String;
    :goto_0
    iget-object v4, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->writeBar:Lcom/vkontakte/android/ui/WriteBar;

    if-eqz v4, :cond_0

    .line 938
    iget-object v4, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->writeBar:Lcom/vkontakte/android/ui/WriteBar;

    invoke-virtual {v4, v2}, Lcom/vkontakte/android/ui/WriteBar;->setGraffitiPhoto(Ljava/lang/String;)V

    .line 941
    :cond_0
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getToolbar()Landroid/support/v7/widget/Toolbar;

    move-result-object v3

    .line 942
    .local v3, "toolbar":Landroid/support/v7/widget/Toolbar;
    if-nez v3, :cond_3

    .line 960
    :cond_1
    :goto_1
    return-void

    .line 935
    .end local v2    # "photo":Ljava/lang/String;
    .end local v3    # "toolbar":Landroid/support/v7/widget/Toolbar;
    :cond_2
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    .line 946
    .restart local v2    # "photo":Ljava/lang/String;
    .restart local v3    # "toolbar":Landroid/support/v7/widget/Toolbar;
    :cond_3
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 947
    .local v0, "activity":Landroid/app/Activity;
    if-eqz v0, :cond_4

    .line 948
    invoke-virtual {v0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f020399

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 949
    .local v1, "drawable":Landroid/graphics/drawable/Drawable;
    instance-of v4, v1, Landroid/graphics/drawable/BitmapDrawable;

    if-eqz v4, :cond_4

    .line 950
    new-instance v4, Lcom/vkontakte/android/fragments/messages/ChatFragment$RoundDrawable;

    check-cast v1, Landroid/graphics/drawable/BitmapDrawable;

    .end local v1    # "drawable":Landroid/graphics/drawable/Drawable;
    invoke-virtual {v1}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v5

    invoke-direct {v4, v5}, Lcom/vkontakte/android/fragments/messages/ChatFragment$RoundDrawable;-><init>(Landroid/graphics/Bitmap;)V

    invoke-virtual {v3, v4}, Landroid/support/v7/widget/Toolbar;->setLogo(Landroid/graphics/drawable/Drawable;)V

    .line 953
    :cond_4
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 954
    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    invoke-static {v4}, Lcom/vk/imageloader/VKImageLoader;->getBitmap(Landroid/net/Uri;)Lio/reactivex/Observable;

    move-result-object v4

    .line 955
    invoke-static {}, Lio/reactivex/schedulers/Schedulers;->io()Lio/reactivex/Scheduler;

    move-result-object v5

    invoke-virtual {v4, v5}, Lio/reactivex/Observable;->subscribeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object v4

    .line 956
    invoke-static {}, Lio/reactivex/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/Scheduler;

    move-result-object v5

    invoke-virtual {v4, v5}, Lio/reactivex/Observable;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object v4

    invoke-static {v3}, Lcom/vkontakte/android/fragments/messages/ChatFragment$$Lambda$6;->lambdaFactory$(Landroid/support/v7/widget/Toolbar;)Lio/reactivex/functions/Consumer;

    move-result-object v5

    invoke-static {}, Lcom/vkontakte/android/fragments/messages/ChatFragment$$Lambda$7;->lambdaFactory$()Lio/reactivex/functions/Consumer;

    move-result-object v6

    .line 957
    invoke-virtual {v4, v5, v6}, Lio/reactivex/Observable;->subscribe(Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;

    goto :goto_1
.end method

.method private setEnableWriteBarIfDoesNotHaveSpecialMarketAttachment(Z)V
    .locals 6
    .param p1, "b"    # Z

    .prologue
    .line 1393
    iget-object v4, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->writeBar:Lcom/vkontakte/android/ui/WriteBar;

    if-eqz v4, :cond_0

    .line 1394
    if-eqz p1, :cond_1

    .line 1395
    iget-object v4, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->writeBar:Lcom/vkontakte/android/ui/WriteBar;

    const/4 v5, 0x1

    invoke-static {v4, v5}, Lcom/vkontakte/android/ViewUtils;->setEnabled(Landroid/view/View;Z)V

    .line 1410
    :cond_0
    :goto_0
    return-void

    .line 1397
    :cond_1
    iget-object v4, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->writeBar:Lcom/vkontakte/android/ui/WriteBar;

    invoke-virtual {v4}, Lcom/vkontakte/android/ui/WriteBar;->getAttachments()Ljava/util/ArrayList;

    move-result-object v1

    .line 1398
    .local v1, "attachments":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/attachments/Attachment;>;"
    const/4 v2, 0x0

    .line 1399
    .local v2, "hasSpecAttachment":Z
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1
    if-eqz v1, :cond_2

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ge v3, v4, :cond_2

    .line 1400
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/attachments/Attachment;

    .line 1401
    .local v0, "attachment":Lcom/vkontakte/android/attachments/Attachment;
    instance-of v4, v0, Lcom/vkontakte/android/attachments/MarketAttachment;

    if-eqz v4, :cond_3

    check-cast v0, Lcom/vkontakte/android/attachments/MarketAttachment;

    .end local v0    # "attachment":Lcom/vkontakte/android/attachments/Attachment;
    iget-boolean v4, v0, Lcom/vkontakte/android/attachments/MarketAttachment;->canEdit:Z

    if-nez v4, :cond_3

    .line 1403
    const/4 v2, 0x1

    .line 1407
    :cond_2
    iget-object v4, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->writeBar:Lcom/vkontakte/android/ui/WriteBar;

    invoke-static {v4, v2}, Lcom/vkontakte/android/ViewUtils;->setEnabled(Landroid/view/View;Z)V

    goto :goto_0

    .line 1399
    :cond_3
    add-int/lit8 v3, v3, 0x1

    goto :goto_1
.end method

.method private showJumpButton()V
    .locals 8

    .prologue
    const/4 v7, 0x1

    const/4 v5, 0x2

    const/4 v6, 0x0

    .line 1777
    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->jumpToEndBtn:Landroid/view/View;

    .line 1778
    .local v1, "v":Landroid/view/View;
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Landroid/view/View;->getVisibility()I

    move-result v2

    if-eqz v2, :cond_0

    .line 1779
    invoke-virtual {v1, v6}, Landroid/view/View;->setVisibility(I)V

    .line 1780
    new-instance v0, Landroid/animation/AnimatorSet;

    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 1781
    .local v0, "set":Landroid/animation/AnimatorSet;
    new-array v2, v5, [Landroid/animation/Animator;

    const-string/jumbo v3, "alpha"

    new-array v4, v5, [F

    fill-array-data v4, :array_0

    invoke-static {v1, v3, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v3

    aput-object v3, v2, v6

    const-string/jumbo v3, "translationY"

    new-array v4, v5, [F

    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    move-result v5

    div-int/lit8 v5, v5, 0x2

    int-to-float v5, v5

    aput v5, v4, v6

    const/4 v5, 0x0

    aput v5, v4, v7

    invoke-static {v1, v3, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v3

    aput-object v3, v2, v7

    invoke-virtual {v0, v2}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 1782
    const-wide/16 v2, 0x12c

    invoke-virtual {v0, v2, v3}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 1783
    new-instance v2, Lcom/vkontakte/android/fragments/messages/ChatFragment$12;

    invoke-direct {v2, p0, v1}, Lcom/vkontakte/android/fragments/messages/ChatFragment$12;-><init>(Lcom/vkontakte/android/fragments/messages/ChatFragment;Landroid/view/View;)V

    invoke-virtual {v0, v2}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 1791
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    .line 1793
    .end local v0    # "set":Landroid/animation/AnimatorSet;
    :cond_0
    return-void

    .line 1781
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method private showMessageOptions(Lcom/vkontakte/android/Message;)V
    .locals 5
    .param p1, "msg"    # Lcom/vkontakte/android/Message;

    .prologue
    .line 2589
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 2590
    .local v1, "items":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 2592
    .local v0, "actions":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    iget-boolean v2, p1, Lcom/vkontakte/android/Message;->sendFailed:Z

    if-nez v2, :cond_0

    .line 2593
    const v2, 0x7f0805bc

    invoke-virtual {p0, v2}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2594
    const-string/jumbo v2, "reply"

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2595
    const v2, 0x7f080395

    invoke-virtual {p0, v2}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2596
    const-string/jumbo v2, "forward"

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2601
    :goto_0
    const v2, 0x7f080185

    invoke-virtual {p0, v2}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2602
    const-string/jumbo v2, "copy"

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2603
    const v2, 0x7f08019c

    invoke-virtual {p0, v2}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2604
    const-string/jumbo v2, "delete"

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2606
    new-instance v2, Lcom/vkontakte/android/VKAlertDialog$Builder;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/vkontakte/android/VKAlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v3, 0x7f08035b

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Ljava/lang/CharSequence;

    invoke-static {p0, v0, p1}, Lcom/vkontakte/android/fragments/messages/ChatFragment$$Lambda$20;->lambdaFactory$(Lcom/vkontakte/android/fragments/messages/ChatFragment;Ljava/util/ArrayList;Lcom/vkontakte/android/Message;)Landroid/content/DialogInterface$OnClickListener;

    move-result-object v4

    invoke-virtual {v3, v2, v4}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    .line 2644
    invoke-virtual {v2}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 2645
    return-void

    .line 2598
    :cond_0
    const v2, 0x7f0805d6

    invoke-virtual {p0, v2}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2599
    const-string/jumbo v2, "retry"

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method private smoothScrollToBottom()V
    .locals 2

    .prologue
    .line 1741
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->list:Lcom/vkontakte/android/ui/widget/ChatRecyclerView;

    if-eqz v0, :cond_0

    .line 1742
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->list:Lcom/vkontakte/android/ui/widget/ChatRecyclerView;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->items:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/widget/ChatRecyclerView;->smoothScrollToPosition(I)V

    .line 1744
    :cond_0
    return-void
.end method

.method private stopPlayAudioMessage(Ljava/util/List;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/Message;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 2673
    .local p1, "msgs":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/Message;>;"
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    .line 2674
    .local v1, "context":Landroid/content/Context;
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/Message;

    .line 2675
    .local v2, "msg":Lcom/vkontakte/android/Message;
    iget-object v4, v2, Lcom/vkontakte/android/Message;->attachments:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_1
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/attachments/Attachment;

    .line 2676
    .local v0, "att":Lcom/vkontakte/android/attachments/Attachment;
    instance-of v5, v0, Lcom/vkontakte/android/attachments/AudioMessageAttachment;

    if-eqz v5, :cond_1

    .line 2677
    check-cast v0, Lcom/vkontakte/android/attachments/AudioMessageAttachment;

    .end local v0    # "att":Lcom/vkontakte/android/attachments/Attachment;
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->stop(Landroid/content/Context;)V

    goto :goto_0

    .line 2681
    .end local v2    # "msg":Lcom/vkontakte/android/Message;
    :cond_2
    return-void
.end method

.method private updateChatUsers(Z)V
    .locals 2
    .param p1, "forceReload"    # Z

    .prologue
    const v1, 0x77359400

    .line 1635
    if-eqz p1, :cond_0

    .line 1636
    iget v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->peer:I

    sub-int/2addr v0, v1

    invoke-static {v0}, Lcom/vkontakte/android/cache/Cache;->setNeedUpdateChat(I)V

    .line 1638
    :cond_0
    iget v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->peer:I

    sub-int/2addr v0, v1

    invoke-static {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment$$Lambda$15;->lambdaFactory$(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Lcom/vkontakte/android/data/Messages$GetChatUsersCallback;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vkontakte/android/data/Messages;->getChatUsers(ILcom/vkontakte/android/data/Messages$GetChatUsersCallback;)V

    .line 1689
    return-void
.end method

.method private updateChatUsersPhotos()V
    .locals 5

    .prologue
    .line 2254
    iget-object v2, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->items:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;

    .line 2255
    .local v0, "item":Lcom/vkontakte/android/ui/holder/messages/MessageListItem;
    iget v2, v0, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->type:I

    const/4 v4, 0x5

    if-ne v2, v4, :cond_1

    iget v2, v0, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->msgId:I

    if-lez v2, :cond_1

    .line 2256
    iget v2, v0, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->msgId:I

    invoke-direct {p0, v2}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getMessage(I)Lcom/vkontakte/android/Message;

    move-result-object v1

    .line 2257
    .local v1, "m":Lcom/vkontakte/android/Message;
    invoke-static {p0, v1, v0}, Lcom/vkontakte/android/ui/holder/messages/MessageListItemHelper;->processServiceAction(Lcom/vkontakte/android/ui/holder/messages/MessageListItemHelper$MessageListItemHelperProvider;Lcom/vkontakte/android/Message;Lcom/vkontakte/android/ui/holder/messages/MessageListItem;)[I

    .line 2259
    .end local v1    # "m":Lcom/vkontakte/android/Message;
    :cond_1
    iget-boolean v2, v0, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->isOut:Z

    if-nez v2, :cond_0

    .line 2262
    iget v2, v0, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->type:I

    const/4 v4, 0x2

    if-eq v2, v4, :cond_2

    iget v2, v0, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->type:I

    const/4 v4, 0x1

    if-ne v2, v4, :cond_0

    .line 2263
    :cond_2
    iget-object v2, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->chatUsers:Landroid/util/SparseArray;

    iget v4, v0, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->sender:I

    invoke-static {v2, v4}, Lcom/vkontakte/android/utils/Utils;->containsKey(Landroid/util/SparseArray;I)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 2264
    iget-object v2, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->chatUsers:Landroid/util/SparseArray;

    iget v4, v0, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->sender:I

    invoke-virtual {v2, v4}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/UserProfile;

    iget-object v2, v2, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    invoke-virtual {v0, v2}, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->setImageUrl(Ljava/lang/String;)V

    goto :goto_0

    .line 2268
    .end local v0    # "item":Lcom/vkontakte/android/ui/holder/messages/MessageListItem;
    :cond_3
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->updateList()V

    .line 2269
    return-void
.end method

.method private updateList()V
    .locals 3

    .prologue
    .line 2305
    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->adapter:Lcom/vkontakte/android/ui/adapters/MessagesAdapter;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->items:Ljava/util/ArrayList;

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/ui/adapters/MessagesAdapter;->prepareItems(Ljava/util/ArrayList;)Ljava/util/ArrayList;

    move-result-object v0

    .line 2306
    .local v0, "listItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/ui/holder/messages/MessageListItem;>;"
    invoke-static {p0, v0}, Lcom/vkontakte/android/fragments/messages/ChatFragment$$Lambda$18;->lambdaFactory$(Lcom/vkontakte/android/fragments/messages/ChatFragment;Ljava/util/ArrayList;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-static {v1}, Lcom/vkontakte/android/ViewUtils;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 2309
    return-void
.end method

.method private updateMentionsVisibility()V
    .locals 6

    .prologue
    const/16 v4, 0x8

    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 2894
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getAreMentionsEnabled()Z

    move-result v3

    if-nez v3, :cond_1

    .line 2914
    :cond_0
    :goto_0
    return-void

    .line 2898
    :cond_1
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-static {v3}, Lcom/vkontakte/android/ViewUtils;->getScreenOrientation(Landroid/app/Activity;)I

    move-result v0

    .line 2901
    .local v0, "orientation":I
    iget-boolean v3, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->shouldShowMentions:Z

    if-eqz v3, :cond_3

    iget-object v3, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->mentionsAdapter:Lcom/vkontakte/android/ui/MentionsAdapter;

    .line 2902
    invoke-virtual {v3}, Lcom/vkontakte/android/ui/MentionsAdapter;->getItemCount()I

    move-result v3

    if-lez v3, :cond_3

    if-eq v0, v1, :cond_2

    const/16 v3, 0x9

    if-eq v0, v3, :cond_2

    iget-boolean v3, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->isTablet:Z

    if-eqz v3, :cond_3

    .line 2906
    .local v1, "show":Z
    :cond_2
    :goto_1
    iget-object v5, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->coordinatorMentionWrap:Landroid/support/design/widget/CoordinatorLayout;

    if-eqz v1, :cond_4

    move v3, v2

    :goto_2
    invoke-virtual {v5, v3}, Landroid/support/design/widget/CoordinatorLayout;->setVisibility(I)V

    .line 2907
    iget-object v3, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->mentionsBottomDivider:Landroid/view/View;

    if-eqz v1, :cond_5

    :goto_3
    invoke-virtual {v3, v2}, Landroid/view/View;->setVisibility(I)V

    .line 2909
    if-nez v1, :cond_0

    .line 2912
    iget-object v2, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->coordinatorMentionWrap:Landroid/support/design/widget/CoordinatorLayout;

    invoke-static {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment$$Lambda$24;->lambdaFactory$(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/lang/Runnable;

    move-result-object v3

    const-wide/16 v4, 0x12c

    invoke-virtual {v2, v3, v4, v5}, Landroid/support/design/widget/CoordinatorLayout;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_0

    .end local v1    # "show":Z
    :cond_3
    move v1, v2

    .line 2902
    goto :goto_1

    .restart local v1    # "show":Z
    :cond_4
    move v3, v4

    .line 2906
    goto :goto_2

    :cond_5
    move v2, v4

    .line 2907
    goto :goto_3
.end method

.method private updateOnline(I)V
    .locals 2
    .param p1, "online"    # I

    .prologue
    .line 1591
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getOnlineString(I)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->setSubtitle(Ljava/lang/CharSequence;)V

    .line 1592
    if-nez p1, :cond_0

    .line 1593
    new-instance v0, Lcom/vkontakte/android/api/messages/MessagesGetLastActivity;

    iget v1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->peer:I

    invoke-direct {v0, v1}, Lcom/vkontakte/android/api/messages/MessagesGetLastActivity;-><init>(I)V

    new-instance v1, Lcom/vkontakte/android/fragments/messages/ChatFragment$10;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment$10;-><init>(Lcom/vkontakte/android/fragments/messages/ChatFragment;)V

    .line 1594
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/messages/MessagesGetLastActivity;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 1615
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 1617
    :cond_0
    return-void
.end method

.method private updateTyping()V
    .locals 7

    .prologue
    const/4 v6, 0x0

    .line 1800
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->typingUsers:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_1

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->showTyping(Z)V

    .line 1801
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    iget v1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->peer:I

    iget-object v2, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->typingUsers:Ljava/util/ArrayList;

    iget-object v3, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->chatUsers:Landroid/util/SparseArray;

    iget-object v4, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->typingInvalidate:Lcom/vkontakte/android/functions/VoidF0;

    const/4 v5, -0x1

    invoke-static/range {v0 .. v5}, Lcom/vkontakte/android/ViewUtils;->getTypingText(Landroid/content/Context;ILjava/util/List;Landroid/util/SparseArray;Lcom/vkontakte/android/functions/VoidF0;I)Landroid/text/SpannableString;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->subtitleTyping:Ljava/lang/CharSequence;

    .line 1802
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->isShowTyping:Z

    if-eqz v0, :cond_0

    .line 1803
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->subtitleTyping:Ljava/lang/CharSequence;

    invoke-virtual {p0, v0, v6}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->setSubtitle(Ljava/lang/CharSequence;Z)V

    .line 1805
    :cond_0
    return-void

    :cond_1
    move v0, v6

    .line 1800
    goto :goto_0
.end method


# virtual methods
.method public findExactMatch(Ljava/lang/String;)I
    .locals 1
    .param p1, "query"    # Ljava/lang/String;

    .prologue
    .line 2884
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->mentionsAdapter:Lcom/vkontakte/android/ui/MentionsAdapter;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/ui/MentionsAdapter;->findExactMatch(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public getAreMentionsEnabled()Z
    .locals 1

    .prologue
    .line 305
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getIsMultiChat()Z

    move-result v0

    return v0
.end method

.method public getChatUser(I)Lcom/vkontakte/android/UserProfile;
    .locals 4
    .param p1, "uid"    # I

    .prologue
    .line 1808
    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->chatUsers:Landroid/util/SparseArray;

    invoke-static {v1, p1}, Lcom/vkontakte/android/utils/Utils;->containsKey(Landroid/util/SparseArray;I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1809
    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->chatUsers:Landroid/util/SparseArray;

    invoke-virtual {v1, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/UserProfile;

    .line 1816
    :goto_0
    return-object v1

    .line 1810
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->usersBuf:Landroid/util/SparseArray;

    invoke-static {v1, p1}, Lcom/vkontakte/android/utils/Utils;->containsKey(Landroid/util/SparseArray;I)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1811
    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->usersBuf:Landroid/util/SparseArray;

    invoke-virtual {v1, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/UserProfile;

    goto :goto_0

    .line 1813
    :cond_1
    new-instance v0, Lcom/vkontakte/android/UserProfile;

    invoke-direct {v0}, Lcom/vkontakte/android/UserProfile;-><init>()V

    .line 1814
    .local v0, "p":Lcom/vkontakte/android/UserProfile;
    const-string/jumbo v1, "..."

    iput-object v1, v0, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    iput-object v1, v0, Lcom/vkontakte/android/UserProfile;->lastName:Ljava/lang/String;

    iput-object v1, v0, Lcom/vkontakte/android/UserProfile;->firstName:Ljava/lang/String;

    .line 1815
    const-string/jumbo v1, "vk"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "getChatUser: unknown user "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    move-object v1, v0

    .line 1816
    goto :goto_0
.end method

.method public getContentWidth()I
    .locals 1

    .prologue
    .line 173
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->contentView:Landroid/widget/LinearLayout;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->contentView:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getWidth()I

    move-result v0

    goto :goto_0
.end method

.method public getIsMultiChat()Z
    .locals 2

    .prologue
    .line 309
    iget v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->peer:I

    const v1, 0x77359400

    if-le v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getIsShowingMentionsSuggestions()Z
    .locals 1

    .prologue
    .line 2863
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->coordinatorMentionWrap:Landroid/support/design/widget/CoordinatorLayout;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->coordinatorMentionWrap:Landroid/support/design/widget/CoordinatorLayout;

    invoke-virtual {v0}, Landroid/support/design/widget/CoordinatorLayout;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getPeerID()I
    .locals 1

    .prologue
    .line 1796
    iget v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->peer:I

    return v0
.end method

.method public getUserName(I)Ljava/lang/String;
    .locals 2
    .param p1, "uid"    # I

    .prologue
    .line 168
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->userNamesAcc:Landroid/util/SparseArray;

    const-string/jumbo v1, "..."

    invoke-virtual {v0, p1, v1}, Landroid/util/SparseArray;->get(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public hideEmojiPopup()V
    .locals 1

    .prologue
    .line 1512
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->mKeyboardPopup:Lcom/vkontakte/android/stickers/KeyboardPopup;

    if-eqz v0, :cond_0

    .line 1513
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->mKeyboardPopup:Lcom/vkontakte/android/stickers/KeyboardPopup;

    invoke-virtual {v0}, Lcom/vkontakte/android/stickers/KeyboardPopup;->hide()V

    .line 1515
    :cond_0
    return-void
.end method

.method public hideMentionSuggestions()V
    .locals 1

    .prologue
    .line 2889
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->shouldShowMentions:Z

    .line 2890
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->updateMentionsVisibility()V

    .line 2891
    return-void
.end method

.method public isJumpedToEnd()Z
    .locals 1

    .prologue
    .line 1726
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->jumpedToEnd:Z

    return v0
.end method

.method public isSelected(I)Z
    .locals 3
    .param p1, "mid"    # I

    .prologue
    .line 2707
    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->selectedMessages:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/Message;

    .line 2708
    .local v0, "msg":Lcom/vkontakte/android/Message;
    iget v2, v0, Lcom/vkontakte/android/Message;->id:I

    if-ne v2, p1, :cond_0

    .line 2709
    const/4 v1, 0x1

    .line 2712
    .end local v0    # "msg":Lcom/vkontakte/android/Message;
    :goto_0
    return v1

    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public isShowingTime()Z
    .locals 1

    .prologue
    .line 2573
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->adapter:Lcom/vkontakte/android/ui/adapters/MessagesAdapter;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/adapters/MessagesAdapter;->isTimeVisible()Z

    move-result v0

    return v0
.end method

.method synthetic lambda$confirmAndDelete$21(Ljava/util/List;Landroid/content/DialogInterface;I)V
    .locals 0
    .param p1, "msgs"    # Ljava/util/List;
    .param p2, "dialog"    # Landroid/content/DialogInterface;
    .param p3, "which"    # I

    .prologue
    .line 2650
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->deleteMessages(Ljava/util/List;)V

    return-void
.end method

.method synthetic lambda$loadFwdUsers$24(Ljava/util/ArrayList;)V
    .locals 1
    .param p1, "users"    # Ljava/util/ArrayList;

    .prologue
    .line 2691
    invoke-static {p0, p1}, Lcom/vkontakte/android/fragments/messages/ChatFragment$$Lambda$25;->lambdaFactory$(Lcom/vkontakte/android/fragments/messages/ChatFragment;Ljava/util/ArrayList;)Ljava/lang/Runnable;

    move-result-object v0

    invoke-static {v0}, Lcom/vkontakte/android/ViewUtils;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method synthetic lambda$new$0()V
    .locals 1

    .prologue
    .line 266
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getToolbar()Landroid/support/v7/widget/Toolbar;

    move-result-object v0

    invoke-static {v0}, Lcom/vkontakte/android/ViewUtils;->invalidateViewCascade(Landroid/view/View;)V

    return-void
.end method

.method synthetic lambda$new$1(Landroid/view/View;)V
    .locals 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const v3, 0x77359400

    .line 313
    iget v1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->peer:I

    if-ge v1, v3, :cond_2

    .line 314
    iget v1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->peer:I

    const v2, -0x77359400

    if-ge v1, v2, :cond_1

    .line 325
    :cond_0
    :goto_0
    return-void

    .line 317
    :cond_1
    new-instance v1, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;

    iget v2, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->peer:I

    invoke-direct {v1, v2}, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;-><init>(I)V

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;->go(Landroid/content/Context;)Z

    goto :goto_0

    .line 318
    :cond_2
    iget v1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->peer:I

    sub-int/2addr v1, v3

    invoke-static {v1}, Lcom/vkontakte/android/data/Messages;->getChatAdmin(I)I

    move-result v1

    if-eqz v1, :cond_0

    .line 319
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 320
    .local v0, "args":Landroid/os/Bundle;
    const-string/jumbo v1, "id"

    iget v2, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->peer:I

    sub-int/2addr v2, v3

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 321
    const-string/jumbo v1, "admin"

    iget v2, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->peer:I

    sub-int/2addr v2, v3

    invoke-static {v2}, Lcom/vkontakte/android/data/Messages;->getChatAdmin(I)I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 322
    const-string/jumbo v1, "title"

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v2

    const-string/jumbo v3, "title"

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->getCharSequence(Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putCharSequence(Ljava/lang/String;Ljava/lang/CharSequence;)V

    .line 323
    const-class v1, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-static {v1, v0, v2}, Lcom/vkontakte/android/navigation/Navigate;->to(Ljava/lang/Class;Landroid/os/Bundle;Landroid/content/Context;)V

    goto :goto_0
.end method

.method synthetic lambda$new$2(Landroid/view/View;)V
    .locals 5
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 803
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 804
    .local v0, "mid":I
    iget-object v2, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->messages:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/Message;

    .line 805
    .local v1, "msg":Lcom/vkontakte/android/Message;
    iget v3, v1, Lcom/vkontakte/android/Message;->id:I

    if-ne v3, v0, :cond_0

    .line 806
    new-instance v3, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;

    iget v4, v1, Lcom/vkontakte/android/Message;->sender:I

    invoke-direct {v3, v4}, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;-><init>(I)V

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;->go(Landroid/content/Context;)Z

    goto :goto_0

    .line 809
    .end local v1    # "msg":Lcom/vkontakte/android/Message;
    :cond_1
    return-void
.end method

.method synthetic lambda$new$3(Landroid/view/View;)Z
    .locals 14
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const/4 v13, 0x1

    const/4 v12, 0x0

    .line 811
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Integer;

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 812
    .local v1, "mid":I
    iget-object v7, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->messages:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :cond_0
    :goto_0
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_1

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/Message;

    .line 813
    .local v2, "msg":Lcom/vkontakte/android/Message;
    iget v7, v2, Lcom/vkontakte/android/Message;->id:I

    if-ne v7, v1, :cond_0

    .line 814
    iget v6, v2, Lcom/vkontakte/android/Message;->sender:I

    .line 815
    .local v6, "uid":I
    iget-object v7, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->chatUsers:Landroid/util/SparseArray;

    invoke-static {v7, v6}, Lcom/vkontakte/android/utils/Utils;->containsKey(Landroid/util/SparseArray;I)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 816
    iget-object v7, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->chatUsers:Landroid/util/SparseArray;

    invoke-virtual {v7, v6}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/vkontakte/android/UserProfile;

    iget-object v3, v7, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    .line 817
    .local v3, "name":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getActivity()Landroid/app/Activity;

    move-result-object v7

    invoke-static {v7, v3, v12}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v5

    .line 818
    .local v5, "t":Landroid/widget/Toast;
    const/4 v7, 0x2

    new-array v0, v7, [I

    fill-array-data v0, :array_0

    .line 819
    .local v0, "loc":[I
    invoke-virtual {p1, v0}, Landroid/view/View;->getLocationInWindow([I)V

    .line 820
    new-instance v4, Landroid/graphics/Rect;

    invoke-direct {v4}, Landroid/graphics/Rect;-><init>()V

    .line 821
    .local v4, "rect":Landroid/graphics/Rect;
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getActivity()Landroid/app/Activity;

    move-result-object v7

    invoke-virtual {v7}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v7

    invoke-virtual {v7}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v7

    invoke-virtual {v7, v4}, Landroid/view/View;->getWindowVisibleDisplayFrame(Landroid/graphics/Rect;)V

    .line 822
    const/16 v7, 0x33

    aget v9, v0, v12

    iget v10, v4, Landroid/graphics/Rect;->left:I

    sub-int/2addr v9, v10

    aget v10, v0, v13

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v11

    add-int/2addr v10, v11

    iget v11, v4, Landroid/graphics/Rect;->top:I

    sub-int/2addr v10, v11

    invoke-virtual {v5, v7, v9, v10}, Landroid/widget/Toast;->setGravity(III)V

    .line 823
    invoke-virtual {v5}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 827
    .end local v0    # "loc":[I
    .end local v2    # "msg":Lcom/vkontakte/android/Message;
    .end local v3    # "name":Ljava/lang/String;
    .end local v4    # "rect":Landroid/graphics/Rect;
    .end local v5    # "t":Landroid/widget/Toast;
    .end local v6    # "uid":I
    :cond_1
    return v13

    .line 818
    :array_0
    .array-data 4
        0x0
        0x0
    .end array-data
.end method

.method synthetic lambda$null$13(Ljava/util/ArrayList;)V
    .locals 4
    .param p1, "users1"    # Ljava/util/ArrayList;

    .prologue
    .line 1655
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/UserProfile;

    .line 1657
    .local v0, "user":Lcom/vkontakte/android/UserProfile;
    if-eqz v0, :cond_0

    .line 1658
    iget-object v2, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->chatUsers:Landroid/util/SparseArray;

    iget v3, v0, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-virtual {v2, v3, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto :goto_0

    .line 1661
    .end local v0    # "user":Lcom/vkontakte/android/UserProfile;
    :cond_1
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 1662
    invoke-static {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment$$Lambda$29;->lambdaFactory$(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-static {v1}, Lcom/vkontakte/android/ViewUtils;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 1664
    :cond_2
    return-void
.end method

.method synthetic lambda$null$14(Ljava/lang/String;Ljava/util/ArrayList;Ljava/lang/String;)V
    .locals 6
    .param p1, "title"    # Ljava/lang/String;
    .param p2, "users"    # Ljava/util/ArrayList;
    .param p3, "photo"    # Ljava/lang/String;

    .prologue
    .line 1670
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->isAdded()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 1671
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->updateChatUsersPhotos()V

    .line 1672
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->setTitle(Ljava/lang/CharSequence;)V

    .line 1673
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_3

    .line 1674
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0d0007

    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->setSubtitle(Ljava/lang/CharSequence;)V

    .line 1675
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {p2}, Lcom/vkontakte/android/data/Messages;->createChatPhoto(Ljava/util/ArrayList;)Ljava/lang/String;

    move-result-object p3

    .end local p3    # "photo":Ljava/lang/String;
    :cond_0
    invoke-direct {p0, p3}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->setDialogIcon(Ljava/lang/CharSequence;)V

    .line 1679
    :cond_1
    :goto_0
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->updateTyping()V

    .line 1680
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->invalidateOptionsMenu()V

    .line 1682
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getAreMentionsEnabled()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1683
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->mentionsAdapter:Lcom/vkontakte/android/ui/MentionsAdapter;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->chatUsers:Landroid/util/SparseArray;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/MentionsAdapter;->setUsers(Landroid/util/SparseArray;)V

    .line 1687
    :cond_2
    return-void

    .line 1676
    .restart local p3    # "photo":Ljava/lang/String;
    :cond_3
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 1677
    invoke-direct {p0, p3}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->setDialogIcon(Ljava/lang/CharSequence;)V

    goto :goto_0
.end method

.method synthetic lambda$null$23(Ljava/util/ArrayList;)V
    .locals 5
    .param p1, "users"    # Ljava/util/ArrayList;

    .prologue
    .line 2692
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/UserProfile;

    .line 2693
    .local v1, "up":Lcom/vkontakte/android/UserProfile;
    iget-object v3, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->usersBuf:Landroid/util/SparseArray;

    iget v4, v1, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-virtual {v3, v4, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto :goto_0

    .line 2695
    .end local v1    # "up":Lcom/vkontakte/android/UserProfile;
    :cond_0
    iget-object v2, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->items:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_1
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;

    .line 2696
    .local v0, "item":Lcom/vkontakte/android/ui/holder/messages/MessageListItem;
    iget v2, v0, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->fwdLevel:I

    if-lez v2, :cond_1

    iget-object v2, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->usersBuf:Landroid/util/SparseArray;

    iget v4, v0, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->fwdUid:I

    invoke-static {v2, v4}, Lcom/vkontakte/android/utils/Utils;->containsKey(Landroid/util/SparseArray;I)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 2697
    iget-object v2, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->usersBuf:Landroid/util/SparseArray;

    iget v4, v0, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->fwdUid:I

    invoke-virtual {v2, v4}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/UserProfile;

    iget-object v2, v2, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    iput-object v2, v0, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->fwdName:Ljava/lang/String;

    .line 2698
    iget-object v2, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->usersBuf:Landroid/util/SparseArray;

    iget v4, v0, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->fwdUid:I

    invoke-virtual {v2, v4}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/UserProfile;

    iget-object v2, v2, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    invoke-virtual {v0, v2}, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->setImageUrlFwd(Ljava/lang/String;)V

    .line 2699
    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->updateHolder(Z)V

    goto :goto_1

    .line 2702
    .end local v0    # "item":Lcom/vkontakte/android/ui/holder/messages/MessageListItem;
    :cond_2
    invoke-static {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment$$Lambda$26;->lambdaFactory$(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/lang/Runnable;

    move-result-object v2

    invoke-static {v2}, Lcom/vkontakte/android/ViewUtils;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 2703
    return-void
.end method

.method synthetic lambda$onCreateContentView$10(Landroid/view/View;ILandroid/view/KeyEvent;)Z
    .locals 3
    .param p1, "v"    # Landroid/view/View;
    .param p2, "keyCode"    # I
    .param p3, "event"    # Landroid/view/KeyEvent;

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 1286
    const/4 v2, 0x4

    if-ne p2, v2, :cond_1

    iget-boolean v2, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->keyboardVisible:Z

    if-nez v2, :cond_1

    iget-object v2, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->mKeyboardPopup:Lcom/vkontakte/android/stickers/KeyboardPopup;

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->mKeyboardPopup:Lcom/vkontakte/android/stickers/KeyboardPopup;

    invoke-virtual {v2}, Lcom/vkontakte/android/stickers/KeyboardPopup;->isShowing()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 1287
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result v2

    if-ne v2, v0, :cond_0

    .line 1288
    iget-object v2, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->mKeyboardPopup:Lcom/vkontakte/android/stickers/KeyboardPopup;

    invoke-virtual {v2, v1}, Lcom/vkontakte/android/stickers/KeyboardPopup;->show(Z)V

    .line 1292
    :cond_0
    :goto_0
    return v0

    :cond_1
    move v0, v1

    goto :goto_0
.end method

.method synthetic lambda$onCreateContentView$11(Landroid/view/View;ILandroid/view/KeyEvent;)Z
    .locals 4
    .param p1, "v"    # Landroid/view/View;
    .param p2, "keyCode"    # I
    .param p3, "event"    # Landroid/view/KeyEvent;

    .prologue
    const/4 v1, 0x0

    .line 1313
    if-eqz p3, :cond_2

    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result v2

    if-nez v2, :cond_2

    invoke-virtual {p3}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v2

    const/16 v3, 0x42

    if-ne v2, v3, :cond_2

    .line 1314
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-static {v2}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v2

    const-string/jumbo v3, "sendByEnter"

    invoke-interface {v2, v3, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    .line 1315
    .local v0, "sendByEnter":Z
    if-eqz v0, :cond_0

    invoke-virtual {p3}, Landroid/view/KeyEvent;->getMetaState()I

    move-result v2

    if-eqz v2, :cond_1

    :cond_0
    if-nez v0, :cond_2

    invoke-virtual {p3}, Landroid/view/KeyEvent;->getMetaState()I

    move-result v2

    and-int/lit16 v2, v2, 0x1000

    if-lez v2, :cond_2

    .line 1316
    :cond_1
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->sendMessage()V

    .line 1317
    const/4 v1, 0x1

    .line 1320
    .end local v0    # "sendByEnter":Z
    :cond_2
    return v1
.end method

.method synthetic lambda$onCreateContentView$12(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 1360
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->errorView:Lcom/vkontakte/android/ui/ErrorViewHelper;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/ErrorViewHelper;->setVisibility(I)V

    .line 1361
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->progress:Landroid/widget/ProgressBar;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 1362
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->loadData(Z)V

    .line 1363
    return-void
.end method

.method synthetic lambda$onCreateContentView$6(Landroid/view/View;)V
    .locals 0
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 1132
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->jumpToEnd()V

    return-void
.end method

.method synthetic lambda$onCreateContentView$7(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const/4 v1, 0x0

    .line 1135
    iput-boolean v1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->networkError:Z

    .line 1136
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->loadMoreView:Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;->setVisibilityProgressBar(I)V

    .line 1137
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->loadMoreView:Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;->setVisibilityLoadMoreButton(I)V

    .line 1138
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->loadData(Z)V

    .line 1139
    return-void
.end method

.method synthetic lambda$onCreateContentView$8(Landroid/view/View;)V
    .locals 0
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 1279
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->sendMessage()V

    return-void
.end method

.method synthetic lambda$onCreateContentView$9(Lcom/vkontakte/android/attachments/GraffitiAttachment;)V
    .locals 0
    .param p1, "graffiti"    # Lcom/vkontakte/android/attachments/GraffitiAttachment;

    .prologue
    .line 1280
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->sendAttachment(Lcom/vkontakte/android/attachments/Attachment;)V

    return-void
.end method

.method synthetic lambda$onItemClick$19(Lcom/vkontakte/android/Message;Landroid/content/DialogInterface;I)V
    .locals 1
    .param p1, "message"    # Lcom/vkontakte/android/Message;
    .param p2, "d"    # Landroid/content/DialogInterface;
    .param p3, "i"    # I

    .prologue
    .line 2562
    invoke-static {p1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->deleteMessages(Ljava/util/List;)V

    return-void
.end method

.method synthetic lambda$onOptionsItemSelected$16(Ljava/lang/Integer;Ljava/lang/Object;)V
    .locals 1
    .param p1, "uid"    # Ljava/lang/Integer;
    .param p2, "o"    # Ljava/lang/Object;

    .prologue
    .line 1892
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->messages:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 1893
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->rebuildItems()V

    .line 1894
    return-void
.end method

.method synthetic lambda$onOptionsItemSelected$17(Ljava/lang/Integer;)V
    .locals 1
    .param p1, "uid"    # Ljava/lang/Integer;

    .prologue
    .line 1906
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 1907
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->onBackPressed()V

    .line 1909
    :cond_0
    return-void
.end method

.method synthetic lambda$showMessageOptions$20(Ljava/util/ArrayList;Lcom/vkontakte/android/Message;Landroid/content/DialogInterface;I)V
    .locals 8
    .param p1, "actions"    # Ljava/util/ArrayList;
    .param p2, "msg"    # Lcom/vkontakte/android/Message;
    .param p3, "dialog"    # Landroid/content/DialogInterface;
    .param p4, "which"    # I

    .prologue
    const/4 v6, 0x1

    const/4 v4, 0x0

    .line 2607
    invoke-virtual {p1, p4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    const/4 v5, -0x1

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v7

    sparse-switch v7, :sswitch_data_0

    :cond_0
    move v3, v5

    :goto_0
    packed-switch v3, :pswitch_data_0

    .line 2644
    :cond_1
    :goto_1
    return-void

    .line 2607
    :sswitch_0
    const-string/jumbo v7, "reply"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    move v3, v4

    goto :goto_0

    :sswitch_1
    const-string/jumbo v7, "forward"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    move v3, v6

    goto :goto_0

    :sswitch_2
    const-string/jumbo v7, "retry"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    const/4 v3, 0x2

    goto :goto_0

    :sswitch_3
    const-string/jumbo v7, "copy"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    const/4 v3, 0x3

    goto :goto_0

    :sswitch_4
    const-string/jumbo v7, "delete"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    const/4 v3, 0x4

    goto :goto_0

    .line 2609
    :pswitch_0
    iget-object v3, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->writeBar:Lcom/vkontakte/android/ui/WriteBar;

    if-eqz v3, :cond_1

    .line 2610
    iget-object v3, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->writeBar:Lcom/vkontakte/android/ui/WriteBar;

    new-array v5, v6, [Lcom/vkontakte/android/Message;

    aput-object p2, v5, v4

    invoke-static {v5}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/vkontakte/android/ui/WriteBar;->addFwdMessages(Ljava/util/List;)V

    goto :goto_1

    .line 2615
    :pswitch_1
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 2616
    .local v2, "msgs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/Message;>;"
    invoke-virtual {v2, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2617
    invoke-direct {p0, v2}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->forward(Ljava/util/ArrayList;)V

    goto :goto_1

    .line 2622
    .end local v2    # "msgs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/Message;>;"
    :pswitch_2
    :try_start_0
    iget-object v3, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->messages:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_2
    :goto_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/Message;

    .line 2623
    .local v1, "m":Lcom/vkontakte/android/Message;
    iget v4, v1, Lcom/vkontakte/android/Message;->id:I

    iget v5, p2, Lcom/vkontakte/android/Message;->id:I

    if-ne v4, v5, :cond_2

    iget-boolean v4, v1, Lcom/vkontakte/android/Message;->sendFailed:Z

    if-eqz v4, :cond_2

    .line 2624
    invoke-direct {p0, p2}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->retryFailed(Lcom/vkontakte/android/Message;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    .line 2627
    .end local v1    # "m":Lcom/vkontakte/android/Message;
    :catch_0
    move-exception v3

    goto :goto_1

    .line 2632
    :pswitch_3
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    const-string/jumbo v5, "clipboard"

    invoke-virtual {v3, v5}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/text/ClipboardManager;

    .line 2633
    .local v0, "cm":Landroid/text/ClipboardManager;
    iget-object v3, p2, Lcom/vkontakte/android/Message;->text:Ljava/lang/String;

    invoke-virtual {v0, v3}, Landroid/text/ClipboardManager;->setText(Ljava/lang/CharSequence;)V

    .line 2634
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    const v5, 0x7f080703

    invoke-static {v3, v5, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/Toast;->show()V

    goto/16 :goto_1

    .line 2638
    .end local v0    # "cm":Landroid/text/ClipboardManager;
    :pswitch_4
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 2639
    .restart local v2    # "msgs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/Message;>;"
    invoke-virtual {v2, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2640
    invoke-direct {p0, v2}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->confirmAndDelete(Ljava/util/List;)V

    goto/16 :goto_1

    .line 2607
    nop

    :sswitch_data_0
    .sparse-switch
        -0x4f997a55 -> :sswitch_4
        -0x285c6d3b -> :sswitch_1
        0x2eaf75 -> :sswitch_3
        0x67612ea -> :sswitch_0
        0x67622a8 -> :sswitch_2
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method

.method synthetic lambda$updateChatUsers$15(Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;)V
    .locals 7
    .param p1, "users"    # Ljava/util/ArrayList;
    .param p2, "title"    # Ljava/lang/String;
    .param p3, "photo"    # Ljava/lang/String;

    .prologue
    .line 1639
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    if-nez v3, :cond_0

    .line 1688
    :goto_0
    return-void

    .line 1642
    :cond_0
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_1
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/ChatUser;

    .line 1643
    .local v2, "user":Lcom/vkontakte/android/ChatUser;
    if-eqz v2, :cond_1

    iget-object v4, v2, Lcom/vkontakte/android/ChatUser;->user:Lcom/vkontakte/android/UserProfile;

    if-eqz v4, :cond_1

    .line 1644
    iget-object v4, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->chatUsers:Landroid/util/SparseArray;

    iget-object v5, v2, Lcom/vkontakte/android/ChatUser;->user:Lcom/vkontakte/android/UserProfile;

    iget v5, v5, Lcom/vkontakte/android/UserProfile;->uid:I

    iget-object v6, v2, Lcom/vkontakte/android/ChatUser;->user:Lcom/vkontakte/android/UserProfile;

    invoke-virtual {v4, v5, v6}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto :goto_1

    .line 1647
    .end local v2    # "user":Lcom/vkontakte/android/ChatUser;
    :cond_2
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 1648
    .local v1, "needUsers":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    iget-object v3, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->messages:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_3
    :goto_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_4

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/Message;

    .line 1649
    .local v0, "msg":Lcom/vkontakte/android/Message;
    iget v4, v0, Lcom/vkontakte/android/Message;->sender:I

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v5

    invoke-virtual {v5}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v5

    if-eq v4, v5, :cond_3

    iget-object v4, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->chatUsers:Landroid/util/SparseArray;

    iget v5, v0, Lcom/vkontakte/android/Message;->sender:I

    invoke-static {v4, v5}, Lcom/vkontakte/android/utils/Utils;->containsKey(Landroid/util/SparseArray;I)Z

    move-result v4

    if-nez v4, :cond_3

    iget v4, v0, Lcom/vkontakte/android/Message;->sender:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_3

    .line 1650
    iget v4, v0, Lcom/vkontakte/android/Message;->sender:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 1653
    .end local v0    # "msg":Lcom/vkontakte/android/Message;
    :cond_4
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-lez v3, :cond_5

    .line 1654
    invoke-static {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment$$Lambda$27;->lambdaFactory$(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Lcom/vkontakte/android/data/Friends$GetUsersCallback;

    move-result-object v3

    invoke-static {v1, v3}, Lcom/vkontakte/android/data/Friends;->getUsers(Ljava/util/Collection;Lcom/vkontakte/android/data/Friends$GetUsersCallback;)V

    .line 1669
    :cond_5
    invoke-static {p0, p2, p1, p3}, Lcom/vkontakte/android/fragments/messages/ChatFragment$$Lambda$28;->lambdaFactory$(Lcom/vkontakte/android/fragments/messages/ChatFragment;Ljava/lang/String;Ljava/util/ArrayList;Ljava/lang/String;)Ljava/lang/Runnable;

    move-result-object v3

    invoke-static {v3}, Lcom/vkontakte/android/ViewUtils;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method synthetic lambda$updateList$18(Ljava/util/ArrayList;)V
    .locals 1
    .param p1, "listItems"    # Ljava/util/ArrayList;

    .prologue
    .line 2307
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->adapter:Lcom/vkontakte/android/ui/adapters/MessagesAdapter;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/ui/adapters/MessagesAdapter;->setItems(Ljava/util/ArrayList;)V

    .line 2308
    return-void
.end method

.method synthetic lambda$updateMentionsVisibility$25()V
    .locals 2

    .prologue
    .line 2912
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->bottomSheetBehavior:Lcom/vk/attachpicker/widget/VkBottomSheetBehavior;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/widget/VkBottomSheetBehavior;->forceState(I)V

    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 5
    .param p1, "reqCode"    # I
    .param p2, "resCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 2458
    invoke-super {p0, p1, p2, p3}, Lcom/vkontakte/android/fragments/VKToolbarFragment;->onActivityResult(IILandroid/content/Intent;)V

    .line 2459
    sget-boolean v2, Lcom/vkontakte/android/fragments/messages/ChatFragment;->$assertionsDisabled:Z

    if-nez v2, :cond_0

    iget-object v2, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->writeBar:Lcom/vkontakte/android/ui/WriteBar;

    if-nez v2, :cond_0

    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2

    .line 2460
    :cond_0
    const/16 v2, 0x2710

    if-le p1, v2, :cond_1

    .line 2461
    iget-object v2, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->writeBar:Lcom/vkontakte/android/ui/WriteBar;

    invoke-virtual {v2, p1, p2, p3}, Lcom/vkontakte/android/ui/WriteBar;->onActivityResult(IILandroid/content/Intent;)V

    .line 2463
    :cond_1
    const/16 v2, 0xc8

    if-ne p1, v2, :cond_2

    const/4 v2, -0x1

    if-ne p2, v2, :cond_2

    .line 2464
    const-string/jumbo v2, "profile"

    invoke-virtual {p3, v2}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/UserProfile;

    .line 2465
    .local v1, "profile":Lcom/vkontakte/android/UserProfile;
    iget v2, v1, Lcom/vkontakte/android/UserProfile;->uid:I

    iget v3, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->peer:I

    if-ne v2, v3, :cond_3

    .line 2466
    iget-object v2, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->writeBar:Lcom/vkontakte/android/ui/WriteBar;

    iget-object v3, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->messagesToForward:Ljava/util/ArrayList;

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/ui/WriteBar;->addFwdMessages(Ljava/util/List;)V

    .line 2476
    .end local v1    # "profile":Lcom/vkontakte/android/UserProfile;
    :cond_2
    :goto_0
    return-void

    .line 2468
    .restart local v1    # "profile":Lcom/vkontakte/android/UserProfile;
    :cond_3
    new-instance v2, Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;

    iget v3, v1, Lcom/vkontakte/android/UserProfile;->uid:I

    iget-object v4, v1, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    invoke-direct {v2, v3, v4}, Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;-><init>(ILjava/lang/String;)V

    iget-object v3, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->messagesToForward:Ljava/util/ArrayList;

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;->setFwd(Ljava/util/ArrayList;)Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;

    move-result-object v0

    .line 2470
    .local v0, "builder":Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;
    iget v2, v1, Lcom/vkontakte/android/UserProfile;->uid:I

    const v3, 0x77359400

    if-ge v2, v3, :cond_4

    .line 2471
    iget-object v2, v1, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    invoke-virtual {v0, v2}, Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;->setPhoto(Ljava/lang/CharSequence;)Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;

    .line 2473
    :cond_4
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;->go(Landroid/content/Context;)Z

    goto :goto_0
.end method

.method public onAttach(Landroid/app/Activity;)V
    .locals 3
    .param p1, "act"    # Landroid/app/Activity;

    .prologue
    .line 1383
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/VKToolbarFragment;->onAttach(Landroid/app/Activity;)V

    .line 1384
    sget-object v0, Lcom/vkontakte/android/fragments/market/GoodFragment$Builder$Source;->im:Lcom/vkontakte/android/fragments/market/GoodFragment$Builder$Source;

    invoke-static {v0}, Lcom/vkontakte/android/attachments/MarketAttachment;->setLastSource(Lcom/vkontakte/android/fragments/market/GoodFragment$Builder$Source;)V

    .line 1386
    const v0, 0x7f0b010a

    invoke-virtual {p1, v0}, Landroid/app/Activity;->setTheme(I)V

    .line 1388
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "id"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->peer:I

    .line 1389
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->setHasOptionsMenu(Z)V

    .line 1390
    return-void
.end method

.method public onBackPressed()Z
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 2836
    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->mKeyboardPopup:Lcom/vkontakte/android/stickers/KeyboardPopup;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->mKeyboardPopup:Lcom/vkontakte/android/stickers/KeyboardPopup;

    invoke-virtual {v1}, Lcom/vkontakte/android/stickers/KeyboardPopup;->isShowing()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 2837
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->hideEmojiPopup()V

    .line 2847
    :goto_0
    return v0

    .line 2841
    :cond_0
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getIsShowingMentionsSuggestions()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 2842
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->hideMentionSuggestions()V

    goto :goto_0

    .line 2847
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onBackspace()V
    .locals 4

    .prologue
    .line 198
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->contentView:Landroid/widget/LinearLayout;

    const v1, 0x7f1005c7

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v1, Landroid/view/KeyEvent;

    const/4 v2, 0x0

    const/16 v3, 0x43

    invoke-direct {v1, v2, v3}, Landroid/view/KeyEvent;-><init>(II)V

    invoke-virtual {v0, v1}, Landroid/view/View;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    .line 199
    return-void
.end method

.method public onBuildMessage()V
    .locals 3

    .prologue
    .line 2290
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->contentView:Landroid/widget/LinearLayout;

    .line 2291
    .local v0, "view":Landroid/view/View;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v1

    if-nez v1, :cond_0

    iget-boolean v1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->relayoutThumbsRequested:Z

    if-nez v1, :cond_0

    .line 2292
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->relayoutThumbsRequested:Z

    .line 2293
    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v1

    new-instance v2, Lcom/vkontakte/android/fragments/messages/ChatFragment$18;

    invoke-direct {v2, p0, v0}, Lcom/vkontakte/android/fragments/messages/ChatFragment$18;-><init>(Lcom/vkontakte/android/fragments/messages/ChatFragment;Landroid/view/View;)V

    invoke-virtual {v1, v2}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 2302
    :cond_0
    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 2
    .param p1, "cfg"    # Landroid/content/res/Configuration;

    .prologue
    .line 1498
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/VKToolbarFragment;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 1499
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->mKeyboardPopup:Lcom/vkontakte/android/stickers/KeyboardPopup;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->mKeyboardPopup:Lcom/vkontakte/android/stickers/KeyboardPopup;

    invoke-virtual {v0}, Lcom/vkontakte/android/stickers/KeyboardPopup;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1500
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->mKeyboardPopup:Lcom/vkontakte/android/stickers/KeyboardPopup;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/stickers/KeyboardPopup;->show(Z)V

    .line 1501
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->mKeyboardPopup:Lcom/vkontakte/android/stickers/KeyboardPopup;

    invoke-virtual {v0}, Lcom/vkontakte/android/stickers/KeyboardPopup;->notifyLayoutHasChanged()V

    .line 1502
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->mStickersView:Lcom/vkontakte/android/stickers/StickersView;

    if-eqz v0, :cond_0

    .line 1503
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->mStickersView:Lcom/vkontakte/android/stickers/StickersView;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/stickers/StickersView;->dispatchConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 1506
    :cond_0
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->updateMentionsVisibility()V

    .line 1507
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 5
    .param p1, "b"    # Landroid/os/Bundle;

    .prologue
    .line 1414
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/VKToolbarFragment;->onCreate(Landroid/os/Bundle;)V

    .line 1416
    invoke-static {}, Lcom/vkontakte/android/stickers/Stickers;->get()Lcom/vkontakte/android/stickers/Stickers;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vkontakte/android/stickers/Stickers;->checkServerUpdates()V

    .line 1418
    if-eqz p1, :cond_0

    .line 1419
    const-string/jumbo v1, "key_group"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/api/Group;

    iput-object v1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->group:Lcom/vkontakte/android/api/Group;

    .line 1421
    :cond_0
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 1422
    .local v0, "filter":Landroid/content/IntentFilter;
    const-string/jumbo v1, "com.vkontakte.android.MESSAGE_DELETED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 1423
    const-string/jumbo v1, "com.vkontakte.android.MESSAGE_RSTATE_CHANGED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 1424
    const-string/jumbo v1, "com.vkontakte.android.NEW_MESSAGE"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 1425
    const-string/jumbo v1, "com.vkontakte.android.UPDATE_MESSAGE"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 1426
    const-string/jumbo v1, "com.vkontakte.android.TYPING"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 1427
    const-string/jumbo v1, "com.vkontakte.android.USER_PRESENCE"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 1428
    const-string/jumbo v1, "com.vkontakte.android.CHAT_CHANGED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 1429
    const-string/jumbo v1, "com.vkontakte.android.DIALOG_CHANGED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 1430
    const-string/jumbo v1, "com.vkontakte.android.MUTE_CHANGED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 1431
    const-string/jumbo v1, "com.vkontakte.android.REFRESH_DIALOGS"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 1432
    const-string/jumbo v1, "com.vkontakte.android.COMMUNITY_MESSAGES_BLOCK_CHANGED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 1433
    const-string/jumbo v1, "com.vkontakte.android.MESSAGE_ID_CHANGED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 1434
    const-string/jumbo v1, "com.vkontakte.android.MESSAGE_SEND_FAILED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 1435
    const-string/jumbo v1, "com.vkontakte.android.UPLOAD_DONE"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 1436
    const-string/jumbo v1, "com.vkontakte.android.actions.AUDIO_MESSAGE_DONE"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 1437
    sget-object v1, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->receiver:Landroid/content/BroadcastReceiver;

    const-string/jumbo v3, "com.vkontakte.android.permission.ACCESS_DATA"

    const/4 v4, 0x0

    invoke-virtual {v1, v2, v0, v3, v4}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;)Landroid/content/Intent;

    .line 1439
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    const-string/jumbo v2, "msg_id"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v1

    iput v1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->searchedMessageId:I

    .line 1440
    return-void
.end method

.method public onCreateContentView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 27
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 964
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getActivity()Landroid/app/Activity;

    move-result-object v4

    .line 965
    .local v4, "act":Landroid/app/Activity;
    new-instance v21, Lcom/vkontakte/android/fragments/messages/ChatFragment$3;

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v4}, Lcom/vkontakte/android/fragments/messages/ChatFragment$3;-><init>(Lcom/vkontakte/android/fragments/messages/ChatFragment;Landroid/content/Context;)V

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/vkontakte/android/fragments/messages/ChatFragment;->contentView:Landroid/widget/LinearLayout;

    .line 973
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->contentView:Landroid/widget/LinearLayout;

    move-object/from16 v21, v0

    new-instance v22, Landroid/view/ViewGroup$LayoutParams;

    const/16 v23, -0x1

    const/16 v24, -0x1

    invoke-direct/range {v22 .. v24}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual/range {v21 .. v22}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 975
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->contentView:Landroid/widget/LinearLayout;

    move-object/from16 v21, v0

    const/16 v22, 0x1

    invoke-virtual/range {v21 .. v22}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 977
    new-instance v20, Landroid/widget/FrameLayout;

    move-object/from16 v0, v20

    invoke-direct {v0, v4}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 978
    .local v20, "wrap":Landroid/view/ViewGroup;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->contentView:Landroid/widget/LinearLayout;

    move-object/from16 v21, v0

    new-instance v22, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v23, -0x1

    const/16 v24, -0x1

    const/high16 v25, 0x3f800000    # 1.0f

    invoke-direct/range {v22 .. v25}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    move-object/from16 v0, v21

    move-object/from16 v1, v20

    move-object/from16 v2, v22

    invoke-virtual {v0, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 979
    new-instance v21, Lcom/vkontakte/android/ui/WriteBar;

    move-object/from16 v0, v21

    invoke-direct {v0, v4}, Lcom/vkontakte/android/ui/WriteBar;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/vkontakte/android/fragments/messages/ChatFragment;->writeBar:Lcom/vkontakte/android/ui/WriteBar;

    .line 980
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->writeBar:Lcom/vkontakte/android/ui/WriteBar;

    move-object/from16 v21, v0

    const/16 v22, 0x1

    invoke-virtual/range {v21 .. v22}, Lcom/vkontakte/android/ui/WriteBar;->setChat(Z)V

    .line 981
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->writeBar:Lcom/vkontakte/android/ui/WriteBar;

    move-object/from16 v22, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->peer:I

    move/from16 v21, v0

    if-lez v21, :cond_7

    move-object/from16 v0, p0

    iget v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->peer:I

    move/from16 v21, v0

    .line 982
    invoke-static/range {v21 .. v21}, Lcom/vkontakte/android/auth/VKAccountManager;->isCurrentUser(I)Z

    move-result v21

    if-nez v21, :cond_7

    const/16 v21, 0x1

    :goto_0
    move/from16 v0, v21

    move-object/from16 v1, v22

    iput-boolean v0, v1, Lcom/vkontakte/android/ui/WriteBar;->giftAllowed:Z

    .line 985
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->writeBar:Lcom/vkontakte/android/ui/WriteBar;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    iget-boolean v0, v0, Lcom/vkontakte/android/ui/WriteBar;->giftAllowed:Z

    move/from16 v21, v0

    if-eqz v21, :cond_0

    .line 987
    move-object/from16 v0, p0

    iget v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->peer:I

    move/from16 v21, v0

    const v22, 0x77359400

    move/from16 v0, v21

    move/from16 v1, v22

    if-ge v0, v1, :cond_9

    .line 989
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->writeBar:Lcom/vkontakte/android/ui/WriteBar;

    move-object/from16 v21, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->peer:I

    move/from16 v22, v0

    invoke-static/range {v22 .. v22}, Lcom/vkontakte/android/data/Friends;->get(I)Lcom/vkontakte/android/UserProfile;

    move-result-object v22

    move-object/from16 v0, v22

    move-object/from16 v1, v21

    iput-object v0, v1, Lcom/vkontakte/android/ui/WriteBar;->giftUser:Lcom/vkontakte/android/UserProfile;

    .line 990
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->writeBar:Lcom/vkontakte/android/ui/WriteBar;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/vkontakte/android/ui/WriteBar;->giftUser:Lcom/vkontakte/android/UserProfile;

    move-object/from16 v21, v0

    if-nez v21, :cond_0

    .line 991
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->writeBar:Lcom/vkontakte/android/ui/WriteBar;

    move-object/from16 v21, v0

    new-instance v22, Lcom/vkontakte/android/UserProfile;

    invoke-direct/range {v22 .. v22}, Lcom/vkontakte/android/UserProfile;-><init>()V

    move-object/from16 v0, v22

    move-object/from16 v1, v21

    iput-object v0, v1, Lcom/vkontakte/android/ui/WriteBar;->giftUser:Lcom/vkontakte/android/UserProfile;

    .line 992
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->writeBar:Lcom/vkontakte/android/ui/WriteBar;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/vkontakte/android/ui/WriteBar;->giftUser:Lcom/vkontakte/android/UserProfile;

    move-object/from16 v21, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->peer:I

    move/from16 v22, v0

    move/from16 v0, v22

    move-object/from16 v1, v21

    iput v0, v1, Lcom/vkontakte/android/UserProfile;->uid:I

    .line 993
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->writeBar:Lcom/vkontakte/android/ui/WriteBar;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/vkontakte/android/ui/WriteBar;->giftUser:Lcom/vkontakte/android/UserProfile;

    move-object/from16 v21, v0

    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v22

    const-string/jumbo v23, "title"

    invoke-virtual/range {v22 .. v23}, Landroid/os/Bundle;->getCharSequence(Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object v22

    invoke-interface/range {v22 .. v22}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, v22

    move-object/from16 v1, v21

    iput-object v0, v1, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    .line 994
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->writeBar:Lcom/vkontakte/android/ui/WriteBar;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/vkontakte/android/ui/WriteBar;->giftUser:Lcom/vkontakte/android/UserProfile;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    move-object/from16 v21, v0

    const-string/jumbo v22, " "

    invoke-virtual/range {v21 .. v22}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    .line 995
    .local v5, "arr":[Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->writeBar:Lcom/vkontakte/android/ui/WriteBar;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/vkontakte/android/ui/WriteBar;->giftUser:Lcom/vkontakte/android/UserProfile;

    move-object/from16 v21, v0

    const/16 v22, 0x0

    aget-object v22, v5, v22

    move-object/from16 v0, v22

    move-object/from16 v1, v21

    iput-object v0, v1, Lcom/vkontakte/android/UserProfile;->firstName:Ljava/lang/String;

    .line 996
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->writeBar:Lcom/vkontakte/android/ui/WriteBar;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/vkontakte/android/ui/WriteBar;->giftUser:Lcom/vkontakte/android/UserProfile;

    move-object/from16 v22, v0

    array-length v0, v5

    move/from16 v21, v0

    const/16 v23, 0x1

    move/from16 v0, v21

    move/from16 v1, v23

    if-le v0, v1, :cond_8

    const/16 v21, 0x1

    aget-object v21, v5, v21

    :goto_1
    move-object/from16 v0, v21

    move-object/from16 v1, v22

    iput-object v0, v1, Lcom/vkontakte/android/UserProfile;->lastName:Ljava/lang/String;

    .line 997
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->writeBar:Lcom/vkontakte/android/ui/WriteBar;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/vkontakte/android/ui/WriteBar;->giftUser:Lcom/vkontakte/android/UserProfile;

    move-object/from16 v21, v0

    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v22

    const-string/jumbo v23, "photo"

    invoke-virtual/range {v22 .. v23}, Landroid/os/Bundle;->getCharSequence(Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object v22

    invoke-interface/range {v22 .. v22}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, v22

    move-object/from16 v1, v21

    iput-object v0, v1, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    .line 1009
    .end local v5    # "arr":[Ljava/lang/String;
    :cond_0
    :goto_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->writeBar:Lcom/vkontakte/android/ui/WriteBar;

    move-object/from16 v22, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->peer:I

    move/from16 v21, v0

    const v23, 0x77359400

    move/from16 v0, v21

    move/from16 v1, v23

    if-ge v0, v1, :cond_1

    move-object/from16 v0, p0

    iget v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->peer:I

    move/from16 v21, v0

    if-lez v21, :cond_1

    move-object/from16 v0, p0

    iget v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->peer:I

    move/from16 v21, v0

    invoke-static/range {v21 .. v21}, Lcom/vkontakte/android/auth/VKAccountManager;->isCurrentUser(I)Z

    move-result v21

    if-nez v21, :cond_1

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v21

    move-object/from16 v0, v21

    iget-boolean v0, v0, Lcom/vkontakte/android/auth/VKAccount;->moneyTransfersCanSend:Z

    move/from16 v21, v0

    if-nez v21, :cond_2

    :cond_1
    move-object/from16 v0, p0

    iget v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->peer:I

    move/from16 v21, v0

    if-gez v21, :cond_a

    .line 1010
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v21

    move-object/from16 v0, v21

    iget-boolean v0, v0, Lcom/vkontakte/android/auth/VKAccount;->moneyTransfersCanSendToCommunities:Z

    move/from16 v21, v0

    if-eqz v21, :cond_a

    :cond_2
    const/16 v21, 0x1

    :goto_3
    move/from16 v0, v21

    move-object/from16 v1, v22

    iput-boolean v0, v1, Lcom/vkontakte/android/ui/WriteBar;->moneyTransferAllowed:Z

    .line 1011
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->writeBar:Lcom/vkontakte/android/ui/WriteBar;

    move-object/from16 v21, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->peer:I

    move/from16 v22, v0

    move/from16 v0, v22

    move-object/from16 v1, v21

    iput v0, v1, Lcom/vkontakte/android/ui/WriteBar;->peerId:I

    .line 1013
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->writeBar:Lcom/vkontakte/android/ui/WriteBar;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/WriteBar;->setFragment(Landroid/app/Fragment;)V

    .line 1014
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->contentView:Landroid/widget/LinearLayout;

    move-object/from16 v21, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->writeBar:Lcom/vkontakte/android/ui/WriteBar;

    move-object/from16 v22, v0

    new-instance v23, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v24, -0x1

    const/16 v25, -0x2

    invoke-direct/range {v23 .. v25}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual/range {v21 .. v23}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 1015
    const v21, 0x7f0f0082

    invoke-virtual/range {v20 .. v21}, Landroid/view/ViewGroup;->setBackgroundResource(I)V

    .line 1017
    new-instance v21, Lcom/vkontakte/android/stickers/StickersView;

    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getActivity()Landroid/app/Activity;

    move-result-object v22

    move-object/from16 v0, v21

    move-object/from16 v1, v22

    move-object/from16 v2, p0

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/stickers/StickersView;-><init>(Landroid/content/Context;Lcom/vkontakte/android/stickers/StickersView$Listener;)V

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/vkontakte/android/fragments/messages/ChatFragment;->mStickersView:Lcom/vkontakte/android/stickers/StickersView;

    .line 1019
    new-instance v21, Lcom/vkontakte/android/stickers/KeyboardPopup;

    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getActivity()Landroid/app/Activity;

    move-result-object v22

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->contentView:Landroid/widget/LinearLayout;

    move-object/from16 v23, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->mStickersView:Lcom/vkontakte/android/stickers/StickersView;

    move-object/from16 v24, v0

    invoke-direct/range {v21 .. v24}, Lcom/vkontakte/android/stickers/KeyboardPopup;-><init>(Landroid/app/Activity;Landroid/view/View;Landroid/view/View;)V

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/vkontakte/android/fragments/messages/ChatFragment;->mKeyboardPopup:Lcom/vkontakte/android/stickers/KeyboardPopup;

    .line 1020
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->mKeyboardPopup:Lcom/vkontakte/android/stickers/KeyboardPopup;

    move-object/from16 v21, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->writeBar:Lcom/vkontakte/android/ui/WriteBar;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Lcom/vkontakte/android/ui/WriteBar;->getAnchor()Landroid/view/View;

    move-result-object v22

    const v23, -0x14110e

    invoke-virtual/range {v21 .. v23}, Lcom/vkontakte/android/stickers/KeyboardPopup;->attachToAnchor(Landroid/view/View;I)V

    .line 1021
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->mKeyboardPopup:Lcom/vkontakte/android/stickers/KeyboardPopup;

    move-object/from16 v21, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->writeBar:Lcom/vkontakte/android/ui/WriteBar;

    move-object/from16 v22, v0

    invoke-virtual/range {v21 .. v22}, Lcom/vkontakte/android/stickers/KeyboardPopup;->setOnVisibilityChangedListener(Lcom/vkontakte/android/stickers/KeyboardPopup$OnVisibilityChangedListener;)V

    .line 1023
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->writeBar:Lcom/vkontakte/android/ui/WriteBar;

    move-object/from16 v21, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->mKeyboardPopup:Lcom/vkontakte/android/stickers/KeyboardPopup;

    move-object/from16 v22, v0

    invoke-virtual/range {v21 .. v22}, Lcom/vkontakte/android/ui/WriteBar;->setKeyboardPopup(Lcom/vkontakte/android/stickers/KeyboardPopup;)V

    .line 1024
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->writeBar:Lcom/vkontakte/android/ui/WriteBar;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/WriteBar;->setAutoSuggestPopupListener(Lcom/vkontakte/android/stickers/StickersView$Listener;)V

    .line 1026
    new-instance v21, Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;

    invoke-direct/range {v21 .. v21}, Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;-><init>()V

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/vkontakte/android/fragments/messages/ChatFragment;->loadMoreView:Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;

    .line 1027
    new-instance v21, Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;

    invoke-direct/range {v21 .. v21}, Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;-><init>()V

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/vkontakte/android/fragments/messages/ChatFragment;->loadMoreViewBtm:Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;

    .line 1029
    new-instance v12, Landroid/view/GestureDetector;

    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getContext()Landroid/content/Context;

    move-result-object v21

    new-instance v22, Lcom/vkontakte/android/fragments/messages/ChatFragment$4;

    move-object/from16 v0, v22

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/vkontakte/android/fragments/messages/ChatFragment$4;-><init>(Lcom/vkontakte/android/fragments/messages/ChatFragment;)V

    move-object/from16 v0, v21

    move-object/from16 v1, v22

    invoke-direct {v12, v0, v1}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    .line 1045
    .local v12, "gestureDetector":Landroid/view/GestureDetector;
    const v21, 0x7f03006d

    const/16 v22, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v21

    move-object/from16 v2, p2

    move/from16 v3, v22

    invoke-virtual {v0, v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v21

    check-cast v21, Lcom/vkontakte/android/ui/widget/ChatRecyclerView;

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/vkontakte/android/fragments/messages/ChatFragment;->list:Lcom/vkontakte/android/ui/widget/ChatRecyclerView;

    .line 1046
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->list:Lcom/vkontakte/android/ui/widget/ChatRecyclerView;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    invoke-virtual {v0, v12}, Lcom/vkontakte/android/ui/widget/ChatRecyclerView;->setGestureDetector(Landroid/view/GestureDetector;)V

    .line 1047
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->list:Lcom/vkontakte/android/ui/widget/ChatRecyclerView;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Lcom/vkontakte/android/ui/widget/ChatRecyclerView;->getItemAnimator()Landroid/support/v7/widget/RecyclerView$ItemAnimator;

    move-result-object v21

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->list:Lcom/vkontakte/android/ui/widget/ChatRecyclerView;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Lcom/vkontakte/android/ui/widget/ChatRecyclerView;->getItemAnimator()Landroid/support/v7/widget/RecyclerView$ItemAnimator;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->getChangeDuration()J

    move-result-wide v22

    const-wide/16 v24, 0x3

    div-long v22, v22, v24

    invoke-virtual/range {v21 .. v23}, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->setChangeDuration(J)V

    .line 1048
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->list:Lcom/vkontakte/android/ui/widget/ChatRecyclerView;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Lcom/vkontakte/android/ui/widget/ChatRecyclerView;->getItemAnimator()Landroid/support/v7/widget/RecyclerView$ItemAnimator;

    move-result-object v21

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->list:Lcom/vkontakte/android/ui/widget/ChatRecyclerView;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Lcom/vkontakte/android/ui/widget/ChatRecyclerView;->getItemAnimator()Landroid/support/v7/widget/RecyclerView$ItemAnimator;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->getMoveDuration()J

    move-result-wide v22

    const-wide/16 v24, 0x3

    div-long v22, v22, v24

    invoke-virtual/range {v21 .. v23}, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->setMoveDuration(J)V

    .line 1049
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->list:Lcom/vkontakte/android/ui/widget/ChatRecyclerView;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Lcom/vkontakte/android/ui/widget/ChatRecyclerView;->getItemAnimator()Landroid/support/v7/widget/RecyclerView$ItemAnimator;

    move-result-object v21

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->list:Lcom/vkontakte/android/ui/widget/ChatRecyclerView;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Lcom/vkontakte/android/ui/widget/ChatRecyclerView;->getItemAnimator()Landroid/support/v7/widget/RecyclerView$ItemAnimator;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->getAddDuration()J

    move-result-wide v22

    const-wide/16 v24, 0x3

    div-long v22, v22, v24

    invoke-virtual/range {v21 .. v23}, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->setAddDuration(J)V

    .line 1050
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->list:Lcom/vkontakte/android/ui/widget/ChatRecyclerView;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Lcom/vkontakte/android/ui/widget/ChatRecyclerView;->getItemAnimator()Landroid/support/v7/widget/RecyclerView$ItemAnimator;

    move-result-object v21

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->list:Lcom/vkontakte/android/ui/widget/ChatRecyclerView;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Lcom/vkontakte/android/ui/widget/ChatRecyclerView;->getItemAnimator()Landroid/support/v7/widget/RecyclerView$ItemAnimator;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->getRemoveDuration()J

    move-result-wide v22

    const-wide/16 v24, 0x3

    div-long v22, v22, v24

    invoke-virtual/range {v21 .. v23}, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->setRemoveDuration(J)V

    .line 1051
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->list:Lcom/vkontakte/android/ui/widget/ChatRecyclerView;

    move-object/from16 v21, v0

    new-instance v22, Lcom/vkontakte/android/fragments/messages/ChatFragment$5;

    move-object/from16 v0, v22

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/vkontakte/android/fragments/messages/ChatFragment$5;-><init>(Lcom/vkontakte/android/fragments/messages/ChatFragment;)V

    invoke-virtual/range {v21 .. v22}, Lcom/vkontakte/android/ui/widget/ChatRecyclerView;->addOnScrollListener(Landroid/support/v7/widget/RecyclerView$OnScrollListener;)V

    .line 1076
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->list:Lcom/vkontakte/android/ui/widget/ChatRecyclerView;

    move-object/from16 v21, v0

    const/16 v22, 0x0

    const/16 v23, 0x0

    const/16 v24, 0x0

    const/high16 v25, 0x40c00000    # 6.0f

    invoke-static/range {v25 .. v25}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v25

    invoke-virtual/range {v21 .. v25}, Lcom/vkontakte/android/ui/widget/ChatRecyclerView;->setPadding(IIII)V

    .line 1077
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->list:Lcom/vkontakte/android/ui/widget/ChatRecyclerView;

    move-object/from16 v21, v0

    const/16 v22, 0x0

    invoke-virtual/range {v21 .. v22}, Lcom/vkontakte/android/ui/widget/ChatRecyclerView;->setClipToPadding(Z)V

    .line 1078
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->list:Lcom/vkontakte/android/ui/widget/ChatRecyclerView;

    move-object/from16 v21, v0

    new-instance v22, Lcom/vkontakte/android/fragments/messages/ChatFragment$6;

    move-object/from16 v0, v22

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v4}, Lcom/vkontakte/android/fragments/messages/ChatFragment$6;-><init>(Lcom/vkontakte/android/fragments/messages/ChatFragment;Landroid/content/Context;)V

    invoke-virtual/range {v21 .. v22}, Lcom/vkontakte/android/ui/widget/ChatRecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    .line 1086
    new-instance v21, Lcom/vkontakte/android/ui/adapters/MessagesAdapter;

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/vkontakte/android/ui/adapters/MessagesAdapter;-><init>(Lcom/vkontakte/android/fragments/messages/ChatFragment;)V

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/vkontakte/android/fragments/messages/ChatFragment;->adapter:Lcom/vkontakte/android/ui/adapters/MessagesAdapter;

    .line 1087
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->adapter:Lcom/vkontakte/android/ui/adapters/MessagesAdapter;

    move-object/from16 v21, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->loadMoreView:Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;

    move-object/from16 v22, v0

    invoke-virtual/range {v21 .. v22}, Lcom/vkontakte/android/ui/adapters/MessagesAdapter;->setTopLoadingView(Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;)V

    .line 1088
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->adapter:Lcom/vkontakte/android/ui/adapters/MessagesAdapter;

    move-object/from16 v21, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->loadMoreViewBtm:Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;

    move-object/from16 v22, v0

    invoke-virtual/range {v21 .. v22}, Lcom/vkontakte/android/ui/adapters/MessagesAdapter;->setBottomLoadingView(Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;)V

    .line 1090
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->list:Lcom/vkontakte/android/ui/widget/ChatRecyclerView;

    move-object/from16 v21, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->adapter:Lcom/vkontakte/android/ui/adapters/MessagesAdapter;

    move-object/from16 v22, v0

    invoke-virtual/range {v21 .. v22}, Lcom/vkontakte/android/ui/widget/ChatRecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 1091
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->list:Lcom/vkontakte/android/ui/widget/ChatRecyclerView;

    move-object/from16 v21, v0

    const v22, 0x7f10018a

    invoke-virtual/range {v21 .. v22}, Lcom/vkontakte/android/ui/widget/ChatRecyclerView;->setId(I)V

    .line 1092
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->list:Lcom/vkontakte/android/ui/widget/ChatRecyclerView;

    move-object/from16 v21, v0

    new-instance v22, Landroid/graphics/drawable/ColorDrawable;

    const/16 v23, 0x0

    invoke-direct/range {v22 .. v23}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual/range {v21 .. v22}, Lcom/vkontakte/android/ui/widget/ChatRecyclerView;->setSelector(Landroid/graphics/drawable/Drawable;)V

    .line 1094
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->list:Lcom/vkontakte/android/ui/widget/ChatRecyclerView;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/vkontakte/android/ui/widget/ChatRecyclerView;->delegate:Lcom/vkontakte/android/ui/widget/VKRecyclerView$VKRecyclerViewDelegate;

    move-object/from16 v21, v0

    const/16 v22, 0x1

    invoke-virtual/range {v21 .. v22}, Lcom/vkontakte/android/ui/widget/VKRecyclerView$VKRecyclerViewDelegate;->setStackFromBottom(Z)V

    .line 1096
    new-instance v10, Landroid/widget/TextView;

    invoke-direct {v10, v4}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 1097
    .local v10, "emptyView":Landroid/widget/TextView;
    const v21, 0x7f080446

    move/from16 v0, v21

    invoke-virtual {v10, v0}, Landroid/widget/TextView;->setText(I)V

    .line 1098
    const/high16 v21, 0x41900000    # 18.0f

    move/from16 v0, v21

    invoke-virtual {v10, v0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 1099
    const/high16 v21, -0x80000000

    move/from16 v0, v21

    invoke-virtual {v10, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 1100
    const/16 v21, 0x11

    move/from16 v0, v21

    invoke-virtual {v10, v0}, Landroid/widget/TextView;->setGravity(I)V

    .line 1101
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->list:Lcom/vkontakte/android/ui/widget/ChatRecyclerView;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    invoke-virtual {v0, v10}, Lcom/vkontakte/android/ui/widget/ChatRecyclerView;->setEmptyView(Landroid/view/View;)V

    .line 1102
    new-instance v21, Lcom/vkontakte/android/ui/widget/MessagesTimesList;

    move-object/from16 v0, v21

    invoke-direct {v0, v4}, Lcom/vkontakte/android/ui/widget/MessagesTimesList;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/vkontakte/android/fragments/messages/ChatFragment;->listWrap:Lcom/vkontakte/android/ui/widget/MessagesTimesList;

    .line 1103
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->listWrap:Lcom/vkontakte/android/ui/widget/MessagesTimesList;

    move-object/from16 v21, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->list:Lcom/vkontakte/android/ui/widget/ChatRecyclerView;

    move-object/from16 v22, v0

    invoke-virtual/range {v21 .. v22}, Lcom/vkontakte/android/ui/widget/MessagesTimesList;->setList(Landroid/view/View;)V

    .line 1104
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->listWrap:Lcom/vkontakte/android/ui/widget/MessagesTimesList;

    move-object/from16 v21, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->list:Lcom/vkontakte/android/ui/widget/ChatRecyclerView;

    move-object/from16 v22, v0

    new-instance v23, Landroid/widget/FrameLayout$LayoutParams;

    const/16 v24, -0x1

    const/16 v25, -0x1

    const/16 v26, 0x11

    invoke-direct/range {v23 .. v26}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual/range {v21 .. v23}, Lcom/vkontakte/android/ui/widget/MessagesTimesList;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 1105
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->listWrap:Lcom/vkontakte/android/ui/widget/MessagesTimesList;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    invoke-virtual {v0, v10}, Lcom/vkontakte/android/ui/widget/MessagesTimesList;->addView(Landroid/view/View;)V

    .line 1106
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->listWrap:Lcom/vkontakte/android/ui/widget/MessagesTimesList;

    move-object/from16 v21, v0

    const/16 v22, 0x8

    invoke-virtual/range {v21 .. v22}, Lcom/vkontakte/android/ui/widget/MessagesTimesList;->setVisibility(I)V

    .line 1107
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->listWrap:Lcom/vkontakte/android/ui/widget/MessagesTimesList;

    move-object/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 1109
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getActivity()Landroid/app/Activity;

    move-result-object v21

    const v22, 0x7f030117

    const/16 v23, 0x0

    invoke-static/range {v21 .. v23}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v21

    check-cast v21, Lcom/vkontakte/android/ui/widget/MessageTimeAnchorView;

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/vkontakte/android/fragments/messages/ChatFragment;->timeAnchorPan:Lcom/vkontakte/android/ui/widget/MessageTimeAnchorView;

    .line 1110
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->timeAnchorPan:Lcom/vkontakte/android/ui/widget/MessageTimeAnchorView;

    move-object/from16 v21, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->list:Lcom/vkontakte/android/ui/widget/ChatRecyclerView;

    move-object/from16 v22, v0

    invoke-virtual/range {v21 .. v22}, Lcom/vkontakte/android/ui/widget/MessageTimeAnchorView;->setList(Lcom/vkontakte/android/ui/widget/VKRecyclerView;)V

    .line 1111
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->timeAnchorPan:Lcom/vkontakte/android/ui/widget/MessageTimeAnchorView;

    move-object/from16 v21, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->timeAnchorPan:Lcom/vkontakte/android/ui/widget/MessageTimeAnchorView;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Lcom/vkontakte/android/ui/widget/MessageTimeAnchorView;->createNeededLayoutParams()Landroid/widget/FrameLayout$LayoutParams;

    move-result-object v22

    invoke-virtual/range {v20 .. v22}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 1113
    new-instance v21, Landroid/widget/ProgressBar;

    move-object/from16 v0, v21

    invoke-direct {v0, v4}, Landroid/widget/ProgressBar;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/vkontakte/android/fragments/messages/ChatFragment;->progress:Landroid/widget/ProgressBar;

    .line 1114
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->progress:Landroid/widget/ProgressBar;

    move-object/from16 v21, v0

    new-instance v22, Landroid/widget/FrameLayout$LayoutParams;

    const/high16 v23, 0x42480000    # 50.0f

    invoke-static/range {v23 .. v23}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v23

    const/high16 v24, 0x42480000    # 50.0f

    invoke-static/range {v24 .. v24}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v24

    const/16 v25, 0x11

    invoke-direct/range {v22 .. v25}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual/range {v20 .. v22}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 1116
    new-instance v21, Lcom/vkontakte/android/ui/ErrorViewHelper;

    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getActivity()Landroid/app/Activity;

    move-result-object v22

    const v23, 0x7f030026

    const/16 v24, 0x0

    invoke-static/range {v22 .. v24}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v22

    invoke-direct/range {v21 .. v22}, Lcom/vkontakte/android/ui/ErrorViewHelper;-><init>(Landroid/view/View;)V

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/vkontakte/android/fragments/messages/ChatFragment;->errorView:Lcom/vkontakte/android/ui/ErrorViewHelper;

    .line 1117
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->errorView:Lcom/vkontakte/android/ui/ErrorViewHelper;

    move-object/from16 v21, v0

    const/16 v22, 0x8

    invoke-virtual/range {v21 .. v22}, Lcom/vkontakte/android/ui/ErrorViewHelper;->setVisibility(I)V

    .line 1118
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->errorView:Lcom/vkontakte/android/ui/ErrorViewHelper;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Lcom/vkontakte/android/ui/ErrorViewHelper;->getView()Landroid/view/View;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 1121
    new-instance v18, Landroid/view/View;

    move-object/from16 v0, v18

    invoke-direct {v0, v4}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 1122
    .local v18, "shadow":Landroid/view/View;
    new-instance v21, Landroid/widget/FrameLayout$LayoutParams;

    const/16 v22, -0x1

    const/high16 v23, 0x40800000    # 4.0f

    invoke-static/range {v23 .. v23}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v23

    const/16 v24, 0x50

    invoke-direct/range {v21 .. v24}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    move-object/from16 v0, v18

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 1123
    const v21, 0x7f0200d3

    move-object/from16 v0, v18

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 1124
    move-object/from16 v0, v20

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 1126
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getActivity()Landroid/app/Activity;

    move-result-object v21

    const v22, 0x7f030115

    const/16 v23, 0x0

    invoke-static/range {v21 .. v23}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v21

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/vkontakte/android/fragments/messages/ChatFragment;->jumpToEndBtn:Landroid/view/View;

    .line 1127
    new-instance v13, Landroid/widget/FrameLayout$LayoutParams;

    const/16 v21, -0x2

    const/16 v22, -0x2

    const v23, 0x800055

    move/from16 v0, v21

    move/from16 v1, v22

    move/from16 v2, v23

    invoke-direct {v13, v0, v1, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    .line 1129
    .local v13, "layoutParams":Landroid/widget/FrameLayout$LayoutParams;
    const/high16 v21, 0x40c00000    # 6.0f

    invoke-static/range {v21 .. v21}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v21

    const/high16 v22, 0x40000000    # 2.0f

    invoke-static/range {v22 .. v22}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v22

    const/high16 v23, 0x40c00000    # 6.0f

    invoke-static/range {v23 .. v23}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v23

    const/high16 v24, 0x40000000    # 2.0f

    invoke-static/range {v24 .. v24}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v24

    move/from16 v0, v21

    move/from16 v1, v22

    move/from16 v2, v23

    move/from16 v3, v24

    invoke-virtual {v13, v0, v1, v2, v3}, Landroid/widget/FrameLayout$LayoutParams;->setMargins(IIII)V

    .line 1130
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->jumpToEndBtn:Landroid/view/View;

    move-object/from16 v21, v0

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-virtual {v0, v1, v13}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 1131
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->jumpToEndBtn:Landroid/view/View;

    move-object/from16 v21, v0

    const/16 v22, 0x8

    invoke-virtual/range {v21 .. v22}, Landroid/view/View;->setVisibility(I)V

    .line 1132
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->jumpToEndBtn:Landroid/view/View;

    move-object/from16 v21, v0

    invoke-static/range {p0 .. p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment$$Lambda$8;->lambdaFactory$(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Landroid/view/View$OnClickListener;

    move-result-object v22

    invoke-virtual/range {v21 .. v22}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1134
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->loadMoreView:Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;

    move-object/from16 v21, v0

    invoke-static/range {p0 .. p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment$$Lambda$9;->lambdaFactory$(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Landroid/view/View$OnClickListener;

    move-result-object v22

    invoke-virtual/range {v21 .. v22}, Lcom/vkontakte/android/ui/holder/messages/LoadMoreHolder$LoaderMoreHolderData;->setOnClickListenerLoadMoreButton(Landroid/view/View$OnClickListener;)V

    .line 1142
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getAreMentionsEnabled()Z

    move-result v21

    if-eqz v21, :cond_3

    .line 1145
    new-instance v21, Landroid/support/design/widget/CoordinatorLayout;

    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getActivity()Landroid/app/Activity;

    move-result-object v22

    invoke-direct/range {v21 .. v22}, Landroid/support/design/widget/CoordinatorLayout;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/vkontakte/android/fragments/messages/ChatFragment;->coordinatorMentionWrap:Landroid/support/design/widget/CoordinatorLayout;

    .line 1147
    new-instance v7, Landroid/widget/FrameLayout$LayoutParams;

    const/16 v21, -0x1

    const/16 v22, -0x1

    move/from16 v0, v21

    move/from16 v1, v22

    invoke-direct {v7, v0, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 1150
    .local v7, "coordParams":Landroid/widget/FrameLayout$LayoutParams;
    const/16 v21, 0x0

    const/16 v22, 0x0

    const/16 v23, 0x0

    const/high16 v24, 0x3f000000    # 0.5f

    invoke-static/range {v24 .. v24}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v24

    move/from16 v0, v21

    move/from16 v1, v22

    move/from16 v2, v23

    move/from16 v3, v24

    invoke-virtual {v7, v0, v1, v2, v3}, Landroid/widget/FrameLayout$LayoutParams;->setMargins(IIII)V

    .line 1152
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->coordinatorMentionWrap:Landroid/support/design/widget/CoordinatorLayout;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    invoke-virtual {v0, v7}, Landroid/support/design/widget/CoordinatorLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 1154
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->coordinatorMentionWrap:Landroid/support/design/widget/CoordinatorLayout;

    move-object/from16 v21, v0

    const/16 v22, 0x8

    invoke-virtual/range {v21 .. v22}, Landroid/support/design/widget/CoordinatorLayout;->setVisibility(I)V

    .line 1156
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->writeBar:Lcom/vkontakte/android/ui/WriteBar;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/WriteBar;->setMentionSuggestionsSupplier(Lcom/vkontakte/android/ui/WriteBar$MentionSuggestionsSupplier;)Lcom/vkontakte/android/ui/MentionsManager;

    move-result-object v15

    .line 1158
    .local v15, "mentionsManager":Lcom/vkontakte/android/ui/MentionsManager;
    new-instance v21, Lme/grishka/appkit/views/UsableRecyclerView;

    move-object/from16 v0, v21

    invoke-direct {v0, v4}, Lme/grishka/appkit/views/UsableRecyclerView;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/vkontakte/android/fragments/messages/ChatFragment;->mentionsRecyclerView:Lme/grishka/appkit/views/UsableRecyclerView;

    .line 1160
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->mentionsRecyclerView:Lme/grishka/appkit/views/UsableRecyclerView;

    move-object/from16 v21, v0

    const/high16 v22, 0x40c00000    # 6.0f

    invoke-static/range {v22 .. v22}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v22

    move/from16 v0, v22

    int-to-float v0, v0

    move/from16 v22, v0

    invoke-static/range {v21 .. v22}, Landroid/support/v4/view/ViewCompat;->setElevation(Landroid/view/View;F)V

    .line 1162
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->mentionsRecyclerView:Lme/grishka/appkit/views/UsableRecyclerView;

    move-object/from16 v21, v0

    new-instance v22, Landroid/support/v7/widget/LinearLayoutManager;

    move-object/from16 v0, v22

    invoke-direct {v0, v4}, Landroid/support/v7/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    invoke-virtual/range {v21 .. v22}, Lme/grishka/appkit/views/UsableRecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    .line 1164
    new-instance v14, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;

    const/16 v21, -0x1

    const/16 v22, -0x2

    move/from16 v0, v21

    move/from16 v1, v22

    invoke-direct {v14, v0, v1}, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;-><init>(II)V

    .line 1167
    .local v14, "lp":Landroid/support/design/widget/CoordinatorLayout$LayoutParams;
    new-instance v21, Lcom/vk/attachpicker/widget/VkBottomSheetBehavior;

    invoke-direct/range {v21 .. v21}, Lcom/vk/attachpicker/widget/VkBottomSheetBehavior;-><init>()V

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/vkontakte/android/fragments/messages/ChatFragment;->bottomSheetBehavior:Lcom/vk/attachpicker/widget/VkBottomSheetBehavior;

    .line 1168
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->bottomSheetBehavior:Lcom/vk/attachpicker/widget/VkBottomSheetBehavior;

    move-object/from16 v21, v0

    new-instance v22, Lcom/vkontakte/android/fragments/messages/ChatFragment$7;

    move-object/from16 v0, v22

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/vkontakte/android/fragments/messages/ChatFragment$7;-><init>(Lcom/vkontakte/android/fragments/messages/ChatFragment;)V

    invoke-virtual/range {v21 .. v22}, Lcom/vk/attachpicker/widget/VkBottomSheetBehavior;->setBottomSheetCallback(Lcom/vk/attachpicker/widget/VkBottomSheetBehavior$BottomSheetCallback;)V

    .line 1186
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->bottomSheetBehavior:Lcom/vk/attachpicker/widget/VkBottomSheetBehavior;

    move-object/from16 v21, v0

    const/16 v22, 0x1

    invoke-virtual/range {v21 .. v22}, Lcom/vk/attachpicker/widget/VkBottomSheetBehavior;->setHideable(Z)V

    .line 1187
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->bottomSheetBehavior:Lcom/vk/attachpicker/widget/VkBottomSheetBehavior;

    move-object/from16 v21, v0

    const/16 v22, 0x4

    invoke-virtual/range {v21 .. v22}, Lcom/vk/attachpicker/widget/VkBottomSheetBehavior;->setState(I)V

    .line 1188
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->bottomSheetBehavior:Lcom/vk/attachpicker/widget/VkBottomSheetBehavior;

    move-object/from16 v21, v0

    const/high16 v22, 0x43200000    # 160.0f

    invoke-static/range {v22 .. v22}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v22

    invoke-virtual/range {v21 .. v22}, Lcom/vk/attachpicker/widget/VkBottomSheetBehavior;->setPeekHeight(I)V

    .line 1189
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->bottomSheetBehavior:Lcom/vk/attachpicker/widget/VkBottomSheetBehavior;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    invoke-virtual {v14, v0}, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->setBehavior(Landroid/support/design/widget/CoordinatorLayout$Behavior;)V

    .line 1191
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->mentionsRecyclerView:Lme/grishka/appkit/views/UsableRecyclerView;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    invoke-virtual {v0, v14}, Lme/grishka/appkit/views/UsableRecyclerView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 1193
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->mentionsRecyclerView:Lme/grishka/appkit/views/UsableRecyclerView;

    move-object/from16 v21, v0

    const/16 v22, -0x1

    invoke-virtual/range {v21 .. v22}, Lme/grishka/appkit/views/UsableRecyclerView;->setBackgroundColor(I)V

    .line 1195
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->mentionsRecyclerView:Lme/grishka/appkit/views/UsableRecyclerView;

    move-object/from16 v21, v0

    const/16 v22, 0x0

    const/high16 v23, 0x40c00000    # 6.0f

    invoke-static/range {v23 .. v23}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v23

    const/16 v24, 0x0

    const/16 v25, 0x0

    invoke-virtual/range {v21 .. v25}, Lme/grishka/appkit/views/UsableRecyclerView;->setPadding(IIII)V

    .line 1197
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->mentionsRecyclerView:Lme/grishka/appkit/views/UsableRecyclerView;

    move-object/from16 v21, v0

    const/16 v22, 0x0

    invoke-virtual/range {v21 .. v22}, Lme/grishka/appkit/views/UsableRecyclerView;->setClipToPadding(Z)V

    .line 1199
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->coordinatorMentionWrap:Landroid/support/design/widget/CoordinatorLayout;

    move-object/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 1201
    new-instance v21, Landroid/view/View;

    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getActivity()Landroid/app/Activity;

    move-result-object v22

    invoke-direct/range {v21 .. v22}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/vkontakte/android/fragments/messages/ChatFragment;->mentionsBottomDivider:Landroid/view/View;

    .line 1203
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->mentionsBottomDivider:Landroid/view/View;

    move-object/from16 v21, v0

    const v22, -0x1a1a1b

    invoke-virtual/range {v21 .. v22}, Landroid/view/View;->setBackgroundColor(I)V

    .line 1205
    new-instance v8, Landroid/widget/FrameLayout$LayoutParams;

    const/16 v21, -0x1

    const/high16 v22, 0x3f000000    # 0.5f

    .line 1206
    invoke-static/range {v22 .. v22}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v22

    const/16 v23, 0x50

    move/from16 v0, v21

    move/from16 v1, v22

    move/from16 v2, v23

    invoke-direct {v8, v0, v1, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    .line 1208
    .local v8, "dividerParams":Landroid/widget/FrameLayout$LayoutParams;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->mentionsBottomDivider:Landroid/view/View;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    invoke-virtual {v0, v8}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 1210
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->mentionsBottomDivider:Landroid/view/View;

    move-object/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 1212
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->coordinatorMentionWrap:Landroid/support/design/widget/CoordinatorLayout;

    move-object/from16 v21, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->mentionsRecyclerView:Lme/grishka/appkit/views/UsableRecyclerView;

    move-object/from16 v22, v0

    invoke-virtual/range {v21 .. v22}, Landroid/support/design/widget/CoordinatorLayout;->addView(Landroid/view/View;)V

    .line 1214
    new-instance v21, Lcom/vkontakte/android/ui/MentionsAdapter;

    move-object/from16 v0, v21

    invoke-direct {v0, v15}, Lcom/vkontakte/android/ui/MentionsAdapter;-><init>(Lcom/vkontakte/android/ui/MentionsManager;)V

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/vkontakte/android/fragments/messages/ChatFragment;->mentionsAdapter:Lcom/vkontakte/android/ui/MentionsAdapter;

    .line 1215
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->mentionsAdapter:Lcom/vkontakte/android/ui/MentionsAdapter;

    move-object/from16 v21, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->chatUsers:Landroid/util/SparseArray;

    move-object/from16 v22, v0

    invoke-virtual/range {v21 .. v22}, Lcom/vkontakte/android/ui/MentionsAdapter;->setUsers(Landroid/util/SparseArray;)V

    .line 1217
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->mentionsRecyclerView:Lme/grishka/appkit/views/UsableRecyclerView;

    move-object/from16 v21, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->mentionsAdapter:Lcom/vkontakte/android/ui/MentionsAdapter;

    move-object/from16 v22, v0

    invoke-virtual/range {v21 .. v22}, Lme/grishka/appkit/views/UsableRecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 1219
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->coordinatorMentionWrap:Landroid/support/design/widget/CoordinatorLayout;

    move-object/from16 v21, v0

    const/16 v22, 0x8

    invoke-virtual/range {v21 .. v22}, Landroid/support/design/widget/CoordinatorLayout;->setVisibility(I)V

    .line 1220
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->mentionsBottomDivider:Landroid/view/View;

    move-object/from16 v21, v0

    const/16 v22, 0x8

    invoke-virtual/range {v21 .. v22}, Landroid/view/View;->setVisibility(I)V

    .line 1223
    .end local v7    # "coordParams":Landroid/widget/FrameLayout$LayoutParams;
    .end local v8    # "dividerParams":Landroid/widget/FrameLayout$LayoutParams;
    .end local v14    # "lp":Landroid/support/design/widget/CoordinatorLayout$LayoutParams;
    .end local v15    # "mentionsManager":Lcom/vkontakte/android/ui/MentionsManager;
    :cond_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->list:Lcom/vkontakte/android/ui/widget/ChatRecyclerView;

    move-object/from16 v21, v0

    new-instance v22, Lcom/vkontakte/android/fragments/messages/ChatFragment$8;

    move-object/from16 v0, v22

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/vkontakte/android/fragments/messages/ChatFragment$8;-><init>(Lcom/vkontakte/android/fragments/messages/ChatFragment;)V

    invoke-virtual/range {v21 .. v22}, Lcom/vkontakte/android/ui/widget/ChatRecyclerView;->addOnScrollListener(Landroid/support/v7/widget/RecyclerView$OnScrollListener;)V

    .line 1279
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->writeBar:Lcom/vkontakte/android/ui/WriteBar;

    move-object/from16 v21, v0

    invoke-static/range {p0 .. p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment$$Lambda$10;->lambdaFactory$(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Landroid/view/View$OnClickListener;

    move-result-object v22

    invoke-virtual/range {v21 .. v22}, Lcom/vkontakte/android/ui/WriteBar;->setOnSendClickListener(Landroid/view/View$OnClickListener;)V

    .line 1280
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->writeBar:Lcom/vkontakte/android/ui/WriteBar;

    move-object/from16 v21, v0

    invoke-static/range {p0 .. p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment$$Lambda$11;->lambdaFactory$(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Lcom/vkontakte/android/ui/WriteBar$GraffitiSender;

    move-result-object v22

    invoke-virtual/range {v21 .. v22}, Lcom/vkontakte/android/ui/WriteBar;->setGraffitiSender(Lcom/vkontakte/android/ui/WriteBar$GraffitiSender;)V

    .line 1281
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->writeBar:Lcom/vkontakte/android/ui/WriteBar;

    move-object/from16 v21, v0

    const/16 v22, 0x1

    invoke-virtual/range {v21 .. v22}, Lcom/vkontakte/android/ui/WriteBar;->setGraffitiAllowed(Z)V

    .line 1283
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->writeBar:Lcom/vkontakte/android/ui/WriteBar;

    move-object/from16 v21, v0

    const v22, 0x7f1005c7

    invoke-virtual/range {v21 .. v22}, Lcom/vkontakte/android/ui/WriteBar;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Landroid/widget/EditText;

    .line 1284
    .local v9, "editInput":Landroid/widget/EditText;
    const/high16 v21, 0x10000000

    move/from16 v0, v21

    invoke-virtual {v9, v0}, Landroid/widget/EditText;->setImeOptions(I)V

    .line 1285
    invoke-static/range {p0 .. p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment$$Lambda$12;->lambdaFactory$(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Landroid/view/View$OnKeyListener;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v9, v0}, Landroid/widget/EditText;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    .line 1295
    new-instance v21, Lcom/vkontakte/android/fragments/messages/ChatFragment$9;

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/vkontakte/android/fragments/messages/ChatFragment$9;-><init>(Lcom/vkontakte/android/fragments/messages/ChatFragment;)V

    move-object/from16 v0, v21

    invoke-virtual {v9, v0}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 1312
    invoke-static/range {p0 .. p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment$$Lambda$13;->lambdaFactory$(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Landroid/view/View$OnKeyListener;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v9, v0}, Landroid/widget/EditText;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    .line 1323
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v21

    const-string/jumbo v22, "fwd"

    invoke-virtual/range {v21 .. v22}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v21

    if-eqz v21, :cond_4

    .line 1324
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v21

    const-string/jumbo v22, "fwd"

    invoke-virtual/range {v21 .. v22}, Landroid/os/Bundle;->getParcelableArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v11

    .line 1325
    .local v11, "fwd":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/Message;>;"
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->writeBar:Lcom/vkontakte/android/ui/WriteBar;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    invoke-virtual {v0, v11}, Lcom/vkontakte/android/ui/WriteBar;->addFwdMessages(Ljava/util/List;)V

    .line 1328
    .end local v11    # "fwd":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/Message;>;"
    :cond_4
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v21

    const-string/jumbo v22, "post"

    invoke-virtual/range {v21 .. v22}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v21

    if-eqz v21, :cond_6

    .line 1329
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v21

    const-string/jumbo v22, "post"

    invoke-virtual/range {v21 .. v22}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v16

    check-cast v16, Lcom/vkontakte/android/NewsEntry;

    .line 1330
    .local v16, "p":Lcom/vkontakte/android/NewsEntry;
    const/4 v6, 0x0

    .line 1331
    .local v6, "att":Lcom/vkontakte/android/attachments/Attachment;
    move-object/from16 v0, v16

    iget v0, v0, Lcom/vkontakte/android/NewsEntry;->type:I

    move/from16 v21, v0

    const/16 v22, 0xc

    move/from16 v0, v21

    move/from16 v1, v22

    if-ne v0, v1, :cond_b

    .line 1332
    new-instance v6, Lcom/vkontakte/android/attachments/PromoPostAttachment;

    .end local v6    # "att":Lcom/vkontakte/android/attachments/Attachment;
    move-object/from16 v0, v16

    invoke-direct {v6, v0}, Lcom/vkontakte/android/attachments/PromoPostAttachment;-><init>(Lcom/vkontakte/android/NewsEntry;)V

    .line 1338
    .restart local v6    # "att":Lcom/vkontakte/android/attachments/Attachment;
    :cond_5
    :goto_4
    if-eqz v6, :cond_6

    .line 1339
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->writeBar:Lcom/vkontakte/android/ui/WriteBar;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    invoke-virtual {v0, v6}, Lcom/vkontakte/android/ui/WriteBar;->addAttachment(Lcom/vkontakte/android/attachments/Attachment;)V

    .line 1343
    .end local v6    # "att":Lcom/vkontakte/android/attachments/Attachment;
    .end local v16    # "p":Lcom/vkontakte/android/NewsEntry;
    :cond_6
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v21

    const-string/jumbo v22, "photos"

    invoke-virtual/range {v21 .. v22}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v21

    if-eqz v21, :cond_d

    .line 1344
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v21

    const-string/jumbo v22, "photos"

    invoke-virtual/range {v21 .. v22}, Landroid/os/Bundle;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v21

    :goto_5
    invoke-interface/range {v21 .. v21}, Ljava/util/Iterator;->hasNext()Z

    move-result v22

    if-eqz v22, :cond_d

    invoke-interface/range {v21 .. v21}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Ljava/lang/String;

    .line 1345
    .local v17, "photo":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->writeBar:Lcom/vkontakte/android/ui/WriteBar;

    move-object/from16 v22, v0

    new-instance v23, Lcom/vkontakte/android/attachments/PendingPhotoAttachment;

    move-object/from16 v0, v23

    move-object/from16 v1, v17

    invoke-direct {v0, v1}, Lcom/vkontakte/android/attachments/PendingPhotoAttachment;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {v22 .. v23}, Lcom/vkontakte/android/ui/WriteBar;->addAttachment(Lcom/vkontakte/android/attachments/Attachment;)V

    goto :goto_5

    .line 982
    .end local v9    # "editInput":Landroid/widget/EditText;
    .end local v10    # "emptyView":Landroid/widget/TextView;
    .end local v12    # "gestureDetector":Landroid/view/GestureDetector;
    .end local v13    # "layoutParams":Landroid/widget/FrameLayout$LayoutParams;
    .end local v17    # "photo":Ljava/lang/String;
    .end local v18    # "shadow":Landroid/view/View;
    :cond_7
    const/16 v21, 0x0

    goto/16 :goto_0

    .line 996
    .restart local v5    # "arr":[Ljava/lang/String;
    :cond_8
    const-string/jumbo v21, ""

    goto/16 :goto_1

    .line 1005
    .end local v5    # "arr":[Ljava/lang/String;
    :cond_9
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->writeBar:Lcom/vkontakte/android/ui/WriteBar;

    move-object/from16 v21, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->chatUsers:Landroid/util/SparseArray;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    move-object/from16 v1, v21

    iput-object v0, v1, Lcom/vkontakte/android/ui/WriteBar;->giftUsers:Landroid/util/SparseArray;

    goto/16 :goto_2

    .line 1010
    :cond_a
    const/16 v21, 0x0

    goto/16 :goto_3

    .line 1333
    .restart local v6    # "att":Lcom/vkontakte/android/attachments/Attachment;
    .restart local v9    # "editInput":Landroid/widget/EditText;
    .restart local v10    # "emptyView":Landroid/widget/TextView;
    .restart local v12    # "gestureDetector":Landroid/view/GestureDetector;
    .restart local v13    # "layoutParams":Landroid/widget/FrameLayout$LayoutParams;
    .restart local v16    # "p":Lcom/vkontakte/android/NewsEntry;
    .restart local v18    # "shadow":Landroid/view/View;
    :cond_b
    move-object/from16 v0, v16

    iget v0, v0, Lcom/vkontakte/android/NewsEntry;->type:I

    move/from16 v21, v0

    if-nez v21, :cond_c

    .line 1334
    new-instance v6, Lcom/vkontakte/android/attachments/PostAttachment;

    .end local v6    # "att":Lcom/vkontakte/android/attachments/Attachment;
    move-object/from16 v0, v16

    invoke-direct {v6, v0}, Lcom/vkontakte/android/attachments/PostAttachment;-><init>(Lcom/vkontakte/android/NewsEntry;)V

    .restart local v6    # "att":Lcom/vkontakte/android/attachments/Attachment;
    goto :goto_4

    .line 1335
    :cond_c
    move-object/from16 v0, v16

    iget-object v0, v0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Ljava/util/ArrayList;->size()I

    move-result v21

    if-lez v21, :cond_5

    .line 1336
    move-object/from16 v0, v16

    iget-object v0, v0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    move-object/from16 v21, v0

    const/16 v22, 0x0

    invoke-virtual/range {v21 .. v22}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    .end local v6    # "att":Lcom/vkontakte/android/attachments/Attachment;
    check-cast v6, Lcom/vkontakte/android/attachments/Attachment;

    .restart local v6    # "att":Lcom/vkontakte/android/attachments/Attachment;
    goto/16 :goto_4

    .line 1349
    .end local v6    # "att":Lcom/vkontakte/android/attachments/Attachment;
    .end local v16    # "p":Lcom/vkontakte/android/NewsEntry;
    :cond_d
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v21

    const-string/jumbo v22, "text"

    invoke-virtual/range {v21 .. v22}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v21

    if-eqz v21, :cond_e

    .line 1350
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->writeBar:Lcom/vkontakte/android/ui/WriteBar;

    move-object/from16 v21, v0

    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v22

    const-string/jumbo v23, "text"

    invoke-virtual/range {v22 .. v23}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v22

    invoke-virtual/range {v21 .. v22}, Lcom/vkontakte/android/ui/WriteBar;->setText(Ljava/lang/CharSequence;)V

    .line 1353
    :cond_e
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v21

    const-string/jumbo v22, "attachments"

    invoke-virtual/range {v21 .. v22}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v21

    if-eqz v21, :cond_f

    .line 1354
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v21

    const-string/jumbo v22, "attachments"

    invoke-virtual/range {v21 .. v22}, Landroid/os/Bundle;->getParcelableArray(Ljava/lang/String;)[Landroid/os/Parcelable;

    move-result-object v22

    move-object/from16 v0, v22

    array-length v0, v0

    move/from16 v23, v0

    const/16 v21, 0x0

    :goto_6
    move/from16 v0, v21

    move/from16 v1, v23

    if-ge v0, v1, :cond_f

    aget-object v6, v22, v21

    .line 1355
    .local v6, "att":Landroid/os/Parcelable;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->writeBar:Lcom/vkontakte/android/ui/WriteBar;

    move-object/from16 v24, v0

    check-cast v6, Lcom/vkontakte/android/attachments/Attachment;

    .end local v6    # "att":Landroid/os/Parcelable;
    move-object/from16 v0, v24

    invoke-virtual {v0, v6}, Lcom/vkontakte/android/ui/WriteBar;->addAttachment(Lcom/vkontakte/android/attachments/Attachment;)V

    .line 1354
    add-int/lit8 v21, v21, 0x1

    goto :goto_6

    .line 1359
    :cond_f
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->errorView:Lcom/vkontakte/android/ui/ErrorViewHelper;

    move-object/from16 v21, v0

    invoke-static/range {p0 .. p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment$$Lambda$14;->lambdaFactory$(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Landroid/view/View$OnClickListener;

    move-result-object v22

    invoke-virtual/range {v21 .. v22}, Lcom/vkontakte/android/ui/ErrorViewHelper;->setOnRetryListener(Landroid/view/View$OnClickListener;)V

    .line 1365
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->group:Lcom/vkontakte/android/api/Group;

    move-object/from16 v21, v0

    if-eqz v21, :cond_10

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->group:Lcom/vkontakte/android/api/Group;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    iget-boolean v0, v0, Lcom/vkontakte/android/api/Group;->canMessage:Z

    move/from16 v21, v0

    if-nez v21, :cond_10

    const-wide v22, -0x3e22329b00000000L    # -2.0E9

    move-object/from16 v0, p0

    iget v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->peer:I

    move/from16 v21, v0

    move/from16 v0, v21

    int-to-double v0, v0

    move-wide/from16 v24, v0

    cmpg-double v21, v22, v24

    if-gez v21, :cond_10

    move-object/from16 v0, p0

    iget v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->peer:I

    move/from16 v21, v0

    if-gez v21, :cond_10

    .line 1366
    const/16 v21, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v21

    invoke-direct {v0, v1}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->setEnableWriteBarIfDoesNotHaveSpecialMarketAttachment(Z)V

    .line 1369
    :cond_10
    const/16 v21, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v21

    invoke-direct {v0, v1}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->loadData(Z)V

    .line 1370
    sget-object v21, Lcom/vkontakte/android/Global;->longPoll:Lcom/vkontakte/android/LongPollService;

    if-eqz v21, :cond_11

    .line 1371
    sget-object v21, Lcom/vkontakte/android/Global;->longPoll:Lcom/vkontakte/android/LongPollService;

    move-object/from16 v0, p0

    iget v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->peer:I

    move/from16 v22, v0

    invoke-virtual/range {v21 .. v22}, Lcom/vkontakte/android/LongPollService;->getTypings(I)Ljava/util/List;

    move-result-object v19

    .line 1372
    .local v19, "typings":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    invoke-interface/range {v19 .. v19}, Ljava/util/List;->size()I

    move-result v21

    if-lez v21, :cond_11

    .line 1373
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->typingUsers:Ljava/util/ArrayList;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 1374
    invoke-direct/range {p0 .. p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->updateTyping()V

    .line 1378
    .end local v19    # "typings":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    :cond_11
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->contentView:Landroid/widget/LinearLayout;

    move-object/from16 v21, v0

    return-object v21
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V
    .locals 8
    .param p1, "menu"    # Landroid/view/Menu;
    .param p2, "inflater"    # Landroid/view/MenuInflater;

    .prologue
    const v7, 0x77359400

    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 1849
    iget v5, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->peer:I

    if-ge v5, v7, :cond_6

    iget v5, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->peer:I

    const v6, -0x77359400

    if-lt v5, v6, :cond_6

    .line 1850
    const v5, 0x7f110005

    invoke-virtual {p2, v5, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 1854
    :cond_0
    :goto_0
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getActivity()Landroid/app/Activity;

    move-result-object v5

    iget v6, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->peer:I

    invoke-static {v5, v6}, Lcom/vkontakte/android/NotificationUtils;->arePeerNotificationsEnabled(Landroid/content/Context;I)Z

    move-result v1

    .line 1855
    .local v1, "isEnabled":Z
    iget-object v5, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->group:Lcom/vkontakte/android/api/Group;

    if-eqz v5, :cond_7

    iget-object v5, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->group:Lcom/vkontakte/android/api/Group;

    iget-boolean v5, v5, Lcom/vkontakte/android/api/Group;->messagesBlocked:Z

    if-eqz v5, :cond_7

    move v0, v3

    .line 1857
    .local v0, "isDenyMessages":Z
    :goto_1
    const v5, 0x7f1005e0

    invoke-interface {p1, v5}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v2

    .local v2, "menuItemTmp":Landroid/view/MenuItem;
    if-eqz v2, :cond_1

    .line 1858
    invoke-interface {v2, v1}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 1860
    :cond_1
    const v5, 0x7f1005e1

    invoke-interface {p1, v5}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v2

    if-eqz v2, :cond_2

    .line 1861
    if-nez v1, :cond_8

    move v5, v3

    :goto_2
    invoke-interface {v2, v5}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 1863
    :cond_2
    const v5, 0x7f1005e4

    invoke-interface {p1, v5}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v2

    if-eqz v2, :cond_3

    .line 1864
    iget-object v5, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->subtitle:Ljava/lang/CharSequence;

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_9

    const v5, 0x7f0805d7

    :goto_3
    invoke-interface {v2, v5}, Landroid/view/MenuItem;->setTitle(I)Landroid/view/MenuItem;

    .line 1866
    :cond_3
    const v5, 0x7f1005eb

    invoke-interface {p1, v5}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v2

    if-eqz v2, :cond_4

    .line 1867
    if-nez v0, :cond_a

    iget-object v5, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->group:Lcom/vkontakte/android/api/Group;

    if-eqz v5, :cond_a

    move v5, v3

    :goto_4
    invoke-interface {v2, v5}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 1869
    :cond_4
    const v5, 0x7f1005ea

    invoke-interface {p1, v5}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v2

    if-eqz v2, :cond_5

    .line 1870
    if-eqz v0, :cond_b

    iget-object v5, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->group:Lcom/vkontakte/android/api/Group;

    if-eqz v5, :cond_b

    :goto_5
    invoke-interface {v2, v3}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 1872
    :cond_5
    return-void

    .line 1851
    .end local v0    # "isDenyMessages":Z
    .end local v1    # "isEnabled":Z
    .end local v2    # "menuItemTmp":Landroid/view/MenuItem;
    :cond_6
    iget v5, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->peer:I

    if-lt v5, v7, :cond_0

    .line 1852
    const v5, 0x7f110002

    invoke-virtual {p2, v5, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    goto :goto_0

    .restart local v1    # "isEnabled":Z
    :cond_7
    move v0, v4

    .line 1855
    goto :goto_1

    .restart local v0    # "isDenyMessages":Z
    .restart local v2    # "menuItemTmp":Landroid/view/MenuItem;
    :cond_8
    move v5, v4

    .line 1861
    goto :goto_2

    .line 1864
    :cond_9
    const v5, 0x7f08012f

    goto :goto_3

    :cond_a
    move v5, v4

    .line 1867
    goto :goto_4

    :cond_b
    move v3, v4

    .line 1870
    goto :goto_5
.end method

.method public onDestroy()V
    .locals 3

    .prologue
    .line 1449
    invoke-super {p0}, Lcom/vkontakte/android/fragments/VKToolbarFragment;->onDestroy()V

    .line 1451
    :try_start_0
    sget-object v1, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->receiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v1, v2}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1455
    :goto_0
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 1456
    .local v0, "activity":Landroid/app/Activity;
    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/vkontakte/android/AudioMessagePlayerService;

    invoke-direct {v1, v0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v0, v1}, Landroid/app/Activity;->stopService(Landroid/content/Intent;)Z

    .line 1457
    return-void

    .line 1452
    .end local v0    # "activity":Landroid/app/Activity;
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method public onDestroyView()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 905
    invoke-super {p0}, Lcom/vkontakte/android/fragments/VKToolbarFragment;->onDestroyView()V

    .line 906
    iput-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->contentView:Landroid/widget/LinearLayout;

    .line 907
    iput-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->writeBar:Lcom/vkontakte/android/ui/WriteBar;

    .line 908
    iput-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->list:Lcom/vkontakte/android/ui/widget/ChatRecyclerView;

    .line 909
    iput-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->progress:Landroid/widget/ProgressBar;

    .line 910
    iput-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->errorView:Lcom/vkontakte/android/ui/ErrorViewHelper;

    .line 911
    iput-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->actionMode:Landroid/view/ActionMode;

    .line 912
    iput-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->listWrap:Lcom/vkontakte/android/ui/widget/MessagesTimesList;

    .line 913
    iput-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->jumpToEndBtn:Landroid/view/View;

    .line 914
    iput-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->mStickersView:Lcom/vkontakte/android/stickers/StickersView;

    .line 915
    iput-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->mKeyboardPopup:Lcom/vkontakte/android/stickers/KeyboardPopup;

    .line 916
    iput-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->timeAnchorPan:Lcom/vkontakte/android/ui/widget/MessageTimeAnchorView;

    .line 917
    const/4 v0, 0x0

    iput v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->lastTime:I

    .line 918
    return-void
.end method

.method public onEmojiSelected(Ljava/lang/String;)V
    .locals 4
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 189
    iget-object v2, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->contentView:Landroid/widget/LinearLayout;

    const v3, 0x7f1005c7

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    .line 190
    .local v0, "edit":Landroid/widget/EditText;
    invoke-virtual {v0}, Landroid/widget/EditText;->getSelectionEnd()I

    move-result v1

    .line 191
    .local v1, "pos":I
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-interface {v2, v1, p1}, Landroid/text/Editable;->insert(ILjava/lang/CharSequence;)Landroid/text/Editable;

    .line 192
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    add-int/2addr v1, v2

    .line 193
    invoke-virtual {v0, v1, v1}, Landroid/widget/EditText;->setSelection(II)V

    .line 194
    return-void
.end method

.method public onHomePressed()Z
    .locals 4

    .prologue
    .line 2816
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->isTaskRoot()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 2817
    new-instance v1, Lcom/vkontakte/android/navigation/Navigator;

    const-class v2, Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    const-class v3, Lcom/vkontakte/android/MainActivity;

    invoke-direct {v1, v2, v3}, Lcom/vkontakte/android/navigation/Navigator;-><init>(Ljava/lang/Class;Ljava/lang/Class;)V

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/navigation/Navigator;->intent(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v0

    .line 2818
    .local v0, "intent":Landroid/content/Intent;
    const/high16 v1, 0x4000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 2819
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 2820
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->finish()V

    .line 2821
    const/4 v1, 0x1

    .line 2823
    .end local v0    # "intent":Landroid/content/Intent;
    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public onItemClick(Lcom/vkontakte/android/ui/holder/messages/MessageListItem;)V
    .locals 12
    .param p1, "listItem"    # Lcom/vkontakte/android/ui/holder/messages/MessageListItem;

    .prologue
    const/4 v8, 0x0

    const/4 v7, 0x1

    .line 2525
    const/4 v4, 0x0

    .line 2526
    .local v4, "msg":Lcom/vkontakte/android/Message;
    iget v3, p1, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->msgId:I

    .line 2527
    .local v3, "mid":I
    iget-object v6, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->messages:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_1

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/Message;

    .line 2528
    .local v1, "m":Lcom/vkontakte/android/Message;
    iget v9, v1, Lcom/vkontakte/android/Message;->id:I

    if-ne v9, v3, :cond_0

    .line 2529
    move-object v4, v1

    .line 2533
    .end local v1    # "m":Lcom/vkontakte/android/Message;
    :cond_1
    if-nez v4, :cond_2

    .line 2566
    :goto_0
    return-void

    .line 2536
    :cond_2
    iget-object v6, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->actionMode:Landroid/view/ActionMode;

    if-eqz v6, :cond_7

    .line 2537
    iget-object v6, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->selectedMessages:Ljava/util/ArrayList;

    invoke-virtual {v6, v4}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 2538
    iget-object v6, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->selectedMessages:Ljava/util/ArrayList;

    invoke-virtual {v6, v4}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 2542
    :goto_1
    iget-object v6, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->actionMode:Landroid/view/ActionMode;

    const v9, 0x7f0805f6

    new-array v10, v7, [Ljava/lang/Object;

    iget-object v11, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->selectedMessages:Ljava/util/ArrayList;

    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v11

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v10, v8

    invoke-virtual {p0, v9, v10}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v6, v9}, Landroid/view/ActionMode;->setTitle(Ljava/lang/CharSequence;)V

    .line 2543
    iget-object v6, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->adapter:Lcom/vkontakte/android/ui/adapters/MessagesAdapter;

    invoke-virtual {v6}, Lcom/vkontakte/android/ui/adapters/MessagesAdapter;->notifyDataSetChanged()V

    .line 2544
    iget-object v6, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->selectedMessages:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-nez v6, :cond_4

    .line 2545
    iget-object v6, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->actionMode:Landroid/view/ActionMode;

    invoke-virtual {v6}, Landroid/view/ActionMode;->finish()V

    goto :goto_0

    .line 2540
    :cond_3
    iget-object v6, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->selectedMessages:Ljava/util/ArrayList;

    invoke-virtual {v6, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 2548
    :cond_4
    iget-object v6, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->actionMode:Landroid/view/ActionMode;

    invoke-virtual {v6}, Landroid/view/ActionMode;->getMenu()Landroid/view/Menu;

    move-result-object v6

    const v9, 0x7f1005e7

    invoke-interface {v6, v9}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v9

    iget-object v6, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->selectedMessages:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-ne v6, v7, :cond_5

    move v6, v7

    :goto_2
    invoke-interface {v9, v6}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 2549
    iget-object v6, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->actionMode:Landroid/view/ActionMode;

    invoke-virtual {v6}, Landroid/view/ActionMode;->getMenu()Landroid/view/Menu;

    move-result-object v6

    const v9, 0x7f1005e5

    invoke-interface {v6, v9}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v6

    iget-object v9, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->selectedMessages:Ljava/util/ArrayList;

    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v9

    if-le v9, v7, :cond_6

    :goto_3
    invoke-interface {v6, v7}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    goto :goto_0

    :cond_5
    move v6, v8

    .line 2548
    goto :goto_2

    :cond_6
    move v7, v8

    .line 2549
    goto :goto_3

    .line 2551
    :cond_7
    move-object v2, v4

    .line 2552
    .local v2, "message":Lcom/vkontakte/android/Message;
    invoke-direct {p0, v2}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getMessageBrokenAttachment(Lcom/vkontakte/android/Message;)Lcom/vkontakte/android/attachments/Attachment;

    move-result-object v0

    .line 2553
    .local v0, "brokenAttach":Lcom/vkontakte/android/attachments/Attachment;
    if-nez v0, :cond_8

    .line 2554
    invoke-direct {p0, v2}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->showMessageOptions(Lcom/vkontakte/android/Message;)V

    goto/16 :goto_0

    .line 2556
    :cond_8
    instance-of v6, v0, Lcom/vkontakte/android/attachments/PendingAudioMessageAttachment;

    if-eqz v6, :cond_9

    const v5, 0x7f0801a1

    .line 2559
    .local v5, "titleResId":I
    :goto_4
    new-instance v6, Lcom/vkontakte/android/VKAlertDialog$Builder;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getContext()Landroid/content/Context;

    move-result-object v7

    invoke-direct {v6, v7}, Lcom/vkontakte/android/VKAlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v7, 0x7f08035b

    invoke-virtual {v6, v7}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v6

    .line 2560
    invoke-virtual {v6, v5}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v6

    const v7, 0x7f08011f

    const/4 v8, 0x0

    .line 2561
    invoke-virtual {v6, v7, v8}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v6

    const v7, 0x7f0801a6

    invoke-static {p0, v2}, Lcom/vkontakte/android/fragments/messages/ChatFragment$$Lambda$19;->lambdaFactory$(Lcom/vkontakte/android/fragments/messages/ChatFragment;Lcom/vkontakte/android/Message;)Landroid/content/DialogInterface$OnClickListener;

    move-result-object v8

    .line 2562
    invoke-virtual {v6, v7, v8}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v6

    .line 2563
    invoke-virtual {v6}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto/16 :goto_0

    .line 2556
    .end local v5    # "titleResId":I
    :cond_9
    const v5, 0x7f0801a7

    goto :goto_4
.end method

.method public onItemLongClick(Lcom/vkontakte/android/ui/holder/messages/MessageListItem;)Z
    .locals 9
    .param p1, "listItem"    # Lcom/vkontakte/android/ui/holder/messages/MessageListItem;

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 2499
    iget-object v5, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->actionMode:Landroid/view/ActionMode;

    if-eqz v5, :cond_1

    .line 2521
    :cond_0
    :goto_0
    return v3

    .line 2502
    :cond_1
    const/4 v2, 0x0

    .line 2503
    .local v2, "msg":Lcom/vkontakte/android/Message;
    iget v1, p1, Lcom/vkontakte/android/ui/holder/messages/MessageListItem;->msgId:I

    .line 2504
    .local v1, "mid":I
    iget-object v5, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->messages:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_2
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_3

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/Message;

    .line 2505
    .local v0, "m":Lcom/vkontakte/android/Message;
    iget v6, v0, Lcom/vkontakte/android/Message;->id:I

    if-ne v6, v1, :cond_2

    .line 2506
    move-object v2, v0

    .line 2510
    .end local v0    # "m":Lcom/vkontakte/android/Message;
    :cond_3
    if-eqz v2, :cond_0

    .line 2513
    iget-boolean v5, v2, Lcom/vkontakte/android/Message;->isServiceMessage:Z

    if-nez v5, :cond_0

    .line 2517
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getToolbar()Landroid/support/v7/widget/Toolbar;

    move-result-object v5

    iget-object v6, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->actionModeCallback:Landroid/view/ActionMode$Callback;

    invoke-virtual {v5, v6}, Landroid/support/v7/widget/Toolbar;->startActionMode(Landroid/view/ActionMode$Callback;)Landroid/view/ActionMode;

    move-result-object v5

    iput-object v5, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->actionMode:Landroid/view/ActionMode;

    .line 2518
    iget-object v5, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->selectedMessages:Ljava/util/ArrayList;

    invoke-virtual {v5, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2519
    iget-object v5, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->actionMode:Landroid/view/ActionMode;

    const v6, 0x7f0805f6

    new-array v7, v4, [Ljava/lang/Object;

    iget-object v8, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->selectedMessages:Ljava/util/ArrayList;

    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v7, v3

    invoke-virtual {p0, v6, v7}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v5, v3}, Landroid/view/ActionMode;->setTitle(Ljava/lang/CharSequence;)V

    .line 2520
    iget-object v3, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->adapter:Lcom/vkontakte/android/ui/adapters/MessagesAdapter;

    invoke-virtual {v3}, Lcom/vkontakte/android/ui/adapters/MessagesAdapter;->notifyDataSetChanged()V

    move v3, v4

    .line 2521
    goto :goto_0
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 7
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    const v4, 0x77359400

    const/4 v6, 0x0

    .line 1876
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v2

    packed-switch v2, :pswitch_data_0

    .line 1934
    :cond_0
    :goto_0
    :pswitch_0
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/VKToolbarFragment;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v2

    return v2

    .line 1878
    :pswitch_1
    new-instance v2, Lcom/vkontakte/android/fragments/messages/ChatAttachmentHistoryFragment$Builder;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getPeerID()I

    move-result v3

    invoke-direct {v2, v3}, Lcom/vkontakte/android/fragments/messages/ChatAttachmentHistoryFragment$Builder;-><init>(I)V

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/fragments/messages/ChatAttachmentHistoryFragment$Builder;->go(Landroid/content/Context;)Z

    goto :goto_0

    .line 1882
    :pswitch_2
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    iget v4, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->peer:I

    .line 1883
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    iget v5, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->peer:I

    invoke-static {v2, v5}, Lcom/vkontakte/android/NotificationUtils;->arePeerNotificationsEnabled(Landroid/content/Context;I)Z

    move-result v2

    if-nez v2, :cond_1

    const/4 v2, 0x1

    .line 1882
    :goto_1
    invoke-static {v3, v4, v2}, Lcom/vkontakte/android/NotificationUtils;->setEnableDialogNotification(Landroid/content/Context;IZ)V

    .line 1884
    iget-object v2, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->titleWithoutIcon:Ljava/lang/CharSequence;

    invoke-virtual {p0, v2}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->setTitle(Ljava/lang/CharSequence;)V

    .line 1885
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->invalidateOptionsMenu()V

    goto :goto_0

    .line 1883
    :cond_1
    const/4 v2, 0x0

    goto :goto_1

    .line 1888
    :pswitch_3
    iget-object v2, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->showChatInfoClickListener:Landroid/view/View$OnClickListener;

    invoke-interface {v2, v6}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    goto :goto_0

    .line 1891
    :pswitch_4
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    iget v3, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->peer:I

    invoke-static {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment$$Lambda$16;->lambdaFactory$(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Lcom/vkontakte/android/functions/VoidF2;

    move-result-object v4

    invoke-static {v2, v3, v6, v4}, Lcom/vkontakte/android/utils/ApiMethodsHelper;->clearHistory(Landroid/content/Context;ILjava/lang/Object;Lcom/vkontakte/android/functions/VoidF2;)V

    goto :goto_0

    .line 1897
    :pswitch_5
    iget-object v2, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->subtitle:Ljava/lang/CharSequence;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 1898
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    iget v3, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->peer:I

    sub-int/2addr v3, v4

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v4

    invoke-virtual {v4}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v4

    new-instance v5, Lcom/vkontakte/android/fragments/messages/ChatFragment$13;

    invoke-direct {v5, p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment$13;-><init>(Lcom/vkontakte/android/fragments/messages/ChatFragment;)V

    invoke-static {v2, v3, v6, v4, v5}, Lcom/vkontakte/android/utils/ApiMethodsHelper;->addUserToChat(Landroid/content/Context;ILcom/vkontakte/android/UserProfile;ILcom/vkontakte/android/api/Callback;)V

    goto :goto_0

    .line 1905
    :cond_2
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    iget v3, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->peer:I

    sub-int/2addr v3, v4

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v4

    invoke-virtual {v4}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v4

    invoke-static {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment$$Lambda$17;->lambdaFactory$(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Lcom/vkontakte/android/functions/VoidF1;

    move-result-object v5

    invoke-static {v2, v3, v4, v5}, Lcom/vkontakte/android/utils/ApiMethodsHelper;->removeUserFromChat(Landroid/content/Context;IILcom/vkontakte/android/functions/VoidF1;)V

    goto/16 :goto_0

    .line 1914
    :pswitch_6
    iget-object v2, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->group:Lcom/vkontakte/android/api/Group;

    if-eqz v2, :cond_0

    .line 1915
    iget-object v2, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->group:Lcom/vkontakte/android/api/Group;

    iget-boolean v1, v2, Lcom/vkontakte/android/api/Group;->messagesBlocked:Z

    .line 1916
    .local v1, "isBlocked":Z
    new-instance v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$14;

    invoke-direct {v0, p0, v1}, Lcom/vkontakte/android/fragments/messages/ChatFragment$14;-><init>(Lcom/vkontakte/android/fragments/messages/ChatFragment;Z)V

    .line 1924
    .local v0, "callback":Lcom/vkontakte/android/api/SimpleCallback;, "Lcom/vkontakte/android/api/SimpleCallback<Ljava/lang/Boolean;>;"
    if-eqz v1, :cond_3

    .line 1925
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getContext()Landroid/content/Context;

    move-result-object v2

    iget-object v3, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->group:Lcom/vkontakte/android/api/Group;

    iget v3, v3, Lcom/vkontakte/android/api/Group;->id:I

    invoke-static {v2, v3, v0}, Lcom/vkontakte/android/utils/ApiMethodsHelper;->allowMessagesFromGroup(Landroid/content/Context;ILcom/vkontakte/android/api/Callback;)V

    goto/16 :goto_0

    .line 1927
    :cond_3
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getContext()Landroid/content/Context;

    move-result-object v2

    iget-object v3, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->group:Lcom/vkontakte/android/api/Group;

    iget v3, v3, Lcom/vkontakte/android/api/Group;->id:I

    invoke-static {v2, v3, v0}, Lcom/vkontakte/android/utils/ApiMethodsHelper;->denyMessagesFromGroup(Landroid/content/Context;ILcom/vkontakte/android/api/Callback;)V

    goto/16 :goto_0

    .line 1876
    nop

    :pswitch_data_0
    .packed-switch 0x7f1005df
        :pswitch_1
        :pswitch_2
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_6
        :pswitch_6
    .end packed-switch
.end method

.method public onPause()V
    .locals 2

    .prologue
    .line 1461
    invoke-super {p0}, Lcom/vkontakte/android/fragments/VKToolbarFragment;->onPause()V

    .line 1462
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->isActive:Z

    .line 1463
    const/4 v0, 0x0

    sput-object v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->activeInstance:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    .line 1464
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->writeBar:Lcom/vkontakte/android/ui/WriteBar;

    if-eqz v0, :cond_0

    .line 1465
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->writeBar:Lcom/vkontakte/android/ui/WriteBar;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/WriteBar;->onPause(Landroid/app/Activity;)V

    .line 1467
    :cond_0
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->saveDraft()V

    .line 1468
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->hideSearchedBgRunnable:Ljava/lang/Runnable;

    invoke-static {v0}, Lcom/vkontakte/android/ViewUtils;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 1469
    return-void
.end method

.method public onPrepareOptionsMenu(Landroid/view/Menu;)V
    .locals 2
    .param p1, "menu"    # Landroid/view/Menu;

    .prologue
    .line 1840
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/VKToolbarFragment;->onPrepareOptionsMenu(Landroid/view/Menu;)V

    .line 1842
    const v1, 0x7f1005e4

    invoke-interface {p1, v1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    .local v0, "menuItemTmp":Landroid/view/MenuItem;
    if-eqz v0, :cond_0

    .line 1843
    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->subtitle:Ljava/lang/CharSequence;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    const v1, 0x7f0805d7

    :goto_0
    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setTitle(I)Landroid/view/MenuItem;

    .line 1845
    :cond_0
    return-void

    .line 1843
    :cond_1
    const v1, 0x7f08012f

    goto :goto_0
.end method

.method public onResume()V
    .locals 4

    .prologue
    const v3, 0x77359400

    const/4 v0, 0x1

    const/4 v2, 0x0

    .line 1473
    invoke-super {p0}, Lcom/vkontakte/android/fragments/VKToolbarFragment;->onResume()V

    .line 1474
    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->isActive:Z

    .line 1475
    sput-object p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->activeInstance:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    .line 1476
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->markAsRead()V

    .line 1477
    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->restoringDraft:Z

    .line 1478
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->restoreDraft()V

    .line 1479
    iput-boolean v2, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->restoringDraft:Z

    .line 1480
    iget v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->peer:I

    if-ge v0, v3, :cond_4

    iget v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->peer:I

    if-lez v0, :cond_4

    .line 1481
    iget v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->peer:I

    invoke-static {v0}, Lcom/vkontakte/android/data/Friends;->getOnlineStatus(I)I

    move-result v0

    invoke-direct {p0, v0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->updateOnline(I)V

    .line 1485
    :cond_0
    :goto_0
    iget v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->peer:I

    if-le v0, v3, :cond_1

    .line 1486
    invoke-direct {p0, v2}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->updateChatUsers(Z)V

    .line 1488
    :cond_1
    iget v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->searchedMessageId:I

    if-eqz v0, :cond_2

    .line 1489
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->hideSearchedBgRunnable:Ljava/lang/Runnable;

    const-wide/16 v2, 0x7d0

    invoke-static {v0, v2, v3}, Lcom/vkontakte/android/ViewUtils;->postDelayed(Ljava/lang/Runnable;J)V

    .line 1491
    :cond_2
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->writeBar:Lcom/vkontakte/android/ui/WriteBar;

    if-eqz v0, :cond_3

    .line 1492
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->writeBar:Lcom/vkontakte/android/ui/WriteBar;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/WriteBar;->onResume(Landroid/app/Activity;)V

    .line 1494
    :cond_3
    return-void

    .line 1482
    :cond_4
    iget v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->peer:I

    if-gez v0, :cond_0

    iget v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->peer:I

    const v1, -0x77359400

    if-le v0, v1, :cond_0

    .line 1483
    const v0, 0x7f08029d

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->setSubtitle(I)V

    goto :goto_0
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "state"    # Landroid/os/Bundle;

    .prologue
    .line 922
    const-string/jumbo v0, "key_group"

    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->group:Lcom/vkontakte/android/api/Group;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 923
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/VKToolbarFragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 924
    return-void
.end method

.method public onStickerSelected(IILjava/lang/String;Ljava/lang/String;)V
    .locals 7
    .param p1, "packId"    # I
    .param p2, "stickerId"    # I
    .param p3, "url"    # Ljava/lang/String;
    .param p4, "stickerReferrer"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 178
    new-instance v0, Lcom/vkontakte/android/attachments/StickerAttachment;

    invoke-direct {v0}, Lcom/vkontakte/android/attachments/StickerAttachment;-><init>()V

    .line 179
    .local v0, "att":Lcom/vkontakte/android/attachments/StickerAttachment;
    iput p2, v0, Lcom/vkontakte/android/attachments/StickerAttachment;->id:I

    .line 180
    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/String;

    aput-object p3, v1, v4

    aput-object v2, v1, v5

    aput-object v2, v1, v6

    iput-object v1, v0, Lcom/vkontakte/android/attachments/StickerAttachment;->images:[Ljava/lang/String;

    .line 181
    iget-object v1, v0, Lcom/vkontakte/android/attachments/StickerAttachment;->images:[Ljava/lang/String;

    iget-object v2, v0, Lcom/vkontakte/android/attachments/StickerAttachment;->images:[Ljava/lang/String;

    iget-object v3, v0, Lcom/vkontakte/android/attachments/StickerAttachment;->images:[Ljava/lang/String;

    aget-object v3, v3, v4

    aput-object v3, v2, v6

    aput-object v3, v1, v5

    .line 182
    iput p1, v0, Lcom/vkontakte/android/attachments/StickerAttachment;->packID:I

    .line 183
    iput-object p4, v0, Lcom/vkontakte/android/attachments/StickerAttachment;->stickerReferrer:Ljava/lang/String;

    .line 184
    invoke-direct {p0, v0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->sendAttachment(Lcom/vkontakte/android/attachments/Attachment;)V

    .line 185
    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 928
    invoke-super {p0, p1, p2}, Lcom/vkontakte/android/fragments/VKToolbarFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 929
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getToolbar()Landroid/support/v7/widget/Toolbar;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->showChatInfoClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/Toolbar;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 930
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "photo"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getCharSequence(Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->setDialogIcon(Ljava/lang/CharSequence;)V

    .line 931
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "title"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getCharSequence(Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->setTitle(Ljava/lang/CharSequence;)V

    .line 932
    return-void
.end method

.method public openStickerKeyboard(I)V
    .locals 2
    .param p1, "pack"    # I

    .prologue
    .line 2828
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->mKeyboardPopup:Lcom/vkontakte/android/stickers/KeyboardPopup;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->mStickersView:Lcom/vkontakte/android/stickers/StickersView;

    if-eqz v0, :cond_0

    .line 2829
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->mKeyboardPopup:Lcom/vkontakte/android/stickers/KeyboardPopup;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/stickers/KeyboardPopup;->show(Z)V

    .line 2830
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->mStickersView:Lcom/vkontakte/android/stickers/StickersView;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/stickers/StickersView;->openPack(I)V

    .line 2832
    :cond_0
    return-void
.end method

.method public setHasSeparator(Z)V
    .locals 0
    .param p1, "b"    # Z

    .prologue
    .line 1721
    iput-boolean p1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->hasSeparator:Z

    .line 1722
    return-void
.end method

.method protected setSubtitle(Ljava/lang/CharSequence;)V
    .locals 1
    .param p1, "subtitle"    # Ljava/lang/CharSequence;

    .prologue
    .line 2859
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->setSubtitle(Ljava/lang/CharSequence;Z)V

    .line 2860
    return-void
.end method

.method protected setSubtitle(Ljava/lang/CharSequence;Z)V
    .locals 0
    .param p1, "subtitle"    # Ljava/lang/CharSequence;
    .param p2, "saveValue"    # Z

    .prologue
    .line 2851
    if-eqz p2, :cond_0

    .line 2852
    iput-object p1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->subtitle:Ljava/lang/CharSequence;

    .line 2854
    :cond_0
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/VKToolbarFragment;->setSubtitle(Ljava/lang/CharSequence;)V

    .line 2855
    return-void
.end method

.method protected setTitle(Ljava/lang/CharSequence;)V
    .locals 8
    .param p1, "title"    # Ljava/lang/CharSequence;

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 1693
    iget-object v4, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->writeBar:Lcom/vkontakte/android/ui/WriteBar;

    if-eqz v4, :cond_0

    .line 1694
    iget-object v4, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->writeBar:Lcom/vkontakte/android/ui/WriteBar;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/vkontakte/android/ui/WriteBar;->setGraffitiTitle(Ljava/lang/String;)V

    .line 1697
    :cond_0
    iput-object p1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->titleWithoutIcon:Ljava/lang/CharSequence;

    .line 1698
    if-eqz p1, :cond_2

    .line 1699
    invoke-static {}, Landroid/text/Spannable$Factory;->getInstance()Landroid/text/Spannable$Factory;

    move-result-object v4

    invoke-virtual {v4, p1}, Landroid/text/Spannable$Factory;->newSpannable(Ljava/lang/CharSequence;)Landroid/text/Spannable;

    move-result-object v2

    .line 1700
    .local v2, "sb":Landroid/text/Spannable;
    new-instance v4, Lcom/vkontakte/android/utils/TypefaceSpanAssets;

    sget-object v5, Lcom/vkontakte/android/ui/Font;->Medium:Lcom/vkontakte/android/ui/Font;

    iget-object v5, v5, Lcom/vkontakte/android/ui/Font;->typeface:Landroid/graphics/Typeface;

    invoke-direct {v4, v5}, Lcom/vkontakte/android/utils/TypefaceSpanAssets;-><init>(Landroid/graphics/Typeface;)V

    invoke-interface {v2}, Landroid/text/Spannable;->length()I

    move-result v5

    invoke-interface {v2, v4, v6, v5, v6}, Landroid/text/Spannable;->setSpan(Ljava/lang/Object;III)V

    .line 1702
    new-instance v0, Landroid/text/SpannableStringBuilder;

    invoke-direct {v0}, Landroid/text/SpannableStringBuilder;-><init>()V

    .line 1703
    .local v0, "builder":Landroid/text/SpannableStringBuilder;
    invoke-virtual {v0, v2}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 1705
    sget-object v4, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    iget v5, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->peer:I

    invoke-static {v4, v5}, Lcom/vkontakte/android/NotificationUtils;->arePeerNotificationsEnabled(Landroid/content/Context;I)Z

    move-result v4

    if-nez v4, :cond_1

    .line 1706
    invoke-static {}, Landroid/text/Spannable$Factory;->getInstance()Landroid/text/Spannable$Factory;

    move-result-object v4

    const-string/jumbo v5, "M"

    invoke-virtual {v4, v5}, Landroid/text/Spannable$Factory;->newSpannable(Ljava/lang/CharSequence;)Landroid/text/Spannable;

    move-result-object v3

    .line 1707
    .local v3, "sp":Landroid/text/Spannable;
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f0201fb

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 1708
    .local v1, "d":Landroid/graphics/drawable/Drawable;
    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v4

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v5

    invoke-virtual {v1, v6, v6, v4, v5}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 1709
    new-instance v4, Landroid/text/style/ImageSpan;

    invoke-direct {v4, v1, v7}, Landroid/text/style/ImageSpan;-><init>(Landroid/graphics/drawable/Drawable;I)V

    invoke-interface {v3, v4, v6, v7, v6}, Landroid/text/Spannable;->setSpan(Ljava/lang/Object;III)V

    .line 1710
    const-string/jumbo v4, " "

    invoke-virtual {v0, v4}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 1713
    .end local v1    # "d":Landroid/graphics/drawable/Drawable;
    .end local v3    # "sp":Landroid/text/Spannable;
    :cond_1
    invoke-static {v0}, Lcom/vkontakte/android/Global;->replaceEmoji(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    .line 1715
    invoke-super {p0, v0}, Lcom/vkontakte/android/fragments/VKToolbarFragment;->setTitle(Ljava/lang/CharSequence;)V

    .line 1717
    .end local v0    # "builder":Landroid/text/SpannableStringBuilder;
    .end local v2    # "sb":Landroid/text/Spannable;
    :cond_2
    return-void
.end method

.method public showMentionSuggestionsFor(Ljava/lang/String;)V
    .locals 2
    .param p1, "searchStr"    # Ljava/lang/String;

    .prologue
    .line 2869
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getIsShowingMentionsSuggestions()Z

    move-result v0

    if-nez v0, :cond_0

    .line 2872
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->mentionsAdapter:Lcom/vkontakte/android/ui/MentionsAdapter;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->items:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/MentionsAdapter;->buildUserPriorities(Ljava/util/ArrayList;)V

    .line 2875
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->mentionsAdapter:Lcom/vkontakte/android/ui/MentionsAdapter;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/ui/MentionsAdapter;->filterResults(Ljava/lang/String;)V

    .line 2876
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->mentionsRecyclerView:Lme/grishka/appkit/views/UsableRecyclerView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lme/grishka/appkit/views/UsableRecyclerView;->scrollToPosition(I)V

    .line 2878
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->shouldShowMentions:Z

    .line 2880
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->updateMentionsVisibility()V

    .line 2881
    return-void
.end method

.method public showTyping(Z)V
    .locals 2
    .param p1, "show"    # Z

    .prologue
    .line 2917
    iput-boolean p1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->isShowTyping:Z

    .line 2918
    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->subtitleTyping:Ljava/lang/CharSequence;

    :goto_0
    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->setSubtitle(Ljava/lang/CharSequence;Z)V

    .line 2919
    return-void

    .line 2918
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->subtitle:Ljava/lang/CharSequence;

    goto :goto_0
.end method

.method public toggleTime()V
    .locals 1

    .prologue
    .line 2569
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->adapter:Lcom/vkontakte/android/ui/adapters/MessagesAdapter;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/adapters/MessagesAdapter;->toggle()V

    .line 2570
    return-void
.end method
