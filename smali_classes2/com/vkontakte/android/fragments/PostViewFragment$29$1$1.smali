.class Lcom/vkontakte/android/fragments/PostViewFragment$29$1$1;
.super Ljava/lang/Object;
.source "PostViewFragment.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/PostViewFragment$29$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lcom/vkontakte/android/fragments/PostViewFragment$29$1;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/PostViewFragment$29$1;)V
    .locals 0
    .param p1, "this$2"    # Lcom/vkontakte/android/fragments/PostViewFragment$29$1;

    .prologue
    .line 1622
    iput-object p1, p0, Lcom/vkontakte/android/fragments/PostViewFragment$29$1$1;->this$2:Lcom/vkontakte/android/fragments/PostViewFragment$29$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 1627
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment$29$1$1;->this$2:Lcom/vkontakte/android/fragments/PostViewFragment$29$1;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/PostViewFragment$29$1;->this$1:Lcom/vkontakte/android/fragments/PostViewFragment$29;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/PostViewFragment$29;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$3500(Lcom/vkontakte/android/fragments/PostViewFragment;)Lme/grishka/appkit/views/UsableRecyclerView;

    move-result-object v0

    const v1, 0x98967f

    invoke-virtual {v0, v1}, Lme/grishka/appkit/views/UsableRecyclerView;->smoothScrollToPosition(I)V

    .line 1628
    return-void
.end method
