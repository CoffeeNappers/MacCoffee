.class Lcom/vkontakte/android/fragments/PostViewFragment$3;
.super Ljava/lang/Object;
.source "PostViewFragment.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/PostViewFragment;->onCreate(Landroid/os/Bundle;)V
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
    .line 521
    iput-object p1, p0, Lcom/vkontakte/android/fragments/PostViewFragment$3;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 524
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment$3;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$400(Lcom/vkontakte/android/fragments/PostViewFragment;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 525
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment$3;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$500(Lcom/vkontakte/android/fragments/PostViewFragment;)Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    move-result-object v0

    invoke-virtual {v0, v1}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->notifyItemRemoved(I)V

    .line 526
    return-void
.end method
