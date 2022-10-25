.class public Lcom/vkontakte/android/fragments/PostViewFragment;
.super Lcom/vkontakte/android/fragments/VKRecyclerFragment;
.source "PostViewFragment.java"

# interfaces
.implements Lcom/vkontakte/android/attachments/StickerAttachment$Callback;
.implements Lcom/vkontakte/android/fragments/BackListener;
.implements Lcom/vkontakte/android/ui/holder/comments/CommentViewHolder$CommentViewHolderListener;
.implements Lcom/vkontakte/android/ui/holder/comments/DeletedCommentViewHolder$DeletedCommentViewHolderListener;
.implements Lme/grishka/appkit/views/UsableRecyclerView$ExtendedListener;
.implements Landroid/view/View$OnClickListener;
.implements Lcom/vkontakte/android/stickers/StickersView$Listener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/fragments/PostViewFragment$GridLayoutManagerWithSmoothScroller;,
        Lcom/vkontakte/android/fragments/PostViewFragment$ViewListAdapter;,
        Lcom/vkontakte/android/fragments/PostViewFragment$PostDisplayItemViewHolder;,
        Lcom/vkontakte/android/fragments/PostViewFragment$NewsAdapter;,
        Lcom/vkontakte/android/fragments/PostViewFragment$CommentsAdapter;,
        Lcom/vkontakte/android/fragments/PostViewFragment$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/fragments/VKRecyclerFragment;",
        "Lcom/vkontakte/android/attachments/StickerAttachment$Callback;",
        "Lcom/vkontakte/android/fragments/BackListener;",
        "Lcom/vkontakte/android/ui/holder/comments/CommentViewHolder$CommentViewHolderListener",
        "<",
        "Lcom/vkontakte/android/NewsComment;",
        ">;",
        "Lcom/vkontakte/android/ui/holder/comments/DeletedCommentViewHolder$DeletedCommentViewHolderListener",
        "<",
        "Lcom/vkontakte/android/NewsComment;",
        ">;",
        "Lme/grishka/appkit/views/UsableRecyclerView$ExtendedListener;",
        "Landroid/view/View$OnClickListener;",
        "Lcom/vkontakte/android/stickers/StickersView$Listener;"
    }
.end annotation


# static fields
.field private static final EDIT_COMMENT_REQUEST:I = 0x10e9

.field private static final EDIT_REQUEST:I = 0x10e8

.field private static final PICK_GROUP_REQUEST:I = 0x10eb

.field private static final REPORT_RESULT:I = 0x10ea

.field public static final RESULT_DELETED:I = 0x2

.field public static final TYPE_PHOTO:I = 0x1

.field public static final TYPE_POST:I


# instance fields
.field private accessKey:Ljava/lang/String;

.field private adapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

.field private canAdmin:Z

.field private canBanUsers:Z

.field private commentBar:Lcom/vkontakte/android/ui/WriteBar;

.field private comments:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/NewsComment;",
            ">;"
        }
    .end annotation
.end field

.field private commentsBuffer:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/NewsComment;",
            ">;"
        }
    .end annotation
.end field

.field private commentsProgress:Landroid/widget/FrameLayout;

.field private currentReq:Lcom/vkontakte/android/api/VKAPIRequest;

.field private e:Lcom/vkontakte/android/NewsEntry;

.field private error:Lcom/vkontakte/android/ui/ErrorView;

.field private hideJumpToEndButtonDueToScrollPosition:Z

.field private jumpToEndBtn:Landroid/view/ViewGroup;

.field private jumpingToEnd:Z

.field private keyboardVisible:Z

.field private likeBarBinder:Lcom/vkontakte/android/ui/binder/LikeBarBinder;

.field private likes:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/data/LikeInfo;",
            ">;"
        }
    .end annotation
.end field

.field private likesView:Landroid/view/View;

.field private liking:Z

.field private loadCommentsFromBeginning:Z

.field private loadMoreView:Lcom/vkontakte/android/LoadMoreCommentsView;

.field private loadingComments:Z

.field private mKeyboardPopup:Lcom/vkontakte/android/stickers/KeyboardPopup;

.field mScrollReset:Z

.field private mStickersView:Lcom/vkontakte/android/stickers/StickersView;

.field private postItems:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/ui/posts/PostDisplayItem;",
            ">;"
        }
    .end annotation
.end field

.field private receiver:Landroid/content/BroadcastReceiver;

.field private replyBarController:Lcom/vkontakte/android/ui/controllers/ReplyBarController;

.field private replyFromGroup:Z

.field private replyFromGroupId:I

.field private replyTo:I

.field private replyToName:Ljava/lang/String;

.field private replyToRName:Ljava/lang/String;

.field private replyToUid:I

.field private resetScroll:Z

.field private scrollToComment:I

.field private scrollToEnd:Z

.field private scrollToFirstComment:Z

.field private type:I

.field private views:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 4

    .prologue
    const/4 v3, -0x1

    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 365
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/vkontakte/android/fragments/VKRecyclerFragment;-><init>(I)V

    .line 282
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->comments:Ljava/util/ArrayList;

    .line 286
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->commentsBuffer:Ljava/util/ArrayList;

    .line 291
    iput-boolean v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->loadingComments:Z

    .line 293
    iput-boolean v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->canAdmin:Z

    .line 294
    iput v3, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->replyTo:I

    iput v3, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->replyToUid:I

    .line 295
    iput-object v2, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->replyToRName:Ljava/lang/String;

    .line 296
    iput-object v2, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->replyToName:Ljava/lang/String;

    .line 299
    iput v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->type:I

    .line 301
    iput-boolean v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->keyboardVisible:Z

    .line 302
    iput-boolean v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->liking:Z

    .line 305
    new-instance v0, Lcom/vkontakte/android/fragments/PostViewFragment$1;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/PostViewFragment$1;-><init>(Lcom/vkontakte/android/fragments/PostViewFragment;)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->receiver:Landroid/content/BroadcastReceiver;

    .line 341
    iput-object v2, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->accessKey:Ljava/lang/String;

    .line 343
    iput v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->scrollToComment:I

    .line 344
    iput-boolean v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->scrollToEnd:Z

    .line 345
    iput-boolean v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->scrollToFirstComment:Z

    .line 346
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->postItems:Ljava/util/ArrayList;

    .line 347
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->views:Ljava/util/ArrayList;

    .line 348
    iput-boolean v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->canBanUsers:Z

    .line 352
    iput-boolean v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->loadCommentsFromBeginning:Z

    .line 356
    iput-boolean v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->jumpingToEnd:Z

    .line 362
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->likes:Ljava/util/List;

    .line 366
    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/fragments/PostViewFragment;)Lcom/vkontakte/android/NewsEntry;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/PostViewFragment;

    .prologue
    .line 161
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    return-object v0
.end method

