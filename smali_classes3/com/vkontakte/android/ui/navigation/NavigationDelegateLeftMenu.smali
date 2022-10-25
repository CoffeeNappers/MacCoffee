.class public abstract Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu;
.super Lcom/vkontakte/android/ui/navigation/NavigationDelegate;
.source "NavigationDelegateLeftMenu.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu$MenuStateListener;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<M:",
        "Landroid/view/ViewGroup;",
        ">",
        "Lcom/vkontakte/android/ui/navigation/NavigationDelegate;"
    }
.end annotation


# instance fields
.field private isOpened:Z

.field private final lock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

.field protected menu:Landroid/view/ViewGroup;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TM;"
        }
    .end annotation
.end field

.field menuList:Lcom/vkontakte/android/ui/widget/MenuListView;

.field private final menuStateListeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu$MenuStateListener;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Landroid/app/Activity;Z)V
    .locals 1
    .param p1, "activity"    # Landroid/app/Activity;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "isTopLevel"    # Z

    .prologue
    .line 46
    .local p0, "this":Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu;, "Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu<TM;>;"
    invoke-direct {p0, p1, p2}, Lcom/vkontakte/android/ui/navigation/NavigationDelegate;-><init>(Landroid/app/Activity;Z)V

    .line 40
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu;->isOpened:Z

    .line 42
    new-instance v0, Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-direct {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu;->lock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    .line 43
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu;->menuStateListeners:Ljava/util/List;

    .line 47
    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu;Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu$MenuStateListener;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu;
    .param p1, "x1"    # Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu$MenuStateListener;

    .prologue
    .line 29
    invoke-direct {p0, p1}, Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu;->removeMenuStateListener(Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu$MenuStateListener;)V

    return-void
.end method

.method private addMenuStateListener(Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu$MenuStateListener;)V
    .locals 2
    .param p1, "listener"    # Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu$MenuStateListener;

    .prologue
    .line 56
    .local p0, "this":Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu;, "Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu<TM;>;"
    iget-object v0, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu;->lock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->lock()V

    .line 58
    :try_start_0
    iget-object v1, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu;->menuStateListeners:Ljava/util/List;

    monitor-enter v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 59
    :try_start_1
    iget-object v0, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu;->menuStateListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 60
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 62
    iget-object v0, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu;->lock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->unlock()V

    .line 64
    return-void

    .line 60
    :catchall_0
    move-exception v0

    :try_start_2
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :try_start_3
    throw v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 62
    :catchall_1
    move-exception v0

    iget-object v1, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu;->lock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->unlock()V

    throw v0
.end method

.method private isMenuOpened()Z
    .locals 1

    .prologue
    .line 176
    .local p0, "this":Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu;, "Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu<TM;>;"
    iget-boolean v0, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu;->isOpened:Z

    return v0
.end method

.method private removeMenuStateListener(Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu$MenuStateListener;)V
    .locals 2
    .param p1, "listener"    # Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu$MenuStateListener;

    .prologue
    .line 67
    .local p0, "this":Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu;, "Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu<TM;>;"
    iget-object v0, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu;->lock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->lock()V

    .line 69
    :try_start_0
    iget-object v1, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu;->menuStateListeners:Ljava/util/List;

    monitor-enter v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 70
    :try_start_1
    iget-object v0, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu;->menuStateListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 71
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 73
    iget-object v0, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu;->lock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->unlock()V

    .line 75
    return-void

    .line 71
    :catchall_0
    move-exception v0

    :try_start_2
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :try_start_3
    throw v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 73
    :catchall_1
    move-exception v0

    iget-object v1, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu;->lock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->unlock()V

    throw v0
.end method


# virtual methods
.method public abstract closeMenu()V
.end method

.method public getResources(Landroid/content/res/Resources;)Landroid/content/res/Resources;
    .locals 1
    .param p1, "originResources"    # Landroid/content/res/Resources;

    .prologue
    .line 114
    .local p0, "this":Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu;, "Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu<TM;>;"
    const/4 v0, 0x0

    return-object v0
.end method

.method abstract initializeLeftMenu(Landroid/view/View;)V
.end method

.method public onBackPressed()Z
    .locals 1

    .prologue
    .line 105
    .local p0, "this":Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu;, "Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu<TM;>;"
    invoke-direct {p0}, Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu;->isMenuOpened()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 106
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu;->closeMenu()V

    .line 107
    const/4 v0, 0x1

    .line 109
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 0
    .param p1, "cfg"    # Landroid/content/res/Configuration;

    .prologue
    .line 119
    .local p0, "this":Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu;, "Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu<TM;>;"
    return-void
.end method

.method onMenuClosed()V
    .locals 3

    .prologue
    .line 90
    .local p0, "this":Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu;, "Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu<TM;>;"
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu;->isOpened:Z

    .line 91
    iget-object v1, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu;->lock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 93
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    :try_start_0
    iget-object v1, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu;->menuStateListeners:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 94
    iget-object v1, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu;->menuStateListeners:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu$MenuStateListener;

    invoke-interface {v1}, Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu$MenuStateListener;->onMenuClosed()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 93
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 97
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu;->lock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 99
    return-void

    .line 97
    :catchall_0
    move-exception v1

    iget-object v2, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu;->lock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    throw v1
.end method

.method onMenuOpened()V
    .locals 3

    .prologue
    .line 78
    .local p0, "this":Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu;, "Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu<TM;>;"
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu;->isOpened:Z

    .line 79
    iget-object v1, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu;->lock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 81
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    :try_start_0
    iget-object v1, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu;->menuStateListeners:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 82
    iget-object v1, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu;->menuStateListeners:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu$MenuStateListener;

    invoke-interface {v1}, Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu$MenuStateListener;->onMenuOpened()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 81
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 85
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu;->lock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 87
    return-void

    .line 85
    :catchall_0
    move-exception v1

    iget-object v2, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu;->lock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    throw v1
.end method

.method public onNavigateUp()Z
    .locals 1

    .prologue
    .line 181
    .local p0, "this":Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu;, "Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu<TM;>;"
    invoke-direct {p0}, Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu;->isMenuOpened()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 182
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu;->closeMenu()V

    .line 186
    :goto_0
    const/4 v0, 0x1

    return v0

    .line 184
    :cond_0
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu;->openMenu()V

    goto :goto_0
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 1
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 142
    .local p0, "this":Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu;, "Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu<TM;>;"
    const/4 v0, 0x0

    return v0
.end method

.method public onPrepareOptionsMenu(Landroid/view/Menu;)V
    .locals 6
    .param p1, "m"    # Landroid/view/Menu;

    .prologue
    .local p0, "this":Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu;, "Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu<TM;>;"
    const/4 v5, 0x0

    .line 123
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-interface {p1}, Landroid/view/Menu;->size()I

    move-result v4

    if-ge v1, v4, :cond_2

    .line 124
    invoke-interface {p1, v1}, Landroid/view/Menu;->getItem(I)Landroid/view/MenuItem;

    move-result-object v2

    .line 125
    .local v2, "item":Landroid/view/MenuItem;
    invoke-interface {v2}, Landroid/view/MenuItem;->getActionView()Landroid/view/View;

    move-result-object v4

    if-eqz v4, :cond_0

    .line 126
    invoke-interface {v2}, Landroid/view/MenuItem;->getActionView()Landroid/view/View;

    move-result-object v0

    .line 127
    .local v0, "actionView":Landroid/view/View;
    instance-of v4, v0, Landroid/widget/SearchView;

    if-eqz v4, :cond_0

    .line 128
    invoke-interface {v2}, Landroid/view/MenuItem;->getActionView()Landroid/view/View;

    move-result-object v4

    invoke-virtual {v4}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v3

    .line 129
    .local v3, "tag":Ljava/lang/Object;
    if-eqz v3, :cond_0

    instance-of v4, v3, Lcom/vkontakte/android/ui/SearchViewWrapper;

    if-eqz v4, :cond_0

    .line 130
    check-cast v3, Lcom/vkontakte/android/ui/SearchViewWrapper;

    .end local v3    # "tag":Ljava/lang/Object;
    invoke-direct {p0}, Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu;->isMenuOpened()Z

    move-result v4

    if-nez v4, :cond_1

    const/4 v4, 0x1

    :goto_1
    invoke-virtual {v3, v4}, Lcom/vkontakte/android/ui/SearchViewWrapper;->onVisibilityChanged(Z)V

    .line 123
    .end local v0    # "actionView":Landroid/view/View;
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .restart local v0    # "actionView":Landroid/view/View;
    :cond_1
    move v4, v5

    .line 130
    goto :goto_1

    .line 135
    .end local v0    # "actionView":Landroid/view/View;
    .end local v2    # "item":Landroid/view/MenuItem;
    :cond_2
    invoke-direct {p0}, Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu;->isMenuOpened()Z

    move-result v4

    if-eqz v4, :cond_3

    .line 136
    invoke-interface {p1, v5, v5}, Landroid/view/Menu;->setGroupVisible(IZ)V

    .line 138
    :cond_3
    return-void
.end method

.method public onResume()V
    .locals 0

    .prologue
    .line 172
    .local p0, "this":Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu;, "Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu<TM;>;"
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu;->updateUserInfo()V

    .line 173
    return-void
.end method

.method public openFragment(Ljava/lang/Class;Landroid/os/Bundle;Z)V
    .locals 2
    .param p2, "args"    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "back"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<+",
            "Landroid/app/Fragment;",
            ">;",
            "Landroid/os/Bundle;",
            "Z)V"
        }
    .end annotation

    .prologue
    .line 191
    .local p0, "this":Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu;, "Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu<TM;>;"
    .local p1, "fClass":Ljava/lang/Class;, "Ljava/lang/Class<+Landroid/app/Fragment;>;"
    const-string/jumbo v0, "_from_left_menu"

    const/4 v1, 0x1

    invoke-virtual {p2, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 192
    invoke-direct {p0}, Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu;->isMenuOpened()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 193
    new-instance v0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu$1;

    invoke-direct {v0, p0, p1, p2, p3}, Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu$1;-><init>(Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu;Ljava/lang/Class;Landroid/os/Bundle;Z)V

    invoke-direct {p0, v0}, Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu;->addMenuStateListener(Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu$MenuStateListener;)V

    .line 209
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu;->closeMenu()V

    .line 213
    :goto_0
    return-void

    .line 211
    :cond_0
    invoke-virtual {p0, p1, p2, p3}, Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu;->openFragmentInner(Ljava/lang/Class;Landroid/os/Bundle;Z)V

    goto :goto_0
.end method

.method public abstract openMenu()V
.end method

.method public setContentView(Landroid/view/View;)V
    .locals 4
    .param p1, "contentView"    # Landroid/view/View;

    .prologue
    .local p0, "this":Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu;, "Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu<TM;>;"
    const/4 v3, 0x1

    .line 147
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/auth/VKAccount;->isReal()Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu;->activity:Landroid/app/Activity;

    instance-of v0, v0, Lcom/vkontakte/android/FragmentWrapperActivity;

    if-eqz v0, :cond_2

    .line 148
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_0

    instance-of v0, p1, Lcom/vkontakte/android/ui/FitSystemWindowsFragmentWrapperFrameLayout;

    if-eqz v0, :cond_0

    .line 149
    iget-object v0, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu;->activity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    const v1, -0xc4a079

    invoke-virtual {v0, v1}, Landroid/view/Window;->setStatusBarColor(I)V

    move-object v0, p1

    .line 150
    check-cast v0, Lcom/vkontakte/android/ui/FitSystemWindowsFragmentWrapperFrameLayout;

    iget-object v1, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu;->activity:Landroid/app/Activity;

    .line 151
    invoke-virtual {v1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0f0018

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    .line 150
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/FitSystemWindowsFragmentWrapperFrameLayout;->setStatusBarColor(I)V

    move-object v0, p1

    .line 152
    check-cast v0, Lcom/vkontakte/android/ui/FitSystemWindowsFragmentWrapperFrameLayout;

    invoke-virtual {v0, v3}, Lcom/vkontakte/android/ui/FitSystemWindowsFragmentWrapperFrameLayout;->setDrawStatusBar(Z)V

    .line 153
    invoke-virtual {p1, v3}, Landroid/view/View;->setFitsSystemWindows(Z)V

    .line 155
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu;->activity:Landroid/app/Activity;

    invoke-virtual {v0, p1}, Landroid/app/Activity;->setContentView(Landroid/view/View;)V

    .line 168
    :cond_1
    :goto_0
    return-void

    .line 159
    :cond_2
    new-instance v0, Lcom/vkontakte/android/ui/widget/MenuListView;

    iget-object v1, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu;->activity:Landroid/app/Activity;

    invoke-direct {v0, v1, p0}, Lcom/vkontakte/android/ui/widget/MenuListView;-><init>(Landroid/content/Context;Lcom/vkontakte/android/ui/navigation/NavigationDelegate;)V

    iput-object v0, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu;->menuList:Lcom/vkontakte/android/ui/widget/MenuListView;

    .line 161
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu;->initializeLeftMenu(Landroid/view/View;)V

    .line 163
    iget-object v0, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu;->activity:Landroid/app/Activity;

    iget-object v1, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu;->menu:Landroid/view/ViewGroup;

    invoke-virtual {v0, v1}, Landroid/app/Activity;->setContentView(Landroid/view/View;)V

    .line 165
    iget-boolean v0, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu;->isTopLevel:Z

    if-eqz v0, :cond_1

    .line 166
    iget-object v0, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu;->menuList:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-virtual {v0, v3}, Lcom/vkontakte/android/ui/widget/MenuListView;->setCurrentItem(I)V

    goto :goto_0
.end method

.method public abstract setStatusBarColor(I)V
.end method

.method updateUserInfo()V
    .locals 1

    .prologue
    .line 50
    .local p0, "this":Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu;, "Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu<TM;>;"
    iget-object v0, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu;->menuList:Lcom/vkontakte/android/ui/widget/MenuListView;

    if-eqz v0, :cond_0

    .line 51
    iget-object v0, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu;->menuList:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/widget/MenuListView;->updateUserInfo()V

    .line 53
    :cond_0
    return-void
.end method
