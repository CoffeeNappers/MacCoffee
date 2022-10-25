.class public Lcom/vkontakte/android/api/board/BoardCommentsLoader;
.super Ljava/lang/Object;
.source "BoardCommentsLoader.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/api/board/BoardCommentsLoader$BoardCommentsLoaderListener;
    }
.end annotation


# instance fields
.field private cache:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/util/LinkedList",
            "<",
            "Lcom/vkontakte/android/api/board/BoardComment;",
            ">;>;"
        }
    .end annotation
.end field

.field private final countOnPage:I

.field private volatile downRequest:Lcom/vkontakte/android/api/board/BoardGetComments;

.field private final groupId:I

.field private volatile isDownLoaded:Z

.field private volatile isDownLoading:Z

.field private volatile isUpLoaded:Z

.field private volatile isUpLoading:Z

.field private linkedList:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<",
            "Lcom/vkontakte/android/api/board/BoardComment;",
            ">;"
        }
    .end annotation
.end field

.field private final listener:Lcom/vkontakte/android/api/board/BoardCommentsLoader$BoardCommentsLoaderListener;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field

.field private loadEnd:Z

.field private offset:I

.field session:Ljava/util/concurrent/atomic/AtomicInteger;

.field private topicId:I

.field private total:I

.field private volatile upRequest:Lcom/vkontakte/android/api/board/BoardGetComments;


# direct methods
.method public constructor <init>(IIILcom/vkontakte/android/api/board/BoardCommentsLoader$BoardCommentsLoaderListener;Z)V
    .locals 3
    .param p1, "groupId"    # I
    .param p2, "topicId"    # I
    .param p3, "countOnPage"    # I
    .param p4, "listener"    # Lcom/vkontakte/android/api/board/BoardCommentsLoader$BoardCommentsLoaderListener;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p5, "loadEnd"    # Z

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v0, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->session:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 21
    const/4 v0, -0x1

    iput v0, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->total:I

    .line 22
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->cache:Ljava/util/ArrayList;

    .line 24
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->linkedList:Ljava/util/LinkedList;

    .line 27
    iput-object v2, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->upRequest:Lcom/vkontakte/android/api/board/BoardGetComments;

    .line 28
    iput-object v2, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->downRequest:Lcom/vkontakte/android/api/board/BoardGetComments;

    .line 32
    iput-boolean v1, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->isDownLoaded:Z

    .line 47
    iput p1, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->groupId:I

    .line 48
    iput p2, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->topicId:I

    .line 49
    iput p3, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->countOnPage:I

    .line 50
    iput-object p4, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->listener:Lcom/vkontakte/android/api/board/BoardCommentsLoader$BoardCommentsLoaderListener;

    .line 51
    iput-boolean p5, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->loadEnd:Z

    .line 52
    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/api/board/BoardCommentsLoader;Lcom/vkontakte/android/api/board/BoardGetComments$Result;Z)I
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/api/board/BoardCommentsLoader;
    .param p1, "x1"    # Lcom/vkontakte/android/api/board/BoardGetComments$Result;
    .param p2, "x2"    # Z

    .prologue
    .line 16
    invoke-direct {p0, p1, p2}, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->processComments(Lcom/vkontakte/android/api/board/BoardGetComments$Result;Z)I

    move-result v0

    return v0
.end method

