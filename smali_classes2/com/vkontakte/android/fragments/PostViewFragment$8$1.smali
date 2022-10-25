.class Lcom/vkontakte/android/fragments/PostViewFragment$8$1;
.super Ljava/lang/Object;
.source "PostViewFragment.java"

# interfaces
.implements Landroid/widget/PopupMenu$OnMenuItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/PostViewFragment$8;->onLongClick(Landroid/view/View;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/vkontakte/android/fragments/PostViewFragment$8;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/PostViewFragment$8;)V
    .locals 0
    .param p1, "this$1"    # Lcom/vkontakte/android/fragments/PostViewFragment$8;

    .prologue
    .line 760
    iput-object p1, p0, Lcom/vkontakte/android/fragments/PostViewFragment$8$1;->this$1:Lcom/vkontakte/android/fragments/PostViewFragment$8;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onMenuItemClick(Landroid/view/MenuItem;)Z
    .locals 1
    .param p1, "menuItem"    # Landroid/view/MenuItem;

    .prologue
    .line 763
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment$8$1;->this$1:Lcom/vkontakte/android/fragments/PostViewFragment$8;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/PostViewFragment$8;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$1400(Lcom/vkontakte/android/fragments/PostViewFragment;)V

    .line 765
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment$8$1;->this$1:Lcom/vkontakte/android/fragments/PostViewFragment$8;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/PostViewFragment$8;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$1100(Lcom/vkontakte/android/fragments/PostViewFragment;)Lcom/vkontakte/android/ui/WriteBar;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/WriteBar;->isUploading()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 766
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment$8$1;->this$1:Lcom/vkontakte/android/fragments/PostViewFragment$8;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/PostViewFragment$8;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$1200(Lcom/vkontakte/android/fragments/PostViewFragment;)V

    .line 770
    :goto_0
    const/4 v0, 0x1

    return v0

    .line 768
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment$8$1;->this$1:Lcom/vkontakte/android/fragments/PostViewFragment$8;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/PostViewFragment$8;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$1300(Lcom/vkontakte/android/fragments/PostViewFragment;)V

    goto :goto_0
.end method
