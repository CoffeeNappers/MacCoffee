.class public Lcom/vk/sharing/target/GroupsForCommentsImpersonation;
.super Ljava/lang/Object;
.source "GroupsForCommentsImpersonation.java"


# static fields
.field private static final RESET_CACHE_AFTER:J = 0x2932e00L

.field private static instance:Lcom/vk/sharing/target/GroupsForCommentsImpersonation;


# instance fields
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

.field private timestamp:J

.field private userId:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vk/sharing/target/GroupsForCommentsImpersonation;->groups:Ljava/util/ArrayList;

    .line 24
    const/4 v0, 0x0

    iput v0, p0, Lcom/vk/sharing/target/GroupsForCommentsImpersonation;->userId:I

    return-void
.end method

.method static synthetic access$000(Lcom/vk/sharing/target/GroupsForCommentsImpersonation;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vk/sharing/target/GroupsForCommentsImpersonation;

    .prologue
    .line 18
    iget-object v0, p0, Lcom/vk/sharing/target/GroupsForCommentsImpersonation;->groups:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$002(Lcom/vk/sharing/target/GroupsForCommentsImpersonation;Ljava/util/ArrayList;)Ljava/util/ArrayList;
    .locals 0
    .param p0, "x0"    # Lcom/vk/sharing/target/GroupsForCommentsImpersonation;
    .param p1, "x1"    # Ljava/util/ArrayList;

    .prologue
    .line 18
    iput-object p1, p0, Lcom/vk/sharing/target/GroupsForCommentsImpersonation;->groups:Ljava/util/ArrayList;

    return-object p1
.end method

.method static synthetic access$102(Lcom/vk/sharing/target/GroupsForCommentsImpersonation;I)I
    .locals 0
    .param p0, "x0"    # Lcom/vk/sharing/target/GroupsForCommentsImpersonation;
    .param p1, "x1"    # I

    .prologue
    .line 18
    iput p1, p0, Lcom/vk/sharing/target/GroupsForCommentsImpersonation;->userId:I

    return p1
.end method

.method static synthetic access$202(Lcom/vk/sharing/target/GroupsForCommentsImpersonation;J)J
    .locals 1
    .param p0, "x0"    # Lcom/vk/sharing/target/GroupsForCommentsImpersonation;
    .param p1, "x1"    # J

    .prologue
    .line 18
    iput-wide p1, p0, Lcom/vk/sharing/target/GroupsForCommentsImpersonation;->timestamp:J

    return-wide p1
.end method

.method private ensureCacheIsFresh()V
    .locals 4

    .prologue
    .line 66
    iget v0, p0, Lcom/vk/sharing/target/GroupsForCommentsImpersonation;->userId:I

    invoke-static {v0}, Lcom/vkontakte/android/auth/VKAccountManager;->isCurrentUser(I)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/vk/sharing/target/GroupsForCommentsImpersonation;->timestamp:J

    sub-long/2addr v0, v2

    const-wide/32 v2, 0x2932e00

    cmp-long v0, v0, v2

    if-lez v0, :cond_1

    .line 67
    :cond_0
    invoke-virtual {p0}, Lcom/vk/sharing/target/GroupsForCommentsImpersonation;->resetCache()V

    .line 69
    :cond_1
    return-void
.end method

.method public static getInstance()Lcom/vk/sharing/target/GroupsForCommentsImpersonation;
    .locals 1

    .prologue
    .line 28
    sget-object v0, Lcom/vk/sharing/target/GroupsForCommentsImpersonation;->instance:Lcom/vk/sharing/target/GroupsForCommentsImpersonation;

    if-nez v0, :cond_0

    .line 29
    new-instance v0, Lcom/vk/sharing/target/GroupsForCommentsImpersonation;

    invoke-direct {v0}, Lcom/vk/sharing/target/GroupsForCommentsImpersonation;-><init>()V

    sput-object v0, Lcom/vk/sharing/target/GroupsForCommentsImpersonation;->instance:Lcom/vk/sharing/target/GroupsForCommentsImpersonation;

    .line 31
    :cond_0
    sget-object v0, Lcom/vk/sharing/target/GroupsForCommentsImpersonation;->instance:Lcom/vk/sharing/target/GroupsForCommentsImpersonation;

    return-object v0
.end method


# virtual methods
.method public load(Lcom/vkontakte/android/api/Callback;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vkontakte/android/api/Callback",
            "<",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/api/Group;",
            ">;>;)V"
        }
    .end annotation

    .prologue
    .line 39
    .local p1, "callback":Lcom/vkontakte/android/api/Callback;, "Lcom/vkontakte/android/api/Callback<Ljava/util/ArrayList<Lcom/vkontakte/android/api/Group;>;>;"
    invoke-direct {p0}, Lcom/vk/sharing/target/GroupsForCommentsImpersonation;->ensureCacheIsFresh()V

    .line 41
    iget-object v0, p0, Lcom/vk/sharing/target/GroupsForCommentsImpersonation;->groups:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    .line 42
    iget-object v0, p0, Lcom/vk/sharing/target/GroupsForCommentsImpersonation;->groups:Ljava/util/ArrayList;

    invoke-interface {p1, v0}, Lcom/vkontakte/android/api/Callback;->success(Ljava/lang/Object;)V

    .line 63
    :goto_0
    return-void

    .line 46
    :cond_0
    new-instance v0, Lcom/vkontakte/android/api/account/AccountGetCommentGroups;

    invoke-direct {v0}, Lcom/vkontakte/android/api/account/AccountGetCommentGroups;-><init>()V

    new-instance v1, Lcom/vk/sharing/target/GroupsForCommentsImpersonation$1;

    invoke-direct {v1, p0, p1}, Lcom/vk/sharing/target/GroupsForCommentsImpersonation$1;-><init>(Lcom/vk/sharing/target/GroupsForCommentsImpersonation;Lcom/vkontakte/android/api/Callback;)V

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/account/AccountGetCommentGroups;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    sget-object v1, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    .line 61
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    goto :goto_0
.end method

.method public resetCache()V
    .locals 1

    .prologue
    .line 35
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vk/sharing/target/GroupsForCommentsImpersonation;->groups:Ljava/util/ArrayList;

    .line 36
    return-void
.end method
