.class final Lcom/vkontakte/android/data/Groups$1;
.super Ljava/lang/Object;
.source "Groups.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/data/Groups;->reload(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$forceNetwork:Z


# direct methods
.method constructor <init>(Z)V
    .locals 0

    .prologue
    .line 44
    iput-boolean p1, p0, Lcom/vkontakte/android/data/Groups$1;->val$forceNetwork:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 46
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 47
    .local v0, "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/api/Group;>;"
    iget-boolean v1, p0, Lcom/vkontakte/android/data/Groups$1;->val$forceNetwork:Z

    if-nez v1, :cond_0

    .line 48
    invoke-static {}, Lcom/vkontakte/android/cache/GroupsCache;->get()Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 50
    :cond_0
    iget-boolean v1, p0, Lcom/vkontakte/android/data/Groups$1;->val$forceNetwork:Z

    if-nez v1, :cond_1

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-nez v1, :cond_2

    .line 51
    :cond_1
    new-instance v1, Lcom/vkontakte/android/api/groups/GroupsGet;

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v2

    invoke-direct {v1, v2}, Lcom/vkontakte/android/api/groups/GroupsGet;-><init>(I)V

    new-instance v2, Lcom/vkontakte/android/data/Groups$1$1;

    invoke-direct {v2, p0}, Lcom/vkontakte/android/data/Groups$1$1;-><init>(Lcom/vkontakte/android/data/Groups$1;)V

    .line 52
    invoke-virtual {v1, v2}, Lcom/vkontakte/android/api/groups/GroupsGet;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    .line 70
    invoke-virtual {v1}, Lcom/vkontakte/android/api/VKAPIRequest;->execSync()Z

    .line 74
    :goto_0
    invoke-static {}, Lcom/vkontakte/android/data/Groups;->access$100()Lcom/vkontakte/android/SearchIndexer;

    move-result-object v1

    invoke-static {}, Lcom/vkontakte/android/data/Groups;->access$000()Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/SearchIndexer;->bind(Ljava/util/List;)Lcom/vkontakte/android/SearchIndexer;

    .line 75
    invoke-static {}, Lcom/vkontakte/android/data/Groups;->access$100()Lcom/vkontakte/android/SearchIndexer;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vkontakte/android/SearchIndexer;->build()V

    .line 76
    sget-object v1, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    new-instance v2, Landroid/content/Intent;

    const-string/jumbo v3, "com.vkontakte.android.GROUP_LIST_CHANGED"

    invoke-direct {v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string/jumbo v3, "com.vkontakte.android.permission.ACCESS_DATA"

    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 77
    return-void

    .line 72
    :cond_2
    invoke-static {v0}, Lcom/vkontakte/android/data/Groups;->access$002(Ljava/util/ArrayList;)Ljava/util/ArrayList;

    goto :goto_0
.end method