.method static synthetic access$100(Lcom/vkontakte/android/fragments/PostViewFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/PostViewFragment;

    .prologue
    .line 161
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->updateButtons()V

    return-void
.end method

.method static synthetic access$1000(Lcom/vkontakte/android/fragments/PostViewFragment;)Lcom/vkontakte/android/stickers/KeyboardPopup;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/PostViewFragment;

    .prologue
    .line 161
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->mKeyboardPopup:Lcom/vkontakte/android/stickers/KeyboardPopup;

    return-object v0
.end method

.method static synthetic access$1100(Lcom/vkontakte/android/fragments/PostViewFragment;)Lcom/vkontakte/android/ui/WriteBar;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/PostViewFragment;

    .prologue
    .line 161
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->commentBar:Lcom/vkontakte/android/ui/WriteBar;

    return-object v0
.end method

.method static synthetic access$1200(Lcom/vkontakte/android/fragments/PostViewFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/PostViewFragment;

    .prologue
    .line 161
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->waitAndSendComment()V

    return-void
.end method

.method static synthetic access$1300(Lcom/vkontakte/android/fragments/PostViewFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/PostViewFragment;

    .prologue
    .line 161
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->sendComment()V

    return-void
.end method

.method static synthetic access$1400(Lcom/vkontakte/android/fragments/PostViewFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/PostViewFragment;

    .prologue
    .line 161
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->setReplyFromCurrentlyAdminedGroup()V

    return-void
.end method

.method static synthetic access$1500(Lcom/vkontakte/android/fragments/PostViewFragment;Lcom/vkontakte/android/attachments/PendingAttachment;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/PostViewFragment;
    .param p1, "x1"    # Lcom/vkontakte/android/attachments/PendingAttachment;

    .prologue
    .line 161
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/PostViewFragment;->sendPendingAttachmentComment(Lcom/vkontakte/android/attachments/PendingAttachment;)V

    return-void
.end method

.method static synthetic access$1600(Lcom/vkontakte/android/fragments/PostViewFragment;Lcom/vkontakte/android/attachments/Attachment;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/PostViewFragment;
    .param p1, "x1"    # Lcom/vkontakte/android/attachments/Attachment;

    .prologue
    .line 161
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/PostViewFragment;->sendAttachmentComment(Lcom/vkontakte/android/attachments/Attachment;)V

    return-void
.end method

.method static synthetic access$1700(Lcom/vkontakte/android/fragments/PostViewFragment;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/PostViewFragment;

    .prologue
    .line 161
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->keyboardVisible:Z

    return v0
.end method

.method static synthetic access$1800(Lcom/vkontakte/android/fragments/PostViewFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/PostViewFragment;

    .prologue
    .line 161
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->resetReplyTo()V

    return-void
.end method

.method static synthetic access$1900(Lcom/vkontakte/android/fragments/PostViewFragment;)I
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/PostViewFragment;

    .prologue
    .line 161
    iget v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->replyFromGroupId:I

    return v0
.end method

.method static synthetic access$200(Lcom/vkontakte/android/fragments/PostViewFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/PostViewFragment;

    .prologue
    .line 161
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->comments:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$2000(Lcom/vkontakte/android/fragments/PostViewFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/PostViewFragment;

    .prologue
    .line 161
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->views:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$2100(Lcom/vkontakte/android/fragments/PostViewFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/PostViewFragment;

    .prologue
    .line 161
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->deletePost()V

    return-void
.end method

.method static synthetic access$2200(Lcom/vkontakte/android/fragments/PostViewFragment;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/PostViewFragment;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 161
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/PostViewFragment;->saveRepostComment(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$2300(Lcom/vkontakte/android/fragments/PostViewFragment;)Lcom/vkontakte/android/data/PostInteract;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/PostViewFragment;

    .prologue
    .line 161
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->getPostInteract()Lcom/vkontakte/android/data/PostInteract;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$2400(Lcom/vkontakte/android/fragments/PostViewFragment;)Landroid/view/ViewGroup;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/PostViewFragment;

    .prologue
    .line 161
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->contentView:Landroid/view/ViewGroup;

    return-object v0
.end method

.method static synthetic access$2500(Lcom/vkontakte/android/fragments/PostViewFragment;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/PostViewFragment;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 161
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/PostViewFragment;->editRepostComment(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$2600(Lcom/vkontakte/android/fragments/PostViewFragment;Lcom/vkontakte/android/NewsComment;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/PostViewFragment;
    .param p1, "x1"    # Lcom/vkontakte/android/NewsComment;
    .param p2, "x2"    # Z

    .prologue
    .line 161
    invoke-direct {p0, p1, p2}, Lcom/vkontakte/android/fragments/PostViewFragment;->replyToComment(Lcom/vkontakte/android/NewsComment;Z)V

    return-void
.end method

.method static synthetic access$2700(Lcom/vkontakte/android/fragments/PostViewFragment;I)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/PostViewFragment;
    .param p1, "x1"    # I

    .prologue
    .line 161
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/PostViewFragment;->deleteComment(I)V

    return-void
.end method

.method static synthetic access$2800(Lcom/vkontakte/android/fragments/PostViewFragment;Lcom/vkontakte/android/NewsComment;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/PostViewFragment;
    .param p1, "x1"    # Lcom/vkontakte/android/NewsComment;

    .prologue
    .line 161
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/PostViewFragment;->editComment(Lcom/vkontakte/android/NewsComment;)V

    return-void
.end method

.method static synthetic access$2900(Lcom/vkontakte/android/fragments/PostViewFragment;Lcom/vkontakte/android/NewsComment;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/PostViewFragment;
    .param p1, "x1"    # Lcom/vkontakte/android/NewsComment;

    .prologue
    .line 161
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/PostViewFragment;->repostComment(Lcom/vkontakte/android/NewsComment;)V

    return-void
.end method

.method static synthetic access$300(Lcom/vkontakte/android/fragments/PostViewFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/PostViewFragment;

    .prologue
    .line 161
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->jumpToEnd()V

    return-void
.end method

.method static synthetic access$3000(Lcom/vkontakte/android/fragments/PostViewFragment;)Lme/grishka/appkit/views/UsableRecyclerView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/PostViewFragment;

    .prologue
    .line 161
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    return-object v0
.end method

.method static synthetic access$3100(Lcom/vkontakte/android/fragments/PostViewFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/PostViewFragment;

    .prologue
    .line 161
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->broadcastUpdate()V

    return-void
.end method

.method static synthetic access$3200(Lcom/vkontakte/android/fragments/PostViewFragment;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/PostViewFragment;

    .prologue
    .line 161
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->loadCommentsFromBeginning:Z

    return v0
.end method

.method static synthetic access$3202(Lcom/vkontakte/android/fragments/PostViewFragment;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/PostViewFragment;
    .param p1, "x1"    # Z

    .prologue
    .line 161
    iput-boolean p1, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->loadCommentsFromBeginning:Z

    return p1
.end method

.method static synthetic access$3300(Lcom/vkontakte/android/fragments/PostViewFragment;)I
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/PostViewFragment;

    .prologue
    .line 161
    iget v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->replyTo:I

    return v0
.end method

.method static synthetic access$3400(Lcom/vkontakte/android/fragments/PostViewFragment;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/PostViewFragment;

    .prologue
    .line 161
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->replyToRName:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$3500(Lcom/vkontakte/android/fragments/PostViewFragment;)Lme/grishka/appkit/views/UsableRecyclerView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/PostViewFragment;

    .prologue
    .line 161
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    return-object v0
.end method

.method static synthetic access$3600(Lcom/vkontakte/android/fragments/PostViewFragment;)Lme/grishka/appkit/views/UsableRecyclerView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/PostViewFragment;

    .prologue
    .line 161
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    return-object v0
.end method

.method static synthetic access$3700(Lcom/vkontakte/android/fragments/PostViewFragment;)Lme/grishka/appkit/views/UsableRecyclerView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/PostViewFragment;

    .prologue
    .line 161
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    return-object v0
.end method

.method static synthetic access$3800(Lcom/vkontakte/android/fragments/PostViewFragment;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/PostViewFragment;

    .prologue
    .line 161
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->jumpingToEnd:Z

    return v0
.end method

.method static synthetic access$3802(Lcom/vkontakte/android/fragments/PostViewFragment;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/PostViewFragment;
    .param p1, "x1"    # Z

    .prologue
    .line 161
    iput-boolean p1, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->jumpingToEnd:Z

    return p1
.end method

.method static synthetic access$3900(Lcom/vkontakte/android/fragments/PostViewFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/PostViewFragment;

    .prologue
    .line 161
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->updateJumpToEndButtonVisibility()V

    return-void
.end method

.method static synthetic access$400(Lcom/vkontakte/android/fragments/PostViewFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/PostViewFragment;

    .prologue
    .line 161
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->postItems:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$4002(Lcom/vkontakte/android/fragments/PostViewFragment;Lcom/vkontakte/android/api/VKAPIRequest;)Lcom/vkontakte/android/api/VKAPIRequest;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/PostViewFragment;
    .param p1, "x1"    # Lcom/vkontakte/android/api/VKAPIRequest;

    .prologue
    .line 161
    iput-object p1, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->currentReq:Lcom/vkontakte/android/api/VKAPIRequest;

    return-object p1
.end method

.method static synthetic access$4102(Lcom/vkontakte/android/fragments/PostViewFragment;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/PostViewFragment;
    .param p1, "x1"    # Z

    .prologue
    .line 161
    iput-boolean p1, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->loadingComments:Z

    return p1
.end method

.method static synthetic access$4202(Lcom/vkontakte/android/fragments/PostViewFragment;Ljava/util/List;)Ljava/util/List;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/PostViewFragment;
    .param p1, "x1"    # Ljava/util/List;

    .prologue
    .line 161
    iput-object p1, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->likes:Ljava/util/List;

    return-object p1
.end method

.method static synthetic access$4300(Lcom/vkontakte/android/fragments/PostViewFragment;)Lme/grishka/appkit/views/UsableRecyclerView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/PostViewFragment;

    .prologue
    .line 161
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    return-object v0
.end method

.method static synthetic access$4400(Lcom/vkontakte/android/fragments/PostViewFragment;)Lme/grishka/appkit/views/UsableRecyclerView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/PostViewFragment;

    .prologue
    .line 161
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    return-object v0
.end method

.method static synthetic access$4500(Lcom/vkontakte/android/fragments/PostViewFragment;)Lme/grishka/appkit/views/UsableRecyclerView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/PostViewFragment;

    .prologue
    .line 161
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    return-object v0
.end method

.method static synthetic access$4600(Lcom/vkontakte/android/fragments/PostViewFragment;)Lme/grishka/appkit/views/UsableRecyclerView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/PostViewFragment;

    .prologue
    .line 161
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    return-object v0
.end method

.method static synthetic access$4700(Lcom/vkontakte/android/fragments/PostViewFragment;)Landroid/widget/FrameLayout;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/PostViewFragment;

    .prologue
    .line 161
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->commentsProgress:Landroid/widget/FrameLayout;

    return-object v0
.end method

.method static synthetic access$4800(Lcom/vkontakte/android/fragments/PostViewFragment;)Lme/grishka/appkit/views/SwipeRefreshLayoutI;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/PostViewFragment;

    .prologue
    .line 161
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->refreshLayout:Lme/grishka/appkit/views/SwipeRefreshLayoutI;

    return-object v0
.end method

.method static synthetic access$4900(Lcom/vkontakte/android/fragments/PostViewFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/PostViewFragment;

    .prologue
    .line 161
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->commentsBuffer:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$500(Lcom/vkontakte/android/fragments/PostViewFragment;)Lme/grishka/appkit/utils/MergeRecyclerAdapter;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/PostViewFragment;

    .prologue
    .line 161
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->adapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    return-object v0
.end method

.method static synthetic access$5000(Lcom/vkontakte/android/fragments/PostViewFragment;)I
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/PostViewFragment;

    .prologue
    .line 161
    iget v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->scrollToComment:I

    return v0
.end method

.method static synthetic access$5002(Lcom/vkontakte/android/fragments/PostViewFragment;I)I
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/PostViewFragment;
    .param p1, "x1"    # I

    .prologue
    .line 161
    iput p1, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->scrollToComment:I

    return p1
.end method

.method static synthetic access$5100(Lcom/vkontakte/android/fragments/PostViewFragment;)Lme/grishka/appkit/views/UsableRecyclerView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/PostViewFragment;

    .prologue
    .line 161
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    return-object v0
.end method

.method static synthetic access$5200(Lcom/vkontakte/android/fragments/PostViewFragment;)Lme/grishka/appkit/views/UsableRecyclerView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/PostViewFragment;

    .prologue
    .line 161
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    return-object v0
.end method

.method static synthetic access$5300(Lcom/vkontakte/android/fragments/PostViewFragment;)Lme/grishka/appkit/views/UsableRecyclerView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/PostViewFragment;

    .prologue
    .line 161
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    return-object v0
.end method

.method static synthetic access$5400(Lcom/vkontakte/android/fragments/PostViewFragment;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/PostViewFragment;

    .prologue
    .line 161
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->scrollToEnd:Z

    return v0
.end method

.method static synthetic access$5402(Lcom/vkontakte/android/fragments/PostViewFragment;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/PostViewFragment;
    .param p1, "x1"    # Z

    .prologue
    .line 161
    iput-boolean p1, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->scrollToEnd:Z

    return p1
.end method

.method static synthetic access$5500(Lcom/vkontakte/android/fragments/PostViewFragment;)Lme/grishka/appkit/views/UsableRecyclerView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/PostViewFragment;

    .prologue
    .line 161
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    return-object v0
.end method

.method static synthetic access$5600(Lcom/vkontakte/android/fragments/PostViewFragment;)Lme/grishka/appkit/views/UsableRecyclerView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/PostViewFragment;

    .prologue
    .line 161
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    return-object v0
.end method

.method static synthetic access$5700(Lcom/vkontakte/android/fragments/PostViewFragment;)Lme/grishka/appkit/views/UsableRecyclerView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/PostViewFragment;

    .prologue
    .line 161
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    return-object v0
.end method

.method static synthetic access$5800(Lcom/vkontakte/android/fragments/PostViewFragment;)Lme/grishka/appkit/views/UsableRecyclerView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/PostViewFragment;

    .prologue
    .line 161
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    return-object v0
.end method

.method static synthetic access$5900(Lcom/vkontakte/android/fragments/PostViewFragment;)Lme/grishka/appkit/views/UsableRecyclerView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/PostViewFragment;

    .prologue
    .line 161
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    return-object v0
.end method

.method static synthetic access$6000(Lcom/vkontakte/android/fragments/PostViewFragment;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/PostViewFragment;

    .prologue
    .line 161
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->scrollToFirstComment:Z

    return v0
.end method

.method static synthetic access$6002(Lcom/vkontakte/android/fragments/PostViewFragment;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/PostViewFragment;
    .param p1, "x1"    # Z

    .prologue
    .line 161
    iput-boolean p1, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->scrollToFirstComment:Z

    return p1
.end method

.method static synthetic access$6100(Lcom/vkontakte/android/fragments/PostViewFragment;)Lme/grishka/appkit/views/UsableRecyclerView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/PostViewFragment;

    .prologue
    .line 161
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    return-object v0
.end method

.method static synthetic access$6200(Lcom/vkontakte/android/fragments/PostViewFragment;)Lme/grishka/appkit/views/UsableRecyclerView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/PostViewFragment;

    .prologue
    .line 161
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    return-object v0
.end method

.method static synthetic access$6300(Lcom/vkontakte/android/fragments/PostViewFragment;)Lcom/vkontakte/android/ui/ErrorView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/PostViewFragment;

    .prologue
    .line 161
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->error:Lcom/vkontakte/android/ui/ErrorView;

    return-object v0
.end method

.method static synthetic access$6402(Lcom/vkontakte/android/fragments/PostViewFragment;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/PostViewFragment;
    .param p1, "x1"    # Z

    .prologue
    .line 161
    iput-boolean p1, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->liking:Z

    return p1
.end method

.method static synthetic access$6500(Lcom/vkontakte/android/fragments/PostViewFragment;)Landroid/view/ViewGroup;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/PostViewFragment;

    .prologue
    .line 161
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->contentView:Landroid/view/ViewGroup;

    return-object v0
.end method

.method static synthetic access$6600(Lcom/vkontakte/android/fragments/PostViewFragment;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/PostViewFragment;
    .param p1, "x1"    # Z

    .prologue
    .line 161
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/PostViewFragment;->like(Z)V

    return-void
.end method

.method static synthetic access$6700(Lcom/vkontakte/android/fragments/PostViewFragment;)Landroid/view/ViewGroup;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/PostViewFragment;

    .prologue
    .line 161
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->contentView:Landroid/view/ViewGroup;

    return-object v0
.end method

.method static synthetic access$6800(Lcom/vkontakte/android/fragments/PostViewFragment;)Landroid/view/ViewGroup;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/PostViewFragment;

    .prologue
    .line 161
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->contentView:Landroid/view/ViewGroup;

    return-object v0
.end method

.method static synthetic access$6900(Lcom/vkontakte/android/fragments/PostViewFragment;)Landroid/view/ViewGroup;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/PostViewFragment;

    .prologue
    .line 161
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->contentView:Landroid/view/ViewGroup;

    return-object v0
.end method

.method static synthetic access$7000(Lcom/vkontakte/android/fragments/PostViewFragment;)Landroid/view/ViewGroup;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/PostViewFragment;

    .prologue
    .line 161
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->contentView:Landroid/view/ViewGroup;

    return-object v0
.end method

.method static synthetic access$7100(Lcom/vkontakte/android/fragments/PostViewFragment;Lcom/vkontakte/android/UserProfile;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/PostViewFragment;
    .param p1, "x1"    # Lcom/vkontakte/android/UserProfile;

    .prologue
    .line 161
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/PostViewFragment;->openBanUserFragment(Lcom/vkontakte/android/UserProfile;)V

    return-void
.end method

.method static synthetic access$800(Lcom/vkontakte/android/fragments/PostViewFragment;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/PostViewFragment;
    .param p1, "x1"    # Z

    .prologue
    .line 161
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/PostViewFragment;->loadComments(Z)V

    return-void
.end method

.method static synthetic access$900(Lcom/vkontakte/android/fragments/PostViewFragment;)Lcom/vkontakte/android/LoadMoreCommentsView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/PostViewFragment;

    .prologue
    .line 161
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->loadMoreView:Lcom/vkontakte/android/LoadMoreCommentsView;

    return-object v0
.end method

.method private broadcastUpdate()V
    .locals 10

    .prologue
    .line 1680
    :try_start_0
    new-instance v7, Landroid/content/Intent;

    const-string/jumbo v0, "com.vkontakte.android.POST_UPDATED"

    invoke-direct {v7, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1681
    .local v7, "intent":Landroid/content/Intent;
    const-string/jumbo v0, "post_id"

    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v1, v1, Lcom/vkontakte/android/NewsEntry;->postID:I

    invoke-virtual {v7, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1682
    const-string/jumbo v0, "owner_id"

    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v1, v1, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    invoke-virtual {v7, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1683
    const-string/jumbo v0, "post_type"

    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v1, v1, Lcom/vkontakte/android/NewsEntry;->type:I

    invoke-virtual {v7, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1684
    const-string/jumbo v0, "comments"

    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v1, v1, Lcom/vkontakte/android/NewsEntry;->numComments:I

    invoke-virtual {v7, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1685
    const-string/jumbo v0, "retweets"

    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v1, v1, Lcom/vkontakte/android/NewsEntry;->numRetweets:I

    invoke-virtual {v7, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1686
    const-string/jumbo v0, "likes"

    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v1, v1, Lcom/vkontakte/android/NewsEntry;->numLikes:I

    invoke-virtual {v7, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1687
    const-string/jumbo v0, "liked"

    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/NewsEntry;->flag(I)Z

    move-result v1

    invoke-virtual {v7, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 1688
    const-string/jumbo v0, "retweeted"

    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    const/4 v2, 0x4

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/NewsEntry;->flag(I)Z

    move-result v1

    invoke-virtual {v7, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 1689
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const-string/jumbo v1, "com.vkontakte.android.permission.ACCESS_DATA"

    invoke-virtual {v0, v7, v1}, Landroid/app/Activity;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 1690
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v0, v0, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v1, v1, Lcom/vkontakte/android/NewsEntry;->postID:I

    iget-object v2, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v2, v2, Lcom/vkontakte/android/NewsEntry;->numLikes:I

    iget-object v3, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v3, v3, Lcom/vkontakte/android/NewsEntry;->numComments:I

    iget-object v4, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v4, v4, Lcom/vkontakte/android/NewsEntry;->numRetweets:I

    iget-object v5, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    const/16 v6, 0x8

    .line 1695
    invoke-virtual {v5, v6}, Lcom/vkontakte/android/NewsEntry;->flag(I)Z

    move-result v5

    iget-object v6, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    const/4 v9, 0x4

    .line 1696
    invoke-virtual {v6, v9}, Lcom/vkontakte/android/NewsEntry;->flag(I)Z

    move-result v6

    .line 1690
    invoke-static/range {v0 .. v6}, Lcom/vkontakte/android/cache/NewsfeedCache;->update(IIIIIZZ)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1701
    .end local v7    # "intent":Landroid/content/Intent;
    :goto_0
    return-void

    .line 1698
    :catch_0
    move-exception v8

    .line 1699
    .local v8, "x":Ljava/lang/Exception;
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    invoke-static {v8, v0}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto :goto_0
.end method

.method private deleteComment(I)V
    .locals 6
    .param p1, "cid"    # I

    .prologue
    .line 1420
    new-instance v0, Lcom/vkontakte/android/api/wall/WallDeleteComment;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v1, v1, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    iget-object v2, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v2, v2, Lcom/vkontakte/android/NewsEntry;->postID:I

    iget-object v3, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v4, v3, Lcom/vkontakte/android/NewsEntry;->type:I

    iget-object v5, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->accessKey:Ljava/lang/String;

    move v3, p1

    invoke-direct/range {v0 .. v5}, Lcom/vkontakte/android/api/wall/WallDeleteComment;-><init>(IIIILjava/lang/String;)V

    new-instance v1, Lcom/vkontakte/android/fragments/PostViewFragment$24;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-direct {v1, p0, v2, p1}, Lcom/vkontakte/android/fragments/PostViewFragment$24;-><init>(Lcom/vkontakte/android/fragments/PostViewFragment;Landroid/content/Context;I)V

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/wall/WallDeleteComment;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 1434
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->contentView:Landroid/view/ViewGroup;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/view/View;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 1435
    return-void
.end method

.method private deletePost()V
    .locals 4

    .prologue
    .line 1163
    new-instance v0, Lcom/vkontakte/android/api/wall/WallDelete;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v1, v1, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    iget-object v2, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v2, v2, Lcom/vkontakte/android/NewsEntry;->postID:I

    iget-object v3, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v3, v3, Lcom/vkontakte/android/NewsEntry;->type:I

    invoke-direct {v0, v1, v2, v3}, Lcom/vkontakte/android/api/wall/WallDelete;-><init>(III)V

    new-instance v1, Lcom/vkontakte/android/fragments/PostViewFragment$17;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-direct {v1, p0, v2}, Lcom/vkontakte/android/fragments/PostViewFragment$17;-><init>(Lcom/vkontakte/android/fragments/PostViewFragment;Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/wall/WallDelete;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 1180
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 1181
    return-void
.end method

.method private editComment(Lcom/vkontakte/android/NewsComment;)V
    .locals 3
    .param p1, "comm"    # Lcom/vkontakte/android/NewsComment;

    .prologue
    .line 1438
    new-instance v0, Lcom/vkontakte/android/NewsEntry;

    invoke-direct {v0}, Lcom/vkontakte/android/NewsEntry;-><init>()V

    .line 1439
    .local v0, "ce":Lcom/vkontakte/android/NewsEntry;
    iget-object v1, p1, Lcom/vkontakte/android/NewsComment;->text:Ljava/lang/String;

    iput-object v1, v0, Lcom/vkontakte/android/NewsEntry;->text:Ljava/lang/String;

    .line 1440
    iget-object v1, p1, Lcom/vkontakte/android/NewsComment;->attachments:Ljava/util/ArrayList;

    iput-object v1, v0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    .line 1441
    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v1, v1, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    iput v1, v0, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    .line 1442
    iget v1, p1, Lcom/vkontakte/android/NewsComment;->cid:I

    iput v1, v0, Lcom/vkontakte/android/NewsEntry;->postID:I

    .line 1443
    iget v1, p1, Lcom/vkontakte/android/NewsComment;->uid:I

    iput v1, v0, Lcom/vkontakte/android/NewsEntry;->userID:I

    .line 1444
    const/4 v1, 0x5

    iput v1, v0, Lcom/vkontakte/android/NewsEntry;->type:I

    .line 1445
    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v1, v1, Lcom/vkontakte/android/NewsEntry;->postID:I

    iput v1, v0, Lcom/vkontakte/android/NewsEntry;->retweetOrigId:I

    .line 1446
    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v1, v1, Lcom/vkontakte/android/NewsEntry;->type:I

    packed-switch v1, :pswitch_data_0

    .line 1455
    const-string/jumbo v1, "wall"

    iput-object v1, v0, Lcom/vkontakte/android/NewsEntry;->retweetText:Ljava/lang/String;

    .line 1462
    :goto_0
    new-instance v1, Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;

    invoke-direct {v1}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;-><init>()V

    invoke-virtual {v1, v0}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;->attachPost(Lcom/vkontakte/android/NewsEntry;)Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;

    move-result-object v1

    const/16 v2, 0x10e9

    invoke-virtual {v1, p0, v2}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;->forResult(Landroid/app/Fragment;I)Z

    .line 1463
    return-void

    .line 1448
    :pswitch_0
    const-string/jumbo v1, "photo"

    iput-object v1, v0, Lcom/vkontakte/android/NewsEntry;->retweetText:Ljava/lang/String;

    goto :goto_0

    .line 1451
    :pswitch_1
    const-string/jumbo v1, "video"

    iput-object v1, v0, Lcom/vkontakte/android/NewsEntry;->retweetText:Ljava/lang/String;

    goto :goto_0

    .line 1446
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method private editRepostComment(Ljava/lang/String;)V
    .locals 4
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 1184
    new-instance v0, Landroid/widget/EditText;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    .line 1185
    .local v0, "edit":Landroid/widget/EditText;
    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 1186
    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setLines(I)V

    .line 1187
    const/16 v1, 0x30

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setGravity(I)V

    .line 1188
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-interface {v1}, Landroid/text/Editable;->length()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setSelection(I)V

    .line 1189
    new-instance v1, Lcom/vkontakte/android/VKAlertDialog$Builder;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/vkontakte/android/VKAlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v2, 0x7f0800a4

    .line 1190
    invoke-virtual {v1, v2}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 1191
    invoke-virtual {v1, v0}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x7f0805d9

    new-instance v3, Lcom/vkontakte/android/fragments/PostViewFragment$18;

    invoke-direct {v3, p0, v0}, Lcom/vkontakte/android/fragments/PostViewFragment$18;-><init>(Lcom/vkontakte/android/fragments/PostViewFragment;Landroid/widget/EditText;)V

    .line 1192
    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x7f08011f

    const/4 v3, 0x0

    .line 1198
    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 1199
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 1200
    return-void
.end method

.method private getPostInteract()Lcom/vkontakte/android/data/PostInteract;
    .locals 4

    .prologue
    .line 236
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    .line 237
    .local v0, "arg":Landroid/os/Bundle;
    if-eqz v0, :cond_0

    .line 238
    new-instance v2, Lcom/vkontakte/android/data/PostInteract;

    const-string/jumbo v1, "referer"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v1, "entry"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/NewsEntry;

    invoke-direct {v2, v3, v1}, Lcom/vkontakte/android/data/PostInteract;-><init>(Ljava/lang/String;Lcom/vkontakte/android/NewsEntry;)V

    move-object v1, v2

    .line 240
    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private jumpToEnd()V
    .locals 1

    .prologue
    const/4 v0, 0x1

    .line 1672
    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->jumpingToEnd:Z

    .line 1673
    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->scrollToEnd:Z

    .line 1674
    invoke-direct {p0, v0}, Lcom/vkontakte/android/fragments/PostViewFragment;->loadComments(Z)V

    .line 1675
    return-void
.end method

.method private like(Z)V
    .locals 5
    .param p1, "liked"    # Z

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 1953
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-static {v1}, Lcom/vkontakte/android/auth/VKAuth;->ensureLoggedIn(Landroid/content/Context;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 2025
    :cond_0
    :goto_0
    return-void

    .line 1956
    :cond_1
    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    const/16 v2, 0x8

    invoke-virtual {v1, v2, p1}, Lcom/vkontakte/android/NewsEntry;->flag(IZ)V

    .line 1957
    if-eqz p1, :cond_4

    .line 1958
    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v2, v1, Lcom/vkontakte/android/NewsEntry;->numLikes:I

    add-int/lit8 v2, v2, 0x1

    iput v2, v1, Lcom/vkontakte/android/NewsEntry;->numLikes:I

    .line 1962
    :goto_1
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->broadcastUpdate()V

    .line 1963
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->updateButtons()V

    .line 1964
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->updateList()V

    .line 1965
    iget-boolean v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->liking:Z

    if-nez v1, :cond_0

    .line 1968
    iput-boolean v4, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->liking:Z

    .line 1969
    const-string/jumbo v0, ""

    .line 1970
    .local v0, "akey":Ljava/lang/String;
    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v1, v1, Lcom/vkontakte/android/NewsEntry;->type:I

    const/4 v2, 0x2

    if-ne v1, v2, :cond_2

    .line 1971
    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget-object v1, v1, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/attachments/VideoAttachment;

    iget-object v1, v1, Lcom/vkontakte/android/attachments/VideoAttachment;->video:Lcom/vkontakte/android/api/VideoFile;

    iget-object v0, v1, Lcom/vkontakte/android/api/VideoFile;->accessKey:Ljava/lang/String;

    .line 1973
    :cond_2
    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v1, v1, Lcom/vkontakte/android/NewsEntry;->type:I

    if-ne v1, v4, :cond_3

    .line 1974
    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget-object v1, v1, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/attachments/PhotoAttachment;

    iget-object v0, v1, Lcom/vkontakte/android/attachments/PhotoAttachment;->accessKey:Ljava/lang/String;

    .line 1976
    :cond_3
    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    invoke-static {v1, p1, v0}, Lcom/vkontakte/android/api/wall/WallLike;->newsEntry(Lcom/vkontakte/android/NewsEntry;ZLjava/lang/String;)Lcom/vkontakte/android/api/wall/WallLike;

    move-result-object v1

    new-instance v2, Lcom/vkontakte/android/fragments/PostViewFragment$31;

    invoke-direct {v2, p0, p1}, Lcom/vkontakte/android/fragments/PostViewFragment$31;-><init>(Lcom/vkontakte/android/fragments/PostViewFragment;Z)V

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/api/wall/WallLike;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    .line 2024
    invoke-virtual {v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec()Lcom/vkontakte/android/api/VKAPIRequest;

    goto :goto_0

    .line 1960
    .end local v0    # "akey":Ljava/lang/String;
    :cond_4
    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v2, v1, Lcom/vkontakte/android/NewsEntry;->numLikes:I

    add-int/lit8 v2, v2, -0x1

    iput v2, v1, Lcom/vkontakte/android/NewsEntry;->numLikes:I

    goto :goto_1
.end method

.method private loadComments(Z)V
    .locals 1
    .param p1, "clear"    # Z

    .prologue
    .line 1704
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/vkontakte/android/fragments/PostViewFragment;->loadComments(ZZ)V

    .line 1705
    return-void
.end method

.method private loadComments(ZZ)V
    .locals 15
    .param p1, "clear"    # Z
    .param p2, "saveScroll"    # Z

    .prologue
    .line 1708
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->loadingComments:Z

    if-eqz v0, :cond_0

    .line 1925
    :goto_0
    return-void

    .line 1712
    :cond_0
    if-eqz p1, :cond_1

    .line 1713
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->commentsBuffer:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 1716
    :cond_1
    if-eqz p1, :cond_9

    const/4 v3, 0x0

    .line 1718
    .local v3, "csize":I
    :goto_1
    const/16 v4, 0xa

    .line 1719
    .local v4, "count":I
    if-nez p1, :cond_2

    .line 1720
    const/16 v0, 0x64

    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v1, v1, Lcom/vkontakte/android/NewsEntry;->numComments:I

    sub-int/2addr v1, v3

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v4

    .line 1722
    :cond_2
    iget v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->scrollToComment:I

    if-nez v0, :cond_3

    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->scrollToEnd:Z

    if-eqz v0, :cond_4

    .line 1723
    :cond_3
    const/16 v4, 0x32

    .line 1726
    :cond_4
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->comments:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-nez v0, :cond_6

    .line 1727
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->views:Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->commentsProgress:Landroid/widget/FrameLayout;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_5

    .line 1728
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->views:Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->commentsProgress:Landroid/widget/FrameLayout;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1730
    :cond_5
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->views:Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->error:Lcom/vkontakte/android/ui/ErrorView;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 1731
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->updateList()V

    .line 1734
    :cond_6
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->loadingComments:Z

    .line 1736
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->loadCommentsFromBeginning:Z

    if-eqz v0, :cond_a

    const/4 v8, 0x0

    .line 1738
    .local v8, "desc":Z
    :goto_2
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->jumpingToEnd:Z

    if-eqz v0, :cond_7

    .line 1741
    const/4 v8, 0x1

    .line 1744
    :cond_7
    new-instance v0, Lcom/vkontakte/android/api/wall/WallGetComments;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v1, v1, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    iget-object v2, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v2, v2, Lcom/vkontakte/android/NewsEntry;->postID:I

    iget-object v5, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v5, v5, Lcom/vkontakte/android/NewsEntry;->type:I

    iget-object v7, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->accessKey:Ljava/lang/String;

    iget-object v6, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    invoke-virtual {v6}, Lcom/vkontakte/android/NewsEntry;->getTrackCode()Ljava/lang/String;

    move-result-object v9

    move/from16 v6, p1

    invoke-direct/range {v0 .. v9}, Lcom/vkontakte/android/api/wall/WallGetComments;-><init>(IIIIIZLjava/lang/String;ZLjava/lang/String;)V

    new-instance v9, Lcom/vkontakte/android/fragments/PostViewFragment$30;

    move-object v10, p0

    move-object v11, p0

    move/from16 v12, p1

    move v13, v3

    move/from16 v14, p2

    invoke-direct/range {v9 .. v14}, Lcom/vkontakte/android/fragments/PostViewFragment$30;-><init>(Lcom/vkontakte/android/fragments/PostViewFragment;Landroid/app/Fragment;ZIZ)V

    .line 1745
    invoke-virtual {v0, v9}, Lcom/vkontakte/android/api/wall/WallGetComments;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->currentReq:Lcom/vkontakte/android/api/VKAPIRequest;

    .line 1921
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->jumpingToEnd:Z

    if-eqz v0, :cond_8

    .line 1922
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->currentReq:Lcom/vkontakte/android/api/VKAPIRequest;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 1924
    :cond_8
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->currentReq:Lcom/vkontakte/android/api/VKAPIRequest;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    goto/16 :goto_0

    .line 1716
    .end local v3    # "csize":I
    .end local v4    # "count":I
    .end local v8    # "desc":Z
    :cond_9
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->comments:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v3

    goto/16 :goto_1

    .line 1736
    .restart local v3    # "csize":I
    .restart local v4    # "count":I
    :cond_a
    const/4 v8, 0x1

    goto :goto_2
.end method

.method private loadMoreCommentsFromBuffer()V
    .locals 2

    .prologue
    .line 596
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->loadCommentsFromBeginning:Z

    if-eqz v0, :cond_1

    .line 598
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->commentsBuffer:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_0

    .line 599
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->comments:Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->commentsBuffer:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 600
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->commentsBuffer:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 601
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->updateList()V

    .line 604
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->comments:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v1, v1, Lcom/vkontakte/android/NewsEntry;->numComments:I

    if-ge v0, v1, :cond_1

    .line 606
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/vkontakte/android/fragments/PostViewFragment;->loadComments(Z)V

    .line 609
    :cond_1
    return-void
.end method

.method private loadVideoInfo()V
    .locals 3

    .prologue
    .line 2101
    new-instance v0, Lcom/vkontakte/android/api/video/VideoGetInfo;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v1, v1, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    iget-object v2, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v2, v2, Lcom/vkontakte/android/NewsEntry;->postID:I

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/api/video/VideoGetInfo;-><init>(II)V

    new-instance v1, Lcom/vkontakte/android/fragments/PostViewFragment$34;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/fragments/PostViewFragment$34;-><init>(Lcom/vkontakte/android/fragments/PostViewFragment;)V

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/video/VideoGetInfo;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->contentView:Landroid/view/ViewGroup;

    .line 2123
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/view/View;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 2124
    return-void
.end method

.method private openBanUserFragment(Lcom/vkontakte/android/UserProfile;)V
    .locals 3
    .param p1, "p"    # Lcom/vkontakte/android/UserProfile;

    .prologue
    .line 2094
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 2095
    .local v0, "args":Landroid/os/Bundle;
    const-string/jumbo v1, "id"

    iget-object v2, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v2, v2, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    neg-int v2, v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 2096
    const-string/jumbo v1, "profile"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 2097
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/groupadmin/BannedUserSettingsFragment;->open(Landroid/os/Bundle;Landroid/app/Activity;)V

    .line 2098
    return-void
.end method

.method private replyToComment(Lcom/vkontakte/android/NewsComment;Z)V
    .locals 4
    .param p1, "comm"    # Lcom/vkontakte/android/NewsComment;
    .param p2, "fromGroup"    # Z

    .prologue
    .line 1325
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->resetReplyTo()V

    .line 1327
    iget v0, p1, Lcom/vkontakte/android/NewsComment;->cid:I

    iput v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->replyTo:I

    .line 1328
    iget v0, p1, Lcom/vkontakte/android/NewsComment;->uid:I

    iput v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->replyToUid:I

    .line 1329
    iget-object v0, p1, Lcom/vkontakte/android/NewsComment;->userRName:Ljava/lang/String;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->replyToRName:Ljava/lang/String;

    .line 1330
    iget-object v0, p1, Lcom/vkontakte/android/NewsComment;->userName:Ljava/lang/String;

    const-string/jumbo v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    aget-object v0, v0, v1

    iput-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->replyToName:Ljava/lang/String;

    .line 1332
    if-eqz p2, :cond_0

    .line 1333
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->setReplyFromCurrentlyAdminedGroup()V

    .line 1335
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/NewsEntry;->flag(I)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1337
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->replyBarController:Lcom/vkontakte/android/ui/controllers/ReplyBarController;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->replyToRName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/controllers/ReplyBarController;->setReplyToName(Ljava/lang/String;)V

    .line 1339
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->commentBar:Lcom/vkontakte/android/ui/WriteBar;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/WriteBar;->isTextEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1340
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->commentBar:Lcom/vkontakte/android/ui/WriteBar;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->replyToName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/WriteBar;->setText(Ljava/lang/CharSequence;)V

    .line 1342
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->commentBar:Lcom/vkontakte/android/ui/WriteBar;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/WriteBar;->focus()V

    .line 1343
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    new-instance v1, Lcom/vkontakte/android/fragments/PostViewFragment$21;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/fragments/PostViewFragment$21;-><init>(Lcom/vkontakte/android/fragments/PostViewFragment;)V

    const-wide/16 v2, 0xc8

    invoke-virtual {v0, v1, v2, v3}, Lme/grishka/appkit/views/UsableRecyclerView;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 1351
    :cond_2
    return-void
.end method

.method private repost()V
    .locals 3

    .prologue
    .line 2028
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Lcom/vkontakte/android/auth/VKAuth;->ensureLoggedIn(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2029
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Lcom/vk/sharing/Sharing;->from(Landroid/content/Context;)Lcom/vk/sharing/Sharing$Builder;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    const-string/jumbo v2, "posts"

    .line 2030
    invoke-static {v1, v2}, Lcom/vk/sharing/attachment/Attachments;->createInfo(Lcom/vkontakte/android/NewsEntry;Ljava/lang/String;)Lcom/vk/sharing/attachment/AttachmentInfo;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/sharing/Sharing$Builder;->withAttachment(Lcom/vk/sharing/attachment/AttachmentInfo;)Lcom/vk/sharing/Sharing$Builder;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    .line 2031
    invoke-static {v1}, Lcom/vk/sharing/action/Actions;->createInfo(Lcom/vkontakte/android/NewsEntry;)Lcom/vk/sharing/action/ActionsInfo;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/sharing/Sharing$Builder;->withActions(Lcom/vk/sharing/action/ActionsInfo;)Lcom/vk/sharing/Sharing$Builder;

    move-result-object v0

    .line 2032
    invoke-virtual {v0}, Lcom/vk/sharing/Sharing$Builder;->share()V

    .line 2034
    :cond_0
    return-void
.end method

.method private repostComment(Lcom/vkontakte/android/NewsComment;)V
    .locals 3
    .param p1, "comm"    # Lcom/vkontakte/android/NewsComment;

    .prologue
    .line 1411
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Lcom/vkontakte/android/auth/VKAuth;->ensureLoggedIn(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1412
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Lcom/vk/sharing/Sharing;->from(Landroid/content/Context;)Lcom/vk/sharing/Sharing$Builder;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    const-string/jumbo v2, "single"

    .line 1413
    invoke-static {v1, p1, v2}, Lcom/vk/sharing/attachment/Attachments;->createInfo(Lcom/vkontakte/android/NewsEntry;Lcom/vkontakte/android/NewsComment;Ljava/lang/String;)Lcom/vk/sharing/attachment/AttachmentInfo;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/sharing/Sharing$Builder;->withAttachment(Lcom/vk/sharing/attachment/AttachmentInfo;)Lcom/vk/sharing/Sharing$Builder;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    .line 1414
    invoke-static {v1, p1}, Lcom/vk/sharing/action/Actions;->createInfo(Lcom/vkontakte/android/NewsEntry;Lcom/vkontakte/android/NewsComment;)Lcom/vk/sharing/action/ActionsInfo;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/sharing/Sharing$Builder;->withActions(Lcom/vk/sharing/action/ActionsInfo;)Lcom/vk/sharing/Sharing$Builder;

    move-result-object v0

    .line 1415
    invoke-virtual {v0}, Lcom/vk/sharing/Sharing$Builder;->share()V

    .line 1417
    :cond_0
    return-void
.end method

.method private resetReplyTo()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    const/4 v3, -0x1

    .line 612
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->replyToName:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->commentBar:Lcom/vkontakte/android/ui/WriteBar;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/WriteBar;->getText()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->replyToName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 613
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->commentBar:Lcom/vkontakte/android/ui/WriteBar;

    const-string/jumbo v1, ""

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/WriteBar;->setText(Ljava/lang/CharSequence;)V

    .line 616
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->replyBarController:Lcom/vkontakte/android/ui/controllers/ReplyBarController;

    if-eqz v0, :cond_1

    .line 617
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->replyBarController:Lcom/vkontakte/android/ui/controllers/ReplyBarController;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/controllers/ReplyBarController;->resetReplyToName()V

    .line 620
    :cond_1
    iput v3, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->replyTo:I

    .line 621
    iput v3, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->replyToUid:I

    .line 622
    iput-object v4, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->replyToRName:Ljava/lang/String;

    .line 623
    iput-object v4, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->replyToName:Ljava/lang/String;

    .line 624
    return-void
.end method

.method private saveRepostComment(Ljava/lang/String;)V
    .locals 3
    .param p1, "newComment"    # Ljava/lang/String;

    .prologue
    .line 1203
    new-instance v0, Lcom/vkontakte/android/api/wall/WallEdit;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v1, v1, Lcom/vkontakte/android/NewsEntry;->postID:I

    iget-object v2, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v2, v2, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    invoke-direct {v0, v1, v2, p1}, Lcom/vkontakte/android/api/wall/WallEdit;-><init>(IILjava/lang/String;)V

    new-instance v1, Lcom/vkontakte/android/fragments/PostViewFragment$19;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-direct {v1, p0, v2, p1}, Lcom/vkontakte/android/fragments/PostViewFragment$19;-><init>(Lcom/vkontakte/android/fragments/PostViewFragment;Landroid/content/Context;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/wall/WallEdit;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 1225
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 1226
    return-void
.end method

.method private sendAttachmentComment(Lcom/vkontakte/android/attachments/Attachment;)V
    .locals 3
    .param p1, "att"    # Lcom/vkontakte/android/attachments/Attachment;

    .prologue
    .line 1494
    const-string/jumbo v0, ""

    invoke-static {p1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    const/4 v2, 0x0

    invoke-direct {p0, v0, v1, v2}, Lcom/vkontakte/android/fragments/PostViewFragment;->sendComment(Ljava/lang/String;Ljava/util/List;Z)V

    .line 1495
    return-void
.end method

.method private sendComment()V
    .locals 4

    .prologue
    .line 1489
    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->commentBar:Lcom/vkontakte/android/ui/WriteBar;

    invoke-virtual {v1}, Lcom/vkontakte/android/ui/WriteBar;->getText()Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, "\\*((?:id|club)[0-9-]+) \\(([^\\)]+)\\)"

    const-string/jumbo v3, "[$1|$2]"

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1490
    .local v0, "txt":Ljava/lang/String;
    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->commentBar:Lcom/vkontakte/android/ui/WriteBar;

    invoke-virtual {v1}, Lcom/vkontakte/android/ui/WriteBar;->getAttachments()Ljava/util/ArrayList;

    move-result-object v1

    const/4 v2, 0x1

    invoke-direct {p0, v0, v1, v2}, Lcom/vkontakte/android/fragments/PostViewFragment;->sendComment(Ljava/lang/String;Ljava/util/List;Z)V

    .line 1491
    return-void
.end method

.method private sendComment(Ljava/lang/String;Ljava/util/List;Z)V
    .locals 8
    .param p1, "txt"    # Ljava/lang/String;
    .param p3, "clearCommentBar"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/attachments/Attachment;",
            ">;Z)V"
        }
    .end annotation

    .prologue
    .line 1544
    .local p2, "atts":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/attachments/Attachment;>;"
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_0

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v0

    if-nez v0, :cond_0

    .line 1667
    :goto_0
    return-void

    .line 1547
    :cond_0
    new-instance v0, Lcom/vkontakte/android/api/wall/WallAddComment;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v3, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->replyTo:I

    iget-object v5, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->accessKey:Ljava/lang/String;

    iget v6, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->replyFromGroupId:I

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v2

    const-string/jumbo v4, "referer"

    invoke-virtual {v2, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    move-object v2, p1

    move-object v4, p2

    invoke-direct/range {v0 .. v7}, Lcom/vkontakte/android/api/wall/WallAddComment;-><init>(Lcom/vkontakte/android/NewsEntry;Ljava/lang/String;ILjava/util/List;Ljava/lang/String;ILjava/lang/String;)V

    new-instance v1, Lcom/vkontakte/android/fragments/PostViewFragment$29;

    .line 1548
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    move-object v2, p0

    move v4, p3

    move-object v5, p1

    move-object v6, p2

    invoke-direct/range {v1 .. v6}, Lcom/vkontakte/android/fragments/PostViewFragment$29;-><init>(Lcom/vkontakte/android/fragments/PostViewFragment;Landroid/content/Context;ZLjava/lang/String;Ljava/util/List;)V

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/wall/WallAddComment;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 1665
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->contentView:Landroid/view/ViewGroup;

    .line 1666
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/view/View;)Lcom/vkontakte/android/api/VKAPIRequest;

    goto :goto_0
.end method

.method private sendPendingAttachmentComment(Lcom/vkontakte/android/attachments/PendingAttachment;)V
    .locals 5
    .param p1, "att"    # Lcom/vkontakte/android/attachments/PendingAttachment;

    .prologue
    .line 1498
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    if-nez v3, :cond_0

    .line 1540
    :goto_0
    return-void

    .line 1502
    :cond_0
    new-instance v0, Landroid/app/ProgressDialog;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-direct {v0, v3}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    .line 1503
    .local v0, "progress":Landroid/app/ProgressDialog;
    const v3, 0x7f08033d

    invoke-virtual {p0, v3}, Lcom/vkontakte/android/fragments/PostViewFragment;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 1504
    const/4 v3, 0x1

    invoke-virtual {v0, v3}, Landroid/app/ProgressDialog;->setCancelable(Z)V

    .line 1505
    const/4 v3, 0x0

    invoke-virtual {v0, v3}, Landroid/app/ProgressDialog;->setCanceledOnTouchOutside(Z)V

    .line 1506
    invoke-virtual {v0}, Landroid/app/ProgressDialog;->show()V

    .line 1508
    new-instance v2, Lcom/vkontakte/android/upload/UploadListener;

    invoke-interface {p1}, Lcom/vkontakte/android/attachments/PendingAttachment;->getUploadId()I

    move-result v3

    new-instance v4, Lcom/vkontakte/android/fragments/PostViewFragment$27;

    invoke-direct {v4, p0, v0}, Lcom/vkontakte/android/fragments/PostViewFragment$27;-><init>(Lcom/vkontakte/android/fragments/PostViewFragment;Landroid/app/ProgressDialog;)V

    invoke-direct {v2, v3, v4}, Lcom/vkontakte/android/upload/UploadListener;-><init>(ILcom/vkontakte/android/upload/UploadListener$UploadListenerCallback;)V

    .line 1528
    .local v2, "uploadListener":Lcom/vkontakte/android/upload/UploadListener;
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-interface {p1, v3}, Lcom/vkontakte/android/attachments/PendingAttachment;->createUploadTask(Landroid/content/Context;)Lcom/vkontakte/android/upload/UploadTask;

    move-result-object v1

    .line 1529
    .local v1, "task":Lcom/vkontakte/android/upload/UploadTask;
    new-instance v3, Lcom/vkontakte/android/fragments/PostViewFragment$28;

    invoke-direct {v3, p0, v1, v2}, Lcom/vkontakte/android/fragments/PostViewFragment$28;-><init>(Lcom/vkontakte/android/fragments/PostViewFragment;Lcom/vkontakte/android/upload/UploadTask;Lcom/vkontakte/android/upload/UploadListener;)V

    invoke-virtual {v0, v3}, Landroid/app/ProgressDialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    .line 1536
    invoke-virtual {v2}, Lcom/vkontakte/android/upload/UploadListener;->startListener()V

    .line 1538
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-static {v3, v1}, Lcom/vkontakte/android/upload/Upload;->start(Landroid/content/Context;Lcom/vkontakte/android/upload/UploadTask;)V

    goto :goto_0
.end method

.method private setReplyFromCurrentlyAdminedGroup()V
    .locals 3

    .prologue
    .line 873
    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v1, v1, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    neg-int v1, v1

    invoke-static {v1}, Lcom/vkontakte/android/data/Groups;->getById(I)Lcom/vkontakte/android/api/Group;

    move-result-object v0

    .line 874
    .local v0, "g":Lcom/vkontakte/android/api/Group;
    if-eqz v0, :cond_0

    .line 875
    iget v1, v0, Lcom/vkontakte/android/api/Group;->id:I

    iput v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->replyFromGroupId:I

    .line 877
    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->replyBarController:Lcom/vkontakte/android/ui/controllers/ReplyBarController;

    if-eqz v1, :cond_0

    .line 878
    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->replyBarController:Lcom/vkontakte/android/ui/controllers/ReplyBarController;

    iget v2, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->replyFromGroupId:I

    invoke-static {v2}, Lcom/vkontakte/android/data/Groups;->getById(I)Lcom/vkontakte/android/api/Group;

    move-result-object v2

    iget-object v2, v2, Lcom/vkontakte/android/api/Group;->name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/ui/controllers/ReplyBarController;->setFromName(Ljava/lang/String;)V

    .line 881
    :cond_0
    return-void
.end method

.method private updateButtons()V
    .locals 7

    .prologue
    .line 1938
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    if-nez v0, :cond_0

    .line 1950
    :goto_0
    return-void

    .line 1942
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->likeBarBinder:Lcom/vkontakte/android/ui/binder/LikeBarBinder;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    const/16 v2, 0x8

    .line 1943
    invoke-virtual {v1, v2}, Lcom/vkontakte/android/NewsEntry;->flag(I)Z

    move-result v1

    iget-object v2, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    const/4 v3, 0x4

    .line 1944
    invoke-virtual {v2, v3}, Lcom/vkontakte/android/NewsEntry;->flag(I)Z

    move-result v2

    iget-object v3, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v3, v3, Lcom/vkontakte/android/NewsEntry;->numLikes:I

    iget-object v4, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v4, v4, Lcom/vkontakte/android/NewsEntry;->numRetweets:I

    iget-object v5, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v5, v5, Lcom/vkontakte/android/NewsEntry;->numViews:I

    iget-object v6, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->likes:Ljava/util/List;

    .line 1942
    invoke-virtual/range {v0 .. v6}, Lcom/vkontakte/android/ui/binder/LikeBarBinder;->bind(ZZIIILjava/util/List;)V

    goto :goto_0
.end method

.method private updateJumpToEndButtonVisibility()V
    .locals 3

    .prologue
    const/4 v1, 0x0

    .line 1928
    iget-boolean v2, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->hideJumpToEndButtonDueToScrollPosition:Z

    if-nez v2, :cond_0

    iget-boolean v2, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->loadCommentsFromBeginning:Z

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->comments:Ljava/util/ArrayList;

    .line 1931
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lez v2, :cond_0

    const/4 v0, 0x1

    .line 1933
    .local v0, "shouldButtonBeVisible":Z
    :goto_0
    iget-object v2, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->jumpToEndBtn:Landroid/view/ViewGroup;

    if-eqz v0, :cond_1

    :goto_1
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 1934
    return-void

    .end local v0    # "shouldButtonBeVisible":Z
    :cond_0
    move v0, v1

    .line 1931
    goto :goto_0

    .line 1933
    .restart local v0    # "shouldButtonBeVisible":Z
    :cond_1
    const/16 v1, 0x8

    goto :goto_1
.end method

.method private waitAndSendComment()V
    .locals 4

    .prologue
    .line 1466
    new-instance v2, Landroid/app/ProgressDialog;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    .line 1467
    .local v2, "progress":Landroid/app/ProgressDialog;
    const v3, 0x7f08033d

    invoke-virtual {p0, v3}, Lcom/vkontakte/android/fragments/PostViewFragment;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 1468
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/app/ProgressDialog;->setCancelable(Z)V

    .line 1469
    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/app/ProgressDialog;->setCanceledOnTouchOutside(Z)V

    .line 1470
    invoke-virtual {v2}, Landroid/app/ProgressDialog;->show()V

    .line 1471
    new-instance v0, Lcom/vkontakte/android/fragments/PostViewFragment$25;

    invoke-direct {v0, p0, v2}, Lcom/vkontakte/android/fragments/PostViewFragment$25;-><init>(Lcom/vkontakte/android/fragments/PostViewFragment;Landroid/app/ProgressDialog;)V

    .line 1478
    .local v0, "onDone":Ljava/lang/Runnable;
    new-instance v1, Lcom/vkontakte/android/fragments/PostViewFragment$26;

    invoke-direct {v1, p0, v2}, Lcom/vkontakte/android/fragments/PostViewFragment$26;-><init>(Lcom/vkontakte/android/fragments/PostViewFragment;Landroid/app/ProgressDialog;)V

    .line 1485
    .local v1, "onFailed":Ljava/lang/Runnable;
    iget-object v3, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->commentBar:Lcom/vkontakte/android/ui/WriteBar;

    invoke-virtual {v3, v0, v1}, Lcom/vkontakte/android/ui/WriteBar;->waitForUploads(Ljava/lang/Runnable;Ljava/lang/Runnable;)V

    .line 1486
    return-void
.end method


# virtual methods
.method public bridge synthetic banUser(Lcom/vkontakte/android/Comment;)V
    .locals 0

    .prologue
    .line 161
    check-cast p1, Lcom/vkontakte/android/NewsComment;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/PostViewFragment;->banUser(Lcom/vkontakte/android/NewsComment;)V

    return-void
.end method

.method public banUser(Lcom/vkontakte/android/NewsComment;)V
    .locals 3
    .param p1, "comment"    # Lcom/vkontakte/android/NewsComment;

    .prologue
    .line 2056
    new-instance v0, Lcom/vkontakte/android/api/groups/GroupsGetBanned;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v1, v1, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    neg-int v1, v1

    iget v2, p1, Lcom/vkontakte/android/NewsComment;->uid:I

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/api/groups/GroupsGetBanned;-><init>(II)V

    new-instance v1, Lcom/vkontakte/android/fragments/PostViewFragment$33;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-direct {v1, p0, v2, p1}, Lcom/vkontakte/android/fragments/PostViewFragment$33;-><init>(Lcom/vkontakte/android/fragments/PostViewFragment;Landroid/content/Context;Lcom/vkontakte/android/NewsComment;)V

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/groups/GroupsGetBanned;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 2090
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 2091
    return-void
.end method

.method public canBanUsers()Z
    .locals 1

    .prologue
    .line 2248
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->canBanUsers:Z

    return v0
.end method

.method protected doLoadData(II)V
    .locals 0
    .param p1, "offset"    # I
    .param p2, "count"    # I

    .prologue
    .line 586
    return-void
.end method

.method protected getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 629
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->adapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    if-nez v0, :cond_0

    .line 630
    new-instance v0, Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    invoke-direct {v0}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->adapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    .line 631
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->adapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    new-instance v1, Lcom/vkontakte/android/fragments/PostViewFragment$NewsAdapter;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/fragments/PostViewFragment$NewsAdapter;-><init>(Lcom/vkontakte/android/fragments/PostViewFragment;)V

    invoke-virtual {v0, v1}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->addAdapter(Lme/grishka/appkit/views/UsableRecyclerView$Adapter;)V

    .line 632
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->adapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    new-instance v1, Lcom/vkontakte/android/fragments/PostViewFragment$ViewListAdapter;

    invoke-direct {v1, p0, v2}, Lcom/vkontakte/android/fragments/PostViewFragment$ViewListAdapter;-><init>(Lcom/vkontakte/android/fragments/PostViewFragment;Lcom/vkontakte/android/fragments/PostViewFragment$1;)V

    invoke-virtual {v0, v1}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->addAdapter(Lme/grishka/appkit/views/UsableRecyclerView$Adapter;)V

    .line 633
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->adapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    new-instance v1, Lcom/vkontakte/android/fragments/PostViewFragment$CommentsAdapter;

    invoke-direct {v1, p0, v2}, Lcom/vkontakte/android/fragments/PostViewFragment$CommentsAdapter;-><init>(Lcom/vkontakte/android/fragments/PostViewFragment;Lcom/vkontakte/android/fragments/PostViewFragment$1;)V

    invoke-virtual {v0, v1}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->addAdapter(Lme/grishka/appkit/views/UsableRecyclerView$Adapter;)V

    .line 635
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->adapter:Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    return-object v0
.end method

.method public getLink()Ljava/lang/String;
    .locals 3
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 1148
    const-string/jumbo v0, "https://vk.com/"

    .line 1149
    .local v0, "ln":Ljava/lang/String;
    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v1, v1, Lcom/vkontakte/android/NewsEntry;->type:I

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v1, v1, Lcom/vkontakte/android/NewsEntry;->type:I

    const/16 v2, 0xc

    if-ne v1, v2, :cond_2

    .line 1150
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "wall"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1158
    :cond_1
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v2, v2, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v2, v2, Lcom/vkontakte/android/NewsEntry;->postID:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1159
    return-object v0

    .line 1151
    :cond_2
    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v1, v1, Lcom/vkontakte/android/NewsEntry;->type:I

    const/4 v2, 0x2

    if-ne v1, v2, :cond_3

    .line 1152
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "video"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 1153
    :cond_3
    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v1, v1, Lcom/vkontakte/android/NewsEntry;->type:I

    const/4 v2, 0x1

    if-ne v1, v2, :cond_4

    .line 1154
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "photo"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 1155
    :cond_4
    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v1, v1, Lcom/vkontakte/android/NewsEntry;->type:I

    const/4 v2, 0x4

    if-ne v1, v2, :cond_1

    .line 1156
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "topic"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public hideEmojiPopup()V
    .locals 1

    .prologue
    .line 2137
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->mKeyboardPopup:Lcom/vkontakte/android/stickers/KeyboardPopup;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->mKeyboardPopup:Lcom/vkontakte/android/stickers/KeyboardPopup;

    invoke-virtual {v0}, Lcom/vkontakte/android/stickers/KeyboardPopup;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2138
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->mKeyboardPopup:Lcom/vkontakte/android/stickers/KeyboardPopup;

    invoke-virtual {v0}, Lcom/vkontakte/android/stickers/KeyboardPopup;->hide()V

    .line 2140
    :cond_0
    return-void
.end method

.method public bridge synthetic likeComment(Lcom/vkontakte/android/Comment;)V
    .locals 0

    .prologue
    .line 161
    check-cast p1, Lcom/vkontakte/android/NewsComment;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/PostViewFragment;->likeComment(Lcom/vkontakte/android/NewsComment;)V

    return-void
.end method

.method public likeComment(Lcom/vkontakte/android/NewsComment;)V
    .locals 8
    .param p1, "comm"    # Lcom/vkontakte/android/NewsComment;

    .prologue
    const/4 v4, 0x0

    .line 1392
    new-instance v0, Lcom/vkontakte/android/api/wall/WallLike;

    iget-boolean v1, p1, Lcom/vkontakte/android/NewsComment;->isLiked:Z

    if-nez v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    iget-object v2, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v2, v2, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    iget v3, p1, Lcom/vkontakte/android/NewsComment;->cid:I

    const/4 v5, 0x5

    iget-object v6, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v6, v6, Lcom/vkontakte/android/NewsEntry;->type:I

    const-string/jumbo v7, ""

    invoke-direct/range {v0 .. v7}, Lcom/vkontakte/android/api/wall/WallLike;-><init>(ZIIZIILjava/lang/String;)V

    const-string/jumbo v1, "ref"

    const-string/jumbo v2, "single"

    .line 1393
    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/api/wall/WallLike;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    new-instance v1, Lcom/vkontakte/android/fragments/PostViewFragment$23;

    invoke-direct {v1, p0, p1}, Lcom/vkontakte/android/fragments/PostViewFragment$23;-><init>(Lcom/vkontakte/android/fragments/PostViewFragment;Lcom/vkontakte/android/NewsComment;)V

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->contentView:Landroid/view/ViewGroup;

    .line 1407
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/view/View;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 1408
    return-void

    :cond_0
    move v1, v4

    .line 1392
    goto :goto_0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 10
    .param p1, "reqCode"    # I
    .param p2, "resCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 906
    invoke-super {p0, p1, p2, p3}, Lcom/vkontakte/android/fragments/VKRecyclerFragment;->onActivityResult(IILandroid/content/Intent;)V

    .line 907
    const/16 v7, 0x2710

    if-le p1, v7, :cond_0

    .line 908
    iget-object v7, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->commentBar:Lcom/vkontakte/android/ui/WriteBar;

    invoke-virtual {v7, p1, p2, p3}, Lcom/vkontakte/android/ui/WriteBar;->onActivityResult(IILandroid/content/Intent;)V

    .line 911
    :cond_0
    const/16 v7, 0x10eb

    if-ne p1, v7, :cond_1

    const/4 v7, -0x1

    if-ne p2, v7, :cond_1

    iget-object v7, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->replyBarController:Lcom/vkontakte/android/ui/controllers/ReplyBarController;

    if-eqz v7, :cond_1

    .line 912
    const-string/jumbo v7, "result_target"

    invoke-virtual {p3, v7}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v5

    check-cast v5, Lcom/vk/sharing/target/Target;

    .line 913
    .local v5, "pickedTarget":Lcom/vk/sharing/target/Target;
    invoke-virtual {v5}, Lcom/vk/sharing/target/Target;->getIsUser()Z

    move-result v7

    const/4 v8, 0x1

    if-ne v7, v8, :cond_6

    .line 915
    const/4 v7, 0x0

    iput v7, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->replyFromGroupId:I

    .line 917
    iget-object v7, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->replyBarController:Lcom/vkontakte/android/ui/controllers/ReplyBarController;

    invoke-virtual {v7}, Lcom/vkontakte/android/ui/controllers/ReplyBarController;->setFromYouAsName()V

    .line 924
    .end local v5    # "pickedTarget":Lcom/vk/sharing/target/Target;
    :cond_1
    :goto_0
    const/16 v7, 0x10e8

    if-ne p1, v7, :cond_3

    const/4 v7, -0x1

    if-eq p2, v7, :cond_2

    const/4 v7, 0x1

    if-ne p2, v7, :cond_3

    .line 925
    :cond_2
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v7

    instance-of v7, v7, Lcom/vkontakte/android/FragmentWrapperActivity;

    if-eqz v7, :cond_3

    .line 926
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v7

    invoke-virtual {v7}, Landroid/app/Activity;->finish()V

    .line 929
    :cond_3
    const/16 v7, 0x10e9

    if-ne p1, v7, :cond_8

    const/4 v7, -0x1

    if-ne p2, v7, :cond_8

    .line 930
    const-string/jumbo v7, "comment"

    invoke-virtual {p3, v7}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/NewsEntry;

    .line 931
    .local v1, "ce":Lcom/vkontakte/android/NewsEntry;
    iget-object v7, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->comments:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_4
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_8

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/NewsComment;

    .line 932
    .local v2, "comm":Lcom/vkontakte/android/NewsComment;
    iget v8, v2, Lcom/vkontakte/android/NewsComment;->cid:I

    iget v9, v1, Lcom/vkontakte/android/NewsEntry;->postID:I

    if-ne v8, v9, :cond_4

    .line 933
    iget-object v7, v1, Lcom/vkontakte/android/NewsEntry;->text:Ljava/lang/String;

    invoke-virtual {v2, v7}, Lcom/vkontakte/android/NewsComment;->setText(Ljava/lang/String;)V

    .line 934
    iget-object v7, v1, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    iput-object v7, v2, Lcom/vkontakte/android/NewsComment;->attachments:Ljava/util/ArrayList;

    .line 935
    sget-object v7, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-virtual {v7}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    invoke-virtual {v7}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v4

    .line 936
    .local v4, "metrics":Landroid/util/DisplayMetrics;
    iget v7, v4, Landroid/util/DisplayMetrics;->widthPixels:I

    iget v8, v4, Landroid/util/DisplayMetrics;->heightPixels:I

    invoke-static {v7, v8}, Ljava/lang/Math;->min(II)I

    move-result v7

    const/high16 v8, 0x42be0000    # 95.0f

    invoke-static {v8}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v8

    sub-int v6, v7, v8

    .line 937
    .local v6, "tSize":I
    const/16 v7, 0x25c

    invoke-static {v6, v7}, Ljava/lang/Math;->min(II)I

    move-result v6

    .line 938
    iget-object v7, v2, Lcom/vkontakte/android/NewsComment;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_5
    :goto_1
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_7

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/attachments/Attachment;

    .line 939
    .local v0, "att":Lcom/vkontakte/android/attachments/Attachment;
    instance-of v8, v0, Lcom/vkontakte/android/attachments/SnippetAttachment;

    if-eqz v8, :cond_5

    .line 940
    check-cast v0, Lcom/vkontakte/android/attachments/SnippetAttachment;

    .end local v0    # "att":Lcom/vkontakte/android/attachments/Attachment;
    const/4 v8, 0x1

    iput-boolean v8, v0, Lcom/vkontakte/android/attachments/SnippetAttachment;->forceSmall:Z

    goto :goto_1

    .line 919
    .end local v1    # "ce":Lcom/vkontakte/android/NewsEntry;
    .end local v2    # "comm":Lcom/vkontakte/android/NewsComment;
    .end local v4    # "metrics":Landroid/util/DisplayMetrics;
    .end local v6    # "tSize":I
    .restart local v5    # "pickedTarget":Lcom/vk/sharing/target/Target;
    :cond_6
    iget v7, v5, Lcom/vk/sharing/target/Target;->id:I

    iput v7, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->replyFromGroupId:I

    .line 920
    iget-object v7, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->replyBarController:Lcom/vkontakte/android/ui/controllers/ReplyBarController;

    iget-object v8, v5, Lcom/vk/sharing/target/Target;->name:Ljava/lang/String;

    invoke-virtual {v7, v8}, Lcom/vkontakte/android/ui/controllers/ReplyBarController;->setFromName(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 943
    .end local v5    # "pickedTarget":Lcom/vk/sharing/target/Target;
    .restart local v1    # "ce":Lcom/vkontakte/android/NewsEntry;
    .restart local v2    # "comm":Lcom/vkontakte/android/NewsComment;
    .restart local v4    # "metrics":Landroid/util/DisplayMetrics;
    .restart local v6    # "tSize":I
    :cond_7
    int-to-float v7, v6

    const v8, 0x3f2a7efa    # 0.666f

    mul-float/2addr v7, v8

    float-to-int v7, v7

    iget-object v8, v2, Lcom/vkontakte/android/NewsComment;->attachments:Ljava/util/ArrayList;

    invoke-static {v6, v7, v8}, Lcom/vkontakte/android/ZhukovLayout;->processThumbs(IILjava/util/List;)V

    .line 945
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->updateList()V

    .line 950
    .end local v1    # "ce":Lcom/vkontakte/android/NewsEntry;
    .end local v2    # "comm":Lcom/vkontakte/android/NewsComment;
    .end local v4    # "metrics":Landroid/util/DisplayMetrics;
    .end local v6    # "tSize":I
    :cond_8
    const/16 v7, 0x10ea

    if-ne p1, v7, :cond_a

    const/4 v7, -0x1

    if-ne p2, v7, :cond_a

    .line 951
    const-string/jumbo v7, "itemID"

    const/4 v8, 0x0

    invoke-virtual {p3, v7, v8}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v3

    .line 952
    .local v3, "id":I
    iget-object v7, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->comments:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_9
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_a

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/NewsComment;

    .line 953
    .restart local v2    # "comm":Lcom/vkontakte/android/NewsComment;
    iget v8, v2, Lcom/vkontakte/android/NewsComment;->cid:I

    if-ne v8, v3, :cond_9

    .line 954
    const/4 v7, 0x1

    iput-boolean v7, v2, Lcom/vkontakte/android/NewsComment;->isReported:Z

    .line 955
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->updateList()V

    .line 960
    .end local v2    # "comm":Lcom/vkontakte/android/NewsComment;
    .end local v3    # "id":I
    :cond_a
    return-void
.end method

.method public onAttach(Landroid/app/Activity;)V
    .locals 10
    .param p1, "act"    # Landroid/app/Activity;

    .prologue
    const/16 v9, 0xc

    const/4 v8, 0x2

    const/4 v4, 0x0

    const/4 v5, 0x1

    .line 431
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/VKRecyclerFragment;->onAttach(Landroid/app/Activity;)V

    .line 433
    const v3, 0x7f0301ea

    invoke-virtual {p0, v3}, Lcom/vkontakte/android/fragments/PostViewFragment;->setListLayoutId(I)V

    .line 435
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v3

    const-string/jumbo v6, "entry"

    invoke-virtual {v3, v6}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v3

    check-cast v3, Lcom/vkontakte/android/NewsEntry;

    iput-object v3, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    .line 436
    iget-object v3, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    if-nez v3, :cond_1

    .line 437
    invoke-virtual {p1}, Landroid/app/Activity;->finish()V

    .line 506
    :cond_0
    :goto_0
    return-void

    .line 440
    :cond_1
    iget-object v3, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v3, v3, Lcom/vkontakte/android/NewsEntry;->userID:I

    if-nez v3, :cond_2

    .line 441
    iget-object v3, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget-object v6, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v6, v6, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    iput v6, v3, Lcom/vkontakte/android/NewsEntry;->userID:I

    .line 444
    :cond_2
    const-string/jumbo v1, ""

    .line 445
    .local v1, "ln":Ljava/lang/String;
    iget-object v3, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v3, v3, Lcom/vkontakte/android/NewsEntry;->type:I

    if-nez v3, :cond_7

    .line 446
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v6, "wall"

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 454
    :cond_3
    :goto_1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v6, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v6, v6, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v6, "_"

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v6, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v6, v6, Lcom/vkontakte/android/NewsEntry;->postID:I

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 455
    invoke-static {p1, v1}, Lcom/vkontakte/android/ActivityUtils;->setBeamLink(Landroid/app/Activity;Ljava/lang/String;)V

    .line 457
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v3

    const-string/jumbo v6, "type"

    invoke-virtual {v3, v6, v4}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v3

    iput v3, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->type:I

    .line 459
    iget-object v3, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v3, v3, Lcom/vkontakte/android/NewsEntry;->type:I

    if-ne v3, v5, :cond_a

    .line 460
    const v3, 0x7f0804a2

    invoke-virtual {p0, v3}, Lcom/vkontakte/android/fragments/PostViewFragment;->setTitle(I)V

    .line 461
    iget-object v3, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget-object v3, v3, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/vkontakte/android/attachments/PhotoAttachment;

    iget-object v3, v3, Lcom/vkontakte/android/attachments/PhotoAttachment;->accessKey:Ljava/lang/String;

    iput-object v3, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->accessKey:Ljava/lang/String;

    .line 469
    :goto_2
    iget-object v3, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v3, v3, Lcom/vkontakte/android/NewsEntry;->type:I

    if-eqz v3, :cond_4

    iget-object v3, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v3, v3, Lcom/vkontakte/android/NewsEntry;->type:I

    if-ne v3, v9, :cond_6

    .line 470
    :cond_4
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v6, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v6, v6, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v6, "_"

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v6, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v6, v6, Lcom/vkontakte/android/NewsEntry;->postID:I

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v6, "|"

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v6, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    invoke-virtual {v6}, Lcom/vkontakte/android/NewsEntry;->getTypeString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v6, "|single|0"

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 471
    .local v2, "postIds":Ljava/lang/String;
    const-string/jumbo v3, "view_post"

    invoke-static {v3}, Lcom/vkontakte/android/data/Analytics;->track(Ljava/lang/String;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v3

    invoke-virtual {v3}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->collapse()Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v3

    invoke-virtual {v3}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->unique()Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v0

    .line 472
    .local v0, "builder":Lcom/vkontakte/android/data/Analytics$EventBuilder;
    iget-object v3, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    invoke-virtual {v3}, Lcom/vkontakte/android/NewsEntry;->hasTrackCode()Z

    move-result v3

    if-eqz v3, :cond_5

    .line 473
    const-string/jumbo v3, "track_code"

    iget-object v6, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    invoke-virtual {v6}, Lcom/vkontakte/android/NewsEntry;->getTrackCode()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v3, v6}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->addParam(Ljava/lang/String;Ljava/lang/Object;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    .line 475
    :cond_5
    const-string/jumbo v3, "post_ids"

    invoke-virtual {v0, v3, v2}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->addParam(Ljava/lang/String;Ljava/lang/Object;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    .line 476
    const-string/jumbo v6, "repost_ids"

    iget-object v3, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    const/16 v7, 0x20

    invoke-virtual {v3, v7}, Lcom/vkontakte/android/NewsEntry;->flag(I)Z

    move-result v3

    if-eqz v3, :cond_c

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v7, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v7, v7, Lcom/vkontakte/android/NewsEntry;->retweetUID:I

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v7, "_"

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v7, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v7, v7, Lcom/vkontakte/android/NewsEntry;->retweetOrigId:I

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    :goto_3
    invoke-virtual {v0, v6, v3}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->addParam(Ljava/lang/String;Ljava/lang/Object;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    .line 477
    invoke-virtual {v0}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->commit()Lcom/vkontakte/android/data/Analytics$EventBuilder;

    .line 480
    .end local v0    # "builder":Lcom/vkontakte/android/data/Analytics$EventBuilder;
    .end local v2    # "postIds":Ljava/lang/String;
    :cond_6
    iget-object v3, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v3, v3, Lcom/vkontakte/android/NewsEntry;->type:I

    if-eq v3, v9, :cond_d

    iget-object v3, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v3, v3, Lcom/vkontakte/android/NewsEntry;->type:I

    if-eqz v3, :cond_d

    iget-object v3, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v3, v3, Lcom/vkontakte/android/NewsEntry;->type:I

    if-eq v3, v5, :cond_d

    iget-object v3, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v3, v3, Lcom/vkontakte/android/NewsEntry;->type:I

    if-eq v3, v8, :cond_d

    .line 481
    invoke-virtual {p1}, Landroid/app/Activity;->finish()V

    goto/16 :goto_0

    .line 447
    :cond_7
    iget-object v3, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v3, v3, Lcom/vkontakte/android/NewsEntry;->type:I

    if-ne v3, v8, :cond_8

    .line 448
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v6, "video"

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_1

    .line 449
    :cond_8
    iget-object v3, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v3, v3, Lcom/vkontakte/android/NewsEntry;->type:I

    if-ne v3, v5, :cond_9

    .line 450
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v6, "photo"

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_1

    .line 451
    :cond_9
    iget-object v3, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v3, v3, Lcom/vkontakte/android/NewsEntry;->type:I

    const/4 v6, 0x4

    if-ne v3, v6, :cond_3

    .line 452
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v6, "topic"

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_1

    .line 462
    :cond_a
    iget-object v3, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v3, v3, Lcom/vkontakte/android/NewsEntry;->type:I

    if-ne v3, v8, :cond_b

    .line 463
    const v3, 0x7f08074b

    invoke-virtual {p0, v3}, Lcom/vkontakte/android/fragments/PostViewFragment;->setTitle(I)V

    .line 464
    iget-object v3, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget-object v3, v3, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/vkontakte/android/attachments/VideoAttachment;

    iget-object v3, v3, Lcom/vkontakte/android/attachments/VideoAttachment;->video:Lcom/vkontakte/android/api/VideoFile;

    iget-object v3, v3, Lcom/vkontakte/android/api/VideoFile;->accessKey:Ljava/lang/String;

    iput-object v3, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->accessKey:Ljava/lang/String;

    goto/16 :goto_2

    .line 466
    :cond_b
    const v3, 0x7f080789

    invoke-virtual {p0, v3}, Lcom/vkontakte/android/fragments/PostViewFragment;->setTitle(I)V

    goto/16 :goto_2

    .line 476
    .restart local v0    # "builder":Lcom/vkontakte/android/data/Analytics$EventBuilder;
    .restart local v2    # "postIds":Ljava/lang/String;
    :cond_c
    const/4 v3, 0x0

    goto/16 :goto_3

    .line 485
    .end local v0    # "builder":Lcom/vkontakte/android/data/Analytics$EventBuilder;
    .end local v2    # "postIds":Ljava/lang/String;
    :cond_d
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v3

    const-string/jumbo v6, "comment"

    invoke-virtual {v3, v6}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v3

    iput v3, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->scrollToComment:I

    .line 486
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v3

    const-string/jumbo v6, "scroll_to_comments"

    invoke-virtual {v3, v6}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v3

    iput-boolean v3, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->scrollToEnd:Z

    .line 487
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v3

    const-string/jumbo v6, "reset_scroll"

    invoke-virtual {v3, v6}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v3

    iput-boolean v3, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->resetScroll:Z

    .line 488
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v3

    const-string/jumbo v6, "load_comments_from_beginning"

    invoke-virtual {v3, v6}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v3

    iput-boolean v3, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->loadCommentsFromBeginning:Z

    .line 489
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v3

    const-string/jumbo v6, "scroll_to_first_comment"

    invoke-virtual {v3, v6}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v3

    iput-boolean v3, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->scrollToFirstComment:Z

    .line 490
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v3

    const-string/jumbo v6, "is_admin"

    invoke-virtual {v3, v6, v4}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    if-nez v3, :cond_e

    iget-object v3, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    const/16 v6, 0x40

    invoke-virtual {v3, v6}, Lcom/vkontakte/android/NewsEntry;->flag(I)Z

    move-result v3

    if-nez v3, :cond_e

    iget-object v3, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v3, v3, Lcom/vkontakte/android/NewsEntry;->userID:I

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v6

    .line 491
    invoke-virtual {v6}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v6

    if-eq v3, v6, :cond_e

    iget-object v3, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v3, v3, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    .line 492
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v6

    .line 493
    invoke-virtual {v6}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v6

    if-eq v3, v6, :cond_e

    iget-object v3, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v3, v3, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    if-eqz v3, :cond_e

    iget-object v3, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v3, v3, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    neg-int v3, v3

    invoke-static {v3}, Lcom/vkontakte/android/data/Groups;->getAdminLevel(I)I

    move-result v3

    if-lt v3, v5, :cond_10

    :cond_e
    move v3, v5

    :goto_4
    iput-boolean v3, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->canAdmin:Z

    .line 495
    invoke-virtual {p0, v5}, Lcom/vkontakte/android/fragments/PostViewFragment;->setHasOptionsMenu(Z)V

    .line 496
    iget-object v3, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->preloader:Lme/grishka/appkit/utils/Preloader;

    invoke-virtual {v3, v4}, Lme/grishka/appkit/utils/Preloader;->setMoreAvailable(Z)V

    .line 497
    iput-boolean v5, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->loaded:Z

    .line 499
    iget-object v3, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v3, v3, Lcom/vkontakte/android/NewsEntry;->type:I

    if-ne v3, v8, :cond_f

    .line 500
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->loadVideoInfo()V

    .line 503
    :cond_f
    iget-object v3, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v3, v3, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    if-gez v3, :cond_0

    iget-object v3, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v3, v3, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    neg-int v3, v3

    invoke-static {v3}, Lcom/vkontakte/android/data/Groups;->getAdminLevel(I)I

    move-result v3

    if-lt v3, v5, :cond_0

    .line 504
    iput-boolean v5, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->canBanUsers:Z

    goto/16 :goto_0

    :cond_10
    move v3, v4

    .line 493
    goto :goto_4
.end method

.method public onBackPressed()Z
    .locals 1

    .prologue
    .line 2144
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->mKeyboardPopup:Lcom/vkontakte/android/stickers/KeyboardPopup;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->mKeyboardPopup:Lcom/vkontakte/android/stickers/KeyboardPopup;

    invoke-virtual {v0}, Lcom/vkontakte/android/stickers/KeyboardPopup;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2145
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->hideEmojiPopup()V

    .line 2146
    const/4 v0, 0x1

    .line 2148
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onBackspace()V
    .locals 4

    .prologue
    .line 267
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->commentBar:Lcom/vkontakte/android/ui/WriteBar;

    const v1, 0x7f1005c7

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/WriteBar;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v1, Landroid/view/KeyEvent;

    const/4 v2, 0x0

    const/16 v3, 0x43

    invoke-direct {v1, v2, v3}, Landroid/view/KeyEvent;-><init>(II)V

    invoke-virtual {v0, v1}, Landroid/view/View;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    .line 268
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 6
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const/16 v5, 0x8

    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 657
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v3

    packed-switch v3, :pswitch_data_0

    .line 677
    :cond_0
    :goto_0
    :pswitch_0
    return-void

    .line 659
    :pswitch_1
    iget-object v3, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    invoke-virtual {v3, v5}, Lcom/vkontakte/android/NewsEntry;->flag(I)Z

    move-result v3

    if-nez v3, :cond_1

    :goto_1
    invoke-direct {p0, v1}, Lcom/vkontakte/android/fragments/PostViewFragment;->like(Z)V

    goto :goto_0

    :cond_1
    move v1, v2

    goto :goto_1

    .line 662
    :pswitch_2
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->repost()V

    goto :goto_0

    .line 665
    :pswitch_3
    iget-object v3, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v4, v3, Lcom/vkontakte/android/NewsEntry;->numLikes:I

    iget-object v3, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    invoke-virtual {v3, v5}, Lcom/vkontakte/android/NewsEntry;->flag(I)Z

    move-result v3

    if-eqz v3, :cond_3

    move v3, v1

    :goto_2
    sub-int v3, v4, v3

    if-nez v3, :cond_2

    iget-object v3, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v3, v3, Lcom/vkontakte/android/NewsEntry;->numRetweets:I

    iget-object v4, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    const/4 v5, 0x4

    .line 666
    invoke-virtual {v4, v5}, Lcom/vkontakte/android/NewsEntry;->flag(I)Z

    move-result v4

    if-eqz v4, :cond_4

    :goto_3
    sub-int v1, v3, v1

    if-eqz v1, :cond_0

    .line 669
    :cond_2
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 670
    .local v0, "args":Landroid/os/Bundle;
    const-string/jumbo v1, "title"

    const v2, 0x7f080337

    invoke-virtual {p0, v2}, Lcom/vkontakte/android/fragments/PostViewFragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putCharSequence(Ljava/lang/String;Ljava/lang/CharSequence;)V

    .line 671
    const-string/jumbo v1, "ltype"

    iget-object v2, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v2, v2, Lcom/vkontakte/android/NewsEntry;->type:I

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 672
    const-string/jumbo v1, "oid"

    iget-object v2, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v2, v2, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 673
    const-string/jumbo v1, "item_id"

    iget-object v2, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v2, v2, Lcom/vkontakte/android/NewsEntry;->postID:I

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 674
    const-class v1, Lcom/vkontakte/android/fragments/LikesListFragment;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-static {v1, v0, v2}, Lcom/vkontakte/android/navigation/Navigate;->to(Ljava/lang/Class;Landroid/os/Bundle;Landroid/content/Context;)V

    goto :goto_0

    .end local v0    # "args":Landroid/os/Bundle;
    :cond_3
    move v3, v2

    .line 665
    goto :goto_2

    :cond_4
    move v1, v2

    .line 666
    goto :goto_3

    .line 657
    :pswitch_data_0
    .packed-switch 0x7f1004c8
        :pswitch_3
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 2
    .param p1, "cfg"    # Landroid/content/res/Configuration;

    .prologue
    .line 645
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/VKRecyclerFragment;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 646
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->updateList()V

    .line 647
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->mKeyboardPopup:Lcom/vkontakte/android/stickers/KeyboardPopup;

    if-eqz v0, :cond_0

    .line 648
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->mKeyboardPopup:Lcom/vkontakte/android/stickers/KeyboardPopup;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/stickers/KeyboardPopup;->show(Z)V

    .line 650
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->mKeyboardPopup:Lcom/vkontakte/android/stickers/KeyboardPopup;

    invoke-virtual {v0}, Lcom/vkontakte/android/stickers/KeyboardPopup;->notifyLayoutHasChanged()V

    .line 651
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->mStickersView:Lcom/vkontakte/android/stickers/StickersView;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/stickers/StickersView;->dispatchConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 653
    :cond_0
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 13
    .param p1, "s"    # Landroid/os/Bundle;

    .prologue
    const/4 v5, 0x0

    const/4 v3, 0x1

    const/4 v1, 0x0

    .line 509
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/VKRecyclerFragment;->onCreate(Landroid/os/Bundle;)V

    .line 510
    new-instance v10, Landroid/content/IntentFilter;

    invoke-direct {v10}, Landroid/content/IntentFilter;-><init>()V

    .line 511
    .local v10, "filter":Landroid/content/IntentFilter;
    const-string/jumbo v0, "com.vkontakte.android.POST_UPDATED"

    invoke-virtual {v10, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 512
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    iget-object v4, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->receiver:Landroid/content/BroadcastReceiver;

    const-string/jumbo v6, "com.vkontakte.android.permission.ACCESS_DATA"

    invoke-virtual {v0, v4, v10, v6, v5}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;)Landroid/content/Intent;

    .line 513
    new-instance v10, Landroid/content/IntentFilter;

    .end local v10    # "filter":Landroid/content/IntentFilter;
    invoke-direct {v10}, Landroid/content/IntentFilter;-><init>()V

    .line 514
    .restart local v10    # "filter":Landroid/content/IntentFilter;
    sget-object v0, Lcom/vkontakte/android/data/GroupsAdmin;->ACTION_BAN_ADDED:Ljava/lang/String;

    invoke-virtual {v10, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 515
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-static {v0}, Landroid/support/v4/content/LocalBroadcastManager;->getInstance(Landroid/content/Context;)Landroid/support/v4/content/LocalBroadcastManager;

    move-result-object v0

    iget-object v4, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->receiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v4, v10}, Landroid/support/v4/content/LocalBroadcastManager;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)V

    .line 517
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v0, v0, Lcom/vkontakte/android/NewsEntry;->type:I

    if-ne v0, v3, :cond_0

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v4, "tag_id"

    invoke-virtual {v0, v4}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 518
    iget-object v4, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->postItems:Ljava/util/ArrayList;

    new-instance v6, Lcom/vkontakte/android/ui/posts/TagConfirmationPostDisplayItem;

    iget-object v7, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    .line 519
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v8, "placer_profile"

    invoke-virtual {v0, v8}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/UserProfile;

    .line 520
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v8

    const-string/jumbo v12, "tag_id"

    invoke-virtual {v8, v12}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v8

    new-instance v12, Lcom/vkontakte/android/fragments/PostViewFragment$3;

    invoke-direct {v12, p0}, Lcom/vkontakte/android/fragments/PostViewFragment$3;-><init>(Lcom/vkontakte/android/fragments/PostViewFragment;)V

    invoke-direct {v6, v7, v0, v8, v12}, Lcom/vkontakte/android/ui/posts/TagConfirmationPostDisplayItem;-><init>(Lcom/vkontakte/android/NewsEntry;Lcom/vkontakte/android/UserProfile;ILjava/lang/Runnable;)V

    .line 518
    invoke-virtual {v4, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 531
    :cond_0
    const/4 v11, 0x0

    .line 532
    .local v11, "thumbCount":I
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget-object v0, v0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_1
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/vkontakte/android/attachments/Attachment;

    .line 533
    .local v9, "a":Lcom/vkontakte/android/attachments/Attachment;
    instance-of v0, v9, Lcom/vkontakte/android/attachments/PollAttachment;

    if-eqz v0, :cond_2

    move-object v0, v9

    .line 534
    check-cast v0, Lcom/vkontakte/android/attachments/PollAttachment;

    iget-object v6, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iput-object v6, v0, Lcom/vkontakte/android/attachments/PollAttachment;->parentPost:Lcom/vkontakte/android/NewsEntry;

    .line 536
    :cond_2
    instance-of v0, v9, Lcom/vkontakte/android/attachments/ThumbAttachment;

    if-eqz v0, :cond_1

    .line 537
    add-int/lit8 v11, v11, 0x1

    goto :goto_0

    .line 540
    .end local v9    # "a":Lcom/vkontakte/android/attachments/Attachment;
    :cond_3
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget-object v0, v0, Lcom/vkontakte/android/NewsEntry;->repostAttachments:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_4
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_5

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/vkontakte/android/attachments/Attachment;

    .line 541
    .restart local v9    # "a":Lcom/vkontakte/android/attachments/Attachment;
    instance-of v4, v9, Lcom/vkontakte/android/attachments/PollAttachment;

    if-eqz v4, :cond_4

    .line 542
    check-cast v9, Lcom/vkontakte/android/attachments/PollAttachment;

    .end local v9    # "a":Lcom/vkontakte/android/attachments/Attachment;
    iget-object v4, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iput-object v4, v9, Lcom/vkontakte/android/attachments/PollAttachment;->parentPost:Lcom/vkontakte/android/NewsEntry;

    goto :goto_1

    .line 545
    :cond_5
    const/4 v0, 0x3

    if-le v11, v0, :cond_7

    .line 546
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    invoke-virtual {v0}, Lcom/vkontakte/android/NewsEntry;->layoutThumbs()V

    .line 560
    :cond_6
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v4, "referer"

    const-string/jumbo v6, "news"

    invoke-virtual {v0, v4, v6}, Landroid/os/Bundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 561
    .local v2, "referer":Ljava/lang/String;
    iget-object v12, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->postItems:Ljava/util/ArrayList;

    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    const-string/jumbo v7, "single"

    move v4, v1

    move v6, v1

    move v8, v1

    invoke-static/range {v0 .. v8}, Lcom/vkontakte/android/data/Posts;->buildItems(Lcom/vkontakte/android/NewsEntry;ZLjava/lang/String;ZZLandroid/view/View$OnClickListener;ZLjava/lang/String;I)Ljava/util/List;

    move-result-object v0

    invoke-virtual {v12, v0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 562
    return-void

    .line 548
    .end local v2    # "referer":Ljava/lang/String;
    :cond_7
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget-object v0, v0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_8
    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_9

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/vkontakte/android/attachments/Attachment;

    .line 549
    .restart local v9    # "a":Lcom/vkontakte/android/attachments/Attachment;
    instance-of v4, v9, Lcom/vkontakte/android/attachments/ThumbAttachment;

    if-eqz v4, :cond_8

    .line 550
    invoke-static {v9}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    invoke-static {v4}, Lcom/vkontakte/android/NewsEntry;->layoutThumbs(Ljava/util/List;)V

    goto :goto_2

    .line 553
    .end local v9    # "a":Lcom/vkontakte/android/attachments/Attachment;
    :cond_9
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget-object v0, v0, Lcom/vkontakte/android/NewsEntry;->repostAttachments:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_a
    :goto_3
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_6

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/vkontakte/android/attachments/Attachment;

    .line 554
    .restart local v9    # "a":Lcom/vkontakte/android/attachments/Attachment;
    instance-of v4, v9, Lcom/vkontakte/android/attachments/ThumbAttachment;

    if-eqz v4, :cond_a

    .line 555
    invoke-static {v9}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    invoke-static {v4}, Lcom/vkontakte/android/NewsEntry;->layoutThumbs(Ljava/util/List;)V

    goto :goto_3
.end method

.method public onCreateContentView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 9
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v8, -0x2

    const/high16 v7, 0x40c00000    # 6.0f

    const/high16 v6, 0x40000000    # 2.0f

    .line 400
    invoke-super {p0, p1, p2, p3}, Lcom/vkontakte/android/fragments/VKRecyclerFragment;->onCreateContentView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    move-result-object v0

    .line 402
    .local v0, "contentView":Landroid/view/View;
    const v3, 0x7f1001a9

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    .line 404
    .local v2, "wrap":Landroid/view/ViewGroup;
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    const v4, 0x7f030115

    const/4 v5, 0x0

    invoke-static {v3, v4, v5}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/view/ViewGroup;

    iput-object v3, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->jumpToEndBtn:Landroid/view/ViewGroup;

    .line 405
    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    const v3, 0x800055

    invoke-direct {v1, v8, v8, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    .line 408
    .local v1, "layoutParams":Landroid/widget/FrameLayout$LayoutParams;
    invoke-static {v7}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v3

    invoke-static {v6}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v4

    invoke-static {v7}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v5

    invoke-static {v6}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v6

    invoke-virtual {v1, v3, v4, v5, v6}, Landroid/widget/FrameLayout$LayoutParams;->setMargins(IIII)V

    .line 409
    iget-object v3, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->jumpToEndBtn:Landroid/view/ViewGroup;

    invoke-virtual {v2, v3, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 410
    iget-object v3, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->jumpToEndBtn:Landroid/view/ViewGroup;

    const/16 v4, 0x8

    invoke-virtual {v3, v4}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 411
    iget-object v3, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->jumpToEndBtn:Landroid/view/ViewGroup;

    new-instance v4, Lcom/vkontakte/android/fragments/PostViewFragment$2;

    invoke-direct {v4, p0}, Lcom/vkontakte/android/fragments/PostViewFragment$2;-><init>(Lcom/vkontakte/android/fragments/PostViewFragment;)V

    invoke-virtual {v3, v4}, Landroid/view/ViewGroup;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 418
    return-object v0
.end method

.method protected onCreateFooterView(Landroid/view/LayoutInflater;)Landroid/view/View;
    .locals 1
    .param p1, "inflater"    # Landroid/view/LayoutInflater;

    .prologue
    .line 640
    const/4 v0, 0x0

    return-object v0
.end method

.method protected onCreateLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;
    .locals 2

    .prologue
    .line 370
    new-instance v0, Lcom/vkontakte/android/fragments/PostViewFragment$GridLayoutManagerWithSmoothScroller;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vkontakte/android/fragments/PostViewFragment$GridLayoutManagerWithSmoothScroller;-><init>(Landroid/content/Context;)V

    return-object v0
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V
    .locals 12
    .param p1, "menu"    # Landroid/view/Menu;
    .param p2, "inflater"    # Landroid/view/MenuInflater;

    .prologue
    .line 964
    const v8, 0x7f110016

    invoke-virtual {p2, v8, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 965
    iget-boolean v8, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->canAdmin:Z

    if-eqz v8, :cond_8

    .line 966
    iget-object v8, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v8, v8, Lcom/vkontakte/android/NewsEntry;->type:I

    if-eqz v8, :cond_0

    .line 967
    const v8, 0x7f1005f0

    invoke-interface {p1, v8}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v8

    const/4 v9, 0x0

    invoke-interface {v8, v9}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 969
    :cond_0
    iget-object v8, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v8, v8, Lcom/vkontakte/android/NewsEntry;->type:I

    if-eqz v8, :cond_5

    .line 970
    const v8, 0x7f1005f0

    invoke-interface {p1, v8}, Landroid/view/Menu;->removeItem(I)V

    .line 980
    :cond_1
    :goto_0
    const v8, 0x7f100605

    invoke-interface {p1, v8}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v8

    iget-object v9, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    const/16 v10, 0x20

    invoke-virtual {v9, v10}, Lcom/vkontakte/android/NewsEntry;->flag(I)Z

    move-result v9

    invoke-interface {v8, v9}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 981
    const v8, 0x7f1005f4

    invoke-interface {p1, v8}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v9

    .line 982
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v8

    invoke-virtual {v8}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v8

    if-lez v8, :cond_9

    iget-object v8, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v8, v8, Lcom/vkontakte/android/NewsEntry;->userID:I

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v10

    .line 983
    invoke-virtual {v10}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v10

    if-eq v8, v10, :cond_9

    iget-object v8, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    const/16 v10, 0x1000

    invoke-virtual {v8, v10}, Lcom/vkontakte/android/NewsEntry;->flag(I)Z

    move-result v8

    if-nez v8, :cond_9

    iget-object v8, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    const/16 v10, 0x800

    .line 984
    invoke-virtual {v8, v10}, Lcom/vkontakte/android/NewsEntry;->flag(I)Z

    move-result v8

    if-nez v8, :cond_9

    const/4 v8, 0x1

    .line 982
    :goto_1
    invoke-interface {v9, v8}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 985
    const v8, 0x7f100604

    invoke-interface {p1, v8}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v8

    iget-object v9, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    const/16 v10, 0x800

    invoke-virtual {v9, v10}, Lcom/vkontakte/android/NewsEntry;->flag(I)Z

    move-result v9

    invoke-interface {v8, v9}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 986
    const v8, 0x7f100606

    invoke-interface {p1, v8}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v8

    iget-object v9, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    const/high16 v10, 0x10000

    invoke-virtual {v9, v10}, Lcom/vkontakte/android/NewsEntry;->flag(I)Z

    move-result v9

    invoke-interface {v8, v9}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 987
    const v8, 0x7f100606

    invoke-interface {p1, v8}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v9

    iget-object v8, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    const/16 v10, 0x400

    invoke-virtual {v8, v10}, Lcom/vkontakte/android/NewsEntry;->flag(I)Z

    move-result v8

    if-eqz v8, :cond_a

    const v8, 0x7f08051f

    :goto_2
    invoke-interface {v9, v8}, Landroid/view/MenuItem;->setTitle(I)Landroid/view/MenuItem;

    .line 988
    iget-object v8, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v8, v8, Lcom/vkontakte/android/NewsEntry;->type:I

    const/4 v9, 0x2

    if-ne v8, v9, :cond_d

    .line 989
    const v8, 0x7f1000b0

    invoke-interface {p1, v8}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    .line 991
    .local v0, "add":Landroid/view/MenuItem;
    iget-object v8, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget-object v8, v8, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    if-eqz v8, :cond_b

    iget-object v8, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget-object v8, v8, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v8}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_b

    iget-object v8, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget-object v8, v8, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    const/4 v9, 0x0

    invoke-virtual {v8, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/vkontakte/android/attachments/Attachment;

    :goto_3
    check-cast v8, Lcom/vkontakte/android/attachments/VideoAttachment;

    move-object v5, v8

    check-cast v5, Lcom/vkontakte/android/attachments/VideoAttachment;

    .line 992
    .local v5, "va":Lcom/vkontakte/android/attachments/VideoAttachment;
    const/4 v2, 0x1

    .line 993
    .local v2, "canAdd":Z
    if-eqz v5, :cond_2

    iget-object v8, v5, Lcom/vkontakte/android/attachments/VideoAttachment;->video:Lcom/vkontakte/android/api/VideoFile;

    if-eqz v8, :cond_2

    .line 994
    iget-object v8, v5, Lcom/vkontakte/android/attachments/VideoAttachment;->video:Lcom/vkontakte/android/api/VideoFile;

    iget-boolean v2, v8, Lcom/vkontakte/android/api/VideoFile;->canAdd:Z

    .line 997
    :cond_2
    iget-object v8, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v8, v8, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v9

    invoke-virtual {v9}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v9

    if-eq v8, v9, :cond_c

    if-eqz v2, :cond_c

    const/4 v8, 0x1

    :goto_4
    invoke-interface {v0, v8}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 998
    const v8, 0x7f100004

    invoke-interface {p1, v8}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v8

    invoke-interface {v8, v2}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 1003
    .end local v0    # "add":Landroid/view/MenuItem;
    .end local v2    # "canAdd":Z
    .end local v5    # "va":Lcom/vkontakte/android/attachments/VideoAttachment;
    :goto_5
    const/4 v7, 0x0

    .line 1004
    .local v7, "youtube":Z
    iget-object v8, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    if-eqz v8, :cond_3

    iget-object v8, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget-object v8, v8, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    if-eqz v8, :cond_3

    iget-object v8, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget-object v8, v8, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v8

    const/4 v9, 0x1

    if-ne v8, v9, :cond_3

    .line 1005
    iget-object v8, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget-object v8, v8, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    const/4 v9, 0x0

    invoke-virtual {v8, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/attachments/Attachment;

    .line 1006
    .local v1, "attachment":Lcom/vkontakte/android/attachments/Attachment;
    instance-of v8, v1, Lcom/vkontakte/android/attachments/VideoAttachment;

    if-eqz v8, :cond_3

    .line 1007
    check-cast v1, Lcom/vkontakte/android/attachments/VideoAttachment;

    .end local v1    # "attachment":Lcom/vkontakte/android/attachments/Attachment;
    iget-object v6, v1, Lcom/vkontakte/android/attachments/VideoAttachment;->video:Lcom/vkontakte/android/api/VideoFile;

    .line 1008
    .local v6, "video":Lcom/vkontakte/android/api/VideoFile;
    invoke-virtual {v6}, Lcom/vkontakte/android/api/VideoFile;->isExternal()Z

    move-result v8

    if-eqz v8, :cond_3

    const-string/jumbo v8, "YouTube"

    iget-object v9, v6, Lcom/vkontakte/android/api/VideoFile;->platform:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 1009
    const/4 v7, 0x1

    .line 1013
    .end local v6    # "video":Lcom/vkontakte/android/api/VideoFile;
    :cond_3
    if-eqz v7, :cond_4

    .line 1014
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_6
    invoke-interface {p1}, Landroid/view/Menu;->size()I

    move-result v8

    if-ge v3, v8, :cond_4

    .line 1015
    invoke-interface {p1, v3}, Landroid/view/Menu;->getItem(I)Landroid/view/MenuItem;

    move-result-object v4

    .line 1016
    .local v4, "item":Landroid/view/MenuItem;
    invoke-interface {v4}, Landroid/view/MenuItem;->isVisible()Z

    move-result v8

    if-eqz v8, :cond_e

    .line 1017
    const/4 v8, 0x0

    const v9, 0x7f100090

    invoke-interface {v4}, Landroid/view/MenuItem;->getOrder()I

    move-result v10

    add-int/lit8 v10, v10, 0x1

    const v11, 0x7f080486

    invoke-interface {p1, v8, v9, v10, v11}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    .line 1022
    .end local v3    # "i":I
    .end local v4    # "item":Landroid/view/MenuItem;
    :cond_4
    return-void

    .line 972
    .end local v7    # "youtube":Z
    :cond_5
    iget-object v8, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v8, v8, Lcom/vkontakte/android/NewsEntry;->time:I

    invoke-static {}, Lcom/vkontakte/android/TimeUtils;->getCurrentTime()I

    move-result v9

    const v10, 0x15180

    sub-int/2addr v9, v10

    if-ge v8, v9, :cond_6

    iget-object v8, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    const/16 v9, 0x1000

    invoke-virtual {v8, v9}, Lcom/vkontakte/android/NewsEntry;->flag(I)Z

    move-result v8

    if-eqz v8, :cond_7

    :cond_6
    iget-object v8, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    const/16 v9, 0x80

    invoke-virtual {v8, v9}, Lcom/vkontakte/android/NewsEntry;->flag(I)Z

    move-result v8

    if-nez v8, :cond_1

    .line 973
    :cond_7
    const v8, 0x7f1005f0

    invoke-interface {p1, v8}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v8

    const/4 v9, 0x0

    invoke-interface {v8, v9}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    goto/16 :goto_0

    .line 977
    :cond_8
    const v8, 0x7f1005f0

    invoke-interface {p1, v8}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v8

    const/4 v9, 0x0

    invoke-interface {v8, v9}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 978
    const v8, 0x7f1005e8

    invoke-interface {p1, v8}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v8

    const/4 v9, 0x0

    invoke-interface {v8, v9}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    goto/16 :goto_0

    .line 984
    :cond_9
    const/4 v8, 0x0

    goto/16 :goto_1

    .line 987
    :cond_a
    const v8, 0x7f08050d

    goto/16 :goto_2

    .line 991
    .restart local v0    # "add":Landroid/view/MenuItem;
    :cond_b
    const/4 v8, 0x0

    goto/16 :goto_3

    .line 997
    .restart local v2    # "canAdd":Z
    .restart local v5    # "va":Lcom/vkontakte/android/attachments/VideoAttachment;
    :cond_c
    const/4 v8, 0x0

    goto/16 :goto_4

    .line 1000
    .end local v0    # "add":Landroid/view/MenuItem;
    .end local v2    # "canAdd":Z
    .end local v5    # "va":Lcom/vkontakte/android/attachments/VideoAttachment;
    :cond_d
    const v8, 0x7f1000b0

    invoke-interface {p1, v8}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v8

    const/4 v9, 0x0

    invoke-interface {v8, v9}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 1001
    const v8, 0x7f100004

    invoke-interface {p1, v8}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v8

    const/4 v9, 0x0

    invoke-interface {v8, v9}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    goto/16 :goto_5

    .line 1014
    .restart local v3    # "i":I
    .restart local v4    # "item":Landroid/view/MenuItem;
    .restart local v7    # "youtube":Z
    :cond_e
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_6
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 13
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 681
    iget-object v8, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->views:Ljava/util/ArrayList;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v9

    const v10, 0x7f0301b6

    const/4 v11, 0x0

    invoke-static {v9, v10, v11}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v9

    iput-object v9, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->likesView:Landroid/view/View;

    invoke-virtual {v8, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 682
    iget-object v9, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->views:Ljava/util/ArrayList;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v8

    const v10, 0x7f0300f9

    const/4 v11, 0x0

    invoke-static {v8, v10, v11}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v8

    check-cast v8, Lcom/vkontakte/android/LoadMoreCommentsView;

    iput-object v8, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->loadMoreView:Lcom/vkontakte/android/LoadMoreCommentsView;

    invoke-virtual {v9, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 683
    iget-object v8, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->views:Ljava/util/ArrayList;

    iget-object v9, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->loadMoreView:Lcom/vkontakte/android/LoadMoreCommentsView;

    invoke-virtual {v8, v9}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 684
    iget-object v8, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->likesView:Landroid/view/View;

    const/4 v9, 0x1

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v8, v9}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 685
    iget-object v8, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->loadMoreView:Lcom/vkontakte/android/LoadMoreCommentsView;

    const/4 v9, 0x2

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v8, v9}, Lcom/vkontakte/android/LoadMoreCommentsView;->setTag(Ljava/lang/Object;)V

    .line 686
    const v8, 0x7f030099

    const/4 v9, 0x0

    invoke-virtual {p1, v8, v9}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v8

    check-cast v8, Lcom/vkontakte/android/ui/ErrorView;

    iput-object v8, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->error:Lcom/vkontakte/android/ui/ErrorView;

    .line 687
    iget-object v8, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->error:Lcom/vkontakte/android/ui/ErrorView;

    const/4 v9, 0x1

    invoke-virtual {v8, v9}, Lcom/vkontakte/android/ui/ErrorView;->setIsInline(Z)V

    .line 688
    iget-object v8, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->error:Lcom/vkontakte/android/ui/ErrorView;

    new-instance v9, Lcom/vkontakte/android/fragments/PostViewFragment$4;

    invoke-direct {v9, p0}, Lcom/vkontakte/android/fragments/PostViewFragment$4;-><init>(Lcom/vkontakte/android/fragments/PostViewFragment;)V

    invoke-virtual {v8, v9}, Lcom/vkontakte/android/ui/ErrorView;->setOnRetryListener(Landroid/view/View$OnClickListener;)V

    .line 695
    new-instance v8, Lcom/vkontakte/android/ui/binder/LikeBarBinder;

    iget-object v9, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->likesView:Landroid/view/View;

    invoke-direct {v8, v9}, Lcom/vkontakte/android/ui/binder/LikeBarBinder;-><init>(Landroid/view/View;)V

    iput-object v8, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->likeBarBinder:Lcom/vkontakte/android/ui/binder/LikeBarBinder;

    .line 696
    iget-object v8, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->likeBarBinder:Lcom/vkontakte/android/ui/binder/LikeBarBinder;

    iget-object v8, v8, Lcom/vkontakte/android/ui/binder/LikeBarBinder;->likesContainer:Landroid/view/View;

    invoke-virtual {v8, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 697
    iget-object v8, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->likeBarBinder:Lcom/vkontakte/android/ui/binder/LikeBarBinder;

    iget-object v8, v8, Lcom/vkontakte/android/ui/binder/LikeBarBinder;->likesCounterView:Landroid/widget/TextView;

    invoke-virtual {v8, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 698
    iget-object v8, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->likeBarBinder:Lcom/vkontakte/android/ui/binder/LikeBarBinder;

    iget-object v8, v8, Lcom/vkontakte/android/ui/binder/LikeBarBinder;->repostsCounterView:Landroid/widget/TextView;

    invoke-virtual {v8, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 700
    iget-object v8, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    const/16 v9, 0x800

    invoke-virtual {v8, v9}, Lcom/vkontakte/android/NewsEntry;->flag(I)Z

    move-result v8

    if-nez v8, :cond_0

    iget-object v8, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    const/16 v9, 0x1000

    invoke-virtual {v8, v9}, Lcom/vkontakte/android/NewsEntry;->flag(I)Z

    move-result v8

    if-nez v8, :cond_0

    .line 701
    new-instance v8, Landroid/widget/FrameLayout;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v9

    invoke-direct {v8, v9}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iput-object v8, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->commentsProgress:Landroid/widget/FrameLayout;

    .line 702
    new-instance v2, Landroid/widget/ProgressBar;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v8

    invoke-direct {v2, v8}, Landroid/widget/ProgressBar;-><init>(Landroid/content/Context;)V

    .line 703
    .local v2, "progress":Landroid/widget/ProgressBar;
    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    const/high16 v8, 0x41f00000    # 30.0f

    invoke-static {v8}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v8

    const/high16 v9, 0x41f00000    # 30.0f

    invoke-static {v9}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v9

    invoke-direct {v1, v8, v9}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 704
    .local v1, "params":Landroid/widget/FrameLayout$LayoutParams;
    const/4 v8, 0x1

    iput v8, v1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 705
    invoke-virtual {v2, v1}, Landroid/widget/ProgressBar;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 706
    iget-object v8, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->commentsProgress:Landroid/widget/FrameLayout;

    invoke-virtual {v8, v2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 707
    iget-object v8, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->commentsProgress:Landroid/widget/FrameLayout;

    const/4 v9, 0x0

    const/high16 v10, 0x41800000    # 16.0f

    invoke-static {v10}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v10

    const/4 v11, 0x0

    const/high16 v12, 0x41800000    # 16.0f

    invoke-static {v12}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v12

    invoke-virtual {v8, v9, v10, v11, v12}, Landroid/widget/FrameLayout;->setPadding(IIII)V

    .line 708
    iget-object v8, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->commentsProgress:Landroid/widget/FrameLayout;

    const/4 v9, 0x3

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v8, v9}, Landroid/widget/FrameLayout;->setTag(Ljava/lang/Object;)V

    .line 709
    iget-object v8, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->commentsProgress:Landroid/widget/FrameLayout;

    const v9, 0x7f1001a3

    invoke-virtual {v8, v9}, Landroid/widget/FrameLayout;->setId(I)V

    .line 712
    .end local v1    # "params":Landroid/widget/FrameLayout$LayoutParams;
    .end local v2    # "progress":Landroid/widget/ProgressBar;
    :cond_0
    iget-object v8, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->loadMoreView:Lcom/vkontakte/android/LoadMoreCommentsView;

    new-instance v9, Landroid/widget/AbsListView$LayoutParams;

    const/4 v10, -0x1

    const/high16 v11, 0x42420000    # 48.5f

    invoke-static {v11}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v11

    invoke-direct {v9, v10, v11}, Landroid/widget/AbsListView$LayoutParams;-><init>(II)V

    invoke-virtual {v8, v9}, Lcom/vkontakte/android/LoadMoreCommentsView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 713
    iget-object v8, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->loadMoreView:Lcom/vkontakte/android/LoadMoreCommentsView;

    new-instance v9, Lcom/vkontakte/android/fragments/PostViewFragment$5;

    invoke-direct {v9, p0}, Lcom/vkontakte/android/fragments/PostViewFragment$5;-><init>(Lcom/vkontakte/android/fragments/PostViewFragment;)V

    invoke-virtual {v8, v9}, Lcom/vkontakte/android/LoadMoreCommentsView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 722
    invoke-super/range {p0 .. p3}, Lcom/vkontakte/android/fragments/VKRecyclerFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    move-result-object v6

    .line 723
    .local v6, "view":Landroid/view/View;
    new-instance v7, Lcom/vkontakte/android/fragments/PostViewFragment$6;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v8

    invoke-direct {v7, p0, v8}, Lcom/vkontakte/android/fragments/PostViewFragment$6;-><init>(Lcom/vkontakte/android/fragments/PostViewFragment;Landroid/content/Context;)V

    .line 729
    .local v7, "wrap":Landroid/widget/LinearLayout;
    const/4 v8, 0x1

    invoke-virtual {v7, v8}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 730
    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v9, -0x1

    const/4 v10, -0x1

    const/high16 v11, 0x3f800000    # 1.0f

    invoke-direct {v8, v9, v10, v11}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v7, v6, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 732
    new-instance v8, Lcom/vkontakte/android/ui/WriteBar;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v9

    invoke-direct {v8, v9}, Lcom/vkontakte/android/ui/WriteBar;-><init>(Landroid/content/Context;)V

    iput-object v8, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->commentBar:Lcom/vkontakte/android/ui/WriteBar;

    .line 734
    new-instance v8, Lcom/vkontakte/android/stickers/StickersView;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v9

    invoke-direct {v8, v9, p0}, Lcom/vkontakte/android/stickers/StickersView;-><init>(Landroid/content/Context;Lcom/vkontakte/android/stickers/StickersView$Listener;)V

    iput-object v8, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->mStickersView:Lcom/vkontakte/android/stickers/StickersView;

    .line 735
    new-instance v8, Lcom/vkontakte/android/stickers/KeyboardPopup;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v9

    iget-object v10, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->mStickersView:Lcom/vkontakte/android/stickers/StickersView;

    invoke-direct {v8, v9, v7, v10}, Lcom/vkontakte/android/stickers/KeyboardPopup;-><init>(Landroid/app/Activity;Landroid/view/View;Landroid/view/View;)V

    iput-object v8, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->mKeyboardPopup:Lcom/vkontakte/android/stickers/KeyboardPopup;

    .line 736
    iget-object v8, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->mKeyboardPopup:Lcom/vkontakte/android/stickers/KeyboardPopup;

    iget-object v9, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->commentBar:Lcom/vkontakte/android/ui/WriteBar;

    invoke-virtual {v9}, Lcom/vkontakte/android/ui/WriteBar;->getAnchor()Landroid/view/View;

    move-result-object v9

    const v10, -0x14110e

    invoke-virtual {v8, v9, v10}, Lcom/vkontakte/android/stickers/KeyboardPopup;->attachToAnchor(Landroid/view/View;I)V

    .line 737
    iget-object v8, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->mKeyboardPopup:Lcom/vkontakte/android/stickers/KeyboardPopup;

    iget-object v9, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->commentBar:Lcom/vkontakte/android/ui/WriteBar;

    invoke-virtual {v8, v9}, Lcom/vkontakte/android/stickers/KeyboardPopup;->setOnVisibilityChangedListener(Lcom/vkontakte/android/stickers/KeyboardPopup$OnVisibilityChangedListener;)V

    .line 739
    iget-object v8, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->commentBar:Lcom/vkontakte/android/ui/WriteBar;

    invoke-virtual {v8, p0}, Lcom/vkontakte/android/ui/WriteBar;->setAutoSuggestPopupListener(Lcom/vkontakte/android/stickers/StickersView$Listener;)V

    .line 741
    iget-object v8, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->commentBar:Lcom/vkontakte/android/ui/WriteBar;

    new-instance v9, Lcom/vkontakte/android/fragments/PostViewFragment$7;

    invoke-direct {v9, p0}, Lcom/vkontakte/android/fragments/PostViewFragment$7;-><init>(Lcom/vkontakte/android/fragments/PostViewFragment;)V

    invoke-virtual {v8, v9}, Lcom/vkontakte/android/ui/WriteBar;->setOnSendClickListener(Landroid/view/View$OnClickListener;)V

    .line 752
    iget-object v8, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->commentBar:Lcom/vkontakte/android/ui/WriteBar;

    const v9, 0x7f1005cc

    invoke-virtual {v8, v9}, Lcom/vkontakte/android/ui/WriteBar;->findViewById(I)Landroid/view/View;

    move-result-object v8

    new-instance v9, Lcom/vkontakte/android/fragments/PostViewFragment$8;

    invoke-direct {v9, p0}, Lcom/vkontakte/android/fragments/PostViewFragment$8;-><init>(Lcom/vkontakte/android/fragments/PostViewFragment;)V

    invoke-virtual {v8, v9}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 778
    iget-object v8, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->commentBar:Lcom/vkontakte/android/ui/WriteBar;

    invoke-virtual {v8, p0}, Lcom/vkontakte/android/ui/WriteBar;->setFragment(Landroid/app/Fragment;)V

    .line 779
    iget-object v8, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->commentBar:Lcom/vkontakte/android/ui/WriteBar;

    const/4 v9, 0x1

    iget-object v10, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v10, v10, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    invoke-virtual {v8, v9, v10}, Lcom/vkontakte/android/ui/WriteBar;->setUploadType(ZI)V

    .line 780
    iget-object v8, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->commentBar:Lcom/vkontakte/android/ui/WriteBar;

    const/4 v9, 0x2

    const/4 v10, 0x0

    invoke-virtual {v8, v9, v10}, Lcom/vkontakte/android/ui/WriteBar;->setAttachLimits(IZ)V

    .line 781
    iget-object v8, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->commentBar:Lcom/vkontakte/android/ui/WriteBar;

    const/4 v9, 0x1

    invoke-virtual {v8, v9}, Lcom/vkontakte/android/ui/WriteBar;->setGraffitiAllowed(Z)V

    .line 782
    iget-object v8, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->commentBar:Lcom/vkontakte/android/ui/WriteBar;

    new-instance v9, Lcom/vkontakte/android/fragments/PostViewFragment$9;

    invoke-direct {v9, p0}, Lcom/vkontakte/android/fragments/PostViewFragment$9;-><init>(Lcom/vkontakte/android/fragments/PostViewFragment;)V

    invoke-virtual {v8, v9}, Lcom/vkontakte/android/ui/WriteBar;->setGraffitiSender(Lcom/vkontakte/android/ui/WriteBar$GraffitiSender;)V

    .line 793
    iget-object v8, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->commentBar:Lcom/vkontakte/android/ui/WriteBar;

    iget-object v9, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->mKeyboardPopup:Lcom/vkontakte/android/stickers/KeyboardPopup;

    invoke-virtual {v8, v9}, Lcom/vkontakte/android/ui/WriteBar;->setKeyboardPopup(Lcom/vkontakte/android/stickers/KeyboardPopup;)V

    .line 794
    iget-object v8, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->commentBar:Lcom/vkontakte/android/ui/WriteBar;

    const v9, 0x7f1005c7

    invoke-virtual {v8, v9}, Lcom/vkontakte/android/ui/WriteBar;->findViewById(I)Landroid/view/View;

    move-result-object v8

    new-instance v9, Lcom/vkontakte/android/fragments/PostViewFragment$10;

    invoke-direct {v9, p0}, Lcom/vkontakte/android/fragments/PostViewFragment$10;-><init>(Lcom/vkontakte/android/fragments/PostViewFragment;)V

    invoke-virtual {v8, v9}, Landroid/view/View;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    .line 807
    iget-object v8, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    const/4 v9, 0x2

    invoke-virtual {v8, v9}, Lcom/vkontakte/android/NewsEntry;->flag(I)Z

    move-result v8

    if-eqz v8, :cond_2

    .line 809
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v8

    const v9, 0x7f0301ed

    const/4 v10, 0x0

    invoke-static {v8, v9, v10}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v3

    .line 811
    .local v3, "replyBarView":Landroid/view/View;
    iget-object v8, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v8, v8, Lcom/vkontakte/android/NewsEntry;->type:I

    if-nez v8, :cond_1

    .line 812
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v8

    iget-boolean v8, v8, Lcom/vkontakte/android/auth/VKAccount;->communityComments:Z

    if-eqz v8, :cond_1

    iget-object v8, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    const/high16 v9, 0x20000

    .line 813
    invoke-virtual {v8, v9}, Lcom/vkontakte/android/NewsEntry;->flag(I)Z

    move-result v8

    if-nez v8, :cond_3

    :cond_1
    const/4 v4, 0x1

    .line 815
    .local v4, "restrictToAdminedGroup":Z
    :goto_0
    new-instance v8, Lcom/vkontakte/android/ui/controllers/ReplyBarController;

    iget-object v9, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v9, v9, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    new-instance v10, Lcom/vkontakte/android/fragments/PostViewFragment$11;

    invoke-direct {v10, p0, v4, v3}, Lcom/vkontakte/android/fragments/PostViewFragment$11;-><init>(Lcom/vkontakte/android/fragments/PostViewFragment;ZLandroid/view/View;)V

    invoke-direct {v8, v3, v9, v4, v10}, Lcom/vkontakte/android/ui/controllers/ReplyBarController;-><init>(Landroid/view/View;IZLcom/vkontakte/android/ui/controllers/ReplyBarController$Delegate;)V

    iput-object v8, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->replyBarController:Lcom/vkontakte/android/ui/controllers/ReplyBarController;

    .line 856
    iget-object v8, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->commentBar:Lcom/vkontakte/android/ui/WriteBar;

    invoke-virtual {v8, v3}, Lcom/vkontakte/android/ui/WriteBar;->addReplyBarView(Landroid/view/View;)V

    .line 857
    new-instance v5, Landroid/view/View;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v8

    invoke-direct {v5, v8}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 858
    .local v5, "shadow":Landroid/view/View;
    const v8, 0x7f02033a

    invoke-virtual {v5, v8}, Landroid/view/View;->setBackgroundResource(I)V

    .line 859
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v8, -0x1

    const/high16 v9, 0x41000000    # 8.0f

    invoke-static {v9}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v9

    invoke-direct {v0, v8, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 860
    .local v0, "lp":Landroid/widget/LinearLayout$LayoutParams;
    const/high16 v8, -0x3f000000    # -8.0f

    invoke-static {v8}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v8

    iput v8, v0, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 862
    invoke-virtual {v7, v5, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 864
    iget-object v8, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->commentBar:Lcom/vkontakte/android/ui/WriteBar;

    invoke-virtual {v7, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 866
    iget-object v8, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->commentBar:Lcom/vkontakte/android/ui/WriteBar;

    const v9, 0x7f1005c7

    invoke-virtual {v8, v9}, Lcom/vkontakte/android/ui/WriteBar;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/TextView;

    const/high16 v9, 0x10000000

    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setImeOptions(I)V

    .line 869
    .end local v0    # "lp":Landroid/widget/LinearLayout$LayoutParams;
    .end local v3    # "replyBarView":Landroid/view/View;
    .end local v4    # "restrictToAdminedGroup":Z
    .end local v5    # "shadow":Landroid/view/View;
    :cond_2
    return-object v7

    .line 813
    .restart local v3    # "replyBarView":Landroid/view/View;
    :cond_3
    const/4 v4, 0x0

    goto :goto_0
.end method

.method public onDestroy()V
    .locals 3

    .prologue
    .line 565
    invoke-super {p0}, Lcom/vkontakte/android/fragments/VKRecyclerFragment;->onDestroy()V

    .line 567
    :try_start_0
    sget-object v1, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->receiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v1, v2}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 571
    :goto_0
    sget-object v1, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-static {v1}, Landroid/support/v4/content/LocalBroadcastManager;->getInstance(Landroid/content/Context;)Landroid/support/v4/content/LocalBroadcastManager;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->receiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v1, v2}, Landroid/support/v4/content/LocalBroadcastManager;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 572
    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->currentReq:Lcom/vkontakte/android/api/VKAPIRequest;

    if-eqz v1, :cond_0

    .line 573
    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->currentReq:Lcom/vkontakte/android/api/VKAPIRequest;

    invoke-virtual {v1}, Lcom/vkontakte/android/api/VKAPIRequest;->cancel()V

    .line 575
    :cond_0
    return-void

    .line 568
    :catch_0
    move-exception v0

    .line 569
    .local v0, "x":Ljava/lang/Exception;
    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public onDestroyView()V
    .locals 1

    .prologue
    .line 425
    invoke-super {p0}, Lcom/vkontakte/android/fragments/VKRecyclerFragment;->onDestroyView()V

    .line 427
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->jumpToEndBtn:Landroid/view/ViewGroup;

    .line 428
    return-void
.end method

.method public onEmojiSelected(Ljava/lang/String;)V
    .locals 4
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 258
    iget-object v2, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->commentBar:Lcom/vkontakte/android/ui/WriteBar;

    const v3, 0x7f1005c7

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/ui/WriteBar;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    .line 259
    .local v0, "edit":Landroid/widget/EditText;
    invoke-virtual {v0}, Landroid/widget/EditText;->getSelectionEnd()I

    move-result v1

    .line 260
    .local v1, "pos":I
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-interface {v2, v1, p1}, Landroid/text/Editable;->insert(ILjava/lang/CharSequence;)Landroid/text/Editable;

    .line 261
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    add-int/2addr v1, v2

    .line 262
    invoke-virtual {v0, v1, v1}, Landroid/widget/EditText;->setSelection(II)V

    .line 263
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 14
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 1031
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v9

    const v10, 0x7f1005e8

    if-ne v9, v10, :cond_3

    .line 1032
    const v4, 0x7f0801a3

    .line 1033
    .local v4, "msg":I
    iget-object v9, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v9, v9, Lcom/vkontakte/android/NewsEntry;->type:I

    const/4 v10, 0x1

    if-ne v9, v10, :cond_0

    .line 1034
    const v4, 0x7f0801aa

    .line 1036
    :cond_0
    iget-object v9, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v9, v9, Lcom/vkontakte/android/NewsEntry;->type:I

    const/4 v10, 0x2

    if-ne v9, v10, :cond_1

    .line 1037
    const v4, 0x7f0801b1

    .line 1039
    :cond_1
    new-instance v9, Lcom/vkontakte/android/VKAlertDialog$Builder;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v10

    invoke-direct {v9, v10}, Lcom/vkontakte/android/VKAlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v10, 0x7f080176

    invoke-virtual {v9, v10}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v9

    invoke-virtual {v9, v4}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v9

    const v10, 0x7f080798

    new-instance v11, Lcom/vkontakte/android/fragments/PostViewFragment$13;

    invoke-direct {v11, p0}, Lcom/vkontakte/android/fragments/PostViewFragment$13;-><init>(Lcom/vkontakte/android/fragments/PostViewFragment;)V

    .line 1040
    invoke-virtual {v9, v10, v11}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v9

    const v10, 0x7f080433

    const/4 v11, 0x0

    .line 1046
    invoke-virtual {v9, v10, v11}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v9

    invoke-virtual {v9}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 1143
    .end local v4    # "msg":I
    :cond_2
    :goto_0
    const/4 v9, 0x1

    :goto_1
    return v9

    .line 1047
    :cond_3
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v9

    const v10, 0x7f1005f0

    if-ne v9, v10, :cond_6

    .line 1048
    iget-object v9, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    const/16 v10, 0x20

    invoke-virtual {v9, v10}, Lcom/vkontakte/android/NewsEntry;->flag(I)Z

    move-result v9

    if-eqz v9, :cond_4

    .line 1049
    iget-object v9, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget-object v9, v9, Lcom/vkontakte/android/NewsEntry;->retweetText:Ljava/lang/String;

    invoke-direct {p0, v9}, Lcom/vkontakte/android/fragments/PostViewFragment;->editRepostComment(Ljava/lang/String;)V

    .line 1050
    const/4 v9, 0x1

    goto :goto_1

    .line 1057
    :cond_4
    new-instance v9, Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;

    invoke-direct {v9}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;-><init>()V

    iget-object v10, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    .line 1058
    invoke-virtual {v9, v10}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;->attachPost(Lcom/vkontakte/android/NewsEntry;)Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;

    move-result-object v10

    iget-object v9, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    const/16 v11, 0x800

    .line 1059
    invoke-virtual {v9, v11}, Lcom/vkontakte/android/NewsEntry;->flag(I)Z

    move-result v9

    if-eqz v9, :cond_5

    iget-object v9, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v9, v9, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    if-gez v9, :cond_5

    const/4 v9, 0x1

    :goto_2
    invoke-virtual {v10, v9}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;->isPublic(Z)Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;

    move-result-object v9

    const/16 v10, 0x10e8

    .line 1060
    invoke-virtual {v9, p0, v10}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;->forResult(Landroid/app/Fragment;I)Z

    goto :goto_0

    .line 1059
    :cond_5
    const/4 v9, 0x0

    goto :goto_2

    .line 1062
    :cond_6
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v9

    const v10, 0x7f10000f

    if-ne v9, v10, :cond_7

    .line 1063
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v9

    const-string/jumbo v10, "clipboard"

    invoke-virtual {v9, v10}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/text/ClipboardManager;

    .line 1064
    .local v0, "cm":Landroid/text/ClipboardManager;
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->getLink()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v0, v9}, Landroid/text/ClipboardManager;->setText(Ljava/lang/CharSequence;)V

    .line 1065
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v9

    const v10, 0x7f080339

    const/4 v11, 0x0

    invoke-static {v9, v10, v11}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v9

    invoke-virtual {v9}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 1066
    .end local v0    # "cm":Landroid/text/ClipboardManager;
    :cond_7
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v9

    const v10, 0x7f100605

    if-ne v9, v10, :cond_a

    .line 1067
    const-string/jumbo v7, "wall"

    .line 1068
    .local v7, "type":Ljava/lang/String;
    iget-object v9, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v9, v9, Lcom/vkontakte/android/NewsEntry;->retweetType:I

    const/4 v10, 0x1

    if-ne v9, v10, :cond_8

    .line 1069
    const-string/jumbo v7, "photo"

    .line 1071
    :cond_8
    iget-object v9, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v9, v9, Lcom/vkontakte/android/NewsEntry;->retweetType:I

    const/4 v10, 0x2

    if-ne v9, v10, :cond_9

    .line 1072
    const-string/jumbo v7, "video"

    .line 1074
    :cond_9
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v9

    new-instance v10, Landroid/content/Intent;

    const-string/jumbo v11, "android.intent.action.VIEW"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v13, "vkontakte://vk.com/"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    iget-object v13, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v13, v13, Lcom/vkontakte/android/NewsEntry;->retweetUID:I

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string/jumbo v13, "_"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    iget-object v13, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v13, v13, Lcom/vkontakte/android/NewsEntry;->retweetOrigId:I

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    .line 1075
    invoke-static {v12}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v12

    invoke-direct {v10, v11, v12}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 1074
    invoke-virtual {v9, v10}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_0

    .line 1077
    .end local v7    # "type":Ljava/lang/String;
    :cond_a
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v9

    const v10, 0x7f1005f4

    if-ne v9, v10, :cond_e

    .line 1078
    new-instance v2, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v9

    const-class v10, Lcom/vkontakte/android/ReportContentActivity;

    invoke-direct {v2, v9, v10}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 1079
    .local v2, "intent":Landroid/content/Intent;
    const-string/jumbo v9, "itemID"

    iget-object v10, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v10, v10, Lcom/vkontakte/android/NewsEntry;->postID:I

    invoke-virtual {v2, v9, v10}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1080
    const-string/jumbo v9, "ownerID"

    iget-object v10, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v10, v10, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    invoke-virtual {v2, v9, v10}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1081
    const-string/jumbo v9, "trackCode"

    iget-object v10, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    invoke-virtual {v10}, Lcom/vkontakte/android/NewsEntry;->getTrackCode()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v2, v9, v10}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1082
    const-string/jumbo v7, "post"

    .line 1083
    .restart local v7    # "type":Ljava/lang/String;
    iget-object v9, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v9, v9, Lcom/vkontakte/android/NewsEntry;->type:I

    const/4 v10, 0x1

    if-ne v9, v10, :cond_b

    .line 1084
    const-string/jumbo v7, "photo"

    .line 1086
    :cond_b
    iget-object v9, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v9, v9, Lcom/vkontakte/android/NewsEntry;->type:I

    const/4 v10, 0x2

    if-ne v9, v10, :cond_c

    .line 1087
    const-string/jumbo v7, "video"

    .line 1089
    :cond_c
    const-string/jumbo v9, "type"

    invoke-virtual {v2, v9, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1090
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->getPostInteract()Lcom/vkontakte/android/data/PostInteract;

    move-result-object v5

    .line 1091
    .local v5, "postInteract":Lcom/vkontakte/android/data/PostInteract;
    if-eqz v5, :cond_d

    .line 1092
    const-string/jumbo v9, "refer"

    iget-object v10, v5, Lcom/vkontakte/android/data/PostInteract;->refer:Ljava/lang/String;

    invoke-virtual {v2, v9, v10}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1094
    :cond_d
    invoke-virtual {p0, v2}, Lcom/vkontakte/android/fragments/PostViewFragment;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_0

    .line 1095
    .end local v2    # "intent":Landroid/content/Intent;
    .end local v5    # "postInteract":Lcom/vkontakte/android/data/PostInteract;
    .end local v7    # "type":Ljava/lang/String;
    :cond_e
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v9

    const v10, 0x7f100604

    if-ne v9, v10, :cond_f

    .line 1096
    iget-object v9, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v10

    new-instance v11, Lcom/vkontakte/android/fragments/PostViewFragment$14;

    invoke-direct {v11, p0}, Lcom/vkontakte/android/fragments/PostViewFragment$14;-><init>(Lcom/vkontakte/android/fragments/PostViewFragment;)V

    invoke-static {v9, v10, v11}, Lcom/vkontakte/android/data/Posts;->publishPostponed(Lcom/vkontakte/android/NewsEntry;Landroid/app/Activity;Ljava/lang/Runnable;)V

    goto/16 :goto_0

    .line 1102
    :cond_f
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v9

    const v10, 0x7f100606

    if-ne v9, v10, :cond_10

    .line 1103
    iget-object v9, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v10

    new-instance v11, Lcom/vkontakte/android/fragments/PostViewFragment$15;

    invoke-direct {v11, p0}, Lcom/vkontakte/android/fragments/PostViewFragment$15;-><init>(Lcom/vkontakte/android/fragments/PostViewFragment;)V

    invoke-static {v9, v10, v11}, Lcom/vkontakte/android/data/Posts;->toggleFixed(Lcom/vkontakte/android/NewsEntry;Landroid/app/Activity;Ljava/lang/Runnable;)V

    goto/16 :goto_0

    .line 1113
    :cond_10
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v9

    const v10, 0x7f1000b0

    if-ne v9, v10, :cond_11

    .line 1114
    new-instance v9, Lcom/vkontakte/android/api/video/VideoAdd;

    iget-object v10, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v10, v10, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    iget-object v11, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v11, v11, Lcom/vkontakte/android/NewsEntry;->postID:I

    invoke-direct {v9, v10, v11}, Lcom/vkontakte/android/api/video/VideoAdd;-><init>(II)V

    new-instance v10, Lcom/vkontakte/android/fragments/PostViewFragment$16;

    .line 1115
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v11

    invoke-direct {v10, p0, v11}, Lcom/vkontakte/android/fragments/PostViewFragment$16;-><init>(Lcom/vkontakte/android/fragments/PostViewFragment;Landroid/content/Context;)V

    invoke-virtual {v9, v10}, Lcom/vkontakte/android/api/video/VideoAdd;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v9

    .line 1123
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v10

    invoke-virtual {v9, v10}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v9

    .line 1124
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v10

    invoke-virtual {v9, v10}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    goto/16 :goto_0

    .line 1125
    :cond_11
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v9

    const v10, 0x7f100004

    if-ne v9, v10, :cond_12

    .line 1126
    iget-object v9, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget-object v9, v9, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    const/4 v10, 0x0

    invoke-virtual {v9, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/vkontakte/android/attachments/VideoAttachment;

    .line 1127
    .local v8, "va":Lcom/vkontakte/android/attachments/VideoAttachment;
    new-instance v1, Lcom/vkontakte/android/fragments/videos/VideoAddHelper;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v9

    invoke-direct {v1, v9}, Lcom/vkontakte/android/fragments/videos/VideoAddHelper;-><init>(Landroid/content/Context;)V

    .line 1128
    .local v1, "helper":Lcom/vkontakte/android/fragments/videos/VideoAddHelper;
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v9

    invoke-virtual {v9}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v9

    iget-object v10, v8, Lcom/vkontakte/android/attachments/VideoAttachment;->video:Lcom/vkontakte/android/api/VideoFile;

    invoke-virtual {v1, v9, v10}, Lcom/vkontakte/android/fragments/videos/VideoAddHelper;->showAlbumsDialog(ILcom/vkontakte/android/api/VideoFile;)V

    goto/16 :goto_0

    .line 1129
    .end local v1    # "helper":Lcom/vkontakte/android/fragments/videos/VideoAddHelper;
    .end local v8    # "va":Lcom/vkontakte/android/attachments/VideoAttachment;
    :cond_12
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v9

    const v10, 0x7f100090

    if-ne v9, v10, :cond_13

    .line 1131
    :try_start_0
    iget-object v9, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget-object v9, v9, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    const/4 v10, 0x0

    invoke-virtual {v9, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/vkontakte/android/attachments/VideoAttachment;

    iget-object v9, v9, Lcom/vkontakte/android/attachments/VideoAttachment;->video:Lcom/vkontakte/android/api/VideoFile;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v10

    const-string/jumbo v11, "referer"

    invoke-virtual {v10, v11}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {p0, v9, v10}, Lcom/vkontakte/android/fragments/PostViewFragment;->openYoutubeApp(Lcom/vkontakte/android/api/VideoFile;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    .line 1132
    :catch_0
    move-exception v6

    .line 1133
    .local v6, "t":Ljava/lang/Throwable;
    const-string/jumbo v9, "PostViewFragment"

    const-string/jumbo v10, "openYoutubeApp"

    invoke-static {v9, v10, v6}, Lcom/vkontakte/android/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1134
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v9

    const v10, 0x7f0801f9

    const/4 v11, 0x0

    invoke-static {v9, v10, v11}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v9

    invoke-virtual {v9}, Landroid/widget/Toast;->show()V

    goto/16 :goto_0

    .line 1136
    .end local v6    # "t":Ljava/lang/Throwable;
    :cond_13
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v9

    const v10, 0x7f1005fa

    if-ne v9, v10, :cond_2

    .line 1137
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->getLink()Ljava/lang/String;

    move-result-object v3

    .line 1138
    .local v3, "ln":Ljava/lang/String;
    new-instance v2, Landroid/content/Intent;

    const-string/jumbo v9, "android.intent.action.VIEW"

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v10

    invoke-direct {v2, v9, v10}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 1139
    .restart local v2    # "intent":Landroid/content/Intent;
    const/high16 v9, 0x10000000

    invoke-virtual {v2, v9}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 1140
    invoke-virtual {p0, v2}, Lcom/vkontakte/android/fragments/PostViewFragment;->startActivity(Landroid/content/Intent;)V

    .line 1141
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v9

    const/high16 v10, 0x10a0000

    const v11, 0x10a0001

    invoke-virtual {v9, v10, v11}, Landroid/app/Activity;->overridePendingTransition(II)V

    goto/16 :goto_0
.end method

.method public onPause()V
    .locals 1

    .prologue
    .line 578
    invoke-super {p0}, Lcom/vkontakte/android/fragments/VKRecyclerFragment;->onPause()V

    .line 579
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->hideEmojiPopup()V

    .line 580
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Lcom/vkontakte/android/media/VideoPools;->onPause(Landroid/app/Activity;)V

    .line 581
    return-void
.end method

.method public onPrepareOptionsMenu(Landroid/view/Menu;)V
    .locals 0
    .param p1, "menu"    # Landroid/view/Menu;

    .prologue
    .line 1027
    return-void
.end method

.method public onRefresh()V
    .locals 4

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 2154
    iget-boolean v2, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->loadCommentsFromBeginning:Z

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v2, v2, Lcom/vkontakte/android/NewsEntry;->numComments:I

    iget-object v3, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->comments:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-le v2, v3, :cond_0

    .line 2155
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->loadMoreCommentsFromBuffer()V

    .line 2161
    :goto_0
    return-void

    .line 2157
    :cond_0
    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->loadCommentsFromBeginning:Z

    .line 2159
    iget-object v2, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->refreshLayout:Lme/grishka/appkit/views/SwipeRefreshLayoutI;

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->refreshLayout:Lme/grishka/appkit/views/SwipeRefreshLayoutI;

    invoke-interface {v2}, Lme/grishka/appkit/views/SwipeRefreshLayoutI;->isReversed()Z

    move-result v2

    if-eqz v2, :cond_1

    move v0, v1

    :cond_1
    invoke-direct {p0, v1, v0}, Lcom/vkontakte/android/fragments/PostViewFragment;->loadComments(ZZ)V

    goto :goto_0
.end method

.method public onResume()V
    .locals 4

    .prologue
    .line 1377
    invoke-super {p0}, Lcom/vkontakte/android/fragments/VKRecyclerFragment;->onResume()V

    .line 1378
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Lcom/vkontakte/android/media/VideoPools;->onResume(Landroid/app/Activity;)V

    .line 1379
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->resetScroll:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->mScrollReset:Z

    if-nez v0, :cond_0

    .line 1380
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->mScrollReset:Z

    .line 1381
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    new-instance v1, Lcom/vkontakte/android/fragments/PostViewFragment$22;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/fragments/PostViewFragment$22;-><init>(Lcom/vkontakte/android/fragments/PostViewFragment;)V

    const-wide/16 v2, 0x64

    invoke-virtual {v0, v1, v2, v3}, Lme/grishka/appkit/views/UsableRecyclerView;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 1388
    :cond_0
    return-void
.end method

.method public onScroll(III)V
    .locals 7
    .param p1, "firstItem"    # I
    .param p2, "visibleCount"    # I
    .param p3, "total"    # I

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 375
    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->refreshLayout:Lme/grishka/appkit/views/SwipeRefreshLayoutI;

    .line 376
    .local v1, "layoutI":Lme/grishka/appkit/views/SwipeRefreshLayoutI;
    if-eqz v1, :cond_0

    .line 377
    add-int v5, p1, p2

    sub-int v5, p3, v5

    if-ge p1, v5, :cond_4

    move v0, v3

    .line 378
    .local v0, "isUp":Z
    :goto_0
    invoke-interface {v1}, Lme/grishka/appkit/views/SwipeRefreshLayoutI;->isReversed()Z

    move-result v5

    if-eqz v5, :cond_5

    if-eqz v0, :cond_5

    .line 379
    invoke-interface {v1, v4}, Lme/grishka/appkit/views/SwipeRefreshLayoutI;->setReversed(Z)V

    .line 388
    .end local v0    # "isUp":Z
    :cond_0
    :goto_1
    iget-boolean v2, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->hideJumpToEndButtonDueToScrollPosition:Z

    .line 390
    .local v2, "old":Z
    iget-object v5, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->views:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    iget-object v6, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->postItems:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    add-int/2addr v5, v6

    if-lt p1, v5, :cond_1

    add-int v5, p1, p2

    add-int/lit8 v6, p3, -0x1

    if-lt v5, v6, :cond_2

    :cond_1
    move v4, v3

    :cond_2
    iput-boolean v4, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->hideJumpToEndButtonDueToScrollPosition:Z

    .line 393
    iget-boolean v3, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->hideJumpToEndButtonDueToScrollPosition:Z

    if-eq v2, v3, :cond_3

    .line 394
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->updateJumpToEndButtonVisibility()V

    .line 396
    :cond_3
    return-void

    .end local v2    # "old":Z
    :cond_4
    move v0, v4

    .line 377
    goto :goto_0

    .line 380
    .restart local v0    # "isUp":Z
    :cond_5
    invoke-interface {v1}, Lme/grishka/appkit/views/SwipeRefreshLayoutI;->isReversed()Z

    move-result v5

    if-nez v5, :cond_0

    if-nez v0, :cond_0

    .line 381
    invoke-interface {v1, v3}, Lme/grishka/appkit/views/SwipeRefreshLayoutI;->setReversed(Z)V

    goto :goto_1
.end method

.method public onScrolledToLastItem()V
    .locals 0

    .prologue
    .line 590
    invoke-super {p0}, Lcom/vkontakte/android/fragments/VKRecyclerFragment;->onScrolledToLastItem()V

    .line 592
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->loadMoreCommentsFromBuffer()V

    .line 593
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

    .line 247
    new-instance v0, Lcom/vkontakte/android/attachments/StickerAttachment;

    invoke-direct {v0}, Lcom/vkontakte/android/attachments/StickerAttachment;-><init>()V

    .line 248
    .local v0, "att":Lcom/vkontakte/android/attachments/StickerAttachment;
    iput p2, v0, Lcom/vkontakte/android/attachments/StickerAttachment;->id:I

    .line 249
    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/String;

    aput-object p3, v1, v4

    aput-object v2, v1, v5

    aput-object v2, v1, v6

    iput-object v1, v0, Lcom/vkontakte/android/attachments/StickerAttachment;->images:[Ljava/lang/String;

    .line 250
    iget-object v1, v0, Lcom/vkontakte/android/attachments/StickerAttachment;->images:[Ljava/lang/String;

    iget-object v2, v0, Lcom/vkontakte/android/attachments/StickerAttachment;->images:[Ljava/lang/String;

    iget-object v3, v0, Lcom/vkontakte/android/attachments/StickerAttachment;->images:[Ljava/lang/String;

    aget-object v3, v3, v4

    aput-object v3, v2, v6

    aput-object v3, v1, v5

    .line 251
    iput p1, v0, Lcom/vkontakte/android/attachments/StickerAttachment;->packID:I

    .line 252
    iput-object p4, v0, Lcom/vkontakte/android/attachments/StickerAttachment;->stickerReferrer:Ljava/lang/String;

    .line 253
    invoke-direct {p0, v0}, Lcom/vkontakte/android/fragments/PostViewFragment;->sendAttachmentComment(Lcom/vkontakte/android/attachments/Attachment;)V

    .line 254
    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 4
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v3, 0x0

    .line 885
    invoke-super {p0, p1, p2}, Lcom/vkontakte/android/fragments/VKRecyclerFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 886
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->updateButtons()V

    .line 887
    new-instance v0, Lme/grishka/appkit/views/DividerItemDecoration;

    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    const/high16 v2, 0x26000000

    invoke-direct {v1, v2}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    const/high16 v2, 0x3f000000    # 0.5f

    invoke-static {v2}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v2

    invoke-direct {v0, v1, v2}, Lme/grishka/appkit/views/DividerItemDecoration;-><init>(Landroid/graphics/drawable/Drawable;I)V

    .line 888
    .local v0, "dividers":Lme/grishka/appkit/views/DividerItemDecoration;
    new-instance v1, Lcom/vkontakte/android/fragments/PostViewFragment$12;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/fragments/PostViewFragment$12;-><init>(Lcom/vkontakte/android/fragments/PostViewFragment;)V

    invoke-virtual {v0, v1}, Lme/grishka/appkit/views/DividerItemDecoration;->setProvider(Lme/grishka/appkit/views/DividerItemDecoration$Provider;)Lme/grishka/appkit/views/DividerItemDecoration;

    .line 894
    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v1, v0}, Lme/grishka/appkit/views/UsableRecyclerView;->addItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    .line 895
    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v1, v3, v3, v3, v3}, Lme/grishka/appkit/views/UsableRecyclerView;->setPadding(IIII)V

    .line 896
    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    const/16 v2, 0x800

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/NewsEntry;->flag(I)Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    const/16 v2, 0x1000

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/NewsEntry;->flag(I)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 897
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->views:Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->likesView:Landroid/view/View;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 898
    invoke-virtual {p0, v3}, Lcom/vkontakte/android/fragments/PostViewFragment;->setRefreshEnabled(Z)V

    .line 902
    :goto_0
    return-void

    .line 900
    :cond_1
    const/4 v1, 0x1

    invoke-direct {p0, v1}, Lcom/vkontakte/android/fragments/PostViewFragment;->loadComments(Z)V

    goto :goto_0
.end method

.method public openStickerKeyboard(I)V
    .locals 2
    .param p1, "pack"    # I

    .prologue
    .line 2128
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/NewsEntry;->flag(I)Z

    move-result v0

    if-nez v0, :cond_0

    .line 2133
    :goto_0
    return-void

    .line 2131
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->mKeyboardPopup:Lcom/vkontakte/android/stickers/KeyboardPopup;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/stickers/KeyboardPopup;->show(Z)V

    .line 2132
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->mStickersView:Lcom/vkontakte/android/stickers/StickersView;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/stickers/StickersView;->openPack(I)V

    goto :goto_0
.end method

.method openYoutubeApp(Lcom/vkontakte/android/api/VideoFile;Ljava/lang/String;)V
    .locals 7
    .param p1, "file"    # Lcom/vkontakte/android/api/VideoFile;
    .param p2, "referrer"    # Ljava/lang/String;

    .prologue
    .line 2165
    new-instance v2, Landroid/content/Intent;

    const-string/jumbo v4, "android.intent.action.VIEW"

    iget-object v5, p1, Lcom/vkontakte/android/api/VideoFile;->urlExternal:Ljava/lang/String;

    invoke-static {v5}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v5

    invoke-direct {v2, v4, v5}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 2166
    .local v2, "intent":Landroid/content/Intent;
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-virtual {v4}, Landroid/app/Activity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v4

    const/high16 v5, 0x10000

    invoke-virtual {v4, v2, v5}, Landroid/content/pm/PackageManager;->queryIntentActivities(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v1

    .line 2167
    .local v1, "info":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/ResolveInfo;>;"
    const/4 v0, 0x0

    .line 2168
    .local v0, "foundApp":Z
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/content/pm/ResolveInfo;

    .line 2170
    .local v3, "ri":Landroid/content/pm/ResolveInfo;
    iget-object v5, v3, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v5, v5, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    const-string/jumbo v6, "com.google.android.youtube"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 2171
    const/4 v0, 0x1

    .line 2172
    iget-object v4, v3, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v4, v4, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    iget-object v5, v3, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v5, v5, Landroid/content/pm/ActivityInfo;->name:Ljava/lang/String;

    invoke-virtual {v2, v4, v5}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 2176
    .end local v3    # "ri":Landroid/content/pm/ResolveInfo;
    :cond_1
    if-nez v0, :cond_2

    .line 2177
    const/high16 v4, 0x10000000

    invoke-virtual {v2, v4}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 2179
    :cond_2
    const/16 v4, 0x2904

    invoke-virtual {p0, v2, v4}, Lcom/vkontakte/android/fragments/PostViewFragment;->startActivityForResult(Landroid/content/Intent;I)V

    .line 2180
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v4

    const/high16 v5, 0x10a0000

    const v6, 0x10a0001

    invoke-virtual {v4, v5, v6}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 2181
    return-void
.end method

.method public bridge synthetic replyToComment(Lcom/vkontakte/android/Comment;)V
    .locals 0

    .prologue
    .line 161
    check-cast p1, Lcom/vkontakte/android/NewsComment;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/PostViewFragment;->replyToComment(Lcom/vkontakte/android/NewsComment;)V

    return-void
.end method

.method public replyToComment(Lcom/vkontakte/android/NewsComment;)V
    .locals 1
    .param p1, "comment"    # Lcom/vkontakte/android/NewsComment;

    .prologue
    .line 1320
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/vkontakte/android/fragments/PostViewFragment;->replyToComment(Lcom/vkontakte/android/NewsComment;Z)V

    .line 1321
    return-void
.end method

.method public bridge synthetic reportComment(Lcom/vkontakte/android/Comment;)V
    .locals 0

    .prologue
    .line 161
    check-cast p1, Lcom/vkontakte/android/NewsComment;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/PostViewFragment;->reportComment(Lcom/vkontakte/android/NewsComment;)V

    return-void
.end method

.method public reportComment(Lcom/vkontakte/android/NewsComment;)V
    .locals 5
    .param p1, "comm"    # Lcom/vkontakte/android/NewsComment;

    .prologue
    .line 1354
    new-instance v0, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    const-class v4, Lcom/vkontakte/android/ReportContentActivity;

    invoke-direct {v0, v3, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 1355
    .local v0, "intent":Landroid/content/Intent;
    const-string/jumbo v3, "itemID"

    iget v4, p1, Lcom/vkontakte/android/NewsComment;->cid:I

    invoke-virtual {v0, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1356
    const-string/jumbo v3, "ownerID"

    iget-object v4, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v4, v4, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    invoke-virtual {v0, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1357
    const-string/jumbo v3, "trackCode"

    iget-object v4, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    invoke-virtual {v4}, Lcom/vkontakte/android/NewsEntry;->getTrackCode()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1358
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->getPostInteract()Lcom/vkontakte/android/data/PostInteract;

    move-result-object v1

    .line 1359
    .local v1, "postInteract":Lcom/vkontakte/android/data/PostInteract;
    if-eqz v1, :cond_0

    .line 1360
    const-string/jumbo v3, "refer"

    iget-object v4, v1, Lcom/vkontakte/android/data/PostInteract;->refer:Ljava/lang/String;

    invoke-virtual {v0, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1362
    :cond_0
    const-string/jumbo v2, "post_comment"

    .line 1363
    .local v2, "type":Ljava/lang/String;
    iget-object v3, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v3, v3, Lcom/vkontakte/android/NewsEntry;->type:I

    const/4 v4, 0x1

    if-ne v3, v4, :cond_1

    .line 1364
    const-string/jumbo v2, "photo_comment"

    .line 1366
    :cond_1
    iget-object v3, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v3, v3, Lcom/vkontakte/android/NewsEntry;->type:I

    const/4 v4, 0x2

    if-ne v3, v4, :cond_2

    .line 1367
    const-string/jumbo v2, "video_comment"

    .line 1369
    :cond_2
    const-string/jumbo v3, "type"

    invoke-virtual {v0, v3, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1370
    const/16 v3, 0x10ea

    invoke-virtual {p0, v0, v3}, Lcom/vkontakte/android/fragments/PostViewFragment;->startActivityForResult(Landroid/content/Intent;I)V

    .line 1371
    return-void
.end method

.method public restoreComment(I)V
    .locals 6
    .param p1, "cid"    # I

    .prologue
    .line 2037
    new-instance v0, Lcom/vkontakte/android/api/wall/WallRestoreComment;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v1, v1, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    iget-object v2, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v2, v2, Lcom/vkontakte/android/NewsEntry;->postID:I

    iget-object v3, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v4, v3, Lcom/vkontakte/android/NewsEntry;->type:I

    iget-object v5, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->accessKey:Ljava/lang/String;

    move v3, p1

    invoke-direct/range {v0 .. v5}, Lcom/vkontakte/android/api/wall/WallRestoreComment;-><init>(IIIILjava/lang/String;)V

    new-instance v1, Lcom/vkontakte/android/fragments/PostViewFragment$32;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-direct {v1, p0, v2, p1}, Lcom/vkontakte/android/fragments/PostViewFragment$32;-><init>(Lcom/vkontakte/android/fragments/PostViewFragment;Landroid/content/Context;I)V

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/wall/WallRestoreComment;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 2052
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->contentView:Landroid/view/ViewGroup;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/view/View;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 2053
    return-void
.end method

.method public bridge synthetic showCommentActions(Lcom/vkontakte/android/Comment;)V
    .locals 0

    .prologue
    .line 161
    check-cast p1, Lcom/vkontakte/android/NewsComment;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/PostViewFragment;->showCommentActions(Lcom/vkontakte/android/NewsComment;)V

    return-void
.end method

.method public showCommentActions(Lcom/vkontakte/android/NewsComment;)V
    .locals 10
    .param p1, "comm"    # Lcom/vkontakte/android/NewsComment;

    .prologue
    const/4 v6, 0x2

    const/4 v2, 0x0

    const/4 v4, 0x1

    .line 1230
    iget-boolean v5, p1, Lcom/vkontakte/android/NewsComment;->isDeleted:Z

    if-eqz v5, :cond_0

    .line 1316
    :goto_0
    return-void

    .line 1233
    :cond_0
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 1234
    .local v3, "items":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 1235
    .local v0, "acts":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    iget-object v5, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v5, v5, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    neg-int v5, v5

    invoke-static {v5}, Lcom/vkontakte/android/data/Groups;->getAdminLevel(I)I

    move-result v5

    if-lt v5, v6, :cond_1

    .line 1236
    const v5, 0x7f0805bb

    invoke-virtual {p0, v5}, Lcom/vkontakte/android/fragments/PostViewFragment;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1237
    const-string/jumbo v5, "reply_group"

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1240
    :cond_1
    const v5, 0x7f080183

    invoke-virtual {p0, v5}, Lcom/vkontakte/android/fragments/PostViewFragment;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1241
    const-string/jumbo v5, "copy"

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1243
    iget-object v5, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v5, v5, Lcom/vkontakte/android/NewsEntry;->type:I

    if-eqz v5, :cond_2

    iget-object v5, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v5, v5, Lcom/vkontakte/android/NewsEntry;->type:I

    if-eq v5, v4, :cond_2

    iget-object v5, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v5, v5, Lcom/vkontakte/android/NewsEntry;->type:I

    if-ne v5, v6, :cond_3

    .line 1244
    :cond_2
    const v5, 0x7f080184

    invoke-virtual {p0, v5}, Lcom/vkontakte/android/fragments/PostViewFragment;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1245
    const-string/jumbo v5, "copy_link"

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1248
    :cond_3
    iget-object v5, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v5, v5, Lcom/vkontakte/android/NewsEntry;->type:I

    if-nez v5, :cond_4

    iget-object v5, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    const/16 v6, 0x200

    invoke-virtual {v5, v6}, Lcom/vkontakte/android/NewsEntry;->flag(I)Z

    move-result v5

    if-nez v5, :cond_4

    iget-object v5, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    invoke-virtual {v5, v4}, Lcom/vkontakte/android/NewsEntry;->flag(I)Z

    move-result v5

    if-eqz v5, :cond_4

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v5

    .line 1249
    invoke-virtual {v5}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v5

    if-lez v5, :cond_4

    .line 1250
    const v5, 0x7f0805bf

    invoke-virtual {p0, v5}, Lcom/vkontakte/android/fragments/PostViewFragment;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1251
    const-string/jumbo v5, "repost"

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1253
    :cond_4
    iget v5, p1, Lcom/vkontakte/android/NewsComment;->numLikes:I

    if-lez v5, :cond_5

    .line 1254
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f0d0008

    iget v7, p1, Lcom/vkontakte/android/NewsComment;->numLikes:I

    new-array v8, v4, [Ljava/lang/Object;

    iget v9, p1, Lcom/vkontakte/android/NewsComment;->numLikes:I

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v8, v2

    invoke-virtual {v5, v6, v7, v8}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1255
    const-string/jumbo v5, "liked"

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1257
    :cond_5
    iget-boolean v5, p1, Lcom/vkontakte/android/NewsComment;->canDelete:Z

    if-nez v5, :cond_8

    iget v5, p1, Lcom/vkontakte/android/NewsComment;->uid:I

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v6

    invoke-virtual {v6}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v6

    if-eq v5, v6, :cond_8

    iget-object v5, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v5, v5, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    .line 1258
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v6

    invoke-virtual {v6}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v6

    if-eq v5, v6, :cond_8

    iget-object v5, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v5, v5, Lcom/vkontakte/android/NewsEntry;->userID:I

    .line 1259
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v6

    invoke-virtual {v6}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v6

    if-eq v5, v6, :cond_8

    iget-object v5, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v5, v5, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    if-gez v5, :cond_6

    iget-object v5, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v5, v5, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    neg-int v5, v5

    .line 1260
    invoke-static {v5}, Lcom/vkontakte/android/data/Groups;->getAdminLevel(I)I

    move-result v5

    if-ne v5, v4, :cond_6

    iget v5, p1, Lcom/vkontakte/android/NewsComment;->uid:I

    if-lez v5, :cond_6

    iget v5, p1, Lcom/vkontakte/android/NewsComment;->uid:I

    const/16 v6, 0x65

    if-ne v5, v6, :cond_8

    :cond_6
    iget-object v5, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v5, v5, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    if-gez v5, :cond_7

    iget-object v5, p0, Lcom/vkontakte/android/fragments/PostViewFragment;->e:Lcom/vkontakte/android/NewsEntry;

    iget v5, v5, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    neg-int v5, v5

    .line 1262
    invoke-static {v5}, Lcom/vkontakte/android/data/Groups;->getAdminLevel(I)I

    move-result v5

    if-gt v5, v4, :cond_8

    :cond_7
    iget v5, p1, Lcom/vkontakte/android/NewsComment;->uid:I

    if-gez v5, :cond_d

    iget v5, p1, Lcom/vkontakte/android/NewsComment;->uid:I

    neg-int v5, v5

    .line 1263
    invoke-static {v5}, Lcom/vkontakte/android/data/Groups;->getAdminLevel(I)I

    move-result v5

    if-le v5, v4, :cond_d

    :cond_8
    move v1, v4

    .line 1264
    .local v1, "canDelete":Z
    :goto_1
    if-eqz v1, :cond_b

    .line 1265
    const v5, 0x7f08019c

    invoke-virtual {p0, v5}, Lcom/vkontakte/android/fragments/PostViewFragment;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1266
    const-string/jumbo v5, "delete"

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1267
    iget v5, p1, Lcom/vkontakte/android/NewsComment;->uid:I

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v6

    invoke-virtual {v6}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v6

    if-eq v5, v6, :cond_9

    iget v5, p1, Lcom/vkontakte/android/NewsComment;->uid:I

    if-gez v5, :cond_a

    iget v5, p1, Lcom/vkontakte/android/NewsComment;->uid:I

    neg-int v5, v5

    .line 1268
    invoke-static {v5}, Lcom/vkontakte/android/data/Groups;->getAdminLevel(I)I

    move-result v5

    if-le v5, v4, :cond_a

    :cond_9
    move v2, v4

    .line 1269
    .local v2, "canEdit":Z
    :cond_a
    if-eqz v2, :cond_b

    invoke-virtual {p1}, Lcom/vkontakte/android/NewsComment;->canEdit()Z

    move-result v4

    if-eqz v4, :cond_b

    .line 1270
    const v4, 0x7f0801c7

    invoke-virtual {p0, v4}, Lcom/vkontakte/android/fragments/PostViewFragment;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1271
    const-string/jumbo v4, "edit"

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1274
    .end local v2    # "canEdit":Z
    :cond_b
    iget v4, p1, Lcom/vkontakte/android/NewsComment;->uid:I

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v5

    invoke-virtual {v5}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v5

    if-eq v4, v5, :cond_c

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v4

    invoke-virtual {v4}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v4

    if-lez v4, :cond_c

    if-nez v1, :cond_c

    .line 1275
    const v4, 0x7f0805bd

    invoke-virtual {p0, v4}, Lcom/vkontakte/android/fragments/PostViewFragment;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1276
    const-string/jumbo v4, "report"

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1278
    :cond_c
    new-instance v5, Lcom/vkontakte/android/VKAlertDialog$Builder;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/PostViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-direct {v5, v4}, Lcom/vkontakte/android/VKAlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v4

    new-array v4, v4, [Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [Ljava/lang/CharSequence;

    new-instance v6, Lcom/vkontakte/android/fragments/PostViewFragment$20;

    invoke-direct {v6, p0, v0, p1}, Lcom/vkontakte/android/fragments/PostViewFragment$20;-><init>(Lcom/vkontakte/android/fragments/PostViewFragment;Ljava/util/ArrayList;Lcom/vkontakte/android/NewsComment;)V

    invoke-virtual {v5, v4, v6}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    .line 1315
    invoke-virtual {v4}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto/16 :goto_0

    .end local v1    # "canDelete":Z
    :cond_d
    move v1, v2

    .line 1263
    goto/16 :goto_1
.end method
