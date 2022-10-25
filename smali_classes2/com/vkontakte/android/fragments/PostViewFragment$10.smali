.class Lcom/vkontakte/android/fragments/PostViewFragment$10;
.super Ljava/lang/Object;
.source "PostViewFragment.java"

# interfaces
.implements Landroid/view/View$OnKeyListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/PostViewFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/PostViewFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/PostViewFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/PostViewFragment;

    .prologue
    .line 794
    iput-object p1, p0, Lcom/vkontakte/android/fragments/PostViewFragment$10;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onKey(Landroid/view/View;ILandroid/view/KeyEvent;)Z
    .locals 3
    .param p1, "v"    # Landroid/view/View;
    .param p2, "keyCode"    # I
    .param p3, "event"    # Landroid/view/KeyEvent;

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 797
    const/4 v2, 0x4

    if-ne p2, v2, :cond_1

    iget-object v2, p0, Lcom/vkontakte/android/fragments/PostViewFragment$10;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$1700(Lcom/vkontakte/android/fragments/PostViewFragment;)Z

    move-result v2

    if-nez v2, :cond_1

    iget-object v2, p0, Lcom/vkontakte/android/fragments/PostViewFragment$10;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$1000(Lcom/vkontakte/android/fragments/PostViewFragment;)Lcom/vkontakte/android/stickers/KeyboardPopup;

    move-result-object v2

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/vkontakte/android/fragments/PostViewFragment$10;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$1000(Lcom/vkontakte/android/fragments/PostViewFragment;)Lcom/vkontakte/android/stickers/KeyboardPopup;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vkontakte/android/stickers/KeyboardPopup;->isShowing()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 798
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result v2

    if-ne v2, v0, :cond_0

    .line 799
    iget-object v2, p0, Lcom/vkontakte/android/fragments/PostViewFragment$10;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$1000(Lcom/vkontakte/android/fragments/PostViewFragment;)Lcom/vkontakte/android/stickers/KeyboardPopup;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/vkontakte/android/stickers/KeyboardPopup;->show(Z)V

    .line 803
    :cond_0
    :goto_0
    return v0

    :cond_1
    move v0, v1

    goto :goto_0
.end method
