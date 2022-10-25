.class Lcom/vkontakte/android/fragments/PostListFragment$7$1;
.super Landroid/animation/AnimatorListenerAdapter;
.source "PostListFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/PostListFragment$7;->onPreDraw()Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/vkontakte/android/fragments/PostListFragment$7;

.field final synthetic val$set:Landroid/animation/AnimatorSet;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/PostListFragment$7;Landroid/animation/AnimatorSet;)V
    .locals 0
    .param p1, "this$1"    # Lcom/vkontakte/android/fragments/PostListFragment$7;

    .prologue
    .line 977
    iput-object p1, p0, Lcom/vkontakte/android/fragments/PostListFragment$7$1;->this$1:Lcom/vkontakte/android/fragments/PostListFragment$7;

    iput-object p2, p0, Lcom/vkontakte/android/fragments/PostListFragment$7$1;->val$set:Landroid/animation/AnimatorSet;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 5
    .param p1, "anim"    # Landroid/animation/Animator;

    .prologue
    .line 979
    iget-object v3, p0, Lcom/vkontakte/android/fragments/PostListFragment$7$1;->this$1:Lcom/vkontakte/android/fragments/PostListFragment$7;

    iget-object v3, v3, Lcom/vkontakte/android/fragments/PostListFragment$7;->this$0:Lcom/vkontakte/android/fragments/PostListFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/PostListFragment;->access$500(Lcom/vkontakte/android/fragments/PostListFragment;)Ljava/util/ArrayList;

    move-result-object v3

    iget-object v4, p0, Lcom/vkontakte/android/fragments/PostListFragment$7$1;->val$set:Landroid/animation/AnimatorSet;

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 980
    iget-object v3, p0, Lcom/vkontakte/android/fragments/PostListFragment$7$1;->this$1:Lcom/vkontakte/android/fragments/PostListFragment$7;

    iget-object v3, v3, Lcom/vkontakte/android/fragments/PostListFragment$7;->this$0:Lcom/vkontakte/android/fragments/PostListFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/PostListFragment;->access$1500(Lcom/vkontakte/android/fragments/PostListFragment;)Lme/grishka/appkit/views/UsableRecyclerView;

    move-result-object v3

    if-nez v3, :cond_1

    .line 992
    :cond_0
    return-void

    .line 983
    :cond_1
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v3, p0, Lcom/vkontakte/android/fragments/PostListFragment$7$1;->this$1:Lcom/vkontakte/android/fragments/PostListFragment$7;

    iget-object v3, v3, Lcom/vkontakte/android/fragments/PostListFragment$7;->this$0:Lcom/vkontakte/android/fragments/PostListFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/PostListFragment;->access$1600(Lcom/vkontakte/android/fragments/PostListFragment;)Lme/grishka/appkit/views/UsableRecyclerView;

    move-result-object v3

    invoke-virtual {v3}, Lme/grishka/appkit/views/UsableRecyclerView;->getChildCount()I

    move-result v3

    if-ge v1, v3, :cond_0

    .line 984
    iget-object v3, p0, Lcom/vkontakte/android/fragments/PostListFragment$7$1;->this$1:Lcom/vkontakte/android/fragments/PostListFragment$7;

    iget-object v3, v3, Lcom/vkontakte/android/fragments/PostListFragment$7;->this$0:Lcom/vkontakte/android/fragments/PostListFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/PostListFragment;->access$1700(Lcom/vkontakte/android/fragments/PostListFragment;)Lme/grishka/appkit/views/UsableRecyclerView;

    move-result-object v3

    invoke-virtual {v3, v1}, Lme/grishka/appkit/views/UsableRecyclerView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 985
    .local v0, "c":Landroid/view/View;
    const v3, 0x7f100084

    invoke-virtual {v0, v3}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 986
    .local v2, "id":Ljava/lang/String;
    if-nez v2, :cond_2

    .line 983
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 989
    :cond_2
    const/4 v3, 0x0

    invoke-virtual {v0, v3}, Landroid/view/View;->setTranslationY(F)V

    .line 990
    const/high16 v3, 0x3f800000    # 1.0f

    invoke-virtual {v0, v3}, Landroid/view/View;->setAlpha(F)V

    goto :goto_1
.end method
