.class public Lcom/vkontakte/android/data/Groups;
.super Ljava/lang/Object;
.source "Groups.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/data/Groups$SearchGroupsCallback;,
        Lcom/vkontakte/android/data/Groups$GetGroupsCallback;,
        Lcom/vkontakte/android/data/Groups$JoinType;
    }
.end annotation


# static fields
.field public static final ACTION_GROUP_INVITES_CHANGED:Ljava/lang/String; = "com.vkontakte.android.GROUP_INVITES_CHANGED"

.field public static final ACTION_GROUP_LIST_CHANGED:Ljava/lang/String; = "com.vkontakte.android.GROUP_LIST_CHANGED"

.field public static final ACTION_GROUP_STATUS_CHANGED:Ljava/lang/String; = "com.vkontakte.android.ACTION_GROUP_STATUS_CHANGED"

.field private static executor:Ljava/util/concurrent/ExecutorService;

.field private static groups:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/api/Group;",
            ">;"
        }
    .end annotation
.end field

.field private static index:Lcom/vkontakte/android/SearchIndexer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/SearchIndexer",
            "<",
            "Lcom/vkontakte/android/api/Group;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 37
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/vkontakte/android/data/Groups;->groups:Ljava/util/ArrayList;

    .line 38
    new-instance v0, Lcom/vkontakte/android/SearchIndexer;

    invoke-direct {v0}, Lcom/vkontakte/android/SearchIndexer;-><init>()V

    sput-object v0, Lcom/vkontakte/android/data/Groups;->index:Lcom/vkontakte/android/SearchIndexer;

    .line 40
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Lcom/vkontakte/android/data/Groups;->executor:Ljava/util/concurrent/ExecutorService;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000()Ljava/util/ArrayList;
    .locals 1

    .prologue
    .line 31
    sget-object v0, Lcom/vkontakte/android/data/Groups;->groups:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$002(Ljava/util/ArrayList;)Ljava/util/ArrayList;
    .locals 0
    .param p0, "x0"    # Ljava/util/ArrayList;

    .prologue
    .line 31
    sput-object p0, Lcom/vkontakte/android/data/Groups;->groups:Ljava/util/ArrayList;

    return-object p0
.end method

.method static synthetic access$100()Lcom/vkontakte/android/SearchIndexer;
    .locals 1

    .prologue
    .line 31
    sget-object v0, Lcom/vkontakte/android/data/Groups;->index:Lcom/vkontakte/android/SearchIndexer;

    return-object v0
.end method

.method public static addGroup(Lcom/vkontakte/android/api/Group;Z)V
    .locals 3
    .param p0, "group"    # Lcom/vkontakte/android/api/Group;
    .param p1, "sendGlobalNotify"    # Z

    .prologue
    .line 82
    sget-object v0, Lcom/vkontakte/android/data/Groups;->groups:Ljava/util/ArrayList;

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 83
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-static {p0, v0}, Lcom/vkontakte/android/cache/GroupsCache;->add(Lcom/vkontakte/android/api/Group;Landroid/content/Context;)V

    .line 84
    sget-object v0, Lcom/vkontakte/android/data/Groups;->index:Lcom/vkontakte/android/SearchIndexer;

    sget-object v1, Lcom/vkontakte/android/data/Groups;->groups:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/SearchIndexer;->bind(Ljava/util/List;)Lcom/vkontakte/android/SearchIndexer;

    .line 85
    sget-object v0, Lcom/vkontakte/android/data/Groups;->index:Lcom/vkontakte/android/SearchIndexer;

    invoke-virtual {v0}, Lcom/vkontakte/android/SearchIndexer;->build()V

    .line 87
    if-eqz p1, :cond_0

    .line 88
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    new-instance v1, Landroid/content/Intent;

    const-string/jumbo v2, "com.vkontakte.android.GROUP_LIST_CHANGED"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string/jumbo v2, "com.vkontakte.android.permission.ACCESS_DATA"

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 90
    :cond_0
    return-void
.end method

