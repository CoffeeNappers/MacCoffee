.class Lcom/vkontakte/android/ui/SearchViewWrapper$5;
.super Ljava/lang/Object;
.source "SearchViewWrapper.java"

# interfaces
.implements Landroid/support/v4/view/MenuItemCompat$OnActionExpandListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/ui/SearchViewWrapper;->onCreateOptionsMenu(Landroid/view/Menu;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/ui/SearchViewWrapper;

.field final synthetic val$menu:Landroid/view/Menu;

.field final synthetic val$search:Landroid/view/MenuItem;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/ui/SearchViewWrapper;Landroid/view/Menu;Landroid/view/MenuItem;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/ui/SearchViewWrapper;

    .prologue
    .line 237
    iput-object p1, p0, Lcom/vkontakte/android/ui/SearchViewWrapper$5;->this$0:Lcom/vkontakte/android/ui/SearchViewWrapper;

    iput-object p2, p0, Lcom/vkontakte/android/ui/SearchViewWrapper$5;->val$menu:Landroid/view/Menu;

    iput-object p3, p0, Lcom/vkontakte/android/ui/SearchViewWrapper$5;->val$search:Landroid/view/MenuItem;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method synthetic lambda$onMenuItemActionExpand$0()V
    .locals 3

    .prologue
    .line 246
    iget-object v1, p0, Lcom/vkontakte/android/ui/SearchViewWrapper$5;->this$0:Lcom/vkontakte/android/ui/SearchViewWrapper;

    invoke-static {v1}, Lcom/vkontakte/android/ui/SearchViewWrapper;->access$000(Lcom/vkontakte/android/ui/SearchViewWrapper;)Landroid/app/Activity;

    move-result-object v1

    const-string/jumbo v2, "input_method"

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 247
    .local v0, "imm":Landroid/view/inputmethod/InputMethodManager;
    iget-object v1, p0, Lcom/vkontakte/android/ui/SearchViewWrapper$5;->this$0:Lcom/vkontakte/android/ui/SearchViewWrapper;

    invoke-static {v1}, Lcom/vkontakte/android/ui/SearchViewWrapper;->access$600(Lcom/vkontakte/android/ui/SearchViewWrapper;)Landroid/widget/EditText;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/inputmethod/InputMethodManager;->showSoftInput(Landroid/view/View;I)Z

    .line 248
    return-void
.end method

.method public onMenuItemActionCollapse(Landroid/view/MenuItem;)Z
    .locals 6
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 262
    iget-object v2, p0, Lcom/vkontakte/android/ui/SearchViewWrapper$5;->this$0:Lcom/vkontakte/android/ui/SearchViewWrapper;

    invoke-static {v2, v4}, Lcom/vkontakte/android/ui/SearchViewWrapper;->access$702(Lcom/vkontakte/android/ui/SearchViewWrapper;Z)Z

    .line 263
    iget-object v2, p0, Lcom/vkontakte/android/ui/SearchViewWrapper$5;->this$0:Lcom/vkontakte/android/ui/SearchViewWrapper;

    invoke-static {v2, v5}, Lcom/vkontakte/android/ui/SearchViewWrapper;->access$1002(Lcom/vkontakte/android/ui/SearchViewWrapper;Z)Z

    .line 264
    iget-object v2, p0, Lcom/vkontakte/android/ui/SearchViewWrapper$5;->this$0:Lcom/vkontakte/android/ui/SearchViewWrapper;

    invoke-static {v2}, Lcom/vkontakte/android/ui/SearchViewWrapper;->access$800(Lcom/vkontakte/android/ui/SearchViewWrapper;)Lcom/vkontakte/android/ui/SearchViewWrapper$ViewStateListener;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 265
    iget-object v2, p0, Lcom/vkontakte/android/ui/SearchViewWrapper$5;->this$0:Lcom/vkontakte/android/ui/SearchViewWrapper;

    invoke-static {v2}, Lcom/vkontakte/android/ui/SearchViewWrapper;->access$800(Lcom/vkontakte/android/ui/SearchViewWrapper;)Lcom/vkontakte/android/ui/SearchViewWrapper$ViewStateListener;

    move-result-object v2

    invoke-interface {v2, v4}, Lcom/vkontakte/android/ui/SearchViewWrapper$ViewStateListener;->onViewExpansionStateChanged(Z)V

    .line 267
    :cond_0
    iget-object v2, p0, Lcom/vkontakte/android/ui/SearchViewWrapper$5;->this$0:Lcom/vkontakte/android/ui/SearchViewWrapper;

    invoke-static {v2}, Lcom/vkontakte/android/ui/SearchViewWrapper;->access$000(Lcom/vkontakte/android/ui/SearchViewWrapper;)Landroid/app/Activity;

    move-result-object v2

    const-string/jumbo v3, "input_method"

    invoke-virtual {v2, v3}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/inputmethod/InputMethodManager;

    .line 268
    .local v1, "imm":Landroid/view/inputmethod/InputMethodManager;
    iget-object v2, p0, Lcom/vkontakte/android/ui/SearchViewWrapper$5;->this$0:Lcom/vkontakte/android/ui/SearchViewWrapper;

    invoke-static {v2}, Lcom/vkontakte/android/ui/SearchViewWrapper;->access$600(Lcom/vkontakte/android/ui/SearchViewWrapper;)Landroid/widget/EditText;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/EditText;->getWindowToken()Landroid/os/IBinder;

    move-result-object v2

    invoke-virtual {v1, v2, v4}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 269
    iget-object v2, p0, Lcom/vkontakte/android/ui/SearchViewWrapper$5;->this$0:Lcom/vkontakte/android/ui/SearchViewWrapper;

    invoke-virtual {v2}, Lcom/vkontakte/android/ui/SearchViewWrapper;->clear()V

    .line 270
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v2, p0, Lcom/vkontakte/android/ui/SearchViewWrapper$5;->val$menu:Landroid/view/Menu;

    invoke-interface {v2}, Landroid/view/Menu;->size()I

    move-result v2

    if-ge v0, v2, :cond_3

    .line 271
    iget-object v2, p0, Lcom/vkontakte/android/ui/SearchViewWrapper$5;->val$menu:Landroid/view/Menu;

    invoke-interface {v2, v0}, Landroid/view/Menu;->getItem(I)Landroid/view/MenuItem;

    move-result-object v2

    iget-object v3, p0, Lcom/vkontakte/android/ui/SearchViewWrapper$5;->val$search:Landroid/view/MenuItem;

    if-ne v2, v3, :cond_2

    .line 270
    :cond_1
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 274
    :cond_2
    iget-object v2, p0, Lcom/vkontakte/android/ui/SearchViewWrapper$5;->this$0:Lcom/vkontakte/android/ui/SearchViewWrapper;

    invoke-static {v2}, Lcom/vkontakte/android/ui/SearchViewWrapper;->access$900(Lcom/vkontakte/android/ui/SearchViewWrapper;)[Z

    move-result-object v2

    if-eqz v2, :cond_1

    .line 275
    iget-object v2, p0, Lcom/vkontakte/android/ui/SearchViewWrapper$5;->val$menu:Landroid/view/Menu;

    invoke-interface {v2, v0}, Landroid/view/Menu;->getItem(I)Landroid/view/MenuItem;

    move-result-object v2

    iget-object v3, p0, Lcom/vkontakte/android/ui/SearchViewWrapper$5;->this$0:Lcom/vkontakte/android/ui/SearchViewWrapper;

    invoke-static {v3}, Lcom/vkontakte/android/ui/SearchViewWrapper;->access$900(Lcom/vkontakte/android/ui/SearchViewWrapper;)[Z

    move-result-object v3

    aget-boolean v3, v3, v0

    invoke-interface {v2, v3}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    goto :goto_1

    .line 278
    :cond_3
    return v5
.end method

.method public onMenuItemActionExpand(Landroid/view/MenuItem;)Z
    .locals 4
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    const/4 v3, 0x1

    .line 240
    iget-object v1, p0, Lcom/vkontakte/android/ui/SearchViewWrapper$5;->this$0:Lcom/vkontakte/android/ui/SearchViewWrapper;

    invoke-static {v1, v3}, Lcom/vkontakte/android/ui/SearchViewWrapper;->access$702(Lcom/vkontakte/android/ui/SearchViewWrapper;Z)Z

    .line 241
    iget-object v1, p0, Lcom/vkontakte/android/ui/SearchViewWrapper$5;->this$0:Lcom/vkontakte/android/ui/SearchViewWrapper;

    invoke-static {v1}, Lcom/vkontakte/android/ui/SearchViewWrapper;->access$800(Lcom/vkontakte/android/ui/SearchViewWrapper;)Lcom/vkontakte/android/ui/SearchViewWrapper$ViewStateListener;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 242
    iget-object v1, p0, Lcom/vkontakte/android/ui/SearchViewWrapper$5;->this$0:Lcom/vkontakte/android/ui/SearchViewWrapper;

    invoke-static {v1}, Lcom/vkontakte/android/ui/SearchViewWrapper;->access$800(Lcom/vkontakte/android/ui/SearchViewWrapper;)Lcom/vkontakte/android/ui/SearchViewWrapper$ViewStateListener;

    move-result-object v1

    invoke-interface {v1, v3}, Lcom/vkontakte/android/ui/SearchViewWrapper$ViewStateListener;->onViewExpansionStateChanged(Z)V

    .line 244
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/ui/SearchViewWrapper$5;->this$0:Lcom/vkontakte/android/ui/SearchViewWrapper;

    invoke-static {v1}, Lcom/vkontakte/android/ui/SearchViewWrapper;->access$600(Lcom/vkontakte/android/ui/SearchViewWrapper;)Landroid/widget/EditText;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/EditText;->requestFocus()Z

    .line 245
    iget-object v1, p0, Lcom/vkontakte/android/ui/SearchViewWrapper$5;->this$0:Lcom/vkontakte/android/ui/SearchViewWrapper;

    invoke-static {v1}, Lcom/vkontakte/android/ui/SearchViewWrapper;->access$600(Lcom/vkontakte/android/ui/SearchViewWrapper;)Landroid/widget/EditText;

    move-result-object v1

    invoke-static {p0}, Lcom/vkontakte/android/ui/SearchViewWrapper$5$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/ui/SearchViewWrapper$5;)Ljava/lang/Runnable;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->post(Ljava/lang/Runnable;)Z

    .line 249
    iget-object v1, p0, Lcom/vkontakte/android/ui/SearchViewWrapper$5;->this$0:Lcom/vkontakte/android/ui/SearchViewWrapper;

    iget-object v2, p0, Lcom/vkontakte/android/ui/SearchViewWrapper$5;->val$menu:Landroid/view/Menu;

    invoke-interface {v2}, Landroid/view/Menu;->size()I

    move-result v2

    new-array v2, v2, [Z

    invoke-static {v1, v2}, Lcom/vkontakte/android/ui/SearchViewWrapper;->access$902(Lcom/vkontakte/android/ui/SearchViewWrapper;[Z)[Z

    .line 250
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lcom/vkontakte/android/ui/SearchViewWrapper$5;->val$menu:Landroid/view/Menu;

    invoke-interface {v1}, Landroid/view/Menu;->size()I

    move-result v1

    if-ge v0, v1, :cond_2

    .line 251
    iget-object v1, p0, Lcom/vkontakte/android/ui/SearchViewWrapper$5;->val$menu:Landroid/view/Menu;

    invoke-interface {v1, v0}, Landroid/view/Menu;->getItem(I)Landroid/view/MenuItem;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/ui/SearchViewWrapper$5;->val$search:Landroid/view/MenuItem;

    if-ne v1, v2, :cond_1

    .line 250
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 254
    :cond_1
    iget-object v1, p0, Lcom/vkontakte/android/ui/SearchViewWrapper$5;->this$0:Lcom/vkontakte/android/ui/SearchViewWrapper;

    invoke-static {v1}, Lcom/vkontakte/android/ui/SearchViewWrapper;->access$900(Lcom/vkontakte/android/ui/SearchViewWrapper;)[Z

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/ui/SearchViewWrapper$5;->val$menu:Landroid/view/Menu;

    invoke-interface {v2, v0}, Landroid/view/Menu;->getItem(I)Landroid/view/MenuItem;

    move-result-object v2

    invoke-interface {v2}, Landroid/view/MenuItem;->isVisible()Z

    move-result v2

    aput-boolean v2, v1, v0

    .line 255
    iget-object v1, p0, Lcom/vkontakte/android/ui/SearchViewWrapper$5;->val$menu:Landroid/view/Menu;

    invoke-interface {v1, v0}, Landroid/view/Menu;->getItem(I)Landroid/view/MenuItem;

    move-result-object v1

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    goto :goto_1

    .line 257
    :cond_2
    return v3
.end method
