.class public abstract Lcom/vkontakte/android/ui/navigation/NavigationDelegate;
.super Ljava/lang/Object;
.source "NavigationDelegate.java"


# instance fields
.field final activity:Landroid/app/Activity;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field

.field final isTopLevel:Z


# direct methods
.method constructor <init>(Landroid/app/Activity;Z)V
    .locals 0
    .param p1, "activity"    # Landroid/app/Activity;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "isTopLevel"    # Z

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    iput-object p1, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegate;->activity:Landroid/app/Activity;

    .line 27
    iput-boolean p2, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegate;->isTopLevel:Z

    .line 28
    return-void
.end method


# virtual methods
.method public abstract getResources(Landroid/content/res/Resources;)Landroid/content/res/Resources;
.end method

.method public abstract onBackPressed()Z
.end method

.method public abstract onConfigurationChanged(Landroid/content/res/Configuration;)V
.end method

.method public abstract onNavigateUp()Z
.end method

.method public abstract onOptionsItemSelected(Landroid/view/MenuItem;)Z
.end method

.method public abstract onPrepareOptionsMenu(Landroid/view/Menu;)V
.end method

.method public abstract onResume()V
.end method

.method public abstract openFragment(Ljava/lang/Class;Landroid/os/Bundle;Z)V
    .param p2    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
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
.end method

.method openFragmentInner(Ljava/lang/Class;Landroid/os/Bundle;Z)V
    .locals 3
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
    .line 49
    .local p1, "fClass":Ljava/lang/Class;, "Ljava/lang/Class<+Landroid/app/Fragment;>;"
    if-eqz p3, :cond_0

    .line 50
    iget-object v0, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegate;->activity:Landroid/app/Activity;

    invoke-static {p1, p2, v0}, Lcom/vkontakte/android/navigation/Navigate;->to(Ljava/lang/Class;Landroid/os/Bundle;Landroid/content/Context;)V

    .line 58
    :goto_0
    return-void

    .line 51
    :cond_0
    iget-boolean v0, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegate;->isTopLevel:Z

    if-eqz v0, :cond_1

    .line 52
    const-string/jumbo v0, "_from_menu"

    const/4 v1, 0x1

    invoke-virtual {p2, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 53
    iget-object v0, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegate;->activity:Landroid/app/Activity;

    invoke-static {v0, p1, p2, p0}, Lcom/vkontakte/android/ui/FragmentHelper;->replace(Landroid/app/Activity;Ljava/lang/Class;Landroid/os/Bundle;Lcom/vkontakte/android/ui/navigation/NavigationDelegate;)Landroid/app/Fragment;

    goto :goto_0

    .line 55
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegate;->activity:Landroid/app/Activity;

    new-instance v1, Lcom/vkontakte/android/navigation/Navigator;

    const-class v2, Lcom/vkontakte/android/MainActivity;

    invoke-direct {v1, p1, v2, p2}, Lcom/vkontakte/android/navigation/Navigator;-><init>(Ljava/lang/Class;Ljava/lang/Class;Landroid/os/Bundle;)V

    iget-object v2, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegate;->activity:Landroid/app/Activity;

    .line 56
    invoke-virtual {v1, v2}, Lcom/vkontakte/android/navigation/Navigator;->intent(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v1

    const/high16 v2, 0x4000000

    invoke-virtual {v1, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    move-result-object v1

    .line 55
    invoke-virtual {v0, v1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0
.end method

.method public abstract setContentView(Landroid/view/View;)V
.end method