.method public static decreaseInvites()V
    .locals 3

    .prologue
    .line 183
    invoke-static {}, Lcom/vkontakte/android/LongPollService;->getNumGroupInvitations()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-static {v0}, Lcom/vkontakte/android/LongPollService;->setNumGroupInvitations(I)V

    .line 184
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    new-instance v1, Landroid/content/Intent;

    const-string/jumbo v2, "com.vkontakte.android.GROUP_INVITES_CHANGED"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string/jumbo v2, "com.vkontakte.android.permission.ACCESS_DATA"

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 185
    return-void
.end method

.method private static filter(Ljava/util/ArrayList;Lcom/vkontakte/android/functions/Predicate;)V
    .locals 2
    .param p0    # Ljava/util/ArrayList;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Lcom/vkontakte/android/functions/Predicate;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/api/Group;",
            ">;",
            "Lcom/vkontakte/android/functions/Predicate",
            "<",
            "Lcom/vkontakte/android/api/Group;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 249
    .local p0, "groups":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/api/Group;>;"
    .local p1, "p":Lcom/vkontakte/android/functions/Predicate;, "Lcom/vkontakte/android/functions/Predicate<Lcom/vkontakte/android/api/Group;>;"
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 250
    .local v0, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/vkontakte/android/api/Group;>;"
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 251
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    invoke-interface {p1, v1}, Lcom/vkontakte/android/functions/Predicate;->f(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 252
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    goto :goto_0

    .line 255
    :cond_1
    return-void
.end method

.method public static getAdminLevel(I)I
    .locals 3
    .param p0, "gid"    # I

    .prologue
    .line 143
    sget-object v1, Lcom/vkontakte/android/data/Groups;->groups:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/api/Group;

    .line 144
    .local v0, "g":Lcom/vkontakte/android/api/Group;
    iget v2, v0, Lcom/vkontakte/android/api/Group;->id:I

    if-ne v2, p0, :cond_0

    .line 145
    iget v1, v0, Lcom/vkontakte/android/api/Group;->adminLevel:I

    .line 148
    .end local v0    # "g":Lcom/vkontakte/android/api/Group;
    :goto_0
    return v1

    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static getAdminedGroups(Ljava/util/ArrayList;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/api/Group;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 97
    .local p0, "out":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/api/Group;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    sget-object v2, Lcom/vkontakte/android/data/Groups;->groups:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 98
    sget-object v2, Lcom/vkontakte/android/data/Groups;->groups:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/api/Group;

    .line 99
    .local v0, "g":Lcom/vkontakte/android/api/Group;
    iget-boolean v2, v0, Lcom/vkontakte/android/api/Group;->isAdmin:Z

    if-eqz v2, :cond_0

    .line 100
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 97
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 103
    .end local v0    # "g":Lcom/vkontakte/android/api/Group;
    :cond_1
    return-void
.end method

.method public static getAdminedGroups(Ljava/util/ArrayList;I)V
    .locals 3
    .param p1, "minLevel"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/api/Group;",
            ">;I)V"
        }
    .end annotation

    .prologue
    .line 106
    .local p0, "out":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/api/Group;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    sget-object v2, Lcom/vkontakte/android/data/Groups;->groups:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 107
    sget-object v2, Lcom/vkontakte/android/data/Groups;->groups:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/api/Group;

    .line 108
    .local v0, "g":Lcom/vkontakte/android/api/Group;
    iget v2, v0, Lcom/vkontakte/android/api/Group;->adminLevel:I

    if-lt v2, p1, :cond_0

    .line 109
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 106
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 112
    .end local v0    # "g":Lcom/vkontakte/android/api/Group;
    :cond_1
    return-void
.end method

.method public static getById(I)Lcom/vkontakte/android/api/Group;
    .locals 3
    .param p0, "gid"    # I

    .prologue
    .line 134
    sget-object v1, Lcom/vkontakte/android/data/Groups;->groups:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/api/Group;

    .line 135
    .local v0, "g":Lcom/vkontakte/android/api/Group;
    iget v2, v0, Lcom/vkontakte/android/api/Group;->id:I

    if-ne v2, p0, :cond_0

    .line 139
    .end local v0    # "g":Lcom/vkontakte/android/api/Group;
    :goto_0
    return-object v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static getGroups(ILcom/vkontakte/android/data/Groups$GetGroupsCallback;)V
    .locals 3
    .param p0, "adminLevel"    # I
    .param p1, "callback"    # Lcom/vkontakte/android/data/Groups$GetGroupsCallback;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 188
    sget-object v1, Lcom/vkontakte/android/data/Groups;->groups:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-nez v1, :cond_1

    .line 189
    sget-object v1, Lcom/vkontakte/android/data/Groups;->executor:Ljava/util/concurrent/ExecutorService;

    invoke-static {p1, p0}, Lcom/vkontakte/android/data/Groups$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/data/Groups$GetGroupsCallback;I)Ljava/lang/Runnable;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    .line 236
    :cond_0
    :goto_0
    return-void

    .line 231
    :cond_1
    if-eqz p1, :cond_0

    .line 232
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 233
    .local v0, "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/api/Group;>;"
    invoke-static {v0, p0}, Lcom/vkontakte/android/data/Groups;->getAdminedGroups(Ljava/util/ArrayList;I)V

    .line 234
    invoke-interface {p1, v0}, Lcom/vkontakte/android/data/Groups$GetGroupsCallback;->onResult(Ljava/util/List;)V

    goto :goto_0
