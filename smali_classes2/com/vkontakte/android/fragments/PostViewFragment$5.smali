.class Lcom/vkontakte/android/fragments/PostViewFragment$5;
.super Ljava/lang/Object;
.source "PostViewFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


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
    .line 713
    iput-object p1, p0, Lcom/vkontakte/android/fragments/PostViewFragment$5;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 716
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment$5;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$900(Lcom/vkontakte/android/fragments/PostViewFragment;)Lcom/vkontakte/android/LoadMoreCommentsView;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/LoadMoreCommentsView;->showProgress(Z)V

    .line 717
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment$5;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/PostViewFragment;->updateList()V

    .line 718
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment$5;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$800(Lcom/vkontakte/android/fragments/PostViewFragment;Z)V

    .line 719
    return-void
.end method
