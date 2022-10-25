.class public final Lcom/vk/sharing/target/TargetsLoader;
.super Ljava/lang/Object;
.source "TargetsLoader.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/sharing/target/TargetsLoader$Callback;
    }
.end annotation


# static fields
.field public static final TARGETS_PORTION:I = 0xa


# instance fields
.field private callback:Lcom/vk/sharing/target/TargetsLoader$Callback;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private volatile loadingDialogs:Z

.field private volatile loadingGroups:Z

.field private final mainHandler:Landroid/os/Handler;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field

.field private volatile searching:Z


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 80
    new-instance v0, Landroid/os/Handler;

    sget-object v1, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    .line 81
    invoke-virtual {v1}, Landroid/content/Context;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/vk/sharing/target/TargetsLoader;->mainHandler:Landroid/os/Handler;

    .line 80
    return-void
.end method

.method static synthetic access$000(Lcom/vk/sharing/target/TargetsLoader;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/sharing/target/TargetsLoader;

    .prologue
    .line 24
    invoke-direct {p0}, Lcom/vk/sharing/target/TargetsLoader;->toggleLoadingDialogs()V

    return-void
.end method

.method static synthetic access$100(Ljava/util/Collection;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Ljava/util/Collection;

    .prologue
    .line 24
    invoke-static {p0}, Lcom/vk/sharing/target/TargetsLoader;->mapDialogEntries(Ljava/util/Collection;)Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1000(Ljava/util/Collection;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Ljava/util/Collection;

    .prologue
    .line 24
    invoke-static {p0}, Lcom/vk/sharing/target/TargetsLoader;->mapUserProfiles(Ljava/util/Collection;)Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1100(Lcom/vk/sharing/target/TargetsLoader;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/sharing/target/TargetsLoader;

    .prologue
    .line 24
    invoke-direct {p0}, Lcom/vk/sharing/target/TargetsLoader;->callbackDialogSearchFailed()V

    return-void
.end method

.method static synthetic access$1200(Lcom/vk/sharing/target/TargetsLoader;Ljava/util/ArrayList;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/sharing/target/TargetsLoader;
    .param p1, "x1"    # Ljava/util/ArrayList;

    .prologue
    .line 24
    invoke-direct {p0, p1}, Lcom/vk/sharing/target/TargetsLoader;->callbackDialogSearchCompleted(Ljava/util/ArrayList;)V

    return-void
.end method

.method static synthetic access$200(Lcom/vk/sharing/target/TargetsLoader;)Landroid/os/Handler;
    .locals 1
    .param p0, "x0"    # Lcom/vk/sharing/target/TargetsLoader;

    .prologue
    .line 24
    iget-object v0, p0, Lcom/vk/sharing/target/TargetsLoader;->mainHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$300(Lcom/vk/sharing/target/TargetsLoader;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/sharing/target/TargetsLoader;

    .prologue
    .line 24
    invoke-direct {p0}, Lcom/vk/sharing/target/TargetsLoader;->callbackDialogLoadingError()V

    return-void
.end method

.method static synthetic access$400(Lcom/vk/sharing/target/TargetsLoader;Ljava/util/ArrayList;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/sharing/target/TargetsLoader;
    .param p1, "x1"    # Ljava/util/ArrayList;

    .prologue
    .line 24
    invoke-direct {p0, p1}, Lcom/vk/sharing/target/TargetsLoader;->callbackDialogLoadingCompleted(Ljava/util/ArrayList;)V

    return-void
.end method

.method static synthetic access$500(Lcom/vk/sharing/target/TargetsLoader;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/sharing/target/TargetsLoader;

    .prologue
    .line 24
    invoke-direct {p0}, Lcom/vk/sharing/target/TargetsLoader;->toggleLoadingGroups()V

    return-void
.end method

.method static synthetic access$600(Ljava/util/Collection;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Ljava/util/Collection;

    .prologue
    .line 24
    invoke-static {p0}, Lcom/vk/sharing/target/TargetsLoader;->mapGroups(Ljava/util/Collection;)Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$700(Lcom/vk/sharing/target/TargetsLoader;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/sharing/target/TargetsLoader;

    .prologue
    .line 24
    invoke-direct {p0}, Lcom/vk/sharing/target/TargetsLoader;->callbackGroupLoadingError()V

    return-void
.end method

.method static synthetic access$800(Lcom/vk/sharing/target/TargetsLoader;Ljava/util/ArrayList;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/sharing/target/TargetsLoader;
    .param p1, "x1"    # Ljava/util/ArrayList;

    .prologue
    .line 24
    invoke-direct {p0, p1}, Lcom/vk/sharing/target/TargetsLoader;->callbackGroupLoadingCompleted(Ljava/util/ArrayList;)V

    return-void
.end method

.method static synthetic access$900(Lcom/vk/sharing/target/TargetsLoader;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/sharing/target/TargetsLoader;

    .prologue
    .line 24
    invoke-direct {p0}, Lcom/vk/sharing/target/TargetsLoader;->toggleSearching()V

    return-void
.end method

.method private callbackDialogLoadingCompleted(Ljava/util/ArrayList;)V
    .locals 1
    .param p1    # Ljava/util/ArrayList;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vk/sharing/target/Target;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 245
    .local p1, "targets":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/sharing/target/Target;>;"
    iget-object v0, p0, Lcom/vk/sharing/target/TargetsLoader;->callback:Lcom/vk/sharing/target/TargetsLoader$Callback;

    if-eqz v0, :cond_0

    .line 246
    iget-object v0, p0, Lcom/vk/sharing/target/TargetsLoader;->callback:Lcom/vk/sharing/target/TargetsLoader$Callback;

    invoke-interface {v0, p1}, Lcom/vk/sharing/target/TargetsLoader$Callback;->onDialogLoadingCompleted(Ljava/util/ArrayList;)V

    .line 248
    :cond_0
    return-void
.end method

.method private callbackDialogLoadingError()V
    .locals 1

    .prologue
    .line 251
    iget-object v0, p0, Lcom/vk/sharing/target/TargetsLoader;->callback:Lcom/vk/sharing/target/TargetsLoader$Callback;

    if-eqz v0, :cond_0

    .line 252
    iget-object v0, p0, Lcom/vk/sharing/target/TargetsLoader;->callback:Lcom/vk/sharing/target/TargetsLoader$Callback;

    invoke-interface {v0}, Lcom/vk/sharing/target/TargetsLoader$Callback;->onDialogLoadingFailed()V

    .line 254
    :cond_0
    return-void
.end method

.method private callbackDialogSearchCompleted(Ljava/util/ArrayList;)V
    .locals 1
    .param p1    # Ljava/util/ArrayList;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vk/sharing/target/Target;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 257
    .local p1, "targets":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/sharing/target/Target;>;"
    iget-object v0, p0, Lcom/vk/sharing/target/TargetsLoader;->callback:Lcom/vk/sharing/target/TargetsLoader$Callback;

    if-eqz v0, :cond_0

    .line 258
    iget-object v0, p0, Lcom/vk/sharing/target/TargetsLoader;->callback:Lcom/vk/sharing/target/TargetsLoader$Callback;

    invoke-interface {v0, p1}, Lcom/vk/sharing/target/TargetsLoader$Callback;->onDialogSearchingCompleted(Ljava/util/ArrayList;)V

    .line 260
    :cond_0
    return-void
.end method

.method private callbackDialogSearchFailed()V
    .locals 1

    .prologue
    .line 263
    iget-object v0, p0, Lcom/vk/sharing/target/TargetsLoader;->callback:Lcom/vk/sharing/target/TargetsLoader$Callback;

    if-eqz v0, :cond_0

    .line 264
    iget-object v0, p0, Lcom/vk/sharing/target/TargetsLoader;->callback:Lcom/vk/sharing/target/TargetsLoader$Callback;

    invoke-interface {v0}, Lcom/vk/sharing/target/TargetsLoader$Callback;->onDialogSearchingFailed()V

    .line 266
    :cond_0
    return-void
.end method

.method private callbackGroupLoadingCompleted(Ljava/util/ArrayList;)V
    .locals 1
    .param p1    # Ljava/util/ArrayList;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vk/sharing/target/Target;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 269
    .local p1, "targets":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/sharing/target/Target;>;"
    iget-object v0, p0, Lcom/vk/sharing/target/TargetsLoader;->callback:Lcom/vk/sharing/target/TargetsLoader$Callback;

    if-eqz v0, :cond_0

    .line 270
    iget-object v0, p0, Lcom/vk/sharing/target/TargetsLoader;->callback:Lcom/vk/sharing/target/TargetsLoader$Callback;

    invoke-interface {v0, p1}, Lcom/vk/sharing/target/TargetsLoader$Callback;->onGroupLoadingCompleted(Ljava/util/ArrayList;)V

    .line 272
    :cond_0
    return-void
.end method

.method private callbackGroupLoadingError()V
    .locals 1

    .prologue
    .line 275
    iget-object v0, p0, Lcom/vk/sharing/target/TargetsLoader;->callback:Lcom/vk/sharing/target/TargetsLoader$Callback;

    if-eqz v0, :cond_0

    .line 276
    iget-object v0, p0, Lcom/vk/sharing/target/TargetsLoader;->callback:Lcom/vk/sharing/target/TargetsLoader$Callback;

    invoke-interface {v0}, Lcom/vk/sharing/target/TargetsLoader$Callback;->onGroupLoadingFailed()V

    .line 278
    :cond_0
    return-void
.end method

.method private callbackGroupSearchCompleted(Ljava/util/ArrayList;)V
    .locals 1
    .param p1    # Ljava/util/ArrayList;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vk/sharing/target/Target;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 281
    .local p1, "targets":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/sharing/target/Target;>;"
    iget-object v0, p0, Lcom/vk/sharing/target/TargetsLoader;->callback:Lcom/vk/sharing/target/TargetsLoader$Callback;

    if-eqz v0, :cond_0

    .line 282
    iget-object v0, p0, Lcom/vk/sharing/target/TargetsLoader;->callback:Lcom/vk/sharing/target/TargetsLoader$Callback;

    invoke-interface {v0, p1}, Lcom/vk/sharing/target/TargetsLoader$Callback;->onGroupSearchingCompleted(Ljava/util/ArrayList;)V

    .line 284
    :cond_0
    return-void
.end method

.method private static mapDialogEntries(Ljava/util/Collection;)Ljava/util/ArrayList;
    .locals 5
    .param p0    # Ljava/util/Collection;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lcom/vkontakte/android/DialogEntry;",
            ">;)",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vk/sharing/target/Target;",
            ">;"
        }
    .end annotation

    .prologue
    .line 46
    .local p0, "dialogEntries":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/vkontakte/android/DialogEntry;>;"
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 47
    .local v1, "targets":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/sharing/target/Target;>;"
    if-eqz p0, :cond_0

    .line 48
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/DialogEntry;

    .line 49
    .local v0, "dialogEntry":Lcom/vkontakte/android/DialogEntry;
    new-instance v3, Lcom/vk/sharing/target/Target;

    iget-object v4, v0, Lcom/vkontakte/android/DialogEntry;->profile:Lcom/vkontakte/android/UserProfile;

    invoke-direct {v3, v4}, Lcom/vk/sharing/target/Target;-><init>(Lcom/vkontakte/android/UserProfile;)V

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 52
    .end local v0    # "dialogEntry":Lcom/vkontakte/android/DialogEntry;
    :cond_0
    return-object v1
.end method

.method private static mapGroups(Ljava/util/Collection;)Ljava/util/ArrayList;
    .locals 4
    .param p0    # Ljava/util/Collection;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lcom/vkontakte/android/api/Group;",
            ">;)",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vk/sharing/target/Target;",
            ">;"
        }
    .end annotation

    .prologue
    .line 68
    .local p0, "groups":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/vkontakte/android/api/Group;>;"
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 69
    .local v1, "targets":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/sharing/target/Target;>;"
    if-eqz p0, :cond_2

    .line 70
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/api/Group;

    .line 72
    .local v0, "group":Lcom/vkontakte/android/api/Group;
    iget-object v3, v0, Lcom/vkontakte/android/api/Group;->deactivation:Ljava/lang/String;

    if-eqz v3, :cond_1

    iget-object v3, v0, Lcom/vkontakte/android/api/Group;->deactivation:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 73
    :cond_1
    new-instance v3, Lcom/vk/sharing/target/Target;

    invoke-direct {v3, v0}, Lcom/vk/sharing/target/Target;-><init>(Lcom/vkontakte/android/api/Group;)V

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 77
    .end local v0    # "group":Lcom/vkontakte/android/api/Group;
    :cond_2
    return-object v1
.end method

.method private static mapUserProfiles(Ljava/util/Collection;)Ljava/util/ArrayList;
    .locals 4
    .param p0    # Ljava/util/Collection;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;)",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vk/sharing/target/Target;",
            ">;"
        }
    .end annotation

    .prologue
    .line 57
    .local p0, "userProfiles":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/vkontakte/android/UserProfile;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 58
    .local v0, "targets":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/sharing/target/Target;>;"
    if-eqz p0, :cond_0

    .line 59
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/UserProfile;

    .line 60
    .local v1, "userProfile":Lcom/vkontakte/android/UserProfile;
    new-instance v3, Lcom/vk/sharing/target/Target;

    invoke-direct {v3, v1}, Lcom/vk/sharing/target/Target;-><init>(Lcom/vkontakte/android/UserProfile;)V

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 63
    .end local v1    # "userProfile":Lcom/vkontakte/android/UserProfile;
    :cond_0
    return-object v0
.end method

.method private toggleLoadingDialogs()V
    .locals 1

    .prologue
    .line 287
    iget-boolean v0, p0, Lcom/vk/sharing/target/TargetsLoader;->loadingDialogs:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    iput-boolean v0, p0, Lcom/vk/sharing/target/TargetsLoader;->loadingDialogs:Z

    .line 288
    return-void

    .line 287
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private toggleLoadingGroups()V
    .locals 1

    .prologue
    .line 291
    iget-boolean v0, p0, Lcom/vk/sharing/target/TargetsLoader;->loadingGroups:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    iput-boolean v0, p0, Lcom/vk/sharing/target/TargetsLoader;->loadingGroups:Z

    .line 292
    return-void

    .line 291
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private toggleSearching()V
    .locals 1

    .prologue
    .line 295
    iget-boolean v0, p0, Lcom/vk/sharing/target/TargetsLoader;->searching:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    iput-boolean v0, p0, Lcom/vk/sharing/target/TargetsLoader;->searching:Z

    .line 296
    return-void

    .line 295
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public isLoadingDialogs()Z
    .locals 1

    .prologue
    .line 233
    iget-boolean v0, p0, Lcom/vk/sharing/target/TargetsLoader;->loadingDialogs:Z

    return v0
.end method

.method public isLoadingGroups()Z
    .locals 1

    .prologue
    .line 237
    iget-boolean v0, p0, Lcom/vk/sharing/target/TargetsLoader;->loadingGroups:Z

    return v0
.end method

.method public isSearching()Z
    .locals 1

    .prologue
    .line 241
    iget-boolean v0, p0, Lcom/vk/sharing/target/TargetsLoader;->searching:Z

    return v0
.end method

.method synthetic lambda$null$0(Ljava/util/ArrayList;)V
    .locals 0
    .param p1, "targets"    # Ljava/util/ArrayList;

    .prologue
    .line 228
    invoke-direct {p0, p1}, Lcom/vk/sharing/target/TargetsLoader;->callbackGroupSearchCompleted(Ljava/util/ArrayList;)V

    return-void
.end method

.method synthetic lambda$searchGroups$1(Ljava/util/List;)V
    .locals 3
    .param p1, "groups"    # Ljava/util/List;

    .prologue
    .line 226
    invoke-direct {p0}, Lcom/vk/sharing/target/TargetsLoader;->toggleSearching()V

    .line 227
    invoke-static {p1}, Lcom/vk/sharing/target/TargetsLoader;->mapGroups(Ljava/util/Collection;)Ljava/util/ArrayList;

    move-result-object v0

    .line 228
    .local v0, "targets":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/sharing/target/Target;>;"
    iget-object v1, p0, Lcom/vk/sharing/target/TargetsLoader;->mainHandler:Landroid/os/Handler;

    invoke-static {p0, v0}, Lcom/vk/sharing/target/TargetsLoader$$Lambda$2;->lambdaFactory$(Lcom/vk/sharing/target/TargetsLoader;Ljava/util/ArrayList;)Ljava/lang/Runnable;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 229
    return-void
.end method

.method public loadDialogs(I)V
    .locals 2
    .param p1, "offset"    # I

    .prologue
    .line 95
    iget-boolean v0, p0, Lcom/vk/sharing/target/TargetsLoader;->loadingDialogs:Z

    if-eqz v0, :cond_0

    .line 114
    :goto_0
    return-void

    .line 99
    :cond_0
    invoke-direct {p0}, Lcom/vk/sharing/target/TargetsLoader;->toggleLoadingDialogs()V

    .line 100
    const/16 v0, 0xa

    new-instance v1, Lcom/vk/sharing/target/TargetsLoader$1;

    invoke-direct {v1, p0}, Lcom/vk/sharing/target/TargetsLoader$1;-><init>(Lcom/vk/sharing/target/TargetsLoader;)V

    invoke-static {p1, v0, v1}, Lcom/vkontakte/android/data/Messages;->getDialogs(IILcom/vkontakte/android/data/Messages$GetDialogsCallback;)V

    goto :goto_0
.end method

.method public loadGroups()V
    .locals 2

    .prologue
    .line 117
    iget-boolean v0, p0, Lcom/vk/sharing/target/TargetsLoader;->loadingGroups:Z

    if-eqz v0, :cond_0

    .line 138
    :goto_0
    return-void

    .line 121
    :cond_0
    invoke-direct {p0}, Lcom/vk/sharing/target/TargetsLoader;->toggleLoadingGroups()V

    .line 123
    const/4 v0, 0x2

    new-instance v1, Lcom/vk/sharing/target/TargetsLoader$2;

    invoke-direct {v1, p0}, Lcom/vk/sharing/target/TargetsLoader$2;-><init>(Lcom/vk/sharing/target/TargetsLoader;)V

    invoke-static {v0, v1}, Lcom/vkontakte/android/data/Groups;->getGroups(ILcom/vkontakte/android/data/Groups$GetGroupsCallback;)V

    goto :goto_0
.end method

.method public loadGroupsForImpersonation(I)V
    .locals 2
    .param p1, "adminedGroupId"    # I

    .prologue
    .line 142
    iget-boolean v0, p0, Lcom/vk/sharing/target/TargetsLoader;->loadingGroups:Z

    if-eqz v0, :cond_0

    .line 195
    :goto_0
    return-void

    .line 146
    :cond_0
    invoke-direct {p0}, Lcom/vk/sharing/target/TargetsLoader;->toggleLoadingGroups()V

    .line 148
    invoke-static {}, Lcom/vk/sharing/target/GroupsForCommentsImpersonation;->getInstance()Lcom/vk/sharing/target/GroupsForCommentsImpersonation;

    move-result-object v0

    new-instance v1, Lcom/vk/sharing/target/TargetsLoader$3;

    invoke-direct {v1, p0, p1}, Lcom/vk/sharing/target/TargetsLoader$3;-><init>(Lcom/vk/sharing/target/TargetsLoader;I)V

    invoke-virtual {v0, v1}, Lcom/vk/sharing/target/GroupsForCommentsImpersonation;->load(Lcom/vkontakte/android/api/Callback;)V

    goto :goto_0
.end method

.method public searchDialogs(Ljava/lang/String;)V
    .locals 1
    .param p1, "query"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 198
    iget-boolean v0, p0, Lcom/vk/sharing/target/TargetsLoader;->searching:Z

    if-eqz v0, :cond_0

    .line 217
    :goto_0
    return-void

    .line 202
    :cond_0
    invoke-direct {p0}, Lcom/vk/sharing/target/TargetsLoader;->toggleSearching()V

    .line 203
    new-instance v0, Lcom/vk/sharing/target/TargetsLoader$4;

    invoke-direct {v0, p0}, Lcom/vk/sharing/target/TargetsLoader$4;-><init>(Lcom/vk/sharing/target/TargetsLoader;)V

    invoke-static {p1, v0}, Lcom/vkontakte/android/data/Messages;->searchDialogs(Ljava/lang/String;Lcom/vkontakte/android/data/Messages$SearchDialogsCallback;)V

    goto :goto_0
.end method

.method public searchGroups(Ljava/lang/String;)V
    .locals 2
    .param p1, "query"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 220
    iget-boolean v0, p0, Lcom/vk/sharing/target/TargetsLoader;->searching:Z

    if-eqz v0, :cond_0

    .line 230
    :goto_0
    return-void

    .line 224
    :cond_0
    invoke-direct {p0}, Lcom/vk/sharing/target/TargetsLoader;->toggleSearching()V

    .line 225
    const/4 v0, 0x2

    invoke-static {p0}, Lcom/vk/sharing/target/TargetsLoader$$Lambda$1;->lambdaFactory$(Lcom/vk/sharing/target/TargetsLoader;)Lcom/vkontakte/android/data/Groups$SearchGroupsCallback;

    move-result-object v1

    invoke-static {p1, v0, v1}, Lcom/vkontakte/android/data/Groups;->search(Ljava/lang/String;ILcom/vkontakte/android/data/Groups$SearchGroupsCallback;)V

    goto :goto_0
.end method

.method public setCallback(Lcom/vk/sharing/target/TargetsLoader$Callback;)V
    .locals 0
    .param p1, "callback"    # Lcom/vk/sharing/target/TargetsLoader$Callback;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 91
    iput-object p1, p0, Lcom/vk/sharing/target/TargetsLoader;->callback:Lcom/vk/sharing/target/TargetsLoader$Callback;

    .line 92
    return-void
.end method