.end method

.method public static getGroups(Ljava/util/ArrayList;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/api/Group;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 93
    .local p0, "out":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/api/Group;>;"
    sget-object v0, Lcom/vkontakte/android/data/Groups;->groups:Ljava/util/ArrayList;

    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 94
    return-void
.end method

.method public static isGroupAdmin(I)Z
    .locals 4
    .param p0, "gid"    # I

    .prologue
    .line 124
    sget-object v1, Lcom/vkontakte/android/data/Groups;->groups:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/api/Group;

    .line 125
    .local v0, "g":Lcom/vkontakte/android/api/Group;
    iget v2, v0, Lcom/vkontakte/android/api/Group;->id:I

    if-ne v2, p0, :cond_0

    .line 126
    const-string/jumbo v1, "vk"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "is group admin "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, " -> "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-boolean v3, v0, Lcom/vkontakte/android/api/Group;->isAdmin:Z

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 127
    iget-boolean v1, v0, Lcom/vkontakte/android/api/Group;->isAdmin:Z

    .line 130
    .end local v0    # "g":Lcom/vkontakte/android/api/Group;
    :goto_0
    return v1

    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static isGroupMember(I)Z
    .locals 3
    .param p0, "gid"    # I

    .prologue
    .line 115
    sget-object v1, Lcom/vkontakte/android/data/Groups;->groups:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/api/Group;

    .line 116
    .local v0, "g":Lcom/vkontakte/android/api/Group;
    iget v2, v0, Lcom/vkontakte/android/api/Group;->id:I

    if-ne v2, p0, :cond_0

    .line 117
    const/4 v1, 0x1

    .line 120
    .end local v0    # "g":Lcom/vkontakte/android/api/Group;
    :goto_0
    return v1

    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static joinGroup(Lcom/vkontakte/android/api/Group;Lcom/vkontakte/android/data/Groups$JoinType;)Lcom/vkontakte/android/api/ResultlessAPIRequest;
    .locals 3
    .param p0, "group"    # Lcom/vkontakte/android/api/Group;
    .param p1, "type"    # Lcom/vkontakte/android/data/Groups$JoinType;

    .prologue
    .line 168
    sget-object v0, Lcom/vkontakte/android/data/Groups$JoinType;->DECLINE:Lcom/vkontakte/android/data/Groups$JoinType;

    if-ne p1, v0, :cond_0

    new-instance v0, Lcom/vkontakte/android/api/groups/GroupsLeave;

    iget v1, p0, Lcom/vkontakte/android/api/Group;->id:I

    invoke-direct {v0, v1}, Lcom/vkontakte/android/api/groups/GroupsLeave;-><init>(I)V

    :goto_0
    return-object v0

    :cond_0
    new-instance v1, Lcom/vkontakte/android/api/groups/GroupsJoin;

    iget v2, p0, Lcom/vkontakte/android/api/Group;->id:I

    sget-object v0, Lcom/vkontakte/android/data/Groups$JoinType;->UNSURE:Lcom/vkontakte/android/data/Groups$JoinType;

    if-ne p1, v0, :cond_1

    const/4 v0, 0x1

    :goto_1
    invoke-direct {v1, v2, v0}, Lcom/vkontakte/android/api/groups/GroupsJoin;-><init>(IZ)V

    move-object v0, v1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    goto :goto_1
.end method

.method static synthetic lambda$getGroups$0(Lcom/vkontakte/android/data/Groups$GetGroupsCallback;I)V
    .locals 6
    .param p0, "callback"    # Lcom/vkontakte/android/data/Groups$GetGroupsCallback;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p1, "adminLevel"    # I

    .prologue
    .line 190
    invoke-static {}, Lcom/vkontakte/android/cache/GroupsCache;->get()Ljava/util/List;

    move-result-object v0

    .line 191
    .local v0, "cached":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/api/Group;>;"
    new-instance v1, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    .line 192
    .local v1, "err":Ljava/util/concurrent/atomic/AtomicBoolean;
    if-eqz v0, :cond_1

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v3

    if-lez v3, :cond_1

    .line 193
    sget-object v3, Lcom/vkontakte/android/data/Groups;->groups:Ljava/util/ArrayList;

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 217
    :goto_0
    sget-object v3, Lcom/vkontakte/android/data/Groups;->index:Lcom/vkontakte/android/SearchIndexer;

    sget-object v4, Lcom/vkontakte/android/data/Groups;->groups:Ljava/util/ArrayList;

    invoke-virtual {v3, v4}, Lcom/vkontakte/android/SearchIndexer;->bind(Ljava/util/List;)Lcom/vkontakte/android/SearchIndexer;

    .line 218
    sget-object v3, Lcom/vkontakte/android/data/Groups;->index:Lcom/vkontakte/android/SearchIndexer;

    invoke-virtual {v3}, Lcom/vkontakte/android/SearchIndexer;->build()V

    .line 219
    sget-object v3, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    new-instance v4, Landroid/content/Intent;

    const-string/jumbo v5, "com.vkontakte.android.GROUP_LIST_CHANGED"

    invoke-direct {v4, v5}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string/jumbo v5, "com.vkontakte.android.permission.ACCESS_DATA"

    invoke-virtual {v3, v4, v5}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 221
    if-eqz p0, :cond_0

    .line 222
    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 223
    invoke-interface {p0}, Lcom/vkontakte/android/data/Groups$GetGroupsCallback;->onError()V

    .line 230
    :cond_0
    :goto_1
    return-void

    .line 195
    :cond_1
    new-instance v3, Lcom/vkontakte/android/api/groups/GroupsGet;

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v4

    invoke-virtual {v4}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v4

    invoke-direct {v3, v4}, Lcom/vkontakte/android/api/groups/GroupsGet;-><init>(I)V

    new-instance v4, Lcom/vkontakte/android/data/Groups$2;

    invoke-direct {v4, v1}, Lcom/vkontakte/android/data/Groups$2;-><init>(Ljava/util/concurrent/atomic/AtomicBoolean;)V

    .line 196
    invoke-virtual {v3, v4}, Lcom/vkontakte/android/api/groups/GroupsGet;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v3

    .line 215
    invoke-virtual {v3}, Lcom/vkontakte/android/api/VKAPIRequest;->execSync()Z

    goto :goto_0

    .line 225
    :cond_2
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 226
    .local v2, "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/api/Group;>;"
    invoke-static {v2, p1}, Lcom/vkontakte/android/data/Groups;->getAdminedGroups(Ljava/util/ArrayList;I)V

    .line 227
    invoke-interface {p0, v2}, Lcom/vkontakte/android/data/Groups$GetGroupsCallback;->onResult(Ljava/util/List;)V

    goto :goto_1
.end method

.method static synthetic lambda$null$1(ILcom/vkontakte/android/api/Group;)Z
    .locals 1
    .param p0, "minLevel"    # I
    .param p1, "g"    # Lcom/vkontakte/android/api/Group;

    .prologue
    .line 242
    iget-object v0, p1, Lcom/vkontakte/android/api/Group;->deactivation:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget v0, p1, Lcom/vkontakte/android/api/Group;->adminLevel:I

    if-ge v0, p0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method static synthetic lambda$search$2(Lcom/vkontakte/android/data/Groups$SearchGroupsCallback;Ljava/lang/String;I)V
    .locals 2
    .param p0, "callback"    # Lcom/vkontakte/android/data/Groups$SearchGroupsCallback;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p1, "query"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p2, "minLevel"    # I

    .prologue
    .line 240
    if-eqz p0, :cond_0

    .line 241
    new-instance v0, Ljava/util/ArrayList;

    invoke-static {p1}, Lcom/vkontakte/android/data/Groups;->search(Ljava/lang/String;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 242
    .local v0, "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/api/Group;>;"
    invoke-static {p2}, Lcom/vkontakte/android/data/Groups$$Lambda$3;->lambdaFactory$(I)Lcom/vkontakte/android/functions/Predicate;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vkontakte/android/data/Groups;->filter(Ljava/util/ArrayList;Lcom/vkontakte/android/functions/Predicate;)V

    .line 243
    invoke-interface {p0, v0}, Lcom/vkontakte/android/data/Groups$SearchGroupsCallback;->onResult(Ljava/util/List;)V

    .line 245
    .end local v0    # "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/api/Group;>;"
    :cond_0
    return-void
.end method

.method public static notifyGroupStatusChanged(II)V
    .locals 3
    .param p0, "id"    # I
    .param p1, "status"    # I

    .prologue
    .line 173
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    new-instance v1, Landroid/content/Intent;

    const-string/jumbo v2, "com.vkontakte.android.ACTION_GROUP_STATUS_CHANGED"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string/jumbo v2, "id"

    invoke-virtual {v1, v2, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    move-result-object v1

    const-string/jumbo v2, "status"

    invoke-virtual {v1, v2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    move-result-object v1

    const-string/jumbo v2, "com.vkontakte.android.permission.ACCESS_DATA"

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 174
    return-void
.end method

.method public static reload(Z)V
    .locals 3
    .param p0, "forceNetwork"    # Z

    .prologue
    .line 43
    const-string/jumbo v0, "vk"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "RELOAD GROUPS "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 44
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/vkontakte/android/data/Groups$1;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/data/Groups$1;-><init>(Z)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 78
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 79
    return-void
.end method

.method public static reset()V
    .locals 1

    .prologue
    .line 152
    sget-object v0, Lcom/vkontakte/android/data/Groups;->groups:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 153
    new-instance v0, Lcom/vkontakte/android/SearchIndexer;

    invoke-direct {v0}, Lcom/vkontakte/android/SearchIndexer;-><init>()V

    sput-object v0, Lcom/vkontakte/android/data/Groups;->index:Lcom/vkontakte/android/SearchIndexer;

    .line 154
    return-void
.end method

.method public static resultFromApi(Lorg/json/JSONObject;Lorg/json/JSONObject;)V
    .locals 1
    .param p0, "resp"    # Lorg/json/JSONObject;
    .param p1, "data"    # Lorg/json/JSONObject;

    .prologue
    .line 162
    const/4 v0, 0x1

    :try_start_0
    invoke-static {v0}, Lcom/vkontakte/android/data/Groups;->reload(Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 165
    :goto_0
    return-void

    .line 163
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public static search(Ljava/lang/String;)Ljava/util/List;
    .locals 1
    .param p0, "q"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/api/Group;",
            ">;"
        }
    .end annotation

    .prologue
    .line 157
    sget-object v0, Lcom/vkontakte/android/data/Groups;->index:Lcom/vkontakte/android/SearchIndexer;

    invoke-virtual {v0, p0}, Lcom/vkontakte/android/SearchIndexer;->search(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public static search(Ljava/lang/String;ILcom/vkontakte/android/data/Groups$SearchGroupsCallback;)V
    .locals 2
    .param p0, "query"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p1, "minLevel"    # I
    .param p2, "callback"    # Lcom/vkontakte/android/data/Groups$SearchGroupsCallback;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 239
    sget-object v0, Lcom/vkontakte/android/data/Groups;->executor:Ljava/util/concurrent/ExecutorService;

    invoke-static {p2, p0, p1}, Lcom/vkontakte/android/data/Groups$$Lambda$2;->lambdaFactory$(Lcom/vkontakte/android/data/Groups$SearchGroupsCallback;Ljava/lang/String;I)Ljava/lang/Runnable;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    .line 246
    return-void
.end method
