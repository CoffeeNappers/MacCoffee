.class Lcom/vkontakte/android/fragments/SuggestionsFriendsFragment$ImportTypesImageAdapter;
.super Ljava/lang/Object;
.source "SuggestionsFriendsFragment.java"

# interfaces
.implements Lme/grishka/appkit/preloading/PrefetchInfoProvider;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/SuggestionsFriendsFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ImportTypesImageAdapter"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/SuggestionsFriendsFragment;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/fragments/SuggestionsFriendsFragment;)V
    .locals 0

    .prologue
    .line 889
    iput-object p1, p0, Lcom/vkontakte/android/fragments/SuggestionsFriendsFragment$ImportTypesImageAdapter;->this$0:Lcom/vkontakte/android/fragments/SuggestionsFriendsFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getImageCountForItem(I)I
    .locals 1
    .param p1, "item"    # I

    .prologue
    .line 898
    const/4 v0, 0x0

    return v0
.end method

.method public getImageURL(II)Ljava/lang/String;
    .locals 1
    .param p1, "item"    # I
    .param p2, "image"    # I

    .prologue
    .line 904
    const/4 v0, 0x0

    return-object v0
.end method

.method public getItemCount()I
    .locals 1

    .prologue
    .line 892
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SuggestionsFriendsFragment$ImportTypesImageAdapter;->this$0:Lcom/vkontakte/android/fragments/SuggestionsFriendsFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/SuggestionsFriendsFragment;->access$1300(Lcom/vkontakte/android/fragments/SuggestionsFriendsFragment;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method
