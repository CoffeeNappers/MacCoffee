.class Lcom/vkontakte/android/fragments/ProfileFragment$5;
.super Landroid/support/v7/widget/RecyclerView$ItemDecoration;
.source "ProfileFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/ProfileFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/ProfileFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/ProfileFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/ProfileFragment;

    .prologue
    .line 461
    iput-object p1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$5;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$ItemDecoration;-><init>()V

    return-void
.end method


# virtual methods
.method public getItemOffsets(Landroid/graphics/Rect;Landroid/view/View;Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$State;)V
    .locals 5
    .param p1, "outRect"    # Landroid/graphics/Rect;
    .param p2, "view"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/support/v7/widget/RecyclerView;
    .param p4, "state"    # Landroid/support/v7/widget/RecyclerView$State;

    .prologue
    const/4 v4, 0x1

    const/high16 v3, 0x41000000    # 8.0f

    .line 464
    invoke-virtual {p3, p2}, Landroid/support/v7/widget/RecyclerView;->getChildLayoutPosition(Landroid/view/View;)I

    move-result v0

    .line 465
    .local v0, "pos":I
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$5;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$1500(Lcom/vkontakte/android/fragments/ProfileFragment;)Lcom/vkontakte/android/fragments/ProfileFragment$ProfileInfoAdapter;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/ProfileFragment$ProfileInfoAdapter;->getItemCount()I

    move-result v1

    if-ge v0, v1, :cond_6

    .line 466
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$5;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$1600(Lcom/vkontakte/android/fragments/ProfileFragment;)I

    move-result v1

    if-ne v1, v4, :cond_1

    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$5;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$1700(Lcom/vkontakte/android/fragments/ProfileFragment;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    instance-of v1, v1, Lcom/vkontakte/android/fragments/ProfileFragment$OverviewInfoItem;

    if-eqz v1, :cond_1

    if-eq v0, v4, :cond_0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_1

    .line 467
    :cond_0
    invoke-static {v3}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v1

    iput v1, p1, Landroid/graphics/Rect;->top:I

    .line 469
    :cond_1
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$5;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$1600(Lcom/vkontakte/android/fragments/ProfileFragment;)I

    move-result v1

    if-nez v1, :cond_2

    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$5;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$100(Lcom/vkontakte/android/fragments/ProfileFragment;)I

    move-result v1

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v2

    if-ne v1, v2, :cond_2

    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$5;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$1700(Lcom/vkontakte/android/fragments/ProfileFragment;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    instance-of v1, v1, Lcom/vkontakte/android/fragments/ProfileFragment$OverviewInfoItem;

    if-eqz v1, :cond_2

    if-ne v0, v4, :cond_2

    .line 470
    invoke-static {v3}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v1

    iput v1, p1, Landroid/graphics/Rect;->top:I

    .line 472
    :cond_2
    invoke-virtual {p2}, Landroid/view/View;->getId()I

    move-result v1

    const v2, 0x7f1004ff

    if-eq v1, v2, :cond_3

    invoke-virtual {p2}, Landroid/view/View;->getId()I

    move-result v1

    const v2, 0x7f10007a

    if-eq v1, v2, :cond_3

    invoke-virtual {p2}, Landroid/view/View;->getId()I

    move-result v1

    const v2, 0x7f100078

    if-eq v1, v2, :cond_3

    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$5;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$000(Lcom/vkontakte/android/fragments/ProfileFragment;)Lcom/vkontakte/android/api/ExtendedUserProfile;

    move-result-object v1

    iget-object v1, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->ban:Lcom/vkontakte/android/api/ExtendedUserProfile$BanInfo;

    if-eqz v1, :cond_4

    :cond_3
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$5;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$1700(Lcom/vkontakte/android/fragments/ProfileFragment;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/fragments/ProfileFragment$InfoItem;

    iget v1, v1, Lcom/vkontakte/android/fragments/ProfileFragment$InfoItem;->backgroundType:I

    const/4 v2, 0x4

    if-eq v1, v2, :cond_5

    :cond_4
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$5;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    .line 473
    invoke-static {v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$1700(Lcom/vkontakte/android/fragments/ProfileFragment;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    instance-of v1, v1, Lcom/vkontakte/android/fragments/ProfileFragment$BoardTopicInfoItem;

    if-nez v1, :cond_5

    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$5;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    .line 474
    invoke-static {v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$1700(Lcom/vkontakte/android/fragments/ProfileFragment;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    instance-of v1, v1, Lcom/vkontakte/android/fragments/ProfileFragment$AudioInfoItem;

    if-eqz v1, :cond_6

    .line 475
    :cond_5
    invoke-static {v3}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v1

    iput v1, p1, Landroid/graphics/Rect;->bottom:I

    .line 478
    :cond_6
    return-void
.end method
