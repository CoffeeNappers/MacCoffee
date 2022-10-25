.class Lcom/vkontakte/android/fragments/SuggestionsRecommendationsFragment$1;
.super Ljava/lang/Object;
.source "SuggestionsRecommendationsFragment.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/SuggestionsRecommendationsFragment;->loadData()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vkontakte/android/api/Callback",
        "<",
        "Ljava/util/List",
        "<",
        "Lcom/vkontakte/android/UserProfile;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/SuggestionsRecommendationsFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/SuggestionsRecommendationsFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/SuggestionsRecommendationsFragment;

    .prologue
    .line 30
    iput-object p1, p0, Lcom/vkontakte/android/fragments/SuggestionsRecommendationsFragment$1;->this$0:Lcom/vkontakte/android/fragments/SuggestionsRecommendationsFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 3
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 40
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SuggestionsRecommendationsFragment$1;->this$0:Lcom/vkontakte/android/fragments/SuggestionsRecommendationsFragment;

    invoke-virtual {p1}, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->getCode()I

    move-result v1

    iget-object v2, p1, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->message:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/fragments/SuggestionsRecommendationsFragment;->onError(ILjava/lang/String;)V

    .line 41
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 30
    check-cast p1, Ljava/util/List;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/SuggestionsRecommendationsFragment$1;->success(Ljava/util/List;)V

    return-void
.end method

.method public success(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 34
    .local p1, "_users":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/UserProfile;>;"
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SuggestionsRecommendationsFragment$1;->this$0:Lcom/vkontakte/android/fragments/SuggestionsRecommendationsFragment;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/SuggestionsRecommendationsFragment;->users:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 35
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SuggestionsRecommendationsFragment$1;->this$0:Lcom/vkontakte/android/fragments/SuggestionsRecommendationsFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/SuggestionsRecommendationsFragment;->updateList()V

    .line 36
    return-void
.end method
