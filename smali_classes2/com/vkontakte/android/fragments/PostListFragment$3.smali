.class Lcom/vkontakte/android/fragments/PostListFragment$3;
.super Lcom/vkontakte/android/api/ResultlessCallback;
.source "PostListFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/PostListFragment;->performPostAction(Ljava/lang/String;Lcom/vkontakte/android/NewsEntry;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/PostListFragment;

.field final synthetic val$e:Lcom/vkontakte/android/NewsEntry;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/PostListFragment;Landroid/content/Context;Lcom/vkontakte/android/NewsEntry;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/PostListFragment;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 681
    iput-object p1, p0, Lcom/vkontakte/android/fragments/PostListFragment$3;->this$0:Lcom/vkontakte/android/fragments/PostListFragment;

    iput-object p3, p0, Lcom/vkontakte/android/fragments/PostListFragment$3;->val$e:Lcom/vkontakte/android/NewsEntry;

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/ResultlessCallback;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public success()V
    .locals 3

    .prologue
    .line 684
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostListFragment$3;->this$0:Lcom/vkontakte/android/fragments/PostListFragment;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostListFragment$3;->val$e:Lcom/vkontakte/android/NewsEntry;

    iget v1, v1, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    iget-object v2, p0, Lcom/vkontakte/android/fragments/PostListFragment$3;->val$e:Lcom/vkontakte/android/NewsEntry;

    iget v2, v2, Lcom/vkontakte/android/NewsEntry;->postID:I

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/fragments/PostListFragment;->remove(II)V

    .line 685
    return-void
.end method