.method static synthetic access$102(Lcom/vkontakte/android/api/board/BoardCommentsLoader;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/api/board/BoardCommentsLoader;
    .param p1, "x1"    # Z

    .prologue
    .line 16
    iput-boolean p1, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->isUpLoaded:Z

    return p1
.end method

.method static synthetic access$200(Lcom/vkontakte/android/api/board/BoardCommentsLoader;)I
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/api/board/BoardCommentsLoader;

    .prologue
    .line 16
    iget v0, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->offset:I

    return v0
.end method

.method static synthetic access$202(Lcom/vkontakte/android/api/board/BoardCommentsLoader;I)I
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/api/board/BoardCommentsLoader;
    .param p1, "x1"    # I

    .prologue
    .line 16
    iput p1, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->offset:I

    return p1
.end method

.method static synthetic access$302(Lcom/vkontakte/android/api/board/BoardCommentsLoader;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/api/board/BoardCommentsLoader;
    .param p1, "x1"    # Z

    .prologue
    .line 16
    iput-boolean p1, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->isUpLoading:Z

    return p1
.end method

.method static synthetic access$400(Lcom/vkontakte/android/api/board/BoardCommentsLoader;)Ljava/util/LinkedList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/api/board/BoardCommentsLoader;

    .prologue
    .line 16
    iget-object v0, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->linkedList:Ljava/util/LinkedList;

    return-object v0
.end method

.method static synthetic access$500(Lcom/vkontakte/android/api/board/BoardCommentsLoader;)Lcom/vkontakte/android/api/board/BoardCommentsLoader$BoardCommentsLoaderListener;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/api/board/BoardCommentsLoader;

    .prologue
    .line 16
    iget-object v0, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->listener:Lcom/vkontakte/android/api/board/BoardCommentsLoader$BoardCommentsLoaderListener;

    return-object v0
.end method

.method static synthetic access$600(Lcom/vkontakte/android/api/board/BoardCommentsLoader;)I
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/api/board/BoardCommentsLoader;

    .prologue
    .line 16
    invoke-direct {p0}, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->countForLoad()I

    move-result v0

    return v0
.end method

.method static synthetic access$702(Lcom/vkontakte/android/api/board/BoardCommentsLoader;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/api/board/BoardCommentsLoader;
    .param p1, "x1"    # Z

    .prologue
    .line 16
    iput-boolean p1, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->isDownLoaded:Z

    return p1
.end method

.method static synthetic access$802(Lcom/vkontakte/android/api/board/BoardCommentsLoader;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/api/board/BoardCommentsLoader;
    .param p1, "x1"    # Z

    .prologue
    .line 16
    iput-boolean p1, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->isDownLoading:Z

    return p1
.end method

.method static synthetic access$900(Lcom/vkontakte/android/api/board/BoardCommentsLoader;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/api/board/BoardCommentsLoader;

    .prologue
    .line 16
    iget-boolean v0, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->loadEnd:Z

    return v0
.end method

.method static synthetic access$902(Lcom/vkontakte/android/api/board/BoardCommentsLoader;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/api/board/BoardCommentsLoader;
    .param p1, "x1"    # Z

    .prologue
    .line 16
    iput-boolean p1, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->loadEnd:Z

    return p1
.end method

.method private static containOffset(Ljava/util/LinkedList;I)Z
    .locals 1
    .param p1, "offset"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/LinkedList",
            "<",
            "Lcom/vkontakte/android/api/board/BoardComment;",
            ">;I)Z"
        }
    .end annotation

    .prologue
    .line 71
    .local p0, "linkedList":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lcom/vkontakte/android/api/board/BoardComment;>;"
    invoke-virtual {p0}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Ljava/util/LinkedList;->getFirst()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/api/board/BoardComment;

    iget v0, v0, Lcom/vkontakte/android/api/board/BoardComment;->offset:I

    if-lt p1, v0, :cond_0

    invoke-virtual {p0}, Ljava/util/LinkedList;->getLast()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/api/board/BoardComment;

    iget v0, v0, Lcom/vkontakte/android/api/board/BoardComment;->offset:I

    if-gt p1, v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private countForLoad()I
    .locals 1

    .prologue
    .line 59
    iget v0, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->countOnPage:I

    mul-int/lit8 v0, v0, 0x2

    return v0
.end method

.method private getBottomOffset()I
    .locals 1

    .prologue
    .line 67
    iget-object v0, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->linkedList:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->linkedList:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->getLast()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/api/board/BoardComment;

    iget v0, v0, Lcom/vkontakte/android/api/board/BoardComment;->offset:I

    goto :goto_0
.end method

.method private getCacheFor(I)Ljava/util/LinkedList;
    .locals 3
    .param p1, "offset"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/LinkedList",
            "<",
            "Lcom/vkontakte/android/api/board/BoardComment;",
            ">;"
        }
    .end annotation

    .prologue
    .line 166
    iget-object v1, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->cache:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/LinkedList;

    .line 167
    .local v0, "comments":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lcom/vkontakte/android/api/board/BoardComment;>;"
    invoke-static {v0, p1}, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->containOffset(Ljava/util/LinkedList;I)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 171
    .end local v0    # "comments":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lcom/vkontakte/android/api/board/BoardComment;>;"
    :goto_0
    return-object v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private getTopOffset()I
    .locals 1

    .prologue
    .line 63
    iget-object v0, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->linkedList:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->linkedList:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->getFirst()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/api/board/BoardComment;

    iget v0, v0, Lcom/vkontakte/android/api/board/BoardComment;->offset:I

    goto :goto_0
.end method

.method private processBottomComments(Ljava/util/List;)I
    .locals 6
    .param p1    # Ljava/util/List;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/api/board/BoardComment;",
            ">;)I"
        }
    .end annotation

    .prologue
    .local p1, "comments":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/api/board/BoardComment;>;"
    const/4 v3, 0x0

    .line 111
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    .line 112
    .local v0, "addedCount":I
    iget-object v2, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->linkedList:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->size()I

    move-result v1

    .line 113
    .local v1, "startItem":I
    :goto_0
    iget-object v2, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->linkedList:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_0

    iget-object v2, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->linkedList:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->getLast()Ljava/lang/Object;

    move-result-object v2

    invoke-interface {p1, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 114
    iget-object v2, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->linkedList:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->removeLast()Ljava/lang/Object;

    .line 115
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 117
    :cond_0
    iget-object v2, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->linkedList:Ljava/util/LinkedList;

    invoke-virtual {v2, p1}, Ljava/util/LinkedList;->addAll(Ljava/util/Collection;)Z

    .line 118
    if-nez v0, :cond_1

    const/4 v2, 0x1

    :goto_1
    iput-boolean v2, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->isDownLoaded:Z

    .line 119
    iget-object v2, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->listener:Lcom/vkontakte/android/api/board/BoardCommentsLoader$BoardCommentsLoaderListener;

    new-instance v4, Ljava/util/ArrayList;

    iget-object v5, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->linkedList:Ljava/util/LinkedList;

    invoke-direct {v4, v5}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-interface {v2, v1, v0, v3, v4}, Lcom/vkontakte/android/api/board/BoardCommentsLoader$BoardCommentsLoaderListener;->onCommentLoaded(IIZLjava/util/List;)V

    .line 120
    return v0

    :cond_1
    move v2, v3

    .line 118
    goto :goto_1
.end method

.method private processComments(Lcom/vkontakte/android/api/board/BoardGetComments$Result;Z)I
    .locals 12
    .param p1, "r"    # Lcom/vkontakte/android/api/board/BoardGetComments$Result;
    .param p2, "isTop"    # Z

    .prologue
    const/4 v9, 0x1

    .line 85
    iget v0, p1, Lcom/vkontakte/android/api/board/BoardGetComments$Result;->pId:I

    if-lez v0, :cond_0

    .line 86
    iget-object v11, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->listener:Lcom/vkontakte/android/api/board/BoardCommentsLoader$BoardCommentsLoaderListener;

    new-instance v0, Lcom/vkontakte/android/attachments/PollAttachment;

    iget-object v1, p1, Lcom/vkontakte/android/api/board/BoardGetComments$Result;->pQuestion:Ljava/lang/String;

    iget v2, p1, Lcom/vkontakte/android/api/board/BoardGetComments$Result;->pOwnerId:I

    iget v3, p1, Lcom/vkontakte/android/api/board/BoardGetComments$Result;->pId:I

    iget-object v4, p1, Lcom/vkontakte/android/api/board/BoardGetComments$Result;->pOptions:Ljava/util/ArrayList;

    iget v5, p1, Lcom/vkontakte/android/api/board/BoardGetComments$Result;->pVotes:I

    iget v6, p1, Lcom/vkontakte/android/api/board/BoardGetComments$Result;->pAnsId:I

    iget v7, p1, Lcom/vkontakte/android/api/board/BoardGetComments$Result;->pAnonymous:I

    if-eqz v7, :cond_2

    move v7, v9

    :goto_0
    iget v8, p1, Lcom/vkontakte/android/api/board/BoardGetComments$Result;->pCreated:I

    invoke-direct/range {v0 .. v9}, Lcom/vkontakte/android/attachments/PollAttachment;-><init>(Ljava/lang/String;IILjava/util/ArrayList;IIZIZ)V

    invoke-interface {v11, v0}, Lcom/vkontakte/android/api/board/BoardCommentsLoader$BoardCommentsLoaderListener;->updatePool(Lcom/vkontakte/android/attachments/PollAttachment;)V

    .line 90
    :cond_0
    if-eqz p2, :cond_3

    iget-object v0, p1, Lcom/vkontakte/android/api/board/BoardGetComments$Result;->comments:Ljava/util/ArrayList;

    invoke-direct {p0, v0}, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->processTopComments(Ljava/util/List;)I

    move-result v10

    .line 91
    .local v10, "addedCount":I
    :goto_1
    iget v0, p1, Lcom/vkontakte/android/api/board/BoardGetComments$Result;->total:I

    iget v1, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->total:I

    if-ge v0, v1, :cond_1

    .line 92
    iget-object v0, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->cache:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 94
    :cond_1
    iget v0, p1, Lcom/vkontakte/android/api/board/BoardGetComments$Result;->total:I

    invoke-direct {p0, v0}, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->setTotal(I)V

    .line 95
    return v10

    .line 86
    .end local v10    # "addedCount":I
    :cond_2
    const/4 v7, 0x0

    goto :goto_0

    .line 90
    :cond_3
    iget-object v0, p1, Lcom/vkontakte/android/api/board/BoardGetComments$Result;->comments:Ljava/util/ArrayList;

    invoke-direct {p0, v0}, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->processBottomComments(Ljava/util/List;)I

    move-result v10

    goto :goto_1
.end method

.method private processTopComments(Ljava/util/List;)I
    .locals 6
    .param p1    # Ljava/util/List;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/api/board/BoardComment;",
            ">;)I"
        }
    .end annotation

    .prologue
    .local p1, "comments":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/api/board/BoardComment;>;"
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 99
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    .line 100
    .local v0, "addedCount":I
    :goto_0
    iget-object v1, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->linkedList:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->linkedList:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->getFirst()Ljava/lang/Object;

    move-result-object v1

    invoke-interface {p1, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 101
    iget-object v1, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->linkedList:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->removeFirst()Ljava/lang/Object;

    .line 102
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 104
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->linkedList:Ljava/util/LinkedList;

    invoke-virtual {v1, v3, p1}, Ljava/util/LinkedList;->addAll(ILjava/util/Collection;)Z

    .line 105
    if-nez v0, :cond_1

    move v1, v2

    :goto_1
    iput-boolean v1, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->isUpLoaded:Z

    .line 106
    iget-object v1, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->listener:Lcom/vkontakte/android/api/board/BoardCommentsLoader$BoardCommentsLoaderListener;

    new-instance v4, Ljava/util/ArrayList;

    iget-object v5, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->linkedList:Ljava/util/LinkedList;

    invoke-direct {v4, v5}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-interface {v1, v3, v0, v2, v4}, Lcom/vkontakte/android/api/board/BoardCommentsLoader$BoardCommentsLoaderListener;->onCommentLoaded(IIZLjava/util/List;)V

    .line 107
    return v0

    :cond_1
    move v1, v3

    .line 105
    goto :goto_1
.end method

.method private static removeCommentFromListCorrectly(Ljava/util/LinkedList;Lcom/vkontakte/android/api/board/BoardComment;)I
    .locals 6
    .param p1, "boardComment"    # Lcom/vkontakte/android/api/board/BoardComment;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/LinkedList",
            "<",
            "Lcom/vkontakte/android/api/board/BoardComment;",
            ">;",
            "Lcom/vkontakte/android/api/board/BoardComment;",
            ")I"
        }
    .end annotation

    .prologue
    .line 143
    .local p0, "list":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lcom/vkontakte/android/api/board/BoardComment;>;"
    const/4 v2, -0x1

    .local v2, "index":I
    const/4 v1, 0x0

    .line 144
    .local v1, "i":I
    invoke-virtual {p0}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/vkontakte/android/api/board/BoardComment;>;"
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 145
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/api/board/BoardComment;

    .line 146
    .local v0, "comment":Lcom/vkontakte/android/api/board/BoardComment;
    invoke-virtual {p1, v0}, Lcom/vkontakte/android/api/board/BoardComment;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 147
    invoke-interface {v3}, Ljava/util/Iterator;->remove()V

    .line 148
    move v2, v1

    .line 152
    :cond_0
    :goto_1
    add-int/lit8 v1, v1, 0x1

    .line 153
    goto :goto_0

    .line 149
    :cond_1
    iget v4, p1, Lcom/vkontakte/android/api/board/BoardComment;->offset:I

    iget v5, v0, Lcom/vkontakte/android/api/board/BoardComment;->offset:I

    if-ge v4, v5, :cond_0

    .line 150
    iget v4, v0, Lcom/vkontakte/android/api/board/BoardComment;->offset:I

    add-int/lit8 v4, v4, -0x1

    iput v4, v0, Lcom/vkontakte/android/api/board/BoardComment;->offset:I

    goto :goto_1

    .line 154
    .end local v0    # "comment":Lcom/vkontakte/android/api/board/BoardComment;
    :cond_2
    return v2
.end method

.method private setCurrentListToCache()V
    .locals 2

    .prologue
    .line 160
    iget-object v0, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->linkedList:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 161
    iget-object v0, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->cache:Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->linkedList:Ljava/util/LinkedList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 163
    :cond_0
    return-void
.end method

.method private setTotal(I)V
    .locals 1
    .param p1, "total"    # I

    .prologue
    .line 75
    iget-object v0, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->linkedList:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    move-result v0

    if-le v0, p1, :cond_0

    .line 76
    iget-object v0, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->linkedList:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    move-result p1

    .line 78
    :cond_0
    iput p1, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->total:I

    .line 79
    iget-object v0, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->listener:Lcom/vkontakte/android/api/board/BoardCommentsLoader$BoardCommentsLoaderListener;

    invoke-interface {v0, p1}, Lcom/vkontakte/android/api/board/BoardCommentsLoader$BoardCommentsLoaderListener;->updateTotal(I)V

    .line 80
    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 1

    .prologue
    .line 177
    iget-object v0, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->upRequest:Lcom/vkontakte/android/api/board/BoardGetComments;

    .line 178
    .local v0, "request":Lcom/vkontakte/android/api/VKAPIRequest;
    if-eqz v0, :cond_0

    .line 179
    invoke-virtual {v0}, Lcom/vkontakte/android/api/VKAPIRequest;->cancel()V

    .line 181
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->downRequest:Lcom/vkontakte/android/api/board/BoardGetComments;

    .line 182
    if-eqz v0, :cond_1

    .line 183
    invoke-virtual {v0}, Lcom/vkontakte/android/api/VKAPIRequest;->cancel()V

    .line 185
    :cond_1
    return-void
.end method

.method public getTotal()I
    .locals 1

    .prologue
    .line 364
    iget v0, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->total:I

    return v0
.end method

.method public init(ILandroid/content/Context;)V
    .locals 2
    .param p1, "offset"    # I
    .param p2, "ctx"    # Landroid/content/Context;

    .prologue
    const/4 v1, 0x0

    .line 124
    iget-object v0, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->session:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    .line 126
    iput-boolean v1, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->isDownLoading:Z

    .line 127
    iput-boolean v1, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->isDownLoaded:Z

    .line 129
    iput-boolean v1, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->isUpLoading:Z

    .line 130
    iput-boolean v1, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->isUpLoaded:Z

    .line 132
    iput p1, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->offset:I

    .line 133
    const/4 v0, -0x1

    iput v0, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->total:I

    .line 135
    invoke-direct {p0}, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->setCurrentListToCache()V

    .line 136
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->linkedList:Ljava/util/LinkedList;

    .line 137
    iget-object v0, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->listener:Lcom/vkontakte/android/api/board/BoardCommentsLoader$BoardCommentsLoaderListener;

    invoke-interface {v0}, Lcom/vkontakte/android/api/board/BoardCommentsLoader$BoardCommentsLoaderListener;->onStartReload()V

    .line 139
    invoke-virtual {p0, p2}, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->loadDown(Landroid/content/Context;)V

    .line 140
    return-void
.end method

.method public insertComment(Lcom/vkontakte/android/api/board/BoardComment;)V
    .locals 6
    .param p1, "boardComment"    # Lcom/vkontakte/android/api/board/BoardComment;

    .prologue
    const/4 v5, 0x1

    .line 331
    invoke-virtual {p0}, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->isEndOfListLoaded()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 332
    iget v0, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->total:I

    iput v0, p1, Lcom/vkontakte/android/api/board/BoardComment;->offset:I

    .line 333
    iget-object v0, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->linkedList:Ljava/util/LinkedList;

    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 334
    iget v0, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->total:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->total:I

    .line 335
    iget-object v0, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->listener:Lcom/vkontakte/android/api/board/BoardCommentsLoader$BoardCommentsLoaderListener;

    iget v1, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->total:I

    invoke-interface {v0, v1}, Lcom/vkontakte/android/api/board/BoardCommentsLoader$BoardCommentsLoaderListener;->updateTotal(I)V

    .line 336
    iget-object v0, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->listener:Lcom/vkontakte/android/api/board/BoardCommentsLoader$BoardCommentsLoaderListener;

    iget v1, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->total:I

    add-int/lit8 v1, v1, -0x1

    const/4 v2, 0x0

    new-instance v3, Ljava/util/ArrayList;

    iget-object v4, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->linkedList:Ljava/util/LinkedList;

    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-interface {v0, v1, v5, v2, v3}, Lcom/vkontakte/android/api/board/BoardCommentsLoader$BoardCommentsLoaderListener;->onCommentLoaded(IIZLjava/util/List;)V

    .line 337
    iget-object v0, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->listener:Lcom/vkontakte/android/api/board/BoardCommentsLoader$BoardCommentsLoaderListener;

    iget v1, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->total:I

    add-int/lit8 v1, v1, -0x1

    invoke-interface {v0, v1, v5}, Lcom/vkontakte/android/api/board/BoardCommentsLoader$BoardCommentsLoaderListener;->scrollToPosition(IZ)V

    .line 339
    :cond_0
    return-void
.end method

.method public isDownLoaded()Z
    .locals 1

    .prologue
    .line 360
    iget-boolean v0, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->isDownLoaded:Z

    return v0
.end method

.method public isEndOfListLoaded()Z
    .locals 2

    .prologue
    .line 327
    iget-object v0, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->linkedList:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->linkedList:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->getLast()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/api/board/BoardComment;

    iget v0, v0, Lcom/vkontakte/android/api/board/BoardComment;->offset:I

    iget v1, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->total:I

    add-int/lit8 v1, v1, -0x1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public declared-synchronized loadDown(Landroid/content/Context;)V
    .locals 7
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 279
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->isDownLoading:Z

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->isDownLoaded:Z

    if-nez v0, :cond_1

    .line 280
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->isDownLoading:Z

    .line 281
    iget-object v0, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->session:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v6

    .line 282
    .local v6, "session":I
    iget-object v0, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->listener:Lcom/vkontakte/android/api/board/BoardCommentsLoader$BoardCommentsLoaderListener;

    iget-object v1, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->linkedList:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->size()I

    move-result v1

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Lcom/vkontakte/android/api/board/BoardCommentsLoader$BoardCommentsLoaderListener;->onStartLoading(IZ)V

    .line 283
    iget-object v0, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->downRequest:Lcom/vkontakte/android/api/board/BoardGetComments;

    if-eqz v0, :cond_0

    .line 284
    iget-object v0, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->downRequest:Lcom/vkontakte/android/api/board/BoardGetComments;

    invoke-virtual {v0}, Lcom/vkontakte/android/api/board/BoardGetComments;->cancel()V

    .line 286
    :cond_0
    iget-boolean v0, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->loadEnd:Z

    if-eqz v0, :cond_2

    .line 287
    new-instance v0, Lcom/vkontakte/android/api/board/BoardGetComments;

    iget v1, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->groupId:I

    iget v2, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->topicId:I

    invoke-direct {p0}, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->countForLoad()I

    move-result v3

    sget-object v4, Lcom/vkontakte/android/api/board/BoardGetComments$PagingKey;->offset:Lcom/vkontakte/android/api/board/BoardGetComments$PagingKey;

    iget v5, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->offset:I

    invoke-direct/range {v0 .. v5}, Lcom/vkontakte/android/api/board/BoardGetComments;-><init>(IIILcom/vkontakte/android/api/board/BoardGetComments$PagingKey;I)V

    iput-object v0, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->downRequest:Lcom/vkontakte/android/api/board/BoardGetComments;

    .line 293
    :goto_0
    iget-object v0, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->downRequest:Lcom/vkontakte/android/api/board/BoardGetComments;

    new-instance v1, Lcom/vkontakte/android/api/board/BoardCommentsLoader$2;

    invoke-direct {v1, p0, v6, p1}, Lcom/vkontakte/android/api/board/BoardCommentsLoader$2;-><init>(Lcom/vkontakte/android/api/board/BoardCommentsLoader;ILandroid/content/Context;)V

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/board/BoardGetComments;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 322
    invoke-virtual {v0, p1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 324
    .end local v6    # "session":I
    :cond_1
    monitor-exit p0

    return-void

    .line 288
    .restart local v6    # "session":I
    :cond_2
    :try_start_1
    iget-object v0, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->linkedList:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 289
    new-instance v0, Lcom/vkontakte/android/api/board/BoardGetComments;

    iget v1, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->groupId:I

    iget v2, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->topicId:I

    invoke-direct {p0}, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->countForLoad()I

    move-result v3

    sget-object v4, Lcom/vkontakte/android/api/board/BoardGetComments$PagingKey;->offset:Lcom/vkontakte/android/api/board/BoardGetComments$PagingKey;

    iget v5, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->offset:I

    invoke-direct/range {v0 .. v5}, Lcom/vkontakte/android/api/board/BoardGetComments;-><init>(IIILcom/vkontakte/android/api/board/BoardGetComments$PagingKey;I)V

    iput-object v0, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->downRequest:Lcom/vkontakte/android/api/board/BoardGetComments;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 279
    .end local v6    # "session":I
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 291
    .restart local v6    # "session":I
    :cond_3
    :try_start_2
    new-instance v0, Lcom/vkontakte/android/api/board/BoardGetComments;

    iget v1, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->groupId:I

    iget v2, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->topicId:I

    invoke-direct {p0}, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->countForLoad()I

    move-result v3

    sget-object v4, Lcom/vkontakte/android/api/board/BoardGetComments$PagingKey;->startCommentId:Lcom/vkontakte/android/api/board/BoardGetComments$PagingKey;

    iget-object v5, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->linkedList:Ljava/util/LinkedList;

    invoke-virtual {v5}, Ljava/util/LinkedList;->getLast()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/vkontakte/android/api/board/BoardComment;

    iget v5, v5, Lcom/vkontakte/android/api/board/BoardComment;->id:I

    invoke-direct/range {v0 .. v5}, Lcom/vkontakte/android/api/board/BoardGetComments;-><init>(IIILcom/vkontakte/android/api/board/BoardGetComments$PagingKey;I)V

    iput-object v0, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->downRequest:Lcom/vkontakte/android/api/board/BoardGetComments;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0
.end method

.method public declared-synchronized loadTop(Landroid/content/Context;)V
    .locals 8
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 244
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->isUpLoading:Z

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->isUpLoaded:Z

    if-nez v0, :cond_1

    iget v0, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->total:I

    if-lez v0, :cond_1

    iget v0, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->offset:I

    if-lez v0, :cond_1

    .line 245
    iget-object v0, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->session:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v6

    .line 246
    .local v6, "session":I
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->isUpLoading:Z

    .line 247
    iget-object v0, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->listener:Lcom/vkontakte/android/api/board/BoardCommentsLoader$BoardCommentsLoaderListener;

    iget-object v1, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->linkedList:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->size()I

    move-result v1

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Lcom/vkontakte/android/api/board/BoardCommentsLoader$BoardCommentsLoaderListener;->onStartLoading(IZ)V

    .line 248
    iget-object v0, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->upRequest:Lcom/vkontakte/android/api/board/BoardGetComments;

    if-eqz v0, :cond_0

    .line 249
    iget-object v0, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->upRequest:Lcom/vkontakte/android/api/board/BoardGetComments;

    invoke-virtual {v0}, Lcom/vkontakte/android/api/board/BoardGetComments;->cancel()V

    .line 251
    :cond_0
    new-instance v0, Lcom/vkontakte/android/api/board/BoardGetComments;

    iget v1, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->groupId:I

    iget v2, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->topicId:I

    invoke-direct {p0}, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->countForLoad()I

    move-result v3

    sget-object v4, Lcom/vkontakte/android/api/board/BoardGetComments$PagingKey;->offset:Lcom/vkontakte/android/api/board/BoardGetComments$PagingKey;

    iget v5, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->offset:I

    iget v7, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->countOnPage:I

    sub-int/2addr v5, v7

    const/4 v7, 0x0

    .line 252
    invoke-static {v5, v7}, Ljava/lang/Math;->max(II)I

    move-result v5

    invoke-direct/range {v0 .. v5}, Lcom/vkontakte/android/api/board/BoardGetComments;-><init>(IIILcom/vkontakte/android/api/board/BoardGetComments$PagingKey;I)V

    iput-object v0, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->upRequest:Lcom/vkontakte/android/api/board/BoardGetComments;

    .line 253
    iget-object v0, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->upRequest:Lcom/vkontakte/android/api/board/BoardGetComments;

    new-instance v1, Lcom/vkontakte/android/api/board/BoardCommentsLoader$1;

    invoke-direct {v1, p0, v6}, Lcom/vkontakte/android/api/board/BoardCommentsLoader$1;-><init>(Lcom/vkontakte/android/api/board/BoardCommentsLoader;I)V

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/board/BoardGetComments;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 274
    invoke-virtual {v0, p1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 276
    .end local v6    # "session":I
    :cond_1
    monitor-exit p0

    return-void

    .line 244
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public removeComment(Lcom/vkontakte/android/api/board/BoardComment;)V
    .locals 5
    .param p1, "boardComment"    # Lcom/vkontakte/android/api/board/BoardComment;

    .prologue
    .line 188
    iget-object v2, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->linkedList:Ljava/util/LinkedList;

    invoke-static {v2, p1}, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->removeCommentFromListCorrectly(Ljava/util/LinkedList;Lcom/vkontakte/android/api/board/BoardComment;)I

    move-result v0

    .line 189
    .local v0, "index":I
    iget-object v2, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->cache:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/LinkedList;

    .line 190
    .local v1, "list":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lcom/vkontakte/android/api/board/BoardComment;>;"
    invoke-static {v1, p1}, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->removeCommentFromListCorrectly(Ljava/util/LinkedList;Lcom/vkontakte/android/api/board/BoardComment;)I

    goto :goto_0

    .line 192
    .end local v1    # "list":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lcom/vkontakte/android/api/board/BoardComment;>;"
    :cond_0
    iget-object v2, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->listener:Lcom/vkontakte/android/api/board/BoardCommentsLoader$BoardCommentsLoaderListener;

    iget v3, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->total:I

    add-int/lit8 v3, v3, -0x1

    iput v3, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->total:I

    invoke-interface {v2, v3}, Lcom/vkontakte/android/api/board/BoardCommentsLoader$BoardCommentsLoaderListener;->updateTotal(I)V

    .line 193
    iget-object v2, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->listener:Lcom/vkontakte/android/api/board/BoardCommentsLoader$BoardCommentsLoaderListener;

    new-instance v3, Ljava/util/ArrayList;

    iget-object v4, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->linkedList:Ljava/util/LinkedList;

    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-interface {v2, v0, v3}, Lcom/vkontakte/android/api/board/BoardCommentsLoader$BoardCommentsLoaderListener;->onItemDeleted(ILjava/util/List;)V

    .line 194
    return-void
.end method

.method public setTopicId(I)V
    .locals 0
    .param p1, "topicId"    # I

    .prologue
    .line 55
    iput p1, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->topicId:I

    .line 56
    return-void
.end method

.method public show(ILandroid/content/Context;)Lcom/vkontakte/android/api/board/BoardCommentsLoader;
    .locals 9
    .param p1, "offset"    # I
    .param p2, "ctx"    # Landroid/content/Context;

    .prologue
    const/4 v8, 0x0

    .line 197
    iget-object v3, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->session:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    .line 198
    iget-object v3, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->listener:Lcom/vkontakte/android/api/board/BoardCommentsLoader$BoardCommentsLoaderListener;

    iget-object v4, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->linkedList:Ljava/util/LinkedList;

    invoke-virtual {v4}, Ljava/util/LinkedList;->size()I

    move-result v4

    const/4 v5, 0x1

    invoke-interface {v3, v4, v5}, Lcom/vkontakte/android/api/board/BoardCommentsLoader$BoardCommentsLoaderListener;->onFinishLoading(IZ)V

    .line 199
    iget-object v3, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->listener:Lcom/vkontakte/android/api/board/BoardCommentsLoader$BoardCommentsLoaderListener;

    iget-object v4, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->linkedList:Ljava/util/LinkedList;

    invoke-virtual {v4}, Ljava/util/LinkedList;->size()I

    move-result v4

    invoke-interface {v3, v4, v8}, Lcom/vkontakte/android/api/board/BoardCommentsLoader$BoardCommentsLoaderListener;->onFinishLoading(IZ)V

    .line 202
    iget-object v3, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->linkedList:Ljava/util/LinkedList;

    invoke-static {v3, p1}, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->containOffset(Ljava/util/LinkedList;I)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 203
    const/4 v2, 0x0

    .line 204
    .local v2, "i":I
    iget-object v3, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->linkedList:Ljava/util/LinkedList;

    invoke-virtual {v3}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/api/board/BoardComment;

    .line 205
    .local v1, "comment":Lcom/vkontakte/android/api/board/BoardComment;
    iget v4, v1, Lcom/vkontakte/android/api/board/BoardComment;->offset:I

    if-ne v4, p1, :cond_0

    .line 206
    iget-object v4, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->listener:Lcom/vkontakte/android/api/board/BoardCommentsLoader$BoardCommentsLoaderListener;

    invoke-interface {v4, v2, v8}, Lcom/vkontakte/android/api/board/BoardCommentsLoader$BoardCommentsLoaderListener;->scrollToPosition(IZ)V

    .line 208
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 209
    goto :goto_0

    .line 210
    .end local v1    # "comment":Lcom/vkontakte/android/api/board/BoardComment;
    :cond_1
    iget v3, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->countOnPage:I

    sub-int v3, p1, v3

    invoke-direct {p0}, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->getTopOffset()I

    move-result v4

    if-gt v3, v4, :cond_2

    .line 211
    invoke-virtual {p0, p2}, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->loadTop(Landroid/content/Context;)V

    .line 213
    :cond_2
    iget v3, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->countOnPage:I

    add-int/2addr v3, p1

    invoke-direct {p0}, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->getBottomOffset()I

    move-result v4

    if-lt v3, v4, :cond_3

    .line 214
    invoke-virtual {p0, p2}, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->loadDown(Landroid/content/Context;)V

    .line 240
    .end local v2    # "i":I
    :cond_3
    :goto_1
    return-object p0

    .line 216
    :cond_4
    invoke-direct {p0, p1}, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->getCacheFor(I)Ljava/util/LinkedList;

    move-result-object v0

    .local v0, "cacheList":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lcom/vkontakte/android/api/board/BoardComment;>;"
    if-eqz v0, :cond_6

    .line 217
    iput-boolean v8, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->isDownLoading:Z

    .line 218
    iput-boolean v8, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->isDownLoaded:Z

    .line 220
    iput-boolean v8, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->isUpLoading:Z

    .line 221
    iput-boolean v8, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->isUpLoaded:Z

    .line 223
    iput p1, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->offset:I

    .line 224
    const/4 v3, -0x1

    iput v3, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->total:I

    .line 226
    invoke-direct {p0}, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->setCurrentListToCache()V

    .line 227
    iput-object v0, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->linkedList:Ljava/util/LinkedList;

    .line 228
    iget-object v3, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->listener:Lcom/vkontakte/android/api/board/BoardCommentsLoader$BoardCommentsLoaderListener;

    invoke-interface {v3}, Lcom/vkontakte/android/api/board/BoardCommentsLoader$BoardCommentsLoaderListener;->onStartReload()V

    .line 229
    iget-object v4, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->listener:Lcom/vkontakte/android/api/board/BoardCommentsLoader$BoardCommentsLoaderListener;

    iget-object v3, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->linkedList:Ljava/util/LinkedList;

    invoke-virtual {v3}, Ljava/util/LinkedList;->getFirst()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/vkontakte/android/api/board/BoardComment;

    iget v3, v3, Lcom/vkontakte/android/api/board/BoardComment;->offset:I

    iget-object v5, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->linkedList:Ljava/util/LinkedList;

    invoke-virtual {v5}, Ljava/util/LinkedList;->size()I

    move-result v5

    new-instance v6, Ljava/util/ArrayList;

    iget-object v7, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->linkedList:Ljava/util/LinkedList;

    invoke-direct {v6, v7}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-interface {v4, v3, v5, v8, v6}, Lcom/vkontakte/android/api/board/BoardCommentsLoader$BoardCommentsLoaderListener;->onCommentLoaded(IIZLjava/util/List;)V

    .line 230
    const/4 v2, 0x0

    .line 231
    .restart local v2    # "i":I
    iget-object v3, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->linkedList:Ljava/util/LinkedList;

    invoke-virtual {v3}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/api/board/BoardComment;

    .line 232
    .restart local v1    # "comment":Lcom/vkontakte/android/api/board/BoardComment;
    iget v4, v1, Lcom/vkontakte/android/api/board/BoardComment;->offset:I

    if-ne v4, p1, :cond_5

    .line 233
    iget-object v4, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->listener:Lcom/vkontakte/android/api/board/BoardCommentsLoader$BoardCommentsLoaderListener;

    invoke-interface {v4, v2, v8}, Lcom/vkontakte/android/api/board/BoardCommentsLoader$BoardCommentsLoaderListener;->scrollToPosition(IZ)V

    .line 235
    :cond_5
    add-int/lit8 v2, v2, 0x1

    .line 236
    goto :goto_2

    .line 238
    .end local v1    # "comment":Lcom/vkontakte/android/api/board/BoardComment;
    .end local v2    # "i":I
    :cond_6
    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->init(ILandroid/content/Context;)V

    goto :goto_1
.end method
