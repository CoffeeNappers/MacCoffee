.class Lcom/vkontakte/android/fragments/NewsSearchFragment$6;
.super Lcom/vkontakte/android/api/SimpleCallback;
.source "NewsSearchFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/NewsSearchFragment;->doLoadData(II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/SimpleCallback",
        "<",
        "Lcom/vkontakte/android/api/newsfeed/NewsfeedSearch$List",
        "<",
        "Lcom/vkontakte/android/NewsEntry;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/NewsSearchFragment;

.field final synthetic val$query:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/NewsSearchFragment;Landroid/app/Fragment;Ljava/lang/String;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/NewsSearchFragment;
    .param p2, "fragment"    # Landroid/app/Fragment;

    .prologue
    .line 208
    iput-object p1, p0, Lcom/vkontakte/android/fragments/NewsSearchFragment$6;->this$0:Lcom/vkontakte/android/fragments/NewsSearchFragment;

    iput-object p3, p0, Lcom/vkontakte/android/fragments/NewsSearchFragment$6;->val$query:Ljava/lang/String;

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/SimpleCallback;-><init>(Landroid/app/Fragment;)V

    return-void
.end method


# virtual methods
.method public success(Lcom/vkontakte/android/api/newsfeed/NewsfeedSearch$List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vkontakte/android/api/newsfeed/NewsfeedSearch$List",
            "<",
            "Lcom/vkontakte/android/NewsEntry;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 211
    .local p1, "news":Lcom/vkontakte/android/api/newsfeed/NewsfeedSearch$List;, "Lcom/vkontakte/android/api/newsfeed/NewsfeedSearch$List<Lcom/vkontakte/android/NewsEntry;>;"
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsSearchFragment$6;->val$query:Ljava/lang/String;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/NewsSearchFragment$6;->this$0:Lcom/vkontakte/android/fragments/NewsSearchFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/NewsSearchFragment;->access$400(Lcom/vkontakte/android/fragments/NewsSearchFragment;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 218
    :goto_0
    return-void

    .line 214
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsSearchFragment$6;->this$0:Lcom/vkontakte/android/fragments/NewsSearchFragment;

    invoke-virtual {p1}, Lcom/vkontakte/android/api/newsfeed/NewsfeedSearch$List;->from()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/NewsSearchFragment;->access$602(Lcom/vkontakte/android/fragments/NewsSearchFragment;Ljava/lang/String;)Ljava/lang/String;

    .line 217
    iget-object v1, p0, Lcom/vkontakte/android/fragments/NewsSearchFragment$6;->this$0:Lcom/vkontakte/android/fragments/NewsSearchFragment;

    invoke-virtual {p1}, Lcom/vkontakte/android/api/newsfeed/NewsfeedSearch$List;->size()I

    move-result v0

    if-lez v0, :cond_1

    const/4 v0, 0x1

    :goto_1
    invoke-virtual {v1, p1, v0}, Lcom/vkontakte/android/fragments/NewsSearchFragment;->onDataLoaded(Ljava/util/List;Z)V

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    goto :goto_1
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 208
    check-cast p1, Lcom/vkontakte/android/api/newsfeed/NewsfeedSearch$List;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/NewsSearchFragment$6;->success(Lcom/vkontakte/android/api/newsfeed/NewsfeedSearch$List;)V

    return-void
.end method
