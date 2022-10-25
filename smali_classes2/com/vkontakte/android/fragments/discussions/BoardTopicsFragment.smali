.class public Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;
.super Lcom/vkontakte/android/fragments/CardRecyclerFragment;
.source "BoardTopicsFragment.java"

# interfaces
.implements Lcom/vkontakte/android/ui/holder/DiscussionHolder$DiscussionClickable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment$TopicListAdapter;,
        Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/fragments/CardRecyclerFragment",
        "<",
        "Lcom/vkontakte/android/api/BoardTopic;",
        ">;",
        "Lcom/vkontakte/android/ui/holder/DiscussionHolder$DiscussionClickable;"
    }
.end annotation


# static fields
.field private static final CREATE_TOPIC_RESULT:I = 0x1

.field public static final ORDER_CREATED_ASC:I = -0x2

.field public static final ORDER_CREATED_DESC:I = 0x2

.field public static final ORDER_UPDATED_ASC:I = -0x1

.field public static final ORDER_UPDATED_DESC:I = 0x1


# instance fields
.field private adapter:Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment$TopicListAdapter;

.field private canCreate:Z

.field private defaultOrder:I

.field private refreshOnResume:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 63
    const/16 v0, 0x14

    invoke-direct {p0, v0}, Lcom/vkontakte/android/fragments/CardRecyclerFragment;-><init>(I)V

    .line 51
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;->refreshOnResume:Z

    .line 64
    return-void
.end method

