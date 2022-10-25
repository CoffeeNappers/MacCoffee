.class Lcom/vkontakte/android/fragments/friends/FriendsFragment$TabAdapter;
.super Lcom/vkontakte/android/ui/FragmentStatePagerAdapter;
.source "FriendsFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/friends/FriendsFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "TabAdapter"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/friends/FriendsFragment;


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/fragments/friends/FriendsFragment;)V
    .locals 1

    .prologue
    .line 749
    iput-object p1, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$TabAdapter;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    .line 750
    invoke-virtual {p1}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->getInnerFragmentManager()Landroid/app/FragmentManager;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/vkontakte/android/ui/FragmentStatePagerAdapter;-><init>(Landroid/app/FragmentManager;)V

    .line 751
    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 1

    .prologue
    .line 761
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$TabAdapter;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->access$2700(Lcom/vkontakte/android/fragments/friends/FriendsFragment;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public getItem(I)Landroid/app/Fragment;
    .locals 1
    .param p1, "i"    # I

    .prologue
    .line 755
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/friends/FriendsFragment$TabAdapter;->removeSavedState(I)V

    .line 756
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$TabAdapter;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->access$2700(Lcom/vkontakte/android/fragments/friends/FriendsFragment;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Fragment;

    return-object v0
.end method

.method public getItemPosition(Ljava/lang/Object;)I
    .locals 2
    .param p1, "object"    # Ljava/lang/Object;

    .prologue
    .line 766
    iget-object v1, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$TabAdapter;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->access$2700(Lcom/vkontakte/android/fragments/friends/FriendsFragment;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v0

    .line 767
    .local v0, "pos":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 768
    const/4 v0, -0x2

    .line 770
    .end local v0    # "pos":I
    :cond_0
    return v0
.end method

.method public getPageTitle(I)Ljava/lang/CharSequence;
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 776
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$TabAdapter;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/friends/FriendsFragment;->access$2800(Lcom/vkontakte/android/fragments/friends/FriendsFragment;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/CharSequence;

    return-object v0
.end method
