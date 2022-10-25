.class Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu$1;
.super Ljava/lang/Object;
.source "NavigationDelegateLeftMenu.java"

# interfaces
.implements Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu$MenuStateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu;->openFragment(Ljava/lang/Class;Landroid/os/Bundle;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field called:Z

.field final synthetic this$0:Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu;

.field final synthetic val$args:Landroid/os/Bundle;

.field final synthetic val$back:Z

.field final synthetic val$fClass:Ljava/lang/Class;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu;Ljava/lang/Class;Landroid/os/Bundle;Z)V
    .locals 1
    .param p1, "this$0"    # Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu;

    .prologue
    .line 193
    .local p0, "this":Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu$1;, "Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu$1;"
    iput-object p1, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu$1;->this$0:Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu;

    iput-object p2, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu$1;->val$fClass:Ljava/lang/Class;

    iput-object p3, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu$1;->val$args:Landroid/os/Bundle;

    iput-boolean p4, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu$1;->val$back:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 194
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu$1;->called:Z

    return-void
.end method


# virtual methods
.method synthetic lambda$onMenuClosed$0()V
    .locals 1

    .prologue
    .line 206
    .local p0, "this":Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu$1;, "Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu$1;"
    iget-object v0, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu$1;->this$0:Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu;

    invoke-static {v0, p0}, Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu;->access$000(Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu;Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu$MenuStateListener;)V

    return-void
.end method

.method public onMenuClosed()V
    .locals 4

    .prologue
    .line 202
    .local p0, "this":Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu$1;, "Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu$1;"
    iget-boolean v0, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu$1;->called:Z

    if-nez v0, :cond_0

    .line 203
    iget-object v0, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu$1;->this$0:Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu;

    iget-object v1, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu$1;->val$fClass:Ljava/lang/Class;

    iget-object v2, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu$1;->val$args:Landroid/os/Bundle;

    iget-boolean v3, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu$1;->val$back:Z

    invoke-virtual {v0, v1, v2, v3}, Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu;->openFragmentInner(Ljava/lang/Class;Landroid/os/Bundle;Z)V

    .line 204
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu$1;->called:Z

    .line 206
    :cond_0
    invoke-static {p0}, Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu$1$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu$1;)Ljava/lang/Runnable;

    move-result-object v0

    invoke-static {v0}, Lcom/vkontakte/android/ViewUtils;->post(Ljava/lang/Runnable;)V

    .line 207
    return-void
.end method

.method public onMenuOpened()V
    .locals 0

    .prologue
    .line 198
    .local p0, "this":Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu$1;, "Lcom/vkontakte/android/ui/navigation/NavigationDelegateLeftMenu$1;"
    return-void
.end method
