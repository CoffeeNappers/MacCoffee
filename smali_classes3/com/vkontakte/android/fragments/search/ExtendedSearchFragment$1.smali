.class Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$1;
.super Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;
.source "ExtendedSearchFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->createAdapter()Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/fragments/base/SegmenterFragment",
        "<",
        "Lcom/vkontakte/android/api/users/UsersSearch$SearchProfile;",
        ">.GridAdapter<",
        "Lcom/vkontakte/android/api/users/UsersSearch$SearchProfile;",
        "Lcom/vkontakte/android/ui/holder/UserHolder",
        "<",
        "Lcom/vkontakte/android/api/users/UsersSearch$SearchProfile;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;

    .prologue
    .line 137
    iput-object p1, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$1;->this$0:Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;

    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;-><init>(Lcom/vkontakte/android/fragments/base/SegmenterFragment;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic createViewHolder(Landroid/view/ViewGroup;)Lcom/vkontakte/android/ui/holder/RecyclerHolder;
    .locals 1

    .prologue
    .line 137
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$1;->createViewHolder(Landroid/view/ViewGroup;)Lcom/vkontakte/android/ui/holder/UserHolder;

    move-result-object v0

    return-object v0
.end method

.method public createViewHolder(Landroid/view/ViewGroup;)Lcom/vkontakte/android/ui/holder/UserHolder;
    .locals 2
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/ViewGroup;",
            ")",
            "Lcom/vkontakte/android/ui/holder/UserHolder",
            "<",
            "Lcom/vkontakte/android/api/users/UsersSearch$SearchProfile;",
            ">;"
        }
    .end annotation

    .prologue
    .line 140
    new-instance v0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$Holder;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$1;->this$0:Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;

    invoke-direct {v0, v1, p1}, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$Holder;-><init>(Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;Landroid/view/ViewGroup;)V

    iget-object v1, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$1;->this$0:Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$Holder;->onClick(Lcom/vkontakte/android/functions/VoidF1;)Lcom/vkontakte/android/ui/holder/UserHolder;

    move-result-object v0

    return-object v0
.end method

.method public getImageUrl(II)Ljava/lang/String;
    .locals 1
    .param p1, "position"    # I
    .param p2, "image"    # I

    .prologue
    .line 150
    iget-object v0, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$1;->this$0:Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->getSegmenter()Lcom/vkontakte/android/ui/util/Segmenter;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/vkontakte/android/ui/util/Segmenter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/UserProfile;

    iget-object v0, v0, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    return-object v0
.end method

.method public getImagesCountForItem(I)I
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 145
    const/4 v0, 0x1

    return v0
.end method
