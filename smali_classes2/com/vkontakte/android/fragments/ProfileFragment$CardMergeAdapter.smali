.class Lcom/vkontakte/android/fragments/ProfileFragment$CardMergeAdapter;
.super Lme/grishka/appkit/utils/MergeRecyclerAdapter;
.source "ProfileFragment.java"

# interfaces
.implements Lcom/vkontakte/android/ui/CardItemDecorator$Provider;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/ProfileFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "CardMergeAdapter"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/ProfileFragment;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/fragments/ProfileFragment;)V
    .locals 0

    .prologue
    .line 3529
    iput-object p1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$CardMergeAdapter;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-direct {p0}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/fragments/ProfileFragment;Lcom/vkontakte/android/fragments/ProfileFragment$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/fragments/ProfileFragment;
    .param p2, "x1"    # Lcom/vkontakte/android/fragments/ProfileFragment$1;

    .prologue
    .line 3529
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/ProfileFragment$CardMergeAdapter;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;)V

    return-void
.end method


# virtual methods
.method public getBlockType(I)I
    .locals 3
    .param p1, "position"    # I

    .prologue
    const/4 v1, 0x1

    .line 3533
    if-nez p1, :cond_1

    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment$CardMergeAdapter;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$000(Lcom/vkontakte/android/fragments/ProfileFragment;)Lcom/vkontakte/android/api/ExtendedUserProfile;

    move-result-object v2

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment$CardMergeAdapter;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$000(Lcom/vkontakte/android/fragments/ProfileFragment;)Lcom/vkontakte/android/api/ExtendedUserProfile;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vkontakte/android/api/ExtendedUserProfile;->hasCover()Z

    move-result v2

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment$CardMergeAdapter;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$5700(Lcom/vkontakte/android/fragments/ProfileFragment;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 3543
    :cond_0
    :goto_0
    return v1

    .line 3536
    :cond_1
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/ProfileFragment$CardMergeAdapter;->getAdapterForPosition(I)Lme/grishka/appkit/views/UsableRecyclerView$Adapter;

    move-result-object v0

    .line 3537
    .local v0, "adapter":Landroid/support/v7/widget/RecyclerView$Adapter;
    instance-of v2, v0, Lcom/vkontakte/android/ui/CardItemDecorator$Provider;

    if-eqz v2, :cond_3

    .line 3538
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment$CardMergeAdapter;->getAdapterCount()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {p0, v2}, Lcom/vkontakte/android/fragments/ProfileFragment$CardMergeAdapter;->getAdapterAt(I)Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v2

    if-ne v0, v2, :cond_2

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/ProfileFragment$CardMergeAdapter;->getAdapterPosition(I)I

    move-result v2

    if-nez v2, :cond_2

    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment$CardMergeAdapter;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$000(Lcom/vkontakte/android/fragments/ProfileFragment;)Lcom/vkontakte/android/api/ExtendedUserProfile;

    move-result-object v2

    if-nez v2, :cond_0

    .line 3541
    :cond_2
    check-cast v0, Lcom/vkontakte/android/ui/CardItemDecorator$Provider;

    .end local v0    # "adapter":Landroid/support/v7/widget/RecyclerView$Adapter;
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/ProfileFragment$CardMergeAdapter;->getAdapterPosition(I)I

    move-result v1

    invoke-interface {v0, v1}, Lcom/vkontakte/android/ui/CardItemDecorator$Provider;->getBlockType(I)I

    move-result v1

    goto :goto_0

    .line 3543
    .restart local v0    # "adapter":Landroid/support/v7/widget/RecyclerView$Adapter;
    :cond_3
    const/4 v1, 0x0

    goto :goto_0
.end method
