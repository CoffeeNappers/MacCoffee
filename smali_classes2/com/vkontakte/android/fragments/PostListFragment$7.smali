.class Lcom/vkontakte/android/fragments/PostListFragment$7;
.super Ljava/lang/Object;
.source "PostListFragment.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnPreDrawListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/PostListFragment;->animateItemsIn()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/PostListFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/PostListFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/PostListFragment;

    .prologue
    .line 923
    iput-object p1, p0, Lcom/vkontakte/android/fragments/PostListFragment$7;->this$0:Lcom/vkontakte/android/fragments/PostListFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPreDraw()Z
    .locals 14

    .prologue
    .line 926
    iget-object v10, p0, Lcom/vkontakte/android/fragments/PostListFragment$7;->this$0:Lcom/vkontakte/android/fragments/PostListFragment;

    invoke-static {v10}, Lcom/vkontakte/android/fragments/PostListFragment;->access$700(Lcom/vkontakte/android/fragments/PostListFragment;)Lme/grishka/appkit/views/UsableRecyclerView;

    move-result-object v10

    if-nez v10, :cond_0

    .line 927
    const/4 v10, 0x0

    .line 995
    :goto_0
    return v10

    .line 929
    :cond_0
    iget-object v10, p0, Lcom/vkontakte/android/fragments/PostListFragment$7;->this$0:Lcom/vkontakte/android/fragments/PostListFragment;

    invoke-static {v10}, Lcom/vkontakte/android/fragments/PostListFragment;->access$800(Lcom/vkontakte/android/fragments/PostListFragment;)Lme/grishka/appkit/views/UsableRecyclerView;

    move-result-object v10

    invoke-virtual {v10}, Lme/grishka/appkit/views/UsableRecyclerView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v10

    invoke-virtual {v10, p0}, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 930
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 931
    .local v3, "heights":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Integer;>;"
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_1
    iget-object v10, p0, Lcom/vkontakte/android/fragments/PostListFragment$7;->this$0:Lcom/vkontakte/android/fragments/PostListFragment;

    invoke-static {v10}, Lcom/vkontakte/android/fragments/PostListFragment;->access$900(Lcom/vkontakte/android/fragments/PostListFragment;)Lme/grishka/appkit/views/UsableRecyclerView;

    move-result-object v10

    invoke-virtual {v10}, Lme/grishka/appkit/views/UsableRecyclerView;->getChildCount()I

    move-result v10

    if-ge v4, v10, :cond_3

    .line 932
    iget-object v10, p0, Lcom/vkontakte/android/fragments/PostListFragment$7;->this$0:Lcom/vkontakte/android/fragments/PostListFragment;

    invoke-static {v10}, Lcom/vkontakte/android/fragments/PostListFragment;->access$1000(Lcom/vkontakte/android/fragments/PostListFragment;)Lme/grishka/appkit/views/UsableRecyclerView;

    move-result-object v10

    invoke-virtual {v10, v4}, Lme/grishka/appkit/views/UsableRecyclerView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 933
    .local v1, "c":Landroid/view/View;
    const v10, 0x7f100084

    invoke-virtual {v1, v10}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 934
    .local v5, "id":Ljava/lang/String;
    if-nez v5, :cond_1

    .line 931
    :goto_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 937
    :cond_1
    invoke-virtual {v3, v5}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_2

    .line 938
    const/4 v10, 0x0

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {v3, v5, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 940
    :cond_2
    invoke-virtual {v3, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/Integer;

    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    move-result v10

    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    move-result v11

    add-int/2addr v10, v11

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {v3, v5, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2

    .line 942
    .end local v1    # "c":Landroid/view/View;
    .end local v5    # "id":Ljava/lang/String;
    :cond_3
    const/4 v7, 0x0

    .line 943
    .local v7, "offset":I
    const/16 v2, -0x3c

    .line 944
    .local v2, "delay":I
    const-string/jumbo v8, ""

    .line 945
    .local v8, "prevId":Ljava/lang/String;
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 946
    .local v0, "anims":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/animation/Animator;>;"
    const/4 v4, 0x0

    :goto_3
    iget-object v10, p0, Lcom/vkontakte/android/fragments/PostListFragment$7;->this$0:Lcom/vkontakte/android/fragments/PostListFragment;

    invoke-static {v10}, Lcom/vkontakte/android/fragments/PostListFragment;->access$1100(Lcom/vkontakte/android/fragments/PostListFragment;)Lme/grishka/appkit/views/UsableRecyclerView;

    move-result-object v10

    invoke-virtual {v10}, Lme/grishka/appkit/views/UsableRecyclerView;->getChildCount()I

    move-result v10

    if-ge v4, v10, :cond_6

    .line 947
    iget-object v10, p0, Lcom/vkontakte/android/fragments/PostListFragment$7;->this$0:Lcom/vkontakte/android/fragments/PostListFragment;

    invoke-static {v10}, Lcom/vkontakte/android/fragments/PostListFragment;->access$1200(Lcom/vkontakte/android/fragments/PostListFragment;)Lme/grishka/appkit/views/UsableRecyclerView;

    move-result-object v10

    invoke-virtual {v10, v4}, Lme/grishka/appkit/views/UsableRecyclerView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 948
    .restart local v1    # "c":Landroid/view/View;
    const v10, 0x7f100084

    invoke-virtual {v1, v10}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 949
    .restart local v5    # "id":Ljava/lang/String;
    if-nez v5, :cond_4

    .line 946
    :goto_4
    add-int/lit8 v4, v4, 0x1

    goto :goto_3

    .line 952
    :cond_4
    invoke-virtual {v8, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_5

    .line 953
    const/4 v7, 0x0

    .line 954
    add-int/lit8 v2, v2, 0x3c

    .line 956
    :cond_5
    invoke-virtual {v3, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/Integer;

    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    move-result v10

    div-int/lit8 v10, v10, 0x2

    sub-int/2addr v10, v7

    int-to-float v10, v10

    invoke-virtual {v1, v10}, Landroid/view/View;->setPivotY(F)V

    .line 957
    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    move-result v10

    div-int/lit8 v10, v10, 0x2

    int-to-float v10, v10

    invoke-virtual {v1, v10}, Landroid/view/View;->setPivotX(F)V

    .line 958
    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    move-result v10

    add-int/2addr v7, v10

    .line 959
    move-object v8, v5

    .line 960
    const-string/jumbo v10, "alpha"

    const/4 v11, 0x2

    new-array v11, v11, [F

    fill-array-data v11, :array_0

    invoke-static {v1, v10, v11}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v6

    .line 961
    .local v6, "oa":Landroid/animation/ObjectAnimator;
    int-to-long v10, v2

    invoke-virtual {v6, v10, v11}, Landroid/animation/ObjectAnimator;->setStartDelay(J)V

    .line 962
    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 966
    const-string/jumbo v10, "translationY"

    const/4 v11, 0x2

    new-array v11, v11, [F

    const/4 v12, 0x0

    iget-object v13, p0, Lcom/vkontakte/android/fragments/PostListFragment$7;->this$0:Lcom/vkontakte/android/fragments/PostListFragment;

    invoke-static {v13}, Lcom/vkontakte/android/fragments/PostListFragment;->access$1300(Lcom/vkontakte/android/fragments/PostListFragment;)Lme/grishka/appkit/views/UsableRecyclerView;

    move-result-object v13

    invoke-virtual {v13}, Lme/grishka/appkit/views/UsableRecyclerView;->getHeight()I

    move-result v13

    div-int/lit8 v13, v13, 0x2

    int-to-float v13, v13

    aput v13, v11, v12

    const/4 v12, 0x1

    const/4 v13, 0x0

    aput v13, v11, v12

    invoke-static {v1, v10, v11}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v6

    .line 967
    int-to-long v10, v2

    invoke-virtual {v6, v10, v11}, Landroid/animation/ObjectAnimator;->setStartDelay(J)V

    .line 968
    new-instance v10, Lcom/vkontakte/android/ui/HardwareLayerAnimatorListener;

    invoke-direct {v10}, Lcom/vkontakte/android/ui/HardwareLayerAnimatorListener;-><init>()V

    invoke-virtual {v6, v10}, Landroid/animation/ObjectAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 969
    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 970
    const/4 v10, 0x0

    invoke-virtual {v1, v10}, Landroid/view/View;->setAlpha(F)V

    goto :goto_4

    .line 972
    .end local v1    # "c":Landroid/view/View;
    .end local v5    # "id":Ljava/lang/String;
    .end local v6    # "oa":Landroid/animation/ObjectAnimator;
    :cond_6
    new-instance v9, Landroid/animation/AnimatorSet;

    invoke-direct {v9}, Landroid/animation/AnimatorSet;-><init>()V

    .line 973
    .local v9, "set":Landroid/animation/AnimatorSet;
    invoke-virtual {v9, v0}, Landroid/animation/AnimatorSet;->playTogether(Ljava/util/Collection;)V

    .line 974
    const-wide/16 v10, 0x12c

    invoke-virtual {v9, v10, v11}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 975
    iget-object v10, p0, Lcom/vkontakte/android/fragments/PostListFragment$7;->this$0:Lcom/vkontakte/android/fragments/PostListFragment;

    invoke-static {v10}, Lcom/vkontakte/android/fragments/PostListFragment;->access$1400(Lcom/vkontakte/android/fragments/PostListFragment;)Lcom/vkontakte/android/ui/CubicBezierInterpolator;

    move-result-object v10

    invoke-virtual {v9, v10}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 976
    iget-object v10, p0, Lcom/vkontakte/android/fragments/PostListFragment$7;->this$0:Lcom/vkontakte/android/fragments/PostListFragment;

    invoke-static {v10}, Lcom/vkontakte/android/fragments/PostListFragment;->access$500(Lcom/vkontakte/android/fragments/PostListFragment;)Ljava/util/ArrayList;

    move-result-object v10

    invoke-virtual {v10, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 977
    new-instance v10, Lcom/vkontakte/android/fragments/PostListFragment$7$1;

    invoke-direct {v10, p0, v9}, Lcom/vkontakte/android/fragments/PostListFragment$7$1;-><init>(Lcom/vkontakte/android/fragments/PostListFragment$7;Landroid/animation/AnimatorSet;)V

    invoke-virtual {v9, v10}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 994
    invoke-virtual {v9}, Landroid/animation/AnimatorSet;->start()V

    .line 995
    const/4 v10, 0x1

    goto/16 :goto_0

    .line 960
    nop

    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method