.method static synthetic access$002(Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;
    .param p1, "x1"    # Z

    .prologue
    .line 39
    iput-boolean p1, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;->canCreate:Z

    return p1
.end method

.method static synthetic access$100(Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;)I
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;

    .prologue
    .line 39
    iget v0, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;->defaultOrder:I

    return v0
.end method

.method static synthetic access$1000(Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;

    .prologue
    .line 39
    iget-object v0, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$102(Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;I)I
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;
    .param p1, "x1"    # I

    .prologue
    .line 39
    iput p1, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;->defaultOrder:I

    return p1
.end method

.method static synthetic access$1100(Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;

    .prologue
    .line 39
    iget-object v0, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$1200(Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;

    .prologue
    .line 39
    iget-object v0, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$1300(Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;

    .prologue
    .line 39
    iget-object v0, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$202(Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;Lme/grishka/appkit/api/APIRequest;)Lme/grishka/appkit/api/APIRequest;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;
    .param p1, "x1"    # Lme/grishka/appkit/api/APIRequest;

    .prologue
    .line 39
    iput-object p1, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;->currentRequest:Lme/grishka/appkit/api/APIRequest;

    return-object p1
.end method

.method static synthetic access$300(Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;

    .prologue
    .line 39
    iget-object v0, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$400(Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;

    .prologue
    .line 39
    iget-object v0, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$500(Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;

    .prologue
    .line 39
    iget-object v0, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$600(Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;

    .prologue
    .line 39
    iget-object v0, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$700(Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;

    .prologue
    .line 39
    iget-object v0, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$800(Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;

    .prologue
    .line 39
    iget-object v0, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$900(Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;

    .prologue
    .line 39
    iget-object v0, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method private confirmDeleteTopic(Lcom/vkontakte/android/api/BoardTopic;)V
    .locals 3
    .param p1, "topic"    # Lcom/vkontakte/android/api/BoardTopic;

    .prologue
    .line 177
    new-instance v0, Lcom/vkontakte/android/VKAlertDialog$Builder;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vkontakte/android/VKAlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x7f0801ae

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f0801ad

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f080798

    invoke-static {p0, p1}, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment$$Lambda$5;->lambdaFactory$(Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;Lcom/vkontakte/android/api/BoardTopic;)Landroid/content/DialogInterface$OnClickListener;

    move-result-object v2

    .line 178
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f080433

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 179
    return-void
.end method

.method private deleteTopic(Lcom/vkontakte/android/api/BoardTopic;)V
    .locals 3
    .param p1, "topic"    # Lcom/vkontakte/android/api/BoardTopic;

    .prologue
    .line 182
    new-instance v0, Lcom/vkontakte/android/api/board/BoardDeleteTopic;

    invoke-direct {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;->getGroupId()I

    move-result v1

    iget v2, p1, Lcom/vkontakte/android/api/BoardTopic;->id:I

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/api/board/BoardDeleteTopic;-><init>(II)V

    new-instance v1, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment$2;

    invoke-direct {v1, p0, p0, p1}, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment$2;-><init>(Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;Landroid/app/Fragment;Lcom/vkontakte/android/api/BoardTopic;)V

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/board/BoardDeleteTopic;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 188
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;->contentView:Landroid/view/ViewGroup;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/view/View;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 189
    return-void
.end method

.method private getGroupId()I
    .locals 3

    .prologue
    .line 67
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "group_id"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method private showCreateBox()V
    .locals 7

    .prologue
    .line 122
    new-instance v1, Landroid/widget/EditText;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-direct {v1, v4}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    .line 123
    .local v1, "edit":Landroid/widget/EditText;
    const v4, 0x7f0801f2

    invoke-virtual {v1, v4}, Landroid/widget/EditText;->setHint(I)V

    .line 124
    new-instance v2, Landroid/widget/FrameLayout;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-direct {v2, v4}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 125
    .local v2, "editWrap":Landroid/widget/FrameLayout;
    const/high16 v4, 0x41200000    # 10.0f

    invoke-static {v4}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v3

    .line 126
    .local v3, "pad":I
    invoke-virtual {v2, v3, v3, v3, v3}, Landroid/widget/FrameLayout;->setPadding(IIII)V

    .line 127
    invoke-virtual {v2, v1}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 128
    new-instance v4, Lcom/vkontakte/android/VKAlertDialog$Builder;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v5

    invoke-direct {v4, v5}, Lcom/vkontakte/android/VKAlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v5, 0x7f080194

    invoke-virtual {v4, v5}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    .line 129
    invoke-virtual {v4, v2}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    const v5, 0x7f080479

    invoke-static {p0, v1}, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;Landroid/widget/EditText;)Landroid/content/DialogInterface$OnClickListener;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    const v5, 0x7f08011f

    const/4 v6, 0x0

    .line 136
    invoke-virtual {v4, v5, v6}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    invoke-virtual {v4}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 137
    .local v0, "dlg":Landroid/app/AlertDialog;
    invoke-static {p0, v1}, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment$$Lambda$2;->lambdaFactory$(Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;Landroid/widget/EditText;)Landroid/content/DialogInterface$OnShowListener;

    move-result-object v4

    invoke-virtual {v0, v4}, Landroid/app/AlertDialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    .line 140
    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    .line 141
    return-void
.end method

.method private toggleCloseTopic(Lcom/vkontakte/android/api/BoardTopic;)V
    .locals 6
    .param p1, "topic"    # Lcom/vkontakte/android/api/BoardTopic;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 192
    iget v3, p1, Lcom/vkontakte/android/api/BoardTopic;->flags:I

    and-int/lit8 v3, v3, 0x1

    if-lez v3, :cond_0

    move v0, v1

    .line 193
    .local v0, "isClosed":Z
    :goto_0
    new-instance v3, Lcom/vkontakte/android/api/board/BoardCloseTopic;

    invoke-direct {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;->getGroupId()I

    move-result v4

    iget v5, p1, Lcom/vkontakte/android/api/BoardTopic;->id:I

    if-nez v0, :cond_1

    :goto_1
    invoke-direct {v3, v4, v5, v1}, Lcom/vkontakte/android/api/board/BoardCloseTopic;-><init>(IIZ)V

    new-instance v1, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment$3;

    invoke-direct {v1, p0, p0, v0, p1}, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment$3;-><init>(Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;Landroid/app/Fragment;ZLcom/vkontakte/android/api/BoardTopic;)V

    invoke-virtual {v3, v1}, Lcom/vkontakte/android/api/board/BoardCloseTopic;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    .line 204
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;->contentView:Landroid/view/ViewGroup;

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/view/View;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 205
    return-void

    .end local v0    # "isClosed":Z
    :cond_0
    move v0, v2

    .line 192
    goto :goto_0

    .restart local v0    # "isClosed":Z
    :cond_1
    move v1, v2

    .line 193
    goto :goto_1
.end method

.method private toggleFixTopic(Lcom/vkontakte/android/api/BoardTopic;)V
    .locals 6
    .param p1, "topic"    # Lcom/vkontakte/android/api/BoardTopic;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 208
    iget v3, p1, Lcom/vkontakte/android/api/BoardTopic;->flags:I

    and-int/lit8 v3, v3, 0x2

    if-lez v3, :cond_0

    move v0, v1

    .line 209
    .local v0, "isFixed":Z
    :goto_0
    new-instance v3, Lcom/vkontakte/android/api/board/BoardFixTopic;

    invoke-direct {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;->getGroupId()I

    move-result v4

    iget v5, p1, Lcom/vkontakte/android/api/BoardTopic;->id:I

    if-nez v0, :cond_1

    :goto_1
    invoke-direct {v3, v4, v5, v1}, Lcom/vkontakte/android/api/board/BoardFixTopic;-><init>(IIZ)V

    new-instance v1, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment$4;

    invoke-direct {v1, p0, p0, v0, p1}, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment$4;-><init>(Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;Landroid/app/Fragment;ZLcom/vkontakte/android/api/BoardTopic;)V

    invoke-virtual {v3, v1}, Lcom/vkontakte/android/api/board/BoardFixTopic;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    .line 244
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;->contentView:Landroid/view/ViewGroup;

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/view/View;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 245
    return-void

    .end local v0    # "isFixed":Z
    :cond_0
    move v0, v2

    .line 208
    goto :goto_0

    .restart local v0    # "isFixed":Z
    :cond_1
    move v1, v2

    .line 209
    goto :goto_1
.end method


# virtual methods
.method public doLoadData(II)V
    .locals 2
    .param p1, "offset"    # I
    .param p2, "count"    # I

    .prologue
    .line 108
    new-instance v0, Lcom/vkontakte/android/api/board/BoardGetTopics;

    invoke-direct {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;->getGroupId()I

    move-result v1

    invoke-direct {v0, v1, p1, p2}, Lcom/vkontakte/android/api/board/BoardGetTopics;-><init>(III)V

    new-instance v1, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment$1;

    invoke-direct {v1, p0, p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment$1;-><init>(Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;Landroid/app/Fragment;)V

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/board/BoardGetTopics;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 118
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;->currentRequest:Lme/grishka/appkit/api/APIRequest;

    .line 119
    return-void
.end method

.method protected bridge synthetic getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;
    .locals 1

    .prologue
    .line 39
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;->getAdapter()Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment$TopicListAdapter;

    move-result-object v0

    return-object v0
.end method

.method protected getAdapter()Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment$TopicListAdapter;
    .locals 1

    .prologue
    .line 82
    iget-object v0, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;->adapter:Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment$TopicListAdapter;

    if-nez v0, :cond_0

    .line 83
    new-instance v0, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment$TopicListAdapter;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment$TopicListAdapter;-><init>(Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;->adapter:Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment$TopicListAdapter;

    .line 85
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;->adapter:Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment$TopicListAdapter;

    return-object v0
.end method

.method synthetic lambda$confirmDeleteTopic$4(Lcom/vkontakte/android/api/BoardTopic;Landroid/content/DialogInterface;I)V
    .locals 0
    .param p1, "topic"    # Lcom/vkontakte/android/api/BoardTopic;
    .param p2, "dialog"    # Landroid/content/DialogInterface;
    .param p3, "which"    # I

    .prologue
    .line 178
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;->deleteTopic(Lcom/vkontakte/android/api/BoardTopic;)V

    return-void
.end method

.method synthetic lambda$onLongClick$3(Lcom/vkontakte/android/api/BoardTopic;Landroid/content/DialogInterface;I)V
    .locals 0
    .param p1, "topic"    # Lcom/vkontakte/android/api/BoardTopic;
    .param p2, "dialog"    # Landroid/content/DialogInterface;
    .param p3, "which"    # I

    .prologue
    .line 161
    packed-switch p3, :pswitch_data_0

    .line 172
    :goto_0
    return-void

    .line 163
    :pswitch_0
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;->confirmDeleteTopic(Lcom/vkontakte/android/api/BoardTopic;)V

    goto :goto_0

    .line 166
    :pswitch_1
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;->toggleCloseTopic(Lcom/vkontakte/android/api/BoardTopic;)V

    goto :goto_0

    .line 169
    :pswitch_2
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;->toggleFixTopic(Lcom/vkontakte/android/api/BoardTopic;)V

    goto :goto_0

    .line 161
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method synthetic lambda$showCreateBox$0(Landroid/widget/EditText;Landroid/content/DialogInterface;I)V
    .locals 4
    .param p1, "edit"    # Landroid/widget/EditText;
    .param p2, "dialog"    # Landroid/content/DialogInterface;
    .param p3, "which"    # I

    .prologue
    .line 130
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;->refreshOnResume:Z

    .line 131
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 132
    .local v0, "title1":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_0

    .line 136
    :goto_0
    return-void

    .line 135
    :cond_0
    new-instance v1, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$Builder;

    const/4 v2, -0x1

    invoke-direct {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;->getGroupId()I

    move-result v3

    invoke-direct {v1, v2, v3, v0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$Builder;-><init>(IILjava/lang/String;)V

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$Builder;->go(Landroid/content/Context;)Z

    goto :goto_0
.end method

.method synthetic lambda$showCreateBox$1(Landroid/widget/EditText;Landroid/content/DialogInterface;)V
    .locals 2
    .param p1, "edit"    # Landroid/widget/EditText;
    .param p2, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 138
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const-string/jumbo v1, "input_method"

    invoke-virtual {v0, v1}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    const/4 v1, 0x1

    invoke-virtual {v0, p1, v1}, Landroid/view/inputmethod/InputMethodManager;->showSoftInput(Landroid/view/View;I)Z

    .line 139
    return-void
.end method

.method synthetic lambda$updateList$2()V
    .locals 1

    .prologue
    .line 144
    iget-object v0, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;->adapter:Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment$TopicListAdapter;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment$TopicListAdapter;->notifyDataSetChanged()V

    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 5
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v4, 0x1

    .line 249
    if-ne p1, v4, :cond_1

    const/4 v2, -0x1

    if-ne p2, v2, :cond_1

    .line 250
    new-instance v1, Lcom/vkontakte/android/api/BoardTopic;

    invoke-direct {v1}, Lcom/vkontakte/android/api/BoardTopic;-><init>()V

    .line 251
    .local v1, "topic":Lcom/vkontakte/android/api/BoardTopic;
    const-string/jumbo v2, "id"

    const/4 v3, 0x0

    invoke-virtual {p3, v2, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    iput v2, v1, Lcom/vkontakte/android/api/BoardTopic;->id:I

    .line 252
    invoke-static {}, Lcom/vkontakte/android/TimeUtils;->getCurrentTime()I

    move-result v2

    iput v2, v1, Lcom/vkontakte/android/api/BoardTopic;->created:I

    iput v2, v1, Lcom/vkontakte/android/api/BoardTopic;->updated:I

    .line 253
    const-string/jumbo v2, "title"

    invoke-virtual {p3, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/vkontakte/android/api/BoardTopic;->title:Ljava/lang/String;

    .line 254
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v2

    iput v2, v1, Lcom/vkontakte/android/api/BoardTopic;->lastCommentUid:I

    .line 255
    iput v4, v1, Lcom/vkontakte/android/api/BoardTopic;->numComments:I

    .line 256
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v2

    iput v2, v1, Lcom/vkontakte/android/api/BoardTopic;->creator:I

    .line 257
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v2, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;->data:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v0, v2, :cond_0

    .line 258
    iget-object v2, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;->data:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/api/BoardTopic;

    iget v2, v2, Lcom/vkontakte/android/api/BoardTopic;->flags:I

    and-int/lit8 v2, v2, 0x2

    if-nez v2, :cond_2

    .line 259
    iget-object v2, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;->data:Ljava/util/ArrayList;

    invoke-virtual {v2, v0, v1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 263
    :cond_0
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;->updateList()V

    .line 265
    .end local v0    # "i":I
    .end local v1    # "topic":Lcom/vkontakte/android/api/BoardTopic;
    :cond_1
    return-void

    .line 257
    .restart local v0    # "i":I
    .restart local v1    # "topic":Lcom/vkontakte/android/api/BoardTopic;
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public onAttach(Landroid/app/Activity;)V
    .locals 2
    .param p1, "act"    # Landroid/app/Activity;

    .prologue
    .line 71
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/CardRecyclerFragment;->onAttach(Landroid/app/Activity;)V

    .line 72
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "board"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-direct {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;->getGroupId()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/vkontakte/android/ActivityUtils;->setBeamLink(Landroid/app/Activity;Ljava/lang/String;)V

    .line 74
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;->loadData()V

    .line 76
    const v0, 0x7f080717

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;->setTitle(I)V

    .line 77
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;->setHasOptionsMenu(Z)V

    .line 78
    return-void
.end method

.method public onClick(Lcom/vkontakte/android/api/BoardTopic;Z)V
    .locals 4
    .param p1, "topic"    # Lcom/vkontakte/android/api/BoardTopic;
    .param p2, "showLast"    # Z

    .prologue
    .line 149
    new-instance v0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$Builder;

    iget v1, p1, Lcom/vkontakte/android/api/BoardTopic;->id:I

    invoke-direct {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;->getGroupId()I

    move-result v2

    iget-object v3, p1, Lcom/vkontakte/android/api/BoardTopic;->title:Ljava/lang/String;

    invoke-direct {v0, v1, v2, v3}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$Builder;-><init>(IILjava/lang/String;)V

    invoke-direct {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;->getGroupId()I

    move-result v1

    invoke-static {v1}, Lcom/vkontakte/android/data/Groups;->isGroupAdmin(I)Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$Builder;->setIsAdmin(Z)Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$Builder;

    move-result-object v1

    iget v0, p1, Lcom/vkontakte/android/api/BoardTopic;->flags:I

    and-int/lit8 v0, v0, 0x1

    if-lez v0, :cond_0

    const/4 v0, 0x1

    .line 150
    :goto_0
    invoke-virtual {v1, v0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$Builder;->setIsClosed(Z)Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$Builder;

    move-result-object v0

    iget v1, p1, Lcom/vkontakte/android/api/BoardTopic;->numComments:I

    invoke-virtual {v0, p2, v1}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$Builder;->showLast(ZI)Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$Builder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$Builder;->go(Landroid/content/Context;)Z

    .line 151
    return-void

    .line 149
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V
    .locals 2
    .param p1, "menu"    # Landroid/view/Menu;
    .param p2, "inflater"    # Landroid/view/MenuInflater;

    .prologue
    .line 89
    const v0, 0x7f110013

    invoke-virtual {p2, v0, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 90
    const v0, 0x7f1002af

    invoke-interface {p1, v0}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    iget-boolean v1, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;->canCreate:Z

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 91
    return-void
.end method

.method public onDestroy()V
    .locals 1

    .prologue
    .line 101
    invoke-super {p0}, Lcom/vkontakte/android/fragments/CardRecyclerFragment;->onDestroy()V

    .line 102
    iget-object v0, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;->currentRequest:Lme/grishka/appkit/api/APIRequest;

    if-eqz v0, :cond_0

    .line 103
    iget-object v0, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;->currentRequest:Lme/grishka/appkit/api/APIRequest;

    invoke-virtual {v0}, Lme/grishka/appkit/api/APIRequest;->cancel()V

    .line 105
    :cond_0
    return-void
.end method

.method public onLongClick(Lcom/vkontakte/android/api/BoardTopic;)Z
    .locals 6
    .param p1, "topic"    # Lcom/vkontakte/android/api/BoardTopic;

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 155
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;->getGroupId()I

    move-result v2

    invoke-static {v2}, Lcom/vkontakte/android/data/Groups;->isGroupAdmin(I)Z

    move-result v2

    if-nez v2, :cond_0

    iget v2, p1, Lcom/vkontakte/android/api/BoardTopic;->creator:I

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v3

    invoke-virtual {v3}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v3

    if-eq v2, v3, :cond_0

    .line 173
    :goto_0
    return v0

    .line 158
    :cond_0
    new-instance v2, Lcom/vkontakte/android/VKAlertDialog$Builder;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/vkontakte/android/VKAlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/String;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f08019c

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v0

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    iget v0, p1, Lcom/vkontakte/android/api/BoardTopic;->flags:I

    and-int/lit8 v0, v0, 0x1

    if-lez v0, :cond_1

    const v0, 0x7f080489

    .line 159
    :goto_1
    invoke-virtual {v4, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    aput-object v0, v3, v1

    const/4 v4, 0x2

    .line 160
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    iget v0, p1, Lcom/vkontakte/android/api/BoardTopic;->flags:I

    and-int/lit8 v0, v0, 0x2

    if-lez v0, :cond_2

    const v0, 0x7f08071e

    :goto_2
    invoke-virtual {v5, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    aput-object v0, v3, v4

    invoke-static {p0, p1}, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment$$Lambda$4;->lambdaFactory$(Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;Lcom/vkontakte/android/api/BoardTopic;)Landroid/content/DialogInterface$OnClickListener;

    move-result-object v0

    .line 158
    invoke-virtual {v2, v3, v0}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 172
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    move v0, v1

    .line 173
    goto :goto_0

    .line 158
    :cond_1
    const v0, 0x7f08014a

    goto :goto_1

    .line 160
    :cond_2
    const v0, 0x7f08021c

    goto :goto_2
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 2
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 94
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f1002af

    if-ne v0, v1, :cond_0

    .line 95
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;->showCreateBox()V

    .line 97
    :cond_0
    const/4 v0, 0x1

    return v0
.end method

.method public onResume()V
    .locals 1

    .prologue
    .line 291
    invoke-super {p0}, Lcom/vkontakte/android/fragments/CardRecyclerFragment;->onResume()V

    .line 292
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;->updateList()V

    .line 293
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;->refreshOnResume:Z

    if-eqz v0, :cond_0

    .line 294
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;->refreshOnResume:Z

    .line 295
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;->refresh()V

    .line 297
    :cond_0
    return-void
.end method

.method public updateList()V
    .locals 1

    .prologue
    .line 144
    invoke-static {p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment$$Lambda$3;->lambdaFactory$(Lcom/vkontakte/android/fragments/discussions/BoardTopicsFragment;)Ljava/lang/Runnable;

    move-result-object v0

    invoke-static {v0}, Lcom/vkontakte/android/ViewUtils;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 145
    return-void
.end method
